Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB96C46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 19:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0291610E0AD;
	Tue, 19 Dec 2023 19:10:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6CA10E0AD
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703013040; x=1734549040;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MF4CJKuUp464zGtFPUvF5VQZWFANU8fGxMgW7Tf8qIM=;
 b=F8oENaCDM9Vb7a4Zqzb+BwheAV9G2Dj1DyHfGOaihAZE36PbVenVv+to
 4nRyberoHHV0EPCQ3nUQl8JZIz7xcXyJdi9RFXQSMXYN8pX4a4y9F7zTe
 XstlF8DOm/Vn6+T5rLgfatv/iL99eJWnqlqGc+j/y0Y7m0HfI8R7NXz57
 PLPUfrfq3hr3RoQ96/nUET1n/egP9CVVoHmmyj0l8x/gBE5VXq9b9shWP
 srequ/OxYXPMK87uG5mWRPurXc+FEL/F5d3RFk8oYOFy2MmugncP6oEPx
 jkqJbOEFadQm0DOYwbPIloEPtsuzgMhpiVd86ulxWewmScupyjp7WAmR4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2804288"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2804288"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 11:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="810336763"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="810336763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 11:10:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 11:10:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 11:10:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 11:10:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 11:10:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzVqP9c5XwakCzzBBaLxF4z6gJJm3f9qlw9ljGJJUn9mmDMnAkl5rJ/SLpMwgYr2v5ZMiDMqDzyIf2mahM8E/5GiGNRB1lkSWLB8pfdB1Y5fWB36TYTXNUGLhLxzd5m8JnyxBAAaD8Lta6wJVCEUdCfGtcG5fIrsavTGd3nf24EzShOi7SKTSH2067hPNfyQw6yMdqC6W2HGrqE3/9GDptt4DdETjQWj3EQbCRlpvyaBOv6Odc2GiLzhZKLaGlspw0k1LNbpW93ICA12qYD+300gJ9nm4eQ9gkrCh29I6X8cmLy9jTxHoEzKtCtkbLuzu79qoLjjXxo0dWl0UrzEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIm8Ve35VpSzP+oSXZVGk/c+DSGk2VMvDq+FUNulJKo=;
 b=neJJCF5cF8PYagYhNJA7CH3S9SkKoW+1bmgQhHdLUmy1VZQJcthS3eHZXtmYTpBXo4GpWa3y2Ml+7C6tKgLjGJCHf+wMTTOqQVVy0PJNZbUpLJuTNVRhOv1yN1dUnX86VouMNBwtn9unLwuWKC6HH/ZESD9kYnEzUcox3vkCqTiVlV3HPW2Poz0Jus7O1KN/furs6Xn5go2IA9YhQGEUUInnu5YC4zViTsdRI0RYPwpo5m3bnlJKWvdwnnSDX0jiY6mF2l+W8ufJ8tbCkqIKFBmGrkARpUHE0YOgw435HH9PIkxgk44bcRn3LSg8wP6+U2zHWGGQ+iKXBWYoylS7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 19:10:34 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 19:10:34 +0000
Date: Tue, 19 Dec 2023 11:10:22 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 06/17] drm/xe/oa/uapi: Add/remove OA config perf ops
Message-ID: <ZYHqnlasZsweeh2C@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb06ba6-8a7c-4cd3-eee2-08dc00c62d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vcA2Wb7i4lTpwohr3kKnKktz4h7L1xCBhs/gA456UjS0J4JIWpAb2pZIdNVx5t7DCWeMRag/hJ8ZezMwwlYfWN71R4DfTFbN4PHxOFM9H7wF9nJZjiBXqoh53J0oSD+yNJfUTOhFMiiM1MalG6Iyqw/mCBMlXHs/E1pP5A0iNWL4nYphgue6bVB+Dw0gyuGg6hO2Pzq7tb24Yjp2dtF2QCDVPiQu0Vqqwi5qXU4ukJNWteMJ5GkY1Xx2krcHSL7wt/SV8Op1MddX1m+tYdH7zeFTy/JBpQHdjUYHEREsMJeutB96jEOufoh81D62GqmpFARLhegnKcpmwic7+76NGBFu26CiUeXLdpZ2hcUA6Pl/qACNg1IRvAaQgltg/EJK+3tIowwA9RmKDReqra7tkoePnfDSw44oBeEn/FPPAOobqEGf4fSIuwCi87glNAub+NJvd6LT0wIYmrLwnxWJhZTFKcdaMLY/ZgB16BTU58eTH8jVsPEjkbF7ZegHl2WjaPhsCbw/gEofvpNK/KjIfhwUnVN5XE/fS0/Caz0RnRAFvhI88fTj0qX/cM39OT9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(6506007)(9686003)(6666004)(6512007)(5660300002)(2906002)(66556008)(83380400001)(30864003)(8936002)(8676002)(4326008)(33716001)(478600001)(6862004)(41300700001)(6486002)(6636002)(66946007)(316002)(66476007)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHFhV29YUnhtOTNhTU4wbzVka1NBM0YxVjFEeHdFOXU3cmkxQWd6NjVXOVFl?=
 =?utf-8?B?OXZxS0ZRR1lEMUhycVBMVXFUUUNPbjRwNTdUQ2tqNG1WeUtONC9FT2k2ODRO?=
 =?utf-8?B?VnE5TXFIOXNXb3ZBYk1ieXA2YnVxVExpa3hJSElCRHQ3NCtObzNwbTVodGlz?=
 =?utf-8?B?UWxLWnVMZ2hwSmJpR3VlakJtOUwyNlErYTRaS3l1MmVVajNRd2RQNGtBTWR1?=
 =?utf-8?B?V05oMnJhcWI4dXRXR0xJY3JLVUpmUldNdWxnb2EyWW5nQXh6Vk1MTldrOG9Y?=
 =?utf-8?B?cGIvOTFaTGNDSEt1cy9DYXFmZ3llVDF0dElQbmNtYU42N3VQL2hZeE1VbFRU?=
 =?utf-8?B?MXdvenBTT04yS2EzN25uazlaYllxNnNneUs1ZGNuL0pLVDl6UmRRTXp1WWp3?=
 =?utf-8?B?RlpBSU03K3VZUUM5cVd6VktGYWpOK0g0RmtTRzIyTUNhUjlQWnNUcm5JRkNn?=
 =?utf-8?B?U2kzdnVoNURXenlWQ3Z5WWN5Z1BNSUs2b2JBNGM5eE14dzg2dUpxM2Z2M1Ny?=
 =?utf-8?B?ZjN6TzZkWi8yYW5sald6eGZtRlE2cnVDQlpybG9yMS9PUlR0cEt3NmtyRlF5?=
 =?utf-8?B?OHNjck5QSHBsV0xFRGJ2WHRDcUFVZVMzK2NGNlV4Zm16dFY3R1V4UUd2Mkpj?=
 =?utf-8?B?ZkRnWm0vVjdQNHd4S2RtdllncWJtT1RKRDcrcDlpVW5WS0tpSkhxeXAxSkNo?=
 =?utf-8?B?NmhKbWpZTjZIOGtPMnlVVjEwMzBxa0JDQzFKU0hBbnFkQ1NHNUt6WXh2aU5I?=
 =?utf-8?B?cWpuRUJQWE5hTHk5cDlzdUoxWnV3Z1VWMitNeUNsVVYxb3dCMlIvaUpqQXEz?=
 =?utf-8?B?RlE2Ym5GbENIZzRWbkhqeTlSaXpZRDI1L3BOTWFjS2Y3U1hsS3Y5T3NZOFZQ?=
 =?utf-8?B?QUp1bmR5NzZWOVZBd1FabytienVxRG9ObldrQ3lkN3Q5emFKNDZPdFFnQWxt?=
 =?utf-8?B?REt4eDYzek1NbXRtMVFBL3ZPdE9ya3lMVGNtaXlRMlYzaEE4cHlxa0QvRzJk?=
 =?utf-8?B?VVd1U3F0MEZlV3NOeHc1Z0JVVEFqRkRDZnBhQ0FPTXVTNW5RQ1JLL1RrWThv?=
 =?utf-8?B?K2xPYStEbHJNbnlzS1BLcURPanhtQUtHRDdVWFc3S0RNNVdkU3RuR3NpcGts?=
 =?utf-8?B?M2NHak16dzlzeWd0THhTVGlhWDlISU0zR1E0Q09iUHVoeHJ0aFprT2ZtanA5?=
 =?utf-8?B?Um84NU0yTWpWMlBvZnJuQWltZXFVS2NzZ2lWVlkxZUROM2p6YzRvOHJWaWts?=
 =?utf-8?B?bUw0NXl4WkxzS2FyT2lFbjZpeVBnR3VRckUyNGtVRlpaSUNSSVRObDN2RDhj?=
 =?utf-8?B?SnZUdjdHODF1bzV0TEMvdTBDcFo1QlpLRVU5Z2UzbVJpcnNROUNIK1ViK2Qv?=
 =?utf-8?B?WXNwTWF5amVOTFc4MGFGN0lMNm9HSjJ1K0xiQnk1a1ZmOXdYWnNsSXRMTHgv?=
 =?utf-8?B?V01UOWFOQkwwSGZzWWtDM1RnczJQZ05UVUpGMVBDMjVLUU4yek9kN0xyRkln?=
 =?utf-8?B?RmlkcTFxYkdBVkszaEtSUGFrcWV0eG9UL3V1WFpVaERRSUoxZk0zVFpxZWJL?=
 =?utf-8?B?ZkV3amdaZmxBRWJ5eGJqaUdOYS9DeTR2YkxUSXRLUEk1NnMxUjhrdlZRYjdG?=
 =?utf-8?B?NndOYXV1b2ZuTHkyQWxWNEtZRWtTaW1lS1NyTmZ6dGFRd1U3bU5OMTN0cjBJ?=
 =?utf-8?B?L2wxQ1doU1Nyc3FUcmdiMHRWbXhJN1FlYjMwMTR1eDNGWjNTQnhEdzVqeGkx?=
 =?utf-8?B?Ni84WXFZd3lFWHFkbjNhSm56eTNBS1MvNUxhblhwQ3kzTUZ6Vkk4Y3Q4YUE4?=
 =?utf-8?B?ZU5iYUhwRFJ1NG85U0RmSm1wcWY3czF0STJ0eDUwaHB1akVKTUtnSTltWkoz?=
 =?utf-8?B?cnY1VE5tQURsZFlIU3FsOExVQnpVL0NVUjZhbWI2dkYwQUlVOGgrd3ozOWh3?=
 =?utf-8?B?VzhBNjV0ekVWUGhIMU56VGV5dERmSTdSaVN1SzdObGtCWEJvckVsM1lUNTlq?=
 =?utf-8?B?bjJIL21iV3NKWVhYeDFKc09CQmtQQnpCMDVxWVBkc296T0RtRVVucTRVeXVS?=
 =?utf-8?B?VHl1S3ZoRmlwUTYyMEtkVUxtSjc3ekdCeG5SWEdnUEt5anhabGRYQ2h3L29a?=
 =?utf-8?B?aE9mRG9iNmc3dUtLN3J6WFYya0hobEhpVjZjUFBJZk1aSEJ4VENDajNaRm9F?=
 =?utf-8?Q?qBaeVoimRdrqv+E69KmUaNs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb06ba6-8a7c-4cd3-eee2-08dc00c62d10
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 19:10:34.1719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9aazFhXCXobTCFZU2c51h8I4jmdz2wZ9UfCRpGZ6SUK0gQk8Xs5K9ZjCdbqOKce1HE1RzaH2sUiRSX3xucGqR3IH/K8Pq3sJHTcIt+VzLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

On Thu, Dec 07, 2023 at 10:43:18PM -0800, Ashutosh Dixit wrote:
>Introduce add/remove config perf ops for OA. OA configurations consist of a
>set of event/counter select register address/value pairs. The add_config
>perf op validates and stores such configurations and also exposes them in
>the metrics sysfs. These configurations will be programmed to OA unit HW
>when an OA stream using a configuration is opened. The OA stream can also
>switch to other stored configurations.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c   |   4 +
> drivers/gpu/drm/xe/xe_oa.c       | 406 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h       |   9 +
> drivers/gpu/drm/xe/xe_oa_types.h |  10 +
> drivers/gpu/drm/xe/xe_perf.c     |  16 ++
> include/uapi/drm/xe_drm.h        |  25 ++
> 6 files changed, 470 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 744d573eb2720..23fdd045b470a 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -495,6 +495,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_display_register(xe);
>
>+	xe_oa_register(xe);
>+
> 	xe_debugfs_register(xe);
>
> 	xe_pmu_register(&xe->pmu);
>@@ -527,6 +529,8 @@ static void xe_device_remove_display(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	xe_oa_unregister(xe);
>+
> 	xe_device_remove_display(xe);
>
> 	xe_display_fini(xe);
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 5ad3c9c78b4e9..6a903bf4f87d1 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -10,6 +10,7 @@
> #include "xe_gt.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>+#include "xe_perf.h"
>
> static int xe_oa_sample_rate_hard_limit;
> static u32 xe_oa_max_sample_rate = 100000;
>@@ -23,6 +24,28 @@ enum {
> 	XE_OA_UNIT_INVALID = U32_MAX,
> };
>
>+struct xe_oa_reg {
>+	struct xe_reg addr;
>+	u32 value;
>+};
>+
>+struct xe_oa_config {
>+	struct xe_oa *oa;
>+
>+	char uuid[UUID_STRING_LEN + 1];
>+	int id;
>+
>+	const struct xe_oa_reg *regs;
>+	u32 regs_len;
>+
>+	struct attribute_group sysfs_metric;
>+	struct attribute *attrs[2];
>+	struct kobj_attribute sysfs_metric_id;
>+
>+	struct kref ref;
>+	struct rcu_head rcu;
>+};
>+
> #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>
> static const struct xe_oa_format oa_formats[] = {
>@@ -47,6 +70,377 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> };
>
>+static void xe_oa_config_release(struct kref *ref)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(ref, typeof(*oa_config), ref);
>+
>+	kfree(oa_config->regs);
>+
>+	kfree_rcu(oa_config, rcu);
>+}
>+
>+static void xe_oa_config_put(struct xe_oa_config *oa_config)
>+{
>+	if (!oa_config)
>+		return;
>+
>+	kref_put(&oa_config->ref, xe_oa_config_release);
>+}
>+
>+static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
>+{
>+	static const struct xe_reg flex_eu_regs[] = {
>+		EU_PERF_CNTL0,
>+		EU_PERF_CNTL1,
>+		EU_PERF_CNTL2,
>+		EU_PERF_CNTL3,
>+		EU_PERF_CNTL4,
>+		EU_PERF_CNTL5,
>+		EU_PERF_CNTL6,
>+	};
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(flex_eu_regs); i++) {
>+		if (flex_eu_regs[i].addr == addr)
>+			return true;
>+	}
>+	return false;
>+}
>+
>+static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
>+{
>+	while (table->start || table->end) {

nit: why not start && end? I would expect both start and end defined for 
a range.
>+		if (addr >= table->start && addr <= table->end)
>+			return true;
>+
>+		table++;
>+	}
>+
>+	return false;
>+}
>+
>+static const struct xe_mmio_range xehp_oa_b_counters[] = {
>+	{ .start = 0xdc48, .end = 0xdc48 },	/* OAA_ENABLE_REG */
>+	{ .start = 0xdd00, .end = 0xdd48 },	/* OAG_LCE0_0 - OAA_LENABLE_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_b_counters[] = {
>+	{ .start = 0x2b2c, .end = 0x2b2c },	/* OAG_OA_PESS */
>+	{ .start = 0xd900, .end = 0xd91c },	/* OAG_OASTARTTRIG[1-8] */
>+	{ .start = 0xd920, .end = 0xd93c },	/* OAG_OAREPORTTRIG1[1-8] */
>+	{ .start = 0xd940, .end = 0xd97c },	/* OAG_CEC[0-7][0-1] */
>+	{ .start = 0xdc00, .end = 0xdc3c },	/* OAG_SCEC[0-7][0-1] */
>+	{ .start = 0xdc40, .end = 0xdc40 },	/* OAG_SPCTR_CNF */
>+	{ .start = 0xdc44, .end = 0xdc44 },	/* OAA_DBG_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range mtl_oam_b_counters[] = {
>+	{ .start = 0x393000, .end = 0x39301c },	/* OAM_STARTTRIG1[1-8] */
>+	{ .start = 0x393020, .end = 0x39303c },	/* OAM_REPORTTRIG1[1-8] */
>+	{ .start = 0x393040, .end = 0x39307c },	/* OAM_CEC[0-7][0-1] */
>+	{ .start = 0x393200, .end = 0x39323C },	/* MPES[0-7] */
>+	{}
>+};
>+
>+static const struct xe_mmio_range xe2_oa_b_counters[] = {
>+	{ .start = 0x393200, .end = 0x39323C },	/* MPES_0_MPES_SAG - MPES_7_UPPER_MPES_SAG */
>+	{ .start = 0x394200, .end = 0x39423C },	/* MPES_0_MPES_SCMI0 - MPES_7_UPPER_MPES_SCMI0 */
>+	{ .start = 0x394A00, .end = 0x394A3C },	/* MPES_0_MPES_SCMI1 - MPES_7_UPPER_MPES_SCMI1 */
>+	{},
>+};
>+
>+static bool xe_oa_is_valid_b_counter_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_reg_in_range_table(addr, xehp_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, gen12_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, mtl_oam_b_counters) ||
>+		(GRAPHICS_VER(oa->xe) >= 20 &&
>+		 xe_oa_reg_in_range_table(addr, xe2_oa_b_counters));
>+}
>+
>+static const struct xe_mmio_range mtl_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },	/* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },	/* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x38d100, .end = 0x38d114},	/* VISACTL */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },     /* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },     /* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x20cc, .end = 0x20cc },	/* WAIT_FOR_RC6_EXIT */
>+	{}
>+};
>+
>+static const struct xe_mmio_range xe2_oa_mux_regs[] = {
>+	{ .start = 0x13000,  .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
>+	{},
>+};
>+
>+static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
>+{
>+	if (GRAPHICS_VER(oa->xe) >= 20)
>+		return xe_oa_reg_in_range_table(addr, xe2_oa_mux_regs);
>+	else if (GRAPHICS_VERx100(oa->xe) >= 1270)
>+		return xe_oa_reg_in_range_table(addr, mtl_oa_mux_regs);
>+	else
>+		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
>+}
>+
>+static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_is_valid_flex_addr(oa, addr) ||
>+		xe_oa_is_valid_b_counter_addr(oa, addr) ||
>+		xe_oa_is_valid_mux_addr(oa, addr);
>+}
>+
>+static struct xe_oa_reg *
>+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>+		 u32 __user *regs, u32 n_regs)
>+{
>+	struct xe_oa_reg *oa_regs;
>+	int err;
>+	u32 i;
>+
>+	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
>+	if (!oa_regs)
>+		return ERR_PTR(-ENOMEM);
>+
>+	for (i = 0; i < n_regs; i++) {
>+		u32 addr, value;
>+
>+		err = get_user(addr, regs);
>+		if (err)
>+			goto addr_err;
>+
>+		if (!is_valid(oa, addr)) {
>+			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
>+			err = -EINVAL;
>+			goto addr_err;
>+		}
>+
>+		err = get_user(value, regs + 1);
>+		if (err)
>+			goto addr_err;
>+
>+		oa_regs[i].addr = XE_REG(addr);
>+		oa_regs[i].value = value;
>+
>+		regs += 2;
>+	}
>+
>+	return oa_regs;
>+
>+addr_err:
>+	kfree(oa_regs);
>+	return ERR_PTR(err);
>+}
>+
>+static ssize_t show_dynamic_id(struct kobject *kobj,
>+			       struct kobj_attribute *attr,
>+			       char *buf)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(attr, typeof(*oa_config), sysfs_metric_id);
>+
>+	return sprintf(buf, "%d\n", oa_config->id);
>+}
>+
>+static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
>+					 struct xe_oa_config *oa_config)
>+{
>+	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
>+	oa_config->sysfs_metric_id.attr.name = "id";
>+	oa_config->sysfs_metric_id.attr.mode = 0444;
>+	oa_config->sysfs_metric_id.show = show_dynamic_id;
>+	oa_config->sysfs_metric_id.store = NULL;
>+
>+	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
>+	oa_config->attrs[1] = NULL;
>+
>+	oa_config->sysfs_metric.name = oa_config->uuid;
>+	oa_config->sysfs_metric.attrs = oa_config->attrs;
>+
>+	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+}
>+
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct drm_xe_oa_config param;
>+	struct drm_xe_oa_config *arg = &param;
>+	struct xe_oa_config *oa_config, *tmp;
>+	struct xe_oa_reg *regs;
>+	int err, id;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	err = __copy_from_user(&param, data, sizeof(param));
>+	if (XE_IOCTL_DBG(oa->xe, err))
>+		return -EFAULT;
>+
>+	if (!arg->regs_ptr || !arg->n_regs) {
>+		drm_dbg(&oa->xe->drm, "No OA registers given\n");
>+		return -EINVAL;
>+	}
>+
>+	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
>+	if (!oa_config)
>+		return -ENOMEM;
>+
>+	oa_config->oa = oa;
>+	kref_init(&oa_config->ref);
>+
>+	if (!uuid_is_valid(arg->uuid)) {
>+		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
>+		err = -EINVAL;
>+		goto reg_err;
>+	}
>+
>+	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
>+	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>+
>+	oa_config->regs_len = arg->n_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
>+				u64_to_user_ptr(arg->regs_ptr),
>+				arg->n_regs);
>+	if (IS_ERR(regs)) {
>+		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
>+		err = PTR_ERR(regs);
>+		goto reg_err;
>+	}
>+	oa_config->regs = regs;
>+
>+	err = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (err)
>+		goto reg_err;
>+
>+	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
>+	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
>+		if (!strcmp(tmp->uuid, oa_config->uuid)) {
>+			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
>+			err = -EADDRINUSE;
>+			goto sysfs_err;
>+		}
>+	}
>+
>+	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
>+	if (err) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		goto sysfs_err;
>+	}
>+
>+	/* Config id 0 is invalid, id 1 for kernel stored test config */

kernel doesn't store a test config anymore, so the comment can be 
updated. You can start with 1 below though, but that's up to you.

>+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 2, 0, GFP_KERNEL);
>+	if (oa_config->id < 0) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		err = oa_config->id;
>+		goto sysfs_err;
>+	}
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	return oa_config->id;
>+
>+sysfs_err:
>+	mutex_unlock(&oa->metrics_lock);
>+reg_err:
>+	xe_oa_config_put(oa_config);
>+	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
>+	return err;
>+}
>+
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct xe_oa_config *oa_config;
>+	u64 arg, *ptr = data;
>+	int ret;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	ret = get_user(arg, ptr);
>+	if (XE_IOCTL_DBG(oa->xe, ret))
>+		return ret;
>+
>+	ret = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (ret)
>+		return ret;
>+
>+	oa_config = idr_find(&oa->metrics_idr, arg);
>+	if (!oa_config) {
>+		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
>+		ret = -ENOENT;
>+		goto err_unlock;
>+	}
>+
>+	WARN_ON(arg != oa_config->id);
>+
>+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+	idr_remove(&oa->metrics_idr, arg);
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	xe_oa_config_put(oa_config);
>+
>+	return 0;
>+
>+err_unlock:
>+	mutex_unlock(&oa->metrics_lock);
>+	return ret;
>+}
>+
>+void xe_oa_register(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	oa->metrics_kobj = kobject_create_and_add("metrics",
>+						  &xe->drm.primary->kdev->kobj);
>+}
>+
>+void xe_oa_unregister(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->metrics_kobj)
>+		return;
>+
>+	kobject_put(oa->metrics_kobj);
>+	oa->metrics_kobj = NULL;
>+}
>+
> static u32 num_oa_units_per_gt(struct xe_gt *gt)
> {
> 	return 1;
>@@ -259,6 +653,9 @@ int xe_oa_init(struct xe_device *xe)
> 	/* Choose a representative limit */
> 	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
>
>+	mutex_init(&oa->metrics_lock);
>+	idr_init_base(&oa->metrics_idr, 1);
>+
> 	ret = xe_oa_init_oa_units(oa);
> 	if (ret) {
> 		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>@@ -272,6 +669,12 @@ int xe_oa_init(struct xe_device *xe)
> 	return ret;
> }
>
>+static int destroy_config(int id, void *p, void *data)
>+{
>+	xe_oa_config_put(p);
>+	return 0;
>+}
>+
> void xe_oa_fini(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>@@ -284,6 +687,9 @@ void xe_oa_fini(struct xe_device *xe)
> 	for_each_gt(gt, xe, i)
> 		kfree(gt->oa.oa_unit);
>
>+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
>+	idr_destroy(&oa->metrics_idr);
>+
> 	oa->xe = NULL;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index 2145c73176953..e4863f8681b14 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -8,11 +8,20 @@
>
> #include "xe_oa_types.h"
>
>+struct drm_device;
>+struct drm_file;
> struct xe_device;
>
> int xe_oa_init(struct xe_device *xe);
> void xe_oa_fini(struct xe_device *xe);
>+void xe_oa_register(struct xe_device *xe);
>+void xe_oa_unregister(struct xe_device *xe);
> int xe_oa_sysctl_register(void);
> void xe_oa_sysctl_unregister(void);
>
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file);
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 8f8cf6a2bf556..2985443df3080 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_OA_TYPES_H_
> #define _XE_OA_TYPES_H__
>
>+#include <linux/idr.h>
> #include <linux/math.h>
> #include <linux/types.h>
> #include <linux/mutex.h>
>@@ -120,6 +121,15 @@ struct xe_oa {
> 	/** @xe: back pointer to xe device */
> 	struct xe_device *xe;
>
>+	/** @metrics_kobj: kobj for metrics sysfs */
>+	struct kobject *metrics_kobj;
>+
>+	/** @metrics_lock: lock protecting add/remove configs */
>+	struct mutex metrics_lock;
>+
>+	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
>+	struct idr metrics_idr;
>+
> 	/** @oa_formats: tracks all OA formats across platforms */
> 	const struct xe_oa_format *oa_formats;
>
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>index 37538e98dcc04..2aee4c7989486 100644
>--- a/drivers/gpu/drm/xe/xe_perf.c
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -6,11 +6,25 @@
> #include <linux/errno.h>
> #include <linux/sysctl.h>
>
>+#include "xe_oa.h"
> #include "xe_perf.h"
>
> u32 xe_perf_stream_paranoid = true;
> static struct ctl_table_header *sysctl_header;
>
>+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>+		       struct drm_file *file)
>+{
>+	switch (arg->perf_op) {
>+	case DRM_XE_PERF_OP_ADD_CONFIG:
>+		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
>+	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>+		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
> int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> {
> 	struct drm_xe_perf_param *arg = data;
>@@ -19,6 +33,8 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 		return -EINVAL;
>
> 	switch (arg->perf_type) {
>+	case DRM_XE_PERF_TYPE_OA:
>+		return xe_oa_ioctl(dev, arg, file);
> 	default:
> 		return -EINVAL;
> 	}
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 778862a5b76d4..f17134828c093 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1126,6 +1126,7 @@ struct drm_xe_wait_user_fence {
>  * enum drm_xe_perf_type - Perf stream types
>  */
> enum drm_xe_perf_type {
>+	DRM_XE_PERF_TYPE_OA,
> 	DRM_XE_PERF_TYPE_MAX,
> };
>
>@@ -1191,6 +1192,30 @@ enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_PEC,
> };
>
>+/**
>+ * struct drm_xe_oa_config - OA metric configuration
>+ *
>+ * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>+ * particular config can be specified when opening an OA stream using
>+ * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>+ */
>+struct drm_xe_oa_config {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** * @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
>+	char uuid[36];
>+
>+	/** @n_regs: Number of regs in @regs_ptr */
>+	__u32 n_regs;
>+
>+	/**
>+	 * @regs_ptr: Pointer to (register address, value) pairs for OA config
>+	 * registers. Expected length of buffer is: (2 * sizeof(u32) * @n_regs).
>+	 */
>+	__u64 regs_ptr;
>+};

minor nits above, otherwise lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Umesh
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
