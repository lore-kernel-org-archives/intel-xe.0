Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D5CDE026
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 17:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89C210EBBE;
	Thu, 26 Sep 2024 17:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0BfKigp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E110EBBE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727371753; x=1758907753;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=vcZeMbfsTz+u6D/7sxyzvtSUHd4tDSRae3KXSuXqt6s=;
 b=a0BfKigpP4ty0vjoA9dJVEp6b0bDhwoMztFGTPkkevQbc8zSzB/EL3kD
 eMXSpLwQvrW17YfpfWRO2U2vOcWKRfaU69/R2EvX8rJNc++ODBNrwdcU5
 I8JP3w2qW7XZmRejP1DS4yNbT87pxDHjuLS/PdBMEZPjsZ4TRRx04DZ77
 BM+2wWU80W4ERg527PS1MBsH4L3Sww1DRNur8W3WNc4FmbmcgWG4H3Jdg
 cJCrUQOpBoW2PRlqRGbGVbg/BLCzX95SaGBo7HOYDBkZxmIMQplTPjRH4
 BzZ64r732cI1R+GL5f7o3jRDVZCSHkgBsTsLbb9AVtO/JvR/I/t6Ak9Eq w==;
X-CSE-ConnectionGUID: catJWop2SZ2sHVZ4Npp/KQ==
X-CSE-MsgGUID: oyyiUopnSFyEdN1vDeFZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26437654"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26437654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:29:12 -0700
X-CSE-ConnectionGUID: 8ljCuDrKTmasreVCHCGwYQ==
X-CSE-MsgGUID: uGx//qNOQeGyV3COJxNzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="71906275"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 10:29:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 10:29:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 10:29:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 10:29:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 10:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrJr+Qud5amPA8tq89Q2vcZ7m7yMtnCYpE8pVil7vUTDS3Oh8aNdMDD5obPEqyEloL1AZaqOfuduC6zNXz5G2iOfpxE/TGSiFg+cprvJG2IsIgEI2wVYHj3i2fPN3Yt/3A35CMmX8TkuMv80wDqTNXKTFHvzhTI/2qmXUpyQngqrKY8CngcZUWqzWPi1XqYacpuFPY2MCDDpx3WrD1Rkt3qg2f8X3ZoFtWRZjZMG7wjYz3zM9ZLXcerJ/rzgtzI/SmDRucUP0S4cXIJBz1ZPeobdxro90VQlK5r1dmBFK+1TzDsr0LeHK+SPDW0Mc0Rj3LA0k4nBhduGTBwZS99MNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGgk5OOnc8Ikj7b6r3I6Ggu9MLOZpPTqK3LJ+qnpMnY=;
 b=pAIXebVRLJZH7t0eR9hQKCH9eSylN9PpyXPcm2iS87zhRmhTzQMDAzZIVOkqc8+Iya9Driq/25clLcj18evqx3FHyy5Qw8WE5sgN4X0Do+WYI18rknkRMsjmzCDXZSP2AzW24DZRzx/swCqoJlPmSfsNkN0o0mzNsgoPBwicKmm+iU4urDsAbo7THlhprYdaHtz89NLbXIgZnACcM7QFz9Hdm6CS3Mhai9eboHHEcAa6im9MBVEmPkqXTekbaLbNxgdCfHuqUJ84f+wttaaFjbbmmDSghrMBfeelYrBywMM+IfXbQgh+ehzehdckfx+kn6hhmgIUC9mvN22MKy9QeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 17:29:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 17:29:05 +0000
Date: Thu, 26 Sep 2024 10:29:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe: Move IRQ-related registers to dedicated header
Message-ID: <20240926172902.GB5725@mdroper-desk1.amr.corp.intel.com>
References: <20240923214514.2031410-2-matthew.d.roper@intel.com>
 <172733387219.1104684.10564853276469087777@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172733387219.1104684.10564853276469087777@2413ebb6fbb6>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf2c1e2-04f9-4015-92e5-08dcde50b8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mW3gvFWGkjYQQrwhImaqM7er287vfKsM6/jQ5KD5SqQjRv/tNFt+f/FQ+nhC?=
 =?us-ascii?Q?eo6N8DsGF5cDplpN8fNd/8j7anZsuDwETZCOnLDS2UjM5q3d/D/qywUKoRH+?=
 =?us-ascii?Q?gXbJCsqcUOJka2zr9MPalcxIkpZa4hWXEksPz3wfSWub3D8UUjQWSQQCkGjX?=
 =?us-ascii?Q?wzkr9PbjhtUWeaHi1E3JR7rR/jKZwu1u6FVhlGSKkpjNsu4cO2donxQ+vPo1?=
 =?us-ascii?Q?3sgnp6DKtEYYPJzpCAZI/krQ1eCiqmxXc+CxWVThLwHVkwgGsVrNHpIeywki?=
 =?us-ascii?Q?a+8BeNWWIGU3JJ1Dcdo+Xpt5D2aVq7UTbwcjO9S8MymxSlxtiRoZV7jjyvCi?=
 =?us-ascii?Q?d/sq43kWaxQOcHJQZag2ziqjn46UIx42sH23vrTz+tY4YxkfHEbJ6xBv5Ixh?=
 =?us-ascii?Q?FaW9n7fowT+Y0g0JkjC61c4X6r8x19i8/9CqVF2sv5OL3Kp/H+br8Sh+URkX?=
 =?us-ascii?Q?guD0W9jC903Umw6xUooRaF6xH4yAiC6ipvDYqMwmGTDP1Afb2pDZwwat6qYV?=
 =?us-ascii?Q?5h80XKYjcdBulFtVLE9ekMuvkTHr6TpKtu7xQ/jHJQIoOmZCbZh6vtM5YZcB?=
 =?us-ascii?Q?pnlX5GX7zd5RT2aQs+eMY8ZDKDzgeB9pJDZ4b1FKM+XHBjPjquNVgNJODAbH?=
 =?us-ascii?Q?maTckxxRS5nvjOm04er5avsc2zEV8tF2+AgwDN6FsSdcJFV+kd2j/wISLgZ0?=
 =?us-ascii?Q?rhhZv0WNVOCTMz2QO4JBNZ7+hhM4OM3pueHIvgH68UF51zkKsV7l55fCEtqa?=
 =?us-ascii?Q?rFKN0Lssgz5wrbCL7WZO8fXwheG4VdEQJobKU9sQV2MokQvYTJQfdz6aszlZ?=
 =?us-ascii?Q?a0v/ygqI1QqHmc6kvAi/Goguzj25BsMQswAxKt2SBSKr62h2gWrMvosrxUWK?=
 =?us-ascii?Q?EPvXxjxQxDLsmIPtGFwFagM8Z4Zp1922BrY/VqAcoEI/KcI2gsLqBPT+iSBS?=
 =?us-ascii?Q?cBPzoucRzWVQKOUe+Z/lHHuMM6F+DWy9NFa0gQM+/EYDTln2E3KXQ1eLqQEa?=
 =?us-ascii?Q?n6FbBtNf4BstOHgWNZ4kJNBNcfKjCadroJr/z+zY18kVOl/4XnnKVB/Er0iH?=
 =?us-ascii?Q?Kg6+MEEGZC6/BsmaG+V3kM6NE5dBTq4FN3vZIAY5QntgLKlyb2sYGv6HHs+B?=
 =?us-ascii?Q?bA9WaoYpQsJ4DLuVUbUMfWQH/YClbCnP05mkGviPPfCaSD1hZDsAubdPX2F6?=
 =?us-ascii?Q?M4uviTcUMBhEMeoIC7eXnCVW6IvAI/3akRXR3ZtR7kjOafiKwTMQ0AcgBrQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fNXcJj2Kk8Ac74T+kbgLiMcIH6pkT2l5FrAFPEmaYR0JQPxU6Af7R+fp7OG?=
 =?us-ascii?Q?oA/E0Vjp8OwRDHuto2ay9R8D6VIphyLFIgEn01etju4y3uCAWCrsf1e3vYTU?=
 =?us-ascii?Q?wezSWIShjtyBIGdD9FS1pmpNa7Gn2uigkIj0QQx7eIKWXicaPkA1UiQ2P7u7?=
 =?us-ascii?Q?FwGV5vG11bXSNy8Jj7AetWpYeTzXQxiLlZrYGK/s0Y72d1hSVXbVyKLqG546?=
 =?us-ascii?Q?CLbLlrjvvQGcPexaPf0f8fjNHMsKPFrPlSXg0/oBl7zMFeRv5zX1uc9SMYu0?=
 =?us-ascii?Q?ZP1yM3vzuAtmeiuU1uWHS327eeipftcJdnkU0MinFiDBW2jcE2yoXPlc5AEV?=
 =?us-ascii?Q?lAPoc48QFBEkmaLv+31rYdcjakFArsP/ZM/v25r47jov4ib9VYvYWi7gg7c5?=
 =?us-ascii?Q?6ALvrDfWJMFy0f2t3sOa98n0OuXo14Jrr+MGjy74N00lyXhgNpsMzTBLvmCm?=
 =?us-ascii?Q?+eiQwubKYsqo1Scl+73gZ4ug9Rzyb47lEH9H2CAjzMtmlk5+m/zUG12cwa0k?=
 =?us-ascii?Q?siojDNHX8+fgN1RzkXb7WI8Clwg/0eNjZ3rD2Eq+rP9oOtFVBEZGOWxf11jd?=
 =?us-ascii?Q?LQbHQvVzyK43BbD/JstB9zFSaMu5FbyE+l3wzxgF29XGGHQ0QEfK0AHWwZtP?=
 =?us-ascii?Q?vTZRWsfjRufzPLEM3NArS8mp6BNEIVQfZQojeU8bHgxOdMwvNARpxhUlabqh?=
 =?us-ascii?Q?n8ZlFmVh+Nsrgej8GD0/YI13uYU+sM7GJd6O4o6RdjQo/VfDlxqOgDOKkAmA?=
 =?us-ascii?Q?t8M7pRkxanI33InhqRBzGuD7GJdOgt0ce0bePTwCTOjRIDr2NDtg1MP8Olta?=
 =?us-ascii?Q?x+lMb3eMN0yViRuV3TDDM3HLHW1XJ8dkCdRXy8HqYu7fxXZlWvxYkKnH0EAO?=
 =?us-ascii?Q?7YwH+9ny4FxgWo0V2jx793nSaQE6qL9OgKqQmhJkqrUpv8jK65+8Wxgv6IXT?=
 =?us-ascii?Q?o+SINZKcaCeeSjfe4ELvU9nQ7uUaIslN1NSX7s/vFsXM3FlBlOJHGlUBlwSY?=
 =?us-ascii?Q?jkrzmfW3fUxeW17eYKECVzpx4V25xBG1RX689cVcWYKFzapnQhmy+LGL/inX?=
 =?us-ascii?Q?dGH9R7ZFrOBxnmyjjSCVYeI8SJJTqR9ykrdRnLA1FPb1pJUqeflVx+nPMs3h?=
 =?us-ascii?Q?m9QOUs4+bnIbvZns5a+0ptuEUqJpdz9Hz4pHKVohAXGDjs5VVl09sjQsK5sU?=
 =?us-ascii?Q?Y1IQny+N0yImWA0rvRRG3Go03zyoMhRmvklUOYgMyN+xsLN/CdOFUBFuI8Yh?=
 =?us-ascii?Q?JBG0yozP31nTBs6RBUnf/9ASsCxtC2UuILN4mTW7L11Tx0Zy9KSvBQCisqvB?=
 =?us-ascii?Q?laQIT+zgBZ1iy5OM8DViG+jyqdNAetSdqsGHad48Zs4wH/YGEPHygsOIOlE6?=
 =?us-ascii?Q?aLZkcPb10JXY1e3GpNLPXdT5GSr9XJZrpX7OoQG6m8KvPZys8yL413+UR6bF?=
 =?us-ascii?Q?UWIMgmR5N1KZKWEMqPS55p8JHWllD1QnjRUBTN2G1IKHmKKJQjzfQ+OnHIMi?=
 =?us-ascii?Q?2osnuZms1wJk91sgbeIyFh5WFhMl690ZolaiDO6Y5nIPgA8dyOb498zAbawP?=
 =?us-ascii?Q?HmS6LnIaCwah2aakF0P3+bP7fo1aYt92pYpfPrICwA/AqWFtMehB/cniJNrH?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf2c1e2-04f9-4015-92e5-08dcde50b8a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 17:29:05.8315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUJm5Ay8WI3FNox4+GN2Awsek7iYiK2mPPbUvYmY2EmSkk6PmiaIfrZjRl3wx9vmSV4PwFXFMnDxGJHzXCh53X3T7XuvdF2m5Air/vb9ziU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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

On Thu, Sep 26, 2024 at 06:57:52AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Move IRQ-related registers to dedicated header
> URL   : https://patchwork.freedesktop.org/series/139013/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_full -> xe-pw-139013v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-139013v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139013v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-139013v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-128x128.html

<3> [506.109352] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)
<3> [506.121178] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

Re-opening https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2525
since this issue is still happening.


> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

Looks like there were issues communicating over gmbus.  Not related to
the movement of the #define's in this patch.

> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +3 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2525 again

> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][6] ([Intel XE#1201]) -> [SKIP][7] +27 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

Expected skip.  DG2 does not support USM and pagefaults.


Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@crc:
>     - {shard-bmg}:        [DMESG-FAIL][8] ([Intel XE#1033]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_async_flips@crc.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_async_flips@crc.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - {shard-bmg}:        [SKIP][10] ([Intel XE#2385]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - {shard-bmg}:        [SKIP][12] ([Intel XE#2327]) -> [SKIP][13] +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - {shard-bmg}:        [SKIP][14] ([Intel XE#607]) -> [SKIP][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - {shard-bmg}:        [SKIP][16] ([Intel XE#1124]) -> [SKIP][17] +15 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - {shard-bmg}:        [SKIP][18] ([Intel XE#367]) -> [SKIP][19] +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - {shard-bmg}:        [SKIP][20] ([Intel XE#2251]) -> [SKIP][21] +19 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - {shard-bmg}:        [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_content_protection@legacy:
>     - {shard-bmg}:        [FAIL][24] ([Intel XE#1178]) -> [SKIP][25] +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_content_protection@legacy.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - {shard-bmg}:        [FAIL][26] ([Intel XE#1188]) -> [SKIP][27]
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_content_protection@uevent.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - {shard-bmg}:        [SKIP][28] ([Intel XE#2320]) -> [SKIP][29] +9 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - {shard-bmg}:        [SKIP][30] ([Intel XE#2244]) -> [SKIP][31] +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - {shard-bmg}:        [FAIL][32] ([Intel XE#1695]) -> [SKIP][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - {shard-bmg}:        [SKIP][34] ([Intel XE#776]) -> [SKIP][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_fbcon_fbt@psr.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - {shard-bmg}:        [SKIP][36] ([Intel XE#2380]) -> [SKIP][37] +6 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - {shard-bmg}:        [SKIP][38] ([Intel XE#2311]) -> [SKIP][39] +35 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - {shard-bmg}:        [FAIL][40] -> [SKIP][41] +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - {shard-bmg}:        [FAIL][42] ([Intel XE#2333]) -> [SKIP][43] +8 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - {shard-bmg}:        [SKIP][44] ([Intel XE#2352]) -> [SKIP][45]
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - {shard-bmg}:        [SKIP][46] ([Intel XE#2313]) -> [SKIP][47] +38 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - {shard-bmg}:        [SKIP][48] ([Intel XE#2350]) -> [SKIP][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - {shard-bmg}:        [SKIP][50] ([Intel XE#2502]) -> [SKIP][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - {shard-bmg}:        [SKIP][52] ([Intel XE#2493]) -> [SKIP][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>     - {shard-bmg}:        NOTRUN -> [SKIP][54] +44 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - {shard-bmg}:        [SKIP][55] ([Intel XE#2763]) -> [SKIP][56] +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_properties@connector-properties-legacy:
>     - {shard-bmg}:        [PASS][57] -> [SKIP][58] +132 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - {shard-bmg}:        [SKIP][59] ([Intel XE#1489]) -> [SKIP][60] +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr-basic:
>     - {shard-bmg}:        [SKIP][61] ([Intel XE#2850]) -> [SKIP][62] +19 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_psr@psr-basic.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_rotation_crc@cursor-rotation-180:
>     - {shard-bmg}:        [DMESG-WARN][63] ([Intel XE#877]) -> [SKIP][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_rotation_crc@cursor-rotation-180.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_rotation_crc@cursor-rotation-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - {shard-bmg}:        [SKIP][65] ([Intel XE#2329]) -> [SKIP][66] +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - {shard-bmg}:        [SKIP][67] ([Intel XE#2413]) -> [SKIP][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-none.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - {shard-bmg}:        [SKIP][69] ([Intel XE#1435]) -> [SKIP][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-3/igt@kms_setmode@basic-clone-single-crtc.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - {shard-bmg}:        [SKIP][71] ([Intel XE#2426]) -> [SKIP][72] +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - {shard-bmg}:        [SKIP][73] ([Intel XE#1499]) -> [SKIP][74] +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - {shard-bmg}:        [SKIP][75] ([Intel XE#756]) -> [SKIP][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_writeback@writeback-invalid-parameters.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - {shard-bmg}:        [PASS][77] -> [FAIL][78] +2 other tests fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - {shard-bmg}:        [SKIP][79] ([Intel XE#2236]) -> [SKIP][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-139013v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-lnl:          [PASS][81] -> [FAIL][82] ([Intel XE#1701]) +1 other test fail
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#1659])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][87] ([Intel XE#1874])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#367])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#787]) +32 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#1252])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][97] -> [INCOMPLETE][98] ([Intel XE#1195]) +1 other test incomplete
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#314]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#373])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#308])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [PASS][108] -> [DMESG-WARN][109] ([Intel XE#877]) +1 other test dmesg-warn
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#886]) +4 other tests fail
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][114] ([Intel XE#1195]) +1 other test incomplete
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][115] ([Intel XE#324]) +1 other test dmesg-fail
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [FAIL][117] ([Intel XE#1861])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#656]) +32 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#836])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#1489])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201]) +38 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#2850]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#330])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#2849])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>     - shard-lnl:          [PASS][130] -> [FAIL][131] ([Intel XE#2667])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][132] ([Intel XE#1473])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][133] -> [TIMEOUT][134] ([Intel XE#1473] / [Intel XE#402])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][136] -> [FAIL][137] ([Intel XE#1000])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#688])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
>     - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#1069])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#288])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#2229])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [PASS][145] -> [FAIL][146] ([Intel XE#2723])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_oa@oa-exponents.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-3/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@oa-exponents@ccs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][147] ([Intel XE#2723])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#366])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][149] -> [ABORT][150] ([Intel XE#1358] / [Intel XE#1607])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-2/igt@xe_pm@s4-basic.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [PASS][151] -> [ABORT][152] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][153] -> [ABORT][154] ([Intel XE#1794])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][155] -> [ABORT][156] ([Intel XE#1794])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1201]) +5 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1033]) -> [PASS][159] +1 other test pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][160] ([Intel XE#1426]) -> [PASS][161] +1 other test pass
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][162] ([Intel XE#1426]) -> [PASS][163] +3 other tests pass
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [FAIL][164] ([Intel XE#1659]) -> [PASS][165] +2 other tests pass
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-adlp:         [INCOMPLETE][166] ([Intel XE#1195]) -> [PASS][167]
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][168] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - {shard-bmg}:        [FAIL][170] -> [PASS][171] +5 other tests pass
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@single-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#877]) -> [PASS][173] +1 other test pass
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move:
>     - shard-adlp:         [DMESG-WARN][174] ([Intel XE#877]) -> [PASS][175] +1 other test pass
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-1/igt@kms_cursor_legacy@torture-move.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][176] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][177]
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195]) -> [PASS][179] +1 other test pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
>     - {shard-bmg}:        [FAIL][180] ([Intel XE#886]) -> [PASS][181] +8 other tests pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@absolute-wf_vblank:
>     - shard-lnl:          [FAIL][182] ([Intel XE#2631]) -> [PASS][183] +1 other test pass
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-8/igt@kms_flip@absolute-wf_vblank.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-4/igt@kms_flip@absolute-wf_vblank.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [FAIL][184] ([Intel XE#886]) -> [PASS][185] +2 other tests pass
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][186] -> [PASS][187] +1 other test pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-3/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][188] ([Intel XE#324]) -> [PASS][189] +4 other tests pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@kms_plane@plane-position-covered.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
>     - shard-lnl:          [DMESG-WARN][190] ([Intel XE#324]) -> [PASS][191] +2 other tests pass
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - {shard-bmg}:        [DMESG-WARN][192] ([Intel XE#877]) -> [PASS][193] +12 other tests pass
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-8/igt@kms_plane_cursor@viewport.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-8/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][194] -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20:
>     - {shard-bmg}:        [DMESG-WARN][196] ([Intel XE#2566]) -> [PASS][197] +1 other test pass
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
>     - {shard-bmg}:        [DMESG-WARN][198] -> [PASS][199] +7 other tests pass
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [FAIL][200] ([Intel XE#2029]) -> [PASS][201]
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - {shard-bmg}:        [INCOMPLETE][202] ([Intel XE#2870]) -> [PASS][203]
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-bmg-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [FAIL][204] ([Intel XE#899]) -> [PASS][205] +1 other test pass
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][206] ([Intel XE#1473]) -> [PASS][207] +1 other test pass
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-WARN][208] -> [PASS][209] +2 other tests pass
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [ABORT][210] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][211]
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][212] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][213]
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-8/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][214] ([Intel XE#1794]) -> [PASS][215]
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][216] ([Intel XE#958]) -> [PASS][217]
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#316]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][221] ([Intel XE#316]) +3 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][222] ([Intel XE#1231]) -> [DMESG-FAIL][223] ([Intel XE#324])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1124]) -> [SKIP][225] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][227] ([Intel XE#1124]) +8 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#610]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#610])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#367]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][233] ([Intel XE#2191])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#2191]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#2191])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][237] ([Intel XE#367]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][239] ([Intel XE#1252])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][241] ([Intel XE#787]) +83 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1252]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#787]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#1195] / [Intel XE#1727]) -> [INCOMPLETE][249] ([Intel XE#1195])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][251] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#306]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#306])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][255] ([Intel XE#306])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#373]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][259] ([Intel XE#373]) +5 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#308]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#323]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#323])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#307]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#307])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][267] ([Intel XE#455]) +8 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#776]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#776])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#701]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#701])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][273] ([Intel XE#651]) +21 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#658]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#658])
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#651]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#658])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][281] ([Intel XE#653]) +20 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#653]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#653]) +16 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201]) -> [SKIP][285] ([Intel XE#658])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#1158]) -> [SKIP][287] ([Intel XE#1158] / [Intel XE#1201])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +17 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#1201]) -> [SKIP][291] ([Intel XE#2763]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][293] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201]) -> [SKIP][295] ([Intel XE#1201] / [Intel XE#2763]) +26 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#1489]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#1201]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#1489]) +15 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-464/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#1201]) -> [SKIP][301] ([Intel XE#1489]) +3 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201]) -> [SKIP][303] ([Intel XE#2850]) +9 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#2850]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#2850]) +9 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_psr@pr-dpms.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-464/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#1201]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#2850]) +60 other tests skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@kms_psr@psr-dpms.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-436/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#1201] / [Intel XE#2850]) -> [SKIP][309] ([Intel XE#2850])
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][311] ([Intel XE#327]) +1 other test skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#455]) -> [SKIP][313] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][315] ([Intel XE#1729])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][317] ([Intel XE#1201] / [Intel XE#1500])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][319] ([Intel XE#756])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@kms_writeback@writeback-check-output.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][320] -> [SKIP][321] ([Intel XE#1201]) +22 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][323] ([Intel XE#288]) +3 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#288]) -> [SKIP][325] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         [SKIP][326] ([Intel XE#1201]) -> [SKIP][327] ([Intel XE#1201] / [Intel XE#977])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-adlp-6/igt@xe_pat@pat-index-xe2.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html
>     - shard-dg2-set2:     [SKIP][328] ([Intel XE#1201]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#977])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][331] ([Intel XE#366])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b -> xe-pw-139013v1
> 
>   IGT_8032: 8032
>   xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b
>   xe-pw-139013v1: 139013v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139013v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
