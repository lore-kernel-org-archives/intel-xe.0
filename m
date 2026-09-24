Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D3C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE9F10E7D2;
	Thu, 24 Sep 2026 11:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QSr/hfn+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2569D10E8A6
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 11:24:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E4C1143612;
 Thu, 24 Sep 2026 11:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81141F000FF;
 Thu, 24 Sep 2026 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790249080;
 bh=mJauo/JT3Mu5htWnpqN/G8Exi9ajn+esuDydypsqeX0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=QSr/hfn+tWrJeWWreOySROcg5suJZPEMq4jIVTAC0oLUr2+mid+Bzx4zQlU0OGf0h
 bhHhiTY0HezAbA/S3DK2Rr0nO9l8ajhkBejo/bjmWMdl6cWSeV01Jl2rk1+u/G5Sce
 Dv2rAI0nPK++Df8smO53WWUMmmRNml6OpZFc7Y/WojWgLrcrlBJ0+lwoTw2AcgUx/H
 gHtfrSsGrhEMivk+aZ2vDvIGUngw8FRyaD7ujNWZT8UytwL4ZB2XBXLu/X5Kap1aY6
 0u7o4KqSiUxyN3UuAHuzGyoUdf/o88ofbK5qo8/+zDGvj8QxgyQOFb8l8oJYdnOLyk
 mH3c8krgTWWNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/13] drm/xe/hwmon: Fix memory controller thermal
 data handling
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260924111156.2628915-4-karthik.poosa@intel.com>
References: <20260924111156.2628915-1-karthik.poosa@intel.com>
 <20260924111156.2628915-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:24:40 +0000
Message-Id: <20260924112440.A81141F000FF@smtp.kernel.org>
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
- [Low] xe_hwmon: kernel-doc mismatch due to typo '@vavlue'
--

commit af26cf662405440ebacf68b7cf48c30a800a4da6
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Fix memory controller thermal data handling

This commit fixes memory controller thermal data handling by reading all
required thermal groups in get_mc_temp() and using a u32-aligned buffer for
PCODE accesses to avoid unaligned memory access issues.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
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
This isn't a bug, but is there a typo in the kernel-doc here? It looks like
it should be @value instead of @vavlue to match the union member name.

> +		u8 value[U8_MAX + 1];
> +		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
> +		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> +	};
>  	/** @vram_label: vram label names */
>  	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924111156.2628=
915-1-karthik.poosa@intel.com?part=3D3
