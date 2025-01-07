Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25352E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 23:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EC710E350;
	Tue,  7 Jan 2025 23:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4sQFl5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FA110E350;
 Tue,  7 Jan 2025 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736292453; x=1767828453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KJtTS/EUwJmcEmKhhImlFGoZPqSUM8h1aGPVYKaMpv8=;
 b=C4sQFl5Ty2z9mJbykAQSwwlNluUjRbMz0TJxXWkmnKw37bMjlQ9DGR9z
 FosP5/4qo8ypSIyLjfv50SpONnmTYxr7H9UFyKViYsgSeijRzEl4emmg7
 C6AHkUvBIs/sdZI833Zro9m+HB1p8ugmymCINuxxPm/l/GRTESSzbR+TP
 M6JJjx4AhvFZ+xiU5e7SrEBlNoEYp8ZVReh66abA1jVbVfGV0nVcXVjsS
 Mu27yjflxDAGA+RizGlLZLsCRVDJesuC+yXQZdI3JCbyRJketMMd8M4JV
 tVQb5da0Z7gGN2qoAllocJ12K4jOPzDQThW5uG+b4HUeI0q9C5Lsm9SxI g==;
X-CSE-ConnectionGUID: DMiRRmtXS46qNTJshoaOow==
X-CSE-MsgGUID: vLsHUk91RrW4PeIJF2NcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36521579"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36521579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 15:27:32 -0800
X-CSE-ConnectionGUID: H9vLkNCpQDiFhI92UVNNXw==
X-CSE-MsgGUID: a3eeiiTsTM2jxTPAxsriZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="103404775"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 15:27:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 15:27:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 15:27:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 15:27:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4rNO8IG482Jjs/TzSEBFYMh7Q4D1AWpFS6QbCXeK6EHzKA+YDP+w35kNnW2/wCqmMWIeUzPinZVArqvBLQiU47z7ufeGOf0vZTh35+t4GkNUe3Ccs6YtXYcbEyLo3J93plxW1rREMDpvFuKY66vqwMHJQLpq2sHc9ybvcWFu5IKoWCTKQC56OYXSx/Y2n+p1DXS0LygdgxXAN8nb9wSdO58pl4qqTZ1RTE/Xk2CRx2tB5CA+g+bYoi8PQ+y9PCeoNN14Ov7lbGTYPdc91f/gkxv+1ElVwo+mJD/cMgcbBwBfiDlGnrP3x/02WJ3pVN/bZIM4iX/xmVtB9TkMflMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZGFg85Vn+JQYTZL2R5RThVUkQFgMpbEvwLZeByHtSg=;
 b=h2edS/w3ViI4kRNeDaFwdIIf/N9LBDtNgKqEcCBcl59aJQxsdws/P4e4x0YiB7ou6VLU5ahSROKvEx9Jmkv4f95oihMi4WeNq8zHWQsxpGjDYtl9y2gnuMEra4NkXBw6cN3U+mRKaF+4+2GQH0L340tYbgoIU+JNF65gDclYIImalnS+NBpoPp7Y5AgTbAx6lDyoyCcUl4VmJaKQOmVwvOYaqID/CSvWwupFLddxGwvRRgiAmBHjYpThe8Xt61ULlec8W8eFpmOx96VOnXB+bMOb2sw4+z4bgI9Z844rR/4RjqAZ0dcq2xZuoFN7/FZsaWmih8mkYDABLO0NkIsXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 23:27:27 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 23:27:27 +0000
Date: Tue, 7 Jan 2025 15:27:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>,
 <lgci.bug.filing@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for VF:
 Avoid reading inaccessible registers (rev2)
Message-ID: <20250107232724.GD3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
 <173390605717.1143111.14752770458168021256@b555e5b46a47>
 <72f5e14b-5e10-4fa4-96e8-3eb972946ae6@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72f5e14b-5e10-4fa4-96e8-3eb972946ae6@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ0PR11MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0e4cd6-9926-4573-2eae-08dd2f72d90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lG9uuKgp6vyBk5/58TFyOcGvHDPgNOJV4lSI9kUz7gvtoBeWR5lgIKkISVpz?=
 =?us-ascii?Q?Ycu7XrnTZbemegGlitS53Np2+jSPaZIx125ewqIKtEsMroEdUk/Nm2NHretU?=
 =?us-ascii?Q?soPlpPIbdPhIlEaFtHEJoAjeIjy9Hfe7fHSEuT2juLoG32jM/4hzwhIn8zMq?=
 =?us-ascii?Q?QCx5s1ly0Gcit9m6XqYsQTM3YT41qnMRAW3L8AiC4JbsknfuN5XZwihfvfSD?=
 =?us-ascii?Q?j5GWSj0bT6xHpZtZpE5x1lRJ3cX8b33J8/BRBVKWaNRFT/mLrM9+vbxOVZn1?=
 =?us-ascii?Q?tq/zxh508dNWsnNyHh0jJzDl7uinrTtJL+lRAZ/IGJrdb7qTwAZdghPDDAP2?=
 =?us-ascii?Q?iEWtu95LobR+FOO5jMGJA0z49Y97LkPXaGIG/MDhkwztYnShNDhEewa2Fkc+?=
 =?us-ascii?Q?FFttzCrZufd1niUqkAWDirhN03ZanXZhTxzQ92IurB6lDT5ifGU3pzq/I8ZY?=
 =?us-ascii?Q?+uka9x2+S4m91Cway8X1OAgx90f5A8gTOE9Ou9AcPFKfhNyj3LTx1ttiaPh2?=
 =?us-ascii?Q?oStgZIUSx7SR1zVBNWKSTaqn1wV1JrX7EnnJgoI+84AWCjRf4erUJ+bg1kxg?=
 =?us-ascii?Q?0edUphBuaBoF5lRpBsZCwIrPJLplIej8W7hNOmZgq9STeJOULQHy1ocJA43o?=
 =?us-ascii?Q?ZJrZQZzgpj3/3fWXfsfeRAIGWHLAc6PZaACegeJ61dnD8S6YQws5huYC2l+A?=
 =?us-ascii?Q?1FXn/NrRBFweBHMwwXgd6QBN0+yWLvLZWOJCd20Z3xIBK1jEnSfSNNR75gKY?=
 =?us-ascii?Q?KMsft/got8gqaYCbjVLJyVlgx2v03TDeU0NwbMvLHGPJu67Di+xAk8T69gBl?=
 =?us-ascii?Q?QeqLJdpjw6bWwgsTKpGcSRAaeMxS6JArjKtu6aOPU3tifGF5yVccWOTVHDPT?=
 =?us-ascii?Q?y3+qk4h5WfFiYAz2AboVUOQrAEVqrKj8Df65gyKLzXlr+4/ldhoMkDXvUvZp?=
 =?us-ascii?Q?6usDiwqp9bzFPMOc+H1ZHaG7rJOmPmehAgZL47N6i+2Ca767cpzqxgJHZn5K?=
 =?us-ascii?Q?pywXNdu33kTSAGzLUKb2YXaVPElf7rZC5J2oiVvH048X60spbqP9mXkQpd61?=
 =?us-ascii?Q?aF6sgZbQxr6DOI6FC/ldYD+dCxsFRCa+eJ38EfNYPViUpvP9Hf0gSnhgctzh?=
 =?us-ascii?Q?Q9Fy8YC2aJ6nXtG8ijNQSuE47h7ojyKXZk1esl25FVEUeA25hALr9MDxif7I?=
 =?us-ascii?Q?cZruydIauEmW7hpF6ay/bGiczizMFsWIRgKE570TQGcf2TIzG7hZB5Tc5a7W?=
 =?us-ascii?Q?Ui0nXycKJ0earzgcA5EduWJCkEs4l73B9RVv2Aw+I/+VYRosgG9dP7qGo8Co?=
 =?us-ascii?Q?5UblngPl1WLoZ5DuCwzZXnVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xIChU2U0X+cwmR4tXlnEyv1eshSoOI+vmS51lfOdqpn6wHWK83DGad16F2ye?=
 =?us-ascii?Q?Yge2GrmpXmVOPN3omLAvAwztuyjbvOr6sniduVUZuokgvGJ/ty4zjbr4nNiy?=
 =?us-ascii?Q?6d3Noc3zacBaVW1x5WFFyllFfPycpsArljz5vtGcJIxtSvN8bNue17Q6p89Z?=
 =?us-ascii?Q?15mPQYSU+Si+QGcHflHSDD25wVmG2glGrjq407TP3FysIlTLr7wOhcPXThTn?=
 =?us-ascii?Q?n8a77Z2uc5GKNYvGMk6ejIucjGVFSeSSztISFSEmq542uMbav6LZYO9BqDWl?=
 =?us-ascii?Q?Ow0WBEl4Rgp1DeNg4UJwwL/EH/p8WZwXwKjPi8WZXQK6QhI1GNGqTM2JADJy?=
 =?us-ascii?Q?NxghRRCgagrUg0qBZuCmwWt5+VIg3JD+l5w2LKdoqNgTml0kGzsweZ8pF6AH?=
 =?us-ascii?Q?QmPEwstxu02/mQVdk5401T3u8ACuw3GD7M7XwYRfu2HV3kQphneI4YpzYruE?=
 =?us-ascii?Q?KE2FitqGbI5Uhaz2Wmk5I4k4+srQSgakaJU5/mhws8NrqK3nlMGMQnU5Tovg?=
 =?us-ascii?Q?nycJcJ9osauJ9FA1zFHfYX04F+O0xgfT+ldO8B+lzRbvFxl7AWSeaJgvw25z?=
 =?us-ascii?Q?pbLNUqkJBL8FeHFiDx7KMehkriNY7md/HFspw+F9/RtFuW0IKHWVkIP2S1rI?=
 =?us-ascii?Q?kB6lmlo3evmHDwr6UgI04kM+CEMFl8hWfBO8grEK6Lve9RrbHrJPR69U4tm4?=
 =?us-ascii?Q?h2C2wfJK9cc+LiVuzqx7lQwFrhHmRnyMog556u8/r61il0PS7npTDRAjeoIE?=
 =?us-ascii?Q?8WmYRH+fWHoL5Zj/KvXy71wm3cDolAz52RX1muIh6dFZckaY+8sK+NHVRS9g?=
 =?us-ascii?Q?02LzsPqzQT4QfsHxMoCZhgPSKfbueESu8Dzs+RWEYqSqNZwc9d+re0Ai37Ep?=
 =?us-ascii?Q?vJQEyimsgQar+DeruWoYgyF0aMeEpV+5I5KyKuTK6C9DBQBzMzyiGcdfMSAW?=
 =?us-ascii?Q?UaMO3KoWzrI9N4lpygKENJ+43X4eGfdlUb6dVllfKEhV6/6JQn/8yVOj7E/T?=
 =?us-ascii?Q?VCQs1jw5PK54GVqQoRJAPRnMMganzq/+keIVNZtsLIcb70y1yO5ZByD0w2k8?=
 =?us-ascii?Q?elQ4K37v+2YjCdnmg9SORlvtA+MbSzn9aMcAnvP4vATNkgxeIqSeQEoyszZq?=
 =?us-ascii?Q?s7f9oiHz1BEn0bCPpsxtrNVzPHbmocQvWvAovrmtt4wdz4UO0+CEa6XN7Vrl?=
 =?us-ascii?Q?UvSjyVGeZt0XrRqxOh2DZBqQi4zYJL1p6FkaSQ5tqZ+xAjm7RhQkx7I9YQuC?=
 =?us-ascii?Q?9yaIu5DvOD0PvpHB/i+BkH0h3N3H23eOF49GJ/7L8rQ5Ucl0Y4ueZ8ADHi9T?=
 =?us-ascii?Q?wmNGqnNPazp7KjL2pa6N+VfX97fHlR7WRBabiTAcMj14PhTkOBxVL7SsK+Lr?=
 =?us-ascii?Q?ybzOi9bd8R61I9Yp3SPKo20E60n4etb8q3M3SQoSE9YqHwI5iFH/bpiqCKw5?=
 =?us-ascii?Q?DxkdKLLtqp+naRSRIcluool/2Nxb85GpxhVFwQOHN0iIFW42AzQlDoBWjv6V?=
 =?us-ascii?Q?U6O2sKdMfpCwgEPnkqJuB2mQjquUb9f1jAITdFYfuiJgAhrJgegX05rWd3cJ?=
 =?us-ascii?Q?420kgaKh+p4TAjSMmqSst3cfReBsUa+u0vOdGhlCVMxVyVCcUR1cY7hmeF0d?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0e4cd6-9926-4573-2eae-08dd2f72d90a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 23:27:27.3274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcBbepWyeJb6fNEiJ7sR8iI8gOFtxz131ENhkas6Ni3rSVOk3o0q/pyDMyAYkUgwpN41K4ACpb/fufNHNMr4fj0ufzZZp/uhdx3I8F0coys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
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

On Thu, Dec 12, 2024 at 12:55:57PM +0100, Bernatowicz, Marcin wrote:
> 
> 
> On 12/11/2024 9:34 AM, Patchwork wrote:
> > *Patch Details*
> > *Series:*	VF: Avoid reading inaccessible registers (rev2)
> > *URL:*	https://patchwork.freedesktop.org/series/142196/ <https://
> > patchwork.freedesktop.org/series/142196/>
> > *State:*	failure
> > *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> > index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> > index.html>
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_full -> xe-
> >   pw-142196v2_full
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-142196v2_full absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-142196v2_full, please notify your bug team (I915-ci-
> > infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (4 -> 4)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in xe-
> > pw-142196v2_full:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
> >         prefetch.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@xe_exec_fault_mode@many-
> >         execqueues-bindexecqueue-prefetch.html> +1 other test dmesg-warn
> >   *
> > 
> >     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
> >         timeout@bcs.html> +3 other tests dmesg-warn
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_async_flips@crc-atomic:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
> >         adlp-4/igt@kms_async_flips@crc-atomic.html> (Intel XE#3086
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
> >         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-adlp-1/igt@kms_async_flips@crc-atomic.html>
> >   *
> > 
> >     igt@xe_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-
> >     vram01-vram01-multicopy:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-
> >         vram01-vram01-multicopy.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@xe_ccs@block-multicopy-inplace@tile64-compressed-
> >         compfmt0-vram01-vram01-multicopy.html> +1 other test dmesg-warn
> >   *
> > 
> >     igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-
> >         race.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html>
> > 
> 
> Not related to the change.

Applied to drm-xe-next.  Thanks for the patches.


Matt


> --
> marcin
> 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-142196v2_full that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@unused-handle:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_addfb_basic@unused-handle.html> -> DMESG-WARN <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_addfb_basic@unused-handle.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +11 other
> >         tests dmesg-warn
> >   *
> > 
> >     igt@kms_async_flips@async-flip-suspend-resume:
> > 
> >       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_async_flips@async-
> >         flip-suspend-resume.html> (Intel XE#1033 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
> >         XE#3673 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>)
> >   *
> > 
> >     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_async_flips@async-
> >         flip-suspend-resume@pipe-a-hdmi-a-1.html> (Intel XE#3673
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>)
> >   *
> > 
> >     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
> >         a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/1033>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_async_flips@invalid-async-flip-atomic:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_async_flips@invalid-
> >         async-flip-atomic.html> (Intel XE#3768 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
> >   *
> > 
> >     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_atomic@plane-
> >         primary-overlay-mutable-zpos.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_big_fb@4-
> >         tiled-32bpp-rotate-90.html> (Intel XE#1407 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_big_fb@x-
> >         tiled-64bpp-rotate-90.html> (Intel XE#316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
> >         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-
> >         flip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-
> >         hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_big_fb@yf-
> >         tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-
> >         hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
> >         other tests skip
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html> -
> >          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-
> >         displays-2560x1440p.html> (Intel XE#2314 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
> >         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2894>) +1 other test skip
> >   *
> > 
> >     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_bw@linear-tiling-3-
> >         displays-3840x2160p.html> (Intel XE#367 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >   *
> > 
> >     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_bw@linear-tiling-4-
> >         displays-3840x2160p.html> (Intel XE#367 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >   *
> > 
> >     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-8/igt@kms_ccs@crc-primary-
> >         basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
> >         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/787>) +7 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_ccs@crc-primary-
> >         rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html> (Intel XE#2669
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
> >         other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_ccs@crc-sprite-
> >         planes-basic-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_ccs@random-ccs-
> >         data-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
> >   *
> > 
> >     igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-
> >         hpd-after-hibernate.html> (Intel XE#2252 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
> >   *
> > 
> >     igt@kms_chamelium_hpd@vga-hpd:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-
> >         hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/373>)
> >   *
> > 
> >     igt@kms_content_protection@atomic@pipe-a-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
> >         XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2715> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_content_protection@legacy@pipe-a-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@kms_content_protection@legacy@pipe-a-dp-2.html> (Intel
> >         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_cursor_crc@cursor-
> >         rapid-movement-512x512.html> (Intel XE#2321 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-suspend:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_cursor_crc@cursor-suspend.html> -> INCOMPLETE <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-2/
> >         igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) +1 other test incomplete
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_cursor_legacy@basic-flip-before-cursor-varying-
> >         size.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_cursor_legacy@basic-
> >         flip-before-cursor-varying-size.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> (Intel
> >         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291>) +4 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (Intel
> >         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/
> >         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
> >         (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/309>)
> >   *
> > 
> >     igt@kms_draw_crc@draw-method-mmap-wc:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_draw_crc@draw-method-mmap-wc.html> -> DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1
> >         other test dmesg-fail
> >   *
> > 
> >     igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html> ->
> >         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-
> >         wc@rgb565-4tiled.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
> >   *
> > 
> >     igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html> ->
> >         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-
> >         wc@xrgb8888-4tiled.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_feature_discovery@display-2x:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_feature_discovery@display-2x.html> -> SKIP <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
> >         igt@kms_feature_discovery@display-2x.html> (Intel XE#2373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
> >   *
> > 
> >     igt@kms_feature_discovery@display-4x:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
> >   *
> > 
> >     igt@kms_flip@2x-nonexisting-fb:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_flip@2x-nonexisting-fb.html> -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +6 other
> >         tests skip
> >   *
> > 
> >     igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp2-hdmi-a3:
> > 
> >       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-
> >         fb-recreate@ab-dp2-hdmi-a3.html> (Intel XE#2882 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
> >   *
> > 
> >     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
> > 
> >       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-3/igt@kms_flip@flip-vs-
> >         expired-vblank@c-hdmi-a3.html> (Intel XE#3321 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/
> >         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
> >         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/651>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
> >         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/651>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-
> >         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2313>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-
> >         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/656>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-
> >         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/653>)
> >   *
> > 
> >     igt@kms_hdr@bpc-switch-suspend:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_hdr@bpc-switch-
> >         suspend.html> (Intel XE#2705 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2705> / Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_hdr@static-toggle-suspend:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_hdr@static-toggle-suspend.html> -> SKIP <https://intel-
> >         gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
> >         igt@kms_hdr@static-toggle-suspend.html> (Intel XE#1503 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
> >   *
> > 
> >     igt@kms_joiner@invalid-modeset-force-big-joiner:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_joiner@invalid-modeset-force-big-joiner.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
> >         (Intel XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3012>)
> >   *
> > 
> >     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
> > 
> >       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html>
> >         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_plane_multiple@tiling-4:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@kms_plane_multiple@tiling-4.html> -> DMESG-WARN <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_plane_multiple@tiling-4.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_plane_multiple@tiling-4@pipe-a-dp-2:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@kms_plane_multiple@tiling-4@pipe-a-dp-2.html> -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@kms_plane_multiple@tiling-4@pipe-a-dp-2.html> (Intel
> >         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/
> >         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
> >         factor-0-25.html> (Intel XE#2763 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other
> >         tests skip
> >   *
> > 
> >     igt@kms_pm_backlight@basic-brightness:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_pm_backlight@basic-
> >         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/870>)
> >   *
> > 
> >     igt@kms_pm_rpm@legacy-planes@plane-68:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
> >         igt@kms_pm_rpm@legacy-planes@plane-68.html> -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         adlp-1/igt@kms_pm_rpm@legacy-planes@plane-68.html> (Intel
> >         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2953> / Intel XE#3086 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3086>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> > 
> >       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_pm_rpm@modeset-non-
> >         lpsp-stress.html> (Intel XE#1439 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
> >         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
> >   *
> > 
> >     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_psr2_sf@psr2-
> >         overlay-primary-update-sf-dmg-area.html> (Intel XE#1489
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
> >   *
> > 
> >     igt@kms_psr@psr-no-drrs:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-6/igt@kms_psr@psr-no-
> >         drrs.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2234> / Intel XE#2850 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
> >   *
> > 
> >     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
> >         (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1435>) +1 other test skip
> >   *
> > 
> >     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> > 
> >       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-lnl-1/
> >         igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> ->
> >         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-
> >         edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/899>)
> >   *
> > 
> >     igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/igt@kms_vblank@wait-
> >         forked-busy@pipe-a-dp-2.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +4 other
> >         tests dmesg-fail
> >   *
> > 
> >     igt@xe_compute@ccs-mode-basic:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@xe_compute@ccs-mode-basic.html> -> DMESG-WARN <https://
> >         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_compute@ccs-mode-basic.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
> >   *
> > 
> >     igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@xe_evict@evict-beng-
> >         mixed-threads-large-multi-vm.html> (Intel XE#261 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
> >   *
> > 
> >     igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
> >         igt@xe_exec_balancer@once-cm-parallel-userptr-rebind.html> ->
> >         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-adlp-8/igt@xe_exec_balancer@once-cm-parallel-
> >         userptr-rebind.html> (Intel XE#1033 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
> >         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727>) +2 other tests timeout
> >   *
> > 
> >     igt@xe_exec_basic@twice-bindexecqueue-userptr:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_exec_basic@twice-bindexecqueue-userptr.html> -> DMESG-
> >         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr.html>
> >         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727>)
> >   *
> > 
> >     igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
> >         igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html>
> >         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-
> >         xe_vm_create_scratch.html> (Intel XE#3086 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
> >   *
> > 
> >     igt@xe_module_load@reload-no-display:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_module_load@reload-no-display.html> -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@xe_module_load@reload-no-display.html> (Intel XE#3467
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1
> >         other test dmesg-warn
> >   *
> > 
> >     igt@xe_pm@s2idle-d3hot-basic-exec:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_pm@s2idle-d3hot-basic-exec.html> -> ABORT <https://intel-
> >         gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
> >         igt@xe_pm@s2idle-d3hot-basic-exec.html> (Intel XE#1616 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1616>)
> >   *
> > 
> >     igt@xe_pm@s4-mocs:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-4/
> >         igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-adlp-9/igt@xe_pm@s4-
> >         mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1794>)
> >   *
> > 
> >     igt@xe_query@multigpu-query-topology-l3-bank-mask:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@xe_query@multigpu-
> >         query-topology-l3-bank-mask.html> (Intel XE#944 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> >   *
> > 
> >     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
> >         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) +16 other tests dmesg-warn
> >   *
> > 
> >     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
> >         timeout@rcs.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
> >   *
> > 
> >     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
> >         timeout@vecs.html> (Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_big_fb@linear-8bpp-rotate-180:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_big_fb@linear-8bpp-rotate-180.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-180.html> +6 other
> >         tests pass
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> > 
> >       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-4/
> >         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
> >         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/igt@kms_big_fb@y-
> >         tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
> >         (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-bmg-6/igt@kms_bw@connected-linear-
> >         tiling-1-displays-2560x1440p.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
> >         varying-size.html> (Intel XE#877 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
> >         varying-size.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> (Intel
> >         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-
> >         flipb-legacy.html> +7 other tests pass
> >   *
> > 
> >     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
> >   *
> > 
> >     igt@kms_flip@2x-blocking-wf_vblank:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_flip@2x-blocking-wf_vblank.html> (Intel XE#2316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html> +11 other
> >         tests pass
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
> >         downscaling.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
> >         downscaling.html> +1 other test pass
> >   *
> > 
> >     igt@kms_hdr@static-swap:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@kms_hdr@static-swap.html> +1 other test pass
> >   *
> > 
> >     igt@kms_lease@cursor-implicit-plane:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
> >         adlp-4/igt@kms_lease@cursor-implicit-plane.html> (Intel XE#3086
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-adlp-1/igt@kms_lease@cursor-implicit-plane.html> +2 other
> >         tests pass
> >   *
> > 
> >     igt@kms_plane@plane-panning-top-left@pipe-a:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_plane@plane-panning-top-left@pipe-a.html> -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-2/igt@kms_plane@plane-panning-top-left@pipe-a.html>
> >   *
> > 
> >     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
> >   *
> > 
> >     igt@xe_exec_basic@twice-userptr-rebind:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_exec_basic@twice-userptr-rebind.html> (Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-4/igt@xe_exec_basic@twice-userptr-rebind.html> +1
> >         other test pass
> >   *
> > 
> >     igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
> >         invalidate-race.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
> >         invalidate-race.html> +21 other tests pass
> >   *
> > 
> >     igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         wait_for_lmem_ready.html> (Intel XE#3467 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@xe_fault_injection@inject-fault-probe-function-
> >         wait_for_lmem_ready.html>
> >   *
> > 
> >     igt@xe_module_load@many-reload:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
> >         adlp-4/igt@xe_module_load@many-reload.html> (Intel XE#2953
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
> >         Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-adlp-1/igt@xe_module_load@many-reload.html>
> >   *
> > 
> >     igt@xe_pm@s4-basic-exec:
> > 
> >       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-lnl-2/
> >         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
> >         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-lnl-6/igt@xe_pm@s4-
> >         basic-exec.html>
> >   *
> > 
> >     igt@xe_pm@s4-d3hot-basic-exec:
> > 
> >       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-9/
> >         igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
> >         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-adlp-3/igt@xe_pm@s4-d3hot-basic-exec.html>
> >   *
> > 
> >     igt@xe_vm@large-userptr-split-binds-134217728:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_vm@large-userptr-split-binds-134217728.html> -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@xe_vm@large-userptr-split-binds-134217728.html> +2
> >         other tests pass
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_big_fb@linear-64bpp-rotate-180:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> /
> >         Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/877>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_big_fb@linear-64bpp-
> >         rotate-180.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468> / Intel XE#877 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
> >         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-
> >         rotate-0.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) +5 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
> >         flip.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1727> / Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-
> >         async-flip.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-9/
> >         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-
> >         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-adlp-3/
> >         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-
> >         flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/324>) +1 other test dmesg-fail
> >   *
> > 
> >     igt@kms_content_protection@atomic:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_content_protection@atomic.html> (Intel XE#2341 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-7/igt@kms_content_protection@atomic.html> (Intel XE#2715
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715> /
> >         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>)
> >   *
> > 
> >     igt@kms_content_protection@legacy:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-7/igt@kms_content_protection@legacy.html> (Intel XE#1178
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
> >   *
> > 
> >     igt@kms_content_protection@uevent:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-5/igt@kms_content_protection@uevent.html> (Intel XE#2341
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> > 
> >       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (Intel
> >         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-
> >         flipa-atomic.html> (Intel XE#2291 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-4/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
> >         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
> >         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel
> >         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
> >         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2882>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
> >         vblank-interruptible.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-rmfb:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#2316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (Intel
> >         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (Intel
> >         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
> >   *
> > 
> >     igt@kms_flip@2x-plain-flip-fb-recreate:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
> >         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
> >         shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel
> >         XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
> >   *
> > 
> >     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-
> >         interruptible.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-
> >         interruptible.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
> >     upscaling@pipe-a-valid-mode:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
> >         upscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-2/
> >         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
> >         upscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) +1 other test incomplete
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
> >         downscaling.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) -> INCOMPLETE <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-2/
> >         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
> >         downscaling.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) +1 other test incomplete
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
> >         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2333>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
> >         blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/3468>) +1 other test dmesg-fail
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
> >         blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/3468>) -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
> >         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2333>) +1 other test fail
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> > 
> >       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
> >         render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1861>) -> TIMEOUT <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/
> >         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
> >         render.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1033> / Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
> >         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2312>) -> FAIL <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
> >         fullscreen.html> (Intel XE#2333 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2333>) +9 other tests fail
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> > 
> >       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
> >         onoff.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
> >         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) +6 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
> >         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) +4 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> > 
> >       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
> >         move.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1727> / Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
> >         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-
> >         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/651>) -> TIMEOUT <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-
> >         blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/1033> / Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
> >         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) +23 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-4/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
> >         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
> >         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2311>) +27 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
> >         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2313>) +28 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
> >         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
> >         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/653>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-142196v2/shard-adlp-8/
> >         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
> >         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/1727>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
> >         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-
> >         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-
> >         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) +19 other tests skip
> >   *
> > 
> >     igt@kms_plane_lowres@tiling-4:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_plane_lowres@tiling-4.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-4/igt@kms_plane_lowres@tiling-4.html> (Intel XE#2705
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
> >         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>)
> >   *
> > 
> >     igt@kms_properties@connector-properties-atomic:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_properties@connector-properties-atomic.html> (Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_properties@connector-properties-atomic.html> (Intel
> >         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_vblank@ts-continuation-dpms-rpm:
> > 
> >       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_vblank@ts-continuation-dpms-rpm.html> (Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
> >         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_vblank@ts-
> >         continuation-dpms-rpm.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html> (Intel
> >         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) -> DMESG-FAIL <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
> >         igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html> (Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@kms_vblank@wait-forked-busy:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@kms_vblank@wait-forked-busy.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-7/igt@kms_vblank@wait-forked-busy.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@xe_ccs@block-multicopy-inplace:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_ccs@block-multicopy-inplace.html> (Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-4/igt@xe_ccs@block-multicopy-inplace.html>
> >         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@xe_evict@evict-beng-threads-large:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) ->
> >         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-
> >         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/1473>)
> >   *
> > 
> >     igt@xe_evict@evict-threads-large:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@xe_evict@evict-threads-large.html> (Intel XE#1000 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@xe_evict@evict-threads-large.html> (Intel XE#1473
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
> >         Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2472>)
> >   *
> > 
> >     igt@xe_exec_reset@parallel-gt-reset:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3468
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
> >         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-142196v2/shard-bmg-4/igt@xe_exec_reset@parallel-gt-
> >         reset.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2705>)
> >   *
> > 
> >     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_log_init.html> (Intel XE#3343 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_log_init.html> (Intel XE#3343 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
> >   *
> > 
> >     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_relay_init.html> (Intel XE#3343 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-142196v2/shard-bmg-6/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_guc_relay_init.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
> >   *
> > 
> >     igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_wa_init.html> (Intel XE#3467 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3467>) -> DMESG-WARN <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
> >         igt@xe_fault_injection@inject-fault-probe-function-
> >         xe_wa_init.html> (Intel XE#3467 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3467> / Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@xe_pm@s3-vm-bind-userptr:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
> >         igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/569>) -> DMESG-WARN <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/igt@xe_pm@s3-
> >         vm-bind-userptr.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#569
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
> >   *
> > 
> >     igt@xe_pm@s4-vm-bind-unbind-all:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1727 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
> >         XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2280> / Intel XE#3468 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/igt@xe_pm@s4-
> >         vm-bind-unbind-all.html> (Intel XE#2280 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2280> / Intel
> >         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> >   *
> > 
> >     igt@xe_wedged@wedged-mode-toggle:
> > 
> >       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
> >         igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#3468 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
> >         bmg-6/igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#3467
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>)
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080 -> xe-
> >     pw-142196v2
> > 
> > IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://
> > gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080:
> > 7bbcd7df9387f0d9004f997df33f7a9472d9c080
> > xe-pw-142196v2: 142196v2
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
