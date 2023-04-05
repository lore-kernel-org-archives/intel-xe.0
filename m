Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B704C77B6C
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 21:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5769710E553;
	Wed,  5 Apr 2023 21:14:33 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BF010E553
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 21:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680729271; x=1712265271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MFEt6GGxjnuq4cxqVvi4ajAmpsVCa8zHpwt8jaP46Gk=;
 b=N6jHmyH8a+Xwa4fckAHuQi/wK2bwDG/fj3m81w8f6DUmq7t+kDAcor0S
 P7t2AyS1R9InCEc/xlPggcw4hj15moFc/NxxSpcmnyHz8LeFIfrt5SjDV
 52yo3C+envfbkv5giqcaLrKr47tlCCMkbMtiUf6BSWiC5k8ebRXS6Suwb
 7ORapQboLB4I8EC69JWklRZYr5YhhhpR09hbMmz592JX/9Ag7RAkYuzHL
 A/uQyfwJbFD7nRronR/olX234NmjIGhVgn5YLjdQNnM9GXBB+dQzY8Qpu
 bdob74U9hJra5ZcHZs3qRSG+fqPKyv8aIWVOmplY//qoqB+1pd0mrA/Lc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342582869"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342582869"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 14:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717186686"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="717186686"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 14:14:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:14:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:14:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 14:14:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 14:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQAO3yik/SUFy6awzgrIunwy51sUn4ROe3epkreJKlrLtRY4F9gj2sOwG2RINIsfq1c7kga+NakBtqkuAJS+7O+z3NvtgGKzJa6lTo764LBy3hfAhK0kLHyDs/dqb7Ha/4Nn0gQG2g9DL0aO5MQOhhmenVPYPLisvFYPqEd8BgMVf01Nf+tEosuwqs4D30K9dMGlHI7wPTIrhfu4twbaSj0mR04vE8k+I5Svl4LAyv8JS9H8NjvWcJ5DIwVn1tQ3EPFXEOgV9gQVAsdYrTHNx4xT104ksEU/mN98LFfcVq11sCqaN3bfiLn8VmMlOzqtlMAF5b5shLg0ZdGf1GhYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CMOWiTt6RnwXi/r3Zknt8QiHweT0oyXFfEWgWBbxKM=;
 b=M6cb1FtYoY5NzaffAo1cXhlpvqIb6/0RoBNi6htbzSF9ddPc/NxNHHWH8gvYLS79Owj1GnHDsVKDUwsrN1nIYmoOCKXmN7msImV8o7YjHlx97dfr3WdYS0dU7TWKJqkScgFlxDqoIanMPyKqKdf4ZTHxjJG6Zap4QD1uN9Os+EO9khufi9Zj1X5w4yqxiIlRXH5A6RjxsQ1fz/6eIxzCSSO1/PQINCforxyoKMPXXdGjEdtunMPoXkZ7XHMT/rZGCIKuGe0xmgxROL8SLMO+1F05nk1BXnXnfdSEUkTkQ2x2e0q59N4nFJAOXB3X6AwHNbSg87GIbi6OZkt53CrfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5349.namprd11.prod.outlook.com (2603:10b6:208:308::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 21:14:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 21:14:27 +0000
Date: Wed, 5 Apr 2023 14:14:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230405211425.zihhlfrhaufnbrcp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405203533.2182217-1-anusha.srivatsa@intel.com>
 <20230405203533.2182217-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405203533.2182217-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd54c41-b365-42ee-c052-08db361abcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVugdtEVArol11m7jFRmy9T1r/PnxAwr93z759/nYc1ShUazjTecfjj1xRXiynPdfo1CabQ/6fyuI9axS1usUQzSdXJMsPAdbmnbOhMGPm0kmLEDA5H0CYK1UCAPLHPLnX3pXD4MfXKfq0P59TyrCmoQaQwalGZJsmJOox1BiBsUM06F3M1G5T39Y3oGdQEsKP2qWWx2a9ummwx5Nti34vgfCNLX17iUQEezoBOZtL+fomHHSPMZRWiIb1mPU3xVmwPYQPgH9qqUj76u5zAO6HOjBOUkF5tIyoJqWXdEwRxQAIFPuaZBt9p5+031Syc4w6GfqghO9525ZWKuexIT6yVEnuMken9SojZls4XTzAbhZ/Hp7CUgBgEclDzokCYH0kP453Wt+AgTXCzn0fqIMAmnkOpAB4ZwKqJoJSMlZn1x0EbTiYAOx6pDVgsQkYaG+9AoMM+FHJLePv15sbRfLPu5UEGjT6DK32Z7bLiam7Fl1QtKTdFwY7jFyHxmfsGBknXtO/qNWxkBHgLWZGVZyyo7uhzRE9q8yEtIGej46pmFVTf9mWI2Adc3jWS3vJV7H44a7ShGFB5Vgt6l+YcehMOxdSmpcqOUeZjflqVzP5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(38100700002)(82960400001)(1076003)(9686003)(6506007)(6512007)(6486002)(26005)(2906002)(3716004)(186003)(36756003)(5660300002)(6636002)(316002)(86362001)(41300700001)(478600001)(8936002)(6862004)(8676002)(66946007)(4326008)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LSzS6Ye8qMZ8mdNb5Q/mvkR8gneAx1Q1SnuPfJWbiBX/KhXcqWGLfUvvcaL?=
 =?us-ascii?Q?rjQKgNdDaaLNxsnHcLWDRHFiiVvJNzWCAQn7XQWimOYJswp4Qx8my6I6loNs?=
 =?us-ascii?Q?CM7Vapr+mWuK+GYVFFGp0pxq7r9oMz5jJ+yPLHcd1ceeZUkP8rNDw1wYQOWA?=
 =?us-ascii?Q?Eie3XD5ydqBwDy3F2U0NlOHgw2txwPilceakJc/BfZBzxJa1+fnkkdCz9e4R?=
 =?us-ascii?Q?Kg5ENKL0zw0RszeHQOEhiCjbcIO0BsoOgShns9tMgYXjfNwfcfheTTQzFUk+?=
 =?us-ascii?Q?NtsuKAJZFxagjHF6Acf8TYhkW2b497iWymuapNxcAgOdH64bx6XI6XGc3fbN?=
 =?us-ascii?Q?Mx2/AvzPUDxMx6vb4sM/v9RGIyT/mApMzblA0aQVgCToXgVApVuGFoEl7rvp?=
 =?us-ascii?Q?Uhv17Oi5bOZe1kAiABGUPnyaHmO5d5WzangSdrF2TwNriPjm9D7vR1cRYv0m?=
 =?us-ascii?Q?RqyjtYD5Jw8IxZ+PUHyrVrhWsjiCvNX1NRlV4qQO5gXWuAUo9Y7Xs2rrkTg/?=
 =?us-ascii?Q?qZ3pQNv9+MDJm+zqJUP10do/fPgnKZ6/YD8jluAowH0SSRYipA7YBPBC0RU7?=
 =?us-ascii?Q?0MiJMWLLk9IwZ6gGfHHNfO1TLy2d9h7Q6+wGgQGkQ52M+6vgplUbsZ3N2jRW?=
 =?us-ascii?Q?CBvAzu0CdmwnF/Wk/6a5j4DhCjdfZ+0fOIKYI2wj+ayArCNfv82PB846PMTU?=
 =?us-ascii?Q?7NOgWN5vHBpfSOIA++mfCkSjJ+nVH3qWMUCUi/MvATZawgCkIFUgGkcoh1ak?=
 =?us-ascii?Q?3yPHdqKSM+9G/7u3I4UGqR5M8cgMVUpBQD4iQ8NJYMSseeeh9SrPtY/ofG90?=
 =?us-ascii?Q?2mocgPj6b1PlcwSb7QkZmeUwkTWaLiQnedWFZOE/ubUeg/IHo8np/VGbl4Ql?=
 =?us-ascii?Q?ae1Rg2Z5C7upoHnrd6nZLYSQhMz3879VWds6PhyqQWyfQZ2owWTEYnpoRjnl?=
 =?us-ascii?Q?Xou+/zEUzW+lP1NNLAeUa2p54PNnVNQ2FvHev2eDczh9cfmHO0LiXgG8dajO?=
 =?us-ascii?Q?TxLgOxb9regN9odOTqt0PTVZ8hT7T09Tf0E3wJtyItgSTCZga6b8rtfSJCI5?=
 =?us-ascii?Q?SswFKykvPofLlB1mr9OF70pqELpUUzitGN6a0bK2b3Z5V9s5KARa7Ot5zCII?=
 =?us-ascii?Q?El6h68CCR72iBMaaxO/1LlKhU53oJ2M9dUbE5HcyH0QzEn74H7bE9Org5ibc?=
 =?us-ascii?Q?gScwIW1Ir66xlMQ7tEMEZ2QQU492VXEXHHDUz4N7aciV+n8VTimPw3fi9Vzh?=
 =?us-ascii?Q?xDDh+X6I2H48ICtWh5RCbdYsEqcXPUDbrrMlTwuUwjaXtDrMmXabeX1UitgL?=
 =?us-ascii?Q?bynnMtB/BVs8YpOb8TGXeWSXSBKJTudu1ZQ2Y8hOG9zhB89iPc4b+KxYV1/Z?=
 =?us-ascii?Q?maK9ejIdQGob63T1kAnz6WZjwwFNqBWTzAJ2S+Hn2wlSwJCc8t5epS++ixs9?=
 =?us-ascii?Q?tJlOEH0KnOn7Bom6jaWGI2ER588Js3Avg+jaxXSrfao1k7cuDyUZoGFUKCNh?=
 =?us-ascii?Q?+xMyZfDUqrfHQCQhUTk9jTe6bhthUm1BDEhj2h9NWLoC67m0SPp6VpXAcZzh?=
 =?us-ascii?Q?9RakXefdz7BYFuSrJtOdl/00bQgizrvtrmn3HLXWm7imSd+lxApxCEb+cU1k?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd54c41-b365-42ee-c052-08db361abcfc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:14:27.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LewsokzgZmQOZPNAwcp24W/2U0pYrdMXWf5panKj9J9UIKegUdwzwC70ZyKo/Ykg8vS1NW7OYkHnrHczIjci4Xaor7JDTcPcFIPO47tCie8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5349
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: GuC and HuC loading Support for
 RKL
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 01:35:33PM -0700, Anusha Srivatsa wrote:
>Rocketlake uses TGL guC and HuC

		     ^ GuC

and

s/Support/support/ in the title.

>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index cd3cbc8981a2..7a682dd85796 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -106,11 +106,13 @@ struct fw_blobs_by_type {
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
> 	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
> 	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
>+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
> 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
> 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
> 	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
> 	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>
> #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>-- 
>2.25.1
>
