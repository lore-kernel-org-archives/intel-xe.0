Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F6E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F12310EABD;
	Fri,  6 Sep 2024 23:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do1KJEeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA4E10EABB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725666202; x=1757202202;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7eio8DxCybIr0/AZ0C9B5cceMcEhuyU0KZmnC2dNgOI=;
 b=Do1KJEeWUpV0yIsJRvjhkLGRm1koKXM++Zqr5JBRhMsYnIY7TGFBLufh
 N2wvEMCf6s+tzncyXzSuX0zgyM0rgBbJG0qitwQIwbAIlT11XZwNbFluG
 Z/XDTVvUt+dnWvDwj+E/RGSqB7QB5vg77h9KirktlLxwJVr5G3e3jJxgf
 qZqiAOF+QpJbPmW5ZLhDafEw4nYguYFHoXc88/IXf/rB5lF6/TN0Uj1qW
 IUR48x/s8nFsS19QnuG7BjJj+vekmrgTIx31/cHWqfETyTjTbE5ixhXSJ
 AMkhRFFnjJjkhzYHLDn4GjWHE9zDjh/aPfeqMnNm0ORt7VvY5So24VFMK Q==;
X-CSE-ConnectionGUID: X7OuRZFoQ/Sho7ajzRJn/Q==
X-CSE-MsgGUID: la2QIes5QLOgOZsfCxysow==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24602389"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24602389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:43:22 -0700
X-CSE-ConnectionGUID: ocZhda5WRa6yUk02SCvWZQ==
X-CSE-MsgGUID: +us2aRyXTiqGVrerY8RdSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="66077756"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:43:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:43:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:43:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJoAY1Z03mKmL1OwajfvYHNWgVbrPjOMmEMETZ7UYVFkDqwRJlLWKfOChW+T2vRhZrcZ40KNI0czgxbldHIa8FAXqNNNee59fZUgM9wpiveWTFBZoPBu1PkqwSLSiY/klBNOruKUXNbUsxlxRc+e8qe3vf82FzAJ5DgHmHVNTtvLEa2qEtR8cMg9bIMiFnr+5DZvKIoIWSpHsAqbeqOhi9a9iPh0K2NadR3fkUb+bT/d8iiTf4JMB0wX7/ZXXMAYwAq7yIeLyw7MWvksjaCVquE/dOAtuFzwRy3SPOkh0ADepHTQFUasD7X1EdrvTMvJt8dfhA2PAvdLBUlCQWH++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0tCG5XgfBll3bATStRMJEHx5Q2B1mQZVurw3+cchTw=;
 b=X7Iuhvwk8TdNIZqcpuEyFIZfYRU+MErCdSsl1t2Kvr+xTgOBqW4PaT1Ni6rT7u9anYUbSL6atDiDZ0ycvbdqFYd0VzHxIeuWGT2gUdUX9NUk+tQYhm7UxgAOEWFbghPrylIA8ig+elc4zpXt2sbXvh09BnPV3lJmrnS0Yr/6qLWIoeWFW9LptR10gVBYSk4WRpt6UBDFifwjAbRoVugAhfUxtf74xQUfBjRLgiJ/gJ5/J6dNnst8l+7ABo+SAg0cwU7mNbFwH7bJ9EaEI0AlCkKPxM9ZI+bRXXIH4n4Ks83cKSJ0BDOPxI8x0EDUuyUH/AwrglnNUixY6xa8rYDgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 23:43:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:43:18 +0000
Date: Fri, 6 Sep 2024 16:43:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH 3/9] drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <20240906234315.GY5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e291748-8a3a-4c85-c438-08dccecdaf3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CYXzt7bJDCISgre68v47do/+MaQ3D0JTHwHm0T5DuHEZW5fhmyLYMCnAGt+E?=
 =?us-ascii?Q?C7AFswxYpDNYIKlUHveAqwm6zo6l+fn3q8rinOwXswqbyLKSdaZH1J/LaKTX?=
 =?us-ascii?Q?PLxrJRIR3TzjfyCvyav+TvkLVQ0o0HNxTHIGqThOgof6uOV720fcPp/glkBS?=
 =?us-ascii?Q?Ycxc6tkxDXrKvaQ+yFmKglZRxCDODxspET0Nmcbqk6Qs6ZkDEgfEt9QvprbA?=
 =?us-ascii?Q?P6ZzOe2Jyfmm/GU4gDoQZ1BxZ7NanngQzFVqtxWDkO8hSLnr4e0jsJQQacOD?=
 =?us-ascii?Q?4DsBcOKVE5yJWfGkh9iNVThTuwBaEyqWBo0yU5b4CdqxkSJveNkOWkdVlWHs?=
 =?us-ascii?Q?gwWaqeW9X5CFtB3cQ6qWDYApVMtbnr1ofaJLQuHmUjZN7EZcmckAXGy3aLDS?=
 =?us-ascii?Q?rIZLanw2e8muPfVa3QPXxmaI+8dw5bqe+ScokUbxuWXHlQMdo3FxZ1gdv8Xq?=
 =?us-ascii?Q?CyYRFjwuzTK2O6nnALYUD8UANFZ7JhfsFlzizfNWi18oVLKLVWcVI/w47kWM?=
 =?us-ascii?Q?oM/3QvN8QDJAGj0hySb2HMeUmCzcV13H1kL/nrwk8VmtnhrTHevDPOxsTW3A?=
 =?us-ascii?Q?H1iNiGaev2cgaus7em10E/i71sb5fSuuQli/9fcv1O9KzvLBZuwp3zRAAtvM?=
 =?us-ascii?Q?ouypPIufuJWiStbZIY542z4Ow/6aQQQe9tKfbnL0UowTjnwxRxYcIsijD/uQ?=
 =?us-ascii?Q?e2KWAUBiuUcKUdjPUYMiDA5wsTOATRsiAzNljj6vEkeML7eCfDLvfXPwXAjb?=
 =?us-ascii?Q?lbgcVKo3XzsqJvvF094gq2pz2GResQkMs0ACZ20aTbxaqeglwBi/+GzYOwfL?=
 =?us-ascii?Q?g2Yv9pWGqobGHO+0EK/PPYepf8ccl/egBaydWTBbgFfILl6F/wweemzyJWiq?=
 =?us-ascii?Q?QsxME955s0vJtto5/xdfJPl89oJarJrgADJ/ZMEX2NubiLQkIQmNxTRjfVZ2?=
 =?us-ascii?Q?7RfRmGCGc29Mt0dhv6peaG9RUqjmGZiOeSHW2bA9MY7Mhgmsjp9tdrls3YOa?=
 =?us-ascii?Q?fSgu5GTmGj+opBAJnDHo4EjsjwKQ9oY2ga9luPYBEy6RiputGeKDaC8TqGb2?=
 =?us-ascii?Q?Zs8V0pnMUquC8vihmllwTdoTcZcSqS89J23uqLhUqK1NvfszqJgfzMdgdUWD?=
 =?us-ascii?Q?ohycXIsyzbtTE3YVck+KBt7sN4WTf/nK1kYicuCgdYkMmKiXuZNMcvHyWdnu?=
 =?us-ascii?Q?jso6PsEYEk4qc6zY3eY/k3+jTvbW8leTSUVlH3KvLRg/vq9DB685dLi0tIOA?=
 =?us-ascii?Q?hxbkp1FV0dGpm3g+DFeq3GizaG3of/toHHGskZEMl+ZG40ncI5DZKI/6p82A?=
 =?us-ascii?Q?26zBIRdhr6dcZyWav1KQPTvNlqJH61Q5WupX4lmCU1KD8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lSp9ewzd6oqXvTYg/wBsE9yYdV1fblJzkGpIJ9AaKb5LtMyzR9aRsU/QS/ve?=
 =?us-ascii?Q?j0lLl9W5aRd8iiDtadd3H+Y513KqrhLWOZi2UR72EX1m+kXdya1zPI1oM7sq?=
 =?us-ascii?Q?/L0abkf1EU3SM8BPyQ9bMgWkXZLdSpfcpwoZbJUftWIZL87DKkBklYV0Gqqj?=
 =?us-ascii?Q?8i4oJh40G8poFKVeop/I962mkp2icXadRXZGXWus8fZoctxv+2G6WN2yxNvw?=
 =?us-ascii?Q?ybdQ8IvXtaXkXsHNLG2Ww+GNDm2iVHnM8FmdImhnTCUZIVxpBpiA9cbRl1WC?=
 =?us-ascii?Q?xp0l6vRCmOlW9yq2TaoEbqI0ubdeWGa7AxzKXBy1aozV3cpF3tUVGmVBWd2p?=
 =?us-ascii?Q?vsKHu13CIhBLgPlBV/7IISLPUh/Wq89uf9Tl0fond6wfSFZtmR7cNoTn59KF?=
 =?us-ascii?Q?3efvqQWzPxhBDOvPmPRm5YoGpXo0rEa7FezBdZtXzbSFuWCvsizV7ocaWNJ5?=
 =?us-ascii?Q?GMtRfKtmw+GSHNz6WQvzg0duzTq2k+rmoXilzaIG5R5SU8cCpy0BYs5YEfV6?=
 =?us-ascii?Q?3wP4Sq95VKsDWXhJPFh2wrzSZ7R3bz6VKyTb5oT9ToydjKbvvHptUsQv3lV2?=
 =?us-ascii?Q?g8hXPqGgBCxVFxx88iKsZ4DBPVPxnF4ZxeM3UzGZ6wp0FZIFufc7Le4fvZ12?=
 =?us-ascii?Q?eBxYvCf9QAqfGYlRh3LZlFLfneQlhZrxIQDg7A25GKlQCud0B6E69B6wRiyb?=
 =?us-ascii?Q?5jFQ5qMdlLm87EktgwDh3T2tfmx7GskVS/07lZQjqJ/vZfFlR1oowIaOFV/Z?=
 =?us-ascii?Q?iGOWRvNQOSKEoCTjx5lpeRFad9cHXJY8Jgz7xzySueTTBfJc9fCyOgLBUxaO?=
 =?us-ascii?Q?TIspK0Sbm12eK3lkSi+XYluqb+iIZNM/YVThXc4pUDQgVzUDzavzK+jL4EgB?=
 =?us-ascii?Q?KU6UfxzW41PteHQtqeGLyIIhuDbLDRJE/RHhTbqF5xD99qkc7ZBJ5u/zGy7+?=
 =?us-ascii?Q?jCIuibI3BQq9FpaQn7k/X5YserYHntZHfX67NHPAyhIdlzCfqt0l134WRm0L?=
 =?us-ascii?Q?qT9n316EhcEoEicdCfN0RVIO9CCX5qADoRVFub+dAU/chneYaJVQgpzwbRqu?=
 =?us-ascii?Q?uG9r4fpD/xpiuoADcerURPXkww+oX/HFocjyx8N5R8Vt4Ti17KjQVMoMTk9c?=
 =?us-ascii?Q?GcSDtkw0zxjahWWgoSsCc8Djys4ljJ40rYeHQRxri7E4B3luA91MfFvLbHfy?=
 =?us-ascii?Q?RwV2ciM5Uon0e12tFXWWlU6pPPNbmE4Hn4t+PkrzwuVqDghFAFyx7HH6TcZi?=
 =?us-ascii?Q?D4+zBmbQ0m3QCmu+pCbWq2MsJZdkEb3+LxR4mrrGtHo1nCOc9y4Z+1sT7CzX?=
 =?us-ascii?Q?6tSlO/Ua3brEVlVUZDkZpkrR6dBurNKrSE+f9fQ3I+sP3Apq+IL07vd+SwFu?=
 =?us-ascii?Q?zon4GGlNRB0SExm5BGJ0fUPFuQJgt46/xJt2h7PLMDeRdkLYZoQhNTZH75D9?=
 =?us-ascii?Q?VqyP4gkRCwjDXAgOdpAtRj0R6QXZMds5Ai45W69a6UIs+IJDyYMtbAycyQ5q?=
 =?us-ascii?Q?LCvLJHG1lTgx1HPnCIa5T5zJBu14/Jevyrs5pcNbH8xYVm2/vjKb2lfh4SDS?=
 =?us-ascii?Q?25TlBmEwdoWLrgeI+uE6wozm34yex7833JFrYjktQHpP0xs13ByoaXgUxSRS?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e291748-8a3a-4c85-c438-08dccecdaf3d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:43:18.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2faoH/oxprVylkihTUz/E5t2kC46dgtyUg1fpRE2KTt1RY82gPE1P/rmtjTnXdbywKa6DszZyVQA8qX/S8OYDa1a/w0t1Y8PjCE4X6aRIzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Fri, Sep 06, 2024 at 02:51:47PM -0700, Matt Atwood wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> On Xe3, the register used to indicate which L3 banks are enabled on
> the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
> represents one bank enabled in each node.
> Extend the existing topology code for Xe3 to read this register and
> generate the correct L3 bank mask, which can be read by user space
> throug the topology query.
> 
> Bspec: 72573, 73439
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 11 ++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..8ed855b31e95 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -218,6 +218,9 @@
>  
>  #define MIRROR_FUSE1				XE_REG(0x911c)
>  
> +#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> +#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> +
>  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
>  #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 0662f71c6ede..56571380a2b5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -129,7 +129,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
>  
> -	if (GRAPHICS_VER(xe) >= 20) {
> +	if (GRAPHICS_VER(xe) >= 30) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);

This is a 16-bit mask...

> +		u32 mirror_l3bank_enable = xe_mmio_read32(gt, MIRROR_L3BANK_ENABLE);
> +		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);

...and this is a 32-bit mask...

> +
> +		bitmap_from_arr32(per_node, &bank_val, 32);
> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> +					 meml3_en);

...so when we combine them the resulting mask could potentially be up to
16 * 32 = 512 bits.  Even if Xe3 platforms don't really have so many
banks to use all of those bits, we could still read such values from the
registers (e.g., if a PCI link glitch or other temporary issue causes
the fuse registers to read out as 0xFFFFFFFF).  Since
XE_MAX_L3_BANK_MASK_BITS is currently just 64, we can potentially run
past the bounds of the allocated memory for the bitmask and probably
cause a kernel panic.  So I think we need to extend that define to 512
bits to cover all possible values, even if we don't expect to ever see
them on a properly functioning system.


Matt

> +	} else if (GRAPHICS_VER(xe) >= 20) {
>  		xe_l3_bank_mask_t per_node = {};
>  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
>  		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
