Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF12C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 17:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D511A6F6;
	Thu, 25 Apr 2024 17:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abnsNOCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B73711A6F6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714067196; x=1745603196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KbT8LbWu60Tey2mLQzHEfMAoai15J4W2AslrIjPEMVg=;
 b=abnsNOCDX6hhgUckM2b6cxiDz07kUiVnihAj4g4GC/NsKyPZUTcjEmmO
 3z96XB1o/hFm3WoU9wC0yzjDbytcS4YcG3+aoz3fGvY13eVEQ58/6NYg/
 JYPtjVjvpQ6RK0CqDau81JaP7UAKDwxP8GBgL6vIJn6eDse9LcHOOeAAp
 ZjJnZwu9bgrmsmVaQg7cbugdsRYfFy89RioJPS7J+215KO0aFQFpAjAov
 B1ai6nqPlc52JBUnLA483+giuFsPPpVK/ViYRAD6qD+3OzfiBlCVrX5Xr
 wKxLD8j5fBxkqIWkJPXau6WofTXziDqS4dHIR2J8j/jhlu7+khAUTKF65 Q==;
X-CSE-ConnectionGUID: 3jaDYn5xRny1zbtqFMZabQ==
X-CSE-MsgGUID: clVXs4VKQ1CiQinTyHV7wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9635996"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9635996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:46:35 -0700
X-CSE-ConnectionGUID: eteE2W5MShiInOYsaN5o2w==
X-CSE-MsgGUID: N2irgL4GSHij00OQWdEYMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29956413"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 10:46:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 10:46:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 10:46:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 10:46:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 10:46:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWmWTyEWqN9eEbciXmJp5NS3h8t/OxG+wgOOVaalEbpCtJhKhRA5whJkgwwT3DkitcJtIyJOn3dchB86DkR1nChz+UwMtlui9n9tJfY9KWvxPXQCTkoXgwYet3mEtuwiDxUSoV8a6bCd3IgbC7GmTCqRFHJcsLg9tp6MOhcOSX3Cf7T/LJd6ROtE3KmWfJ8JCtk/YEWjp1hsShIXre8u7Bi2npRqjwoNBi2syl4qrvkfBXcgybjCjuOpWGbXwWI2l3h3WJzkRTNkGfHQQWZYG6IT2QzYmGz6RpJAgIbVNGZsZ6hek+58wLrx9/5PAQDixgzM3dksH7ajkTF97WbX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO6G8iV4EZWrx9cnPn1x7aRAjD6+3KT35WHt1NqBnm8=;
 b=H+LeRC7ca1szTJlzGpA7K90/311Y+jnNVx7zq/2LYyCBKsB58UhmfmUWC6hwdrv7zTvErniQOhbSamK7axLjoO04HyHsHd0Bg4NrjUAS7kQYKD9KwoXiIRmT9LvRE5jErAWHT7IIIOttYj1CFasNVGYXhw/dT6eYePXNPETGMqD/F4H0eZQhKYL+9zznMccXRzUFS7IvgTR9WxNCIgnqY3KBb0UP5N6+nDGyyt6zI3/hvlIg/lo/v2qZjDk3/IsRTqalPtHPGt5r1WutlenIuyfueq04RveZqExvLxjA4koe8Ilj0EJA4ONx9hLHpkt/yIfoqOh1AvzFtOuFNxHO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 17:46:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 17:46:30 +0000
Date: Thu, 25 Apr 2024 17:46:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
Message-ID: <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425121856.4500-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 446ba96a-d43a-45c9-b976-08dc654fa3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUrkNRWU8r1cDAHNeq1KXimO4J5HKtMVtSUpUdTahcd0Fk6t0OnU2/AIHaqy?=
 =?us-ascii?Q?uWJgtgrcyeNbzwM7P+/rJpilQlpwYzFUwIVc/N3IY+HeMX0MDaukZuaLPZfQ?=
 =?us-ascii?Q?cZemBT5oXCJoNSJ8GdA9F2ik4zqjI/pT3wVCQsMgbg3SBE0fCp1D/Ny5oqr9?=
 =?us-ascii?Q?E6ERikADXSHzjPQnPjgwjvp1mDXM7bsMtDJZ4ObHF+Hi3RiqWJ5jHc0oBp40?=
 =?us-ascii?Q?1qg0RTX6Ss1PpbJVdGEBqrtULDIKUkoh2hkTWV70GPZ818k/2rx7vfzHQ7d1?=
 =?us-ascii?Q?wE1z3Jrm0YaOtrMvm5x5CIWMGchD3Mg37Cz9prgosqMJQtLpnpF/CdVUV1Br?=
 =?us-ascii?Q?Z7mTJ8uAfB6y7vD9g2+ptNDN1zM+6ACYlgCgiay8Fp4EDRwG2iDyIg77GvGR?=
 =?us-ascii?Q?G79+lo6r90oJ/iArNuq9XGyQyueCHsZpU2wli46hTaxJXsis/r7eBM4WqSt0?=
 =?us-ascii?Q?s2xI1PPTnfSq1CC6FbNfEXtbsb0Z53Fijs7SMvEYJyBMkKVwK30w+faq67ni?=
 =?us-ascii?Q?Cd4OLiJVl8LbxJPISuUwOJRKOSCuSnsk1oMOrXXbffbZZYmhRfVmBSp0Rejq?=
 =?us-ascii?Q?AMd/1Dz05Aw3+Kas/2jrhjx38RwHeAvQ4lmQ3npc5yUH6FaEBeY7mJzm2SaI?=
 =?us-ascii?Q?4k8cjgxHt6NlcWglYoV80B7lL463WrRWSY9A+52QvLOXasB78zheAsgMsVd7?=
 =?us-ascii?Q?uf2PgizKXnUPxdiw9vAcQSlO2kMruqBsZDEBB0l+EivZo4r7brZOvjTJxrL2?=
 =?us-ascii?Q?HfYiaFC6LJyj//ozRKSkaJhbw5eBhcyDCaCpXJC4sBD5QlKEbTpGXVdHuZSJ?=
 =?us-ascii?Q?jP8vzaXgdLxsvBNdRAQ85AO/OwjQME+7cf6wCT4MAvuD24EEoG6+u5xuFb9o?=
 =?us-ascii?Q?6msKeuM3SaOcnAdB1E+Sm6KENRmWnMegKjm0jvb+zLxaNtTf54/FP2eLHfX3?=
 =?us-ascii?Q?p6k059lVzPrw2DQ7bB6nvHR1P7DDWt4Ve+JDDq2+YwjNnJCRUBXTAe4xCl5H?=
 =?us-ascii?Q?nMd9y+YqECPG854u8+SJLFLaus1oTfo8EWQPYhMNa6Dk7Xx2b6Ol2NvvqKBQ?=
 =?us-ascii?Q?9Tlj5AEUK9YINnD4wbJlURA6p+yrLe4zPBJUBgLPY3JLJjXrzuc4bu62MKHp?=
 =?us-ascii?Q?pXZnlbi9U9zwQ3oKWsTKbygeFB8XF4yQYA96mtMbdR1veTcwh1iMT5PNVHcc?=
 =?us-ascii?Q?S7hrZp//6gtAl7NSHeWAG49AkG/APCbeYl4L4ldeCxzC7NTcFYDok/Cug9MF?=
 =?us-ascii?Q?DAil8U8uzJeTf4yPDw1dzZ/ZyiXtrcTVLjw9IJdWZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?prbNzXli18KX6KXtwuW4QMokY9lEpqC34QX3idkSvLKldedcVoCqVe9TqKIV?=
 =?us-ascii?Q?ubw3jvC7KrueP9ATktiLFprufTvyqd2Goav/iESvS9j9ksbI0N6TC3Pab1Wh?=
 =?us-ascii?Q?AnlCFn5tVOCHPfbujI1qzdv9DjVTA9TvPUlGqeTRrjfxKy9Aop8skYhKlXpJ?=
 =?us-ascii?Q?HZo+1iWxwHd0FSXzal5Q6TULhdVxZ5cqkw/ovsfOy4lrBKp9Gco9v1RFPBUb?=
 =?us-ascii?Q?tAOrXOUF7PY9LTwz7w2VGwcPmSD8c1S5kMVfst/ZfofnOw8TvuP2FWJxAadZ?=
 =?us-ascii?Q?cQsRS6SfncnEoT6run/JNojana2Yiv/mCskXdr8LKRd8EQkN3rJooAUjG3uc?=
 =?us-ascii?Q?VMkyH/DJ6v9F4tKAOyN9joMetvWfQIWpuZ/ekLemQGLMQ4ue9yzBfJ/A9xSH?=
 =?us-ascii?Q?PWK1KvINS8Eqp0V6hAuQlxQ/KlIVTJoTQXDH/FgwBamuhWReLD3fRVoKZz15?=
 =?us-ascii?Q?DTl5vUq/51cekMWXF76ox5VguQ095NR9ZIodq6ZCqPmjtR60MtEUVr6rfnSP?=
 =?us-ascii?Q?kBGpjM8ntLhiaokRiMc899C1T047Z8GzMP0ja1+pwcp8kamzC2lmEDU+GL1e?=
 =?us-ascii?Q?eyRzJzAbyDOTv9JSHAAIECZqo9x0HFzH3r+gYnaHt5qqsS3kZ3OM2YS5DQIz?=
 =?us-ascii?Q?zlaQoDym5AI/NYegmkpN4bYKPFaMAGTqmwXQUATlaBzwekurxEWcbYW8mCD3?=
 =?us-ascii?Q?o1VWV0+f/jCZ8N7uDuo9OUeKLlMn9aZGN99i1IvISO/6bxoXqrWQ2AAC6Vp7?=
 =?us-ascii?Q?e+v4kt7C8kvBqn0My27ux6ims5QSJtUEggne1fzIvXd9MwXThkj1YBPcnzQp?=
 =?us-ascii?Q?XQ5SbGG2X0IzZnhF0kBBgBcVlDAVnklU6WdL40gVNN/8y9EeO/tdowxJXh5F?=
 =?us-ascii?Q?wDguObjbT/ilP4IlQCXUZbU2m3lHk1a7f0AEbLHfvzxmqZ8oe+/Sg+Zsbpyv?=
 =?us-ascii?Q?RfQSyCB8jTUvwc2aHR52vujyso2jGFnKHi2fuUeEw+/hIsYXwxd5QHhibpT5?=
 =?us-ascii?Q?29ulclaKNH675Li5hltPQLwPSacsexqMIO4ooo3g6znC/tvuXItw2oXxrGBf?=
 =?us-ascii?Q?jzU7cXXpLUiJQrRSsmahg4F3JYu4c4d2uYS16eIPUYwacKdn4QkC3pPlb+U4?=
 =?us-ascii?Q?6v2iKOEwIIEQOPFqZkdYprEQO7dJgS8ZxMmxVk5YN0H3YH1D6NgNxpcWr0kG?=
 =?us-ascii?Q?Bpc0HGfib2XL6YhK5lT7XLGWfcjpHXvGiwyBgVhbJ58Q9cafmJm/Ih+LhEND?=
 =?us-ascii?Q?OJmH4EkImf6vkf6JyRh7fVj0ND8rWT0SNvYwPby4QeWjtwX5HAB+BoAwyjGc?=
 =?us-ascii?Q?TB/35gS/Kir8Gui1WLkpbPi7MDKKv0/3E1C7TD4KRCVAuI50slyxS5SJIjFc?=
 =?us-ascii?Q?XPppTaKsYO+BCT0dAH3AoXyOxCFXzJjJjrUnWf8kLD78pKzxWIoh7DO7Bxg6?=
 =?us-ascii?Q?0ZP2Barn3cbKLZWhoPle7G6/4+MRc3Lkw3p9/xqoAtPe5EEP7xfHYEwDMrIS?=
 =?us-ascii?Q?jaDZ/RDMQ9hO3wKXVEoyVRG71Z0DSr6HaZZ6m2bpxX3kXftq/aKW+SBWJ+Ag?=
 =?us-ascii?Q?gQM9nXJD5WoK0Wz0FL58fqHgc7K21eIeVHA18dVPU09D1liv+h4bO5fdKy/1?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446ba96a-d43a-45c9-b976-08dc654fa3a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 17:46:30.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKyT65F9Xewi9e1cx+i1YD6DgBn7fUJPTtQC+t3ne4VP36Zf1wxfIl7WeFESEmJSX84MGaKI6+NmwscaieDRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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

On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
> Add engine name to the engine reset and cat error log
> which should be useful while debugging.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c7d38469fb46..245e29d095c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);

I don't think q->hwe->name name is useful as it might not actually be
exec queue is running. I'd drop that, and replace with string indicating
the hardware engine class. 

>  
>  	/* FIXME: Do error capture, most likely async */
>  
> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
> +		q->hwe->name, guc_id);

Same here.

Matt

>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -- 
> 2.42.0
> 
