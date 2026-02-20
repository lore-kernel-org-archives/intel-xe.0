Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19549C5ACD1
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 16:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713F10E811;
	Fri, 20 Feb 2026 16:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5j0/2Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94C210E811
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771604436; x=1803140436;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oFVtHvMqYgiLr23JBoOjdvI1NNfPiin/85LzUPzdBZ8=;
 b=c5j0/2Ph60ZpkojnfhLgjjNGooenddJ5aNK+PNm/UwNMRjflfqySwgUA
 v5T1Ucu73RC5QlWN26S8WZAiGv65QqLBX685qmTWKAaCHknSTe+9Vg+am
 1DUEhMA8xmoZnaLftYjFPseduvdlS8YqBiK/E0p4VfoYlSbcij3XiWZ0F
 9gOhij4bBvU4/a89uNfX1rTEbOdmeQ416LkgI56b5nD9rYw14wup68RHY
 F2B2Qa+rNVyfg0WxNWRSU9pdYM4Xe2SLoZNC+Xi8YfnBycFudNmLYAr/+
 haZLnaabWkqOVuV6Tsc+PIXLATGmKr8Be2sTIf+99F9lA13E1D6/0PxWG Q==;
X-CSE-ConnectionGUID: feq+bqWETd+/vDXSf/hU0g==
X-CSE-MsgGUID: SbbarcjjR/aPL+bvM7ssfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72798707"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72798707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 08:20:29 -0800
X-CSE-ConnectionGUID: dU5LyyI/RcSkDGWY5hQw6g==
X-CSE-MsgGUID: 7x4cHEgBSPSTuMmIkXCovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214894248"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 08:20:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:20:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 08:20:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFPXW3wxWVpy+qYyeVrYtz9JRa2Qj/j6hIRuEP1DySbFlZUMVktS4JmGaJlWbLF+/sPySdysD62tZTKt87NsL6WZuDUDooid6pcr4tWW3a4pdq719N+kAbQhCNmVFkjjUMQu/g6pxNxH4jQofAq25oLveZrYqAJEoBrlYB+whRLLFDXO6FG3Vbf+rZRz9vxo1s6yJcSzjnaQA5qLoKczkukVwl43/ljlC3NYEV3nBaSM/vb8bXk8xDcRkolIPeeZig3EVU24SNBkHICMgIRzepPbwYq0bq26jICtaEbBkUq1oR9pKPwfA+9fHhRb+kMNK8nyiXQE1sUODgZxTDNOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FMkeNlCYogJbo+txDl7TL+Qey/XPojJyT4E1qC1eCA=;
 b=rSflOw/njAfehQpHCFjk6+Ywk/2tAXez/K1s+2z6R2ljW59azwNQOpK1N2kXpJ0SokDTndyUp0b/F6O7h+tRJxCRnWOXPHlzokeIRc4trAqbY5RMTOd3W0ReaArgMILNRHzky+pC8/NusCuvN4gfJ6Em5H1wY505Q+AfhFgW0lRiRBicUpXbF4CQXljSE6n4iTDZWwDpn2M360kS2OO/gDfYntelbFXURUdyMsQ1eIYb6A4xzdvi7eVF6kJ9407ZFzpR7H9eJFEVbW/v4TToh7eg5ePHt5tu4RfJCKT8y4iqeFa3hhXVA+3jmJDGzuvrdxngQqA/nOxNqQVkfOmR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 16:20:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:20:20 +0000
Date: Fri, 20 Feb 2026 08:20:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/vf: Avoid LRC being freed while applying
 fixups
Message-ID: <aZiJwinZLdmb9AE9@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-3-tomasz.lis@intel.com>
 <aZdds4C5AZyUQfBm@lstrano-desk.jf.intel.com>
 <ceaa1492-0e88-4110-917e-a93a318a8eb2@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceaa1492-0e88-4110-917e-a93a318a8eb2@intel.com>
X-ClientProxiedBy: MW4PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:303:16d::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ac6108-1f17-4a4a-7796-08de709bf172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nr6UoAIrVPQYh9vS0OPGPIwT2fesF0F82yMgnLrq+Rtbjy/J3JdkZxILmD?=
 =?iso-8859-1?Q?2dlH3LIkqyxFMEXTBMJYu0lK9uoC8xuc9QJ9FsFhIBOf5LyV69+a1QzTUP?=
 =?iso-8859-1?Q?jOQjSGfnp5dsez0lnlFQ55zG0B00Std+l1QOBBhMQjBSYBOG49fDGuj2fv?=
 =?iso-8859-1?Q?UX+nQezMhKs2rmEbyYVCKSXhLuDSlpb9lHxajMSCLExfBD9P3SXICdHNGs?=
 =?iso-8859-1?Q?hdeVbcdoF+GG7VcJSxdbY1wtn85PWha/9NNgdo+fTHD1G5V/E9CnS12aNt?=
 =?iso-8859-1?Q?8Bc9OZ04JVQzFPd42zpq+4R7K4hf2b2re2rbSpIDlA/+K4bx30YYYxkadC?=
 =?iso-8859-1?Q?Jc4rBKT/uihtp7VN65i51CQebjRuzEjdsgqaXPmmptt44fKnqhsALhmfKN?=
 =?iso-8859-1?Q?4Vzr3zPyOYAwcwAb7vDqMwR/jLczFA9z0rIDTfhjINEFDTryoMxDI99uGg?=
 =?iso-8859-1?Q?T5GNmIMGUX6CFVagOOaDGcmJwdeTLMuVPMxPhnn9R+IM0j0dOo/Pnuy65s?=
 =?iso-8859-1?Q?64VaBGHcr2omq4FkgPIflAIx7ymthhuUW2XYTb0FkIipdSfViadKZ0BiEP?=
 =?iso-8859-1?Q?Lud2fNgXGJb3qyCS+3sWcHw/U2ivYO9zp8sElbjgpAOSRk/m7GvgiNqrWp?=
 =?iso-8859-1?Q?QxXRxsDrNmXQEMigCrenAyRpDVjEmPusmOn7ZfVksrEj+4u4TwVXz1lwDv?=
 =?iso-8859-1?Q?598r2IIpnpIEbqrPKMxYjDkywBh6mgECngbZ0k92bilf6OWDhl8nLqq/ZT?=
 =?iso-8859-1?Q?vjykTLKZDnCbDfoi0iFXsuD3mTSKXmMZcmIYrhAU9IG3qqhCgw0m0mLh9X?=
 =?iso-8859-1?Q?0ICrmZw//LmVhcoFMe1+napNADucqPc+LQaN24tMV2kCcJoJH89pAvLLii?=
 =?iso-8859-1?Q?v0azw10zlcTh1HHl0Qzt1d3idW3wLoIdMCttip8Xwb7TVzX6aA5MKmt4Pa?=
 =?iso-8859-1?Q?ar1RnXge475nN6zXqotg2sOKv7EBD9RR3uyyv5VqcoSrHt/UUraphqG1te?=
 =?iso-8859-1?Q?BXIrXN2R+T8wgQMKmttyK34/6wASUBDil6V0YDPPzQL3QQRyWI/ilL4YzE?=
 =?iso-8859-1?Q?5ZJ6s3tqUsTnAXh2JYW2L2HNZr2UYt/cTP5i1S5+bEiGerWIgpNksMRs+f?=
 =?iso-8859-1?Q?L0HL9OS3/0peXJ7x5Zk/L5jRdSJXoesfc9w9uKcUGtHW8spLaF/lEQz7UN?=
 =?iso-8859-1?Q?b6nix2W/T0Lb1qGinJgtdktRVgFCKzmaIj4soENPBtAr41AO2jsZ3FHwb3?=
 =?iso-8859-1?Q?CgDNU9xZYKl4sbHlqgXjD6WFk5lDiQG8ks2QSwlIPo4O60xcWDOxRvLlND?=
 =?iso-8859-1?Q?xa2JxLxjJQCl2Aa2Mf7hLpcEuOxDsCsB0/5IUvuHYH+Prw9LRrC2s3uxjH?=
 =?iso-8859-1?Q?OQ5xE+ibSy35RbhpfrFCKa6jShKIkVLpsD14zKREZS+MAyBvvZkRf6lfxl?=
 =?iso-8859-1?Q?/HQ7jwNI5WaaqI1nMdh1se2u5KBfSwHCPpLxR+3MuG7qS54y4P+D4Q0hI0?=
 =?iso-8859-1?Q?6J1NDtEt55L0aP8BY6er9C/RCqZ3WDS2VclT7Wa+uMAgh30pq3QdpOFMDX?=
 =?iso-8859-1?Q?rK0W0PphOftmyBzsTSgRA2NE9tRF2t3KvDGnw1ny/G412jH7azGV6SXWbT?=
 =?iso-8859-1?Q?2PuU5C7di7cQY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6cJLDr1c3KB9OA3a8siNxoeZ5E2uzKgBpEV1RyftKFYYXCGS77obGAIe2L?=
 =?iso-8859-1?Q?8z99RH8+G8x6hHwKqoP6ubwzOkCs/KDcad9SAPVvc6Y4orhecOTN6Bgoh9?=
 =?iso-8859-1?Q?At1KCQmLYieCfJiE/YAhT8QWaIKuRESdIR2Iv1FEkLNkcZyCIylPmuX8Ev?=
 =?iso-8859-1?Q?KfaKp+amz17O5JPQfIz8T6TQwFdU8LF/ReJ2J8tZbXq6xHRIO+dI30jYS2?=
 =?iso-8859-1?Q?b6xbg7hPxO5U5QeNi19nY6VA6YX9kslNfV+cPyBjv8iKLA7SuSN03qnNU2?=
 =?iso-8859-1?Q?0xUHRTVxonbdzqfpnQPDSLgQ/iPmULOAEg65bmAvsPo1kS3LQUln5JpdXX?=
 =?iso-8859-1?Q?NQjZAhqlLAyzJtAeg8KJXYDsKaTC9frZAfL0Vv6Sei17gy0tfzYOPOXDZi?=
 =?iso-8859-1?Q?uyLDL74R9PUv6TWmAx9G6bBMtdEn28Kzkye0IeVQZMwQ0NSWUNCs8cZbVX?=
 =?iso-8859-1?Q?ZJdzg0YFelM1ag7LtxpX1BgEFgwFYboLOxtpBxq9QOIcATumB7UtSmWxfL?=
 =?iso-8859-1?Q?amNjepJJbEgjxm5vlffewtBkMVhYmq7Rv9AT+Ek1PFF+bCLlTfUOlQKKPY?=
 =?iso-8859-1?Q?Hj7AWzRqgnrJzVA8GRqPLwZy3+y0lwVSHYAJr1KOLMkBhN9tOpofpeLGY6?=
 =?iso-8859-1?Q?udwyTib7w3b8JckYB9m17gLb+cgcBbmBCFfe0YsweMmxABdYWCEa2bcaKk?=
 =?iso-8859-1?Q?JRUjcYp1QN3ycDGCOlHssWi5jKoGmk8TOM9Bl78FWMaz3B3fYdRkXZU+eR?=
 =?iso-8859-1?Q?Mrkm+uF8OM+7Btmtb3jH4Vx9FLmPWMNXfBuzC0tDLOp4/SbwXZzDpRZ6tX?=
 =?iso-8859-1?Q?JoyK9WSKcKHX7IU1mZEpEf25rLJCNBzRDDHE1ofUiOsLggYAR3OQs5dkv8?=
 =?iso-8859-1?Q?GWbBtSRGeACi3z0mFzNwxdCfDbRkxAjaw2qTRw+0Y03tmqPIBfT5pSmKJN?=
 =?iso-8859-1?Q?umsL9S5FRYk5SwdFCBrJYBzzoJwFlNwYefYboGt4NydvqKbToyxEvDF26j?=
 =?iso-8859-1?Q?1YlUyjreNck+YUlN0nT6nQQqV/diPmCyce2Wdcy/1Iu8Sj/wQQCMQzUbNN?=
 =?iso-8859-1?Q?ii1407PMgjR0ofY8RlRZx481RFb9Azq/rLxnlHcHk20kYJmANuoSNChdBL?=
 =?iso-8859-1?Q?Y867/NjtXa+3/82fXAcXb6vlp+0GKOUfEORbs9GHDljHnFW59nlfgtyFVB?=
 =?iso-8859-1?Q?Cl01twk/kh7kCwX97PbCnTOv3BOSIYPiGdWtDWkSixVxZCA0FucI9K9OCy?=
 =?iso-8859-1?Q?LXW8d621lSNtz1cWVbV5EA/NDG1N86LfxFktn0ZuNiuPTq/dFCCytX8JzT?=
 =?iso-8859-1?Q?AwKZYHhdJEyTT8w4dn0QENNWfE1BYwkTGfShVHtOv6cVLeCl2TC6RvSAcI?=
 =?iso-8859-1?Q?8MSIyBPqmnxnh4xDve29pprb/uoYAxvYwZ/0yjFh665pktAcSbtVkaUAhB?=
 =?iso-8859-1?Q?WC1o3kPgKBITL6lJl+KPANGmSxI5xW/YjxCFJTwag6STUzDadgqyQ3kYsE?=
 =?iso-8859-1?Q?N9Rw6qL3AsEV75v8Cz1RGCslnu7y5NIgOtMmyDB7Tq9A7ru8FL1/09wEJz?=
 =?iso-8859-1?Q?AAA0Ld1vrhgl9Xe6t0qOgwswjq0YqYM1uyz7K/eg0nk4cq4UG/5O5oGm8H?=
 =?iso-8859-1?Q?PpUWXZKVES9a4mvXD81G5yVuPYwrYTcCjhtFUMCaTLrv7EVKHabqBRTo8G?=
 =?iso-8859-1?Q?7QH8RwobEy88hmB1fH80LtzUxPzdv86TTiKbs3mqGhj+k+S1pA3qYjk3FM?=
 =?iso-8859-1?Q?GqTRmNEY3C2zWtmLeEgp9pouD+7zktTxFVG7/6u0NdF/SA07z95mEzfFGw?=
 =?iso-8859-1?Q?xNBcZ2uG2vQuDPHDoZrNIyV4YwKYeAQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ac6108-1f17-4a4a-7796-08de709bf172
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:20:20.7649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebCcifK2WfopEJZMaCDJ++NrXkuP+tvsNH3ta6fiBBPmFYQxGj+egZ7P2Q0daLLJv6VtA5nHsX6O3ADwwm16vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On Fri, Feb 20, 2026 at 04:20:25PM +0100, Lis, Tomasz wrote:
> 
> On 2/19/2026 8:00 PM, Matthew Brost wrote:
> > On Thu, Feb 19, 2026 at 12:21:55AM +0100, Tomasz Lis wrote:
> > > There is a small but non-zero chance that fixups are running on
> > > a context during teardown. The chances are decreased by starting
> > > the teardown by releasing guc_id, but remain non-zero.
> > > On the other hand the sync between fixups and context creation
> > > drastically increases chance for such parallel teardown if
> > > context creation fails.
> > > 
> > I don't see how this is possible.
> > 
> > xe_exec_queue_contexts_hwsp_rebase only happens if the exec queue is
> > present in &guc->submission_state.exec_queue_lookup.
> > 
> >   332 static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> >   333 {
> >   334         int i;
> >   335
> >   336         q->ops->fini(q);
> >   337
> >   338         for (i = 0; i < q->width; ++i)
> >   339                 xe_lrc_put(q->lrc[i]);
> >   340 }
> > 
> > The removal from &guc->submission_state.exec_queue_lookup happen on line
> > 336 in the above before. Thus a xe_exec_queue_contexts_hwsp_rebase can't
> > be executing on a 'q' after line 336 returns, then we drop the
> > references to the LRC. I agree this lifetime is questionable at best
> > (IIRC my GuC documentation explain this why this works) but if there is
> > a problem it should be fix with this lifetime in mind.
> 
> Consider a situation: __xe_exec_queue_init() and
> xe_exec_queue_contexts_hwsp_rebase() are running at the same time, on a one
> core VM, switching CPU contexts (each bullet is a context switch).
> 
> * __xe_exec_queue_init() passes `q->ops->init(q)` - the queue is added to
> exec_queue_lookup, then it starts creating LRCs - it's multi-LRC queue
> 
> * xe_exec_queue_contexts_hwsp_rebase() is executed on this new queue, starts
> the loop over LRCs
> 
> *  __xe_exec_queue_init() fails to create last of the LRCs, and jumps to
> `err_lrc` where all the finalization is done - removal form
> exec_queue_lookup and freeing of already created LRCs
> 
> * CPU context switches back to __xe_exec_queue_init() which goes through
> pointers of now freed LRCs, accessing the inside - SEGFAULT.
> 
> (I used one CPU core only to simplify the scenario, it could happen on
> multi-core as well)
> 

Yes.

> > Looking at __xe_exec_queue_init, I believe 'err_lrc' label should
> > actually call __xe_exec_queue_fini.
> 
> The __xe_exec_queue_fini() currently assumes that all LRC pointers are
> non-NULL.
> 

Oh, yes. I missed that. Either __xe_exec_queue_fini would need a NULL
check or xe_lrc_put could have a NULL check (e.g., make it like kfree,
dma_fencez_put, or xe_bo_put which can be called with NULL. 

> Do you mean adding such check there? With it present, we could call that
> function in `err_lrc`.
> 
> I see no issue with such change, so let me know and I'll do it (assuming we
> will not be adding any wait there, as hinted below).
>

See above, a NULL check somewhere. No real preference where.
 
> > 
> > > Prevent LRC teardown in parallel with fixups by getting a reference.
> > > 
> > > Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 42849be46166..e9396ad3390a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> > >   		lrc = READ_ONCE(q->lrc[i]);
> > >   		if (!lrc)
> > >   			continue;
> > > -
> > > +		xe_lrc_get(lrc);
> > This doesn't actually fix anything. The LRC could (current, in error
> > paths) disappear between the read and get.
> 
> It is true that this is only narrowing the window rather than providing
> flawless fix. Though narrowing the window is a substantial improvement over
> ignoring the issue.
> 
> We could use xe_gt_sriov_vf_wait_valid_default_lrc() within `err_lrc:`
> instead, that would allow a flawless fix. An advantage of the current
> solution is that it keeps the complication within recovery code, without
> altering the common flow (by common flow I mean the queue creation flow used
> for both PF and VF, and regardless whether vf migration is possible). It
> also allows to free the memory faster - if we've failed LRC creation, it may
> be important to free resources as soon as possible.
> 
> Reading and writing local mem is substantially slower than the local pointer
> read and refcount increase, so this way we're narrowing the window by
> definitely more than 95%.

Yes, but if we are going to fix this, let's make sure it is 100%
correct. Please use __xe_exec_queue_fini in LRC error path and NULL
check somewhere.

Matt

> 
> -Tomasz
> 
> > 
> > Matt
> > 
> > >   		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> > >   		xe_lrc_update_hwctx_regs_with_address(lrc);
> > >   		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> > > +		xe_lrc_put(lrc);
> > >   		if (err)
> > >   			break;
> > >   	}
> > > -- 
> > > 2.25.1
> > > 
