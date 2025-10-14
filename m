Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801C7CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07310E66C;
	Tue, 14 Oct 2025 17:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GytNVFIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619F10E66C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760464290; x=1792000290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zhU+As8MUKlwp8BocUtRzGXvxFY/QRXuKasPaBfFt64=;
 b=GytNVFICPlxgyjT4mQtE1m6TqclkxOVFR4WSNIgWCRFI9IVeETmmjJOu
 xhHAaKyt899Jm3qZ1Tlo15XII769xVkg5t3lVpRiup5UDtWw0GWBOIitX
 bZmNVAQ3ammMb3d/UuwgEXQkc2JfXRGr8b/7rinltMJp4NiKS05t8Ykj1
 cFuStgCnMLrx8iYFanLXUOHZb4TEuTfsyd2sgu9nReyID6culwUpBb6bW
 wl9UWHCHGqltAAbiP7oVYDJVgZSmTKn7tGZj1T1lQGISrhL9uSuJYjTgM
 SZXQKZZOFtvqJi2Uf3CtDxWT9xNdXDniratyah4MESnPoVCmv/uT++HA/ A==;
X-CSE-ConnectionGUID: wLuWRkxPQ6+5vJDxBqNqZw==
X-CSE-MsgGUID: 79V5rZvSRRGEd5/SJNZSvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88095405"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="88095405"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:51:29 -0700
X-CSE-ConnectionGUID: asJ1x+HeTBuMikH4vLPOLg==
X-CSE-MsgGUID: ffGcs5w3S6SDMK7/D9IQug==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:51:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:51:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:51:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uT+zCFt+8VGiBqWvLiYIu83tkpAFbc0X1fFI4utS3gnAkQ+Io+ehgsmh8YWvtVt17XbNNJYlkAuU7PAqT1VgmxbbgI3StI2Ayk1FRXEZT3M1C5/1pmylFinRLocAg0HWJOPjI3LThBuiv7Cv10hXxTkB/GIGsqxo643jtvCof8I3R3mEKD7dRwmZ9r63zmDh9MJnVNZZ+z9hLxYmp5/1u0EYjpy3kyuqbBua1HOc+tRf4qEGdnkSWyXH9ApDDB9JW4ql9d5M1L7KFOVsYE+VFeFzaeZsY8L2sSA1eg1lCtw/y59Lkl+nlrK7GSW7UwY4cw1JimvqTcXz9QtksVM0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Snx3rqUmBMmWZYbhL5/DdCBl89IYxsrFKVAC10rbqU=;
 b=vGxOyRFXd2/+nR38ve8AV3EC+UWwyNql/Kk1H4YD+BpuDE/8/1+7R4kE0M+oM2Z9RWOSY1EIb3xNGbznYfHMBAXLnvElk/aggVJoPTKXHv6UUd05aTjTfBlfAlcTqUGVofbOe2o0pD9dDJYQaJW0QrngvTYsMAupSXGcdgrQx/qI15nCkQtgjuGKL3RMw4wzk69EbS9zoRJuKUQgZJjyMsyizQwWbsPQmzAaoR/r3VwDje+HgK5gNbnjykgUY251lW3DpoiwdcUwTlT44RW3MYQ4G6M2/tyga9ToAy7dEkMP/jFLN40uskXPrwpWblA7JMHzjsXArfYG5UjivXKN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 17:51:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:51:24 +0000
Message-ID: <d8982e34-7f5f-4c82-b7f7-523007378a3c@intel.com>
Date: Tue, 14 Oct 2025 19:51:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/tests: Use any available GT for testing
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-16-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014164758.125598-16-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 6965cf2f-1cc6-4824-a844-08de0b4a4acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVFmdElVdUtWaTdnR2tTK2dlMm1jbldQeXA4bHFZMGZsYmhPQkltblRvMmM4?=
 =?utf-8?B?Q0FCaVNuMFB6YnRKaXgrblNONHdsVmpqY1RyL2JuOTNGWFVHQmZhVjJFVHlD?=
 =?utf-8?B?bmdjUFN2UUk2UDQ2aVB2Rkd3NmVnSUFlcG9QZXFrUTRBYTlGUHVXaUZlOFpx?=
 =?utf-8?B?MDYxUERGazVTVU5ScE5Kc0h4anNGSzJ4M0xqY0wyQXg2b0tielM3dndKNFVk?=
 =?utf-8?B?bmwxZUNDR2VoU1NyV2xDS1hhUGQ5blBiRy9uS0g4QlBLV2p2QkJMM2lyT29X?=
 =?utf-8?B?Uis5TDdzWDhOdWw5WExYUm5lR2V2Rlg5UlFkR0ZxbFhhV1BwVGlzRjhFOGxp?=
 =?utf-8?B?MDFyeXNPZ1JDdjMxcytxcEtWa1V5bHF4RkFqZUp0dHltaHRUZkZ0YlJPL1Uv?=
 =?utf-8?B?dUlsdG55azBoZk92bU1sdWVDeEF6K3JLSW5rYUdBS05zSC9wRWtlQUwzYVNJ?=
 =?utf-8?B?blJpbTFmdnBFU2tvR3BMY1BFTHpYdEJjYVZQQmJRNkdRZCt5R1dySDNpZTFn?=
 =?utf-8?B?OEVJUGl0b0NzMFpRVHVKTGVNd3ZHaXRITHV5b1ZWVWNJemk4V0NMa1lPSjJk?=
 =?utf-8?B?VXFpaDI2V0xCbU1nUm5ZL0RoMERQN0RMSytGVHhJU1Q3QUdVWVFmNmNFWHhy?=
 =?utf-8?B?RUEwcEp2TS9iMmQ2VWtyWlFTZ0dXd3cxTzdNTVdhOVI4L2VVMnpaaXJqWGNH?=
 =?utf-8?B?a1luRFplYTVoeEV4RWd5OEYzcTlUeU01NEJYODVVOEpmYVFKbitia281Z0ZY?=
 =?utf-8?B?ZnFMdHBDUFFVR2dBODgrS0ZuSXhQTXZDYmNGVUFIMGxBM0EyWGppUDhDb1pZ?=
 =?utf-8?B?cTBTcFByVUx1NElZSWR2UzNIdERHQWRWam1DNXFOZnFsOGZUdWlKcE5VcTJW?=
 =?utf-8?B?QUd0d1VZK3crdDVNTzFHS00vM2lFL2p1S3R3ZmxnS0h1NUp4Z25VNFZpU0l6?=
 =?utf-8?B?OTE1RXVnaU8rK0FnM3I1UlE2a2hFODh1YXBCMklpSm55eDFjbkYyWk4xMWhF?=
 =?utf-8?B?UFo2UnNQSmg4ekJjMGI2eFZmdzFlNWhnbVhQemhKMHExRWpsa3pwOHdxejhY?=
 =?utf-8?B?ZHI4ank1KzEwVndCLytlUnRpeU1XSDl6VEw2OURRa0F6cjBPUFdBTS9BR2pL?=
 =?utf-8?B?M2hHeDVOQlI3ZEk5aHVOOGxiMVNzUVZGTVhKMlFOSFVRUktSd1ZHb1AyTVp0?=
 =?utf-8?B?VFJiY1d6V0I1L0gyRFNwVWM5N1A1OFIrbkJPcHp4eDFjWGlQdG05c2lyZm5Y?=
 =?utf-8?B?YnB0cVpyV2R6NlVXK3V6QnlzY1phR1J3bVhjQ3lUL2VDaUFLSUJtcndUaDFm?=
 =?utf-8?B?Y1k3WHc4SFJGcFd6QUxiQVovekRFZERIU3RGMlR4MnpIUTBoOVFEcHc2RTlQ?=
 =?utf-8?B?OW9UQU43OW52dGxWeHQvYWd4R1RwMTZ1TVBHMEZtNStLMzRmK1JvWGFKMTVI?=
 =?utf-8?B?bWpTbVZTTkpNVHR3SzkxSm56aVlLN21uanVrajAvNkNkOVhDV3c0cWc0ak9s?=
 =?utf-8?B?UG52WHR2TnpSRVgzTVIzcjBDczRLL1l4Q3ZnNTNZUThuU2JoTW1yUExiRVNZ?=
 =?utf-8?B?SXVJeXFnMHFVY0xLeVhwSm1FOFVpTkN5U1dzc3k3TFZPWTBjZHNlNnFhL2pG?=
 =?utf-8?B?N25HR3RFSitUZ1pTTFB1SnQ1S0pzZFltdkg0b1BpOWhaQzNtREtKellodmZl?=
 =?utf-8?B?MTE5VUYrdlhTa2d3OFdTMDk3UG5wakhxMjFoaGU2Y2U0K20zK1FNeFZBTmdQ?=
 =?utf-8?B?bGNtUFdpakxJZjJRejdWTGpBT3BiZXc3blRzWFY5T0t1VGZZV3hhRm9rOXVF?=
 =?utf-8?B?T0hhUGhhN2ZaL3pnaE04ZURBRVRVcFY1RnpmeG5hRTM5NDU0emdSUzRBb1dj?=
 =?utf-8?B?ZU1GQ3AzdEVTcE82VGVwWE8rTjRVNnhvUlZSanhqYXAybnd4eUprcEZZV2RZ?=
 =?utf-8?Q?JeLIFXoChfFdw3Zh6Kh5SMNgXUIjVfHW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFqYWVoVm0vWlBISm1KcFJzUlNNYmhWRmEwVWFOd0FrNngwVjdWbzZKalBQ?=
 =?utf-8?B?MmVVdEJsSVd0WFRTVmk0QmdObFNYMHpJMzhPcmFjdGFUYjhPZzJLVnJtK0Vi?=
 =?utf-8?B?YkVRdyt3dzE3MkdNUWQ1UmRlS2JYWDhUQ21TMTZzUnRrYmtRLzVzb2RtcVcv?=
 =?utf-8?B?ZzhyamExZ2lIYkNFM050S3EwTy93TGs4bzRqNXBEQnF1NVp5aHh3SWtRSUUv?=
 =?utf-8?B?MHVKWDJraDYwbzNhQjhGdXZYM1NMcHlXMEZIRHdBZmNMbzdNT3MvNUVJOUR1?=
 =?utf-8?B?dE05TkxTb3h3dk1PdWtDTEN3Y0NLWXZrR0RWYVcwTFp0TkJPS09TdVQxZ05E?=
 =?utf-8?B?Q0FFektvdHlCM1FNbU9ydExTVHFZVXNhYlk1TDBYaFVaNmpsdFFqNHdCbmxj?=
 =?utf-8?B?Nmc2L2xLcWJxelI1eUwrSUVlYzl5c0k5c3o1aEdUMXV3NmY5cDlwWlduYVdM?=
 =?utf-8?B?UGhRMTJBQ2J0Rmw1Q1RKNW5GeTdUdEdPeWUvQTRqR1NCYzBpM0cxTi8zR2dN?=
 =?utf-8?B?aVorVG1xalA3bkpCMGgzVU8zcUMrWmJaUDc0UmRnLzVRZG9mZWUrWDErOVVI?=
 =?utf-8?B?STNJWHpGdFJBekU0TDdHVlEvdlhzVFI3dXF1NDkrdldvLzIrQnU4SnJJNEZT?=
 =?utf-8?B?dXVUbDRBMFRwZmVRbm9YK2hPVjRCRWEwcURQaHpIeWNKQmxRd3NvK1pFSFM5?=
 =?utf-8?B?RHF6RVRXVCtUSkNyNjZRcyt6dTl0TUNhZlNTZ2M2dDJWVE52ZE9oRkxybTFX?=
 =?utf-8?B?ZEp3SlBobXpPV2NGeWlHb0hmSjAwbis2akdvVnY4S2ZDOWxMYXE2aTJlU0ZH?=
 =?utf-8?B?K0krWS9Hc1FQb1FtMDh2dzN0OVpMTE5USFNJb1d5U1FOb245Ry9ZUFNrb3dt?=
 =?utf-8?B?K3MrUWE1U0diOUlZQy9sY0dJTVRvUllKTjRCdmJOUnA4enZVdWFKcUo4bjdW?=
 =?utf-8?B?ZlgvdUxmSDU5M1dydk1mMnd1VkFrOHRXQ3BXSnFWYmZsYm10MEVKbGZ6QzZ6?=
 =?utf-8?B?WVMvSjhoVFp5VStndFhTcG51cUdyVURaM1hjeTduT01IZmkyY1lNWlo5Y3BH?=
 =?utf-8?B?Q0pSRlcycmFTUkpKL1k2QklRQW1WSVVjNTIyY29mYWxQQmgxTlA4V2p5N2Iw?=
 =?utf-8?B?NW9Ga2RSa0tGTVFiREtGdG0wK3JTWTlFUTNVUUs1ZFFENC9Fd1R5WGoyYnNy?=
 =?utf-8?B?djI2cTFLWmU1Q1BiUVhOWW5KeUMwcEVVZWtXd3N6eHBZZUNrWXYvdDl4a0Qw?=
 =?utf-8?B?VGRrOWxicnZCMEhHMlc3bUpnTDNhK0ZPU0w5UEVpemFqS3E1VXU1WEI5cW9x?=
 =?utf-8?B?YXVhb3lzZHFzQ044MWZJRkFVSERPTmRCVE0rRTUxOXBJYWExT0t0eTR3ck5n?=
 =?utf-8?B?MVE1MkMxLzJGMjhPcVlnU0RaVjlNaEtuV3pRNWVYWTRmQnd6aWxUTDVmYUM5?=
 =?utf-8?B?NjJDWm1lc1BPN3UxQ1l5R2hDcG92T1Q2QVlSa05NcnVtVjM1Y1N0aUNOZCs4?=
 =?utf-8?B?c2xBV3Nldm9mOFZqdUNUL0pPa2tHOEl3VG9lTmhOZUJuZnp2SWtjQVNJdzRs?=
 =?utf-8?B?YVNTK01HSXQ2SmdTOVNKUVE1UWRLenpUei9GekZRWVJtRTVhRi9nVytMdEpM?=
 =?utf-8?B?SzdaajkzWSsyN1gyL2J2cFdNMEs5YnBja1AyQWZqcnpucE5lWU83RlhQR0k4?=
 =?utf-8?B?bXVTUG5QTDVSU2t2bDhRVXJQaVI3QkNJVndtU1FWN3dPL2pOMkhFOUFUR09M?=
 =?utf-8?B?SXNsTmp0TUFEc216SDJMWGNZYS9XTE9uL0tCMmhOcGNzS2xmb1Nwc2FCWm1R?=
 =?utf-8?B?ZG9WcHh1VXZDNkV0bFczOXp0NXEzQXdzclJrdUY5RXhBV0FtTW0yYXRUaEhO?=
 =?utf-8?B?Vyt4VXNGdzBRZFhmZjEvOWtsaGcxejlYb3pFenpvbmlpSm5od3ZSM253QlFE?=
 =?utf-8?B?STYrU1lPOFhhcmhSMVNPWFRCWmQ1N1NhTUJqWmNTS0tsd2I4WWNLMVRyZVdt?=
 =?utf-8?B?SHBsL0ExbW91STFIL1dyOFY1c0NMOHl6a1BqblY5b1krTmhrb2YzemkzaFRX?=
 =?utf-8?B?MjZKMWJUVm1acUhBVFFJRkJXU2pOUTAvQ2l2ZnJTQ2wxY0NZRUJybE1LcW9D?=
 =?utf-8?B?anlJWjJ5d3JjSWt2SUdNYkd0QU9NVndxeUcybUoxYXFGakdmeHNxcDlCMm5h?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6965cf2f-1cc6-4824-a844-08de0b4a4acb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:51:24.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3yeSQ5sW4xNq2afEc3LT6KaBQOuYTn48l0qmY+mUQIycYMth9WbNSj3y2Mzp5jNjDrwU6bF7EqBAXWtWnOIrLhxjCIeDyRTkay3E6kz3xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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



On 10/14/2025 6:48 PM, Jonathan Cavitt wrote:
> The xe kunit test code expects GT0 to always be available as a part of
> the test setup.  However, these tests are generally able to run the tests
> using whatever GT is available, even if GT0 itself is unavailable.  Of
> course, if GT0 is unavailable, then the system itself is likely in a
> non-functional state, but this might change in the future.

in kunit we build our fake-Xe-device by ourselves so we *know* that GT0
is part of that xe, we were just using existing helper to get it, and
equally it could be:

	gt = xe_device_primary_gt(xe)

as suggested in 1/7 or direct access as:

	gt = xe->tile[0].primary_gt;

but the latter should avoided as the idea was to use as much as possible
of the original driver code

if your tool is still unhappy, instead of adding yet another helper like
xe_device_get_any_gt() maybe add some (redundant IMO) checks like:

	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt)

and maybe just one in xe_kunit_helper_xe_device_test_init() will be sufficient:

	xe = xe_kunit_helper_alloc_xe_device(test, dev);
	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);

	err = xe_pci_fake_device_init(xe);
	KUNIT_ASSERT_EQ(test, err, 0);

+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe->tile[0].primary_gt); 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe_device_get_gt(xe, 0)); 


> 
> Add a helper function that returns the first available GT, asserting that
> at least one exists.  Then, use that helper to return the GT for use in
> the kunit tests.
> 
> Note that since the helper function is only used for the kunit tests,
> it's existence in xe_device.h is also predicated on the kunit tests
> being enabled.  Additionally, the helper function is logically identical
> to xe_device_lookup_gt(xe, 0) when that gt is available.
> 
> v2: Reword commit message (Michal)
> 
> v3: Add xe_device_get_any_gt helper function and use that instead
> (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 +++----
>  drivers/gpu/drm/xe/xe_device.h                | 22 +++++++++++++++++++
>  6 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index 592dfce21add..656574e6cfb0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
>  	xe_kunit_helper_xe_device_test_init(test);
>  
>  	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
> -	guc = &xe_device_lookup_gt(test->priv, 0)->uc.guc;
> +	guc = &xe_device_get_any_gt(test->priv)->uc.guc;
>  
>  	KUNIT_ASSERT_EQ(test, 0,
>  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> index 5afdf7887098..e3330099e970 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> @@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
>  	struct xe_guc_db_mgr *dbm;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	dbm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.dbm;
> +	dbm = &xe_device_get_any_gt(test->priv)->uc.guc.dbm;
>  
>  	mutex_init(dbm_mutex(dbm));
>  	test->priv = dbm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3e77f501e27f..2a4429101c6d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
>  	struct xe_gt *root_gt, *gt;
>  	int i;
>  
> -	root_gt = xe_device_lookup_gt(xe, 0);
> +	root_gt = xe_device_get_any_gt(xe);
>  	root_gt->uc.guc.g2g.bo = bo;
>  	root_gt->uc.guc.g2g.owned = true;
>  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index 8b29db38d394..ee30a1939eb0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
>  	struct xe_guc_id_mgr *idm;
>  
>  	xe_kunit_helper_xe_device_test_init(test);
> -	idm = &xe_device_lookup_gt(test->priv, 0)->uc.guc.submission_state.idm;
> +	idm = &xe_device_get_any_gt(test->priv)->uc.guc.submission_state.idm;
>  
>  	mutex_init(idm_mutex(idm));
>  	test->priv = idm;
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> index a891b1e0644e..8577a721cf42 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> @@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
>  	xe = test->priv;
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>  
> -	relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
> +	relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
>  	kunit_activate_static_stub(test, relay_get_totalvfs,
>  				   replacement_relay_get_totalvfs);
>  
> @@ -476,7 +476,7 @@ static struct kunit_suite vf_relay_suite = {
>  static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
> +	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
>  	const u32 *msg = test_guc2pf;
>  	u32 len = GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
>  
> @@ -486,7 +486,7 @@ static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
>  static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
> +	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
>  	const u32 *msg = test_guc2vf;
>  	u32 len = GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MIN_LEN;
>  
> @@ -496,7 +496,7 @@ static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
>  static void xe_rejects_send_if_not_ready(struct kunit *test)
>  {
>  	struct xe_device *xe = test->priv;
> -	struct xe_guc_relay *relay = &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
> +	struct xe_guc_relay *relay = &xe_device_get_any_gt(xe)->uc.guc.relay;
>  	u32 msg[GUC_RELAY_MSG_MIN_LEN];
>  	u32 len = ARRAY_SIZE(msg);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index af9476879454..56fe0be86b37 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -150,6 +150,28 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile == (tile__))
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +/**
> + * xe_device_get_any_gt() - Returns any valid GT, asserting one exists
> + * @xe: The XE device to search
> + *
> + * Returns a pointer to the first available xe_gt struct.  If no such gt exists,
> + * then the system should not be functional at all, but just in case that changes,
> + * assert the returned GT is not NULL.
> + */
> +static inline struct xe_gt *xe_device_get_any_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = NULL;
> +	int i;
> +
> +	for_each_gt(gt, xe, i)
> +		break;
> +
> +	xe_assert(xe, gt);
> +	return gt;
> +}
> +#endif
> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;

