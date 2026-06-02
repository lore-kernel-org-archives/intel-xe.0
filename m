Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE0BCD5BD1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 21:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7FC10E708;
	Tue,  2 Jun 2026 21:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNj9zqdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0710E708
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780436026; x=1811972026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7jCGLWDqpMvnS5FQH5K+XjW37zfCFD36ff5Fy10vCgk=;
 b=DNj9zqdxYgXme7P8aa24qU4nkTMaErY+khCuXDxjdJBpFJ44hnKf1e1K
 3ATlqRKadf5sM4RwkRYK+FV8WzHmsGDzoK/ns2kOtD1V0jS0czjIWY5jr
 S9Afq3LcIO4oP8egRk06G1SdAkGqhhhXZiKtvZDASp1elhPxZ+1LOl1YZ
 DyrpbGxU4VpUXLwCAQdPJ2hv82qgz0T4OiZh8c2usb+PTOnItLdl8rKuw
 CjeyMcptko0hZcdx4nGiPcGRd3XctpvtYRq/pt6xDAgxsBHx413NR61hE
 8LzkgYVbEcytLZdz7+se/gVfTR4FOnHImK7Z8diE/veErTKw4jRBCRhrN Q==;
X-CSE-ConnectionGUID: jOFp5bDTTUiJFSoKkTCr5Q==
X-CSE-MsgGUID: +sp6XrTIQrqLXBg4HtHtpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80376096"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="80376096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 14:33:46 -0700
X-CSE-ConnectionGUID: sKaRHuvyQPCEh/ngmo5x0w==
X-CSE-MsgGUID: 7J+wxuwBQLWUqlCAWVIGfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="243169178"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 14:33:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 14:33:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 14:33:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 14:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szc+kKeZo3od7iqu3FLFy7fy51buThpH1TrQS2xRQk3+ts3UTBf1cmaQvXGb4PgVIKvMvsAyu3ixlPHYCEyWGOUlJYLMoz6XQ9rBrQi2dQW+GIqqck+R0hKL8a3ZkXsGHxZKNNzBuvAVjH3zsX81sd8m55VjQK6AGfz1oan5Kd+o24kOPj9byflFDsjT9A6kJosuLSC9dG74IZ36wvdoMVXRy73748PCxLGoa4x7+ZXi7PJsWWYykD9nkcSUh1ecAOxcwtkbFLFylSTmjZDaDD8MYRwKs+gSqTLyho4/e81UwUEoaejH6qNlrJ62ZYw1F23cVdYKSx2hf4TOu0yrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lrGMEXrqQzFwVo9Y7adZj5o882mcWaO2ff+EmshD+o=;
 b=exbaDdbu3ttjXDn9kwOR2ikQeJNBUVsOJ+IU1bG0VOu07yfJokUCxBf2cUXlZGvW3Tuea+giR8w0JdzpgKX99O7SHddTW6ZWLZPMdgZl0KXV4uiRsczjP7aucHZO0IRZjFHYO4GmFUiT4MU7Njq/pvD1EoEDr+I1+nMAOrSfKPnCHufNk4Dx5TdhIuYQqYpxPXw4in7q4nTz7CSToKVYK0C06RTW+yUNl2r3GoSKh32hRqlhqQxfEwyqLCPmmkrZl4HBnawhMu73xTuYZ1rKAUKLjAfJCzlFDChs0kArnxdLE/sKBYG2W5nubexqZKDmRJFbO5d9ZYmgAb+mOqOK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 21:33:40 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 21:33:40 +0000
Date: Tue, 2 Jun 2026 14:33:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/rtp: WA table context testing
Message-ID: <20260602213338.GE6214@mdroper-desk1.amr.corp.intel.com>
References: <20260601200947.2032784-6-violet.monti@intel.com>
 <178038036358.34044.1444196606726833021@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178038036358.34044.1444196606726833021@6beec6c84f66>
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 4439bb67-d690-4748-c4d0-08dec0ee9d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 55W6tU6Ht2P8kApTsI5fT4HvXn/CXQbI/iHGk7xsLdT0PU6e/4iLVcwE6L/v6t2m7ZOAzPUHWQ/g4s4r3FqHFaUvFvCWhrLG40QUIa4itADr8Zch0Qrhw9X+fKN9OXVj4VWk8d4JgCyNXglbzXxisI8gO+c/xOKaacaUSONneHnHIisnyqEoiwiIOE+C8PXIj9jxP8FsDAzo4wgVY78qEfQ+zFlADWoYAgM02oB0sYLCyacK9tvkF0W7dqfsJWY01OafYu7TXOc+DVnzh3aSWOoZqZk57pAUbVwWcGok8b0UXba/eeo8q4ocOARvZc3KpPnXHena2iy2rQMQHSRXDYN4l2ElnQCeH2BY+UyJ8LltB91HANdemlORZJSHZMySfkJxI/cT7OhT9Ia4//PI5qpL8oEMXuaO907pLY1fMFuw2WzKVsfoyPWVq18Gc41mftcKDyVXGRO4OpeigzUCvZBJ8baIUuMKYeHkh2n15+ANBwMICFADMX9V/UWw+z/djWUYwpWOQKBXMdV/VtObI9dpunlB5AHBBrFL+4j+4SXZrD1w4byLJxq8VxYnsQyU/cdlS1hYfcaGh/lR6ddadcl1ljSroV057ny++EYWV6Aa42dyjH6f66kdzb3Zfnn2PkxESrxtoAuFF6UbKDS4YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3h5S2wxZmUVxSHLQwukwxpS5vuf/wanCpGTh4xbVYUP8RrlCyheky0smIKh+?=
 =?us-ascii?Q?iLImvusu/qkrzHppFbvpIUgIqvGwsv5C2lgObr63Gado8gZVRr09o3+H9XgV?=
 =?us-ascii?Q?vNZATZhDHpTh1dPrl0az/t5tpOwCji0pfVLXkd51hSITEhgkrWs6FhhJ1Alx?=
 =?us-ascii?Q?nHPeQUltffLHAzKiuZou+R5FsVqssq0vQadAf5hcO9ON+hV/XXRtDgQCLCjg?=
 =?us-ascii?Q?ue9+7/SV23wb19xuluf8yC8u2gSVmsEwNlxMym600Qg2DfIJ7u0r44LtQN0a?=
 =?us-ascii?Q?FsWINUO9uufdPb7ES2420itzJX4BYxDCE05B6vTAeyO3qGk60EI+ZB5xTwKd?=
 =?us-ascii?Q?cHVThpK5LIBjCXmKRxpErUyiZi3CyEyUkK3h061p2BNb7SzYXHMtb5h0m3wV?=
 =?us-ascii?Q?OPnjm3jOwLk1YmoBOedJ9yfrWV3morP3F2wSEb943ePUU0ZhD+kQtkYs2jVy?=
 =?us-ascii?Q?StvkpKXgGTnmhSaxKksI6Igebv6tesOsYZYq53jUuJwU6FsnaRs2ry9ikc2T?=
 =?us-ascii?Q?IEwU6J3FgITa2aCfuqzaJ9FJo3dA2id5AaOlCSnXJThI7nR5tjT9NudfT+3y?=
 =?us-ascii?Q?eGkFB+pgchSKPWRW0Hl04niLTMgIUK1ayc4IEYBkDjvwsnmW0EonT5APZiwt?=
 =?us-ascii?Q?vgJc/1d4YiW9A5WvSzhsQW4FDzkzSqmI7Z28sUvXYDIzVhQWaxOemVzJX4MU?=
 =?us-ascii?Q?ggOecJN/Uval11eDF4J5YC2Jx6dfAb/KGnp4V6ht/l+Pc0QlpsL8RF0cDq85?=
 =?us-ascii?Q?pN194tmbrvJ/DIUCX8kZfIVAUVJM0VNc1aBpWHg08GB61nlb3bJ8wDouMofY?=
 =?us-ascii?Q?BYpPZKTGFSj6tiPNk+DtQbqJidvb+SpxQ792qclL8io6gVSNwr1o+xS99rii?=
 =?us-ascii?Q?m95rAf7OCHYTiKtjm5ktWyebnmQBAHio3uHwa40UMAorW/EgzI0xdIlvWNei?=
 =?us-ascii?Q?WZ9qClzrqUGL7oXFsEJeD+bjsFG6mHFMIbQE72qeb5tPLQkqO0Zpjz7z4Mxg?=
 =?us-ascii?Q?r2ZAcdijXN3mgTdsDcN4ze0us3r9Cf3lUvBYZqcWSPCw6blR4nxYUW0/wro/?=
 =?us-ascii?Q?9unaxkZyuBQSSAksqLYZ6YWR2pjhm3kXTPolDCSIdne63Og5YQBcNxqwF+Vu?=
 =?us-ascii?Q?MgvY+/Za20G/GSFX7Qv1vxVfAfzsWFBcIvYrVbXJ7z1oK3blLHAYp9W+uU8k?=
 =?us-ascii?Q?8FxLppt9cpajpJxDaBMTenASG73RObbWRQkmJbnwuBwJawMt0ogQnpFyp1e1?=
 =?us-ascii?Q?pGkbuGupXv+wnoWh43cLk3rqeOUdAbmpYSMKrULw8vmgDHALvf1WtiyHFDNq?=
 =?us-ascii?Q?yvwOawDO/VL9KTZgK6eN92uaxJys+F3CkEovbVthcaU38nCEZpKWxgxLBUaz?=
 =?us-ascii?Q?3gRGAZveFJv/qmJkl3ngKLOpIyvO/V9TQ60tzXs4GUQ1j1vyd99YM+M8RAzo?=
 =?us-ascii?Q?j/yRzF7jmylbl9Gt07BNfinU+LZJPdpSNcDiM8A7j36uz1iRkDvI/rVq/qYC?=
 =?us-ascii?Q?xTAi7k7oxA62+FjzF82r5/LAZ7rXADpzNSPFSZ4q7uicH000SqBmTc/k2GjV?=
 =?us-ascii?Q?G9ux2IR/kzB0iZn598v1r7RTivHzIKR0tot16TjqfahP3Cc4QSDwcMkSsivz?=
 =?us-ascii?Q?ESI0sGu1DYlBABDjLTdEhB7pde01AZQSHKYIOLLkRurl4y/0o9s9fSYbXL68?=
 =?us-ascii?Q?BZX4zGLQ1yYaRdoFBN4fmzZW6jwobYz807vEeTkwMXlpJDm0TuhvTCJykJaq?=
 =?us-ascii?Q?STOrrgrdbbzyQW35eIe4ormMgwS/eIs=3D?=
X-Exchange-RoutingPolicyChecked: GwcG5xvgd5rfkHAmh1zYZtAvk7dK8xcd5dwLkUQmqQyrOU79uw94fGnhhWjaWXjeAwwmpEmIxjC9OF3q09GJXesw0KZGM3qGptJnNB/cX041i4XALZCXnA+dehgi2ekgF2K2eN/6i6QMBmFcYqXORz7wLRTwXKaqzQZNquBdwx/OG78Lk0cactlFoMlILLbN1eDCNA34iba345O1k3OkJExzR3upPL4AcnCc+uM80AChSaM/jM/3WzTAO01azl9A7XhgjVFkIIHQWf0DCwv4LViThvxn1LJt50818AgDu/uL5RF962H3ZrRZzTdTfHyNi42F0NMcA1v9SPswJf4uXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4439bb67-d690-4748-c4d0-08dec0ee9d25
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 21:33:40.6281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx6+zdURZsDzXADdPOnXCnmNL9culOpU9mbNOxoyD9TdEHYv+pLdaPGtfiksyuT2JmU39fclo7xLSFt+jx09dH0dite/6OTxIt3RJnE4TxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
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

On Tue, Jun 02, 2026 at 06:06:03AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/rtp: WA table context testing
> URL   : https://patchwork.freedesktop.org/series/167692/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5175-70cada764231ccb4582e920560a93edd210ace01_FULL -> xe-pw-167692v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-167692v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#6703]) +46 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +5 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2325] / [Intel XE#7358])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2390] / [Intel XE#6974])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2321] / [Intel XE#7355])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4354] / [Intel XE#5882])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +13 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +5 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +16 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#7915]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7283]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7794])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#2029] / [Intel XE#7395])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1489]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2413])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6503])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2426] / [Intel XE#5848])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1499])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_eudebug_online@interrupt-all:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7636]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-all.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7136]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6874]) +8 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html
> 
>   * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
>     - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#7850])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-5/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
> 
>   * igt@xe_exec_reset@multi-queue-gt-reset:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7866]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@xe_exec_reset@multi-queue-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7138]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6964])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4733] / [Intel XE#7417])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [FAIL][47] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
>     - shard-bmg:          [FAIL][49] ([Intel XE#6078]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
>     - shard-bmg:          [ABORT][51] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814]) -> [PASS][52] +1 other test pass
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
>     - shard-bmg:          [FAIL][53] -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-bmg:          [FAIL][55] ([Intel XE#7571]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][57] ([Intel XE#301]) -> [PASS][58] +1 other test pass
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][59] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [SKIP][61] ([Intel XE#7915]) -> [PASS][62] +1 other test pass
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-10/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
>     - shard-lnl:          [FAIL][63] ([Intel XE#8058]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
> 
>   * igt@xe_pat@pt-caching-update-pat-and-pte:
>     - shard-bmg:          [ABORT][65] ([Intel XE#7893]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-7/igt@xe_pat@pt-caching-update-pat-and-pte.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-3/igt@xe_pat@pt-caching-update-pat-and-pte.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          [SKIP][67] ([Intel XE#1124]) -> [SKIP][68] ([Intel XE#6703]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          [SKIP][69] ([Intel XE#3432]) -> [SKIP][70] ([Intel XE#6703])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-bmg:          [SKIP][71] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][72] ([Intel XE#6703])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][73] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][74] ([Intel XE#301])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
>     - shard-bmg:          [SKIP][75] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][76] ([Intel XE#6703])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][77] ([Intel XE#4141]) -> [SKIP][78] ([Intel XE#6703])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2311]) -> [SKIP][80] ([Intel XE#6703]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][81] ([Intel XE#2313]) -> [SKIP][82] ([Intel XE#6703]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>     - shard-bmg:          [SKIP][83] ([Intel XE#7283]) -> [SKIP][84] ([Intel XE#6703])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
>     - shard-bmg:          [SKIP][85] ([Intel XE#6503]) -> [SKIP][86] ([Intel XE#6703])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][87] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][88] ([Intel XE#2426] / [Intel XE#5848])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_eudebug@multiple-sessions:
>     - shard-bmg:          [SKIP][89] ([Intel XE#7636]) -> [SKIP][90] ([Intel XE#6703])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@xe_eudebug@multiple-sessions.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@xe_eudebug@multiple-sessions.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind:
>     - shard-bmg:          [SKIP][91] ([Intel XE#7136]) -> [SKIP][92] ([Intel XE#6703]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-rebind.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:
>     - shard-bmg:          [SKIP][93] ([Intel XE#6874]) -> [SKIP][94] ([Intel XE#6703])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
>     - shard-bmg:          [SKIP][95] ([Intel XE#7866]) -> [SKIP][96] ([Intel XE#6703])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5175-70cada764231ccb4582e920560a93edd210ace01/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
>   [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
>   [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
>   [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
>   [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5175-70cada764231ccb4582e920560a93edd210ace01 -> xe-pw-167692v1
> 
>   IGT_8944: 8944
>   xe-5175-70cada764231ccb4582e920560a93edd210ace01: 70cada764231ccb4582e920560a93edd210ace01
>   xe-pw-167692v1: 167692v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167692v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
