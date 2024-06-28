Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE9AC3064D
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 16:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C210EC92;
	Fri, 28 Jun 2024 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGdKxEvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470EE10EC91
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719590727; x=1751126727;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w6wOcz4PC5dtkJV3cywvlK8B4twRBRj5hgK6HOSHBTE=;
 b=bGdKxEvHZTTyx4Hs7VEKP+oepn2x6kNbGWKKvWsr02yKbrDpOwuEWExX
 SpSMjIQsXosPOIjL6DA8QtEgngFQ4XIS4retz1AoK8pSoZCXrTyDk/Oi7
 EPf76hDKNxG1Kolw7fqiLPhj/R04W3ASFjFJbi5eGHYquwsXuG+qGFoog
 gtAVrCKtFaoIlSilHb3Bi+cIn+2UeM/n/ggW97trk+9V/BjJK8ypZcnle
 3EzPUVhFkIHJTPy2TIUuUjnJX9ol5Cs1I/tLi9zwkITHrccq2Pp/qZVfb
 fD+WABjUZZYasED0LpOTRly38oMK1RuhzPMz+boKBhd04QnW+z22ha6cH Q==;
X-CSE-ConnectionGUID: EIgLazbHQPSwGkVJUa5VFg==
X-CSE-MsgGUID: NJnP4LcOQTi0jbJ9sR7Dkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16602635"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16602635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:05:26 -0700
X-CSE-ConnectionGUID: IBZVv/fnRke27nPPJOdwfA==
X-CSE-MsgGUID: 1g4TmMogTkidV5uN6GwaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49740047"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 09:05:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:05:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 09:05:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 09:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1lkKvj4Pvv4DrX26JnVqkYQTDz0TZrD40lUcamG8PmeceXiwNKE1sTbMpatiR5Hbfj2KZuDuRRJfKdaTqbAWPLHjYtlUCuIvTeTZrCkzdY+WZ1c4mzn81XDb5RMxpC3lqBFM0tOgKHSQTT8G7xwrC3sX6yOxfonKhFieCVgAcKNN3lCEDWJNIUn62q7gIoqXoYLlKgt9xp0UBDblAXmVqzK063vn6Itd2UD3hqXmoOOjLjqS8V9YBGqkGch0x/9QMMnZK2tG45AqZQB0GfM+HugH/TtVuCV3En+3+C/iU2zmZK/wUXG8sBHR73X3Y/6uzkBM9/tcEotcBlnrBi1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKi3atwyKF0n5ut1uaxIFkxjU5VblmQM1S0oTF8FZ6Q=;
 b=fxtqDTzJaHfDqJdcv1qEPhpVWxOp0ZOnD3eD2akyghCRz78TKWqe5hNQwGRmWrpArJp+jjFpaJ69lVJyndTq4Isn9Eknbq2+6E1dAF6Jrs2mFqjPHAaHXWVY4YKPKroC4EsuKjYcefWJs9xFtf04xoondJ2mJKEUG4mPGbOlanJVqhDsC+eOxEVhPgi0lKyBQNeNrJD27H+VvQId22CS0TVgPNhOJeML/6PJvwY+yau96iDpirl/GrNukiJnjuq7GDreBxLA2Nk57lJlo7uOvGYoVM0s+QJTckPo4Nq2TEiXplbej6JsDz7NGtZXl+h+vj9uI10/AY+aqg57g+vbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 16:05:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 16:05:23 +0000
Date: Fri, 28 Jun 2024 11:05:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Message-ID: <i6u5mewr37v7ujevqsevvjcdq3g56jmn4zyquv6qym42i2anvq@ve57hgm3xovu>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240624215404.3213075-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:907::28)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f8dba2-beb5-42d6-d25f-08dc978c1de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FsEMcrkX0NOLUMaIO+YJ0kMh8pMMJD70uoKGhwbjwet6kXClkoXqq1xSpJ9m?=
 =?us-ascii?Q?9hKKtLrOKl6fXZICZGnumFvRCQT8H03Zdqpulun1IZsGoCR+nQjf78ZGR4rX?=
 =?us-ascii?Q?cOhA+Sn0YHdGbyAY9nM3lo7vjNvC2kHgZaQB/mzz7uKV9oSbIlFOLHUwwPex?=
 =?us-ascii?Q?Z0H3iAomRPy9T3+R8qeypm7cGTEFuz5eElKbGtB1HMNra4bfz81qNIopvyWC?=
 =?us-ascii?Q?OZ/WmXRNIpwp0VipoQig2Z6YhdPjMEhk0XIjoQ3OsO+Iyrr92w7migvdoBWH?=
 =?us-ascii?Q?w9atTKsXBJ/bKsaoKOxPYLSpAUrZPidB6FRSn9NpKkm7r/G1/xeyF1Ur5DqX?=
 =?us-ascii?Q?D3AtQaF8DEDXcaSUp86m4ABYrfXxWW/irL5YVuSVwEZ7aBruT7i9RDKNchfR?=
 =?us-ascii?Q?DYLV7Y/HVp0YJBTlS8IAvf1kuo0bs4kqP+Sc3+s1Mm974ASMJ0NncmdVLzWR?=
 =?us-ascii?Q?yk4BCvZ9/VEw4+s75JcU/jXnP0hQOe4Uc1jvqXexgP0YqJ42dFQemHxIJ5Z5?=
 =?us-ascii?Q?2mWs80mC5OXYHI0/Zc8+9zwxTjUHloPTCtG3BYkBZIh9vUoBMgUGKCbDCVc/?=
 =?us-ascii?Q?7O91j9hjngl4xxbCH6FuDbTRPr2kJoVX9zirZwvyzkaJfVeBu8NQvb75HQi+?=
 =?us-ascii?Q?UAFdngrmdYTsCDS+n14sxWB1PDmdkn/tNvCG+X1ryV0KFVKcdU9nCxs+Cfwj?=
 =?us-ascii?Q?15R5blO19roBTyHP/W2HBTNlzYYzyRwHVHys3etpaZiwMLDHyXRMRd/0599p?=
 =?us-ascii?Q?ACSwclD5L0RdRoJfuuUSQLoXxfftgQshPpTso7evK+msRVMORIBgw6cp43Gh?=
 =?us-ascii?Q?3Tz/sCDxdDj48n3X8f9q4DfA92PeQM60O+vzbKqzJ8v4Y3rfxWjdxfCqjVUV?=
 =?us-ascii?Q?8aG9fZF3WYfhNlEZKw/fDrt56uIjdp8ikpf9r14PxDDHi3Y4imYQwfoQ17ej?=
 =?us-ascii?Q?5qBQ/QQg3JgG1K0QdFZYmwGU9OYwgRq0VVk5Qw9DeqOH3iATnUJN7n8QHwyl?=
 =?us-ascii?Q?YIdmeKu2NmPQEpb0GrqdYyD8UEEmysudARfhNaW0Zkszi/Xp4bG3WFmUBWPG?=
 =?us-ascii?Q?OB9cjhWs1bkv0b9Npy9uJoMAuytq7JRhwSQC7MJ8E5Ff1yEiqTn+nSZ2u9Wp?=
 =?us-ascii?Q?u1R9BlcRLTLijlNlrK8ZVswium2FN0uJTpJ3VE/WNA2fJynjE8cJDIvI/UHC?=
 =?us-ascii?Q?ss7mW2PYVxeaQYAqf9NHd8+FBqm+uYGXkBlWBkB8K7g6AAWWF5EMvZFSy1h7?=
 =?us-ascii?Q?STO6X3l3kzlCBXGEWysLxi/3rNvN5eWIfZJZS5H5rA+Apm7bkoo66I1EX5Yk?=
 =?us-ascii?Q?QNQ/EZVuvylLgaqqOpYi6Ul9rAkTj/FSYjD9eJlNWP3x4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u40b5HVsAjvwshC6+8z5elNuPX0h4wkj3PSXQTilAU3YJyiHtWLKvsFFC6V/?=
 =?us-ascii?Q?caZn1ZcClOK+/wFhVCsd4uUuazwefe9aKXrdpc7HFzEkQuIHs3P4kV2p8GhV?=
 =?us-ascii?Q?BCDio+KeNE7CzGVtTIF6x1AxqJO2YIHljuSEq9kxbYAmRumehYhtHNUw8noQ?=
 =?us-ascii?Q?iz+1K7hpLbXA8Ucbdve2s+uSOEMQrPZJiF7QimmFqjzmgC2Hp+7fL/iY5HxW?=
 =?us-ascii?Q?loudvc0BYenSeN1XtVxaPBUYKQ6QUBk0Upd/GG0LTQ5yE1hATrrL2s82wUr/?=
 =?us-ascii?Q?bVvu0yra4O1YJZgH89C8gwMDZ9w2+tYOKjbp/G++kosNhCyJtZLJT79jYsww?=
 =?us-ascii?Q?52vO9VVynLZpbsydLKChS7rctPyU81Nrcv7BKyOQ4ALbJ0GIyefUOaYmlapA?=
 =?us-ascii?Q?GkMn+YH9nBlSGi1FLlthOqoZbRb4Gja0Or3jaHvDp0aret9+Nv7T5g+W7gPq?=
 =?us-ascii?Q?IplNaS5vzTIBvw3am434MVklP1Z4MGAn+ftGGLZkte1xOJboTgkOwp2Rzlc5?=
 =?us-ascii?Q?WdNoI8bV1YmGGVROHW7Dha2+5L1vVQm2FMF+NBiRl6/a8l7CxXXhtKUfwLqr?=
 =?us-ascii?Q?g5XVJXZDvqPwdivcOi9OuyxbKn3Jxuei1vZunqXQZGTmwAqH0pSQAI0tRqWo?=
 =?us-ascii?Q?bwy48rSfJ0o9B6bwbOTnp1stJ4av4+MlWLQoGjtVy+S8Bsnkv/pWhI9As2tA?=
 =?us-ascii?Q?CASfniNnsJ/C6yyzS+S1LSFI93Nh5i0IQ95JfoasDvQvmHyCVd/NHbA50TRL?=
 =?us-ascii?Q?xNkxDsqDXGFBw6SgoFYma+kNWdALI5GBXirTcZBT6JmpgEnQ89eM1e+PzC3B?=
 =?us-ascii?Q?8tSXg1YgjtNMA2/zJ2zT8nGmbsVLBcxwqA/du6X0M37uI7+rZwMIeUnet/qo?=
 =?us-ascii?Q?l7cCXZ/gd9iI4nv2bZGovc0y++AxWoRMZykSYjZwUo1js+iY8Yi+vkGV/p68?=
 =?us-ascii?Q?S5lgUCwTQRNZJ1rVOwTX4+/ZPC62HTSc6exe6la3HRuZO/faOdozhijitIEJ?=
 =?us-ascii?Q?HMYOW8IU9NaiK5hd3tjo3C9ej7z/2gO0YY92E0fHJKfdD0+YVzGKhzcN3V8c?=
 =?us-ascii?Q?PYDXpdRRl4SUhAWHcY5UnnphDUloR0eMpT77A6G5mYZqmTVWHre3flchHfny?=
 =?us-ascii?Q?5Kt+9hd2wsFRINu+xJsaUwuxuEq7okdDmW079XulzOPTUEUQoORAfFMX5OSK?=
 =?us-ascii?Q?lUe8ZS8GTDRBNRv7XAH+Vm6whhA/vkQyymHQ4bSQ6Qxj6n4iXemr9GGWBFXj?=
 =?us-ascii?Q?oQ3lZZEAqSNvIijHl70JiEH15/ACjUeFqYpu9BsofLObNefGDoiw7Un6XgJS?=
 =?us-ascii?Q?UJAOsw2+3SC86UW0m0eemqlGReow2SJ5jIXnEoIMvd0uTgz6xpKiI9TvqnXr?=
 =?us-ascii?Q?mUY5hthpUUG/hCIz3jmQrIt3wwBB4XKRLffhcQMB42es9OLlA7sCgMLMAQXx?=
 =?us-ascii?Q?gr/KfrHNkq/01F4xzF7tncqXEWTYTQ8twCV4OqLVuGJ6CAL5QQXCGvc395PC?=
 =?us-ascii?Q?SClG2MkheJKQ8wdn+kTo+BML2szvBKp0tiRYrMmhvyBxcR0jpyF4LSPI1AvK?=
 =?us-ascii?Q?U4ZF/SXURtQRFGUNMS8+jpbAR0RAqc2rVPpfkaNHNvRjXkCpmn+6VKGOpP84?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f8dba2-beb5-42d6-d25f-08dc978c1de3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 16:05:23.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNn64fK48oLLKbYlYyziRSC+wqYU3o+OHRtdG2Mp+hp93Ns34u7ZLllOnPBnjH0tSdGjJgyhLZvJVCmfULn4n6Pp8iO7FRLCFYR9BPZ0JKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

On Mon, Jun 24, 2024 at 02:54:00PM GMT, Zhanjun Dong wrote:
>@@ -398,6 +401,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> 	struct xe_bo *bo;
>
> 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>+	/*
>+	 * At time of ads init, hwconfig was not loaded, engine info like
>+	 * engine mask is not ready.

pass by comment: this never really mattered and was just artificially
done due to delaying the engine_mask initialization. engine_mask comes
from fuses and possible engines from platform, not from hwconfig.
This is gone since commit d69c3d4b5382 ("drm/xe/ads: Use flexible-array")

For ADS initialization I believe we still want size 0 when loading guc
for hwconfig and only calculate it when it's for real. This guc double-load
is something we may get rid of in future.

Lucas De Marchi
