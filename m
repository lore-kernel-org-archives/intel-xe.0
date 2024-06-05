Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317BC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 21:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36910E1A7;
	Wed,  5 Jun 2024 21:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbqKtgN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565B510E1A7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 21:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717623291; x=1749159291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3+LuTxnlDWmqwAEnZ4S4jZpTCVECL8Xb0KMeYKqYLOQ=;
 b=gbqKtgN79XMIbZf5AoNVcgk6y8D4wjzo1/05uToZczPFAwKJnSniNYOD
 dh9a+6MeGXrm7fxkOO4n82UHv/adCNKUDJuauiB1sG8irBR2DOG5IYv8W
 2/H/qCqwN6pQequzRi7wANpmPYsVnFA4qL33j/S2Uf9RxF1R4DvSYLFSC
 IGGTotIyvKTQt/yXkMIAXTy5V9T225vXlX2Qhy0Zt5FEISgdA6uYX5vcy
 R0xuO6SxIcrtH9byNddz9HfqtAMyJUFixyq5jmcydueQ0NyRNCANxYUMG
 5t9usfUmMTs//cD7b7ZK87kJUqwePXjuALXRa1IpOHUvN/7CD7iwnx6rk A==;
X-CSE-ConnectionGUID: asnyfEUjS5Ghcrgw+gviiQ==
X-CSE-MsgGUID: ZU5w1P5PQXyt8aPMd3ciJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39661529"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="39661529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 14:34:50 -0700
X-CSE-ConnectionGUID: 7IvY8CXOSTaK46YioyknOQ==
X-CSE-MsgGUID: eHaK58QZQIqfaH8WuuymGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37651361"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 14:34:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:34:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 14:34:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 14:34:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 14:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi1+9f3fIN0CGROg62HHpavO3bDS//5dTPzW18HbWi1TKaQJO0vPnFoE75meltKdXXvaHAmxP105D8gfsI7e09J0308LtSw0C2ej4NnBLLPNbbqFYZvaGiRrfA5T6jSoDR2p4uPRCfMNUf9Uu/pWEi6Ojvsgh0NXtMfS/e/RDEekmV1J1XnUpayB6MqlinLqBmmJNvfSP9fobU3SLG1eB4ljkKSIcnmTARaRbZhSkSeNWO5Ft7bRY+yHJgK4xpsUlSIb8+6kQZoJSFQmGO7DgGDKYDzGPz3WJbZw/Ma0i/q5HsPWYqkcdcuNKTeHr+TsPqVp77+kgptSs/wU+S+6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUz+Jw7NQ8FoYz4fqbeOwPofLthCgBK7O6Arw+9BtiQ=;
 b=QqNzwLdzn0LrvSvJ5WpcS+Pi44NlBAQC5IxDV2N0eMeKDICfGVDnWcA5WdtOVDkVOi4+u8b+Zqdj9mlmbOyyN11izOmDEVhWB7KkmhAvqeOVQymlEKZRHeZQwYo7sbFpPP4QQ09jzNXCUoT0nJh8jRKJbi2fA5BzEQlNkqn4itC8HRdMygqZKuHlyi6fDlspbhafiFlT/repxTqBSBp+cXwgsCC+VfdIZPY9gomsFahdD8SLmJH8F8C3FVpIZ2j7RxcV55PFnZuLF3XBE9oRMfLQxLiJ0NurfPUozIgdbv87hBK/6cywIoER42hnTy28dwc0KKW4Do60WLAShfsnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Wed, 5 Jun
 2024 21:34:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 21:34:45 +0000
Date: Wed, 5 Jun 2024 21:33:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Prepare fast-path to be called outside
 of IRQ handler
Message-ID: <ZmDZwgoLgiHKxfY4@DUT025-TGLU.fm.intel.com>
References: <20240605201947.1460-1-michal.wajdeczko@intel.com>
 <20240605201947.1460-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605201947.1460-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ecca83-33c5-44f9-693f-08dc85a75174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kFltpRo5yvTxpWoJKEW1CkusbC319ASVTawYyTvK0RFfiB3RxA02C+wAvI0h?=
 =?us-ascii?Q?mtq2jgnRUK6s8oF34SvAJb7xv6ge+wY083qvaeR+cwJs8SH+TA+mWMcJ1opT?=
 =?us-ascii?Q?cylfIWOup/FECBEWc4yfAOBn3JLo5ZzLXPnmhbvgUxgrDMNsauYvhUoVSwPV?=
 =?us-ascii?Q?MlqW5XjkRYVVF6xNbanVOtHaZkwGywtilT/p57+IsmSqttbs3jkovN+vriCc?=
 =?us-ascii?Q?VUHXeN1hJbaRsgYgV8ylNqbC4rZDF+FJ5QHMHiN5mMQGV5VKVw6CG5Qn44t4?=
 =?us-ascii?Q?NPS7YW1UB84ZYSMLq8x3zktd7gJkBk16MZjenAIj9TuhyTMmLsoLdacG5Be0?=
 =?us-ascii?Q?ZJReUtM+iFIKQxAmvjR7P+rJ8zljzPmgGIqWHtd724+saAEx84ZdsxKZjBq2?=
 =?us-ascii?Q?Xw9x0xwBOMmatectDsNhFsLuhoI9FNmVpoOERZJC7bzUm005SzG/woQw+PDs?=
 =?us-ascii?Q?nU1CGIwPVXSuWxqNSvM7dt5apGnSQA3Lx4a9yzBCpv3SyK5en3Kg0T3C8nVT?=
 =?us-ascii?Q?Q0w8SqpbZYX4Euge8YWbVOfioEDYgK6ETIlhBeJFCO25lCdykiXrWs/3uSXe?=
 =?us-ascii?Q?mIhaFCrKAfwMsPY9NPV9+CE2yXtcMphACIxc/Zm9pnGGJIixTOYQijxfRmLS?=
 =?us-ascii?Q?oBeXKq4y2pwWh8Wb0074CsrdCmGeD4pABxGuINPJNKt306O8ANwjsHjbKVnE?=
 =?us-ascii?Q?Agb/YOiw2hawcYZLyvK+VU4oHPF+eaXZBPgysi9hTjhW3M4MSk/lwxUjB6kj?=
 =?us-ascii?Q?UKcreRg7GtMXnpk4rj5uQK4ByKF6DR82AYsV/TrDo3JMe9Dr5IHDC/AOXYrE?=
 =?us-ascii?Q?k2XwapN09G8wEfJnc8v5d9nxj+DE5GvvpgO9Z220y5SSYxRdLXMatP9GQl7n?=
 =?us-ascii?Q?1IqOP5/W996M1hMSKPB9ATJnHtqP8484FR0TVSZ7vDhHN/gJrl44om2d1FIT?=
 =?us-ascii?Q?1RnhjhlYW/NqQomU9OepTiDmxnjgjwEt7RNG7S8RbVbRdujRat9CYtkD8c/R?=
 =?us-ascii?Q?lODJ9l5TyZQeqHarFsVDp6umDrWnIJU/w0SN3rWbgt8Cq4LlBh2lNnkqeXrs?=
 =?us-ascii?Q?1x5Dy7A28YZpOc+l0e46W2+2WE/AchjS7jHd26vg34sE1uoUU61tspQEZj/c?=
 =?us-ascii?Q?mC2Z8lzm8h559A18k0y0GDbUMgCn4Qu1gCzo5LHEtu3Bw4bXc+jcRMU6Tg3G?=
 =?us-ascii?Q?keEZuJDB5S+rrWMMpC7b0zEVycGMtyNnJkXpTfAezOCZ7gj7Bq15XS3XWaLy?=
 =?us-ascii?Q?EATlziuIfSD6Q3RWrayToYzp4/1Z+QfmOIeSujIj8BLQ5vNh2/M2kymfD2Qg?=
 =?us-ascii?Q?00apciN0w6zadQQqxOoiCr/s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UHsHSAJny4YV3OCTqPAR8evJP8BRmkxFyG8etC8KToXGit7K/inhzZ4ovx4X?=
 =?us-ascii?Q?hfTNQ0blVIwy0hkxYlN3sl6kQZw1ItWo1dEHJeS8dlQKvQGL5Ak4/hBZ+753?=
 =?us-ascii?Q?DT+rYy6fY/PJUHnIsd9bBwbORHC2xJEcosxFLOKtDTmIyZetnHujOC4swiqu?=
 =?us-ascii?Q?pmtXPi2dSpr4h6QerT8yUWXejdS8B8uhQhMhYEs7dF/mLWBaClhSQMQ8f9KU?=
 =?us-ascii?Q?WROYWF9lN7nt6yriX12R/Kr525I62DdXHjfPdAyd6xkR6pJl59OeOfEwJpiB?=
 =?us-ascii?Q?iXk1fjN4a563DwySRBMijNiqdntocVVuLXE9CEwjvxp23QCTmPdVpvLEe2ET?=
 =?us-ascii?Q?dmQ2MRftq19M9SLMN8BOnuVd46emIvelhzeSnTTRKN0PQPJ1dec3/A2b/qR6?=
 =?us-ascii?Q?virc9gdqbj1xzUK0EvQ8762qhuo6/p+H5+xov6sgAcWFNd7T31iowVfGXctW?=
 =?us-ascii?Q?D34YaJyvn3wx7qNTsjWJj+/RB9pX5X3HJOdzgWttkFcfeMdcjw18PE2/07XM?=
 =?us-ascii?Q?yKbSfaJZ65USCcCfHIzmqVPzCX3BJz2NfK7H6pFQI8sUgq0kK2AyBjPQU3te?=
 =?us-ascii?Q?5Bi5CFE1kjsuM/nijTrMjvcTIf3TlYg8ya9BClqs0dXqlo+MVXtnVbw9d4QI?=
 =?us-ascii?Q?TwmOGyxloXw3rxgJ/0vuHKMtjxTXjdTjNxu4etXHeeyGOtSuxnMmqOcnO3Rz?=
 =?us-ascii?Q?0WBNwiKsMpslCheo6427FsdecckDBbOACXP432Go+EoQxzfavpBdTmg6/MH4?=
 =?us-ascii?Q?thfuxgKDLCZV3Zrnjbpwz922DiPuqL3FuBnsCdOwjfYIx71KoEOzdwknXIF9?=
 =?us-ascii?Q?v9yPS+fiIfSpmUdbCoqY3spUbedLLjNCNm2/QhWCE6M8uLweZpmVyNHuw1r+?=
 =?us-ascii?Q?OjcOHlPkl/F5sDdpBubqNuByO3cvTUmj0l/mVGJd5lv76yPkrcWlkP1cHFjd?=
 =?us-ascii?Q?v4lV5ryBZc5dOCrAvnN85DxmMj3CGrdzKPBTaSmlf1H7vdexBBx8UWz/CXqu?=
 =?us-ascii?Q?fL7HG2JCjgOmGta/pF7AfoT/kKs0WNB+aP1exHwMvsRuoPyLOJrO3ziABjkI?=
 =?us-ascii?Q?aF2smCXFrk34tkJ3PlTJn+0fMLrwaZ7jfWOb4XtnvVzbKgvcJw3PKG9SiKPQ?=
 =?us-ascii?Q?r7Ar5sU+giAiwAcsY0sCcSRdaCIvzHxElwQ2XA22X1wSuWr23RrZNWh2+JX1?=
 =?us-ascii?Q?Ltu9FApXkfq6e9ndgVSJht4DPzV+gj+mVYnMH48a2VXR3F45QmuviHHxCOP6?=
 =?us-ascii?Q?l68/RbGDzQ/6wNDI9bfEG+yhiQgNtJylRLLyME8XunYQGAc7sj9QxKdMcwAY?=
 =?us-ascii?Q?nykX8O5G007X9HyXAMu92/NqnFDllqnm7dS7M0qOdXl2weV2uylEWa1673El?=
 =?us-ascii?Q?45rnZPoS1vKP2f9xIabcvEPpvPec4Q/cFK3qhfuDPrmDJ5lvyiSDgSkjfZqU?=
 =?us-ascii?Q?3UCZX9h2A+uLXda+/s0eHc8ywKZJx/hxO+HKxMguygzQUqAXedwI72EfvgtO?=
 =?us-ascii?Q?yc0lyUj4QAtdaCaotCrR967F8vqzxS0hxFYjSvr707/X5MRRnhtRf51TNKQu?=
 =?us-ascii?Q?Fn635cQwuNPnlPiTpPXdxPfFOqZBYHDTiVNvjhJS/XAleA/PhMUAg3/9QT2F?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ecca83-33c5-44f9-693f-08dc85a75174
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 21:34:45.3337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqdhuirqFX+IGatU8AHJfxqlOntC2jp8nIVQ/1PLAFSbxgFa1doKbOTjnElIySPGzIe+1H1FMYxhjga14BQZkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
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

On Wed, Jun 05, 2024 at 10:19:46PM +0200, Michal Wajdeczko wrote:
> G2H fast-path processing is done today only from the IRQ handler,
> but in upcoming patch we want to use it also from the work.
> Update spin lock to the _irq variant like rest of the code.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c1f258348f5c..17f0e5019bb8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1216,6 +1216,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct)

Can we just avoid calling this function in safe_mode_worker_func? More
on this in my reply to 2nd patch.

Matt 

>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	unsigned long flags;
>  	bool ongoing;
>  	int len;
>  
> @@ -1223,13 +1224,13 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>  	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
>  		return;
>  
> -	spin_lock(&ct->fast_lock);
> +	spin_lock_irqsave(&ct->fast_lock, flags);
>  	do {
>  		len = g2h_read(ct, ct->fast_msg, true);
>  		if (len > 0)
>  			g2h_fast_path(ct, ct->fast_msg, len);
>  	} while (len > 0);
> -	spin_unlock(&ct->fast_lock);
> +	spin_unlock_irqrestore(&ct->fast_lock, flags);
>  
>  	if (ongoing)
>  		xe_pm_runtime_put(xe);
> -- 
> 2.43.0
> 
