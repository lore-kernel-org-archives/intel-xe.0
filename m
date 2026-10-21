Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A204606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0NY0oax
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332B10E047;
	Wed, 21 Oct 2026 18:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9406010E047
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792606554; x=1824142554;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9E0t6RfHR2iBajqrH9QmFhzitKa4oGbaRwUdqW+ou8s=;
 b=K0NY0oaxRHwzA/0+b9O78WchpH2Z76WiVz7BNwQe1yqr4Fmm5uQcg2Ro
 SeSylkJ3srr9+w7dnysMagQuAR4qyiAisdMMcEkv+dhlM0wryNb3MiGsy
 DPupPGroym1I8iyXtKkt5x3duRI9GebhhyURciqcVUg42038+SPTYM1qG
 ZoeZYWo11/sy1CtTFWvSmv5Km67EMicsPrFWv9fLLGYer8jkNY9NM3JfN
 /65S58VRLl4xq8lgPmy1qARQAG8YnUXxSu5pSY1GEUx2cVD/y3i1YjcUb
 kpDc7WourLf9NHqBJmS846CpZk7RPVeLFAUbQiJsq5s1zqHVf4uCH5sLe w==;
X-CSE-ConnectionGUID: PW1axz3NQauZ39EtOr5lAA==
X-CSE-MsgGUID: 15qLHzH+QiO3gu95HljmbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1215146"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1215146"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:15:54 -0700
X-CSE-ConnectionGUID: TWBaraCvRC6tl8z0mYMucQ==
X-CSE-MsgGUID: CluW3KdwQPaKg0lGjQVDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4948272"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:15:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:15:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 11:15:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8iNrM+srlCcpviqWwFk0FII291TXKL20/RYRrBqPlJ0pAkXHRPZTcXvvQNXdwYKZ+0OeHC4z2eZK9txEWFsYiEFEaWEKguHT+gugW4Sez2TiPax3x3AiBgyd9iyhSYDOQ+lTS4Lztto9vA7yercDXRHKku8i6N3uYQ7VMDfK+xogoE+X0KI1tKRBd4BkLlX76WTKu1CTqgUQ8NhbwVwE5UtZvEeW4U1Tsjg+WQIJqYZ3RWmupvWz9z9hPEkf0lg7vjX4WFahaX2mw6ImJ3AQf44UOE3v4fuKpHSIKHDV1hdaKbM80xtsMXd8CCWFJ74ixRJXNmwsQJ4VRhff0T24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzUknUOMsZRi9c4+FglW8JQjqUVmPMIWKjx8CV7h8MY=;
 b=XcDoCXbSH91hC2Wmr3XqEQRqbdazk1kxSvCgOGlCejLQZjBUt6Yowm+yNHyjhhZJARCWjSHTAl2wpwmMndW7/gOuuNoSqTnQ1X08i+JUR39XtlmG4rmAd9bC7av96zoWgviDXAVdFT/qUlPXkcbZxToeHRG1LxU+6bV2GJnbgwkjreLC1mnwJs7uak2ubr1OIN9Cab5klVMFPPrZRfr7B7Y7nFUBRLXMxM6DY9FZ4DA6BdherUQ2ZDthtx9TtQgw7BVApgQh0Cl0AzJHy+/eSLIUz7wne8lwpseXQeRaQQQAQAD65NWxMrNMTJ/8onbPwQdJ75BZjoglSd+ONykq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 18:15:50 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 18:15:49 +0000
Message-ID: <7f1c156d-6751-48f7-a013-16f5e9ed3336@intel.com>
Date: Wed, 21 Oct 2026 11:15:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Handle GuC semaphore instruction field check
 error
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261012192828.226700-2-jesus.narvaez@intel.com>
 <34f5896a-0e9d-4eb8-893e-fca156dbc18d@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <34f5896a-0e9d-4eb8-893e-fca156dbc18d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|SA7PR11MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 512b7868-e2b3-48a6-37a8-08df2f9f55cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|261009223027099003|261009221227099003|10067099003|3023799007|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|261021121427099003;
X-Microsoft-Antispam-Message-Info: YAsMbTL9H5nVsGiXLSyxCMe3vBMqDdiQg93WmYb4ITcnxmpMisSOX0wPA7UnOu94LibrgO1Os7/X1nxCblRS3rLCqveVrVm/p+MPEETmQfO0GtbT47jsxORqcL/UcZHc6pMXM2OsX49+XuaUJlC3S5K9RLjX4WEm+jmMLTeq73KXplh9u1PzDgjaSnampAoZOvA3RrtTnhhb65C25mZNeevDvE892vaVpZqQkpiROzXc2kWgynMaRIT83Bf03BQWyWVQhcjLQzOlyDNi+geQ4KC+BwSA9vbHXgssp9nhwlc0YBUu/DbZakqBWXmUGlitXVn4AWL6udMSVxCXE6Uny4uFz4DWMwJRoc75VclrWE3VX8x3VXmzFBPeqrjEzxDvv5gA7m+OUlXq4KNEM0nnv1DGGRe2DHIXZH3ElToMRMrm9Rh++148cj+NqL6px1W3zvaOZubKjBwPjjUhdTO/Ok6QO0oRlZtYgm8x5oT9br5qzKfLndMOy+vBwfvPYt3VEZTis+bb2KFBoXA+wKGDnBWONvdz5xRhDKG9nNx0W97hJsn2fRhccbIwGO7eLRt043U1s7zzq7n2axyXVIHNjrcyNnXrxyaloP/hcRhgKvK0+Jmr3uerWELFOKkmLJDktyhc1vAEV1VEPhoeowCj8SRumVsZEO/0fGYdXsJzISY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261009223027099003)(261009221227099003)(10067099003)(3023799007)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVFMS9HRkNIU253eVZ6U1dXaVpDekw1cEVCc1JRVzhUbmNTTXVQc0Y5RXRS?=
 =?utf-8?B?VnlKMmRUcklzR05aTmwzZFFzaTlmOWg4K1RYS1hEZ3J2Y21XTDBuektUeFdj?=
 =?utf-8?B?RHNVSVBQQW9MWkhQM0NGZEptcE5iVFRQVGJkKzVTanNLOUZsN3UwNzFoOG9S?=
 =?utf-8?B?enV6ODFTRTJuVnN0K2Irc3ZrbTJHdlIrZ0Zya0hQcFRPSmFjK2pHT0dvdUhq?=
 =?utf-8?B?MDRqN0l4TXdCSGIrRzcvcXRKTFVXdmNEUmZPdGxEamFXc3c0b2ZhTkYrRU9I?=
 =?utf-8?B?WDZmVXhkMzlJOVJSb1dTZlVnbXVhcWZZK01VTStRSFlQVklBakVISVl1cjVy?=
 =?utf-8?B?cXp0NmNKeHV3d3A2ZHl1YnFnYXVlQ2JvalhNL2tkY21tcmJEaWtsQi9pTXRZ?=
 =?utf-8?B?V09qRGlWbU43Ymg0dExlN2pNcGVsaldaS21kUE9EK0hqVlNOczdMNmhtNU9H?=
 =?utf-8?B?ajVlZGZtZHY2VlEvWU5jSVhQVjBxUEQ4WTRsNUVOVmxDdVlGcWc2Ymp3YW1E?=
 =?utf-8?B?MHdIZmxSKzY4UDBHTUU3UUp0UFgvc2VQVk5TM21HN1Fvb0I3M2w3TzVoU3hR?=
 =?utf-8?B?SWFSQ0htZkNwenhvSjcrTFRWMGk5R1RyQUZyMG9hdjdKek5LOWdiQ0RvdE9R?=
 =?utf-8?B?ckJWZXZiTEU2RmhxSFhGSzlKUHduWEpSaDlRMzArL3g2Q25laDdjM040cVJn?=
 =?utf-8?B?MndIWHJ3azV4RUlISy9EWE9VUFpzM0hwRGVJU2o5SkpIcEFUNmpqQ0FzTXl4?=
 =?utf-8?B?Zmp2QldpWG9XU0NFbWZYU1JYRTg1Y0NOSElNVk5DUGc1dklBZ0ZWUGhNV3pw?=
 =?utf-8?B?cHN0YzMvVFk2VkJRZkhxdDFMTUhMbVJnK3RwdWo2ZjNCeWRWQnFRanIrVjg0?=
 =?utf-8?B?Tlp1MUxMZDU1MnVkVHNuUnRQWC9rTS84U2kzdTNwbXJGSC9JQ0FKbjBrSFZk?=
 =?utf-8?B?d1BYbmJSYVQrS2EweVlCTWVvMWViZFZwY0RkbElxT3ZFM2twcktzWEJ1ZWxG?=
 =?utf-8?B?eXI1TzF6UHBWZjFSbXZXY042bkFHQlBSQm1xa1BjVWRNTGxSYkVocGxhdnha?=
 =?utf-8?B?QXVLRXN4K0FnWUxCN2pvczE1clZSakRvcnhrdzVCdFVMZTI3WkgwdENhM0g3?=
 =?utf-8?B?SDdqUXBCT2R0eWIzbURNQXVSaFFWRTdEdFZmZUl3NEtiTUo2K01YM1RVdC8x?=
 =?utf-8?B?Q0VFVGVENWpVeXIvbE91NGZEeEhHTUhNNWZEekYwMkJldlJtUUJxVHBaUjcr?=
 =?utf-8?B?bFlvNFhRanRKdjBhQkpjSkRyRFRERzNDYTFPL0xIVlVkUHlQMlNyYzZ5eENr?=
 =?utf-8?B?b1ZFcWZXUng1L2pZcXVIa1NPaFlhUkZxd1lFNHJ1cTd2ZWNaQStiY0xxelRm?=
 =?utf-8?B?YUxpd3lZUjJHZmJkVUs2U3pkYmU2ekVuaFB6VjZIU1BaZzZIN3dhUkR2djZ6?=
 =?utf-8?B?STNwWEFMTHJNd3VGT25ZNWdUZUNkTVF3enlyQ1pVTGtaUlBNYlNqRlg1bHIy?=
 =?utf-8?B?QlJTZHJxS0N3cFlZVXB1c1ZtYjNBc3d0eGg2d1AzZTR1bGVzQzloNlNvd1BX?=
 =?utf-8?B?NGFKUkNlWnV0eERhTWdyQWxrMyt4VjEzLzN6dDMyNTk4bk1YWHBEM3liaG9s?=
 =?utf-8?B?d1NheE9yUlBaa0dzS0hzWHltZkVWeWRUdndsUXJMT3UwYTBBZnAwWW5vVURr?=
 =?utf-8?B?TkcrTkdtdm9mZXROWDJuV3J2RzZINExtdHZ4TGl4MTBvanoyYXB6YVZnNVU2?=
 =?utf-8?B?cytLaS9WbjFWWHV6cDhBMnBWM1BUUlRsTHluT2xRck95bDVYdlM5ZTZHTXgz?=
 =?utf-8?B?c1BZbkxhTFZ4STV1aGlNeFZQVjAxN3ovS2tWaG5WREc5cDFmTm41ZWdPTW4x?=
 =?utf-8?B?YUhmeExCSkpBTlBlNlV3Y3FLOC9QaWF4UnpBMGxDOTZZTTBzUHF1c1RUWDg5?=
 =?utf-8?B?WVpYbmpXdnZxaEQxdi8zNHhyWmVxM0tseE9KWkZmanl4S0doMlNtUmNkNHdh?=
 =?utf-8?B?Zk5ybTFTbjkwcjdvaklzUDZMTnVLNFVkdkhOOVNrOGtTRy8xZnVMOVp2WTRK?=
 =?utf-8?B?S2dVM2ZuRi9pcUkrWWZIMDF2Um10eW9OcFArbXg2eXdiQ3BER2o2RllNOTFw?=
 =?utf-8?B?UlMwbnJpRGYyYU00RjFpbjhSQVIvelNlZ3BxZjRFU3FBYXZFeXIxMmJuOHFn?=
 =?utf-8?B?NlF2RDBSYm0yZVJya0hRV2hCdGYvMEhHbkF6QzMzc05YZ2pNOWpnWHgrc0NY?=
 =?utf-8?B?ZWQ5YzFNSjBOSWZJdHVsMUhXcU1EZmE4M3ZOU1ZPY0hMaWNtM0dodWRuWU1B?=
 =?utf-8?B?bXFac0NNVWdSUXIwZUIzZlFEODJhUGdLQkJPV2dLTEcyUGRCRWJTR2JMWkZV?=
 =?utf-8?Q?euCAm9wNloxPzw/I=3D?=
X-Exchange-RoutingPolicyChecked: 0l8hC8OBAq9+tp4DWPQabyMmlAEOkYV5DV0NXUk7ICfPXHroWbs1UfXqdybt6Und1J97k5MZlh0aiwioDlqDuOltssSnRBYoxqC2b8tkbUsVD2iM085Es28BKTYrj2Bih8fgHskjb1JND0G5ydqzAhM9ykGIv+ZVBfJBIvCLbbaK9GmuW1sjWXl3wIArdxCunz9gep+ujSHUXrdx86PF7CWZoC0z+qvtfjrziZy57OXmEucSFBnNQqcPTBZSvFmuUUNP6aTtPMaZnnLEOG3LX8k1Q7d3BXKYSNlGW48CQsKg1oB66XLtx6EWDI5dwAVrWkd6aDXoXV+xKwkaH58zvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 512b7868-e2b3-48a6-37a8-08df2f9f55cc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:15:49.6725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjAcE+SGs5nz/v8jaL5O4Lw+Ct8jsaV/MQC3CyUbo7nB2wh5Hqnir8pYq4/Gp6AnYQc20zsTSfjuRUjyFNjIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9594
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


On 10/20/2026 4:43 PM, Ceraolo Spurio, Daniele wrote:
>
> On 10/12/2026 12:28 PM, Jesus Narvaez wrote:
>> Starting on NVL-P and newer platforms which support 64 bit semaphores,
>> opt in to enable GuC to check semaphore instruction fields when it
>> receives them from HW.
>>
>> The GuC will send a G2H back if the check failed, so add a handler to
>> deal with the context that has been marked as unrunnable.
>
> This needs a bit more explanation on why we want the GuC to check 
> this. The new commands have a field that is not used for HW execution 
> and is instead passed directly to the CSB, which the GuC consumes. 
> This check makes sure that no unsupported values are passed in this 
> field, so that if we eventually start using those values (e.g. to send 
> hints about the semaphore to the GuC) we don't risk a userspace 
> regression due to the change in behavior.
Ok makes sense, will improve.
>
>>
>> Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
>>   drivers/gpu/drm/xe/xe_guc.c              | 10 +++++
>>   drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 47 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>>   drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>>   7 files changed, 78 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index f5c9b37038d4..520b771906cd 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -143,6 +143,7 @@ enum xe_guc_action {
>>       XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>>       XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>>       XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
>> + XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD = 
>> 0x460B,
>>       XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>       XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>       XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 4bcdc1a96785..c63387ebc173 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -169,6 +169,12 @@ enum  {
>>    *      This flag will enable notification from GuC to KMD via G2H 
>> message
>>    *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon 
>> receiving the
>>    *      same interrupt from the CS.
>> + *
>> + * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 
>> 0x400A
>> + *      This flag will enable the GuC to check the semaphore 
>> instruction fields
>> + *      when GuC receives them from HW. If the check fails the GuC 
>> removes the
>> + *      context, marks it as not runnable and notifies the driver 
>> via G2H
>> + *      message 
>> GUC_ACTION_GUC2HOST_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD.
>
> nit: "instruction fields" feels like the GuC is validating the whole 
> instruction instead of a single field that is copied in the CSB
Yeah, I can change that to just "instruction field".
>
>>    */
>>     #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>> @@ -180,6 +186,9 @@ enum  {
>>   #define 
>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
>>   #define 
>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
>>   +#define 
>> GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_KEY 0x400A
>> +#define 
>> GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_LEN 0u
>> +
>>   /**
>>    * DOC: GuC Scheduling Policies KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 3ab4cb9e4964..a0c693a1e74f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc 
>> *guc)
>>       if (supports_dynamic_ics(guc))
>>           klvs[count++] = 
>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>>   +    /*
>> +     * 64 bit semaphore instruction fields check support was added 
>> in GuC
>> +     * v70.64.0, which maps to compatibility version v1.33.0.
>> +     * Support starts with platforms that have 64 bit semaphores, which
>> +     * is NVL-P and newer.
>> +     */
>> +    if ((GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 33, 0)) &&
>> +        xe->info.platform >= XE_NOVALAKE_P)
>
> If we have other uses for this check, maybe it's worth adding a 
> "has_64b_semaphore_support" in the platform definition structs? not a 
> blocker.
Are you thinking of something like has_uncorrectable_error_reporting? As 
far as I know, I don't think there are any other uses for this check at 
the moment, so leaving it as is makes more sense to me.
>
>> +        klvs[count++] = 
>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK);
>> +
>>       if (count) {
>>           xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index da5ce97484b8..cdd7285465b1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1802,6 +1802,10 @@ static int process_g2h_msg(struct xe_guc_ct 
>> *ct, u32 *msg, u32 len)
>>           ret = xe_guc_exec_queue_cgp_context_error_handler(guc, 
>> payload,
>>                                     adj_len);
>>           break;
>> +    case 
>> XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD:
>> +        ret = 
>> xe_guc_context_invalid_semaphore_instruction_field_handler(guc, payload,
>> +                                         adj_len);
>> +        break;
>>       default:
>>           xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 7ce73489c35f..35965667c198 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -3708,6 +3708,53 @@ int 
>> xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, 
>> u32 le
>>       return 0;
>>   }
>>   +/**
>> + * xe_guc_context_invalid_semaphore_instruction_field_handler - 
>> Invalid semaphore field handler
>> + * @guc: guc
>> + * @msg: message indicating which context failed the field check
>> + * @len: length of message
>> + *
>> + * The GuC has detected an unsupported SW Token Info value in a 64 
>> bit semaphore
>> + * instruction and has already removed the offending context and 
>> marked it as
>> + * not runnable, so trigger reset-cleanup on the queue to match the 
>> state GuC
>> + * already applied.
>> + *
>> + * Return: 0 on success, -EPROTO for malformed messages.
>> + */
>> +int 
>> xe_guc_context_invalid_semaphore_instruction_field_handler(struct 
>> xe_guc *guc,
>> +                                   u32 *msg, u32 len)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_exec_queue *q;
>> +    u32 guc_id, type;
>> +    u64 lrc_address, token, data;
>> +
>> +    if (unlikely(len != 8))
>
> The GuC specs list the payload for this G2H as being 6 DWs long, but 
> the GuC code is indeed writing 8; probably just a spec bug, but we 
> should wait for them to confirm before merging.
Yep, sounds good.
>
>> +        return -EPROTO;
>> +
>> +    guc_id = msg[0];
>> +
>> +    lrc_address = (u64)msg[2] << 32 | msg[1];
>> +    token       = (u64)msg[4] << 32 | msg[3];
>> +    type        = msg[5];
>> +    data        = (u64)msg[7] << 32 | msg[6];
>> +
>> +    q = g2h_exec_queue_lookup(guc, guc_id);
>> +    if (unlikely(!q))
>> +        return -EPROTO;
>> +
>> +    xe_gt_info(gt,
>> +           "GuC: invalid semaphore instruction field! guc_id=%d, 
>> type=%u lrca=0x%llx, token=0x%llx, data=0x%llx",
>> +           guc_id, type, lrc_address, token, data);
>
> We don't need/want to print the LRCA.
>
> Daniele

Understood, will remove the print and the lrc_address variable.

Jesus Narvaez

>
>> +
>> +    trace_xe_guc_invalid_semaphore_instruction_field(q);
>> +
>> +    /* Treat the same as engine reset */
>> +    xe_guc_exec_queue_reset_trigger_cleanup(q);
>> +
>> +    return 0;
>> +}
>> +
>>   static void
>>   guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>>                      struct xe_guc_submit_exec_queue_snapshot *snapshot)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h 
>> b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 29abf07d8f04..d3ecca3c8ed5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -41,6 +41,8 @@ int xe_guc_error_capture_handler(struct xe_guc 
>> *guc, u32 *msg, u32 len);
>>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 
>> *msg, u32 len);
>>   int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, 
>> u32 *msg,
>>                           u32 len);
>> +int 
>> xe_guc_context_invalid_semaphore_instruction_field_handler(struct 
>> xe_guc *guc,
>> +                                   u32 *msg, u32 len);
>>     struct xe_guc_submit_exec_queue_snapshot *
>>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h 
>> b/drivers/gpu/drm/xe/xe_trace.h
>> index d4e9d91f6f7f..e52054eccc8d 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -223,6 +223,11 @@ DEFINE_EVENT(xe_exec_queue, 
>> xe_exec_queue_cgp_context_error,
>>            TP_ARGS(q)
>>   );
>>   +DEFINE_EVENT(xe_exec_queue, 
>> xe_guc_invalid_semaphore_instruction_field,
>> +         TP_PROTO(struct xe_exec_queue *q),
>> +         TP_ARGS(q)
>> +);
>> +
>>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>>            TP_PROTO(struct xe_exec_queue *q),
>>            TP_ARGS(q)
