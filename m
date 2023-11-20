Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1BFC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4417F10E119;
	Mon, 20 Nov 2023 20:31:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B7D10E119
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700512304; x=1732048304;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uV8uZo9YWoXZtkiNbo7b6IRzSf0NFOoDvc3LUeMTOxE=;
 b=TxyX4OXtqbJ6gbiljAXUOJ5zkdQzgjmHKAyqACki9NZ1wwftYtT9CHm/
 4G+0J+Ps9gD3NQSQDv1WpoAAJKJqGl3yjTVPm0s4y9WcZzqzX3IYGZ1qu
 sAQJKvCBK5UC2d42ThxroI+cIuZagVS3WEBA+gX9iEUb/7Bg5EiynjfYI
 LdtnLPJS80XVr7EIU1PiEwiydKxwIGCRpKNk1INsEr2lKVrvAaf+7maz9
 n6023qAISM9ddLuREBFb3MpJVa1nTAJtyoKfVkex3sNCPr7mRYb76+OI3
 YAfr8wcdFGUvf0GR8suecAIRYicejJ1IMlDTtG+G0cUuIbYgsnywUZjyV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371875034"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371875034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910228576"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="910228576"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:31:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:31:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:31:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:31:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8KKSpm+jrD1k22I0HoCpk+pwfv9UHsOwD+GKMqYanQzFIlj6WhCPjMLuRRLQ3dadao0XroLAzf0uWCVYbaqK7IINBfvqc65k0XRMSgiHEuT5d0nvKjO9I3rHGrXZ75j2J+JZZi943vqaZhxVISVRRMmgMnUEH511h8FW/MAUobK0Ens9CrCTU5fjPxPbtcoPH8F13Plx60uFizrEZtijCbSb4crEIZcayIeNkuTe9yRoqvn0+caDgHpsVnph2uBURUl5I6F1yie2I03pqsEJ2IsfhfouuFlMhL4yL0n5AuGZ8vtVeozvPqQ9ai4gRozfMu/IsjGX5vRw1e73fUCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F477v/jxON5chOB/Sf9Sknhclx4DYk5+Nd57pAP5xo=;
 b=OTGD2ZcmHdYV7Mw/Pix3ssJB8wBnAU5FJcaqG9aLIJ57O6GXuquQ+5gCe6BOhe4fT2/sdvy5m5KH6mx0rDMSlooh9dQuTmBzncDuBL0FfUB8AmeK3kMBkh0m0IEuHRZ4bpi+uAn/HYx/WXgUg5xoRY7sTtXrrhtEdNV7m+E5+eGAwFeJCJdiQpY5FqXree+TNburyKotF9G0/R1sUJ11gudYhtV0PAluuPRD5ZTgYGNXifp9uQy7FPtwKh8eTuivLXHcsujgCygfxJp0UVNYdgat1cCHCE+uhKH1VvwhB+HBH+JvyaKz284fEJfdnzgxCojOH/gu5E6bH/X4Zr5+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 20:31:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:31:40 +0000
Date: Mon, 20 Nov 2023 13:30:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZVtffjXpEMPMP4MN@DUT025-TGLU.fm.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-20-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-20-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 5832e386-592d-482c-a6b9-08dbea07b36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IORh3iNCkOEUhmZBWp72hLF/yzcWYEqUxxxaScyPLMjDE0K0iFevse+WoRhxpwXIftwroWTyO6JRmK2+RTxWbz1yPYwTSEX6Ts6jUZecyVC6hU+Z6abcxJKaujTWE9tX7bLeRUUP3PbRNyb280lOpsuMW2KQdYPTecCaliHijlg8imd938Dcfr5vwiE3vnacILYL9Zz8z9La1jN5CfjAyQqx1vALHX94k4sHgV/yHaOgJmgg8v905vu32XrpV3mKP0sakn5LF+kwPv7E/QGWUwqJJ8GG1kKa6WETlt/NhnVw3yjP8vZ4Wx1hx/OV/xmqevuKeV48OAeRgJFKiGp/0j3Tzv1RJUhr3j881Ul5+K2VQBbeKP2RUe/sdlmKjP3XCC/4bZa2aQiRwqZhNLf3XvmiRTcJHL/EJLYDmsm96pqdG80R6mx0M6hMbuDpEkoRxjxd0RrU1zZoVPeF8JRzTz/v2ZqSTczeXVd8oTSpNLJo0EiDEnIjedNSnPnjnmnjgp3llfy40/5nJLoZV0YjYXvgf3MeN4PbZG6w3lft+AkLmAV6KCoYqidIMdRWeaXr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(44832011)(5660300002)(8676002)(4326008)(6862004)(41300700001)(8936002)(2906002)(6636002)(316002)(54906003)(66946007)(66556008)(66476007)(86362001)(26005)(6486002)(478600001)(6512007)(6506007)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGd5SWdrK0QzS3M0TkRxOEp1dklRRmZwWk1PQ2tFRkxRN0hQUE9DZ0gyWUFR?=
 =?utf-8?B?bDhkRmdsRjBDaFM3SnRWTXl4dTdwaVBZNzI1K215eGY2OWF6WldJNDFCM2FY?=
 =?utf-8?B?WERLQnRZbGVwUWwzTkNERStaemxJOXpKYjFrODg0N29vSXRYc1UyUllWRVJF?=
 =?utf-8?B?ck1XN0NaMkJDTUpKQlBBMWJvR09xMk1XTkVOeSs1d25hVTZMRFk0S1U1V2ho?=
 =?utf-8?B?ZzcvSnVVaFMxeWxBWGl1ZFNBWjY0R2FWellHU0ozOStJbmU4NFBqL3J6Y0JU?=
 =?utf-8?B?YWo3c0g1QXM3WGNHS3EvTWg1UXlsN1VucHozQXc0SmNFTEowZTZsWk1XN3Jv?=
 =?utf-8?B?cnJHY3FFVVkwNmJ5ZEo2OVFKZCtvSWlNUDlydHd1Y1RIbW5XWnNNeFNQRTFv?=
 =?utf-8?B?VmhQMGdhSkQ3SWkxSlp4bUpwSzNMa0ZuTXJtV013NDUzRzdYOHlnWUcwUG5p?=
 =?utf-8?B?QnFCV245M0tOL2ZxNnczeFVYZDRmTUFUS2FTenYwOExWZnVWMjRFYXVGWTgr?=
 =?utf-8?B?ZDluazZQMk0rWldCTllGNWFPdmF1elVqMnVhZDE1Sm9saVZQOHFHMFJxNWpv?=
 =?utf-8?B?cisxWktsMmQ1MjFVUG1xelk5a2VSZUNsK2hhU0E2UkwyVEVjNiswNDl3N1RD?=
 =?utf-8?B?L2YvcHd4VFlKajRKM2Y5Znl4RDJkbGFJRER6c0IvamIyM0RXSnpVVWNFbHdH?=
 =?utf-8?B?OVJZVVJMMTY3K3daSnd1RVVQbmN6bDVwM0pnTjNQeDIrRkczT21HQ3o1STA0?=
 =?utf-8?B?QTdaSjRvdDRoaEFZcjVwOCtvOWNYeGk1UGExWC91NHNBSEwxZC9BNGpYWlc0?=
 =?utf-8?B?a2ZTZmFiZ1phUVUxUkRPdWhWRXNvVUNWc2p0aWt5cTgzcWtVZmxIeC9VbTNN?=
 =?utf-8?B?QThuQnY5bVBQMlFPdUw1bkRHSkpMRlhuTVl4TTBQQTN4NjNSa2lBOUhuR2ZF?=
 =?utf-8?B?L1RKM2xMQUZWQ3doVllPalM1VlFrcHJzWExRazBxQUJZanZlMTF4aVp5MzNF?=
 =?utf-8?B?eDlQbS8wNVgyYzV0RTVIMlMvNGUrTEE4emkyWDdZelF6M1hvdVkwbm5VczE1?=
 =?utf-8?B?UUhleXVpdW9zUlVUTGJ6VkNSSmlyTXhBeHdiVE04Vm9pdUNSUzJjbmtyWDNa?=
 =?utf-8?B?bVZka2wvWHZteDA2ZjZyZVJMUTZwNWxuU1dHWlZDeEUyNjhENU1iRkF5a0tm?=
 =?utf-8?B?c0RvcTBFN1IzaDhOaFZLcTErSnIzemJlOE9IZW1MejdKQ0dXWWJYcTAxbXZL?=
 =?utf-8?B?eXRsM2JUS0ZodjZHK1VlbDBDS25iUkhUaEsyMWZzM2NXQm5sSDAzaGg2eTlT?=
 =?utf-8?B?YjdQU2R4Z09XV1gveE5Kc3kvNnBUMFpDbGVVeWo4UGpUTXhlRUl5eWFPOHhM?=
 =?utf-8?B?dHNtL3g2U21CeFI1bmhGeVhtSm5vcjVQdFVPWlJiREMzY2FROVFQcmt6UGFn?=
 =?utf-8?B?SDlVc2hhUlFvYkhRM2tpSEUrN1EzZzV4RXJNaldEZHFTSGIyRStrb1Z0N1RF?=
 =?utf-8?B?cmZ5WVVVbk00UG9wMWVTQ3djUHRiRmNaK3NWTG5ocWQyTmNFWGVYNnRlaXVz?=
 =?utf-8?B?eVNaTVdhcUpDQjhKU2FLKzBOdjZPQmZxVWpIVFFlblBCVzJxRGZUd0ZraVcv?=
 =?utf-8?B?VW1uME14WU1SUXZWOHd6MVY3eDBIN2ZMSy9TZjIzVEV6bnlPRSs1Q1oxVVIy?=
 =?utf-8?B?VkRTTTIvUytXZkpGcHVSenNUSDFybmk1ZjhsSlMvQXFpMFB2dENaWTdXOXNL?=
 =?utf-8?B?dUNqVDZrenNpaFkvK295MENKeG0xWkhBZERlOFp6T0wvYlFZYlp1QW5pdGIv?=
 =?utf-8?B?a2NpYm1wbS8xRm1oTktzaEZPYnNDL1RaR2VvSDJhTytFa1RIdlR2dW5iVXBC?=
 =?utf-8?B?bGY4d3BidC9NNUJjSkk1M0lPVnlIRitHRWUyZHNEQVFWbDBqcGk0bEhRNXp3?=
 =?utf-8?B?c0FTSHBreW9LMlJRT1drcVovdmFYcWU0Ynd3eGhlNm1CNW9MVStwTGhtdTNo?=
 =?utf-8?B?NmFJUVZiQ1lET0owSjBjUkZhQUorN2k2MVdmK0NqRm1xWDEwS2tZN20yYWt4?=
 =?utf-8?B?ZVhEbjJKU3c2VStBL0tpTWpHdUswNkpmZ0xDMzJ0QVRsQVYrRll2c1liMXhN?=
 =?utf-8?B?Q0Zyd2ZqT0xTUGpCQUo0SFVQcEllZ1VMSUNQaDBVTHdwb2QxbkFVQjlKTkRW?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5832e386-592d-482c-a6b9-08dbea07b36f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:31:40.1013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irVRuDnh3CRHenTPm4W7Ji+YQZKYuLOEdGdOmdYqdrH11MABzpGy8VtcGpSuqiX3RU9pyXQzj+iiLFzC+ySQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 19/20] drm/xe/guc: Move GuC power control
 init to "post-hwconfig"
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

On Tue, Nov 14, 2023 at 02:02:30PM +0100, Michał Winiarski wrote:
> SLPC is not used at "hwconfig" stage. Move the initialization of data
> structures used for SLPC to a later point in probe.
> Also - move the xe_guc_pc_init_early to happen just prior to initial
> "hwconfig" load.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c  |  3 ---
>  drivers/gpu/drm/xe/xe_guc.c | 25 +++++++++++++++++++------
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d0962e0cc27e9..73665e4e66f22 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -348,9 +348,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	/* Raise GT freq to speed up HuC/GuC load */
> -	xe_guc_pc_init_early(&gt->uc.guc.pc);
> -
>  	err = xe_uc_init_hwconfig(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 3f430d5bc1051..e04b04be32b7d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -246,11 +246,19 @@ static void guc_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc *guc = arg;
>  
>  	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_fini(&guc->pc);
>  	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  }
>  
> +static void guc_fini_post_hwconfig(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	xe_guc_pc_fini(&guc->pc);
> +	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +}
> +
>  static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
>  {
>  	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> @@ -316,11 +324,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (ret)
>  		goto out;
>  
> -	ret = xe_guc_pc_init(&guc->pc);
> -	if (ret)
> -		goto out;
> -
> -	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
> +	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
>  	if (ret)
>  		goto out;
>  
> @@ -348,6 +352,7 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
>  	ret = xe_guc_realloc_post_hwconfig(guc);
> @@ -356,6 +361,11 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  
>  	guc_init_params_post_hwconfig(guc);
>  
> +	ret = xe_guc_pc_init(&guc->pc);
> +	if (ret)
> +		return ret;
> +	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini_post_hwconfig, guc);
> +
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>  
> @@ -566,6 +576,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_init_early(&guc->pc);
> +
>  	ret = __xe_guc_upload(guc);
>  	if (ret)
>  		return ret;
> -- 
> 2.42.1
> 
