Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364CAC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 07:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F5F10E7D3;
	Fri,  5 Apr 2024 07:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnQZa8aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B14610E32B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712302135; x=1743838135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j+h5KK5ZWXj3RlcPZWNjrR6l6ofpN3wxZG8qEr7yIAs=;
 b=dnQZa8aauPx1geIFJUzEe1LFXsT2Bn+4si+S0hr9u6Vip10v7ZO0VFgg
 yzK61uUjbGmflNR0LMHw0TzTk5UJ+blIG1R5WdrErFKxfe4bNXjT4zGY+
 jDYDRZViHzPz3Ow12vZys+dr/B1eYBylG5moZbwpAnlsniqBHfUnBhCiO
 jiO1AJXOY9Aca252DsbMiVImQ16ystI2f9nm8i7yJ6kz1iBK8coARCpwO
 4khaxiz7HVSAl97UXqDteySMX/c6l5FnfFIYUYwMPI0+6K+J+zSaaV7Yt
 93WTRj45kqIQtF6yNr4V+4ITFfR0YdUrpi/f43PAZuVcx96W3TRFdRAdg Q==;
X-CSE-ConnectionGUID: Csr9hCCcSYabTi9alQam5w==
X-CSE-MsgGUID: GjYoBYgdRs6CvnlOOyyUtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25128192"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25128192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 00:28:54 -0700
X-CSE-ConnectionGUID: TI4BOE8rT9+lm8glG2j9Ow==
X-CSE-MsgGUID: UbZQi6T/SvO5z/SeGUibxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23747318"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 00:28:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 00:28:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 00:28:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 00:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htT+TP0hAbCykZKSmH2NZUXhG7t1mVDEadGBicJDGSOSZX4LHzlwNo6RJ3ce9+Rsv01sG8MJVDQbZvIO706H6a22PTKScI/laEJ2SsRjZMlgGCrukDC0xMwjwq1YH9JTquka+HnJZc3J+BlUg3DcDYGAUknOyDz+X2rw2Clw9TkTFmk+MX20w4eZfXe3zWhyZCNRvTmzoyc3mN/VSI1m571sKJua8NzOmVn2bt9cQIjCTCDvGUJoNRPBP5PqnHx2iHytnTd4TG1Peo1IV7FqjS/NsIMmgUXJLyx8qqgjTvdICy6pYpSJ8ul5Ih/8tqDgqgcFG7ww1GBwYetZqkB2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RzCR3Zlj6ZmPh0nUb/CXinijbDOalTbQsEBKoIalMs=;
 b=FfeTrNndQKPwDFKyKrb958Nwzz4wvbUv8HegkgLYaR0MAPORtujKzLEY7+rSmT/UPC3S4QtkWoAW0X8yzIpzJx8eB1x55PzKP3hx5gb6VD9ROdXtkh3TcaG0F9Eqf1jz+zLJi7Y7QfkctOkmg5+eIJbkSxISwHjDvCUgvfFCLp3oe1/VTbg1kdxE/VdJBCJabhoTvpb4IgsrzBj6iLokW38VNpek+1z2hculV+HwNVwQZeMt+3CVt3EIZEgdptf1GQKGNMNsEwOmiTXdcObnNlaUaLw+CH9FDn7eWtoEbz5NjZW7Tm2k7aaHSlazXT28v5TsT8M4EwsCliT24Q+Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Fri, 5 Apr 2024 07:28:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.031; Fri, 5 Apr 2024
 07:28:51 +0000
Message-ID: <c80b852d-d425-4b4f-81a8-7bf84bd9e1b2@intel.com>
Date: Fri, 5 Apr 2024 12:58:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
 <20240404100827.1109447-4-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240404100827.1109447-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4651:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cex1ZCyWJvdUBeZYHckGk2J9cBu52ufp+2u1rAxqw/Xsvl7rdg1ViFYL9yQlC8s2T10dFGjAczyyXDq6YVZ5iRAq90tNP/ScF61jG1muzoAxWbtLcdf8tz0zQlxhJA1JNa9FMyNmhep0RgOmdmM3bvr4ezRrTP00FzQueyEw3dDQu8VXk/fVJpzP1fISbb7Zyuap9T9C4lSawkjuFTQrBiA4R23cPhGw7J/xrEeyucpnCAj01HB1io6QJ9Hc+i4DYJ8IDd2XBpn8VHPpNH5JoHr+ljdb+G2LAZQfGESTTSHgHC1puxoxt2UEYbk6zmjcKXL4gRLkt9MvN+ooKpldNDNI0ek7Wz6yy3D76UTWAriSJsNByfWDobAmZdVQBhRLKj/3a4FmVtyc5XpcLL8YqVZfh7u/cBx8lQOwa5zYUOLadn5QEiA2ix/CJVe+nayv32aWPZGSsrEl5EdeJPTCrIQ7gCPAshSg3J5yVnlc53t2touJWy9c5fXYVudy+K+540fy4ovnLw9i9bnhwkJVfetOuo15nDXREpQ9DMeWnPiITdKGz+ygzJ9rPDOzXFaivriprkpsQrtCHv9C4QXlTgFhtm/Gv8v0Wk6VTgvLwuD3RqYr6LQzJDSAvXX3gP+lCvxa3Fxri2GMzDYAs8aEdnENq/l8DAoj8hQ4UUTQx90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NLQmJzdlVHc2lwd211Z3g1RFJFU1I0TEFtS1dQSlN3NVZZejRtUjU3cDAz?=
 =?utf-8?B?NHhJVlNjQitnQXpLcDR6Z085Zys4SzlPYmhoNFdldDRKZ29haWdZeVhGdUhS?=
 =?utf-8?B?RFN0UnEwREprKytyNEFNYTdYVUNlSDh0bzRhTzFkNXJFRzhwV1E2c0h2SkVK?=
 =?utf-8?B?aUcvMFdvWWZuL2l5MUN4cVdYaXpTV1pBNVpSMXNsTzJ2Sm9kZnpsclFIRGNX?=
 =?utf-8?B?K09YNVk0OEdqOHlQZHV2VVJvNFRPazF6bUdMK1FTNzhDSEZBaHZhNmJLdExh?=
 =?utf-8?B?RThrMENYWXZhaTJ0cUVFVXF2dnhCZFZzUE1ab3RkOW9oUEdFVm9ibTlsbWI2?=
 =?utf-8?B?eTNJVHVKZVBKV2c2aXZEcFB0UnZiMElsM1I4aldVdHAzNGZXTnBvYnV2emRa?=
 =?utf-8?B?QTlmcFZBSkFZUjBTYUxHTHQxRDB4cVpPc3I1bndGZnVhTUJ4elljZzlMTGFB?=
 =?utf-8?B?dWJ0SnF0RlFlWVhFdytLS1I1dUFSNlltTTJSVnZPYitLMEVEcFN5cjMwVUcv?=
 =?utf-8?B?emZyaW9FcVNuOGVFaWFqbTRGLzVCR0dRNmF5SEJ2YlI3U0JJcmtPOEdYKzdu?=
 =?utf-8?B?VS9qdmJoOU5GS2pwckVmWHBhMG91UWR6VFRxWHJDdXFIMDd4Y0JqZHV0MXl5?=
 =?utf-8?B?SW1QMDk0ZHc1YkgvOXVvUWM2MXVYN0UzSlNxYkZhb216Yk9HSjVTQThuZVY1?=
 =?utf-8?B?eXhMNzk4VzFIUGhpS2oyVlhpVXZzMGtROU5zTXFlNTMwL2piQVhEQnp3cXVn?=
 =?utf-8?B?MWhvQU9Dak8zMkw2S0hMODlVUVZ6Ukl2VDJ2SEpNS0NPaDFGd09WcjVHenky?=
 =?utf-8?B?VmV2SHF0QWN4bWp5bno4dzhXYThpbUpSbzU2WktjYnFuWllhbno4OGNPN1ZR?=
 =?utf-8?B?L2NBSmY1TXVkUFRtNmhaTEZNMldGb2lpRWt4d1ZNQkhvNzZoczhzYk1VTVZw?=
 =?utf-8?B?cllWaVI5RU5NTHFmd1U5WWhoNVJYZkdHZVlseENLNTFJNm41QWYrRzVYK2hh?=
 =?utf-8?B?OFR6R3p4dDZhUnNNakdUUzdtT1BLeGdsNm5TQStUTU9JK1hGSmdDcG8rOUJF?=
 =?utf-8?B?cnNUWHR2SitHYUhyT0pLcDRFbXF4MlVTbzZDOHhFL3R6K3VhMnljdXpTQlFY?=
 =?utf-8?B?QUU1WExBY2ludlJEQ3lTbGpycUE5emtybk1oeVhBTVpRMkQ5OEpCVkhPZUJq?=
 =?utf-8?B?MFhBd2FDMk52NE1OM24vVWlGTGlILzYyUERXQXA3MXNLTTNJLzVSSzVKZXNG?=
 =?utf-8?B?c01JdnpRTmZ3eDZodFkwT29hREpLb0pBNnF4Uk9mOHZ0K1cvRjJTanNLNVVi?=
 =?utf-8?B?Z3NmelEwaW9ici9FN1ZVQnlDaENjZFZOa0ZQdWJZUE1TMmdZNGx6b2M5cXZp?=
 =?utf-8?B?TytwcHU0TnFPV00yS0p4bkd0di9mWWl1UjJNZ1JqMmd5WFU4VXREN1dNM2JY?=
 =?utf-8?B?R0lETmo1OVVwOGt2QjdydENmZHd3WFp0TGYvb21MVGM5TVFtZ2R4aEViRG1B?=
 =?utf-8?B?RTdmUmd2QlVxVkN4QlM0bWRhOXFTTGZBZ1NRL05EMFFyUUtBNlZGUlU2bW5k?=
 =?utf-8?B?Mm9QNE80RGhSTkJybUJyUzZpVE9Wbi9WemVyeEFtUXBPVXJlK1R1em5QQXVw?=
 =?utf-8?B?R0t6NklzY0t0anJ6RjNDL1paLy9aM0VWSnpINFZJQ2thRW52c0w0VVkwbzQz?=
 =?utf-8?B?aVQ1WEdHc0FOaU1rRmxTbjc3MGoyUWtzWTNlNTVlemJsdjhiY1hHVDh0dnhF?=
 =?utf-8?B?bjZOb1QzWHkrUWlxZHZ0MVBwdVoyWmp5OE13SCt3alNHcGhRcnFCSUhvaXll?=
 =?utf-8?B?UEJ6MXVZbk1uS3RHakFvR2YwTC91NnZzTnNzbXMxQmJPOG80SlpQcCs3Q21q?=
 =?utf-8?B?aDV5VExIdWJCS29qKzdXL0h6bEEyOHJRWmNGekdOeEJrV21zZ2d5TXJIbFpY?=
 =?utf-8?B?QVZ6TzdZOVgwaysvZVVndFQ5VHAvQm9OY3E2ZVYycUF6N1R0MWxtRXpwcFlW?=
 =?utf-8?B?VlJYYjIrV2I3aTh4Uk1YNktRMDJZQWhvTTltQlMrRXN5bWYzWlRIcmF0SlVy?=
 =?utf-8?B?YnVCN2NXWlpkTXNta1RHVzVhRWl2elRkclNSUDdjT3ZaU2xENGRGWFBicjRX?=
 =?utf-8?Q?ULm7TVi+1kFpLwFQyFsf0+m/a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 360b463e-ec37-4fbd-0236-08dc55420a24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 07:28:51.1061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS+hfJSsrEOiU++0EXfyWbM4RkqEdVrqtWwANXd1rZwQZibfE4ZwNEcM9L5Z/AbGglvDPms1AiUMwSKAbQA1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
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

Hi Karthik

On 4/4/2024 3:38 PM, Karthik Poosa wrote:
> Return u64 from xe_hwmon_process_reg, instead of a void return,
> input pointer and a bool return.
I don't think you need to add this bool return statement.
It might be for a different version but in this patch i don't see any 
bool removal.
> 
> With this caller can directly assign return value to the variable without
> need of explicit initialization and pass by reference.
> 
> v2:
>   - Fix checkpatch warnings.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 55 +++++++++++++++++------------------
>   1 file changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2385f05d9504..e234321c165c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -121,31 +121,30 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	return XE_REG(0);
>   }
>   
> -static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> -				 enum xe_hwmon_reg_operation operation, u64 *value,
> -				 u32 clr, u32 set, int channel)
> +static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> +				enum xe_hwmon_reg_operation operation,
> +				u32 clr, u32 set, int channel)
>   {
>   	struct xe_reg reg;
>   
>   	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
> -
>   	if (!XE_REG_IS_VALID(reg))
> -		return;
> +		return 0;
>   
>   	switch (operation) {
>   	case REG_READ32:
> -		*value = xe_mmio_read32(hwmon->gt, reg);
> +		return xe_mmio_read32(hwmon->gt, reg);
>   		break;
you can remove break as there is no other condition and always returns
read value
>   	case REG_RMW32:
> -		*value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
> +		return xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>   		break;
>   	case REG_READ64:
> -		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> +		return xe_mmio_read64_2x32(hwmon->gt, reg);
>   		break;
>   	default:
>   		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
>   			 operation);
> -		break;
> +		return 0;
>   	}
>   }
>   
> @@ -163,7 +162,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 0, 0, channel);
>   	/* Check if PL1 limit is disabled */
>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>   		*value = PL1_DISABLE;
> @@ -173,7 +172,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 0, 0, channel);
>   	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>   	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> @@ -194,10 +193,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>   
>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>   	if (value == PL1_DISABLE) {
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0, channel);
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0, channel);
> +		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
> +					       PKG_PWR_LIM_1_EN, 0, channel);
> +		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
> +					       PKG_PWR_LIM_1_EN, 0, channel);
>   
>   		if (reg_val & PKG_PWR_LIM_1_EN) {
>   			ret = -EOPNOTSUPP;
> @@ -209,8 +208,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>   	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
> +				       PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
> @@ -220,7 +219,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
>   {
>   	u64 reg_val;
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, 0, 0, channel);
>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   }
> @@ -251,8 +250,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
>   	u64 reg_val;
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
> -			     &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
> +				       0, 0, channel);
>   
>   	if (reg_val >= ei->reg_val_prev)
>   		ei->accum_energy += reg_val - ei->reg_val_prev;
> @@ -278,8 +277,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -			     REG_READ32, &r, 0, 0, sensor_index);
> +	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> +				 REG_READ32, 0, 0, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -367,8 +366,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
> -			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
> +	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
> +				 PKG_PWR_LIM_1_TIME, rxy, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -483,8 +482,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   {
>   	u64 reg_val;
>   
> -	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> -			     REG_READ32, &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> +				       REG_READ32, 0, 0, channel);
>   	/* HW register value in units of 2.5 millivolt */
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
> @@ -769,8 +768,8 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	 * so read it once and store the shift values.
>   	 */
>   	if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
> -		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> -				     REG_READ32, &val_sku_unit, 0, 0, 0);
> +		val_sku_unit = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> +						    REG_READ32, 0, 0, 0);
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
