Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C5FCF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 20:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4610E300;
	Fri, 20 Sep 2024 20:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bawk2SPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088EC10E300
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726864148; x=1758400148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BTk/DBDXXHZ2SNE/ZihElu79fPURKF5kdCErefWBG4s=;
 b=Bawk2SPE9M7Rxd4TdNmKY0rn0hmVOvnOMmoyZZ9uN7h5iZNnvgVSLJM1
 6BZkrXLegrzLOmxt4dC0G/In5m6853mzPWaxqoLmqln7HGSC2qUUBavKW
 MaIynqOxTMWLRUOixKSOhdaXfYRTMKeTvKxWr8jkr4ycVir8VEBcLpkEs
 FG1x5dcymNAEfZqjZ7nL89yHPwuUrOaVZHZdhrv+2P2uRS9iwbm6w1S/U
 vi6705X6Qt/hyHbIagLF6T+bnjuZ+IhBiIyxxeDYkbw4fhjNgNyIZkGB0
 2qmIM4kk/mggEFFuPILursdYur6+gA12EBrHd2LvbkLKEnWNGz1gfz7km Q==;
X-CSE-ConnectionGUID: eZh5bl95Qtu+v/8SvIFlLA==
X-CSE-MsgGUID: TIWwuyQGSTKMuawPjNWPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36552931"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="36552931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:29:06 -0700
X-CSE-ConnectionGUID: S8QDvHT+RLWukN0T4IJl5Q==
X-CSE-MsgGUID: UXA+8Sa0Ru+4z/a7nQM+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="101149664"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:29:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:29:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:29:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:29:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFtLIm6sQn0eAXdK7ce7OJyMWFSqtozOxtCyvpthtvgFsERsdYRi/xHcQZjsIsGvkOen2syhS+KP63VUliMZ0+HsDIVSIcWtovDPFU+b87rvuH75RuLcgoRJm6v+lM1MC09NI1TrpvVCSKiXJHpx8ibaZwL9wiC3Dy45ckRwp/F5jdyCLuwQpbH0mDDxd5gij17XxsZGAOohb9r/d0cNzLGl5DDqVuPjtPovcMPJwpjT7r3wdQrWGnuXWDfvmTNdGKalX+vUMIe8HPsVexsQ86OtC9LY68BV0i7ARZsDfRB+5C7/ZXWwbWclH1zwdB2McrP3QDhEDCCafNRrk290yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0AIMhtNTX3D1gwOcHpRSbbZoytSiVK0xSm65Ixqh2k=;
 b=MhRMpEFMv0mPK8yU4T6Kwa/JeahQnHjSdUgxWWF4rMl1SHn7TS8uc15DH0E2NXdRny1WZmpp1q1KSS79Wx5jXTFQObWoQtX+kNHH0F2VKw/OdvcJS4gbo76PNbK3se+CPO4pIb0JZyfU+8tBjpyNQ5pkDuUsmTJey92vI5MQb+UFhbH8vI0G52HxsUiZhf9CvXBcFmJ7a+F8Px7PKGQ66QpbfEvfwvr7ay6i4bKd0/DUP/DmU+9SlKC+YZYZLzgAQTFlEW8xPkHshHfT6Gv8NS1A5VJK/m/2EJnnU5o2EZL5vWPE4+MMMDZq5b1ZfVzf0tomiXFNy4Zuuo/M7yR+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 20:28:56 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 20:28:56 +0000
Date: Fri, 20 Sep 2024 13:28:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Message-ID: <20240920202853.GT5774@mdroper-desk1.amr.corp.intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
 <20240920171223.64969-5-gustavo.sousa@intel.com>
 <20240920192644.GW5091@mdroper-desk1.amr.corp.intel.com>
 <172686279302.236428.12481256240412350726@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172686279302.236428.12481256240412350726@gjsousa-mobl2>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 1592dd16-b3d4-4c6f-c2e6-08dcd9b2d9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kmsu5f+4gZh63b0hFxlKU2yiPviyL3t3xnauG7ViPDxi2VWj0Xrr0dzwDpkl?=
 =?us-ascii?Q?vrv+76i4zBQKlQYyKghJNVxVJ9masmnE6eTZoruXgXWe5JstC/diBjylQ8PT?=
 =?us-ascii?Q?/JwoJZo8V0wTN+GBp82GRC5mYoeSRZgGbxQvnQK5Ro2c9KKG991VVE4JUW9u?=
 =?us-ascii?Q?TvoyG0ORp7prb91z8WSlE08z6mm3SyMib9BpBfnza0h38po0wFOfcAogXtvL?=
 =?us-ascii?Q?aVfNIjFJ+xKofVXyqTyCZadOqJZ6MnlYMv3CzQTQCxf3UbB21dnn/7+MTwxd?=
 =?us-ascii?Q?BNOnCsp+ujpiV/kiQtMgvSLFjk8OHchN/hCrJDdi37BfS25jKXNVhHxYM0mU?=
 =?us-ascii?Q?CQyZyZ1l69lmgzs6JK0UF/tH8Qkpzl+CdwTNqAXHMv76qqRDvjWgPfZWCxxj?=
 =?us-ascii?Q?XgrTamMbW3RueCEPKqzdy/1TSOwPqgHuJ5a1omngDeYVIGjxn1AmObQs3AFN?=
 =?us-ascii?Q?fiP1imiJJWax3tmVk/r47dwRBkFgVaovCFTHPeaLGfUvTaRD/+LWTSTqnY4w?=
 =?us-ascii?Q?tkptjPRXa8oE8JAY+zIV9WcmWtnSvWyINZr/Q9Zajq3FcVbwstOzNXLiPXZC?=
 =?us-ascii?Q?RskAfkh5plQ7p9bRVptbQFI0DfyyyKWWVmy/49IbIJdmoh0BI9ojuO/auRkh?=
 =?us-ascii?Q?hpJ8+udfZSL4A6di9BIHWH2OEWSSnPaWbsZQACNtV4igTrSlPEr8/XTqJ74/?=
 =?us-ascii?Q?z5l9AbIdlNhOfJ25TbQKbirheitdJ9Rh6SDr+1va01P4harchxbrBpSF3Gjz?=
 =?us-ascii?Q?tKWQPFE8unjGRkyq7HGvkNMj/4QRDkZ/8LO+YgRfLIW5FnGpRg7O1VOzvRSd?=
 =?us-ascii?Q?BNHcp7E+hwMb51LPvDL7N8y4hAQpCNYxMrfDOVmD1gVE+HAzNrTy+D8tnfdw?=
 =?us-ascii?Q?axdbEaOQugxcQ77CEF3XJuf0tdz9fH0fPPpWmSzdFKjI2WSlT5tA8hCjHTYp?=
 =?us-ascii?Q?yAE92SQigvgcFA2BvDr9R4JoQPHy6ImU3fzdVIeiiROOfM2YtaNf1oJAY/O8?=
 =?us-ascii?Q?lf2NL18kMhLTdR3pj/oXBXt8aXhmZ7/1MI4WKVJz7Ew07gsrJq9ozaPd5QNQ?=
 =?us-ascii?Q?dcNcVsCoCTFP6S4J8en8kPsaFfe0sQXHnJcdM5IhHaoDRZAKGBSubrO10ihB?=
 =?us-ascii?Q?2shTEeKDIfz5j+laFe9LIHliTGfFbFTkIK1og76bzm7uLyTGxkMjVUuIAnaN?=
 =?us-ascii?Q?QO/dQJ1YujMpQ31/1+1AAPp0cxNZ4Xzx3lYbJeHU2Gf14YqIjiXocboA4/X5?=
 =?us-ascii?Q?nC+h0f4Q+c1FskLZQQ7yMjZjNbva/HZzArrY4kdOPx6XxkK2Rgjzy3nq3OFI?=
 =?us-ascii?Q?U4PY6M3cM4OzGdQTrig4WhgZwCZ2T6CKtompnvcCttAl7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6YCA/em06K6lfsJk2ifLkKjoeEob/Ri/HtOJHgC8vpYueH2+L04u4+gLppS?=
 =?us-ascii?Q?4xWwAu4IrN8NVU4AkiU7pypiHDGBHW2SrlYkcji3roT2Upm6opHVOnS8jMWe?=
 =?us-ascii?Q?l2DPbUTjm5NXaOqRU/0U8UbR6OkHuZKLB2USqHtOtN1IuzKXklRYtHBMQLBi?=
 =?us-ascii?Q?LXGg5Y4xQhFSaCzbdk6l2z+ZdT6om/kC/D8REGqstQTf+I58G5++5m69UfT2?=
 =?us-ascii?Q?KRdT8Zt++NY8Ef7eZxNeR8Ds9zTCV/x0QtVm2CwKsPrjwpacInL5xJXye7jA?=
 =?us-ascii?Q?QlYP7N7KQrFtzDM/iFlzHWs1TpSqIAYCbwFtixFTtKU0sTHeOo5NgtMfnBwG?=
 =?us-ascii?Q?othiN1gDWZgAt6YPCnUSt587IS9QGjrtQPwIkv1x3/BDQJsSN8XozBAdtdzN?=
 =?us-ascii?Q?/XuRei4yzDSMrpUoPy2drBpLld8T0NH03L5eVd/D6n6RrFTkE1g1fLwXrmK/?=
 =?us-ascii?Q?U8XLDmG9fyFUk7BnqnBOzjPNBvPxDrZN/6kfjtwA8YKVpoJMfy56vDI5zUHV?=
 =?us-ascii?Q?kY/QzBiioMtrqe/B/NcO8Zd+/s4Q07s4CczMayocVPtAZWASP7+0zcX6kfhr?=
 =?us-ascii?Q?Uuop/BwOqVXwWluA/cnVl7MD0RsxbnqHVXignXcBpArhDYHxe3++LjrmzdK+?=
 =?us-ascii?Q?ozo6c3SGymmbm8MaWyo3gtlpn8bl6IRtCkj90hkK6U9B23i5oy5rcyuoJ9i+?=
 =?us-ascii?Q?6OiC33NNxLQA3UVk1x24hd7Mpj/J5HqFRC2NRnjqSQ1BZEMQ55apiI7yhz8m?=
 =?us-ascii?Q?dvsKhbnIYCg5m+1f8C1645c1DVJKgByiXh23YVUK89gytgQs+2un5VVOlblA?=
 =?us-ascii?Q?2FOMmogL/rfLMSxMa/FFiNpTAfaeWvkKhJpyiQ9+FHnefQWOb1IpPS4UtoKm?=
 =?us-ascii?Q?uHkn9rEw1PcBK1aXGyN4j1LYFxb4aveLmaX9IwjBvg8e67l5HwuNf1AYW3u4?=
 =?us-ascii?Q?sEbtro3MMg0NVgRFdSzd1e6isA6TW3BgNLPotzxA7YV+ao8fsqp5rPnG4SfM?=
 =?us-ascii?Q?d3K6FuGal7N91K2CRB0GOfPVRS8xIEa4AuGr81CooHnZpbTgjyfufAKbwJF4?=
 =?us-ascii?Q?RxOSFol4QUjjmZGDndaLonjQSkF/KmpqbcJReU7RCLdlNBewLJMdFn0OgEyI?=
 =?us-ascii?Q?QwNqCG96I/P6ORTiIxX/pjuHNllAIRnmmLbrthkEx8Fs5Bdo1JvjoX105DFb?=
 =?us-ascii?Q?z+mMy9V1l0WLXN0I1eDH6fG+dkQndtkzVt7N8f2yYUq7nXr/HdnKavHYAi7a?=
 =?us-ascii?Q?Ly4ip98Khf2zmjWImDRfWgo6MyEAVcm8tpKMfbKH4luOdYv5LzqjqSVXyxhu?=
 =?us-ascii?Q?gLJ+kXbx0o9AcJtazzcD5tz3ry4mKGU+GOPDh5tqw+RyTd8zYpf7PbfUYLmB?=
 =?us-ascii?Q?P9RO5wuxR41ENSf2Q0/6ufRM+4mfzz6J5+hM1DBiqbWd+01Gh++OCPJFb6s5?=
 =?us-ascii?Q?dXcdxbrx1PCVljc48+BQS76jeDbS7+jT9Fa/+tUCOSXxQeGQkT/wteM477Gk?=
 =?us-ascii?Q?m+xkuobOzn2HokNIFiEueoB4rM79Be3wj8S8WucTvPh9Lo5MyjsPHdoYId5x?=
 =?us-ascii?Q?uAzB/RxwlVu9N1WFyoytojUTKWW8pAuhVattMVypyc/Rx8Pv5xjOywEWGHaB?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1592dd16-b3d4-4c6f-c2e6-08dcd9b2d9f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:28:56.6028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1Blrq3eR2Kcr+7hY2ZRFvQGTe5CBrrufaT6BL2UBvTvEGwB/Mn8ibxwbiPDHaEbNCBCOenhjXlretuNXY+J1ggyUANxhsU24H+VM/ie8PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

On Fri, Sep 20, 2024 at 05:06:33PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2024-09-20 16:26:44-03:00)
> >On Fri, Sep 20, 2024 at 02:12:11PM -0300, Gustavo Sousa wrote:
> >> A recommended performance tuning for LNL related to L3 cache flushing
> >> was recently introduced in Bspec. Implement it.
> >> 
> >> v2:
> >>   - Fix reference to Bspec. (Sai Teja, Tejas)
> >>   - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
> >>     Teja)
> >>   - Use SCRATCH3_LBCF (with the underscore) for better readability.
> >> 
> >> Bspec: 72161
> >> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> >> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
> >>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
> >>  2 files changed, 13 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> index 07315eb72eff..8d8f6a113a86 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >> @@ -388,6 +388,9 @@
> >>  #define L3SQCREG3                                XE_REG_MCR(0xb108)
> >>  #define   COMPPWOVERFETCHEN                        REG_BIT(28)
> >>  
> >> +#define SCRATCH3_LBCF                                XE_REG_MCR(0xb154)
> >> +#define   RWFLUSHALLEN                                REG_BIT(17)
> >> +
> >>  #define XEHP_L3SQCREG5                                XE_REG_MCR(0xb158)
> >>  #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, 0)
> >>  
> >> @@ -405,6 +408,8 @@
> >>  
> >>  #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
> >>  
> >> +#define XE2LPM_SCRATCH3_LBCF                        XE_REG_MCR(0xb654)
> >> +
> >>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
> >>  
> >>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
> >> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> >> index 230369f108ab..39f50b6f94ce 100644
> >> --- a/drivers/gpu/drm/xe/xe_tuning.c
> >> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> >> @@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >>            XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
> >>                                     REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> >>          },
> >> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> >> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> >
> >The bspec tagging on this one is a bit of a mess right now, but when I
> >look at the ticket that originally added this to the bspec, there's an
> >underlined comment there that says "only for LNL."  We might want to
> >check with the hardware guys to clarify if that's still the case and, if
> >so, make this one of the special cases where the tuning applies solely
> >to this one version.
> 
> Okay. I raised a question on the original ticket.
> 
> We might as well make this LNL-specific and then come back and use an
> open range in necessary when we get more info. Thoughts?

Yeah, that sounds good to me.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >
> >Matt
> >
> >> +          XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
> >> +        },
> >> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> >> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> >> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
> >> +        },
> >>  
> >>          {}
> >>  };
> >> -- 
> >> 2.46.1
> >> 
> >
> >-- 
> >Matt Roper
> >Graphics Software Engineer
> >Linux GPU Platform Enablement
> >Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
