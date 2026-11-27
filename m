Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEDB606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M8RDBS41;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SwtzpyRz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247C11284A;
	Fri, 27 Nov 2026 08:30:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32336112856
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795768224; x=1827304224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=N4q4sHW72LNXzSLZZY4wFJIrrBWKskoStcrvxY+KmYs=;
 b=M8RDBS41mHB+I2KqViShc8ksYENbT69JVVLFPSIqxNPIPk+wcZU5PVR3
 E91oGZWzmWpw2NXfDfD5poBM8vbjZQazwR2hKdd4/WAALpXawKSnMIaZr
 DKauy3nbNdkfR8bnXjwbEUht9+xQUuE87kFuFXmqS/OJE8Ew/ziiDn5YH
 THe1X64333Z9wt8X9YH/TgiUxuEyE3ZUlHAG2O/kYt2FJYCPL39AlAAJU
 im8prCu03dN1BMjKFAQ8ociv1JAQTaXxFyz382bWY6JAigplDhKC/drgw
 C7g56J37Cx/zzevvDBk/nFFVvl14rPoGIPtejFyWo/gGib6vyI4sTyWDJ Q==;
X-CSE-ConnectionGUID: kL5vGFOUQZGtNT6rTcdVMg==
X-CSE-MsgGUID: dJ23Rd6/RDqgiFbnmDo6aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4766320"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208,217";a="4766320"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 00:26:56 -0800
X-CSE-ConnectionGUID: 5q14zKwxTPCK4kBfGOJ6/Q==
X-CSE-MsgGUID: xnpz0dEcT2SiCDg76aE/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208,217";a="12687161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 00:26:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 00:26:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 00:26:54 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 00:26:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJghVJuZr1i6bzRzNrAFbID8+5aQaIZ4GgE1MDvBNnaE/ACtwgasDayVf6aS8HGjnMJATPLt0+7dp8CUDdr+eZiRYbWLzkspfY47LCuagpunQbupUO8lMouEMHTslb1Hw2DREsAFYHccK+nENclGTQ8XVKVkaj6fa9X8BpMzjuXjMw7TWeo1LDi2uZ3KGAKAyIMgNvSOJu9tCkx41DYpMStU3dCZRoYBdEOHkHLHzwuQm5EjcVrhIOZZiiT21UngNqkxjfSj7cSv5UFCzw6Xe/itQ3+lEyUPCyL9YVjQyxBd4olFXRD7MXjpiZSSENoimAZU7kFQx135yTgbmqUcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAkNzYZVVjF981OJp/1ScN2txE5lw74KfBX/e5DwviA=;
 b=ggdOJS5nCoMIpeiIw5UDx5czJsZUSX7pclhi4lyfat7ebEcSm5wznEvmrG1QuJ2OG+LpPEPPz2MkowukEUPpFJIR4d7vPbHLcHZtRCfMFyaldpSfLQBBxuD3EEHCtPvDFnoBfHV8lEvsM3FZVS0iIZEs0gEDG4nTQ0w6MK89T9zyVgSLBeOV4IwD3XQgm+sYvRcZmB5AFb2G/PTAhjtmMTLnyMogujYnqgr0kexU/To/SUPqkYjZ/BHAUNUUb3X9oVCdAsomYmNq/6IVxOjmWZsbwWPzYewusS4u+qtqf6ishe+szhMRnuTcJChDZCyGkiJ3gtlTAgNJnxlJPV4hGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAkNzYZVVjF981OJp/1ScN2txE5lw74KfBX/e5DwviA=;
 b=SwtzpyRzgg/FUXmvvaZCwqxNPXmwFo6mNxWoG9mHbEd3HXCDSnlKxN/yhF2BuDUcpmINd5yBERwzAWx1W6sOQ7e9YKj7Uqil8jLPd1KtnaKaxSi307PC+SOXCE8Rygf7C7tOLnbzIEwY4niZ+TwhK+tL8yp0KnEq93uDoKOy5Jk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by IA1PR11MB9493.namprd11.prod.outlook.com (2603:10b6:208:5af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 08:26:50 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 08:26:50 +0000
Content-Type: multipart/alternative;
 boundary="------------tS5FUrs2O06K1KNIXDd9UTW6"
Message-ID: <c49c863e-6958-42a6-a983-676d769fbd39@intel.com>
Date: Fri, 27 Nov 2026 13:56:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
 <20261125100716.2151294-12-mallesh.koujalagi@intel.com>
 <ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com>
X-ClientProxiedBy: MA5PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::13) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|IA1PR11MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3b4d11-4f98-4833-ee7f-08df4c602f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|11063799006|6133799003|261009223027099003|18002099003|22082099003|8096899003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: KzCsltUpHksVi8uWL0ykkK7yI4POQ4gVL0x9juMQibg15GjeMgNPqvF9XjNLJ8F+9C3iXzd4yxA29l2x0kpAIUIT4GCKSVSCK69kV66DTUDX3DO0UAt7rCsDdk1bO8ZuLR01rpK+7HK9sJfNXc7jHRqIqArWqWMb56fWIpbe4SmDPbowL8q0S1HzBBszO4Ah+Ackq/TGgf36+5cXV/6gOfcFOaVHc/MsdlI566EVuVUgIIZPe9stbY9sqbL1xEatdpG4PL2tdYDsL7V25Jka16GIlcfo1C5x2BUK/nadeG6uK13MRvbtAx3HRzdxRDA5ep3LbvTCkRAarzdqjYyZh87+ks/7/UqdhrML9Kp1dIaRYADYlqfnQcXlrNPEEkPGCwTews/rOSK0wIDPZRl64m+IFwZiYPwEt2AXpY5IXbk8ieIBpgx1o/JfWefWnQ4hBqSV0Cu0Ys33wXEbcYKnOnTvg4EMXteZVwfrSNDeltMRj1sXPb8tahJrESetLLNbiuTNr+ZpMBsvO91ZWjue5jyVQHqS9qxBM97ObxjZh2vNpe8PyNgBDxPQM40/YpT+6xguBlaqp9NVjaPhyrh0F4yi0c7A/Fr+JhqLGagyAZoxRfpoqsQ3egQi9i8L0n5T/pzg00I8CPDjfjvQpeFMspLyng9yANyRPRTzJTMB0I0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(8096899003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNGYStXcFZueXhCUHNwb1d3dHQ5blphMXRCdU1aVWFaSE5QcEFVd0c0Y2F1?=
 =?utf-8?B?NHI2UTVZUDhWT0hqL1YwS3p4U2gxdGhERGFKNEZZMm42aXhDRkxWZGFJRkFl?=
 =?utf-8?B?Tlh1NHVIOG1WejNmdVhydUpjWVl6RTQ3ZzVCMFlBdjRzRjA5aTZnRjE4clpw?=
 =?utf-8?B?Zks1TTU1WTh6ZEV6Wk9MeUo4MU1yeTNhSTdiRU1kOUtHMlduQ2dtcjRKNEpP?=
 =?utf-8?B?MVlkdzFhcGZzejNVMTRYWVg4dm4wVHJRQllHZG50YUVIaFlkTTNUU1J6R3Zp?=
 =?utf-8?B?dmtJVmJYTHM3T3VBWXRSSmptdVVHYUEyZUVIZGFzMXQ3OHZYRnlhZFdmek9F?=
 =?utf-8?B?ZW5lSnh3c3pWVXpvKzl1VHJnT1cydVBOUDV5c05lTTZZbXdwWk14RkNPdVlX?=
 =?utf-8?B?TFJxU0p0THZqQ0xTZGNwR0RIU3RpN2s5VXd4TVY4WFp5OWZuMHF2QXBSZVNH?=
 =?utf-8?B?ZisyR2xPNDljWUV3cXA2dVBFWlhhVmQwNmNlODRUZCsydC9IU0N2aU1PdHdo?=
 =?utf-8?B?ZGRXdS9CRWEyVnpuVHArNkNRdG1pSlJVZ2hzR0FUdlE4eWJrTTdGM21XcVNX?=
 =?utf-8?B?OHdoQzdnc3ltdG03ZkNsbVdobUcxWkNaQktoZUE5R0RXNlVLS3F4QTN3ODFr?=
 =?utf-8?B?bmJLNU1WWU05M0h0dEQzMVRBM2Q1eHBzOURlOXNhUXpqSWhoK0c0VGw1MzNo?=
 =?utf-8?B?MUk1UnRuMGFtdVEzMFNXU0F4YWhTTXJSNlFVb3UwMU1UVWx3M1BiblF6WVEy?=
 =?utf-8?B?VkZLdVdEZGFiN3pRU2d5eGJ4V3gramQvSG9EQnpLbFQxN1M5Rmdkdk9TWTFa?=
 =?utf-8?B?Q2ZPVnlISFhzOTBBZ3YrQ25ka2VaT1M4bXlDVXdHNWJqWDUrY0Z3QlNkL0JE?=
 =?utf-8?B?TUxwcFlzMTJ4eU9FbVErRGhMZlYyZ242cFJwaWJxeDJITXFLeDhrYnlsVUI4?=
 =?utf-8?B?RWRUWUhZcFFjb0JaN3ozVFBQeVRlMWtuK3MzY1NMMngzcm14MGpubGozNTF5?=
 =?utf-8?B?Y1FhampIRkFYYWRjeStrOGVNeGVsa0k2ZzQvSUFpMDBCQWE5VkRMSHJFWGR5?=
 =?utf-8?B?YUcwdmx4MVFQa1hTYUw0dkxvcnVvUUtpYm5lQ0ZydC9Ed09PMDc0ZFNhRVZj?=
 =?utf-8?B?UEVRRndBaHA5NDEyak1vNVFhWS9QQUVpcGZGVDBCS20yYVdpbDNDOTRvajZu?=
 =?utf-8?B?dUlxcFNSR0RDeEdYcnZ1RkM1YTNBUUQyMWFONWtSTWNVOU5oT0hrU0tGZ2ln?=
 =?utf-8?B?SGVQYUtiQzFISm1BUndsZ1BhVWlITHFsL2YzREFSY3BhbWM1WnRjNmEvTEU4?=
 =?utf-8?B?N2x5SkpaWGU1cEFpTk5GU0VRNi83a0p0bFc2Qzg1M0JoT2xQcjdqZzFrSVJW?=
 =?utf-8?B?Snh4OHJRQXBNMTJySDBkRHFNaWZBZHg2MG10a29LNFVjdUx0TUdHWkwzNmc2?=
 =?utf-8?B?VXduSHY1RmJ6ZjBpUDBHZzR2dDc0YVNaUVdJRFdObmdDLzFlSGh0djlZNXIz?=
 =?utf-8?B?aHNvMHpvWGtiZWtCdkg0OGZqczk1MmMxS1Y1NGFiU3JOVUxDZmdtdlRVcVRa?=
 =?utf-8?B?WEIvZCtzbEdIZ0tMTWZXRHRuMThVcWJMNDl3VXRNMnYzTURBaHNkclZqRkRj?=
 =?utf-8?B?cDV1NW83WTcwK2FOY1ZRM2gxVjltaDFxRUJ6YnZtWjVnTzBqSVFZL3k5Qnkz?=
 =?utf-8?B?RUtzWXdrSyswMFlaaHRMeDNhaWpYTzBpM2JiN01rdVpzTjllVXdUWVgxbmZp?=
 =?utf-8?B?TkEvbFRjWFFLSDk1enBPSmtjcXBDOWl5OXZoRWxKbmEyemI4UTZ5NGZzUWVi?=
 =?utf-8?B?VEEvVmY5enhlSnNRckYxcXlQVFlsMkJTV2hNSjFTZU5FWWYyNkc0RHIvL00y?=
 =?utf-8?B?MXZONlNiand4WUVjeEpBcGZxZ0RQRUlEYzRhVmVwKzhqZnYwckt3d0Q1Skxx?=
 =?utf-8?B?Vlk0UTdiNFhnaG9IdjAzT09HZ2Roak0rdVlYUjAvMTZwZDZlZ3NKTU9Ha0dF?=
 =?utf-8?B?dU9wVjlGbi9qVGJETUdCYmREaW1kbDNIMUdtaUNRVkRPS0lzTmViaHdKZ1hC?=
 =?utf-8?B?VW1sazlDL1VBMXIyd3hMOGszUTVZVzJseFhMYjVtUDZOYXNPZU83TjRNZ1FD?=
 =?utf-8?B?UTRZRGVVNHUrNW9uV0N2MjcwUlhlOEw1UkwwQVY3KzZwSnF2dlpISmxsZTI2?=
 =?utf-8?B?eWNZUzhRYnJObFNvQ1VuVlFJRGlMZXVNM2ljMFpobVkzdUcrdVd4RXdGL29X?=
 =?utf-8?B?V3Buc1RWRHAySnVOaUJJb1lLNzNHWlZkSGFLdnJhNDZCVTl1NXN1TTRDZDIz?=
 =?utf-8?B?bUF5UzhNeVM4U3kzcndkZWpENjVxZzJ1VUlZMjUwejJWNzMydHVFeTgzbWE1?=
 =?utf-8?Q?ZrpPUHimOQRB45Zs=3D?=
X-Exchange-RoutingPolicyChecked: djeKxF94EtQothWkKAmpQQfx72y7zy6UhGbPrJOYQgob5KRy8dNYLZZDv/r385B6EL+bV84SYQMNlxYud/qihc9GLedSU3NLt7cZXu0p6zWDmWXRWhCQm+HRV6tw2uzcVRjtQw90ESokgN3/ESQCZwW7jPDk3SmgLmH/4OOVrHDWgMhMAi5AmGr/4RVF2I+XCo9U4v79zJ5WarOLZV5hZ79CEpsVqqXeNqLlC8R+nn7yUPiB9HkiubKm3mWr/HOnqTuz/8fu3AZlSj5tJipnaqZjzXmbf7cjMMNJf2VUsjZDnCl0aSih/Qq7Em0fYGMdgn3TJgUtWfDCJ7zx26WBxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3b4d11-4f98-4833-ee7f-08df4c602f12
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:26:50.5165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NM/03PpozgpF/ThOuYFS4OqcipBmTdpl9ylAi3wkYBfM8AH6Qj3jZOQuk5tQmtqqXDyYHerjLzjp2tPpdHCgrSbHJGWXHfbT6f9KwqTLmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9493
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------tS5FUrs2O06K1KNIXDd9UTW6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 26-11-2026 08:29 pm, Nilawar, Badal wrote:
>
>
> On 25-11-2026 15:37, Mallesh Koujalagi wrote:
>> Use GFP_NOWAIT | __GFP_NOWARN for software CPER allocations, keep
>
> Please mention why software CPER allocations need GFP_NOWAIT | 
> __GFP_NOWARN here and why a sleepable allocation cannot be used.

Sure, I'll update commit message with:

Why part:

Software CPER records are emitted through xe_log_*() helpers. Those 
helpers can be called from both sleepable

and atomic contexts, such as IRQ handlers or while holding spinlocks.

Software CPER record generation uses kvasprintf() and kzalloc(), which 
cannot determine the caller's context.

Using GPF_KERNEL from atomic context may trigger sleeping-in-atomic 
warnings and potentially deadlock.

> Also mention the planned long-term solution.
>
Long-term solution part:

Add a GFP argument to xe_cper_emit() and introduce xe_log_*_atomic() 
helpers. That allows sleepable callers to

use GFP_KERNEL while atomic callers use GFP_ATOMIC allocation flags, 
ensuring Software CPER records can be

emitted safely in all contexts without relying on a single GFP_NOWAIT 
allocation policy.

Thanks,

-/Mallesh

> Thanks,
> Badal
>> GFP_KERNEL for hardware CPER allocations, and track/report dropped
>> records on allocation failures.
>>
>> Cc: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
>> Cc: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Handle atomic context when SIGIDs are logged. (Sashiko)
>>
>> v4:
>> - Add can_sleep bool parameter in per_record_emit. (Badal)
>>
>> v5:
>> - Move gfp variable where it's used.
>>
>> v6:
>> - Pass gfp_t directly. (Badal)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_cper_types.h |  3 +++
>>   drivers/gpu/drm/xe/xe_printk.h     |  3 +++
>>   3 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 9161f2b52e9b..d8fff57a349e 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -180,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>>   	}
>>   }
>>   
>> +/* TODO: Handle xe_log_* helper function for atomic context */
>> +/* Software CPER may be emitted from atomic context */
>> +#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
>> +
>>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>>   			     const guid_t *notification_type,
>>   			     const struct xe_cper_intel_hdr *ihdr,
>> -			     const void *einfo, u32 einfo_len)
>> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
>>   {
>>   	struct cper_section_descriptor *sdesc;
>>   	struct xe_cper_nonstd_record *rec;
>> @@ -191,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>>   	u32 total_len;
>>   
>>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
>> -	rec = kzalloc(total_len, GFP_KERNEL);
>> -	if (!rec)
>> +	rec = kzalloc(total_len, gfp);
>> +	if (!rec) {
>> +		int total = atomic_inc_return(&xe->cper.dropped);
>> +
>> +		xe_warn_ratelimited(xe, "CPER: record dropped, total=%d\n", total);
>>   		return;
>> +	}
>>   
>>   	rhdr = &rec->record_hdr;
>>   	sdesc = &rec->section_desc;
>> @@ -477,7 +485,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>>   				    entries[i].einfo_size, &ihdr);
>>   
>>   		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
>> -				 entries[i].einfo, entries[i].einfo_size);
>> +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
>>   	}
>>   
>>   	free_info_arr(info_arr, num_entries);
>> @@ -511,9 +519,9 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	char *msg;
>>   	size_t msg_len;
>>   
>> -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
>> +	msg = kvasprintf(XE_CPER_SW_GFP, vaf->fmt, *vaf->va);
>>   	if (!msg)
>> -		xe_warn(xe, "Failed to allocate CPER message\n");
>> +		xe_warn_ratelimited(xe, "CPER: message dropped\n");
>>   
>>   	driver->error_type = cper_sev;
>>   	driver->error_component = component;
>> @@ -525,7 +533,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>>   	timestamp = ktime_get_real_ns();
>>   
>>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
>> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
>> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
>> +			 XE_CPER_SW_GFP);
>>   	kfree(msg);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index 5cfa32c75764..500207bd2e75 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _XE_CPER_TYPES_H_
>>   #define _XE_CPER_TYPES_H_
>>   
>> +#include <linux/atomic.h>
>>   #include <linux/cper.h>
>>   #include <linux/types.h>
>>   #include <linux/uuid.h>
>> @@ -192,6 +193,8 @@ struct xe_cper_info_entry {
>>   struct xe_cper {
>>   	/** @on_query: Emit a CPER record on each RAS counter query */
>>   	bool on_query;
>> +	/** @dropped: Number of CPER records dropped due to allocation failure */
>> +	atomic_t dropped;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
>> index 87f51d7edfa8..47886897b4ac 100644
>> --- a/drivers/gpu/drm/xe/xe_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_printk.h
>> @@ -27,6 +27,9 @@
>>   #define xe_warn(_xe, _fmt, ...) \
>>   	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
>>   
>> +#define xe_warn_ratelimited(_xe, _fmt, ...) \
>> +	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
>> +
>>   #define xe_notice(_xe, _fmt, ...) \
>>   	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
>>   
--------------tS5FUrs2O06K1KNIXDd9UTW6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-11-2026 08:29 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 25-11-2026 15:37, Mallesh
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20261125100716.2151294-12-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">Use GFP_NOWAIT | __GFP_NOWARN for software CPER allocations, keep</pre>
      </blockquote>
      <p>
        <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style> </p>
      <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">Please mention why software CPER allocations
          need GFP_NOWAIT | __GFP_NOWARN here and why a sleepable
          allocation cannot be used.&nbsp;</font></div>
    </blockquote>
    <p><font face="monospace">Sure, I'll update commit message with:</font></p>
    <p><font face="monospace">Why part:</font></p>
    <p><font face="monospace">Software CPER records are emitted through
        xe_log_*() helpers. Those helpers can be called from both
        sleepable&nbsp;</font></p>
    <p><font face="monospace">and atomic contexts, such as IRQ handlers
        or while holding spinlocks.&nbsp;</font></p>
    <p><font face="monospace">Software CPER record generation uses
        kvasprintf() and kzalloc(), which cannot determine the caller's
        context.</font></p>
    <p><font face="monospace">Using GPF_KERNEL from atomic context may
        trigger sleeping-in-atomic warnings and potentially deadlock.</font></p>
    <blockquote type="cite" cite="mid:ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com">
      <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">Also mention the planned long-term solution.</font></div>
      <br>
    </blockquote>
    <p>Long-term solution part:</p>
    <p>Add a GFP argument to xe_cper_emit() and introduce
      xe_log_*_atomic() helpers. That allows sleepable callers to&nbsp;</p>
    <p>use GFP_KERNEL while atomic callers use GFP_ATOMIC allocation
      flags, ensuring Software CPER records can be</p>
    <p>emitted safely in all contexts without relying on a single
      GFP_NOWAIT allocation policy.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com"><font face="monospace">Thanks,<br>
        Badal&nbsp;</font>
      <blockquote type="cite" cite="mid:20261125100716.2151294-12-mallesh.koujalagi@intel.com">
        <pre wrap="" class="moz-quote-pre">GFP_KERNEL for hardware CPER allocations, and track/report dropped
records on allocation failures.

Cc: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com" moz-do-not-send="true">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v3:
- Handle atomic context when SIGIDs are logged. (Sashiko)

v4:
- Add can_sleep bool parameter in per_record_emit. (Badal)

v5:
- Move gfp variable where it's used.

v6:
- Pass gfp_t directly. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_cper_types.h |  3 +++
 drivers/gpu/drm/xe/xe_printk.h     |  3 +++
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 9161f2b52e9b..d8fff57a349e 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -180,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 	}
 }
 
+/* TODO: Handle xe_log_* helper function for atomic context */
+/* Software CPER may be emitted from atomic context */
+#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
+
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -191,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
-	if (!rec)
+	rec = kzalloc(total_len, gfp);
+	if (!rec) {
+		int total = atomic_inc_return(&amp;xe-&gt;cper.dropped);
+
+		xe_warn_ratelimited(xe, &quot;CPER: record dropped, total=%d\n&quot;, total);
 		return;
+	}
 
 	rhdr = &amp;rec-&gt;record_hdr;
 	sdesc = &amp;rec-&gt;section_desc;
@@ -477,7 +485,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 				    entries[i].einfo_size, &amp;ihdr);
 
 		cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr,
-				 entries[i].einfo, entries[i].einfo_size);
+				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
 	}
 
 	free_info_arr(info_arr, num_entries);
@@ -511,9 +519,9 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	char *msg;
 	size_t msg_len;
 
-	msg = kvasprintf(GFP_KERNEL, vaf-&gt;fmt, *vaf-&gt;va);
+	msg = kvasprintf(XE_CPER_SW_GFP, vaf-&gt;fmt, *vaf-&gt;va);
 	if (!msg)
-		xe_warn(xe, &quot;Failed to allocate CPER message\n&quot;);
+		xe_warn_ratelimited(xe, &quot;CPER: message dropped\n&quot;);
 
 	driver-&gt;error_type = cper_sev;
 	driver-&gt;error_component = component;
@@ -525,7 +533,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	timestamp = ktime_get_real_ns();
 
 	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, msg_len, &amp;ihdr);
-	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len,
+			 XE_CPER_SW_GFP);
 	kfree(msg);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 5cfa32c75764..500207bd2e75 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_CPER_TYPES_H_
 #define _XE_CPER_TYPES_H_
 
+#include &lt;linux/atomic.h&gt;
 #include &lt;linux/cper.h&gt;
 #include &lt;linux/types.h&gt;
 #include &lt;linux/uuid.h&gt;
@@ -192,6 +193,8 @@ struct xe_cper_info_entry {
 struct xe_cper {
 	/** @on_query: Emit a CPER record on each RAS counter query */
 	bool on_query;
+	/** @dropped: Number of CPER records dropped due to allocation failure */
+	atomic_t dropped;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 87f51d7edfa8..47886897b4ac 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------tS5FUrs2O06K1KNIXDd9UTW6--
