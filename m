Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6694C88E64
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 10:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5409510E471;
	Mon, 14 Sep 2026 10:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbGU06VF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ABE10E387
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789382130; x=1820918130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EK0CzqsjAPVXQ4nqx1x6vNJEd8Of9NVAhlpxCV3GQpw=;
 b=XbGU06VF2dvFygjR3XufluAT2RYcIQ44m78Gvs2qBdpqNM3byRc82E8c
 eQ9QxSvjJIz7sQIRe1xsCOiA5nevyHFvxhO/mZbAcHUO5PvFvJ98aj9Ig
 GagWQX6gegzcMNPTS/7drKzWojapuTbSRDZk3GtoTAaTZB5ii19LxyeEq
 /wEzPoMSfEtcDe7HpRrjVGHhPlI1XV0jr9NF6ivlyqN+V/ns/TtNdoQCo
 giRUGvwhdbRZntnpDiH732VyB9LoytZV9mKEdU4ffM2kyTXnkZ5X64BSD
 /CQ6jbf66JEvR34FrpyvDfiIZiX3qSqfAtol1OGvtm6hE/d9Bpds8KVm3 g==;
X-CSE-ConnectionGUID: SA819yppScaiDaXV3jd7hw==
X-CSE-MsgGUID: VZT2XWJyTtqZQ0uaVtl6zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88673021"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="88673021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 03:35:30 -0700
X-CSE-ConnectionGUID: +nhk/4lMQ7miDAhnamrWsA==
X-CSE-MsgGUID: dp6utQdCQQ22apB4ug1qHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="268928935"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 03:35:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 03:35:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 03:35:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 03:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb5p85aVEeBqOE7R+aaGbwITTPIaZ6tX22pEtr3VwBudHWMFewkhksJyDA6rz12mnY5fmJ2TCofTZNZ43hVW9KsJSsTP7sHk55izq3da7Km4n6qUNaTG/M8xAUFbYUKjy4DS3pRhgx8hy1n7G0RJxlRXlRXf7gYuvN/vPY2J5vlRmrBIl5R1HNN7crSZx/WtZ9NylYcypuqVM7uqOl1yt2jpJLQcvytVvctPft8hlvVfssmmRgoMKj/iVxf38bhTCr1VW/ZTCz/+n3/jhcRid6ZFEZ7DlRYdILQUjM/QawOAn/pgvW1J7XEvJhHVQb1EJ68SpVx64CX36vcb9MA3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZGAcSIa5jPqwsM3cMBD95k6/3BlgRf93K+4lLtaEkM=;
 b=B6K8Iu5Vj+rMLbb1jCXBTx5W0n+lUQAkhdI7+cKJX+LXCmP0CyGJ1eAIyS1y3vmzkDZP4uMFDQVKRxLbFmpoosCqJ9NtTz/5UrGXhxkooKcsayrAFxQGYwhQN3v/hPws/b/z1cVejxXUmtwugit1jn+AVxiEv7HGy7tPF0flXA4QOwHPxRXuLX829wNGi7aiIjiUC8lzLSk7zKoGtBEmkBOm2wpbPy6Y2V4LiaeOblYYfUML/iIei7jdeicfwbmY4GLhZOPvRwm3y3DhbqP9SFtvaqfUIvinqbMiFog39UlD8Lt88EKrJ8Uy7HYe7TofFjzNaIIEXQSB95e3ZCsjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH8PR11MB9769.namprd11.prod.outlook.com (2603:10b6:510:3a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 14 Sep
 2026 10:35:24 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:35:24 +0000
Message-ID: <878c1246-d4fe-466b-a109-8e3f617ac546@intel.com>
Date: Mon, 14 Sep 2026 16:05:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
 <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH8PR11MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ed579f-a1c6-4005-4a80-08df124be246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: Lo6HVBz4xfHomomX7LARYxHcUbvC9JDnFuYJMkp7C61vFgaQTgtuNIuxCmfRI8iBDe96yTdYhzlD6mA4h7V/0pZJzmA3rfDyQE62H7ViNbmQ9D1/hOJZw3wXt3l6xDQxpPAEm0Qxo/9Zc8QNYcAMsa1rRM5CBoobopBo4n/xyqNxsk+mVVWhat8muU/F+nreAtG95BLbk7RnoTtv/dsSQcCypmkj8EZTDPiVs6aj/ggrBPzLWnGJ7E4NlsQhBf5Cmfvwc7namY07biE/cYhK2210FkEM6g1Xl1Ig4AvoY9e9Iz+OViemMzztjWa4SWcma2mUSMN63LDnDaujkyFL/luZq63XylHcGuB8k70TwQyTYgEGdLjQ6R/KsIvd2Ye7EFny2MQgX6zIAQx4OtHJ52fWtPQGq4Tf9BFLvi96YjSqg7gT0/3jQQ0tSWgi3cII2xzsrQCiSBp/WGkwH6h3J9q4r2sz/VvuiI/4Fyb04L7Ez9WjG0phNFQ7jtrfRwIMtzXs0W1X+XYuolkAt+a1ItyJMgmOzpWNJ9K8RWAEPaAJkKlYInVEb3ABm9yDtvaDBjUNjJwxON9NwfZ5HCvS1Api805YysfWW2Ra7Eoi99fNYY4Py7WpmvfTvmyNUUs2mP7P2V4dt/CzGDT2KwltPgEZJpB3tTFEoeMOj8GQDd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2FWcnNBRnhwajVoTEdURDJGV0tpTDB1ZTV2MmFsS1d5eTZSQ2hpUUJ0VlZu?=
 =?utf-8?B?cm5wSDI3V3JPOTg5SjVZVExBQ3ppRDVNcnhXTFVXRmRHV2FKTk1DUm05RStB?=
 =?utf-8?B?YVZjU1JTemN4ZzIvYkFCT2FKYjhCc0FMNmRqVCtwblQwRmlvT2E4TkR1c2x4?=
 =?utf-8?B?L2xDOFp4NndoaHYzOXpYelpZY1JKWDdFNVRibGVCQStNZkc1OWE4UzZjaHY3?=
 =?utf-8?B?UEZyOEJ1V3dGNHdSUVl4YmtIb25XcldXS2MvekM3S2M0cGdUNW01MzYwdDdJ?=
 =?utf-8?B?UEVURitqTmIzQmtaSkJzektnTFFSMHlWa3hFVXkva3VUT3YyeGFXaWVkSVlu?=
 =?utf-8?B?d0UxRmdkTmVRN3RYL1VZZ3VkbisrRWU4b3kvT0tWUUsxT2lua05QTVZQU2NJ?=
 =?utf-8?B?dzA5alhScVRhN3AyRVdsSm9JaUwvVFM0MXRuVFY1RHROK0lEOUM3TG9ZdWZQ?=
 =?utf-8?B?eDloeFZZejBpMExkbVQ0RmFQbFdRODNtTFVheWZCdFB4b2ZaRnlydkZGUVdi?=
 =?utf-8?B?UmwyQVdrMENBQU02c3pvUHFXVGY1R1FhYkplR0FjNURSaEZ1OEluZWJZRmVl?=
 =?utf-8?B?T2VjYmdUSk9LMDhWWGYxcG4wL0ZQTXdJWWY5bklIZklOTkExL2M1b3lFNUFH?=
 =?utf-8?B?bnpnQW5RQ0xNYlpReWo3OEttRFZxVEZyM2pocUxFaDZJd29mWDRBNkN0TC9H?=
 =?utf-8?B?bjFxMmpsd3F2NFIvUXkxRkVqT2llOHlxNW5oZEZ0OXRFM2Mva1dlVTFoZEZj?=
 =?utf-8?B?ZlE4YUFjdjNQbTI3UGJocTNnTVZLa2FJUWJJUHdETnBZd21SbHJhbmJNUUFw?=
 =?utf-8?B?NEFvQjRsWGxraThmaXRITzhTQXNxQmhUV3VyVlMyeEEvV1N0TUd5NFliY2NO?=
 =?utf-8?B?bGZhZDhBd0ttTDhHdEJLMXdQcjhWckxya2habnJqQk85cGpPdHV2VWY1emRY?=
 =?utf-8?B?YW1TMFQ1a3kyQVpxVnJpclF2N21XZjdxS0M5aUszNVBMdW1PRzFMandVQ00y?=
 =?utf-8?B?VjEvR20rMnY2ckRhMW5VblpDY0MvbmxUV09sMDE4UGZpWG1aKzJoQVYvTHZW?=
 =?utf-8?B?R2ZWU2dsQlpadnFjWVQrYjJWYnNhWDBWUUhDTGxiRHBIKzJ3THV5MUNoWnRv?=
 =?utf-8?B?aC8vWFlBUktPRkVpYkdsa2RPNzRKeFNJL00xMXVKTFBzcVFnWUNua3hRdEdD?=
 =?utf-8?B?emZKNm1obmtoRmUyYjRrbmM1SXQ1K0IxaWZ3ZWhqMWFOeTNtNkZ6dXNXSUJF?=
 =?utf-8?B?YzBrOUNxTFVEb3dhbGpBR1BjTFNqajk4SlhHQ0V3N1BFdXlIYmd0WjV5Mjh0?=
 =?utf-8?B?ZlA4UjdUamVRejNxSDVuOTV0eWdJVGFkMkFYVk94OTk3V2tOeStGbXhla1pJ?=
 =?utf-8?B?aVVpUEhCYzJUWHd2S0VpeVlqS3VRRUxjZVllQmxlYUs4dmdLWDhMNXFKakxi?=
 =?utf-8?B?MDBrYU9zcGZhTTdhT1M5L084bUNSMU5KanB0ekRUMXpJUGJ5djJxWUp3V05k?=
 =?utf-8?B?MUJYRGVGeGtDUzdMZzJSTjJtTEpWaFZSeDJYVU5oa1NWc1AzOGR5SjRKdEp6?=
 =?utf-8?B?UUllU0tCL0p1YXJjNG5Dc2lCaDBRQW5ocG9iVVc2OFRMWE5JK1pBcElKakhB?=
 =?utf-8?B?bXFMTkhLOGR5NzNjaURXODI4ckhXQzY0YTlRM0ZZaytnKzZ0eDdVbE9wNFIw?=
 =?utf-8?B?NUowaFdZQmJJM3oxR1piVWpmbDBBdE92SzVLTXBJV0VZaE9GTjFORzRQTEtv?=
 =?utf-8?B?WStvYVpDc0pjSlRwV3MrMTMrYjBoTFN5cHYwRFFPcERCRDFWSWtVVWc4L3Zw?=
 =?utf-8?B?L3M0S1krSkYyUkJLV2p3aUFmc1FxWFNuelBUd1ZxT0ZicGZJZXl1K1lxVTlw?=
 =?utf-8?B?bSs5VzhPUU5qQThHTWlPTVhWUzN4b3JFMXZkUWFVc3YyT29DakJWTGlXRmRo?=
 =?utf-8?B?QjlTOHRZZTdnSDhjUE9xRSsrYUozb2lqckVqT1Rxemh0c1dGaE5uL1E0N1J6?=
 =?utf-8?B?dHlVZnhZS2JKODg1ZXlKWDlIelFYVVpkSnBIYmRVcTA3MVI3L3JHWWV6VTJ2?=
 =?utf-8?B?anBzOUtlRDRpQVFtaDFCYUtNOVp4Nlg5d2VUMmdhWDFqWFhkMjRJMGUwbW1x?=
 =?utf-8?B?UDlYbDNVRXh5UzRTc2VvK1Y3Rmg4ckk4ajhoZ2dhbWdDaEQyOHFVOEJtNEZ3?=
 =?utf-8?B?MTlXeTkwSGdNYmhHZmtIQlV4ZFdiU2JmOVBxWFFnT1BhSDhiNTNZU0FhVVlm?=
 =?utf-8?B?R3JGcDBPU05FMGlFNENUQmYyWkVCa3dFNmRiNEJXUUVOTmZtT0JwcDNoUy81?=
 =?utf-8?B?YlE0N3JWNGRSWk10aXJnWFUrdiswaVlPWFA2WEZabStYSi9jOEhzMDkxZklY?=
 =?utf-8?Q?DLZI36TgqSKgx4/A=3D?=
X-Exchange-RoutingPolicyChecked: NvOeVb0nt0/WavtmfFLbd+fDeuLddXV4fa1kXcROvuyYw2EaSFmIgEfZK3+LcNuW8wUQIQg6yRLqvE5kSHMv0cDuxltvwvSIDaixXNy2QZ3ry/6p0NpwPD3s2SzHm+WhVObGIeB/tS/tUfT3aGK77ZNAByUsXhz/WOlpL9yhObf7IrSjKLEwvu15PjlHb0IEK+FNkG/qxOvtUezgiKbA1tj4buX+Lbs3ig9FfviSFsB5PWs0UiO27aZ6iuOIME75RAC8HZ8+YSvdjjnKrkcwckLSW22sk/Pjeydj7n/UqXqo5mTij1x4ajrM/gbByHyxAJbyL0l5n3drD+WsGQnTHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ed579f-a1c6-4005-4a80-08df124be246
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:35:24.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFriklENowLrCqi4yfs3J1qbCMMzAx88ziInZjOKVd8bGGD3N3iiN66UuLIvh1YKVV4md568TdHfW3VpjMR28gy/xuDxeZ8wX5v5hs1iscs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9769
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


On 12-09-2026 02:15, Matthew Brost wrote:
> On Sat, Sep 12, 2026 at 12:53:01AM +0530, Sanjay Yadav wrote:
>> A recoverable page fault generated by a process's completed migrate/BCS
>> work can arrive after that process's VM has been closed and its ASID
>> removed (abnormal exit while GPU work was in flight).
>> xe_pagefault_service() returned an error for such faults, which is
>> reported to the GuC/HW as an unsuccessful response. Repeated
>> unsuccessful responses eventually escalate to an engine memory CAT
>> error. Because the migrate/BCS engine is shared, that CAT error
>> wedges it for unrelated processes, which then hang on their own
>> copies.
> Yikes. Do you have a reproducer for this? I wouldn't expect this
> behavior from the hardware, as it appears to violate the expected
> process isolation contract.
Yes, there is a reproducer, "l0-abnormal-exit-repro", in GSD-13290 on 
BMG. I have also attached the dmesg logs
in the GSD from the drm-tip kernel, as well as from the older 7.0 
kernel, where the issue was originally reported.
>> Detect stale faults whose owning VM is closed or whose ASID no longer
>> maps to a fault-capable VM, and drain them instead of replying
>> unsuccessful.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
> Fixes, CC stable if this is an issue.
sure
>
>> Assisted-by: GitHub Copilot:claude-opus-4.8
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pagefault.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index c82b8bc8bc70..2827652ab8a3 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -238,8 +238,10 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>>   	vm = xa_load(&xe->usm.asid_to_vm, asid);
>>   	if (vm && xe_vm_in_fault_mode(vm))
>>   		xe_vm_get(vm);
>> -	else
>> +	else if (vm)
>>   		vm = ERR_PTR(-EINVAL);
>> +	else
>> +		vm = ERR_PTR(-ENOENT);
>>   	up_read(&xe->usm.lock);
>>   
>>   	return vm;
>> @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   		return -EFAULT;
>>   
>>   	vm = xe_pagefault_asid_to_vm(xe, asid);
>> -	if (IS_ERR(vm))
>> +	if (IS_ERR(vm)) {
>> +		if (PTR_ERR(vm) == -ENOENT) {
>> +			drm_info(&xe->drm,
>> +				 "xe_pf_debug: drain stale fault (no VM) asid=%u addr=0x%llx\n",
>> +				 asid, pf->consumer.page_addr);
>> +			xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>> +			xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>> +			return 0;
> Won't the page walker hotspin on faults until the executing queue is
> descheduled from the hardware if we successfully acknowledge them? That
> doesn't seem ideal.
>
> Matt
agree with your point
also with this patch[with_patch-752845-fix_run.txt attached in GSD] from 
a 1.5h run (3,373 torn-down contexts)
95% of ASIDs re-faulted exactly once before being descheduled, 0 CAT 
errors, 0 hangs.
So the existing async teardown already deschedules the context within a 
fault cycle or two.

can I move it to teardown wait for the ASIDs queues to deregister and 
drain its pending faults
in xe_vm_close_and_put() before erasing the ASID, but that a larger 
change. Happy to change either way.
-Sanjay
>> +		}
>>   		return PTR_ERR(vm);
>> +	}
>>   
>>   	down_read(&vm->lock);
>>   
>>   	if (xe_vm_is_closed(vm)) {
>> -		err = -ENOENT;
>> +		drm_info(&xe->drm,
>> +			 "xe_pf_debug: drain stale fault (closed VM) asid=%u addr=0x%llx\n",
>> +			 asid, pf->consumer.page_addr);
>> +		xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
>> +		xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
>> +		err = 0;
>>   		goto unlock_vm;
>>   	}
>>   
>> -- 
>> 2.52.0
>>
