Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B80CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 19:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B9010E459;
	Mon,  3 Nov 2025 19:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEYj/FAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805FD10E459
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762197259; x=1793733259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iEvvWKb3CowHvjBAelYZzpFRl3acY5tWXUgbkyFJdKE=;
 b=GEYj/FAdh9UWXmOqubJT5VWY0ys0Y2SnOnGQNsDh19SDqFbgQAQ8ZfS+
 8xk2mLz3WSUExeOuvLr4zZiA3yh4EnlQuvlZ2hsw57LDsIg7MTDpIGaAT
 qUrRfAAqDrnMqQY2E1EUMQJCEuBcHL/bzdASff9UREy2tIV0ofqvWy0Mz
 tEOc46YnuB+xJmBgCwBsPtpEtMqm5QAc/EYlPZz3oPQYA7nXhSQJs0p2W
 zZ3bHmKLP553ADlXyjasmeHlmSseODmTK1RZX69N8syuV+GQca5eWhtnS
 WAUNzFJsjnfA/EzfY/jnmhVv4CGy0j21OyttZ/BtYUImF5yjRJMudQ9XT g==;
X-CSE-ConnectionGUID: O44eOLsAQ1KDHj8tK5Wo1w==
X-CSE-MsgGUID: FCUOMz/TSMiM0JGA6BbFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64433661"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="64433661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:14:19 -0800
X-CSE-ConnectionGUID: kwkjWuUKQtq5dUe8Krc3ew==
X-CSE-MsgGUID: A6XUDcc6Td6SFfitoPrxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="191295604"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:14:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:14:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 11:14:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:14:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r26UMgv3o97fkbcG0HlWkFK5KwZb+pHp594rl/cXuIhmvn4UlisUqgXr11tePMQdR/iZGuCzXw8Tw1bBYauKast9Jk6ujAEinW7o57OJmg+ViYuvAD3l1dqiyy3i56yFxq8QfGA6l8u+eDL0ycqjrlT7RZLaWih3jXDeOExwb1hct+VX3cPaL5yEZMirEJX8QgJ1ViW9l/kNav+DsHiDVpExSFa14XpKHCyJdbC4nuELjwOcrdCNotCURaoMmm8m2IDOKg2ME1yb+/HEH/ewAVVTAKq03fd+M+hqp3gjwnnrryCZQznhOE24IB6W5ZGWeknr2v6eIT1nqysSysROFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsjcBhlHKTDAqSVjeE3Aml0AZKcEzxiPMzQpSLsG8Rs=;
 b=LFzwLxN9obc/z9Ri5BenQH/MXbUafa6Nj7mjPg4TmEK7NBr2dR2HHxqMfsJMTm3y7fXR2lJaEdO0M9hk1aHn0x1dB65ypyTwYGsVPyOqwArJv6gOis0rV/6SY6rGGd8tnl5hM7FcN/Ld2HhhTaGG3wl7psGxUC1DGaNKevGDDgHenE9pXgmpLimO2m6Q3irahHAQeS9H6uGTQ9wLqKBK0AXyaGz7gsTk0vDjxgCtyXFhbdmNviT6Zh18SJX8HQH3R34eSnk6Wz8lRzlgW3UD5Fx8q9qN7/SuBJhRla8bKNn6FNuqqeWafiseTdJO5y2EaXWAeVt/x5AUvY1u21TNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 19:14:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:14:14 +0000
Date: Mon, 3 Nov 2025 11:14:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xs/sa: Shadow buffer support in the
 sub-allocator pool
Message-ID: <aQj/BMaGWq+7Jx2A@lstrano-desk.jf.intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6084b2-dfb7-4bb2-3cc9-08de1b0d2da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HBDAHRJPLk7q7IyKxzNtNrNmbzC3cJ0AMeRHysaWJX3/DjTbn/4kreHQRYnG?=
 =?us-ascii?Q?GMnAu18tcVpHi4EqRsJrzPHgqT5LE8rJOKzxLfIqM8iWNYc9eNUb8qKQTJzT?=
 =?us-ascii?Q?I6EEWYpvf0nRvVCVVvpSzKJtXxxtC7bPzDIE1gPXWccQHy1ji0jhK31CtKBq?=
 =?us-ascii?Q?e/gsSNbDpdXMmjcDUdvy9LSuXLmS2pBymvnos6LRxBYiHvZWx4ctus+nXc2q?=
 =?us-ascii?Q?Fp34ffOEBRV/YmypZe0c3pZVNKeGdPKLJYJIoTuCsmg9CQiCvWjT4MxtWZhy?=
 =?us-ascii?Q?3ziCTe7Ef3P3SkdLTm6lI84BngfOJ9It/iLhts3M6/8n1j1QdUBIeKmc6gD4?=
 =?us-ascii?Q?D3JUPYlsMdPHiaLWmp/ZEi/LAlHLatiMoXLPe+HRsPyutTbXaf1/gIyGvzuB?=
 =?us-ascii?Q?Y/RmhzTDldUx22bEXt6Hf/8Xj0WYXByor4pkfLoM1dxmNjpYP1LIjwcuVS9u?=
 =?us-ascii?Q?JpMX6a83MXEprsT97k0WfGUS8SEfVvf32bjIPsAbma7AyFN4iOQRwwe9YC+p?=
 =?us-ascii?Q?tBOVjGWm6mFk5KNAOG35Hd14KY5MsqYRrOTpqT7yLBRuiPpiGxp2RdCrIxw5?=
 =?us-ascii?Q?hzs3T+94BsHRwbmM/BMjgXmwz2/fgO0r8Xy7p8llVBA8HlfCQXwZMznFeMt2?=
 =?us-ascii?Q?g5J7p3cBV/Ol8VpadLs0Mqk/k5qQ1MszJOWtA5grg1Vsev4KZmA1TsXlMcP7?=
 =?us-ascii?Q?gbsYIsHKoxSw10fs6kUYhYWZNMzxTUuiKQU5OcqX4kD5/V+giNqccgdu1+ep?=
 =?us-ascii?Q?wVH8whWBqyVRz42t46jzXDw/KQYRaUxgLFWvZW5dsdBdICrA5lrv9Hu9Gd7v?=
 =?us-ascii?Q?G15tNqJPl6HKENv2CHMt70KAAy7SLwbQbcpLgEGcLogvz/JvlaxGaUUaG84c?=
 =?us-ascii?Q?0Zwpnln6X18vgVmHXAXphXlV9OntPFH82dbySZ78KzkdQtlNICQRVoFGj/ih?=
 =?us-ascii?Q?KPwMRPdm1L4ZICdSzKcww7TZ2vISgzMraBJqEMTSM4vagnIpZX4SnB5xKSvf?=
 =?us-ascii?Q?FsZYjlp+nPl0OFuwnzD5rN+loP4uvw3xCnh9jGE4pcfKb0y4NyD3FmpKabyt?=
 =?us-ascii?Q?rqpU/3ZMQ6P0Uw3L+OP3GvbIzEs8BMxhOEjxuVocpv99UuOnAgGHxB5dhq1q?=
 =?us-ascii?Q?cEa34oDn5atrhorLRDV1v0UN3cggWaR38pmyEaQ/iocCPM/92SvgLxntIvWQ?=
 =?us-ascii?Q?msLmpOUf7i0/cqFSmuf2sZyL916ICeyPrc7DVTDLx1D31ezuqNvoWkqgnZ7H?=
 =?us-ascii?Q?95t0BD0WwgHK9+XT3d1Zc/HmeOoTCmKUFVZMDje3Me+/HoBptzzzuqN0xBoa?=
 =?us-ascii?Q?yKKdBk1pKG/bS3i4Fd6fC9oVbiq6krdFYzOuFyBYuiaknoh41wa3905vvQC1?=
 =?us-ascii?Q?R/P0phwYK5OkpU3o0YIHa11rJKGhXyl8L9KR9NumdYX+NwZY+IXmSd/exbBv?=
 =?us-ascii?Q?/IuONMz9Qb9HG0Ti8AHgujr3dCIdNNCW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MWOFLko9ueFFKj7lfSqao2u8Zm372jiRjiTQ2JGr850RqNMEPd9fGkA/K6H3?=
 =?us-ascii?Q?jFA2i//v8Ueu3zglRXzaypfNQdn9ue0SW71a7DbkNcxXRx4CX/VyoxxZRc3v?=
 =?us-ascii?Q?pWTOko0TmsEwPajguVt+akse+dIFZA3Vy7bcJU4HQ+mof1qk+Eh3FXRVQqZL?=
 =?us-ascii?Q?gBRhI3tPgdenegrYKsDcj+nIScOvldh599qVIPeTYenOI73nisTNgshVhKMC?=
 =?us-ascii?Q?91jJX1GY+Kt8wAQw4h0SB2vm+QUoHrYE3jhC/JAJhMenZjyaFW+nBAxsoOpx?=
 =?us-ascii?Q?HVZOuktstp/TVEaKOQYlgpj43tAg6oB0bKdnIKZcR1jpBRcJIDVseLX8wYn5?=
 =?us-ascii?Q?qbi0xsFFSLGjZZ9xduRtK5Dmdxl1zGqKzvCA6fRHhOSlkTiU2nn90oYXK+F+?=
 =?us-ascii?Q?9s/4IDCkrQBNBtWsbVaC5O2Jnzzpw3MvkVQV6zU3+e/GPbIfR0XYCSNlZP+G?=
 =?us-ascii?Q?xh1C6v0kF0yzsd94NLnojAIV5NZWMjjODlgQ6LTn3S+Mxi730oF2QRBeWj3I?=
 =?us-ascii?Q?wtLJhCvii4wGREZ5+D/kPD/sXbwbQ89QEnQZ9bXbgDO8RVHjE7p3szhxhN8r?=
 =?us-ascii?Q?fVriaQdJBzr8uIb1rIXHVsp5B8en29nR09EFrurfievPzJQwHqvcBfNjjPTg?=
 =?us-ascii?Q?iGJy++YYdLrJUjlOtIx+WSD9ZsjmoEAILISPa6urNUG+gyPPxz/OV98ujsY9?=
 =?us-ascii?Q?qSwm/9M/B3BNQ1bPwDow/MIEzNGsXHvOFMEiJdxP7uPNs9+rbi5528jsktHV?=
 =?us-ascii?Q?+wWn3+2CXAEMKpIX0VgyEcN9NdlKPdc7E2sVHkru2UW3tKdJqAa2uXZv9ywp?=
 =?us-ascii?Q?UopIJ8FKAG2ozSFkLqv+rmTh8b9ED/yl870j8P3OF9XG1hB1hEmbGDel9bQH?=
 =?us-ascii?Q?IQCbzit96w5cndpE9Nc1aDeF8VHs7KRkqhRG6RefL+sH532/kUlyqTabJsz9?=
 =?us-ascii?Q?A8UGmPiOvaJ9kvm/2lKSUlmSkHk1vbSoEXMLOqz8sZl+QNmj7YGjJ/es9PRy?=
 =?us-ascii?Q?OdWFvwhgMBTpoYoQpJ5Aj5Ea331FNtju5A9xkTzc6QA1JtKia2j8xYj2vLs7?=
 =?us-ascii?Q?uKuS3EnJs9B6TPC5P5/0tLeeTPwTE0SVPD/1ZMdLtOJpm1w1lEKKI4L2bWAS?=
 =?us-ascii?Q?1B1zLxLOFoW5VSzI3uwePMfxrnSQdBzUxlpRHByG164gAo5Jcp28Q3IIKvmf?=
 =?us-ascii?Q?FZ5VCuKV5y3yDmc7TfjpP0JFQvjNxdKRJxxdUyrAZVFjgxT5gYi5OpvTyHP+?=
 =?us-ascii?Q?eObBgYDfaBg/AP8Ve4wOeZ3CKRgAnGr75bmDYogrTSVpt6p3dR4MOi4EeoZv?=
 =?us-ascii?Q?HVv3rCv8o1t3D9PxaPw3UH7NhigqJMgNQYvUyNPsl7S64IsDrh7pJJj94qb0?=
 =?us-ascii?Q?xPZ3x9DzTXC+wa91s6QJJubnU5g+Q4IGu5iitrt+uP7Umh1oGb6JityIpwU/?=
 =?us-ascii?Q?ftWejsdgqhlvFFkmpk3BkiNH0S/JSx1O24yU00Xg7SZPhqEVPdlYATZob9PK?=
 =?us-ascii?Q?jO/mZufNcId7DneYdZE1GwP+xeKgWScvb7ZSekGXUHJ5BqKKQvwa76R/R1dS?=
 =?us-ascii?Q?qdmiXFJEi3WXcDKJ+5ATNK3xnEf9HB3oNw6EVk9FVkMENCBbfAsGwFD1Q9IE?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6084b2-dfb7-4bb2-3cc9-08de1b0d2da0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:14:14.8724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOIOpPdureIMBsBVkBpu+uNlhwqmQMxdcV2iCzIRBp/y9GN6wKD12wg2CyHmb/WkFWkUJ/AkxUyvaNvhAZMCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Mon, Nov 03, 2025 at 03:20:05PM +0000, Satyanarayana K V P wrote:
> The existing sub-allocator is limited to managing a single buffer object.
> This enhancement introduces shadow buffer functionality to support
> scenarios requiring dual buffer management.
> 
> The changes include added shadow buffer object creation capability,
> Management for both primary and shadow buffers, and appropriate locking
> mechanisms for thread-safe operations.
> 
> This enables more flexible buffer allocation strategies in scenarios where
> shadow buffering is required.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
>  drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sa.h           | 19 +++++++++--
>  drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
>  5 files changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 3ce442500130..c36fc31e0438 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
>  	cache->sam = sam;
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 63a5263dcf1b..3551e726843e 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  		kvfree(sa_manager->cpu_ptr);
>  
>  	sa_manager->bo = NULL;
> +	sa_manager->shadow = NULL;
>  }
>  
>  /**
> @@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>   * @size: number of bytes to allocate
>   * @guard: number of bytes to exclude from suballocations
>   * @align: alignment for each suballocated chunk
> + * @flags: flags for suballocator
>   *
>   * Prepares the suballocation manager for suballocations.
>   *
>   * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
>   */
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_sa_manager *sa_manager;
> @@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> +	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
> +		struct xe_bo *shadow;
> +
> +		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_GGTT_INVALIDATE |
> +						      XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(shadow)) {
> +			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
> +				size / SZ_1K, shadow);
> +			return ERR_CAST(shadow);
> +		}
> +		sa_manager->shadow = shadow;
> +	}
> +
>  	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>  				       sa_manager);
> @@ -88,6 +111,32 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  	return sa_manager;
>  }
>  
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
> +{
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	swap(sa_manager->bo, sa_manager->shadow);
> +	if (!sa_manager->bo->vmap.is_iomem)
> +		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
> +}
> +
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)

Opps, I missed xe_sa_bo_swap_shadow, xe_sa_bo_sync_shadow need kernel doc.

> +{
> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
> +			 drm_suballoc_soffset(sa_bo),
> +			 xe_sa_bo_cpu_addr(sa_bo),
> +			 drm_suballoc_size(sa_bo));
> +}
> +
>  /**
>   * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
>   * @sa_manager: the &xe_sa_manager
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1be744350836..8a674eccc0e2 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -14,12 +14,14 @@
>  struct dma_fence;
>  struct xe_tile;
>  
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
> +#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags);
>  struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>  
>  static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
>  }
>  
>  /**
> @@ -69,4 +71,17 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
>  		drm_suballoc_soffset(sa);
>  }
>  
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
> +
> +static inline void xe_sa_bo_swap_guard_lock(struct xe_sa_manager *sa_manager)
> +{
> +	mutex_lock(&sa_manager->swap_guard);
> +}
> +
> +static inline void xe_sa_bo_swap_guard_unlock(struct xe_sa_manager *sa_manager)
> +{

We also need kernel doc for xe_sa_bo_swap_guard_lock, xe_sa_bo_swap_guard_unlock.

I think we can annotate thes functions with __acquires(&sa_manager->swap_guard),
__releases(&sa_manager->swap_guard) too.

Matt

> +	mutex_unlock(&sa_manager->swap_guard);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index cb7238799dcb..1085c9c37d6b 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,6 +12,9 @@ struct xe_bo;
>  struct xe_sa_manager {
>  	struct drm_suballoc_manager base;
>  	struct xe_bo *bo;
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
>  	void *cpu_ptr;
>  	bool is_iomem;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 797a4b866226..9959d619addc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	offset = 0;
>  	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
> +	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
>  
>  	offset = bb_pool_size - sizeof(u32);
>  	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>  
>  	ctx->mem.ccs_bb_pool = sa_manager;
>  
> -- 
> 2.43.0
> 
