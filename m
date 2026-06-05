Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529C3CD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 13:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F4160112B3D;
	Fri,  5 Jun 2026 13:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsUzYoIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3A6112B3D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780667730; x=1812203730;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=xojjW59wHaQbnVe8C6Ly8onqh6FiOdp2WRKJX38viSs=;
 b=UsUzYoIYmn823jOmIcdS8n36fYxMf6Qd42hXNgLVe5xbJZYUIZ91EJwG
 NZyY7SRC2TD3SUexjJDEdGuPjYOW6XdCNu9iEumlm5g6gLRwBp0AFs/D5
 8b3a1sdMbwAzAWugq9CuIXJkstQiW/njVVmnKeFl5rWTBrAn0Hb1TclU8
 FzW4bdOaf38oJthZQaWQCN7f6irBjQCDzyaUeEd3pTL0Pal1RE8zDql6E
 5IlReSPbI8HTsrUuR87HVPOs6ZAv7Breqksk5H/+KfoKSC0CQlca7PoZR
 83iI/9k3T1vskcTqPtkwtCcjDyzMIuCLiLbcrCm5PaDgawCmwr7OyjxuR g==;
X-CSE-ConnectionGUID: Qyks1aQnQu+Tvkpm/4mV5g==
X-CSE-MsgGUID: b5l/4/QLRY2PudSKtqp4gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80637434"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="80637434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 06:55:30 -0700
X-CSE-ConnectionGUID: OMo/eatiRe2FHdb0evU6Rg==
X-CSE-MsgGUID: YzEiduPXTMu5zhtYY3RP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="246679959"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 06:55:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 06:55:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 06:55:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 06:55:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnjwFrnNF83JgHfA+aWoqqMcV5VCOYhIj1GR8+6Yc0tX26sM57IYP+FEHRMq7R7KNxwoKMd12lscEGUlk3C16DrpRU2TxRofVmVOlvMB47Vrcs06kE8fuk8OkaxKh66ecGpKPWRP6B0TxKQV7PS4kvYqXpBUD4++QgDDI5zmcQZmRU61wiIE+IGTAysztF6SVvt7zBzx2yUvdfwVjjiZ6ma4quT+rwjc+gQNz/8DGmMwMThDXzrfULNU1iXi9VtR3+SO5EldNmhOnBeX2qN+b4JxxSIy61wWAo8LBDpWee09YC0zyqJUgtOorwfqQB3IPuztS06yZtxAPqjBmKul/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63nBl6X8FbP2yVDwo/Grua6XeK5uo5DtGXMzWssucho=;
 b=R7WT4CzEPJB4uLsdQATkgSUA8Rs/vMZqIXkPtLVzX8vwNGIKwqyJFjfNzpzn8n7vQotgzf8EvY9ARpHrMA2HufbV0kHD8YOBbOBQNG8CaYF7DXyLXJ24oyS3U2VuWQD47GQ/lM+0NviFQ/LPEDY3+bkmXtVTMkjG3I/FUJJMNNWMGZwDszddzKkLNOwTebu2wSb51NQDY2RFIfez1wZYyxBBeu7kr9Feen5w2lTntvyMIjaEybq9CoivW0fAsKr+DeAYzwTFOlVhS2aiWTMMd2KH4uu38I1IBvk9z6U8qRxXj5X1PbwgUgMHxuT/Nq0sYTNQ/WkEbIX5zrbBKTCeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 13:55:27 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%7]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 13:55:26 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>, Violet Monti
 <violet.monti@intel.com>, Matthew Brost <matthew.brost@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] drm/xe/rtp: Fix build error with clang < 21 and
 non-const initializers
In-Reply-To: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
References: <20260605093305.110598-1-thomas.hellstrom@linux.intel.com>
Date: Fri, 5 Jun 2026 10:55:22 -0300
Message-ID: <87ecilt7lh.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa03930-4364-4506-7b8b-08dec30a1881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VGrCqpiF2hJ02Kg52oqGGEvMCIQ4AYZvJHLok5nRXxr3qe/LTJIdbFzFibSA7EttcaJa1pqx0MZ/vHleqkntkvCCkxqoeoBT1pGdHyG7/FEZwyNJESoqkbAhzr+SIiJ8eInYOQXr+LrIPQm0S0qpaGcRZ1kdHXRjm9Nx9I+3GFoWqt5pLdEuYLIwFEDp195vizrXj71oyPj3mciSn/QuPt5ks16lpKtfqol+jULLcugItg/9DbLraB8UYxsflxVp77t+E+wDsasnfz8e517shAPvkqM/p6/Qioa/vY/0dA5xrNJCsUnE/zaV5vnkcdf/ROcKDA6eekIdob1PIE1djGgeSRSt8TNKWWhOflVXA+n2U7YvHPnyDcTDObgwdD8UV6/XIULqKwdt9+kTE0CUd5XiEjHZvQUNZXtHZkrPoCu+CZkRfj9K0MEPJsIJkhEs63EXZjlQ3ecYhWR36LI2gTfQqfEDXCSwDu46jjCwwYtFQUoalTdbGpX35ftSzvjegADe9L0ACD1/zlG3R7ggZmz4QuUjcXRicPStMTJ38FAkEKigSmdLjF0OChCcNVRVmZ6Bo55sAZxuKa0NrQxmvsuFGw/gtFDFx5aFaOkDOmmpgpyeOynfjBqCqvOh6LWTxFbF8WLlpDo0CcDzFtAvwlzcqdJ3Ba8GNvFgJ/ns5KgusZspbbHr7r6ofPf5EfQ7nkQbIHZymwuo2F4ZIrQAKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1jOGxWTUJMQ3lrWTZWcVVJcUx1VVI0K2tEd3BmOGlOcTZzNy9ZeDBCdzFH?=
 =?utf-8?B?Q0Q1bWUwR2hCMFhZL1BrRFNuUjkzaTlLMi9RQ1hpY0VESzduMmt2V2UwREx2?=
 =?utf-8?B?NGVOZ01UZDAzeXA1ZWloUjJreVVaNHNQMG1xd0wzVlhwZ0o2akxpRURYeE5B?=
 =?utf-8?B?c2dsQmc1cWVFTXV1NmRsYzFWcUZiSUNIa0R2NUdqKy9ra2czNHhIODlFQTBm?=
 =?utf-8?B?T0FveDRhTjh2dkd5MjViTE9LRWtldTEwbWQ1dTZBNk5lT0VOMjhkR2lpejR1?=
 =?utf-8?B?L3pCV1ZKdkV1Q0xsRlgybU5rbUdNbVhTa25GZHNSNlVxUzFFcHluZzJlZzQ5?=
 =?utf-8?B?aXNzMGNlSlJvb29EeERqTVNWWk5ONmNxbWd0QjdZaEhqZjNhV0ROSjZnZzVQ?=
 =?utf-8?B?Q1ZzMXd4dEpVWEo0VE5PdDVPU1pMVnJZRnV0dHZORU5iNTNIWXkyMDhuRzdW?=
 =?utf-8?B?K2NaOHFYZlNxSHVac0tzZlpyZTVPbktlWmpBZi8vdnFTSHRvM1R5WFZQZmlh?=
 =?utf-8?B?aTNsczBON0hFRTg4Q1A3SzlMdERqVEJFZG42WTVjcHN6c2UwSzhBTmlzUGJD?=
 =?utf-8?B?VTVPWnZSZVVWZXR1M0J4dXNXdS9hZkFUSnhoaVMzM1BheEsyY2dwcE8vd0Y3?=
 =?utf-8?B?ZE40UUFKWUlOQUI4M0k2WDdHSENhZlRrNWd1WnRKUDFvVFljM21hOE5JcVMv?=
 =?utf-8?B?L256dHFsbWUyMW1iSnpod0hHdWVrSkZheDY4K2xRR09lOHgxcnZoVStSbzc2?=
 =?utf-8?B?dEJQYVZRMzJEOWxxem9PdU1CSElVbEQ3Vk80eTlCVnNDaDZKczVYTTIyOXdk?=
 =?utf-8?B?UDQxNTBXWEJSY2NwOFVKL1JQZGxwZmlpVnZKR2FDVTRXNWtWL2dhdlhxQnpI?=
 =?utf-8?B?QzhmU2FWSldUZEpocS8xQjkzemVYSXF3c1dLM0FRamVnSWdlUVBIQk1kSzQ0?=
 =?utf-8?B?Nnl0UFNXUEVreVFCb3o0b1NiSGhoSlZIby8wTDAxbjQxeG5sSlBtOWZXMUJ0?=
 =?utf-8?B?WDJRL1Q5UERnL1RhcVRTY3V3cUZ3NDhxWEJOQThiTEExbnh2MkQ0ZXJLQW9M?=
 =?utf-8?B?dWNEOEx0R2pxbWx5d0kzYVNwczQyeUpaYkNTeWlFSnA4cFdyc2NyQXdvaW4v?=
 =?utf-8?B?RUUzWThMMHBFZVQ1MjJvT05jKzhLUkdBdWs4VFJpSVBpRFRIOUJ4MENRWjhr?=
 =?utf-8?B?ZkNIZEtUMFNONURZakE0U01WNlpEczdNNm1wemswM2d0RXdYNk5vcklGZTE4?=
 =?utf-8?B?aStYaGpsRFBjL1RVMEFBTmZXanhpWmRHTWp1dzJwTHRWbHV5L0k3YzhvYVNp?=
 =?utf-8?B?UmFNNWs2VFpLcHBMQ3ptUy9mVzBMU3d1VVdBb0U3UUxOMTM4UXpSSkdhZ3Uw?=
 =?utf-8?B?NG5lYkRFMWplYkxrMXhidVVRUEdIWmk5OEI3SCtabnBVbWd5T3g5SnhZUWF2?=
 =?utf-8?B?aWdZZTMxTVNiMGxlT1l0WGlLbnVuU2VObnBZTkJVRjhTbkMwMDZlcEJhT1Nm?=
 =?utf-8?B?SVFtVDZkWGNqdk1maXdCcTRWSWNKbkZ0VmNpK0ZtTmJubk8rejJlSFBUdHBX?=
 =?utf-8?B?dE5wd1FwRmYrR2gyN0NEaFVCc3dpNHQwRHhqTCtteU5zQWQ5WHc2VlZpMlNu?=
 =?utf-8?B?NjBtelF1UTdkQnVZMmN6Q3ZuMUVxMXdlWTJ2VlZHVlNvTy9zaThmUVFRMmdB?=
 =?utf-8?B?TnNlVVlVRFhkU0lzWGY2SmhCRkk4MmEzNnJtVnZaK3N3UUo4aXlUZjQ1dXRa?=
 =?utf-8?B?ejJFZ3VQaWh0WWVPY1M1TWh5R0xnaGZBK1kzRW42aTB6Z3lUdTZ1a291TlBn?=
 =?utf-8?B?YWNybTNVRTZiQ3VuSXdGVHQwMnRlc2N1YnRLM3RRUkhjNWpIczhxc1FnSGpK?=
 =?utf-8?B?aDFFdlAyV3YyeWY0bE52Q05MRzdXR24xc3NKZWs1SGhZdFlJNWQ4eUx4WlZ2?=
 =?utf-8?B?TytyRDJmQXo3aDZPY0JBYUhSb0xKRVVHOWpjdXQyL3JvN2F4ZW10Ty8yam1T?=
 =?utf-8?B?T1NXck11MjYrUWZtZFZsd3FmbFhGdTRiRWdXQTlINU9Qc0dyTlFuZDZCbE9J?=
 =?utf-8?B?YlBRck14TzRGTjNKNWlhZCtJNlpuZzFkYzNvckEzN0tPZ094SGlEK1BhQnpa?=
 =?utf-8?B?U1pLV2hzNUMvNHZ1cG1jZ3E3WEFPSEU4K1Rqb3hQN0dJRlJWNStYKzZNL0tU?=
 =?utf-8?B?emdkckJoYXNacWozOERFZkFqdTZQUzBsdmMzZzRWaVl4WGV2Q1FIUUNyMUFK?=
 =?utf-8?B?TmlYYzJ5bjc0ckxyeGNtSDZqa1FuL0FSWFJXb1hvbWZFMm9mQUVydzI3a0gz?=
 =?utf-8?B?RC9Ha3JWS1huSTliSFphaWlSSldZZlBUUEowMUYwa2UrdmxSbkJMQT09?=
X-Exchange-RoutingPolicyChecked: OkFrXmmJvldNHeK3f2SdR+593jFTDF5z1pRurmoYZ2IvB8fTmEvDUJfknUaQHRLjQ9FsxDIWCpaNEUbBLWk9qkjZrFbhooKQMMsAUa8YKVZL0N/oO0d0MHJ3w2nqQp0Vsmf4G7oooRXCdrn5kbGk2KYzDhrx/KbU1B8n5LTIreCJizIpHD8yhC0nd9xuD1ks2mrQooRvLmG56KLBJ941v4mOCVBa9NeTuZUvZZ0Zkq4AdR5Hf4K6gY4I1pVfgRqEtiSmyEP3+INru3XnPimg1b/d7LNmAcmvuskiNfqqSGQKEcVgM6KuJaON78zc+Z3lutsEitd2XKv75oeKME9lhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa03930-4364-4506-7b8b-08dec30a1881
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:55:26.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHB6VdywqlbkKQBCMN5XXqrw3QFVIrqPfRHGj5NGbMqZ9NYtt6TxuXc/ybbgkT/HwwsLorwJpCMZYE0os2MYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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

Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> writes:

> Clang < 21 treats const-qualified compound literals at function scope as
> having static storage duration, which requires all initializer elements
> to be compile-time constants.  When xe_hw_engine.c initializes a local
> struct xe_rtp_table_sr using XE_RTP_TABLE_SR(), the compound literals in
> XE_RTP_TABLE_SR end up containing runtime values (e.g. blit_cctl_val
> derived from gt->mocs.uc_index), triggering:
>
>   xe_hw_engine.c:361: error: initializer element is not a compile-time co=
nstant
>   xe_hw_engine.c:416: error: initializer element is not a compile-time co=
nstant
>
> ARRAY_SIZE() cannot be used as a replacement because it expands through
> __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert inside
> sizeof(struct{}), which clang < 21 also rejects in the same context.
>
> Replace ARRAY_SIZE() with an open-coded sizeof(arr)/sizeof(elem) in
> XE_RTP_TABLE_SR and XE_RTP_TABLE to avoid both issues.
>
> Fixes: 5ff004fdc737 ("drm/xe/rtp: Add struct types for RTP tables")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Violet Monti <violet.monti@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/intel-xe/bfb0dee8-b243-47ba-a89d-71472b0d=
51c5@sirena.org.uk/
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 4e3cfd69f922..2cc65053cd07 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -461,14 +461,22 @@ struct xe_reg_sr;
>  		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
>  	}
> =20
> +/*
> + * Note: ARRAY_SIZE() cannot be used here because it expands through
> + * __must_be_array() -> __BUILD_BUG_ON_ZERO_MSG() -> _Static_assert insi=
de
> + * sizeof(struct{}), which clang < 21 rejects when the compound literal
> + * contains non-compile-time-constant initializers.
> + */
>  #define XE_RTP_TABLE_SR(...) { \
>  	.entries =3D (const struct xe_rtp_entry_sr[]){__VA_ARGS__}, \
> -	.n_entries =3D ARRAY_SIZE(((const struct xe_rtp_entry_sr[]){__VA_ARGS__=
})), \
> +	.n_entries =3D sizeof((const struct xe_rtp_entry_sr[]){__VA_ARGS__}) / =
\
> +		sizeof(struct xe_rtp_entry_sr), \

What would happen if we used

  ARRAY_SIZE(((struct xe_rtp_entry_sr[]){__VA_ARGS__}))

instead?

Anyways, the patch looks correct to me as-is.  Hopefully we'll remember
to go back to use ARRAY_SIZE() when we bump the minimal clang version
required.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

--
Gustavo Sousa

>  }
> =20
>  #define XE_RTP_TABLE(...) { \
>  	.entries =3D (const struct xe_rtp_entry[]){__VA_ARGS__}, \
> -	.n_entries =3D ARRAY_SIZE(((const struct xe_rtp_entry[]){__VA_ARGS__}))=
, \
> +	.n_entries =3D sizeof((const struct xe_rtp_entry[]){__VA_ARGS__}) / \
> +		sizeof(struct xe_rtp_entry), \
>  }
> =20
>  #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> --=20
> 2.54.0
