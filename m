Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441EFD64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837D10E299;
	Fri,  8 Nov 2024 22:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7zU0NJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C710E299
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731104480; x=1762640480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bStL/2BzQuratRrLckjefZRdP9hshZ2PBOVfl1RO/pg=;
 b=W7zU0NJK7QV9DvdfHRPIuHXMLPhwcCYGMtRk9hWV47qmsJGngnENejMb
 9Yg47z7VFmVe0hfHxjE9ElxG0etH3Q8qiKFZw0EOBvuGaDZ0K4Gue/G+M
 zFx5BEZMkBZs7g0UVdyRwhrhPFUPkgdTdIRtlpq/7kMkSKQRXziZ7RoZm
 E8ftGU0rTAprwdj0za2JC57JERpsiiU3CxdQeAoHlgziVOclA55wuSx2a
 /74WcjH+KA4r6a8dGC0FZwW/P3JNnYPcqtdooh/4VlWTb699EG/LFGAZP
 0sp3P+kVJaaC23wUDoUcO6cGZlCHnNW62IWjCTb0gkl+svTyMlBAbwzEi w==;
X-CSE-ConnectionGUID: Mi8s0a/hSXCk2KAsMeIW7Q==
X-CSE-MsgGUID: QMl06VfERB25UD0sXsJJFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31168194"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31168194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:21:20 -0800
X-CSE-ConnectionGUID: vYRhH1FYRjSOJuu1eYKhIQ==
X-CSE-MsgGUID: D9ANZmt8QhygQcMeXTVXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="85897754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:21:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:21:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:21:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:21:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN9isDdDXN5KsUNgii1NVgd9b6VvWz03tzKcXpcUoga3H/wCHlQq3MS79dryRdtMus1dsExNDVO1QQeCn40QOBUfBFricOo+AtqcOcgTmXMm+7sYsUMts5y3bGFgAoZ8mQJoGFpDtLM1HLxAsw22bGTlln1iNVTkYcp2OO9MkBj8368GpwwXb/o69vTqL7cpoF/sbTynHF1CHG85ZTBzvNTQSfl4p9gV4ACqPfu1dopDstPBWQMnvl6LzdjWepNHz81hcFy924Dd+cVDzOfDXBwkcZEvI8rS3Rq93oeVwr3o7vUnboymhqg/3Mzi31NXhMPOpVGILkXYWEEo7pohEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1gNWlnx5zGcy16g4zeXvQn2w6i3/xH9di+eUpC2L8s=;
 b=V1/pu1qq1daE6BAoLjEPIki3LHLYLxUvc5CmtPnK6XVIbZW9jDxHawJAA304eEAmsXKUVGT3PA6rxuTI0Dcjd9LEIbjSi/lkza/ewE5gm6BWKTUCRq4OdWU2UI9Qtn06aGlt+u3Mat0DgxCAQ49JorqmdbeQYSEq+sOhVnt9Ty+HTp1DUs+3b5jrWohh0EyM3A/O70c2+ilwOwgAEj12bxv9r79p7Yvhk8ONBTBVPubb8qYC3qtFX/Gyhvf2f0RYijVo6wh8nNJDUOiz7vxV/ZGimG5sefkbgEIMCRXE3bBCn4TGOTxyVgqC5RwpO/LzX8H2VnzoayFug08c5GPkaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 22:21:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 22:21:11 +0000
Date: Fri, 8 Nov 2024 17:21:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Add exec queue param to devcoredump
Message-ID: <Zy6O1H7st17n-JoH@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108174312.272792-6-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d73685-1697-49f4-1ed0-08dd0043a6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ab0kkssD+RTcNlIF66im00KOPuhO/E2iqLbXMbRYG/O3WC4RTqo3K+j52Ypu?=
 =?us-ascii?Q?AOeHzoumdPo0jPG7wJfbfYUQq+DE/CxsrL4upPmvyJ2AYnP36WuJS/Hj10Cn?=
 =?us-ascii?Q?E8hokuKB/kVYbc1gkjqCPWBBjZTmF4aCng6fJjukCX1rvnfEVvpxJqtX1rsM?=
 =?us-ascii?Q?9KRwTRtwvPnyXwjPMX/4KlfcKAiIwJ47cKO5BgVxwkSSsxmFIbq3pRNoTWW+?=
 =?us-ascii?Q?eDdVkdd3hb9NcRicKejh4ZJUJf27IcL8U9cMozkD5/s5bJ6lxJeFsR4oaxgG?=
 =?us-ascii?Q?hsw8ZTxLWSCIfvKLObILXUjHYk9UtEn8YZRrhscNKutFig6I3WrPvuF+HGDT?=
 =?us-ascii?Q?bU8Z/Fqki95l5fuMywDMJ8dE3m/K6c8fAwOuAWMQQM7spSJdkZg0POT2Cx22?=
 =?us-ascii?Q?zVrrOAvmV+eW+Zz3thIp/0J/Fg29pNfn4ecDzD+ZTFfMISVbOAErNYWv1X4q?=
 =?us-ascii?Q?cenzgp6iAauNmHIZgXSvGI1UR/+eIYrs+hyqpsPZ3HR/T4dxQWHgHzBi8XEB?=
 =?us-ascii?Q?DNPzT4V596sDE3R1aihrTI8/w1MiJ1J1Dpzy+6cEfsXkiwTt7LyKDdxWHvXK?=
 =?us-ascii?Q?AiuGOZ7QZenIXHa3VC6FRo0PnTrVeBAGjoTqibfS3PhYbzPR0JKfbGqze+fu?=
 =?us-ascii?Q?vfydhtJ3J0bPHv5iSFQlk3Q/CZxi/HrAmaE7gnfRc0RMATqdUXJsAV0QW0zk?=
 =?us-ascii?Q?8bZJeoMPm25dJg3rVtkWB032yPWE8HZz05EYd2UblqJ0UEAX+LaiSoSrVVNu?=
 =?us-ascii?Q?IGgllrFlfuK5N6b4dtfqvFIf1VydVQn6/DZwVRwB1wUuHI8ogI4FzXoeRxdp?=
 =?us-ascii?Q?hoBbZD5czd9/Q0Dm2MpNu0X5CJLlOmJPeym++Dzt2xM4GybT6cNIlqQ/qNVT?=
 =?us-ascii?Q?gQS2Im8OYVyU9LWzAckd2jDZ6cKquoAgYqHgEYfn30nO8Muv3iim9BBojQ8h?=
 =?us-ascii?Q?XdFGqnf6GRAiF0c0VKhsIRed4R8V+oeRcyEwZA+RmxEAwzKtVUO3XE1AUjEs?=
 =?us-ascii?Q?mgzhu/JgCPN78ph3/jCK2+Z59o+ZJjkLMQazSOyHzVLL74xPXuaU8KJmyk8n?=
 =?us-ascii?Q?oFKB8sbTzO0xyDvoHY4Pwi6WjZja3KosP5Yi9wDZzb3id8VCOCDYoBR5aSyl?=
 =?us-ascii?Q?0ER2VMukvFysJuhVLhz4dPTOk57rcyc1XLyhHCIpOoNfOT0sM02aSDrmG6JE?=
 =?us-ascii?Q?+jsJXUFHvf6slS/dLwEjLdmQ7gv+56RLmxGbYMrmCziLMyhpip9mxwHu6nDM?=
 =?us-ascii?Q?yF383Sr2OR+2S7TgZUTSdbQEXy28BqO9BHK1as2Nl4y7puy5BZTrNx/bKw3c?=
 =?us-ascii?Q?E16GJVs/g9+OQZmfWyrV+yam?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0cWAWM34IcFReA1W0A5loHK+lCVBNGbjT+sccfoYarraDvwumiXAxQ4MWR+d?=
 =?us-ascii?Q?YLEgIRMJTy2BXmexuT90Z9wNKQ/ycyLoI5fH/pjr2SHuQV/Kt3ONaFjNPZCv?=
 =?us-ascii?Q?etFdJLXcmaqDFnL0k376FdqWahp1Iv58cdaTAdbqIZKgsSvMiJBZQuMxp/Rt?=
 =?us-ascii?Q?TS+gq78SWRwJlzIad6dC2vXQ6H+3+12iUlE4R/chWtl+HCszK6tAdWdf2nrL?=
 =?us-ascii?Q?gCreEfNqyT1WV+G6DadjZOUdNVFzTrHiNbykcvH/BhvMXDvk1y6yWWXc7bCd?=
 =?us-ascii?Q?LynqZK+pijdjCmHnqPUd0x9YfY4iPrhjs99/aZXldX4jiigM+90eFqVZ4ctz?=
 =?us-ascii?Q?EFEd/NsMkVEJ3WoHF3wToutgw1UHiZlPUmgvoSAkEu29o3tEjAfo+W8kZGtj?=
 =?us-ascii?Q?60hSSHLx+B8G8ImhSaPh/CzYGVFyxHPANDZQk+f4pyV3BYMWs6R0KcekKX3+?=
 =?us-ascii?Q?Q1afdefEwaKGQqugHsQOftErfAVxINfqFCH0XaI/oQGG6qyF0jPuQU7Kv1By?=
 =?us-ascii?Q?7Tz2i8/fG6NJYkFq1NuwECDSC1tqXYuh9LdbiMwlTxF4G4UBDVu87QQTYxr9?=
 =?us-ascii?Q?X3zxjS6KPIGx3e5bBy1OOuYWnpAHYQ/h27ap3SbfXPl0ru02sRQyaZJ7tXp4?=
 =?us-ascii?Q?5lVJeIM4RV+5rIpj1cmNt8OIltiHh9jLUlD9S8vzBCalRK1NsbkVO+PA/req?=
 =?us-ascii?Q?OfcSflmauMpFOBvlWGLnbEbcqzhll1Ude9Owv7RIOiIz7DhGQljCMUDRKyf7?=
 =?us-ascii?Q?IwxwO8VBbTwRGH3JPMelNiqzLsM+tOG55H+ucS3jhU1+PhU1VUqFuMxIKQpV?=
 =?us-ascii?Q?Sz4aYEDTXVpnxXmzdOyp75yufhrpDGhyOI41HSOuzCmqyR8T1R3sXHcTK+zf?=
 =?us-ascii?Q?VMi5J7qDmS/jr4Zxb1mxhfzZMsqFN9Q6CEOkGcrhThbGEcmH+HIAndjFOyWg?=
 =?us-ascii?Q?aR1E3Jj1V+UUcFcFisB+BZB1wfPK49h84CXocZ1ojPC94El/KMQpB2IxElFV?=
 =?us-ascii?Q?DUSpVNAj+/yzCZsdSRYsn6g6jzC+BnxsDXc58SRLanNToc5ZORH8Ex1rgmgI?=
 =?us-ascii?Q?lyofRP3SvkBVaaJlU9VkHezjTPaybj2jr5itQz/KfaAInpMGHKAs+Gx5BXzC?=
 =?us-ascii?Q?+QkiA327ofdh80d7fXIMxVf8zUx/iiIugT4NrdcB3hSQd2PqMgYFfGlZyl7i?=
 =?us-ascii?Q?DEaEXv5D5DvyUDCtlaZeTvRKaBeQfO0s7sZyBg2uBxNmkkkqF68R2p2/73Dm?=
 =?us-ascii?Q?P+Wga7Q42OX64CftSG7JTk0RBF4yIk7dEvO2BamePmbcLoQ1I/1NZmISu9p1?=
 =?us-ascii?Q?3HwQtKPwxRkow7BY08iJLnP+qZLf+pMhSvOPEnVcGZynqXk2tv0p4XNtVI/D?=
 =?us-ascii?Q?NhDiPPi5ye/G6JYH6BE0lXwPzOVIAkH/YBZUmIVuxAFWSdML2KCqpqd9iVw4?=
 =?us-ascii?Q?GReZQ4Pu+XrMKlHJnIbXqM0MjOnIGhdeaAFQANTZLjbsoLRW9hWoJw8HhWtN?=
 =?us-ascii?Q?1hg0+StJy8f16wYElKBHIBU/Qq/bORZlInBGGbwnvSan+6t11u7c7jcZymQA?=
 =?us-ascii?Q?PiNuH+Ux0FdgwxNmNogO09o+Yr5wObInoe9i93kJzK1GCg5biQK/GlRPZwlr?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d73685-1697-49f4-1ed0-08dd0043a6b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:21:11.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYEw/Nd6FAZaA2/uKye1YVCIWzw4E66w49uhmTTuHPXp0b2uyeqH1Nl+30LoXQWzyWfks4d/ehPZQn026sRirw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

On Fri, Nov 08, 2024 at 09:43:10AM -0800, Matthew Brost wrote:
> Add job may unavailable at capture time (e.g., LR mode) while an exec
> queue is. Add exec queue param for such use cases.

why?! if so, don't we have other problems?

> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 15 +++++++++------
>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++++--
>  drivers/gpu/drm/xe/xe_guc_submit.c  |  2 +-
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index d3570d3d573c..c32cbb46ef8c 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -238,10 +238,10 @@ static void xe_devcoredump_free(void *data)
>  }
>  
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> +				 struct xe_exec_queue *q,
>  				 struct xe_sched_job *job)
>  {
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> -	struct xe_exec_queue *q = job->q;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	u32 adj_logical_mask = q->logical_mask;
>  	u32 width_mask = (0x1 << q->width) - 1;
> @@ -278,10 +278,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>  	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
> -	ss->job = xe_sched_job_snapshot_capture(job);
> +	if (job)
> +		ss->job = xe_sched_job_snapshot_capture(job);
>  	ss->vm = xe_vm_snapshot_capture(q->vm);
>  
> -	xe_engine_snapshot_capture_for_job(job);
> +	if (job)
> +		xe_engine_snapshot_capture_for_job(job);
>  
>  	queue_work(system_unbound_wq, &ss->work);
>  
> @@ -291,15 +293,16 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  
>  /**
>   * xe_devcoredump - Take the required snapshots and initialize coredump device.
> + * @q: The faulty xe_exec_queue, where the issue was detected.
>   * @job: The faulty xe_sched_job, where the issue was detected.
>   *
>   * This function should be called at the crash time within the serialized
>   * gt_reset. It is skipped if we still have the core dump device available
>   * with the information of the 'first' snapshot.
>   */
> -void xe_devcoredump(struct xe_sched_job *job)
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> -	struct xe_device *xe = gt_to_xe(job->q->gt);
> +	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_devcoredump *coredump = &xe->devcoredump;
>  
>  	if (coredump->captured) {
> @@ -308,7 +311,7 @@ void xe_devcoredump(struct xe_sched_job *job)
>  	}
>  
>  	coredump->captured = true;
> -	devcoredump_snapshot(coredump, job);
> +	devcoredump_snapshot(coredump, q, job);
>  
>  	drm_info(&xe->drm, "Xe device coredump has been created\n");
>  	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> index a4eebc285fc8..c04a534e3384 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -10,13 +10,15 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_exec_queue;
>  struct xe_sched_job;
>  
>  #ifdef CONFIG_DEV_COREDUMP
> -void xe_devcoredump(struct xe_sched_job *job);
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
>  int xe_devcoredump_init(struct xe_device *xe);
>  #else
> -static inline void xe_devcoredump(struct xe_sched_job *job)
> +static inline void xe_devcoredump(struct xe_exec_queue *q,
> +				  struct xe_sched_job *job)
>  {
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2cf4750bc24d..974c7af7064d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1162,7 +1162,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_timedout(job);
>  
>  	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> +		xe_devcoredump(q, job);
>  
>  	/*
>  	 * Kernel jobs should never fail, nor should VM jobs if they do
> -- 
> 2.34.1
> 
