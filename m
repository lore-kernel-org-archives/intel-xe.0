Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7944D1171E
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BBD10E6A1;
	Tue,  2 Dec 2025 18:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0OACTju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FA910E64A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764699745; x=1796235745;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6EK40Y7zAWUyelYqp7XCVAfEjeiNiUIsXpmhw3aKj+o=;
 b=l0OACTju0SYWqLykUQ9QTrXitTiW28t97RrxJfVFjPTGqlImCjr1BPLZ
 OWeYiCzP6lNHcYvgvB+h5pU+LhqcTFoZW6VjI5O3fGfY4VbJAvllEU3lA
 cY+qZWLj5WAJUbXz/F6lr4y2ogubAT5Y4ltiKogXCD9np4bHjb/a6uDAQ
 yhOdsfj22FqSSbLJqHQj78ObGFP20N9yFLhmWRndckxY0cRccNbvMl6K+
 fByPPFCbP3ZRooyzYfnPTt2horVM/h2ivd+tvkFR03M1w29+BSBvacb+7
 RhYbRwvdbEddRF6vbKajI2V1sotPXbiS+Pd5ZBLX2mQkM1ozEPrSlvi8C Q==;
X-CSE-ConnectionGUID: xqatnsKBSgOwODQ+7vdjyQ==
X-CSE-MsgGUID: gc8MOXlIQwiOf33aRYNi4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66754031"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66754031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:22:24 -0800
X-CSE-ConnectionGUID: hs9dpY+AToSgD6wSkXbmCQ==
X-CSE-MsgGUID: q4jtyrMKRl6ZE041MqH4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194439879"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:22:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:22:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:22:23 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:22:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYk6PlLYd5A3CWTughMrGAkJ1rYVOKtXzlkKUUz8BKSxpn8oq180/1M90JY8otsHk9esogCODuUmY+Nd0qGuRLn4PG4I8kOB0xfeoZcWYMS6RjKbaJrt221eNCX6lxbnrKtJhW0ZBXBdkL+7JlikcFnBzenkLTlR3nw0dIMn4gO31u8n5e5jICAfS5rfKNeQrlXLfKpWIH8ZN+0qdRC+rqsU7jKKAQdYZFGSPJmuWE60+Z+zZ4IoehjHEb9Rp0ohGJGBl1xPXrJTFVEqyTAQcUDjRwSSLl5z29qS5TAcy9vyW6wdHvtOuVdMG74wU5dArU9NnJ8pwL7WoB68i8L6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W70QaNEeeN3+CExD7M+4N2Mx/38lHNaiX0UsNuWKvB0=;
 b=HsWkgzh3SXwgpHc174fLuZQBP+e/HzqUHdVLp1OkkmJfvqTA5PNRYZGdei/5r6KGaj7tvjzrfcaFMhRHKEbckT+Aj9yG0t/MHv/VnQyMnL1rhYW+1IUlpzbCOhqjWk6OxlUc2E3cMOZWKYOQTLgfq+X0mEWKSuENd3t64Uw0+HgPAUYpU1Zux6x0eVSEuu6eK8Gq9cauV/h+QfFQ4mz15S5PzZkXmqJepK0NVXmdlxeeVgaQdor8I0A/QaQ5aASwnhPBL+cxz4bnliyzXTIlKmA/kLvNb9OQ3yDCO/htJNaPt+rpYVfpR774WDu4scisu/rjTjjCLk6y6zCxXI4Nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 18:22:20 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 18:22:19 +0000
Message-ID: <bc69e7ef-a8de-4aed-b271-c97e3f39b323@intel.com>
Date: Tue, 2 Dec 2025 23:52:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
To: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
 <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
 <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
 <d5fd4f75e084f4e8d0e3eb7e542d8988fab87449.camel@linux.intel.com>
 <aS8C/lCla/NdL43q@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS8C/lCla/NdL43q@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::7) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|MW3PR11MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: c13a50d9-c589-4a0e-94ca-08de31cfbae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTFqelFoVEZIVlpsYkdtUXVaNjNXd2M3R3laTmRIVHc2RDRXdnJQcEEwMzN4?=
 =?utf-8?B?eXB2MXIzU1ViZFBFaU9MeTRBNGtOUHJmZ1hjSUwxeldCY2Z1YUdzWkxOUDhV?=
 =?utf-8?B?SDAxOXBLdkdWNCs2VzJRNVpjbjhOYmZibk5XU29qVU9VOWg2azB0QXduVEJK?=
 =?utf-8?B?ckRValFTY3NkeVA5bEJHcFA0ck9TNTdHTy9OeWpPZHk2Ykd1ZEVKZHlRTlFN?=
 =?utf-8?B?SEtodmtzQWRZTFkvbncvR0dPL3YxY3hSQ1VENzFVenVaQXN5RjZ6cWpTTkgz?=
 =?utf-8?B?U1o1enpwRE5Hb0lsRks0dkpUcHpLRCs5d2pNMGJqZWFFTnFVdThKajM4c1E4?=
 =?utf-8?B?cE9teW5KNHZORU9kajNvZlBiQkNKMmp6VG1vcDFuQjBKcHZEeGRTYm5OSXVj?=
 =?utf-8?B?M2pydXp6bmhCdWpYT1BuN2NLZDVrMFdQMFZ5OFJvczcxUkVDSEtzVU0vOHpF?=
 =?utf-8?B?ZnpuWEJmOEhMdEdEMkZ1aGZwdll0SmVNcWIwNFlweGQ2QllramVueWJIa0tL?=
 =?utf-8?B?NC9yRGh5b3VZTDkxVWp1RXhydGR6a3U1enRFYkFUWW5YcjFjeUZmaWVKYlFT?=
 =?utf-8?B?cHQwWm5UbnVrMmcrYlhTdFhRV0xPdHlMbkpHV1p0MW1LUTZwMWs2aHh0RjVN?=
 =?utf-8?B?ZDI1R2t4bWRWRmhDdXVKVWY5QjhtcHBlN1lBcnh1aU1jVVJ2RVlTNUU0QldL?=
 =?utf-8?B?T2M2QXJKNkV2K3Z4Z3hTNzBDeGhhNncyemNPcy9oRUhzL0k2MXRtTlArL3B0?=
 =?utf-8?B?SE1GRXJFSEd3bzhRVU05eU5pSmhrcFA5RURzNUhrckZHbFdRL3o1bnBUMGt1?=
 =?utf-8?B?Rk1xSVFIU1JiOCtoNXlSVGR5MXFxV0ROa1gyc1hKM1JqNmhvbGRObU9lbHhY?=
 =?utf-8?B?a0IzamVPV2NSMUxFRkkydlZmQ0ZzcnVsVVg0VDhqb2c3SWtvU0hjRzh4RjZ3?=
 =?utf-8?B?ajZzUDlnRnpFMTJEdzR6N05KNTdpZDZISGt5K2ZrUDhnclRLeGZ4V3NkdnNq?=
 =?utf-8?B?VjZHNkJuZVdEMUFxWTdLSmhVeUJQd0J1cHo2SFBmK3FWK0tEQ2dCWlhDNVp4?=
 =?utf-8?B?L2xvc1I3c3RZVWVCRXVJMUhuUXFWalZPMGxpUWZzb01oaHZGMEl1NjhGeHFW?=
 =?utf-8?B?VSt5L3RWVGNTRWhIWlVzVnpQVTIrVE9jWHRyNlJ0Zk41b2ovT1VOVEhFdkdl?=
 =?utf-8?B?aDloZmZabVpkbW55aFg3OCsxdHFLeVNDQnhnbDVDZkNBRnNXeVE2SXpUdWpL?=
 =?utf-8?B?Sk1XalNtRjlJMnlieWVLWjFocXlPMS91KzFERkU5WXJLanN6UHdmME9xb3Va?=
 =?utf-8?B?WWxYU211TE5obmNoSEdVanFTR2xEV1lLUzJRK1BraFNaVmp0WWIxR3NaTFQr?=
 =?utf-8?B?TnpLbUU3blMxY2xqWnNwOGdJV3JvUkxsdDBnT2xPeDBFekdwcXk0L3Q4Mk9y?=
 =?utf-8?B?clFhaTdvTXo1c0RRd04zcmtpbE5HelNMSzN3VGhKd2tFdzhPSFpuVzdST3hP?=
 =?utf-8?B?UHNmN1lZWWNOZVArd1RteXBNd1liaXJibmlSTm1GZzh2cS9YWGwwT0dwK1Yr?=
 =?utf-8?B?NTFnTmxmclNVaFdXK1JKcmQxUzhVQzBsVldzblMrSHRYK3hra2NGOFRxM1Q1?=
 =?utf-8?B?cEt3UURqNHpzM000YWdacWR4WUFhcldPQjBtZGRxaXFRa2pwK0pubXRiU1JH?=
 =?utf-8?B?RFFMd0QrcG1lMElaV21yWWFuVTlITzVDS3kwZG1RQ2VCZE1DUEdUOTMwSzAz?=
 =?utf-8?B?T0lMQXJ3SEg3R0swQzczY3ozVWpHTGI1K1JlSWdEUFZKMHFNQXJTS0hhblpD?=
 =?utf-8?B?L0V4YmxGNDFNdmo2eWd1V0s4S3dJckRzQ0hMaDhUMll1MFhnd2xxbGdybFA2?=
 =?utf-8?B?dkg4S3Qza0VsZnhva2V4bGZtVUZRV2xtNHFXc2RjelNKTlZGakFyclVQd3Zq?=
 =?utf-8?Q?Apu66JcGAmO3HUmZ1CXaei2Lf/N/eTWr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZ5RmNQR1FhdVBESUJqQ3huQXI4S3VISGV2L1laTTVmdld5SENvRmdaZms4?=
 =?utf-8?B?R1Y5TVJHN2hFazhJa2t4SW5MVzdNVG1TQnRFOXBTU0s5NnpTN2g3V2xqbkVu?=
 =?utf-8?B?ME55MjdzbnR6ZTUyeXB0WEY1REJjeFVzMHcwc244V0JMQlN6aThUTXgzWWJn?=
 =?utf-8?B?cFhEOUtHYUNXR3R6Q0U4V0doYXpWc0NodndaeGxId2xlTFRlVjQyWWVVOUVx?=
 =?utf-8?B?Y1dxbWZOZFNIWWRpZ1ltSHNCMDUyYW05aHp4QmpoN1Uza0E0RHJuR3ozUVY5?=
 =?utf-8?B?YnQ4bFlYLzNVUFBoWENEeU1CaVRzbFZVSTVsUlNaSmlqcXZNVCtNV2tHZzVx?=
 =?utf-8?B?UkxGNEgwQ29WVUd1a08yU0VES0QyU1NIZjVHRjUyU0kyY0RZSEFXSmxLQ1lZ?=
 =?utf-8?B?K3R0MHNiYlQvOWFMdFFKcEc3ajQyYzcvNkFjYUxpTUhmcGZXZCtPNC9EelMy?=
 =?utf-8?B?c25yYWhvTWw4STloM1cyeStNb2xZcEsyeHhkQlh2VllBT1E4K2JBS2tVYzdF?=
 =?utf-8?B?U0RxRDZHcFdqMkFqdnRrb2NTYUUxMVlqbTlnRVU2SFJpMmVQTUY1b1htMElu?=
 =?utf-8?B?VEFCT1RkMzBac1RTSi9ydVZSWVYxdmx4U2V1QjM1bkxnZFo0YWZSekFocW00?=
 =?utf-8?B?VXAxYnJlRGRjZ3FhNkt1ek1GVDYxck5oMlppV3pxMHc2Ukt4eDVnWUprcVF1?=
 =?utf-8?B?MFpXbHpIRkd2Rm1BRmNla0JXK0x3QUZ0YytsSGtZZHFhOHE2QmxDWVBNV1JX?=
 =?utf-8?B?bnBrOWZzekZ2VVpBMlpmWE5WR3ZDTGdKS29mTnBZa2hxSzRKLysxdkEwckgy?=
 =?utf-8?B?RURWT0VZaVRhYXNvMURHT05QZnFjeWxlNHUwc0pORzVXQzNXdnF1dno5M3Y2?=
 =?utf-8?B?b1VRSUZhSVpzcXlxZWJjNHpPb2lCU2VOKzduOStVcDFobkdFdGt3NDdhMG5Y?=
 =?utf-8?B?SGZUVWtvaGNXUFAwcFcraEtDRE1oT2xmZmozNGFhN0V3N3FOUEVia2U2cFFU?=
 =?utf-8?B?bDVsbHgrd2dXQ1VPQjlCY1BFNlZ6bUpzNnlFMDg0bitCUFNiL2ViUlJxYTBm?=
 =?utf-8?B?N25KVWdrYmtmVTNhWG9MamtmMUJTU08xQ1ZNOE1kRUNQUWs2UThJZEUxakdS?=
 =?utf-8?B?T09BRTlzVWNXQXorM1F0YVk5cW81YlNtdGV4eWZMV3Y4Uk15bU1PYVlCL0lj?=
 =?utf-8?B?Nm5PQ2MvVGp0TitFckZwME1JK1lUaktvQk9ZeFAzYm00UysxRjgzemhnRTY0?=
 =?utf-8?B?UE1RSktLcmVaQjF6WEhNa0VBUkYxcHFsVDViVG9vWHdiY3BETU50cmgzQzQ5?=
 =?utf-8?B?eXExQWk5UGZLTU5ReklmL01NSkE1SUNoSFE5S2FlZGFXTXNCK1VZZG51Vnox?=
 =?utf-8?B?TkQrYlZqODFXbk5KcXhXOXZwLyswK0tXSHhpMk55cXJmYWcwc0VNRjcwM2kx?=
 =?utf-8?B?dnRBVWtWcFlHYlJNckRLaHZhWFBLRnZJTzZYdmhSemdiYzFLbW4xaUMzZ0JK?=
 =?utf-8?B?ZnA2ZDl4NnYzcUhGTlpEZUR5VVdPSG9UV1EzSkpnU2tsaTlITThsOHpGSVVY?=
 =?utf-8?B?c0xRL1VDM1lTbTdRNEl4ZEVsSHF6YndaK1Vrcy9ZeTE5UXlGcUMrRFVZMHFp?=
 =?utf-8?B?U09lWWVuUStFT1dGVi94RXhldlEzZWY5Mzc3Q1FPU0dYeGE0aWhZMHAvc3NS?=
 =?utf-8?B?dGtCYVhXbXJMSDdDZWtKeTh2ck5pVjRqZUhSMThYb0hWWVhXVnBQZE5oWUZm?=
 =?utf-8?B?Q0hDaUZTTHh4NkQyRzlSZCszOGNpMzZNckdGQXBSZWVIT3FraXcxMEdxMmIx?=
 =?utf-8?B?QVhPUWdmNEk2Um0vWlU2R1ZMQi9SOFk3dDhIakxUR0xWalBNQ2tMQ0ZOR0lN?=
 =?utf-8?B?K0g4OVFqSG5wc0o1N3hBNnZmWlBXSlVCN3A2cGpVbkdEOUVxVFF4OVNYOGZl?=
 =?utf-8?B?OUZSZ2NPOGE2UnVmWFlFS01Qb2RsTTdQazBXbDdFSFRnRWRFTSs4MjhCb1k3?=
 =?utf-8?B?SW1iL2I0cVJvUUVRKyttL1B5UThUbXRBZ2NvM2d3TDBQRDR2VnptRDg5aXNv?=
 =?utf-8?B?eWt0NGxLWS9rL3lsNHRGeFpQelpiVk12TXpVbE9kRWZ0cGd2aXdUdUQzbU5a?=
 =?utf-8?Q?eiGeUpmWIeZWIYy+KrVY17zLr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13a50d9-c589-4a0e-94ca-08de31cfbae8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:22:19.8092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCRMFwfLsgGYpqbshfWFuWJZeLacUB4AsS/RTnTB4srTWIv+rXpkh4mHogSHidBwKLJRUWi9qiReI9ZvMiWdKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4684
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


On 02-12-2025 20:47, Matthew Brost wrote:
> On Tue, Dec 02, 2025 at 10:42:07AM +0100, Thomas Hellström wrote:
>> On Tue, 2025-12-02 at 09:12 +0530, Yadav, Arvind wrote:
>>> On 02-12-2025 04:40, Matthew Brost wrote:
>>>> On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
>>>>> Introduce the `xe_bo_is_shared_locked()` inline helper to
>>>>> determine if a
>>>>> buffer object is shared across multiple clients or drivers. A
>>>>> buffer is
>>>>> considered shared if it is exported via dma-buf, imported, or has
>>>>> a
>>>>> handle count greater than one.
>>>>>
>>>>> This check is critical for safely implementing purgeable memory.
>>>>> Purging
>>>>> a buffer that is shared would lead to data corruption for other
>>>>> clients
>>>>> that still hold a reference to it.
>>>>>
>>>>> The kernel cannot safely determine when all clients are done with
>>>>> a
>>>>> shared buffer, so shared BOs must never be marked DONTNEED or
>>>>> purged.
>>>>>
>>>>> The new helper is used in two key locations:
>>>>> 1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
>>>>>       successfully marking a shared buffer as `DONTNEED`. This is
>>>>> the
>>>>>       primary safeguard against incorrect usage.
>>>>>
>>>>> 2.  In `xe_bo_move()`, as a final safety check before the kernel
>>>>>       initiates a purge during eviction. This ensures that even if
>>>>> a
>>>>>       shared buffer were somehow marked `DONTNEED`, it would not
>>>>> be
>>>>>       purged.
>>>>>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
>>>>>    1 file changed, 30 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h
>>>>> b/drivers/gpu/drm/xe/xe_bo.h
>>>>> index b0a31c77e612..97edb38bf1ed 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>>>> @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct
>>>>> xe_bo *bo, u32 mem_type)
>>>>>    	xe_bo_assert_held(bo);
>>>>>    	return bo->ttm.resource->mem_type == mem_type;
>>>>>    }
>>>>> +
>>>>> +/**
>>>>> + * xe_bo_is_shared_locked - Check if a buffer object is shared
>>>>> + * @bo: The buffer object to check
>>>>> + *
>>>>> + * Determines if a buffer object is considered shared, which
>>>>> includes:
>>>>> + * - Exported via dma-buf (obj->dma_buf is set)
>>>>> + * - Imported from another driver (obj->import_attach is set)
>>>>> + * - Referenced by multiple clients (handle_count > 1)
>>>>> + *
>>>>> + * This check is used to prevent data loss on shared content by
>>>>> avoiding
>>>>> + * certain operations like purging on buffers that other
>>>>> processes or
>>>>> + * drivers might still be using.
>>>>> + *
>>>>> + * Return: true if the buffer object is shared, false otherwise.
>>>>> + */
>>>>> +static inline bool xe_bo_is_shared_locked(const struct xe_bo
>>>>> *bo)
>>>>> +{
>>>>> +	const struct drm_gem_object *obj = &bo->ttm.base;
>>>>> +
>>>> It seems like everything below here should be a new drm gem helper.
>>> There is a DRM helper 'drm_gem_object_is_shared_for_memory_stats()',
>>> but
>>> it's
>>> specifically scoped for fdinfo memory accounting and doesn't check
>>> import_attach.
>>>>> +	dma_resv_assert_held(obj->resv);
>>>>> +
>>>>> +	if (obj->dma_buf || obj->import_attach)
>>>>> +		return true;
>>>>> +
>>>>> +	if (obj->handle_count > 1)
>>>> So this covers the case when we prime fd to handle but we resolve
>>>> to a
>>>> BO (i.e., we don't do a dma-buf attach, rather just take reference
>>>> on BO
>>>> as the BO is from the same device)? I just want to make sure I'm
>>>> understanding this part correctly. If so, maybe throw a comment in
>>>> here
>>>> or update the functions kernel doc a bit with a better
>>>> explaination.
>>> Yes, that's correct! The handle_count > 1 check covers exactly that
>>> scenario:
>>> When we do prime fd-to-handle but both processes are using the same
>>> xe
>>> device,
>>> we don't do a dma-buf attach. Instead, we just increment the
>>> reference
>>> count
>>> and handle_count on the same xe_bo.
>>> I will add and update the function with comments.
>> Arvind, Matt
>>
>> I think the correct way to check purgability support for shared buffers
>> is to loop over all vmas attached to the bo and check that they all say
>> WONTNEED? If they don't, the bo is not purgeable. This will also need a
>> check at VMA unbinding.
>>
> I think this makes sense. I haven't fully gotten through this series
> yet, but will consider this during the code reviews. I probably should
> apply this series in full before providing feedback.

Thomas, Matt

Agreed. I will reworked the purgeability logic exactly as you suggested.
Instead of relying on a “shared BO” helper, the driver now keeps a 
per-VMA purgeable_state,
and a BO becomes DONTNEED only when all VMAs attached to it report DONTNEED.

~Arvind

> Matt
>
>> /Thomas
>>
>>
>>
>>
>>
>>
>>> ~Arvind
>>>> Matt
>>>>
>>>>> +		return true;
>>>>> +
>>>>> +	return false;
>>>>> +}
>>>>>    #endif
>>>>> -- 
>>>>> 2.43.0
>>>>>
