Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A88C636D4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Feb 2023 23:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D16410E08F;
	Mon, 13 Feb 2023 23:21:45 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900B310E08F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Feb 2023 23:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676330504; x=1707866504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SMm5xzwqN4Fk5/scfCeWdnrZgwCez8LX6RL9uKj05No=;
 b=KvdkpHEHGumaTuAlw7WU3hU4xfu6Abyf/MDVI+xbqPnlMY9rwrJ7thzp
 DMy0FvuCNxzWNxf0DakRkfTHMI1H0WFGx4Jo8aMwEwHHjkSIIr+YCfqBl
 muhA2C2kng3AfaLlcIEOlAJBjUwlqPYP8z+gMIQNBFfQbNX1Z1ndjZWxO
 iGkMbIjzGdAIeZdQucWwk9pMmV2N0p2IaQa2c+1X7IqMmoYCBS20AFr3H
 AQURCBBajegiMhgf3rYKKNzAuK5HEt20NpxGj/l6xLpH9vwDmeexbxJTh
 I5ZXWh/rEJJVrBbGwPMcTr/+0ul6QIS38ymC2EIIEcSfRECwpSFi9hxkh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358430996"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="358430996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 15:21:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699326548"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="699326548"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 15:21:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 15:21:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 15:21:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 15:21:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 15:21:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDWQENW+WciH8sG8JT4esM6Db4KxVmkoJZQPLwhmlym0x5W0tJwCbPQpfvbNXzO+FqP2V5Q4ffKtBE4QaNFdIxiCmx+VWnJq1T4Lh50pA1l81zupnmbh7T+n9hzjM/F5CqbeZw4es+IWZXN1yLlfqI+MQQESz0/DZqV0P6fesGpkkL2i6PgbiJK82H9ojK1Vb6FE0tyCFrDvbphq4Q7Ad16YwFiqNbYaxL8p0P1yKtQuWfXYoUkg2MvVs+6ofnJeF/B+iKx2P9fAxebrsIyA7hxo1ag5MHuwWPUeYGAbJgg0qhMf83tRejUpkkw6cLku7J7Z0pNnQ6VeaYEG1KBX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfJYSMRchJzKhLczyWMidgXx3rrQNzZACs1UlA3k5SA=;
 b=P/dE1LVUfjomTNqv0W+z/29U6GRUQshVpJ6Su+ByE/rU3lifDFTD2YS2nYDGJJZXiDod801D+JHRmC+aWYcVHUO+rYvvCDWMsS3nEKJO6HtD8fggc9A6Zdj1rCMk1bEWAKlpX2DcUA0UpNMiP6UbuQ36yqLJSlPnKYuNMTGMh1jR+eMMMzzuuOS5S8neXFyt6hq2xuY+JRDizWCQli+mwAQi2S+3Kio1n/X0a/N0oVd2y9MsK28PXWOb4caH0+pz1VqlwSBLJYlz4ftG3yZM3E5grgJ83PP3OcCB4HwB1CRybHBHzhsakSRNUabWLnlOqf6CYRMQ/3g7QqLQHWYg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Mon, 13 Feb 2023 23:21:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 23:21:39 +0000
Date: Mon, 13 Feb 2023 15:21:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y+rGAG5HWN5pcvVM@mdroper-desk1.amr.corp.intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
 <20230203202409.577032-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203202409.577032-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 969820f9-87e9-43d1-83b6-08db0e190eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FvJhRBg9CfmXMWyeGz/rYZqLV2qAlS28umR9mupifR2GY/vLBhqSB8C95awEJwd5SuM3ahevm+yDWQ2l+yPoFWnWuuq/qdsDg1otiqtrgnqG+op4AAlK1eoI29ChpICIHNMB89NM8FwRYMQqlpu6GO8IKSgssqmM5KE8/bOASqkXmFW9xQyXW9q8GWnjg3SwRAd6AUhMuzoQX+bP5XtJkjwH1wXw3p6XmD3TPozflGbWBzmR3mt6YrdNNI+pJdWypgWG/YLODzlK44dZ25BDJx0M+IPVgacC1A3iqCA9dAi4YnjiSJVfglkEj0HXKS3MST7NKyz7cbMfMKNkHG/LpM1YqKAhyOMRhrJN4Bf440Ba+HT3MWEqYomFWTcJp6KxHZqGJ5J5hAXdZ1spXXMDYcGF4mb++mzODZPEJMUqNhbXKbW4NoS0TUlsUsDdCF8be9nr2XQWyzVZsdg1pDB7UIJWcqd4hRu/SvpXRCpNgYjTZD6cLfGYvDB6PAgvE5Mogox/NGjfZWSKpqCLb30WwkAEjoUWLp4Rcg/as1eBLeYbfQn2xbcyOVz1I4rsJJvasFLxRtoJdtK6szbLOlipGx/cnpd3KsnQh5E1N8kr0wOPcuIiTSTqQopO991jEs3sHian+vbXTCAvl0YixpfSAoG9gxoXWF0HrHIl0baCSAB3I9rdCPawqPdlwroY8GDM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(26005)(186003)(6506007)(6512007)(107886003)(6666004)(6862004)(8936002)(2906002)(86362001)(478600001)(5660300002)(6486002)(83380400001)(82960400001)(66476007)(66556008)(66946007)(41300700001)(38100700002)(8676002)(4326008)(316002)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+LmTJTOb5VrOdhxq55OxxHsZIEhiC6LYe41TaFPj0ml2zGkK6XA8QCPy/hk+?=
 =?us-ascii?Q?fA1aFrpuAk9MV4RwZz7BOpUcBmCz9mgp4qgED1X+J+saj5Fug7qAEw6vwd9t?=
 =?us-ascii?Q?7bFdRM7aJJ7ejVRL6vis624DnYmmpgesej1kr9r5UTx2VahJEFqn3sYKntf5?=
 =?us-ascii?Q?0eaOwbOAMyg4ZxQhsULmYcHeCqQqvOoh0cPVWVAbZPrYLibw2VADmIaa1pYU?=
 =?us-ascii?Q?kcUq9l56g0ser77gg37UdNcAGXMqL5qKBTw86QNmNBoeXlVfP7PkIlDxeBjl?=
 =?us-ascii?Q?NuEiYbbMGd5V+6L8NR0tf5AtTV2fIr80vtzS9riuDCpVtZvVs/ClYCij5zi7?=
 =?us-ascii?Q?wLmJFuPm5NMOCN5aK82E/ZtVCJteL2TDekVHC7R6RzVjpUQgTdnloWE1d6iL?=
 =?us-ascii?Q?JlgV6djT/y25noAIFLxf1NSGnkbNoonlYUs8kWDdSZSp75D3PGsDaVw/RVBv?=
 =?us-ascii?Q?gPy/tURgOH7jI2P/VNACRXYbjl4oDhCgR+/ntQDDD4eWDb/U2KvN4t8t+YM1?=
 =?us-ascii?Q?toq+vFgVKxdFK7tbscTBSg4y1/5QgcY+a4ikgsJ6hgPySsJ4TuHEXI7ACATI?=
 =?us-ascii?Q?WQQ2qT5gcO3sXLqGvu0LACKyiYbKXxOCxBXKdP+L63U4DosVzbHBNJgF8zD1?=
 =?us-ascii?Q?VqZeNRMEVszeVQaYh6pmJiDtf8ZIR76N7dEPxRJnXXjlKK2mxoQO3pmJi+21?=
 =?us-ascii?Q?WjsZlxmuKd2aaxQ72AbyxhQaco9Vzk6WBVNTERJSiStKxlELfg0+u+caXNdh?=
 =?us-ascii?Q?d49/+J+jlv0YETpE4DsNFnwYiE+A7/QirpMctKP19cDk4oU+GQMpAyq/CFcL?=
 =?us-ascii?Q?K4n4vylTsz+L4jefgOc1Zlk+xr16Em5pwtxVRQCwnVUcX+bwIEFnpNoe/9Ux?=
 =?us-ascii?Q?ab+O4MzCMjkmGpBeAnumzqfL068mY2ZY5vn+j1KBCKiUzNO7/ytUUb1vhmX4?=
 =?us-ascii?Q?b6tmbwLZsTly+cGTaXyJm7ZHSFsaJVtPaWRVgswRxoR1IF5ZHJXFk+D+fID6?=
 =?us-ascii?Q?foFBrXULvO2QO4hHFCCWtHDizmI1iHyC2m9Qb2JvJz7kQPtESJx7JsijflV/?=
 =?us-ascii?Q?do5XY40+cS1Ox7zFAIvf9rUsPFMu3lvOPenLuiJUbKxKZ5O7luGGqAOTHOqX?=
 =?us-ascii?Q?vbRWsFMgx830y2RIoqyxTZ8dw83ENhLleXFNtbd7AWVNHIG5z9l27VZOZ842?=
 =?us-ascii?Q?QfWgPE0fO/4YlEsXpNpjPQ8sI8tLhmrqWKkzG6vVol5gJdkTTN/wSG1Ddccn?=
 =?us-ascii?Q?K3l0KhSrf+nYqDqxwfcvwL3ddKgYpi0dhZJ1ktXGpwtBJAo1cDjd8aG37OpF?=
 =?us-ascii?Q?NHYlfvIGDyPF0zBIRHPlWdViWAaRLUnGBHqYxJrYYZGnJXibD2AZ5899vfQl?=
 =?us-ascii?Q?z6ElMtOh/vTPbAyYX+Bn234pJnck0WduDpIGUzjgDSW2ObnoRj2v8eH/GNdu?=
 =?us-ascii?Q?1h1sRQPAzNTrGnQhsSA7jzcT77+mN9exgD3d8LCGqYQ8FHNJA7FXWOgVJQOa?=
 =?us-ascii?Q?wFZTBIJCAq+yh12d611Lg8nB8keGFVnJ1aBw14w12VT+DIWRXRbnfOnkhlU6?=
 =?us-ascii?Q?+1M64kQpor9dNBskQMRalNIVqF1C9RdDMFfGuFRcGIqyjSywZ5SPUmNiMuVQ?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 969820f9-87e9-43d1-83b6-08db0e190eb6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 23:21:39.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/dX2nKPMR+WAIWYjqQ/w2Bw3c8gYuSebqN1mTqy68wkyHqho4132XGtPzdpfMlWchyZmH1oWZddyUZL2oxI4Q06ZBNOjGFag2J2UIs/mMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/22] drm/xe: Kernel doc GT TLB invalidations
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
Cc: niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:23:53PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Document all exported functions.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 52 ++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 23094d364583..1cb4d3a6bc57 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -14,6 +14,15 @@ guc_to_gt(struct xe_guc *guc)
>  	return container_of(guc, struct xe_gt, uc.guc);
>  }
>  
> +/**
> + * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
> + * @gt: graphics tile
> + *
> + * Initialize GT TLB invalidation state, purely software initialization, should
> + * be called once during driver load.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
>  int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>  {
>  	gt->tlb_invalidation.seqno = 1;
> @@ -24,7 +33,13 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> +/**
> + * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset

The description here is confusing.  We're not really "initializing"
anything here.

> + * @gt: graphics tile
> + *
> + * Signal any pending invalidation fences, should be called during a GT reset

Is it confirmed that a GDRST-initiated reset implicitly invalidates all
the engine TLBs (and thus just signalling all the fences is sufficient)?
Or does the GuC take care of this itself while it is being
(re)initialized?  I know there are a lot of parts of the GT that don't
actually get reset when requesting GRDOM_FULL, but it's never been very
well documented exactly what those are.


Matt

> + */
> + void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  {
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
>  
> @@ -82,6 +97,19 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	return ret;
>  }
>  
> +/**
> + * xe_gt_tlb_invalidation - Issue a TLB invalidation on this GT
> + * @gt: graphics tile
> + * @fence: invalidation fence which will be signal on TLB invalidation
> + * completion, can be NULL
> + *
> + * Issue a full TLB invalidation on the GT. Completion of TLB is asynchronous
> + * and caller can either use the invalidation fence or seqno +
> + * xe_gt_tlb_invalidation_wait to wait for completion.
> + *
> + * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> + * negative error code on error.
> + */
>  int xe_gt_tlb_invalidation(struct xe_gt *gt,
>  			   struct xe_gt_tlb_invalidation_fence *fence)
>  {
> @@ -100,6 +128,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
> + * @gt: graphics tile
> + * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
> + *
> + * Wait for 200ms for a TLB invalidation to complete, in practice we always
> + * should receive the TLB invalidation within 200ms.
> + *
> + * Return: 0 on success, -ETIME on TLB invalidation timeout
> + */
>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -122,6 +160,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
> + * @guc: guc
> + * @msg: message indicating TLB invalidation done
> + * @len: length of message
> + *
> + * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
> + * invalidation fences for seqno. Algorithm for this depends on seqno being
> + * received in-order and asserts this assumption.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
>  int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
