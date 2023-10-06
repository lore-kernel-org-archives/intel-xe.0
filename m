Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1748AE92FE0
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 18:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2EB10E533;
	Fri,  6 Oct 2023 18:15:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1F110E533
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696616157; x=1728152157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EP04AZ6ZE5DTCLDrygxp+ByOaczsMgtR96ijcvRUvc0=;
 b=nY1fr9Ks9bmRKS71H5ymXOgAUguUCF+ArwJXyu6TZqzFzeDLZG4k4U7X
 G6GjjptzOToufJLeINk+B8BrswLUqCaBrri3ouNKqzZaZENk+C1UOve4I
 GJ0vwcxEvVn3NEuyq3ESP+jK6tGajlCojXeLZg3GdB9CTk9lctroh3/iB
 3JJXyT9QamTG3VZdnQW3FWxtv8+spfOu5aFZ3oIWAc5ry6hkwyKABJH/d
 /VwzdX39pt0p5utCwhBTMe/OIHa6+hQ5OfK0jO4CHjFBnj5FthSy9UH1B
 PfwxAewPRDAOd4C2z6unPMk3gbEVN33EK5j3+Dpd5jMCyYEIfUqrKCGUr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386631748"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="386631748"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 11:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752265971"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="752265971"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 11:15:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 11:15:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 11:15:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 11:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzEHpJ/JWHqD/52PMBL9KAv/0M0e0HDuwRioMJwEMaYzXZWbbHj3an17WQ5U6cEg0/hPkLLGuAWC4CBs4FWviUMkiba7GcnWxVBNp+AfsXj5mRtHkjw8QG8c0iWxxfP8jNLPzs1JiVHuITS5npfbf+h9//RNt+/SZ8zqvgV49/3Y4+lgmBbk3P0t7RroLuEcg23FNL/VDSynWn02Al7juWLiG6WsLux+TnficChGwjqrc7Av78VoHmfOPM0wvd0DZYUaO998eSFT0K0svs6/wjAPAUSHaDdIPq0wQTtONkEMj5E3P/dgZp84C7GVEKC5shXhViC+cn5DFKl3aF39mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4IoDF2nRYSFE/51RYreGIeb15Awkm+qn4N0y7hZBtE=;
 b=aeow4OvlMY3xYe0HgWzP5CJ66qqAe8gOGHsow3eGlRkV0qQrInuJC161v8YwqlYJ0/xqUittnlGIt6F6xuuXOxt99J6BRQVTn84BCYsJW7weGa5KxLj561YSsxYX2KcSzTs/NcMDqexAU+AFP249gZK56Rk/u5l0nuIO0BQpdmHmR1BZZqIjViDEbgHL46AQs5fkWZQ4uCNBQ4ZjhJpW76S637A3eCsTXnxUnmPaak4op5k1dlHVW33aGkw2HPbW9Rhpxpa3Z8LnbM5PMrqzJ+93SoiTTmWFlTzGJ5SvrMXytebtzVUNvxWy8H8k/JzkkdTzs2MLgA2Rtnjh2zlcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Fri, 6 Oct
 2023 18:15:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 18:15:52 +0000
Date: Fri, 6 Oct 2023 13:15:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ek4ugzbksfldpyu2ubnaxsg54g23kyq5oz4tzgyc4wt3uuhx5g@q3bit7xvlcq7>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
 <20231003125217.3350838-7-lucas.demarchi@intel.com>
 <20231005002144.GG53570@mdroper-desk1.amr.corp.intel.com>
 <7n3fkocl4bo7cbxxafthle2rakema6lpqinr5rlnexkwbl2d4z@2m6je7565oiv>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7n3fkocl4bo7cbxxafthle2rakema6lpqinr5rlnexkwbl2d4z@2m6je7565oiv>
X-ClientProxiedBy: BY5PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:180::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: f18f644b-ad04-43d2-1fed-08dbc698467c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLuxAYXvMjFlxOk4j38Mqv1p5iohZ2pfBFzG3mOW3feqgp8bgYbae7xgBwXXKZmnFgurjsO0n/6RLh+fkBV5HjUKJWXy4b8VncN1yNZnbvijlaiR4zXwHqlN4EpKCihbvcYxL0ZuN4uG82YKo30PCbGDNq/34FwuasL3E4/12FBL/+4rZa8NZlO+GnWkf2BE1w+4ErH2Qo0392mdRP6xdrYfkPvsl2yDP//gOSeQqCr+GhfGGRaY6nt8/VGyhyhVgJF6YFLNjpcEhwNKRXOYBM8UjzWzktiW8AmWEKInXF1zQW/6GXWtZqO02unPR94q7vOaEpB8gUp4UYBqQUHd8/2psx6atwFABEeJohiujcbr3UJ0CNUpfww0VOYMTXG3IAxAmvGeO92q5MxDvB4RT7JnF7xwkPUUljNKKeeK8nzLbUdpR9zpTL5NqWAw329F+fFPxaCI3IW4CHaEJQA+EdS9QM2bT3cUjCo3hTS745584JO4svJwdkiNlgJI3RS3+Pq79g0h8McRu7yWGWOciNnHjYdLVFLVCjzBU2iWrNOfXhOszNSpbKFI83vY1QkL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(6506007)(6666004)(6512007)(6486002)(478600001)(86362001)(38100700002)(82960400001)(316002)(41300700001)(33716001)(2906002)(26005)(9686003)(66946007)(66556008)(66476007)(5660300002)(6636002)(6862004)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSclRRmhqOfV6m3hWoIFWk7coSeN5m9ZxQLCbP+NBI4/JGUiruAY6VVLji9o?=
 =?us-ascii?Q?7CIkilTR5bpjF98t5mk6ndZX+mAwf/5hyKN2n5OzcQbu5KkfOdAa7t2aLot8?=
 =?us-ascii?Q?Ah+TCw6LpRfhJ8Ad5HKHGp6KL0cRZNKbg9uKWMs05sGlEvr0Zf2NC0d2UUPr?=
 =?us-ascii?Q?UC0n3X4PeFghWw/Lke/j6LeQjOQKS9gfvSLnaUjLA4sBs4f3UAbTW5u1R26O?=
 =?us-ascii?Q?lGoCclKgngglOoxMzEZUy4uYx4AYsUtlW0gIvXb9fjJ6WUSDmQoyVbzfjlHN?=
 =?us-ascii?Q?RbzmtdJULdtbJszdnlaN5aS+bvJ3hoSU3k5zDmeg2rr3j0JyHbkfUwF/2AIu?=
 =?us-ascii?Q?idfCFhg3JP21QORynKBpmbdn773DR0/zg1I+D3kEjjs/lPrJP/ac9ToODIE4?=
 =?us-ascii?Q?mAfYyfeEIRtOlA1Az6+zLokIqVuumGDSkOYC2SJn9/VA1XLOGLQYe4m2ufyP?=
 =?us-ascii?Q?OidoIB1op+ymciJnfwgzDmOQWbT7T91S7j/EXW/Y6UIR18uoXOgDh7/D8L4s?=
 =?us-ascii?Q?jPSfBeij+iRlTJgT2cg3IGY6Q8mu6/VMqR7G2qRNcdSbKbMOM0Q8NObUzTPY?=
 =?us-ascii?Q?18BV8Wfc7hdesF3q0PiHRdcf2m54W61QnPgadBJn6Ksh0AyNljufqxAOQ/Nn?=
 =?us-ascii?Q?ljXwMy4uGVejr/R/dUVsmNFguEVJAT/2+ZkcHLvPkMJuv7aPYc91iB3IA87k?=
 =?us-ascii?Q?wlbXly7oi1ezHFvQg+U0QqJfVjDn5R0ssb9pb7ZhFYESG4uUHgwPuXkHRWuR?=
 =?us-ascii?Q?Zl1prWmyiZjlwWTQALpW6/LFbfVonMlmJ9NLVFxihNwFifmCtzGejxGqobwR?=
 =?us-ascii?Q?jkmSCsgTU7623CQeuqFNpLhAW5/0tv+BmsomWAkQ9HWgc/w9PxYkdbklOoW/?=
 =?us-ascii?Q?ivAEeEsdvr/CkV2TKA5Vs9i8Mzn6eaX67cOSF2cuG5TE/DZRqeCw9bLaMMsW?=
 =?us-ascii?Q?NHwVEBfHSEJYhPIjijG7ghq3LuddU0AL7qDCgKXxhjRUoKyJogkeLTYwg/wB?=
 =?us-ascii?Q?RMU1uYnuAe4rgbuUmDHk6fV+tW1Z6YKz9/9oUQDnfiO8wdsvmKZG3HzyAZ0j?=
 =?us-ascii?Q?Uxuw/OjtwGur4No82Ni34p/TdZuTO6le0hRdQEfqtW/lQhj+TuI1WNgaMhmd?=
 =?us-ascii?Q?O5qacUjfkQNavisSuIC4Wm/IGd4K9EZNhjhFQGKBVEBpiVa0NLRuCwo9zAW4?=
 =?us-ascii?Q?2C5LOLa3IPfMh/Xg0vbBL/EF2IVFCYVUYh515vCdyCOucXQyMKhT5jJ1v6PQ?=
 =?us-ascii?Q?7+U+o5u6bkdQurFxI1PBT1H0nb9pcmKr9gjUnqxooxUX9ODSmfBuy64KDn5s?=
 =?us-ascii?Q?NadmoSJM7y9ccCO9/Qbgo4lRMznwAOnBxez9Vll1OGVLVG1V0Fs4mdAsdaTV?=
 =?us-ascii?Q?WEvbezmfyWb5cbryDxelVn50Tz2xdiLCiXKuEpJYpYaP4stpacy81C+vfAJK?=
 =?us-ascii?Q?HBkcgvCYkYDlSzo28H5rd4NvHX42HhuAKW8qsnGbwUF0o78VLBiJ9zlskfmK?=
 =?us-ascii?Q?CQCh8xLcrYRFd4X8I5ojLyQKcD/12dht0x1TBILdh63OSq7MbIctclUKaQt0?=
 =?us-ascii?Q?9l8a+PRaGrTJP5r0CPxRC3d9PrFWXPSk55nfCbj9JeijtGhbS0bSKgGBiwNv?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f18f644b-ad04-43d2-1fed-08dbc698467c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 18:15:52.4738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBzmaJZuWA+k6/7k9ETadagdVHTdZJ3wAWS6XM/tgNdsANg/kcTB44igYIZiH9zE0wRxP1OYVK+N7cytStQrW85GjOdanLAg1AKLnyjMb4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/pat: Add debugfs node to dump
 PAT
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

On Wed, Oct 04, 2023 at 11:07:55PM -0500, Lucas De Marchi wrote:
>On Wed, Oct 04, 2023 at 05:21:48PM -0700, Matt Roper wrote:
>>On Tue, Oct 03, 2023 at 05:52:16AM -0700, Lucas De Marchi wrote:
>>>This is useful to debug cache issues, to double check if the PAT
>>>indexes match what they were supposed to be set to from spec.
>>>
>>>v2: Add separate functions for xehp, xehpc and xelpg so it correctly
>>>    reads the index based on MCR/REG registers and also decodes the
>>>    fields (Matt Roper)
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
>>> drivers/gpu/drm/xe/xe_pat.c        | 204 ++++++++++++++++++++++++++++-
>>> drivers/gpu/drm/xe/xe_pat.h        |   8 ++
>>> 3 files changed, 223 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>index ec1ae00f6bfc..cd6d28c7b923 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>@@ -16,6 +16,7 @@
>>> #include "xe_gt_topology.h"
>>> #include "xe_hw_engine.h"
>>> #include "xe_macros.h"
>>>+#include "xe_pat.h"
>>> #include "xe_reg_sr.h"
>>> #include "xe_reg_whitelist.h"
>>> #include "xe_uc_debugfs.h"
>>>@@ -138,6 +139,16 @@ static int workarounds(struct seq_file *m, void *data)
>>> 	return 0;
>>> }
>>>
>>>+static int pat(struct seq_file *m, void *data)
>>>+{
>>>+	struct xe_gt *gt = node_to_gt(m->private);
>>>+	struct drm_printer p = drm_seq_file_printer(m);
>>>+
>>>+	xe_pat_dump(gt, &p);
>>>+
>>>+	return 0;
>>>+}
>>>+
>>> static const struct drm_info_list debugfs_list[] = {
>>> 	{"hw_engines", hw_engines, 0},
>>> 	{"force_reset", force_reset, 0},
>>>@@ -147,6 +158,7 @@ static const struct drm_info_list debugfs_list[] = {
>>> 	{"ggtt", ggtt, 0},
>>> 	{"register-save-restore", register_save_restore, 0},
>>> 	{"workarounds", workarounds, 0},
>>>+	{"pat", pat, 0},
>>> };
>>>
>>> void xe_gt_debugfs_register(struct xe_gt *gt)
>>>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>>index 296763594370..1c89137fc66b 100644
>>>--- a/drivers/gpu/drm/xe/xe_pat.c
>>>+++ b/drivers/gpu/drm/xe/xe_pat.c
>>>@@ -6,6 +6,8 @@
>>> #include "xe_pat.h"
>>>
>>> #include "regs/xe_reg_defs.h"
>>>+#include "xe_assert.h"
>>>+#include "xe_device.h"
>>> #include "xe_gt.h"
>>> #include "xe_gt_mcr.h"
>>> #include "xe_mmio.h"
>>>@@ -14,6 +16,7 @@
>>> #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>>> 								   0x4800, 0x4804, \
>>> 								   0x4848, 0x484c)
>>>+#define _PAT_PTA				0x4820
>>>
>>> #define XE2_NO_PROMOTE				REG_BIT(10)
>>> #define XE2_COMP_EN				REG_BIT(9)
>>>@@ -26,10 +29,12 @@
>>> #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
>>> #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
>>> #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
>>>+#define XELPG_L4_POLICY_STR_MAP			{ "WB", "WT", "(N/A)", "UC" }
>>> #define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
>>> #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
>>> #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
>>> #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
>>>+#define XELPG_INDEX_COH_MODE_STR_MAP		{ "NO", "(N/A)", "1-WAY", "2-WAY" }
>>>
>>> #define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
>>> #define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
>>>@@ -39,10 +44,12 @@
>>> #define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
>>> #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>>> #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>>>+#define XELP_MEM_TYPE_STR_MAP			{ "UC", "WC", "WT", "WB" }
>>
>>Is there a benefit to making a #define that builds three separate tables
>>inside different functions rather than just adding one file-scope table
>>that can be referenced from each of those functions?
>
>As long as the array is const, it should be equivalent, but I didn't
>really check the alternative to see what the compiler is doing.
>I thought about this so the define is next to the entries and it's easy
>to check it's correct.  I will take a look on the alternative.

there was a ~100B decrease in size when using a static const array
shared with all function. It's very small, but pairing with the other
changes below about not trying to print the human-friendly string, made
it better IMO.


>>I guess using human-readable strings works, although I was originally
>>expecting these to dump in the same format as the Xe2 table below to
>>make it really quick/easy to compare against the way these are written
>>in the bspec.  E.g.,
>>
>>   PAT[0] = [ 0, 0 ]  (xxxx)
>>   PAT[1] = [ 0, 1 ]  (xxxx)
>>   ...
>>   PAT[7] = [ 2, 3 ]  (xxxx)
>>
>>I don't have strong feelings about it though since the pre-Xe2 tables
>>are really short and simple.  This approach looks fine too.
>>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

new output for MTL:
/sys/kernel/debug/dri/0# cat gt1/pat
PAT table:
PAT[ 0] = [ 0, 0 ] (     0x0)
PAT[ 1] = [ 1, 0 ] (     0x4)
PAT[ 2] = [ 3, 0 ] (     0xc)
PAT[ 3] = [ 0, 2 ] (     0x2)
PAT[ 4] = [ 0, 3 ] (     0x3)

Lucas De Marchi
