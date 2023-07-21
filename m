Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF7CEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 18:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6FB10E6EF;
	Fri, 21 Jul 2023 18:42:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1B10E6EF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 18:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689964959; x=1721500959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HaI0o4a1QQhVCx5xdVnxHbYmMR1icAXAs2xIlZZnUIM=;
 b=hNeZZILeNxr5NJCzScK1/hXbxWm7kry8s7BjEfSdOGtuBmG6rKOzM3ci
 Hxl88PqCjJg4G1YcxJ2G3XfMO4Nir0Wxh8jfWw/9jnBJXIq8DgVu/8I9Y
 uUGbuiuNGshmXx7Dyr2vwQ4CV2xAxCyfpFB1+LrsWu++FbKY2GvvwvW3S
 diAL/x+7wZJ6YDVR3vNftfKTwIQWeCbLuWEb7KiReSQvM8QV9Ojvejwtj
 /hctmM6VVf09pJw8hJ8NX0r/8TP64Izv8Xxaizk/r/sivI4ztGf4F/PEn
 wXoh9Mp9dIxmCQn+QaiwXCfzTWMTAAzNiGogm4zoJyjyRbtr5P15W6uah g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351976807"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351976807"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795051305"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795051305"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 11:42:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:42:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 11:42:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 11:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTB1kStmXe8M3QEA+ULqvu59y2txueH7EcqNSCtHXzeqTS1aiBXOdLIaZIz1Cx6cqiRwB7LLq/cbQqUkSzgoAFEQMXGYn4OJWGUg+orAQNQlbk/W91NgVKtwTCibxaolAl2pIQaOi6E2A39IqduMFUjBy5cqArsiWCyekAzAIBryDolpjhp4ML46gsgW1Kuckcyku9B6sW/an6qVR8CJv5kWTt0iLgzVzgW1fQyiQEkUTCJFdt2Op1KfuygOSIs4YM0Mn5mdlgN0XT5J2o+qceCvovsILUVbPCJRHjg87Q3lNUKBgrvzB0Xj+WF56Vo+2hfxI2HmGo5azeFc/ocPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//BFiI+cbkZSvQMWGr1ZAwr9U7F8XMZzU9uQjmJ/GxE=;
 b=IbXOcMd4pmkBUJYU2pX07c33JlI1IVrK3OI8kM5xpk7bB7te7ej8QgQo2mf+ZqrvpxDCxT55FfsNU2HtE9zRhASn6KPeJuo4ATDF7BQ1i5Szw8IZ7ZwM0uQrO/uxLtrsVQD+Hw6qzdBJqyhzXDhIVxZxcGKLdnHdmInz/zx8Bdt0D+lVYKj5TmpHpAJ2CU+t9015mOPYZafP8Tfw9Ces7Q2RSX/Qac0ztDewUOZ4MkDv4y49xTstb9vOzmglla9DIOh6yZESu7HGN8WPBgbMgI21PFL6PtThpT2hYkkPaxQKQ5M4Q9i6Mj1aDUlcYgl4RtL4DPTIZ9SR5L35fznbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 18:42:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 18:42:35 +0000
Date: Fri, 21 Jul 2023 18:41:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZLrRashn6TI04U+u@DUT025-TGLU.fm.intel.com>
References: <20230721180913.1516321-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721180913.1516321-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 03146c83-4d00-483f-3cdf-08db8a1a4013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+NIaIZAv0IdRM5XZ1/0fWHzIe5KfliAMGYSsF9G1CQwKnP5Ggea73sKkRuKbPqWU/I+iWsk04QBl6+3g7sBesijO3S9Zlp+Y5RMZd3lhbQEdc9UYncSsw/w7dZtRSUWutHQIgFzWuzgYodyuAEazeQ+lXeq1CoL8gumZQtUkKPkMEXYh2Y8nESa5fZaPWMgSJi26aXvPlmYPBAwsvXHHmeOFoXBkBgPpOeEXeL5owlKe/KHP+aYWiEb+y8ZfE2bViXmsbWCKDhQnYwD+UyP3lXmCtA2Qa2IohgO/Ki/FMdVUN2sJgo2hZ3COjsDMyf1MDOw8mbz4Qfq8OmL2UqlstvPl2Xctt4M0p0Z5w+UapVvYtP0LicyhmS4tM5ECiCrLG5uH4qAuEddEyzAEgB3zSVl0gR//Brr18DCpDji6bGs6wCRr2dKMuNYeLAg95m3hUxX5kbqlx65Awzv3t+t6Tgc4B8yWxroOJRlqvW7oHj2GcTyCiEWrXmwBysCWOXN0AD/nCmE62MpP1rKXE1zub+Q08usnthqia68p7DVkqrrIMGCi+D0LyHF2zVsab8qUyOVlMxHIqDXdo/WmM+K19o6N7OIxp1Tn8Jmqkog0Pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(2906002)(83380400001)(82960400001)(86362001)(38100700002)(6636002)(4326008)(316002)(66946007)(66476007)(66556008)(26005)(186003)(6506007)(41300700001)(478600001)(6486002)(6666004)(6512007)(8936002)(44832011)(6862004)(8676002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZsSD0l9qNyr4TPjK6mwilEODb9sumY2/mm7cLIyOLbD+7xYOWrHV1zsw7nJ3?=
 =?us-ascii?Q?EazYdLCdeJPRaaAxKn5Vo3bsiBhkxVM0lft6pmwV1TcHkGlPD7X9BkI64hhn?=
 =?us-ascii?Q?jG/f0zbYLc3TxwhCOUjcFhw4KAOyYaaNOzpdD8BjijUpflpr02rqjxVRLPH8?=
 =?us-ascii?Q?IL/I+auqrxjBQewWsKO8Ooc0QLfaiQFQLvLYEV9vWQ0l+svn1u77X6f8pI2u?=
 =?us-ascii?Q?d96Bdck+dFusFo2kUSz/LIvafpuxm/3ymLOmMXdtQR6iZpL+rku+Bks+jDIU?=
 =?us-ascii?Q?TYBAbEM1pO865LjncOJf45u46vMIeQoyJmcvBXtGkBF/75223ykJQZSI4c+V?=
 =?us-ascii?Q?lyqWOcrnT5xrYIeun7Tsqbzw31+hcL0jc1eSEAk+P7uCDNHhcDuAKvEBr5nb?=
 =?us-ascii?Q?k+Kn100U3UT5k3N9aIZvNQaQi0pNDlM47XQ7+PG9eGGYjSG/evFLwq4K8L7O?=
 =?us-ascii?Q?0ucjYN995e0NsQ6HXGBEixNxoOlK+10mHLuTQe2i2RMy3ZVmhEXUTFeLAEV+?=
 =?us-ascii?Q?9ZD0aQcC0/GNcn5lGhv0kmcmh2FryfdStCPq12ldcupCTEGYK8X9yBoejjEn?=
 =?us-ascii?Q?HQ9bpKl7j5D12FEUT3FDD86YQD9vb9hDFHWF0bvqqVKs0MapgObJzwqKLCdp?=
 =?us-ascii?Q?AwU28GZJvui7Of9RbzbFKNHtXpxSieS27vz4Xp7nWAsz3KdoWybp4sONXCCf?=
 =?us-ascii?Q?WQE/YZ//JqlBVQ3jGAeA38uLuDCtFQQupTlS1/P9ivFL52jCU9n6KkRFVnL7?=
 =?us-ascii?Q?rL+NCALJForh/SuZ6KYdw4k5qkXK5fz9dGq209mrki4UBBpXJCNzDFzQ+be8?=
 =?us-ascii?Q?3IvNKnJ1Se0EG01yarcSQoWfPOlLXV9lc6Is0z+gAHMJFNWVrEgGbQ/A8lhp?=
 =?us-ascii?Q?KTCxj3fWqip908+R/AgbVbEhe/aYAijSV64N22tjZlLoJ5sTUnzLU6sFjYWk?=
 =?us-ascii?Q?YG2oON2nAZKRPDs+1FNY05SVVSrF4WwbYChrTI3yh/i6fZ0l3Rb9jnOH1awU?=
 =?us-ascii?Q?JF2016KyJJdN0YPjFWDMkCqvmtEqMOncEGTN3zjKwBcR/iNFV4hwzKbsA2fw?=
 =?us-ascii?Q?jE2dXdY4wZq4DIl96DsRK2uRJFQFXzbZwW9ojoQXJD2K5AejnyIp/CYaghaV?=
 =?us-ascii?Q?yciwPsStsabdxF60dQwSpSAjqzOzFi+Dl6Vy4Ft0X66xEPdyMy4SF+/1Znbn?=
 =?us-ascii?Q?3Wa0s8Jl+nUgodEZvC/9EHM3wbXS2yomyz7pVMDgDsgUxenIAhvzRblDbmUV?=
 =?us-ascii?Q?DVYkEmaEGE0Z87B9zHoFxM352GSVNyBhcdWwe3z9agSg5O4SGMXNfINwKAos?=
 =?us-ascii?Q?NT6MMwdGc4uyfG3tm2O2+fnzQ8IQVepjLG7fsMEPuaijeiK5wXzuVeoH2Tgn?=
 =?us-ascii?Q?EGPnvPGJ1spiv1XWa0Efqx9gcov0UWUjfqPx2wfyzShXoplE9okH5s7HaGdV?=
 =?us-ascii?Q?HwNZgDd2WIYWeoWlr2NzfLp6as0CvkQBCKh+i+KaGFA64dxOIaMUSE692Gh6?=
 =?us-ascii?Q?Znk7j6acVhvrdgpGIrkQaBbqvKcs/jRCkY+vY+olzc3lEh42p3SUYZxURWkj?=
 =?us-ascii?Q?jTW03rSOTSMP2aG/U/tq8DXD+SJqDJbCT4IZ09hqit6NqR5O/qliLrr/SVjY?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03146c83-4d00-483f-3cdf-08db8a1a4013
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 18:42:35.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkePt9kjaU8rLMwW/TW52QoWINhwwMb5IHeJlOAF9q9G0T3FzgypPloe1V++ByjpjK80cowrFjGB/qqfnX/Tig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t] tests/xe: Boost command streamer
 prefetch size
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

On Fri, Jul 21, 2023 at 11:09:13AM -0700, Matt Roper wrote:
> The actual prefetch size variest by platform and by engine.  MTL's RCS
> engine currently has the highest prefetch size of 2KB.
> 
> Bspec: 45718
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

We also need to update Xe too, in particular this function:

 17 static int bb_prefetch(struct xe_gt *gt)
 18 {
 19         struct xe_device *xe = gt_to_xe(gt);
 20
 21         if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
 22                 /*
 23                  * RCS and CCS require 1K, although other engines would be
 24                  * okay with 512.
 25                  */
 26                 return SZ_1K;
 27         else
 28                 return SZ_512;
 29 }

I'll post a patch and CC you.

Matt

> ---
>  lib/xe/xe_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 0b5c7a4fc..1f9240cd9 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -47,7 +47,7 @@
>  
>  uint32_t xe_cs_prefetch_size(int fd)
>  {
> -	return 512;
> +	return 2048;
>  }
>  
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> -- 
> 2.41.0
> 
