Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE9FCD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6838010E313;
	Tue,  9 Jun 2026 15:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5wWZ/E4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2AA10E313
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017492; x=1812553492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O63utGkUAD+xhT6qMRuNEsWCEE6Df3MOyd78KwJ1ejo=;
 b=b5wWZ/E4xi5az+R1lPmqzG9Wd19strQPdlTZldgVFlR17fCyx7/25Dj+
 iQ2BPjFwUca9VXWMzdknHYFirB6YwtIXD4lDo/kJsFF8CHIww0/PhdJgs
 8mcLj+reo+reDpg5q7FuIYDH7E6E4aQGpvwfebvrRiwgzdduo7qj6NsGq
 4eFxG7CCKGZ/fU8dSl2fT+MerecPeCm7nLZvvgxP5xQbW1+U3tFeXGYG/
 L8K1C15Qj+VX4NobZOcFThpqR3KyVG9h8fJG4rkEDzIeBsLtdoj55pMM1
 VU4ODv9VkgOva0MwjKdTebRYwBGgxCSlIxI9AX2vyHkwlOXdwJF3tVTVG g==;
X-CSE-ConnectionGUID: QvZBT68eRQCVrTOwXL8CGw==
X-CSE-MsgGUID: h+PEK8UhQTypGvcsQyz2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81758617"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81758617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:04:51 -0700
X-CSE-ConnectionGUID: knYnoupTTqi8mwANBYoePQ==
X-CSE-MsgGUID: dLsglqMMRNKnrYBh8ZYa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244745105"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:04:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:04:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:04:50 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9Rsd4UlrcQ3YRhSyLI1zquM63glC1+tmbUipG03v9+Kr4TR6RWgeH2o2F8nLdTWyALDjYl68xbbZ74ENL9PKwv2iu6gGoFwq4Zgga2G174W6whrBs8Bs8DjOIziK0kpJafrxhUp9r0j9q9o8PZxl4pOda/UKO10qm5iJKRs55eMyfjR/bf54CDBtT1GboNywKRJ34tAzLYUMSqX+/sEqKpzNCgiGHiTMmUOjZl64UyeY7fUURxDekuSqyTj0fZjNMM9xxF6Xu9lhbb77Vh8bWi4ZQHsygUDQkk2Vk5rZZRkP5plrcjRiZ3uAnPrvCYoBZqKuemsQAmaWTB3PfLBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbhmByHHA+jUv3kME8jPAL/Y4I8ACyNL6fjr4z9jGl0=;
 b=oTFarRUKujHtDGAYdR5Enbe3eox8kVRF744SRKQdcGLMho98y1NWHmCH4GSpogER0PRTnZhC9+ie0ugbousjA4DTazZ6RbXcXcSMxXV+ZjtXU0q75GjLKfMVGnONEyvt2p0sOaT9VjIVVTHcTtG7qhdzKRymNAxPZ5gNcg79hPzOsDQvf1cKxARuBZ0Hkgf3xR/5V/aVP9EHWF1GsF9L9tOrdS5NIuMNRuNJi7MMOoIjbcgjwGbO67Aq1Dh7eXrIveh7etMA6SDxLPaiqwtivr+LOBKbcW/i3D4Ntm7I6Ur+nib8sIFkyDrKVxzz4+7kZxrUDaf4J64OT8GyrOzD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:04:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:04:46 +0000
Date: Tue, 9 Jun 2026 08:04:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <thomas.hellstrom@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.auld@intel.com>, <stuart.summers@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: drop unused xe_exec_queue_ops::active callback
Message-ID: <aigri9zZPXvt1vUD@gsse-cloud1.jf.intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
 <20260608162745.338725-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260608162745.338725-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fbce75-7ea6-4af2-4fd0-08dec63871d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: BzJbW9KI7fNjFoWK3ALJyCc/bLy65Vjib5GuWLzVAFAK5gxBMJ56Cfy4NJkUQ3ZYzLnZRMEX/w5ICC3hWktoif8edsQon7SKUXVPEHu7pwjqXpxsd2z/1HyaQNwv+9iKHhTifw/oIDwCj8cCOwZ2Z5Pxm+n8L91jFa5ae1vBAxBHICVDaTH40+ivuE9eWb6fUavixPmdotslCGvpRUGeGXo9wdUEmAHkt403zwl0liVbR3L4LPQDDDItvs4imMQvojtAuEaFIE9UA9hH64F3QjHFpwHvjH/UKtSYOSxmS4Kbu5ogo3o1khwYAOhlOBKCymB4xGpPAc+YDStKo1CU86npmDw/I07NqIua1NwU/Q+RyCqy8NM8fa1DNU7vMe89fLD5NhGwpssiBf6NOVj2uArJ+ZOT3bcw/phHq7KaXbUIOoRcMXavHcGtd19B4Ez/IXntM+6WBDfTaFQwEtZ+qaBvLIwcQGHZFZVN5KTg3Kvk9WHrrK+Xib3YEwouBp2dyUItL5SuuV380TEOHOwX/3C21Bq01+fP+TqBRCGlUC9+9OE3MhhaVzvL8xvulp8D5GBpbwmV8T0wDjC0R+MQ4Yt8HYv1YKah/l2FrG5bjmmLh4A39lIe/IrEglW/JLICwMReudq5+pTl7WdHs21uQEkWnEkkS3/ecT48BaA0pls11AWGSnd/iKxq6UU0DzqY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEq9hgqTXya1xcNc2su0kCz8vf45kLf1TNMVJsv0rosXGi//kOMHwRzd5qwA?=
 =?us-ascii?Q?l0vuOB0s0IxpdzrfoXgroQ9s3RVJI8tr9Va1BejK4RNnj0t996vO4/xdubGD?=
 =?us-ascii?Q?x8flrqt1jclg1jiQ/ZhIdwIj2XB7IxEiQVNDC/6fxjJFxAviToKu3rH4YzoX?=
 =?us-ascii?Q?y+lHzDR7YH7JaEghNCjXpct62ORlKKOoGRzbDmBnd2vGTk+HKAgFjy9aeeez?=
 =?us-ascii?Q?iqY/K3Mt20/YR5V1JN5V54umMr4JKnka0Ojxe95dHBM3kS8aS1VK/bd9EOdP?=
 =?us-ascii?Q?ZFBsvwdoKd7wRXTwFVQ9ESK8EHPZ2LUOgoYQDq6cNQovv6fByd70kOnjIV21?=
 =?us-ascii?Q?qijEWOOoVLqC/7ZVnyPzk7cu6bqfleif1to0GiJ9dg3+4sttJhRIJHghay/f?=
 =?us-ascii?Q?J58FwDUt2qY4lLzsBwX5YeBsr4NFL9xxmdvUXpwqpf7zR5nyzKruP7Mc7Wps?=
 =?us-ascii?Q?Z8w3kK7NYrHjMTitsfdztZf7D/KadybV/4XOstE7Korq3nMODLQK8bqEg14O?=
 =?us-ascii?Q?2RlGWlTTZV380ohj7V8A/sGEc1xlL1x5aIHcyqA0JgO8PPGHcQZQND9BHPqV?=
 =?us-ascii?Q?O9BHesOcegEZtlkshgJibBvxJoWlfgtfFG41MK2K2nDef8zxbQOhegynsoBt?=
 =?us-ascii?Q?Cqzvz5rnegheMkiam50u1zsa2RXL2oBkoqciij4Zy7lHFD088WVjVZ9SJJXy?=
 =?us-ascii?Q?nwx+ilstRBrRvXp+MqrVcZFcrI3C2BZaixXkRLAq3bdc7bsmGce/xc9ffySc?=
 =?us-ascii?Q?zRO750YfEfSwF5uEgotRDsHXzz/CtBIHz9A5kuAVxPqD7N4TJ7vmUMnKUx5h?=
 =?us-ascii?Q?kkb7F3Vmf6fH/EZH0w7pv6aAiSV6B0s2waRGFGBWOOQ4MDQWkC3SFY93cYuD?=
 =?us-ascii?Q?xW158MCIWKACYX5+uj5dqgNnAxlKi9qw8u0sAMCERQmQX/rP19aRI+WYDvV2?=
 =?us-ascii?Q?jBoFTGCZRKViOMbFnKM2uOOhoO9dAFZnzYG9ek5AA6WJxDOCV84J4LdM9INx?=
 =?us-ascii?Q?bUohdyxH2mWBUJ5ZTlk/TycEfctCpsjsQC9j70+OTA5uyGxETw4/tFj9Qs2z?=
 =?us-ascii?Q?XwNElxrjqc2WpZzvHotz6y6lYgRp7gS/eCLSZp6gzJo3YKyt0G2hEOE7u7uX?=
 =?us-ascii?Q?8A+LkVTG/zq1dgJU2EJkWzKPgr8sn3IYYzypuDEpjKLgsMsUxeH96ANTQPPL?=
 =?us-ascii?Q?g/RwbA01wtEHYQu6YZsZMuKNZhDbRSH5Qg7dvklIBRpyHOjtTtREisfbqnjd?=
 =?us-ascii?Q?GInpOnR9cTIIP0p1bZPT9tB09YXLAiTp3C2XV0YijBNk7oK/tc+L5fgDrcj7?=
 =?us-ascii?Q?WGNzCkuf9P0ujO7I4MsalcCX/DPaJ0oJjcnXg8oprcA3VqfeVClnynEkNGEl?=
 =?us-ascii?Q?ntPNcrOHzVEm97BOHWVkk/lK6dRH6gD13wNV/Y6JfOhhekl3v0duTsAMvqYm?=
 =?us-ascii?Q?Xc9mLtplZMafZvefb5s0MMh98LGMsZF0lHgXJS/2w6uUkuAH9/ly3vzKkRR0?=
 =?us-ascii?Q?ioIpbm4Dj8HAKRewgsFUQ3aQ/gxbyGp4OU/h2QZbQLE8veutePxCuELhjPK0?=
 =?us-ascii?Q?bRB0F2S9rRt7eEKcv1qP4Rx3yRhNBB5U0VD0DTjffqIgXgHwSs2aOPO9Wrez?=
 =?us-ascii?Q?wbTGNIqMaG339p853xwTIXc8fAzRo/jEOX2FDUKR6y+qAjd6u+vPuZuqaCt8?=
 =?us-ascii?Q?XqoD9m5VRgop0R1gOgzKkho5D+7WzlE3TJjgMxdDidrEA32jL5T3iCSJDY7m?=
 =?us-ascii?Q?I58QK0ExsA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Pd/cQSVqzXVH+iwwzJkTWVyhMhq0QCZDap/Pqoonound6ZoQmoA1CfmCpIKZt5Mr+r0YVa0sxtVrQawYSHP094g5AYrpE0JnEYwwWl5aWj3r0V/+6RidOoIWYpU1GFGVRiu1P/s+12XOlcuiL5cnqxfuvHNolLVS1b9OVAYzAMcjYqNRG1Cjq3qAL7Gi+B0VaJBWFmcRyIRdmubngunlMBOwUgNpRpa50pX17Qr2qYxztE4KAeH9oPEPnYjV9ZM/bMptp8W42GVkltbPGk0yngjhE6780e5lhEA42y0clYxjwBEoD25BFTMaxWWKj0aLbU7CTEXwJAtIoE5iDwzuxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fbce75-7ea6-4af2-4fd0-08dec63871d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:04:46.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M3AO1Og1R3P1Z5bchK3TKas3T11j7LJc6EDWipTDL4CuXgi4Q5UKnR49rmupYg7w/tY4oTU27DUtt4FHj12Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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

On Mon, Jun 08, 2026 at 09:57:45PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> send_tlb_inval_ctx_ppgtt() was the only caller of q->ops->active(q).
> The per-VM exec_queue list is now walked unfiltered.
> 
> With no remaining callers, drop the .active op from
> struct xe_exec_queue_ops along with the GuC and execlist
> backend implementations (guc_exec_queue_active() and
> execlist_exec_queue_active()).
> 
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 --
>  drivers/gpu/drm/xe/xe_execlist.c         | 7 -------
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 9 ---------
>  3 files changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 2f5ccf294675..d27ce24daae5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -318,8 +318,6 @@ struct xe_exec_queue_ops {
>  	void (*resume)(struct xe_exec_queue *q);
>  	/** @reset_status: check exec queue reset status */
>  	bool (*reset_status)(struct xe_exec_queue *q);
> -	/** @active: check exec queue is active */
> -	bool (*active)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 9fb99c038ea8..6b86b4f9cc1c 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -458,12 +458,6 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>  	return false;
>  }
>  
> -static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> -{
> -	/* NIY */
> -	return false;
> -}
> -
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -476,7 +470,6 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
>  	.reset_status = execlist_exec_queue_reset_status,
> -	.active = execlist_exec_queue_active,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4b247a3019d2..b29cc08e6291 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2220,14 +2220,6 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
> -static bool guc_exec_queue_active(struct xe_exec_queue *q)
> -{
> -	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> -
> -	return exec_queue_enabled(primary) &&
> -		!exec_queue_pending_disable(primary);
> -}
> -
>  /*
>   * All of these functions are an abstraction layer which other parts of Xe can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -2247,7 +2239,6 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
>  	.reset_status = guc_exec_queue_reset_status,
> -	.active = guc_exec_queue_active,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> -- 
> 2.46.0
> 
