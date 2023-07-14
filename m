Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CA4EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 11:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47D10E7F8;
	Fri, 14 Jul 2023 11:06:44 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E466D10E7F8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689332802; x=1720868802;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cYe0UBrHwqmYV+9AlNXHJ2SYBjlkF1UTKsV/sN3+FKI=;
 b=PKbOemefGFdGfpgMLUumaHQAU/EWkArPr13wov5dJq5UNihOz65+8BOd
 /Aw/t7dfgi5xfQim2RZnXT04Wzm+WQ6pvSLzj0vI+taMLxvHNWVmQIWrJ
 4IMMrYPt6ODGR33WDdO3ewZ2YMu0t4lvXZ3RkxEaRz/6hKNBz0uRmsofz
 /HteFtekJ9hz1OpU/aFoZSSp+e+bnYzyF3uO8dYKn5h4Jx2GWRfgyF4Xg
 DYMu2HFMOfQx/gJ0SmCDideXtwMCQ1EtLp5rEFQWKdBxkgN6Lzzhofa7T
 Dz14Ew2vjyv2d9Ro2Y4EwYr4q5S0scNC3k9v1k8DYeTYmIfA10OduZH2T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396259435"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="396259435"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="835994830"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="835994830"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 04:06:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 04:06:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 04:06:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 04:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4J/7G2a6k+e1W+Fb6HgfZ8xonRHB8jElY76Bo3VJBO0Rfkeum/NIr69cIevevv2xxUS4kqh8FQOTMZ4iu90Kua0lDXZwfmbDOQ4QB92dF2E/kTTCuh0SNxVqQnlizFnonTf2FeS8EZng97dOVy1NDVVhgKP0zI7YsIpyn1C5w2O5DEf2DNX4Oq142HsS9hFS5NIZUcbH/SpqxOT5Tc3/jqj44wQTO0s1tXry6dzwpfbQCyxdAdVrwrTma7vjzt4h9GNaHJYOt9ZGO7Pb5Nxk+jVjCU/yCyXNV7VivZ1EBPuCTML2crlItz1qK0ddKuFuRNTtmVb2IOg2vVsd929EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOnxvx/cYC3FY/WQD5plBinVtz38TIWwUNYlCMk5frE=;
 b=Axt4Ye8fKBOIYtxyaD63Xcbkn/WCeTqQca6pDjzY2VDMFPxJ4akwLkUs/4MT7VjZamY1uXdAuDZP5MUGNl67p/XJyKccY1wuaQsg1lOsalgJ+YA7LpxDgYG6lZPFPzdD0H9++7RSvkqx59b14WuV064pqvn8QQuti0KXhM+Hsq3HVzy4H01tyftoZSKzdlzC4j6y11d/UxmH6bkM4HcTz6/Utrm5NreWq7Y45xhaRvfbQ8Tsy47fm326T5q+6oE0DJQdtCWlZW21hZ1T6HvBfQcrfN7PfrgJd6o6TS58a/rktPc5QFtBBvNHa5YDSfMLP/vom/9951dBhZS0St4SBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 11:06:17 +0000
Received: from SA2PR11MB4843.namprd11.prod.outlook.com
 ([fe80::e14e:7a40:74bd:2227]) by SA2PR11MB4843.namprd11.prod.outlook.com
 ([fe80::e14e:7a40:74bd:2227%7]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 11:06:17 +0000
Message-ID: <1ffa944e-e3b3-6a06-d95b-8faf581fb242@intel.com>
Date: Fri, 14 Jul 2023 16:36:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
 <20230713143121.3901357-6-anshuman.gupta@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230713143121.3901357-6-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To SA2PR11MB4843.namprd11.prod.outlook.com
 (2603:10b6:806:fb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4843:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 598e6c3b-d37a-432b-3646-08db845a588b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJ7aJljaByKHqYL0EdycunkAeCQz1JpkHNnyA9PzLmfHlKrtfIPQPDYXIlYSxOoJecrPp/UBWTN5WWkaz1svAEIJKZD3Yfi16r5/siQDE7F+J20nQYBT63Lucvhk/3vjd0k4h5dzrLzOeQBzzq1dMXQ5dRuCkYvh+Zgj6ix+OHuPGdg0vOPtu0G/ZkpzMmuWsjv5NzD/LIUXpiXgJ2bdxHSe7Aie4aATBZuVe7pI49in2ypnWcmifkEx/CTfJTaTUSO6cKqaqNWj3VMzfGrO+dKlz8yN/sdn6Q+XNoIjbqw0+3Ozi8XWefPwdTzXrO6ZwYKGbEbj4al8j2n5+NdhWaDVpym15AvZo+sk9OADUSiWdk0rVjJPy0xzbJytMLv5en9xGNos7jyZaMgB1pLmbk4BykHZ91uOzFUAOmBcbGfHn5b+uTTKD6gAcqYoaViRBspiv6n38KMaRWcjMq4bHbKdHS3H4geDKTupLsUCIFdOAXiaa3Qo5HT7eE0VN+4pgQzzFVPuT/2TKa3O5csGOFPzBGy5GiTgIJmD7MeaLi3F1dEjc1L9VzBg4C+yI9hJfGT2c3EmAbh9D4OxIVBBeytI/F3yu/LRD7n37IdV6z4/5Uvk174w+5yDSFax3OMb1KQDmd34VFtoI53SKPRJXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4843.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(31686004)(2906002)(41300700001)(478600001)(6486002)(6666004)(8676002)(8936002)(44832011)(36756003)(66946007)(66556008)(66476007)(316002)(6512007)(82960400001)(83380400001)(38100700002)(31696002)(5660300002)(6506007)(186003)(2616005)(86362001)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTdxWGpKRzRHRG9waHNBeDJ6NlJsZldyZzJreVhpTDNCK3YwckVIR2pjTHp1?=
 =?utf-8?B?bFFKQUZZZTlNbmhqNmZ1bUFhUmkyMElrYTV0NlQ2RXFxM1VPazBkekxkWlhk?=
 =?utf-8?B?VENCQjlzZWF0a0dmdWJBdXFFcW5pcXRJbmI1RVR3c0VmZUh4SnIwREhuclNN?=
 =?utf-8?B?Q3JqYTUvb1hLTWxxZXQ4a2RkMENUOTkwM3UzSUdKcmNXZVo3Y1hnam83bzIr?=
 =?utf-8?B?YS8vMnpkSVE4bHp5ZTQrMU4yTnRPemVDb3VFMHhrSGNaanQ2Y1hxanlQajVk?=
 =?utf-8?B?cXlZTnFteHhtTWNUaklHd2lLMjVvemYvK3JqOGhGb3JsaHI1YWJ0ZzhoYWU4?=
 =?utf-8?B?dVNoK2srNWIvT2RzQVZWZklrVFJialNERk1zcEhaV0xGcW9OMHh6SC80c2RO?=
 =?utf-8?B?aUNmUEhiQlFQL05XbUFuWTZsNDIrSXUra0VjMk0yN1h6Vlp6KytPZnhJb1Zi?=
 =?utf-8?B?a2NHbFVkdThTNnd2YWo5cU5IWHpDYnQ1bmlTMG1sVW1FUGVaVmllbXN4Q0Rq?=
 =?utf-8?B?TUhIamlaODZQckRORkdQUlpWWktlVVZmdmF1ZWZhTm9QaEY4YVNSNndwcy9w?=
 =?utf-8?B?VmRQTUJxZ01BQ0pUd1BIMURCVzQvS1EvSWZDNVdWVzBvVVBuaDdoYkNadUxE?=
 =?utf-8?B?NStYY28zTDAyVk83ZWh3NjJielJvTmlaWU9na1FDbGYwZVFWNGZQTVZGd1I3?=
 =?utf-8?B?N1pOcU1EeHY2UWY5Rmc4cVV6a2tqUm5zUFhrN1NWYnQ1Z0FxeTdhSktpb0ZN?=
 =?utf-8?B?eUFiVi9tUVNPeHFIMTliK1dTNGw1UjVnUjRtSUxOV3lLY2VHMWZRWHNyMG5C?=
 =?utf-8?B?anhyNjBLa1lXOThyTzRVNnpWbjJqdThhSWNXU1NaR09sN21hL2RrSmYvblVx?=
 =?utf-8?B?Q2VKZXVzYjM4cGRMZU5TdGZxSFlTT1QzV2s4VjM0QmhNTmNJczNqUTc2c0hm?=
 =?utf-8?B?c29NSmxncGZhOTg2bGVuRGY5OTdxUnUwcHNxWDl0N29CcndtSVFjNVJtTzRO?=
 =?utf-8?B?OVJ1M204eGxDbmxMSmNqYjBRZE5QZm12SXBYV3RuUDZtaGpReS9GUGFEN0Rm?=
 =?utf-8?B?R29NcllXWUFEWENsUTZiTFllZHZkaUNMejRHRkFxSW9XT2MzRUswSjBWdVZC?=
 =?utf-8?B?TmRLRzdIUUp0YWpHSlNuY2ZYYkdtWDlZSUwwamsraXRzZm16WStHN2J4Y3pQ?=
 =?utf-8?B?ZTFyVzFUc21LRFh1bnVrRngveW50eGJvcmtUeEd3L3lyUjl0cUUrcjl2WHhD?=
 =?utf-8?B?TjdFaTlmb2NXenFvcXhlcjhUZkhGVXJTTlEyV1FNS2JLNU5oSC9od2U3Z0xI?=
 =?utf-8?B?Z2oyUklvTGgrMGpCd3hZNjBtVy9pbVNPcjJIa2NFVVBqR3lhYlVWVk9wNHhQ?=
 =?utf-8?B?cmJCUk04dWsvdm1pQ1k5M3RJdk1iNnhRTVdDSTFXZTF4Ui9MdTZHN0l5QVBp?=
 =?utf-8?B?anpPTGxMRHVEaktlWCtjYUdTVFl1YzhMTU56b1RycWxyWEpkd205WlhSYmZs?=
 =?utf-8?B?djUvY1IyV1JpaWluOWNibXFkTWZlSml6WmVTKys1ZEM2enpuTGIvUGp5WjVV?=
 =?utf-8?B?T2lvU0FXOGtXcElkTFpUYTRwcXgraENtTitKaWlpdWJ4QkQ0NW40eFcxZUVv?=
 =?utf-8?B?WnM1RFJYcWFMVmMwbTk1MTZCNmtNS2NPdnI2bWR2WFVYUEZONWxpOXJJT3kz?=
 =?utf-8?B?VGNXTFRSdlIvK1dWeEd0RFo0UnpaTjVMY3JiTUo3NmZOYVl6WkRiL0Q1a2xV?=
 =?utf-8?B?aHpPK08wZXRKRGZJT21sUDlzUEZGNVUySmNXalVVU3AxMTB1WTFocE9Ba09w?=
 =?utf-8?B?TEJ0VWVacFVMekd5R2RScUk1NVpuMHdaQmJSalptQTR2ZlFYQVl0Tk5CODBr?=
 =?utf-8?B?cFIrOUVyV2Zxa1FkNjU3TVY4ZWRqL0wzVXVFZ3hIQUZQaEYrMjd2Z3p1ZWx2?=
 =?utf-8?B?dlpJd2N1Sms4TUhseWVsaTVRRVlyOXZmVWVuRWZGT2dlTksrMWZRYUxHKzl3?=
 =?utf-8?B?VXJBaDFGZmVTUTk1OWM4bHdpOHdZUjFHSG0xMlBJWFcxR1R5UjUwbHpCdVFM?=
 =?utf-8?B?VlU3SFhzZGRGWkRmOGYvLzVxVmhPVDM4cmhmemMwUG1LbXFKV0tXdGVJRFBG?=
 =?utf-8?Q?ojmvR1ZIbXq0pUBD602hGbQ2C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 598e6c3b-d37a-432b-3646-08db845a588b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4843.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 11:06:17.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKfol2NPZug/Bzcj4ugObgHkz2/lwiXdS7mfXmVPliLCeJZAu6Gd52rEH6SQC4sSOySt3HRU6huiPkgaG/YQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 5/5] drm/xe/pm: Init pcode and restore
 vram on power lost
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



On 7/13/2023 8:01 PM, Anshuman Gupta wrote:
> Don't init pcode and restore VRAM objects in vain.
> We can rely on primary GT GUC_STATUS to detect whether
> card has really lost power even when d3cold is allowed by xe.
> Adding d3cold.lost_power flag to avoid pcode init and vram
> restoration.
> Also cleaning up the TODO code comment.
> 
> v2:
> - %s/xe_guc_has_lost_power()/xe_guc_in_reset().
> - Used existing gt instead of new variable. [Rodrigo]
> - Added kenrel-doc function comment. [Rodrigo]
Small nit

s/kenrel-doc/kernel-doc

Thanks
Riana
> - xe_guc_in_reset() return true if failed to get fw.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h          |  1 +
>   drivers/gpu/drm/xe/xe_pci.c          |  2 --
>   drivers/gpu/drm/xe/xe_pm.c           | 13 +++++++++++--
>   5 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f2a6998e8873..89ac2bf482eb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,6 +355,9 @@ struct xe_device {
>   		/** @allowed: Indicates if d3cold is a valid device state */
>   		bool allowed;
>   
> +		/** @power_lost: Indicates if card has really lost power. */
> +		bool power_lost;
> +
>   		/**
>   		 * @vram_threshold:
>   		 *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8245bbc58770..d6ad1bb85a0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -844,3 +844,30 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   	xe_guc_ct_print(&guc->ct, p, false);
>   	xe_guc_submit_print(guc, p);
>   }
> +
> +/**
> + * xe_guc_in_reset() - Detect if GuC MIA is in reset.
> + * @guc: The GuC object
> + *
> + * This function detects runtime resume from d3cold by leveraging
> + * GUC_STATUS, GUC doesn't get reset during d3hot,
> + * it strictly to be called from RPM resume handler.
> + *
> + * Return: true if failed to get forcewake or GuC MIA is in Reset,
> + * otherwise false.
> + */
> +bool xe_guc_in_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 status;
> +	int err;
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return true;
> +
> +	status = xe_mmio_read32(gt, GUC_STATUS);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	return  status & GS_MIA_IN_RESET;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..f64f22e97169 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   int xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> +bool xe_guc_in_reset(struct xe_guc *guc);
>   
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 871868301838..7bb5330ab2db 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -846,8 +846,6 @@ static int xe_pci_runtime_idle(struct device *dev)
>   		 * but maybe include some other conditions. So, before
>   		 * we can re-enable the D3cold, we need to:
>   		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. at resume, detect if we really lost power and avoid memory
> -		 *    restoration if we were only up to d3cold
>   		 */
>   		xe->d3cold.allowed = false;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c732317b55cb..9a934674d470 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -17,6 +17,7 @@
>   #include "xe_display.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> +#include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
>   
> @@ -197,7 +198,15 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold.allowed) {
> +	/*
> +	 * It can be possible that xe has allowed d3cold but other pcie devices
> +	 * in gfx card soc would have blocked d3cold, therefore card has not
> +	 * really lost power. Detecting primary Gt power is sufficient.
> +	 */
> +	gt = xe_device_get_gt(xe, 0);
> +	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
> +
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>   		for_each_gt(gt, xe, id) {
>   			err = xe_pcode_init(gt);
>   			if (err)
> @@ -218,7 +227,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
> -	if (xe->d3cold.allowed) {
> +	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
>   			return err;
