Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7DC49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 21:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39D10E0C1;
	Tue,  6 Aug 2024 21:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0ZPxE6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB4210E0AE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722980262; x=1754516262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8sadAbP05jG5G1s/F+rR+d43rzp+RAYvxKy3qKj8Y08=;
 b=L0ZPxE6ZzZ40C0zHV3XG+m5BCZ4kbzEWF6WzaeSZY5cft8tP+1Sr91WL
 yiX2P4dOB0mu5HlbumndoeP8CEI6rtUG6U2VfnkhwC1Yukb3n3HyIML/l
 aB0p0IFtn0GRaCDpygJLWuBkRf5KDix3XYaoHXHSY5NJRAbvnRaNnd1gJ
 X3obBaHo3cxYpXCj9OOhRkfZRYJWRwcPlrKeE/V+Mr+mdWR+9bUkYIT88
 JZ6UWR1GA6zGYQgpvH384x5Pc+YlI4O6bYfw+V7Z+eJAvB2kkr2l2umZz
 sXl/pMn+0FAdSwmfnKT9NL190hwU9q3W2yUfi074YjCtB+WnESoHZDWZI Q==;
X-CSE-ConnectionGUID: +eghlDepS8CxbjTUsV7xPw==
X-CSE-MsgGUID: nEfWZEaySJK5cxpF9TOW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43552466"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="43552466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 14:37:41 -0700
X-CSE-ConnectionGUID: VHiqiujhSDatOKVSJNStBQ==
X-CSE-MsgGUID: EyqtflUzRke9Xh+EKgfJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="79898181"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 14:37:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 14:37:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 14:37:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 14:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvMZnM3D7PRiSz4ugxk7iN6UYhpXG7dVPMzWT1t2KKtJUKZSB2RYyKOfCGfgxW6zFumIMb5u01jWn+oSMFNKyWKYcU5++0y+TVZb5xHpXlqigPQtl7eJgp8tecGsqapxJrKrl64jo0bXDSCR18BI9IbDZHUofb/CoCvO8I0FVzfszLW2z9jWxA0KfxtW+eTcfhcsbe71SrK7qrC3bVUh6Uj4KuF3y63FnwXtmt/702oW2owa9fujyfaeh/Mi9Ezjj1WsvZfI2QzuY/OBHuy/2q08QUIVOx34kTypMelkcr73KshZjgc20lWqkv2GQfJ13+el6Hn8YdfFgw/m3ZK/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjyQaXDPSYo+J7nY9HugdSGGEvXfYG6tRN1ehWK1hcw=;
 b=BaELMo0Yuj57tCBK8ptt5fJcIvgZ9RJmUEdqh0WSNigTGqU3T4K49Y/gwLPv4s6zZD3MyqtxteCDSGllPmwhdJhVzFCMNjyqzitQta7bYV47ZmkZxOWzw/WfAaitFuoTGtbFBxaOBbcNJtXOBS+8dREyyrq/Nz6mZVIwxgGOEt4mL1VDdqxCqPWucEsBC74Mp1RRil96WTHgcsT+38BHxxjJhQZRIAr2V0p6gpZfnBRxNel+LTppDEMgFEZSIjfJPLzToFU7taoEBdkh+AJM6T+YEbC4WO2thWL+nJUJu5l+48I27FcokDt5ewcHpMBcHmbaH4uocpwInP+ZAKMdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.24; Tue, 6 Aug
 2024 21:37:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 21:37:14 +0000
Date: Tue, 6 Aug 2024 14:37:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2: Add performance turning changes
Message-ID: <20240806213712.GD5091@mdroper-desk1.amr.corp.intel.com>
References: <20240805053710.877119-1-shekhar.chauhan@intel.com>
 <172284218015.539576.18402350612376053201@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172284218015.539576.18402350612376053201@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: edada932-6923-4b47-351c-08dcb65ff020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZMl/PPxiPrTNvGcmFIFhWyMn0G3V/5SAMx/2D7nb/TqV9b4KaZZ2ZkfLO0e8?=
 =?us-ascii?Q?lQSIXczL0Ma0jEInedi7WY2ps9zaaa7oj6JzkqQNmfM0PBZP3Z2i5D5MAkrO?=
 =?us-ascii?Q?cpEIjklGzZEvEIrGXboVvCvh45BreTuaaGu+x9/CTwFxOjRmPMJt1Jac0+jj?=
 =?us-ascii?Q?8m/ys/J1pj6PfO5poHkgEm/aUCHZfZPa949mZJXNFmLm/UG40yMIv/iAW8jg?=
 =?us-ascii?Q?thvYZvjARuK1DyjO8bf4ppW2w/yr2muVPXHHPrtZex+hBgB4Gl899ox254xa?=
 =?us-ascii?Q?Ph5eCPJs/9hHvzdH+CA7PxsY19/Fr1PO1HqzFQs+mkc4Z2eg0tDQcoi7S18Q?=
 =?us-ascii?Q?O1MpOlns0fLwEhILExq4pz0OyxwKu8cNLxxiJnpJBkRdF29gYdYxyVk/VIjX?=
 =?us-ascii?Q?74KtV9hRaszLoeoTl5o0E6HDHCnAPfMZj/9M64P72wwQegrLgMBdN1qyBL9H?=
 =?us-ascii?Q?qKX66QvYB+X0PV3Nny//TOu2A3jMlwyfC2OVx5fH2AHjsBRUdOVG/m6fQx7o?=
 =?us-ascii?Q?7yq2bvfGRw4Wz5Xbhhla3Zpq45LMPQtSr1k62WsBNRMObKSSfJIDK9Xn2gf0?=
 =?us-ascii?Q?W/mwu1fXsmh8O0W9N0HODRxC4ug1KkJqKgJK/MFTRc9FWjMpmoETK4qLwU69?=
 =?us-ascii?Q?iaL5//EUiUGu+c2nijgyrxqfINhRUMKyx9i5s5+HPmAQ+Y66haCpaH6qmMCq?=
 =?us-ascii?Q?fKBtCCpaAiTLma9RXXMNzK2IjILKJHjf5/JHrywC9mucurZ4YdRDfqKdh4lq?=
 =?us-ascii?Q?2s1ndSaJ88TYeCPzl0nRkszfHBs6TuB/N9U3XaT2LQ1jjsw+86q05G19ZmCO?=
 =?us-ascii?Q?bRshNaTKlBxzijKrK/0YXDoI5rKrnJBFxP6A0WlyogPP8fJwpehGR8Pzov+R?=
 =?us-ascii?Q?fjCF+5ZdKRPRApxQg7yYTPMiInVjPRhVelGye6LD49XIBYEBO9TDtRMfAJxX?=
 =?us-ascii?Q?vewVtHzQcc4P68L2srxAPeFGKWH1FLZYGly8HazCJyLsZKO2VEAUlq3PMZyd?=
 =?us-ascii?Q?Ud86UsN9MZmTj/scl+PX06xlXYTtN65mK2r4/4uhPC5bt1Y87rOP0nIjrSxN?=
 =?us-ascii?Q?oYejY1Xr42j5Dyiq0NRAqJEcAdajuV/063p15qgBDleCvJ4kmHkWH70AM+r7?=
 =?us-ascii?Q?dhacv1VXZgLDJv3lgAyjkAeR0PMjyfB4pHmEupAClrJDR/eeWN67YKb7jLLd?=
 =?us-ascii?Q?aXjQSTjpmo8GHalq7BiWHrQO2b64V7SqydytdjGjClF9CL0RzWmOnzUYkgyX?=
 =?us-ascii?Q?InhJnMIx8lYpR5SeHqY44CQmHlCxtpBXjg+0Rl5IBpxfrpXdPcXuUX4sjgNj?=
 =?us-ascii?Q?/nI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xUHR2ujm00fUJVb5CJ2kZCyDJEsuaKFy1hZBZtEuC4p9ZyvCLkwQJfWoQ8f+?=
 =?us-ascii?Q?rk6w698zJPJa+j+pFp8oGYVmSN9Z1N6pNX2tPjwHV3lH+qOdAQDGVVD1VMtz?=
 =?us-ascii?Q?GdVCG2CA8io8Qj8sU0w27+WzmSxi2168n3pLs3Az2uWFsaDEkkpnYpvbJGzX?=
 =?us-ascii?Q?rotQCzJHj7pk2PJ0su6MDEyCDpTO+iUIEktZ8A5QcaIDfRS7o5wBKShXZrR3?=
 =?us-ascii?Q?XjvM2SjsBVQKMWGeWPb6jSgREgEaUxZFADSBr33zdjUOtuQOExipd+RfXMLP?=
 =?us-ascii?Q?soFJdeMIBA5R5eKPBUCap5tY01Jo+2A23lWQx9lkAwWKG92YrBeXulU7jjFP?=
 =?us-ascii?Q?sGNv9yAo8MYxiZ7Wdqz2cuoQm4qaAteIFbol2GIGKwlugMziDb/yU+MIUT6+?=
 =?us-ascii?Q?7/hsFvyqEa4s8xEUSq8A+dnVdiYLG35qWqVj2C9vPW3SVAzsbThzSafeQ9rx?=
 =?us-ascii?Q?NalnlhapOMcMAhfcGQc2VeLRzTPhfgRNDvGPODVifp1wi6VgcTWtyk8FXyLS?=
 =?us-ascii?Q?G/o72WXfPPOGGeW4fzaRncCqva3xmKU3tx2q+Ww/7Hx8nRmNJrCghtQpvzf6?=
 =?us-ascii?Q?Qq7uIuD71ixU+dos+Ld87ByL08VNb7SAhbz5srZpXnTjFbBGD8RDamzVKHAo?=
 =?us-ascii?Q?ZKkcREL7zUCESM/c60jvK2oqnlF9Js9H3UBDpPxjk9CcXZrQ8/Acje++0owb?=
 =?us-ascii?Q?O5psXXijkc8GFbdLtc65eDXRSE0X9aLGkCTEduYHGGTc0XV49wSMv3pyCi/W?=
 =?us-ascii?Q?RAhILUS/Pbiupv7A1RB5CRZJUx9T98u8m4kngPTemJYPxyuicw7EQizFHeKf?=
 =?us-ascii?Q?VuCDym37cOZieMxnZ7pMFKp2IF/UcBedpu+IF7xPyDHl3dOqqMXasX8EczUp?=
 =?us-ascii?Q?wA1pb6q1Gdz+OOtIVcIEL8s7JU/r84lNhj0gxPVdjZPSjb3r+U+RP1/scgTD?=
 =?us-ascii?Q?0IrufR0bSoDl+Or9PxEp2cD3Q/e7g7JJNuAUMp4J7i90VCUNd1C4ARjcfbX/?=
 =?us-ascii?Q?tjtCNRstUn7vyR1mg0Uu9VQYGQP6T0wIbwsCxHA5dHOThOmzPb5/mR6K7OXF?=
 =?us-ascii?Q?e7q6IedNdQ+3KgtYZ6Jhsnd9rxD2/cw4pGxwzsWfAVbcWp8WCtv0OYhRuM5W?=
 =?us-ascii?Q?/OyCYXUReVjnwKoTRWn/gK/1jb9viLiVgEK8L2MJpbqTcfxnCV/dAT4pHd8S?=
 =?us-ascii?Q?kuG6APqlEiP3tDvRUKfxIxVRnfer3T2uu/speCn4PbEgbviVXoH8G+8KRTjV?=
 =?us-ascii?Q?aGLHM4kgA5vWPpFaSn35tkNEB6xk76b3GDwgBNLnuqIdMIE9JIztazu2sLb0?=
 =?us-ascii?Q?dBYgB7usfynWOzJOaUIOzaUbRC2ugip/mdppdoJtlDGja4GK3iH/5HuDSuPb?=
 =?us-ascii?Q?uS/pxd51iG2Ow1lw9DHmx1KTN47YpepHWTuNrnzwYZUGAVexYsmm4dPkl3Qk?=
 =?us-ascii?Q?BeVVi5PmZbqAtbg9feXqChdY2y90vpmUA1baTFqUlPDacnbw/tslV7iEHk4K?=
 =?us-ascii?Q?LAryomvOwXsR6BGPIOFPqXaYiV6Jo7uHmQ/OTypR2qODwh2M38btFXXu+Cl6?=
 =?us-ascii?Q?VNFNE70ck42MMdsUpJoSJybDMBn1M8PtydsHJMJxPezSTF19mPQ7CWECQ1VZ?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edada932-6923-4b47-351c-08dcb65ff020
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 21:37:14.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcOxHXbt4dIKLh9KkUOg2z2V2cGJjbyA+M6Ge0qrRFMn2qrPbqPf9Gc4+qY6EzDTumtb8EIaxDLusDXLgKCx+rRThvknfqotiEJLnqOAEiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

On Mon, Aug 05, 2024 at 07:16:20AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Add performance turning changes
> URL   : https://patchwork.freedesktop.org/series/136873/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_full -> xe-pw-136873v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-136873v1_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136873v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136873v1_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2] +14 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

It looks like the driver did not recover from the post-wedge FLR
triggered by igt@xe_wedged, and all subsequent tests skipped until we
got to a test that intentionally reloaded the driver.  Not related to
this pach.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][3] +9 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-2:
>     - {shard-bmg}:        [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@legacy:
>     - {shard-bmg}:        NOTRUN -> [FAIL][6] +2 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>   * {igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3}:
>     - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8] +2 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - {shard-bmg}:        [SKIP][10] ([Intel XE#2426]) -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@cmrr:
>     - {shard-bmg}:        NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-5/igt@kms_vrr@cmrr.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - {shard-bmg}:        [PASS][13] -> [INCOMPLETE][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136873v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#623])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1033]) +1 other test dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1426]) +1 other test fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1659])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][23] ([Intel XE#1725])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1231])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][25] ([Intel XE#1874])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1477])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#367])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1512])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1399]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#306])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1468])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#1188]) +1 other test fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1413])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#877])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#309])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#309])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-lnl:          [PASS][51] -> [DMESG-WARN][52] ([Intel XE#877]) +1 other test dmesg-warn
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-3/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#776])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1135] / [Intel XE#1201])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397] / [Intel XE#1745])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1397])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1401]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656]) +17 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#653]) +24 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#658])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#599]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#324]) +1 other test dmesg-warn
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_plane@plane-position-covered.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#1874]) +2 other tests fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][74] ([Intel XE#1195])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2318]) +7 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#2318]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1435])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#362])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#362])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#2028]) +1 other test fail
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#756])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_ccs@block-copy-compressed-inc-dimension:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_ccs@block-copy-compressed-inc-dimension.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#1447])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1447])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1123] / [Intel XE#1201])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1126] / [Intel XE#1201])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1126] / [Intel XE#1201])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#1600])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict@evict-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_evict@evict-threads-large-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#688]) +4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#688])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392]) +3 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
>     - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#1069])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-6/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#1999]) +2 other tests fail
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_oa@invalid-map-oa-buffer:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#2419])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_oa@invalid-map-oa-buffer.html
> 
>   * igt@xe_oa@stress-open-close:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2419]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@xe_oa@stress-open-close.html
> 
>   * igt@xe_oa@sysctl-defaults:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@xe_oa@sysctl-defaults.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#979])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][112] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][113] -> [ABORT][114] ([Intel XE#1358])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-4/igt@xe_pm@s4-exec-after.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][115] -> [ABORT][116] ([Intel XE#1794]) +1 other test abort
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#944])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#944])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
>     - {shard-bmg}:        [DMESG-WARN][119] -> [PASS][120] +5 other tests pass
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][121] ([Intel XE#1033]) -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][123] ([Intel XE#1659]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * {igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3}:
>     - {shard-bmg}:        [FAIL][125] -> [PASS][126] +1 other test pass
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - {shard-bmg}:        [INCOMPLETE][127] -> [PASS][128] +4 other tests pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-WARN][131] ([Intel XE#324]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@kms_plane@plane-position-hole.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][133] ([Intel XE#2058]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][135] ([Intel XE#1874]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [FAIL][137] ([Intel XE#361]) -> [PASS][138] +1 other test pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5:
>     - shard-dg2-set2:     [INCOMPLETE][139] -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
>     - shard-adlp:         [INCOMPLETE][141] ([Intel XE#1195]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [FAIL][143] ([Intel XE#899]) -> [PASS][144] +1 other test pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [FAIL][145] ([Intel XE#1523]) -> [PASS][146] +1 other test pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][147] ([Intel XE#2028]) -> [PASS][148] +2 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-6/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][149] ([Intel XE#1027]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][151] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-lnl:          [FAIL][153] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][154] +1 other test pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][155] ([Intel XE#1358]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@xe_pm@s4-basic.html
>     - shard-lnl:          [ABORT][157] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-5/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][159] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][161] ([Intel XE#958]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
>     - shard-lnl:          [FAIL][163] ([Intel XE#958]) -> [PASS][164]
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#316]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][167] ([Intel XE#1231]) -> [DMESG-FAIL][168] ([Intel XE#324]) +1 other test dmesg-fail
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1124]) -> [SKIP][170] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201]) -> [SKIP][172] ([Intel XE#2231]) +8 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][174] ([Intel XE#1124]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#2191]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#2191])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][178] ([Intel XE#367])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#367]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#367])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][184] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][186] ([Intel XE#787]) +27 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#787]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#306]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#306])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][192] ([Intel XE#306])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#373]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][196] ([Intel XE#373]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#307]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#307])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][200] ([Intel XE#308])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][202] ([Intel XE#323])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][204] ([Intel XE#1551])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][206] ([Intel XE#2351]) +3 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][208] ([Intel XE#455]) +7 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][210] ([Intel XE#651]) +6 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][212] ([Intel XE#2231]) +5 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#651]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][216] ([Intel XE#653]) +6 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#653]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1158]) -> [SKIP][220] ([Intel XE#1158] / [Intel XE#1201])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#2231]) +3 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [i915#2575]) -> [SKIP][224] ([i915#2575]) +7 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][226] ([Intel XE#1129])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][227] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][228] ([Intel XE#1204])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][230] ([Intel XE#1489])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1489]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#2231]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#929]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][238] ([Intel XE#929]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-435/igt@kms_psr@psr2-suspend.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1149]) -> [SKIP][240] ([Intel XE#1149] / [Intel XE#1201])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1127]) -> [SKIP][242] ([Intel XE#1127] / [Intel XE#1201])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#1500])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_vrr@flip-dpms.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#455]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@kms_vrr@flipline.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][250] ([Intel XE#756])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][251] ([Intel XE#1195] / [Intel XE#1473]) -> [INCOMPLETE][252] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#288]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][256] ([Intel XE#288]) +5 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_oa@mi-rpc:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#2419]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#2419])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_oa@mi-rpc.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@xe_oa@mi-rpc.html
> 
>   * igt@xe_oa@non-privileged-access-vaddr:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][260] ([Intel XE#2419]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#977]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#977])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-lnl:          [FAIL][263] -> [FAIL][264] ([Intel XE#2028])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][266] ([Intel XE#944]) +1 other test skip
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_vm@large-split-binds-536870912:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][268] ([Intel XE#1130]) +42 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/shard-dg2-432/igt@xe_vm@large-split-binds-536870912.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -> xe-pw-136873v1
> 
>   IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71
>   xe-pw-136873v1: 136873v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
