Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E15CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26DE10E030;
	Fri, 16 Oct 2026 07:44:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24F10E030
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:44:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E9BCE43C55;
 Fri, 16 Oct 2026 07:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB9F1F000C4;
 Fri, 16 Oct 2026 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792136655;
 bh=MREKQD46cUHkgCuTfENGVp88vzQvg5bZ2aOC92B7uVM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WES98+wFCnSY+LyGL9gW012VO1YVQIwZx/UPCMsfzLtDnG9Kxm/WQgxQTF2XAVeGL
 PyX7PsFRw7RvqpnJHqQQ+sHUZHuU2zhvUSPr3WxZ1v8YuyT9PfuVjGwd4nvdBMGzPT
 ibIvaPfSIVJ9zMiDwg1CelUm6U2VgIQl7e74NvE6Zr1QnHcbgXVLr7bJgF/fJBDsKp
 vOcZmyfDs1v4f4T1xKgPcYPijdAHVu7kGMkTpT5MUPpy3PsXAYMI9uZAtoLNsuyPLZ
 qVknPQdWCmzYRVysZpT4V5TCsRjR/xiwxOhcSJbDj335vFf2U7vsQ7ANW91JqC7XKW
 PnkmSCKlRkcFw==
Message-ID: <sashiko-outbox-173958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/9] drm/xe/pci_error: Flush GT wedge worker before
 bus reset
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-7-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:44:15 +0000
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
- [High] drm/xe: flush_work() in PCI error recovery triggers MMIO on suspen=
ded device
--

commit a372afc80ddd4997ba73485e586ca48280dbd14b
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/pci_error: Flush GT wedge worker before bus reset
   =20
This commit flushes the GT wedge worker synchronously to avoid side
effects during PCI bus reset.

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
> +		flush_work(&gt->wedge.worker);

[Severity: High]
Does flushing the wedge worker here trigger unauthorized MMIO accesses on
a suspended device?

If the device is runtime suspended (D3hot), prepare_device_for_reset()
takes a PM reference earlier in the function via xe_pm_runtime_get_noresume=
()
which does not wake up the device.

By synchronously flushing the wedge worker here, it executes in this suspen=
ded
context. The worker unconditionally calls xe_device_assert_mem_access() (wh=
ich
fails because the device is suspended) and proceeds to perform MMIO accesses
such as xe_guc_softreset().

Accessing MMIO on a D3hot device can cause PCI master aborts, NMI system
crashes, or hardware hangs.

> +	}
> =20
>  	pci_disable_device(pdev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D6
