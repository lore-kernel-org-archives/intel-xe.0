Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8FAF483E6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 19:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AC110E44E;
	Mon, 23 Mar 2026 19:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aymHZeJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071710E44B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774293078; x=1805829078;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=RBqMjZAtqWxNGGsPl2dciQUOiaBZCuPB6dn10nqGan0=;
 b=aymHZeJfyjtM5pPUObeYZALaennP7SPQgKAutVr0dnMfm1rdB7mIPhfb
 0tfBbbypZ14m9hlK8i15EFWnBzxtGKtVa0Z8C8j2LJNEfE/XEjya0IsP5
 VpfmATvaZdVXeED4njjJuhtwf4hWkINcAsvxhyPPQlFnrawTiQ1iqgQY5
 y+OjIG/mw/Zo815ueVazGq+4N6x2B+nmJXMsniPc1aY9LjRcWRvnGeL/q
 gyfN2UYN9CYXcD4XJz4uwcW/QGW/EjK5DgzA7Yfj3mrnMKwQpd+fy96Kr
 f8liySTER/X3rgm6dUhHXo+gQVjp5khq0z/00p0NIhU0tKliETkpCwkgf Q==;
X-CSE-ConnectionGUID: gEcIxUCvToK/AGlJGQnA+Q==
X-CSE-MsgGUID: cd2qSB7oRpOK8BFbLlU3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74481491"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="74481491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:11:17 -0700
X-CSE-ConnectionGUID: ITzM1s0oSqmSxUyqdJnjRw==
X-CSE-MsgGUID: S34VIw4YR+iyzBNcpjfzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228849545"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:11:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:11:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 12:11:16 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:11:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YETWszX4YuKFaAXzl46tRpNjKieruqo+jGkEd+Fn8Yb7IGlSILxl+J0nOlC/3GlkA6fksX2Ng9Yjt/KElj5k5Qe5NZSfKNUgNYMtyDFBtYsTDDJu5GvVopfaLEhwT2sjHt9WirOnstVjEY0/UTn0TyGrvTX+1cg0pTuzoesJuXtZc0P+odB+ALhHwjL2NcaJoZthPHEy+xSfu4CdY0/z+GhpJEUc6SXePNivKuKHrTHo3DpnvItPvsyih7AcRrn7QffZx+6wZO0PsVi8l1JKrmSFGFNBUAgsQ56rKRkRXysn8WH2EWhLvAgbAqknidMnP0j4EX17H82wAU/J5Al+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbR05Nk7hjnUIW1G0roTCnIaVH46PwiEeBnuduWLAWc=;
 b=Q0M/fhgP8gLSJfHg3WFzKFc3OaX8wcXEIdih5n5HdVTA6Ej3ANwOX0ORTDSWpd/KjbEz9BifVccQnEahq2m/PagL7+bEy/jR7BJGYxdGZZB8OdihPYSw0n95e2NKA2cpjg01h8DXFSMePyVSt1kYCcyjr3F4S+UxbXLJoItRDELDA+PXgXtp8W1NudXD2tsLPuO13IsjQ0u18r1hAeKTEelQ19u7yxBrlz0aUgpsnCmysKZxYpq26koyM9RkbRAuDxH5hNYp+JocWJvWtKJGoxF7Zp/UqnPfVk4dl1YpR5AVYhH2wWcdqq36Yq419EmHYtohpDsOxgk6+EQQVCOFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 19:11:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 19:11:12 +0000
Date: Mon, 23 Mar 2026 12:11:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: Implement recent spec updates to Wa_16025250150
Message-ID: <20260323191109.GA183713@mdroper-desk1.amr.corp.intel.com>
References: <20260319-wa_16025250150_part2-v1-1-46b1de1a31b2@intel.com>
 <177404619302.382002.1567339602993401433@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177404619302.382002.1567339602993401433@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbce098-7f71-4551-e0ad-08de890ff221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: tnpzUhEtUgNXHWqU3DCaDjP1uJDYlq5lc3fBsGdpas02qD2GhjcC/hSHmZeE9gZvAOIyNmV4kZHs+ZxpSLJCkEAsDlTcxn17SIBg4h+yFbJouiEYiQQnJ5fbd+qMZThW03QdBb2IgshuUlKTW5/qIwMmaUqkvFUeRg6bUTHLcb+QI1t81Jn3Ccq2yH1k0XUrYS18Ttkw2ZM45XkpUsL800fabgmeC3IIgO53AAPqSCMULLyWPdlkA/taDyJEK7ZKQFOAYLrCMyC3AxdCPrWgTZ9owGjZvMwxf5mDDGCwvwi9GOqzcS5j5xID3DKbfLa01DkSvqRu018Lb0QWDJ1Jdt/NVOTEjHPVrgXfdqu/tSAs3Jh7aCa5Z5q+FBE4CNELra5jJeGbJm710GCSNqDrD/vYMmFVbeFxOmY50HVMnti6ADPN5uqW9DZcHF0VRYuK1TX8x0r/ucvMTWBqktJoV+ZIlKekaaFBX6vprEkBynGWUSgn/Rnn8p38BgoOYUigc9gNt0ceCdnYdpht6aoBKSMJ1+RWcc9dOmVoDxh5hcCPs8pBebPCtIlRMXUh9EK1H0Czx8hFIb8U7xwFCBdV8HGUEnuPLZcfJCYFgxKsubaM1eN4FQyKHa53nGKmDphMxz5P5/OqYuho9+NZ33VIgLbVEEzfR3N5+3Ez6UNem1tRDGMxwA4BYuYUTHJy7sKJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20Q2EcZ52HnTyjJt2Cpt8JOVeEZB7qS8lm42TGm0jhNYO6WhfBBOw8jLm7r1?=
 =?us-ascii?Q?oNcAWL/ENx9CtsWdHXwlOWQ7qVc3ah3rudxAnIJFlQgFax7fcCzPpSM+MHYZ?=
 =?us-ascii?Q?9sf7FFh5e38+TkmyI4beAW9eJxDGmHjcqRh5RuQZmrbpXEoG1lOxzNzslCZy?=
 =?us-ascii?Q?zLoDYyrzbj4dstGAPDa+l11P9LifWBgV4BY1lTNpALU/bbEUJy4t3ZldHUXR?=
 =?us-ascii?Q?WtnMHaIbNCLY20HBH2lrxLSf6FHAfFFJtpsnBpaXtWVAVa08LBJJJLUAWpSl?=
 =?us-ascii?Q?TwGERtTx06StwY1ukweOpZc8BVyx6MOOKb6t+szQC5iCVgMuB/T5hEmWOaci?=
 =?us-ascii?Q?i67/g2lgO8GkXwim4vrZJA9chzZPG22scqTdXdOsO8bHH49eVtzyPnycPTnQ?=
 =?us-ascii?Q?OmZGz0mHPJ06c4ZxVOnRD9QJaCcqW9kD1ekV+MN3MjF5XjwPPMcVM8sPnBCs?=
 =?us-ascii?Q?ZBBj7wArDgtqsnsgb62FXUdJdMyttAwKImQBa1cCFgkGBKQiFp8K3kPLn3iH?=
 =?us-ascii?Q?rsU3s9tUtxO9JyvyxiGRt9rDCrDmqb8NpwVGgv2fGLH2TuDiaob0a8w+y5TF?=
 =?us-ascii?Q?8GhUY/QST6hwzFRNhZzwdumZwxW8MjZmZThORtWJsqEPfVDVV3N+I27ofalg?=
 =?us-ascii?Q?sObrxoMR2fPChMDKT6N3F0rAdi9ANQl/TY4IMqsRSmbhpb2Mldbu6mLcCW3W?=
 =?us-ascii?Q?A63ZrOU2YtAJGZDewyC1jRQlXQnm61WmX1RZeB9nCSSKcMDOR0tGedVykMy8?=
 =?us-ascii?Q?4GxY45D7qWj7e5YzyTT0v07ywsTVtTXpPR0mEFZcoIvE2BFZyN6bbDS5NA+z?=
 =?us-ascii?Q?0XExlY9LaiY2m9ivk6UWSOLoq5N5OGxHneucEx/rzVE+m4EdAA4krV6ztZUh?=
 =?us-ascii?Q?8QDPOwwTdSkIEzWPfuCqSms+wj1Ar6XFj420TJ6ijys3ih71GjqfqVG9zOl6?=
 =?us-ascii?Q?tUf7TKQFiQLcCvwci0fmo+QVQ6oqfNQR4j2xYqUtdNfbNzKxlhfEwmuhdqxL?=
 =?us-ascii?Q?U5OjjLQ+HnhQCJNy3BQCdHaRxUK5RhunOYJ0enyjnZLZMP4G+xKw5IDuC/fi?=
 =?us-ascii?Q?EgtpS1xXgWlXTq7YiaxYNeQwQxd9W3xtP3UtmOsXBXuFs/ho9LtKr0pNbQKS?=
 =?us-ascii?Q?764/BKfHlvIA2wLKvmAxBNI2WEEDEVi26jnKwhwK5nkhHh9LkS0wVWzDnZUy?=
 =?us-ascii?Q?UF5o4pr2RDJKm4Qv77fbLTCdz12yTYMMcaS0V/1aeAVrpmGvXiVHk4svx6Iv?=
 =?us-ascii?Q?R+w9V+3R42VGRQJRZR22w3EVFUnZgd0tMGt4Lng4w7UpUbSEEK1lL4Ln8ccH?=
 =?us-ascii?Q?AXrblWx6Q88jplG0yIGfjLoxtVgfdUkeVwDzqCq2YYdMK3n8AVQdIF5YQ/S4?=
 =?us-ascii?Q?uRYfqleg5jBVwkhfa6Gs/PyeZDJMY7oKkraby1wOIB5szLredbeGH0/jqFuu?=
 =?us-ascii?Q?pBxk6OgDuxz4I4Wk4YHiHYs7puqiRep64gyzJSgLFBCCC3OJ+G2pVYA0cuu4?=
 =?us-ascii?Q?X8XPDK3h8r+hz7Xl6n0cxJQ9EuL3ygDBv/2RWyyNmckrT63Vc+t1Q+9rHt2/?=
 =?us-ascii?Q?yF9sgiekUxoPKCe+4Czkx80GRyfVhXHwqZIGQZX0+lc9h9f6pwizQhJ/BkkM?=
 =?us-ascii?Q?Jh9QB3jr+1BPhWA5o+FFu4l7OekkP+DXuQrcCQQR6XY7aBiViV1l0FB4WhOg?=
 =?us-ascii?Q?8R3QqxyRVwjD7XJGgSgqpny0AsU3/Gw9d31wdzePgL9yX1L66qSOGR9mwGJn?=
 =?us-ascii?Q?3VgrHdWAmvjk9+zmSntN/bHj8QZib1o=3D?=
X-Exchange-RoutingPolicyChecked: au4/5mqbSS5Kp5t9/rQdgydH9KtvAQN94zgECao7cg12li6tVFvmBhlaJG/jsLnwh90FvT28+T8sl+/9vXpUA54c5M2kaS9FJLVCRDwzQGlsxEI3+FVqk+JIE17D+fIhd05LiBiaWpKpe24VxGdeLd2S/6aD2TV8cW2r5+1+D1krST0f1azc+TPgWwEh/Vo9m6KU/E5TX7c5SczNl5sSMYONIDxYhizKjTZz5V5uBo/+NdMaKJlmNHJSEVPK7AXLgEkg6R+T3s1eQMxfu1XC8etxe0lzf3o2HKh3aYaAIa/hdOeDatUvQuqpeMaT4C3DqMBC+jW4FpvGX0hsj5FfPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbce098-7f71-4551-e0ad-08de890ff221
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:11:11.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZm2y4IK/djqS1m9/ec4cZyJsarvK/INe7/miqt+wt1Mhoer3K1eLItm8W0fTYWVaWdqjriMwQikZb9zTJ8RD9ljTIlM2QYyVdVtxKJVAbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
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

On Fri, Mar 20, 2026 at 10:36:33PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Implement recent spec updates to Wa_16025250150
> URL   : https://patchwork.freedesktop.org/series/163549/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354_FULL -> xe-pw-163549v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-163549v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-163549v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-163549v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3321

> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4537


Applied to drm-xe-next.  Thanks MattA for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-163549v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +8 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7621])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367] / [Intel XE#7354])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652]) +8 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +10 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +8 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#6974])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#6747]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x256.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2291]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2286] / [Intel XE#6035])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4354] / [Intel XE#5882])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2244]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4156] / [Intel XE#7425])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2374] / [Intel XE#6127])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2316])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2316]) +10 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-10/igt@kms_flip@2x-nonexisting-fb.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#7545])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#301]) +1 other test fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][39] -> [INCOMPLETE][40] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1397] / [Intel XE#7385])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +22 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4141]) +14 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6312] / [Intel XE#651])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2312]) +7 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2313]) +20 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2352] / [Intel XE#7399])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#656]) +7 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#1503]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1503])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6901])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#7086])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2486]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7283]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2393])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2392] / [Intel XE#6927])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#4608])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4608] / [Intel XE#7304])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1489]) +5 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2387] / [Intel XE#7429])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1406])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1127] / [Intel XE#5813])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#3904] / [Intel XE#7342])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_sharpness_filter@filter-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6503])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_sharpness_filter@filter-formats.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2450] / [Intel XE#5857])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1499]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1499])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-2/igt@kms_vrr@negative-basic.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_eudebug@basic-vm-bind-vm-destroy:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4837]) +7 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4837])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6540] / [Intel XE#688])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][83] -> [INCOMPLETE][84] ([Intel XE#6321])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#7482]) +3 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7136]) +10 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7136]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6874]) +4 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6874]) +22 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7138])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#7138]) +7 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-bmg:          [PASS][93] -> [ABORT][94] ([Intel XE#7578])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2229])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#6964]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#6964])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#1420])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2236])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#584] / [Intel XE#7369])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-lnl-7/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2284] / [Intel XE#7370])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#944])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-bmg:          [SKIP][106] ([Intel XE#2320]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][108] ([Intel XE#2291]) -> [PASS][109] +4 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][110] ([Intel XE#4302]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][112] ([Intel XE#4294]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [SKIP][114] ([Intel XE#2316]) -> [PASS][115] +5 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@absolute-wf_vblank@b-dp2:
>     - shard-bmg:          [FAIL][116] -> [PASS][117] +6 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-6/igt@kms_flip@absolute-wf_vblank@b-dp2.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_flip@absolute-wf_vblank@b-dp2.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [SKIP][118] ([Intel XE#1503]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_hdr@static-toggle.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][120] ([Intel XE#4596]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-bmg:          [SKIP][122] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][124] ([Intel XE#1435]) -> [PASS][125] +1 other test pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_configfs@ctx-restore-mid-bb-invalid:
>     - shard-bmg:          [ABORT][126] ([Intel XE#7578]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-4/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][128] ([Intel XE#6321]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][130] ([Intel XE#7621]) -> [SKIP][131] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-bmg:          [SKIP][132] ([Intel XE#7194]) -> [FAIL][133] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][134] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][135] ([Intel XE#2341])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-9/igt@kms_content_protection@legacy.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-bmg:          [FAIL][136] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][137] ([Intel XE#7194])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2312]) -> [SKIP][139] ([Intel XE#4141]) +5 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][140] ([Intel XE#4141]) -> [SKIP][141] ([Intel XE#2312]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2311]) -> [SKIP][143] ([Intel XE#2312]) +16 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][144] ([Intel XE#2312]) -> [SKIP][145] ([Intel XE#2311]) +14 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][146] ([Intel XE#2312]) -> [SKIP][147] ([Intel XE#2313]) +13 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2313]) -> [SKIP][149] ([Intel XE#2312]) +16 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][150] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][151] ([Intel XE#3544])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          [SKIP][152] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][153] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +5 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][155] ([Intel XE#2426] / [Intel XE#5848])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545
>   [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
>   [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354 -> xe-pw-163549v1
> 
>   IGT_8811: cc3169e72592a56b806ce54a87060519151ad5fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4748-242f4d8af4c4708eabb93e79949d45caec8d4354: 242f4d8af4c4708eabb93e79949d45caec8d4354
>   xe-pw-163549v1: 163549v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163549v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
