Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5371C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 15:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86D010EAE1;
	Fri,  6 Jun 2025 15:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrYIjZ7H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB5210EAE1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224609; x=1780760609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zcx39LFLtfPQ/anHDCDBHfOPpHC3XgvoIbFHVFSEv40=;
 b=HrYIjZ7HOm+nW32p2DE9Cw0d+zfHZZeS4Yz20oUpSIRnmCkn4N3q1iTP
 WmJLAd9dwS2kVy4yMVfLv03N4i81dlkK2Vv4Bs1fYUmXf5JGStO8ui4zD
 ZqeJGmjVHAkytGnTqCb7W6Koe7Wk3d/yu0n9nAeM9+9x1k2omltnNAmqt
 wDSmtJf6CHgqXrMYlwL4FJZxLcd5a9kjrc26hfaV6DPuvmW1wnv5+lp9T
 ahd0hfkDajNLvl+DVTB5D6xEPA9GZOwWfJPpQpX7Uzg9RO3o9YOu0WXUz
 /XM70JWZ3U3p6Kz36Sp5f56/LBb4GT6Ue9dZOkCckNWGLBcaYEktxRp28 g==;
X-CSE-ConnectionGUID: dlfoFUmrSiCjdvPnE0xFUQ==
X-CSE-MsgGUID: VrjmGzdFTuq/3hqT7AHqrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51523747"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51523747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:43:28 -0700
X-CSE-ConnectionGUID: Ztf0mPyaQyK2I2vpKWuaNw==
X-CSE-MsgGUID: soEfVyi7RQS1aDtpxmOFow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145746124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:43:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:43:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:43:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6SY6DyaaW5fQptbN2+2hgI2SW8b9oYSckOZudHeXR6nKl1qgfKXhlzBdIfStQLE0Cns6LWCEUq4kLl96lJ6O2O2d0NULNr5CcQ0mOyTiDnhcecjD7WQNvwceFbeCIzx6PEPnV2gJkYjMzVvUCk3yr1y+yWtxtgrDBSL2PWf2yq+pDJZNmN4q+uyLbbaCOMYVWrVYkxAX4jZK2KaettLipcXU0fwZFYF8UcFJP1cLtbEs/jx2uetEwwOezfU/fuU++hrRRhDNdF8LSzYAfZjdUex/08ulryMYm1JLS//aO1k3wWBq6b/XaDMBWc6es1T7sHE/mdmvAz98vHtLGn54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lvT+o0PUXqp0JUnsBIKtb9XtwTfkZcgwk79iOYEaDg=;
 b=BLYgw9Xu+numEguTwMWUyXSK4earm1UOMqWU7HluOfZCmKmcZ1ORbsBPxofcCgT4H3Z3BgkwlPFLojQ4gCjf0KCf5iJPErfbb8JVlkqdhzIOPmvlsPd3QkBunL70ylIQVRwt/cMidMVh4uUU6eqN1aaJeLeKs2/6wCykr9SFNk5Y3LxAnhQQwTdHSYJNTKFR0QGdHRa2BcoT3qeee4CmXGNvPP2kNC91VUS8zvoW8DnlKFAe78PdqgcjOqaSyRSF9pMhJp3fbo6VH2vZ2tEiNj8+OXVFxIhaObi/MUQghAUinmWV4FldDAuyNOaltHRV2dzga3xTmVHaXfI+++4ctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 15:43:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 15:43:12 +0000
Date: Fri, 6 Jun 2025 08:43:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/topology: Simplify code for loading DSS mask
Message-ID: <20250606154309.GI5080@mdroper-desk1.amr.corp.intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
 <20250604202908.769-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604202908.769-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fede47-9e5b-4029-ebfd-08dda510d803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?npcZlelr1hbf0qLEl1kSRrq5TW2wHjT4ayUomjk6FrZaUUiDGDBESS/1fncq?=
 =?us-ascii?Q?jHoYPkMgNYr9xPHzv7ETdp0ZI8TQUgGCypm7eGq4ZzqEQzcayz+VBTLwJEsJ?=
 =?us-ascii?Q?L78IsLOCgkarXXoFs+6u77pl2KoOI+IROlQx8vIT+GWqkK0Mw2eDz9fzsTGN?=
 =?us-ascii?Q?11YTWclosT6GOsszZNOpe36PISePD+69rqMUUIAetYuYQBfs7ocHUo1PmtSd?=
 =?us-ascii?Q?Y29D7gKO1FeNpqPEuXCTGQDSLLpdoL+Sj0TXCxMpclx92/YoZpqk4CMzVhH2?=
 =?us-ascii?Q?rAoKr6FQRFgfJgFY3YgjMLKDh3lMPxIJKHv+A99U/w4//4G7Y9U/bKYjqQVX?=
 =?us-ascii?Q?Kr3LPuzr32LAfrcPevjf622pGC31SB5rya7oZevzUuYDD6LHjmz/x1e8JOYC?=
 =?us-ascii?Q?eDSl1iQJJT+SlN+4JXY1KVoTAJVcqI9HqMvE1nNLQdOkLfJlV3QRG626XOce?=
 =?us-ascii?Q?RuZOtVUKpbK6J6onopMlNdmk0+Bj0n1NXBu67Tla9UB72Nd/otPOYGjH8/CY?=
 =?us-ascii?Q?JpKkrE4kgG9uB+g76H5pcYIjeSJBZilmPINAWx90Y9FTcVFmaycpp2mW8nyU?=
 =?us-ascii?Q?M5kXTP82uSQDCAt3UJBoxfUHYqAY5E4d5w9qDm6jfzxAEvVOEeim6F/BFjqQ?=
 =?us-ascii?Q?D/lHqrM2WhtzoUwFGY76f0Bd2eMXyiIj5puH5lDZbEjsp/s+V3DwOK6l68TL?=
 =?us-ascii?Q?1Vf2AfEMFNXk1YiB6nI5ahn5dIhhM/7dC2lXDOKHwEyRooq7QBpYmp8o4zuQ?=
 =?us-ascii?Q?5qIkJJg6YQobpFQ473nZ3Z/rLVn7gUqeFsLZ989yPy1diaisDKnwndWZIFnu?=
 =?us-ascii?Q?vytLuwuF36G5G2IgSBGXRHfUQ2PG4TP2j2oo5ObXJlIu1tfoDzrPDxb2+mU0?=
 =?us-ascii?Q?fYd3Dv7z+/2rXFyEKuqiW6Kb6mQi4jop1iVFoD5vbHvnEdOPzb0S2mnrVjlr?=
 =?us-ascii?Q?Bhmyvjb7YV96Z8ctS4bOqP4N6F8O0C6o7EIzivxqIYVihnRkiYqwEkUgwYT/?=
 =?us-ascii?Q?etUOTdQIPjIIXavAenzsPj63TPG2Lt5jyfRnKsR8KufxyBZkTReKiAnFQfT/?=
 =?us-ascii?Q?fDdCHfHc2jjbff4GL5ERTM88n4KgPUr3SQnoI/olOd3HjSFK+9Hak+1omaWF?=
 =?us-ascii?Q?7T0+892QWw8Ynba2nAs7V8N76iH2SKntcgM56PjpjNYQJaOxOTxos7K4126e?=
 =?us-ascii?Q?YKC3MyYa3trCO1gA9zrxfD56sByQTJbC7rvc+iCWE9bWX1wnTxQpwYJe/ANt?=
 =?us-ascii?Q?RWnfxuyrtubDBZuUxT4S/OIn6BL6RJwxytqTbFtPGxtwG69J2h5lfY6IM7CR?=
 =?us-ascii?Q?57LftGL+tIB3ClVUix+LKBXtG2QbwAR0BIXWfUljFG54VCTUNLb+AXW6fY80?=
 =?us-ascii?Q?rAgloRsngdHxSNLzD32CoNQO2ws0TZLl7AvhDru3IoNmlG/m+bcMX/kMeWd4?=
 =?us-ascii?Q?OlTgxWsG8OY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idMJndM1bH2Ucn7z7Xcfthhg2rdyNz1e1dwRkx2H9tbJcntS2MzImOzaTLjA?=
 =?us-ascii?Q?L0zHX6Un1Jn3tAUYUIB0PuZjIH0SVI7tFY4GmR9JT5b5JP48IlBjnaiw/CN4?=
 =?us-ascii?Q?JEzgt3uNr8oC85ubJzu8bOq3MWarIKyRwjnzUSZcLXxzQfEcQwAEcMVDD1oJ?=
 =?us-ascii?Q?ciBdqw6GsYNJ10801E3dc5zC4gVX2dr2xAm72Cpa/WX3im3afruK7sC87yo2?=
 =?us-ascii?Q?uvGGYLOOUc7hVI24CfLxQBlS9p93VARctANWJrcCpogs6PYz3Xb9+Lxun0Ja?=
 =?us-ascii?Q?fNJhgZuAXuKG+HFbm+OycI/vhSObqnZOoukfp2qBmBOXw4AVEuYLgl1Wtja/?=
 =?us-ascii?Q?Z+vhvCVsWcgWP5dekKrpuy1S7Cd1NeOwW1m74sSbXt9xqWm6sY+Gck7iIfCl?=
 =?us-ascii?Q?WlB3l4z1PMu+l/CzvbkoOzOXh009DwUA9iDsAOkjYFZ1o6RX3wePAILgZkxl?=
 =?us-ascii?Q?Hrlo1+mr8hS5IhrHIab2MhM5uIzw/62aqfx5WTc/7w8p6XPXCFMu0DXUx7R1?=
 =?us-ascii?Q?oy6Degurpi+VFJjamJ30XskQFuOkVo72K9s8TVOV/hc77kIXwVKvmXrtgFZ6?=
 =?us-ascii?Q?lHUZSXyUYRXEtjMnK1NtcSOOWwT1bk4qAQZMMU0MnpvMk+7xF+gdF/jZnwF2?=
 =?us-ascii?Q?KFUkbM2ngIFWLuAHqPbo2HbubC7H4bEZMap+dy0XpnratW+fk2Ff0twqBfNo?=
 =?us-ascii?Q?wUqxfbQjr+NQrJ0qYccZqaYQ4N0ZWcfY3lfeq2mk+blfXa12PFCYl7pWRa+Y?=
 =?us-ascii?Q?jRfkJvLxTHBxkHSEiEQNdq2dbPWdqzrCV05OjkcgHC5eTzkhqSg6U0ttc2y8?=
 =?us-ascii?Q?KBYTKd9CkywagH0F0irPbmwI2ZvCakVpD4rsiAJIMB9tKg4sS8OobLd04LJr?=
 =?us-ascii?Q?zT0Fk43V9girma3IqJCM5F2Q050yt/VqLzePPCzBd4FeX+EI8Gp9suVaDlUW?=
 =?us-ascii?Q?VDf3q5VFSTdkrkJKFM9EwSBwYx0PHgHBsfmqHZJL/tGtNbLU/hm2YvVkukbI?=
 =?us-ascii?Q?1KYdb5K1RbRZouH325wYAOXKqRdseEEooQVeR7QAL5XySR5bv0Egrf4v3fhV?=
 =?us-ascii?Q?IrrLy1IIZphoX44UoAHjwBCNOw9ZTpjYFP5yZD/cbbvxqYphTtcfL8zHkyTk?=
 =?us-ascii?Q?mMLXNGHn7AeKWrj+GbXqznoicp6CHTLQedlp2Lp4GeO3VKi3DR1rNhSXZv5I?=
 =?us-ascii?Q?je5psKJN2r0J07F7BfbTfF5wBO6at1AqJZ69yEL9u8V3tBdeifxpr1bHWfmi?=
 =?us-ascii?Q?9LYt+9YARfYiWf/6GnRYG6o+ESFet4IrDnLChmpOdv7LNIPyGWDm/eIb/oNs?=
 =?us-ascii?Q?k9DQUSgLeKJmZFAXg8S93DFSx9HP6fX2oV2KN02XbP2VzYl9riEmc1VGdocI?=
 =?us-ascii?Q?lGmqFSlpHQDZ3ZkFE2/fyvojFGIuvwO4niziY8Sh0zF1wsRlOpOzJ4G5SbHa?=
 =?us-ascii?Q?6KuIfAKYzHWxYNFLGecnxQijvRumQN704AEStvRuupQBzQKCmiFucdJ8p7fd?=
 =?us-ascii?Q?a0uonPnJfQ+r0c2AA58jA3LdYl8n9/Hkoe21XlT/UUjWD0/Ou1g5q3/VL66H?=
 =?us-ascii?Q?olBrJ+P6bSDx7WaVZcUrIKnUiJpW5PSlNXPA9l4gYb9r6j3TM1JSVWn25CIv?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fede47-9e5b-4029-ebfd-08dda510d803
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:43:11.9923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT1qVgN4tre5uFpgCquuNpnZ+npWmrJZPljn37EhtHGajJjZ68hM/QySEUoOiBY4SS51SQmWYYeWQqsgMHHVappvgtjdpWsGfwzgo1cexXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Wed, Jun 04, 2025 at 10:29:06PM +0200, Michal Wajdeczko wrote:
> Instead of passing registers using va_list we can keep them in
> the static array and pass as such and also lower driver footprint:
> 
>   add/remove: 2/0 grow/shrink: 0/2 up/down: 24/-175 (-151)
>   Function                                     old     new   delta
>   geometry_regs                                  -      12     +12
>   compute_regs                                   -      12     +12
>   xe_gt_topology_init                          550     527     -23
>   load_dss_mask                                449     297    -152
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 35 ++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index acec6559e2f2..62bfb6e1a166 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -16,20 +16,17 @@
>  #include "xe_mmio.h"
>  #include "xe_wa.h"
>  
> -static void
> -load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> +static void load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs,
> +			  const struct xe_reg regs[])
>  {
> -	va_list argp;
>  	u32 fuse_val[XE_MAX_DSS_FUSE_REGS] = {};
>  	int i;
>  
>  	if (drm_WARN_ON(&gt_to_xe(gt)->drm, numregs > XE_MAX_DSS_FUSE_REGS))
>  		numregs = XE_MAX_DSS_FUSE_REGS;
>  
> -	va_start(argp, numregs);
>  	for (i = 0; i < numregs; i++)
> -		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
> -	va_end(argp);
> +		fuse_val[i] = xe_mmio_read32(&gt->mmio, regs[i]);
>  
>  	bitmap_from_arr32(mask, fuse_val, numregs * 32);
>  }
> @@ -219,9 +216,19 @@ get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  void
>  xe_gt_topology_init(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct drm_printer p;
> +	static const struct xe_reg geometry_regs[] = {
> +		XELP_GT_GEOMETRY_DSS_ENABLE,
> +		XE2_GT_GEOMETRY_DSS_1,
> +		XE2_GT_GEOMETRY_DSS_2,
> +	};
> +	static const struct xe_reg compute_regs[] = {
> +		XEHP_GT_COMPUTE_DSS_ENABLE,
> +		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> +		XE2_GT_COMPUTE_DSS_2,
> +	};
>  	int num_geometry_regs, num_compute_regs;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct drm_printer p;
>  
>  	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
>  
> @@ -233,14 +240,10 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
> -		      num_geometry_regs,
> -		      XELP_GT_GEOMETRY_DSS_ENABLE,
> -		      XE2_GT_GEOMETRY_DSS_1,
> -		      XE2_GT_GEOMETRY_DSS_2);
> -	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
> -		      XEHP_GT_COMPUTE_DSS_ENABLE,
> -		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> -		      XE2_GT_COMPUTE_DSS_2);
> +		      num_geometry_regs, geometry_regs);
> +	load_dss_mask(gt, gt->fuse_topo.c_dss_mask,
> +		      num_compute_regs, compute_regs);
> +
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
