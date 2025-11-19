Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E22FCF58DE
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 20:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A4F10E681;
	Wed, 19 Nov 2025 20:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONyCGJcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751610E681
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 20:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763582818; x=1795118818;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Ba7qNpYxLPa1w0La6HHSzg5CZRG4bzhkOnkdGFD7HOE=;
 b=ONyCGJcbUr12uZV95z+EuvkFlQhYGtHLsoWJ3gIvdoI2Oyb1YdMye7Xe
 grX1GeSdgWbL2khLsZ2j8wVTZ4ZjT25HL+Vd0xcBpxdurO7TI1NcSvurs
 CYkYVwNQYtC3a9CEMrhJgNOhioMBKc1wxOjvyfc4uyW3tJ3zAbY8plN8m
 hrtu38K0BfDkE8el/P3m82BlI2gEsmPVgzscLyZCgDiSkMdw3l20S+1k+
 brKgeAVF4uDwFXquicsnoHkDipQEj6EsgaZDpzjUFMK4RIUroISyjftmu
 CEvYM3g6vo9gRW1tH+M4KhUcmXK9PeI+JnNoFUjbInLBJQeFHh81c7XUX Q==;
X-CSE-ConnectionGUID: ZvGd/zPQT+G9GDPOC/XXsg==
X-CSE-MsgGUID: AFblVXvYQi29T8IUgMqlGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83028752"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="83028752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:06:58 -0800
X-CSE-ConnectionGUID: Y/zF1LhFSdWUgCqAyE2Csw==
X-CSE-MsgGUID: pVPXj4BZQluZcOj/eQN6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="196105159"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:06:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:06:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 12:06:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:06:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2tzvnWyjUP31LFcWVVylRGn0jo2JZkq0dG6XtifQD5h+ZKvpdDCgE3eqjZdpy+wMyIOyBLKtQQx5b6tehQCt8a0NwCioFG/nIvnqEQvaUNgk2/AB63ZphR2c/qVRWvmqT2auBkuf49zymsMYY1WJb9na9Fh/txI1YXxK2MENsnAWxpBJ80LTchCcs5KV13c+pMriTvT36MoG+8rFy+3U4BnjioJ3nkgyn+qW26a4TEjAL4Bn1eCRzXjKXeYNdu00l1TCUX3TeCnCQZKR8PNRmNcdpPIXNiwvpmsBnA158XFnk1a3YkKEQUHgOcj8yS7q8a2EWzHe3RwkNOa2Nb0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6jezKfYL/yJBS0NQqA43n9dzg9obzyfmg/Xt3mukVU=;
 b=Rqk97zyQu2ayaFQfScIrRtRkK+df40KTQFvOXMmvmYTJqogdp/r2PlHHTBYWyAWBKYiJyV0nm9rfotzVKCezcpzZvFbyazl8TUHLnYdtF7G6QCBzP0aMWd2c5TWydqTEYdxw9ciak7paS7oqKV+FT9KhYbX185rhS4rZwgly7Na0bEhC2Gp9JKpOUUj9zJ/8MZw6zztwI94GMsklOtLWFJtGXyVEqhw4+w8o8/lFXlg7/vg4TgpDqEK2befyLViinb2uaLp3IHqnpsIrYepr2CCVW2T5Cf4Fye6oBUendisb7lLVJdgh5VTAimHVZozI3UaMkcNj3Pg8RZtA5Hxyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPFF1A08ABF9.namprd11.prod.outlook.com (2603:10b6:518:1::d5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 20:06:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:06:49 +0000
Date: Wed, 19 Nov 2025 12:06:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 Scope-based forcewake and runtime PM (rev6)
Message-ID: <20251119200646.GA3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
 <176358224081.11426.16311810847107744965@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176358224081.11426.16311810847107744965@a3b018990fe9>
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPFF1A08ABF9:EE_
X-MS-Office365-Filtering-Correlation-Id: 260085f9-8372-4b2b-7f2a-08de27a72c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7WWkoxM9qd6oA8HkjLNjoQoc622z8vqX3ojj/kgtoyfqSURpTodcjcCbWjsj?=
 =?us-ascii?Q?jJTS/Y8VkC9pXX61lwLaBxqHYlLoqOdH7s5eFZmOyg9syXffKKzrnj52o6Fn?=
 =?us-ascii?Q?PqARuWqYFnXdpUBN8mMCjpC7NbeySuuVP4rv3K9WjIMnSnCAqPelXQ1GiAoj?=
 =?us-ascii?Q?Vgo1A/RHJbYU+T5aTXsCBS4Bgvz9eAabiBLKQiWCaxy6mIJckenUVe1UyQsI?=
 =?us-ascii?Q?x74uwjpT2OPjbs5+hdNetD79RBNbWTayJvNmff1wuY7fM5323AqwYkzgvoQf?=
 =?us-ascii?Q?C6qlnnf3+BucNBW+GWP56A/i48is0xutbjho+t0RYgxIF8ob/5zsIxsjnSAL?=
 =?us-ascii?Q?kcm087bc6BBRV55gs9bHEpggMMfpgClOWTtdz2vNK11xbij/67WrjPfCmMIP?=
 =?us-ascii?Q?Vpx2+dQh4JJsj7lgyR4GizrYeLoUOiA2Tjkuh2YvDP6IA/G2fPjOdDCNlKKg?=
 =?us-ascii?Q?B1xqvILwPYa6jQXirJ/ZJqsdYI05q+ST90D5aEg88Zyn0zWGh7vPrT05BnCB?=
 =?us-ascii?Q?H+u8t5K0RGTwyb26aA+gbNiH7xtZZep0nTa2cWHJNav7e6yzu8OLrq2paqA9?=
 =?us-ascii?Q?bcxBezgG8EEczTJ4lx03pBLpw6DKc3rJZiD9mmBbCeoJy8aOGW2Z1GpdekDi?=
 =?us-ascii?Q?rq5bto83F0rXYUyu6JHIBChybNT0pXkwjy0wDjEc4zAaO4PplMPSuUzt8zfT?=
 =?us-ascii?Q?fXTuzHEs8L6ggE1pCHVsoctctj636PcjlljHfvRAcJM5HZKnfAEr59GWOSKb?=
 =?us-ascii?Q?N8e/wXbAyE0C5fMcW1OlO80PvuPo3mkPcaCZgSo71y9BpkII/gg/hzTUaV/7?=
 =?us-ascii?Q?k/MEAUGrAuw8pRxPn0hwveyaUJkf+ycRwUAR/X0J18p+6moip2jPdf+AxPw5?=
 =?us-ascii?Q?XHzOyjbz7cnlOx1VMq4xSpaV5i3vUWHWbTa+fNz+divLWaDhxLinT3v64HVD?=
 =?us-ascii?Q?z2pRterWuAAh/RqLQZzYwXjrnejV99/0dUi3jqFt8OF1Sm8f7UiCR5mG8ZdT?=
 =?us-ascii?Q?OF5m/dhz4fZepzt5pOK9TbX5TusIs5xSUjEP4cdOiXKbuB3/JRtckt7Q+8n7?=
 =?us-ascii?Q?5X1xhtR4D4Xfg+RN7OvaQt3NJenHdhen0wAx4R12Rt+65gABlKZA9566oNym?=
 =?us-ascii?Q?y9CuQQTPF/sVZpzp1Bl6YzPYi+VFg/cKSg8CNAS86UphLs6+sFJO/KLJxj9o?=
 =?us-ascii?Q?iLqkCJh6RitVvV5IVtjYzbYvzoU+JZLweVsG+3mQxyRvuJUrlsTurFIVXPy+?=
 =?us-ascii?Q?T2CXscbutCXJzomszUwH3zhXNvhgZZBLxhNp5zcStzwBv7b6kgvS1FlRbdOC?=
 =?us-ascii?Q?uknkLkDtHBgAK/aIXpAtkAUOuVooeIDGget/GdvUaAvUJm+KFBjpxZFRJaii?=
 =?us-ascii?Q?rl93i9hhQBdSDtssBrO7t6qQWrQrqd8cmCCZI+2MLkbM/cCtfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7jwMqDbTSPiRAOF0M/Bwak1b04/UtzKH2dPuHViSEk6lMzN7U/7iPG0lixH?=
 =?us-ascii?Q?tvNnz6RERZ8YyhoJPE3R35ebQIqN6GSxDd/42eoe3wbua8mSi7UGSaCIGmzu?=
 =?us-ascii?Q?yBxHn/q9JQ+7D7/06PM3ZhNnhNL++kak0CYmIo5cT2rvbtgccFYCPlgG8kqg?=
 =?us-ascii?Q?ZKF2lq+pFPi2dK+HPw7y/4+3n5cI747FZZM/wPKTYZlxz9bxiJ07WsvlIYEk?=
 =?us-ascii?Q?rdZe5licfpwTuC9UDzOj55A6s3Ge0DfP6FSdEuG/ST1ZfCre2awM42AM/pms?=
 =?us-ascii?Q?Bx1o7MKtf3oVs+emDVZgelmsfFLJcCqkdxWF2SfMbZSZFfqTLQE+Ul1wRxo7?=
 =?us-ascii?Q?zcb1pAkdK8FcVoIBTKClDW4qYYvn17cPL++Ud96XRXwRSq2OfPK7wfrvwFCR?=
 =?us-ascii?Q?DuDITcyAX+k4lMd6pB4GyB61HPmbZzxbXAEbQxs8xxHnpX8RNT5ECixr7HcK?=
 =?us-ascii?Q?EBGpG6l85rPaBJYjHLZE6fFzZmOSByDMS+oC2PcgN3oY/4ICfCE9YAqbcdqv?=
 =?us-ascii?Q?Xx84AeLxfDHwgre5fxNmG29LkkHRnVAtgybK9d+M25HJPpzOjgomeZ+Sqxgt?=
 =?us-ascii?Q?u5gtWW3cSw9WoF2/spu0aTwJhsYgKCJHIgZ6rSoJ57MRhm37aE+Kkqwbm4ZJ?=
 =?us-ascii?Q?ZFVe6Xm8pyRC2s2ehiEths1k2Y97n0kTHnCrhgIe8mZlqwqw+lEGi0vUyiFS?=
 =?us-ascii?Q?24OyBw7GpvtfZfirtU3vfjfYRRUkDaPrf+UdvpeiMSWboMavRzr+hY+sadDE?=
 =?us-ascii?Q?ZDrKm+yRMf++Gw9M6YPdAsdXutOBSkK8yQgqoC1p6xW/N9HNWbnTRRFm6Kmo?=
 =?us-ascii?Q?bskn0IxGKj06b5ngJQJFQ361caZhxzlG0CdWok4l2sMtOq3Hm08BBXtdNOi6?=
 =?us-ascii?Q?Sf2ZMz8JKjI0MnmfhnPzda9OKlNQlJmNS8gg4pREJNFXNCOFox026baJzsSP?=
 =?us-ascii?Q?Ak/LFQ+vL/stOtbIoMmMEpCY6RzUytSePEM/cv5yMmE7J8dbx9YTLxTdTOAU?=
 =?us-ascii?Q?enO1rDj//aEnEOBVbAaMbgzek9r0jlfW64i+jeIpsuryl5Mqq+23N2gnaTZN?=
 =?us-ascii?Q?TQYtyq3Lmbz0yqBQWoWgtvIstdfnBYdo3zffLLyE4yfDflNk7s2TdM7LGMdk?=
 =?us-ascii?Q?t6dOuuJIe39l5ppsUV3Fv39K0Ay5xbRGNIhlToRCcqviccCfLqG/k+t88N3d?=
 =?us-ascii?Q?P0Bc4In4Ien6EZ1BbePdf7EBIv9VZ7tuJ9V2VJcXAo3yW40AWpGYhBpVYwqG?=
 =?us-ascii?Q?xqlfNTSbBzcl/yZgsHJiLlT4QutkQrNqF3L7rhbl8x87jR2HYOAgbxl7vIsB?=
 =?us-ascii?Q?BhqR3tGOtL3W9kum0RB8/bE9MXccbRQUg/V4rnHimG9fjaUJNxxbJhk1fPC2?=
 =?us-ascii?Q?m9w4h0097OMhBsRrjjT4oAWfThabjlECtS827iwpeqbpm6hHF+5D7uDOE49O?=
 =?us-ascii?Q?9tA0A11dfk2y7diH552zRYQKWp31lynooTCqu+Zc/YC95xFb0xp5E6pv3Agk?=
 =?us-ascii?Q?lOWH8wsyImggvC/kXjga8c1ulovzyvG6eRoPFtsmUhnUpmLpLuLjyO7TTYhl?=
 =?us-ascii?Q?yrbVSXPGT3VN15GXQ6BUIfJWicF1Ck3O0e6eEcl5JML1LIgMt7Ji9Nnf8wVB?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 260085f9-8372-4b2b-7f2a-08de27a72c43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:06:49.0994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up18En2c/2DdBIac7bofAED7TFugCJbLp1KwVKkkRYannqAxQ6K2EyHRNtMUzwdEIjouGWTVVxMzmOPHxmojpFsFzMuJgGyNaza389b/cvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF1A08ABF9
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

On Wed, Nov 19, 2025 at 07:57:20PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Scope-based forcewake and runtime PM (rev6)
> URL   : https://patchwork.freedesktop.org/series/157253/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb_FULL -> xe-pw-157253v6_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Gustavo and Michal for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157253v6_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#316]) +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][2] -> [DMESG-FAIL][3] ([Intel XE#4543])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124]) +10 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#367]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#2907]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3442])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#787]) +83 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#4345] / [Intel XE#6168])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1727] / [Intel XE#3113])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#4417]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#373]) +11 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#306]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#307])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#1178]) +1 other test fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#308]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1135])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
>     - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>     - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#2953] / [Intel XE#4173]) +8 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455]) +16 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#651]) +25 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#653]) +24 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#6312]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2925] / [Intel XE#346])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2925])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#5021])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1129])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1122] / [Intel XE#1406])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +12 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#3414]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#2168])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@kms_vrr@cmrr.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1091] / [Intel XE#2849])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1123])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1126])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x8fffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#5503])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x8fffe.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#4837]) +8 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#288]) +21 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4915]) +290 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#3573]) +5 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#977])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2284] / [Intel XE#366])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#579])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4650])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#6251])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> 
>   * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4733]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#944]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_render_copy@render-stress-0-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4814]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_render_copy@render-stress-0-copies.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#6318])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-464/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#6529])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-436/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][67] ([Intel XE#4543]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][69] ([Intel XE#4543]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a1.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][71] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][72] +8 other tests pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-adlp:         [SKIP][73] ([Intel XE#6070]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>     - shard-adlp:         [DMESG-WARN][75] -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>     - shard-dg2-set2:     [ABORT][77] -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
> 
>   * igt@xe_pm@s2idle-mocs:
>     - shard-adlp:         [DMESG-WARN][79] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-adlp-3/igt@xe_pm@s2idle-mocs.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-adlp-6/igt@xe_pm@s2idle-mocs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][81] ([Intel XE#6251]) -> [PASS][82] +3 other tests pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#362]) -> [SKIP][84] ([Intel XE#1500])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#6070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6070
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb -> xe-pw-157253v6
> 
>   IGT_8633: 8633
>   xe-4127-57e807d4454add8b60e8807ad1cf812141f34cdb: 57e807d4454add8b60e8807ad1cf812141f34cdb
>   xe-pw-157253v6: 157253v6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157253v6/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
