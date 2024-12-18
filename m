Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84CBE77184
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 03:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E4E10E64D;
	Wed, 18 Dec 2024 03:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9IkIXfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C8010E64D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 03:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734491116; x=1766027116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Cu6hlMTOMHSnEBJKW8wE62QJ943PWnPxT++QXoO1AM=;
 b=j9IkIXfbZ26AxXB4Pa7Wd2DOqgoHc6A4wYvm8mBnUom6K6m5URb9nSK6
 SotiOS1kOZWE3tOK3ahjMlJVZiWPcNfNQrzNn6RISL8w26SK0O51peD6I
 01Y0my612Se5mTC4dLpXMm+rbb+QCbdQ5qAkeGieFxpCGWsugp8g+F2JQ
 nAqw9YbBo/KIdvIdrdDPQ6y/C6aYzuX22jmqiiLKaQ4C4s3GDJOZ/Anv+
 kIGvkE7QD72n9ztziFE6mTisDANnD+BCUtZA431xZpB50GNIie8zGmfMD
 oz8JdushmuHMtCBCQbWwHiR12GGuxhM0/6a8qa1v4tw6f86qZeff2KpAB g==;
X-CSE-ConnectionGUID: Z/5hOhtbTp23QV4q82HpTQ==
X-CSE-MsgGUID: 2SXZOFz3QfeoHDxPLQbHCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22538166"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22538166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 19:05:16 -0800
X-CSE-ConnectionGUID: +ZIuiCARSvCV0FNjoToeqw==
X-CSE-MsgGUID: 2TTJxCQGRtSJ00qgfJ+0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97584613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 19:05:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 19:05:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 19:05:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 19:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8RieqQXwR2poHMFmsF7FjfaGn/oLdX55Iq5iWS43G1dTlQ20ucepLDHdSIAe+pm0GTI0/2nFrTtoVX8N9RMzK1HEBbf5ldoOXjcJx4s88KBwQFhIL5S8UCFS0Lid2hjhTrIRrV/OCmTKe3T7Rg+bD4zGiYklzDnonlRrcS5/mIdqs0bSoEB938O0mT+5GyrDDeqkvG1RwMFWZRqy7zCKl3sO+hYVw7ZavXcjrd/GacgHxzSEE4ksmvpql+l7lXfxcCb3ioeHsVJZ0L3JX7FRMsxrbxyuqgy2J3J+Dbu8JTiguNREbzAOGzT5a1M6WaaFfVhw9WDXgZRtxZGyXHIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O13LnwESg0hSkfHZuHy+qTCiu8zrB43UT1oGiaU6Plw=;
 b=zFVODJREm9UW3ud1RP9SQZP3GnyAYMm0X45j80lqrBNKlpImLnNfCzHjWdvQ9Go0JCzCGybaOR0JvWy5BvQV1o8gklehpnmG/9iNF7wGr6vdX74OAa4N/9k60djfk1VKQOD5taweBZp1kq0SlZPq8E+FU426WUPGu5TMRgXQJXoQ2uUwnHHLuZKKBlbtthrQlbuyBJnl/yqpMzmku/iUnOTKOuAxCBrTo1Mj7r5waj6RHloa+ncaf2Q9cFKBH4BerJy9hs2ZEzdVc4uqwlz5UhwXeN1DC3TLgMZQHQKgxyvZCzGn2EprgcnKzj8mH3CokoaMWf+x9td86THK+IQPng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 03:05:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 03:05:13 +0000
Date: Tue, 17 Dec 2024 19:05:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: trace bo create
Message-ID: <Z2I8FDF0Harjii9d@lstrano-desk.jf.intel.com>
References: <20241217231420.2361302-1-oak.zeng@intel.com>
 <20241217231420.2361302-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217231420.2361302-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 711db321-57a2-450c-0ca8-08dd1f10ca25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YadtX5Ihg2h+sJvbos6I4OO1+SKy40xJ3R/dCZ6jlKD1bnBwL+e3tlsM9fPK?=
 =?us-ascii?Q?lHHSy20ZLMS+frLLvNe15ice+qwT/oT3ISZsYVGZ348+q8U+8dc7rSzj304B?=
 =?us-ascii?Q?lCEFnmaRuoGvGp+wb6ZglPYOD42KFkaeKt+Y6ZDnzQgOgLxPZZRWL2eO1dXn?=
 =?us-ascii?Q?XPb5ySfdpw9wmmDb1cbizHBc5wFjGQjyaK7IhD6P9UJ6l+vhyhTorjT85eUJ?=
 =?us-ascii?Q?imrJeSSfLuJS7yZnJhVyrbXbioxJ7CCQoVz8sxiU+eK+eFPN01+r8oITnWnO?=
 =?us-ascii?Q?z8XxkKmHQ71BeakdeBwXM7LF1d0md1eC+iHNAk96SFwQpu9b6on7QAFNiI26?=
 =?us-ascii?Q?PJulOFd1Y7GnrqvOFqfowTgbzjfDIH+WYBqiUeVe1AECtrLjXgSTdSecoMva?=
 =?us-ascii?Q?u1zIfNJ3qOMAthdojTx68xhtNxEgt0R4NP5jyoTPBGI9NeOmvdeXjwSMam8f?=
 =?us-ascii?Q?zp63+ZAfwelRmkemPlJyYy8CuOKmMr78KdHwCGiaMN3uEnUGYJJfpnKvtI0G?=
 =?us-ascii?Q?XZl4hY5M7piarJFB7O5hhZ3L8NiyK3h5BxE0Mu9zwF8wa55InDLv5PdT+tbn?=
 =?us-ascii?Q?ujNoY1Y1WK0zRSLkXLw2XMfnAjo8Z8TuuVx0U8TiWQ/b0fGFCqCanxCJXETh?=
 =?us-ascii?Q?VnX5xtCDDZzbHpqutKbb3chv8OF12LnJNCwDTl2lhi9tjU6HWVlluNI8optJ?=
 =?us-ascii?Q?9QAxxm4rbvfcQYGAWrfw900gjtY1U3tvZUMtE+3ptc8k0mdkiURbJPn8J5m+?=
 =?us-ascii?Q?sOSWbM2evbPhcPhE1D9htulusOrR5ENhkIdBNqWu1NmNFr+rDw3TOtTLcd7e?=
 =?us-ascii?Q?wsGTp6pBCjstao8P5o0DEvVDJeYyTgv7gOkzbcwGoJvcnPAvBZ/s4d3xpOIe?=
 =?us-ascii?Q?INwhtZncZFeBbEht63BiLtPuJbY4fn9RQJrbi3wJ9RzpASNYug51zLxYs66V?=
 =?us-ascii?Q?hScmJ7jgsThktUDkD1wZ5deJeV9cYqAKJDtOOGgp7riw5pw/XBJbUxToGaax?=
 =?us-ascii?Q?Xgkp1it//i4yR/bJ4mjoSsVjDXf8+VH9NKQ0uI9RKf559b9CJupQUmPlkl2i?=
 =?us-ascii?Q?0PQXmqKhozntYZ4sUHNV0XJc9Q412xWvcl3pBB6sCqZv5goNiIl+Hsar56EL?=
 =?us-ascii?Q?V3Z4VfJVtGV8QYnG8Ab7Z/9akqsskjUywwzx/r5RJZ4dkaoP1eDuxvTSvi32?=
 =?us-ascii?Q?ksdjCztTFlizWVMERCf2Ed7ZnNmYkFA2fFlHgE3zzJlDyxAqcKzUNmKHCUBz?=
 =?us-ascii?Q?TqHCosxHYcPKh4K1+Lk92W4Zy9qBnUqWkPyuhYRuCD6I/DzTZIhpJn6SAl3i?=
 =?us-ascii?Q?RRd/kG6bGhPpLhbDpYKreYEKDlP4PL6KnNGvWag5hcMp9bFxU+8ToGKZErJi?=
 =?us-ascii?Q?tWxO5Jf2ccPeW+UKYPYJx1gmGhbA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pzr8WI+H0NT3QCgzcDdJa0Vvp/fS2Yw6exnBwDxlDygHpulc7/sqzxf7D9aV?=
 =?us-ascii?Q?AcQd7ARbGFRubsMXRr7qcUkKoErVcmCs12+vHrCofRXNHHhMWMa7YE8F0PoH?=
 =?us-ascii?Q?OWzNsdDs7qFVak343eP9ljYNHUdEAixTG8Ut9CxCvYq94wJWmVxXvJlm+SbA?=
 =?us-ascii?Q?ZaG+p6JFquil3C21JDfg8XMDLWQNR8igV/PwhjpNLTI4lzf71IT2C4C6WYsd?=
 =?us-ascii?Q?BOWctTLhn/Dvt/lmfLOO6jMjfTMAUmDdoytfOylV2A/VDM/DIOw0TYynXyGg?=
 =?us-ascii?Q?LYlW3pba4FZffcBIGDP9QfsWH6r24/szYyR6P+6Qzma+ZZ9dsA0FMCif99sQ?=
 =?us-ascii?Q?tvfOdIuwnb+KpH9Iwyog/a3Nw+GLkhfMb4ukspJSPv6jHWqvUMw1EmChACYT?=
 =?us-ascii?Q?9fri+HRjbpjmF1U/7I6Q+tXYSStgA+v4DT33rvf7KA937+qKd3FmIQpYGvtm?=
 =?us-ascii?Q?JZ+3Qa/CyHzBPYEZ30UQ6YOFVvgDlMGi/IOnvQcm5DQ0nAlXmwxpfFo0ZszS?=
 =?us-ascii?Q?yTh/+0lea7LAvFOni/6jQVd0hwwMY8Teo97A8CKWufuaG+gKbRvqjgd5pqQc?=
 =?us-ascii?Q?TfYxX6v5ZL1Da6BzwWEBbwZ6b551tUu0zDn+zns9H554Hul7c8M1PVXjCcrf?=
 =?us-ascii?Q?1UDEzkjIFyg0Bwzfmo0zGV6J8Z0W4rX9kRceK6jx6dthYOrROjwTWQibT/38?=
 =?us-ascii?Q?1uk1l3DO/pE4Thf6IR6DYxF3Ue3kZCcFumZpn17NeQEtnsM1xd+loPmzvxu2?=
 =?us-ascii?Q?YyrLhZTim13wIglF5SKHN5Tzdi77JNAnMn8FNukBinJw/off80R0A84L5LXz?=
 =?us-ascii?Q?ODDUpcnJ2LHFDuI3Vna/2QqJ4VUzeMi+EXYcxosCQiNnaPU1yQV7YUN/4yhn?=
 =?us-ascii?Q?/cjXga6Yx02UScT50C+/00KjrLIJAOfAl/pa1DJRbvYOb41xc20yeBaXD56x?=
 =?us-ascii?Q?FXHiaSfRoizWHNI3TUgx+678ws4PCpDUmeYJHJQGp+2aJdOkLP49vPCsFIHy?=
 =?us-ascii?Q?3cjB8q2E9Ch/xZKitwY2H7befG2x7jFxUmF9GKSdTcaT+RAkf9Zu4W9R+or+?=
 =?us-ascii?Q?xKML/WoZGX7NjZ9OxmOFSPbBkEGhbji+WI/aRdA99Wt+TC+XG1x7LNiYA6x4?=
 =?us-ascii?Q?0UaWx1W/vq0y8HAC3SiSSOBlZfG1YXnnP3foirOrh7T1588FihBTUqDVF22x?=
 =?us-ascii?Q?77y8ZAI5D8qMo9drsiemUHjYdffJchNTadLCRW1QDbGWT1a5LrHJH+W1oDe8?=
 =?us-ascii?Q?sUGbBhYEXUkFABSL6HZbMOf6sc5fZi22vSwMsQLCkrTPqVLNUN+22C7quDzU?=
 =?us-ascii?Q?u8pZ8L8okh9n49Wb6qylOlFgmPy8p5nJ+8wHbjEUP7Z+VyfmDPKbtySTIaPJ?=
 =?us-ascii?Q?Zt3YXDHcMHtJTAsgTGbIOCIDXkS47fxI4ZaFmjfX0Qvs3fiaoUtLF+um2rd4?=
 =?us-ascii?Q?D+Al3ZmNtT1zB55FrfOJgbImhjpZ/EAaLj25I4DMxcmrDfAqqHMncFVqkfJ5?=
 =?us-ascii?Q?QJJknY5nejXeLBx33M4GlaKLJTKCQEb8+7vgogHS8eV3P3i+DrxHW2gCSOCY?=
 =?us-ascii?Q?vobDrVhaMcbCEFHzil40tOulF9HsyLv+fHjorBhL2li/FOOXQuDVR5Ad23BA?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 711db321-57a2-450c-0ca8-08dd1f10ca25
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 03:05:12.9461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMm8MvODIFvPqNJSmCxsPC1Va0SsjG2IG6wdjVnKTjYJhdiLTLynSJ9oQIA5jiJgJfSL1UP7HjWBchCX/VEUtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

On Tue, Dec 17, 2024 at 06:14:18PM -0500, Oak Zeng wrote:
> Add a tracepoint to trace bo create.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 1 +
>  drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index abdeed1c325ea..61f4326e96504 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1649,6 +1649,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  		}
>  	}
>  
> +	trace_xe_bo_create(bo);
>  	return bo;
>  
>  err_unlock_put_bo:
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 1762dd30ba6dc..53807f2ef4808 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_validate,
>  	     TP_ARGS(bo)
>  );
>  
> +DEFINE_EVENT(xe_bo, xe_bo_create,
> +	     TP_PROTO(struct xe_bo *bo),
> +	     TP_ARGS(bo)
> +);
> +
>  TRACE_EVENT(xe_bo_move,
>  	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
>  		     bool move_lacks_source),
> -- 
> 2.26.3
> 
