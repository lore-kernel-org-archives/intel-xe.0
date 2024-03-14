Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D20C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 23:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A76D10FEC2;
	Thu, 14 Mar 2024 23:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpOz8hJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65B610FEC1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710459429; x=1741995429;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QY3wLODoiBRmjk3laI3ESRosFHwsM/BcLExp5R6nvgk=;
 b=GpOz8hJ9zzdfYIOntEb5Yuss8SMMBSWT0AiTszHvgRs6pPSTUB0z4HPZ
 GkauxVkwEkPXQIzz68eyXNIzKpNLI2p87bxlxWHMP+wOU7vG9YXvxvxj6
 ZCupf2btIvU2NWxMDYRvxWeOUxeC1mdo4nzGwOnfNtNayVNj65NNy6Itn
 9jbdlI3GdqUP35YPqLHxmCIK6lDgQSWYaw564R6UJKTiI/bW38KP/IgFi
 2AqXhSmFLkfJ+MpqNCcHGrNMLDY7BIxLqTikuAA6DqIEK4Bu6BFM7+ra4
 hp5VWBRAFswOPkB8j6kUelw0A9WLM1ibvthSG5/bxd0w/Ym0biXk6aaJI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22832014"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22832014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 16:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12555809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 16:37:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 16:37:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 16:37:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 16:37:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 16:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ3Jc/ffQ+q3gm1nuE/MbMLKm+zu1G7vTKAnfCp+H85l/w1UJFw5FVei2k8ZKA8hLKL1ZfO/mePUTRUPTNchk3R0mE5tD2QScZdj1UAp5G3CqP/PTNPeIGExF1M0+LTt0jSsygqmRfc9NL6OhQRqAsRxB0uEtPHQ8Cp8i669y4wuE2xa95F2pWEyTC9+goo3VbZqLgmgp0t5ZsBr3zOvobsYmS/jb1obaN7G1fgxAD1zceOcRLbQ9/QhjblbEP8v9PoYgXAofnMd5YYVFEd383i+MsOl0MSy49Hp7GyncwMYbjmSK5O3hsyIh4NEl81R6vJ/NDhJmGtNmlKaNNRAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsSQXBGZt9hLQSBlZEXkKdhygDLaRRiDbyFqufH9ZSQ=;
 b=jq47X88s0oDHvSMi5TRKCeXb7qyX+zOYjPWmMxPd7ucimEwj+Rgf+8PnEN7Q+sD/BJyVhVITbmOSP/Y+xZdNGnRUkHpFWOg3z4pli97IAR09I2SiQXp0S5fcW0S9+ZrcOMPzgOsUZ/+Xk+O79VdRRsXPXIzS8WrNTsHrmITipIUr4wFbVpHZwQOCE7nEZnrsrr7SaTtavEbpyzL+Kd8W2NKpcz2pUVWIHAN9HJg+DTRDrFeT1+Gx+ZP5N0HGMq7j0G7pPsyiQgx97vaJ/WluFRiN9IRBEKQBJpMZK8WH1y0lZFog9HALTMyAyYw/srYUSYjt8k/m53BSQR64lcYprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 23:36:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 23:36:57 +0000
Date: Thu, 14 Mar 2024 19:36:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/pf: Always select Multi-Level LMTT for
 platforms 12.60+
Message-ID: <ZfOKFbCKlIO1RVth@intel.com>
References: <20240313104132.1045-1-michal.wajdeczko@intel.com>
 <20240313104132.1045-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313104132.1045-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 4800098f-7545-4964-d496-08dc447fa323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtoNRHu0vkXvvwEUpSNC3p7syHbeR24D8Yt1vAS2tCyqlPRYOdy7GPOdr/c7QEbfixrJDqtubhk5yQR5/FvRUp2eV3luadGwsdBPWwfF/Ial0i+6NpSPdkFuRK7ZnETKaCYQlFh05nN4F6dTvHh8RQQoohEopiaKJ+6iESbcbeeiefaUiGOm+6mqMSfkPwaPyWcOEo5VSM2XEKpzg933b8Y8DwLpLoeGHnhWYqosl7FOaU2UzfwsbyyeIluLexdHjd4HU5rJCBb9sa78vIw/y4rek9g35CuWk0r+BOr95769M00yeuVOfzgJxpY4VuHxz3GL7AdxDENrOrSpgGjgjk3kb0lb4JvbYh0ShabL7g+n8Dd/y7xvWHF54fBqVZ/4yF6HIh4sKSeWIJt7puAQLCnguLo8efcx/+EkEzCY2Aw87N/bdNdTMCy7eGmbOEWfShKMz7GkBitTCky24wgN3nlgzd9tT4OMFOwDfaehUDGUZn+5VvVASKcACoJCZijCAzLb0bNk9scLpZkrpr0FjbxpGU3bO1pCNU1xWAxHt2pSDq2LH5MW5HLBNBvzXoggf2aspwUsoe7keEnoK7OgCxdflrq2k4PAWmBBC/b2bcUCZVq3wjYQp9fb2sATHU2bxZIga7On4hwLiC7Pi6gPPRwpVTZdbxdpQOxjtyfWiZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdBdkpiRHhvaEdtTnVvSW4xQnVNUDg5QXZ0Zmg4ZGx3SDh3ZHdqVmwyelBQ?=
 =?utf-8?B?aURGMkF3c0xSSWFNZGFPQncwKzhhL0FhYWpkWFRqS0FRa1FyY3YxaVFEd2Zk?=
 =?utf-8?B?eW9NYjlTSTdKN1grYnpEZFQ5U0V2Y3hFV0JrSVJsbmxDRnJ6ZGdNYVdCLzQ0?=
 =?utf-8?B?Ry9ac2hZNEl0SHRxcGIvVy9rZytDeVlFUGRnd0RsTzJ3dmlYcDFHZFozWjZK?=
 =?utf-8?B?UkJ1RVNPN1UvV2dFWEpmd1Y1N1EvL0VDSitiWmRFajg4eDhBU0xaZkRVZUVj?=
 =?utf-8?B?azRBV21SV1BOL1l1T3pucjVQbXdpTGFHam1jYStjZFh4dlJ3RXF2MFhSQjRj?=
 =?utf-8?B?RHNMYVZ4bzdEdzlUdmRqWGwvT3FDREFxb1d2RU5NYzE1VTZ2QXFKMlNJNU1N?=
 =?utf-8?B?dEVNa3YrRmNPTmpoREM4d01KTCtaVFh1NU8vb3lIRjRSUk5DYzJHRDYzRjVz?=
 =?utf-8?B?elRHR2pvcEIzVXR2NkN4c0JzaHFKWWVXQVZZRC9NeUlXUk84bDdRWlZGd044?=
 =?utf-8?B?SHp5NnA2YVdmajVDdCtzamNRdjZ1R3ZlWDEvVThjcmxzYVVQT3R2b0VzdExw?=
 =?utf-8?B?N3pZazg2Z0xvZ2pDY1Y0bGJoN0NMVmNOaWZFbGFUbVp3Y3RNaGJtVW0rZ3ZL?=
 =?utf-8?B?NzlWT0E0RG9aVG1VcjliSmJrQXNqWnZKYmk2Q1pQU1NxZWxoTXRNTG1oeGp0?=
 =?utf-8?B?MU9RQ3J6OVdrWHJPdkxWU3pKb0NQajdTOHVmTmI1ZTdsWWN4citBY3pVc2FR?=
 =?utf-8?B?VWZ1eDRKV3h0U1hUcFhaekd3MzJWbE5yL2hCMC9rT3p1N2FRKzFzTXhDc1RV?=
 =?utf-8?B?bWNHc3NrZ3RVRVBtRW1jNWxPMm5YZVJXR25Za0swdENPRWhXQ3ZGczZRNDkz?=
 =?utf-8?B?a2hLRGw1dWkzRVBQc3VOU2FqVUhlSGp2YVBkSEpyaERlMkVJU3J3QldlMEhS?=
 =?utf-8?B?R1NNaGJWN0VjaGhYanh2Uml4a0dLOC9kTGw5d1J5YTBDdFhvOG1EQ1MrdmJh?=
 =?utf-8?B?Ni9QWUxBRWtoZG1mOTdxQXVleVk1bGxGL1hXZnVXaWYyUkpBdUhjZ29XK1BU?=
 =?utf-8?B?UmVDSXJBVGZKTkRJYkErREZsR0x5K2YxOU9JMlBSZGZEZlczYlFjb01ydGE4?=
 =?utf-8?B?QXFSZlFWZ0ZvaG5QZGVqREV3SUZvaVpwOTVpQ2JxdDZhWE44OHUwbm8vOWd1?=
 =?utf-8?B?d2pkN3h4VmRzcG5wMjdDdElDMTkwb1I5bU9XRGpyZGJxajd1MDlua0tBZm1B?=
 =?utf-8?B?V29WUStxdTBKMDMxOHN4ZDY4QWVGOTl5WkI5dkMrbXZPbThaZ3FWa2tCWVN3?=
 =?utf-8?B?Mk1JTDUya1BDeC8wKzU0QlAzRnVWMmJJQm4yNjQyTTk4WS9HSmJKb013VnY0?=
 =?utf-8?B?VGUwYkJ6Sk9xUHFBdW1XTllObnhDK1dsNjg0SHNZWHdGTjhlNWhHMnViQ0FX?=
 =?utf-8?B?Z1J3RUhNK05YTTAvUnpnYjFlOE1wTE9XT1hXT05NRUcrTFluWUhNQWlxUnI2?=
 =?utf-8?B?WWhLUFpROTNPSUFKTU9DWkhFbDI5TXVraHVucGNHU1R1eklraUNxOVdIQ1d5?=
 =?utf-8?B?NkIrUEc5T2dpSzBXWWloMVBCZ1BJUVpLaTVXcVIwbHhFajNWQW1KYXhJaUdK?=
 =?utf-8?B?WEtlNEE3TEJvTXh0THVSRGJFTmRSNUZ0MFI5a1kxaE9Gd1ZjRm1ncFVReHEr?=
 =?utf-8?B?RURsWWowOTArbHBrWkRyQ3BlbUZGdXJuTlRqWUxrY1Q3TXpRcEtReUNLSmF0?=
 =?utf-8?B?TkVuYWdoL2UxL09FbkwzelV6WDdQNDV5MHhYNHVsQnlyNE4zMXM2YzlpK2d0?=
 =?utf-8?B?RnZ1elBpQ25sQVpwajU4Z2NYUXVRRUlpUHdtOStSUFVIYzJkY0dPNnZhVFFT?=
 =?utf-8?B?aSsxd0diM3pCNS83OFhOUWlCWXZjeFl6eUY3QU1QTFNBSmxmMU5wbUg2dU5K?=
 =?utf-8?B?N3B4bEo5NTRPOTc5T1IwclNMQ3czTnpDQ2Jmd2pNOERnVkxNSytGOVpBVW5u?=
 =?utf-8?B?MDBFQmd2VU1mVEVWTFlrMGZNenFrMUtwVHdsQ0pzcWRVcW1ZSkNyek5pbmhv?=
 =?utf-8?B?bmJ1Tmt1cDhydDZ0bmtDbUkraHA5Q24vM3NFVlVJL2o4ckhZbVRwV3BUL1pl?=
 =?utf-8?Q?usnY0pRy5g9okP/HF/QZBpfUe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4800098f-7545-4964-d496-08dc447fa323
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 23:36:57.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: At/MdNxZsoJGofcL4piiOetpjkmuJDyRyR8xmBX2s8CH6xE7MGLZwqldYgVG2BgPj6M6XFLM+yKM8EmghzewUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Wed, Mar 13, 2024 at 11:41:32AM +0100, Michal Wajdeczko wrote:
> The Multi-Level LMTT variant is not specific only to the PVC.
> Change logic to select it for all new platforms beyond 12.60.
> 
> Bspec: 52404, 67468
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> ---
> v2: prefer GRAPHICS_VERx100 over PLATFORM (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index dfb0e1887615..7f504392a8bf 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -35,7 +35,7 @@
>  
>  static bool xe_has_multi_level_lmtt(struct xe_device *xe)
>  {
> -	return xe->info.platform == XE_PVC;
> +	return GRAPHICS_VERx100(xe) >= 1260;
>  }
>  
>  static struct xe_tile *lmtt_to_tile(struct xe_lmtt *lmtt)
> -- 
> 2.43.0
> 
