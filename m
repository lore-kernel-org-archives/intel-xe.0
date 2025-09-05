Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC1CA1002
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 03:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0385310EB08;
	Fri,  5 Sep 2025 03:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P84r6IY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B8310EB08
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 03:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757042886; x=1788578886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tjQRBT3WrlJ2Hb1DSRQVc9xjQ14uhyGhAwjO+pzyh9o=;
 b=P84r6IY01XoBkx4wR1P6WqtrjQR46e3ScPyrAKic+m0EC2pesUY+h+rc
 L+mTgdLq+YkPvlh483zBowWF62TcATgdCpNm2qppnYHeAgcpI5ml3nJaE
 KFHafS1zdCB+MglgmC6faZbakcosB5+90JCN7dN/pqLdjkpRa/FJE4IAp
 EZHLTGpwR9zUtizF6c0hRSwL6eZYZkkSQksHiUSplXI7IhQRTnYhQJ28I
 rGpklP7DJRCn+bWqhKZsvYM8HV2aykb3RofXUv1fYXGKJzHiLp3pLLtez
 WWO7gFGrEZ3YdNinU4cGqu7bnk/i9YMybPbn8LpFCGE2rp0A++nvoFwf4 A==;
X-CSE-ConnectionGUID: J2bOrqzbQxKqxNRF6A2tNQ==
X-CSE-MsgGUID: mOEux2K9RV++YYbAK6GHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84825002"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="84825002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 20:28:05 -0700
X-CSE-ConnectionGUID: p5mlId/9TmqIKE9XxcZrGQ==
X-CSE-MsgGUID: RWYf1etyTCWy7JOefWAacQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="176409997"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 20:28:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 20:28:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 20:28:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 20:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsNiKv3TFRmCgWAlCEnhtQpe2iOx5tbumZ42h/TGYBKyaltNMTyxw1TARd4VIS+ilQyUm6Uv6D9PuS+XeSeI2vK8t8RbSdyc4+lcqYvY0xpDij1zqwaid8dm26Tb4Wr07fcRg7Szz65fT4OBX1/8j228tEuAO3hYwSL9moPw28/3w1aCVO9Do4yQfSo2twh3z9f9xFsPj31jnolvfO2QMM+KZqPPtHuD2Jck5VqPQE7UqoKv3+pQEV7hHNvP0TLXX93Ph3aoFPdUPmZzHn+Vy3rCwtDt+293Bbt9c3CKOr0YKK+UkBJSyiwN7JXGnfyzxgSRMahFfTTg/S9KpRRgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgfuJYA0JcJoCu7ZaoOjtV95qkKsNN46s3KeMZcU4lw=;
 b=siI4Dbr12GffSKHboS+sht7/fEee03GC2lwjomb0TShgf+VxOveYP/66bUYHrra6GDoOWArnbUANUadXBtsnxTDI7KuVZEBbN9A1ag3GCqa2NVCOOFONjSDwNSP8sryUL8vhi2JBWTbNd8C429Cz2xOz1hyjlEtfoO+59gMOzhzGdUrn0xtrYqwrG3cAJAJLvbTZoluE4lc2CpoYCBub6ZL24xK4MX99SJCEziAwpncNxsctz0ioSNN9nthAD8ugoqadnyleX1mqwDLrMEtKaKiRvZVz7UQl+O6Xkgn1sCuJofnhtra6cQNq1+QWkc4RTTs6NUkFKUKBO+IOdH6zIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 03:28:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 03:28:02 +0000
Date: Thu, 4 Sep 2025 20:27:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
Message-ID: <aLpYv8usHFC/dE0N@lstrano-desk.jf.intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
 <20250904192918.7346-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904192918.7346-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: d445cd2e-6436-4d0d-9dae-08ddec2c3818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hihIRS9Ncr3gTkehNydCm9aHbZjTK+4diLIYy6g+/qyysMmFrhFI4dJTVhLQ?=
 =?us-ascii?Q?r/l2rUX7vzBbtquK/pgbmbbRL59rLsKF+kXdnF5/XPtZt4/jkyW7xS7AKNHj?=
 =?us-ascii?Q?h/EfAR71GrkrebTi19Y+kIif2ugAyAWGCa5O1Y/NZqPJtoxEN3xJWzq5uc1j?=
 =?us-ascii?Q?Z0ogtoOAbf9ujzrIOjvUJbCr68bVaN+OhBeHRrgRaJBolpWoSvK3qyIYeuZZ?=
 =?us-ascii?Q?5TeHZ6yOLgJWcJqY/O3jJ79AjYJB98tvxu0dYhMHJYYrgxcc4div4nhlKJzY?=
 =?us-ascii?Q?U8MsbOq9om6h1WDvitG1K72DCbtHRNesdC7vpjChYMY+xr1VbAzamIGo5jaH?=
 =?us-ascii?Q?V8+6Al4APwF3jYQi4bkxSy8XiCMYQ9OJid3gsGlvh5hDQk5aB0SDXFdv/CxQ?=
 =?us-ascii?Q?5v84Twl69kZA8iFG6madiozWkLgxwK9h5CbM6aGyqjmevy0q1z/RS7Y3v5vH?=
 =?us-ascii?Q?8roF0eVSrsiLmhB2St8YiV+YNOeNuSZ/jeQh7zoBdxlEBGjx1Ncbq4SpzPfx?=
 =?us-ascii?Q?F+Wv7ZZ3hytLVE3RxVSBWjFU5ILfxGOT9QjpDKgTdFaklN8IG5FHHweH14mp?=
 =?us-ascii?Q?CzZ753SRpMX0kfTEaC2NwEr0DXEXmlWaFu1A3t9DkucSEpp4ERVONOn+Hkot?=
 =?us-ascii?Q?2Haw4WMFyxSMHMOC0ZziAusAodfA6oASP2qyw6dGGSIxClV2RWhLwIOiwnsl?=
 =?us-ascii?Q?7hJxhMMr1Ubk9gkoZ8eCGHlmffPyXzWgxTfB6qtdWffDkn2qR7BTKEwT0xWD?=
 =?us-ascii?Q?f1qfrnq/kqaLhlBlAtsK1ljLj2JujREuZ5l143uUsDfpRX3rZG4A4y3FbhKR?=
 =?us-ascii?Q?jCNQxp1Ww0CcZ01nJQMJo7RVmPCrSHa+SB4PdgQKaPFHDbVLu/c9YK6pu1+U?=
 =?us-ascii?Q?ETIbYFWWTr3pL2cO+4CjMAoSLb8SYAE+r1HXg7ziKEM0VoXieuC3cEv/IriZ?=
 =?us-ascii?Q?A50Vxl+nloBEdATUfugfJYPV/5eEk/n9YDl4DZ0YlzkimIh82Ub8VNXK8Aop?=
 =?us-ascii?Q?US+k2kMZBHHYn1WkWwI+DrsbNsePMF8BY+olBZI5RTI+8X2/0z0/LQ4/xM1D?=
 =?us-ascii?Q?lO+ZkBdl/mO894EqhHQ9oDngXl3jeXHCAokCIIC2YvZHX7B2K3XM5oFNv4mp?=
 =?us-ascii?Q?YfWu5zKZUMjI62LAbCV3BCDkdNYz5PtiSYLzMQpelWt/HcOKhUQko0SnpKy4?=
 =?us-ascii?Q?m+6zSescou9+vXoMn+A5SNUVWAofhootEspe2HAnJa5NOdWnLQjoGlh5Uwxk?=
 =?us-ascii?Q?oQfKOGWgDM7JLrm4OYDfRYNJJApkfXKpF42e0CgA6IZQ2SQuo0iF6atf4TGy?=
 =?us-ascii?Q?R3P/aDYUtSyhIpezFH0lB3Yfw45TGiYyKH1VdK8I4QL+mZnRVQp4YS5lf/y9?=
 =?us-ascii?Q?LZR8kjvnPdrXXeNWsh/XrMrN9L4XRJebUCqqoQ/dxQbv78W3s9qTlP0jQugJ?=
 =?us-ascii?Q?B8ZXM+T0H/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eYWnOda2kIwSYDVI/pKIWyuAFi3OCRs61sGHfwwk+EVsgHkG3x1A9igJFMWU?=
 =?us-ascii?Q?TlZprfj7JyRtjBlBaPLdsB+sVBU3cSzRlSKuMD1p4O0Yr/oqOAf3GMXHORSL?=
 =?us-ascii?Q?W+GhM31n1VeojIXIrqdh2lRaP8XaTazEuosUijgNu1p2gcmDSxI3F2jEvQme?=
 =?us-ascii?Q?FeUcF0xNd7yXRKA1UuFbsSzexgkFNfEbsl8Lxwng+PROZX0rOWfFHjliHL8Z?=
 =?us-ascii?Q?hE0PipmnOQGf9wffB+9TU6n8yAtaLz3XCKkP5sdcHiIQecC8mDQ/e3g3jrcA?=
 =?us-ascii?Q?Flfd60nwC3AW71oOzy0hdrjC8EPm9b2A3b0NTV92g/TaSQ4Dgh7A8RhnmAfl?=
 =?us-ascii?Q?TpyNS1KM2JuA0+qAV9Vgw5EwlIzfYEoxxzWGYO/QfdZYkkZfCE2WKDcsrPS+?=
 =?us-ascii?Q?ddBGEoq094Eb1PX35KcL/k15nHhpnfXAfFud4cw+otBal65WZVhrSFnplCIM?=
 =?us-ascii?Q?lqIlgXuSN4k8VtwjPw37+N0Ry0HNTsUvqkiiZb44mykHR/EdUbiJH1qn2xuD?=
 =?us-ascii?Q?TJLas0e/qiaSqXcKmayyEkYxtRhJ99qN7ratlzVeWahMj5vqZ4fpDxPEx43A?=
 =?us-ascii?Q?e3ccOoDSZlPt89k2WuFaYgzstZ2xe5K5vEDVYoTc0HFOTb3PcCE9Mi0tlI69?=
 =?us-ascii?Q?zL+500YqEbWTzlPHeTo2WVrh1wljrXmhnJPqodUDxoRRNtNni+EQv3T/dZO0?=
 =?us-ascii?Q?K4SSqOIYlPDT3X0RyifxaKIBYYlpfr4+OBjovRc0mDQd1IjkXhVMFLlvam52?=
 =?us-ascii?Q?oVa61Drcn3GccEQFnbUrHqs7TS1cI3uisChPy8bS1nm3CFQuDTdZDhFDyiUN?=
 =?us-ascii?Q?GHT+U3Erl4vWny1Zlg16dEbe4SE/WXuwmoQc4IFSVkDuT8JL1BEnoFpv39ER?=
 =?us-ascii?Q?chjj29SFKIOH6ZiZey4nlG0BymNY903DsJtBZWkeP07SaLr7geSoqwI9GIqw?=
 =?us-ascii?Q?531ygMeQ0o9v0yPOQb7jTRX3z5APgVn5s7ixUi8i4J4pEtQ/J4+zGnIlhcBK?=
 =?us-ascii?Q?ppp/s4qYRA0Dhwceqt4AWKxJDKkDaE7OGzlqSaLNmnATmhDlaUWEt8ePvO0V?=
 =?us-ascii?Q?MmwNRJC0bkGA0re8L1N9vhs45Jd4ovx05hygv/hWK9sEUKxy+SUEUzFJZu/m?=
 =?us-ascii?Q?sdg84hbiYLz1UPvp/BMqptPQSItDfwJX8sB+trTp8eC1VbtUWoXT0QjOoXQu?=
 =?us-ascii?Q?ZKWlB8MhYoSfy+m88aW00akFEOnXlDOShv42DdO9G6N/YiD8COZUQ6lX1fg8?=
 =?us-ascii?Q?YQzwrlI6TfpiTBp8y5nuby1es4Dg2TOiiJHB2hMO3mKXiYI1QPvZ69KBRwjT?=
 =?us-ascii?Q?bV12ATeJg/4M6oqLAJsx9RnkVMrt0K4eandtQi0jpI8HC4Xz1/hW0/Z6bf0+?=
 =?us-ascii?Q?Ov2u66lz1KjUJoxWvYZ7jXz3a1F+yvIVRhAxOmf3fvJWLtiHScVFlfzu1Pb9?=
 =?us-ascii?Q?IKNYhpOZwG/LCs3VdJm+mh2a8lLwb49AsYqKp8yJmDBBPO36MeGPnqGf3roj?=
 =?us-ascii?Q?ogYXS60VF7BXq8B5Y49vqDqc8L/8X/0tfJZjbpg0zq7whPUoMr8CHwcQ8Vmu?=
 =?us-ascii?Q?tIlmI8rokJKj2aejqVzcW7GRRRhgC5G3+wrHHWUGvXRp9Z3LOwhK71z3TZoT?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d445cd2e-6436-4d0d-9dae-08ddec2c3818
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 03:28:02.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rp9DHnGu77qgNOO+n6LCxQ9BfAUUTOlN/3HueWJnmmIryi22tFVgB57HrnT58UbT08ZGNrK9bFwD7d3JpFDTSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

On Thu, Sep 04, 2025 at 09:29:15PM +0200, Michal Wajdeczko wrote:
> We only use this macro once and we can open-code it to explicitly
> show relevant conditions and avoid duplications.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 6 +++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 6 ------
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 19786f64a7da..b01bb3660fb1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -15,6 +15,7 @@
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_sriov_printk.h"
> +#include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_sriov_vf_ccs_types.h"
>  
> @@ -263,7 +264,10 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	u32 flags;
>  	int err;
>  
> -	if (!IS_VF_CCS_INIT_NEEDED(xe))
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
> +
> +	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 93435a6f4cb6..0df6b4130e7c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -15,12 +15,6 @@
>  		___xe->sriov.vf.ccs.initialized; \
>  		})
>  
> -#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> -		struct xe_device *___xe = (xe); \
> -		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> -		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> -		})
> -
>  enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_READ_CTX,
>  	XE_SRIOV_VF_CCS_WRITE_CTX,
> -- 
> 2.47.1
> 
