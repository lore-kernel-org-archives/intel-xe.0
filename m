Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF49C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56F210E2BA;
	Thu, 16 Nov 2023 19:57:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90189070
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700164656; x=1731700656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wH9xqF6Relaj/N8gVIONBky8QFix3koC8tsA553pNjs=;
 b=ZRI9nFR4ZnW/D9oVe0zp+Spxi2woanj9bx51Xp6ttL+49BgRTjg1Wrhw
 9VNjMLqz6diaC99BUOIOAvO2ApUuka++/lDgJbWzTHSfZ5LNlA0pdmUiG
 RHq7Kc0yxm6TgSQ6wlsbVhBc2Bbug5sZy9aVDRgB2Ps1+e0o1ZOeUoo0c
 K0z6a03eaN19YVTG9OgtTrxpq/jrebBJwTnzK5/bdT6pLLHXwiTnjfSTN
 PWWDcPei2LdCm0hLlbTHkRHQOaASMWMEJAWyMW0cp+y3SphihZT4ieYkZ
 PS5WKYrVkaIPJaWXOkvvXOZQf1S9HyC6oH3IGT71SYgmoeXNpHwpGqChe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370525471"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="370525471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13669076"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 11:57:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 11:57:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 11:57:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZdnkpMkfDrHcY0+5HbO8Qgzu26xuJjvVeC3dAJ5sirgeMBTv7ZCldBCa535a2G5HyaKcp9xoKj1+cNuGHjwVBiqW587RFPCv6rwPsPmoywW0v30MFxuO90rhLLwaWpI5kxoiT31UX/O28aMTeFcdmjzhrZiUtpZy2pl5VyRPztOZwTUGZsI0uNeFUFLiyM1F/c9KxCSkEaXppIM1malc+juamBDVZspTKdEfWJ0cXh2Cr6bRar2POCazDqttnc7JNq2Uw/aLoiYfQmtqcrlRXJFek9DzXYzG9g7ohdHjBn7IHrshwpfEtaOZ3oUI+2J/Ow03+w3goNdx9a1H2uE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4RBvOxIk618VemFbJ+iDH1fRbP6QU1Ph+NljvNRo50=;
 b=IpENXHqb8U1ZOLfxg7Xm8YKTnmIS//6qc8HcRYzJkXm4Yp2qL7hYuZyhcyeZBysEIRLU+02FuWR3CliCz+JebwJE0eYiEPZ9rKOiD68R5l54JPaNujjBPU4N+10l9ZqmmZP6xH3fu20ljx/ZvqBbJC3rriohRvFabQYdh6UPvuGG48mYcDC28rwgV3bYnMDE+7jrhHC1li3SDGMxDB8TdbIz0/JZqHoL9aNbTTX3tMhFkkdgoeCGFvNZT8nq53COwcpLPaX2kK8fk+lt7otTQP6SSlLPvlavQwinDabXr3c/qlqf2nKFYauHRRyliTnMFed5siv9VhoL2y9IE3iO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 19:57:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 19:57:28 +0000
Date: Thu, 16 Nov 2023 12:56:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVYRicczKxdsu5Il@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-17-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-17-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b75345b-f404-4335-a1de-08dbe6de42d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 127YLkUVQ/D0X5hRzTPfA5pTq977bjnGc0ryOeKbaKvbrBUYnnatldJZVDeI4MeGU4z9jryNJaVzHmGF5/4qLoC7fSn3z0zgdzMBamVUAKfZrqXsx6qMh6PZokeXOtQbVCafDvkUdZWh36WtBiPh6ciSnuY/VP9dqACErgnPLW7VcmGEqqU01HfCeKLBMqwzrh+y6KkXg2R83AsUyNHgsn8WnjDmrwA4WO9TWNkf1Pq4T80Hzf0J2FYG6UJMSgrBBW/F3AHGvkR7JrwAg6qfdRDAH9uLB1Rm/cgc62zbPGjioZDl3o5ayWse2KD+qqTXTtbiOaFE3iGWNnXaNTd5ORTmobRN9joLWrN47B2/qhhzNv3ZntEsj6NpS9PFkgnnaHNa0UELZYtJJQCN5OXSw+9qemVLts2Jbw6yvsIPa8tciV6zTaURM2phpsCM+Jzcz7EudUiZzhRWw9jdNXWBL0VMOe1BzkE8T64/QgZxc22Pn39R/xOIGRSogf8zcTEzHozeZodPtCW5wbTa0uaS5M4is1kJkntmU3JvI5jsFrBzwqoMm08mgJ8fZ8eTLnk1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8676002)(6486002)(66946007)(54906003)(66556008)(66476007)(316002)(6636002)(478600001)(8936002)(6862004)(6666004)(6506007)(6512007)(44832011)(4326008)(86362001)(41300700001)(5660300002)(83380400001)(82960400001)(38100700002)(26005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBERUlBZXdHRHphNVkxNUhSQm12bU5rejY1dmZQcnU4QmxHQVBLS1YvTzg3?=
 =?utf-8?B?cVBIUTBNYitQRVpzZ0J1NHAxbGQ4Nno1UXpEalpUWUJXa3NpRlJGeDVmdzNI?=
 =?utf-8?B?NFFCV3lMV2VQSTJGNkI2L3BsSUJ2SC9tV3hVQTRobUJpT2lvUVFBMThDZmRa?=
 =?utf-8?B?YnlBbmc1Nk1pK21DSUhYdTh3SUpibEJYNEY0dmlwbCtPWFdvc3JuTEFEWjZ5?=
 =?utf-8?B?UjRGTzF2WHIyR2pkakVWZ2dzZlJ0bXMveGlpV3JVc3czK3lXaEU1RGp6K0lF?=
 =?utf-8?B?YzZ2NUtpN2RCOTF4aFloZXlKZ1YweW5KMXBWUWZUS0t5dUdGTmpESi83U0hh?=
 =?utf-8?B?cnJXa1BHK3FIbTdXWWpZc0E3clBsODh3VUtGNU1QTHJCcTNObStRZlduNEVp?=
 =?utf-8?B?YkhJWHNoNDBCUFY3ZFZLaUY0K0ZodHhIanVxZkVXSGQrYXJXWU5aRnlmTVlS?=
 =?utf-8?B?YnV6aTJ1bk1tL2JtQTlLN2VBSVBJUDdhbGM4ZDltYWtnMnBDMG9ERHpaNzJt?=
 =?utf-8?B?dFhqK3BKVUNUVGp6RWZpYkFPWHFNK2tha1ZwbGZFTzlSQlRzYTVXZENIRUhr?=
 =?utf-8?B?UDZqT1daYnBhenVUalBmMHl4VnlOem1reUJseVBlODlYTmt5K3FwRmpMWE1j?=
 =?utf-8?B?WHd0dDY4aTE3WEM1Zmczb2hkT1ZSbk9UamNtSGQvL3hmZFdjeWEyaFI0ajZX?=
 =?utf-8?B?bDl3L0RReklKZk9ySm1YRUVZY1A4eGZua0ZZa0xmRFIrYUJJd1FWK0JaRzRD?=
 =?utf-8?B?WCtTOFdNZTVWN25xL0d2NENyV2xTdDBzYXVrVURaVWVnTTdRV2NNQlE4algx?=
 =?utf-8?B?Q2dhaHpyNXlDTEQ2bmp0TW16cXEvUm44VmNDRFVaMm1jTlQ2RE9OR0xMcWdV?=
 =?utf-8?B?RWN2MlZqRzBESUpDY1p6UUFTMHBiWWxqSU9KT3Q4WWRUdDQzWGxvQTRDSmwz?=
 =?utf-8?B?N2dieXQ2M3JCNUw3eGVCc1Q4S3FpWlBjd3FzRHYzcUd5N2dobEFpVlZvaGlT?=
 =?utf-8?B?OGhuTEJway8yaVByVUNBdXlXR1Vncy9jckIrckE5Ri9NNVlPMmVpZXpZb3dn?=
 =?utf-8?B?cS9Ba1hhYjdLb2s2cHBuNXB3QTdTL1d0Rm5aV3F2MGptTWdkVTIwb3lEbnY3?=
 =?utf-8?B?SGh2T0pNbXpCN3dSVHlNaU9ROE1nQTJ1bW1sNk9QRkQ3aTVqZlRrTDNzMm9J?=
 =?utf-8?B?NHlVRFAza3kvQm44bHd5Sm1tVWs1Mkd5eXlITFJheWJlZHBxK2gvRVVjUFl6?=
 =?utf-8?B?QzBvaU9YcWNGbXkweHlVWGt5d2M4WDh6NWFDaFNrcklidjRUU1ROSXI1TTBF?=
 =?utf-8?B?MTB5N0pCbVpXbkhJTE1xdFpNM3hWRmwxeGJhTlNGSmtNWDJQR1Y1N3hROWhs?=
 =?utf-8?B?bmJIc3dHbEd0THdkZjNEZjNsd3RpcjU3U3FSUzAydnFhZjBqODhPc1N3SVFC?=
 =?utf-8?B?azNPUUFBWDYxZTYvNEo4eHpWaXpGVGh3SytRcEZLNnpvbHEzdmlFRk51dkkw?=
 =?utf-8?B?cUF3dlBpVTYzR09DYVFnR0p5ZTFYN1p6K3ovUDh1bDBNbVF6ZHZhZTVjSGpD?=
 =?utf-8?B?Z1pXb1E5cWJPT1ZORG1BSkZPV0NCM0NCU3Q1a2hWcHlOM3I3WmxWZzh6ZW5w?=
 =?utf-8?B?dzAyanBWaldrbWd6dlEzWG9jNk8zUGV1bGRwMThKRzdGdFFOYytSdk15NnRk?=
 =?utf-8?B?a29DK3ExYXMya0pLV29UNDc2NEtSSGU1bFVCcXMraFpYUXJ0bFgrOGhwQlE1?=
 =?utf-8?B?YzVlbVpUa2QwVzR0c0hLU1JGVURWS1FuREYrZTRML0FxdVBmc3k3WGoxQ1NI?=
 =?utf-8?B?MGVwdldvTXNCUmV6dWdYY2VORUFYenA4a0IwUW4rMVpWMXh5Mm9OcSs4SVd3?=
 =?utf-8?B?R2wwS3M4OEpMMVd5aU9UMEFtaHBHVUcrZ3ZIMmVKODVpbC9KMkwrQk5obzhn?=
 =?utf-8?B?YTh5amJwMGRVOGttVSt2eTdBYlZrVCtLZm80TWFORlRvUWtRZFdDTXh0aWdM?=
 =?utf-8?B?SUJUSUtXNkpFdk9PRzRqc1hCSEQxb0NIOUFSUXdxdm5HaHdGRXkzY2x4TXpJ?=
 =?utf-8?B?aHZNZ3VGOTlaZnNPN2RRL0NvTHIvMytqUDV0V2VScFY1UWc0bVZkSmwzd0Fj?=
 =?utf-8?B?Qjg2Q3FmYkV4MklGWURSNS9hR0h6UVNFZEZEeHg3VU9waFZUZ0NUQmYrZEVl?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b75345b-f404-4335-a1de-08dbe6de42d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 19:57:28.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wXf3A0/CWjXKSKk0lXryUaQePee5e2vd6lmRC4LL7tto6Uo6uogyRnv3wxpH8QFDvebX/EEJb0bpbU8bwoLVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 16/20] drm/xe/uc: Extract
 xe_uc_sanitize_reset
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:27PM +0100, Michał Winiarski wrote:
> Earlier GuC load will require more fine-grained control over reset.
> Extract it outside of xe_uc_init_hw.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c |  4 ++++
>  drivers/gpu/drm/xe/xe_uc.c | 14 ++++++++------
>  drivers/gpu/drm/xe/xe_uc.h |  2 +-
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c8e2689873c37..d0962e0cc27e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -537,6 +537,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_hw_engine_enable_ring(hwe);
>  
> +	err = xe_uc_sanitize_reset(&gt->uc);
> +	if (err)
> +		return err;
> +
>  	err = xe_uc_init_hw(&gt->uc);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 784f53c5f282f..13e76e6805ca1 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -69,10 +69,16 @@ int xe_uc_init(struct xe_uc *uc)
>   */
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>  {
> +	int ret;
> +
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> +	ret = xe_uc_sanitize_reset(uc);
> +	if (ret)
> +		return ret;
> +
>  	return xe_guc_init_post_hwconfig(&uc->guc);
>  }
>  
> @@ -90,13 +96,13 @@ static int uc_reset(struct xe_uc *uc)
>  	return 0;
>  }
>  
> -void xe_uc_sanitize(struct xe_uc *uc)
> +static void xe_uc_sanitize(struct xe_uc *uc)
>  {
>  	xe_huc_sanitize(&uc->huc);
>  	xe_guc_sanitize(&uc->guc);
>  }
>  
> -static int xe_uc_sanitize_reset(struct xe_uc *uc)
> +int xe_uc_sanitize_reset(struct xe_uc *uc)
>  {
>  	xe_uc_sanitize(uc);
>  
> @@ -136,10 +142,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> -	ret = xe_uc_sanitize_reset(uc);
> -	if (ret)
> -		return ret;
> -
>  	ret = xe_huc_upload(&uc->huc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 4109ae7028af5..5d5110c0c834b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -19,6 +19,6 @@ void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
>  int xe_uc_suspend(struct xe_uc *uc);
> -void xe_uc_sanitize(struct xe_uc *uc);
> +int xe_uc_sanitize_reset(struct xe_uc *uc);
>  
>  #endif
> -- 
> 2.42.1
> 
