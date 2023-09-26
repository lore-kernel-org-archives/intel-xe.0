Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4397E7E63F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E80B10E137;
	Tue, 26 Sep 2023 14:44:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3DD10E137
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695739440; x=1727275440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kGtogI+5iw84C5WQ9nh+f5QnqQmlw0uYOuySfOawAjQ=;
 b=Nx2JSBRxnSOFOmFnbr3B0EqwHxgbthA+A6i15mO323pQNubFN9LWUpBG
 kXU90ylVW+JkRTVJ41TcmhVVTHAsh8hl33gNpQXd338E21yYqPMhwv6yF
 LMBZNpQvOTo8ajnoKIxSl0mXVP7jgYDt4vIMyknk4/k15vibi3Fvu8ZHl
 TAEc5NjygyrgvxDbmqPVWCPHo001fXJIkbYIPoSQvlDO4BSlrUfXjznIb
 Q1lIvlfYltRNFgZtghLk2L8W8twm7ClSeEd9xJ3ZGV/YWmPXUXMbUe7CX
 U3Z3Fp60iAh6DsHX0GdbUrffeaKD6mmTpcxDZkGk+mDl4Y7wL+SbOX6xH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361831917"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="361831917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892210087"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="892210087"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 07:42:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 07:43:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 07:43:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 07:43:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 07:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P941HvpdBMxv9rAKyDVgs6bGeEV5NefQ19FfK+SgZY+YF4LPvXfvamdZ1Uku0jKCykTRTyWCxu4MUt1NZ/jJmNMW0RG/SSylHk/gZ+3IW8ZSbFqBiPplDmIQCVG3TSKTqM5cjOqHswaLV/9akXBU8kvVcR/8hFKnW3w+WAE8sshvsaZylgYmn3n4vulFZB5oSuPz7uuoDweXQELxsj2G/uE/BK5RRHMAjOd9oz9+F6LC+8fAiKXf1ebGK7oBe7J09Wod/1JW1zmTPD1W6Ugqrq2P7TgvrR6eBxGDcskf15+1GBWEV07fOLInZFz+e2af+5pKTcN1IlLnFyNYUThH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHHFsLccBqUyN2Dtds4y3U2WgHZ1HtuYVHZWoSKlGnw=;
 b=co0HL7kEEJpoR/hP6r4TcgeYdbXuxxnHtTKpPTad4FZ5G4jERwkU3+Zvm7jMYUhQUvrGugd7hJ7Jxwkc3FhRNCfPL+0SBjqrwnweSL25ZjDaNXRa3QSYfmIbCBOyPFPRVSDFB+iPAf5bhsjUytnwWbmnUZjYPx6xWfC9BeSBJc2yzMM25q0NQN73PeZ1GUpIfw6yuVgxuGpon6hHn9lxB3OhAE9+ksL0zzf4FhlBzeSjZsSyBQmP4XV/uzP9EeeIh/AUbaiTUYBI8BExUQie0l3LIrbip7V32OiRKtOnnScOCkkIHC+G8i8IohhFRuo+YxOLAo0SQ9QeQ7ivvWNkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7111.namprd11.prod.outlook.com (2603:10b6:806:2b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Tue, 26 Sep
 2023 14:43:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 14:43:56 +0000
Date: Tue, 26 Sep 2023 09:43:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <pimoze2aaab65ggqf7rkacnx75dxe32ltjw5uswnttejlw7wsi@gignzc55kh3u>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-7-lucas.demarchi@intel.com>
 <20230925231443.GC2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925231443.GC2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 08de8ed9-c0d4-46f1-7f22-08dbbe9f02cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4FAEv7FUMZETNBZil36Hbfa9yV7M1u7vMJvlqKNbjlsMDuY9MZ7LgbUTXLYPKcJWG5nXYAqgU4o1NqQid9oxzhL2F4rV1dIoUHqo+DiMBgQ/VrJfya3RsSaIlFS0YyFYhNrxl8xQ03w/uppNZpWECfb2sUx1XeC7YK/a6GP5efJ9hX/d/ZB40xSyiHKx409JpQ59zOAp17GwDM5dBqL9R7GyFNTEUlM02/KLsetMNK0EP3REimnxqtKm1EOEP2ACJtTeLk4xnFu62MweqreN7uUOnoc/AnYhNKv3moPi3/9l8uhtUnJlKrfirGcVQf3vT4b/fJjZ+kNPQJ3cV1wMZc6wgur8gL4mpghAJADsNVVJtTgRMQsP5cf3/z37B+o8qTxq4qJNaKWQnYwbpjXJRs7jh4InGwvJRwP9OqDtdvRg8c4AwlJ5mf1sS4G/oq+RFCsA7e2MyNH95QSDX2wAjQIDwyPIeL1r43eyiNbMnO76XAn0X1UyXkZHurY7SSzmt3BPLC4OdHfY8A4bHC+S9+SuNlYhxZeJ8oey3PSE6UWT3G6wrjR9H0iZGG5okhhr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(33716001)(86362001)(6666004)(5660300002)(26005)(6506007)(66476007)(66556008)(9686003)(66946007)(6512007)(316002)(41300700001)(6636002)(107886003)(8676002)(478600001)(8936002)(4326008)(6862004)(2906002)(82960400001)(6486002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RLHtxaO+0Jhj0VWuAKfmjb3RKqZ71GjFI74+gC6LsNPrASvebDC2r3s7lg1P?=
 =?us-ascii?Q?pW+h2IyKBxWrKlRWD6eoH0MibEcEOtrLflNRhEqbVrF7S1dTix6EhXusB92s?=
 =?us-ascii?Q?uljsIjKhNI5qxgvoNDE5aW9Vhc8w08dhKIvzKfZV2JmtE5nBgnV2Ra3y6hiB?=
 =?us-ascii?Q?XoVTrnvVcRCubKu7lLNm/RFqTeFx2M4OT8X+J19X9MQGbntPEeXOUxrVrt6c?=
 =?us-ascii?Q?rZWKaubyQsW33/Th6y7cM8PeMbJQ2Z/795tR4onFF8HOeV5tHV0DFS231UcW?=
 =?us-ascii?Q?Q2KJvWDbcI/qFuz5K3abCx+ka9lEkxgIZWchBS80rvSqtIgIYCIeh388RhTO?=
 =?us-ascii?Q?C1w5iX9VUEHqBRlTDq1APPFpBBi+wzUYj1k+k8At3QE6gEJdCusJWYelJDZT?=
 =?us-ascii?Q?HjG8aUmwhi8M/nNDsMxQemmWXF724vixtZ8GAVsXPMECbhINAjsbLtQ3MkB6?=
 =?us-ascii?Q?2qqnwA6k5Wp7ctKkpTNBtZ8o1vDht2+8KF7xA/Rg8Uq+a1/EQ/hrAzGdqxLi?=
 =?us-ascii?Q?dudEA33adIdKdXa/XhI3BBFvVG0WR0gQ5IIVhPZItvhnpc6p+2VD1/af8MYo?=
 =?us-ascii?Q?hlE7bDaYinGRQK5WUVI8du0VUu62yc527Tcd7DSdlTPS6xYf4PxMyiUG632W?=
 =?us-ascii?Q?RozwSCamWrBfSZHykHUfayeSSuYuT/1YkJzvLy51C4uU4775GHZWANu7JFzy?=
 =?us-ascii?Q?bXwvM6cgCR8ApyMDBFRuZw+y3ZezNZKVS2IAASGibN7Cy0qVG6KQNUiUTOyJ?=
 =?us-ascii?Q?DgvBY+sLeEWbIl3hqn1Eruks7i10go330KIz4cZLPuoWZ3m7k38Fiyn+LcLI?=
 =?us-ascii?Q?jt7DzgpBo9YMrzOeSqVVSPzaXYV9obOkz7lo9Z2LntWEcU/cQaT8ljcpjp+E?=
 =?us-ascii?Q?NpACf8ymWMWYPywKFMspQ5wsJTLabLgtxyiZDkU8yJH0fByglAIYbOuJ11Yn?=
 =?us-ascii?Q?a+ybXNejzqF668RruStPgF4leeEOlcvinc1PZMfgG8xIa8kuWOjGqawJ7+pw?=
 =?us-ascii?Q?KapUNsC1ebnsm7GMvAwfGkr/9oanUl4sZw+Gl8cP/xRCprTtn/ObriM6ZlSu?=
 =?us-ascii?Q?M1/Y44OD8nKFv6H30OyAlDwcx8yXMTxXg4hLzrR9o1wCLfhhw7wLap6ip34P?=
 =?us-ascii?Q?dtJlf/PzNgX4cmUDawlc8pf+4Rtu92kGoS67oCC3NK6XCd3iZphtQCdf2z6A?=
 =?us-ascii?Q?u1jQmBvt9jLn+uP7ddreahZcCs4iTKSCJ3D4JSiCZbR5D16g4HUIbUXumcaO?=
 =?us-ascii?Q?Axzzk7mpjUbSTYLeHeVAXWpjXlEPOGWEhMDxJzeW+l1QPVlS8tMcPstvMwfx?=
 =?us-ascii?Q?imM18kitu9zzTpAU4bquh8oSaEhkR5sCv9nID7kppQ+HNOw3HrcUGkrNlq29?=
 =?us-ascii?Q?VvX9wbUGcumcv7TtZ0huUI/KMvR6w4TyJ7BRw0T3gXYnNTYXcS0WDdQPJyPC?=
 =?us-ascii?Q?BdJRjIVsc12rmrnuBMbi11UklZN3MM+Qp0xONRTzJ0LMRWVmXmHxTHwtP/pM?=
 =?us-ascii?Q?NIBFA9zet52UsiJvprEyEaf5wDD9WOI+A/Uz755QiLOB+WluYA4NDMLS7Kct?=
 =?us-ascii?Q?ZAa1XlgWP3OOxcZPpkBFCGWuLMMqm7IKdmaLjysy0G8MNSIPtAWvtkxkoDrz?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08de8ed9-c0d4-46f1-7f22-08dbbe9f02cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 14:43:56.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTeIz6+t/ndlsf52gRmGwBaf0KkYWDkDauufnDRdmPgnVAhj2mgP9CpJl1dIj1tzBU8NCAQJ+2mO56UKM1Aw11A9HOUL3+Gigjj+RQ2+KG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7111
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/9] drm/xe/pat: Keep track of relevant
 indexes
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 04:14:43PM -0700, Matt Roper wrote:
>On Mon, Sep 25, 2023 at 03:10:46PM -0700, Lucas De Marchi wrote:
>> Some of the PAT entries are relevant for own driver use, which varies
>> per platform. Let the PAT early initialization set what they should
>> point to so the rest of the driver can use them where needed.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>  drivers/gpu/drm/xe/xe_pat.c          | 9 +++++++++
>>  drivers/gpu/drm/xe/xe_pt_types.h     | 1 +
>>  3 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 98835ee058f5..7d0f2109c23a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -15,6 +15,7 @@
>>  #include "xe_devcoredump_types.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_platform_types.h"
>> +#include "xe_pt_types.h"
>>  #include "xe_pmu.h"
>>  #include "xe_step_types.h"
>>
>> @@ -342,6 +343,7 @@ struct xe_device {
>>  		const u32 *table;
>>  		/** Number of PAT entries */
>>  		int n_entries;
>> +		u32 idx[__XE_CACHE_LEVEL_COUNT];
>>  	} pat;
>>
>>  	/** @d3cold: Encapsulate d3cold related stuff */
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 86386633e206..966b63252735 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -108,14 +108,23 @@ void xe_pat_init_early(struct xe_device *xe)
>>  		xe->pat.ops = &mtl_pat_ops;
>>  		xe->pat.table = mtl_pat_table;
>>  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>> +		xe->pat.idx[XE_CACHE_NONE] = 2;
>> +		xe->pat.idx[XE_CACHE_WT] = 1;
>> +		xe->pat.idx[XE_CACHE_WB] = 3;
>>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>>  		xe->pat.ops = &pvc_pat_ops;
>>  		xe->pat.table = pvc_pat_table;
>>  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>> +		xe->pat.idx[XE_CACHE_NONE] = 0;
>> +		xe->pat.idx[XE_CACHE_WT] = 2;
>> +		xe->pat.idx[XE_CACHE_WB] = 3;
>
>These are the PVC indices, but they're not correct for DG2.  IIRC, DG2
>should be using the same ones as xe_lp below (although it looks like the
>bspec tagging might be messed up right now...)

But that should imply a different table, otherwise the index doesn't
really make much sense. Looking at i915 we have, for DG2:

drivers/gpu/drm/i915/i915_pci.c
	#define TGL_CACHELEVEL \
		.cachelevel_to_pat = { \
			[I915_CACHE_NONE]   = 0, \
			[I915_CACHE_LLC]    = 1, \
			[I915_CACHE_L3_LLC] = 2, \
			[I915_CACHE_WT]     = 3, \
		}

drivers/gpu/drm/i915/gt/intel_gtt.c
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
	intel_gt_mcr_multicast_write_fw(gt, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);

So, it's effectively:
	I915_CACHE_NONE		-> GEN8_PPAT_WB
	I915_CACHE_LLC		-> GEN8_PPAT_WC
	I915_CACHE_L3_LLC	-> GEN8_PPAT_WT
	I915_CACHE_WT		-> GEN8_PPAT_UC

Does this even make sense?

For TGL it is:
	I915_CACHE_NONE		-> GEN8_PPAT_UC
	I915_CACHE_LLC		-> GEN8_PPAT_WB
	I915_CACHE_L3_LLC	-> GEN8_PPAT_WB
	I915_CACHE_WT		-> GEN8_PPAT_WT

.... which seems better. /me confused, maybe I'm reading something wrong
here.

Lucas De Marchi

>
>Matt
>
>>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>>  		xe->pat.ops = &tgl_pat_ops;
>>  		xe->pat.table = tgl_pat_table;
>>  		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>> +		xe->pat.idx[XE_CACHE_NONE] = 3;
>> +		xe->pat.idx[XE_CACHE_WT] = 2;
>> +		xe->pat.idx[XE_CACHE_WB] = 0;
>>  	} else {
>>  		/*
>>  		 * Going forward we expect to need new PAT settings for most
>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>> index 64e3921a0f46..bf5000499251 100644
>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> @@ -17,6 +17,7 @@ enum xe_cache_level {
>>  	XE_CACHE_NONE,
>>  	XE_CACHE_WT,
>>  	XE_CACHE_WB,
>> +	__XE_CACHE_LEVEL_COUNT,
>>  };
>>
>>  #define XE_VM_MAX_LEVEL 4
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
