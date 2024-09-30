Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D14CE835C
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 15:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2C110E11B;
	Mon, 30 Sep 2024 15:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYAyFZQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D5010E11B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727709715; x=1759245715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aX41LUJdEJpysFpvRTw6tH8NYQM2ijrHTNrl4ia+tRk=;
 b=KYAyFZQfTpUgC0NT/nZKNhxeOBEx28XfmpubV4Ydtp8JBExVI02eYvWy
 DqWQF/+U622XMRzAmMPpwyBx1eepJEpP3ZmLtnRYmHi605+GTaarWWQWi
 b6jJ8S9C4W8u18xNH14yIEd/LlawWhRWoCvmstsY8TqsqpIQHzU83lag7
 5k83FtMXDUR6Lc4HCmodLTkzhrWqBd8zpMYQLUceo6/ppdt+wkUjeH+27
 g41SLBDIisD+u1QIbTBWkA1w+1Il25+LLPO2faWiFzEzCF6mhfWkppfRY
 uNlhS+z2+zURoMzcewFYEGGxny5ndaA0Qb4WspigD23Ue6RaroEWYZJo9 A==;
X-CSE-ConnectionGUID: Li9f0bGoQLOsmV1eQEi4Mw==
X-CSE-MsgGUID: 28IoeNrUTbSjz/AssNvVSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30601716"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="30601716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:21:45 -0700
X-CSE-ConnectionGUID: nNYihfQbTFuP7o8BlM8JYQ==
X-CSE-MsgGUID: Pk1FYxh2SuyljEQ3ixDTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78087367"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 08:21:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:21:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:21:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 08:21:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 08:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cr9C0q50bwYH8fibfg8pOoq3iFpLGu+uqXHQZxst1dnicRz9VFBWbcWl1ocqRI+YBrs359XAkkd6xhryFzoXKifBCiohalBuP3vfWtIt3DLK7J4womzNhjOh2qthL0CVEzY7qFCu54huJNUkIsSIB/3tGlrR7/RYGX/mOwLLkyxBLYCi8O6kswe/0TKwGPVKCO/19D5ZSAO2sKWGFAJe/MHeSZ/Qh16hU2o1AdlYVzOaGbKXV/bth8Tw2w9dLJXDYgwPG6foH152bOorbKO9My9s/Niij9StRtCBjkybEn8yVHBxzRZdwmvcSUqe74/U5WwbkWgsIVvcVGnxAcg4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQmn/oOGQZvqbUANvEt16xvkjT23n7S6Zfv7+4tpbho=;
 b=BpXPEZRYlPIt5IQ3MyKLZSx4k45UpQPB16r6JWeOG0h/yVAb3ThHY5JJCjvVEa+jMHsVGTB3kxoud9/tRJO4iJdjvhMis6MWUMDEgqHoAQzmquBnm2Ww1tkfR9uMxGGYzo3HrN6607BYn/khlKJfW1LSckFzNAJsnZTmWYSf7BXem21aqRmcfn34U0eHW7ix/QIitrYGp55PJYd2YCXtZW/dXUH2WxaEL/3YLRz54SvBbG3gELoFi2Dt5XqDb26+ChrawbhYsqMLcevbbyexycYPJwt06XCfy9EsjqHyLTmhP5z5i3/pgD0h8vR4qnebc4krC0ziJwp5wWYXcaPYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 15:21:39 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 15:21:39 +0000
Date: Mon, 30 Sep 2024 11:21:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Message-ID: <ZvrCANmHJIw59v8b@intel.com>
References: <20240930071329.1630583-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930071329.1630583-1-jouni.hogander@intel.com>
X-ClientProxiedBy: MW3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:303:2b::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c17277b-96cc-45a4-d8e2-08dce1639484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ibwi8xt+VBUxgw98vq3moCkdQAN1VnlAllJ8SmQWzxv9Y4X2GZHWdSPe0j?=
 =?iso-8859-1?Q?NmCNEChxYbJHX64WClj/9wF5bW1wt/GH2ZHvjL75qMiuk3UyN3fRwTUBPd?=
 =?iso-8859-1?Q?xxyYwC9f8OFA0TmlJ6+JAvcrJ7OpHnkMEFbj1sLhCKkx2daqsbgOmpz/9l?=
 =?iso-8859-1?Q?G3bKJrAh47lr8VNnbOxt5qGGl8HYtMRsxhemplUx6+QX7sUpHQpMVqVR5M?=
 =?iso-8859-1?Q?XcKz7JrtVSLkp58rbyaBCTKcj36rmgwCokHgahgavvNmPe+uv4oirvoVUj?=
 =?iso-8859-1?Q?K1OpMYXB7v604wxZU+JYVM1HLvKpP6mR3i7JK+/cTgFD1PzRA2vsPocF+z?=
 =?iso-8859-1?Q?x/c5Jg9NDdBxWt9fabFondpt4D650hYy+NNCZ7Snvn6wJ/aFjGG18wfW40?=
 =?iso-8859-1?Q?5p85RALZehA1mf0lz41M1a5toVsv/7vyZyqms2O8Ws3DcdwhEpQH7FW5mO?=
 =?iso-8859-1?Q?07oO01He4K5uZ1kEJqzkWl9z9RoNGIO8GiQk70twKWFVlUk9pEKbHjx2AI?=
 =?iso-8859-1?Q?jFqPLqnx/oTpFaXqxo5mDSofwfhyzlrDztI7Y0X8at42y3JrlEXXKwHfhS?=
 =?iso-8859-1?Q?k+tKBBwyUQHZJGM3weWz1pXu1AI3ib7+mVTFYRRKu9qemeye6udanAI+WV?=
 =?iso-8859-1?Q?0J6YbluPrxD6tIRggqGpCatNJT5OnhRLHl3cNJbKL6zMo5mGBElqRpcl+w?=
 =?iso-8859-1?Q?HqpkTRWW6Kj+zskrtO2Wx/Z2TYc5J7BvqtrlSiE3g64GokjAxKHfqDt5tO?=
 =?iso-8859-1?Q?shJlAhi51kM4zQsGHzbUdswPAROGqA9EkOybemk8d2M7uepJro+s3lIz3p?=
 =?iso-8859-1?Q?8hM2+5uvKrNGGRWjFZ6ccXGmDVWQ4kkXubcl/0oTNuXoPRL44DVngutv5n?=
 =?iso-8859-1?Q?FlbQgdkfBY24etL+awj3XmlfBFcGWNVqjUKonrIdM/6cjaMzCd56q6GaRA?=
 =?iso-8859-1?Q?+EbjPvSKN5Im6E+By2eHfiVwRlfW5EM1A0PhMdgy0mkXQJ3wLTjl86WSed?=
 =?iso-8859-1?Q?Eq8BRm8IdkP754HfQTK0EZsSR+P5NcEcZ1r4w0lp97aYhWG4IocWnHV4vE?=
 =?iso-8859-1?Q?eXa9xfQnpekVc2TPT/AvYqdEIyQiXZfNsA7uKT7PZFFr4qqVxluZ2Wz/Ou?=
 =?iso-8859-1?Q?xsm99qW1FWHjRB+LeCp1DeMfhPtCeYZ8cuT5alfdAckGXD7jVRnwlOme+E?=
 =?iso-8859-1?Q?irhgse6haWtDFNy829msnhJzv2LQmMijrWkjnuXV5lncV660y9ANah1n04?=
 =?iso-8859-1?Q?D9EsyZ02pzewOgGTaQCKyIPEYoongTIxtynj8xaYLWcLC8evurSJiKXeh0?=
 =?iso-8859-1?Q?x/ZZrGQegDJryQ0KWYT1bs2EQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k5Yht9/fPyPnme7ANL4gVi0zcukWfv85S+no3rOBORLleNzvv0bK0WqBSg?=
 =?iso-8859-1?Q?iNAbHJxozWkUJdzNzqx82J/PpUDfPmcui8pPdV8amqU61L3IhvkNIcL3Kt?=
 =?iso-8859-1?Q?39HOaW9/abCSEhEcTDN+OieEmzhsNbqcJ1zF6vWtZVMRUvFFS7OWhSSK+F?=
 =?iso-8859-1?Q?QOflfABfuffc9Joyh4c1mQkzhCazmV5fsHoq8SMqp1AH98PQ7DW3i48Qij?=
 =?iso-8859-1?Q?DemgJ26PM/kt1LyvXGy9QdlwyJuwhul4NJEr7crK7XtieY9TsqXwN1/3iT?=
 =?iso-8859-1?Q?6UyYpKeIY+0Q3N9pYOH7MY7eOzJ2c+lV4O/tO4ybTDYmUHvTaMmudJQDP4?=
 =?iso-8859-1?Q?4m3xGVM5zyQoeTDhV/8T+QnY21ThVwBmwtVFVg9/WZIVCaUnH3VDf9gXA7?=
 =?iso-8859-1?Q?ycmnsqNoxvZVSLYRvQxFQilSgNH+X4gOx98B/QThw4kf0fLheshqTf7vqG?=
 =?iso-8859-1?Q?v7dluTo4VZV+a4MsOssS0vahwSvjJBrG2Yke9WBHxMW4HfFvPQXBcgW/xy?=
 =?iso-8859-1?Q?lMLGCEughRstg0SoMd/rRxwlKTYLU3m4jH6SfJIwIFU3hwhF79z7bGLTJD?=
 =?iso-8859-1?Q?K4EnRGffq9Mu62qMEnFpGtBM68nYJMJB1OEeCsscI+bes1LTrL4bU1oe1R?=
 =?iso-8859-1?Q?GrxUyuMDJaFL7zI5TEUCzTkLmbybDMbpC3vsUqiy1vg0YCmOoBhJScYGdd?=
 =?iso-8859-1?Q?ejAn6ulPYjS3uGarQh6Yk9WEQ9jDr7ikvLWWHAeVlCKLyeEFCR8MyBUNhj?=
 =?iso-8859-1?Q?uX3NXuqfx+mz51QjbCNyM+17U6A+nGB2vlipJlyrcftKySvFD5ldNWrPHh?=
 =?iso-8859-1?Q?FIFuClEB7zENjFXSdtPtkCBECGfv265zlCcu/gQAnORgFQz8RNyEjmR83H?=
 =?iso-8859-1?Q?aUWi3ik/oNkZ5tEF0d8OA+2aY7Lhh0NzumZsOGKLkWzqhHREuIkM70vWsA?=
 =?iso-8859-1?Q?8CNu+PMuiHOkZAHjoAYq7i1b1M8uLP7n8qU56ASYH0iMUwAyV4PobAa5D0?=
 =?iso-8859-1?Q?UZZfRYgKAUCgzzZRsIPOg/TU4STbBMTKu8kjYppwlP+Inya5RuujTsoWWl?=
 =?iso-8859-1?Q?SkMluNSXi2BOT9EJKcNlrWAFHJt66fQCibg/2Arxq8s0Gyt3+xGvrb53F+?=
 =?iso-8859-1?Q?g3maTlHxmc3MDN5mx9fI1FNCLsLYlTAPcnqa8UiO8KanNh0wM38ogPIUVU?=
 =?iso-8859-1?Q?0zQC5fFJeapsN7qrzKdM+GlMqUHgIjVPAC5WADhXFS9ws/8vMHpOa9Uzu7?=
 =?iso-8859-1?Q?WIIVyMGhV8xWqMYaGLKyrMsbqcn+VCGSf268A8D+u8lNSEFYbZwR2vlyEG?=
 =?iso-8859-1?Q?itCVyLthUrAiIpd5KBfE6xss21wxJuy5ow9QKnyoZH8ulwXoeAuMoONjMG?=
 =?iso-8859-1?Q?z32ZdvhmPV84bdTzq+EzSpllp9j2SmoGZDgLQQGcfdGKvchu1qZJ/ftsKf?=
 =?iso-8859-1?Q?+osNKMeskzckRQL/fYgLHaGE+Ah3WcvkLVHFp68/buBGnhuTFi24K/HCIa?=
 =?iso-8859-1?Q?K4RzyZdn4WQ9R+yWBB6ae74qVJepCUMz4af1R7BurVl0Hg6h/lk7wJO740?=
 =?iso-8859-1?Q?dYxHM7SUTiZQkH/Oozj4iZntK8LvnkCqTEkd4Cx265Pd+jUWtUBKl5eTUJ?=
 =?iso-8859-1?Q?xZPjcX63KnkOkSDZtALmzrcN/dV2RZKRwnzKcLRBbDozo4ciPD/j+Zow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c17277b-96cc-45a4-d8e2-08dce1639484
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 15:21:39.2810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhVJFMDo5GQRtbUsRDfKNZfI3Mo/2JSqOyl93rayfqQR1HkyOj6kjAtX/j32Ay+J1Dts/ORs6NQ24/cc/GGDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

On Mon, Sep 30, 2024 at 10:13:29AM +0300, Jouni Högander wrote:
> This reverts commit c2579a217799ba577fa39a2a12643a277334e691.
> 
> Reverting this commit as it is suspected being culprit on regression.

Any link to a gitlab issue or any information about the regression itself?

> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   3 -
>  drivers/gpu/drm/i915/display/intel_psr.c      | 119 +-----------------
>  2 files changed, 1 insertion(+), 121 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 7ff97e5b83dd5..f60d66f4b980a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1576,9 +1576,6 @@ struct intel_psr {
>  #define I915_PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
>  
>  	u32 debug;
> -	bool is_dpkgc_configured;
> -	bool is_dc5_entry_possible;
> -	bool is_wa_delayed_vblank_limit;
>  	bool sink_support;
>  	bool source_support;
>  	bool enabled;
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 39aa46de15e43..e3357f3b5c705 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -26,7 +26,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_debugfs.h>
> -#include <drm/drm_vblank.h>
>  
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> @@ -897,89 +896,6 @@ static u8 psr_compute_idle_frames(struct intel_dp *intel_dp)
>  	return idle_frames;
>  }
>  
> -static bool
> -intel_psr_check_wa_delayed_vblank(const struct drm_display_mode *adjusted_mode)
> -{
> -	return (adjusted_mode->crtc_vblank_start - adjusted_mode->crtc_vdisplay) >= 6;
> -}
> -
> -/*
> - * PKG_C_LATENCY is configured only when DISPLAY_VER >= 20 and
> - * VRR is not enabled
> - */
> -static bool intel_psr_is_dpkgc_configured(struct intel_display *display,
> -					  struct intel_atomic_state *state)
> -{
> -	struct intel_crtc *intel_crtc;
> -	struct intel_crtc_state *crtc_state;
> -	int i;
> -
> -	if (DISPLAY_VER(display) < 20)
> -		return false;
> -
> -	for_each_new_intel_crtc_in_state(state, intel_crtc, crtc_state, i) {
> -		if (!intel_crtc->active)
> -			continue;
> -
> -		if (crtc_state->vrr.enable)
> -			return false;
> -	}
> -
> -	return true;
> -}
> -
> -static bool wa_22019444797_psr1_check(const struct intel_crtc_state *crtc_state,
> -				      struct intel_psr *psr)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -
> -	return DISPLAY_VER(display) == 20 && psr->is_dpkgc_configured &&
> -		(psr->is_wa_delayed_vblank_limit || !psr->is_dc5_entry_possible) &&
> -		!crtc_state->has_sel_update && !crtc_state->has_panel_replay;
> -}
> -
> -/*
> - * DC5 entry is only possible if vblank interrupt is disabled
> - * and either psr1, psr2, edp 1.5 pr alpm is enabled on all
> - * enabled encoders.
> - */
> -static bool
> -intel_psr_is_dc5_entry_possible(struct intel_display *display,
> -				struct intel_atomic_state *state)
> -{
> -	struct intel_crtc *intel_crtc;
> -	struct intel_crtc_state *crtc_state;
> -	int i;
> -
> -	if ((display->power.domains.target_dc_state &
> -	     DC_STATE_EN_UPTO_DC5_DC6_MASK) == 0)
> -		return false;
> -
> -	for_each_new_intel_crtc_in_state(state, intel_crtc, crtc_state, i) {
> -		struct drm_crtc *crtc = &intel_crtc->base;
> -		struct drm_vblank_crtc *vblank;
> -		struct intel_encoder *encoder;
> -
> -		if (!intel_crtc->active)
> -			continue;
> -
> -		vblank = drm_crtc_vblank_crtc(crtc);
> -
> -		if (vblank->enabled)
> -			return false;
> -
> -		if (!crtc_state->has_psr)
> -			return false;
> -
> -		for_each_encoder_on_crtc(display->drm, crtc, encoder)
> -			if (encoder->type != INTEL_OUTPUT_EDP ||
> -			    !CAN_PSR(enc_to_intel_dp(encoder)))
> -				return false;
> -	}
> -
> -	return true;
> -}
> -
>  static void hsw_activate_psr1(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
> @@ -1092,15 +1008,7 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
>  	u32 val = EDP_PSR2_ENABLE;
>  	u32 psr_val = 0;
>  
> -	/*
> -	 * Wa_22019444797
> -	 * TODO: Disable idle frames when vblank gets enabled while
> -	 * PSR2 is enabled
> -	 */
> -	if (DISPLAY_VER(dev_priv) != 20 ||
> -	    !intel_dp->psr.is_dpkgc_configured ||
> -	    intel_dp->psr.is_dc5_entry_possible)
> -		val |= EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> +	val |= EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
>  
>  	if (DISPLAY_VER(display) < 14 && !IS_ALDERLAKE_P(dev_priv))
>  		val |= EDP_SU_TRACK_ENABLE;
> @@ -2815,20 +2723,10 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>  	const struct intel_crtc_state *new_crtc_state =
>  		intel_atomic_get_new_crtc_state(state, crtc);
>  	struct intel_encoder *encoder;
> -	bool dpkgc_configured = false, dc5_entry_possible = false;
> -	bool wa_delayed_vblank_limit = false;
>  
>  	if (!HAS_PSR(display))
>  		return;
>  
> -	if (DISPLAY_VER(display) == 20) {
> -		dpkgc_configured = intel_psr_is_dpkgc_configured(display, state);
> -		dc5_entry_possible =
> -			intel_psr_is_dc5_entry_possible(display, state);
> -		wa_delayed_vblank_limit =
> -			intel_psr_check_wa_delayed_vblank(&new_crtc_state->hw.adjusted_mode);
> -	}
> -
>  	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
>  					     old_crtc_state->uapi.encoder_mask) {
>  		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> @@ -2837,12 +2735,6 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>  
>  		mutex_lock(&psr->lock);
>  
> -		if (DISPLAY_VER(i915) == 20) {
> -			psr->is_dpkgc_configured = dpkgc_configured;
> -			psr->is_dc5_entry_possible = dc5_entry_possible;
> -			psr->is_wa_delayed_vblank_limit = wa_delayed_vblank_limit;
> -		}
> -
>  		/*
>  		 * Reasons to disable:
>  		 * - PSR disabled in new state
> @@ -2850,7 +2742,6 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>  		 * - Changing between PSR versions
>  		 * - Region Early Transport changing
>  		 * - Display WA #1136: skl, bxt
> -		 * - Display WA_22019444797
>  		 */
>  		needs_to_disable |= intel_crtc_needs_modeset(new_crtc_state);
>  		needs_to_disable |= !new_crtc_state->has_psr;
> @@ -2860,8 +2751,6 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>  			psr->su_region_et_enabled;
>  		needs_to_disable |= DISPLAY_VER(i915) < 11 &&
>  			new_crtc_state->wm_level_disabled;
> -		/* TODO: Disable PSR1 when vblank gets enabled while PSR1 is enabled */
> -		needs_to_disable |= wa_22019444797_psr1_check(new_crtc_state, psr);
>  
>  		if (psr->enabled && needs_to_disable)
>  			intel_psr_disable_locked(intel_dp);
> @@ -2902,12 +2791,6 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
>  		keep_disabled |= DISPLAY_VER(display) < 11 &&
>  			crtc_state->wm_level_disabled;
>  
> -		/*
> -		 * Wa_22019444797
> -		 * TODO: Disable PSR1 when vblank gets enabled while PSR1 is enabled
> -		 */
> -		keep_disabled |= wa_22019444797_psr1_check(crtc_state, psr);
> -
>  		if (!psr->enabled && !keep_disabled)
>  			intel_psr_enable_locked(intel_dp, crtc_state);
>  		else if (psr->enabled && !crtc_state->wm_level_disabled)
> -- 
> 2.34.1
> 
