Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE4AEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 12:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24910E431;
	Wed,  9 Aug 2023 12:50:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC3D10E434
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691585439; x=1723121439;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i1qE3YFRmYHWSPZWwlSFmrREuI+jods2X3pgwXLWE14=;
 b=b+VVUCj3h0BZG6WUn+TSEsGCic2ebioEnCwi1ZmBfClG1KaO2xZcv9S4
 /4nG2cKg2pcI0jX7MJHmlvnZcc/sN54bnLvuxxQm8CjH8pyk5ohgTE4Rh
 AZgbYUqFtEjgLHKx6hsq4PgTSTqXpt2kkW79EiPHdvwWQXMlDxkht0GO0
 8H1uR/fGyJge0fzFUu//GtF/r+7rgsNd8J1Feaemt4X0M06eyi4paYiP9
 C1rjUqFSYsCFrsAlfaDc9iylkWSrnxEY52d/ULawCxdYZbbZtvgdLHtJP
 FvVeEoDY7PU7EKln5sErrU25ESxNy5gpxs8mbu4qqxeic4XWI9lO7YBxK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370014462"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370014462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731806305"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="731806305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 05:50:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 05:50:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 05:50:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 05:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXKjaMR3UC4KlthzNvNlvwDhbvn1ib4ugjuEWQtma0fTJCxnADTI3gaeTyYSHbCw5d1gvx7GpaI/nbTMmo+t/cM29HH2HWQsuihss/iOP2TwdvRgcnGKldMFGbzUN45awERzbO1OVb7wlFS1LmniROTZ7PY2TfX1iUt8Q7q9+3sYMFykYjxvY+JghXtX42pUtd25NvwGz4bZSKoG44rjPDEipXf3TT3zNHTgBawc2xvL5jfT69Qxsj+bGnBARBYWnkUmMJ0Bx7Hp7TqmdP6GZT3GcP/+ZJMvI72ReY0/jqFYgkahHue1td2tp13uidlZV9/t7Mj6RLx1MZTA30c1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx1krzlUDENk1fPbjYqVExZvETqI61/ZjhZFzKP7Dvo=;
 b=HSyt4iTHJkZRKZF3jSCdmQSEgFGeGZ6VborkakKBiUDC+c3sHmjDW/4ftn+uVeTdhlQjKGOLyTDaYNjmuTqBPuTFAPdIG0J3/n+0vY/8H7JNJqO90h3ve5GgtqK3IWa1OgkEkPO6ul+xXvRk8CgALyhkC8seH/ILFQJn4RTyA9kxS88uJnlQuOSI8liGokQAFhV/BktqOysdi9neaTwS+OAYL+Jfv/utwslXwHqXpCWXuDueO2CSToYGKV/A2twrEkvt8QMcnlkPaL+sJkcZn6yxVHLR9xv61FedhCVJpRdErop8iiaHMMJf19/HCXItjKfipVwU0MOwccKpH48Pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:50:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 12:50:35 +0000
Date: Wed, 9 Aug 2023 12:49:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNOLUtw+QyvAspCs@DUT025-TGLU.fm.intel.com>
References: <20230809084423.188541-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809084423.188541-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e306a-d957-4560-111f-08db98d7399a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dfoEv9cBuleNoJ4gMj+Qvju9a5VazymOFtuFia/jcpEhhJp1ZM8Lk2OEKROWoHDKlV9YrJjLc58P3NR8yCGoNW7OBKCCvOfr/6vHzzNWCjAiZUQ8ghDIObA/GP/thp03ePSix2jR7xndr23iqnAX2cS0mXDu9jLG7N2PosxgLZEqTCSOwZsVK7sPVHraTS+0YcXvXMGZ7ks/ql/Ih0NUVtnzv8RrGWnqxPl4YrAD0V/Vt/m4ReVE3zPYzcgCRXX+b34jhrdiJIc83XxjDmUxJoh1Y6WdRb95HbivTTf5xPgj6xOqpi8NV2JoGULA2uKStoSH8uUw+KZg3EkbWh3LGePIRG85RhceSclaljSoCO8k1TVcEHRHcz0AOtBxAuS/4L3FPttvQ8RFbNEIwTOF3NCpHMw8E/KJj3y3f4haYvokMUbjoV7pl4ECgco4aDBtOgM09WnGavpevMaSJYIdeROKM7tVQwAUZLxG/+XHT0t8V7Xdn836fBQfCKnIecO/p6IO48yU7H1yA7pH/Neu5l1ps246N5V05f0VXPv0X66Szf5i2wf/3EBZ6SnBxsW2GuVGXAsQc5Suf6pzflKoCqkAQWCv19Rm7S0GQRg/bT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(1800799006)(186006)(6506007)(38100700002)(26005)(478600001)(5660300002)(44832011)(8936002)(8676002)(66556008)(66946007)(6636002)(66476007)(4326008)(966005)(86362001)(6512007)(41300700001)(6862004)(316002)(6666004)(6486002)(82960400001)(2906002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQ8KYTHMP/HTPf1rGq8T+Gc0blFMhTbhvROCXaFGKeYWPhTOW+GBbWr+UqCF?=
 =?us-ascii?Q?UiH0nEht3sX46bNYpXlYTwPvsNc5tSl0UrKrP5atWODsHCTX1T+TOZ6hEbWs?=
 =?us-ascii?Q?Abz8zkmaW+pWbDgy7wuL5uLr9fNG8gB7b/8tYbEnVfEdXJF3+YYOoZNXfHNk?=
 =?us-ascii?Q?AZpvptLo/Iym1tfL8yyOKkzX0+8+4VGXSrVQRw6HqornTTzvE9H7HTFH/PWT?=
 =?us-ascii?Q?QaDKPVHgA4mYIF5+s0bIV946GBDuYjDuYXfpQj3gprvoK0qNtvQaluNGzG9i?=
 =?us-ascii?Q?kpwjy7vPg1QCtt5EPwzhR0ygJUz+ClbDYFSHZNq6jVgartC+7fmpZA9YeTKi?=
 =?us-ascii?Q?Fd6laMv85gidWaSUo/5UVnt/MC2M3wWUMKjZmUoLSdvcReANdJ2ZQAVHyPle?=
 =?us-ascii?Q?J+VQTWfzFkvYTecTX38EkFjTMmTtFselv8UIUjvkjQfwBcPF6pTw63hqOANt?=
 =?us-ascii?Q?gWwhGV3k8jGVPXddDhw3E87FEi7dWjj2PRL98R7RxRRV7wMk9WPabCSYSRY7?=
 =?us-ascii?Q?n1DIhjFiORn2mkaR1bZEDQzUKqunq1c4A3RNzlFMQ6mwRtO2ZY202ZTKKngd?=
 =?us-ascii?Q?dzV4LrKjDes3OLcZ6U0F0DpCSSAKjwnXeL5YIfgPm0An+AFOVX/h0HrZDbIo?=
 =?us-ascii?Q?/mc2b4AvQZmmq8PttXqZp98mxVNScAljvwGWqDOekAz2//XLyfI/AT+3uqlI?=
 =?us-ascii?Q?CW7TZq+TL6pgyu+zQkLGWjt3AdZWMfPZA/A6v8D37om0UInidPtPRBbR+D+l?=
 =?us-ascii?Q?IVVBzYTVLHUZ48L5Zf+H/LrcafZnG7s9p1xI1CyYkE8Kk5+N2WzQe/qs3nYp?=
 =?us-ascii?Q?x2nNRJ9ZbKLXKC/4Qr7qfh1DZa0NSCWQF0HFUm8gXkgkMs7Uy5OeLycrnWIk?=
 =?us-ascii?Q?7CuDkAbrTYNIXyICoIa6TMACJNjktcHdhgoRXFMKccEMkIUNYqFSMeCrwP9e?=
 =?us-ascii?Q?8/e2tZ3akcQbgLVkiQ0y4inbQch6NFqMXx2wPjqwjjc1GoAkakrttbITPxwc?=
 =?us-ascii?Q?pEj0ifGq+aU+1/GwUMRWK7y1/Bj9uqceY4bczYA3YSwsB/45W5HnUcJRFULG?=
 =?us-ascii?Q?nvjrXLytnA73u4S91rfOrwVGPVvyEoz5JuPYMcu3jf9EBZyDwbb/KARyvtZ4?=
 =?us-ascii?Q?Ps8vdaZjXg8wmpsujIc0TNUVxTEWtZpGRjXpRWPIh+CDc2Yaj+1BjMQQAeFc?=
 =?us-ascii?Q?Ez8a0sor5/7zSkVypYmOq1Kzugu5DMHgDv8lsZEdRvwW6hTn5PoNhGsSTQgL?=
 =?us-ascii?Q?R00DrEOYImXdUkRYGWFzQv3KgxSY7sbu17tK47sceYl3g44JJEjx8oN+wl3R?=
 =?us-ascii?Q?uHxiw6O8VNg82ZuD7nqrTuqrX4Jds38RlvTK4J4or7lAamCTgSSMbL9BnX5H?=
 =?us-ascii?Q?P3jwmQQMefrq+9NMvkRaOyFnvyxIy30yJuASzrYB7ya5tHLkbKAwui9bAdHu?=
 =?us-ascii?Q?HuuJBra3su1J4eUjfqMAsozdq/DXZbxctPcliFWdGkuTHXkqRrgstw0pjeE1?=
 =?us-ascii?Q?YFJZA4lyc0VrxgHBbUJmnk6R5/6gzoYgWJfG6EnXL07DD/M/8l7tWhzlFRqY?=
 =?us-ascii?Q?zfu+oML9J4y5LaC3/qE8DldQhQRuyc1h77sHZ5tpkKksFOVvEzp1V+aSjRNO?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e306a-d957-4560-111f-08db98d7399a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:50:35.6804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW4iQf6Ing/2BXXcAHbmIR4iwRzxpt50FbEpG85XgQpzyXpndSzsGqI9qJn9RORLbA5TncOSOBN9T/A37YW5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't warn for bogus pagefaults
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

On Wed, Aug 09, 2023 at 09:44:24AM +0100, Matthew Auld wrote:
> This appears to be easily user triggerable so warning is perhaps too
> much. Rather just make it debug print.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/534
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 125e4744fa38..b6f781b3d9d7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -265,7 +265,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
>  
>  static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  {
> -	drm_warn(&xe->drm, "\n\tASID: %d\n"
> +	drm_dbg(&xe->drm, "\n\tASID: %d\n"
>  		 "\tVFID: %d\n"
>  		 "\tPDATA: 0x%04x\n"
>  		 "\tFaulted Address: 0x%08x%08x\n"
> @@ -370,7 +370,7 @@ static void pf_queue_work_func(struct work_struct *w)
>  	if (unlikely(ret)) {
>  		print_pagefault(xe, &pf);
>  		pf.fault_unsuccessful = 1;
> -		drm_warn(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> +		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>  	}
>  
>  	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 52c61f78b083..0418313c92eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1643,7 +1643,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_warn(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> +	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -- 
> 2.41.0
> 
