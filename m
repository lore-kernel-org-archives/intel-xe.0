Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0685CA0EFB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 09:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5F910EA1A;
	Fri, 30 Aug 2024 09:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxKfFiKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB01C10EA1A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725010843; x=1756546843;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rBRu83gWyil9WFikwSX5BbmWc+VDNpIiBJOD5CQiwTg=;
 b=QxKfFiKPjwnZmMMC3G7dnzBVdEfGPf3/7eFtkM8ouVKggY7mYc8yPSZ9
 LZhn0c9WW3f7m8g5rC4rqfU1o4z1BZlUdijTeSt9nb9BCWhyyAAQ0qeEr
 /X+u7jfPBycovuEExQ6WCQDc/xw9ex3rvDmthApzWJfWemWKEj1QY4uvu
 Mxv6Ih0j0yLXoXTgNw/GeHMQ9RXGqyHK4zyYkySJ4ssCAIrnAzS8Cvl/j
 f8O2wXtkoNEZT2HW2Pv6Gi9Say4YbQv0ybE+9D2E1D+4/CWucDcmYAjom
 V2zkkIISVofxbPOh9pdMZfAh/kcy+H0CMT3sCnDENJBjKNO/xMq+aMYB6 A==;
X-CSE-ConnectionGUID: PHdSu4xMRQacubYrPLtW1g==
X-CSE-MsgGUID: hQWoeyOjSOiUpuk+3h7ijA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23799780"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23799780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:40:42 -0700
X-CSE-ConnectionGUID: SSRBNOD5THiaHyE2pozoSg==
X-CSE-MsgGUID: mOMN/Jr7Sm+HXBwNqSx34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="101362635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 02:40:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 02:40:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 02:40:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 02:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+mF4HXwa7vvIkMR70P6POxhdOBqznN7SZTH3zUmO4xTn8inlBrjTTIh5/Lh02fP/QGaLjgyy4cYEwaktoeJObZiUIfTxFGXV7eliaCuDPFYqafdDJ8TXUDVttsS0hAyCdR7bi0HWnt+PnBWzeTQjdBVhouI+EcsACHsMg0Sy0Xz8xBS9Fhp4vTgJZR7wXIoRS9uwbe92dTCxEgfiulREuCukDxdYkJc2yT7+cG31KgA5tsV46/FXefnhsZjuOYQCOQIUedISU4py2pi0u3S/BSm857zc+uUUDFyfAFaXtGBWmfy+Z24Tt/V+moHiGIqKZWCjXTqkw3nuyUWGF2uVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGZ4cAXOuOjcZ9v04OyUvHoQTgQRoV9g/vZBEvllmgc=;
 b=C7ShzAlqoCjRB7fQ9pKlSeUOQNzdgC9Ee3RsEfJZlsK4IMfzHH5S6L18OgVSMeSeUetTL4nAnp1eltUXNMR1JuGaGlx7uzkql6Fb2R9UNOggc614zcZH+VJ3JnFsaCT/fXpE6GzKW07BW5CbnwFfztkDrMZC5VtcZXn2VMbMZL2NHNu+okoLtzk86LCKSMH/pc3dpQ9tKwIf2qwrm7toJ6FYEBhVBckHMHPFzx9sxOGYOCzrD4m4wx8Rjp2dR2/Os58fm+fwrjmezS6t3ItdW12qTO7LAn5WDWwGpAfYMQS+6phYyNmy22R+u4V8CGyqpSBRlMpYmr5EMx9vror8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 09:40:39 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.028; Fri, 30 Aug 2024
 09:40:39 +0000
Message-ID: <b006b2ac-6a67-4121-8af5-3f34fe909b12@intel.com>
Date: Fri, 30 Aug 2024 11:40:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix memory leak on xe_alloc_pf_queue failure
From: Nirmoy Das <nirmoy.das@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20240826162035.20462-1-nirmoy.das@intel.com>
 <e722739d-10f4-403d-be67-42a54509e3df@intel.com>
 <0d95ca62-5d39-4be5-8714-beb465988cea@intel.com>
Content-Language: en-US
In-Reply-To: <0d95ca62-5d39-4be5-8714-beb465988cea@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 147b52a1-1821-44bf-8f9b-08dcc8d7ceca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVV5T2p0ckF3YjFvRDluTWJmTVhlSHFqaStucnlQZ3UvZldNMEZ4RTI2Sy84?=
 =?utf-8?B?ZC9RZXhlNythK2JPRGU2ZjJaT2hhWlluVzBmT29lZmM5UTQrZnNINDkyZzNN?=
 =?utf-8?B?NWZjT3BlaUxmbnhhekN4M3NKcXl4V0NrNE9vQjhoT3loWHZUVkcya0NGSm1P?=
 =?utf-8?B?Tzk5OStoUjNuWTRrZzM2eWlsK0pNdGF1Vmk2aW1MY3lqeE83dUhVZzhCaHNV?=
 =?utf-8?B?TS9IbloybVN1ZGtEZ0NFZEg2R0ZYZEdPWnJDSVk0Q0kzeEYxK3pJRFNWbGJ4?=
 =?utf-8?B?dHZSbjhoUGxJWjV1Nk1SV3h3ZzNBbnlrcmVpRnJEblMrdHp4ZFJhM3BvSnd0?=
 =?utf-8?B?ZUJONlRPNUU1NDEwdDhvZFM1eGozZmZxYVczNS83Mk15cFJGRGJXbHJiSmYz?=
 =?utf-8?B?TUZkRThVS3BuZ1ROemYwVjFxSkY5bmUzcWdmRWorSnpXRy81SUszVTA5QWJR?=
 =?utf-8?B?ZjdkcXJPMDV5WnRxSnJVVHFVNWlia09OOUpUR0YyNnozRlJRK1hZT25rdEhU?=
 =?utf-8?B?YVpMTVp1NytUNitRZVlWc3o3eWgzc0ExcVNEZmxOMzh1TGlpaXFCQldJazh6?=
 =?utf-8?B?OURKQ0FvcXRSQmtIVVFQdnBtMTlSOUc3U0Rmbnljc3FLc3E0R1l3YWF6dTZI?=
 =?utf-8?B?Ymw5aEdWMS9hNFZ4MW11ZzVJaWtBNEd3eXljdnlLT1VhZGNiRHcyNGZUTS9R?=
 =?utf-8?B?dlBUK0Y0UGV1cU5mSzVRVEhac28xd3RVMjQyN1lQYVpIbGlWZWw3Tm1ZT0xY?=
 =?utf-8?B?OTg4R3psUEZONTlvMGFOSkdYTzZPVTFiVkdCU3pjUDd4SG9ZNm9VQWMxQ3lU?=
 =?utf-8?B?eDRxTXNQMVMxZkd3ZDNhWnpyYnZGRUtsN2l2cWdnd3d0OEpReVcxOElzQlZ5?=
 =?utf-8?B?aGlRZmQrMlBKR1d3bDMwNm5EU0dWMDYzbU9oMmRPVUh0N2FvQVNnRGgrTUhq?=
 =?utf-8?B?OUpmMnlVcUxlQjd0RWdPSDZlSElRRVNBZGkwZkFPUERxQ0pKLzZ3MFU5YWln?=
 =?utf-8?B?a2N0K2gvRlk4UWk0NVlJc21KOTZCTC9pZEVJdE5hL3hzenhhS3RESGZNU3o3?=
 =?utf-8?B?M3BCQW1UeFdtWUNMRHdrbWI3bHBmRnJvZUw3QWtBaEFiVzgwUE1tSVdTR3Nm?=
 =?utf-8?B?dGQ1c2ovSlh3b1FaN3ZyWjBsbDVRT2lERXE5MWdCaFRnZzBFUWRuMDdrUDND?=
 =?utf-8?B?V1JsNVkzN0IrNHRuQWIyd1hNYWxoUy9iSUlOWXlRNDlobllOVDVYSTVvQ3Ni?=
 =?utf-8?B?Si9SalZhaXA2UXVqcXlFeVBEWHpGbitudlFsWDBLRHZxMzk1Mm9jenBNRGlV?=
 =?utf-8?B?YktDQmJGMm9MQ3JiZFNSd0IrQWZmWGJVUUp5RjZkQUl3NlhKL1BweGN0aVdv?=
 =?utf-8?B?U2V4b2dZN0VFS09TOEdRZkdkOVZwT0Z5NXg5T1ZwQWkxejg1MGNlVHFtNG0r?=
 =?utf-8?B?cFZGZFJYNWgvYmxuUlZjZ2oySmduR2dpc3hEMU1JTkpnVGNRRTB5MUhscUZu?=
 =?utf-8?B?WUsxZldoWFRkVFFGcENrTFNUaGl4dDZTdlIzQm5BMDRXaE5KYXR6WlIwNXRu?=
 =?utf-8?B?L3Rkb1NrTlRuMEk1TUQ0SGlsT2o4cjYreWErY0Q3Kzc2czg3anV4d3orWW8x?=
 =?utf-8?B?YVVpcXNJamFHdkpVWjExZ3A5d3lWK0dXWnVHVjdqZHFKY2dVVWxQOWx3Njdx?=
 =?utf-8?B?SzdEc1BuNi9rbkpnc1V5N29jbnNSeUwwU0d3NWNITVBlNE91ZGkzZnByZ3Yw?=
 =?utf-8?B?MzExRmdQaExsanRkM3JTNjl6OU5nRXNMN0lsM2JBS0JpOTlTZU1RZ0FzVG4r?=
 =?utf-8?B?YVZVOTJUZitXemJkczE4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVieFR6M0NvUlFLUVk3R1dxUDQ5MmE3WVRHU1NuZ1JodjdNT0o2TGFEZzF4?=
 =?utf-8?B?ejBFd28wOXM4N1J2alJVenZTNjZFazJTajF4cDRhNUxxbEJWSEZ0bWZVNnZL?=
 =?utf-8?B?eTl6WXBoQllaQ0t4V0dqY1IveVdYT0pxMldCL1V6Wkt4bWpKZkNkd1dJZkdZ?=
 =?utf-8?B?bEZDUjY4RW1zdEIwTExHcStwSFB5eHdjaUdJc2ZLOEpXbmF3ZFlnM3NMeWNu?=
 =?utf-8?B?dlVOZDg1WnpkZjVjTFIzNmovR2pROW1oK1hmTDQvb1pLdlFqblUyVWZyT0pu?=
 =?utf-8?B?M0hCZUF0bVMyV2ZUM3JWSzh2L1ZJZE1qQm1iNnBpVUoxbUpCRGlsN0JNY2RU?=
 =?utf-8?B?Z3dYazVMV3phWVd5UkdNWVhad2NzUG1LSVNTb28rcEIyVUFkdFRqSVJZWTVx?=
 =?utf-8?B?Z3hud2lqVW1kd29kYmxGR0lLd0xYTEZ0Qm1wSDZtLzJzSUxSWElOekJLd1pJ?=
 =?utf-8?B?Ykk1UVY0TURBRkhBSlhlUXBRa3BSMFlybCtEdnNrM0l5OEpiRzlFYUpWZ3ZL?=
 =?utf-8?B?enJESDVaVVFJeHJDWHlkRWlTVm1ISGRhdFZNbHRzSThic0pmanUxM0FId3lu?=
 =?utf-8?B?Lzd2WVFHWmtVSGJGdWtTeXhOMFBKZ2Q0ME93N2tDQ1pRYWlSbGZyTXZ4VkYx?=
 =?utf-8?B?Wnl4ZWNIUEN3T3B5c1J5RW9vemV5bDhPSHlITG9MRGpLUmtVVmwrNFF3T2FL?=
 =?utf-8?B?U1c1ZU9nMm1nMUxjeHdQNWZ4YU4vYlFtUTYzUGJFSHFLdFQ5cDc3Rnc4WHpV?=
 =?utf-8?B?d2lubkZxTUVFbCt2SUlWQmZjNlgrWW1hM0JoTzd6NGc2Zkx0VW05VzR4cStR?=
 =?utf-8?B?V1JkR0xEY2hndWtHMWJyOWY3TkFaczh2QXdoTVNvcWdZOHE1N0tTZkR3Ylh1?=
 =?utf-8?B?a0FUbUhySnRZckp0QUNFWnBOdEVEMndhc3BoNmpMOHdBbHgvMllwcU4zcHlP?=
 =?utf-8?B?SU9pbG1LeW5xR2R6Wnh1TEp3SWZtYUMvVDFUcEdibVFLb3hxbVFzZkNIek5y?=
 =?utf-8?B?Y1lBN0JUODdxQTU5ZzM1VGdiTjJyMjNjVXVOUmgxVXRyWWxzMzA2RnVRSmZI?=
 =?utf-8?B?WExiZ1JrMjFjRDh1cytkZEI0SitPb3lxYnJYcDRlTjUydVRoYWVDZDRkWHBS?=
 =?utf-8?B?TzNjb0RYNk0xYUVhNUlMZU1ZRUN2MnpOSHhKMHR6TWtBOGFkd1RES0phRC8x?=
 =?utf-8?B?UktXYkdmQmpxYWxqMXFleExDVlNTYnRSSWNsWmlyQXZZR1ZXQ1I4ck80YXNF?=
 =?utf-8?B?d2hMbFlPeWYzeldpZmFKbUl5Yk05ZndyclUzNUZzN2VpeVAveEVrUVVoNU9j?=
 =?utf-8?B?VUdNVXpmSjkzamZURDJ3M0UvRk1lblhyblJHNGZpVkhiaUhlZGlNRklzWWxo?=
 =?utf-8?B?dUtQT2lxVWFJWUlMVUNpQkxnUHluMXp4RUN4eSsxK3FqWGhZWWM3N1UvbDcr?=
 =?utf-8?B?N0s3MUt0V0JBUFdDTE1mOG5hck0zeE9KY0JLRUc3bU9tV21WMVl4ZUdKWW4y?=
 =?utf-8?B?eElraHpINnFIc2pyN3JZM28vUGpnL1U4OW5KcDZGQVNYZ0VWb0VqNEVQaXBI?=
 =?utf-8?B?OExFR1JGVHdlOFlMK2xqcnhuZXdRS2RRR0NjUzA3UDFBYW1iM2xxdmoyTnFC?=
 =?utf-8?B?OFNhNi9DOHZOSDZZdjhEbTV3UHZScUxlNVZHUTNycElOWDkwN1lxSjZZZjBm?=
 =?utf-8?B?cW1sY2JIdzE2ZTBBRmUwVExpUUFpLytxdWxSclpQR1pPcmlGb0VMQWQ3YlFU?=
 =?utf-8?B?cTZJTFdsdzRMVVlZTGc4S3pnYVFaODA2NTF4RW9iNFFUdnFqa3UvMUFxU1Fv?=
 =?utf-8?B?b1o2eEhDcTBBZzFjYTBIK1grNG9yUnNLTUcyUTZaaUdXeS9EckhOUUFTc3JP?=
 =?utf-8?B?SU9oV3BHVndrRW9KdkVjYlRuS2FCMmpFb3lsMXJoMi9CSVBlckFHdnN4dlJ1?=
 =?utf-8?B?U09PNzU0Ujd5YWl1SXR3ZkFkNGV5VUwxeFo2MVU3NlQ5Zzd1N0RPb1ZtS0dE?=
 =?utf-8?B?RWRGNXpwUGF6eXkycWRmK1hRdmsyWmhobXFPTUJsWGkwbTF5Y3FJeU1OV2hD?=
 =?utf-8?B?NklnV00xZGNaYmRySytiMFpWR213aXRHVGd1aHZWRGVSdnlsemVqbmkvczBk?=
 =?utf-8?Q?Hnr/+5tJEbGdi2KVLRe29wtvK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 147b52a1-1821-44bf-8f9b-08dcc8d7ceca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 09:40:39.4916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjW98in+GU/4ICeKsE8Y9uCqf2DBX+/KmZ1RrlRUcJJ86ahJNvrXbavYaVrX88yncMq0vA4q+IxhbKvsBaUwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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


On 8/27/2024 11:48 AM, Nirmoy Das wrote:
>
> On 8/27/2024 10:48 AM, Matthew Auld wrote:
>> On 26/08/2024 17:20, Nirmoy Das wrote:
>>> Simplify memory unwinding on error also fixing current memory
>>> leak that can happen on error.
>>>
>>> v2: use devm_kcalloc(Matt A)
>>>
>>> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault 
>>> queue size")
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Stuart Summers <stuart.summers@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c 
>>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> index 0be4687bfc20..91810d0a9afc 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>> @@ -388,7 +388,6 @@ static void pagefault_fini(void *arg)
>>>   {
>>>       struct xe_gt *gt = arg;
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    int i;
>>>         if (!xe->info.has_usm)
>>>           return;
>>> @@ -396,12 +395,11 @@ static void pagefault_fini(void *arg)
>>>       destroy_workqueue(gt->usm.acc_wq);
>>>       destroy_workqueue(gt->usm.pf_wq);
>>
>> No need for the new line here?
>
>
> Me with my telescoping vision. I will remove that before merge, if 
> that is fine.

Merged it to dem-xe-next with removed extra line.


Thanks,

Nirmoy

>
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>
> Thanks,
>
> Nirmoy
>
>>
>>> -    for (i = 0; i < NUM_PF_QUEUE; ++i)
>>> -        kfree(gt->usm.pf_queue[i].data);
>>>   }
>>>     static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue 
>>> *pf_queue)
>>>   {
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>       xe_dss_mask_t all_dss;
>>>       int num_dss, num_eus;
>>>   @@ -417,7 +415,8 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, 
>>> struct pf_queue *pf_queue)
>>>           (num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>>>         pf_queue->gt = gt;
>>> -    pf_queue->data = kcalloc(pf_queue->num_dw, sizeof(u32), 
>>> GFP_KERNEL);
>>> +    pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
>>> +                      sizeof(u32), GFP_KERNEL);
>>>       if (!pf_queue->data)
>>>           return -ENOMEM;
