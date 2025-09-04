Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518F3CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F6810EADC;
	Thu,  4 Sep 2025 20:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/7i1ugp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4EB10EADC
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757019453; x=1788555453;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H0zrHx1bHpRAj7qV+miepDzZMNLY1BapBDEZRcJCYvA=;
 b=i/7i1ugpG/wIykLCXW/HgteQFu4R6cyLqFy3BTWfxnynkUI54GJ2FoLM
 G5QPM93RTnU2ItH/4RI9zQDT/y5FmWZQkQMRK6GgZGFZD2p/4M+3QyGVo
 wHsOHzXYMea62JoHgjinsT2JbTJtjAbImeCdm1FqfkY3wNji2w+V7RBr+
 Z4O35u8Chq6U9OTSOSPEaM6xbbJHvJI+ny+Io0ASTyol456DDVvsGH10u
 800HqhDZYOJLFLO/CKwsUTto6butLDPDOoZF+dtmRR897faIV1kN6oAmt
 M0mpqMa1VwD1n1n6RpDzWmiyax5UblrI3Lpim/sc+ckisEe0xlCjppGHZ Q==;
X-CSE-ConnectionGUID: TkS5DtTsSh+bS2N+l97f5w==
X-CSE-MsgGUID: 9v7RxJr0S4q7Xm37MafZcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59291734"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59291734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:57:33 -0700
X-CSE-ConnectionGUID: AEWvUAkFRJ2w7fEDWOQyAg==
X-CSE-MsgGUID: 3npasfWTRV6VX/a231rvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="171555795"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:57:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:57:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:57:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzW4SMK9Ey85ZJFnpAR5ksx0eFWpryhmRy6IBbHzX/V96V/4CLiESrb/U282PM2vfglxfMw4F9V/pDiegRo0ocPImVUUgbsrk4dabwzgZ9LG2zzUruuYZAQu1O1HBmfy5jcSzShUSVs2JcmBpcP6vsFC/jD/2DvRh4cnZ3salagFfVHbYl+AciF8hPNbA963ExY9mBw36TrQQGv4UvvXpUizN/wt6nMbpEF60wQ1cb7HmNVQ1WldmjH0VZSceW9E7u1iPRRFldrqu6OigDbBTAauxalDYs3L4o9GpQJN1RHilD8/Jf+Jpa24afxA3mWDscoMegrzl6U2SjV4+Xj9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWcfw6lm6PUW3xCo33ANYfm4UIrnmMWa/zq+pi0yUjo=;
 b=p6u3/qtwEE4P02jReRtt0OHg4ACj0kEHHrfoqSx+RSlAEOmxNdYU48d4mM3cyoy6IEGAtAcrYa8LtQUkpDiK05F54iwI1BK9FOI2VqQFzT3ETOvMRhXkDLwf3Nwpz0LA2TbYDnLl4nyKRiJrqNK+3H0LFz/2/jdRbNRmAVHlplbqFxLJueyeJzh6Dauc1/Lh/mQqO6xGaIGLgO/SrQkQXYEBZlgHkiWsyc+vCd93MNxVciR8qD8T9ro4F+rUosHeiggw5kAxjGIQy8OgN2HG9UIetFJFYUz+lQjn4KE3z2aK5WJ7zLMXtTfxyzO9qXXzG/aMLDgigX0tpsyrLgd7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:57:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9052.024; Thu, 4 Sep 2025
 20:57:24 +0000
Message-ID: <ddf7168c-4fc3-44ac-9c29-a0f4e0e38125@intel.com>
Date: Thu, 4 Sep 2025 13:57:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix error handling if PXP fails to start
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
 <fe1b455b-9917-4dec-8a16-94daa922263f@intel.com>
 <b820386a-79c0-4726-87c7-69806a110b79@intel.com>
Content-Language: en-US
In-Reply-To: <b820386a-79c0-4726-87c7-69806a110b79@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: d96e1e03-a43d-4d36-0314-08ddebf5a632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtlWGtub3R1M0tFYk44eDNReDZsbkxFa2p2bDVwSW5XOVFvL3JScDhKMm5p?=
 =?utf-8?B?Zm94UEt5SlpBWVJxMTczbjdNdmFaeVVxZWRNY1ZPMGxITUxIbjA5Lzk4d1Mw?=
 =?utf-8?B?WWgvaldQZEl6MHRkaDFiYWJaeGNFZGszSWNVcml1UnpkTHNJWWVWMXFTQ00r?=
 =?utf-8?B?cDdyOTRPb0xEbXk1QmlwWUpVaUNaYk02b3RmZHhSa1NoZVUzU0NHRUJUZFp2?=
 =?utf-8?B?a3lEb3hoT1ZFWkR0VXpCdzJ4VWdkWWhhQzY0OGlWelRQcU5JdmVpMGZWbW11?=
 =?utf-8?B?UVdDbXJJNzc3ZUFzSVpvV28xWERoSHdxVUJPejdxcTk0QzM1VkJIRjdaWHQz?=
 =?utf-8?B?Z1FIRGhKanNtL0ZTZ2ZmWVhaTitCODRGMlMyU3lQOEptOE5tdXN6V3dvWUQ2?=
 =?utf-8?B?anY0bHptT3JwbUVHeXRRZlpwbXhTM3Rlc21RcFN4aXpzSlFZSWIyL3hIVWMr?=
 =?utf-8?B?UEtORDNmTkMyUkpjbmt4bzMySmc5VkZSQzlGbkV4NHp1RUZWMENKZzkvcWF1?=
 =?utf-8?B?bmpzdmNMWEVuS0Y1ODBadkMxY3huK2cvakxTY1VUcWdnVWlYNmJLQmRLek1a?=
 =?utf-8?B?K1JtOSsyWU40WWRMTjhoeFFYSEZaVzNCa2orTGF4bGRIbmtDQ0p4cGxEU2h5?=
 =?utf-8?B?RlAyMk5QaFljYy9OaWFoWGxCaGdDeVh3SXRVSnpBQjBGWUYwZmI4WjNxSTFF?=
 =?utf-8?B?Z1RvUm9BVDlPYjF3ZUhGM0pJbGFCWmlHMWJ5OG0wY2NqanRYcCtvUGZOU1Ey?=
 =?utf-8?B?OEtybSt4TmFJc3p5bEl0MyttZHFhSHAzVjU2eDJNRk9WYWQxU21wNDFId1NE?=
 =?utf-8?B?Z1dtNnl2ZHp4dFlZQzdaWmh6NlRIYnVia28vNDlkOUY2bGJ3MVBjeTMxenJI?=
 =?utf-8?B?OXZ6VXdWV3Q0ZGtsSGt0dVY1R0orOGRMb3Q2RmFaNThURHJmeXVVd0JpREFk?=
 =?utf-8?B?aHVCdnFuTzVJcU1oNGlQVXhmTkM3V052bmtzNmh3VE1BOVpoSENoMmV1TlBO?=
 =?utf-8?B?SEJQeFJBcjV1d1Y3QXpDM01iQTE4UUlya3Y5SDQ3Tmc3d2hwSUNEUnowM0JK?=
 =?utf-8?B?SmJ6WU51S1dzUng2TmFXUFRwbWRVbnVad2s5WjIrM2taTG1LeWQ4ODUwU01H?=
 =?utf-8?B?UXJ0Y2NRMkttZzVLOFg3TFFXL1YrQmZwdU1wNzYzRU1VZkpzWENnNDlKaVph?=
 =?utf-8?B?NUFEYmpvYXpETGhFQlE4REkrcitNT1M3SGFDQU8reWdFb2s2UEh0SFlhNHVZ?=
 =?utf-8?B?RGhlUDViamxhZ01MM1M0d3AxSlhMNVdWZ1JKbHVqTTh6TlFzRjE5MEx5OVhw?=
 =?utf-8?B?N2hUdHBubUU4dHRNMTEvQjhiZzZoaEZtQ0o2NmxVUEtFc2k1T2lndTBUTTRT?=
 =?utf-8?B?dTdYT0V6bWtnZ2NST2N3eEZqbkpoUWxsc05wc2VGeEVZbVR4QlRtOGN1QlNS?=
 =?utf-8?B?UFJ5dmIwckxsRXFwMWJlNjJHL3NGVE8wekFUR3Yrajl2SVdkalVYOGlVUzhO?=
 =?utf-8?B?amk4VGZtanhWdHNFSms1QnEwWlZWc1Bwb0o0NjB0Z0p6ajNFYXB1RmdqV2o0?=
 =?utf-8?B?cnBjbGxIeVNWZDh5Y3ZqdEttY2IzUTArUktkbVlrQXVHN3hxaTk3SHMyczJw?=
 =?utf-8?B?UmZMMkF4SW1MTjdUdEZhR0ZiNlBrYkVFeTBZSkdqUHg4MXJiVVI0eVBlVGZi?=
 =?utf-8?B?QzNBZ0FKYmRnNUZNV2oxVWRvYjl6Vkd1UStIZHhydnloUnlUQnAvekxxQ0hY?=
 =?utf-8?B?Z2VlU2wxZmVwV3F1U3BkSjJueGNFSDN2WHR3K3d5Z21JTVd1U1J5WXpmWWtE?=
 =?utf-8?B?SXY5UUJXN0ZXc1VybWdySmc1Z01iRG5SWG5sNit0WURaV00xUllPbDZ6TTBT?=
 =?utf-8?B?UWszVjNMcXp3N09xWGYxeXhSbTJMcml0Wk5aTGtpdTRIbnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXpFNitiOWpkemN5M3liRVF4QWtPWEZrVy8vVU11WGMwblRseDdSQlgwSHdO?=
 =?utf-8?B?U3VabmtNTUNMVWdhY3U1dnd3ODhQS0ZFQm4xMTlzMDFCWUlMZUJQVDRnc3o1?=
 =?utf-8?B?emRzd3V0TEJKcjJ4UDE0R2VOUm00QlBwT0FLNU15aHZZbnBGQWJzU1V4VTlI?=
 =?utf-8?B?MnJ4R09KckFRV2tHQmw4NnVML2V2UnBpTHQzNGJKbUhXNzZJSHVpYkQ5V0xE?=
 =?utf-8?B?bVg0Sjl2UXh1aEJPMDhCNWNyc3FTbVllcFpFeWE2djFrWEQvYzNlOGgraXRL?=
 =?utf-8?B?UjBJMlEvbTk2RjJjWm5zMGljNlJPMUY2aDJtQ2NKRllkd1B4MDM2UTVUdGRm?=
 =?utf-8?B?OW9nMm8ra2xydTF0c1kzK1FUQTUzY0JpSGphelpqRUlqaDR1b3dpNXpvaDEr?=
 =?utf-8?B?eXFhdEUvRDhvWW82cDJFUktsVHBRdTZBSzhleVZEWWFVd3M1Z0FvMG5DSVlO?=
 =?utf-8?B?bzlTVkhDT0kzRGIySDZickRpQ1ZmU3FoTCtMd1FjRTVBNHgzdDdsdHF1elJI?=
 =?utf-8?B?T2VpdE91WFVtbGJpaVNVeHNJUXlkWGd1a2FkdkM1MkhuQ01JNEY2b1hPRFdY?=
 =?utf-8?B?d1pwVUdLT1pIaGk3aitLTkdBYkpyVTN2ZGNFdyt4YlBHSENDZTQwUVEvVURq?=
 =?utf-8?B?RndRK1dTcCt4ckhkc2wzMkdsWElQTU9aUFhOV3NvVHRDeGgvcDd3VFJWQWxt?=
 =?utf-8?B?NkZNL0h5S1NpRVpBbXorQ2lJTGMzNFM1TGZ0U04yaUdnMTdaMVQyTlZVbU9w?=
 =?utf-8?B?aU0zcVVTc1puUHVITndrbXZmM0RJZU9BWFo1dk5CUEdWbFg2VndPaWhtRlZt?=
 =?utf-8?B?bEVIWEg3UnZJY2ZtQnFMWWxiZWNsN09YU0lESkFyMVhLM20wZzYzOVhhMkhP?=
 =?utf-8?B?Sm8zZGZaaDNPT0lMa2c4SEJEK3JCaklFVEV3YUpybmlkenFyMTlKMmY5VVpq?=
 =?utf-8?B?aTlTN3dlRzZLemVTR2xZYXcvRjNNU01DVkRjZVhjSVpOOXZDemlNSDNOcUhJ?=
 =?utf-8?B?Z3phQ3ZNaEF4WFAyK3NDYzhtYzhtdUxoUUk5dDNtTGFlNFF3VThPekgzMlJh?=
 =?utf-8?B?WWw1VnJNeVZKZ3hwb2NGZTdSQlVkZFdJbkZxT2NxRHQxNFE4bk5wT25mZVAv?=
 =?utf-8?B?NW1MM1V3T2pzMXRZWFlLWHdWa2RiYjIxZnFOZFRZMldHZG14UjFuWEtzbmMv?=
 =?utf-8?B?aWlxWnBFeXVaSzd0Y0tkZCtFQzhOTXZYa2VYUkhQNWxRdjdWL09hcUZYMkxo?=
 =?utf-8?B?bVBHVjI4MEoyZnJnYmk0V3pTYzBOQWdDMWQ4MUVWU2dNcm5CMkdNZlc1NGtn?=
 =?utf-8?B?NCtBb3pjUmhHODhsSkg5aWNkbFRJZjRHdThkR2x6VFpmemZUSDBkQVY0OEhh?=
 =?utf-8?B?bWFxc2ZJTTZEQmVDVEd3MllvcytveWM2SmpRK0VnRjVrd0xoeS9YRTF6OWpE?=
 =?utf-8?B?SlA0UkI0RnFybENsUGlRQldZRVhJblNuaFl3WUd5Q05LeEd2UmxXZ0RYQ1ZN?=
 =?utf-8?B?a3VOZnlHMFByTlJHS1VaYktBc0pQSDlheXlId2syMkJJRDlocEhiYmFMUUhk?=
 =?utf-8?B?RlhXVFJUQkMyZTZKajN2bEFJbUlHZDZTUXB1eXpRVmNCVXl4RDVRWmhQd3VF?=
 =?utf-8?B?cjFzWGtXbTc2ckdxb1JqVGlMMitySkJYbUJMaHQ1S295OEdMUDh3Y2NwVm94?=
 =?utf-8?B?YTlLWmhLTG5sYkV4RUJxanFFOVNNTFpUUWUzQ2NLMFp5S0Z2SnJLOWJZYnp1?=
 =?utf-8?B?YmpDclc1S3ZEbTV6c2c4VGZGSjM0ZFJuRnRDdkxaZnpEMGsxd0NMQTBDSkRr?=
 =?utf-8?B?Rm80Q0s5WU1MVnZQaGdINnVWcTF2TGRVaWVraWdoVUhONk5DRk00cnI0Y1pV?=
 =?utf-8?B?TlpyTjJzc0lxcHBXSCt1YVVGMWhSREszaHpXeHVJaDBZMTVmNFdTaDlTK25G?=
 =?utf-8?B?TFBZc2VZVTc1cThFTSt3cmh4eExkWXd3VVowa08vWkRYbFAzcFNUL3JTSkpZ?=
 =?utf-8?B?Zmk2dlVJL2lqV0tVemlKMTNxOUJMemwxVXRtYUZzcWo5cHR2Y25kcHIvbnhz?=
 =?utf-8?B?VDhLUmQ2ZkNOd0ZwVzlPT1ZJbXdidzhsUllTZC8ySlI3U3d6S3orRGRKam85?=
 =?utf-8?B?b2Y4TWljNXozMEw3elUrOEpTV1JkNElvd3ZLbFlqR0todkF5OFNWaEQyL3ly?=
 =?utf-8?Q?SsE6uFbcILDy9IWGAHlZ4tA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d96e1e03-a43d-4d36-0314-08ddebf5a632
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:57:24.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPg+6Ygcz37br9OOtkKoPMduffKhdy1kICiL8mRsobm3NKMRtqpuy7jvPVi3Anx5XbRlA8quITfqFqDAFpNO/8Txs6sPX9F3/RqGpRT65UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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



On 9/4/2025 1:55 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 9/4/2025 1:45 PM, John Harrison wrote:
>> On 8/18/2025 4:46 PM, Daniele Ceraolo Spurio wrote:
>>> Since the PXP start comes after __xe_exec_queue_init() has completed,
>>> we need to cleanup what was done in that function in case of a PXP
>>> start error.
>>> __xe_exec_queue_init calls the submission backend init() function,
>>> so we need to introduce an opposite for that. Unfortunately, while
>>> we already have a fini() function pointer, it is does perform other
>> it is does?
>>
>>> operations in addition to cleaning up what was done by the init().
>>> Therefore, for clarity, the existing fini() has been renamed to
>>> destroy(), while a new fini() has been added to only clean up what was
>>> done by the init(), with the latter being called by the former (via
>>> xe_exec_queue_fini).
>> It would be much easier to follow the changes if the rename was split 
>> into a prep patch and then the behaviour change patch was just the 
>> behaviour change.
>
> This is a fixes patch, so I wanted to avoid having prerequisite 
> patches for it because it'll make it fail to apply.
> The other option I thought of is to do something like:
>
> patch 1 (fixes): add a new function pointer with a new name (fini_last 
> ?) to undo the init() action.
> patch 2: swap the function names (fini -> destroy, fini_last -> fini)
>
> However, not sure if this is better because we'd leave unbalanced 
> naming with only patch 1.
>
> Thoughts?
> Daniele
>

Thinking about it a bit more, I could also split it as you suggested for 
review and then squash it before merging.

Daniele

>>
>> John.
>>
>>>
>>> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support 
>>> for PXP-using queues")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c           | 24 ++++++---
>>>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |  8 ++-
>>>   drivers/gpu/drm/xe/xe_execlist.c             | 25 ++++++----
>>>   drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
>>>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +-
>>>   drivers/gpu/drm/xe/xe_guc_submit.c           | 52 
>>> ++++++++++++--------
>>>   6 files changed, 74 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c 
>>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 2d10a53f701d..bce507c49517 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>       return err;
>>>   }
>>>   +static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>>> +{
>>> +    int i;
>>> +
>>> +    q->ops->fini(q);
>>> +
>>> +    for (i = 0; i < q->width; ++i)
>>> +        xe_lrc_put(q->lrc[i]);
>>> +
>>> +    return;
>>> +}
>>> +
>>>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, 
>>> struct xe_vm *vm,
>>>                          u32 logical_mask, u16 width,
>>>                          struct xe_hw_engine *hwe, u32 flags,
>>> @@ -229,11 +241,13 @@ struct xe_exec_queue 
>>> *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>>>       if (xe_exec_queue_uses_pxp(q)) {
>>>           err = xe_pxp_exec_queue_add(xe->pxp, q);
>>>           if (err)
>>> -            goto err_post_alloc;
>>> +            goto err_post_init;
>>>       }
>>>         return q;
>>>   +err_post_init:
>>> +    __xe_exec_queue_fini(q);
>>>   err_post_alloc:
>>>       __xe_exec_queue_free(q);
>>>       return ERR_PTR(err);
>>> @@ -331,13 +345,11 @@ void xe_exec_queue_destroy(struct kref *ref)
>>>               xe_exec_queue_put(eq);
>>>       }
>>>   -    q->ops->fini(q);
>>> +    q->ops->destroy(q);
>>>   }
>>>     void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>   {
>>> -    int i;
>>> -
>>>       /*
>>>        * Before releasing our ref to lrc and xef, accumulate our run 
>>> ticks
>>>        * and wakeup any waiters.
>>> @@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>>       if (q->xef && 
>>> atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>>> wake_up_var(&q->xef->exec_queue.pending_removal);
>>>   -    for (i = 0; i < q->width; ++i)
>>> -        xe_lrc_put(q->lrc[i]);
>>> -
>>> +    __xe_exec_queue_fini(q);
>>>       __xe_exec_queue_free(q);
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h 
>>> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> index ba443a497b38..27b76cf9da89 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> @@ -181,8 +181,14 @@ struct xe_exec_queue_ops {
>>>       int (*init)(struct xe_exec_queue *q);
>>>       /** @kill: Kill inflight submissions for backend */
>>>       void (*kill)(struct xe_exec_queue *q);
>>> -    /** @fini: Fini exec queue for submission backend */
>>> +    /** @fini: Undoes the init() for submission backend */
>>>       void (*fini)(struct xe_exec_queue *q);
>>> +    /**
>>> +     * @destroy: Destroy exec queue for submission backend. The 
>>> backend
>>> +     * function must call xe_exec_queue_fini() (which will in turn 
>>> call the
>>> +     * fini() backend function) to ensure the queue is properly 
>>> cleaned up.
>>> +     */
>>> +    void (*destroy)(struct xe_exec_queue *q);
>>>       /** @set_priority: Set priority for exec queue */
>>>       int (*set_priority)(struct xe_exec_queue *q,
>>>                   enum xe_exec_queue_priority priority);
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c 
>>> b/drivers/gpu/drm/xe/xe_execlist.c
>>> index 788f56b066b6..f83d421ac9d3 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -385,10 +385,20 @@ static int execlist_exec_queue_init(struct 
>>> xe_exec_queue *q)
>>>       return err;
>>>   }
>>>   -static void execlist_exec_queue_fini_async(struct work_struct *w)
>>> +static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>>> +{
>>> +    struct xe_execlist_exec_queue *exl = q->execlist;
>>> +
>>> +    drm_sched_entity_fini(&exl->entity);
>>> +    drm_sched_fini(&exl->sched);
>>> +
>>> +    kfree(exl);
>>> +}
>>> +
>>> +static void execlist_exec_queue_destroy_async(struct work_struct *w)
>>>   {
>>>       struct xe_execlist_exec_queue *ee =
>>> -        container_of(w, struct xe_execlist_exec_queue, fini_async);
>>> +        container_of(w, struct xe_execlist_exec_queue, destroy_async);
>>>       struct xe_exec_queue *q = ee->q;
>>>       struct xe_execlist_exec_queue *exl = q->execlist;
>>>       struct xe_device *xe = gt_to_xe(q->gt);
>>> @@ -401,10 +411,6 @@ static void 
>>> execlist_exec_queue_fini_async(struct work_struct *w)
>>>           list_del(&exl->active_link);
>>>       spin_unlock_irqrestore(&exl->port->lock, flags);
>>>   -    drm_sched_entity_fini(&exl->entity);
>>> -    drm_sched_fini(&exl->sched);
>>> -    kfree(exl);
>>> -
>>>       xe_exec_queue_fini(q);
>>>   }
>>>   @@ -413,10 +419,10 @@ static void execlist_exec_queue_kill(struct 
>>> xe_exec_queue *q)
>>>       /* NIY */
>>>   }
>>>   -static void execlist_exec_queue_fini(struct xe_exec_queue *q)
>>> +static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>>>   {
>>> -    INIT_WORK(&q->execlist->fini_async, 
>>> execlist_exec_queue_fini_async);
>>> -    queue_work(system_unbound_wq, &q->execlist->fini_async);
>>> +    INIT_WORK(&q->execlist->destroy_async, 
>>> execlist_exec_queue_destroy_async);
>>> +    queue_work(system_unbound_wq, &q->execlist->destroy_async);
>>>   }
>>>     static int execlist_exec_queue_set_priority(struct xe_exec_queue 
>>> *q,
>>> @@ -467,6 +473,7 @@ static const struct xe_exec_queue_ops 
>>> execlist_exec_queue_ops = {
>>>       .init = execlist_exec_queue_init,
>>>       .kill = execlist_exec_queue_kill,
>>>       .fini = execlist_exec_queue_fini,
>>> +    .destroy = execlist_exec_queue_destroy,
>>>       .set_priority = execlist_exec_queue_set_priority,
>>>       .set_timeslice = execlist_exec_queue_set_timeslice,
>>>       .set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h 
>>> b/drivers/gpu/drm/xe/xe_execlist_types.h
>>> index 415140936f11..92c4ba52db0c 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>>> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>>>         bool has_run;
>>>   -    struct work_struct fini_async;
>>> +    struct work_struct destroy_async;
>>>         enum xe_exec_queue_priority active_priority;
>>>       struct list_head active_link;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> index a3f421e2adc0..c30c0e3ccbbb 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>>> @@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
>>>       struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>>>       /** @lr_tdr: long running TDR worker */
>>>       struct work_struct lr_tdr;
>>> -    /** @fini_async: do final fini async from this worker */
>>> -    struct work_struct fini_async;
>>> +    /** @destroy_async: do final destroy async from this worker */
>>> +    struct work_struct destroy_async;
>>>       /** @resume_time: time of last resume */
>>>       u64 resume_time;
>>>       /** @state: GuC specific state for this xe_exec_queue */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 860c07da598a..75208ea4d408 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1418,48 +1418,57 @@ guc_exec_queue_timedout_job(struct 
>>> drm_sched_job *drm_job)
>>>       return DRM_GPU_SCHED_STAT_NO_HANG;
>>>   }
>>>   -static void __guc_exec_queue_fini_async(struct work_struct *w)
>>> +static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>> +{
>>> +    struct xe_guc_exec_queue *ge = q->guc;
>>> +    struct xe_guc *guc = exec_queue_to_guc(q);
>>> +
>>> +    release_guc_id(guc, q);
>>> +    xe_sched_entity_fini(&ge->entity);
>>> +    xe_sched_fini(&ge->sched);
>>> +
>>> +    /*
>>> +     * RCU free due sched being exported via DRM scheduler fences
>>> +     * (timeline name).
>>> +     */
>>> +    kfree_rcu(ge, rcu);
>>> +}
>>> +
>>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>>   {
>>>       struct xe_guc_exec_queue *ge =
>>> -        container_of(w, struct xe_guc_exec_queue, fini_async);
>>> +        container_of(w, struct xe_guc_exec_queue, destroy_async);
>>>       struct xe_exec_queue *q = ge->q;
>>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>>         xe_pm_runtime_get(guc_to_xe(guc));
>>>       trace_xe_exec_queue_destroy(q);
>>>   -    release_guc_id(guc, q);
>>>       if (xe_exec_queue_is_lr(q))
>>>           cancel_work_sync(&ge->lr_tdr);
>>>       /* Confirm no work left behind accessing device structures */
>>> cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>>> -    xe_sched_entity_fini(&ge->entity);
>>> -    xe_sched_fini(&ge->sched);
>>>   -    /*
>>> -     * RCU free due sched being exported via DRM scheduler fences
>>> -     * (timeline name).
>>> -     */
>>> -    kfree_rcu(ge, rcu);
>>>       xe_exec_queue_fini(q);
>>> +
>>>       xe_pm_runtime_put(guc_to_xe(guc));
>>>   }
>>>   -static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
>>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>>   {
>>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>>       struct xe_device *xe = guc_to_xe(guc);
>>>   -    INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
>>> +    INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>>         /* We must block on kernel engines so slabs are empty on 
>>> driver unload */
>>>       if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>>> - __guc_exec_queue_fini_async(&q->guc->fini_async);
>>> + __guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>>       else
>>> -        queue_work(xe->destroy_wq, &q->guc->fini_async);
>>> +        queue_work(xe->destroy_wq, &q->guc->destroy_async);
>>>   }
>>>   -static void __guc_exec_queue_fini(struct xe_guc *guc, struct 
>>> xe_exec_queue *q)
>>> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct 
>>> xe_exec_queue *q)
>>>   {
>>>       /*
>>>        * Might be done from within the GPU scheduler, need to do 
>>> async as we
>>> @@ -1468,7 +1477,7 @@ static void __guc_exec_queue_fini(struct 
>>> xe_guc *guc, struct xe_exec_queue *q)
>>>        * this we and don't really care when everything is fini'd, 
>>> just that it
>>>        * is.
>>>        */
>>> -    guc_exec_queue_fini_async(q);
>>> +    guc_exec_queue_destroy_async(q);
>>>   }
>>>     static void __guc_exec_queue_process_msg_cleanup(struct 
>>> xe_sched_msg *msg)
>>> @@ -1482,7 +1491,7 @@ static void 
>>> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>>>       if (exec_queue_registered(q))
>>>           disable_scheduling_deregister(guc, q);
>>>       else
>>> -        __guc_exec_queue_fini(guc, q);
>>> +        __guc_exec_queue_destroy(guc, q);
>>>   }
>>>     static bool guc_exec_queue_allowed_to_change_state(struct 
>>> xe_exec_queue *q)
>>> @@ -1715,14 +1724,14 @@ static bool 
>>> guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>>>   #define STATIC_MSG_CLEANUP    0
>>>   #define STATIC_MSG_SUSPEND    1
>>>   #define STATIC_MSG_RESUME    2
>>> -static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>> +static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>>>   {
>>>       struct xe_sched_msg *msg = q->guc->static_msgs + 
>>> STATIC_MSG_CLEANUP;
>>>         if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && 
>>> !exec_queue_wedged(q))
>>>           guc_exec_queue_add_msg(q, msg, CLEANUP);
>>>       else
>>> -        __guc_exec_queue_fini(exec_queue_to_guc(q), q);
>>> +        __guc_exec_queue_destroy(exec_queue_to_guc(q), q);
>>>   }
>>>     static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>>> @@ -1852,6 +1861,7 @@ static const struct xe_exec_queue_ops 
>>> guc_exec_queue_ops = {
>>>       .init = guc_exec_queue_init,
>>>       .kill = guc_exec_queue_kill,
>>>       .fini = guc_exec_queue_fini,
>>> +    .destroy = guc_exec_queue_destroy,
>>>       .set_priority = guc_exec_queue_set_priority,
>>>       .set_timeslice = guc_exec_queue_set_timeslice,
>>>       .set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>>> @@ -1873,7 +1883,7 @@ static void guc_exec_queue_stop(struct xe_guc 
>>> *guc, struct xe_exec_queue *q)
>>>           if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>               xe_exec_queue_put(q);
>>>           else if (exec_queue_destroyed(q))
>>> -            __guc_exec_queue_fini(guc, q);
>>> +            __guc_exec_queue_destroy(guc, q);
>>>       }
>>>       if (q->guc->suspend_pending) {
>>>           set_exec_queue_suspended(q);
>>> @@ -2202,7 +2212,7 @@ static void handle_deregister_done(struct 
>>> xe_guc *guc, struct xe_exec_queue *q)
>>>       if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>           xe_exec_queue_put(q);
>>>       else
>>> -        __guc_exec_queue_fini(guc, q);
>>> +        __guc_exec_queue_destroy(guc, q);
>>>   }
>>>     int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, 
>>> u32 len)
>>
>

