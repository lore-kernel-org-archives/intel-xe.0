Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A44C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 10:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704310E337;
	Wed, 16 Aug 2023 10:35:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E8F10E327
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692182154; x=1723718154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aKlLoT5RpUwWoK3Vt7XRZ5yIAyLnclHh0C0zyLD3Zzs=;
 b=myi83NF6+r8tSpWpT4/UbHPgC6HPgmD+HnbT0arlX9ASiJeM/OGya2/2
 z2iR+IOyPaioDArkaHmiERGeet3dQs9jbm5jRdkLeBVCy2XTWcqqlGg1S
 Q3UyeSuflOqbLhC5K8/BlTUXeWtwMC7bRq/2/mL/cr3s/ae5f4x7kNg0k
 /JX++VfOA4uAPjASJrn1sdgMJBxuWFFUirjyhwlAUg6qDMmHEbA3+W7hq
 XvCfGG+mv53ifQ8CukWcwvfSDmdRoVGmL2wuVbagKPDCm74ARkkJ47nIb
 J57pu9n5LCvg3HI0jkxcQ02olOaLaTLkP41NFKFuInsg4A3RYapEaJAKJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436395458"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="436395458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 03:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799525273"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="799525273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2023 03:35:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 03:35:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 03:35:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 03:35:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePnKuLC06kvBu/usBO2+pf/wE8E1V1JsIEhJEgyFF6YWF9xjKbykU/xu+Fplr4PZNr4MJQCkBruKTaSjq3gRdhoAV1tQoAKC2/RXwX9a3cZ3nmV/BfWhvgl69m5pt0oVO1zt+3KWdkxLR10GrdcR615+ID0HD/GHY/n6Ch8r7SwsYdS3R3V93v5isbX1MLu7alogj0mJqHfOg/xoGrbzfy5jZ2o46X7vkKbQxUaA0WJeW/GuqtU5PATg8hFPuv2gvt3j+5JNv5xEg0V2hv+40NxkZ1+pjVH4ayQBKEN8aK1jq7HI5/Zj3VXqs31gYklVmoPwiP8jrySxreLR9ieXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04JuD9xcDB6A2puO1/VbWI0/R52vVvN5Vv5UrOgF8tw=;
 b=Tc6ZQ0+ZlrRmtn9eFcMZebo9qIRqRRljQfYcdgnhW4KsWTqbgk0jSQ5CPrYdvol0+leIEmB7MIR05yZgjVsIDFGxXpJ3Bc/NM1ZXevsQEnr4bPRr6IlI7fhvsR3IakJMjjEHRoXrb6a5niMCoSt9ocZLJyUb8+WngKEZobcaLdjGunnaHm0qPGdYEZTCnzDpvXday1YYiUcwv+47JLhYFiEm6CmlrOJTDGZpJSQAXRDdKYb+/YvT/anXSN1DAl98ArdgqwIMufgQdL/0VegHjY2+GZ0kM446KLCaWSAWJCuM7oNrRz04+5+aO8vwp9dIg/Cw47cs2xXz2BZKIiOtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 10:35:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 10:35:50 +0000
Message-ID: <da8baf4e-08e2-449a-9b74-168f8bc80cf0@intel.com>
Date: Wed, 16 Aug 2023 16:05:39 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
 <20230814160217.10707-4-niranjana.vishwanathapura@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230814160217.10707-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: c00ff25e-6633-4142-4b7f-08db9e448edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6JhnqU/4MQGfTLrBhgKwmbuA7+O1wi7ihcwrP+lPHvl7ck7sIs7hJTD4lsUkSWGrIjk2nLo8wwGDaPU7I28oAeF/Wrg22ZNDHp4O1AT1uis1ydVoc+nZnFatqIDxPX01w+udWQ1hKWOIDKGRZRRzKP+DqHhiL2Phoyr4a2XAYkfu42oEr/B4dZnCfRUGyVrvHfpPc4ip0nr3M814FHH45NO9OMM/51Zd5MnfmKZKrGJfyhxfwb4cRdcccdxJ4+DR3k+3RYSkUi5rUcfz7RrEvJzlM82kOoB/UsTXE1pf96/M+NJc61D7TyH/i10pl4c6tPHpvIVCBiz0QR9/c/E8YpBCGOGeEh23AhR4aE+cz6YudAdlljdlNhD9lWukSRIBZ/DtaOZi4Jhx7hZk62oRtj9rFGcG01vnClVinffHCEaoAM553nmPMzUMXtcHG/W6sbulgCNPzPN5rPmLt61LOD/YKLGzf/F9OYHdaZYfwOP8OAeuhHrGVwWwTRpVueTtcmVviTKbh+uqb9KwepXVJhr/JsOEITgx34DopwKkECByLkPtkg9SexapPp1nST/AHBFOlmDhoK5g7SDuVh49mR6HL4bvuIjsd26UxBUNUJCfslsnafGac9n+l7x7HSO5Bq/IaGRbtmUceEA6RfEwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(31696002)(6506007)(36756003)(6486002)(2616005)(6666004)(6512007)(53546011)(26005)(5660300002)(41300700001)(316002)(66946007)(66556008)(66476007)(31686004)(8676002)(8936002)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpEYy9qcXNLb3VUT0FrR3F2RVdCbzdnMDhpT1czZ0N2RHBhYk15YTlTSWla?=
 =?utf-8?B?R20vRzhtaUcrOGVQRWU5a1V2c1RLbnM5UHljK1JjdDhjenN3cXkzUmVFa1Q4?=
 =?utf-8?B?eGVkSG5pM05lTStNZ1VrUHhLUS9IR3RlOXJ5NEQxdnZWcjBTSHloSjZLS0dq?=
 =?utf-8?B?dW5lMDhPUnJ4Mlg2RE96Q1RvaVJncXBkclRqRTlqMmVOQjBIK08wZ0ZlekxN?=
 =?utf-8?B?aSs0R1MzbTAzZ08yU1V5ZFl5WHZYRXhkUFRYV2tvK2xvWndjZUNidWdsbnZE?=
 =?utf-8?B?VUE5NTJqaVJhKzRhcjVCQ1h1VFN4Sm5JaXFoZVhDMWdxZlA3VkdxakYzYlRO?=
 =?utf-8?B?RFYvTXNMZ2RWZ3B4U1Z3Z3JkTDVwT1FBWWNRZ0NFaWhOMG5qd2xtRlo2Nytv?=
 =?utf-8?B?T2JJVk85RmlKODJMellxSmNpWXVpYmhVbTVTd1ozMjRUY0pGaW91elF4S3VC?=
 =?utf-8?B?QjNCcEZjeW02dVdBWmp2TzRqNG5pRU9ZMURkUSt5bFlFNktjU0JzTWJiRG0w?=
 =?utf-8?B?UTM2Rm9QM1dQVGV5SEVmZ0JNN0swcURxV2tEcHZSRkFtbmVRRndSbExLMWd3?=
 =?utf-8?B?eXYyVHJlWmhuRU9PdVp4dHljLy9oYVNKUEpQUVM2OGtjY0p6Y0xaN1R1TlZ0?=
 =?utf-8?B?a2x2cHE4YTNQU1hqeHovMHdxbjJNNjRGRUJhYzNTenlpTldsaGtzUERsWjBK?=
 =?utf-8?B?dnU1SWNIZ0UzYmREdUxCcjVSL1dhbXhMRmpzRk1weVZhRlU5c2FkK0JJN3la?=
 =?utf-8?B?MGQ0WWJ4cWhSL2tuUGlydG9nWFFBZHlUUkdyUjFBNnRmbGNNRzJsYVUyQUNB?=
 =?utf-8?B?K3oxemJNTDJUQWZ1OGxTaVpTczVjd2VvZnIvQlBweERubmhQK0sxMjVmUnM0?=
 =?utf-8?B?Rjd6cytsaGVsSG1IV2xwL0JsZG5UMEFsUER1QlJFTk5tdEtFU1E4bTdTeDJy?=
 =?utf-8?B?NSttYnZJM0FXRzVWUGpER3Q3d2sxQTZCVGN6RTJUSEgwM2JlT3hUNS9FN0RM?=
 =?utf-8?B?Z3Z6REIxZlcwQS82a3lhQnlvVVptdXo1TG40WVcxUUJiQU1hSFZiOXlHbE1z?=
 =?utf-8?B?ZHJrZEFqVG9xM1BhTTRuMWwvOU9KV1l1YU1kTFJoSG81N1VTNkV2bVM1Szgx?=
 =?utf-8?B?akg3K2xjY2J5TUFITGpybnluMVpuY2lPdEJHTXVRVmlGSS9OMEd1Tk44K1dE?=
 =?utf-8?B?WHNZYzNQYVBKYTQvNVdNYWNlT0RYVGZCL3M1SlIvQ1dSR3ZuY0dhQzNDdHov?=
 =?utf-8?B?Nzh4QitmUFk3Zk5NbElLc2ZDU1pxUGYzZTVKOE1TZnVtUlNFdEFoQnVDVzFh?=
 =?utf-8?B?aUVwaHN5YTRCN3ZhUnlaTzRTbE9nQzdRMW51VmJtc0pOM2lkUk1GMFdnQTND?=
 =?utf-8?B?anFNUktQSlNnNFVPSEFjN0dOUkVhSHhjWnpiam43dEJ6Ti9Rc0xKUTUyTDdj?=
 =?utf-8?B?dEVqd3FDUlN2dnNzUjJZSGl1eFk2ZGtMeUppV0d0SHgyRXQ2Y1lYUUpsSUpQ?=
 =?utf-8?B?ak0rZlg4Qm1uRklsNFVBSUsvOHhxeEo2MElpUjM1bGJ5ekg3YmFGUWR4UmdK?=
 =?utf-8?B?QkhqNGsxS3g4YlZNaEJPL0VCcE1tUlkrb3Q1cStJcTdoQmkybzFWdVBxTzZm?=
 =?utf-8?B?R0w3VTl3UDl2NjRqU1lqS3cvcEZXK2ZTb2MzcUVIUStLY3k1TlUveS9xRktv?=
 =?utf-8?B?QjIrOFR5cElwZVFJR3o0WUptdm9zSGpaQ0JBWUgrSncrdnBFTm1qdGM4eHB6?=
 =?utf-8?B?RUlQdHBRZG9ZcTVLK3d4UkVnSC8xdFZIajFxYm1HTnQ5bkt4U2V3cmhtNmhs?=
 =?utf-8?B?cmJWNHJUUDQyME1ONU9rOFozeFB6ZXBYYXQrOHc3UmI5TG1aOWNHS2JGcm5m?=
 =?utf-8?B?YmNtOCtuTk5GNVVGZ2lzY2kyZy9ZOHNZZExGQTBtMTRRTHZyL2VtbVU1eUFy?=
 =?utf-8?B?ZElMdUpVYUtQVHM5SS9KQTE1UnZ3b2UraGpyL21peXMvSnphSGRERXpUUUt2?=
 =?utf-8?B?Q2cvNFZRd3JPbDhyakVMa3dFby9rNmxoLzJNY2NlN25XTGVkRUFYc3Bxd3Vy?=
 =?utf-8?B?S2pNM1Y1ck9CY3BKQmExUkc3ak56dE9KanFMQnViNmdsanhYWis3MVRXang0?=
 =?utf-8?B?cW9RY1Z2RCtTOEJGdmNJYkRpY0kwZWxSWEFrVFZHRkxWdndLV0FIM0NmZDFq?=
 =?utf-8?Q?wgD+a/9llJRjjk756Og5OjI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c00ff25e-6633-4142-4b7f-08db9e448edc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 10:35:49.9133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hwib+ws6iTpOzzRup98fUfQyozMnTaCHm9sWjRdFsYf8cY5rpsElukrMtshY81q0R1Repyz1cVUCh5JWccx2h3HYHq2JKHtYKh4S3rGfT8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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

Hi Niranjana,

On 14-08-2023 21:32, Niranjana Vishwanathapura wrote:
> Allow preemption timeout for compute engines to be specified as a
> config option. The purpose is actually to give compute tasks longer
> time to reach a pre-emption point after a pre-emption request has been
> issued. This is necessary because Gen12 does not support mid-thread
> pre-emption and compute tasks can have long running threads.

Description mentions setting longer preemption time for compute engine. 
Whereas

code changes are doing it for RCS and CCS classes  both. Might be better 
to modify it.

>
> v2: Change unit to microseconds (Tejas)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
>   drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index a3655ee6978e..dd7f155371fa 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
>   	  an arbitration point and yield to HW before the timer expires, the
>   	  HW will be reset to allow the more important context to execute.
>   
> +	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> +	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
> +config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> +	int "Preempt timeout for compute engines (us, jiffy granularity)"
> +	default 7500000 # microseconds
> +	help
> +	  How long to wait (in microseconds) for a preemption event to occur
> +	  when submitting a new context to a compute capable engine. If the
> +	  current context does not hit an arbitration point and yield to HW
> +	  before the timer expires, the HW will be reset to allow the more
> +	  important context to execute.
> +
>   	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>   	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>   config DRM_XE_PREEMPT_TIMEOUT_MAX
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8e5153cada31..e9ce34faa2da 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>   
>   static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
>   {
> -	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> +	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
> +	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
> +	else
> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>   }
>   
>   static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> @@ -570,6 +574,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>   
>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>   
>   	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>   		hw_engine_init_early(gt, &gt->hw_engines[i], i);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..cee0b40a62a2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -35,6 +35,11 @@ struct drm_printer;
>   #else
>   #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
>   #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT

In case of config being disabled, why not have longer preemption timeout 
for ccs and rcs engines ?

BR

Himal GHimiray

> +#endif
>   #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>   #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>   #else
