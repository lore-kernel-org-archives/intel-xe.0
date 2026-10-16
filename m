Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B8DCC6B2D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E79810E3F9;
	Fri, 16 Oct 2026 03:33:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2203810E3F9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:33:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9926F600D4;
 Fri, 16 Oct 2026 03:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263D51F000C4;
 Fri, 16 Oct 2026 03:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792121616;
 bh=3Vn7IcoqNwqobVCgwMsvE+JeQCeRtUGVXB4qAaO38L4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=leFc/t4JeAW3ocr4/SJ0d/NdKN54x+cjanpYuHbE4VaorKWvmQRcPgugdnOpXPwmd
 +hBWAIQAMqVHu8AXJ/qH60/VAWX/JsdkIsFPWJTZ6S3coRyQUNm0xVhMlUAHhA7jcP
 yhwKikmeR3SfSQPaX61e7M10W1dtjpPcdyFFza8UJJGqjEppxG/RbGwFtqua/5dfAv
 C6RbBeLZ/bjaB59O61iHWrl7gUobOuegjThxWlOG18CpPBIGW/2D/2UV7gekbZl6rY
 GeSSirvut+07MdngbvpbuJ12YOGodBxz/PmiuGdfEkB/d61jyH1EyVU7vDb1cgrrB1
 xK/vcyg8GW9QQ==
Message-ID: <sashiko-outbox-173675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/7] drm/xe/pci_error: Flush GT wedge worker before
 bus reset
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016031559.427941-6-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
 <20261016031559.427941-6-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:33:35 +0000
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
- [High] drm/xe: panic in prepare_device_for_reset() on uninitialized work_=
struct
- [Medium] drm/xe: assertion failures in wedge path on PCI error
--

commit 8e840959ff8a982016205caa862c674505ecb9c2
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci_error: Flush GT wedge worker before bus reset

With GT wedging now done async, this commit makes sure the wedge worker
is flushed to avoid side-effects during PCI bus reset.

> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pc=
i_error.c
> index e1b9dc5f0a6dc..a5c8fd67738cf 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *p=
dev)
> =20
>  	xe_device_set_in_reset(xe);
> =20
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
>  		xe_gt_declare_wedged(gt);

[Severity: Medium]
Will this trigger an assertion failure if a PCI error occurs when the device
is configured with wedged_mode=3D0?

If the user configures wedged_mode=3D0 (which resolves to XE_WEDGED_MODE_NE=
VER),
the device correctly skips GPU-hang wedging. However, when a PCI error forc=
es
a bus reset, prepare_device_for_reset() unconditionally calls
xe_gt_declare_wedged() without checking the mode.

Looking at xe_gt_declare_wedged() and downstream functions like
xe_uc_declare_wedged() and xe_guc_declare_wedged(), they all contain assert=
ions
checking wedged.mode:

void xe_gt_declare_wedged(struct xe_gt *gt)
{
	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
...

This will cause a cascade of kernel warnings if a PCI error is detected on a
device with wedged_mode=3D0.

> +		flush_work(&gt->wedge.worker);

[Severity: High]
Could this cause a panic by operating on a zero-initialized work_struct dur=
ing
early probe?

If a hardware error (AER) is detected during device probe,
prepare_device_for_reset() can be called after xe_info_init() allocates the=
 GT
structures but before xe_device_probe() calls xe_gt_init_early() to initial=
ize
the wedge.worker.

Since for_each_gt() iterates over all allocated GTs rather than just the
initialized ones, flush_work() could be called on an uninitialized work_str=
uct,
leading to a kernel oops or a WARN splat in __flush_work().

> +	}
> =20
>  	pci_disable_device(pdev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016031559.4279=
41-1-raag.jadav@intel.com?part=3D5
