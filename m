Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D628C30658
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 21:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AEA10E0BB;
	Fri, 28 Jun 2024 21:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7npiSU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D42910E0BB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719610130; x=1751146130;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=3vnrV0e/GVJg/fJ15FxEQtJMuvKC2Rv2GqVszOBRGAs=;
 b=G7npiSU5MkgBlLUJUwF56y/1i+V6DdfOSrI60IC/2WkZoCfHTnm5Yb1n
 C2/a84pEL79ObtncXwaot8sGRUtFNsJ7pFxAitf1dm60/8lTYjVHQ18V5
 00LkVhNzRY0b3Kb4ybv4eEt1m4zPLYAYdqKcldviDOudRvbbaDfWEEsG0
 2vicK+FbJlz5bliH8TKz9jYwwR7mpTRYp/ZVC68xYWdz4kDlLWsMV6+K5
 RJcqS0JOtIoii6ys2X7/Kv6++At+AGvID7aVtaHK6ZjYQOQwm8K5KORca
 WUGyBvTKaE6zncGwTdmYAIoQkZyPiyhC9Ks2+oTgQJAkm6gvxJ+0aImx1 g==;
X-CSE-ConnectionGUID: Tg9mXGmTQOaUsfntqY8fhQ==
X-CSE-MsgGUID: Zx8eI7ovTiCty4aJTyn10A==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28197677"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="28197677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 14:28:49 -0700
X-CSE-ConnectionGUID: lnd9PYCuQdKIH359frX5CQ==
X-CSE-MsgGUID: R7ELCN5+T3mp9YKptcadow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44976361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 14:28:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:28:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 14:28:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 14:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMG64z4eWQ2l2OAHvlXt+XR43xgeE6SVxPTLUJm7JjieWZfkJ1HWttIgZ5M8tVANLmmE74SypJ23APyBCNoWGeg8XgH8jloK5M1f7DxUU2sPrqxEH1u3UCc7ecO1v0HodT5tMWTsV3P88WVWNk23u8Y0FV2Wf0mCsYzMrSFfJ3r18i2qvCCHwhvQzTq/403/hL+DahAL6fNcNXrEu+m8k8bg7I9lRRy7Xy6+3iTLv8Un4eexiAo8QVAr/w6EDiAxid315g6Vkao6eaJ3e8lj89/1v+qkH66ugV8jbrWCbmWacCHRoQMqm+P3jd2wnXyEITvBZ3JJLlrAWldhD1x7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf+vgk4JWA/qsFRan2LzITzPTMtwLjj61zI3QqVQZT4=;
 b=nukwXMXfN/CrYF6HD4vrkmFlDnd7ve+vAyaAqIR/ES0gpvazMcXe0cDsX1xVia1tXeoP1tNusxdF2LMsYZ2KJHeVwFeW4lMl1IBi1AFxEsNGNvXaf1Kz0LbMHJ5BqeZk2YjvBziCowkocBSfYgZG8NV/nEhYyLJlPkGvTV1R76eN5vf373c9dA80L7zx2elPNP2DRr4S1zQQCzmYz3jMgU86D5UHRD2TY4Szx4/W1ixrRLPKCI0O0p30EErgbQGYnBjR6OX8MBU3CaMBu8OkCV7Kmi83SXy0UObMhJwj6P7Vj/TtrIbQxW0vXGNz1UsAevW2n4Z0wY9yyaQJJKrxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 21:28:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 21:28:35 +0000
Date: Fri, 28 Jun 2024 14:28:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?=
 =?utf-8?Q?for_series_starting_with_=5B1=2F2=5D_drm=2Fxe=2Fmocs?=
 =?utf-8?Q?=3A?= Update MOCS assertions and remove redundant checks
Message-ID: <20240628212831.GZ2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240627203741.2042752-3-matthew.d.roper@intel.com>
 <171952712143.165830.7166918399743657779@a6498e030952>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171952712143.165830.7166918399743657779@a6498e030952>
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf7f471-0a9c-43f6-82d0-08dc97b944b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rzPgYJr3RzjL4hHvnmQV4qh5Qh3AgClS/8lkl1rglStH3om+qPCcj3bDEVP?=
 =?us-ascii?Q?lscw9inj4cJEbNWKePr8nfkNVAa5T/6k6J1JOnnr98llWRrzzQhrj00FnPLx?=
 =?us-ascii?Q?wZIAauRrfylHRKFQo0xjKzsVbp7OEc/7jjgHqOnqu1lADDPcy2R2uPm0xqsh?=
 =?us-ascii?Q?rIEvoeGtLk13LX7PznX/fe2Y2Fh3ztG4K/eUEvPciB4kNvoeZv1mBexbByXZ?=
 =?us-ascii?Q?jTmCxrD3/zykOu4ToYtEcppnbg2ei8MIAmQVIYaO3qALS4uWDY45hMaerDNx?=
 =?us-ascii?Q?hKEtfN/82Mbf4xEvNSeUD9n14465fugdkZxOreMDpwGryS/goODYvMzBMkRz?=
 =?us-ascii?Q?kvn/C3c+VB4a+OGL7EWeOZrseSYg+ROM9s9P0wiPBqIHw5pdq5/ZCWVNFNjh?=
 =?us-ascii?Q?L3xWMhpekpDmhC67eonQrgyfocz6JF9GBje6cT3atGHHXYCGrqlGZU7eW+DT?=
 =?us-ascii?Q?bEXOWyYBDPYKrHrcu1iTLr58VRccb/7e3HhAjEIIl+0OpDBemxcXpyQIPWfY?=
 =?us-ascii?Q?3FwqwLV8JCsA+EXwQxEqujEApaUUT/WlE4tZgbKCNtisyBxq4+FEoQCi6QgS?=
 =?us-ascii?Q?cZBHoHyy1HTyjmuojdQ5UBgEHfJv1mlJ6lgadoA8CZ7MQk76/RPZl6+EsYR3?=
 =?us-ascii?Q?Vc/YiBPc8qfk/vRninhBHtdiPqdiRfhtCAZ5Vz+Wvpk0qUrOZ4uSwdnU53xV?=
 =?us-ascii?Q?o8AS4xuWWWT1xBUOHf9qmz1lqLGv1S7HZZjzB5HGFW+SqNXG0iml3WMswWSI?=
 =?us-ascii?Q?ZklBLK5jg3IRSwG4iPsjrsGHf7xdynK0lNduHg5FrAt/K6WeYb41O0heBMvL?=
 =?us-ascii?Q?8pJuRsC97R663X61EGkNlVwuKm1emid4Li+t1GeQ7zzhhdSA2/syNhGLcWos?=
 =?us-ascii?Q?FyhH5Jw7nF8I2l96yAmLnZfryqO6RC8VI/flTFtbVi43TvKAYCm+Cq7jrDpR?=
 =?us-ascii?Q?7sJiQe7aFuSudyzJNEI1cClGwaz8356cfeQ1Yk5FUE1uuWUydQ0hbsZkPmcm?=
 =?us-ascii?Q?4NLoogHIZJVLnppImLgAcWsDrZrPY8k8w1L2Gv7t0M7yf3BbIbsIsatohLQn?=
 =?us-ascii?Q?15h77zXHheYiMunl17vx3nvkes3q8AtHs28dmvX1BDQXPocNTvnWiqaBKwCH?=
 =?us-ascii?Q?+Ck0hc4N3LDIofpFywvBdblrkfoSitQHRDo44dFdU5Itoj3DCN4OPeziuWVq?=
 =?us-ascii?Q?JX7W4PvBegLVF2SpnOoj7uU394YAEImTcNavbKIDDQMPo82c2CgjJUJX2hI4?=
 =?us-ascii?Q?u36z9MJ/qgn8F7Sm/H1/OnukJNR4P0BVs1xnLXANE4QZOTp5K84+2xrNH3Tv?=
 =?us-ascii?Q?YHU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X8EzD6c4m9EYiw9NhCsZVe+Ioi8atP57JJanll9tgOurmkD+OtdIGoOaEunv?=
 =?us-ascii?Q?UgVmNPEXUNhwsfJHk9I8aIFGOPkSGUVJ1k2akeOgNkO34T0QbxH8CL0ZvHTL?=
 =?us-ascii?Q?L8aqjb2jLrzTc0uvaIrWPLApHcp8mYUj5PsnHFMgazFhi84awyAcJ6GJZat2?=
 =?us-ascii?Q?dMI8edH8UgS4ST2HrVte06oO/cWeW+oJkYGAP/1z5ZrJcBApWkIU5vqShxKu?=
 =?us-ascii?Q?oUz8RofjzW8M/cnLa9KJJwNpMQQiBEEXYBU39nEtPYP3XF+BlkB0XHvC6X9z?=
 =?us-ascii?Q?JPympX9aRO+Z8T1qcximjCoubOm5dpvu/w0W6VVruA+TA9IdDwbwv6Z5jySI?=
 =?us-ascii?Q?NDLel7ENRMUwzVOu2DTRPLSiwLyR5dfQ40JbCQ+bIyA9CbvFc9XVEuIdlu+g?=
 =?us-ascii?Q?xj0FB3Mncvjcf6BW94GfCjGu+GrmA0cCoOBmKes9gLPufsVlVeqOH0tr3RmI?=
 =?us-ascii?Q?BOh0rgXUsjfnY/y+asq630qYFMjtxy04Uu9TSme5yKH/f75RasQyJbPyc5AO?=
 =?us-ascii?Q?T0ddTaAK1ShLDy+rIHBt2pQpMUQhFzQYTvscJrmGpiw1kHMK5houJ7Ltaipy?=
 =?us-ascii?Q?jh3eLIldG1zjYDsAy6fZ1C3rDfrR5ST1UvIA/3Bbjtd2CeXqVNKw6UQLgbg1?=
 =?us-ascii?Q?iPm9Sla3g9N1cwQCgRTm+AR33VmFFql7ogbOfkJtS2MdXkXXbzN11+E6lLEQ?=
 =?us-ascii?Q?8J+T1dlsJvLlxp+hDzYqNo01AGIFKQCj9iRK7n04NnNbym824mr98cQFgl0I?=
 =?us-ascii?Q?D2KOrzIGmKH+4KbdxX/65AEsaTg5Fox0QvTL7FplfNvAuknA5Saw4bnjMqP8?=
 =?us-ascii?Q?nXKjyRnNeipLb9jZjF1cQWZlApZsW5ppAm6Wg61pdB9aikV+NCs+FFE6xP38?=
 =?us-ascii?Q?yqqAhQL4t5zTQMhY6TjYwC78DAN+ces8NXnXk59CMDwih1oqutGGpUPjVNFM?=
 =?us-ascii?Q?XA7GK/SahGXTd6Kr9JqZBbt2XQI5eK6/u+46QmW7tAV4I9AZACxkWQvHEbLj?=
 =?us-ascii?Q?ll+mcaSKaLc6crOmirGqHxPO5ErAEkyevAm8izJisP7aZo8VkdVTu4OLUASl?=
 =?us-ascii?Q?MbiuhnckNs26HqUB6AVLU/HLhJ8pHiX4fZudF7qZI5rn+HAM06cFRbqjfSvU?=
 =?us-ascii?Q?gnbuw0TL5tZajTAe4OARlxLUgkLfuHx3/mX8R8CnZRc91aHv6jYb+jkH6xP2?=
 =?us-ascii?Q?uEN9b8x9Y17Qsx9AzT5qP9t/W71bp+nJB4Zq1JGbzmvSrv/e3frKrXfgX5UQ?=
 =?us-ascii?Q?gpXE/PX2WYXXAcTYu1QGvHjkN+ZC8XXuGKbrlGe22ij+WTTdQPXr/sqrRY7L?=
 =?us-ascii?Q?Xfq8I7oV9zbEEtor50yttvl1XK5WaJDq9ye7VTryWjWAQRdMF88hFfiVucZw?=
 =?us-ascii?Q?h+5OIglISJDaSUxJ88/UquNGWvjA8APhbospkBjpkeMXf/IK/VVLzoo2jMYH?=
 =?us-ascii?Q?yNKWzF5fuSdtiUd4m8x4yQx7b7pHF4skcOIkRpc47OgnkRcgrWu4DtTKJM2F?=
 =?us-ascii?Q?ujREzIYZOAkWH5S5WM/RyXbTEC1abnOQzHNpoAmQEd/7cXcbyfTBDzOYtGK1?=
 =?us-ascii?Q?257gxPzN94RO63OEqb0OJGVsW32V58clqugUxENuIRUIAEb+OjUYowBkJw8C?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf7f471-0a9c-43f6-82d0-08dc97b944b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:28:35.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKrEHQWiisBsuZ4rOfU5a2+UXfch8e9wx/0V2dAKo7Pz5CmZD8FfpeNuhoJuz5DM3VT1//+OTFipwOd9snleH+2+piM9Mr84DEvcONQMp3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

On Thu, Jun 27, 2024 at 10:25:21PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe/mocs: Update MOCS assertions and remove redundant checks
> URL   : https://patchwork.freedesktop.org/series/135489/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c_full -> xe-pw-135489v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135489v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135489v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-135489v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-hdmi-a-1.html

Test passed successfully, but the IGT runner noticed that lockdep wasn't
active at the end of the test.

> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_pm_dc@dc5-dpms.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_pm_dc@dc5-dpms.html

A bunch of display-related warnings.  Not caused by the MOCS changes
here.

Applied to drm-xe-next.  Thanks Lucas for the reviews.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p}:
>     - {shard-lnl}:        NOTRUN -> [SKIP][5] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135489v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1162] / [Intel XE#1214])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#1231])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#619])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#314])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#308])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge:
>     - shard-adlp:         [PASS][22] -> [ABORT][23] ([Intel XE#1553])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_cursor_edge_walk@256x256-right-edge.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_cursor_edge_walk@256x256-right-edge.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#1553])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-1.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#309])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1874]) +8 other tests fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         [PASS][29] -> [SKIP][30] ([Intel XE#1201]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1861])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#658])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#656])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#929])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#327])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_vrr@flip-suspend.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][46] -> [TIMEOUT][47] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1600])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][54] -> [TIMEOUT][55] ([Intel XE#1473])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
>     - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@xe_exec_fault_mode@once-basic.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#1214] / [Intel XE#358])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@xe_exec_reset@cat-error.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-rebind:
>     - shard-dg2-set2:     [PASS][62] -> [FAIL][63] ([Intel XE#1069])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-rebind.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-rebind.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#366])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][65] ([Intel XE#1214] / [Intel XE#569])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][66] -> [ABORT][67] ([Intel XE#1794])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-4/igt@xe_pm@s4-mocs.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#944])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][70] +2 other tests pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][71] ([Intel XE#1231]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-adlp:         [FAIL][73] ([Intel XE#1874]) -> [PASS][74] +3 other tests pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][75] ([Intel XE#1204]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - {shard-lnl}:        [FAIL][77] -> [PASS][78] +2 other tests pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][79] ([Intel XE#1214]) -> [PASS][80] +3 other tests pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][81] ([Intel XE#324]) -> [PASS][82] +3 other tests pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - shard-adlp:         [SKIP][83] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_invalid_mode@zero-clock.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - {shard-lnl}:        [DMESG-WARN][85] ([Intel XE#2052]) -> [PASS][86] +1 other test pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][87] ([Intel XE#616]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>     - shard-adlp:         [SKIP][89] ([Intel XE#1201]) -> [PASS][90] +3 other tests pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][91] ([Intel XE#771] / [Intel XE#899]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][93] ([Intel XE#899]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
>     - {shard-lnl}:        [INCOMPLETE][99] -> [PASS][100] +1 other test pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-1/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-8/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
>     - {shard-lnl}:        [DMESG-WARN][101] ([Intel XE#1330]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - {shard-lnl}:        [INCOMPLETE][103] ([Intel XE#1330] / [Intel XE#1622]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_threads@threads-shared-vm-userptr:
>     - shard-adlp:         [DMESG-WARN][105] ([Intel XE#1214]) -> [PASS][106] +5 other tests pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-9/igt@xe_exec_threads@threads-shared-vm-userptr.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][107] ([Intel XE#1414]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
>     - {shard-lnl}:        [SKIP][111] ([Intel XE#1192]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - {shard-lnl}:        [ABORT][113] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][115] ([Intel XE#1358]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][117] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][119] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][120] ([Intel XE#1033] / [Intel XE#1214])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][121] ([Intel XE#1231]) -> [DMESG-FAIL][122] ([Intel XE#324])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][123] ([Intel XE#324]) -> [FAIL][124] ([Intel XE#1231]) +1 other test fail
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         [SKIP][125] ([Intel XE#1201]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         [SKIP][127] ([Intel XE#1201]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-adlp:         [FAIL][129] -> [SKIP][130] ([Intel XE#1201] / [Intel XE#653])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         [SKIP][131] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][132] ([Intel XE#1201])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][133] ([Intel XE#1729]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#362])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#1500])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][138] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][140] ([Intel XE#1760])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7905 -> IGT_7906
>   * Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -> xe-pw-135489v1
> 
>   IGT_7905: 7905
>   IGT_7906: ae91ba26f657bf11264f64bd2dc21f471a5d18f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c
>   xe-pw-135489v1: 135489v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135489v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
