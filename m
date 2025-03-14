Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E863C28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 19:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBCF10E040;
	Fri, 14 Mar 2025 19:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa2sILi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB4A10E040
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 19:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741982031; x=1773518031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r62yqwOkJsoUfVy5O3aK44+ZH3YKXwxm/g6whd8SVWk=;
 b=fa2sILi7lsQGUrBFMIOfuiB1vF4n3SVNR0SHMWiMYI8F/85e24/LaLft
 UhYKWKAeIW4G4fqO3HuoIRFZPJmd4sLKdquLyx/Rswu4J7S0CS9YnEymg
 Gqzo/nlx4bpDv8e/D66QGmTqzgOTFzpb0n7MgrdlTGBfDoZwHHQjp1f8j
 F+LBgNYfYyPQwgvnXRH0PQ4DIVcJ9QEHMhVqVKqBwN5Plqh1X9+BXLmbO
 JxJojGLtn2oquLpNOiEjKamR0JKYXjayuzRbuSl2ge61Mr1g8bNIQjz/3
 OAbUj3nGJyGKbGW30DTgX4v7CK0jHfi54MeofcQM7fuv6eC+beovA/MxS g==;
X-CSE-ConnectionGUID: 1j52VUmqSGe6gBf4Ai4IHw==
X-CSE-MsgGUID: SSfqL515Te27Yd+5Q/sznA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46795700"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46795700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 12:53:50 -0700
X-CSE-ConnectionGUID: 3LT2bXJvR36KBvJiKd+lOA==
X-CSE-MsgGUID: TXzzMixwRNCg3IjMY68P6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="144557703"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 12:53:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 12:53:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 12:53:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 12:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz42E8g1201tuu51nQs2COrHZqVYnTSPegPuHN22t0jlEnSterQR4r35M/V3LY5RAxfbiLhrIJzj8MKMGBaB170JRBVUP/51rnlxAAwGfp/pLgl92DNJ+ZXCvLVumZeaAxnbdr8spHOnoqXwNFYffIYlEJXqleZgfs+aqd4bqgukd98Svik0Rw6KsDhwfKr9qpjaB4L9Hw98NBgWuG/yCGPD6iGHv8+oTVAl6YHiM/RxuJiiA/UySl0paFMNnrAyLvo/+6pZ48dBilgsDJ5m5m1DD0TmbFet3AUz4s7ENsakytCu6pY4hSbJbgx0x+6fbYPXlZSwBsniBCcorxR6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkVlMkR8u4YswqrU0gPRd8skDppgl/3/3itkeQG+hMQ=;
 b=u9NuNdvBOww8w3jiURhiLjHP3xIQdbiZ0nY6PiTUct0dN5c9Oo7Vl6d9/bq7Re1JjKhUjoIWemMd/HiK6kAaGgewyYYLmy3Zntpq0mFM/8YfhuF3TRR7ihzEjsfevbpuRAsrrjYya4bmwExqlbngzz9F1nnzs996o6RMxrYTJ8wo8lNdDo0gsGCZdp4XLmAPulwZmp4S67sBoV0zhMYGdIu6+OB5innddDZJK4H/SaDYsbWJSgMZMO0G70ySOEUDYIQmMeKNnfNGc5n9TmQX5TOopsmTkNM+radGbgqTwdqR188mBDTyyNgnwxwvm6iYJBKu91k6H68R32+ZfkR0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 19:53:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 19:53:42 +0000
Message-ID: <c9e69619-08b3-44ec-9a37-31d12a2780dc@intel.com>
Date: Fri, 14 Mar 2025 12:53:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Apply Wa_16023105232
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
 <20250313202223.GI3175483@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250313202223.GI3175483@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 435ef737-d4bf-4c0c-b206-08dd6331ec25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTBZRmF6cXJHc3VkKzF6MGhLZUdVQ1hOenF3eXB1d0FhbnVQdzB4aC9PM1dO?=
 =?utf-8?B?MUl2ZG1sUXgyWUVuSTV5eFFoU1JKbnZLMnpiUHBIOE9ubklseEJJUGtyR2VS?=
 =?utf-8?B?dWdSemlOeVRmbklhcGIwR2FscVIza1REM245VG9jRlgvcDA1dE01WEVsNndw?=
 =?utf-8?B?L2d5MVFKblcwOEs4T3liV0hhbzYvbXdIZU9mU1lsVHc5cVFla2YwR2wwMlFL?=
 =?utf-8?B?dC85MnJxZ1JnbDBONVZQbWk2VXBXRVYvaHJIWmRneElBWGxkempnRGRka0hl?=
 =?utf-8?B?MEJDQ0xLNnVVa1owYjFoZC9BUGo1OVMzSVVFbDNSNjBaQUVsSVM2ckIzMVFr?=
 =?utf-8?B?QXNNZmxJd1lMVGpUMTlSK05sVk95cmtvSjdSQld2SEgyWStpM2pjekNNL2V0?=
 =?utf-8?B?VUw5UUZSdGNTRjBiWk9vMEUza05jUzZjVExHc0h4dXZyTFNLd09tZEtiRW8r?=
 =?utf-8?B?bytidm0wMXBvZnQ2Z2c2Y0RNWWtodGtxUmcxY04wNCt6dUhtcTdTZmlqSkUv?=
 =?utf-8?B?azg2R3NwaE1qdmg4b25rL0NPVUVRQ20xOFZ0bnVwRUNEcDIvbXdpT0h3Q2Zk?=
 =?utf-8?B?WkZRVHV0eXBsK1RRbWRsM0Vva0d0MmNwYnEyZG4zcktldS9ocTlBRFh5bXUr?=
 =?utf-8?B?amg3a20xK0JNZnFwZSs5NE1EOVY3S0Q3amh0RklueUJBU3d3c1NDbEhkUnBI?=
 =?utf-8?B?QXNWL3lZaFBTWnhyZ0Y3MDdxbXZxK2YycTIyTlV5Z3EzTW82OS84UmxIUVBR?=
 =?utf-8?B?dnlSMG5pcm1NNkRaRFJ6Q0Zrd3NLTnhZUWJqNVM1dGhQSitvOTBvSjYxcDlP?=
 =?utf-8?B?UVp3QnpwODRlVENqT3d1YUh1NjNNUVBOd1NKL2xmZmhCSUlSUllwREtSdDFs?=
 =?utf-8?B?Kzh1MzJ2NlgxK3NrRTJkYlRrKzZlZ3AwNWl5OG5vcGNxRElRc202cVJ5QnNV?=
 =?utf-8?B?UTNUTjNkOU1GNDRIcmIxNjMzRHZmWDJFUndGSjgvUWdzV2RHN2ZBYjljREVV?=
 =?utf-8?B?Q2VzRElHcG1ERGJaSSt0dDAza0NudXgvL3BmWnRoamovOXk4Yi83YitJMUdj?=
 =?utf-8?B?L0pTNXljeVJmanpoR0p5YnRGdGtCc09rSithZUdEb3R4ODJubWtFeFVGWnBX?=
 =?utf-8?B?RjFMczNiUnhvMjR0eG5WQXgydW5mNFRTQTFneFlaVmQyVWx3TXcwQjRKc1pl?=
 =?utf-8?B?R2VtL2dldzc1aTgrd250U3hsREVHTHdFS1hYZ241cGRRSEZOci9Lck45VmVY?=
 =?utf-8?B?ZTQ5bk5TQ2FqZWJxbk54eHh1VDd3M2Z1NndoWGNneUplT2lnMk1DbzJNQ05h?=
 =?utf-8?B?MnJQb3hMWmVrcTZNdkNLd0NNNlFWbEpuTVJrdHUyWTVkQk5NSUJGdHN0Y3FI?=
 =?utf-8?B?VGlFYkhDc2VCWmsrZjVjSEhZVDIzZkdBY0xMZExQMmNyK1FXZWI0cXBDbGNY?=
 =?utf-8?B?OVJIdzAyYjlzaWtkSXVJY2VxU0dtWFptdktxTjdKRXhSUGxkZU9RQ2M5Lzlo?=
 =?utf-8?B?MXpmVjJXbmUycWZMd3d0RVBuNXMrN0Y3YXRQM1lhWmdqWVVSUXlOdVc0aWhB?=
 =?utf-8?B?Z1MwSmNXRDFCUEtIbXIwZXhZeWRWVnF0Q3dtZ09TMHVWN2JzWDlqZ1hKdmN6?=
 =?utf-8?B?eDduRko1U0VZYjZFSm1nR1FyVnByT1hvb3dRVzhhSVZubkUyWDM3UE1zR3BK?=
 =?utf-8?B?RUI1bUhNNlVJN2ltemd3SnIvVzJ4cE9iZHpWUDNFbGRreG5xWklqT212NjNT?=
 =?utf-8?B?UERraVV5TVpTeVcrbzlxZU1JbmJ2M1BLMTlHUGdqcm1KVCttQ2JnYXpBVDZu?=
 =?utf-8?B?MGlpT1ZXRHVZMUpKa3Rxd0NBNXdXWGNrdHR0VzhKWGZPcW5TY3N3YWNUNHJj?=
 =?utf-8?Q?JcmBedEhOb5j0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3B3MTFwMDErRUhRSnhnaXprbTdFWVY5cHBMcXhEYzQyckRtM2t2UEJoSFhp?=
 =?utf-8?B?WEFIZmxkQW05VDhaSUVSVjRzSm84VEhxNkEySUxvVkRwMUFpUHJiNjdNM0Rk?=
 =?utf-8?B?VWRBVnVwVEVnOHVzK1Y1cTdTY3B4YXFiZUZ2dTVsZFhJQkZZWitLaWVGUW9F?=
 =?utf-8?B?bkxnQ1NEaXBJQ1F1OVRwM0pGZCtyQThhYzFGUmgyQ3A5Y3JOZXF2K1FrbGp5?=
 =?utf-8?B?RmhDdWV4T2t0alY1U1Ezc3V0djhIa1VGMnRwVjJaa25IRXBHTGtUSW82cGVO?=
 =?utf-8?B?MUR6QkVzVHpwYWF4OHFLUkJVZzZWTS81RnRvL1dmNmFVOXFyOFRzRXZSSkhF?=
 =?utf-8?B?dzRsNkUxT0NSNWNOTkowN3pGS2x3ZGQ4QmJ4MjRQa1RRclZlVjhUaUhDZHFt?=
 =?utf-8?B?SXVQbzd0MEtCeFFLYWlxYnRBQ3JwMSt3ZVBESEhMenUzUTNvYjlZbmYzRXR2?=
 =?utf-8?B?c0kybW1rZ1VnSjNGb2cxaEVvRjlsSzI2bVR4V2kxUG5MYTdEdnlSYWY2WjQ3?=
 =?utf-8?B?VW9DMjFCR0Y0K2tHTVl2bDM5VnQzQ1orbWhPMVB1SnRpUDRpS3ZSakg3NUN3?=
 =?utf-8?B?U3pmazlWSktkUGdVeFFXY1NSNUNMVUo1VGRYaER0TkZhRW9tUENrSjk5TXZD?=
 =?utf-8?B?QUY4RE4rRndrNzA4RFZySjBEOG5adzE2OVhRcEFWdU92eEE3amNsMytWYnVn?=
 =?utf-8?B?dmJZQXRGb25vdFh2RXFLNkJZck9QMkZ3S2hTNi8zR3NxQVEza1BMcGw2UkIr?=
 =?utf-8?B?c2RVZDB3MVdmaEo0R3N4UCsrYjZoa2ZSdlo5T0U1ZFVKNFJ3NzZJZ2oxZG5H?=
 =?utf-8?B?QnVDakVtYkt0M0I2cWErZWV5RUE5aktmWDE3S3k2YW1xRno5c0lWTTRIaE5T?=
 =?utf-8?B?ZVZNMDhvc0N5R0NOemMvQkdBNkJ6dDlVZWpPUlorUnFGTHFiOHBSZDl1OGJJ?=
 =?utf-8?B?dkQvaE45QzIvRGlHQjZtcVFJNFpRUXhZQ3BkSnV2VWxiNG9RZGthL0VqOFkw?=
 =?utf-8?B?WXJMYlh1clB0OENueTJOSDdaalFTblplK1FYN0JXeGdqb1RsNVIrSUJLS2Nt?=
 =?utf-8?B?OVZJdmRsazJkVjUxd3BSL1A1Tlk4M01UZmt2ZzVUb2MrZ3FjL0Y4T056cmFh?=
 =?utf-8?B?QUtmWktZN1RCNWNUOEdWM1VnbXBNaG1TSGdHYm93K3RkSnY3VVFtWGJFSU1w?=
 =?utf-8?B?c2tiUnJXeld2ZnhvekVneVRJUjlyMVhMcjBpcFNVZDFSaVNHaFpFZEpFRHJB?=
 =?utf-8?B?Y3EzbTNJT2JBT1hRL2RFWTcrR3B3d3poaEliWDFrdERIZ0RGb0U3MFBzSXZP?=
 =?utf-8?B?dUVlL0hEejVYV0VNTXozMUNvcXYwcE1DS2dZTnpVRFc5ZXdBZmQ1RW1ta0du?=
 =?utf-8?B?dlJYSjdBSzRiNjE5SGd4WUlSK3pjS2ZkUEFlQ2RFSjZYVDkxQ2locVM4VG9w?=
 =?utf-8?B?WFFwK2NybDFaUzhlUkJzZ3JMUWdLdytuKzFhTHkyY1lKMmZzRzhqVms0NFpK?=
 =?utf-8?B?WVZvWWIrelhsZ0lqYlFZanBTOWt1MVBDbmh3YldJamhLOUJTVjk4cnRyeHRl?=
 =?utf-8?B?c2QxZmpibFRSbStnLzRWYWlwaFV5RXNJSDRSRk9hMitZa1JMMkZmcnpHVW8r?=
 =?utf-8?B?dHQwaFlUZkZoNzlJVTZndG5yeFc5K3NlbUEwVDFWS29US09iTTZFc0xqVFVS?=
 =?utf-8?B?OEJ1UEZrd2pNd092N2NmUldDSDg3SlRMbHhVTGlpWUVqdTNWcTlUQ1Mzd0Vj?=
 =?utf-8?B?TWJld3g4SlRYSU9nTkJ2UjBWYXgySGtYMkpLQVRsa09FRW51VXVWV3BUL1Rl?=
 =?utf-8?B?eC9GV2VHa25EMFZibDJybVBuYXpkVy9YY0c1cG5FQ1JmeUpBL05QejhFK2c4?=
 =?utf-8?B?NHVJTHJTNWJ5UzZIMk43RFpOeXc4VTVsSXNZbmtBUG5yem5ycFNFcDVseVJ4?=
 =?utf-8?B?eEVjODFIM0lZYXQvUnF0T3U4MnlUYnNBbi9GSlpvb3RWSjBjZkFjTFA4ekcz?=
 =?utf-8?B?TDZoZWxzTkNacVFqK0pITFNjMXJJOWxWQk1ET0l0SjFEcGhrN290Z2Qvc2lU?=
 =?utf-8?B?aVVlV0Z6ME5KSk80WjVHZ01xWUk0QWJxamg3bkJxZEM0RnlKVGN5SXpaS1J6?=
 =?utf-8?B?WGF4L1FKNTlxaEVYRU40ekxBeWZmTjZabEVjcWNDWUw0dURLVG80ZUFVZCtU?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 435ef737-d4bf-4c0c-b206-08dd6331ec25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 19:53:42.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN/TXX6T00jDvOMldnnRkRlaZA8o3Xqo5znnza1KeXoq0oemloI60SZBxUEF9SUIop+UyhJ/1LCMUu8OGMa5UU4cfUz2QOzzuJSLcbDGKew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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


On 3/13/2025 1:22 PM, Matt Roper wrote:
> On Thu, Mar 13, 2025 at 11:04:40AM -0700, Vinay Belgaumkar wrote:
>> The WA requires KMD to disable DOP clock gating during a semaphore
>> wait and also ensure that idle delay for every CS is lower than the
>> idle wait time in the PWRCTX_MAXCNT register. Default values for these
>> registers already comply with this restriction.
>>
>> v2: Store timestamp_base in gt info and other comments (Daniele)
>> v3: Skip WA check for VF
>> v4: Review comments (Matt Roper)
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_clock.c         | 36 ++++++++++++++++--------
>>   drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>>   drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa.c               |  6 ++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>>   6 files changed, 67 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 659cf85fa3d6..05658ad991f4 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -130,6 +130,8 @@
>>   #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>>   
>> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23c)
>> +
>>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>>   #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> index fca38738e610..f493b1687851 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> @@ -16,27 +16,41 @@
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   
>> -static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>> +#define f19_2_mhz	19200000
>> +#define f24_mhz		24000000
>> +#define f25_mhz		25000000
>> +#define f38_4_mhz	38400000
>> +#define ts_base_83	83333
>> +#define ts_base_52	52083
>> +#define ts_base_80	80000
>> +
>> +static void read_crystal_clock(u32 rpm_config_reg, u32 *freq, u32 *timestamp_base)
>>   {
>> -	const u32 f19_2_mhz = 19200000;
>> -	const u32 f24_mhz = 24000000;
>> -	const u32 f25_mhz = 25000000;
>> -	const u32 f38_4_mhz = 38400000;
>>   	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>>   					  rpm_config_reg);
>>   
>>   	switch (crystal_clock) {
>>   	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
>> -		return f24_mhz;
>> +		*freq = f24_mhz;
>> +		*timestamp_base = ts_base_83;
>> +		return;
>>   	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
>> -		return f19_2_mhz;
>> +		*freq = f19_2_mhz;
>> +		*timestamp_base = ts_base_52;
>> +		return;
>>   	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
>> -		return f38_4_mhz;
>> +		*freq = f38_4_mhz;
>> +		*timestamp_base = ts_base_52;
>> +		return;
>>   	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
>> -		return f25_mhz;
>> +		*freq = f25_mhz;
>> +		*timestamp_base = ts_base_80;
>> +		return;
>>   	default:
>>   		XE_WARN_ON("NOT_POSSIBLE");
> While we're making changes here, it might be worth improving the warning
> here to actually print out the value we got.  If we get bug reports and
> dmesg just says "NOT_POSSIBLE" without telling us the bogus value it
> received it makes it harder to debug what's going on.  If we pass the GT
> parameter to this function, we could also use xe_gt_WARN_ON so that
> we'll know which GT (primary vs media) it was that caused the problem.
ok.
>
>> -		return 0;
>> +		*freq = 0;
>> +		*timestamp_base = 0;
>> +		return;
>>   	}
>>   }
>>   
>> @@ -65,7 +79,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>   		check_ctc_mode(gt);
>>   
>>   	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> -	freq = get_crystal_clock_freq(c0);
>> +	read_crystal_clock(c0, &freq, &gt->info.timestamp_base);
>>   
>>   	/*
>>   	 * Now figure out how the command stream's timestamp
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index e3cfb026ac88..7def0959da35 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -121,6 +121,8 @@ struct xe_gt {
>>   		enum xe_gt_type type;
>>   		/** @info.reference_clock: clock frequency */
>>   		u32 reference_clock;
>> +		/** @info.timestamp_base: GT timestamp base */
>> +		u32 timestamp_base;
>>   		/**
>>   		 * @info.engine_mask: mask of engines present on GT. Some of
>>   		 * them may be reserved in runtime and not available for user.
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 223b95de388c..4b8a54c16ac7 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -8,7 +8,9 @@
>>   #include <linux/nospec.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>>   #include <uapi/drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -21,6 +23,7 @@
>>   #include "xe_gsc.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_ccs_mode.h"
>> +#include "xe_gt_clock.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_topology.h"
>> @@ -564,6 +567,29 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	xe_reg_whitelist_process_engine(hwe);
>>   }
>>   
>> +static void adjust_idledly(struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_gt *gt = hwe->gt;
>> +	u32 idledly, maxcnt;
>> +	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>> +	u32 maxcnt_units_ns = 640;
>> +
>> +	if (XE_WA(gt, 16023105232)) {
>> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>> +
>> +		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
> I overlooked it on the previous revision, but it looks like we're using
> the full contents of the IDLEDLY register here rather than just [20:0]
> that hold the delay value.  In practice things will probably still work
> out properly since all of the other bits except for 31 are reserved and
> probably 0's (and if bit 31 is set, then we'll probably satisfy the >=
> condition necessary to rewrite the register.  But if this workaround
> gets extended to future platforms, and those platforms also add more
> non-delay flag bits to the register it could mess up the logic.
>
> So we probably want to use REG_FIELD_GET() to extract the value, and
> reprogram the register if the IDLEDLY value is larger, or if bit[31] is
> set (since that effectively means "infinite delay").
ok.
>
>> +		maxcnt *= maxcnt_units_ns;
> Similarly, we should probalby do a REG_FIELD_GET() on PWRCTX_MAXCNT too
> just in case something else gets added to the higher bits of this
> register in the future.

Ok, thanks,

Vinay.

>
>
> Matt
>
>> +
>> +		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
>> +			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
>> +						    idledly_units_ps);
>> +			idledly = DIV_ROUND_CLOSEST(idledly, 1000);
>> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
>> +		}
>> +	}
>> +}
>> +
>>   static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   			  enum xe_hw_engine_id id)
>>   {
>> @@ -604,6 +630,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>>   		gt->usm.reserved_bcs_instance = hwe->instance;
>>   
>> +	/* Ensure IDLEDLY is lower than MAXCNT */
>> +	if (XE_WA(gt, 16023105232))
>> +		adjust_idledly(hwe);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>>   
>>   err_hwsp:
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index a25afb757f70..24f644c0a673 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -622,6 +622,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>>   	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>>   	},
>> +	{ XE_RTP_NAME("16023105232"),
>> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
>> +		       GRAPHICS_VERSION_RANGE(2001, 3001)),
>> +	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
>> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +	},
>>   };
>>   
>>   static const struct xe_rtp_entry_sr lrc_was[] = {
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index e0c5fa460487..0c738af24f7c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>>   1508761755	GRAPHICS_VERSION(1255)
>>   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>> +		MEDIA_VERSION_RANGE(1301, 3000)
>> -- 
>> 2.38.1
>>
