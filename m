Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C93F9D0C8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 12:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB84210E5E3;
	Tue, 14 Apr 2026 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGhJadLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3510E5E3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776168961; x=1807704961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=apBKm+cnu5QAqbIV9fG4X69NqQC1gTQz3RVT/IXcFys=;
 b=oGhJadLlUvOVZISbF0n2EYE/lhW5JmjfPl3iarfOk2iR/1UsdKOYzooB
 2f8cozjYzDUhJjNRkYEibk1lHvHc6e+jhYWiZI+0TFAKh+ytE74Toejlz
 yLvJ9OXqQsafGC9S5pwKfnkCDuZtrNzvdV1ZD81vJDAFKNHdGFh0vfBLw
 dgLMsfoSRkF3QZu8/1FpPwf/K6lav9GJiEFTDKbKDfBDxe4RkR/UXcYeN
 tXI/0KCnEsyJP6QzoS602EnhMNBCTNBsbkqw8FIvAZccBo3s8pG+++GDs
 PvGqTUlxj7p7P6fdiXYlAEq1COI1Gj0satGv7doxXt4GgoeIzWJxH6Qk/ Q==;
X-CSE-ConnectionGUID: 3pNcjOH0SqaMxxB1VasIyg==
X-CSE-MsgGUID: pUbrwJ6+QdqfDn0XyOmKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77234443"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77234443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:16:00 -0700
X-CSE-ConnectionGUID: qcOEZVD7RU2YM552Cjt5MQ==
X-CSE-MsgGUID: diBdjmESRdCpfQnSch7mxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253299993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:16:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 05:15:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 05:15:57 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 05:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ/MJQ7goibu5q1abHPiPdxrmBfXu3fRnwPusIHhjH+8QA5cT4DPWLJmq43vOgnZFOpwqr6wENFHOFwsiRdoQFYcXgMnPNfdgeI4CSpgGyV+taV6Qe0228N8w1MhH7UDu78ApKvxCZZLPAtdPD5qErnCZZjG3/tnQw1KwzapJgzL40YmRWWqMFKNcmgK9nvhzUcJ0wy/pSIQK8Hwi8ahX9AlrfBnXVfoXxbm8NATeeEITnGQSXgxbgrDu1VMdXhgmb7LevzVvhtdNPE6agseFK050XI5CGW5RVFFUGDdYIuqr3hD5SNO9O63KYG54sO6BVr7tE4zTLsE6HP3SDW2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDIftb3Uthvnd+zjkucRtAWylx7Bt9bGJXrs5Eoegxg=;
 b=GkbZe7yijFWbdyG/0ISyhi6XeDsqDB8Fd+5WEMMK9LH28jMP4YPWDAy4qHzKL9UHWF2c4t9qAQVqTh6ZuXGvxWZtgNqk/6LmSXFE6ywlSb4LymQYiY0S7vKMjOMnHpm1uG4wpkNk9qhBDVw92DDDJ89Kh23BKQ55r+djvPoglk6zqL+idWURUXEQXNfvHPyQuV2w/stdIhBucx6Y+a6um+fVv1jh2oQ3vKoLbhJiR8t0Q07QfRzt+K7TBulVxAQaNM7sLc8LclSfyN3/OLgYUvSfgAKtQHIl1PFA/TwainRk1pjxojk9w90TVys6svI/AvpWmz/ZnHYrq/riltSuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 12:15:52 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 12:15:52 +0000
Message-ID: <e229fb23-e020-4942-9c5f-591e20c11ac3@intel.com>
Date: Tue, 14 Apr 2026 17:45:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] drm/xe/xe_survivability: Decouple survivability
 info from boot survivability
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260402070131.1603828-13-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4f7e38-1609-4eec-8bbc-08de9a1f9269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: qrEGPGkpWO1zA/iOQtj0y9AZQfuRCNaba1WoRraTpXUFZBoy/IVHR3JcL4xBL8fYFvsC3QI8PC3Wf5snEonxDXSYFXzjJvzZxy3PigYc2Mdop54JHREYycuH/Uks7FY9H/lQ9ZKJN5xAdTNGKGGwGgtB7pgT3tFNqbYj9pw4zgIWt1W0bXpiNQSAZx8yV3jKzV3JRUkEz6LDaNgstufjb6sbcbnDmlzptRsbYjZ84ay1vFj3o0DKUCpcdfL9AdfrIN3R0lx3FF8ZnhM37EISBg1ZE6HLLd2ee4bQtBnOAoxAEVuU7EEdR9uxQzTw6QpjFEes/gZg4wpoFG9XHTTnu2B+7YFW+gBjNpmtWfkIdh2dIP4+dclvGxh0TCcTXHBR01M204fqFxRaJ0W+4Xjb83e2kqPJt7wRw0S1nWzushFrfEToUn7qYdDmFS5JmcFAvpIn98OjXtDV0iKXMQ1vPdOmqvukNXl6LK4tsuOTJivcVXxIThjZK2p1Y4/HZfUBqmUKxMZ0yJx804FYydW8yxJhoyTSsFmr+fZUoRTk1rKdiKieaRdvDlnXPV2ApUQKc6fxOO/ynXiOdslvOeoRskJSYLelevdqR3cf6yi7zUh7MXJezIGsyNXT+qTytgCkA3g6rI7y94aerOkYOOvlhNjMiclhznJiOgONu/+z6b9+53AbQHL19/HPBmiKj6zVLCktAYBPRzfnWHhU93HmLdXiXHdtgHBXsh0OVwqE2+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Blc2RzQlQvblhSRldiS1JwOWoxWUFVcnUyREozK0pvNG0zQ0ZWUm8wa1pI?=
 =?utf-8?B?eHIvNTlxL2RuOWkxLzZManRMaFZQWmdGbERhWkIxenovekc0RmF0ZFlrZ3Nx?=
 =?utf-8?B?VERtbjdzeWdONlhmYStHSTVKZWUyNFZVcGRJZFFwelJQVERFQzh6b29sVGpa?=
 =?utf-8?B?ZlIxdldYZnRBY1ZNeUw2S1ZDbmJBZ01VSWRKc0VVTmpROWFJbGJic05reHNJ?=
 =?utf-8?B?Yk0yWVhFYWlMVmZRM3J3VXFkZGxKeGM0L0VTSkxwRDBSQnM1Nm43ZHF6ekR6?=
 =?utf-8?B?Tkk4V3BuSVZIUXF0UTZ3d3o2SDR1cU5LaVZWbXFMaS9MQ0dqNlhvd3VGblBD?=
 =?utf-8?B?RnM0cU9OZFkzVFVMQVkvU09jNC9UZU5DdHhxUkcwOHJ5cVJuQ082WTBZdTNB?=
 =?utf-8?B?Q0h3YnQrZnplQjBNT0NUNW1zeWdvQXIyUWF2NTJ3KzIremZVamdqRjVnRXV2?=
 =?utf-8?B?S2RvT1N4R3V3UFNEVUlqQk9RWkpLK0NGcmJhVHNGZ0JxSkc2Nk9IdXRCQ01X?=
 =?utf-8?B?aDhGWmRseGYycTRGcHluaTVFUkJaUVJVSjQyZjc1Y2JFUitiWEZpQytTNHp4?=
 =?utf-8?B?TUJrdlUvWnZQVE91RytsU1pCanRDQUI1YUhRWGxpODZlSXVsSVZwNHJMNlhs?=
 =?utf-8?B?aUFha3dGUWx0SlYzZlBZdHBDbFlXMlhwV0xrUG1iN21JZGtMa0ZIejVOR0ZQ?=
 =?utf-8?B?Zzl1TnBaMzc0WXQ5YjBXVXRMUS9ZcUZxam1LSW96bDBsRnZJVktKWmhjOEdZ?=
 =?utf-8?B?OTZuWHNlc0E1TVRaakhFYmtvbEZyKzlRQWpSVWh3dXZoZUNrZGJQZmtWUmYz?=
 =?utf-8?B?Tk5uUmJQVzdsT1RDVzlya1l1MzllanZmeTJlTGwxN0NOSFFvS0ZVV3MzVnFI?=
 =?utf-8?B?eUJEWlpnTisrUCtac3VHZXFLeWFyUE9CMlJoYzVxMHptRTBiSFlLRlN4WDRz?=
 =?utf-8?B?amd4S1loZzBDU2ZNdTRnYkFlcnhQTVlWQjNPR2VCeE1oVjA5NU44WWFYT0I3?=
 =?utf-8?B?ZWo0TFNnUXQ1UUZHSzRxRkpVYW1VU1RHekdyMU1xR2Q4Y1luMmRlbE1nWUxq?=
 =?utf-8?B?dzY2ZXM3TWk3WUkxTmlJY3dmZEpoNFlEeWVaejdhS0hEeDVnWVpLSVJsbE1L?=
 =?utf-8?B?OWh5RndjY3BROXU5T0IvTEdaMWZ6RHNoMWo3eDZsbUtpUzdvMU54UjZlblNJ?=
 =?utf-8?B?WU9XN3pkdEdVeTRsbzFqR29ZS3RjRXRMTDBNZW5tQXdVNDZHRmM1Vi9RcnQy?=
 =?utf-8?B?RHUvRVlpbSt3aExEeHkyMUpsZ0NZdmdPUkVWeXdHYVJrQUxvRERuMlJmWGMw?=
 =?utf-8?B?K0VnRDlZZFIrLzFBOW9TRzBxZHhVenc3YnIzOEMrMlBNSmQyRHRWOVRxd2tw?=
 =?utf-8?B?VTZVTXZDeU41aEczODBWNTRmVmdjM2xqZ3hwaVRaMVdFQWJWeE8yVld3c2ph?=
 =?utf-8?B?aFdtRCtUNlJvSklXTi8xRDJRSXV1ZUtLQVUvQXZNT2Z0c2RRK1ptTWdiOVNw?=
 =?utf-8?B?RUVuWDFTMnczeDZiQS9ML2tXQ2pJRnR2SCtNTkN5MFRBSTRRNzc0OTZ1QTZx?=
 =?utf-8?B?RldlMUE1QllMdGRpMjJZVi9IM0RlTEpab0NPTndYZytnR0l2c0Z4UGJ5MHJy?=
 =?utf-8?B?a0FqN3ZQNzdoNTY1N25vWGd1UVkwaTFFWmdGVU5MWWVScEZDQ2F0eFRuSjQ5?=
 =?utf-8?B?ZHFpNXMzRXVoTGJlMEFTcm5GL1lvdUtXODBqbWZYQXYxdldPaXFCTml4NmZz?=
 =?utf-8?B?RWlWUjNXTUsyMDNDWXFadTAvS2JXMzZPVTVTLzlKOXM3akRnbW1tRFI2RTZ5?=
 =?utf-8?B?dmt1TU4wcUU1YXpKNzUzY3J3MkhsMmxrNFN6V2ljaUhnNDladUxoc1l2aGNK?=
 =?utf-8?B?endqUXJUMWw0SnFtcUd5MkUvaVIrZGxEK3JNMU1FclcyaTU0SHBMU3pkWG9i?=
 =?utf-8?B?N3hSY29za2grdXBOcVpyL1dER1VqYW45SDdicGJWa2xQZDR0Nmt6emlFYzN2?=
 =?utf-8?B?czJzcnVjemRSbGNEOHNIaVFRelNnTHBhSTQ5TFRjOEdhZFlvZHdDbmc5Z2NF?=
 =?utf-8?B?UmRXSnYyci9xSGtXMEdrdXU5OU1UWXQ2Q2RTVndVaThsUVRYaG05TFhCdTM2?=
 =?utf-8?B?UEdSamZmVnUzRDE1S2o4OWFOVGdmbTBJMGQ1QnZNSFhsT0t0Y1lHZEtJKzh3?=
 =?utf-8?B?RkJzNTdiYzExOHl2MEwyWkxtRWZUbG0zZ09HRjA0WmdyMHQ5ekhpVVg5ZkpX?=
 =?utf-8?B?dy95Vmdwc0ZvcnV4eUpKTUZRQ2hQTWlGQ1dhekpkUUJ4MEx3QnFJNndGS0pt?=
 =?utf-8?B?ekN4M1JFbUE1aWpacjQ2SVlkZCtLRno2YUZLL3BDZUlhOU5qNzd6YnloaEVt?=
 =?utf-8?Q?RH02kPy41ZiXGpjw=3D?=
X-Exchange-RoutingPolicyChecked: bw4HrDAiXRpTOmTKklse9kxpglB9Iq+5B6yXNphJjmYMvS5Fuf5tgzDbCFaxC6QFoRPOl1rQDRbYrC5W36FpoAUq54W0viToTnJS6BVus29mIiqPUdHmfx9jU09X9g6WEfAgELbAc5U+//xISKgGntF8WZRdprY2XSrTksp1Q2rauTrnWR7qsppr03XBLxVKi0lQsCjiZHK0H5U2D6gAY2SXIfg+TQGtfafhjd5QlXofu1i1GyNk7vI+e97ulB3OfFpWm5UwTdQQc3qBKgSpd2znDdxt+L/JfYAxKnpebszHIrDyypRQf9ez7QiBa2RFuTBUSarkKC+ULsxnNt0DAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4f7e38-1609-4eec-8bbc-08de9a1f9269
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 12:15:52.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8KGeJQBDYgsxZzjf3WL3GR8xpP6M42M/DhEecpCNeeGlOVRzUVuulcYFEOGVb+4RYcI8xZ0UW9OD5VHw4pdsBg26WIqm+0C2Zqrw8W2/R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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


On 02-04-2026 12:31 pm, Riana Tauro wrote:
> On CSC runtime firmware errors that requires firmware flash through SPI,
> PCODE sets the FDO mode bit in the Capability register.
> Currently the survivability_info group is created only for boot
> survivability.
>
> Create survivability_info group even for runtime survivability to allow
> userspace to check FDO mode sysfs.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: Fix typo (Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index db64cac39c94..ad51a58831b0 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -98,6 +98,15 @@
>    *	# cat /sys/bus/pci/devices/<device>/survivability_mode
>    *	  Runtime
>    *
> + * On some CSC firmware errors, PCODE sets FDO mode and the only recovery possible is through
> + * firmware flash using SPI driver. Userspace can check if FDO mode is set by checking the below
> + * sysfs entry.
> + *
> + * .. code-block:: shell
> + *
> + *	# cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> + *       enabled

Nit: The indentation of enabled here uses space, however boot and 
Runtime use tab+spaces

Please keep consistency.

With that addressed

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> + *
>    * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>    * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
>    * to restore device to normal operation.
> @@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   	if (ret)
>   		return ret;
>   
> -	if (check_boot_failure(xe)) {
> +	/* Survivability info is not required if enabled via configfs */
> +	if (!xe_configfs_get_survivability_mode(pdev)) {
>   		ret = devm_device_add_group(dev, &survivability_info_group);
>   		if (ret)
>   			return ret;
