Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A85C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22E10ED39;
	Fri, 28 Jun 2024 19:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeQAdjlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF1710ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602920; x=1751138920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0U4pW29zKRVshgkkWVOXrUxSq76fzs7SMq3srNObR8k=;
 b=LeQAdjlgIWguwZ5ZjI/zljvE3lAUweaj6EtWoyWedhE+zdruc0j07GgC
 4/9S8WisgWzDUDPEVhnGRdOPxCYV9MgYXd7o/KHV1yHFeDFYoMK3SJQ1g
 hON5HfZja3aWA0mJYxFhVIVNzVPRvC/hV+TOuGoYP0+DhpBoYm42sP+QT
 NQ7pz3eSwzojP3k5xFWoyjmiYxCqSNI/CZzEPg25SGoOKm9LH5h7DvTWP
 4RMOKZUsWsMAqiIv2gF/XVY4B4CGzjCDMHX5DqVrkEAdPDdnt1N1bf8AR
 2mvlUTHejNN3XLA9dNH58M9H6JZ9Rn4l6Z7EjYcTnzQ5sPKuUYE367hdZ A==;
X-CSE-ConnectionGUID: 81HL8M0JQoCNv9j3oXbL/g==
X-CSE-MsgGUID: iKrDAGyiRKSC1g7a0fi+4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27931016"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27931016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:40 -0700
X-CSE-ConnectionGUID: fMbGQwPFT0KYk/n0Pzjw2w==
X-CSE-MsgGUID: ECk3b7f1SfC45OxGjONDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253835"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3ZAXcuEg9xtcHcOfuQhP9Vw4l0h8il2F/tY5FIK6WVAImNcV/FwKvV57xsRpTNJ9t/hpAUmARYoIPr9zebErHeGtz9WWS7+A6d7kir7vH2S8G0hivqzFqRWyVuxydohBVdzX1DB2eEJeloTXzZ2q9frQT3HXeKl8XdopxKxExjIwK10BbPK0qMl1DoymngG3Dh+NUb8FgjdmZm4L9CAVZURzFOZc7riRd4AxCZkRH7Jd1XVtnMDZhHR/Gpht4we2EhFEJ6r+8lBgabrxzeXPog+8JFY1mX1OIVcMWvkRdYNUFb6d5gIsdW7QQx732IxxSTRkGkoD4Dh6f/IN6uWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPAqXtZ3Yg1mdTz2t01BByLwSEI8BeKdYE54fgYtd6w=;
 b=cQvCkTHYbhAq0d7oufpX4Y2L6TTf8EsUAyQroZsybeP4JLSLqqba096KdPI085o7GxO3WfcBNpz0IqGIvOih6Q4BsZ4f0s9bWLNvy+DQymj9KraF/siaAmJKnSmbc6UHPTWxDYzL2fOd+muMrTvKOKsGkeiIseABiTb0vSddNMpYioDvfZw/6nRfG796zOA9pME/Ap2je6RBXsXyciPRxMzYoQvESyRV58Vpl5beS9LSR3letg27Emf/ij368kFqlyuBTk3RaiTbccJF7yBevBvE+NGRqUHDTGi3YQnGQByspXbk5WoIdXr6+8HyuEwHXPM2zu16h49OU2v5ixTWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 19:28:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 28 Jun 2024 15:27:53 -0400
Message-ID: <20240628192753.386137-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 432cbbc2-46b9-4897-6802-08dc97a88209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzMxclh0Vjdnd3JJNzFwbmc0OVdCTHc5Uis2azlNVnAvYUh6Ym1HNURMcWRT?=
 =?utf-8?B?Q2VTcUluZEFXcEpBdTR2b1k4cmdlek1la0pmTmtWZ2FJWVNMMzE1MmEwMFM3?=
 =?utf-8?B?N1dSeEw5YkdHVm9CZzB1YzJGKzlFKzl1UzBlNGVkekovOW53MGxDNEhUQ3RU?=
 =?utf-8?B?bnRqdlhIRnRRdmV5bzVKSVp3MDB3RjRqeGZrWmI5VGJEWkRXLzI0L3NHUEhn?=
 =?utf-8?B?MkV1SkR2VWhPSGQ1YUQrNVZJeUp4QWNBRjF1Ni9XVmlpeUUvelNyNDU4ODRP?=
 =?utf-8?B?RElGYmJhL2JYQjlQL1BTR3R3aVVTMkZSek52L0NjOUlITTQzUUkzWFJNbzBH?=
 =?utf-8?B?QnQ3bUl1SmJrN3pLWDI3cjBjMUxRWGNMQ1BibXdtRkFQMEpUVnVtUHkxQUZq?=
 =?utf-8?B?SkwzR0pOQ2NDWFB4YW1NYjhVY0R6TjFaVllzOWhmNk51R3pINllqbmltd1p6?=
 =?utf-8?B?ZFFrdXpMd2tMK244Q1JXSmxMaVFNQnRBV3k0eE1iRSswQTlLVHhJYXJ3SVdK?=
 =?utf-8?B?Mm9Ia3NaNGMxYkpkNE9PTjZiUUE5empRVGJ4NVpNK2U4YmZ0cFU0TW5Telly?=
 =?utf-8?B?amcxd0plcDhxYVJSNDAwUWNRTzIyZHcrbWw3OXBjVTBkL09iWWw3ZFluQUcy?=
 =?utf-8?B?K0xZRFZHeFdtSklObUJvbGRXekd5NTA3QXRhL1JBa2hnOER1UGJwMnc4V0NC?=
 =?utf-8?B?V1poMG9yb3o0VzJnRE44YWxBK1lPZG5EQW9FaXVkK3JabTFPQ29NNmtSeU9Z?=
 =?utf-8?B?NnRBWUY0d1lNT21vNlFlelV0K2U5NHVIYnlkY1J6SXlFemxscXl5L3dQRGJt?=
 =?utf-8?B?NG5aTWU3YzdqbysyQlh4bWFWOFdCWVNoak9kbWxtcXRLY29FRDRaZ1ZZVmpv?=
 =?utf-8?B?WWMzWDhxemY1alROa05EZER4aEFlYzF2UWVPTTgwZkJ6dXErbFFHTjVKWUNn?=
 =?utf-8?B?WmowdGtMR2hUVC9ISlNCU1VyaWRvelRhb2JSWmRjZm5ZWlhadmFHemFhUzJN?=
 =?utf-8?B?dG5FdUtUclZVMDNaRjFXdWgzR0I3TzBuenRKNmcveG84c29Ua2FueE4weXdw?=
 =?utf-8?B?cDhIY3NxZWwzak9PS1RrK3lrUW40d2x6WUdMWTA4VnpFbEtPMGpYZ2tmTU9H?=
 =?utf-8?B?K1BXTmg4eHAxTnZkUVo5WCtBZ3AzS28vQTloUVZwbGI4SVpkeFY5MVhHRjNx?=
 =?utf-8?B?VThZNytONWJUSkUxTE9IbGRSSXc2dXlNU29ib1VtRS9XZDRCSEo4MEtKYWg1?=
 =?utf-8?B?OVNnRXJSbDhhSWxhWmdILzl4WXdMZkFzZHhLQVh2RkpRdEhXVWd2M1djaERv?=
 =?utf-8?B?MnJXTUNwVEpvVW1CUDE1cVREU0UvdWpaMjBadlYycTZudklZL0g0ay9Kb2RP?=
 =?utf-8?B?Uzh3RG9EVXNzUU9QdVJZV2RhZkhzQ0xydWJiU2ZiYVRpY3hqbFpUVi9UU0do?=
 =?utf-8?B?a205czYwZEZRYlIzb2JaQ3RXcHFwd1YzZGw2MmVUUU1GSCtpb2xGNUd0TUQ0?=
 =?utf-8?B?VTh1eHhkVDJjWlZoWVBobFZqc0JEaWVFY2RjZmdCYW9Sd2o0Z2EvVjlqdmtn?=
 =?utf-8?B?MWk3VlNaU2NKRnJDdUVpUVpnakR5U0h3eng4bC8wMjVoalFzYXpCaWhRUnhK?=
 =?utf-8?B?cThvSnI5Zy9Ua2ZOeGdUQUp3UVVKNkxQeWtJUGM3S2VrUGVzbXFsN2hDVys2?=
 =?utf-8?B?eTlIZzFMOTQ1Sm5UWHNqUW44eWsxOWtmQU9BWDk0aVNUaVRsM1V2WDRNRVJk?=
 =?utf-8?B?aEg5VTk2d2N4SlloOHdhZ2VQZlZCSTh6MW1PSFhtUncvWTRGTVZhaC9WNDRE?=
 =?utf-8?B?NENjTWVnRVNtS2NZbmRxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlzS3ZLL243S3lzWXdrQnkrY1IwMmtNOEhpMjhMeFprK0VRSXVNMmJEYUVm?=
 =?utf-8?B?dTh3ZE1jREJyMDZHMlhUTEVyRXZSVjBFQi94SmNuLzlMQlZvcGtIdVg4eXZi?=
 =?utf-8?B?NVd2cVFJdmVVQ1RqbE8rNG1QdTBpN0FjYW5KOFpFTC9obC9pNGZ6dVNCeVlY?=
 =?utf-8?B?UTI0MWthVzh1QVFGcTFTVFh1elFENkovc1ZwL3lNSTFvUWNhV0QrR1F6d3pm?=
 =?utf-8?B?UDA0QlhGMHBKWjB4bXI0SFZxSURVazR4bXdVVkxkNklTamxzZDhjWVhqYXpo?=
 =?utf-8?B?ak4vQXZMZ3k3dFYxRy90S0s3dVlNWW1BUjUzQmlTOXlyWHpySHlxVzhNQndE?=
 =?utf-8?B?QXBBUStIOGFGZ2ZybDJOeVBDbVc1bjZqZW1Cek1aSEpFL0tscmc2alVDa3la?=
 =?utf-8?B?Ry9MdTNabVFWV2E4UHVHeGFZWE83Tk1wVSszc2J1QjExMEMweExaKzBzajZR?=
 =?utf-8?B?dGpqbzFrQmhRb05RcVpXYm5xenY3TTBjVGluek1VVkVwYkpXZ1hSSEdnelcv?=
 =?utf-8?B?Uml6UGtITlNlbzV1Um1reWZZU1UzWTBSYnJReWRiYjcrOVlsaE9GbVk1SWJw?=
 =?utf-8?B?aFFCcGkvMmpHN2Y2a0c4NGZoSEZtb1NLd1p4elU3bEhBNXpJbHpBdDRQU1hG?=
 =?utf-8?B?T0Fibmh0QUFMcUc4TWJmOTVkTWtkK1V2Z2szakJDbklnWFB3anR3OTVDSU1m?=
 =?utf-8?B?NDBIZUxJcmlxOFN1WGMzUDFVclBlUncxb3prYi8yU3F1Z0U1N3NXa1FRR3hB?=
 =?utf-8?B?Nm1xYzJCejlqUjg5OGVGKzEyZjFVNlNmNkM4SkVBZlBaQWVDdmNVMFVBY2dK?=
 =?utf-8?B?NnRTSXVCeTBvc1RYdGJmYW8rSTMza1cvWmVPVkMrZWFBU0VCdVNDbHY1emJq?=
 =?utf-8?B?MTNHTFJPY05sYkxFanMrMlRaaWMyRFRJTnZ2amdMaXhXTTJrdE52a3lZUVB6?=
 =?utf-8?B?MTY3QjBiSnBnVDA0a0ZkUlN1TVc5SnBoQlZteGJkdGVvODRQalBGc1BFNlYy?=
 =?utf-8?B?YjBMK0VjQmNML0JXL0RQSjdoaGJSSEVjRkQyY3hwb0Vma2Z1S2dUamVEVElL?=
 =?utf-8?B?bUdoYlFJOFc5VGtsYTg5QVlFeHJQcHhVY0ZUQm1WWHhxOGJodlhFcGZiOGV0?=
 =?utf-8?B?VTlKSVdLekxoWUdta1JaeXEwbWhYZGFMZUIyak5EaVdYdmEvd0tXZk1WcDBV?=
 =?utf-8?B?aUtuc0tLM2RoSjhJd3ZyeXR0R3VDeXZpaVhtTXhXY21mbVNlMWtpb08zbTVO?=
 =?utf-8?B?Q0JVQit4SDFKaEdPUmFUL2JsK1dnYTF5RGpZTkh6ak9EcHFIcjNQblB0dElT?=
 =?utf-8?B?blE4MU9TTjdmZTB6RW1VUE5iN2pXTFpKaHRyK3pxWG1MNjB0ZFZialV0c0Ex?=
 =?utf-8?B?NUZFaFluOWQ0dWNiQkFkVmZnckNoQS9HOWRhajZaa0ZkYW55bjZYU0V5Zjcr?=
 =?utf-8?B?eXpjK3FiV24veG94Y0hHQjlkejFPMExIdjVSL0kyTlNVT0dVd0syRHllcXhi?=
 =?utf-8?B?YmNpOHk0a3krR2lvVmhGNGVhanRYQ1BiaW1LVmh2ZjFMaXFxOCtGbXlBaUdi?=
 =?utf-8?B?VUtsQnlMcW4yZjFHaGppUVFQbHJwaVFaeVlFb1hmT2gxSEQ1ZzZ1ajlIRzdX?=
 =?utf-8?B?cEdFeGJvNk83YVFmQ0oyd1YrT05Nd1NzM2o2SkFaZnBqbjFaOWkzb1ZEYW00?=
 =?utf-8?B?TlQ1T29rV1hSRkhKdExzRHlrZ3g5ai9jVFMwdWNYZ2Jjdnl5WUhTQUJhaWoy?=
 =?utf-8?B?L1JSWGN3cXJxNExPN1JGYXRBSVdPRlcveHVHamZsRmkyTnhiSFUrT1U1alpt?=
 =?utf-8?B?WFEvUVFFNUNIaGJIemNyOHhLVGNkelNNMW1KcFFNTUo0MUducjFuNGJ6Y0Zl?=
 =?utf-8?B?Vko3Mk5ybU12RUhVUTF3Z2hhdWY3VEgwOFdEWGlpRFdnWjBTcVQxOWYyVnRJ?=
 =?utf-8?B?R0pEVlNUcUxjR0xKc1JHeXpPRFVmYUNRNU9FQyswSERJM1J1YTUwR0VkSjRS?=
 =?utf-8?B?Qm16YUJBUFozbFloQ0hNZFAyUDJGWEc2QVZkSTNEN0JIWGp1ampJVkg4NHJl?=
 =?utf-8?B?YncweWlSUUswdzArL2x1ek1RRjhSNkJiN09ZN0hkYWlXT1dyV2dQN21UYzBY?=
 =?utf-8?B?ZmpYbVIrYVhXS2NYTDc4ZW1maUhYb0J2OHloR0RHMkhHMWw1WlMxK0RYbHdP?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 432cbbc2-46b9-4897-6802-08dc97a88209
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:37.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzVHcpXnkjcW9E7SbGX+By5p7nxuvsIVdBLtkWJAPjxPcWCqp6harf+oUCEc5N9eTcLJJquTJexuFgFiXzXRMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 106 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
 2 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2355fcd16349..0605c5829a2d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -158,6 +158,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -237,6 +238,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -271,6 +274,67 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	kfree(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		queue_work(ggtt->wq, &node->delayed_removal.work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -477,7 +541,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -494,46 +560,6 @@ void xe_ggtt_node_force_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	kfree(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 60cbce3170d1..5ea12ea30a4d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -45,6 +45,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -59,6 +61,16 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 /**
-- 
2.45.1

