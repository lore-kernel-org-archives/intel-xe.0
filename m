Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80327CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 15:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E86910E013;
	Mon, 18 Sep 2023 15:00:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B6D10E013
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695049224; x=1726585224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IkBx5BnY3t1ZSRcU04o4qlOAv7IfZGE5Jdo5jShMLEs=;
 b=FBc+AbYY0OXW5PFXaehIWebEBQZJ/SxLa5sEipQXWVVwmq2B4o7s4Pe2
 uy4/ZVqlCMCdvkTnvM4xwo0uQrs+yt2bPvTABK1Zp7c/fLYZ5mr/ifBqk
 B3a9XRZfbQ0daPCk2wgzi1yx2yR0J9uYixM+1scLs/yh31YvvEwTpUl9k
 JQ0saCAPXOYYUEdwLSY+C7vwa3mcwRZnKXDzP6kzEir6neAZ8OOqYOS+z
 6KNxL+VtTK1bW9c25Ij/2karwyRTLX7kIzGE7Yb5pLdQLK45JHNxfVrrH
 Klnr/R9phUN1d5oqhyd9I88OfGViNjI9D+ZFwma/DIPDD83xp6iiHJsUf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443749401"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="443749401"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775156246"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="775156246"
Received: from ldmartin-desk2.corp.intel.com (HELO
 ldmartin-desk2.attlocal.net) ([10.212.23.222])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:00:23 -0700
Date: Mon, 18 Sep 2023 10:00:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <yvi6j3uix3ozvie2ea5whgokjubqk7g74y43yesigeoh32jwv4@vmcqliqhynj3>
References: <20230918071757.1132362-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230918071757.1132362-1-sujaritha.sundaresan@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe/regs: Add definition for the
 PERF_LIMIT_REASONS register
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 12:47:57PM +0530, Sujaritha Sundaresan wrote:
>Adding the definitions for the perf limit reasons register. This will
>be extensively used in frequency testing as well as the definition of
>several sysfs attributes.
>
>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

we don't add registers in separate patches. Please add the register when
it's used, only defining the bitfields that you care about.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index e13fbbdf6929..f9ba57c3bc4b 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -410,4 +410,17 @@
> #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
> #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>
>+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>+#define   PROCHOT_MASK				REG_BIT(0)
>+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>+#define   RATL_MASK				REG_BIT(5)
>+#define   VR_THERMALERT_MASK			REG_BIT(6)
>+#define   VR_TDC_MASK				REG_BIT(7)
>+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>+#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
>+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>+
> #endif
>-- 
>2.25.1
>
