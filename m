Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0944ECD6E0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 19:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E110E642;
	Wed, 11 Feb 2026 19:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/7QLJVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7810E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770836597; x=1802372597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/MiQnaM/56HkaS77G9zQnir6kpGmtv9HU1O/TW3ET1w=;
 b=b/7QLJVwclZnKOug2HK8pnCBN9M1uDIh0w/vXr9c3L55qjQUi6mOOipw
 PfgCIKAgGCn/qMHXC7kMKlke5wX/OrwQbyqihtvhIu33hbymt+Ct+WNtp
 Gp8FuaFXTuen3eZy4vfqOO6MWvyj2BhvfKtHbXZGuIIpnYiZKyHY3xfK0
 moH9Kp+rtFcEHS7w0WhbDcie3kRDA29mBiUdcWnsQEi1ooCX9KIAxEMnt
 wAFTJEzwTdfgsYXsuF4OjS1kTVrjNr0Cl4FFNM1+hI2sbCpz9lKwuuzJU
 mGH2NYMwtwUxpbaA20SCDGOKaKjqXGHELqhwHxlntufWECqKPpM+xmt7e Q==;
X-CSE-ConnectionGUID: TJ6uQ8WmSLe7R+RJDZCePg==
X-CSE-MsgGUID: kWs8jwLWQea3o9IsIr0nSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75618805"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="75618805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 11:03:16 -0800
X-CSE-ConnectionGUID: uaWcagmtTFqKkyXp/a3Eag==
X-CSE-MsgGUID: lK0Wv0XdTHGnk6I8ELrmwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211626582"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 11:03:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 11:03:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 11:03:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 11:03:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hbal+HD9AQKPmaN2VOOodwwmLeLlUgLIwyabSbTbs3c7yEpl0GDsA7wBtlQM0mC4yae0VXurGiRNeqwQPjUtYHGRuUL2S1AM8GvKgJ5P/fFlIf5vxiZj/4WT+l4vNPaN4GLYgXqki40WZgPL5j8oA2241hdl/URyYAnhBWbKETHtrkWur3YsbayT+OWiY7xG6lSsm3xppzf5CNF0PvKcA4WxDaIa6HyKpdEF82jgCoeDVzOvoUme4PDzfGkVoLt/I0aqn5sEWpEiecvMwgNXTSHUkwsF/RjiCvwlQoptUI3n4u9SQVk41HlXodD3oa7RpX5JC0AaYwZwWjX4jf0oIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiYSDUQXf+MOuZ8UwEoQsRs7hQiB/sX01LSYsDfquLE=;
 b=XMAXHXXO5Ei2l5DRCf3CvonadiaG1e1DoU/sDMOul95G1YMCRvOBhO3UB2/qOxStN7K/hCvy3gyWKG+HT2yST5C+PB3jMXafhLwNsFmU5DkGgy6CVOOHC1Re+CxNFHP+YUJftLtyTxq2V5Tkimuoa77RFsJi9xgnjPUn8sPvWdL3NdH/d2gL8sTggJNNkzJ/YK50Xn1p+esBV41fiPkU6vIf/0Hp4nxHhfFN8DPA0E9H+oQOhnXeOYJD2lRTHdStAUWV5lemUBtJ2YyjLNmz+ZS/MCOEVHO0n2JwETjK3etU+wiOhd8PmmO/DXou3JLLkN2W2aNcOSi4mpy2rSL7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 19:03:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 19:03:13 +0000
Date: Wed, 11 Feb 2026 11:03:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Message-ID: <20260211190310.GK4694@mdroper-desk1.amr.corp.intel.com>
References: <20260202181853.1095736-2-shuicheng.lin@intel.com>
 <DM4PR11MB54563CF9131A7D951605DDDEEA62A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54563CF9131A7D951605DDDEEA62A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: aff8586d-e235-475e-f95f-08de69a0347a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ugzQ5hDPrgZRcUpACi1mGCMtTAX49VhC8jFeJCU7T21fK0C7CMEysXt/TaNX?=
 =?us-ascii?Q?R9RtEqIN6wz7dmhFAtinO/NgJYprhPRq6ejFMW5EacjsBNHGZkFAjh5wVlX9?=
 =?us-ascii?Q?ur32tcW7OQByBrGZBtnMFE7RFBBhWzdwJgL7O23/qPY4INpJ63Vbt227Mi1B?=
 =?us-ascii?Q?ovbaw3i6sde7kwJCL/DmOpn7v1CuDalEjUxsRv/qy7uIb1rhz8gRp/7HgyGv?=
 =?us-ascii?Q?Njf+Z+NK9TyaA3XLj1rGuwN2e3DRI5COhZJtFatH0VS4ZyWd3IWEjTyISqBF?=
 =?us-ascii?Q?xs0e1+ql1vCTWlER7speqto5dJbjwcQSb/M0+t+NQ9AIsULTo1hIH+2RHyfG?=
 =?us-ascii?Q?DiclTZD8Syx5xqLVIm0dp97J8DR0kdHU+kUd6EGlj+u5UAaCzeD1p5hy9nf0?=
 =?us-ascii?Q?sXHvOAAjVn/huf65TCRq4XzpP68+UxR65Ulyt/paahLnL4wDxK0bhV3qm/Bg?=
 =?us-ascii?Q?LaRURMuP8RsGgGxb6Ury5NHdAlsqGEJpZ9exSVDPzsk9tgV7imeyI/15AP4q?=
 =?us-ascii?Q?+5ZwovoSuUHb7XZcIcAibZNv830DxRwQRHsdR6MUDHfc8y8Wz2lreQCdxYSh?=
 =?us-ascii?Q?P+tVVrEJIsGXtpcGul0qO7R2KpSbyB3xCoFIoZ43NbzBMstZYgOnXNkO3c64?=
 =?us-ascii?Q?Vkp4FTX4NyAj6c5dqyQGLMMBGbgla59+JM49nz7lwyaQaRszGk+7YL+bc5Gi?=
 =?us-ascii?Q?J+y/xoRX5tYI2o8M9K5cvMSMSpCUxIMYmh054WFZGKAxUFEB4dMeh0sX5zkl?=
 =?us-ascii?Q?pD2ekKwhEu/w2jwWcH/dFhuNFscgaSsjVQK8ZhCzS53Y1g4H2Juxpzb2AtNA?=
 =?us-ascii?Q?wW7OCmRNw42ge1nSPjxyrca4nZPIJeG/8LowL/9RWxT3SJMCFGeCsEUh2tIO?=
 =?us-ascii?Q?rQf/lQN1LuQBcW5hscDzCef8rx5qpzijOahyaPn+armDB7s4qUDkfEeiAwED?=
 =?us-ascii?Q?NQBqm9bMk6x0AnKG+cu0Ya1zcahBzSeuZlvW1bA1W7XAlS/yLX8EVVRPUafU?=
 =?us-ascii?Q?sE1Pe4zphfpXuP4T2uTJl8k+h181ZG4eFmR5DD41xRczb86HBlaOAJiDSETG?=
 =?us-ascii?Q?bsZMqCar1tHKgQHy7dvLiHRA4Hu5vMQscmnsomDI4gIW/klZ+Hia0FAptMXt?=
 =?us-ascii?Q?lIdgv/MtpmoqICugXTKI9qG0BLY6T4a8D/FsI2hUflD0Ao+Y4W7qXlhfKbTF?=
 =?us-ascii?Q?MxQ76aj0Hxfrv6AsqFqY2stcxDIpB6Sd5RMgCgTb3cJOFsxiB33RM3fpSoyu?=
 =?us-ascii?Q?oaXqTClOjNES4cHkEy6LSJfO5HNkvUafWD8S656B8+70Y8iMUTGuBQD7KxJn?=
 =?us-ascii?Q?TRId5kW6K+T4X+y399cC6InzBBP/CJgCM+0As90OhzRiPwfue3nGm+/6BCxH?=
 =?us-ascii?Q?ucHhod2WbQ1x3saaaKW30lTswM+OUR7COTetSl/5Wsk3JR7jvxpvu7AD8OFf?=
 =?us-ascii?Q?Z0nlgxdONG/Kh0OvmLYHxgXPPlEeW7HnHW8kypcSCP9u7enw7lu9rLobjiEy?=
 =?us-ascii?Q?WWuHdEc64OHl/uFhR5wh6gAtVZlaZ2NgrTbmd5ZIdW9x0ZRwncD6Odaxbtgm?=
 =?us-ascii?Q?YGZBYd/JcwlYKTXcZbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XU4lQ7HcCqmRBsVYq+mc6Uv/7kuk/ZoafvXmkcMsG0yUz5grIOp4nfEw8nbm?=
 =?us-ascii?Q?Xa6MHZ5WWbeZP8AMsrBD9wIPHyfpto6KHKMmmS5UpVapi2tKrBP8t65gb0aN?=
 =?us-ascii?Q?XVgEHr4hBwUJiw/1wo2uwjSHpMVfVY+peJhzRnzvmIrN/mSuK7K3s3vbHglO?=
 =?us-ascii?Q?TDGhjUHd0OJkrEvxNLtdIemjimd6Oxal03QqDijUL+bz7M7bQjfowjQBLxiN?=
 =?us-ascii?Q?aYQdnAtgwwhaERH3zlTJm555iBvX/kCbD2Ieq1nh2c/XPLzskIs8kiKHoFZJ?=
 =?us-ascii?Q?TcHljPhQMpBRDPeoZxNxLmY0kA/1cCJTo6EZFqP+YR40WnlpUAtu4liP2237?=
 =?us-ascii?Q?tuvb0P4HbU4zLnjPaeibSEwaSzbPalp0G78lK9qp4chPNHbp7mbKPjoAI+jW?=
 =?us-ascii?Q?kLwFepG6Kbd/pr5SLyrcXl7oG9fPbfBxDnCsjAmBG0w6cZKgi44GgrYzDeMJ?=
 =?us-ascii?Q?XUS5j/oHGFWD2DIRkyt8AYjezw+3qac0Rx8S/aV0RL3QeqO+J8mBxHPHJMeo?=
 =?us-ascii?Q?ovQNlnfXwlsIp4w4cuU8szmkmFQhGHG+o+jgSGTFG9UtgEf9CdRg89RTPgUp?=
 =?us-ascii?Q?mlod7f5Mxzwwn0dpLJcy3BFq7Xt1TH+chfqcP+T55lNx9o6YqeNuXSkvciB7?=
 =?us-ascii?Q?8PX7Tpow8OckTTfVD0f/AhyWNgmcv4gNyKI1xRzSgVvUEK60uPlEiDj5D0Hv?=
 =?us-ascii?Q?Mmz8NcSGVyGGy0Y2YP9GHnpTbErvJkdG2NYSg4p4oc0upWKhAcQdoE+Cik3s?=
 =?us-ascii?Q?P8CS/L6yxZ9cLhKGsZhZdxRsv7ySZZcGBdY5O4sCnF8uL35EN1w8cVgwhCKA?=
 =?us-ascii?Q?fENIW6B71MOQAp71rZLf5McyQNphS+EH1PZeaN9nmnYNkl8N1vhapFjEv1xI?=
 =?us-ascii?Q?5HKCdUrjUdb3yg5K7kLaC4obMwCIvJyujCI9KDnKXdrdacIKV1W0CyOgu37h?=
 =?us-ascii?Q?236E4plIiBIv1BXwruz77Je9qC0NjF+yiV/X35lY7FLGKPSbIRlfVdb/zwEe?=
 =?us-ascii?Q?hHm/SizL1HH/AzA47byo+kbVLZGhn87GQY5gBzVbUXWm49bD/U/tihNEgUln?=
 =?us-ascii?Q?ciyQRAHGWqIfzPlus/m40j8Yvgs6wWfSUUhjTTPCtZ6gUq+RquwKzfvDMVpU?=
 =?us-ascii?Q?GYUetddfhzSAI/fwnu8mT+u7N2nMEysEUkjaJwUqpQCnPECO0GRQ+ZBSgBfw?=
 =?us-ascii?Q?qIi+qdEaKPyAwSuRyaV1yDPxu8CEbFqmXy/G2fl8AYCRugIooz71kx4sWSsP?=
 =?us-ascii?Q?3/y4kLVVnWnr99igI0iEDUkdAFR5Rc1ViVZXztWYAYElqT0wIUwTdW3kJIx8?=
 =?us-ascii?Q?4gET4FXtCGFumrPKBQJ+JXqeikcdBXUWpi3p4XcevOJ0rMw4na/HHn6psSKI?=
 =?us-ascii?Q?IUYuewHirRhwOKtxOy1LcyJwu9SPrOpQSVh2AtSyKq7THK5EHOkUFpMKLIL9?=
 =?us-ascii?Q?LWVj9n1U7V8qS8HlPg6Op/EfHA+4JH1gcYK5MjVZGsTE0mCraewetiK82u8O?=
 =?us-ascii?Q?LG+EarWymuqwdtiGrgaapoPd1EQidt1MjsKPqf5UiZES4WIVfSySDmzREEir?=
 =?us-ascii?Q?sXz62VOgrNxHs3pKLSF6vwqnQlydooZWHtDWbSNyO+tWKUXUmRnr9u19/esW?=
 =?us-ascii?Q?hR5+qd5YHDspekpNllcCmxPsRZTmFYfHNWCsRkepJq9GyhbvOuuBYbxh4aew?=
 =?us-ascii?Q?rwzVODH8Cb5H+aDlNwXclga4OJ7mpblWHS7kC7g0OOnG6nb33I7/dwOU5Sdu?=
 =?us-ascii?Q?ATRADqlvOZ42xesjt29QGAOSvALiaC8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aff8586d-e235-475e-f95f-08de69a0347a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:03:13.1214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5/5vJR51WAI4Z0XoUOEYJAZX5APtVTu43x3p9d7KNVgn4EUuwkoaZ5cfYdtu+kL3p/ZBkX3COmLoJRQK+mGKTWzK760joz0aeA8Y2fQC8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9534
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

On Tue, Feb 10, 2026 at 04:59:46PM +0000, Lin, Shuicheng wrote:
> Hi XE committers,
> It is an already reviewed patch. Could you please help me review and merge this patch?
> Thanks.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Best Regards
> Shuicheng
> 
> On Mon, Feb 2, 2026 10:19 AM Shuicheng Lin wrote:
> > vram_bar_size is registered as an int module parameter and is documented to
> > accept negative values to disable BAR resizing.
> > Store it as an int in xe_modparam as well, so negative values work as intended
> > and the module_param type matches.
> > 
> > Fixes: 80742a1aa26e ("drm/xe: Allow to drop vram resizing")
> > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_module.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h index 1c75f38ca393..79cb9639c0f3
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,7 +12,7 @@
> >  struct xe_modparam {
> >  	bool force_execlist;
> >  	bool probe_display;
> > -	u32 force_vram_bar_size;
> > +	int force_vram_bar_size;
> >  	int guc_log_level;
> >  	char *guc_firmware_path;
> >  	char *huc_firmware_path;
> > --
> > 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
