Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB6C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 05:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155D910E004;
	Thu,  3 Jul 2025 05:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpKIGw3R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878910E004
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 05:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751520529; x=1783056529;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o3Y/EttxjRcT13ObO0O6e8j0MCypjXQYEesf0cDV3OY=;
 b=SpKIGw3Rr9BGyXS8CN6GYVxcyy2mjMxU2RSQ2T2mBijXt7uSPLnFfein
 Vlb7C3kSdhP6g6U9lNgmJzISmLuLrC31XNwbkKEgar73c/xZfA+izIFgJ
 7D281Jdu21xhpxe69wfl5xKtFIfxoAmIQ8GAep1X3c9fYPLsqAtLmVPCl
 WGwPe5iXwldg687n1694tFE/AkXchnw1kezBOt9PLUfTrR9p2JGnsqUQH
 iSm2G1v2/dzcpXpHoLjpeoa4sM3wIU62enUfW6kUajOq+lGcQ3FFqCuW+
 DD28f8jUVOXi20kMZwO9aO1XaBFKlKBgcn7KSFWzDqmzEazCFPcbYaMy/ Q==;
X-CSE-ConnectionGUID: 9Pyrfol9Tx+klD5rrImKzA==
X-CSE-MsgGUID: 2izKAWZBRiuHFntPn+Fs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64429567"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64429567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:28:32 -0700
X-CSE-ConnectionGUID: A8FCPhQBQsmKakL2E5KY7g==
X-CSE-MsgGUID: uvilo5acTfaL33s9evcCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154835773"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:28:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:28:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 22:28:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rccj7A5cp+yE46k6sX3jqU6HUzsnYPLaVtwNknGhzXjRITzYTIg108SLMkaKSBI9B7sfAl+UJmz8MFhrgzpmhEgMAoP1UvqC8RSOFMwZBWvmx0rLcNg2vtY3HkpYPUktLyTqzxe4n6mvdixlavzRWTROy5lDJ0WQAme1pwWCng2vZQs/6GaLSfXExCO7w9L4e/Xgq/vicgV+9cSYBf3BySsKnhLz2sii3CW9oofbgz7QDC/r1d401BD9nLw5YA2vYBxQw0dP+o7iduS5DtkQE/ObTjQOqC9uLzAVxJbNbedZ1RUKZRZ6ol+hjnlI3p9pXlBX6emTHgewAwflYrDseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTGyRCrnq18cdSM9Pj9WvYT7Netf7YrRDDW9XtieBcE=;
 b=H0vdWIQEHVQyZsYhCdYF+duVzIXEexD21i4toBUOLvhKcxJXYrP3xHtgpXp0hcKABWgbnUUxEl4vllQMKtEJnt6o/vl/c96y/lpTFLcfwe52jqx/kjll7iAStc5pKj4B1rCpb+omAF3k4kHgdUp+6gsnqmoMyFQ0JePnrbOpXFhd/7vJWDTwv+ngvSkVY91XZXJvGe6NNmXTx8xjZdiBxaN/6jz5G+KVOe7Ur1B0KSQ+GRgA+uBASB5j2bePJQcWiiQFU0OlyA8kncF905DiuADmuekV3EU3Ij+QJWZzUuXs/ATQ5q/qOZdPz8WK/OBvdzu3G0hlA12vAc5GBVSZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 05:28:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 05:28:21 +0000
Message-ID: <d2ec50c5-b3f2-46da-88c1-f29d3ea3a20d@intel.com>
Date: Thu, 3 Jul 2025 10:58:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-7-riana.tauro@intel.com> <aGWmJwgk-VLYxxp7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGWmJwgk-VLYxxp7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de56c31-8a6a-4cef-29ad-08ddb9f26c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXhJUk1GRUhxY213M1hqaFdXQVZOZzV0TnhDR01YM0VNWlc1RmxzVXpTRlVv?=
 =?utf-8?B?UThiUlRDQmkyVlk3NjFvd29jbG5XeFo4VWlCc3krQk4rSW5mMXFXem9RZmdM?=
 =?utf-8?B?R3RieEVXZGF1NXg5dEd3dHlwNzdVUUJKOXhWOHBkZWQvZ3d0MDdXR0tSYUE1?=
 =?utf-8?B?akpnTGxOVnFZLzc2aGZFUmZpeHVwanFhNUtMNytiQTFpaXVydzNRYkNVaURY?=
 =?utf-8?B?ZFJZbXRJMTNIRG5RTSs1cTRhTGJOVTg1L25KN21Gajh1bUJrSmJ0ejVpRFpm?=
 =?utf-8?B?Sys0V3pnNmpJWTJWbjlTZGdVZEFrbG0zMUFyMm5YUXhpRWsvZUI5blowcnV3?=
 =?utf-8?B?bEo3RjhBVzlZVDZKckd1MTc4Y0tWR2Nuakk4Zzk4b0xubmN0eEI2Sys2cnlM?=
 =?utf-8?B?Uytaa1kvY25tNm0wL0lHMlhBa0p4RXBHMFdFZEI3UmxjQjg3clpJcEw2aUgz?=
 =?utf-8?B?T2ZLYkhlbXl2OFQ2cXlsR1h4OXNEZkFHWHZrN1hhQm1CR0ZVOUFBRTVmQnJX?=
 =?utf-8?B?eWptUGpLVDZ3Z2IvdkZBUjFJbUg2OGk5YW5kWlB2RTRYQ1dJdlE0eVd4S1c4?=
 =?utf-8?B?ZE1kL0lYdk8yVUlGOWhuZUFYc2djdjB0dFhNK0N2OFVUQzcyZ3BCcVJnRjlR?=
 =?utf-8?B?VVoxTHBVK0psKzAvSUNpSXh0T3pqNnY4MWlCYjByVEtvRXBqQll5cE9PeGlu?=
 =?utf-8?B?OFRmaXBNSWlKR2MxOGV3dXdOYUhXUlVYaS8wK2tyNzFBcGxxQVhRNTRGeGZr?=
 =?utf-8?B?TEE5ZlU4MzhFdnd5N0hWMS9keVhNV09GSnFqZ05DZ1M0NnZ0OTlCUlkrdjdZ?=
 =?utf-8?B?ckwweXhQZURFNUpiYXNjSGk1L3RGOWpZdGdDSTNtUDFLdnFMMXRPam4wK01Z?=
 =?utf-8?B?SkFaODdKUmR5cmVjU1ppWVhqSWhxdzVnS21CNU00N3o4WjI5Wk5PdXFXMTJk?=
 =?utf-8?B?VmxkejZwRFRwWFBXOHgxdU1WNXBhQjZSNElLSlV1QXFpbjVOVTNIMFcvcGc1?=
 =?utf-8?B?ZXZZOEtRV3FPUFh1enU5RE9YUm8yWi9GejlnamtLV3hqWnl0T054RFRlYUQy?=
 =?utf-8?B?ZWp6UTFGTlczb2FTenFjWTlBUVNoUTlmWHZpR2QwbkRRYVp0WVNNbW1YNEJF?=
 =?utf-8?B?eks1QWJzaTZpTU1sczB4cE9SV3dteXZIcGdUNlk0eEZQWW8rMXg3QTgraHg0?=
 =?utf-8?B?eDFMSU95NXZPNHhGWFMwU1UyREc5MXBJZW5raGJqbFk2OStRbmVML3dMak00?=
 =?utf-8?B?SFM4OFR4VzFUQ3JjQjZiTDZUUVJhUXJqUzEvMlJGQW9uR0gvOXVWREV3dFIx?=
 =?utf-8?B?bFRsZ3RJVllCT2xhaEVPcDMwQ0RKYm04b1A5MGR2Qk1TdTVObjJLUDh0aXBl?=
 =?utf-8?B?TXNMVDJCMVp5UVdJZ09wVm14czFRS3hiSVAzR1pOdk9kZER5bHg5NFU0M0VN?=
 =?utf-8?B?R0NSTnU2a1AvQkVxNkpkNEgxRFpEY3FCUVZ6T2pIc0RDZFQvSkdaSURCbThp?=
 =?utf-8?B?dTJucCtFZk1IM2hweEtweHljaXhHS1ErYVBzVVMxblpGcHVYQjZYV2dUS3BE?=
 =?utf-8?B?SkNEN0FOeHdEZERRRkVIa0RDRlNPcy9MOWJCZVVWRmRVcDBPUTcwdzhiR2xI?=
 =?utf-8?B?bzdYYkMxNXhPRzJNTVNoYVVLQjZVMnptQzcyeCtNZ0oyTUM2ZmRKMEU2aVlh?=
 =?utf-8?B?N25tVGZxUWJnbGZjZHdweGcwRTUyRHZJb29USjVVYXZxZGZYdEJJWW9sQUtt?=
 =?utf-8?B?K3czWFhDTGVnVlA2QUNDazhTdS83bTJReHJ2REtpVGFuR2RaS28rMm90blZj?=
 =?utf-8?Q?IoChsDsvCAs+22IygeEYNerGdKIJMk1imhJes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDh6c1RsTWp3VjVxWkJwcGJoeXBwb211MTlpZEcvMWhzMWRtUDEzYTBqdUVr?=
 =?utf-8?B?a3NFcFB2K3poY284bFFYNW1IbnhXVzVHb0RmUWxyRTBSK3drYUpVRWRsOXNo?=
 =?utf-8?B?NmhCWVlKbTRsOTF6aUwzUCtHRTZYMkhIRVYvUzRkYXBPR00rNXhzemFQUFp1?=
 =?utf-8?B?Q093NU5rVkpzdUZIYkJNbjhIcnpTWVJMZFprSlZNbFBFNDlBZUZHNWYrNlBZ?=
 =?utf-8?B?OEJLRTFxbFUyTXRZODQxWC8waDFaTTBDeU1nVzl2NjN0TjE4TTY5WHErcmlK?=
 =?utf-8?B?clROWXFSWktHSm0wTWF4elNBc0YyVkhVaGZhV2tmdlQ5TEpiVW9oK0lpajY1?=
 =?utf-8?B?UjZ4cVJqY3Z2NmxRaCtPUERpNm5lbFEzU3Bla2RBTnFmSHkzVTk0VWFyblBi?=
 =?utf-8?B?NkNTT2FLSDZoN3JjN0tNWklBV0hBbDQyRHhaNXY1MlJiTGtYTHM4cHpKeDVm?=
 =?utf-8?B?cklwOVBGS1ZvYmdBNm1xSnptMjdWZWh2UEhZdmhLclRSenNBVm42QkRYQWp5?=
 =?utf-8?B?aVlsL3g5eDErdGd2Vk5qRjFFZVdTTTJ0TWRTTStRdEdxYVhHTzR5dDdoaURH?=
 =?utf-8?B?aE5EVHBUcmR5UUdYME9tU1RzYjB1NHgxZW9HR1pwQ0lQRGZvQjVLdEpScmFE?=
 =?utf-8?B?NGNIam91bzlidk5CMndsczZYRU54WHduNWxYNXk1OXJ5enRXN1V4RmYwZmtT?=
 =?utf-8?B?YXp2RkZmLzhpQmgrVDVZSW9XWEMySWFKdi9LWVdnUk5uaWMrajZ2SEdlSjNG?=
 =?utf-8?B?SVVROWc3QjZEb2FUbFJIZ0RUNUtNOFhFNVJsV0lJUkdXNEVFK2swMEYyeXVU?=
 =?utf-8?B?NytoSzkzenRCOVh6V0VqRXgwNHFzaHpQbGZXUkZxQ1hYb3FhVG1yR3BoT1d4?=
 =?utf-8?B?MWkyck1BVXFyeTlKaGVLcGQ2VjU0emtmMTJ5RjFheGNweTVPdmRMdXZHSW5V?=
 =?utf-8?B?ZXdXNnFtNW01QkxEUDBMVXNiUjMzUWFKRTV0dTNYQzRWSG51Tnllc1lDRml0?=
 =?utf-8?B?U0RaZDBVTGFLRi9DaEszN1gvOElrRG42MW5HeE9SNHFDS0c4Q1VhZlRua0ND?=
 =?utf-8?B?eW9RbHpVTFE3S0R1WFhWVUJTMDRGcWZtYjloU0lUTjFmY09zekMwdXlhNVdk?=
 =?utf-8?B?eGliNnc2OGdXSDl0S2RRZlNITnN3enNWMkdWbDUrVURibnN6bWFLazRpNlFq?=
 =?utf-8?B?RDJkSTgvRi9Ka0pra2s5ZWM3RE9iVmJBTVRraTdrb25CNTA0cUhnNE1BbHgw?=
 =?utf-8?B?V0dxekhkMkgyczZkeW4wYXZCNVo5dkRwMFhRb0pWWTNqeFJuNDlJU2R4WEhT?=
 =?utf-8?B?QWlFVzV4b1FSY0x5TnRsNlEwUUYyaWRWYlFWVEM1ZXFDKzhtRVlFMlRDZUph?=
 =?utf-8?B?Vm9obnBEMlkrUUpoV3VDdERETnVxS01RTGptbkMxQ0ZVMEQ5S3pkZDVpWW0w?=
 =?utf-8?B?WTZ4cHFrUlZGMEd6ZjROazltUjNpQ2F6cFVwTlZhbWtKWXJQc2VQNGlMVVEv?=
 =?utf-8?B?TjE2b0J2anJjZ3haM1R6RjBCenF5ditWL29oaExzUzNKWThNTUp4VDJSdWU1?=
 =?utf-8?B?dEpIWVpjWWtVNE5SYVBCUTUrSFR0L2FsNlZXQjhKNWlJRHNhT1dKMi9hRlBZ?=
 =?utf-8?B?SjBPWjZJeVd4amdkMXF5emRFR3lweFk3UHR3bVRDV1dpdENISnBQakJHeVhF?=
 =?utf-8?B?Y1J4TDZFUkxlcTNING9jL0MrekJNV1VMdjlSc2dWeC9tWitqT2huUE5yN2lv?=
 =?utf-8?B?K1FKdGFFRHhlTGZROHpMRzREYUxSbGVJNWJlVzhwSXdLS0FhWFBUamZwWkZ3?=
 =?utf-8?B?cjQ4akJGTzdVYnJ5a3paSVdleTY0VFM2KytYbVJrNk5hV1VJbTViNEpKbnpW?=
 =?utf-8?B?dGk5SlVZYjBRdngzQ3NEWXdkNmtIeEl0NFo0czQyL1ZpZkVMWEFQaWxsTlB6?=
 =?utf-8?B?K05jbUtzOGFSbWxZTnBuRk9HUjhEdmsxYVAxSVBUSHJ2SitPTnJsR0U0MFVp?=
 =?utf-8?B?aWY3TUNCaU0rczVxWHpzcjRHUmdzOXZFSmpDOUt5SmtCcVBwNTJteEo1TGdD?=
 =?utf-8?B?ZUVyY2V2OGtkSjFOVXpwNTFzUUVHOGc3N29DbFZKNWRIL1dwdEVkRFRkSGVT?=
 =?utf-8?Q?TtKWQXYuYS1e2K2+o59aQom2p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de56c31-8a6a-4cef-29ad-08ddb9f26c8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:28:21.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3sDQ4YwxN1syu/EhpFJ3/FYRUcmyZdU9j1I+knwHc0DHoOArrNkuqHB+Zqh+XKDrO+f3R2junlUvwWciu5Xlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

Hi Rodrigo

On 7/3/2025 3:05 AM, Rodrigo Vivi wrote:
> On Wed, Jul 02, 2025 at 07:41:16PM +0530, Riana Tauro wrote:
>> Add support to handle CSC firmware reported errors. When CSC firmware
>> errors are encoutered, a error interrupt is received by the GFX device as
>> a MSI interrupt.
>>
>> Device Source control registers indicates the source of the error as CSC
>> The HEC error status register indicates that the error is firmware reported
>> Depending on the type of error, the error cause is written to the HEC
>> Firmware error register.
>>
>> On encountering such CSC firmware errors, the graphics device is
>> non-recoverable from driver context. The only way to recover from these
>> errors is firmware flash. The device is then wedged and userspace is
>> notified with a drm uevent
>>
>> v2: use vendor recovery method with
>>      runtime survivability (Christian, Rodrigo, Raag)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>>   drivers/gpu/drm/xe/xe_device.c             | 11 +++-
>>   drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 70 +++++++++++++++++++++-
>>   5 files changed, 88 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> index 9b66cc972a63..180be82672ab 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> @@ -13,6 +13,8 @@
>>   
>>   /* Definitions of GSC H/W registers, bits, etc */
>>   
>> +#define BMG_GSC_HECI1_BASE	0x373000
>> +
>>   #define MTL_GSC_HECI1_BASE	0x00116000
>>   #define MTL_GSC_HECI2_BASE	0x00117000
>>   
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index ed9b81fb28a0..c146b9ef44eb 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,10 +6,15 @@
>>   #ifndef _XE_HW_ERROR_REGS_H_
>>   #define _XE_HW_ERROR_REGS_H_
>>   
>> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
>> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +
>> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>> +
>>   #define DEV_ERR_STAT_NONFATAL			0x100178
>>   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>>   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>>   								  DEV_ERR_STAT_CORRECTABLE, \
>>   								  DEV_ERR_STAT_NONFATAL))
>> -
>> +#define   XE_CSC_ERROR				BIT(17)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index d6b680abc3ae..fbc50cebfc11 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1154,6 +1154,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>    */
>>   void xe_device_declare_wedged(struct xe_device *xe)
>>   {
>> +	unsigned long recovery_method;
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   
>> @@ -1169,6 +1170,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> +	/* Default recovery method */
>> +	recovery_method = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
>> +
>> +	if (xe_survivability_mode_is_runtime(xe))
>> +		recovery_method = DRM_WEDGE_RECOVERY_VENDOR;
> 
> what about the DRM_WEDGE_RECOVERY_VENDOR as an option to this function?
> > Then, from the survivability mode you call:
> xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_VENDOR)

The default method is used in most of the cases, that is the reason i 
didn't use parameter.

How about retaining this patch if the method is different from default.
https://patchwork.freedesktop.org/patch/660131/?series=149756&rev=2 ?

> 
>> +
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_declare_wedged(gt);
>>   
>> @@ -1181,8 +1188,6 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   			dev_name(xe->drm.dev));
>>   
>>   		/* Notify userspace of wedged device */
>> -		drm_dev_wedged_event(&xe->drm,
>> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
>> -				     NULL);
>> +		drm_dev_wedged_event(&xe->drm, recovery_method, NULL);
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7e4f6d846af6..5daf5ba6bf51 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -241,6 +241,9 @@ struct xe_tile {
>>   	/** @memirq: Memory Based Interrupts. */
>>   	struct xe_memirq memirq;
>>   
>> +	/** @csc_hw_error_work: worker to report CSC HW errors */
>> +	struct work_struct csc_hw_error_work;
>> +
>>   	/** @pcode: tile's PCODE */
>>   	struct {
>>   		/** @pcode.lock: protecting tile's PCODE mailbox data */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 0f2590839900..73c788fd0dee 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,12 +3,16 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>>   
>>   #include "xe_device.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>> +#include "xe_survivability_mode.h"
>> +
>> +#define  HEC_UNCORR_FW_ERR_BITS 4
>>   
>>   /* Error categories reported by hardware */
>>   enum hardware_error {
>> @@ -18,6 +22,13 @@ enum hardware_error {
>>   	HARDWARE_ERROR_MAX,
>>   };
>>   
>> +static const char * const hec_uncorrected_fw_errors[] = {
>> +	"Fatal",
>> +	"CSE Disabled",
>> +	"FD Corruption",
>> +	"Data Corruption"
>> +};
>> +
>>   static const char *hw_error_to_str(const enum hardware_error hw_err)
>>   {
>>   	switch (hw_err) {
>> @@ -32,6 +43,58 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
>>   	}
>>   }
>>   
>> +static void csc_hw_error_work(struct work_struct *work)
>> +{
>> +	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	int ret;
>> +
>> +	ret = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_RUNTIME);
>> +	if (ret)
>> +		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");
> 
> This could simply call a function xe_survivability_mode_runtime(xe), which
> declares the device wedged with vendor specific reason.

Will do this based on the decision in
[3/7]Add support for Runtime survivability mode

Thanks
Riana>
>> +
>> +	xe_device_declare_wedged(xe);
>> +}
>> +
>> +static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>> +{
>> +	const char *hw_err_str = hw_error_to_str(hw_err);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	u32 base, err_bit, err_src;
>> +	unsigned long fw_err;
>> +
>> +	if (xe->info.platform != XE_BATTLEMAGE)
>> +		return;
>> +
>> +	/* Not supported in BMG */
>> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +		return;
>> +
>> +	base = BMG_GSC_HECI1_BASE;
>> +	lockdep_assert_held(&xe->irq.lock);
>> +	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>> +	if (!err_src) {
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
>> +				    tile->id, hw_err_str);
>> +		return;
>> +	}
>> +
>> +	if (err_src & UNCORR_FW_REPORTED_ERR) {
>> +		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>> +		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>> +			drm_err_ratelimited(&xe->drm, HW_ERR
>> +					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
>> +					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
>> +					     err_bit);
>> +
>> +			schedule_work(&tile->csc_hw_error_work);
>> +		}
>> +	}
>> +
>> +	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>>   	const char *hw_err_str = hw_error_to_str(hw_err);
>> @@ -50,7 +113,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		goto unlock;
>>   	}
>>   
>> -	/* TODO: Process errrors per source */
>> +	if (err_src & XE_CSC_ERROR)
>> +		csc_hw_error_handler(tile, hw_err);
>>   
>>   	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>   
>> @@ -101,8 +165,12 @@ static void process_hw_errors(struct xe_device *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>   		return;
>>   
>> +	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>> +
>>   	process_hw_errors(xe);
>>   }
>> -- 
>> 2.47.1
>>

