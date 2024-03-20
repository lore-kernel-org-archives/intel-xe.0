Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5858C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 20:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831D510F6A2;
	Wed, 20 Mar 2024 20:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlG6I9eH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507610FF47
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710967215; x=1742503215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oirRk1JEpjTSzMp4kBT5IuZdvyhRYSBPv0CaYNM7UaA=;
 b=GlG6I9eHgfAtytCmPGrRYDKqmwY0xYtD1BRNrvbpZnqANs1nMEaaCuvJ
 q/7O2ItxNiCSA8hP8ZR/xxFNvt0NiSZfWbK4doNnBhzQo88kgsLjhpcJW
 nd7dLBSaN3n589UkHGs5hGjOhwQgePvrit3Mz0ilA+9Pkn6ycWUrLjqG3
 sC7RF8m8SeqyfScvqDsoEZuNZnKcBvrKZ0f1JhpXfNgjx8QKOSBWTNbno
 QP/g7sbuGfNpvY02AYYOczoazKvtfFtyEv2uhitkDfrD7wVxzcxvRRm9V
 gX1vbwetpXd4mOIYo41DBaY9wjBHapP7q4cA+cpOhn19tk93/PbxrmpfO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17375811"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="17375811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14664584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:40:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:40:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:40:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVgtPz85Us3rMrYqrvGF/iYLsQHZgJev56iGD3+qVqHdwXSnje36IJq/E4m+d6qZqM3yAUjbyug7DtycC6TvkYBwWkCmz8sp/TYBZwskBZbGZL3TdbSfeDOzF+XUIHGd09EKTXmFTLTwTTs/FHVuk9UsCnJRRnELUsJSXR3/6VaZXeRVTlZ98XTINeCbzJfSvvHEI+WSv4+I7AOo/NAy5NSRR+eZhhdf4mjwqB09jNqIVAOUP6wNDsApKdolOMBlpeOzNeoF2QbJOsMnGrjegnxO4uwyrCkfJZYNJRFsatc1ftdQPIDBcsCfy/TvpGz5DLmtJTWUwLuIO6Db51F1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnasX484G2TPne6Gvo65LeaAL3mj7/f/od70xKKM3x0=;
 b=KHlKd5XP6OcHeLnDZnVtcbrDXnXzKJmE+7E7hiWh//qcsKDY5sVp7K+g7wGF7D9VKqrVQ+VGOEcWraH3eN0LP84NTxNBKcxOJLKJk1yj9iavMpNYEeI0b8RgaXEs7rEcZdX5B2kLE6TfaHW4b/QiYbCTazlaVn0FobTQ+dih7Y4AbCRT4Gy8P14MO7mQcALk0L/4mVKdiKkR9hvCrGFPewcpVERWf24/rbKeXL7WFidKBbO8Gg0gZKLTb9Pw5S/fkaqPHksX0HgKGUjqXWrNw0i5/yC8djHliLy9ylUQQX9UXvSfQ72/XwvXLHVIfzWgANOUUE6FiHMrg6jrE8PvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 20:40:11 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:40:11 +0000
Message-ID: <c4637cc6-307f-42d3-859c-15b9c304b44f@intel.com>
Date: Wed, 20 Mar 2024 13:40:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-GB
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
 <20240319160859.2672825-2-badal.nilawar@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240319160859.2672825-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 458c3d95-8374-4c12-1117-08dc491df020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIX0g4SzgpmiF4yRgp3IFgM8l7lst5R5G2lBuUU1kGZiVmhD0WqAC1yrj5vPkKYS4iu/MEgNbpvHU+IvByzSP7O3m7Hoa9MdwU8ASDgkaVXD2YhALqfGsB7soDq9ePlJWs6wlhiF09YVrryvH8c9WYoJGGsqwj/MqxPW0h0Xh1gWHOPDuXQmoltpkw/mRIJtqNQDqvdkcKjXq2GmVn+AbE0PCRMAQhBL2OtbeyJbm7VnuiOKCQZ4NGn9K2SBLJ43PhoJkS7/xx86GHZ55GhVciFOlC71f0uqp7BvjWJkInHzfNDKJkeycl1CfH0Mn/+en4xbp+eVRulzxV43rqDHvLx5itNFhZ9AhNS5TjuuBnodVZN7Tu0tACKYSpJ6rF/IOoKKTfTlMMhnrveltH3lTW9CEYGjmeJWShYjgqlMKESYkj+D0DKjZDDTBb645Ff7ZgwKZYXbx1obMUf+cvcbVST8G673M7TvR/lzr3+++GOOYBtcbvalS+GDmzqjth8i1m/f22G9T4fUjvJxoFXIFCrvntl5XsmGEqWSFucd14tRIFfd2CRsIEjvtzK+Iq8gJabhGUTVBeP72jg7DyVF4Vy2+Hwm5K9VHhQw/TeJ9wc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlNMU2RrVlFVbFJwWm1lcktvRkZodFkyRURCa0RNb2hFSUtzYnYzWXZ4cTJj?=
 =?utf-8?B?NDQ1MVg1YTlUVHJNVkhYYmFFWEtIM29qcm1XK2xTRGNNRFRWUVVKSndaVWpl?=
 =?utf-8?B?ZTB2Q3ZNSVdIclBGS1c3Wm9TMStSSThtRlFqZVk1LzUwV3QxWUxKSk1uZjNp?=
 =?utf-8?B?Z3J1ckh0eVlrY2dDYi9KaU13UGE5OVU4WmNWbkd4cml0Vmc5aUMra2RwRUVO?=
 =?utf-8?B?Q1FmcXZ2NmFuamplM2JERDdsVGxrZFBOUlM1aXY0RmpBM0VGNHNKWVk2Vlpn?=
 =?utf-8?B?Lyt1S3g5R2hlQ3dSZjZmRWNsdXF5b0l3SUd4eGk1ZjRqR3RIL1NBYUwvbzNq?=
 =?utf-8?B?OGl4b29xVml2ZHlWU2hXN2NsOFRmSUwrbWFMYjE5L29lS1dKbTNrTzU1OVph?=
 =?utf-8?B?R1ZHY0JQdXdDV0VGNCs1aE5IbDlNTkpQSnU1UGRxazBpMTdWdHlid2JpeHgz?=
 =?utf-8?B?bnpEWGxuenUrRStZOW9qTlZiZWN6SGhrdENVK2FEcURrNDhpcGl1TlV1Qm9B?=
 =?utf-8?B?VEtUV3VKTTBUTDZqUHp1bUt1V3d6SDhic2hwZFJLeTZWNklWNVlWc1liUFNr?=
 =?utf-8?B?WS9TYUFyazErNlZKeE1PNzFrVzBhdEVGY1l1UFdHSlo0Wkdad2pUdVlvT0NV?=
 =?utf-8?B?S21uVUppWm5hOTRVN2J4SmtLOXhNRjJVTThPS0oxd0V1ZmNxUlFSNllacWVK?=
 =?utf-8?B?T3UrTC9sNldEUjIrSmlzZGpPdS9QZis0NXo5OEZKQjA1a0RDbmJMbXkxQzg1?=
 =?utf-8?B?b3UxR0o3Tlc0V1k2UEEwdm1oN0JQY3JIY2p5Q3paQWZScHRTVjNJaFVMNVdl?=
 =?utf-8?B?S1llaU9LTXR0bXFOWWJ6TnFVMWxrSzMvVGQ5RnZlSEZJaW9BMGZCZU5GdnNp?=
 =?utf-8?B?anFiNTJoTzlCZGVHYWh6TUZJV3FjYkY3WGNpQ0NwSmNWMnFDNnQxbG5zbGU2?=
 =?utf-8?B?K3dlbFFSRlNqNExwaFMxd3BOczlENDhFTCtQYlNMZERKNDJ1QTRkTlMwVlFp?=
 =?utf-8?B?dGJtN3l4MGxLOWFPTWQxT3RSK2FVbEE3VVZaMEx6Mk5ZNS9VQjJ5WFpqOWZy?=
 =?utf-8?B?N0VaUEZyRlJUajUycXord3Fhd1R1b3dON2xMYWc4WDF1Z3VIWDVHOThrODE4?=
 =?utf-8?B?VEcrcWVtM1NaNHlObUMwL2owTVd2Nnh5OXpaTERkWCthbVlyUmpRL1VqbXVX?=
 =?utf-8?B?NStvd0RuVUplVUNaOXlYQWR3RFUxdVI3OUJxSXhQa0N2dVlRUnFLbkJCU0JW?=
 =?utf-8?B?LzBIUDYxYnBaVlFETUIwQ1B1OUwyMTZFVkxndU5ud0YrMHZlNmpJdVJSaW5J?=
 =?utf-8?B?NnBhYmxhRVd3MCtUZXZubHJKSDY2eXdZNFNBVjhLQTBxMVJxRnBRSm52cDJQ?=
 =?utf-8?B?UzVEd1B2a2hqdzl0VWpPaXozN25WeVh3dkttOEl3WVNUMjk2a2tFVStpZGd4?=
 =?utf-8?B?RVNTY3FzRE1BZWU2TklrQWo0cHpwQVZHVVU3VW5ZL3FobC9aVklKR3Nodnl1?=
 =?utf-8?B?R1BIUi9mUElEWWtGV3UxbTZ2Ymc5RjdFa05hWWFGT1llQkl2UlltUnFSVndI?=
 =?utf-8?B?NnU4cDJEcndSbmlvS1NUL0VKN0lRUmlReFZBSG5iZjJqbmJhZFo1NlNTZnBi?=
 =?utf-8?B?MWc0SklwZG9zUGdYaHQyY3lSMlNxNGtQUFdqMzJScll3RlduQ3pvOXRPTXlP?=
 =?utf-8?B?VWdoRmZMWWNOWTJYRXpOZzB5WXRER24yRnRFb2EzUUZkalhUanlQMThyNWs4?=
 =?utf-8?B?UWx4UXJNM1BHclVvaG5sdStaRWVxejlFMzFsZjRzUVhXMDMrcE5zU2hHVUdu?=
 =?utf-8?B?cmJ3TVpoVHErK1ZMQ2R5anExU1VhSVh0dXpOSEQ5NFZhRkE4UGJlb1hVdHdk?=
 =?utf-8?B?WVZSWmNoWG96MnRINzdFVitFM2JYbEFoVmhFQmRZVDVBRzZTejVSM3pNQisr?=
 =?utf-8?B?NWZkUThtYXhoWWhrU3B1THFQN3Ivcjg2UDlqZnJKQVhYM3ltV1lkWnBXVE5G?=
 =?utf-8?B?aVh5QS9kVXpsVThXMWd0TzFDVVk2T1VQNFA4ZzlWNktKNTJ2bkxNTEkyQWxY?=
 =?utf-8?B?U3VrRCtENlVkSi9KcTFXbnRFU0paTm1LT3RaUUhFVy9FZG1JNGo3dFA2dnBX?=
 =?utf-8?B?MDMvYXNjZEJvZnhQd3RHZ0dYS3g1NnFMU3NlNDdhMms5UVVuOUF1MGZKbXpl?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 458c3d95-8374-4c12-1117-08dc491df020
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:40:11.2844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcrjrbqnzXJIqWGfuVtGQjwYpY9kefox85/gGHKy5rqU72NIfAYeVV1C6K51h41bpS4c8MZH3Edb9fRTLm5KucZni1L8ISCZttnblKmFmV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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

On 3/19/2024 09:08, Badal Nilawar wrote:
> To prevent running out of bits, new w/a enable flags are being added
> via a KLV system instead of a 32 bit flags word.
>
> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>      anything below < 70.19 (John Harrison)
>
> Cc: John Harrison <John.C.Harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 61 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>   3 files changed, 65 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6ad4c1a90a78..506f0be35763 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>    *      +---------------------------------------+
>    *      | padding                               |
>    *      +---------------------------------------+ <== 4K aligned
> + *      | w/a KLVs                              |
> + *      +---------------------------------------+
> + *      | padding                               |
> + *      +---------------------------------------+ <== 4K aligned
>    *      | capture lists                         |
>    *      +---------------------------------------+
>    *      | padding                               |
> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(ads->golden_lrc_size);
>   }
>   
> +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
> +{
> +	return PAGE_ALIGN(ads->ads_waklv_size);
> +}
> +
>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>   {
>   	/* FIXME: Allocate a proper capture list */
> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(offset);
>   }
>   
> +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> +{
> +	u32 offset;
> +
> +	offset = guc_ads_golden_lrc_offset(ads) +
> +		 guc_ads_golden_lrc_size(ads);
> +
> +	return PAGE_ALIGN(offset);
> +}
> +
>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>   {
>   	size_t offset;
>   
> -	offset = guc_ads_golden_lrc_offset(ads) +
> -		guc_ads_golden_lrc_size(ads);
> +	offset = guc_ads_waklv_offset(ads) +
> +		 guc_ads_waklv_size(ads);
>   
>   	return PAGE_ALIGN(offset);
>   }
> @@ -260,6 +279,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_init(struct xe_guc_ads *ads)
> +{
> +	u32 addr_ggtt, offset, remain, size;
> +
> +	offset = guc_ads_waklv_offset(ads);
> +	remain = guc_ads_waklv_size(ads);
> +
> +	/*
> +	 * Add workarounds here:
> +	 *
> +	 * if (want_wa_<name>) {
> +	 *      size = guc_waklv_<name>(guc, offset, remain);
> +	 *      offset += size;
> +	 *      remain -= size;
> +	 * }
> +	 */
> +
> +	size = guc_ads_waklv_size(ads) - remain;
> +	if (!size)
> +		return;
> +
> +	offset = guc_ads_waklv_offset(ads);
> +	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
> +
> +	ads_blob_write(ads, ads.wa_klv_addr_lo, addr_ggtt);
> +	ads_blob_write(ads, ads.wa_klv_addr_hi, 0);
@Daniele is pushing a change for supporting 64bit addresses (for future 
compatibility) - https://patchwork.freedesktop.org/series/131282/

Is there any value to changing this address to 64bit as well and 
changing the hard 0 to upper_32(addr) instead?

John.


> +	ads_blob_write(ads, ads.wa_klv_size, size);
> +}
> +
> +static int calculate_waklv_size(struct xe_guc_ads *ads)
> +{
> +	/* Fudge something chunky for now: */
> +	return PAGE_SIZE;
> +}
> +
>   #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>   
>   int xe_guc_ads_init(struct xe_guc_ads *ads)
> @@ -271,6 +325,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>   	ads->regset_size = calculate_regset_size(gt);
> +	ads->ads_waklv_size = calculate_waklv_size(ads);
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>   					  XE_BO_CREATE_SYSTEM_BIT |
> @@ -597,6 +652,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>   	guc_mapping_table_init(gt, &info_map);
>   	guc_capture_list_init(ads);
>   	guc_doorbell_init(ads);
> +	/* Workaround KLV list */
> +	guc_waklv_init(ads);
>   
>   	if (xe->info.has_usm) {
>   		guc_um_init_params(ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 4afe44bece4b..62235b2a6fe3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>   	size_t golden_lrc_size;
>   	/** @regset_size: size of register set passed to GuC for save/restore */
>   	u32 regset_size;
> +	/** @ads_waklv_size: waklv size */
> +	u32 ads_waklv_size;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c281fdbfd2d6..52503719d2aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -207,7 +207,10 @@ struct guc_ads {
>   	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>   	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
> -	u32 reserved[14];
> +	u32 wa_klv_addr_lo;
> +	u32 wa_klv_addr_hi;
> +	u32 wa_klv_size;
> +	u32 reserved[11];
>   } __packed;
>   
>   /* Engine usage stats */

