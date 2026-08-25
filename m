Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4421EC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449410E8F0;
	Tue, 25 Aug 2026 07:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTEpHRul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7910E817
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787643373; x=1819179373;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UZ1ZCE2fMHVIL9d43b/zyyGlS0VTWfspcTq7Bse7Gbo=;
 b=fTEpHRulKhANwPZYe4d0lemMCV2XvizyaQehcHxvbbR3Tpd5jDqxRhc+
 U8iV7kMrQRV7LHz32a0E3u3hROxTk+GpS2FHZwi5pbr+aTw5BiY5K6ILq
 Y5JDA386iHXe/liRONjrR6gHwbhfxqpChlfk7nj+WvrqPJ4Fum5wsuvza
 +yKxXZokrmBfSRn/LTxlZX+0ygsnHe7MwAlIneQ3sDQmBOOhrRCb/o33a
 FNX+yBGeNLmoJtoz0esQIEH1LRqmqY8mKcKUBgS3lNQSHCbx3Nrth9kjs
 sQcZKHBHVy39o0jEX0X0cEeCP+tjfdqRtoPuPqCa1Ea8+rS+oJRyllmbe A==;
X-CSE-ConnectionGUID: ooLAUb/rSgOz1C7kRzSjHg==
X-CSE-MsgGUID: LIMCeD6ES3icj+TMcPL2zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88120056"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88120056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:36:12 -0700
X-CSE-ConnectionGUID: tVR519F0TgmEXsdAv2RFfA==
X-CSE-MsgGUID: dwbuO+6QQ7KtRO4kZd1k+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="297122463"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:36:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:36:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:36:09 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE0DM/wLKlckjmvalvlbxtCbFVC9MHlE2UzOrIuOO6VfjONir2n5b1MQ3Q3nFv/Z7EFpiG0yw56b7/7Nz40x6WZkXEhygrXv7OBGpYjK7UNd7ntQdngbfAMjcWryScEm7nDM+aOof7w0LbMe3ZM4NDVMBW98yb8k8MRnCAog3yCWusG+/riNqxCC0OKlN8xaZJ/p3DyM6Eu4lIp0Z64GUOwCnQQaZYWxjTlf0EmccgeHpLbtSkJkI87b1fKbUEYlnrwxujpCpT3vj8ZW5lMWi2rpjkTZEF5M3gbmLcr99TILuvt0RANHZ8Sk74cdquT6xHv8uCRGAvi1kea34qXkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ow3jYdIc4PeTOVeQTAa6iB657aR17dnHZ7m1ADyjnM=;
 b=MXEGro8EBpV2iCO4gUVdkJ3vxfgekGyM2dVoCB6zL9fuyc7752UAteTCJ4YSmr5avhF0Mnwjybu+vD8bW2x4UwfuKGZRPv/vcgTGHHzlL5zDju8qe6vwnLvr0eD0p/8gSna0JbENN4/sIzY8gjJS2aEiuLQNqJRFF6wNGJpHjdEGcpMOPq3rGNUzeIOZhjtWMI71PXvFyKSyLCBwFjsIK8xWsVOYIrHzMMp5uJ+CyhbH80xuwbfii9t8IGvmWa/yeFZeJCpQIiMs7RDoR9YeW7F8ftrJJ2qDFNJAWAj49Y31N5CU1OAih+8+4UbDI5h0/Ujcg7delH+mwYMJpi1xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Tue, 25 Aug 2026 07:36:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 07:36:02 +0000
Message-ID: <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
Date: Tue, 25 Aug 2026 13:05:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 310b66b0-c317-4919-e3d7-08df027b8388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: Ot9UMy/Ay209gs0fPUPXJO84n9aL7ymdERRXeb4RKLAV3qf9VCdk3ORKZYJyxJoLzqoHMdA9NIlW5CepCabXqhr+5smjhROO0+biAdCTCM3Qi/IOP0g4H6Q6v8roOqrFAx9m8bW4mbkZLuG4NhrTluh6DniT3mmaYr3wgsww3maGPs6tsL2Dw9RJ6yt6qZSsRK3OYulobTWSdCZZtMYGUH2cNiQBddj3izyjFFTmklRd3LsSKgVkw6/CL5j8Kyg7dQtPuNBtDKWHRr5qlf88AeoQiFsW/g4B/pTrdz/umo4+lCJ2fMfyQlrvCfui/hpNtkGff0iouwkSksybbhdA6LoySlC9xMUuXhVcHEDgntS7cp2ra0U8ZL/LjK6PNaZpQRc5R3LU1Qii35G5Q8VzYyCvnrQCThmlYdLZry+HjiJ9jjA77PeXJVSR9D/mQQTb4zf7kic9WuwpX66S4SDl1xwwPXzHxFtuAnKOqUrcheaD21RDMFSuHKwpeY1d/Gk75bEQf7vfpVEV3Z7c+95VaaEfDIvSVAVtNLDSSqP69zvLkbFPfDFTU1TN9cETG/BBU06P0h18XF5UBexJeDItqyIvUolITVzHePTQt8h5hffCbTQS5+RkkuwOP9raLB7SBWvQ0xnp6KbPhNCoIpd+XZXRSBatoXF6+borYyTdjUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWI3R0NrMU81TEJDOHI4SmFCcS9xRDdHUmhZWVZrcnpldGszQ09KbUhIblhr?=
 =?utf-8?B?dnJYYlNKKzNtUEFzNXZpdnRaRGxEakMxbjM1d0tRZHdQRWFGQXVsTlZiUXIy?=
 =?utf-8?B?cWxUM1lFVEJyT0U4SEpoZ2F2UnRYakxTZFJZUDM5cWo3eG1RMDFpR2tsbEpu?=
 =?utf-8?B?WU4yS2hYOTVaYysyUnlvTitHcmV6YjhEV2RDSzdNOWJLdWREZjVIUnJjZkZk?=
 =?utf-8?B?NlJES0x0SEJuOXVDbjFsbGVrUWw5ZGJZRzM3REpVS2JoekplK2pTVkFBVzlR?=
 =?utf-8?B?QmQ0L3NtNUw3QW5nYnN1TTh2cktUVmdnOFNzU25kMnMwVytTM1AxNXVqM0pO?=
 =?utf-8?B?M2RMdEJpM1ZES1JGZ2x5S0swRUdHQWo3eDZTelR2bEhuZ3R1cGtnY3UyWDFV?=
 =?utf-8?B?N3JFRGt4ZkM3U2V5ZGRNQnBKZ3NNeDZ2NllqdFVISmlIbUR3cDRqaWxDSXFY?=
 =?utf-8?B?ODcxSHNsT0RseVAxSlV6TThGUks2b2NCNkdLQVk1d1FYa0dHdFNvVnNWQld3?=
 =?utf-8?B?M3I4SGdDNm1Ob0N5NzMrWEJkdldnUVBURnU4Y1ZXWDFqZ2ZGVVA3RXpDS0dT?=
 =?utf-8?B?K2tmdG1oSmlWZzNEN01xeTg5WER2d1Z1M3FGZXp3OFA2TjQvVmNJclgwWXUz?=
 =?utf-8?B?cEZlVHF6QlJOM2QyVk9ha3pTOUExWEkySHVIalZTbHJueHVHV2NQTUNyL2FG?=
 =?utf-8?B?T3BpeVFlWHNWUzlZaWZQeHEwSitoaHQxQm40cThMNjlObXhHRXZUU0oyUEN6?=
 =?utf-8?B?WXRTQWwwY1dyZllONlh5ekcrcnpVbUtNa3ZnbHdKRUFwakwwbDl6VWJUZ0tn?=
 =?utf-8?B?STB1TXRwQVZSZ09BYVE0L3M0V2ZmcjFma3BMTTBIZGczSW55Qm4wYWttWXlj?=
 =?utf-8?B?Q3MyY1lIY1hJNFQ4V2puUWFoUmMwL294clpqVEVDUDhNR1JDSEVoRk5iVXY5?=
 =?utf-8?B?RXpwRlZJY0trS09ZWi92NmtFMnFOdjRQeEZmZjRHYlpONnpMY28vYUlDUTJZ?=
 =?utf-8?B?d28vNWQzU0dRalQyek05QW45dThOUjNoYk5kUUJDUTdiaFVhb2RjK3A5cFdU?=
 =?utf-8?B?ZTA5Q2I2SEtRMldzTUpCZXVtZGhTSHJFSWszeVVBTkZnOGhwYWZ3Qm5KbmhJ?=
 =?utf-8?B?SXkwNWhDbFNrQ0w4WXluY1VSYWllWjd3UndqVnNjcjJadVp3bi9MUjVzSWhI?=
 =?utf-8?B?SDlRejdFUFdGOVdNQVdCZVhtNjlXMjFzTFZHbzNnOVR5eUc1dURoKzMvZUxQ?=
 =?utf-8?B?OGduWkJJWm5RaG5HNHFsRm9CL1Erb0dsbGFCZ2FaV3VPR3l2SjlPb3dUanZV?=
 =?utf-8?B?aUdwVThHN0JFU2RNLzBEbUVMb0FYNHZrR280Slk0WU0wSGRIMEVKU0dOTnly?=
 =?utf-8?B?ZkRtbkI2VE1DZlhsVlA5TTV1VkdydDlucGZNWlFXVzI2UldOd2loVmpaTys2?=
 =?utf-8?B?ZWdDbnJ2UDNKRTc4RE1rNmVuazNMWVpBcEt6UkQ0aW10OW1NQ0xsU2UxQXE1?=
 =?utf-8?B?QUVoRmZPbUs5bGxmZGVMYTViQWVISVJHK2N2VVB3RDVtWFMrVDF2amVZQkhY?=
 =?utf-8?B?RUV3bWhZTVU0eW14VitjZ0N5bWR0NGdWMlBsM05iK20wRnRGNFN6Uk1qaE5p?=
 =?utf-8?B?MWp3Wm9nU252dEw0RnMySXd0U3FjdkVNeGpxOFVuZmJ0ZlFoUlc1S3J2SVhP?=
 =?utf-8?B?WHRvWHYwMEpRM1Z6b0krNCtxYkptaEZQbXFCYVBnQWNNelo5eE1RNFRIVWUz?=
 =?utf-8?B?VDdEVEdKMjdjNHg3c1pLMk9WM0hLRGp0cnY1NVVxaCttaEhMaTJ2YnljajdV?=
 =?utf-8?B?RDlaeDgycERLWUlkR0xwUjM1SzBldHFrZzF4Y0F3WFF0NFV2OVhTSkpPMDc2?=
 =?utf-8?B?NnEvSkExSXVua3FwT3VpOE1Qc0IzYVpJNm1ZeHptTzVXbTZSeGhRd0RqdGdJ?=
 =?utf-8?B?UjdmdndPL21BSW1ueDhjUDJZZFkxN3lsSmlSN2RFM3N4Wkw2YWlwMFRkT214?=
 =?utf-8?B?YW1GNDBlYjhPdDF5Zmhadi83dHFQOUJqaDdtamFsbWhhRmEzdEV3WWg4NFlv?=
 =?utf-8?B?YTlLYm10U3hvM2VOZU1TTUtWYjROeWhOTUp5Y0I5dmEvL3hhOFNRUllocGRM?=
 =?utf-8?B?WXhkQkZ3cjVXcEdBRE1mbHZVTkZIcU1wcGovVUpOVjdreUJNdHZDOVhaUWN4?=
 =?utf-8?B?aHRvQ1dvK0Z5TzBSQWhubHBoK3VBY2paVG14dlltNDNHRkVpQXNJQkZLaXZr?=
 =?utf-8?B?VHM0K3hmSW5ka3V1RE96blhOYzR0WloxVEY3cGRZZVlpOTJpdHBnZEN4M1JK?=
 =?utf-8?B?MzZsMVV1WFlWeFdiemR3T0R1M0txNFBOaDVBMlBuWERMTTB0aFZwQT09?=
X-Exchange-RoutingPolicyChecked: h/s9m6oY4rDF1pVVn8H4VUWiyflYkYOEuEYeAqmcb3DMT62rJtN6G94SMhyc+MA0ILNwM/u3lXoZh7w+QGZX64iJBi6bUmJl1itJI6cHtanPAiPTVsrS+3ZGg3uoN2Hmc3pEKnOYUOFVCFP3QU53V3pn5GtfAdvmsOtO5Mb3S/O9rwuIIVpwNLpUiqOJu2tm7ecXGYELgGugtuH15tXJ8TLX1ztv8NKNLdCsjDvHZr7k2dOyxV0RToetsDD48FjyoBmSq8ByquW4uGqLMian4xC5RSvYyp8pccarEqVYkmzhX3XiCCya9ijV9/Ls+PHOIU98ITnApsVkne3EGNHYTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 310b66b0-c317-4919-e3d7-08df027b8388
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:36:02.2426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeW1uPhw3FX4EUqwjOAroSoCzoWudneKCp5x/EhM4J4mSMujBga1U4VigtCOGn/gPZQkiKNzcPpMOZ5+4Mm84g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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


On 24-08-2026 16:34, Michal Wajdeczko wrote:
>
> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>> Hi Mallesh/Michal
>>
>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>> and update callers to use xe_log_err() with the propagated error code.
>> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
>> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
>> Am i missing something?
> from "How to pick a SIGID (the uniqueness rule)"
>
>   * A single underlying failure therefore legitimately produces a
>   * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>   * follow a fault from origin to final effect; it is not a duplicate.
>
> so in this case, some sysctrl timeout may eventually lead to a reset and/or
> wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
> help in any postmortem triage, and if we don't reach that final state then
> we can still provide some generic resolution based on site and errno (COLLECT)

What if the paths are also used in non-critical scenarios for ex: 
sysctrl commands are used for
general counter telemetry, gpu health querying and firmware status.
Wouldn't this be lead to a lot of sigids in dmesg in case of some 
unrelated failure ..
Why not only add sigid for critical paths when we are sure it will cause 
a chain of failure
instead of these prints on every trivial command failure.

Thanks
Riana

>
>> How do these errors indicate the need for a resolution.
>> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
>>
>> Thanks
>> Riana
>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> @@ -11,6 +11,7 @@
>>>      #include "regs/xe_sysctrl_regs.h"
>>>    #include "xe_device.h"
>>> +#include "xe_log.h"
>>>    #include "xe_mmio.h"
>>>    #include "xe_pm.h"
>>>    #include "xe_printk.h"
>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>> -                   unsigned int timeout_ms)
>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>> +                  unsigned int timeout_ms)
>>>    {
>>> -    int ret;
>>> -
>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>                     timeout_ms * 1000, NULL, false);
>>> -
>>> -    return ret == 0;
>>>    }
>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>        struct xe_device *xe = sc_to_xe(sc);
>>>        u32 ctrl_reg, total_frames, frame;
>>>        size_t bytes_sent, frame_size;
>>> +    int ret;
>>>          total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>>    -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>> -        return -EBUSY;
>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>> +    if (ret) {
>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>> +        return ret;
>>>        }
>>>          sc->phase_bit ^= 1;
>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>    -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>> +        if (ret) {
>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>>                sc->phase_bit = 0;
>>> -            return -ETIMEDOUT;
>>> +            return ret;
>>>            }
>>>              bytes_sent += frame_size;
