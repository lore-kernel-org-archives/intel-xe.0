Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4348606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5E+i8WF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7FA10E114;
	Wed, 11 Nov 2026 04:47:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED8310E114
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794372435; x=1825908435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vfSQH2Zgp0jt+juUJts8O35NdQiIsnzRNg2NY6AVdGU=;
 b=T5E+i8WFA/AjdNhy4A3nPbY+OmmVhTYCM81o9Ian7fokcANoVTYmQVfZ
 YVmXVpuacz5v9msbJN1kubTtMXL4PJcrwV0b4Ks/GCh99epxpmfSra8gG
 BBIY+YfBplSci0wSIGvJ6Vs3N8oW4p0BxVJMe6ci3ClGJSf6P86ww9/ss
 wgMSc8uSrmg4V8sPYGEqgfNypqj2CHsYZI2viLZWsvYGdMMP1Rh8QDmP8
 vZdrYD8aCWMtglfpqRJO4jPIIjZBdG7ouuI47GY+T14AcM3LZPkn8FoCc
 7ovGzL0pIKildyX4je/PdjWQH1MXIbRDC2P8omqBYhSUCaCpCySxz+Zsf A==;
X-CSE-ConnectionGUID: 3capZ15GTkSM9J8bnYOwQA==
X-CSE-MsgGUID: zhM0J9KDR8ydpTu5gYdDOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3037372"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3037372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:47:14 -0800
X-CSE-ConnectionGUID: uWMG7pTDSt+EFW+xplgzww==
X-CSE-MsgGUID: hFBVS5R+Rx6fjihue1GN/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8495589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:47:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:47:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:47:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:47:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uclcKypUNj34DhGHHNBYeKwVpgL1vK6UWIdgryzQ1E2K7WRp9Zm0C2sfwtvm9VGhC7pLtpSz7UDjc+c9mingyhVDatDJRP60SncwGxdeaFt42jO7UfOwlQ8gd5y4OBKiTDMERvAmrePuctCUw33O59V9SKxJvWfbPOi0RaQZuyCItjZt1G0YHYD6N6/WiUneo6kExZ1EU34JKd8v3zFppZxMkqunYdsHcBk6B9lk5nxh+cTDGtddb5lKvBQoIWKxH8LUq0xkt2gv5JNxuwhaN0GqwaISNrK5g6E4lwx0GnIGJU0+Ojnkpw584Rpmn/ZsOgdx6r/kZiM5sSOZ3cstsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncAylPaEVWp/oNt+cqJgHB6Arz8jp1PI1inQ50r01aQ=;
 b=BHOT1iKpakggrDnY2e68DEyuzlMJRkWx5ePfdN35SyyiIKq2WC1aC5b87NhYaAaifOIInhlgVc0OEG0vZAPyxlWhQix9kp8hgdg62uv2EmPhhbqRhFNgVO92cwRHP495+vCi/C46TZ1xWv2gjmMPzF9Hsi9wE+Gu6w99BBu9faUVUurZDMAFLWrHSbrncj8cISEu8flk5fdxeO6AlCGVMPo1f7NKCEcTddDWXi062WtL+fdlwEu6hC2AULESGU2UxvEfyvakgyambmPxrFrNznmjbjC3eeiDcdDu6JNKNv8rb3j3kaDSeVeiksJ0EctuPd2eTrEGVug6gk9jhNPRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB284137.namprd11.prod.outlook.com (2603:10b6:8:52b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 04:47:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:47:06 +0000
Message-ID: <21bec691-9ef8-4fc9-b439-fcf656289662@intel.com>
Date: Wed, 11 Nov 2026 10:17:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/xe_ras: Add a flag for uncorrectable
 internal error
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-16-riana.tauro@intel.com>
 <avMXGQAqNCmX3rqO@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avMXGQAqNCmX3rqO@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB284137:EE_
X-MS-Office365-Filtering-Correlation-Id: f14b7302-626d-44e6-77b4-08df3faed645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|261026121527099003|11063799006|261026140227099003|56012099006|261102123227099003|261009223027099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261009221227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: d7ZYnomxUY4vuz1bAE5FClLlaiCTu6oXlCpVaS6McEf2uvOUzbrswOvgk2DGIoLE6O1fxCPHJTrK6qTXhjYhOjMkSGAtmVFdQP+x7ULPRJWSQVqa+INpjDROs9I2zM5s284bbcmYUgIQB5csp8gPpuXUZkXF07ZikG98MLMxzRh/6hzdxaY8y52xFcJnUlKwUnQc196VqhYxNmaAPqRErulx0IOCbYlYQd57d9uVZ5vrgwLjHTvcUIG+OoPHM+5oE+S9MdSB+spq/idKI0TTFOB69R/mDzseFKYbFxq0kkhqUFjoAmxS7mR40FpKlLXGYmu4zV7CVVl5aUrsJd6H6kkiMzyXEgyEPq9ofpEaIhYaaPGBSgWs5I+OAmTWX0CC3ezB3idhK6C6KKAQE5SJZzsndwgI7ogl9EkJa73nE+Y9CStZKaYeL6bNBR/g0CX3HW7Onhl6YPIOyeQjGy6dhu8DvruUiRsWizmFzwi4sZHhupiuyUlBdHEDwOHO2LjFj8AyxY0vHzoKxcUo9DXlfZGvCqh9pk1c1Pfm++8WNaqTd+qAVLhERyF4qTbwqokH2tF2NB+KUhSLAdYVzRfDF4kaI4hRTkVxeLlAWJfGIvPxPVqAcNJGhv4cFxcGPFqqQYEA48nNtJxCoZ3bmkRviVWhc+Zq1AK+FCvtknsWOj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(261026121527099003)(11063799006)(261026140227099003)(56012099006)(261102123227099003)(261009223027099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009221227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVTN1V3U2ZSYWVVU1Q5V1E5blA0VTFkWGdOcHgwNk9oZnZDRWZ1NnlKeGhC?=
 =?utf-8?B?WHl4bEZWM1VnRGcxaCtKcndHK2tlL1pzdmdZaUY4Wk45WkRRUThrSFpDVFFI?=
 =?utf-8?B?Ukt5TjVsaHFaYjR5d0N4RjVQRkxpbExpeXVZekRFWjJyVmQvcVZHdGYvTzQx?=
 =?utf-8?B?N0dJNTBXVDFBeXRnV1A3V3VCOXZ6M01UMWpHcUNCUnI0ZXdYNlZ1bndtL2Zh?=
 =?utf-8?B?ZUpNcXhVQmVKUm4xRkJsZ3ZmUFBXRHhCeVo3cFNndHY5VndhU2FPaGdaaUFj?=
 =?utf-8?B?TWVONS95UGRIWitySGpEZkhlcWJTcml6UkJjU01CRGVPRGRXVS9LY3ZkM2N5?=
 =?utf-8?B?aTcwOXNiNGtka3YwYVFaZVl3Rit4cFJHSit6NHFjUnRFMVB3YXJ6TVoxYXJp?=
 =?utf-8?B?cjJSSHVqdUpURWNOdG1tSVo1K3pQK1hZL29LTUd0UkVDODJhdGM0RDB2OXgv?=
 =?utf-8?B?NC9tVlZpQ1NMQWxJNDJwVnFlTmZuejUzUmJXZXk4dDZKZ1NSRlhhdWdKUmxu?=
 =?utf-8?B?NElrMDFESCtpdmFNK1g1K2lIK1JnWklQdncwanJWRnllV1hXUHExdFBNNnYy?=
 =?utf-8?B?N3JRTnl0SXIxNS8zdDFGeDhENVdwSTdpemo5cnVJRjU1cjlEN1kxYXRDdGdx?=
 =?utf-8?B?OHpLbjF4dU94WjFuU2pmd2dOL3Y5eWJjSTZRbFZ0MDdQSjFrb0JDM3BKNEJM?=
 =?utf-8?B?Q0dNTmcvMFcvQTIwVFp2OTA5a3l4bHVmVkU3dk9ueVFpM2NKNFVoOHErd0Yz?=
 =?utf-8?B?L0JMZm9DZTVzc2YwZWJWTTROeEZNNmh4MjRSeXQ3cXlsdnoxVEdNMkRlUlV0?=
 =?utf-8?B?MWMyMVV1cmxJNTh5WW9yN2pmT3hibDRST1k2Vys5cTFFTTFHN0l4bFJubDE3?=
 =?utf-8?B?Rko4dEtad0ZBclVWTGt0VGVkNE1xekxrWUQwZkhTdUVJdUg0OHhoanZORHI0?=
 =?utf-8?B?VE9wbk53ZU10R2hza0JHcnJIYWR4M3l1VFdLUVZ1WjdWY003bmpnSnBqK3JR?=
 =?utf-8?B?RXFPaHRpWVNhNXdHcTlidDFzTWtzM2tQVmE3VStFazJsekh1UXdnUUVESmk3?=
 =?utf-8?B?TEcyaGJWODIwbm5xLzM2dGF6Zmp1NldYcGpRMjczQ3dSek41S0RWaVdaWkJW?=
 =?utf-8?B?T2Q1TEsyTkpqZ3JZNTlDQ2g0SW9nSkxvU1lFdlI1aHlENlRvWlJkU3EvRmFY?=
 =?utf-8?B?Q3FkT1dwNFFueEQ2bVJxQXN3Z0psNmY3cWR3WldVZUxyMGhCeThZeDdRMjVh?=
 =?utf-8?B?TU95Z2FjVk9ROW1DOXJOSmFvbHNDRDBtc1JWZ1VUK3lMKzNKVE9XL0dyd3E4?=
 =?utf-8?B?NTVKUy8yVzRqVEU1c0VzZ1Jhb0oxd1k0ZVdmREpMN0hCbStIY3BpVmMrNHBp?=
 =?utf-8?B?WkkrSmlBWFROelFLeE00VlZwU3Y5RURYODY1eGg5SEtUT2xaWHU4LzRPMzZk?=
 =?utf-8?B?aDRSN1pURkthK0dDVlEzNHpIc2hMaEhSdlljZU9uanFlY0lFNzFyMXZLWDNV?=
 =?utf-8?B?eHFVTkJhOVZDVjdEd0pnejBVMWRzZGZaWXAwQWR4dEVwOXVTQVl4NXR3NGV0?=
 =?utf-8?B?cldIZzdNZFRVUmZlZW5UUGZGeW1iemlHNmt4MXdXZUxnaWtESzVBaXpqdFlh?=
 =?utf-8?B?bDZvZTAycXhLTzg1YUlXb3lmYmNlOFp5RTBOQU1Uall5c0ZUM2RaN2pUOW5Y?=
 =?utf-8?B?Y0Y3MTBZVUo5QmdpY1BXdC9uNXR6MUJwUExmOHJocDRMRVhpeGJHVjJ6WmV4?=
 =?utf-8?B?dHNuWGxWYTczbG9rcUNHTUZsYzBaTjhEWlpKbytNcTFSd0FOTTRMcDRYWWpJ?=
 =?utf-8?B?MllNeGI3ZWMxalB6ZTU0REo4MFBCTTJYU3JaRTBja2VyZDNmUDBqMldRVy96?=
 =?utf-8?B?anZmcmUrVjNGYlQyZmM3bk11MmxGalBMMlRKS2V6eVFrcnQvakFxcjBKaW1B?=
 =?utf-8?B?aURBbGZHTmYxRkNyUWlCUTZRMURxd1RObXRzb0xrZG5VQUJxRDdIRnNid0l2?=
 =?utf-8?B?T2RsaTduQVpmSWNuQmg2VW52UXY3TFIxMy9INndUVzhBa3Q2ZS95NkdJQUVX?=
 =?utf-8?B?TThib1BCTGZHN05SWWFWYkQ3bzExM2VrN1l0Tk1XNVp3TWM2UjNDaUlwdHlz?=
 =?utf-8?B?MFVkNVF0S0UxMzIxUFQ2VjlqNCttRjZvUlJXSWxwL1hEVlZ2MEpqR05kaWJE?=
 =?utf-8?B?UDc5aU1tYlZIZlpMYkVHNE9KeC9NbDVoR0YwQWp1OGJHcEpoTjVpb0FaclVx?=
 =?utf-8?B?WitQL2w5amVWNlg3S09lRVd1aVU3OHMwa0loQzR3RDVHRnoxWmdmbmEwaTla?=
 =?utf-8?B?S3BnVzI3eEViUlY3SDhNaDd1NEZJMEptU3REcHgwWk1Gc2NhcmtDdz09?=
X-Exchange-RoutingPolicyChecked: c9coiKs7c555q0NCu8luQQDnSdY+GgRvCWwI+hFtDD8WzzwhfcznTmWlx9p1QUUEdIJ0Ov22fCn+At4l2qW3dI3P9WB5Yauq5HNij4MyPJ1GbRVBqTptduFEzsMmyAk4rZ17dpEmYqNilVZ+pmcB6zwTId5aibaRQUeNsR2xwcAH0AGkpnccz6yKnCD/FuMYLNS43W/OYARAsmbVuqyzwTyPzekKuYZrCvQrqAF1WOFgJoojMTNviTbVC/snjn/YOzPWo10x1iBIX7Y/dmDYlw2tNjqiR2I87i55TLvL8tx27PwrnvWZNooymKnR9xxsAZTOfPyc3eVQbokh2oeJJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f14b7302-626d-44e6-77b4-08df3faed645
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:47:06.6927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZMToELf/hc8jeamz7B/ZKqQEA5M+PX3LCRXSvWZ5lJHU8bxhCXQKvnn4Fbm0k7LtR4BxWVAMMWWIfGGsY8MqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB284137
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


On 10-11-2026 18:37, Raag Jadav wrote:
> On Fri, Nov 06, 2026 at 12:49:51PM +0530, Riana Tauro wrote:
>> Introduce a flag with get/set accessors to record when an
>> uncorrectable internal error was reported via AER.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2: add PCI_POSSIBLE_ERROR
>>      fix kernel-doc
>>      rename aer_path to internal error
>> ---
>>   drivers/gpu/drm/xe/xe_pci_error.c | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |  2 ++
>>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>>   4 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 03a9f295d077..472b85d0ccc3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -55,6 +55,29 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
>>   	}
>>   }
>>   
>> +static bool is_aer_internal_error(struct pci_dev *pdev)
>> +{
>> +	struct pci_dev *usp;
>> +	u16 aer_cap;
>> +	u32 status;
>> +
>> +	usp = xe_pci_get_usp_dev(pdev);
>> +	if (!usp)
>> +		return false;
>> +
>> +	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
>> +	if (!aer_cap) {
>> +		dev_warn_once(&usp->dev, "AER capability unavailable\n");
>> +		return false;
>> +	}
>> +
>> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
> What clears this register? Does this guarantee atomicity with the writer?

We are not setting any register. This is a read so we don't need native 
AER support.
This is cleared by PCI core once recovery is complete

Riana

> Also, should you be doing this without native AER support?
>
> Raag
>
>> +	if (PCI_POSSIBLE_ERROR(status))
>> +		return false;
>> +
>> +	return status & PCI_ERR_UNC_INTN;
>> +}
>> +
>>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> @@ -68,6 +91,9 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>>   		return PCI_ERS_RESULT_DISCONNECT;
>>   
>> +	if (is_aer_internal_error(pdev))
>> +		xe_ras_set_aer_internal_error(xe);
>> +
>>   	switch (state) {
>>   	case pci_channel_io_normal:
>>   		return PCI_ERS_RESULT_CAN_RECOVER;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 3aea4969af13..58a0b5fa676d 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1253,6 +1253,26 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>>   	return xe->ras.state.max_pages;
>>   }
>>   
>> +/**
>> + * xe_ras_is_aer_internal_error() - Check if an uncorrectable internal error was reported via AER
>> + * @xe: xe device instance
>> + *
>> + * Return: true if an uncorrectable internal error was reported via AER, false otherwise.
>> + */
>> +bool xe_ras_is_aer_internal_error(struct xe_device *xe)
>> +{
>> +	return xe->ras.state.aer_internal_error;
>> +}
>> +
>> +/**
>> + * xe_ras_set_aer_internal_error() - Set if an uncorrectable internal error is reported via AER
>> + * @xe: xe device instance
>> + */
>> +void xe_ras_set_aer_internal_error(struct xe_device *xe)
>> +{
>> +	xe->ras.state.aer_internal_error = true;
>> +}
>> +
>>   /**
>>    * xe_ras_init - Initialize Xe RAS
>>    * @xe: xe device instance
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index c44fa172011f..f7b587ac84e3 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>>   int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>>   				struct xe_ras_get_counter_response *response);
>> +bool xe_ras_is_aer_internal_error(struct xe_device *xe);
>> +void xe_ras_set_aer_internal_error(struct xe_device *xe);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index a86f9d2b8c92..0ff5803d495b 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
>>    * struct xe_ras_state - RAS device and firmware state
>>    */
>>   struct xe_ras_state {
>> +	/** @aer_internal_error: true if an uncorrectable internal error was reported via AER */
>> +	bool aer_internal_error;
>>   	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
>>   	bool disable_vram_page_offline;
>>   	/** @max_pages: Total number of pages that can be stored by firmware */
>> -- 
>> 2.47.1
>>
