Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E63E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 14:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067B10EE03;
	Thu, 12 Dec 2024 14:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mShcLkYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF010EE03
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734014053; x=1765550053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fb1dGbRpTKTb7/U2n9b2ks0NA3xM7YvbvTe7/EccJUc=;
 b=mShcLkYUqLtxy/PPdSInzX2IePE3poqd2VICqO9EKI6kz4x3RXZLCtIz
 EmJCMWEEjzdwmXI94i+QJaQS2wLd0SPXJCShxlj9XyXMXGpGcZ/H9XxC/
 71og4yCtx56J48QYmYjLTQmdRTzExDkQ2AtZ5K3Ppbfzx4dhrxrten9mO
 Bv9Wr4Z4tSXUWpVCjQfYb1dg6BWXYONydLR5DwhORrJaTw+ml28nxSshK
 7J9vbHRwRN1oys29ll8kuLF1q9B31SRYwhB5d5oGz3e3NehisVwAsQHeg
 nfQjyFHJVl1NaFZ33wtfQEMqn3fkz1/fUIVNSncvVunsAl13qzrnHRyOc Q==;
X-CSE-ConnectionGUID: +GgEIw9kSVeo4mNMfsZCkg==
X-CSE-MsgGUID: C9ZtUBdzSXWZTRAssyJ42Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45113751"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="45113751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:34:09 -0800
X-CSE-ConnectionGUID: q+ZlklaMTwSms/xIamVI+w==
X-CSE-MsgGUID: Q5Mv7GPMRhSFKiVOwa4uxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96786975"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 06:34:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 06:34:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 06:34:07 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 06:34:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGsgQ8W7VBwpEJD3qvuMPv4HamnGOFSHTLFLpfzZ8wIHLMU5QuQe0qQ7n9p0vw+eByeKjAPmayyP46THP+k1m7HesAWg1W6YSJ03/2tvMaIyFaPNVyzdusVmhmvDesVKyD8Smn44Kt/uSFEE1+nhCE4Ho3vEkndVKGNvxX3ex0/OwfZobHzIXTyOSYGFuRuk5lUmOQW9Q1FjdXEhfz/rifftxR4o+Loz2pO6Dwl8SM9jE7kL6i7NvBe1EEC/aOzkDISV8Un6VIII1zU0MYNjAi4Qz54HJ/po9C4qyqChJPWOAF9LDOxsHsLuMzr0RgqSTy+S0/Cgr9K8NGnQUYziNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+f1O2YUL194cZ4UVsjXiddfGnKos0OhmQ9iVEESu78=;
 b=g2OYeopGQuPgMjV0vM5ZfbPK7057wYMmGgGTYV16o39CQAMYDzp6kEVxgsTQhDZrSTPX2f3nCNfa7HZJ8zIG3CVHhpEM2R+qpebb9EaagPkG/GQoJGNz9Yf9+K/k0yBWXBUS5zvUC0ENlQoT/fXlGIXXXmtHnZ5el9pESdJ+Vw9neYUa0jJJwDeGFKVnJoGk4Ef3nuD/rSdFFsG6b5mhRtUoRiBl4wkO0XE0jWeCoJ3lTLzaugXbgS6To/aXT6Jj1OIdPf747rLhPCHf6pewwy2JJB6Gxi6PZ9q8RB47/rKpfi4tPQYhGzPTUg9i63pClMjkgRuh1BUQGC1IvUfr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 14:34:05 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 14:34:04 +0000
Date: Thu, 12 Dec 2024 09:34:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/11] drm/xe/sriov: Move VF bootstrap and query_config
 to vf_guc_init
Message-ID: <Z1r0WUuHM_rSnvUP@intel.com>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-8-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-8-dev@lankhorst.se>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 60df82d6-4cc6-4dc3-2a3d-08dd1aba0764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bTN5VzZKDceFtsTSyyjnBaoKID6cL30EfiFIBSCbSwwFlRn1/5emtJDNtaiA?=
 =?us-ascii?Q?VWOnj8T0FVwPuuZ9Ea2Olo7ZxZj0fhsF2Q8DCmnaQpgP7vb3556dVUvsinSh?=
 =?us-ascii?Q?U38wjBHleOVuEdIbTEnZxN/xLsQJQuBGt+7+k+ZAGcsRQpz/Vi59paCtxHpe?=
 =?us-ascii?Q?gSMUU+Zg5G2GP5f5vxDEh7MHt3MhWOZzLRv29ABeP8wBtPkR57ks8rJPUCAN?=
 =?us-ascii?Q?1Nn1sfJ/QkoF42SdVnLmZzSE6Vf6TenEbXOjYDvvVzXhMdI3DFHlrKDtPPcW?=
 =?us-ascii?Q?R8v6CsbEB+PxiuoZeljD7BXj0jOj9XrCyM20si8PJGbVUOCZRnl/nGaMYaUn?=
 =?us-ascii?Q?2xfPzM6+/wKJDQNEcsUgT+Ui1+leesHkwz7xrSYuw6T/aQ9ut6uqJ8aerl+g?=
 =?us-ascii?Q?KIgdFT8OdXMkvIO+YIuJU537G2lqxc+bNx2c/20e5eugTu8q6h1o2xBeiPEj?=
 =?us-ascii?Q?k90aaST45BkMGoLF0uDM5CZi3Hto4Ej/L6FtjgkJA9gYbYe+XjgmPBOtoulJ?=
 =?us-ascii?Q?yFvr9KFNIyJcsb045GMsIcsTzqeR3CZ0RvviKoR/67XO4QLKryVfiCbM0Ucg?=
 =?us-ascii?Q?0H3GfwmXy4pmnSly4t9ZQiZalMKz9/7LYclGIjjsj9CY6o3Ri2uqqyFpv6Xt?=
 =?us-ascii?Q?5txm9om88wg30DT/sTh3Cry8CRx9cPErr4YbQ6MQ+vqPjOpykpJrqk0LQDHf?=
 =?us-ascii?Q?kirCV1cDjdR5jcOgrP2EUhyoKd6jOBNHtLrrWw/LPXfgtFFrn+ZWTngCrmej?=
 =?us-ascii?Q?LbGVFFnxhK4yBLWMfdj50y/U2t/6QAh78AZ2IKWUZXDz4Sl2HY2qf9B1dJMd?=
 =?us-ascii?Q?oTOMO9dKuIXieFd7wwenMVSZdinvd9UYrGLebfXtfLRDh6bQZPNjrVrBSUu1?=
 =?us-ascii?Q?eVYq7BByvkpfh5jpXgg6QZRAgFUF+X1AM7SzGrxqenLAYDu6uKUk6seYIzms?=
 =?us-ascii?Q?TtlQfpsoh2YOolW5b3PvtKTTuvGkcl4eeqhvhn4Gr9vK/sXtB2rhjrCLybuh?=
 =?us-ascii?Q?o36Mcj8k44SyQELE4IuYbM2S8TvODw00iQsrR0tTAkxhJc2goZsB2CzkuDc6?=
 =?us-ascii?Q?86E9AuujHkcRIjx7JcE+dqCpk9avUtkiEgqdzu9NB0AjCB17XULGAlvUihBn?=
 =?us-ascii?Q?IJPumRXw0tryQyEadE3Mlzj0tRkeI59598ecjiEHMMsXV6SbdoC9tpFQW/MO?=
 =?us-ascii?Q?ncxEBObxKnicUGZKjQ7UfUZgwO1dm3rAFQpI/Z6qxc9Ipyyr8HKIxNms1jJk?=
 =?us-ascii?Q?wYvp6WwmHLsk4Aa/c6gK8PNHqkVOJSqe33RkeVe2Ke8pa79wVXnhB+f7kzxW?=
 =?us-ascii?Q?CYH60K17SVqPXK0fPnrschU+mp5FBJMEB1/IbV3aBKXFMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?txePfqCfribj/rMtMUtldUl2MNPVuDUUOy7wxzN7PBALq9QA/vndBnTcO7FK?=
 =?us-ascii?Q?ifjf6iwswQyg7++ZqmWKkRgsD2uVTBLfA1EC7uSN6asplKxGkRXXuFVjSQvc?=
 =?us-ascii?Q?fWOMpOhIsBlblddVxAZqr7BSzMAyrnbgp1h+C48ANrKcsp+TjXPain7FVrfr?=
 =?us-ascii?Q?xABQeyGjHQbFuzsEZxor3Bcv9z8NZszhllrl4X1IVfxwOK5/uFyfO5mRWRtx?=
 =?us-ascii?Q?aTpuyDzXXR9pNg8BuE550PCt8k3h9HOLNYwPMoE/l76ix0Y2+JaocodcI7Mi?=
 =?us-ascii?Q?57DVxnZFFppl7GF3LJ+R+drdlx999YZmZVEVAJcIjY1k1puWlT8OJ5O5CIec?=
 =?us-ascii?Q?qjR8bJ2G8jaXccA0q3V8nmmL7essVQOdYrU81Qny48Vo6Ekw+wrVXQtLvdfx?=
 =?us-ascii?Q?/ducdS6d7XBfV7Z+/OZ0MpWN//NhAV/D6JXr8BVXHiRlLTQx4Zb6hREXi4CY?=
 =?us-ascii?Q?1lz41Na9Q0S1YwkMpznv0SgOGo0Bta8bixL+gpilhM0y1mFDTRoE53G5sLiI?=
 =?us-ascii?Q?0VzRJOZc5ax7wpAg2jElL1kf1z7XuW3dSf6xGKEpuG3QOhf2KzDDHDavtPMR?=
 =?us-ascii?Q?/esQPKGLrFQeirjEVk4/MfSbYZot8nhn6QO6YK1jKhxy3JlgPUpNceJ4Un/9?=
 =?us-ascii?Q?RDPCLJkKXdDQ925YPcvTlwR71gcjssdTS7jwbR5LkyNa326ewceHCB+kOJ5v?=
 =?us-ascii?Q?faGpHX+dfBs9lP0zYyelpsw6XthPgL0L9xiNoHa+dqxTzaIlJ10cbDLHxyww?=
 =?us-ascii?Q?Rds2CGNEY7ZQbA99E+MIQ4Yum9Zhn6Wzt+nZuItD/guVMoOY7RsL+7LtRdAb?=
 =?us-ascii?Q?/9SB78BrKtorIwFYp7gBTx3AfXqjGJWPo4CeH0Xljiqzgv/l/EEyrw6VZnDk?=
 =?us-ascii?Q?uLTNUSSwI4pDziNpXjAJc/IhKNj7PP35K/9vRzzu4tG6AIZtrcXTvHVsz4ny?=
 =?us-ascii?Q?6EJlvCvaTzJQ/bJDOkHBoGoUdHKBmQbGk8hfzSbQPnfTUOSyVePyRUjx2HjQ?=
 =?us-ascii?Q?onNl7YpI2G3YdVKK57z5N1R5R1rCH0O8WnIKxQfJeyBGgZZ6b3CVerYsXHXk?=
 =?us-ascii?Q?TI4paKowa9IAaYvRCIi5/5XbACPtW/N/rN1ygm6TeMg44TozMiUKUkZ3YKh/?=
 =?us-ascii?Q?rI14u38OvPA0ETzlgzIT3/+06Pue7aNxMo7NQbEncy74h27RXUVFS6CVrz3q?=
 =?us-ascii?Q?He5gMaDFfIztpawReWcv7AGZYEuaIRCoOXCmH3L5RhWhoJk4kFqbgNSYwITb?=
 =?us-ascii?Q?ZKRJ8eRrUy5PPJphZwIDKoSmMy+KqACvCYODJFmtyXPHRgjCgflQfefo2Dli?=
 =?us-ascii?Q?v0xKvG7vhDBVAPbNX4K6hnlE9wh00OFF3AB/2yvRPRE5K3GUJDNit1/lUVFS?=
 =?us-ascii?Q?cEq26vGCk2AOctfu10LwhXsLnSPNOgrZkGsWELCHGpGaLuhXZqtj5jqTd9Ly?=
 =?us-ascii?Q?XuVcrrdUvGIY699ddMViQx66XaNjTmKXqocYpsL21+IpRkaRUwpuLbfEnwaF?=
 =?us-ascii?Q?b1VRNdFck40PjQjU28cWyc7FznTv3crGmOoQj2puW8e5VGF17RDR18kYMoek?=
 =?us-ascii?Q?/mfjCNUHCrKPph3yp2DEMgH4KbLSBk/TJKpXm7A55aD6+P1U4mNceq4jI26e?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60df82d6-4cc6-4dc3-2a3d-08dd1aba0764
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:34:04.8495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAK7s83a1xEqXXJKdOnfxA/e1yDMhp69ndH1K9OF0JI3mIe56HvRgKMFusXsVmb1NJ0t9WeQv3Rk2qQmYWEzgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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

On Tue, Dec 10, 2024 at 09:31:07AM +0100, Maarten Lankhorst wrote:
> We want to split up GUC init to an alloc and noalloc part to keep the
> init path the same for VF and !VF as much as possible.
> 
> Everything in vf_guc_init should be done as early as possible, otherwise
> VRAM probing becomes impossible.
> 

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  1 -
>  drivers/gpu/drm/xe/xe_guc.c         | 17 +++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cca5d57328021..997438047a037 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -948,7 +948,6 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  	struct vf_runtime_reg *rr;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
>  	xe_gt_assert(gt, !reg.vf);
>  
>  	if (reg.addr == GMD_ID.addr) {
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4e2868efb6206..7a25c1da6c6c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -598,6 +598,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  
>  static int vf_guc_init(struct xe_guc *guc)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	int err;
>  
>  	xe_guc_comm_init_early(guc);
> @@ -610,6 +611,14 @@ static int vf_guc_init(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_sriov_vf_bootstrap(gt);
> +	if (err)
> +		return err;
> +
> +	err = xe_gt_sriov_vf_query_config(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -1059,14 +1068,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int ret;
>  
> -	ret = xe_gt_sriov_vf_bootstrap(gt);
> -	if (ret)
> -		return ret;
> -
> -	ret = xe_gt_sriov_vf_query_config(gt);
> -	if (ret)
> -		return ret;
> -
>  	ret = xe_guc_hwconfig_init(guc);
>  	if (ret)
>  		return ret;
> -- 
> 2.45.2
> 
