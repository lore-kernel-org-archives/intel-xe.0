Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ACCD711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4157310EC09;
	Thu, 18 Dec 2025 23:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJX57adc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A5410EC09
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766101003; x=1797637003;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PkosslnygfDSCwI/78iM4/6qwY++1iXanrHXc/FJwVc=;
 b=NJX57adcSKhKgCuwO0y+qOXfMRaUfc5lSKFoV7Z3u2JaX3n6HpepiBup
 v4m0Pqf0tPn2TU2CEAc2DY1fw7w6OuVO3ldWgAKVNlRdeGfm9PzeNOeXW
 KNZZOisNW/q139hVoqt+RO46FCRrHLhrszZ0dmKlnfITUmQHtYMLFnbe2
 DUj8W7clveogQXP7wNKGbR7HrFh5aw00Z2c3OlJ20RVcA3ELo7KHnyqwh
 Qba75Z8bqBmISpXUKlvQHZUbx2E2CfbQJE5jKJG3k7iVzdMLQkeFfjHTq
 4/w8d2vvwfeA5qpkbNa8UF46WGbeJKCudOjMkRqPnpDc1ePirMknKXiZD Q==;
X-CSE-ConnectionGUID: Tgtvx7thS0SmGBCBpXNmfQ==
X-CSE-MsgGUID: +bHuoyJfQ7umvXXeLTz/QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71695917"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71695917"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:36:42 -0800
X-CSE-ConnectionGUID: MNSz8QzrRXCkq9ClDjMcAw==
X-CSE-MsgGUID: o58zankjRFWKveTzpXrEsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222128640"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:36:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:36:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 15:36:41 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOqSNvOViZqx3ZzqkeyH7A7/sc6BXvEyK4zMDP+d40or49iNgnc0D0x50jc5gtEPtMbWuZji+RNcw9cB3woqgqO59RqOrTIjKKX6ByVDQi5lBDOt7hkcve6hWwPeHi/qZkpVApf05kACQRanz82K5GqQJb0qmG/OPP1LRiVtgqR6GC4HN75mfsDkCnxBiynXTOyt6MCkT98qSQ1t9scTGcJ6Mf0fwsTJL9LadDSwqKynKTCCKkwNRWtUbuGdofLcQ4IjWxi2ni3CCLp25lNZzsMSmqXXJIv+hOsHljHlF03i4Y1y+Qc0NNWgKXGFOaw136vIWzKJeGnWXHJ3O8CACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkosslnygfDSCwI/78iM4/6qwY++1iXanrHXc/FJwVc=;
 b=cBd0MWeTSZXpmq2zCycn8o9sDWsRCg4zsyd2Sj4WkYCpO+HaMwcf2Y8tzE0NKnnPS3ApE/RcZ0VK+lgucduOp01rHeGM+632nq1J5Lvmo2BqWvvFZATOzeYPcGaa/CZwWoai+dGr/lIwLXvEqEPNb1HO7/3snXm7c3RCc46IEFcTfeWlbiPIid2xQz+WIbn5RxB+rtYDAJP6TABgmaFYLIZMIOdZftpW2RU7v71ZgTkNOazp8hmw9p4Qa4r3FYl4Y0AZIMnoyMbdTwqfWEZQoJ5qn9yqtho5BhokzMnyKdgZWMLKVBliVhjBzQvOudLnhXP7QD5uevDHgaquoLXq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 23:36:39 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:36:32 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Thread-Topic: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
Thread-Index: AQHccGeKLoiu1JjL9UG859W3UWdlI7UoDXYA
Date: Thu, 18 Dec 2025 23:36:32 +0000
Message-ID: <b7fef20f35249525239dd287b391045f80d046f6.camel@intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
In-Reply-To: <20251218214418.4037401-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN0PR11MB6303:EE_
x-ms-office365-filtering-correlation-id: 5f7606cc-3f61-4150-bf30-08de3e8e46d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bGhkMUsvWnprNGlJOVdXc0tLbUt6YW5SQ3N5Q2xuMlJydDhNOUdleWhIbW8w?=
 =?utf-8?B?RSsxejdkR0FzbStCMndGdUxpcG5vMll2MUZtblU5OWVWamJkR21GK0ZXaVJD?=
 =?utf-8?B?T0lCamZ5a0tuRE1MS3VoMG1zL0Rtc0E2ZW9ZL1pWVkxqK2k3bnFKdWVSeUx5?=
 =?utf-8?B?bnJwOWF4dnBJemNSbXNiZDU4ZkRRT3ZkdXhyWHBSdGRlb0xlbDY2SFhZbk1p?=
 =?utf-8?B?cEdLUUwyQVVEWEUvSGx2K0g2b0l0L2ZneVhUMzUzNEpkdzJOT1ZRN01IN1NV?=
 =?utf-8?B?WjdVUVBJUmlRUjdiMG0vdG0yTWpETmRVdjhSN1N5ZVMxN3FPemtjY0htRlRK?=
 =?utf-8?B?a3p1d0dvM0hYWVFJb04rUjc3RHVPaTRtNTFqc1hpeU9MZC9UeWdhOTdndFRo?=
 =?utf-8?B?Zzh1UUxya0tGNnZSWGc5ZElMOGRTUzhuT2UwVVJrbzVuVmRpMGF1K0FtL2Zx?=
 =?utf-8?B?UEN2cGJlSVFaY1I5Qms2UzJwdFlnZXZKVElic0ZLTy82c0s0WlVHRG1HaHpY?=
 =?utf-8?B?YU9hRUNydVJDbVNWRUQ1UytNZGFMNTVrbFpqbFZXWjlQU29wVWlRMm9DcWRU?=
 =?utf-8?B?R2lZejFGQ2QveG1UQy9mK1k4Vnk5azJOQm1ZN0FlR2xxNXM4VVYvRDNzQlcy?=
 =?utf-8?B?WDZ2WFdSVFJhM2dHZWFSRHkwSDVFUm9GNi81dGliWHlXVHNmdUFWVzBwOGJM?=
 =?utf-8?B?M2hiL0oreUd5VEtFb0ZmTGNXV3Uxb3hyOGRBTkMwK2FYT29yWHVtTmxtb1I5?=
 =?utf-8?B?SnpFQWlKa1IwTWgxZnpCZFY0WllkNFFrOEpaWFBkUjlrMnNpQ2sxc0FUQlN3?=
 =?utf-8?B?Tmw2Z1dXQk0yazZvVGphcHhDRFFQbGFXQ1F0a0ZLNlVCcVNFZllwTFlSb0Jk?=
 =?utf-8?B?TDJJSGhSY25EOExyZEpQS2hLd1Q3eU1oOTQ3bFF2bTdzY0llVVdPWFFSZko5?=
 =?utf-8?B?N0Q5TUtFMllhaE5uNDJrbHYrZHNJTTVhQytFTldobzNGa3ppL05WVi9aalov?=
 =?utf-8?B?ZHRwV3Npbk9yLzIyQ3dyTE8vTEFJdEx3VVBTVjBKY1FyYkxIUm1MOVpxNTNw?=
 =?utf-8?B?M01KWWFWOHVPSU5IZzhERmRXZUxwSVgyQzV5UWpRQU1sWms4N3pNYnhZNjkx?=
 =?utf-8?B?bFkyY2xlMUtmRGdPOERwdG12RHlocENUQytBUHhEbXJzdWdmd2dpM1RDUExI?=
 =?utf-8?B?NFo5dnZCalNiYXBFdXVHWUxTQytSb1dUV2RCOHRWclhoVnBHcC9FekVRSDJN?=
 =?utf-8?B?bDZCQUxRYVB2TXFrWGhBcmhDOVNaZzltbzNabkdoWFRiUmJ6b2EwelNWbitZ?=
 =?utf-8?B?ZGJuUzh1T29lUzJEQkhnVjY1VG5vVDN1bHFha2tGT2xnR2hsUjBhdHdUWWpZ?=
 =?utf-8?B?N280SUVxaFd0SUIxaDlxZjVHVFRVa3F3Y2JxeG5LOVJiYm91bTNJMzlmVU5m?=
 =?utf-8?B?alVnRGxXcm8wMEI3UDI0ejJTWnhWdG9kUGs5OStkM3VUYmxIYnF2VzVHVnhR?=
 =?utf-8?B?Q1NxRDFYRUYvczA4VjkvdEJ1NUgxaHY3NENLVGxqY3pFZzMvSVpVY1hieXF4?=
 =?utf-8?B?QjFXOVh4K0VacC9QM1A4ZE5aZlluUCtDWkFiTHhuWlJhMXBHS01Sb0UyZnpy?=
 =?utf-8?B?S2gyWGxwQmRRemUvOWlrcW0yU0srMlpTRnB0SEt1RUpreTlrK2daS0lMKytV?=
 =?utf-8?B?cmhVTEJYQW5rMXdwTG53RlRmRGQ2bHBIdlVTVzVyS3E1ZlFXSmpIT3lsR2l2?=
 =?utf-8?B?TUVFY0J2Wk9kY0lXWEZkUHVYWTQ4SDEwUUdGdzN5MTRsQ0g1ZUh3SHQzY05p?=
 =?utf-8?B?VTV6U2tGcFUwV0JLVHpXUk9SSUdxSlI4dDRkaG5VdTU4WlhWMk4yellsWjRz?=
 =?utf-8?B?QTFnVWtRdVM5K1ppNmNUNGg0akNNQzNmWHlkejI4UTQyQ3lBRlhDeG5mTkpr?=
 =?utf-8?B?dm1nd01iM0R4ZzFNcU82dzVqNkpvT21LcjkxbWNieVE5bWJWTmhGN25kOWV0?=
 =?utf-8?B?MEpCMFh6QTEycmIxQ0ZIeUZGN0dTeklFLzlVeGdZOGJzQ1pDTGw0dGJtbk9m?=
 =?utf-8?Q?fjceeH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmUrNE1UdWpSQThKTE1vMGtpRkFXbFlhSGdueHBOdDcwV0grdk00Z2hna1BP?=
 =?utf-8?B?a0xmeWZEUFhmWFhEYWc2bWhIY1VGYzRyTmhwVm1HZ3Yzby9lazRSNEJQUjF1?=
 =?utf-8?B?SGpSaXJZbnB2N21Vd3ZNNVlrSE9LbmFmd0NoNWs4QURGeTJhSVl0TGlPRnZU?=
 =?utf-8?B?RXBmdi9sTTJQMGZxUjFHQmdhd3VNR2FidEVNYUZQMFpQWlAva0hGTlEvdmlO?=
 =?utf-8?B?VVRranl5MjgwQkJRRDg4bk5hd1Q5MFdpV3lsQUsyOEhuYVVGa2ZJTHBJclp4?=
 =?utf-8?B?Y1djTnl0TGV5MXBVWSs2czMwdkJnak5SYXNYSE9BUHkyM0tUR3ltQ2xKSlZw?=
 =?utf-8?B?ZmpsaElJNHpzMk5RUE5EYzN4TitPQjJoRDVtWGozZ3VEUXhrTU41Z0FjMndR?=
 =?utf-8?B?dkNNdlM3QTBKTW0xbDN6Vm1saC9zUVdJMzh5SmlvSkluMHVKS0c4d21HSGEr?=
 =?utf-8?B?azk1QUZTYWp3amtjTWpvYjFpM3hqeVFnVHp1RXhBUk9OU3BvUDAwUEZjaHB0?=
 =?utf-8?B?RzBUMTBVSVIveUJ1MC9nb0NNS1BQeTV6dURqbkRGdzdFT2cyOEkxcHpoUWpF?=
 =?utf-8?B?NDErb0Q1SlJ5U3kxRnpBZ21qMEU5ejZPaldoeHEzZUpWMjI0b1JJaUwvTG5R?=
 =?utf-8?B?VXBjcCs1THlBZWVMd2JTTFFsUmI0OXhOUHJTNFcrWUpFR1l5ZkxkTjhvRkx5?=
 =?utf-8?B?THRUdFo4dXN4RXh4K2s5KzNEWTZpcldUcnJJRGgrTDJMV3VwOTFKY01pak5l?=
 =?utf-8?B?cFBYaFo3NUZjUGk1WnpMR2hDR2htVVFxS2NualRFY0hEVWFqeHQrVnEzK3Q3?=
 =?utf-8?B?Vjc1cmdIWVAvdlY0OFRkc2FnQ2RtVHpmMEFVenM5QTN6UndkRTFNTWxkelNM?=
 =?utf-8?B?bjZXMGY0dWJMYU94RW1zM2p1MmZPbFJGTERKcHpsSE1ERnNYRjVPNGNEQUtI?=
 =?utf-8?B?K0o5RkhUUFYzazVrQ2dPMnpQdUtHaTNUbngzUmVESjVCaEMySXE4eEZhTWVY?=
 =?utf-8?B?dFVKRXQySy9QVCtGQS90OTBJSGNxa1FtOWE0a0d0Qy8xa1BLR2dEUDMrQ1Bj?=
 =?utf-8?B?V2VsN2hWbXQxZXdQVFVJcUc4ZEVwd3lubURrSWNiT21YeFllaTBUbHpneEJk?=
 =?utf-8?B?djVnQWllS3VTZ2ZZS3ZBTjY1anNXMFowdkoyeGJGZVNPT3BkcThOWlZSN2sz?=
 =?utf-8?B?dGNGODNSOENGemtiWnNRV0pTMVJVVkI0UVFCdDNLWERjbmYveFNpN2ppa2xO?=
 =?utf-8?B?a1ZUZEk5OXdXZDA3ZFJKQlBQZkNPOFkrY0EwbmpxTzYyMFhkc3JyVEhnSVly?=
 =?utf-8?B?TEhCWVlJcU5lWldUcnJqcW1iNG1VS2xsNkk4alR4K3BCd3RlZ01DUlVKK3li?=
 =?utf-8?B?Z29QbkFvWTR0cjE0ZFZENUptczhLRkkySlh6N3o3S3VQeE1FdDdFS3pCRVhI?=
 =?utf-8?B?RGMvS1k5TjZFaThlUTZiNDJ6cjVyZk9RWWpVYk12UEIrcE9WcHZjT3dUdmph?=
 =?utf-8?B?c1NDaFpHdDc2ZHpMd1BEYitUU1YrclJ5SWwzQmNuSVc0UHlzZkR0UzBRQjds?=
 =?utf-8?B?cG53cXIrWUIvTSt1ZHBGSjJUdTI2L3ZtbHpGUVJWMVo3QzkyT0VERVRjRldZ?=
 =?utf-8?B?STBJTXNCbmlXKyszaHp1VnZTUWk3cVpia2ozdmQ2NFZmekwzNkNDTmxpTUFv?=
 =?utf-8?B?bEc4NmpnWUFKMTlZYlBzYnZsRmRKUlVpeFRyQ2NyL082N2hIQXdhbXdhem1n?=
 =?utf-8?B?WDAxajQvWW1qOHJ0cjZsYjg3bWM1SFY1NU1FbTlMcVoyZjdNOUtmaE12WExT?=
 =?utf-8?B?Rjg0TTltSDJTcWt5SHFGWmxsdW1OZXRuRWNBdmNQQmtNODdWVkVENUtXMm1W?=
 =?utf-8?B?cEE3RXc1c0w5UWZVTGcwU3I5S2o5bzQxQW10ZXZtaGVBYUYxbjBEUVpETGZK?=
 =?utf-8?B?NXdlcTdZbm5XSFlJejA2eXU5RzgyRndkRUxyZ0lKdnl0bEY5cTk1OFVkdGl2?=
 =?utf-8?B?TEdscGJMazJmVjN1WElCWThURkw4ZnFINE1iQ1lTRDl0L3lnbVBEOEdkOEZ6?=
 =?utf-8?B?ajFoZWRJVVpYdXBYV2VhV09FdmllemRTZzI0V0FSelhZZjB0ck5DbEpQTFJx?=
 =?utf-8?B?a3g3TGJwc0ZJM04zN1JUMjhnRXJiWWRjOFdHc0Erckt6bElOazZnSzVPWE4r?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC9D075419D0CE418E17AF7355AA9311@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7606cc-3f61-4150-bf30-08de3e8e46d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 23:36:32.6732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYWtXE7nqg/wd2JA5C+9CtjzycXjmuxbUYe1qzjgRufHgXkO9Q4nhJaC71vZiiYz6t3LhXIbFRYisLYxR4g1nkBJPO8tPDvr3/vul4EWwD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDEzOjQ0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBJbiBHdUMgc3VibWl0IGZpbmksIGZvcmNlZnVsbHkgdGVhciBkb3duIGFueSBleGVjIHF1ZXVl
cyBieSBkaXNhYmxpbmcNCj4gQ1RzLCBzdG9wcGluZyB0aGUgc2NoZWR1bGVyICh3aGljaCBjbGVh
bnMgdXAgbG9zdCBHMkgpLCBraWxsaW5nIGFsbA0KPiByZW1haW5pbmcgcXVldWVzLCBhbmQgcmVz
dW1pbmcgc2NoZWR1bGluZyB0byBhbGxvdyBhbnkgcmVtYWluaW5nDQo+IGNsZWFudXANCj4gYWN0
aW9ucyB0byBjb21wbGV0ZSBhbmQgc2lnbmFsIGFueSByZW1haW5pbmcgZmVuY2VzLg0KPiANCj4g
djI6DQo+IMKgLSBGaXggVkYgZmFpbHVyZSAoQ0kpDQo+IA0KPiBGaXhlczogZGQwOGViZjZjMzUy
ICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZlciBmb3IgSW50ZWwNCj4gR1BVcyIp
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4g
RG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IA0KPiAtLS0NCj4gDQo+IFRoaXMgZml4
IHdpbGwgbm90IGFwcGx5IG91dHJpZ2h0IHRvIGFueSBzdGFibGUga2VybmVsIGFzIGl0IGRlcGVu
ZWRzDQo+IG9uDQo+IGZ1bmN0aW9ucyB3aGljaCBoYXZlIGFkZGVkIGluIHRoZSBLTUQgc2luY2Ug
dGhlIG9yaWdpbmFsIGNvbW1pdC4NCj4gTGlrZWx5DQo+IHdpbGwgaGF2ZSB0byBtYW51YWxseSBz
ZW5kIG91dCBwYXRjaGVzIHRvIHN0YWJsZSBmb3Iga2VybmVsIHdoaWNoDQo+IHdlJ2QNCj4gbGlr
ZSB0byBmaXguDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMg
fCAyNyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYw0KPiBpbmRleCAwNzFjYmZlYzI0MDEuLjU4ZWM5NDQzOWRmMSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0yODksNiArMjg5LDggQEAgc3RhdGlj
IGJvb2wNCj4gZXhlY19xdWV1ZV9raWxsZWRfb3JfYmFubmVkX29yX3dlZGdlZChzdHJ1Y3QgeGVf
ZXhlY19xdWV1ZSAqcSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRVhFQ19R
VUVVRV9TVEFURV9CQU5ORUQpKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgaW50IF9feGVfZ3Vj
X3N1Ym1pdF9yZXNldF9wcmVwYXJlKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ICsNCj4gwqBzdGF0
aWMgdm9pZCBndWNfc3VibWl0X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJn
KQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndWMgKmd1YyA9IGFyZzsNCj4g
QEAgLTI5Niw2ICsyOTgsMTIgQEAgc3RhdGljIHZvaWQgZ3VjX3N1Ym1pdF9maW5pKHN0cnVjdCBk
cm1fZGV2aWNlDQo+ICpkcm0sIHZvaWQgKmFyZykNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4
ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+
IMKgDQo+ICvCoMKgwqDCoMKgwqDCoC8qIEZvcmNlZnVsbHkga2lsbCBhbnkgcmVtYWluaW5nIGV4
ZWMgcXVldWVzICovDQo+ICvCoMKgwqDCoMKgwqDCoHhlX2d1Y19jdF9zdG9wKCZndWMtPmN0KTsN
Cj4gK8KgwqDCoMKgwqDCoMKgX194ZV9ndWNfc3VibWl0X3Jlc2V0X3ByZXBhcmUoZ3VjKTsNCg0K
SW4geGVfZ3VjX2RlY2xhcmVfd2VkZ2VkKCkgd2UgaGF2ZSB0aGUgb3Bwb3NpdGUgc2VxdWVuY2Ug
LQ0KcmVzZXRfcHJlcGFyZSBhbmQgY3Rfc3RvcCBhZnRlci4gQ2FuIHdlIGFkanVzdCB0byB0aGUg
c2FtZSBoZXJlPyBPciBpcw0KdGhlcmUgYSByZWFzb24gdG8gc3dhcCB0aGF0Pw0KDQpUaGFua3Ms
DQpTdHVhcnQNCg0KPiArwqDCoMKgwqDCoMKgwqB4ZV9ndWNfc3VibWl0X3N0b3AoZ3VjKTsNCj4g
K8KgwqDCoMKgwqDCoMKgeGVfZ3VjX3N1Ym1pdF9wYXVzZV9hYm9ydChndWMpOw0KPiArDQo+IMKg
wqDCoMKgwqDCoMKgwqByZXQgPSB3YWl0X2V2ZW50X3RpbWVvdXQoZ3VjLT5zdWJtaXNzaW9uX3N0
YXRlLmZpbmlfd3EsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGFfZW1wdHkoJmd1Yy0NCj4gPnN1Ym1pc3Npb25fc3Rh
dGUuZXhlY19xdWV1ZV9sb29rdXApLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhaICogNSk7DQo+IEBAIC0yNDU5LDE2
ICsyNDY3LDEwIEBAIHN0YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVlX3N0b3Aoc3RydWN0IHhlX2d1
Yw0KPiAqZ3VjLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSkNCj4gwqDCoMKgwqDCoMKgwqDCoH0N
Cj4gwqB9DQo+IMKgDQo+IC1pbnQgeGVfZ3VjX3N1Ym1pdF9yZXNldF9wcmVwYXJlKHN0cnVjdCB4
ZV9ndWMgKmd1YykNCj4gK3N0YXRpYyBpbnQgX194ZV9ndWNfc3VibWl0X3Jlc2V0X3ByZXBhcmUo
c3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+
IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZV9ndF9XQVJOX09OKGd1Y190b19ndChndWMpLCB2
Zl9yZWNvdmVyeShndWMpKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAwOw0KPiAtDQo+IC3CoMKgwqDCoMKgwqDCoGlmICghZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmlu
aXRpYWxpemVkKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+
IC0NCj4gwqDCoMKgwqDCoMKgwqDCoC8qDQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBVc2luZyBhbiBh
dG9taWMgaGVyZSByYXRoZXIgdGhhbiBzdWJtaXNzaW9uX3N0YXRlLmxvY2sgYXMNCj4gdGhpcw0K
PiDCoMKgwqDCoMKgwqDCoMKgICogZnVuY3Rpb24gY2FuIGJlIGNhbGxlZCB3aGlsZSBob2xkaW5n
IHRoZSBDVCBsb2NrIChlbmdpbmUNCj4gcmVzZXQNCj4gQEAgLTI0ODMsNiArMjQ4NSwxNyBAQCBp
bnQgeGVfZ3VjX3N1Ym1pdF9yZXNldF9wcmVwYXJlKHN0cnVjdCB4ZV9ndWMNCj4gKmd1YykNCj4g
wqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+IMKgfQ0KPiDCoA0KPiAraW50IHhlX2d1Y19z
dWJtaXRfcmVzZXRfcHJlcGFyZShzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ICt7DQo+ICvCoMKgwqDC
oMKgwqDCoGlmICh4ZV9ndF9XQVJOX09OKGd1Y190b19ndChndWMpLCB2Zl9yZWNvdmVyeShndWMp
KSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiArDQo+ICvC
oMKgwqDCoMKgwqDCoGlmICghZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmluaXRpYWxpemVkKQ0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIF9feGVfZ3VjX3N1Ym1pdF9yZXNldF9wcmVwYXJlKGd1Yyk7DQo+ICt9DQo+
ICsNCj4gwqB2b2lkIHhlX2d1Y19zdWJtaXRfcmVzZXRfd2FpdChzdHJ1Y3QgeGVfZ3VjICpndWMp
DQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgd2FpdF9ldmVudChndWMtPmN0LndxLCB4ZV9kZXZp
Y2Vfd2VkZ2VkKGd1Y190b194ZShndWMpKSB8fA0KDQo=
