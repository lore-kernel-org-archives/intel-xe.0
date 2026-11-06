Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D7606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GresS4ho
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A216112D69;
	Fri,  6 Nov 2026 13:32:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FAE112D6A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793971952; x=1825507952;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UPxkIw2rPnCUpMU1vXtFws9vX/ZGCXLTj9FLxxO+5HU=;
 b=GresS4hoXAxNfh/L6L/IRf/tUjqIdpDx21WgyIZzFdojsWlICyVJym2y
 44upTjG9rIj3ONdQXnNwP47jqVLRFms+udIaZHjOEHy4G1JtYwzsGuCvz
 mpDAfqZDSr3de3Cr3KazpOXACdnvF6k9R6GtCHOz5jlggwl+4oROYxhRb
 gVL8f2MJr3K7LCTOjhtT4myIDRy1P92loygcvVKlcBdEWzzFCexy6T6by
 Lx3u+rHCJsWDgncHECt2Rz4Ea6BkqfAOtviZHNgYYDd4JxTM2EacoEtys
 TTfN5VhM/spHIuQjxxMROJqpwQhBFRCh4tTxAvU1YIZnfFd35f/iwxOjO Q==;
X-CSE-ConnectionGUID: EJeW1sUfQSSVQhhkMBIL5g==
X-CSE-MsgGUID: 0YgkrnJWSOKDxXdT24UIng==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2661226"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; d="scan'208,217";a="2661226"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:32:31 -0800
X-CSE-ConnectionGUID: AHe2NivDR6O6rCvKlIQg4w==
X-CSE-MsgGUID: khGmT6jaQCuNWNtHKoP/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; d="scan'208,217";a="9149605"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:32:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:32:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 05:32:30 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 05:32:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK8QOgoOJo6cGx3sRR3dy3g43kQbN4pNTCY63L7vvltZoq5idb2/lga2ogPanqaY6T98l10zMWCzOwFPpMc+DNoyHR3H6lNOfHdnpT+6bLJYm0E0wYArpzXL+Y1l1yeVmhaMITrOWacpDYYIn1E59RzTw+QMmiubhv97j5tH9/IfFNIjB21D/yavzAt6zp8VEj0ugVFJS/ngySApFYM4kvTDJRJ+BMGOnXhFbB4ROrhV+eaxJFtGjCZz9C5Empn88f7qm6GNnrrqocBTp+VfJc8lV3oUuoztWpOTJPyjfCiWFFN5RsjefWM7kkF5QVi0sVONFScx/IvArk8x4eV3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fr0u0DDk3DeN1Pro1nP09DET8P58+UyEYj+YICHYaM=;
 b=RWOa+4vL6NdrjxIFb4H2u9HrNIYce6XxDiwpeudc7Tu6OdccIKBCbmOv9lHc4Ci41ucjzNmwA8I2yXWCS8G31fwUIhfXZvYqy0LSarlseVIYGuuekNXjaODkrjAUsbsOSiwrRs087u7XvhsM9Nr03aN+0uI/PW5UBSBHBB1E8AteZGBfg1zrSrojuzFdzOIANKZwD70v7WbGfXr2V57aQ9p3REO9u2D4qHJhNnG83pZ+bqw8smhCJNaSrMeP7enZco8mvHkHsRjFgpRvc6RN0UD/3tLWA94rnrPxmEiyhkPXmBVOe5k4vTtbiZglPVTCKD4Td7xFPDl7bSyl35eJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:32:25 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 13:32:25 +0000
Content-Type: multipart/alternative;
 boundary="------------8ysq8UFRbsaJ9xK4Xeetv1lQ"
Message-ID: <a4f08719-fe86-4805-ab89-aa372a76a9b8@intel.com>
Date: Fri, 6 Nov 2026 14:32:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <aravind.iddamsetty@intel.com>, <tejas.upadhyay@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
 <20261106073921.1512530-10-raag.jadav@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20261106073921.1512530-10-raag.jadav@intel.com>
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eacdf0f-8be0-44df-37be-08df3c0a6522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|3023799007|6133799003|10067099003|8096899003|56012099006|5023799004|11063799006|4143699003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022113327099003|261021121427099003|261022105027099003|261009220027099003|261009223327099003|261009223027099003|261009221727099003|261022075727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: t+IvpZ1BPOc993FuYjm9SN2VRGFYlRHin015t8kciS7OIAr4qPvzn/XZm7bKxhM+pWgS/+/s/IA4Pp75Z4PrP7xYEum65tlfLo66lAXsbqs5dpDN5tbGHqvqpPpjxnqaZ6tBIAK+llaSV5Pvksc80NEGM41W8nMHqwGc0w4fAf6UXeeYEiPSxWShhGNeARuoM3M84ERcewqw8eBHAz5rwejDxFFDnF+8w5ALAiUNPrc5j+B++intx/7AjkjsplfE+TwOYUpOnrQieX9gQfcigr7JDXjm59qaEUZdL+OQsZjboImxD2WY6ZkdcaGGNJq1m6dTn0P87KuehvNemAApSwWTVqLL3aJQtdycpEkcRm3xirlBVOQRN0bw44BCG/bHOcrWvGSkHD7tFjTTjiSGHdQIAAS7glFGmFMxaP5ELlUi1z47TvJYG2iUo7Mlj/n5N05LUL2aiSbWPcCqLg0J6gHLpNrjbwTktj9racnPUc66RU4NTgXiqqviMGz7mGkGP16CdyRImelA7BaY4MNUSat7RYuTuUpFk5ILd18goiewmWtGxKocQnRUEM90avlqgTQjXojYgoNzFEint+iYOIVXTxDiFB6IayurBWdeeZUByWivH5kFr6ZKttd+HZ4gpWd45ltU1PV0hyBObY/CvIiS3paJYbX5IxUpInXpa24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(8096899003)(56012099006)(5023799004)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261022105027099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221727099003)(261022075727099003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0d4bXZiMmYxNVNVN05OWTNJM2RDdkJKemp1aUNrbWpINlFvR2gwMm9xVW92?=
 =?utf-8?B?SDhCM3IrYTZidUtEcG50RTNMc1NLbFhDcEFXY0RBSWVFallqR1ptZDJpQ0pw?=
 =?utf-8?B?YThDRGpud1QxVDRmQVBtbEdnYS8vbThCYmo3SCswa2N4U3VLUkJPRDBHM3By?=
 =?utf-8?B?NjlNdWV2K1Mzc2w2aVZ2N1JBek94VjBaTFB6OUVoRzgwTjN0RW5jNjFReWww?=
 =?utf-8?B?cHJhTzdaWmxpYm1ZSHAzVVZJN3JIMmo1N1NralQyaHNNbW9lT0FjOGkzVVI1?=
 =?utf-8?B?MW5GcGZxdXF2aGpidkM0QkJDWDFhbHZ2RDVnM3pMbVB1OXlJTlRONkxGc0U3?=
 =?utf-8?B?Z0pLUVI5TG4vdmk2Sit0ai82NWJqZENFNGFyK3R5Z3FOaldBNVBmMGNWRGpr?=
 =?utf-8?B?VUhicW1MM25na3VTOVFoYk01bjR0VjA1SVZRWUY2ZlYzWUdsaXR5alZFVStn?=
 =?utf-8?B?TFk0dnBRTlZ0VWFrWndKMXpCM01QQnZPVlVUZHN5K2ErNGFFQm9mTWRUaFFv?=
 =?utf-8?B?TllCekJxL0I1N1hiUThoR0hTdGM0SVR0bFdJVll6WHI5L1VMMEJmOUdVY1I2?=
 =?utf-8?B?cHZjbXRMV0l6bjMzUVVycUhZTVNNUVdHUjNpQjVUdE5MMU5nU294WVhrVzI2?=
 =?utf-8?B?OUFjZGZqZUlTT0pDZ3NoSVlWaVprQlNlR1lwYTVwQnpCOUVLMUVNZUJIV1B6?=
 =?utf-8?B?OGRGUjBqakZyT0NzL2tUWFR0R25NNkx3Zjl0NGhUbDBxeWxKTXZ1S1pBTy9O?=
 =?utf-8?B?WEJaN1VmZnkxbmx6Q1p3OVVucEJ5bVVDQ1UzMyt5Zmc4VU0xYmtSQXhYMnEx?=
 =?utf-8?B?YmZtME9OZDBwTzRRR0pXUFFQOVlPa0o0L1lyK3pqS2JHOHk1KzVDVThrazFn?=
 =?utf-8?B?MDg4YjJVK1U0SUVwSVR4WUZqZHpzbmpkTGE0S2l6OTBZaTFOUzdNVmMraXFQ?=
 =?utf-8?B?VzNZSnA2QnBpNEU2N0MrOTdVRGJQZnJpL1ZBTTgxRzJwWko2UUpwSFNnajJS?=
 =?utf-8?B?REp1VnRLczZXRVFyYWNvSGVVT2JsR1lIc0pZVVh4bnJxM0hhL0llamt1YlRR?=
 =?utf-8?B?VExWZVBJTHg5SjF2NmdIcG13ZFhZUlBHTG8zeVVvQ3pRYUpCd2lGVHFIYVZN?=
 =?utf-8?B?WEpuL0tRVUJsN3FCS2ZVeUhKN1FqVG1ab25rUkZsaEpsSzFLbnJ5V1ppSm9M?=
 =?utf-8?B?b3dQNFZYaTRQQ0w1Y2ZPMnN1Z2JNbHhSejRpVzhiVXZMS3Q3R2hXcE1wVkpo?=
 =?utf-8?B?ZXZsdHI2OTFqOFJXVHhpQ21ibWI1VXRybjd2UzlhZWNMUG5MSUVvZmpLY1NH?=
 =?utf-8?B?M0xhL0luUHVuMk1HZkQ0NHk3aWRReXFwRnBPbGNwd1FieWxKOCtsY2RUMGhJ?=
 =?utf-8?B?cDBwNlgxSGMvdWdBdmtYN0RzV0R4aUFLM1BsZHhTQWpEWmQ0T0QySk1ydU9v?=
 =?utf-8?B?b0hwcG9tZ2ZWWm1vTGREUjRXTytiRjlyUzdvQytaSTNkbWQ5d3lndk02cWVU?=
 =?utf-8?B?MTlYdzRHMzMvVy9NNzFjNVFEWSsyMWJUci91cWpxNzFyc3R6UE5ucmtuYmZK?=
 =?utf-8?B?SnBOZWY0SnRNMlM3amJrN28wVEZGbnJvd0lNb1ZoVnhQZnhXY1JXb1N2SU9W?=
 =?utf-8?B?U1B6dWVVemxpK3J5UGpNVkYySWZNMmNUYmZTdThzWklyc09hdXU1T1JSZzZK?=
 =?utf-8?B?cHJKRU5YdUF6NVYyR0pydXhtRzk5Ky9obkk4WTNWWERnTWQ4TGJYSXE5eFc0?=
 =?utf-8?B?azc5U3luc1Z5Y2tCbkpuQTA1NWdVN3B3SEs5bVNrV2t6dFJYZVhBYmZJODZD?=
 =?utf-8?B?aW5nUFFPbG1YT3k3bGZqSzVkV21RT0l3bXduZElER0V5YjVPUXdyMU51ZjV3?=
 =?utf-8?B?aDZuY2dRVkU3TFp1eVVHQS96dUhrdTlqZjZkTFhDTHpTODVZcHJ5S0JhRUY3?=
 =?utf-8?B?L3JISG9xcVNxdkRQSmJYTXJkR2hVQzUzdmpLNmU4NzFNZ3BncUIvNjdocEVx?=
 =?utf-8?B?VzdXK0VDd1ozWnQxUEdWbnU0Y1AxeWYxS1FJRS9aS0dHTHVYdTVwRkxESEpB?=
 =?utf-8?B?N0MrWkFDc3JpN01wV0YxU2M1T0oxaFNmbzRUWkRwbUFPVEJWOTFxcHZwcGYy?=
 =?utf-8?B?UHgwbDVORmgrNDJXbTcvdDFEcnRxYXdJR0RFRUJmYTdaYmN1alp1QmpjdFN4?=
 =?utf-8?B?YlZ2eGR1YXI2VUFrZUdXUHhYWmFZTHBOeDM5VnBrTkd3aEJlVWo4RUtsWi9k?=
 =?utf-8?B?bWZIZXFpWVAra3lWWm5XT0tjb0V1QlBmVUlhaWxOaTlud2Q4NkhQTlN5ZnNO?=
 =?utf-8?B?UFlKSk96Q09RSkhHMFVCeE10d2hGMWtXL2dHeEFuT2dlLzVYQWxCUT09?=
X-Exchange-RoutingPolicyChecked: cWE/EdWJ4M8CB30ie7kYhf6Lh3W0sNSPGdHEzqYfEjP+sZt23PTzrO9wk9DloIgWHD+e78lBCrLsmn03XtmEm8Ca2kvbNZI9PDjACYfHBWCQbzsdKj3xEkid4SfqORkm9F01GaHSDsFjz37TxIWXC4J5pZaSM0hz3PaYSqPnQ6CAXs+7yWG1ywWGc5AGQaoaiZV7vMafTLHxPVF8LVT5oXicyod02F1NxL2DX1hYuCjw/hv7cYaG8LDekR7YjDsTMnMkXSsF3tA5HsJ1crd++A/sYoclExOA6V+9pPHJ2fYFaD4XE8Bff7Uu6U5Ikwje9d/52zgFrfOy8VhPjnc8gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eacdf0f-8be0-44df-37be-08df3c0a6522
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:32:25.5249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZfQh7euqRId0orh/xuHiEysdKzyvN6DKmIpm/bd/O0JhgtyFyGKMEdkDo5CwG8Z8ZsvgVRp2P6dS+vMbKDfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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

--------------8ysq8UFRbsaJ9xK4Xeetv1lQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/2026 08:38, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> Tested-by: Lukasz Laguna<lukasz.laguna@intel.com>
> Acked-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   v2: Spell out Function Level Reset (Jani)
>   v5: Prevent PM ref leak for wedged device (Matthew Brost)
>   v6: Add PCIe FLR documentation (Daniele)
>   v7: Refine PCIe FLR documentation (Daniele)
>       Introduce xe_pci_reset_skip() helper (Lukasz)
>   v9: Add 'Xe' prefix to document title (Rodrigo)
> v10: Update documentation to include PCI Error Handling (Lukasz)
>       Maintain wedge reference on FLR failure (Lukasz)
> v11: Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
>       Use 'PCI reset' in logs (Riana)
> v12: Refine error logging (Riana)
> v14: Early return on survivability mode (Riana)
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 139 +++++++++++++++++++++++++++
>   2 files changed, 142 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d99881c6e1d5..6dcaec224338 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -535,6 +535,9 @@ struct xe_device {
>   	/** @pxp: Encapsulate Protected Xe Path support */
>   	struct xe_pxp *pxp;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index be58fc9e22dc..129cf3395f16 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -13,9 +13,55 @@
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_sriov_pf_helpers.h"
>   #include "xe_survivability_mode.h"
>   #include "xe_wedge.h"
>   
> +/**
> + * DOC: Xe PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
> + * hardware needs a full re-initialization. The way Xe driver handles it, is
> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + *
> + * - Temporarily wedge the device to prevent userspace access
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Stop the scheduler and all submissions to GuC
> + * - The fact that FLR is needed is because hardware could be in corrupted state
> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
> + *   contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + *
> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up all hardware units
> + * - Unwedge the device to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Reuse FLR callbacks for bus error handling.

I agree we should reuse the FLR callbacks for bus error handling. I 
think it's a natural next step.

Aravind, Tejas, are you aware of this? Page offlining currently relies 
on the driver reload after SBR, so it will need to be adjusted for the 
in-place flow.

Today, when we're informed about a bad page that belongs to a critical 
(pinned kernel) BO, we can't offline it right away and we request a 
reset. slot_reset() then re-probes, and xe_ras_init() -> 
get_offline_queue() reserves the page before any kernel VRAM allocation, 
so the BO lands elsewhere.

With the in-place FLR flow:
- the offline queue isn't reprocessed (xe_ras_init() is probe-only), and
- even if it were, pinned BOs keep their placement across the reset, so 
the page still can't be reserved.

*For VFs this is an immediate problem*: there's no SBR on a VF, so the 
recovery for a critical BO would be a VF FLR, which follows this 
in-place flow.

It looks like we need to reprocess pending bad pages during re-init and 
relocate the pinned kernel BOs overlapping them.

Thanks,
Lukasz

> + *
> + * Current implementation is only limited to re-initializing GT. This needs to
> + * be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SR-IOV cases which need PF and VF synchronization
> + * - Re-initialization of all child devices registered by Xe
> + * - MM corner cases
> + * - Display
> + */
> +
>   static void prepare_device_for_reset(struct pci_dev *pdev)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -147,9 +193,102 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   	xe_info(xe, "PCI error: resume\n");
>   }
>   
> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
> +{
> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
> +}
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err = xe_survivability_mode_is_boot_enabled(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: device in survivability mode\n");
> +		return;
> +	}
> +
> +	/* No guarantees by PCI core */
> +	err = !pm_runtime_active(&pdev->dev);
> +	if (err) {
> +		xe_err(xe, "PCI reset: unexpected power state\n");
> +		return;
> +	}
> +
> +	err = xe_wedged(xe);
> +	if (err)
> +		xe_err(xe, "PCI reset: device in unexpected state\n");
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	xe_wedge_get(xe);
> +	if (err)
> +		return;
> +
> +	err = xe_pci_reset_skip(xe);
> +	if (err) {
> +		xe_err(xe, "PCI reset: not supported\n");
> +		return;
> +	}
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	err = xe_device_suspend(xe, true);
> +	if (err) {
> +		xe_err(xe, "PCI reset: failed to prepare\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "PCI reset: prepared\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
> +
> +	err = xe_survivability_mode_is_boot_enabled(xe) || !pm_runtime_active(&pdev->dev);
> +	if (err)
> +		return;
> +
> +	if (!xe->flr_prepared)
> +		goto out;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	err = xe_device_resume(xe, true);
> +	if (err) {
> +		xe_err(xe, "PCI reset: re-initialization failed\n");
> +		goto out;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	xe_wedge_put(xe);
> +	xe_info(xe, "PCI reset: done\n");
> +
> +	return;
> +out:
> +	/* Most likely the device is unusable and there's nothing we can do about it */
> +	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +	/* Drop local reference */
> +	xe_wedge_put(xe);
> +}
> +
>   const struct pci_error_handlers xe_pci_error_handlers = {
>   	.error_detected	= xe_pci_error_detected,
>   	.mmio_enabled	= xe_pci_error_mmio_enabled,
>   	.slot_reset	= xe_pci_error_slot_reset,
>   	.resume		= xe_pci_error_resume,
> +	.reset_prepare	= xe_pci_reset_prepare,
> +	.reset_done	= xe_pci_reset_done,
>   };
--------------8ysq8UFRbsaJ9xK4Xeetv1lQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/6/2026 08:38, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261106073921.1512530-10-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">With bare minimum pieces in place, we can finally introduce PCIe Function
Level Reset (FLR) support which re-initializes hardware state without the
need for reloading the driver from userspace. All VRAM contents are lost
along with hardware state and driver takes care of recreating the required
kernel bos as part of re-initialization, but user still needs to recreate
user bos and reload context after PCIe FLR.

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Tested-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Acked-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Reviewed-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 v2: Spell out Function Level Reset (Jani)
 v5: Prevent PM ref leak for wedged device (Matthew Brost)
 v6: Add PCIe FLR documentation (Daniele)
 v7: Refine PCIe FLR documentation (Daniele)
     Introduce xe_pci_reset_skip() helper (Lukasz)
 v9: Add 'Xe' prefix to document title (Rodrigo)
v10: Update documentation to include PCI Error Handling (Lukasz)
     Maintain wedge reference on FLR failure (Lukasz)
v11: Cleanup wedge reference logic in -&gt;reset_prepare() (Lukasz)
     Use 'PCI reset' in logs (Riana)
v12: Refine error logging (Riana)
v14: Early return on survivability mode (Riana)
---
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 139 +++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d99881c6e1d5..6dcaec224338 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -535,6 +535,9 @@ struct xe_device {
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
+	/** @flr_prepared: Prepared for function-reset */
+	bool flr_prepared;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index be58fc9e22dc..129cf3395f16 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -13,9 +13,55 @@
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_printk.h&quot;
 #include &quot;xe_ras.h&quot;
+#include &quot;xe_sriov_pf_helpers.h&quot;
 #include &quot;xe_survivability_mode.h&quot;
 #include &quot;xe_wedge.h&quot;
 
+/**
+ * DOC: Xe PCI Error Handling
+ *
+ * Xe driver registers PCI callbacks which are called by PCI core in case of
+ * bus errors or resets.
+ *
+ * Currently both Function Level Reset (FLR) and bus error handling callbacks are
+ * supported. Both wipe the VRAM and resets the state of all the hardware units.
+ * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
+ * hardware needs a full re-initialization. The way Xe driver handles it, is
+ * pretty much similar to system suspend/resume flow with a few notable exceptions.
+ *
+ * Prepare phase:
+ *
+ * - Temporarily wedge the device to prevent userspace access
+ * - Kill exec queues which signals all fences and frees in-flight jobs
+ * - Stop the scheduler and all submissions to GuC
+ * - The fact that FLR is needed is because hardware could be in corrupted state
+ *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
+ *   contents
+ * - Remove all memory mappings since VRAM contents will be lost
+ *
+ * Re-initialization phase:
+ *
+ * - Recreate kernel BOs due to skipped memory eviction in prepare phase
+ * - Restore kernel queues which were killed in prepare phase
+ * - Reload all uC firmwares
+ * - Bring up all hardware units
+ * - Unwedge the device to allow userspace access
+ *
+ * Since VRAM contents are lost, the user is expected to recreate user memory
+ * and reload context.
+ *
+ * TODO: Reuse FLR callbacks for bus error handling.</pre>
    </blockquote>
    <br>
    I agree we should reuse the FLR callbacks for bus error handling. I
    think it's a natural next step.<br>
    <br>
    Aravind, Tejas, are you aware of this? Page offlining currently
    relies on the driver reload after SBR, so it will need to be
    adjusted for the in-place flow.<br>
    <br>
    Today, when we're informed about a bad page that belongs to a
    critical (pinned kernel) BO, we can't offline it right away and we
    request a reset. slot_reset() then re-probes, and xe_ras_init()
    -&gt; get_offline_queue() reserves the page before any kernel VRAM
    allocation, so the BO lands elsewhere.<br>
    <br>
    With the in-place FLR flow:<br>
    - the offline queue isn't reprocessed (xe_ras_init() is probe-only),
    and<br>
    - even if it were, pinned BOs keep their placement across the reset,
    so the page still can't be reserved.<br>
    <br>
    <b>For VFs this is an immediate problem</b>: there's no SBR on a VF,
    so the recovery for a critical BO would be a VF FLR, which follows
    this in-place flow.<br>
    <br>
    It looks like we need to reprocess pending bad pages during re-init
    and relocate the pinned kernel BOs overlapping them.<br>
    <br>
    Thanks,<br>
    Lukasz<br>
    <br>
    <blockquote type="cite" cite="mid:20261106073921.1512530-10-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ *
+ * Current implementation is only limited to re-initializing GT. This needs to
+ * be extended for a lot of components listed below.
+ *
+ * - Proper re-initialization of GSC and PXP for integrated platforms
+ * - SR-IOV cases which need PF and VF synchronization
+ * - Re-initialization of all child devices registered by Xe
+ * - MM corner cases
+ * - Display
+ */
+
 static void prepare_device_for_reset(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -147,9 +193,102 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 	xe_info(xe, &quot;PCI error: resume\n&quot;);
 }
 
+static inline bool xe_pci_reset_skip(struct xe_device *xe)
+{
+	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe-&gt;info.probe_display;
+}
+
+static void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
+
+	err = xe_survivability_mode_is_boot_enabled(xe);
+	if (err) {
+		xe_err(xe, &quot;PCI reset: device in survivability mode\n&quot;);
+		return;
+	}
+
+	/* No guarantees by PCI core */
+	err = !pm_runtime_active(&amp;pdev-&gt;dev);
+	if (err) {
+		xe_err(xe, &quot;PCI reset: unexpected power state\n&quot;);
+		return;
+	}
+
+	err = xe_wedged(xe);
+	if (err)
+		xe_err(xe, &quot;PCI reset: device in unexpected state\n&quot;);
+
+	/* Wedge the device to prevent userspace access but don't send the event yet */
+	xe_wedge_get(xe);
+	if (err)
+		return;
+
+	err = xe_pci_reset_skip(xe);
+	if (err) {
+		xe_err(xe, &quot;PCI reset: not supported\n&quot;);
+		return;
+	}
+
+	/*
+	 * The hardware could be in corrupted state and access unreliable, but we try to
+	 * update data structures and cleanup any pending work to avoid side effects during
+	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
+	 */
+	err = xe_device_suspend(xe, true);
+	if (err) {
+		xe_err(xe, &quot;PCI reset: failed to prepare\n&quot;);
+		return;
+	}
+
+	xe-&gt;flr_prepared = true;
+	xe_info(xe, &quot;PCI reset: prepared\n&quot;);
+}
+
+static void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
+
+	err = xe_survivability_mode_is_boot_enabled(xe) || !pm_runtime_active(&amp;pdev-&gt;dev);
+	if (err)
+		return;
+
+	if (!xe-&gt;flr_prepared)
+		goto out;
+
+	/* Unprepare early in case we fail */
+	xe-&gt;flr_prepared = false;
+
+	/*
+	 * We already have the data structures intact, so try to re-initialize the device.
+	 * This will be similar to system resume flow, except we'll also need to recreate
+	 * kernel bos and restore kernel queues.
+	 */
+	err = xe_device_resume(xe, true);
+	if (err) {
+		xe_err(xe, &quot;PCI reset: re-initialization failed\n&quot;);
+		goto out;
+	}
+
+	/* Unwedge to allow userspace access */
+	xe_wedge_put(xe);
+	xe_info(xe, &quot;PCI reset: done\n&quot;);
+
+	return;
+out:
+	/* Most likely the device is unusable and there's nothing we can do about it */
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+	/* Drop local reference */
+	xe_wedge_put(xe);
+}
+
 const struct pci_error_handlers xe_pci_error_handlers = {
 	.error_detected	= xe_pci_error_detected,
 	.mmio_enabled	= xe_pci_error_mmio_enabled,
 	.slot_reset	= xe_pci_error_slot_reset,
 	.resume		= xe_pci_error_resume,
+	.reset_prepare	= xe_pci_reset_prepare,
+	.reset_done	= xe_pci_reset_done,
 };
</pre>
    </blockquote>
  </body>
</html>

--------------8ysq8UFRbsaJ9xK4Xeetv1lQ--
