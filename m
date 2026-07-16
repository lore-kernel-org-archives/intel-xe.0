Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFBC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 13:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C07B10F314;
	Thu, 16 Jul 2026 13:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/GnWT9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D4910F314
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784208866; x=1815744866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wsFoRDr5/tfed9zSQeNY4Bje+y6WG1w8BW1OMD4jewo=;
 b=S/GnWT9C1YMWJD3IB3pBsUbNGIIZ/PXdakQeNu42CQ+MFdOlT5VQGt95
 w3dFf7WWFehd9/MAT3VAIUKc6/SvEW8TfiYiPiBVkoPQEn2L2MNh59DcL
 mugIoO+qEsv/221ZYInLms3af5Zm1fz+GXg0GQzODBOUKkw+fLTi9UQra
 jvPdfcMmrXOtmfPv1Qh1cRbh3wo1Yoazy1lmicQkvHl9/+wLz605+uwhZ
 YUCOUfpKbIWSv2eE09PcZ0XMlOPykoGo+OA0dVJvidiARRPVwMXh+hwyb
 isQ+Ewv1XzFoWuv6vZ2iF6vDPnDBAfXRhOi0n+Xz+TsrUMpUBRHg+u5NO Q==;
X-CSE-ConnectionGUID: AyYlIl5GTbu0GTD6FcASuQ==
X-CSE-MsgGUID: WfJu64cmQcmwtndYDjyohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107664151"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="107664151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:34:26 -0700
X-CSE-ConnectionGUID: Jy1snWjFQty3WwArnlJ0BA==
X-CSE-MsgGUID: Damh3AFOSHWkRDThEIbnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260797834"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:34:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:34:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:34:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG0IJgjiGklo3Nmeqjyx92Bqdq08Z0t0FPum2QWSvOcOH3nlP7oeh5F2PnRwD4ACdkqt0gPEqHXwtV7LQualW9guhBSZq70YwpFRv75ct1jcN8H8lf0MeQVpXyKhNXhfzewXY94MPyccvYcp7A+p/KaWmH4HmlVRpGLX0iHCDSolsnoZj8BfbeLxUUGmSfMSN4E1Zpiz/jNX+97L6+f0PXPLF56S3kyh74kYDDFUGULPglpP189fb6s0/pf+ZzyXe+vMiCA2l/iiWtgAZUSGWrjm+BsaVayWyOOfW5DZS5JdQeUVbW4H55DXlnAFYJmUL2dFFhgA395V8QyGqWrB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7YiJXVxYmhA08QaA58QOElUaQboRBnDyRdGx5GRmXc=;
 b=mA5jT7FRhk8okUJVxtmjLWk4mYGykdMP760ziO/wCLFfUALDd2kR+8qk//psCydinoUrxvAU3E19FTcg5MrtVyGwV9YMyGmWid3a7Qb5jq+tCYRg2lnJUQQgG+LwJvlQLhT6j+PL5G7k3EikvpMAaUPomz9kwZLxNOMV+J+zNBfWo0BLqbDi37bg/gNyeYpQKy5+4O5wRyU5vggEn2Qz/6c1V1ldV7ElqSex+PU0/sbsS69fYc4jy2bUsSL/p+7kx611WLT0nX8FpGpfijK6QjXnuJiINaVPUnQuAV3HwOTsEFw9AmkCgtlJOEPYjmuHN4SoTBn3XRAnquD8TUu2eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 13:34:17 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:34:17 +0000
Message-ID: <78e97f99-ecb6-4e32-8cd5-dc522cbcac96@intel.com>
Date: Thu, 16 Jul 2026 19:04:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Add knob to wedge on first page fault
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
References: <20260716051413.3626570-1-arvind.yadav@intel.com>
 <alhxjBaQ4HBIea3y@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <alhxjBaQ4HBIea3y@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: fa65e19d-45de-419c-c59e-08dee33eeef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10086099003|11063799006|4143699003|22082099003|6133799003|10067099003|56012099006|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info: FQoOhkKH21fbA2YPB4pLIn0df/zu65qfInn+KtuylKaVsz72xfc8/IgcjeHFBoW5ILlOx9gOhDzyhHL73HK7la2Q2/dJXjVSzhcKxtHKpL7O2XDIfvg9sCiMC6svpnWdBCRfHo8iIUYqzAwCry4gzmqb+e1TMDCxzZJA8ZnYt4zHQV1jAc0kss/6LoMPkHjBL+jnqDeSAWT2dSDtTd43AJiDfR4a6gNyusuSjjPtMQIma7wnxq5X1bt4Kox2jeBLQqkFEEkHLxhYBdudXm+smERo0EIKnwceZbY5tBJ3b46LmBh/Uqwo9pjVi6OnB6ZIn/kE/Iel2ol4UwtZ5QJ5NnwvqJ2POeJfUt9a7h7Y3ATJLBKH4CycdQj78keaCCmyhGKVP/WLNDaMzOG6CAt7wukxD2KRd6ynxjsXcCe0C7N6NBPjeM8Gjp4L9MoSeuTXwYM5cKpJ6czW1ino2A7cQpzSOoEBot97sS9tkyAYrIRYygpiCJeCR8OiHdysBXdmdXjs6Tre4KCaWcSk9MEVIMBgaaFtoLSeDcOmL57qJaZA9o/sdDQdTjaDNtyJGZ2+uy+s2wZp+2HQXKVyaDu92Dil2Y3MlrcyrBYTtDRw8Wovgvdk9Zpti167RYefl/JivTZtjicPGr5J42mDA9Q+F89sghCr64mGKIK69XcE1Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10086099003)(11063799006)(4143699003)(22082099003)(6133799003)(10067099003)(56012099006)(18092099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdVTXNPT0lxR1Yxd0RURWpFQVlLZWVwWjFCd2ljN0huL3Rva0dSZGJxbVdx?=
 =?utf-8?B?c1VPZk1wODFSK21TeFVwd2ovYUg3TldvRWZ3RU1SVlFLRXB3NUhFSGpydmFl?=
 =?utf-8?B?dEV2bUxiU0ZjNFpYbkl6WmNHUWZKTllidTg3bENUWlhYOHJPM3BBdFZJby9s?=
 =?utf-8?B?c3pZRW52c1VhdDZlL09Wc2pmaitIOXNQaFJ6c0pGblE3T1ZrUGFoak5DNFRv?=
 =?utf-8?B?c0YyZkFCNmpTbldWaXdGVzhERTdnSTh2VUxaakJPL3RhTkxzQjlTLzdiS3NX?=
 =?utf-8?B?R3gvbDdpdkllSld6VVBvMXBkWnlEUGJtcEp1a3JaRUdLRUFVc3o2UlUvWGh1?=
 =?utf-8?B?NHlDUDZZSnNyVDZ1UG5lV0NRR2gvcDJ6N05UWnpFRzdHalhkbEdZaFhDaWRK?=
 =?utf-8?B?ZzI0Y2FtTDdlYzJIRVFlK0ZBbVcyK3pCek9sNW5objl1eU1EOWJpb096cGIw?=
 =?utf-8?B?UEYvQjhqV2FHMVN3QXRMM0s1UmZkbVNSTTdlRGhiYjRreTZhNEpVL0xIOE01?=
 =?utf-8?B?aEtrNDNvem9ZZk1mMGlQR1ZqNmhxZHNlMlRaR2ZYOFFrU3U2T0VEc05sSnJJ?=
 =?utf-8?B?TkNuYkJCZ0hhY3RSTFJtS0Y3SG5nSHM5d2QzWElBNlhUV1J5WW1kcU93bXRU?=
 =?utf-8?B?Si9KWUV0THJVVkFMb3lWaHBhcUVNUnNvdXVFeHZWODdSVVhQTDNlOG1wbG52?=
 =?utf-8?B?bFhhTjdyMnBmdi9Ja3B1bE9tL0lqTmxUOUo3K0hBMTJDVWVyaEhxWE5ldXNM?=
 =?utf-8?B?TWFLRVQrTW9MQkVBMHZ0TDRoMkN5TjI0a2lRNThMOXhHSFNqd2FLdWpnMzds?=
 =?utf-8?B?VTlsVlJaVkNZT0U1d3N4TStuVHJ4cHVDbUY1c0hWaDFqNjF3Q2xIRzdnaDlh?=
 =?utf-8?B?WW55OUFUU0wvTnd3Q1FxOGJYRHcyT0JkTlE0bGxHVXRHZzFMeWhLYmJMOTdu?=
 =?utf-8?B?bTQ2V2VvK0g2UmFzaGY1bk03QWQwS1RzdXRKeHhKSHUyd01sTXZaRVJBRVdT?=
 =?utf-8?B?U2t6NHZlT1lrVEZiYTJlOGl5SDY0T2ZEcDlSUzJQcW81V3lTTXhmbFVZWnZU?=
 =?utf-8?B?OGlEQ3VqWFVVNzRhOTVrN0NVeGZTL2VmMkE3aGdVQXNsMTJwVHVzb1FMM01j?=
 =?utf-8?B?QlpkbWdGbjBGNUVuRERHb0hqZkNzQUcvRGh3YThZaGQxdllDSGR2SFB6bWps?=
 =?utf-8?B?L2hGTkEyT2VkRnJLQi9WdUlBZE0zV2t3Y3dpTlJMdzAyQlNudk1LWDd6ZVpa?=
 =?utf-8?B?RHpqTEt4UCtQZm9YQWtHNzVLSlY3bVdEU3B0OEJGY1JiRGR5OEk4QTBxWW1H?=
 =?utf-8?B?Qk1ZcXBMaEF0VVBHcEpvS1EyaVhBbWxxR1UrcGY5UkdZM2Z5eTc0UUR1c1pY?=
 =?utf-8?B?V1dmR2pVTmc5VXBXdmpWL0dJSDBOS1pnTFFPZ3VDVndPTFVSanBkdGtTSUUw?=
 =?utf-8?B?cGhYVTM4ZlU5NFlPK2dVcWFtOXJLRnhnaGR3bytocXh0UHFQNWd5WG9NMXVq?=
 =?utf-8?B?VjNEQjNBUzkzV2lBUXo4dVhYRVlWWmNrSkdzL0FidDRZcFkxQ25NWGJuNmlC?=
 =?utf-8?B?M2VJWGZ1TnNlVjBpK3dJN3hsOU9wT0FJbHFLTW5lK3JkdlhRSkVvYU54b3RB?=
 =?utf-8?B?bVVEdXBxS3NLQUp6NUJCZnRoaHkyeDQwM0tDdmNDTW4zNnFaMGE3UmhFUFJQ?=
 =?utf-8?B?eWdoN2lWMCtpQjlzVmVWbzAzQWhmaWN6MHBpRlUwZlo0RFA1cGRqUUtLQzBK?=
 =?utf-8?B?WDRUZ0s0TUtzUm1HRjFaMWNPQjJQQTJZQk9LN2ZJMlNPcWE2b0dRUWxEaFZC?=
 =?utf-8?B?dVJ4WGh0Snd1VGNSU1hHMXBjbGdwRW1HVWxGSHRxUk4vOCtwK1VMa0wvdDJr?=
 =?utf-8?B?Sm9zTmMzQk9SMGFwWlFRa1VEalRNZGFUcytWK3JTYTRNQWM1ODY1NDA5Z1Nh?=
 =?utf-8?B?dllMb1NkY3ZEOW00U25YQ08rSUxhaFZPdzdzMk00dUh5U2oyaCt6am5CNXJY?=
 =?utf-8?B?Z28yRGlOT1VvZnl3MDNoVDdhWEUxcXBITnFhdG1MQVJxNGtGamcyZi93K0lZ?=
 =?utf-8?B?dWVSZm1PcUVnWGs3QlR5U2FCaWFSbDUvaUdFMGlESW9PcDlUVnRHaTByLzE5?=
 =?utf-8?B?UFJtSklaL25XTTlXLzV1M3ZDWXpIV2VLOVZzUGZZaXJvUkVRQmJwRlVTWjFq?=
 =?utf-8?B?NVRHNWhGTUlSWWZwdUpDVkh3K2Y2L2RlcXhkbVNaUFRwM2RKRkZ0QzN2MHJj?=
 =?utf-8?B?SDdZeEdOT2k1d3RLK2xZQzJDcklRSnFhNms2Zm1uVWovN3lCYlZLMStueG16?=
 =?utf-8?B?cFdxODh0NHR3a1E2KzA1L2t1bzI4QmVBbC9tOUdFZHB4TzJHZnl6UT09?=
X-Exchange-RoutingPolicyChecked: Tw8wDvgykmEHEJLSu5qPkSvfnjZRyAe75Iqhbi9nn8IAj6oJULtF5IHVukKQ1AmKwDr6gEmq+t8O+TLXcS/dSMg3NTM0rixxFKEl/MYgI6UK71F2QOfPqgnifXWNJ91OjqFTeykhkHTv7hdkZGFKXgMm1sDldi29lb4Vqkh0Fr5BEC1LUdroWENKRznAEZPchITpRsjSxATqOZxG47VhxkVDsuTjFYzv6x4yR6eLKYAs/kaIYROpyiSGeFIgI5LtARhrRYn7Npt2yjZ9MpSk+3Y0TVFXOltc52grTy8XmwtDcnIBIF+MrB3+cvij59C15gFEGu/jP/vvKl7WqrO2VQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa65e19d-45de-419c-c59e-08dee33eeef1
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:34:17.4150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyOiFg7W/yICNvFFDzatbKHTY2+4v9EFw0Qu+ejUAsIKln+J5yhIk7Xto1zQtLXsjRedUPMRc2/q98ftYD4k3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
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


On 16-07-2026 11:22, Matthew Brost wrote:
> On Thu, Jul 16, 2026 at 10:44:13AM +0530, Arvind Yadav wrote:
>> Add a debugfs knob to wedge the device on the first GPU page fault.
>>
>> This is intended for debug where preserving the faulting HW
>> state is more useful than servicing the fault. When enabled,
>> the first page fault is printed, saved to the VM fault list,
>> and the device is declared wedged without servicing or acknowledging
>> the fault.
>>
>>    echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      | 42 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++
>>   drivers/gpu/drm/xe/xe_pagefault.c    | 23 +++++++++++++++
>>   3 files changed, 77 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 8c391c7b017a..d22f73241d89 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -564,6 +564,43 @@ static const struct file_operations disable_late_binding_fops = {
>>   	.write = disable_late_binding_set,
>>   };
>>   
>> +static ssize_t wedge_on_first_pagefault_show(struct file *f, char __user *ubuf,
>> +					     size_t size, loff_t *pos)
>> +{
>> +	struct xe_device *xe = file_inode(f)->i_private;
>> +	char buf[8];
>> +	int len;
>> +
>> +	len = scnprintf(buf, sizeof(buf), "%d\n",
>> +			READ_ONCE(xe->wedge_on_first_pagefault) ? 1 : 0);
>> +
>> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>> +}
>> +
>> +static ssize_t wedge_on_first_pagefault_set(struct file *f,
>> +					    const char __user *ubuf,
>> +					    size_t size, loff_t *pos)
>> +{
>> +	struct xe_device *xe = file_inode(f)->i_private;
>> +	bool val;
>> +	int ret;
>> +
>> +	ret = kstrtobool_from_user(ubuf, size, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	WRITE_ONCE(xe->wedge_on_first_pagefault, val);
>> +	atomic_set(&xe->pf_wedge_triggered, 0);
>> +
>> +	return size;
>> +}
>> +
>> +static const struct file_operations wedge_on_first_pagefault_fops = {
>> +	.owner = THIS_MODULE,
>> +	.read = wedge_on_first_pagefault_show,
>> +	.write = wedge_on_first_pagefault_set,
>> +};
>> +
>>   void xe_debugfs_register(struct xe_device *xe)
>>   {
>>   	struct ttm_device *bdev = &xe->ttm;
>> @@ -617,6 +654,11 @@ void xe_debugfs_register(struct xe_device *xe)
>>   	debugfs_create_file("disable_late_binding", 0600, root, xe,
>>   			    &disable_late_binding_fops);
>>   
>> +	/* Debug: wedge on first page fault to freeze HW state for inspection. */
>> +	if (xe->info.has_usm)
>> +		debugfs_create_file("wedge_on_first_pagefault", 0600, root, xe,
>> +				     &wedge_on_first_pagefault_fops);
>> +
>>   	/*
>>   	 * Don't expose page reclaim configuration file if not supported by the
>>   	 * hardware initially.
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 022e08205897..c208b99fc577 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -530,6 +530,18 @@ struct xe_device {
>>   	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
>>   	u32 min_run_period_pf_ms;
>>   
>> +	/**
>> +	 * @wedge_on_first_pagefault: Debug knob to wedge device on first GPU
>> +	 * page fault instead of recovery, freezing HW state for inspection.
>> +	 */
>> +	bool wedge_on_first_pagefault;
>> +
>> +	/**
>> +	 * @pf_wedge_triggered: One-shot latch preventing repeated wedge
>> +	 * handling.
>> +	 */
>> +	atomic_t pf_wedge_triggered;
> I'd scope these variables in sub-struct somewhere.
>
> We already have this in xe_device:
>
> 546         /** @wedged: Struct to control Wedged States and mode */
> 547         struct {
> 548                 /** @wedged.flag: Xe device faced a critical error and is now blocked. */
> 549                 atomic_t flag;
> 550                 /** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> 551                 enum xe_wedged_mode mode;
> 552                 /** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> 553                 unsigned long method;
> 554                 /** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> 555                 bool inconsistent_reset;
> 556         } wedged;
>
> Seems like a good place.


Noted, I will move the debug fields under xe->wedged.


>
>> +
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/**
>>   	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index dd3c068e1a39..82496c5511b3 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -299,11 +299,34 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>   	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>>   
>>   	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
>> +		struct xe_device *xe;
>>   		int err;
>>   
>>   		if (!pf.gt)	/* Fault squashed during reset */
>>   			continue;
>>   
>> +		xe = gt_to_xe(pf.gt);
>> +
>> +		/*
>> +		 * Debug mode: if armed via debugfs, wedge on first fault instead of
>> +		 * servicing. Dumps fault info and freezes HW for inspection.
>> +		 */
>> +		if (unlikely(READ_ONCE(xe->wedge_on_first_pagefault))) {
>> +			if (!atomic_xchg(&xe->pf_wedge_triggered, 1)) {
> Do we want want a devcoredump too?


No, I did not add devcoredump  since that wasn't part of the ask.

>
>> +				xe_pagefault_print(&pf);
>> +				xe_gt_err(pf.gt,
>> +					"wedge_on_first_pagefault: freezing HW after first fault\n");
>> +				xe_pagefault_save_to_vm(xe, &pf);
> xe_pagefault_save_to_vm isn't particularly useful, as it attaches a
> fault to the VM that can be retrieved via an ioctl, but wedging disables
> all ioctls, iirc.


Agreed, I will drop. Since wedging blocks ioctls, saving the fault to VM 
is not useful here. The dmesg PF print should be enough for this debug path.

>
>> +				xe_device_declare_wedged(xe);
> xe_device_declare_wedged has some issues with directly stopping and
> starting queues in the GuC backend. Those should probably be fixed as
> part of this series, as this change will likely make that bug more
> noticeable.
>
> See xe_guc_submit_wedge():
>
> 1353         } else {
> 1354                 /* Forcefully kill any remaining exec queues, signal fences */
> 1355                 guc_submit_reset_prepare(guc);
> 1356                 xe_guc_submit_stop(guc);
> 1357                 xe_guc_softreset(guc);
> 1358                 xe_uc_fw_sanitize(&guc->fw);
> 1359                 xe_guc_submit_pause_abort(guc);
> 1360         }
>
>
> The above code is only safe to run on the GT ordered workqueue. I have a
> Jira somewhere to clean this up and add some lockdep checks so we can
> catch cases where someone incorrectly stops or starts queues.
>
> As a quick fix, we could simply move this code into a work item and
> schedule it asynchronously on the GT ordered workqueue.


Agreed. I will move the actual wedge call out of the PF worker and queue 
it on the GT ordered workqueue. That keeps this debug path aligned with 
the GuC queue stop/start requirement.

Thanks,
Arvind

>
> Matt
>
>> +			}
>> +
>> +			/*
>> +			 * Do not service or ack. Stop processing this queue so the
>> +			 * captured state stays close to the first fault.
>> +			 */
>> +			return;
>> +		}
>> +
>>   		err = xe_pagefault_service(&pf);
>>   		if (err) {
>>   			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>> -- 
>> 2.43.0
>>
