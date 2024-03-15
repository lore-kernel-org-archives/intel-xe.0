Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3F1C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60E010E078;
	Fri, 15 Mar 2024 14:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeuztiPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861310E078
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710512607; x=1742048607;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fHs8kM975pFG0sT7PSigp93DLCYUF8TgdYVhzpSdPVY=;
 b=OeuztiPDi+IrgdMMiTbufbnZu+YNs0cpKxlow3n6W7oWT5RZ53f83KOD
 uIpDjhCoEDWn4uEpdSvzW5WhulvtGe25wzWpC0H4NPph2QCQwu+z6og3N
 x0/ULJq2gAGl1EeRcvjb+qpAaS9kiCgdoAJNpQivFb4fy7skKDqSVs/wh
 ZLii1sC4uiUWt6aLEvg0Ebnx8+Ah/lms+urHP9xBWANHu965ZljncBUVY
 QQi6gV4sMbpLJR8bZESHag3RTInsG5haDjm3wEa2p9Iz1UPhrEwnyDkqR
 vPsvoq37P2t0H4OUTMq/LGL/zdjwknvd0Y7pCn820jVPkqsbSy+1PC88W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="30827392"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208,217";a="30827392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208,217";a="17413386"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:23:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:23:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:23:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:23:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXWr2W/4OquhOmdL9Li/AwAI4Zh8PdX4bcw+rVAVhhZG+u/C60fMUYpDlKWGgsV0thzo8LYCH7ffP6cX+69iAcsD34tmN1lfJC5VQ7CKau8RGEQIizs5t+cABVYZhcOnXij9sThdCGGvxS1d+Rq0fZ65gvfWXrR57L3QujWUYmQEW8kX60drfYqaVS/AAqrDNEPbzZMwEpiV3ClSecCnuB0lrsPPWIpM3zQLvcLRTNpmZ3qfVuqA6YpjBFhvfwt4RHanm0DOyoCWqDv9ZiGsMVQ0E6MpBnNZ1kBkWUXDDJWWk3QoTdAQql/Uz0epvCQL8e8KB6bvQDcdN7Lg5TwSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDMdDiXNrnUMnVD0GNVIuDu/8Z9EIaDtBDhgkVH+gBY=;
 b=IByf7LrcsgAzhpIm0hDkjsJh+4ioEP7GuF48wnF9UxQoaIbFW09KuyR+dBd3azaLIRG4C8Z4z7rgjns0wehtgKlTXCyPyQUan3YwBqrkm/RBgk4NP1Gs0LHCV8jZNRPNGJ44piOGZoK1K2MIhRjTxP0Ow6UsPNQz0mfLRbqgggQDg0PUnjCGPUP9TYPAZf6xawBS9xQLT4ZCfz0mHHDWo0Z5Q3ZBVZb+R/NWFephmUXxz0OcH/eZ96/gY0RgV02roxyXb8RWqJ+Ueh3R2qIUemVTdFFfraxxlRdmJolQtO9Nz13c6IayejylXMOpePfQd99jSR5Evf4eQkLLo9iMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 14:23:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:23:23 +0000
Content-Type: multipart/alternative;
 boundary="------------Ioz6lAl9YyMEie7IrefrqOWA"
Message-ID: <0a6d179f-6155-43b7-b113-47b51bdc7245@intel.com>
Date: Fri, 15 Mar 2024 19:53:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: declare busted upon GuC load failure
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <20240315010317.193756-2-rodrigo.vivi@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240315010317.193756-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 5670ecf7-e0dc-4b1d-ec37-08dc44fb784e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDPDL9/8Vb5TD7GsrORjr6bF3bW5mzoj9Xut/dY3Al/lmWFpPAAzO6yG2zbrVTtAQxSXrbNiqJiuttOqypqu1FVREC7mRzen+xPKqx1aCHYQ0f3urj37V1tZ/9aRmN2yjNgJbQ7IChtbjoonzkGnjggfYPfdXEij/8IptCQIJhH/umw+3sqO0KJYW+6bGTuLyQalj9Wzv7gD+qNLnZ98t7zoC175kvTkYrsUHp4nUhMC3TWy5hrrzmWyUnlml0pqbIIXRsnJ5jUuQXA2vGXdIKDXLNLwRaHSR+woiaDz5biTDvOCq7UR5/IviiFTB8IDnk/s88QZrRSeRZoqxbLMyQ+UoBRzm2qMePSIryYdlKFvfODB3FEJp8yqw/leoPsfCiJiQpoW4Yiu1X6oR5UjlKpAhRWhwyCph9CroPp+dBAM9EyVGKSRWauGTQl0L2KXJNj7gZiWl1IEm0a29+GsqddhzWC3wpCA7aPFcDVE0zJuDI1eFa6Pfj/kAov2hqdtn6NeAkI5KA8s1QYstC1JRzHfzqyaOFjvBcojGcPOCA4KeFdA8dLk0NJ5gN2P8Ye2nnxvDhYAOhnb5lDOB2nD6KfD7XRMBFXFNVVqSL6lVimnx7Mc3mEmsz6HEXp62CL5RtNGWxyQw3YcDYCfqT7cHRaUPefB57b6yE6bnStSM/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpLTjFobkkvb0ZTM2prd0dBZElDTit6SnN5QzliV2IyaXd3MXpkZmJzb1ds?=
 =?utf-8?B?c1E4aTB4SGlKQ0NkNWJWQmhYem5xQW9zOHNJZy9pVVdNSDhOMktQaGZtMzh2?=
 =?utf-8?B?bWZTL1pOUys5ejBLdDBuWVdVd3ArdnZZMkFTd3BDUmdxVExkTjEraHdjeFl4?=
 =?utf-8?B?ZWcyN2RuVXhpK094Q01zaG9yaUZIOGI0N3ZtcXNwdGR6cHA2b1JscHJvbU1n?=
 =?utf-8?B?STBEKzBmc2NWSWtPdHVZc04vS01rNTNmRFNaeG9ZSkd2V2FwQkVpbTF4SHJm?=
 =?utf-8?B?V2h2cjJYVExQVWFqTk9qUlBhS09yaGZPdzBQamR0bXNYREFZeHdXK1hJdGNo?=
 =?utf-8?B?QXpSL2R6Q1VHVVZtcnJJOUl0L1l1MG5YL045M0Jma0pxRnB1ZjlyY0g0YjN6?=
 =?utf-8?B?NjRCVWc0Q2pqWG0vWVI4R2Fqc0NlaDErVGVuaHZqS1pROW9QSk9wWjN6Mi9Z?=
 =?utf-8?B?OVNsVVNaZTJ6UHByMm9tQUxjZCtVemt1VWt1VFZsNDBZRmhVT0pKbC9YV1Ax?=
 =?utf-8?B?OVVobE9SdlphQjdzNG5jbWNHZGo3K1dGbFVCUS9TNmRNbVAvbGNMQk84Z1VJ?=
 =?utf-8?B?eWhHUHZuUC9tN054dnNOWGc4NFZRRzI5VlY0VzNnTm5pdi9NVlA4eVZqV0Fk?=
 =?utf-8?B?Nm1tTnJZS2IxVHdSRFF4Zm5HRGhyNDNKVDM3MHh3WlFXMmJzcXBkaFJlU0dy?=
 =?utf-8?B?a0MwcEZsb3NVcThYNzczVVFkN3d6UE8yc3cydFFIaFVRalFsUm9ybkEvYnJP?=
 =?utf-8?B?Z1Rsbm5udmpMaTFZa3lIVlR4bVJoOHpuSGxjSGE5TzZJd0h3QW9mNWRKVmVy?=
 =?utf-8?B?a2JmQkV1cm5pT3FGSFZSTllDMTQ1M3c1TUNtUThoYWM0R2J6MmVMTzlnNlRl?=
 =?utf-8?B?NkxYQ2tOd3N5d3BReENkQytVL3lkTHhvK2NQekkwVjlaYWE0YzJVelJ6WkhX?=
 =?utf-8?B?am5sTHhBNmJlS0p0cDc4NUFBQkc1VGJYYkQwOUk2bkFVbFI2cDh1bi9zMHZm?=
 =?utf-8?B?UFpOTlZEdG02R1NGTjBGMktWV3lUeGFnMHIrM2w4SXd4aGliNEtIdTgydGY5?=
 =?utf-8?B?MVp4MENPQjlJWmNraDBHOXRRNGlmWXNsWWEzbTRtOVk3NXBGSG9uRXZ2TmI2?=
 =?utf-8?B?bmF4Tko3MkIzc1ZCSi9MMXdXTUFaN0k5KzlSdnYyTVJONXUyUC81aTZjNjRC?=
 =?utf-8?B?d01tNkxtUHdmcHo1b0pBM1FJN256ZUtHckZIdHpKS1BlakVpSGFYcUttR2Mr?=
 =?utf-8?B?YmwvOXFtaFJwbDZ0TU54V2Q2RkRZQ0lndC9lT285MmR6WmJJNWNHR3grbExq?=
 =?utf-8?B?OXA0WW1oU0t0c0tHQjVNdkdSUncwVHZjUG5BVlV6bGNXY1VSb2hpVjNMN29D?=
 =?utf-8?B?VkNKdUhWdHFwZUtieW5PaTBBZDVQT1JEdHFVdTZieDdTV3ZsWkVSOHRWQ2No?=
 =?utf-8?B?VWc3MWErVldVRm94YVFHSGxYTVRmTmwyVFdNYzZQUGFYbVlISzBXODE4bzdD?=
 =?utf-8?B?a1JmZThpdExNZmwvaDJpRHpvdWIwYVV0TXBDNlF2TWljamVZNGhpUVBsVWRR?=
 =?utf-8?B?cmFQeHhMT0ZKM2E2WXgvajdjOE82bVh3eTlVajlqazU0R1Y3eWlDemo4Z1l0?=
 =?utf-8?B?SjVEbjduUjRXcUlLMDgza1o1ZG4yWlJ6RlY5aUhYOERLRHVBTzEySCs1d0VT?=
 =?utf-8?B?NVliWnRBcWVzYTZqWmJSc3A2MHVLMThEVWUvbDZjVnFRamwzUW1ISHhoRmhY?=
 =?utf-8?B?cytsZWtjTk9jcVRHdXVJQUF4a1I1VjZaekJhdEh1RkFXclNGR0wyNUZFVkJs?=
 =?utf-8?B?aVE4dzQyNDJOekwwcnpnNkI2YUprSkVSa2QxRmNKVEV2eUtzN1F4RWpDSUti?=
 =?utf-8?B?K2g3aG1COWZoY2JiK3NieG5FbXdLNENpNThRWGExNyt4ZWtMT0tzT3VkSWNN?=
 =?utf-8?B?UFdQRHkyclVWNFNidUdsQWYzU3V6ejNUNTRudGc1ZG9YUEhXMHI3SDBHaEp1?=
 =?utf-8?B?UlJyb3NFc1ZEMHA0ekxjelFzMk1aSjRWcUZDckJNZmlTblVKemZkZEZKenZK?=
 =?utf-8?B?c01sWVd4SlNUaGlvNzc1a2FqUDF4OGRrUnRXbCtKUEdGbnZES0NuQ0Q5QTlU?=
 =?utf-8?B?T2lLYWR5cE5jY3F6bTYzdzhuSVBqSURYWUg2ay9QU1RBcndVUjZaOTdLcW1y?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5670ecf7-e0dc-4b1d-ec37-08dc44fb784e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:23:22.9754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zo/MgYz11HKu5sIOjb/bGKN+dLKGTH/UPf5XJJFHDszG58yvIru2ZdH8/iXSocYmOc6xVW1w360+JTbQy5OfLkrAS8x+DsbryvR2SXGvKWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

--------------Ioz6lAl9YyMEie7IrefrqOWA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-03-2024 06:33, Rodrigo Vivi wrote:
> Let's block the device upon any GuC load failure.
> But let's continue with the probe so guc logs can be read
> from the debugfs.
>
> v2: - s/wedged/busted
>      - do not block probe or we lose guc_logs in debugfs (Matt)
>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index caa86ccbe9e7..85edaaa734a5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -static int guc_wait_ucode(struct xe_guc *guc)
> +static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	u32 status;
> @@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
>   	if (ret) {
>   		struct drm_device *drm = &xe->drm;
>   
> -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> -		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> -			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			 REG_FIELD_GET(GS_MIA_MASK, status),
> -			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			drm_info(drm, "GuC firmware signature verification failed\n");
> -			ret = -ENOEXEC;
> -		}
> +		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
> +		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> +			REG_FIELD_GET(GS_MIA_MASK, status),
> +			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> +			drm_err(drm, "GuC firmware signature verification failed\n");
>   
>   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>   		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> -				 xe_mmio_read32(guc_to_gt(guc),
> -						SOFT_SCRATCH(13)));
> -			ret = -ENXIO;
> +			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
> +				xe_mmio_read32(guc_to_gt(guc),
> +					       SOFT_SCRATCH(13)));
>   		}
> +
> +		xe_device_declare_busted(xe);
>   	} else {
>   		drm_dbg(&xe->drm, "GuC successfully loaded");
>   	}
> -
> -	return ret;
>   }
>   
>   static int __xe_guc_upload(struct xe_guc *guc)
> @@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>   		goto out;
>   
>   	/* Wait for authentication */
> -	ret = guc_wait_ucode(guc);
> -	if (ret)
> -		goto out;
> +	guc_wait_ucode(guc);
>   
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>   	return 0;
>   
>   out:
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;

In current implementation of __xe_guc_upload

incase of failure in  guc_xfer_rsa(guc) , xe_uc_fw_upload or 
guc_wait_ucode(guc);

We goto out (Label) and still return 0.

With above changes incase of failure in guc_xfer_rsa(guc)  or 
xe_uc_fw_upload we we will return error codes .

Is this intentional ?

>   }
>   
>   /**
--------------Ioz6lAl9YyMEie7IrefrqOWA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-03-2024 06:33, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240315010317.193756-2-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">Let's block the device upon any GuC load failure.
But let's continue with the probe so guc logs can be read
from the debugfs.

v2: - s/wedged/busted
    - do not block probe or we lose guc_logs in debugfs (Matt)

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..85edaaa734a5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 status;
@@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	if (ret) {
 		struct drm_device *drm = &amp;xe-&gt;drm;
 
-		drm_info(drm, &quot;GuC load failed: status = 0x%08X\n&quot;, status);
-		drm_info(drm, &quot;GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n&quot;,
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status &amp; GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, &quot;GuC firmware signature verification failed\n&quot;);
-			ret = -ENOEXEC;
-		}
+		drm_err(drm, &quot;GuC load failed: status = 0x%08X\n&quot;, status);
+		drm_err(drm, &quot;GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n&quot;,
+			REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			REG_FIELD_GET(GS_MIA_MASK, status),
+			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status &amp; GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			drm_err(drm, &quot;GuC firmware signature verification failed\n&quot;);
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, &quot;GuC firmware exception. EIP: %#x\n&quot;,
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
-			ret = -ENXIO;
+			drm_err(drm, &quot;GuC firmware exception. EIP: %#x\n&quot;,
+				xe_mmio_read32(guc_to_gt(guc),
+					       SOFT_SCRATCH(13)));
 		}
+
+		xe_device_declare_busted(xe);
 	} else {
 		drm_dbg(&amp;xe-&gt;drm, &quot;GuC successfully loaded&quot;);
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	ret = guc_wait_ucode(guc);
-	if (ret)
-		goto out;
+	guc_wait_ucode(guc);
 
 	xe_uc_fw_change_status(&amp;guc-&gt;fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
 
 out:
 	xe_uc_fw_change_status(&amp;guc-&gt;fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;</pre>
    </blockquote>
    <p>In current implementation of <span style="white-space: pre-wrap">__xe_guc_upload</span>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
    </p>
    <p>incase of failure in&nbsp; guc_xfer_rsa(guc) , xe_uc_fw_upload or
      guc_wait_ucode(guc);</p>
    <p>We goto out (Label) and still return 0.&nbsp;</p>
    <p>With above changes incase of failure in guc_xfer_rsa(guc)&nbsp; or
      xe_uc_fw_upload we we will return error codes . <br>
    </p>
    <p>Is this intentional ?<br>
    </p>
    <blockquote type="cite" cite="mid:20240315010317.193756-2-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 }
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------Ioz6lAl9YyMEie7IrefrqOWA--
