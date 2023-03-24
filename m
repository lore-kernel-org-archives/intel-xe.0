Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F2CC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45AC10E505;
	Fri, 24 Mar 2023 07:14:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAFF10E505
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679642084; x=1711178084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8DjCM31tEU7JvWDwou05dRVue1D26W4M8VQHukDkkgQ=;
 b=ieeTMB/5HVcE8c1Q/pFletgGJvkXVQpg5M9FcZUWAPGPdYatDTCb0gos
 wnkkUBYS65HtREHfYoN3LGF+tq7pdVNkOIEx956BzQgG8YHHHGYvguD5s
 AV7kUGtLXXtD43Rz4KOdedRbtsiTaWH0QjHCBDNYiA57ql9npMNek+vJo
 G1PoA6kxJ4f+rTN6KCmuwnKKP+UwdkgESlEkLmu9B6RaPtFueQD76hz+s
 /IyuG0lE3o+JfMbGiDt3ujHx1LumXkgmVTSrX/SNrvnwFqf9GGsqKQXbe
 cX7/ur4BN6eaJBqtnfmJx0+5inQ3iTQAInku3AfRmZib5g5VRJYai2N2/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328127773"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="328127773"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928547583"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928547583"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 00:14:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:14:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:14:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npH1CAgPByT9rYtL9njswsIaxdgkvSkUqCLJ0+9GkHBRUwB1MvfLLdUFi7JEpBCTzsT3K+6Ii3gDduxqIJKR7C07x6dm9C3fG//YdBY/ystvZPKwkVC2jjMM91jE1u4RZyzKDupJ2FLcGcfZIylWRAOmyCUNw/dEd5eL7IYrDYDzeVPCGW4c4VbUQYU9YpIDaRV7sFrGDk+WnoTq1NhoevBPN/b9P7FnJtR2nNUWTv0TfwlT5q9jCERvw1qkLXBeVEC13iQS2wWjh2a03uhbevq3HoW0dZuTf7kXj3ylJ8NYHLa+dvY9TAsDKd14a/CAmzltj2vlLW8YtPiElnbrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlcWEJ+mE520M3n3W0Ds9eFks7nUp/cS+IXUslrtYwE=;
 b=CjT4culaglCLSBAfrk6fMyP2f9sKkRExli4jSJj7bbStnuHcdbK4LonTD3+lHaV5TMmK8QD2O8dHcfUgGOMLq7+wOHCn/rEghCem6efDs2/EWWzsdB4thJE/BFIml7+u/l5iXLAzRKjcbLLP7qLahjmfqkXrjEZo4bwzBVlNcm7Zef5fhdXH4331GDY1sNSQPgvEdLM58TZYEIjadlWl+jg0iD/0fgzBSREHrhe4sQGqiyTbA5Z9lq6jlJxtKAEZ47mb3A8H6AZbVDZRYIh2J6yFz5pjx2UUv5JF7TaCcnI5uHqxhPdL5K+al2rxfRsvo3xW8jtCpncvy9LL096jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:14:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:14:26 +0000
Date: Fri, 24 Mar 2023 00:14:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230324071424.ctpkvjhsuxbp3ghx@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230323202313.3523-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b5596f-a5ad-4980-e778-08db2c376693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: huYk46djYDNkLKHb0tNwKFNw29dw0XtkNyuh98d8K2LQ1pB/PotpI5vwGl7/oWDHuj/wN9NRTVcKnb9iA0Gl8lrC8viL/GkkOEoB+ZjGs9Abpb8Ds0YD3Ax45hz77H3TtPWa3UQxzQ6z7+XDLoeJVdwPK1wGNKV2MyHcnhz44ZHCrz8+cZngjE/tQYCsT4iVW7N1CHDZKaRhvCyw6HT9YKDEk9GbSOdQSRhqQxVAzww84YpOJn5lIp4i0RAfVMHkCp5kRslK0t+D2G8CEbyxUYyysDaNlMN+S56sBnTgLo1+1MmEUhY9laGWektjHlk19uFC2p1Oz8/rG44FxVAiB7kaQhN1RfthKpb1Gua7jo4sivz49fTOK3DhKWH5yDoOKbK2X1jrfmwnQV0UqngGNH0qKpkBM+VJVCAfrnJVKiXf9o/wcdq8KiHQoKO87h09sqDcGdVyxJq8jjhd/UWVLVQvjijIa/mr8joACfkclq+Fn9HI9/wJFPQHctcMV7Y5Cx9N7CWbO4X1p1HJ7FyxYcW3ZPjTRbhiJjHAVwQ5b7rhxYWqiMOz286KrCQtAV5P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199018)(41300700001)(5660300002)(66476007)(4326008)(8676002)(2906002)(86362001)(36756003)(66556008)(82960400001)(38100700002)(26005)(6486002)(1076003)(316002)(478600001)(6636002)(6862004)(66946007)(8936002)(6512007)(6506007)(83380400001)(186003)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ISykj/qTbug/bCCtnC9CDp0OLqfIs/vh7Yfi6dxjpbSPLGM6HeY/PyO5wQE0?=
 =?us-ascii?Q?+c8qSiXedSHD427c6krhijTTRMWduxuHe8EqHzCJi7T6Bbbmu6II6fzdEz8X?=
 =?us-ascii?Q?Kh5Jr/TKkXJBoxi4snLQ7Q67CxVIwQ4WA5WeJb+6pE7VRi7m6QZN8fv9DSCh?=
 =?us-ascii?Q?VaoA2T7Iwz0hqqloFL6Woar2PFRXovHfY/EC0owkIJoWUr9qMk/fybPkdesT?=
 =?us-ascii?Q?3KRJscdQf8ZgoVLI5N8S+lN+A92ydcX1bkQ/ZSQZFmBjZ4T4uaUD5JaI1Cen?=
 =?us-ascii?Q?WKLyhxe1IJudTjrq6Tma6SZhgt4odwfTiVQKRw/boXatAxaqJff1axTN7jec?=
 =?us-ascii?Q?xvwqVGxjmg/VLVFUtPlwlBOtxePZHav0m6JABalzcp8pOQJo7wgtr1KEM7N7?=
 =?us-ascii?Q?UtCSGczumsvibFOlm6GPdPGXSdYBMPUokXmL5YlpMRZikcY99dgUebEIgJgY?=
 =?us-ascii?Q?OvVFSva0RasLMWpYgn35+FEczEnql9/3UdMyXEtr2iGkR41Wfb6XF9XcVOXV?=
 =?us-ascii?Q?tV5YiAwQ/8iyDC3i6L/257QRccqq5C1z8s6D4uMPh/kpccUAaOS6REbc+30k?=
 =?us-ascii?Q?hNdDrKBccLFh1CMAL1EwPELSrnTenYtj9o3RIwZ/x4Bq3cXN0y1jN+kOZxPS?=
 =?us-ascii?Q?iTxP0TVqU+1dFiR6loloF9+LrhgZIbUQNDXx8n3n2uRsAO4a8xMVvBHFWJnL?=
 =?us-ascii?Q?wm6x5X0SJx+cL4UNE3UBXPHj26O4QiY0+RaboyiJhO7iGI77phnoRZWr3/du?=
 =?us-ascii?Q?Udq6ucHxNOqiXhInqCZVxo6DT1Kh0H9OENHF4aAEsoxx7OCgSoCPIEWWNPe7?=
 =?us-ascii?Q?WIs9g9MaCSRm+M2IfH6nUbuS5Zq0NdJO7CSp8bK3au2/gi58HS9nt9/VEOrH?=
 =?us-ascii?Q?GPlmqNeLKXKLUwVSDDFJtRPwUblYkZ7ngWcCPNxiMEKdjDPS7GLhWIpRpkM/?=
 =?us-ascii?Q?d/4abt0ZiZnyVFcUA8lwylgoRqtMZKQg89vJLr+ySVt38RrVAl7OhULQqb/4?=
 =?us-ascii?Q?ZS4R6X6Kt2QnCH/54FWO78AURkkqaRiZgJ5qrlCMLUGR4fZC6VOQuNGRKA1R?=
 =?us-ascii?Q?DMZ7bV/ia857x9pJI37yNbAtqp1DcBCR2krrvy8FJogkLON6UgIBesvx8KT9?=
 =?us-ascii?Q?Jejvkm+/gAfe1YYZsK2HG2oh5pJmUbP48FpjQoodtktHVkE087d6hhSW3Y+9?=
 =?us-ascii?Q?btnU7faR9JTE8xraDJCvTf7ijaoHtGi8wFDXIbbXbH6b9pNC8wNMS9o+4quq?=
 =?us-ascii?Q?hVggGEd9hIk+ve6MhO5wpKENNFvkhvucpJz7cbCqxmmB4uaNuGxw1w0Tg8qy?=
 =?us-ascii?Q?DDZXf+Oxq3kUowK7t2pddwe6FLueB04PcNYR5Q/nPLwuOSsZMoA/v82KIwp4?=
 =?us-ascii?Q?DIMvfYVthYcjbBIkwE5yGFaxatgghR6UPWqol8YyalqlLX1LhHYSUNWnTVdu?=
 =?us-ascii?Q?WfTAaYS2zWErLRixyuVbGv/h9wDeFiB3Y73sMwtGC59AHQKkd2rx6P4c2y73?=
 =?us-ascii?Q?2Ncf/6+D1dX7FUCJgUSjPhH27ttVCemv/+hRXM4QkGwOyOrcrPWQ8Waze/KD?=
 =?us-ascii?Q?KXfiCnyb2dSeKukuiSFHgmIvM77KEeymay73jP+ZSb02GUSFqT8j4CvwyKZi?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b5596f-a5ad-4980-e778-08db2c376693
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:14:26.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NuPziUF0WFCyGC57CLZfHvY8i9MaUCpivqCwH3kXDoh5P3FvOmZ53MFdOkSAqaes/+h+92ukDJpuK9y94eFT/dE5R1D8Lv6ztiamQ/d39E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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

On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
>In general, this is due to FW load failure, should just report
>error and fail the probe so that user can easily retry again.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> drivers/gpu/drm/xe/xe_uc.c | 3 ---
> 2 files changed, 2 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index daa433d0f2f5..8a436c95591e 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 			goto err_force_wake;
> 	}
>
>-	/* Allow driver to load if uC init fails (likely missing firmware) */
> 	err = xe_uc_init(&gt->uc);
>-	XE_WARN_ON(err);
>+	if (err)
>+		goto err_force_wake;
>
> 	err = xe_uc_init_hwconfig(&gt->uc);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 4ccf2b3435e1..70eabf567156 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> 	return 0;
>
> err:
>-	/* If any uC firmwares not found, fall back to execlists */
>-	xe_device_guc_submission_disable(uc_to_xe(uc));
>-

now that we are not disabling submission, isn't there anything to undo
from the steps above? if so, then the goto's can be simply removed?

one thing that seems very wrong in the previous state of the code is
disabling guc submission if huc failed.


Lucas De Marchi

> 	return ret;
> }
>
>-- 
>2.25.1
>
