Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD88C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E898810E688;
	Tue,  5 Mar 2024 17:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk+uUohM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405710E688
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709658037; x=1741194037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rqXogQN6TFH2nlioCLAcq1JPv+pgsswL2Vu5G4/rDcA=;
 b=Fk+uUohM5yY/F9nWrZuNqoVNMpoSWcI046cHw7y29Amjsojw7NFo0oBg
 LytR7GyRHoL+35iVkzvnIVnVkeo6bpz1Q7M3yiIrhg10F7VKT96W3iCDD
 wC89BYMg1J+UcVs/NgFJUFC8F9R8hUdXJp0qu53y12fd39QrYQGJ+21jz
 vljM5mOCELNrF+fpeLnPCnULgx/0qHyw2bH46MFxHBEUB8s/fDulHGgi6
 IJhL5IQq/h+WVlpflAplSL1Hak4coYdbIfBorAfAXMV25yYgBYt0CIHfm
 4cFf1thPhoFrFSq0zzHiEET9sLPMgIJXqRte0oXUl+bUXOvxhUji3sr7z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15364688"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15364688"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14117589"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:00:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:00:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:00:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:00:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adZXuhoFoCdOD2S12F6kjXh50W3E0kihCFifIT7AFfIWwwYMUtbtgp2TOCobOvuEigKqKlULqWY8C19gy/ojQr+nnGf8jA/Ijv9qvv+SieoWkSf/WRU713bYj68tKamsdfE2yzkSIgA9sJe58uPMTIEpvXoBz6eVG1rVbdqJHVa4FJRw2jeszSyJxcvnG5PGwRDsiSN7AaaMxMEmt+E42MOknrDWGzLvlp+iwhTJhJy8ccgakZkjEHIHi+Z8WJY5sQKHcUGq9R2wKsb6YawqKsSfUwYOpeljzzBqjIrOfl0FKAqqUyirstGwPeASVTiADr6K3Joa7Zc5h8E8fzfgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYhvzQXZlnpe6/rmCNmz8rWMOsI99fy5yqzMXBjw+mM=;
 b=k68+1r0sfvha1HAQrNP2bZ+PJF9KsfejjtGNgDantc6mz8uAULCvUfMAgb/KGcn2WmY2Rp9cKYHgoNzTqH86+4Vfj6llUHlGiUfZJp/U5P4Nk7ea8uUlbzfvk7SbzKTUK6LCiRfahIh0WoG3eepf2Wy3beSFvWK3JXaD5UOoRk5cPJDgO84Tm7excG5VbXl2fVQ94WW1oGRRY0JHU6L6U6BsJvPTKBC/AdeNomlST7EFTjXpxNCCFQpwOfmOoSeZsNUf7wSCvyN3cGHoefXoRXDG0OaOpei1U0HKr1qEaMOhNd29gTIId6LjbElF7YTR2nXOPcOh0vC45xezlBQyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 17:00:31 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:00:30 +0000
Date: Tue, 5 Mar 2024 09:00:27 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH V1 2/3] drm/xe/xelpg: Extend some workarounds to graphics
 version 12.74
Message-ID: <ZedPq1hHkxNO/6cQ@msatwood-mobl>
References: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
 <20240229061331.3398966-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240229061331.3398966-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: be02f240-ebd4-486d-d72e-08dc3d35c389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDWlsuiPX4JM/USWKM/LUmGkx9PPUdS5+DpSoFC1ut5YGf55ngxhn1uPJLr/oHvhxTNctJ5ekSqArVVcFOxeUSkV459FRh4WFur9Dz9vdlO5iVfNFOsqGZZfcVSoZbGvZb4Umc1PIYxZL1kyvpq1kC424nlbtxfhdPTuE7+Ndd2SAo+07Gc1Sn7Jxc6cTLyr/5PU9x2i5QA14UoT9F1gmzHSqMT2k4yP4e7PNr1mtHpz9FfePDF3jyRfQld50C+ZolJ9fbLswmGc/Ei0Kh+hd7ByLS38a+rkNhtoe2tik341jO4JcAYVfrVYu6MTNUOpXJ+3l84Mx55V8I2dPnlKzvi/9kDiMA12hTs9PjXkLEpAxS7/SKxfIZ4Opqi/cuoWP4h9+8q4CCJaVzLQryqDzOmDXnydL9tATMDmFtk6+OLtAzy7s91d236C/EcVmnbYEVjVeoXDS0aPqiKiwQYzG27kIbC6X6QmZEC+ARLWRsRI9AABEvQxf5k+qGfdhcNoL800hhwFb+8AI4luP5juGNfQKucn6P9N9QE22akYJ1p7+qc+48ZtozkHPKBMYValeI26KZSbQp/tROLeWHnKx6jL94WN6nPkIDotQKe/e0XFhLChLYr0uueKrFuGCYckhibjl2Dlrqf7Di9N66+zVH96GTNOWuiJ1Es8c6mluxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NC9TU1c4R2tkSTdYRDVrcUZBZFhxNW41SXNZbUZkLytmTnd0SWtsdWtVUWo3?=
 =?utf-8?B?bkVCa0IrZkVva2pvOXVFcGIrcTQzSWJRQ2VGZktYVU51OUpjZ25meWJxQ2Ji?=
 =?utf-8?B?WC90aFBIeHF6UVppbElmWFNJT1haaG9vdDVoQzFnM3ZKVEVYcWFCRnNxYklq?=
 =?utf-8?B?WVh5SXNFb3NEbHljWm9JMnZNVlJrNFpsOS9hNks1eDNkSHNVT0dMYjVKN2Jl?=
 =?utf-8?B?aUtyYWNxWXNCQWhZQ0hqVFdBeU03b05XSnJMZ29zOWY5RTZIZ1BJVWpZTExR?=
 =?utf-8?B?Um13Nk5MaFI4TGYzNU4xSFZiYW1xS3B5UTZ0Q2lEaGpCTUxsdHNVbU90dFla?=
 =?utf-8?B?aTk3ekZKV0s0OUlEQ3lPTWVTdk5lSUkybnhXWXdMMHZPc0ZpVGczSVFmb3pT?=
 =?utf-8?B?dXJlbTJRN2RnZkRuTTJndk03eG1KSVU5S29sSU5Ib3JDazFQWUg4S1ljNk9q?=
 =?utf-8?B?QzAwdndDN05qc2JibDROdGpPM0VvRFAvNGNwdndwd0UwRmxmOWZsM05hREFL?=
 =?utf-8?B?V0R0ckgyNU4yRU5GYkNyVGwzZG11cDh5UEMyMk0ydGd4ejh6WFh2OEpjMHRm?=
 =?utf-8?B?NUE0OVZlVE5BNU9nWHZneDY4KzBVb2tUb3VDZnBLVVg5OFlXSncvYnBQYndL?=
 =?utf-8?B?QlZ3SUNEZEw0S2xqMDd6a3g0SGFVTEIvR1pkdmo0ODRxSUREM0RKaFIrZVkz?=
 =?utf-8?B?WlZnanVVdUpJQ2ZSSkZWMVNPUmdVSzFySDlTYWVGT0VSN1NSajZmcUhWZlgw?=
 =?utf-8?B?UlBabnczclMvdHlKdU1zVXkrUnMxSGNROVZmV2lQcDYzbDh1SGs0Sm9oRGt5?=
 =?utf-8?B?ckc4RzVJQkNEWVRaVHpjUytFY0FWS1VLdEgySFFKM1ZVdzJrMUkwdlB3V0Nl?=
 =?utf-8?B?ZUZWYmg2cERnK2ZHY2w2Y0pDV2t5WGpiZlBIWXQ3dmZIUmZBWlBLWWJDdWNO?=
 =?utf-8?B?V29TUE0vZTZXZmp4NmoyQyttSGllRFhCSU9wZ3o5dGU1YThEb2NxWWxadUR3?=
 =?utf-8?B?R3p2MElaN3JvQk1OSXY0dEJjYWo1RjYyVkh0MlhQOHVrWGlFU2VyQ2s5OGoz?=
 =?utf-8?B?S2UvRkdTOVhaZVZmSzhWZWpPa29QT004R3laNmlldnppL0hCK1pEeUxPM25B?=
 =?utf-8?B?MEZOVk95d0w3WG05aWdSY2d6SmQ4VzF3SHM2cHg4L202NmFTcDBmL2Zsc1RY?=
 =?utf-8?B?TkVkU1VyZGdtWUNRT0NFZDE4bmxNcExoY1J3NUh3U0pZREJZeFNLWlU5SFBy?=
 =?utf-8?B?ZU5wVnJwS0Z3bFk4OGIwTHhuanZMTWdleko2YW4rVHVXYUZ0WE5IOVl1R0p4?=
 =?utf-8?B?MndNVkp2VXlZaHZKdFNxRnlJVmNORDg2M1cwdU1jNHA5eW5HQ1l2TW5WaTgv?=
 =?utf-8?B?M2FuREQzNmc2eFVBUHNDU0lsaEV4Vk5pWjNvYTFsMW4vcVZQdWU0ZlBZaTgy?=
 =?utf-8?B?U3QxNmg1dnFxTlhrV3hYOUFGSHlETXV1UHZkOFdJY0I1ZVUrOGZ2UHByMWY4?=
 =?utf-8?B?dXo2Tk5ZUUdENFVrcGgzMElrZlEwMUdHYlRLaXVpU1RsYVE1NjNzcllRajE2?=
 =?utf-8?B?SUF1dFZWTUx2K1MxTWZVU2ZPb1N2T1hNTllOZkRQN1ZkVkNCME9xQUtIanNx?=
 =?utf-8?B?amNNdStHRXZYOWNLWGV2a0Q5Si9RM0M4Yk84Q0RvdGRBaHFoWWxtbkduZ1la?=
 =?utf-8?B?OUxTaWdSejNwMGoxTld4Qm96KzJhTWFhZ25zemVjaFhHa0xxWHdoR1hyL0Q2?=
 =?utf-8?B?eE5BZEpidExpbHlPdjBrY2ZXWW55dTRMZDJ0ZkVadTcwUG4xWEdaVmJwbmxm?=
 =?utf-8?B?U01DbjFGZFZ3Y3NPWHlEV1A4UEEvRllCOXBuTEJzSjE5M1pYcUhrTlZCOTlW?=
 =?utf-8?B?Q2F3OFIvc1VFTGdtOXFObEYra0tlR0ZuTlV5Vncrcnl0V01CRHAwQ01vTm9p?=
 =?utf-8?B?NnlQdXJIbW9uNm9ncnFHaXVFSk4xK25GR1BXNmsrWGN0RzdtY3c3RUxKTlFP?=
 =?utf-8?B?MUprU3NSUjdZWTF2WE1kc3pMdHdMU3dqMm5HQmlFMmxSMXVjdTNhV3AvVWpx?=
 =?utf-8?B?R3RNL0EvaU54SjFZcld2S2lkN01UN0ZPdGVhNFNnUXRaeVlHWklOWXNKdk5j?=
 =?utf-8?B?ejR1eU5OZW5kTWk2dHEvOWNjYVNKeFdJRDVVd1lhK3NrbDA1R3hWazhwV1Zp?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be02f240-ebd4-486d-d72e-08dc3d35c389
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:00:30.3958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMFDVrUCJoMLo42sVeQVm5miU4yhlXQHhYJEXbdIJKP2tnSsiH24xL514KBD/AKHjG4TF2vqL24/6V9IR7RhlqleWSi5mWcrDCr7vPrTny0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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

On Thu, Feb 29, 2024 at 11:43:30AM +0530, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> A handful of Xe_LPG workarounds are also relevant to graphics version
> 12.74 as well. Extend the graphics version range for these workarounds
> accordingly.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
>  drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 44570d888355..9d0c715142b9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -71,6 +71,7 @@ static const struct platform_test_case cases[] = {
>  	SUBPLATFORM_CASE(DG2, G12, A1),
>  	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
>  	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
> +	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
>  	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
>  	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a0264eedd443..bcc285f45a1e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -173,11 +173,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
>  	{ XE_RTP_NAME("14018575942"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
>  	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
>  	},
>  	{ XE_RTP_NAME("22016670082"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
>  	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>  	},
>  
> @@ -397,7 +397,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	/* Xe_LPG */
>  
>  	{ XE_RTP_NAME("14017856879"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
>  	},
> @@ -537,7 +537,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	/* Xe_LPG */
>  
>  	{ XE_RTP_NAME("18019271663"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
>  	{ XE_RTP_NAME("14019877138"),
> -- 
> 2.34.1
> 
