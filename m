Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21B0CE7B1B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 15:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411110EAB4;
	Fri, 14 Nov 2025 15:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzdzsJqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E9F10EAB4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763134583; x=1794670583;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+xGoO3JCsTRxB5JNJ3B/3I/PjJxX5bSqlKdFwO5FmWM=;
 b=LzdzsJqAk/N/Yh9EyWmtOOhr60sXHlTxFlY7jVydg483SdLSbF91fsGw
 F3Ye9BVd5HEMrS+wSoj3JSKTAZKNFJegk1xLb/9pnzMCg1up45YFudVtf
 eJi3kbTKajlr7Kpj+NP+OLZD7FdeKS7suBa/TQ2KTV7NAN2lLuy5C4riW
 Yx/qIMasKJYvJT5vdpUljQdMwlHTbX2r75QoGqLsqdjYClVnRHLVCnXk5
 1rURBhyXMpssOhqLc9a03/iKqGi+eCsZobk6Iji3j/YrdkwGGMkehv6TH
 +zW+Rs3k9w671NdRRXrVmfM/diUWy3P4AhXJeHiqZZ8VPG5Er/QmWOqYA A==;
X-CSE-ConnectionGUID: z+cfSuhmRU6d8mf3700yAg==
X-CSE-MsgGUID: aCcmIJsfSV+H7Gc/bg026g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75911049"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="75911049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:36:22 -0800
X-CSE-ConnectionGUID: 2wJrno5cQXGvX3QwSg5NIQ==
X-CSE-MsgGUID: YL+gHKaHQsWqv7JyC2lD0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189452804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:36:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:36:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 07:36:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdjWc09P4BIAL0vxOvTiH00ykIoTd9R3TjQnRu7Udv6EKty6WhkosXr33PccdM0Uv+/TRIC//TyVsgJKleM5dSDgJdxvZ5hl4zWT73Pi1rKXVOFbpREcL3sT/1ZYEKNg5bpN8UPRFL8BHyXpILBYomid8SeT45tuydo2/BkXN2yKV2txIm1IbZ1rGY8n0UZ5bWXsO2K7tX6p8kfD+nfRmeGEGVPWqRizNq5iIJjOLrkHz+HN4XNcjuRma/GOCSdk7tAP3TcmjVy8AxBRHlcYxfpCJCMJK4RGLVFCwvNp+H04IoETLZkJeueTSdSZnZqkVRyZ1mwRcOlPpYwQyIwAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzsIRUb1GJbOM0Zuovdy0IxHCNqPaa5rwV3+pY/pD2Y=;
 b=BIeGljc0ha1NJqAuhzQrGXOUvfGdyd8lft5C8sgftwBDm1nmWARWjMNn/kzEBwXR8VmKPZmPMa9Pskw2aEUyyp078mttr1nCyYHqoPNaj9hbxTHUB1PguigPtMnBLSxAqH2J39KhQbpejbvQRHtnOUFqJv/AqlXWVBCgteUpy+Dmb6u+4hgE/E9XXdGlY6BvZFS1GEkGs2ZNqzmpfEWPNL0IsTuwEMFUONL5Uw36Bg5Sp7x0gAt/Y+aVcyxPZ/cJN4cN2I4RiIbs3L1nOUn45pCmsDUMO0SFtIzIZmv0QnxkXptySHbxJhHGvSs7FRmrZVJzgvP/NcOqCqu7VbXdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 15:36:16 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:36:16 +0000
Message-ID: <330bdaa7-05c4-4ff3-ae58-6e25fc6457c6@intel.com>
Date: Fri, 14 Nov 2025 10:36:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/uc: Add stop on hardware initialization error
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
References: <20251112234453.1871032-1-zhanjun.dong@intel.com>
 <95a3dd458fd57ff11513a1e5682b40c295a42d0c.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <95a3dd458fd57ff11513a1e5682b40c295a42d0c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: e4985466-cccb-4e84-2e91-08de23938ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y09qWVF1ZTdYSm9GUmhtMmlKZjZCMU9YWlppSXFOd1ZzUk54RjdTVmhqOSt5?=
 =?utf-8?B?eGlYcGF1MTZoNmYxNjNqeEhBVWxHcTEyS2huVmVQWllibTZkZ2l2Q0FHZ3Ny?=
 =?utf-8?B?WHFBWXQ0aFdvM05yZUNvQS84dFowb2xnOHN6MmtRWndCRy9UeXJDUFFGcUlQ?=
 =?utf-8?B?OTlpeUc2ZC9xUXo1VmVLbDA2T2pMQ3BuRzhBQnE1R1dLSllHSkxLMmJRWW5l?=
 =?utf-8?B?NWtwU0lENkpIbUNESkRqTmFhRURHRlV0TDRmUkJjMnFEUzZUQm5zaVBvOHYx?=
 =?utf-8?B?NWhacm5UNlJ3K014SjdWUVBNdmJHUkp2aUhPU1E2RmR1elNVWFJZb3ozMUJi?=
 =?utf-8?B?M09ObHpaVFFrL1NMYWFIRHZqWTl2dDlpWlE4YUdmbFNIZ2F6a3JnclBsNnMv?=
 =?utf-8?B?VUpxdWR1eENHQzhQK1BXRHFRcVhhNGJUOENZNGdUZzZITXU5MmxXUEJnd0JK?=
 =?utf-8?B?aWVoNWc2NEpqQ2h1VTZaVk1tQkJ4WG5KQjYvV0pFODl5MEp6T1diL3RZcTF3?=
 =?utf-8?B?U05HMnBHclVLbnU4NWs3dDlsUzRIVnNJbjlma1Y3a1dsbm1VcUt1K0N0OFVo?=
 =?utf-8?B?cUU3eGZ1ZjdHTC8yL3NTdCtLMGNrNDRtL3BkVmVxUG15R1lPdlJrM2hSemdK?=
 =?utf-8?B?cGpCVzlqTHo4R2Rkc0ZCRm1oZXlFRmF2TE9hLzg4N29UNE11Yi9wcWN0NTVJ?=
 =?utf-8?B?NHVNS0J4dDYxQXk0Y04vMFp2TTc0RnYwUjFRdEtzUnNpSXRMQzFYNU9VZzlp?=
 =?utf-8?B?UFlSVjZKTittSjZWSXhVcUNrR1hKZnlnUDEvTHV0U3BoblhnVVdKUmFjdnh3?=
 =?utf-8?B?QmVJb2U3a1VwSmRKcW1nWHpuOWRIM0FsL2QvUnRwUGZqNTFjZFc0anNjNTRm?=
 =?utf-8?B?WHp3UDV5UUk2aE5VVCtKRFJoempyZmlZc211anVzMWIwd2FZSHgwTFMxb3VS?=
 =?utf-8?B?NHZlbEEzalVGbXJNQVVHWVZ6OVpSYUlVR2NIN01KY1Z2bmN6dEZUb3ZCYjJY?=
 =?utf-8?B?bSt2SHNpWFRLa1IyckVsWEMzWkp0ckhDMjVzS2FVTS8vbWVrRzlHRHRjM1J3?=
 =?utf-8?B?SU5kUDdqV1ZnZ2pCb08zbDNWS3NzSVRva2FzSTN2NnBwN0YwNGVjcmxyUURB?=
 =?utf-8?B?SFZvUzljdHpEN0ptWmsvbWVGVStzeUJiOUVFSkxZd3dLTmhDajJweElXMGhr?=
 =?utf-8?B?Zm50M0c4VlpJdHExNHJRQUlBKzN1Z2NkS2xjNWlVWHdqN2dvaWxlSVBuMFRa?=
 =?utf-8?B?ZjNrak9uRVBHdGtQYklMYVpDOThrMWdUeWdQTjdkS0Via25DQUFTNFN5dUpG?=
 =?utf-8?B?RjBlL2NoSXFjQ2ZuOC8xV1Q5NXBmbFhQc1k4YTU2cWxQNTNRNGo5QkpDcWtJ?=
 =?utf-8?B?d2VZM2tYWlBFNDdTRVI2aWZidmRxakU1OHcxLzlTbnZaSGFGQU4xOHc4cDdw?=
 =?utf-8?B?eFBIR3FlcndBZ0VnVDk4MUVxU0ZzcERINFNOMEVrai9OZ1FOMElzeEVjTlN6?=
 =?utf-8?B?NVJHVm5SMi9OZFdrbmNsWkNrZWFkdmY0SGVsNlhkanZwOTVYNGlRUzhROVI5?=
 =?utf-8?B?TWUvQU1qb3hHOE52OExUcmhsa0p6NDRpSjNpZzlWZ3RQSlRMeEdTMmg5ODVs?=
 =?utf-8?B?UzU4NkNkcXVud0RNcXZJYTJVR3hZS2hlYzlZRjV6VGhGMmw5a2hIZmhQUEVN?=
 =?utf-8?B?T1lJSUFZRDk5SW82endNc2VyeDJGNUxiUlQ3amVSczJrdnl6UmU4b2sxZTgz?=
 =?utf-8?B?bThsdkEycDc3TGZnS1BGZE9CYnZ3UU55UWJOUFpjMVR6ZFJiWVhJS3FCbDVr?=
 =?utf-8?B?R3cvRXVYWXNyNCswUG15WGFRUkFvRWZGcUd4SEwwZmxoWWg1T3FxOFpLdzcx?=
 =?utf-8?B?RmF1a25PTzA2a0VpdHZOTXB4YXFyRjlGcStFcVh1QlNnTFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjF2OEhHdm5id2pOdFhiRW1iYVBtUk1yUm5OdkozbHFSWm81WVNaTjVVaW8w?=
 =?utf-8?B?bzRYR2NCdTdlQytLZU1yRFNVUElFODhXaUpqTGo1YWcyVURPOWNJM2xnQWRt?=
 =?utf-8?B?VFRPbjRGSzNpU1ZuZjMzOGEya3JvNkNUNFVlUnpaQTRTQnArcEtvMjRBZ3Rx?=
 =?utf-8?B?TkVsVk1pVkxlV2piNlRSUnpHYnFoeWZtS3JSQUNPQW8rbkszZ21raGlmUytY?=
 =?utf-8?B?SENDRVp6V0p2QUM5R1FBQ3M4VjB5ejNpL0lTbkxzV29kaHk3MTdlZTJUNnNt?=
 =?utf-8?B?emlEcEJOZkljbHpxNTV6UGpBU0x6WnJlQzY2WnkwUUhGQ1liSlVkcTI2Sm5t?=
 =?utf-8?B?T01iYnlBVmtXWnJpWVFhUVpBcUxuMUVDcGxCSHNPRzA2M2ZPeXVLTUZ1eEtE?=
 =?utf-8?B?Y3BHWjYxV1FjSVBqekFXbjQxVGlJN1h6YzdteXRDa0Q3VTFnVWhUZ3F2b3Bh?=
 =?utf-8?B?dnpoaEJqM3ZlV1Y5SWFSeFova2c1enJkZHZ3ejVwSEQwdGdLU2t4RGYyWmFL?=
 =?utf-8?B?RVRZZVR6N1ZiOExpZHdtZzZuQUw1Y0M2ZXd1NHR6TkxaV1VUTEtnYWc0d0tp?=
 =?utf-8?B?bnRUWWRhb1YzcjBHUGRtQXE0WEpsYnovanBEQ2JMbjhLdnV0STAvMXNNYWt2?=
 =?utf-8?B?R3NkWXB1ejJrcHpRcmtLZGdVZ2U5UTlPZHdnNkQxSEFGVWhPckdUcFZ4dnNk?=
 =?utf-8?B?ZnZaM2h6Q0dEVjBwdEYrdlFtbEZhUjlvNFAzTU15a21INXdUQStYUXpHQnpJ?=
 =?utf-8?B?VVdLUzE1Z2VxaFJldVk5UllGMk1oWnZUV01RY2hsdEpNUEx4aFFLaUZVbmtE?=
 =?utf-8?B?czFicjdnVndISE1ielp6RVh1dlJMeTg1OGR4RXI5bW1WeEY3WUptU1gyNnI2?=
 =?utf-8?B?d2VEeStwaGk4cmFTOXgra2E1SFo4RHhiVnBxaStXL3JwVkJQV3lkZ1BOcGNM?=
 =?utf-8?B?ZFFqMWZEbWxWYnJibThmWWJyYWFzNnJaV0RhaUR5UWV6M1lTTWdLbytqWWJK?=
 =?utf-8?B?RVp5M0NsR3dPV3YvV1VzMkRmK2FqNFpIemQ1MGsybjdocVdyQkkrUkRWdDg5?=
 =?utf-8?B?N2pZRlEyOGFlR3h3R1NzRDViR3hZZDFwYXlxUU1JUDdUeGZLOEpVUVAzeWlt?=
 =?utf-8?B?K1VxRThDOFBnSjBQTGdQeVI4WktlYkRPdDlkdjN5aXNtOFhsRTRSWTZNMDNQ?=
 =?utf-8?B?RjBsVDRDa255Qjh3QnRPSFRCTjN4NTFkK2FrdUxXakVRelhYMWdBOE0wUndI?=
 =?utf-8?B?eHA3bGp6NTh0Nld5RER5d0djaUxaV3NNZ1gxeC9aT1RxNEdOTk1Mekp2MEJO?=
 =?utf-8?B?NnNuenlSWXRod1lrR0xNTkN5b3ZIa3o2ZkxhdFBHK0c3d1dWdHc4VEhtRU13?=
 =?utf-8?B?cnFqWERqVE1iWVdmdms3WUtQUFh2TzRMQ2Yxa05LZGFQLy9EaVNYUk9aZHpL?=
 =?utf-8?B?QkZ2ZHM1em9LVlVHd2cyeGhKdnVaL2lIcFlKS0pVNnNJeHY0eks2SmJVS1dt?=
 =?utf-8?B?RWdlZU9VZ2hnUnZnTWFHTzdMNzVIZHJyUG54NVEwTWJmUEd1QU5FbjZ3RHAv?=
 =?utf-8?B?QU91cWwrZVJUZ1pYMy8xV2NwU09Dd3NySGNMZkVLUVRkOW1LcXMzN05sVGhs?=
 =?utf-8?B?MGxsbFpMZGVVbVM0aHFDQytMQlIrZzFvVVZiN0MxQzdTU2tQamJ5Rzh0Q1pw?=
 =?utf-8?B?aUFFdGdza3djQitNYUh1U2NpMUZaaENTbGRaRUdWUjE2aUNuTXRVQTBxRUVo?=
 =?utf-8?B?U1cybmwxZXhrem13aXRRampkcDVRbGNlazJwSnBmVXVxV1IwUklFU0JkbmFn?=
 =?utf-8?B?YkgrZmR0enpibmhDQkVpRzc1ZkxSUzBlKzI3a05TN3R3MEZRb2Fyc1orR3Zq?=
 =?utf-8?B?MTc4ejhKM1MzVlBnbnVDSEw3VzJYOVR6Sk5zQTBhbFhtZDVDZXgwRVdGaFVH?=
 =?utf-8?B?WFE4dzFOeDRqNVIyMmF4L3plbGw5NHYxK1ljd0ZCNHhMOHlld0h2OTJNdkJI?=
 =?utf-8?B?MDBjNlY2U000VjFGV3lTeTBmSTQyZUFLWk5RTmxSNkg3dFE4RVhkUkhVN2li?=
 =?utf-8?B?R3VHTXd3ajE2Mm5hSzdoVVdIZklGSGJVUUdWZmlCN2ZwTlErNXFtRkphSnU0?=
 =?utf-8?B?UkVOYWJaZThtQ3JjcXhHYVpkRUdxdnF1b3JIdlBOOHVwT21jUW5rNUdCczdR?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4985466-cccb-4e84-2e91-08de23938ce5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:36:16.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh7/YR8VhI7TQ5N1JbFcXN3dgKDwqlo5Ihz3opNF+6s/s+hqt3A2sUrP0FN2udOK6um1vzEEWJZOjqcZunvKZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-11-13 6:09 p.m., Summers, Stuart wrote:
> On Wed, 2025-11-12 at 18:44 -0500, Zhanjun Dong wrote:
>> On hardware init fail, the hardware might no longer response, add GuC
>> stop
>> to clean up exec_queue items.
>> At driver unload path, add call to GuC stop to clean up queue items.
>> This
>> clean up will fix memory leak issue like:
>> [  189.997904] [drm:drm_mm_takedown] *ERROR* node [00f0f000 +
>> 00007000]: inserted at
>>                  drm_mm_insert_node_in_range+0x2c0/0x510
>>                  __xe_ggtt_insert_bo_at+0x167/0x540 [xe]
>>                  xe_ggtt_insert_bo+0x1a/0x30 [xe]
>>                  __xe_bo_create_locked+0x1f3/0x930 [xe]
>>                  xe_bo_create_pin_map_at_aligned+0x59/0x1f0 [xe]
>>                  xe_bo_create_pin_map_at_novm+0xae/0x140 [xe]
>>                  xe_bo_create_pin_map_novm+0x23/0x40 [xe]
>>                  xe_lrc_create+0x1e4/0x17c0 [xe]
>>                  xe_exec_queue_create+0x38a/0x6a0 [xe]
>>                  xe_gt_record_default_lrcs+0x117/0x8b0 [xe]
>>                  xe_uc_load_hw+0xa2/0x290 [xe]
>>                  xe_gt_init+0x357/0xab0 [xe]
>>                  xe_device_probe+0x403/0xa30 [xe]
>>                  xe_pci_probe+0x39a/0x610 [xe]
>>                  local_pci_probe+0x47/0xb0
>>                  pci_device_probe+0xf3/0x260
>>                  really_probe+0xf1/0x3b0
>>                  __driver_probe_device+0x8c/0x180
>>                  device_driver_attach+0x57/0xd0
>>                  bind_store+0x77/0xd0
>>                  drv_attr_store+0x24/0x50
>>                  sysfs_kf_write+0x4d/0x80
>>                  kernfs_fop_write_iter+0x188/0x240
>>                  vfs_write+0x280/0x540
>>                  ksys_write+0x6f/0xf0
>>                  __x64_sys_write+0x19/0x30
>>                  x64_sys_call+0x2171/0x25a0
>>                  do_syscall_64+0x93/0xb80
>>                  entry_SYSCALL_64_after_hwframe+0x7
>> and:
>> [  189.973775] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT1: GUC ID
>> manager unclean (1/65535)
>> [  189.981731] xe 0000:00:02.0: [drm] Tile0: GT1:       total 65535
>> [  189.981733] xe 0000:00:02.0: [drm] Tile0: GT1:       used 1
>> [  189.981734] xe 0000:00:02.0: [drm] Tile0: GT1:       range 2..2
>> (1)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> v4: Add memory leak fix
>>      Switch to xe_uc_stop
>> v3: Switch to xe_guc_stop
>> v2: Switch to xe_guc_ct_stop
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 3 ++-
>>   drivers/gpu/drm/xe/xe_uc.c  | 2 ++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>> b/drivers/gpu/drm/xe/xe_guc.c
>> index ecc3e091b89e..b4c9673f84d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -661,6 +661,7 @@ static void guc_fini_hw(void *arg)
>>          unsigned int fw_ref;
>>   
>>          fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +       xe_guc_stop(guc);
>>          xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
> 
> Kind of a flyby comment here, but it doesn't look right that the
> encapsulation is all over the place here and in the later functions in
> this patch. Why aren't we calling xe_guc_sanitize() here?
Very good question, here is in xe_guc.c, uc is higher layer, so calling 
uc functions looks like cross layer design. Well, this out of scope of 
this fix patch. Let me dig into this later and might have another patch 
to change it.>
>>          xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   
>> @@ -1598,7 +1599,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>>   void xe_guc_stop(struct xe_guc *guc)
>>   {
>>          xe_guc_ct_stop(&guc->ct);
>> -
>> +       xe_guc_submit_reset_prepare(guc);
> 
> Shouldn't we just call xe_guc_reset_prepare() from
> xe_guc_stop_prepare() instead to keep the ordering?
Yes, should call xe_guc_reset_prepare here.
But I found an issue and this code might be changed.
To be clarified.>
>>          xe_guc_submit_stop(guc);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 465bda355443..6c72ce305d6c 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>          return 0;
>>   
>>   err_out:
>> +       xe_uc_stop(uc);
>>          xe_guc_sanitize(&uc->guc);
> 
> And again, why xe_guc_sanitize() instead of xe_uc_sanitize()?
Yes, sounds like should be xe_uc_sanitize, again, out of scope of this 
fix patch.>
>>          return err;
>>   }
>> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>          return 0;
>>   
>>   err_out:
>> +       xe_uc_stop(uc);
>>          xe_guc_sanitize(&uc->guc);
> 
> And here... In this function above we have xe_huc_load() as well, so at
> a minimum it seems like we should call that here. But IMO we should
> just move this to xe_uc_sanitize().
Yes, sounds like should be xe_uc_sanitize.>
> I realize most of this isn't directly related to these bug fixes, so if
> you agree, happy for these to be in a separate commit with the
> exception of my comment around xe_guc_submit_reset_prepare() above.
Yes, let me dig into this later and might have another patch to change it.>
> Thanks,
> Stuart
> 
>>          return ret;
>>   }
> 

