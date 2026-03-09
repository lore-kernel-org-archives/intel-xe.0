Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A3FCA197
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 22:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2977310E5C8;
	Mon,  9 Mar 2026 22:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxwBN5SW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07110E5C8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773093791; x=1804629791;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jZlTDPbXLBP9Eneq2KBssLhCm9bbEhGx3v9vwx7tA9s=;
 b=BxwBN5SWMoj1/fc6FFY36iA6tUo6wtlAvgqV3RziNtNd3bCqVOABFj6U
 XSwlWSknhDc8YcqR135380j/yBnw5zb4RzGYny2hoodfdjapkXr1ha3iM
 sk8Q5kQ3/Ub4MB2LFS7VbzMuG63y/vIxPNO/H+Ynhv7gPR2/kWKGaEpSo
 TvrcsPT1U/UaJQq+4QQaQ9De9PNgdCbfAXScBF1pVUxpt0tELDAxL/UN0
 oObzR0GnbQ7su1/Icymkqiozn6PwwturqLB81ZnxFOuR2w38zVhm6+reL
 TwZSZtRp3tYDR4R1MIJb6vAIQDcWVrqDMDWNSwSq4qFO7G4ql6IquKpWp w==;
X-CSE-ConnectionGUID: mOPy5hcvS2uZBxHrKIN4ng==
X-CSE-MsgGUID: FxLo2jOhTZKtpvP+2oygPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74173864"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74173864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:03:10 -0700
X-CSE-ConnectionGUID: Nfi7eb5xSLSaDyCPKsc6Ow==
X-CSE-MsgGUID: MB8HNoBCQFe6ajrRw2liKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="224341594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:03:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:03:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 15:03:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXLqjCQ1jNIIaNwtl0nYN1tUBSwckUfiUfx7FYjWmqbI7ztMFFIqruU1mMD2/nplBqUu4aEET7+PisoZvAY7j7C0N9gf4daQXp+7/J445/XnFDKVAKM1/XpnAyqx+teniWU5CO6TkGKqJhbOI4J7PnBbmKq2zuWXWh86O4Nefh9xGcD1Nn5ajNr/IUBan7BleEA1e+B0y0ZMAw0fYOo9JTE5oVGuzQBgN1k+kCYAkExb3Uw3MH8LCPWWU5HTXmCX6yvudpuQDG3OGfN7THt3VyHdMbXBWNVelDHJpGfqDpmTa3MtI/IQJ7ztMVGLwtCI8fHwZDM8Qp/PBMgyCFON4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NIhoYO6lURtEgcDwUy6xWfj2ajTi1XoVTrMhAB/IaQ=;
 b=PU1nOgmLhqsEIfNJgJ2VKPzqAgf5jn1ERmPzyvyl3GjMNVV9P4qgtFVL9hEaiM4oh7eW/qz/aXggtEv4rUNQbA0jggnGNRAbSLVpxeFeM2pNm2TEvasigtdZqdvJaNHc84Yc5yKrqclifLp47XEoXS2JQZi0R9es+vqnx5ULOtaZosKuxreXfasqT9tJzoQlip6vsY/2XnknCaD0f/Tr/tCvaafeJ7PCFZgYhOG3Y9AP/CPzL2OiH1TnmfSH/SJNajkcw7Ao2EoKDNhOox51iBm0nqAmycUIZFKvvhB/2HLv0FGDgn0II0WXDDTn3tdCt7Mvu9Bfa0WBupjmV9C1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 22:03:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 22:03:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for Extra enabling
 patches for NVL-P (rev3)
In-Reply-To: <177309013042.335367.3672549934691530510@a3b018990fe9>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <177309013042.335367.3672549934691530510@a3b018990fe9>
Date: Mon, 9 Mar 2026 19:03:02 -0300
Message-ID: <87ms0gacfd.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a312806-afc8-4164-9f47-08de7e27a515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: Ifyalfc6cchUC4ZDAZ1+KOOd1hiVhH6vEZZtiTCN3EOHdegBgNzPAjcY6bPJ6pSuymcn0BhDFrxulSqtO+9iz3ErcM5jlKs8nHAY6ZNTFut875VgJUPd65ly2nRdIg23zxwSmM5/b5LyrUqSyy8cW6EiPzGe7udDx2NXS4oJyDXrSnqLpI3DWTLv+U21Hq2sJMjD/FFYaJXegosbREAPGQjpHCiKF3+YIzGtGTb+bR5epIOkR6IzAetn+JD5PWGwcuYeMJXfw9jM5sbRLQHwY+fRGd4eetfiibqMVbAjhtnosZITHhRaKAHog19wwvPvpCi/P7rRhxyi4239/HpuLZiN95b87ioSK8mGebgxQVUyxheIfzVMdQrnr9TWG/1GF23JtRUkipAcNb2x1i1EvsfhPmPaa2WQdeUWOhk6WgKpJ9nQbZH0Dt9QO3i0lcgtdIACcUg6xsTnqLFxCZxDvbwDMeZ8ZIXA3uXGI55h7GVcEStjmfEO1X2mcEond9MHE2r1uV4+NJLgJFGkkCNbWXQVYYOrfKeGpJvjST8prUUMHRggJCNc7G+tjKoBxGi8TTTUjCPk06ek23XX0I0wIS+2HxCUbt0OkCl0rgHxvy1L8H8y6AkuoG1XnZwdkJ+oK1awsMFTEpNF/F7kdfTIeX1dbQxFW0yekF9ZARlHwUWcJGdFPSZaQkj4YW6aBLAV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QgeuMwX4VshtgUpP/GsTcMAVcX/iZn7KkJiW1dX7NjoBL4JstZO3TCsNJ1Jc?=
 =?us-ascii?Q?7Y5GzCc5xaAVYZ+62XrUX56+V0bjItG61HfRKoosMqFYTXbltGrjpdvKplE0?=
 =?us-ascii?Q?t9iBcqqhDcYzwMh+L/J8GU1rdn+0j35jVULEZ0AXI4WnqcN1Mut12iApph6V?=
 =?us-ascii?Q?wR456TnLPQ0Lrdu108x5eAB0W7oq53WE1qoCvoctzzG+KEMgrwwmYCa5W5qs?=
 =?us-ascii?Q?SIxNCRFiawz82TWyiqlbCn9oKMY9Wd809MDc2d6rc9VMYIU7zKOzkn6Tl2YQ?=
 =?us-ascii?Q?qYh1LjuI1NNqrRPTQna3bs+kuk86UBRqfEeNeVw0b6S/BUFXnsNoiUxZMRnT?=
 =?us-ascii?Q?3cBn4PhjegXqWsG2TcTf8AEVOZji5Q74maP6SFZ4YO/e2jnNpgaTZekr0UPj?=
 =?us-ascii?Q?C+5HMluThLnk1kNRiFeDNYNGoCUIvSeDhU9SD5Q31vv/ovs5Pd37gNtVTQGz?=
 =?us-ascii?Q?vsTlzL3cZCaKUiKy5v1le47JU0E4QZKDye84/LvQsHBaoGJkRb5mJFQqJISv?=
 =?us-ascii?Q?PuS54x4q8dxkHFDNHw0S+Xy3ElhDciaa4oUpmMpfiFS6ih4eSuVmTElsVVBW?=
 =?us-ascii?Q?G2d3KT1wIC1a+GQTK50CKQQqSTju/+KqfAr0G9F1Z/ogmzV2EQG0UpE3QAFr?=
 =?us-ascii?Q?JC9F27hqevt3P9TtB4rdt/KJwl592qLYwGRJAYfyfpZIs7WYmgeHCb801kyv?=
 =?us-ascii?Q?hLq8tAnrNvT0YVDJOwfW6MqPU8HWqfT2gxUW5ls/OFYXmXlyh5TMsqQEuKW1?=
 =?us-ascii?Q?AXzXGmzBlwwWLMrG6q4WRvkTzFcULfN6Sn1TJGaiZh27FX2+h3WwgbjBIc2r?=
 =?us-ascii?Q?SzAIsaFaAiFStaM4N5f36kPFqB5XU5dwTCCVJxHPvrhgqhI3CrCTxs6ELm69?=
 =?us-ascii?Q?6QaMsMox3GQeYS4+9eOCSUYOYERjBp0VlYrg33gdxhVOn3zKqNu/JEbuqbMn?=
 =?us-ascii?Q?PgTSLoJ+GREP5xjMGg9ZWdzSXf/M2Y8ABccXGS3/sCeYOyNVui1tfVEBj1Ld?=
 =?us-ascii?Q?AxfusWrMeJW7OltaeUDB6261+Q6J2BKWUZCHqVQXpXYyaOw/WXJkaqg1DpMj?=
 =?us-ascii?Q?lE+MGR3T8sWyPmh7wV1Tr1JzdqVzMmbi93ILlGLWeiRFuVWX5/Wf4SMsDeou?=
 =?us-ascii?Q?mIjot8ITjwz+AvP5PPSSJM0GIlman3FTOyKgdVZLrvDskDjOnQ48gVJjPiUJ?=
 =?us-ascii?Q?vbMF+XRMxoOYXMXQVCLsQIWaqKBtaitUX2lzLpxqlSZMcb3Qmd4cJbj1vk2f?=
 =?us-ascii?Q?bng0TI8ebiIPOurgllY1f/fiClnMf9HcjHEuQmLvr01sPRxbvnirDtEbFPPi?=
 =?us-ascii?Q?F+SXEhcQoTbtxntEaqEJMrGGhmgSdrMsiuvT7opkW5C2d0KI8OFq+Rm6+/7h?=
 =?us-ascii?Q?HDiHYbc4p1HhIHtXES88WjnYD326yZMC//RsFokFQHLq3JW11f75jXwI7Srp?=
 =?us-ascii?Q?Sg460zzB6x27SAMK2/ENtWRSnY3doozvpLzJqWJJYR9svNTpqARQSKGK0yp6?=
 =?us-ascii?Q?i9ZbcTOJbo+6fJRXU+isUYKybs+6eXna4E9UlkXM/wwKVSYx6UBbVEKwnCzx?=
 =?us-ascii?Q?j2xJ8JE9lFcaljWkhs5TKt9eBds5DJTK3FmH7ZaygIMe+arNoqoatDnwN0dz?=
 =?us-ascii?Q?k+laRpEY/bSXIRgo3hM+1RPpEGqQNRgly8oP2WAjx6eDfmo8lWfeIOaj+7wv?=
 =?us-ascii?Q?oMmIHJBNK7Aoh9WiCD0p6tp0+3qdAj0vYIRDq4NeROvhVrJbdxxc5ZEDQ3xu?=
 =?us-ascii?Q?dfw3897XsA=3D=3D?=
X-Exchange-RoutingPolicyChecked: gfD2Qw25pHpXOwVCii2E6LOBq1MIPVzIWd0RcKqcFKhis0o1VwVlW4Y7s/CZ1XINBRHJykvzg8krKY5S/llnUx5MuWYvpvrF+w9kZ9cskjkdb/W+mlMK4FXrMuCo06wsZLbONLXhr5rjiuKjQ0ApjGrBRwTpgKFKOIqdYL67+XC8/c6ywFbqHfofmC7y3bNmA14BaROvWHeDTNDO7ZkgrlULhubE0QgDfo3daCR29SGBXmZiqJEvvpfTAINU/3WKRrZ9SooXp8NjqMllqG/MbBy5poA9TO6XdvAqzMNE/pVFg6tpx1P3mH0d4C5t3nPoEn4UVg6xW6JU/ZrOJTWtVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a312806-afc8-4164-9f47-08de7e27a515
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:03:07.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKUMeHx2SX5SMJPar234tc4Nie2cjeu8E9AnaaBPoHcfhkv+xHlL8EVowwwfcClOYhoMawmsaMCpXgvcDYOFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: Extra enabling patches for NVL-P (rev3)
> URL   : https://patchwork.freedesktop.org/series/162666/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c_BAT -> xe-pw-162666v3_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-162666v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162666v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (14 -> 12)
> ------------------------------
>
>   Missing    (2): bat-adlp-vm bat-ptl-vm 
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-162666v3_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_module_load@load:
>     - bat-ptl-2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-2/igt@xe_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-2/igt@xe_module_load@load.html
>     - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-dg2-oem2/igt@xe_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-dg2-oem2/igt@xe_module_load@load.html
>     - bat-atsm-2:         [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-atsm-2/igt@xe_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-atsm-2/igt@xe_module_load@load.html
>     - bat-wcl-1:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-1/igt@xe_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-1/igt@xe_module_load@load.html
>     - bat-ptl-1:          [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-1/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-1/igt@xe_module_load@load.html
>     - bat-wcl-2:          [PASS][11] -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-2/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-2/igt@xe_module_load@load.html
>     - bat-bmg-2:          [PASS][13] -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-2/igt@xe_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-2/igt@xe_module_load@load.html
>     - bat-bmg-3:          [PASS][15] -> [ABORT][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-3/igt@xe_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-3/igt@xe_module_load@load.html
>     - bat-bmg-1:          [PASS][17] -> [ABORT][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-1/igt@xe_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-1/igt@xe_module_load@load.html
>     - bat-adlp-7:         [PASS][19] -> [ABORT][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-adlp-7/igt@xe_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-adlp-7/igt@xe_module_load@load.html

Oops. It appears we've hit a chicken-and-egg situation here. MMIO
functions depend on device workarounds to be already initialized; device
workarounds initialization depend on xe_sriov_probe_early(); which, in
turn, needs to use MMIO functions.

--
Gustavo Sousa
