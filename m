Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B109DCFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707DC10E3B6;
	Mon, 14 Oct 2024 08:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKlSriBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FAF10E3B6
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728893181; x=1760429181;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=R/b/hhAnyp0QKQy5gNmUvHDVS+eBMDy+QnAkDdgrBtk=;
 b=SKlSriBCwiWyKbvN+fHDbinP1PBzSNQIvggMNOt6pnoYRqB05w0XR7I5
 M0laHj+khNCfcUPgGdfh0RvRDugaQZqTcTbbV54G5t6LwEvjMtyyWVZnh
 G/pzMB875xmKGee0ePsKvOJtfA7pN9wTWhPfZXn8LWzcNPI/UJNtt7gn7
 dNvqU+qJ16uHd4Rp9HLQ7KpgKXiYSD8347FP3sK/ufft5sfthmaogjCq0
 j3K6pr5mm6gfl7lImsLrFOFC7Cp6hsIT48hwNQJQq24cLBpHvIceA8o8Z
 IUBYWCtz8RB+LWgPMvZcwWXMk6pJeCSdtvkXfm5eqXBLZG8ayoZtA4OOD A==;
X-CSE-ConnectionGUID: yoD6+LPmQuq4Q4oA1bc6Mw==
X-CSE-MsgGUID: FVZPymzEQ/qb+HUhgfC8jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28311154"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208,217";a="28311154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:06:20 -0700
X-CSE-ConnectionGUID: pfNfJwVRS7Gg4otEAAoBTA==
X-CSE-MsgGUID: IuQ47FzMSG+q5FSlRMDxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208,217";a="77127120"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 01:06:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:06:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:06:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnpXCbDWYNTZNOVn4BSDVW92oCZXd2xmy9dsGCAxvE6fwjKBD4W069uCcfoOZiNVopcUmhAtVUrws0FtvPeu+SBa+7Z7YpNYR6VWiLzh5SEIKSCf4v8sV0KyWtBADeHlxjmN9SZ4xEcR1fpDu4W3qYs5zTU7ogFwwATmjeW4IlUNSrRrVV9rVs3cZlrF1oRkJpg81iULzuNQrCaJgTOEMHhsviwSPamnI0k6sOyFBVU9CaGcwkbyWzfCqW+OL9EV7h3oxIhnxzT2PXtD0I6VHoBiZrcVIISH3hd5pRJKcI1ufwjvMyhOg4r9UenDbgebQdGC4yHcYkuEHHXTiUGT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfgTTUoVW0476nakvIvd54RXUv79CmeWUqQq+douLSM=;
 b=kn0cqwV8v+HctAh+OxwdRGJ0D2HuL/AIHdMPbykJLQgXUGNfyKnw9Oo8rW8YjZLdcKWpgQac41qwHBOh5miN+TEwzN/v8Oqm8c3c92kcmcR50XStQVnobsdd8W9iogaMEaXjVdvKbFsz5gzq2iKCMiLZKyvaBnOc4eEfSNCTMo8KJ9pnyTKpqNJnXr4jbpRxmlZiuRE+W5xYg0WSniOZUD6K5k5rZ+rM+iXAu0CEAAoK4OhzNo8Wg4QW2XElxWwImLzevQ00rZ1Rir0RrfuDX6qN7v/1HutFum1ODzGdjUHswlBAKfPExGqwUl+csbml36aJqnXfpDaL97lLMJyVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV2PR11MB6071.namprd11.prod.outlook.com (2603:10b6:408:178::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:06:09 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:06:09 +0000
Content-Type: multipart/alternative;
 boundary="------------wdOmuYElBV8oWBMqCC6JQn4X"
Message-ID: <fd47e67b-f3ca-47ca-93ae-9f7cf34e176e@intel.com>
Date: Mon, 14 Oct 2024 10:06:05 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/ufence=3A?=
 =?UTF-8?Q?_ufence_can_be_signaled_right_after_wait=5Fwoken_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241011151029.4160630-1-nirmoy.das@intel.com>
 <172870051404.1242907.16383529102075730388@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <172870051404.1242907.16383529102075730388@2413ebb6fbb6>
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV2PR11MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 45033cb8-129e-4a13-8e37-08dcec270f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjRSTkpxR1g5YmFoMDRDbjRsZXk0eG1DRndLNk93VnAxcXVVWEFxVXp1UFRl?=
 =?utf-8?B?ZDNUbnZwMHE4MVBwaVA5eUJ6bm1KcnN2US81ZU54OVlBMEpVRTdjVXE2V2Vq?=
 =?utf-8?B?bHgrT0Q0TzdqU2o1dEN1YndybENYWHhCYlE4U0xLalBvZHRpNThwZlZVSUZo?=
 =?utf-8?B?S3IwaElDb2tId0lqS0JvdHJETHBWd3JRbmV2aGE0L0MzbDdKUXdON3I3R3Ir?=
 =?utf-8?B?OUZiRmRZS0RWSG50M2x4Yk0vVklLQU9HUU1ubXRmWC83eVpsalRlZkp4KzZq?=
 =?utf-8?B?T2FYNnRQQmZTQzRRdFZYak1iZDBTRGUyZDlUZjRLeGVvNnVLY3gyMC81OHhw?=
 =?utf-8?B?Mmo1WFBSRlF4aEJoaElaOHJYK3dLcVNTczExWFp1NnlkdVhqVUg4YlNOR243?=
 =?utf-8?B?OCtOSldiOWoxL2IwSWQxbkVsRGhlaGJUdVhIUVhpUUM0VFMvQlNxeFgySGVy?=
 =?utf-8?B?RXVHa2dkZHhFQ2ZTMXZqajBzb0RESmxvekpCenZ1Q0NjL2VtMWw0MGxTT2RF?=
 =?utf-8?B?MW1DVU9pZDBvemxsRndBcmczVG82eVFjNUlwS0xmTXlMa0owVUJwNXNUZ3E2?=
 =?utf-8?B?OXhYUytLWU5FbUZkOXRYb0sxRVRzNFN5R25XZ3FpdlZXa3AvUG9RaVdvVDF5?=
 =?utf-8?B?N204ZGk1T2lUN0tWVFNhTFJWak5RZ0IyOGt6OGxpVkplV3V2M3ZWeXRMd2sy?=
 =?utf-8?B?ZXZUdnJRZW9ZL3NiTDRHT3J0Mzdwc2VZaEtDNThiT3d6QUQ0d1B4Ni9aYmZK?=
 =?utf-8?B?cGpESHZHajNoTGhMTXpld2M3QWtxMWwreGpERmlDS2poSHJSdWFmTVhDYk5n?=
 =?utf-8?B?REpGUW9waThnWGEvOS9IaVo0V3Z0WFRSelp4V0c5QnlZNVhtN3p0L2VYWVVm?=
 =?utf-8?B?cEJOMm92UERYcmVQL01rSGxqbGMrUnRpLzVGN2g0VWl0RHJzaU1qbVFEUjdM?=
 =?utf-8?B?UnJhTzNGNVVvQkN4blkzajZJS0YxenZoOWcyN3JMNmJLdW5nQU1BazFUd1Y2?=
 =?utf-8?B?V1JxaXVaMWdOdmNIbW9Nb213WHFzU1dtSmlVcWtMcWpCdERob2V4VjVCME9D?=
 =?utf-8?B?TjhwRlBMWE5VVnRXNmkvS1J0VDBJQTROUzhuVEdXOUhmY1dOMzlqOUpZVXdT?=
 =?utf-8?B?d0ltYVVTSTZJMHo4SXdVVng1WW1NRVVOTTZHMmdZZVVIRVhjQm9IYW0vMk13?=
 =?utf-8?B?eGVDMGFnR0xheHdBb1RpNU1SNE4yRzlEbXFzZTdRRFVCOXgwTVJlSlRMaTdH?=
 =?utf-8?B?c0t0TWE2Smw4dkZKUFpJNWpjMENnU0x6RzF2RS9zL2FoUFRpSTJCSUF3V1Rs?=
 =?utf-8?B?K1Jvc3VwSmtCa1B2SlE2bnFLMHZoM1dxM2VGQm4yUGR5NThSTEJ6NFBzcm9N?=
 =?utf-8?B?aGQvMzRRZ3paVzNybElFQTNndkhtNzU2UWtVLzVGc1FsQzFwWVBoeUUwaU45?=
 =?utf-8?B?c21VcFJVdk0rMnJPZFUzWWpEdStteStISjBidTFVUUtPRHRyK1J3MXEzUUhi?=
 =?utf-8?B?ZHhTbGRzbmxtUnFZSGw1bWVML3VDdkRFa1NGRXlUaDF6SEtSWXRsQjhsaDNa?=
 =?utf-8?B?ZndxSGJ4MmJiMXR4RkQ2YXF1c1pyeWJjQnVZa2Fxc2JQdjVSNWFEaFd1cVl6?=
 =?utf-8?Q?4O3FuA4tV798lM283IB/DLcw9BHzrDJZVnqni+2CWtE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkt6eGlvN2o5RGFRTFNZK1VQU1g2Z1dLY1dRWDRYYzg4V2NTTmgvdzl2RDhk?=
 =?utf-8?B?U2ZOb2tadVBlUm9CQXN0Y3U0UVlidEtQWWVJVGVQYWNldlhwUE1VSXZLS3pw?=
 =?utf-8?B?Uyt5UEJJSi93em9yQnAvelBwM0llR1ZlQ3BRV1BwVnRyTFNqR3RORXBTUzVZ?=
 =?utf-8?B?WDZEUk5tZ09RRDVoU3dvTVpQMVlPSXNvVS9hS3lpbWsxNEJ5S3dydmNSVWNx?=
 =?utf-8?B?K1hIczZRQkl2OTZRYXhzc2ErcVV6RWhrN2lkTkxtV09HWkVtK095OHhJb3My?=
 =?utf-8?B?U3g0RWtGQ3JZa3VScDlxUTVrMEh1enBMYmRWQXYwNFJnMGczNVIveXEzUXp4?=
 =?utf-8?B?WTdvbXR6azQxUVJzazJuSzZ5dTlvWmJLU1ZWNVltd0VlZXdWQ2pwblV3T2Yv?=
 =?utf-8?B?UVdlZEkyM1oyOXUwbzBtWTYvM1o2NzNIcVN1TE4xYlVETXNWdDcxdVBqaTZE?=
 =?utf-8?B?ZHZoQm9LbzFzVW9PVG5hVXpmWmppcmtyNU1uRy83dEVwRE56ZmluemRXdThp?=
 =?utf-8?B?MzROeWh2Mzh2aHlvZU4rREFjRjk4ejZaMkZBUFMwUldtRlhkcE95RnE2ZWFh?=
 =?utf-8?B?cVd5Y1hRSlZGV1lvYnhHSFEvaTBabTBvaktvdGVNSUdqRnY5UGxadnZtRFls?=
 =?utf-8?B?L3R5NmNmU0JNODJmSHJrd29XZ203bncrQWIyVzhCbnBjVndSMUREaGQwZS91?=
 =?utf-8?B?dXRpWms3QjRpNVpjN01UZ0pSWGs3Q09TK0srT0lGdHduRWNPRkNpSVFDd1l4?=
 =?utf-8?B?VDZXZFg4c01wWnZXK0ZjU25lbTlBWmtVT1luWEtPeVNrVlcwUGs2Nk9RR1Ja?=
 =?utf-8?B?NXZjelBJcmdMN1Jqd1VCakdZRGNyUllSdDF2ZU16RGQ5ZWRudWVqOGZjeGRw?=
 =?utf-8?B?dzZvZTU0SzgwSHJxbkJMRGVLOGZqbDVnRDZycFV4THZ0SlB3WjJmOERTTUFp?=
 =?utf-8?B?Y3dvYzRDVDIwWnRrR2lXZGNUQ216RytBZkFUQmlOaWsreFIxTFp2cDBQcXFr?=
 =?utf-8?B?Ty81RmJ3dFR6V2lZQkVWa1U2ZENZVmxsdytaQTlCRXJQTlU4RjFpczcwUHFt?=
 =?utf-8?B?Rm5iczFINmVnWW0vcFFYUlRnMlgybGlQTnJWeGRQN2JjYVJyeUZsU2JKTTB4?=
 =?utf-8?B?SUYwaUdhK1prWW1XRjNtK3Y5YjFsQjRxcDlZNHFoT1hPWnBGK0lSQXZpOVBK?=
 =?utf-8?B?Sm0wV3grNHlyZWlJTlJaODRpV2RlTGIwSURHUkdOM25DQTJydHk0Z2xlTTJI?=
 =?utf-8?B?Rm14eUJaR0tPbzMrZVJTbHVjK0doaEV0SUlmRHo1SVR3djYySzgrcnZSM2ts?=
 =?utf-8?B?Z0ZRYkdQLzdqM3VmU0VWSVVhRVBQZzRYMlBROTZhSkVHUUVFWXA2SFhGNlp2?=
 =?utf-8?B?SFkwaWpQT2F0WWtXbjdJcUIzSklrOUFDakRHNThJQ0V6SkpKdk5mMDVvSy9O?=
 =?utf-8?B?dTQvZWRGc0o5cm9CMFdZWjVwOGhPTkR1MjNNU3BzT1pyaEJuSmtEa0dTbUZw?=
 =?utf-8?B?bG9ycEM3L2NweWJyc2hEZmpEZEFESmVyanROaGRNbzZMY0crN0ZMV2VSK2NO?=
 =?utf-8?B?K0pPOStjYk1QM2Y0VjVhOG55M2NqbWVZZW9GY1pjcmJEcU80Q0pBNmpDZFAx?=
 =?utf-8?B?Tm1PRVVhSUxJVEVNZUwwQ0FDWS9nUHhQaEpBT3BKc1l2VlRzVm0wR0p6TEVr?=
 =?utf-8?B?cWtOb1NpU0p2amN6NU9wTUlTanNkNWpsV0kwQ2s5R3htanYrRXdja3llY3Mx?=
 =?utf-8?B?dGlVaHZweVBDNXhqSzJtN1NlS0RJaFpycWVLVUgzellkK2tZWGY0bXQrbEFR?=
 =?utf-8?B?S3dueGJWVUxIdnArWUxRckwzV0JBMklqMlhVSWVGTXdNdGVPS3U1RzZCeDBD?=
 =?utf-8?B?U2JGREx5a2IwWXdjWUJsKzZWTFUvMUlXVGtlcmxoUnEzK3NGU004dTV5K25P?=
 =?utf-8?B?TzZuckZyMGtLSVk3REZJTU5Bc2pOakJXY2xVSm9pM3MydzV3RG44dktCaWU1?=
 =?utf-8?B?L2hTUkRUUGZVZnlhQ2FTU0VYMXc5VEVCMXJCV0MwSHd5Z3Q5Sm45Zk90N29a?=
 =?utf-8?B?YTI5dk50SGtPYS9qNGZ4ZTFxci9jU0p6TklJQnZTdjhRM2h3b3ZHaWdyT01X?=
 =?utf-8?Q?ULZc2jacl6Lkx/SryuGJ72YOL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45033cb8-129e-4a13-8e37-08dcec270f7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:06:09.2477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiibNcllrZsL8DNgY0S6InBuFXUM4Mkq3imHtGiEH5I4tM+K7WGOet32MOv2ySS8f3YHkgSv6vvLI9QATlvxcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6071
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

--------------wdOmuYElBV8oWBMqCC6JQn4X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On 10/12/2024 4:35 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/ufence: ufence can be signaled right after wait_woken (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/139897/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/index.html
>
>
>   CI Bug Log - changes from xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full -> xe-pw-139897v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-139897v2_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139897v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in xe-pw-139897v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1.html> -> WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1.html> +1 other test warn
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html> +1 other test dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html> +1 other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html> +1 other test skip
>

Unrelated failures.

Merged it to drm-xe-next

>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html> +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> +1 other test skip
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o {shard-bmg}: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html> +4 other tests dmesg-warn
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#2325 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html>
>  *
>
>     igt@kms_color@deep-color:
>
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-8/igt@kms_color@deep-color.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_color@deep-color.html> +1 other test incomplete
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-256x85:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html>
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#2286 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#2501 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html> +12 other tests skip
>
>
>     New tests
>
> New tests have been introduced between xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full and xe-pw-139897v2_full:
>
>
>       New IGT tests (19)
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.15] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.13] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.16] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.13] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.15] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.14] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.15] s
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-rc-ccs:
>
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [2.12] s
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-4:
>
>       o Statuses : 1 fail(s)
>       o Exec time: [112.23] s
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
>
>       o Statuses : 1 fail(s)
>       o Exec time: [34.41] s
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms@plane-32:
>
>       o Statuses : 4 pass(s)
>       o Exec time: [2.77, 14.07] s
>  *
>
>     igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.59] s
>  *
>
>     igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.41] s
>  *
>
>     igt@kms_universal_plane@universal-plane-functional@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.25] s
>  *
>
>     igt@kms_universal_plane@universal-plane-functional@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.04] s
>  *
>
>     igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.60] s
>  *
>
>     igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.45] s
>  *
>
>     igt@kms_universal_plane@universal-plane-sanity@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.57] s
>  *
>
>     igt@kms_universal_plane@universal-plane-sanity@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.42] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-139897v2_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html> (Intel XE#1885 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>  *
>
>     igt@core_setmaster_vs_auth:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@core_setmaster_vs_auth.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@core_setmaster_vs_auth.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>  *
>
>     igt@kms_3d:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_3d.html> (Intel XE#1465 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-warn
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1 other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1 other test fail
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1 other test fail
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +5 other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +97 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1 other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +10 other tests skip
>  *
>
>     igt@kms_color@deep-color@pipe-c-hdmi-a-6-ctm:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_color@deep-color@pipe-c-hdmi-a-6-ctm.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test fail
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> / Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +21 other tests skip
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +10 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +4 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1 other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +4 other tests fail
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +7 other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +4 other tests dmesg-fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +31 other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_hdr@invalid-metadata-sizes.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +4 other tests dmesg-warn
>  *
>
>     igt@kms_plane@plane-position-hole:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_plane@plane-position-hole.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-fail
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@kms_pm_rpm@drm-resources-equal:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr@fbc-psr-basic.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13 other tests skip
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_psr@pr-no-drrs.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 other test skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +3 other tests fail
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_vrr@flip-basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_vrr@flip-basic.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1 other test fail
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html> (Intel XE#1050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_create@multigpu-create-massive-size:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@xe_create@multigpu-create-massive-size.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_eudebug_online@preempt-breakpoint:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7 other tests skip
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_eudebug_online@single-step.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>  *
>
>     igt@xe_evict@evict-beng-small-external-cm:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_evict@evict-beng-small-external-cm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_evict@evict-small-external:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_evict@evict-small-external.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@many-null-rebind:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +20 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>  *
>
>     igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>) +1 other test fail
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +24 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>  *
>
>     igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe.html> (Intel XE#2931 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931>)
>  *
>
>     igt@xe_oa@closed-fd-and-unmapped-access:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +5 other tests skip
>  *
>
>     igt@xe_oa@mmio-triggered-reports:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) +1 other test fail
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pat@prime-external-import-coh:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_pat@prime-external-import-coh.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +8 other tests skip
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1 other test fail
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_query@multigpu-query-engines.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2 other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_query@multigpu-query-invalid-query.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@crc:
>
>       o {shard-bmg}: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc.html> +1 other test pass
>  *
>
>     igt@kms_async_flips@crc@pipe-c-dp-2:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html> (Intel XE#1656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html> +2 other tests pass
>  *
>
>     igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> (Intel XE#1288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html> +3 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html> +1 other test pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-0:
>
>       o {shard-bmg}: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-180:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html> +1 other test pass
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> +7 other tests pass
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2436 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> +1 other test pass
>  *
>
>     igt@kms_cursor_edge_walk@64x64-top-bottom:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html> (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-bottom.html>
>  *
>
>     igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>  *
>
>     igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html> +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html> +6 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html> +2 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html> +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-3:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html> +5 other tests pass
>  *
>
>     igt@kms_plane_cursor@overlay:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_plane_cursor@overlay.html>
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html>
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html> +10 other tests pass
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>  *
>
>     igt@kms_pm_rpm@cursor:
>
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_pm_rpm@cursor.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_pm_rpm@cursor.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html> +1 other test pass
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_vrr@flipline.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_vrr@flipline.html> +3 other tests pass
>  *
>
>     igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html> (Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html> +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html>
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html>
>  *
>
>     igt@xe_exec_sip@invalidinstr-walker-enabled:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html> (Intel XE#2977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_sip@invalidinstr-walker-enabled.html>
>  *
>
>     igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html>
>  *
>
>     igt@xe_exec_threads@threads-cm-fd-userptr:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_exec_threads@threads-cm-fd-userptr.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_exec_threads@threads-cm-fd-userptr.html> +5 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html> (Intel XE#3001 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html>
>  *
>
>     igt@xe_pm@s2idle-mocs:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_pm@s2idle-mocs.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@xe_pm@s2idle-mocs.html>
>  *
>
>     igt@xe_pm@s2idle-multiple-execs:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html> +1 other test pass
>  *
>
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html> +21 other tests pass
>  *
>
>     igt@xe_vm@bind-array-enobufs:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_vm@bind-array-enobufs.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@xe_vm@bind-array-enobufs.html>
>  *
>
>     igt@xe_vm@large-misaligned-binds-536870912:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_vm@large-misaligned-binds-536870912.html> +12 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1 other test dmesg-fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1 other test fail
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_content_protection@mei-interface.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_content_protection@mei-interface.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-adlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html> (Intel XE#2938 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_psr@fbc-pr-no-drrs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html> (Intel XE#1050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-discovery:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-discovery.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-rebind-imm:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +5 other tests skip
>  *
>
>     igt@xe_oa@invalid-map-oa-buffer:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_oa@invalid-map-oa-buffer.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_oa@invalid-map-oa-buffer.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_oa@non-privileged-map-oa-buffer:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8065 -> IGT_8067
>   * Linux: xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07 -> xe-pw-139897v2
>
> IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8067: e4d91caf2d87b4a93c7e3e3fd24521ead677895b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07: d2577be8b969257afb5f76964afc16ae4f6f7c07
> xe-pw-139897v2: 139897v2
>
--------------wdOmuYElBV8oWBMqCC6JQn4X
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/2024 4:35 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172870051404.1242907.16383529102075730388@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/ufence: ufence can be signaled right after
              wait_woken (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139897/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139897/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full -&gt;
        xe-pw-139897v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-139897v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-139897v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-139897v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-edp-1.html" moz-do-not-send="true">WARN</a> +1 other test warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Unrelated failures. <br>
    </p>
    <p>Merged it to drm-xe-next<br>
    </p>
    <blockquote type="cite" cite="mid:172870051404.1242907.16383529102075730388@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>{shard-bmg}: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html" moz-do-not-send="true">DMESG-WARN</a> +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-8/igt@kms_color@deep-color.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_color@deep-color.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501" moz-do-not-send="true">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">SKIP</a> +12 other tests skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07_full and
        xe-pw-139897v2_full:</p>
      <h3>New IGT tests (19)</h3>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-2-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.15] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.13] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-dp-2-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.16] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-3-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.13] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.15] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-3-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.14] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.15] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-rc-ccs:</p>
          <ul>
            <li>Statuses : 1 dmesg-warn(s)</li>
            <li>Exec time: [2.12] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 fail(s)</li>
            <li>Exec time: [112.23] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 fail(s)</li>
            <li>Exec time: [34.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms@plane-32:</p>
          <ul>
            <li>Statuses : 4 pass(s)</li>
            <li>Exec time: [2.77, 14.07] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.59] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@disable-primary-vs-flip@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-functional@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.25] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-functional@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.04] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.60] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-pageflip-windowed@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.45] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-sanity@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.57] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-sanity@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.42] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-139897v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885" moz-do-not-send="true">Intel XE#1885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@core_setmaster_vs_auth:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@core_setmaster_vs_auth.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@core_setmaster_vs_auth.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_3d:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_3d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465" moz-do-not-send="true">Intel XE#1465</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701" moz-do-not-send="true">Intel XE#1701</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send="true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +97 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_chamelium_color@gamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color@pipe-c-hdmi-a-6-ctm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_color@deep-color@pipe-c-hdmi-a-6-ctm.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_content_protection@legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send="true">Intel XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send="true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@kms_flip@2x-plain-flip-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +7 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +4 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +31 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +4 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_plane@plane-position-hole.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@kms_plane@plane-position-hole.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@drm-resources-equal:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@drm-resources-equal.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr@fbc-psr-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-no-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_psr@pr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_psr@psr2-cursor-plane-onoff.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-onoff.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948" moz-do-not-send="true">Intel XE#2948</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not-send="true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-compute-kernel:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_compute@ccs-mode-compute-kernel.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050" moz-do-not-send="true">Intel XE#1050</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@multigpu-create-massive-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@preempt-breakpoint:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_eudebug_online@single-step.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000" moz-do-not-send="true">Intel XE#1000</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-external-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_evict@evict-beng-small-external-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_evict@evict-small-external.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-null-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754" moz-do-not-send="true">Intel XE#2754</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105" moz-do-not-send="true">Intel XE#2105</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931" moz-do-not-send="true">Intel XE#2931</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249" moz-do-not-send="true">Intel XE#2249</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@prime-external-import-coh:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_pat@prime-external-import-coh.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_pm@d3cold-mocs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_query@multigpu-query-invalid-query.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@crc:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-c-dp-2:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656" moz-do-not-send="true">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc@pipe-c-dp-2.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288" moz-do-not-send="true">Intel XE#1288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659" moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-0.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" moz-do-not-send="true">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436" moz-do-not-send="true">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055" moz-do-not-send="true">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-bottom.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-8/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-edp-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471" moz-do-not-send="true">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-7/igt@kms_plane_cursor@overlay@pipe-a-edp-1-size-128.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html" moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@kms_pm_rpm@cursor.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_pm_rpm@cursor.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-432/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159" moz-do-not-send="true">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-2/igt@kms_vrr@flipline.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-4/igt@kms_vrr@flipline.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625" moz-do-not-send="true">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000" moz-do-not-send="true">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600" moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2977" moz-do-not-send="true">Intel XE#2977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_sip@invalidinstr-walker-enabled.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-3/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_sip@invalidinstr-walker-enabled@drm_xe_engine_class_render0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-cm-fd-userptr:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_exec_threads@threads-cm-fd-userptr.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_exec_threads@threads-cm-fd-userptr.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3001" moz-do-not-send="true">Intel XE#3001</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-lnl-6/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-mocs:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_pm@s2idle-mocs.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@xe_pm@s2idle-mocs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html" moz-do-not-send="true">PASS</a> +21 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@bind-array-enobufs:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-8/igt@xe_vm@bind-array-enobufs.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-1/igt@xe_vm@bind-array-enobufs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@large-misaligned-binds-536870912:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_vm@large-misaligned-binds-536870912.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_vm@large-misaligned-binds-536870912.html" moz-do-not-send="true">PASS</a> +12 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-rmfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send="true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356" moz-do-not-send="true">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send="true">Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050" moz-do-not-send="true">Intel XE#1050</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-map-oa-buffer:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-434/igt@xe_oa@invalid-map-oa-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-433/igt@xe_oa@invalid-map-oa-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139897v2/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8065 -&gt; IGT_8067</li>
        <li>Linux: xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07
          -&gt; xe-pw-139897v2</li>
      </ul>
      <p>IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8067: e4d91caf2d87b4a93c7e3e3fd24521ead677895b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2050-d2577be8b969257afb5f76964afc16ae4f6f7c07:
        d2577be8b969257afb5f76964afc16ae4f6f7c07<br>
        xe-pw-139897v2: 139897v2</p>
    </blockquote>
  </body>
</html>

--------------wdOmuYElBV8oWBMqCC6JQn4X--
