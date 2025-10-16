Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9793CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 15:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CBF10EA24;
	Thu, 16 Oct 2025 15:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGyEFVI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B9B10EA24
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760628753; x=1792164753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kNJ+zAK2jZUBy2wDikkP5pkh4S3yQBcS6S/DE7yEd/8=;
 b=QGyEFVI2sySOZdTTPSFKEIav0rj4cXdhCIF3THuIWMkajjRKJUCKmHDY
 sfJv/JCjO9Qesp1KzeqDVl5IUeQ0yBfyZZqFqI7CbjT3SCtg5CpF1kHHQ
 Ru9SmvD1CJF3W11gwRO+eWQ8/MuRvwiUTsT6pMFudpcdv0r50H4U2oOnr
 hVxPzv1hUYnyttdb29vXAFmFx8yBpWTRtrJEh1p+T34MMyMeZIl39cHsh
 uVzwpqlkj2MxYt5x66LMk9145BMmEJghWomfa0YzCIifPjjSlVxR32h3Y
 ZAea5lQx//C8E8sjFCxnUeX1lMbQG6zqJCIIhdtcXPxHabc6QujDHSjnX A==;
X-CSE-ConnectionGUID: 4MMvQn7cQO29bzDxaELI0w==
X-CSE-MsgGUID: Cu1YrBv7RYKPw9sReaYX1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62532714"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62532714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:32:31 -0700
X-CSE-ConnectionGUID: oR4zwg6rQ1i3dMKyOo+UXQ==
X-CSE-MsgGUID: ajILiBP8RVWPF20slpY4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182420494"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 08:32:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:32:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 08:32:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 08:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdWfTBt4bRSDm6/EFYkXkVRnhN7C/FQ8tz//hFKnUgfUaa8rF8sHIS3qNZYxXa9Fqcb2CzDHZzU/yct4Nh7wEhZZr8fYoUJBWZed8/8zE88PljiHQnnen8DjXJTig1NKzT4fzKLqM373s/YQFNCbVZ0k0HendWUWhsaGNWjgNK0ab4LjwQF988pbEkXvEiDk27aogW+QBbwxxIvNDyUQYXDnd4iPBi6/gP7SrongxTzO78Cogu89NTh+3mol5/TA1KJuN3bH0yNUPpY1luSv5f2QhP37Yr2cGlANNPGfi/25hGJzqfSTyyb3gH/jZ/ppKVIebg+VhDvFvIG9fdvbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmFXjjC5m/ld5HoSN6XXatw2iGEn1CgML5ACWh6HxA8=;
 b=scOXjM1bIFt4tyNkNkIxAp9UJuGFA0hsn2+EvhE0VWDTmIoL/+I/jcqj9QUgkGxK1Nzv4NH28PzXztOOY0vrQu6lbl2gdeRqUX2MnSo/LAMlsPDKdbf6D4XQclE393v9BtKKQPkJPNQy1stEJA/ixydbYZhUWedA3NyG5lLziAYwKBfqIrQe+8MWaChpCLnN+9ixSVYvALTondbcsg6MqKFxfkdahIisbUbN3LSre2u7LRBnTN7n3EdbT/9zcb+rjrd4Fclpb3+kbmY9eeFkufoef6EpsLUwoN39PCOLjTOgWpnVzX79t9lSLsLTlDNPJqXWhEK9xneK0KeWcYaguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Thu, 16 Oct
 2025 15:32:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 15:32:24 +0000
Message-ID: <1aa6c0b4-73fd-4603-b414-802b4e15442a@intel.com>
Date: Thu, 16 Oct 2025 08:32:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/gt: Introduce runtime suspend/resume
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-3-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251014073036.3282329-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ff9f84-5d33-4aef-fcc1-08de0cc93453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXRoRkpkMVhrcHk3bklVZzlzSWZ0d0NxTVVkWkZnMU1pcUZDcnpoazBtc2R6?=
 =?utf-8?B?a09od2hJb0xKSk00TEJ0R0Q0TTh1YlRUQmFCVzU4WnNCbUFFYUlZcm9pVHNI?=
 =?utf-8?B?V1gvRC9pL3J6bmhEN3lhdlREc1dzN2xsZ3pwSVAwNktraVNBdHZiWkFSNm1u?=
 =?utf-8?B?V1ZwaHJZOW9EbHVBZ2ZMaG1SdGxGVkJXcXJGdnZROHFtWUxHbUEvSWZ2Ti9S?=
 =?utf-8?B?cU9ScGxZL2N4QjBjcFBLVnY1RjJHa204RVlqdmlQampmT3U5MEQ0TkhrM211?=
 =?utf-8?B?Ny9SREhNNkxlMzZuY29uWVB5b2M0L21yRkFJd1RVQTI0YTBCOTI0ME4veTFO?=
 =?utf-8?B?L0hqY3krWmgyNVRmZ2ZUVFJ5SmVkb0tVaTVXZ0RpZFpmYUdlajNOMU5OYjF4?=
 =?utf-8?B?djRZVjNYN25xaE9FV25ZdjRHdXh3Q013dFNQSU1ydktSS3dJSDduTjlkcGEy?=
 =?utf-8?B?YlVNRTFwSjJFbnpuZXc1L3dWMEFVS0tHNUE1bjlUdkJzYnRBblNyR3BCcU4z?=
 =?utf-8?B?NFF1OEFIdW9KR0F6N1c4ZDE5aDFoQWk3anJHRDg3OEs5cWZWM2Jxb084Zlh6?=
 =?utf-8?B?ODFVSyswQW5OMW1MQS9GUVB5SVJpSWJ4UjYxK3Btc2MyRGJQeFozbHUxYjFD?=
 =?utf-8?B?aTIxR0hGbXc4Z0FLdjFBWXRDeHB0cTVJTTV6SHJENFgrcE4vb1p2dnpDN3J6?=
 =?utf-8?B?VmNQMlBqdElDcThmMmxzdWgxTjhZN0g2cDZSeCtmeXAvNjJZd1JTVXZWOTV6?=
 =?utf-8?B?THBoNzhnbDZ5ZE1XYytrL2F1MTFyVm56SWtUeXhEQk1iZy8xeFAvVFk5UkVI?=
 =?utf-8?B?OElDclIwMWFxY2oreHdNUkpRbDdMV3kyZ1QrUmI5bVI0OEFQQk9jUFZPZ3J4?=
 =?utf-8?B?c3Z6M2I5cDlFWjZwenBuM2xZYUNOV1NBdWZqVGhLZUZTckMzQVV4OW44ZHVr?=
 =?utf-8?B?NndyUlp4bDBSODFTbTdGdmNJM2xSOXdsQVJHcERwQjU5aFh1MVZTd2xUQllY?=
 =?utf-8?B?elIvRFEzY210dmpQVStpbXM0ak9mODhFbHdtTVpWZVdrU3ZsMkdNZjZhUVha?=
 =?utf-8?B?NnN5bU9yL1pWYUhkUnlMbUpmYytuUWhTQzVvais3MEloRzZxeEI4OXR4cWVI?=
 =?utf-8?B?UzRDQTl2c3RPcytONHVtcWI5WUcrWm1NNE9ubkVDZW1TM0dNSTdBK0I1ZUZV?=
 =?utf-8?B?QW1qUG1XZVlsV3FmMk9yMXIwTmsxTXpzcCttT0t1K1ExU2lZZVNFQlBQQjRO?=
 =?utf-8?B?c2x2NFFXa0ZwSi9QZ0d0QWoxTzFkOXQ5eE11Wmt1SmJtWFhKZHlBdFNYbk1q?=
 =?utf-8?B?WmRaWnNkQ1AzSjAvWHVNamdRMk03T2ZvdVo1ckpjUGRKMjVoTEtUNXJkVlVt?=
 =?utf-8?B?UjlsQnk3OEtRR2pZR0E5akdkZHJzZlorUy9BQlRiQnJXOFFKRS9CdVV2OTBy?=
 =?utf-8?B?Q2xZWDc3US9TSVJZbk4vdysxOXVHVFBSRkEvM3hpSlVvQ1dsblpLVWdPVXZT?=
 =?utf-8?B?WnJYcGxjSllzQUJBOVdKdjhHVDN6a0U3WmR1M3VzTTdkUTR3Uy9jZitocnVt?=
 =?utf-8?B?S3NFZElkRWZXSDBXMkZoK0lQN1pHUWJIQWhKek4yWmlHTFJDdkhoK2VWczFC?=
 =?utf-8?B?di8wd3k1OFNUZUV2bXVQVEdLbEVNREZmaldmUzU2Z1RGN1k1RXdhRndXWDE0?=
 =?utf-8?B?eEQvUjZXTHcxY2RsbHcySG5oN1ZJNUV4R3JUU1dVVGpHd283TUt4eW8vMHNS?=
 =?utf-8?B?eThjWXJUcGJiZFdWRU9mWVNLVS9LRHhrZWRJemxXaGVmSUdzVmVMWjhXL0Z3?=
 =?utf-8?B?MnNybEZIYSs5WVNZSzVBeC9UaDZEdXBVTDZBbGV3WFB0cnA4a1BWK0NYaDRL?=
 =?utf-8?B?QzB4cDYrRjloTnNLMmhBTEV3MWUzYTNXbnZaSWU5NTFPZ1VNU3JsMC9zaVVX?=
 =?utf-8?Q?mQT1VjCuUgk7WOlC2bZWa3C/rOod7Aqp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K04yTG9sZE1IOEtmWTZ0ZTl4SnJwSkFhQkZBRzhzby9DMGxxdE9ZNElkS0da?=
 =?utf-8?B?Mk5NZ3hVUkFaaDliY1dzTW1pV0xrV0NTa250U3Jvdmp2WUdlVDIrem1NZHlv?=
 =?utf-8?B?SzZZeGNadEQ0V2l4a1JCaFBaUEkxL3VHdit2bEQyc1RHeG1DeFMyT2VDdEJG?=
 =?utf-8?B?UytvbDBrdnp2bm9VNVFIVFBVWUlpdGFhOUFndC9aTko5alFmdzBqMFp0U3ky?=
 =?utf-8?B?TFFncDBrNVdiMHpCU2R2WjhaZkVmUGJpb09MbGNqL3FySTduWmZ4SWRhUXRS?=
 =?utf-8?B?dDR4SW5xSjlIQThVSmk4cmR0NkQ3Z1U2bE9vaFJYT0RPQVlvTGJUTzlUckJN?=
 =?utf-8?B?T09WVmVxSy9mZEduQm5mUVlzL0NBSmFaUVdyREFsVjV2N2FHTHJ3cGF5SXlU?=
 =?utf-8?B?NmJvQUVya1lubnJwQjNFUEwyOURtclBqY1h2VlR0RXR1UzZjZjY0REthSTlK?=
 =?utf-8?B?ZzFiZE01M0pmZ2FuaklhK3I5aEhFb2JlTnkrRUEzeFZ2ZC9uVUpQcGt0bUVB?=
 =?utf-8?B?cldKZmlmUGFIQnBwN3dxWlBmOVFKM0FHbmtLd0JJT2VYZ0NJK2piNWowbStJ?=
 =?utf-8?B?cFdhbFkxaDl1WFFsaDRNUFBxNGtzQ0kwcSsvN1J3clZzMUV4SHV3aVBBTHNs?=
 =?utf-8?B?c1hJRS9lV2FGYndpcStnY1lTRzl0REhVYXVsKzlUaWdUODNKNWF3MnZ1V2pR?=
 =?utf-8?B?bUhIVVQrYjFIWkxoZEFqYkNXRkZWak9GTC9rMnVRdTEwVWdZQWFJWEhzbXdx?=
 =?utf-8?B?WDBVOVUrT1JTNng4SCtSaHVTOXozTXFuMGN2QU5WL0dBY2hCaE5kWUpaUEdE?=
 =?utf-8?B?OHQrUEZBZmJVUEltaEEzMzk5YlI1Sm9RaUcrV0xJdm4xaFVsM2paTjlRbG03?=
 =?utf-8?B?WTNxdThSbktRaks3azBhd3dtWTZEWWdhOUE4dzZ6NnIyNVpzclByU2RONU1s?=
 =?utf-8?B?V2MreWNXakpPOTUrTWZsZ1RhTGtSOWR6QUtkYWI3Zm55UjI5bGpqazlpdE01?=
 =?utf-8?B?VWtwVm9GSnJpdWtVejlNSUtKMmxtSFV2OG5wcDJ2Z0pmcTlPcktkT2ljYmlI?=
 =?utf-8?B?TCs5ZWE3VGoxNHBLbFZzaXdTMVRCVEFxdHhBdkxZZ2d4akQvTWVkbEF1a0Vx?=
 =?utf-8?B?Vkl4blFxVW5EY1Y3MUdRUm4xcC8xcUFVRlFwbFRDOFpvb3ZmNWFxRm1EYWxq?=
 =?utf-8?B?cHpvMXRRaFJVUXRsZURiR0lWZm1yWTU4Q0U0RWtoWUZMV3V5eVRiNU05WmM5?=
 =?utf-8?B?M1hmRlZzMXU5OGh0OUhhV3hHN1pVNjFCTVB0UUhQa2MycUhCaS9IM3BzZmE5?=
 =?utf-8?B?WnBQNXh4a1FPandqeTRMaWNJQzBJQXNMY05qbWJlcGtRbGFyT3hvMXNJVWp4?=
 =?utf-8?B?Wm94TVN0ekRUbzNuRS8yWExmRW9mWlBlNHZxYjVVcFdSbkRBYWFiZ3l3WnA4?=
 =?utf-8?B?VU1UNmRCbW1aNVI1amtkTlRIYkxyTTB6dXJNWU93UE10WnNSbVlwQzZnY09Q?=
 =?utf-8?B?TWdiMytLOXIwUk1Samh3T1Q4Z0liODZMQ2R1eWVmNGpnK29Ld0FWVXU1bVFx?=
 =?utf-8?B?TGlOMUtmUzlzNW1lRzB4N3o4ODVzUVR1c2x6a0lxaDJuN3VVV1VZU0ZpOFF5?=
 =?utf-8?B?aW5GWUFsdVUvV1ZYaFV5VkpLZC80RkhDMENQa3MyMVZuUzZrMFJjb3VySDZa?=
 =?utf-8?B?Nmc1Vk1iQ3VNbVZjV3YwZTFCQWc1L0pJeHBSVy84VlpmWS9xZjBSNFd4bTNo?=
 =?utf-8?B?LzBIRTFjRHJRdDVFTUtUMW5Dc00zc3g2d29jblorQW1mSHQwMUpjMENPZVhZ?=
 =?utf-8?B?dVpJejFib2I5Nk5NUXVoUlJzZkFmUHlpcnRuYW5IMnNQdDZmZGdzLzMvMkhm?=
 =?utf-8?B?NVg4TUtQN29wOFRFNUtiZ0tGNk44V05hWlV2dXVNTERoZ3hzYVp6NW55ZWFn?=
 =?utf-8?B?d2cvaS9SYjQxbjI2Rm5TUnBMblo3M003TVdwamhYMWNEZWtOMXp2UFlKUU9L?=
 =?utf-8?B?dGlOb0NoVTJzQTJTYjMvWm1LMWc4d3Q5SWRSZ3poTXpYMzFKbTZNSGVhZHlu?=
 =?utf-8?B?RXIvUkNDMmdBZzR6UlVWcnQwZzAwNGJoWlA1aWt0ZHN3M2RvMzlSL3MzSVg1?=
 =?utf-8?B?VldMd09lTGtKak9hMGFCM3NIQ0tOV05jRVhvOWRZNGNPY21nbzBtV1dYbmFu?=
 =?utf-8?Q?AQQIl5C7yaOpDNBr5DBDYqE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ff9f84-5d33-4aef-fcc1-08de0cc93453
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:32:24.0574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUDhe1Emau7hd0IexMKg1UL536lEpRX1T+ux9l42KPvLguGdheOnsQT0MGlDSu9SQ9t1vvx7q7z/q2n9QW3Rgq+HsGZiArDxaKnvMfQBCEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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



On 10/14/2025 12:30 AM, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full GT re-initialization. Introduce runtime helpers for GT
> which greatly reduce suspend/resume delay.
>
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>      Use runtime naming for guc helpers (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>      Use runtime naming for ct helpers (Michal)
> v4: Fix tags (Rodrigo)
> v5: Include host_l2_vram workaround (Daniele)
>      Reuse xe_guc_submit_enable/disable() helpers (Daniele)

Based on the reply about VF behavior in the previous rev, I am thinking 
this is not the correct approach to this.
If on a VF the runtime_suspend/resume functions are not called at all 
like you said, it means that the VF driver needs to be able to cope with 
the fact that the HW can lose power without it being directly notified 
if its rpm refcount is 0. This in turn means that on a VF the driver 
can't rely on what you do in xe_uc_runtime_suspend/resume() to idle the 
state and must instead guarantee that the state is already idled when 
the last rpm ref is released and that a new rpm ref is taken before 
restarting anything (which might already be true). AFAIK there are no 
difference in the SW state management of queues and CTBs between PF and 
VF, so if we achieve that on a VF we'll also have it on PF/Native, which 
means that there will be no need to pause/unpause CTBs and exec_queues. 
The only thing that the PF would need to do in the rpm flow is program 
the HW (e.g. the host_l2_vram stuff and the irq re-enabling).

tl;dr, if we guarantee that:
1 - if the rpm refcount is 0 then there is no activity on HW, so nothing 
that needs to be paused (which might already be true)
2 - an rpm ref is taken before any activity is started (which might also 
already be true)

Then we're guaranteeing that there is nothing to pause/unpause at 
runtime suspend/resume time, so we're safe skipping those calls entirely 
on VF while on native/PF we can just focus on the HW re-programming.

BTW, any idea how this is working with the current code? Given that 
we're re-loading the GuC on runtime resume, are the VFs getting 
disconnected and having to detect that and re-connect? Or are we just 
disabling rpm if a VF is enabled? Because if our approach is that rpm is 
just not supported if VFs are in use then we can keep your current 
approach and add an assert to make sure we're not runtime suspending if 
the vf count is > 0.

Daniele

>
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>   drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>   drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>   drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>   9 files changed, 162 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d8e94fb8b9bd..0eacca14ccbb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1003,6 +1003,66 @@ int xe_gt_resume(struct xe_gt *gt)
>   	return err;
>   }
>   
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +	xe_gt_disable_host_l2_vram(gt);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_gt_enable_host_l2_vram(gt);
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>   				     enum xe_engine_class class,
>   				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5df2ffe3ff83..ceb633ec22d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -52,6 +52,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..6262ca1c1d42 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1599,6 +1599,40 @@ int xe_guc_start(struct xe_guc *guc)
>   	return xe_guc_submit_start(guc);
>   }
>   
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	xe_guc_submit_disable(guc);
> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> +	 * directly enable IRQ.
> +	 */
> +	guc_enable_irq(guc);
> +
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	xe_guc_submit_enable(guc);
> +	xe_guc_submit_unpause(guc);
> +}
> +
>   void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 1cca05967e62..0165e941a352 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>   int xe_guc_enable_communication(struct xe_guc *guc);
>   int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>   int xe_guc_suspend(struct xe_guc *guc);
>   void xe_guc_notify(struct xe_guc *guc);
>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3ae1e8db143a..2232e872dbd6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>   	stop_g2h_handler(ct);
>   }
>   
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(ct);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_restart(ct);
> +}
> +
>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>   {
>   	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index ca1ce2b3c354..5599939f8fe1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
>   int xe_guc_ct_restart(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 53507e09f7bc..403a61e98ad8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>   		if (err)
>   			goto out_resume;
>   	}
> @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_rpm_lockmap_acquire(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>   	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
>   			goto out;
> @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>   
>   	xe_display_pm_runtime_resume(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..6a58b33248f5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>   /**
>    * xe_uc_declare_wedged() - Declare UC wedged
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
>   void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);

