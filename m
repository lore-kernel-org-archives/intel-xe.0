Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2035DC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C847710FAF1;
	Fri,  4 Sep 2026 12:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb911962";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1F710FAF1
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788523753; x=1820059753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Psq1LuS7WSvgTpfeYpsSrtQtfeeg8k7cTeK61MK7Vvk=;
 b=Kb9119628G1Qx3XHCAml8DE82EIeOppeJPuCE/JwkazonkfPgTXySeVD
 mMLewXikdHjURI/dD7qmbYmClSpDwF605BUZNPBweBonV8yz1/0dyPhjk
 L5bj7Wb9Z47gD2nU8OvTuRX8xwat7/cHJr8Z47RL8rJ2NDcitHCoRa5XP
 UGQN3G5pg7O6rvfp1BWWm6UrsgJN9C2Z6BwcWGFK62NZPiUp9Egt9lG+z
 9whNMwhtmxQPa5FJM5eY7WjzqgUriA4NXlANn1tg6c+7ulr+Yjv4YgjsY
 fiUmk9mbWYQy96KLyYoZcG9ViVKfu7fFUn2A5EsDmAnPHGKY/s/VWnVu8 A==;
X-CSE-ConnectionGUID: BCxCIPmRShqbjL+GnHEmXg==
X-CSE-MsgGUID: jeYlRLc+RPWDh7dj+Yalsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88165451"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88165451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:09:13 -0700
X-CSE-ConnectionGUID: 7nvmRjrATTOLWr4Ree3RcQ==
X-CSE-MsgGUID: Kkndjc3/QN6UYhwaEfGmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="294905600"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:09:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:09:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:09:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRW1q3TeYK+f+D7wpnCMXQTW4hYqGicCX+Xh0bDAgLlFevhh33pzv2gCO3sDpIexHTnfwLK0NkO0riYFZc0fjO217mZQpR+aQHzLEL18HexrJMUzFL3w/ATyt4EgvxBFr5X+MvLIgqlp9kfAca2p9GpZdEN0p95nUed+MaoMHp1AkiI6jFVkki8GzFnX+YfKJSDePq6ni/FG6YDOEO3pxtpytGOXU/6+qilvQ7jUrHpiz7vDxwpsFdqcl45yzXef9NtW0Gc6SyvT8F/MczGLoG/kf2ig/dRRSMEv11t4qu8tuRwJN8163YHfIx+4vOby6+Vh2IUP18TB3z2zPevpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxKPVdjoNLVRdYi0909uxa0Vd2GxpaEgKfBmJZUTAu4=;
 b=gYp/2Ov+9AvPL1RNOBQufJ58TzGGU7a1Ka7T+RemeFVbxpLqEaFosiXDYH1DkM7RgP/ekfz8bRxzT5NATK7Z0py5aXLI/HLD+T1omfpic8oF/VL+SrrctPsUtPdYmrEIgOPTot8XpgInV6tyxP3Z2BmEJr4Ga7Lwk8hX/L+x481lJVCyoddNxf34xgGkTRK0uQNiEdSW6gSXSDoroiJGEPfT3YEtfoGQRkVLhJTTRPF9ZzjBO129k2R3RThOwP43ZqjVid1TcxaO8E72p35qfF7jzRxOVB1DtdW1kAScRsN+2akJFEN8uUeWcH0m0Wj3/8ugCpOj43qZDMPHSstfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:09:06 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:09:06 +0000
Message-ID: <28c4db86-72e8-4ff1-95f6-c2f25b2cfa6d@intel.com>
Date: Fri, 4 Sep 2026 17:38:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-6-badal.nilawar@intel.com>
 <aoya-4fWW7pLb9bc@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aoya-4fWW7pLb9bc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: e32f09dd-743f-41d1-cd2e-08df0a7d518b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: iNn+82bALmszkenHiVvHCj3wzHl4ULYpFEX0lJaoy5RQkrLyLpQKcyvCQFAvfsXrlm+46iqESIZ2MQeQjghhOR9kJ7srhO8GisgpF/2KSSld3nMG0fEQA+KRqYHfy5tzTq0wPwa2ob/LN1SeTPIVevFtGeuZ3r0TBZb/BQjOU8ngeBOnvBRqTHQI/4n9CjplFKner9gdrSSqvvyzss8k2huty8buaz1IWeelBLXGDGox3oPU4OMVRtC2JFsGDXJ1rh5qsqheksDpPn+fx+0nxZDqrI8OfbZHDR22SvvvpN1Ny6nbHArKVK4yqcKAq59+mvMwIknf9RaCgZgKI5jLheC2v8ZOUFulT8uW227Tis53BUiskzcJ11D11ci2O1E2LDg7zrIwDb38hY1XycDvEq9i9r0LNpBsFvYay+kHj7cr4P/Yai9rLuDdzJtMYfonOhocDIBiUAN9fmKpqLbo9nYQ+ulnowNPSukWJqUeNbhGhUk0FZBHWKHoiwpt4G7z5rFICjcFsdGubfN+Tku+P1JnFD2jZyuz7zx75RQlYwZg1cC7oNRybEMlOc9yaWw7zzntfC+pCLeZ1TyTGEEY7K8Qu7UQSljVGw8RJjgaskgB11eZZ5ZQ4sJDNmBSmqiB1vSjgQQHTrQVD6TTQAN2dBVR3U+2YmBPRJGWvIDdoJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25WanQ3dmJiT2ZYTVBaTFVqOEdsTnZPcm5HaVNvVkFCT2ROeFZ3TkV3VWg5?=
 =?utf-8?B?V0Y5UlRsdldxc2VNdkErV2JYb01kWkI4UUV5d2xLMlN1ZFZxeXgrOElhenJ3?=
 =?utf-8?B?czNKR2dSdFlwRTJkUy84bzI1ajdvZ2FnbWlyam1LNWNINTBSejBIdDRGQ0dR?=
 =?utf-8?B?NUprblNZcXEweTZoNk50OHYzY1JpWEs0MENMYWhiV2x2Y0FIbGZqaldMSW4y?=
 =?utf-8?B?ZTVrcDMrQUhWbVN4dVJjcnhOcUJJbDkrRHpFQy9SRU1XRUN4RzB3WnlTSXFt?=
 =?utf-8?B?bGtDeDNyMnFaam5HUnlMYVhtUmFwZDdpckFsMnFSbU9vVVNpZW9PYlN0cHpl?=
 =?utf-8?B?TmpLMVVzczVSVGZ0SWJpVmZMQXM5R2JRR3VsVXIzTVo0RW54SlVWNGZTQzBM?=
 =?utf-8?B?RU8rb2NqTU0rV1RVTXJWWjRqMXN6YzY0WDRNRkZqSTRjMWFRR3ExR2FmSUg0?=
 =?utf-8?B?Z1FRSjExSnZTRDJITmxrekI1WGJveWFzMUJoN1RrQ2RuajFJUHozUGpVcGRY?=
 =?utf-8?B?bCtLSzh3WmdNejB2enFhU28zWmU0SElYRGxnbWE1WStIeHdCV2xPbE4vdGti?=
 =?utf-8?B?VWw2TkRFWXNtc2R4V0JLZGEva3hZTHFlQWpRdUkvTHJ1NjRRSkE1RFRRck1B?=
 =?utf-8?B?TGRtRWlZNm5OWVIvSngydzE1clVSMCtEY3E0MlR5QnBpZlI1NWQrSFZycjlB?=
 =?utf-8?B?UjFrK044ZjFOSGo0a3FKait3ZHBJT0hmY2pjSFpaSTZhc3JCS2xYbVlENlNY?=
 =?utf-8?B?VlZEWlVFWm1TM0R3UlYvNmlsZE8zYzNFb3Y0YkZwdUM5VDZzcEVSK3Q2eGIz?=
 =?utf-8?B?V2xXUjVDeGdWR3JrdmpsY2Y4Znc0WFIwQWdTQnd6TzZFTUdrTmh1cW92cVRS?=
 =?utf-8?B?YmQwVmtwbmRZa3huakJLbVNuNTByTzFiUGh6TjVoK212MllnU0tzY0JRRkhD?=
 =?utf-8?B?ZXg3U3VvbGJ6UEZtV1lFWWNPYTRzZ2p1V3JBWEg0c0ZwYUx0bGFMMUhUMFRr?=
 =?utf-8?B?R29pWkZQRk9ZeFhZQ0pRUktWQ01HSmRRQ09yMDBsbkx1clBwTU43eG5JdFNU?=
 =?utf-8?B?ZEh0KzhXZHZFNnBjNzVVeWQ4K0REeVZreXkvMk9meTZkL2pJY0lMTExubHJP?=
 =?utf-8?B?cHhOWCtsZTRqTmQyOGJjRXdZUkFMVHl2cWhVaVNTeXRvaGxYdjJzS3ZTYUxs?=
 =?utf-8?B?WjVPQkR0Y09uT0pzR05maVZ3WjA4VlJrODJqa05UOW1IcnhFZGc4dS85L1VQ?=
 =?utf-8?B?bWlnd0pDWUp6WlI3QW9lTUtVSlhYUXpCQ3RoK3hHaEY3Q3ZrK2xTRUJmalNq?=
 =?utf-8?B?dklFUzd2QTN2SHhLNjgwUjBNV1lWY21YNEFHcndYMEdNV2VYUGVoQVNiaTYw?=
 =?utf-8?B?RzZwejhURXY4TlhoblA4aFNBYXhpWXI1d1MxdktGZHVSb1JudkVQV3NqMVZJ?=
 =?utf-8?B?MVlyWk81TlhPajBKME0rWHM2VlA3OXhBMjNjaUt2VWJsbmlMTkxUTkRMU25h?=
 =?utf-8?B?ZHYwSVVzMHBqOUpNcW5QSU1MRXlYZWxMbmVXeUs3MDlKSXAxZUNmNU9PWVl3?=
 =?utf-8?B?blVvV3hBSjRoU1FkNFlGUlczZk8rZDBCU3NtWXl0WllNYzAzQXJsSHVxZkRZ?=
 =?utf-8?B?Znl1TWthZE1heEpyVERnRytMQWxzUXFWb2R2Qkg1Sm5IQ2NPeHROQzh3Q2V4?=
 =?utf-8?B?QnZwZll6Q0k1TlUvUW5JbVZEdkNyNFdQQ3NwZXhqU3hzV1hydHNSWDdzZDBh?=
 =?utf-8?B?Nlp0Q3lBZ2lNcmlSVG9wYlpCZWhtaEhiWnI4ZHl6UlExdG84S1ZLT1hNNlJK?=
 =?utf-8?B?a3NQcmxhT25zK0FSaERuVnBkZVhwNEZpZmhKK3hoZzU5a3BuaWNiVFFQTW8y?=
 =?utf-8?B?U0pTL09KUTdWUy8rYUJxUjFvaGtnRllLM2R6dUYwaUkwRVBsbTU5OCtIVTZo?=
 =?utf-8?B?aFpKQ3F0dlJ5b3Yvd0pxMG1GSnVBd3IzalpLR1UyTm8xRzdtL2JZVGdJQ3cy?=
 =?utf-8?B?cXYyaXZWUWhYUXNwdmlIcGRINkE1OG93bVNDNXROR3FQUG0zdmtJSUp4RlV1?=
 =?utf-8?B?YmZsQlhDclFQWUdtcDRoKzV0a1RmK1h0TkFXRStXcHUzdVVFRFFIYzd0WWRG?=
 =?utf-8?B?RDd6djUwVTVUVmRCeWJQak91Z1RRalNVT0pNUUtvMDFHSVhKb1RWNzZMb2lE?=
 =?utf-8?B?cGNtRWJyQkNPQVZWR3FMSkJtWGtwNVF0THNndWRjSlBLaHNPY3V0QzFrVHZV?=
 =?utf-8?B?YVlKQ3lzQzArdzFUSnFBMEFTRlBIeDRQaFVhT1NzM3J6OVFzenhITkVCbHBP?=
 =?utf-8?B?bHpSVHVpVmZUWkdpR3NlOTE4NFRPN0xFRVR6b2JYeFRHRGJ2TWE1VlZROWgv?=
 =?utf-8?Q?kc7me9FH7Wmt3GXg=3D?=
X-Exchange-RoutingPolicyChecked: qZltekGpybYhhdzDekyZ3ASsvjLal1Gmj2fUxnq3eXP1O49GYZZHLQQGB0V67NMoMbpdi4fiji8SezDUcbWG6gfMV2w9c8ztTaQo1kQZCKWrVApcdvh63SmZAAYh/GdC4E2AUMDNaYcCbH6Badq3KY8CUd92pU4DBt9J3cAlcEAm4pTJwioj2xVyf2W8frbHZL0pagPj2sI/3vnKRLpwopEb3h9ykayULvNXuLA2kb7KrhrGjelJNZ/W4lbHv3rzev2PTWGl+b19nAup2rd9VplVxeu41Pr+fUxWyXOkxhkLk7991ReVn6F24ZW+PykEJC8dPjL7Tsp90oK2TwaLkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e32f09dd-743f-41d1-cd2e-08df0a7d518b
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:09:06.5973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAk8g0PhfAwmjFcoh3m7KGff9YliWx/qjx6XFk9MEDXRvXjulKQ03Z0E3CQp0uhSQtmyuVqpxBYJ8v4B+8cu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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


On 25-08-2026 00:56, Rodrigo Vivi wrote:
> On Sun, Aug 23, 2026 at 04:05:26PM +0530, Badal Nilawar wrote:
>> AMC raises an SMBUS alert before performing a power removal or
>> power-cycle operation. The xe driver then places the device into
>> vendor-specific wedge mode until the recovery is performed.
>>
>> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
>> identify the required recovery action.
>>
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 ++++++
>>   drivers/gpu/drm/xe/xe_amc.c                   | 65 ++++++++++++++++++-
>>   2 files changed, 84 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> new file mode 100644
>> index 000000000000..b3de933efe11
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> @@ -0,0 +1,21 @@
>> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> Should we do <bdf> instead of ... ?!
Sure
>
>> +Date:		August 2026
>> +KernelVersion:	7.3
> this will be 7.4
I will fix this.
>
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This file exposes the reason for the most recent Add-In
>> +		Management Controller (AMC) alert on Intel Xe platforms.
>> +
>> +		An AMC alert is delivered via an SMBUS interrupt and causes the
>> +		device to be wedged, requiring vendor-specific recovery. This
>> +		attribute is created when such an alert is handled and is
>> +		available to all users as read-only.
>> +
>> +		Read returns a single line containing one of the following
>> +		alert reasons:
>> +
>> +			Firmware Download
>> +			Thermal Trip
>> +			OOB Request
>> +			OOB Reset
>> +			Catastrophic
>> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
>> index 8ecadee6eea3..ceb2c4d618fe 100644
>> --- a/drivers/gpu/drm/xe/xe_amc.c
>> +++ b/drivers/gpu/drm/xe/xe_amc.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_device.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_printk.h"
>>   
>>   /**
>>    * DOC: Add-In Management Controller (AMC)
>> @@ -56,6 +57,8 @@ static const char * const amc_alert[] = {
>>   struct xe_amc {
>>   	struct xe_i2c *i2c;
>>   	struct work_struct work;
>> +	u8 alert_reason;
>> +	bool sysfs_created;
>>   };
>>   
>>   struct amc_header {
>> @@ -104,6 +107,54 @@ static const struct amc_request amc_get_alert_reason = {
>>   	},
>>   };
>>   
>> +/**
>> + * DOC: AMC Alert Reason
>> + *
>> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
>> + * to notify events such as firmware download, thermal trip or a
>> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
>> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
>> + *
>> + * The alert reason is exposed through
>> + * /sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> ditto
>
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>> + * specification.
>> + */
>> +
>> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
>> +					struct device_attribute *attr, char *buff)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> +	struct xe_amc *amc = xe->i2c->amc;
>> +
>> +	return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
>> +}
>> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
>> +
>> +static void xe_remove_amc_alert_sysfs(struct xe_device *xe)
>> +{
>> +	if (xe->i2c->amc->sysfs_created)
>> +		device_remove_file(xe->drm.dev, &dev_attr_xe_amc_alert_reason);
>> +}
>> +
>> +static void xe_create_amc_alert_sysfs(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	int ret;
>> +
>> +	if (xe->i2c->amc->sysfs_created)
>> +		return;
> Why do you need to track this?!
> if this can be called from multiple places shoulnd't you protect with lock?

This will not be called from multiple places. Will drop this check.

Thanks,
Badal

>
> But I prefer that you ensure this is absolutely called only once and
> remove this check.
>
>> +
>> +	ret = device_create_file(dev, &dev_attr_xe_amc_alert_reason);
>> +	if (ret)
>> +		goto failed;
>> +
>> +	xe->i2c->amc->sysfs_created = true;
>> +failed:
>> +	dev_err(dev, "Failed to create sysfs file for amc alert reason\n");
>> +}
>> +
>>   static void xe_amc_work(struct work_struct *work)
>>   {
>>   	const struct amc_request *request = &amc_get_alert_reason;
>> @@ -158,10 +209,16 @@ static void xe_amc_work(struct work_struct *work)
>>   	case AMC_ALERT_THERMAL_TRIP:
>>   	case AMC_ALERT_OOB_REQUEST:
>>   	case AMC_ALERT_OOB_RESET:
>> -	case AMC_ALERT_CATERR:
>> +	case AMC_ALERT_CATERR: {
>> +		struct xe_device *xe = i2c_client_to_xe_device(client);
>> +
>>   		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
>> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
>> +		amc->alert_reason = alert_reason;
>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>> +		xe_device_declare_wedged(xe);
>> +		xe_create_amc_alert_sysfs(xe);
>>   		break;
>> +	}
>>   	default:
>>   		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>>   		break;
>> @@ -190,8 +247,12 @@ int xe_amc_init(struct xe_i2c *i2c)
>>   
>>   void xe_amc_exit(struct xe_i2c *i2c)
>>   {
>> +	struct xe_device *xe;
>> +
>>   	if (i2c->amc) {
>>   		cancel_work_sync(&i2c->amc->work);
>> +		xe = i2c_client_to_xe_device(i2c->client[XE_I2C_CLIENT_AMC]);
>> +		xe_remove_amc_alert_sysfs(xe);
>>   		kfree(i2c->amc);
>>   	}
>>   }
>> -- 
>> 2.54.0
>>
