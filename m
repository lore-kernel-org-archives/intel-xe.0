Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC82910BA420
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 04:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F21E10E2B8;
	Fri, 27 Mar 2026 04:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvHsRwnf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6310E2B8
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774584313; x=1806120313;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zUa64/1XcEsUBs0HafMvM7bMGg+f8ltjEHSd/nF663I=;
 b=UvHsRwnftKLVB++1JpAdXlI42yKa2uCEiwbUw8XCW1L3ihMD1PyNHnWI
 CZJQTSZ6y+Lvv/ZeATMasPS5MbK5XLySKlRiyBCrdQfK6c3dD+dex0F3c
 CrXlCGNid3oHD5EsdG3SAgYEVt4AgoGPBAdXq0dCFePtjlrGXMf80bO+p
 hSHYHVyfpd/8405RAZbV4VCDyX2tgUThPEw0JQHUIyPVeENrmTI0AX1UU
 KVWAjtNg1Us3o2cSJIhc1W+HOpy+NQoO5ldTdqsTRl0680WBUhA3QdJ+e
 Ozl/b/V7A28VoazzXdTDi6w3Hj000xLU+eHUOglVdyOsooMBBnsFSgh0q Q==;
X-CSE-ConnectionGUID: ctrynxLfQl2ynGNiZOEK2Q==
X-CSE-MsgGUID: X0Q0z9q0SoGbDK0YdngOHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75854656"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75854656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 21:05:12 -0700
X-CSE-ConnectionGUID: 9HQdyrIqRWmfZTaM7LhSYg==
X-CSE-MsgGUID: qh/SjfGXQ1iPfz8AvuoFcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="255694303"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 21:05:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 21:05:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 21:05:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 21:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1qG3OXYs0ATOn4OIvBmoIKrdD4iqIIUdinYv4TcLgHSKue2Z7v0akBeGAQXv/yigpgkeviyUT1eW8QNeR/d6umIg9AiWn07PJ18vjJ7Wa/PS8wWOtoOBxxL85TyFETCMfohjHtibteoGj8VwFd6DfOvu3NqBBVhGo9lFqLpXn5+A566lVP6a8C54LahTZyI0OwH1CmtmmCz16Xu0q8cgf2x+zURMrYg/X+maIE0T8uZXvyCuH1Rla0QIYh0gbtV5+r1p4dbeeocfk8HDQigrdOddGQ8SlqbqFZmk6bY/QOSH3L8Qx4FBOoN7dVf5aBewZtNnJXsqJNXbfGiUcY6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP5v2EQM8oIsEo4U6E5maQij0G1/py8lW886kybb6dg=;
 b=R+LwXoVRGz/YDiJHqQT0ifwM3zxCwln5FCfxMmmTSFxbPKp/3YRj6XEPFWWNECSAg4c5fZ2b/MMGVSgLo9MoTAJpLdghpJ/8YTbGP16hBRwBECwuMuRz0Vq+Hr9XgB8x6o0PgezR9n2PqvBCGYKs/9pOg5bJyuRe96Lomo0xJlc6GOCzXidjDgXbU4vbJ6fWpXW9ehiLcDvpR4g3n9MJpRicqYX5021Te1HsCg9CCj1zmhDA3msJVsk21SkJ8SeoqD4+v0wDVvzg9iwzS8/pV8++9WCKXy+a5aIfte3tFohSfqCpABnhxq1sdIOZWAyDnAh0LCUiJce3AjjgdrNwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA3PR11MB8968.namprd11.prod.outlook.com (2603:10b6:208:57b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 04:05:04 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 04:05:03 +0000
Message-ID: <2963f582-f449-4b81-bd50-2a610ef3b072@intel.com>
Date: Fri, 27 Mar 2026 09:34:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav,
 Raag" <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
References: <20260323151331.4043749-1-karthik.poosa@intel.com>
 <20260323151331.4043749-2-karthik.poosa@intel.com>
 <IA1PR11MB641869B65AAAAC64304A5AADC14BA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <IA1PR11MB641869B65AAAAC64304A5AADC14BA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA3PR11MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: 0054f679-a92e-487b-a1f7-08de8bb605d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: RhwL3qygQumniAaVdsg3gVSHYMU7OsG+p5g+5Ml/p8bdVYI83a4RZxl0Qitn40jWtnYLID67B0W0us9ngy+YnYUSWPmx//ThHPXI+pXYYEw+D7hkwdKu3lxv5pJM3MXYB3D8mcJDpCrJwp/4Onb7IJDLvA0KYZyaN6QR5bUbqjW3Qizqo8+bIqTBXExmbZZxt5l/BxWRCp4ckUHvTB9xLAQhq/7BMTe96PpjtXu1YEskpytz1PRkjlg+GdzDeJAm5zurJCNl3FMWEDFgzTIc9GNhQYh/8geg52KvVfVmMzk8lfzRlcMcJa0d4efAbekB4Od5wpD7SzVZPQbT6xtnxze6pjUNzrtRmJEpNcsgUGLOeY0svY8lGEovgEMeyavOh1RMe46tf6QZLpBfFLclkrclxFnirwJiqBUNnhYFuOy9Xq3H666n6MSA3C3DWfRQqUyOJz2Ta7AOE19pD0dZPdHefQgX2pYwahSVD/i2kmjuiI12hhVT9WgDz5iWM/Tl6mY3gjebJlxOgpToNKZRZ+xZaGyT8gmtHtYoGn1R7aBnS74o3AIQOgygjCjzbJXjwjiBiWwthwu9fV+KyKTCCvh65UNTAr/YeHQo0UvQOL4r7T8Qq8NO3rklhMCICQrXsrgH4+U4aqKWU9v2vnlrUP5vjAM96lo0BERDhJeYxe3TMPE8CNh5HUTw9Weh/nga
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEsybFU0NUhPWjJHd2F5SVhtRGptUGpSUkllY0tHajViREgrQ0JLbDdIbUVX?=
 =?utf-8?B?U0dNK0FQdGEyTDI5MnEzZWh4VlVBSTF0VHhyVE1rUitUcmhkbDJsenJTSjNB?=
 =?utf-8?B?a1ZiTk5KS1duMURMTGhNMklpSVV5V3lKZC9mYUsvT1JTb2pQbDJha2tFdyt4?=
 =?utf-8?B?ektjS2hiTGhKbjF4MUlQVjFCRUVoUHFHREVtWVEveHRhT3JVL1dURG1lRGZs?=
 =?utf-8?B?TVNBcURSdVIwRncySzZwb3AxS0RjOUtPL2RWWXZvdVNjc09kZ0hURVNUTVBq?=
 =?utf-8?B?eTd1U1ZsWkovUUg0YmNMNGVIQlJRQ0NpSlZDSnRuNzR4MTdTd3ZlUnZrdlJ3?=
 =?utf-8?B?dlBkSy9zOTJWais3Ky80T1R1SFB2TUM5bFhnQ0pxTHo4R1lJdGdadjJvUnlz?=
 =?utf-8?B?ZS9JcUh5Vkp5WlRGYllDTWNtVHdWUjJNY0dhQ3RLcko5bEQwS1hHaVNyN2Vv?=
 =?utf-8?B?b2F2MG42Q3VEd3NIbkJ6ZHE5OWQ0OEtRWTZSdU41K1RTQmUzMXJyay85SGNz?=
 =?utf-8?B?WGRLSmIrdVNCTExUcTNqemNjUHlLTTMrWStjVERWMEp6VEtRSG9XRzYycTE0?=
 =?utf-8?B?SnBhS0R0VGN5RjFINFMzb0JwZnBlT1o0a1UwUHh3ai9WV2NFNGtqVjlRTTJY?=
 =?utf-8?B?eDZ0c1JVNFhnbGlZNEFmM2NlbEJBeS9GTzFOWEhVSi9TWG1EMFdEVzF1dTlu?=
 =?utf-8?B?TjJiMFV0b004SHI3VGlDR0ZUYkNkc0xJZ3lLeGhpNE5UT2RpbVpGQ1lFRmph?=
 =?utf-8?B?WW1hWHFHcHM3Y1kwMGVOeTVDY2JONitRTW8vUktWeTA4a1l4dmZibzdFdERI?=
 =?utf-8?B?bTZ5TUlBNmlEWXZ3UlBQWitBZXljN1dZQ3plQjFjWHFnN1NEc2pVbDVxRDJG?=
 =?utf-8?B?dFMyVmFlcHRVbG9OWUVobXRBQjYxcCsySk1EbXRScEJ1dFIreGY5STlDNGNE?=
 =?utf-8?B?dDU2ejFxTlZQM3UvZEpCcG9DdFhhR0VyRW80clF2Y2NKUU5oTkFBUUw2T05Q?=
 =?utf-8?B?am9HemlEVzRWUTBOOTQzRHZhUlpvbUk0SVZCUForWkhPejBGUllVa28wVzJZ?=
 =?utf-8?B?OWRQLzFuSEpwa055SUtLcVYwV1p2R0lYdVd5aEZTK3U2c2RaL3hIcVhnbVZB?=
 =?utf-8?B?K0xLLzVLbG1UWG1ucnRCVXNUT0l0dk5zbnFNNm84T2JUZmZhRGh0SndhVmsr?=
 =?utf-8?B?MDFGREJXZnQ1Wml2RzFZUFhGbVNtU0pXenBVSUhPaTN4d0ZRMWE5Yy9DL01P?=
 =?utf-8?B?cGk2UGd5ZE4vbjNDTFJtOU05WDg3UzZpdmdJQ0txZjg0WW1Ma29Tc1RSTklm?=
 =?utf-8?B?cmFEWkpwRnZGVU83SlgwZnhDNHIwT3VoNy9rQ0w4UU1wVVlGSnAvU0Y5STJG?=
 =?utf-8?B?RnpFYk9QWG9KVVY2bzNqUlNXNjRRazd3cVJTaDhkdVpkdnF0MG5XamZRZGN0?=
 =?utf-8?B?VEhDVTdpb0w5Z3hLVWZUZ0hWRUFOUXRnaEdIUmR6b0tpVXEvcFlLWjRiMGNx?=
 =?utf-8?B?dnI3ZGxaMGd2NDhPUWx6d0ZxQ29mVkt5SGFUT1IwM1lVZFVIcTJERS9rcVk5?=
 =?utf-8?B?Z2xRUU4yZEhPWnZmUERYMkd1MUlseWVpVkdUWEhFWkw3anQ2WWRWcDVBVFVG?=
 =?utf-8?B?WEtTOVdISG5tbXVSUjJyYitVejc0aEN6d2FIVEVmY1dRS3VKWVp4N0xIdUM5?=
 =?utf-8?B?YStrTUJtL0VSNUJ4Tm5idnoxWnZDT2hKMWdWSWIyMit1dVJwQzlILzA3TEly?=
 =?utf-8?B?aHlsUUlSTFczRXZCMS8wN0VXcVlxQ2tDUXFhcm9YRU5PMmJsV2Y1VnZsRklE?=
 =?utf-8?B?R0JoN3M0c2hVczNWR0NTZUxienpDZkhYd0YwSnRHRWlpNVJVVnpIbDBPaFhJ?=
 =?utf-8?B?QjNNeUNtdkN2aU9BSEhGcmhzSzlLYWFOc25pcDBxbmNoWDR6WUtTV2c2czI2?=
 =?utf-8?B?alVlYnhjdXV0WGVBemY1dkh4QWZWL2tMT0FZQitjaVl2ZjVHRWIwRFdobXVC?=
 =?utf-8?B?dHQ3K3dNS3VFUGtQTlA3Y0l3Z2NTVnFuLzdBN3prSGRFZnNNY1VzSU1TcFE0?=
 =?utf-8?B?U0FDY1lFdEZrNm0wMWZjQ2JiQU8wQmVVdlBkSHVNa0IydFNCbzFFN0pkTG1p?=
 =?utf-8?B?NlVYV0pLaHVKU0I0ZmtHRGFvekpwc08xZlgzcFJlZTNaVUpQeGUrMkQ4aXRs?=
 =?utf-8?B?cW9Zbkp5QktLQXBBeE1OVml5Ti9hM1J1UnVUUktVN0Z2SXBQeEJGS1Vva1RO?=
 =?utf-8?B?L1lQWm9IbmtMZVFvSzJnT3pmRVFXb2hkVGw1cWNqU1FoNDlwY3lVMERYcmlk?=
 =?utf-8?B?MjliY0FtL0IyLzN0dURNNFZ4SXV1b0M3TkUvWEprQzVNZXAyR3QvUT09?=
X-Exchange-RoutingPolicyChecked: W52DIthT64pwHCYHEBkwZFOpTaQpaJ7jPrQUHrMACAx4A7W732r0fCvNh8JPSHLEi19hYtva0329gqbELSdKPMKhqUCUioTw9czW6aqvjyyEs0Ax2i7CRHx8sOLADMMMDYA6OrURWsyrqMLv/Y6OG9Eq/lPdhbkhUhZmPoLWucS+mhVwZ3WXUzI+HmEticuIvstMKkAd+qCZ7p4sQ4/5ltQqYSSOZWm3I/GR/utOwOjrW4NoB6kQLIBJrprzk07QPTKLnvzj3YyiPT4xcSEJbxw7NBky9fQFMBbVpcqrWJZvo7HO5LDYbOp4vlaCFtMnT+g/G3PkNUUSKmeEosTSaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0054f679-a92e-487b-a1f7-08de8bb605d0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:05:03.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlwnpmMaCfVQPeQFcJYNmIxnnFMro+j0hU5Ll71CrnevqDRbVWp0unHB+mNPW6YQ5rWNhRRFVr0lpuDDLwc2Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8968
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


On 23-03-2026 22:11, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Karthik
>> Poosa
>> Sent: Monday, March 23, 2026 11:14 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav, Raag
>> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>
>> Subject: [PATCH v1 1/2] drm/xe/pcode: Add support to get pcode version from
>> PMT
>>
>> Add api get_pcode_version() to read pcode version
> >from PMT telemetry.
>
> I think that this patch will only support the currently define BMG specification.
>
> Is this is for BMG only, the commit should say that.

This patch is intended for BMG and post BMG also.

>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
>> drivers/gpu/drm/xe/xe_pcode.c    | 18 ++++++++++++++++++
>> drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
>> 3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> index 240d57993ea6..8a70e17912f3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> @@ -15,6 +15,8 @@
>> #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>> #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>>
>> +#define PUNIT_VERSION_OFFSET		(0xA0)
> Is this the offset defined in the for the BMG PMT XML definitions?
Yes, here it is 
https://github.com/intel/Intel-PMT/blob/main/xml/BMG/PUNIT/bmg_punit_aggregator.xml#L1218 

>
>> #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>> #define BMG_TELEMETRY_OFFSET		(SOC_BASE +
>> BMG_TELEMETRY_BASE_OFFSET)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index dc66d0c7ee06..1ebe622e947a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -15,6 +15,8 @@
>> #include "xe_device.h"
>> #include "xe_mmio.h"
>> #include "xe_pcode_api.h"
>> +#include "xe_vsec.h"
>> +#include "regs/xe_pmt.h"
>>
>> /**
>>   * DOC: PCODE
>> @@ -348,3 +350,19 @@ int xe_pcode_probe_early(struct xe_device *xe)
>> 	return xe_pcode_ready(xe, false);
>> }
>> ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See
>> xe_pci_probe */
>> +
>> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
>> +{
>> +	int ret = 0;
>> +
>> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
>> +				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
>> +				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
> If the XML definition (and GUID) are rev-ed, how can you verify that the PUNIT_VERSION_OFFSET is also the
> same?
>
> It looks to me that this usage is locking this use case into the current BMG definition.
>
> If you are not using a BMG, is this expected to work?
>
> Will all PUNIT_TELEM ALWAYS have this information at PUNIT_VERION_OFFSET?
>
> M
I think so, let me confirm this.
>
>> +	if (ret != sizeof(*version)) {
>> +		drm_warn(&xe->drm, "couldn't get pcode version from pmt,
>> ret %d\n", ret);
>> +		return ret;
>> +	}
>> +	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n",
>> version->major,
>> +		version->minor, version->engg);
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 490e4f269607..8dd472049921 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -12,6 +12,12 @@ struct drm_device;
>> struct xe_device;
>> struct xe_tile;
>>
>> +struct pcode_version {
>> +	u16 minor;
>> +	u16 major;
>> +	u32 engg;
>> +};
>> +
>> void xe_pcode_init(struct xe_tile *tile);
>> int xe_pcode_probe_early(struct xe_device *xe);
>> int xe_pcode_ready(struct xe_device *xe, bool locked);
>> @@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32
>> mbox, u32 val,
>> 			   int timeout_ms);
>> int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>> 			     u32 data1, int timeout);
>> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version);
>>
>> #define xe_pcode_write(tile, mbox, val) \
>> 	xe_pcode_write_timeout(tile, mbox, val, 1)
>> --
>> 2.25.1
