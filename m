Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D91FD0623
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 06:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5410E243;
	Wed, 11 Mar 2026 06:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naQMpBTr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108810E243
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773210866; x=1804746866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qy36CyK2c/blutjVkgIeFOEaOCyrE/WKBmuQVsKbNA4=;
 b=naQMpBTrZSqKpCRC8rhM5yC6RCAluDiBCsEY1Gjn06WI66bW4Q3i5F+O
 nN6zeGDUt8mfHurcznx78dHj3WRwWZzGleqAXanl2aU7uiSXiGcz1+OR8
 OtrZQzTxzmsXCS4s+X766WAjP0y+8k4pJn6CthYMz33zkRv2b/al27OnR
 qzu/EbZlf39VbZ+fHiwsV1ovlxnAkgTeKHKZ0KJ535OnbInZ+STcyCDoj
 aHQA8Q2nqWpk08XNXnypRQToYoPBUobeS3wKEht1ISil2srZioZQB8hDo
 Vd40F11xwWt6lifxPGqToLGLvANzv2A3Sj28NwzPhchVL1gYCqtzdKBdt w==;
X-CSE-ConnectionGUID: l3WmM2ijRLaBVlCJXh2zGg==
X-CSE-MsgGUID: odR+Q1GeTpWC9Lw0MZbNhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78125549"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="78125549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:34:25 -0700
X-CSE-ConnectionGUID: uhe+kEGpRECxe7dlCzdKTg==
X-CSE-MsgGUID: LfLTQzOYTgiyFi7iCuqk7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217853061"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:34:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:34:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 23:34:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrDqRLo+0mVwX2dFkP97Jy6TLGZolewc7JX/F8peLKhXEQmg3C2TTxDQYGdD3wemAOsxm1ewqcz0tA2KZyFKztNPuHpQWOPjrkqFQ8ygpvPQrS3QJObwew5P71eiPxAehTXUgwUlDWhZbM/EqQcTy91GgryGk7Mc31WEKSzbsJGUcdKLS4qZ3aZpv8jdjCg3klrVnocCDKUp7qbBjMoFgX5Rr2v+9p2eJXCRNhBEeiQAop9sIN8qGBVuqtYZ5SRqtbS43I+yzlL65XaN3IgR5lxiQgkK6DzqWgYwfbRrm1l2uGZ4Uk9MV85W9HO/Lvgrl2XxHAV+WLFqYwPJ3yXdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xwPEf4B6A/Ij9zyaen4kkGHrhnMZFq5HB9HU88XZ1k=;
 b=m9S/LNXGzHg19q3VMD41gQkk7hZsperlX7SNbHhbiBfGsKvEfTHiJTyGhDlGDeHKVA5R+QrW8MwBPMFRNcNhxNn7dvGUBFZ0NTYzWZdGdxdnUL6KbEs/6QAczaKO3xdyTcmRRXpm8Xi5RJ/ArKnZqMm69OGAR4TlXCsy6WNmWTPBgGDnKCj9ek597JzeJyaCaPvoFPa0kccH439REnyr9TsCZb4XQRFssI/nXXLSSMbE7G51X/EVcjP+TGhnyUeAn507Ql2vhOX67qYQWDYj3xhTSG4y4LbmT5Hj2uU1hidrwnxGH9ja42KyNZf6zglh7/R4p3/AXroS+NGqGNiETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 06:34:21 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:34:21 +0000
Message-ID: <1f682dd9-ea2d-44ca-b024-62a599ebe368@intel.com>
Date: Wed, 11 Mar 2026 12:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/7] drm/xe/vm: Add madvise autoreset interval notifier
 worker infrastructure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-5-arvind.yadav@intel.com>
 <aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com>
 <70f3a306-15e4-4eb1-82da-74818f35b437@intel.com>
 <9500a8631dc402b690b4849fd482e436cb425ca8.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <9500a8631dc402b690b4849fd482e436cb425ca8.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: d5998f98-9b75-4ff7-8e6a-08de7f383a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: C+hmCepwZLescuK4E5y3tmJaeXhdG9IcIYb/7q1sHn9KmbGDSltYEAR8eavys+wpUBnJnF3SOJhHCgyMC1THaZXyUzESXOnhKgXS0TRt0gaeyZcMAlRaSCw71QMWIxJlXp0pD0lGM+zHplPieTIHk2mb5eji3sRCI11NmTN4M9cqgNHyeKSFCVGqJOsm0i34r2B3DJTqjPULcVtEUjhbRgBAiAloOK7UnoUiF+GHysqYjVTvCSbl8J51xvNhtYBnsW7GAnaAvqoCzvFUJ1tQoMm2dlF272WynpgvgkQ2WKonhO1/wDn07pfEezT49EqtZ+nsTr79/TAEfMS47fj4E+fG7jE/17ALON1C9Pp36LFneqItyICvn+LVBBmqbdm4jdWwafIik5mpMw9dsdQk7xzvHQPAz34/rVz2lnPSsxdSYI8PD86742yY+46oHbLh7PQ5kDDq2qUbVUj2eAJaLob2RumG7+QEeIgz7b5ETd8iKWmKkP2Qoge8afyxQ8NDCK6cQMckHgqfX/JG6BQfj9EymHj5IbLn1ZF0DrKN3zLRxqu2zQD6H0icUMQ7KbMr6721hxNODNjnnhIg3b3KeSkZwjXbavhFnk4TnXSawN1F27HW2DE99Uct+Wjz/Rdrvkllsuulm6g8tszTgKa4Rf0TdhioO/LPwyoqyRPAkaB62UsnIomNtwwqve89KizU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TURaSnFDQzh6NGN1aTZYZTJ1RGJhQ3hNaURKQzhXaHlKU29JbDRUR1ozYUI1?=
 =?utf-8?B?b1h4MkU3cWJ3Z1BSMmVUWEZ1U3d0dHo3VGw4VUNqeDNweXkwSEhSelZEYWVJ?=
 =?utf-8?B?RGpERjRNK1BpUHlmM3VwUllNa2JjR0xRdlVwNUExcGZ1dHZxU1lQZzV2ajJ1?=
 =?utf-8?B?Sm40NWRUbnlSdkdWSGs2SGtXK2lpejNraWw2TVdFTmpSajdHRms1ZTZGWWVj?=
 =?utf-8?B?SEhVS2FEN2FnNmNZaldpRndrK01oZy9xdFpIeUU4QVFKc1Q5dkFTOU1rWWFz?=
 =?utf-8?B?RjM4OXBWTm94WEtpWU5TL080RUFWQWh5UHg3UEM3T2EyZ1lGL0NhQlBZM1dD?=
 =?utf-8?B?aTM5TG1BQkw1RmFUWlZFcFpuOFp0eHFmMVdTR2JRUmcvdDY4Z2d4MzJLd0Vo?=
 =?utf-8?B?REtpNlRiZjRDZ3k4eFV6U2FiZ2NHLzhYZWVwbktEK2FhS0VEcmZQSGdabmhG?=
 =?utf-8?B?bHU0MGgwQ2QxMjJiZGdNbmdqRVpSWUdTZHNxenpyeWlINTdmS2lEd0tVMGRI?=
 =?utf-8?B?M3IzRjhORTJBK0gybEJiZDhLK1FuSWtsUjJFT0o1Vm16NXJqUjJPYjU3YnJL?=
 =?utf-8?B?VlAwTDRIcUY1RE8xU0hQSkRjVExyYjFSU0FGVml5aHZhVlNYeW83aWpmNG5U?=
 =?utf-8?B?bnZpWkhlZzNPbEp3bllJa2NKOHJydlZTOThPeXpKV25wS1lXMFFjSjFBWlFx?=
 =?utf-8?B?NkRTUm5wTC9JTFB1YjBjaHplV1dneE1yQjIwb1pvWHFVeXI3L1VXVEQrU2Rm?=
 =?utf-8?B?d3pXUUMyamhrZi8vc3Z6cjcwdTFieUVJTm9xWkZyWFMxc3VCcFpXL2lhYWIr?=
 =?utf-8?B?N2g5d2ZqWU1WR2x4ck54KzZSQlZjUDZtYTR2a1BRTnNMOWVFR2RzUnpEY2U3?=
 =?utf-8?B?OUVlN3NCRVIyMTEra3lJZVduK01CLzB0YTE4UlFaSlNLaHdDeUs3V3RvN3h6?=
 =?utf-8?B?MHc0QXNFRTAyYUs1emtQMjg4bUVlK2lzNjFqeGdtVTNSVE0xaFdwK0FIelhB?=
 =?utf-8?B?OENiZzVGTW9HalovdWJKa2szcElxVW15TGVNcWxrMlVLMzRjQW5rNDByTGZn?=
 =?utf-8?B?WFhZVzZGOHk4K24yNjIrT2poaTFNRGJ6emNLUVU5QUdpUld1bWl2Y25jQnN1?=
 =?utf-8?B?b2RoeVA3Y2xkQkZtc1BQREZtMExJQlNjVGpENGRhd3VVajJxaGZCbzJ6ZXVO?=
 =?utf-8?B?RVBtNkh5RDFmOVQ3aUs3UWd5ZjYxNHBLUzQ0Q0FmVXNFR1FCbGQvM0t6dGFs?=
 =?utf-8?B?U2U0SVhmV3RsNnJ5WGN2T1hpQ1pVWEdaOVk2Y3lpL2VQYWJSb1ZjbGFFWnJN?=
 =?utf-8?B?dmRsOEZTNStmYlg5UHpEUkhXUkxTK0NxZnVwb1A0T2FDY3RheHRua0t1WHV6?=
 =?utf-8?B?NHFyUUdqSGN2T1MrSkx4QUVadWNkRG8rMm90dHY1UmNjaXFOU0xYMnFKOTZr?=
 =?utf-8?B?bCtVS3F5b3lYbkhFbkh1aFRKbGtBd3NqR0RQK2pEZFYvTEdnQ0ZiS0pyenRH?=
 =?utf-8?B?VUJaeFBuV0UxS0pYRDFBZW15MUJCL29peDArM0dmaEIzV2FrYkZJWm5TMjFC?=
 =?utf-8?B?ai9FWCtDSFoycEdHK3JJdHFjWnZ6NUFOR1ZnNHVZQVA2aWRmUi9vaTFRS0ZQ?=
 =?utf-8?B?cmcwK3N1Z3dYOHpwcVJ3aFNMN1UwUWpEeENGN0RWYTAvQ2tKaE9tT1JpeCtH?=
 =?utf-8?B?Qk12U1dWcW1Yb281b0xRM2xRK3E5Q3BTdXNMc2czdk9vbWlSbHFjc2RzVTZD?=
 =?utf-8?B?K3hyM3M4ejRtdnZWTVVXdCs0Q2ZwQ21VaVJibjhSc2dGdzJ3eWZZZGcrc29a?=
 =?utf-8?B?OUlpbWNpRmJiQVdmUGhEWWxDbW5SU0hid3FhYjI0elpkWlpOWnViME0vcGRN?=
 =?utf-8?B?U3E3bmZackNKUnFMcEZUdWN3UDhzK0ZFWmhJZlNyMmhNTGR1Ym1NMWQ0QXl5?=
 =?utf-8?B?YTRxdXVrZjZaR1Nac1hlcVF6TzREZ3VQRGR3WkdDL29vWXJ6Mk03TzdPY2Yw?=
 =?utf-8?B?SXBOY29kZW9JUC9LWUVWRUp0ejRMeVA3U1RQVFlnYjZWTjQ1cmwxZUZ3bnBn?=
 =?utf-8?B?b1NqM2tnd0JJdllJbUdjUkRLZWtvQTNyNG5WTjF5cTdCZmJlS2VaMnVxZTlF?=
 =?utf-8?B?blFQdlB4MytUODVsdWR3bXRjaHFEUm9veFF1NUpsbkVGTDl2aXBCeFNkTzBS?=
 =?utf-8?B?aVdkak5iNmxlYUp3WXdTT2F6QllFR3FEdmxlUVhEZ0loTk4wcXJ2SmZGUk96?=
 =?utf-8?B?cHJYZnNrWmcvbHpuYkZPeE9UUGd2SGR4M0VxWnBzcjBzb0hWTVozbkhOVmxK?=
 =?utf-8?B?NGo4WEgzdjI0SVJjUVE1ZnI2cmpQRE1VdTBWTndRMm9mcENiYjh6UT09?=
X-Exchange-RoutingPolicyChecked: f8XHOMo/9YcSFgUQdMKEbqiNLZEWS8NqfWI1ZBeaAisjPULGzlCXk0WuWeDX27I5McsJhLePBrymlFiVAHJZG9N/V6vJ/a/ekgX8kVbxArYXg3xeeeRd8jE6MrHVSQkN4ZxtrrKwwFL9rrYja3RBpcsfjF/wakTbG7ejBGsRJ6NfqbzEvtA7cXBgdA+YR3EsX7FYY8MlzMXxvXzPqyeFYsKWxGGt8gJGyDdqXplqx0I9ZEHuRJDAZay9XR3OxqT+L+z8ZDqVRAgCfX2Xzk82Vc/WMqa8vExE6xHvSx67tXjwSkHtT8OKQ1x6eGDgEWhXSr03XBz09ilPE9hEZCKaXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5998f98-9b75-4ff7-8e6a-08de7f383a8a
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 06:34:21.5530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj0dcg+mUkHel/rLwRgJ7owBtZ8q4ODCAQpZQBX6h0oxHqaWksYPSyYKSL7n++pP0U9LQjBtz0iR195VTpH5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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


On 09-03-2026 15:02, Thomas Hellström wrote:
> On Mon, 2026-03-09 at 12:37 +0530, Yadav, Arvind wrote:
>> On 26-02-2026 05:04, Matthew Brost wrote:
>>> On Thu, Feb 19, 2026 at 02:43:09PM +0530, Arvind Yadav wrote:
>>>> MADVISE_AUTORESET needs to reset VMA attributes when userspace
>>>> unmaps
>>>> CPU-only ranges, but the MMU invalidate callback cannot take vm-
>>>>> lock
>>>> due to lock ordering (mmap_lock is already held).
>>>>
>>>> Add mmu_interval_notifier that queues work items for
>>>> MMU_NOTIFY_UNMAP
>>>> events. The worker runs under vm->lock and resets attributes for
>>>> VMAs
>>>> still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-
>>>> touched).
>>>>
>>>> Work items are allocated from a mempool to handle atomic context
>>>> in the
>>>> callback. The notifier is deactivated when GPU touches the VMA.
>>>>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 394
>>>> +++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_vm_madvise.h |   8 +
>>>>    drivers/gpu/drm/xe/xe_vm_types.h   |  41 +++
>>>>    3 files changed, 443 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> index 52147f5eaaa0..4c0ffb100bcc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>> @@ -6,9 +6,12 @@
>>>>    #include "xe_vm_madvise.h"
>>>>    
>>>>    #include <linux/nospec.h>
>>>> +#include <linux/mempool.h>
>>>> +#include <linux/workqueue.h>
>>>>    #include <drm/xe_drm.h>
>>>>    
>>>>    #include "xe_bo.h"
>>>> +#include "xe_macros.h"
>>>>    #include "xe_pat.h"
>>>>    #include "xe_pt.h"
>>>>    #include "xe_svm.h"
>>>> @@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device
>>>> *dev, void *data, struct drm_file *fil
>>>>    	xe_vm_put(vm);
>>>>    	return err;
>>>>    }
>>>> +
>>>> +/**
>>>> + * struct xe_madvise_work_item - Work item for unmap processing
>>>> + * @work: work_struct
>>>> + * @vm: VM reference
>>>> + * @pool: Mempool for recycling
>>>> + * @start: Start address
>>>> + * @end: End address
>>>> + */
>>>> +struct xe_madvise_work_item {
>>>> +	struct work_struct work;
>>>> +	struct xe_vm *vm;
>>>> +	mempool_t *pool;
>>> Why mempool? Seems like we could just do kmalloc with correct gfp
>>> flags.
>>
>> I tried kmalloc first, but ran into two issues:
>> GFP_KERNEL — fails because MMU notifier callbacks must not block, and
>> GFP_KERNEL can sleep waiting for memory reclaim.
>> GFP_ATOMIC — triggers a circular lockdep warning: the MMU notifier
>> holds
>> mmu_notifier_invalidate_range_start, and GFP_ATOMIC internally tries
>> to
>> acquire fs_reclaim, which already depends on the MMU notifier lock.
>>
>> Agreed. mempool looks unnecessary here. I re-tested this with
>> kmalloc(..., GFP_NOWAIT) and that avoids both blocking and the
>> reclaim-related lockdep issue I saw with the earlier approach. I will
>> switch to that and drop the pool in the next version.
> Note that GFP_NOWAIT can only be used as a potential optimization in
> case memory happens to be available. GFP_NOWAIT is very likely to fail
> in a reclaim situation and should not be used unless there is a backup
> path. We shouldn't really try to work around lockdep problems with GFP
> flags.


Agreed. I will redesign to avoid allocation in the MMU notifier context 
entirely rather than trying to work around it with GFP flags or mempools.

Thanks,
Arvind

> /Thomas
>
>
>
>>
>>>> +	u64 start;
>>>> +	u64 end;
>>>> +};
>>>> +
>>>> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
>>>> +{
>>>> +	vma->attr.preferred_loc.devmem_fd =
>>>> DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
>>>> +	vma->attr.preferred_loc.migration_policy =
>>>> DRM_XE_MIGRATE_ALL_PAGES;
>>>> +	vma->attr.pat_index = vma->attr.default_pat_index;
>>>> +	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_vm_madvise_process_unmap - Process munmap for all VMAs in
>>>> range
>>>> + * @vm: VM
>>>> + * @start: Start of unmap range
>>>> + * @end: End of unmap range
>>>> + *
>>>> + * Processes all VMAs overlapping the unmap range. An unmap can
>>>> span multiple
>>>> + * VMAs, so we need to loop and process each segment.
>>>> + *
>>>> + * Return: 0 on success, negative error otherwise
>>>> + */
>>>> +static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64
>>>> start, u64 end)
>>>> +{
>>>> +	u64 addr = start;
>>>> +	int err;
>>>> +
>>>> +	lockdep_assert_held_write(&vm->lock);
>>>> +
>>>> +	if (xe_vm_is_closed_or_banned(vm))
>>>> +		return 0;
>>>> +
>>>> +	while (addr < end) {
>>>> +		struct xe_vma *vma;
>>>> +		u64 seg_start, seg_end;
>>>> +		bool has_default_attr;
>>>> +
>>>> +		vma = xe_vm_find_overlapping_vma(vm, addr, end);
>>>> +		if (!vma)
>>>> +			break;
>>>> +
>>>> +		/* Skip GPU-touched VMAs - SVM handles them */
>>>> +		if (!xe_vma_has_cpu_autoreset_active(vma)) {
>>>> +			addr = xe_vma_end(vma);
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +		has_default_attr =
>>>> xe_vma_has_default_mem_attrs(vma);
>>>> +		seg_start = max(addr, xe_vma_start(vma));
>>>> +		seg_end = min(end, xe_vma_end(vma));
>>>> +
>>>> +		/* Expand for merging if VMA already has default
>>>> attrs */
>>>> +		if (has_default_attr &&
>>>> +		    xe_vma_start(vma) >= start &&
>>>> +		    xe_vma_end(vma) <= end) {
>>>> +			seg_start = xe_vma_start(vma);
>>>> +			seg_end = xe_vma_end(vma);
>>>> +			xe_vm_find_cpu_addr_mirror_vma_range(vm,
>>>> &seg_start, &seg_end);
>>>> +		} else if (xe_vma_start(vma) == seg_start &&
>>>> xe_vma_end(vma) == seg_end) {
>>>> +			xe_vma_set_default_attributes(vma);
>>>> +			addr = seg_end;
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +		if (xe_vma_start(vma) == seg_start &&
>>>> +		    xe_vma_end(vma) == seg_end &&
>>>> +		    has_default_attr) {
>>>> +			addr = seg_end;
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm,
>>>> seg_start, seg_end - seg_start);
>>>> +		if (err) {
>>>> +			if (err == -ENOENT) {
>>>> +				addr = seg_end;
>>>> +				continue;
>>>> +			}
>>>> +			return err;
>>>> +		}
>>>> +
>>>> +		addr = seg_end;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_madvise_work_func - Worker to process unmap
>>>> + * @w: work_struct
>>>> + *
>>>> + * Processes a single unmap by taking vm->lock and calling the
>>>> helper.
>>>> + * Each unmap has its own work item, so no interval loss.
>>>> + */
>>>> +static void xe_madvise_work_func(struct work_struct *w)
>>>> +{
>>>> +	struct xe_madvise_work_item *item = container_of(w,
>>>> struct xe_madvise_work_item, work);
>>>> +	struct xe_vm *vm = item->vm;
>>>> +	int err;
>>>> +
>>>> +	down_write(&vm->lock);
>>>> +	err = xe_vm_madvise_process_unmap(vm, item->start, item-
>>>>> end);
>>>> +	if (err)
>>>> +		drm_warn(&vm->xe->drm,
>>>> +			 "madvise autoreset failed [%#llx-
>>>> %#llx]: %d\n",
>>>> +			 item->start, item->end, err);
>>>> +	/*
>>>> +	 * Best-effort: Log failure and continue.
>>>> +	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
>>>> +	 */
>>>> +	up_write(&vm->lock);
>>>> +	xe_vm_put(vm);
>>>> +	mempool_free(item, item->pool);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_madvise_notifier_callback - MMU notifier callback for CPU
>>>> munmap
>>>> + * @mni: mmu_interval_notifier
>>>> + * @range: mmu_notifier_range
>>>> + * @cur_seq: current sequence number
>>>> + *
>>>> + * Queues work to reset VMA attributes. Cannot take vm->lock
>>>> (circular locking),
>>>> + * so uses workqueue. GFP_ATOMIC allocation may fail; drops
>>>> event if so.
>>>> + *
>>>> + * Return: true (never blocks)
>>>> + */
>>>> +static bool xe_madvise_notifier_callback(struct
>>>> mmu_interval_notifier *mni,
>>>> +					 const struct
>>>> mmu_notifier_range *range,
>>>> +					 unsigned long cur_seq)
>>>> +{
>>>> +	struct xe_madvise_notifier *notifier =
>>>> +		container_of(mni, struct xe_madvise_notifier,
>>>> mmu_notifier);
>>>> +	struct xe_vm *vm = notifier->vm;
>>>> +	struct xe_madvise_work_item *item;
>>>> +	struct workqueue_struct *wq;
>>>> +	mempool_t *pool;
>>>> +	u64 start, end;
>>>> +
>>>> +	if (range->event != MMU_NOTIFY_UNMAP)
>>>> +		return true;
>>>> +
>>>> +	/*
>>>> +	 * Best-effort: skip in non-blockable contexts to avoid
>>>> building up work.
>>>> +	 * Correctness does not rely on this notifier -
>>>> CPU_AUTORESET_ACTIVE flag
>>>> +	 * prevents GPU PTE zaps on CPU-only VMAs in the zap
>>>> path.
>>>> +	 */
>>>> +	if (!mmu_notifier_range_blockable(range))
>>>> +		return true;
>>>> +
>>>> +	/* Consume seq (interval-notifier convention) */
>>>> +	mmu_interval_set_seq(mni, cur_seq);
>>>> +
>>>> +	/* Best-effort: core correctness from
>>>> CPU_AUTORESET_ACTIVE check in zap path */
>>>> +
>>>> +	start = max_t(u64, range->start, notifier->vma_start);
>>>> +	end = min_t(u64, range->end, notifier->vma_end);
>>>> +
>>>> +	if (start >= end)
>>>> +		return true;
>>>> +
>>>> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
>>>> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
>>>> +	if (!pool || !wq || atomic_read(&vm-
>>>>> svm.madvise_work.closing))
>>> Can you explain the use of READ_ONCE, xchg, and atomics? At first
>>> glance
>>> it seems unnecessary or overly complicated. Let’s start with the
>>> problem
>>> this is trying to solve and see if we can find a simpler approach.
>>>
>>> My initial thought is a VM-wide rwsem, marked as reclaim-safe. The
>>> notifiers would take it in read mode to check whether the VM is
>>> tearing
>>> down, and the fini path would take it in write mode to initiate
>>> teardown...
>>
>> Agreed. This got more complicated than it needs to be. I reworked it
>> to
>> use a VM-wide rw_semaphore for teardown serialization, so the
>> atomic_t,
>> READ_ONCE(), and xchg() go away..
>>
>>>> +		return true;
>>>> +
>>>> +	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier
>>>> context */
>>>> +	item = mempool_alloc(pool, GFP_ATOMIC);
>>> Again, probably just use kmalloc. Also s/GFP_ATOMIC/GFP_NOWAIT. We
>>> really shouldn’t be using GFP_ATOMIC in Xe per the DRM docs unless
>>> a
>>> failed memory allocation would take down the device. We likely
>>> abuse
>>> GFP_ATOMIC in several places that we should clean up, but in this
>>> case
>>> it’s pretty clear GFP_NOWAIT is what we want, as failure isn’t
>>> fatal—just sub-optimal.
>>
>> Agreed. This should be |GFP_NOWAIT|, not |GFP_ATOMIC|. Allocation
>> failure here is non-fatal, so |GFP_NOWAIT| is the right fit. I willl
>> switch to |kmalloc(..., GFP_NOWAIT)| and drop the mempool.
>>
>>>> +	if (!item)
>>>> +		return true;
>>>> +
>>>> +	memset(item, 0, sizeof(*item));
>>>> +	INIT_WORK(&item->work, xe_madvise_work_func);
>>>> +	item->vm = xe_vm_get(vm);
>>>> +	item->pool = pool;
>>>> +	item->start = start;
>>>> +	item->end = end;
>>>> +
>>>> +	if (unlikely(atomic_read(&vm-
>>>>> svm.madvise_work.closing))) {
>>> Same as above the atomic usage...
>>
>> Noted, Will remove.
>>
>>>> +		xe_vm_put(item->vm);
>>>> +		mempool_free(item, pool);
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	queue_work(wq, &item->work);
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +static const struct mmu_interval_notifier_ops
>>>> xe_madvise_notifier_ops = {
>>>> +	.invalidate = xe_madvise_notifier_callback,
>>>> +};
>>>> +
>>>> +/**
>>>> + * xe_vm_madvise_init - Initialize madvise notifier
>>>> infrastructure
>>>> + * @vm: VM
>>>> + *
>>>> + * Sets up workqueue and mempool for async munmap processing.
>>>> + *
>>>> + * Return: 0 on success, -ENOMEM on failure
>>>> + */
>>>> +int xe_vm_madvise_init(struct xe_vm *vm)
>>>> +{
>>>> +	struct workqueue_struct *wq;
>>>> +	mempool_t *pool;
>>>> +
>>>> +	/* Always initialize list and mutex - fini may be called
>>>> on partial init */
>>>> +	INIT_LIST_HEAD(&vm->svm.madvise_notifiers.list);
>>>> +	mutex_init(&vm->svm.madvise_notifiers.lock);
>>>> +
>>>> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
>>>> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
>>>> +
>>>> +	/* Guard against double initialization and detect
>>>> partial init */
>>>> +	if (wq || pool) {
>>>> +		XE_WARN_ON(!wq || !pool);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
>>>> +	WRITE_ONCE(vm->svm.madvise_work.pool, NULL);
>>>> +	atomic_set(&vm->svm.madvise_work.closing, 1);
>>>> +
>>>> +	/*
>>>> +	 * WQ_UNBOUND: best-effort optimization, not critical
>>>> path.
>>>> +	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops
>>>> with GFP_KERNEL).
>>>> +	 * Not on reclaim path - merely resets attributes after
>>>> munmap.
>>>> +	 */
>>>> +	vm->svm.madvise_work.wq = alloc_workqueue("xe_madvise",
>>>> WQ_UNBOUND, 0);
>>>> +	if (!vm->svm.madvise_work.wq)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* Mempool for GFP_ATOMIC allocs in notifier callback */
>>>> +	vm->svm.madvise_work.pool =
>>>> +		mempool_create_kmalloc_pool(64,
>>>> +					     sizeof(struct
>>>> xe_madvise_work_item));
>>>> +	if (!vm->svm.madvise_work.pool) {
>>>> +		destroy_workqueue(vm->svm.madvise_work.wq);
>>>> +		WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	atomic_set(&vm->svm.madvise_work.closing, 0);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_vm_madvise_fini - Cleanup all madvise notifiers
>>>> + * @vm: VM
>>>> + *
>>>> + * Tears down notifiers and drains workqueue. Safe if init
>>>> partially failed.
>>>> + * Order: closing flag → remove notifiers (SRCU sync) → drain wq
>>>> → destroy.
>>>> + */
>>>> +void xe_vm_madvise_fini(struct xe_vm *vm)
>>>> +{
>>>> +	struct xe_madvise_notifier *notifier, *next;
>>>> +	struct workqueue_struct *wq;
>>>> +	mempool_t *pool;
>>>> +	LIST_HEAD(tmp);
>>>> +
>>>> +	atomic_set(&vm->svm.madvise_work.closing, 1);
>>>> +
>>>> +	/*
>>>> +	 * Detach notifiers under lock, then remove outside lock
>>>> (SRCU sync can be slow).
>>>> +	 * Splice avoids holding mutex across
>>>> mmu_interval_notifier_remove() SRCU sync.
>>>> +	 * Removing notifiers first (before drain) prevents new
>>>> invalidate callbacks.
>>>> +	 */
>>>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
>>>> +	list_splice_init(&vm->svm.madvise_notifiers.list, &tmp);
>>>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>>>> +
>>>> +	/* Now remove notifiers without holding lock -
>>>> mmu_interval_notifier_remove() SRCU-syncs */
>>>> +	list_for_each_entry_safe(notifier, next, &tmp, list) {
>>>> +		list_del(&notifier->list);
>>>> +		mmu_interval_notifier_remove(&notifier-
>>>>> mmu_notifier);
>>>> +		xe_vm_put(notifier->vm);
>>>> +		kfree(notifier);
>>>> +	}
>>>> +
>>>> +	/* Drain and destroy workqueue */
>>>> +	wq = xchg(&vm->svm.madvise_work.wq, NULL);
>>>> +	if (wq) {
>>>> +		drain_workqueue(wq);
>>> Work items in wq call xe_madvise_work_func, which takes vm->lock in
>>> write mode. If we try to drain here after the work item executing
>>> xe_madvise_work_func has started or is queued, I think we could
>>> deadlock. Lockdep should complain about this if you run a test that
>>> triggers xe_madvise_work_func at least once — or at least it
>>> should. If
>>> it doesn’t, then workqueues likely have an issue in their lockdep
>>> implementation as 'drain_workqueue' should touch its lockdep map
>>> which
>>> has tainted vm->lock (i.e., is outside of it).
>>>
>>> So perhaps call this function without vm->lock and take as need in
>>> the
>>> this function, then drop it drain the work queue, etc...
>>
>> Good catch. Draining the workqueue while holding |vm->lock| can
>> deadlock
>> against a worker that takes |vm->lock|. I fixed that by dropping
>>> vm->lock| before |xe_vm_madvise_fini()|. In the reworked teardown
>>> path,
>>> drain_workqueue()| runs with neither |vm->lock| nor the teardown
>> semaphore held.
>>
>>
>>>> +		destroy_workqueue(wq);
>>>> +	}
>>>> +
>>>> +	pool = xchg(&vm->svm.madvise_work.pool, NULL);
>>>> +	if (pool)
>>>> +		mempool_destroy(pool);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_vm_madvise_register_notifier_range - Register MMU notifier
>>>> for address range
>>>> + * @vm: VM
>>>> + * @start: Start address (page-aligned)
>>>> + * @end: End address (page-aligned)
>>>> + *
>>>> + * Registers interval notifier for munmap tracking. Uses
>>>> addresses (not VMA pointers)
>>>> + * to avoid UAF after dropping vm->lock. Deduplicates by range.
>>>> + *
>>>> + * Return: 0 on success, negative error code on failure
>>>> + */
>>>> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64
>>>> start, u64 end)
>>>> +{
>>>> +	struct xe_madvise_notifier *notifier, *existing;
>>>> +	int err;
>>>> +
>>> I see this isn’t called under the vm->lock write lock. Is there a
>>> reason
>>> not to? I think taking it under the write lock would help with the
>>> teardown sequence, since you wouldn’t be able to get here if
>>> xe_vm_is_closed_or_banned were stable—and we wouldn’t enter this
>>> function if that helper returned true.
>>
>> I can make the closed/banned check stable at the call site under
>>> vm->lock|, but I don’t think I can hold it across
>>> mmu_interval_notifier_insert()| itself since that may take
>>> |mmap_lock|
>> internally. I’ll restructure this so the state check happens under
>>> vm->lock|, while the actual insert remains outside that lock.
>>>> +	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end,
>>>> PAGE_SIZE))
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (WARN_ON_ONCE(end <= start))
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (atomic_read(&vm->svm.madvise_work.closing))
>>>> +		return -ENOENT;
>>>> +
>>>> +	if (!READ_ONCE(vm->svm.madvise_work.wq) ||
>>>> +	    !READ_ONCE(vm->svm.madvise_work.pool))
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* Check mm early to avoid allocation if it's missing */
>>>> +	if (!vm->svm.gpusvm.mm)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Dedupe: check if notifier exists for this range */
>>>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
>>> If we had the vm->lock in write mode we could likely just drop
>>> svm.madvise_notifiers.lock for now, but once we move to fine
>>> grained
>>> locking in page faults [1] we'd in fact need a dedicated lock. So
>>> let's
>>> keep this.
>>>
>>> [1]
>>> https://patchwork.freedesktop.org/patch/707238/?series=162167&rev=2
>>
>> Agreed. We should keep a dedicated lock here.
>>
>> I donot think |vm->lock| can cover |mmu_interval_notifier_insert()|
>> itself, since that path may take |mmap_lock| internally and would
>> risk
>> inverting the existing |mmap_lock -> vm->lock| ordering.
>>
>> So I will keep |svm.madvise_notifiers.lock| in place. That also lines
>> up
>> better with the planned fine-grained page-fault locking work.
>>
>>>> +	list_for_each_entry(existing, &vm-
>>>>> svm.madvise_notifiers.list, list) {
>>>> +		if (existing->vma_start == start && existing-
>>>>> vma_end == end) {
>>> This is O(N) which typically isn't ideal. Better structure here?
>>> mtree?
>>> Does an mtree have its own locking so svm.madvise_notifiers.lock
>>> could
>>> just be dropped? I'd look into this.
>>
>> Agreed. I switched this over to a maple tree, so the exact-range
>> lookup
>> is no longer O(N). That also lets me drop the list walk in the
>> duplicate
>> check.
>>
>>>> +			mutex_unlock(&vm-
>>>>> svm.madvise_notifiers.lock);
>>>> +			return 0;
>>>> +		}
>>>> +	}
>>>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>>>> +
>>>> +	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
>>>> +	if (!notifier)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	notifier->vm = xe_vm_get(vm);
>>>> +	notifier->vma_start = start;
>>>> +	notifier->vma_end = end;
>>>> +	INIT_LIST_HEAD(&notifier->list);
>>>> +
>>>> +	err = mmu_interval_notifier_insert(&notifier-
>>>>> mmu_notifier,
>>>> +					   vm->svm.gpusvm.mm,
>>>> +					   start,
>>>> +					   end - start,
>>>> +					
>>>> &xe_madvise_notifier_ops);
>>>> +	if (err) {
>>>> +		xe_vm_put(notifier->vm);
>>>> +		kfree(notifier);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	/* Re-check closing to avoid teardown race */
>>>> +	if (unlikely(atomic_read(&vm-
>>>>> svm.madvise_work.closing))) {
>>>> +		mmu_interval_notifier_remove(&notifier-
>>>>> mmu_notifier);
>>>> +		xe_vm_put(notifier->vm);
>>>> +		kfree(notifier);
>>>> +		return -ENOENT;
>>>> +	}
>>>> +
>>>> +	/* Add to list - check again for concurrent registration
>>>> race */
>>>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
>>> If we had the vm->lock in write mode, we couldn't get concurrent
>>> registrations.
>>>
>>> I likely have more comments, but I have enough concerns with the
>>> locking
>>> and structure in this patch that I’m going to pause reviewing the
>>> series
>>> until most of my comments are addressed. It’s hard to focus on
>>> anything
>>> else until we get these issues worked out.
>>
>> I think the main issue is exactly the locking story around notifier
>> insert/remove. We cannot hold |vm->lock| across
>>> mmu_interval_notifier_insert()| because that may take |mmap_lock|
>> internally and invert the existing ordering.
>>
>> I have reworked this to simplify the teardown/registration side: drop
>> the atomic/READ_ONCE/xchg handling, use a single teardown |rwsem|,
>> and
>> replace the list-based dedupe with a maple tree.
>> I will send a cleaned-up version with the locking documented more
>> clearly. Sorry for the churn here.
>>
>>
>> Thanks,
>> Arvind
>>
>>> Matt
>>>
>>>> +	list_for_each_entry(existing, &vm-
>>>>> svm.madvise_notifiers.list, list) {
>>>> +		if (existing->vma_start == start && existing-
>>>>> vma_end == end) {
>>>> +			mutex_unlock(&vm-
>>>>> svm.madvise_notifiers.lock);
>>>> +			mmu_interval_notifier_remove(&notifier-
>>>>> mmu_notifier);
>>>> +			xe_vm_put(notifier->vm);
>>>> +			kfree(notifier);
>>>> +			return 0;
>>>> +		}
>>>> +	}
>>>> +	list_add(&notifier->list, &vm-
>>>>> svm.madvise_notifiers.list);
>>>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> index b0e1fc445f23..ba9cd7912113 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>> @@ -6,10 +6,18 @@
>>>>    #ifndef _XE_VM_MADVISE_H_
>>>>    #define _XE_VM_MADVISE_H_
>>>>    
>>>> +#include <linux/types.h>
>>>> +
>>>>    struct drm_device;
>>>>    struct drm_file;
>>>> +struct xe_vm;
>>>> +struct xe_vma;
>>>>    
>>>>    int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>>>    			struct drm_file *file);
>>>>    
>>>> +int xe_vm_madvise_init(struct xe_vm *vm);
>>>> +void xe_vm_madvise_fini(struct xe_vm *vm);
>>>> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64
>>>> start, u64 end);
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> index 29ff63503d4c..eb978995000c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> @@ -12,6 +12,7 @@
>>>>    
>>>>    #include <linux/dma-resv.h>
>>>>    #include <linux/kref.h>
>>>> +#include <linux/mempool.h>
>>>>    #include <linux/mmu_notifier.h>
>>>>    #include <linux/scatterlist.h>
>>>>    
>>>> @@ -29,6 +30,26 @@ struct xe_user_fence;
>>>>    struct xe_vm;
>>>>    struct xe_vm_pgtable_update_op;
>>>>    
>>>> +/**
>>>> + * struct xe_madvise_notifier - CPU madvise notifier for memory
>>>> attribute reset
>>>> + *
>>>> + * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
>>>> + * When userspace unmaps CPU memory, this notifier processes
>>>> attribute reset
>>>> + * via work queue to avoid circular locking (can't take vm->lock
>>>> in callback).
>>>> + */
>>>> +struct xe_madvise_notifier {
>>>> +	/** @mmu_notifier: MMU interval notifier */
>>>> +	struct mmu_interval_notifier mmu_notifier;
>>>> +	/** @vm: VM this notifier belongs to (holds reference
>>>> via xe_vm_get) */
>>>> +	struct xe_vm *vm;
>>>> +	/** @vma_start: Start address of VMA being tracked */
>>>> +	u64 vma_start;
>>>> +	/** @vma_end: End address of VMA being tracked */
>>>> +	u64 vma_end;
>>>> +	/** @list: Link in vm->svm.madvise_notifiers.list */
>>>> +	struct list_head list;
>>>> +};
>>>> +
>>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>    #define TEST_VM_OPS_ERROR
>>>>    #define FORCE_OP_ERROR	BIT(31)
>>>> @@ -212,6 +233,26 @@ struct xe_vm {
>>>>    		struct xe_pagemap
>>>> *pagemaps[XE_MAX_TILES_PER_DEVICE];
>>>>    		/** @svm.peer: Used for pagemap connectivity
>>>> computations. */
>>>>    		struct drm_pagemap_peer peer;
>>>> +
>>>> +		/**
>>>> +		 * @svm.madvise_notifiers: Active CPU madvise
>>>> notifiers
>>>> +		 */
>>>> +		struct {
>>>> +			/** @svm.madvise_notifiers.list: List of
>>>> active notifiers */
>>>> +			struct list_head list;
>>>> +			/** @svm.madvise_notifiers.lock:
>>>> Protects notifiers list */
>>>> +			struct mutex lock;
>>>> +		} madvise_notifiers;
>>>> +
>>>> +		/** @svm.madvise_work: Workqueue for async
>>>> munmap processing */
>>>> +		struct {
>>>> +			/** @svm.madvise_work.wq: Workqueue */
>>>> +			struct workqueue_struct *wq;
>>>> +			/** @svm.madvise_work.pool: Mempool for
>>>> work items */
>>>> +			mempool_t *pool;
>>>> +			/** @svm.madvise_work.closing: Teardown
>>>> flag */
>>>> +			atomic_t closing;
>>>> +		} madvise_work;
>>>>    	} svm;
>>>>    
>>>>    	struct xe_device *xe;
>>>> -- 
>>>> 2.43.0
