Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F446CD5BDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 00:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C1D10E6FC;
	Wed, 27 May 2026 00:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCvRWDt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F5A10E6FC
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 00:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779840299; x=1811376299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7bhqZzR0nZ2GVXO1cYy7wNvzpsGRgOTmo6cNxG547XQ=;
 b=nCvRWDt/l1O6GaOQ1edyI7SKgXHEUg/z93lank6e4/yxWBxqQTKwQyl6
 d+7AoXpc/OpDYrNfTyvNUSUIrtfcaFK/W8751vqyZK5D0LSmIwQo/4xbA
 /Uh2bgyUDn7KV389bXoaH9XdJtALqPR0WQrXPpswPP753Q8AaRkZZmFDj
 xaGdw/+L7uGV2KumUXL9bUijtMqi5WRz411b7YQQvD+u/F0+UQjv88DCR
 4Tg7MBXFVisa+YKPtv9JLhizPEPuEJedoYvmd3gcpy9JQDPgMfyDXHcO7
 C9Vb/TCPJEHdAUpg/CIWZNCYb1emPDAJvqn3JV0Q7RrSWD6aMJu1xohMt g==;
X-CSE-ConnectionGUID: SiLT8YXxTfK7P5LyQ2Z43w==
X-CSE-MsgGUID: 5RRWitwxRBKgTj7pDBdFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92054067"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="92054067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 17:04:59 -0700
X-CSE-ConnectionGUID: TMdq0mGwTGWgm4QaVS3fQw==
X-CSE-MsgGUID: 5CJtvkW+S9+iU8lrGAxAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237644270"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 17:04:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 17:04:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 17:04:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 17:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IToR9uSBJSfAawiYenyuhxqZeXL60SVwo8FYo01Tr9rzF5jTVlWajdQUPi/c36oQUhBxc3r4g2P5u9DvPArP7uML+WHCASpQfyKdMo3eCUSKfa85+N6aqdVm9sF1mKsP/PYIXDv5PP39w7XbEjPNhvIDlxy1DUSf1Ezq8ZM9CpN1mP9pPcGAe/YkIEINa8NOR95rlJ4lnHIm1PvsUNUucY07fhLi2q8qilztEvju6zioL8GTS+ynOWN6ZK4OQ4dEux9PQ1ryYEghraVYAJW65xBTbZPqhDRfBcgmi2ImWvBol0AqzO/tvoI/wuEI8fpbuWlvRvsQiMn/fW2NmxB3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FDQ7wjwCkZcMh7nLbsybPEatidp51MoWkJdLX8sQ0s=;
 b=FTCS6R9HU8zS6SVcY6ZMTrCoKw5O4JGf1V2FrPrNqnsEg8HcL9hSJD0908dgi/rgEUnfMoTNKJHaa2J+fmH8z9ZdgJfNFNxqyjyKDdSeQOVtY7W2DZD7Sltpymf+Qrp03Goe69S4LfME+Bi5bnscDscY4YFkKVtixK8UPUsMDSJqvkTQM1XOtJ+ZfrtPQFSC30y9ihBJsqZwBa0R4u53gkFQl8ACrHFRJ3lkO2vnyojoDl7oVvcBLreXv7PfLBkT6UCsOJ0aCFhpQnwFsBoLDNKHhtZl+reWZWFBKgqlg3MsV5e9KNqwLSd5qVdmUV2VSznGG8LZn+iii/kWj3Y22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 00:04:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 00:04:55 +0000
Message-ID: <de56fd4c-8e41-43de-930d-9115b14356c1@intel.com>
Date: Tue, 26 May 2026 17:04:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] drm/xe/uc_fw: Allow re-initializing firmware
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-2-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260516093131.27442-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b7f74a-80b1-4747-05a8-08debb8394f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kQfWXMmT2gOhVxxK1nKtZPKsC7IFHpZyttqQwtllVYhCEI3mBph171KVO9dVWNy+gnmT8rV8ZEGZoQQlLpZY796LXvsHWB92+jeSSMtO3xXgHv+ozG06E6nqOMxGE8qZvSJsfF5STv+QKtwzQ/mPxZG54sRrOP46K+PYykhK/y3AaHVQM3RH+Ngz3pa3rLDHuX4Xdgr5F2xC4N3F9tWndfXlKAm2ECvDDL2YJY9J+vitEnZBlpMbaPJ9UDcHfHgxqQa81FfFy0odCd3cC5cYPES9ROsMK6W8nQ6V/5xJMEVwjmP1UQxC8Fcin5ZHbgmFoxd1sDL6qqwTYeel+Azy0FsAckU97bOjCnE9ol3b9fG+MyyiuHuwpWtswmJ0q3pGjjuSSbDfkh6HlTHEuJYct2IHUdTvccu1f6wbbRo8jAELtaEW2brKMxYKZY7K4iKDl6dZzvzAnolK8x+vjAEiH8/hidpjBm9YI2TIXHyukzz27y3/slf/TfqWDdh5ixnooXUu7gypN4GMNFtxL2B9Hw1b8FHT0C8Wz44begQ8Ar1Bmd7SfNYNhxYgw9wK43fw5bvUvxkc2rp6/b64d0nmySBw09zT7oXnFIRb5ViuDD5imsEow9Wt3IayOTI++IHhHKNWcao3zQh5q2i3m/UObuHrs6LcnPVT/Q/WMLRCifEHQhaEbTqlyP8jr8axhqgE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRjdGN6TW91RUZ2QkVoTkFDNGpSOGNhZ25BRk45OEVWOWdFeXJadzhmczFn?=
 =?utf-8?B?Q1V6Y1dZTFU2RGlHdVJYMFVGdWlIU2dDR1ZUVHNsSUVUZ3VTaG9UMGFUOHQ5?=
 =?utf-8?B?SlpDM0pLL25XQmJBVnBwckFYYTFkYUNDY1hPbCtWR0FGT0NKcHRxVXN4T3Vm?=
 =?utf-8?B?R3cxUHU2VXA5eXlKQ1FMMTMvcVlHSFJ3WnNjU2FiUGpjL29QMHB6enIzZWNl?=
 =?utf-8?B?c1M3dk5xekw5V3hBR01ZWWRHcjJxdy9BbHdkZEhSMWh5TFovTTRuSDJudXp6?=
 =?utf-8?B?Yjh0ZzQ4VkJwQ3ZGN3FWR05XMDA0Q2hWUkZRZmRISjM5cE1Gdmw3NlRSWDdh?=
 =?utf-8?B?SGtxY04xS1d1bDdhUTg0KzJaODNvUkQzN2FlamQ3VDNuRGhPdlB3b1BtYzJ6?=
 =?utf-8?B?b1FQazdzWkgwNHRWL052d0xJVzFPbVpxd3EwUy9sQnAxSkhnb1FQQlBlTGpJ?=
 =?utf-8?B?QUhNWW5CS1N3aEVxOU53bmlFU2J0U080c21RWGVRejJpeVZnQldIbUNnNVQ4?=
 =?utf-8?B?V1E3QTZzdXB2S3k5SzhvMDNHTzFEZ1ZKbnZSWmlWLzYweWxmemhnWWhoQjZ5?=
 =?utf-8?B?RzJSMkNEcFBQQ09kUTRMT0hya0VucmhuanRiUHBNRDZnU2NFZ05qVVBhbUVr?=
 =?utf-8?B?R2NXUzlrcE81Z0c5TzZ2VC93ZWFXelhKVWpSMHVNTTRKenRpeHJaMzQwbkY2?=
 =?utf-8?B?SWFSLzRzWW1iUlZZNGNEYzBHQ3RxMmNlTmJLRm9FWXBoaHVJMk9YVUlzRkM2?=
 =?utf-8?B?MmVjREhkWUw4MFh4cDBsODlqWnhvanFsWkdhRWZLUTk4RkNMWEFqVERuYk9w?=
 =?utf-8?B?U1h4UEVpdnBnczBweVo3bWFhSVdwRy9lczBNNGMveTZVWHNkT1Q3ay9EVG9Z?=
 =?utf-8?B?aHhWMk9yc0xSeVV5TTVpa3NvZXNRSmoxSzFHUW0zR1FrVDBaVFpGU0NMaldT?=
 =?utf-8?B?Nk1hMjljUkgybjJhdTJPd2UxM2UycU9sOU5mOEZ0eEVGOEZiazNxL0F5RGk4?=
 =?utf-8?B?ZFRva2RPaGNQR0JBRnJZdzZLYWZiRTNLZ2tQNzhFY0VFN3J4dzZ5RmxnTDNa?=
 =?utf-8?B?R1AxTU1pMTQvdXUzb3BJMGtDTS9oUzVnSVhvMFk1Sm5TUmhORFBVU0ZVZW1k?=
 =?utf-8?B?MzcrcjY2d3B0WlZ3M004UHdvZE5YRnk4N2l0OGpJZGp1Ui9yOWJKNGNkdGJn?=
 =?utf-8?B?QnlzTFdaZnRndVk0dE5lNEJPeFVXVVpIMGJTbzJ0U0IwRlBsVENGejRscSsv?=
 =?utf-8?B?bXVQSEgwWHRGWERpeGtiZU9yT2oxbEdEWlcxL2lHam56cEwzY0V1cThzYktC?=
 =?utf-8?B?b2JUYzh4cU1qTFZ5T2dKbVJkdzRsZDdKYis0VXp3cjl1VGYyUUdsbVhSaGF1?=
 =?utf-8?B?UkRmUUtrSmg3YlpDOTFSSTlBRDFHTERnNWZyaHB4QlRqY21OTndKVDNkUGVo?=
 =?utf-8?B?MlpGM3ROUGlyTnJTR0ZqOFlJaFBPMnBJR3dtTmRRVlB6cGxwanNqNVZGOWFS?=
 =?utf-8?B?VjU3RFZoanBXUWRCalFSWnBkNXJvclVCVzFOM2gra2VtRDloVzNFcllMY2ph?=
 =?utf-8?B?a3JYVUtTSXVabWJVT25RQ280TXNsM1ZHMDdYNjFKMllPaUxTRmJxRlNaN0Qr?=
 =?utf-8?B?Vk80dWw4cmpZWHVYd0tRNitaOThCZU9CdVA5dFhzek9RSHBZOUc0K0hFdk1Y?=
 =?utf-8?B?MzB1WTByQzFkemxlMnV5TSsrME9rcnVJbHlVSysvM1JWSkphZkdyelJISThX?=
 =?utf-8?B?RCtvSk9xN3NocGd1KzZMQ1NkdEtMK3JUbVJweDRMNTdqVWVDOFRGUC9QV1U0?=
 =?utf-8?B?dWkwbUV3YkxlMUFpQjBnTW9LZjBYZWtOeXllSHhJMWk0ZUxWQjBLdEtnYktz?=
 =?utf-8?B?cEZPbDJpS09XbjluMXhtOS9wc0JGWTdkdWkwWGt4ZC9aZjFJRzFjTGUyYWJP?=
 =?utf-8?B?SXNVK3owN3dVTE8yM2twN0czbFYxalVHVjdqRGRpUG1HcXdXUzdoL0F5Y0d3?=
 =?utf-8?B?WWhKSmlHZmhHZnpQa2tJejFCVXR1TTBXdHYrVFBSa0grTFdLZ1RtVEJ2a2lC?=
 =?utf-8?B?Z25OK0daSGdyRXFnMFlwN1NlRks1cldad1VZcCtUbmRXbXRQMjYrQ1dFMnpz?=
 =?utf-8?B?Vm1NSGJuNHd2OTBKTU9xcmN6MFBlSkZUUnJNQm53b2RyUEJTcFVDd2laTnVK?=
 =?utf-8?B?TzE5VU96SGthL3RJbWNweUw3STNnZFZCeDFlSnl0aUJYaVZHcDA3b1FlRE16?=
 =?utf-8?B?WUcvUXNqdHduQVFRRGhnME1pUUJrZFc3NVp5QjlaN1lpQzdqbXgrZWFpdUlj?=
 =?utf-8?B?TlVkWnpVK1pPeVlhbFlGUzlXYTJiRlNnbWJRbXlpYXV6M2VRMXcvZVVtNnZV?=
 =?utf-8?Q?3n2UnM+CdJixys+s=3D?=
X-Exchange-RoutingPolicyChecked: SJ4DqJlfK30HZhYdC5VClFUplRKe9rRZGz517c7TmoxpyN4aUN4QnXmY6bZYs/VmIKriuObmjnILSusvW0z1eNZ6029U+wUbgY78xaJO9hdfZZGtDH2tGUOVz9d60oXijTA/MdDRLZSKlx/93XYKvJ9mCZWrPlz9NIMYfv7CiCovDAJYUD+on8iyI3ikFUbekAva5FZnNuHf89sYucO/gu/jzSychsDEOYv8FAaF5yth4rgrIMW60k30/od37G/oqDGcDARF0P9UVruU5gA1OmXR1xQ7txSosQrGuKzJpxVe3qQ4LdPy9S4h35P2dAwrijEXWpkOra9Ve7JpFIyF6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b7f74a-80b1-4747-05a8-08debb8394f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 00:04:55.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Osj0ShfUt1m1EjyArNQlHMBo9crhoOnAFiFzoex5ts1Bpt6CV8VUH0MrfnRYYZp8Jy63Wd4zLOklsmo6ij/iJpaHK4mPEICf/0d9TxfnWpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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



On 5/16/2026 2:31 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing firmware without
> reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
> already exists but since it's contents are on VRAM, they are lost on PCIe
> FLR. Copy the firmware back to it's bo and mark it as loadable as part of
> re-initialization.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Add kernel doc (Matthew Brost)
> v6: Skip uC firmware selection during re-initialization (Daniele)
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 56 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
>   2 files changed, 57 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index df2aa196f6f9..c23c35dc2a4d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -834,6 +834,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>   	return err;
>   }
>   
> +static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +
> +	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
> +	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
> +}
> +
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   {
>   	const struct firmware *fw = NULL;
> @@ -857,6 +865,54 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   }
>   ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
>   
> +/**
> + * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
> + * @uc_fw: uC firmware
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
> +{
> +	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version new_fw, old_fw;
> +	const struct firmware *fw = NULL;
> +	int err;
> +
> +	/* We shouldn't be here for the firmware which wasn't loaded */
> +	xe_assert(xe, xe_uc_fw_is_available(uc_fw));
> +
> +	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +
> +	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
> +	if (err)
> +		goto fail;
> +
> +	err = parse_headers(uc_fw, fw);
> +	if (err)
> +		goto fail;
> +
> +	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	if (new_fw.branch != old_fw.branch || new_fw.major != old_fw.major ||
> +	    new_fw.minor != old_fw.minor || new_fw.patch != old_fw.patch ||
> +	    new_fw.build != old_fw.build || uc_fw->size != fw->size) {

Since we want an exact match, instead of comparing each version field 
individually we could use

  memcmp(&new_fw, &old_fw, sizeof(new_fw))

> +		drm_err(&xe->drm, "%s firmware mismatch on %s",
> +			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> +
> +		/*
> +		 * parse_headers() updates version details, so restore original
> +		 * version before bailing.
> +		 */
> +		uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;

parse_headers updates more than just the version, so IMO better to 
save/restore the whole xe_uc_fw struct.

> +		err = -ENOEXEC;
> +		goto fail;
> +	}
> +
> +	uc_fw_reinit(uc_fw, fw->data);
> +fail:
> +	uc_fw_release(fw);

What state is the uc_fw struct left in if we exit here? Do we care, and 
if so should we explicitly set it to some error state? might need a new 
state for it.

> +	return err;
> +}
> +
>   static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
>   {
>   	return xe_bo_ggtt_addr(uc_fw->bo);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index bb281b72a677..9f469bf07d66 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -15,6 +15,7 @@
>   struct drm_printer;
>   
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
> +int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
>   size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
>   int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);

