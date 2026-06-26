Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B667C43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 20:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65E10E261;
	Fri, 26 Jun 2026 20:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqQQygzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4E110E261
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782504050; x=1814040050;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WjnCudTxN72YwywZrqiQvhCATAe71/y1skzaLuEvtyo=;
 b=nqQQygzVJVRj1VjC8/iAPt4R6UtixBAtXtGpKkWQrM0S+f3hNhOcA52I
 RIMD59grWZS4XMhIDjNEsJofyq6ZoTX8aqUPnnEUKCYYyIeqVpz5Kvo0y
 7Gt1DPVrr1CoYrRBNbN6tB2dfsKgaIZQ9rM+MjuadgdQtX5yfjwYTLf3o
 /u0BTaZfdBG4hIPLGmqJo+F5RIW3UnhF6qnRI5O0VKwF7TE4ASuAIiXSL
 lD8xwzGyG6Abl8ofTmL2nVfSvFEBvgz9jz/of7LyY3LdrgMoRTynSuKpx
 mmUiNLesiM4K3SkPkkhNOHIDv6qpab/exmC1dcdo25KGCuLlFWdrcZOPn g==;
X-CSE-ConnectionGUID: VIYv3yEhSKWaklLvSdhtbQ==
X-CSE-MsgGUID: 06Z4ep1sTOiHOuqC/etbcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="93653795"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="93653795"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 13:00:50 -0700
X-CSE-ConnectionGUID: 7R03dyXMRgKWDa3ee/LfvA==
X-CSE-MsgGUID: 0nxRPb8rSeOe1H3Pu2Srrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; d="scan'208";a="246938804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 13:00:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 13:00:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 13:00:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 13:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTx4ppXAftogO/V48Fpsj78EbncfA/WD9fHTxpVVWhYESwlDvVMxhyg2PZBcm2MoPmlQKR9uAS9CtJ5QJUYg8Vv962ahpEqkVhWhHUmwIY6/Fg+F/NM+4tjDjuvfYwOfTv+V+s+AGnSQXETiGnbCRkLYyCtVA2wz5eZjXxesWtvltU40C8j3rLh1qKGAPW2+5BQwjDQkWfaxPY5m4nMoPw9YCRW595ZWX59nbfS+7qNooqRjJy+9+t3JhmYFvu4dZV5HscbQ/rnjxWWrueqEgW55xrMkqbC/2PehgCXQi0MnvxxkdMA9aZYvCTsVRjq2IQIBL8KU/vMG7nmMFdGh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trYiblVYqg6Mwy/1DHw7EhPI+PTHJYmtqQqshYpTeFE=;
 b=iHDyHWLSF7jaIGG+nfUz6JXjKVKiEunobem8LPnaCIKvkp1ADlEQEgOtu+3aK9gCgIJsEfmJXU3ebGdKWWAMkNRuK4RtzN7DcPB+SoEtg1YJW6k9ASJCE4OgZZG+gSIsI1Hpk0r/4A+VWwskpR/ynuSs4mv9W3eU/GkyONmzJm8y/UA3qi0HYD8kV4rKR5pnxqd05DuviVy3xXpbdHwxufpFnjEnSq1sDwCiil6tfjcYEccgWdHs7J5z0pJjdCY77glm5tvFKTTv8/DH3liR2L2riKz42e+iAQo6XC+9ccjhVg8Dd8Md5NITlW1o2HngqmYyyKZpRinaIzk7iREr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SA1PR11MB9825.namprd11.prod.outlook.com
 (2603:10b6:806:4d7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 20:00:47 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 20:00:47 +0000
Message-ID: <daad4624-1958-414f-9a60-5d6408f7cdc3@intel.com>
Date: Fri, 26 Jun 2026 13:00:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/hw_engine: Fix double-free of managed BO in
 error path
To: <intel-xe@lists.freedesktop.org>
References: <20260417161901.3416021-1-shuicheng.lin@intel.com>
 <20260417161901.3416021-3-shuicheng.lin@intel.com>
 <8c188c17-04fc-4b4a-9f3b-613004678b2e@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <8c188c17-04fc-4b4a-9f3b-613004678b2e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SA1PR11MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d7fa37-05b1-43a2-76cd-08ded3bd9d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uXSBHP0LHbNGVziQRlEDnJtZZd+pVEW4euYqNpCQMInXd68CHMi3aqvEOpeOV0OfRBPeqy9m49JX53cXy4iXIqxeckF6tNnBVEpwZGSk47KD/vKxp0XgSF4dCJUat/V893C0kAaEaJ4hTwk+QQynGxFCfea447iUweFYTCXBAfxOquMp1Af9CdBDywsRAvHS390bZI8cakn1riGa3aUPr+WU4IMLrnWYDETm+7CZpFmC0FEG+w5T5dfe0mtmBCKLuFl1z4B5/0HyqfTBJU1pyapLltPt9RcuGvAw2zSTvf4ZhsP/DG/F4iuC1uXvrflnji33HnymKYUm11cr0g2LWvjH7StU1MiBXGTSx9AS8nl2Xk4aQPMMqcCAURN59rl9TljMpSXdS485oJwRRXOKU4Oniz+aRNIbfFykwbaSQ3sL2anTriVppiVSKpTkvyGcrdGtLANCo3OvljrBOnRIe4d+YJosJjw52OiFuXUi8ortYK33e9QZkhLc8baVnIvQB1udRdkg3C2PqSHjWc87o6Y7wMj3KA78YTicl7WtpU9GkAQeYuMZrcVGl9pZqvYheH1XS7DMzyyLHM8hm51ndCGLtimh19KDeRkAXtb/joNTJwxJc4paaDTyCn05yeg/A1Fhue7OjSwIlxdXva9h8lQqMjwahZAdk6rEn9fKI7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFVdG9BTFhoZzJ3cFpwSjlRVXRTRXZEcTJLZnlicWJNcDcyakZKTkhWano1?=
 =?utf-8?B?all0TWxqQnRjRVRFeUlNMzNraTdNWlR1aDBNb1lxbEd0dzZyaWhjWG1YMGls?=
 =?utf-8?B?NDBtbWdCdG9Tc0VzSHp1eVdpazBvOWtVUDJnVVRDelN4OVVHdzlsZDc0STdI?=
 =?utf-8?B?NXBIbHFFN3RTQ1BZSy9ibzliNlcvVGpQNGtuNmFMTEYrQ1JvUlZDU0NRU0tw?=
 =?utf-8?B?cXJOOU4weHFicEJZSGlMMXk1V093K1JCeUF2LzNpaTJ2anhkZjdSUm4vTzA4?=
 =?utf-8?B?TXNwTG52MTd6MTR4czBwbTlibDRIR0g3QkFSQkNVS1oyQS92V2VKVjlIeWlx?=
 =?utf-8?B?NGRZRE8rVHFRUlB1eWNtczJudUFQOWZWalhkYVJXMGlpM00rQ1IwS21VWCtM?=
 =?utf-8?B?KzZ3c1VPREMzUTVsR3BkTDJtUXQ1NXFpU01SYzZhZVBTa1h0cWU2eVRuMEx0?=
 =?utf-8?B?TnhFaElkK1o3K2V0K093dTFpcGQ2OWY2amdmZ21PQlVaTXJYMVg2K1QzZ3Vr?=
 =?utf-8?B?TDhxeGhXN2JZUG9xZnlza1VkUFRmS2pBTGVKVE5tTjIxR3NnaFpwTERaSnY0?=
 =?utf-8?B?bENoMjVPWVk0M3d2cUVtZjhkR0ZIeXhwSVd1Qi9oZ2tWL2ZHUmtwWUdLUXJr?=
 =?utf-8?B?ZERrenJodml4TWVaRGtQSUQwZUgvcFR5bUJUeERWMmFtbjhBdjNydW5mS2F2?=
 =?utf-8?B?eDBUbUF0UVVPZWZXWXRBWGV3OTRVZWl6TzJjbk41OERtdnk1QWRnM2pUR3Uy?=
 =?utf-8?B?cHh3UmtwNXFuTGE1bGRYeU8raDhCUTBZS0NvMFJTUVhjUkwzbmVUVnZ4ZjBo?=
 =?utf-8?B?RFZ0anlsM28xZno2ajRwMWlab1o3b3JRZEtLQ0VvWlZQMGVnNnBqKzRWaGdl?=
 =?utf-8?B?MjRZZjBQS1ViZk80R1BpZlhiUFBnRmVtRUdHa1Q1czNQNmoxM2J5eHl0UEhI?=
 =?utf-8?B?ZFlOMEJxSEhQdE1kQS81TjV4ZHdqMWYrZHNJTk1LYWhDYk0xUDRiRHgwR0N4?=
 =?utf-8?B?SVlJRTRKZFRnME9pUXZkVXhkRkowazJZRmN5ZVhmUGJ5bXdCd3FIN1hic2VW?=
 =?utf-8?B?Z2VyRi9pNDVhMENCeWNIdkhZZWNXcG0wRHVLKzNjMzNQTDZnZUVOcFB0OGJU?=
 =?utf-8?B?WnpZcUY0YmkybTY2NWpCRG92Slorc2R2dlYyU1Axa0xtMG1PNG5OZk11dDBB?=
 =?utf-8?B?SmpsQ2NOcUZXNkgxdEoyeEswc005MVRiRVVCM1pna1dwMXZCSHlhWDRPb0xk?=
 =?utf-8?B?cDNYQ1RPOWF6bW5KVkJ4aWR2MzI4SE9qNHpkdzFxd3VYbTRxMjRIQmRNQWVU?=
 =?utf-8?B?RkxKcUpGYnl5T0F0VEcrWnp4dWJZalFhUFZBN05UQmhGN0xOK0xWTU1Wb09y?=
 =?utf-8?B?MnIvUFg3NjFydnc3dE5WQUxydlE3eVR5YW1vZ3ltREhoM2NRTmQ3Yi9pS1U1?=
 =?utf-8?B?NEQ4c0ZBY01ycE5EQnZNZHc4RUZtRVBTVXQ0MGMzWTZpWVZvOUxrY0g0M3Rt?=
 =?utf-8?B?SWNDSUxoV2VQaG1lVUYrT2FpQ1pmOHFCNUJCQkhTaEFJd1ZjTXZ0d1NJNVNW?=
 =?utf-8?B?SzVYOTVlQUxUeWQycjlkOEdZNFd2RFU4WnFhdE1jOW1xbUtta2JYVDdsNUJa?=
 =?utf-8?B?MW0wYmtMQzRIQXIwRHVWQStzUHNXMlZDRVhQd0F1KzJBL0pLeVQ5d0lvOHIw?=
 =?utf-8?B?SlBlZmVGeklPR2RWR0o0ZXdQMWVNaFBhRXlGRkVteVM5aVcxSkptb1BKOHJE?=
 =?utf-8?B?aGVmSFhLcXZGY3JOZDh4K2dJZy9wTVQra2VhZnBkQm5LSGJDcTVqZFRjVWRh?=
 =?utf-8?B?RHRwUVNsblhqY1NEMmovV2ovalZYNC9uSzM5djZNWHNLT0w0N2xob2Zja0JF?=
 =?utf-8?B?bXlQYmpKTkNnR1ZodzFHb0xOclhpWXNpS2RNeTdWQ2RrTUZKem5TUERjUXJ1?=
 =?utf-8?B?eHVOd0JmNmRmZzhUYzJONDZxTW9PRTdnSmxCZFVoVlU5TzZJMVVoZXMrYWJ3?=
 =?utf-8?B?Wmh6SXlSRC9GOCsybDBtenpMVE1YczlUajZ0TEd4RDExTTlvb1VPZUxhaGtR?=
 =?utf-8?B?NzIxTk9saFdrZUtERm5US041SkRuaUtGb1ZCbWtFOWF1WTAzcE44TVpuNGZa?=
 =?utf-8?B?RmVXbWUxbk5IRHpPcTZBUXUvSnRZN1JxRlFibHZ3RGF2ZTViY2ZNVExuYmp4?=
 =?utf-8?B?bGtJS3NVcTNyVVY2VThtellZZDRxc2QxWi92clF5Um0vazJEVHBGVDVobzJS?=
 =?utf-8?B?OE9HL0ZDcVNhc2dqazB6S1dzam1GalhJSzNHQW5zeHk1SlNiUGp2Sm5CT3Uy?=
 =?utf-8?B?K0pPMENhdDZJbDBjZUNIMjdxU3RBVUlTRHJvWW42VWRDWWFiWkhNQT09?=
X-Exchange-RoutingPolicyChecked: C4EbyMO5qVq5Mn4MXTKBoknt3VWNb/9nh3m8wRiZ7uGSo/TV8A2Kf8/+bq/tdTfAuQ7mxrIEvgJqlltX2rP53fduZw3Sscpu0y9KvEU8S4+yCAwsMysi49miZZ9j//8Ceena1WENuY2GTZBm1xGFDqAN1PrWgx/MBVhPTM0eS7N5sM5bk4R0626G/bJ8qj+EwZg7bNRs9XpJYeTQk00F+XaJT/rLR0vnA9/YjX008I/8ekvOKFQgtUWs3mZ6gSc3850yRn8Gzg2qebU9BkUtGSHsHGD6ZWEeIrWsT0KFFC0SpQxBPNDvyifCIIj95Fne561hMxfzc8xa9wOj/drmcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d7fa37-05b1-43a2-76cd-08ded3bd9d21
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 20:00:47.3285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35Xh1JpCvs0WFMGV8Y4XoDj98tiPmqIzmqRu30UB2/rwsg67p1jDayNuYjlltzEAyvu/iizdYGO5wE5SBVO52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9825
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


On 6/26/2026 10:34 AM, Bai, Zongyao wrote:
>
> On 4/17/2026 9:19 AM, Shuicheng Lin wrote:
>> The error path in hw_engine_init() explicitly frees a BO allocated
>> with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
>> Since the managed BO already has a devm cleanup action registered,
>> this causes a double-free when devm unwinds during probe failure.
>>
>> Remove the explicit free and let devm handle it, consistent with
>> all other xe_managed_bo_create_pin_map() callers.
>>
>> Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO 
>> create")
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 2f9c1c063f16..b69e6c9e534e 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -629,7 +629,7 @@ static int hw_engine_init(struct xe_gt *gt, 
>> struct xe_hw_engine *hwe,
>>           hwe->exl_port = xe_execlist_port_create(xe, hwe);
>>           if (IS_ERR(hwe->exl_port)) {
>>               err = PTR_ERR(hwe->exl_port);
>> -            goto err_hwsp;
>> +            goto err_name;
>>           }
>>       } else {
>>           /* GSCCS has a special interrupt for reset */
>> @@ -649,8 +649,6 @@ static int hw_engine_init(struct xe_gt *gt, 
>> struct xe_hw_engine *hwe,
>>         return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, 
>> hwe);
>>   -err_hwsp:
>> -    xe_bo_unpin_map_no_vm(hwe->hwsp);
> Shall we keep err_hwsp?

My bad, the patch is correct here.

LGTM

Reviewed-by: Zongyao Bai <zongyao.bai@intel.com>

>>   err_name:
>>       hwe->name = NULL;
