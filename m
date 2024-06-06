Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C9C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6C910E293;
	Thu,  6 Jun 2024 16:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4XI9Nfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44E10E293
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717691474; x=1749227474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DFS3q9CA5WMggcObt9Ryhj59rwyU6MCzbZxiobO/0KY=;
 b=H4XI9NflXTV73vqbE4jST+gv6f8RVgtNCeLOoeFl6KwmuiID1FdWut59
 NWLr9a2Cpx4YxhYVp2/YbIrgrr5VnGzNaiCDm+S0ov7jQgxFhaw5ZxsRv
 lozKGt2nUHbPn80rvt2A8irvVACxDtb2ImkoahQMnL/DxwC2L0iQGzaIF
 nA2EXX7NWrN1/2HNP399zWQLLuY11rcNa2ZwYayo9edpaqA2FupYWwz2A
 IfnggvS7JmMOGFMqpBCJu0wrKviIQBnSa+rnF4TO+Kq2I98omzf8fqvi4
 bcHRsAOi9paHlrAE9DKCy4yigbaIlB5huoCbPFVLo/YT63tmKZtbXKK/Z A==;
X-CSE-ConnectionGUID: uXf45fo1SDSQAIoj9eDw8g==
X-CSE-MsgGUID: oCMQXg4eRtytfDHr1g1tlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14213343"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14213343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:31:14 -0700
X-CSE-ConnectionGUID: TYjll2AxS72m194cGMedEg==
X-CSE-MsgGUID: HkGQ4QeuR9KAYI4OFvhxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="68817568"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:31:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:31:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:31:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsVkMB9XMMhvM8UOtQyGrHLIxdZFeONU9vI/lIuusCj4WyVTU/1liU1YzI7p35H1ya6Y5EZDZJPRNTmRenBh8A3VrvY+YXzNAKAmcbU8lPlAjyw/YHg8NscQVQzkUr4CFn9EaNPo0CnislULJfHK+IBDlwEvRFacx1V++7wlqUHdC9P7OK/62NAV9ncCEtfc56/Z836tGBmNHS2ecx9dmNDuS5uIuRuM+Kkor7UPiY8AetRxZ8VO6mRAMaQrhRsP9Me8VaaN7nHKfpB+4yZ3T+YvUeWiSzPnOT923Iuv46se4O5ogVnVW0NcSNhajH36TUk0LaLl8TSjKcmkKB0oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ABFRo2lgDZahLiQz6H4hK9k5qb58+wFMqYa+F5l2CQ=;
 b=SVJZC3EaC4qq7HYH2LM8LhvQZ2J51dGQKiiOWh/0qj9ck5Sca0+c9ASiWYT3Ewf+nSh+mqvKWFbkXNJyHelORIrrKUcBuBSOvDNJXQR6+hv4zOtvSUIwNTL4YyIkjhQv+tK+v8T3x6KZA5i9Cu5fOMf3GCYLNwgmW5ddLNCAd7PPHR9kan5NiLQ1y14b9H/kqOS8zgul+LNLnmQkusVen4UBwsJqZWLGT878Wk8gwDM4/bOLWKJT1tcKFAwoa09+2e/RyP6hoP5Ge1QOm83dCCf4Nu5TdEzJuuGbneEZRt3Hlwts4k0YmhmVRV3Hi/QDVruEn0qJpJ4xKjR7+AXo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Thu, 6 Jun 2024 16:31:11 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 16:31:11 +0000
Date: Thu, 6 Jun 2024 16:30:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [RFC] drm/xe: Ensure write lock is held when calling
 xe_vma_rebind()
Message-ID: <ZmHkGWrFnLMD+sZW@DUT025-TGLU.fm.intel.com>
References: <20240605101607.29931-1-nirmoy.das@intel.com>
 <ZmCV9Kc4LBXtT0ev@DUT025-TGLU.fm.intel.com>
 <566daea7-d438-4c63-a491-851d4dc804f7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <566daea7-d438-4c63-a491-851d4dc804f7@intel.com>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: b6127106-28f6-4ed4-26ab-08dc8646134b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uEkUPmwMlObBQPU9ptudT6Pey+hdPWP+Xh3iSmOHpO0FWODWr7nSzfXxV8VL?=
 =?us-ascii?Q?/SLgXvMgyGeybvNt7brWCYScnvO/MOihSfyb3Bsft2bo44805Lq3IF66um6t?=
 =?us-ascii?Q?I8aJdmqN/24MV3cOIRjI/NtMQkf6Bo4PcgYIpoFc63Pr5CLXwCFGxB+AnBIh?=
 =?us-ascii?Q?Osjl5wuYhh1FsNrUykRy7COUaYxwoBUZubWrmyMufu4QsPF5QKFcZJyRgWHy?=
 =?us-ascii?Q?XVj8b/FyfEWRnJ4cXprzggxSsF5bDleeAEN1M8z6QYFOOeyxUwrxiQ4hyWht?=
 =?us-ascii?Q?QB0bCk5Qc5LT9hfrqOgrjt52gvtCTzTfL8g8ozdh1HFFUav/RoxM7C14tcqS?=
 =?us-ascii?Q?wguSEBIFVojl3VyJvWl6eFresSYyPmKI7c4pRFQtuJsu27pfeJeKHXl7vMC1?=
 =?us-ascii?Q?awF3NcmILArP/gKwyc+haEw20/M0yYz5q6qFKZq8L10vcBozdLBuFW/eh0Om?=
 =?us-ascii?Q?STSc8hWrJfR+SpdOf2+A9VJgRGfQ7MrZoQQd+NuGl/DQiR5fdP0zCOTbWeju?=
 =?us-ascii?Q?PBn2XVYZJUjSjx7Oad4Vtv2y9uLxgcS13V635J7tz8Jiy6rNbocoMbGJx6at?=
 =?us-ascii?Q?Rxvu1/oGhUAn2syOaXlB3adi1AF7ojQoiI7s/+Oh3WVvOm5jqAQF++gYw92A?=
 =?us-ascii?Q?UKTIPLFeSNNXX7NJmE3KLc1S8508z1vZkfPtm+OFnIp+CswVfPC37qFpOF4a?=
 =?us-ascii?Q?veZdkNY4PilW40G1xvIe/sv09r3dsZThm2fco2+1BMTvbd/zSdv1IjDSaZGb?=
 =?us-ascii?Q?1VtHIsRh9apSiH5h2sQd2SJmxxfmAiI8nBm2WubLJ6E98BY9NgvZqjLyzmo8?=
 =?us-ascii?Q?Mhs+y5d5gA+1zoR47BwtG2SClUGggspO/xThWsENb3khOuk/ljK/tbM3ZRp4?=
 =?us-ascii?Q?5wh6oJ3Qq77UE7mg9+oSMuZ5xzFhBnFnvcyMXqwa/xMtou3jaLEuOx6NpBJe?=
 =?us-ascii?Q?uHUkx/co2BR/DzY09QP+2kg+doNiOVoAk9XJ+rPwOo0o1Vk29o4CylV1FcKW?=
 =?us-ascii?Q?AGTTtfXZJMhwhwB+sJLEzYmbV/Ug1sX9NBP4m1QPL5CnxxkfihNslMxVj4cH?=
 =?us-ascii?Q?KXXZxIerAPI80Atrkpe90l90JGmNX7NDGzh769c1qwbc/gwneDrXofn9iW4N?=
 =?us-ascii?Q?8F1o3HZ6NOPTLzE2fqmc9d0FnrzizZETIIZ+AKkHmoHhw6TgnpHumTSq9Rb6?=
 =?us-ascii?Q?q1oiK/8X7AVUaAYUU6FB/cquPmqtVm64CnaRAQ7SB4EN1EVTZlXZMKvkUn12?=
 =?us-ascii?Q?V+lIDgsqf7OaT+fgn5ovKZYt8fg0JR1693H9wYYohQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8Pr6jx8vQivNALOdDmIIrcfRnZN68ZnuQP2CDPD7gMZYXoBa638j3pBRE5f?=
 =?us-ascii?Q?rci5fb4FmJI/4U/MefhX0qlyh/op6ECuX3EXfsWQm4rcd3FccNrxTIrsA/Y0?=
 =?us-ascii?Q?o+vaRFMPUHgDi+72R7WYx8PM+5tp+Loe25ukwY+ygPvXPpsQQEuunoqN7JrC?=
 =?us-ascii?Q?PDw6K+Sg2eZ6u5Al8MXvL/fmQakdkk71YM8DyBHq5FwwpbPZyNRHw+1aAhHL?=
 =?us-ascii?Q?HbaIRB8pn3mlwb2PQVN9UKkL/Tm9bZJ+6F/pbc2y1xYxFXDTleRj6UdX5lxY?=
 =?us-ascii?Q?g8xkCY0z6logFoSmNNMBXHwCYlo3VGifaEl+Xcf8Lv/OF2jQ2hStzHklGPP1?=
 =?us-ascii?Q?g88vjQyDY3hwXpd4vnz+q6MzKOVo051+IonJWwwco7uCHtB6uV1ol9tcUqMW?=
 =?us-ascii?Q?6JjtHHJYu1apW8RHm7neEI9ArjeaF0Voh0L4FkWUzyYny6QM8TdZB8jRlgVi?=
 =?us-ascii?Q?bjGFjSQW1xgAyAgz6rpTAR3toK3TMzMQdseL/NWUozgcPH0DNPkMfrlnfj9b?=
 =?us-ascii?Q?+H5pTQiOUAcE8SiELgYp7NxGnMQSDKTRCQEyB5TLBXaxcKRQkk4ffN1H21Eo?=
 =?us-ascii?Q?AfXIJIVAWLA7I5ZQKEFNusEnraTp4cILuQ4SjmFY8zGPncxjxrQYCsfOY00N?=
 =?us-ascii?Q?dmrZy+4Pj/AQlzAg5nEqUUQB1P2vXskg24sw0RRIGKMqqec/nbulOkTGbmcA?=
 =?us-ascii?Q?vi9gIVz1SwL1gFI1e5sfex8mpkWWbzzm75An/YOM7nPYu8gtwAdWrH4BM9jo?=
 =?us-ascii?Q?D/6WOwDH+ktcqjk4K5OMncyOi9zH2aTJblCOlVxy2YfF07S83RutZCRUB0gT?=
 =?us-ascii?Q?aQRoPj7KeROKEOoEp8USJS80PEsJem6mZw+WBIDLghX9khhylGgAJlOyyFUH?=
 =?us-ascii?Q?FJWuth/hb3QRaNEYk2MmlBlTXLYxDGI+kdnOCs2XyVp10YDgfYeT3i6mh99q?=
 =?us-ascii?Q?6z3ViRVi9H4/g2h61SAJ7EAmPcVib2T0h2pbOhfyAa3EYET/QuMsVi8nk/en?=
 =?us-ascii?Q?MLeIRm99mIVpbzunPIHXaw2nFfuoR80+5NPzzjlxJDl123fCSxAw1P3NP3Y3?=
 =?us-ascii?Q?WuX/lKWCmtP7ApYVHVN34OCk2bGMJHSOG9OQX++RYxv/3ElwKHLL3YAPRXfJ?=
 =?us-ascii?Q?OhviL6iXpBEVXbHd8E+5Xr+qO3crIepjOkP3hReYNP1HkmQJJajwYaYkqqqc?=
 =?us-ascii?Q?s2/f3Z3tzLxpYdmQ4f/WxJblTmzWa6v0Y4lUXKOTWoS/zq1FKUNhnLeM3ksP?=
 =?us-ascii?Q?OAdjGB4nYRVxXTST0mYD6LAMh+iZF4KhNTduldxRoaDxTKL/fXlqqRdlNsOk?=
 =?us-ascii?Q?M2W4gvOVv2hBDz6N8VF9Nij7HqCWs67joESbElUtjBdxhi03ADvIyBUd9uEB?=
 =?us-ascii?Q?uuaSu0tV4qvll8jIaY4FylG0POcRAgUeZwyMjZYUuBqQOeqbgb6VLhWASriQ?=
 =?us-ascii?Q?04S4XolD8CdkFOoTrFzc+Pq9s45cOXcnOO3Zp8m1Ubq96h8l1JecPWe+7Cf0?=
 =?us-ascii?Q?5elk8QK4nADKXRAbcE/xRiYHHubVVP01OrFUje79cGcGY63VjvL08n+wfzDf?=
 =?us-ascii?Q?GaDWaKmQlSmirHicZur/l94qF2ZYTjWoILUgI958rWAW5MgYQZpBeVl2G6XB?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6127106-28f6-4ed4-26ab-08dc8646134b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:31:11.0491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfGD/4H1YIpgQaV4NUhGGKAR4NIBlo5GnxfO6G6KQD4ifS7l2H5fTxWeyZg6gumksgU9qit785mvaUn1j09VPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Thu, Jun 06, 2024 at 12:09:39PM +0200, Nirmoy Das wrote:
> Hi Matt,
> 
> On 6/5/2024 6:44 PM, Matthew Brost wrote:
> > On Wed, Jun 05, 2024 at 12:16:07PM +0200, Nirmoy Das wrote:
> > > xe_vma_rebind() expects write vm lock is held so start out with a
> > > read lock and upgrade if a vma rebind is required.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1894
> > > Fixes: bf69918b7199 ("drm/xe: Use xe_vma_ops to implement page fault rebinds")
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 25 +++++++++----------------
> > >   1 file changed, 9 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 040dd142c49c..543cfa9892f6 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -153,24 +153,15 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   		return -EINVAL;
> > >   retry_userptr:
> > > -	/*
> > > -	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
> > > -	 * start out read-locked?
> > > -	 */
> > > -	down_write(&vm->lock);
> > > -	write_locked = true;
> > > +	/* start out with read-locked and upgrade of vma is needed a rebind */
> > > +	down_read(&vm->lock);
> > > +	write_locked = false;
> > >   	vma = lookup_vma(vm, pf->page_addr);
> > >   	if (!vma) {
> > >   		ret = -EINVAL;
> > >   		goto unlock_vm;
> > >   	}
> > > -	if (!xe_vma_is_userptr(vma) ||
> > > -	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> > > -		downgrade_write(&vm->lock);
> > > -		write_locked = false;
> > > -	}
> > > -
> > >   	trace_xe_vma_pagefault(vma);
> > >   	atomic = access_is_atomic(pf->access_type);
> > > @@ -179,9 +170,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   	if (vma_is_valid(tile, vma) && !atomic)
> > >   		goto unlock_vm;
> > > +	/* xe_vma_rebind() expects a write lock so upgrade the vm lock */
> > > +	up_read(&vm->lock);
> > > +	down_write(&vm->lock);
> > You can't do this, or even if it works it is bad, bad practice to drop
> > the lock as someone else could come in and acquire the lock in write
> > mode. In this case, a user unbind of the VMA could happen and the VMA
> > could be destoryed.
> 
> I didn't verify but assumed vma is ref_counted but anyways I knew this
> wasn't correct
> 

VMAs are not ref counted which indeed is very tricky and exposes us to a
bunch of possible bugs. The current scheme is if the VMA is in GPUVM tree,
it is safe to use the VMA while under the vm->lock. Once the VMA is
removed from GPUVM tree, it can only be referenced in the pending
destroy code.

I did post a patch to refcount VMAs a while back that got lost in the
stack [1].

Matt

[1] https://patchwork.freedesktop.org/series/132573/

> so tagged it RFC :)
> 
> >   Now the VMA refs below are accessing corrupt memory.
> > 
> > I have on going refactor [1] here which just takes the vm->lock in write
> > mode for page faults. I suggest we just review / use that now.
> I will do that.
> > 
> > Long term I think we need to audit the read / write usage of vm->lock as
> > I'm almost certain we have broken the intended usage of this lock. Or
> > honestly maybe just change this lock to a mutex as I'm unsure if the
> > read vs. write buys us anything and complicates the driver.
> 
> Yes, that might be simpler.
> 
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/133628/
> > 
> > > +	write_locked = true;
> > >   	/* TODO: Validate fault */
> > > -	if (xe_vma_is_userptr(vma) && write_locked) {
> > > +	if (xe_vma_is_userptr(vma) &&
> > > +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> > >   		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > >   		spin_lock(&vm->userptr.invalidated_lock);
> > > @@ -191,9 +187,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >   		ret = xe_vma_userptr_pin_pages(uvma);
> > >   		if (ret)
> > >   			goto unlock_vm;
> > > -
> > > -		downgrade_write(&vm->lock);
> > > -		write_locked = false;
> > >   	}
> > >   	/* Lock VM and BOs dma-resv */
> > > -- 
> > > 2.42.0
> > > 
