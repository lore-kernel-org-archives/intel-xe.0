Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A06BC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 12:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507A10E14C;
	Tue,  4 Feb 2025 12:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSZ5qBw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F210E14C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738672034; x=1770208034;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=12QI1pRf3pd1l5uMDRnkyaCY6Mfpns7kDejggTE6bnQ=;
 b=PSZ5qBw4qjQE7og7icFpFwKhYGURjef03NSEZV2p8nLJTNoonZKtTcfV
 G+yVcKEYDH5sXZq0dA2YivUNIVrK8KmLpa+8XNm0cpP4P2GkyMAR1/I76
 wtXiTdYC2F5sdT3+qSZ9GTnQ3IglXR/UQuqO9QqBNvYshlk9K0Yqehot0
 h/Mv3l1LC/Bt0CZ2LlxGvXGlcmRMA7tla/XPBlbUqTUz261lBlxjT+b1q
 lKZQmXeXmpzGW1iEijEy1Nv9UtZ8lk8/y5A9BPExTtfa7rzn/iNHBN/Uq
 FqcHYG0AiAAZZ4c3a0Rvc7Zux+6FrZqs+LG/QOg6KTRs8n9lPKGFb9vca g==;
X-CSE-ConnectionGUID: ftEi+GTQTCKz+ZENP0UY2g==
X-CSE-MsgGUID: p4TCGqe/RKKGpg4/0ObVUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39332487"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39332487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:27:14 -0800
X-CSE-ConnectionGUID: MEuwbi03Ts618DImamJ9tw==
X-CSE-MsgGUID: 5WYh3J2FRPGHS8moG1s0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115578889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 04:27:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 04:27:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 04:27:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 04:27:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5agsmNwoISW84DXx5o+s8Lt2Fmfi+nStKOBq1BszfMmuOkrz6bmCWg6GZW3YKNtrIdIpaUSeztlav7zJEZIOKYQGxlpTyOuHfb8tKrZc3r+QGz0CvKFstoKk6YuU7WPcFbthFSVbktUJcA0DJ50jXNgnQdzKY7Sib07lla53bspaDqI5X+2pW02zOtzZMONH3zpqrzOOmg0UQdDbFW9JHPh8xEqn84Ka2aQ9gF55D9naAkR+76cjlpd72gSFt9nM+pOVMj7GXT27peoBLQwkH7sEl7fVGs3118PuDDyZ236pMDfMYAcroluqxcu0MntdK4CKIyxkk6dT1Sh1LsNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkDZf2ZgDd4rQeG0Aj+Db1cJyIp+jgwXuZ8WjOTYh70=;
 b=VCTZ4YuMx0CXr6YgZAqDoOd8pT7iy/SPkylHzNEgvMgue3MnU8gQABy05WJ4kQB4u8TQeb4jyW6Z9BbwXi05JYqfS/m7+hSXy3mFirn/Y//uYKUqwxRYqRwnHPbJ3B3fEjElgljsgCyINkS+t1WarpAl8E+YYHtivodQh7WRZkgwz92dEYE1CGGllryAB2VcO5Sosp6WgCGD1sMXcYgWdJ7hdqLikfzL9Zi6AskNMJZxZNkEEHzPef5Cri9VvtLS58m90ifCLyNnImga4Ba0sabG1RzQYzvwuHuDrA8kpeFEz5gC515fYEc92ZSQJI/unr82nsUypnZldNDz/b1xOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Tue, 4 Feb
 2025 12:27:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 12:27:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Tue, 4 Feb 2025 13:26:57 +0100
Message-ID: <20250204122658.813847-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 601a5fb4-a17c-433e-2cfa-08dd45173f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFdLeGhGUURNT1o0YmJmT3g4TnlhREI4UWdPSCtYS201ZUpYWjUrdStuNW5F?=
 =?utf-8?B?cjFXOXdVa1ZHSmFXZjJzZ2lOK0JFYXlNeWxqMnhOelhQYlQrV3BsaEhVRXo5?=
 =?utf-8?B?dk5Lekl2OGpkQjdUNFFENjdqOVd6OHBZcVhaZVVDS2QvSHFsZWRTei9wMFI4?=
 =?utf-8?B?UzFtbFY0Ry9TOEJLSHFjMHhjUXNOcFFmMG9oTndXRCt2K2g1c0tEdVZIK0Fj?=
 =?utf-8?B?ZkNtK2JCelZ0aUt5bTlTRHFaMXUzV0lNM0RGdmhUdEsyQ1k5Skt1ejN5b1g3?=
 =?utf-8?B?NGdKWHBOV0srUmMwQ2NqeUxQRWR1NTBTYXFJNUMrRGZXeU44TjIrTFQ5OWcw?=
 =?utf-8?B?dDc0NFpNbVFsYVNyejJGTXJTbGtJNC84VGRUMEk4enYvOEU0d0JHaXJLQUZj?=
 =?utf-8?B?OEVpdkhUK1IzUWRiOEo0TDhkbFJjV1BINUpJeVZZNS82R1V6OXRBT3VaZWE3?=
 =?utf-8?B?cm1URzdQZWk0T2hYUmNVbE9kSXhCTjAvVksxZUtjS2RPRngydHlRcFB3K25z?=
 =?utf-8?B?V2VSeWRZTkljQkNuSXlRaDZsekxlOGJreWtSOG9XR0ZOaWRxRnN6aldsMGdJ?=
 =?utf-8?B?Nml4Ri9jUXRWZmdsVXdGZWc1MElTOFQ1V0F1Tk5RcnR3ZTE1bGJtb1ZsKy84?=
 =?utf-8?B?bWhFUk9ndGpocHNUQnJ4eFk4eTBWZVFxUTJ6QkZUWjFCbm1BQkU4dG9aVE0v?=
 =?utf-8?B?ekZ6SGtJSFN4TEpvZWQxMzFXVWFvbFZ1QkUzWUF2M1I2UWhZNUNvYjhvWjdm?=
 =?utf-8?B?ZjVWbkJWcUlTblJBSEhmNGVjOU90MmJLeVI2bGo3aHI3YWZST1R6ZVlHeHJw?=
 =?utf-8?B?cWhjUGJRcllYZzhSNmhpOEh6N0ttdEdZZ3ZlYjkvc1BJZnZtVVJ3aUNwY3RO?=
 =?utf-8?B?QkNNbzJYV1lDRXQySnhMZmduSC9KOE1RNlpaMGJTRytkbWt1YVcvdHlnYlor?=
 =?utf-8?B?UElkUWw2SUpUdVEwMkFvS0JMa1lpaStZa3RoTWlBODd5SzNCZ3dKSFV4Ujk4?=
 =?utf-8?B?T3ZKL1ROc2VDbVZmY3pDZmZOUVp4V2QzOGtRY3cyenVRbmdWeFFVSm52VmF1?=
 =?utf-8?B?Y3YxOFBRODEzazBENnF2Y1dZM3NEeWp0Z3RXMzJFUzRnREdDRXRqYmlYcGhl?=
 =?utf-8?B?eStIV1MwYjZKR1c3VVhId1FKNnFPL2JaeVJUMjJiRGpmQUw1Ujg2SG5vSmYx?=
 =?utf-8?B?WHkrVnlvUkF6aCtUTzFvd3RsVWRGeW9iWVJwTUcrRkZqN3hpenlaa1l3MGMy?=
 =?utf-8?B?R0xIUUVuVXA1MG5UMWF3Q0dtdFlWaFBsU0tTRVFmUVBwRE82Q0tkcUliYzhR?=
 =?utf-8?B?N2E2SUFKVEZlekUydW95NjdiMGp1aGRQSEZDS3dSRzBaWklFZW1Yem53RmI3?=
 =?utf-8?B?cUcwSnZmS1ZKcUY4bDNLb2JVT3pOZVNsK2lrcFFVczYrVVROQ2VWL0grT2lO?=
 =?utf-8?B?S3g5TjFwTUZEZXljYUVKUHZwZ3cyM1l2N3hjYjBLNlVaSDJSY2dMQkJZNjJy?=
 =?utf-8?B?eE1samN6aTRtakEzbUJGOXgra1dSSXBRZVk4aTY4MitUdzR2cTZma1I2SkRv?=
 =?utf-8?B?ODlGOVdocEF1YVFnRDhjMUJPbXRqVHQ2czVuZmN1LzE4M1hKVlh5WlZUdy8y?=
 =?utf-8?B?VjJNSEIyTmpxUjRYOHVDS1lyZlFvZjl1NU90Q1VITHBZNWp1ejFmNjV3T2kv?=
 =?utf-8?B?b2xtN2ZOK3ZyN3BibjFRZGZ6TFh0ZGdKZzRQNHVzLzVTQW1qcEdCSkZPdW5N?=
 =?utf-8?B?TFZMOVpPMGswYnN3YzBpMmE1ZlBRNENpUU5sbEplSTkxVEVYR3lpZHY1b0ZF?=
 =?utf-8?B?YW9ZTGx0YXJlU1R5WE5sc3hrSEZxN2tIU3l1a1NpZjBLVXZPL1dsUktJWEpC?=
 =?utf-8?Q?AGery0bS13Go8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2ZaNjI3SDFsbktYUzV4VERCQlFOeGVuOHZxZ28yN1A1WUk4dUVsczBEcjI0?=
 =?utf-8?B?bTBmQlFoTmJPaGxvZTdxb3l4TkZzOER1eUpUSFh3VW03NHRBNC9YK1dITksw?=
 =?utf-8?B?d3V4K1Z6VXJlZmNpZ29QamFVOVFKQm5IYjk1YWFUNDFwWkxDeE44UnJVYzZY?=
 =?utf-8?B?S05KQ2MxNFZOTy9FVU95aldldEFWaHVBYmJ5ZmhKUTBDTHVFenFSVGNueTF5?=
 =?utf-8?B?TjJDb1YrUjZoeVFrVW5rYmFhOWMrV01GZmNJVXc0RmdGaXBXajF2eEFzVHNJ?=
 =?utf-8?B?QXdPS2lSZ2grVi9yMUVMMEFQcWlmZ0wwNGQ0dDlpcEdTWTR0RndRanMySS9k?=
 =?utf-8?B?Q0hZNFptMUwxcFF0aU50SGlBdEUwWmZzdkhrUzhhMEJMRGx5YTY4eXRuYnBG?=
 =?utf-8?B?bWlYNTRNcFQvQ3UwZHNsZnliMmcwMEoxd3NnK3FqM2M0cDcxWnBGNFV6VnQ3?=
 =?utf-8?B?R0NNeXFQN3JSaUpxdnFLSkR4eUJuRGNKak1BbUE2cW1hWnNGWlB3RUd4NlJu?=
 =?utf-8?B?RXJhVzNmd1I3blI1UG83L1FabUdHRHBhSW5adjNTcUVtb2xHSERhaWlUelBj?=
 =?utf-8?B?REJzekVhRm9QczFwLzNoSWZQSk1DaTNBa1EvY2NhamZaK3oyV3ArSEhFRVkw?=
 =?utf-8?B?RDVxVlZYREtESjdRVUhqb0xCaWZKTmsxQ0pqMHVEdWtyYmFocEVUUHcrVGti?=
 =?utf-8?B?a0lhQTdaYlBwZGlaWStBQjBycDZPMitRVEd6cmtST2ZwSXExRmNnWHY1UHRp?=
 =?utf-8?B?c3lEZ3RpWUZNY01NejA3MHJSN3RQREhOQWp1TzV6dnZCNnE0WWc0d3JGMENu?=
 =?utf-8?B?bEcxN3N5K2dSbVE0ZjNsRVcrN2REMFVUSVU4YkpPTkdZcFBXTU5TaTd3SUov?=
 =?utf-8?B?UmVvNit2ZEdMQnlNTkhPYlVkNFJaRzl3SHhBNnNOeDNiTkkvUEo3VzU5YVdW?=
 =?utf-8?B?U2N5ZlF3Wmx6NSt5MVZZZ3FMWmx3TFE4WkcvTzlUL1lxbmZ1MnMxbjZXWG1a?=
 =?utf-8?B?YktBMEMxSzdIS0t5U3FpV3ZNYXUvVWxZaHdWWjVTVzZJVmcyZDUwS3lMb2tP?=
 =?utf-8?B?VTV6ZVR5amxOSlNZZGd6cS9KZVFCODZ1ZXFnMTQwWVZkMVM5cU1EKzJOa1Ar?=
 =?utf-8?B?RkJUeFpYcG5iTDVjMFNRZjV4K3ZBWi9FQzBpY3VKRjJ3UXh5RndGYUtiZ0RV?=
 =?utf-8?B?bEtXL0xneHF1QW95RkNpS1MwdnJiRzY2KzlYK2VtbzJFVmxJR3IyaCtESEVz?=
 =?utf-8?B?OUhXSFc1cXJhUDRSOUkrRXVnTWdOYmFDTG5Bc01SS21vN1ZWWi9hcXVqQWpH?=
 =?utf-8?B?VUUyL3M5U0Q1L2pnQlN1ZTNBWk1uWXJmVWNtOXQwdUVrcCtNZlZ1OC9YVDhk?=
 =?utf-8?B?bG9KVWw5NGlrSU5qa0svNDBxRUpaamhSQ2dhMzYwek1QcDUyb29IeWhVZEZ4?=
 =?utf-8?B?cnZnbDhKOGxYT2NIVGlUU3lyNmMwenBEeE9mVktZUk1vbmpNdWV4T1Z1QnNa?=
 =?utf-8?B?SlN6ZWJMYU55ZjFFWndrTXc4dGE1K2NHT043djVWaUdCUDFhTFhSNHlralFD?=
 =?utf-8?B?MU1vOURNZW5QWTVETm12N3c4NGxUS3VZakNCaTdMK3NLZG13WjFtQmY2UGF5?=
 =?utf-8?B?Tk5uY1hEdi9USkcybVdETVpVbFozdzNXOEVVMHBlUXUxWEVLOEhzenBZTUtn?=
 =?utf-8?B?SnA3RnFnWDVBTERoWU1aZG42SEIzNjJqVG1rNGpHUFFkNHZBTk1LOFR4VFpU?=
 =?utf-8?B?SWFsakZveEcxZ21WeFcrMkFaVThlRHNXcURYelQvVXRUbSs5dWJIQlEreDIz?=
 =?utf-8?B?MFRPUTBVbnZEc1dPNlNPMlIrNmtRekhxbFc3U01GUHFNaE90VHFKQWFrVkkr?=
 =?utf-8?B?MEg0UlFjTFc3UFBiUHpZeHlMdk4vMHJneHQ3QWlCcGJGc0hXQTY5eU15RFJx?=
 =?utf-8?B?OUtoUFRhTlUyUys4YU10UzBPMlRXeWhNcE9aOC9zYldZL0FOTFFOMW82ODFQ?=
 =?utf-8?B?QVVNNTBlZUwrTWJpcVRtOGw5OHE3T3FWQzNGMnJHN1p3MDNWU3RNbFFtb2V4?=
 =?utf-8?B?dVp3QlI5ZEk0VVExTGpLRkJUOXg0SEtSWmxtUGJTeXBIbVh0OTlRR3dRT0Jl?=
 =?utf-8?B?bFRkT0I1RUNwc0JyaFhReURoTHJ4ZTdBYlJvd1MvWFNrTUJqa0FNR2xRY1Iv?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 601a5fb4-a17c-433e-2cfa-08dd45173f65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:27:10.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ubB+cazG7CEKb5PZ+cLYn6n7Aw/lPfV7hDj+ACRWK88NI5Tewn5hCC/6l94+oeRV+T5wwmpaWShcrMRauafMxDbt6hE/NHTiXES9A44Ueo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning
v3:
 - remove IS_SRIOV_PF condition from xe_device_has_lmtt (Michal
   Wajdeczko)
 - keep IS_SRIOV_PF asserts in LMTT-related code (Michal Wajdeczko)

Piotr Piórkowski (1):
  drm/xe/pf: Use an explicit check to see if the device has LMTT

 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 21 +++++++++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c               |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.34.1

