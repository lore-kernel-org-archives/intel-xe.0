Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A0FC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408D610F13A;
	Wed, 12 Aug 2026 22:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CfQ+oxRY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607AB10E44B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:35:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4902340B29;
 Wed, 12 Aug 2026 19:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025B51F000E9;
 Wed, 12 Aug 2026 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786563328;
 bh=x6IGBbIUvWtQwnk3iKJX36AQ5UDeGdBb6DM77dyjoII=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CfQ+oxRYfFsUVgKrkuG1+1pY3Yo9Pm0LPyre+DsaZdEUiw5maqb7XhldIBvILKg32
 iMwmYqunnfjECd/Nhia/Pev14CN1ZuPCXj6nCPKnTf+y59n/v4rTKUOBaakqEZ3mRb
 2BLszBL4ak/2H9NQimPRSoBuhX45EszoenYaWOd6N7bEXrb3pqAFoE8W5LRaJkyVWX
 CJBiy2LLOIVb6CTYYIdBmef4Bl2yHaMlYVyZlTzKE8du2xJuRmNx/oNNgVOmGJ69H3
 2O8GtLp5eubCOgKNGzVu8w7IUD5vaZaji2AICKMBkrL2iQyukRb9Znq8AXZW4ki5lO
 qWrJ+iolp/kOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk messages
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812191450.11690-12-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:35:27 +0000
Message-Id: <20260812193528.025B51F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [Medium] The generic format string injected into the printk index does no=
t structurally match the actual strings emitted to dmesg, breaking userspac=
e log matching.
--

--- Patch [11]: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk message=
s ---
commit f6d6ae64e4098e49206f6df0c6d973a867e46f50
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/log: Index all SIGID printk messages

This commit explicitly generates printk index entries using
dev_printk_index_emit() for xe_log_emit() messages. This ensures that
device level printk messages generated with varying prefixes are correctly
indexed for audit.

> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 0928b08666171..53fe2bb7ddd37 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -16,9 +16,17 @@
>  struct pci_dev;
> =20
>  __printf(8, 9)
> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> -		 u32 component, u32 location, const void *data, size_t len,
> -		 const char *fmt, ...);
> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig=
id,
> +		   u32 component, u32 location, const void *data, size_t len,
> +		   const char *fmt, ...);
> +
> +#define __xe_log_emit_printk_index(fmt) \
> +	dev_printk_index_emit(NULL, "[drm]%s SIGID=3D%u %s(%s)%s%s%s: " fmt);

[Severity: Medium]
Does this hardcoded format string structurally diverge from the actual stri=
ngs
emitted to dmesg?

Looking at log_emit_dmesg() in drivers/gpu/drm/xe/xe_log.c, when the data
parameter is NULL, the format string dynamically omits the parentheses:

	else
		log_dmesg_printf(pdev, cper_sev, "SIGID=3D%u %s%s%s%s%pV",
				 sigid, sev_prefix, hwe_prefix,
				 loc_prefix, comp_prefix, vaf);

Since the static string registered here contains literal parentheses and a
trailing colon, but these characters are dynamically omitted when data is
NULL or component is 0, will this mismatch cause regexes or exact-match
parsers generated from the index to fail to match the logs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191450.1169=
0-1-michal.wajdeczko@intel.com?part=3D11
