Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C42F8FA90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0E10E8DF;
	Tue, 21 Apr 2026 15:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlgaS5HV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B50C10E8F2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776786297; x=1808322297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6T+zL4p4hsK658HYLRIYw/qUU/TiKHKSghT/Gmep5Vc=;
 b=ZlgaS5HV+pREVhRRfLBZR2iofgNwWnjpA63KRgBuokXZB6MpNBU4y14x
 39izcjAM65Wvds9Zzpdb7VSQWLcB6h8eM6ljalH9npqWZ27JrFCn1K5gH
 81c91TNoqJHMmZlHRX2Z/2Pz2cuariVXIJ+tnyLtPLegIqoIi4bE+yNCR
 dHzAsm5Vfmt0gN+spC/kKEQpM7NqL/DGKy5U07qfwrzWQ5rZQ57acDHoS
 kwL7xg8gssistieLgzCtNAybb1kL6uhS5E4FS5oV8XGf7fu1FIT/9zSBh
 cnXYZVUoLAozUmVdlO292MnzySjeB468YtNw6UeDzHmhb5iNkG6iYdg0j w==;
X-CSE-ConnectionGUID: X6OHOuQeQtWMZIov8vw/jQ==
X-CSE-MsgGUID: r5aejQnySOy+kWsZh/erXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65258084"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="65258084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:44:56 -0700
X-CSE-ConnectionGUID: Js2hv0yyS42CHGtltTsP1Q==
X-CSE-MsgGUID: uJlCRyc7ThWM6i1+nGOOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="255326541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:44:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:44:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 08:44:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 08:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO1yK3chkeP3ujfqKFOzzmQfQZNnYX2OktOlD1XJAQxQGF24gKlcZ5IdN5F6QsyJediL9LAWVXLnMG96CHqqDnoG0PK++I+HYGtIvHrLsGSQK/uHtQ1xjcK6ex2POnaRGjEusvNyL3ro2dE+UiYO1AjNFfg+KJuHqm2u/KU56usMMii2u5dlnarCeyHtoHUSB8rCQYesTeJTCI1cM8YwXwP31vy3i8Ozm1C+LJl0GXeymSTzhA3FO4EnPICDa9F+qxYyOsOiyR14B43pslfTd7a97NZLpPyDtNU4x8Lq3MWKkbMK4slWcXfMOXtGQA4AoLU4SHjtsR817LbFBGw/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALipirTAALWkknU3o8VyilF+57Jn+ZHbGaTnZ9CQrok=;
 b=gdCSyvny1o1ZC6asdjZpaClnEUPyUEe6ujXln95uwRBwnDyh7/Gs6LRZLK+ybqJw39SqlBC3b34WGn1Je4Tt5VaI0LVTqHs9l88J+TgcAYmfBtG2vF4d31vh2+Mq8V4/s10lxgAWsSLffQnok2ihV3eJZXFriyFZCnq1TaAo8Fn3YNF+xYRqE81KMyjtj1oLol34rKxV/BShtXMgbo5iBTyEKkBvuNHjwMeD+e/AKkQeu1livLu4/UZsLBAFTf/q6BGbyAhzh6GyNaV/MDu++tHNZJENUy/vfaQQt+7Ytsb2tMbExtzmaL3qFUSqMlY+NlxnD2jHK4htYbnR9tcXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS4PPFA92F35354.namprd11.prod.outlook.com (2603:10b6:f:fc02::44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:44:50 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 15:44:50 +0000
Message-ID: <9bc30d5a-06ac-45db-a797-68f2b9c96722@intel.com>
Date: Tue, 21 Apr 2026 21:14:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20260420112925.1379274-2-sk.anirban@intel.com>
 <ced90e9252d7bed413b9c61d2f8495af72941bf7.camel@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <ced90e9252d7bed413b9c61d2f8495af72941bf7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::8) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: 107044a3-00fd-4d7a-d2b6-08de9fbcec23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xqLFT4+tmKiddQm8S2MsVdGM23tsev0eJrW+gjYIy9RTVNqk6kGRwID5HOCRzbQjbCQrwSWj3hsa0Fouk9mvIpxzaqp+yzKFBEV5DQ0STR8p5PGBGrEMWNzmnEZ7DH950VkiT4f+YE83WWpJSX5F1DM6K8zYO4ms/kaOsTxHSv1bqjeAFIa72WAwrTGAhRPzsDYpcv8vjUHzmWsW8zOOIUZRiIM9G95EhtP44IwhY/UgLWZd6BPqu1DKAO50toCKItDM4nS0Jfklcc0j2MlcW4krEK7JGK3ZppNrJM9ah4YIprvI7o6GRy964jyg5utwY4WJalgjBnr2EIOFK5xvix7Yad8un47LzqpSQsQF62Vlt1dfiuIvfEWBOf7zyo7+w7fSrhyW/0M7rjkNkRiWYacoch0N7ldLJrl0L7UEcmQ9p2AHwFvm/3YTn5kskgJy7kl5NiambC12zVMyLereOTXtJgb7tYUGoXuM8/Px2R0l7IWwwlu/h7mIB8dGgCpO1l9DK3+DRdXTJEt7Vagx1EfxvOZHl3qhBOpjop5C2Oue9MfHVXXJTFQpKPA25JyU9yRYczHxR9qCK0RtzaAo5q4bjT1VugLZXHf5kKtZEJW8T26BMQWtNZi217aHJEeYSHKfXyA8bt2xhPONrROWBqv9YK02KLFKPFCQZS9DEojBJXit2F6Yf55nsMUcvAM5elMh36VvU6xsUUCGxBWkam+5lEpRCUEokBbMyXLUqHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBsam1VWCtlUzNnRk96YnhUeHlCTy8wQWZiRjlob1FPRmNKL3RJdzBCZmJI?=
 =?utf-8?B?elNHUEhzaVVtblFGMVpLVEhIZUduc2kzeG92S1FlUG95M2xTek5LdkF3YUZm?=
 =?utf-8?B?U1NyL0ZpL1hLVXVSZDkvdllEWktTRnJJbDJMTUs3WFBJS2FqR2hkS1hRcHV5?=
 =?utf-8?B?UFkwM0QwdmQwa1BXZUdoUXNSbEEvQ3hwTVl6ZnVobFpvMGM3UkxXUVorTDNx?=
 =?utf-8?B?T25ZU3JGbDRBSE5LN2EySVlxYzFMTXhKYkhpV1UxYjZTM2YxcW4yTVV1SHpL?=
 =?utf-8?B?dWxLeWdRREJ5Z0lZZUllT05WVU1PSlRoREFEVmpGK2E0NlhTeVpBOTNRVGFO?=
 =?utf-8?B?Q2pieXNZVHJGMit0aUxjcW11eThJMHpESjhjL2Z1dEZOOTZSSExSSEJzTGp4?=
 =?utf-8?B?clo0NzRwMm55bk52V0xDMTFuYk5UMEpHZktnOC8yeDRRTjZxR0JiMXNMR1RN?=
 =?utf-8?B?blhoVUppR0tnQys5cWpaQ3lEMFEvUk1aazZlaDJ5ZUsvT3Zna0ZaSnp2UEFm?=
 =?utf-8?B?ZS9HUm5pZmFzSDBKczZjNjRYc0xTZXhlMk96cDNoVCtnRTJUOHZNUVVvRkZm?=
 =?utf-8?B?ZXpodUNkWGJIb3g4aVJsWlI1eUlWZjJUTVlKOFFoU3IyTHZ0eWR2VFM2VGc5?=
 =?utf-8?B?aXJqb2E3dmc4V2FYNXBiOUZvS0I0eWxyTXJiM1dhYkNOaEpheDNmZGRxMUVy?=
 =?utf-8?B?ZCtFYWc0a2tQd2VPbXpRRFgzaFpTUnRyakNUVm9tbHAxejM2UGphNUxHdGNH?=
 =?utf-8?B?M3o3UTE1aTE5cDlnUkNwTFJrYVU1ZUZ1dmd3WllNQzZVQm9kQjNXYktzQ3Zn?=
 =?utf-8?B?c0NBSjJiSjdFV0ZVMDFsRGFrZjJRSGNiV2lmWTQ1VVljMTRJZlVuWUh6L0Zl?=
 =?utf-8?B?dUg5eVBlbExMbmVDNEpHMFJVZURJRXVHMEc5cVNhbHdUYThDMjJacnQzcHU2?=
 =?utf-8?B?NWRXUFRiamt3bGpnbEFTSERvcno5UDh4YVlNNTE4dDRhR25qWVp1VUpndTA1?=
 =?utf-8?B?dnF1bjB5YzFNTjFDVXJFRjJ2MEsrMXkwdkpXemRQbll0SmlEb2VmckZSY3o5?=
 =?utf-8?B?YVN1eHk0cytFYUc4cUd3eGFJTko5dEV5aEhIYjR6dEJaT01BZXRrbFVHRWxO?=
 =?utf-8?B?NGwyY0FGZ0g3NmYvZkM5Qlk5S1I3R3MzajBLRkF2YUZOL01Qa0JuTXd1UW10?=
 =?utf-8?B?cFR1N0JqOUk4SmJSU1lLK0kyZ0Q3RVo2VFhBTnkzcDhjbS8yVUdxSnRkZFJh?=
 =?utf-8?B?RlYzdDRaQmFBcUNnZkIzcVJPY2lRRXJtSzR2dFF0K1ptRWEyTVUwR0ZFR01L?=
 =?utf-8?B?bG9RYWRvTjdxaEx4VGJabTdwcTI3NXluMlhqbUVsTUJ4cFhJajVrajFaa050?=
 =?utf-8?B?UXBKejAyalRpaTVaNXkxcElIemZXblV0N1ZYaFpNVTN1dlVidlJmRERJd2l2?=
 =?utf-8?B?QTl6azJqVm5zTnVJZGwyQVJQZml0UWZxV0hjZ2IzdFJaNlI4ZkREVUlja2xJ?=
 =?utf-8?B?d2hHWmNDcEJCdmpwNGY5QU0zUHBlYWFGeE9LM1czRzdDaUtaTXZnUXF6SEhj?=
 =?utf-8?B?d1k0eVlhZlAwdExRRDVaaFhkMUFZZXVPUCtSak5kaEY0bjlheGFXUFBqcHNF?=
 =?utf-8?B?STllKzFSVHQ0U2p5dWk1blJzL0tlK0F2cEM4NnFVdUtBcTNnQklXUmZFbWth?=
 =?utf-8?B?QVVMMVczcllQNzU4elBlN1FwNE5ueUhBRG1PcFRvV2lYeXlPUTVFVnRYOVE5?=
 =?utf-8?B?Uk5kVyszODNxVWRURGl4ZXRWL21xYmpLRjhvTkhLaGtKdUlYaFZmVmFscnFG?=
 =?utf-8?B?ZHkwOFpwdGhhbEpnZjVwQW56TkgvSDJoUmVpVjJ5OVd0QzZZTE0xdTllaEl0?=
 =?utf-8?B?K1lWUDBsOWt2RVZMblNPaWljVlFHRU1Pd0J6WnFSeHFsRXROUk9xQlUzc2Ri?=
 =?utf-8?B?Z0Z1emJQQkM3Y3ZqQUt6SS9hWDBqWEI0Q0FzRFBaeXhXcEc2a3p1Qm1mT0xx?=
 =?utf-8?B?WGtSbzBXaTc4T1FHTnJNWllYNjlGY3V2S1p1bGFqaFdiTG5GOW5UejhCTlN4?=
 =?utf-8?B?MHR6cjNQU1VOZDVIcTU3ZGRYWkxEVFVZSzFRK0daTkh3UkZjbnI1QzRJL05u?=
 =?utf-8?B?d3M1SUFmWXo0UVpsM1JOUjBrL2E5T3FWT3NkN3h6dnJhRVFsRG9UQ0V1S005?=
 =?utf-8?B?cm1mWUpicndNdHcyY2p4Y3hQTGFuUTg5VTZUTllNWVZYY2xiaS95OEtwVWJq?=
 =?utf-8?B?YVo4UmtTc3Vnc0JNVldvOUVFS1lNT2ZIcVF3R2xrL0dncTJtaWpGeHBiNkVt?=
 =?utf-8?B?VndyV21vUGwvNE84N2Y4RmdJQ1diZFVHd2I1UU9TZDhZNlNzSDRHdz09?=
X-Exchange-RoutingPolicyChecked: qcyAa6mWyn8Nc+RvBqun/SyQ+iwpudgEsymrEZYF6ds+/Tl9RTTidM7WSLAidxyrbAihq7RWslYkaV+EgdZaVfGJvBYd8opYjQgKxbvxjUNbslXYMHnyUlO4AL6pzdvKanW5mn1X31PIRytpmX/bJ3U14+bB/bdoaLr1fuyKQlvC76GxhQlaWOrJc/BzGdRJp0uHKDfHvpCIdMV9L504NV7vT9k2OLRODEyls39lJJm1qeB0yy7PWr/G/MIZeS7t7oeWSz7agK4oMvyOdYjMOZQW5aI34e7b5F+q7BEzumYgganqTTexHiwmMePEKJkS02Q+ZWsXHjc015gIoSc/GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 107044a3-00fd-4d7a-d2b6-08de9fbcec23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:44:50.1011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvw8zRH21yFdhIpkdo1TLQBwD7uB4teflOp/aKUpJJpjozO2ZrUnA2xDu/q3+JSeQ8FVDwXMx5caS1PGXxhoSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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

Hi,

On 21-04-2026 01:21 am, Summers, Stuart wrote:
> On Mon, 2026-04-20 at 16:59 +0530, Sk Anirban wrote:
>> When the device is wedged, GuC CT sends return -ECANCELED. This is
>> expected behavior, not an actionable error. Avoid logging these as
>> errors in the engine activity and power profile code paths.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c | 8 +++++---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_pc.c              | 4 ++--
>>   drivers/gpu/drm/xe/xe_uc.c                  | 5 ++++-
>>   4 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 2b99c1ebdd58..700f3464fb63 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -464,18 +464,20 @@ int
>> xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>> num_vfs, bool
>>    *
>>    * Enable engine activity stats and set initial timestamps
>>    */
>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>   {
>>          int ret;
>>   
>>          if (!xe_guc_engine_activity_supported(guc))
>> -               return;
>> +               return 0;
>>   
>>          ret = enable_engine_activity_stats(guc);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -
>> ECANCELED))
> Is there a reason we don't handle all of the cases described in
> __guc_ct_send_locked()? It looks like before we do the ct->state ==
> STOPPED check (which is where we'd return -ECANCELED), we also check if
> the CT is broken (i.e. we got some bad return value from GuC and marked
> CT as "dead", hence returning -EPIPE here) or disabled (and return -
> ENODEV).
>
> Same question for the other cases you have below.
>
> Thanks,
> Stuart
-ECANCELED is the specific error returned when the CT is stopped & 
device is wedged.
Other errors may indicate different fault conditions and imo should be 
useful to log those.

This follows the same pattern as pc_action_reset.

Thanks,

Anirban

>
>>                  xe_gt_err(guc_to_gt(guc), "failed to enable activity
>> stats%d\n", ret);
>>          else
>>                  engine_activity_set_cpu_ts(guc, 0);
>> +
>> +       return ret;
>>   }
>>   
>>   static void engine_activity_fini(void *arg)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> index b32926c2d208..188f325a462d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -13,7 +13,7 @@ struct xe_guc;
>>   
>>   int xe_guc_engine_activity_init(struct xe_guc *guc);
>>   bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>   int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>> num_vfs, bool enable);
>>   u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct
>> xe_hw_engine *hwe,
>>                                          unsigned int fn_id);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 7ecd91ad6192..efcd432ef6ef 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -1202,7 +1202,7 @@ int xe_guc_pc_set_power_profile(struct
>> xe_guc_pc *pc, const char *buf)
>>          ret = pc_action_set_param(pc,
>>                                    SLPC_PARAM_POWER_PROFILE,
>>                                    val);
>> -       if (ret)
>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>> ECANCELED))
>>                  xe_gt_err_once(pc_to_gt(pc), "Failed to set power
>> profile to %d: %pe\n",
>>                                 val, ERR_PTR(ret));
>>          else
>> @@ -1306,7 +1306,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   
>>          /* Set cached value of power_profile */
>>          ret = xe_guc_pc_set_power_profile(pc,
>> power_profile_to_string(pc));
>> -       if (unlikely(ret))
>> +       if (ret && !(xe_device_wedged(xe) && ret == -ECANCELED))
>>                  xe_gt_err(gt, "Failed to set SLPC power profile:
>> %pe\n", ERR_PTR(ret));
>>   
>>          return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 75091bde0d50..b440cf8c431d 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -215,7 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>          if (ret)
>>                  return ret;
>>   
>> -       xe_guc_engine_activity_enable_stats(&uc->guc);
>> +       ret = xe_guc_engine_activity_enable_stats(&uc->guc);
>> +
>> +       if (xe_device_wedged(guc_to_xe(&uc->guc)) && ret == -
>> ECANCELED)
>> +               return ret;
>>   
>>          /* We don't fail the driver load if HuC fails to auth */
>>          ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
