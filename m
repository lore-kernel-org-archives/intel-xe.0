Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B378ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 06:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CE410E6DB;
	Tue, 10 Sep 2024 06:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh54vIWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F94C10E6DB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725950294; x=1757486294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=02H9s8Xqg0KHYGvnYYIDMBrA8iRkOsSob+rodKwY3kE=;
 b=Zh54vIWq2WQJ22z+3J40DO50+IUlZlpGbpv32726KeDOHgHnizigh4eU
 ZJrxBZiDJ69hAuju54n/mHPCZrkGZhUD9COSoLFtGN7Eb52lULZ2EVpMg
 ooOJDCp8j3RwAE0jy0/J9Q8IejiPt8HOpJK0Uow/ABlI6tBcTjxwB0ZMr
 JEwqZBSS92hPfINLqGhEmT80kRIboz5N26kxJh2ZTDTlYyVdOScmB+rq+
 RAQGP2pbHry01FOeeVEDAQ0iImuCeGJ7ueavRzT1hSMoADJb5ZMxf15GW
 96bGmuLf5b8Na2dPhIZ29wG863MsnUZMmZ3q5+vYcqrt+S2N8e1RjzpcO g==;
X-CSE-ConnectionGUID: p3iu5LvBTqmMWYQvYI4vdQ==
X-CSE-MsgGUID: Lwir9K4bRaqW1oq+DHKjCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42196759"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208,217";a="42196759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 23:38:14 -0700
X-CSE-ConnectionGUID: c5NdVso+Q/2iHrd4OPSE2w==
X-CSE-MsgGUID: 078Dh9/NRYSYlk60eJfO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208,217";a="66550789"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 23:38:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 23:38:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 23:38:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 23:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um5SdDAnyVelRVD7q02JXCQ17jlQ7QXUhy1Fn3Lj0VRAZKTqWuGw8s1stp94D5OTX60YMJIpy65FNioDAd3L122COy85UI5aU39eNMXetrQMfznMpABOURvKjdEV3fDJfzannWdS9X0XC1ey0acw5GtTeo0NRyHEpCaG2xLO3ARLv1foZV4S8ndSIzFWO2eTwTHJSYJns6c8PH0aR8cAZA58YQ748zWiGPEYMlsh7tigl7RYKrV19+AB9zU1oCWTGJVR4d6kDD8rjfX6GoS7D3i3hghiktwCwKsuaeNCO/LtyZU7/nP7HO2KJYszEucVHjrJu0QgBo2cZI+HMO2DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGIIK2sEyJkOjrck91G+NNoeGTWKTVkAnpnrEr1ZEm4=;
 b=LPz6qMzsY5/cclAJkwAAcsvekTXE9Zx/rbWMSGdf1Wpr2RgPQh2xydetFIdgjgRz81SZ3CSd/Nj8emYttdJWCaHllruH354Lv0rL7NN2ntqijLJDE75XecIdBBQJurLarJRqGkJrskCfOvjIMjMOhJzEDadhcJjyQndoJk/mZtLKosIqgkc9PgqwCZh4rXyJFKqxGfWemb5DAhgIHsf4OIRZ2qxbPL900L6c4DCPq6gzD4QZlWi6uMAcD9cBg6l+FXnISnx51MCLmC/fUmJXs6gjP5x7kCUlc8cCggZwsV4LqW/vH181RveGb4uXk5hwLjKE8ac1Pt6is0vc2pA7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 06:38:05 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 06:38:05 +0000
Content-Type: multipart/alternative;
 boundary="------------ZG02J6EE0cLPYOGVSENU5VVh"
Message-ID: <fbeba95c-01f3-4381-968f-6854c8646737@intel.com>
Date: Tue, 10 Sep 2024 12:07:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/xe/ptl: Add performance tuning settings for PTL
To: Matt Roper <matthew.d.roper@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-9-matthew.s.atwood@intel.com>
 <20240906235524.GA5774@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240906235524.GA5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 2630465f-1b69-4264-9ea4-08dcd1632025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFhIcVhCUGNzSHZlR3ppZkNkZ1JQRzl6bi9mckpwcHFiamFzd0p3dWVMdkpS?=
 =?utf-8?B?NlE5OG1QblV1SXRFUFBvanh5aG9pSUQ1WlpCWlFnbVpKNTJjcXAzc2NGSjc1?=
 =?utf-8?B?WjBXRHlGNzZzMmdaZFlvN014QUNjN01DM3lpY3libGdTK3MzUWdWdkEwTXUw?=
 =?utf-8?B?YXlDMFhOM0FMb1FkM2x4eWRndWlTQURoNGxTU25uT0tIaEpVOEx6SUwyYlFK?=
 =?utf-8?B?NWZST3E0Q1JxRnRCODhwWldMTGJXV3BnQ0kwbHM0U3dMNkhCNE1RVGkwV0dE?=
 =?utf-8?B?M0JqaTlpTVphaDg5T1Iva2svNHh1dUdXQndHTTJVUFlHT1hMVDBkekJwbXQ1?=
 =?utf-8?B?TTgrdEllYklQUkw2Tm1VL25UKy90c3JINGtIK3lid1JRVkc3K0p1M254RUw2?=
 =?utf-8?B?akRzc0p5MEFCYzR2RmRlMmlsc3J0aE95TXlIVTAzdkdmQjYvUjhMeTAvcUlC?=
 =?utf-8?B?MUsxNktzVlpCWUpxVVgwOThzaGhaaExUSWpJQ3dac2FZUksyajU4WDlJQVFz?=
 =?utf-8?B?ekF5TmFzMUR1MkJkS2Rud2NiWFo4ZHdyYlhlajhkM1BvRUtIMklBcTJrM0sz?=
 =?utf-8?B?TzRyeGdHSW1oeTQydEdhdzl2UVhGRFBoc3FiWlFmZGtDSWpnQStRVWwrNTdk?=
 =?utf-8?B?MGNQQXpRTDlISGcxNFpNdlFSMlpkKzUrd3lGSHhDdjRVNXVKNVIvVXlSak5Z?=
 =?utf-8?B?a2xrcGtDaElNNGhIK0pxMnVzclFMc3U2NGZYZ1psU1RncUcxaHd5SDlSamQ0?=
 =?utf-8?B?UzQzQ1Q5Y1VyUmNMUTcxaWpUY0FHQjlnaExIS1h4aWljTFVxakRJRlFBbWNF?=
 =?utf-8?B?ZnhraGNhM0VWYVRSdUd0NnFjTnJpMGM0L2VWTEpYODhKV1hQcjBwK1VYWjM1?=
 =?utf-8?B?alhFRGFRN3Q0MlR1dkZnNlhobmpVaFQvbWU4TmxBTW5JemR2dENkWFZUNG1z?=
 =?utf-8?B?UjVHeGRwS0plWDQxeTlOUmVLd0JtSjlUSDloNk53QjMybUJqa1N4RnJPLytE?=
 =?utf-8?B?clppWmVlVWlyU05Ic21iS2YxYklQTU95eFlIc2FSeURpNTJmK3o1UlFKTDBD?=
 =?utf-8?B?WmMyTnUvdFJyUUF2cGVKK2NNaXAzT04rTGV2ejdSUnJISnNpQnlqcnE2b3pG?=
 =?utf-8?B?bWYvVDQvWVpRanJ6RUxxU24yek1jVkJWSElKQTFOamovVS94cEloVGhTZ1hH?=
 =?utf-8?B?QzM2MnJiL1ZEQ1U4alhhdWIvQ0MvbmxhK0VubjVZTzJEczVUcVZqWkZKcmtF?=
 =?utf-8?B?Zld0TDk2N0Zna0Y1c0s5bENDV0JZaUFaeWNYZkEwdkNVYk13NXhEczVFSE42?=
 =?utf-8?B?cWJHL1pJZHg5ZlFTYXJrb3Q0cjFrR3V2Tzg1azdjcFFwNkRPNlUwQ2cyRFlE?=
 =?utf-8?B?UlljckFGNnZrTzFUT243bGJJUnNKNTdxWis1enRZOGpoTzA3czMwYXlick5k?=
 =?utf-8?B?ZHg4czgyeks5K3ltZWdSRlpWZjIvSlpPeTVFblE5R2paVGNtVGNWR0FuRUZB?=
 =?utf-8?B?eUY5WTMwK2JuRjJ1WmxLWSt4WmxiZ1UzejBzbFFkOTBtdzNjSnY3WWt4RFdC?=
 =?utf-8?B?Sms5VnhISTFyenZDNzFCZmNtY1psc3ZhRzZLWkhTVStMMW12enl4QkNYbGZM?=
 =?utf-8?B?N0RlZ1R4eHl5T1pxU1puUnJrVlNUZ0lpMlVIN1NXdjcrRmJiQlJ0enJ3akhl?=
 =?utf-8?B?ZUdtM0xNKytsb1ZZTENCMlIzejFJNGc3d0QxcFhGVVQ2a09XdlFEdngyazM5?=
 =?utf-8?B?WW5vb2NhTzlkNFlUTVh2VXZKNFo3bzNxbUhsR3Bjd1ZUeExTUG5QbG5NNWEv?=
 =?utf-8?B?YnpxKys1WjFmWnhJSHFCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1hSMk5NM0lMSHZ3UUpPQkV1akpRMDMxYW83RkFYdnV5VmpZUW1hOTRQRm01?=
 =?utf-8?B?UXRFemlHS3NYSjQ0M0srcjQ2NlF2K09XNDA4b09WMm1pWnZNUSt2MW1Dd01p?=
 =?utf-8?B?VTFYNXN3QWlUc1pnTE50bFFyQjJUY1gxWCtVUytPUVUxNUZoNkVWSmJEMFNL?=
 =?utf-8?B?eEkzS3pJUEtZamM1eHFudk1NZWdOUTNlbDhNbkd6RUdrQ05HYmx3VUpRQ1BO?=
 =?utf-8?B?Q2cxN3IrbWlwd2hrU3BPK2FGOGhiOFB4QUcwdEpySFBkWnd6Q2JqemgvQmt1?=
 =?utf-8?B?dGNDVGlrQlNGd3V1SW9GZ3Z3Q3Y0akVYVFByTkF6M3RlTjBjUjFCb0NPdnAv?=
 =?utf-8?B?bXIxM010UzI4b3Y4M3IvZmllUmY5a1R4MXk5L2Ryc1gzY2c2ckx1SkVnaTRW?=
 =?utf-8?B?NlJIckx2OVJCQkxHcTBUT0RZelBlNndmQXlXS1Z0dEtVY1BPYUcvRmw4dWJ2?=
 =?utf-8?B?Ry9BOEdDUlBwNFFiWW1nYWpPZENFTmJNWHlSMFFLM0Y1ZTBUNEt6MDlCWmdV?=
 =?utf-8?B?NnF2QzdJNWhkSWVCbVl2QXh0U0lteEsvUjZxTCsyV3VlWmZ2OS8rdWlmY0Jm?=
 =?utf-8?B?MWVjMEt2cmE3NkVGeklxeUVPcS9NT3cySzBrbUJqMVUrOW5YYzNTWEx0MGlZ?=
 =?utf-8?B?cDZBNjlKQXk1M2hCQ1Q0QklYR2hNMy91RUpUSm1BWHgvSStYWVFka1NldVVC?=
 =?utf-8?B?RWRrNEZRSEdjOWV0M2gyMU5qc0hXdzFCenFieE1oK2JBUnBQMTZ0dmIrTzB4?=
 =?utf-8?B?Vkwwc0N3MVluZmRwQUxqUE9FRW1xTlpYOXI3SlpQYlZCNlZqcTdKWkg1MDI0?=
 =?utf-8?B?WXQxemhobkE0VkJuSDEvYThHK2d2Y0xRTDJDNlVpd3RwY3d3VVhveUVOSlFT?=
 =?utf-8?B?bmcwWXFVQUJJZ2lodVl6ZnpFNm5jNTZUbzFlbyt0OFRzL01GLzU3N2ZZQ2Nw?=
 =?utf-8?B?eENiME1ZeGVlS05tZ3p4aEhPZVdyRkFScWxFYUkxa3JyMi9vYWdvdy9EZTV2?=
 =?utf-8?B?RXV4WkFVV3ljSEViZzBFbW9lV2cyRUl1OFVjS2pJcWFOOXNLdTRxZFNjMVEx?=
 =?utf-8?B?YzdnVDg3M3B2UjR4djMrQllIVW5WZXcrbm9PQWdYanJxTVRkcmtGZEs5SDNZ?=
 =?utf-8?B?TTVFL0JLWlZpVlM1Zjl0Rm5EcjBweW5mTEwrMHFiVjI1V3IzVy9FbFovZ3Fu?=
 =?utf-8?B?YUdPQkFJODlaay9aMndzZFdTS2xRd0FoZVEzTXB4OEQ2TlkwR0ZRRnlmWXc1?=
 =?utf-8?B?SFk4V2V0S01semZrQXZKMFJBbFJKejBycWl5Q1lmMS9nOGExZy9tYk4rWS80?=
 =?utf-8?B?RjZzOXNlUkN5L3I3MVdxVHJzNDdpc2pHR3RhTVZEalpSODYvNVllWnc0aDJD?=
 =?utf-8?B?NnpTRkdQNCs1V04rYzVWeEEwelFWU081RlVMclhCaThObjJaZ3YrTDNzOW9h?=
 =?utf-8?B?VXFPOE5kb0FRQWduY05TUTczS2dHWVRrZEVoRk9mN0JqR2R1NCs3VTJQQzhm?=
 =?utf-8?B?NHFOcFFSWEdHZ2h3ZS9VMXdQWlRGRnhReU1mbjZ2dnZVaW1VQWZ2UURQL0lU?=
 =?utf-8?B?N0MvVzhSWGhCTTBDTXlzcjJ5aS83MzRIc0tHd01mUjdzVVh2VEFrSkJYUWtx?=
 =?utf-8?B?bDNXSXk5N3hBRFpFT01NRXBQbjllQnJvQi9LQkVYbVozVkF1a1lTb3V3OHVl?=
 =?utf-8?B?ZXdoT2wzWVBhT3c0T1FVUndZV3ZTcEc1bkEyVll3SUdPWTgySy8yNmdSTCtC?=
 =?utf-8?B?bkxiWnRpU2I1ZmlZeERJK1c4bEtrbDZEVE12WEdUZ3MwSDJaWjV2OGZSZ0hO?=
 =?utf-8?B?Sjd4VkhTWFZiVUdnSFNmbU9HY0d2TUhoVjhDSWJlWkt5clJlaW83T240Mmts?=
 =?utf-8?B?WjQxQWw4S3FSSEJhM2kvT2pJM1FHNjU0VkovNm5TOHJITDdCMVdXODdtVzA4?=
 =?utf-8?B?NWJ1bXhJbzR5VzBYdkNmTk5ITE1CTFhzWnNEbDdjLzRyYWVGSUFwc3hxWjBv?=
 =?utf-8?B?ZVVydzI4Y0ROV2dEeUdQRFhoMmEzTHB0dm5qcC81eXRERGFNenpsNmtsRGg3?=
 =?utf-8?B?bUtZcUx2empna1htZmVyREdXdjBkT2JYR3Z4cVRGWkRVa0J0WXYzZDNDMXBI?=
 =?utf-8?B?RGl0QXVVQUtyTXFZKy9pNlZ3L1RaYmVBZVdjNGtYUkFwTHNlQVMxR3YzVnFB?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2630465f-1b69-4264-9ea4-08dcd1632025
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 06:38:05.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdwdjnU+0ONQ4Y2gJ6qcoJHFQ9Bni8zviDkdiybQG9x4cKlHsR+5Tccgl0M3SA1QVuAXct2IUu/nUn9vaZSewq7msvxtsFodZ0TyCxjH0Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

--------------ZG02J6EE0cLPYOGVSENU5VVh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

I see a couple of new performance tunings for PTL, can we have them in 
the same patch and then rewrite the commit message, instead of it being 
only applicable to L3SQCREG5?

-shekhar

On 9/7/2024 5:25 AM, Matt Roper wrote:
> On Fri, Sep 06, 2024 at 02:51:52PM -0700, Matt Atwood wrote:
>> From: Matt Roper<matthew.d.roper@intel.com>
>>
>> The L3SQCREG5 tuning suggestion remains the same on Xe3 as on Xe2.
>>
>> Bspec: 72161
>> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
>> Signed-off-by: Matt Atwood<matthew.s.atwood@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> index faa1bf42e50e..9bb6afaa560a 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -25,15 +25,15 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>   	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>>   	},
>>   
>> -	/* Xe2 */
>> +	/* Xe2 / Xe3 */
>>   
>>   	{ XE_RTP_NAME("Tuning: L3 cache"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000)),
> We should just leave this one as upper bound undefined (i.e., applies to
> Xe2 and all future platforms until we come back here to change it).
>
>>   	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>>   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>   	},
>>   	{ XE_RTP_NAME("Tuning: L3 cache - media"),
>> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
>> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3000)),
> And we should probably use an unbound upper range on this one as well.
> In general we should probably assume that tuning settings will continue
> to hold true to future platforms unless/until we know otherwise, since
> that also matches how these things are now being documented in the
> bspec.
>
>
> Matt
>
>>   	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>>   				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>   	},
>> -- 
>> 2.44.0
>>
-- 
-shekhar

--------------ZG02J6EE0cLPYOGVSENU5VVh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">I see a couple of
        new performance tunings for PTL, can we have them in the same
        patch and then rewrite the commit message, instead of it being
        only applicable to L3SQCREG5?<br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">-shekhar<br>
      </font></p>
    <div class="moz-cite-prefix">On 9/7/2024 5:25 AM, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240906235524.GA5774@mdroper-desk1.amr.corp.intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Sep 06, 2024 at 02:51:52PM -0700, Matt Atwood wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>

The L3SQCREG5 tuning suggestion remains the same on Xe3 as on Xe2.

Bspec: 72161
Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Signed-off-by: Matt Atwood <a class="moz-txt-link-rfc2396E" href="mailto:matthew.s.atwood@intel.com">&lt;matthew.s.atwood@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index faa1bf42e50e..9bb6afaa560a 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -25,15 +25,15 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
 	},
 
-	/* Xe2 */
+	/* Xe2 / Xe3 */
 
 	{ XE_RTP_NAME(&quot;Tuning: L3 cache&quot;),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000)),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We should just leave this one as upper bound undefined (i.e., applies to
Xe2 and all future platforms until we come back here to change it).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME(&quot;Tuning: L3 cache - media&quot;),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3000)),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And we should probably use an unbound upper range on this one as well.
In general we should probably assume that tuning settings will continue
to hold true to future platforms unless/until we know otherwise, since
that also matches how these things are now being documented in the
bspec.


Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
-- 
2.44.0

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------ZG02J6EE0cLPYOGVSENU5VVh--
