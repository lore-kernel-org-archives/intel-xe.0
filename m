Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F779CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A469112059;
	Fri,  9 Oct 2026 10:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IqKbcPuQ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04761112059
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:43:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C0583429F4;
 Fri,  9 Oct 2026 10:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA751F000FF;
 Fri,  9 Oct 2026 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791542597;
 bh=+iyUSneQE3BlV+RxrAk4Kb1IisOtCCiSdXb5E6xuqw0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IqKbcPuQ3qbjp+NtktoTeiu88fgr2VxVOP1IhSc/p8+b2mVnueR6EQjAOa7UbK0wg
 +Amw8wPiM84b6IlfD5fDZPq0zubTHpXK/xAi4Og0SqXE+2oXzqZfp57JRkU0NAgmgh
 /PDLNJg+KY0bTPAIXGeHTFlx7FRju7p5dImdCxzbPYN+TNnKzcVBCvRQGLZeYPyoPz
 RVPHk/Q9UzOTX/01rAcypqNGaoqNTdlsl9pNVLykAN9aw/cyRe82E/T94ocuYCt6IF
 Y3GLarxd805Mz0zXjgVtgP06vI8lipGuOPLONwxqRGsMJ9ElA9uOLdxp7r6iDZRzCy
 ZJmgo7OBh5NDw==
Message-ID: <sashiko-outbox-165258@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] drm/xe/cper: Add CPER reporting entry point
 for xe_log
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-15-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-15-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:43:17 +0000
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
- [Medium] drm/xe: Silent telemetry loss when hardware SIGIDs lack exact RA=
S data payload
--

commit a8ad6417f3a91a193b5e9bf972e9a0e60ff46e5a
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Add CPER reporting entry point for xe_log

Introduce xe_cper_emit() as the single entry point for emitting
CPER records from xe_log. Hardware SIGIDs are routed to a hardware
error helper, and software SIGIDs are left as TODO.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 0000000000000..c5caa0e8f496a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> +void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigi=
d,
> +		  u32 component, u32 location, const void *data, size_t len,
> +		  struct va_format *vaf)
> +{
> +	if (!xe)
> +		return;
> +
> +	if (is_hw_sigid(sigid)) {
> +		if (!IS_ERR_OR_NULL(data) && len =3D=3D sizeof(struct xe_ras_error_cla=
ss))
> +			xe_cper_emit_hw_err(xe, cper_sev, sigid, data);
> +		return;

[Severity: Medium]
If a hardware SIGID log entry is missing the expected RAS data payload (e.g=
.,
the data pointer is ERR_PTR, NULL, or the length is unexpected), does this
unconditionally return and drop the telemetry?

Since there is no fallback to emit a software CPER log or print a warning,
it looks like this could result in a silent loss of hardware error data.

> +	}
> +
> +	/* TODO software CPER */
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D1
