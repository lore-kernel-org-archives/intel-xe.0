Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B42FC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 10:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D8D10E27B;
	Tue, 15 Sep 2026 10:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAxD4YAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5A810E27B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789467890; x=1821003890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+qfRcWD0u6k4nkXKEKAdExcBDFe8X8XYCuD0PhH3w9g=;
 b=QAxD4YApnJKl1TJEhHpWTgZ5qktqF74+yV63kFYUETmlH4PgH7e+TSD3
 afCRWLxRtSgPHxRRTmw0U3PF/42Y3qmJ0e6CZJluU9LFkOfMMQWirfq34
 SU7qIaNokYsiMqQB+ImlrwUazwhrEbdyFfkDSC3QJwb4u8J9Wk5sE7ah/
 U8bPNvWq6SfGEmJJAPi48totxfYNmE23NU/rORb61nSnew9gICISdrQpA
 C+TSJlE3kVnA4XmalYYXQ4na+ReVNyJsUn8kB9cLJjhpMX5uq7g9dbdnp
 fz6K29nHSBwM6lK/tsLeqjDEKaaNUbEkGuUy4lryz34ANQg8Y1pQU3eg7 A==;
X-CSE-ConnectionGUID: /4FP0/WqQK+60+tU7iwG2g==
X-CSE-MsgGUID: 57/0PCUyTfOkFO04px5flQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="333960"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="333960"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 03:24:49 -0700
X-CSE-ConnectionGUID: NDHvRnbDRfaVJX9zXImEew==
X-CSE-MsgGUID: xOavamg3RJyGsoS7FonSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271523423"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 03:24:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 03:24:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 03:24:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 03:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf/ZESHb8eFkXTVFVu73xnpLqstiUV8ps4tnpKcvzQ+rX4JiL+3pZfpcOcTktwOWcKW4Dr51IERI0LnKuuBPm5ZJDHrWqX1bHLDLx9UnWpaz7KJ1nj41uciAInFR3JojgGLevihhY2CSvOOdRJub3TAjL01pv0ARdT1slGmMDQZ76TMas4GQFZ6nKVQBPZR3ZFA0jD1C29gQnvdXLaYhgOxLKd9vxINqvTgP1IZuko6/0nb2kQRulw6Zg/P2PZkfmVF47B3QhQS3dUiZ9TPRarpe53fe2G4lY4IsIxcxymVZtZkihik2cn94OoBpNVGCNBWkGMB6jVk/J5MtnGHR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue+wXLKP8mXiFxglX1YYcNNN0RwQBByEfOxUE+mDuTc=;
 b=eAm+YgZnwmBa0vLMSLBKsAbQXzN1p0tBLQwV5sLa919gepJ7KEM6vaLr4LfXxGrlogWcnSAZcz63mcVuTeC/vExYvXundaf2l5bSwy1wWAy6mNNls3RIbA4R8HwShGalq0r0bT30KNLttXKbqrFYTsKpPxKB6Buj/Da+/mKiqgwCZO1g83ER+fv5rpn/5cmoKb0TYp7LDRsB1ExZ6EMbjIE1UQodTNqlbpWBpwM8+cDypIJuVWhm47T34JNaHQ5ts2U83G3md0++bovNPvtlt1Y3FPaWOh3GOD0cii0Jga+d8wC6vvb/VrJ53/s4i0ePjdIiJALmmSCnJzi7I7rPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 10:24:39 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:24:38 +0000
Message-ID: <7e5691ad-d3ed-48e8-90b0-81ddf737a6f9@intel.com>
Date: Tue, 15 Sep 2026 12:24:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260903233958.475162-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::22) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5614336a-3df4-43e1-214b-08df13138c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: dgDsA67f1zsZj1HUyGB67w2gQEsTTka4bt2TQ6rWFJOk1e1tf8PFIRT4PANhvs2lsOO46qG2UbQLPbHfhCxHlO7BOy+ZmEXZw3v/UhAM7NDAtl10dJcqo7mrGtXYfVRB2FrOuuvFFVt39ya4aezQm2h+kjnQsI3v7RCyUtQ0AnvqSJoAZPz9Nemb7PIyeHMvmAAVDceaulOuB8tw5t7OJ7Iy99kpxYXwGmN50UYz6GNxFl3XInaq6wKTDvSmlYnYhczh36BE5YHEhRmRlnNuydEuA9AdX37vk3BSnwAMftSMRq7GB9wYhn+ZdJVF2CtEz7XidtcvZR5Bbg9B9iQooEWrjFiWTEaXzz3eVzATxKkGdgZV4X+Wewww/Qm3NbQ2qMyP1W5m6Pt4Z302JKpkocKU7jW/NuLQZd5g7jYRadk9Skh+8uMpuoXvsnGi2csS2zlLzghfVIkcbPB4S99dCyv5uhCGux2lF4ho3CSytxz7X09dd3vqLw93MH/tz6mk5jYTehBbda/5AQTWjYOQ/ZVAJlJPQWZbklviC9hulxutgUVAAKwMYuzdtKvhtpdTN6L9jIBm+Q3LgMh84k9mhdbpZTuT+e0SKvrpE27Mr/9ZsemAc0PQy3KY2C10L30wsPL+nrmIw6AT0d6z7jtoG523RRngNK1TAewmjsKQro8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBqcE42NWp3Uiswb1cweWNLc3EvMkdiQ0FiR1g3RWdNbkQxVURrMEpFd3Vw?=
 =?utf-8?B?V3NVYkI2MEcwdDEybm4zdXlycVFGbG9tY1RZVU1vK3duYk8xYlpkRDYySlFS?=
 =?utf-8?B?WHdWWDdTbzVIOE5XbjREblpwbGdQZURZdW94dG9vK3Z0SHVpRlE4cStpTVU3?=
 =?utf-8?B?SThjUlo1UnpNcWlsR2RPN0JhcnYzZ1lLTWZVaEZhVWJHYXhYM1UxbGExS3Iw?=
 =?utf-8?B?NkVzYk14bmMvdG9tNTAxNHozbzN3dzBGV0EvVE94bU9xK1NKRUxHR3c1blpv?=
 =?utf-8?B?TjZmTmd6WnJFSGRsSGV3NUtWOFZ0WmpPdVpEMWU3OXpwYUlaczhFMHpvNU1E?=
 =?utf-8?B?N3REaGoxT2tWdWQvS1pLTFg1NFZmWlduUEQrZnpzcCs4bXNydHdyN08zeDR6?=
 =?utf-8?B?SnhOTUIwUmF4UlRUUVZTK3RxelNmaGhOZWxOWVNJZ3RmQklacUcyZUJWMFJI?=
 =?utf-8?B?WVF2bWhTalNmd0NLdmJSRGlMNWQwdUhvSFd1TXgrUjFBeWFTcVFvZ1BJMnFr?=
 =?utf-8?B?TWNWdE1tOVY5ZGZMRHhoTnAvV21XOCtYT1VVNmQ4SHZiY0cwOVNBdGJGakxF?=
 =?utf-8?B?SkFIRHdTZ0Qxd2htdld1eVg5di9USjQ5dHFQWTFjNlFRbllRUCtHQzJOTFB3?=
 =?utf-8?B?Nm1SOVJzZ1BLQjVjU2NXbDdaOUdZMmNRNk96MFRMTUJlYVZEY3JNdlU2eE16?=
 =?utf-8?B?M2pwZ2QrRXFXbUhVTis0VkNDZC9UanRZTnorbEk2RFRja3ZLci9DakZrVWlq?=
 =?utf-8?B?L3plcExYdGhvUS9OUXRhNmsveVljbDF6UXlJT0wwbXRzUmgrSlgwWVAzRk51?=
 =?utf-8?B?Vkk5N1pzYXJaQ2V5dVUydkJzTDJpTFpSMEhwSHhWV0ZaNmVWNFBZbFV4ejEz?=
 =?utf-8?B?NWJuUFE2UTFkOU85M3JNd3lqdGg4MWxqMlRNNE9HdzNqeXBLTFpTczN0ck9X?=
 =?utf-8?B?dDgySEsvUUlVbmx6czdTUUxOTjJ4M0lRUHJWZCtSdEJpdFpKazFZNE83eDNt?=
 =?utf-8?B?S1lnNW5Rc1FNNDltU0pjQ056UmJZUVY5VHB1NEY2SFF1NHU1RWhxalpiT0sw?=
 =?utf-8?B?RnZ5T3ZNVEVvVVBNRUp0UTV0aTM1M09VVzM4NFlzRXFlemN0V1o3NkpSd3ZQ?=
 =?utf-8?B?Rmkya0w3OGhLNG4wN3d2blQ5MlViMXVzam4wUDJNOVV1dTUxaGlONG5hNkhD?=
 =?utf-8?B?Q3ZqVVArN0VhVU5Ta3R4aWlRTlFxUzdDSDFqNWdweUo5Q0hwbFJDakoyejF0?=
 =?utf-8?B?bE1JempHc25ab1NqclZhVDF0MlZObllGV0RFSzlsR2RKcG5kbG96UnhtWlFW?=
 =?utf-8?B?d1pWdWpIWkQrcytNLzA5cjlIbVV6QkhhSm1FQ3hybTBPTlgrTTJEaEx3alBn?=
 =?utf-8?B?N0kybHVrRWgrN1BDWlMrcG9lOGs4V2FNM3NQVjNKL2pNYzhTOTExb01kNXk3?=
 =?utf-8?B?L0VJaWkvNHZ6MnRyN0FBUHo3RU4wNk8xZC8xTENpcXozVTZnN0Z2cnFhRm9n?=
 =?utf-8?B?dVhsVmxPWS9VaDJyZWVlNDVlcjl6cFN4VGNDR0tFM05JV2tkZmJPRHRJWHRo?=
 =?utf-8?B?TXE0ZFU5NW1OOTM2RTl5T0dXcnhFdjAxOEJ0Yng4U1J3RXhQL2hqWnRVZkJj?=
 =?utf-8?B?b1dXcTdJUUpMS3NFaW9Od0d4NXBVQ2NLSmNNNTZySW43QklPUHdINkd0UkJN?=
 =?utf-8?B?UG9QRDFTUjZTWnZ1RTlINkV1cTVCRnFjaS9ndzBRVW55OWhObmtQcVVBcHcw?=
 =?utf-8?B?dUsyVTFPMkpDajR0K3FWemRVQnlhUnYzaXBTSXNqNGFPOWhiL1JneXFtWEJo?=
 =?utf-8?B?bXFCVkNwN0VudFpqRWRyaDNPVllzREFUK3hSRDlEWm9rbjVhRk51UTlzOGdN?=
 =?utf-8?B?d2pBZkFIaFpkOEt5TlBRMjZKYmRudHJvUWx4ek12ZGhYWS9uU1M4dFJVMFZJ?=
 =?utf-8?B?emZhWUM3Si9IVWVJcWUvUkkvL0RkcWI5eE5vRDNndTNvR2Exb1dvTG10bERM?=
 =?utf-8?B?c0QzRWg1MDlGS0ltUW9BL0tzNzBTeThzMGN0dW45ZDY1NitkSGR3WEdhSUNB?=
 =?utf-8?B?YWtvRnJ1RVBtR05OT01EMzlWdU5xcGliNHVVakRvMDVJMUFQeUZKTW9SMXlG?=
 =?utf-8?B?R3pwVzJteVFmQi9xbUdlMjRtbmM2bkdZcE41RVhLaDRvdWFMMTdFd3EvREdR?=
 =?utf-8?B?VHUwcnFSTjlzQW04aDZYcDdPNTBGSFZBSXRZQ3ZxUGJpWEI5VGNtb3JyZjh3?=
 =?utf-8?B?ZGk0U0NwWTc0WnFsbkJhck9STnhYQUE1Y011QlVlVitFODZ6bldQMU1nYXpi?=
 =?utf-8?B?NkRCdWZ4RVpIRDVHNzBVaS9DR09say9veW1VZlFCdXZLd3hNbldvVnJudWJa?=
 =?utf-8?Q?oW4Ua4mdf6yO6mds=3D?=
X-Exchange-RoutingPolicyChecked: W1K0LIjRA+a2QnsuZSsf+QZySPLwmVWzS7vyN0AqI1695ww58ag8KtUyVqOmMOTy4WRAemqoba7pmxKNaUrPVAypzbe1m7ZoYa0XalHruRxS5AMD0BrDgZnNfGS9ywxoeyYTijDpma5mEKvg7PzmSkcAhOgG4iAD4f6MSEg72M28gECSbiTIBWqXUv5EvP2F+dBFwJqVslt+asYi4BtDWPXOkee932eFkclVzZsx73mT5BUf/tt2AwnRhQbnysF+YOPrfuHe0hxrulgfzzfjt3YbaeL3BJnrVBDWkzoRow9jMFR0qrr6ckFvF3Sxq04xbOMI7dc0xqqoHPNug/fk3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5614336a-3df4-43e1-214b-08df13138c37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:24:38.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MUVbZ5PakUtxX7cLxPhuCYYorjzARW/hWLDyr3BNRNWLYdTBRazqTHTMEfJ9VM0NtnLE3/dUQMuoZ01GBDnbvpujditqFJP2Gpj9z2gclA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
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



On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Convert any errors that can cause the CT to be declared as dead to
> use the xe_log_err() helper. Errors that are escalated to the callers
> are left for the caller to report with SIGID if needed.
> While at it, update some of the error messages to make what went wrong
> clearer.
> 
> v2:
> - use different error codes and better messages (Michal)
> v3:
> - Drop GuC from log messages (Michal)
> - Clean up log messages

move under ---

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Assisted-by: Claude:claude-opus-5

missing your s-o-b

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c5a417fef913..623b8c1c6944 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -30,6 +30,7 @@
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
> +#include "xe_log.h"
>  #include "xe_map.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pm.h"
> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  	return 0;
>  
>  err_out:
> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> +	xe_log_err(gt, GUC, err, "CT: Failed to enable\n");
>  	CT_DEAD(ct, NULL, SETUP);
>  
>  	return err;
> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  
> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
> -				  h2g->info.head, h2g->info.size);
> +			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
> +				   "CT: invalid head offset %u >= %u)\n",
> +				   h2g->info.head, h2g->info.size);
>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>  			return false;
>  		}
> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  	bad |= !ct->g2h_outstanding;
>  
>  	if (bad) {
> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> -			  ct->ctbs.g2h.info.space, g2h_len,
> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> -			  ct->ctbs.g2h.info.space + g2h_len,
> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> -			  ct->g2h_outstanding);
> +		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
> +			   "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
> +			   ct->ctbs.g2h.info.space, g2h_len,
> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> +			   ct->ctbs.g2h.info.space + g2h_len,
> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> +			   ct->g2h_outstanding);
>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>  		return;
>  	}
> @@ -963,23 +966,26 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		desc_status = desc_read(xe, h2g, status);
>  		if (desc_status) {
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, err,
> +				   "CT: write: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  
>  		if (tail > h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> -				  tail, h2g->info.size);
> +			xe_log_err(gt, GUC, err,
> +				   "CT: write: tail out of range: %u vs %u\n",
> +				   tail, h2g->info.size);
>  			goto corrupted;
>  		}
>  
>  		if (desc_head >= h2g->info.size) {
>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> -				  desc_head, h2g->info.size);
> +			xe_log_err(gt, GUC, err,
> +				   "CT: write: invalid head offset %u >= %u)\n",
> +				   desc_head, h2g->info.size);
>  			goto corrupted;

hmm, all 3 above are under DEBUG config, should we really convert them to xe_log?

>  		}
>  	}
> @@ -1224,7 +1230,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  
>  broken:
> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
> +	xe_log_err(gt, GUC, -EDEADLK, "CT: No forward progress on H2G, reset required\n");
>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>  
>  	return -EDEADLK;
> @@ -1562,11 +1568,12 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>  	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
> +		xe_log_err(gt, GUC, -EHOSTDOWN, "CT: Crash dump notification\n");

drop "CT:", it is a FW crash, and CT is just a comm channel where we get that notif

>  	else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> +		xe_log_err(gt, GUC, -EHOSTDOWN, "CT: Exception notification\n");

ditto

>  	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +		xe_log_err(gt, GUC, -EHOSTDOWN,
> +			   "CT: Unknown crash notification: 0x%04X\n", action);

hmm, this looks like our programming error
we call guc_crash_process_msg() only for 2 crash messages
why should we care about something else?

maybe this should be coded outsize xe_guc_ct.c as:

	int xe_guc_handle_crash_dump_msg(guc, action[], len)
	{
		if (len != XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED_MSG_LEN)
			return -EPROTO;

		xe_log_err(gt, GUC, -EHOSTDOWN, "Crash dump notification\n");
		return -EHOSTDOWN;
			// or just EPIPE as this should call DEAD_CT
			// and kick_reset
	}

	int xe_guc_handle_exception_msg(guc, action[], len)
	{
		if (len != XE_GUC_ACTION_NOTIFY_EXCEPTION_MSG_LEN)
			return -EPROTO;

		xe_log_err(gt, GUC, -EHOSTDOWN, "Exception notification\n");
		return -EHOSTDOWN;
			// or just EPIPE as this should call DEAD_CT
			// and kick_reset
	}

>  
>  	CT_DEAD(ct, NULL, CRASH);
>  
> @@ -1596,13 +1603,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
>  		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> -				  fence,
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "CT: FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
> +				   fence,
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));

hmm, while FAILURE is unexpected under normal operation,
it is still a valid message according to CTB ABI, likely
caused by host driver mis-programming, so I'm not sure
the -EPROTO is the right error code here, maybe -EINVAL?

>  		else
> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> -				  type, fence);
> +			xe_log_err(gt, GUC, -EPROTO,
> +				   "CT: unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
> +				    type, fence);

OTOH, this looks fine, as there should no other responses

>  
>  		fast_req_report(ct, fence);
>  
> @@ -1678,8 +1687,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> -			  origin);
> +		xe_log_err(gt, GUC, -EBADMSG,
> +			   "CT: Invalid G2H origin=%u, reset required\n",

nit: can we drop this "reset required" phrase?

in other cases (like broken CTB.desc -EPIPE) we don't print that
and we should have some follow up messages saying that we've triggered
a RESET due to something bad in CTB, of from the RESET flow itself:

./xe_gt.c:940:  xe_log_info(gt, GT, "reset started\n");
./xe_gt.c:979:  xe_log_info(gt, GT, "reset done\n");
.

> +			   origin);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>  
>  		return -EPROTO;
> @@ -1697,8 +1707,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> -			  type);
> +		xe_log_err(gt, GUC, -EOPNOTSUPP,
> +			   "CT: Unexpected G2H message type %u, reset required\n",
> +			   type);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>  
>  		ret = -EOPNOTSUPP;
> @@ -1796,8 +1807,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
> +		xe_log_err(gt, GUC, ret, "CT: G2H action %#04x failed len %u msg %*ph\n",
> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}
>  
> @@ -1847,7 +1858,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  		if (desc_status) {
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> +			xe_log_err(gt, GUC, err, "CT: read: non-zero status: %u\n", desc_status);
>  			goto corrupted;
>  		}
>  	}
> @@ -1879,16 +1890,16 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		if (g2h->info.head > g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> -				  g2h->info.head, g2h->info.size);
> +			xe_log_err(gt, GUC, err, "CT: read: head out of range: %u vs %u\n",
> +				   g2h->info.head, g2h->info.size);
>  			goto corrupted;
>  		}
>  
>  		if (desc_tail >= g2h->info.size) {
>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>  			err = -EPIPE;
> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> -				  desc_tail, g2h->info.size);
> +			xe_log_err(gt, GUC, err, "CT: read: invalid tail offset %u >= %u)\n",
> +				   desc_tail, g2h->info.size);
>  			goto corrupted;

hmm, again this is under CONFIG_DRM_XE_DEBUG, shall we still use xe_log?
>  		}
>  	}
> @@ -1908,8 +1919,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
>  		err = -EPIPE;
> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			  avail, len);
> +		xe_log_err(gt, GUC, err,
> +			   "CT: G2H channel broken on read, avail=%d, len=%d, reset required\n",
> +			   avail, len);
>  		goto corrupted;
>  	}
>  
> @@ -1991,8 +2003,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> -			  action, ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "CT: G2H action 0x%04x failed\n", action);
>  		CT_DEAD(ct, NULL, FAST_G2H);
>  	}
>  }
> @@ -2111,7 +2122,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		mutex_unlock(&ct->lock);
>  
>  		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT: dequeue failed, forcing GT reset\n");
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}

