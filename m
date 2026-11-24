Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E002606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z5zQAp1g;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UM1l9hB2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70BF10ECC6;
	Tue, 24 Nov 2026 06:31:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45210ED0B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795501870; x=1827037870;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yq6+ZS/+7M90UCeGSfwjlVZSWR8hsrSYepc7br7SQYM=;
 b=Z5zQAp1gHSuV39yiIoEPPyi9Gc+4d/hA3y/SObml4TuYMOdygnmebezB
 uZ+6rF1uJpKptI1lPIhpA0QH2h7RHECzfJLC4n8ayk4XHh0gDDKw/b+n9
 fWcFsVEcNXr66RZ9L7UAQ0pIMu+LkZeUL9RbLnzZGyJ9CB59yYdgphiNw
 5L4swrzw0WZRTlPT1V9gNZuBQ5Fe+H1akAyOI9xy32dya6gSeoywQ3Ytn
 +TbFkbCkK6IWLhkhVerv0klHehXgEeGAhNPW1mppHw4sXDJgS+DUzQM30
 P0s8lCZ08Sss506qImCEuGMRLf8B7zFJXzDiBIcVNEulAEF9Yhp0KUeQT g==;
X-CSE-ConnectionGUID: io31qbioS+SjHRbu3xYnOw==
X-CSE-MsgGUID: B4s6V41HQOytyj+vISjX0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4226641"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4226641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:31:10 -0800
X-CSE-ConnectionGUID: VqtV+BK5SLKDPU6ip1iMbw==
X-CSE-MsgGUID: b4h6z4U9QBCICP5QHRoDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11692997"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:31:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:31:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 22:31:08 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:31:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW7UM2Qijnra/rYNX4N38M0qfSRfZAlZEfxiNbB7xNWF4q6O3BsOYotSuGQ5y05Xz4PFVfJZvFIBVjndNnD+ex5+F8CXkae9ynGGcocdD0m2FWsBVb1P7Tu1orhxUar4UqgJKMRdXPYSjARMjw7YlZWyeEB5kb6+7X5U727+r7Uwk4LM4ah93Mtyq5/D0j+IgGDLKzkUfyB5tQBQmuGHzJk0vPcwEKdEvTO9o6t8yDdmdRbu3//5rzFRU8CP/ktkHpswU9WVCOMovEX5LkVRu6g9+GB/nB4Dpx215TwL/g+sLaNGUW40rv35Hb2yNlXUcOIe6avM30bU8M4aTgFYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYPPdO5PRZR2NbF2GLjXY0OczW+4GuOmyvPJvvyh80M=;
 b=rgpGDGqrcK59JFdz6Gz2O4AZDrvbnjK8MfNG8WcI/XU5lhP0DQmylm0AjAkUbbJsVZ3kWTKnnCFymidUJ3qoJUMv8JmPx5M8PcIbmPZ6BsY/1QcXuTooMyq9rIGZNPRh7PrDy9tCOICm3G6X6kkjjmHUZZROLZ5FFOrud51/i43gTZ56re2ejq7XvC8LaarY3YeMmJBctbVw0WKDwLs7See0zFfd8fPFaTgbcRvPU+NZVDJ8nOTYvLpZx2iA9z4T8z8X10fmlGe846+SeF9WDgZrLW6JflZ56EbGxr5LSm+PYFh91AB+6eMBjQtByTaQ75N1zfkFFo4qzrkozseMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYPPdO5PRZR2NbF2GLjXY0OczW+4GuOmyvPJvvyh80M=;
 b=UM1l9hB2gVoTuw+etNPO+y6GI2EcRafwSsMC+0uH9WgP8nHgYdxK7qwiVDwO6zEp2Xf2nZu20cwe3+qiw8w0VeNFU7yM9E1gtCgeAi4lmJBZktvhrrY5wHdl9SjgbYTIP8lvIB5gdynm8k8pojDXz/gt8IYzvcVVpYu4rVXXDoQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 06:31:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:31:01 +0000
Message-ID: <0f6640e2-878b-4646-9cd3-8c1e75e7f0eb@intel.com>
Date: Tue, 24 Nov 2026 12:00:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/xe_ras: Skip gpu_health sysfs commands when
 wedged
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, "Ravi Kishore
 Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
CC: <soham.purkait@intel.com>, <raag.jadav@intel.com>,
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
 <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
 <794daf46-6fa4-47a4-85a1-a369c5cb4666@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <794daf46-6fa4-47a4-85a1-a369c5cb4666@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: efcc80c3-13ac-4e80-206f-08df49f481cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|20046099003|22082099003|18002099003|261009223027099003|261021121427099003|261102123227099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: vfFPndNz7ikRg7gIDxLsNRSZT2lvNRIPHyvw3pqtsRrjMt49c2Htqm07IqS4nV2+oiQPKmYCAD0Zt7KgsS7X3ePScR0FdWGz83erHoO8Z5FYriVlVEHATRk+S6cEW6Ho3n65PXiRiJgX1AC42fO2esGAU/K9UQD9bfKDJF8Wu/+EOLK2YaP9KVNlo41j441qLKycSAoMdtJhOre8U/RiXg/FOXY4ia8/xCJyssOSz7dZpujmN3284I+VNxYi7InPSRcdS9hq0MuUKXli3cAebSrwx8cr8ffp5FW1mGfqYp+AuFiuFnRuKs2cRVH9NKPmZq+tFiR14lTlvQShDMp7Ysnc1tGzMg0fmnWNhSBvSIPFDrboLw21dd32lc/fLJXI+E6cJAjdAtgtC2fFoMdKiyjZh6NgHbRjmmuCqzcq84MsnaH3VNP4FL7/N6FVP2jJAvLPJq7atO+6o/6L4vAHm4SnepC5/rrrZKEhMDjWzROpwU2GongT3iGfAqewVJpzwjW3uyt/Y0rky8H6T20HcCnztG4zPP33INLTEZu/SnpgXjtXcUoPH8Cn8/4U0JpS5TMii8ac5ibg7a4JmaFBFn3ZjGIOeZ2eTMeer+YVirj+o14iUQHMaq2k5Al6YhUigV3cyTeLv5HEFOdpCZ3i+UJ8vPtNkKP4wP87djob47c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(20046099003)(22082099003)(18002099003)(261009223027099003)(261021121427099003)(261102123227099003)(4143699003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3U4dXZSTUZOZzNvV2N5ZHNrVWZjL094VGVlWjVEYkxaaUUvdlB0cjdiUXpV?=
 =?utf-8?B?bEg4RU1TSGlvbWhseUYyeExiRWVRU29BMnU2WmJmbGpvK2Z2dE1rbWJsWDJo?=
 =?utf-8?B?UGVaVVZvdE8yMXZ2ejBvMzF5NHJTZDBRck9nckU3OEJENUNWNUhuQnZOaFpF?=
 =?utf-8?B?OGhUN1RCOHBnczg3cjJUdENlMUdYYXVxd0FVY0ZzOUhnS1hvMVVFdzhYL0pk?=
 =?utf-8?B?dnZoUFlhczN5R1ZTMlFObEkwWG5veTRDRmhKaWUvZ2QzQzZoSTgvWjFGMUF4?=
 =?utf-8?B?NmgyQnVISDhCd0s4K21XOHR0a3R5V2NGbTBaY1g2NEpIcUpqRUZtM2dmUU1D?=
 =?utf-8?B?OWRrYWNrOHNXMCs3eUlwUXZRM1AwSFc3azlTS29aeHBFNFREL1hOekYzM0dR?=
 =?utf-8?B?NWs2Z2tkVG93bGo2Ym5zd0E5RWU1RVBGczFUZEc1WkRid0tzQ0NNM2pQUk96?=
 =?utf-8?B?QXhWVmNKanZ5bGF3aHVQOFRWVU1JY3FOWW54aS9qcGpYWExiL2RDeWx2aURo?=
 =?utf-8?B?Zzg3ZXRINzVOVkVhYVRuSjNxZzFWUjg2My9sa1dKUjdVeGptSjl6dDZMQkVO?=
 =?utf-8?B?bElPV2Mwa1ptYmowV3pTaGg1Q3NJUlF3NURKVGczVHdUdmQ0Q2MrY3JMVzk1?=
 =?utf-8?B?dzI3b05JdTNjY25jWGh4STN3akNLWnJpeXUvY1hJRmFsNnlBOTdwaVgzSVIx?=
 =?utf-8?B?MUxLYlUrb3h1MlhVckZJSXE5S1hYcGtiZGxWbmJuT1FtNUh0eEphK0JwUi9I?=
 =?utf-8?B?WlpiUHhGd2RKaURGZU9ibVg4SmZuMVhlSlhidWNVR0M0anJ1cER0TGhYRFZI?=
 =?utf-8?B?ZW9yWHdKbENGQ1VZckJuR05DOVJlckFMUmpxbVZYVkRvLzY2K21SY1ZROTUz?=
 =?utf-8?B?SkUzUi8xSjgyaWIxdDRjdXlIalQ1UllWOUVxNXh3bkZsazZ6d2F3SCt3V3lX?=
 =?utf-8?B?dCsxbVhMSkdQR3dSMk5YL3NyaHo5WGx0TkpnczFJK2w5Qml1alptS25KdmYw?=
 =?utf-8?B?U3hPUE53K3NZWERuSStEc1hIOXhiSVQraitBdXQ2em1YU2Ewa1lWVXFiNFZO?=
 =?utf-8?B?a3gwWnNoaDc5TzlkdG5Xdzh3d2FOREJHVkNQZGxqM2w2Smt2QjIzS3plS2th?=
 =?utf-8?B?Z1FsTWVtYzlhY2ZNUFI5cVkwTHc5MHdXK01BRlY2b0pxS2FSRllHVmdLbjB5?=
 =?utf-8?B?aVdiblZpMURVWlplbEpnN0NXdzM1YUpxVW5YVUt0L00yOEUza1orQWRkV0Z1?=
 =?utf-8?B?ZFR1RE9scnE4VTdIMmtwY3c3U3l3M252V3ZuVlU1aVJhQW8rbFFpbHl2V1ZD?=
 =?utf-8?B?aVVhVjFaS0dPOXpOWEEranRUSVBIWk5jSEpiM3oxTDdsNVFhUzVUNWJ2VTc2?=
 =?utf-8?B?dS9LYVZXdEMyQTVRa0dGeUlITWs5bUt3cm9aWDQrV09HaTJRV0tVekV4RERq?=
 =?utf-8?B?LzEyT1BGWkorbTJncHlqWG1ZS09YQTYrZ0ZmeERKbEdKcHBUUUFxK0RiZFVq?=
 =?utf-8?B?RkxBNTdidEoydmVLZzdGcFBaK2NlTHRpbUZKM2hGdWJQb0kyQmpBUXZCUy82?=
 =?utf-8?B?L1hqM200VFUxNzJhREJmMHNIV25lVFBueUJwTlJLQzNOMVB4cjRXR0FzT3gw?=
 =?utf-8?B?S0pHTmw5cFd0SzhBWXR5d0dad2w2TmF4VDZRQXJLb2txVm1kUW9CWm5zTTE5?=
 =?utf-8?B?MVRQZ1NmbldzL21XMHRDQzJxNVBvdENNMDR5akxwQ1AxMGtQaXA0QjhXbXoy?=
 =?utf-8?B?YjR3OXB0SjE0YXo1SVkzNWd4Y0FYUXhxRnJaT2xDSi9jR2FQTjlnS3RJWHdv?=
 =?utf-8?B?d3diTzErOWkycXdtQXhwL3V0bHdMMXJGODJQNEFFT2RsN2NORTN1VGJYRFBY?=
 =?utf-8?B?NXJmUERReDhoY21nWjhCa0NnbVZNUGEva1BJM2hsdmNsWXYwRzU4R25uamVM?=
 =?utf-8?B?b2tHYXAwVkxaNHYzSEdFcU1VTnE5ZURBakNVY3kxUTJVUXNlbXlaWXpnSkls?=
 =?utf-8?B?cit1NnRtYUJrSmROWEIzZDVLNVUyRyt0ZFBtNEpDRkZ6Z0VIbHAzeFRKWEVw?=
 =?utf-8?B?M09sQVpJSkE0amlYVkRYcTZJMzdYeng5WmlxWkxWVXJTY2UyNkRpb3lXNGRu?=
 =?utf-8?B?RXEvWVJsaXZTWVFacnVZT1J0cDdWaThWaElBMjJmU1NaM1d1MUprTTVHM3ZV?=
 =?utf-8?B?Q1BEMnFDeHAyc0RkQmV3R0o2UGRZaWt2UHUwZXdVZENnZkdMdTBKN2hpeks1?=
 =?utf-8?B?bndQdlFKK21nNlM4VmJsODBwS2wwY1kyTG1IbDN6OWtySEtOUnhjWDliSEJ3?=
 =?utf-8?B?M1VVQ2YvdVpqSVRkNU5vWDR5SUJrWlVJVzhQbDh0UndnQWtwd0FWUT09?=
X-Exchange-RoutingPolicyChecked: otMxJWgsPGp5KG4P/44l6hzd8sG5/eQiVMAPokcHr1OU+jSUnowZLp7x3gzDizOmVyAeFZDOGZbyQW6WRt9Ev/5xvT3vQyZv8FW7KU9C2uFeugRZlZhJqxk2Oxyx2xG3OE6L5OaBlyM7ZobTSeUfl25tQtzAr8E/DnwKCHup9gePFJp49Rp13Oo95N5VTaNOa+jKu557AGxJ6J8LnF9RS6SWLJnAj5neOZLO/2Kt50nF/IrXgvk7MygGmzfZRQsfACqDyp6/S4e8YJYpXQqwspW+Z4PTjHpR1cmpmas6AA+RgU9P2BEWvaO++3f0AsOOXd/vzHsxjfa1LN6b4NEedw==
X-MS-Exchange-CrossTenant-Network-Message-Id: efcc80c3-13ac-4e80-206f-08df49f481cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:31:01.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN95pNLXuWo3Hb/fC8gGiQVBK1nnTik/tln2fbpDIY56yhGvNapvJJS9dccWn7zqSXaXdaVbp/PHgWVzpzYKCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 24-11-2026 11:37, Mallesh, Koujalagi wrote:
>
> On 24-11-2026 11:34 am, Ravi Kishore Koppuravuri wrote:
>> Accessing the gpu_health sysfs attribute sends a command to the system
>> controller. Add a guard to skip the command when the device is wedged
>> and not in XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
> LGTM,
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>


Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Will push once CI passes.

>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 9b04be3405ca..0c3238cbe446 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1298,6 +1298,9 @@ static ssize_t gpu_health_show(struct device 
>> *dev, struct device_attribute *attr
>>       size_t rlen;
>>       int ret;
>>   +    if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
>> +        return -ECANCELED;
>> +
>>       xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>>                     &request, sizeof(request), &response, 
>> sizeof(response));
>>       guard(xe_pm_runtime)(xe);
>> @@ -1341,6 +1344,9 @@ static ssize_t gpu_health_store(struct device 
>> *dev, struct device_attribute *att
>>       if (state < 0)
>>           return -EINVAL;
>>   +    if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
>> +        return -ECANCELED;
>> +
>>       request.health = state;
>>         xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
