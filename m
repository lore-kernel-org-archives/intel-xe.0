Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F14C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A210E107;
	Fri, 21 Apr 2023 23:29:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27F10E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682119743; x=1713655743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vap3y05kUyUwkBRC1C5sGmpdUftt3/f5RFYMVMSVT14=;
 b=Bsd3tNiFTm6dAbBvnj/CC9yimyrZZlWrTUFuQn7aPAuZ9b0sUN5Toebc
 rYTlpujXG4CmwqGLxWtlJd2P6tSI/ZZZ2mahY8MKfkA5Udg6aBy7JSefM
 VvuTvU07ONzhOjFGPhLx3f5XrxkMLqTXZKEWz0RjuUXMUA2k55k1ur//b
 ZJkvJTDVAg3VwNSp1WcKO4RvTwWIxyQFh1uGIzQpEXpsqOEf8Xvoa1ov8
 bg0TbPIjZJ3gEApneh992up35Znv1XUK6RNzgmz+LLYXjaxm34FsGDNGh
 SV+mVKyQ+EV5Jfj84itXLbSyA/I3QznZr2ndpLV35zFe+aeWVtyy5neBA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348899931"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="348899931"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938660665"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="938660665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2023 16:29:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:29:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:29:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAuIIBzr7CsiLyfELiC6FTJeEJrAyKvJIsx5JDQpAl6Hwq7dwhjPRxM0WfqHN4VnL5a2uw0oofZUkhY2PwqMmzpCl0yyTvsG0TkgIyJILUtIcWUBFF/m/zBMKI7s28S8XZJQU37GW0Ub/adT4rXlqKtO/8WwDVC50x1HJjz31idfoWvhc9uyv4Ho+0fQhJq6YwOdmrIxVd+xDJPQnFLoCNsTtauhBJOyaHVP8f/hj41EdB10PH46d0pAzqc0EtWfbCgi/N4nare6Fmkk22KAig7Q91K6lMglAeYNLAStKHB1DI4JmayB2q03JGd5OqoCDzOtFWJhE4ZcX3JOEhJ3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rRmlARBl5TggD0HxJXvM2USYcfo3uvfZH1r1kiaN+c=;
 b=EZzGCQFPBBtlLrn3D/D5ngE2LLfI4vhewZ917oyLsFbWvvuni88Pu+Ra3yjKLvMqJPfP8xIiC8K/QDRFW0hLZwO3m8qy4Pz81OrEzgv1rGseZ/eK+uEAANRnc2Zr2f99TMIzxz+9fR/hXm8GxPMjhOJclW7hafVmj8Vd6VYhCgTiNmrhduZHppQum17i5i2vtkyWMzldDuYqNfdFdmL4odZIWnyyT0cg+FHY56B6eDY2c7nKWacVSo1gGZ6fU8exAUzEW8yNqU1wZP2UpS/Xr7kVeiinmQix02ps/Sf4ZyFNdsvQsh1Gq36vv8PiOL51vgncOfqPWqsf6Bqcn5pCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:28:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:28:59 +0000
Date: Fri, 21 Apr 2023 16:28:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421232855.GN2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e99afb-833d-4b7c-4c9f-08db42c02ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9s5t0YNlAcep6TgFHniSmF6C5lQ7RS84Q4RuNOZbT15sqXVQzc8hjlXpBShy1voHCEyxwz63OrzzLtF2WH6Rmv8YiY3UIEI6vyVgjfN1COau+e668DyGmKW6wotqc+7LRebtQgxFHQWeMin7Qc80/A7gV9s7oEFLnENiCHcdd+qRQSAFeLJF9kqCLfeNawvaJX5k+VO8fQ0ahwZ/FH6ahcPYELtUFYiHPGFK7x4xO02O8vvnuoYjqxmf7WnordHdF3ePJO/wvnQlHcm2TlXUuS1rp85W3fX4EO6tWLTOloZ1P/LvtDL12A1qyLFStejXgcjDd+pg0PRAR+hXSZz5zDAyJZTxpDFBFOGAHwhMzIQM6PvD4Gi2uJy1L0uw8dNk/PygZvGOmOqXF8mijmO146wbN8us9bIfHIi7bO0JUq9REsO33RHda+1nZcE3wmy5Gz8g8VN0ZG8vxcXz/ywW9JQVPTXweMCmAwne7MwMzqfvuwUoqNJBmjYaaDR5iL6PZ4fmHZaq2BWhNpnE9D4JbENg5hxt/4t1DXl6eGYCD75oWKY906ZB9/lH9gSIxpo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(1076003)(6506007)(26005)(8936002)(8676002)(6862004)(6636002)(54906003)(5660300002)(33656002)(86362001)(41300700001)(82960400001)(316002)(186003)(4326008)(38100700002)(66476007)(66556008)(66946007)(6666004)(6486002)(478600001)(2906002)(4744005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqrueW78r+56IyJFjJ4g3cNWq1JcJZ9fl8F9+Gw3nugcoOuj//5jeoV69UHi?=
 =?us-ascii?Q?J0gqQgWHTkRPIbX+xyphTngfzpwiUtYubIIGNbt+iz8+Rv9mvM3mHHQuOfrE?=
 =?us-ascii?Q?pA6dC5gs88SBvhu1zd/LLiPg/WWJ/nCTNAUTuZbzOn0Sn+S1kKXn0eNdoKLo?=
 =?us-ascii?Q?bw1Tu2HAGEB9FvLJmG6kcn0cxzTrht3KRzkhwXelSlSpCJlp1+Up0dpgTFil?=
 =?us-ascii?Q?2heCyr7WaO46PxMW+vzpA8crJON0m7qhrhuvmLLi86vurw1tjwqfpi+c2f7J?=
 =?us-ascii?Q?lhuA52ZY4O6U2ZRJJCPXXVMLitAcNu3hpyWlDkhhK5UGqYcBrzsRgTdJsi7L?=
 =?us-ascii?Q?57trjvAtgA4hgt+Quk5oj4yKYlK0Vdm1PRXC0ANw0VewF7PdqnW0Mokx8sak?=
 =?us-ascii?Q?Q9g5E60HAhCakB4kcvOmoL8aisDWesRFWiMRO1o7q4znFqchBUJofWWr+1FQ?=
 =?us-ascii?Q?CYwkvIBLtjjuo5qLQaVfOUnHKg5jHxXKO3FD+PgN3rsveIP7WJlBXVFbq1I5?=
 =?us-ascii?Q?bWPPCjmCELrlXcJIitfoLh/b71W8IV4rMfZBGnF40q44bRXeAHu5raTVV4nE?=
 =?us-ascii?Q?rxWs4u8cbJ2jhh82/9JMmG69gM2osAMXftq4kpyxMxLC90jQIQIkx5DxML7F?=
 =?us-ascii?Q?OIpLNt9mHgxyJwYOPH/B3QH1/PZvMgNMsuLH0Xl9oLpkNuyV6QKZH2kB/V3e?=
 =?us-ascii?Q?vDKEmgy4fbAEHrguuULvZnqY+OrdC9nZVyKK2CzcgciUcjcnsGztWkMPlx5v?=
 =?us-ascii?Q?qwna2OnNsewvABdYCZU4Kj2az89CVrFfCjZmh+ECBDttTWFCZPz1PD6Ui3Ow?=
 =?us-ascii?Q?OWMrUI/5XO9xIx2NYm8/GqKgDw42OYUV6aimec9qORtfIeIpgHFkDboQZ5LU?=
 =?us-ascii?Q?HLDT1fc5anB0rxEYJa5ixgUV5D82sRbDDylDs7GvbKbAdn5iXvq1w5MgYJR0?=
 =?us-ascii?Q?9c4kNitl503r9Rvzy74VkwCCyLEY39Fvfh3AHwLQkOJrVXJXfAilNrmc1cTb?=
 =?us-ascii?Q?re/VKCx18df3uzldLs6ECCy6ZzOS/VzwK5+TnAahnFwN9D2lYFFRAjj/3DJ+?=
 =?us-ascii?Q?K4oBY7dGxILzAHcKhpE1eogWXgCTJ6hG9h1ke3qsKq8kDjSNhZNhVY3+89rb?=
 =?us-ascii?Q?lJr/c9bu3HjjsejhLa6Ty3+6XiaZq7dMSNicDXDIKwZkov7OtZCnbGUoJXrl?=
 =?us-ascii?Q?oLZNt89A/ur3166zq1axpHv+PjIdXSIF4gh/gDpEYMmlRx3ODk3ECu8n0szd?=
 =?us-ascii?Q?o9bzMrCl2uiGu4W3nA0b+SGb5vZZoZ9KqYXEdDFjlJCbHW5Xsvy5zzYgk7mE?=
 =?us-ascii?Q?vHHOCFzKFIPoa8p5UJ5k+x8jmQH9a7w7IsOX/gBqPaBN46PyjhfXqCiimArU?=
 =?us-ascii?Q?jtkzF7kN4V/vzCm5uwBzwDjmhX2NvtQhAsctR8+Hz0VYSbgkp8/qczpVyNT7?=
 =?us-ascii?Q?xe3y/AVnstn0lEcP+IfXsKHkm9FAKQH8xBgbsxvrXe5joiSNeMq4ii7C7YT9?=
 =?us-ascii?Q?mpMEyoMzdRS918+e5CmopAaTI/NYzcIlcPrZzv5RUPvZK+f1gE00nkKb++P2?=
 =?us-ascii?Q?shQrAcyy/OePx3BttLsWsp9QQQocBUtQ28R4R2rpAtGu3cwqIw4Lgj2YTzqd?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e99afb-833d-4b7c-4c9f-08db42c02ef6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:28:59.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BzodLH1H54hh6y7kqtauPydYHUqiGAhUMFshIbNIrIMAQizwvExu1sVs2pOnYVBTBNQcGKOdpImgYLyNX5JglAIZWlApi2oSVVx0m8JXZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/17] fixup! drm/i915/display: Allow
 fbdev to allocate stolen memory
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

On Fri, Apr 21, 2023 at 03:32:44PM -0700, Lucas De Marchi wrote:
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 46447dd58f3f..2d2388cbc626 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -349,7 +349,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  		else
>  			info->fix.smem_start =
>  				pci_resource_start(pdev, 2) +
> -				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
> +				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
>  
>  		info->fix.smem_len = obj->ttm.base.size;
>  	} else {
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
