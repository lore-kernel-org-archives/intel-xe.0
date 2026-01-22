Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E397D489BF
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 17:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF9D10EA31;
	Thu, 22 Jan 2026 17:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aibbeuvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0470710EA31
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769104066; x=1800640066;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dmI4gF33J07NVNmS9Qkn6EyG2rfUTUd4UCKqPFfXTr4=;
 b=aibbeuvhABBodpqWV2XV6U3LH865oj/ijlVd9TovWuM9oPmMOpx5VEup
 a3wV/koVfiSS3NdPl38ow0QkC8oX9DdhDp8uYvl/HvEgdSVMmrsIxXq8F
 K1QB/9ZWe7lT+BsU/9rfhrFzoOY4K5RxkX/qPlbiIVnot/VuglqSQkSCp
 vUg68162RyeNye/u5pkQ/WQJBKnB2Vj4PDY46aysRMWmCYhzx0DWhCSOW
 xY07+B3ETbDre1+MT6el/0D8oBzX+SSBPqeioGJKmC2GEkUnigFdhWuJL
 NVYZXZsTkcn6SbRmkP2BzqrqG5DYUBgQdvMMalqnybxo2ovMzVDw/6oCL Q==;
X-CSE-ConnectionGUID: TwP8DsxYQzeYu4inq5LkWg==
X-CSE-MsgGUID: vu0akYORTjGvNqFKq3X6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70327212"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70327212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 09:47:45 -0800
X-CSE-ConnectionGUID: rni3EyKJRfWI0u8/Mc7O5A==
X-CSE-MsgGUID: YBnj6jmbTyaLUBp8R3YSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206702986"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 09:47:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 09:47:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 09:47:44 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 09:47:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ee4O5Kv/zTX2nDFjTaumfhVqpkR2Vtq0BQKALe1QqbdyIfI54jOYoaMomHGyc4l4gLWayeXR9xMwQuWvWg0eQzfg/USmSt591f53C0DuHkor5nHRBDMIKvDl47dh2bEMglWNdFH1/pJCXDpj9+nSBQQsOdYpISgAvtCpC3hperZZFD1AfL1o9rYkw2AI7hBXm+G5jidqlZ7f1soTt6yzkToO2jFhC7FOzXLQw6w5Vu6T2dNpuLk3bhn88QOS+c2RL296oxxFjwCRums7gQ+e5uiZPSSQzb0gnT2r27W4uIMdOOHiqPei/863YAnha6VecfGsqyAW8e7SPhVAQXrj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H24UvVIQFWU6lS4ypufCrIMGzbzgKwmQ56sZWHfOE0Y=;
 b=hQWdwxUAgdsb60tTwDWAOCXVzaHMXnCn+MMA3H5OE4YZDcrUX/HgOGlrAfQq1gEYP2EX0UrvFZK2iHBGM985RvzZu2warJtn1e/DrxAx25X+JhXKlRoLaXkQXS8e7zOhmBanUsH2buhmQTVRPWacA7WKykpk5RPuNNlRqx6dnpCAl40Ts1s/K3PhwMEyzMXlANpiBGw3440kYbas3e7wdq+K5rgVxttVEjthENvhuP66joVTVzfJuHgUFrkhL0r4hUX8gBLI2iPBxVwXSTNNPB3X1QsbWcIMxHSM+k/OG08PL+b7yJTfoykLNqeT5fg27qSyBSE15VNgDsfOica6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:47:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 17:47:40 +0000
Message-ID: <8f5c5068-0078-4f7a-8cf5-c561f73e9fea@intel.com>
Date: Thu, 22 Jan 2026 09:47:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Carlos Santa <carlos.santa@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
 <ykflaf7q4tizmft5gcyfnqg5asicwbz45nmp4cu7p452bfu3if@xignneucsxfg>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ykflaf7q4tizmft5gcyfnqg5asicwbz45nmp4cu7p452bfu3if@xignneucsxfg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: b933ee94-ab7c-4010-d311-08de59de5644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEwxUExPTWRBMzBDSldiWDQweGM0YVFEUlBLdXFielNzOUM3UGhlcWVqMWFu?=
 =?utf-8?B?WGVqSW0zdnNJOWVxazBPK3M3ZjFCV0JSeUsydzdGa08rUmhwMG93MmRpTWR6?=
 =?utf-8?B?R2lSQ3dKSWZGMzZORks5MGhsVjFFTXRMdHN4cFh0UTA3N3pvMWNjSmpTL2JZ?=
 =?utf-8?B?eUNnQzBjNXg0R3JEd3NtOVJMYnZKMERRREdRU3RoclRWOWNadG5ReHhTNmpQ?=
 =?utf-8?B?bHFVQnBtbGtmanBrbGlqekUxKzhQNXlLZE5ES1NiY0tMcDgzZVdTSi9temlT?=
 =?utf-8?B?enBHR0wvS3o5a1VNd2l5b1dseThPeEMzV0syZU9saTZZaSthd0dIVUtVbGw2?=
 =?utf-8?B?aXRiU0J3endyWSt2WVJkbDVmMTdDYkZXM29jUm9MUFJoYkFiUlIzNGxJSlVq?=
 =?utf-8?B?YmhIS1Q0SDZ5VC9nQm5XS2hIQVkvZmF3NEVRRlE5QjVidHpYQXRQeDNzSU1x?=
 =?utf-8?B?OGI2R1M4TVhraEdxSG5tdWlXeVlkR2I2Y09xVitWRytieXlQRjBzQ2VwS2pH?=
 =?utf-8?B?bytoeTJ3VDlla3VwMzJiNHZpOGc5bDdHbmRpdTV1WlRZR1dHc0F4MXlvZExE?=
 =?utf-8?B?K3IzSElYNW1IQzdIYWh0eUFvNnNqRGpNUHRYdTlUaGEvSE9tTVl5dWExZGNT?=
 =?utf-8?B?cGYzQ2N2eEs1RnN0Wk56dXRWK3JLN3pxNElzeWIwTVNEZzdWNEMwNHZ3VzdH?=
 =?utf-8?B?UXhqZHBRTEcwaTNOL1d0MVg2Q1RHVFQydGtINjl3Y2EvWjRqblRUWnZXVFda?=
 =?utf-8?B?WFNBVlRQeXp0QUhBZm9KV1Q2bXA2MVNUZy9CUFEyNUJPOWhqWGpIMUEwMmI4?=
 =?utf-8?B?VHdCbnlMSjlmaWcwOWJvQlB5L3I3ei95MUpBcDM2MjJJMUkya0s3ZUZEUWdw?=
 =?utf-8?B?QzZnRW9Ea25FM1A2MjZsUU9rZGdLb3dYOXowZTNyb3J6bnZ3RGgwUU9zZVIx?=
 =?utf-8?B?UjVGR2xlVkx1N2FCaFRDdXc5cmJZZFQzR2lGS0dtZnMxTS8yUkxFOEhJaEdT?=
 =?utf-8?B?enNlTVQycVY0Y2VrN2VvLy9xSzRHcDllc2htWWpXcWRlR25rNWF4dHc3Vlps?=
 =?utf-8?B?QWpGcWZsUXc4ZGNKUlZPUWloeFpINkRzY3FrU2hLdXFMemxXZUlDQjYzSlJF?=
 =?utf-8?B?c3VDQ3RCeHV2RnVBMnkrdGtaK0s0ZDVpOGo5djQyOWdpQjA4N0RnZEloOXEv?=
 =?utf-8?B?N3ZDeWZxMkdEdEo3R0hJWU9RbGJMR2kzYjVKb1AvYWxCRFIraGJhZWVoUGZK?=
 =?utf-8?B?RktZQ0RUMTVGSW5pRlRxVFp3bFAzU1I1RmNSaTArSlRVaDhnNEtudFZMdkky?=
 =?utf-8?B?SXZER2QyVGxoL1NzbUVObEdZUFB0OTREd3dvOWlXenJ6UXJ4Y1BJS1Zpdmd1?=
 =?utf-8?B?QWJLa3Rzbit5cTQvQ3Y1Q3pTd0dERktUZVpwbFBMa0trK294MkJMTk10Q2Jl?=
 =?utf-8?B?Rkt4ZnFhOGZOc3VqUWlhb3lnM1dWZjQzaW0zVXpkNVA0Y2haRGI2aGRVNkNU?=
 =?utf-8?B?a09pc2RsRjBjZklzWWlnS0xyTi9sSXpubStVYUgxRmgzaEhWb0JKL1hjT0tu?=
 =?utf-8?B?aGlwTm93eGVuL3B1ZUNEZCtsZlFZQ2k3YzRjaDJNYW5Gd243NXNjc2ZNT3dW?=
 =?utf-8?B?S0RwNHhlMlBmdGRYczZUUm1relllaDJTd0lCVTdzN0wreWFtYndERWxxQ0xw?=
 =?utf-8?B?Zlljc2d4UHk0R3V0QWlKYkNHZjh4TU5OZnE3am51RHg1WkJvQW12dTE0cjZr?=
 =?utf-8?B?bHpRTk5JZWVnOS9UYkhzNDN2RnZEaDJ1R040RW9jazREYjMxUjNLSy9VYnFu?=
 =?utf-8?B?Z0lxd04yTXppQ0hJMUFNdjI4ZHBPVjJTMm13UVAydVh0a01JRXgvNlkwQlZZ?=
 =?utf-8?B?ZFo5bFFoSDJHQ0ZiNCtBKzloYTNVT1pGZW0vVzREQk1UVENhVlNBeWM0eUdB?=
 =?utf-8?B?U25xQkhaOSttcDBVYXY0VzBFMUNSZDYvcjJaZmo4RE4zQytzQ0RvYzhqUVFC?=
 =?utf-8?B?R3dGYUZWYUtVc3cyU092NmF0ZUpSa3BESFZ5SXA3N2wvNjMzL1FvODc1aDcz?=
 =?utf-8?B?U2VBZCtHVmVaRjRUTUxJSis1MVA3MGtxbjNmcWx1clFiZkIxamZQM2xFVU1x?=
 =?utf-8?Q?Xj2k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGQwZWdoQjI5SDAwa3ZvQThXRWZyWjUraEYyR0IwOVgxQVF0Z2QwVzFhWUI4?=
 =?utf-8?B?SzVJL3kvcWVFa1I3LzduVnpjMjNObXBMV0JHK0xoc0lFZERTZC93bEphSU9T?=
 =?utf-8?B?NWJXa056L3hJREhJTGJ3UjBUV2lLSVFGVkQyVGhBbkRubGk3M21BeE1zQlBq?=
 =?utf-8?B?dkJCY1lsOUpJM05NZmhadEpPamNGU1QvQjR5eDV0Qmk1YUhzR0RmM3U1MXZH?=
 =?utf-8?B?cDFmcEZFV3ZoMUhvQkNFM2dKS1FSY3hkbzY0MHI0bVluV2xWbkpWM1duazhn?=
 =?utf-8?B?Rys2Y2JDaEl3NWpyWHUwQWtGYUJUZXhjTER1dHRRcEZWM29yTXZEVHJkc3Rk?=
 =?utf-8?B?eDBUNkVqbXVqeDh2WU9GOE1lYmdwV014ZVFGcDNuMEJ6SnZwVWprb2lhTm1G?=
 =?utf-8?B?NmdpaDAwYzV3SzRUSGdvd29jZTVxSjhMcmxYNVNZWnJiY0tZazRQdkFwWDJU?=
 =?utf-8?B?dkVxWS9mb09jM1F3ZmExdG15cVBCclhPT28zWTY1T29NYnk3VGtzd2Q4MEhK?=
 =?utf-8?B?SFZBcnp3b1E4SEtLNEFFSDczTitWNUJGeS95akhML2FiRHhQYXJaVG1KSDND?=
 =?utf-8?B?WGF3a0RNTlh2N3cvaklXMWhOWHpaYU5pamh0enJxblpra3JOTWwrMmZoTFMz?=
 =?utf-8?B?MHUxUUdBdTN1L3lpaW9udE5hQ1lvRzRzNzdRU3FCeFNyM00zUjBsVmNUMmlS?=
 =?utf-8?B?eHBpaWowZ0lKWFZrOEJZN0JxZzBhUStzMEFsK05JZWExWFpmcUdDK0dXVmNv?=
 =?utf-8?B?c09UQmxLQWZVZnQ4ZXppOHJwdkkrREdLajQ4LzRzLzROd3VhNEh1Qm5LSm1z?=
 =?utf-8?B?c0Z5OFkxa0NQUVplVjRpZzBDVGhnTm1EUGtrbEZsRHprMHExeU10VU9FaDFT?=
 =?utf-8?B?T1pSQjY1d2EzZER2UlZ3MjQrTnpzeUoxNVZYSmFqdmVhZ0xQd1pVYkp6Rmt4?=
 =?utf-8?B?NlN3bDE5bEZySzlnajFNVUxiNXB5SVhkSVNGdi9OM0tQWFNrRnB4TENxb0dE?=
 =?utf-8?B?SG9mVWNlL0oxUWluQjQzVStGSEpsTlhOVlVWbEEydWszWnJETExoZURDUUFh?=
 =?utf-8?B?anFMYkxIZ2dHeW9zcEsvbGEvUnd3MGlEay9XN2NsOUtrZktueTZ2TmNYaXFF?=
 =?utf-8?B?MU5iNWZ0MFQ1NGZnV1VtelhIckdLcEVtMEJ4T2doWEQzalJsVExXREFudERT?=
 =?utf-8?B?aDVrSVNnNXUzQk4vS3Bsd214V2lBejNWNCthZDBzM2FKQ0N3RzhpWHN5cWtT?=
 =?utf-8?B?QU5HYllPbGpLTVpuMGRFOWNEbFJnTExsMlVCSkYwbzRhdnJVaUk0UDNYY0tE?=
 =?utf-8?B?U09qRTFxTFB6ZDVLTlgxZ3E4TEsyVGZ5djdKdUgyVTJzNWx0c29Hbm03eXJH?=
 =?utf-8?B?QjdVRGtFdVUrTW03Mnk0R0cvM0RQbVB4TDdycGRRVUNiSUlPTG84TTAyNFl3?=
 =?utf-8?B?djBzNUU5SGhZcC9CNC9ZSnVpSCttVS9mbG5sa2k1TlpIMzAwZEduNG4vL0ha?=
 =?utf-8?B?aFIvQ2wzQkhZUTZwYWIxbzFDVCtWWUlrdlZFbkZ4cDFxSVNNS0VrdjRiTVZw?=
 =?utf-8?B?SE44UWJoQzJkSUE0dDArMzRRNXJZekFGWlhNcTJEYzhwZEFUZEltVUNtU2hu?=
 =?utf-8?B?amh2SkQwbVNLSnBqMEJJMXZhaXhmbUM0eXVVZzRCM1pvVTNhMWFOaXkrV3ZH?=
 =?utf-8?B?OWZxU0QwWk9YUXFZUWJOMTZ5SU1Ca1gwelUwTTN4ck44OHRqYXlJaTF3QkZC?=
 =?utf-8?B?bFdncmRxbEJ6bjRFY1dDUkJ4aDI3RkpYRWFFYkNTMUF6WVF1djBpTzNmbitC?=
 =?utf-8?B?ZldaUTk2ZHBTNXI0VnJZdGhPcm9jYy9MdkZ0YkpOTGo4dHdLdFFuR21sSGhy?=
 =?utf-8?B?WEhQSmhkMTF0WS9xRExrYlFWS09WUkFIc3AraXF5WnlVeHFWYzhsM09zNjVr?=
 =?utf-8?B?MXRKUlZCTy9xZ1NuYnNmMjlWTkwyQ2NEeU9pY3YrYjh3UXZucERBTWtWMzdP?=
 =?utf-8?B?WERiZG9odUtMdG5zcXdJTWZNZ0d3VWsxdmVjZTMvMzg2V2JVVlBPcS9lYXdF?=
 =?utf-8?B?REI2ZWh5RTl6Qkx2Sk5ienNhZHNNZDQ4MmRuQ05GaTFJZVQzQUtUbGZpazlN?=
 =?utf-8?B?M2syUzNaWTBIS0NiU1VvbENqcVFLSThOSEVPeW8yRlFJL0FlSC9lZS90Z0R3?=
 =?utf-8?B?cndtc2xNaUxQT0pQbk55WDJ1Y3ZESU1GVWhFVlh5VUgyQ1Nxa3VMYVlvTll4?=
 =?utf-8?B?VzFGSGRCc0ZjSWx0ZlA5SUhTVEJNRlBCOFVad0NZeVpsTDVNWUVqaXBaQ2o3?=
 =?utf-8?B?Z0MvcUhpTHpJYklQb29SZlVOb2tMazZ1NzFoMFlGTWU1Uy8xbVRZSmlZelVI?=
 =?utf-8?Q?ChNF4nW+QrENURjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b933ee94-ab7c-4010-d311-08de59de5644
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:47:40.0332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4uiN6HGOSS/qskSm1TrLC2FkwzgbZp5LA/3rGjMI0a1sj2Kx25svusjf6e/DoBFs/i+HHTh8iIY0ABdy5DBURypBJlT+rP+T/qrdz7d7G8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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



On 1/22/2026 1:22 AM, Zbigniew Kempczyński wrote:
> On Tue, Jan 20, 2026 at 01:10:20PM -0800, Daniele Ceraolo Spurio wrote:
>>
>> On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
>>> On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
>>>> On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
>>>>> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
>>>>>> If a batch buffer is complete, it makes little sense to preempt the
>>>>>> fence signaling instructions in the ring, as the largest portion of the
>>>>>> work (the batch buffer) is already done and fence signaling consists of
>>>>>> only a few instructions. If these instructions are preempted, the GuC
>>>>>> would need to perform a context switch just to signal the fence, which
>>>>>> is costly and delays fence signaling. Avoid this scenario by disabling
>>>>>> preemption immediately after the BB start instruction and re-enabling it
>>>>>> after executing the fence signaling instructions.
>>>>>>
>>>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>> Cc: Carlos Santa <carlos.santa@intel.com>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
>>>>>>    1 file changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> index a1fd99f2d539..cd645ee400b9 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>>>>>>    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>> +	/* Don't preempt fence signaling */
>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>> +
>>>>>>    	if (job->user_fence.used) {
>>>>>>    		i = emit_flush_dw(dw, i);
>>>>>>    		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>>>> @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>>>>    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>> +	/* Don't preempt fence signaling */
>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>> +
>>>>>>    	if (job->user_fence.used) {
>>>>>>    		i = emit_flush_dw(dw, i);
>>>>>>    		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>>>> @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>>>>    	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>> +	/* Don't preempt fence signaling */
>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>> +
>>>>> IGT tests which calls compute-walker, then bbe are asynchronous (don't
>>>>> wait for completion, pipe-control is necessary to wait on
>>>>> compute-walker).
>>>>>
>>>> This asynchronous behavior may explain things. Is this a common use
>>>> case?
>>> Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
>>> not doing this relying on kmd.
>>>
>>>> Also do you know if render engines have similar asynchronous behaviors
>>>> or is this specific to compute engines?
>>> I don't know, I think Mesa folks may know the answer.
>>>
>>>> Lastly, the i915 disables preemption on both render / compute engines
>>>> immediately after the BB before emitting the pipe control. Is this async
>>>> behavior a new few feature in Xe2 parts which only the Xe driver
>>>> supports? This might explain why the i915 works and Xe does not.
>>> Test exercises WMTP and this is supported starting at Xe2+. Probably
>>> what test is doing has a meaning in this case. First compute-walker
>>> submits kernel which loops until it will observe some memory write.
>>> Second job executes compute-walker with kernel which does some quick job.
>>> But first occupies all EU's so second job can be preempted only when
>>> preemption occurs and SIP will be executed. So if we disable preemption
>>> immediately we submit compute-walker I think we have no change to enter
>>> SIP and switch. Even if I add pipe-control to batch level according
>>> to Daniele comment job it is still preemptable and we move pipe-control
>>> location from kmd -> batch level..
>> So basically the test requires a preemption but does not put any preemption
>> points within the batch? I'd argue that the fact that the test works at all
>> is by chance, because the kernel just happens to add a preemption point
>> after the BB and the batch doesn't wait for the results before completing.
>> IMO it should be ok to go ahead with this patch and rework the test, but we
>> probably need an ack from a maintainer because something that worked before
>> (even if just by chance) is not going to work anymore.
> Why user would need to explicitely add preemption points within batch?
> It's imo driver responsibility to enable/disable preemption and additional
> preemption points in the batch may change preemption distribution,
> not the ability to preempt.

If the batch logic requires a preemption (like in this case where the 
batch needs a different batch on the same engine to signal it), then IMO 
the user should make sure that there is a preemption point in the batch. 
The driver does keep preemption enabled while the batch is executing, 
but I don't think we want to guarantee that preemption will be enabled 
or that there will be a preemption point after the batch has completed. 
The fact that there is a preemption point after the batch is kind of by 
chance, just because the instruction we use to do a memory flush happens 
to be preemptable.

> Compute-walkers we already had in IGT tests (gpgpu-fill) were called
> in fire-and-forget mode leaving pipe-control to kmd. Code written
> before I joined the team were written with this assumption and I haven't
> seen any objection to this approach. So I assumed kmd will take care
> of job completion when batch returns to ring. If this won't apply
> anymore we just need to change IGT tests to add pipe-control in the
> batch. And ensure nothing else is broken (compute / mesa).

Agreed we need to make sure that no one apart from IGT is already 
relying on this, otherwise as Matt said we'll need to make this an 
opt-in behavior.

Daniele

>
> I'm going to send pipe-control patch to IGTs, imo it will fix the
> WMTP case. Sync wait at the batch level should keep execution with
> preemption enabled allowing to call SIP and switch the context.
>
> --
> Zbigniew
>
>> Daniele
>>
>>> --
>>> Zbigniew
>>>
>>>> Matt
>>>>
>>>>> May you try to put arb disable after emit_render_cache_flush?
>>>>>
>>>>> --
>>>>> Zbigniew
>>>>>
>>>>>>    	i = emit_render_cache_flush(job, dw, i);
>>>>>>    	if (job->user_fence.used)
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>

