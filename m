Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9261077607
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 21:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40210E7A5;
	Wed, 18 Mar 2026 21:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGfXXBXw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E9410E452
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773869413; x=1805405413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h1qxN5zOxPcTqcVXTjhfgzjpOme6N/dG0iETxyI27dk=;
 b=MGfXXBXwAtWoa2VK4suYLx+g3EVBSUT5tFsyht2B3WvZW8xu7wE3FI4V
 XJ/bJNUHOzom488SAmRk7ibdUk2+x89MdewE/aM0PJWzSJ7QZlrMKICxt
 R4mp4Q692hRf5fzvPxDlLpzGApqeRW8hpUK3dBesqYhAOyLJELSyLgrwN
 WsUXckouD4fG6ypFIgHPWciPPpfE0O4qt7dZOZ0HDli2Z1JeC2WRLeKVQ
 70Byw2KEkaJLe5d6TwMnKkDlpx/mvIMQfYaaersTFjn1i9rAoB2JFOxH3
 1LC0uhBoyFE3I/mKKZYa+rs7w1Cx3EBV/73A2Ucp844OMbFb3ZIyucb1S g==;
X-CSE-ConnectionGUID: vT0AI79bRaO8+Gs1Zlb2XA==
X-CSE-MsgGUID: pvIhDBbzQ2eYjZHz8+NYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75120349"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75120349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:30:13 -0700
X-CSE-ConnectionGUID: DexzIhLcQe+WfGIoAsQVIA==
X-CSE-MsgGUID: Ss7gSkCrTrGdWzHJ1ZLo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="253249050"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:30:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 14:30:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 14:30:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 14:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOzzZYPJVaOzYD8zhLuXWnimTkDe+B/LaC+MJQo5bf7gIOgKQYCVD+t/xnAp4BZxCrRTaFEnt4F1IGJBemzc5o8UTJ0o5u7ux/y9E4mmBYqh7AWjh+DIpk3wfKI/OPZ59Z4aIxb+oMp6LUqugJSbcXwxG+afSWXj0kePEpSu5YmTKFXNUhTPwJ+m3lS4vGQw0p1vVzpWhTfeclRclkFEhmX8/qzuDl+baVq0shtMXpyJbGwg8/dLgWBR9A82SrkG5FtAHDxi1MXjxqUqKcdJoFdPzSyf2lcLtAOkBshMj0gUzLTGAi+kysw0q3XJcAifHZHOF/NUP8e0BtMN1wdyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC/soodXfxAQ5vnpJDahS6MkoOnu92cHc5Ep93kvIfE=;
 b=QMcf+qshl/0+o1nrx3XEp0+a5Xwf1LvEDFBUBfRtJLVybBrvyFpWuJobOUqZw1WaiwdUFLhTsntqQu56oqXh1fPV6ihFJg5XT86Upxf8D09KPuHJkfreL+dAMgjGmPOf2KqPgidCqfOAPCLg0L8Pk6Vzoux6WxWxhCALauhktXRCYYzrhnnT78Myzm6I7QnEsTcsTF1PhBS46jZN38OxoJz2A/5gpaqL3JK3dI89BHREII1DRZnakkYO5ztEAxWtCckBpDP+M8ncSybBVb5krAaXSjckx1dZN1Z/X0UtiQwJz5TCUNKG2x5WAvKrwnYr0TeQZjlg7JVH0UC02LGhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 21:30:10 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 21:30:10 +0000
Date: Wed, 18 Mar 2026 14:30:06 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <felix.j.degrood@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Message-ID: <absZXhGMwjcNb-gn@intel.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87se9xpqub.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3a5083-6e8a-466a-65fa-08de85358887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: YUUHuT13svkGHfpBv5qej66E1y1qCfTuNP6Y27zFFk2l8Q4z1kTr0BVcpbi+7mGlybvJCSpHxFvUZUtA/BPVyE4PWgz/0aVAZEg7A6uEKszOdQtFfKZQWBa7573taxUGcFX5QvH/AY4Gegg3j7/xd9M+oNttM1cdodv8lH7WOAxBDLVg9r6qOEAfCFFQhcEgqQ+Epn0oNqE6O3jPmTwUDpCQWeEi5TTRbBzch5RDfbYpFqP0UYZtRDwN0ZduSsgL8rSpQiA2JivmDYlm9kIlOaxbV0excg5J9rHlA2w2j67EgXk+eFgfUfc5vV0tW7/pNZW9C8L2ldCSfWG9k0PF8soP+z5ImBWzrPBHWMwGQDzWW6IOQyyQyFiGeiAJUksvFsm3tDQRNe/48j60/+d5xJz0Nye9R/YCi90f/yIlS2zI3X2wT91zqbdHegxgaKns+rrjveGcmpWUIwd/0vgtV6K0oOb1vGwO8D9ZI8uu8dK0dhwJJYs/pUwtvZIDMRk5L1VnNAlxumwCJIuy0krcTFgPNrNC2TllWfvbIX+y6dQP0uN5dmzAvcDgQRosulnhnmRWa7CfTNkf/IOTSM5eFo6H6LmSouqwnSdxPaFrEhm8zI4+M+fG3jvKEQ4dYVDm5t47+UaRbuJVfTnOJ0UdWw0H5WXiOrJvuFbsLEiA9OUl+RusPEaKbPl2MzDcW8Yt2C3tQ7t3PflYF0XFvI8y/TmF510uIBOlrV+STiFrtXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2t2V0ltdElJWWpOOEpMeSsxTHZzcEZtRHM1N1lTMld1NnV0SWJ3TGUySDVR?=
 =?utf-8?B?TmRDYnB6bFdxT2FiZ0hGaWgycEowdmFaY1RZWFQ2VzYvUVgvdTNWUUZVa1dM?=
 =?utf-8?B?d2p4ZHBLQkZlT0pmWjBaeVNwVGU4anFDQzhOdG9MNUNGMHBqMlIyelBzaE1l?=
 =?utf-8?B?VDY3cThHYkZsbmlaRzlLQlhaRmdpMTdMVDJTZVYrQk1LTFF0RER1UStTeVAx?=
 =?utf-8?B?TGxVQ21Yb01RL0x3S0V6OXh6UGtuZ1BFcWVEM1Naekh0T1ovV0FSWk5IN2lm?=
 =?utf-8?B?NlpXd2ZOQlYxYnBDV0JzWnJRS2REUy9mR2JRd3N3UmlZWElzak1SOWxXdjVu?=
 =?utf-8?B?dzFBbTRiNGNlMXFhOHRpUUduQ0hIRWRpSjJyenNwVVZYQ2pyaTBLRTFRdzJi?=
 =?utf-8?B?SkRzVW9CTWg2b1JPL09NVXFoeGVrNTVOajgxSEZFUXdOQkdZWklFRmFBdk9U?=
 =?utf-8?B?dXVpVldhQUU4WU0ybkdUenNLa1c4dkIvZlU4WGFUQ2JuOVNmWmkwUUY3SlFP?=
 =?utf-8?B?ZEdKekNqWGxBWFl4SFBpTHl2ZUtFRXpXc1k5VmptM3pNNUFqbHhKenFvV2lK?=
 =?utf-8?B?bzhBZ0ZaelR3UFVOVUU0ellscDNBUUhNZWtXM0VwdVBwM2dhSjhwRndBNzl0?=
 =?utf-8?B?S2FycENpNXRaYmFpRGxqYUx3bEhlZzRDMklaVDJLbm9oRlNXL3dYU01DaHlp?=
 =?utf-8?B?UGI4dVdOdFFFQUdZc1cvWVdmc3JWanJIZmNEQ2hSOU1ydml3MTAzSVROVUtE?=
 =?utf-8?B?cTdPM0R4N0JpTXE0MEVZeUVORjcrNUVwcHYyU1duR2NOY3BIdnZZSnJuMTF2?=
 =?utf-8?B?ZDh1REp4UUNSL0xRTHpPNkYzNVlHMHM5SVJ6RDhsWVRMUE1jbkJYeHlaZjJj?=
 =?utf-8?B?WWk3ZSs2Nm9jRWtSUWdVNEdUSkFPaGUyZWdLajFJMmFicy9GNWl3U3ZSOGtv?=
 =?utf-8?B?dkkrbklZK3J4MFU4L05vd2RCY2VmMnVJNFJkY1ZrczRXb0F3NVhyMjQ1dnJI?=
 =?utf-8?B?aERyWXFqMWs4bEl6dWdPVkYrSGcvWWo1OFM1RlBDazRicWM1andoTTlrRWxv?=
 =?utf-8?B?R1hHbExWUXJRZzkrcjdCakF2bUF1MkxBRXA3RFVSVHpDb3k5MFZMcnFpM2py?=
 =?utf-8?B?NVJVV2lJT2ZYYmNBMGd4ZkFGK2hJM1RibUliZ0c0Q3FqbUlpR2lzT3ROcGNi?=
 =?utf-8?B?VTBvUDFna2pZTytwUm1lOURmcElKWnYxajJSbGlHbk00eWgyOHdINnl4bTkr?=
 =?utf-8?B?NENDZGZDdmV0djZUaTFlaE5tZmZhU3FXMkNqaFR2c1hqZVVFS1hHdm5tRUZ5?=
 =?utf-8?B?a1BOcWhNOFJ4bUs2QUVFaDJNWXNHZXI3WXl6emoxVVROd2VsSmVYVlhJeDdn?=
 =?utf-8?B?N1NMTVd5WUM5eWplWTgyMUZuVE5rcWEzcHlPNVVqMStSU0EwZ0o5UDcyTDBR?=
 =?utf-8?B?MFBBQ2VQR1czMmpxRWZJVzRkMVNWQWhIVE5HSFJHTlZKU21hdm8vclNseGVt?=
 =?utf-8?B?T3hJOTZLRmE2dVUxVWltS0kwbitQQTZNME1NVU1NbEZmTHFnT1JxUzJtck9M?=
 =?utf-8?B?dXpMcDBwQU1heVllWHNpZmw4cndLTGU1QXl0SDJWME5TWi91RTBYT3g4b1dk?=
 =?utf-8?B?MmF5U0x5RGNhalQrZ2VBZEJuem5qSmR6ZkJHQm96QkQvRXNiWm1FNlJwcTZt?=
 =?utf-8?B?WlNnVlI1T0dKNWFvRnU4R1ZtajlyVjZPTFlWanlkaEROSCs0cTFHd1lBdnBk?=
 =?utf-8?B?N1NjT3A1RjFFYjl2RnVKVzFpMlpzSUM5TnVmMUJaenZ0Z1d3cG1vdmd0Vm5E?=
 =?utf-8?B?TzJTalhYS0RJVkhSZVAwbHFOc3BVbm14b0MzZ3NLYU02MkV2dmR3NlB0Vmp2?=
 =?utf-8?B?MWxlYzU1TThyUFlJZEJQbWt3b1FqaldyV0REZi9LYmZFRFRZVnlpU3JQYW81?=
 =?utf-8?B?bWVMNG9rN2k0NENUVmhSZWdXMS96bWFrcTBvUkdDclZpY1lYNGZBajJNRE4r?=
 =?utf-8?B?NUdGZnJGbGw5Y0JlN1RodzM2dmQ5N2NVcTlhKytQanBYVGh6OFlOdFZDRnRo?=
 =?utf-8?B?R214SWwyMjJ6NHhhK2FKdmlwdjRYZURla3phVVZUQW03NXpwQm9TRTZRNEFz?=
 =?utf-8?B?bDVnSDg2QmFaNzRpeSs1Zk91V2sxVFgrd0VLVjhxeVJraENBZWVOMWN6WG80?=
 =?utf-8?B?NUswNlBPclA1WmR3d1NuM2F2Qy9US29BY2tYSHRFTkpvUDdFT3pTV1IzT3Fz?=
 =?utf-8?B?U2xnL29yWUkyNkxod2kxQzU1eEhVbmFUS2tmL1E2QzI1OURyMFcxOU9yMEU3?=
 =?utf-8?B?TFZpM1lGWHhrQmM3NjVUelhIM2ZrTlNFUHBmS3k4SU5aMllqbENnUStlVDhF?=
 =?utf-8?Q?Al8YFS+WC5staVgY=3D?=
X-Exchange-RoutingPolicyChecked: mQK+UCeQpcA/FDO+ApLkiJgRry5+YMbDVGQfigIHoeXLKvdtcSSsVucJpUL3Rn76YgPfBxPrPbtrq+kUR4ZfQfuXD2klVzb6DmGe4t6mZ5v2EWkO2pT2qU81PohdZGPE3B6x0EhIGG1BoRk0JBlukz5IwvxbewHprCCt4ic7HA70Sw2VDsOpVnTu7s9Zn+tYjJ1kBVHhSEFEQ9+J3Nw4IsrOejqWNp+8eZx1KKskhNyvUkzafqQPvqtVE9RxnhqFXCsVmDD0mNmhAS30wggRu7pW89vXGHHa4V0g7N+4jxv1gTDjbcZqMlMtD8l0/8Tb7aVcwJjBF5YEtqBK1utmxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3a5083-6e8a-466a-65fa-08de85358887
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:30:10.5919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85di82rti4cBO2XVF9/Glv3Qp0pPl/U/TdIXqv3a4uvrQjBp6spMsiiYIlcR9qMNCQMV9qLdtqoiSMYwrEzRb32qSHxz0a8uOLapykxSo6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Tue, Mar 17, 2026 at 11:57:32PM -0700, Dixit, Ashutosh wrote:
> On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
> >
> > If a reset (GT or engine) happens during EU stall data sampling, all the
> > EU stall registers can get reset to 0. This will result in EU stall data
> > buffers' read and write pointer register values to be out of sync with
> > the cached values. This will result in read() returning invalid data. To
> > prevent this, check the value of a EU stall base register. If it is zero,
> > it indicates a reset may have happened that wiped the register to zero.
> > If this happens, return EBADFD from read() upon which the user space
> > should close the fd and open a new fd for a new EU stall data
> > collection session.
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> > v2: Move base register check from read to the poll function
> >
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index c34408cfd292..7e14de73a2c9 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -44,6 +44,7 @@ struct per_xecore_buf {
> >  struct xe_eu_stall_data_stream {
> >	bool pollin;
> >	bool enabled;
> > +	bool reset_detected;
> >	int wait_num_reports;
> >	int sampling_rate_mult;
> >	wait_queue_head_t poll_wq;
> > @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> >			set_bit(xecore, stream->data_drop.mask);
> >		xecore_buf->write = write_ptr;
> >	}
> > +	/* If a GT or engine reset happens during EU stall sampling,
> > +	 * all EU stall registers get reset to 0 and the cached values of
> > +	 * the EU stall data buffers' read pointers are out of sync with
> > +	 * the register values. This causes invalid data to be returned
> > +	 * from read(). To prevent this, check the value of a EU stall base
> > +	 * register. If it is zero, there has been a reset.
> > +	 */
> 
> As previously discussed, the best way would have been to not have to do
> this. We would just plug into the handler for the reset message from GuC,
> rather than to implement a reset detection here (and in other places such
> as OA). But looks like if we do that, because of the way EUSS registers are
> reset, we can return bad EUSS data. So looks like there is no way around
> doing this "reset detection" here and a solution with the GuC reset handler
> would always be racy. Just for the record.

Thanks for the summary of the previous discussion. Yes, hooking into the
GUc reset notification handler will be racy and bad EUSS data will be
returned to the user space if read() happens after the reset but before
the GuC reset notification message is processed. That's the reason for
not taking that approach.

> 
> > +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> > +		stream->reset_detected = true;
> > +		min_data_present = true;
> 
> I don't believe we need to set 'min_data_present = true' if we are setting
> 'stream->reset_detected = true', correct? See if statement at the bottom.

Agree. The only difference is that the if statement at the bottom will
evaluate true in the current execution of eu_stall_data_buf_poll_work_fn
if min_data_present is set to true. If min_data_present is not set to
true, the if statement will evaluate to true in the subsequent execution
of eu_stall_data_buf_poll_work_fn() which is still okay. So, yes, we
don't have to set min_data_present to true here. Will fix in the next
version.
> 
> Also, since the write pointer itself gets reset during reset, didn't we
> want to do this register read only when the write pointer is 0 (to avoid an
> extra register read every 5 ms)?
Good point. I have thought about reducing the number of this register
reads. The poll function reads the write pointers of all the xecores.
A reset can happen anytime the poll function is reading the write
pointers of the xecores. If the reset happens before the poll function
started reading the write pointers, all write pointers are zeros.
If the reset happens during the poll function, several write pointers
read so far can be non-zero while the rest of the pointers after reset
are all zeros. The if reset happens right after the poll function, the
write pointers can be a mix of zeros and non-zeros.
I think the only time this register read can be skipped is if the
LAST write pointer read is non-zero which means a reset did not happen
before or during the poll function. Do you agree? I thought of adding a
check to the if statement to check if the last write pointer is
non-zero, but to keep the code clean, I didn't. Also, if there are
n xecores, there will be n write pointer register reads plus one
additional base register read, which isn't too bad? Also, hoping the use
of unlikely macro would not impact the performance too much.
> 
> > +	}
> >	mutex_unlock(&stream->xecore_buf_lock);
> >
> >	return min_data_present;
> > @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> >		}
> >		stream->data_drop.reported_to_user = false;
> >	}
> > +	/* If EU stall registers got reset due to a GT/engine reset,
> > +	 * continuing with the read() will return invalid data to
> > +	 * the user space. Just return -EBADFD instead.
> > +	 */
> > +	if (unlikely(stream->reset_detected)) {
> > +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> > +		mutex_unlock(&stream->xecore_buf_lock);
> > +		return -EBADFD;
> 
> The other option is to return -EIO here and implement
> DRM_XE_OBSERVATION_IOCTL_STATUS and return status from that. Let me think
> some more about this.

I think EBADFD is more appropriate errno than EIO in this case since the
fd is in a corrupted state and user has to close and re-open the fd.
Currently, the -EIO is used to indicate drop data in which case, the
user space can continue to read the data (faster) without closing the fd.
> 
> > +	}
> >
> >	for_each_dss_steering(xecore, gt, group, instance) {
> >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > @@ -692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >		xecore_buf->write = write_ptr;
> >		xecore_buf->read = write_ptr;
> >	}
> > +	stream->reset_detected = false;
> 
> So after reset, if a stream is disabled and re-enabled, we expect things to
> work again and EUSS data to be correct (without re-opening a new stream)?
Technically, yes, since the EU stall registers programming is done in
enable, things will work again if the stream is disabled and re-enabled.
But if the EUSS registers programming is moved into open() in the
future, things may not work by disabling and re-enabling the stream. So,
I think we suggest to the UMDs to close the stream and open a new
stream.

Thank You
Harish.
> 
> >	stream->data_drop.reported_to_user = false;
> >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> >
> > @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> >		container_of(work, typeof(*stream), buf_poll_work.work);
> >	struct xe_gt *gt = stream->gt;
> >
> > -	if (eu_stall_data_buf_poll(stream)) {
> > +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
> >		stream->pollin = true;
> >		wake_up(&stream->poll_wq);
> >	}
> > --
> > 2.43.0
> >
