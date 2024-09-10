Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E114EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEC810E900;
	Tue, 10 Sep 2024 18:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHjEvA5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBFA10E8C4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725994010; x=1757530010;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M47M3zlL8wMXT64ydT4KRw7maA4qKCvIkURa2w94Bjw=;
 b=OHjEvA5lfs2WzAvSjX9pbaPbJJVk+IHQCmKdOMRRbEyoxAE6veWEz8+c
 hCXOeaVyNRsXU61LCMhP3oar4/bevj48WtdJLpS7r9/hfa8UmY0wxgLoD
 6LSbKbm3w2lrUBU50OHUxu4q+918hj1z7tvZgYKBrSf/uJxAMo9TS5MTg
 lAINEiJHvLh1OvKW2Ic1LsYl0HwsCxXBroXo51Nbw1Y46eeyeGRyPBdXY
 ZvXAg79ajEme3yRakN2YRc0pxjmUOjyRvtqaK09UeCs0TWgRYeIE9ET/d
 hoLXXG+wJ+omyuhvAZYnn12AjTUGCRhA/10quWcpRDBjgTfNIx/01XXhp w==;
X-CSE-ConnectionGUID: UJBPVn83SWua4uVcmGJsrQ==
X-CSE-MsgGUID: YfxpOPA+SNaMKmhI+uDACw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35905282"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="35905282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:46:50 -0700
X-CSE-ConnectionGUID: numyI1u4Q6yP6qu4XFOEOw==
X-CSE-MsgGUID: zcYsIZltR0yc4utRwatUFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67360938"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:46:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:46:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:46:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLpcdL8cQgfCigUtG1VAYXG1lLlJTOFMZc4MTnRNBRtW4Cq0oRFAMSCiaFiUDzxrE5f3zrqDAvLdgMroNGyT2tpAEwwUG5+fQY7EHShDCj4MZPoEWsECO+OZvesneSMT4ynBIrFA47x0CyXx9aPV9zNN+DNWrrvhRFyTONaR525Z9TOMyrHC2+QdDUQjgIPeujB57woVP85uwaPAO/sCs9EWb3iJH/nQUi+H2oH1Evp2IYatl55shdOurGAxcvUCb/a16R/TNqUDxlqvPr1ljFfLjhSJe2F2TGLPcFdqyOBk1ehSb36+EhtO35ejLx0LQ0x32wcZ6TGSDC3F9pCO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STuWQNzBXaCqnswIbAoReN1omGwldPN297xXtQxrc+o=;
 b=KrdmnV8Yub6DWO5vurv6c9tmZUPfneRrleABVrAYZOhDQEFvhhrOKpwS2LjQNMbnAh+laio/simAmhzZIuKGPO+yNUqn21rB8euywG+H4g2elf7GZYTfXf8mCzRcfV0tU0bowI5N4IzPvBdPEjxnM/zSjp9excfFVfMKe810QHQz5pBKIg0bJBONV2ZJtkcnqbk7MClnTqH6COvfOx1MasUQXt9TP1I3p579SVsR6yapppEUwSS09iqpHoSvIwldPahneVuJuamxo2o2E9i7BgqUZ9kMkv58JJTmTA89Mkqf5ldO9ZO6EXk1V+7za67nxwPk9G+AfDkyLW1DX1+SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:46:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:46:46 +0000
Date: Tue, 10 Sep 2024 14:46:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 42/43] drm/xe/ccs_mode: Convert register access to use
 xe_mmio
Message-ID: <ZuCUEv44gZDDpKaW@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-87-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-87-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0209.namprd04.prod.outlook.com
 (2603:10b6:303:86::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: e505b3cc-f342-4671-eec4-08dcd1c8ebe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T1kqhpYmboLOFxchhZH4LZUczAT79tBu9SHW/tOAw3zp0grEpzfMcH9uJshS?=
 =?us-ascii?Q?zOqmaQk8exUQssUmLOA+UkeCJJI543N6dnjJ8IxeUt0w5awB93+S1iefDBVm?=
 =?us-ascii?Q?H4T38qbzPKuNP3x5gbISbuudLeEM9CUMDILmbm6U5hUNxzUgvMeG6EzcCp0S?=
 =?us-ascii?Q?7G6Y7BTxuENsZRJSey+urjdV1nnv3seV+PD9sM0iVRJuMsNcKYcdxwwo+AEr?=
 =?us-ascii?Q?7PhEss+gV8BXOm/2vpE3kTypNQH/m8OvVa+qXwFHfJzOYUUJ3OH8AR98qpSg?=
 =?us-ascii?Q?jWkUiuxYFdJGEmDEyg/nXrLGPUikQENoIFxcsOwnLqFP+4Cm+DwIfL8ZhoUZ?=
 =?us-ascii?Q?gtjYz685npEKCr4/Oc9yt7Dhv1JyLpi2HzvX6wT9C5ani5gR85uts6qsdYv8?=
 =?us-ascii?Q?9rl66zNtoKolzBWbN1580v6zc8k3GeNg04lOpPgkAlwTaRpeK5twOUAT9PWs?=
 =?us-ascii?Q?rIlbbzSuM1fN4ZsEP5SQwFCSvzuwkkXu0fBFk5IOKDsyoG0YnBIwnlfUL0Z9?=
 =?us-ascii?Q?NAPYuwnkFFmzRspNm/Fcm8wXfivyqmsUSNYn9ENiqEZloBfoPBC3DV9E/vYH?=
 =?us-ascii?Q?4DXSaXu5JCvDe9ryDrD2jmpKHHkyriZC2uENQwNx9xZVySD/pv0j5Smi8aCu?=
 =?us-ascii?Q?XwnFIemFDcRmiyoata+SoR81+bnCeygqGNY7xT2GyBr9oyj8Ig2sPobhnpCF?=
 =?us-ascii?Q?2OQEKq/G9T/owMD8zSgIc88i7DloKQYvOLyHTlJ/e+lFQzrbehYS6T9emnuX?=
 =?us-ascii?Q?L/uaP28DeyCAranyWAROZ06z0LwPsCWyP78ClKEgoL2D9UzqRlfyVJ9vuk1S?=
 =?us-ascii?Q?ztIyQW5UFIt2BcXNHVcGQS2ottE2S8SRRFOEXCdw44N6Fom4Gl3jjYGH2kak?=
 =?us-ascii?Q?i4Hp3b0cMgcjuWmuMR7wLf8UFdNaOXDFNAP1QU8obiT372Kuv7TS7Bi/3nBT?=
 =?us-ascii?Q?nPRnr1YfRK60fF43lhJ/WJpMv+5Hq2ngKbeMSRphlTwduydXlD3B/rElyYXf?=
 =?us-ascii?Q?hZT/MQ55jcJo0Wk5Lm0dXYGpT77MswrrrWtaOLs5ovocz1vpcJhR+tg1NYyS?=
 =?us-ascii?Q?gYf2XOp9wVg0XHw4uAYOORBLG4++2AS91QmuLikqbxIR4zc7JCbMzBebafsb?=
 =?us-ascii?Q?ToQ20ZsfMlhSuMyUAg9TgUd3baq/v4pEJGOOWLZn8Rh2/vmRLLOmOT1RmCak?=
 =?us-ascii?Q?VzGPuuKgfBKVm2+ZR7+zHK3QxR+EUAXFbURDQGk3fpo/xJ2bO/jEQCMa1/lM?=
 =?us-ascii?Q?NnT8pnP16BsmfU2wPJgDqJ+2rPGvV9v1gixUmb0XhTUugGlFDzqLixsgdkNu?=
 =?us-ascii?Q?wf9s6RJzDDOm1yTh3A+M44JZdVH7Bq+2PgK3RxoST1ROwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9aFDteSGvSyKtK/nToTn7KVvVESGaGhtpoA3RIoTK/JvfJCwT0cl9ycO2+of?=
 =?us-ascii?Q?EAWph3lJNTYXzAZbyQIf0aihM7SP8TCAK7ZRuRbQ/hrbtnsbga1wUHhb+skZ?=
 =?us-ascii?Q?HklI3JbJOa29t21lQAqXbb9mH0fMSSXfYPJVdvW8CirQwO+6WTvVt5JxAXbe?=
 =?us-ascii?Q?WVfUwvZxBbH71+cFQ7z7Vq8qGyTmiyVUXIkTlQL9NLL8qYLCC18OnZAFM0cr?=
 =?us-ascii?Q?91EGPJ8mu514GoEwgl17GCiIBmdvpoTasysq8KODfnGOAEJY/+urgDptOT0+?=
 =?us-ascii?Q?4UD9hTRvCSWOSiDD2ryz02XPvftyx/bmCO/2IVvL9kf8TLVY15Welql8QhIC?=
 =?us-ascii?Q?RXnMhvKFQHv/c3mCBaPEKkd9Edvop2znNP3fms3cyAWdgG/d6iNckf7IV9u5?=
 =?us-ascii?Q?/VekK90ifQzu12Xp97MuPMGpCBFk7h96CDaMjQ5PjvZTkxXW34zjDyuR8vhM?=
 =?us-ascii?Q?q/NbU6+GUZJ5za1a/1PRnQeNueiDRannO9yfH8nm7G44LNBsmaQT8Ng/QaEK?=
 =?us-ascii?Q?Pd+AStGIo8DJCKrM1Qr7/hProDqemNfiJ1gDFQQPWkYkSuCXSva6Oy13iOko?=
 =?us-ascii?Q?GH5yXPcbYotkx9S8CI8d2WWR3+d4Qv+1fTMIhzbHUwEGq0R3HPCpxphweP1V?=
 =?us-ascii?Q?MDTMWmP7WbMz/+2vg/a6dQ5fM2l19Am31oLqYBFLU9cJ3N4CrvdyO75FVyu+?=
 =?us-ascii?Q?xgVgfpO5Sk2rr2gLHzJUHNA/4Z1B6wH7CQlatI+AJ9Ic/j2LTLSF6mZnbqlV?=
 =?us-ascii?Q?AHcFeANoMDYLCVr2d0duJS0+it6kAr0Ao0w61QWzNsfDnZUxXbPFdvvaWkd/?=
 =?us-ascii?Q?LTp+Tzqcudjv9pW7Iq2ewPlap7v1nxlVokM5NSuvbew537IewEmnyhojLTfR?=
 =?us-ascii?Q?sc0CNkioB0utVhd2trSHTrZTY19hrAVHCDnpwvbwPMtL7yV7/5fAvgP5qJRa?=
 =?us-ascii?Q?qu56wZ6/A2WspvZ556YJmHcWGFTjcVbHc7zhI449wi0QdhZW4nePMyMLEm6H?=
 =?us-ascii?Q?Hc606Ftw9w044TA8ZL1dk2l86PiVkgYcNXbIP6XKhkNAVJ0vTHX8WSUkVgnR?=
 =?us-ascii?Q?zpUfrnYqOCJ9gbLpyRa7B7tkFKu5S2aK4mR99iQ4skqQv3v0fpMpVt7nbcHl?=
 =?us-ascii?Q?awHiXS+K+AtofV94EVE44D+2Hmh/6gPiIZxPnBvZxgO65CvUukS3jQeoMTIL?=
 =?us-ascii?Q?mGYuKsloUkRmgwc8UDI3TKpZ9e61rEbwIQG3L5aSLgj2OXLJYVXa4TUO5kzL?=
 =?us-ascii?Q?ACGNOPFj7ULIZaLRpyj0tGp1zUJNkVzq4B1GVqxdSlhDPbydlcIElK6LFhP1?=
 =?us-ascii?Q?Iy9nMqSKmJ26AFr7h1374vPjAMlOUUUJGynLHwdrnS/0iWbl2aWoAWPqpIgw?=
 =?us-ascii?Q?vSGEbgZa2f+KL820KU/TM4kkZ3N+kXNtemljQW50rUO975NkG+9NkvLWbKke?=
 =?us-ascii?Q?nIpRd3+7u929bE7SEEoZr6d75pZKK6Y33bCqPj+OPa+m/H6amGWsglAxThol?=
 =?us-ascii?Q?POrOuNWSPEHN4SdgvgzPSJnmx+9oB1jzpFjdBaAznkdYFYXpPhvo4mIeeW3c?=
 =?us-ascii?Q?+ktSU19NfRSPn+Fs7Xmv8xMjRZZgglYiGdcrCWot2JV+C59+mL004A+G35gT?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e505b3cc-f342-4671-eec4-08dcd1c8ebe3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:46:46.3916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN8rSSjB9Ma7ytQTrxqNl17eOPuk1Lu9eNrKfUqAmvYmz/Q8lgsV7lvaS7VqvisGoeJeQXFbKEpDZtwn6aIdNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
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

On Fri, Sep 06, 2024 at 05:08:31PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index d2e4dc3aaf61..9360ac4de489 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -68,7 +68,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  		}
>  	}
>  
> -	xe_mmio_write32(gt, CCS_MODE, mode);
> +	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>  
>  	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>  		  mode, config, num_engines, num_slices);
> -- 
> 2.45.2
> 
