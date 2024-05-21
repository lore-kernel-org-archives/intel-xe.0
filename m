Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C71EC25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF59810EC49;
	Tue, 21 May 2024 14:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZoORMvC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8A10EC49
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716300648; x=1747836648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=naXFNLvF4vgXmOvpImKHZ7Z5QSGJIGoTtjRxW0oaEZE=;
 b=lZoORMvCkJRq/yZX6pAmYXEP/BIM8WodcDTG5vhoptHusQ7boi9MDqcd
 gVgOlV+ccpMkdYgT5qyVNoZG8xbn8PbC0duvkfbI1f0m6gijVjGdlCJ2I
 Ub8cj7hxO56C6ImhsXPzicogkseaKNp0dDMncTJ0sH/JaBicFmGVz3x9X
 1WqhbBuuBxtfO/BB3L/IbscHwEho4fxYGp/ycg3Mpi6pgplxW7wKSUTpg
 eT0tAn4dNAAlgzvQGlraHx82kF5L2v2RdbRKaPTTXBi8eW1es4oyHTND1
 f4RQxM0DCuZkVhIHas8GGIWrL0lEwPp9+71e9xnDizUYvOw1yXCWE3SDJ g==;
X-CSE-ConnectionGUID: B4OhMxUDRTq3EWok6oWzaw==
X-CSE-MsgGUID: BKRjZ2T7Quy0KFk4LlHAVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23072154"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23072154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP; 21 May 2024 07:10:48 -0700
X-CSE-ConnectionGUID: TJlOuw4FSSqW6Od1NM1aPw==
X-CSE-MsgGUID: ssFGqT6pSXKJ0nB08iWx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33539819"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 07:10:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:09:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 07:09:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 07:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSFWJwTxEeVp81fl64/tRCyiX5I+yn1pq/6V6TbYxBcuMk+MEyybOMMtD2aOpZQ/a5gMaMHmwbzoH3YWLyHVdo1Mbj6qGNx4LXlCXfpR/SR4ZynlvJU3OMCQef+is+BRAnRaab6LxNPKaOxBDR9TvNp6ue85CUPUrVxQwFObHlnQYYCnwGpyn0suN4FDVu8JV8EEtftydpl2QIdhavEMDzDfk8he8IwLiy5n44JUIkC7AQw9FLP4cHusSDqKczcDvCd7JuaC6INnovjuF5tYjX22ERXKlNPlI2NOJhQpo1gD0i1ivW4WI8V0wQk/fpGc2L+mNJKsiEkh1WFJebD8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sEFH+Zoj73zd9hHtc9A+dhH9qBSN4yK1HgIQanL6LA=;
 b=NoGn0QjrL72lLgW4aProXvT1xJmWwQdJgAxHwHc3h3xtnJLK/RgSzNy399R1nbaQPWuKiEHZ+Zh4x+fUTvh2rRUK80hJrNtVS+33zyQv/E/7IY0f86TyiTqzKuhUM0kn5wODy3G6On657/49jBe79B5D+SPbVP+1yWH6eMfAxZVljgM+xbcl6/EZo0JPPXhFi8S5DROcsLUVsxLpuTfMkjTE2rmie19OhhyuVDkw9EQOo8E2cxzQ9T1TmkGM0h0Q52Ssxf1j8fm6AkGsOOlIGUJz4KxTmvPdAT3cOwJFUsi1vG2/kjAFvfjpBc5ttf+ZAcjimk1nkC3CdqFnKIbD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Tue, 21 May 2024 14:08:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 14:08:58 +0000
Date: Tue, 21 May 2024 14:08:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Add warn when level can not be zero.
Message-ID: <Zkyq4Tzh73D9yeXD@DUT025-TGLU.fm.intel.com>
References: <20240521103623.11645-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521103623.11645-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c9c92f-b35d-4eaf-c555-08dc799f8f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IpjTERubgaVyiPLW8XJyQ4NvR/LZ70v9ClbhjzUi+mNKh0E2u1c6b8CzUrta?=
 =?us-ascii?Q?b9Mqf/HphX2YE0Ou/2KLSuvVt/0NHeB9Ip5DD+YoK1k5Dv3m8xKBHR4UT/dM?=
 =?us-ascii?Q?Oq2fWk406YCHdLV7x6hAO5YDO6wJ/+6JgexuguIOdNN/gALb/L2NUXEjbpgQ?=
 =?us-ascii?Q?iM7NBDOdcZDj8LebQ0Q9sOn6BYn2uMS1rWQD9cl+VHeKKvWyqLmzZRWcPxuT?=
 =?us-ascii?Q?kE7riMCc+6SouuqkYzI1KnnzdINCYZzmlrEOqSeCjqCNmk4uZRe5M3M8yjOA?=
 =?us-ascii?Q?0SQPbKyF5Hd8pvDTPAlec8NRCm1IYd51OGDRtokwomGS5NoViVpA9Dog+tUd?=
 =?us-ascii?Q?Rn7iot/gUxaVy1+asDKB5Ca00L2Ta3CaWuH/GAkwr+yC2OI192q+jqQyKbp3?=
 =?us-ascii?Q?xLNnlILTtqjYMkAxMgrNqYSnDNprpAz+7UU00+PONGNnbLO+m8LdidGvFE5l?=
 =?us-ascii?Q?Xt03sxxhIlKulrubDitAAN+25Fs1CSqVu6tnP7nvAUvA+cpGG5kX7Fk/C8Zk?=
 =?us-ascii?Q?+FKBYN1emeW19NEQi9nFrc35mGghqm9XE3HJR/8qPM/u3YMm6YwUVelEF22G?=
 =?us-ascii?Q?iImUP5aZ6NS6wXaON98idhm7/Ou/1kLkni4JR5htZtBGlo1r0fbRl43pEctX?=
 =?us-ascii?Q?2k2weF2IkGHrX+DUofYzTs4Q5mOZ/iULDZHKkYG6oS/IhoHBaCKGu/UrcPO0?=
 =?us-ascii?Q?3ao474JBC7tC2LEIozyHnAUn0QgVuSnyPFuWTIghuCQ2t1masIYEnV938Opk?=
 =?us-ascii?Q?nYdfQf8zmeOBx9SX2sJcTdV9TYL6eQOXjTqq2EN2zAhB9VIMF1/1ik3JIWap?=
 =?us-ascii?Q?02MiAGz7PbA6KX2M4QrhH5WnFZrK6NHWKZ+61ZuGDA+BQTkV+k+C8gNjxoMV?=
 =?us-ascii?Q?Ve51lx/XwUS6nqxwFLDWl1JfcoP3QMt3W6xzPZ8mG1d6Sauf3+AkZmzcRuc2?=
 =?us-ascii?Q?jMuI3xTolCQQSkbNNekhc3N8zHZxVMjPIDPdd0ioxHm+5W26lpT+JtPjYhOi?=
 =?us-ascii?Q?j+O+Pu7VoT0jeBdhKB2n8miF54+b4bz7iYnt08c15ZBtrTAfiYLBAmekCrs3?=
 =?us-ascii?Q?ij0ndozeLN6eMBKTMlcTYDrU1cJVxM7xoW1t3uGzXUvzXFw6KI9O6Wnv5m+3?=
 =?us-ascii?Q?AK0qdiUMOimV+h/gC1mcFi8Qn3sdy1hhIa76IKe6nx610I6KULuSPssrcwbw?=
 =?us-ascii?Q?yIhpkN5OS35gQ9d0klCqdoOU+zSqx/Ec5Jz/6lGtNSauA1m+KvzduD/m7Zj4?=
 =?us-ascii?Q?bRSNvv5+DGzr5IU9NbBZlvnoXb7dlSc1QsKnXl4t6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNi/SW0GQAmhS9koazFfMmcezsvQ4uiCnwsF+5ztGmea51uzgaBJ5VDEYL8d?=
 =?us-ascii?Q?r+c0fOsUPfvj4mv2gLLEv3wyvx83xErMo3oB1cKWeLqlSnbB+XI4UjYjcMzm?=
 =?us-ascii?Q?iylipHi/mBxsXKqVClVsSouXVqWssrqfcv7ZhP0W7mnoJ9oNgvMx+KVb7Zz1?=
 =?us-ascii?Q?hRIsgPa+IhLExSV00WsXTClnZKvjUB9vSkuS70yinoDQiZ9lpRg/t1NrDC67?=
 =?us-ascii?Q?zn2VX9+9yNAIt5RHQbXgZuyt1B/vhoWKT08bvIWS4SOVsI68EKFWCLwqB3sZ?=
 =?us-ascii?Q?sI7lWqjopD5ickg3xSqgV44XPCv9fIMndgiIEu9x8utMq4I0IMjw5VsLOTE1?=
 =?us-ascii?Q?NxEQYiHF6l3gWgUg32yTUZl2zX7cw1LR9389fqKTLZu00vC09ZnjDdqyv7Yi?=
 =?us-ascii?Q?/H4We+Uj3U/Lux5FQpEiD4WfZziyIvI0Nih7pVlZjyUT/V6JaARR0IWjL9Zt?=
 =?us-ascii?Q?wPyfeqHP6Po3Pcxz1zXJ6QWsygVsyssCf2+awhHUS8wvdi5cFhOZPcl/5mCK?=
 =?us-ascii?Q?hONgycZpHw1y3zX1aT7SKC5tPNFxVCoUw680KuM48wqPghuvu9oFfVleE4cQ?=
 =?us-ascii?Q?yBwHb9Gm+irkfIV04NL1iPtUX2j5t9B2UlS38GAV97ZKhqQWrOutxJq6WaXJ?=
 =?us-ascii?Q?zPB0JtrbhF9b5Inu+q26zatlO84BDjvgrHLPvJMBK/4plQhG+BfEZwzHbL5u?=
 =?us-ascii?Q?XgaVG8GDLF3LvypOYPiWdxtdIUdSoywD6XmaBy3FXoycTXily1ZXYjUiSyWr?=
 =?us-ascii?Q?xknBjFtbr9vd8LXroV3488SaSblTHz7NjJBuQMa9/04dX9FdvpMr8G8Jwcy8?=
 =?us-ascii?Q?10VMhvcYc8K80Jo256beN+vcV40xnIQNP3h3UG8YH1DmVnB8TJVss9PPUFX9?=
 =?us-ascii?Q?w/ypTkJbDlFUGApWoJ4WTZu0QvvStVI+I02UZpBpxOvFyyq6OnO39nmKGY7T?=
 =?us-ascii?Q?/x3NMx1281qs5d3Df6TClWfsG95Sw82sT1JPy8MnZIsrjM2taTN3i5nNmW1G?=
 =?us-ascii?Q?nd06IKLOGkfsey3YdWw0fTk3XdPsa7mpdhfQ9TK20SUQ1Uc8Y2W48XwifEKY?=
 =?us-ascii?Q?IOGRSFPFFQkioHRtozYHXPN/KYxe7oCBL19n9KftzdNZsGq9XNoNMYR3BCal?=
 =?us-ascii?Q?J0ahVQQpU9Zb2FPblCFvpeBX77dTSGbPkm5B4rmkhpUMMSHogGjhgJhv92b8?=
 =?us-ascii?Q?0833oM9QhzqoGJhg3FeevCeRJlfj+6C9DvJo3J4ror1+yrHayhSqxeN29U/P?=
 =?us-ascii?Q?nfBoM4CCsQ9Pb0c+1yjHeD5awS5hIP2Fx9ReARAfYrZr6oyv5jyu4Yuc3f8X?=
 =?us-ascii?Q?XbfLfJ0wp9JNn0mf59bPCfllI5/rFxC8M6sPfWIT0av+8GZu1DPtkvy7E5/7?=
 =?us-ascii?Q?T19fG4V1fI0v2KFSw2m337B7ea03ng4qUWtdDTnQzDguqzI4J6vOgJGnuBEy?=
 =?us-ascii?Q?cqxgWZnvorOCpJIxXTiqO+zoLfD/uXmUEFqvu1T9hXPE6LM6fmRSJVN75fU2?=
 =?us-ascii?Q?lD38zrAoZBf0aLITIUPRkm1LpyB/aIolU5MYsLMKRllnEAVHY1Vo0ppUwhxL?=
 =?us-ascii?Q?je0YslgHB4VE5tLGf/WxJMDtpO7TBP0vmFbkvYI2gBmgMYtRv95V4+3THYzv?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c9c92f-b35d-4eaf-c555-08dc799f8f21
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 14:08:58.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gsi24Sq9KaYJJEsVsDGNp30ulHB9qbTebPMiMUvWO6KoeqyNgZWOoVLutXP8aG4moYyqgQx/07pwBEqobeZ1sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

On Tue, May 21, 2024 at 12:36:23PM +0200, Nirmoy Das wrote:
> At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
> be 0. Therefore, add an independent check for the level. Since the level
> cannot be zero at this point, there is no need to check for `is_compact`,
> so remove that instead.
> 

This doesn't look right. Both xe_pt_zap_ptes_entry &
xe_pt_stage_unbind_entry can be at level 0 is 4K page entries are used,
right? CI looks good though so confused by that. I think maybe 2
independent VMAs would have to mapped within a 2M range for these paths
to decend to level 0. Maybe we don't have tests in place that do this.

Regardless please don't merge this until my concerns are addresesed.

Matt

> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 11dd0988ffda..cd60c009b679 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -763,7 +763,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  	pgoff_t end_offset;
>  
>  	XE_WARN_ON(!*child);
> -	XE_WARN_ON(!level && xe_child->is_compact);
> +	XE_WARN_ON(!level);
>  
>  	/*
>  	 * Note that we're called from an entry callback, and we're dealing
> @@ -1445,7 +1445,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
>  
>  	XE_WARN_ON(!*child);
> -	XE_WARN_ON(!level && xe_child->is_compact);
> +	XE_WARN_ON(!level);
>  
>  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
>  
> -- 
> 2.42.0
> 
