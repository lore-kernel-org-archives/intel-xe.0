Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2CBC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 22:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4604810F1AF;
	Mon, 18 Mar 2024 22:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCePVIBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2910F1AF
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710799902; x=1742335902;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h2KCi/KOZAUPkQgjXWsyLaLsbCrTlIFFu7SY4jNqpow=;
 b=eCePVIBcFROvfd28jdxhYYN1MQCOEC3x+FM9DFRkk05yogMxni2KmHlz
 GF2m4i1xfwl3F7WOvkQx2LXYxbNo6xTINnic/sU8umV/OUAZLYpxRPt1P
 KatJOxhsF93wGNntzyhk1L0iB3DXstODuy6Oe/MTn4B8p+7WHs0070qis
 GkG1v5gmgGpQd94uniyO24GqkLj0IdGjh3JWzMNRdozhiEINbRWOgOCxW
 1AJks7zVtfPTcAftfP0dktt2RL+rhWLA0u/DX9vbm1VaA/PNL3Peng9X/
 Jg8jGiAX8Ef0T1p3oTSQfTdhYE47j3HBmrU83dIrDMbQZebiZN2PPcrEb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8584846"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8584846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 15:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="14251796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 15:11:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:11:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 15:11:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 15:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbDm6ievMAWgxv99g6kXXnUCKpEE2KfBVgurhcVkSpK0vjfollPchy4Zl7NOBr7/liB98YHEjxGiT+sgLgBvEZepVMJWMa2U+N2FYYoSNIB+NW2ohIqs14pP+i3NbueFHD4mQGsLy2oALiIomVpFwKBLxgwMzIrVzUEWkNyQY6bfi8pbtEalvNpHH6vuDTnGr9bhYad2WfoAw+uopW7zlhOzYoANjfKAT0/jeyYuXjpVMUKhkeYU8a6A7i1X4etmdgZR3pryOHF9CruhlNj2TewN88ROObnrDHttfFndUaoT9UYw/jbkRtHMO5JWcOysDiw5taTkMfkcIE8OibbYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydXR/A074vqCSPn2V7RgdZJiEh5EzmIaT3IaZ5IRe9I=;
 b=iNT96CJJYQN5x4ED9iA5dMu2hJWqeTV6j9fq+1OuixYd7xfBs96vYkQn7KdUImwZerm7aAnT1O6CI7mpHYba+F0rbu9CrIAm4tcJ64Blgf/Hfa8qT55x3gfruAojbsy80TfL1ECtkTqo2Izh9hdTOiY9n2/+3Lp2RXbjYREgQJjupJvclbi/hkSJkZT+JUWgKpCGbkKYpEA6wnp2KC3hM8VF1Nea7otfmff3IKM95unaIHHuG7sq+js9R46mzqIKAk0t/wwQmC64nJpdAK/L843CJOsNs9ZEna5ShkA+hNbzEx/dYiKUsvylNkCWEFPAPWpMSr8w1x1miYNKnz08hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 22:11:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 22:11:35 +0000
Message-ID: <e4dcce08-40fe-4a8e-bff7-2cf70a404766@intel.com>
Date: Mon, 18 Mar 2024 15:11:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-GB
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
 <20240315112147.2460691-2-badal.nilawar@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240315112147.2460691-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB6843:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zQR5I8XMUwWhx+MRo6kmrRm7k7fsktZPTWye/bHP33hU7ysV95IRHFyLnBp3OJuyTrPlR887Ffers3jt4u31OKY4IP5vk7Kwr6Xl4fsjcwFRfGqpwyejxSei600fQP5QFyUX/cQEzQ72Vt+PdZAV/zYTS53MTl9nHHsJYywvH3igTy0AhD4ja3XQNaIXEtkEEXvGmXpHr+TqkTofTr7rRBHR2pnS7STCc1OyrkfgCKU5W5/I6NyPhLD+Bq4aDA3afBSVJ08MxSK1VCBgoUNw+32e3rIj+3Z89RQCi24nitkl32ChVc8t9TyMxRDYcx22CKYw9BUy4nr96oIUO3wzvmxFjAAXEqu/mQSWk2B7CgzYiQyqwCSWkNzHLzuDJ090f6bmPRq4xn0cKmzr3RLyG4qqfNp6SH9WCrIvQUvhEbaSLBObr/X3ZwKlYCzTyLJdNs0IHUHdvFK+l0LyZE6gWZQaMuFjr1R4wUEgtj3HLgVnclvQGqN0u2hd8CyV90WmBKNm1rludJN3+GnyQRsutDU7JYNsc+i52ZyTMvuAFmy8l1plgP/0z+YOSBZWp1LDC7LmDBFqUNtgMpZyZb+cvYg8dFUjicS06pFa36Xsg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ano5S2liRjZxWDFMNExGZFprbFl2ZnhtbzlLUkRWeXJlQXBWZm5EQms0K3RB?=
 =?utf-8?B?U1g0R1pNbmQ5SmpEYkNFZGRBNXdTaHdCMHBOSVRjRWFRTC9GNWpMRDdUNjdG?=
 =?utf-8?B?NkZNOStwendIbHBvV3NZVDU4YXN2c0JUQUo1L1Z0R2VkUzVvb0FqM1Zvb2hR?=
 =?utf-8?B?K0hJeDlJR1lvQTQ1MFpLVW9JMzBDbm1zeXJFUndaWTRsTHhIWGtpZkVxUlNQ?=
 =?utf-8?B?eEpab1NaTktVU0ZpVHlCVEZLeGNMNElIa3AxT0U5ai9OSHZoNXhEZ1NvcXdU?=
 =?utf-8?B?M0NUY3lpQ2UzNEJIaHZxTkxtb2FPeEthY21aVzB0U0Zjb3VHaTc1aGhLL0lO?=
 =?utf-8?B?eWVQK1NCaG8wSFNSOEtDMlpiaG9EL1hacXFBY0dDK2ZqZjJqK1ZWK1ByTXY0?=
 =?utf-8?B?Smh0YUwvalU2Mmh3eHpTYW9tTDczdmdwbm9GUVFIc3Vsb2FwM0l2SVg2Mzln?=
 =?utf-8?B?cUdmaU1QVTJNNWdTSWYvdkRoZzFyS2c1VzJISnpkT2FLdkNPdEZMTGJxNjd3?=
 =?utf-8?B?VEluaFlZbXAvQnhlUjRwMithL2lUWlpkaldRSGlKcW1UeTZQRUJBaHFRbXFR?=
 =?utf-8?B?RlZjcE8zbjZOZEJ1Skhaeng0c2JRM3J0emlPQnBPWE9rdWMzVG83eDg0SEpM?=
 =?utf-8?B?Q1VjRnhybXRPUCtzV3dMTnUrWTg1MnVCMkY1S3NzSFVuWU42b1dBWjBlYkxB?=
 =?utf-8?B?dXI2Vkg0U2VyZG4yWnplMHZlKzdwUFh4ZUdFWlJZR3RkSWFRbU9UZnpqNHZD?=
 =?utf-8?B?Y0c1bmFJaUZvVGNycEFOQ1JDM1lod0hHbHpXcExjcThQODZVNVVnNnk2dXg5?=
 =?utf-8?B?MnJBTUJ0S2NubFdzOWczSmZVczFtYVFxNmczZkwvQSs1c2tReHIyM0t3RVo2?=
 =?utf-8?B?WDF4M0dpYnVlMTZ5SUpSR3V6QmlWVlhURU45QkpNRi95STExQ0dBdmp3aDBy?=
 =?utf-8?B?Z0RCSzVJMTRXdEtIeThxS3l0RFRXVFU5WGU4SHJ2N2hFUDhwQ3NjU0Q2dzRE?=
 =?utf-8?B?dlpJVnRMMm80aHFsNUJWYzVyV0duVStCZk1jUXpIa1FoNFBJYnBteDZKSGhS?=
 =?utf-8?B?RXJkTFJZOVBYYldsTmhTbHJ3Rm5GOHpOc1crd0dTc2RZczhUL1RpTGxqUUFV?=
 =?utf-8?B?VlJab1lxSXFzK2xZY09xOEpabFlUUHZLYjRyMGRrMGRCTkJWOVo3TVIyMk1U?=
 =?utf-8?B?akVrMDJjYU1YZ1Y5SlZkeWEwcDFRZEhNdVNMRTQ3Mm45bGQ3TXpFbXh4Yk5N?=
 =?utf-8?B?bStwS1BHcjZxckQxZlQxNGYwUmpnYmpydkNHWkFqazJ3NmZPMmk3RnVXa1J5?=
 =?utf-8?B?RGRNNlFvWXBtdkxGOHdmeHljcEdkejVxaWVIaGlxTkJUOTlHYlpxNGw3cXkx?=
 =?utf-8?B?Tm9GSzhDekpnakJ0ZzM2dE55Qi9HdkdpTmp2aTRxcXhDRHBQaW1zMUlSRVdo?=
 =?utf-8?B?cHBjSFE2cFpRTkFUWmZzYmxBTHBSV1o2SENwSy9XbitZTkFCM3JGMlV4RUtI?=
 =?utf-8?B?bnkwVnRtdkVkSVdRajJQTXRLRFoyQTlacTdQMUsxMWs0WXRDK2EvL0JBRHZ3?=
 =?utf-8?B?UExZMy9EdkJwSzBQSkVxYWJOaExIT3c5MTdJajdPamM5Q0txNHdFN3ovcjkx?=
 =?utf-8?B?MU5UOE1RRjZBc3FIUFVwU2NBTWY2WUZQZ3k1Vkw0Zyt4eDRaUk9NVFB6cHll?=
 =?utf-8?B?b0lkeWZoV05FOE0xMDgvUm9CV2lHeG1jVjZzY2pGZ0VlVm84elhyVnNOUFRh?=
 =?utf-8?B?K2w3dHZBdHgzMUVLL25KQzRyY3JMaHNsS3NmZkhtWFdMSkJqVHhzZ1pNWGVV?=
 =?utf-8?B?cC94bzZha0NuSUh0M05IdWdzWVFuWmwraFYxdTJOTDltNUtVd2ZRVmE3c0li?=
 =?utf-8?B?dHE4TGRDY1ROY3UzVW9BTjhzZGNNZmdkYStOQ01pYXpHamFpZ1FSTVc0U1Np?=
 =?utf-8?B?VzJPMW9NWCtYa1BBbUdSWVJpOFFCT0RQNmk0RXBHM3FBT2dZeVBOT2hvT0JU?=
 =?utf-8?B?by9vT0h4b0N2UXJvOGE5cmFuMWhOYzJOVERocGVHcStDZk0vVW41ZWphc3BN?=
 =?utf-8?B?QnpibnREWmpGeWxrVDU1blhBRTZFZ2Vha1YxdjByelNpbTJDZVdxV1BrWk0z?=
 =?utf-8?B?cVcwZHJlNmxQQmJFVFo2eWVkS1hkd0FVTlhGK3JhSEhmYUhJcUJWSGlrSEV0?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff4d1b8-b32f-40b3-194b-08dc47986049
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 22:11:35.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebwJZDQ55OpB1LGNFBdzC946UlmKZ6WzOl2bSS3HaER4MrkmK0OyXLeSUM5X4EJhDMZRVu8a8r21g9/vhvgLs0BS2lI3KYnD/wSZ1S4Iib4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
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

On 3/15/2024 04:21, Badal Nilawar wrote:
> To prevent running out of bits, new w/a enable flags are being added
> via a KLV system instead of a 32 bit flags word.
>
> Cc: John Harrison <John.C.Harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 68 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
>   3 files changed, 72 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 6ad4c1a90a78..ee48cf01fe22 100644
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
> @@ -260,6 +279,48 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
This should be in a common header file, not duplicated in every source 
file that wants to use it. But see below...

> +
> +static void guc_waklv_init(struct xe_guc_ads *ads)
> +{
> +	u32 addr_ggtt, offset, remain, size;
> +	struct xe_uc_fw *uc_fw = &ads_to_guc(ads)->fw;
> +	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
> +	if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 10, 0))
Note that Xe will not be supporting anything below 70.19 once this patch 
lands:
https://patchwork.freedesktop.org/series/130677/

Which means that any test for <70.19 will need to be removed again.

John.

> +		return;
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
> @@ -271,6 +332,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>   	ads->regset_size = calculate_regset_size(gt);
> +	ads->ads_waklv_size = calculate_waklv_size(ads);
>   
>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>   					  XE_BO_CREATE_SYSTEM_BIT |
> @@ -597,6 +659,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
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

