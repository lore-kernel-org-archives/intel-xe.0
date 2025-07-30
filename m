Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B2C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 09:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB910E04E;
	Wed, 30 Jul 2025 09:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3gUuTYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73D210E04E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753866560; x=1785402560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKIQD9C8A5aBYW7rgrO79p96JmZNRUPRYiWkOIGsgwU=;
 b=N3gUuTYYhc0cxMP41huJi6ZjfSAdk/6r+ra4zE8RRsms1CrPAIbgNbKE
 qdnwWxFKL60x1rxUcQBUwS7MeXLguI+KC63J8dqjs2ymtQlwhRlH0xviN
 XFJG6YAR4s0tADSHb+xZqVA7eX+YRhx9umltYeBtBHi+s8KyE4TDS6Wmi
 CpBwNefixcPqU6Dwu9bCXLOVccHLA8EQxcDrmsTrCNE/rsMpnpzauLoZ8
 iy5uFzTfbRM+xBx9eWWyAYF2e3gfY5FH7GsxTeo1Be4s3zfQjVflkOwDW
 9cPrRJDvAc3j4CQntjIzBZY2todzcEF7WyxCkBdgR85BIxEKjL9hMhCH7 w==;
X-CSE-ConnectionGUID: a4Ut24tPRX2Z70KCzHtMLw==
X-CSE-MsgGUID: 2lIb6SreS1+jk4oncIyF0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56046915"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56046915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 02:09:19 -0700
X-CSE-ConnectionGUID: fwb90k9TTIeOpl0BfMHoCw==
X-CSE-MsgGUID: D0eGedJATla6JBF6mt+YDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167183335"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 02:09:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 02:09:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 02:09:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 02:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=va4gs83u2FCVIppq8lGy5/z3z0aK95MgfabfzLS1zQGPPahIprEgFJjDyc8mz9uy9+D3kQw7dqZCJzzNwX3AV0JP43v30Dr2d++qpLCjkhwjMm14L1ze08h06PVEeqhRh5/zUL9YmE2qTuT3cl3u5Tvzs8NQYUDCXSbwNT+/1ponHqV61ltJmzuLVcrjFSlUBCx+HEwTkERlFZMvgAgy7t3RVmbHvMROqYU2T6a4yA/+xRf+F/94fW4T4n8RAKMRVW+Yg/5ih2BlZAZtqFFm/qGtECFJ3GSt7xnu/NmitMlmjdyFvNdRt7EznDQ9Nfs+qd++43pFQlWlbb93vmC7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWFf8bSLBr0weX9sdi3jNfQKN5JUvKs8ILyF3SSmJio=;
 b=Z9m+nq4AQ8iZF23ofHZg/TsLSFrSfK9LhbU7LZx0DXqZlZFeXdVY/pz+Uo6dYnfl27TGu/AzlvCzNbryH5wF7JkOXd5wFiXQ3zpOjzlzWDZAyjWi5eTDBHDNWggJxx4vO7dL3XCiIosk46rQpixLrwIUnqh51fO8W4OQuxApV2mq7T+3TS2/YeKEQYUQRakOmNbJmGesPqwhW7IA/CiNpkuIlFk6pJn7LhWqzhAjUGJAPM0m4FbXG2NPV7kswIlTNWmrky6x6Gbh6dgs8znbBgefbZ6z3wEc2PiHMskPdHiDljZIiZPa4w6NUmqpPByD/9kHKLpvnlz+hZpxfoBKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 09:08:33 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 09:08:33 +0000
Message-ID: <f0645201-b423-4db1-bba2-9628fd81a571@intel.com>
Date: Wed, 30 Jul 2025 11:08:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/xe: Handle errors from various components.
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <anshuman.gupta@intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
 <20250730054814.1376770-2-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250730054814.1376770-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 858aef15-dcab-4d08-add5-08ddcf48a8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUF4VVlUbHJtcHVzTklwQVhGdHVZUy9QdWQxR3hiaTdvaTRaNFVNOXFnMENC?=
 =?utf-8?B?VElvLzNjQUU0YW5rZzhVSHV1TlNIRXhrNXdmaVBhdXFYVi81eE5RQ1Evak5I?=
 =?utf-8?B?ZFIwMmF0WVdjREU0UW9GNDgrMFkyWWEvM3F3SzIrR1lzM3VpaDg4ei9pODVR?=
 =?utf-8?B?U0FKd0J4bzZNekM0NnNnUUZkYWZvK3RNdXZQVDZ1NzFMd3lYc3VhWjdtNEtB?=
 =?utf-8?B?NWlmcEtmUlpkZVVDVjUxZFZ1TTh4U3BnTHRNbEVtdXZIUXkzbFRSOXl3TXJu?=
 =?utf-8?B?MnVKRHlTK2cvNnZlMkcvZFRXUDJqOWxxejE1L0s0b0x6Y3NnV2NBUUZGbEo0?=
 =?utf-8?B?NWVNcERUSmt4UnNnb1d2U0RhT2VMd25NRWxBMVJVNEFxWEc3N1NIMWVJNXpx?=
 =?utf-8?B?QkJlM3ZMZG11My9KdThOVnJ1VjdKOXA1SVV5d3YyZkc2TmdXTjA1OUgwd0lu?=
 =?utf-8?B?bWRMSFg0SkVoeGxheFkvSS9OV29XT0dWVWZZcFFNbDJ3UmQ4ak1QaER5SGFv?=
 =?utf-8?B?d0Q3T25Nckg1Z1RmcUQ4dTVBZFVwUXBPbWtBR0ZmSXFhMFZ0VmRYYVNTUms5?=
 =?utf-8?B?ZnF2UzZ6TXdlTFQvVGRnODEwR1pwZDNSRWNDODR4dFo0YkJ4TUowU0Y0cVZN?=
 =?utf-8?B?czZLMkwrWnZ6OXY4ZXlSQjhlSk5naFp6WjZ1YXZhaStuRkhqLzdrV2FOSlI5?=
 =?utf-8?B?aWRVMElSRFZqVVpMZFJWR3pNbDZTRXhCd3RiTmNONGUzUHBWa2poM3JOK2tK?=
 =?utf-8?B?Tnd1Zm5PNHJvKzFWRWk4bkVRVS9mczJ1NE9aeTFJWEhnUDBiT1g4Y0ZLVjdI?=
 =?utf-8?B?V2lEd2dBVmxsak9MUm1Ba0thc2poYmw2OUpsOERRV1NSeWZadWtRYVZNZ2Nh?=
 =?utf-8?B?WVkvR0dOTlNzeVE4TzZUUzN5WXZxRFh2ZG1sazREWVlCMW1BQ1RIQVEzclh0?=
 =?utf-8?B?SHZRZzdrOGl2bkxBMk96TWFPVWNqdW5taTdUbTllRWN4S285MnNYMWREMEc2?=
 =?utf-8?B?T1NUSENMMnRjb2kyYm5PM0lwVWFzWFQ0cEZaT2JFU1JMSUVMUHBVQmE5NVV4?=
 =?utf-8?B?UlhkMkR3VGJhMGExVCtCdnNvQktjRU1sM3prUzRlREZLSHI4ZGtMak1pVWFq?=
 =?utf-8?B?T0ViMnd2YjVLYk1CMjVQajBqbC9ZQ1FPS0RlbTRJZGxOZmVGejNkVTVnTEIx?=
 =?utf-8?B?VjlVY1BuMUJ2dmZ2RVBIQ3hNWEx6bklIaTZSNHRiWmdYait3UlV4T29DWEk3?=
 =?utf-8?B?czZzRGx3NjhKWWdZSUNadFh0RGlhajdGTjJzUlJYeWp3ZkU2RmY5Wlg1NkVR?=
 =?utf-8?B?NkVPZ2psRUdFdUdVWHMwS3JleEdFWXY0QjkyNURyMkYrK3hHYmhaY1lpT2tQ?=
 =?utf-8?B?M3ZreWdjdGVpbHlvMGRyS244K05zbDhJeFVUMi9jVXhVOEF4Y2dsWGhKdHZk?=
 =?utf-8?B?ckc4ekRZekJaa1orR1FKNktyVDZCZHd2SWxVemNKcXpDWE9URGNJekJGNW50?=
 =?utf-8?B?aTVRNEpVUjBOdVk4Tkh5Nk43N3J5eUcrOEgyb1pnOStmSFFITVZnbkhDVXht?=
 =?utf-8?B?SVZiK0tqMWJhZEhocTVtZHRNbHdhVGIzMmUrZTkyVGdVeDdKRk9seklqNnR6?=
 =?utf-8?B?YUpBV2E0VjlaZExGcXl0TkhBQkRlQU1vbUdUTFVWdEMzZGpBZVVDbE04T3A2?=
 =?utf-8?B?SEp5K1pkYXpqMm1CaDFvL3BBN1BkekU5OWtOZE82UUh4Y0d0NFBtaXd3YWk5?=
 =?utf-8?B?RnBMY0F3cktLMjM4TnlqTVh1eldPbWtYdUszblZzU0xTSWhoc29FYURHQXZl?=
 =?utf-8?B?c0ZRckN2dHdvQUd0NE5wYTErWjlveXRXbTlHVWlJdHZxNmE5ZXBPUTB5ZGlT?=
 =?utf-8?B?cmJOd2ViZ3VzQStHQ0ZsaExGVHFzT3lrOG1renU4SEVaN05yNTdzQ3V6cGVl?=
 =?utf-8?Q?mjhIg+j4o1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0I0eXNJSWlmcGJtUkk5dWhDcGFDVlBOYTI4QWV3eUJ4M04vYStQbjU2QVNw?=
 =?utf-8?B?Ym40VEN6djIvdTVWSGxPUXVXRzA3VkpBdnd6eDNIQ2hCUkJNVWZYczh5UWpy?=
 =?utf-8?B?NkRaVlVseXY0azVQRUpvMExFWEc2UFNxb2NOOVhKVmxlM0luQlM3eWo3UHlx?=
 =?utf-8?B?eitEZXVvRWRFUTZYUHEzVm91ZjQyTnI0TXcycE1yNEdzQy9sRXdYWVZiZ2xN?=
 =?utf-8?B?UkhNYnp0ZzBEM1FWTExDMlFvNDRaS1VNVjQxMDFUZWJSeGV4ZEtleDMxWnJw?=
 =?utf-8?B?Nkk5Y0VvU1VjZHUxNlYzZ0pVcmlBc24xOGV6Z2NGT0F2R2cyZlU1R2dYSjdQ?=
 =?utf-8?B?OWx0ZUp1VEQzK0ZBUVM4WDVtMmlFcVFoZ1ROSkRvd1pvb2RwVUxEeGlLYmNq?=
 =?utf-8?B?V3g2aGJPa0xhcmQrMkhEck1IUVJkWks5NjRXVkQ5NUUrT1NsKzNiNUtPYzdM?=
 =?utf-8?B?WWY5VG85UWhWV1VrR1d5WmFRbThoUzJKREJ5R1B5OTQ5VGFwRFp0ZUxmek5S?=
 =?utf-8?B?K1ZHMm1kQy9vN09VYVl4ZjZNa3BCYWhwakZSaUFpZFViZytvZUpuYWVleXZS?=
 =?utf-8?B?UTgrUHRTRW5RbHhjeThDNklrNVFlUVV4dUlobElxY3J5V1dmdEJFQURWMzZX?=
 =?utf-8?B?NjBhZERTTjZjZDNqTUMwUHp6YWVITWhyeHF0YkhwNk5GT0VzUllta2ZCaUVS?=
 =?utf-8?B?RXBGcmgrVE1GQUlnM1BGbFFVRkFrYU9ROUFuN1lRa1ZuU3gvSHZtLzFqTmo4?=
 =?utf-8?B?aExCM3BaVEpBZXpJTFdUMi9qOWg5RmRMN0NwNlN6MHNkVmIyd0IyWE1MTjd4?=
 =?utf-8?B?Z2ZGUVZMb2ZOQk05clRSWTc1M2N1ZXpJRnRDTTVBMkhwck9aYi9sZlpYSHlT?=
 =?utf-8?B?N05SS1dueGVqQ3pRazA0RS9TdDVQWjFxZGE3NVFIOStobG1mMFFVWmlNRXNV?=
 =?utf-8?B?TXRCWi82M21Fb0poL3M4R1F2RXpmRTFickVpWFp5WEpYeGdrMjh3QnhNbTYv?=
 =?utf-8?B?Qk5EQmlQMmxFbW9tYWMvcWtvZFQyUmhvZmFOcFNkNkYvY2hYY0pJeEhmc0Vo?=
 =?utf-8?B?TWIxaHNoQ3RYR2RhK2dKU3NvaXE2QStZVURPeGVMWVRUUE5xeGkvUEkxdUts?=
 =?utf-8?B?OW5xeHpmckR0MUM5ejRIM1FGWHk5eit2VWdRNlB0SXJJemk4YkdGV3pPT0dh?=
 =?utf-8?B?M0x6WDhhZUtnQjNSK3c1b3gzcWRrSHZpaUR3Y1ZwZkVuaElscGRaWUNCZHJs?=
 =?utf-8?B?ZnNZVC9TVUYreHJBamhNVW82ZVlzMHBENUtCcCtQOXFWWms4RWVOMmVHNUI5?=
 =?utf-8?B?VEhiWnR2dFU4L1A0OVFLb3FnV0ZxZUx0TlVnYkwzQXIvZmZZTGNvWVZhK3VF?=
 =?utf-8?B?K2pJVjZsSGt3SWg3UzRxc1JYUk9tQ3BsdnFZLzZkYVhONFZlSWw1c1AyQ040?=
 =?utf-8?B?Rk1RV2Z3dFRsVjNLZnpBeVgvdXM2NXIzMlplSzdLNzJvRzJVcFp5dElhYjEz?=
 =?utf-8?B?S1M4MXc5cUk3NmVyUjZiem5BdDZIU1QzNDQrTmtKVkhwV2hxWnhEUlJyTTI0?=
 =?utf-8?B?ei9ualBUbHJPWWlycStHL0tuTUlCWTRPaVdxNi81bGgvRlpsN0o1U1J4M01H?=
 =?utf-8?B?QmdhenNrb1JyNW1WSWV3UmlMd1prUlRCcjRkMmVnUXNWam05WHYvNVdrbmhG?=
 =?utf-8?B?OG0zRmZqeUdicWwveTRpV3FqQkNIbG02ZDc5TUt6WHJTYVlGcy9TRTR5UE03?=
 =?utf-8?B?c2FxMzJxeEtxRFJZTkt5Szk5NzYvbDNVK2tSMXlzY0s5ZkxFdGJJOXY3VFo5?=
 =?utf-8?B?UjI5SEV1SU9sWGJITGFkbUpvWWI3TkFYSHFNU3JOTHhhd0pES2l1RG8vTkts?=
 =?utf-8?B?RTZ4QjJ5UndOdE02YmlJaGZmckpFVVFTUzdJZU9RelcwNk83c2lqcE92WkJ6?=
 =?utf-8?B?RkhjR3FwSU1aRkg4d1ZQT1YrMnlnY3oxQ2k3aW1EdEZhb1dYbU5WaWFXY0Nx?=
 =?utf-8?B?cDNKcmE3eWVSeURKVWF6VHZ5UkpwUi9VNFBiYXZ3cUNpUjBrajdEcmxBYVJB?=
 =?utf-8?B?R3JubGN4S0JmUlVWRDRuY293cnJEMms0TE5NRWFXR3dCMmxRaFk4OXUwaFhk?=
 =?utf-8?B?MzV1ejViZzBBOVIxYmJTL243MFptczJqSVFYSmgzUTFiVm15RE1LWG03SUNO?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 858aef15-dcab-4d08-add5-08ddcf48a8f6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 09:08:33.7483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iZ4mDWNEAjg4yOTACYNIBnaJdGixjPaM0Ij9R/PhQ1enC768IBHZFrPSgBEobA/m/ac/P61zCtUIJZ+t8VLYfHoTWn2J95Kuc/Yxf+ZB60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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



On 7/30/2025 7:48 AM, Aravind Iddamsetty wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> The GFX device reports two classes of errors: uncorrectable and
> correctable. Depending on the severity uncorrectable errors are
> further classified as non fatal and fatal. Driver will only handle
> logging of errors and updating counters from various components within
> the graphics device. Anything more will be handled at system level.
> 
> Correctable and NonFatal errors are reported as interrupts, bits in
> the Master Interrupt Register will be used to convey the class of error.
> Determine source of error (IP block) by reading the Device Error Source
> Register (RW1C) that corresponds to the class of error being serviced
> 
> Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
> the OS will perform a device warm reset which causes the driver to
> reload. The error registers are sticky and the values are maintained
> through a warm reset. We read these registers during the boot flow of the
> driver and increment the respective error counters.
> 
> Bspec: 50875, 53073, 53074, 53075, 53076
> 
> v6
> - Limit the implementation to DG2 and PVC.
> - Limit the tile level logging to only PVC.
> - Use xarray instead of array for error counters.
> - Squash the fatal error reporting patch with this patch.
> - use drm_dbg instead of drm_info to dump register values.
> - use XE_HW_ERR_UNSPEC for error which are reported by leaf registers.
> - use source_typeoferror_errorname convention for enum and error loging.
> - Clean unused enums and there are no display supported ras error,
> categorize them as unknown.
> - Dont make xe_assign_hw_err_regs static.
> - Use err_name_index_pair instead of err_msg_cntr_pair.(Aravind)
> 
> v7
> - Ci fix
> 
> v8
> - Avoid unnecessary write if reg is empty incase of DG2.
> 
> v9
> - For reg being blank print error for DG2 too.
> - Maintain order of headers.
> - Make XE_HW_ERR_UNSPEC 0. (Aravind)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                  |   1 +
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h        |   1 +
>  drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  13 +
>  drivers/gpu/drm/xe/xe_device.c               |  13 +
>  drivers/gpu/drm/xe/xe_device_types.h         |  10 +
>  drivers/gpu/drm/xe/xe_hw_error.c             | 258 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h             |  50 ++++
>  drivers/gpu/drm/xe/xe_irq.c                  |   1 +
>  drivers/gpu/drm/xe/xe_tile.c                 |   2 +
>  10 files changed, 352 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 42c6ca5b3f76..80eecd35e807 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -82,6 +82,7 @@ xe-y += xe_bb.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
>  	xe_hw_engine_group.o \
> +	xe_hw_error.o \
>  	xe_hw_fence.o \
>  	xe_irq.o \
>  	xe_lrc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 13635e4331d4..086ec7584b1a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -18,6 +18,7 @@
>  #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>  #define   DISPLAY_IRQ				REG_BIT(16)
>  #define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 1926b4044314..00900d3821f7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -9,6 +9,9 @@
>  
>  #define SOC_BASE				0x280000
>  
> +#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
> +#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
> +
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> new file mode 100644
> index 000000000000..ba5480fb2789
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_TILE_ERROR_REGS_H_
> +#define XE_TILE_ERROR_REGS_H_
> +
> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
> +								_DEV_ERR_STAT_CORRECTABLE, \
> +								_DEV_ERR_STAT_NONFATAL))
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d04a0ae018e6..e0625fa5b1ca 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -875,6 +875,8 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	xe_init_hw_errors(xe);
> +
>  	err = xe_irq_install(xe);
>  	if (err)
>  		return err;
> @@ -952,6 +954,15 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
>  
> +static void xe_hw_error_fini(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	int i;
> +
> +	for_each_tile(tile, xe, i)
> +		xa_destroy(&tile->errors.hw_error);
> +}
> +
>  void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -961,6 +972,8 @@ void xe_device_remove(struct xe_device *xe)
>  	drm_dev_unplug(&xe->drm);
>  
>  	xe_bo_pci_dev_remove_all(xe);
> +
> +	xe_hw_error_fini(xe);

this should be a devm action registered by xe_init_hw_errors()

>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 38c8329b4d2c..233c2751d09f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -14,6 +14,7 @@
>  
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
> +#include "xe_hw_error.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
> @@ -206,6 +207,11 @@ struct xe_tile {
>  
>  	/** @debugfs: debugfs directory associated with this tile */
>  	struct dentry *debugfs;
> +
> +	/** @errors: count of hardware errors reported for the tile */
> +	struct tile_hw_errors {
> +		struct xarray hw_error;
> +	} errors;
>  };
>  
>  /**
> @@ -575,6 +581,10 @@ struct xe_device {
>  	 */
>  	atomic64_t global_total_pages;
>  #endif
> +	/** @hw_err_regs: list of hw error regs*/
> +	struct hardware_errors_regs {
> +		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
> +	} hw_err_regs;
>  
>  	/* private: */
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> new file mode 100644
> index 000000000000..84830ad81813
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

2025 ? everywhere

> + */
> +
> +#include "xe_hw_error.h"
> +
> +#include "regs/xe_regs.h"
> +#include "regs/xe_irq_regs.h"
> +#include "regs/xe_tile_error_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const struct err_name_index_pair dg2_err_stat_fatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_FATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_nonfatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_NONFATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        = {"MERT",			XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_correctable_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_CORR_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_fatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[13]        =  {"SGCI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        =  {"SOC ERROR",		XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[20]        =  {"MERT Cmd Parity",	XE_HW_ERR_TILE_FATAL_MERT},
> +	[21 ... 31] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_nonfatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[13]        =  {"SGCI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        =  {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        =  {"MERT Data Parity",	XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] =  {"Undefined",            XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_correctable_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 31]  =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +
> +static void xe_assign_hw_err_regs(struct xe_device *xe)
> +{
> +	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> +
> +	/* Error reporting is supported only for DG2 and PVC currently. */
> +	if (xe->info.platform == XE_DG2) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
> +	}
> +

else

> +	if (xe->info.platform == XE_PVC) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
> +	}

and I guess the 'if' ladder shall start with newest platforms first

> +}
> +
> +static bool xe_platform_has_ras(struct xe_device *xe)
> +{
> +	if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2)
> +		return true;
> +
> +	return false;

this could be one line

	return xe->info.platform == XE_PVC || xe->info.platform == XE_DG2;

but likely it should start with

	if (IS_SRIOV_VF(xe))
		return false;

> +}
> +
> +static void
> +xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
> +{
> +	unsigned long flags;
> +	void *entry;
> +
> +	entry = xa_load(hw_error, index);
> +	entry = xa_mk_value(xa_to_value(entry) + 1);
> +
> +	xa_lock_irqsave(hw_error, flags);
> +	if (xa_is_err(__xa_store(hw_error, index, entry, GFP_ATOMIC)))
> +		drm_err_ratelimited(drm,
> +				    HW_ERR "Error reported by index %ld is lost\n", index);
> +	xa_unlock_irqrestore(hw_error, flags);
> +}
> +
> +static void
> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct hardware_errors_regs *err_regs;
> +	const struct err_name_index_pair *errstat;
> +	unsigned long errsrc;
> +	unsigned long flags;
> +	const char *name;
> +	u32 indx;
> +	u32 errbit;
> +
> +	if (!xe_platform_has_ras(tile_to_xe(tile)))
> +		return;
> +
> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
> +	err_regs = &tile_to_xe(tile)->hw_err_regs;
> +	errstat = err_regs->dev_err_stat[hw_err];
> +	errsrc = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
> +	if (!errsrc) {
> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +				    "TILE%d reported DEV_ERR_STAT_REG_%s blank!\n",
> +				    tile->id, hw_err_str);
> +		goto unlock;
> +	}
> +
> +	if (tile_to_xe(tile)->info.platform != XE_DG2)
> +		drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
> +			"TILE%d reported DEV_ERR_STAT_REG_%s=0x%08lx\n",
> +			tile->id, hw_err_str, errsrc);
> +
> +	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
> +		name = errstat[errbit].name;
> +		indx = errstat[errbit].index;
> +
> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
> +		    tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_warn(&tile_to_xe(tile)->drm,
> +				 HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +				 tile->id, name, hw_err_str, errbit);
> +
> +		else if (tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_err_ratelimited(&tile_to_xe(tile)->drm,
> +					    HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +					    tile->id, name, hw_err_str, errbit);
> +
> +		if (indx != XE_HW_ERR_TILE_UNSPEC)
> +			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
> +					       &tile->errors.hw_error, indx);
> +	}
> +
> +	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
> +unlock:
> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> +}
> +
> +/*
> + * XE Platforms adds three Error bits to the Master Interrupt
> + * Register to support error handling. These three bits are
> + * used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *       Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced
> + *	 and log the error.
> + */
> +void
> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> +			xe_hw_error_source_handler(tile, hw_err);
> +	}
> +}
> +
> +/*
> + * xe_process_hw_errors - checks for the occurrence of HW errors
> + *
> + * Fatal will result in a card warm reset and driver will be reloaded.
> + * This checks for the HW Errors that might have occurred in the
> + * previous boot of the driver.
> + */
> +static void xe_process_hw_errors(struct xe_device *xe)
> +{
> +	struct xe_mmio *root_mmio = xe_root_tile_mmio(xe);
> +
> +	u32 dev_pcieerr_status, master_ctl;
> +	struct xe_tile *tile;
> +	int i;
> +
> +	dev_pcieerr_status = xe_mmio_read32(root_mmio, DEV_PCIEERR_STATUS);
> +
> +	for_each_tile(tile, xe, i) {
> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> +			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
> +
> +		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
> +		xe_hw_error_irq_handler(tile, master_ctl);
> +		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
> +	}
> +	if (dev_pcieerr_status)
> +		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
> +}
> +

missing kernel-doc for public function

> +void xe_init_hw_errors(struct xe_device *xe)
> +{

shouldn't you check xe_platform_has_ras() here?

> +	xe_assign_hw_err_regs(xe);
> +	xe_process_hw_errors(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> new file mode 100644
> index 000000000000..398e2a7f2ac6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_HW_ERRORS_H_
> +#define XE_HW_ERRORS_H_
> +
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#define XE_RAS_REG_SIZE 32
> +
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +/* Count of Correctable and Uncorrectable errors reported on tile */
> +enum xe_tile_hw_errors {
> +	XE_HW_ERR_TILE_UNSPEC = 0,
> +	XE_HW_ERR_TILE_FATAL_SGGI,
> +	XE_HW_ERR_TILE_FATAL_SGLI,
> +	XE_HW_ERR_TILE_FATAL_SGUNIT,
> +	XE_HW_ERR_TILE_FATAL_SGCI,
> +	XE_HW_ERR_TILE_FATAL_MERT,
> +	XE_HW_ERR_TILE_FATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_NONFATAL_SGGI,
> +	XE_HW_ERR_TILE_NONFATAL_SGLI,
> +	XE_HW_ERR_TILE_NONFATAL_SGUNIT,
> +	XE_HW_ERR_TILE_NONFATAL_SGCI,
> +	XE_HW_ERR_TILE_NONFATAL_MERT,
> +	XE_HW_ERR_TILE_NONFATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_CORR_SGUNIT,
> +	XE_HW_ERR_TILE_CORR_UNKNOWN,
> +};
> +
> +struct err_name_index_pair {
> +	const char *name;
> +	const u32 index;
> +};

shouldn't above defs be in xe_hw_error_types.h ?

> +
> +struct xe_device;
> +struct xe_tile;
> +
> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_init_hw_errors(struct xe_device *xe);

naming seems wrong:

void xe_hw_error_init(struct xe_device *xe);
void xe_hw_error_irq_handler(struct xe_tile *tile, u32 master_ctl);

> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5df5b8c2a3e4..1e9cfb8bb85d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -468,6 +468,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>  
>  		gt_irq_handler(tile, master_ctl, intr_dw, identity);
> +		xe_hw_error_irq_handler(tile, master_ctl);
>  
>  		/*
>  		 * Display interrupts (including display backlight operations
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d49ba3401963..b00c517e5559 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -91,6 +91,8 @@
>   */
>  static int xe_tile_alloc(struct xe_tile *tile)
>  {
> +	xa_init(&tile->errors.hw_error);

shouldn't this be part of xe_init_hw_errors() ?

> +
>  	tile->mem.ggtt = xe_ggtt_alloc(tile);
>  	if (!tile->mem.ggtt)
>  		return -ENOMEM;

