Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C91C83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 18:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5814410E23D;
	Mon, 30 Jun 2025 18:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5r3+9a5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE1410E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751309563; x=1782845563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PJa7bSkU6ln3mM2+oHUIz+TTf0LfPcwciWuwWrG0gXQ=;
 b=A5r3+9a5u7aHIotZz9ohLk4lXejHaAFkz5byt9lq9JhCZ21DP5N9u18H
 C/auewM30cqPUcJ/z9p0iuhKG+hh78IXDSBNnl7ltW6leDrQPbN3fbukm
 YNuH5mOiIqRe9XJuaifu4IQNx5e3tq8BopuaT4p6k9Jiuksn0hcs2cQVa
 adkk0wEBxs4tkyzge4YvwYt1PIInZAzNshpv5XfGvKom81RF4PQTk9RxJ
 XPACwvVkWasVZKdoTQoZQSzzPEbATfYFG3S5l1ik/AeinfTlMPy2+RWvk
 2Uea6krDnf6VUZtbXDQkrx+ym6nAMguNiICL1oFChrnsccx7lRDJMWJ/5 A==;
X-CSE-ConnectionGUID: E9ncHxQXQ3W8SrnlKQ4Vuw==
X-CSE-MsgGUID: PxvcpLvVQWuAj+/esDuSsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="41173065"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="41173065"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 11:52:43 -0700
X-CSE-ConnectionGUID: A0NeB3aTQXW8n9fZ2IJ7Tw==
X-CSE-MsgGUID: nxSldfJmR6ul+St1oW9Yxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184471626"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 11:52:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 11:52:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 11:52:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 11:52:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+lnVO+KSDIVlITRSux0l5rlOBkMCaYmszjailLcovod2VfG6bBWhfbNtxpHh9qjrQJd5vkV4HdHq9izjMqrtjXnAanAbL9DDFEIsU2UzY2CMkeiJ6/QHD9Xkt5vydOpBTVvPiTPKGv/JbUVM5bLHTq3f8iw1nFtcsURYX/MFJ57KNVE9Qo+gu5kiAgqKbA9eCHEZAaXnyfbfRKc7ibDYzmof2un+sjDvFGJra+rLgDw2s7Vw1/mgI6b3h/WSJI3jcaOVvxv3EomdbW5fC0uRaLtTrPgy6oBRoFJLqbxpf9w0s61ovIPyrbbrrARo2hmTbTzfwLC0OuvlJCS/86ZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl8Ns+Fz7xaUaxFI16ysVN8oRDxm/jXY8TdyUzWJXV4=;
 b=gSZS32Eaayy1JdSwH2DJKEW7vVoWdpaFYS1zKnGDYbftaJQB6k28l7s/1xjXAw8Y641+fOCNmqjRWlmAPnx29hHsDnLLSKxETfg7KdkMT+KHW9ux0p+PJwq9VEepEnu//IGSoqrA5QK7RO2+vQ4QimlL8+T5WkVE1n2nH6FfaTP6bPBAQ7MEd23L70lmfpV1LkHZKsaNz+gGbJomVUxj//2nBwHDqgNTds6kIcIbhp8hRrLcrUDw9Cr0AXEH58rAIJZfCNoa24jPzXB0TCHobsbuQ/Sl9y9hNcTkiNzdgQ1cfKjp9EZW/eKiIvIurwQYzvhGM2GUpk6nH1x5uen4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 18:52:39 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 18:52:37 +0000
Message-ID: <25349b72-a34f-444e-94d3-45f3f52647f1@intel.com>
Date: Mon, 30 Jun 2025 14:52:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Summers, Stuart" <stuart.summers@intel.com>
References: <20250624011735.3976-1-zhanjun.dong@intel.com>
 <4715fb2c-8176-4ace-a56c-e6dfc2da08c6@intel.com>
 <CH0PR11MB54444E1912ABECAA4426CD92E578A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <CH0PR11MB54444E1912ABECAA4426CD92E578A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f9760f-d298-493c-7ec5-08ddb8074852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmpPRHRzWXFvNHRReGFOVmFTWGRrYU5Ta0hvcXN3Umxka0xIZHA4dWZRcllM?=
 =?utf-8?B?MXlUMlZkY25CMnd0WlJjOTNmSVFuV29hWldiUlhPUU8wNU9NUHA3azJhRWx3?=
 =?utf-8?B?QkxINUJ6Vkx5ZU56VWowZmpqNGNWZVZ4d1RKYll1ZDVGNDl5UUlEWVU3N2lk?=
 =?utf-8?B?L045b1B3amk2b2l5RjBrcGY0VU5YLzNVRmNOY00wdjRkVFpxR1BkUTlmQmdQ?=
 =?utf-8?B?NkNkQXlWM0NtZzNXUEVidlhJd0tXRzgvSWxjNkl4aTFYdGQxd1ZNTFBsT2hl?=
 =?utf-8?B?bGRPOEgyMHNoTkFMb3I5a210bUxidkQzTStCYVRRbWhQOWVMeHdER0pyUEFE?=
 =?utf-8?B?ZzFNdGJaSDZiakpMSnRXQnZXc04wOFNzUlZSR08zRGFwdlhUZHFmcGIrMDds?=
 =?utf-8?B?a2V6OUhrVXhRYy93QXpvNTE4bUkzVmJLVDJYazNwSy8wQUdRbFA4aTArQXZ0?=
 =?utf-8?B?clBxeE9ZL2FmaWFxQ3ZSTWJRQzdOKzAwT0xrTWdkVkZqT1NjTVpxdng4Y3M0?=
 =?utf-8?B?L2VEc0FUWWZnS3VlYVhUeVhrZXNLNmxzK2pnN05vOENCOGZWc2ZTanZ4dVpq?=
 =?utf-8?B?MmZKNFZKakwzQ3NwYXBFckxqZzkvNzB1aGQwc3pIUUF1VEF0d09tdk12SHdm?=
 =?utf-8?B?MndvTXVNYlFib3V3MG5WMDdEUDBaTG83UkRrd1ZvOEU1cUZIZ0MyMHA2N3FI?=
 =?utf-8?B?RHIvdDQxdGsvNW1lbFNTTDcvZTkwTzNnVWRJa1E1MVp1UVQ4VDZCcnlJdmkw?=
 =?utf-8?B?K2Yyekl4Y1ozeVk1aUNzeDhFdzZTYUxVcmZhejBHU1VQMVdnTm1vTk1uUnIw?=
 =?utf-8?B?RER0b0kwL01pVUpSV25VMFYyU1h4SUxNOEwxc2UrLzQ2SG9Kb2syK0F0V3NL?=
 =?utf-8?B?NEVaalFrZEhIVzZCRTU2c2JsMkhjaGUxTURYaXZVMTRQellUYkE1YlRjZFdB?=
 =?utf-8?B?OE90c1JGSzhxbG1XekFaK0dLOTJTRFpSZUNnaWZhTDhCMitCRWJZSlBZeDhG?=
 =?utf-8?B?dDVkZFdkMWhaY1pRSDI5Q3pyQ0VtTjN4My9mei9sekd1YUpsaWdiUjZ0U1l1?=
 =?utf-8?B?Nk5DUkszZFgrMGlJRW1jT3lUNVEzWWZWcjFQRWFDZUdOYWlIbm5VendVRE1u?=
 =?utf-8?B?SzNaaEhvVHVLdnZSY2ZPVUh1aWVJTmlqZHZHR3pCRlA0MktzclpDSHlFQkY0?=
 =?utf-8?B?bnlLblgyazUyZUp2eFo2cmU5azN3U2VJTDI5NUpDQUp0ZUZjcUI3U1FuSHBo?=
 =?utf-8?B?N1dYVWpuTnB3ZUo5UDhpRTBFR3pCdFZlQ2ZvaFVNT29rTlpqTWFydzlWNTlV?=
 =?utf-8?B?bStTYWttVlZpVUpJQWNiK1poTncyaGxRQ2N5WHFPemE5UTlKK3RxSVFiRUlS?=
 =?utf-8?B?MHVhR3h1V1ZNdlBWNGVGUi8yeXJGZ2JGcXhKTzFxTDE4Z1Rlb0Y0YWVKaU9D?=
 =?utf-8?B?NnQ4VFhleTdjRUFjbHRtM0d6ZVAzYWQvTTlNaGFRUXk1akI1L1RkTXNjbjlT?=
 =?utf-8?B?UGNPUnE0ZTlZUXBaVWc5WlNDRnNBa2pVOHFET0VsZEw4R3dESGp3bkNxVW0w?=
 =?utf-8?B?YnhvdVVjUVpnMnA0Qm0zTU9DNWZaZ3RqWkl5Sis3N0lRWitRanNNamJRZkc3?=
 =?utf-8?B?MGFmUzQ4ZVQrb3dqUEpkWnNpejZGYzlDWTNvdVBwMXhHUkZBMnlTY0toNFgr?=
 =?utf-8?B?NDg1QlMzWHVCWFUzZGhyQXoraFJ2M1czK25jU1BucE1YYkFJdTExNElaVGFT?=
 =?utf-8?B?SDMzczFiTDRpWUhSbG1OSnpYZGdIUzEvUXg4Y1RjcU5VWk9OeVJNdWppTEFQ?=
 =?utf-8?Q?3vVgZlZGJ4InxVRrrTNaSIh7ocHimGAm5PSqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVHbW1RVk5pWlQvd2UrcGRyVDFtRDJGbEZUVmhheDl2YzJtMzNuNzd1UjI1?=
 =?utf-8?B?YWIzZDBpN3RPM1JGMGtlcXpheEhTZTV0bUJjYnNLNk1TT0JsMjh0SWQ4REtK?=
 =?utf-8?B?ajlDUzBDTTFUOG9CQVlxcFhNcFRQMHpSMHdMcm9FZkl0RWhJTitxazAyOUYx?=
 =?utf-8?B?SWdkbTZEQm9MRStwMThaNDRjcDZMWEp5ZDUwa3NIOFRid1haYzNRWWw5d2JD?=
 =?utf-8?B?N0ZlUlBaaXBWRFNUNGIyVlpYWVZQSlNaZ0QybWp5MUhGcCtVcndDdXB6UDhy?=
 =?utf-8?B?Nk5hYlQ0S3dkaXJMOTZPajA5NUVobmNxQ0svMVViN0VUbGNsQW00clZvU3FF?=
 =?utf-8?B?c2lhN3NKa25LVGdYeGJKRTNacEJDT2VGMkkrL2grYVVMTmFzaWxGTVVRYnZi?=
 =?utf-8?B?cmZYV25aVlVuWk1MZ1V3a1dpMEpPeVBkSDV4M09JNDhGUW05bVBkaEtudjB0?=
 =?utf-8?B?eGVUVC9YR2t5T3Y5MjM5Y3BHYnlCRVg1YUpUNngvRklwbDI1MUtDYlgyWExD?=
 =?utf-8?B?czFiblk2WCtCdkx2b085bUk4bitEUEk2VUg3S3RvVFFiMHViZkVGSkxvS1dH?=
 =?utf-8?B?R0llQksrUkl2TjVDdjgya05ubkJXUTJRdXAxT282OWZ2UVJKV0RrR09WWXRj?=
 =?utf-8?B?ZkpFQmo0dS9nRDNuSE0zamREaERyZDhaMG9VdXlJMk16K1VFRTcwbTB0YWFl?=
 =?utf-8?B?bVoycnlwNTFUcmhXempUOVNheTFVclBpRllFOERwYWxiMy9wRWRndUF5M3p0?=
 =?utf-8?B?ajBZOXZjYy9FcnR6QmdPOGNDWkUySjE4QzVXMHRYTjc0WjlJNDB0NnhpbHRi?=
 =?utf-8?B?NEYzQjE2TXJ0YmJKb0RSRTEzRHRKNkc1azYwUkZ1WUlRYTVIQ09IY05sRllM?=
 =?utf-8?B?b25QTkFxY3U0UkJEc1BySkxqMENBaFVVRUR4dGJnZDVuQWlDRCtJdUJsV3NL?=
 =?utf-8?B?UTZ6MnFSb2tkY3pILzBGWFFGSTJwc0V1Mk12Q3A5czZRR1IxYStkcVBrTXdO?=
 =?utf-8?B?L0treHdOdlBGajhhRUQwUUxSb3RFNmE0eHNrazZnVXRyeWxaR3luRW9GSkhK?=
 =?utf-8?B?ekRvUTZhRlJRcTA0akZ4My9uN2R1Ty9OUlh0LzEyVURJTTNmcDNYdmRyQVNG?=
 =?utf-8?B?THc2dW1JMXE5TTVQaW5xVUFUYng3QTNybzROWXJScFZjcitSTFVNWWlKTmJt?=
 =?utf-8?B?TStHTHBKMURvUzNmZkJlY1hSbXdtRU5VWnBmTlNDNEQxOTZIcXpTbGVnUkRE?=
 =?utf-8?B?a3h5RkdPUVE5TkJFcjZFdU1SZHkvNzJmblpRZjV0UXZJVTVFd2dxVEdwU3BD?=
 =?utf-8?B?UExIZlNFdlVSTFV2OUJIQ1BmWUE3b3NZektjMlQ1UDFxQ1o4Z0FzTmNWRnpm?=
 =?utf-8?B?NWxwbysya1lnalYwVjFzdlZ4U2JxZGN3bElzSExDTWdBWTd1Y0J2WVVzS20z?=
 =?utf-8?B?RVBWbkhNbjJxTDVDSUNEUVMwMFdsNkZ2SVlwdTFTY3I1cVI1ZThLNE9ycGFs?=
 =?utf-8?B?L3hQUnN2UlBHekIrV2MvZTZVQmxsWFU3ZlVhZDZyRHRRZVRPUU5uZVY0NCtS?=
 =?utf-8?B?NlhMWHdQZWJ5U3ZxVGFZbUdKTmN0NG5YaFV4ZGQwY2dmQ1lPeW1VWTdpMEZU?=
 =?utf-8?B?aENSZFBWbTc0NHZkTW5vbnk0UndER0cvRlI2K1hwUUxablNCejhTalYvS2d5?=
 =?utf-8?B?Wi94N2UySisvQUtRak5kYm1FalRiOXhJZzNkWmVSOHltS0Y0cWgyTTRCbXc1?=
 =?utf-8?B?WnYwUDk1YU4ySXhIY3dlbi9GS3BWMjFYT2VKQ3RXc1lkM0dwZ3JHSWZKVmQv?=
 =?utf-8?B?emlES1IwYjgzbnpuTFhqbjcxZnQ1OXRnNXNaWUx5UHE1RWVQTWxlRjhoaTZI?=
 =?utf-8?B?SXVFem1rWldiY2JTMmlBenpWQVRQZng2OEFvUzgyb0J5U09yeng2UmU3QVJ6?=
 =?utf-8?B?Wkg5MytzbHkvQ3FIdTVtMmg5a2JwZ2VJT1J5Q1lia0tPQ1A0SUtXL1paa3Bn?=
 =?utf-8?B?VGtFcU04Z1ZGczF1Ti9EdU5IZmlFeDVtZ2MvQ0FIbG9WWUlnT0tHMVMyclJ0?=
 =?utf-8?B?QzRIVkRZVGlSTWJCT2k3UWRuRmwyMVMwdk9BOXhuRFpXWXZHRGxpV2hQNFBk?=
 =?utf-8?B?cWwvbVZxNTlvL3N4QUhZOHlLR3lYZC81VTdFQTNkM0xFcUVGMW95M29KOEJM?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f9760f-d298-493c-7ec5-08ddb8074852
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 18:52:37.7753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBRgKcSbXLDlMhuWFag/y1wX1BWce6RrQKdAy/fDVt+dV4u7rDtJCv7V6LMlxhcmY+bvfM4/N/kAvtsKFKiEdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7854
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-06-24 6:17 p.m., Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Sent: Tuesday, June 24, 2025 1:15 PM
> To: Dong, Zhanjun <zhanjun.dong@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware initialization error.
>>
>> On 24.06.2025 03:17, Zhanjun Dong wrote:
>>> Disable GuC communication on Xe micro controller hardware initialization
>>> error.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
>>>
>>> ---
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Stuart Summers <stuart.summers@intel.com>
>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>
>>> Change list:
>>> v6: Skip disable ct on xe_guc_enable_communication error
>>> v5: Set wedge is excessive action, revert back to disable ct
>>> v4: Fix typo and add new line
>>> v3: v2 CI re-run
>>> v2: Remove unnecessary jump to err-out
>>>      Drop disable ct, switch to set wedge
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c |  5 +++++
>>>   drivers/gpu/drm/xe/xe_guc.h |  1 +
>>>   drivers/gpu/drm/xe/xe_uc.c  | 19 ++++++++++++++-----
>>>   3 files changed, 20 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 209e5d53c290..9d7175b16cc7 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -1230,6 +1230,11 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>>   	return 0;
>>>   }
>>>   
>>
>> each new public function needs to have a proper kernel-doc
Will add in next rev.

>>
>>> +void xe_guc_disable_communication(struct xe_guc *guc)
>>> +{
>>> +	xe_guc_ct_disable(&guc->ct);
>>> +}
>>> +
>>>   int xe_guc_suspend(struct xe_guc *guc)
>>>   {
>>>   	struct xe_gt *gt = guc_to_gt(guc);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 58338be44558..285c19929f8c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>>   int xe_guc_upload(struct xe_guc *guc);
>>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>>   int xe_guc_enable_communication(struct xe_guc *guc);
>>> +void xe_guc_disable_communication(struct xe_guc *guc);
>>>   int xe_guc_suspend(struct xe_guc *guc);
>>>   void xe_guc_notify(struct xe_guc *guc);
>>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index 3a8751a8b92d..d74bfc7a85d1 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -13,6 +13,7 @@
>>>   #include "xe_gt_printk.h"
>>>   #include "xe_gt_sriov_vf.h"
>>>   #include "xe_guc.h"
>>> +#include "xe_guc_ct.h"
>>>   #include "xe_guc_pc.h"
>>>   #include "xe_guc_engine_activity.h"
>>>   #include "xe_huc.h"
>>> @@ -161,15 +162,19 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>>   
>>>   	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>>>   	if (err)
>>> -		return err;
>>> +		goto err_out;
>>>   
>>>   	uc->guc.submission_state.enabled = true;
>>>   
>>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>>   	if (err)
>>> -		return err;
>>> +		goto err_out;
>>>   
>>>   	return 0;
>>> +
>>> +err_out:
>>> +	xe_guc_disable_communication(&uc->guc);
>>> +	return err;
>>>   }
>>>   
>>>   /*
>>> @@ -201,15 +206,15 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>>   
>>>   	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>>   	if (ret)
>>> -		return ret;
>>> +		goto err_out;
>>>   
>>>   	ret = xe_guc_post_load_init(&uc->guc);
>>>   	if (ret)
>>> -		return ret;
>>> +		goto err_out;
>>>   
>>>   	ret = xe_guc_pc_start(&uc->guc.pc);
>>>   	if (ret)
>>> -		return ret;
>>> +		goto err_out;
>>>   
>>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>>   
>>> @@ -221,6 +226,10 @@ int xe_uc_init_hw(struct xe_uc *uc)
>>>   	xe_gsc_load_start(&uc->gsc);
>>>   
>>>   	return 0;
>>> +
>>> +err_out:
>>> +	xe_guc_disable_communication(&uc->guc);
>>> +	return ret;
>>>   }
>>>   
>>>   int xe_uc_fini_hw(struct xe_uc *uc)
>>
>> what about doing similar cleanup in xe_guc_min_load_for_hwconfig() where
>> we also have unbalanced xe_guc_enable_communication() ?
>>
> 
> I don't think it's necessary there, as xe_guc_enable_communication is the last function run in
> xe_guc_min_load_for_hwconfig.
> If it fails, then the GuC CT was never enabled, so it doesn't need to be disabled.  And if it succeeds,
> then I think the rest of the Xe micro controller hardware initialization will have succeeded as well,
> making it unnecessary to disable the GuC CT afterwards as that component at least should be
> functioning properly.
> Though, maybe we need it added to vf_guc_min_load_for_hwconfig?
> -Jonathan Cavitt

Thanks Jonathan for detailed analysis, I agree it is not neceesary in 
xe_guc_min_load_for_hwconfig.

