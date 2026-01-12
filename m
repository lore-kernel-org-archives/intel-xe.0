Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02EFCF45C8
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 21:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB1810E086;
	Mon, 12 Jan 2026 21:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdRQLzUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93B10E086
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768252024; x=1799788024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x3fq2eXlHaozEKoRewo3HAvtYf/Z0g/zd5Ph02K0My0=;
 b=JdRQLzUXz6L22zJ8gkBPKr5/z87QNKF5RQujgXt79FUs4IHqAqXf/Tul
 xHNgX7uXOOgsiBl41ZBa9IUsuckifuPCN4o3kXrEelMfm5Rii/NR/K2DR
 Ywu7z60/yIujhfwE5b1BedaOXEmoINshTGsRFEsc/ajtxSQJ6usozoqKz
 iqaepYD3tUVOGPswaUnKLPTw23xWgabI1/Re8k48RUXoCPnu0EgUSTArX
 jkT3MnDWO8Uw6d8Li5MWS8YwOid+gP4GaOixC/tLKLCIaxgwUiKRmO749
 VIHWyET8Dg86Xp2KWbAQ8VnOC6eJ8SG3I0+O7XmpQZaY23WL3FzpZQrLw g==;
X-CSE-ConnectionGUID: VOgYodXYRHi+qucur0pJkw==
X-CSE-MsgGUID: WnqQN0HyQQq/eR3b8GAoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79829890"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="79829890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:07:04 -0800
X-CSE-ConnectionGUID: 88PSWsZtRBOQN/rJDwBUag==
X-CSE-MsgGUID: Dw1JRICyQ+Cqmm0ZuvAB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204102057"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:07:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:07:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 13:07:03 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:07:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pl9HFEj84SGdd+sO1m2NIwfoefequfT7xZLxd+/4ND1/RtL6Nuh1VB2wNTO5Z5UEArvHpqxwmHhwb1AEjncnfdsqWioDyQNucoWfmEBDnji59UcwET0BP2zO9DtepoEXTY6PAEmd1piSQfrJq02p63MmwhUm9apeqgaii+CNPugOJEqBl5cnvIybjvXWW5EB0yWeeYf4LXoMNXXKA8hNIH/XIcNU07EuAGVHi4fZXXtBvryU5o1ohV2sASjbPo4iADxGOul3dO6o1PS7GaXNWtsNUQ+/tGkpk9WwcVyc9BKvv5amUaY0+G8M2yosCatHwlP6SnNYP5w6oEZSeHYvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQXfiSLrp4bZriXSMYs4GuinZDdbzl7hdiM1PDEF3bM=;
 b=JrgDFzwsZhgU2cjnU5A5OyQ1FesqBHp0Ib2SYf5xbPFru57tkgDjxfujuE6LrXxAkvg7osxTqQrf8wXZv+ZaD2QZo3JhnjnvUdz2GszSVijj3YC+Sko1s67p8Q8sg8jdQQWO+8ar9wfLy6PQnN3lKQOYtYpl5bUC1eG8SJ1ur/Lv2vte7LrCdG/9WPzg4tSSWigxn8NA3L9/0N1UiuGJlBcuiuoJxhP9VQlMNbkc/ZbhTTPCL5pHHzH5xWmTJ4Pe+0fU0TAqoM8xIzgNegdIHJtQIeV1yH586vu75CcWaKSaqmzwCbYRTfs/5aV0i5yT7C8040lpOXFkqCHlak9DrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM3PPF807974CA6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 21:07:01 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 21:07:01 +0000
Date: Mon, 12 Jan 2026 13:06:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Message-ID: <20260112210658.GB458813@mdroper-desk1.amr.corp.intel.com>
References: <20260110053650.2241351-1-fei.yang@intel.com>
 <20260110053650.2241351-2-fei.yang@intel.com>
 <aWQadEqbiBzu1ePh@lstrano-desk.jf.intel.com>
 <BL3PR11MB6362975F68C7644C9067108E9A81A@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL3PR11MB6362975F68C7644C9067108E9A81A@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM3PPF807974CA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 384b0d2a-a5b5-4b0f-3278-08de521e8772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlloMit4YVlKVWFZcldGMm9aQzRZYkNxcnFSaHlFV09INkRYR3BVUStJd3NK?=
 =?utf-8?B?Vmt0VFZDMjJGUXdYc3VPTWVuZ3NBVU10b2UyY2F3T0tuY0RqTDcwRnJUdUli?=
 =?utf-8?B?MXFSbEFiNWNMa2ZuMHlhRWxENFNjVms4aTFBU3ArMnBqMjdsbUUzMUZiZTQ0?=
 =?utf-8?B?d0U0V1lHcGhUcEVKaTYyNlRhYkV1NkZ3YWJ4QW9kSGxqb05COUdjTng0NmZu?=
 =?utf-8?B?Y2ZRU1dKbmQ5OEIwenYxNmk3MWQ1VEE2TkVUTzVwSHdaQ3d2aCs0SlloMzdP?=
 =?utf-8?B?SDkra3J2OU1OUWtGTXFRc1U0dTJ4L0xzZXpVMFhWZktlSkNkcEhxOFJBWEJ4?=
 =?utf-8?B?aHljUUs5VVJOclZySU1lZ3JSWnpHOTBIVVZ1Ym1POWhLNVpTNFRFWDRkRTQ1?=
 =?utf-8?B?VTZKN20xd0FPSURKT29BQWZRUjJtY243TmhxWitwVDVwNnVPdER5eHNYbkJa?=
 =?utf-8?B?YWFnWmd0bmdkcnB4UldPbXB0VEMvSWlOUFlWNlpIRExDWFBWc2N5NlFEbG5F?=
 =?utf-8?B?UE9GTC9WOU11R3g3N2duWkJLMllPSUFmUGFSK0xqc1BPUGprMGZtR2I5RzUv?=
 =?utf-8?B?VHc0R2xXNFVMQi8vcTVMc0ZLNlFEb2RBQklBK1p2dWRhVjJJeUdnVzJCNlRp?=
 =?utf-8?B?OTVNaW5oVk9YM2dxQkVGRGVmZlJLTENwdVhKYWtrRjQ4NDRlakFvazVkQ3lm?=
 =?utf-8?B?TitRd3BRdElGK0FJa2h3RWdwc1pBM3Y0WFBiV0p6eGk5QzgrM1FzcTBtWjVt?=
 =?utf-8?B?TTV1V0xpRURyblNjM1c5OHBLWkhvaEJWZGoyQlVNbHBkQkUrZ1c1eGpURi9x?=
 =?utf-8?B?Q0NyaVN4WFcwcGtwbThoWW9RVmlGSXdGR0JmOVpHV200UlRMQmNyRmZ3OFVn?=
 =?utf-8?B?NHdRZTdZRlNvOEhabFdSWk11RXFUVlM0d3Y5UWhsNTRkeTRJVmlSMEdwVWNP?=
 =?utf-8?B?a1Y4UEVYTmEwK0xjWi9RVUdzamI4WUVuOTJ4enhwM0ViT28wZjhnWkQra3p2?=
 =?utf-8?B?TzlCaUo4OUNUOGJxZDQ5NTQ0cUlBeUVDYzUwZit5Zmw1RnF5SXo1LzhqbTF1?=
 =?utf-8?B?cm9FdEtYTjJiMnVLU1NjNzVKbDd1RGZnU2hOWk9oUXF2dUIxcWRIdUlxV2tu?=
 =?utf-8?B?cTlMRWlqN0tUMHdvUW5qNUMyNUtFWmpGWWJZZlB0a1hyL3doR1o1a2ppWXpD?=
 =?utf-8?B?ZUVmODhORjdkZk4xNHBDbXVySHF6T0hHeUUvcFVXclg3SWlRRzZBeEdic1FJ?=
 =?utf-8?B?QStwTzRqUzVDQnp0dzNvUno1RTZJVEttUEtaUFRBMkljSHlIMHJaQnFkUWls?=
 =?utf-8?B?TFBFVHRoc1Y5aENwVlY0SXFVM3FxOHhZOXdYSjZZRVdJV3RJaUFKTDV6ZEY4?=
 =?utf-8?B?QWlRSTdlTEcrckNxeUNSM21yOHpHTjF6U05uUExHY1pxaWMwT3JFd2ZLZVBM?=
 =?utf-8?B?c3E3N3JvMTRielF1Q1dJdWdVSXdTd0pMbU5rQU5jUW9XaDNjaEM4eC83dE1w?=
 =?utf-8?B?TlNmdUNSa3hzYm1BY3U0QUV5SkYrK3ptODY5VVcwOVhxci8wMDJvZHNHRnk0?=
 =?utf-8?B?cXFQV1QyVjlPODkvbEhIcHd5ZEx5VEYzZ0UwelM0MkhjdUxSamhlL1VYK1NS?=
 =?utf-8?B?RmhQNWtnRkRycUxLZUo5SUV1Ry9wazA1TzEyRUQyRCs2WkRPenFuMnJGS1k1?=
 =?utf-8?B?dWJwSCtMU0xFcFlwcEtzVDEzbTBMTEY3Zm8wQWJmdGxnLzA3ZHhadzY5aUsy?=
 =?utf-8?B?U1phMGxMY0JIUGVTbzAzMmVmZ0gxMDZSaFVHZkZIa29RejhRR29LK1I5VVhv?=
 =?utf-8?B?L0xVa2Jhc2thV3ZFd09CNVhwVDdZbjJaQTg3byszTEpMRHFuR3pJZ0NWdFdN?=
 =?utf-8?B?cTY0bDJvN2picnE5MDdyVkFiVmpkclc2WW9rUTVSbk9ocXRRT3crNis5UUtJ?=
 =?utf-8?Q?N6+QaHyduyXdNA8nS/vM15KhY6NDZYlq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJsSEpNMkd6V09hNDlySHhEWUtWTGgxYzdTMHZlQVZUd2JTRWkvbm5DRDA0?=
 =?utf-8?B?TjNhVDMzaTZDeUQ4Q1BDUWs2dGd6bkYzZTk1d1lHbEdSTy90ZXM5TEZzR3JX?=
 =?utf-8?B?QmtSVXJkRnZqS0EwZUFCMUpNRkZ4Vk4ybmZ3ZENicnhESGZEM0t1d09pQnZn?=
 =?utf-8?B?UkVnTW9TRzRwQzNyY2YybERnK29uREdWT1lXczlEZ0lNQzF5Zys5V1F6b3F3?=
 =?utf-8?B?Z21qQ1k2ZDFic1dkQzJMMGIzNmFrL0xqQTJicllwK3NNSHE5cXhUUTYxTGxt?=
 =?utf-8?B?NUFSUEZiY3A1Ny9uaVRnUW1idnJBS2trcHVSV1Izbmx1VjJncGwrbEl3Vmpn?=
 =?utf-8?B?QytBaXBpbFVLd3lmYnZ5bnRwQjZKQjQ4WVF0TDUzRnRuK2NUcDV2ZGJnVHN4?=
 =?utf-8?B?TitiN0VYY0p1QWFVNng0NmIvNzdReHZVaGhwN2RabkpzVG9jeEUyRWNqTDds?=
 =?utf-8?B?b1JXWXY4bUY2dm83eWFMdGJKWklpaGwwSjdGYTRYbmZ1Lzd6RG1rSFJRTEVE?=
 =?utf-8?B?S1pDcURDTkZ5TTNJWGkwd2NZemp2dnNPd1laN2lJWk01NE4vRDJWVDlxNWI2?=
 =?utf-8?B?c0YyVVJNemJIWVVtL1lKRWk3bGtkN1o5clBlbXo0QWx2UXpIdzMzbjJWUVRL?=
 =?utf-8?B?cGlHT1NYdkRIb1FDSXg4VC9WTDhOVTlmUytITzhCNWNVVVFpc3FxWW1JRmZY?=
 =?utf-8?B?emZVL2FsblB3YzNBRkk2cG9aWmh2QVZmOVNSRXpmWi81VVdGaHIxeVNNK0Vh?=
 =?utf-8?B?c28rbXBOcnBVS09DTlN0ZFVMSUcxQlcvT0xsejN5SFlta1pUeWwweUprbnkw?=
 =?utf-8?B?VnA3cE1QUzlzZHhyWHFSZXNsQ0V2OC9OTkxHNm0yTE5RM2xaeUpUL3VBL1Jy?=
 =?utf-8?B?bGtlclVCRHJUTnREbGM1VHkrS1VtTTFMeDlPamRLOFlmTlgvUEkzSlc2VVhE?=
 =?utf-8?B?WTd6Z3J4bTNqbU1FSzBRZVR6TFFjTEN0RUpCcXRrVjZGd1hPL1lHcjFOeTN0?=
 =?utf-8?B?R0FiTmxkY2tZamkzcmYyc0JUTEhUUWxPeGJ5SnFDRzlMMEY1OW93MWdrY3hK?=
 =?utf-8?B?N1hocEVZNldhN1JxQy8xcGlMRnIyRTlsazl0a0M1Tno0QVRWTGZiMmVUYkRy?=
 =?utf-8?B?enBzaXhWdW5vS1FHQ0JwN25wOXBWNFI1cWszczJKa0lKOGN6MjNlUlJiQlR1?=
 =?utf-8?B?LzlNc2w1SzZRS0pKTHFVakZYd1cyTDBLbFkzYnR2WDdZN3N4cWlYSTBqWmNy?=
 =?utf-8?B?ZGR2WTZYWXkxZFhxSTEzWGsycFhJa2EyUmFMUkxKTlJFWXVDUE1Paysxdjky?=
 =?utf-8?B?ekR1aTdkRUFONUhicXhTU2kwMUx6RXVFa3BpcTBQc3dYVDBra1AzV0R6MmNZ?=
 =?utf-8?B?Q2pGRVFySEhPM1V4b0NQV0dCWFRPazFvWCtlT0lqb1BhaEV5K2ZiWGlmSmpi?=
 =?utf-8?B?Q0o1Y21oYTJoRVBlT2JYcmc2WVJPYlRFUm9BYXlrWGxiV2hCUUVSb1dSRmpM?=
 =?utf-8?B?Zk5ZMnlZbDNNSkw5NDAxS1hleEtuY21ZZk9VMndtMU1EV2NDUVE1cjhHVGJQ?=
 =?utf-8?B?WDRZT1V5RFB1SVo4aFRaY2dpa3pFdm4wM2xFdkRQS2RjTGtRdUo2MFF3QXNp?=
 =?utf-8?B?NklFRDV4Y2ZPSE5VOSsveVpyRC9UWS9VZWFuZjRrOVQyeVFaS3dCR2E5ajJ6?=
 =?utf-8?B?NkFkUmFtMEptdHl2Z1psSHpIOUVWMUdlc2p1dG1tNzdhSUlYajBTWlFlR21J?=
 =?utf-8?B?d1QwRUU4Z05TNHZQNytvclF0Z0xJZUY0ajJEVHB2MU5KeHc0Q09uSHdlQVdL?=
 =?utf-8?B?b2hFd2xjcmVNZDBCaCtrUm5LS3Z2YlI0c1Z2NHgvVWt3M0RXUDkreHpLeEJU?=
 =?utf-8?B?QVZiVUY5bUlqM2xyNi9SNkJ1L2gya290Yzd3dUZ2L2tNeC8xNTVVQitBTWlp?=
 =?utf-8?B?RHhJczdldzVnZEVXVDJxc2pWdXBaaHkxOExDeFZyMktIRHlIZFk2N1IrTlps?=
 =?utf-8?B?MVpUeW96T2lUejh1dkJuZzJGTzYrTDJtcE0yTGtNNmRLcUFlL1JxK2xwOG05?=
 =?utf-8?B?RmVhL0lUV1NCZnlWNWlqcE8vWFFEelE3NnhVQk4xRnRaRVBDU01hTUlrUDdP?=
 =?utf-8?B?RVRlZUtoRVoySHdMN1JBekoraFVKVXJONGJKRThYZmxlUnd5UXl5MHR3NGhj?=
 =?utf-8?B?RWUySWxidjErNVRwa3hxbWJHTklEZGpsYXBlbG91S0ttRzNiZTQ4RkZUbkNF?=
 =?utf-8?B?aXl6eGdQNmxHV1BoSTM4bFNRWGUvMXlUTTlVK1JhcWIzV2VHR2s1ZFhVbTA3?=
 =?utf-8?B?eGs4SkxHRlRzSW5ybG5INVcrYlRCSUdvcTlFYkowZGNBd1Y2cTZ2aU92MUVl?=
 =?utf-8?Q?wbj5Z99SPHv8ifjM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 384b0d2a-a5b5-4b0f-3278-08de521e8772
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 21:07:01.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06oeQ6cxX01Q1OfHjXzYVMSa7NVCiV9V5sgl4XExPTHRMwsF0bOynS2x6sHH4b4HP2id08i3raJgIUuH/ojnJmwX0VsdMMlX/7XqwMNGbos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF807974CA6
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

On Mon, Jan 12, 2026 at 01:00:13PM -0800, Yang, Fei wrote:
> > On Fri, Jan 09, 2026 at 09:36:50PM -0800, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> There was a BSpec update to incorporate larger vram size.
> >> BSpec: 54991
> >>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_vram.c | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_vram.c
> >> b/drivers/gpu/drm/xe/xe_vram.c index c64d98bf1723..2159d9c33bb1 100644
> >> --- a/drivers/gpu/drm/xe/xe_vram.c
> >> +++ b/drivers/gpu/drm/xe/xe_vram.c
> >> @@ -155,7 +155,10 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> >>              *tile_offset = 0;
> >>      } else {
> >>              reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
> >> -            *tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> >> +            if (xe->info.platform == XE_CRESCENTISLAND)
> >
> > I suspect that all future platforms will want to use GENMASK(17, 8), so maybe an IP
> > version check (e.g., greater than CRI, use GENMASK(17, 8)).
> 
> This is not true according to the BSpec, I do see some platforms >=CRI uses GENMASK(14, 8).
> 
> > Alternatively, since bits 17–15 are reserved on prior platforms, they presumably
> > just read as zero—so another option is to blindly use GENMASK(17, 8).
> 
> Seems to work. BSpec does define GENMASK(27, 18) as SPARE and default to 0. But still want
> to double check with hardware folks to avoid any risk.

There shouldn't be any risk here; unused register bits are guaranteed to
be hardwired to 0's by design.  When an existing register field grows to
start using those bits for a larger value, it's always safe to read the
new field size on all platforms, including the old ones.  We use this
pattern quite often in other parts of the driver (especially display).
The only time it's not safe is when those bits used to be actively used
for something else on older platforms (which doesn't appear to be the
case here).


Matt

> 
> >
> > Matt
> >
> >> +                    *tile_size = (u64)REG_FIELD_GET(GENMASK(17, 8), reg) * SZ_1G;
> >> +            else
> >> +                    *tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> >>              *tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
> >>      }
> >>
> >> --
> >> 2.43.0
> >>

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
