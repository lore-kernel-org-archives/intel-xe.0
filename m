Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDD606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IjZVXlfc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921310E07D;
	Tue, 27 Oct 2026 03:34:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851C110E0C4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793072076; x=1824608076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kQScOtUzOuqQqhgc8jlmjyveWHbrIhd0OH/xxo/S4pc=;
 b=IjZVXlfcFOj49AGW9lHuQYTH81eIS5wqg1XLyiM6OBmW12hbil8bnS17
 /9ZjW1uC2rdJbX0Ms/hepywpTdHRi5ZRfS2sVH8Yk8OGIW65vQrI/iG0L
 cdXtA9dTe6kaxT4jQuCzAS7LBHjF8SRFSIEOVrBgeSzO9vIgY8pqQQdhq
 eEivwqSMeN0uw9wujRZm20SIKJ01v4+4HO3s6yri5l8VpVEHbTVe9nbBg
 JOWEB5/CMUOYksHksZ8DOb7JBwTVHLi1adfgZOWP6ybQW+Wcju7SATDys
 8KbLossIMJ3Fp56YdAtV0v1ZzV8IR9Us8L0VTq8akKk6HT7VeKiyAiv7V g==;
X-CSE-ConnectionGUID: uCvjNrnbSxugsjBhR4AIKw==
X-CSE-MsgGUID: AmDXOgZKTs6xwEQH8Bk6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1653830"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1653830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 20:34:27 -0700
X-CSE-ConnectionGUID: PI1bgQp3Tf+5OthGp3jLqw==
X-CSE-MsgGUID: yFM3BA5pR/mZPUw1V/Ixpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4343731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 20:34:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 20:34:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 20:34:21 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 20:34:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwfCtPXmTqlAkEgCRA9Vl6htwv5BmySMjMlXDKytMV8bTH7AmX0EYKFtDaFjmggpDJw2tY8lzPrRJZmIWhwtddgm0wJTSEvD95edEi5iHKHLfFE2KiMGaezUDM+sCl2BdCFf0CjhIQgcWgQkUbkE2UknuXzp5hoG7RV4GE3I+FmbvmhaNpp3DmAvt/Mjv2fVlHXP135UaiL9i7+qSaCl5qgGBv4vuEuzULthlklBc2U+pUIurRk0VXbyr/gBJqnx74mcFRcx7Pn8ZR58CwqpdM51MXqeseLevQQhAPB3Zg2HBBUuq56c70B21po5tOOfiU7WI0iSwqfTRnxFSHqusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TdEFliKRfU475iDB4lzvgzRlV7u+OKAtZMlLfVKbvk=;
 b=QLY8Ty3S1qE4/dktxnobqYQcAwNQ+oFae+3ibqEx6N96EkIGs7Hi9RyyuATs4ReYVtl6FqsdZrr3WAhR9VCWZS4Hjjd4olmPlfrKik6QgIyAftGVWi7aqKymrRxyEYMoqrU+IZ6BJnSgcOQIEpk/e4UwYILNhVrptArBtZdgCy58RWk6xwqoEX8tkZuXjreE91P8dJ9CvdzGx2EB3poW6Uzcpeo+GJb3J0iKlCqg/JL8FzhC8AEeWPgssi+lQsUozZW/zPpy/hsKgEXmRuLOjdUAgbWA3H7zj8QFiwGDTwhyB0EYeEP87tqaPIzwc7RpY89GV5k6tFV8e5rKlvI6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 03:34:14 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:34:14 +0000
Message-ID: <dccd0908-d62a-423c-8311-e8e71f4805b5@intel.com>
Date: Tue, 27 Oct 2026 09:04:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] drm/xe/cper: Construct CPER record for hardware
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-19-badal.nilawar@intel.com>
 <at8jW32wxXRuSpzP@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <at8jW32wxXRuSpzP@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0177.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: d328ca28-8099-4b53-b092-08df33db2c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|6133799003|18002099003|261026121527099003|261026135527099003|56012099006|11063799006|4143699003|261021123027099003|261021121427099003|10067099003|261021130227099003|261009221227099003|261021135927099003|261009223027099003|261022115727099003|261021133027099003|261022105027099003|261022113327099003|261022075727099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003|261026130827099003;
X-Microsoft-Antispam-Message-Info: yafcGdRZN1QxYyAazoSL/32YcKIK2Eqv8HHnd0A/E+fEYj5fdsXLmTAfyIiLD5amh+NS2cCSxNb8BlrWLRIgbsdjE04c1xWe7PW+OrI7+hP5U5w+W6qXjfrDggnF1ukHJKFUjc550pudLvmMwDk64bK9JfvzFTRoEFsdTQXbnhGNJGpzUEXvAe5VjxmTTO9ZPqfrvs3vPa7OwFf0o3IzyaOuU40hdO2262LMvuY8A/G+qRohmg3dM9ATvzpOMoFKxuXkDt+6CsiIPrIPLR0+2iOoVHWIo1LHtEJgvam6ZckpzesXMKvWW29DCwLAI1ie6Ub3UMPs202K8NgEzgFgQqEGdM5DrimzXaXUWOzoW5oQEQqC4EeuhM2gJTgK8n2SGWgKy7S8gLEEepn/j9HOtjR4EnPlAUCL5gywcX6eTEAfBz1BVrTTsuwLlEsFfcowF0v1O20wHHZL5ksBC4YkLBA1/WMGbfG31yUHa88KL8QuVZqx6/SKT7t7dD4NhxM3g/cj0JlfU/4VRVSaN1V2VWfZK5DNL6Tvs5ETHd6s3PsRnueNtzUVjq3vV8M71ynhlWDV41cdJWbqtyZgKuR/l5n9eniKcGgTPaPx2Q0VnYpbNc+MODJpP09tX95fw2M6OjWmq+OWyLTQOjmtIqmXiljMTths2W9MZnLVbX1gKQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(6133799003)(18002099003)(261026121527099003)(261026135527099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(10067099003)(261021130227099003)(261009221227099003)(261021135927099003)(261009223027099003)(261022115727099003)(261021133027099003)(261022105027099003)(261022113327099003)(261022075727099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHlQdTV0blZzWnh2aGZxZkttRk5KdlYxcnl4L1FKWTBaYTlUYkFKSnhMcmpV?=
 =?utf-8?B?SnB3cWozaWhyWEZGUHdtZDhhTGp1UENFRllNdmxYNTI5NTNoSThLZlUyM3l6?=
 =?utf-8?B?Z3oxTU50eUEvZGVLMUJTNFUwS24zeHNGMFk0YXRWMUZkWU9WY3o4enlpM2l6?=
 =?utf-8?B?clpid2p3M3AyanlRemhheHNCSDIzTkxZb3FDOTJaQkhnSDMzWTJrWVdWM1o5?=
 =?utf-8?B?NUlIc2IybGFuYlFSdW96WEdpRXlHcThNcW9TOWsyZFpiZ2kwTS9PZHovNXdZ?=
 =?utf-8?B?Q1c5blBvcmhqdWlnUk50VUpkRTc2RUlZOFNqM1VuNXNoQnVnSGw2TVZNYWdv?=
 =?utf-8?B?U3J5TGdHeFlMZjZtZjZLaEtQRFpmUUdKWXkwSE4xTzlWWEZhYzJtbFRJaHVI?=
 =?utf-8?B?Y1dWQjVCTytldGh5Y0pvNldYQ3FaTWxqUHEvM3U1ZzkvTzJhNXh4SEpzNXVY?=
 =?utf-8?B?bVA2REJRUWVwVHpNbHM5Um1SVms4d2p6NThSWFI2MnkzbGZ6Tmx0M0dRSkV1?=
 =?utf-8?B?TzVJbFp0UUIxb3pHQWpMNUhWZWp4OXZQbzB0TVZ4U3hRMjR0dXYxc0hrZzFu?=
 =?utf-8?B?bXBweGZXdnVNZWluMnFhUE55cnUxVTZIZWc3ZGorZFpqQXhFQi9CZHJXZzlK?=
 =?utf-8?B?cy9zZXVTb2p4RWpyMHJvUE5yNzN5Mm41MFdvRktXMVNKNTBHd2hISG9GYUNQ?=
 =?utf-8?B?ZkpBa0h0R2tPYk96eEVSeCtQVnRtQkowZ0dEOWJydlRUNkpBT3Z5M0JmN2JL?=
 =?utf-8?B?YldMT25sc016bko4VEFEY0UrbjlQM2xOMkFORERJRk9BdmFRUnF3blhGUi9Y?=
 =?utf-8?B?Z3AxR0o3NlA2YUcvOXdEdFRIM0VydXEwU1NJa3BmckhnQmlSRCtQQldVY1c4?=
 =?utf-8?B?Wm1IeWVFNTIybHJBSFRiS2dtQ2ZReTNVT1dNRmlOVGlZYkYwVEVpbkNFSUZY?=
 =?utf-8?B?SlRkdHAxZ0JkQU5HSW9TNUtyNmJodEJxTU96YUZjeWYxMGFCMXQrNVpleXNq?=
 =?utf-8?B?RzRkMGlkZGRKek9ubzl5Ujl4NHltblVsSmJBOFZMTGdJRXdiSExzZ2prZ1c0?=
 =?utf-8?B?SEdPTG01SWtKelhFQkE3eGN0eXhzUmJ6Ti9SbVVMV2xNbms2V1Z4TiszdlEv?=
 =?utf-8?B?eGZWdzIvVHNUYmp6OVhFangzUHZVVGpVK0gwYUZiVkkxWlFzQVRyOXIyU0VV?=
 =?utf-8?B?NXRxK205cENUWGdRWGNqYWppVG12L3BsVUtjeEtzNG50by9zcEl0SFBTS0My?=
 =?utf-8?B?Q2JBa1VpZk5tYk5KMXpNVlkvOXRqbHVGZ2lOTFhiLzZXc1pBRWUzZHZ0S1Jw?=
 =?utf-8?B?V2RXUng4U3cvVlVrTmZlaGxtR2JNd1FtckZPUzhIZCtGWlVJVXdZRm1OZ2Js?=
 =?utf-8?B?OEgrRmZrWW1EMXBiQTNwWXRabUt3aG1VTUJxUGtKVFNFNFhITXFzUjI4K2Z5?=
 =?utf-8?B?ME5DbzEzNmx5dzZpTlZhZ1RZUDM0MldrV1h5eGl3bGFPNFI5eXJWZm9xV3pP?=
 =?utf-8?B?RWhjMlcxQ0VlZGc3K2EyemNyNUVLc0NFNjNBcHRScU5VeFlUSFova1V6algx?=
 =?utf-8?B?UnhpeGhYS2JXdVBsWkxBZWt0RzhZQnF4VFVlK1REN2N2eU1hcTJySEh5Y0wy?=
 =?utf-8?B?RzQ4Zm8wejNiUTc4Y2dINnRyanBLRGhOOG9mbEppSDdBZk5JZGQ2UnR6L0pr?=
 =?utf-8?B?dUsxY2pLQlJ5djVwdU1zOWFNUFNFTTlxZFdCcFFJblhGcjZVdUFrMWkwYXho?=
 =?utf-8?B?dkoxY1F0SE5JSU5YM2NaWkNMWWNJcWtIZHUvbDV6UURUNDV6WnRRbm1JSzhu?=
 =?utf-8?B?NEhLN0NGeFZJcGxSZWN5UCtmWE0wTWFSYXBCcVFmRnhQQkF0QVBxRSs2OUZo?=
 =?utf-8?B?OGNVaEFyaDJJdGJBU2hrWjY1WFBBaW5sMFdjVmJPMFI5Y0lkOEVEYVBUeEVI?=
 =?utf-8?B?ZXJiMExtSHpodFBmZ0RORDZjemQzTHFBeGNTNjN5QnlCeVA3NHhIMDdWVzBV?=
 =?utf-8?B?dEtQVjludi9TMEUzcHN1TUZubDF3MEt4YTFabG1ZOUIxWDNwZFZ2eDdpK2hI?=
 =?utf-8?B?L0h3QjkvcjU1Mm92NjhrVUxuRGFIZkNNcENRVm9MdjQ5b2tldmZiemwyUGFM?=
 =?utf-8?B?NE9OUTFSbmdneUNzMitGR2JGZzlkYTE5Vk9wZ1BpaTlZVVcySGZaZXZLODlm?=
 =?utf-8?B?RkVISUtvS1c5V3VJMkVSM2FMY3czdXZ4dDZzUVBtSlhsV3dIcVlZb2FNQnd5?=
 =?utf-8?B?K3ZCQjBpNE0yOTVYOE95K244OWhScHN2N0RCV25uWDNjMWprTzVOeUxzZ3JO?=
 =?utf-8?B?dGpTbWFUTEI4S1RwYk8xWEYwcDRPcTZ1MkQwWTBJakxVM2FyOG44QT09?=
X-Exchange-RoutingPolicyChecked: Hs3nBZTUi8txj8IA8Y3VCRKW8kvmW2vY+k8hmwjhVO61pMdYooVde9DbrUzf6DGxCiozGQ3woF01jxbEmS6HrfI3RVyIZxqDnMQIv9VrPmq+Dg6FfoOxLGe17YUQnOBhA6/i2yzyWSd6H6prJnc8NTLhs1XzXv4poz/0XlNNjMHsEOTkGWB7uwwQjKI+EXOwR5DwuT2uTxiJU3EA6Dm883jqpHRGRqLCVTnxjSalvMVoKlcPwgNyuVhBCnZJDW0FKFFrLyG1QcVMyxLp/o0QqD8AQIOP2fGYaXfZvbgqwoxZEVw/lvI92hSQoLlKdbI0DpnAoWsnmYaouVIit6Pntg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d328ca28-8099-4b53-b092-08df33db2c05
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:34:14.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfxBtpNp2zr97G7BFVTqQnHVG7659c/8Auq8empwgf1/YOpMGUcRBWiTKztuqG8ErrQ5WZPGNAn9frPuh/NQJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 15:24, Raag Jadav wrote:
> On Fri, Oct 23, 2026 at 10:04:26AM +0530, Badal Nilawar wrote:
>> Assemble the CPER record header, section descriptor and the Intel
>> error section for Intel GPU hardware errors.
>>
>> Assisted-by: LLM
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v5:
>>   - Rebased
>>   - Add helpers to initialize CPER headers (Raag)
>> v4:
>>   - Split from "drm/xe/cper: Prepare CPER record" (Raag)
>>   - Use xe->device_uid for FRU ID
>>   - Add platform IDs for all CRI PCI device IDs
>> v2:
>>   - Encode cper_record_header timestamp in BCD format (sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_cper.c       | 139 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_cper_types.h |  53 +++++++++++
>>   2 files changed, 192 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> index 3d7657517223..012693fe48c4 100644
>> --- a/drivers/gpu/drm/xe/xe_cper.c
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -3,10 +3,14 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   
>> +#include <linux/bcd.h>
>>   #include <linux/err.h>
>>   #include <linux/kernel.h>
>>   #include <linux/minmax.h>
>>   #include <linux/pci.h>
>> +#include <linux/slab.h>
>> +#include <linux/time.h>
>> +#include <linux/timekeeping.h>
>>   
>>   #include "xe_cper.h"
>>   #include "xe_cper_types.h"
>> @@ -25,6 +29,60 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>>   	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>>   }
>>   
>> +static const struct xe_platform_id_entry xe_platform_ids[] = {
> In xe terminology platform signifies the name, which is different from device
> id (which looks like the mapping is for). So this can be xe_device_guid_entry
> or something like that.
ok
>
>> +	/* 0x674C  platform/8086:674c */
>> +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>> +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
>> +	/* 0x674D  platform/8086:674d */
>> +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
>> +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
>> +	/* 0x674E  platform/8086:674e */
>> +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
>> +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
>> +	/* 0x674F  platform/8086:674f */
>> +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
>> +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
>> +	/* 0x6750  platform/8086:6750 */
>> +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
>> +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
>> +	/* 0x6751  platform/8086:6751 */
>> +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
>> +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
> I'd try to reuse INTEL_CRI_IDS() here instead of playing catch up on each update.
How?
>
>> +};
>> +
>> +static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
>> +		if (xe_platform_ids[i].device_id == pdev->device)
>> +			return &xe_platform_ids[i].platform_id;
>> +	return NULL;
>> +}
>> +
>> +static u64 cper_timestamp_now(void)
>> +{
>> +	struct tm tm;
>> +	u64 ts = 0;
>> +	u8 *p = (u8 *)&ts;
>> +	int year;
>> +
>> +	time64_to_tm(ktime_get_real_seconds(), 0, &tm);
>> +
>> +	year = tm.tm_year + 1900;
>> +
>> +	p[0] = bin2bcd(tm.tm_sec);
>> +	p[1] = bin2bcd(tm.tm_min);
>> +	p[2] = bin2bcd(tm.tm_hour);
>> +	p[3] = 0x1; /* precise time */
>  From what I understand a precise timestamp is the time of the error event
> which needs to come from sysctrl firmware and not kernel, but please correct
> me if I'm wrong.
True, I will drop precise.  This is timestamp when error info collected 
to generate CPER log.
>
>> +	p[4] = bin2bcd(tm.tm_mday);
>> +	p[5] = bin2bcd(tm.tm_mon + 1);
>> +	p[6] = bin2bcd(year % 100);
>> +	p[7] = bin2bcd(year / 100);
>> +
>> +	return ts;
>> +}
>> +
>>   static void cper_init_intel_hdr(struct xe_device *xe,
>>   				const struct xe_ras_error_class *counter,
>>   				u64 first_timestamp, u32 sig_id, u32 error_count,
>> @@ -58,6 +116,86 @@ static void cper_init_intel_hdr(struct xe_device *xe,
>>   	/* TODO: fill fw_id and set XE_CPER_VALID_FW_ID */
>>   }
>>   
>> +static void cper_init_record_hdr(struct xe_device *xe, u8 severity,
>> +				 const guid_t *notification_type,
>> +				 struct cper_record_header *rhdr,
>> +				 u32 total_len)
>> +{
>> +	const guid_t *platform_id;
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
>> +	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
>> +	rhdr->revision          = CPER_RECORD_REV;
>> +	rhdr->signature_end     = CPER_SIG_END;
>> +	rhdr->section_count     = 1;
>> +	rhdr->error_severity    = severity;
>> +	rhdr->validation_bits   = CPER_VALID_TIMESTAMP;
>> +	rhdr->record_length     = total_len;
>> +	rhdr->timestamp         = cper_timestamp_now();
>> +	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
>> +	rhdr->notification_type = *notification_type;
>> +	rhdr->record_id         = cper_next_record_id();
>> +	platform_id = lookup_platform_id(pdev);
>> +	if (platform_id) {
>> +		rhdr->platform_id      = *platform_id;
>> +		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
>> +	}
>> +}
>> +
>> +static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>> +				   struct cper_section_descriptor *sdesc,
>> +				   u32 einfo_len)
>> +{
>> +	sdesc->section_offset   = sizeof(struct cper_record_header) +
>> +				  sizeof(struct cper_section_descriptor);
>> +	sdesc->section_length   = sizeof(struct xe_cper_intel_hdr) + einfo_len;
>> +	sdesc->revision         = CPER_SEC_REV;
>> +	sdesc->validation_bits  = 0;
>> +	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
>> +	sdesc->section_severity = severity;
>> +	if (xe->info.has_device_uid) {
>> +		memcpy(&sdesc->fru_id, &xe->device_uid, sizeof(xe->device_uid));
>> +		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
>> +	}
>> +}
>> +
>> +static void cper_record_emit(struct xe_device *xe, u8 severity,
>> +			     const guid_t *notification_type,
>> +			     const struct xe_cper_intel_hdr *ihdr,
>> +			     const void *einfo, u32 einfo_len)
>> +{
>> +	struct cper_section_descriptor *sdesc;
>> +	struct cper_record_header *rhdr;
>> +	struct xe_cper_nonstd_record *rec;
>> +	u32 total_len;
>> +
>> +	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
>> +	rec = kzalloc(total_len, GFP_KERNEL);
>> +	if (!rec)
>> +		return;
>> +
>> +	rhdr = &rec->record_hdr;
>> +	sdesc = &rec->section_desc;
>> +
>> +	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
>> +	cper_init_record_hdr(xe, severity, notification_type, rhdr, total_len);
>> +
>> +	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
>> +	cper_init_section_desc(xe, severity, sdesc, einfo_len);
>> +
>> +	/* Copy the Intel-specific section header */
>> +	rec->intel_hdr = *ihdr;
>> +
>> +	/* Append optional variable-length error info */
>> +	if (einfo && einfo_len)
>> +		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
>> +
>> +	/* TODO: Emit trace event */
>> +
>> +	kfree(rec);
>> +}
>> +
>>   static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>>   			      const struct xe_ras_error_class *counter,
>>   			      const struct xe_ras_get_counter_response *response)
>> @@ -66,6 +204,7 @@ static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid
>>   
>>   	cper_init_intel_hdr(xe, counter, response->timestamp,
>>   			    sigid, response->value, &ihdr);
>> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
>>   }
>>   
>>   static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> index a8730ff62b69..e32c7d539257 100644
>> --- a/drivers/gpu/drm/xe/xe_cper_types.h
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -6,7 +6,9 @@
>>   #ifndef _XE_CPER_TYPES_H_
>>   #define _XE_CPER_TYPES_H_
>>   
>> +#include <linux/cper.h>
>>   #include <linux/types.h>
>> +#include <linux/uuid.h>
>>   
>>   #include "xe_ras_types.h"
>>   
>> @@ -21,6 +23,28 @@
>>   #define XE_CPER_VALID_PCI_BDF		0x0008
>>   #define XE_CPER_VALID_DRV_VERSION	0x0010
>>   
>> +/*
>> + * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
>> + *
>> + * All values below are generated deterministically by uuid generator.
>> + * Do not hand-edit the byte values.
>> + */
>> +
>> +/* Creator IDs */
>> +#define INTEL_CPER_CREATOR_XEKMD \
>> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
>> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
>> +
>> +/* Notification Types */
>> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
>> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>> +
>> +/* Section Types */
>> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
>> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
>> +
>>   /**
>>    * struct xe_cper_intel_hdr - Intel-specific CPER header
>>    *
>> @@ -48,4 +72,33 @@ struct xe_cper_intel_hdr {
>>   	u8 reserved[5];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_cper_nonstd_record - Intel GPU CPER record
>> + *
>> + * Contains the standard CPER record header, section descriptor, and the
>> + * Intel error section header.
>> + */
>> +struct xe_cper_nonstd_record {
>> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
>> +	struct cper_record_header record_hdr;
>> +	/** @section_desc: CPER section descriptor */
>> +	struct cper_section_descriptor section_desc;
>> +	/** @intel_hdr: Intel-specific CPER header */
>> +	struct xe_cper_intel_hdr intel_hdr;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
> 'xe_device_guid_entry'
Ok.
>
>> + *
>> + * Used to resolve the platform_id field in a CPER section descriptor.
>> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
>> + * with name string "platform/8086:<dev_id_hex_lower>".
>> + */
>> +struct xe_platform_id_entry {
>> +	/** @device_id: PCI device ID */
>> +	u16       device_id;
>> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
>> +	guid_t    platform_id;
> 'guid'

Ok

Thanks,
Badal

>
> Raag
>
>> +};
>> +
>>   #endif
>> -- 
>> 2.54.0
>>
