Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FBCCD4F5B
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 18:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED28310E1BE;
	Tue, 19 May 2026 18:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0KjdyOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B55910E1BE;
 Tue, 19 May 2026 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779214385; x=1810750385;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0PGLSFqm5AiVuFFwDgoPk5mjxMfhdLOdVhNllrQ41fo=;
 b=X0KjdyOcyhoPL/GD3AVjtkFqKu1vyCf2+xraghYt8rhN6EomQz6iNJrc
 dUtsbD5vRZftkpNoWMmhHMKLmdjEAPTuBKQA9obqu/LSM7/jJUzLbhO8P
 LFApRxH702T9c7YGlSyO0l4J18VCuOWhOT+xOncttVa68X5ZAdss73qdn
 h2X/CjP9rDc/5rBWSNT3Erl835WdHg6s/HD9BB4BVZqqC+tdqO0j566P1
 +oluds0N9uXppK3rqM5csZ+PsEkPf27fITMhyx326tdPMI0J3wFdm0an6
 yv6aNnZ/YEg2B85H6iqddZa8pqeXNFYIguOQDjH5Cc3rT5Fdm0eo6nxti Q==;
X-CSE-ConnectionGUID: 5X+tTuIUQuavI8epPOSTSA==
X-CSE-MsgGUID: jqmAKL/WTFOJzPifyACKeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="105564379"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="105564379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 11:13:05 -0700
X-CSE-ConnectionGUID: BqLOaB5ZQsWLM5yqd30azg==
X-CSE-MsgGUID: FmE1+z9OSPmWG4dul5mtqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235416627"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 11:13:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 11:13:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 11:13:04 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 11:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyrJWcG053FjOprNwQkt46hBdTk4lTWOm6sinsiqcKHEe/Br1Vh4Ps2J8b/X/8wMM9jB6i7Tni7BuCmZTUJUNddGbfXmFABRJpZkvYyp0ewkQZr26Pb9D4o4q+EjlXEzICxYBIyOKnQeMU5kXj5P4Rbta0K92dMBWKhjAYexDQhdQAJkKfL9W/DRjSzManAftSxgSdi86sk3Jxq+qRQ9W605WLxkdmplIvY09xA3CZVWErpRgDl7zZlsnCPU+YQu0G304rLwIUiQLlyTkJysYSndhjjIayX9lI3lKib1GBprbeF0Y2jbr4btTrQPqLzGC38WfJvehbbu02zfUDsP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zh9AGhapgaeutKMlTW1vlYfRUDtiXFocWwt6kiWnno=;
 b=lwdv+4c31x/i6fKR1IGCrVp6+b7cr+szpfzB1FsmKIIW5wn2Ewhc5aoEZx6wpB45vcK2UAkRvC5vFLIwAvTLkw9p/G+os8b4b/yUFnC5TjDGj5YdJEYkXZS+4hw5xwLZe2VMvP0PzZN8uMVqF74Bg8jEepAvPHggI9ORSz33PbD5zcyHaKOEUQJsO1CkNV0nMOZkApSTbU9bbwShyY240S+W2V+JOy/UL8oMnJItr8DKWLP6LRztsxx2QxQj6AfUUHdPE3nxGW/o0A8Dyxqc789X0SFHucRSclW1nHOXJOXQG7SLk8Y0nCz1qxwztWycm+Xw7qjWBNM+UfZAmpdWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 18:13:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 18:13:00 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/i915/dmc_wl:
 Remove macro HAS_DMC_WAKELOCK()
In-Reply-To: <177752166441.27310.8108561954016845261@5ab824fced77>
References: <20260429-drop-has_dmc_wakelock-v1-1-62cb6fab1da0@intel.com>
 <177752166441.27310.8108561954016845261@5ab824fced77>
Date: Tue, 19 May 2026 15:12:55 -0300
Message-ID: <87pl2rp8t4.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 80165b38-6e7a-491e-7618-08deb5d2421a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|13003099007|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: Plbow/L24T9BVx26lBxwHQO++offYUw3TlJujOrvo4N/Y5Ov6H3EAyqdj3uOh1D5o3y8/X5R8HS3y66EFX/17fm/8lmzPCQo6lXJq4GXfPSQbTCBnQ0S2OEGnjGdEKVnDAj/WV/ZNYZLqjakFJeUfmj7lSWONm9KWI8nfCVlJOUk7Gm+7yt2eR4w//RBQDVc+ZgWlGM8lJBPjMa6RU4FetOeTnhyFpTPkrZcagVoC2byJxnxMDaJ5CBArZfiH+wwjbb6/PAVD3LQLg200qfFizjwAwGeARphfEm2A7XlKNsetumAAclT+9TWM8mj1P1MOW+/H90KtO6s6CeitCYuuFe7kA5c6zx532PtX+0fKPSExdZENMSHF7vwWSjJSP/jSqCRn9NS9mrTbwg+x3KxTPAOWWQRGrnZO6ujVLZHuPJ6mNveIa3DIn0m2DZYtXOKeFAXr2h5fVAbFVvveiq/0Rrso/+2OxI4RHy6ZIHswaX9L/qexIHDwc3bHZgFQZgesuQCyvfP10zCPDRgoCy4dOQ2al9R10afbEDM9p+3rPj3jt39f5nfPBOiMUSM3/CTG8gvdUg5cPSSJBOS+A+m2YGbQ/MxV943Ko1Zn3pYbA3xfrbM7ye77HNbQLJv7vIw+HynVdMa6ISbJFBkuzQC7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(13003099007)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BoLcnFfpoCC/T5mgG3x4Mam5xNZ4/B/bhn56/l/9o2/wLNu3/FwBuo37lgvh?=
 =?us-ascii?Q?Qm/KMLhmsqM6hpD490YDXHolzIx3L8gqS6Md506JfMT9aK8H2PYdTupCwNTN?=
 =?us-ascii?Q?6L/saXI3056ImUGz7b8/VeJGJeIeZBtCfduPDi6BuXLXkTusShtc0IRKpcSI?=
 =?us-ascii?Q?+kX2jvhyk+YnglXeEeMifV7eyk2HgXkJQ6lwf9+GaO/l/vyET8uXsvW7MK80?=
 =?us-ascii?Q?o2TZ9sLVocrXILF3lcPSjyWdppg5lE/xt6upvpfXW93B4Kj35RhnC27NclNv?=
 =?us-ascii?Q?W9uc/D9CfSh0qjyt9bFP03QsKfqwKobbf87D76pX0HuSZ18tH0+1MgwB9Kty?=
 =?us-ascii?Q?GOrsgA+MzHI9EQ3wTk3ZnpRjk5vMOXvByEBFqXoqHSTgcOqpM8GIzw7R59MN?=
 =?us-ascii?Q?+vV1KxYXg3HgVFOI23l20EOApa1ava/lMEXBAwhUQB2da9y3FmfP4UaM56ZD?=
 =?us-ascii?Q?OmIJk1t4l34wNem/Bc9eKoTDSmBE6XlpTiA8SK/w1DOZgy3eOdQRaw6QF+0A?=
 =?us-ascii?Q?CXfC8/2QZal4531qWmzJkaRtVI4aGAjH6fq1BI984CgRHOJvcysnXgVOcAwi?=
 =?us-ascii?Q?2bep4mc2OBiJNNp+CoxQ1PfNs6MzC1EVlEg+ow2wjRNznL+azGUkwCv7VIHD?=
 =?us-ascii?Q?UAnA7uPhq2atehHtwc4TYYHeFbgBXKWG2MWHQkxp+IbhLGrwWhT/Rnxyl8Gk?=
 =?us-ascii?Q?r/511Sf+2Q0hXwkN5ApAkPNob0RVYOxMRcf0HDBEY3NvpmK+1mDgTtZYKuU1?=
 =?us-ascii?Q?NXn10h+3YXteLyhpRBC/FbmwJpQArGo+PAC1LGpz8JPmVTZ/IgSN+/6jCHd8?=
 =?us-ascii?Q?Cb2b6y6lyfyuGPav5TKJFEnnHj6QiX0ng0YNkXN/34FmktmKXGUWiEyIpBIu?=
 =?us-ascii?Q?LRLHqeUOHpAz/oT4diKseZjJn0jAWH8CLMkIK06K8qPDdnq6dz9+N3UesmWm?=
 =?us-ascii?Q?cGFRuneD/F/DoxQICcczFHhADCuswHFbRAs9husYcXy87E0heEsQa1r20PAg?=
 =?us-ascii?Q?ghioCaX5CJt268XmYy1a8cxRDf+1DCpAruUZcFX4LsgphuRjx4B97QpCUEol?=
 =?us-ascii?Q?qb2yHKYARCwHrfiaQbFadg6lthN5Lhkk5Q3qTDiqqXJTOXY8vzwFCmCJyr5T?=
 =?us-ascii?Q?M9NIceyirVrIHsBMJf3vWqkLbiSqbY59H7uXAZ7MukDV4ZTt8c/I5D7inBiO?=
 =?us-ascii?Q?fXQ4g+01zHk2mbDpGbAc8uxk0TsoAkTf6edos17aBLuw4N1nQ2Cthlguns7h?=
 =?us-ascii?Q?4Q4XOr5sPrf6wRaly/kMT2/4bD1u2S2+F+0F3uS4RXv/NQpRc9kLeyc1Ezf3?=
 =?us-ascii?Q?PpFS8Ro3Y+lWKX97AlMrisz1l+Q/NarQ/01y+Op0O3dRIdVGrI0mBwgzlQKS?=
 =?us-ascii?Q?nQvDLYniGisO8ORSfYP8GqRWUUK0dzUiFGTXuosZv3XSgc1+wJ+J4HY8UpM9?=
 =?us-ascii?Q?dMUByxnYRLgEHB4tQLAn2Gp6altNwMAl3ozK2hX83jxVhFKQdTTJyAUSgd/Y?=
 =?us-ascii?Q?Xfnkthq8bIRSPxKWVRyPMsZ1c0+uxd2Atp8m4RFyyJkOKHVvwL22LMmM+id7?=
 =?us-ascii?Q?Sk7bNPDbzGv/GBhrsFS4pBUK7VttCSSYcy3OYwyYrMToiQkt93Gt7VEVEJiT?=
 =?us-ascii?Q?CYKO4qi9q9PAzvnC0IAXyB9VcdUiS94KD6GTvDGaM73HCB9+3NKmlTdE3ewb?=
 =?us-ascii?Q?jOG4qs0DnraCNHr9TF683oF7r1EHxgbm/Tax+f0Afgrp1773UoUje8JyK5qx?=
 =?us-ascii?Q?HKzsEL5YCw=3D=3D?=
X-Exchange-RoutingPolicyChecked: llQvkLRbxwiebZsA8FtAsbJTzCWcNvzTbM1w+UMJSDJ4/Z2CH1ZRzCueVR/HSNsQIJbhFTwyHM7acEEWZ7hW17vG0ZlxqCbCsDFNcFfkbZZ2XgQCB7tAYSjpt9wrKTnT7sqd0tqwBjVZP3AiDC55WE0+mCatZzJBA1wXrGgzAVpcJIbDujV8bP+NmKbOwIjdu4xx4C9/pD+9mGkDTCnEkC2CWOwoJYib+zNtL9MpMpkrxoZUsLm6NlnyzSvmixd8AusvVusugJTSTNv5KWjmyWPcPv5jffNY4YvccDARorIUfhhs9I6G8B3T7Fk3huAnQlBNR+jF2h8cPE6ijdRnWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80165b38-6e7a-491e-7618-08deb5d2421a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:12:59.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOZQ1jnPm1SycYCyLhs9jdlqAWwjbj/QXgKDkRteHtE6ROo1ylh7N0Q/aCsHB3eDfKdFiBEhrgesdm/DVOYRQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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
> Series: drm/i915/dmc_wl: Remove macro HAS_DMC_WAKELOCK()
> URL   : https://patchwork.freedesktop.org/series/165728/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-4950-9ee30ac229d686465b572e6404250178b28b616b_FULL -> xe-pw-165728v1_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-165728v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-165728v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-165728v1_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
>
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22]) -> ([ABORT][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [SKIP][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [ABORT][47]) ([Intel XE#2457] / [Intel XE#7405])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-9/igt@xe_module_load@load.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-4/igt@xe_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-7/igt@xe_module_load@load.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-8/igt@xe_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-1/igt@xe_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-3/igt@xe_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-6/igt@xe_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-10/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-2/igt@xe_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-2/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-9/igt@xe_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-10/igt@xe_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-3/igt@xe_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-4/igt@xe_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-8/igt@xe_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-10/igt@xe_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-1/igt@xe_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-6/igt@xe_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-2/igt@xe_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-7/igt@xe_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4950-9ee30ac229d686465b572e6404250178b28b616b/shard-bmg-7/igt@xe_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-5/igt@xe_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-9/igt@xe_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-10/igt@xe_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-10/igt@xe_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-4/igt@xe_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-9/igt@xe_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-2/igt@xe_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-4/igt@xe_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-3/igt@xe_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-3/igt@xe_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-6/igt@xe_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-6/igt@xe_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-1/igt@xe_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-1/igt@xe_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-7/igt@xe_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-8/igt@xe_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-8/igt@xe_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-2/igt@xe_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-8/igt@xe_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-2/igt@xe_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-2/igt@xe_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-7/igt@xe_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-10/igt@xe_module_load@load.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-1/igt@xe_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165728v1/shard-bmg-5/igt@xe_module_load@load.html
>

This patch has no functional changes, since it is replacing the macro
invocation with an "expanded" version of the same check.  So, CI
failures here are unrelated.

--
Gustavo Sousa
