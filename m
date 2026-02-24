Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B09EFB7EF
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120110E494;
	Tue, 24 Feb 2026 03:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kv7tW0TL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72910E494
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771903582; x=1803439582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4wPt7qP+clYVv9pyKDoVp40EbLpLtMAgYAPLw+V2LA=;
 b=Kv7tW0TLVBL1fNvi9teE3F0asTtWTYsCoddakfc2q3i1e68OhJ9HtWAd
 skLVe0qdw+35Z2a0k2ADiW1vOhoLMf5m1XsU5F+iTXivdkLtX7o7woto6
 Bg7ZnuCwPVZpwqjZqrv9TuvEc8TC4qehRkkvy0ApbKXBJtB4OfEp9w/+T
 XNvvPmlxO4A5aE3PBYsg+uBQaRtn2GymEjPa7fJbpa8I8nDA1F811vkuG
 8VynuS1R7kncDQt56X7ZvnntFijl64s92ByMHbuXLm6poPJJvPCLkWFFR
 cJm6WciN5wKALCVvdkrqS/BeatrEpXoaTZv1yHDCX+jf6IFIA5+YqrqTK w==;
X-CSE-ConnectionGUID: JanSNjNsRVaAX9qc+duCdA==
X-CSE-MsgGUID: Kyo3SYTQSYq1BW49Tg0qgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72788442"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72788442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:26:19 -0800
X-CSE-ConnectionGUID: KZTIwK/uSw2Zt2ZzyEjDqg==
X-CSE-MsgGUID: KLZkCFzwTmup7L2+GaKIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214141518"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:26:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 19:26:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 19:26:18 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 19:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRa0fFXdU4m81thwOtcQC9Hp/lX9gswqqq8nJNwCuw1ojzB4R3Rr70IedZ8w9382A0NZKkkZTdjJfxYY/wT638TRVloP5knGWK/ElxauCtmIs+EhYM6trhEVEwswe6NNYQ7auz7/bHDYx1jl4CENQAzu/xQcoTVXMJbJwl5DNHRX2o/7hz5alZXg7Nqmk7LhCohWmKoAbaFn8XfRVqzEOi3NyC61c8ZW6XCHE7Y4MNFiDhOoeW1iBAlbQzLCR9rpyr3W6LfD3nliOUNM7nMiQlr3T8rk5coN2JNms1uSXI3kSaPQ6UpUl4zfqKjTdHSYZKHSS/NbYx2gieMKvaL/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUEISvw6cGrYt14yVQZzuqAUUNkpq0bSFv9S9ZRKR34=;
 b=ROr4OBIAkflxm1mJ1RjoYl3kcvhFMm9GQnmaYdIzWtgaVrp/fBd5pEm6TUVXzv5JNxAgpM/5Qxs1srjZEjKglukpKFfoUNwA1Gl9sYEW1ctDKxXI4KRYSu5q7pYUdPrpH3CfrqAP7aVKN8ZSjJKnixxgoxGrc5c01qncRRdO7H2/rgfu008MwtKXoifit4OWn7Kx6qCYYr1jVqDEkhP6ChBgRDlBBG/Ke0CFTXHtLKGkCeKEJ5DPZgluPHTTWcyoXezdJtWpW6y2mbszSw/cFhU/ymhJBslo0aofU7IBACNU5SM8VkCl4/WSNEx+0JLIJMX7D5lPpjj7ksOmMv8ENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9443.namprd11.prod.outlook.com (2603:10b6:208:55e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 24 Feb
 2026 03:26:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:26:15 +0000
Message-ID: <7a40dbc8-80c0-4ee7-bab3-2ab7fb7c117b@intel.com>
Date: Tue, 24 Feb 2026 08:56:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <b903b2bb-572b-4269-81c7-792b16e2acaf@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b903b2bb-572b-4269-81c7-792b16e2acaf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0268.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 16feff3c-9676-4e88-1c4a-08de73547790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFEwQi9SbTNFbzFqL2hDYWM2N1hTcm5rSjEyNHp3Yk9EL3M4Q0k0USs1cjNu?=
 =?utf-8?B?L3JvWERCazU5Z0NDWWdmVEVLaG1ORFNPNFIydXZHTFduM01Sam5vamkyMktv?=
 =?utf-8?B?dnkraVI2VGthM3FkcEpVTFpuYkFBMTM5aXRZTzFhUHRKT0hzWEpIS1NRY2Uy?=
 =?utf-8?B?QWhWYXRJOXR4Sk44SlFaZXAraWQvVUwyT2wybWJ6SFlSMVN6QWZ2bXllVmkz?=
 =?utf-8?B?YjVwWkV0NjZQUVBVSWR0MUVxd3NrdnJHQitCczNxdDB2c0JnYjV6TWpKQWY1?=
 =?utf-8?B?cUh4VGNXUDFQcld1WmhRTVMxTEMrVEJkakM3VVNXSjBKVUZCMUtvK01nL0lq?=
 =?utf-8?B?alE5UjJyZ0Evd29hSWFMbTQ1U3JkR3E5Ni9PQjVmQ0RYbFZZOGpaZmhKOHFC?=
 =?utf-8?B?N0ZyWjRqNWRiUHpDVC9NN0hGNHVLdk00a2dRTWZwNmowQUJMenAwOVNNcmRi?=
 =?utf-8?B?Tlg5TXhPWk5BdWFyNVFMMkkzcytMTFE5aUkrd0Y5ajN4cExqczFBT1ZqM3ly?=
 =?utf-8?B?Y2lwYmxLSjlkN2VXZHlINUZqcis1aDJYbnpuWEQ4OExJV2dIZmVMVlZGY2RW?=
 =?utf-8?B?TCtqZlo3Q3ZwaVdmNzRFdlFSZ3BmOEVrcnBYM01BbGFzUW4vMi9UQmQ3WUNE?=
 =?utf-8?B?NXlHWVFNVGlyUmVYdW5IbER2QU1RM0xpQzFybnorTk5BdmxKMzZZL0VNd3Z1?=
 =?utf-8?B?eXhkNVJrOC9pR3V4OEZBMi9SL05xT3BITFZqRjRKVEpKVUwrNDZQaGpyV0ht?=
 =?utf-8?B?NjY3TnlwYXlGOUNzOTZ6TEh2VklNamtReVRsMVlMMGFGb21xMVBUM09PNmw3?=
 =?utf-8?B?NjFDbkQwV25LaU91NmM0MFdsMWpIQnIrQUJKalVJVHJ3cWgrR1Z1VFN0Z00w?=
 =?utf-8?B?VStERmZlbEZlY0pUNGNTTE1ENGlvZWh2YW5VelZKWCtpRnBLejBvQWVXL04z?=
 =?utf-8?B?TUtUUjVrbi9wSXh0d0xGMGE5bUdFR3drOG5Hc0dTOHZqdDdrV0JkcTg0aytZ?=
 =?utf-8?B?d3A1bHZZWjMwUDJTWS9KaURxV3VaYXlxdkN6SU8zUGdLanlyUTdRZW1QMXBq?=
 =?utf-8?B?WjQwdW9sanRtWGlPY3VVdUJMZWlCbG1ZbWZGOXNMRnZZMlBuMkpJWjZlelVr?=
 =?utf-8?B?aDJxN0xlbU00M1dXTHMrczZyVUpFNUlMQWFqMWtPTHowYVI2ZHViaWhGMGpI?=
 =?utf-8?B?Vzhid0RJQmpxQWNoZ2RkWk5QeXFOWHR2TFZ6MHZCNHJaNUV0RUJrUGZKY05V?=
 =?utf-8?B?YitOclllalVmVzhabHVsUHZ3WWQwZEZMVk0vcUNROTFEOGM4WEpPOWtERDBK?=
 =?utf-8?B?anJONFlBV3V6WnRzRmtmNFAxOWlJc1BDYWtJcURReWtlZW1HcUxtaE9UNzhT?=
 =?utf-8?B?bDhhejBhWlZoK1VRYUpxV0t4b2EyT3c5U2tMZ3poZWdDb01LNXZvSWlxSFMr?=
 =?utf-8?B?UUJRMG5aRkN5Q3p5dHVUNHNidndsNTFHNTg1WHV4ZXp1dkpUQnJWdWVEQ2Q5?=
 =?utf-8?B?UDhVbmZuWlA0U1Z3a3dvZm9LbzB0L3k3WTJxbGhUQlI2NzRvMjFnb2YxekYr?=
 =?utf-8?B?bmhSLzBUVnZxOWpkMlArQTN2TkFrUWxtcWVLZ0g1YXkydm5EUmc4UXBnclB0?=
 =?utf-8?B?K3BjZ0R5MVowRlNrUzd1RTU5MDg5bDdKa2x5TjRQQ2phWE5ZeTkrYVRybjND?=
 =?utf-8?B?NWgwNlkvd0ZkeDIxZjdMNDV4N3N5MWkyN2QrQkI2YTQ2NkRrN1VaNmFnWXVF?=
 =?utf-8?B?cXZRNytUdUpnTXhMVlE5QyszU3VCZTkrY0dBa2RGNmYxNTlVZ1N6YlV4NGdZ?=
 =?utf-8?B?WTVQcDc4cHZobFk4VVNsZWxEaHhvbXBRRnBvcmpEMW5CQVZKY2NnOVNqai9C?=
 =?utf-8?B?aDJrN05pQ0xmWXNrWmlHRk9zc0VaVXBackZXSG12UVU3bWFSSDYyRlZjRk02?=
 =?utf-8?B?RTVLMmUwY3RlU1Zkanptd29xUTAvMFRub2Q1MmNyNUFiMUF5bm1ORDhlcFlX?=
 =?utf-8?B?NmhPRmFlcFdyemdEM20zK0lpM3grbWl6aDBxMkN5OFNpa2xsamI3T3lVenBu?=
 =?utf-8?B?MEdyLzNMcTlPcGRod3k2d2RoRDBaRkVVeHp5T3RsbDF1dTRlakNXeWR2ZzI0?=
 =?utf-8?Q?ra8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZS8wU2NBcXJmbGp0VzdHdTJDa3hydFZXK1BWNzIvNVJCWS8rek9kOHZ5ck5m?=
 =?utf-8?B?UkdnWVp5TWJYNUtkWk9zazBra1ZDbHV1eE5qUlNvZ3J5WU9oR1FXUzYvRGda?=
 =?utf-8?B?SVBaWExRZTg1clhVTy9yd1A2eGtWc3JETGh3MUZzcTZIQnpOV0JHTE5kRTVF?=
 =?utf-8?B?azVsQWpuWHZudy9acjZOWG9KZDl1cUdac2M3WnlFZGxrUzl2aVZXVUdPdER3?=
 =?utf-8?B?K0RncCtKV1hoc01KT0dIZ1V5TUhpQTJKR3JTMm94ckQxMk03ekczQmhFRE80?=
 =?utf-8?B?Rnoxb05ZWFk3b0k2ZStRYld5UVUxWjI3SWZrTThWdUZ4QkRYM3N6N3hDeWNI?=
 =?utf-8?B?VzBmcURyc1hEUUp1cGNreFhvem1NdlhyUEV5VmVoSjNlNFhXR3JmM3VHY20w?=
 =?utf-8?B?SUJZUHN6am5rVmpWZU9hOHI4Ti9uVVdHdm82YmYrZmpHOUg0bVVEcEZZU0RI?=
 =?utf-8?B?SkVEekRZaUhLbVNpUldpZEVidlRlSlVGSDJLRW9YY1RwVjI1am1MRnRzdGxR?=
 =?utf-8?B?eE5LbzIrZjBiN29zcGR5K0VnelJOUlE4UmFlZEhZV055NGl6dWNLdHp5U21L?=
 =?utf-8?B?Z01MRUZXQXVGM050bDlSZlBiSVZtWnphKyt6R3ZqR25JYzcvUE1QOEt5eFJD?=
 =?utf-8?B?Y21vK3lIODdWRHpxdjBFekxoR1VQNXBHWTl6THduK2xyYUtjbWJ6OVNPSzdL?=
 =?utf-8?B?MHBXYktvTUVDYTB1RlRSR3RkMFplNUNSL1Zlcmp0NTE4aDM3YzhHNkxzR1Rh?=
 =?utf-8?B?cjBmbUpxcEZ2QklYem0vM3Fmd0xUWVVGYytSLytzOXRhczVRb3F1RXFhdk16?=
 =?utf-8?B?MmFHYTVtQkVTMXJqMEdvQkpJa3pqNG9nSnhIb1dhUGF2OHFjaEdpRlVZVmxQ?=
 =?utf-8?B?L0dtOVJBZUxLa2JSQ3FEbFNyYTRaazcxUHF2WEpZOWlIVVFYbTllcGRhQVMy?=
 =?utf-8?B?RFp0amRHbXcvSlQ4bmdTejc3SlJQSXpzQS9WaU1ZeGFpVXBiVG1ENk1iUVNh?=
 =?utf-8?B?T0NDRVZsQnZzTUQ2bVFaYWp0YmdmaDlGV1VjQ1pMWS9FcmJsaEY2TGo2TmFO?=
 =?utf-8?B?bW5wM3BFL0p0SlY2U05ZTktGcStZSUNJOVlRSGRXQ1NuUWJRVVZuTnJ1S2tq?=
 =?utf-8?B?K1pLUXBQM3BNdjRXT3FjZ2JMQjZnUlJTRE5VOVNQcHJ2SEYxYlQxTFU3SDlz?=
 =?utf-8?B?WVhPRlBFS0xIS1M4RjBSUjJacEgvOVJ6K0tUak1qcXdPNFB5RFFYcGhXR2lB?=
 =?utf-8?B?enRhakp4T2Z4cjB0TUdiSXRZcVNKM2JyRlFQczVqR2t2UTFVVkc4QTRDb0dx?=
 =?utf-8?B?emprZTMvdjh5dHhDQi9QYlNQNTRzMWh1VGFHdUZnV3JhVFpOR1JCM0ZiQ05J?=
 =?utf-8?B?OUhrV2dpZDJ5aWxPUzBTcjYrby9ieExsckJLaCt4eU1QTk1CVUhxVUp2YTNa?=
 =?utf-8?B?ZERBcEF6VCtBRVRsNmNWNnVhMjNKd2VySUx0NHBpL21MMEZvL2tnYWJsRTFl?=
 =?utf-8?B?MkNyc2lScTV2cGQ2Znh4YnAwdUFPcmh2ZFRYT0JMU0txTDZkcnI3Nm5EZEFS?=
 =?utf-8?B?MlVaQWZHSVhOcUlLODlTRGRMQXc5bC9SZ2oxZ25QaHNhSzlYZFZmSDExYkFp?=
 =?utf-8?B?VEt1NnhPQUlSd0pJMHo2dk1KOE04QmdvRUkzOTh5SGxtdjVDcXhqaUM5WFh2?=
 =?utf-8?B?L0VnSFRscXNNSVd3TkEyVXV6NDVQaU1adERrVEU0MCtBN1NuanFuS0JGc3RY?=
 =?utf-8?B?Qzl3Uks0a0xZOFJTMDNDMHhYV1N0cW5iYlRGSEFydDJWZi9YczlyZDZ3d0J6?=
 =?utf-8?B?R1FWL1pyT0pRN0VxM0ZWeitKckQvSXZKbWR2d2piNk54cFZzM3cxdENnMWNw?=
 =?utf-8?B?cUZteXpJcnE5OCtOZ3ozZmJYWmZDZWZ2Ynh4YTlndTlGbTNJTlYvK3lLelFo?=
 =?utf-8?B?TFZ0TVp2QjZGRXRqN0g4ZEtsSWtMUHlMbmFNQ3l4dFZtUHlZRDFKVDR3ZTVX?=
 =?utf-8?B?UmJydmMxRG1SV0FGVUVvZk5zTlYrcjBMaWljWUE2MUd6ODdFWWxtRGsrTlpN?=
 =?utf-8?B?dG5KVllRUlAwd0YwMjFDeXI5b0dYeFBNWjRhemE3ZEo0Tk40M1NPaEhVUjhX?=
 =?utf-8?B?SEFlVjFSNDllVkw4SW5OLzBna3FPaUZHNC9iNlFsWXRFRVBocnQxdlk4amlO?=
 =?utf-8?B?d3RieVY2T2hocUxMRkhuRGUyekM0eHRjNElWbmc1dmRWZEJhbG1JUGVIWElh?=
 =?utf-8?B?ZGJKL1hjRVBsTmY3MlBNVGpmMytSZ2dxZ2Q1RFFKRWpOdm10cXdKOW1qTExR?=
 =?utf-8?B?eWZQY2RnWHV4WGxnRm5GdEZmN2tOSFBhbzYwSWF4RnBZTi9vb3ZPUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16feff3c-9676-4e88-1c4a-08de73547790
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:26:15.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyGgySxDDigl2fn/Roec1YLXaB5H7m20U6ISSzD/W095ykZBpaBblJKkuhsDh2TvdvDpCY+GEKbZnahGqWYC4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9443
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



On 2/16/2026 2:23 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
>>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>>   5 files changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f6650ec3ab42..5581f2180b5c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>>       xe_page_reclaim.o \
>>       xe_pat.o \
>>       xe_pci.o \
>> +    xe_pci_error.o \
>>       xe_pci_rebar.o \
>>       xe_pcode.o \
>>       xe_pm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/ 
>> xe_device.h
>> index 58d7d8b2fea3..81480248eeff 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>> *ttm_to_xe_device(struct ttm_device *ttm)
>>       return container_of(ttm, struct xe_device, ttm);
>>   }
>> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>> +{
>> +    return atomic_read(&xe->in_recovery);
>> +}
>> +
>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_recovery, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>> +{
>> +     atomic_set(&xe->in_recovery, 0);
>> +}
>> +
>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>                      const struct pci_device_id *ent);
>>   int xe_device_probe_early(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index 944f909a86ad..2d140463dc5e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -669,6 +669,9 @@ struct xe_device {
>>           bool inconsistent_reset;
>>       } wedged;
>> +    /** @in_recovery: Indicates if device is in recovery */
>> +    atomic_t in_recovery;
>> +
>>       /** @bo_device: Struct to control async free of BOs */
>>       struct xe_bo_dev {
>>           /** @bo_device.async_free: Free worker */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c92cc176f669..e1ee393b7461 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>> +extern const struct pci_error_handlers xe_pci_error_handlers;
>> +
>>   static struct pci_driver xe_pci_driver = {
>>       .name = DRIVER_NAME,
>>       .id_table = pciidlist,
>> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>>       .remove = xe_pci_remove,
>>       .shutdown = xe_pci_shutdown,
>>       .sriov_configure = xe_pci_sriov_configure,
>> +    .err_handler = &xe_pci_error_handlers,
>>   #ifdef CONFIG_PM_SLEEP
>>       .driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/ 
>> xe_pci_error.c
>> new file mode 100644
>> index 000000000000..a3cc01afa179
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <drm/drm_drv.h>
>> +#include <linux/pci.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_pci.h"
>> +#include "xe_uc.h"
>> +
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +    xe_device_set_in_recovery(xe);
>> +    xe_device_declare_wedged(xe);
>> +
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>> +{
>> +    dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
>> +
> We need to set recovery flag here right?

Yeah we have to set this for all errors. Will fix this

>> +    switch (state) {
>> +    case pci_channel_io_normal:
>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>> +    case pci_channel_io_frozen:
>> +        xe_pci_error_handling(pdev);
>> +        return PCI_ERS_RESULT_NEED_RESET;
>> +    case pci_channel_io_perm_failure:
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
> Please make default case where we see "Unknown channel state" as dev_err 
> and return PCI_ERS_RESULT_NEED_RESET.

Sure

>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>> +{
>> +    dev_err(&pdev->dev, "PCI mmio enabled\n");
>> +
>> +    return PCI_ERS_RESULT_NEED_RESET;
>> +}
>> +
>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver- 
>> >id_table, pdev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
> Check xe is null or not? if null then return PCI_ERS_RESULT_DISCONNECT.
>> +    dev_err(&pdev->dev, "PCI slot reset\n");
>> +
>> +    pci_restore_state(pdev);
>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return PCI_ERS_RESULT_DISCONNECT;
>> +    }
>> +
>> +    /*
>> +     * Secondary Bus Reset wipes out all device memory
>> +     * requiring XE KMD to perform a device removal and reprobe.
>> +     */
>> +    pdev->driver->remove(pdev);
>> +    xe_device_clear_in_recovery(xe);
>> +
>> +    if (!pdev->driver->probe(pdev, ent))
>> +        return PCI_ERS_RESULT_RECOVERED;
>> +
>> +    return PCI_ERS_RESULT_RECOVERED;
>> +}
>> +
>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>> +{
>> +    dev_info(&pdev->dev, "PCI error resume\n");
> 
> We need to clear recovery flag (if not already cleared), for normal 
> operations.

Yeah if i add the in_recovery for all errors and we don't trigger a 
reset. We need to clear it here.

Will add this

Thanks
Riana


> 
> Thanks
> 
> -/Mallesh
> 
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_error_handlers = {
>> +    .error_detected    = xe_pci_error_detected,
>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>> +    .slot_reset    = xe_pci_error_slot_reset,
>> +    .resume        = xe_pci_error_resume,
>> +};

