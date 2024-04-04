Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BC3CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 10:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED7A11B39F;
	Thu,  4 Apr 2024 10:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPfhoNHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFDE11B39F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712226934; x=1743762934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qcMBjMYbfwnSnNtbZJr069isgWVDFfxykZ5AteqEM0g=;
 b=PPfhoNHWNq8V2lEpnmwhaij/0am264cf02TJjdrpIJ6n1osml3B/Ips+
 lpASoVSrdbSjhvJpQgAG0Xjde0LITUYucjW7tl9MEe2AoDtISFuXwUJuP
 ZzVnbp4EjIqUL0mNeYdT79nUt2O7QfVu7biVJsLzNeKbAymGkW7DvKb09
 yPJIfKvS3iGSaFN6fO2T8KT/iclnx6wfnR6W29w3f198YxDoSc4q9PDn3
 rDPd7ecdvPLSNnyJleuFAuFheV7ffkaCyUkkGI4gdxwl59luKzNv1qymx
 4CVsOBojq0UAsUFjXrNoEfjdH1yyhMp50weEho+EvW76v0pBB3MVhyIeT w==;
X-CSE-ConnectionGUID: KLz/nH4eRTewWUnyDfIirQ==
X-CSE-MsgGUID: a9+Dso+VTMiX8OsSq/DbJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7340570"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7340570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:35:33 -0700
X-CSE-ConnectionGUID: wseucuR6SMqBJL7DW9hXSg==
X-CSE-MsgGUID: z+ZQQqWqTBOjQeX9qHdJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41910610"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 03:35:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 03:35:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 03:35:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 03:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELYp7SX2JMQYwiGMj9BKBQZJKZS2oQj/8bP+vA10HniuIzY6KvvTfQHNSAj/2aL1XLE894HOCco46pO5cQ0Q4K9gFkie9WgjgBEoBk6g05CPhps/UGnNgvkzlX8r3ZWhG6f7+KAGnAh7CIDRD7W19rPMRi2P7ohmZD545Kc7ZJCPea29F7mGxPu+WVYtKm07fhI8JxEGQ3ljKZehTEnIcQhV/o9p3aTm+e5F7NGJV3kHVzVX0te5hXOGk49lPguqibDX7mKL9JG5M7mknkPFA4WWRWXk9W6EEBX1Hx2w9C254JwJA6LJOvrQE3HNBocB9gAN1jHqp8x4h3DF8JWtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdUBGOYNiUgo7hsHl/IPjX6z6eCWjzfVJSEODYjhV9s=;
 b=fsdGunf9A2bwbnwPxS9H9nhvnTpPn6ksp4v4KBcfYxuKv4LTW0svMiOJAaU/+EjJmCbqbBGPe1lXcUFITwPuBiuSCjvBX1mJnIsstefvxic+y8nXcxrG/zzJZn9IwlSUgy421fKBxo2/WSYjSXeK9gFF8rtJZBn/qZh5VrF8W9TPrFtBwZWxtedcdXEyBA/kSP7VUiVpA9oqJ2+/TVTCVm+V0BdBkMiU8336h+7tTsQKYy2uCWOb4XakhNrsrmZ4ldHdiBoX6/th8rTbC+sosefqJ9J2SFcjTLEzihIXRWxbIJgs+fzoSSjdFRfqokpb8ykNcRpr57Bf++eVmltZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 4 Apr
 2024 10:35:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.031; Thu, 4 Apr 2024
 10:35:24 +0000
Message-ID: <4f66f854-1f8c-453e-9771-245cf677a828@intel.com>
Date: Thu, 4 Apr 2024 16:05:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-4-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240404035441.965590-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN0PR11MB6033:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x12J18osMrVaLipDu91FPpi5BCGSEKU0vqZgISzeNWHBqVFs35lY2ePTw7EBBCfJ+A+9ZPMbfNkXpGgPXOugz6C0WT8yS+USPR12DUmQYXKqkE1vWBx0ax/0an49IhdHlZbapH0u4HsmInKwadbkM7NY5aqc1wadBV5Ff7WbGU7pwbWmJ4hIoW/eIiWJ0aa2qsSlLdvEqvyuMG5ozj7eY2U32tgD1xHEPseihp1a36FtDhf3qIXAl+lFLnstqXqsItJ2cBRXJuxgzz9hqQvLDcJMsPtIK69Pbu1Vwx0pxvQ9LiKVYLLK97MfFuBWm9d78KNtrIz85bxCOtlIY27KcI8S6oHDxN7aVURABSA2BOibocze9edTTCcWkZRHzmKZyG9yONbzezh2D8J/fHvIJkMDwcHlKhN3l/dEtCcdK/oyrlq6I0C0TP2lMw0f08g53j9zv5htl1UbKgsMZ9OZKN5MsFdTwTAubz27W7gCt8KMY3sG7Am5UVYkz+0GKmA7m4wHbw+eSvgSgfqW7tAr2ndi0GTwQjyNTbTaNrNAA8VnIYwux6aZLbR47vE3DH1/LKCOAWKQExT+uB/m2j+xjcw5cy/X214+Ck8ViDXP85+mWNzzEzK2aQx/dNs0FvAoQXz2ULQuACc8hs1YVhcAuibsUVDi/PfaiivOeK1YNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d296bEQ4OXkwWmRKSlZrY0lFK25ncmV0M1JaN2YzSHpKOCtDVWRXVlpCUnNX?=
 =?utf-8?B?R0E2MkdKOGxFb2cwdzlCWkg0eHZDRUVSbjNtaGxMZmE4M3Qyc3U5US9lK0hW?=
 =?utf-8?B?TmhYS0tnVG1QR1lWL1pVVS9qS3lvREtrU2tsL1NlRTBqYkJsbk9CWHBSY1F6?=
 =?utf-8?B?VDVMbDVjaDkwYXpaS2RvbmVxcmdmWmFjREloR21DKzlpTG9hb0U5MzRSa3Ja?=
 =?utf-8?B?YnRnRjdyTG5aVUpkckZ4b1p3eXdSN2JFRzRZbW1nRHA1dUFsd05WR09wcFQ0?=
 =?utf-8?B?MzhIVDgwdTQxODMwenhtUDh4eHNFcTdETmJCYTlPTjNyWmlzaUdBRzdhUm5V?=
 =?utf-8?B?MDhwU3owdUpSaWlSSlk1WW4ycy9CV2V5ZWpLbW5uTDJMeThza1RmeUZLdUR5?=
 =?utf-8?B?R05veVk5TUI2NlUrUmZIOVFzWUlzWDdjM0tlUVZvMm9ESkdqSitET3U0SnA0?=
 =?utf-8?B?aGIweXRXT3lhRm8raG1ZVnRGcFFEclQ0b3g5WVcyY2J6TlYxNzRhVi9KcC9T?=
 =?utf-8?B?ZVQrd2hFMGRHNXNua1YzaitqblhtWVNtdUJlVTlEc1RRaXU3OXVaTUc5TEtR?=
 =?utf-8?B?NGlNNHNielE5SytreEVrOGFkVk16WWRDVEhheFpIZ0dSRDNzR21ZeGlmTU4w?=
 =?utf-8?B?K0dEQXRuc1hsL2M3cDg3akVjWXdVRi8xR1c5MWhQUlZSWlprd1poNjJHbEJK?=
 =?utf-8?B?dTlldEtTVW5mMUxhODlndUFhekJXRS9wSjZidWh2TzFrd04veTNnN25Jcm1R?=
 =?utf-8?B?TE5FM2MvRU42OEdxSDB6WU55NDc1cUlFVkx2ZGRNQW5rRlQ3cHVqTHRtT241?=
 =?utf-8?B?UnR3SW9JTUp0SVpSM0RVNGtrUGNDZWlhYXd5bVhmYVJ3VWF2Y3dDVHExeitt?=
 =?utf-8?B?N1VpMHE2QW04cHZKRktYbFNLRnU3c3h6dHlXV0xvWElZdHhlY2RWWUl6VzBu?=
 =?utf-8?B?WGlwN2dIcVRKM3FCdEUwMjd0NDN3ZW1BN2hTQmZ4L0ErNDlkWVE0UnNyeVdz?=
 =?utf-8?B?Mkdqd1BIaUVPV2ZrQmtaNWVXTUttRExQbWFlTjBiYnJ1MlpzUVN6NFVPcnhn?=
 =?utf-8?B?N0JQdm9qdGV4RHZ4WE05WlJXL3pHWmVaRVcvOTFuaEFXODF4aHljQncxL1Zx?=
 =?utf-8?B?RzB6WVpiQ2pBdnJtNWxuaEsrV1RxRjJCUzdNOVI1c05ITmhBMWtwZC9POEF2?=
 =?utf-8?B?ZVJKVDlic3liSklPWW9SaHdKV1pNWnpHQUJNWWdUT25ZNWZWNjVyaW5vVThq?=
 =?utf-8?B?cTBJNFJydHQ0azg5K2JFa2RWdmFHMERzK2EwMGhWNDlFM3hUL05LMUROME5E?=
 =?utf-8?B?clp4R05DMXRXVFFKUmh2NDI5MnI0OHVmazA0MENkeE9RR0F4dnk4c1ZrUnBv?=
 =?utf-8?B?YUl3bW9VVi80WWNtZmJ0UFVwWWRkVXNYbXpXVWxTUTJjRG81bEdEcldodGta?=
 =?utf-8?B?SzRYVU5OOW9XcGY3QTVxdlplNXB5WVBMbVZwcTBNTlg3SjJqL2JFY1V0eko5?=
 =?utf-8?B?alV0OTNBKzlXL2FDeVAxZHM0emVEL2tsUlR6Y29yZkg1OVlqeVlMZVBqS0lH?=
 =?utf-8?B?Zk5QVjJWbWkwdGVVd3BmVWJZQ0VEQURSNE5vL3VYdEVzTHhlaVBUKzY3QnJi?=
 =?utf-8?B?aU02akFWQVlBK2xuKzhWazZNaWhObnRlMmdsS1ZOalJQYmY4eSthenFhcjEw?=
 =?utf-8?B?cXlNby8rWm81Uy9XeXZhODBRakNFN01aU2JtUmVEWlRmeUdyMnh6WXIyaGhZ?=
 =?utf-8?B?clhpVTJ1bmdxZ0g5b0psbHNUcHlFM3pQWVVwblh0Z3hDeEJ1UzJUSW9nbzFK?=
 =?utf-8?B?a3ZBNVBUQjF0OTZ5RGFEQnRGVlJuY2NRazczYUtuZk9TTUhQdWx0d3ljR3A3?=
 =?utf-8?B?d1VPRWJNTTUwWkx6Q0NDZWNvNy91WEFnWkpqVUt1MndUa1d1Uy80M0lHTFU5?=
 =?utf-8?B?Qll1UUV5SnZBWnpKNHV4dFNJcjljZUNhcWNWYXRXRnNIVmRyamRYY28xQU1p?=
 =?utf-8?B?RWF5Sjk4VkY5VnlmY0NCSHMyUk96bS95WGhOSmtBWHJNV1MzUEk4U2hoalE3?=
 =?utf-8?B?cktRVk9UNzgwaGxpR0RlWWNVRFYyMTl6UEZiRU9qWnR4akY3V1hDYnFkL0lE?=
 =?utf-8?Q?OmbxppfGkxN2nD0PdELmmWvmy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3368f645-34b8-45b4-5b71-08dc5492efb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 10:35:24.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCHh8oEiSJhXEU9JLout1oMoswZ9lhY6JcML6aaRawTbqKfU2nvc5CCGULBaC9k+6zi7crIsOXEj8Wq73Gmu8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On 4/4/2024 9:24 AM, Karthik Poosa wrote:
> Return u64 from xe_hwmon_process_reg, instead of a void return,
> input pointer and a bool return. (Lucas)
what does the second line mean? which bool return was removed?
> 
> With this caller can directly assign return value to the variable without
> need of explicit initialization and pass by reference.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 45 +++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2385f05d9504..114aadb54c8e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -121,31 +121,30 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   	return XE_REG(0);
>   }
>   
> -static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> -				 enum xe_hwmon_reg_operation operation, u64 *value,
> +static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> +				 enum xe_hwmon_reg_operation operation,
>   				 u32 clr, u32 set, int channel)
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
> @@ -194,9 +193,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>   
>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>   	if (value == PL1_DISABLE) {
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> +		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
>   				     PKG_PWR_LIM_1_EN, 0, channel);
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
> +		reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
>   				     PKG_PWR_LIM_1_EN, 0, channel);
>   
>   		if (reg_val & PKG_PWR_LIM_1_EN) {
> @@ -209,7 +208,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>   	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
>   			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
indentation
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
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
> +			     0, 0, channel);
indentation
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
> +			     REG_READ32, 0, 0, sensor_index);
same
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -367,7 +366,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
> +	r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
>   			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
> @@ -483,8 +482,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>   {
>   	u64 reg_val;
>   
> -	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> -			     REG_READ32, &reg_val, 0, 0, channel);
> +	reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> +			     REG_READ32, 0, 0, channel);
same
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
> +				     REG_READ32, 0, 0, 0);
same

Thanks,
Riana
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
