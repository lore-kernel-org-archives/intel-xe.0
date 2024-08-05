Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F080C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 07:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0889289;
	Mon,  5 Aug 2024 07:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVoOj+1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A483589289
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722843015; x=1754379015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S5WCu2rMlfnMr0ulxTfL1XxHculSKFQ7R3/n+nHygkI=;
 b=NVoOj+1bog3Y7rbQfReT0ySguN1WD+4VA17ygq1UAkt/Izj2IzPrvABW
 lvDDPzSFqQuiRJtfOYe9LGOnhHMoZvidIMgWqI6n/bsZ3gp+rTeIuuB5O
 lRkkxryyJfu0YyyobNVSu5fA3aIPTO32oQ2jQ65IJUSO4YFfovQ5faGAH
 kvH73I1zND0R6Ihiwx9ESIwFhObx4vELO+IEcLQfn7nDizn1zj8bjmPsh
 9mjdbNYhG+i4QP2I7QQED1qC5wKQ/d1n10cGMiGnOGbFUiMiL2f8t68gS
 gna4ELceQPl2i/5QHbbN0y9bmmfFe+RsBSaaZ5Qu7Xd1xPVyfjNNL1wuI Q==;
X-CSE-ConnectionGUID: A+iYNdeVSYytdQkLxzJ/Bw==
X-CSE-MsgGUID: XAV32yqCSUCAwYcnf5n0MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31366717"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="31366717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:30:14 -0700
X-CSE-ConnectionGUID: rZ3rbz+JQEqHWp6ucofR/w==
X-CSE-MsgGUID: 2xc9NYBARKWJecnVm7syZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="87026511"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 00:30:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:30:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:30:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 00:30:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 00:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+s8kXWJdujQlnPKyeFBCllmQ9gh5YyTeJG/gxaK3MryEGhK4mjGRk08+xU8hU0hgQVszcOxUbuhY+6S8Y9XoQ4KKPSwfAn5eOqSwGZ2BKW/RitIGPgruFxsM+hOas+u+5YnzqahQpKdIXBoOzHtVFDzN9q+2Sdz3Rb4o4hcfmG+5uLwTV1oqZ7d8aaM5vYvL4imncG/S3iH3I5oZ67kG/ch31MNXBPk1qV4U28r60HNKzwTO5zznABis0EztwfhIW1tfzI2vAESCtsLWpPAI4HPrdBygq1uVr0XrXTGG2e4mXDHWRSEO+1JMJ1ZzfbcsvLJWVG2jQyZtCYwaU7tFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trmrIV8NUTI536bdbOygR5TgEicwz1b+efswRrDnlNs=;
 b=IvHoUlM7OfGSvLw4LJqPxi53xYtWf/uWwJdiekvDHwes0/ui5shFdLnHn7vN7/M4FAL6v+sjv9U4C5G4h9QlRwJuOgZTqWKgwf6Mj64v6GIp1b5Z9vG9pvNy021o2fFgPMhGd1QVX/vAUQufJZdcpkC2KBZdDZycnPoc9ufaSDO96tqHfSeyokCU0RwTCkcy1hc6O1RYerDZhfc/nsJaUD/f3jy7MnG2CrmPlbIV7EplReErWVT6lQ8fyu0SfgNypCtegXgrgbh4W/HaOgJrhNK3vsWNk6aBVI6yIFUAHseOb+gjqoTTt5ukN8EDyyejdeVdJ8Q/1BDqQj6W6jrfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 07:30:10 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 07:30:10 +0000
Message-ID: <ab9c8f18-f007-437a-9837-fbeff9c901c9@intel.com>
Date: Mon, 5 Aug 2024 12:59:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/observation: Drop empty sysctl table entry
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
 <d86275db-f65f-4481-9f92-24c5b8c8cf1e@intel.com>
 <87o767a31d.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <87o767a31d.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: e80b534a-ff26-4d8d-b432-08dcb5207032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWVJbEQ4c3J6NmlqMTVGUjhkVGxDUndoOWZPQ3hHZ0YxVnZXSXVuSkcvYUhq?=
 =?utf-8?B?a2RVKzlzT0lwN3VPTnI4Sm5Da2hEVXBRRWFkR2x0VGpCVXZ2M3gvYmthMjFS?=
 =?utf-8?B?cUk4Z1ZwSlRzc2pVZnBCRVNaUmFGRXBRam0wQkNRUHBFbmkwaEhCU2RCa3JD?=
 =?utf-8?B?RVRKc2FQMCtkcjQ1SG9zWGNNZmp2eHFoczg4S1lBcm9zM1N6dHZaZ3RNMlh1?=
 =?utf-8?B?akhvUlorN0hOb2lVdU1ybytPUGwvbkRYb0ZNcG5vQVhud1hvQ3poMVlqb3JG?=
 =?utf-8?B?NTdnK1dtUzdvaFAxeFR5OWgxbnJWSVJPSEdWTXJBUXlwZU9vVm9NRktIM0F2?=
 =?utf-8?B?SXRENXgzV1J0c0k0cGVpN0h5aEZSS1ppMktSZ3BFZkRYOFRBckpMV2dYeU1H?=
 =?utf-8?B?SVdTRW9YY2pHakNmRUFCZEd5QmR4eHhUUENLWGtmMkh1L29TdE55ckJpWmty?=
 =?utf-8?B?cXR3NG5ENVE1WVh3bEtncVUyYTZBOWFhYjRYclVMT28wVjJETlEvZFdKYy8r?=
 =?utf-8?B?VGhmVityUUNvVGdIaXhIR21VTFA4NXhBTmtYQmtPeHVQZmhEcFpqVjRLRUo0?=
 =?utf-8?B?R0lHZjFUMm5DRnNsRFkxNTh3SDBDR2lTRDNxNVhxVHhkeUFtVk9pRTZxQ3ZJ?=
 =?utf-8?B?RkxjY0xHcjNkZlAvbCt0MW5oalViSnhIUkpaRWtsbSttV3ZYNXh2b0RpQXJE?=
 =?utf-8?B?R3JyOXQ2b0RqS3FTS3dNSGNzbjBEM2k1UHVGbFExWW1jdVJIT2hqd2R2VHcz?=
 =?utf-8?B?ejl0TDdIc0FwemRuaVJJTjJ1Szl4MCtlMkRIQU8xU1picGZPUEhKckMxYXo3?=
 =?utf-8?B?eHB6NlZGRnh0NmN1WWhpc1BPaUhsa0tLZFVlVE5PNVFlaDNKSkFqYi9PdkZo?=
 =?utf-8?B?WmlNRVJQZGhlRmNucndtbkJSQmdvNXBWQ3FJT01CZ1hCOW9XYTMvdE9IS2Y1?=
 =?utf-8?B?ZVJnYy82L3U5L0xVZ2lEalphQzRmNXluQ3VCOHFleEZOSW81dnV3THhBaVJx?=
 =?utf-8?B?anRrTGZ2R3c4T3ltZ0NYaUlkQ0p5SFlyMmFwVE1sOHNIbWxEQmdjUzhzS2x3?=
 =?utf-8?B?STd1WlQxcnFxOTV3ci9WeUNvc212bCtXL0U2MTYzeVJobG1IMEw4WmRGR01F?=
 =?utf-8?B?akQ3UzB0dWxBZHVlRURsTTkrcmxPNHJUVzZGUFk3Wm5zRWxnNDhUOHpIc0RJ?=
 =?utf-8?B?OVVVaHRCeit3WTNlMHJvV2g5Z0l3UVh3dWwyTUNzb25RS2F5eTAvSzJKZkZD?=
 =?utf-8?B?QlNWR0NOcCtOMDcxVTlpOFAvQTk1OXdTd0VlbnduMGZCQ3puQ2dOYjkrMEU0?=
 =?utf-8?B?bm9VS1BEN0Zuc3duRk50RDhNSnUyNEY2VWFveVNOM0ZmQmlJQ3VUazNWWFBZ?=
 =?utf-8?B?YlZtVEZ3ek1IT1VUM0JkdThyQXVJNVYrWm1pTHVheE1pUzdIeXA4TnpNYkQ5?=
 =?utf-8?B?VGJnZlgrOTN1UFZhdVpsa1h4UjlYeVlCOUhHMEJicjZ0WXRpU3hmSlRkWUN0?=
 =?utf-8?B?S09yZU5xeG4xRjNzMXd1Vk4ydFk0cVREMWRmYTNHcjVPU2toWkFKSW8weFMz?=
 =?utf-8?B?ZFQ3TTN4eHM1MitvY3k3djc4UmtBRERvdk1kUnZDTHl3NlVJWHhUUTFyVldU?=
 =?utf-8?B?TDFINHNBdEhrSVFHanBTZDBPZ0ZXcHFzdGhHS2Rlb2lZQUVyTmplMmgxekJt?=
 =?utf-8?B?NjVEUzRObENTUmJUeFhuQUMvbGlTUmhRekJiZ3E0RXVCeitpR0hFNHRDRDhG?=
 =?utf-8?Q?rrp2dLTL0uJHdujg4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a291eG1iVDFvbHZOdG9DblZ4dG1ta0R4d1N4cjVnbVRLRjBXZjlUdjRZSnBF?=
 =?utf-8?B?QWVoUHJYVmk4U1kweDdJazd0OTNRUHhVQ3JvdkVtdUJmMFRtZjF5WEtvMEF1?=
 =?utf-8?B?VzFEUU1QWkZIRUQ1aFdhTXNseTBuZUozcm81L3ZHQXRab085RE8yd3VUUDgy?=
 =?utf-8?B?eW9UaHpueE43TVQvUUtVVDliYWlCbFg0WGkrSG11UlhvaDJoL1BGOFdGWjZU?=
 =?utf-8?B?M0Z1QU45K3JoRHRwcnVKQXUrMVlxOERMMGV0dGlpR1ZESkZzY0l5T2dKNC9q?=
 =?utf-8?B?UXp4Y0tPZ1hFa01MVnl3OVhRQ1FXSkV0R3BuM3RJelFvdGd5NllabitpMyt3?=
 =?utf-8?B?ZHJabWtVNGJZb3Z4YjVYMG5tSldSamdudzV1bVNMWWcyNWdZTG56TmVDWE9H?=
 =?utf-8?B?L3ZJdGdoQzVDaEJXMXhpRXhuSXgrQ1J0MU9KSkxVNGNpR2txRG9SdjkyYWhq?=
 =?utf-8?B?eG0vaWJTVnFISWgreXhUZ1lHMkZvSUt6bnhDSFdNbXJteUIrajVmam9uZnZz?=
 =?utf-8?B?NjJuTnR5MnRlVnYyVVNKS2NCMWpsdkxOTGlWNWEzWjNkWlFSblcxbGNmNE5G?=
 =?utf-8?B?dnpvTGUvVFdLZngyYUt2ajkrSlhvdURoR2dTY3NHb2NmNkswOVV1WFUycW9t?=
 =?utf-8?B?NkxjQ2JKa1QwY3ZtclB1TDFJbUZCZGt2bDJVYXV5SG1qcHJRa0pYRmp4QUJK?=
 =?utf-8?B?dzRuUllIRVRKeVlQTG9EUWV5THdCT3h4dW56a0dJRXIwQTRrOW1ZNk8zeStw?=
 =?utf-8?B?NGU0SThXWEw1ek93TEEvUzRpbi94akJjQi9WRmVKRnZ4aC9xWnNkdjd3YUJV?=
 =?utf-8?B?cVdNUDYxeFZ3cjFqMEtrckdnUTYyNThYYkFYMVgyL2JUeGg0S1pXVzBzZ3FY?=
 =?utf-8?B?TVJvKy92Q2RxMjNwVUUzaEJqU2JrS25vMXZUUlBZSGRLaUlxcWVNbmdMaFdF?=
 =?utf-8?B?QWM5ZzRyUG43MFN0dEkyOXVlbGJwYUJZYW5ZVWVkeWRIUHJYRlZGWGlGeEsx?=
 =?utf-8?B?NWk4bXhSMDgrMHBOZlp3YzN0T0hZRHJtcU5pRmd5S3U4QWdoc0l5ZHdzZ0Nl?=
 =?utf-8?B?U0gwSUhTakhxa0w1eEN2RUMrN1R6SngycndSTE1xT1NwOFhNRmgwZkVOdFZH?=
 =?utf-8?B?a2NTT0VXYTEvcTBTb3BTNmtxRWJSd3Fod3JUaTUrUUFuQ2IrV0ZyVWVpeWY1?=
 =?utf-8?B?b0lFV0kzUTgrOTRKbStBMmZQZ0NtaVRFOWR0TStER0dmeTlLVUlhaFpkQjVJ?=
 =?utf-8?B?YUlvRFgvcjFqQkNHamF5ZzNKVFkzRm5YUmY0cFBEeDhEN3FaNkVyWGRkRkhv?=
 =?utf-8?B?UFVpSW5tZzkya2dQK1dRRzVOYjk1dkRXRzNJc2g0V1pZVnE5TXdnQU0xRkc3?=
 =?utf-8?B?bDR5bEJrRS9LbnVPL250aGlMYzJhYVNSZ0FjRXlLc2g1akR0WlZhM0hDdm9E?=
 =?utf-8?B?bjNLRjJnTHRmV250bTVsdGcybnVYaU1DT0VrR3IrRyt4YjFRcjhoZ1Z3aGh1?=
 =?utf-8?B?T1FHL3pNRnB0TmZ5bVhVZ3FZMUJZeVBTUkJ4TldtYkgyMm4xUnN0eTlsZGFj?=
 =?utf-8?B?U0E4bmQyOE1wYTAxRDkxWHlTT08xTjJYUE16OU1HaEdCaW5Gc2pzL2lUd3BD?=
 =?utf-8?B?S1loWUxTNEhwb1hRcGwwMVBMQ2Vjd2RCbXEweFJoVXF2Ny9pK1VQeks4dWhv?=
 =?utf-8?B?a3YyekhXQVJHQnVEMy9CV3crb1dwQUdBSE9kWWN2aEVSR0NTRTQrWnFmRVlx?=
 =?utf-8?B?Sy9TNGdsSkVqc2ErVlp1QjEyanA4MmdJVmh2YWMwVVliQWdBVFFUK0lPNDdq?=
 =?utf-8?B?RmhXM2M4anc1dVJ6dkZUbXovNFdBYmtURCtGa0NWYlRFUlJpK3BXT3hXOEE2?=
 =?utf-8?B?WnBTbXFHMEpQeVlyZklITFIrczFRRzVXZTduaXhNM3VIeWc2dmNuRGZ5QWpO?=
 =?utf-8?B?MEt4UFMxWHIyKzNnWk9BcjA5NStla1QrY04rWlpFcHBHcnNWc01INVZLNDEv?=
 =?utf-8?B?Zmg5MDFEbk9hS0cvRy9MSlFhY1Zua2xsM01uekxVbCtoL0pLOUFmZ3grakhw?=
 =?utf-8?B?L0VxU0JaN0xoVjd5bGpCWGdZbnZFZHFObXoxZElpY3E2VFVnNk5oaFRqN3E3?=
 =?utf-8?B?azhPY3YrZFN1Um9kVG1Jb294UnAyVU9vRHRibDBBaVZiRVZXZE5FRHRpbDZ2?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e80b534a-ff26-4d8d-b432-08dcb5207032
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 07:30:10.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1rLXWNLFjhNNg516Pw/wBdf5zChImav/hoZv+vabDIEwys53wGjX/Z3zn7Af/lKWqPt3trcrgfVOBU3BCjgz4/2CgN/CcsKaDVyL1UBue8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
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


On 8/5/2024 12:07, Dixit, Ashutosh wrote:
> On Sun, 04 Aug 2024 23:39:19 -0700, Chauhan, Shekhar wrote:
>> [1  <text/plain; UTF-8 (7bit)>]
>> [2  <text/html; UTF-8 (7bit)>]
>> Drive-by comment:
>> I see a couple of articles, citing the removal of sysctl sentinels starting Linux 6.10. Is there any plan to remove this
>> from everywhere else from the kernel?
> I don't see these elsewhere.
I meant for our XeKMD.
>
>> On 8/5/2024 11:50, Ashutosh Dixit wrote:
>>
>>   An empty sysctl table entry was inadvertently left behind for observation
>> sysctl. The breaks on 6.11 with the following errors:
>>
>> [  219.654850] sysctl table check failed: dev/xe/(null) procname is null
>> [  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler
>>
>> Drop the empty entry.
>>
>> Fixes: 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_observation.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
>> index fcb584b42a7d5..a78c92a44ec2d 100644
>> --- a/drivers/gpu/drm/xe/xe_observation.c
>> +++ b/drivers/gpu/drm/xe/xe_observation.c
>> @@ -66,7 +66,6 @@ static struct ctl_table observation_ctl_table[] = {
>> 	 .extra1 = SYSCTL_ZERO,
>> 	 .extra2 = SYSCTL_ONE,
>> 	 },
>> -	{}
>>   };
>>
>>   /**
>>
>> --
>> -shekhar

-- 
-shekhar

