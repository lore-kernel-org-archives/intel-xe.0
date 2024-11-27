Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B7D6D23C
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 20:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4331910E096;
	Wed, 27 Nov 2024 20:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jx32daEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A19310E096
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732741103; x=1764277103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k2AZpfbCq3p9RNeA1GuBanTUdWK6K6suuXviO/QoYu8=;
 b=Jx32daELk3XBhXLGTpW3yZOm2R0sutp7jhBjsjPikP8QwKC7ccJTrGd1
 DNjvapcktzZwH/9nZvd9NchkpgA8VY0filUOUP/s3AO2y6FzmsVYy2Gdw
 Vnndsk2qgBQMssm2HaMfOkyAN2qpnPpgh91UgjGXGnlD2ygK1ASGFUncl
 VPnrAmMsDLOaybI0EYvrxJt2kBDXbIQzKz/utGojA7pEvVWyhhEtSbHNP
 6ecF0picLkpBOSa749Mbeo0H49xXmFIUjxLneIPR0Gdc1zJAtESBFimMv
 joShaD31osrozhjJMwQ0snbRBJYkFGeHiCe8SWiWFfmbvsGEJm5nbjvYg A==;
X-CSE-ConnectionGUID: a1f8V/M4RrOhaO9otWSW5A==
X-CSE-MsgGUID: gg7DzXYhSwuUKHqAnJp/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="55458424"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="55458424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:58:22 -0800
X-CSE-ConnectionGUID: 2Ty3Ol6rQgazWNpElwwOnw==
X-CSE-MsgGUID: Yt0w+ZcLS2OL1LKprHu1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="123009331"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 12:58:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 12:58:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 12:58:21 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 12:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c20lSuHBOtg0q4cLetm7d4NlOhyaQ26fInqXRRzEQNg1OF8jCnFg+XB0TEJJY43oHBP97hdIV3tEsUNywkNOccmHQPvYV8SmMEu1HUZr4kMovMHhKcOwM+mONKD/J+cXUuZwIoxTHeeXZ3I/+1bR6hfe10EXWWsL3JV1jB3bpJcjprh8QW9KIDnncBykCiap+9J1tyZ0q3tXkcOuncDK+01gGLH9vl6dKVCX2TgFXn1LCs4uyR5nQq2YOpxsbmcp0aJGgbtx6v7pBrP/Ef6EgQhNvhJwApSB2t5yE8stHC4WyBWKP/i/uPcVZHlDxpunAdH8vN+PZ+pRlRPEleHwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIRDkSaQoBkZmfBs8ln0uZYe+Hu3Jjjdb+KlisHkVK4=;
 b=nGbLN/ZhbUTGB8AIV6wXy5Kv7ffkzpkLwAokdLpCDlCDAnDF27LBCidYKS3Y5qFkdJtuVqWo8KB63mM1cqW9iXTogLX/92LCMc6MCSfEeqSW3hw7JEDKRatwM/22mbwhs6ioHkBMCaNaQ+Gvu30/swAh7MfZ7jMnJAnWVf1TYlf6YjXQiqfEKAH4r+0dEk7XA77+Ng4325/ilrcCloO9yDusoRMSmhesDFk0iERTGseZ6qIW0qV2Al6LIcCDbbSA6PSTMGik+9k8ddlgGLcOEZxBGPd7hqYOf6HU5nq2ASJlARrmDOMR7q/9+ElCrGsfSziKZL26FkmgYvP2lE6aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 20:58:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 20:58:18 +0000
Date: Wed, 27 Nov 2024 12:58:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, <intel-xe@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Z0eH6EOJwlQL+DwF@orsosgc001>
References: <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
 <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
 <Z0TLB2W3n37mPFRM@orsosgc001>
 <3288651c-3b4f-4e84-accf-a0ae8c77eb83@intel.com>
 <bdthqtjd6va275hbcesr7uayjie3ykxtebaxf7cuf64fczhrqd@khrjqxa5nuq4>
 <Z0dpQFtZhxaHXdSv@orsosgc001>
 <stnoaa4hp6ctxwjpnimbzxqpp4nwqcguhsr4xbklmlyatvvvkb@ttv2tabfwhrm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <stnoaa4hp6ctxwjpnimbzxqpp4nwqcguhsr4xbklmlyatvvvkb@ttv2tabfwhrm>
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 54434338-de70-491a-e573-08dd0f263843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUUyZnRNZjZWUkVZLzltcHI5dWVOVXg2clRsSDR0dFJDdWJqbDdBRHU0NzEx?=
 =?utf-8?B?czJnRkNiWHB3YlZBNnlaL2xZODIwRm1rL3ZmcXMrOU9HM25JdXhmcWRUWEdv?=
 =?utf-8?B?VG9CZ1JreW5KbW03SlRBSzVUSFdsU3BKRHdQUE8xTUFvYVdOcTZQdGl6Q1h0?=
 =?utf-8?B?MElCSlFuRWx0Z2d0aCtTT2FDOTh6RWhHTEtzaUJaWVNud290d09GWXpTTGZn?=
 =?utf-8?B?a1BFRTRhZ2kxbFovcG5HNmoxYU5nWXNhTGJ0SzRGcWQ1ZWI2MmdUenFURmRs?=
 =?utf-8?B?S281aUhnMVAxYmU4UCtNUkcySTFDbzZ6eVVscCtCNCtBVDNiS284aGtpMnVs?=
 =?utf-8?B?ZkNwYzNLRHJ4NStuNkJFS0Exam42dHlNU283V2lKZE82WDlpK25oL2dvSjVH?=
 =?utf-8?B?NDNLTGt0bHc2UXphczZTYU1DSS9YSjNwR3NVblMvVE5uM1k3QmtBQmVRdnd2?=
 =?utf-8?B?QlpTVU42RUNwR3lIN1plUVQ4YkJZR29BSEVUN2RDdHFxOXUvUHJETUtJVHQy?=
 =?utf-8?B?NjlHRFc5TlYwNTcxL1pBd0tLc2JWVC9mVUxicHdubGV6elJjaU5mYXE3cmVz?=
 =?utf-8?B?NndhZHZ4WkdmZS9kK1RtUFgxUUhXVlRObDlJWG9LRFdITFJ6eG90ajZ1Snlh?=
 =?utf-8?B?V1g0RjZhaTNlQXZveUpuYmpYZFFFOU14OVVHMllKVDBCc0Zkd0pqTG1mcGR2?=
 =?utf-8?B?V2VFMUhUY011OFFoSkUrdm5OMXFaL1l2eXN6TnFoS0sxSTBIejJ6NjNoSU51?=
 =?utf-8?B?aCs4STRMcUVRSGhobUNvaSs5SGk2THBkRUk2aDBZVVNWY2RPcHRab3UwMEhD?=
 =?utf-8?B?Nm5TUzd1U2dXZEpjNHlmVnVXQ3NrTGd1VERMY3hsd21VT2lhRzA3OFQ0dEc3?=
 =?utf-8?B?eU51UXNFYnMxR1BqYjQ5YnJFaUt2V1R2MEMzKzVjbXB4SjBiQldESCtUUzRq?=
 =?utf-8?B?R0dWS0xkLzJIWGs3STdIWkRTcWg1R1RNVmdUa1FlMWZmZFF5WVgzZDlvZnc3?=
 =?utf-8?B?NEJSQ1MvS0EzeGQrd3dCN1B6SUs0ZUh4dDVMaUN1eUNIOHJoT05zMUFsdjVT?=
 =?utf-8?B?bEo0U0pUWjJwVUZJOFM2NjRnOWxJL2RTU0dZSTFqclcwcTdFWUw0emJFUzg3?=
 =?utf-8?B?SGtZWG12YUY2NENSMTFqbjlXMUJNMVhFSHZ1WjUwTVQzeVEvdUdmNDZqT3FH?=
 =?utf-8?B?VGR6YXM3aDd1UTUzYTdMdnNlSjFxcVkvWlBWMWpFTlp3djlhUWJoekViNllL?=
 =?utf-8?B?dkE4dkh0UnZ1QW5uVDMxRUdRRDl6YTBpUDNYV09aK1VQMWlRWFRkYW9OaUtN?=
 =?utf-8?B?cHArK09iSDNJQnlyTXlnUWFSQkhRcFpmMkhINDRIZzZQcXh0aUlXYWpVam5X?=
 =?utf-8?B?UDIrOCtVbmMxRDRNdWp0WTRzcXR1dStNeEQ5UHIzVmtsazFXczZ6eVBYVDRx?=
 =?utf-8?B?ZGV5WGE4RE1MNnV3aE41WFovZVZ2N2l4WTdET0J2Zzl4T1JvYUN4ZVhDZ1dD?=
 =?utf-8?B?YXNVNWJ0dHhRRENiTU9UV0tocXNYQzQ1aXVnK0NveTBYZHBWL2FaQXNHQ0pq?=
 =?utf-8?B?R0FGek1yS0RvekQrL3NISlpkOVhaSDZXV3VBR0tBNW1RUGtERG1qL0llSTVI?=
 =?utf-8?B?SHVVMU1mU0kvYnBsaG9XYUs0WUdLMHEyYVZFbUcvR1RoY3N4NG5tYXJjdUtm?=
 =?utf-8?B?dXhrREdXWk1HbWlEMlVFYkJ4US85SmJQMmppbUc3QlFLRWVJSXRyYXVQTjEx?=
 =?utf-8?Q?Yh6WXQwyojeham6M2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlpVjR6MWdUcS9wQ1Q5cTNaNTV0UzlTRDVkWitSRitlNElIVnl4R0Rqajlo?=
 =?utf-8?B?UWtkcGJ6bDhMWHIrSmVOeDBsSGlIQnhaeUEwTHJGZkE0Q1poYkp5UkcyMDlu?=
 =?utf-8?B?ZkZBazlhUkduQ0ZnMXRJMDdtMk5PSTF1NmZlTFhUelRYVnQ2SWJXdmdHY3Jw?=
 =?utf-8?B?NktpMmhaZVVDV3VVYWsra2R4bWExTXdHUTNpdkhjUVpYUTQzaVNnak9HeDJo?=
 =?utf-8?B?U3E2TXVRS05taXZOV0VEVjRPUk9YT2gvelRsUjd4VVRieVJWdzE0UUVvYmNk?=
 =?utf-8?B?ZjNzbDB5NWdDZlh2bU5EeE9WdnV1Z05pUFVsMDJheC85WkR0L0VCUHQzazhi?=
 =?utf-8?B?N3JaQUlxbjdTaU5SbmdEQnNFR3ZydDdhdE9JTVZxbnNjd0JobDNPenMyQ3Zs?=
 =?utf-8?B?dUxxbTg4azBwMnFVQldKRW4rNXRHZkd4STN4U1EybUFjWUdpRUd4VzJsY1JD?=
 =?utf-8?B?V3VIVTVvckNtS25JTWxsNDRIRHArNHRKSkovUTBpYTJPUWdZbkh5amt2a2k5?=
 =?utf-8?B?QmIvREowRURqNmhVNlBxdEVhMjBkTVhFeW4yOUI4QitUa3padmJZTUVOZWg0?=
 =?utf-8?B?QjY1N1VUVllOZ05NZlkya1NkL01EUVpuQmZBRm9iMGIzMm9hR2JKUzRaZHpI?=
 =?utf-8?B?b1JkajhzWUNrd2ZoZUtzNzFkNU9sNHdWUHpuUzZEcTNFM3JQS0x4VHlJQW15?=
 =?utf-8?B?dmhJK2NPZWJkYzYzeEtudFVBamQ2RlJ5cHBqQ29ZZU1IeFdERFhoMU02Q2pj?=
 =?utf-8?B?d0p0WmNrU29Kc2dVRFV3UUFJQ3dldHl5eEZtUXlRRU1TNWVXR0p6ejFLOGd3?=
 =?utf-8?B?enlFSGJ0bE5sZnI3NnI4UXJrSUszbmNIMUxXTG5Oak5wZU9XK0NXMjJVRzNJ?=
 =?utf-8?B?VDhGWGdtQ1VmZFN2MlZQb09RaXhlMlBCdjRjaXNqRXQ4N24vaVdYdEs4NFhW?=
 =?utf-8?B?byt4b1I2Y3pQQTE5Tm1vNW9CZ0s0NmtxYXNrNm9za1NHVnNpSGNGYURjR0dN?=
 =?utf-8?B?VkhwZkhkWmJYcHhLTXpEa0RZVW94VkVXQTlvSFRYVkY5R3dCeDNUM1NyR0Nk?=
 =?utf-8?B?Y1FPbU9LTUpobWRMUFA4MURhWjdlQnVXQVN1MllVSWtEVXlkM1p2QTZYNWN6?=
 =?utf-8?B?dVU2ZVQ3bWc2Sm5BVXlhSVdvTVlXY2kxWjlXVzFtZE9pSGh1NmJtKzFPTGhP?=
 =?utf-8?B?Q3M4VXdCRm5nM0o1ams1a3Urc3B0VlR3YWJ2d0tWRG9XWTZzWUxiU0h0QmE2?=
 =?utf-8?B?Q3c5K0hzcVEwRVhIWjNkalo0WVZ5a1FjVm9hMjJ1QVJFa01XR3pLcDhzdERK?=
 =?utf-8?B?NzB5R2VXSzc2NWRxc3RJdTRKZDRRcVlFbm1aR1FkdjNjeEh3bEdtVUpMcVp1?=
 =?utf-8?B?NFg5M2JzbTh0cit5LzhFWHpvYS9nbUtUWGM1amFkNUxKZjlYK3hjU3FqSFFw?=
 =?utf-8?B?c1lIUk1zN3NINC9hUzV0a3VBaEhJUGZ3dy94VkEyVlZIWmZmbjNlb0VhU05N?=
 =?utf-8?B?dWE0VlJndU9RMWtaYVJpZHUrUit3emcxZHEwUU5qM0lzakJSTm1SS2FFeWxt?=
 =?utf-8?B?cGNKUm42SjkrdGdZcTE3V1JlL2pTWldGRUNRVzZNOUpQNEZ2Sjc1dDZaVDVN?=
 =?utf-8?B?czBLZWpxelJwNTlhdEJMSVB4aHF4UFRPT1RXVEI1VUVQZzVXaTJEdHFkaUVL?=
 =?utf-8?B?bU9MZ0tvOS9KRUZPcHVqTUlLbFhjYWJBZjU2RU14MU91ZklsUE5Pc1ZOeVdl?=
 =?utf-8?B?VnhLN3dIK0FwZ2l0RTNKRmVRZ0JCRnJlclVWWWJtNFA3R2g0MklOaGxNcVlx?=
 =?utf-8?B?bEZXZUh2MGIxQTN0MmZzVVJldVZMUWpvcTJiOEhFVjBxSHZNRFNKVTAzazdN?=
 =?utf-8?B?YjVpRDRYM2gyZmR5STRKUE9ZMUcyb3BpM2kwT2tFZmJ3UHB5N0JtWkxwcmJV?=
 =?utf-8?B?Q2k1SUMzcEVpK044OGdBclNLazBzeVJ1d1dRcDFzQ2dFdE5HK3ZoSzA3NUFS?=
 =?utf-8?B?VWJVS2JWOTFSNTFPendXdk9GK3VzWDBvT2owTlFwbWxQTkZkVi9Ld1dzQTI4?=
 =?utf-8?B?UzZCRUJpYndGZVlCUXVZQlNiWFFqZ2NjcTdoL09KaDNVQzRIVFIzZU5hODdX?=
 =?utf-8?B?R2YwZVExYmdUaU4zTHhuR2pBazZhVjBiTWh0OGhwYjFwYUl5YmJ1ckFzVHdp?=
 =?utf-8?Q?Axll4E+ERX4by8HBZFXRPTU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54434338-de70-491a-e573-08dd0f263843
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 20:58:18.5660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up5xE30cLSZm1UxnyZgO2zWqEEdoN/4gkfq77tHoUGYZS+3GCmwOVP5YP1K12M1GhyLjotaK5BpcRhhu2W5RMIN4NCD6ONZRjKnjbvoosNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Wed, Nov 27, 2024 at 01:11:14PM -0600, Lucas De Marchi wrote:
>On Wed, Nov 27, 2024 at 10:47:28AM -0800, Umesh Nerlige Ramappa wrote:
>>On Wed, Nov 27, 2024 at 11:13:24AM -0600, Lucas De Marchi wrote:
>>>On Wed, Nov 27, 2024 at 12:42:14PM +0530, Riana Tauro wrote:
>>>>Hi Lucas
>>>>
>>>>On 11/26/2024 12:37 AM, Umesh Nerlige Ramappa wrote:
>>>>>On Mon, Sep 02, 2024 at 10:01:11PM -0500, Lucas De Marchi wrote:
>>>>>>On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>>>>>>>
>>>>>>>On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>>>>>>>
>>>>>>>>On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>>>>>>>>On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>>>>>>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>>>>>>index b6fbe4988f2e..de6f39db618c 100644
>>>>>>>>>>--- a/include/uapi/drm/xe_drm.h
>>>>>>>>>>+++ b/include/uapi/drm/xe_drm.h
>>>>>>>>>>@@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>>>>>>>    __u64 reserved[2];
>>>>>>>>>>};
>>>>>>>>>>
>>>>>>>>>>+/**
>>>>>>>>>>+ * DOC: XE PMU event config IDs
>>>>>>>>>>+ *
>>>>>>>>>>+ * Check 'man perf_event_open' to use the ID's 
>>>>>>>>>>XE_PMU_XXXX listed in xe_drm.h
>>>>>>>>>>+ * in 'struct perf_event_attr' as part of 
>>>>>>>>>>perf_event_open syscall to read a
>>>>>>>>>>+ * particular event.
>>>>>>>>>>+ *
>>>>>>>>>>+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>>>>>>+ *
>>>>>>>>>>+ * .. code-block:: C
>>>>>>>>>>+ *
>>>>>>>>>>+ *    struct perf_event_attr attr;
>>>>>>>>>>+ *    long long count;
>>>>>>>>>>+ *    int cpu = 0;
>>>>>>>>>>+ *    int fd;
>>>>>>>>>>+ *
>>>>>>>>>>+ *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>>>>>>>+ *    attr.type = type; // eg: 
>>>>>>>>>>/sys/bus/event_source/devices/ xe_0000_56_00.0/type
>>>>>>>>>>+ *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>>>>>>>+ *    attr.use_clockid = 1;
>>>>>>>>>>+ *    attr.clockid = CLOCK_MONOTONIC;
>>>>>>>>>>+ *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>>>>>>>+ *
>>>>>>>>>>+ *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>>>>>>>+ */
>>>>>>>>>>+
>>>>>>>>>>+/*
>>>>>>>>>>+ * Top bits of every counter are GT id.
>>>>>>>>>>+ */
>>>>>>>>>>+#define __XE_PMU_GT_SHIFT (56)
>>>>>>>>>>+
>>>>>>>>>>+#define ___XE_PMU_OTHER(gt, x) \
>>>>>>>>>>+    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>>>>>>>+
>>>>>>>>>
>>>>>>>>>The perf uapi is self-describing and users should look 
>>>>>>>>>up on sysfs what
>>>>>>>>>to use. Example for i915 since it's what I'm currently working on:
>>>>>>>>>
>>>>>>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>>>>>>>    config=0x100000
>>>>>>>>>    $ cat 
>>>>>>>>>/sys/bus/event_source/devices/i915/events/actual- 
>>>>>>>>>frequency.unit
>>>>>>>>>    M
>>>>>>>>>
>>>>>>>>>`perf list` works fine and doesn't know anything about this xe-only
>>>>>>>>>header. Why would we add anything here rather than 
>>>>>>>>>encourage other users
>>>>>>>>>to read from the generic interface?
>>>>>>>>
>>>>>>>>Agree. perf list | grep rc6 is sufficient.
>>>>>>>
>>>>>>>This was previously asked by Rodrigo https:// 
>>>>>>>patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>>>>>>>
>>>>>>>so what changed from then to now.
>>>>>>
>>>>>>2 different things. That rev you are pointing out had:
>>>>>>
>>>>>>include/uapi/drm/xe_drm.h            |  16 +
>>>>>>
>>>>>>so the uapi was being changed without proper doc. Rodrigo asked for the
>>>>>>documentation to be added, because that is the proper way to add things
>>>>>>to the uapi header.
>>>>>>
>>>>>>In this review what I noticed though is that the change shouldn't be
>>>>>>there in the first place. We shouldn't change anything in the drm/xe
>>>>>>UAPI header because this is actually an UAPI (via sysfs) coming from
>>>>>>perf.
>>>>>
>>>>>@Lucas,
>>>>>
>>>>>Agree. This is carried over from i915, where other constraints 
>>>>>may have led to adding some header bits for gt.
>>>>>
>>>>>I want to mention that now there are 2 events per engine - 
>>>>>ticks (actual engine run ticks) and total_ticks (total ticks 
>>>>>that the engine was alloted) which enable us to take a ratio 
>>>>>of deltas to calculate utilization at the engine level. If we 
>>>>>add the config for each possible combination of gt and vf_id, 
>>>>>we would have
>>>>>
>>>>>num_engines * 2 * num_gts * num_vfs
>>>
>>>not sure what you're trying to do here with that * 2...?
>>>
>>>what are you trying to read from the userspace side?  2 separate
>>>counters or just 1 with the embedded info?
>>
>>2 separate counters per engine. Both are required to calculate % 
>>busyness. This is similar to PCEU where we read 2 counters and then 
>>determine the % utilization.
>
>so you don't need to embed the 2 in the config, since they are 2
>separate counters, each having its own set of config bits.
>
>>
>>>
>>>Also, why is this considering num_vfs? Is this to monitor from the host
>>>all the VFs being used?
>>
>>Yes. Currently VF specific utilization can only be accessed from host.
>>
>>>If so, then we need to be careful what we are
>>>trying to support: there's no dynamic event creation in perf - we'd
>>>need to unregister and register the pmu again like it's done in the
>>>uncore pmu
>>
>>Yes, initially I was suggesting that only supported events should 
>>show up in sysfs, but later Riana pointed out that we cannot do it, 
>>so I was hoping we could just register events for max_vfs (which is 
>>known at driver load time). Although, that's not a clean way to do 
>>it.
>>
>>Ideally VF KMD should be responsible for it's own instance of PMU 
>>(like below), but reading the counters from VF is not supported yet,
>>
>>/sys/bus/event_source/devices/<host_device>/events
>>/sys/bus/event_source/devices/<vf1>/events
>>/sys/bus/event_source/devices/<vf2>/events
>
>this would make it not accessible for PF for real use cases (the device
>being used inside a VM), unless a) I'm missing something, or b) by <vf1>
>you mean the PF driver is registering that (i.e. it's visible on the
>host side only)

Right, I was just mentioning that VF is responsible for it's own 
counters, but we want to read those counters from a PF and we cannot use 
the above.

>
>>...
>>
>>What we have here is a special case where VF events are being 
>>accessed from host, so I am unclear on what the best interface would 
>>be.
>>
>>Maybe we just create new PMU instances in host for each provisioned 
>>VF and then list those events under host like below:
>>
>>/sys/bus/event_source/devices/<host_device>/events/vf1
>>/sys/bus/event_source/devices/<host_device>/events/vf2
>>...
>>
>>These sysfs directories will get created dynamically, but will be 
>>associated with separate PMU instance.
>
>these are all *host* events that the *PF* instance creates. I think you
>can't have it as directories like above and we should probably support
>it in the same way we support multiple pcie devices connected, i.e. by
>hand crafting the name of the device... so it would actually be:
>
>/sys/bus/event_source/devices/xe_<host_device>_pf/events/*
>/sys/bus/event_source/devices/xe_<host_device>_vf1/events/*
>/sys/bus/event_source/devices/xe_<host_device>_vf2/events/*

ok, looks like the name we register for each PMU will be placed in 
/sys/bus/event_source/devices/, so that's still okay.

>
>etc.... The biggest problem is that we can't really unregister them on
>vf teardown until the perf_pmu_unregister() is fixed.

ok, agree. I guess we should just wait for that fix to land before any 
of this can be merged then.

Thanks,
Umesh

>
>Lucas De Marchi
>
>>
>>Thoughts?
>>
>>Thanks,
>>Umesh
>>
>>>
>>>>>
>>>>>where num_vfs should (ideally) be the number of vfs provisioned.
>>>>
>>>>Here it will be max_vfs instead of provisioned num_vfs. Pmu 
>>>>event attributes are added on pmu_register.
>>>>
>>>>num_engines * 2 * num_gts * max_vfs
>>>>
>>>>Did not find a way to add/remove events dynamically.
>>>
>>>there isn't. other PMUs unregister and register it again... but that is
>>>only done on early probe, not something really dynamic. If we want to
>>>support something dynamic like that then we really need to wait the
>>>perf_pmu_unregister() to be fixed: not really possible without that.
>>>
>>>
>>>Lucas De Marchi
>>>
>>>>
>>>>Thanks
>>>>Riana
>>>>
>>>>>
>>>>>Do you think that's fine?
>>>
>>>you have config, config1 and config2, each with 64bits
>>>
>>>I'm not really sure what that *2 mean and we'd better have some room
>>>to grow it for ABI compatibility (even if a proper tool would read the
>>>sysfs to check what is the meaning of each bit).
>>>
>>>Lucas De Marchi
>>>
>>>>>
>>>>>Thanks,
>>>>>Umesh
>>>>>
>>>>>>
>>>>>>Lucas De Marchi
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>Thanks,
>>>>>>>Aravind.
>>>>>>>
>>>>>>>>
>>>>>>>>Thanks,
>>>>>>>>
>>>>>>>>Vinay.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>Lucas De Marchi
>>>>
