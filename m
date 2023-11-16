Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A9C54E76
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 23:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B62F10E040;
	Thu, 16 Nov 2023 23:01:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06F210E040
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 23:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700175704; x=1731711704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=saYACA5QaZTMi77UyEnox8F3OyVmwMo45EpTlyHdtKE=;
 b=IC6UfI3ZIzNTwGUQaqIxtqY306Lkv25tmW8Vtm6Ix6lwMXl6pN9zITiM
 ZFPyJGMOuGJKLz03P4W98NMbRkitBgB8h/39c5KUfw1eBJe++FwJNYvKq
 Ha6YAAzpile61X3LONLAIpYhDKQGFz2QGqOGgBUGaMHyPwK8e9iGSYCuX
 vDRL94AucDcFYsqCjYiMWFKLvbC53K53whcgD+YTgHs5OB7+SovnQTv8V
 E5sDfypT1DuQV6bYKuJghdjU30WWnl49dgqgdQszONUWVGBdDT9sEuRp2
 nbTLP6nzW311Y4PugT+fhMTs9DA5ZnJQtw1NLiETjzrOgz0kUGKsD2G+3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395122227"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="395122227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769060338"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="769060338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:01:43 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:01:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:01:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:01:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0gwEZgTpGqPJIFBsxAPPjOUMJxEUkwPEV/fnAlXiWoT4ahBzi/6G6Bc75uBqO/SCHTiTGhlMJUEFoepCqhb9+Q0e5q533P+VYoevA9zgFuKmEPAzz/RlkT7ka5slXp4Ugxx9LmD8Criixmip/v7lWZZ07CLeKebwQlHT1s3GOLaMhpDsw9EgrE9cRiYJ8H5U5we6BY9LMuStrneHxG7LbWm4qBDjXSCnWVw2bF5xSGnuS4TMLLyTZZud+d5EbowdXGvKj/lQ98HH3O0oUs3Tuz+KKcZWPx43vrmospR72l4ZWrRAx+CClncv/hIsBOVrVIDoUxSyzAKzDXK0GMXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4/qhZA051CNzY7rcjxu2xBpgmHjJ0JLWriT8iF8d1M=;
 b=M2RwPB3RYPQQ3wDEX4O6N1tPz+PzCzs2o+3Gwlr2BEkSlpEhQF7r/KK38BxgKGaVJTlwnTrH08t/9nGxhXdwhPzkaqZY57l66lwshRa4NP1xquMnlbkKO3BYg901SEZnyhdWuiKbNaDIuOumWGRXkfb09Y6MDzjYCZJksnSmwQ2geK4Y89HAp2HXPRnCjD6R6ywV9X+RahCJedZ+1XJ2LPwenpyE7JKiWlEJ31OAl5FyWaltMpM+s6IcOO9egZtppFit01upjC2Dazzy6ukfNmbr9JNkd1MSAnwLb2udEo1NmTx6kfdFiXh/klFM+cF43KabEmNzffK4e0iinCPSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 23:01:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 23:01:39 +0000
Message-ID: <ba85c278-d9f3-4b74-a46d-0b144ccd8007@intel.com>
Date: Thu, 16 Nov 2023 15:01:36 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-5-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0340.namprd04.prod.outlook.com
 (2603:10b6:303:8a::15) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ee3a05-f365-4225-ea98-08dbe6f7fdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/zobC0Imz4fE+NOTnvMixfOYQri8+RetRIb9zGzqbA20Sk+KsPIrxX8XKMjmJUaiscNDVb+EkqhH6HxeUUhlQuJ40oiNK33AX3oFEW/PIawwStSamuRBInVOqxfpPck06Qnse1xYHAwAOaVQpj6jx4hPU7J22zWj+3owjNLEklMSe3Y5Ku64WM64MFFDkERPYywg/Uuysp6KofznzcchUn0mlILuJqrXjFiI8RkJYB0dex1OAxcEYDDsSdxU5JyY6g17ZHsRXuLllF9MOeDKLrWGBvlrY2NBVCuPaQZRgzMjr13l8u31NKsPEMhJLZAac0xEgqT3q7/8Sytx1gLPBIeVp/GuO3YaSvoe/biBC2Qyuo2xXuApMUlskmN96VJ6NUHXFcGFbBc/FwcGGGIlyl4GO2QiERbfkbT6g26BwaC7JQROXJ22ClfQRQH6tKflcLEnfewsYDcnSadLmU7chGcMHALt88x4S5TLmggcuIM53zuNmwcKrEx+rvwUZo+4On6BqvI0uXxlJYDIh1Pza5xKILoWJTRlDj0rVuxTIEzJKdST0CRwjqIeyZ31RCBCUJNfoZbHLxZCyqf9NPrlg4mpIL5m2vlNruvCzH2B06ZarR+ToH86HxAdrdkiEiHavuTTNuUTe/QofmfXFXPPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(31686004)(83380400001)(82960400001)(107886003)(36756003)(53546011)(6512007)(6506007)(26005)(6666004)(478600001)(2616005)(6486002)(86362001)(5660300002)(41300700001)(66476007)(66946007)(54906003)(66556008)(316002)(8676002)(8936002)(4326008)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tlN1I0NDdJcy91MWJRTGhYVURnbjVrczNndm05Z1ZGWEcrcDRYV0FoRkln?=
 =?utf-8?B?QlhJMDJ4SktFRGw2QVFNWHAwSEQ0OEFWZXY4TEd2K3czUzdITzJ3NVJtTmhX?=
 =?utf-8?B?SkRwRVBoN0JsYXFSeTJsaTRGUXJDWDFMN0RoWjNZUTRDT1JEYmxPU0Y2RTE5?=
 =?utf-8?B?K2VkOGd5NjVNdC9nUkVpZG9TRVRyUHVLb3B0WkJyS25SMzVGS3FqS0trcytx?=
 =?utf-8?B?aG9yb1VEdnB6RVQrRjdacElNM2o4NW9jSFpONjkxRmFvYVJuWXF1T1FnZFVm?=
 =?utf-8?B?NFF3TW1GcDQ5aVBCVnNWZ3BrL1JnOTNVNEFNZUhFWVRWV0c4YUtCMXlNWTha?=
 =?utf-8?B?eVMzYWZqblFVOEZqdnI4V0tkSWh5TGhOcjJ4cWJBcWU5UHpYbkZEVXk5ZVR0?=
 =?utf-8?B?M2RHYzIwOEZURUVsYm4wbUhzdlhVSVloM2pjVHIzSnNia2tSMDhDVzdXN09l?=
 =?utf-8?B?Z0M1N2dJTHBDdmttQ2ZLQXRPOVArV0FEMXpYR21ZNC9JUEliTTJSYklsMzdY?=
 =?utf-8?B?RnFHR3FyRy9BT1lNTDBFT2t2c2RmV0NBVnFQTWV6NUp0M0h6aWJpaGQ4ZHp6?=
 =?utf-8?B?NXdJTThNNTdtTEtoY0lIaTdPMXN6d3l2bTZpeG8rV0pqWDc1QmxuOWFjWFpa?=
 =?utf-8?B?djhCdE15YmIwSlVsZDRZTFQ3R1Z5bjFYcVJUeURja2ZXSXpuQTNNVXFySTYy?=
 =?utf-8?B?bjd5T0dIMEQ2a3o3T2svb2pJMEF2b1h1czIrT2FndnpkeEwwK21heXR0QTFT?=
 =?utf-8?B?eHh2UFpGcTUwM0dmbG1JeWNlUTllRjBQZUE3K3J3eGJHWVM5TkxmT2VDcS9p?=
 =?utf-8?B?SGp0eWVHc2JhbmVPQ2QrS0FqTzJQRlBKaFNldUMxa1YwSU4walJuK0FaY2JX?=
 =?utf-8?B?RFZYRk93Z1FtUXBjUWZUSnZITmJRb2NoemJwaFVnQUt3MGVKYkVvWGxHRFhm?=
 =?utf-8?B?a3ZmM2twNDhXbkZBT3lpbHZsR2Zra1VQTUxkNWY5Qk1Ba0tob0RpUEt4Q2tl?=
 =?utf-8?B?d1l4STJZR1piNlplRVJNNmpsTDFiTE5hWmV2NW5SZEFZaHZrNTBQWjhPMXU3?=
 =?utf-8?B?WGRNKy82RlBXWWVXZS92Y1g5ZVMzMW9YdXlBQTI1S0plT2hESWJWYXUrVEZr?=
 =?utf-8?B?Q0tuY1VIdTdOVG1RcDI5VkxLRzNOZlFMNjZ2TXhQWUFreldGNWRrQmdoVXZB?=
 =?utf-8?B?bUN0WWlmT0VHaFpWeXV3RnByNkc2TmQxYVF3UTltaFhLSnplZDQ0YkF5UlJY?=
 =?utf-8?B?QlFmVmErRHlLekpNWkw5WkJlOUJzUlRPV0tQSnBJWk9uL3AyRDJjQnhKc0tp?=
 =?utf-8?B?V2NzRkk0cVNtRnZkRFpSUzA3OGhuT0Q4SmpnSFA5TnJSTElmcWE0T3RiQ0J5?=
 =?utf-8?B?WXNMdWd3bzZxYXg1ZFpOUzBGVjd2dnlVSFBDV0FiSkZ2eUJ1NEFUVEtkcGND?=
 =?utf-8?B?bjkrNFFoZXVWMHpXWVlWWm5zZVBmWmlndzk3c0g4OHc4YXoyY0d5WUpmMm1V?=
 =?utf-8?B?UFgxbEZLd09oQ2xPUFdtN3pVRHlCdEhpUHBkSG1IcGE2bGhBUlZRRnhCcTBZ?=
 =?utf-8?B?VW5DSTY3WENWWGMxVHZ2aURKOXUxR3dkTXh4bWRydjR1bHVVYk42U3Q3NGph?=
 =?utf-8?B?SmZidnVhMGowZ1hsdlJRb0Z3RS85TUN5bE5WdXRLVkVUc3AyZmxmQ1hrWnU0?=
 =?utf-8?B?YW9DSFFDVW9JVUVlZVNzS0p4bldqdlVZMERDVnZIVFU4MG1oM21YSVptYWVr?=
 =?utf-8?B?M1dHK2ZiWVhybm1aU1hXdE11UXYxbFpiN0ZqbVFXMGJudVRhMzk0eVMxckx5?=
 =?utf-8?B?NG9XdE5WQkN6cXhiRTdGTUpMMjE2b24wMkRnS0NGNnMrR244MjhZT2REZERt?=
 =?utf-8?B?SDUreU9QdUQ5NmkwS2kvQU1yQ1V6ek5qSXNxUlpVbkpMTDNGak5uaHBhQWdP?=
 =?utf-8?B?SENtTGVQTlRoc1VuYjV0ci80WHNnUFNZQXB4OUZxTnNEcWQrWFo0L1NNNENn?=
 =?utf-8?B?MTlOSlA5bnNISFdSakRoNlR5WXcxTzl2TGRjVVprZDF4N0ZlQjdMcHlVVU9q?=
 =?utf-8?B?ZGJKUlNpeXNvaWh0bk8xM0lPM045WDF2aWxEN0RyTVlYR0lEQVRtNHN0QlFL?=
 =?utf-8?B?YVJ5MUxCRnRZODdaOFphbTg1TGVZNjVFOFdCN3dVeGFKc1o2V2RRSUgzUUlH?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ee3a05-f365-4225-ea98-08dbe6f7fdab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 23:01:39.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfaVWpSXGjZ4H2IR2nHZ2CPGDaKghANSo9nmI9sQcI3aZ+xdaEQCxihOdmRZCK2r7EwYWxFuJdpAX6XJjKbh7jvafi0Fhc3Pu58Q9pB7iFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/11] drm/xe/gsc: Parse GSC FW header
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> The GSC blob starts with a layout header, from which we can move to the
> boot directory, which in turns allows us to find the CPD. The CPD uses
> the same format as the one in the HuC binary, so we can re-use the same
> parsing code to get to the manifest, which contains the release and
> security versions of the FW.
>
> v2: Fix comments in struct definition (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gsc_types.h |   3 +
>   drivers/gpu/drm/xe/xe_uc_fw.c     |  77 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 113 ++++++++++++++++++++++++++++++
>   3 files changed, 193 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 135f156e3736..1bc50583fe58 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -14,6 +14,9 @@
>   struct xe_gsc {
>   	/** @fw: Generic uC firmware management */
>   	struct xe_uc_fw fw;
> +
> +	/** @security_version: SVN found in the fetched blob */
> +	u32 security_version;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 16217aacdbfb..c354f7b51103 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_device_types.h"
>   #include "xe_force_wake.h"
> +#include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> @@ -488,6 +489,13 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	release->minor = manifest->fw_version.minor;
>   	release->patch = manifest->fw_version.hotfix;
>   
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC) {
> +		struct xe_gsc *gsc = container_of(uc_fw, struct xe_gsc, fw);
> +
> +		release->build = manifest->fw_version.build;
> +		gsc->security_version = manifest->security_version;
> +	}
> +
>   	/* then optionally look for the css header */
>   	if (css_entry) {
>   		int ret;
> @@ -517,6 +525,73 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	return 0;
>   }
>   
> +static int parse_gsc_layout(struct xe_uc_fw *uc_fw, const void *data, size_t size)
> +{
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	const struct gsc_layout_pointers *layout = data;
> +	const struct gsc_bpdt_header *bpdt_header = NULL;
> +	const struct gsc_bpdt_entry *bpdt_entry = NULL;
> +	size_t min_size = sizeof(*layout);
> +	int i;
> +
> +	if (size < min_size) {
> +		xe_gt_err(gt, "GSC FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	min_size = layout->boot1.offset + layout->boot1.size;
> +	if (size < min_size) {
> +		xe_gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
> +			  size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	min_size = sizeof(*bpdt_header);
> +	if (layout->boot1.size < min_size) {
> +		xe_gt_err(gt, "GSC FW boot section too small for BPDT header: %u < %zu\n",
> +			  layout->boot1.size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	bpdt_header = data + layout->boot1.offset;
> +	if (bpdt_header->signature != GSC_BPDT_HEADER_SIGNATURE) {
> +		xe_gt_err(gt, "invalid signature for BPDT header: 0x%08x!\n",
> +			  bpdt_header->signature);
> +		return -EINVAL;
> +	}
> +
> +	min_size += sizeof(*bpdt_entry) * bpdt_header->descriptor_count;
> +	if (layout->boot1.size < min_size) {
> +		xe_gt_err(gt, "GSC FW boot section too small for BPDT entries: %u < %zu\n",
> +			  layout->boot1.size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
> +	for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
> +		if ((bpdt_entry->type & GSC_BPDT_ENTRY_TYPE_MASK) !=
> +		    GSC_BPDT_ENTRY_TYPE_GSC_RBE)
> +			continue;
> +
> +		min_size = bpdt_entry->sub_partition_offset;
> +
> +		/* the CPD header parser will check that the CPD header fits */
> +		if (layout->boot1.size < min_size) {
> +			xe_gt_err(gt, "GSC FW boot section too small for CPD offset: %u < %zu\n",
> +				  layout->boot1.size, min_size);
> +			return -ENODATA;
> +		}
> +
> +		return parse_cpd_header(uc_fw,
> +					(void *)bpdt_header + min_size,
> +					layout->boot1.size - min_size,
> +					"RBEP.man", NULL);
> +	}
> +
> +	xe_gt_err(gt, "couldn't find CPD header in GSC binary!\n");
> +	return -ENODATA;
> +}
> +
>   static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   {
>   	int ret;
> @@ -526,6 +601,8 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   	 * releases use GSC CPD headers.
>   	 */
>   	switch (uc_fw->type) {
> +	case XE_UC_FW_TYPE_GSC:
> +		return parse_gsc_layout(uc_fw, fw->data, fw->size);
>   	case XE_UC_FW_TYPE_HUC:
>   		ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
>   		if (!ret || ret != -ENOENT)
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index d6725c963251..87ade41209d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -140,6 +140,58 @@ static_assert(sizeof(struct uc_css_header) == 128);
>    *	|      RSA Key (MTL+ only)                       |
>    *	|      ...                                       |
>    *	+================================================+
> + *
> + * The GSC binary starts instead with a layout header, which contains the
> + * locations of the various partitions of the binary. The one we're interested
> + * in is the boot1 partition, where we can find a BPDT header followed by
> + * entries, one of which points to the RBE sub-section of the partition, which
> + * contains the CPD. The GSC blob does not contain a CSS-based binary, so we
> + * only need to look for the manifest, which is under the "RBEP.man" CPD entry.
> + * Note that we have no need to find where the actual FW code is inside the
> + * image because the GSC ROM will itself parse the headers to find it and load
> + * it.
> + * The GSC firmware header layout looks like this::
> + *
> + *	+================================================+
> + *	|  Layout Pointers                               |
> + *	|      ...                                       |
> + *	|      Boot1 offset  >---------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	|  BPDT header                                   |<-----o
> + *	+================================================+
> + *	|  BPDT entries[]                                |
> + *	|      entry1                                    |
> + *	|      ...                                       |
> + *	|      entryX                                    |
> + *	|          type == GSC_RBE                       |
> + *	|          offset  >-----------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	|  CPD Header                                    |<-----o
> + *	+================================================+
> + *	|  CPD entries[]                                 |
> + *	|      entry1                                    |
> + *	|      ...                                       |
> + *	|      entryX                                    |
> + *	|          "RBEP.man"                            |
> + *	|           ...                                  |
> + *	|           offset  >----------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	| Manifest Header                                |<-----o
> + *	|  ...                                           |
> + *	|  FW version                                    |
> + *	|  ...                                           |
> + *	|  Security version                              |
> + *	|  ...                                           |
> + *	+================================================+
>    */
>   
>   struct gsc_version {
> @@ -149,6 +201,67 @@ struct gsc_version {
>   	u16 build;
>   } __packed;
>   
> +struct gsc_partition {
> +	u32 offset;
> +	u32 size;
> +} __packed;
> +
> +struct gsc_layout_pointers {
> +	u8 rom_bypass_vector[16];
> +
> +	/* size of this header section, not including ROM bypass vector */
> +	u16 size;
> +
> +	/*
> +	 * bit0: Backup copy of layout pointers exists
> +	 * bits1-15: reserved
> +	 */
> +	u8 flags;
> +
> +	u8 reserved;
> +
> +	u32 crc32;
> +
> +	struct gsc_partition datap;
> +	struct gsc_partition boot1;
> +	struct gsc_partition boot2;
> +	struct gsc_partition boot3;
> +	struct gsc_partition boot4;
> +	struct gsc_partition boot5;
> +	struct gsc_partition temp_pages;
> +} __packed;
> +
> +/* Boot partition structures */
> +struct gsc_bpdt_header {
> +	u32 signature;
> +#define GSC_BPDT_HEADER_SIGNATURE 0x000055AA
> +
> +	u16 descriptor_count; /* num of entries after the header */
> +
> +	u8 version;
> +	u8 configuration;
> +
> +	u32 crc32;
> +
> +	u32 build_version;
> +	struct gsc_version tool_version;
> +} __packed;
> +
> +struct gsc_bpdt_entry {
> +	/*
> +	 * Bits 0-15: BPDT entry type
> +	 * Bits 16-17: reserved
> +	 * Bit 18: code sub-partition
> +	 * Bits 19-31: reserved
> +	 */
> +	u32 type;
> +#define GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15, 0)
> +#define GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
> +
> +	u32 sub_partition_offset; /* from the base of the BPDT header */
> +	u32 sub_partition_size;
> +} __packed;
> +
>   /* Code partition directory (CPD) structures */
>   struct gsc_cpd_header_v2 {
>   	u32 header_marker;

