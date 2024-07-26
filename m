Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CDC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 13:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD2510E999;
	Fri, 26 Jul 2024 13:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyIsy1uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B467B10E99D
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722002250; x=1753538250;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KvLIUJg8Fvk/9fvxNtxXt4Cdyx+2w3uyuYICuXWyKf4=;
 b=XyIsy1uymjYHtqqKku7e5LMqQEOBsJ3huqBVcyJzYCE2PI+2E2c96+bc
 AHSlSO2X7oZY7bAnbSXeR5DJ35f4kT0R5ExP7ou0gylHjEkeKybX3DqKZ
 f+lm8WFQABCPNeXBb73ulWnCHYchuLYnEryOHHqR7xaw4W1yms/0BLzZZ
 MZg3BkEw9uvNd5GeSK9oNruNphwO8ZpJeJL3a2qOVmSK0qAfYeHV6YC3k
 /8poan+W2AG/zA6xkdKyK1WQ2mF5Cmxw0T+ngkKRUJkoUNHISzAoi8Lbi
 fyE9nnegMletsl6D7HqBhYeBtpo4GSWZGFwQ2cYSnBJ47ShpmQ+nh1oCW g==;
X-CSE-ConnectionGUID: Behzrmf+QQqHhD8AS1VNVg==
X-CSE-MsgGUID: NidJbQ2vTmK03cWGMEfOLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23594568"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23594568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 06:57:30 -0700
X-CSE-ConnectionGUID: pE08B8/aT+eb6FhKwNz+/w==
X-CSE-MsgGUID: peoVWgjrRZaTThrnrZ34Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58380466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 06:57:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 06:57:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 06:57:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 06:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGOUGkiqzMSyx6KGJSDbG1+8ihO/6vL2FbXNirI2auMClFg6NgT172x8bXVuQppiZOIXW1ay/zedxD3q7HB7w9eudGNPPnYOmfb6VuIRFmwfkyq34Gqr6x69SFgRn614Sd/Q997flUjMKybqxs3ov5Q6s+j9skkmVI4MG6dk6BMc07lQ42OkYRNd76rC96j3SquJb+8gmGVLmy2EwPB41xPDbQcfoEV/tPlPNVgyoEhWNcpPU3NIEdS4uLGpGxYFX/raL2yWHS3LFYlYCCQrD3pdYWp/nqzdpvikcI0tLmU/TcpkheOCXPeQtSqTD7KLU2sdz0gIU+lGHxbZovlelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tDBawfunqyCjkz6md/TRyusOtaRY6TRoyi6LhyByr4=;
 b=NLefyun14YvWtxEHiGC39hTo1SsolFEYLbY6+N6wsZ0MO5zd7RW9aRgVu6xqdQGfPryP5xNrmqtKWU1GqjQY0r8QUgwd0ey1Wy5lVj0jnZ0d6aWf8M7u422WxMo5Nn6BviPBfTn6evUv+1s+Vpo5CpbDVTCIMUZNjsbKVbhf6MJZXUA5kjK/+hyNsqCQB0ltjRYeHsSLIHg6RZ4JQaqTMMYkmgM6Z3Wnjykv8qGbvdwuTO8hBbr4TrXLlANXtDgz+Wu7JIw3zrWbT3eEOTzT0clj2SxOLA4FoNuyvN1em8YsWLR1NopnQd01YQToSNJFBKYWOhHw4dK6bpZLQHmSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 13:57:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 13:57:20 +0000
Date: Fri, 26 Jul 2024 08:57:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Drop pre-release GuC definitions for LNL and
 BMG
Message-ID: <wzitchh3yzru3hbx4rewwmhdicp6n4uwxz6wrocj5tdnotxig3@l22weesvtnwf>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
 <20240726012610.706749-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726012610.706749-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c52f20c-307c-440d-8e9d-08dcad7ade54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C4ZXns6aRX7HTUlR8eAQjWiNLBCijoCWLgHnex/JCQFVcEvkMMpH/Me3OjUO?=
 =?us-ascii?Q?305q6Iwl3gwOyZpvq12GATdNhd9ft/P9Sw+1jXqgQrPSjHi5yUCAuIjfVvN7?=
 =?us-ascii?Q?HYtKmzh/+GhSTzcmFIQ1jHPEx9AvEhKkKJep/4w5jicH7QF3kwtNwFQLSqbT?=
 =?us-ascii?Q?lZDljaarKM04yRvG0OxX/G9XDv7Kq8sc2yEreOAagUI/PdSl/kng0Hq3HiyR?=
 =?us-ascii?Q?iao36AIYIA/N1GclwDI47OXACRC1oI8Q92f3+WTu6lNILdFLkIWcrpN1DaAz?=
 =?us-ascii?Q?FzpXOpM+qM5WWEEhqILbClAiiPXPlCjOurKvjxM+ugPXkuoCrDoN9hR1Q4PE?=
 =?us-ascii?Q?/lDm4GtmL2IIAqEK75pfWQWgw/qMQajF+2fqKhHyjPeZMdBXVSAJ+qntWi0k?=
 =?us-ascii?Q?61cvaXEG4F+xwF8RvyMDpB1zLjQu9l3zxTu4aBGnKyEZyvhoE4icjDbVAyqB?=
 =?us-ascii?Q?E1RyiyvEQmEhLTwtyTqssxR30QFCHkFdWhUYnMhCMaSXK7EUAE0jGTAkUBuE?=
 =?us-ascii?Q?v5t0bJoiPLN1yxElA1xRvHHzBeN9ZI43wQgWaZ/R68Nybav/HfPHlt6aqFy8?=
 =?us-ascii?Q?uDCZl1s8gjAS3tQI1ND4sqgSErtMGojqX7KBfb/oEUuCxNdiP8VbmiDieA6M?=
 =?us-ascii?Q?b09pGSPMBp8cxQg+8QpwO8HwVwG++Sy0YN3WsVBLL8vDqKbZsoFnBnlt6N+a?=
 =?us-ascii?Q?ZV9ra3TrqFzISG8j3uVAChFFrw4m5gELEOzkJdoLXxKZtOlWgG0LxVypkY2t?=
 =?us-ascii?Q?/iAoXMCXcIccPqat/eezLUOAR9o1v5DmPIdu57MPUCqSoWoW3rBu8fcd9MMs?=
 =?us-ascii?Q?EFS3NTRKlt+6LKjS+GVgN+s/5OEXu78sPcsw1b2hoLixQOy865w3WzV2ouqf?=
 =?us-ascii?Q?Lo496Y8WcoB0RV8+n6eKAcPtJbZIybWDl+yG7bp2FQU8/dUAIzcF4QNlQ9ga?=
 =?us-ascii?Q?aMw5Uo5gpY/y3YHAR6AzMhv2h2NN9qFxcKg8F6qfA2dHH/PWlYsZeVIpHsSv?=
 =?us-ascii?Q?0tV1qZQHYPB4AOc30lMBdQmhh8GYR7g7/oqbYWJJMr2lPGlqVBi4yivjm5zB?=
 =?us-ascii?Q?Yg8SPWcE5BTswGk2dsqaTkDYA3iwgMOXVwfwYJH4HPPNFyTT6QO13WqQI95D?=
 =?us-ascii?Q?4JS20RE7+HXdbQlFwNBZXV0Pdi4sudt4lZaXaBCHxeEFX9X6ITDJv8Bj8zop?=
 =?us-ascii?Q?vr85OJ+Oz8gVgJjHoUvg0oPS2g+7dR5+p4HbMyOmyzDT8s42dYLCKHvXq8ii?=
 =?us-ascii?Q?TzmsmQSM4x9/4QCQCrJtfZbZL5GgtKsYNtRJs7MA8vYwezEPFG2wAniWLG+2?=
 =?us-ascii?Q?S1HjHVSVyE3vwhmLXybf82zy92r4X6JR5pPa4Y+UkOpusQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zK2bM0x5FADPNcfxla98PxO4dHS9f5IO+mPPZLaqbssaWfYyl+HUISl/Sy8A?=
 =?us-ascii?Q?dJy3EW9ZxfA40WQ/8072PT6dukDBIOSK0gvRL2hFkdXdsw9sFkCUxghVW5px?=
 =?us-ascii?Q?EGAMxuF3ysiMgXJ/AWrJwfhm/rR+arA5NCNKnuljmuj/EmNzLd4Y3d8ZIGGz?=
 =?us-ascii?Q?vrAne52LmpxbmSTqwsUoj1DFarSSQ0eZUmrgOdEkvT55eikCf/KxMjvnpSzE?=
 =?us-ascii?Q?t+C6kquRFlHsxwErzGxcZ6ZVEAVZ7zGO4KDrtTbQCE5R1XM8Da61u5kNyNjS?=
 =?us-ascii?Q?bP7oYJ0iVrxQ9GBjXvPRt/3SzQdRB5dTEg9TtnH1BKSzpuh2hT53E4ll0QPc?=
 =?us-ascii?Q?fH24+N+6y8u1AUwf4eYhU5bBA0ULghl7hDKb7ZlvI3I/sucP2NMQp1k/IDQM?=
 =?us-ascii?Q?2JuujFc4lxxgU3swxqA6wzq/8ipGcy7/P8dM63/XeqcCkn6JYaurovfVTMpn?=
 =?us-ascii?Q?RKvajY3bjqDwhQw8o9x6seLIQpqlwBTGb6WYFZY5NdbuSqaC9ClrNEbUkheH?=
 =?us-ascii?Q?BQVLU4zj2GF+dom0tkYz8otd8ZKn/GGTQS5pfO3MER9Hv83EKJXM7xrcBa3Y?=
 =?us-ascii?Q?CfBmomqEh+v/PcMBSKgu6kLAXVvCFa1SEJQhOwMKiBj2+U+sGSkyrgKiw78g?=
 =?us-ascii?Q?o4RmNeGESH6k3hz0qd2UOuSw8xUheGWhg3XTrPukC5HSsDNS+tsnRsXKCUup?=
 =?us-ascii?Q?QuU/VAiMOc6kfC7sk0FRlyCUiMDPW7ULr4E68+e09qpSXkO+SE5ShyI0NKWJ?=
 =?us-ascii?Q?xywIpzwf9uN2efvODOpwQKWLHyZxzGW8x8XhHZAv+Fl6LoNag9X0oxtprYYu?=
 =?us-ascii?Q?+gDcjT94/AGRe/L4a1Y8/2S4WcR3fDVDWzaZameCb6BhpyYH5vWjqbQHvm9y?=
 =?us-ascii?Q?Ys6ZQI5UAHTmUU71SiA1+QhB3kCV2wQNQ9Nc535g6DDWs7fqYcxNu3pOQj/f?=
 =?us-ascii?Q?sy8DFTXWmIpSnWU46528ImbBpxrtle5jfgGrpMIYYEJhls5WFx6biwd5Lx09?=
 =?us-ascii?Q?KYRoQJfVlqlihfOr65obQextDawInYw9/qQrA/lnJ5xK4RUrMARlmbit/QpJ?=
 =?us-ascii?Q?pu6mHeZRc7vGrLknuNeEjDtHCHMC33wk8Lfp/xsKohNPI+wdDRO2IAM8vXHm?=
 =?us-ascii?Q?1YV9yJSJ5b1/mc5Z++ohML641b8cBB66ZKWcnA7Qs2xwTYpLFK/rini/2mS3?=
 =?us-ascii?Q?+wpVsCex8shTRip1ZcNC7mNrIi/oIesGKtM75h3rAjEB2MWgLY7tjuUfj/0q?=
 =?us-ascii?Q?APaYu5jemYYs4SNyjewYY1PL0qqMEsgLCaS+qLv7WCE+GbWASmgpfaxgCrlS?=
 =?us-ascii?Q?YkkZwMpU+h/n722mRZpFR5ONh/Da+fS80fBd/J29yK34qOFrjf9i2TXGse6o?=
 =?us-ascii?Q?3GAzl/6PCBsxVj0wFUF1rF8o0FYKzPxSw9eDlM50KlcVQt5fBqqk/R9Q3ZT+?=
 =?us-ascii?Q?T7l2e/f4+kZKHwCM+13ywUwp6b+iTBTpNkH6Ldy/c6+YLRQ2P/UrSGiGiWJt?=
 =?us-ascii?Q?wOqvZ3R19dC5hyKKoUl5eyPXVqHS999u3GZgKI6jD/OS3L0dp1MWaXr55Xg3?=
 =?us-ascii?Q?FjZhZsogebR7UlIYNS2MAqfLPXxiiceyAgHzUOPF5Lhyk5CgClIxgYpuy5TI?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c52f20c-307c-440d-8e9d-08dcad7ade54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 13:57:20.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSJucd2gEBiXtq0gY7Utp72N5emOlDBZCBbW63CKiHpvMZHVZ06xVmHi95SgOwUd6XpcLU1nRnF0a0DrKqB3kXwccwp9Hu3ivoRITU8aT24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
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

On Thu, Jul 25, 2024 at 06:26:08PM GMT, Daniele Ceraolo Spurio wrote:
>Now that we have the binaries ready to go to linux-firmware, we can
>remove the pre-release definitions as a prep step to add the final
>defines in drm-xe-next.
>
>Note that this patch is meant to be squashed with the patch in
>xe-for-CI that adds the definitions
>("drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"). We
>can't just drop that patch because we want to keep the PVC FW def.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

while applying it, can you reword the commit message so the remaining
commit is just about PVC?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 6b92255a769d..c0ff44e0b0ea 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,8 +105,7 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
>-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
>+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>-- 
>2.43.0
>
