Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87F5CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 03:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6310E08A;
	Fri, 22 Aug 2025 03:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEcdrcm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8219510E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 03:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755834814; x=1787370814;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4zR5TsdMFO+viOcmMW7sk7WdrkB4l1etAuaWAsyID8Q=;
 b=oEcdrcm8DfloVOsYKlwhXOMCpF/XARjv0HT5U/Zcc8qWy2QJM+Vpz547
 5wkkl2mKDSR1mRvcJaZl//ccH/M7Lms2EIybbA7Fu9fzMX0/K2gBfpw0Q
 7GMkin+7Pr5en9XoyCkKBXLzaE8tvZAuWZ3BKn4M5/Ioaapv+fo45bkiV
 qE4geVx9SawVS2v5AGyRf6vciaVNYhr30zUyNjRTQLZ2pD2J/1fopKetH
 Sv/cD5PWI9a0OKeCYand6qsEg99lbnxy2eLYEyaAk++EQuosnFPvuwhF3
 RNJrpv4PW1ttVDRFU5HptdWakTrgoFF7g8Jt6R1nBJR48x0QaHeQEh0Ki g==;
X-CSE-ConnectionGUID: fT4ew5n0Qx+HDwq21TylpA==
X-CSE-MsgGUID: pXkoS8VRRFKzD8bVwuRHSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68737630"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68737630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 20:53:34 -0700
X-CSE-ConnectionGUID: PBgG54WSQfyPGrzLJSwHUg==
X-CSE-MsgGUID: 93h9j1UiQGCp3s8dVEcvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="199467992"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 20:53:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 20:53:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 20:53:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 20:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQv42+2I5dV62t9c2+N5LC6wxbwtXFlGz7YGLoTjJKw16zpUI6prSO0uG3pW4zTDuK/ZcDAg4UDcqeDZNJkk0nJdplnppWN1NN016xaAhtP1MF2j26D2mcFQiZ6cS/UTm2CgK1eX/bfyow7sinvgK8XLX6C9xjlFNZSlKbgmJSBsLy99BXQh8u0l5682pV1ltT6hI5WeQFTDot/VwfNkNLgruJmwuqDjCdIIvmBmIr0Hbsmwk538TNGCmJlM3A6UqkYguRmU/+L97pPrQHoTShg4KxGM4mUsHgeEDAFTvhiqYMJeF/7XysJeGCKhqsf6b4QlPqDSgH5dGKORp8SZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouSc7Pk+LtYJegzW8yUtNAIsNLOqrbAOGMUkwY7oJs8=;
 b=mpt/dfLKE+u2GousRfiI9sBD3ULzOk8ez5j58Uo5dahGx8znr1MgD9TF0SSa8bKJ2uOPFdXDgxqrWjA0z+OMQL01Spt0pFfNg8d82siBICXX6oQ81wnXo0/Ko8VWdbC2ZMFMXxyhHwmYSVZm/ht8KO1BUQeK7dgCK5k290DLAgCnIkJ4BKBUse4mlH0g2zqxOkJmNDZOtxX0tbZFxYAZZcnk2PM7gyu+Grfov+pkZ1noPZSprIzUCKEesECOZ/ifNPr52cDOWPbYyDQrSrZM7mbZNzXiRz+aJfeNEpN1ZBkL/BTE9BLc/K/0ln5wiL+kmAFNlAo1y3J32x3THB527g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 03:53:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 03:53:31 +0000
Date: Thu, 21 Aug 2025 20:53:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe_sync: avoid race during ufence signaling
Message-ID: <aKfpuKEME4O5Wzoo@lstrano-desk.jf.intel.com>
References: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
 <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
 <aKUYOzi09QwH/bgt@lstrano-desk.jf.intel.com>
 <aKUZZGMS4WRd4Byc@lstrano-desk.jf.intel.com>
 <kkhmpcfyzsxcqdrnfldosnuwyg6lfkbyikdyurvxd2kgjssoq7@o555bvkytas7>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kkhmpcfyzsxcqdrnfldosnuwyg6lfkbyikdyurvxd2kgjssoq7@o555bvkytas7>
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: a954a43c-f34d-4293-ae9d-08dde12f75a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDRYUEpkNDZTQ2xBei9sWWt1VERYM3JDLzJCMUdheVF5V1J3Kzh6NVg5VHB6?=
 =?utf-8?B?d2NSeVVHVzZ2b3psMDMwV1NmU0JudlhiQUlPYUtSY1BONXQ2U3F1djNqTjdO?=
 =?utf-8?B?RzNEL0pRZXRBeWpreGFlbUdmeHNBODJWT1c4QndrbWpNeTBNSFR3Q3VwbVZU?=
 =?utf-8?B?dkpkVUVHOFhqSWVKWGYvRjJWdDU1RWJnaThUd2FIT1ZzQjQ2aXdTTFpJcXR5?=
 =?utf-8?B?MXhSUjNaM1hiU0dYNTA4V1F4R0U1Ui9FYVVTdzNrWWg1MFdFa1VZbk5rNUp3?=
 =?utf-8?B?N3ArRXRXUGtndmdsOENCR013WWhtTUhnK3hVVDkzQkw0dXBaYXlyRjBZZktB?=
 =?utf-8?B?MjRUcXRBUGJ0RW5SbUw3YnFzd3JWMk9LZ2lONDJFSUxJR0lBWkNtaUlWUTdP?=
 =?utf-8?B?L3lDNFlGNzg0ZjBmRWlGemNHMjlZMEpRQnVaQW5UTjBNdHE4cTNyaXJwKzEy?=
 =?utf-8?B?WjhNbzR0WlFXNTVXeEZwSUQvMXM0N20yeDVITWJiU3pNU1pRU1p6Z2tyN29R?=
 =?utf-8?B?aDRldE5qNHA4U0J2S2pES0svYWtaQ0xWU2wybjhUMmxuLzBtQjdJN0FMa1dp?=
 =?utf-8?B?UW12LytVWTRBZS85bjBWVFowRmZYL0hUR2I5RGxLa0t6RXdtRmg2N0kyY0xn?=
 =?utf-8?B?aFFzSCszWDFRUUkxazRLSEtsc3crb2huM2tnNDRtUVRZUk5iQVZtTjQyRlZN?=
 =?utf-8?B?RzhCSTJ0bzF5dS93dS9ZL2VvT0VmT2JSZXB4MnFQZEl1ZHNHZWdpME5SUnBS?=
 =?utf-8?B?MnB1TmdSUEkxT3JWVVZubmF0cGF6Y0REYVlhMWdnWlJ5Z05Ma0k2RGpLbHMz?=
 =?utf-8?B?NU5hTHd3anNXaUhFYVZJSGtjZjQ1akplbjNuaG5DK3hDVmxZNkVHcWNsUHNs?=
 =?utf-8?B?c2FtcmpkckZpNVhKSFgxd3dBN1FiTjRFQjFISzB3TVhhbVJDRTJCNDJjMTFB?=
 =?utf-8?B?U3hyeWFVV3Uvb24rUmRwaTBndm0xY2R0K1RNcUZYVlRXeGE0Ui9aK2Y2WVNt?=
 =?utf-8?B?Z2dyMG9ocm5JQXN1RFd2aXNYcTdpMjk1UWlVUEFaaTBSVG01Y0M1bys4cFJS?=
 =?utf-8?B?MjJNMGFxVGdFZkhBOGR1dFdKbDBwbXBZeEk4WE5tWHgyQUxPZHRhQWlJbGxE?=
 =?utf-8?B?ZHdITFhGbm5aK29Qd2g4dzl0azNpVUZUeXBHeVZDb3gxSTRYS0Q3UXdTZ1Qw?=
 =?utf-8?B?ZHFiVVIyZm5BWDZBeEE2RlMrcXc5NXV2VXlxMVNRem52NHljUGNsTUJiNDB1?=
 =?utf-8?B?dnFRb3I0MXI5S0JsQVN2U3BtNnlXZUVCZi9nUUhQOHlweXRZMllXTUpGZHdz?=
 =?utf-8?B?SHV1VVlvRTR6SjNjVUEwT0I2V3F0NG1YU2loZi83SXd5ZTdZVENRMjExd2J6?=
 =?utf-8?B?ajZHc3dBY1pqSzZsZ01zZCt4R2dVWXhRZHQrZ3J5bmxIdXcva2FtZ1h2OEJE?=
 =?utf-8?B?YW1seG9yYW9DNmRnN0Q0WnlKdFBYUm8vS0VpMzd3aXJtdVlhYUNKK0IzZUVG?=
 =?utf-8?B?eExXUnlPM1VpaUVGWU1hYmREVkhXTnVSMnovRXBVbHUyVFA2c3R5UHVkVVNS?=
 =?utf-8?B?SzRjWlNpdkdxdjJ2WWo2cVpmd1I3T0dwMjB4VXhhVEdiUkhrbXFnMmVtSEwv?=
 =?utf-8?B?L285M1JlZldoS1FsV2R0Ymx6VHFBc0hyUW14SWpxT09DRVR5enVWc0FhMGVK?=
 =?utf-8?B?VDVCdWdhNlptc1F4WGxrZWlkM3N3RmRFVS9uMHVVRDNEaW12b1A5WGRWeWcz?=
 =?utf-8?B?VkFDa3hmN1ZxN3hrdDNKT3h4YTJCM1h4VEM3eklEMEk3b0FmRC9KODJxOEhZ?=
 =?utf-8?Q?25lK7zBc19DfA49lCB9louj0O7EwCKEucHPGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNucVBzTThIeXhJNldoVEo5dWVraGU3bHE0WS9BSlBSN1hxNTRBa01xNVEz?=
 =?utf-8?B?SUlRMUJzT2pPejhXMzU4VnBGNkd1S3lwdG1LaVdCcmYxSUE4ZmZYTHc5YXIx?=
 =?utf-8?B?bG9tQUZFM1JCNitwYmxyRXBhM2ZDQngxRW15T255NUxsUTJuNFlTcVRQcS9a?=
 =?utf-8?B?MkozMDRzcVdqUkJMVVJTWkhuV1lDRUJkNWJEVlJhVTRQMkE1SVZrOTZ0RGZL?=
 =?utf-8?B?SXVCV1FZWlR6NDVVTXNmYkExSDFrWmpWcG9XY09GdXg0VnFQYkxzMXhhU1lE?=
 =?utf-8?B?UHFtM25CSFZINHNWV0pNMzhNTVU3WGFmcWw0VUhHeHc4akZXOUJDSC9VajBl?=
 =?utf-8?B?a1BQbHp2V0NUNi83cUpCYURJTS9IR2VCQXJCbzdHWEtqVjBhREZSZlFmanZ5?=
 =?utf-8?B?YjNSNHIyaFYrUHpNMU1YTktoT2xRYUNHRlVDUks1OXVvYy9DSFdkdWkzSENu?=
 =?utf-8?B?S2NydzdaU0dZMElvcEZiNlNpdEhQOHNYak9RZW1JZ2pOR3JSeUxOTVB3dFk1?=
 =?utf-8?B?RXF5b2FZMmJIRnBEMlpTcEQ2YUpQRzd6SjFQbWM2UGRqaEcxWEJQMVArVVY0?=
 =?utf-8?B?WWFGdVhoTVBGZy9DOTRuZHp2K3JPWW9LZlZOWmxsaTdDYlE0bzZqK0x0b0RO?=
 =?utf-8?B?dG1UcjRDVk5jb0hZM3dla1p6dFFMYXV5bmJUVWZ3WHNSN002cStwNkh4RmJW?=
 =?utf-8?B?VHdPaGltKzFqaGxHem9Jdi84RjFrdktXMUM3cFMra3JKQU4xVGFyU2NUaEFw?=
 =?utf-8?B?d0YrbG40L1JrUVJUcHJkNkxONmlPTFJVY3BLZzFjMS9pTjdJTUVsWGtnY21t?=
 =?utf-8?B?RWJLNGFvemFqR0pmZnF2cWwzS2N4THFNc0UvNVJzUE16VGUzc3UzMDA5U2tJ?=
 =?utf-8?B?aHg1THBrTzE1TnNLMUlUWWFqNUp0OVNIWWk0NzZidjF3WkM2MkxnSUJ5blJv?=
 =?utf-8?B?a1d0SEtSNjVtL0xTdE94RUZoL1VnY2F3ejQ3aXNIYTQrVnZNOTBUaDM3YkdH?=
 =?utf-8?B?UDZVbGU5OHVhWXJRNWcvam1HNmlxeXk0VW41S0hjUEtWOVl1WXpHenhUa2ZJ?=
 =?utf-8?B?RlZoSXI0c1RYVkF3dmFOSTFVczZxeVF4NjByeUZRVTBPZWlJSWFxY3EvWmJZ?=
 =?utf-8?B?c0xTdCtmTVRPWDRHV3c0UXhXektqUnhRdjkyZGUzRGwxV3lzTC85c1ZaZGJu?=
 =?utf-8?B?VTRlL3czRy9NWEJUQjVIN0RSSk93NnpnZndpRmtGOXNiaEorc2tMWk9ieWRT?=
 =?utf-8?B?U2xJWmw4NWdyNlEwL3M2VHpzRFdvSkU0a1oxSUw4TXhNdHlpbG43Z3RLZVhN?=
 =?utf-8?B?cHJSc0lDTGdla1R6cmVZUDRQbG9uT01Xa3hmVmZ4S0VtZXlnaG9OQ3RLc04x?=
 =?utf-8?B?eU1nTkZuNVlvQytaUnBPek1SVDh0QXp6amxicTFJQ0lOelIwcU16VG1mZlp3?=
 =?utf-8?B?a3kxcUNPdk9qdC9jdzVzd2l4WkFSUkltVS9zdGExK2xxWVU1YlVLWi9DRkds?=
 =?utf-8?B?ZUJzckwvYzdNVmhkc1h3MEhSNHcwV2g4b3pLUXNiYWN5V2wwa0F0aXBicXpB?=
 =?utf-8?B?YlFRMkwxUlR1QVhIUm1LME9ZZ3liVzBTUU9VM09SenlJNkV5cXpXR1hUdXRS?=
 =?utf-8?B?UUF5UjRxRmpIT3dHNnVvcGFMN1V4dHdna0UxWFZmVXNEZXZ6L3lCbHFIenlL?=
 =?utf-8?B?N25iUXNQMDVDQkF5eGV5c0dUaEJjaVRiVkxjWDlYNlVPdDRmUUxqVURoeFlW?=
 =?utf-8?B?bnNUR2sxM2pBQ1phV2tJN3JPdDdEMUhOZWZVeC90ekFPcTVaQU5XdHpDWFJy?=
 =?utf-8?B?aTZxc0o3VXVRL0R6bXh6dmpRbTlUTXUvbjdXaFpEV0Y1TlpxRFgvdkJMOGE4?=
 =?utf-8?B?RDY1QllBck15bk9adTB6bTBCcXFsSmFuM3FGL0NCaWIyaktNTmQwcTFpWHVG?=
 =?utf-8?B?YnMzSzBUU0ZFR3d5K1A0YTRhamtMY0VlRTM5MStUay9ZMmQrdjdHdEZ6NnJx?=
 =?utf-8?B?L1lIelhsWFVHaE5oM3hlV05JREFGWjJlcWh6bGRHRW1zRWFDY2lUZXMvME1R?=
 =?utf-8?B?VmtTRDJKanZKV09KRVpoSTNWQkp3N0hldVRiQ01Lc2lKOThXNXJpU0NNTXVH?=
 =?utf-8?B?dTVWSTlremhkdzE0TTZETWR0S1M5MmJiaGJPN3pwc253eEdTWmdqUUxwSnI3?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a954a43c-f34d-4293-ae9d-08dde12f75a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:53:31.2379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRuWzXdhhJwUUt+ENiVaKwzEHm4eWKSiCY7a72GySIZAmvQaSDII6EU5344YKr/3jyV0cuXaJ9jgJ5aZbx4Zug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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

On Wed, Aug 20, 2025 at 10:38:14AM +0200, Zbigniew Kempczyński wrote:
> On Tue, Aug 19, 2025 at 05:40:04PM -0700, Matthew Brost wrote:
> > On Tue, Aug 19, 2025 at 05:35:07PM -0700, Matthew Brost wrote:
> > > On Tue, Aug 19, 2025 at 08:44:04PM +0200, Zbigniew Kempczyński wrote:
> > > > During vm-bind ioctl ops execute fence may be signaled during the call.
> > > > If vm-bind syncs to user-fence it creates a race because signaling
> > > > happens in the worker. This means control may return from vm-bind
> > > > ioctl and consecutive vm-bind operation to same vma (unmap) may happen
> > > > on still not signaled user-fence. This finally ends with -EBUSY error
> > > > because even if vma operations completed fence still exists but
> > > > userspace was unblocked with copy_to_user() call.
> > > > 
> > > > Instead of releasing user-fences in workqueue for already signaled
> > > > ops put them synchronously in the same vm-bind ioctl call.
> > > > 
> > > 
> > > I'm not really following this explaination. I think the actual problem
> > > is in user_fence_worker() the copy to user to done before
> > > WRITE_ONCE(ufence->signalled, 1). If there were re-ordered, I think
> > > that would fix this problem.
> > > 
> > 
> > Also, as a follow-on optimization, you could keep it as you have here,
> > but this patch has the same ordering issue. That should be fixed for
> > consistency, even though it would still be functional because vm->lock
> > protects against the misordering.
> 
> Unfortunately I can't use this, lockdep complained I've violated locking
> rules. To properly handle this I likely could collect all user-fences to

Ah, yes I think copy_to_user can take the mmap lock which is not allowed
under dma-resv. 

> signal outside of drm_exec loop in vm_bind_ioctl_ops_execute(). But I
> don't know should I complicate the code for this particular case.
>

I think this is possible - xe_sync_entry_signal doesn't need to be
called under the dma-resv lock so we could do this later in sw pipeline.
Might be worth while in an effort to signal user fences immediately when
possible. We can look at this in a follow up.

Matt

> Thanks for the review, I've sent simple reorder patch which should fix
> the 5536 issue.
> 
> --
> Zbigniew
> 
> > 
> > Matt
> > 
> > > Matt
> > > 
> > > > Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
> > > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > > > index f87276df18f2..8becc3755649 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > > @@ -103,6 +103,15 @@ static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> > > >  	dma_fence_put(fence);
> > > >  }
> > > >  
> > > > +static void kick_ufence_sync(struct xe_user_fence *ufence, struct dma_fence *fence)
> > > > +{
> > > > +	if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> > > > +		XE_WARN_ON("Copy to user failed");
> > > > +	WRITE_ONCE(ufence->signalled, 1);
> > > > +	user_fence_put(ufence);
> > > > +	dma_fence_put(fence);
> > > > +}
> > > > +
> > > >  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > > >  {
> > > >  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
> > > > @@ -244,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> > > >  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
> > > >  					     user_fence_cb);
> > > >  		if (err == -ENOENT) {
> > > > -			kick_ufence(sync->ufence, fence);
> > > > +			kick_ufence_sync(sync->ufence, fence);
> > > >  		} else if (err) {
> > > >  			XE_WARN_ON("failed to add user fence");
> > > >  			user_fence_put(sync->ufence);
> > > > -- 
> > > > 2.43.0
> > > > 
