Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93104C001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAAF10E14B;
	Mon, 31 Jul 2023 14:31:29 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950D10E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690813886; x=1722349886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0I5hxSI63Rj3cHvRgm9FoSctPj3JMR2woXJM6el5hcU=;
 b=jgBmdy5ZSBSYgV0YKdWksdxJcQ5fq1u+PpnobjEbuy+bzXNOO3Lu+jW1
 7vd1jsacPbTEJdXUNXcGIlqLCJjZrlv/HQ05nNGC/n4RL/u5o3mVnq+Fl
 19/qYnrTR0k2+4p5Q49dSherfdnw09ilcPvY3jGHKkupF1nDW5riSvWEv
 uJAH4jVLzDn4eGQQNoWE1RHs3UPzYzEFmUMnRDGFbv8DfscQDcv+hRaL+
 vihbneR/DwfzUM1ccI4lY25xeSeuiB2pkCD9zmuD2m44mvAIK0QY5F0QM
 RIFtBTahX1D/JyJ6i4tWInp8ZW/RalZGUtbdvnAkDUKwDlNnqILU5UNlW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="367930629"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="367930629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722099761"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="722099761"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 31 Jul 2023 07:30:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:30:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 07:30:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 07:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO7NQeKoyjDm3InLTLlwyL1VsxI9C9oQdhUNBPv+gjet7Jk0pn6tUS6X1toghSluNLjaLmqhmN/2uoAGG9wrkm9D6sf7WZX1rm5hd+BAHf7eqJAt+Lgf1CzhXqgoKlhKldWUZSIW4AZlc5NRsk4Ifz2bsH45gwdXMcmDZdAFB/yjjlCxkzbsyD+2EELexQelgL8lWoQ19Widv5SiQhbBe4Ujd335uitcqNrgdwHQVufXVKpmKLQaQn8at1nGHKcvCRL/d3AFPg2iYL7oMPGEtUQgn/qiZfJh1vsTF8PyuxEb/4v8n9BDO3DCBoUDLudxPaOnSPyeyMlyAUh9hV1a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpY2DU7XXJSKTGxBObnY0UtehjMGWS/TEbrJ3YTLSPI=;
 b=hjxgLvaFCnggijaLpILhJF8Ep6kUJ7aLEhMNuuakaX/F4p2kQf8EVZwbMf7faVhhEiYaMjBWEYT4udDxJ/wAgPLfD1ZBVPRP/Ee3K8LoaocfPJHAmfkD+e9Cx+PtWZSsNiXjVEzR1GaeEl7MEjkEm8xZnBCBuiDqpH3RefBQcVX6djig/255fuwTtQOm6HVV+8hNfunecyuGxJjruN9LJ2Su4KGxP4JC3d9/zrHpXsSi/90n1reQj7+m+cnMzMA0mu+fdX/wC4HoECu58GnGafl+C/yAhAe1HS4MG9wj8UYYe6dD9OwIIoyvuts/0z1RMNkPIccuze7T8ZSS9VCTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 14:30:13 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 14:30:13 +0000
Date: Mon, 31 Jul 2023 20:00:01 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZMfFaXW7607Cy45j@bvivekan-mobl>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230726232650.3873897-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe21a5e-9450-4b5e-755b-08db91d2a6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+weMkQMtLdkRIHaZAU1CldQfGQEbBMTSrD6yVk3N/rmviHTR3j6PQO4IA600xptOK0H3vl094VwqY7QJEAIB4NPhqurwYK4UUi69pXijjIMWpdn4kG2GLbjatNvwE8y6dooiKyE+hlFsv/9JUneArCSsU1gLh8OkcEbUN1MrtM5d3MNij9Zkh1BmNQ5SYonHxrakwv7d03ktfnQPneOgF14J+uRS9/UaaW/Hht1fhyAghwS6qegpd1eQcBGqV7OPXr1zGjLVRAiIp0Qgzd8PV7uEI4hprEf61ue1igtPf8wMR3WWFqYmB4IYWDSXd9YdhzfU0bBuAy4X/mlKc2VUyz0Sr+gHsB3OCKYBri3Xlj+ZZMUqtf7YYz+FTIOeHEP/I5QFL/cgyG1TvhjlvSYlIgvVPUoXh7Js1+oNaY+xUu+RD+Lxyet0AXkvH2mQwg8zhBDbs2TFK8UPSKCr0zPA2nroUwmGIJbm+3tgG4mNxbp6iQyqbhB5lb6Json/JkunzLOHFsVRviL0QCoKCpRZkkN0+GPUy27PqRYrEUBcj6CWlEBDt5xcIhONP5sMX9I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(41300700001)(5660300002)(8676002)(66946007)(8936002)(82960400001)(54906003)(478600001)(44832011)(316002)(66556008)(66476007)(2906002)(4326008)(86362001)(9686003)(6512007)(6666004)(6486002)(38100700002)(83380400001)(6506007)(53546011)(33716001)(107886003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VJdXVScGZwYytYd3JPMGp5UGpRV3p1M2J6YmhKcFlHa2diWTl1eTZ1dEE2?=
 =?utf-8?B?NGFKVys2NksrSVZlQUNwZGlzbFNHWXY5VldIUHFjWWJCM1ZVcERqTGUvdmU4?=
 =?utf-8?B?U0RHaXprK2pmNGExbnozaFRjbSs2dTBlTFFHZUFxUTNSSnJMbzRFQ3BNajNh?=
 =?utf-8?B?aUlqcFAzdFc3MFR5TXVlY2N2a3FWM0VMK1ZDU3hzOXRSeGJuWnhZYzkzVWNE?=
 =?utf-8?B?alNNaFQ4d2lSazlVbVJyVUtnWlQwNkNSMThkcnFPZXJlN2kvQjRnenJkN25i?=
 =?utf-8?B?T3ZkTUF3YTgvN0hxVlV5cmMrekxqNWZ3bDcrTGlmcldzSythV0tRVjZteFBB?=
 =?utf-8?B?dVpzcmJML3N4VzdqK3Q3N1FnQ1hLZEJLL1o5d1c3TFgyRWZiV21JL0xtdjJi?=
 =?utf-8?B?bnhNS2FVUkVER1Z0WWFOSUN2eVRWNnhTM3pNTlgvS1k4VUxXUTdjSGh4bTRS?=
 =?utf-8?B?b2RHZDQzWnV1RkRIRVhZRlREbjVLTVc0aTQvcEZlalJSRmlrVndrUW5rWWVT?=
 =?utf-8?B?U3NTUWFLcHBoUlhmc3hVeWloUGJ1L1RnS2VwOXM1d3NkMGtFWlBteDJpKytn?=
 =?utf-8?B?NGFXcVhxTkhkV01Nb0cwZS95UnpKYkFuMmJHRWFqNDVUa0paeUxnSGl5QWdn?=
 =?utf-8?B?OUdab3Z4UDU1Z1VyZFNRMytyZmdLWjZlTkNZcnh0MmIrM0MxQTA0TnlrZkhH?=
 =?utf-8?B?SnkyVWVjRXJEbjdaeE9salBiTzdzNktoVWdOcG9xelIzUkRZanNzV3FDdUpU?=
 =?utf-8?B?WTc1VVFTTUhBcE5DUWZYVUQyS1B4L1dtaVU1dGo5dm01Nk80YXpibC9qNXlk?=
 =?utf-8?B?ZllUS0MxSG16dExTQ0Q4ZU1WUFV4RnQ0ZS95VW1vVnZGMlVCZDBLc0lzRWNR?=
 =?utf-8?B?M3A4SU00ZXBZZlhwbWVkUERSRElqeVJDVk56ZkZtcVQ3MGxCTjVyaFhCVm03?=
 =?utf-8?B?UEFqRmhGQmpQN1JHcmdQc25JS20vTE5IeGpTNWNicVgwenZrWjVOZC83cm9D?=
 =?utf-8?B?K3lnbEhLakY2aDZXYVo4ai9zUXh1UEJJU1ljQ0ZoZ25BQVhnZjBZdnNRcUpk?=
 =?utf-8?B?V0hVbVYyajdxKzlHNXNzMmd0ZHUzS2F1UVpoSCtYanN3dXRNRFVRUm5xb0RX?=
 =?utf-8?B?c256dDBsUmwrTU90cnRpYS9KcnRHWWhhQy9LRUdpck9sZnlhdTFaTjhsa0hy?=
 =?utf-8?B?ZHcxdHM1YWEwNTZ5WDUzYXhEMldNNWJEVmNWZUhDeCtYN0IvZUM3Yi9peGhQ?=
 =?utf-8?B?RXlRSGk1RXJ6UXByK1RYZVJyakE2a3l4TXNtT1pMR2JjU2RBalRJZ3pRV0dP?=
 =?utf-8?B?SDZvdFVPWUJCMithdm44dVRXVXhZT0RERWZ0QzMxOUIxSG0vWHh2T01WdXlT?=
 =?utf-8?B?Y2wzcUhaUGNwVXhXOWw3ZDM2M0tkY3VreEpibHdHVGF3N2NJSlFoOWYrbHRh?=
 =?utf-8?B?dTlNUFpEaDFMNW1aRDVNbEszTFVHNThYdUk5bEpZb0JZZE9kN2FNTGVNdFUz?=
 =?utf-8?B?bDdYOUFMNUgydXRaUzNZTWlUMGQvVlErU01XelFaWGl5Z3FIN29WK25tRk1Y?=
 =?utf-8?B?cCsxMFBxQXozMjhEMnY4anR1WStoSFZVNy9IR3pLRkQvOUxUR3BsU0s2SDY3?=
 =?utf-8?B?RHdTdWpTVFdrQ1VSbnlOWmx1cjVQT3l3eHk3cHlDcUwrZ0NCMTV4OEJXUGF4?=
 =?utf-8?B?NklSczMxYVp5ZnlwZjNYSGJ2VTZzdGxqZ1pCUFFLT2RtYVAvVmRXU05sa0Z3?=
 =?utf-8?B?d2Ixbll5UE1rYmc4Tk1wUEYrUVgzdGUrMTFCbmNuWk5scnpKaFN0eXZyVkFG?=
 =?utf-8?B?U0hiN0xRY25YTmJ1TnVGT0ExRnh3SFRTb0t0VGFtdzJmRDEzcFBvZGtOZHE5?=
 =?utf-8?B?SzYrUHZMUHVpYU85VURGZlV2M0UzUXNsWjUzVk11TVpyL2R2aG1WemdGT1lX?=
 =?utf-8?B?Sm0ySGVmSzcraC9MUWoxK3lObnJCZmE3VWdyZlhiSk9FMFdVRnBwZm5uZ0FI?=
 =?utf-8?B?TzF3ZHEzK21YUXpEaWpUQ0VmaUlKdnZpZU5tSDJKaHpWeW12K3ZVUkIraE0y?=
 =?utf-8?B?SHpSejBra1Q1NmE2NStUVnVrV1lWK3NWT3VHcG0wa2FQM2dqY3JIbXpuaEhj?=
 =?utf-8?B?WmVuWGErRmhrWW40cVpUc3I3OCs1V3VlamRvUWRDQWIvUmhuUjkxcjdGRFJK?=
 =?utf-8?B?M0prSXF0MWdaVm5JVS81eGJHMGZrR05sdDJBRFlMZWtPRkdmK2ZZZS9zL2Vy?=
 =?utf-8?Q?lJAqejFU4p/etT7e4oP31xXQ0IwDbE/YVSQonmSOaA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe21a5e-9450-4b5e-755b-08db91d2a6d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:30:13.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSSFZV4mBoOJKTa8YJ/NI6Vr6c3mYhOFMd3K3Gyf+cL9u4cF+isgg8cDC3QSSdML6LHxuj/aFpXFtXdfnml8NzlOvC7zklNT3InsYCR2nVkg/AH7oQSmO+TYyZ45hKqE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe: Introduce fault injection for
 gt reset
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 27.07.2023 04:56, Himal Prasad Ghimiray wrote:
> To trigger gt reset failure:
>  echo 100 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/probability
>  echo 2 >  /sys/kernel/debug/dri/<cardX>/fail_gt_reset/times
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_gt.c      |  8 +++++++-
>  drivers/gpu/drm/xe/xe_gt.h      | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 047341d5689a..1fd016e6f7a0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_debugfs.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/string_helpers.h>
>  
>  #include <drm/drm_debugfs.h>
> @@ -20,6 +21,10 @@
>  #include "xe_vm.h"
>  #endif
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +DECLARE_FAULT_ATTR(gt_reset_failure);
> +#endif
> +
>  static struct xe_device *node_to_xe(struct drm_info_node *node)
>  {
>  	return to_xe_device(node->minor->dev);
> @@ -135,4 +140,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
> +
> +#ifdef CONFIG_FAULT_INJECTION
> +	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +#endif
> +
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5e70e486b27c..691e3baf97c9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -525,6 +525,11 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_gt_info(gt, "reset started\n");
>  
> +	if (xe_fault_inject_gt_reset()) {
> +		err = -ECANCELED;
> +		goto err_fail;
> +	}
> +
>  	xe_gt_sanitize(gt);
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> @@ -563,6 +568,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_msg:
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
> +err_fail:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
>  	/* Notify userspace about gt reset failure */
> @@ -584,7 +590,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  	xe_gt_info(gt, "trying reset\n");
>  
>  	/* Don't do a reset while one is already in flight */
> -	if (xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))

When `fail_gt_reset/probability` is set to a less than 100 value, then
xe_fault_inject_gt_reset() will not always return true. So if the
xe_fault_inject_gt_reset() returns differenet values when invoked from
xe_gt_reset_async() and gt_reset(), we will have unexpected behaviour.

We should avoid calling xe_fault_inject_gt_reset() more than once in a
single reset cycle.
We could exit immediately in xe_gt_reset_async() if fault injection is
enabled.

Regards,
Bala
>  		return;
>  
>  	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 7298653a73de..caded203a8a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_H_
>  
>  #include <drm/drm_util.h>
> +#include <linux/fault-inject.h>
>  
>  #include "xe_device_types.h"
>  #include "xe_hw_engine.h"
> @@ -16,6 +17,19 @@
>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>  			  xe_hw_engine_is_valid((hwe__)))
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +extern struct fault_attr gt_reset_failure;
> +static inline bool xe_fault_inject_gt_reset(void)
> +{
> +	return should_fail(&gt_reset_failure, 1);
> +}
> +#else
> +static inline bool xe_fault_inject_gt_reset(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
> -- 
> 2.25.1
> 
