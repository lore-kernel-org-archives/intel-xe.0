Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B7C87FCF
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1314D10E5D3;
	Tue,  5 Aug 2025 03:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ID+Gd8E7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126D10E013
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754363616; x=1785899616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I4Cs8mhincFiFkXeFXSU/28lyArTwP2tKn37fCEW+Uk=;
 b=ID+Gd8E7vJUg8kKzS9PnPTWi0dBnElml9BEx5n4QI1O+SPPdvL3CTZ6h
 cWXWoqGQkus6yx0XouO2bLcTX0oX7z2wdEDFFmI/uEY87LA7EiHOBbYEg
 vWXDa7P1/51W2OSoNXM2N/AJnzwnAHcKOeEfWE/q5OqWskbFgFMHBlupy
 7HcLfGrah+/AnO+W7yeVDfQMTBatoftO88T7fW1wf6Qbx8vetiQRv1xA1
 VuUppmpMO0JuBCc7a8dhj/pnwYpUXKmlIAbWEZB62bUlJybKLr8XwWP2/
 7JSY/E6HCK+T0MecxhSmXFs1IEpSdRaZ9reIjCXA9aijfqPOGUfU0PQr3 A==;
X-CSE-ConnectionGUID: j87gBDa7SzqcD6vq1GWjxw==
X-CSE-MsgGUID: gUH83a4QSnSPGOzKmVzwgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60449006"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60449006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:13:36 -0700
X-CSE-ConnectionGUID: sCRdvM2WRvar8LEB2FivDA==
X-CSE-MsgGUID: 0ILEZ8WKSU64tLb8jNZQ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="163596466"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:13:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:13:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:13:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFntM+C4Uhg5qxVHSDZXBVGlcKmqEI6OacNzO4RQf31Sc+iVRY9nxblXKLFSli//Tcbexkuute1pzfqp+kkqJAtclz5kS5njV0U0zCeITm9GaFge/eN8/GPxzsS50vZ8v/5O80VGz/xb7blUxkAptUSNAQg8ju1ykehDbHxZPzO+GKm4Jw9L3Prz7aN/WdqBm7LaQfSXZwvpWmsh+rvjAzB6YhkRfYVr5Q/fWOOgvhXrcRJwnJ79fIqVlb1DXEKRlb479JOONOy9LIm4YQ5U1dljkMr0ALCZZf7mw34t3vTF5qSJgWRVszSi/CU9PPFLHiqG1dGXuvn11+taxtIRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0wugo995V6z89tOieerYw35k/RHN1gsPjDXjpZ1BL0=;
 b=pLh4q3Pa5mKOV69ikAqBtj0R4HoLReNcJJC3vRORYfWCjhzNPCiS9zTwcdiQw/Vnepgeo6iJu7YaWEOI00r09XrkVRTgDT1tUBTyyg0dK2Qs1okN3ersAsmbDuc5vgaLdD8ISTMqccGxirNTAjcjfMrAX4AfKpSKXdST0yzzxvpt6f+8vGET1H8YJ5h0Ba/iVCJnBEb+S+6TBkQpvyE/Xy4dokBq1sldHlGsOk3kt4EeQ8QVeejDGaHD0749c/teBtTRpbulnGZZw/+RIRn5SoTeFucAHXadR6c9xVGfjVGtwElEzDuGE2uounjw1v6X0l2W1b0dR7M71pOD/ApxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 03:13:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:13:05 +0000
Date: Mon, 4 Aug 2025 20:13:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Re-register CCS save/restore contexts
 post S3/S4 resume
Message-ID: <aJF2v4/m8yrKgiqf@lstrano-desk.jf.intel.com>
References: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
 <20250801132441.25463-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250801132441.25463-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 682b549c-cbed-432b-3d4e-08ddd3cdfeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDWfvhbh/tEX7fxyd5dtk80N9IBTnrtzxP7/LFT66wMSloxBIqL0dIikMwFe?=
 =?us-ascii?Q?3g51AcAwNwBrXA7RcfJ48Hy7QIXZv9SKVc5lxiE0GJfHv7OSvrjTj/vy1xfP?=
 =?us-ascii?Q?4t3nHT1Y6aZtBdyQxTg2ZNvgdAPmUbv7I4hDOeJDg5X0YWlx5Yx+9vFXzK+d?=
 =?us-ascii?Q?iMlxKIGuG3d251FtVrQMTuZyRzAjnh1JwXb+gqjrogQ024/LdYbCfl4ULl8N?=
 =?us-ascii?Q?M54tSw2pqJtbWU+34trRrVr5Y+1xdTJmTd9Zs0cmvBv17K6RDz3at3RZCvRV?=
 =?us-ascii?Q?WEaAOFa2y4Mc/XYShlep6ckxtTBkHlei9jdfo3blXrAxnlHGVF96pDFXqBAQ?=
 =?us-ascii?Q?WEjj8Cx5W1v9U15kylzwFQa3wB+9TvqqK7z+ZfTn83gUhwWh9P0F9XV/lqm9?=
 =?us-ascii?Q?ju4mfgSlAXgKOLq7eFPWAbWz0YR5/qO2g2Ai6j7SkHm8K0ldCZhwuc5SdrJq?=
 =?us-ascii?Q?NiZnUOGTH3wb5NhW/0NUaRkeIIIPrQ0iZHqFnDTU7O5vaFTT1CUK7zpa+2GR?=
 =?us-ascii?Q?BK5DOJIOpAOgBkaC50MTEoAVxAs9Hfx7om8Cd735iUhA3DR9nevtPYrm/2MW?=
 =?us-ascii?Q?FkPO2+kU1rRRiXtkm1p9GGmAtj9EnDP8/K8PxpSdfU0PrpuaO5Jx+7kw6NJ4?=
 =?us-ascii?Q?u5cfZIJe0crKkRrS9PM4PIfqyhIw0+3zdsevUIDkVE96twxToWSvIufsiOKG?=
 =?us-ascii?Q?y05eFELbniz3o1AceEktrDC/iAqe8cd26JahDkxrPZ3TAGXwF4yORKYAa9YE?=
 =?us-ascii?Q?sjG9AnoFUkX4cMDX6jKu/lhqS3afR0gqd2G2P5rlMB69aj86i4M1J0Su0qDf?=
 =?us-ascii?Q?GZGhFmNFUB+m69Tn8z9BvN3GjA53ndOwec98j464sPQLUzPpjl00pY31yTex?=
 =?us-ascii?Q?IMjVwEmU9WPegN5AelC3vXLfTfalGBMV1sFVx22iFKeoZjoXrrTN4nOKaBVw?=
 =?us-ascii?Q?zhNiB16alqM26jSLcQhiqdTHU55nZgrJJ3DDjw2/2NhxknMvWu3dflVWTa5B?=
 =?us-ascii?Q?SNiOjXt90R3I1vPxzpcJHROygcZXfrR1QIAYWIcoVDXgvDg9P6VBh+KxTd85?=
 =?us-ascii?Q?juriHLxdSwSrogreo2oCFplynDWRBUJ0yuTrbnXzJazHTGBMK3Xw25R45vCC?=
 =?us-ascii?Q?Dkv6wWZbMe0zrhuWUZtJNBQARC3QZJ2yyN421hsXE9zhtya2BX2WZ1sxBV6Q?=
 =?us-ascii?Q?LrIG6LsGr47wCZYSVTilC0DLJIjEZJB5guFJ+80x5dKLD4SG3XwDrIHIv6zO?=
 =?us-ascii?Q?5ZH05GnUdSPnDYX/ldu/jgXdIMLIivJUN7KsIhifpEMkSi4WCBi0w26DJhBC?=
 =?us-ascii?Q?N99Ir3YpyCFduok2+RL+V0/RU7rZ+j98Yk/ieA4FzCxhDXjHEWS2IiNeHLra?=
 =?us-ascii?Q?NvF5Zo8LWgxyWRsmD83hx71dxhmx6uBYFViS9LV7xKInzCIcb3O4nfwSg7cR?=
 =?us-ascii?Q?LZQD0l8W08o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+B8ZYlQLhmPInLGYvrA1yycPdIr8ChwGJxiK4aH3tFa0J5jMGqArdgZWbPat?=
 =?us-ascii?Q?daCbgj0yupx0DcerdfLrJg1PNkie2mF5BdfiJ+9L9o7BVuCGO6JrjjxdlGGS?=
 =?us-ascii?Q?Kpw/axMGVdjyCFyiXkcG2WesYdTGYzp/7uo+fkri8+y20XZqe6AShHQDMZhW?=
 =?us-ascii?Q?Yctr1b1VzgcbV976Q4jj1wcCHtKSGoDpgRwqN3hIaIZJwSUgl+5zcwWNs5Mh?=
 =?us-ascii?Q?FpAoUSp8CeiVbccKDJyw/9N215VqfJA958IthGF8r1y4nOCHI9D8BzX76e55?=
 =?us-ascii?Q?yrxoCYFAs7zZwz1B1Vc/wDw/jFVnkt06n4Dg5+PXxOXVKPZ6wT5tN56P/acZ?=
 =?us-ascii?Q?LzxIQxjfoYJhGfi3D0XYjiUDnnTv87UHrlVvyQIlrfmZUu1rT03ZvfVh1QV7?=
 =?us-ascii?Q?/v6a+xgaSyL9yC0yusLD3CTkhvwOIQdWlJzDuOXXlgCOq3USatW7etvFM93T?=
 =?us-ascii?Q?Z8vBYv+ZUy8c2EtPYLViJceLnvJksty2wUc+oVxZE/n9JEleXriXcCaNDPu8?=
 =?us-ascii?Q?+dwVc6hbnslrQf9vk1TmHOEO0l4Em7a8ls078NfJfiyOpsA5oKaC90jIZIox?=
 =?us-ascii?Q?WNdFtYf9s6dAOdt1mtnxln6tTwgzxokUnBjwfxUx3K8LE+V+o6MyLtJljWfn?=
 =?us-ascii?Q?Bgp8byfv/Axj5AS9p+V0Fz6wDmMLzjH5dfkjd1tjoPVroJHBW002SjIVpRhi?=
 =?us-ascii?Q?spk04AbJPAYT5faTG8dGOUnhI9iC+mEieHYj0k8leeBWnQG4sz4H1g2K/7u+?=
 =?us-ascii?Q?R3s9H/iN+XGYSDwAhKdZh/VsoX6wz3FAgdX15td96snq1e45A29W7c0ti+mL?=
 =?us-ascii?Q?QfNe+DZS6Wp054g5hgid9s55AD0nADAIMuZVGJqr15fv5k4iTLhn70hMVd2A?=
 =?us-ascii?Q?KhqTq4MLdk/HO2R+M4NpBBuInOuAiSgFIHrKGkrizdylGj7icV/utI8ebEqF?=
 =?us-ascii?Q?dKXP7YDpoX7JoqI5MSAO1FZwfBnKTp+/KBGlHWcX5Uf3e1+ViwABPWfwcb7S?=
 =?us-ascii?Q?DFrjQhZ+QQWMPpoTFQFoxzMlrJL/PnkU8PIy7h+CR4699TBUnWZl5mcGyzvS?=
 =?us-ascii?Q?Yjhi3jE+qEK1mDRREq5NnnyujoVqqjI7R9c8I1gyvNd0HQmzLirtGHkd/8n/?=
 =?us-ascii?Q?RNeQbQ0yK1r8bB1yrbtB0o4A3Vjc+0jrk1Gv8aCxaDrqmR0fLxZItoeMNjdA?=
 =?us-ascii?Q?pzHXOHSwARsGefrOZ7Bm+0B+nDANUjWSKAhVtll+Npkhi+l1RShrg7y28kgS?=
 =?us-ascii?Q?lW6FxbnOSAABmevoza/41EEvxddOB31lQXQ5r7OfzRdCtRu6cdpao9ag5g5T?=
 =?us-ascii?Q?gk8KArnXeYlBZ0m/ChckpqQjEjhB179K1UFKFcF9xJVyVGJGeWveAOi8dEsC?=
 =?us-ascii?Q?azMtZSmXrUS4TIGXRZnePoMbv8M5aEAlUmvhWazn0Ssy+li6lg1OZ4BK7+c9?=
 =?us-ascii?Q?DaZyZxzjCGNXf6pRkVJtwiilmGixYeux6u8yyu8wa6WIyMt6Gtw7D5FX5d7Y?=
 =?us-ascii?Q?eqrFaWlxrgCfbhwfPAJLtrUN3mVcW9D5FliPT9qqxZz5PzhMjj8lMuuVtTgO?=
 =?us-ascii?Q?LAjoXeHRdfR9prrvFUhCJaEMN8K94NAG02oG4LqrRSTR5mMnbuAVsUp3sb3B?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 682b549c-cbed-432b-3d4e-08ddd3cdfeef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:13:05.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbZNZTIq4MZ5GzaYYrsRTYBCcj12QW39UvSGAphio0hh5QvW+qaKxm8dny0uuSUKTZqvNjQqtVqKu1w3MdUEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Fri, Aug 01, 2025 at 06:54:41PM +0530, Satyanarayana K V P wrote:
> After resuming from S3/S4 states, QEMU issues a VF FLR which resets GuC
> communication, causing the loss of registered CCS save/restore contexts
> with GUC.
> 
> VM migration post-resume leads to data corruption since the GuC cannot
> save CCS metadata without these contexts.
> 
> Re-register the CCS save/restore contexts with the GuC after S3/S4 resume
> to resolve the issue.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

I'd just squash this one into the previous patch as functionality would
be broken without this patch.

Code changes lgtm though.

Matt 

> ---
> V1 -> V2:
> - Added commit in V2 version.
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 44aaf154ddf7..5e8126ca8e27 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +
>  	drm_dbg(&xe->drm, "Device resumed\n");
>  	return 0;
>  err:
> -- 
> 2.43.0
> 
