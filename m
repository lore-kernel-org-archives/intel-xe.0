Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C2CA0FF2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 18:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5C10E1A6;
	Wed,  3 Sep 2025 18:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3jVKDdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7A10E1A6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756922983; x=1788458983;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e8Ax1kUw0D21E85hiFmRlNN5dq5ObGFMrGKel/nqJmw=;
 b=n3jVKDddeRPj+BtqP/r+jZNdiKOmbRm/ejAqKwhUzQ2mpv0vAJi+UQ0Q
 yWvkHnBrC6FTG3F3X37dicfk5f3bsjaxorM24jkW48Dmv9Pf3KslvYf32
 xqEJZqto+4oHvyx+jW4JUT2Hm83NqSRMumm+QXK638f/tZv+aJTDnmk55
 IRBd5TQQaNoetAciyJKlhXEeGZr2q1O7MKl8OvwSFaB157vgJ+bFEA2+r
 Ugl//S/c1x4rXrCotn6z22AxGTtb3NqyGZdM8rNbLz3C32j35CCtOZvOu
 bWxbKsOEHlY0e7MpNLZ7lbR/8cNdXH+dGx+yATLamCDsZ0ybLhyQBF16m A==;
X-CSE-ConnectionGUID: fNH6pfRtTMerqVHI0f1ySQ==
X-CSE-MsgGUID: e3myQDpjT6uQu1BLQwX8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="63070644"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="63070644"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:09:43 -0700
X-CSE-ConnectionGUID: WOx6843ISGyeC+bEkTCojA==
X-CSE-MsgGUID: JP6+g3RaR7eA53Axoivy0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176024931"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 11:09:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:09:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 11:09:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.88)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 11:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2wDpitpVGBfGN4TeBW9A5LtHPZOh/KhesjEL4ZXOgtxOyFN1X++SVOZ/ZnOU4C8MPZ7iFOMG0vEaSg9Aw96UL8/DISLnwrzBVEUzNXo8lWDQcOB9J9X65oZ2W/0hi1mVUve3shTQ+S7rjjZ4fuVAoH1nQeD0FmtMzkHEF2WQaAAVTNXctWy/yi5jPVucFCuvSqMJ9+wx+UmPU4VjTbqW4yh0qmfu5HF3GaT2XubzkiroXVoX2r5Iri22EyE15jZrOJfI9EshaTacCtX+67iaC9be39Xjiy9I01MD9BbTLMBvxF8JZNRUU8QH2PF6RVJ5EL5TA5mHm+vHM3yBxutqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2LyB1JXJ9y196i/HMkqtQG4DNEENHwp8kDzOcS28oY=;
 b=WslyAToLKhznebOIZD84BxA8avd6oOmxMW8mzEOYhtWpIKt1bH8SxveWp60vq/kvwnYaa+8c1IEk+ZDVsUTtYA4jVaj1tVg3cX0PH+3WP0vtXuRNqHV5zoyuGOiF/QBVoZ3XaN/liR2iWH8qWBsoFRGojxZU1NtFge4juV/eLnE/7rFi0uA0ipg17sqKviS4Yr74So99zHUsnR1hS5ShNtPENgFc3xmcPsUKeL7vhqpTYefXLAyu/L4SiY9lNN4mQauHEnnl4kAfgIEwCafOJlT/hGpv8yvezH2ASG3hJMu5+NcI4bbMqAZRC4UWwsJSFaQhviAiITBT/EESFJ/5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 18:09:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 18:09:38 +0000
Date: Wed, 3 Sep 2025 11:09:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 12/13] drm/xe: Rework instances of variants of
 xe_bo_create_locked()
Message-ID: <aLiEX1fHH2dSlvnl@lstrano-desk.jf.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
 <20250902124021.70211-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902124021.70211-13-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0325.namprd04.prod.outlook.com
 (2603:10b6:303:82::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca9dd6c-9eb7-42f7-a639-08ddeb150bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?v0NG3e1Amd4Sxcu0k9fwoHfW7kJjOrdwFK0KmPyE66dNC2nF1yJBn++3bS?=
 =?iso-8859-1?Q?mddISFHCVbTv6lgRXzjOsPwtLZ6HzVpWUv7uCryiBtVq91ZMn1dUpUtNgX?=
 =?iso-8859-1?Q?PUHO+QWym7tRcViSiktNXIzpYQem3L4a6mnFimymaErvFuFis+4j/426Jl?=
 =?iso-8859-1?Q?OHAAVCKu2uSjU5F2E86PyX1Nteg6vX7eeCeYUoY3rW+i0lCsKEDLCLzH3Q?=
 =?iso-8859-1?Q?Qi89AwRxVhwX3wgWXG8lKlh+mSZyPDT93EX+9H2Dyphdj9QPoVOd0JwzrU?=
 =?iso-8859-1?Q?kgl15jFskk47sdWB6kBErY2kEBkPMNYJ3fU+VRRhsrJmomE7k97/7ImmOw?=
 =?iso-8859-1?Q?+M1GbT8DaRaoonxzs8/i52z8I0F9VkwoaNIBDtg6wT4F7rLQpJED3uG6UA?=
 =?iso-8859-1?Q?ag50CZm3rkP/cfIpMlZxAHSOezsyHsskVlUcxDSPP8hu9rez5b+usFICYC?=
 =?iso-8859-1?Q?0LcqBDDQp8xjyoSOXdT0N/kCIDFBShI35Ty48dtmQ5h8Ne+9CSyfAZUVMI?=
 =?iso-8859-1?Q?6RRAq+PjJB4MAjA5lBiT+cywyXM1tDRjeAcmnB++B93olLVjjqKKmLJxUB?=
 =?iso-8859-1?Q?mJfAB6TcJE4P+z4XCo2jyT6I2biBEkgxCHJvgEbue3MbqjmtgBmAXdUvX9?=
 =?iso-8859-1?Q?Up4F2AfJgJPeiQ6azGR8NWolFjyshwvPE8LkDM5O85+cRRnIriL61m655P?=
 =?iso-8859-1?Q?AWNEAIQbbNAHqjBLf/KaQdKktuWGVAhLzrck1F4YgbjnwynMuB4aV5keiM?=
 =?iso-8859-1?Q?vZJlevHCBBxENKp+EgOZnecIXXnTe6k6Q0wLfzpZhC0rCozMr4VVaWJLJE?=
 =?iso-8859-1?Q?XaKbPluRSpKg0tOeWZgL4vwW/hLQtgKN5uDQJQrA/znl9ONbgdRIEHlGqk?=
 =?iso-8859-1?Q?ehfb0XV8EFezu7YIDvwOPgv38fd14XCF1f+YT2mYaiOAvwD61gvNt6M6Io?=
 =?iso-8859-1?Q?fvSmopDNbDIai4BKEQqlQuxUqejVyqimK2p7DwT7hHOHN8vAE9laCD4Wfp?=
 =?iso-8859-1?Q?DlO+XRWWf3Tuik9AwZh686Kpq/NVXQb/vr5akczh8+0sCYoK/2OUmhUvDe?=
 =?iso-8859-1?Q?Smi+2//9lZIigyzouBWqhCTZp2ZRgsy7E/dGfjmxEI98WdrAM4y1l8V1wu?=
 =?iso-8859-1?Q?6sZtOAZkhYqmo65o4erVvrfchY5sFhfo/cZWTFkqJpsfXIuj8GogDIa0w/?=
 =?iso-8859-1?Q?VHwDAI5sN8oq/d9fUHCgck+S3MbSzEqg131U7WoMMNOK2Bw4UM9ktRaN8w?=
 =?iso-8859-1?Q?g2N0tBP4HM7b8lb9L/2dl7ZSVgu2SYnlVScXSowMspTOsbvQgDrbGWHfO9?=
 =?iso-8859-1?Q?vrR92iVbuhxXWDN73f1FhjWGr8mzWX8c7k6nN7S3odVv1YfZBHzQJ8U7X9?=
 =?iso-8859-1?Q?wzT0yFsY32BFw7G47Md4MbDiXft0wQGPYnh12jf0YgiqWR38yK0tnZydWw?=
 =?iso-8859-1?Q?qiZLfVLoBwh7nnN5hudKxFvyszSZqQr23RL2Ip4EybLt6euPeaHsCot3xm?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PGIsmAdAeeGoniEyt+Yb7JRRP/THEeIM96JPBdKkuranRyqXdEJQBUygB0?=
 =?iso-8859-1?Q?fXfZPpEWMXgSBzJzi+pGqGLaxYX5VyTeT0rs90TaObv08Ym4V1Q6GXJgej?=
 =?iso-8859-1?Q?zj8jeUGQwmpgmroBtcaAWw75w9Em0Qa/kGAST4S4D4DK0ivUQLJq2XJLR6?=
 =?iso-8859-1?Q?QmQbOFQkKHd7shOZdFy9GNz75wY0NgizxTyDDaoNV3eUyUiiIxh3mWOT8k?=
 =?iso-8859-1?Q?QlIg4lgsrWeY1Zp1EhVA3EPKVaAU2clABQiwZmM/s/KmUjdBOss+925552?=
 =?iso-8859-1?Q?Nhen1+Rn7FW/NgshOIgzMSl851ZlmB4Bl6yHODvMbAVc4QKjv6xC99dIMb?=
 =?iso-8859-1?Q?reARuiQDG3RpNa3eu51hJa1oiSs/mnBk/IL4mpyX72U0cu9MOkgVPGTwkx?=
 =?iso-8859-1?Q?p9wvNxD/n8+NL1fuaFHXkI/ZnYg/hmOkhaSq5yvtolLJRmR5A1/EoQ9OxC?=
 =?iso-8859-1?Q?nWx04tm21kEiF3LRtpfthLS3/VlH+203gu8IXrESq0G633lNfR2IF0j9fe?=
 =?iso-8859-1?Q?y8RY1SwzMuxFZbz7JwV2aWAUlV01254/5iZGyeMRxWdeQA1L0xKhIK3Pt3?=
 =?iso-8859-1?Q?MMzL6sfI+/NvdS+4oF86vacPbcrtZ74VRzaBQNGdW/n4s7bUf8xHs+r5Ff?=
 =?iso-8859-1?Q?jldyxIboRzlhq/+i5fZ76srnnp6MKvIajN5Nco1BRM3UsX/W+BWhp4BiKZ?=
 =?iso-8859-1?Q?OiilEyvO58HwaAByceSibRczDykZv6Ctq8aff1Y3aNu6ZcyW4UvxsXm+l6?=
 =?iso-8859-1?Q?MI/6Bf9W0NPg9GdmLSB28j+jCrfKp+I6VL7uTZgkIx4hMkVD5wfs/u2T1Z?=
 =?iso-8859-1?Q?u8pdB9JR2xL7Qog8tzDlr3F51qhV93EQpu0zvY7zW+7YvszstkVL0nmkRy?=
 =?iso-8859-1?Q?s9XyuLUkAd4bXuJi1dnIccnQ6mynZ2WmIyXCZrsy7JSKqK1EGCNDSdxY6N?=
 =?iso-8859-1?Q?sZgz7rNNxChyFD+Yy8R80yoEalOMM9x2cZ4ZGzH//K0HsIGgOYtPsJ3C14?=
 =?iso-8859-1?Q?wtIIWcVn/eRMI75e4RbcvD50LGMHB56A/ZYe6RbKhv2QvgXsUkHI9GaJvA?=
 =?iso-8859-1?Q?T/1oKeiLDvBBi4LU/ETipojWHjc5cXreYo6hpO28XuL434JA/Auuc+yE98?=
 =?iso-8859-1?Q?rVfQSQ5pH8Dc215k+wDnZ927BP34PlZtMX6yQWV8WKBEziCEc/pH4HwAGI?=
 =?iso-8859-1?Q?49+mkXSf0NFAu/v28prGiPGE2RBk8kShixCHKGP9NErT75oXwqm6VdtdMW?=
 =?iso-8859-1?Q?SIkZSaTYGzsLjt4oTVp7WOemj575loTI4/ybUsDpL999meTQhXc0N7ngd7?=
 =?iso-8859-1?Q?Yf6knthP62Ka2ti+WIonrGlCasKQvvrcrPYDPuEZE3in36r1FXIA4j5K5e?=
 =?iso-8859-1?Q?603DUGyp4UuXg7idMCgI/STMCCZg/vjabZAqUKSj3HRJNrDZBdkFbVYMch?=
 =?iso-8859-1?Q?gWtcgTFrG6L/zTdUVvPaqL7ydVWYdHuATaLZcUtENSaB3+E994TsDKI/Ir?=
 =?iso-8859-1?Q?84VbBkUcN2DNQkdflACIh7KX3VNWIT6VufgcBGxjXFlz5fWEKhyU0vRCYB?=
 =?iso-8859-1?Q?2ZugpsnMu5a4Wys8Z6VL9mG4tYlL7wCSrzX2oQukuUAgm5INDIS+Lu8ppF?=
 =?iso-8859-1?Q?m2vF+4IK+b7N7xnZhBtTblbAAmdqA4lVnDLbx6WXpnNQ5Ic8rfMGHLdA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca9dd6c-9eb7-42f7-a639-08ddeb150bf7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 18:09:38.6314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjSE4ciddP1VlGSiHHB+x9KWCfOX8Hwrg2LODmW0AqnwrZugTnhtNA0Yke96ronlgt+e6HJftSFtlrnrih5Wdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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

On Tue, Sep 02, 2025 at 02:40:20PM +0200, Thomas Hellström wrote:
> A common pattern is to create a locked bo, pin it without mapping
> and then unlock it. Add a function to do that, which internally
> uses xe_validation_guard().
> With that we can remove xe_bo_create_locked_range() and add
> exhaustive eviction to stolen, pf_provision_vf_lmem and
> psmi_alloc_object.
> 
> v4:
> - New patch after reorganization.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../compat-i915-headers/gem/i915_gem_stolen.h | 13 +--
>  drivers/gpu/drm/xe/xe_bo.c                    | 87 +++++++++++--------
>  drivers/gpu/drm/xe/xe_bo.h                    |  9 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 23 ++---
>  drivers/gpu/drm/xe/xe_psmi.c                  | 26 ++----
>  5 files changed, 71 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> index 1ce1e9da975b..a2d1f684a3a8 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> @@ -21,7 +21,6 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  						       u32 size, u32 align,
>  						       u32 start, u32 end)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_bo *bo;
>  	int err;
>  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
> @@ -34,21 +33,13 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  		start = ALIGN(start, align);
>  	}
>  
> -	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> -				       NULL, size, start, end,
> -				       ttm_bo_type_kernel, flags, 0, exec);
> +	bo = xe_bo_create_pin_range_novm(xe, xe_device_get_root_tile(xe),
> +					 size, start, end, ttm_bo_type_kernel, flags);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		bo = NULL;
>  		return err;
>  	}
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(fb->bo);
> -		bo = NULL;
> -	}
>  
>  	fb->bo = bo;
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 583d48d5d240..03494736a018 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2297,37 +2297,6 @@ __xe_bo_create_locked(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> -/**
> - * xe_bo_create_locked_range() - Create a BO with range- and alignment options
> - * @xe: The xe device.
> - * @tile: The tile to select for migration of this bo, and the tile used for
> - * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> - * @vm: The local vm or NULL for external objects.
> - * @size: The storage size to use for the bo.
> - * @start: Start of fixed VRAM range or 0.
> - * @end: End of fixed VRAM range or ~0ULL.
> - * @type: The TTM buffer object type.
> - * @flags: XE_BO_FLAG_ flags.
> - * @alignment: For GGTT buffer objects, the minimum GGTT alignment.
> - * @exec: The drm_exec transaction to use for exhaustive eviction.
> - *
> - * Create an Xe BO with range- and alignment options. If @start and @end indicate
> - * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
> - * only. The @alignment parameter can be used for GGTT alignment.
> - *
> - * Return: The buffer object on success. Negative error pointer on failure.
> - */
> -struct xe_bo *
> -xe_bo_create_locked_range(struct xe_device *xe,
> -			  struct xe_tile *tile, struct xe_vm *vm,
> -			  size_t size, u64 start, u64 end,
> -			  enum ttm_bo_type type, u32 flags, u64 alignment,
> -			  struct drm_exec *exec)
> -{
> -	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type,
> -				     flags, alignment, exec);
> -}
> -
>  /**
>   * xe_bo_create_locked() - Create a BO
>   * @xe: The xe device.
> @@ -2416,6 +2385,55 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>  	return bo;
>  }
>  
> +/**
> + * xe_bo_create_pin_range_novm() - Create and pin a BO with range options.
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @start: Start of fixed VRAM range or 0.
> + * @end: End of fixed VRAM range or ~0ULL.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + *
> + * Create an Xe BO with range- and options. If @start and @end indicate
> + * a fixed VRAM range, this must be a ttm_bo_type_kernel bo with VRAM placement
> + * only.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + */
> +struct xe_bo *xe_bo_create_pin_range_novm(struct xe_device *xe, struct xe_tile *tile,
> +					  size_t size, u64 start, u64 end,
> +					  enum ttm_bo_type type, u32 flags)
> +{
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int err = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
> +		bo = __xe_bo_create_locked(xe, tile, NULL, size, start, end,
> +					   DRM_XE_GEM_CPU_CACHING_WB, type, flags, 0, &exec);
> +		if (IS_ERR(bo)) {
> +			drm_exec_retry_on_contention(&exec);
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
> +		}
> +
> +		err = xe_bo_pin(bo, &exec);
> +		xe_bo_unlock(bo);
> +		if (err) {
> +			xe_bo_put(bo);
> +			drm_exec_retry_on_contention(&exec);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
> +		}
> +	}
> +
> +	return err ? ERR_PTR(err) : bo;
> +}
> +
>  static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  						     struct xe_tile *tile,
>  						     struct xe_vm *vm,
> @@ -2432,9 +2450,10 @@ static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		flags |= XE_BO_FLAG_GGTT;
>  
> -	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
> -				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
> -				       alignment, exec);
> +	bo = __xe_bo_create_locked(xe, tile, vm, size, start, end,
> +				   DRM_XE_GEM_CPU_CACHING_WB, type,
> +				   flags | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED,
> +				   alignment, exec);
>  	if (IS_ERR(bo))
>  		return bo;
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7de0f5a166d5..e2be6cbc35d6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -94,12 +94,6 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  				struct ttm_lru_bulk_move *bulk, size_t size,
>  				u16 cpu_caching, enum ttm_bo_type type,
>  				u32 flags, struct drm_exec *exec);
> -struct xe_bo *
> -xe_bo_create_locked_range(struct xe_device *xe,
> -			  struct xe_tile *tile, struct xe_vm *vm,
> -			  size_t size, u64 start, u64 end,
> -			  enum ttm_bo_type type, u32 flags, u64 alignment,
> -			  struct drm_exec *exec);
>  struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  				  struct xe_vm *vm, size_t size,
>  				  enum ttm_bo_type type, u32 flags,
> @@ -113,6 +107,9 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  struct xe_bo *xe_bo_create_pin_map_novm(struct xe_device *xe, struct xe_tile *tile,
>  					size_t size, enum ttm_bo_type type, u32 flags,
>  					bool intr);
> +struct xe_bo *xe_bo_create_pin_range_novm(struct xe_device *xe, struct xe_tile *tile,
> +					  size_t size, u64 start, u64 end,
> +					  enum ttm_bo_type type, u32 flags);
>  struct xe_bo *
>  xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
>  			     size_t size, u64 offset, enum ttm_bo_type type,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 906011671b60..6a9a752fe24a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1452,7 +1452,6 @@ static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> @@ -1479,24 +1478,16 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  		return 0;
>  
>  	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> -	bo = xe_bo_create_locked(xe, tile, NULL,
> -				 ALIGN(size, PAGE_SIZE),
> -				 ttm_bo_type_kernel,
> -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				 XE_BO_FLAG_NEEDS_2M |
> -				 XE_BO_FLAG_PINNED |
> -				 XE_BO_FLAG_PINNED_LATE_RESTORE,
> -				 exec);
> +	bo = xe_bo_create_pin_range_novm(xe, tile,
> +					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
> +					 ttm_bo_type_kernel,
> +					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					 XE_BO_FLAG_NEEDS_2M |
> +					 XE_BO_FLAG_PINNED |
> +					 XE_BO_FLAG_PINNED_LATE_RESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock(bo);
> -	if (unlikely(err)) {
> -		xe_bo_put(bo);
> -		return err;
> -	}
> -
>  	config->lmem_obj = bo;
>  
>  	if (xe_device_has_lmtt(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
> index 2815987c190d..45d142191d60 100644
> --- a/drivers/gpu/drm/xe/xe_psmi.c
> +++ b/drivers/gpu/drm/xe/xe_psmi.c
> @@ -68,10 +68,7 @@ static void psmi_cleanup(struct xe_device *xe)
>  static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
>  				       unsigned int id, size_t bo_size)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> -	struct xe_bo *bo = NULL;
>  	struct xe_tile *tile;
> -	int err;
>  
>  	if (!id || !bo_size)
>  		return NULL;
> @@ -79,23 +76,12 @@ static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
>  	tile = &xe->tiles[id - 1];
>  
>  	/* VRAM: Allocate GEM object for the capture buffer */
> -	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
> -				 ttm_bo_type_kernel,
> -				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				 XE_BO_FLAG_PINNED |
> -				 XE_BO_FLAG_PINNED_LATE_RESTORE |
> -				 XE_BO_FLAG_NEEDS_CPU_ACCESS,
> -				 exec);
> -
> -	if (!IS_ERR(bo)) {
> -		/* Buffer written by HW, ensure stays resident */
> -		err = xe_bo_pin(bo, exec);
> -		if (err)
> -			bo = ERR_PTR(err);
> -		xe_bo_unlock(bo);
> -	}
> -
> -	return bo;
> +	return xe_bo_create_pin_range_novm(xe, tile, bo_size, 0, ~0ull,
> +					   ttm_bo_type_kernel,
> +					   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					   XE_BO_FLAG_PINNED |
> +					   XE_BO_FLAG_PINNED_LATE_RESTORE |
> +					   XE_BO_FLAG_NEEDS_CPU_ACCESS);
>  }
>  
>  /*
> -- 
> 2.50.1
> 
