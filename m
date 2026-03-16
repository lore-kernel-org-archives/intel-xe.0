Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F1BF53D69
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 15:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02410E5B9;
	Mon, 16 Mar 2026 15:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhTVB/Th";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A44D10E5B4
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773676317; x=1805212317;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=lQzKBL779wAeLNRPWIlfGVBnx6n2bKZ9l1XDm+b6XDE=;
 b=EhTVB/Thbz+p2o36bDQ+YZc6OwBNMKc7vtc0QQrFaSANK/Kux5hhZEEQ
 TSkrNz5aH8pEIjxdJMXXasrCqmyl7mEhr413tD/SOEFXlDUm/ODoVcgIs
 Yf+BpcqrHCYTOFnYOHUgiA1MkAZ8IWdRhu4QqYLNiBxAipDteZ0E5hH5F
 WzIaV9vG2nMK//QRKvW4olcCcxyTWkQvbemx9aVbeMD82iiEgxwMCIbTi
 RnIn+D6yEHI1mb/qxnzmn5nlrAYeF5maBKgiHUT+nXASuxusJduiuqNoy
 S/UszBc0ozxHJr+qIKhIRukAkf9+a+F2S6Bf7doPC18IKeKVQhPXFPKei g==;
X-CSE-ConnectionGUID: vHWNNqx3QYOq7BBSP43/jA==
X-CSE-MsgGUID: rTofWVezTqO+AW5WjlTeTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74585595"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74585595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 08:51:56 -0700
X-CSE-ConnectionGUID: ck6U24JSQHC7BbJhhkFz1Q==
X-CSE-MsgGUID: pKCMWcjXSlykNs9p4AG1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="217769766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 08:51:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 08:51:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 08:51:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 08:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG3fga4QRw1vR0O3HdfsMWcti8JEFdRxjBOxPysYKvlAMZdAjlLkjtoJA10OLqyXOQEbrKvEmr0wMhwTdBNnozYfhd8uVCnClAReS58OynWcVVjzqdNyVCXAO/QP3OFOjWoJPkxUNbfye3sR0VagitF8c0qRFWXKrlGsdm4tEXvKjrEGmKdV+DWTv1ilU0TrQvVoSopecjOptCG/MzOakaK7n2SuBU5Jl3/JHp2yKuHMoAwRunpT8hG0Oou/nuxb4Ae1Z2Q8J8c5/jgDHOhRwzK1znCBG1M40K8DHmRkiWMhChB1yoaWVMEBBGxux0SVEAIYiKu+0/ygbJo6LcEEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEiZ74hO4GCVCuSyNr1PweRGFuNJmlgLve3FgvRkmM8=;
 b=WFSkhFXZypp30Ld2jI2TOYdK4gCms6XJRlKdpTvfsjV6pOY1kbmNsug36KZN/y35KjB43F7+xhiY1ObjWIoeCihzFR2F6OrtWJ9B5zkqLSFQpGa78fIeDvOhhCNX68fOKM6nqXz7IjSP9EAW+bNbIIgR9K9ikSbyn20EDJpV/orSzrawUzNvbgpkFhvCcRHeoAJlyaNBe2+iw/UkONxDQ83n09Oyg7BFPPFcTvUoEQQCXSzpQm1ITHTsr9O21FEOq1ym590nJujlazPDfZT0dUUo0ka3lClImsfuu2FsWLhxEUEK8jiTjBiFohujwMmYUYARZtKuOg0vHB8spMbruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Mon, 16 Mar
 2026 15:51:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 15:51:51 +0000
Date: Mon, 16 Mar 2026 08:51:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?s?=
 =?utf-8?Q?s?= for drm/xe: Include running dword offset in default_lrc dumps
Message-ID: <20260316155148.GB2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260311-default_lrc_offsets-v1-1-58d8ed3aa081@intel.com>
 <177334051422.352407.5016048281231300520@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177334051422.352407.5016048281231300520@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: b128a26d-ab6d-45db-dc97-08de8373f037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /OEwNDqV4oW0LNI+gvZDSTtez6SzJW/SbA2WsbWn5JLptw9sf9l+On32ZIQgKjj8ptJQ9Lk6yxhn27+9Z17tWcgirItus5tdFskOsWDo4GwHSQzEqYpfzEtSTeSHQBtpVJMd9f52GcrWGbOOHUz30SesraF/g5/TgM6XfMiI4Y8TLaKJ57hgqU2N9+uDzbgpvqGC2G3z/MLh5ddTtUjoFoG5wTvdckAPpA8MCEOVR2uIcKaEFi+ogwzs4YEsq5SJy3AYDj1QMxt6I7yc0P4gSJLF5r66aNBOg83qog9zJEhL1yMfTDsgWvuIuZB4ypQfXV99UcvFHI638UpFe6v21cAXSTSwu4wlGVAPpAoez0QTGH3fxGru+LNHAp2PY8pyh7zI9n5YulOnPQk7VoPCNX8OHsSln9p2GlF1RVodcDDDvFq6u55JtsdbPn/b9yx5w3y3RIUxdmhUWi8f7M4dX6NPMOStW/DHbIOgLLcORi4h3JtuW8U4B0GpcQkztwpE4HXrW25n20NY2G/AfYmB2N/jYUtIC/cAySS5kjbTaAIkXi7df0036wQwhrdmRZPGVCBCobLEdipq4gDyxBvGpiXwuVsLUkyB4OBMICsQg5m0kVzbbasm5IC2I7vJ3dssttSWbIwqjTpjJShllrfUlOyYhqhTG3UnmHcMwFoJz7MOJ4tXPLB2Rd0z5ZlAi1jz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFnaiGYdMbVW57B7ISxzoWi4A3kk9Ts0mMq4hONDGR8jULXA6qEH9PwJCm4g?=
 =?us-ascii?Q?Zc/E/yXyGeADN1X2CFM/bvR/CVS9WlKHaVMIFQDnoFVGrqwy4aYdgiuLYlHN?=
 =?us-ascii?Q?yHjGSB+2SfK4S5y7ox0GO1BeNFrhwyQEmc+VVNz13zx9W9Ww9X75ye54qCVj?=
 =?us-ascii?Q?+xYerSIRhrrNbwefdtGrVulvkH7YkwZ9sl5zzvhAiRAoW5hHSXP/tKqAV0ND?=
 =?us-ascii?Q?t2rD4KLeRMBHStuIm5dkta7wHllHPddVse1UfKM4QcMtHUsqLJNhBMg0/VFB?=
 =?us-ascii?Q?hjnX6OnUBV16Uu/GXdAs4VvaaIMLqQlcdK3FmG0CPVP6Utb1kG1GFJWQXRg4?=
 =?us-ascii?Q?P8Lx6vfgufuZNmsNtJXTAV5AuBrRYPc58bgNQj695MdxntD13oeEJxLf5cwS?=
 =?us-ascii?Q?WpKaEy2UAYaErfhB0k9suymBIkNJIeTtb4YcOEmBLqVLQnx+TTwB0C/Je4sq?=
 =?us-ascii?Q?4eRpA4W5jAXNkIcH22kcHjqxsUwDoS1Ys+c5Iutz7aAbH3MrJM8eIay/mHaA?=
 =?us-ascii?Q?yz3GQR6h7j65L/6y5Q+7ZHrXL+2ZOKxkcYPYv47IE5epCT/Zc0GR+LB26LZq?=
 =?us-ascii?Q?1YzG2sn9C4V4GKJTTk8SqU6UOM6o5JN9rivQtafu4qnEk+PZ4B+x5DQ7mlRU?=
 =?us-ascii?Q?uY21jqbOSv9AMF4LZ+MjcsP1vY4Vf4hHeybTCg0mOyFzYvqeKgIS6Qgyym4X?=
 =?us-ascii?Q?yK53Kyd2m5loc6O792o5NX25UWpsk1FT66KnxgYNfFblKH3wmHGJ/Frn7FDa?=
 =?us-ascii?Q?pimIGeA/gyCw3uPiYOf5tcbsrDHCaFEXxcnlZd1DZhMUwXDMgEEkXy/ZOvQs?=
 =?us-ascii?Q?vANthZr0hQIsotHw1zWQzzFAdUlcIa7gBzKXazdKqdmcOwbL+aybjz/z/KFW?=
 =?us-ascii?Q?BoPM12EJxusbsKfOC+nfD9gNdwA+cuMIw7FRynHEw0MG4QOHKecpoCwBZgJ1?=
 =?us-ascii?Q?inZ58qXtnCo/cfTthiFmnuRK4xMz8JZmfvV68FaPQ0lnq6FGd1qTZfG2jGM/?=
 =?us-ascii?Q?qv1QtNFfCPPJMnFCGpfP/b6dF035DTCgmy/lo31OFppUfjADJJcKfRtVFkOA?=
 =?us-ascii?Q?7p8dug18WdV3IhuBWlX6E9GOPPQL2jlBQLvDGDS9v7VQv3GyJgOmlT2bjoLP?=
 =?us-ascii?Q?UQRhLJ6N0hTCS1RC9WXR+TGOX+KoT0eT644qbtbJci/0SG9O6vNC1C2FE8Sn?=
 =?us-ascii?Q?Pjtqh4zIySkrD1GQlnomOPwyK3YZGZPlk8hzH9vJPWCptPTek2kQ6v2kMj9Q?=
 =?us-ascii?Q?QFQCdALGwv7FTC0aZVO/7zAkOltk/MDNWNxGu8iY8DE5XWhnSzfvC3U35f8M?=
 =?us-ascii?Q?HkMnUFlDDSJgWB89Lm9rK5W5q3vjbJEVAU4BUbDYydL5RVivz9Yzr7d+fyWo?=
 =?us-ascii?Q?KqBQVsjPgflBv4SuYA23OadwvVOSnisMbALvIUCaSv/7DL82SJvok1tv2r5K?=
 =?us-ascii?Q?s3SIq+CPvVhDF38tgW2QIo59tOTYpI4Hysvm1f2VMol8WXiQYmDSiPZ6awh4?=
 =?us-ascii?Q?QyqiMUO//J1t+5J1c/KxcePnW8+Iy1KpoFxamUIKX+c5KkQsrSbZH1a3UXzr?=
 =?us-ascii?Q?0B7rdT9OH/QMoq8HIYh1dwIiEw2fDTDHUewYBxxk7w06xve8WZZFbUTkDIzw?=
 =?us-ascii?Q?tG7ka+1wihTExfh6bgPXWI9XLXOZOyuG9XYoE6/rbOR1Bo/7pyvIM9Ctsdy6?=
 =?us-ascii?Q?8LeiC4b4GtZ6wiEIP9Z0rmaUHXdYsfhzGj7hUtLfSxr8ttfM+3l1+mtmIELz?=
 =?us-ascii?Q?UyD7+zyefLKefSo2ywMuRD5sO6XYKi0=3D?=
X-Exchange-RoutingPolicyChecked: I2dHTeaR4ClDZfcR8M0iGizNNFi+jlh/DOgh/YdBDYuS91MUejQaxesY/wtO9RvkjKI4DU6wdKjh0HhwgmmUMJtaRhEha1ZTm6EudY3hnnpdXm5/PsD4hp8GAtKI7GsQaYDJLZzzKSk5sc39FOE0iLsOzwNjHieC9mBhymH/ed66adZyuMJvig54QCuvxCS5ppGbzhM8pLL+mC4+v1suq29X6sItrbzjvxQPON+SOv0OhBK4M8VTJTYnT0kxLcg1+4LI4t1dnfP9RzAMsDLTkQp6sReLFdSRXZ5nBukLBcC3a4eh2R9SzlNdJk7MAaIqeLhVpD+CQaANKvpfgjGjHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b128a26d-ab6d-45db-dc97-08de8373f037
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:51:51.0051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo8JNOJhK585ls+q8ZNrk8Syym+9t7lLYxGBKvNjwkqkCWp7PKA+1pZEOSwNorou8LulaIKBo+BsY4UEig96H+Sr8YMWkzru7Rbf2SCaD7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
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

On Thu, Mar 12, 2026 at 06:35:14PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Include running dword offset in default_lrc dumps
> URL   : https://patchwork.freedesktop.org/series/163072/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6_FULL -> xe-pw-163072v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks DN for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-163072v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1407]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +3 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#2887]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#306] / [Intel XE#7358])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#373]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1424])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2321] / [Intel XE#7355])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#309] / [Intel XE#7343])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#4354] / [Intel XE#5882])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6312])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7061] / [Intel XE#7356])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6312] / [Intel XE#651])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#656]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1503])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#4837] / [Intel XE#6665])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#4518] / [Intel XE#7404])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7482]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_exec_balancer@twice-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1392]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7136])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#6874]) +5 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#4837]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7138])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52]) -> ([PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [SKIP][77], [PASS][78]) ([Intel XE#378] / [Intel XE#7405])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-1/igt@xe_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-7/igt@xe_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-5/igt@xe_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-3/igt@xe_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-3/igt@xe_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-4/igt@xe_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-4/igt@xe_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@xe_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-6/igt@xe_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-6/igt@xe_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-5/igt@xe_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-7/igt@xe_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-6/igt@xe_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-5/igt@xe_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-1/igt@xe_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-1/igt@xe_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-7/igt@xe_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-3/igt@xe_module_load@load.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-8/igt@xe_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-8/igt@xe_module_load@load.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-8/igt@xe_module_load@load.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@xe_module_load@load.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@xe_module_load@load.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@xe_module_load@load.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-4/igt@xe_module_load@load.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-2/igt@xe_module_load@load.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-1/igt@xe_module_load@load.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-1/igt@xe_module_load@load.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-4/igt@xe_module_load@load.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-4/igt@xe_module_load@load.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-2/igt@xe_module_load@load.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-2/igt@xe_module_load@load.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-8/igt@xe_module_load@load.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-1/igt@xe_module_load@load.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-2/igt@xe_module_load@load.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_module_load@load.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_module_load@load.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_module_load@load.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-8/igt@xe_module_load@load.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-8/igt@xe_module_load@load.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-3/igt@xe_module_load@load.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-3/igt@xe_module_load@load.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-3/igt@xe_module_load@load.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-4/igt@xe_module_load@load.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-7/igt@xe_module_load@load.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_module_load@load.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_module_load@load.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-7/igt@xe_module_load@load.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_module_load@load.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_module_load@load.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-7/igt@xe_module_load@load.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#6964])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4273])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-5/igt@xe_sriov_flr@flr-twice.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][82] ([Intel XE#301]) -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][84] ([Intel XE#2142]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_create@create-execqueues-noleak-shared:
>     - shard-lnl:          [INCOMPLETE][86] -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6/shard-lnl-2/igt@xe_create@create-execqueues-noleak-shared.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/shard-lnl-6/igt@xe_create@create-execqueues-noleak-shared.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
>   [Intel XE#7404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6 -> xe-pw-163072v1
> 
>   IGT_8795: 8795
>   xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6
>   xe-pw-163072v1: 163072v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163072v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
