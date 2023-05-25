Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C38AC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD82F10E07F;
	Thu, 25 May 2023 22:18:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9536810E07F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685053115; x=1716589115;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zmrDNVxIomf21RmFrTXdIEFWhdZCvzVGW+jlSfknyxY=;
 b=QKhem8urzdbcOTOPqIQ0zKbkHMB4jZXOVKu6CNhhFwFqxcV9559q2CuU
 7xOIKmU3fQQJbR2Ut6KtU29SpdoDY7DQtQwLO1A+BOsuprQXPFJEygjV5
 Gp5Op3geZus5xUqTLVxY90ocvqlGiwt6cObkIkixAYpXGkbmwSyQqToQg
 B8u2HK5UNCFeV6NnloaAnROhK07A+o7mFQ19z7Kg+ERB9Leo66dgxf/u/
 BvcL9g6AsVQBApX5/U0vxloJctk8nEHD4k8BRTXK3Z0a0AMiNWT1Dfln3
 n5Tt/Dmpb2F5T3LZtiXsaedxYwWzfyHuOlM8r/ZztzAHJ60BzK5qUtGLA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354060952"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="354060952"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699184680"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="699184680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 15:18:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:18:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:18:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMzIqGlj3/szFJLaBD1h4P+0I0tBdzDjm1XpYQWJ1WHpamAHcqoqlbdnayP/yj2aGg+XIZ3GsKgH+PbiP5iRWlDlgkaxoLf4PSTI3tAZFTHfbnvhgxtqVg7kP40Xcums38y9E9OiJ4j0Maz7RzpR7IQAudXCkb7XLQX7pSq6lzTWfBiUhSTjhUXzOJbd5IboZ7tRgzwNX/IGunhQOdWkAlD3j2sZLtN0zdDiS/EKT8/4njTTZMWiYyGkDMsJwYFW6AO7DsTdr4WZ5sbxVO++L2nViUys8KeEHkDj0Hl0b33IKxq0VAUxhnnpJO9yHDSlHohCjJno2Ri8wu99kHrTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF7xL7DfvlyU3sC+8H2w1uplJDLlIzIGlCXTRqhht9g=;
 b=iUUlryluz0i+phQKxp9OwN8DEjV6bfiBc8owksvCPBYruIAxsDVkOjttf3hE3ebq0EZ7YNOW6YmsEym5dQvnEGS0trXc3CwEQ49LgmN6y3sgxQrgwfbKgXIWiShyjsD3IwoPy+yiNtmQV2pqI+OPkfiN5KJxPAMtSN48lG7Vlnncev/1ZcpnznGSXwkdZUNLIUPmUwzZmoKdj5HQe9sFwlUfHFJ0dqXMm4yoGezJqOtKfP5hUzAosK8ek0ml1hKMUyV8RPxMEHB68FAfyVLG7U0ZCasygmO2Ac9KJ2E4nwf6q7Gx0I1CMazTGIq4i9x+JQIa7EQw1cerduPKrpqGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Thu, 25 May
 2023 22:18:16 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:18:15 +0000
Date: Thu, 25 May 2023 15:18:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525221811.GT10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: a7177bf9-e4e1-48c1-ab48-08db5d6def1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vxPoD1+02Gxxs8rCaqAhFSuGO9EHKZkyDuNl0bUymb2pyGVPuTgthMUfR8hXnTGOwYHZ+XeG3Pb4OsPUGqNwERNd7eIh/OMZK2pFt4dTM7FCdEBTxofGbDY7zqERFP35LtK1oaV1oWimh5UnKzZXhLylmGylEAgZDmIZZ96tTj5bnn6Trya8FamNbLfVr9pXkECBemre23X2VH1GvvpIdnlTluMkaX7i22//tCbqERlE7SKeERqQ7+fGR7FJo4qmBAOemO8WNgm63ofR9pkRrg0GYYZX4jeqDQZ8kg9puo652txoe+lwUSj7mDtb3W2WRmdADKwv47QCeRlfg1a3SSm7LTYqpGPe7/K2P/xA6fk/bbAfx67KHmkB/pXakk1h18HUKtw/szeJte8hYl7Y+n0RgDuy24nF7zIGHyDOHVwblsqwE3K76F8rp2Hk/XN1yuV3JxPZ+yzNnW6SrUNTPhdY2rus69Hq7F8+Y+MvQaUMYLm/GjOb5i6x+LiCXtJdki/66VTvCoka8P9JIOYLuupBWHfnl+CW+n14WIqsXMK446PQ7O1WBCvUzl0On7km
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(5660300002)(6862004)(8676002)(8936002)(83380400001)(33656002)(4744005)(186003)(2906002)(82960400001)(86362001)(38100700002)(6512007)(26005)(6506007)(316002)(1076003)(66556008)(4326008)(66946007)(6666004)(6636002)(66476007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7GpXeep5OcmLDRuhM6EgPJUF53KT0FzxdQBV0K0HFnWsD6zW38Hx8hnQECC?=
 =?us-ascii?Q?vUla4qCXjQz6CpFB1ksdgDNnhYRRjw6Dem1S4fFZO/G05+u+YWZ899e6/SAq?=
 =?us-ascii?Q?Um+Ulw9b40VjTDDkRnFF4UfA7rU8xqHkN95kk46l9pdgqguYPmOd/QbgHyPo?=
 =?us-ascii?Q?jlV0fiXTj4qpCzGDPh1pn4V+FVCdIYGKMxi9EpUDdbBXqXOoiBlOrxKfN/T8?=
 =?us-ascii?Q?nym7T6geTeHkmBN9vbIm5tK7nbQxEaT1YFMLs2tGcI6AhA3ygMnCEJU7axpa?=
 =?us-ascii?Q?E4NmB/xRGdRUwSk/6p1XfOAqyRwwYl5Rkuv+Gk4VwiUN5geFjHC+1GrcjD8t?=
 =?us-ascii?Q?4MKNkgpg5xfIr6NoViasawQULbxKAqLmMIZ3AkZ7y3hT1YYxwYp55Civbwjq?=
 =?us-ascii?Q?hgWOkcgzt4KenQiByPeQSBYQZzdwTZe5Pk3bHEM4yF4LwKPbmI1QnaxjfKkI?=
 =?us-ascii?Q?kldScuXyProY/W3UOnvIxPRvKyuEzy8Sko2fqckawsbljhraRSq7ehuaskm5?=
 =?us-ascii?Q?MTRAjrMDpFcBCzS6QUqxZ//IrXKwnbdQ0PjHUdrbY2+KR8QEnfbsMK1ZdsKH?=
 =?us-ascii?Q?qLb+0X519OvWjDafm7MSeRdgnkFjNZebKNmwKvIGUihdRZD5p5svBXDfVWzn?=
 =?us-ascii?Q?HydJWN5QTScWepZ6i07T5hCKuWf8QQzgKia/e/j1GJFoFyD0UAcGg0GXF5kL?=
 =?us-ascii?Q?T61gz2BZTLbbuD/sSaPV0rNbqEYzSx9je/RixTYslIPt/Aniybxl9fuGVf1k?=
 =?us-ascii?Q?kQy1ZEK0Hd8pEVxv+bRXnq9yR2Gk9l83/kXtM0GIzQNtuEvnLMh4hJH/Feea?=
 =?us-ascii?Q?43Rt6/7UkhOp62gNFNgrf9zaE8+1H7fSI/d5/CYFGozY6QoW6L1IJibQseXV?=
 =?us-ascii?Q?yUkc0L2nxibJdaLAGHYoPTz2iALLL8Jay0/z5v4LZm3Z6cWF2n1FctnxfciG?=
 =?us-ascii?Q?DyZ3/PSWKYw2uXHV445Co5ilrT+44b7FlwMGIhCvBCeqDiLHy/CK3jq/XMbL?=
 =?us-ascii?Q?Tq/ImYrrUHzc2dRxUkLEiDxyBrckqrQHxe5+FLH+ilxWzdnqp0QIPdXDqBmZ?=
 =?us-ascii?Q?H9on0BMvx1rooJNHzKX/cCflUgtyIUE4CiQlW38TXMOWIvttJTGR+l8AjQUb?=
 =?us-ascii?Q?kncSdlMB2jUJXOQoz7GKcbbKj/6Zy/kjD5+GY6sER4EE/lkdyc0n2+Ts46tx?=
 =?us-ascii?Q?gelTGc+s9IfZ6bX4eJEUXADMrfKrAJ+7sZb5mappKzwNlSNoX7KkTaavTbqJ?=
 =?us-ascii?Q?eYIy8aqpylSiM2znpc96zcN3LVP/Bq/7Rr/qtFJD7X7qNQaq1RD0/dxqffZR?=
 =?us-ascii?Q?Q3UvYymdmDjTCy/Lj/gCBAUMuiXeWlKawNnd/pUmVZHnrUk5HkGvbjEeluy+?=
 =?us-ascii?Q?OmDXVKBeei8TwwrPE8mtNafoZrguERGW0USujAtwhdHjYFpSFmefNv/LRObF?=
 =?us-ascii?Q?rk4vfQaVHgToPjy0Gmpqg+pHFQNvpAj9NEXf3oGQqSzvBbdEwuEb5YCI1Jgl?=
 =?us-ascii?Q?Z/mvR6lJMcSh+fb9MDJu0+66g/ClUPzaPPds6+RVGFaRPVaMFdLBsW4Txe7V?=
 =?us-ascii?Q?7EaXmCVZHNz73nkzShU5VqZ8CGnyadM4zcT16mvDrlPI6PNJKf9+1KjCMQmt?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7177bf9-e4e1-48c1-ab48-08db5d6def1d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:18:15.0433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhZJ9NM6KDbXXRO8MwRaXRMJkqp5qdCEzxCQIT+04tSKYpnN8fST41vu6a65x9CqzqDFCvN44Bw2ep//knoPjc5+tigBuHG/5mgvzJZS4M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 03/21] drm/xe/rtp: Replace XE_WARN_ON
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

On Thu, May 25, 2023 at 02:33:49PM -0700, Lucas De Marchi wrote:
> Now that rule_matches() always has an xe pointer, replace the XE_WARN_ON
> with the more appropriate drm_warn().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 5be25fe0e8e4..5dcdfe45f0cb 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -84,7 +84,9 @@ static bool rule_matches(const struct xe_device *xe,
>  			match = r->match_func(gt, hwe);
>  			break;
>  		default:
> -			XE_WARN_ON(r->match_type);
> +			drm_warn(&xe->drm, "Invalid RTP match %u\n",
> +				 r->match_type);
> +			match = false;
>  		}
>  
>  		if (!match)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
