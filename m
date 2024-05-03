Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD16C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF71131F3;
	Fri,  3 May 2024 19:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NUCNKmzn";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5BolFAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F6E1131F3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714764118; x=1746300118;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:content-transfer-encoding:
 list-id:list-unsubscribe:list-archive:list-post:list-help:
 list-subscribe:mime-version;
 bh=NEJTdsKeqwjrbJoX6dAIc1whfgQJ3J88Idz1VBnXTxQ=;
 b=NUCNKmznfQOS+tiHKnnHx14aM+gytYq2IkOczyKlgFf2l+Z+q+beKZFx
 X3On1VUXZqIjKe82WfWoSZot9Nkf0M4W1pPwEJLIISQP1Gg9BuU4bG2v2
 8MQ4kkwN1dBbFpmNJvK9e7gyGgPNizIVvz6EcHnLnveApBWdQ++7bX40B
 8lgDt9t40eYTMZQlY3ww+CkzC43VEYt8nDefkXwMKz2Y+QS1NwF8j5iBF
 SDu+S4Mu62Pf7OlL05H3UtdmKARJeh3wT2CElebtySxJAPd60RKcPI8no
 h6ePu2xibKD/aDFGnUar03zodGPKOZj91zs9Teae/bOnimlmBcFhO31Kt g==;
X-CSE-ConnectionGUID: GyuHpWVHTAK8I//yH6HK4w==
X-CSE-MsgGUID: 3Cz7axNlTYGGXy/UtZePsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28061020"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28061020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:21:57 -0700
X-CSE-ConnectionGUID: 9fM2YWlcRXqeM1Xe/tMOlA==
X-CSE-MsgGUID: YZ3PK/zWRxOUPfRIbFoO6w==
X-ExtLoopCount2: 2 from 10.18.126.81
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="28121587"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:21:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:21:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:21:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:21:56 -0700
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 19:21:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:21:53 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Fri, 3 May 2024 15:21:49 -0400
Resent-Message-ID: <ZjU5TckYnch1jngy@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763641; x=1746299641;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=NEJTdsKeqwjrbJoX6dAIc1whfgQJ3J88Idz1VBnXTxQ=;
 b=M5BolFAIC0vrKWfed9S5gX/6QvHsBBSFMbJUORf5QfBbpbpKQdLXSnmE
 G0c+jEZ5NK9aZ2ApZjkvpMz115B0nZHKKquBC4BNqU9bOa10LVMtz9RTN
 jnfo/y5HpnC57B0vTBDyaaofBmfEWkdzQppI3/8TemaIO6qai3qDMgVPW
 5LBLjpk09PT+YVJWetLn7PrRs3868jUGTX6ppxLbyHbBuyXKcqV2TV/cr
 mNcLiKMJ/V2Pacrl8ojq7p3WbOnRaAQv1Fy6vMs/UhQpx711LFGgUSkGE
 LILPqcXOaJ3eutoNDzrXaOzdwOnE6wHTOhEzrCzcnDM+Gsdk/XcRmrcZs g==;
X-CSE-ConnectionGUID: HphmlBLbRH2Q/HE6clRgpQ==
X-CSE-MsgGUID: VsccilbQSQeKnkzvFdroPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10417775"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10417775"
X-CSE-ConnectionGUID: 9RO1vvI2RgChXs88CQKIPA==
X-CSE-MsgGUID: WFe/q+6hRsidcdmcsBSLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32018032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKE3p1rYXYcgVO4xy2+1BsjjfLnhB47w7Ixr7utXk/CZlaHiay0K7MTuTQvlEete5H2UAoQdeAEVTSwp99tJdfFaJsuGw6wyK/btUid+OvivYZ10wdWZCEU8y8keStXqdeSXgl3c3tY/8EL2pD4awRPH4JOeAxifkhSD+cvm7hnX0G9eETltL25LDnzkb343JiSlswPke42A6cKN3wUPvbRJwaMsvCOQmwbJtnc9ODlxADYKa9vY0hhZHCBH3RSAHUDSuETXXuLGkdR2g1IQxuJpFvTInlroxfrV+TsCOxTp7xDtzXnXotFYASdV6KOlHW3Wg8nccl/eurVbon547w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWVNkCz/eGn5EYzW198AruzqmFEFMj/mvp9qO8dS3nI=;
 b=JXje4g0Vyo7lhqDpQxRrQtlwdnNs49PoYU3Ip5iGCPJHrNmtdNKSV2o4m+OprWqUQRk7nhaJO4ajMrBAW4ILDITTdX2ctI0UcIVTwkZhd5vXxRSc/a1fH0j9wLeDJBpSmpYlbvE3ck3jRBrI+TUopG2hLamOkemNkZ00sohx5Dj6MDWP5rPMZPTDFBK6fKXFIr5jsxaNSOHTBpMjW60lHbBfs60CNQclfAA7LYaFqSEiMUhdKjmBItUO0jZMa/i4xmXM4m+/lEzK+EjAklACq90cbCe9KkZNo9kTTsdfEclrFjikTIJC14L9ITl0Vpkyv7bZLz7n09G/8/1rqPK8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Update runtime pm conditions
Date: Fri, 3 May 2024 15:13:51 -0400
Message-ID: <20240503191351.7145-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_|MN0PR11MB6059:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 085e8bac-3ddc-49eb-a987-08dc6ba64a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230031|35042699013|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A5DPCLAg0xYHy7BLXTXhJy39EN9c38DtsoGW49R8InwJSRDhizNPMvy1fjYm?=
 =?us-ascii?Q?2YsSkw/Eb77f6zzjtgWiovFRjGDRSlKrusRucctXVZcsevqN2Y8Av8z+Tha2?=
 =?us-ascii?Q?GUR4wIIEm1QKrUykoGPWkQkC6S+tasqwJJ8J6DWbz4fAH2Q5JaqEP22+0/zk?=
 =?us-ascii?Q?83x2UTz6K33DGxJRCdTHVfTbNbcXiuJmsjIr1fNmX7N4Fyl0VsG/hf2jYsWU?=
 =?us-ascii?Q?/WAyqywPMihlkkHQjHsqCF9zn3OXBRMMOlLc4XTMufm3wUbkNsgICvrJlPmE?=
 =?us-ascii?Q?QcU3+NRIV/pnAQaGM1bjdXtJPCOdltwPIoHcnPuBTxcByIPNTcey1K3cxCrv?=
 =?us-ascii?Q?5s5sC3236REga6u2rKxcHamTxJn8gZDFlBl575A2P76K6saPiYpD49IN2iuM?=
 =?us-ascii?Q?NhPGep4ksHOoj8a6ElWvNCSLCyEaR58eRM1AOkR6ah3sJ8Jrh0wtKNTdBpuz?=
 =?us-ascii?Q?nLgfyZFR3xRIuo7ZxLDXlopwsq/MNfF7DLs+okmUTIEBIfLsNnAR/0FtHawy?=
 =?us-ascii?Q?i5izbnipLUxDyfhYcAMu6EdRrfiJoB3c4vaZ5/bCDGPrNvecPdGXhHhrZGjo?=
 =?us-ascii?Q?/VkJXghSPkAuYkx2ZCU1X9tjQVBjDUBHcQwk+E9Ix20KRwOzljIPmFjTuKDx?=
 =?us-ascii?Q?8QY1ie0LAEY7muOfgHBvv26S0rJ4/6lS37i6amkDUDAnoRI/WpPFPSR5GfNL?=
 =?us-ascii?Q?9HfCunN2arlxUP/DFe/ETfu9v4NjP1jdQzHgiNeFyRShcPdC0Y7hxoFNZyef?=
 =?us-ascii?Q?FjMrf/YB3Ni6P/i+JY5wnQkP+bIacmw8UBekUeKmXnGtcg6qO36yH6LyVdXo?=
 =?us-ascii?Q?Ev+OFULpI3LDjo/tR1lcvjyIuQzDQtsiQwhBuDFC2k6a23UFm5bNemJamx7Y?=
 =?us-ascii?Q?QayF0L/Cow9dBcCbDSbu17c5eCHBPwUMWOGct6M7FfIQZufbNX+UTGy0cHil?=
 =?us-ascii?Q?0IsbpTeCO3cGCzA1RM6bPy5KmPrstMM66M4zEtrEZbR+K2Njbwo/stGJYcVJ?=
 =?us-ascii?Q?woCM5DY2Xi+/zG+uhZpBwZoGe+XQdrFYudwnUfN2pb9Jg4CJPmdVC6nN5v68?=
 =?us-ascii?Q?srLaJnmrBV6EQNYVouYKX644D98hJej2jere6RRPhlISuapjmovr9U81+jnO?=
 =?us-ascii?Q?IdvD/mFn2GJ0kGv0Nyo9iSiysPxHlArnwkPx+aKL3cJDanj7BF2aKVH6ueAP?=
 =?us-ascii?Q?+3frEuBzYCa7WPb50OI5mwgtBcMBy/o5otiSqO+GMp2HV+YY+aaoTxULrIY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(35042699013)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e940df0-ae87-4937-c092-08dc6ba52d37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:55.4872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq0PwfKiUlWKdpBYgMKgt9jgBvdsAD2IMzH33Ljplno1PPIqkfM1WYYUrOXM7NAEgyhTo2lwHgV1IGpMVwE9nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5e940df0-ae87-4937-c092-08dc6ba52d37
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYmpv0HgVKNT4ciUVGiNDwtuwJgoLDglvLzymdp+2DbSwhIdSmTZq/NDE3PJ?=
 =?us-ascii?Q?piXaJAQkyuqMZCJL7Np74VCPFKupUkuhEB2EsvlhP+dBQM4EJnDQnuKryD33?=
 =?us-ascii?Q?rykxJfbU8DgRSxI/6zlIHnRhMMoxrrwvRe+MrzCj19805lnP8jPUvV4h40sz?=
 =?us-ascii?Q?eRG+ZFdYF3JxnhYppexJ0qOdbYVoQCvp20PjseAz9l3p5bxVN9CAkWXrsnPU?=
 =?us-ascii?Q?2W/A6b+15lnW4r3Mwnq/9Qk33E/9fS34RM24gCv1ePjVVu8sv4hNoO8x2yI+?=
 =?us-ascii?Q?I6d/8pDa+f62QZ9j1iGXGbmDQ+pt3HfNpClB1kGtn+JD5PTd0CzmNOm7kl6E?=
 =?us-ascii?Q?Nx2eG854eJ9v+exHtNk/G7yjjx4UVwBgyb1PV2lfSOrLbWfmILmLRG1Apz6E?=
 =?us-ascii?Q?+dr5HTRaDT/q5W9j472OPEseT9P3IrN+cCuTEzPsG1ODJWLbg2M01SYz2Mde?=
 =?us-ascii?Q?B/e0s2F7GIl/EeSVztCPY4rk5IYybdN9yhbtYcvskNkRuFP5DftOB2/suHev?=
 =?us-ascii?Q?+MZFuD2bkKQ5F7z71vdEpy6Ci+38sXazkTVhwWOX83td1joVVMrJ/sanLpId?=
 =?us-ascii?Q?6VIzlKry1Lj7ModMtEs7wl9UavQaLYCihvfwGhWREjfSUfJuq8s/7bHvsqne?=
 =?us-ascii?Q?Z1QbcFX+8XjEGzgAt95DAz0LddyT+giwJ4wdFM0YDqLlkpsvSVDUHJ0W6ahc?=
 =?us-ascii?Q?9Fh2pgQmmpZEg8K3zqWcpjXrXo8QWb12mXl/IlY64yd9aUNV+Oqw0a8QIVWg?=
 =?us-ascii?Q?9oJ+gSXnQvhiRnyxstWclXth+aT6Y9VjuZOJKIW2bikHIuVoD2WChE5ejG8B?=
 =?us-ascii?Q?l3CNgKzJr0tuWOCpKAo34/gG5zO18+dhljl2OSAtE7xy2zFUZHipX1uwrPeC?=
 =?us-ascii?Q?SrGOIV+yHo8k4oEIIg7GxtAj7qMIaVtbCaHE0L9F9zcZRbXcPj41lR8zrj19?=
 =?us-ascii?Q?KPrj9ZfL+m5wmJ6txHMwK5Ukm1BB5tAGzhMO8tbA8ZsgbtNU/SwQZkZ9vw3G?=
 =?us-ascii?Q?woNXSDYNtvFSfBVWwE1CEkfHCEl+UR3CFGbt/Fn25TL1DbOqQSGVdt96PrN0?=
 =?us-ascii?Q?0s0VXThekOy5Y/UyaJvrpPj9+XXqWX9Fw47OIhCd8QpbvKSNPBoQqiJooUth?=
 =?us-ascii?Q?bnUBA4INp1IqMgWB55l4Hq7U2Klse+5tv4DuJDV0tLQHzcwYX79BqKABPSxS?=
 =?us-ascii?Q?DKAg8BAp2FlfJYCxa+A0Ywb1As52qUQ/EYhMhh//nTg0Qr/YVl5FoOd510Vp?=
 =?us-ascii?Q?bXr3kgc8ov/MjD8Oz+XoPOwx4Ra6Y5XwB0sVmW9TsUFyXcdtnqztHeAejU9X?=
 =?us-ascii?Q?IlXCXTY9iCMFmmF8x4RFXFkSM9DW2+gusSf4wxd0rGq8yh8W1qMw7BQa05U0?=
 =?us-ascii?Q?NwSKDWeMFVB1dtXpAqVu0qhrRCCmMJL0ld09mXVCTb4aEPYsx02CidiB6WRK?=
 =?us-ascii?Q?rfcNFtbNpUhcuxG/xbeYRUsxHIBuQCZw9s++eG3LOOY702gNrqidiPdHpqo2?=
 =?us-ascii?Q?3oIH2tftkvZeogZxSPF2F3P94pQ0iLBDM9IXxNOao2k5do48TsP1slGh7fuN?=
 =?us-ascii?Q?7b1RWERwC3KYGjbcyIrep4JjaM6Vqh0zyg+x6B4z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085e8bac-3ddc-49eb-a987-08dc6ba64a33
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:21:53.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQcjRC7jR2ZKhOZ8SspB8JspSs/ds3HSz4tQTqyOp+21h9E5efi43881+Tmutai83byLEdylkzsz0bVysW4OIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
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

Xe is no longer holding a runtime pm reference for the life
of a VM. So we cannot guarantee the reference usage in these
points.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

Hence, let's remove all of these conditions and check before and
after states and the results of the execution. That should be
enough for now.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 47 +--------------------------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 51442537b..1e0a9b282 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -322,7 +294,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
@@ -334,15 +306,9 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -380,9 +346,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
-
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
@@ -422,9 +385,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -452,11 +412,6 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
 	if (check_rpm)
-- 
2.44.0

