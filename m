Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A752ECA600C
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 15:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4156810F4D8;
	Thu,  8 Oct 2026 15:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GFa2U4fl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007710F4D8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 15:52:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DD3CE4344D;
 Thu,  8 Oct 2026 15:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A233B1F000FF;
 Thu,  8 Oct 2026 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791474732;
 bh=3kUEhEqQW6Y/HlsfH/ZA+z+QSavhIV6vM5tNLItWeCQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=GFa2U4flNjveh+aHfpYA6mt169blHZYeaWYgXnHorVgbhK9SFeV2RrAmNFZboesu4
 lW8pwF5ZYe6dD3hKNPUKAy8vtpglQLOfNygnPksimYu5Ele+XqSZeE7oAGjsgpTsrl
 XeQg37toOkmAUsB/hXcYivusGmCc5oU9vO0RtXzSwfKmngT04zDn6y7yoSBY/KAIfk
 SIWCHvoQLVs7CuLMTWewSFNBDTrQvNaHRxynB7Stk3nveYkUpuN+q43MCX9BodInvA
 YTFZpIK2aOHnbJEycMJ7GY0MG21Xx9d0n6ILSGrdgYqtuhqcy84wFYBGnHfnc0BnuV
 N4IpsUdevdMkg==
Message-ID: <sashiko-outbox-164360@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261008153425.607925-4-satyanarayana.k.v.p@intel.com>
References: <20261008153425.607925-3-satyanarayana.k.v.p@intel.com>
 <20261008153425.607925-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 15:52:12 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe: TOCTOU NULL pointer dereference in DRM scheduler timeout h=
andler during engine teardown
--

commit bc1cf6d3127f6708d4287d0a751daf2ee1c80dc6
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

This commit clears the engine name during teardown to ensure that subsequent
hardware engine scans skip the invalidated engine. This prevents a NULL poi=
nter
dereference in the VF memory IRQ handler when accessing torn-down engines.

> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
[ ... ]
> @@ -275,6 +275,12 @@ static const struct engine_info engine_infos[] =3D {
>  static void hw_engine_fini(void *arg)
>  {
>  	struct xe_hw_engine *hwe =3D arg;
> +	struct xe_device *xe =3D gt_to_xe(hwe->gt);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xe->irq.lock, flags);
> +	hwe->name =3D NULL;
> +	spin_unlock_irqrestore(&xe->irq.lock, flags);
> =20
>  	if (hwe->exl_port)
>  		xe_execlist_port_destroy(hwe->exl_port);

[Severity: High]
While the new lock protects the IRQ handler, can a lockless reader like the=
 DRM
scheduler timeout handler still encounter a time-of-check to time-of-use ra=
ce?

If the timeout handler fires after a device unplug, it locklessly iterates =
over
the engines:

drivers/gpu/drm/xe/xe_gt.c:xe_gt_hw_engine() {
    ...
    for_each_hw_engine(hwe, gt, id)
        if (hwe->class =3D=3D class && ...
    ...
}

The for_each_hw_engine iteration evaluates xe_hw_engine_is_valid, which che=
cks
hwe->name. If this lockless check occurs right before hw_engine_fini clears
hwe->name, the timeout handler will proceed with the engine pointer.

Later in hw_engine_fini, hwe->gt is set to NULL. The timeout handler could
then dereference the null pointer when it calls into the LRC code:

drivers/gpu/drm/xe/xe_lrc.c:xe_lrc_get_multi_queue_active_queue_id() {
    ...
    u32 val =3D xe_mmio_read32(&hwe->gt->mmio,
                             RING_CSMQDEBUG(hwe->mmio_base));
    ...
}

Does the lockless reader need additional synchronization to ensure hwe->gt
is safely accessed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008153425.6079=
25-3-satyanarayana.k.v.p@intel.com?part=3D1
