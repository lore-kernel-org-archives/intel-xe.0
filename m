Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F66F506DA
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A110E10E;
	Mon, 16 Mar 2026 14:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8FcLi6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D6010E10E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773671970; x=1805207970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RWcH2dCVRKWCdz5BRrDyV6c2mCu0vl23xcdn/H4jQA8=;
 b=Q8FcLi6rUYIacvTZ/3/1Fdd+I6ROY/WykcVNU2sRTiJYwPOTzxLwpQOa
 qEOVdS6xgoTKHzMqA8oZJ930HsmmLn1cILrf5kFL06+UMyBt74kujXLTv
 Da9NxwP5fKNN7FjLHE9mg+wNS8Mnx0sriEDSVP0R5eFMEd2r5gt1U0u2E
 ye6YGS7ahcAB8zBiyPq5DR5s2KEt9sq5f8Qy8J9ZN6bIN0xkPqkF44UXv
 l9+uHUI2yW+u3/LfCIKYbJfsqOMxcz0BuP3HPobw5PgKhNnDLoDNQh5iq
 Lg/8aO739e3GK7MrMruxwYUh6FUzhnoj5zWneUmvhtiAvnRmsAjRB1V1x Q==;
X-CSE-ConnectionGUID: q9cgP6IdT9+LAmyKbQ+q3w==
X-CSE-MsgGUID: zXyFOG5ZRS+n+Ic/wi4p9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74605989"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74605989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:39:29 -0700
X-CSE-ConnectionGUID: FItzlA3BQKSkQcYEcjI18g==
X-CSE-MsgGUID: mpp6pEfcSb26fYIR9oBWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="224143565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:39:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:39:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 07:39:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGF+fhDED65xNGcTcsEMATffaNGtwjn4vL8PnLnjkjJK6et78szH5v3iGLSVJRKbxYVOsllW1B33aHxf7bZ6PY18vpqYImY1nVUxyCAsgThWMi7f4eL97EBAfFZdX02KaJ1g5tRKGikPkXqmJydA90tvygNYk1jA9lvy5kQ5URGbODu1LoQsgkpGRJOdS9OkjDRPycmCNE066tv+1rnmJYaEp0fcEf1CRjMfMo/3TNr3B19waQfqVOHi6DoOA0WNev3yKWPzQCS8Hre0kMbtwYSV9jMIM/LbSmOZia53AqZzogMafCX5O/X0noLjNGhyBRLlNEyRD1iK810XevntYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJidEl7F611EwVNNJaMZL3Bg7pULXIMPSwqvw6vFcnQ=;
 b=GEEU+vDu792waFaO4LN7rL9Zk1n0v5ECoLPqLGDsGW35jIbMqGRp+kdm54EZu5ZpeUJRqFwoXAhLoYBoCdKwS+dKtJVOp6xX1C/UYgjL5mE0lN6jAPn3SXlmejVcWUXo0xmVYg6QeFrVY0z6RlPR7oad4o6xbbaUcZsuWAQ8NY9LtBrC4G5SgnZMT/6k9Go/jJG+7qKeipcUb3Qfhzzud8q9R2NE00lB27ecFI6S1IgAt/shYX6VuWtdsxOtHJLAtZYjCQddrDQ6AGy0wR9qu8LW942rsp2IIIfEH3J4R3OvzVpYn3GPkFpadU4BsTzLtoJ9lwxO57WpjORus8yQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 14:39:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 14:39:17 +0000
Date: Mon, 16 Mar 2026 07:39:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/i2c: Assert/Deassert I2C IRQ
Message-ID: <20260316143915.GA2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260313080438.4166251-1-raag.jadav@intel.com>
 <177348335569.358627.1317088559679870779@a3b018990fe9>
 <abWnm_zYOZ1xMLUY@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abWnm_zYOZ1xMLUY@black.igk.intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1f1691-7e15-4b12-a12d-08de8369cd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: vJjYbVpCxJ8oSm1F30SLUYUK7ILnS6niQu15esKV3wAN2oyRmnHaJLlQKMjPg6jWucqJX48qLz5+G03SoV7L1CB5g3abzDuduThNQdzjwAurnUQzRkrmy1fvbE7b91rCS34KIByEXeSDINT6734kldP0vJEKOk44l2ZwKTrcWQe2CUbK1HwnvslSl5fpbLfOzUzoiONgWtoD7RiTte4rU6oHkTosMs63qksOWQJqxmqJBhyuJcOvUCUAAkeX3w1idONc5ZE19eC5oCWIaqo5Ti4rdpYy6Qq62+w4VsQYVhQPvj37+gAaHdJYqr59ZGjjU3D3Djl1NTyKfUOkx8xkDCWmE9VXqz3Pot/gfjNLUDaFk0YAsIZ1Ect1WTsOnXCj5UzcWXob75SHihEDOEx4G/jK8d8kMky7sevLkJ83fITE0UKoTX57X8y8cYH5oPZAc/ZrjCMptwhoweZ6ryikdsbNfdK2t35JTLLTFwjJpoU3wJcI8la3LN9XxqwJfBuzhkWR/0q/tB+2NjWmo3WI+XQfmOjV+SaCcGwIgFTe3V3AbRAcCOfiDklxgVO+b9gVOIUvI3FGDcHtzHF3E/tGHUjdSTiHLBiHWbpCy4t+ydNbnMIzn4ma7PrztemAeofkmxmuegnIVGOAyzw3lYWNRjXwD99Y6fx3A4Swy7KGzc2LqutQfkDEIeNYcTNPp0Zp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3kScInj1ngK/ALPkkK+8lz8YxgDKQtuzXEEkN1BYkZgvsziCoWhpqhLmR4ss?=
 =?us-ascii?Q?aegPYLF8OphvfJA2oGIETPMjR3XVn5WHYVfizzhSqmnz1BGB9gyGtWD48Nx3?=
 =?us-ascii?Q?vXlnursn98oY2JokN4pmhDwv+723i4JWdxanPbklpAARt60loisIMKJve14h?=
 =?us-ascii?Q?f1byAJAWOA7o2q4X/lt3ywxC1veIbI2ncKOrELjcLyEYv4lYEcvMVF9KkFxz?=
 =?us-ascii?Q?4JT3tyBSsr7jfabKcsjzgVvWAoTB+JqqLVzgiWwnET8GcdP107u/KK6nFSwL?=
 =?us-ascii?Q?uHBZ9zzlCKfXoGXfyij+m7z7ylGzYnqt294aKKCh3AaR2gp+M0sWGeFr7dbe?=
 =?us-ascii?Q?FXA2S8J/+YnjlNhIJJp419cFpCFbY4bGzrB3IDvRYL09nE6ElM8vuhUowgjE?=
 =?us-ascii?Q?slvIQmup4fKCKVG6lXspdYbTq8LK6opIotWY4TkZteyHUjTj+Q0b5G+LGe8X?=
 =?us-ascii?Q?8/Dy70SPUirAbQny08F4rr2ksPD1U0e+M/X69mVZFR0ZW1KFlxMPKANKWgCr?=
 =?us-ascii?Q?zekI8vncbIE3vkf5r+635Twq3PomoYbSiyO6Um9CwcEfj9ZL+P4J7ieK9n4e?=
 =?us-ascii?Q?kNqe4PjtoUTTV/gPosKeQaS3ENZutN5s1FOAEvjDuyppV1VBXYGSfoXsFFqw?=
 =?us-ascii?Q?gioPE8CeDOBLE//eLTMIWajKXaIpIdzhyGSLrObVH6etTe13EHZJo29fzU0n?=
 =?us-ascii?Q?0tbu7wJ3AoD17rsXdJJSHScov1a1IHMrKg9Vx4cRIjdSdCHITZPHDPZq27Ek?=
 =?us-ascii?Q?fz9kpins5ObiFY7nIbFaIhuGGxx/Kf548kTNGvHYkmi5HEZsX3nS/Vjq5pvd?=
 =?us-ascii?Q?WQe1dcpf6l0J0IW1//Bhf5QjzlwRc1Cw9Qv5tbxJHJUvyXp55jSKEOd0qPgD?=
 =?us-ascii?Q?eKGOpP3wDHAG4AGTkt7nYgNITlPIG+uehYR1VaVAbypPUSCfc/JqDEYRaFFA?=
 =?us-ascii?Q?qYPA1o9eKF3gF0o1+DlpGXESpgH46JMVZY9naNPDZ2NIyMvEPaxdtZsnUnbT?=
 =?us-ascii?Q?1w0KXVqD5RcodtknlDQOC9rO2ovnic+F4RF30NvlBO+jImzS7vurLca9imMZ?=
 =?us-ascii?Q?nWPaMKRWj5CGdnogI4VQ1zZGFm9vZwr4mkfsFvTu7e+fhNtdq5m/fZeDnRIl?=
 =?us-ascii?Q?Inf0mF4d3cAYgi3HIq7MS+5gPn/gafmu/x9I2Wb8Q4Fn0Z6xwGFKs3pThGpp?=
 =?us-ascii?Q?e5Q/yX/ujbbcKw6js3oO9zxWtGTXLdx5d52eIeKxhRgBAISXA+7xY7VENK2Y?=
 =?us-ascii?Q?AyzwEy3CjygPqSBP1SK2Nv+oIApb7VJnaCwg50cVrjkf/c2TeV4X38xZMgY1?=
 =?us-ascii?Q?9FcBYgZqxLzKf7sX/Hn9tt4PvKGNLfAjgjlA+PM04t/DH3jBlaSsVTjDsBL3?=
 =?us-ascii?Q?a50q/5LSY9hXYneuuZHaIXdYb7xfyV8ttX6fhF8gyXyp1np7lqieLH1Xnlgi?=
 =?us-ascii?Q?Qu7Oa68DJd3kgMWyAufVZoMN7LT9CJVdys8Nib/zxoOuerV/YexSNu7LGaUr?=
 =?us-ascii?Q?AgnleTaepFKg0l+BG64eDq3lQj/lW7AuFJ3GKoImIL73PtTNmg/R+Xf/fu/V?=
 =?us-ascii?Q?NWB2sVEtTJ2zLj2HUQZn9qqFXZx9/QScPXlnuPDQtFR00Dvxks7Pg6QYxGlT?=
 =?us-ascii?Q?mFYHckyaT7RwrovU9w/7z4ycwIh8JMWuO4F188TR7z4O4Lu6up85qAGVZUi8?=
 =?us-ascii?Q?zkq7Fb6C2GZUMptiMSpq0ErFwCENRt2NxJ71ygLyEbqCvmMDRqNNYyVhe+oA?=
 =?us-ascii?Q?+z8TTR5XnFOL3Ap2n2GsWdlSEUkp8y0=3D?=
X-Exchange-RoutingPolicyChecked: rgHugUhfsMhEf/z/LYRBKfBbV9i7uksbxWBgLHQEDBYW2VOEA+a+jnHO9i6gglOhYeUp2QbOf4W34ZgpeNMHsc1li6NtzC+qpDoffvZIPQHL8B+H2nKVqAjKwLanqm7ChGfoe0POb2lqABKnoMA22l9N4QKO3IQc+eZsMsSMeqQeeQGg2w0CbSOLoC5lzuPlx/HrGJ/HK2e5L8bzy/oOpQ5TNbfvL6UGgwf9r3wKAZ8lgbp6CYSQ0rIn9JiZuSsdgl/8v4mEyDJ/noeXVjkdTE2Yl/0qjkO8uaSN85eDOl9r39dwm/wnn7zw1qnJztru+N1QR++E39OxHtXhelNJ8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1f1691-7e15-4b12-a12d-08de8369cd6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:39:17.7109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsSStw9mQfhvj6pxoUUqqG9amYbrGyXWlLRLnwgGXCdp2YnnK2r2jozpA3CRUxZ/oEtKJuQEMn7wLVDz+yhGxuerw+ifgIdQR2LHDYSytX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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

On Sat, Mar 14, 2026 at 07:23:23PM +0100, Raag Jadav wrote:
> On Sat, Mar 14, 2026 at 10:15:55AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/i2c: Assert/Deassert I2C IRQ
> > URL   : https://patchwork.freedesktop.org/series/163162/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f_FULL -> xe-pw-163162v1_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-163162v1_FULL absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-163162v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (2 -> 2)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-163162v1_FULL:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@xe_pm@s3-d3hot-basic-exec:
> >     - shard-bmg:          [PASS][1] -> [TIMEOUT][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-9/igt@xe_pm@s3-d3hot-basic-exec.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
> 
> It's a TLB invalidation failure and unrelated to the patch. This machine
> doesn't event support I2C controller to be able to test this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Raag
> 
> > #### Suppressed ####
> > 
> >   The following results come from untrusted machines, tests, or statuses.
> >   They do not affect the overall result.
> > 
> >   * {igt@xe_non_msix@walker-interrupt-notification-non-msix}:
> >     - shard-bmg:          NOTRUN -> [SKIP][3]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
> >     - shard-lnl:          NOTRUN -> [SKIP][4]
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-4/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-163162v1_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> >     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-addfb:
> >     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +3 other tests skip
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> >     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367] / [Intel XE#7354])
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +6 other tests skip
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432]) +1 other test skip
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6703]) +8 other tests skip
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_cdclk@mode-transition-all-outputs:
> >     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2724] / [Intel XE#7449])
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> > 
> >   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> >     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> > 
> >   * igt@kms_chamelium_frames@dp-frame-dump:
> >     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +5 other tests skip
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@kms_chamelium_frames@dp-frame-dump.html
> > 
> >   * igt@kms_content_protection@dp-mst-type-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2390] / [Intel XE#6974])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html
> > 
> >   * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html
> > 
> >   * igt@kms_content_protection@uevent@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#6707] / [Intel XE#7439])
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-512x512:
> >     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> >     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320]) +1 other test skip
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> >     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2291])
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> >     - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2291]) +2 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> >     - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#7571])
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> >     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2286] / [Intel XE#6035])
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_dp_link_training@non-uhbr-mst:
> >     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#4354] / [Intel XE#5882])
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html
> >     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4354] / [Intel XE#5882])
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
> > 
> >   * igt@kms_feature_discovery@dp-mst:
> >     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2375])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html
> > 
> >   * igt@kms_flip@2x-plain-flip:
> >     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2316]) +2 other tests skip
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate:
> >     - shard-bmg:          [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#5545]) +1 other test dmesg-fail
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> > 
> >   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> >     - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2316]) +4 other tests skip
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> >     - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#301]) +1 other test fail
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-suspend:
> >     - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_flip@flip-vs-suspend.html
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7178] / [Intel XE#7349])
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
> >     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7179]) +1 other test skip
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
> >     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +14 other tests skip
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2312]) +4 other tests skip
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> >     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4141]) +6 other tests skip
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356])
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> >     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656])
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +16 other tests skip
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_joiner@basic-force-big-joiner:
> >     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7086])
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
> > 
> >   * igt@kms_joiner@basic-force-ultra-joiner:
> >     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6911] / [Intel XE#7466])
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html
> > 
> >   * igt@kms_joiner@invalid-modeset-force-big-joiner:
> >     - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#7086])
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> > 
> >   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> >     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4090] / [Intel XE#7443])
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> > 
> >   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
> >     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7283]) +1 other test skip
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
> > 
> >   * igt@kms_plane@plane-panning-top-left:
> >     - shard-bmg:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1035]) +1 other test incomplete
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-4/igt@kms_plane@plane-panning-top-left.html
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-4/igt@kms_plane@plane-panning-top-left.html
> > 
> >   * igt@kms_pm_backlight@brightness-with-dpms:
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2938] / [Intel XE#7376])
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +2 other tests skip
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-p010:
> >     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2387] / [Intel XE#7429])
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
> > 
> >   * igt@kms_psr@psr-cursor-plane-onoff:
> >     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html
> > 
> >   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> >     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#2414])
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> > 
> >   * igt@kms_scaling_modes@scaling-mode-full:
> >     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2413])
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
> > 
> >   * igt@kms_setmode@basic@pipe-b-edp-1:
> >     - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#6361]) +2 other tests fail
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> >     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1435])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> > 
> >   * igt@kms_sharpness_filter@filter-scaler-upscale:
> >     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6503])
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-upscale.html
> > 
> >   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
> >     - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> > 
> >   * igt@kms_vrr@max-min:
> >     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1499]) +1 other test skip
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_vrr@max-min.html
> > 
> >   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> >     - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#2142]) +1 other test fail
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> > 
> >   * igt@xe_eudebug@basic-exec-queues-enable:
> >     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4837]) +3 other tests skip
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@xe_eudebug@basic-exec-queues-enable.html
> > 
> >   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> >     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> >     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4837] / [Intel XE#6665])
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
> >     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> > 
> >   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
> >     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7136]) +6 other tests skip
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html
> > 
> >   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
> >     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6874]) +13 other tests skip
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
> > 
> >   * igt@xe_exec_system_allocator@many-stride-mmap-file:
> >     - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#6703]) +56 other tests skip
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-file.html
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-file.html
> > 
> >   * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7138]) +5 other tests skip
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
> > 
> >   * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
> >     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6964]) +2 other tests skip
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html
> > 
> >   * igt@xe_peer2peer@write:
> >     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@xe_peer2peer@write.html
> > 
> >   * igt@xe_pm@d3cold-basic:
> >     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@xe_pm@d3cold-basic.html
> > 
> >   * igt@xe_pm@d3cold-mmap-system:
> >     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html
> > 
> >   * igt@xe_prefetch_fault@prefetch-fault:
> >     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7599])
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-4/igt@xe_prefetch_fault@prefetch-fault.html
> >     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7596])
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> >     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> > 
> >   * igt@xe_sriov_flr@flr-basic@numvfs-1:
> >     - shard-bmg:          [PASS][87] -> [FAIL][88] ([Intel XE#5937]) +1 other test fail
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-8/igt@xe_sriov_flr@flr-basic@numvfs-1.html
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@xe_sriov_flr@flr-basic@numvfs-1.html
> > 
> >   * igt@xe_sriov_flr@flr-each-isolation:
> >     - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> >     - shard-bmg:          [SKIP][91] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [PASS][92]
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> >     - shard-bmg:          [FAIL][93] ([Intel XE#7571]) -> [PASS][94]
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> >     - shard-bmg:          [SKIP][95] ([Intel XE#2316]) -> [PASS][96] +1 other test pass
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> > 
> >   * igt@kms_pm_dc@dc6-dpms:
> >     - shard-lnl:          [FAIL][97] ([Intel XE#7340]) -> [PASS][98]
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc:
> >     - shard-bmg:          [SKIP][99] ([Intel XE#1435]) -> [PASS][100]
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
> > 
> >   * igt@xe_exec_system_allocator@fault-threads-benchmark:
> >     - shard-bmg:          [FAIL][101] -> [PASS][102]
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@xe_exec_system_allocator@fault-threads-benchmark.html
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@xe_exec_system_allocator@fault-threads-benchmark.html
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
> >     - shard-bmg:          [ABORT][103] -> [PASS][104] +1 other test pass
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> > 
> >   * igt@xe_sriov_flr@flr-vf1-clear:
> >     - shard-bmg:          [FAIL][105] ([Intel XE#6569]) -> [PASS][106]
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> >     - shard-bmg:          [SKIP][107] ([Intel XE#367] / [Intel XE#7354]) -> [SKIP][108] ([Intel XE#6703])
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
> >     - shard-bmg:          [SKIP][109] ([Intel XE#2887]) -> [SKIP][110] ([Intel XE#6703])
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> > 
> >   * igt@kms_content_protection@legacy:
> >     - shard-bmg:          [FAIL][111] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][112] ([Intel XE#2341])
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-6/igt@kms_content_protection@legacy.html
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_content_protection@legacy.html
> > 
> >   * igt@kms_content_protection@legacy-hdcp14:
> >     - shard-bmg:          [SKIP][113] ([Intel XE#7194]) -> [FAIL][114] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14.html
> > 
> >   * igt@kms_content_protection@lic-type-0-hdcp14:
> >     - shard-bmg:          [FAIL][115] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][116] ([Intel XE#7194])
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-bmg:          [SKIP][117] ([Intel XE#2341]) -> [FAIL][118] ([Intel XE#6707] / [Intel XE#7439])
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_content_protection@uevent.html
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_content_protection@uevent-hdcp14:
> >     - shard-bmg:          [FAIL][119] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][120] ([Intel XE#7194])
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-4/igt@kms_content_protection@uevent-hdcp14.html
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14.html
> > 
> >   * igt@kms_fbcon_fbt@psr-suspend:
> >     - shard-bmg:          [SKIP][121] ([Intel XE#6126] / [Intel XE#776]) -> [SKIP][122] ([Intel XE#6703])
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> >     - shard-bmg:          [SKIP][123] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][124] ([Intel XE#6703]) +2 other tests skip
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
> >     - shard-bmg:          [SKIP][125] ([Intel XE#2311]) -> [SKIP][126] ([Intel XE#6703]) +1 other test skip
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][127] ([Intel XE#2311]) -> [SKIP][128] ([Intel XE#2312]) +12 other tests skip
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#4141]) +3 other tests skip
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> >     - shard-bmg:          [SKIP][131] ([Intel XE#4141]) -> [SKIP][132] ([Intel XE#6703]) +1 other test skip
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
> >     - shard-bmg:          [SKIP][133] ([Intel XE#4141]) -> [SKIP][134] ([Intel XE#2312]) +2 other tests skip
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
> >     - shard-bmg:          [SKIP][135] ([Intel XE#2312]) -> [SKIP][136] ([Intel XE#2311]) +5 other tests skip
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
> >     - shard-bmg:          [SKIP][137] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][138] ([Intel XE#6703])
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][139] ([Intel XE#2313]) -> [SKIP][140] ([Intel XE#6703]) +4 other tests skip
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][141] ([Intel XE#2312]) -> [SKIP][142] ([Intel XE#2313]) +5 other tests skip
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> >     - shard-bmg:          [SKIP][143] ([Intel XE#2313]) -> [SKIP][144] ([Intel XE#2312]) +12 other tests skip
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
> >     - shard-bmg:          [SKIP][145] ([Intel XE#7283]) -> [SKIP][146] ([Intel XE#6703])
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-y:
> >     - shard-bmg:          [SKIP][147] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][148] ([Intel XE#4596])
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
> > 
> >   * igt@kms_plane_multiple@tiling-yf:
> >     - shard-bmg:          [SKIP][149] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][150] ([Intel XE#6703])
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> >     - shard-bmg:          [SKIP][151] ([Intel XE#1489]) -> [SKIP][152] ([Intel XE#6703])
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
> > 
> >   * igt@kms_psr@psr2-sprite-plane-onoff:
> >     - shard-bmg:          [SKIP][153] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][154] ([Intel XE#6703]) +1 other test skip
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-3/igt@kms_psr@psr2-sprite-plane-onoff.html
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-onoff.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> >     - shard-bmg:          [SKIP][155] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][156] ([Intel XE#6703])
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-bmg:          [SKIP][157] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][158] ([Intel XE#2509] / [Intel XE#7437])
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
> >     - shard-bmg:          [SKIP][159] ([Intel XE#7136]) -> [SKIP][160] ([Intel XE#6703]) +1 other test skip
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html
> > 
> >   * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority:
> >     - shard-bmg:          [SKIP][161] ([Intel XE#6874]) -> [SKIP][162] ([Intel XE#6703]) +1 other test skip
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html
> > 
> >   * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
> >     - shard-bmg:          [SKIP][163] ([Intel XE#7138]) -> [SKIP][164] ([Intel XE#6703])
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html
> > 
> >   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> >     - shard-bmg:          [ABORT][165] ([Intel XE#5466] / [Intel XE#6652] / [Intel XE#7577]) -> [SKIP][166] ([Intel XE#6703])
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> > 
> >   * igt@xe_query@multigpu-query-pxp-status:
> >     - shard-bmg:          [SKIP][167] ([Intel XE#944]) -> [SKIP][168] ([Intel XE#6703])
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> >   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
> >   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> >   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> >   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
> >   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
> >   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> >   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> >   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> >   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> >   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
> >   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> >   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> >   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
> >   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
> >   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
> >   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
> >   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
> >   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
> >   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
> >   [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
> >   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
> >   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
> >   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
> >   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
> >   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
> >   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
> >   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
> >   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
> >   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
> >   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
> >   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
> >   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
> >   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
> >   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
> >   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
> >   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
> >   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
> >   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
> >   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
> >   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
> >   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
> >   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
> >   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
> >   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
> >   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
> >   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
> >   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
> >   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
> >   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
> >   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
> >   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
> >   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
> >   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
> >   [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
> >   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
> >   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
> >   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
> >   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
> >   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
> >   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
> >   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
> >   [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
> >   [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
> >   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
> >   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
> >   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
> >   [Intel XE#7577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7577
> >   [Intel XE#7596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7596
> >   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
> >   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * IGT: IGT_8799 -> IGT_8800
> >   * Linux: xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f -> xe-pw-163162v1
> > 
> >   IGT_8799: 8799
> >   IGT_8800: 8800
> >   xe-4711-721db23a9c232926f1e4f896d9226b9710cf658f: 721db23a9c232926f1e4f896d9226b9710cf658f
> >   xe-pw-163162v1: 163162v1
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163162v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
