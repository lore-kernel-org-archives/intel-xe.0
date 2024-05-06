Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB3C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 09:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430DD10E847;
	Mon,  6 May 2024 09:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maT2zwFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98C10E847
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714987506; x=1746523506;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JJWZye9X2NKRpNzTIiP/NOhM2z4Kuz/e4Ve6aEuiLuk=;
 b=maT2zwFn+aD5pQk1k8BrzQ56Rft7WQB7TYL67jXs7DfkHQNIuFos215B
 URU/Sr74LxrmcYTYnW/Vh/Z9z+pUJ8r1Db09Lga22EfrAlb2GmhQVW4pn
 rFev8+NyTyQYQCanZ7gq0rIb+t8ivWytaICYEntbYpBzmPgw81SbEoLxp
 O1Dbg0wuczdpJSksxDuODMXTH118/D0iyp7xlPmZyGyW29CYMoNnzUSua
 UToprLzOKIGd/nmthKoTa/+SGpGVdrCwS3jd7874p5kVJQNG1R5xXZEiE
 55bQHp7ynET/bEayxkHIAQbyARVMKzSKlJUFVG9VqANJ8SIGp9tO7ywqH Q==;
X-CSE-ConnectionGUID: g09ChUQkTrakTsvy3q7dsg==
X-CSE-MsgGUID: BIrn3+IPQAmIPMnC35anYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21879780"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21879780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:25:05 -0700
X-CSE-ConnectionGUID: Edc/6wZyTWi67+4MK/H9fg==
X-CSE-MsgGUID: eho0e0RLRG6oXNtk9qA3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28623754"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 02:25:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:25:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:25:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 02:25:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 02:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYbS+3HT2ZZZ8RkuIMtdJ1VnrZ7lZuPpuPauZgXahW2fc2ghMFG9ci77ssLRYWzCfhAKVk97uq0L8zbSK30QiYAPy+ZOEoeE1/8pmvqjcTXgRcMB/OHV5inocS5cB3G8AtoiwILYMzYrE7SbU5Z+KGqtKVe1S/YAO4asLZG+i3lWw0f26jRrWb+v8jeMevdZTCcjR5l675vsIbZcW3IAzdH4cExfGyRrbLLPipn6NgN+84DCH6ERn2GTnNS47VH01FYuOnZat8Uabwjut8Xcwb7evXN2gWmTb4tuQOwrCNWk3TuKLhPSvcBWWyvrKWgA8S1ilY1Z8MObpXIpF+NYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRIlyyfhxGuEkGniPNvW2PoEYRL9zmfdSfkaLtqG37k=;
 b=DhKWIM+7xK8haVbfEniAnfj9F+XxtL8ybSit9LzMdNuQl32xvPfrgbai5LRj1bf1j/WCQFyco8dulBN57YnMjt5GLmPL5t7axLDHtrQpJSkaomgNcUSMnLdBolgLkTHGCjxkklyyMHNrSsVJQJAR9QA8O4mLEjT1eBX2K8sqRjkrydr5RDjn6tXbuUl0yp5FjxZzH2p/HvuBBI4Ht+0TI0KUTLcadzOtyRYNX7rUmKWcBuQFBawIGZCbr2iJQXRngeDBZilWtnFFt7u6YWj7XGEAGmu2Y0i4kJkp3w+LMbODTXadt7fktyXmL+4alKpO+DBuhjMNVDwYmSjE+PFSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Mon, 6 May
 2024 09:25:01 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%7]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 09:25:01 +0000
Message-ID: <4e8142ab-0191-4bcd-95b6-20c95ce9bbb3@intel.com>
Date: Mon, 6 May 2024 12:25:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Refactor default device atomic settings
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Brian
 Welty" <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>, Jose Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost
 <matthew.brost@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <6fbb932b-9525-4fce-9376-30f422da703d@intel.com>
 <7e379db6-3b3d-4129-8254-29ed548408d5@intel.com>
 <72c32248-a381-41a9-8504-4f07b3f60b2b@intel.com>
Content-Language: en-US
In-Reply-To: <72c32248-a381-41a9-8504-4f07b3f60b2b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 86273bf7-8d1e-43a6-d587-08dc6dae67fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVFyRVdSeFMrUUI0VHp4RmRSSHRjeDJNM2E4NWdiNWg2Ynh0cUZIZlVJOFZs?=
 =?utf-8?B?ZWtyZnJMOVlFNWVCdmEvbm16ZXZYT2EreTlITHNPRTY1SWx1WUdRcFNkS2hS?=
 =?utf-8?B?MjJmWWU5K2x0N09sdTBCUnR3Zys0SmNvem9jbEh6T3NTa3h3R3RHcXl0NHpI?=
 =?utf-8?B?VGZ2bUxpSTA0TXRBT2JYZkVMV0NsMEZVejFNVkJsb29ZWHUzbG1pU013d3RW?=
 =?utf-8?B?b3F3elVmREtxSmpyUFFNYTBaVnM0ZE43WkpDNWxOZXdSd0ZkbVVIRG82WlQw?=
 =?utf-8?B?QTF4bnE2QU5EazhRcmh0RDNZNWxma2dCVjdsdmVVM3BTNGVRSVZURk50UW5p?=
 =?utf-8?B?Y2UyMTJUZ05mb0VhQUZsOC8vdG9BK1hZT2FEY2dLeThaNXRRZ1JBbUcrNDd3?=
 =?utf-8?B?a2lSakhjMDZ4K09MMVRwSndwd1FvUVQzekFta2krSmhHaUVZMUxmejRGSVBw?=
 =?utf-8?B?SnBuYm8rWVFWTFN6RER3eW95QTBxWlBoTDRFR2VvVis2bDF3ZFZ2NllJV05W?=
 =?utf-8?B?c0RuZjdYN2kzcnJjazlmdXNZcFA3cHFlNFhQV2ZxOGpsSVRMRXJzVFpKOTZE?=
 =?utf-8?B?aUcrYXpveHhlSktRbkJ5dkdYRUdTYUlQS3dKM2xjSjRzazduYi8zVVE0MkI5?=
 =?utf-8?B?aGVNZnlETm9TL0prMjUwZk9hM1ZuTkxFS2FocmNxSGJwbE5Hd2lYNGhOTTRw?=
 =?utf-8?B?SGwzeDlJdkdNdmJqQ2EwSWJhb3Q3RGllb3d2N0J3RkhoQW5sVWhxZVhHM0VE?=
 =?utf-8?B?VU0wMzlQSG8wRzNrR1UxdTcwK1FtV1dYdTVmdWM5bUNRZmFMdkxGWDRFQ29I?=
 =?utf-8?B?Y0ZFM0JtWGMva2RFN0M4S2JCMVZrb0ljRmZudmZ4V2FFWTJ5bXIrazl6RVJh?=
 =?utf-8?B?QmVEQW5IaHpXL0VLNStaaGlkOHhSMk4rSVh4MXZOSlVuSkR0cElpeVlwT2dC?=
 =?utf-8?B?bmx3L1dNMzIzSkg4WDdRNGl1Sm9UbVRIQ0RybUZKanVhalRsVE1kWmk3VHhN?=
 =?utf-8?B?U1pLd1lsbGF3UVFJYy9ZbVlBQ2o0VjZSUU1xbWd3S3FCZSt4aWNUUU4vUWNa?=
 =?utf-8?B?SVB4Um9IdHVBcnVveG4xRVZMUnM5NUd6ZUtqaUFGM3kySWZiR1RxY1RnK1l2?=
 =?utf-8?B?bGZoNVJXQlh1QVZKWHdOMWFNM1J3cWllWUVHSEJYbENjQnNuWW80V0pzK25i?=
 =?utf-8?B?eW94bFNyWWMzQzd3VXdvSEZoSlRRWUsvaGFucnRMTE1vWnRBNDVRYnB2L2lI?=
 =?utf-8?B?N292U2V1aUMzNnRKN0d5TGhlWk9NcTgraGdWWGlGZ1ZZOTJhZVNsN1o0ZVFO?=
 =?utf-8?B?S2p4NXREYWNPaVF2SjdwN0RQUUI0dzVjUEE3dXNNd2hPV1NkQmxwaFVWcXRG?=
 =?utf-8?B?Szl4L1hWUGRVcEY3S1BnbGxFUTZqdWJDaXVnYVc0WVBqYlFhanNyb1djU2hx?=
 =?utf-8?B?ME5LVUNQdlNlN0FjRXZNSkZuRi8yeSs1MEdqeVJlMFZhVGwzMU4vbm9DMlNr?=
 =?utf-8?B?a01Obk1Icy9TaktRYnlMa3dXRzRxSXRYSHBnSytVMjdncjZZM28ySTZuSDhV?=
 =?utf-8?B?cDdWc3VoU1lLTVg5dS96c05QaThta21wUGo4R0lHOFdFRFgrdjJBOXBtR284?=
 =?utf-8?Q?avIm0/ixMwnh7MDSY73vBs6vLLpJ19tUMHsAvjcvPnBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0t5bkY2dE10cFdzUE8rem5Oak4vc1ZBWFNvNEtvekY2K2pIU1hvNlhaUHhN?=
 =?utf-8?B?eHRMZWkvM2VaMGd2Y3pMNWVNb1pydUt3cFJCKzV1YTdnb052UEtNcnlIaUM4?=
 =?utf-8?B?cmpDeWZmOGtiUzN0ODZwNHZUOHNDeTZiYVh5blJlUlZZaTBFU2QvSzBGQTV4?=
 =?utf-8?B?dHg5emZnMjR3blJhOTRjcTZvczN4RGk4ZkZIWm8vdGhoVnhPU25ya1I2dE95?=
 =?utf-8?B?OVdpYk5ON2U2cmtVQkdLNlpvcCtQbkJtcTVvUDVENWd5RnhOeUtyK3gxQ0N6?=
 =?utf-8?B?UGVWc1RwV09ZYktYQWpYM1hGakhleTdQTTBPVEFRclp6ajhabGNSZmxLTER0?=
 =?utf-8?B?VDc2bDdvSlpORTAzTXRkS3poTHZ1cEJQOTc0YWhWQTJvZTNBdlp1Wng5MjBy?=
 =?utf-8?B?VGdOMzRKSEpwa2dmS0g1RmdhMFArVENXT0x2b1FMcHl2RzlHajBFcEtycnRz?=
 =?utf-8?B?cjUwbHlQcTQrcW5tNmtwRm5ZN1kxQWE2MktBRWZnclp5OWFWVUhHVjgvbmFP?=
 =?utf-8?B?RzNqTjhHWklyYXA1Y3I3elBJQnBCSjVQNGhWOUU4ejZRSVZOWWZMNzdmOGxK?=
 =?utf-8?B?NGJCMmtEWXpPcEhab0RUemV3V2ZGa1RtQVNwQlVpaFgyNHIyMG85QzhNN3NL?=
 =?utf-8?B?emk5VzZsNUpMdWdFb0pCcmQzSU1WdHFjV0t2UG9TWmZQblUvZzd6RVB0MXJZ?=
 =?utf-8?B?MkFqM2owRGtjSnE4VlpUN0VGa0d5a2pqT0VrUGxZMHlzS2VGYUc3bFV2bGZz?=
 =?utf-8?B?Tk0ydlNxY1FqZzRoWkNxRXlJWi9LRXJWbGx4bXFaREIxZ1Z5ZDN4bUpqTzgw?=
 =?utf-8?B?ODFuRlYrZndUcWJDVXcwbXRVMnRqOFI5dEpwNnF1dGd0dXZta0hUWE5EOGlN?=
 =?utf-8?B?dnZpSS8vWlBCS0Vkak51d0dEQWkrOEF1N3N6elhUSnU2NElvUWN6Z0JMQ3RP?=
 =?utf-8?B?TkxDSjNrUEg4anQ5VUZNOEpFK2NOSTYrb2RqckErNURzWmVzZDF6Ynh6cjVl?=
 =?utf-8?B?WXFxNE5OMjdNV1ZKemp3MHFJUHVLRjJreXY2MnltYzFNcVpSNStubG8va0pR?=
 =?utf-8?B?VkgyMzF1TkVUbGRwcXBrWi9BQUxiSlhtN0ZJa3Z3aFVnYWx5WUlkWHNYVitZ?=
 =?utf-8?B?MzJwSUFmVmNHQThUSiswbDFRRDhDQkRuWWJVd1lVK21LWlNrc2NtOXdzanpX?=
 =?utf-8?B?QXJZREdUL3dzK0piY2ZEUUk0cUhLcWZ6T0lTSWV2eHJ3Q1FESkZ3RlE1eE1o?=
 =?utf-8?B?V29FS3dUS2NVdTNXdnhxTGZRUXhKWkNBK25Hc2tFUEdid29zUmpLbGd4TEZr?=
 =?utf-8?B?L0gzbTMvRXNzN1Q3RTFqS3prdzRXVUNEelMya1pnVWgwMkVXVGRvY3pLR2dD?=
 =?utf-8?B?bGV4bG5vRW90a3VQTDlNWDBpOHMvczFxTHdINGtQdmFhTnNiaGVvVTYxdGhn?=
 =?utf-8?B?bHkxcGFVTjd5cG95T1FFQy9nQTlQUFdscFlPUWhFSGNYT1NyVVY0Q1BDNFQz?=
 =?utf-8?B?QXRjbmo5aDMxL3F4U0dJYUVSdkdsckhEN2Y2Y0hUM3VPSktlVDB5MW1MV3ov?=
 =?utf-8?B?YUtQMG1jaTJJR2dWV1VEUjAzNXArQWFJdmlGdHRHdkQrZTFYcFJ0SHhUMnFG?=
 =?utf-8?B?NGlRd3VmUGtBeFpWZDlocXpTRXdHdERETUI1UTArZWNPdVAvQzVzZWNBdkZz?=
 =?utf-8?B?UXh0RDFyeCtSVmd1OGgwaGx4WDE4a1BUTWs3dnI1dnZyTGhONnB6QVA4Wita?=
 =?utf-8?B?YjRuMVAycDBsak9HRFJ2MGt2Z3NWajhVVzFXeHUyRys2K2tvZ0NkK3QvWnVV?=
 =?utf-8?B?M0NpYmpjZDdETGZuQ2lqQ3hPckx4K09BZEF1ckNtRndsZVR1dTJlNEZwU0tG?=
 =?utf-8?B?aUxmRnJXd2M5MkFzWEVzMy9XMlpYZEY3NjByY3FPNDdBVjJ3VElOMWpVN2Qv?=
 =?utf-8?B?NGorUUNBbVE1NlZacDF2cnEyMllQRXFZUDkreVkrTUVoZzd0SmZNRjcvc3BC?=
 =?utf-8?B?ZVVhR3JBTTJkU2QydGpQdTIxNEs2aXlkS3ZINjdtakRGOXAwZVVjaXJnQjVy?=
 =?utf-8?B?ek5WRWU5NmdFQnNITDM4bzNuY3UyT3ZDTGZIUW54MVg4OWh2N0FlZGRQc1A4?=
 =?utf-8?B?c25FNTBoS1ZaM0JyeUxsOUxxTitteTdwNzg1MWpBcExocXo5L1dnNTFjb2p0?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86273bf7-8d1e-43a6-d587-08dc6dae67fb
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 09:25:01.6898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKAaCXlMykKm24B7rPBtcQdoL62a9D9YsbUoOf1utQNen4GvyKYK713KGKZJoVBHryIuYffTzZOZuvNGxVRBKm1SVJvdqBFHb056xRFa5OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
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

Since my understanding is that with this series we don't need to change 
anything in Mesa and atomics just work like on prior platforms, this v6 is :

Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks a lot,

-Lionel

On 06/05/2024 10:13, Lionel Landwerlin wrote:
> On 03/05/2024 12:54, Nirmoy Das wrote:
>> Hi Lionel,
>>
>> On 5/3/2024 11:47 AM, Lionel Landwerlin wrote:
>>> Hi Nirmoy,
>>>
>>> I've updated our Mesa MR for this : 
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823
>>>
>>> But then I started to wonder if we needed to do anything at all with 
>>> this v6.
>>
>> No, there is nothing to do for traditional APIs.
>>
>>
>>> The only scenario I'm not sure about is this : a BO is created with 
>>> 2 placements LMEM+SMEM. When Xe migrates the BO from LMEM to SMEM 
>>> due to LMEM pressure, does it set AE bit in the PTE?
>>> And then if promoted back to LMEM, is the PTE config DM=1 and AE=0 
>>> again?
>>
>>
>> For traditional API( not using fault/LR VM) then both backend will 
>> have AE=1, so on LMEM pressure if the buffer is backed by SMEM, it 
>> will have AE=1 as well.
>>
>>
>> Regards,
>>
>> Nirmoy
>
>
> Thanks a lot Nirmoy.
>
>
> Then I think with this series we should have everything working in 
> Mesa without having to change a single line of UMD.
>
>
> -Lionel
>
>
>>
>>>
>>> Thanks,
>>>
>>> -Lionel
>>>
>>> On 30/04/2024 19:25, Nirmoy Das wrote:
>>>> The default behavior of device atomics depends on the
>>>> VM type and buffer allocation types. Device atomics are
>>>> expected to function with all types of allocations for
>>>> traditional applications/APIs. Additionally, in compute/SVM
>>>> API scenarios with fault mode or LR mode VMs, device atomics
>>>> must work with single-region allocations. In all other cases
>>>> device atomics should be disabled by default. PVC needs special
>>>> care as it doesn't support device atomics on SMEM.
>>>>
>>>> v6: Only check LR mode to determine compute API as fault
>>>>      mode requires LR mode(Jose)
>>>>      Set AE=1 on SMEM+LMEM allocation when a buffer is migrated
>>>>      to LMEM from SMEM(Brian)
>>>>
>>>> v5: Fix broken atomics on PVC from v4 changes.
>>>>
>>>> v4: Previous assumption that device atomics should be disabled
>>>>      by default on SMEM only BO was wrong as traditional applications
>>>>      will not use such allocations for CPU atomics. So remove the
>>>>      VM bind flag and the query uAPI and instead refactor default 
>>>> device
>>>>      atomics settings as per VM type and buffer allocations.
>>>>
>>>>
>>>> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>>>>      Remove redundant coh_mode param from 
>>>> xe_vm_bind_ioctl_validate_bo().
>>>>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>>>>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>>>>      config flag 
>>>> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>>>>      Mention that PTE_AE will not be applied to userptr(Matt R)
>>>>
>>>> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>>>>      Use XE_IOCTL_DBG for checks(Matt B).
>>>>      Move platform checks with help of adding flags in
>>>>      intel_device_info(Matt B).
>>>>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>>>>      Create query uAPI for this newly added VM bind flag(Jose, 
>>>> Lionel).
>>>>
>>>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>> Cc: Brian Welty <brian.welty@intel.com>
>>>> Cc: Fei Yang <fei.yang@intel.com>
>>>> Cc: Jose Souza <jose.souza@intel.com>
>>>> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>>>> Cc: Oak Zeng <oak.zeng@intel.com>
>>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>>
>>>> Nirmoy Das (5):
>>>>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>>>>    drm/xe: Move vm bind bo validation to a helper function
>>>>    drm/xe: Introduce has_device_atomics_on_smem device info
>>>>    drm/xe: Add function to check if BO has single placement
>>>>    drm/xe: Refactor default device atomic settings
>>>>
>>>>   drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
>>>>   drivers/gpu/drm/xe/xe_bo.h           |  1 +
>>>>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>>>>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>>>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>>>   drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
>>>>   drivers/gpu/drm/xe/xe_vm.c           | 79 
>>>> ++++++++++++++++------------
>>>>   7 files changed, 103 insertions(+), 38 deletions(-)
>>>>
>>>
>

