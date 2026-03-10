Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC857FD88C3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778F610E795;
	Tue, 10 Mar 2026 22:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3bJt3i3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4649410E79B;
 Tue, 10 Mar 2026 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773180571; x=1804716571;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/WbhlSOfbUiKMrJ2Dh8hePlmttvqpGCch+2mvrmHwck=;
 b=X3bJt3i3kEAQ3qRvI7xlI8meNsAEPRUycoHL4z9tEyt5s+RdHyrJyCek
 tyVRDcMULr+mp9XM+TwAyzuPjzKHTtirH6wAFj3wmyzqw6ld04Tuk6PUS
 CBha8GQ7ej2Yg9axTtU9nDjtdnBcKcd72J7xxQpm3bThwADjUam2han9D
 8XaKOay63YETWSDh6H9gw7lO4xdRXkkYr+6E3PqjUrvmJZHZhkvHLeV3z
 DfiNr9BleQvXEpTa1X0W2ZNh5YGQwsD3jb7Lwis8xET64Rq0l0vIAtjh9
 UG28MCtWYyt+XfukL+s7wH1khQ1rDNidTk+9urmbl5Y6ViPwWyM8U03uN Q==;
X-CSE-ConnectionGUID: /SehC1LCQjGqX+2/eTQiaQ==
X-CSE-MsgGUID: fyka7RJBR2KqyQQXSxs5Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85717127"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85717127"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:09:31 -0700
X-CSE-ConnectionGUID: 2WXwc/YVR6K0iBGTCzw7ig==
X-CSE-MsgGUID: BQ8QbCV1TZ+YtO/LhW/X6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224947875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:09:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 15:09:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 15:09:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 15:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQwg0L0xgdT0kHd2OCxNV98jkKk+VAKgbZhqGXN9lHDnHuqndbI6Kj8dkL4ttl2tjLgla2R0JISdrFreiX5UIvL9iTFiNzVVchKkraqY+QbXLQq2XDgRm5TmAmT+LPcr4PhoYEODNdMLHnV5ctUTHaWhFqG6k1Z1crk2/p2Rvoa2UWtXsjEY/sCkqVrtCB1QLc1MbnBlu0eI7XNJxEfQ9965TnRigRElveMYk/FtC0mp0wraijnmL5rAlpONIYxtlg4JOJsMb3ZE6VIwrS/D9eNYHagFLQuL+QOs28hbrxuRd4NgNJsUTen+Yb0nQn74Kv92KPV4PCl3f4/c6uqP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=168mhVSD1kQ18pzNf70OivwdgBizanblgVwkzVURV+Y=;
 b=sx67VnotufxEarofC19xXk25aoAa7QGcaRAYRVQu/THh3zP2ALAQ8AMrlStc2aN2o3Y2JrYDu6UW/P7eqi2xVlVP3cJ/3O2yjs52vUCqBmoIprOfc/I+unZRwdUSxonTO0FFjlx8lQ7UoLg+OAvtdF9pG84XYecKAL0KIquGDxLCHW6DFzQIxsTJw1MexxrJFk26CSy7L07oQkGtsGBjYzx8We9noQZ4jmOZAQFyMWfIoENELrvifNAkLIaQa7WH00p4m7USRjLIPfA3ezli80YmVBCV1CqvumwCHVMwyaeKtsqoD31SOeVi6s40VCMwNr9m0xufKQPLnobaKUbUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:09:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:09:26 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for Extra enabling
 patches for NVL-P (rev5)
In-Reply-To: <177312554403.336878.17311247628327327824@a3b018990fe9>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
 <177312554403.336878.17311247628327327824@a3b018990fe9>
Date: Tue, 10 Mar 2026 19:09:22 -0300
Message-ID: <87eclrwd4d.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec437d4-2a9e-4e57-ae01-08de7ef1b193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1aWo7/iklMG5dCu13WzmAbO02t/3hcHGiH1RI5kL9sbKx4eg52BbMAf1v0JM3n8XWo/hnuPB+Ln5tEFhKDIDOOhCdnilGn7W96yXNfDuaO3e6hVZs/l6XGbjP+GPmtuxvkLsUM0xu22AiWUuHae+HcBPgU8+w42xhDnkMDhQzt7ssiCjxVoiYMYTkw7LH5M/pJ0EtAkx5inadEUFwBqaEKdAVAM8uDyAsl3hykkdfuGYNlH3Iipyc/A9D6CEGha4/hW3rhZIjYXlmpdJIuPP4yFJw3cSO8Ce5pQ8PUMhD2Ul1p3/mTqje23CcJRlnV3sym9XyB68BOGz1WtGjII9XWnu1GAG2jOXUh8KFurBJjUXSQyCExMNh5+4CJJ9GvVUJFbJAN5GPdNk8/P2a3J/D4CxkPjRLjwAfQnsIG2ZUjCEmMqkyxkYGbPh4gawXT903DWxwXQ1LhU9i357NkWohPNlrznZW6zxjQt3xbKSMRiqfTmfa6vrxB92TYerqyZmRXIswlFiVYoo3YFsIkckvmEeaWcNx92kwkKbEMAj48Z8OLMP6imEKz8dLi1+5uIXJwiYGKTL2lmXa17J3kFu+3AWXTG9e1YoywUwX1N6ySuWxYReDiWKK0paXfhf+M6sGd34x8TrbOeCzhm41klFhqj3Sw2yOEmJAf6GtHRz/THj+tHepEFFwAQo96sXd0Qe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZYsAMHQwm97HyvlFg7wfr6vUuf2NTIZz60aBy46u5B6ZMrQfxRKPI5WRudg?=
 =?us-ascii?Q?puJNYukWYZWBkNMKazVl1d1Wo8IJFiHiQX1ojQ8GoUDrY4T0nrczSaqfM0HL?=
 =?us-ascii?Q?pRDyNCuo29dY1yhya6Xxq5e4JqHWZIq86Q2f2XFcNgUsu/qJRhdIGUT1ZUlS?=
 =?us-ascii?Q?sh4ytkoJ4LU0HTa/QG9guGiJajyxFGBDzpvq6n6/I7siBEkIRgw0bKXNZjRW?=
 =?us-ascii?Q?kau9HC3NwKPAckHF7scKAoW6mBMyjahyEfbh5s7DNuBSOdzMgN3on4XXZQkg?=
 =?us-ascii?Q?jLaIaNp5gKQSIKLPSmKaN8zeBNppVJvLfFA2xmAWQeCw+YLgiY3Cma94e4dm?=
 =?us-ascii?Q?QKuQfm7R6m7ESB+ayT34P8tyMXJjpigjlYbWlksWMP6Xut+T/zlwZB8OA0/1?=
 =?us-ascii?Q?CYrt7vOalPyK9nr5ms5nlcn+NH9Ewm0diQu+HYuCO1PuiBMRxWPKbLE1ohaf?=
 =?us-ascii?Q?q1xI++zmV8v9qsbAJh+Kq9Abvv1hxzP9oLf8k+Kv6WxbMWU8I7zNEBD0jEEi?=
 =?us-ascii?Q?R8hDC8yDQw7+oto03kjIr5PLqa/UG0g3LNFCx8lEjNOhoKb037tOHcThkucd?=
 =?us-ascii?Q?WbS3E46byZMpCntogubFQRZbvf+b+gMkaKwgmuBo83n2q0dGUGL6BZxhBvm3?=
 =?us-ascii?Q?WX2GQmx97JBS838AIy0N594X8meDu7R5fJRZcJMnNxt1seRsE44l3ghzgrKd?=
 =?us-ascii?Q?zR6/gUJS3iuuDoJ6/1vsyAFwS89Axk/Ywo9yMqzoaAAgI7tMGYWTaC3VPYVm?=
 =?us-ascii?Q?sjjUT8avL+ac4OoyHav3rpJVJp5ETa6Dny0sp+TZxuEhjtYk+UYYshj0gIJ6?=
 =?us-ascii?Q?JvM4EHEiYGNV1qFTnX2xypFNqSx5eb1SJHLfTBNo6FSWC5c/lgYiLKuuKzBr?=
 =?us-ascii?Q?4D1UIKFcpkTBsX6egDN7CgxtuUs7KYHRKSwo/rfIfR666jNoCZ347jgEl1kC?=
 =?us-ascii?Q?DXZiLxW/Fr1WqXO/EV/KcZFiSMcY+KYgq4/Ve5dO8lMgk4qLKYbg6p5WtrZo?=
 =?us-ascii?Q?GPniLaQZuNNFVHXjUWqusulrsC/hSGA9FoCTEXosjAVIRfpxHV89E67PsuVq?=
 =?us-ascii?Q?i+PQr9liegCNRoUCE/6au0XjyR+Hpt/7a53KbiYL+Vob7MfeQmPAkR7G/yoJ?=
 =?us-ascii?Q?zNVTDuKhaEWCcqWvGvKUZMsCISNyDinyN/3yXBVOlKyij70umN+7TO+niEip?=
 =?us-ascii?Q?6WQqLahBwWhXijbn0ece/l2HQt61UdfpQ6Gh4SrZCRsSxRH3H39So0on4lUz?=
 =?us-ascii?Q?JKV6AxyhnSv/Xme6zvnp9YeTJfLkfQYbfIwpu5RWckQB2LDeH1ks7uikF2FE?=
 =?us-ascii?Q?4h9TVef/YSQsRz1EsbPej9KxuxEhKamwFKpuMWjqDsj19FjPs2Ru2a4HAoiL?=
 =?us-ascii?Q?X80LpqSidSfnEsCmsoinMHnweqtRD5N8SwxfmKoxJWzbSBaZxd4+VB1z25kM?=
 =?us-ascii?Q?yEE68bCVCR8nAdLoGNeyLfMVUPpR4e2AQEvFqnSGUC1ipDsKJZLZ0rbUgnYF?=
 =?us-ascii?Q?PLGcfnl4cZY8jRhNjHe9ICWTI6mvHqfTfUarfidoX7W2cDKZ2SRdd4uSapab?=
 =?us-ascii?Q?z4B4pCmAGtQ0t4M38QVBErnPJErpN72v0dC8+9phwraMrpTTXoLNuPBzL82f?=
 =?us-ascii?Q?LVWbjvVAemOxJijSgjhcU4SD2R/5aTENlFQg/yGSLlZlhHsGYN2JnF31I0P+?=
 =?us-ascii?Q?DVp6bceQZEwDYg3+NK+P5l4/B25wyVRNRE4vBo6i+parOycafJX8vQ1GUUsj?=
 =?us-ascii?Q?mtLRaUb0Cg=3D=3D?=
X-Exchange-RoutingPolicyChecked: vMaFYp4OJpIifCNgC39XHuv84JwBH0IK6kmAwj0tKyk80z0mze4BxVshjiunOkCRhwxOOxbXOxvnpZ2U8Jtk7PCg5nxHz60QBSuqEQ0hIaiRrwJfb4+a/I9tgDOJGYBu8YGu9G+4cNx5+XsLhcf1PFo9Kn/i1GnXzMwDlS1dQtVW81QMq4uTOKq1GSmyCLGPhG2DL+g2lF4IESbfpoFhpz9KGoRrwW3UU+ipDcpypckxACV4TEt9M+NJzihe1Ri3KNIBXZcNX3EtvuGqn0IOg+P2Hq+lyV4dPsbV0LCjCmY5lmsJHRIXSBdSzB1fwRFd+aOQyXqfHcd2aSvsNFRmBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec437d4-2a9e-4e57-ae01-08de7ef1b193
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:09:26.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Z4JExqdSDPYnOPODmG0VA7jP2n/L/zM2r8g6PU6wg+UgVs7IL045OHLFtwZGJ/jw5zDxl+meN0F3SQROBz4Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: Extra enabling patches for NVL-P (rev5)
> URL   : https://patchwork.freedesktop.org/series/162666/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-4684-6fb391baa6059adc4a8e75765a1ebf64868fc1a9_FULL -> xe-pw-162666v5_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-162666v5_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162666v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-162666v5_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128:
>     - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4684-6fb391baa6059adc4a8e75765a1ebf64868fc1a9/shard-bmg-7/igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v5/shard-bmg-2/igt@kms_plane_cursor@primary@pipe-a-dp-2-size-128.html

This "GuC Crash dump notification" erro appears to be a sporadic
issue that has been happening on the shard-bmg-2 machine but not
captured in CBL yet.  Some other examples:

    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@c-dp2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4663-d5f492dbc8c65c78ee639fa06821eeb568c547cb/shard-bmg-2/igt@kms_flip@flip-vs-modeset-vs-hang.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4663-d5f492dbc8c65c78ee639fa06821eeb568c547cb/shard-bmg-2/igt@kms_flip@flip-vs-modeset-vs-hang@a-dp2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4631-eb7d0d7fa26e755dba8653a594563ce027641d69/shard-bmg-2/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4616-98bd1343bd71df415eafe65885b941d96a2c06cf/shard-bmg-2/igt@kms_color@degamma@pipe-c-hdmi-a-3.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4616-98bd1343bd71df415eafe65885b941d96a2c06cf/shard-bmg-2/igt@kms_color@degamma.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4588-cec43d5c2696af219fc2ef71dd7e93db48c80f66/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-dp2-hdmi-a3.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4579-84d640df1ee7e526fd84de4cc1b8bb1e9d391ee1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4568-15658979e64a7c97eaa65563e27a5a65e68a0188/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a-dp-2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/shard-bmg-2/igt@xe_exec_system_allocator@once-large-mmap-new.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4444-412ff4e2efa281effa1f5be5c610838d151380cc/shard-bmg-2/igt@kms_color@ctm-0-25@pipe-c-dp-2.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4444-412ff4e2efa281effa1f5be5c610838d151380cc/shard-bmg-2/igt@kms_color@ctm-0-25.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-prefetch.html
    https://intel-gfx-ci.01.org/tree/intel-xe/xe-4346-d7d19ebd62e1a312e67f4484df9a4e2b407d93d0/shard-bmg-2/igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset.html

This is unrelated to this series.

--
Gustavo Sousa
