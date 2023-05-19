Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7491CC7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 17:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AAB10E087;
	Fri, 19 May 2023 17:28:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146BF10E0A5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684517314; x=1716053314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FbwFxk7UEUndvMmQuLe+SxfMGqEiqraWzqdlKG7skkw=;
 b=RxTZ4qeOkumpsDqX6eZhCY6OXtrZyfJ40Ynpc/Pk2kiAQxpYB8bZDP29
 hOD8e6dhNy4n3rbY4jVifoMExMqFn41UqnqAC3gq7SJ7ReMNTz6DjaAVe
 vd+5Lh8aDgr/wJE+WV/39M6RxhizgQw+ccxji5dmubfNwaMYhF2b52bzh
 yd+JUmnylGEtEWcNMvEMqKx0AYEBA9fVhkxXxTVcSNahzrl28mmOGGQC1
 Qr6ATOwUMo16bY6WwOnORjkLsNV48MT51VI6SaQa+jRdg/l+Rs9XIyAxg
 Buvah+DDPQJWzFgkfS7rd2EQ4iei9kGZsLGz7KVdrx7Kl+XQkuYnYnYb/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="438784751"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="438784751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 10:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="876916851"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="876916851"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 19 May 2023 10:28:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 10:28:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 10:28:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 10:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqvsTjb5jgRCoucheQRjtSlanpMfUR/9gbSzOhgpjJdy6RIU1ulPRXZjxkaTgtqnhwP/v3a5hHKPEbvyD/MS+UObOfN9fvVBfMWN8S2aR+Aavgk6cYwgyP+5zBf5q835rQOHNRUX2ONNR5LMJLfcRSRw/d+iZdYwr85VJMSeOG9Eyx3jjKVRQNratjN+DXW/+WzpfNmHI/u6wiVUgEuVhoOaU9bHbsKiTbD+lLgbdfu4aRtn+cz7yn9lqstOledZWp7AbIH8M+O9mnHmvAdn2xinxM8lZdhg1Ou0nHUz1BOruFFPJNGyLB/RUBdvtig2R2UP5CPSS/wpcHne25Aq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGK3qmatlmIHwXlQozDhbacbcVttiYYuE+L7cIn8Z+8=;
 b=RdencuECMwOJ+c6plyKEDCiWMYJaP2+CGJhCMNsBIbKsUagS4gCainBUBvSftf6XfTcBGpO+8/nsKXKJ2ffaUZndbFTUe3ojBV5xl/0mlY6JhAvfQ7p1zYMenlijWe7Wz9ipbTlXGQhIdM/wxkqRSL/MytUFP4mG/7RpF8a0dj1o+wEKVaqaQkhljZLXfjFD+34TfHLGhBXoBrZwZBcRSju3skrCFWeVbXz9TUgdj8BNfesJl41R8pWKTGOf/3LNCIhKeiWSP7j4QS7m1D5T2vHMQzFhAU5SzxxUSUKVxte9o0sAmS5AGBKQTc1uVfd66Pm4u4s3soKidl//TCZTDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 17:28:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 17:28:25 +0000
Date: Fri, 19 May 2023 10:28:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20230519172822.GG10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519165927.1204-1-michal.wajdeczko@intel.com>
 <20230519165927.1204-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230519165927.1204-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2d0dc2-486e-4269-c4e1-08db588e73cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YW2Mt51morQn9dkd/DhLWYXbAGIU5MiyWgdLNX6NqGIGsvWcE9h+ZwDCo6aX+b+owpFZLjLQeFMjYTlTTi14mruxa4LH/JGM7WWGpefDwXWl0gFjDzyk8YofZgoH/et8FXlUSVVU0gXUFrzCHe20RKQtZUEFgllgpNZiGGcn/q7zEApUniQfadP3IaGYA3y+IkXqII0im5FAwBxUDFRcRdJWltX+vuOFEfYA+QLQoe3UmAIrtmBgWh9msHEGBtdgzRYh6cOw69g3RXanLMT8TZekZgnpvDn34dFfPyNwJAhhCYO0nyHJXv506fGHtEQXGZXhEGgQT/zuk3RUe0GMhwN/Z8RCOaXTYKIdNLhG/ve0VPMgZD9UGl05r8rXhWOtFFZJl2YK3STWm1KefPlvc0iHA6KuCcVWO+EKOygA50KstaCxMloVINvVRYHop0I9OP4y5Ozi2h0F/YUuGHv2DBHapnkD90OvPvtDFzVEmDGOGF8J4y0z6ZdbwGirMrL/DQQoN8r2+h5KNVCBcwJdQmQ3vhtrVYzOZeephd7pV1AB6Bj3xUZgpEH+Ajo/ezcN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(6636002)(4326008)(66476007)(478600001)(66556008)(66946007)(316002)(33656002)(86362001)(83380400001)(26005)(186003)(6512007)(6506007)(1076003)(5660300002)(8676002)(6862004)(2906002)(8936002)(6666004)(6486002)(41300700001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKapKQugf1L/mXJEnx8UkDjO+NwIrxPZ7JUQOcxxGqmIDhEaFr3+VBdN+9jD?=
 =?us-ascii?Q?YGdfJemmwJAkGDBrvuNiG6sIjS2tFUR5MDRw3fXZUoxkqDvlZ9A+7SD2EYwH?=
 =?us-ascii?Q?PKkjxGnXoZE8rCuGjh69Qy6nvCtYz8HrIs0sYHavqmYDvlUmgDPGNumsCw9h?=
 =?us-ascii?Q?PUFr3QPxY95DF3tJDNe2xCzku+meg1KX53XCrX526QxNdr4PKiFV8RwIlZ3m?=
 =?us-ascii?Q?5ieUjLzaUUy1/9lsNuGxphDgHAMCQ66WByfZ/ArtAohnyf4jCSZ6veTqN+hO?=
 =?us-ascii?Q?G/biljfOi9uN232oMeGhE/c5+4U+tO1kZ5RJKRPrN1CDXH1pCoGfnw/FV3Lu?=
 =?us-ascii?Q?uPR+Kxi77sL+LFbA2xv6+QJOVh/JAzTTwFdD8IgVR1PcgbwC/Mi1hnKb/P+5?=
 =?us-ascii?Q?f5sRR21bizVnlDXbKwRfLVz02htWT9lnBK/kWTFPHLFW1N6gzx/ne73F12T7?=
 =?us-ascii?Q?U/3Ct9/R/781QWsJKZ2tMQMGIixOdA67FvDnNoXunydcvZPM1tVTpxt6PNSc?=
 =?us-ascii?Q?37RIr5NRXyenJlsVA+7gwaJ8GmSiTItUtlpL0ghgtGe+wWbtYvvtYtXNbrA5?=
 =?us-ascii?Q?8bJ9zahWnIuY2cA7sgja/NciVN3WYyvI5GQLDC+Kb4Oo8o1tZYgOnc6b+ApR?=
 =?us-ascii?Q?lgKczhCZgpLbn882QxFcnas+/wISLjw+RrjRRb9Gxu2JCm4hx0Cj9OwRtNJ+?=
 =?us-ascii?Q?ERFE0aewkyMhTcYXXzjFydU0iCHplfI6UHiadlWSK+xQkPBXREX43y8UdLXQ?=
 =?us-ascii?Q?58jLmZSaQwO0xOLKj9MPKY8eyrdPY1Eux5E9Wnv6lx66QIT+8izYKrQWmHUG?=
 =?us-ascii?Q?Bz4hZzOTFSEa03lps38L7mWLoAypWiS3h7wYi9CbVqI56hodjF9/1gpnOF+R?=
 =?us-ascii?Q?y6Xq1mtjeA/8/wTAGKUyZjayvKJZdgrgKvCrvWufjW1AQAujWP18+qFaAPs9?=
 =?us-ascii?Q?+o2zGyXGXWyjosmjCpZ+zm0VvB5X2ByN9VhWqd4MVtNAPjPiRR7BY6XCW5o8?=
 =?us-ascii?Q?ZY1HM+jOyGQRR1wUk6s/p9K2R+uUlrVSNOBNJXfGiFSVBGwlW3dM7ky61DUl?=
 =?us-ascii?Q?qE8nywM+6uuaj441fPnwyvf1gcP/00exeEZmyqJWPOrXnbPBPaaXoS0aGTYE?=
 =?us-ascii?Q?8puCdfwQ/0KWjj9DcZTiKIdnygZYSjZ9+trrrjAmyz3ZODF+b+dz3JdhERGj?=
 =?us-ascii?Q?Pj/Xycwfyou7vHpWk4N7LHHeazEkfkDcwE58Qs9X2ji3uvWJIrmTegTktmWE?=
 =?us-ascii?Q?YIlwPQafGuWep81LEMfWRozH3+Cyz4tBv0hyaMs/vKNwXTg+OFtZxLl9Tuet?=
 =?us-ascii?Q?6tqlpRHS1PSBdg2MKRwxcihwO4lxwxdi6jHeWn0P4iRk1hBXnepIedwLY/mq?=
 =?us-ascii?Q?0ftez9FBAOqRikxECz6UjaKSACEXPZAHYKJhh4FNZqgB/qdRunu/Nd1J/82W?=
 =?us-ascii?Q?oRsdL8yrOaWA+lZkOGPrsfJ2JceEJNzX2Cc+gxI3HFlzOvKNX+xLkG7SG6fT?=
 =?us-ascii?Q?s4/bYEtaPNxJ6REgQQkcs3hQCM2iPAjbQPq6cTBzwAu3zlqTgjbOZg+uLwvp?=
 =?us-ascii?Q?26Ckd+WfOCKY5HzzC/k5DOf+V049wgXr7fEynHooNo9RUyYzikKVXGyuL9MT?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2d0dc2-486e-4269-c4e1-08db588e73cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 17:28:25.5938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBUOsfkIBPPtShhgqfYnQtiwkCEdR36f3gkEvYCn1ECgQZWj8lB0VhgUuW41OERW7nvQHO6EbFpdLmUOH6zO47cnm2ofRHFJlwz7EZx/x5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop legacy GuC interrupt
 register definition
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

On Fri, May 19, 2023 at 06:59:27PM +0200, Michal Wajdeczko wrote:
> It was used by the Gen9 hardware, not supported by this driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index f08966c2be20..20430927eafa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -86,10 +86,6 @@
>  #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
>  #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
>  
> -
> -#define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
> -#define   GUC_SEND_TRIGGER			REG_BIT(0)
> -
>  #define GUC_NUM_DOORBELLS			256
>  
>  /* format of the HW-monitored doorbell cacheline */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
