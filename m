Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10530CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC73A10EC08;
	Fri, 31 Oct 2025 18:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPDruEaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95810EC08
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934648; x=1793470648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XxhpsMSPJRtZIiXsJ2zc0GXuoi976/RDoZ+LvEOWlSQ=;
 b=OPDruEaQg/yUWn1zz9PAlvnW7meclHUvHt98RMwk+OPuVy3XV7UhnnRC
 wQreZB+tElk4amO9Zk96LKs/34zswkDkhQyIgGniOWH4/RpOW2b4cfsnh
 Vvj+cxKCBkJUP9vY+AYzeaw+ThnC3724Ia+wwpUVa62iK1Z5g9RebCEfa
 GQytO4AqcW/V8nDwFEvwj7ifdPTae5o0GWNHCPv6BbrMMVSOb0iphJ7Iz
 eqXvBeBZl0+FQyslaeytV6Zq7Qx9HjhF+FPwk8tcDwZL2Z51R41UvUUkJ
 J2iDuy8eqHZi7CxXwDkkb6TxYZ01W+DyOl93CulSJraYdMSIlc+bhRDCA w==;
X-CSE-ConnectionGUID: 7ScNcOS7R06zrfpuz4b/+w==
X-CSE-MsgGUID: 5qKIB01WRgynZUA65vtLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="66716264"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="66716264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:17:27 -0700
X-CSE-ConnectionGUID: D826q5NWRL6RP/XNl+HWxg==
X-CSE-MsgGUID: cyP+qrFrQi6eex6CA6tAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185516713"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:17:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:17:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 11:17:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNkju3MBcQpQzk7wpzapApTmFJfaecu/U2QOim3BpEa38IKKfWQtErJ2vDlAfY4E9mMJSAgxxXMHYa97PosteHem5NivgkNgq+Suo0Ezf2uhTjply9G+HDXQcMlqQ1/AOlL70omTfzjYZt0LW3MJEzyfIZCaO7rwIjaYLOIxw0rc92AXZ5Di8PQJPfBq1PIofY1BWDtiVY7HhwAV7VWkUa0BbVJnzqqRZuSM5AscexN6F4/Pwt21Y6I9ikAaeDe8rHW2rmj4pyEi3ynTbCvcUbDrTpDVVoyU8TyjkBRMvwlCvl2FU/LiEUMxVq0oz3gqFNl2vBFyjhQcDfXRIWwu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJS4rSbo8JixD1qggaJhGROZXUNs/xB+Cay7JHvgAv4=;
 b=us++/PUiKEzPtgGOOJlzYR7uL3RYCBXRSKKRKV88/pbW3aPWAb+W+wcZUavVOO6qyhmgmqbaHyZ7tdVqyL7zNn6ZQ18q2ctbJR2/5BerNpi/0Q7goWTmpIFjAEEu5iL+EZ66/rKE9p9eiHn4UEVPc6pzL7lscNTEvI3cCwn+3/DrZ08h9tvwVHOBi51o4OCOO2z9niO5bW2aSylfnjoDCjmTyBr1kwqDzt2D2R0SI19gzjMLc3hyrJ0N6yxdUvLqaE8v/FA/2oEmGB6x9yK69iVDU5EBLG8ybfDbKFSH/JqcoBzYAaI1S8vqw2i/MhKpbzTFpdj9Oj9hfRb7Nu0QXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:17:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 18:17:20 +0000
Date: Fri, 31 Oct 2025 11:17:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Nareshkumar Gollakoti
 <naresh.kumar.g@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2] drm/xe/pf: Allow to lockdown the PF using custom guard
Message-ID: <aQT9LiqKstZZLZCV@lstrano-desk.jf.intel.com>
References: <20251030223031.186685-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251030223031.186685-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c295885-ff4b-4799-dd93-08de18a9bb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7d3Ljo3Wjn4QBtRMozsOYYHKpuW59FIM+04h+te6xH6r1WWGONyaXbqnRB?=
 =?iso-8859-1?Q?xSBbTlEwIib4ECH+Ow2DZ0sL/iU6DRemrOF1Pb6JRemIPJJdR3zupLGtd6?=
 =?iso-8859-1?Q?8vGLavnMUgzuEx58ELDfLJ2wdprhO7qYHK06KyTepnchek1NXcJouYFINJ?=
 =?iso-8859-1?Q?qHU3o5WegBwrvlZJbjoPgri/antmFT8JbiW3ts69Eiu7iGydGOAaFVzo+0?=
 =?iso-8859-1?Q?5ILOVWkiPwYH/uRJ+reO9TRp5gf5HxRvMMoG75D5jQhMi1GG5SGZRKeYxM?=
 =?iso-8859-1?Q?N6Yy5J6VALGI4ZmyTvE1CeOggyp0NdS6g/HKUtAmGSFbCqFadM7fgDs9qm?=
 =?iso-8859-1?Q?2lSOfOqA0NQ7gC4Tb9fnougRYL2v1zI78TyPdTG6z3ChN49ALZSEli8AyV?=
 =?iso-8859-1?Q?dtU6apeE5jayCFW0vo3WtMI6Wm3tLpGrQEzv33Xtm5RuOKyhFMEU9c2g3x?=
 =?iso-8859-1?Q?5C3+fu1NRepPtTlrbbQ8yfDyb+eE1zKVErL9dLyPDBju7Vbt+0GhbJD2Da?=
 =?iso-8859-1?Q?9mtNe0QzcWc6nspYpA/HeouzyiB3rl1+ZHAVczvXDrObtRpHEoxueT2iaH?=
 =?iso-8859-1?Q?6n10uQhf3J2tpFna61wduDvC0DuGk3qUPqzZaqYVFywNc0DnwGq+Rlj/rR?=
 =?iso-8859-1?Q?bdccPd1y9UTYCa29v+r1Ou84+2NqYLKKkaChbORkYMY1GwJWgrLsFC9nB8?=
 =?iso-8859-1?Q?M0p0deVynEPYt7A4Cp8pLE/4vWRVUvc1OKJuUcTz1rWpXXD75SsCqQSSph?=
 =?iso-8859-1?Q?LiY3j48jG1HCsGdf1C2+9Orgwh/Hsmn88ElufkE/Wj/6aw8HA0jsZxkCOh?=
 =?iso-8859-1?Q?ewFTPRgoMsYKZBo2UZy0ZOXocrRUsILMMk6whQuGRLMQwcP+6DQ6s0xqGu?=
 =?iso-8859-1?Q?QtOvOuUuWgyWMTQGsxxUEGhmD1F4mkziDggnTlapY5LXBMk3rTdTQVbuGL?=
 =?iso-8859-1?Q?lEm7NUwNtfZJ099egX4OpD1L5Fjw4izOjITbTvKYBm3Kc+ExfXTGj0bjZ0?=
 =?iso-8859-1?Q?+amebhTYbrsoQQq9kCPoKkvU+kSLl6rax5ZGjcDtTQTroJpuaYZlYZJtjr?=
 =?iso-8859-1?Q?mr7KSluA+ebxHoH4wm7g4arNU94/yQxnA6gOvN8lN7v53deVn/9892Tucs?=
 =?iso-8859-1?Q?gbPQz49p0GyOeFtAnW7euZvjoY3+yUgZvs5rpSyANbAy+txA7PR4crEQZF?=
 =?iso-8859-1?Q?Bvwbh4J4NK6Uapp/h+pB84KnWqKRP+f9aeMxcqYY4Hkg2rYpwLqzzyMwLd?=
 =?iso-8859-1?Q?jNp/lzGllPAsL079CuUcoJvghqWxWmPs2tkLXSI9Tq7UsnnBG426PeJ4HQ?=
 =?iso-8859-1?Q?cY+F3CPXTXsfQhUsUYYHDbHsPmc8lJjQE2uu9Yu6/PU1/rDw+sY0xFfm8j?=
 =?iso-8859-1?Q?QvCDp3gslOW2HLs2p7f5y1asgsKvn/kAZnx0XCADvqua/IiC+PKxYj//hp?=
 =?iso-8859-1?Q?t3knrHRHsx7S4xsSzGP2HcfoTuXedWD2e6k70w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JpSb803AiMdtjc/fQ5hvlPggHngfqbP4JQ1u4fo/+GeE1Tw5PEFy1xHkuM?=
 =?iso-8859-1?Q?C/6p3a4vlM876TRvjPJPOggHzTcCBQjYXcFAVhj48O0wkOxPgPWKpUPSac?=
 =?iso-8859-1?Q?4z53TkIUe/M/ROnxameG6W9fkd5ZHKVHEngOIIz+1MThqx4LVLDr0xK6pt?=
 =?iso-8859-1?Q?37oxzP/zmuZj6IWzIv9vxBK0c9DUj/vGrm9T0HsZrR7V+fKCd4i81aqM5G?=
 =?iso-8859-1?Q?NfbOy1NNwfh62m3eOxZILU8DE+41s8pUEp8gSagdXZrjmdBLYmwlPVLQqW?=
 =?iso-8859-1?Q?gf9s094vaCyc7k6R7SM0+5b9NbL/NrmR3I0h/GyGs+raPr5gHrKEDa++Ah?=
 =?iso-8859-1?Q?K4AKwXd6aKWmH8h9vs35a60cXBMYwzKhH0Bm8KyDkLyYIxrrbXSFoCKzTe?=
 =?iso-8859-1?Q?z4nJs50g+SIIEkWcLRwFo34Kzdxy5s2Rxd7X2zp3tXIPUbnbluaGyG69kJ?=
 =?iso-8859-1?Q?lPE0A9OXnBFLQZAjZiwugKCwYVYdTg+UeqH/cebWj5CpRyW457dbWaUETa?=
 =?iso-8859-1?Q?r58XrionVwE4MtxLcBLlKaUZXa0PtkZW+xG1SRjVNlJvkJye2GSlLKue0X?=
 =?iso-8859-1?Q?W754vp6bkFbesoSbpXe5HZgbfzeaLLRRHo46wS0f4/Yp7cQbyhPAym+3oP?=
 =?iso-8859-1?Q?1vEmlm2bFGzgybPlXj7rlTZepvn3bDo6BH93p6nqfRWuSWNrotMKJUbVAX?=
 =?iso-8859-1?Q?j2hKzoVAeQNpv2fs42qnVzC18FZpl1u8WwnZJGhkHX59Kp85WEwH4Y18k6?=
 =?iso-8859-1?Q?t4Qj1fRkHGuzVErddqnx6h+1MQbGEuSl2/iHvnDovUW/2NWgQqIFkS3dVs?=
 =?iso-8859-1?Q?3ktY8+HUSR3Lae0Gf4XaMx/rmiaEhV9yWNLAMVTznf9rOSWrutLPi63lFk?=
 =?iso-8859-1?Q?5s7NaqUx7pSAjgDKS5tZr6LXhuya0NP6N+MgHRqzIW3Vkmycqq70gssxuD?=
 =?iso-8859-1?Q?uQQecWFbT81v/+9N5BA11XsE4qQZ4n+3qg3tTaT6bfNT6cZJm4fjiFurLQ?=
 =?iso-8859-1?Q?Zs/cyg+vYnivJEGn97+8sJzTbnJq2QrNDhuDtmthuHiMeBlZejKOBlMAsW?=
 =?iso-8859-1?Q?HZlRbU8fJZfmxgscjkFS91ldqMn/TdPrmAc2N/WG7qvV2PUxOGtUMbZ8xt?=
 =?iso-8859-1?Q?Xt01Mgu5dYesg9faBmA4LQmVmxG8KAScDUt6Ef4IGRbJ56gADy6lIcU6/w?=
 =?iso-8859-1?Q?fGPx1FjmZcckKyhMtiVWRrDfLqjC6me/a4oZuBuyzLGmpm6YvEhdx1+ure?=
 =?iso-8859-1?Q?K+qKwd8Op+HSKTFI5R89UHiE40vYw9k2Kzm5pADleyaJTzzn0Dc48WnBBn?=
 =?iso-8859-1?Q?mk12rlijwoSno03vEC0VGE0eKbnnOVHwF8arb3pWDClDN1LBmpLhQcxW+y?=
 =?iso-8859-1?Q?XywqaAxfVQv+lIQgo+5syFKQUFuUCMuay/9WadMgCCYsJ1IYWlRj5o/mHb?=
 =?iso-8859-1?Q?zRcVanPKRRc6fZowvs048xxJG2Ju8e4tbtSJeWfOdMYVSaz/lBo4SlZkhp?=
 =?iso-8859-1?Q?n2ISb9PUwEKl7aQcIoNNYwuH41d1DfcloxL6d1aAnLeUvTLaKnVRVgtgrp?=
 =?iso-8859-1?Q?9aCrcI054ol5H3Dt2BMVmlpI0RXu5O62gD2E7KgIIMc/lu+dMpVBulwDSM?=
 =?iso-8859-1?Q?Jvq1M1G484xNNsvLuh+/DApWxCDU2VGGM98dy1dNEY1OySPZu0ukycAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c295885-ff4b-4799-dd93-08de18a9bb21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:17:20.3384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC8bS7Qkh1G0fEbIaCCnQEX1fQUzDH1rvEPpQP9SWZsXZ464Hk/XnBXCn8e4O9oJY37UlBGv2CW0xaZYO3lqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
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

On Thu, Oct 30, 2025 at 11:30:27PM +0100, Michal Wajdeczko wrote:
> Some driver components, like eudebug or ccs-mode, can't be used
> when VFs are enabled.  Add functions to allow those components
> to block the PF from enabling VFs for the requested duration.
> 
> Introduce trivial read-write access counter based on the atomic_t
> to allow usages in the scenarios where we can't follow the strict
> owner semantics as required by the rw_semaphore.
> 
> Before enabling VFs, the PF will try to acquire (arm) the write
> access to the dedicated guard.  This will fail if there are some
> read accesses already acquired by the other components.
> 
> For testing purposes, add debugfs file which will call these new
> functions from the open/close hooks.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
> v1: https://patchwork.freedesktop.org/series/156687/#rev1
> v2: use less confusing names (Matthew/Christoph)
>     allow many components to lockdown the PF (Christoph)
> ---
> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guard.h            | 90 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.c        | 21 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c         | 97 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 30 ++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  4 +
>  7 files changed, 251 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guard.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guard.h b/drivers/gpu/drm/xe/xe_guard.h
> new file mode 100644
> index 000000000000..8abb9e70093c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guard.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUARD_H_
> +#define _XE_GUARD_H_
> +
> +#include <linux/atomic.h>
> +
> +/**
> + * struct xe_guard - Simple read-write guard to protect a feature.
> + *
> + * Provides one-writer/many-readers logic that can be used to guarantee
> + * exclusive enabling of the otherwise incompatible features, where we
> + * can't follow the strict owner semantics required by the &rw_semaphore.
> + *
> + * NOTE! It shouldn't be used to protect a data, use &rw_semaphore instead.
> + */
> +struct xe_guard {
> +	/**
> +	 * @exclusive_cnt: implements simple exclusiveness logic:
> +	 *                 if < 0 then owned by the writer,
> +	 *                 if > 0 then owned by the reader(s).
> +	 */
> +	atomic_t exclusive_cnt;
> +

I think if you can, avoid an atomic rather use a spin lock.

> +	/** @name: the name of the guard (useful for debug) */
> +	const char *name;
> +
> +	/** @owner: the info about the last owner of the guard (for debug) */
> +	void *owner;
> +};
> +
> +/**
> + * xe_guard_init() - Initialize the guard.
> + * @guard: the &xe_guard to init
> + * @name: name of the guard
> + */
> +static inline void xe_guard_init(struct xe_guard *guard, const char *name)
> +{
> +	guard->name = name;
> +}
> +
> +/**
> + * xe_guard_arm() - Arm the guard for write/read-only access.
> + * @guard: the &xe_guard to arm
> + * @write: requested access mode
> + * @owner: optional owner info (for debug only)
> + *
> + * Only single write-only access will be granted.
> + * Must call the xe_guard_disarm() to release.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static inline int xe_guard_arm(struct xe_guard *guard, bool write, void *owner)
> +{
> +	bool done;
> +

So something like this:

	guard(spin_lock);

	if (write) {
		if (guard->owner || guard->sharded)
			return -EBUSY

		guard->owner = owner;
	} else {
		if (guard->owner)
			return -EBUSY

		++guard->sharded;
	}

	return 0;

Also maybe s/write/exclusive ?

> +	if (write)
> +		done = atomic_dec_unless_positive(&guard->exclusive_cnt);
> +	else
> +		done = atomic_inc_unless_negative(&guard->exclusive_cnt);
> +
> +	if (!done)
> +		return -EBUSY;
> +
> +	if (write && atomic_add_unless(&guard->exclusive_cnt, 1, -1))
> +		return -EPERM;
> +
> +	guard->owner = owner;
> +	return 0;
> +}
> +
> +/**
> + * xe_guard_disarm() - Disarm the guard.
> + * @guard: the &xe_guard to disarm
> + * @write: access mode
> + *
> + * Return: true if successfully disarmed or false in case of mismatch.
> + */
> +static inline bool xe_guard_disarm(struct xe_guard *guard, bool write)
> +{

Then here, something like this:

	guard(spin_lock);

	if (write) {
		xe_assert(xe, guard->owner && !guard->shared);
		guard->owner = NULL;
	} else {
		xe_assert(xe, !guard->owner && guard->shared);
		--guard->shared;
	}

Matt

> +	if (write)
> +		return atomic_cmpxchg(&guard->exclusive_cnt, -1, 0) == -1;
> +	else
> +		return atomic_dec_if_positive(&guard->exclusive_cnt) >= 0;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 735f51effc7a..2fd4fe6fe83a 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -105,6 +105,20 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
>  	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
>  }
>  
> +static int pf_prepare_vfs_enabling(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	/* check guard to make sure we are not locked-down by other components */
> +	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
> +}
> +
> +static void pf_finish_vfs_enabling(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
> +}
> +
>  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -120,6 +134,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err)
>  		goto out;
>  
> +	err = pf_prepare_vfs_enabling(xe);
> +	if (err)
> +		goto out;
> +
>  	/*
>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -157,6 +175,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  failed:
>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
> +	pf_finish_vfs_enabling(xe);
>  out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -186,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  	/* not needed anymore - see pf_enable_vfs() */
>  	xe_pm_runtime_put(xe);
>  
> +	pf_finish_vfs_enabling(xe);
> +
>  	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d9..1a10ae846b06 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -101,6 +101,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_guard_init(&xe->sriov.pf.guard_vfs_enabling, "vfs_enabling");
> +
>  	xe_sriov_pf_service_init(xe);
>  
>  	return 0;
> @@ -157,6 +159,101 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_arm_guard() - Arm the guard for read/write access.
> + * @xe: the PF &xe_device
> + * @guard: the &xe_guard to arm
> + * @write: requested access mode
> + * @who: the address of the new owner, or NULL if it's a caller
> + *
> + * This function can only be called on PF.
> + *
> + * It is a simple wrapper for xe_guard_arm() with additional debug
> + * messages.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_arm_guard(struct xe_device *xe, struct xe_guard *guard,
> +			  bool write, void *who)
> +{
> +	void *new_owner = who ?: __builtin_return_address(0);
> +	int err;
> +
> +	err = xe_guard_arm(guard, write, new_owner);
> +	if (err) {
> +		xe_sriov_dbg(xe, "%s/%s (%pe) %ps, last owner %ps\n",
> +			     guard->name ?: "?", str_write_read(write),
> +			     ERR_PTR(err), new_owner, guard->owner);
> +		return err;
> +	}
> +
> +	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
> +			     guard->name ?: "?", str_write_read(write), new_owner);
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_disarm_guard() - Disarm the guard.
> + * @xe: the PF &xe_device
> + * @guard: the &xe_guard to disarm
> + * @write: requested access mode
> + * @who: the address of the indirect owner, or NULL if it's a caller
> + *
> + * This function can only be called on PF.
> + *
> + * It is a simple wrapper for xe_guard_disarm() with additional debug
> + * messages and xe_assert() to easily catch any illegal calls.
> + */
> +void xe_sriov_pf_disarm_guard(struct xe_device *xe, struct xe_guard *guard,
> +			      bool write, void *who)
> +{
> +	bool disarmed;
> +
> +	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
> +			     guard->name ?: "?", str_write_read(write),
> +			     who ?: __builtin_return_address(0));
> +
> +	disarmed = xe_guard_disarm(guard, write);
> +	xe_assert_msg(xe, disarmed, "%s/%s not armed? last owner %ps",
> +		      guard->name ?: "?", str_write_read(write), guard->owner);
> +}
> +
> +/**
> + * xe_sriov_pf_lockdown() - Lockdown the PF to prevent VFs enabling.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + *
> + * Once the PF is locked down, it will not enable VFs.
> + * If VFs are already enabled, the -EBUSY will be returned.
> + * To allow the PF enable VFs again call xe_sriov_pf_end_lockdown().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_lockdown(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	/* lockdown the VFs enabling by taking read-only guard access */
> +	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false,
> +				     __builtin_return_address(0));
> +}
> +
> +/**
> + * xe_sriov_pf_end_lockdown() - Allow the PF to enable VFs again.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + * See xe_sriov_pf_lockdown() for details.
> + */
> +void xe_sriov_pf_end_lockdown(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false,
> +				 __builtin_return_address(0));
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index cba3fde9581f..b5bee3a549c1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
>  int xe_sriov_pf_init_late(struct xe_device *xe);
>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
> +int xe_sriov_pf_lockdown(struct xe_device *xe);
> +void xe_sriov_pf_end_lockdown(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>  static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>  static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
> +int xe_sriov_pf_lockdown(struct xe_device *xe) { return 0; }
> +void xe_sriov_pf_end_lockdown(struct xe_device *xe) { }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index a81aa05c5532..1c5d19ce7b63 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -98,10 +98,40 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
>  
>  DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
>  
> +static int lockdown_vfs_enabling_open(struct inode *inode, struct file *file)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct xe_device *xe = extract_xe(dent);
> +	ssize_t ret;
> +
> +	ret = xe_sriov_pf_lockdown(xe);
> +	if (ret < 0)
> +		return ret;
> +
> +	file->private_data = xe;
> +	return nonseekable_open(inode, file);
> +}
> +
> +static int lockdown_vfs_enabling_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_device *xe = file->private_data;
> +
> +	xe_sriov_pf_end_lockdown(xe);
> +	return 0;
> +}
> +
> +static const struct file_operations lockdown_vfs_enabling_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= lockdown_vfs_enabling_open,
> +	.release	= lockdown_vfs_enabling_release,
> +};
> +
>  static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
>  {
>  	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
>  			    &restore_auto_provisioning_fops);
> +	debugfs_create_file("lockdown_vfs_enabling", 0400, dent, xe,
> +			    &lockdown_vfs_enabling_fops);
>  }
>  
>  static int simple_show(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> index 4a4340fb633a..a348fd31a91f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -54,4 +54,9 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>  	return &xe->sriov.pf.master_lock;
>  }
>  
> +int xe_sriov_pf_arm_guard(struct xe_device *xe, struct xe_guard *guard,
> +			  bool write, void *who);
> +void xe_sriov_pf_disarm_guard(struct xe_device *xe, struct xe_guard *guard,
> +			      bool write, void *who);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index c753cd59aed2..a2c1b7daeec0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_guard.h"
>  #include "xe_sriov_pf_provision_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
> @@ -33,6 +34,9 @@ struct xe_device_pf {
>  	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
>  	u16 driver_max_vfs;
>  
> +	/** @guard_vfs_enabling: guards VFs enabling */
> +	struct xe_guard guard_vfs_enabling;
> +
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
>  
> -- 
> 2.47.1
> 
