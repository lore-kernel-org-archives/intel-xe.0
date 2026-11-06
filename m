Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD607606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ACHCvoZ+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F3910E489;
	Fri,  6 Nov 2026 22:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9290113027
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794003305; x=1825539305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zb8q1I4sR0IkDpCzcxK8K0UK3xKAsf8AE2Ugb1Aqp9M=;
 b=ACHCvoZ+P2KKZZg6u1KOIRgd2N2Cn9KWAWiSJJI0NvreCZOYHnNXEqXg
 jtb8wnpBtdtQSro0QBXehVsUQmpG8zpQDLs+0y9LODw2jz5TeJbH37//p
 hv0FpqEIn9MczwkrzZaTmV99BWoezn5iRt8vrgMaSE/oFhPPlM3jwAKZY
 E7DBvTz17rdIHR9mnNLP2o4jmEKFSOk85L6QPVFVzuQ8iU3KY84d/iEts
 gLrF4REtEmh7UQujsKwLGNW+NqM34JhfnWtqOEZZXrIhCuaf4XqNeljLz
 M07umR4VS+l2bMXam/p6GD7FeINlYh/uX7rq5hlt7/C+oX3/za3VHZ8nB w==;
X-CSE-ConnectionGUID: pfxt+03CTEuIGY4LHX0ABQ==
X-CSE-MsgGUID: bdIjxevdReqHxkVySyVelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2856648"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2856648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 14:15:04 -0800
X-CSE-ConnectionGUID: MhxN+hk4TCeEEZwMRIo/UQ==
X-CSE-MsgGUID: LuCbEb0bQPGaH4G/qBRoGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7430953"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 14:15:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:15:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 14:15:03 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:15:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU+/uhG5MwY1oi6AvCRG1Uq6615dHV6VaF9ohHzHy5nQ0901231YPYwgyVdl7vAMRmOLS6unq+miv3a5jDzOhqkN7Y9ViN2E5xgGyUgyHDIWCQzDYvJHb3BU4zYBhLE2n+uZZmguy7yt9FagowVn7pzXO/CjyVPu3ZJYHOcrpQ4KJgmoZ2cxt4Z5NrmUx2HnVklo3iFzaAhkSba57hpvxMvs7le3Ntpi9nKkNUyNbLKYGrK/SXBncpxdBPz9KTek8Cw6BMgI/jnEFpXurZcfd82EQAOSzv8+Aeb3TlrDn64tfwwh3ViLI/zGxV0YIGDzM6aAlVHHHWvyDiP+jq39Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYMpDGZZEoyfhM1gGbnvdHPS/ceKx5vdW9ZPL/TWpeM=;
 b=HZ+JpFjsCfCa/v4GhYv6LtSDOvGWiNwnTWGSU7r3T4ERHLtqvAY7J5ytJbIj/DpNUN4DyosTftFn2WhgbjILjRbGZO2sSX3/dlqhYvYc5grIE2yl8kbldAu99jbKqNbHArErqQSDPDYTyGSbYHfXjFTcRT+Lqeis6+hm+5TaiTegtj3xHlVfiYRYzgG7a7F6iy8pFQVio/7CRZZuWH+1Hl931dC11jYViSpXRrXjhtlUbvubplNOBTkiS10Gb5hElYdwePqpoyL/PhVGIslf4gTrGYsPQKMJIAXXBfEdBvUG2EV8njam9zCRbP80VoFRjca0HKm2/7641f+si7/zFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 22:15:01 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 22:15:01 +0000
Date: Fri, 6 Nov 2026 14:14:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for Fix
 VF probe issue due to missing LMTT dir ptr (rev3)
Message-ID: <20261106221459.GA6134@mdroper-desk1>
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
 <179396296566.131702.1059761035603738517@221881a7231d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179396296566.131702.1059761035603738517@221881a7231d>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: b09d67e1-c150-4a22-75b8-08df3c5366a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261102123227099003|22082099003|18002099003|261009223027099003|11063799006|261022105027099003|4143699003|56012099006|261026130827099003|261022075727099003|261022113327099003|261028144727099003|261021123027099003|261021121427099003|261022115727099003|261026121527099003|261026135527099003|261026140227099003|261021130227099003|261021133027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info: jxqQDAeDxYGhoiZcNi+sxsMkr0IEuQYoLFqAKJftz+ifPSxgPEo1v/KEAyFMkR3t0GIWk5UIvRJURAbbm4pfFnqKrLYrkbBK1X65HVckvvxglXgQh7KnOk1KOotJfpE74/f1fBG8aytYt60BN4Xf1ORklZpeMOlwWqpbKfNC4N1MteNhNSj8ZgAeZUQm+efuRvaqjd93FG6fKKQqFjdxThltHfMo5jSVE/3jC8/YVbukbPkYrUPpWoCYAA5p9rRIP0BUqvsBjltgaiKjrm1dBEmP798hLXtU9gmG+IYgPDmlvqYqPyLTTDjpWZPV8H3WZi8TnuVrj5n9MFYGggeuwAtf89gGfi2jtX8TxagCaVlwrAxFsYrS6mgFTi1kikXvLNcLKU4jrU3eQvlIJRv/vgKAe3DXvydEM/kfyCqMbqJxm6SBpgcuXthWwxa+OhObatKk0GkcLdjQSHorXpATNKFch0Hl8lXb3HoSwGjtNOhCjE0FyzM5Qim538MISsba4IqYaeRhKaglkxB2d/z4KML2sZ9PypP6x1E6c8QtuN1ZtgNqcdtAm77eDE6p84o1xSYh7oq6nYrIT0c3HPEy/GwjRuOvAsCiGx0CdaU3X5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261102123227099003)(22082099003)(18002099003)(261009223027099003)(11063799006)(261022105027099003)(4143699003)(56012099006)(261026130827099003)(261022075727099003)(261022113327099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022115727099003)(261026121527099003)(261026135527099003)(261026140227099003)(261021130227099003)(261021133027099003)(261021135927099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jh28bRT4H+1wjFsGcJXsEnQX8NJ72X7eS6g7Za4GlB9j7oSFAlWcyVoaitK0?=
 =?us-ascii?Q?jT91oLD1JiHJgPoDShQAlNNK4UkOzlOGMsDuAvUyTUbmsyMMOJBcwW8xMNSl?=
 =?us-ascii?Q?puV7w1KK1+Gpjuu6hmY1TFnjM4flZ0mzVFJFvcGQEmEgMwYeZu2ecyRoloBW?=
 =?us-ascii?Q?vq/rB5euAkF8+l0EyI4rR5M8YayiVgzQ6lht7kPJfWlEWGpu1bji2IbladKs?=
 =?us-ascii?Q?lKttMFqB43uWZFNG69WrLqEvCOe8QboTlLDK8S09YiqDqufucHdMjOIVoA7S?=
 =?us-ascii?Q?S6pkN92ARhePyNu99ekJiafW0m9l46kn25geb7CJc57OPElKrRktKZaQg5U7?=
 =?us-ascii?Q?ZRf549vC6L6eSIhE/UIaIY+6j4+tVFBfLPkk3nlPpiGqnKVIpW1ot5JyDPmm?=
 =?us-ascii?Q?LKxyX6da1NZqbBm0qey217Wm1GM5rxH/jdAOiuhoI6RlmMvElRhwWxM2Sfkd?=
 =?us-ascii?Q?o+N+u0VspoS0bb4ePj3xLaB99zt1gZm84JkMalD6ZpbRdtD1otZCa/YOadsj?=
 =?us-ascii?Q?YghEezTSz04gvylcTzvvhz73qjPq9zEsjNZjBG8J/VQViBD9ryXKDRFd97cj?=
 =?us-ascii?Q?YeknOaOZnHYhiFIng22c7eVduIJWh+YDshSvagUUuoAfG/+1daxRI3aALM9G?=
 =?us-ascii?Q?w/JwOdvYpKiW38JcMl+x6ZA40a3L+gz+AjIiKDjrr5rljAKSj1OHXwjlLxTs?=
 =?us-ascii?Q?CnwRtOC5O3DU0A2Hpfx6MkZ2AuwrnqfbUPqIPT05zgmai97ePZTsThLSHf3T?=
 =?us-ascii?Q?u/5EKP4B1bdDtVAIk4upbwG13e16SZgTT6KPn78OTKh8ZLWVrkwXWLP17HH4?=
 =?us-ascii?Q?Q0QY///GD3DkEs4QWeTBwSenXGHBeZjZkKQU455a9zMiCRsO0Cwqdav3XRzh?=
 =?us-ascii?Q?Pwkajwl2lySvhIXL22D5wvtFMrixezEl1FcdknfkGm1uaQMnHFpo6TgxTNUW?=
 =?us-ascii?Q?n0sLZ/sehVCgCtA3pFZ3+12GTsnIw5Bp69q+ZdK16MAFxTqzKWJaUkp5+EW5?=
 =?us-ascii?Q?/NOjKsI5Md29a0E0VkzEuAUMZYsTBqZfv5abQTtavmshlzHkYufgDTmPO3QN?=
 =?us-ascii?Q?PjrIzSizoaIb+dhtZT/9iaH2Fy8i/vpzbPzFJF9w1cXDDKQyOsUIXUtciqNU?=
 =?us-ascii?Q?GGq8Tt2NwKh2umUMd4zwzDSEGUZdzgkqEwXtXbW7URKEcsbCO2bYqKSpP+xz?=
 =?us-ascii?Q?qv+GuTJhdr9GbfGYdvTcYgHe9/nebhp53pmOKHj/5QtmS59ExLvtOX8UQRZQ?=
 =?us-ascii?Q?rzeSWciD3QQGQUO0gitrYTcL79wtBq14c+4Rwia7qIN3Wzswv2RM1UjB9Wb/?=
 =?us-ascii?Q?YhMZ+UeJtZYJRxQZr31ZaPSS0rAxzOUJnIMHzoNm27PPdalsIzYTj7Xz8J6Q?=
 =?us-ascii?Q?FtAryHlYewXth09v9oNboysp9N+pTxTeOrkEEqZ57lBoqz8r0TDKlthTQR0n?=
 =?us-ascii?Q?zT4D5gGyW6PhTlgN1P0Q+wkTnMQZoXX0BXu9XF/uI/mAkdaZF7N1yb43PPz4?=
 =?us-ascii?Q?EQy3CxrKRPj04NJN1ZB/k1vYAXKOx+HwEK04ZaIZeLdYbDyNNmMItUIGjPRI?=
 =?us-ascii?Q?Rw1AzsfoFOBUVmTxiV80GWEbIzoLIFD2YLHT/rlD7egg33GAqxaVMJZCqFT0?=
 =?us-ascii?Q?N0qPT67AWH2+JdNwvULhPLg4N53xN0a8ThgPFSDolLBFDdfUkl3xD3HjxJfw?=
 =?us-ascii?Q?LXxKMsayvqrTsRe5CiCUkGrtPmYmSQZSpI9ftOdmXUP/F334aCpYi9yJNFso?=
 =?us-ascii?Q?zfQzQssXZOIeaPwm3fOciTSHNUdRhPs=3D?=
X-Exchange-RoutingPolicyChecked: YsBV3kQGqkna2Ay9sJWpT7K5MPg7GjVlGdkzip+dQCQSJqe+e4osros4gbGOdGKm3VdhwT6foYNB9C7QRnKgeL6Kyk6m9F+DZ3/nRJYLT/322hIFs7VfJI9p+JRz/FxzWG4+SmWW7d8cFAbFItba4IA0xt4IhUEWn8yujqXfvy6gYdW9xErI6XbYeIUtjn5Pc/pvjQdm7FXsuPSw0UXkbah85fithPRQ/yKRWNhagowspCcsF9GLS8R6/CBlhEd9oQlF1hoWjmsKypfR63NuYJybqRDKk8jvlmdo8GPKbx1oVs84dTFwUPg+oapPw533ZRdj719MGMS4USKPJ+5+0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b09d67e1-c150-4a22-75b8-08df3c5366a7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 22:15:01.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rShNa7GvvjccXPSK5ar4AI4yHh4v0xLnWVSZd0joLmrP6PAM273sz0DkgrLs0dG1Qn7PJpM4EaIlk65qsQjarqZmXd0Jt8++6PIVKiAbOG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:02:45AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix VF probe issue due to missing LMTT dir ptr (rev3)
> URL   : https://patchwork.freedesktop.org/series/177598/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea_BAT -> xe-pw-177598v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

The CI queue seems horribly backed up and Xe.CI.FULL isn't back yet, but
full results were clean on v2 and the difference between v2->v3 only
impacts Xe1 platforms that aren't covered by premerge shard testing.

Applied to drm-xe-next.  Thanks for the patches!



Matt

> 
>   
> 
> Participating hosts (15 -> 14)
> ------------------------------
> 
>   Missing    (1): bat-bmg-1 
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea -> xe-pw-177598v3
> 
>   IGT_9180: 9180
>   xe-6079-7797f00bc4da28646c612b8130ccd5192548ceea: 7797f00bc4da28646c612b8130ccd5192548ceea
>   xe-pw-177598v3: 177598v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
