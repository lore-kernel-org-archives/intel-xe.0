Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621E6C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0FD10E24F;
	Tue,  5 Mar 2024 17:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhQ7jkJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B6B10E24F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709659829; x=1741195829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qjibYKYmWOhvtHFfqLxTx2k4P7uX0NPS4BLtFey/NlU=;
 b=EhQ7jkJDfevP1JJRN8PrUoQrH8unpbFSvSuaHGbwp/0bOucb0umw9TQW
 EYtLFWCfpHoeO+VPIA1H9njgIMZgyCPtvuaIILXtvWsOtEgxS754CmAzW
 wiYZG4a/Xu/o6lbGzlbh9mv84QRDG10x+7AstZ/mZfEVZBpr/S1GFH7q3
 PdPFCYqd3wV+YWRTOXQz/Zqc4eWF87AZSa+XxfvRq4FYN04Gwg/Jv1Fok
 PgKNVG89iw5PIP6PyuUDsVPDYLQ5KYVBzda4Go4veowuUyIW8mSKgjKtb
 kdvfhXXf3JLCFJbElGLlGMAxw0+FKUJwxOdXfrhUFRICle7AKZs4HP8B8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14882205"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14882205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="40455565"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:30:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:30:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:30:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:30:27 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:30:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjDe4E2y0y8fBEDXpZ3mcerRc8iSeQP8rYcFBsMIRxF/DDTpz59tf/v4TdLHWTQm05sdnzepQzZkflmWfY6BJK/2BlY4jUMwG3XPMkcGEeeec8JGRzJAGFKLXmvBmFP8dExrYicX/yRRyTtvxI2DofSDg2Tiv4gk5kxzcfLdAJEC9oP8SIFZQf6G70UD+eQgfb89xjxt+WrXZimLPERrn2Ni7KbpHn434kE+El1FU9okrF7NqSL7G0qs9FkK3NuLD3v0jru+71RDEsptHTCkqQGhbdYROWlcrLFiRWRmsBZ46yf7LoWO3/Lxef+0ua1bi1PxGPoH/nfcwR4b1fFX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ire0+NmOyjoeFU5L+2TchHWGU5oKRG6fOKP/YLNB8VE=;
 b=fUbbSH2CB+yPuXDJYyikxFK/NZmY5oHF8pgmcQaKshvLqWKRXTl8mk65u0WugOnVYOzU/Go/UDLFd6p6gMSuS69/idqQ8i7NbEmTkJWvZLafwbC6qCn3gZbBtluWQjkJ2AbeOXgvARbpnz/Oga2rlBxhnxpyxbnfxlqPQe/cEf/bR6tp3w32p0QtRHV+d5JNj9dylLsnU9gX95oBeZODLjmfoKIdt7ImpZbFlYd0yYverjU/mI0KRI1AkxkB00aZwYYh63EBhntf12w9Fu5TA2THdiIGmcPiYsS34IoGyEvz0A08o5ytxdCDywl1c/Zyzp1BlAUAvFQGiyJCswwirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Tue, 5 Mar
 2024 17:30:26 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:30:26 +0000
Date: Tue, 5 Mar 2024 09:30:17 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH V1 1/3] drm/xe/xelpg: Recognize graphics version 12.74 as
 Xe_LPG
Message-ID: <ZedWqSVWOW709IF2@msatwood-mobl>
References: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
 <20240229061331.3398966-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240229061331.3398966-2-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|SA0PR11MB4573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddc32e1-6684-4bbd-c120-08dc3d39f204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NaoWC0MpAOknP1pQ6U4wvK+Ohcod+WAX43FlTvW2YQBecBFvjRJePflvK16Swo0N0N4LAVaiWDkWMB9yZulS5V1yHabS48Slxppbh/F05aAYW1UaiMj+Z+yInoMTctMPoDYyZhm0Vlf7K74ZKfi4G+zVumc0wc9No+DKJqZRMj2VAMcdjGxSUw/7NoqifHd1gB2uASfrQOMF30f+ncsBi6Wf5ro9MAG2za/xFj3jdd3CtwiX10paopDKdxp7bWeBeNYATh5GYm7HC4LlH1/VmMQf0DlKBrxumy+tTN1vMPlfcfZdSB0+DBmoHIP6ou8PrY9SV0UCKpK1SYpBfwjuh4/mTJdAF4FE56G3lRZ2+QsNV/+fOTdx7A/L8mBy11P0WMkNtAzVeEyKWZRi23wXa4l0YhM0ZGbezdy5hvTp34Q+MUqzvASS8Vj3WwBNRnaKfyIzOp3QShqalHdMRtfBl15wGmeAXCU1Gpi0TqtDl/go9zdo0GxwTpfE9x6eUXiMF6bHtFMKZkf2zKrPm/ftG1IEX38Sqs/P+TN6wbH853pmNYem6rx0aJvfyFdhicMOZP+CsBExd2g7/8jXyo5liYJzsiITkvGLIap79P+mPRVJ5TG844W+FPpYGzinXXliE0RqqX0kmb1AHctkF2mGxKNuOvMp00C+G4c5KUFKi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNFSHlpcGJxeWNnckFDV2I4TUprQWtMTlE5dVpJNXpFb2lieC8rOFJERnhW?=
 =?utf-8?B?em1wMVJ2VHkvc2ZDZ0E2R1RmaUZES04xVGhDL2lFdjE1SGhBMnIveEllUDN0?=
 =?utf-8?B?ZVIzZGlkRFhvTm9VRkR0ZWhvbVYrWC94dnFXU20reGFLUDlJOHpDTGVJSElt?=
 =?utf-8?B?bDZhUkh5SDB0NGxoNmtNWmJTbHpGWFNrV09UcGJ0dHFiMHhNejFyc0RlazJ2?=
 =?utf-8?B?MFBhdnQ2UW5GczVIb3BwcEVjTStBWTFUUTBRd3E4S1RxSVZWcHFaakJMMVRp?=
 =?utf-8?B?a21oKzcvQ0hWMjFEeENVZEVzc3ZLNnZGNlRnWThVcTBtUmYyWW1ZL21KZXpG?=
 =?utf-8?B?RzhZc3I5Nkk0NUE2K25DZjlCQUNKNndLdGhZUGk2VWpBblo3R3RubGp4ZWxH?=
 =?utf-8?B?ZGZVbDFTalhHV3pqdVYyQ2xmSFlQaXppMExCNmFqVnRBYjM5UjljNjdYaTd6?=
 =?utf-8?B?bmw3TkNXUXZRLzQwbm1HbnFqUTltaTlyWUtnRUhaYmxrOGk4Uzc0WUJrYTU0?=
 =?utf-8?B?YW1JZWUxVUQycWxDaEx0NFY2ZXFEZ3RxSGVUWDVhN2VjZVVGSjhZSkE2a1A5?=
 =?utf-8?B?djU1bUZrYUZCc05wbWZyNFcxVHNNLzMxV29jU3pXdHJqV1dKYUdRY0w4VFdC?=
 =?utf-8?B?TlNrQnJ6QWF6M09aQ3NWR2tSeHZ3N1luYUk4OW53c3JVNjB3QnViMk1lSzN5?=
 =?utf-8?B?SXYwN095ZXBpYWxMSmdBMytmQzhTcDJTa3kxRE5lOHRiUDBZdWZUcFR6cGZl?=
 =?utf-8?B?aEd5M1ZJdGNLMitMSUZhc3dUdGQyekRrck1pUDI4MDBOVmFoR0Q0WVFqR0x3?=
 =?utf-8?B?YncyYnFsbU1FSDE4TWR5TDd6Njc3Mnc0bkJZdWMreWR2aWltWXdZWHhnK2or?=
 =?utf-8?B?R1BCRlN3dkd4MmJ3RWMxNnM5SFdIU3IzaEluS3VXV09JRTl3UW1DMmJsWkxn?=
 =?utf-8?B?cWpERXJZUzdERzUxRVo0RDErS1lLb0J1SXFIcDlsR2U1Z0VuTW9lZmZpSkNP?=
 =?utf-8?B?bTFrZGpUd3NCUmQ2WS9RNmlVYXpKTnZxN3ZoUHRZMlYxekowcFhIcjBUK1Iy?=
 =?utf-8?B?R3RHQkl3RzRjM1U5TjJmeitMK0swZmZHaVY5TXhmSzRYQjg5azdEMjhBQmtU?=
 =?utf-8?B?OWpGdEhFR1NHdjRIakRYL0JDOXFHcmNtOUJmWFpkZmNTaGx1NnV5Y29EM0Vp?=
 =?utf-8?B?aFpDa1RHUGFTV3ZSRUVpNXlSb0ZKOGx2UkhGbzNpM0pzVU1XSHdGcldZeG5v?=
 =?utf-8?B?VXdKSi9JTWpyZGpxckJFZVdqUWJZMVVLeHhaOUFhY1lwTUpSMUllK2t3T0Rp?=
 =?utf-8?B?VDBCamZqRzBQTXJrYitFREIvTjNjT2ZVcUhBQlBOamNWK0RYY045WEZBV2N4?=
 =?utf-8?B?L1hFK05ocmN3RXU2ZHc3Vi81OUdnYUZqQndINXlEbUoxREVNTzlpUTBabXpl?=
 =?utf-8?B?UFk0RFIzc09PVndNM1YvOG9QcWdrY3lrV21RZk9GRzJBNDBCa21Zejlya3Vw?=
 =?utf-8?B?bXh0djRHWjdjUlREeUFoaHdVajMxUktUMlBWeVAxQlVYV2VxVHFaaENhb0wx?=
 =?utf-8?B?YXBxUkJSTzMvd2gyU1RRcVFFcFNQSDNJbUEwUWYrRSt6Y1RDYUt3dVZxVEcw?=
 =?utf-8?B?U3FDdmlMOVIrMFd4L3NtbGJ2K1VHMmIzSzY2Z1FiRStnVllZLzRPQzI5dU83?=
 =?utf-8?B?RTVIMCs0dDNzdHdlcDJkdWJGc3Y0bGFlMExEcjB5MGxtK0ZyKzBoNVpMSmpQ?=
 =?utf-8?B?Q3FTUDZOWU92SnMrdW1qS2QxUkU5SnNNeVEwNFFXc0NPVXd1WmxQTUpncjNr?=
 =?utf-8?B?VzduTkM1N09QelYzd1pCQnhoRmpQQ0djTFJKU2h3elYwSDJDT3RXK29YcnhB?=
 =?utf-8?B?TGgzZDc3cVU5U2tzbE5QNDZJQURyWTFnRUQ1QVFOMG5EaXlKV0hlSFlUcmE2?=
 =?utf-8?B?Z3B0OUZKaFBUbzZCeUNLWkV0V285aUFFcFBjUkFyUGtwUk8xU21WS3BBaGpp?=
 =?utf-8?B?RnhJcGxydGlQNGFMQm8wKzRQT1hpWXZXMnR4bTFScWpuRFhIWTJXVW1MRnhS?=
 =?utf-8?B?cGFmRnE0N3dNamdReHlVbi9iV1FmRm5VVTVZamVNVmhmSmxlS0h1TDBHL1dC?=
 =?utf-8?B?RFJ4TmtNcGd1ZU0rZUNCWWVibEg2MXFuWnlmOU4zYnRTbnRJeDNqSzd5RGMw?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddc32e1-6684-4bbd-c120-08dc3d39f204
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:30:26.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuGRbeWoX7gSO83yG50vzwjoUJZpwYNPWhFqGtVFINJVMD3RaW3TP2JB4ocZ4agOkxk2BiAtERO5BxzZ3T7nb0xsRzpUSIWDwLNW75kKKiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
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

On Thu, Feb 29, 2024 at 11:43:29AM +0530, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Graphics version 12.74 (which is technically called "Xe_LPG+") should be
> handled the same as versions Xe_LPG 12.70/12.71 by the KMD.  Only the
> workaround lists (handled in the next patch) will be a bit different.
> 
> Bspec: 55420
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c    | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5b5c29761c5d..986c07d8b168 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -343,6 +343,7 @@ __diag_pop();
>  static const struct gmdid_map graphics_ip_map[] = {
>  	{ 1270, &graphics_xelpg },
>  	{ 1271, &graphics_xelpg },
> +	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>  	{ 2004, &graphics_xe2 },
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 5c83c75bc497..bb6db2817ada 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -50,7 +50,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  
>  static const struct xe_rtp_entry_sr engine_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1271),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>  	},
> @@ -88,7 +88,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	/* Xe_LPG */
>  
>  	{ XE_RTP_NAME("Tuning: L3 cache"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> -- 
> 2.34.1
> 
