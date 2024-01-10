Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1FBC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95710E670;
	Wed, 10 Jan 2024 20:10:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6F910E65A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704917425; x=1736453425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Ig7JmCCMh7kFD84Rbm8wqcrBKr4P9rjgpt7ME59hWk=;
 b=gAJl9pdTbOq6Jzu8qp9ImGzYk31Q39H7ugbi/QQ+/h8WuHrZzS3885bL
 GFLXeghDQcLFYkaZqAzmwy/HszFW64SNZ/BrvafNerfzxkwVb5pw7Yf5b
 DSnBrPLnEBgd2jBJ2jlbIyPBgo7H1wwMCkLXE18gYKKCIF72zrRTzwaQM
 9VC4YF112xuIoeN3py9YZtzGqCXz1BTOFQEOxhBP5uw6xO9LLM6i5fk/Y
 W4ykld2QRVKqxZ85FcKXOeafsLOuFDu+07BNrJWSob9o+Yp/3UGBslQ4v
 O7OfaCecmG4p6goBdGg7rw64vaIQGNrMOnhapn/68KagE1sBpxSgw1eXz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395785069"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395785069"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="905662423"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="905662423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:10:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:10:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:10:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:10:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:10:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L47Mlm1wj5FjuZLKVTCX9A4X/QyR2nBqD5qABMpJpyuiuDzESzmR3lJiItUvK6qtpm+NAR0/3R6kxdO8Te0/ChkVFfIyzAP+HuJXogMRYg9vXZVuModWzGMhEQMxG0W5RG7L+RAvonLjyF295jjOBLXbXaEEt3d0UFyVs6J8VzWS34n8MiBRTjFU8x5Nu/PxyCG/hjNSAPXumQxa7txqjchkOISUUSDf9RCIlmA6UDBS6eAlsEA8g7SM31C4OvTKRj6U0vJkfnxgZKOYLaVJh8rcc6vGghZx96MwN+ury83DdfzmBpiNTwLLAg+kn44MguMIpH3AyV4hCuugtgsbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnPCQEpym8Q8G8issTHfZNTIoyIEnkFMgNuRvL0a0PY=;
 b=HFAwM9LkoH3wd83A7l0DSi2lAgL8xx/auu0cuWbY5T3kvAReBQprJ056ROhljKzGzObEtF+LGHuRPy9QM9n7CKC+Iazk0jV5dr+IxUXEzZXJqC6ohcYWcdd+woUwEnR7HiO9n7e9RobxT2L/kn+zYPC/kaTNC0WtuYqzyPnJQ181Z3Im1BxN5gEz5mg5ifcSSbZjXDrFumfeKNANXFMaZrRO5DpE73g0C7hRzOBvl9YqG2saK9Y1R4sE+ocIlal1oT7zyut65gcLZb10HKeBo1tRgZmh/XwKj9K51nX//Qvty8XbPPU0zxdOL75RzOhCpC3Jjg3mTFAAX/oKIl/GLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Wed, 10 Jan
 2024 20:10:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:10:07 +0000
Date: Wed, 10 Jan 2024 14:10:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe: Add build on bug to assert page fault
 queue works
Message-ID: <py25q7cru7cixii7jwayi7dwtnz3lgefyvvxujylql56h4m5bg@o6q3johlzvid>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
 <20240110012439.1400618-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240110012439.1400618-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eac3fe3-180e-4538-f66d-08dc1218240b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYcF1a1SK0f6e8AMXW0EcvDigQV3b3dWEIH0Xr3qRB/Zb1y6hDHEkRuZvJX6K815+zU2O8BlnEMDCgvSw194JWekzUsIwEMqWYY3NoqGG/aMS6wMq1pjP/4xYQwCc29ImcLFfothlK64AilK6vk9VnZNn5uEHngawzXNYK1TDcEFAXbhgfxIty4V62QWc6Qki1NzbTySFHV+CNKPmgDvMwTs6yFztJWs9ZKu+E0kKFZyHsM+o+E4RBB88p3AI7tL2EJUokmzFPrhRU0F23U3P19RXFJkpKxSuFA3Zv7WP38zBYkd0wlE1o7CMO50f8F+ys8jzcdL5CRJIMbteCzWUQNJ3NNL2n1dqSk2JW48iWmxqxjP2QW8/wuejN7sUQ41JQstI6sO9QxDW5krBaxpRvasUzL1k8qAgRTZ/Ml/wCUzNgr7DYAtvnST+micdmsTlVYFWZh30QhjNHBAX1A82skloA4/LrFJu0u4nuz7qV01FFNHlL7dizsaHAmgpWfhK3zADWN39nmbVK6wC/geveR5K5d0Ywe3HrJ8L+E2ddAbSPyDVhgSTJSJ0RZSSSEk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6506007)(26005)(9686003)(82960400001)(66476007)(66556008)(66946007)(6636002)(6512007)(316002)(8936002)(4326008)(8676002)(6486002)(478600001)(38100700002)(6862004)(41300700001)(33716001)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqH5GLcmT5PG8Qs+FVRU972xHAp6tqOqrI12u14Bfg+BdQMNYM9BGRUQjvhM?=
 =?us-ascii?Q?ra4BrWoT0jsFycxIMEzjSCjpVEAHhLqgIs9O1c7pFmPbMD/e5GVh00vPExPE?=
 =?us-ascii?Q?0bhV04Ty12aqSMkk0xwEbTHRxfI8v+ctTMUsCn3JkO3pfDG88n0Fgc77vyBi?=
 =?us-ascii?Q?WvEnlAJ4M6kf4cj30Q3flZXVv1wNKuthkrzHe8sSShMcPXEFxfHInMIT/twF?=
 =?us-ascii?Q?N9aqZvbnemABXTBM41Up+lIcEG78dvBM1AKrQgzlA/OsFZ75YBLaL6G9fxDO?=
 =?us-ascii?Q?JYlU1mo610GugH/dRl8W9yD1NdA/d+j5rrz5JqAmyeP0hGoSgHIkag2sjIYz?=
 =?us-ascii?Q?A1Nbk0FURX3qhS3svSWEk9k6wWmwaQOaeW3YCxfewCLW2kCOHox4TKeRGcVd?=
 =?us-ascii?Q?bWDpLGgdHAblVezwsTOsb6Cf5Os/BvhVYZdWHTvsrmMu4Tz8sUXpKF/cnPDl?=
 =?us-ascii?Q?PYFGH1bmr2G6XAdz/rYkw0PMBfK/NnrcBDv7t7vyK6OSFkqXZ0vJdrZwFniE?=
 =?us-ascii?Q?SIV+F/n+2o71RkeipC/exXH3XcC05taEA7cJW4m/dSUWktUAL3LzOUTJHgwV?=
 =?us-ascii?Q?Z0lbb6YmaMxLhX6Tl+nsO52bCOAD0K8lceRaSfEJ8XihxnEWjC/OWdDGx7iv?=
 =?us-ascii?Q?NYjAGBfCBHfukISMsEnE7CSRjJIq2CT3mxQSOzauo8DKuMO38YO9FIZ1w+B6?=
 =?us-ascii?Q?NRDRFJ6z5Ue7kFHeT3nB45vIo/l6v48fzHSlnJfmc/p+Rd9N4/x4X/6jKwWQ?=
 =?us-ascii?Q?YuSUz11fDraKDcnasajnVv6RFABOwYn4vNKm5sc77Gu+6GcGEnMNOODw4/C2?=
 =?us-ascii?Q?WeaRv06CFOzvB1pL3a64WvGrxhhtRRFze79EhcDhbOgU1eYjb/kQVzAFVAn/?=
 =?us-ascii?Q?tHL0LgYQvenkwWz4+VwOk7ytBVleyr6y6j+Q5xbQ6RkDaGMUDKJO7K59dyy4?=
 =?us-ascii?Q?aMszdQXwZm3UkK60bBZwBQho3I2yNmpbaNI0GbGeGxEd8oggQiAJWweCIbcu?=
 =?us-ascii?Q?BB9itL48KTiS13sZ7xSGOgkKmns2WPEq4yrqd2axsuMrCSeXv2cyZflHFHDO?=
 =?us-ascii?Q?WcGBZyAUk+trfCJptGQpqxSARDDlnzfMgCd3DTN/sf5KiHE++lNGLntUKGMw?=
 =?us-ascii?Q?mwHtRcFQyS47RnkB6unm01R0JcpKp97uXepXWklR7YNyYwh8FFJfZC5oxYxR?=
 =?us-ascii?Q?nPdXpCN4CRlQTSlG8ynV/6zPqD7W8xMsLrN9SO2QMczGKjtb0WTzAVVkPN/0?=
 =?us-ascii?Q?k9VXL5JMCWjKxEpSn+wQ7uvPKppjObjUysQcSLSvFAx/Tn5YaUdn1VOIVmxA?=
 =?us-ascii?Q?8oeLCdiqu4NgebOSGuCwu+WqCrnKQl7OmnMIreM1CcXiUo8IB2DVZWVM0R99?=
 =?us-ascii?Q?r/s92Ob3d0wbGcJzhkuavOA3RDvhVXFzjfF1X3RfDaR/QAahx3wvsWJ4ajeF?=
 =?us-ascii?Q?NDLpZkhJ76wFz2q85kKjPY02cLuAI/E/pjtD/PmNKgOFi/+H8Ooyp98wzvta?=
 =?us-ascii?Q?oGS4TwyIMg+h/UOIoVAdbDkfVSJT93YRdTLawjI9AujZj4sPZrOUCxW6rbs+?=
 =?us-ascii?Q?AiXC4AhdqP+gpoihLUZG0PsWCiHCTzp/aRqZjHfIRb6tOyrrUzcYLM/DoosL?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac3fe3-180e-4538-f66d-08dc1218240b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:10:07.4516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 174BeZ3XDrjCSYRNBCI4ggG98PDcqOEua6zg6Q1ShZsUkFubIYk1B2pAAxPdBevNZb12LNxYsuNzRLxTq81ef9dNAmz8i8oz3SYWyqa8TRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 05:24:36PM -0800, Matthew Brost wrote:
>If PF_QUEUE_NUM_DW % PF_MSG_LEN_DW != 0 then the page fault queue logic
>does not work when wrapping occurs. Add a build bug on to assert
>PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0 to enforce this restriction and
>document the code.
>
>v2:
>- s/NUM_PF_QUEUE/PF_QUEUE_NUM_DW (Brian)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 4489aadc7a52..0a61e4413679 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -328,6 +328,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	u32 asid;
> 	bool full;
>
>+	/*
>+	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
>+	 */
>+	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);

at some point we may want to use either LEN or NUM, but this does what
the patch says.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+
> 	if (unlikely(len != PF_MSG_LEN_DW))
> 		return -EPROTO;
>
>-- 
>2.34.1
>
