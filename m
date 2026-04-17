Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF73F436B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 15:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933810EA6E;
	Fri, 17 Apr 2026 15:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeEn7Ziw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6B610EA6E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776438466; x=1807974466;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ihU9vlE8zL/k9x15CBwtXkDRf37rIQ52WxGgjGbLHRE=;
 b=ZeEn7ZiwLshqMuldG1ap6eb/YCnWvk1PYo/KJZja4Ufd6N6/hOaEcxH3
 HmzYIpZAXGGDsU8xRB6SUakMrWVSZFqPP82l9NgY07kZuUFKF3PU+yG2y
 H2xNt5k6+eX9f9P229PUssRGhl+ywJODh33MPSRVZK0LjiKk2NomtEBou
 eBBMU8mBZ4nSSKMow8vQMeTme0bB6dXXBEJAF/0JufEcQGZQhQmMBZCaA
 Z1BCrBKKq3Syb4IzZxYmt2aJmuZbaXaE2CZ6/0otayzOp+MJyNqVS+m2j
 OswsUFweDI+1tzHZ7eIYY4nfhisrh4M1YxrkuS1aDKtXi3Y3iqNrw2VBu Q==;
X-CSE-ConnectionGUID: WyBbRJ6wQRCwcSoRE+RNKA==
X-CSE-MsgGUID: WDnda/aRSdyDAOHcdw3trQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81325328"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="81325328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 08:07:45 -0700
X-CSE-ConnectionGUID: NQOvT0xaQmywh5F7eB59dg==
X-CSE-MsgGUID: o3+xHEAcRSiBoC2IyboH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230198134"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 08:07:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 08:07:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 08:07:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 08:07:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpWllSuW/e7iEBaCCyZbl4TIwXnGTETT1qK9zjukxOXXkR5ZPO/Cbm3VYlW0guL+omTcUUPeNiUMCZQNQgb6GXQMOe4AdKo2ceqlUGxoVChMjp6xBDBB7Wlg5uVtOzMdmVVvzCOJbci0sP+FNuG0twcYm9+nutr8q22yvulf++i1ug190flIQJbuMfKgZWf95bljbI/xrAR/2pPy/rfZhxby4oKlVpGrFoiXZIwBBfat+A/sxVns2rifu2b0Zm9FCy93HGTa6P+0B0rB3LhCblDR+3RWT+SkjyrEfoidjaEGggFJWMrGSiVe1cW9gMUc+tqi9Alh+GNOCa7wgnp4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZliLgYVibQV0R80AoQirpaJmdsLADhQX/tZCW6UPnR0=;
 b=dfJ2b2eOosUDsqmbORAo4XBcCRFcH4w342Bqk/OS6yCc2xEGzmsxVPfMU6eDBsqxWHrX50Og5GkXXvtbONu+rLkvHEdBxRJKX960NFfBLYEst+dkWmZDgvET8lLa/DngSVJp/kitRgplJ0sC3RW1QfwdwolRh4Im2lDivdgttKCQKX0EPydBa7w9cCpBW2axXEPEjupiSLuqaD9uV32nKTDVrxrb1Dpi4Qe/fRIVl0VYUyjR0SiYydgt8YOKl/wsRBrGPKSKWj3K1AIj+WQRjQ7BVGlZyeLcijKf0Qn3nZfWP7g7X1wmoD9x3H0lKDkFJr+cdDxH0eVvGQQM4yiOGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 15:07:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 15:07:38 +0000
Date: Fri, 17 Apr 2026 08:07:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe: Drop skip_mtcfg descriptor flag
Message-ID: <20260417150735.GJ755471@mdroper-desk1.amr.corp.intel.com>
References: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
 <177638600509.470646.10944736464186938152@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177638600509.470646.10944736464186938152@a3b018990fe9>
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: a66ad0a1-ac40-4920-b22d-08de9c93102e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info: q4qmAK9leZu7zjOGffAp7lDzpB02R3eFfuR1bIomVjvxdASHiDL4hBtUXAKVTp2P+JhiREoRa1BEmDZl699FoTcG6vKM6L5yT01nLVX+u0vfRC/AksrzDieJyBMC5vlb1Uqj/OqdHFhUpUCfAETz/jNigb/frr/KDuJp+kK38FC3VJ7c5+07Jmbm+po3bL+0K+69uWbTBOmXWCekUkhL2EhWf/+Y386Qk04KNaCq6iPJnTX8eDbyb4P1tjY5BHmwC5CURko5DcXVcRRSP15yvCMhKwoOq738AXKmdsfNwKEO/Oh//yX9nyF3x8SVPGAdcY81k/iJZrdhLOLbq2kPVOQsqzq94vjL7ULA39+Lb4MXIgKqPa/LHORtB4YWvWhednWlDcGM6uNp3xqT754s4WOE6tyqWyiBcQfJtvS4/TmQaaK89AW+OeWx56sfguTOUd7kpqduBcdQOrXUz9v2SbVHk9hBIhO8rVdzsbiisA0hyxjh2NTVhEcGncY5x+bV7wmrnfxO1c5+Ta+T5Mkms8MAYPCbnXNB6oBlocE1QXC4F4wW3c9G7dbt5fJDYE/38aR0GqoeXbI2GFVMbVzUynzprEuHxd6sAbVBCpykddMKJ9dsjTQLsi0nPPWvSqXSUFpwpLp95NJnhwoEMuXTTie7k6v7YRmw5PeFCiUgScU2O4NBFcVx/kKSwQXcvSqU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(13003099007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4wy3L5bZkLBHbGgAR+0DPW0Jp36pkaq8wI7TMw6jZjtKnjWK1KuTOPA/6AUn?=
 =?us-ascii?Q?GjQOpXz+Z6vH9BGqCniyJP90m2KnANxbo/eBuZoVwf2GZHgm7D7eCO0Zmp9J?=
 =?us-ascii?Q?5bYxIzRdv2XX2q1shLxNWIKKJ3FTUFZEzsBDknqilrCTEfcGHHtiepUtis/S?=
 =?us-ascii?Q?jZvA4VJ16YhgeqmllZDlTtfnkWI0FFdDuzjCsxcEEB4ZjPhSDaATdfOaQ78u?=
 =?us-ascii?Q?Cr1/+JfqIzqltYuLZ02GRl+C3sJYozv/IykTnU9R0flILjHkrz5DPL2WNGVx?=
 =?us-ascii?Q?YNAa0HtOgASTJ2vFFLVqc4jBy9mbeVM3R5DUNa3wMagzyu9fBq4iRDkBjxVF?=
 =?us-ascii?Q?Wi29M2r/6MF/35U/kt1DFeqVbqUIzCIy8odCUC3ySdKVRL3OfQQYg1CiZjIF?=
 =?us-ascii?Q?eRYuTp9z8M6pYSNdeXY2+byivDuC0wybAuNasisRLkq2inbHRhLn/NfhEUYL?=
 =?us-ascii?Q?QEz8rqQV8GLVVUmuXRr2OhUVl4WpG21+Ftvwh630vnIAqjEYbvpegobpUzNg?=
 =?us-ascii?Q?WHjj0crwE+SQmEKpoyUgQZhV1lS65td4x1fbBZ88HMHmywUtfOGL+EKkHJZF?=
 =?us-ascii?Q?bQ7hP8BH0Fm9o0I69VA+n1W1t1Pw+PeKgur5P9ys6qXQX7DePBQ05kY5j1CS?=
 =?us-ascii?Q?Emw4o6eRbGFZSSIgNnXLns/gI7bB8upiCTHIAVlnCERORbhassESt72l6Sp3?=
 =?us-ascii?Q?p/nz846vTCqGIPIGj+nbqkk/CNnY0Ngh+iPtEJHBhLJPiBHkBK39b7QCsCl2?=
 =?us-ascii?Q?WxzCKZPtG1zRyxJXwf5M8ljGfXWOxzTY/bUz2RHHPib+auIZW/hNPaoVaZ8I?=
 =?us-ascii?Q?i/En+Foeolh0HsLpF1Wiwx29013nqGhvc999Ucfvn7wNLUKXiA/G7ju30LAh?=
 =?us-ascii?Q?JgfdCrPz7VFefhqIOeQlmsgcgXWGOihhCi/FDGNODWCZ7VPnByro43ivOWNw?=
 =?us-ascii?Q?XPF0gc8bUL4H+nafm9Bgs6WaXZfz3TP1d12/ueO6WveKqj1zhL/kzmKAXByv?=
 =?us-ascii?Q?zy4dpDS6BH6BS8bjpDooe0jxei7aHAFx1HzDAIUij6DdKsX5GQw2y+RXg1nK?=
 =?us-ascii?Q?djfwbgLIC4SNm9or6VmhWlK1Rt6+0hp4Eim/XDDTPsh/jTGLorcql6X/QCTS?=
 =?us-ascii?Q?/q9mTjxStCEmUfw8tGXMf3+TttRZRgt4+SSQZKrsOe1rKby+sZfs+afsQU61?=
 =?us-ascii?Q?BH02pSsv9B7P1eZcAKn77axnlD4AvnYYOiBClUfbz6cM+zxQlLphQRm683EP?=
 =?us-ascii?Q?8G3tgE6S/bH4a0QUDDbdTYmZn+kh7fUSNfTkyLkq8CSGydHh6BTUFzCAKm4c?=
 =?us-ascii?Q?Z/dXuFVd0J8BdTo31scjPgW8zMakCqvz+f/J2Cxh13+jKmSMapaLk7lmFWFr?=
 =?us-ascii?Q?JRoQeb/LR1yYuvkB9svgUEPmNhRAZz1hb/pcSHDew7Xm8xHIDkJQdXBrKtCU?=
 =?us-ascii?Q?NtsaEtKbYJU06TOrG/Jq6Ks2cNiiK1QzDkY474BmSn6gfUR/4VlDO3OwEaHJ?=
 =?us-ascii?Q?A5I6NsWr4GBNFYZcIyz923uidh2c6f9u8CUnCh7KpZjYpLQOf3JHE9fKAnNJ?=
 =?us-ascii?Q?v9KCaUd6wJS6Glj6w33I2OnHW7v7Qd14QMqI5y8KM90MNjGN+rzRZX8V9Sqj?=
 =?us-ascii?Q?HCUdyrQ6+R2DAnQf2Ym30mY93IYpLF18PQ+xykdkOZGlP6NOThcmKP8fej/u?=
 =?us-ascii?Q?GD5Qh92QuP92vCUoOlZCpRxgkOIfMQ/HvKALnvwgqzLaUOkScVW+Df3nZJCH?=
 =?us-ascii?Q?s9tdROTc+eu3RpwkufIkkjNdy9X+L3I=3D?=
X-Exchange-RoutingPolicyChecked: gR0Y6hvOminSoRUaeMeqvXOYM5bN1jjE/eXMJjrzJ7vCczMmK3Nu91rPeDDAGt7eqd31Qh0Nu/UN0QlOlSzzo1X8xII+uRe5pTd6Nb2qX31/9zWdF8x0XPSXSa2rnRqu305KdW30uYpAqwyxuyp9mlfENgYIWj7Ls9bD+hC2Euj8nVzXuLc77cKF2nxzJ14GnHgztfb0T2TXrMHomse3uOVWWytVZ7qkqiKOI4ZQBBT1ArKfu0ODnkvbkim2jBzN6Z1iR1JOHn5YOqEkt5ZEog6xnIdPs58UZcLKlKR0k7mp/tvC+25kCHqkOGw7QVlh3BMBkA9lHzHVIR/yF0spTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a66ad0a1-ac40-4920-b22d-08de9c93102e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 15:07:38.2756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y88bLTYngo98wSIE0MyE5vXLQ6StmA7b/Rlqnx6Gbig1c0BCCyKMjlfU0/BcbaspUuYfp8jDTx88OA2bHxPsYiDmSQBqAOFy5R1oFCRxggM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
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

On Fri, Apr 17, 2026 at 12:33:25AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Drop skip_mtcfg descriptor flag
> URL   : https://patchwork.freedesktop.org/series/165025/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454_FULL -> xe-pw-165025v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Xin for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454_FULL and xe-pw-165025v1_FULL:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.08] s
> 
>   * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.41] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-165025v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#607] / [Intel XE#7361])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2724] / [Intel XE#7449])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2321] / [Intel XE#7355])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2286] / [Intel XE#6035])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#4210] / [Intel XE#7467])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301]) +1 other test fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7178] / [Intel XE#7351])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2311]) +10 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2313]) +9 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6911] / [Intel XE#7378])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7283])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2392] / [Intel XE#6927]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1489]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1499])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-2/igt@kms_vrr@flipline.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#2142]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6599])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_eudebug@basic-vm-bind-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7636]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7140])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@xe_evict@evict-cm-threads-small-multi-queue.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][33] -> [INCOMPLETE][34] ([Intel XE#6321]) +1 other test incomplete
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7136]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_multi_queue@two-queues-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6874]) +9 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7138]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#6964]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4733] / [Intel XE#7417])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-3/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#6569])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][44] ([Intel XE#7571]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          [SKIP][46] ([Intel XE#1450] / [Intel XE#7394]) -> [PASS][47] +1 other test pass
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          [SKIP][48] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#7394]) -> [PASS][49] +1 other test pass
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-3/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-lnl:          [FAIL][50] ([Intel XE#1874] / [Intel XE#6946] / [Intel XE#7305]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-2/igt@kms_rotation_crc@multiplane-rotation.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-2/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][52] ([Intel XE#7549]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [FAIL][54] ([Intel XE#6569]) -> [PASS][55] +1 other test pass
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][56] ([Intel XE#2313]) -> [SKIP][57] ([Intel XE#2312])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_sharpness_filter@filter-dpms:
>     - shard-bmg:          [ABORT][58] ([Intel XE#1727]) -> [SKIP][59] ([Intel XE#6503])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454/shard-bmg-2/igt@kms_sharpness_filter@filter-dpms.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/shard-bmg-6/igt@kms_sharpness_filter@filter-dpms.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6946
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
>   [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7394
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
>   [Intel XE#7549]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7549
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8862 -> IGT_8863
>   * Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -> xe-pw-165025v1
> 
>   IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454
>   xe-pw-165025v1: 165025v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
