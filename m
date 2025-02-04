Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B4C02197
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 10:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09B910E5E7;
	Tue,  4 Feb 2025 10:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmq2roXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A310E5E7
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738666310; x=1770202310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HarQfN+FKQS6Uz6kXTMh813CLkmdQ6CPX7CVFD/KA0s=;
 b=hmq2roXpmT7bbq0Fk0lM3oeyi5jemayr7rPd98uXSiMOz763oUipAyg4
 Q014bp0hTpGoTCbPKV871Kt5M8+e1PCCv4npgiwS1PSnSfzEoKp4UNKQl
 HU+k5fcpEJsqzL8o1PZoZmyWeTtf33MRayVzf1f6xX7AZo0Puvn5OspSH
 e7NFFcas7e8o0YDUIgomSL1hNs118IlC/GHfLV4KELhio7igtJB7MhlBs
 nsEvB0Mi+7K9M/NFftaK+K/tJya43m4qj6LcL8RjpfpeFF3wb476EtWkO
 epEvkB4PaRl7/VMtPKg6qFsW4FZ4999TMgA8IhAxsf0UvODT8+wSXf3Ia g==;
X-CSE-ConnectionGUID: UdYT4eVnRDKai5upHj2QNg==
X-CSE-MsgGUID: svoUm262SzmvpjymHWY6Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56724412"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="56724412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 02:51:49 -0800
X-CSE-ConnectionGUID: 1ogtkdy9Q2qMdUBT1rB6Dg==
X-CSE-MsgGUID: 0C1gwQFWSkibgM7Kv1RtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110343843"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 02:51:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 02:51:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 02:51:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 02:51:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVIlcZ4pex0HZs8l03S7YscVK92Ir3CjLPPe6DT4RGIPrVnFUePRtNAcAQOfkZ9GeCJD7xzJbSmRYgkOzFYbaMcZYtZwT/PPO3xD5uvBPK1eXHqbM43/laR5u/AVuxiKTRdg+0zgPtfLZc6lw97E3oPsgVjQwmldH5fqv/HP6xQynXd/LLYpZtd2gClSBQrVAh12aeQbJsjIBnBfCrrIA3WLrqvzASGEEVyHhl9SzCB2gCy3yWgSOBnDGaVqCk2UemZKI7pWVVJSQQAr9+Fyy0DokiNdWKM8q9P6QXrbuwKQIGWcvmmEk0rBhQyNPOI9PrNL9ZnQ6Ma8ts7Lq3ZMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/QZANQiMLdJMglm+qoQduq08eABPHBy+0jy5M5p5Qk=;
 b=jUjebX4z6mNg4/pahmc4qKFTz6EgVR6FbDWGAry6HFQu6gO0eRoWIfFao9v0QTZG83NrUDa1y3Xn806izYx9TOK6jrsG22obd+lNVcuK1EoWbzcLBWybmY2RcKBAcIVKTqJb6oPq4QTycOk6tAJOFGYuEhVU1hQNLza9Ts/TC2ubt1bzG+HYvhmr5jg5JwNg3AtT5mGTVnRUigwGoxS+h14tX0ZoyGMr4Rz+YRBjgiP4YF9VrIw5pfH70dlC+a6xJaegJuW4oif7ibLqaNoKyFIuvApuN7pUwCDxECVhSqFnVbDUv+jZtOl6ESH70TnBlJ6/vy+Fw0dFk4j/VHbCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 10:51:47 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:51:47 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 1/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Tue, 4 Feb 2025 11:51:24 +0100
Message-ID: <20250204105124.795989-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204105124.795989-1-piotr.piorkowski@intel.com>
References: <20250204105124.795989-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c284ca-b649-4815-1cb9-08dd4509ec3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FLSzNML0Y2STNJMzdIWnlDQml5dFBCYXR3OWNXaER6N0RnMk5FQnFrN1p2?=
 =?utf-8?B?WVlxYjk3SXFvYitTQnVMdHJ5YlpDSk0rbk96UHlScVlDbUxSa1BCWHNobURk?=
 =?utf-8?B?V1htSUgyWndWaXR4eHFTM000c0x5TmhUREhjb0lkNmxpM0dPMHBsUzUwU3Fm?=
 =?utf-8?B?N2ZCM01kUjNSOUdudGpyZXlwMlA5R2RrMzNnb3V3YWp1Vk9RZ3RrTmtGaFNw?=
 =?utf-8?B?RUJrSGpFSThPTVo1L0V6RE5GS09nVE9oWGtXM1Jxd1hjQ0hPYmJVOHJSN1RT?=
 =?utf-8?B?TzBGaGpnU2h3M05XNkxZZXhPemVCVjhhRC9zV2I3ZExjUWxiN0krYUlkWkRk?=
 =?utf-8?B?N0xwdWtQNENuSTh3d09jRmNISlNtbit5Z2oyTkx1dWJGSlhmY0dIQ2tucXpX?=
 =?utf-8?B?QnpLL1VOb2RBNk9OZDhUQXh1VktreVQ5NUFRVEdFa0U0cE56SE9YNmtXcmtT?=
 =?utf-8?B?MC93S3pPVmhWc3BicHltekFsS1I0SGdtSFRrZ3JBUk5kRVFiaFdub1JvYXBa?=
 =?utf-8?B?NUVFQStRdnpUalpqZC81Rnd2NmNTNVR1TzhxNEpxbFpYTTRDUlRPNm1RWGdu?=
 =?utf-8?B?M3lISlZ4RnVRSE9XVjA5ZVFEbEw1WWtwc0xRa3JZdTZYWmpGS2E0SmdtZWt2?=
 =?utf-8?B?VFMwTHN1T1NoblplZXBSTkxwSlV0dnVUYTdtM3RuTG1xR1d3RlVMWkNNN25h?=
 =?utf-8?B?SUVGU3hpK1hCaE1nZWI4NUlLNmh2bktQQzA0L2p2c3BYbCt6VmthcTlIaUti?=
 =?utf-8?B?WmlKUkNwWjRGRytsSXpTakpOUmk3Z0hmVzFCYUpyUWlNakpPbUF5L2grQWJY?=
 =?utf-8?B?Z0lPdTIzQVcwa29Fb0JrQ1d1MU1xeHgvUXpmVVdBVU5zbncydE1qRlJXWjU3?=
 =?utf-8?B?RlpGMFYwNXUzS1RmcHJIck16RExXYjRlcWwzaCttSEhVM1YwZnBVVUlCdlNC?=
 =?utf-8?B?RW1rM1pJV2dBT0RvUWhZODJVT2J3Y3g5Z0s0RWQwTEZGcXlzUEJOT0pLck1G?=
 =?utf-8?B?TWNJdEprOTNzQ1dMUUd3UmZheXNUVGcxdHlwYi91UTZNREkydkJGOWM5cVJH?=
 =?utf-8?B?TEc5eXNKcll2WGg1Ym95OVIxVVRmNThleVlzaUpoVlRvSTgzcmx2NlVQaWR2?=
 =?utf-8?B?Y3V0THpPYlRLL0h4eEVlSHlLeUdqQnMrWXZtc21iSzFmaTkrMVZsMC9BZFdE?=
 =?utf-8?B?L1RVQkV6UktLSHJ3Q01mUWpYNTd4emM2bGsrY2crckJLUWQvbkt0eDhCaFF1?=
 =?utf-8?B?c3RHR2NZZStCSEJqc3RpaWhOMFFSQUF6bFhhbFVvZGVxWGJ5TTNUeWdOMWE5?=
 =?utf-8?B?bkFPVFhyUmt0TzFMRm50TktwR0gxdWl3aVlydXFRTXl6Z21JSjdrWEZqank1?=
 =?utf-8?B?TXJhWHJFaGlUL05XU244eWI3QzlUM2pzamgyZVlEYjY3MXpaMGhYSFdraFZz?=
 =?utf-8?B?MVdsRzg4a3Zhd3NmeDFlOTI1Ulk1UlpDTzA1Y2NFU2tyRElZcWE4dlZXTVV1?=
 =?utf-8?B?S2dDMVJqTGMvRHB4c2JtWGtXSFJwOU9uV3owbTh0Y05lY2djY1ZNZFlHZjUv?=
 =?utf-8?B?aHQwUDlhUTBKZ1hHSFJTblYrN2ZjWVo2dGkyanBUb3ZkQ1hVZmg5dlI0WTFS?=
 =?utf-8?B?R1RYNC90cXlIb0VoRlZtRXpKUFl3MzhxYTVzRUFGYmNidFlMMUV6cUkwZ1hD?=
 =?utf-8?B?c0RFcXAvRmh6NFRVOHlpSmZGbjNQaXZKSGhNeHU2NllHcVZsSVA3ZStjdDds?=
 =?utf-8?B?aFdZOC9FSHl3aDRiQksxa1RtM1ZRUG9KeDB0djVUL1JBZVN3RHovZ2RPQlJo?=
 =?utf-8?B?aUdDZ0M0cGNNd3c4cmdoaldkUm1RclNSZmFtOWsyT0tNbTNlVW9DUFc4WnIx?=
 =?utf-8?Q?3ckrrF7mZ2Is7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3VSL3B0bklLN1pWR0hpUjNYRElwYytZOUlCZXNzekVTT2J1TzFQUlVaVEpN?=
 =?utf-8?B?cDZRdXJTckxtbkY2RkVvRFp5SlViakdRTEpseW1vRiswWTgvUVppUWRNZFdj?=
 =?utf-8?B?em9uQ1pFbjR1QnY1UVVyREFYdlA2c2QwRkZNYlVLWXV6c0c2bFo3ZDdEZmQx?=
 =?utf-8?B?Tk1wWDlHbFBWdWFuRDlTWXNTcGp3enBNcCtrOWVFakJXR0E1Z3kxV25aQnNN?=
 =?utf-8?B?Q1pDSHB6SVlRdGx2dmxQWG5HT3RyNHZNaXd1V1lUY0dRVkM1UEw0Y1FiQmtL?=
 =?utf-8?B?VWs1ZUc0UlphWk9DVUFXWVVvcmY4MXBKVUl2MlIzVFEvU2k5VW9MTkdIcnZm?=
 =?utf-8?B?Q0MwRGhNaC9GZkNWUXplajZwb2o2ajl0Y1FQZHdUaC90NHYrZ3VrZERCcjhn?=
 =?utf-8?B?ZXBMeldKYzArUk9XanVYcHJLdVhHSWZxVEhUWWdadzBZblFJakJaWWdCQ0RZ?=
 =?utf-8?B?M1YvT0Q2WWoyc3k5NWZuY1FJd2NaM0lsSEhoUnB4ZHoxdlAzM1lLTFQvZjR4?=
 =?utf-8?B?WlN1QTZ6OFV4dG13bUNCS0ZESXgyeFpPeVFYQ3FBM0Q1L1VxZFJvNENzWWsx?=
 =?utf-8?B?SDQ3RDVOQWtaaVFLb3VwU0dxZFlBeVptcE1Ka1I1SzNqVm9XRUZjRks2RzlS?=
 =?utf-8?B?NFRIbVAzaVdLM25aZGlVRGpYNTNxUU1NOHJCSlZmc2dQU29VeEVkcUpTSndJ?=
 =?utf-8?B?ZGdzRERLNFNBTVhoZEhVQXVKQ3ZhMDdONW84OGw3TGovMUFkdmZJWXd0S01T?=
 =?utf-8?B?UFVKcmJkQTlKMzN1cXdtWDJvbC9rcWxtZElZZWlKMG5BeWpoMzlidEtmL0VB?=
 =?utf-8?B?LzdoU3JmYUlscC9ZaWdJSUxlNFc4RFJ5V2k1Q1U3QVFnZGZhRitDem9rNENh?=
 =?utf-8?B?eTU1aUozamtVanhOWlF6V2ZsZVorZjY2ZzZnOEZHc3B4UzRCTVBkWVZaaU5M?=
 =?utf-8?B?ak5pN1BDUzhUZloweTNYeWhDbjBWdWRHNkRFUzlkRnNZSElxNURBOFZBeENa?=
 =?utf-8?B?R2JnUlVkc0wxVHJoRDgwQVhseEhmdSs2L044bHg2Y2oxeTUvRHlGOUhUQlF2?=
 =?utf-8?B?TFJhcHhTbUlsUTZJR0pMMFZjcVo5KytsZ0xhTmt4UDlYOVJmd01mZXBzbWk3?=
 =?utf-8?B?WVc3QU5sMmVOcXYwY1JTaFlOZi9TMXpwWjNvNTk5TjVHYStDVnlhR0lWSWF4?=
 =?utf-8?B?alI2b1NRNks4U05qaG1rOXRBY0dwZ1MrL2VDblVLNGVZb05ZblpVZFB3UW8w?=
 =?utf-8?B?aFZRWjJKZk9WSDRLVlAyUlMwb1V2b2FPdzFrbXZWZW9ha0VQQ29lZ1VxNDhJ?=
 =?utf-8?B?S1krUlFHVHhmV2NwNWUyaUwyODhoVnc5dDhlcWlCeTJiZVVzd3VMU0ZiSFpR?=
 =?utf-8?B?ZDZhWXVRTWZtbnMvcThhSVpMVHFIVnFjRWlHbjd0VFpoM2xtKzM5Vy9yaHBL?=
 =?utf-8?B?aWE2b09Nd2JlSVZlOVRzRitUN2QvMXAzVTAxWHBrN0R2b0IrVER3U3QrS0Nj?=
 =?utf-8?B?QzRQRDhPUmM4MHp6YnIwTjBkMXB5K3pJL3R6NWVLMWx6VzdMZUVPaXl6OSt3?=
 =?utf-8?B?RVVabVp1V3JtaFF2bU5PaGhjN1VDZS9vdTEvTUpvdVFwOWtFaUxYY1FYMGhS?=
 =?utf-8?B?YlR0NUl5UmFsQkJ3SlBCcXFWZEtkZXA1VkNGR3ZnV2pGREhVd09aMWpKOWN3?=
 =?utf-8?B?OS9keVBYUGI0SktDYUExdktzK3NpVXRtVnJBU0VuZ0NPR0F4d2dUVlZaYnkx?=
 =?utf-8?B?MTFSd2xoUVhiUXJjaHF2TEFSMlV0VHBKQ0hOay9BejlmZUZrWTgzTVFzTmhx?=
 =?utf-8?B?WWsrQlF6TW1ZalFsTExZMitlamNFYVBpY05veTgvT2xOSFRBV0pzdHpCMzZC?=
 =?utf-8?B?QUVCRTRiaDd2SzJDZGYva1F4eVRIZVJOZVZaaXZlSzZid0t4Mjc3ZGtWclB1?=
 =?utf-8?B?NnBlRGk5Ym82bk5WVVpMak9uVFVxZHd5NGt2SStrL0V3K0JDdWxEVWJ0QWdo?=
 =?utf-8?B?Z1IrWHZPTTcrRjZXWWRDZDlBVmhTNEpMSVZ5THQrQXpQdWV6UzR5RE5Ldzh4?=
 =?utf-8?B?ZVdLYldlRm5RZGkxUUtnK0w0VGNHaW5SbGhhMk5sM0Vsb3RMUXZyVjl2SWln?=
 =?utf-8?B?LytSSTdEYmxYdFo2eGQ3SzVpYjhLSDhxNnA2US9QQytBY3dQajVxaG8wMmQ3?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c284ca-b649-4815-1cb9-08dd4509ec3a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 10:51:47.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EScVpxoMIGgBeCL6zGOEfEwJytrUD0zxmOuWNGOe0BlAEXRkS302P8n0dyIsEVpWWIPsv6yomV3j/WKbsXuKL1iX1HgaviAO11FH72PxSeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

So far, the main condition for using LMTT has been to check that
the device is a discrete gfx. In addition, we have checked, using
assertions, that the device is PF.
Instead, let's add a dedicated function to check if the device
supports LMTT.

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++----------
 drivers/gpu/drm/xe/xe_lmtt.c               |  6 ++----
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index fc3c2af3fb7f..f5f6f6c58914 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -170,6 +170,11 @@ static inline bool xe_device_uses_memirq(struct xe_device *xe)
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
+static inline bool xe_device_has_lmtt(struct xe_device *xe)
+{
+	return IS_DGFX(xe) && IS_SRIOV_PF(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..3f6273bd09ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1336,8 +1336,7 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	struct xe_tile *tile;
 	unsigned int tid;
 
-	xe_assert(xe, IS_DGFX(xe));
-	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 
 	for_each_tile(tile, xe, tid) {
 		lmtt = &tile->sriov.pf.lmtt;
@@ -1357,8 +1356,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	unsigned int tid;
 	int err;
 
-	xe_assert(xe, IS_DGFX(xe));
-	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 
 	total = 0;
 	for_each_tile(tile, xe, tid)
@@ -1434,7 +1432,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		if (unlikely(err))
 			return err;
 
-		pf_reset_vf_lmtt(xe, vfid);
+		if (xe_device_has_lmtt(xe))
+			pf_reset_vf_lmtt(xe, vfid);
 		pf_release_vf_config_lmem(gt, config);
 	}
 	xe_gt_assert(gt, !config->lmem_obj);
@@ -1454,9 +1453,11 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	config->lmem_obj = bo;
 
-	err = pf_update_vf_lmtt(xe, vfid);
-	if (unlikely(err))
-		goto release;
+	if (xe_device_has_lmtt(xe)) {
+		err = pf_update_vf_lmtt(xe, vfid);
+		if (unlikely(err))
+			goto release;
+	}
 
 	err = pf_push_vf_cfg_lmem(gt, vfid, bo->size);
 	if (unlikely(err))
@@ -1467,7 +1468,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	return 0;
 
 reset_lmtt:
-	pf_reset_vf_lmtt(xe, vfid);
+	if (xe_device_has_lmtt(xe))
+		pf_reset_vf_lmtt(xe, vfid);
 release:
 	pf_release_vf_config_lmem(gt, config);
 	return err;
@@ -1981,7 +1983,8 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 		pf_release_vf_config_ggtt(gt, config);
 		if (IS_DGFX(xe)) {
 			pf_release_vf_config_lmem(gt, config);
-			pf_update_vf_lmtt(xe, vfid);
+			if (xe_device_has_lmtt(xe))
+				pf_update_vf_lmtt(xe, vfid);
 		}
 	}
 	pf_release_config_ctxs(gt, config);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..edb3527789c3 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -161,10 +161,9 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	struct xe_device *xe = lmtt_to_xe(lmtt);
 	int err;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 	lmtt_assert(lmtt, !lmtt->ops);
 
-	if (!IS_DGFX(xe))
+	if (!xe_device_has_lmtt(xe))
 		return 0;
 
 	if (xe_has_multi_level_lmtt(xe))
@@ -485,8 +484,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 	unsigned int level = 0;
 	u64 pt_size;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
-	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
 	lmtt_assert(lmtt, lmtt->ops);
 
 	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-- 
2.34.1

