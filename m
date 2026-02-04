Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBB5EA7943
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 20:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6924D10E208;
	Wed,  4 Feb 2026 20:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLrtSyNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131D10E208
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770235848; x=1801771848;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=b+4nlkOFQ0YmCBgcJTwjylykfQBPNFLURwV1qYeZxDk=;
 b=PLrtSyNVtVoa/nAyDcQjCbK2K4lALwbHHLtcqAIcpQCDUPmvw42bXyni
 LSYxWeT1cJ8D/Jbnv1GM2IzGdAAcp4yDT1JhvOXrlbW3co7nwQf1n4dLs
 ATemWe3SFRWMNlxlJbVtxM6m9zScIqakAjKSGZbfVtsmLJ5smhl2IR3aq
 8zLlOzsj5PSIjHIqZtyOn339F3EXWVhIrrzv+FfY+NvFFhioENCbVEFG/
 kyS46eZX67EoMwxHjgbSE7AJ2MRM22krPSpya217jivIr6bSfJvBFn5rU
 4DAX/yYgVu+uv+Vr4GQRClJPgaUTEyFhvzE6IvjuZxw4+YdtsyBvNiOf7 Q==;
X-CSE-ConnectionGUID: h0VmuPoSQfCLc/mMSyH11Q==
X-CSE-MsgGUID: N05Z2u+bTbKV0ZlbTbS7nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71467620"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71467620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 12:10:48 -0800
X-CSE-ConnectionGUID: xXeEueODSBmm5ikny5p93g==
X-CSE-MsgGUID: x1pszGboQ2CKoM+Y1PGBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209564298"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 12:10:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 12:10:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 12:10:46 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 12:10:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFNxMLX8uTiAgxHK8RD8PehQgcpIRCIe3DqY0NkGLgv/CaiLlFPC7bTQ/y8NfV/t2abafehEQ6TT7L7CKSf2vnZ7asVL+AcYCjKwND3F6Vq7OirlMRe3n5XtdfbQ/1Z1ptamIzCZMsLd5Mz/aw47KFQ8qtvJz1d06iukzMGABCNZMUeZ4KAALicn9Ln/ZVKQBGKeZVEr3zJufek1Lyp0YMj2wCjDNqZe+E6KmXAjmkaioprs3tBjSiwnQO1QO5QB71MDcTomycrc7TK39K+BHEch6opG2eUUGfJsRQaSA1DXSF33PTLzG2IsZx44JbXgxYaHtjDLMONH5+nWS2FmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lmm4iOGcmN5BGIDQzDT/tr0RK9WbCb5HVli4eQp3K1Q=;
 b=cf4aNwfpU9Wjj0r1DPMC2B3F07+/6LDvyUUsdKyMr4BXbP1L7wCC73sUUiW0DrtmKHG6aD9lnR8q4RffdCmO2h3PQwR9uP/kH8JD9CcIL/ILfupn3jZjO1FDg3VbFuN8+RMae8NJreNCTbJ/qVmaWmlSfgdA8HQO/ohn1t8Lalbtp9CIO3S/wsk2dz7scVVkn47bX1q1N7dz1hv0gEVIa0e2w7MpagnXExqanPgln8R+EFUJhL81qxki79I78zisnZRpJ4B7xyDUaMxzT9PckckaEnx5+vcraOfBNnCSvyKA/3AFg4QlrZL6TJXXFbqYy4iStJMewnPNehCUNSQtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 20:10:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 20:10:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3p_xpc: XeCore mask spans four registers
In-Reply-To: <20260204002549.3888274-4-matthew.d.roper@intel.com>
References: <20260204002549.3888274-3-matthew.d.roper@intel.com>
 <20260204002549.3888274-4-matthew.d.roper@intel.com>
Date: Wed, 4 Feb 2026 17:10:34 -0300
Message-ID: <875x8c6zid.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::42) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb26e3a-4511-4d20-1390-08de642976a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vXZz3MBsJpxIw3NlgbEvnwxnXppi/fjjAu25DlCgr84ozW6IjR1d7PUK2o1y?=
 =?us-ascii?Q?Mix+Ap7rjt2OTPBoUuzNftKjlMPeHwfP0QpIq5q+FUEjiZNhcpT3HB40L6tW?=
 =?us-ascii?Q?mEIPBsPcfJ8rkcs2Q2MOB/9/8woy/PatOVNG3VraQe5sQo2KjkJoXd1DhnYp?=
 =?us-ascii?Q?+6vVhOzgWPtjmWk5Xvt3dXK2SJ6Sgi/8fy/8H81vN/ISCCxqW3lkC8kj+ULs?=
 =?us-ascii?Q?p71cpPKM6KscHHIf9Dg2AOUrF9KWkxNA6fwidlxS7mRPqZJAYo4CABoznzB9?=
 =?us-ascii?Q?Wr665i/0fpQ/qEYAm/BnoyrRkzn8kAQuZieKwp2ArHQtph8pSzp/Ooie8smD?=
 =?us-ascii?Q?P/OnP5MTewbRvbh2lsmmU9yE2fgVtASQQkWec9gULnZ5WB5DOHySV6yjNdTH?=
 =?us-ascii?Q?+Wvw9l6+uQ6aEIxB4e1fAb6BeWG36FEOzKjbhTNDa8ldpwRGSDDNLTkqzVqC?=
 =?us-ascii?Q?7Vk6J/5/8uUlQT9SFo9yhGlTBhKF//3lhG6n5HOUwZrxJi0O5v6fQoy+LXE3?=
 =?us-ascii?Q?WRPU2jSRX7GMG4TbRxGcd5F6pQzhIRAOfnVMqIALlgyOSUhMs3B1WrJ87MFr?=
 =?us-ascii?Q?J45zSXiZg7OYN3FFFiE6c0Di0/C8HNq2q+xU7krNnl8J9aynWiEBs/uHt3JS?=
 =?us-ascii?Q?Z9QiNyB/PJGUJL5JCmPK0gk0ByqcijySqRte4SbENHLY4pCzeBw4qllcIZQr?=
 =?us-ascii?Q?d11GBWeRU0IFdb/rp6lGctVj7NkbNatb0G+ucwzcTtIImgp/AEBYDGrnwoBy?=
 =?us-ascii?Q?jMbWfGBELaxM+iI3VphESqNhV1JXWVQ2p77WTMNWpdEnmxQm1LYjeb+ey+a5?=
 =?us-ascii?Q?tydSn93UvjdONXIJW6aH9ZhBPp7HyAP7hcZCbghb0Pwa/yj+qLUjK6bDoCDK?=
 =?us-ascii?Q?MUMXIsZbLM8bQE+rXThj5TEV/OY+YW8bxnIz2wMmYY2ZnzjT5liUEw5Pmp2I?=
 =?us-ascii?Q?Q+NIws8/IyEYZgRc28Yeh/GyKj6EgaOxZbN6oH9F5ZopP3wIaTKga1Lu3RP8?=
 =?us-ascii?Q?blv5+qQW6RVzbqems0tGYjcvF6k7vxjuTkr7aRPHke0f5X8g5wubOzwR/VgB?=
 =?us-ascii?Q?znFne6aUSeQAk1s6jvwBLvlpRP1h3cBBV+YxkYf8NHb6wqn3YkncS4bbZpP5?=
 =?us-ascii?Q?TQbuM7zofJ8FZe+rvRc0hYxTiNUImjxwBX7altFFwpBVHND/ecQq5nZBeEs5?=
 =?us-ascii?Q?6k1BYi0YxqErmau1IbevU9KqpcVt8DZSuIe65RvTlUYrcdjHJnNSKevBCnjY?=
 =?us-ascii?Q?Azdks5AazqyY1JfbbSSrUZkGmrlCxYSDR/DuKPXSUb7TvUBLl5nxluxRothO?=
 =?us-ascii?Q?W5Vz23mU+O5m4QmHnONm2ANVQOyt971DHw55t3Z5kneU19utVTtoCIzcg+s+?=
 =?us-ascii?Q?Feu3Vp7ck9E1+XpGAObjvV+a0EFM7usDKOQvsYzO2rPiDD70OsTos8W8cbws?=
 =?us-ascii?Q?MKQUpMD8zk93jP7Cx1HGSTtuQyZok45+hgCrIFcv0tSME1cgPF12SeM1UhIx?=
 =?us-ascii?Q?b6VarVkrxDNgI2BwiYk+FiOGTs88966HogKTsyMNu1y8KZdUhAvQf1J2NCVZ?=
 =?us-ascii?Q?qhPJhiemaJcpCbojhZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QdXkILrGRGy/RPFXvUFzyHOQ2mgXDtZQY0k59gujarpy1qu4J9VsRMaAyOM9?=
 =?us-ascii?Q?8UGEYZCD0T3n+2pmVAbZEjLu8GQxq9iNaTu2A9yYEkUpZHO9U5cC+ALeN627?=
 =?us-ascii?Q?spQe4yXBgH0ZNZOqzehVzkGGr8/pthkuarst4GZBJS0vIy+zl7QCq2mQBQuY?=
 =?us-ascii?Q?SSJn0gOV2W2utJorvson7M54NktM76mn6Kz7OHPjF1skaXqGlGM9EGQ2WmhX?=
 =?us-ascii?Q?X5s8buTkW6s/eAsr0b22Q2ifmUpAmjbiPtr2oWsqAof/INAf42K+Q85uFlHM?=
 =?us-ascii?Q?m3rws5XzLqXdOX9LMQ2Z21Z8j2IjSY1Irc1oTrvzRCwwRGsqCqW1lzStko0H?=
 =?us-ascii?Q?rDG+MaZWiCdYmqTpcSln4BpptEH+y7+Nq+/moRS2Rk9VcQj+IKOO1eqe2fgR?=
 =?us-ascii?Q?yHsaSrwgR5vPxJ3sueHeKxCNm0RJFvNx/shsXfawjpu4UWq6ti+Ns+Z8oMoa?=
 =?us-ascii?Q?H7KpSS4+dyh5pb3363QsZ7d4Batwn3AlNJFLaPQ7CSsQbHgepDA2GLaWNEru?=
 =?us-ascii?Q?e9n8Wp3JGOaMbbQEP/8lKGGm2G+VA25SwjTNYzljHnry7yxHJtOn1eXHlf6u?=
 =?us-ascii?Q?vJYd4phzyW3uB6GRIzimkZgbrfQ6TWCqxMI3fetiFVQwccCYaYvBOVf0Ulpx?=
 =?us-ascii?Q?wlhgBDI5rU8ItRGF6fhGpfj42TgmBS9nQ68OzkOrQ6QuaU6AEAV4Cn82CD8A?=
 =?us-ascii?Q?FwDiJh+5JlyYQAhrWxKRyaqSh47IumsMguFOj0DP64Btf+wi/LT6AGasrF7n?=
 =?us-ascii?Q?mx5BNWmut508l3QfW6w9BYCDyqCmISqWLfwABo0twvBt+sW2rE7BELWQLrP7?=
 =?us-ascii?Q?hgDQvWS4ZJZjbEZqDZySFdLZw6TO0FVW5yNWZXhgorwx23yV9PWz60DX8VAn?=
 =?us-ascii?Q?uGj0F3BDX1mwBFCCbnVP5JKMbz1NZEQVApUt5crvE7cFVlEnZw/BblhwmRFp?=
 =?us-ascii?Q?da6psP5nVe3fYBy8Fwieip+XIZ2acApOunMxi1OW40Plcf2qMZLSCFQmSRzM?=
 =?us-ascii?Q?xyS8X+PViCzpKRmvBSmT+oJFhUCo+gCx6QNrz1RgU6T3bI7RbQ9Njk6LsFo3?=
 =?us-ascii?Q?7FaBvvXPs2HhadIE/DOBpDuWsjquqziEGwQ+RGTvGFPdW3Q+mBoc5ws7yPB1?=
 =?us-ascii?Q?i5gWWe4EY4vXY4yuE//A5SACF5KFdiXWiyfRKyL6I+h1EaUZ9ubbxBOPDWl3?=
 =?us-ascii?Q?43qHV5DucBMcU2cGGZzbzdHLZd7Rs/cc6MC73RM3UAqdmW/01G4qM6juPWuv?=
 =?us-ascii?Q?ygyOs5X+u1Zhzi0BSf2K3eXiWdMRkZMDqIbZMxaH2Yhg8l1HKzahpTgBf5Pc?=
 =?us-ascii?Q?YTG+81M2AR+ifKON+2jdV+OgmC1N5J3Ab/ATaeRmZHGveUgGemO9AGhjBYGv?=
 =?us-ascii?Q?cu2CoPJdoKQ3V01sfmaJPTns3finVc+GmX1QWdNvNTZpgfYer0Va/Wio8JRA?=
 =?us-ascii?Q?iz0fuwLqgOBbJmk2mvJJwmBNGOdGxmSvOxRC8vVB9WcVMzXdcQu8XxLvlPoT?=
 =?us-ascii?Q?o2+SbN3q5Ad9zFVT/HIywIDQlATkg1hSwKJCs/mGy4d63QWUUcPIf2lqBD45?=
 =?us-ascii?Q?LIRimgyxeVqpSJlw99ylMFjC5ROZHaui7BFlzmFDvIj7YF/EG3N68HZqAnXP?=
 =?us-ascii?Q?vPsBWHvKbjzCMYgD7oFxLCwnAT60mJK0mSt9ZchoB809MPDRAD/PgjtnCxe4?=
 =?us-ascii?Q?f2qeknTkVYs45HQ7thVhUVrP+NKtNBiVAcokmAFDvY7P38v16wwXdOysjPjN?=
 =?us-ascii?Q?YZEqsYb/Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb26e3a-4511-4d20-1390-08de642976a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 20:10:38.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcQWMBL/c2OXI+n0ZGwTvR/tyVWvrAnUNegqIzPJ72Egl1D2VHzDmmLRBMbx6zVRzfRzjkgo2ex0XpHmzgewJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Xe3p_XPC, there are now four registers reserved to express the XeCore
> mask rather than just three. Define the new registers and update the IP
> descriptor accordingly.
>
> Note that this only applies to Xe3p_XPC for now; Xe3p_LPG still only
> uses three registers to express the mask.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 2 ++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
>  4 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 24fc64fc832e..1b7bd34dcc38 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -253,6 +253,8 @@
>  #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
>  #define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
>  #define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
> +#define XE3P_XPC_GT_GEOMETRY_DSS_3		XE_REG(0x915c)
> +#define XE3P_XPC_GT_COMPUTE_DSS_3		XE_REG(0x9160)
>  
>  #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
>  #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 575dcfd5eb9d..bfe87e682879 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -212,11 +212,13 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		XELP_GT_GEOMETRY_DSS_ENABLE,
>  		XE2_GT_GEOMETRY_DSS_1,
>  		XE2_GT_GEOMETRY_DSS_2,
> +		XE3P_XPC_GT_GEOMETRY_DSS_3,
>  	};
>  	static const struct xe_reg compute_regs[] = {
>  		XEHP_GT_COMPUTE_DSS_ENABLE,
>  		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		XE2_GT_COMPUTE_DSS_2,
> +		XE3P_XPC_GT_COMPUTE_DSS_3,
>  	};
>  	struct drm_printer p;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index bede105f37b4..bcb63dced7f9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -35,7 +35,7 @@ enum xe_gt_eu_type {
>  	XE_GT_EU_TYPE_SIMD16,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_DSS_FUSE_REGS		4
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
>  #define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e3a574835f35..42f15cd394f6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -122,8 +122,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>  	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
>  					 BIT(XE_ENGINE_CLASS_COMPUTE),
> -	.num_geometry_xecore_fuse_regs = 3,
> -	.num_compute_xecore_fuse_regs = 3,
> +	.num_geometry_xecore_fuse_regs = 4,
> +	.num_compute_xecore_fuse_regs = 4,
>  };
>  
>  static const struct xe_media_desc media_xem = {
> -- 
> 2.52.0
