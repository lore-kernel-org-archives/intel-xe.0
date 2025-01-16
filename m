Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5875C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 14:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2810E99F;
	Thu, 16 Jan 2025 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bw+DL3Xp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A910E99F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737039101; x=1768575101;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z2gC//2g2XsdJsq+9X6EPEqVYlAjDv+eD3AfPdWiw5s=;
 b=Bw+DL3XpNopCEXeqLcKWXrkDGiWIlhdrEPzhCtQqHrcCK1HMqUsbOeiJ
 qMTBehtopfIC2vRq99PMMbpm07xm8KYx64qREX9Ra0ehDmvayyltyJeCI
 abM7uDG+L10FENqnjFnHhnyqm5cCYNBDUa61jJzEE7mwQ+NenAWTrLb4J
 2L2ehVLnhY/zCCGun+ml57hVZVr87a7VPXBeOvHKcJ/Akfp5EwV1sbs5a
 LCcquGwvE6UNhO0HZEvtfO4zK7h+EKWJiccQpb+oi+Jofs2iMdw0Cr94x
 NYmUwL5Fr2E4ahHeiJMs+NUl953HKib3emChNsrfpRQcQCHaSxJaVPc7h g==;
X-CSE-ConnectionGUID: cya5CbAlTyynasjXgeNaqw==
X-CSE-MsgGUID: gQVkJfy2QNOw6i2Z//ToGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48015545"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48015545"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:51:40 -0800
X-CSE-ConnectionGUID: gSM2T/IGQya6wz+7ApCVNg==
X-CSE-MsgGUID: 5lC9dJciT66Qq4oDDX13Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106397071"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.57])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:51:39 -0800
Date: Thu, 16 Jan 2025 08:51:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Suppress printing of mode when running in
 non-sriov mode.
Message-ID: <ns2cztumzyalnty6gkyr3sv6tj6l33gzcjvjabccdd5qgdtt53@2r3yworb6nkl>
References: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116055617.20611-1-satyanarayana.k.v.p@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2025 at 11:26:17AM +0530, Satyanarayana K V P wrote:
>The xe_sriov_probe_early() function prints the sriov pf/vf mode on
>driver probe. When running in non-sriov mode, the below debug message
>is seen.
>
>"Running in none mode".
>
>This print does not convey any information. This commit suppresses this
>debug message and shows only when running in PF/VF mode.
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_sriov.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>index 04e2f539ccd9..a0eab44c0e76 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>@@ -81,7 +81,7 @@ void xe_sriov_probe_early(struct xe_device *xe)
> 	xe->sriov.__mode = mode;
> 	xe_assert(xe, xe->sriov.__mode);
>
>-	if (has_sriov)
>+	if (IS_SRIOV(xe))
> 		drm_info(&xe->drm, "Running in %s mode\n",
> 			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> }
>-- 
>2.35.3
>
