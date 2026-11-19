Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C58606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 05:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L1S6aBR8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JIAji6fz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109D310E169;
	Thu, 19 Nov 2026 05:19:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FFE10E169
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 05:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795065587; x=1826601587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PXyePKGN6I2GSVx9lcEsZlA5Qd815vM0NfXD9RQQQYU=;
 b=L1S6aBR8r2Mn0LHF4ZOGPhgGAVWtIcl4Bl9vS2ctKPo1+f282CJ4mmsf
 qzOZXneyjTFMnHs4O6ID0HO9B/tWKmhiQ7XqMXqsPqSC7k6ewbwMtJrEj
 yX1mBIlN/weWptFvubYXwo1pHwAhPOCe3QRnN0r49t6FwBAnmSe+O9Nqk
 DakoHSihcIPEhfBZjpJqCqCbPIyiFB0rqxJ48d2EuRrk6pKooQ+fDMcgr
 d+IF9DjX/X5liO+ZYYaHoxdQUoWB24FspWv3vpgd9a4qd5zupH1rkhN1b
 /cm2QElITo32cKzC+lQLmCzaI27P04zIGxwsSlDbw7ffwxOaJZUgUGZ8C w==;
X-CSE-ConnectionGUID: A1YsgX7QTEuDtlwO1Kdovg==
X-CSE-MsgGUID: 6/tLL6VQR4mI1Hf5G4VdTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3981885"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3981885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:19:46 -0800
X-CSE-ConnectionGUID: fQdgNo7AQ26hf6mI1LEvEA==
X-CSE-MsgGUID: ql3HtIkJSe2Os/s3+WESWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10334012"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 21:19:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:19:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 21:19:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 21:19:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQsuXnWVBBCic7u8WDSm/p2dlW/04uSgRaTO1KTM6cJRXutYqT1qCLdDg9vIcG9f3v5AcPJI4x6bAiJvEiXc12MNu+voCJaBWusKpKAZHKMXABdN89fgNJvC79+cbCi+d9qINWzgJNgL00VO7jq1OHZb5kxQ+VBPziaLoQ3+qrfRow2Xng4RuuTwiqEf28GtBWO96cNv+8r3tce6yAenkHnOEu5qiXybxUINVTA+q+NuasOQfkEshOSic7J9MFX0tZf+Re5pZkQIUZ2rf6Uy6/PT2QaCdK3OyS9L8P1KOuE6Iex2g0O0mmcuFcRr/C85Ig820KZsc5wE5DVTXBGSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMkl/yTVbBwf5TlXhjXorCc9igMPKvBxQsCxAE71C5s=;
 b=c/CX7W0vY90arBg80kOnkCcoRd3e9FpchXlPunmkuXPBSpDoBmMd8pOdUpW3xV0XmXiPEg56Lqv8xuFwcWax+WlyZJQ2odZNcG+2L7M4EPKdo3FlVtvEbijN/0deSblETILOkI4oH6iHPI1+5CGEHll8xb/x78d3cyGB43NjcX3F5+PYxL+z2ecOqdgab8uJHnWMsYuYvYFSPHWeOtIbMBHJbitknNEAvdtpJG03pgePqrMsnl2Ez7Jgg5qep1y8O4l+3xbh8Dcj3zI7gewbMUlpmBUunIy/li87ZLv64jZIh0QY8OtsSTqI4Abkhx5aa6iEQIeXoEzbKCy6vxCffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMkl/yTVbBwf5TlXhjXorCc9igMPKvBxQsCxAE71C5s=;
 b=JIAji6fzDIp+9z+U9FzEnL5+Cwb1mKqzVAe66aL7PqQwwHG1nVDkVMJTjI3rimzhRkZFmSQergIizeL7tPGvxaCJ/XEX/gfXCVGnhYqx4wEOY55WYzgIgRZBk7L6fMuzt3jD5yXbPpeMUlS0Abu9tzCFW6ah7XZEkniDpjOe9cA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 05:19:42 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 05:19:41 +0000
Message-ID: <e37f5893-7967-4087-9d80-b2d3e45c1fae@intel.com>
Date: Thu, 19 Nov 2026 10:49:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261118185015.3164387-2-sk.anirban@intel.com>
 <4abcbc50-5014-4e1a-a22c-4ab9fac32a57@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <4abcbc50-5014-4e1a-a22c-4ab9fac32a57@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: c426d4e8-98d1-40ce-c1aa-08df45fcb72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: tzynoEBPVvK+p3troC4O4Eqir91Xe8B8T0CjgvJxWajTvvLglhIc6jMBaQyUDfd84mDitum41RrGskphUPvvFzRRQf54wZGsh06IBC59AP6nQ+LTu9C+UVw1ytZtqk8hrCfMGpAevWKS7IdZMeo03EMzJk6XIoj4mVleTWJ5JvXZwDApruZUnRchFiJ+pOiiHgSNzDisSyFwQKWBgUs3v5sekz3o3F16v+4AfaRWjeXduRn/sn1+KSf/M5lz+cMmYrPJOT9GCG/qhfjppAFOlNAF0nlTan+JLD7exxX0XMcmzZz/cxFKF4eTAuPyIZHZJm/W1zkd415K+qNvbofsYKUsVpChJ/fvb2Sqt2BK2OqjAKc9coHCFQgx/bjbwKrsRrAA75RaBaUXHYF0Zp0wCxdFCA4AD//hAcIVUixt0qoIupco2NWU7NyLmLh2FawM9xt0mm1HLhMeY93f1Kg8GNw61X7HtE/LUy/vV7dRtqIjkCaiJa2oo2CpiN6VbWgcLNhZmzCdDfr7TkbTLFqaL8f4q4FxEyo5AbVufzZu3CKtxS78o6lv8Ny3ou7JEQK3roIB2jNoh6IybsmIdpqA+JhWgzl8UEHUbQKOt0sAzNRii41I7kLu1eTUTdzWRWGtQrjqD/QDdFhAPRU3rQwla4rL6cGdKFtEkpkIKlJK5x0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VS9Hb1RvSW1sUm5PT1k4ZWpnUWF0YlJYdCtJQURXTkh2K0hNb1Qwdmt4UmZO?=
 =?utf-8?B?b3pWRzNKR25ZenlsT1NrdHd1S0g0YXFYQWo4NUVJK0FiUnpsK3hUb0RFbUkz?=
 =?utf-8?B?NjZaZHU4Mk9nRFl0MnQ4V09vd2ZMazFJbW90bE1LT0VuaDRNMWhoOUp3bXNy?=
 =?utf-8?B?Ui9PTVJ6M01GUUNIc2U5VlFqSk0yM3Vwd1hXNEFOZzAyL05jS2RUOWVoUk5Q?=
 =?utf-8?B?SkF4ZEdVODdJeDlzTjhHV3BodnliZERTbFZQL3FXcEo1Rm5PTEJKT3JDUGY1?=
 =?utf-8?B?QTFza3kvd28yM1RscDhGYi8rZTg2LzJsTTRyS2RaVVpXb284NTVjTEF0T1Ba?=
 =?utf-8?B?ZDcraTVHV0ZYKzRuWXJkZXRZd1FmYVB0Q2xTcWZYTnpiZWVTUmJNSWxJVDdo?=
 =?utf-8?B?UmNnTXQvOWJCTG1Makg2cGNWZHpjYUhWYkNORWdRb1V0VDh5d3FubENmQk95?=
 =?utf-8?B?NldCVTRTQ1diY3RwYlZReUdNS3MzZkdwUWRnaURnNVpYQ1VaaExvbXJ6N1V5?=
 =?utf-8?B?dUVvMVBJWlBqcmVxRk9LQ2dTRjlFeDY2OHJUTU5NYURTSmF2Z0NKWUgwbGJ0?=
 =?utf-8?B?cktKTWVmL0hkZHN4UDRxamljT0FUTUJYWlV5QzlOcmw4TDNyOWRvL3Brc2cz?=
 =?utf-8?B?RkFMRmpjM1UreUZnY0lJS3pSQldib1oxR1QzQU56cVFIU2REOVZONTBWNlVN?=
 =?utf-8?B?THRFNE83aXRjQnFxY0ZCQkE5TlpLKzVNZzBpRnUwb0ZqdTByUG5TMEhXU25J?=
 =?utf-8?B?ZmZzTExOZkQ1OXRhaVh5azg4dk5tR0JXUXNFZlAvTGl2Smt5ckNxbW1SZzBJ?=
 =?utf-8?B?bkI5OXFvL1VGbzNyWXV2UE5oa0VUVW9xQ01CaTdJK3F3TnUrWlV1d0c4V1dT?=
 =?utf-8?B?OUhpSU1WSjRQUnhSL3VzQWE3NFVLZ0JQVUhvWURMV0k1MnZpWVFRczFDei9U?=
 =?utf-8?B?L2YwU0tQZE5yOFlkTVk4STZ5UlJ4VWVETzM5TzUrRXg3d1VhWkRRbDE4U3RY?=
 =?utf-8?B?UE9jT1hRaFNjdjYzSkRRbDdOMlJiQ2NYYVFScnd5d1NpN2xkNGdkNDh2R05j?=
 =?utf-8?B?WC8xWjBzNWppUHk1OTRqV21XR0ZwR0Z1VGtwdGkxcitEeXQ2N2tKNk1YR2Q0?=
 =?utf-8?B?QXZKL3FLdGg1NXBpVTNKQlA4TGlwSEFLWDY1QTFSR2xaYngxZGxWaUROZ1RW?=
 =?utf-8?B?YW43UnRpMHJsdUpzN0dsUUVNYzM3b3ZmZWZ4OGh4NW90MGczL0ZsY29iNTdP?=
 =?utf-8?B?SGF6eUVTZDBLOGtoUU1FTWJGYitIMWFTQnFNc0xHcXd3ME5WbU1DZmkrMkdi?=
 =?utf-8?B?NjV6S1NudFhqVndIaE1tVlc3aWpKcDc1anVjdWVOMVBLcDVZbWtlMzhOczgr?=
 =?utf-8?B?TDdBc0Y1eFFvVUhBWkJyMjU3N1RKZEFWWVZOdHhMVm1iN1dUa2tJR1FnRm1m?=
 =?utf-8?B?QVlpU0dOWk54czVHYkN6aGNmczBBUFRSRGdHWDZIQldKWFR1M0FRRTBSME5R?=
 =?utf-8?B?VUlmYXhqcE83bHBsUENlMnc3VU9DTG9kb0xOR2lDN1R2c2w1cktsd0FMcmt5?=
 =?utf-8?B?NlF2ZjlvNGhPbE5FS2xxSG1hVGNHay9QcW1QMVNxL1JHblU4K3RJY3hqcmlj?=
 =?utf-8?B?djJ6a3FBaE5wSUF0Nkl3Z0NjQ2VERzd0QlUxR0ovQWU0akFlNDJ0bU5MUUVt?=
 =?utf-8?B?S0piMm03T0NRSkwrMEdWcVNxUVMwN2NsUklDVWJzcWpvdHNYZUZ1WXZmZzhl?=
 =?utf-8?B?VXk4cStacG8zbjRrZEpKS2dUaEpJWWQ2VnpsamRFcTZtcVF3U3VSUjN6a1Y0?=
 =?utf-8?B?d0trR3RNdmF0UVJrQjliR24xSnFkWjRKbnZHVHlvaStnM2lXbmRqVUI2SnBa?=
 =?utf-8?B?WGZlczY5Rk9pTUhrZEVhVG02M2pESmZhWjgxZGdic1M3YlZvVzlPenFsdUVo?=
 =?utf-8?B?Ly8xUzlGVmVTMGRvdDVZSE5aUzl4OUdMMjZ1NmF2UzhlYmhibGZOZ0xuZDB4?=
 =?utf-8?B?UUtrYVRnbzNQSjNBY09rMHhNcVpjZEdmRGRWQzIrREQ2MGF0NVRDUmovU1h3?=
 =?utf-8?B?enJPdmFuZVd5QnVTTVEyVkM0OG1kSFdjSUR5anl3S2tSaGZWOGxRZ2FZYzhL?=
 =?utf-8?B?RlRCM3F4ajBPd1Z0NmIzYVcxR3J0NmpSZUFKZ2pQU2Jwa01Qd0tobTVaRitx?=
 =?utf-8?B?UDBPSnBCQ1ZmcmZ1QWVFNXBlL3Nhb3M0OFgyTk5VUWlzS3NHVEdJUWhYY2lP?=
 =?utf-8?B?SHBpZDVaZUhzczVraWJSUi9XcUh3TkJmbTNrMnBva3dZRHhCUmlhQ3lTY2ZS?=
 =?utf-8?B?WjVYbDFZVVpSTk9SYkdia2w4NVREMFZ0MlZBMDRFTkRJMlFScU5RQT09?=
X-Exchange-RoutingPolicyChecked: 0585TUXyy6eAQl4ngsI3sH2ZoTTkj4mV/PJ+B0waRBFfCWuUC+kCwqgcB7BD5Vmuj2t5/LPRwqfyJE4cHV9xlfZyul07ElEJfEn59dvBKiY0oaLtVa2TKu98wonoA5oZEWGNS5XaU62Ftd+24ck/DSi4lJKJKiR6PaHBPaZAXNEmK2W3ac5cqrxNUlLEz36ltFYEzV3T5zM9F22E74NL+KKOHjrDfFOB84i652iOXR/Nb4g3+NWliBLYJqCJ/kujLpqYhH6YxmHQJg/ZMHokutSRlDch2jiMfdly4WLKrcRlXTzc9GpNeWYK8aIUpvSpGkB1lvnHH34eV/yGRwwi1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c426d4e8-98d1-40ce-c1aa-08df45fcb72e
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 05:19:41.8423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3asS3WihfOo3jM3AGha/vkZHzCxwCInp7D/gR6ZJYhPhK1BHXFO0DdS0taoARZajOn5y6/5dZVGp8rPN3AK1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
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

Hi,

On 19-11-2026 10:42, Tauro, Riana wrote:
>
> On 19-11-2026 00:20, Sk Anirban wrote:
>> Stop traversing the aux info linked list when an entry references
>> itself, preventing an endless loop and soft lockup during probe.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 91a0680e449b..34d39e68ff36 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -172,8 +172,14 @@ static void populate_survivability_info(struct 
>> xe_device *xe)
>>       if (reg_value & AUXINFO_SUPPORT) {
>>           for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>>                id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
>> -             id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
>> +             id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id])) {
>>               set_survivability_info(mmio, info, id);
>> +            if (REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]) == 
>> id) {
>
> Thanks for fixing this. you can add the fixes tag
> How about bitmask ? If there is a bug in fw where 3->5 ->3. We would 
> be stuck in loop again.

sure, I will fix this.

Thanks,
Anirban

>
>
>> +                xe_warn(xe, "survivability: %s points to itself, 
>> stopping aux info walk\n",
>> +                    reg_map[id]);
>> +                break;
>> +            }
>> +        }
>>       }
>>   }
