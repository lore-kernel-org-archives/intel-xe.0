Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA60C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5010E75D;
	Thu, 29 May 2025 18:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F9fnnIBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DAE10E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748543015; x=1780079015;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pW8LhqGEs6TPxppzAx/zNRFH4W+4oUAfUIdkm3eVLbk=;
 b=F9fnnIBQQckZZHCmlhuehWLApvnyjW2mq6rJuPtIaF23sCGzq2rL4F/+
 Narrt9gXdwISlGCiXI8OgTQpfSz0juNLEdbr1lBMK2fpTFZNkgGpOkcij
 AjOXIxIp8UJrVpJL1xPmT5oXFVua0NKK7CKS41yeI/WYL2o8SR4We+odK
 YFkOkeNcDIWH2I0EnvNOhva/5czfkcL847i0ssOVXgPSWAMxypBOCf2mg
 Z0Cl4hmFJTCK+G4k/ydvLX3GUfSh/yL4WScjDL8Ax+RiZfP5S5QxIWs9L
 M6bCwJzgxZppm7RPO9EbdptaSQ7dAcnDQxzXYGlRnGjiLwMKhzHexHrWU A==;
X-CSE-ConnectionGUID: ZxSY2wl0SvODt/Yed8G8zw==
X-CSE-MsgGUID: vHRK5XopR5CP6acooiyG6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50544910"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50544910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:23:34 -0700
X-CSE-ConnectionGUID: v+/MIIusTFeX5oTkhmxriA==
X-CSE-MsgGUID: mbbemN2+T4218gVgnL9nUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143664739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:23:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 11:23:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 11:23:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 11:23:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qscPf+WoLPzPYje0Ml8qKcmqgJ2678vvESevHA/ssxfp60TmLI8v4Fm8LTwh/trkX8gMknQGtmXBI+CeXNnAVCoPVB9KSNLkevO48HXJIS63SBw+opEHLoujleSzNBVfYA2aRFJvULN3SgY5lW/fsvPa95XkvkmyIMf+DjOP98bs0OfBEWGHtEXCVYbXy+jtYBQdi71rJUuZbSQYEd/gKDBa0y3MWNDh2OPmpHftJAjNoiKeKybXtNH2GUYQurtmp3bWPV75U+j73Xv2uQhf/cUClhmjjMUbtpGXmbQGCSW6KS9GB3DQdnEklakFoP3SHx9kPplxYTqFdMvuqiXK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hy37dviZGMqPov860M80EHveo3FlAvnMBTGyUGRAPE=;
 b=dy4KXET4ovyjx5J4OwTxHRBRlJqPBnSvmq5a2uZ+jZX4gDn/LHmBON5kwFwNMg6FG8uKV1w/VbEXgReBa6PYrMZgz3KrmlDhfA6kL79vHb7DedL90UjE15RL864J39sFMhTVsOZjTFqZIxGy9DcNcDzSzlGCRdZUWLuP6nn7ODe+WPBHtv++GReBqEoha5p0VNTStDM/dz4Eu9w4Xi+3LGMtzWtWInG09yfX2HCVlecqsLOD32ufC4LEAWsEoxzRIVZwd/vG5WJgmnVpvkdZMnBQgN18orOzJy+5K5kLyS7slK+3DptaXOdbfh8hzhIlo7HHQoQU2ztG9/FUZiAbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF6CF64E2E6.namprd11.prod.outlook.com (2603:10b6:518:1::d2b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 18:22:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 18:22:56 +0000
Date: Thu, 29 May 2025 11:24:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 19/19] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aDimXEhce5BUR7+J@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
 <aDegZWGbMc1pNw5V@lstrano-desk.jf.intel.com>
 <1d9199e9-bcaf-4755-9ce6-d9b6bfec2bc0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d9199e9-bcaf-4755-9ce6-d9b6bfec2bc0@intel.com>
X-ClientProxiedBy: MW4PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:303:83::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF6CF64E2E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b30d5f-ccda-4383-b587-08dd9eddd5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVRxVHhMV2dLY012OW83UnA2ZXRzdkMza1A1U2JqTlVqOWJxTkw4RXpRTU5k?=
 =?utf-8?B?amhxUVBGSDJBTnhDOWQ5UEphdFpUTklSUVlxZmRLNlcwQjJrNDBrbkR3RWFW?=
 =?utf-8?B?M29Wei92VDZ0R0xhWG4yMjBNRmhGN2xWOEt1YVhOb0pBcGZEeUo4Slh6aG4v?=
 =?utf-8?B?cnA2V1ZvRDFSMGxvd1VldUR4aGIzSEVZdkFHUXhpV0NpYnk2MCsxVytoayta?=
 =?utf-8?B?L3ZVQm9NM3NuTlVvdmd2SCtTUDIxQ2hBY2Zab2QyY2YvUWNNUEVpMkRTbFlQ?=
 =?utf-8?B?blNkY0NrcXpYbVVuNlpxQU1heGdNRkFqbGZTYTdXWUNTc25jNU5zMkxUbVZz?=
 =?utf-8?B?Q0NMZklNeDJSMDJMUGxXWFdkYUp2cGVwUlc1VDNNRVBzZk9OU0FWeVVYWFgw?=
 =?utf-8?B?eUFldkZOSXFLOXdvbXlHZ2RkSlczZWl0S0FUd0YvQ0NadXlzd1B0OTlUeUll?=
 =?utf-8?B?czhaYWhDVnZ6RmIzaGJENzByVjE5c3J0djB5L0RDL3RzOVovamY4UTh3Njdm?=
 =?utf-8?B?VkoyTm5jYjFZb2tDZlFFOG54RnIxT1pxNE82cmhLQ1RqMVlQUHF2WldNdmVH?=
 =?utf-8?B?aXRqanlscVB1akxjRnZ3T2VzQmpPZlRhdHBOZW5vWHRNOGI1T2E1bVdXWEZR?=
 =?utf-8?B?cDFoVWZNSUZIVVhmSUdyZ2FZY09UQ2FpUkhwK09GMFNyTDBCaXVzb1lvTktI?=
 =?utf-8?B?SXFtamNFM1Z1WmxvOHNYYzZnVkgwdk5yTmxKNlNvTi9qeXlJOSt0bnZJNkNB?=
 =?utf-8?B?YStYMDVKMHh2R2N4TWNuZmc4L0d3Z1daY0VNR3R4YnUzMCtXNmhKdjZvRVU3?=
 =?utf-8?B?T0YzZ3o2eW03N0xYYXlHa0liTXhsTGEyMzlaRnVJUWdnTWc0UEJ2TGhJQ2JY?=
 =?utf-8?B?NlRXN3NwT3Irdnp4WlhIOWgwM0dXVEZ3azM3cDFjUWNYc2daOERPVFJmdFh5?=
 =?utf-8?B?a2t0YkpJNWFoais2clVxSjRUNlhLb2xhVytXb3l1czMvTjdFMzVuRnZnZ3J6?=
 =?utf-8?B?K2NjTEluS1d5VVc5aUtaQXZrSjIxSkcxN3RZK1NCdlpUOXRwTWdoTmdwVGNU?=
 =?utf-8?B?UHFiR0pmV21DSSt4Und4b3NuRG1DWEw1OTZKVzlldFFTWW5jWktwa1A4Mi9p?=
 =?utf-8?B?Q2hrUGpxSjZkRkxIaW5YeGVPUC9MSlVMNHN5MXdjWk9oVHF6RHV1R2tFY1Ex?=
 =?utf-8?B?UE1rc1FVcWNZWThDSXhINWhlUEpCQTBzUVNrYUxIS0xOalJQU3FBQUtReFp3?=
 =?utf-8?B?L2pPcUlOSHo4dkQ0N1NjOFlZeWFJaGtLNzVSYnh5OGZ6aEVYeGViTms4NENq?=
 =?utf-8?B?cmd2UVZaaXRTR1AxcEZDTis0TXRvcWFoQ1h5RW5CdkdzWE93SStOdnQwOE5J?=
 =?utf-8?B?eXYyYWpiZmtMQnpuY0JwSnJYdmZWeHl2WXZaZ0ljemszc294aGdZRkl1Q2pE?=
 =?utf-8?B?RzlQUVFVUU9FWlc4SkhqK2w2Q1UyZk1HeU5HN3pLanNja3d6ZVRJYWdtTGZs?=
 =?utf-8?B?UmxJWDVEcnByU0xWQ3dOelBFRjk2ZEZDczBpeXlhV3R2UVVxbHZDREREdU12?=
 =?utf-8?B?YzAwaWJlT0ZrOW93RHlueSs2NmhWMzV1am1rTXc1cU1acHlZNjErdEJUaFdF?=
 =?utf-8?B?ODNoTDFsZXN4QnFpbEt2VHVnK0ZFQlhlbzZtMk51K1lHS2JGdS9GbnZEUEtj?=
 =?utf-8?B?VGxLb2tyZnExRHpEMEYxQjVkUnU2cGRZZFZGU295b3JLdEJYTjNEWU9CL1cr?=
 =?utf-8?B?YWUwTGIzdk0yaUEzNm44a29IVTNrMGU5b0w3THFHOFdsN3FSTTEzN2x1VnJ2?=
 =?utf-8?B?eGxhZWdsQ0wrUEhqUlpPbExZckx2dzRPa1VmQ3E1QTR2WWM1Znp5dDhlbkla?=
 =?utf-8?B?ZTlDQk5hSEZWeCtIS1JXSkNONXZES0VtOGEvRkttaUhVZE9uNVJwWXZJdjNR?=
 =?utf-8?Q?QxRAgI6csHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWt5OWdoaEtyMVlKTW1laXN4d3F1UjlPa1ZmVzBTMzFtQmhlbUVDYlY5Qjhn?=
 =?utf-8?B?bS9SL1dJSCswd2NBTVNCNWlITXc2RDE5TTdFZ2M2MTh3bE96UHNOaVFtVU41?=
 =?utf-8?B?UkZPNHpVUXFQTjBrYWhIVnZCRjBxdWtQVDZZRi94TXJYbkk5Und4SDc4cXhw?=
 =?utf-8?B?Tm1QNm1qSGNyMjFNTkxBaEt4dDcrMVN1eUo1N3FWWlVEWnh5L1pVUEUwTlV1?=
 =?utf-8?B?b1hxenJjbFU1enZ3Y0xxQlUvVWgzd2ZtTytTcjBHY0dIdHFkaTl6WFlFb2JK?=
 =?utf-8?B?T2ZBVWUxZXh0VmtSREQyMkRHZFVXbnFDSGZBMnhPV3ppMUlGZVBIU3FBWXNi?=
 =?utf-8?B?ZkF2R1lTbzVvSTVSUTA4NFFPR1ZXNFptODhSRWF6YUFsSXlaNngvd1RzUGZ6?=
 =?utf-8?B?TEhVVjJMRlRTNzhOU1kzOXZpeWhnMXZwV1Izcm9BYzVvaW5VL0o5bXRzOXpZ?=
 =?utf-8?B?VkRJM0l6ekNBS3o1cm5xQU11UjZSSStESElCMmU0U25lL05QSWdUakY4SEdP?=
 =?utf-8?B?dFdlV21iVVMrclQvN3lBT3F6LzZ0cnVYRCt4a1RYMnlFVGI1bnpTSEJvY2dW?=
 =?utf-8?B?S1FVbEdVZTBnNWxMNzgwblkveWVmd2NyTmw2MDNJdi9lR3B4T3A5RkNlcWUw?=
 =?utf-8?B?bTJWckVwTWRkdURhZ1QwL0daL2x1OXNTemQ1ektFNmFmUXpCazMrZGVJRkZ1?=
 =?utf-8?B?THZzUmNicGliTXJtRW5jMjdWZVF4Q0tkc3A0N05zYWV1UUlrUWRwSU0zL1lV?=
 =?utf-8?B?d0dVZkRVTENXZ0JDcWNSS01oVklBTFN4aE1EaWpyZVJwZUNsTkJqQlBHZFlK?=
 =?utf-8?B?TExtTTJHV2xRbThVdWhUVXJOaGR5U1ZRZk1zbUxsdTVhNGpqaG9zVlRYV0Yw?=
 =?utf-8?B?RFhnT216ZmNTSkQyZ0dvWEZuYmdJZkJVci9lcEQyeXhFZm5OUmVzODE1eWQ2?=
 =?utf-8?B?QTBCdk9EUkh3aG1jbk1yWko2YjVuMXNaTEJMVy85VjVjRDBlbUFtWkovUHhF?=
 =?utf-8?B?OElMWVZpdHh0R29mdFFuT3JnSDhCc1FQY0VjYUl3T3B4THhCdlNmWmsrRXkr?=
 =?utf-8?B?K2hHbHJrVDkrNUd2MUMzZkFnbEdnWm14bmV0d3JtUlVYOGpUZXNWY1Nzc3VB?=
 =?utf-8?B?dDRhMzkwRUVXR0JYTHF1MzNBaW5NU0JXZHlZTDNCMFpBem5vR2NPTkxxMUw0?=
 =?utf-8?B?MmYvNDNrK3BuRVcwM2RtcUdXUlY3LzVhZ3dmeUdTdHhPZ3Ewd3pHUDBYTTBz?=
 =?utf-8?B?YitoS2lEbmFUNWVncmFIU1B6cHA5aHA4TWNONmhyYkJoSlVZaWQzaEVHaXB5?=
 =?utf-8?B?TXVtdHdVdzU1bTJFRjBFWVVkZjlORzZzQVJ6TnJEVi9IOVRtayt4dS9lejhW?=
 =?utf-8?B?NHZZK2ZlNFhTa0svRFJ6M1A4RisvRURNbXRua2pCbVpHaXJrMXVyZjBiUjV6?=
 =?utf-8?B?L0dpZHI2QmhKd3NkM1dxd2VWZ1l2OXVqYnJob3R6Y09qbUc1WTFVT3cvM05x?=
 =?utf-8?B?dWJTeU9wa0Mvbk5IekRmZytFN3ZPdDMyNGYrYW1OTVBIdnllaHFnNzlNL3ht?=
 =?utf-8?B?VFd4UXliNU9nWW1EaXNyQzd4MTRCWlEweThKVURIRVFJbGkzc1FtV1gwY3Fv?=
 =?utf-8?B?NXV0V09pdGdpUjlSNnY5R0dEd3pSZldMNkdKZzk2Q0FQK09rL251MHRLVGZR?=
 =?utf-8?B?eVQzaWhiU241UDZ4TXJwSmRKWXl4cmp3aGhrenJ0SFFpOC9CZWpIc0VEeXVy?=
 =?utf-8?B?aENqN3MrUE8yS1BhVmJYbm5XZFlwbEFpbzg2ZXcxM3FYaGNVclJlYWltTnlo?=
 =?utf-8?B?NHlEeHNGWW9hRXNqK3ZHbkp3d2FmL0lWTm1xNzVQMWNDd3lELytHYW9VZUpD?=
 =?utf-8?B?c201d2l5eUNWUVoxcHFQb2d1Mmo0YndRMDlZQW1oUGJyeEhDR3ZVTUlaVVN6?=
 =?utf-8?B?WWVVT28rNHYvZnBuUS94alRHWkxHWXgvQi9Bei82S3RVeXd2bmtMQWUyL1lz?=
 =?utf-8?B?WUdqWmMwNy9Ra3FYY2o3a01ML3hOTTBKZUZqcnlDaFdhTDFUV1hPWlNkcENV?=
 =?utf-8?B?dHRPLzNtZURCM3p1bXdUZHllS3ZOQm1FNzhuT09LNHF1ZTJRSFUvVVpIRUVU?=
 =?utf-8?B?SGp3QUl0aFZGNGxLNldZQXExMUVaaHVFN284bEdsY1F4NGNCWE1WNkQ4RUNU?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b30d5f-ccda-4383-b587-08dd9eddd5ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:22:56.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGrSQJbjXzLSkrHYr6j3hbBjm5aCTLcQdxbQwGStfXLyAMId0iSo5ZgtyaAUi1qEZ0wjbLlbDjBpFMDSC9x3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6CF64E2E6
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

On Thu, May 29, 2025 at 08:33:39AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 29-05-2025 05:16, Matthew Brost wrote:
> > On Tue, May 27, 2025 at 10:10:03PM +0530, Himal Prasad Ghimiray wrote:
> > > Update the bo_atomic_access based on user-provided input and determine
> > > the migration to smem during a CPU fault
> > > 
> > > v2 (Matthew Brost)
> > > - Avoid cpu unmapping if bo is already in smem
> > > - check atomics on smem too for ioctl
> > > - Add comments
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++--
> > >   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++--
> > >   drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++--
> > >   3 files changed, 69 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index d99d91fe8aa9..9072e8ae3f3e 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
> > >   	}
> > >   }
> > > +static bool should_migrate_to_smem(struct xe_bo *bo)
> > > +{
> > 
> > xe_bo_assert_held, more on that in reply to previous patch.
> 
> Sure
> 
> > 
> > > +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
> > > +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
> > > +}
> > > +
> > 
> > Hmm, this is tricky. I guess this means sharded atomics on BOs do not
> > just work whereas for SVM they do (i.e., DRM_XE_VMA_ATOMIC_UNDEFINED
> > means atomics do not work for BOs but for SVM they do). I suppose this
> > is the current behavior. I think this will need to be document in the
> > uAPI kernel doc.
> 
> Makes sense
> 
> > 
> > >   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > >   {
> > >   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> > > @@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > >   	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > >   	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> > >   	vm_fault_t ret;
> > > -	int idx;
> > > +	int idx, r = 0;
> > >   	if (needs_rpm)
> > >   		xe_pm_runtime_get(xe);
> > > @@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > >   	if (drm_dev_enter(ddev, &idx)) {
> > >   		trace_xe_bo_cpu_fault(bo);
> > > -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> > > -					       TTM_BO_VM_NUM_PREFAULT);
> > > +		if (should_migrate_to_smem(bo)) {
> > > +			r = xe_bo_migrate(bo, XE_PL_TT);
> > > +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> > > +				ret = VM_FAULT_NOPAGE;
> > > +			else if (r)
> > > +				ret = VM_FAULT_SIGBUS;
> > > +		}
> > > +		if (!ret)
> > > +			ret = ttm_bo_vm_fault_reserved(vmf,
> > > +						       vmf->vma->vm_page_prot,
> > > +						       TTM_BO_VM_NUM_PREFAULT);
> > >   		drm_dev_exit(idx);
> > >   	} else {
> > >   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 9611d7ca2bed..1bdf85c12374 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3116,9 +3116,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> > >   		err = vma_lock_and_validate(exec,
> > >   					    gpuva_to_vma(op->base.prefetch.va),
> > >   					    false);
> > > -		if (!err && !xe_vma_has_no_bo(vma))
> > > -			err = xe_bo_migrate(xe_vma_bo(vma),
> > > +		if (!err && !xe_vma_has_no_bo(vma)) {
> > > +			struct xe_bo *bo = xe_vma_bo(vma);
> > > +
> > > +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
> > > +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> > > +				region = 1;
> > 
> > I wonder if it better to just leave region as is and let the next atomic
> > fault trigger the migration.
> 
> Ok. lets do it that way.
> 
> > 
> > > +
> > > +			err = xe_bo_migrate(bo,
> > >   					    region_to_mem_type[region]);
> > > +		}
> > >   		break;
> > >   	}
> > >   	default:
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > index 0f0b94cb43f2..e048eb48826c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -82,15 +82,54 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> > >   			  struct xe_vma **vmas, int num_vmas,
> > >   			  struct drm_xe_madvise_ops ops)
> > >   {
> > > -	int i;
> > > +	struct xe_bo *bo;
> > > +	int err, i;
> > >   	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> > >   	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
> > >   		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> > 
> > Do you sanitize ops.atomic.val prior to this? Also do we disallow a user
> > setting DRM_XE_VMA_ATOMIC_UNDEFINED? If not, then this needs to be >=
> > DRM_XE_VMA_ATOMIC_UNDEFINED.
> Agreed it should be  >= DRM_XE_VMA_ATOMIC_UNDEFINED. And instead of
> assertion will sanitize it here only.
> 
> > 
> > > -	for (i = 0; i < num_vmas; i++)
> > > +	for (i = 0; i < num_vmas; i++) {
> > >   		vmas[i]->attr.atomic_access = ops.atomic.val;
> > > -	/*TODO: handle bo backed vmas */
> > > +
> > > +		bo = xe_vma_bo(vmas[i]);
> > > +		if (!bo)
> > > +			continue;
> > > +
> > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
> > > +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> > > +			return -EINVAL;
> > > +
> > 
> > Note when we fail here (or anywhere else in madvise), we could be in a
> > state where madvise has partially completed. I think that is actually ok
> > as nothing in madvise is fatal as we are just changing attributes. But I
> > think we need to document this in the uAPI kernel doc that if madvise
> > fails, the state of madvise attributes are undefined.
> 
> Will add in kernel-doc of uAPI.
> 

Actually, on second thought, it might be better to sanitize user input
before attempting madvise. This is similar to vm_bind_ioctl_check_args.
I think that would be cleaner.

I believe we can make the failing state stable if we can avoid failures
in madvise_funcs (i.e., by returning void), which should be possible if
we take locks in non-interruptible modes (likely fine, as we’re not
doing much inside any locks) and avoid mallocs (none are used in this
series).

We’d also have to restructure this loop:

for (i = 0; i < args->num_ops; i++) {
	xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);

	vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
	if (!vmas) {
		err = -ENOMEM;
		goto free_advs_ops;
	}

	attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
	err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);

	kfree(vmas);
	vmas = NULL;

	if (err)
		goto free_advs_ops;
}

xe_vm_alloc_madvise_vma and get_vmas would run in the first loop (which
can fail), followed by a second loop that calls madvise_funcs (which
cannot fail). If the first loop fails, the worst-case scenario is that
we've split some VMAs into smaller ones, but their attributes would
remain the same as before the IOCTL.

I think this approach would be better avoiding a unknown state on
failure.

Matt

> > 
> > In practice this really should never fail unless a user is giving bad
> > input or extreme memory pressure and kmalloc fails.
> > 
> > Matt
> > 
> > > +		/* NOTE: The following atomic checks are platform-specific. For example,
> > > +		 * if a device supports CXL atomics, these may not be necessary or
> > > +		 * may behave differently.
> > > +		 */
> > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
> > > +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> > > +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> > > +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> > > +				   xe->info.has_device_atomics_on_smem)))
> > > +			return -EINVAL;
> > > +
> > > +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
> > > +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> > > +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> > > +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> > > +			return -EINVAL;
> > > +
> > > +		err = xe_bo_lock(bo, true);
> > > +		if (err)
> > > +			return err;
> > > +		bo->attr.atomic_access = ops.atomic.val;
> > > +
> > > +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> > > +		if (xe_bo_is_vram(bo) &&
> > > +		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> > > +		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
> > > +			ttm_bo_unmap_virtual(&bo->ttm);
> > > +
> > > +		xe_bo_unlock(bo);
> > > +	}
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.34.1
> > > 
> 
