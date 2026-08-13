Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FD7C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5D10F264;
	Thu, 13 Aug 2026 10:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSastWNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1610F264
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786615772; x=1818151772;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QENN58RpAjUt7MqJMPm3LEhSn+8MP/9h8DSTwvsSulY=;
 b=QSastWNyxQWUhP1nNOHkCoidQxyecPfpPKtQZUIs5WY3Vh5/fivUk1Wc
 RTpGEziz5bfor09KXHSraamBk1z2n2/hk02pJwHZJvtAZ3vWPmeRWLJXi
 n5/z9Y17SBhMKSNHIcspV7OA5NOsgnHfovASNdJ3r+b8voWXKehQEL5cn
 J/4ZcFEAr9/LIft9K5NyPAGtSrY5YjEXyyk2zQs877ON63I870EVqzDzb
 jquJWN0+YlvtsQyy3xE0gRnHfPGZJghbiC9RFZgCL4vkpXpSjrNq85U/K
 bzBAfGTrElBxXZsw8R1UZAd7hxqAz9t7CDzTRxs9li0iFa6zgWmrV5ya2 A==;
X-CSE-ConnectionGUID: fvcz8tMUSTK6ViNI5pm4pw==
X-CSE-MsgGUID: Q4yhYCKaR6i9GVEEWiUDWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104719936"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="104719936"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:09:31 -0700
X-CSE-ConnectionGUID: Khj1CDtZQcuwPHv+Zh27Wg==
X-CSE-MsgGUID: +txbI0vFQ+a3KzgYVxnRwg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:09:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:09:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:09:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3XEYtguKexQbbpZIna6U+wHq6hKau6lpI393MkO4Rk2CB4QkmJfFAdbvQkmtWiN2SZoOkZL+detbU/lRUzfur9zyRO+7BF1XPBWWjVMnAniUCzkN0sfHKa0RTrxVq/7SVvoOb3AvICkRXuGpqoJfr8bzXWfcldLuU4l+Drw6/tFQu8G0FatvkVmkQcE5Fgujzd9olEcQibNy0aHL4ovUb1vmBJI/3b0JVw71caisHX84J6RRJOPtKs+5VzdQD3bQRpxcJDeyvatGYgOezuMipHB37785VXmGlTAzLX7VOH5Hf7TwN9gB9/oh3+JGfpl0k8M8Tkfs4c+QZ4H6luxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=898X5rExi4Uxy+qofUTU7wiWpFPiKB8j/y09rra1600=;
 b=LAE/bmsor2SL70WFE3X1BTfPNJyhlCpqxNUiD/BjKdHb5zl+Djdetul3trkRUKgHR6Yupt91dTQgeJaJYn2UXHTZ8SWO6z7nEgWHn8waTgcwj/2QzmAcHcR9f5yZDOMNIGK0391fYe39WtsDt8Qu8uBu5r4I8HhVcS4iO3ZzZJUDQNMFDhbs/ON8y2BaKCrXj2GsIjW6osgV5MwBRFMtNJpph6K5K09b/d9ZNg75U0SAKxf9peT+Jy+R0+B33WBBoBemD8tA/badsbWlaaP1RrHQbbgVebrm4d4v4VrX0ILQThNV3tG7elNXAvtzj+HYUADTBn+uWki+fvkNYa4Slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 10:09:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 10:09:20 +0000
Message-ID: <6884ad53-59f4-4bc8-9a99-bbf50852a4b6@intel.com>
Date: Thu, 13 Aug 2026 12:09:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/32] drm/xe: Report all probe errors using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-20-michal.wajdeczko@intel.com>
 <7beccc51-6814-4680-bcbf-225580abe886@intel.com>
 <e098768f-4946-4671-bf80-e961f1d99700@intel.com>
 <0277da91-96d7-4748-8045-82716daf315b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <0277da91-96d7-4748-8045-82716daf315b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0105.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfde876-0c54-4331-a9d7-08def922f0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|18002099003|10067099003|11063799006|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: Q2dNNITJk26sglBSg3oMxQ4qVu0cRRzhKkZbSkyZTCFAkAbzWpVOc+r2HDlwYp/a3SmXfZOMDYdXEHMWUFX9yxdDtXFEWvcDYXicMXaDmQjimzZdtNF2bZtDM1nf2vvkBzTP1AfJw+ksX1b7i45oJrgrh8HfzIt95VQh2zyxXVKaeSibBmwQffERS7cpmnv7Tn5p02FBQraY0EkfHi/Jdh653Seip70u13FH/yKWYy1K4KRBDbzs7nxEZRFCz94C75u4CFbc5V25EJZ+rvdUSB3BvWb7E2Y/ZUWn6x0bScMfD02aSbatLoGMQ6TeOMfU2wVrrPLZyfhv0xCSdoBysOAOuU19jx72ottKuBlHRjQXQsMQl5VUWnCqb0/DD1HeKiUWv/vQPxnHcVkZ0eJ07Gwy5QCYQt8hVocvVvl+80uiZ0R47x1U6LrYKxK/CB6AF5L94zXaGTN4O7otZIp0LeBqsWj892eTqbY182DyHNv3dnKomwIgY1qd5IgYEPpwG5VjdbUz7+shpcklOInZDXvxR3GGwzSIzfFs4/so2ondtrCp9+PCcc7oy5cLFCPCGDt/FLt4T6dCQ3jjBtAuncjC/xYaWdj6vIdcFyZsgE60IqHKHOfWnjEPXecNVINk6k00F/k56D/iTKRuTVLnfP7X+29Q2YAHSqLT7iTG6W0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(18002099003)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGYwQXVYK0kzNElCczluZ0xKU1VWSmU5TWhPdkV1SmpRcWlhZkhUVjJUY2NX?=
 =?utf-8?B?VE1LN1ZBRmQrTVFZRHNRRzlOckNaZ3pIeUtkQ29XUzMzZzM3Ri80OVlidTlT?=
 =?utf-8?B?amJWdXNzbFFkdGl4bTFlYWVTWndvZ0piQmp4YlpMd0RwZzNMRnJ3VU1ZcE1M?=
 =?utf-8?B?YlY1N1FmMEVsNGU1dWdadXdKUkg0SlhxRUNYUURUWkpCL2hPdUZmVHl3aWxP?=
 =?utf-8?B?amlQNFJja3ZpMUdCaEtGVE5zZ3RDZ0R1bEVSSkdCYXV6MU5TUWVkc3Q2cmI4?=
 =?utf-8?B?alMvRmQ0TXlwS0k0WnFwb2VNU1gxOFgwUURPMnlSYjFCck0zN3ovSzFrSm9J?=
 =?utf-8?B?MjNlTG0yNEpNZWY1aVdIdXFMYnlqblZqUkhwbjhFczcrYS9rLzdWZ0NYVlBs?=
 =?utf-8?B?SWZsVnZuSHUvYkpBdjliRXNWVSt5QmQ0YVpRN0xvYTNSZjE3S3Y1SkhmbHJq?=
 =?utf-8?B?RWw0ZkpkZnAyVm1vUmtkS1dQZnFjYVZZWGZLYzVoc3F1ZEFMNFRBTjNGRitB?=
 =?utf-8?B?Z09CQkVKZkZVSXlTTmQya3FlcTRzWkpuTmNOejhyK3BaSm9MRHJYek9jcG5L?=
 =?utf-8?B?YlZvWlg1L0NiNGdVQmprYUNoQzNqTzBTM2ZUZkJ0UDhVU0NtVkFqcTI3Wk1u?=
 =?utf-8?B?WVhkOUxlK0lQMklwV1JWb2NHRTgxQUtlL2M3Zy9CUUNodjdIakRZR1Jtd3l0?=
 =?utf-8?B?ODRGQTVjSFpocE1kM0VEczJmNnJxRzlVc3Q0OEpYS0F2K0Ezc0RYWGVoTDIx?=
 =?utf-8?B?dG1Sd21vcGhFRUZzb0JsY2I0L1FZRzlZQk90VkdWRlpkc3dQSkZhRDdUbnBV?=
 =?utf-8?B?ZTBNNnN5Yko5OU9TcGUvMzdqMFdFald5UnBGdFhzb0pKd0E4NVUvL0xoK1RU?=
 =?utf-8?B?cVVSQkdxdEtZU2NCV1NZZkNTSGp3WHVvV0pQbU0vMlJRRHZ3dmRTSDF5OGt3?=
 =?utf-8?B?Q3k4bVZuU09TTWc4bHRBT3Fqak01S3h2anpybWdmZ0R5d1lPRnpNNXR6TWNH?=
 =?utf-8?B?K3ZwSFF1YUtndGVrblRQOWxtSEl1YmRIWVZXUXlSOUcyU3BrUnE5ck8venpK?=
 =?utf-8?B?SXNzQ0c3dnlGeXd3WUdwL3ZLR1VwbUxZa1c4MHpXb3BZcWNRWlAvYXNVT0ta?=
 =?utf-8?B?WE9wSlZRK0FGdlZxUzdZVE95V1huSlFHd3BmeGFIWElFdVJ0Yk9SakJvSXNw?=
 =?utf-8?B?bDh4S1ZqaTRySFd6ZUV6S29LaTZGRHQrV2pTd05FSktudmF6dXgxdUI2QTBL?=
 =?utf-8?B?eS9DS2JYODNORXhjWURYc01BL1JjSnF6RnEzTm9BWXFuc29lNkx0YUFVZHNU?=
 =?utf-8?B?WVVpcm5ZbW9ZNjdNY0lvN01GK0VYcDY0K2w1STVrSncwTWtQeVc0QlgvRE85?=
 =?utf-8?B?N0pJclNkOVJlNkRyRnVIOXJCV3F6SWRWdVFBdHc0Y0JnTXFJVlFUMlY0T2lv?=
 =?utf-8?B?WkVqL09GSmFDd1o1dG4wTHVqZnB6RHRUdWF3QjZ5NzNSdzdvVWdEeGsrbWtl?=
 =?utf-8?B?VmdhNys3cjBreU5QTDc5TktxNGJyLy8za0ZlR0QwZjhmbGprei9peExLdklJ?=
 =?utf-8?B?VmpGSkc5UE1GQWhZaWJTalk3cjdhbEpTZWgydTd3TWNoN3dHVWd0NUFrMGJ4?=
 =?utf-8?B?UkNLQnl4TTNJN0FGWE9uNmliZVBQcSt6L1ZEaDVLTFpXRWVqaXBMSnZKRGVu?=
 =?utf-8?B?bHo0eS9nQjBDcTZURWRjcVk5SDFVN0pzR1ZYYW5adFExbkZ1NStNMkg1ZE1z?=
 =?utf-8?B?V2VoQm5jekw2RDRrRFR1bjRBWUkvcmhjUFhnSE55bHA2QnZYT2Y0WDh6WGJ4?=
 =?utf-8?B?ZUEraEVPUys4M00rTk5KSVlRemFzcnhzV1Nma3JldEZzdzJWM0kvQ3NYa0RO?=
 =?utf-8?B?cjR1Y0VkQTd0dDlmWndCVzdaOTNSTm5CN0poYS9sZUQ4ZVJscnNzZUVybk82?=
 =?utf-8?B?SzVNM2xOdHZlY2J0RW0zNUhaWGdSN2o5bXJjcHVQUUpXWFdMcWhXZkIrSWcz?=
 =?utf-8?B?VUtnei9BM1hrR3FFKzhHWTNhMjlhMHJRQ2tvdVlYR1lPMDQySGNYSHdvWHRY?=
 =?utf-8?B?d05NN3NtMjRPM2NweE5kOFNiWTFYa2dLaXRseFM3V2x6bjdKRjAzWjcvSlNk?=
 =?utf-8?B?M2pBdzZvRzlVL1JxeHEvUENNOUtxMHRUSk9hOCsvS3BuL2pHTEl3V0ZMV09T?=
 =?utf-8?B?cG9kWVlsMDJFRCtKYkNFdVlOa1F5NlB1c1RqZnd0bWdBeStJZGNJekI1RG9O?=
 =?utf-8?B?a2V1OUx3QkFmRXpVelZLUGp2Snc5eWF2eXkwVmExRTRWcDN4UXBzTXhuWHM4?=
 =?utf-8?B?USt5OGZIZUZUejhLZXkySmhidWZmVXhnT1JJYW5qeEJxejM1aXpBR2hLbHJG?=
 =?utf-8?Q?Akh5q2avFuUO0Bk8=3D?=
X-Exchange-RoutingPolicyChecked: pCBQxxr7XIv6WUgki/njxNxit+K0X4CSzmpFFo/sDUldChTB12+BuMm1ADfCodMySMJ5CU5DrE48PmCTAYHXrSDMoYyl2XlzoRzIxGbnr9KT93BRMH3SQGuUzxJk/7s+qzxVi+9CKjvPrhSA8XXhIuK/JtdULdTHRn2Un1P7vaXdWrEoIYtPGmgecWEq0qZVUpxHlYdDyGFq3bmJzJh7GLYP8lKzOEi2KYU5SdDJ0vM3jqJsx6Qh6dnRx7mrs+lX8cQTGl6g4Dqi7LjNyvZn9n81VjZqohnG81PKYrNCJUJMe5OT9Y0Qlj869m7qYQrty7+XyNqCtczG4uQZqxQFlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfde876-0c54-4331-a9d7-08def922f0eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:09:20.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YZ0b7x2kSxmthemYcLqelxauZ+JYr5eZ9JTuqHyvjm0/gPRUGdw1DkqBVO5KNt7uvT0T9AaOqzmI+THd9nauGBtCmOBSngvHtKnttHuYCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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



On 8/13/2026 11:58 AM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 02:42 pm, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 8:50 AM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> For completeness, we should catch and report all probe errors, not
>>>> just the ones that have explicit error message. Split xe_pci_probe()
>>>> function after a display check to avoid reporting -EPROBE_DEFER and
>>>> use xe_log_err_fatal() helper to report all returned errors.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pci.c | 27 +++++++++++++++++++++------
>>>>    1 file changed, 21 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index b19efef1c5cd..ab4da1d9a9f1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1147,17 +1147,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>>     * caller. Therefore there is no consequence on those specific callers when
>>>>     * function error injection skips the whole function.
>>>>     */
>>> nit: Align xe_pci_probe comment message with latest changes.
>> hmm, what exactly do you want to change here?
> 
> Since after refactoring the code, xe_device_probe move to __xe_pci_probe so
> 
> we need to change "functions called directly from __xe_pci_probe() or indirectly" right?

I guess it's a matter or the missing comma in the comment

"directly from xe_pci_probe() or indirectly, for example through xe_device_probe()"
                                           ^
                                           here

> 
>>
>> comment above is about "Probe the PCI device" sequence in general
>> not about the specific xe_pci_probe() function
> 
> Agreed! however the are using xe_device_probe function name etc, which is part of  __xe_pci_probe right.

which IMO still makes xe_device_probe part of the xe_pci_probe()

those are just technical code splits, to avoid large refactoring
or error prone use of goto's - either way not worth to be mentioned
in a general comment which is more about error injection anyway

> 
> Thanks,
> 
> -/Mallesh
> 
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> thanks!
>>
>>>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc);
>>>>    static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>    {
>>>> -    struct xe_probed_info probed_info = {};
>>>>        const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>>> -    const struct xe_subplatform_desc *subplatform_desc;
>>>> -    struct xe_device *xe;
>>>> -    void *group;
>>>>        int err;
>>>>    -    subplatform_desc = find_subplatform(desc, pdev->device);
>>>> -
>>>>        xe_configfs_check_device(pdev);
>>>>          if (desc->require_force_probe && !id_forced(pdev->device)) {
>>>> @@ -1181,6 +1176,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>        if (xe_display_driver_probe_defer(pdev))
>>>>            return -EPROBE_DEFER;
>>>>    +    err = __xe_pci_probe(pdev, desc);
>>>> +    if (err) {
>>>> +        xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
>>>> +                 pdev->device);
>>>> +        return err;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc)
>>>> +{
>>>> +    const struct xe_subplatform_desc *subplatform_desc;
>>>> +    struct xe_probed_info probed_info = {};
>>>> +    struct xe_device *xe;
>>>> +    void *group;
>>>> +    int err;
>>>> +
>>>> +    subplatform_desc = find_subplatform(desc, pdev->device);
>>>> +
>>>>        /* Group all devres so xe_pci_error_slot_reset() can release them as a unit. */
>>>>        group = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>>>>        if (!group)

