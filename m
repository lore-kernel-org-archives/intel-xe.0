Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B71073CA6
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC1F10E431;
	Wed,  8 Apr 2026 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5h1pI42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F6710E431
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775651136; x=1807187136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=uKJbMJqHD3j/w9uoy4iXKHaLggMlpabJHJvXZZ44Jm4=;
 b=V5h1pI42NVSjmCPadCr23fh1Ficg8oag1nyOY7LeLYtUrpk+3ZkNz8tw
 VB2nBYHOeCo2W4SA+iSEn15imDMVvlBQ1JaIlZSD5QRqRBtC9iUXlJ9G+
 mMWsE9McwVmLso8JhThUh2hohheA3LfLT63+I4J4qYxQU+nVcQwxBhiR4
 L8raZIyKehDRZ0WSirHj/s9VUCxNzmrByMOzVTQ5sUA1N0GhhG1zeqgU7
 1M5fKAlztUUNTj2C1fBd7Ud2Np4LB2riK7PjxkYZooq4KWyoPLoB0PWC9
 FN5R1YPq2ajjYHpwHSxXipgz2kU7qlhNVYcF2N6cwknp6N+VHW/qzZ1s7 Q==;
X-CSE-ConnectionGUID: CK0GiEhWT9Su5T7M4IkXdA==
X-CSE-MsgGUID: TLqbcHHHTJmFCq8FmySHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80518582"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208,217";a="80518582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:25:35 -0700
X-CSE-ConnectionGUID: rCNb8P/tQuaCMTOS8JVHvg==
X-CSE-MsgGUID: WH+bNJ1NSWif+2x4ae5Zdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
 d="scan'208,217";a="266445814"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:25:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 05:25:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 05:25:34 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 05:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwGel3+ZBC4qCV2PvLOR1Mi23rILl0YunIzsleUupESykC7bVfEg2meyVp4gucOFU9nfhYpS6fQBSCuHjblsOT9f+Uc+mBGTsJKjTqy0MS4ujyNO73iUFDcjEM29tl1orxkQAgKmEq5tMoSAwL2ihqz8tHg2h9JEGLS5L9rA+tiW7juW/ubG5R/fLaRJdToD5gvZYcw+NzEKyWHYxL05bQCZnPy/Cq5VOJDmGusGtxzgaBJLiseLiSUfLdIraBq3i4P5QdMkHpuODdGWMoMMtOBYeqRSsko56dzi11PHPlk3ZSo2A5sMZjGZSdPDB+q0/U3HocY1IWfAL27EGryMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYnl9HXyJ80NRhRqLeluBcYWnWD/IqVUvc74A1lbigk=;
 b=CTpHh2aJfhbKFncxc+jiYwrqxi99bIyF1pE7//ChkxAokRMQPwThEfuZOQr0Z+4cZY9VEp7DBkobyykBdai3asEA8Zqnkr3pRIohxXfmd088eV1M8NIDV0wVterWedc2z8lU4HoeI5g1vscQQ68SB/ubAoDlk3y0gWhTmbAWrJrxaHjiHbrwAj1bf81tdwqfATZV0AWINiRG9hMinX6u+rnGUymqZXkFlFc8z2go0JPu8FGuqzTW11/kHJHyizEBR0fw4FKFTDVeyEaeEhMC1GonGQhWSwMwYzz5O884UZiJj+gEV/Ue/4LzbI5e98BOYvmjW5KwMnOTfp55HxSjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 12:25:29 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 12:25:28 +0000
Content-Type: multipart/alternative;
 boundary="------------tJe7d2mbTwf6fOju35G1F1TC"
Message-ID: <9f054c64-07a1-4f29-b4e8-dfacd52a619f@intel.com>
Date: Wed, 8 Apr 2026 17:55:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260407110629.198158-4-raag.jadav@intel.com>
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: ff633910-01bf-4234-ff91-08de9569eb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: sitAL8x/To+xnkvYZZ6/jpeZNkVEClW/Uhwm5L9SRGrFNGJdH4oLXPQrf3JoGwu2+tCo9QBHqeN08xobSTwml8oUUbmGRG0Tg+/lImoi0qKdsdq5GA1maKZxfN2HCHsMBrkhZL2AUnlMJMG+QuUL/vPmgH4yKjJjuN4Wq1TgMMIu+9gjkC1Pde0LppE4HhJNzrdrPSsAOFd2mvPNlq6mGoQnuVPwO8hw1k1jaRjpqfNtbEQ0qE5pxzfKfDnGxF6P+jJwTdzMKkfo+1tKGSrjy+zeo7T19AmUlfBUyLUffcmGbudfKsJnkAv/FttsoV0E1xrkUK7p0bY98SMnNmYkIpSV/kvnNgMqT/NrfboM9YlkbbFGvEHDK4l9450U0UyntkNYUhmCcU/iLfl+uzU/Nm23GUbFDRbAx4tfT5MaIKB3IArpB53Hm5W8K6SVtAWFzC9vAGKEYrO+fcrPNmnuCzIWyYXaLJ567TgxxXWAc/CMjn6p315zYk/9PrTnOSdtWjIZQVhbMP6kH2MnbvyE7rtnzRp0pA2OJCYtPMOWNXs+EP5icJAVcA086G16ENOsRaJDI1Z99zVAxB4tfVG0mZP/A8Ueh6oVl4YPtaJT3XQ66eYZXUCBmcj2HGaXBowKtq6ayT1N6M9F3kHmRk6llWksLXwQ2NgtAO9YGdqXX/GZ1rp/J2pIasHIANSQW1/nA+mmx80SOQmvRIrXIT+0erPhLtZ4NHeBsE3oIreYilQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVrYTVIYXpSSEFzcDZKaWVkVGJmLzJ5Q3MrQXdhUmZHQkxMQ01XekpwRDZQ?=
 =?utf-8?B?THpRWDd6MDdEb1R3U0ZHRkxwWXRDUnZPS0JTTlM3eHRlU3F3ZzNPTFhiRVoy?=
 =?utf-8?B?c0dsTm9seG1xNnZKakZvZlErbkhhWUUzaGN5clNjVG1WMUFzZTdxQnQwTDFH?=
 =?utf-8?B?alZFamU5bnRTNmd1YmdGM3Nqbk1MeFNGZTBqUU92Z3lyNkJZT2xaOS82QU9B?=
 =?utf-8?B?Rzk5WGpLb0tYWHMrQ2g2U3h4VVcwWUlJbTJTSG81RkdaWmJPV1BaeHJuenIz?=
 =?utf-8?B?UGdvUFhoRWFzZXdvMzA3MDNPdUpFakgydmY1OHpOQlV4Z1F0VFlLRHBiMEZW?=
 =?utf-8?B?L0t0YWdHRFhqbGcrTXBuc280UDVKb0dXR1dVZ0JYVUlPUzlSaEpaTmJhT3ky?=
 =?utf-8?B?Q3FJdWlma3ducDR6eWRDaDFtNkttRTFEVUJaTDlOazIwTzNPM3lwVEQydWZI?=
 =?utf-8?B?L0ZoaS9FQXN1RkJRUnJXaVBha1N2ZjNKT3VkMXh6NjJSRFRxS2l0QVhnWEJz?=
 =?utf-8?B?YVgxSWJQcTI2TUtwR3ZEdkk2VE5VMHRNdEhMQ3M2c2VrRXhSV3VvYTl5UmlF?=
 =?utf-8?B?aCtScTBWZUN0NVF4cUEvSEV3K012QWdISzhZYXJUNUZsWk1mRUhCNk15dVlM?=
 =?utf-8?B?alorVDE3QjdsK1FTRzNQN052aWpqZ1RzeXBIcmNsZzhSTTR2Q3htSk5NcU1r?=
 =?utf-8?B?OWZUWWQ1b1BXejJ5SSt0SG1IaVJxQ0wzWHl6ZGMxY3V5cG1BY1JDbHlMcFFh?=
 =?utf-8?B?NUxJclVYbmwwRHJMcW4vaStLT204RllzSjJPWHR0aXJnWCtIVUZ0Z0RpSUtC?=
 =?utf-8?B?R0pRSjNGcVJoc3E4YTV5ck82RkdHTTFXbXVVSC91aThBK0duN1F1Tm45NWhR?=
 =?utf-8?B?QkFTa3lvcExXMGpVb1VvR3RXclhnbkEvcWY4K2ZEaXF5S21VeFpONk1GWHZH?=
 =?utf-8?B?cHA5c2lyeFc1M3FzSVoxNVNnS1ZpeGVqb3ExbDFIQ1dEYnFhMURSTWNNcUtY?=
 =?utf-8?B?enZ1QzAwaEtpRGMySTZES0hQbzRLRHhIOU1wS2Qwelo4MmlKMVB5clJhLzdm?=
 =?utf-8?B?bU43cDFGczBtTk0weWFuVGpiRUZVazNYT0FXdFZsVTQxTVFZUUYwMlRWaUJS?=
 =?utf-8?B?VG5kdG9pVDJjRnJaRE0vc2lrL0dMM2tiV0diUCt5YnU5TDRXazNvNU00Y1Vq?=
 =?utf-8?B?MkhNS0NJbGpEeWdpVHI4bGg5bTdNaGR3NkkxSm5PQ3JndEtreW53QmMyTnFU?=
 =?utf-8?B?LzV6dkRVVEgxeE9rdExYZXAyVUpLMHRvL0xrVHRCZGxzQmNYUVllNTMzTzJT?=
 =?utf-8?B?NVFIK08vQ3hCZVo5REZYMXlVQVByN3N0aFArWmlac0hQaGxzQWpFOHFod2Q0?=
 =?utf-8?B?QlNkd2c0ZEIrdFcxTGJpZnc5TFhQRWFyenhmZkwwMUpyRjRUS2gwWWJUU2p1?=
 =?utf-8?B?VmVoTG51VFpDbTBHOHRRU2RyKzVnZWVjeXpoOWxzcXBWemhEcGljaUIzR241?=
 =?utf-8?B?WjB6REo3K0k3TndmcnBhNnNzMFlHRC9kUHM1a0NPUlJhQVB0bjhpb0pnSDJK?=
 =?utf-8?B?R1MrcWcrU2trdEUwYzdiMWdtMkJXOER6OCt1MTduWURscXVLRlBEeUdtVzBj?=
 =?utf-8?B?TyttT3pNZWt5ejRFWloyWXJBYVEwZmIvQ05zaHFmd0l4K3RHa1ZsNnpFaElt?=
 =?utf-8?B?VDJqTE9ER0IxM0F2MzB4MWNqbXkzZFhNWGtYa25vSlZEUEE0d2lDL1pkSk1P?=
 =?utf-8?B?cmk2emkyUEkzYXo1MjVmZi9YUVdZb2dXN0lxaE1nY2NPclJzYXZZMFhyVW1z?=
 =?utf-8?B?RGY5VmwzMTd0RmhidC9nUVhtVXRlTUlXaUlVc3pmNk9WeWZObi9XQjJsNVo2?=
 =?utf-8?B?eEVvVVhmZVFPUzhCRVFtd2JRM2t0RksvN0hDc2YrMnY0YWFpWjlScUFwQ3V2?=
 =?utf-8?B?b1p6Y3p6Sk9ocTIxM21lTU1oQllSSE1JMVlEYWRyZS9DbmM1cHlyYVVQMlFY?=
 =?utf-8?B?VTZ3SmpaQjRYb3huaFF3S05BdXNBVkZ6eEI4aUVXaUxZRUM4bUdrMmRSaU0y?=
 =?utf-8?B?R0pKa2NrS3FWV3RpUFpSRS9JWkJQV3NGYmZydmdXb0xia05XTHdMT0FjWmdG?=
 =?utf-8?B?Qk5ReE9zWmQrUXhtTHE3aXljem14UzZMWGdPaE40T25vVW9VMFJ1Z25lVVgr?=
 =?utf-8?B?Q3BSN3h5alN4NElRS2VYMkI4eHZ0c2dqTWxWTHZvS25SQlpYSG5QVzh5QXJu?=
 =?utf-8?B?ekZyaFkvTGVnSEk2SExTelVvUVpTYUhka2k5N3Mxb3BtSnZvOFBuYmc4ZThY?=
 =?utf-8?B?NTdURFVPYUhoVXJFckI5MTlFYUdWbjM3N0Rtb2s5YUc5dXBqakcrVnFBV2VC?=
 =?utf-8?Q?xwDVULL0g6BwnFUg=3D?=
X-Exchange-RoutingPolicyChecked: OmfGVGbNNHvNdj4wWMpX8uGgjhEq7ZB4RY/BmLWtsuWHQSIT1XdzmaMbQekobs4580jJk07qjQbGJICIaXCXCxqaduaYP+AcCLexcjVNncfOuX5cE1SSqI8MkGs78Yc7WrY3Ht0MjDyj4lzv87J5ltRLVuoF8CEwVWSlsE/UdwGflnqxW1F05s1GARVF0+hT1IeGZfnM4YKZ4s4b7RUZRppWR8bNnwvShp5vlaxa6EFvZ+Liiyn2LcHg35zDHqg5br3ihXlYWn33pFVGeYszVU33Tg/MVfXi4kmLZNgyv9NO8NEu6ChRb3Blf+lSj2NbYCidEcbEbZkdo5wMjSvDTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff633910-01bf-4234-ff91-08de9569eb45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 12:25:28.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt+J0a8bN7WnwplX0yEJEXdeR/PzID9IEVBcF9Lg4M4odKmJ4j7PqOnxKMb5Su6eh3+YxsM2thUewJuRbhPLjdyTwYGjfqJavHF553TQH8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

--------------tJe7d2mbTwf6fOju35G1F1TC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-04-2026 04:36 pm, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> ---
> v4: Fix Severity/Component logging (Mallesh)
>      s/xe_ras_error/xe_ras_error_class (Riana)
> v5: Handle unexpected counter threshold crossed (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 96 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 ++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 186 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c0e820eeea30..f66561977a45 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..6f84ade02057
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
Unused xe parameter, remove it
> +	if (sev >= XE_RAS_SEV_MAX)
> +		sev = XE_RAS_SEV_NOT_SUPPORTED;
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
ditto
> +	if (comp >= XE_RAS_COMP_MAX)
> +		comp = XE_RAS_COMP_NOT_SUPPORTED;
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_threshold_crossed_data *pending = (void *)&response->data;
> +	struct xe_ras_error_class *errors = pending->counters;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 ncounters = pending->ncounters;
> +	u32 cid, sev, comp, inst, cause;
> +	u8 tile;
> +
> +	if (!ncounters || ncounters >= XE_RAS_NUM_COUNTERS) {

if ncounters are 16, then it's logged in error, however for (cid = 0; 
cid < ncounters; cid++)

safely accesses up to ncounters - 1. So check should be

if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS) right?

> +		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);

Use "[RAS]: ", since code is RAS owned.

Thanks,

-/Mallesh

> +		return;
> +	}
> +
> +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
> +
> +	for (cid = 0; cid < ncounters; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
> +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> +			tile, inst, comp_to_str(xe, comp), sev_to_str(xe, sev), cause);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..92ee93d4e877
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_sysctrl;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..0e3ba9e81538
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Combines common and product-specific parts
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_threshold_crossed_data - Data for threshold crossed event
> + */
> +struct xe_ras_threshold_crossed_data {
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 8a2e44f4f5e0..139ecd4aafcd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h" @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct 
> xe_sysctrl *sc, } if (response.event == 
> XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) { - xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +			xe_ras_threshold_crossed(sc, &response);
>   		} else {
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>   			return;
--------------tJe7d2mbTwf6fOju35G1F1TC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-04-2026 04:36 pm, Raag Jadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260407110629.198158-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Add initial support for correctable error handling which is serviced
using system controller event. Currently we only log the errors in
dmesg but this serves as a foundation for RAS infrastructure and will
be further extended to facilitate other RAS features.

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
---
v4: Fix Severity/Component logging (Mallesh)
    s/xe_ras_error/xe_ras_error_class (Riana)
v5: Handle unexpected counter threshold crossed (Mallesh)
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_ras.c           | 96 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h           | 14 ++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c0e820eeea30..f66561977a45 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -113,6 +113,7 @@ xe-y += xe_bb.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
+	xe_ras.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..6f84ade02057
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include &quot;xe_printk.h&quot;
+#include &quot;xe_ras.h&quot;
+#include &quot;xe_ras_types.h&quot;
+#include &quot;xe_sysctrl.h&quot;
+#include &quot;xe_sysctrl_event_types.h&quot;
+
+/* Severity of detected errors  */
+enum xe_ras_severity {
+	XE_RAS_SEV_NOT_SUPPORTED = 0,
+	XE_RAS_SEV_CORRECTABLE,
+	XE_RAS_SEV_UNCORRECTABLE,
+	XE_RAS_SEV_INFORMATIONAL,
+	XE_RAS_SEV_MAX
+};
+
+/* Major IP blocks/components where errors can originate */
+enum xe_ras_component {
+	XE_RAS_COMP_NOT_SUPPORTED = 0,
+	XE_RAS_COMP_DEVICE_MEMORY,
+	XE_RAS_COMP_CORE_COMPUTE,
+	XE_RAS_COMP_RESERVED,
+	XE_RAS_COMP_PCIE,
+	XE_RAS_COMP_FABRIC,
+	XE_RAS_COMP_SOC_INTERNAL,
+	XE_RAS_COMP_MAX
+};
+
+static const char *const xe_ras_severities[] = {
+	[XE_RAS_SEV_NOT_SUPPORTED]		= &quot;Not Supported&quot;,
+	[XE_RAS_SEV_CORRECTABLE]		= &quot;Correctable&quot;,
+	[XE_RAS_SEV_UNCORRECTABLE]		= &quot;Uncorrectable&quot;,
+	[XE_RAS_SEV_INFORMATIONAL]		= &quot;Informational&quot;,
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
+
+static const char *const xe_ras_components[] = {
+	[XE_RAS_COMP_NOT_SUPPORTED]		= &quot;Not Supported&quot;,
+	[XE_RAS_COMP_DEVICE_MEMORY]		= &quot;Device Memory&quot;,
+	[XE_RAS_COMP_CORE_COMPUTE]		= &quot;Core Compute&quot;,
+	[XE_RAS_COMP_RESERVED]			= &quot;Reserved&quot;,
+	[XE_RAS_COMP_PCIE]			= &quot;PCIe&quot;,
+	[XE_RAS_COMP_FABRIC]			= &quot;Fabric&quot;,
+	[XE_RAS_COMP_SOC_INTERNAL]		= &quot;SoC Internal&quot;,
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
+
+static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
+{</pre>
    </blockquote>
    Unused xe parameter, remove it
    <blockquote type="cite" cite="mid:20260407110629.198158-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (sev &gt;= XE_RAS_SEV_MAX)
+		sev = XE_RAS_SEV_NOT_SUPPORTED;
+
+	return xe_ras_severities[sev];
+}
+
+static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
+{</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260407110629.198158-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (comp &gt;= XE_RAS_COMP_MAX)
+		comp = XE_RAS_COMP_NOT_SUPPORTED;
+
+	return xe_ras_components[comp];
+}
+
+void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
+{
+	struct xe_ras_threshold_crossed_data *pending = (void *)&amp;response-&gt;data;
+	struct xe_ras_error_class *errors = pending-&gt;counters;
+	struct xe_device *xe = sc_to_xe(sc);
+	u32 ncounters = pending-&gt;ncounters;
+	u32 cid, sev, comp, inst, cause;
+	u8 tile;
+
+	if (!ncounters || ncounters &gt;= XE_RAS_NUM_COUNTERS) {</pre>
    </blockquote>
    <p>if ncounters are 16, then it's logged in error, however&nbsp;<span style="white-space: pre-wrap">for (cid = 0; cid &lt; ncounters; cid++)</span></p>
    safely accesses up to ncounters - 1. So check should be&nbsp;
    <pre wrap="" class="moz-quote-pre">if (!ncounters || ncounters &gt; XE_RAS_NUM_COUNTERS) right?</pre>
    <blockquote type="cite" cite="mid:20260407110629.198158-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_err(xe, &quot;sysctrl: unexpected counter threshold crossed %u\n&quot;, ncounters);</pre>
    </blockquote>
    <p>Use &quot;[RAS]: &quot;, since code is RAS owned.</p>
    <p>Thanks,</p>
    <p>-/Mallesh&nbsp;</p>
    <blockquote type="cite" cite="mid:20260407110629.198158-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return;
+	}
+
+	BUILD_BUG_ON(sizeof(response-&gt;data) &lt; sizeof(*pending));
+	xe_warn(xe, &quot;[RAS]: counter threshold crossed, %u new errors\n&quot;, ncounters);
+
+	for (cid = 0; cid &lt; ncounters; cid++) {
+		sev = errors[cid].common.severity;
+		comp = errors[cid].common.component;
+
+		tile = errors[cid].product.unit.tile;
+		inst = errors[cid].product.unit.instance;
+		cause = errors[cid].product.cause.cause;
+
+		xe_warn(xe, &quot;[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n&quot;,
+			tile, inst, comp_to_str(xe, comp), sev_to_str(xe, sev), cause);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..92ee93d4e877
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_sysctrl;
+struct xe_sysctrl_event_response;
+
+void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..0e3ba9e81538
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_TYPES_H_
+#define _XE_RAS_TYPES_H_
+
+#include &lt;linux/types.h&gt;
+
+#define XE_RAS_NUM_COUNTERS			16
+
+/**
+ * struct xe_ras_error_common - Error fields that are common across all products
+ */
+struct xe_ras_error_common {
+	/** @severity: Error severity */
+	u8 severity;
+	/** @component: IP block where error originated */
+	u8 component;
+} __packed;
+
+/**
+ * struct xe_ras_error_unit - Error unit information
+ */
+struct xe_ras_error_unit {
+	/** @tile: Tile identifier */
+	u8 tile;
+	/** @instance: Instance identifier specific to IP */
+	u32 instance;
+} __packed;
+
+/**
+ * struct xe_ras_error_cause - Error cause information
+ */
+struct xe_ras_error_cause {
+	/** @cause: Cause/checker */
+	u32 cause;
+	/** @reserved: For future use */
+	u8 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_error_product - Error fields that are specific to the product
+ */
+struct xe_ras_error_product {
+	/** @unit: Unit within IP block */
+	struct xe_ras_error_unit unit;
+	/** @cause: Cause/checker */
+	struct xe_ras_error_cause cause;
+} __packed;
+
+/**
+ * struct xe_ras_error_class - Combines common and product-specific parts
+ */
+struct xe_ras_error_class {
+	/** @common: Common error type and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_threshold_crossed_data - Data for threshold crossed event
+ */
+struct xe_ras_threshold_crossed_data {
+	/** @ncounters: Number of error counters that crossed thresholds */
+	u32 ncounters;
+	/** @counters: Array of error counters that crossed threshold */
+	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 8a2e44f4f5e0..139ecd4aafcd 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -6,6 +6,7 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_irq.h&quot;
 #include &quot;xe_printk.h&quot;
+#include &quot;xe_ras.h&quot;
 #include &quot;xe_sysctrl.h&quot;
 #include &quot;xe_sysctrl_event_types.h&quot;
 #include &quot;xe_sysctrl_mailbox.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-38,7+39,7@@staticvoidxe_sysctrl_get_pending_event(structxe_sysctrl*sc,}if(response.event==XE_SYSCTRL_EVENT_THRESHOLD_CROSSED){-xe_warn(xe,">&quot;
@@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
 		}
 
 		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
-			xe_warn(xe, &quot;</a>[RAS]: counter threshold crossed\n&quot;);
+			xe_ras_threshold_crossed(sc, &amp;response);
 		} else {
 			xe_err(xe, &quot;sysctrl: unexpected event %#x\n&quot;, response.event);
 			return;
</pre>
    </blockquote>
  </body>
</html>

--------------tJe7d2mbTwf6fOju35G1F1TC--
