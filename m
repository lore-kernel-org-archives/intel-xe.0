Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DCEC46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830210E2B0;
	Fri, 29 Dec 2023 21:08:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACC810E2B0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884081; x=1735420081;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2TAZmAgSpMcevvVc4/5zW8n1kP21FGw5JScWD8194Wo=;
 b=Rk32EEad0duPKOiLvsQPxzrylAYPq+sRrK7dSQ1uVvud9J1vt2EWI+5N
 VRhyXiTiprSTnUC91a//C+23IDSqb+Vue68rKkQ2p1C3NjBvOb5C9T+HA
 kizGeWU1WNJ/iUwagVRIcUg3w5SAuFX972ANOKuidJNH1h3PGfORWVa+2
 EaEWqhdzreaXda7AKUeUwZrzT0mdhc3zuJpo7F/wiVc3und/tAPcvmrtc
 hY9oTPIVfAh1yL7TNUmRnPE3miMVE1oJNfioZT/Gs+ZQkOJMHuUqdlPmh
 OG/ydlk9eEL4ctok8mGAWfdlmwQR5JClKeyYK3njP908WkirLshJ6Jr43 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="387112232"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="387112232"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="807763722"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="807763722"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:07:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:07:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:07:57 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:07:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glb4bvApiccPYxdyAdQ77ESgjl3W0GmVSSLsN/XuYAgddShR7zDUnGshp5JAUja4u73XHjtC7PkaxswR+dOCeh6+GFprQgA5bpZr8D45ETy089fBQptLc1K5FgvS/ithGYIJfUbTQeGVZNvOZdyJyoYfRIjeB3Wn9gtGIyYveBElpN6fg0c68jQuQ/Z/ofRZLSZ3Z/sISObDIEoVENrPz1jPnmVv64UyuW9Xa6kYDCxXahMd0Z69eig4tg5wVpLTwSnDAWXXGrYeDwRnIxNgNOpI3QtSuwvjbYR3b22YewLbtJ8dmCDDh6KxwyGzx6vQZ+HN4v2mieBfn5krxoBXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ/bGxHWpJVkyCBbZAPg6fzx8LXFXwZ4C41jf0bSJgc=;
 b=I9IdE0Fg/zMu/WdwocJmDmnN3cnorD+Srt9/nYwT/O0/lC8zjIG8DFYvpX9Y0CDoJvyXjmuYmXzj9rtKdrSCqm0mHJspERm1UJPmTUlAV4Ol9BnAjV006YWiGP4xdJGpRIHGXqy1lzwdn/++uUlpfRSDoRWtIoNAcETQnldHqJaonqApRRZqJ5Hi3WlFuMq97JsVMtAUrK49wWe7I4XQoikgC7DkZYhDC1ng7GaZLK6SGNz/3tF90tnUcstN8xM3RjmqEeCPfdcdUAFGHBKP6QBMgN0zydknBs47DOIekt3OkGtaPvMofICS3zxf3SpSuc4YLlSo1onrqk6xGJqq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:07:46 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:07:46 +0000
Date: Fri, 29 Dec 2023 22:07:44 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 03/10] drm/xe: Introduce GT-oriented SR-IOV logging macros
Message-ID: <20231229210744.ctmxwwjpprjyzi57@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8162c1fb-1eb9-47b8-5bf9-08dc08b234ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1tg+YzZOBcsSrrz8iSdnTJnaG3V/qlerf4nGHqXVVyld1s/IrAN6tpT7wk6zwmP0IH+vH0lpaT1GmVWK4Xy8Gw9trezLmqv3EzYZoFpk+7DOXvq/My5KNPkZoM0ia5ftsd1++B5dRYqCKLoHBHEcQc7Ae2E9uXXkXvUvJf1CjtuimnPNQS7W+WFnvaNZQ5lnXGMLihE0eLxERq51WZHdq5CV1T5BqaYknc7NDZ08GT0JJZwv1CSfC+3PJbjypz0QDSA/arNa4EJZr//Ipkbf52J+HtuJjWLclMRz4ZKB+NqudxwV0be+aPsJaBWYQeFfsWroM3d5Xan9MHyo7wiqyqF8cYXJQgohgk1RtAVbXgRLuewwx34Lo3Eh0ImtfBpgKy2k8CNcZEqyodvNd4xH6/CCYtBnwqNWGidk8mPzq9xKP1Cqtn7bR88Zhb8Orc6FjhRSHXtrqzjgnhPC4yMfx/CU4tDpXPW5XUNmLccuhvKgbiSB7EVvLJ1B1I++dsWiPb1oCZvn10oMCRUdVUB+CUMfzBxgwg6Kn0ZDNxaacSSYAmCXypovatbLGLEa+AP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(41300700001)(2616005)(66574015)(83380400001)(26005)(86362001)(1076003)(36756003)(82960400001)(2906002)(6636002)(37006003)(66476007)(6506007)(6512007)(4326008)(8676002)(6862004)(5660300002)(8936002)(6486002)(478600001)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNyZU1ydlArTVRROUF0LzRNK0xabkhHTjFHK1p6YXNSUGcyVVcwdWVFamd1?=
 =?utf-8?B?czVpaTA3Wk1idG9pRGFoRlB2Yyt6eExKQVFPUldjLzROZjRvRzVDUnNiU1ZM?=
 =?utf-8?B?bkFXYWZqeUZscVRTbXlhZndNZjhYUktnbW9HWThXbUsyRGVURUt2MTVLMkxL?=
 =?utf-8?B?K1hLVzFMKzQ1RVd5bEkzOFgzb2hnaGhPUXNNVlJHN2YvblZrRDVoWWlPSU9l?=
 =?utf-8?B?cTF2RkhGYUpvZ3JvTVRwRWN5aXlzaGpVdXgydU4wQ1FBUnJUUzZlU0ZkRVV4?=
 =?utf-8?B?WkNwaThwdVBidU5qd2I0bUdZVWkveDh6R2Y1VG9zUElhSGIzcXJYa0NwNlBp?=
 =?utf-8?B?UmhRL0FYYjVyNjZNVUlXaG1lU2F1dGFoTk9pb1JOVEE5bGhReHo1WnVXcitP?=
 =?utf-8?B?TWVTdUpSbzdXd0pZdE1sZzEzWmh6YUFEMSt6QWplT3grZEVLdmp5b1E3eGpj?=
 =?utf-8?B?SzF3TERwZFFNTk8yUGMycklHRWxiZURjMks2Q1BoVTV3QWFSN3dZWHdlQ3lT?=
 =?utf-8?B?MGFPbUVFd045V09sUFQ2NXVjTWROV1BEZXN4RVNhSWpjMjJtWnlmeDcwZ2g1?=
 =?utf-8?B?c2pONkhkOG1sYUxtNXpkN1piZmt0b3ZHencvR1B3VzhKYm1oTmZRamN0U0o3?=
 =?utf-8?B?anFld3Z6UytEdWZ5b2JiUm91WGNwd3Ewd1VaNnppQmRudE1aZ1UrZUFwY2Zo?=
 =?utf-8?B?NXpWMXdyRFI1VUFpcnBhK1RnTkkybnR2eFZhR0tsb3crL3lwMUFjczRubVBI?=
 =?utf-8?B?bm5zazFwRERKL1ZTYUZOUmZUaC8wZWlUTXRlQmxrODIxQ2VVeGVNand4OHZK?=
 =?utf-8?B?MlBhTWNhTlNYVXBtbGFOdmZhOHdYWjJYeVVxQW1uTTZsbGdSUHB1ak5GUEdK?=
 =?utf-8?B?UG1XUWE4TjRPK3dxaEtXWkw1OFZoZTBQWWVTMzlWbElHUHNTRTV6enlnOHBT?=
 =?utf-8?B?cVpldmNTNTl5SjB5N3Vtbk9NdTgzRXhkOStFMnJ4MjRkN3dsV0VGa01oRDk5?=
 =?utf-8?B?WC9WR1phb0pyZnhuSVFCNXBnSnJlZlBYUjNFWVR0RGRSdWVQZ0EvV2orTnd1?=
 =?utf-8?B?SU0vNlh3Q1VVR3dXRk5qc2dEWVNRVWdVeE10bHNmT0RVRkpQUWYzcWozbk1N?=
 =?utf-8?B?Z0xielZVTjZGTXZsTXB0Qmw3L2FWTjV6ZkZjNTBpR0JSTDFLNUoyWFA0S01j?=
 =?utf-8?B?RHliQUJkdlU2Nm5xVVlrb3BzcG9tZG0rQ3Brei9SM1I4MnY1cHBnWHFib3dh?=
 =?utf-8?B?Q2RpRXdXTnhiTThBRkhTdXVnZnZWNEdqbXROR2Vqd3NNVk41ZXRJalNVMlRR?=
 =?utf-8?B?dCtnNGhFSDJIT2pvTVU1MjVLRVZuTDZkN2xSRVAvdVdReTZ6cU1vYWJiTXZj?=
 =?utf-8?B?RDNnaEtYRThTQmVXc21QY1hmS2E0b2VkT1lKOUNMUDI0cUl2MmVBZXp4dCtj?=
 =?utf-8?B?S0U5Y0hCNW1oU1VJU1ZxUExQT3ZVaDhoTXZpVFdvQXpESGkrSGdZSEUvTlIw?=
 =?utf-8?B?TDNqbG42WW5HanA2VWdSeGhFWXAxUEZMNE5GWjZSN1pXNHRhb3hGbm43bXJm?=
 =?utf-8?B?YWVXUStIUzZhbmlrS2FQblVJaS9LT2IrbWgydHpibTFUeU5hcWFQWkV1M2hK?=
 =?utf-8?B?c1Y5aHBUeFlqTWEzQnh5QmtrQ1dBUGJweHMzMVVDV3l0d1pxQ2FjZVE2RGVo?=
 =?utf-8?B?cGZ3eVl3NzdoTDQwK3cyZWxGaUpwc25nU0o4S21mUk04bmIvSVF6Zm04dkFL?=
 =?utf-8?B?cytIWSt4UHE3MjZYOFVzV3FVVTZUS1Q2czFmbnJDWGlvV3FkN0JlZ0lVaFdG?=
 =?utf-8?B?amVta1NaNEtFR1ROQUhta085cDB6dFdXdmgxMFRLYXNsT2NwbEFmQUhUeE04?=
 =?utf-8?B?NXFQUHp2djFLTnp0NW1COGlJeFF4SVFRNCtQdG5sVDRSeG5oWnRXdUhMOUFv?=
 =?utf-8?B?NkhKdzZ6bFE5UkQwa0RZejZPYk90NzZJMnJkUEVSVkZlczAzd1JqR0RHWGtQ?=
 =?utf-8?B?dVZCTFhTOTZ0aTZwMTB5QmdBem1Wb1RTUE84NnQyOHU0dUtkV3IyWENhNE16?=
 =?utf-8?B?NjZwTDFDYkIyaGhkc2RrdURvdlpWYnIxckYwa0cwN0pRNFYxczRlZFVzTHVM?=
 =?utf-8?B?ZVYwbnRXQXRDZkxMby9udWFVckhPam1BdnBvL25jSmdiZkZjZkxDVTNlOUpR?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8162c1fb-1eb9-47b8-5bf9-08dc08b234ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:07:46.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6oW5HnwdfZvOqTZxmUXQ2xFPe2BRNPYEcgkGnn/42jGwWQ0nA9jqO2O4XclXCUptOFu7kOhRDC7Nzj7nHeSxfNZBdWgOdHqLwiMO0JjmM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:31 +0100]:
> To simplify logging and help identify SR-IOV specific messages
> related to the GT, define set of helper macros that will add
> prefix to the messages based on the current SR-IOV mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_printk.h | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> new file mode 100644
> index 000000000000..17624b16300a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PRINTK_H_
> +#define _XE_GT_SRIOV_PRINTK_H_
> +
> +#include "xe_gt_printk.h"
> +#include "xe_sriov_printk.h"
> +
> +#define __xe_gt_sriov_printk(gt, _level, fmt, ...) \
> +	xe_gt_printk((gt), _level, "%s" fmt, xe_sriov_printk_prefix(gt_to_xe(gt)), ##__VA_ARGS__)
> +
> +#define xe_gt_sriov_err(_gt, _fmt, ...) \
> +	__xe_gt_sriov_printk(_gt, err, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_sriov_notice(_gt, _fmt, ...) \
> +	__xe_gt_sriov_printk(_gt, notice, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_sriov_info(_gt, _fmt, ...) \
> +	__xe_gt_sriov_printk(_gt, info, _fmt, ##__VA_ARGS__)
> +
> +#define xe_gt_sriov_dbg(_gt, _fmt, ...) \
> +	__xe_gt_sriov_printk(_gt, dbg, _fmt, ##__VA_ARGS__)
> +
> +/* for low level noisy debug messages */
> +#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> +#define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) xe_gt_sriov_dbg(_gt, _fmt, ##__VA_ARGS__)
> +#else
> +#define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) typecheck(struct xe_gt *, (_gt))
> +#endif
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
