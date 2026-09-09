Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4CBC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 05:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D6210EEB5;
	Wed,  9 Sep 2026 05:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nu/p9k8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D191010EEB5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 05:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788932640; x=1820468640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YHfRU3uKUrVRNU3PEKrwSdnvLyRNkosHAkRWbCW1+pE=;
 b=nu/p9k8wp2X3Q6BprqdaasRe095ZOy0gsqrH/umyWhscqCUWx4I/iiRs
 i5dLi4X+4vWdeWEkoEaU1xofpsD1/YxO2B9AANLpDsLhZgOOK75VyclnC
 A7iklbhSIsHlv/Oh1bjP1VybvghRP8Iox5qxw4wbcveR05ZzJ8cwdrBM0
 OU9t1j9XnY5vCC3yDp2wI2uUA7ZTrsxf4t5uc7TD7bHCg4T7Y84/d5UQZ
 Iks02cm9HXbDpVy3Vb5el7+Auy9aGKXeK7N5x3nLml4hRKAhm+uh9l4Vg
 mQpYp/Ro6lcaewH2SREuhxJkHMeZTnkFddNpxmzalnko3Ej5UIxQFDFKR w==;
X-CSE-ConnectionGUID: 0fgIi3+PRSuys3Dmnx3bSA==
X-CSE-MsgGUID: Hmr5gK7DRnaqbAZq/hvrCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100505842"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100505842"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:44:00 -0700
X-CSE-ConnectionGUID: 6jRqE7ViQ86Dmbu3Mfk9/Q==
X-CSE-MsgGUID: Y0ozMkjDRJu3L6emAyuBrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275351248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:44:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:43:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 22:43:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgEu76bF0suMAsVTC03JtBX1Mn6EhpZDERz7aVdH7EJUdwerm/maWSb/VL5mSCzrYctVN0OVtWY0MyJwB47VV3dGUSusSljGOc/t7Nj74CGnEjzv/kks1qg9iPZ/bIKuvbPAg9jcLn3TekUbPnlHpjPPHjai0lYb9drwO3RT7I2Oryf9K/kyAO4Ymjkv599cE0T2JzLP/nSIAq4rpehh4wLhtwSmnEI8WoF5jAnuUCjjgY2CeLmRHbAJ+Lo1NWqx/Jkf2cozibdXhjKPmKNZVmtW5GoDVNfTXx80sizOelX17RWMrqClIGW/Sy/Eqx0ahSsx+r9UYFRm81bsJMMWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9c+0f1A6eWIUO+6Vjnjzwmn+ffQ4HjrhvagU7xbGfo=;
 b=VR5jBTlNLJiBxyQtkYiKcowrABnbqxJTw33jOuBNFrxhy3Ab5ENCGK8cCqEslbmQa8Xmz4wQAh+DmzgRrgJGII8Bpo13KxaLYv9/XIzA9iQWh/tSKFtmqN2H0l5kNzbBRW/P8mYZOSrqvisk0XR4x3zslKVeFOpdfUSk1pB4KFdB1lKE0mf58PS8MzlaUY95WY7FtFRAdvmoSlST/XSAyruaY0upI52m0MAYfDM8LljpfUSw2hGZY4WBc7rcEE4E4EUBsuSjHcF+ESufOuNJ+KJSTMTmw6uGfhFPD7Y0GnhI77vUyAE9cLEOLJ0M2u4aodm04ILQCZTrJEZTOM6N8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB361656.namprd11.prod.outlook.com (2603:10b6:408:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:43:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:43:52 +0000
Message-ID: <e26670b1-9554-4375-b48f-f7d720c983bc@intel.com>
Date: Wed, 9 Sep 2026 11:13:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-11-riana.tauro@intel.com>
 <c6b2e25b-ced3-41a7-b2a0-2029877bf351@intel.com>
 <3981a84a-dd6f-44c6-9a8e-858fb3202a99@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <3981a84a-dd6f-44c6-9a8e-858fb3202a99@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB361656:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b7a98f-8ca7-4454-e679-08df0e35541d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hsNJJI9Mmoudxurf/TpF9y5MgKV6erYivJc+ppXpp2u7kAIs+5Y7Czmg5mBqYANqdUUZevhhu8Z4rulXeoSko5yerhSNQSaC1tOyTA6O0mdH6dWPe17fNltmMi7OL4iWv4qvS9Mx3oHsaBYiJC43NDLgiAAq1UCqeU8p4spvb5cMrmgWKbaMDieWGmvSAlz4Vd/IHuHFv5pzdhJAu3K0pSgmipNgKxGxMTDfF1JSiUbVRpDBRRmdRF4+pOoc+yE2bTQzG2fZzMsDNYcuEz5V4u0FAPGH+c9xmhSASVQ4MzsogdpdZELSIzd79XfsXS9uQR/IeQQw7knR4/BT4X7KjNp/zqAyyqW5jGdx9UAFlucDZ/0lQbK6XgwEWfvSL+A4ol2MhPyhr9zd7A2p5c0Caw9Ei8aHildZl8g3K+ZT3VCffozE0BEJwIHyCE0pxKMBaHwNyVd4r1I2wijoj5kmIxSMqyhKtBYOAT927T0rnUEgpfXVpr+hznt3QoK+qIn2ag8bsU68AoMFneChBMvT+Z0StHaVJKmyQVgpOARGcMLUQQexshDUdf6JnA/dKlliE6ao3uHQZSyQtAClMzvaj4TEqN8k14bD4D8W0VUOZoNBQ2LQRabregff6avzdTZimIwJtvAyjQAPtjWkOkQ7y7tnFhEipdIDGLUmN4LwppU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRDcENNam1DOHEzeThYam04NnRaNW1RN0hGU1paM0FCcE5ldlRmdTA1cVRC?=
 =?utf-8?B?OG16WEY0bnpndUl5VXVsRWJGaFFaOVJqMlZ2MTBaUkM2dnBDZWc0MkJQYmFJ?=
 =?utf-8?B?bFg3RUY3dUxPQkRPNGVrWjB6YXdvKzZKZ1dCZ0ZqcjFqU2hzMk1sdDFKN2s1?=
 =?utf-8?B?bFFCbWY0bVZHSUkxYWlJdTcrT0JQd1piekJOVkx3TkYxOTJwNmp2MG16ZDlk?=
 =?utf-8?B?REMxQUdvTnFWcnVFejVJMDRHc083elJnb0RuTm5PRWxyUlI4ZmthSlp5NHVy?=
 =?utf-8?B?UStlRWpSbGdJL1FwNTIvdCt5QmhPN3dZcjVHM0oxeDBDUEk1bmJLWk11Ky9n?=
 =?utf-8?B?MzZlOVhZMjJrK25JbHVJTFFMaUY5UU5rYTM4ZzdBQTRHS0hPUHVlYm1FcjNP?=
 =?utf-8?B?a1J2bFpjUmFncy9mMFRoTVFxVHN5N2pBekh2ME1VYnFDdVd1Q09MMzZsQVdx?=
 =?utf-8?B?ektPWWlzeDkyZ0R1dDM5RWhhRGY4MmMyeUVOdWJYR1JlWDFQcHM1cDBia3BY?=
 =?utf-8?B?K3NUK2ZncUhRa2lZK2M2VXZWUUx1eVlvN2NLTkxhdFdoVFBlMURsY2oyV2Uv?=
 =?utf-8?B?TUc0bFpuclJoMVZkc21YQlJlRnk5K2Y4UzlJVEJjT2hIUVN2UGVWc2VsOVBJ?=
 =?utf-8?B?aXEzLytvWHdWT1cxU21UOTVNVWxFZVVZejRNZlJVRTZ0eGdwU0Y0OWRSTEoz?=
 =?utf-8?B?L1grUG9ZKzNKMForMHJId3QyblAwbmlTcks1N0w2bXlkMUliWWxVNWVrODFy?=
 =?utf-8?B?M01tbDJZVUMrOWJzU3RqNHo5Z3FaSHUxNzVpaG9RVklaR25FWjJISEtUN2s2?=
 =?utf-8?B?ZDhCZytHeUo4SGVOQWtyVmdjb1NTTW5naXU2cy9vMUZ1Ui9pQU1SWjY4VGZ6?=
 =?utf-8?B?TEMwa212bHAyZ2JSaTN5cVBRN2czOXhjNWZ4YjBzMzExYlZpZFQwejdPL3VF?=
 =?utf-8?B?REFyREszUXMxa2RUaFppaGdYZ3NxRVUrU3ZudU9hMm1YTEF6OGt6NlpUK0lY?=
 =?utf-8?B?RnNld0dzSXZHNkFIL2ZNYkJNWGo4Q25VNEJKQXZqZHd0d3dLOFF4ejdVMVVx?=
 =?utf-8?B?QzZYcEE3N2R3NVhvOGNzUEhPUjNCdlhiL0xXL2orNUpJWTI5YmtIT3pVdEZZ?=
 =?utf-8?B?WWNLZENzRmlJQkJIUEM4TDk1SFhuODBzR3BGWVc0a1JVdXFqWVNVU0NnWUhi?=
 =?utf-8?B?R3N1TnRHNy9vM2lPQXdzNVZtTkFidWJBTGVIM0FjMEphTkt3a1lNK0pzZ2Jj?=
 =?utf-8?B?ZW9Qc3I3cUZsNnlYK3NmeEduSTBMUEMrQ2MzYkl4VWJLQ3gxcG8zOEpYc0tN?=
 =?utf-8?B?N083QjVPV3hpMlhiS2M5WXJGdmZINTgrS0l6Y1VqYVREVDNmaER2RExwODEz?=
 =?utf-8?B?MkdLU3JXR3o4STdaNXhLQ2JIVk9xYU5VV090ZHhvTDZCZVhHckVQcVdLRVYw?=
 =?utf-8?B?VkVCRjMyOWpZSEw4VXVCd2VwOWZMVThpMWNhRWZqMk9YVFVhUnM0cGkxNGdk?=
 =?utf-8?B?eksvR1h5aWQvUnVNRmZHaUkydjZiYkJQU2hrd2pQYUVqQWVLNnNFcHNSNVMy?=
 =?utf-8?B?NGtpb09yR2N5d1RmM2VDd2t4cjRLZjMya1JUQVNCWE9jK0Y0c1crelFKYURw?=
 =?utf-8?B?cmpUMkgydnhSRTlWR1J4MDlKeTJ0VGZQVUhEdGpTUDBkZzU1S1ZDQ3BsRTly?=
 =?utf-8?B?emI1cktHRlF2eUNRM0x1ZUhZYUpIQ0xNakpoYUhSMTRqM0x6ZTFUYktsWWtL?=
 =?utf-8?B?V1Uyb3RXTUtXSEdXZjlpTHFNUy9xTTdDaDdyb0p2Ylc5RCswcE1wVkZMWVpC?=
 =?utf-8?B?SllYSFM3dTcyRlBMZkIvM3dJMXlZVGh6SWE4OVlxYlZNTU9lSytZU3YzeDBP?=
 =?utf-8?B?WnJlL29TTE4zSkMrcVNyNDI2dHJGVGIwdGt6ZHhjNzN5aEgwQ1VlQ0NWWHMw?=
 =?utf-8?B?VlZ2cmlMVVQzcWR5QSsycmY2RGlZcUl6UTVwSldYSmxGYjgrUWVrRjlmeUFy?=
 =?utf-8?B?MDllRXNBRXJsbkFkUERqZU4wUnZZN0I0Rk5KVk5xRHN6SGVRMkpUSzNiYnhu?=
 =?utf-8?B?NWxPNm5MZE5MaW5VVVNYR0JNd0VFT2JwMVE1L2FZV3VpdHV1V3dGOWVEcUE3?=
 =?utf-8?B?b2M0QmxycEx0RmNFeXRUczVJOUxyWlJVQ0tmMmlGMWZaYk1EanVHMG1hTHlF?=
 =?utf-8?B?WmpKOFZtcTNCRXUyRWdPSC9DTDhJSUNlcEMybnBjaFAvdTNmWk95dXo3VnZs?=
 =?utf-8?B?ZHFXTW03NWJDdmp5ZVI0RGJxT0Z3ZFVENndMMDdwakpFMmxDdHNZcmZNZ0ht?=
 =?utf-8?B?TW5rMnl4ODBtOFJtYkhQeE5WTWp6Y1VVc2I2dGtyZkF6RVJMRjZkUT09?=
X-Exchange-RoutingPolicyChecked: uu/wogsxG3TIokFYsTN7e5xVUFxgGj1o6OSYESb5t0qdY03kLJMWJQ/mUsGpY6+g0P9NMhqlucnIKMOKHsEWX1xYi6y2dNuI0HtmxhbF+cjUEeAWh8iWMkVzUHHI7G5cYUJUPV+Pp5BoT+2PwWerX1/cchp0QOPNV94oc4fiP00yvMPafn994HgPMltS9slVxrYps2wM/3KSf60AaY2Mw9ulBAuW3g2Zq9G7xdmiJOSxRFINH5ncv+aMxNAETH1G+PYnS3FgIA0HW0dLmlX9btk0HZJlz4eklslajF+VV9SQ6XAtudOARv639qJsXouZKWjriY6re1gJRcz6WbXEdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b7a98f-8ca7-4454-e679-08df0e35541d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:43:52.1056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnqVj4xvE2f44NUl2YjKws0Bd1hSeHMI3j6OPRnQmxUsAxj1+maR52DI/qZbgQEr35+CsHbytF3ZxVpOrV97Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB361656
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


On 08-09-2026 00:51, Ghimiray, Himal Prasad wrote:
>
>
> On 08-09-2026 00:34, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 07-09-2026 15:17, Riana Tauro wrote:
>>> Keep the DRM RAS data used for netlink reporting separate from the
>>> device and firmware RAS state in xe_device.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
>>>   drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
>>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
>>>   drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
>>>   drivers/gpu/drm/xe/xe_ras.c           | 15 +++++++--------
>>>   drivers/gpu/drm/xe/xe_ras.h           |  6 ++++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
>>>   8 files changed, 45 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>>> xe/xe_device_types.h
>>> index 180d450a6deb..f9dd65d94417 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -21,6 +21,7 @@
>>>   #include "xe_platform_types.h"
>>>   #include "xe_pmu_types.h"
>>>   #include "xe_pt_types.h"
>>> +#include "xe_ras_types.h"
>>>   #include "xe_sriov_pf_types.h"
>>>   #include "xe_sriov_types.h"
>>>   #include "xe_sriov_vf_types.h"
>>> @@ -550,8 +551,14 @@ struct xe_device {
>>>       /** @pmu: performance monitoring unit */
>>>       struct xe_pmu pmu;
>>> -    /** @ras: RAS structure for device */
>>> -    struct xe_drm_ras ras;
>>> +    /** @ras: RAS (Reliability, Availability, Serviceability) 
>>> structures */
>>> +    struct {
>>> +        /** @ras.nl_data: drm-ras netlink data */
>>> +        struct xe_drm_ras nl_data;
>>> +
>>> +        /** @ras.state: RAS device and firmware state */
>>> +        struct xe_ras_state state;
>>> +    } ras;
>>
>> +1 for this separation. Looks much cleaner
>>
>>>       /** @i2c: I2C host controller */
>>>       struct xe_i2c *i2c;
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/ 
>>> xe_drm_ras.c
>>> index 7f3695707611..38d77561facf 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>>> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>>>                      enum drm_xe_ras_error_severity severity,
>>>                      u32 error_id, const char **name, u32 *val)
>>>   {
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       if (!info || !info[error_id].name)
>>> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>>>                      enum drm_xe_ras_error_severity severity,
>>>                      u32 error_id)
>>>   {
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       if (!info || !info[error_id].name)
>>> @@ -90,7 +90,7 @@ static int 
>>> query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>>>                            const char **name, u32 *threshold)
>>>   {
>>>       struct xe_device *xe = ep->priv;
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras- 
>>> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>>       if (!info || !info[error_id].name)
>>> @@ -106,7 +106,7 @@ static int 
>>> query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>>>   static int set_correctable_error_threshold(struct drm_ras_node 
>>> *ep, u32 error_id, u32 threshold)
>>>   {
>>>       struct xe_device *xe = ep->priv;
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras- 
>>> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>>       if (!info || !info[error_id].name)
>>> @@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device 
>>> *xe, struct drm_ras_node *node,
>>>                     const enum drm_xe_ras_error_severity severity)
>>>   {
>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       const char *device_name;
>>>       device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>>> @@ -190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, 
>>> void *node)
>>>   static int register_nodes(struct xe_device *xe)
>>>   {
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct drm_ras_node *node;
>>>       int i, ret;
>>> @@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
>>>    */
>>>   void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 
>>> severity, u32 value)
>>>   {
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       struct drm_ras_node *node;
>>>       int ret;
>>> @@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 
>>> component, u32 severity, u32 val
>>>    */
>>>   int xe_drm_ras_init(struct xe_device *xe)
>>>   {
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct drm_ras_node *node;
>>>       int err;
>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h 
>>> b/drivers/gpu/drm/ xe/xe_drm_ras_types.h
>>> index 0be218ba2db7..8d729ad6a264 100644
>>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>>> @@ -43,9 +43,6 @@ struct xe_drm_ras {
>>>       /** @info: info array for all types of errors */
>>>       struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
>>> -
>>> -    /** @disable_vram_page_offline: cached configfs policy, 
>>> immutable after init */
>>> -    bool disable_vram_page_offline;
>>>   };
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>>> xe_hw_error.c
>>> index 5f2abc9485ff..f53a6b3055de 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, 
>>> const char * const *reg_info,
>>>   {
>>>       const char *severity_str = error_severity[severity];
>>>       struct xe_device *xe = tile_to_xe(tile);
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       const char *name;
>>> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile 
>>> *tile, const enum hardware_error
>>>   {
>>>       const enum drm_xe_ras_error_severity severity = 
>>> hw_err_to_severity(hw_err);
>>>       struct xe_device *xe = tile_to_xe(tile);
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       struct xe_mmio *mmio = &tile->mmio;
>>>       unsigned long err_stat = 0;
>>> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct 
>>> xe_tile *tile, const enum hardware_er
>>>       const enum drm_xe_ras_error_severity severity = 
>>> hw_err_to_severity(hw_err);
>>>       const char *severity_str = error_severity[severity];
>>>       struct xe_device *xe = tile_to_xe(tile);
>>> -    struct xe_drm_ras *ras = &xe->ras;
>>> +    struct xe_drm_ras *ras = &xe->ras.nl_data;
>>>       struct xe_drm_ras_counter *info = ras->info[severity];
>>>       unsigned long flags, err_src;
>>>       u32 err_bit;
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 648e46df831d..b5b0c1a3a663 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -1126,19 +1126,18 @@ void xe_ras_init(struct xe_device *xe)
>>>   {
>>>       int ret;
>>> -    /*
>>> -     * TODO: Replace platform check with xe- 
>>> >info.has_disable_vram_page_offline
>>> -     * once the feature flag is plumbed through device info.
>>> -     */
>>> -    if (xe->info.platform == XE_CRESCENTISLAND)
>>> -        xe->ras.disable_vram_page_offline =
>>> - xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe- >drm.dev));
>>> -
>>>       xe_drm_ras_init(xe);
>>>       if (!xe->info.has_sysctrl)
>>>           return;
>>
>> I believe has_sysctrl is currently enabled only for CRI. Is it 
>> possible that future platforms will support sysctrl but not VRAM page 
>> offlining? If so, it would be better to have a separate device-info 
>> flag for that, or at least keep a TODO here.

Currently sysctrl is supported only in CRI.  Yeah the TODO added by 
Tejas in his series has been retained.
We can replace it with a device info flag if we have a case where page 
offlining is not supported in future.


>>
>>> +    /*
>>> +     * TODO: Replace platform check with xe- 
>>> >info.has_disable_vram_page_offline
>>> +     * once the feature flag is plumbed through device info.
>>> +     */
>>> +    xe->ras.state.disable_page_offline =
>>> + xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe- >drm.dev));
>>> +
>>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>>           ras_usp_aer_init(xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> index 0b8669f28d56..6e65443cd262 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_RAS_H_
>>>   #include <linux/types.h>
>>> +#include "xe_device_types.h"
>>
>> No, please. Let's not bring this dependency here. Move the function 
>> definition to xe_ras.c.
>
> Seems next patch also adding xe_ras_get_max_pages as inlined. I am Ok 
> with #include "xe_device_types.h".

It is better to use a abstracted function instead of directly accessing 
in the xe_ttm layer.
I can move both to xe_ras.c if this is not okay.

Thanks
Riana


>
>>
>>>   #include "xe_ras_types.h"
>>>   struct xe_device;
>>> @@ -21,4 +22,9 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 
>>> severity, u8 component, u32 th
>>>   void xe_ras_init(struct xe_device *xe);
>>>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>>> *xe);
>>> +static inline bool xe_ras_get_disable_page_offline(struct xe_device 
>>> *xe)
>>> +{
>>> +    return xe->ras.state.disable_page_offline;
>>> +}
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>>> xe_ras_types.h
>>> index 7bfd86c9d135..ca459e785add 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -414,4 +414,14 @@ struct xe_ras_set_health_response {
>>>       /** @reserved1: Reserved for future use */
>>>       u32 reserved1[2];
>>>   } __packed;
>>> +
>>> +/* Device structures */
>>> +
>>> +/**
>>> + * struct xe_ras_state - RAS device and firmware state
>>> + */
>>> +struct xe_ras_state {
>>> +    /** @disable_page_offline: cached configfs policy, immutable 
>>> after init */
>>> +    bool disable_page_offline;
>>> +};
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/ 
>>> xe/xe_ttm_vram_mgr.c
>>> index 9a514d983e90..2c4722a956a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -24,6 +24,7 @@
>>>   #include "xe_mmio.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_printk.h"
>>> +#include "xe_ras.h"
>>>   #include "xe_res_cursor.h"
>>>   #include "xe_ttm_stolen_mgr.h"
>>>   #include "xe_ttm_vram_mgr.h"
>>> @@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct 
>>> xe_device *xe, u64 addr)
>>>       vram_mgr = &vr->ttm;
>>>       mm = &vram_mgr->mm;
>>> -    if (xe->ras.disable_vram_page_offline) {
>>> +    if (xe_ras_get_disable_page_offline(xe)) {
>>>           xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>>>                  addr);
>>>           return -EOPNOTSUPP;
>>
>
