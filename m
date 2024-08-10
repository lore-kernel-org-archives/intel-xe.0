Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B3AC3DA7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 16:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF7210E086;
	Sat, 10 Aug 2024 16:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9XYaxd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367D110E086
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723305697; x=1754841697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xfEdVGkN7BNmb5MO2YmO48VgHhKyKwVTRYndH83LdX8=;
 b=k9XYaxd9YFPt38aVIls/2u5U7zo6HBhjdulWo2Y+jngaCIPy6QMmBEzl
 LQjpKxAf3t8QY4tEHB65WHft745eghYx2OtvkGUXkorlnKmiSAKKFyCU7
 wwzj367+0CzwKQnXEFrhrj0o0Hv3pxBB9XPK1g4rK0BEjYSS0YXjljslx
 JLRQZjlA7bB+eD5EDM8mJpeYFojXOidyuR8ydWrE9ZuS2Md6lNW3UD1fq
 xsNW2VIkx+vW8r+OVCVHXbqirSZn6LH+hn25fzuoHjIicha1AdYLbAlJ2
 0uGfmeHbAJCg6Y+w1UtPfIKbFaqfi9kkJrk9aPsEWcIZuP3imVapJvrF8 g==;
X-CSE-ConnectionGUID: p1iMKhmUTWG0AZh4eB064g==
X-CSE-MsgGUID: da/YgTHHRyS/2DKLvYiJUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21276299"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="21276299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 09:01:36 -0700
X-CSE-ConnectionGUID: qhXaaPLER8KeuUFGcFDPVg==
X-CSE-MsgGUID: aHg9k/p2Sha/r1BSfFcSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="61981706"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Aug 2024 09:01:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 09:01:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 09:01:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 10 Aug 2024 09:01:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 10 Aug 2024 09:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym5RLp9wzJ96PtO35s1oPZL1ylJ4ZGHJTqNmcy/gUVH0ewDuQ/avsS4i+ecbF6Lb2yUydzuh/X3PCztOkH2ivyzsRTyaEqrCJHPD3kpXV1WaOFXEmF9z6LqGSC/76j4Gn4jidN9cRdQHwqRO5XtBd0yK9adfr3BXHeW48kCd50d5/E0+WAael4zYtnBe+U6h5GsPNUES7pg17fer83gVSBqo06/EMwX0IZuxdmUgwgum1DXUbDfXC9kZxo4fF6JwJ93158Aik6/Ay9ze916NU9so2deawvurCaxP0ktcEioFMV88hOeqS1VXeMoWWN0MLipyFw/7/6CbdHAWWBLxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ0zTtdOMnYljT/XkWe+IPMSEviFITG1ekBLFZqW7UY=;
 b=L7uTT2eVxBXTBPoqVFp2GvRMvENn8rW3mBoB3c/h7ot60lkRLiOLnCnrf7ha90qgBcxILcvDi7+AxQPwXiHIv/IvyoSHbwjW/Z0+aoAmtWPUV67sIfX40zM/2LBaIccoFhMosH3ZW4tTrWiwbuqqdih4f6Xtz6xjJX93vF3dl2OJRy/iyoyXmTyhdE+BHCVdwwJqz5wy46iaHqUPGtXb4Wx8Y6wzUn3DMFFZ8TikHMj65Ot4AjMvvVmMIl1yJImP/Ppr9vet4DFi60t/v5TSAHY9I8GnW/uvWg6xkfy/95mZu28I6vlHAbE5CQlyZvKaWr1YSZPQeTRc0V2Y7noRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Sat, 10 Aug
 2024 16:01:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 16:01:31 +0000
Date: Sat, 10 Aug 2024 11:01:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/1] drm/xe: Add driver load error injection
Message-ID: <wfcpm424tnkc26c5tepur53xwskeig7wletqlccbo22ah4nxaf@w67iw2q4sv4a>
References: <20240809224424.3212551-1-matthew.brost@intel.com>
 <20240809224424.3212551-2-matthew.brost@intel.com>
 <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
 <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: a94503cf-a7d6-4d07-e1d7-08dcb955b37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GljKaJJOHGcC5LyLnyMHn8jLZq1yxOpLA/6Sg4sUC3IhQf7N9F3EeTi7twOM?=
 =?us-ascii?Q?ZnH39W+QulcV/KReVf2xSBHbyJrQiytnzFeUxXkfB7m5b3r8cS8Xz1D6f1N4?=
 =?us-ascii?Q?kzqGrmWYCqm4HrMke7iCm+OQtxqDK2pll2aeQ7lkfRV6mZW9v/MQtXRe3Jon?=
 =?us-ascii?Q?86xHUkwjD2gTGiVtsTa/mivc+/JqjvQZLwggugvxfovzuoY/0eutprRY9iHb?=
 =?us-ascii?Q?ajiKwBG+derlaTwcJkrbT79yWiD7Y7f0aDRv9UkIEqJ5kZVnVLcYU2Gdy8Kw?=
 =?us-ascii?Q?qB5VpSYuun0uNo+OYWXrP+JrMiIzdKSlX+Uhv9rxKiNDL/IbXY4Nnu2NHOab?=
 =?us-ascii?Q?WBZffUqEDknJfdQUtGO2fbfrM0C1ipO7uxeIP0Mk5myo+JvC3fW8GNNs5qgl?=
 =?us-ascii?Q?aBu/ebJfvxpG9BsTWyu73/6ImIgwhWc6IPsHUXfpzDH22J7MRT9rxnTZTaOa?=
 =?us-ascii?Q?XE8afjB3pO2rjA8QDR8NhFTCizPt6YHztY7qIUxNgKoMCdef/jivussvl1sr?=
 =?us-ascii?Q?k1pch08XtLc2HCwjVxk1pVpy67eZOKonTvm0X7QRwh6kwUsHpIrDz7ezzL6v?=
 =?us-ascii?Q?5u/+PqF8iL5bU5bU/xG4LwlISHf18gKxY3BM3awHoQeQqq1VDZZwZ6OAlyf8?=
 =?us-ascii?Q?ooqlK/qUeb5nFd5yN4jx2+XL8+yEsP/iRG4AHfHR9Ixg/7QDEziS9T7qTzp1?=
 =?us-ascii?Q?as6ekTkZVu6sC8iJYQrVCwdiWeLZl74zZWo1nE2v1xPnOwm3C/4smJ/2D44K?=
 =?us-ascii?Q?jXHk9HoUEA90oA2YfbHbSTczeMWLf/7yt7OkOpgSzMldBGOLbrLgNxYyeydO?=
 =?us-ascii?Q?43TzhsW9PmQEc31J6y7C5Yb2sPT4nox7Y94EDDCuDtN9MixcPiDctJtit4Nr?=
 =?us-ascii?Q?SRnkhTULkyx9jA85YT76rSNSjP3stklAs2c+E2dxurGPQiqH78OdFccK+4Go?=
 =?us-ascii?Q?F+eB/TDMhHTxFGcaLccA7HnaPr9H7XN+bsMV8LkCJA1gTF/W1lrlLQZ70E8H?=
 =?us-ascii?Q?i59cuu2++3z4RJPH2a7V4Yqa+5QPu4XdhhuKifQi60R5aT9ovm6HzZhAtj3H?=
 =?us-ascii?Q?nF9bh6UsJvBt9jPkGeXX3MvWFCYmpp1jRTHak/Np4j9hYAc6oDWf7Z2Agh+T?=
 =?us-ascii?Q?KDEhRqHI50ab6unbAIlMNd7Dk3EiQyp9bQ67qwQ6fHSsBeG1+/8RBe7ceuaP?=
 =?us-ascii?Q?hhwUzYbdCJLKnMVnVBrOPldMkRJKXJhyzYFHSvVtyFLEW4msnmZ7/TFHt7/5?=
 =?us-ascii?Q?qifaMrdVVpWapRzewKe5pBR1Ox81kqJoc38yJm7NK5Hp4tZ1GOG191oZPU/3?=
 =?us-ascii?Q?FVk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yBRO1bxSFV7eHPvy+nlkc/pmFD66Z1y294C3WBro3RzeInlKWLU/cEHKv/Zu?=
 =?us-ascii?Q?isOQYNK4MYFiXavBUqU3po/g6ebyomlf+mnZdy2tQmzuonzPqnzIgos+oqT0?=
 =?us-ascii?Q?Vkjuo9nP51j1dmzQZlzRRsR7X3wAdLfmYbazGOld+fW3xxEglUrRIDukxEf8?=
 =?us-ascii?Q?g1NTPFEzIKRGEaMISdNHgzoCxcEI8olm3odNM11ki8fWWovAcU0XZbEpoT0i?=
 =?us-ascii?Q?JztC/T0YdjqrbYQ9ndEDf+UQKn2V3u2BvNPRBH9f0VmTC6HZuuyc8vE3M77J?=
 =?us-ascii?Q?8Bbp1SaqFnwKBJDY4e26Y5g9+6PfJCVbSlxq0lQKE4RzKzWZrEfwFlKTctI4?=
 =?us-ascii?Q?ew7D89B6eIz/rn9hls0f3bvYTJu0EN2RuQyiZ6uVbm0GTsfz+KvnxjTlorR6?=
 =?us-ascii?Q?lTYBHjIGMvHEQ9K7yR4EtwihjjfK2KWoMUCV1/IzzMlbqv14fWLPw8RMS/Eg?=
 =?us-ascii?Q?s7c3kMPq9tPltqtUgU7BOxEuEPeksnrze+gjr2W4VvWafLjKbu9JPSls/P6m?=
 =?us-ascii?Q?1pL5GLe/U6BZ5coBI2zhbEJDw+42qR77UWL0iccyzpeLfJTt9PpQp2UC1ZtS?=
 =?us-ascii?Q?QYrw2p5N4Es2pkpGHDdP/KTKQgokH/rvKKtvnvjZrG238eJptCE9n5qXWwZy?=
 =?us-ascii?Q?AE1DL0vKkaPLDdy5K4NdVBWTlS4bjEKdqkVUp5OlBLZ/KxMsOJwU0ZrjIyX6?=
 =?us-ascii?Q?4kdJ35tBtY/cAelqYZqOC2hA1i+NsUbXLO/8eLtQqwSHRkd3makIseTdgi/J?=
 =?us-ascii?Q?9qtCuUxFlIwOsUzuCNueWAHGa3+/NjW+xq4Oz/cGffJQpcFRyHoTLCguPgNx?=
 =?us-ascii?Q?jeDdqT+vQsixLz0PF3kS2fi1pxIN7Q47TuGu0xY+7ceP4xHFD6WpgMx0vHd2?=
 =?us-ascii?Q?q4D27SvrYKDsovL2+30vSmeGEK2dso8ocBNRdbfGKXNr+0jJ3rgvtDkLqUmt?=
 =?us-ascii?Q?UlFhrrQbAVOJGcJI5B+yV0VdzMkPsEoyixU/pG4se9Imil5BPsLj4fBa8YJb?=
 =?us-ascii?Q?SdtekPpZsLF/5CvlwDAiC90aHiYEiMvU3rIpPxcQ5PNWLRLKP3hTNmdCA0xx?=
 =?us-ascii?Q?E5iSTZSsKuhO7MCMM0uYAR5SeEHZtqATK+lvrITn8KS0zMx6gafSj3RJqhpm?=
 =?us-ascii?Q?q3Z4MuBB3Zv3nPiGT5BdmX9vRrlS7Q4ZJPIBkEAOerTzlKvfWQ7SMh7FGw9N?=
 =?us-ascii?Q?JsiE74bL8/ShZMiZs3fd0jFfhzq3Tc2vp5V4fK9Xrv560p5KC4E2odBniavG?=
 =?us-ascii?Q?pMKfJNGCjXl/6KQmwxrkYLD4F/P8rU5KFcI4dqLJF2odABevaiTh9dQzzFhu?=
 =?us-ascii?Q?ptxqrfWxJJ868MVfwE8LPrxotpdKjwst1GVzPqYriwZx6iRg0Jc//i2JXCAZ?=
 =?us-ascii?Q?TPj2vJoboo28qgIKXN7+QvoQZR80FFRBYA9DnfpDK4pHZmyInyXmjXso4ckM?=
 =?us-ascii?Q?HqyGmHdEF1eFjF2ZxFoN7qBrmZYWwdMmwtPtyCBksFi/ZR/oQd6fAo8s3pKO?=
 =?us-ascii?Q?HXWF1ZDUuobkmyNGRJmgtYFJlvwJby2GJYqDfdHyL0EpMf/ogUzci/3UO86U?=
 =?us-ascii?Q?fg55unDq+6hmtnPH940RXShULSiNN4s7RWmhz+q66YR14gJG5X/3dXVqkun/?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a94503cf-a7d6-4d07-e1d7-08dcb955b37f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 16:01:31.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exIxb3mVPFLwfGxuwHKIxQj1C5senLlLnrkU7XgUzzb+hOtE/R+KN1q4S/KTxxRve1h0ptfeJo0Yn90NlTad/U0ub4SLXWiXyjW7pBtVDu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
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

On Sat, Aug 10, 2024 at 01:41:51PM GMT, Matthew Brost wrote:
>On Sat, Aug 10, 2024 at 12:16:32AM -0500, Lucas De Marchi wrote:
>> On Fri, Aug 09, 2024 at 03:44:24PM GMT, Matthew Brost wrote:
>> > Port over i915 driver load error injection.
>> >
>>
>> I don't like much the manual approach, but it's better to get the driver
>> not exploding. Then we can think of replacing this.  Some comments below
>
>Yep. I chatted with Rodrigo about this and we agreed their isn't a great
>way with the existing kernel error injection to easily get coverage like
>this plus a very simple test case [1]. Agree longterm we should not
>invent our own things and come up with either a kernel or drm level
>solution.
>
>In the short term, yes this better than our driver exploding. View this
>as a force probe blocker, so we need to get our driver fixed in a matter
>of weeks and this seems like the only viable path for now.
>
>[1] for i in {1..N}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done
>
>> as I think some of the checks are not right.
>>
>>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
>> > drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
>> > drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
>> > drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
>> > drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
>> > drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
>> > drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
>> > drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
>> > drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
>> > drivers/gpu/drm/xe/xe_module.c       |  5 +++++
>> > drivers/gpu/drm/xe/xe_module.h       |  3 +++
>> > drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
>> > drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
>> > drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
>> > drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
>> > drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
>> > drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
>> > drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
>> > 19 files changed, 135 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index 1aba6f9eaa19..f6cd13ed6d20 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>> > 	if (WARN_ON(err))
>> > 		goto err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		goto err;
>> > +
>> > 	return xe;
>> >
>> > err:
>> > @@ -477,6 +481,10 @@ static int xe_set_dma_info(struct xe_device *xe)
>> > 	if (err)
>> > 		goto mask_err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		goto mask_err;
>> > +
>> > 	return 0;
>> >
>> > mask_err:
>> > @@ -580,6 +588,10 @@ int xe_device_probe_early(struct xe_device *xe)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	xe->wedged.mode = xe_modparam.wedged_mode;
>> >
>> > 	return 0;
>> > @@ -995,3 +1007,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
>> > 	for_each_gt(gt, xe, id)
>> > 		xe_gt_declare_wedged(gt);
>> > }
>> > +
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
>> > +					 const char *func, int line)
>> > +{
>> > +        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)
>> > +                return 0;
>> > +
>> > +        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)
>> > +                return 0;
>> > +
>> > +        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>> > +                 err, xe->inject_driver_load_error, func, line);
>>
>> I wonder if it'd wouldn't be sufficient, for debugging sake to use
>> "... [%pF]", __builtin_return_address(0)
>>
>
>I think that probably works. I their a way to decode the line number
>though? The line number is a bit more helpful can some hex value.

the format is actually 

theres addr2line, but since I may or may not have tool handy depending
on the machine, I always use gdb

	gdb xe.ko
	...
	l *(versatile_init+0x9)

which gives the tranlation. Looking at https://www.kernel.org/doc/Documentation/printk-formats.txt
(Symbols/Function Pointers) it actually suggests using "%pS" as print
format when using __builtin_return_address(0)

Anyway, I won't oppose leaving this they way you coded though.

>
>> > +
>> > +        xe_modparam.inject_driver_load_error = 0;
>> > +        return err;
>> > +
>> > +}
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > index db6cc8d0d6b8..4f7e9cdac9fe 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.h
>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > @@ -179,4 +179,19 @@ void xe_device_declare_wedged(struct xe_device *xe);
>> > struct xe_file *xe_file_get(struct xe_file *xef);
>> > void xe_file_put(struct xe_file *xef);
>> >
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +
>> > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
>> > +					 const char *func, int line);
>> > +
>> > +#define xe_device_inject_driver_load_error(__xe) \
>> > +	__xe_device_inject_driver_load_error(__xe, -ENODEV, __func__, __LINE__)
>>
>> is -ENODEV the only error we may want to inject?
>>
>
>I was little lazy here, should be easy enough to add another macro (the
>i915 does this) to control the error value. But in general I don't think
>we really care about the error on driver load as we pretty much always
>just fail the driver load.

ok, if we don't care about the error code in any existent check, then
let's go with the simple approach.

>
>> > +
>> > +#else
>> > +
>> > +#define xe_device_inject_driver_load_error(__xe) \
>> > +	({ BUILD_BUG_ON_INVALID(__xe); 0; })
>>
>> if the suggestion above is not feasible, then maybe better to leave
>> this outside the ifdef and provide a dummy
>> __xe_device_inject_driver_load_error() so we type-check?  Or we can
>> type check manually too.
>>
>
>You mean?
>
>static inline xe_device_inject_driver_load_error(struct xe_device *xe) {}

	       __xe_device_...

so it matches the other side of the ifdef. Then you leave the macro
outside of the ifdef and always call the function.  The compiler should
eliminate the function call.

>
>So we get type checking?

yeah, otherwise a mistake like
xe_device_inject_driver_load_error(&xe->drm) goes unnoticed depending on
the build config.

The other alternative I proposed is to use
__builtin_types_compatible_p() if we keep the macro the way you coded.

>
>> > +
>> > +#endif
>> > +
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index 5b7292a9a66d..3e620314eec2 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -484,6 +484,10 @@ struct xe_device {
>> > 		int mode;
>> > 	} wedged;
>> >
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +	int inject_driver_load_error;
>> > +#endif
>> > +
>> > #ifdef TEST_VM_OPS_ERROR
>> > 	/**
>> > 	 * @vm_inject_error_position: inject errors at different places in VM
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 58895ed22f6e..8209079c0334 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -389,6 +389,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>> > 	xe_pcode_init(gt);
>> > 	spin_lock_init(&gt->global_invl_lock);
>> >
>> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
>>
>> for the ones I check before this, things are ok. For this and some
>> below, I believe they are misplaced because this currently is not a
>> failure point. Adding a return error here is wrong IMO because it
>> changes the expectation: the function was expecting that after
>> xe_wa_init() there are no more failure points so nothing to unwind. If
>> you inject an error here, you may be then trying to fix a non-existent
>> bug.
>>
>
>I pretty much agree. I really hacked this together as fast as I could
>without tons of deep thought as a PoC + to see what exploded (quite a
>bit so far).
>
>But our error handling should be robust enough if I coded this a bit
>goofy, it should work.
>
>> From what I can see, the a valid point to inject an error is always when
>> we are already checking for an error (and if we aren't then we should).
>> So they should be always in the pattern as the ones above...
>>
>> 	err = foo();
>> 	if (err)
>> 		return err;
>>
>> 	err = xe_device_inject_driver_load_error(xe);
>> 	if (err)
>> 		return err;
>>
>> I think that also means we can do better:
>>
>> 	err = foo();
>> 	err = xe_device_inject_driver_load_error(xe, err);
>> 	if (err)
>> 		return err;
>>
>> And in xe_device_inject_driver_load_error() we implement it
>> to first check `err` and return it if != 0. This way we only even try to
>> inject errors in valid points, and don't risk getting problems if a
>> later patch mistakenly update the `return err;` with `goto fail;` in
>> one place and forgets the other.
>>
>
>I do like this (xe, err) semantics with if != 0, but think it should be
>seperate macro / function than the one in place as (xe, 0) for cases
>without an existing error is a bit goofy.

works for me

>
>>
>>
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > @@ -570,6 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>> > 	xe_gt_topology_init(gt);
>> > 	xe_gt_mcr_init(gt);
>> >
>> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
>> > out_fw:
>> > 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> > out:
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> > index ef239440963c..897815ddf954 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> > @@ -57,6 +57,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index de0fe9e65746..980691c178c4 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -354,6 +354,10 @@ int xe_guc_init(struct xe_guc *guc)
>> > 	if (ret)
>> > 		goto out;
>> >
>> > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
>> > +	if (ret)
>> > +		goto out;
>> > +
>> > 	guc_init_params(guc);
>> >
>> > 	xe_guc_comm_init_early(guc);
>> > @@ -411,6 +415,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>> > 	if (ret)
>> > 		return ret;
>> >
>> > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > index d1902a8581ca..1944912ef9b8 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -402,6 +402,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>> > 	struct xe_gt *gt = ads_to_gt(ads);
>> > 	struct xe_tile *tile = gt_to_tile(gt);
>> > 	struct xe_bo *bo;
>> > +	int err;
>> >
>> > 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> > 	ads->regset_size = calculate_regset_size(gt);
>> > @@ -416,6 +417,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>> >
>> > 	ads->bo = bo;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > index beeeb120d1fc..76a26aaabb13 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> > @@ -197,6 +197,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>> > 	ct->state = XE_GUC_CT_STATE_DISABLED;
>> > 	return 0;
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> > index a37ee3419428..f26c37e3ee3a 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> > @@ -82,6 +82,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>> > 	struct xe_device *xe = log_to_xe(log);
>> > 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>> > 	struct xe_bo *bo;
>> > +	int err;
>> >
>> > 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>> > 					  XE_BO_FLAG_SYSTEM |
>> > @@ -94,5 +95,9 @@ int xe_guc_log_init(struct xe_guc_log *log)
>> > 	log->bo = bo;
>> > 	log->level = xe_modparam.guc_log_level;
>> >
>> > +	err = xe_device_inject_driver_load_error(log_to_xe(log));
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > index bdcc7282385c..1d52b1f57f4c 100644
>> > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>> > {
>> > 	size_t tile_mmio_size = SZ_16M;
>> > 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>> > +	int err;
>> > +
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>>
>> yeah... I think this is a valid one, because it means
>> "handle errors from this function". As long as it's the very first thing
>> in a function, not leaving side effects, it should be fine, And in this
>> case I'd do:
>>
>
>Yep, I think beginning of most functions in the driver load call stack
>is likely the correct placement. Again didn't really have time to do
>this perfectly. I'm hoping to find someone to own this full time next
>week and your feedback here it helpful to get this done correctly.`

humn... to be able to set the value to an arbitrary high value,
shouldn't we at some point force the param value to 0 so we stop
checking for error injection after the probe part?

>
>> 	err = xe_device_inject_driver_load_error(xe, 0);
>>
>> to follow the logic I mentioned previously.
>>
>> >
>> > 	mmio_multi_tile_setup(xe, tile_mmio_size);
>> > 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > index 7bb99e451fcc..972b64a9f514 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.c
>> > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > @@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>> > MODULE_PARM_DESC(force_probe,
>> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>> >
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);
>> > +MODULE_PARM_DESC(inject_driver_load_error, "Inject driver load error");
>>
>> hum... are we doing this when loading the module?  I guess
>> inject_driver_probe_error would be better as those tests are not per
>> module but per device (and instead of modprobe, we could test by
>> doing bind/unbind).
>
>So s/inject_driver_load_error/inject_driver_probe_error/

yes

>
>Makes sense.
>
>Matt

thanks a lot for doing this and uncovering the existent bugs

Lucas De Marchi

>
>>
>> thanks
>> Lucas De Marchi
>>
>> > +#endif
>> > +
>> > #ifdef CONFIG_PCI_IOV
>> > module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>> > MODULE_PARM_DESC(max_vfs,
>> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> > index 61a0d28a28c8..409ea10be942 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.h
>> > +++ b/drivers/gpu/drm/xe/xe_module.h
>> > @@ -20,6 +20,9 @@ struct xe_modparam {
>> > 	char *force_probe;
>> > #ifdef CONFIG_PCI_IOV
>> > 	unsigned int max_vfs;
>> > +#endif
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +	int inject_driver_load_error;
>> > #endif
>> > 	int wedged_mode;
>> > };
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index f818aa69f3ca..8b278c83128a 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -629,6 +629,10 @@ static int xe_info_init_early(struct xe_device *xe,
>> > 	if (err)
>> > 		return err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > @@ -645,6 +649,7 @@ static int xe_info_init(struct xe_device *xe,
>> > 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>> > 	struct xe_tile *tile;
>> > 	struct xe_gt *gt;
>> > +	int err;
>> > 	u8 id;
>> >
>> > 	/*
>> > @@ -745,6 +750,10 @@ static int xe_info_init(struct xe_device *xe,
>> > 		gt->info.id = xe->info.gt_count++;
>> > 	}
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> > index 9f3c14fd9f33..64d992c12364 100644
>> > --- a/drivers/gpu/drm/xe/xe_pm.c
>> > +++ b/drivers/gpu/drm/xe/xe_pm.c
>> > @@ -231,6 +231,10 @@ int xe_pm_init_early(struct xe_device *xe)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > @@ -264,6 +268,10 @@ int xe_pm_init(struct xe_device *xe)
>> >
>> > 	xe_pm_runtime_init(xe);
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> > index 5a1d65e4f19f..1e738f1d80df 100644
>> > --- a/drivers/gpu/drm/xe/xe_sriov.c
>> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> > @@ -102,11 +102,17 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>> >  */
>> > int xe_sriov_init(struct xe_device *xe)
>> > {
>> > +	int err;
>> > +
>> > 	if (!IS_SRIOV(xe))
>> > 		return 0;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	if (IS_SRIOV_PF(xe)) {
>> > -		int err = xe_sriov_pf_init_early(xe);
>> > +		err = xe_sriov_pf_init_early(xe);
>> >
>> > 		if (err)
>> > 			return err;
>> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> > index 15ea0a942f67..2d25c7b59b0d 100644
>> > --- a/drivers/gpu/drm/xe/xe_tile.c
>> > +++ b/drivers/gpu/drm/xe/xe_tile.c
>> > @@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>> > 	if (IS_ERR(tile->primary_gt))
>> > 		return PTR_ERR(tile->primary_gt);
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> > index 0d073a9987c2..a3786020838b 100644
>> > --- a/drivers/gpu/drm/xe/xe_uc.c
>> > +++ b/drivers/gpu/drm/xe/xe_uc.c
>> > @@ -62,6 +62,10 @@ int xe_uc_init(struct xe_uc *uc)
>> > 	if (ret)
>> > 		goto err;
>> >
>> > +	ret = xe_device_inject_driver_load_error(uc_to_xe(uc));
>> > +	if (ret)
>> > +		goto err;
>> > +
>> > 	return 0;
>> >
>> > err:
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > index 564e32e44e3b..e558715d8027 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > @@ -821,6 +821,7 @@ int xe_wa_init(struct xe_gt *gt)
>> > 	struct xe_device *xe = gt_to_xe(gt);
>> > 	size_t n_oob, n_lrc, n_engine, n_gt, total;
>> > 	unsigned long *p;
>> > +	int err;
>> >
>> > 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>> > 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>> > @@ -840,6 +841,10 @@ int xe_wa_init(struct xe_gt *gt)
>> > 	p += n_lrc;
>> > 	gt->wa_active.oob = p;
>> >
>> > +	err = xe_device_inject_driver_load_error(xe);
>> > +	if (err)
>> > +		return err;
>> > +
>> > 	return 0;
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>> > index d3a99157e523..edaad1c93e58 100644
>> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
>> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>> > @@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>> > 		return -E2BIG;
>> > 	}
>> >
>> > +	ret = xe_device_inject_driver_load_error(xe);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > 	if (!locked)
>> > 		ret = __wopcm_init_regs(xe, gt, wopcm);
>> >
>> > --
>> > 2.34.1
>> >
