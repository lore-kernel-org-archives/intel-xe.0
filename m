Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB60C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D918C10E58B;
	Thu, 27 Jul 2023 13:58:41 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDBF10E584
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690466320; x=1722002320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o73hn7XVfm47wi+p02LhnlUcUJargoSDPP/rF+jrIRs=;
 b=jGCGHrE2khTSjP3TFwwF6PzasU94RswkQkULXM4tEhW/hcAyM4sJ0LTQ
 YbUdEYHqqrhrPRXqKR4kear/32SmSTu7at/tKdiWovvZ1UBsrOma2n6sV
 /0znwQcpytvP5AzhD4DphgQp2n9CpCKIJAPx+0GKXIINfjn5mjejawHDI
 ai418apvUDt/5z2evXumA90tV7n6e9eK4EzF2Tf0aTdpqCo5iLU1VFdk6
 Lq87VNfbALVu+zEYgfdtNuZrT8meif/1oXQeVGDnxd0xe+OIlOrLtB2kE
 2yP15yhVTek7ZNwmItnj7O0v9l9CIPGj2BXU+YMZxFGBap8WvrQCLExZM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353227672"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353227672"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="720888421"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="720888421"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 06:58:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 06:56:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 06:56:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 06:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtMDOx3NFyxReMWew1GzgeEWnDDNCMRhQraZQ/FyiVzysQLG+M1TYUrmY5BXAZtqk5ZiIQgTP6KSytbbVMXjH3oSPJbNRAIcp0UO50TRJ+JtCOvMGEBpiG3xA90s29YBPAA0Pbb5w7ctuTTPkNqgGhJYQrfdYoEKECzW5x42B5NDzvAmZdB6kxa1gFqw0A23+usss3xRrv8VOxQt0GMBMrJ/nGCtx3+Z2lDfFcGayK87odkc6J81RCNq0bJ9B5DtneFWxkwZJ/fPCv4iVGink1OjEYmNdhr2V+BmBQjFQVjUfZBQUyVopfQz3rkg8kxPbM9afyAvewjZANna9ar9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31h0V2l/p89JSES5NbBS3jsQCModYKZ8Y2CqRJTOthw=;
 b=AVMaUvaDcitxvU/ebz8wvtMsG3cuc9ItEGyWA4kF9Ol9TRzZXv4RcaSLjn+BulR+TgTlOuekTetptAR+K+L/dJtE7U9hmaAEEocUIXCFnBeyOHSV21uOJV3fA6TW3gkL+EndYw0wPmxPXt1xSrThnJO+l/apcVDT6W+/UCcpuzyWNwtgW1kia+IoXdTvX8i6XtkpRSG9HLWaP9otdKYk4JiPvJKiw1ZOFOsRe8N7LvJ0YlyOUZHKZTlKML8WzUo7VjKnLABlcz1kRTJArkBdZ1FbwXHy2fHRdCLTQi1rhoROVmfsDEQZKOhJFaKR/QsrOZmbMCpLysklF6CK7etlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 13:56:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 13:56:12 +0000
Date: Thu, 27 Jul 2023 09:56:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZMJ3eOPeV+N4HhvB@intel.com>
References: <20230727132630.7-1-francois.dugast@intel.com>
 <20230727132630.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727132630.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 3912e4c2-3db9-4399-9726-08db8ea93cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FqtCvt0c9BizLeYjWsGkV+1hnHiag1lj0sP9BV148KArq48YhI9F2bhtPeStZ9O+P8lV3hBLXHIfQmwrx0GCL92mOjm44DMQHsOxBv71w4FoN09+32OOYQ/0CiifGaAfNGEygzl1Jvi26OquyiNne+pemFGKAJrZOrnMwu0ifou4KGCzKnEePjdHtFwS6+oEPwZ/WzeAwACXH9CWI1JdHV1AwiJRdLNA5nlSXaLZDtZrRlHBknH5UmDttZdqb8hOMiE87A/ZelBbnYy9Xob47xtcdiM/S3+vPPZ/jK9Ie3WixbMJZc0LsZCQN2cH+umVbL4jQgFDPJjSFq8yG7ilpmDqy2JCH5kFRy3QIWUZqFulVb1XpSwjjvMJksADiMSRpz0UFxyJGOXjmVQ2mVcFgoDt4v7SiXlKtwc9BbBlhQBtmJ7Er40X78voEUvLPtum3+TDXX5Ce+nzA0f8Kgcz9/CtVW3TmHbZwOq0CLQkwgjPP6uoT3MhSZxzgDuU+KKzZkuwh5Sv9b28DHm+2bQwRp48UaJzq9viqbh1p5Fepqvu1H2g1oKSVKMzliCVRSF2uVDLmu9gp2NViDyJ40OAtHm2huF/JHKg64g0+/OV6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(2906002)(83380400001)(6486002)(6666004)(2616005)(4744005)(36756003)(38100700002)(186003)(44832011)(5660300002)(86362001)(316002)(26005)(6506007)(6862004)(8936002)(8676002)(41300700001)(6636002)(4326008)(66946007)(66476007)(66556008)(6512007)(478600001)(82960400001)(37006003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4G8KMV6XUvPSiWsR080UneLt5O10f5bXnuBvTFf3NPu1Pgb3XQMOLoRxdgU9?=
 =?us-ascii?Q?mTYxtcHvzHkdHmUha6dJM8RJFxhKzLmgdz/EaW5FL7NLcRqkCy7ObGKWOVpL?=
 =?us-ascii?Q?lmVUabG02ohdanJxH6TkbMiAn/barFFzzoezpnQYLHWleTUaxBQzg4LdkAEl?=
 =?us-ascii?Q?p38Ew8eQuvXpTZH5nZEbi3qU/D1/tutpZxbVxCib3GPSV0tEmNmJTXByCKz9?=
 =?us-ascii?Q?v+ptX7R4f9SZ2AN560zhaIf3s+9UtAYjMVqXnKv6khfPIz10DDdNSc8+h2WX?=
 =?us-ascii?Q?ELCReea9LNBC1oK7RVTjUXpbDwJ11qErFomb1/sGieWAZGbPdVpoaSCdhMpl?=
 =?us-ascii?Q?vKsI2cOFzMIwdai9dZIOFALObRielI1Lhf0PHCzjfL82UTLTk7vG5oEcbTum?=
 =?us-ascii?Q?rHi2LcUhtLuLk2o2uzcaPcnSKnPAs77ZnBArBb8ZAQI1Xe9l6aYxIYYD4DUs?=
 =?us-ascii?Q?2txbLYXEhKSa2hANi7dj/grQDi1/GHk0yPfmtphnq08dhTNDsqgwSnjbNGwK?=
 =?us-ascii?Q?vcXsSwuEMCcN2HykzFtAuy9LE52/xVFKqKt8/rd8EG/v56dTNxzoORXOTJQi?=
 =?us-ascii?Q?FKnA1ak7uFRk7nWlT2LwDYdyE/tr/iTbtCWoKZGzLJr4QHNhIhpf+zp3yVq7?=
 =?us-ascii?Q?XPRcp2KHqHZC0XqtINZGYFT84yd3WSzZG/XJ7D31V8XQ+Uf1ChRU5+q5U5Wx?=
 =?us-ascii?Q?O03zte9cKLWOuHuPhRYtwbmi1XpHr08ChntYdNS35EAcKphuBRM74dR1fX9l?=
 =?us-ascii?Q?LOWyQ2hCo2GwoQOJo7G/fXZCjyOWBwlYaxUOjlzMYQC34EdtvtW4e8L/dP2d?=
 =?us-ascii?Q?M7xtIc/8dtmZE4BduzmTGnByx+KSVDXy9SVyGGU3egbChqZu0a6ktZ+EquSF?=
 =?us-ascii?Q?puZJrzU7HqOYVcGzkrw394SUwN2Jkl0gFEQfJb78IieeOf2X86xbisG3ME+K?=
 =?us-ascii?Q?coPqXYwGeyTx+Om4+qoWkfx1t3k0OkeCBQDtYdPvbm5O7K6mwRbVDvo378dk?=
 =?us-ascii?Q?ArXYHbMlQbdVfNJuJaB32I59fuSOy9Qf2b9l9EIzk4/xmonAbIRQS+1c4lWJ?=
 =?us-ascii?Q?M1DgwgVn7O5nMaZ2gdwNTnR8dMAW0eBszkgmhp/yfC42F7kENmRgLT5o+6Nw?=
 =?us-ascii?Q?8yLtRbaU/7KKQkjpaTwU9oe5toC1twhXE88rZoQPFHUxlNlArKrZQwqYXgDj?=
 =?us-ascii?Q?mqhymLWBnfjstft/dhhY9jcLNpVos+dB5biDthCTYi8MVU8EI8VL5L48/qqZ?=
 =?us-ascii?Q?dLHeaKTWbO1NzcF1cwOP8cTE1VfDVlt8Yr5XlNcuogZnBGqpWKMf2+e6Pbqn?=
 =?us-ascii?Q?XEdQviCyQuUxhpkojYMFHKqYQbZNFyde+lNWeb0u+qhmfsQ8Ox2+6DyFkyY9?=
 =?us-ascii?Q?fKOH1sylnL88lK8Qhuqg9oELv0DjOqMDMof4Jt75IA5AokoVH9RJPP7fWvS1?=
 =?us-ascii?Q?ZyKmHgwJNyiiRe+47R3N9HR1CmveOiBpR4UPQ/exa0JQLFsdiDy/edPjOppT?=
 =?us-ascii?Q?89FLXHsWwIN0nc9DjZcSs6Fym7phxRxWKdJq4nAqe18tFbq8rH+aO/UWXprv?=
 =?us-ascii?Q?d+y87oA6Xv82Vn3ZRJN6mRDROTaOdDpt4VXwS8JmABAEOcEYuoskAolOJrYh?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3912e4c2-3db9-4399-9726-08db8ea93cc3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 13:56:12.4314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30ri3esHmi/J7Fd+adEjcBxKAbk8a1bhlGtDIH8MQ44XgTEULix0fu2mKS+qv5JCNcY2BKgldxoWTlEVTmLOjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/macro: Remove unused constant
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

On Thu, Jul 27, 2023 at 01:26:28PM +0000, Francois Dugast wrote:
> Remove XE_EXTRA_DEBUG for cleanup as it is not used.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_macros.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index 038cf28604ad..a7105050bce0 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -8,7 +8,6 @@
>  
>  #include <linux/bug.h>
>  
> -#define XE_EXTRA_DEBUG 1
>  #define XE_WARN_ON WARN_ON
>  #define XE_BUG_ON BUG_ON
>  
> -- 
> 2.34.1
> 
