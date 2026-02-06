Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5B6EE6B44
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 17:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13D10E873;
	Fri,  6 Feb 2026 17:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UILvny23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A2F10E870
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 17:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770399496; x=1801935496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3qPfYogW0FNE9qgLLcisecT5xxXiRRbe0SMlW9m+8o=;
 b=UILvny23bKc/+kYngusWBFTvaNNwfHX/eRx/wVhN6B6m3h3ztO06/BFe
 NyoVnPynNo1Lufl1PYvoIqLvAXmvSfVnTPEBnPr20LDZwXc8cbZ4ue48f
 DzN1n52A+Uk/riDeaXWTlqQOhSKqfvBPVB/B110tl35D6Il07XdcXe9RE
 RLP9qEYBjN3umHVfXy70XBWmQzNegBgD2ic3+FcK1yctkoBpKuFIgET6/
 h77fuJCmP4kwm8WZlsv9aHOzl2nlkRVT2LpEt/5vCxtFqxW19QaKSPP0D
 uSix/Dte8tCsC9k77CbyWAkV3WHnbuG4reJYnkhxW1byrOg2amSurDDM6 w==;
X-CSE-ConnectionGUID: xg8FGePmQxKDxhcE7liOGg==
X-CSE-MsgGUID: fwmQj4iaQqWSeY+ulkEzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71510741"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71510741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:38:14 -0800
X-CSE-ConnectionGUID: f/zWDCviTD+Eu7IAGGzEkA==
X-CSE-MsgGUID: LnaA6HHqQ6qZ5VLafalYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215906421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:38:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:38:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 09:38:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:38:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLej/gsQ4eKVw87et6WF5XgLYN2xHme8/nqH3YAcRWo5lidimucoGfGdSItjulDlm4Sm7nCb0+8dTZA55mK4rEh/4C7PA2k3TuIbOa7cdgF0MyUeGJIIeLy4QZAcDggJ3VaNR2EIKtkc1FWkZ5UFLXmHp3hENkDkGew0ySk+Ab/7c6ylkTylwcsNb3RMoVpfsegkDaoC+jqpjvERHRYGL87MoJ1OrPxCHsXIzTfe21xNkg18eeejGEPAhlCYXwzcnqqRJD6QbHBnlZtBGwJXTaMOvq06S+AZrmZisZHdIHZ1ljt8t9RMHoV0dVfbK7waNiESkNfeRwmjfNiDXZmjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5T1sqXIyTWrB/i77VbMKUQ1c+8piDJcMs5iwvTJlwPY=;
 b=i6E6Lftw8DdxdroJTyrJulERmZP1g/kcdx8wiV77MlJVeJ+JrXDynVa5aY2UdLjlLYl1Wo+vbw9UeFDGaIpyX8Nx0j2PkRXlBKJIMKim9FCSILXvK8nNpscfCx6nuM/GQSFJSceAQg+ouBj60XAXfGkCJAcUPxoCbvqu4YrvXPvbibzreOuMYTXyeJJ3wlst8ChToeUE8ab1M4Zm/Vcq1b9IpkgZM2JaLZIlaqm5BSrhnW/EGHP/wvKmbYKTE7Y/6dCIR+bLys0gRhZit01TpSICpiEzlhErWvh6mZhTqHUGdoA13O9bj0y26cMM5OMj34lYVOr7ZAZg69jZv9p2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 17:38:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 17:38:10 +0000
Date: Fri, 6 Feb 2026 09:38:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 1/4] drm/xe/queue: Call fini on exec queue creation fail
Message-ID: <aYYm/zQpbEPpvIQs@lstrano-desk.jf.intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260206145334.674679-2-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a81f480-3aa9-4846-0c1c-08de65a67f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+eZXg0U9Lo2ncqb4RIe2pd9eN8R+vpDT3D72F9LwVBNJFMnotkg7Xt0n8irf?=
 =?us-ascii?Q?mLcX6krGue2Iuk/LjBO08Zj1E9wWlYyH3mzoHaGlYwAdTyyo4vSkAwVM3Is6?=
 =?us-ascii?Q?JJ+mGG1sfd5VLlPjhLqCUV9wQM+lzBvnnC7JPT1yoxPJzpTO/NSzlknSUwpL?=
 =?us-ascii?Q?9ctnCtXf9PUzy7y9gCxjnJc7AQnoappUGTypcJ5rdgR/udzzH8VE7ahtRYGd?=
 =?us-ascii?Q?MDOjmCyAK3JSp57KIfSHKHc870sF/ol6bK15BlHzVF6xvzsTpSCwDXyKR+I7?=
 =?us-ascii?Q?Eqyr28VxHwcZIKhBlY2i8L9IZbAgEZD9tXsy9M0oU0p733Wsl1WLHhGCTfyi?=
 =?us-ascii?Q?FilPoD8LPhwi/Vu03uvhe/9sdbg0Jc9vS+jSX4WF/6a+w9CzhRtnQ2ieFxRk?=
 =?us-ascii?Q?iB/u0nlo5h1uRQJgXqFqQBlfEvSKg64rNuusfRZZSVbvygZq9cZ+ZAgHnYat?=
 =?us-ascii?Q?fGGUd5TjEE9vuUTuYxRlgw+/lz6oeV7nZVMFUHa+IbtdrhHnIx0NkTCiaDtD?=
 =?us-ascii?Q?kNz4hVYdAx8evvbGp1aLD0omSjRzxdCqE+HPWyuQcSocncbOVxQYhpEyjoZh?=
 =?us-ascii?Q?DQJD7loI8gJ1fM0wK4dYozEiU6dHrc7qZHclzb3ntjj1N7yK4WpHD5WzXXXV?=
 =?us-ascii?Q?YAs340KKLHKmj0mOi/1WEwbANm5hoFpx3qTc165eCu+0FBByur9PMHErTtuN?=
 =?us-ascii?Q?SACGe4Pg0JKa3LSiv8GcW/h6WSyXWbiy+mMW9ROgjSuDauqkpe5M4gpc9A6b?=
 =?us-ascii?Q?p9E7nu2te3BGAhVJfE3SAo6sFhOgbDvH3kYGRxdCmJmkIUhvZaedvkryTnpO?=
 =?us-ascii?Q?9rENLT0jYdWkZrpETBHh0yugLwrfn3q06wJFexHiYPc49kYwLNV5l95cqIJI?=
 =?us-ascii?Q?HSNVmYOp3Z1BxIHkhYVOeDT/FN109mGKi/cQYdTXufROerPV5xPfh/uICFhl?=
 =?us-ascii?Q?1NrJ4AKJM2tQjzacDzn3UFtnWUuIka4hAe/N24PCz7J07OugqRfovnUj0NmQ?=
 =?us-ascii?Q?V29NfN+cMxUhc0DEUYjSFrq8llpj5A4QILtZaTl1K3OxrrH7TOTM53DQjGo0?=
 =?us-ascii?Q?Ldj8m5mrSopvgdLHqW0tJXLYpQsY1zlLMy+iXY8nQpoqiwRrxiXQBK4bjVtk?=
 =?us-ascii?Q?0nwePpKjc25702bwfrYqmXwJS3ncIQR0jCsf/uIVEaqQwUhR/3Z7YOzEw+Wg?=
 =?us-ascii?Q?V6jrG3KadmXJqdQGOh1BNTqqtr6Xbgtt+OMqgwXm5LzNUWaqUqV1r/x3FGTj?=
 =?us-ascii?Q?MapEX8JjBMBO4D1FT6+6Ja4dS0a64GbSPUuBH3jRdcucB47vFZ68xeO6tJQq?=
 =?us-ascii?Q?MKljCYphqCyobc/Y+0ewQQtcdcg2DQK4vydIEWHJ4JsVJcLnRq2oeKvQ2r+v?=
 =?us-ascii?Q?KEqCVck0DJ+Dng9Mu14P60UybuZ+L1PpfWagG8wj+flpd2VOmkGFMw4ILEIJ?=
 =?us-ascii?Q?VJQHLX8lL8YE7F7r/OhTcH41mnW65i/zu59v6eY2EANZg2J3UDD9rlTyZoD1?=
 =?us-ascii?Q?EpD3+bSEfl0B9WiLNLI+aLShQ0UkpQvJ238N4QA7JbWBOMjGxFs3ByB9Uez3?=
 =?us-ascii?Q?6vD25miQcDBqZ0xwSvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GymLsTsTvMon4lAD5e2Ncb3mEQ5AWrXiw70PthfIyRumiY+hF78sMTPM3YMP?=
 =?us-ascii?Q?+uUffXYnCP6Bi0LMCsAXL3Waql73nN1E64xdOZhZ8h6B82KAUhyM01nz4wx/?=
 =?us-ascii?Q?dwLM9ancYhbcI9RjjcHbHxFgFgH7kRaQYNofFXNmL8MepBZGoWBUZHtj3B77?=
 =?us-ascii?Q?t54WNsKfQ9B4nIrh5JU4T10NSjFSBg4V1Jh1ENWSHgfhA4a/qCHTe7fpajBf?=
 =?us-ascii?Q?u4TGZmmxbYot1artPoEP3zyDelapTEksHyNbO6TnmsD8LyKswSPa3Vvx1T50?=
 =?us-ascii?Q?kxVVgQnASRu6RaGjR1Z4WZ8pnEZCWFZ+YZRtcEelPPV6b1X+Xku99+goYCIs?=
 =?us-ascii?Q?qYwLFe/rEWWDzFEwRSBTcV6ovoUjIQ6uVZSuCamSwe/q3FGSVCi8kJJL/Ih8?=
 =?us-ascii?Q?qezHmxGaU6+SVGz/8BSCiBt0IawYQvinFZ07N1Kxq3GA1Sd5hjgdfNJpgEZJ?=
 =?us-ascii?Q?folHzlcf8G2yAIdE6+4ijsK5d0G/M5W98RozLURGgwCbQvg8DUU1xPyqALPZ?=
 =?us-ascii?Q?dmcLH7/lxIOxlUQ/XKQGHXt4KQdq5XrDuhpDd/GcHQ8ARto3u7ogPqnc7Nd3?=
 =?us-ascii?Q?oWkJkIotlAAGtchAUiWvVf46HYYKVfKgfEYG87B0JJOLqkG7w9Fw3QWJK1ys?=
 =?us-ascii?Q?k+lvRlY+3ACd2g2os/diJlRV1piyzgY1LqSAgN6wjKVnW0RrtLHMXk5zEeV3?=
 =?us-ascii?Q?RYeWZ0BogMdWwQebqBPZkWnFRfj3dZcvKILD4P0g1Lnvfsb133flYCopnTAs?=
 =?us-ascii?Q?YH1tG8WxUzAh9+x+2WxPDmfzHWgfbC9ZsIE67/NI54TZwVmVWY0Oq2S3cN1b?=
 =?us-ascii?Q?w4FUbUgHEsaOhyZPE0eJuX/GunCjy9bQM+HpjsokYOnxX/9MNcAFAcrR3TtX?=
 =?us-ascii?Q?sSANNpvmlxO784BZlomzqhkQor7oOuVuNTAAReFu4AOndY03J2byYRzvhelN?=
 =?us-ascii?Q?rM+58u7gStz/bjrLLUHapJQ5NeSYC7X8NvV6iFen4HhqkJBXRqA0JtP14hGD?=
 =?us-ascii?Q?I14eoD/ci3JjkzY7iYzTIR+Epgzzm9AuzXBy7PrA3FHwZPMWzA/iDL7DX4cE?=
 =?us-ascii?Q?LGY1AFYOPAnbwr4MaID4z3ArJRmfAS4JKPtMNFl3XPa85BheppbVnhjRMXhW?=
 =?us-ascii?Q?+ePj/8yq6ToDgdb962BRppyoE5ofj23nbqd13Dj0E286l/tkMaDIRZ5DkBwy?=
 =?us-ascii?Q?tEEXpsdHKjWhS9HHTCl6+S//xSKoYDJrnw5kMdi2rRjnTEjzKs53JLOwPfWi?=
 =?us-ascii?Q?S5b/Y0OZSAjEw7tECQ8oZhfstZP/avrXbepnCYJghbSEV+7RSc5V1hZ4Oy37?=
 =?us-ascii?Q?poiK+UhhAeAWR914t+ijqKf4YO9a1tRMLpthODw5sjDE7N+bJ64BiNlzKUCJ?=
 =?us-ascii?Q?nskfANvGJHMH7gkIpwJDyYbIRFsYpNGBSp1h5JnF9t24MphgIyCYmBEsE167?=
 =?us-ascii?Q?79H8S2ZMQ/Kj5IKaJ0vhqEfX5e70kZV5PC9pslAhdFfF9eL9AktkdwHfZLrl?=
 =?us-ascii?Q?Wxf0QAK9nMaDLektAwZ6+Z+twbYjIgmO2nPgu8jqwwReHD3FSJ1vO+DIeT3b?=
 =?us-ascii?Q?OkNm1iOpQakvsH4RWGVGjMw7iVMD4xCvpSkilMyGwMb6k8WQGzEd5YXMu92g?=
 =?us-ascii?Q?EH9ABmLkZ+i0G92S/YBZHI/8+plH5j9BSdcarCXj3jXiNgcW6hZakpDn3Rg8?=
 =?us-ascii?Q?b8RzcIp12tF2MKrpvtluBdUm5N0dmc/HnqzleipCNXQE6VHC8snDK4z/YPZf?=
 =?us-ascii?Q?5cqfp/aoIA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a81f480-3aa9-4846-0c1c-08de65a67f2c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:38:10.7779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tTF3dDHEZVwbJ3UdiHIl7omZ3gJuUWbJVkzRLNTKgf29d5bvSsU49TovpYsRMeLpv6HIXKe5rvnw1Ud4PreiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
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

On Fri, Feb 06, 2026 at 03:53:31PM +0100, Tomasz Lis wrote:
> Every call to queue init should have a corresponding fini call.
> Skipping this would mean skipping removal of the queue from GuC list
> (which is part of guc_id allocation). A damaged queue stored in
> exec_queue_lookup list would lead to invalid memory reference,
> sooner or later.
> 
> Call fini to free guc_id. This must be done before any internal
> LRCs are freed.
> 
> Fixes: 3c1fa4aa60b1 ("drm/xe: Move queue init before LRC creation")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4..42849be46166 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -324,6 +324,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	return 0;
>  
>  err_lrc:
> +	q->ops->fini(q);
> +
>  	for (i = i - 1; i >= 0; --i)
>  		xe_lrc_put(q->lrc[i]);
>  	return err;
> -- 
> 2.25.1
> 
