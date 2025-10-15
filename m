Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3EFCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51810E0DA;
	Wed, 15 Oct 2025 22:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzduPj8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16D10E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760565900; x=1792101900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7FA/yKm/KIvPLI3jwqRyj/DUYn2KjsErnuUpnIh1RzE=;
 b=fzduPj8L3pTU+uau3tNQxNQVNFPpNnDTdixyNxV4eBwuNOoYh4EREYAp
 AYLcE53/CQlV09UOZk594FWZv8YmZI5CEHo0wC1jp6HNsvOo8w3kuRbwY
 iOrWLyKPqOs/3pCG7vHQeSorn2wI2iyUEDR9dsjv6MeNGgJmbL6JsB8zE
 oFBLlms/MbbswmS8qvCwIMDUdjPJcbh/pfSkCg8V/i3sz5ouGyFxK5mKT
 Qqb4q4SqbE67av+XOZ15kgx4s5lU77XsWa7t6FgtiJ+1dHcesIyHna73e
 nLl+HhdnRnpo8xLjOyCaPaJI9VVpsl3ZMlCaNjpRo3dPUdI+/4++VnYVH Q==;
X-CSE-ConnectionGUID: TLnqMZf0TNesVkEJfj1Efg==
X-CSE-MsgGUID: Wao5KsDJQJeKBPSajSaI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73030223"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73030223"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:05:00 -0700
X-CSE-ConnectionGUID: khOoQv8YTM+HM2/hAp1Mcg==
X-CSE-MsgGUID: JTPNfy+gQ0KbbSVZ9mk5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182077110"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:04:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:04:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 15:04:58 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1KMcyHaxzigXluSLGWKpfpgHw8QoyFM5Sg4cs+9AOvdqfsWVEpEBKihgMXOhiCRVO5ZORFS3SGKQdHYJOHrYrv765t5MdHvr2MLhAgVs60XFZHn+hN5LOpS2AkNKxJMPcCJ5g3c8r+wRlIUc/b8jJ85KEOG5OxEHf4QNAN42mtvuwn6rtHVmuSYVpucWl+2N/Qu4DI87n81Ip1EotjkzUSe8D/MJywFKeo7wNAmQ34x/LgA76IiLPBm5n9cbGjkj6/lR9SPT2LzbDZwGrH4LtGs/iaO523qOu2FxpnZspBiDi3uu1KG+igi0ES1Qy0HKinpJY1baslEy9/PPdPvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUFfrUnoocBXre5MHrH2+YMNW0ybFYPSJhREP7IUhIw=;
 b=wn8AO91GGgw2rTiktDRWGC5zD9l8YiI2+8D1G15/dn9lrKysw8UqYHbJNz++Kq/oWMk6Ne2+gMIG/Dveu+q6pTl0KD83PaqOjJHsoZnf0IdAzjgu92sudYxflxJKmCXE3NHDYAocWEgHFl/Q57LHDbjSBMsCNQbgd7jHZuh84o0giJZ1Xk/0dUEG2bAhmUB3G/99v+Ju8X8e/kDn7HbIavmuzgdqYs4x1AO+N5KzyEBRbZjmW5vhlbSr4pPIPwZ+wuRjBnzJFeaE0ZAuX1SJ/TdtKKQApfc+XpVj9zhsndMtTyu4oQXWxtLhbETj0P1Mjqtl3/0vUFJlDX9b2GZDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6041.namprd11.prod.outlook.com (2603:10b6:8:60::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 22:04:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 22:04:56 +0000
Date: Wed, 15 Oct 2025 15:04:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 06/12] drm/xe: Improve xe_gt_sriov_pf_config GGTT
 handling
Message-ID: <aPAahQy4TpYsFV2S@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-20-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-20-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0325.namprd04.prod.outlook.com
 (2603:10b6:303:82::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: bb51d089-b6f8-4c77-74e6-08de0c36e011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iwLK8gAMqt5czS8zu0Heq1VZWupnoyk8wOJzjLxLjKWC1tBZ2sOzpUO6z2hQ?=
 =?us-ascii?Q?K2eohxfnYmGyde+4/pznyVEFpEH+OkHlcaTI7884Ou2huINPyrsEb1qPhwee?=
 =?us-ascii?Q?YhA6GRb2+L/pDP1bXRWezjXwz3jSmvByaFoJsvU79yy8AnuB2VZo5J0/pdZo?=
 =?us-ascii?Q?MvB8Spu/VumgOJOrU2z0aw7zKGWhVS8zHi964VSqBxYAt12K3qmdvVEx6ba2?=
 =?us-ascii?Q?2hiDV2I33HNe2ZwqBYEV/y5OWYFjr1BC73iWQZdztjxJ1swIzZUNibRWSOwd?=
 =?us-ascii?Q?bJCkl9FI241+QaYtJR/JOIWZEaEukOL4uXHXyZ+WozmNKjflhBA9tYDA+TRO?=
 =?us-ascii?Q?ER1W5SQeT3dkbiSU5cqJ4EZAWtFE/pCmi6uiLPrkBCaJvmRocadzMg2sODkA?=
 =?us-ascii?Q?Xc1BEqNNgO3Do08em5Ytb41rzASXb/H8fwdrqLIzDdAoH8t8y/pG1y/+nSQl?=
 =?us-ascii?Q?l5iJOH61967Yp2PCp5yycs6FbOBNhFMdDukO2tvJbhg+ALi1ijcoSMXyPoLM?=
 =?us-ascii?Q?LH9L3A/jNoX3AB/PT6Rt2erkJnxoDX0ct9BwVb0uKgLflMpLNO8bMvMA2jXw?=
 =?us-ascii?Q?DO3MdY9g0iqPV5SziOOp8yeJsUKmeyGOCyxQQjNo0De1napehJJF0kyMTLyV?=
 =?us-ascii?Q?PkBt1c9LfMOGH9z8/BI4sI455iFEl2vn5v7kJu/8HLdQtLysSdIDY5D1aoYd?=
 =?us-ascii?Q?F00cP4VkRkT8FfME7mSDSAPl/gyz+9X8JnEWy5fBVniPzNpwpVJxwrbX/X50?=
 =?us-ascii?Q?VSsr3cnUtCxX0pWCzCAfs/vBBG6UTvMuNylHLZ7wEj33jhtsciujqajzGdcd?=
 =?us-ascii?Q?+stU5eelyyJ/HDGR1aWUDx+z37vf2SNY7dG5LZVwnvWskNb+NHclApIZpbeU?=
 =?us-ascii?Q?Cp3Hxi15y4q+Wk+TGKL+I14tbHyx2XhaBTPuMUOKILwlDEXxROdwCeN/RdJA?=
 =?us-ascii?Q?bhq4Is8agxNyLMF52/Ue/TZduCzyhL4nJPCyaIj0z40UggvY6SK1JX9oH2h7?=
 =?us-ascii?Q?e4fnZy/2BKODZQs5mm+d1/DxT4eO4WhiD+l+xmAwqUNtDwHo/O/nXjv7EeGn?=
 =?us-ascii?Q?uM8UXtWxHTeL/c0lJ6QoRDJqmIhrZMvaJ6hVIzQlg6GXUS/f6Ws9dYw2fFEV?=
 =?us-ascii?Q?+OlIQ/4FA1KWP5i/ez79Z6/VT8XniNHzW29lVuI98n08z2SLL6iGjGhc520b?=
 =?us-ascii?Q?8ydidCmYQjZkhQOB4eDnFAfKJouVUIY+X9kcX+Ih1XxEXlxef9YEFeQZr8vK?=
 =?us-ascii?Q?xccHcY4ve90cm8MHs4tIJV9n34WmCmviK8xy84UYfxojlvbreWhEj/tKrsq5?=
 =?us-ascii?Q?Ro1nkb12BUhfbj6TQwCdF3+EbQ9QYgkJSykevyTrWr93aw9a+fG8oZjpEol0?=
 =?us-ascii?Q?8VUqMx6Jqd886Y78Djv21z/nLDFEhz/yz1X43uLiNrLEYCHWarNsTAFZ8Gjw?=
 =?us-ascii?Q?oJjnbRLWqOIUGUGu6hr10fMmodif0s9z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1LNq8lbOjs4ruiQDmO1AH815jt+UIJvHjkVuyg3zqzNFzXhG4m8P2ImyTKyA?=
 =?us-ascii?Q?eJKWIFiwEb0mKV4wftVvCLsbcQ0igHhGTbmSaigZu9S7wkiejd1Z3OWDdV7t?=
 =?us-ascii?Q?J3Ct96haBCaTLN9Ka5CtQSFiPPQN7M8/uN4FsKZPibrJfVufRzegHTIhdsNe?=
 =?us-ascii?Q?9pqAVMsr6EnaTkQuV5eZA58LCjx6WPAv4bN4279BlG2g1jZL6LwAZ/awyGbe?=
 =?us-ascii?Q?LHvzBx3pzCWtBGvCsdQleef18d2SzXQWdBWNim3/u8o0JVyIs0RJ2MEi9hnY?=
 =?us-ascii?Q?6a7MjFIrdVdxw6vPJWGZ4Q4Nn+kc/oTsENCMPSxoJDR8WA7jUBxdpg7pvz5q?=
 =?us-ascii?Q?8mXSzY0O9DIs9YQ8sJyeG9/dGOu7sZ3fAEXRA3xlIeONVjCQNQlN3f9aGIXQ?=
 =?us-ascii?Q?+U5eRT+NwI34eswukAtlNctVKvAkqjhQ4gBTYLL13U6aTcRXoHhfc1gdEV0V?=
 =?us-ascii?Q?r/tJzQj1JPgSOuK/p5c50hfFbIXJeejj/Zqb2tY5VXKVe1TAWHvCpbuMQaPb?=
 =?us-ascii?Q?23Gzany4aWJWqF6YiccRblCm/gehruhI6I0zl5QGenKPczKWzxdxLfol51el?=
 =?us-ascii?Q?UVUl+WiJ60Om7kCEFAnZWoSDjQmttclL0Jroz22YOTGYB2kFzJQwVZpshd6d?=
 =?us-ascii?Q?Y006nbzf1vRyngcSygxEFG1U9upbp+T6BZbLpMmwrBnjw+T4jVtUjY92GF+w?=
 =?us-ascii?Q?TMeWN+lTSeCECfLHUbAGkoAe5AACUPyT01P8fFWvNgV9v/xeV8Fr0KTH0dcK?=
 =?us-ascii?Q?q+u0Ot+Qs57ilWZsDsWDDKTi32dfWJKu8SgFnvGFH2NyzTRJAoWTQhnCu9JY?=
 =?us-ascii?Q?LVlm25AXrgHtqykk5gZsJzuCG+vDyE+b3GKD+IKi7PsAXOxERrqaoDtbmXHV?=
 =?us-ascii?Q?DeWzIOIivDWec7mHT3SShlt+sZckD2zO4n5LFBBrQ4hjXX/P3sq3JVhpN9sW?=
 =?us-ascii?Q?dVwZEBz6xLeIs7OUHLnj45mS76ycDgVb6gXbE+o+N/gxfLFr2F+Huc7Bojws?=
 =?us-ascii?Q?3mFnKPk5Xvyf1uenY06Dp10rtFHAeCMXHq/MtuCqfFyuK0P7stchRlyCnPmP?=
 =?us-ascii?Q?2jNbezr6N60dJLkyhlQIyrm6YIj76DsMAWSFiSxUyFcPjCaqGWSEeFJ65IL8?=
 =?us-ascii?Q?Wd2136t7KZtqct8kdO3SQOQ+VcdxsbDpN8Q3zZP8AtNU7VWNQ4C05M8+7xVw?=
 =?us-ascii?Q?yn9Tmvdl1bX4hEeETOgg8hkQ5oeTJQ7s+P8/Nxu72PsLPtdoXdK2SQ2UNnJQ?=
 =?us-ascii?Q?CJ4C838ZLjlPudEqafCUHGG0VWz9+q7Ug3dvSN98jki3Ej6ECBHk++uHuG7x?=
 =?us-ascii?Q?sVBjOlyVIrlRXVoPIv3QhGHHBsWPk9vtTU1BYmDw8w1/6zAySvl11mjlcvAl?=
 =?us-ascii?Q?bVn5Xk32HdTi5c6X9yXJV3dGvXH3qHBXlkoysmeEfn9wuDs8pSKIg6U3Ndv+?=
 =?us-ascii?Q?Ci/1kEsIoFAej/Thr/y9I60qq7JuxHur6LytnOB3gXbk2JFkt1gtzbvIrDhw?=
 =?us-ascii?Q?fMO7u70tk9EEg0SKn/5gWFR8DwZWrkiveE5Hc94illyZP7bJVxKbdV8jEc/j?=
 =?us-ascii?Q?qnm2w2YodohBjDaLJ91vh1/tNoVPy7czu4sMNrT4oj59hYnak0PxU2jvgWOY?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb51d089-b6f8-4c77-74e6-08de0c36e011
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:04:56.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ17BwDqP9beFsNgcMhhYGJel2EGv3jqVhGfULVqeYCEgSkGq3Cbmvkiq+rw9B6DYPAKpGB473Iomu/jYgSKiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6041
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

On Wed, Oct 15, 2025 at 09:47:15AM +0200, Maarten Lankhorst wrote:
> Do not directly dereference xe_ggtt_node, and add
> a member to store the GGTT size.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 15 ++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |  8 ++++++--
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2289756761636..c0dfffd5c553b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  	if (!xe_ggtt_node_allocated(node))
>  		return 0;
>  
> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
>  }
>  
>  /* Return: number of configuration dwords written */
> @@ -495,13 +495,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> -				vfid, node->base.start, node->base.start + node->base.size - 1);
> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>  
> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>  	if (unlikely(err))
>  		goto err;
>  
>  	config->ggtt_region = node;
> +	config->ggtt_size = size;
>  	return 0;
>  err:
>  	pf_release_ggtt(tile, node);
> @@ -514,7 +515,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
> +	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
>  }
>  
>  /**
> @@ -2516,11 +2517,11 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>  			continue;
>  
> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
> +		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
>  				buf, sizeof(buf));
>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
> -			   n, config->ggtt_region->base.start,
> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
> +			   n, xe_ggtt_node_addr(config->ggtt_region),
> +			   xe_ggtt_node_addr(config->ggtt_region) + config->ggtt_size - 1,
>  			   buf);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> index 686c7b3b6d7a5..9a8e66c8b539f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -17,10 +17,14 @@ struct xe_bo;
>   * Used by the PF driver to maintain per-VF provisioning data.
>   */
>  struct xe_gt_sriov_config {
> -	/** @ggtt_region: GGTT region assigned to the VF. */
> -	struct xe_ggtt_node *ggtt_region;
>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>  	struct xe_bo *lmem_obj;
> +
> +	/** @ggtt_region: GGTT region assigned to the VF. */
> +	struct xe_ggtt_node *ggtt_region;
> +	/** @ggtt_size: Size of GGTT region */
> +	u64 ggtt_size;

Nit: Couldn't we have a helper to dervive the size from the
xe_ggtt_node to avoid storing the ggtt_size explicitly?

> +

Longterm we should likely move the PF GGTT config to a per-tile
structure like we did for the VF GGTT config. IMO we can do that in
follow up. Maybe ping Michal for his thoughts here.

Anyways, this looks like a good cleanup for the existing code structure.

With that:
Reviewed-by: <Matthew.brost@intel.com> 

>  	/** @num_ctxs: number of GuC contexts IDs.  */
>  	u16 num_ctxs;
>  	/** @begin_ctx: start index of GuC context ID range. */
> -- 
> 2.51.0
> 
