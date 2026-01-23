Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53476D7236E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 10:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1405810EA9F;
	Fri, 23 Jan 2026 10:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MW5APpEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48B10EA9F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769164158; x=1800700158;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g2NOVNHQPozqbY2p8oul3AFZpLiz663k4erGCai5Q5E=;
 b=MW5APpEzQcXbnRG0VcWmbV1qmMRGlHdpMzUjD+GOPyxZA1llMBVMpjFB
 ie/LH/PDD1IPNFX0Yw9g8whnSZwNFVVlsz9aV+nX1NKCwZOPn7JtWCBay
 jAH6seCJ5qaGDcFLm4Qk79pKVOv73ruUnSjTKwy0bknsE6IUJGPpuEO7J
 WiB3Dk2bdvRmoGr6PHfgapZ6OOQCgN90NkTVkDQyBoMOs1yu4af5LH7Yn
 hb9HRokEeGFr02z/9ftOe18RAwje5CPwZaR4MyRXz/l2hGRzx3tMfq64K
 g1j6vxHebGh9jNS9gE66aBSQ8QYjxuW89XD0ziIGhFD/15A/LuublE4uL w==;
X-CSE-ConnectionGUID: A5OTqudiT1GYLJvH+ijAkw==
X-CSE-MsgGUID: 2GAZT0fgT/uADXPtyE+i/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73004340"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73004340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:29:18 -0800
X-CSE-ConnectionGUID: Wex2Sh7ZR9qt/6YiVjyLqg==
X-CSE-MsgGUID: nOV48dGKRa66PUJ9ed9u2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="244604284"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:29:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:29:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 02:29:16 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsyUAqAfrdOYhJpW8OWvY38dUFotD/maLGH0+FjOaOxd6wZXvSOzJMFHvCc7qYa1qYF2QORdMS4/F+onpQchK/Q4Wmn80m7QWgysQFF34HXhM3hz9QxwSEJSpOEFSYcLOaGJpck3ObQAStB/NAGHVdadLlP0fyX4oNOpfSfCkE5f6XVAap78VrycDrPk77/y7CNlqu04njgpZoCTuuW7moqJgv3TR/pGdlH7MIc4ZpZmXP3hBFSmDKh8JmJgSr0RkqggYKOKMIWnv1yUzmNAm/fFudhEK3EGd06aqbR9Q+j2eamviUUASeycoHxPyHJ5zJz6oq8rx7ZxZPoZLiYahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opl/gPYVf6QmoANybys8xLreZgPEvMk7iFqU1I2yg94=;
 b=pgNKX1XHQxW70b0GGGpqmfciZwtfdGBE1dQphvChEsKmUZqFkZhFkcZi7gpvckwBXS8Mu/NDKfq2Y/nBwH51/MjBTAfXt7ABBwxbnFbemDTvfmsDrU8SoSQ6jFn3MzCtcatZbFYudRRfVUPST7AwHVk1skn3xiwrmBgykKiQCjTlHSEy8PLmCDLmJLoW6GL5kc5gA2vobNvHjpXaiP+K5Boqc5XIjd2f2JZ5ehUBp0QEsuNJmtp8k36luKXwnRF+RKUQRQzHjr8BzvtpaJQvhC/UaWYvvBlTqGu/WRGJy0IXa+i0uR+yEQe6h0E9t++rIc5bcxTIV7cEiIuBb1pPYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:29:14 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:29:13 +0000
Date: Fri, 23 Jan 2026 11:29:10 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe: Keep all defaults in single header
Message-ID: <20260123102910.kvosqid5pozqg6jh@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121214218.2817-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0273.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae979a3-15f8-45d8-0701-08de5a6a407e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUVkUUtwR1JXenhSb1hFZHJsUWw5ZVhmQnhDcWdCc1lUaWtaZjdvM3dlek1N?=
 =?utf-8?B?ZkpGUWxuekNYNHdLcFdKTW1XWE5uR1dveFhSOTBwUmpHYW5Xa090M203MDdq?=
 =?utf-8?B?NUU0SHM0LzdTcTRuUmJnay8xdG5XNmwxblNmSmppVjl4TVp6QkFIZTRvcTcv?=
 =?utf-8?B?SW04Mk5hOXkxc0E1WHJ5Ylg3UE5ya3h2d25kOFdZTU40dEV6WlNKUE9sNTJT?=
 =?utf-8?B?Z2YrMUhvbUE1V2JIRTAwc3o0b3JLcCtnMFJmWC9WcGNqeHBYdnRNWi9ibUgr?=
 =?utf-8?B?OEtOQnFVQnlpQVJNQmgwMjlKM0NPd0M2V0NkODVTSDdBL0w2VFZlQU9TdHkw?=
 =?utf-8?B?aVJ4WWZ4c1VvTzBVcFZhQ3AxeUM3MkQrK2EzdUxFZEpDdGh4Uzc3RVNOMUR3?=
 =?utf-8?B?Q2hxbUduS2Z1YXR6N2lTMGNlWHdkZjI0Ynd3TzcvYWtudmcwZTJmL0cyakVn?=
 =?utf-8?B?UGxaK21tcmNnNng4eVVFRW82VGVLVUxHbTNVY0ZkakswbTNEdlBUenJTK29I?=
 =?utf-8?B?WnFKeUxNQ3h5cFZmcWhWQitaV3Z6MXBMRHlxTW5tTkthT3JnYVJWWldPZjlp?=
 =?utf-8?B?K04yRFpkZmxZWU0xOTVMcW8xRUlJb2p1Yk9DSnJWN29GSytGaFNXL0NPakFU?=
 =?utf-8?B?TkhhNWRFWEY2U3JHY3F6bkpEOWl3YjBVSHZLeXFQYm9wWWUrYkdJYnVrMTBs?=
 =?utf-8?B?eForZ1lzYkI3MzZvVzRnQXV5SSt5R0tqVkZSS1NIa3V0R2YwWnhXYnJRUnRS?=
 =?utf-8?B?TDFjS2dPNEkxZFQzRnhuK1duNy96ZXhGY1VXRFFpSnRPYUNTckExYTZORnJM?=
 =?utf-8?B?WVFNd21kcm9rMVZhU0FOemNYVTZZNjg0dzBsRnRwUnFHaDVWcElhYlBnRm1T?=
 =?utf-8?B?OHh3V3lBODg0L09qY3k0L3htOStURExEbWREN0RuSWV1RDJtVkxncFJBUjBY?=
 =?utf-8?B?Um81Um9mM1gzZHY2bHBucnJhRHp6b3Zzd0JsUHZ1ZjA0OVVFdHFPSGEwNkly?=
 =?utf-8?B?VUFIVndRanZGV1ZrcDZsWEUwVitXWmtKbXpuRGlLbnVRZEcxTDZjRXd3TTBE?=
 =?utf-8?B?NlU5emwzOC9kZ2lpb2JKNkNOVXBoTkRHM1JQT05lMEJWc3U3anFYeW1NUFJ1?=
 =?utf-8?B?MHd4YXFHSzA3WlZLVUtGTU9HalhDdVZ5TEErRCsyd0M0YXJ5cEZQbGFncGlT?=
 =?utf-8?B?NXdZRVVFTUZVOFBUNS9NZ2V2Tk9tNTRIdTZoN3dlNkRhZmlLb2FoSlFjTjZW?=
 =?utf-8?B?MEU4N2VLKzlRTmNKY3Q4cFQvOHlJRFZzVVJJamh5czRFWXVGc0syTVhMQldG?=
 =?utf-8?B?azk0dVZqaTBNaVdNZ3V6ZVA4SVpXOXg3S3pnTG45WUhFUlk3YVNzRnpDZTV1?=
 =?utf-8?B?QkNPbHdmdG80M2tBUUtVelNqUk9DNHpmbXAvbmdUR0V6OW5RZDFMWXdKbTFV?=
 =?utf-8?B?aEZwYWlBdVVlbjNWSG5VWnUyci9yUUNUVTc1blZVVmg2SnRYK1V6YVU3MDFu?=
 =?utf-8?B?UUpTUkt0My81QnJHc1ROUVBTaldQNE00bUtqQmdIeG9uU0pqdFk2OWlRV0hI?=
 =?utf-8?B?NlNKVFFhK1d6amtVbXBBWUQ2aDhoZHR6QW9McFhzVHlCNzlLeENzNU1oT2Zi?=
 =?utf-8?B?Mi9iWE1zTGVDeXF4U3kwRVBhZk03L0NpbWF5cnF6aW5vamZrWjJwdG1oRnUr?=
 =?utf-8?B?OTh2SHVkenBkRnRSYzhPWExDR3FHZUI2UEE1WmYxZEdkWFowQ0lHbXpNalVz?=
 =?utf-8?B?TDZ5cU1kbTE5ZEloaVdoeFArQlh0ZUpLOFQwQTVraXZvODNaKzB0WGZyMmxp?=
 =?utf-8?B?SmhDRlBIKzBvdzBJZXZJQXFnbGl0WGpLcUpzb3l2aTM4VkhUZlBpSzgweklF?=
 =?utf-8?B?SWFOTDZ2Z0JKdGRNak1WU3JwaHpvSEgvYmFwRnY3aTQ2eHJsRFZ2aGs0TkJN?=
 =?utf-8?B?b0NmRnNTNExRaDU0NG9qek96V2d0QVhzMmhrOTZ2MkpQdEE1bDdIcndLVzVp?=
 =?utf-8?B?cVFYWFQ2bm5SZWRDM2l3Y3AyRlJLSzdxdGVlVzFTcE81SURuQjBBSEFoM3Y5?=
 =?utf-8?B?OUN1ZG0xK1dJb1hNOWZBZk1JU2FTMlFtcmJ0SGIxcVlpZ0hISCtTRFBEYXVJ?=
 =?utf-8?Q?DG80=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ozaEhPQ2dMYUVFR3dHS0czK0Z2ZzR6UlNyTkNtaVpvZGsrd3NkQlhnalc0?=
 =?utf-8?B?Wlpma3pLRjNKNlR1T2daNWFsMXYrTjUwdjJTVndNMERPTE5jVGNxdWJZKzRD?=
 =?utf-8?B?STBCTGx1UXV1ZlFGeUFwalpXZ3l4OXZ4SXZrS1BEbjExSjI1WnlTT1ljYkZw?=
 =?utf-8?B?dWpHM0kxemwzaDQxN2t5bkNBb1hzSFFmTGFtZWd0SXA4cXJVWUtWd2lIUzAz?=
 =?utf-8?B?MWtIeUZWQjVIRkFpNnpQbWhJQ3RtbmlZajk4RFlrOVRoQnluUG9aUENDeDkr?=
 =?utf-8?B?Zy9DZ2F5VHBJZDdwL2hFVVlHanBLT0hrNWthOEdHM1A2N1JLcXNBbzBwUFk5?=
 =?utf-8?B?Uit5ekY5VnNQa21HTVJrZUNvaTYyNGsyQnBJNnBHdWxGQnNWNERoM1c4VEky?=
 =?utf-8?B?WnlsZUZBaFpIRkFMOWhEME54ZFlyWWk2bkxhWHJONnNTeWFwRUd2eEVWN2Jq?=
 =?utf-8?B?dmxTNnNMVVpIRmpSaWNQLysvYm43dVlsRmRIWEs2Nk9HQnB1TlRkcHhuNjZJ?=
 =?utf-8?B?bkVPYllpQTlnYWlKc1FjWWQ2UEtqRlVCdW1PWmFOVFRQKzNMSnBHd1hONTBQ?=
 =?utf-8?B?aHNwYXFqTG1NOWRSMkNvdG1yR3VFVHVFU2hRaCtFMGwzM3VrZWdSTjBLRmtt?=
 =?utf-8?B?aElSbERFcXdwOXFPdWlKUzBOVkswSjVNNEF2eTI5cDA1NFAxdXdDTXh3RGpH?=
 =?utf-8?B?RXpGdmdMYnF0NU84RGdwUTk3bkZndldpNDRGWFlTN1RpM0t1emN5WHR1TGkz?=
 =?utf-8?B?WGlhUUJYYkRrNUIvc1d2MVByV3dTVEFIcndJNUhnNXdYTXQwQ3hmbDg4QVpC?=
 =?utf-8?B?bDM5c3NjSTIrZHlkWE9SYTNxazhTSmJmWk5rd0xDYUkrd0VMblMrRFJFazcw?=
 =?utf-8?B?bGoyQkZlRkJ6bUlMNngxWm4xRHlTM0VpQTFRdXFTVGw3eUtPZ1h6RDBnUjhk?=
 =?utf-8?B?alN5bDIvcU9PS2RIY2QyWDREMkV2NWhmZjEyRXZBSEYvOTQ0NDAyNitYbE5K?=
 =?utf-8?B?Q1U1dWNZUHhERDZoV09iT1BHYU14SkpLQ0V0YmUzVTY2dUx2R3FxTTExWG9a?=
 =?utf-8?B?T3VHclFBdzBrRlVqL0FmbnlPNFo0KytTRWdFOWhidEdqRWZobzBKcTlHa3Vp?=
 =?utf-8?B?Q3BMcjdOWmR3UTlJRlVWNS8wT3YzRFUrbWFSano4ZGJyZ1NDUW0rdzEwMEUy?=
 =?utf-8?B?T3ZCL01GTWU0QVVtc3NaenRGT1o5L3V4ei92NVEzQVNDU2hlL1lhRi9ic2Jl?=
 =?utf-8?B?NWJCeTVwZldZbWVvbWt4emxYcGFSMlhyNWhkR05pN3J0d1FmMUxkR1JOYXBv?=
 =?utf-8?B?cHdWZkF3ZWtUUzNhc04ydEREY1cvS3JxRHkyUk5mK2h1ajVhRTBCVC9UdWwr?=
 =?utf-8?B?Znl0MVlYbHEzMEVYVGZtYXF2Y2FxNXEyKzJqcjZ4RVNmaHFIeXNjSVRnZUJi?=
 =?utf-8?B?cnFpNEx0ckpSOUVTS1p0ZEY1elZmREZMZ1RnaFFKS3B1dWQ3V1YxUzBUck9u?=
 =?utf-8?B?dWVvdjN1Y0V5aTVCV1JqQnZWM2lLV1pGYmE3a0hIWDFFNTBtaE1KUDZHTWtp?=
 =?utf-8?B?VTdHVUZpNDRwbEVRWGJyOG0wMFgrOVJ2MmFJVk45MzhzcWxMQk9UMk5LRGZj?=
 =?utf-8?B?Y0FhRWhzUk1LeWI1M29HQUhOY2s5VWlUbTczbmxSbVFnS3BpNzh0NndzZkNT?=
 =?utf-8?B?WmlXWHQ3S2VyUVYzUjQ1citKNXFENUhreDVFN2FEUDB4dEpML21zOFRFTTFB?=
 =?utf-8?B?N002SEFxNVpCRnpaQ2MzWHpNOXptbDFPWThHV2w1Zzl6SGZiVEZTNno1ZFBV?=
 =?utf-8?B?Tm9FMHdMTUc1SE9GNDhpV2FvdEQwb21wWG5aOUcvQVFIQkN6QUhIMDJzbjYx?=
 =?utf-8?B?VHJsOEU4dWg1ckRDQnFMd0ZoTFJkSHZuekRPSFo3aTJTcTNsd1hqZWlBTFhq?=
 =?utf-8?B?SytJQ1h5OVRab0tVSjNWcnQzVWxaemJJUmFxdUl2R3N4eThodytYRHNGQ2Rw?=
 =?utf-8?B?TW95dWM0empIWUN0SU5hR2pXRGVwbG1Ma2d6bVI5Zk1sOCtQVW1GZm9lY0VY?=
 =?utf-8?B?T0pwRVgyRjV4ZkV4OTAzV2VOWWRwZ0NMNTQvMFhhRjYxNmV4ang2SWlaeWJk?=
 =?utf-8?B?cWk2blNxRjU4Z2VCS0VHOFFXTFY1V1R3VHFqT2tUR0tYVy80Z3FnS1VRQTBq?=
 =?utf-8?B?YW50Ni9BTjdET2ZpSjI5b1BVQVF6VTBSUFZGd0I2N1pndUpLeTFTM2pBdS9p?=
 =?utf-8?B?a1FOemdVZTBjamE2Mm5BYm9BTlcwMDJDTlNCWDV2SHRkYVFaR3dyNGNNck0x?=
 =?utf-8?B?NWRoSko2STE1ZU90M2JheXl3bVVhcWJxa1hlc2JNdFQxNkZDek5CeWsyOEww?=
 =?utf-8?Q?tx6qMuQr5H7UkWH4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae979a3-15f8-45d8-0701-08de5a6a407e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:29:13.0305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQxsgoqA8YiF4EGFHPkpRXxxrlafzJmjNZtQMUxpuUvu08VB+6X4mA07d4YXbvZCfF0xoDjuCipm56VQM+JpYpJdjclgSy5yiQrz2yL+eFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sty-21 22:42:12 +0100]:
> We already have most of Xe defaults defined in xe_module.c,
> where we use them for the modparam initializations, but some
> were defined elsewhere, which breaks the consistency.
> 
> Introduce xe_defaults.h file, that will act as a placeholder
> for all our default values, and can be used from other places.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_defaults.h     | 25 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  3 --
>  drivers/gpu/drm/xe/xe_module.c       | 42 ++++++++++------------------
>  4 files changed, 41 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_defaults.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> new file mode 100644
> index 000000000000..9183d05b96e1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_DEFAULTS_H_
> +#define _XE_DEFAULTS_H_
> +
> +#include "xe_device_types.h"
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define XE_DEFAULT_GUC_LOG_LEVEL		3
> +#else
> +#define XE_DEFAULT_GUC_LOG_LEVEL		1
> +#endif
> +
> +#define XE_DEFAULT_PROBE_DISPLAY		true
> +#define XE_DEFAULT_VRAM_BAR_SIZE		0
> +#define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> +#define XE_DEFAULT_MAX_VFS			~0
> +#define XE_DEFAULT_MAX_VFS_STR			"unlimited"
> +#define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> +#define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
> +#define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index aad4aa53a51f..17f4d048c8b9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_debugfs.h"
> +#include "xe_defaults.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_dma_buf.h"
> @@ -743,7 +744,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	assert_lmem_ready(xe);
>  
>  	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
>  	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
>  		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 34feef79fa4e..b4600c5069a9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -62,9 +62,6 @@ enum xe_wedged_mode {
>  	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>  };
>  
> -#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> -#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
> -
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index a0048f64ed12..903d3b433421 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_defaults.h"
>  #include "xe_device_types.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
> @@ -19,51 +20,36 @@
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define DEFAULT_GUC_LOG_LEVEL		3
> -#else
> -#define DEFAULT_GUC_LOG_LEVEL		1
> -#endif
> -
> -#define DEFAULT_PROBE_DISPLAY		true
> -#define DEFAULT_VRAM_BAR_SIZE		0
> -#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
> -#define DEFAULT_MAX_VFS			~0
> -#define DEFAULT_MAX_VFS_STR		"unlimited"
> -#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
> -#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
> -#define DEFAULT_SVM_NOTIFIER_SIZE	512
> -
>  struct xe_modparam xe_modparam = {
> -	.probe_display =	DEFAULT_PROBE_DISPLAY,
> -	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
> -	.force_probe =		DEFAULT_FORCE_PROBE,
> +	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
> +	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
> +	.force_probe =		XE_DEFAULT_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
> -	.max_vfs =		DEFAULT_MAX_VFS,
> +	.max_vfs =		XE_DEFAULT_MAX_VFS,
>  #endif
> -	.wedged_mode =		DEFAULT_WEDGED_MODE,
> -	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
> +	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
>  	/* the rest are 0 by default */
>  };
>  
>  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
> -		 "[default=" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");
> +		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
>  
>  module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
>  module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
>  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
> -		 "[default=" __stringify(DEFAULT_PROBE_DISPLAY) "])");
> +		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
>  
>  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
> -		 "[default=" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");
> +		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
>  
>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1=normal, 2..5=verbose-levels "
> -		 "[default=" __stringify(DEFAULT_GUC_LOG_LEVEL) "])");
> +		 "[default=" __stringify(XE_DEFAULT_GUC_LOG_LEVEL) "])");
>  
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
> @@ -80,20 +66,20 @@ MODULE_PARM_DESC(gsc_firmware_path,
>  module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
> -		 "[default=" DEFAULT_FORCE_PROBE "])");
> +		 "[default=" XE_DEFAULT_FORCE_PROBE "])");
>  
>  #ifdef CONFIG_PCI_IOV
>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>  MODULE_PARM_DESC(max_vfs,
>  		 "Limit number of Virtual Functions (VFs) that could be managed. "
>  		 "(0=no VFs; N=allow up to N VFs "
> -		 "[default=" DEFAULT_MAX_VFS_STR "])");
> +		 "[default=" XE_DEFAULT_MAX_VFS_STR "])");
>  #endif
>  
>  module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
> -		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
> +		 "[default=" XE_DEFAULT_WEDGED_MODE_STR "])");
>  
>  static int xe_check_nomodeset(void)
>  {

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
