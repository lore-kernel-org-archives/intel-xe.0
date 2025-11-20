Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D6CF649C
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 00:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355110E6BC;
	Thu, 20 Nov 2025 00:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYZ7gr8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBFF10E6BC
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 00:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763598727; x=1795134727;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VhEAILPxKyW9Uj+++dPOdlojsa0mDKBU5TfwpRv2o54=;
 b=MYZ7gr8CJJTxEwNcMv9ImCgIUWPNmKrcEsJxnEKTgTIjAqZy9rKIgpl/
 Z4jH4gqAKWh9YQzi1TVyUlDahzzbkRPDz8N/09zFegaCdql7saR1zHSoB
 jyptOqLqGlTwBH+oLvoTSm0HocF4cX3uP3y8hK2Jz0jw8GLjAHBge8UxM
 t9zyAKzh8ojX4iCP369sTcM8NKFzdZ8knnJ2mcCHr4H5JKQBkgoDPR1C7
 Qlx8NRcVLEfxOORVHuNlXrkf8+JpYD7xpgRBm8NUUqsvaw6S/dfb4wCw8
 xGYVNTtBtI+jt5kld+sqQoH4VQdXWx2UY8uMFWve6j1d1d0kFtlMv4epo w==;
X-CSE-ConnectionGUID: 6mJqhzEuT9CmigFgGU2uUw==
X-CSE-MsgGUID: o8XIKLvATv+dXaoNvlrcZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83278620"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="83278620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 16:32:06 -0800
X-CSE-ConnectionGUID: LdNTJuyVS0KUb6WA0es8lA==
X-CSE-MsgGUID: M8GfMhTXS2qRW+wN6w2Wiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="221855426"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 16:32:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 16:32:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 16:32:05 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 16:32:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymj+ctfCEGTWP0PvkVY71dqKdT4EGAUFMRykvZcBXPsjSuuLWHELmPaelJi3ZGxcOwrclOHPu2+p1n3jlim5G5aeg/KNnynj0XciE8s6JXOsQ0XYxeAgLwo0dS+WILgY5Rc10a/jVxeOw0Z/2Pa6vfHQyEPPBlEHyxTfKU0g9kefT2PToFsyufnG21opNrEFcxCYK2GSHsUyboNTirDUWnVcFUb/B1UE6oQam5CrdowNSPO7Nk5U3/9B5haSIIOnNozBy8YQp8dIUXzTG4j6KsNP3WKJI5yCZuw5FFkqAaHCdOmu1DDDbbYwC7SVDbJqpoutDsTcnn9felCyuN77dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0Ak4hNWDMxtHLWmIku99YOpTtK2qVleYdblaH395so=;
 b=VQBT9h61019r2ofQRhsgMUqfhDLXVa2YOAcc1ZkC0SGr40HqJsdtRl5Fz5DwPjo7p1w6gGhWZNLNT5SAVrxIPPvRX4huUhdI01x8CNamNXFSuQtJsXp4z43CqwqwqInXRLQG4UV1Yb+xzG46kZhNq6XiTvu+wQWBdR7AVrfWik0zn3t+CBVQK7GxRXUtu+tcmZ3Ua9yoSRj2k3RN3PoVAPYJUKbFA3z+jniwIgzejNnURZM10gGSZsiW2DwYSuP6eJYaef7xt5Q4sfuIkpO9+EW1HVQD7In6tXnqy49NXywDXpXCjysAhXB9X2vR0m1zF7kJuD8/L7M1+byz5rwUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 00:32:03 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 00:32:03 +0000
Message-ID: <49a6c951-d837-484a-bd07-64faa7bc2947@intel.com>
Date: Thu, 20 Nov 2025 01:31:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled job
 during VF migration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251031201345.3015516-1-matthew.brost@intel.com>
 <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
 <aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com>
 <28f6a7e1-469a-4f83-8492-94cf9396c58a@intel.com>
 <aR4gxSx9WSzqX+xD@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aR4gxSx9WSzqX+xD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0035.eurprd09.prod.outlook.com
 (2603:10a6:802:1::24) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 79252550-2164-4192-0602-08de27cc39dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktWcVVXbXE1R0o4ckdtKzlsTjBsOVc1TjhmcDVNK0ZvWUdmbXpvYjJpYkVS?=
 =?utf-8?B?enFyYnFYNk1xR2pOZGNQSUozTjBheHAxakFJeVhjeHZ5dE9odUpLSEpESisz?=
 =?utf-8?B?a2gyVkgwSzVTclhPMDZNUVNmVWxWUm5RZ1hSU3kvNElWd0JLUXRpeVo0cmUy?=
 =?utf-8?B?eUUyZHZ1RjRtS3YyeURlSWNYMGlFL205ZkJ6eHNIQWJhL25RQitBcTFISWND?=
 =?utf-8?B?M2Zka29xSjNJZEtNbmkrUVlrdGt2L3Bucys0Yyt1RVBVTFV4eXpCdzhxQ1h6?=
 =?utf-8?B?a2g2TURHUWQ0UlB5VDJrclhTWVFjaGZuL3VmQ0VYelYyU2pkdzhxa0R0UFNB?=
 =?utf-8?B?WHpMd3BqY2dKOXRoSmN1Uk01c2U2SHM5K3B3bzk1UmxDUnZoVG5aZ04xKzY3?=
 =?utf-8?B?MFlnZ3JtVTY0b25DRnBvZkZhRGJaUk5pL3RjTzFuNm5VcitHbHZ2aDVnRWlB?=
 =?utf-8?B?N3UreHovS3BLRkJVYnU1eWh1eStqTFhmZWZTY3g5b3ZOYUxaRDJYczN5eWh0?=
 =?utf-8?B?QXlVdWE3Yzl3TDZDM0ROUG92d2k1ZnhFbzd2Nko2UGcrS1FEbTNVbXJQVVJY?=
 =?utf-8?B?UmN3T3B1N25XUnp1ejBSQzh6WXZVcGhyRklKbzlGSTJ5WkNzTVIrRXVPWllG?=
 =?utf-8?B?c1orcGlkc0R4K1ZZcTZ2VCtabEZxMmNTMjdOeDQyOU1uSzhHWW95MDNnWlpU?=
 =?utf-8?B?aTAxRk9ERmRJelVsTXNoRCtYNEFLSXczUmtpdmpWYThnSStZZnBzVXJoMFNy?=
 =?utf-8?B?QVJSQUdlaUw0bTFma0tJNjFDRExRWHBERVRRaW40eDdPNkZNOGg2ZzFSV1oz?=
 =?utf-8?B?S2FqYzZBSnJZM2dKdGRIWThIUjFYb3E1V0IzS3BUYWh5ZTQxTTlMYmVhWVJn?=
 =?utf-8?B?eTgrR1FVc1prbmgybS8ydVM4aENmMmxuLyt6YjFIbEl5ZVpjK3Y5UEsrbXdB?=
 =?utf-8?B?SGFrdkR4SlczaXRkQnhib1UrekxUSCthcE5GMVRzVUlOQVdrNTg3d2lueUFz?=
 =?utf-8?B?M0dWOE9jZVNkTi9uTW5HS0NMR1RGOFVkUENUVFlYeU4xTVJuSW5DaHkyR0hN?=
 =?utf-8?B?RG1NRlFFeWFTaVpnbk5hSXRMUm9BSVJWNE0zcFBUSXFsYXdpNEZ6dCtpdG5Y?=
 =?utf-8?B?NitPNmZHWU9xTVVYenhBQWM5YTAwa2wrR0ZQREZ0ZlVzaWMwdS9YaExUVHQx?=
 =?utf-8?B?M3Z5RHdSdWFFKzBBTGc3QTVYZ1ZtT2ZCeUdUd09mYUF4NHhzRGxoYWZ5aXhn?=
 =?utf-8?B?VnlnQW8xQ29reVR0di9XVkFjVFFpaUkxVHBiU1ByVVBxTWJQWE9pTlM2WUpa?=
 =?utf-8?B?bUNhQ0NCYjB4WmxXUlFEcDArWXBKd1o3TUphNVUzSlJlV1RLek85Tk93MHBn?=
 =?utf-8?B?aGR3UWdNY2tubW9PMloxcG51QjhSTmpxZEY5QUxKbEpKZnZuTEVtelRhS0hK?=
 =?utf-8?B?MWY0bEljS1prMDVXSVlETzlzTk5YMkhOZWxLVjJKdXZJZjVBT25WYmRMbzIr?=
 =?utf-8?B?NGFOWi82TjVsak50U2VhRGtiNlFNckptQXNySElmUlpNTkJpREJsekZDMHNO?=
 =?utf-8?B?WWRlTFd2SHBhS0ppbmNvaTZPWDdjbGRBWDRhTDBuWlpWb0tBaG5ML2l1RUNV?=
 =?utf-8?B?RFc3Y1NyOGpLZ25teGdUZnhHdUhDTGtVU3hIcnZ0N0dpUU5saVlhd2Y5ZW1H?=
 =?utf-8?B?STUvYVlxWmc1bm9HMXpqaUZ0MEpnK09mMDJKWG85RDB4ZnJ1dUI3SFBtYlZn?=
 =?utf-8?B?TXNkbGszNC9PYzFmK2dpNWZQaWcrTUdwZGtUTGJBcG1nbW0xNGlmNEtiYWh6?=
 =?utf-8?B?c3RjYTFySitJRERJMDdReGtFcWVuanY1VkZOcW1UZ1d4OFlxUmlkbkd3SkdE?=
 =?utf-8?B?eTNmZWpsTjF5RUM3bm9sOUh4Q25ETDhVZU1QdThqRlpPL0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2QvSUpRUGFzMWRrSFpvSGpwNG9EMTFuNi9tKzhDcDFiUmkwWlNiSk45aDNt?=
 =?utf-8?B?Um4vZ3ZjeHhaWkk2STV1VG9MTURzeHFlWEdUaDEvQnhWSUdablQ1elFPVEQ3?=
 =?utf-8?B?Qm5XVFFsUnE0R05nVXNJWWZyYWNkNGNRZ3BkTTdHNHExQVY5TUs4bFp3aEEz?=
 =?utf-8?B?VHJ0b1d5Yk9xZGtaVWZBYWxzckpKbHAyWnplN2xPQkF4SzZkaDFnNVpmZXRJ?=
 =?utf-8?B?ZHhVQmJvM1ZJcEhmbElmODhyVHp4YWhpSExKa29xTWJxbFA5blpXZXV3RFZG?=
 =?utf-8?B?eUxFSEtxdzJYaFgwMU9aNVp0SkNhZ3VGazdDWmVYV3JCUDJYdXAxU2p1VXRC?=
 =?utf-8?B?UDVIQzNncXY0SUdOUWdxWDFrb0FWYU1zcWU2SmhiRElrMzd5c1JsMkRXZHhp?=
 =?utf-8?B?MkZzQnFab3ZRNzJlbXpNazg5UVRCa3BRVkVTWGkxQ0dSNzhNRU5iRnloR2tp?=
 =?utf-8?B?LzhNeEpZbnJzdEJUOEh3MlZCbUZXLzFpakkwYnN2azRrSllTa0RDemFJWWM5?=
 =?utf-8?B?OHlCbklUYkh5OUg3Sml4ZkNpRTRkRmk2SXErd28zUVZtNS9Pdm5nRktxYTJK?=
 =?utf-8?B?Y0F1ai95dlFuN29IKzlKVHNDRUlvaG1NQi91TVBiMWNYSFVRMTVrTE5xODhS?=
 =?utf-8?B?NFdkY3FpUUtJOXhCQXBlUG1FVGR4ODhwSVBuOWd6b0duVWJnOVNzVWo1UE9C?=
 =?utf-8?B?cis2K3h2UFVWWUZhOVdWcWhUVVg0L1NjR2hVSXFVRktKMTdiZzFhYWQ0UUlX?=
 =?utf-8?B?SCtyRHRzNHYwcjZWOUhGY0JOcHFKU0NERkRTYk1oc202MzZ2TVZpS1FzODZK?=
 =?utf-8?B?Tm5jcy9GVmpRQmJRVFpLMEUvTFEyUGd5ZGorM1JVeHgwa3IwWUxtVmxzRi9j?=
 =?utf-8?B?OEcvSk1BWmFzMmlVZytQWmU2eUhMNFR0QjJFcEc2STNyV2lxUG9hL1ZnUUFS?=
 =?utf-8?B?Qll6THFmcjJWNEhjeU4ySmo0dGpWcGxQL0tFb2t0ckI0TjJSVGl4V1BmN1pJ?=
 =?utf-8?B?SENGN29LMElVK3hraWNCV3diSDJON0RxNkszY1hHQVVvZG1QazVCU0VWL2h4?=
 =?utf-8?B?akxia0FEVmNmYzU2b1d4ZE5vSld5Q0s4dHhLYUp0V2pUakkyejRBaTRyYjFw?=
 =?utf-8?B?MWRod2R4bkR5cFN3TU03WG5qT3kxWDdkSC81MEZXdHc4TFZEd0Y2Ty9JWHhT?=
 =?utf-8?B?NGI5d1VRUFZlOStzbW5Tbm53Yk9zOEJYdytOeTNHZXJHUUc1eTJvaDNwQW9T?=
 =?utf-8?B?amRNVkxJNUpYcWEvY1NiaUpJNWEySytRSVF6dDcwWEY5dGJUOWZ3U3BWZFlm?=
 =?utf-8?B?NWZnMm8yOHF3Z3VBZ293dmFhLzhXdUVpdXRTRWIvUnE1dHBMQlVBZCs4K0xp?=
 =?utf-8?B?dVRlZUtBZUxReE83SS9zbkl0Q2lmU0ZDMWVEa0N2bWs1eFd5Ymc4MnN5Nm5K?=
 =?utf-8?B?bGpwSm5zWFUwQWNuUENhRlVxSnZianpXeTg5Tlh4dVA1WUx1VjdGVnlsUzk1?=
 =?utf-8?B?WEU2N2xleXBTb3VWM0t0RGwxbmxmNzNLa3hyV1ZUWGE2VjM5TFVJQnZtc1dP?=
 =?utf-8?B?UG96OFRSNnBubVg5eEVJUUFlOVN2U1R5aEl1blNtMHVaN1doWGVCVDVTVU1z?=
 =?utf-8?B?TzJOV2Y1KzFGc01TRGlmYnBTeGNiKy8yZ3M2R1pEUDloYkFpM001QmpTSWNF?=
 =?utf-8?B?OUtMQ2dpU0QrKy9ITWJLR2hob1VvRzhtUmIrbzA5LzhjSnJiQ2tyN2wvNHlD?=
 =?utf-8?B?aXhXaGRCdlg0dmZKWUZYampISkloVDUyTk9wekJXeGJ4NnhEYXYyTVdycGhu?=
 =?utf-8?B?bEYrSU9KcEJ6UDdHdHJxOEdwc2RhaEtIdGFQOHBsTTJCYkZCblphYVVydjda?=
 =?utf-8?B?aTdIdnl0YTBpWnFYU21abmhsNHJwUTh3ZllWdlFPTmJmcnhBTkgwRUltSnpK?=
 =?utf-8?B?UmJrSWNCOWlCMzVCQ1V5VnNsT0RCL0hjTjNtbHJ3cDNBWjIrc0wrUklNRHgx?=
 =?utf-8?B?YnJOdVlKRXNzaitJMEx3d24rQ3VwTkVFZHJzTm5SOTNZM1FOVUwvY2k4ZTlJ?=
 =?utf-8?B?WXRZSEI1VndZanJCWk8xeDlHNGFENnIwQkVrVXhaWHBVa3N1VHRxY1krQU8w?=
 =?utf-8?Q?3GH/mCryO8F8kdXoseAmWmbCe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79252550-2164-4192-0602-08de27cc39dd
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 00:32:03.3341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0e2j2yZR2gY6sNBGNFtETq5UmITLWzaxXDwsNWDbgEDwt+t5ylvyoPuDgA5cnEFCHtuGfVMZuBi294eEolWCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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


On 11/19/2025 8:55 PM, Matthew Brost wrote:
> On Wed, Nov 19, 2025 at 03:48:28AM +0100, Lis, Tomasz wrote:
>> On 11/7/2025 8:48 AM, Matthew Brost wrote:
>>> On Sat, Nov 01, 2025 at 02:33:07AM +0100, Lis, Tomasz wrote:
>>>> On 10/31/2025 9:13 PM, Matthew Brost wrote:
>>>>> The LRC software ring tail is reset to the first unsignaled pending
>>>>> job's head.
>>>>>
>>>>> Fix the re-emission logic to begin submitting from the first unsignaled
>>>>> job detected, rather than scanning all pending jobs, which can cause
>>>>> imbalance.
>>>>>
>>>>> v2:
>>>>>     - Include missing local changes
>> Explanation of previous remarks and a request for a code comment below; but
>> other than that:
>>
>> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
>>
>>>>> Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
>>>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
>>>>>     2 files changed, 14 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>>>> index 9955397aaaa9..357afaec68d7 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>>>> @@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>>>>>     static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>>>>>     {
>>>>>     	struct drm_sched_job *s_job;
>>>>> +	bool skip_emit = false;
>>>>>     	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>>>>>     		struct drm_sched_fence *s_fence = s_job->s_fence;
>>>>>     		struct dma_fence *hw_fence = s_fence->parent;
>>>>> -		if (to_xe_sched_job(s_job)->skip_emit ||
>>>>> -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
>>>>> +		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
>>>>> +		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))
>>>> This looks ok, but what is the mechanism which could lead to a job after the
>>>> first  `skip_emit=1` job to have the `skip_emit` flag lifted?
>>>>
>>> This shouldn't be possible with the current code, since we're checking
>>> hw_fence. If we were relying on the software fence (i.e., the job's
>>> finished fence), the state wouldn't be stable. I think our eventually
>>> the is goal is to use the software fence [1] to avoid DRM scheduler's
>>> violations, so defensively / future proofed coded here.
>>>
>>> [1]https://patchwork.freedesktop.org/series/155314/
>> Makes sense.
>>>> Wouldn't the only possibility be that jobs were executed out of order?
>>>>
>>>>>     			sched->base.ops->run_job(s_job);
>>>>>     	}
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index d4ffdb71ef3d..f25b71aca498 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>>>>>     	job = xe_sched_first_pending_job(sched);
>>>>>     	if (job) {
>>>>> +		job->skip_emit = true;
>>>>> +
>>>>>     		/*
>>>>>     		 * Adjust software tail so jobs submitted overwrite previous
>>>>>     		 * position in ring buffer with new GGTT addresses.
>>>>> @@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>>>>>     					   struct xe_exec_queue *q)
>>>>>     {
>>>>>     	struct xe_gpu_scheduler *sched = &q->guc->sched;
>>>>> -	struct drm_sched_job *s_job;
>>>>>     	struct xe_sched_job *job = NULL;
>>>>> +	bool skip_emit = false;
>>>>> -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>>>>> -		job = to_xe_sched_job(s_job);
>>>>> -
>>>>> -		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>>>>> -			  q->guc->id, xe_sched_job_seqno(job));
>>>>> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>>>>> +		skip_emit |= job->skip_emit;
>>>> All emitted jobs have the skip_emit set, unless their EQ got submitted to
>>>> GuC which clears it, but if it got unsubmitted without finishing then the
>>>> flag is raised again.
>>>>
>>>> So this does seem to select unfinished jobs.
>>>>
>>>> Though this introduces an assertion that within Command Streamer ring area
>>>> of a job, there are no GGTT references between seqno increment and end of
>>>> the job commands. Maybe worth commenting in code that we're working on that
>>>> assumption? Example issue would be if someone introduces saving some kind of
>>>> metrics there.
>>>>
>>>> (this assumption was in power before this patch too, but now as we're
>>>> skipping fixups for finished jobs still in pending list, it becomes more
>>>> important)
>>>>
>>>> Also we're emitting jobs which have a flag names "skip_emit" set. This
>>>> disconnect needs a comment too.
>>>>
>>> I am not following this comment.
>> What I described might be non-issue; but regardless, let me try again:
>>
>> Every job has an area allocated on the ring buffer; the area contains
>> commands, which:
>>
>> 1. Jump to the user batch buffer
>>
>> 2. Increase seqno (by GGTT write)
>>
>> 3. Trigger user interrupt
>>
>> 4. Do some finishing commands
>>
> Right now (4) is only emit_pipe_control_to_ring_end which doesn't touch
> the GGTT. It is odd we even have (4), that kinda looks like a bug to me.
> Will check up on that.
>
>> What I tried to describe before is a situation where commands from (1) and
>> (2) were
>>
>> executed, but then the context got preempted, before reaching end of (4). In
>> such
>>
>> case, the code with `skip_emit` would consider the job finished and would
>> not apply
>>
>> any fixups. This could become a problem if during (4) we did some GGTT
>> writes.
>>
>> Now, it this realistic:
>>
>> * Currently we do add some workaround commands to (4), but MMIO writes only.
>>
>> But since there is a precedence of placing WAs there, a GGTT write could be
>> added
>>
>> at some point.
> I believe WA are added in the context switching out, which this step is
> non-preemptable (i.e., it is part of the preemption process).
>
>> * But the whole premise requires that there will be preemption point between
>> end
>>
>> of (2)  and end of (4). This is not a case, and I would be very surprised if
>> that ever
> (3) has a preemption point which is why the case where we have (4) looks
> wrong. Writing the seqno + user interrupt should always be the last
> thing.
>
>> changed.
>>
>> So, the above is not an issue.
>>
>>
>> A second remark I had is that we're introducing a code like this:
>>
>> if (skip_emit) then do_emit();
>>
>> The issue there is that someone reading the code will see it as
>> self-contradictory.
>>
>> The first thought will be "did they forgot to negate the condition here"?
>>
>> The code is ok, but a comment would help to avoid this confusion. Ie.
>>
> Let me rename this variable for clarity. How about 'vf_restore_replay'?

Ok, that will work too.

-Tomasz

>
> Matt
>
>> /*
>>
>>   * If emitting will be skipped when re-scheduling the job, then the emitted
>>
>>   * commands need to be refreshed now, to keep GGTT references valid.
>>
>>   */
>>
>> -Tomasz
>>
>>> The idea is that in guc_exec_queue_pause, we set skip_emit—this acts as
>>> a marker to iterate over and resubmit jobs regardless of other
>>> conditions. As I mentioned, if this marker were based on a software
>>> fence, the state could change between guc_exec_queue_pause and
>>> guc_exec_queue_unpause_prepare. The current code uses the hardware
>>> fence, but that could change between pause / unpause too.
>>>
>>> We need to keep the iteration consistent because it also affects the KMD
>>> software state. Even if a job signals during this flow, there's no issue
>>> with the hardware; the key is maintaining a consistent software state
>>> throughout the iteration phases: pause, unpause_prepare, and unpause.
>>>
>>> Matt
>>>
>>>> -Tomasz
>>>>
>>>>> +		if (skip_emit) {
>>>>> +			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>>>>> +				  q->guc->id, xe_sched_job_seqno(job));
>>>>> -		q->ring_ops->emit_job(job);
>>>>> -		job->skip_emit = true;
>>>>> +			q->ring_ops->emit_job(job);
>>>>> +			job->skip_emit = true;
>>>>> +		}
>>>>>     	}
>>>>>     	if (job)
