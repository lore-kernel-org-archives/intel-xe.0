Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A1C25B77
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 14:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB6B10E05B;
	Thu, 16 May 2024 14:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEzvtc8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEF310E05B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715869406; x=1747405406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+iPzBJWifgCLLNaCl3faVNUepIB6ZcosCF+vGlUwlB8=;
 b=IEzvtc8Uz3R+VCRoDWRBMTTdKuEGU1RFjTdVBk0c7JStu5Qv7gw6x6fJ
 YdanPlgfz7GuQyjA9XTn3Ve00eCwauREvhXKcFBD/qTZc+X8IPClelHr6
 EAmmCm62ni9PV0LNRmn7TJmg5xmEd0jiYJ4a2ensXbW8HywNrC220rlOP
 X5X2m72DEu8JMqfruW0eenBzeOptnTsEc7QnIJkpm5OwhpvFvbn1kNW+p
 7LYkf0QRYe/lo097JqUhInG6TQ2zez/MA0fe+1XZ8P7tF5m8iqhyIbm8e
 nd370QQu9dixT2gcN+K7R7FlLNCDFTLTdmJDayKEkApXRUH7UI8MisKhI A==;
X-CSE-ConnectionGUID: 6BazwMbcTUK/+5UbF3H/OQ==
X-CSE-MsgGUID: JGWD/7KsRCKf/bvtBBaaZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11850320"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11850320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 07:23:14 -0700
X-CSE-ConnectionGUID: +uQZb+V8SoaGpXV0zmidlg==
X-CSE-MsgGUID: vw/yX2MtTt+b1stBgxW//w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31275532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 07:23:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 07:23:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 07:23:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 07:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXYmm3gjfzvX4uieSy2Hrw1+S0DIQfuOZYUNp2JsUKVJVzUpGxLGpLxH1BNVS/2wg6BUw8xtXkNI/mj/pcwOzknwNBTJj0Sxnmz1+IO9rrMqFb8l6lmzj4x105n3sipidlW4ztaZwjxXmVWkni/zhjT4QejC9z6rOOmdFn57etafyhM6ie+MIiVGXS/lxeWIGPCkitbkAl9s2Jb1dRaOzCIpAJIvh7/MDPOJcAAQnvB8v5FNAtM/GpMNFg0mRXyJFhxsUAYZWdgFOpAFWxQBx5czRjl8E8TdIrOFwF03IhLyxoraeKmgevWhSQnRWBt9+JsmXExxngfd6HZuWmrvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsen3rs9yIy+LgsPji5ZGWdkom8iFo5uN9IDyDWg6zw=;
 b=lAE9vmXqdAr6hGBQeMQCLqWTbuo5ucaITSU+v6pjeJdg45IJek4G2/UqZ+BfyQY3DlNF33XNdc5sutM58ctoCpkxMvKYdjlN0svtBi3YMUnlYYGyFxv5Upcvgjj6KR2vRCfcUwnck8wIAySf6jjUIVeb1bkBPM0W4C9QwnEECv8kx8LHh5rGUrFbHkc9QBNJKQDmHKm7I+z0gz9kU00EfbuaE9dPd0I3HXTBK4Awev8Kw96CtcVmR9Csi09xA8v4EWz/qNZqGYRWzYu9sOdvWhGD7xw80sKajjJIlmZhHw7csvyO8nKwmKzAP8ojmDN7nY6/BizyOyiQkTB2nddr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 14:23:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 14:23:09 +0000
Date: Thu, 16 May 2024 09:23:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/8] drm/xe/guc: Introduce GuC KLV thresholds set
Message-ID: <yktjo6maej5hulzsxn4ldxiqws5xl3eogcfjjiyv6u6o4eu4x2@32ofuijz66bc>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
 <20240514190015.2172-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240514190015.2172-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1aa0fa-45de-4a65-e552-08dc75b3b62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NblzXumRJHMRx3bdzk8LKiDE1XrfPwPtS3/vNNHqTi5+npvX2LSPlqJTjN?=
 =?iso-8859-1?Q?0Em4NRGiQURiEnEjJNSDgNCkjvtdhcY2ZZCsTY9JJi4hrKVZ33kQB5XLVv?=
 =?iso-8859-1?Q?O05NCW3A7HHAEm8t8AHPonYqFf4wtL0affbSHCuaggN8T3am3nj3jb/bby?=
 =?iso-8859-1?Q?N7fPUlMMjuBtoBfxR9njzc0iqz7ukTIfoUbWrblm8oNjy213bsV9luCzqc?=
 =?iso-8859-1?Q?dOeuNh8ftwgEd8hUSbGTEE0GRuYj2f5brDwhs1Psq2GEtdffRfCl262cqZ?=
 =?iso-8859-1?Q?ycYvOVn2lGZ7fsI9HOt+Xbzu6UrsJvhnzdCpO1m2rLhdj3oZMUpx3CUX3U?=
 =?iso-8859-1?Q?s6sAWI+ROzoqwxpSnDBXhAcSEb5GzHjEv+U7AUef06wxoPNctFpm0Thgcw?=
 =?iso-8859-1?Q?4NSmQV54PH9RGAxRrIxRFJK8/LRZEoQ+BMJYTq546RYnOKjwxDV4xxqT9H?=
 =?iso-8859-1?Q?KGi0BjiPv6WWvSaCroX9Ci2gUFuKJ51Fxt2/ljmSfBo+upZnigZr0QxeoX?=
 =?iso-8859-1?Q?trRQdasjcxLc94R3sSbqQ/GJoOU3MF5wTpAW0QoCnzf344tMkaL36lxZ4U?=
 =?iso-8859-1?Q?mHeu+NH7jrE/7UPmQZYJ5MhQa+uc9B1UjuodO97/myrKRMdi0d0jSk9nO+?=
 =?iso-8859-1?Q?EH46F97LQaLVsyWf/B2TbwB0+MrX4xhHZ+ZBOhkGS8pq6AgmAkCQivnjaf?=
 =?iso-8859-1?Q?lQHalZA5njkedwlm9d1ejOC1PDCV9yhHnB/3YhtpS0X32zmpHJy0V2jyaE?=
 =?iso-8859-1?Q?xBmgb4b6Kc89VeOuiglqVqmwPDEPRWjvJRN2GUh6Ux+8gj7tu9KLcm22/8?=
 =?iso-8859-1?Q?wmanpRgiyO5sK6C911I2njtDA6m4+QMbXJ0+zCWqGmxUXa/6ZkXx8yu13B?=
 =?iso-8859-1?Q?62Dxr8SmlrCvj8K1eWXu5u40XrK65hIiYVmKKy5sYJM5YzroHNGynB0vlP?=
 =?iso-8859-1?Q?ri8RzMsJt5hTiz0P4mSSHVBYtUjy22iFdEHtehsxNDdbLCmL+G0CeFhzez?=
 =?iso-8859-1?Q?KSzIy1zAIaWjEeJTf4NbaJbumeT1ihsBQisqK4M9oYygVK1Lj0n+0DxhfM?=
 =?iso-8859-1?Q?s5Bcsne1SUpq52SI9kLuHdxd25NBqduVDpb4NUrFuvJrht7P/wjuLbVQcK?=
 =?iso-8859-1?Q?cHxw5a2lq6n10/VSf5GsJxExU+aie4vrtQcLnPOn6sdfDaC0liBx28zaoX?=
 =?iso-8859-1?Q?F4aODgVXv+PFa9fe+6N2mPAd7mHP8kjhXqyuPhc0St68tUNbMunprkUGUm?=
 =?iso-8859-1?Q?GMjYluA02T3OgIY5CkXeJTU+V8QVDPdR+TLFnbXEPp0sS14HSabaNcSbqd?=
 =?iso-8859-1?Q?+UZXXtIKaGhbjWWPIQF06gljlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?h90X679aHmZ0/hZPnlAacf79mHt2z1m6/BYe46v/Uc3uWJOaH5VGFnEnim?=
 =?iso-8859-1?Q?WQUYnyMydR/lIP8+sgRQIlBWDzH60K3OrCWvlX+COkXZ4zDHsvTuP9YkoK?=
 =?iso-8859-1?Q?TtzOF0ghXt7K4+RhDiwpQZFLeMkkZjJLo39a8wBu6emxp1nfoIpZC3FQci?=
 =?iso-8859-1?Q?aXONRz7It6q+P72CPjYL3lcnAsCnh6RH/wXwm2ejwZOd7VncbFT6W9YJ6F?=
 =?iso-8859-1?Q?e5OjMXDCEySH0qYDgd9911z0QDCq6We/9YhMNdoWPc8kcbszFpGl6C7wrw?=
 =?iso-8859-1?Q?e6ypSaUHfzEWUfybV39rVek39is1lFcMt6/TbLIY+KeON/CzVqc4AhgttE?=
 =?iso-8859-1?Q?136gHFoT5GO4ZSFA1aRVkDllgwyswflSgmLD4jQICMn1cTyVZ84o5sAGOO?=
 =?iso-8859-1?Q?VKa8oCzhQK2x6SOiq064Ys7VHyh5Hla63IxvUC+t9RviqKIqZYMUqcNe5T?=
 =?iso-8859-1?Q?fbvHnqVpPfq4Z+vTlwPd4sCNCebJHuScWdWLD70WhEIJeyqB83HXuUeWlh?=
 =?iso-8859-1?Q?13Oh9XVhocxHmainKsSLPib4lK1Hs6uPssL3upt91TLwdmldpbsRZuAip3?=
 =?iso-8859-1?Q?00HKdwASoSMpanYs0iwBQUi/8UiLySNaELYXDT6oe7QJap12az8701xYdZ?=
 =?iso-8859-1?Q?e6pdlOOhDZmXchBhK99dfOZ0PTs2lSdoOhyX3l9do9c9AKbY8KKZwWH0HD?=
 =?iso-8859-1?Q?RT0QnpjzZt2PJ3MjGuDW5ysup265YjT0pCCKIKsf9F3IF9t7H0Li4ZsTHG?=
 =?iso-8859-1?Q?iNoB2EoNLCSHSHOU+fxx+gAwAxKiDXgYCnEakp6yoEIWBICgJs77difl+c?=
 =?iso-8859-1?Q?+dgkS5pqWVAKaVpQhfNlhfBVc1r93v6hO50XKvh6QMYjko5LyUr6aAuV+N?=
 =?iso-8859-1?Q?07qE24WbX+IfG8lRmgseIKahIojShlJ9/9DRE79DxMbfGLpuUB3AaxxRxk?=
 =?iso-8859-1?Q?sN2eChLireDLy8BK7oXy4QAnq1fK1cTdjE8dsMKnQszx9KTB6ouJAAmnSt?=
 =?iso-8859-1?Q?f3IoRFNeH53+rAlgtYpGhcKh7uER62D0t2suwu0lNPVv0a0Wc7RYwAaC3P?=
 =?iso-8859-1?Q?coDz0AicDxa2P0h86RHrCRLFx5Wk0Zpp/LN6CA875HSsv26FLV42ryayrG?=
 =?iso-8859-1?Q?d+UPzcHxncIEkSDIpe1tLYdpmX+bITtTpo/G6BtlCbN9ledxWwA7yGJls3?=
 =?iso-8859-1?Q?3DXM4qSt6O7F33fSs/BIrKbD52lRxbHG6+51u5C45Nk0NHA2dD0dj4ubZz?=
 =?iso-8859-1?Q?tInORW/tDkoRZ11HflhkgIuzuyjxyvPVwEs0UCDCr2wAla0V/JqcTL/Npr?=
 =?iso-8859-1?Q?tsf+k57IhcXdcKhkwLU2wuuzEj4Y8WoEJGSXPeLDVkl++Pa9pTRBRZYi8a?=
 =?iso-8859-1?Q?E0Amld4eikp8IDpqX+wAfwvl6On49ZB0cJs11UIOpdoruTMyHZHBPX8vQG?=
 =?iso-8859-1?Q?Z/qxz9ktMVZi2GfZ3n5dMOFWrLvuHAaSqCwWY4t5afNrTdWLcH0acdKCwB?=
 =?iso-8859-1?Q?3Fe5RpeJefIAbc7EZr8+az5QmmQgPur5gCKpBA7V08tnyoAdBRBent1E8y?=
 =?iso-8859-1?Q?FfHim2PZrN39v+KwUpJAREWqR9ZpsfZh3TS5oxpK/e92xKTw3sXwXUXCwT?=
 =?iso-8859-1?Q?gwTKRrPIaQlUHIZHdKTpuPAUA9P5CogyM/7vZr3q5XRriKIwJI8t5a9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1aa0fa-45de-4a65-e552-08dc75b3b62c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 14:23:09.7879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Bjm1897/XvcLClQUAevY9nB8RxCrcxKqaFgD+6JFjzzr0x6JKATMpN5j+aIKDzF1q57wNtauUGvGN6Tz0TRyrKV9dVJ3sKMURYgp716meU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
X-OriginatorOrg: intel.com
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

On Tue, May 14, 2024 at 09:00:09PM GMT, Michal Wajdeczko wrote:
>The GuC firmware monitors VF's activity and notifies the PF driver
>once any configured threshold related to such activity is exceeded.
>
>The available thresholds are defined in the GuC ABI as part of the
>GuC VF Configuration KLVs.  Threshold configurations performed by
>the PF driver and notifications sent by the GuC rely on the KLV keys,
>which are not zero-based and might not guarantee continuity.
>
>To simplify the driver code and eliminate the need to repeat very
>similar code for each threshold, introduce the threshold set macro
>that allows to generate required code based on unique threshold tag.
>
>Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
>v2: improve readability of generated switch/enum (Piotr)
>    silence kernel-doc warning (CI.hooks)
>---
> .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    | 64 +++++++++++++++++
> .../drm/xe/xe_guc_klv_thresholds_set_types.h  | 68 +++++++++++++++++++
> 2 files changed, 132 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
> create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>new file mode 100644
>index 000000000000..da0fedbbdbaf
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
>@@ -0,0 +1,64 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_GUC_KLV_THRESHOLDS_SET_H_
>+#define _XE_GUC_KLV_THRESHOLDS_SET_H_
>+
>+#include "abi/guc_klvs_abi.h"
>+#include "xe_guc_klv_helpers.h"
>+#include "xe_guc_klv_thresholds_set_types.h"
>+
>+/**
>+ * MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY - Prepare the name of the KLV key constant.
>+ * @TAG: unique tag of the GuC threshold KLV key.
>+ */
>+#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
>+	MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
>+
>+/**
>+ * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC threshold.
>+ * @key: GuC threshold KLV key.
>+ *
>+ * This translation is automatically generated using &MAKE_XE_GUC_KLV_THRESHOLDS_SET.
>+ * Return: index of the GuC threshold KLV or -1 if not found.
>+ */
>+static inline int xe_guc_klv_threshold_key_to_index(u32 key)
>+{
>+	switch (key) {
>+#define define_xe_guc_klv_threshold_key_to_index_case(TAG, ...)		\
>+									\

something went wrong with this newline above

I checked only until here in the patch series. As I said offline, I
don't really like much this multiple indirections on creating
symbols/enums.

we end up having things like:

	xe_guc_klv_threshold_key_to_index(VERY_LONG_NAME_FOO)

and then when we are grepping the code to find VERY_LONG_NAME_FOO it's
impossible to quickly find it. From a quick look it seems the cases here
are like:

	static int pf_handle_vf_threshold_event(struct xe_gt *gt, u32 vfid, u32 threshold)
	{
		char origin[8];
		int e;

		e = xe_guc_klv_threshold_key_to_index(threshold);
		...

and it does have the error handling.  So, ack on the approach. Let's
just not go overboard with these macros please.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
