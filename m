Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B031C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB7210EB15;
	Tue,  8 Sep 2026 10:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UvfYvXDf";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0910EB15
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:23:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 963A44150F;
 Tue,  8 Sep 2026 10:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580051F00A3A;
 Tue,  8 Sep 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788863037;
 bh=57hVmgGv3SdZaPiIliMjnAWoMv5cO03DnmeqQKVl9ac=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UvfYvXDf+BkMK1hlLhn5vqwW6iZhuCBCPjNTVyGfdoFg6pKRUCsQqlM+Tx9BdSFC2
 D54i4r5yTYOYACAfOx0WbaGTwJUp+Mgn9zGepQb3lGCQypPGCGhss5bx0t4gS2dLzQ
 0mim91eJE6rfgGr4HdEXLA+acnaYXGmCG0BNMZsT4p+3EW0GqO4Bf5AT30lSbMiOSD
 7b0zv1zgVwIcxThAKQtTJExO445yCsvhXtVdDjgYt6UqClBThFEK1qag8knxBcav4Y
 ebwLJIGZOgHgmfFbgg373ZFPAwCVJ+mU0CSHUL3LP1AHy53at8e3aLVJ4fB2vOsAZ3
 8ddS8dhf1QStA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] drm/xe/log: Add VRAM, PAT, and HWMON
 DRIVER_HARDWARE components
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908101849.1219614-2-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
 <20260908101849.1219614-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:23:56 +0000
Message-Id: <20260908102357.580051F00A3A@smtp.kernel.org>
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
- [Low] The VRAM log component is incorrectly named "Virtual RAM" instead o=
f "Video RAM" in the macro definition.
--

commit 7e2394ed2d7e6aa2312536fe5e3e318f1713fb04
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/log: Add VRAM, PAT, and HWMON DRIVER_HARDWARE components

This commit registers new DRIVER_HARDWARE log components for VRAM, PAT, and
HWMON subsystems to enable structured error reporting. It assigns them IDs
and string names for use in the ABI.

> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi=
/xe_log_abi.h
> index d6105520173e7..4a60aa48fab19 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
[ ... ]
> @@ -150,6 +150,9 @@ enum xe_log_location_bits {
>  	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
>  	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
>  	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "Virtual RAM")			\

[Severity: Low]
Is the string name for this component correct? VRAM typically stands for
"Video RAM" rather than "Virtual RAM" in the context of hardware subsystems.
The commit message describes it as "Video RAM access", but this ABI definit=
ion
exposes it as "Virtual RAM" in structured error logs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908101849.1219=
614-1-dnyaneshwar.bhadane@intel.com?part=3D1
