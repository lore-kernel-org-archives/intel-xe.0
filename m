Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF48DC98317
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB9910E0F6;
	Thu, 24 Sep 2026 11:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfDFISak";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1091B10E0F6
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:02:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A304D40592;
 Thu, 24 Sep 2026 11:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7292A1F000FF;
 Thu, 24 Sep 2026 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790247743;
 bh=SILVaRcNilYdLX9pNvZv88K+QS0vHotxt28wlKC9iQ4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lfDFISakWXpSctSyutUUokJAO8fyLRJLAOpmkrXQhuS/E0K+nUUNkcxAG/L5qjPyZ
 XGmuccLYgtvxeDWWtmeGFAh0bBK5aLaJvyT+mPTmqlcue5SUk43liYVLSGX6/oBN7f
 Y5paWrI+ufBUG6k1t/4FWDsRHqU9EZalsFhK2RMRdalyvmWR74+Ppqrh5/NKlAfMV1
 XvQpySkod6egejdEXHd49ZnPodIWqk+AY6Mpegv7+3aHfVxEWP55GES/60A9qbLyWq
 Q+/YrQlo30s4WBKIweCtM869XvkSCJywLMFeaDb2FrU1KjKaerOwRKrfAzIqqXZ1Aa
 v2Bh/+CF6RLfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH i-g-t v4 03/13] drm/xe/hwmon: Fix memory controller
 thermal data handling
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924105000.2627929-4-karthik.poosa@intel.com>
References: <20260924105000.2627929-1-karthik.poosa@intel.com>
 <20260924105000.2627929-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:02:23 +0000
Message-Id: <20260924110223.7292A1F000FF@smtp.kernel.org>
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
- [Low] doc: typo in struct xe_hwmon_thermal_info kernel-doc causes warning
--

commit 871f56e42943cda8c6cef9e6c91e26476b403061
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Fix memory controller thermal data handling

This commit updates get_mc_temp() to read all required thermal groups and
introduces an aligned u32 buffer for PCODE accesses. This avoids unaligned
memory accesses and ensures accurate MC temperature reporting.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index d82da9be9e5b1..658b6902af7f8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -143,8 +143,12 @@ struct xe_hwmon_thermal_info {
>  	};
>  	/** @count: no of temperature sensors available for the platform */
>  	u8 count;
> -	/** @value: per-sensor raw mailbox temperature; bit7=3Dsign, bits6:0=3D=
magnitude */
> -	u8 value[U8_MAX];
> +	union {
> +		/** @vavlue: per-sensor raw mailbox temperature; bit7=3Dsign, bits6:0=
=3Dmagnitude */

[Severity: Low]
This isn't a bug, but there is a typo in the struct member documentation
(vavlue instead of value) for xe_hwmon_thermal_info. This mismatch will
cause documentation generation tools like scripts/kernel-doc to emit warnin=
gs.

> +		u8 value[U8_MAX + 1];
> +		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
> +		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> +	};
>  	/** @vram_label: vram label names */
>  	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924105000.2627=
929-1-karthik.poosa@intel.com?part=3D3
