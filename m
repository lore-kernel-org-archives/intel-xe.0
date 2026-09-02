Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5FDC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AD810F1A1;
	Wed,  2 Sep 2026 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/wXxBrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCDA10F1B7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352446; x=1819888446;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f4LQIsRKmwWTLl03ew3c0mcUdaxYCm2Nq1FfpJbYde4=;
 b=G/wXxBrS2qrUEFIEUq2A51BT/U3S4mnT5IK9bZkdMw9m0R4FFIcxprv/
 d4DOCzwW1j3TrFBuWI0i74/2fMPYAOHu1B+C0tBrrHhO3Z/bpNmVGi1YR
 DYWzOZxG58zllEKa3TDnmF2xLiOO+8nGFgqPShyY/ntmUKYE8eOd21syo
 uG+jrmWiJzTQuws/KABhxQFk3fyulb78pvMZT/qPj3JUjEyN/R49FfvBq
 qf/aVRR9hMpqDR/n2jUTC+vrIg8atFKnpzPrIz/ZZynOBS3skxNqiEDPz
 /pqoQAXpRqdeDf+e4ZCZEQv4A3hbbaoDBDsCqavgogxb0Jn/MKDI89ILd g==;
X-CSE-ConnectionGUID: 64JxBe32QlykCuFV5tgt9A==
X-CSE-MsgGUID: O6GRdGk6SoKRd1xlbGlf0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100163400"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100163400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:34:05 -0700
X-CSE-ConnectionGUID: tqhQ5vdHTMe3rECi/E4olA==
X-CSE-MsgGUID: c99BrC0nRNWpL8sO9+zwdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269416867"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:34:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:34:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:34:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3dFCWyiBEgVxvXBNNP0kjk7Wi9jysl/frV1qjzwqGJB0Y/dJzJqGTC2dY61pMAgeE8JIkmRPMzj7GXlMjSu2Es67ZPxWSE5TPKiwry6HFUjs4oy1w80eAf8nmS8lhfpKz9//Z4Y+N9Wij66ubwvIL+aI00ub0CaXfQWbBG2OYF0F0owqrWqCoPQ7Tk4WprUHszChdC72xE2VgiqsQa9VF+k90Y8yL7iE5z7wPErEeYk/cboKx0AJxo8/vzk6llGhqkqpqVaESicC7L4ZkUIvMqh62z0aNH3cK12zCB4q3eiI5xc32xoQr8EDLiAkxjYxK+cystBXSWw2kE813fB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs42tlVY/4uwpviN4zUzDbGM/2me4OTY+9kEhZDp5+A=;
 b=f1hrse4hdSj+QANZr9jf00gG4axqkLKKj+VBVQuZS4Sg7JC+rjibQrrvxj35q3Nb7z+4t4YIJcm4zxfeui8g1JGsUEo1z/iFjFU/l4CUK/XH+xBt4oLos2ZdryrvQOJ8hGH5Wop4OqGB/QbfFcTP7ZM/ol1jS4Et6s7ogla9mB1oG43XFJ2MKZRGXmjtcseBmVW2Y5PN58Tpa7nsbJB/yKLv1wNnoZHR30QZkjTAmXPhqtiqtrd9lu36cRiBQUZymD0Asm835FVmwI3WqmDZiWdvvaBsAuGQBmBteC0yTA8SldT4y3vkFoCR4p0iBFq7o99H77Aa831uXLnRG1UuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SAWPR11MB9897.namprd11.prod.outlook.com (2603:10b6:806:54a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:33:56 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:33:56 +0000
Message-ID: <38edbb95-d9bb-4201-9a5e-829079de789e@intel.com>
Date: Wed, 2 Sep 2026 14:33:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/log: Add GUCSUBMIT component
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-2-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901063059.2547247-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SAWPR11MB9897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd40853-22f2-4f63-2f14-08df08ee7485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: s0FBPbVUH1uHSunEI9dmDc8GPn7vrFJ9b/huWViPMSPE6T2ZaJHGf34IgwiLUZLyLkx5cJXHICgc4PZGyDvcRBsvDNptzw60apffRzANoqEaoPAtzkDGct9K1umI/y/jGWdL+b/BIKyjdXuKV8/DcPXQ/ZPLQh/kM89F17cEFfsF6CnBDGU/f17L3y3E+boCZuctoNmDZOHcQfHf4Yt3ze6vHH0Run8P7C5EKBkDD+mDwcR2IWOM/+rShhuWX4HoIjhlOcT4GYR8h59gurbJPBC9RcH8avY7dh0T6XyMCV0f8iD/I5IvtNI15idXsJnBaLZrXuzDEjY3fGT7Va5Wf9uiniBO0kFbVHSR6jhDfX34Q5OUvwbEmyYrBroBmPTFP+Q+c4OVliNAMGHvl16Y5eEXAzdB11bvXP5kzsLCKQv7xfWBIhclxk8Ng+bzBx22/wo+oXmuNmp7ZXiAHCsjyxfWdr28YPwmWuPdK9yY5G1Kv6ciGrfMqInu0acNoa54uagJUssh31n00TrT9hfupJUB4ZYPs6JHcRauEsydxf+PGhB55iIClm20/5I2YI3eg30QPDrasdYzXlyTmPTTSc0IZaLjMVhjJfojR0C9Q8nGt4aQ7/gRd+Ojk419Yh38FyeoAnU/hbBxLmS+YRRrHpbq+iodpEDnxLQ91wOah1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(22082099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFVZjQ3ZWVhbHlNME1laXZnMzlPUmcwYW1SOFBuNURTK04vOUVKdXhTcGFo?=
 =?utf-8?B?bFl6bXc1ZmZrdTJETVFBcmRzc1BDYzBUa2RlRHdkbHllaU1ablJBc0tiaytJ?=
 =?utf-8?B?N2xvSjY3dnlrU1JkZzFaempqWXN6aVhscEgxR0pSNGZHYmovQ0lSWjJvRTlq?=
 =?utf-8?B?TjhwV0hTWmVFSmJvK2l0cGcvMHpRYnhjaEtLM3V4UHhDSWovc3AvZmpydG5T?=
 =?utf-8?B?SE5vZWlFb0llMXZUUjFtV2JnaVEzdFFpSUJ1ajZnQ0NKdXlKVllKYVJRcHZi?=
 =?utf-8?B?NWswS2E4NWc5ZkRSMWhGVWQ2Z3JlUnhKdWFuYnpVc0NTL0E0Um83OXdtZnFz?=
 =?utf-8?B?RFpXMytOQmFieE53Z0VyWno1aGg2YXQzbUhtQkF6V1VXNlhHdE1XL2FlRSs1?=
 =?utf-8?B?dEJnYmlzNXFsQ0hmaWNobzdzS21CNFhnNkJZbm1IbFJQQytybmlacFZjbUZm?=
 =?utf-8?B?UGcvVkdZd0ZvRTVueGRoUUh0UklReGFzOGNjMXRab3Zucm1WV283OXFzMXdp?=
 =?utf-8?B?cWhRU1E5U0JMZ2V1VWd3cVBDVzBTWEQvYVQ0aHJEb1ZXWHQ2aG1aMkgrV0dY?=
 =?utf-8?B?ZkpocEFMS2VJUUp2R2VvTDdBaG1oSUUydU1MRUNuMnRPNVhTOW13VWpra0VI?=
 =?utf-8?B?MkhMOVRLK1NzTGFGZWJlVmNVV2FqdGVjbnp0amNSU0pocVhqSk9CbnpZNnVn?=
 =?utf-8?B?bEViV2JuV1A3NVptQ1FvN3dPMWtpMnFBN09lK2Z1WTJDL3N4SFRDU3NHR204?=
 =?utf-8?B?dndSMzgxWDhPYlpWQjdRVmM1Yk1zckUrS1lOMFpmWkdBRzJhRnVqY0UxNDJP?=
 =?utf-8?B?Snh1U25TQ3NrcFVFVmR5ZitJa1hLTFYrTDdaNXQ0SGRVdWI5cUZjWFBWSmJG?=
 =?utf-8?B?bXgxRG5CTTVKbzlqRWUvVWMzOVQwcVE4V2RPYmZaRjYyYloyZjBXc25vY3Bt?=
 =?utf-8?B?VDQvd1JYRGJwWEtMWndHRTNIUWZmNnV4TWs3VU1UNVdNWHVxazBGdUxCb2lG?=
 =?utf-8?B?U0ZWcFBBcVdMdDMvYUVXZ24vVkladGoySGtUeHM0RWlQL1hMcHhHYzJtRVRM?=
 =?utf-8?B?K3hOZjFtNE1JQUNpamRJV05MNzVPQzFsWEQ1ZnZ0VjViS0lqNmdFSndsbkx2?=
 =?utf-8?B?VUpUL0dWbENUaUd6OTlVQUNOd1ZIaGZBMG9jZk1RSHppM2NxaUt2TUxrUHlo?=
 =?utf-8?B?eEgrc3Z6SjVSZkRPZ3YrTVVhVDdWZGFGUkFnd0JKenV6Z2dMUWlvb0ZIVGc4?=
 =?utf-8?B?WGNNcEJBc01WdGpCT1psWVRNQlhMR0x0cUY5NzBnSUJwd3htNUNldk50N0Fl?=
 =?utf-8?B?MHFIYTYwRDFJWWZIa2RUNWdVZGJqRkEwamhXQm1rVUpWbkVhT2lvQS9aTzc3?=
 =?utf-8?B?SEg3Q2pWdkFVM0gvZ1BycGdGaDk4NVJFYXZwbjlaUXJMQVMxK29pUDloRE1K?=
 =?utf-8?B?c2U3RHV2ekVEcHpvZ3lRT2wxd2UzUjVYSy9NaW5tdjVMNUk4THFtZ0xYMlRZ?=
 =?utf-8?B?K3RuZllYNERtMWNNTS84R0M1a0gwNEIwNndzQXN4ZVVDZ1JrbWJ1My8zQjFo?=
 =?utf-8?B?ZWo2c3pvSk1pdnhqc1dRZ3ZqQ2FsblhVc1cxT3EreTBRZVlmN3JaT0ZXNWYx?=
 =?utf-8?B?U3JuVllkb0ZBbWZGaERueHRhZVdWTTlyTHk2bGY3SHVIWjE5a21oZVBzcmxx?=
 =?utf-8?B?NEg2M2lYV0I2cVZpZ3lQSllHQUl3V1lhNkwxa28xUUVNeE9NUndjcGNDYVVX?=
 =?utf-8?B?Nm1IR3JOcjQxSXJyblV5eG9OcEV3N3FndEFiOVBHYlNQRUNaeVFMVUlITndh?=
 =?utf-8?B?eE9BWGNrQjFid3JIMmdKN3AzVzh0Y0k2a1k4UEg3UTB3TDE4UVVXbnNUYU1q?=
 =?utf-8?B?T3pRN1ZLQXg2aEtNL1ArT3ZaU2xwWHdrandYazNBa0tFRFdVbDJTak52dUJL?=
 =?utf-8?B?cDF2VERiZWVrZEdjelFCdnI2UVRyd1o1MmYxM1c0R3JsNXV4aUY2dlZGK25y?=
 =?utf-8?B?aTRhVXBhVUpSM0dJcGhpdHRDRm51WHBwbVBTcVdIbVZuU05KazlhNEg3Mko2?=
 =?utf-8?B?aVdQajU0cVlzaC93TUV4RzlqbkRoU2hMREFxWENGKzdVQmxETDJXVlJiaGNr?=
 =?utf-8?B?ZjhLL0s0bVVqdXFzeTkxNDdtQm8wL2l0RXZzaUFIaVZmQW4wcFZDVjNoVTlp?=
 =?utf-8?B?SEcybUZHcVZ2c1JDSHZmamJKOHJMY0JuVjJVNjBxeXl0WFJPQUtlc084b0ZB?=
 =?utf-8?B?TjhuOWZyUjJDMXIxUmlXL0FJRDJlWmlvMkZUN0dVSUxhSm9EbllKY3QwUnda?=
 =?utf-8?B?QWprakhrRmthTnhIYVdIS1RMM05zaytHNFRpTG01M2I2VFVvbGhqT1JXVXVK?=
 =?utf-8?Q?zdHy3KEPOf99vmBA=3D?=
X-Exchange-RoutingPolicyChecked: E6/eX6RUsqpy6rAwFWRTvo0QUCib4QLJjfDf36Xrn6XuP4S+wLzQ7aN22/xfPk2SdScWAU2DBbRrLbfFkykrIF5aDLWMLcN+O6HOmMmfWF8HVYgQpPaiQ+D5Fbbbjlk0haZQkQjqHdsGWWIKItThReRVjKptvo/qljCxdUUV0hhUc/VBoreQD2xBTo54i83U9lWEuse+LO04O9CsJT3cqFog/CPRlDC9Qx4UZgbqMq0tDp20+Vv29Mmh00GdODThu4vqGT+Iy4Qm7c+TrHa+B+noXlWavq4p5r5Ml94LgH1dPglppo1QEVNyuiitc04gz3JpGCyUMpcXR+2xsiFs9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd40853-22f2-4f63-2f14-08df08ee7485
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:33:56.1173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lczjDWu97ei02E6h8nKRcdkuMPUMO440LjSZgiVFjOBBjtFufVquVCW2zL2GDqSjgo+YP25gausOR81lcC5zqZlorWmH9KhpN/kqWxaW4Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9897
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



On 9/1/2026 8:30 AM, Arvind Yadav wrote:
> Add a GUCSUBMIT component for structured SIGID logging.
> 
> GuC submit failures can still map to an existing SIGID, but using the
> generic GT component hides the source of the report. Add GUCSUBMIT as
> a DRIVER component and map it to XE_SIGID_GT_TDR.

nit: can we improve the commit message? maybe

 "The proper SIGID for the GuC submission failures is GT_TDR, but use
 "of the generic GT component may hide the real source of the report.
 "Add GUCSUBMIT as a DRIVER component and map it to XE_SIGID_GT_TDR.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> v6:
>  - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
>    is a driver submission component and not a firmware component.
>    (Michal)
> 
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index d6105520173e..91fe983ad917 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -144,6 +144,7 @@ enum xe_log_location_bits {
>  	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
>  	define(DRIVER, 5, WA, SW, "Workarounds")				\
>  	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
> +	define(DRIVER, 7, GUCSUBMIT, GT_TDR, "GuC Submit")			\

nit: we can have "GuC Submission" as a full name

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>  	/* */									\
>  	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
>  	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\

