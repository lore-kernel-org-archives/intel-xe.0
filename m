Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF924C35274
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 01:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112510E048;
	Tue, 19 Dec 2023 01:11:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B044110E048
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 01:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702948311; x=1734484311;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e7NsZSrh/TFJ2QxdY5fpdRZcDsx2YlI6pi9COIKu78I=;
 b=L1739e4VUAyFT7WXBiVNC1QxMq1J0MX+FKpyfF/+1rjtjUZhf2qP27J2
 jx6+woG7HL2D4xmh4/WiCl+M1SltXszynsqFur0Pu/lSxTItnwqfCtx9e
 whYGkNU+PaMh3S++2K0h58s3zU34345UnPbkDdP/d8Z6LGtv9Gh3If7xW
 W4BJYFxEdEKjOaC2A7VabLxVbYcds9t3oM/jVY1bxehyOo4TNcZzv6N8S
 olp1aD1VlfBsuNks118xYGH+TVuO4YBj9YxzFWpBzyVxbC87H5eHOzic1
 X0484dJ29yMkKq8eql82rsHzZ7sIXEIvRQ/RQByfl1ZulykNfhmrN8yK8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2423251"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2423251"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 17:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="769030536"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="769030536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 17:11:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 17:11:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 17:11:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 17:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWYqVDkKzj75f1A7gl93VkLrlzKTnkKYE8RGfhb2KI2QcKX+WwT1YEvgegq3PG70fioHc5Z3cVNydPEqbVpqhl7iJ1Q6Rv+2ZARdpmG2LIypTTI85c7VSlTRlshVR9XEMUex/zxXWBMioplFw90eJiq9fc8SrTc22K1fh7xOnXnBPMi9rdr2YkHBEEbZWCwqBKUrJOTHmqi0Q5DaA9DqkLrrST2pdb6ryvH7Bpy7egHSopLTFQDeCtF9TR1uvlJA/J7wvZKGBUs9HzJDSpK+NoaeHs3bXA1KrUEb6d9dEztdk/gyMGHLgamoGPP1REdIpekUpTBSXOA3TL18w6s+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrF4NFtTdHk4lRBFOWfU1rrJ8ZBNQec04oQuDuvZTCM=;
 b=jatzaaloPs4N7Ew1GtdG64/5V0T/i4rSNarT7VOhRBQYM3OljxkTYyd+KEVyG8ivmE2RX+kMVexFs7OJa+K1YJBduZmQMcDAv4We+dM2JPFsTinMSs99QiC4e45iNVfBPD5vutR9yn9ogM6/3K2ss/9QZ8E/BYgI9t92G45z8i1/4XtQbNIMBniw952JFjHNmvsUClBnuFfiV9GDsCSgh/drYzb4BcluCeJn94ba9/BoAWhdl6vcTy8dr6yeFhH3rLFnYxbbOvm/SdrQTyYMTfDznUP6DvEW/FSuU8QItpixr4Hgn5iFWdUShXbfSd7gxYf6d804CIYLAqmOXLDSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Tue, 19 Dec 2023 01:11:47 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 01:11:47 +0000
Date: Mon, 18 Dec 2023 17:11:37 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 04/17] drm/xe/oa/uapi: Add OA data formats
Message-ID: <ZYDtyQDmFh/FadOm@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208064329.2387604-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::17) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 525d3ff0-e7bd-41f3-4e43-08dc002f788f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PaGX+KrXU02ESB2pJ4YYhRwHkala9CeqFhfTftbfP/UcvZslbwSBiku6qHXC96p2ar9FRJ1KIQRQd5HsSQqfTz3qMTQzCwceHEla4D3IG5rv9mKVTaIPY9Otsc5F7vZKKBR4dj41dvT98WoWc2h+6+uy+yxHOWsIbqhJpwkfpNxPyzkSlnXHGeyhSi4UWh8pKMLYEBxP0fXFL10MZZfnjxaNENBlX6TYLTtkEMbEUgw8aUx+WGafBKfQyOHoU1VNrr+Uea82ipp94ZTfi9AIgz7oHGO6lMn5R4Ga741T+JC/AVJnJ8nhh9cqwhhKNqYjqDCckq/QON/UxoR/nrrIcflHaygTQ8RD20Ix9H69pxv1WfxBDjBQogcE0PD2658sf5AUCSjPXZUF8vwHYlxKOJjLtaW7aUSfJ8Ci5cDqhAtzz6OU/pfO/V3A98a022iFlhiOkCRmjFlCYgqewREPK+GjokSGx/5k7hB2e1wIhPiVc9DpvjfNSj5E/GYTbxSnZt5wtbd3uJirpv304SWCF3wNaQUWSlIj0t7AUw9D2JQnPT+4AkSuu4DjXUQ4OI+Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(82960400001)(6666004)(33716001)(41300700001)(6506007)(6512007)(9686003)(86362001)(6486002)(478600001)(26005)(38100700002)(83380400001)(5660300002)(316002)(6636002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkQ3T3BscDF1NjZka0p5cmZPR3NlN3FBbm5NeEp4Z1BwdGRhUHYrbHJOeXlv?=
 =?utf-8?B?UUxJK1grS09oTDJ2K1FrZWs1UFg4TzdKWloyaWxBSHQ5OFJlcXJFUmFHME93?=
 =?utf-8?B?K0xQNmltMGdrYjdCcDkzQzVlNmg2eld4UzUxTkNwd2dVRThaMHRaVkNkUUVw?=
 =?utf-8?B?bU1NUEtOOW15L2NiZW16bnBOTEtLdmdHWUpiRHJCRkR2eXVYSDVFVnZydkpY?=
 =?utf-8?B?ME5RMWpDMjFaTzRWVHc0UzJOV0M3Q1NVVWVXaE15TmF3dTZ6cFo4Q3FEMFJj?=
 =?utf-8?B?NnlRbmt3ckt1NHJSTE5hdENaeCtCQXd4NmhTeTNGa2hyemlEYTZNOTJPdFZn?=
 =?utf-8?B?bDVrajN1WVFwNVpLL0JPckZYeFQranJuQVU1N2lpaERDaVJsVFNVK0ZuTnoy?=
 =?utf-8?B?djV5aVpQeFJQLzJlaFZQdlRHSTJKNVNXK3MyWnh4emsrU212ZHJUYU03dGRD?=
 =?utf-8?B?ZW5jR2ErTVN1TDJ4dGttWnNneXZHZlI0d3U5UEJ0c3NteE9IZXZpQ0hqY0Fu?=
 =?utf-8?B?NE5QVGNVaHFVaHM5NWVDZ1lTejNma2g2a3VzM000MjlJWmRRc0Z5eG9LQXk2?=
 =?utf-8?B?MnRoZGxIdGxyT3krazRPcmpncXY0RThiRUNHMTMxakd3RVNac1V2YVBTaGtG?=
 =?utf-8?B?WjZkb2xObldYaFhxUEVvejNORFpaMlg2Mmh6Q0ZCeGF3NTdhUktkMlgrb1Vi?=
 =?utf-8?B?bE14bkpneXBKY0tvaHk0OUJCZHhqRkYrZHpGaTB5Z1RiSm9Ya1NOQTFOSWRY?=
 =?utf-8?B?d0tkenNnSEJ4aEdhZWFlQmxpYWlpMXJWbkhHRVp5NVVvZk4rVG9waUcxSlVP?=
 =?utf-8?B?WFVKNXB6Rk9zK09OMDhuMEMyTEh0enFQTjJwaGg1b1BsSytFL0NHNGIwb0RD?=
 =?utf-8?B?SzRKeDZZKzBUU29tQjRNYUpRd25lbkhMbkpBMGJSamxHUnUwK1MvRUFNQWJ6?=
 =?utf-8?B?THhhR1BYMmhZUWkxZnYxdWtGVlV2end0RVhBb0x5enZGalRsVVV6UlMxbWZU?=
 =?utf-8?B?aHlXd1BYK0FhYTZhTVFDWVJQemVkdXZkSzQxbHFIK2JPVHpUUC92R1U1YzN5?=
 =?utf-8?B?dEZaZTgxOUgxUmd5aG54NzFIVVRJMkhkNEpBbDJVVGdveC9YMHE0YkNIdjJV?=
 =?utf-8?B?aXlERjNrd0FIclhTbW9yNTRrTktxMUlUb295WmxqbmlPSHdKUDhSTmdJM1Na?=
 =?utf-8?B?ZEpZTmswUHNZRExNemZLbEIrWnRPaUJlV3hjY29wNTQzMmRjd3hua255bnlz?=
 =?utf-8?B?aHgvU1pQZ0FrYVVqNHd5YW95K1BxWTh0eUFWL09GcFdYQ2s1TXZ2WjdqZmNv?=
 =?utf-8?B?THFmTGxYMUJkc3NQUEtlMkhOUjY2dUhLN2Rick9XWlEwZzZhOUg0dVB4YVlH?=
 =?utf-8?B?MVZVQUV3YTBUbVl2dlBPNWR5MkNLdm1Fc21BRFRFSXZLSURpMjJESDBuNU00?=
 =?utf-8?B?M3hZUVhEdkxUZ2dTajU3T2MxNW1hZ1psN1oyc2MxOUkveDN4U0FmVlM3Ynhr?=
 =?utf-8?B?Ri9OUmFDa2dteDAxRjV2TC9pV3NIQXp5QTR1bUdiSGVGd1NYb081N2tnSnlP?=
 =?utf-8?B?NFRWTnl5aTFXbVBJNXFxT1M0WW45YmJRaVB1KzdjZUVwenozczNvNXg1MnJp?=
 =?utf-8?B?MjNxbVdwMVdiMzZ6dmc1MUY3ZzJQamFWM1dqLys4aExuQUhhQzFtMWVKemc4?=
 =?utf-8?B?TnU4d1lhSnFVMERiTEZ0bE51MHU4WkxSUmZ6aDM3citLUy82bG5zTlRTSUpj?=
 =?utf-8?B?Zm9kZ0NlL2J5c1pzdE5LYnlkNkE0Nm4xMG96WUl1ZC9NTnVlamhIbTNVeExH?=
 =?utf-8?B?SXlCM3ZhTTR5RTM4ankzQnhQT3hkZC9wMGJVUzJEV0pOdElEbjc3M1grWUxW?=
 =?utf-8?B?dkdWTThiVW5qZ3BjZWtMREpwYXoxY0RQYTZwdm1RTjRhRzNtY20zSVpZTkls?=
 =?utf-8?B?UjM4MnVTenBIMlJSdndVK0RhOHRnNEdnU1cwRUdXaTAvRitBTU0wbzVDbHFp?=
 =?utf-8?B?Q1VNaDRYNFhJZUlmckVCaDdXM2hRUTFXWERza256NTh1ZGdSVFZXOUp0V3dG?=
 =?utf-8?B?SENGczVBVEhYWDkrSXFtVlFtcHF3RUZrdjU5QjZkblFtdk10ZHk5L0VJUmM5?=
 =?utf-8?B?T1RQM0ZKTFN6TnhtYUYvRFpxUFIwYlZQaHdYRktRTWpyRW40eWwvR3ZOaHAx?=
 =?utf-8?Q?EPsnF9JN2tbnywfK6OUmfdQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 525d3ff0-e7bd-41f3-4e43-08dc002f788f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 01:11:47.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGT24h25ubVul2V0SNapzcmygyKx6S5zuJ77rVttMRFwN1nXOPI00a6ni7SjFneHswNBuvb/aTeG8YCMz1g/fgznFkDwUDldX1I/Y3Wdjy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:16PM -0800, Ashutosh Dixit wrote:
>Add and initialize supported OA data formats for various platforms
>(including Xe2). User can request OA data in any supported format.
>
>Bspec: 52198, 60942, 61101
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> drivers/gpu/drm/xe/xe_oa.c           | 94 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h           |  2 +
> drivers/gpu/drm/xe/xe_oa_types.h     | 78 +++++++++++++++++++++++
> include/uapi/drm/xe_drm.h            | 10 +++
> 5 files changed, 188 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9a212dbdb8a49..842ca8b1a7408 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -15,6 +15,7 @@
> #include "xe_devcoredump_types.h"
> #include "xe_heci_gsc.h"
> #include "xe_gt_types.h"
>+#include "xe_oa.h"
> #include "xe_platform_types.h"
> #include "xe_pt_types.h"
> #include "xe_pmu.h"
>@@ -418,6 +419,9 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>+	/** @oa: oa perf counter subsystem */
>+	struct xe_oa oa;
>+
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index f4cacb4af47c5..11662a81ef6d8 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -13,15 +13,109 @@ static u32 xe_oa_max_sample_rate = 100000;
>
> static struct ctl_table_header *sysctl_header;
>
>+#define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>+
>+static const struct xe_oa_format oa_formats[] = {
>+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
>+	[XE_OA_FORMAT_A12]			= { 0, 64 },
>+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
>+	[XE_OAC_FORMAT_A24u64_B8_C8]		= { 1, 320, DRM_FMT(OAC), HDR_64_BIT },
>+	[XE_OAC_FORMAT_A22u32_R2u32_B8_C8]	= { 2, 192, DRM_FMT(OAC), HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, DRM_FMT(OAM_MPEC), HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, DRM_FMT(OAM_MPEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC64u64]			= { 1, 576, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC64u64_B8_C8]		= { 1, 640, DRM_FMT(PEC), HDR_64_BIT, 1, 1 },
>+	[XE_OA_FORMAT_PEC64u32]			= { 1, 320, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC32u64_G1]		= { 5, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC32u32_G1]		= { 5, 192, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC32u64_G2]		= { 6, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC32u32_G2]		= { 6, 192, DRM_FMT(PEC), HDR_64_BIT },
>+	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4]	= { 3, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
>+};
>+
>+static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
>+{
>+	__set_bit(format, oa->format_mask);
>+}
>+
>+static void xe_oa_init_supported_formats(struct xe_oa *oa)
>+{
>+	switch (oa->xe->info.platform) {
>+	case XE_TIGERLAKE:
>+	case XE_ROCKETLAKE:
>+	case XE_ALDERLAKE_S:
>+	case XE_ALDERLAKE_P:
>+	case XE_ALDERLAKE_N:
>+	case XE_DG1:
>+		oa_format_add(oa, XE_OA_FORMAT_A12);
>+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
>+		break;
>+
>+	case XE_DG2:
>+	case XE_PVC:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
>+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
>+		break;
>+
>+	case XE_METEORLAKE:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
>+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
>+		break;
>+
>+	case XE_LUNARLAKE:
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC64u64);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC64u64_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC64u32);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G1);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G1);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G2);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G2);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_32_G2_4);
>+		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_4_G2_32);
>+		break;
>+
>+	default:
>+		drm_err(&oa->xe->drm, "Unknown platform\n");
>+	}
>+}
>+
> int xe_oa_init(struct xe_device *xe)
> {
>+	struct xe_oa *oa = &xe->oa;
>+
>+	/* Support OA only with GuC submission and Gen12+ */
>+	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>+		return 0;
>+
>+	oa->xe = xe;
>+	oa->oa_formats = oa_formats;
>+
> 	/* Choose a representative limit */
> 	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
>+
>+	xe_oa_init_supported_formats(oa);
> 	return 0;
> }
>
> void xe_oa_fini(struct xe_device *xe)
> {
>+	struct xe_oa *oa = &xe->oa;
>+
>+	oa->xe = NULL;
> }
>
> static struct ctl_table oa_ctl_table[] = {
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index 1b81330c9708b..2145c73176953 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -6,6 +6,8 @@
> #ifndef _XE_OA_H_
> #define _XE_OA_H_
>
>+#include "xe_oa_types.h"
>+
> struct xe_device;
>
> int xe_oa_init(struct xe_device *xe);
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>new file mode 100644
>index 0000000000000..3758bd2879cbb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -0,0 +1,78 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_OA_TYPES_H_
>+#define _XE_OA_TYPES_H__
>+
>+#include <linux/math.h>
>+#include <linux/types.h>
>+
>+enum xe_oa_report_header {
>+	HDR_32_BIT = 0,
>+	HDR_64_BIT,
>+};
>+
>+enum xe_oa_format_name {
>+	XE_OA_FORMAT_C4_B8 = 7,

7? Leaving room for old formats? Not sure if it adds any value. Do you 
anticipate this driver being supported on pre-gen12? If not, IMO, we 
should just start with 0 OR 1 (if you want to use 0 for some special 
case.

rest of it, lgtm,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>+
>+	/* Gen8+ */
>+	XE_OA_FORMAT_A12,
>+	XE_OA_FORMAT_A12_B8_C8,
>+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>+
>+	/* DG2 */
>+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>+
>+	/* DG2/MTL OAC */
>+	XE_OAC_FORMAT_A24u64_B8_C8,
>+	XE_OAC_FORMAT_A22u32_R2u32_B8_C8,
>+
>+	/* MTL OAM */
>+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>+
>+	/* Xe2+ */
>+	XE_OA_FORMAT_PEC64u64,
>+	XE_OA_FORMAT_PEC64u64_B8_C8,
>+	XE_OA_FORMAT_PEC64u32,
>+	XE_OA_FORMAT_PEC32u64_G1,
>+	XE_OA_FORMAT_PEC32u32_G1,
>+	XE_OA_FORMAT_PEC32u64_G2,
>+	XE_OA_FORMAT_PEC32u32_G2,
>+	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
>+	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
>+
>+	XE_OA_FORMAT_MAX,
>+};
>+
>+/**
>+ * struct xe_oa_format - Format fields for supported OA formats
>+ */
>+struct xe_oa_format {
>+	u32 counter_select;
>+	int size;
>+	int type;
>+	enum xe_oa_report_header header;
>+	u16 counter_size;
>+	u16 bc_report;
>+};
>+
>+/**
>+ * struct xe_oa - OA device level information
>+ */
>+struct xe_oa {
>+	/** @xe: back pointer to xe device */
>+	struct xe_device *xe;
>+
>+	/** @oa_formats: tracks all OA formats across platforms */
>+	const struct xe_oa_format *oa_formats;
>+
>+#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
>+
>+	/** @format_mask: tracks valid OA formats for a platform */
>+	unsigned long format_mask[FORMAT_MASK_SIZE];
>+};
>+#endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 3539e0781d700..5bfb2d5aba12a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1175,6 +1175,16 @@ enum drm_xe_perf_ioctls {
> 	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
> };
>
>+/** enum drm_xe_oa_format_type - OA format types */
>+enum drm_xe_oa_format_type {
>+	DRM_XE_OA_FMT_TYPE_OAG,
>+	DRM_XE_OA_FMT_TYPE_OAR,
>+	DRM_XE_OA_FMT_TYPE_OAM,
>+	DRM_XE_OA_FMT_TYPE_OAC,
>+	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+	DRM_XE_OA_FMT_TYPE_PEC,
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 2.41.0
>
