Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BCFC5AD49
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 00:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48310E45F;
	Sat,  7 Jun 2025 00:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ztqhzwjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487FE10E3EA
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 00:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749255010; x=1780791010;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3T/XpTaFai7Xjmb+6ISG+sibCOCLnJQCKQZpWTFgg2w=;
 b=Ztqhzwjya50Kd99YfS3NAZZMJhvCkOcnoOHO62VPRg9HUilOMKy7ZLVZ
 J7BGmPfDPsAvAc9614KnBJDAg6QaVe2gms3/pdtZStkocg0jCfEsSSDLg
 FTla2KxPlFJibMT7IMw/vz/lFo+YWuMTmsPYrhVG5PzoxSmO1fOh1plBP
 scTGiSYKtYg3U7HUM/B4df2pzwuiSzkg+MH7Q8gQXrqEWdXY+8ONoGdic
 Uq4YbQlayALaIV4TFv7/Td3xB7ISAME2oQZTW8skRAIHrQExxcUu0pn47
 eokbEhDwAo21iyAYIUjv9cQ9I7Ez+FNXrxZueQe8B+1F0oNBkyamB+ea2 A==;
X-CSE-ConnectionGUID: s6hgpyZqQNqOtk7sT0mplA==
X-CSE-MsgGUID: HnYXwd8wRDyxY7cT8XBs8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50524051"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="50524051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:10:10 -0700
X-CSE-ConnectionGUID: eB1cEcjMSCuzctYInSo7dQ==
X-CSE-MsgGUID: sA+bzoQ+TAuOgYkb0iy0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145966073"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 17:10:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:10:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:10:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PypEFDNCAxtZNZkio7jOpP9fJfzwQr2GinXwJuh4yyiv/WE9PIgyQD0/TWgmIUis1PsNn+PQchrMMDfSFK6zbqcIwa4C7KmiPQItSxQa+7P+7Wfx9zIzY0joDMBC/8vG8zVRAuiEfSp82e8IQhxpWtK/2wMmda8wZK8yWpPXsllXQsNqlxY6hCvbqPAFcUQAN7NGGCzDgAWI+mGdq+Ib3QK+weP3bxbRZK39VMOPhNRSI2IFc7VWi46hvv13uWnwOu9WJKs47FtEePwquRTEW6MoV6jrzvH1za2NPiSPwGuiE6K3cmgeipZ5iZTicFMpW94taPw71jh2SSmH3opdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+IOfrfs3PnVvl0a8waMsYd1fYZUhxzlp1Q5GO+GZkE=;
 b=rZeVJVQ9/wpGoADvCY91BYQZzhASiZLeaMnqCPgfmFjtk8+Z29TBPJYFH8OsdVfP8aXfPk90oLHjaO7TywDYRxp+w7QVjgbM4YeJGGtKkim9V6pdKomIs1a+Zy1M0oye0Vzwk8eCADDPx2CDy3U+76ZPWBw6Ma5pKumEjqut0hMVug8C80t+cIAsA27ZPIsn7by5rlnH5tMbqZHc1wUkPi/Yi3uClhiqTDGmIdkdKwkKzfiYfNqICDoMuCigzSGHk3yFntzWO320wxoHXPWpHgdvhDE/0+Aft81cyBc84yEfELucs+eaYkUnW1wVK7hjNfSQeWSXDnMIN6Q/nPDhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 00:09:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Sat, 7 Jun 2025
 00:09:26 +0000
Date: Fri, 6 Jun 2025 19:09:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe/bmg: Update Wa_22019338487
Message-ID: <5a5ghczbury3zxtrgznalw64oey7rtpox5er6bfx6u5umnafks@d6h4lluz7kgf>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250602234415.2015921-4-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: e977a54d-acd2-4aeb-b958-08dda5579064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?16YtYCx6I2y3tgS3mae1fnoxGPFtBGa46Sd5pwiyXy2LlHq1Knsm5xA6ATqp?=
 =?us-ascii?Q?LTEma5P0nl778AlROjjWI/7eADsqpJ2mAQcN420ijbzw7BzOV/sO8mvLfdQT?=
 =?us-ascii?Q?44U5c/1X+PniVk86QO/Y16ARmmppIeOUvF9RTGmn836xVbbiHc5f7RPVyMkj?=
 =?us-ascii?Q?ic5hFMCrlBReOZ/tmQV/lNarrcqomKQBxVDjyMGsR4UgsGJBmcJmEDS4TjOV?=
 =?us-ascii?Q?J+uQXTVmbIGhqYMcFWF6jtBlSeSdCD9HARD2zeUl98mqR8vA0yhE8f6CX0Iv?=
 =?us-ascii?Q?2ugH/I7+wZCuBpdbNhy53R+rjC5xWQ9jru7di7BxHQ2yeTfQB4qZCoid/XNs?=
 =?us-ascii?Q?kBOUNmuj0klHvGRuLIJMtsTYDooDaswi68q4KPPoLmOyE2ZICDr/zNvU60P9?=
 =?us-ascii?Q?HXDvS3sEKPJiUJzufPm+rqR1lezGrwsFJALXAVKk1wyyumc5UGfNwiKWu72z?=
 =?us-ascii?Q?ybMO+CTDmlTobTEpECPvxm+SusTy9wucOQ/oSGrw59391h6V5Shg9uCntq7X?=
 =?us-ascii?Q?/sfCwh6qYI/+LzSm8hS5QETBu1OqPWeKWUpcZkFzEWybQ2pYlBd0dpIewiUl?=
 =?us-ascii?Q?UoKIUN3SpGyvp9+wZmid5WLCy+gn34bNfkt3xOXysW47ZJDanOSx6JptgSz/?=
 =?us-ascii?Q?0bC6KS/LDzuDG+mCP+jQpB6zch4/01VQvCM5BIySuf2+IkSYEkaxMVu1lvb3?=
 =?us-ascii?Q?0uf67U1Kchcw3ShDDV+bae2CPoz+hGWoL9hqkk/rGHDcSmWD4wyY9plTmRtI?=
 =?us-ascii?Q?tHo+Ncg8omcQhBPSDsVVjUR98Wb3Q/2T+nkvDlJwWaLTU5cQDTWu6H+Fscza?=
 =?us-ascii?Q?ZB4Tm+nqdfAFH7YNHr9NOQYoxHO25EOVGxo5RfgjkGhQTfU1QU99fGoy0RHi?=
 =?us-ascii?Q?n1KBECYIkamvqCxzh3W8SiZdKqm+AnvM9ait1PBnfW7oqHiw86YIaA7Eeaby?=
 =?us-ascii?Q?1jpDEic10PsGXRcXsArdpE4CvCLP5suRIu2bQDjHzQU23GUn9JXtAeRyYI04?=
 =?us-ascii?Q?CNxyA/pdcobo3GPaR7gjByHRFQfE/B50gVYTzhMiXt8vsN+hja/JU9EGzlDo?=
 =?us-ascii?Q?ETwuVedx679V4oX+o/zxLhRBmX+Vkk55nof8ArPwoERPaE1q3ujEXZIydTWk?=
 =?us-ascii?Q?WVdp4dqgzALULIVVm7zICMf+8vFfmlNa1MKhtqVYkT/g2sZmy2gG97YKjkSl?=
 =?us-ascii?Q?Fan4NdGjjstZ4kOiq+UPHsRLDe8IeZ7V0qmOxdWFgHprt1vtUbdwtmBAjRJm?=
 =?us-ascii?Q?Mlz052ApPj4Xesw4suAg9KLZ1x6faXt2wue5bwR5nHZQ1iTpIcUrIXi9I342?=
 =?us-ascii?Q?njswScAqDAYrLwC6xQf3saeWRuspNMdmkxOlG1d6vw//ot2q8JGGkH+xwSZs?=
 =?us-ascii?Q?e06/QpiN4u9pBshBYlydE9iUWmMcp/i76af0rjVTVFJ+v/ri3ehmCOHHXPIL?=
 =?us-ascii?Q?3+jw8LJe64Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjQ2kM2sMpAcAo6MoDK6HIdIJ1nKxPc/QEyDIWhcUdt1st4b38XLw6mmOke1?=
 =?us-ascii?Q?j719oQO7f0hLh32es6qsqURupDGMm9r6JjFN086EzbsD48CKhCY+nt6W+7sq?=
 =?us-ascii?Q?HmtC5tcdpSxYTekXU7pGAE9bVSKX2Qxxi8h7kwFS3mmmLM2QQ/PwkdzLtRd4?=
 =?us-ascii?Q?0mhASKiFlQACLogNwXhd/ANSriV8rkz33AuOWIfwKQ/3W0LzGIjRwr4AsMuO?=
 =?us-ascii?Q?mslNRWbnFO2ogdBHX0f7ELQyVsLrus9Q6zm7FWGbbMxvoqoS20gXn3hMTH8z?=
 =?us-ascii?Q?3w96PlAKkIzE+khYsioWRfuBoog/ZGbX801PvWAzZnOsaYCT0r9j9YTZJHrs?=
 =?us-ascii?Q?HvTIGlJlm+I2B4fFT4oUvmQrB2pPYQWDHxLlxxL77boWG9eSQ/XH+Siq4I27?=
 =?us-ascii?Q?jZIhkT5N7w85fcFixtjCJYe2rFOzJdEn0uHj6qXCQmA6iFwIPGKPppeOzdRg?=
 =?us-ascii?Q?VO+FksR5v3I1CLQ48I65k6H2wa/aSuWRvBheGEtp4sSjqWhhRC1dWlE4lAgX?=
 =?us-ascii?Q?V9ehbDWSfRFhZO0wRJLN1Jy/tlpZI4pVZtqCIyN5Dm2e79y8xpoe60YdJBL8?=
 =?us-ascii?Q?0SkfXVh9nIOBkvfTj/BILbAze7p0srbnCsOnHFZaY6AfGAiUoKzynHotk+8I?=
 =?us-ascii?Q?+zMRjnuh8P56zfaTNxlSeOaqwoie3AcJ97k7ENQiAptVf7XoL4zP//zgg9is?=
 =?us-ascii?Q?Ins1KWfci9fO+HyJukFhXy169cadh7JIkUwPVLIz1B4DZ1dOcNf/hHLgZqD6?=
 =?us-ascii?Q?1PLk964yuDQ5wTau9RWu6Wg2t9Mel518zJaaAj1hEdjwd1RviHnx87iLquJP?=
 =?us-ascii?Q?m0AJ3OijXbJSBa8yFs/0//EZQ/7xsAwztqS+xT3xrJgSaE/emh3QCWN7rHvW?=
 =?us-ascii?Q?6XDeW8YZuhzOOndL+gfYXsEhLydoutOp+2GyD5KobQqZBk1dpAMG27S0T6gz?=
 =?us-ascii?Q?87MJ/i54HGci0Qqqf9UaOdIow8MrA0fzi+GbDCzVDBvagn+N6gSJWknmchfD?=
 =?us-ascii?Q?n7SAG2K0+uAW8M/VmDz3pCnJn7Dt7uY/iGyFO87BUX6LoUuub0Jgd1nYXH2H?=
 =?us-ascii?Q?OsI7blxnQsUhq66EChh9ts+sEy1knvW2fu1XDj9fRV418k1jJIpeJw+7NsLC?=
 =?us-ascii?Q?M1AtggIzJgP28wN91pmjUijysUf4Z8BEwQp51gtSrAmxzZ/2AsNI3+ePOsav?=
 =?us-ascii?Q?43KZaxq4h8RNxlDUpFXw3qdDLgrOBfpdhgVgnXlV+RmlJLeju9PoLss9Qb/9?=
 =?us-ascii?Q?Xuz0fTB3rQiI5JnSjeJxsSr4gUykOdLWd0ZQjjQ8GmF1CXI2NP4zcwuSgsAs?=
 =?us-ascii?Q?qhwdWHEH/+ehcl7/CZA5n2ZabvWsK++1vg8oozrYTZl0jRzmJKOIzwDfsDxw?=
 =?us-ascii?Q?5HqUq5PJ7tZOs7cWxpMZfWerln0kdxw8DuYMGe/I75EyTMM5TpVORorXflL6?=
 =?us-ascii?Q?8Wyij9UpgeEdBEAHkm7PeQPZBJxmNqGYNcmqEAhiW4tLBWesBqGPQyNhqDo+?=
 =?us-ascii?Q?8fJowjOI3X+/vt+D3rbu/bP96pmRsaUmXYqC5NVXnVg2asM1O9dH0CGWLsBI?=
 =?us-ascii?Q?/xuTERIlvfZVPfNt5rGpI5VyMNodcVVAhgsN3MML9OO0cjJcZkoktqiFQeEZ?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e977a54d-acd2-4aeb-b958-08dda5579064
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:09:26.3529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j63hAZkGwxCr69NyOEL322VmNQU3SIA3hTs30B/8C88O93p3lvo6yrMOacdoeypPmbo3QDXvkBlQBnic0N37hxn5DQLxFMgpU/X0x8/WS/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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

On Mon, Jun 02, 2025 at 04:44:14PM -0700, Vinay Belgaumkar wrote:
>Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
>GT actual frequency is limited to that value before performing the
>cache flush.
>
>v2: Use generic names, ensure user set max frequency requests wait
>for flush to complete (Rodrigo)
>
>Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  10 ++-
> drivers/gpu/drm/xe/xe_guc_pc.c       | 122 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
> drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
> 4 files changed, 134 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 660b0c5126dc..f703aa03eaaf 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -40,6 +40,7 @@
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_vf.h"
> #include "xe_guc.h"
>+#include "xe_guc_pc.h"
> #include "xe_hw_engine_group.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
>@@ -1000,16 +1001,18 @@ void xe_device_wmb(struct xe_device *xe)
>  */
> void xe_device_td_flush(struct xe_device *xe)
> {
>-	struct xe_gt *gt;
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);

this should be root_gt. See below

> 	unsigned int fw_ref;
> 	u8 id;
>
> 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> 		return;
>
>+	xe_guc_pc_apply_flush_freq_limit(&gt->uc.guc.pc);
>+
> 	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {

		  ^ re-use it here

> 		xe_device_l2_flush(xe);
>-		return;
>+		goto done;

here xe_guc_pc_remove_flush_freq_limit() is called on the correct gt.

> 	}
>
> 	for_each_gt(gt, xe, id) {

but this loop modifies the gt, so xe_guc_pc_remove_flush_freq_limit()
will use the wrong one

>@@ -1034,6 +1037,9 @@ void xe_device_td_flush(struct xe_device *xe)
>
> 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> 	}
>+
>+done:
>+	xe_guc_pc_remove_flush_freq_limit(&gt->uc.guc.pc);
> }
>
> void xe_device_l2_flush(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 793df3486d1f..12ab1eb619d8 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -52,9 +52,11 @@
> #define LNL_MERT_FREQ_CAP	800
> #define BMG_MERT_FREQ_CAP	2133
> #define BMG_MIN_FREQ		1200
>+#define BMG_MERT_FLUSH_FREQ_CAP	2600
>
> #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
> #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
>+#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>
> /**
>  * DOC: GuC Power Conservation (PC)
>@@ -647,6 +649,25 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
> 	return ret;
> }
>
>+static int wait_for_flush_complete(struct xe_guc_pc *pc)
>+{
>+	int timeout_us = 1000 * 30;
>+	int slept, wait = 10;
>+
>+	for (slept = 0; slept < timeout_us;) {
>+		if (!pc->flush_max_freq_limit)
>+			return 0;
>+
>+		usleep_range(wait, wait << 1);
>+		slept += wait;
>+		wait <<= 1;
>+		if (slept + wait > timeout_us)
>+			wait = timeout_us - slept;
>+	}
>+
>+	return -ETIMEDOUT;
>+}
>+
> /**
>  * xe_guc_pc_set_max_freq - Set the maximum operational frequency
>  * @pc: The GuC PC
>@@ -660,6 +681,12 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
> {
> 	int ret;
>
>+	if (XE_WA(pc_to_gt(pc), 22019338487) && pc->flush_max_freq_limit) {
>+		/* Flush still in progress */
>+		if (wait_for_flush_complete(pc) != 0)

since this is a call from userpace, instead of hand rolling the wait
this could be a good candidate for wait_var_event_timeout()... which
then also fixes the missing WRITE_ONCE() below.

>+			return -EAGAIN;
>+	}
>+
> 	mutex_lock(&pc->freq_lock);
> 	if (!pc->freq_ready) {
> 		/* Might be in the middle of a gt reset */
>@@ -872,6 +899,101 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
> 	return ret;
> }
>
>+static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>+{
>+	int timeout_us = 1000 * SLPC_ACT_FREQ_TIMEOUT_MS;
>+	int slept, wait = 10;
>+
>+	for (slept = 0; slept < timeout_us;) {
>+		if (xe_guc_pc_get_act_freq(pc) <= freq)
>+			return 0;
>+
>+		usleep_range(wait, wait << 1);
>+		slept += wait;
>+		wait <<= 1;
>+		if (slept + wait > timeout_us)
>+			wait = timeout_us - slept;
>+	}
>+
>+	return -ETIMEDOUT;
>+}
>+
>+static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+
>+	if (XE_WA(gt, 22019338487)) {
>+		if (pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+/**
>+ * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
>+ * @pc: the xe_guc_pc object
>+ *
>+ * As per the WA, reduce max GT frequency during L2 cache flush
>+ */
>+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+	u32 max_freq;
>+	int ret;
>+
>+	if (!needs_flush_freq_limit(pc))
>+		return;
>+
>+	ret = xe_guc_pc_get_max_freq(pc, &max_freq);
>+	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
>+		mutex_lock(&pc->freq_lock);
>+		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
>+		if (!ret) {
>+			pc->flush_max_freq_limit = true;

you are busy looping on the other thread on this value. This should be a
WRITE_ONCE()... But I think a wait_var_event_timeout() would be better


>+			/* If user has changed max freq, use that value */
>+			if (pc->user_requested_max != 0)
>+				pc->stashed_max_freq = pc->user_requested_max;
>+			else
>+				pc->stashed_max_freq = max_freq;
>+		}
>+		mutex_unlock(&pc->freq_lock);
>+
>+		if (ret)
>+			return;
>+
>+		/* Wait for actual freq to go below the flush cap */
>+		ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);

the lock only protects the set above. AFAICS there's nothing blocking
another freq request to set to something above BMG_MERT_FLUSH_FREQ_CAP
and then this to timeout

Lucas De Marchi

>+		if (ret)
>+			xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
>+				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
>+	}
>+}
>+
>+/**
>+ * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
>+ * @pc: the xe_guc_pc object
>+ *
>+ * Retrieve the previous GT max frequency value.
>+ */
>+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+	int ret = 0;
>+
>+	if (needs_flush_freq_limit(pc)) {
>+		mutex_lock(&pc->freq_lock);
>+		if (pc->flush_max_freq_limit) {
>+			ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
>+			if (ret)
>+				xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
>+					       pc->stashed_max_freq, ret);
>+			pc->flush_max_freq_limit = false;
>+		}
>+		mutex_unlock(&pc->freq_lock);
>+	}
>+}
>+
> static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> {
> 	int ret = 0;
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index 0a2664d5c811..52ecdd5ddbff 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
> void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
>+void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
>+void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
>
> #endif /* _XE_GUC_PC_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>index 2978ac9a249b..e3a815976bac 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>@@ -31,6 +31,8 @@ struct xe_guc_pc {
> 	u32 stashed_min_freq;
> 	/** @stashed_max_freq: Stash the current maximum freq */
> 	u32 stashed_max_freq;
>+	/** @flush_max_freq_limit: true when cache flush ongoing for BMG */
>+	bool flush_max_freq_limit;
> 	/** @freq_lock: Let's protect the frequencies */
> 	struct mutex freq_lock;
> 	/** @freq_ready: Only handle freq changes, if they are really ready */
>-- 
>2.38.1
>
