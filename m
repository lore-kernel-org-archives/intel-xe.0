Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B49C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DD910E048;
	Mon, 12 May 2025 22:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+iwh1ml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2404610E048
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747090220; x=1778626220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u96nb8QW9bww/6A10K0YY67tjDbdmrxrjx5Hw9+iXXI=;
 b=E+iwh1mlGfui6jP2woUnR+Vylt/rciOS9pho6nyzgzdgGY6A65bQlJka
 a2OZ4UciXKhObCOaDB+BcpkCtZbFhvZvBM1fVjjZ3slMPJUFZFuY/I6na
 AyENgDNzXU84Q3MLPxj63Z2zRJyhP1g51Al+Xm7uOo9slp0lTFdWA9iAI
 qoUmcgsQjERo1sFcLjAiAiLhwsvdo8lBssYnIIn+ZiMtX+78U2+BvSTaY
 6PlGMC8PVEBrEBsYKMlTf7MW0kjGBxO1EY+HJvDZklC9OmQYZH64UsOC/
 GIKebRE6q3ug7yRUvuFVpy3k+sPu+SmyRWZngEkpcaMiJDbYIq1uf/ltB A==;
X-CSE-ConnectionGUID: xiRXvMmaQRKYqicdpdI+SQ==
X-CSE-MsgGUID: 7vGh99o1RtOJ3RXxPRKCDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52716469"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="52716469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:50:08 -0700
X-CSE-ConnectionGUID: bbIHeJe8QpC4KSLl5mU+wg==
X-CSE-MsgGUID: 3nDUSSSBRpqArnNjLblCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142457602"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:50:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 15:50:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 15:50:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 15:50:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJrNQ6PzJn31uKIeXjaAphzDag5c+aGYpaKTU2f2jlRLVNsyDDsVce2yWxZTCkKTO/Jzwf9DSWiBrZOp1uwUQkuTsvy9tIlxyDRZBwkUpL3317AewKWNqKtQb1xVj5hCgR3FJ9EDfooQSq19nMzdibMTN+EQXjaSvYMiy9sFw+f+KyDdLC5TJBXbJNgPD2aOV8e8/DTBRsT4Rq50Zgr13m2E9mCBjJzYMXQFAlEVNkTdTKIovWBvU2PBwJSLoGh+NIjq6fr5O7Ag+P0BrKRQCT73OMHQLkOS85vvfUt+TmOeAgslNTXIDmjrWq4AYBNa+Qjf+oUNrd/e3i+y4+bmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDzxaow/6gzXuEUo5G4hxrEnweMmcnJxU2B4yMJ/QAc=;
 b=dGc+tVEShAj4cYwSp6dCWRAjoLEq1jxGIV91RDOk0ikGcl4lm8oRVpIXy+RNqbr4VIPoqCUGaIWfBHoC4F25++540a+DGXxDtFmuV2fT4AyxlnA/ks3PWwZrzG2I2y47oqGQ83H2QWBVsTJqAIe+Ti8Y3GYjqGdS5UunENgl2WgKHO+36VcUmm6FtG8eRvWKVFwpCj6pTr01ojgVj0pHNdOSbRGPw+mz4tpMlya1mc3oq+XL857iSu2e/JdVzIz9+z9scCWWCJOOx8aKPGDPNRxu8D8yXv6JdT1KB0u5PbQ5wCxl8nD39Z6T48yKDVjJ/b47+hRbA3DUHLYNc/mpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 22:49:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 22:49:43 +0000
Date: Mon, 12 May 2025 15:51:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/10] drm/xe/display: Remove dereferences of ggtt for
 tile id
Message-ID: <aCJ7XczdgN+dKI31@lstrano-desk.jf.intel.com>
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-5-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505121924.921544-5-dev@lankhorst.se>
X-ClientProxiedBy: MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc80c0f-c379-4b6c-4554-08dd91a74929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QMtIT1efliqFQYtIrt+J20Y68V0LicPTKqE+/vsdPhr9r4tLImzJoTfxHk4f?=
 =?us-ascii?Q?tmhlN8Uvfxn7bFZ8J5EZCqfWtpbqv11PC+9lBBRj/2O/u3Wzx4ov8eTeptFU?=
 =?us-ascii?Q?1xyWy4kfudVCCLLXYUb9tsN3adqnM5746/jpHOqKK59VCffbf7V05R3VJ98j?=
 =?us-ascii?Q?nMowR+zk2/TPwu/A3NN++E7u8wH5+k8LejU9QJstKsxFL1aJwQYZ2xlXPrru?=
 =?us-ascii?Q?EPMPOOOM3z+GrKYlqhe/PAKgBld3ZkFjmAiKj5DDCazmaIRkw1oRka9AKATm?=
 =?us-ascii?Q?dmYMwJzBMvOxUUDV62RmA8NsjNNKCPc9zhMu3+JKBW5fPmz5g3AgGv+f8g9n?=
 =?us-ascii?Q?e+B4CFxiLg+FQSvGCX493/4i9asp3WS68agCSksi7xv39TFYEyFNgFq7GUfy?=
 =?us-ascii?Q?mleNG4qdOTelVqzxrSP6O6a6MLFKAhXxiNSFcTLOeQwa77Dc5Q5+4kGay3rR?=
 =?us-ascii?Q?L/HTXXJng2yzx/gGNmh2Xh+09aZpkFg8wSJQd6hPJryUs3W2jD4EJ2gSWZKB?=
 =?us-ascii?Q?gXspp8S9VBiorMexGa5nAy8O7O7i6FONoMhLF2T/anJcIdo6rIRPL/pzCZQA?=
 =?us-ascii?Q?B/Pp361qb1hxKL2IwQghO/k+ymqqNXeTA9xDE10tPFtLWLidZCFy9zqbj+nt?=
 =?us-ascii?Q?nEkfr8oVej0CMizNKnPyrcrZJbXnZl5lsh4nuSrKkP4vneB1oFO0i5qXzR3X?=
 =?us-ascii?Q?pozvWy0haurHULx0j27a/fUCzH3FcmmmoeEPP+ETSZDmoc5hD5fA8t9tVPxc?=
 =?us-ascii?Q?qU0w7ndA08hQ48FbR++l0aHy0j3IiKAlUsNVSpsr6sHOEqEdEQpMAGrA4lPs?=
 =?us-ascii?Q?krCNu1L9/0l/vjFGYBjgzF/4DOK4ofaiNmyXk2TuoA3dqGCbSPDGgV+iWXgQ?=
 =?us-ascii?Q?9qd90XCchZzpuc0+RhZ/VfWxcjRkWIu7lbLu0X+073KfI/v5UH1a9mv8PJXh?=
 =?us-ascii?Q?2zVGpQ2oA3Yfy2cDi+fqFyXmjRs9x91Xi2PpCEukNwv3NjVNn0WflesrPAd3?=
 =?us-ascii?Q?SlVBIqec1Xg+AxigM0lj9R8wkz80SO+eoUI7/clNi9qdnZPUkPVbtMaTLbb5?=
 =?us-ascii?Q?z9h4S0WMhg52aNRrqfpjQKPbf71Bt89Lna0LcclAimplVgl2IrhcJVvnGIjj?=
 =?us-ascii?Q?6JMCek0iEEcSEgSWGs6r03Fp0z0u52vZEKhxA+qKaigWgHg2RonZw2YUMjg0?=
 =?us-ascii?Q?CPH7GvZeTuvKEmEuyoGYPKODuM/rvWYUo13g/yhpAODvsFSVtQA6Jmw5GBnJ?=
 =?us-ascii?Q?LnQVlvJu+2nBcgUQl0D4FEFNGjBaFI5QkBQv6cpDsASsZuEaIqx9+4x+3kZx?=
 =?us-ascii?Q?bj1WcjDXWzudJy2egKBT2xrxUaOjSyJVN2GYt8LJ6xfv+yjUUI79XIIo6vfC?=
 =?us-ascii?Q?L5uL7YKN/TwidXnK724ytmh7HxcsaDhcqZX1M4iewcRhxqs1XaYEGuw1CEwT?=
 =?us-ascii?Q?AXEE8uHksC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4KWOCiwQ3MXvs96JKCiHTUC1d2DO1HmcBFPWUbqhm0lEejdi0e9HkJ1gf0dd?=
 =?us-ascii?Q?gzfYuVEgELKcqgNELqf44YT1CSDSlPmUNX9Gn4XD7hUxWHBhVGZ/DfrEcGal?=
 =?us-ascii?Q?tMGYnxnA7MpC7AOvcwIYuWMaCNCRm5eLniXbqwuNqrZXpqHPHh5IZALOx+Lm?=
 =?us-ascii?Q?fHLstJaU2E0u8seXG8GbPn1efpZAlghWe/Ir31kxwQsumIFuJpnzl/LzfNZF?=
 =?us-ascii?Q?Ibe3oU1YrpzdSV4iDSrX7DjSDVwNIdKEYozalJwgj2fcjmnTPhgDThxNhs9b?=
 =?us-ascii?Q?PuqrqUdEdmCF8GD7CP/vEnTVss3u7BBBu0I8GHWySvMttvRRRoMt/x6Vcxiy?=
 =?us-ascii?Q?0CVaPBsigUskwxm7RSZxVUFlg6K4uK0z7rw4sI7yh7DARqTzK+RB48wOtMHo?=
 =?us-ascii?Q?1J5ari0rs0Sriv1KFeYNs0B4gLEZPl3AGDiaRMmSSaIS8KfXD4xwDc61Wc/1?=
 =?us-ascii?Q?YBsaceJ256ipiO3fqjxbbC/U5dkhxf4I9mIs7JKGA7owrJKgpAn+CcBBwTUO?=
 =?us-ascii?Q?FJ5keHQogajRvGwCrcqF2qqxZvqda5lmf1H126aT2Oti9biz4YEkSMiAhS4S?=
 =?us-ascii?Q?BLfCr9awmHKs1q59sYz7b1jhuuX+1m75h+9SV/1AVHaNojW9PiPU6FTtB7Bb?=
 =?us-ascii?Q?ffCyz6wkv7vxiY/X3c1K8ci9TPlb2M9WURt29sXG0Rj+RTxMHAefKHAeFwWK?=
 =?us-ascii?Q?AHVso+UUfzUORSBn99PeDsgr/3x8VP+qh6yhvjrcOO336D1MPP0L3r0gZ//Y?=
 =?us-ascii?Q?erqvH2CVwCyIGGe9wUJtayaiwU7QkgVwpL0G8DtSLT8+KfwFqKEtpoBua1vq?=
 =?us-ascii?Q?O8lxM1PO4S0AQxDUFgxzAFkO4iDPDkH3Q5zsrTN1XMmPrSNu9pzHnfOuQYyc?=
 =?us-ascii?Q?MLE3l8PK8940OVDSHuQZvyEb+vIckhCs2RDib0B52UPykS6NewPO7lduAMmE?=
 =?us-ascii?Q?GBQ2/mEqCR+13YRSIgf+we7WclDB1YsgxsP5CdxNfNtQLsSvqSwL6ebXFEri?=
 =?us-ascii?Q?zmu9cjBupurs0LCL+abO1ezvQUn03x8AEq3OsuY9m/0hXzQJfUvJN29gYC1Q?=
 =?us-ascii?Q?F9lMcyfzpVBKBwCygHvjpL5Y93u6IMRlsgderetm5/FtHscWBMDlBlpkGzzC?=
 =?us-ascii?Q?D8/gW+NFZYT5HmciNB21dT73VurWUlQTnIBL5+CBsiHkbbPnv4a74BonhKcI?=
 =?us-ascii?Q?y6qDDi/7d9+oUz3NutcUkN9Ofbogaw+ooVSey2B8iQ67OQRcbVuUTet91soW?=
 =?us-ascii?Q?MysU9qN1N7toR4QL6wDpqhOazvxalq4B/4VKnv0hGY/MfiKFMqtBAOgS17LH?=
 =?us-ascii?Q?jfWSKFmq68SSZYkxDE3ivZK6DsCfdVS8Be6Ifm3Kl+F0xHIdUBzmlEYJ+BG0?=
 =?us-ascii?Q?6YPxOHb3dS6zHx2sjNR1+ZtdScWeyt/wQqQ3I5fTY4Kr6M+OQ2Y/OYnYVH1j?=
 =?us-ascii?Q?X8ThbP6DAP05go4sMAA0muNaHt34yoxxbTeSGDBVGxIG72WmIhb9d4iiFmfa?=
 =?us-ascii?Q?h0cllJyReHQbBRHmFrKpgK7GKsQVkgqlzHxvxgN1BMiJXm373Bfx2rJoN2ba?=
 =?us-ascii?Q?oFrRTTlmeAqPRLQ/DLZKK/ukeYiQZgTmeweU0rw+ZAnRXkWHWaQljzntwLy8?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc80c0f-c379-4b6c-4554-08dd91a74929
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:49:43.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4scqrOQcfu/wCz0UBnAj4dH4QP/UFfujMBgYoNf3+KpEtscnPJHOrdjBNWSHDchY0230sSPF7Hz7Ww21K+1JUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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

On Mon, May 05, 2025 at 02:19:17PM +0200, Maarten Lankhorst wrote:
> Obtain the id from the root tile. Likely this can be hardcoded to 0,
> but use the clean solution of obtaining root id and doing that.
> 
> to_xe_device(ggtt->tile) can also be easily replaced with xe.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d918ae1c80618..d509def82b134 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -199,14 +199,15 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	struct xe_device *xe = to_xe_device(fb->base.dev);
> -	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> +	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> +	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>  	u32 align;
>  	int ret;
>  
>  	/* TODO: Consider sharing framebuffer mapping?
>  	 * embed i915_vma inside intel_framebuffer
>  	 */
> -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(xe);
>  	ret = mutex_lock_interruptible(&ggtt->lock);
>  	if (ret)
>  		goto out;
> @@ -215,8 +216,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> -	if (bo->ggtt_node[ggtt->tile->id] && view->type == I915_GTT_VIEW_NORMAL) {
> -		vma->node = bo->ggtt_node[ggtt->tile->id];
> +	if (bo->ggtt_node[tile0->id] && view->type == I915_GTT_VIEW_NORMAL) {
> +		vma->node = bo->ggtt_node[tile0->id];
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -271,7 +272,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  out_unlock:
>  	mutex_unlock(&ggtt->lock);
>  out:
> -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(xe);
>  	return ret;
>  }
>  
> @@ -348,7 +349,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  {
> -	u8 tile_id = vma->node->ggtt->tile->id;
> +	u8 tile_id = xe_device_get_root_tile(xe_bo_device(vma->bo))->id;
>  
>  	if (!refcount_dec_and_test(&vma->ref))
>  		return;
> -- 
> 2.45.2
> 
