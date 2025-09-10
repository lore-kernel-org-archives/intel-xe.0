Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1380CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744F110E0F1;
	Wed, 10 Sep 2025 21:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsJgTn1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252DD10E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757539785; x=1789075785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=czWPPH8OPr4vUzlAkWRF4oz94xo0P1zlzM8Hj7xoDa0=;
 b=TsJgTn1S/xROa1EUnWDJkGQor4Z/mQIx+CqG3kqTSpHLKfToHPC5eqau
 YCFYJRphNEjJ/3YQiodj1M4/mdiYzTB5DyoVnbPw1wlLVN77n5OXwgaA8
 /i7ZKZnaYS3IsxDvHneZGXYkMPYVzsAfA440rGNdGC2szSEam0vQEl0dD
 R4k8NftfMuxzO2PxCndxpWnrAeLbjrqtbvodbvQ+gcafYCtmtuiOKJ7ba
 hCK+ruwAPqcO7ZwxWefaiRzw48PFfpfb6IyhK7z6VbjXHlyflNv88mEFi
 pqiZAa+fy+Ime6+hp7PxB0WkgKgDWmrtQknlfso1rs8Sb07qpOmq+/PwH Q==;
X-CSE-ConnectionGUID: hdofhWKjRN6bNAftwT/iWg==
X-CSE-MsgGUID: +Gf1Rf9cRpi9Ye6UYqdUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="60008419"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="60008419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:29:44 -0700
X-CSE-ConnectionGUID: Qvx14pPxTEWWoWasYScvyg==
X-CSE-MsgGUID: mgvUUBNIQ9GRaLIyIdi4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174317197"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:29:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:29:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 14:29:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=St6HI8cwl8lywnTA3gLI3PQbBACDPEh3ZflCs2+P79JyBwlmyGhtin43Hsj9p1N+dtez9gq5E9lPgpWGLH8RLiY0kTBg3GKUPqOig0s3SN72U35DMpqGlfIc0Jz18ybltXWlPbB6CjOXoWczuD/V2qqCNTCoPF/FhUt5B/V1dgVEWSVEaKohA3X4VqYzwtRoQJE49Ot4zjIkwvivT3VJ7ZjClBDAYwAMdlY32la+efPvJnJI3jXCtcZrNAsEqIEhiBk5jUNntIalJ9WfLwW5U8bLls12h96Ub8xqL+mwWkeiI+ic3krTC5F84M6f0ZH47eXsebaKEejo2BEtpYmTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efoJ6tj2yxzBq718R6l7Vv6MM1bNCSHbv8K3fZ08A8o=;
 b=g670JR654wnypEw15ZnbSrHqI9ZAlzgxC6iZJ/j1VuoeKVOa91lgf4VOyv3L+FYakbxoJVV/tbx/O2RNHXSkDPCtpP75XWlofskhtFP+zhLgsruRAaw7P4TWAnrsp/Kdnq23v2W4e7c0BfEX9W9UHRnVhybu4SAxsuMao1e8ZaYvzaJX610kKmcuND5ztL+KfQhhm2AaCZYoQrjjTK23vh4LOZ2kHvcA5lA3H+3IFi6mZ9uPYE13/CKKI4QnK6JbR8ofUaCdnGXoBNyZB2LZzGx+s7Gqkr8wD/kGMH80blJ80Yfpu87rMeNZTifyjsUZST+y6zgfLAPENTGmqRIRaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 21:29:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 21:29:40 +0000
Date: Wed, 10 Sep 2025 17:29:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Add SLPC power profile interface
Message-ID: <aMHtwNpP_dQtCJBG@intel.com>
References: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: cf740dc2-92be-4d13-cff9-08ddf0b12656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cnuaA8Xvw7NznkXx1OsYhMrRFg8Us9SbT0uc3xFH90Ev+7DyD66Q85WIWS/s?=
 =?us-ascii?Q?FkqUprIvvyo4mTM0k3nm7Jt1xUGYwl2YKH1/4Km5BZ0RX2uqMBRj0ty/D+C9?=
 =?us-ascii?Q?yF2/tqyhx6FeqYNdPA9N7JpglQMCDV2soiM2VUT0IUddrmiFsSyGSOg8LWLI?=
 =?us-ascii?Q?/00tv8OrydO3bglG3tdIkFwjEmDUSN7tkGCJiTu+QJNEg6YxjkyPsLhxFx8J?=
 =?us-ascii?Q?VL6JmCO/RSoiwPFpOw/EEYr1sTHGxkAWU86XL2ogM0Jf6mifQgP/HjT9rAft?=
 =?us-ascii?Q?Z18/ncR2npvWKyyxj5CROiGLmjOS85hPH8TiZSi1PPUgc1+b3CGro0qwXNve?=
 =?us-ascii?Q?XNBBGztYsQoAMd2TXc/3LrBRoEbo/bS66SDitVTZUVfrHrWSWNzPbvpqlyBl?=
 =?us-ascii?Q?+/9HhDLwBgJfEOQ4SeUZFvA8R74wmHzoswPLSocpEYtJLYnzLZURf9nPbYBy?=
 =?us-ascii?Q?oZXXK2KeIGk1eD5pl/7+HfQijpzbi5qAtSznNt9TjBgMqMJ0yykjUX4FM1tU?=
 =?us-ascii?Q?aaom2OgerBHPf+kfdXVR9GciYZEhMAjbwbdT9iVDpagkbIzCknpID7soNWcQ?=
 =?us-ascii?Q?YzziMaDGnz+tho88IDzgDSoLIlI5WF5bozsBZmBBkrzFzP+Rrimzdtfn5OO+?=
 =?us-ascii?Q?KwjMK1MU5Z+1tpELo2kLoXgUXE53b8CiKUpoNbejh4LWtkKzLaCVneu/rLmG?=
 =?us-ascii?Q?AzvCVmuwZPdzfn8kGP6y3RNUGn60k6+JSGGJEQPVuv494aPXyC8MD8/oMzwL?=
 =?us-ascii?Q?HZBUdR2brS+c7Vzz6f+rXmCyWDk18tl9fDAk+dpiFRHiFf/E2fvhcVgbQe8m?=
 =?us-ascii?Q?thGaPY0iM5dXpq66gXxrFQUaBeQMScRsk64r4/PLIRI9Wprop5bFYdy84RP0?=
 =?us-ascii?Q?YXAMqRhmxAyM1pcSsBBFD6mKe2zhOKOj6YkgBKtxbk0ubLe1nXqh5BRDXzcp?=
 =?us-ascii?Q?Av+BmiYrLi7v3hi4FmmXdAj/ci2wkuQXpMpWaBVrBLBuFwPrf71xxmCzm+pb?=
 =?us-ascii?Q?6yGPCogPMGp127R/9b3vH6IwmRRRKYL9gNczonIVsq6sevN5ZM0+gIg4Zkhb?=
 =?us-ascii?Q?IK56FYCDLaeHdlbmjV/Zncwfp5hXZ5TsM59D70qSemzAuWT4J3ZfmuBxp2wk?=
 =?us-ascii?Q?siI8EDOW4fykfcFIGqhQrrWS14BSdR3IcqvTWqmGLocsQIdBN0xrAonAn8Ee?=
 =?us-ascii?Q?McMnM871SQN9YViEl4NmZqCT0r2RGMsgaJrQOhSijUW+4dmFrJxtoWh1k0/f?=
 =?us-ascii?Q?ccuDGgvyj29UPhw5xlYAQtfuJMsBwUCXTiep6lRHOyg+0SID/lJ3bUzieAiO?=
 =?us-ascii?Q?C5vfk5zFXRFfwHd1J44v8sVudS5n1kP1wyCyN2v+75cZodbH9hM4aG7ASmOC?=
 =?us-ascii?Q?k1LI22BDXI02NMKVAWH/B0kACuffY8UWR0mhPzpey/GdMdLOegQojDFSsKfc?=
 =?us-ascii?Q?TZQlmBN8U1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nb+FCQ3rjgq+Oyg+gkAWX1s9i6jLNDZcJ7Y+X0UH5WjwjZJpNbi/B3Axok+0?=
 =?us-ascii?Q?mfNFNcHZqBpxZ37Dk2rIyGapHafmf0/BtF1FnfMLP5YUPi6q2fYvPvwZ1eim?=
 =?us-ascii?Q?Q26aS22eH8Hb3flJv3qBdIX1OUyWGqBQilG/6OlaJ6/unctik6GrdguD2eRY?=
 =?us-ascii?Q?BYyQaJUkWcRrvZATK+StL2ww/nD63/7VZDgqn0Vn/HypY6k1BtGH+IyvsibH?=
 =?us-ascii?Q?9BSNyjSHOjV5BFdniNiv4KR+l3yFL5jrlM15Ku52QdYgoDc3i5vpQzcNGYVl?=
 =?us-ascii?Q?Dgj3DRJ0Kx+h7gWmhHp1J4q+EKnQKAtt+fNSjMIj99WX5WECgKf30tH8SnYI?=
 =?us-ascii?Q?BykhL8PwPeoiW2YtaHOxC746PSrwQE/yc0Ud1Uoylr+JnJ/wGF9JntOYdr9q?=
 =?us-ascii?Q?J9KtVLuKdo8FKlWa4Us08+PaornSPIXWBGlGzsZ4+UeH9ES6TB6NTJ7wnyjY?=
 =?us-ascii?Q?6Da/aI/Gy9EGxanoOCJj+5U55kO7ZRNp20RH3Lff9vSWbrDqpgoafTquyOK1?=
 =?us-ascii?Q?z0dm0x4BspcxAR+wWiPBeYfmpmfN0u5a+ygNUq/kwRe5YkCzO5LZmgKhDdKS?=
 =?us-ascii?Q?zx96pAmgtBllOA+sI7oCqZx0SeRV7N2CLpAaIpm1lw/O1kZxPmcyNqFYKYoN?=
 =?us-ascii?Q?E6vlMncmuAbublXvgIOQBfdI0Fa//+zt9+m1i/SHrRDJUU4kPrhkvDinmWsX?=
 =?us-ascii?Q?HEaUBSEG4aeWQmsz8FIpRBO7B7QKWdeaM8w2jjNfnZFx4vyMVJP1Cc0BcoyU?=
 =?us-ascii?Q?P0l1V434oyRr9BazBXEsibSKK1ih9TZxh1xPbNAillxmF7NTjsEMWRNfk/tl?=
 =?us-ascii?Q?biQxkp4PewZH+0bKFgHiETjEkeD0hlMCzOSSOKJo6N/ggxTtt4ggikx4gmgC?=
 =?us-ascii?Q?4shBCuCXulzMFEB8rGks79ExooCbUqw+jdQ1LqTBJ+rikzSL40tvV9KF0HCK?=
 =?us-ascii?Q?BXLMaCexX/t7O0urcX3vBLI2Q/OhUagBz4PuD7o/UCa2hXH6TIuakUZVhkB4?=
 =?us-ascii?Q?rjgtBatn22teSoxvQR4pxUhx9Yiqg/yGMrNi6zDFBuRHe3N21NhShonTOUHz?=
 =?us-ascii?Q?+x/cuxFehByrebbMVrSdpv2cLNddNyFGbI29ch/dngAu23oFLU38c7+uNTHp?=
 =?us-ascii?Q?Epf0HH6lmpPrniHNmllRdYCmNKmwsfJrai8Q18isMEmM4kdAIjoSTqvx4M9B?=
 =?us-ascii?Q?uoY1QpPi9EMj04PB7Ljf1XUPtPg7UW48jIoGFVP/8OJsyXj1huJCUGYASlIo?=
 =?us-ascii?Q?x2Z6eFKm1QdWuDSMSDfX3AkO4jycSg982nWh46CehcislF8A1Lu/SLtgrB7+?=
 =?us-ascii?Q?skoguyfMKVF4TJQ5LcTz2SHaImgzR+82OZ7TfQM3Ktpp3pUZvCkE813qABED?=
 =?us-ascii?Q?XrFgtgDGujAlq3xBcycM04DKiuSMR5Y+66vHZXxxKRnvR83WSf4qMJEAtjaR?=
 =?us-ascii?Q?YYQ4qTfhHt+MFWWQpmRcFffaRV06nydfcgLAnSfxuBfvVyNmgG3hFZ3zqxtB?=
 =?us-ascii?Q?rnV6DeS+SO36AK5VgyQkPXB+gTILmk7tEHFQsDo7TJgwHtsmNErO1OTZofWC?=
 =?us-ascii?Q?wOjjM+9ofw3VcLLPS/T2XHO7p3KG2ciz1WbxB8yvMgYVBPsdU8BefgDXfpGe?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf740dc2-92be-4d13-cff9-08ddf0b12656
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:29:40.1665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqRbqb+wnj69N22MUtjf4mX4zzXYii8smxtd8eVFC1FkiE8bVYiYLtxTvkFQlckdzt9HivNvKdtYQCGUKJs+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

On Wed, Sep 03, 2025 at 04:21:20PM -0700, Vinay Belgaumkar wrote:
> GuC has an interface to set a power profile for the SLPC algorithm.
> Base mode is default and ensures a balanced performance, power_saving
> mode has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient. This will result in
> lower GT frequencies, thus consuming lower power.
> 
> Selected power profile will be displayed in this format:
> 
> $ cat power_profile
> 
>   [base]    power_saving
> 
> $ echo power_saving > power_profile
> $ cat power_profile
> 
>   base    [power_saving]
> 
> v2: Address review comments (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  5 ++
>  drivers/gpu/drm/xe/xe_gt_freq.c               | 26 +++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 67 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h                |  2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h          |  2 +
>  5 files changed, 102 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index b28c8fa061f7..ce5c59517528 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -210,6 +210,11 @@ struct slpc_shared_data {
>  	u8 reserved_mode_definition[4096];
>  } __packed;
>  
> +enum slpc_power_profile {
> +	SLPC_POWER_PROFILE_BASE = 0x0,
> +	SLPC_POWER_PROFILE_POWER_SAVING = 0x1
> +};
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 60d9354e7dbf..781e4890fb26 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -227,6 +227,31 @@ static ssize_t max_freq_store(struct kobject *kobj,
>  }
>  static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>  
> +static ssize_t power_profile_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  char *buff)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +
> +	xe_guc_pc_get_power_profile(dev_to_pc(dev), buff);
> +
> +	return strlen(buff);
> +}
> +
> +static ssize_t power_profile_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	int err;
> +
> +	err = xe_guc_pc_set_power_profile(pc, buff);
> +
> +	return err ?: count;
> +}
> +static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
> +
>  static const struct attribute *freq_attrs[] = {
>  	&attr_act_freq.attr,
>  	&attr_cur_freq.attr,
> @@ -236,6 +261,7 @@ static const struct attribute *freq_attrs[] = {
>  	&attr_rpn_freq.attr,
>  	&attr_min_freq.attr,
>  	&attr_max_freq.attr,
> +	&attr_power_profile.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 88557e86d637..68a5bf8e3946 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -79,6 +79,11 @@
>   * Xe driver enables SLPC with all of its defaults features and frequency
>   * selection, which varies per platform.
>   *
> + * Power profiles add another level of control to SLPC. When power saving
> + * profile is chosen, SLPC will use conservative thresholds to ramp frequency,
> + * thus saving power. Base profile is default and ensures balanced performance
> + * for any workload.
> + *
>   * Render-C States:
>   * ================
>   *
> @@ -1171,6 +1176,61 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>  	return ret;
>  }
>  
> +static const char *power_profile_to_string(struct xe_guc_pc *pc)
> +{
> +	switch (pc->power_profile) {
> +	case SLPC_POWER_PROFILE_BASE:
> +		return "base";
> +	case SLPC_POWER_PROFILE_POWER_SAVING:
> +		return "power_saving";
> +	default:
> +		return "invalid";
> +	}
> +}
> +
> +void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile)
> +{
> +	switch (pc->power_profile) {
> +	case SLPC_POWER_PROFILE_BASE:
> +		sprintf(profile, "[%s]    %s\n", "base", "power_saving");
> +		break;
> +	case SLPC_POWER_PROFILE_POWER_SAVING:
> +		sprintf(profile, "%s    [%s]\n", "base", "power_saving");
> +		break;
> +	default:
> +		sprintf(profile, "invalid");
> +	}
> +}
> +
> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
> +{
> +	int ret = 0;
> +	u32 val;
> +
> +	if (strncmp("base", buf, strlen("base")) == 0)
> +		val = SLPC_POWER_PROFILE_BASE;
> +	else if (strncmp("power_saving", buf, strlen("power_saving")) == 0)
> +		val = SLPC_POWER_PROFILE_POWER_SAVING;
> +	else
> +		return -EINVAL;
> +
> +	guard(mutex)(&pc->freq_lock);
> +	xe_pm_runtime_get(pc_to_xe(pc));
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_POWER_PROFILE,
> +				  val);
> +	if (ret)
> +		xe_gt_err_once(pc_to_gt(pc), "Failed to set power profile to %d: %pe\n",
> +			       val, ERR_PTR(ret));
> +	else
> +		pc->power_profile = val;
> +
> +	xe_pm_runtime_put(pc_to_xe(pc));
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1249,6 +1309,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> +	/* Set cached value of power_profile */
> +	ret = xe_guc_pc_set_power_profile(pc, power_profile_to_string(pc));
> +	if (unlikely(ret))
> +		xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> +
>  out:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	return ret;
> @@ -1327,6 +1392,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc->bo = bo;
>  
> +	pc->power_profile = SLPC_POWER_PROFILE_BASE;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 52ecdd5ddbff..0e31396f103c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,6 +31,8 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
>  int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>  int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
> +int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
> +void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index c02053948a57..5e4ea53fbee6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>  	struct mutex freq_lock;
>  	/** @freq_ready: Only handle freq changes, if they are really ready */
>  	bool freq_ready;
> +	/** @power_profile: Base or power_saving profile */
> +	u32 power_profile;
>  };
>  
>  #endif	/* _XE_GUC_PC_TYPES_H_ */
> -- 
> 2.38.1
> 
