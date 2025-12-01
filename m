Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F2DD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBDD89E1D;
	Mon,  1 Dec 2025 16:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ojsgz0xu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4966189CA4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764605719; x=1796141719;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nPSXC5x1Q7M4FezIiv2GQIV/w65pWpBvzPnrjmJztD8=;
 b=Ojsgz0xu7zkg0alyYVGtSdwRkJnrue/FLVB7F7wl/OiSNSm2gwJ4uLqf
 MsBaGWcrF3jZzormObxuuem8qwdVrwG9FYgFXALNxfCrK6dl+z4y0Ol3j
 AHYDm/Fgl2PAw5IuDrdAX/M/+XzH2ZCmPPlXUeJiKAZNs8USZZplwvYt3
 pBPuNXZIaaCMvouNpNkqYtxS+m76t5VLbWDvDkF0EF71Fl1NCblzgnmhy
 tLg4iTnNj2nQx2QX8kqXeWbJ21lOBwuRgxbz3jGnkSp3g6UiGRoyEy+nZ
 A0rVFMnyT4bzhwJDm6Tka+QSjvX8abtUucCluEhCVsTQw4xlZPZU1KS2t g==;
X-CSE-ConnectionGUID: GVkE5tF0REOKejpkKF3j5Q==
X-CSE-MsgGUID: Lo0ZKve/RQOz3o6Y/GYo0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66443393"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66443393"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:15:19 -0800
X-CSE-ConnectionGUID: TZFTmzoYR62XY/74tU8PHQ==
X-CSE-MsgGUID: ikXBEh42TbuJ4+PGjygRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="224807109"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:15:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:15:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 08:15:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:15:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhtfP0rooH4keg5VNO7iOoQ/bmOjrGzOD7wtXdok8rAKKElIsPsa5MqUEomPBrrP7Zijv8LffH9l+aYjENxPoIAh50vuLFSZuRU/mporq83GzY0icCoi68IKmj7z7lzVb1iyilY9yvyBwCheq+BJ92NFZTp7x+jrjSoYxxjJ8hdC75hJ9015FFUQDRa0rU8orKNWc0EhHek2WWEVe9zQZDyieJoj38+5OYLq6azs49KdUnV++dR2tsTL67HiFP2KPAynvg+70RsrkJgXBzQDKLtpK3j1hnYFVcaWacrANo871RBANJFhb0cIy5rTOJn1FubStIBIo7nBFAGoEOFHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAHk5B5c90XNytso9dyUzTI+snwtLYF20ONnDZpP3v0=;
 b=UTX5+rWicVZ91IbJBSSvu+AXwP0ngzczBLLo7uDdnKVCKZuhkmMPkGfLp6q7WUhZU26eRNvoEfJz1+LBKGYskrSrbQlXa1AG93mUNumlS+mgyhEWIt0g9LtymCTKRfaun1TKaETldkuN4MODIzZv9RGIDxOm38UiJryUyMBaHxq46NDMTYy/96xejbDVPVSTH4QkXlZjkH15jB39FJWFMNqlSJZnkqoXg5Po1qK6NE95LFHaleLRenoUBPVEneNVs6HycNkWWSu9L2RKdTnGrwncdRmNMPw1I1uNR48iiFL4WcVrtV96OhHQzV93njzI1KRnzLy5mgxbQlCFABYWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:15:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:15:08 +0000
Date: Mon, 1 Dec 2025 08:15:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe3_lpg: Apply Wa_16028005424 (rev2)
Message-ID: <20251201161505.GD4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251121100822.20076-2-balasubramani.vivekanandan@intel.com>
 <176401851223.22750.11515429579950820519@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176401851223.22750.11515429579950820519@a3b018990fe9>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c202a8-4f01-4ce1-53b9-08de30f4cba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I2VvigozxHw4abux88B2Ry572ZRhnK3R7chFkyHPYIkMpEqcYblfsUP/cfXj?=
 =?us-ascii?Q?HwECEc4D7Qn5PUo3OvXSBVT8GqDzaSeuJxp+l3olJoHCwE24LIS4HUctvghI?=
 =?us-ascii?Q?p9oEfKT3fO9tTPJT7OuUsZVa39GjQ6b6ieeNUrqrf/ngQyd2363qHGqFPaTW?=
 =?us-ascii?Q?J9a9u5yICVwI9Tl3Z+gfLp6wobmRxrQ7xWvrUc0qLHLWiK0pI+VjVDbBuYnt?=
 =?us-ascii?Q?SIB+UxE0Q0mEKc9woZKOg+U+SaXWw6TruYRVjI+CpmDpwrjJVsaeoY2xgOIy?=
 =?us-ascii?Q?peoz2n+FOVoCPyoAgWz/J7OBNXEF/fvHaI4QM6IrJd0JU53ep7qcFRSY8Nq1?=
 =?us-ascii?Q?Azl6xHl/sPcLoP+3QGVCSgtmgtNIlkZSo/k+/BXTL42ZwROIg3jCPukbhRpJ?=
 =?us-ascii?Q?u6fdFPWujBt02QDBI/HdyrwQnqvTYCNVEHRi4LAl2weAV6F0qVInBHuqhpff?=
 =?us-ascii?Q?r8L1Ae1KTN4w5ypbyFqvZp5rNagx7VZWUm37awhu1wRH+PC2KZFgBebwPyQx?=
 =?us-ascii?Q?TlY7MDNpAJM3OQ6Bm+u4dyVjLyenVk1WCkiJYDK157kQFl3PljJvTrGlzd9U?=
 =?us-ascii?Q?m8KOVhg0VinDxB/Rk46kAGhK7eGTt837RXXoRS6ZWLI2NXWvB5w2Z7231zJC?=
 =?us-ascii?Q?7I5iOkE6S0Q718QRvkkqx1ML01fYiUJiwMUpjol+YyfVoBsXaajgIXk7iIPZ?=
 =?us-ascii?Q?kCT0yXmfgFhCunEsYrFr1BklCeqOfRNJi976lMtGO+J8CBTO9eOoqvoXEMzg?=
 =?us-ascii?Q?ZRYMpAnbYgRMWUSLtLdYZQx3AOi6SCCh3H673Pmgs5Y2A+FfJTaCvTAmGS9P?=
 =?us-ascii?Q?AzQ7rMpE3UW4m/5sWkFdNqnHf5aVrjrQaOsDa+feByQjyK+48iYQsRqZJkxg?=
 =?us-ascii?Q?eFDf5eqCc86N7S3EyIKYRA9GgSZwq/j85LEBHCcXamwroprvxhci1RhqmcBw?=
 =?us-ascii?Q?drxnS/2SEBcYgRWVGjm8g3Ycy7mwmJmp/dgYOY4bYA/GmgCwyBU7t4mj5ao+?=
 =?us-ascii?Q?otL26tIpUcwjgHddsq3vel9fIVz5qXddhsbsYRnRCj+zViMVF0DzpyTd2XFV?=
 =?us-ascii?Q?7bl+SxdZ7rpqSnOD97OB2IeEaz7mIz4sC9+xqFc0SwUhCTS2T/jKlrAVrY1h?=
 =?us-ascii?Q?3EPQ2W3CR7mtLPaoXXbRF9CD7S//2UYmk8XhEXnW3/0iiJdDNIjZeNZTlTh+?=
 =?us-ascii?Q?R+HdGaBISP01xlnAWis6KheVvO6iPUJrgnB4crzMZzkuLV8+EHKxBdjcDo3d?=
 =?us-ascii?Q?V0diogjCpn07gGimFzh4dxi/61DYbPl6wU+nUDVj8twVvNR0t+QdRjdUepFp?=
 =?us-ascii?Q?09S64rHT/zOkPhQTrknnZqOJMgq07wyWcZA/xTr2YNmPF4rbyoC3sSr39ekb?=
 =?us-ascii?Q?O8IpluWzTUH5/2YPx42TjbJ4h9+20t49sNE3vxI0FVUbAIPfkQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LYtJQbdsjN15RU4Y5329Q5my25DRZxwxjFoQdxBB6pslZnep8LvXuoN71XV/?=
 =?us-ascii?Q?d6pOFXxiMBOgoRCQwTYEr9R1NXm0hAoyoqyRfrLtC78CBeqX+eslsrFcZox2?=
 =?us-ascii?Q?20DymhZpixLUktImFO50LHYTmRgdCj8nRkTCd4UiNTOiPvtIJ5H9rFzX1IeO?=
 =?us-ascii?Q?j5Qh051fSjhxJZdEoVvenUlpcklf9ueDf8V4i5Z0xuJZ0nGzGYVAk/iKkidP?=
 =?us-ascii?Q?QQ2Ei5gFNTAGOiVx9hn/lwhiNfTkFhNU9bQN7deScMHOLWsZkew7xcb4pBCa?=
 =?us-ascii?Q?l0ELxAEsOnbObC5DF7ez7GWhiDhDmETzuki3hpMnxcuRg5Ld3xx4Ay64+mY/?=
 =?us-ascii?Q?7/HtBlICKUL1fIPj+Q12TwKa1P+WrLJSva66M8DP/3S5ZxwCI551lUgLvgi2?=
 =?us-ascii?Q?/VxYZnW3lAM/QTmGjqesUSa+prWn6e/ttZR3MtlqsN3fTSgd95U8ud5I0k9n?=
 =?us-ascii?Q?BSvFX5mPVcO3reJkkw6pL8pt1beYxDku7pPjiIIAGOe5svy125ztYeby55c0?=
 =?us-ascii?Q?fLja2GCcVzqTOR5h/G06PckkwxVMLKM6kOCTx3siHzqcKzm//efA1+Txg9WL?=
 =?us-ascii?Q?S5NxB4lZ3inHdrWOMsTBCVDbjXPnHxqwGz1SwYCw0bkatPRY4SHhBAeIiKZ7?=
 =?us-ascii?Q?MnfN3lI3Offwf8T/stf6+3Mivy4l+wz2Vtxwmj8ejn0x1GONpVBiLqRw84wS?=
 =?us-ascii?Q?SRW7YEiKPGhK7v0pcai359bp1uh2PdPUJ+L987ZByp2nr1lCKbV3dHxgldoI?=
 =?us-ascii?Q?5IBu50J5gNFZ28ujQkb56m3FY0N9lSRXSquJWsbe9NvpvMdTIkxmWsJKLIOW?=
 =?us-ascii?Q?TnTELUQahrgRGek2d5HlyHlIRw2j7xM6mSrt6BEsYNFV2q4tdbT6Zw5yezaw?=
 =?us-ascii?Q?FLk5g2VmJAs6XwrYfiMxlcdih0nCqm/uFX+di6BgDIraPHbrb7kHn/fBE+kK?=
 =?us-ascii?Q?RsPvabk1ECSPh9R7tVSwxuISwK9QmH8rj5EHYn8JsfDQmFJjMD255icv+wdM?=
 =?us-ascii?Q?E1h+0nUVQ8T7aTUnxbwTO8loU5yQt75G1DJMSUJuVFlVemT3vChaH+FKdk6X?=
 =?us-ascii?Q?np4/zHafqps9Tj+gVxaJhY/TJXyw1XGKgP+EM3MPeUJGbSK/c2Ca6KU3xlMh?=
 =?us-ascii?Q?4SlLKHCZ/rOrdleS/ybUuGWpDI9gvKrMNUBE6Hs8JjT8Q+CyVe3ZxzTKpNxe?=
 =?us-ascii?Q?0KVO7RSRPI/Fy2K2pxiAYFLIGXWtF76uACmbd17ww0oxk9W1JSoPknoS30Xl?=
 =?us-ascii?Q?w1THeBe0U5AMdaIwMkqYB0Ck1SWoP6aHY/cO0HxCjKEI1IyhS8f+0CSqj05S?=
 =?us-ascii?Q?9WQMseru8MY12WC+ZDZ986QXgLLvCAOGkNQwfDi2luxX9vlPpwZanGuAZR2K?=
 =?us-ascii?Q?BLXpOMpX5o7woWjvuydIDJc/62HyZUOj3Yth/nyxFBBzOMFl+GM3pGHm1JNJ?=
 =?us-ascii?Q?OiQbvBh+SPNYfZgbJCTGLMAU1CsOoVqHkko9+R6dHxJci0VowgpPI8V4PIG1?=
 =?us-ascii?Q?L28pXaUgCUj8HJn7/cyeSem32mrfN0MDEQbi0+M2wIQ2+i2gXBaFyZO8BKWg?=
 =?us-ascii?Q?/BGPyTP2JJf9Gz5FeeyLR5tv7o/p1406k8eJ12aafQf8Qq6MYJgorDy2rxt2?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c202a8-4f01-4ce1-53b9-08de30f4cba8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:15:08.3161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ru2j1BfWS3TA/Cs4oTTNr+xCr1Fi1KOfAi1XjXaQVu+wykA4Xu9/k04F88nQaH+FFuPutcSAjwpQUvTC+0hCSvjquFoMFh6p1OYy0AV0uyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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

On Mon, Nov 24, 2025 at 09:08:32PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3_lpg: Apply Wa_16028005424 (rev2)
> URL   : https://patchwork.freedesktop.org/series/157858/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98_FULL -> xe-pw-157858v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-157858v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-157858v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-157858v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +63 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6676

> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +27 other tests abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html
>     - shard-lnl:          [PASS][5] -> [ABORT][6] +25 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6675 on both
platforms.

> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [PASS][7] -> [ABORT][8] +20 other tests abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html
>     - shard-bmg:          NOTRUN -> [ABORT][9] +26 other tests abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6675 on both
platforms.

> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
>     - shard-lnl:          [PASS][10] -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

"[drm] *ERROR* Tile0: GT1: GSC proxy component not bound!"

We've had bugs for that in the past, but they always get closed as
"cannot be reproduced:"

 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3729
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4799

So this seems to be a pre-existing (but hard to reproduce) issue.  Not
related to this workaround.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98_FULL and xe-pw-157858v2_FULL:
> 
> ### New IGT tests (12) ###
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-13:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.69] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-14:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.74] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-15:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.66] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-16:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.67] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-17:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.68] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-18:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.68] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-19:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.73] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-20:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.72] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-21:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.74] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-22:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.74] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-23:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.77] s
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-24:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.75] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157858v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +14 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#610])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +26 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +35 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#3862])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432]) +4 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652] / [Intel XE#787]) +22 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2724])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2325]) +6 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +24 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6507])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2390])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2341])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1188]) +1 other test fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +12 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2291]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#4633])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#5299])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2286]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1508])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4302])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4354])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2244]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4422]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4156])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#776])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2373])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1138])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2374])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2316]) +5 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
>     - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-1/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380]) +9 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293]) +9 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2311]) +70 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +27 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2312]) +24 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2313]) +60 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#346])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2934])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6590])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2927])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2501])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2486])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4329])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2393]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#5021])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2763]) +4 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#870]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2391])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#3309])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2505])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#1489]) +24 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#2387])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +34 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [PASS][74] -> [ABORT][75] ([Intel XE#2625]) +3 other tests abort
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@kms_psr@psr2-suspend@edp-1.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-8/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2414]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#3414] / [Intel XE#3904]) +6 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2330]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2413]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1435])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-modifiers:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6503]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_sharpness_filter@filter-modifiers.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1499]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2168])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@kms_vrr@lobf.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2504])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4837]) +38 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322]) +23 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#5007])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4943]) +65 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6281])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2229])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#586])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2248])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1420])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2236])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3hot-basic-exec:
>     - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_pm@d3hot-basic-exec.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@xe_pm@d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2284]) +4 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#579])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4733]) +4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#944]) +6 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][101] ([Intel XE#4543]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-1/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][103] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][105] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][106] +2 other tests pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-1.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-9/igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][107], [PASS][108], [PASS][109], [SKIP][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) ([Intel XE#378]) -> ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-1/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-5/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-3/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-8/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-4/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-2/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-7/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-8/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-8/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-8/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-5/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-8/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-5/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-5/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-2/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-3/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-7/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-2/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-7/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-7/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-2/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-2/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-1/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-1/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-3/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-3/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-4/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-1/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-3/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-4/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-4/igt@xe_module_load@load.html
>     - shard-bmg:          ([DMESG-WARN][158], [DMESG-WARN][159], [DMESG-WARN][160], [DMESG-WARN][161], [DMESG-WARN][162], [DMESG-WARN][163], [DMESG-WARN][164], [DMESG-WARN][165], [DMESG-WARN][166], [DMESG-WARN][167], [DMESG-WARN][168], [DMESG-WARN][169], [DMESG-WARN][170], [DMESG-WARN][171], [DMESG-WARN][172], [DMESG-WARN][173], [DMESG-WARN][174], [DMESG-WARN][175], [DMESG-WARN][176], [DMESG-WARN][177], [DMESG-WARN][178], [DMESG-WARN][179], [DMESG-WARN][180], [DMESG-WARN][181]) ([Intel XE#6659]) -> ([PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-7/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-6/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-6/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-1/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-8/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-5/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-2/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-bmg-3/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-5/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-7/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-1/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-2/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-8/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-6/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-bmg-3/igt@xe_module_load@load.html
>     - shard-adlp:         ([PASS][207], [SKIP][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-2/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-8/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-9/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-6/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-3/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-4/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-adlp-1/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-2/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-6/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-9/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-8/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-8/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-9/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-2/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-2/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-1/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-1/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-4/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-4/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-8/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-6/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-9/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-9/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-8/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-6/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-6/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-4/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-3/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-adlp-1/igt@xe_module_load@load.html
>     - shard-dg2-set2:     ([PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [SKIP][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283]) ([Intel XE#378]) -> ([PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-464/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-435/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-434/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-433/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-432/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-466/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-436/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-dg2-463/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-433/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-463/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-433/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-466/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-433/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-434/igt@xe_module_load@load.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-463/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-466/igt@xe_module_load@load.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-463/igt@xe_module_load@load.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-435/igt@xe_module_load@load.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-435/igt@xe_module_load@load.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-433/igt@xe_module_load@load.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-436/igt@xe_module_load@load.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-436/igt@xe_module_load@load.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-464/igt@xe_module_load@load.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-464/igt@xe_module_load@load.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-464/igt@xe_module_load@load.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-436/igt@xe_module_load@load.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-434/igt@xe_module_load@load.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-434/igt@xe_module_load@load.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-435/igt@xe_module_load@load.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-432/igt@xe_module_load@load.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-432/igt@xe_module_load@load.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-dg2-466/igt@xe_module_load@load.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0:
>     - shard-lnl:          [FAIL][308] ([Intel XE#6251]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_copy0.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6659
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98 -> xe-pw-157858v2
> 
>   IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4138-c3869a42c28feb9db1633aa045a698ab89f3bc98: c3869a42c28feb9db1633aa045a698ab89f3bc98
>   xe-pw-157858v2: 157858v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157858v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
