Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD29CA6015
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C28210FE66;
	Fri,  9 Oct 2026 06:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsEFgQUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D0310FE66
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791526109; x=1823062109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i5kcu7S/b+mxrfwtRYowjNfDH5p2GSmP4R7dS83TbA0=;
 b=jsEFgQUFkfqGHmXRGMwVAWtfl+tRfa8qmhwlHo3L1V69oaCKfAxMd19K
 zR/DEekuLmYuWHQrOGgdgsavCXr/YyGYOPRRmgMIOiJFHZOEChMS+Fjp8
 8OB2CfO8FUFUdebcyjevcIwuDDojpCBn8TRPr/CA+HQom1NBWgmLfb3A4
 iCdg7eGPX7cV/dvcK8GwOWTmX64iVFEj6uXyNRxWi0ldclyU4/6w6OGnV
 Cey7prUBM+sHZsyjjSkvaK4qvpCEC4mr6q7xP4QGhJN9c0QG+pHtUSdYw
 Xx7JV7KXVcjiwWXqHVCLAQr7ENn50UITVijFz15fXm2KUdKd+3mmDJQ1h A==;
X-CSE-ConnectionGUID: Od4V/prDTXOwI6gVt+nlNg==
X-CSE-MsgGUID: u5CAsv0RQ0amCLeQuJINRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="329596"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="329596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:08:28 -0700
X-CSE-ConnectionGUID: xq7rpE6QTke/Q3J7shHLbA==
X-CSE-MsgGUID: LIypn+gMQWOU7II1BQeITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="685039"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:08:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:08:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:08:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ8fiizikTtjZseOrxkFXqjuj6iYFMy3NFRXrJlzerzqyJNQxqOrdIDflJylpLTQKhQXJQi7bh3ZM46jHrEBGprg2xb5HIcWxsgSeB1peaSgrOGeWpD3hUM4hDI8G5zfPvTwAIFlEI/84g726lKqBKgWGzlJ1edzJBHK2PKimpxDGDdFiowoH/vmWykTw6PgdRz9QLUMicuiZnQOQX7YlHdx7WGuK/qIjw7vFEWy/RUEZQbqe0dhT2v45TMmIN0/ObdWpBJAhjuKn5JRt00C3iVbvcEbZ8xw33c+1kgZeXGgV13P456Op5rGc06xPd6wVrSdcZVORXGmQ5FJLU6djQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYGx+C9Vxo6gXefz5/DqR6lbNu8Azgs95SpO0dd5S9o=;
 b=K08XJYC1vcFt2xnJrQ9/Ujpe8Cp/xrG2FuzyEvKfkA3MOaW578rv/gAgyva6gqEtKS5CrS7iW1IrA60j1DfWqEUc770IAdX8u2eUtqsw2Tc7kCS0J/u2Dq0tRy0aTkDCKJCGERFZ/e0F1/4JX4LUQFzY4peHFz/86BUrHV4ZdWGHKB2QEAe9cxLBM8WYF+mryN5IIijn2pImse+x1jihD5ebluicmhyXPJbLbsLwmXO6yfSQUeie3pQBIzuF90d9hGWFtVMDAnsIhC/sS+QVHS4NZ9WcAjGO2RoaaS0CPJ4D6EGfwyxz5376ukoogP+iMf2z/mDaos8/NbENprotzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LVUPR11MB9811.namprd11.prod.outlook.com (2603:10b6:408:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:08:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 06:08:19 +0000
Message-ID: <75062fcc-20d5-4935-bdd9-9dc6776229c0@intel.com>
Date: Fri, 9 Oct 2026 11:38:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] drm/xe/xe_ras: Report core compute errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-23-badal.nilawar@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260906172604.2215987-23-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LVUPR11MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fa5090-b3cc-4add-368d-08df25cbb6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: A00gpvB+ft1fGnhPIZjhEI79dtf1HrmhmJNE9iJuCTFoYbmMP+UpGWlA/M3NHPCLrfuiOO9TFOvJtp86sRct6Lbw0d5vWvkkW63WPjPiStONbJvqMVOaWahv4YRUm1/0oIuph5lNgclpWGIllu1EjkDonzwa8x3DsK7InGo71XtLQx05BQIgzSxQchqus0oB9noyRMRBML8d2Ar2UDL/e8JmoL9vJ/c2HemLJDwymruWKdueLciDizUudR2/ZctxaskT0XRQ1geI4N93XZUYZ9V+NBqvJe+kGiaamyT/W3Po9K42KUVkg8OzkODjQYwGOsnnZDDoNvsxhQLFz+xI4f83MR0/hqKpksewXzxt9P/zilUPPNKqiH1aF31uFpIZUagyQINjU4BHhdIeXdejYcXxCJmodGUZJ8S9cfAV15gaAIcmh4pcNzZC7PJScCuvTyN667zwZ8HDFR3ZGOz+dF36Cn6UGDaBtwQdBAq/B+zHZHc01Xb6gC2HRGJMVR3VOZhOX8o8z5S3FHKZii7NRTC+uzApuZ1zKffi9ViWSD3fp3Up38U9BGwE9bHD6rZXIrQ4NVe5n+CY+h9Qzd9pbs/mhVK11LYDYegVKLbyiyhjBpYVWIqsI2UlfwoGoP9UlAKHklBFMQ7JHKPhyj7JGUZChPiHsH9JUVcuA8HfSCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RqQi9oSWMybzZmVXZZeTN3VjVGdTJma3hlcWtIckVXd1ErOTJ1OFZxSHp5?=
 =?utf-8?B?OVRad1BUdHRnWkFhRWxiMUxYV3dCSjhUMlBVVXRoR3YySzdnZVFjT2tsTXNl?=
 =?utf-8?B?TXozSDQ1SlE1ak4vTFMxVlErRzJkT05Nck5JZ2pVNXJwdS9zY0tSQWhMenFQ?=
 =?utf-8?B?MzJHNngrcWI4cXhQUUk5QTltemlXWnlqSThGdGhzN3VqQXUzOG9YeTlRUExh?=
 =?utf-8?B?MHBIUmRxR1pQNk5PM0dzaHNvNUxLR1lCL1RsODh1L3RiSFg4QUFuMkVTd1g5?=
 =?utf-8?B?L0k3MmNjVTJkN2dLN3FWN1I1SXc5cUFCeE9NNWFxOWVKZ0ZUNFl2em02STlv?=
 =?utf-8?B?SWU1R1RYeWpuUUxlL1ZESXlmYTlTZWh2L3dWRW9ncWVlR243cW91Nk05MGE1?=
 =?utf-8?B?eDcvaE91bmpjZ0FMZU9LT3R4S2dVMVlFR1B5MHNqN2dacFhBcG80ZXBFL1U3?=
 =?utf-8?B?dGJ0MzdrRkNJemV0S0YwYktsbHVSQ1M0WDlhQ3h6RjMyZlFseVI4dERUQ1NP?=
 =?utf-8?B?VGRKR21qSEJiY0o0d0tHOFNqVXczdEpsWklYRDY4dHFuVHJJUVFiY2IzSENC?=
 =?utf-8?B?MkFEeXNYR1h4Z01kV3ZYcmhyOXhHOFI5ang1RmEwNG0yb0NlRkRyTHJGbUlF?=
 =?utf-8?B?T3FFUlpvT0dBNnVtaGFDQVE3Z2o3QUx2eFNHbFdrMTc5QmhUdTJaVTNGK1pq?=
 =?utf-8?B?QmROVyt3b0JORTVUa09oN1BoenZoWVI3Q3hFQ21oVmRjcENiVkF3dk5RS0hu?=
 =?utf-8?B?NmxHK1JwV3d0d2FxTkNoeVl5ZW5CeS9jaUVVU2wwQmhBQUZwZ2tQRWI5ZTJi?=
 =?utf-8?B?UGVaUjg5OXB0RzFBVHlMbGVNVzYxKzdMWWpBU3MzZTFZWnhjbDJSMUVTN01H?=
 =?utf-8?B?L3RJdTg4eE5TbkN2T256R0VTdHROL3R6YS90ejVaVmYvbXYrQUVlMHdpN1hh?=
 =?utf-8?B?U3Fkam9tRXduTngySFRSeURibXNrVXZRd25McU9XTnFyVWVlejhNYVRlcmN4?=
 =?utf-8?B?UkJEUFM5Zld4ZnpVRitsTldia3FXMm16R3hQcitZNUdWZ2pYYlVzdmNWSkVs?=
 =?utf-8?B?eVpUNVNUaENHVytUSXhEWjZJUEpvZkZQRGxzTEV3eGxJNC9BYWpGazUvT2tH?=
 =?utf-8?B?RFN3OUUrQ2FCOHVjUlJGVUFWNFlSWjhxOC9LWW90SjFGaFpVZDVFRkxRNUtY?=
 =?utf-8?B?RWVSTEszSDIybCtnUUpUWjIvTlo2RStuNWZnRXgxODN6ZnBwSTlRNWs3ZW82?=
 =?utf-8?B?RDFoSHBVODZnOFNVVm5zM2FsREZ6cHhPbDdUVEZDWjJvNU82bmU4bEdzdGlw?=
 =?utf-8?B?WXRqSVk2MGdES3lKS2RxU3JuRzlEWi80WVlKRm1YclRQbUdRSHlVV0NMcDhC?=
 =?utf-8?B?bHFHSHYySG9FOUZZV0w5TG5sNUx4MEhOR3EyNEltY2RWc0duYnArYWlQZmtX?=
 =?utf-8?B?SmV5QkRKUFJrdytvQjZKaTYzb2o2TXVTUmdJVm9paHN0WTVNWUgrNGl6bEFS?=
 =?utf-8?B?NnpOTG9HMnhodEpFUVcyTCtXNEdqU0FIdHJEQ1VKRXQ2Mkhnb1QvYTJmdThF?=
 =?utf-8?B?M3BsblZDdE1CZFNjODFFc2NkcGdoNDBab3NtRFpnMDl5WTRkNHR3ZGdSSWlJ?=
 =?utf-8?B?Q0lablJEb2x5djRXZGpscGJtSlNpdEdHdXVHN1h0a2lGK092NTZQTEVOMlFE?=
 =?utf-8?B?a0FsS2lKcWhCRkEydEI0RmorUmg2QjA4R2VORFdrTGNCem56QmdYNGErajhJ?=
 =?utf-8?B?ZXZOVjVMaG9uTGhaTHRRRGRMQjM5NCsrdlZkSFhwRUpWU3BTTGFzQjlrUHhH?=
 =?utf-8?B?QVpwWWlQSkRYMkhIOFc5T1pvS3Qzbi9kczZmdHAxMzhSR0RYT1E0Nm5IQkNj?=
 =?utf-8?B?VmZ3aDhGOVhlWVFQYjJndStWWWdhbDVDTzJVMUZxYXRndTQwOGYxSHBaME5R?=
 =?utf-8?B?emJIVmNRRnQwR0NBRlUyWW02NTNscmxiVjRGWm9BdUI0RlRoaWtmalJBNDIv?=
 =?utf-8?B?Y0RuTk5VTEFnUDFBQTdtZmVTbzI0SFdNOHJHaW9kQkp2TTJwVm0xUW02bWNR?=
 =?utf-8?B?a0NQOHVvVWhUbjJVT1lEUExLaE1DanFIakg4SVZDTWt0a1ZqOVU3R296Smha?=
 =?utf-8?B?VXRhREJMcHN2ZzRwbkdvcGNXaHlIc3dzdi9LZDFWazYwYXBQcTVreWg5T2xP?=
 =?utf-8?B?UlVlVFJsaU9nM3FDZG9meGRJUGVid0xNMi9HaWJDNUFkK052eUtoeHZ0RFpv?=
 =?utf-8?B?R1JSZm5oendmc2dBZ2FWK2dPMXJjRU1tdDFXeWFldVhpaXU0V09QU280Zlls?=
 =?utf-8?B?MUZxV20zUGlWcmFkNVhaUm9RUHhuNGdZWkFGQXFUVzEyQmtUYnUwQT09?=
X-Exchange-RoutingPolicyChecked: Z004aDcAiqzMRrh3Vh7f/3u3fzhVmj7CYIonzYSs/K7HsvdgEmNCMOfnrpJbBcgztFsscNXH8UOEUZ9/RKgBL+MKjhSjafGDM1l8BIUDGtY/eKbZKfMj0+UTspRSgJ6w9z8I5yzPLEFmbHDhL2YkuZoOkdvzattmB9QJ8TdZ6ten8GVXwK0HRK3LlsoljCdTCNNvYb4aL8MvQAfUtv0tsnUaYLLzAlh3aw6DQV+dAhJCJvXt/fXXkicojXcmw7d2zuXS1mYwUS73UDHnefeOckOXvyjxNGl4XKw8Nh7DL3/ZnUgObkyYDv/sIymWaSmu90jVlfpqMDyGIYcWVd3jYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fa5090-b3cc-4add-368d-08df25cbb6da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:08:19.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViZungNMIiAhJ+HnO/29S6i/U86+vaVaH19fgTs1sEXk+cwa4D0j6e9GJpoUGLAcXJgWuI9OdzfWzTdt3YywrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
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

Hi Badal

On 06-09-2026 22:56, Badal Nilawar wrote:
> Use xe_log_* helpers to report core compute errors.
>
> v2:
>    - Pass RAS firmware reported severity to xe_log
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3a7f80370827..78ea5e33e244 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -310,21 +310,27 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>   	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>   }
>   
> -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> +static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_compute_error *error_info = (void *)arr->details;
> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>   	u8 uncorr_type;
>   
>   	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
>   
>   	/* Request a reset if error is global */
> -	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
> +		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +			    "Global uncorrectable error detected\n");
>   		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}

Can we have a single log with type here instead of two logs?

Thanks
Riana

>   
>   	/*
>   	 * No action needed for other errors.
>   	 * Local errors are recovered using an engine reset by GuC.
>   	 */
> +	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +		    "Other compute errors\n");
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> @@ -597,7 +603,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   
>   			switch (component) {
>   			case XE_RAS_COMP_CORE_COMPUTE:
> -				action = handle_core_compute_errors(arr);
> +				action = handle_core_compute_errors(xe, arr);
>   				break;
>   			case XE_RAS_COMP_SOC_INTERNAL:
>   				action = handle_soc_internal_errors(xe, arr);
