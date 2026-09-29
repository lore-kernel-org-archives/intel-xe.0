Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35EFCA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 05:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4F410E5E4;
	Tue, 29 Sep 2026 05:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGjqoVRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B011E10E5E4
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 05:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790659541; x=1822195541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=l9Aub5flHAsclvVZe+D3QbEGwdFEHKrSfqcPe4YxaNU=;
 b=bGjqoVRf8TQkjBQDdfgS8FhtfqyhBInoyiPAflH+GLAMpfPZePzoEHQg
 9SUXeIaSFdQ3GFtXtrPKq24VihvD9gpUZkv3ltvGBAv6yT7mx3B3iYkMQ
 Z80wLv1JW0aBAHNeBuI44NbOI/yDJ9VOcQTUDFfJ0HWy5ePuA152q/jPl
 xtdEjRn2xUhflpNmsGj5izR4irk2PH5x0NUoDkFJk6y4Uu1NWMW03JxYi
 aOwh3RRn5FfmrvmwNKI3trjqQA8zF8BjnP0CuezSw6mBHCwgdW+JC03Xe
 O8cPzhkKdJA/FTRp94vDuNyRdDUGu4GYosQeyOs7QgkNI5yViSd4PEIfv g==;
X-CSE-ConnectionGUID: CMmxc/F8QaCVQF/UvNOFdA==
X-CSE-MsgGUID: h1tog5KTTxquH1+Llx6D7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95181452"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208,217";a="95181452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:25:41 -0700
X-CSE-ConnectionGUID: /PXXj/huT32aK8k0xdH5Lw==
X-CSE-MsgGUID: AlwM2b2TT1SztR/z+URIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
 d="scan'208,217";a="274471202"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:25:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:25:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:25:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2YhcZkwLygR6LF6CP5jvPxj8wuIyRr1wPj50PkhNCsUv9lEh2hWMUB/AVhhXVhGfJ02b4v1rtKSNuLdHYxe983JTRopt6xRg/gy2X/H8IZufRE9zTUya9JRIRJnkuHkRWhUvdEW9nbZepr7TbQBKOLoOyO4dsXA9agCB9yqoVy7oBG+9bQcSLZBz2M/+7oI784+u+LLxtk4daWv2Vl1qtslXVZloAfzo7pW4hp14fZf/d6OTJwu31C9sV/3H7QNz80RxIT0KSN8yFgPvAgtzfXBsRcw7mEGpjAI70llpcL1cIfhECSjtvYbGKi5NtUXzeBtbqcbDmU2NPcLRiEsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBQPZ8oLv2FrwjmG4DoSvIdeDWmebWaDNrE1oQdUGMA=;
 b=LMnpIjLBRCmeeuwVpq9cuIJ5YQpg2frDsaoUZE1sTvvuRXKC2f0a4Ychhlf4J1C5Nh/HVL6+e2efCBsUIOe83AFwU4yc2Vdkrz1X1aScCOLpAqPXeXmOTOGQfmKaqwlS2QdXEdW/DFcuIgw0DGB1ykwDgF6jJhLvG7Mqy/0UcyucJREunFYqQFTq45gsyYanSTjOYR37pKfRYbASY8FLvygy1af48JC8xgB0aTWnzHll3tBBxHrvQScmVxwrbCUTDWENkj8RBDc+3q0yfO6Zr8wBjsoOTJv8IHOFF5d6mlHax0Xazd1TswIbyZ+GZvoW8mtmwFDv4ouLdiYgHt0uHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB7564.namprd11.prod.outlook.com (2603:10b6:510:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:25:33 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 05:25:32 +0000
Content-Type: multipart/alternative;
 boundary="------------Ry3r25y0ooXv0Kse12Y1NHAE"
Message-ID: <bd011660-a6de-49ac-91ec-a8c01ed9896a@intel.com>
Date: Tue, 29 Sep 2026 10:55:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] drm/xe/hwmon: Report errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-4-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5PR01CA0279.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1e4ee5-a7c7-4e7f-3958-08df1dea14ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|22082099003|18002099003|4143699003|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: V/zBzfiuL38pIYU0qkJ/owmF6uiyZUmCTCRRG3JU05Gff8eeRlL6bvwcNfgH9XFKub5hNdLGfbN3PR4u5yo1ne3FmWF3c7MV9fzjQumFoW0CS63EYnub0Fzzzq5lCK7DPYUddZD6hnOVU5RZMN2Rt2HlvmT6Q9TTdwV6jRXIzGjnlT9CoHcvxfURMjKNNUTuIMyFE8DNKOzIndMNwrEp653W0GmSts7r7qlcUF8i4whxmicxRCGZLGEzG/e8tNX0g+njk5v4nbdJ77yPt1euHesQdfQUZI8EozEzS2klr2XntNQwA6IhRGDaJHWjXplt7/mDUJnbBI92AWPnnvyJ2apXKKZdt57zP9rH4Ig14ecktZNSGdQRBsv+uZbmAlPdGYIkPilcez28/RqH7dCmWPgoSYmymjadnF3I2LG7/EvwVMJf/iP++M3bugFoUnxGr6QlrUzFAdN54T0PZTndVo57DkycRCwX838dhiW2mAOdNxgfPpi1Uwu1scK90yinRxzz3uwiVa2gq7J+LHiT4sD2DMTxr0OW/fVFoKbquDndmWGQcByIGMIXoMdeLA8p3AopvB+oVv8e/Sv2LomS7dmuBNbw+5+7p0swzgQMbktl40as2UT90dA/YzGs6ns9IIuGs5xIPi1dwwQ5iAA5ZprtoDmdmppwXDwvfOx8Xwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(4143699003)(8096899003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlpycEUyVkJWMnRidldGUG05UjQraGdYV2psNjlhcW9EaC8rbzJTWmpMVzc3?=
 =?utf-8?B?TDlrY2owR2Rxc2dZdm9ybGs2UEtMbldobEhudE1vR1ozSlJyVGJScS9kaDVS?=
 =?utf-8?B?NmNWaHZoRGJtSUVMRC96TkEwK01Zc0xlU0tMUThBaUVzcThsVU0vTGR2dFpy?=
 =?utf-8?B?N3Q4N21QaGhiaHNUUkZXVFZrMTRmNnNCUWUydmxJcjhiRzExVmVLbytISUEr?=
 =?utf-8?B?NDVoa3VTdk0vRWFxcnl4WGZqeGZqYkk4OUZocTF3OFhMMnhMaUVyeDdEemov?=
 =?utf-8?B?SExEcjdHUm9Ya2lSTXh3YVhBTlY3dmo0czhRZXRnM2V4RnprVFFaQ0Ryc3hy?=
 =?utf-8?B?VkdPSWM3REhOcTlFNTVpeXphK0hGSUVUMklQVUcxVFpyTmpDV1VJNThKcW51?=
 =?utf-8?B?WWkrZkM1emxiRmEwUWZVTXpsOXgxNjZUN3FxODY2SjZBd3BTYkVNNFQ4cGJN?=
 =?utf-8?B?a05iV0hUbHlrZHBCa09qK1N0SENDajdGTmo5Y21IY0dXQkRjU29rUzY3eWdm?=
 =?utf-8?B?ZUJVa1pMekRkamtoOHVYVE9VeTZrL3JnTlcvR0xSYloxa2RIYzQ0dHJSS3Bt?=
 =?utf-8?B?aGx5MkJWcFlENFE0K1VHaGxrbjhrVWJjaHJyRnA4aEJTblZ5cEtoTnphMVZ1?=
 =?utf-8?B?WWpZaHBSbENxeTJLQjI3K3gwZmFjWlJJRG1OK0gwbTgzeEZTemlzdUQwYzJS?=
 =?utf-8?B?a25DcmJpUW1kSGFWU0xRbUNUUTY3amxQMjBYQk5iRjVDWXdIbzYzMzVPU1A1?=
 =?utf-8?B?QUwrWEIwZmd4OHdDSVc0MHQxanhqUlNvd3VOV1ZyQ3pldDJjektiMUdJT29D?=
 =?utf-8?B?OVZDd2xlekZ0K0xTKytHTHN5b0s4L3k5MDR3OEVWUko3ckVNa05TTSt1di9j?=
 =?utf-8?B?MUt3bGtPSUlQL2l4ZHFxdUVLbllYWGZka2FidXQxckFSMjZ2L0NiTDFYemg2?=
 =?utf-8?B?dUtBWGFYcHBPWG1TWHJEbFRyMGNKbTJ5TWVnendkb0ppTjNWZ295NWJBSHpT?=
 =?utf-8?B?YTNHQnRIdTZPUjJMZXcwZTdORmpReFpWQjBva2xONERrbWJBd3dBSXFMZ3ly?=
 =?utf-8?B?K1dIa0R2N2VKUmlwVVZUUEFQQU5Xc2NXR0dTUXhWR0JkL0treTUyekpLeVlD?=
 =?utf-8?B?NWJ6dW85dnZlYmZ1bTZjUzAvV1g2WXlXSm5VR01LQUN2SzYxNkxBV1QzUTlI?=
 =?utf-8?B?aVBab3lSOFNHVjB5elR5Ym5kdnBVM2dlZFpEbUxFOHN0bUN5WW5JeDZtNXF2?=
 =?utf-8?B?MFpzdm0wMFpOdlp2WFlHWnRFNUxrbEw1MWJJSGxEc3E1enUvaDFHZm5ObFYw?=
 =?utf-8?B?SGt2QVg3bHJRREg0c24vbG5ZaS9CaDV1S3BOWUVkWXJvcXBqRTlJSzBKWTc3?=
 =?utf-8?B?NlJFT0IzOWZVZzhpOEYzMFl1MG1UbzdLbHY1UzQzaDFadHFHcnd4TVNnbWtX?=
 =?utf-8?B?L3JrUHI4M2lTRElHYmxFK0xselZiMld0V2w4WGY2eVZqdlM3aEExdGdoNlRz?=
 =?utf-8?B?Tk0rL0RGNURQNFJBSkgxeklVK2lRR2twMzZpSC9kcnpIODBTUW1sdmw3bVVq?=
 =?utf-8?B?enVRcDNLc3pZZGhoRlJKdWVVejFDQUpYWVFHOUFxTXducmZWTXZYMkdGK3Zj?=
 =?utf-8?B?bFdxcFZIUFUxeDVMNlNSL2VxYkVZZ2FwejBVSm5FaFF0ZGVtNnppWDlCYU1l?=
 =?utf-8?B?R1FKZ1NKQlVRQmRHSlRacEZIY2w2b3Iwblh0RDR5d0xwQ3VaUlJzS01OZkdt?=
 =?utf-8?B?MmlUSlJFMWJxcXY0dGErUGJtc3o2UGpubHRtWDVQSUJQVDhQWUh2OWJ0T1Vm?=
 =?utf-8?B?R2FtNmxINFlDUFUwaFZBTjQrRUdSSDN5NG9UM1c0dWpVWmwvWkszQnJIcllp?=
 =?utf-8?B?dDNOMFh4Tm5Ya0g3cXFGaHN3Z1dQSTJEdE1yazRtS1ZCREVhRFVzMHp3MDVk?=
 =?utf-8?B?VFVDaGRUTTBMYlJ4N3pvdDRTKzludTNPMk82M0FyMEZic0I0R2Q2WGZhWkJo?=
 =?utf-8?B?dlpnNnBTcWNLQzdqdi90dW1oS3A2MGNRRDZFaStCYnBFYzJibVd3L0V5cjlr?=
 =?utf-8?B?Tk5uVHJtdHdyMVBZSzNocXd6ZDdXWEdzOUd6ZGdmcFhuamVOYXVIVGNERVlW?=
 =?utf-8?B?ZE1uNzJBenVOWlJlR1VhWGFsOEsySG5yQXRmeFJ3eU05VG9Vdld1Z1V6TUxa?=
 =?utf-8?B?VWFqOElwcmhBajRkK0J2QmFuaGRUK2xoWE56YkxzL0U1YVFuUDdyRk92VWhP?=
 =?utf-8?B?MXdCdUtrS3BuZFZGc2xyc2ZSQ0IxZVlMcWdBcThma3pqU1lBaHVBTzVsT00x?=
 =?utf-8?B?T1UwampPcE5GWDJsVGR3WXNWSkcwZnZtQkNYWFp3cHptdk1ObEdybm9uaGJQ?=
 =?utf-8?Q?BP45kAPq5TekdYFA=3D?=
X-Exchange-RoutingPolicyChecked: 1HYwHpPsAWICCPUdXVzTaEmFjBDWYEh9OU00EdpzgIW0sFJXLtYvckG8W+vU2RnNBCyIeaPGioIsI2AEDSTpx2W1PCashlUYZ3dQzJsG9PciRfKBm4+1Cff7TmRvlpOgj+nROW4+b4U3FXVQlJ4ayviZgvgWd4UnAz3caw+9rI/UsOYHc82aiWT43bDwiVkVIbvHc7Ak28YSd5AwMfZYvzPQ3E1oq34CesymsIcqCiqEQW95AVBpiPnfWnWfGxmcu9Klm3G/BWFzXiuJ3Pk0k+2HbE/KNOWLyg3G5dCJE5zwA4M9HPWyv7ZU6W/oZvB8V7BlhSFCdwths926iyLSPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1e4ee5-a7c7-4e7f-3958-08df1dea14ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:25:32.4262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrPu2Z9tSUoSA+6LF4jARfHPguAh/KqKTDw1wSPr2126ieQN4yoJXowjYkNKGWIHbBgNQ0hERwjPypc/hhsVFqgyAjNjOZO0ksQaiGbnpsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7564
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

--------------Ry3r25y0ooXv0Kse12Y1NHAE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace drm_err() calls with xe_log_err() using the HWMON component
> tag to enable structured error reporting with SIGID for hardware
> monitor failures:
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec3..dbeb32d748e6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -15,6 +15,7 @@
>   #include "regs/xe_pcode_regs.h"
>   #include "xe_device.h"
>   #include "xe_hwmon.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> @@ -558,9 +559,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	if (hwmon->xe->info.has_mbx_power_limits) {
>   		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
>   		if (ret) {
> -			drm_err(&hwmon->xe->drm,
> -				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> -				channel, power_attr, reg_val, ret);
> +			xe_log_err(hwmon->xe, HWMON, ret,
> +				   "power interval read fail, ch %d, attr %d, val 0x%08x\n",
Message should start with small or capital make it consistency.
> +				   channel, power_attr, reg_val);
>   			reg_val = 0;
>   		}
>   	} else {
> @@ -1594,7 +1595,8 @@ int xe_hwmon_register(struct xe_device *xe)
>   								&hwmon_chip_info,
>   								hwmon_groups);
>   	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe_log_err(xe, HWMON, PTR_ERR(hwmon->hwmon_dev),
> +			   "Failed to register xe hwmon\n");
>   		xe->hwmon = NULL;
>   		return PTR_ERR(hwmon->hwmon_dev);

Make use of local variable err, like  int err = PTR_ERR(hwmon->hwmon_dev);


Thanks,

-/Mallesh

>   	}
--------------Ry3r25y0ooXv0Kse12Y1NHAE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-09-2026 02:51 pm, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260928092114.1610203-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace drm_err() calls with xe_log_err() using the HWMON component
tag to enable structured error reporting with SIGID for hardware
monitor failures:

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..dbeb32d748e6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -15,6 +15,7 @@
 #include &quot;regs/xe_pcode_regs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_hwmon.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_pcode.h&quot;
 #include &quot;xe_pcode_api.h&quot;
@@ -558,9 +559,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &amp;reg_val);
 		if (ret) {
-			drm_err(&amp;hwmon-&gt;xe-&gt;drm,
-				&quot;power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n&quot;,
-				channel, power_attr, reg_val, ret);
+			xe_log_err(hwmon-&gt;xe, HWMON, ret,
+				   &quot;power interval read fail, ch %d, attr %d, val 0x%08x\n&quot;,</pre>
    </blockquote>
    Message should start with small or capital make it consistency.
    <blockquote type="cite" cite="mid:20260928092114.1610203-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				   channel, power_attr, reg_val);
 			reg_val = 0;
 		}
 	} else {
@@ -1594,7 +1595,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&amp;hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon-&gt;hwmon_dev)) {
-		drm_err(&amp;xe-&gt;drm, &quot;Failed to register xe hwmon (%pe)\n&quot;, hwmon-&gt;hwmon_dev);
+		xe_log_err(xe, HWMON, PTR_ERR(hwmon-&gt;hwmon_dev),
+			   &quot;Failed to register xe hwmon\n&quot;);
 		xe-&gt;hwmon = NULL;
 		return PTR_ERR(hwmon-&gt;hwmon_dev);</pre>
    </blockquote>
    <p>Make use of local variable err, like&nbsp; int err =&nbsp;<span style="white-space: pre-wrap">PTR_ERR(hwmon-&gt;hwmon_dev);</span></p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260928092114.1610203-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------Ry3r25y0ooXv0Kse12Y1NHAE--
