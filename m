Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F59CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 16:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4A10E209;
	Tue, 19 Aug 2025 16:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+573wIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F3210E209
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755622279; x=1787158279;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=idU7NpeKTxkihf2rfLct44svzMAFxH1kcWABjdCWHaI=;
 b=H+573wIpGZKQ0bDSKsJuFK7pef8/XNQPDMtzKy69OgJ0p8J7l3M/rlAt
 BHXegAX++XHq5NY+qyYw+vz4mQrBZp8oU0GF+cgJVnKLZjOtqSrl1ixIY
 QqU7nCi4K6r+8DTiHfN0/h62F7GaPiW8MM/ge2XurYRmlyIplhgVa0Mui
 oqA24p5kcFAUQAIc2pPaV/tK0w9CoyOyWLnUzYZOIF/rMZnZwKmRwo54R
 gBCI1E/ZSlPo4AVdjGSrSr1TRnmQxMjHike9Yx+U4poOoh6Ja06cw5+4S
 NSCQksqRjxwGd/Q1cQNNq1BOMaeiRDA6k/YYSgKeuLyed406kMPrgkrZz A==;
X-CSE-ConnectionGUID: zgCcs+jMRNGF3TjmKZGELg==
X-CSE-MsgGUID: BVjKwbz7RF6RrV8hmvomgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57938571"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57938571"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:18 -0700
X-CSE-ConnectionGUID: KR6N4NC4RtutdW0aIo2wCA==
X-CSE-MsgGUID: LlCu/gVXRkWqHmsRihEUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167389849"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:51:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 09:51:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 09:51:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 09:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0Jqao8HKVM5iE87BrOlONYQ6tAen86GLHGhb0GiDn2vs9K2o2LuepHoP/8oqVi9+hDgkhIYd03S/jI/3KKjDmTAjwcUCqqw15fkCGrGlkDXPG4TZsj1orFAxcHUvCzqhAsSTVoVjfggCQPaglg8sTFPHb2owGjb6EIgS5U5Dwqynof5NflaiD8G1o+xOHwXM4xbgSZyBwYg6Ky6xz1pRx0xzFQfH3e018/IQCY6iXC8WdP2EA3vP6deHr2ZmCDlci+hkERlf3fKNzMArsWTJ61kmXfIjmQm19bhm+oTviP6LGA9EgexmJy9zOH31P4/tTjyqdQFsC6yF0hyP9kfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/BCnHLhg+yeR99tLivfj6+1hZTU7Tjq7wV5JhG51ZE=;
 b=amnHG+PXzXKa+We3+XOq78X2YyFmjdNy46bb9RF51x92YCyZqeHHrJY0oafqKU23HpU78JMXRAJAcuQc4/ozTilD/I2OHf1kVS/jV4Ri8rS7uG0190VzHFarAuISSYHB9FYc48Mv7YePYUvf8zdY1/aTU3u/G/2qppzTiTX9fdFNKYv01CbjiTskzgTURgVmuSbJNKTZPC+x2vyv4UkKSR83V1tmjS/A8pEFWl6YADEoP4hE9W71PJnYx6yU6++iFThJ2emZZmZgSYEKl4dHuyb5JHzlGHL3gEfIsI4Nm33ljo73dMjrxOnwDuU9DF8DX4fg8N+DXxZ07K2DSKyW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.25; Tue, 19 Aug 2025 16:51:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 16:51:14 +0000
Date: Tue, 19 Aug 2025 11:51:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Add psmi support (rev4)
Message-ID: <n7swsu73ltwnd7eupbajoddox5gxrne2a5n2vzmfnzk3ionegc@kvluqmtu7bqp>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
 <175561946382.247874.18269691753191624403@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <175561946382.247874.18269691753191624403@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b1e466-f378-4cbb-b758-08dddf409ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cCIu2cUsejSQIO6wT03TBlvrDxRqVeopM6ycwACHaVVA4uoqjpebcpSXiEXM?=
 =?us-ascii?Q?INd9FNIFyWJuN9I33dNnYEsOsnQhyzwo0bc7JYGv3i5znpjpZxFWXZQDSRik?=
 =?us-ascii?Q?no+ILN7I5jKJA4dMCiCVQqDAYo+JT4aQp0Ho/b+BCSI88dYMv2Lbe9n3ZZWg?=
 =?us-ascii?Q?ka/nvo4WgHAk/JwEBthqO4UcRR1un8JO49FV8ldZBlgmJ7Orqf4p75xA1mWu?=
 =?us-ascii?Q?tulH/T/76cHt7puiUS5iHL3JwMI349IQroRBsLxK880AQWs85mYSoHyO4k+o?=
 =?us-ascii?Q?ui3wBmVcPd0a+fo6tMn27r+DBrPsxh8tplC9gON4p5O2ttmtO4VgvYJJDKs1?=
 =?us-ascii?Q?TuGNaD+xUokVpFTnxh2cS+rI0SLwVIGeG6hjGj5rSEjOqklo7Rrp2zA+LPVB?=
 =?us-ascii?Q?HjRZVElS9l6vtkld2EORX6SWHYykXuidzbonGjRkNj8eUDKSkxsfoDJMBkgR?=
 =?us-ascii?Q?mOFo0XIJaSGYvgH/4E0HZNDcdFFrNg7K0txuRNBz8bfgRod18+vBBXhP9USf?=
 =?us-ascii?Q?ILyNQ/shuLqKRMJuIbWvLJvjAX4KgzxE3t+Dr+eLCaouf7N3aJZvs/XDoE/j?=
 =?us-ascii?Q?Rijujfjx6mq9LIZ0bkWxG6bGB6q9hs85tr4Cy08AsuH1B1u7Wc147LqHNoVw?=
 =?us-ascii?Q?ufEFX71EP/9sEd4eVPxZTAOA/Ir2QVD9EaHHwcaBw3RQ54eLxV/N0GEegnpY?=
 =?us-ascii?Q?5Gs07iYFR91uM+mgBM3DalwUVkwP102sq7P69ojZeaRuCzJERYHh+8v3B8Mj?=
 =?us-ascii?Q?RTeUl0DCGXjf3G12bS3mRZbP40KzV3OT00x5Q0p1d/7D5UqRDlTWUqcEqFac?=
 =?us-ascii?Q?hYXTAW5PRelpfsjcMGQJ7e7pEXJC9yjZ1oOaSgyIUq0krDWyKHaQlsU7ypXI?=
 =?us-ascii?Q?p3pZf6L1Ba4IvY0RIOREljj+WCHY+4wkh/QEqJCmbxhhlb/1MNO2qN4JpSij?=
 =?us-ascii?Q?xwklfWAJZPj2H5fqoBpuX9VRmudIfmGYjJ6MhNh84S9VmEm/XqyUhrkEFNu3?=
 =?us-ascii?Q?DEBv7tH6vmQDgGEWiykIU9Y16aWhmvn21lypFdTD+zIPHj5AJJhPA8Ql3b3T?=
 =?us-ascii?Q?2KU7PoI06wi0VXWj5rJnBtNg8oSiRkC6DHQL+ybSLMoVaBCcMWd3mtXO5ER5?=
 =?us-ascii?Q?nj8fo2vDjc1GKpauE6W9C99L+JBeVppg54FjYxkkBUGSviW6osw7a+Ne673I?=
 =?us-ascii?Q?FdOHPkHcQ2S2TM77kuVkmsuzjeP/Z3WudP2DcEKK9uBc1Bi5x29xmvbN5B6h?=
 =?us-ascii?Q?YYgboFT3a0kAawlCnWtqWstqlVW6ww7w+gUjTcCfVUhYRVjTPfbRb08OYxZq?=
 =?us-ascii?Q?I6ydUu860M62TMYBwtCgc1u0/JVY8YwMriXjzbpUCQtdL6RgiMO8OFZkO1Nt?=
 =?us-ascii?Q?CHs1owbD/Q3BJs3hT91x1uNYjbup?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQPnPjMnYsLwCkEkGD8Kn6UqTMNCLUmoIvE4R0qoX5rFNVx8C40htYRReBZ9?=
 =?us-ascii?Q?JIt2foDaaGxXtJLp65PHwMdOiK1WZdbzifMczwIBkEUkb+PjDDIRsf2QnWF2?=
 =?us-ascii?Q?9Mx5ywkBQG5bXx2tRBxoDYwVnBHiSePmw67ZdZ03Hr29Oph1549fagY3FULw?=
 =?us-ascii?Q?Lk/BoQxr5e9vv65YXyv1xIXfa+eZwuTFgbdBn9bVFMc38oUx7uulvwub1/2s?=
 =?us-ascii?Q?xf91rQ0YiCg276fhKZ3QjY+DPUtDDQ1kS8Pc/+JpfiLpQOA4SrKucGr3VVPK?=
 =?us-ascii?Q?ck9p/YFr34YkasbsEZ8bsKxqZOTVCdvw7sVD0HqTnVx/JyOuUqAjAnWCE7IY?=
 =?us-ascii?Q?7j6oxjTZZZO5tX0hf2Z9B8M3AnOJc7gG6cZcgrBxyvYil69uq6szrUvlnGr7?=
 =?us-ascii?Q?bqc3ejm3HUloqqBBazZ3+lMM+IYtjQNU8JG05iTZD1022IziNeYaF7fl+Gzb?=
 =?us-ascii?Q?qdMHRush1QkgyRn8sSGTj07Mr15mziNGP0LF7oBxEk7KX6xkKeXxvGGMssYy?=
 =?us-ascii?Q?dtg5usa347DWXCFoihtELtmHn489+N2F7hO52JlTuY0kxuDYdOOOmjMC+Uvr?=
 =?us-ascii?Q?M3Jf5TR94NJ4+DxDbL2cFToy2R4zU5BHmYycL/Tzw25XXysMmDLi33FkbddR?=
 =?us-ascii?Q?OqbWvHEX2vPYp6HHUVFgQBF+eQ57My3fdycXnkd/uVNmoIx2FOt+beSFJJl+?=
 =?us-ascii?Q?yRqfjHChGM2kk2mvvaFzkXaL6/W7O0Mxz9g7sX8DJGHdEVQNU9c4VQQgNaPf?=
 =?us-ascii?Q?M8iHzsbid/Cvgn+Aa6jycJU+1I7C5g4/U5HBejMAW1PLBskq8d/lNUtu7F8x?=
 =?us-ascii?Q?5lWceAbYehQ9NH2x31YZzInaV8mwC+zHa6LB8/pgeUE9t23fviAT+eqYS4GP?=
 =?us-ascii?Q?sG86x6xZT7dgM9cmuH7e6OM8dLBxOtMN3WdShohfTqNSTA3y9k7horJyNfdx?=
 =?us-ascii?Q?ksML4HH5P/mFvptIBXQ47RVzFNE+48gpCzd9hBju3DZuAHNVF/yJtXO85VsP?=
 =?us-ascii?Q?E5ZbZec+ljFONpTbkJs3hJXoV70XLjvyWBPMtc7Ol+4/XOrEVwCf2ZPhBAnw?=
 =?us-ascii?Q?X44eL5Hv4lZCs8SXRYZUpSGBqs9nSHd4cBrT7+H6VZ8KUEaqZkIfa8WHuGXT?=
 =?us-ascii?Q?xZIL+HBb+uIQY3uI7psD19jIZnKfL8w3vz1iTp7I4Y0WM5iusJKPYI3MDRbQ?=
 =?us-ascii?Q?t77wiSb+dIL8tLOl+TaNZzIfKT94MmkcARUa2Z60Yoljbo+pwplXQxRUn+JN?=
 =?us-ascii?Q?th07IGDhKyU5n4WThHH1x+8zz47rkKI6G90huSgNLgSfAF7lcdfY6dMR8gLn?=
 =?us-ascii?Q?V1F9JCc+t0Vunoia5Y0rfpxXYdQzATI7sgUomMqaC6xPIkR6H0oXU2Ugu0QQ?=
 =?us-ascii?Q?upVorvu1jBgaN1sZm0fTs/nYmOF0Af6sF1oUgsZqvNpawULbxhWUxKG/w0QP?=
 =?us-ascii?Q?TCV5JJVZLggd7KsUM2CUQQhefWAODUm/ovWxYWjwF3T+l8ejrY9Aop2y9cEY?=
 =?us-ascii?Q?UuCP6qGUgnCp3nnEZsKvdFaOuKgivhKAbeFlE8cgENcCG4v5B5KiyEZVE4MR?=
 =?us-ascii?Q?x/lxuHXSL/baToX/crJy8tRHVNjlKekTrlboYMiA7iIDRgS15H0yVc85c04U?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b1e466-f378-4cbb-b758-08dddf409ba7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 16:51:14.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWtjYTw29jxvmqt0qcp6VQhRevNp3dWVz2TliaaZklw8khU2oYueFhdBDsvQa2q/GdJOM4Ua5ZPE2yWPYGjo0poSp9DSmPh+lLvHB0+JqdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
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

On Tue, Aug 19, 2025 at 04:04:23PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: Add psmi support (rev4)
>URL   : https://patchwork.freedesktop.org/series/151729/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-3572-c3cf4289245819615518b536cd16ebe6612694f9_FULL -> xe-pw-151729v4_FULL
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-151729v4_FULL absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-151729v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-151729v4_FULL:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-1:
>    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-adlp-3/igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-1.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151729v4/shard-adlp-9/igt@kms_lease@lease-unleased-connector@pipe-d-hdmi-a-1.html
>
>  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:
>    - shard-lnl:          [PASS][3] -> [FAIL][4]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151729v4/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html
>
>  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
>    - shard-bmg:          [PASS][5] -> [FAIL][6] +1 other test fail
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151729v4/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html
>
>
>#### Suppressed ####
>
>  The following results come from untrusted machines, tests, or statuses.
>  They do not affect the overall result.
>
>  * {igt@xe_configfs@engines-allowed}:
>    - shard-adlp:         [PASS][7] -> [FAIL][8]
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-adlp-4/igt@xe_configfs@engines-allowed.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151729v4/shard-adlp-8/igt@xe_configfs@engines-allowed.html

**** DEBUG ****
(xe_configfs:16988) DEBUG: Writing 'rcs0' to engines_allowed
(xe_configfs:16988) CRITICAL: Test assertion failure function test_engines_allowed, file ../tests/intel/xe_configfs.c:100:
(xe_configfs:16988) CRITICAL: Failed assertion: igt_sysfs_set(configfs_device_fd, "engines_allowed", v)
(xe_configfs:16988) CRITICAL: Last errno: 16, Device or resource busy

This is actually what we want. I guess the test is only validating if
the parser was correct, not really if it had any effect.
I will take a look to improve igt here.

Lucas De Marchi
