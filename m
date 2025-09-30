Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BEDCCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 15:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA8910E5F9;
	Tue, 30 Sep 2025 15:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9IEOk4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25A10E5F9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759245884; x=1790781884;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0lXkG2y0ZrqTEwEG1gy/UBsdrLhYrskjBxrUyPs3DHU=;
 b=m9IEOk4cBJnkGeJ68qGPORJ39P/fAvjlToG3VvnLGghSZzHe6Zp2ZN3Q
 Y/MLld13SQsJMzo9ODD8IDMKQJfmYkDfeRUqseAoXgO2WTZjo/Mp6xFCk
 t882gEpLUE5ao2tzGFpb8A0yG7SvYvQpOvCLI3N3RWhvxklJ3MteboXBJ
 60skVfBsziuIlj7pquigy+PE7HTfKaMoDR5yI1gHXOB3p9wmRJnw3nuvG
 AGtw+2wjREUrpW/FI75qVlyngPwt8+G7a2T0NQj0I8GueM+pCx1VBwf+Z
 +1stUSi3U0d+PI8/HWJFhLihSc/CjeNpidsO8K3nJcN7LXOP4bhXNGa25 g==;
X-CSE-ConnectionGUID: /2LJHFtnSW6sdkAZIB5lAw==
X-CSE-MsgGUID: 4Z89SLe7TB+mI8FyFh1LQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84123221"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="84123221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:24:43 -0700
X-CSE-ConnectionGUID: viM+rJzCRq6i4uFWTI9GCw==
X-CSE-MsgGUID: fXY6aaBuSuq1t6HNj2mwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182962498"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:24:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:24:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 08:24:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfmmdD7Q0HubomQKzMxumSZcmWQbyQf0+aFDlEIXCtLBo6xNcM/g8CBJyn7lkQ6g30DKFa3X++KRhAX2G17A69ff6dbqFhFmON1d8ksZEX9UDQQnVGcDlmswcsxRw5rjn/26oH+0ODuS0EOHaMLALrNyCtk4Zen7b+bRJVmpgGy5RhpULyU7DgR5Dq4iFk6mp41MQuO+kqiyTkcLyPgNO+9EUBjqk17e1A4Eq+L/4tFrq552vTNLc/Nc9Y3VHiXc7gzMKQA4KH52pQwiCaVvoFc1W68i0cOKIoyDB70sE89hDtd55YCvMZmE0L1wd3RJ1StVV9Z7LlPxzwyHV4Hxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a16ISXbTJ49hVsVezoz/+kIVAzIsXmeCHIDhfs2+/Gs=;
 b=vTTXt3k0l3TfmXhKe9LEgVFdCyIdZzviaeVbnlAx+6cS6hzowCOMTOlMBoY9W1tbOqWbcoomP7qIDwugV80bpdwMUq6SlrX2nIqDAPgYaTjW3Yk1rB+OZq5HkjvR7tWFOQDmuxzxS7YZdN+siPSOJ0li0BIglcTD9ir8SI6w3sHr+qTCQUeqWMwx29QIV1j1cWi+HTaQy9FUkrmGg16njK4ogIDPyjH5NvwUPO4mDiqP8SJZHnr03JuJnf1wwWhr1uJMxqLRVGHT9dDwqg90rFbnnw6X6mDhSbt0r3pdjjTi2Mj4KFysc8kEDQnArzje82PUot6ef7uzaYK4J62TMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:24:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 15:24:40 +0000
Message-ID: <2e85d197-e223-4c57-ab29-ffa7c0176f2b@intel.com>
Date: Tue, 30 Sep 2025 17:24:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/36] Revert "drm/xe/vf: Post migration, repopulate
 ring area for pending request"
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-5-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f5ef96-fc49-44ec-c252-08de0035791f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0NkMVJrclN1cFJLQW1oMjc1Z1Y0bU9uVHk1RzhlNEZFVldzVHBnM0toNS9w?=
 =?utf-8?B?QXZQWjRkTmRmbXRjTDZUU08weEYwWjh0dTZMTjlzL1lEZ2VMNHlTT2dWUWVU?=
 =?utf-8?B?dUlsZ1VaYjlhWXN5ZitVOWlnRUJTak81WFFDQ1FBQVlpZnpqTG9xSkZvUmJL?=
 =?utf-8?B?MEJ3K09Cd1VUcnBJMjVoNDRESGgrQXEvYURNQnFBdVNlUmZ5NkhpTjBad3JL?=
 =?utf-8?B?eG1hU3RaaW14b3RRcHZxMDZyaE5zbnJhTHdaRlk4NFl0SHB6RUg1dGRiMTVU?=
 =?utf-8?B?QzRJWTZpblJBajYrOEdaVmlxaFZFbDBLVkZvQWh4WlNaLy9nWTRaTkYvU2wv?=
 =?utf-8?B?dGJ3N2dkS2JMbDE0ckQ3VUF6YlVYeU13SnJKdXlvTkcwWHpaVTZxb2pWMTJS?=
 =?utf-8?B?dmsySjJGQ1ZJb2UydmR5ZC9PVjBqcmtDU2VFOTRuTlcyS3NPL3ptbTdMa3Bv?=
 =?utf-8?B?NnYwTktrUW0vbTVETXhaTGFnK0lEQUgrTS95SDBCUU1EaGR6cWJ5T2RvN0lu?=
 =?utf-8?B?UEJjODZJbVZzQWxraHkwanN4QXpVTlFHVWtVNExYVVVYQThPZjRET2hZSFdB?=
 =?utf-8?B?QlF2NXQwblJrQlhNS2ZhWktiOHRJb3NGVEVveXJBcVZpNUdXSEFFeVdMclBq?=
 =?utf-8?B?cUdlb25KYzh3RmJuNitYWkRpNkxFS2hlejJBaXVWZ0xKYTFUSHZsOFdQdGpl?=
 =?utf-8?B?UDJZNHQ3MlY5emNKbFh5aWJTR1Q5Q0cvTHFxNzh2djR1aWozUVoxYjg0UXRv?=
 =?utf-8?B?N2doS2FNV2ZZeW9Yc3lvdWJJcEdFQjY5dW9XdlZZajZDbFRDa0ZWaHgyOGJ4?=
 =?utf-8?B?RThGL2N1SnpKYzE2azlFQXUwWXlRaUhzT05SeVUzZjk3ZDMrZldPMG9RaCtK?=
 =?utf-8?B?VnN1MmNYeWZjNGphZmV6bU9iRGZucmVPRkFsSzRwSTRqem1WSW5qZERNMjhN?=
 =?utf-8?B?b3RWYnl2b2NOOUIwVmdaTG5pc0t3MDhkMkVybTdndEdvRlhxV29oUjQ4dVor?=
 =?utf-8?B?bVNZYkE1K0FoMmhlOVpUbzB2SDVZekkwVVFnSUVlckRzeXU3K2R6L3ZIWUU2?=
 =?utf-8?B?R1hZOXgraUlud2UzOWVnREdiWkpZc0tIanRpa3dRMnRoSDF2QkVSVzVpTHdB?=
 =?utf-8?B?Q0RqWE5zUjN1OFYzZW5GTXNuRi91S0VQbURUTXBQemVjcXdIVlJNSzNHOFpB?=
 =?utf-8?B?U1cxSkc3emN2ZVRTTXR4NlB5NmxhL2FqTTBvL1pWOThxalZhb2p6QWVDNHEr?=
 =?utf-8?B?d1B5VUxBUWlidEQ4L3hrQ1hsL0kxRWs3ekpINnRFelRGQjhOaUIwYzh5Q05R?=
 =?utf-8?B?K3BaMTNhVlQ3MW5yenlQK3RraWhEam04S1BBVkE0ZVRQbG81aWFxWldscFNh?=
 =?utf-8?B?dGM4aTdBZWVseDJ6dFM5KzZHeXEyRnFvMCtIeldXMHBYN014NS9lS3AyVW0w?=
 =?utf-8?B?bDRtdERjTkV4Kys5bjNrdEtXUGNGZmxRTE1HdE0xMEQxdm0rRENuVzFtM3FL?=
 =?utf-8?B?STNNOUUwUFRvVWxFekpzRHFxZ3h2dWlOd2c4NEZQKzZrYXY3VlhnY1RJRGlF?=
 =?utf-8?B?V2szRXhhN0loVGdYVkEyVHBvWm5rSEc2L3FvM3ROU1lrRFlpdE9JQ3hQem9F?=
 =?utf-8?B?aUM5bW16Rk5aVjhkNFFSdnNBTVZ4cWV5Q0ludXM3dmlNTVUyRTNKNW04eWx6?=
 =?utf-8?B?dUVoKzk4dlFJQkh5eVRnQjFMNGsvcTRxaW52bUVjcG5DQVFpWEZ0NHR6Qm40?=
 =?utf-8?B?S0dIVDNKemk4VUFiMjZacjI3eTZiRjZFNzFBUlY5Z0Yxd1pHYWVXdHFrbzY5?=
 =?utf-8?B?bUNTOWNQRVA1Sm5mRGZTQmVXSkkwUHRxNzZiUlZzRUl3YkFlbVJBbDdxdVVB?=
 =?utf-8?B?NW1Xdkxqcy9DQnhhYmdDUjRzR2FnM1ZsOHNKeFZiNlpMTHdvYkc2MDV4M1Er?=
 =?utf-8?Q?ZbfRmYSq09EfZaZCKFF2jq7I1ub1G1yU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHB4REp6ZThQL3JVRkw5dXFMMlVLcXUvUi9IeDM5b3U5SnliNU12RDk4THNi?=
 =?utf-8?B?Ny9vZzdCdUE0TEdydVFyQ0NGak10d0FlK0txV2U2Ny9hTEEyRWVhbURic3ly?=
 =?utf-8?B?STFHU3J5dkE4WFgvS2VzV1ZKaHJGM2ZMVm52UTBvZm9KaXY4dzRaWGo2U1ho?=
 =?utf-8?B?TERVNS9nWW1XclZVSm1UL3lkKzlPb0RsVGszNjYvTlJzUnk3Wkw4WHFlUDhl?=
 =?utf-8?B?QVIxM2hRQnRNakZIb01mcFFlVndpNmRhZVpBUjRCMG5ZOFVJYWszRmEraHFq?=
 =?utf-8?B?djRQeFFEQmVWdGVjdGpUY2p0TitTOS81Y0JKRWY4VTNyZFkwNW4zNDY0NHcv?=
 =?utf-8?B?YTdva2FrZWloRVFBdnpWQTRKajRMVDdmZGwvRmc4Q2tLQmVPUHZmNkFFREUz?=
 =?utf-8?B?SlAxRWRsOS84STMwNm1rZmJoa0NrVFdjczcwWG1NL0k3blRVUlMzOVRDMU9L?=
 =?utf-8?B?WmExaVJEbjlGYTcwdGw3S0pQWVp3aUZiMTZiNzUzQUN6YlhBYnd4VncvQlhj?=
 =?utf-8?B?VzhtaGYzV3ZoTG1WZkhlYkdld05xN3BHMXo3eWJQR1h5empjdlYzdWRvYUha?=
 =?utf-8?B?d0VtRW1ZZ3ZNK21wdU0vUUovbHdQUXpNZFZWbHA5Tmt2VllGWFRDSFRxMkNJ?=
 =?utf-8?B?UGZINXF0b1podnVuWDN2bDlzVmM4M3F0ekg4TFl3SlRMdnQrTWZYOUw0Sy9O?=
 =?utf-8?B?RUcwWGR3OUhDNmFZOGlFYktNVTZMay9RYm0xYlh5Q0crdWt3anN2eEZzeGNo?=
 =?utf-8?B?ZENrdWdHWWcvaFpOV2huRVNGS0hzYkUvVU9RaEVrUjFtbXBLU0UvWForSXhq?=
 =?utf-8?B?alc0eC8vR0FaQmxXU0t5OG1CdktkOFEvcElCSXBqZ2VJRUZJblNLK3VqcXEw?=
 =?utf-8?B?T21JQzlxdE1MZ3hUN0ZOdXVTMmt2SGY1SVVkcjUwL0NMY295YzcxUE1YSVZi?=
 =?utf-8?B?Y3ZuUHNwUzllZC9oYmJocjBlOVhnMVJuRHdTb2pSRHp1Nlk4cWZuWjRVcHYw?=
 =?utf-8?B?b0JJTTZmbzRIbEZqaUF3cDdnQ21CdThHWEExY3pOd2JNckFJdGlLQ0xJNytE?=
 =?utf-8?B?TmJpYkEzMmZFSUxiZjFDUXk2ZEcxdXplbTA2SVBlQXpNdW1tYW41L2JOY0RP?=
 =?utf-8?B?cEZjVThBMXNVejYybjlCTHBVQ0N5dXdBNjNyY1pNaURhVlpGZlRNUFUxWDFY?=
 =?utf-8?B?T1Z1ellOcmlTWFJKQzE5Sndra0c5bDZNbTI0M2ZJZmsvU0VKWWorMHlocUdw?=
 =?utf-8?B?ZzluM2wrOWFYQXBLWTVtMGNGV2JWTWdVTm02Yk1ETkxBOU9MZGV3S3F4bGlp?=
 =?utf-8?B?a1hYa2U2aWdpOXVCZWpSUDZXdlFDbWpoYUJtTHlISmRwSG1LSU9FaGp3VWZO?=
 =?utf-8?B?N1FrVlFsSkhRM254K01TOEV6czJ3dExDV1NtYU0vWTc0bUVoS0xpdDVRV1B1?=
 =?utf-8?B?S1k3RlZISy9ZdS8zc3NtMmsxYWNmejBtQ2F1RHM4NG1TWlhiQ05WOTdIdWk5?=
 =?utf-8?B?c1hadUxMVnV1OWJIbk9XdVRSc3lSSkR4MEVYa1FUVXpyc1d2R05uYmFoM21k?=
 =?utf-8?B?cE5lRkN3VUx6WkNsaG03L2w1NGR4Rld2MzYxLzU2cmN5WmNOd005emxTZng3?=
 =?utf-8?B?NTlJQ29UbWZ3VEZRWGtvazFMUWVyTlB6OWdBNFh5Z1pBQTVLSHUzUXo2U1NV?=
 =?utf-8?B?U0dUbUJ6dWNhc0Q3U0daUG5mUFpIeUVXUmZ5SFdDN0dRQ05PbCtiK2dwWUhk?=
 =?utf-8?B?OWFwUkgwRWFyUTU3MGgxTDdxbXNjWFZBajQ0RjFsRk1HYUZUd3dOc0t6ZmZ1?=
 =?utf-8?B?L0FLWFhGeHR1VHU1VmtEVkt6N1ZyRUV0elplaFNEWG1hNlFPZUVDZFNLb2R1?=
 =?utf-8?B?THYzQW9VRTdkNmtRUDRrbXBMT2h0SzQ4VnhkNzNEN3hDaExQSWwxSjlUamlL?=
 =?utf-8?B?cUU4S3hCR2lWTHArMTdTQTltMG1JR1ZmMkJOMGtYbmF1cHFOQmZwT1pMOVBY?=
 =?utf-8?B?VVR3TmFFVjBHbHF2YzBseWRtejZWclZSSEgyQk9wYlIvYm4raytvRytqQnZv?=
 =?utf-8?B?cjNkMkRhVlhQT3B4SWF2b3FkMzhCdWMvbVRWTUpwcWlFTGUzK1hxNEhUWTla?=
 =?utf-8?B?SVlablVSb2pkcHdXR3F4THhSNHpOdFRJeFZwK0NxNFozUXFnMWE0L3VzVlhH?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f5ef96-fc49-44ec-c252-08de0035791f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:24:40.0657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUZqFKyPZlTF40DwJvPYgWxTqxjVPfQ4edFm13l2LnJTkf/qnMmr6i49UGqCxaMQaRfKpBctpn2YoZxvePM6eB8IIL3EAKM8pYDMcESQ2GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> This reverts commit a0dda25d24e636df5c30a9370464b7cebc709faf.
> 
> Due to change in the VF migration recovery design this code
> is not needed any more.
> 
> v3:
>  - Add commit message (Michal / Lucas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 24 ------------------------
>  drivers/gpu/drm/xe/xe_exec_queue.h |  3 +--
>  drivers/gpu/drm/xe/xe_guc_submit.c | 24 ------------------------
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 --
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  1 -
>  5 files changed, 1 insertion(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 37b2b93b73d6..6bfaca424ca3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1123,27 +1123,3 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  
>  	return err;
>  }
> -
> -/**
> - * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
> - * @q: the &xe_exec_queue struct instance
> - */
> -void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
> -{
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_job *job;
> -
> -	/*
> -	 * This routine is used within VF migration recovery. This means
> -	 * using the lock here introduces a restriction: we cannot wait
> -	 * for any GFX HW response while the lock is taken.
> -	 */
> -	spin_lock(&sched->base.job_list_lock);
> -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> -		if (xe_sched_job_is_error(job))
> -			continue;
> -
> -		q->ring_ops->emit_job(job);
> -	}
> -	spin_unlock(&sched->base.job_list_lock);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 15ec852e7f7e..8821ceb838d0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -92,7 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
>  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
>  
> -void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
> -
>  struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ac0950f55be..16f78376f196 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -845,30 +845,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	return fence;
>  }
>  
> -/**
> - * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
> - * on all queues under a guc.
> - * @guc: the &xe_guc struct instance
> - */
> -void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
> -{
> -	struct xe_exec_queue *q;
> -	unsigned long index;
> -
> -	/*
> -	 * This routine is used within VF migration recovery. This means
> -	 * using the lock here introduces a restriction: we cannot wait
> -	 * for any GFX HW response while the lock is taken.
> -	 */
> -	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> -		if (exec_queue_killed_or_banned_or_wedged(q))
> -			continue;
> -		xe_exec_queue_jobs_ring_restore(q);
> -	}
> -	mutex_unlock(&guc->submission_state.lock);
> -}
> -
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 78c3f07e31a0..5b4a0a6fd818 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -36,8 +36,6 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> -void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
> -
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index d6e2ed9b9bbc..0581b881b628 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -340,7 +340,6 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>  		if (err)
>  			goto out;
> -		xe_guc_jobs_ring_rebase(&gt->uc.guc);
>  		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
>  

