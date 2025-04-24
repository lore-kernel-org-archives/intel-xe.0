Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F7C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 21:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CAF10E86E;
	Thu, 24 Apr 2025 21:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBOMtNKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71F10E86E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745530620; x=1777066620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G5xtuvkcH25mAJciRLyy3vQe4BCqYOiiag+pCdS3wYM=;
 b=ZBOMtNKNGjUng+DQ6hsudintETaJ/JYiZRuCtksPA2MidSFabnlEHdha
 l1JGjI83Nu4EGUFPe1qqeqd2mhuwG+xFCILNNic2Dvn47Litndy0MaGFi
 zaGPSqTc0JsJrh03YSadeAf3BT6Na7r9NDlHQl1P/CMnGV0KIc+6hpy6P
 tTSpL6PBci4o4rxw5q8FAqGIrDtO2H/51X7KP9mhhZcISwD+vNaU690fi
 7wYDyu7s3VLPK1OiQl2oSoX4Xm2AfiMYXfEk2z/VWmKyCUnwOmqVOBnZU
 rTqYDSVVukIwPdfu3sB977S8Vt9GoCyFehr2kqpMKNB0jUFXMda5LAmI8 w==;
X-CSE-ConnectionGUID: DwB2Oo5MTKWfI74TLJNijA==
X-CSE-MsgGUID: tNKhDDi+RzSGQZstiBDMrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46416799"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="46416799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:36:59 -0700
X-CSE-ConnectionGUID: 74A53Io0SR+SA13yvbk8Sw==
X-CSE-MsgGUID: PSFmY2WqQfGtnSbfWSf4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="163790630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:36:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 14:36:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 14:36:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 14:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds+REmBoYbsOEgnCt6XVxUhOTIM/B/0OtISfzJFLbagOz+2At2x6HH8qhEe4PCcxRqd7KCWnxN8bp+d5khhRhMtOMES8N8IFJdVAhp+ClVKIrqJzYuOy54AaWIU90wyXK2ZrtwZPizDq7/Zek40v4IGTDvsbUb3LM+1LXxWMvLU/Vxsq/MvjLfndwGDcH2Ooas4j5tQGr8BtRqxsOhnPQplHI9WkwVB3WspRvyD1tCgXYm+eYOvqMZnUJSf/+fi5Kpcd9GqXarPQtKJC/u1jjPENIByLqZR0z3S7KvH5sG5DbpA52sobJQZ20Ar23vDTU4mgidZU0XLH1cshx+/u6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P71eV2Gys1Bo4QCgkDJ1ARYZKwyak3gVqIISWz9wQJQ=;
 b=bxrzduU3vDGTcY1iPyu+WVILefdeTGrYBJYdf9bSXehqcspOKgVDRT/6xp+TzPvYuWgjbR75BMnAAH8w0/hlXnneKUzkbDUZUr4pEJIlW/EJlQ9niV0kll26C4nmcu9PF1r/EdNy3pExqEs57028QxWjQWnFi+p1r5S5m2SURcaHoRaiYYsP/V/bnOHJlTn0oZpBgpX3mmSCSjR6MKQgBGNf5GfyYpKRzqBJsPDBo4/GQPEWa1WjZ3Rib5BxmFB+hj56NZUO3MmHbe0pfwHRKmWvXqsMYAe392iNxcbrwBktg/3bSVaLI4/dHEEEkjgpUri7HrGi1A37Aa5/ZL5atw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 21:36:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 21:36:14 +0000
Date: Thu, 24 Apr 2025 14:37:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Don't update wedged mode in case of an error
Message-ID: <aAqvH+wXDY+D0KGu@lstrano-desk.jf.intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:303:6b::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf1f5e0-c72f-4329-f1f0-08dd83780a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EJmiz7XYcygd4MV+kSpw3r5qqi/8rgR7F09UNhVH856yjwf61rcsJuOEcabQ?=
 =?us-ascii?Q?X1eGgIFLBB2etHH0eTgmfh1TRafucorvsQgfMVCM6YLunys+7fCBOKhaDZc9?=
 =?us-ascii?Q?TivJyrSVyJtXpRNEXvo7PM7Dibx8tdWqJQ3MyqYgji68AnTYjknH5FYO7LCZ?=
 =?us-ascii?Q?GqDayyE0xy7lnAKKsKGYb0Abuobdet/VOxaWBvqCEGTv7Tq9FCRXsZ6BIsXx?=
 =?us-ascii?Q?szC/P6MCvDxgHnCENJHe9QOec8Hlo3Bvt/jrZb6GFpfKPrjVNeOFNi0nIoxx?=
 =?us-ascii?Q?p3gNQxQTOKdScWBPdQtmFey1XbXLh2nDxFI7bgPgyF96ZjuNikqQ9KlapYIT?=
 =?us-ascii?Q?/8z7wHOp5r0AbGKuExKNwQczIzrr6pwOoFfPShgxFXIhr4WjQWCaW6Wj2QMA?=
 =?us-ascii?Q?+QtEEDw1fLkmExP9iRcG8+JZZ5fv8U32QrZMwH9aJZAueCX/4p1Vt7OkLFVs?=
 =?us-ascii?Q?K3hPHRjyfKKO2cF/YrW5oooZh2S3LUb92VRwYQscdBN3fKGSlShZugRGBVTi?=
 =?us-ascii?Q?Ra2kTx50xBXMCZm8Ixv6ya4xPK/d8x0h3TPDNJAhrfq8tHrLIKEM3kMvj2/t?=
 =?us-ascii?Q?TXAqRQXo2hM7a7jrfd9e8xadiX/BlLuhBgvO3aSYY/O0DxrOChKBL2xb5Ilr?=
 =?us-ascii?Q?pTde9dPWuw8t5CfOfPQdopvpsexf7bnAJZGBr1ICgiBC1oAyyBpewntnXyhq?=
 =?us-ascii?Q?/E9onJuS9x/v2hF7n41Nk5KB5RvcZBkm9Al76on9kfYWojVBHnXW3KLyBtaq?=
 =?us-ascii?Q?os5OyIOhJ3dOFedxBEMsHW/nsW6ElP3qvkSk3xMivWhCcWNWKa10cbKvf8oj?=
 =?us-ascii?Q?rXegms0i2VcBCv6aaN0Tjd8eL7TdZtwTR4PDOkKGyJ8Hm3Bne0ILv/jKC7k2?=
 =?us-ascii?Q?rV+WTkF8G8rw/Oqf2xWpmNhOJhV2ERHU+AwzC1QvLqQz59tQtfZ7ehicXbPj?=
 =?us-ascii?Q?l3ULFLpkQT+VfdGg6LC6whGGlJaBhWgLO60ad0F2AaGWvRK+8vUhd8aOX6mV?=
 =?us-ascii?Q?VS3+NOSFJXAkw58oyC4HhmSydtLBEzyG9wjMrclEaNys4yto0GLu3IIOEtEZ?=
 =?us-ascii?Q?04LUTiOMDfHSr6vJYxBE6M5y314r5//jWDAVF9cueRrWrbQzqGEtIOli1zx0?=
 =?us-ascii?Q?hcEQgt+tFvvinYDBBgdu+8rHqMnWjn9SG6T9Bhi6OIeoef1f7eTXfGfimJlg?=
 =?us-ascii?Q?OQ3B4Jr/jSALYBO+lsNPAiGCv13Td7llcl/aj6xaQFSYlI4HuUN8eBVpr0qa?=
 =?us-ascii?Q?JDTQsidlrQdPydPgzvIK1otPS9q1RSYTH33g1J2PNWmvRw4wzxzmSl3Qj3Vk?=
 =?us-ascii?Q?g6iKVoTGWFMPz8faSHX1YR8s0UGHdTwQndc3XZaA85eO0neMaApV2p09i/qs?=
 =?us-ascii?Q?NNfFVVHGxNCoay4v9JVIcoYAgsMkEM3trz4T6Zx/amZNqdE9epchQarhEzcC?=
 =?us-ascii?Q?jUSQUQRGKos=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFaYlvYfvImLdT88u9S2RAEEGqgKWVCd0a6wpf6ndPFMYdVBAjy8J0olTEUN?=
 =?us-ascii?Q?aK685SoTEukjl9Vxx9PhcNFvaIizujVh0vJ22C8el83FItvhZSi0RsFc/1zb?=
 =?us-ascii?Q?Wqe14O0tT2DTrBbFn4n90iTI8QfVOIdOZDTRy9c4dBjUGIiRONkV3QlwRyNE?=
 =?us-ascii?Q?MAHMiOdYQnNAUXROkB1A78cAx37caMqBQVH80RoLGsMM6ClZCNBeDDQiFLwz?=
 =?us-ascii?Q?fw5PzWrUNdkMalCyRmyWnPacowEq3Em2sByerISXYBY4okX3S6Ero67fR2xg?=
 =?us-ascii?Q?pqYZD+IruY5C6dj5J5cXaGqEAFTyVHLIlZk1109HGptZUMVgBMQnkVHPXrd1?=
 =?us-ascii?Q?DNnAofhAVM3IRpifENzWHPvueDo/lhxpLfZGe4Pe9jrgT1QOX9N0uW+VdBUY?=
 =?us-ascii?Q?uLS4LGdvr5caeBSmEMNRKIxDcaR7foXOgxKL8+HyManxU+auEb2J1Uv5ixSy?=
 =?us-ascii?Q?NQQ/s9gj5jOhq4u+iZ7upVSJC7QToNclRlNqd7YWgwawThM5/YAI4u9mf/8o?=
 =?us-ascii?Q?mqX8Fla55vqSLt//gzFuVva3SU9fwvoCFyKeSGREK/e3makHGEB54dIqkM8P?=
 =?us-ascii?Q?5X4z7IQauYnG8gwSgKPcr1O1j30NLA+yGCRWBML9HVbHAWb7xKyZitdcBoOo?=
 =?us-ascii?Q?daP6AFKWZ4zib4yNJzYl6cpQhGBACtE5piMqkAcKp/MTFQ2onk/9MkC+iTH1?=
 =?us-ascii?Q?xvPNx6yBpnGwiZETdaMAhme3p8tSdeFa4rZRxKDMrGRWEF6XT16Mj8HGR7x7?=
 =?us-ascii?Q?4DjN8lKgQ619h5GuCwlpQ2zdGaP7tsxAxq9DETm/jHeB7oV0DZvamjfQq1l7?=
 =?us-ascii?Q?Wh+s4ewDcfYt+Ya/MHzM5VxTmbr06iqUNXNovz4WhCeMAoMIPgbeS7jdNRoE?=
 =?us-ascii?Q?egfWrQ9+hAjgELV0C91FcxdBFBkzK5xQPDQLLKzZzsvcFRCzFrBxybh7/nRo?=
 =?us-ascii?Q?oF48CDhnifGng8olN+8y1ovyag33HkBYpRGjLb/KhSr4td4ueZ+sQ7gkdoJ1?=
 =?us-ascii?Q?La56t57VZ9ATA6Qd+y94MwXBtehUNBOPXxxZcbmQY8FX87kw8fGGRID8Fb4u?=
 =?us-ascii?Q?QI0u5L8z4lK1h8zIrPXrjMqVEJKFrNsuHesHL1LroRMPTcv+qXwIwgjMKNaO?=
 =?us-ascii?Q?mXZZZlSQANQwFF/Rf60DdIuKe4YBwsWpPLbrORljyMzVE0+0qMuQNmQnmTVT?=
 =?us-ascii?Q?WaUiJ/L8lBncefA8VGOfnlTBmqv60oET08njaflHi6yQ0vTAVKAIS4WDXa07?=
 =?us-ascii?Q?GPzKktV8CLF10bY00hOkzhU9pQTb20EKol9jTBTQCN7Yl9zP6e5rYjfrf0lX?=
 =?us-ascii?Q?WoqXDdTWPdVyoyu84mRi/Tvquxf7K0kfi1ZqUFQjJTbec93i4EOSFr2iqFP9?=
 =?us-ascii?Q?yPdH9rNAPO3DDlgEWdL237xG46GSq4iKmdV24FHb968tInSFR8HGgMT9yeG/?=
 =?us-ascii?Q?7Jkop1iiKgjOREdM2CNpz0CwRE9/+SCB6bNY6YhrrkM59bmlLEpYn1+Ap/DZ?=
 =?us-ascii?Q?7Z6hhVP7sEXrM65YU0kdsoI3cNMwhm4nyq6+QyJbjOQab9Iha2DDNrS/Kxvj?=
 =?us-ascii?Q?b7zQo8WaM1b108x1QfU6yKxBob/ySMaJoqZhByV9M1GI3k/0yAgE3dgVj2/i?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf1f5e0-c72f-4329-f1f0-08dd83780a09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:36:14.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecXVTL3fbbvVzdDgR2VfJYbgG5IvCMgqhKH6+2XpK5M9oA4d1Wbw3okVPre37DlXdBkaGdKwrrjPzuzdDLVmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

On Thu, Apr 24, 2025 at 04:30:40PM +0200, Lukasz Laguna wrote:
> Update driver's internal wedged.mode state only in case of a success to
> avoid inconsistent state.
> 

Patch LGTM but I think warrents a fixes tag.

But patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..2e6d8744003b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,8 +169,6 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> -	xe->wedged.mode = wedged_mode;
> -
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> @@ -182,6 +180,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	}
>  	xe_pm_runtime_put(xe);
>  
> +	xe->wedged.mode = wedged_mode;
> +
>  	return size;
>  }
>  
> -- 
> 2.40.0
> 
