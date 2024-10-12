Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BF9D1A42C
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82C10E12D;
	Sat, 12 Oct 2024 02:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoXcvGf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5459010E12D
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728701902; x=1760237902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tXAKiDDy+BLZKwMpLgTV9yEmzW7nim3xufxPhZV3Rds=;
 b=OoXcvGf3IW7AJaq5f0hkFWuyDfgZFmxSwsZlEwjDLgqGRrhv/zYt0utW
 X9DTb6d2gnRiEpFTcibgibdLb5oeLx+hXjsyIWcBHnifaV1XXgGOy8raK
 Lxt6aAKoSBmye91ulxyOembfaQboeceo+axFgKkSpqTMRpSivEpA2+P0T
 R+QN3UWIK/mA8gQHKjLdFdWrU2aBN21x7BhGwzQ0E+UqV/RUN6JIAmAbI
 lWcgZCo9hWgFFs4P8zoyvkW/yd4h2bMQqau3uw8B73vqFIVOBm4PKmquI
 fiOQOoNPpOMgunJlVHIbU0/6U4kEVBuALQvyB7ASg+YSyZxQldtxmNigM g==;
X-CSE-ConnectionGUID: vfLC6UCdTBWsRAdVUWQXWg==
X-CSE-MsgGUID: hsVEsV05SNa18/XvnlZoXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38686735"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38686735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:58:21 -0700
X-CSE-ConnectionGUID: 6uL3Gl6rQdek2A+lOw9RcA==
X-CSE-MsgGUID: 1iXSu95UQbqta0e6wKpsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="114540132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:58:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:58:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:58:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:58:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1QYYqVeEXRJo1We3IPIMTK9Weh4VdiU6eA78xh8rmsfmmh84LeNXqz7slPoZD1pAbuuh9ZK76uuhRZM36LHf8CxUkWKW2wOBynmeLs2Ga8/miSeuyMiiTR0+jysUGLhsVfslZwrwCsNzEDQF0Fe3TXMMw33YlrmDvQEww8J2VIXK9r4BP87nzFNeP5wnI53K8IRm1XhppW1MQv1yHlPXTORDyhDotYOvBpoZeg2Fg8PEeVvPaDWJE5eqWGJS6JZuXnyXmEu++FRMTyzwxXrL+QlfE19Ol3ejFOanG1UArOvVLk859GbiiNfarEj9b5dMiGMgI5WZe8ANt7s/iz+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhOv5j5cVc1GwqZr/qHNNMThAehImssiU84JIiHIpK8=;
 b=yOn+xERuBwGemblOAzvTih/SGGC3lVihxTA0ClUlmdYUVkysvaH8yl0TIocR5RaUF3ds1w27kU/xlTTJgKF1R8HO7tA2o1yPmA2ay7dwzJkA0QsqovUFAK70sM+AeB9VX7UODcJdaI/Ef81ZTnE8ZfNp+UXM871GAuR1ES5seVXI8/f1KZCJwQgRhUc78vS5KMyOTqnSZNEuL/7v4lUxHmSiS2adSKZGYlTEv0aqNfsQzjWOm1NaF/13MchDMHqH8wAC2xoVfEcOL9x5K3n04szCWTcN/mBLje/PpxEQYMUI+bE113YCbH62ex11j6hd43akFkm9+QAZuRU6PffWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sat, 12 Oct
 2024 02:58:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:58:17 +0000
Date: Fri, 11 Oct 2024 21:58:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Clint Taylor <clinton.a.taylor@intel.com>
Subject: Re: [PATCH topic/xe-for-ci] drm/xe/ptl: Add GuC firmware definition
Message-ID: <ctp36giso2dqutyhnqwsr6im2lwyvgh3jvzel7p7fh6pmw4x27@z3xnizpxofcf>
References: <20241011163920.7926-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241011163920.7926-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 71eefa3c-9a45-4926-71b7-08dcea69b8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JFvdWPREiBL6ALCZozLl1dZ8dQSPssuOWPAmIvfK/2mP7hD/PY42FSDNiuYe?=
 =?us-ascii?Q?CWnW6h7CCqH1bpUT5w84W7My9iUib4MCeF1Nnn6KTe+WcT7ecKSui9ZrUB59?=
 =?us-ascii?Q?ry0GJadisv/Y33Tp8aca4atI5gNqijSS6xL7T0Y+3WVh33p0OwfZ4rzflzCU?=
 =?us-ascii?Q?9vxN0MkwWJLLJNeL/ErfAZ7Adb2kmPWSIdMmcQcxrhrJ2EIGu+DaMWacUiiv?=
 =?us-ascii?Q?YKiLwPrKvPK2S9tFkYfZNOzjaiOQmoO2tdROR9V+c/ZUdJn1LT9tV19n1Oag?=
 =?us-ascii?Q?/z+zo0KLkBR9vpec8qvUnr2eU9Wqz8Hd+wOfZlwTEBKxcKnVSOfLVaXgaero?=
 =?us-ascii?Q?nCV9x8ljbfaQmT6HZfa6I5Nb+UM37vgMbZ3wED9ATz6BzOE2p1z28WH7SxWD?=
 =?us-ascii?Q?BujPKAG/pQow6ED8Br5xW/oloHBFHHPos722PPWdlbRU2PI5xRvL0vYgWVU6?=
 =?us-ascii?Q?0nrkBv0qK3Ex4u7/5RdtKqIA3TXj56lhRDf2YFSR6pYJEihO0n9SM4aIOq7n?=
 =?us-ascii?Q?fQUkRaD/EWoDWfP9yVTiGKiQ5mOnh7uMvx2Lk6KVKCh5QNSsPwv6zXCgzjj9?=
 =?us-ascii?Q?omG3K5BYZmBBPvv5i74KdYw+OyQ5OosDA6H+eM74lXZNBSR7P5pJogO8K0b7?=
 =?us-ascii?Q?vHCYruoZ+BxvDOSUumHR5UzjnRowgpaQdcLkXY0kchSJWnUctFFJ/9L4hcJw?=
 =?us-ascii?Q?6nl6PuV4PV5F7vjTvyWIuOH32Wzuch4qX2+HBodG7fLfjRwRFl2pu8q+/ikC?=
 =?us-ascii?Q?EWuH90RoqYnsY/IMayiSET1lyf3OJJJhel/dq4gk6Kfxt4kcMgADkG9Yzx9p?=
 =?us-ascii?Q?zGZ9B/UATMgFWUYeOQiZ2/6DoYH9f2n15wf4RldfUtIBWOVLwy1h30/fJ0Vp?=
 =?us-ascii?Q?01tVVnOHitBllfDB8KKncoHOv7WkJpvebPi802lgrg2oUmpOVTWLheZ9n9ub?=
 =?us-ascii?Q?z3iQNxyrW9JCLXDL9q3H4bRI4fxKDNRKU0jClh5loAKnSc592qiwU5ZzeEZq?=
 =?us-ascii?Q?A3c1I6hoNgPd0N4OF6EP3gpZPjFSVL2w2C1/avN0k1gYd6yvoCy4RU9edkL9?=
 =?us-ascii?Q?jzL71pv/T/uNK+K9KOSIvNnLoKoVPpiweYnoqQHSG7NPFw4GnBNOZv4LSiFJ?=
 =?us-ascii?Q?EJosebfFMg0v17ZubLS0zwj2BHPAmlZHI+yDd6Gyskgjsh0ty+phW6sVqNLH?=
 =?us-ascii?Q?hbLhIH2Y+KCv7+iwAQrbBQf6f0N87MWmaBEfXgFOcZXOAx35Pz78EBpWKuOw?=
 =?us-ascii?Q?AyqojfupI1CzxPc0j8pJQz+zQte21UpIdSjsZfbtmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kA81PVDo9/m1eEboiYU+KV7QQD3BlJyH7b8NZAT2XbA4Ry5LlIo7S/gFLfeC?=
 =?us-ascii?Q?TFQy4moKpIouRZZh3jDdsmEIGo2g/zoSJ+4BZzw6Vw0G21MINl+zm4Vp+si/?=
 =?us-ascii?Q?jbyb7hycusyBoqN6qz+euXqeaxqlsgmr78RnqjOE/3c3OOd32IdG9Ygha3H/?=
 =?us-ascii?Q?IdTx4+vPbwfC4f1dvDvy86RLsQ1RLPH68qZ0Rn/XffP1JEYQtTq7V2y5YGDI?=
 =?us-ascii?Q?cPaV8xou5b1QohSCYAUIJHl4UvGbpNbjvUxhCUlGQOPP0/we/j+153QDSf3B?=
 =?us-ascii?Q?KxMSBtzBG1xn5Aj+sT2Pz+mDQyQjc2YMVa+xhKUosGLuNzbKkzbKtXNjXaps?=
 =?us-ascii?Q?zLQCpJaUzKR1JHIQuxseWi+CkN/2KEEdaa74EXLZ7cud/3HMEBs+POW/B6R+?=
 =?us-ascii?Q?gJMJMJjfx4l/tFZyBXwgt9idNxrrFZj3yNS8f/8o4IqoFs4Rphp01NOxCCpf?=
 =?us-ascii?Q?jN5CAHw5LJNBQ4F2Pm8poIkSxnmL6ibDu8Y7WWpblZWENtRVJQ533yVWweK8?=
 =?us-ascii?Q?wj1Kzn8wod2DcYI8d8RLGfkOC13mwkRpR/8I7SkIAs5rDS20Hv1t96FCgy3l?=
 =?us-ascii?Q?UE0JIaco1XionxTIqOstd9YAypvJ8pzno/aiII2mn5sa8z9aGdwOJD0oYS4A?=
 =?us-ascii?Q?FtqiE6sS58J6Vf+xtws+3HiWRMmIFaSDdGVjR2x7j8G/t/kmqoTMDoFj4AfX?=
 =?us-ascii?Q?WWPLiGXLt2F+9xgMmxF+3wO2ZZG+dtiNpWQd+lDebeIuImLHjgRyL0KnJN32?=
 =?us-ascii?Q?68bNc6ki7ol1W2ixnwzBkviBq1622Y5Yy7Iim9GFSawjHO7qPFWno+A/ymLv?=
 =?us-ascii?Q?lRmeaBaPV5wiHYgX2GJLaoO2kJe37Fw300govhWb3iECMIHtZSrS5sMOA2Fw?=
 =?us-ascii?Q?9oBK10rc3LZ8ZX7Rbm1NIiI1IN2wN4DqxQBNmUK8L8ufZfn+jL7MpdLiYldv?=
 =?us-ascii?Q?K7tV++5849Ggvy5gviuKOsVVrKOnfTcZjee5VmXigTaDLOe/y1LYxsSIkFaP?=
 =?us-ascii?Q?aL0SC8zUo9DXsO9kqkRHDf+vE1vUyUR0ZOjUi+SPnJjQxt/SvnIzgtxo6yvW?=
 =?us-ascii?Q?N9v6HpMhF5S5q5uIzmbTdpXOIJoqSl04UxNJmt7xc0Nnm68zOxhVEA8ceLJW?=
 =?us-ascii?Q?k4dBYrtFSo7JfN9jh1aSp7gV8SFu/gR4YWV7mThHXD3beZmg2Ra0EEwqKDJW?=
 =?us-ascii?Q?MEKFNqWRzVppl7uFkvwAo4fO9bn1zXHpmfVjx/dIosKBkEc3pTudiQ2fry6z?=
 =?us-ascii?Q?tnM03AsIhreoYamALTKwu5xiqD0gdyIxF1Tvcu9A/oJ74XGBoXHv9FvNtooB?=
 =?us-ascii?Q?el/Vc9PIEHUt6yzMRzXowbx4ugDaIFbjaWaLz0xre0U+otQSVsyq1mfpqOGV?=
 =?us-ascii?Q?rzKkqqeIBbthGqw3iK4r11L+JKAZj/hdZTaTYa5Gg7fWCiH1UJe+rf7J1Cxs?=
 =?us-ascii?Q?FpCBk/bKBEy0m5SHAj1Eu5X4ReD3ajHXR5Nlkdx9PM27JIczsksM/U+tZY6t?=
 =?us-ascii?Q?Aotw1NU5Eq0p4VMeddx2h8UBCXh69W6AFSX9iOvuHVqYUXTeyoDz0KL2LqIZ?=
 =?us-ascii?Q?Ru/pBVHZq98EuyTacTpJKu7s08omrzEJYjnpsZUoxiu2NH/Xl2SJ27lNASq+?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eefa3c-9a45-4926-71b7-08dcea69b8ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:58:17.5667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwsD4XhoNVXbnbGS/K+Lxuh3Rh0NJIJqZH8csO2TJsUZdJBGyV6RGZ8VqoEwMaIIyzVgEYWCLLGldz4+xHyRbTmbjtaBC+e5hs7lZx9bkSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

On Fri, Oct 11, 2024 at 09:39:20AM -0700, Matt Atwood wrote:
>From: Clint Taylor <clinton.a.taylor@intel.com>
>
>Define the GuC firmware to load on the platform.
>
>Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

+John

We can't apply this until the firmware is available at
https://gitlab.com/kernel-firmware/drm-firmware/-/tree/intel-staging?ref_type=heads

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 087fb96f707e..555ba12e0304 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -107,6 +107,7 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
> 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>-- 
>2.45.0
>
