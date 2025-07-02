Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49090C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEB610E0D0;
	Wed,  2 Jul 2025 23:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQq6GxjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1277710E0D0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751498203; x=1783034203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QaYsNtl431csM5EL4xm0CzITgzWN6xMnw6Z27ibgDb4=;
 b=NQq6GxjK0qdBFtgLl6Nz9oRUGqOKJLbqyOMaMWVytqJRTfBr+sFbWIL6
 3I98yUcX+t3BsDjANgTxM5nqKBaQ/17vXYoVVsW4RE3sdlnsrWDJnDzZz
 uBWKDyfSNmbr4nVBXbjtGUY1ln6wBJd6bWun3mrCfbl4XXtXIW3pCSago
 PQ6r+KseoNlWmyci2YfNe5+pDYvlIysfh4eoPFknjwzDBFfqjkm/5tUrZ
 +bZTZgzMA6C9FOqlckTxyfptpNi2KOcWC3a1Zjiw2kHpRRsP+/efq8A4K
 NUZ8AMuwPT8k56ypqAiU36hkKR7JvXFWSkHHAICXsRrmadW9JO0ESqChP w==;
X-CSE-ConnectionGUID: uYPHaRCjS8KUd/BBVTMC9A==
X-CSE-MsgGUID: GP24ztBURxKqKLGz/WfTMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65270316"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="65270316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:16:41 -0700
X-CSE-ConnectionGUID: kffKlr6NR1yZesQsJF1UDw==
X-CSE-MsgGUID: 7GSURrfcQNuQBvCKRuoCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154282765"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:16:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:16:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 16:16:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiPzW+QlXGd36G0FlDUfKp9gXEMtTOQtYFRjByxHzsMifLAnulQaMjXaZmqoNNAiBqv0QbobUCK6K0zIdefIdoJNSEDudi/OPr7OTrQya+2XY25iIEg3P2jN1X0Y52GieS+v/p0Uxuz4VIpoAUyu3QhkytUGXiD/kdneWcVVX3dy38z/YHDgt2TGhG2oTT57IowUBF9x3fzyPySFDLLH+BVby9Lu7J8juG4rxesHQcTcX/EnO1aRyyGaUiObSP6O75CHdJ4tZ/KaszJpbNW7+oPOGOqRdABscNNg4JdVXu/x78FYBPPJXCNWj8DLi3gs9mlfWfAyLDQM/5MUhxLLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn7N8Em7xRvzmm3pyuekSpRncRoADeTv+JQCtyURCbM=;
 b=dghQ1C90lCzWUN24taNFoyIUCrvsiDvVoBX9NgfDDvmanWHbTP+QWrNNvwLpAFglN6MQNoJOBcExVojHFQGSGASzq+Sy5yXcIW6dnVQfqQ0OqUDnamm+OTu6btRxvjD+wTcvuYXllORpKUg4e5RPi2JSlKGgOWAG0t6wRIfZaVZrfSX8oscxcE3BsK5xBh0w0WevaD/WZs2mRBRimZPKVIb1SXZpVICOCrPDkc9gu6W7TnmtEZhTk2qOUtjhR+SPh29TWKEQ2ZhDlhVRdwUmtrfRPUL5v46OAsiKB59CVm8xmoGhNTwkM1bCRrmXZsYPuMj5uoDpX0102QEC4Gh0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:16:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 23:16:35 +0000
Date: Wed, 2 Jul 2025 16:16:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 drm/xe/xe_pmu: Validate gt in event supported
Message-ID: <20250702231633.GH1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <175145405061.127999.6681369409882542959@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175145405061.127999.6681369409882542959@1538d3639d33>
X-ClientProxiedBy: BY5PR17CA0047.namprd17.prod.outlook.com
 (2603:10b6:a03:167::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f1858d-1c90-427f-9d85-08ddb9be7d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3S6hCy0IwtozPQ+PRyc530SsUULI/HaRMNHcbOIpTraPqpzc3r+aXvO2DEql?=
 =?us-ascii?Q?/b+O4eNEwRGccSxSlSawHZXULPi0InHrEaEbJupILipSxuoCGi9nzdix8x8U?=
 =?us-ascii?Q?AXfVLeAiolla/lJpbRseJ5QM+QseiWsQKq2zeo75NNyKuAFcyl2p6Ritta9/?=
 =?us-ascii?Q?gLGjeKuPUX+1wTy/8CS9O9p5pBlkDT3mc35RutHvSrKnjTILFLSoB8Y4LRV1?=
 =?us-ascii?Q?1bJEum7Ld2h3Rs4y1QMxXqk4k4Iw7wvr5DStQVWFD07YJD+zl6kv6s2Wjehe?=
 =?us-ascii?Q?LF5kb9zNXQTiOJ/0XJLvYvw40uiJGrFUDhbpseImzrd6Hdmnm5AXxxwIKJqL?=
 =?us-ascii?Q?jYqpeIoe0/ANkLAFVucuLKQL7eRYJhMgan6XfUFJ3aRrSKTZIm9K17C95+Qn?=
 =?us-ascii?Q?sYJhP/m41iICNKoIr4d8EDHlM2QR4zEQ3eSnsOzVwlySNjjLWS2Ts/tZIIrP?=
 =?us-ascii?Q?KIEOOuhPd9mc1X2WgkiahFlMjiYzo5hsKWgd47CoRTl6CRqibSf5SiZHRUD7?=
 =?us-ascii?Q?EHIdcgXy7I74Y63HE76FkxFudVIrCzG6kEvL/ydAw5yUxIlGuEB5ZB6a5RVD?=
 =?us-ascii?Q?Mzi0+HXoTTm3gixRBAikE45x7h4q4ZgEXpG2CnKuI1UVajOccW54Cp5iIPFO?=
 =?us-ascii?Q?BKY6BKL7Bdd6rvwzjq8rUnO1LBxzVDkauJKCYJXkx3bRSooQ6ddtjTqlhOHN?=
 =?us-ascii?Q?l9S7U8B/oChM1wirlPJlXbJ6NStzktj1a7NiNhfF5SGoKkQ8O0xbG90oIezg?=
 =?us-ascii?Q?642CZ/98ku+/JOiJZCskQK5W1wQ5iMhBTs9DlaaMJ6j/1UzYRcdVPn0TJhiZ?=
 =?us-ascii?Q?5kEKJffMu6vZpugZfep+nLbi0E4hSq3YharHpr040WrC4jSuMKMHr0tvAJKd?=
 =?us-ascii?Q?FMqL1cCGjPQLCaz4IbrwqCGk/GUvA43a31lUzbwJz3e4Gd664EemDM+INS9G?=
 =?us-ascii?Q?iC6YloeocjDD6SryEoXVo7oi/h7DdXD0Dzqp1OnPiIGgCy0ja+7v4PmqukrQ?=
 =?us-ascii?Q?+X0eNmkZs4FdgWlAQGJUxopugu19OaS2nqMHkG1ThL5OEghcYu59Vey4CaB/?=
 =?us-ascii?Q?JUbO4/05A9Uwc7/KiCHzfirHayNY4CZglUfAwjl/u9HhjZOplFdhumtNVWSB?=
 =?us-ascii?Q?/0+2uQWnrBvLHsYo8usyYMAMqrBxFRtJfiMPDYIpa1APKDqEENA41nyM8gLP?=
 =?us-ascii?Q?7xccJ8a4W9SMYvvzByYj3W8u2VcbW8BiDNxc7MzoA9OPDaY8iEfnpPZwTf1D?=
 =?us-ascii?Q?d0Q/ixWNnE4Q8whdTcdD3kVam8JE3iSP0b6VDkq7jZ+zqIfkPwxp/SFWQF1w?=
 =?us-ascii?Q?WW00ewgUhG94Auc4qvvAzST3PItx3ZdU8lZBAHJ/0vnXaH13Pqk6LQnPuThA?=
 =?us-ascii?Q?BiCxCZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laN51OQ9Q/zV0moHmz+NkF/k9u+LLHHGlqpL4nAYyHEU5wbYrGgQqNCKUXOR?=
 =?us-ascii?Q?GnEueR/Oc5wvGgnr/RTH0nL44ZkUxFmbDScRrsUrVCW+iKUiC7SMeFYJqc7C?=
 =?us-ascii?Q?qqc8nl9cF/PCd3jkWMoXjQqbChMQOk7NypBl5N3mjji+u8/I2rTOxquYmCRN?=
 =?us-ascii?Q?EaIzV1ZsC61jGtTGKFEHBGvZUQbFVO4x1XqI4q4phO+kM6swlZSmdqli5zZV?=
 =?us-ascii?Q?g+l4X+nwQg8pGSRWWp3ug9Qq0XAnPLhzdkR/FrY7nsqABHJwyqogEdWGa7li?=
 =?us-ascii?Q?OKCJi2/7h0ggwxoEPrrfpk85bchya70+Sok5fobfvBTpJFC9BRt9GIOW0nqy?=
 =?us-ascii?Q?8XAKgTtauT81BpOFiyueKtrsJvb07I6ONYPk6BTSC8+1w0WMhMVDH/QLC1Cy?=
 =?us-ascii?Q?Ny/fEjeXenz/nw7TMyg3cOx+X6S9YC+ZnTvv+I+gvLDPLdcG3R1MLHz7mOoE?=
 =?us-ascii?Q?wuKk6mA5puQqT0rROfWt2p/4Nvo8bEU0fjG8ZLOokdCHN4vJV1W4bgVTJ8eI?=
 =?us-ascii?Q?KSkTOZtjLWza58FuGRDLhwpuK3WXZ/MdGWa8lt0LTGe1VbEbmU5yVtDaEJMt?=
 =?us-ascii?Q?DLZOuTTEHqlgQkztVaNhXNdESNd0akd6CX+hegIzVMeWXK94wMwTsc+rQl5/?=
 =?us-ascii?Q?nqYERsSv6qOs02A9ySGR+XZ6qubAjecKtBFuSjf+D4nGgfCCj5Zk8/vD3Eri?=
 =?us-ascii?Q?O0Nb45GS1lxTTvmaLLP2lN9LXWvFf1xSgnt5evwfLTj958mDUN+sZYkR3YvB?=
 =?us-ascii?Q?6XuCJnA/JszoCKyueOqGvqfEfmPZncHBh56TeicMV3IH0nRLf9ZdUYyoK2v7?=
 =?us-ascii?Q?QlqC8goIzr/Y9YWZjcJZjRl1fZ9SDiTg4WB2qLQTkRxJBFoZQwgYbyX3fXMC?=
 =?us-ascii?Q?6eJog7roEMsrG7ArBPFheVLYoN978fmXMytxeFdNYg7LqcVxi31qah/SS68q?=
 =?us-ascii?Q?Z8BzNT7Lfw7uf/RhH0xI5MT8aIDTo9d8Z4fOIHZe1R1C3CRZT3MqNn04SAyi?=
 =?us-ascii?Q?UclgBLaYfTMhvjwdaGQARMY8BbLIabLSdwZpTHJLKN9uVeHAMQOCrYGgxlqO?=
 =?us-ascii?Q?PKm/fydE67hIapWRGLKK64bryzdmGmGaeuJGleKrgkC9eL5L7QMg1DwYYGSm?=
 =?us-ascii?Q?/92HAbQh1suv5Ak68x+Et/MOPogu6pq7Pb5OxrgFLqeaEC5ajFiv4mt9sVXH?=
 =?us-ascii?Q?50aWg0lgkP/yeP9nI6x3wDkJ5nCOEbW1QOmDmUbuRUGrBsdAToQDDcN1ecBA?=
 =?us-ascii?Q?Z5/PLiMHs5VyYnx8BK30/oiPGZ61dV6eZb2ULayBvf6gz3j7XFEPcNwA1POw?=
 =?us-ascii?Q?dNqcxrw8ulAyt9oiW+TyVtKVLGXRam6YbxH28Z4jC5wbEmG0Fu6TFE1uxscU?=
 =?us-ascii?Q?W8u5lKMJn9Rh1GaXzb2rDOPN+PNhCeePCSJHNW+oPvt9R3dhGCiw76uRpG5p?=
 =?us-ascii?Q?cqqfep/BgYoC+3t29EZWOvhJW3Dgrj5TZWX2HeLbwTRNDgwbh50nor2LcWxu?=
 =?us-ascii?Q?2r5AcUtaDOSEtK8+600MW8qNTlNeIEn2UD8vNvuvPyKoq1su1UEs6wl2Zas1?=
 =?us-ascii?Q?dGze0JeBHpgtWeBZKWocDlTnqprRD/pCrGhE0w4aU5dgi+PBsALLIyUJqrgf?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f1858d-1c90-427f-9d85-08ddb9be7d6c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:16:35.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbMjoVuZ8xolJa2UZtEGQUPG+BDDX9X0/t7AYtzmep76n6T0QkGN2N7+b7rZ1D4q1SHuJDRd+fM0Jbmv2G5fatZ3l030pqMkVUlCVsrcKzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

On Wed, Jul 02, 2025 at 11:00:50AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe_pmu: Validate gt in event supported
> URL   : https://patchwork.freedesktop.org/series/150943/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_FULL -> xe-pw-150943v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next, after the GT refactoring patches that make the
lookup work as expected.

Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-150943v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#911]) +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>     - shard-lnl:          [PASS][6] -> [ABORT][7] ([Intel XE#4760])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][8] ([Intel XE#4543])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#610])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#610])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1428])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#4543]) +7 other tests dmesg-fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#367]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +7 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#3862]) +1 other test incomplete
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +237 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#4416]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +10 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#307])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178]) +2 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1188])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#308])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#309])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2291])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#4633])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4354])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4354])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4356])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1135])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2316]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#310]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
>     - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#4543]) +16 other tests dmesg-warn
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#301]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +15 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [PASS][66] -> [DMESG-FAIL][67] ([Intel XE#4543] / [Intel XE#4921]) +5 other tests dmesg-fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401] / [Intel XE#1745])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1401])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#1874])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +10 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#651])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#651]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4141]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +35 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#656]) +7 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2312]) +3 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#656]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653]) +32 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2313]) +8 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#653])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#455])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#3012])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2927])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2927])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2925])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +3 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#718])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes@plane-53:
>     - shard-bmg:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#3428]) +1 other test dmesg-warn
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@kms_pm_rpm@legacy-planes@plane-53.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@kms_pm_rpm@legacy-planes@plane-53.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1489]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2893])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4608]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1489]) +6 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-cursor-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_psr@fbc-psr-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1406]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-2/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2414])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3414]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3414] / [Intel XE#3904])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#2883]) +2 other tests fail
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#330])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#330])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2450])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#455])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1499]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2168])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_vrr@lobf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2168])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#1499])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-8/igt@kms_vrr@negative-basic.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_eu_stall@invalid-gt-id:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#5308])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4837]) +11 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug@discovery-race:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4837])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-1/igt@xe_eudebug@discovery-race.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#4837]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4837]) +5 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_evict@evict-beng-small:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#688])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>     - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#1392]) +4 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2322]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-null.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1392])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288]) +23 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#288]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2360])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_system_allocator@once-malloc-fork-read:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#4915]) +17 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-8/igt@xe_exec_system_allocator@once-malloc-fork-read.html
> 
>   * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4943]) +7 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4915]) +256 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-new-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#4943]) +6 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_exec_system_allocator@twice-mmap-new-huge.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2229])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2229])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2229])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#512])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164]) -> ([PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [SKIP][189]) ([Intel XE#378])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-5/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-7/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-2/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-4/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-1/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-8/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-6/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-6/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-5/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-5/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-1/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-4/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-8/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-7/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-6/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-7/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-4/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-2/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-2/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-8/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-5/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-2/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-3/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-2/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-6/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-1/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-2/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-4/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-1/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-8/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-8/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-8/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@xe_module_load@load.html
>     - shard-bmg:          ([PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214]) -> ([PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [SKIP][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240]) ([Intel XE#2457])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-8/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-2/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-2/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-2/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-4/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-4/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-4/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-8/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-8/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-4/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@xe_module_load@load.html
>     - shard-dg2-set2:     ([PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265]) -> ([PASS][266], [SKIP][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291]) ([Intel XE#378])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-433/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-433/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-433/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-464/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-466/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-466/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-464/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-466/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-466/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-464/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-464/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_module_load@load.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#4501])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-466/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][293] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@xe_oa@syncs-ufence-wait.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][295] ([Intel XE#1173]) +1 other test fail
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#4733]) +1 other test skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#944])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>     - shard-lnl:          NOTRUN -> [SKIP][298] ([Intel XE#944])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#944]) +1 other test skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_render_copy@render-stress-0-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][300] ([Intel XE#4814])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_render_copy@render-stress-0-copies.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#4130])
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][302] ([Intel XE#4130]) +1 other test skip
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>     - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#4130])
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#4273])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][305] ([Intel XE#4351])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>     - shard-lnl:          NOTRUN -> [SKIP][306] ([Intel XE#4351])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>     - shard-bmg:          NOTRUN -> [SKIP][307] ([Intel XE#4351])
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][308] ([Intel XE#911]) -> [PASS][309] +3 other tests pass
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [DMESG-FAIL][310] ([Intel XE#4543]) -> [PASS][311] +11 other tests pass
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][312] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][313]
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][315] +1 other test pass
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][316] ([Intel XE#2291]) -> [PASS][317] +4 other tests pass
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][318] ([Intel XE#4633]) -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][320] ([Intel XE#1340]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-bmg:          [SKIP][322] ([Intel XE#2316]) -> [PASS][323] +3 other tests pass
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [FAIL][324] ([Intel XE#886]) -> [PASS][325] +1 other test pass
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
>     - shard-adlp:         [FAIL][326] ([Intel XE#2882]) -> [PASS][327] +1 other test pass
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][328] ([Intel XE#4543]) -> [PASS][329] +16 other tests pass
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-2/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][330] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         [DMESG-FAIL][332] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][333] +1 other test pass
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][334] ([Intel XE#1874]) -> [PASS][335]
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][336] ([Intel XE#5383]) -> [PASS][337] +1 other test pass
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-433/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [SKIP][338] ([Intel XE#1503]) -> [PASS][339] +1 other test pass
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_hdr@static-toggle.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][340] ([Intel XE#616]) -> [PASS][341] +3 other tests pass
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [SKIP][342] ([Intel XE#4596]) -> [PASS][343]
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][344] ([Intel XE#1435]) -> [PASS][345] +1 other test pass
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#1392]) -> [PASS][347] +5 other tests pass
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][348] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][349]
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][350] ([Intel XE#2311]) -> [SKIP][351] ([Intel XE#2312]) +11 other tests skip
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][352] ([Intel XE#2312]) -> [SKIP][353] ([Intel XE#2311]) +14 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][354] ([Intel XE#4141]) -> [SKIP][355] ([Intel XE#2312]) +3 other tests skip
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][356] ([Intel XE#2312]) -> [SKIP][357] ([Intel XE#4141]) +2 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][358] ([Intel XE#2313]) -> [SKIP][359] ([Intel XE#2312]) +9 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][360] ([Intel XE#2312]) -> [SKIP][361] ([Intel XE#2313]) +12 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][362] ([Intel XE#5021]) -> [SKIP][363] ([Intel XE#4596])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][364] ([Intel XE#2426]) -> [FAIL][365] ([Intel XE#1729])
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][366] ([Intel XE#2509]) -> [SKIP][367] ([Intel XE#2426])
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
>   [Intel XE#5383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5383
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8431 -> IGT_8432
>   * Linux: xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86 -> xe-pw-150943v1
> 
>   IGT_8431: 8431
>   IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86: d9007d535ea106181346f9988c97aa73a9cdfb86
>   xe-pw-150943v1: 150943v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150943v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
