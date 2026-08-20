Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FBC5DF86
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950F010E246;
	Thu, 20 Aug 2026 20:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Imya/5wy";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9AB10E246
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:20:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D59B560A58;
 Thu, 20 Aug 2026 20:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640A21F000E9;
 Thu, 20 Aug 2026 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787257252;
 bh=X70w+trSMd3y7vSeuXCeaHWJ12h7temkAmOuEiCOQGI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Imya/5wyoRFlmRhe1Mif698FXaxo3zn2rykEDv8RdtwPmfU0mnT62uqgSXSpRvyzV
 IcNc6/AIW6Gq44qtPukklJHW6vXf1gWVSk+qgc5eKviz71L439PFkgjTr2qvFqQpQ7
 WnVWdb4013AokNWi81r6nLoZifXkcmGuxjcMyJLTodx3gg12dHvF+tezILsRuLBxD+
 oI1SwCWFGG/FDHMFyor9jZTYBw0P7I1haxrKfe/J39UAnHVEd6wZ1PnHywFcC67SbD
 zU6jQMDGAnBX2FUmqvCJm3ZbBC0M9oTI92xjM8zp/qscvoFt0NBWPE/GgqYD0KeTFn
 nuirye42892Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] drm/xe: Move debug configfs entries to
 xe_configfs_debug.c
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820200719.84681-17-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
 <20260820200719.84681-17-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 20:20:52 +0000
Message-Id: <20260820202052.640A21F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free during context restore batch buffer extraction.
- [High] Buffer over-read in `parse_wa_bb_lines` when parsing configuration=
 strings that do not end with a trailing newline or space.
--

--- Patch [5]: [PATCH 05/10] drm/xe: Move debug configfs entries to xe_conf=
igfs_debug.c ---
commit 4db52fe672f5f434404033340d5405ac8d0e0318
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Move debug configfs entries to xe_configfs_debug.c

Move the debug specific configfs attributes into the new xe_configfs_debug.c
file under a new debug configfs subdirectory. Ensure these are wrapped in
CONFIG_DRM_XE_DEBUG to allow finer grained debug changes outside of more
ABI specific configfs entries.

> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/=
xe_configfs_debug.c
> index 45617282cec54..b2667573efbed 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.c
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> @@ -282,6 +282,23 @@ static struct xe_config_group_device *find_device(st=
ruct pci_dev *pdev)
>  	return xe_configfs_find_group_device(pdev);
>  }
> =20
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
> +				       const u32 **cs)
> +{
> +	struct xe_config_group_device *dev =3D find_device(pdev);
> +	u32 len;
> +
> +	if (!dev)
> +		return 0;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs =3D dev->config.debug.ctx_restore_mid_bb[class].cs;
> +
> +		len =3D dev->config.debug.ctx_restore_mid_bb[class].len;
> +	}
> +	config_group_put(&dev->group);
> +
> +	return len;
> +}

[Severity: High]
This is a pre-existing issue, but does dropping the config group reference
here expose the returned *cs pointer to a use-after-free?

If a concurrent rmdir on the device's configfs directory drops the last=20
reference, xe_config_device_release() will free the batch buffer memory.
Since the caller (setup_configfs_mid_ctx_restore_bb() in xe_lrc.c) uses=20
this pointer after the function returns, it might perform a memcpy() on=20
freed memory.

[ ... ]

> +static ssize_t parse_wa_bb_lines(const char *lines,
> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
> +{
> +	ssize_t dwords =3D 0, ret;
> +	const char *p;
> +
> +	for (p =3D lines; *p; p++) {

[Severity: High]
This isn't a bug introduced by this patch, but can this loop update read ou=
t=20
of bounds?=20

If the inner parsing logic (like parse_hex()) advances p exactly to the=20
null terminator (for example, when the input string doesn't end with a=20
newline or space), the unconditional p++ increments the pointer past \0.
The loop condition *p on the next iteration would then evaluate=20
out-of-bounds memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820200719.8468=
1-12-stuart.summers@intel.com?part=3D5
