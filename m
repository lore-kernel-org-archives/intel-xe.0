Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E5D59D6F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5B10E0A7;
	Fri, 12 Dec 2025 16:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd5vWuNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AF410E0A7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765558354; x=1797094354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rpdWOSVJ5mmdMDcO53x8t6EB7ZiDQ+/PovadQs4GImQ=;
 b=Rd5vWuNQyRfXIN7apasJHlj9ZczIUTpfBtTkJUXyofIMcXRl09klBeFQ
 TVOj9O+4ZpLCPchEWIVIqfTCzm4YMrC5J3Xa8UcTAx51m+dhjraKC08BH
 busY0lyDNqxvg+GBrSYXGw9q0Z3FxTUkNsZ7E7V+yp4nYjWg5kmc3oz70
 kX75TvMdfKJnGInwfLA733p8HnyqTrWvdZIDYCmAivPsRd6l0O9sOukQa
 Ru4h6aplZh/57/6VPVupfN5pOMFXkoqx7G5KFGanVp3/12xjEeVxVC5NO
 fNDuM2bvIOfW0WM8r/HqBWBhiKVfhsNRUAfzRoAPdc8BQm2OnjHYQIH8A Q==;
X-CSE-ConnectionGUID: rhGNh27ESh+4FC2sOoqSUg==
X-CSE-MsgGUID: A2t+q90lRreelTMjSqh15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67440078"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67440078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:52:33 -0800
X-CSE-ConnectionGUID: Zuuy1pk8Tu+11zNvaZX7zQ==
X-CSE-MsgGUID: Qb93HY25QfmGWnZCtl/Hog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197031867"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:52:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:52:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:52:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZehIkOANPgSIjrA/AA2j1SY1dd0EoxQO+GoJ/zlPEn+H6fKVdvI4DBdMyhHgw5t7i86MQvrb4NRUURAw12deNUdcLVE5x7XjAaVx28VabYDQ3zmzSIszOzcAPlbeFNYdG2hbDUebB1bin9EI/7iYF93iWYjYB/Y0hl+6kG9LVKT7/qZtpmsKiW+CHStn3dDdIStgkGhDfr+HESPHKt5YTVLa6yfl5hFBpCyAGZDM3oLAj+3TxvadU2iZZ3e7M71qAuK5OoOAWCIXvjsj3wqmHLtft0PTB3/g91z2YS7jpdr7ob5FO0TURcyyQ92PRywQFFd8ay9pcPVGXEBWc4O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls1DON8FZeleLLG/d1EsCP/NKtaLaSav7IPsYL7nzdM=;
 b=YiH2+AfLZ0RoUcXDjvcWbToQmoKGa2qad44qGxOWX2IWF9qh8bZta73+d2LAU5mKAfwckdNBwC9TGOFdGemM3/1GPi6ipuUlco9JusI0gPKUdWbdgHWm8SzFwbEYIYsVGIaYAvPQxPlEZpJdA24fApuWd4vWd9Ba0hECwDQh50YC4Nhica6Yjw3D9zDag/jSG6xWNR4nD+ykEs2XneQ3Vjy6gmxgwS8vEsoooYXJi+R8SPamMH5bR8ZNKl+8QaUjlAQ4tPB0yf6eJHpt6y2Ce4NJRNrxKaV2iByHR1EXD+cZUJAsRrMRqwuuc25FXflY40YXsm+V2F+ix3dMdejW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 16:52:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:52:27 +0000
Date: Fri, 12 Dec 2025 08:52:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <heikki.krogerus@linux.intel.com>, <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <20251212165224.GD3956769@mdroper-desk1.amr.corp.intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
 <aS36G51_xMA1nvBo@intel.com> <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
 <aTHth3B0MOEpnay4@intel.com> <aTJwlzgmpwERtOxQ@black.igk.intel.com>
 <aTuPQSvnBN7MAE25@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTuPQSvnBN7MAE25@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8a8bc5-4a2f-4cab-1849-08de399ed4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7okuNiHOFu1RuH3RvbhM/EUTbSau70UQJP1S6vgGQc1DkAHjtc6wHMNMjNN4?=
 =?us-ascii?Q?GIiEhE9Kno0FpszU4kMBllZLe/D/8kmjdp9jLnK1hXJy2qc7Vg71e8COq55z?=
 =?us-ascii?Q?fQvIJDQ5IUeWYGYZKMRTbxzFCSXpuKVszccwisGMqxo51xJuusfdRbDVssB2?=
 =?us-ascii?Q?qoq5dpvK5JCda1b+7pD1F8q22m+16v690IeabtArlIkC1Uc8pSDcNTYvY/K5?=
 =?us-ascii?Q?/KhnAykjWbyn2pDbAGvygE36vOtlf/yVlY7/4pu7oL/quUKCcS3paCdAW9Ht?=
 =?us-ascii?Q?RqbmWNOG+1L6lzV6Hszx4GyYTZLtbtsdPXi11jNNqDYpSnCttcxMlAzfR5UK?=
 =?us-ascii?Q?10bJnDNRSBu1Cdk/t1igmFUOvG1XdZOlLlAyYa6pnzbf4I/Ou9fDpAJ82Yuh?=
 =?us-ascii?Q?BRPdK4U+2+3fAuYtfYURMdRZKw2AHtsPO2ov/M9z2fc3nrTvzfj6u4a+L2af?=
 =?us-ascii?Q?BqinUJfcmS7f/iCGI15UOqhXh3HFtNGMLbNFdJdis4zWcMhDJghSZpNoPH5b?=
 =?us-ascii?Q?XyEDkBLB+3ZZ5ONAjTwttdS6E9Krd06Z4ErR9P8gOX2eHeF1g6uetXj+VDYO?=
 =?us-ascii?Q?J40URhm8o4/kJpOYhQdxEqSMjAzO6Az0wlGx10GTM64Gu46VBDB0onAeb3Ny?=
 =?us-ascii?Q?lMC+BB/1ClsLpkn1aoEqZyMlfveHjllz+T2ZwxO7UCMuAfov3Tmr8L6zJOyu?=
 =?us-ascii?Q?iDFJXbPhjipBQ9Snet7hglIXx+3Kv3JKW7Key0xMirG2Bht+vg93NVHQl0Wu?=
 =?us-ascii?Q?vkurL9tyvvQ+Bb4HchBta9YV5UY3cjkJy1xCJYz+jrDRbOaH4VkD5UmXC4F0?=
 =?us-ascii?Q?wpU/MLjABoDC5f/ErZKSHYoS1gP4ZQI3/REtYOyN7i7IAX/tr/3ksBa3JfH+?=
 =?us-ascii?Q?ifpsfCoeL7jO5UHpAbxFc6W34gQDaUUNbcd5AGqxq72Tj6wNKjVJiyoBU6/R?=
 =?us-ascii?Q?rR074nl03lKgCVZywBmA90BLCDqVpLMfMC3quvRAb4t64MVDF7v4guR/3REc?=
 =?us-ascii?Q?9ZSgjbbJUq8JW2t9sPMsKg0n13jIUqunY18dYQx+vNobUJ9v63a+g2XSHTBU?=
 =?us-ascii?Q?nCsuKlcwN/NAAxZaDN3l87FjmAZhnfeFPUHSOKsutiUMIL/hoyFYis4YcIyW?=
 =?us-ascii?Q?RVLV/25Ky1HdSzP0UQ1abMUqDHpkanqhDAgfY9iXligCzfsX3BuM6NNnzXzU?=
 =?us-ascii?Q?flQNxygdzC2B5C7Y5zTcWqyqZd/cee/iQ/p4oPgFyQBUzGlDVGSnQD0ozBfp?=
 =?us-ascii?Q?IbdDgTIvD93/iAfNcozihFb5FwNqUqyK6aSeTanB3JL49ruhdu/tG3yvC8SV?=
 =?us-ascii?Q?gfI903MGfrHGVtPTgzcKSq0RUK3VaCFSraPpOTiTCD3v9Z4MmPX/9TWfPebG?=
 =?us-ascii?Q?U0VFv8xtMMeagcXFYDk04oGOQjScNO2fK+si3LkZsvBvUcFdoGwtyM2a2hzk?=
 =?us-ascii?Q?r1EoRzEzYq/4SnUlFvDDY7eKbPPTt3gX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JnxLFfr1TQkggD9CXNzChBE4jdacl6o+w4EigVUg5ffIyjJix9e43UTYdKCc?=
 =?us-ascii?Q?TFf0IMYFEFhgDLJak8RTtWzKl7wJ6huxTahnzPAJLjbcX8qqaJicblx28s74?=
 =?us-ascii?Q?iAdtjfhI8pdy0VKY10YFjk0KHpjUwqSbuFyQzzWiKeu3aOL1fpsBvXzWsbdE?=
 =?us-ascii?Q?2mOtiDSicZI7b+IX76JASR85jdrcKdTxRzleOSvo4mNWFCqWjoqEEXVTdKoI?=
 =?us-ascii?Q?noo1UvMcdhdLbeCLfEkcYryvXhTdyD2PUpf/e4NWs4g1lhfmBrb8aUil1nTM?=
 =?us-ascii?Q?7PbAe+96YVILVaHMGY5JaJ07MJxrWlAERVLultX/QHw4f1SHwsqM04mta3Ba?=
 =?us-ascii?Q?jfpTDf1d5Br76eFHpcbmhTOOF8ZONlOlF7Ck6bDfSuQvF5lI9ye1M9KmYJ5j?=
 =?us-ascii?Q?4exZmNaVVcSgcW7RW8IPgkpemT+Pwn3Udkd+1zpcj3uO5HdUQ+7ONSDcjogY?=
 =?us-ascii?Q?bsYR2nq6NCrDKjbi0TGLzAlr1bPB8T67Xu1qdt2NwOYGvkBb+sZPOAYqozNy?=
 =?us-ascii?Q?5/xjQfiLgr+b/9cw1R1QqpkV9ZjqGqyPXvMSlStLHknTomOys003NKlca1Rk?=
 =?us-ascii?Q?pk7KkvU1ZRPzRN4udiivuMA7cX/ZaLPimHaX9Z4vajb9JjLTFOLqipRspTyE?=
 =?us-ascii?Q?QcihqE95qxShAAMYplo94ncBu7EF8VOhOWBb6I0mJvzeV01oOaVF5SoYNnDn?=
 =?us-ascii?Q?G1smUvOR1yxUjL2jKRKA+xGjXM6jyNthE0csNCxa/REPgnagGvL2myUsoyZL?=
 =?us-ascii?Q?nezC81e6SiZIqudGa+tBv09WdDY2pns9rgdr7LYsd/gxhLTOHYy6XNl3lvZA?=
 =?us-ascii?Q?0C/cVuQuNc73lGUbj6dhc12MqfDsGmI69Pu32y92nzvvuJuxQAFEvuWODA1W?=
 =?us-ascii?Q?DLYsFr19t6XU9KnHEEeJ/PxXYooNSm9ocwbTTEplkbmdSZzfG7RZy8rsTMZJ?=
 =?us-ascii?Q?tyqZ4XSGNdkXjNV02UHlY0UCZVW0BwovGzb8MnnkAcyALK0Gf4oBpdC66Wps?=
 =?us-ascii?Q?v2sPSB6/ZkEotkTrDPyYreg0ybxvZnak/ALUBZYJWqmbiX+LOejbvPJPYASV?=
 =?us-ascii?Q?7cn5zcS02R46LInVdUcj1SgWlg9LCaYYaTGGaZcrxzQ8UmYEQu7vE5J+3baw?=
 =?us-ascii?Q?XZnpAK0xPd7qo+InkJVISenCCmV8f7/cHic0CT0LNK/4bEea9EbME1nnc3w+?=
 =?us-ascii?Q?hcao3wBVM6IpN7IlejYfTdeaRj4MyZHMTcZkVIPyR0A5qHEwvMY2RTKKimc+?=
 =?us-ascii?Q?HhNblOUw6I/EGiwT8D01H7jDMR7o4ZDuWa7uboHB/5Xe86vkBUMcMnyo6tVf?=
 =?us-ascii?Q?yGjPa6Tt/zKSV6otBrkbmdHn87kru9GKIp7xqLNXhrBW15idzErOGaO6AhU/?=
 =?us-ascii?Q?zndJNJY4yVju/1L+ewaLTjMwK2JvfSg4hr9ZluTnRpbG8oi+PusW7Rd+19fs?=
 =?us-ascii?Q?IUchzw8pWl6EPQgtzEdHMJeOo36y1rS+6Un8beC4H2VyyH8aq5uY7icBhdF+?=
 =?us-ascii?Q?iwKXK0eiQiKKZCOZOhHG0xOd8WkZgBJFIGkMTP8h4lNN/EqZbYWcvoJGOitx?=
 =?us-ascii?Q?KE44LrBQVQx3FoFo4oRPodiquaRQHHYrdZh0ljd/bNJA1QRHamSc6C5PvLxG?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a8bc5-4a2f-4cab-1849-08de399ed4a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:52:27.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcTshJZiwOF1jW19U1oCdtN4CsRaIMyQZBYMJE9UZjFN2ptN0yt4otJHRVCjxC9wkBCpuJb2sRupyR0RKxqROLVgznSng/3erDRlDjsB+zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
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

On Fri, Dec 12, 2025 at 04:42:57AM +0100, Raag Jadav wrote:
> On Fri, Dec 05, 2025 at 06:41:47AM +0100, Raag Jadav wrote:
> > On Thu, Dec 04, 2025 at 03:22:31PM -0500, Rodrigo Vivi wrote:
> > > On Thu, Dec 04, 2025 at 12:42:28PM +0100, Raag Jadav wrote:
> > > > On Mon, Dec 01, 2025 at 03:27:07PM -0500, Rodrigo Vivi wrote:
> > > > > On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> > > > > > Enable I2C controller for Crescent Island and while at it, rely on
> > > > > > has_i2c flag instead of manual platform checks.
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > 
> > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > Anything else I can do here?
> > > 
> > > Have you inspected the CI failures?
> > 
> > I triggered a new run. Hope this helps.
> 
> Ping.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
> Raag

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
