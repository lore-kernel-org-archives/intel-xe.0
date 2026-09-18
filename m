Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F6C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F47B10E00B;
	Fri, 18 Sep 2026 00:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nJIlWjKV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5A10E00B
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 00:07:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D8B89601EF;
 Fri, 18 Sep 2026 00:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFBB1F00893;
 Fri, 18 Sep 2026 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789690037;
 bh=YdHIE9CaLuQ5zsgDD1hn9TntEWP2X7Ih6lSWxBP/eOM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nJIlWjKVLnn/GNQ4/keo6buAUS7luNWUtchNHy9nLicJEDrF6oH26M3nTKBHTliaT
 nXXQ7cZY58KkaDb7DMlrTjtlckV8052h2FAp6NeSKd0YjFAnfFYK72mTDRcK0NAfoL
 uPEH0bJCaWdE09e/DfWDVHLYJdTCP4DAkW8z4nmRebisO2VEINMwjdODNjbUtOrsIO
 JJw8weB5wpt7EFM2r+9J3Z3E1Pj2cgfzaZXW+MI7kDAL7gsc+xIhDxMUDiTf5FblJB
 HGC8qv+qepG1eNdVgIyKIq9pLJVYOYIXi/A/pdNmUZDmmtRrOxd9YBxmFR0xK4eT5K
 CFJcXcadsClrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] drm/xe/uc: Report DMA failure using SIGID
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917235923.1521112-14-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
 <20260917235923.1521112-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:07:16 +0000
Message-Id: <20260918000717.6DFBB1F00893@smtp.kernel.org>
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
- [Medium] xe: missing conversion of DMA failure message to xe_log_err() in=
 uc_fw_xfer()
--

commit 519565d5579d72f99be56f54099a18eadbbceb69
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/xe/uc: Report DMA failure using SIGID

Convert the uC DMA failure error to use the xe_log_err() helper.

> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a8e6f18cc9b4a..21e2c1be08842 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
[ ... ]
> @@ -927,9 +932,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offs=
et, u32 dma_flags)
>  	return 0;
> =20
>  fail:
> -	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
> -		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -		err);
> +	if (uc_fw->type =3D=3D XE_UC_FW_TYPE_GUC)
> +		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
> +	else
> +		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);
> +

[Severity: Medium]
Does this commit match its description? The commit message explicitly claims
to "Convert the uC DMA failure error to use the xe_log_err() helper."

While it did convert the generic firmware load failure message here in
xe_uc_fw_upload(), it entirely missed the actual DMA-specific error message
in uc_fw_xfer():

	if (ret)
		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=3D%u\n",
			xe_uc_fw_type_repr(uc_fw->type), dma_ctrl);

If the uC firmware DMA transfer fails (e.g., timeout in xe_mmio_wait32), the
error is still logged using the old drm_err() format without the intended
SIGID logging.

>  	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
>  	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917235923.1521=
112-9-umesh.nerlige.ramappa@intel.com?part=3D5
