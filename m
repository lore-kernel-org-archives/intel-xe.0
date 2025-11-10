Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65178CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 16:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091E710E066;
	Mon, 10 Nov 2025 16:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCtiXeDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E3E10E066
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791862; x=1794327862;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SY4I59fh1MSoSdCKjyXQhFCL1QFO/x9pUnzlarWz4DQ=;
 b=lCtiXeDBydT9gh8IJvP6CiYQLYEMeACgOK3aSaTep/7linMNpie2yms4
 bJzwrLuYYXVZO+dpulaITFdNZZkD5RYQr7zgQ4iMN2WS8ZVgrJZuW2X5l
 xuGYnyXgxo+YyXGnX1lsg5AlcwjkKTcbCujqAvWALxH/LgakL4gd4atve
 lcBu7SpNNH90dsBw6oxgTwjQwVyav259LJu9seFcRBc1WRg6hYziNzIwa
 RMUl4IQEeur6UNeGXQolNhnPauY9UE6cYXyVV7Z0Lx/0msmH/M54uVtsG
 PFoXkkiN61cFkhjIdfAs9J6Is/IS6u2XAVJxuY7QVKLG5dYYUA2gVi4xc g==;
X-CSE-ConnectionGUID: Y9uXx2QnRwmKJzmGQ09S+Q==
X-CSE-MsgGUID: sPOxYp4AR5W2Ip7req7Rgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82242879"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82242879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:24:21 -0800
X-CSE-ConnectionGUID: GGsc230ZQ3mHOBD3T/FX9A==
X-CSE-MsgGUID: IxZnoZ9DS9ytJI7uDfzQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188666657"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:24:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 08:24:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 08:24:21 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 08:24:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7Myaqa91kYVX1aQNtm9XKmmqfdcu4KRKEVXAmEweXM22rPx/ue6C/KETZFjtDH5pyPFmC+vWBA35WZ28cMGDiW14SkJz0Efwj2M198fJrssHbSOi1gx8nXozu3A2X2+z8egrsN8b1LWMmFa+u32qns+87kwv8EFlQG2JjK9QPhnMuWZxfU2NgUrZOV61YbXpZEkP3cky/rEQo1O+iQCBHUYk0cZf0bCzvAE/mDgMvepKQ2Ddcg78MalsUblKF39hAT6yL4HCenSE/PdRkHCgxwaIf9dg9QS5Rbg9NRSQSCDJw1E/bQl2m/ptJn5Bn9Y85tLa/JMZ4QVakYRSZrqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ztbm+3NtGwyd+oSZdUWNyzT9A8lDIpq/0nCYI4XNDE=;
 b=fcPsHJBqe4jzAYANfimDstWZRImeWve6dQ7LA0/K5rOKZ6wHiZuLHZkLylIhnFAdseq8D0mj+utMZgW+QbT8jtktHBEQcbV6fMLHv38x2uT9u5FroG0W/0RIo5FkNeNXkD9vztuHQkGoKYY1k/ZJ7FJZtFC1iH4UXfyj5SnSxZ71RNRpQzyzXdvrLC2iIAjS0vdwmIOEa+n9ZQGHtF51bsGzRJReEU1IhckDGL7h6q5qcBLqunxOsV+dL3vH/37usa01NCf42A/uUIkYEJeMDXmGJcDJ9v8J5V+VBoIuZCFaHyRNhrFSTV2cG80zEciMrozJtszVMuGt1bl8k+PH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:24:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:24:18 +0000
Date: Mon, 10 Nov 2025 10:24:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pcode: Rework error mapping
Message-ID: <7jdhtd4xueha7w5d2e7zuc5wzqkwmpjjzw5cor7bqoongvvduc@vxn7jsd2g3fd>
References: <20251107-pcode-errmap-v1-1-8e564673bf00@intel.com>
 <aQ9LbaoiLeE6D3bD@black.igk.intel.com>
 <aQ-2LkYcr79Og5Nq@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQ-2LkYcr79Og5Nq@black.igk.intel.com>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: ad005376-5cdb-4321-951f-08de20759903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B7qQpMNNmNKhAP6i1Yixb/NEk4e9OyuSijkNOiTp0ntwiFn+muu1DpqmjpPF?=
 =?us-ascii?Q?Gkgea8wNELATA/JM9RlD8sw2V5o+T8RXlwXHrkRsyNXKrFk+ln8fTc12/i9l?=
 =?us-ascii?Q?KbJ01pjkADoygTmU3D/sjz8rSaYHxW6uwNH6p1Si4Ygi9fK1dpLUEHEhaOOE?=
 =?us-ascii?Q?96+7zeqOzhqu8IDX1zt7oKY4xCf0ukKicYeyAiNE+Okh8jH1+yvVD7BKSr5E?=
 =?us-ascii?Q?7zl2uXqqvCyON0/adfJLJUe3kR5DE2QJVFFuJazcut/BqyMzMO0tvSo+lrKw?=
 =?us-ascii?Q?ltFHcinsDPRSnIwy2ITJVVJocDhmWZECc9EwvU5s9cGn+1OWieaKCobc/ND6?=
 =?us-ascii?Q?R2odm0ebAge7dwIgR2yehtP3PVACcCPY6oCFZfKc6C5EUO+fAXDHEpiekMqW?=
 =?us-ascii?Q?enG+oIs39Eti4WODvbWkyhAwo1SM33/6Pig+BOsDQ9FeK3SJzcDZmV5i2E6p?=
 =?us-ascii?Q?PST3kabKUW0l8BFRHrcGrJn8BmL1mzISqhBVnoMbiZtyEaUlnW9PbDgs9ZLd?=
 =?us-ascii?Q?Jh8ZNtbm2RUoKqxTNwEpVvCT+s0H/V5eKr9DzKMNoiem0iwf5mC1R5xnFCE8?=
 =?us-ascii?Q?/u2RuNJX6NzymB5Cg1k0g7yt2Oz4Ogz+9kYa0TZEbhD8cL8q7SCCJKhUm9nd?=
 =?us-ascii?Q?dUu3qHo717o59MDEwFByPjtbRHEEAQN76YCclXUmq1LGMjYBCAk0TtITH0y6?=
 =?us-ascii?Q?gCD1O7HlIB6lXigeOxAzbDs6mGoviS8Os8fNw+iepwqq+EE7KM+f5JlXn1/O?=
 =?us-ascii?Q?ULbcR5Kssv8ogHvypAUGAA461wqoyDiODT6sj0WP8HZsPoKQQiHnrXEwAyzb?=
 =?us-ascii?Q?GXc/acAQfUV6AXnzGgKbTobSH99itgPMbc1llOVI/jA9LJ3cRQM5EGam+awg?=
 =?us-ascii?Q?Q2WCcHn2GnuHGwZT+4okrGplZ6ppEYknjEcasf6sCTqU0uhII6xfopO3ho5b?=
 =?us-ascii?Q?tm8tV4AXX15ZJmphm+skd5NWHfv4YXc3wwZg9PJi4zKaJrfaGj71YCrvXde9?=
 =?us-ascii?Q?Py+oC9jg/reF7ZU/rM7B5y/5/W5SXGD8HMchVFV9Xwzit/Wg/9THj4CatrVf?=
 =?us-ascii?Q?mff7XCjRJDQH6amOtslImpGSJgeloGlF5iF+2okJ/ikjad4j8h1/v4KQYCZy?=
 =?us-ascii?Q?wDy66JJ7Dm/DjSFrdYlUIROJG6/iMWmSEzUJPffMzQ/7pyoxKioNjLvcnn6y?=
 =?us-ascii?Q?u3m8APJ1mkipZhV3reFCfgXWScijNwGeNgKMFTixxa3GozYXpHViQQEtjup9?=
 =?us-ascii?Q?2Q7LxJ0Kw9ZEad6kaUKV7m/jlLwzpOFe924uTPwhSrxPej0ibqOfWf8alReF?=
 =?us-ascii?Q?gzT2HYGG3LiaG/kXGv7BJ57Q8LWAyK5AYFr3gjHopJQpqDXpJT2MvJcn1+9i?=
 =?us-ascii?Q?vL1Tz+VrqyN4oOkTR3Q9xUFrIlqF3iJPkfUH+lPngmS3kY5E9gIysp/6Rqj5?=
 =?us-ascii?Q?OWzgC9/elkyVBdFRBiHZ+9Y/errBZw5S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnbdFE7JwdQfemv66Ajf9J+vQVVUPuzjJj0K29oabYmsUn4Ej9nhwVxk+4D8?=
 =?us-ascii?Q?ZQWPreJLcIF/nGgIVyMXNF2azYxz1jHx6zVDRd32kg55LWVxuwxzySn90EEN?=
 =?us-ascii?Q?DmYKGHbq1pBrvhcKwq79/1up2Nw9/EE/nhfwq7BYswAh0+so64Sx3EMeOWVG?=
 =?us-ascii?Q?pi+b5XviuAlKaSLIuDl1mPnopiDMLVkOmWUFEDrUffGtTOrxHzNRwYhti5D4?=
 =?us-ascii?Q?E8kM2hkZ+mRTgi3h1N2aEiLvE01prLFtITnTCASuf5iyaH57U9/5/NMudilv?=
 =?us-ascii?Q?sIx4Le5v/RhPB5hSd3FVHoqJSf9MnIw2GhIfSkafZGiNx4rY5mQ4E43ILCLx?=
 =?us-ascii?Q?z/JUY9KHIwAYxhICiGT6ek0w1YJXoyc8zE/5xLo4CjY5D5q0fPfPKDgCfNIq?=
 =?us-ascii?Q?NoC9y3S3LtqFr+dVwJkpA9lTp30zxeEiiv5xjhw+ZVkIELOKYLgu0S5mjmrk?=
 =?us-ascii?Q?4tprMjM1uQvdZY5DC8xotGQooRB92yB2EXYWvFlGsG6FtILNGk5KIdmvv+Z3?=
 =?us-ascii?Q?hFaNm9Y8fusrT5BTVtOrb6+lwyFYBeM24q0jly2MWq36u3ObDQBZ6iPxO0c1?=
 =?us-ascii?Q?jXC/XBTwBXgFsF+zOGY8GE775+srRUIoRCmz8A6/KmkVeTMXxVdysyIF5L50?=
 =?us-ascii?Q?AvyTv3/JU8ziHmMbdhXn5KbTVqSmuqK67n5xAoAiGEwnMAK20EfSHQQ6IzWc?=
 =?us-ascii?Q?oBRu3owPGnQ36jXVnOuSLp3dSGdMXKn/XouTJsojxGAAk1lSblLlpLEB5dcJ?=
 =?us-ascii?Q?PW9fOKeJOxuYy7bEpfFrhHFB3OaHe/iGrcYu28SKH41D5Uh4afdCp18xy4HB?=
 =?us-ascii?Q?vnBGvH+ocvH24PQ5zejwtVwkpdmI8+BtakFLbVRo8B1L4Kixk+qQWGqb/mdh?=
 =?us-ascii?Q?BRwo1QYZDeUtsy2JUhYwgCjraY/9mBNpLtzxviuQGg7bP79oOBL5AdXEAOF9?=
 =?us-ascii?Q?uCZ9RNew2pjoDJujo7FsGXmcsGHnqG/YPjbLikaswDI12+xwNqDzY4wLgC40?=
 =?us-ascii?Q?k+0/yUyeyBL+Y3pCvuIzUQzPw0VrIPsOJJlUTn6yjJtLsW0PhCA+2VwLxtJU?=
 =?us-ascii?Q?8ij2dci7cUcpzGuKSOI2Vo7rLd8Jbt4m5DSbY3XEUdAbiaJ6iwPy2MUrAl7n?=
 =?us-ascii?Q?X9JQKAExTkM3vhMwvRDFDWSLTB/pnEU6qwBdjQ4gXJsnZjWnCu5oh0r6j76C?=
 =?us-ascii?Q?BAjV0Tbe9sHkNJXPCOPrbKLzrFZoRa0BatTucN1mAwjJcNLix7UNUTIAl3/E?=
 =?us-ascii?Q?2aVbkEs9nDECKHZIm7rCLz9Y5p3wLVGRlQFKUe+m3RG9TXfY8LtP5ZCJdCKM?=
 =?us-ascii?Q?892u1P/6hOkOOp3GbyOgOXtwKIXm09n+zuo/MmxydVtZePwPlhWJAXD86j29?=
 =?us-ascii?Q?QGeU2eJPR9s7SXIg7jrcv9/eM9DF112Xc3qGsv6oF6YThGmrAYjscdrGJv+e?=
 =?us-ascii?Q?tY6HuxNTzn3UVqTiCeTIVfKZNaUIEoRMYJpau8EGpFe6fiNeTx94FXkBOKxK?=
 =?us-ascii?Q?wCzcjpddfIFIySoyrh6KqoAN1vxKZrlV898ObY4cRcbXuGS/2+UGHeex7DYQ?=
 =?us-ascii?Q?NeNORcWP9tEWg+F9DYVY1rzP2jsCBw2C/1O6BuROna+fehhDKuzpivW7wpvO?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad005376-5cdb-4321-951f-08de20759903
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:24:18.5481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S4x9gmzhVEnKJ06K1BBpH/5IWo1IXgbkg9fMnS9h4OV65BDlmfGgvPh0B/tflOkHA0XjR2S02zbAudMRYRBmGll3z9l4rpRulU4EF/ExSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
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

On Sat, Nov 08, 2025 at 10:29:18PM +0100, Raag Jadav wrote:
>On Sat, Nov 08, 2025 at 02:53:52PM +0100, Raag Jadav wrote:
>> On Fri, Nov 07, 2025 at 11:21:18AM -0800, Lucas De Marchi wrote:
>> > The sparse array used for error decoding from is unnecessarily big. It
>> > should be better handled by a switch statement that will also allow us
>> > to more easily improve this code.
>> >
>> > Add a CASE_ERR() macro to keep the table compact and use it instead of
>> > the 256-entries array, which saves some space:
>> >
>> > 	$ bloat-o-meter xe_pcode.o.old xe_pcode.o
>> > 	add/remove: 0/1 grow/shrink: 2/0 up/down: 222/-4096 (-3874)
>> > 	Function                                     old     new   delta
>> > 	__pcode_mailbox_rw                           363     480    +117
>> > 	__pcode_mailbox_rw.cold                       58     163    +105
>> > 	err_decode                                  4096       -   -4096
>> > 	Total: Before=7890, After=4016, chg -49.10%
>>
>> ...
>>
>> > +#define CASE_ERR(_err, _err_decode, _err_str)	\
>> > +	case _err:				\
>> > +		err_decode = _err_decode;	\
>> > +		err_str = _err_str;		\
>> > +		break
>> >
>> >  	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>> > +	switch (err) {
>> > +	CASE_ERR(PCODE_ILLEGAL_CMD,	      -ENXIO,     "Illegal Command");
>> > +	CASE_ERR(PCODE_TIMEOUT,               -ETIMEDOUT, "Timed out");
>> > +	CASE_ERR(PCODE_ILLEGAL_DATA,          -EINVAL,    "Illegal Data");
>> > +	CASE_ERR(PCODE_ILLEGAL_SUBCOMMAND,    -ENXIO,     "Illegal Subcommand");
>> > +	CASE_ERR(PCODE_LOCKED,                -EBUSY,     "PCODE Locked");
>> > +	CASE_ERR(PCODE_GT_RATIO_OUT_OF_RANGE, -EOVERFLOW, "GT ratio out of range");
>> > +	CASE_ERR(PCODE_REJECTED,              -EACCES,    "PCODE Rejected");
>>
>> [*]
>>
>> > +	CASE_ERR(PCODE_ERROR_MASK,            -EPROTO,    "Unknown");
>> > +	default:
>> > +		err_decode = -EPROTO;
>> > +		err_str = "Unknown";
>>
>> One way to avoid the duplication is by moving the default case above[*],
>> but it's quite ugly and I'm not aware if there are any rules against such
>> ordering.
>
>Or drop PCODE_ERROR_MASK case entirely and let default take care of it
>instead.

I like this second one better as it's clearer and smaller.

thanks
Lucas De Marchi

>
>> In any case,
>>
>> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
