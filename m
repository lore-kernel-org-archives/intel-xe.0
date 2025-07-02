Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2193BC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763810E31A;
	Wed,  2 Jul 2025 08:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fge9NWgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E85E10E31A
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751445323; x=1782981323;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4h2aOk2NhcMaGbdFKRf9TVjY7vA3Vyfizaqlt7J6jNE=;
 b=fge9NWgdsA/WFwrDI3uNckF2pqJy/98KEulI8UoCUzjrQqMbSR7Gh2DY
 5rdVt7uwr+05T1yFZKzcLIUVOGMtMLuYhGH0R+lld1zoUO05olY/9BSjx
 fmBaP2O5Tq2rtBkTZDZoYgDpJp+u/PA20JA0HzRnr1KgPshy2sKP+DD6Y
 QRUbG3DhbcnqADImCKDpvw9X5oRReu6ACF7HqAxx7mocdxa4dL/Re5fcf
 FUxUV85mjipKesf64Vgc7LkNwWGqtNQFkk4bmSBU/oAgox+vXpCC+A7ua
 Bu+uOj+HM7BPQ61PHF74KSvTMzUWQR2hBxI1AhQZRlaCAlYR84w1oCFl/ A==;
X-CSE-ConnectionGUID: zqLHqYZLSg2X/wdD8iLLGg==
X-CSE-MsgGUID: lZcafk2rQgGIADOaEC+Kyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53873243"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53873243"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:35:22 -0700
X-CSE-ConnectionGUID: YOxOWM0qTOmwSfChdMrNjg==
X-CSE-MsgGUID: czZmMd0BRSaNsn4qc7Ax5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153418853"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.29])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:35:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/tests: Add legacy IP descriptors to param
 generators
In-Reply-To: <qtzn3rwxvu4yoi7oxfpv34auqwenqxlfhfjqoxi7jfdzqapkxp@zrgntsdh7hiy>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
 <qtzn3rwxvu4yoi7oxfpv34auqwenqxlfhfjqoxi7jfdzqapkxp@zrgntsdh7hiy>
Date: Wed, 02 Jul 2025 11:35:17 +0300
Message-ID: <dc5022e74e3d3ea117e979516f4795abdea2ac47@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 01 Jul 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Jun 27, 2025 at 08:11:10PM +0200, Michal Wajdeczko wrote:
>>Recently introduced kunit parameter generators where based on
>>the existing arrays which have only GDMID-bsaed IP and didn't
>>take into account legacy IP definitions from pre-GMDID era.
>>
>>Add test only arrays with legacy IPs (as those will not change)
>>and extend param generators to start iterating over them.
>>
>> [ ] =================== xe_pci (2 subtests) ====================
>> [ ] ==================== check_graphics_ip  ====================
>> [ ] [PASSED] 12.00 Xe_LP
>> [ ] [PASSED] 12.10 Xe_LP+
>> [ ] [PASSED] 12.55 Xe_HPG
>> [ ] [PASSED] 12.60 Xe_HPC
>> [ ] [PASSED] 12.70 Xe_LPG
>> [ ] [PASSED] 12.71 Xe_LPG
>> [ ] [PASSED] 12.74 Xe_LPG+
>> [ ] [PASSED] 20.01 Xe2_HPG
>> [ ] [PASSED] 20.02 Xe2_HPG
>> [ ] [PASSED] 20.04 Xe2_LPG
>> [ ] [PASSED] 30.00 Xe3_LPG
>> [ ] [PASSED] 30.01 Xe3_LPG
>> [ ] [PASSED] 30.03 Xe3_LPG
>> [ ] ================ [PASSED] check_graphics_ip ================
>> [ ] ===================== check_media_ip  ======================
>> [ ] [PASSED] 12.00 Xe_M
>> [ ] [PASSED] 12.55 Xe_HPM
>> [ ] [PASSED] 13.00 Xe_LPM+
>> [ ] [PASSED] 13.01 Xe2_HPM
>> [ ] [PASSED] 20.00 Xe2_LPM
>> [ ] [PASSED] 30.00 Xe3_LPM
>> [ ] [PASSED] 30.02 Xe3_LPM
>> [ ] ================= [PASSED] check_media_ip ==================
>> [ ] ===================== [PASSED] xe_pci ======================
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/tests/xe_pci.c | 33 +++++++++++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>index baccb657bd05..c5acee52b458 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>@@ -12,12 +12,31 @@
>> #include <kunit/test-bug.h>
>> #include <kunit/visibility.h>
>>
>>+#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))
>>+
>> static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>> {
>> 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
>> 		 param->verx100 / 100, param->verx100 % 100, param->name);
>> }
>>
>>+/* Pre-GMDID Graphics IPs */
>>+static const struct xe_ip legacy_graphics_ips[] = {
>>+	graphics_ip_xelp,
>>+	graphics_ip_xelpp,
>>+	graphics_ip_xehpg,
>>+	graphics_ip_xehpc,
>>+};
>>+
>>+/* Pre-GMDID Media IPs */
>>+static const struct xe_ip legacy_media_ips[] = {
>>+	media_ip_xem,
>>+	media_ip_xehpm,
>>+};
>>+
>>+KUNIT_ARRAY_PARAM(legacy_graphics_ip, legacy_graphics_ips, xe_ip_kunit_desc);
>>+KUNIT_ARRAY_PARAM(legacy_media_ip, legacy_media_ips, xe_ip_kunit_desc);
>>+
>> KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
>> KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>>
>>@@ -34,6 +53,13 @@ KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>>  */
>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>> {
>>+	const void *next = legacy_graphics_ip_gen_params(prev, desc);
>>+
>>+	if (next)
>>+		return next;
>>+	if (IS_ARRAY_ROW(legacy_graphics_ips, prev))

I don't understand what "is array row" means.

BR,
Jani.

>
> I don't like much this way of iterating over multiple arrays, but for a
> test generator is probably fine. Maybe add a comment on top of
> 'Pre-GMDID Graphics IPs`:
>
> 	/*
> 	 * Mimic the way gmdid IPs are declared so the same param
> 	 * generator can be used for both
> 	 */
>
>
> anyway,
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
>
>>+		prev = NULL;
>>+
>> 	return graphics_ip_gen_params(prev, desc);
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>>@@ -51,6 +77,13 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>>  */
>> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
>> {
>>+	const void *next = legacy_media_ip_gen_params(prev, desc);
>>+
>>+	if (next)
>>+		return next;
>>+	if (IS_ARRAY_ROW(legacy_media_ips, prev))
>>+		prev = NULL;
>>+
>> 	return media_ip_gen_params(prev, desc);
>> }
>> EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>>-- 
>>2.47.1
>>

-- 
Jani Nikula, Intel
