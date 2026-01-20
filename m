Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E73D2ED1E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 15:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73910E620;
	Tue, 20 Jan 2026 15:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgcjTxsi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D8E10E620
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768922878; x=1800458878;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h4DALH4rGcLg6yjFoUdrbWfLAb8I9ekiPY6UzaiIxr8=;
 b=VgcjTxsi0hBV9I0K0NJMerUtiqqcL2T9UkkzgAX0JUBKo0D9u8llQWO7
 MhANyy/12HNt7Vv+K+rCmaO3U1rWxQXXrZOwWBdkj8KFl+5Y0JoAyYYc5
 uOs7Zu6+zmm409lsoU/sqffkH1lyWptpCGYRZp3+Uatbpoh9dpSjuhHy9
 HoROaNuYC12O2+9gIt6hWXCIL/+hk7i8Gc8cvT8rEQPxzSSX9R4Dj1bgI
 l7xiscBsXBA4m/7EWNMdkfphwXV7DtKzD2GsVVtuhU1NNETfYmD6GxSV3
 TUmOq5RxP1RTsa8rxXLo3WDIDq5g8ft4SXqZf5+K4T5PKv5f/xZ6SxXk/ w==;
X-CSE-ConnectionGUID: qTWh+G4sRNm0Dwx5R4aUKQ==
X-CSE-MsgGUID: RT6aJBqTR2qCn7yLo57OSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73989138"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="73989138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:27:57 -0800
X-CSE-ConnectionGUID: dkPM+er4QC2SX9ezH3l1BA==
X-CSE-MsgGUID: S81JYvf9S0Om36Zv3G+HzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206192310"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:27:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 07:27:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 07:27:57 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 07:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsoIR/SZ6bX8Ir91dcKzzRI7FhJB/L65dDzb40T7lEzQ6ATXsK3ZNA69pULWoMTZWe6hcN81yNzR9yXGlSwkZssphBthg3Q8jlzTuwoJvJQj1V2+qdtb3A47jYRyfuFDGbR0ltVyhqz6y66/wI7S1nOFR++M7kc+uXIGdwiV889eEa6JErNirr4zIWqyAscOo5O5vPtBwoO3EYsGEzqD45715tixL+H/mU76+XYNun05F5p8M0hqOdP68NKsteZU0MBLlt9GeFo8dDfrAERLcCTER482hYVW1ibGt5tmV7T45BeYl5JyKrtpxAqHtB2hHUwo95+8elbccWhuCENpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dfwzf9MqEBXbG1jul/9D5SkkkkK5rryMF/mPFdNZdk=;
 b=dsisyzGx/5P3UFfA6uHwfI4RIjLngE11TtBFYjt2xzR6d1O4ilGPGhZUZx9P1Zsld2b+auowFnUJBi5fNcvNtORPaKs+d+2rzhXqWtvDTurG85l0BzlMvTtta+Xt3BXllWnAmM4TOC7DKpXS11OM+i7jAGdNK9SL3icVLYHf3yfH8Hd1MvE0CyapB20m3+2/tu/Ft6060nEd0Gdw8eFN+UNbAzuVG9Yvmik0+29rKk38tJyZqsRuuCrlIhUm16Wdtc8BbyZlFCr+wD3syTnQ7l1gbRNfIFZK3RlYCZPhsINlceYcwaNWt2z7A9voRMHZ0NVnQcNhFEKwJgLPEgGckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:27:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:27:49 +0000
Message-ID: <5c7fab64-3ed7-467d-bf97-48f1936c8f64@intel.com>
Date: Tue, 20 Jan 2026 16:27:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20260119125101.277182-1-dev@lankhorst.se>
 <20260119125101.277182-2-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260119125101.277182-2-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c94410-78cb-49b5-6ccf-08de5838782c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0lheEpOMnpnM1UzaU1aSjZMNER5MzBVdzdUSGJsb0g0V3A0Z0FsaGVSeFU0?=
 =?utf-8?B?Z1IrN1lieUxuOW14czhYZHdheFRNc1A4R0FhVDY4ckNiQS92V1pjMk44MHQ4?=
 =?utf-8?B?RFkrNFpYRVc5bEt2S3ViRnZuenMyNThuN3NjZDdqQk51ck9INWxZRU1rVklY?=
 =?utf-8?B?UXdsWmpmMmtiSXFOekNWTFpqTlQ1Wk1PTlplb0QybEl4R1kwLzcremJ6V2Fu?=
 =?utf-8?B?UGFwa2Z1TmZKdkc0Sk4zQnloZk5zSEQ1ckduemNlSmJPWEZtYUR4bSs4YWJr?=
 =?utf-8?B?blczRko5aVVCbkdDNTJjbnkva3BmTm9iNjI0L3BicG5yUjNLZGp2VDd3c3FW?=
 =?utf-8?B?S0Z0SWpNRERidG9Va3ZGYXNzMGFIbi9XOFFVOXNlc2pjd1JiQmFGOFRpTkVH?=
 =?utf-8?B?ZnpXeVBhckVNT2UvTm5rNkdBMmVYQzlmeDQvcHFqOEEzUmdVMER5NllucStP?=
 =?utf-8?B?VnJkbjlrYW9uQnBzbzJXUWhBQzdGVndVU3d6d2ttNXJrd1JMM2FHU0VqMTlR?=
 =?utf-8?B?OHo5bU9IT3BKeW52d3VnaGIwalNFQ2RtUmNtc1VMV2U5SjBVOUxUS3lsQkNF?=
 =?utf-8?B?MU14QUF3Q0xyVDNFdGhpSkZNWTRWRkhVTU1ROWlpenVxSUwvZTRob3lKcjRH?=
 =?utf-8?B?SnNtU1JmanlCMkNaM3VMTThmUEl3OE0xbFVpWVR5K0VJS0tCN01XRUN3TW9U?=
 =?utf-8?B?ZFpKZnR6Skk5TWZDcDhFSDZETWRDRnZpNGlrSkkyTXdaS1MxRUZYUEFsbHk1?=
 =?utf-8?B?L3JGRkVqVjl6bEZ2MVZuU0YzRnh0UWJ4ZGhOR2w5bmZKSmtoVFNrbnA0WWRp?=
 =?utf-8?B?ZlpTUVVhZmFDVUZSSnd2N3l4elYvN3VTbFluWnVrK2hFeUM5QUpXb3U0Nm51?=
 =?utf-8?B?TlNsUEFCYVJneFpjRkhmVDlnUXljN2FCenQzNGJHNThIVEFKZGdOelJ4SW5I?=
 =?utf-8?B?ZnZ1Y0l5N01jaENLazVacGlvSmREUkN1cE9VSndUVWc2ajhBcVFwOUpkNUR3?=
 =?utf-8?B?bjZTMG5mQ3p6QnMzT1M4S3NMblFSVUVJbTZkWENMM0txdGJ4NDNFNWw3YlBa?=
 =?utf-8?B?em5KY2VnTGRpSXZXZ3FsN05vK1g2MUxWNS80TmNjMUZPMy93V3FyZW9udVJt?=
 =?utf-8?B?Zi9DYWtlUzI1VmcwVXdjbHJ1MklFSlhuOWV0L1F5MHlLam9xbWZZQ2RzMi9F?=
 =?utf-8?B?VkwwalByUHgzK05GdFNPLzYxSk53RDJDZnFmbXJkWmYveTlKczZMbmtPTEZI?=
 =?utf-8?B?YWlzR3UwdC9neXFPa0l3b3Z2UWRTbk9XZG01QXh4RmVNRG52MzdBQVFGUVRm?=
 =?utf-8?B?QUs1TW5yQ2JLK1A5UEVpUmlrdUkwNkhXR21OaGUvYXFubGd0bHowdkMxcWI0?=
 =?utf-8?B?YUtpQXNRaXpCWnpHTHJFWUd6OExBbkxGYmQ4UFVxK2RBR2FFa050dFhHbVNr?=
 =?utf-8?B?WEUxY3BNVmFZSFVMcmV6N1VvY0g4ZExlbWd1TFhJVGY2YUM2QTVydGUrcDFh?=
 =?utf-8?B?WjRPdEZXTUp3TlNBY1lIRUF3cVgzblhpV0RuTXRjQmxGdU5jSENIaFhNZXdw?=
 =?utf-8?B?MHhzNFBSaFBTWThpTXlOL1JTeHlNMFErcFpSam9kR2JMVHNDQ2JIdjM1NDFQ?=
 =?utf-8?B?L1NadVhNRkNVVzYwd1NienkzQzlWNDdLYzFldWVSd1crbVBQVVptL1dpM1lj?=
 =?utf-8?B?eGdQdGZPcVJ1Y2dIbmFSdkVyQ0hXcUsvTlZzQm9mTHB6SlJpMnl5VDZCN00x?=
 =?utf-8?B?TTlHTVREMlNxTVdDUW1UYWV3WXV1UGt4U3JMQ2F6bTlTMlpLSC9jajJzUlBk?=
 =?utf-8?B?dmk0RkdIc2JlcmdUN1k4UUVya0pXbFhoZXNhNUpHSEYxazZSUDFmZnFZUUV3?=
 =?utf-8?B?WUtkSGxZSkFIVG4vZG9kb2FWMVB0SmNDYW1PTE5DalFKQTlKQWIwL3hQV1d6?=
 =?utf-8?B?cVJhYkNXQ28zTGNRUm5QTTZWcnJpNUhoZTUvTDNSVDFsQ0VZbXhEUnJoSHEx?=
 =?utf-8?B?K1QrUWJ5VVdlRlZuR2xuQ2Q5cTBLVkJ6VVMzOHJ0ZTVEMTV4ekxEZkVWdkNV?=
 =?utf-8?B?L2hYSi9QRUttNndEMUlJZ1M5ZVNRZ1M2cGdMQXo1Wkd5QnNUNytvNWxnMmRD?=
 =?utf-8?Q?HiKo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWhNWWgxeFVZTEJwTEIzMTMyV1ROalVFMWlrSFZ1ZTd2dTlab2ZHb1hGNjR2?=
 =?utf-8?B?a2Uyek41ZXczVHZRcS91SE1BaS9WZE9kNE44T3NyajFCTWdmWkxPbmtuNXhz?=
 =?utf-8?B?cGo4emRQYjRpWnFjbnRnbUxWclJrdDFNaEluYVE2RXZFc21NN0k2dlQvQnEr?=
 =?utf-8?B?RlpZYnQ5YTVYbFBvQ2dVbW12NFRNVzdGZ3hzTDNuRWZwbkJwVlhvRFlYeE92?=
 =?utf-8?B?SEhjMytpT3pUT0Y3eEk3dGZpSDE2TFZ3cENuVFZseG1VRDhFbkFVa0p0NXJl?=
 =?utf-8?B?MWJidjRXZ0JoR2w4ejNCazJCaWtQc1JyVm40c1Y3VjB5NE0xdDVJb0Yweld5?=
 =?utf-8?B?SWxNY2V5Nmh3aXRyV2xDeDdIYS9NeS8xTXpKc2JPd3NmVDlqV3NSTFZIT3R6?=
 =?utf-8?B?NFY2RUR3Y2hla1FFTDVsdUhkNGFabitJYTJhdkx4eHRjRWR5RmN6OThjaDhs?=
 =?utf-8?B?aW1UQ2JNeDdPOUtJdzE2SklLRGRYMkdld2FDYmE2NERlTUNycHU4aWVuSXY5?=
 =?utf-8?B?ei9yaDh2Q0tSd1FYdkdaQTRtMEg1VG0yNVRBTmx0OXJvbktjWGk2cDZmd0Fz?=
 =?utf-8?B?b21Qc3VNRGhEV21YeFFVM2R3dk1yeUNubUoxZk5MeGFnU1NHMmpoUi9sTjRR?=
 =?utf-8?B?QzdDbTZKRWdFMnV4YnBKWGJKeXJJVnFONmpBMjlaUWg3VUw1a2dqVzVKazNT?=
 =?utf-8?B?NmZudWpNbjVpMHY4OFFISGJpUWJFc0xkam9KSk5UN3UxWXpsR3F6OTFOTFBY?=
 =?utf-8?B?citucGlqZk16SVRjeER1bXNqZ2p3TnZOM0svMi9MUGZHTlZ0bXdQcFFuMWpR?=
 =?utf-8?B?Tkx5dXVPOUpjWTBYMjVzTkFrL2xZSTdlQ1pDR01PUEZ2bVJWYUJ6ZmV5NTBY?=
 =?utf-8?B?eEg1bWI2U3diVjZ4T1l5RitYcnNBNnU5d3ROMmNmRVY1eitqYU1ZZUxKYWhp?=
 =?utf-8?B?czg0Q21jbkJOWTdpejZZRExrbm5pT2wwVFcrWFdmTEh3NTNlVHVMU1N6UXVP?=
 =?utf-8?B?WHJDbFZaaHdHTjVMeUFWVWhqajhnWGlCK08rQ1c3alRiSWJoVFY0QitacExi?=
 =?utf-8?B?Ri9zSjhHcExWcHF1UTZINy9WR2Z6WGV5TGt1VnpRU3FiRkF2VEo0NjhIZVJZ?=
 =?utf-8?B?ektXQVZjZ2NKd2srSXhzY2lyRjY0enFOK3cwbkJORUdnd1VOWkdNRE5nVjFh?=
 =?utf-8?B?a3M0ejhhbmVkcThZemtKdFZCWEtCZHk3NGVNK2xWUmtnOWR0bTEvZlR2dmJv?=
 =?utf-8?B?TTFuaFJsZ3JpbXRsRGJja1AwbHJLMWxxdUF0cE14R05vdlNPclRhZ2NDUXB5?=
 =?utf-8?B?NXRRRXB0Z3BxWUNySm1uby9YeUZiSCtJSkdacTQ4L05EK1ozUHNZZ1JxelNK?=
 =?utf-8?B?bDVoUFk0cGFNc0pMMlJjaHF5eTBWK2J4TjlQYmpHT3lzK1hqa243SncwRVp3?=
 =?utf-8?B?NHp0OTIrYlZSbThDUXphZkVlMmNWL2FWZTBPZWVIZXVUQ0htNE5ZTS85cGt3?=
 =?utf-8?B?ckJ0dzZaZGp2VDJJNTE5MkxZQjkrdTdTaWIreXhheHdDaTdqV3NudHVBNlVU?=
 =?utf-8?B?Ylh6ZWxobm9TYXFqOGlBWk10NnJVZS9kdW5MSXBoRU5WTXlNUVQ2dmtlK1FR?=
 =?utf-8?B?Rm91T0dHYnNYcVh2cnhjZTMxc2lURzFTZlJ2VkNRK05XMlNVYnNZaitFWWI4?=
 =?utf-8?B?SFVLZVNLVFErTmd0ZFM2YzFySUlpOHBIeHBSNHVUZWNsTDRySjNjOUk0MkdQ?=
 =?utf-8?B?Q3h4WkxLOVlIVDl3cTdCMzYvRWlSenNtdUpsNW1ONks4bTFHUlV1S2F1a0ph?=
 =?utf-8?B?WHBPUHcwMk5ZYktBbjl3V2dIdGtFbEdFN1FBSkR4ZGlRMnd3MGZLckt3RG0w?=
 =?utf-8?B?dFpRRTBRU1pOVnBYdHNhRUJWUmFtVFFVMC8vMWtReWlBcXl3Vjh2ZFVqZjNG?=
 =?utf-8?B?eUk0YVR6RWhaaGFmalowOGRKMFdwRU82d0txUzRITXY4MjhwTkhBNzFTNkdi?=
 =?utf-8?B?bTJGeUcvYUxBOXQ2b0ZBU1ZzOTRUenk1c25YVzh6N0JpNkdTVzYwL0RlUjNq?=
 =?utf-8?B?Q1BTb3loOFExTndvWk1iU3pDODE0ZGVWR0trUWViZ0ZFOWhYZElHdzhpUFg2?=
 =?utf-8?B?bFJKby9Dd2ZhT3VuRDdvUjdqd2d1MXdXV0oxU0hSay93V3hqeWV2L3BxM003?=
 =?utf-8?B?Q243RzJyV2txbHlrZG11anRaWWlFdXZIV2dEQlpLNlFKRjhEU1dTbFVtMFY4?=
 =?utf-8?B?U0hYM0d1RkI3Qm91TDdNaURIUXo5b2hxcUtzUnAxR2d4cktqOXVyb0xadzF6?=
 =?utf-8?B?L1BZcWRlMXIxY0R6Yk9NY3VadFZ4UTFkeCszVHl2Mmd0UjlJUXVTVW1FQnpq?=
 =?utf-8?Q?w1a5Kei3KEtaVmX4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c94410-78cb-49b5-6ccf-08de5838782c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:27:49.3500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr38S3jJ/XKGZ9Abgtk9nFzs884Z0rUvNriGQNaHS4Ab9lm8Dh78v1yVQfE3cI2/+9dUEiBTNIJ3GQaBhb/spxxDHYejVqbAYEy+PBOUkPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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



On 1/19/2026 1:50 PM, Maarten Lankhorst wrote:
> Fix all functions that use node->start to use xe_ggtt_node_addr,
> and add ggtt->start to node->start.
> 
> This will make node shifting for SR-IOV VF a one-liner, instead of
> manually changing each GGTT node's base address.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---

no change log ;( can you please include it in next spin?

>  drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 60665ad1415be..7e9ff8057703f 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -299,7 +299,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	ggtt->start = start;
>  	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, start, size);
> +	drm_mm_init(&ggtt->mm, 0, size);
>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> @@ -401,7 +401,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> -		xe_ggtt_clear(ggtt, start, end - start);
> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>  
>  	xe_ggtt_invalidate(ggtt);
>  	mutex_unlock(&ggtt->lock);
> @@ -418,7 +418,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
>  	mutex_unlock(&ggtt->lock);
> @@ -570,16 +570,17 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> +	xe_assert(xe, start >= ggtt->start);

this should be xe_tile_assert(...)

>  	lockdep_assert_held(&ggtt->lock);
>  
>  	node->base.color = 0;
> -	node->base.start = start;
> +	node->base.start = start - ggtt->start;
>  	node->base.size = end - start;
>  
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  
>  	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> +			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
>  		return err;
>  
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> @@ -770,7 +771,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  	if (XE_WARN_ON(!node))
>  		return;
>  
> -	start = node->base.start;
> +	start = xe_ggtt_node_addr(node);
>  	end = start + xe_bo_size(bo);
>  
>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> @@ -891,6 +892,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> +	xe_assert(xe, start >= ggtt->start || !start);
> +	xe_assert(xe, end >= ggtt->start);

ditto

> +
> +	if (start)
> +		start -= ggtt->start;
> +
> +	end -= ggtt->start;
> +
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>  	if (err) {
> @@ -1002,16 +1011,17 @@ static u64 xe_encode_vfid_pte(u16 vfid)
>  	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
>  }
>  
> -static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
> +static void xe_ggtt_assign_locked(const struct xe_ggtt_node *node, u16 vfid)
>  {
> -	u64 start = node->start;
> -	u64 size = node->size;
> +	struct xe_ggtt *ggtt = node->ggtt;
> +	u64 start = xe_ggtt_node_addr(node);
> +	u64 size = xe_ggtt_node_size(node);
>  	u64 end = start + size - 1;
>  	u64 pte = xe_encode_vfid_pte(vfid);
>  
>  	lockdep_assert_held(&ggtt->lock);
>  
> -	if (!drm_mm_node_allocated(node))
> +	if (!xe_ggtt_node_allocated(node))
>  		return;
>  
>  	while (start < end) {
> @@ -1033,9 +1043,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>   */
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>  {
> -	mutex_lock(&node->ggtt->lock);
> -	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
> -	mutex_unlock(&node->ggtt->lock);
> +	if (!node)
> +		return;

I'm still not convinced that we need this extra check
it's an error to pass NULL here
and current code complies with it

> +
> +	guard(mutex)(&node->ggtt->lock);

if you don't want a separate patch that converts lock/unlock to guard
then at least mention that change in the commit msg

> +	xe_ggtt_assign_locked(node, vfid);
>  }
>  
>  /**
> @@ -1057,14 +1069,14 @@ int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfi
>  	if (!node)
>  		return -ENOENT;
>  
> -	guard(mutex)(&node->ggtt->lock);
> +	ggtt = node->ggtt;
> +	guard(mutex)(&ggtt->lock);
>  
>  	if (xe_ggtt_node_pt_size(node) != size)
>  		return -EINVAL;
>  
> -	ggtt = node->ggtt;
> -	start = node->base.start;
> -	end = start + node->base.size - 1;
> +	start = xe_ggtt_node_addr(node);
> +	end = start + xe_ggtt_node_size(node) - 1;
>  
>  	while (start < end) {
>  		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
> @@ -1097,14 +1109,14 @@ int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u
>  	if (!node)
>  		return -ENOENT;
>  
> -	guard(mutex)(&node->ggtt->lock);
> +	ggtt = node->ggtt;
> +	guard(mutex)(&ggtt->lock);
>  
>  	if (xe_ggtt_node_pt_size(node) != size)
>  		return -EINVAL;
>  
> -	ggtt = node->ggtt;
> -	start = node->base.start;
> -	end = start + node->base.size - 1;
> +	start = xe_ggtt_node_addr(node);
> +	end = start + xe_ggtt_node_size(node) - 1;
>  
>  	while (start < end) {
>  		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
> @@ -1211,7 +1223,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start;
> +	return node->base.start + node->ggtt->start;
>  }
>  
>  /**

