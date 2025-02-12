Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BBAC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 05:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67510E250;
	Wed, 12 Feb 2025 05:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGnP13W8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9FA10E250
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 05:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739336514; x=1770872514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=elNTqeQOA6lg5DahlEQ16v8pLHyDm1ACLIyMFntzMEc=;
 b=IGnP13W8ZrwHfieOi+7oPn1NcjvMaG/505aXME/pkUvLNNDvI+gIrFVV
 xZ/f4w8araHcnqGzNk2oB/9/aqZz6cZB6bAs5RPW3vZF4+bZvbyiAFf2a
 dlPcDE85EEbw1C5wn0mQV1LV4tjwFSJkxB4mxURvOxOGZbAVgUY3I3aBQ
 iVwDLxuRvGCB8eV3IpigI+zf1klsXu242fiNttpK4LL8QXEbicE1uIOoG
 KGYSOKj9XTvEvYDtbfo9eeknXw7M06BqmJ3COndcTG9g3ImvJiDXO1VJc
 hbrR4ICpXDtA88gOq6GWL7R5NMUF7G8efWrNSePwGwfzJ1/vZuMj7r+GQ A==;
X-CSE-ConnectionGUID: kF6wZ3LOQk+VDR8FOuM+rQ==
X-CSE-MsgGUID: yBwFxHImTTKmzWxgTz3xlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39169798"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39169798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:01:54 -0800
X-CSE-ConnectionGUID: XR22DAsFSXOudKLFhInoug==
X-CSE-MsgGUID: sZKbQqP6T76tNUFfZ0Lfkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149895718"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:01:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:01:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:01:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:01:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGuuo+gCdaYiRa0DDh/Q5RvMfJlkAGvCQw3qVTEdYBuLLJTPs7GUfNlYk7CJkOPeFTVSk5BlhoIRV87NiF1wPgcreaTXcWDvYq5KhrlSZMdn9QIGn6qb/hZzx7HZHpVDomvuKJieWYxGOYCHCU0jXCOmmwMQ9BMaDAgTvEYvfJwvD/qsGNURkqsDB5z1fiX5orZtSFYk2ibMsG4uRhUdRdQPVR5mLCGTzX7R+T4EzuxRxfbZQX6MyLt9/Z+aZjd+exPAkFdKubHGkmBtfCJTIt1tArQVRPPC7/Vg1uVfhRaLwyOkxRF1nNtNgJerkhRaZrf345OaNwL9TWZrLZd0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g5r8tpJrcad0znBLGIGH22rDwxElJEdp+4uwFNGCT8=;
 b=wT0spIHEYvufk3Lb5LPjBC4qPScHvbIZzUAL4VFYpVmIcEfnIQq5CGhczB6Wl7plEAmVNiqRyATalaYNv4fG8Gj126sjhESaSwhSaP7trWNpwCbKAmxaeCsIZVRMxQYw0YjgUpf8v6qZI4kQnP/S0n0U6gVvc5x4ra+D6JPOWwWSV/2MzvilkU/1Ffvhz7TsxecVxC5nSFZs1uOn0RcZj7Da8rMkzaHpq/HECdPbyuLY/x9jk7RoMkEiHjxVqAvHt0TsClX2g/wCkWbMJ7KmA9qSNp5AwVcogUPgBgXVvVzMCRw0tgij8fgv/M9moiRy4msEeiwXlCLxahZ7LUHM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 05:01:08 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 05:01:08 +0000
Message-ID: <bec80391-7bdc-4063-b9d1-2cb6125af322@intel.com>
Date: Wed, 12 Feb 2025 10:31:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
 <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
 <71fed9a8-b8e2-4a38-bf2c-c328eb2d4673@intel.com>
 <Z6aXw52sdI+3KnyT@orsosgc001>
 <31dcd451-70b1-4142-aad0-2cea371f8d2d@intel.com>
 <Z6uJ7KEtAwPmqpsL@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z6uJ7KEtAwPmqpsL@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 47666022-11a6-4c0e-6e86-08dd4b2242ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWFkQTl2K0JTeUh2MWE3VGg1eEdZbE5EdFROM1JiNTF3bEdPSGIyTFBKVDU2?=
 =?utf-8?B?aXVOQUovTmMvSTkwZXA1ZC9BdmZSWGJvZWF4b2dxRHRPd3Q1V0FFbmN3RkZp?=
 =?utf-8?B?WjRWNk0zVERMM3FxWnEzYk1qMjlZRUIxRkRMRkZIdVRSTXRMMXpaejhUc1p4?=
 =?utf-8?B?TnAzVndPZ0YyUjhwaEhzUThaaDQydksrNkJSNE5nN3ZJY2cyZlhoTGRnS2xj?=
 =?utf-8?B?QnpZbDhoS0FVR2J5NkhXNmNvVE1na21Pb3kxbzF1TWRSTGIyYWlONGNLSzlM?=
 =?utf-8?B?MWJ1Zk5OV2VNZFdTRUpNZlNEOGVTd1pmd0lHOWh1SVVwaWg0U25NWk50UGZ2?=
 =?utf-8?B?NTBVUzZQaUNid2FZbk5oVitVTUtFcitjVW1ueXMyOHBTazc3MnVXcHJWVkZo?=
 =?utf-8?B?dXZZamJHZG9MRVI0TGM2K1ZlTmtoOHRYcFpRVlA5VDlmNVJsZStLM1prc2I4?=
 =?utf-8?B?OEo2SEo4VUExcFBLdUFQM1U4OGFESXhWM2hpRlN6cjRvTDBwclBOZmxrdXQv?=
 =?utf-8?B?RWtFZmpuZERFZjhNOUZOMWFtM0hYOUFVVGd0TUZUT3Q4R1YvSG1oN2syOVJI?=
 =?utf-8?B?TXI3M2F3dU8vU21xbDVHaVV5SVZEait4bEh1UzV6eUpSa0xiSlNJZXN5T0JN?=
 =?utf-8?B?QUNKY3MrRHZlVW0zN3ByUGw0MVB6SVdFMHJvU0RwbHZ4ZG51MFM1akdyTThD?=
 =?utf-8?B?UDNUa2hGTHpDSnk2ZHA1WmdpbWJDVjlBZTBOVDRkVHYrU1UxNjFuamxqZTM5?=
 =?utf-8?B?UkI4cExvc3BnVXJRakFWdjQ2UkdoOWxZNSs2T1pQbUdaa25wS3cwWGtlcWpU?=
 =?utf-8?B?RzFONUtGanI2RGkwR2tiQ2ZDTDNIQU9OaGNVL3hBcFVKelFYQnpQbGliSCsv?=
 =?utf-8?B?dUFmTFptdWtLYkdtTXBNSklyRHAvRVZwNXFGUGZlTUNCcUF4UjdiVktrS3pz?=
 =?utf-8?B?WTlWTk1zNFF1T09qN0hrL1BTZGJyR1BibkpsM0RHMWZWdnFDVmF5eDBjSFY4?=
 =?utf-8?B?dEx5dWU5T21zNERYL3U1RkFYOWxyU1l5Yk5McDlDdzl1cXJ3M3pWTWZ1S29N?=
 =?utf-8?B?RDVoVFYwREVvQm16OWJTOUtZZVFzNXQ3WHZKaEVrdUF3V091MVJLSmR5bWc5?=
 =?utf-8?B?bUh4U0JpckZGQkxabUgwZjdiN0ZxTm9aa21kV2ZhaWFDTk5DbGh2bVpaTTFu?=
 =?utf-8?B?bmpidjcyWnJyK0g3SkF3TFhWVUtPWGVFc28xdE5wb2tySHVwT2tGSGMyb0NJ?=
 =?utf-8?B?dHkzcUpLNW9jNE1WK3h5ZjFLSzEvSHRPK2x2aEFYdk9yNUNCa0NCSVZqMDBU?=
 =?utf-8?B?eXV0YmIrUndZTFIzWHZFQzhOT3BYcktCQzFpd05oT2JYWmozSUhaVnV2dkg2?=
 =?utf-8?B?bU41SmlEWS93eVh6UTdwby96YlYybnVOWGlrcVpnOWg5bkREbFgvSzVibitm?=
 =?utf-8?B?RlZqWU5iNi81SVYzYlZhd203Q2doSXFuSVY3VzVTUzVDSWg5RjJrRVpvcldX?=
 =?utf-8?B?UXlaMkMxL0NGUWNlc3B0dlhjM2VPV0VDNndUeC9XS3JUZVFtOUpwSnhKUUtH?=
 =?utf-8?B?S1kyZ28ya0U5S3FsSXh4YUpYN0IvSEw3OGF1dnA1RWFaUVhSQ3RKYUhGWVpt?=
 =?utf-8?B?UHR6bmttL2prSXMxQkhaQ1JRT2thTWp1QlVLdktoNC8ySEZKeDNRV1pxUFlV?=
 =?utf-8?B?OUtjMXorbkhUK1FYK2x3M2pqMFdHbDludk15UXpKdC9OVzkvUkUwTlUxYTd4?=
 =?utf-8?B?VytkeEp5dHdRVUZHVU5icGpoVTFVSUhyY2plSTJVYWJoS2JLeVFXc1V1d21R?=
 =?utf-8?B?dFEycVd0d1h1eTRuQkY3eUsxNFNBM2tTZStSMjIvNFFMaGw4VmxpWlp4bXZH?=
 =?utf-8?Q?Y2lBBXEaOuDHk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJIejZXbVB0YUZ6N1hzYXorclFkVlNkbUR1ZEFqbFBTNmNaSUtDRzZqa1RX?=
 =?utf-8?B?VThZOTEzREN6YzltS01hNEozWndjUy9XNjZUbklOcmFFeEJzQmdyMDQrM0lj?=
 =?utf-8?B?bDFyZlZad2VLWFNFOWlqUnM3emRCU2FvRzdyQkpLbjZIWHJQZCtTYWZoOEFu?=
 =?utf-8?B?c3F6b0k1TUNyRjdlTjUrMFAxRjcvdzE3Qjg4RWdRcDY2cFRKbDhIZTd6K1E4?=
 =?utf-8?B?MVFMY1RVWG9lVDZHeDlMbEZFaXUxOVZscmJ5YldFSHdoSllsaWk1UVhmeWNX?=
 =?utf-8?B?MzA5eDFISGM5V1grQktaU0VJVS9DaFhuWkxKclZEY2Y1ZC9FWHcxT2VFYy9L?=
 =?utf-8?B?bFBXeGxwZW8rYzFtOGozaEphRmJ0azBhQjA5eEVRVkFkMUlMZjdNR3kwQ1l3?=
 =?utf-8?B?WE9hOEdwNEdHRExJaUY1TWpYRHNSV3ZCMXVoS0xRSWloZmI3U0ZEeEMvMjVF?=
 =?utf-8?B?b0dBWEhKQWs0RFBUZzd1MEpOY0lFRm1NbGRrME03bTZQZDNGd0RQdWZ6K21K?=
 =?utf-8?B?YVVWUnRacUNnUTl5UjJpR2JubCtWR1JDWXVmNnI2OU1VbXNEUG1ucmp2SUov?=
 =?utf-8?B?L1d6OFYvSEM0SWpPcmpib3NENHBTcDJ5QmdSRjBWMktBWTVCVFFKakVMbzJM?=
 =?utf-8?B?b2pPd3ZpbVZHNWpTZjcwVFg5ZzgxbXE2aWhTb0Q5UzJXR2xjNWhHVGtBVlYx?=
 =?utf-8?B?T0kzekE0R1J5djVqSmFsWUllVGxIS3ducmdtbGxOZUduQTBtT211WW9tU1hC?=
 =?utf-8?B?bHQrOW1wTDhsTTFsa3o3TUJUZUQvWmQxa1V3NUkwNkNmenVxRExKai90b08r?=
 =?utf-8?B?RGZDRElMdHc5UEkyb0dlZDVQdHlsSGl1OE9SYStMd3pFbEFBRE5VaWZtNFJ4?=
 =?utf-8?B?ZlNENWlJZkozVjBkVnFtOGQ2dksvQjIxeHdSbmFnaEVLaHVncmJwWHo3WjVs?=
 =?utf-8?B?cktyMi9TWXhYMjBZRmxla1YxQUVwZnBRZytmY2k5V2E5aVl6MXJLNCsxdkNY?=
 =?utf-8?B?aThINzdPVC9ScnhEa25HS1M2WGZJenlnU0RaS2RPT0dxT2VsaFpFcGZVOHhV?=
 =?utf-8?B?dFJROTBpVjhPeFRMdkdMQ3k2cWcyWWZqU0ZFTHNPQm1jOE9Pb1QvTi84cDZH?=
 =?utf-8?B?STgrWGhBUUMwQ0N2c2J1NEprVGloekQ3WDBpbC9VVFNkMk4rWEpsYUZnNmIw?=
 =?utf-8?B?dk1aTGNWN2tONlVDMkEvVVdpYzFjOVQxNjM3ekJGVjYybG5IajlMRlJoTDZU?=
 =?utf-8?B?RmJVRmFkeWFmaFRuTUVXaHFBTTlJb1JIVHYvQjNneHpyQU5tUVpaL01TdC9j?=
 =?utf-8?B?ZDMvNHBXdEdCMDhXcE1PQUd3WDJpN281Zm1BUFhKaExtYmMzcHhZMHQ3c25m?=
 =?utf-8?B?NUlzQkh0dnpyV3NRK2hqTkFpL1FLT0RYSEdNL3IvRkcydU9hY0hkQUdyai9Z?=
 =?utf-8?B?SWNnbER6eTNGOGdNOUg2bFZlQUYvM3BaeW9tSWNoTXVGdGtUV01iT1dxNlRX?=
 =?utf-8?B?d3BEbElLaVZKWmdCYVhDYjhCQlMwM2U0cmoydEpEV2wwM0JzMVZsaWcxeld0?=
 =?utf-8?B?Y2wyOFBQMklDaGFJMTZNVktnd2VObUx4QzEwZ2sybC9LUmJJVjVOU2tTTFgy?=
 =?utf-8?B?bHJtQ3hzNEpOcGZaUTJYNG5rT0tocVNUdDJNMGQ2djNtR3pkd0thZzlVRjNH?=
 =?utf-8?B?MmVPUGszcGk4NS9TYVorZmdjZnFEU1VnNDZQZWlNeFFTTkdxa04zS1p2TWRa?=
 =?utf-8?B?eXZwb3lNRHhGMnN3U0JJdzdmMHFRK3p0bWVma2tGNG5hM3hZUHZUcGpKSWVR?=
 =?utf-8?B?NDk4ZHZ2YWEwNE1jTmRlZ2Y3TXRJSGJYNEJENXNQL2VoZzFJZnNrZGVwMmZN?=
 =?utf-8?B?SWtpTG82VlNXNG5PUllUOU1aajVUd2hFaG4vVkZSOUF3NGlPWjhuTllmamZD?=
 =?utf-8?B?c1ZaQlNWSkxld3NDOCtlVW1PSFNvZUtnV1ZRK2x5T28yTktpTDdmKytRUkVk?=
 =?utf-8?B?cHdlbzZ3aU9nMlU3R3VwSzVOZ3RQWVVxaEJDWU1GcXNJcW01UzlPclhxaStE?=
 =?utf-8?B?dXpoUiswaDJCZlZRbVBQSmVjMTRUTCtoMERFU1JNSE14N1psbElMOUlRM3Jl?=
 =?utf-8?Q?dkiygIi1jIUWHXUvrTjOMoHW1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47666022-11a6-4c0e-6e86-08dd4b2242ad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:01:07.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pePgX8EYAt5RUVOdvVhwT2KcOEZGhkFFIm68ZpNmF91WG2YeUb5ehDL2HegKJLHqmRnvxLng1eM6Xz6pspqW9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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



On 2/11/2025 11:03 PM, Umesh Nerlige Ramappa wrote:
> On Mon, Feb 10, 2025 at 03:50:00PM +0530, Riana Tauro wrote:
>>
>>
>> On 2/8/2025 5:01 AM, Umesh Nerlige Ramappa wrote:
>>> On Fri, Feb 07, 2025 at 12:21:24PM +0530, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 07-02-2025 11:48, Riana Tauro wrote:
>>>>>
>>>>> Hi Himal
>>>>>
>>>>> On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
>>>>>>
>>>>>>
>>>>>> On 06-02-2025 16:13, Riana Tauro wrote:
>>>>>>> When the engine events are created, acquire GT forcewake to read gpm
>>>>>>> timestamp required for the events and release on event destroy. This
>>>>>>> cannot be done during read due to the raw spinlock held my pmu.
>>>>>>>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/xe/xe_pmu.c       | 47 ++++++++++++++++++++++++ 
>>>>>>> ++ +++--
>>>>>>>   drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>>>>>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/ 
>>>>>>> xe_pmu.c
>>>>>>> index 06a1c72a3838..5b5fe4424aba 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>> @@ -7,6 +7,7 @@
>>>>>>>   #include <linux/device.h>
>>>>>>>   #include "xe_device.h"
>>>>>>> +#include "xe_force_wake.h"
>>>>>>>   #include "xe_gt_idle.h"
>>>>>>>   #include "xe_guc_engine_activity.h"
>>>>>>>   #include "xe_hw_engine.h"
>>>>>>> @@ -102,6 +103,36 @@ static struct xe_hw_engine 
>>>>>>> *event_to_hwe(struct perf_event *event)
>>>>>>>       return hwe;
>>>>>>>   }
>>>>>>> +static bool is_engine_event(u64 config)
>>>>>>> +{
>>>>>>> +    unsigned int event_id = config_to_event_id(config);
>>>>>>> +
>>>>>>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>>>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void event_gt_forcewake(struct perf_event *event)
>>>>>>> +{
>>>>>>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>>>>>>> pmu.base);
>>>>>>> +    u64 config = event->attr.config;
>>>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>>> +    struct xe_gt *gt;
>>>>>>> +    unsigned int fw_ref;
>>>>>>> +
>>>>>>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>>>> +    if (!gt || !is_engine_event(config))
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>>> +    if (!fw_ref)
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    if (!pmu->fw_ref)
>>>>>>> +        pmu->fw_ref = fw_ref;
>>>>>>> +
>>>>>>> +    pmu->fw_count++;
>>>>>>> +}
>>>>>>> +
>>>>>>>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>>>>                   unsigned int id)
>>>>>>>   {
>>>>>>> @@ -144,6 +175,13 @@ static bool event_param_valid(struct 
>>>>>>> perf_event *event)
>>>>>>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>>>>>>   {
>>>>>>>       struct xe_device *xe = container_of(event->pmu, 
>>>>>>> typeof(*xe), pmu.base);
>>>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>>> +    struct xe_gt *gt;
>>>>>>> +
>>>>>>> +    if (pmu->fw_count--) {
>>>>>>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event-
>>>>>>>> attr.config));
>>>>>>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>>>> +    }
>>>>>>
>>>>>>
>>>>>> Considering that fw->lock will be acquired and released multiple 
>>>>>> times during the put operation, this might create an overhead.
>>>>>>
>>>>>> How about implementing a _put function that can take the number of 
>>>>>> refcounts to decrement as an input parameter, similar to 
>>>>>> xe_force_wake_put_many?
>>>>> Could you give more details on your suggestion? Would put_many just 
>>>>> decrement the count? But wouldn't that still require a lock? 
>>>>> Multiple event_destroys can call the function at the same time right?
>>>>
>>>> I was thinking about putting all refcounts at the end of last event 
>>>> destroy in case of multiple pmu's.
>>>>
>>>>>
>>>>>
>>>>> One thing that can be done is to take forcewake on first count and 
>>>>> release it when the last event is destroyed in cases of multiple
>>>>> pmu being used
>>>
>>> Unless there is a measured inefficiency, I would recommend not 
>>> refcounting this in PMU. If a forcewake is already taken, the code in 
>>> forcewake_get is just handling increments and not really accessing 
>>> MMIO, so we should be okay here.
>>>
>>> Also, pmu->fw_count is not required, since the force_wake_get logic 
>>> should be already handling that. We should just call get and put and 
>>> this should be good enough.
>>
>> I added the counting because if forcewake get fails then destroy won't 
>> know if it has to call xe_force_wake_put (multiple perf opened). If 
>> there is count and ref set, then can be called based on that.
>>
>> If we can return -ENOTSUPPORTED if forcewake get fails for engine 
>> events, then the above will work
> 
> Hmm, not sure I understand. If forcewake_get fails, then we don't need 
> to call force_wake_put. Also if force_wake_get fails, we should fail the 
> event init (which means the destroy should not get called).

Yeah this is what i meant, since force_wake needs runtime pm.
Have done the above in v6

Thanks
Riana
> 
> Thanks,
> Umesh
> 
>>
>> Thanks
>> Riana
>>
>>>
>>> Thanks,
>>> Umesh
>>>
>>>>
>>>> This sounds even better.
>>>>
>>>>>>
>>>>>> If the overhead has already been considered and found to be 
>>>>>> acceptable, I am fine with avoiding unnecessary modifications to 
>>>>>> this patch.
>>>>> This is the first rev for this patch. Open to suggestions
>>>>>
>>>>> Background for this patch: force_wake is needed to read the timestamp
>>>>> register required for engine events.Cannot take it while reading 
>>>>> the register from pmu_read due to a lockdep splat 
>>>>> (PROVE_RAW_LOCK_NESTING).
>>>>>
>>>>> The suggestion was to take forcewake throughout the duration of 
>>>>> event being read
>>>>>
>>>>> Thanks
>>>>> Riana
>>>>>>
>>>>>>
>>>>>>>       drm_WARN_ON(&xe->drm, event->parent);
>>>>>>>       xe_pm_runtime_put(xe);
>>>>>>> @@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct 
>>>>>>> perf_event *event)
>>>>>>>       if (!event->parent) {
>>>>>>>           drm_dev_get(&xe->drm);
>>>>>>>           xe_pm_runtime_get(xe);
>>>>>>> +        event_gt_forcewake(event);
>>>>>>>           event->destroy = xe_pmu_event_destroy;
>>>>>>>       }
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>> -static u64 read_engine_events(struct perf_event *event)
>>>>>>> +static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>>>>>   {
>>>>>>>       struct xe_device *xe = container_of(event->pmu, 
>>>>>>> typeof(*xe), pmu.base);
>>>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>>>       struct xe_hw_engine *hwe;
>>>>>>>       u64 val = 0;
>>>>>>> +    if (!pmu->fw_count)
>>>>>>> +        return prev;
>>>>>>> +
>>>>>>>       hwe = event_to_hwe(event);
>>>>>>>       if (!hwe)
>>>>>>>           drm_warn(&xe->drm, "unknown pmu engine\n");
>>>>>>> @@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct 
>>>>>>> perf_event *event, u64 prev)
>>>>>>>           return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>>>>       case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>>>       case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>>> -        return read_engine_events(event);
>>>>>>> +        return read_engine_events(event, prev);
>>>>>>>       }
>>>>>>>       return 0;
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/ 
>>>>>>> xe/ xe_pmu_types.h
>>>>>>> index f5ba4d56622c..134b3400b19c 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>>> @@ -30,6 +30,14 @@ struct xe_pmu {
>>>>>>>        * @name: Name as registered with perf core.
>>>>>>>        */
>>>>>>>       const char *name;
>>>>>>> +    /**
>>>>>>> +     * @fw_ref: force_wake ref
>>>>>>> +     */
>>>>>>> +    unsigned int fw_ref;
>>>>>>> +    /**
>>>>>>> +     * @fw_count: force_wake count
>>>>>>> +     */
>>>>>>> +    unsigned int fw_count;
>>>>>>>       /**
>>>>>>>        * @supported_events: Bitmap of supported events, indexed 
>>>>>>> by event id
>>>>>>>        */
>>>>>>
>>>>>
>>>>
>>

