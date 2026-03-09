Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04620FCA192
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E010E5C7;
	Mon,  9 Mar 2026 21:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKtbQyBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C1B10E5C7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092480; x=1804628480;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=GH0H7MFSFBfVx5zIGuWppwVt88yJ50xHVBMsZme0HBM=;
 b=HKtbQyBgyATlLkS6/Zib6MAYULs8f3y7UmXhmbPJNkPJdZ5lOMZKnHml
 AyWfMOoTyRGuEyoZH1NWfLQTvZpvLaa5zpONKOLpDlpvigUGZrthSAgoC
 4SYIu55qiicIJVr6MX5nSEbm/UYYif5P7p4T8KBkyFISibwYXx3aHhoD9
 m3Tp5eR+zYWJ6YzpLUqSqrvtRqQkOWX6qH8vKQWiYQSkaMSmNeHDQA3JS
 /kDfCXt7x0GjUj6nF1csQwX3FmHbZ4qq6KCmHPtS3f5SiXYJcdo01wmnO
 LwTaKhUIzFtY3RLwrgt/+Zi2yZioJzJn20BEIIRV0EEJNK/BPMgKVdzaV g==;
X-CSE-ConnectionGUID: hX73OA7eS+qKTVSFRlgk9g==
X-CSE-MsgGUID: EDIDWg7+QFaSenRN786gIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="96749352"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="96749352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:41:19 -0700
X-CSE-ConnectionGUID: 6GkDiwxkRUCEDquNyGwahw==
X-CSE-MsgGUID: HcB9PaPDQQiRk00ftyKUfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219831446"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:41:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:41:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 14:41:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 14:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTiv7RzTUJde4xx/4bizcfLvSjO15xj4RQa8FHa7cLHClUO06JCZ3ogPXqZ0vlMkp5hP+IJTpCnk/Yb5oBdRGYv69jsljC+EAvc7ATHeB+jHcqWKjL9g4oEPV/XZ/7d/aPXgcfA2pUd+jNiatKeo90yIh/0NmqW1KZ2gu+0Z6/e75/ZXRk+tZR2S5b7GspH8f6z/J6ZZxlRMZszBZwWcylWFww2NR8IVMxsUMhsBL8mNIBYvSBVwrfIIc8bd3X7tRhu/N7MCVEJP4ARfaMAURcmoeCCSr062Zv87IMGtw1yt83R6rIncRVVuniJrWMqa6YKV4ezNzBZBhpKBCLgnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNYFIBBFPMOUYVX7RbQU7fcQmGE/MsXMVHWrBaquYkc=;
 b=b3oBFE9+gCMCQwbrlgGJPt49i8SYsjH7X5mF+nNa+LKRUFK0H7cdYAsEju63BNFeopOUXW5DJr7DRUTkvmWDFYZ1TdE8MU7aOda1medVvse99zZar/lHpCrYIESj+nchq/FxDdlBp4se88ZE/loajsWEQ+J+sx/zfkPfhhk0L86sBOh7WedG3lUft7Gtmhx9e9NIks7ByzjqfO8v1Pi0mgZSsM4hHma9C37+8MIQY2FtbBi+KzNnlUuqOvbP7XvIx5sE0YZw0EqGnV9xDOa1uupagw9gEIfu1s3Db7PAH+MFMNfY1Ryvw2BRK0HPinlKLmG1Hz126vcgpa5SVTKRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8273.namprd11.prod.outlook.com (2603:10b6:510:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 21:41:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 21:41:13 +0000
Date: Mon, 9 Mar 2026 14:41:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Add
 type-specific GT loop iterator
Message-ID: <20260309214111.GA4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-gt-type-loops-v1-0-aa42e9fc3f06@intel.com>
 <177291347690.330282.4034842199747584808@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177291347690.330282.4034842199747584808@a3b018990fe9>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: a253fc40-84ed-4bef-05c5-08de7e249600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: VBG3Sqnn5GIXh3I0bOlI35ZEqeL02MYHLHwcirwTZ+OXwvlQx1cBZijE4k4JUNCtmaqGLMOP3Kmm7e2M81pyxFzVXl6TCKkJsW+qqxDOxew5jJYWRDP41DdpBdtvieMqFZANFXuZzrVZLXvM1ndA6xKVn9RU3f2eBXcRah5k/JaicJ2zFtgbIyMQSlQh5sX2me3rdae0nmqTjeSLypXdmwY4wQiecQA8rezVeetYb98VnDI4nk3BPdrDu2ct0nVKABsZAuFv+X7871ltH/2ANVrmLnPsPSrv2uJL/biZvnwTjUhffp/i5vz/JcSpzNR4aXy70yHV5CmX5fZYf1wjlLOXu73hany9gFiL943jQcse2HzQ4fRzjJ4PZO/o52d/qFDil9Wejymiz2rWic1kydaXcOOszLOHb1quThMQV2hcLZoVjaOEP042wuARUYtNkSMPihunR/St+EpZKHGo68YKdppMyHUVNrsuvIAuo1YclMzpD/M0uxTs2+t86llaSE4+GIPXyN5ppjkUvkRhC7aL6SeT/O14bfdTnJH7s6aQt/ZR8u/mVg5fkaXvPJV98SRcLl0jIFPPyYo6SIYbhE1989sxPb42vXVbmgFWXvbl5J6dDFhSX9hgtC9vRLbQ+uZF1QjbPIvNKiCpWXnmKjRwolH41/2lK2mLVcGiWdbL7IGO1GU0KJ5g2ZePW0a1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZjfgdfIKsZGxwL/tBtEltzy/BbMx8DmqyncRYkv0Gcpv1cSz1fuaKuXM5TH?=
 =?us-ascii?Q?uQhQxUNkihiRKlCLZfrMcDPwLuoQxiBDIDRLxZrAOm26ugrJlB/1AJD6i9SQ?=
 =?us-ascii?Q?fFibFYHxcy2YyhgsulSjbIQiwM83kohGyjTU/vnt+c9u6CsfJI/gqO141Vi5?=
 =?us-ascii?Q?juk/zbhn9bDY17KfnATp+HWPVzRjKYPBrmyf0k/LmTMs1jGrYk7kYGgFn9jD?=
 =?us-ascii?Q?mOeEDFTiEe09Ewb5kHnWjOtc0czXJcMip95bKybi9UxmjhrYI4/IvIZoIrui?=
 =?us-ascii?Q?zy5UL1TxKDSNMi7MFvqL78sg3sU1kAs6uwvaqDtlUOWNuA58d77ZVLlfxcSG?=
 =?us-ascii?Q?rnOuvae8X0C7IhWEskeJUkwg2p76NLJx6EX/ucZrv3FvSlVbIaskS13LOnts?=
 =?us-ascii?Q?dE1/dwktkdb3e8jf0L8l2vM6Igma83URadDzyAicqJe8kXA7bLF7Nnk4Y/ba?=
 =?us-ascii?Q?duyir25abZQ+Jxmq9NRKa5X1F2cr/ScGMAQA0v964mgiwjfbcLPk1M17UnFl?=
 =?us-ascii?Q?2meZZ41UIXAgS99cLy10nWE6UEa/dgB52P38Ye4aIjo2Dpux0wQbfZukI6Jv?=
 =?us-ascii?Q?5t4VrpXoj6tgkJPH8Gz6VDSg1gJfdFFdUaag3GlJSxYnkJfdj1xxXcQM1FVW?=
 =?us-ascii?Q?I5g94NML6bMCCY72Vzbfie7oNpGeq6YvikV04oihSOUZ6q9V7yk0tge4e1jw?=
 =?us-ascii?Q?Kqn860m/xXdnW2LhHJ82fASXChSIcORzWdwhSOsKem0tbk5z/JVyAd+RT55w?=
 =?us-ascii?Q?DRnTEEQtehofNASUH5hC6U/J/LhlEauKMrP5iCcMRB5qaHEYeQuIYMtOEpDy?=
 =?us-ascii?Q?whQFMlYs5QjcxpQV75oGwpDd6oqLvRzEcIfTsv5cZws0DrRqnRrwxPmzcOeP?=
 =?us-ascii?Q?dNu3xCO0SYbg4W3jJSrDNHCbHJbL8JvuCKBYxQFDTbCUjtYu1yTcSMrCCJAS?=
 =?us-ascii?Q?dxWqK28puMKhuRyndgCWfjmuAZyO7oRxmSxp4vwgFGNeWaikeTfoYnxzVNv0?=
 =?us-ascii?Q?FXFN+5jiiVo0gLRd3RmSBekczhqYwt3gQDK2RmZ1QpNfbl4rAIT8RAFhxc/C?=
 =?us-ascii?Q?Z1SxRBTB6Wg/d+bKSIfruYkAdTLB+JoDn4cKGd+nnxB/eIVRvabtgUmpIA7Y?=
 =?us-ascii?Q?X4WEPKO81plmAqDadiBziL8/Z+B3U/uJS0j+acOnNSFLoxisH9xvu7i6MvoN?=
 =?us-ascii?Q?NV1Sjm+HjbqQWhv5bsnnItu631z52Tg8nqeUUXkAktyrbQtjN7Mst8sklhMT?=
 =?us-ascii?Q?R/rLSk4SCmTrFTTxP6tS1Pam2r6LfqLSbAHnQAYYrcGlh3wPw/ock3CLU1j8?=
 =?us-ascii?Q?lfWFxTTn8wWxI7MNOjMcLbEuX1DrjGIDaupoOUrZuunS2Gl+2KMoh2b2kZ8O?=
 =?us-ascii?Q?kvC6omrqAWLN6AmrxzYRXYZ6RrcDU5kthh+Y74+zG+4LyJ2rPiWv1YwKTkgB?=
 =?us-ascii?Q?W7ID9KVq2HxS6x6uw35i1TNSzP3WAfwtzl8qFFVYSvdfDeRcXE6tZMW4Mmgy?=
 =?us-ascii?Q?RHxKCC+SU/YVKUhSg5VHcP7pQ0EXYf5WPtHaoqrIgVUJiSn5L39pfwthAITy?=
 =?us-ascii?Q?bVDwMT/1LGkmZxwqLaC5OQ3Gf1XZ0V/3zKW4tx+NjnUdhbS8kUPCqJqGKrD1?=
 =?us-ascii?Q?75mqiRiKgKe7tgxxa1m8F3H9tqxDh5mzFr0n9kz23sU12flW7of3L21Z0xiq?=
 =?us-ascii?Q?+iZY+1J7k5vsbwSKEylnoGfcdabhXDYtYu7V5nVCm6dWAyRf+g+nHuuxv3oP?=
 =?us-ascii?Q?qgLSZ4Hyvzmf7O+Tue+JsW1QZbaX5Hw=3D?=
X-Exchange-RoutingPolicyChecked: R8mCJI/9Rpc4i2dRkwNSc+p638BGzENzll3V8yQufg+X19xVRHFt2cmIv8eLGgXo/N5jwy5aDSEJ9LbMqHrKbUIy4/eKLUepxPVGC+qD3dRE1Fxiv0NE0G+6bsF4TXa8TWbBFiPbYv27gMY49iWiUMN2Jvez4l3nT/uOHvHO57eMMnRH9N+Hi0HdPbK7sUiX/G2XM6OdNlJ5kyUKUbpkur4czO/RCP1+CxlgJP4gQfdyoJ6A0KmIdqFzKGvFog+BVrNT9KqnclWhyMqnF+UwHWaSc6KECWqqOKQTdCrsA1rZd2fdHjzqlj3SMBQotMHqZgFNmpe1XFBkir2FCR3kAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a253fc40-84ed-4bef-05c5-08de7e249600
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:41:13.5390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HivHNllwMmGKmYQdDHFXnJ8yFfSUstDN1MO6+WCY14cP11zLXQGU4Xv0EekuOsTYxjhXq+H24R9ktmIlSfAb5VABtNV6vrnQinqxCM6hdtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8273
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

On Sat, Mar 07, 2026 at 07:57:56PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add type-specific GT loop iterator
> URL   : https://patchwork.freedesktop.org/series/162710/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_FULL -> xe-pw-162710v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-162710v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162710v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-162710v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

Looks like the same timeouts being reported at
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7489 just on a
different test.

> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

GuC died in the middle of a display test.  I see two other similar
failures in cibuglog (not ticket filed yet).  Does not appear to be
related to these patches.


Applied to drm-xe-next.  Thanks Rodrigo for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-162710v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#3157])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +4 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3658] / [Intel XE#7360])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +9 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2191] / [Intel XE#7373])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367] / [Intel XE#7354]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +9 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652]) +17 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306] / [Intel XE#7358])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@kms_chamelium_color@degamma.html
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-0:
>     - shard-lnl:          NOTRUN -> [FAIL][21] ([Intel XE#7305]) +9 other tests fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2341])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][26] -> [DMESG-WARN][27] ([Intel XE#5354])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1508])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1508])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2372] / [Intel XE#7359])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-9/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1421]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-8/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7179]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7179])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4141]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311]) +20 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +23 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656]) +5 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1470])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4090] / [Intel XE#7443])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7173] / [Intel XE#7294])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7283]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2393])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#5021] / [Intel XE#7377])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#4596] / [Intel XE#5854])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2392] / [Intel XE#6927])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#7340])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4608])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4608] / [Intel XE#7304])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1489]) +5 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2893] / [Intel XE#7304])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-no-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2330] / [Intel XE#5813])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1435])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6503]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2168] / [Intel XE#7444])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@lobf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][65] ([Intel XE#6390] / [Intel XE#7461]) +1 other test fail
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6599])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4837]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4837]) +4 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6665])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4837] / [Intel XE#6665])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-9/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#6321])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7140]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue.html
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#6540] / [Intel XE#688])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-8/igt@xe_evict@evict-small-multi-queue.html
> 
>   * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7482]) +5 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-8/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1392])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-basic.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7136]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7136]) +7 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6874]) +21 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#6874]) +6 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#5625])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7138]) +6 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7138]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-1/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1416])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-7/igt@xe_mmap@vram.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6964])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-migration-basic.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2236])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2284] / [Intel XE#7370])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#584] / [Intel XE#7369])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4733] / [Intel XE#7417])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4273])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][98] ([Intel XE#6054]) -> [PASS][99] +3 other tests pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][100] -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>     - shard-bmg:          [FAIL][102] ([Intel XE#7545]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][104] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][106] ([Intel XE#7340] / [Intel XE#7504]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [FAIL][108] ([Intel XE#6361]) -> [PASS][109] +3 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-9/igt@kms_setmode@basic.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-7/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][110] ([Intel XE#6361]) -> [PASS][111] +2 other tests pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][112] ([Intel XE#2142]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][114] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][115] ([Intel XE#3544])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
>   [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
>   [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7461
>   [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
>   [Intel XE#7545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8782 -> IGT_8783
>   * Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -> xe-pw-162710v1
> 
>   IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f
>   xe-pw-162710v1: 162710v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162710v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
