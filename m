Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A11C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3810E07B;
	Mon, 28 Sep 2026 09:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YTZ3wJOb";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3810E07B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:33:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F0F360052;
 Mon, 28 Sep 2026 09:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5E51F000FF;
 Mon, 28 Sep 2026 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790587996;
 bh=1HwVNIVXaAwedYwV3fn+dragINBOwcUg8B/9uaII9gU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YTZ3wJObDPfUKOfIlXen3ZaDnkAAPWGfwZkEZCzC1lK0JsVfTijaj23H/3yF1gaJe
 dERd6pPpZF2G3SkSEhscYQI771P6aSxEPzt4dRIE4TUQQbiQTo+pOQnMgYlGv9qQLq
 vEiXMJ+3kiVq8XV2X1HJLAsesBBkmt1y2M+oJvjv/HMZIgz44+aRh5Nsi6apn1sdVN
 pH0g64fYhaxCj9yTJdqqrN/mZg6ILmUSyCMpjCYRizBjiruAIw+uLIDedIMmjTzBqX
 57a56NOmgsRVDv/o0Byi0x4oy/moshJbpzs3MqEhy8aQXut+j0cdlKMQK0bNqPDJ7f
 t8moHmwU3Jm8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] drm/xe/vram: Report VRAM errors using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:33:15 +0000
Message-Id: <20260928093315.DF5E51F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: incomplete migration from drm_info() to xe_log_info()
--

commit 5e1a407ddc677420600cd04965b5a5fb8be4de13
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/vram: Report VRAM errors using structured xe_log API

This commit replaces drm_err() and drm_info() with structured
xe_log_err_fatal() and xe_log_info() APIs using the VRAM component tag.
The log locations for the "no CPU visible VRAM" error are also updated
to depend on the caller context.

> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index fa06c7ae56b1c..6c8558042ad4b 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c

[ ... ]

> @@ -320,7 +327,7 @@ int xe_vram_probe(struct xe_device *xe)
>  	err =3D determine_lmem_bar_size(xe, &lmem_bar);
>  	if (err)
>  		return err;
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lme=
m_bar.io_size);
> +	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &=
lmem_bar.io_size);

[Severity: Medium]
The commit message states that drm_info() is replaced with xe_log_info() us=
ing
the VRAM component tag. Are there some unmodified drm_info() occurrences le=
ft
in the file that result in an incomplete refactoring?

For example, print_vram_region_info() still uses drm_info():

drivers/gpu/drm/xe/xe_vram.c:print_vram_region_info() {
    ...
	drm_info(drm,
		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU=
 accessible size %pa\n",
		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_siz=
e);
    ...
}

Similarly, get_flat_ccs_offset() retains drm_info() without the component t=
ag:

drivers/gpu/drm/xe/xe_vram.c:get_flat_ccs_offset() {
    ...
		drm_info(&xe->drm, "FLAT_CCS base:%llx, aligned:%s\n", offset,
			 str_yes_no(IS_ALIGNED(offset, SZ_128K)));
    ...
}

Should these instances also be converted to xe_log_info() to ensure a
consistent logging format during driver initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928092114.1610=
203-1-dnyaneshwar.bhadane@intel.com?part=3D12
