Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6029CDE009
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 19:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9F810E269;
	Thu, 25 Jun 2026 19:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoSNX4+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4F210E269
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 19:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782416357; x=1813952357;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3tOctxxKKUSnq8nK5uJOfdv3+alXKZtyf7E3SHVeOhA=;
 b=aoSNX4+QTANxg1OeP474zdlZwg3g00GFoDS+WvdZ3Y2RKdQLUyc3V309
 Fbe6NjJec2GWcXQYu4vgXQkj3BCxI1f8NidjtSpgW2xLnTC97wG552hBR
 waw518s+f+6RVdPgnAy6qLcUjlRQiQzLFlb5EiHukxO0JHQ/xnlYplgRd
 gwLQsObCbRlFPpIOjRT0Mt/NjOip+kmQ06GDtqGvuwIs+TqFY61L2ZBox
 Tqip6glfDlF0MOi4vpnGkA00T1TiVZA+r8j1EYhJzgeOPy0NhP/gTp8P3
 /QTyxW3kENX3ISrQg/2KWgArBHP99bzxLAmw2QWXNwqgBn4x7mvPZ1ozm g==;
X-CSE-ConnectionGUID: DbAHnp5fQWiJ1RGy7z5/1A==
X-CSE-MsgGUID: t5rrh8MJQoKu6bgceFWeJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93860332"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93860332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:39:16 -0700
X-CSE-ConnectionGUID: EytRdY/EQ+ehyVPE+wt9Qw==
X-CSE-MsgGUID: fO8ZWonqQvyEqDSiltqfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="251560976"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:39:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:39:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 12:39:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CznB2AL5MBEbb+bTksp3nJOWfbABNTJ7+vbNrzo5wSyrTdUYJ/bOtywUT9oZ7eSj83fwbL4NFEPD3PV58RylPcMUl5dt4CZLrb/HBkdyvFi/bAVdIHuqqY1w5zwIhmvHvzKg6Y2SAB0+BXiz8aQhDOWU0lL/5/5QGOaUHevwWnl4K+NvT29qSesGGRcQi4IdNdnryA3IJf1HjHlbZcEgp+QIbaTSoUNeHNdqq+3FjPyF6lbfR/dTKPVnOsUmUxM2d9ZHDqaluVv7eda6Mn4WL7oNrV2gGGYxqSJw/D2riZIXmBO1tEaqlgTMVYkubHhe1BYJvRGaKT6sPQeTFfK4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWzk5bDyyGoXsc8F6weWTdWBTV8ATonVcaaDRc4St28=;
 b=HN5arIiovoy+SGtTEi2ibj9thlVHbOgA85NYg3AjLa5vVfJ73SsHi1B6eE/bv44WeiI+lpY1YL69M/ugaoobc4BouXRJcsWvhMtl32V9wPk0gqVkUDQE5TpBkgnXY2EHpy2KNFYq26Hlhx3XFzgK5nWTJ1n/nJg3Q09gaglnUQwhZ788LlqMp64wqzTOqSL8dRHxj0fYWaosIpVUjKTdChp9JLvlTi+dvnJbBQdhXylAtwHk6u0dQfUS/zz56jPBhQ80GLSYQFHi1Y/n07IAs9YJQu7RHgt8R7ZaML3Y6SLvt/64dQWdzaPY0wySMJaA2azlbiYVx1Xw7KE3InLq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN4PR11MB9967.namprd11.prod.outlook.com (2603:10b6:806:4fe::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 19:39:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 19:39:11 +0000
Date: Thu, 25 Jun 2026 12:39:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Schwartz
 <matthew.schwartz@linux.dev>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Arvind Yadav <arvind.yadav@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: fix NPD in bo_meminfo()
Message-ID: <aj2D3VIofsjGsFEO@gsse-cloud1.jf.intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
 <20260625152054.450125-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625152054.450125-6-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN4PR11MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcebee0-e81a-4b21-40f2-08ded2f16e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 0P7I1+wFxNjCQ0af+BIBwYc7kCt+qEdGHw+aLhUW/ZcJ7Af0oT/q89HZW8XAkO3bfvuRdYUm8mIxBEl6/rUMJwnoCGd7BNzBvL+oizbDXbuWOfGwCu0nP4frPv/g4moVqB1yzvg7JL+vLMg8tWAI477rcX3DetK4u4dOFmpveUX9mCkIssDaM/e93j1i8UH1bueO3gzCThV/FYtJ5UGINazVAgS85YzwErFvkMf6nOEeM0op9cr/Lf2fIwtb8H3ABZ4xuS7nqyY1H5gPJtfYPeC7M792yHvv3GnOtZI+JaQp3rfmlMn9pgwxtUX7FBkgc8DLWhfjki77G212qbX2G98iqQaXvDtbIomD44LTo2oki9axjPgJ25XdfTadTRzbqaYYcSa04NRT4Q1EtUWiFOtl0YC36RH0+h5eg61h6ym7MGyblIb8fn44af2wHemBKDUkrLiNhiR8jFMAtAGZw1hkkx9nz7n4uvJV6jD1iAyB1b+0EUcuwSBUQDS+IWPVUk8uC0aQRTgbbyDI/CxeTkh2vKLG4iBXlXEMZ+HdMGMzt0VYYcnzAM3NRXPG/rS2CUgJRwEkEtKHePUxLJi9X0U9i4SeJ6E4wJukOaA3MYWsL4sygDS9VWQ/27Ln6Abj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eZjZZRGU5yeuI1XgPpiNqfydY0d6vAZgHk5cqseCWA4iLvbhsW1bNo//x0?=
 =?iso-8859-1?Q?gJgyXH6MPmaLtNPOvXH6dd3p3iN/qRbzqvpbfm0UUQAngeNrQldnP45swc?=
 =?iso-8859-1?Q?wGdbfJr3Xyh8KoE9fTdPjAOOWdKzX6DslKeTueP7dPTFUusNAN+WwRi1gQ?=
 =?iso-8859-1?Q?qNj20BQDdwkXwZeuDQ2IuOi9AN6k3dPmgwtM9qp7xmFaGMGLeRO/ti4OyA?=
 =?iso-8859-1?Q?xO11FvjflbqidfAh9PIFb2EyIyRrdvy5EpVL4WcS9eJrnES4aA05EcKzdO?=
 =?iso-8859-1?Q?2IVoUiTNckFCPRgQZOaLTUyH10rXdF7ngts9RL5nuVR/DWPeiN9H3o79g0?=
 =?iso-8859-1?Q?eXL7G/NeTd/1fk9S0dp2dxBJHp9ixC1Zj18bLv3a4Z1Kt/7qaS44x/sUgO?=
 =?iso-8859-1?Q?wgqn+FGUTh4OFmUTMxC1kAaY5axPxn10VdNksFwWAe4Bz/N2/nTGx86iM7?=
 =?iso-8859-1?Q?uyX1Iiikgg1GAA1KhFZCqzaOWHklKKqtOUPUnnPsj8TzjCZU777Z2kcwJy?=
 =?iso-8859-1?Q?8VB95OSULp+LPrS6RahZR8SW37Qu+fvO4Wzd8yfuCn8LhBjx+KfeDMFocc?=
 =?iso-8859-1?Q?RdvF4C1uUprv2YNH3Fowa5OP/4GqoU5DEw65vmlB/wrugiFQxnYfphZJjd?=
 =?iso-8859-1?Q?7hKHit6eaVZDk2t7OeXTGlnhqHyJNS7lgAQ+tLujANcizyuumD5Bc25tnY?=
 =?iso-8859-1?Q?tUtNz18bCkmzNeVhcfbci6F05qFcH7y7FJcpjxM6i2pS/AWlSJa1OKRAEp?=
 =?iso-8859-1?Q?agw72CWT7MpJjqalYr1Ji4nubHcEayn7S5FiggCoRKb4Aalx+9YSmRFoO2?=
 =?iso-8859-1?Q?7Jx3kZSRqvGBDFYxoLpZ+nb5IHmICmnvFYrf/rSlAe8ZtWwFXHjgSQ0rTu?=
 =?iso-8859-1?Q?z3Sets3rVbVtygmz2oUKv5JEsWS6UkuDk9RKqD843L0ASvu9LDt+VlNuYj?=
 =?iso-8859-1?Q?Pfo+GVZvi1aEd3THTbsMHE8wOLKu1T94WYA7paE8pnhv4RNG/L5YmWhykH?=
 =?iso-8859-1?Q?54KDzBleEijtNTKwDBm7lTH5QR8NY4lG5ST6HIcYKfh7zz80/9StcvBoQf?=
 =?iso-8859-1?Q?YvULV6w9hFD7yDTekKrH4YvbXe/8PCylfwFlHQX8+6D5XlDcZtFdq8Zh3u?=
 =?iso-8859-1?Q?fLCyeWvQNoGk6M7rvab2dUKDV7pyLfdFepGtyqQY55nuwsmH++tr2y5UHa?=
 =?iso-8859-1?Q?OBkpvhpfh7TLGwoZzCynQJxhc0q+Fp5cmPRH1V1xFLPvfptIINvmP+w9QE?=
 =?iso-8859-1?Q?7gyLVXyih7C42nl+G1TU0QxWuwhlfEOZzzPGAHz2yCQHxw8OOHbrx95NPz?=
 =?iso-8859-1?Q?aIYtFN3lRQzQz0ali9YG2txt+leQEw3+WzXKElhFr+l05HHb19kSHj7O6b?=
 =?iso-8859-1?Q?aFAD7qlf+VJcRy7whRKboHv9mbOMVppcCyp8DnsIrZtcvdYT7H0XYUC9oo?=
 =?iso-8859-1?Q?hZUlbMfPWvP1IoZqoTXRYmCROoOc3PyZ+Q7HxnKfp00mFJvCr0UojJaEgk?=
 =?iso-8859-1?Q?vgnvgcvq4niehrfiik82YpVGyxGNvR2dlnYufcYoN09LXCAb1hFjR8DJtF?=
 =?iso-8859-1?Q?e554wad2DIZKfZn5ZXzOWECrwC+cWuEZSIWgoBf1wsyp6aggLuJddh52Gk?=
 =?iso-8859-1?Q?L+2sIAYNnMMATTVOM2wjcRiCAgmH1/JF4UGlKiAsieAhV/ZMMB0qIiD0jg?=
 =?iso-8859-1?Q?F5i2yKjjkS0VL7J73Xn8e86+h11Jlnsvx6S8ZfuMNr2T/Yq7hr6DHUfT5e?=
 =?iso-8859-1?Q?q4fR8OdvDFdf/SCgcppkzW6oSNhOmissPww8ApqXVFwl5dMjNYZq8RT14y?=
 =?iso-8859-1?Q?SATuakCECg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Z4Mp6g45vuuIXa8iR9qQmFnp/KOTkAWhsOmkwp6kVXP7TH38lglkj0qkcoDYDFb9ruXWDMhMdmk8cjoNxzsgriF1bkc01ZTtNfVoMguwWs7RygKxjCjktY1c56hinOslZ9HXD2N7QzkHOu+rmmyL+PFT1qLFzv/8MOw2L1HxXUFszjkb+NCG0LoEUgSuPn8gVF0o4GX6abnoMQPJ3Fc2yv4Ur+SeVxIULlUxcU2/T0JzA8WFXPDss0AZCN3JQyjHlqOwugBMOW0kwCXe3F5Fz9VW7NdkgRr6XUVCjpg1VsBGFNpP+nYjP8XRPtWPXXx9u345R8W6bZteYESpQRuPVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcebee0-e81a-4b21-40f2-08ded2f16e89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:39:11.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mO2hhimju6wm6A7Jb9SLlI3J90ir/UsZEtzw3QnlxIWJXxoaYjyvzFm0moma9+k486dvW4j/Rp05OMuRNp9fjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9967
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

On Thu, Jun 25, 2026 at 04:20:56PM +0100, Matthew Auld wrote:
> When a buffer object is purged, its ttm.resource is set to NULL via the
> TTM pipeline gutting flow. However, the BO remains in the client's
> object list until userspace explicitly closes the GEM handle. If memory
> stats are queried during this time, accessing bo->ttm.resource->mem_type
> will result in a NULL pointer dereference.
> 
> Fix this by safely skipping purged BOs in bo_meminfo, as they no longer
> consume any memory.
> 
> User is getting NPD on device resume, and possible theory is that in
> bo_move(), if we need to evict something to SYSTEM to save the CCS state,
> but the BO is marked as dontneed, this won't trigger a move but will
> nuke the pages, leaving us with a NULL bo resource. And the meminfo()
> doesn't look ready to handle a NULL resource.
> 
> v2 (Sashiko):
>  - There could potentially be other cases where we might end up with a
>    NULL resource, so make this a general NULL check for now.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8419
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 84b66147bf49..81020b4b344e 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -168,10 +168,20 @@ static void bo_meminfo(struct xe_bo *bo,
>  		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
>  {
>  	u64 sz = xe_bo_size(bo);
> -	u32 mem_type = bo->ttm.resource->mem_type;
> +	u32 mem_type;
>  
>  	xe_bo_assert_held(bo);
>  
> +	/*
> +	 * The resource can be NULL if the BO has been purged, plus maybe some
> +	 * other cases. Either way there shouldn't be any memory to account for,
> +	 * or a current resource to account this against, so skip for now.
> +	 */
> +	if (!bo->ttm.resource)
> +		return;
> +
> +	mem_type = bo->ttm.resource->mem_type;
> +
>  	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
>  		stats[mem_type].shared += sz;
>  	else
> -- 
> 2.54.0
> 
