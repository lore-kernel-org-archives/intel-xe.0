Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6BDD41144
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 09:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048989321;
	Thu, 15 Jan 2026 09:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxe3qUBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A389321
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768469254; x=1800005254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=c+vsgnD5G01sN64Xoig1GNmOiU1rmUrYMS+BN8Ml0hc=;
 b=kxe3qUBIlW52WJVwk0z79Q6rFP1MGglRrhxrJt0FAv6dOl0f0zGdoADX
 leAQEOoS1czr4GIV9EuBOe9KH736J4cupBsJ23mjtQa8SelARB02+Xrvw
 VCDU0iFyIeregpRFALMi+L+WDFkJp8N8BWrKASIjvi1P3/UmB/zxyASMg
 4kYFn6cne0xbD0jII3BAYScBM4FiVpaVsh0XrHoS7G3EATnYKD2nizyUP
 r8kiiPQrLNyN08vkEN5kNpv8GPJoF9ZDxLGQ5C0s1RDtDb14vKjEwCWXI
 cAlOA4Z9ZojtCX88Vt+Xs8+pFn10uBbpjSiF4aiXWY7cv9aRFfwK8WFH0 w==;
X-CSE-ConnectionGUID: 7LgnbfQTRZ2aLJKVaoZ1Wg==
X-CSE-MsgGUID: s/WQkwThQEmheLw8dqHYeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80075439"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208,217";a="80075439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:27:34 -0800
X-CSE-ConnectionGUID: n0Yola5PScqXoUiU6+s6Wg==
X-CSE-MsgGUID: a00qR7YQQl2/ZCk8Yb9tPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
 d="scan'208,217";a="204788716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:27:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 01:27:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 01:27:33 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 01:27:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w19+6AbA+Y++9L8Gbpv9sQh84p0PtsQJEw92EY8I8mtevR3uAVectknNm09h0OV+jnTZcX19rrhbKVUrYmFea1W8waiwHFoTYp5lExI6NzE8S1PCr3XTSRBze7FpymR5qBljWY/rEWwn4Y//PVofHNEN8Qf0tH+AGIeG7wf137lLMrT6KU7f3/fejCw9g3ftdwJeWlUaFI6HuJaPqmqLAH0ppWKq0KWc3kFpU9IIO7Ou/fBeJVq81PW+DijONqCqlbXvQW6lU0cTG6tdzCx0I7OV+iqARCrghae1bXaBHTtqqbMHRhnw+axFwjKmW8rIfkORsIjO82ssmia2yFEudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BUHTC9DEvdWgedqocmxuaA0WA+D7IOniUzQFTHASG4=;
 b=qRmF8ttzGMr6zmyc7FxcgfpTzRvr0+fRsm2qC/ynDNXJQ8sIrljMyLbf09CgOOLfYHEVJgDXRje8tcaol0adStDPG+Lqyi+PREDGaxg/x/fi88Oz0HAo3MZc/MP7OKQhE5ZVwEhk/Lcfq1tym5ScBcunKMMa6OtgmjEy8TsyNZMo1X8C1RclL2GyrLNlsh/z1IJ0cXbS91nlcrGwmyXdZMt3hzZdsLMKDwxItQDP4BDUlzyLjStJuHYjhwJaf5jlmLXiPoJfM8YvtBR5tUbkBW+doBKHKRDCRPc48ZN75epzBEY7J3HJNBZXwc34gudn/TTcoWG3GCOFYMp+03KNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:27:30 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 09:27:30 +0000
Content-Type: multipart/alternative;
 boundary="------------a6ts6al21Fo0xbidWlVWwU1O"
Message-ID: <578876ef-3d8c-4eff-8853-32d00b81eafc@intel.com>
Date: Thu, 15 Jan 2026 14:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
 <20260112203521.1014388-5-karthik.poosa@intel.com>
 <aWYAewvdkrS_WSZx@black.igk.intel.com>
 <e0e82ba8-e277-47c0-8003-d07628e5552a@intel.com>
 <aWdGMjPTy3WnoejI@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWdGMjPTy3WnoejI@black.igk.intel.com>
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 5552dc68-e0e2-42b4-b456-08de54184e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFQvQlJLVE44cWgxVENWcU5pYWtLME40Zmg4eTJBU01ud1ZSN1UrL0QwNCtI?=
 =?utf-8?B?ZG02QysrN20yZTZYSFVPVmJHRkFVZCtxcjA5TzN2WlZxQ1dvTWRjcTQweUZQ?=
 =?utf-8?B?ajBHbVpwMkx6VXViRDRiVkI1K1M0WWRtZ2phaWZjcmIvNndHc2FwSzFTSkxk?=
 =?utf-8?B?czh3ZXFRZ0g5R0pFTElWeFdmTXJ3b3lhTnF1dkxOUEN6bVZsQlpLRy9Yd1dN?=
 =?utf-8?B?ZytLV1BTeTJTRW5LUVdoajgyMkpDVGVVU3FSM2ZQM0h4Q2NuZDA5Sll6czdo?=
 =?utf-8?B?dWxvV0haYW1qRVloVXJCb3VKRXFiaDc2SmVhUW8vek1VajdJbGE0UnZuaHd3?=
 =?utf-8?B?cm9NeHRzUWxQNk9NRkxUb0dTWlliSEZzRzhkN0x1YVltMlJvZXg4V2tqOVZX?=
 =?utf-8?B?dU1CaC9lMGU1NysrWVptNXcwMGZaU3JqdFowRzZudGtwTGFBb1ozSXR5ZC9Z?=
 =?utf-8?B?ckxnVHBsUmsydFI5Y1ZSTVdqYWhweElhWUpPUk1rL3dNRXZmTVpmcDBDM1B1?=
 =?utf-8?B?MTdVRDl2WC9ZNmtUNU4vV2UzZk4xaUpWYTNDaUN1YVh6T3N2Y2M1Nmk0bGxE?=
 =?utf-8?B?WFFtQS9saExmSEtBTVR0K3NLTXNoUjlqeUVDYndIekViR0R5ZnV4TWs0RGpT?=
 =?utf-8?B?a0JULzRveDlYSCtvQ1JlWUZRUlhrNS9SWjRTVEp1QVBndmZweGNRckVSY1B6?=
 =?utf-8?B?SkJ0emFYaW1JYTZpaW5TMFliVU5XZHA4Qm5MbUYzU2xrTW56V0M3M1JFN25D?=
 =?utf-8?B?andzT2k1MDBzWEdWVVpEVkJrZStrOG1ZdUNiNzM0aE1pdno0Smg2SDRvWTlu?=
 =?utf-8?B?bWZzZEtEY2dyWTd6enZ4TTgzQXBEQzlZS1kxNVltZ1dQNks4RWxsOGtjYnVZ?=
 =?utf-8?B?Qkl2aW5YaWdGRmtHckNzcFJTNUlYNGZPYVFjUkVuamtvVVhXNklUREVDK1Nt?=
 =?utf-8?B?VW5tUDI2QkxJZ3Vlblc1TkpHaXd3SWFKNU1PZmhjYnNjRzRoZ2R0dk90WW5l?=
 =?utf-8?B?UU5FeVAyM1VoRVJxblc0WkdkNUtqUkY4dytGQm9ZWWNHOUl2OVQyTVdyeHJF?=
 =?utf-8?B?V1lWU2JVQWpHMTRrbCthK2JoakdJMVN4QXVwOE5hV09jT0NwZjgySDNYUGJH?=
 =?utf-8?B?Z1J2czdHMm02TUlmQXdXVk9HdU5SL2ZhdEhVWm82Yk04eVZYdXZkbjY2SW1Z?=
 =?utf-8?B?ZGVKaE8yQTFSbk9SUWtmMXc5UzlSRm1scTBCNHNoa1VJWVVyQXhBN1k1TXhs?=
 =?utf-8?B?aDU0TlpjMGZkanp5Mms4OTVKUEk1ZFA0b2ttdlAwVU9Vejc5YUxqN1RsMSs1?=
 =?utf-8?B?SG5JNXVkQmdVcTBUZGd5R3FrSGFRWVhXWmQwWVZDMisvQnBoWUk0bGhHNjJ1?=
 =?utf-8?B?NFpVS21WeXRVTlBSWHpEbTJWenFxNzd3NjJqRGM0ZUdmYWtoSVZOaXBXbU05?=
 =?utf-8?B?TEduSmVFQUtmMzIxMEZyK093OXN2OWpRbEgwTXN3Ymo2bjRycEdhV0xZMUpK?=
 =?utf-8?B?Y0lhd1E1STBSTzhwRFQ3cDJxYm1oZ3pYZFBjbW5MMlhCSktzc0x2SVdGNXNq?=
 =?utf-8?B?TVlhazhsNW9MVE5mNE9LZzBkZkl3SWttQk1TVjUvZi9xQWhoVzJaOXlXUEEv?=
 =?utf-8?B?WE5YMFI0Y0tjUTFWSTdySEVNenlaNXo1UHk2Zk5YUGRIclZIVHA2MFJCbzVh?=
 =?utf-8?B?bExQTk50QW11Vm1jMHF0UzhGKzBQUEpWQm9kQnJZaVhYQ0ZmVVNQeWZuYStz?=
 =?utf-8?B?TW1XVnVNRTNqcU5XdmdEYXdMMmVlOUd5RHJ2aVFTeDQ5dXY1V1lFNENtakpT?=
 =?utf-8?B?Kzc0elc0UGZmam1rV3FMc2NQbndlUEV4Y3hKd2R4NFhwMjYweDV2OUtHL0Jn?=
 =?utf-8?B?aXVYV1MvLzZDZDUxa1ROQWtaVkpvRThjd2tid3pIV2t0dENFak9wYkJXdzFl?=
 =?utf-8?B?dFp5bmxLNUtGc013VStybHR3RDlqWGVPTnZYRVBBa3lwbytCYTI4M2NsZXF5?=
 =?utf-8?B?RkxiNXJoYjA3QlFDTUk1TkkxZCtJMXNKU0pGQ3pwRk9QeS82QXFFcG1JdVN6?=
 =?utf-8?B?NGdFd0IzTVVtQ3dudkk4OVVQMEtuMm5hbWV4L2J1ZVdCWXA5cXlmSFFDcVgw?=
 =?utf-8?Q?FIbg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V01yQnJlY2pVaDJaRjhGY0YwdExWc2NkY1pleWNJb1E5SEV0WGdZUERTNjdQ?=
 =?utf-8?B?cFc5eEF3V2VTdmRtbUZ2Ni84WHBvcmdFYzczdFV1K2FDWUtWQzZvZWF0RmpM?=
 =?utf-8?B?b1JPZzNFNWp0MWtrOXpkZlpZdkNpRytRQkw2b3lhbzV6OGY5dkswLzUzbUYz?=
 =?utf-8?B?bmFtNkpCcGMzU0NWZ2o3N0JsMnZWbkIyM09KNENVcWFXSUlyVjZSOVF6L3FP?=
 =?utf-8?B?eXY4eW5lN0hzUnJRL1RBczVCcXM5bWx4MHVjcWFwTC82VnpUaVJxdmhXQWFu?=
 =?utf-8?B?QllrSWhUeVBYRERZTVY5WjN1ZWhiWkVXN2Zob3QrUWVZTUVFQmNzdjJRZkR4?=
 =?utf-8?B?R1hNNXNRbytyNUplZDlpdExxbTMxNThUajVlTi9iVnZQUThNcFRyd2tFeFRz?=
 =?utf-8?B?cUdSb1BYZXBLeGRxRm1LZDY0Qk1NTnM4VUczcHd2WG8xRjlnNTBDOTNLM25Y?=
 =?utf-8?B?ZUplTTZQc1hTKzk1TWtGNTI3Wksvb3lHZithbXltUGtlSVJPMGNRbDhuOEFL?=
 =?utf-8?B?cW91Zm51L3FwcUZjcGVGbWxSdTJhVnFBK2M5c00rQklwbzJuQ2c0QjdmM0pX?=
 =?utf-8?B?NDR5aVcrMkpMeW9kQ3N0dDMva003Ly9oU0xYTkQrU3pDV3Voek93NW1waVh5?=
 =?utf-8?B?eWNHK25RVnpUeXpRdUE0Q1ljRzlqRm10c1FUZHpJUXNlcVdXZjZhTkdieTNh?=
 =?utf-8?B?cDVxcXdYUFZ0cUdPYzJxQzJYTWJjM00vaHpoZlRUM0hhVWlEdUZhUHMxVFI0?=
 =?utf-8?B?T2hTSXArZUttMEpsN1MxMmlmZG93R1JpdlJNQWZNWi9mNDBCSFlPZEc0SG5q?=
 =?utf-8?B?eG9CeEJ4T0YvNDkzT0pDMjN4Q2pLUGQyMmJYTFk0and0NHhCbVZCMHFYWklv?=
 =?utf-8?B?TG85aklJWTU2WmlrcW5uNDlaL2M5eFkrWVlQZGtIQmUrdUZMbmVDYVRVb29U?=
 =?utf-8?B?K1ZUaXI3Q1ZHcGwxYXVnNmxjbUZRTzJieW5sQmZaUHpTN21DbHM5MWYyZWsw?=
 =?utf-8?B?TEVxZW5TL0Q3YWVzVmNuUXp4UnkzMzNvZkh1NWtjWExOZERKUytLOFFVVE5y?=
 =?utf-8?B?OVNHL1U2N05NeFFSamN2dTZHNGxDVGU3UVhtSDNzTjg2R2hIQ004aW4vOGwy?=
 =?utf-8?B?MVp4SXVuSXBrQXZVdjJxTzRvQU5tTmNBbzlyVXVrbVdrcnRZa2ZOVmlaekht?=
 =?utf-8?B?ZlNWL0kxbUdCRmdQMHR0dDEvNFBOK3VUdkpJL0oxN3ZPelZJRi9iRmdIRlNF?=
 =?utf-8?B?dnNZdVRZUHdSQitFM3NGL2xtelBYWkM1aUNrV0RyMWgyTERrbVJ3UWdGYm5r?=
 =?utf-8?B?by9pZUlaZHlCd3I0dm1kalhROXNiZW9rOFpEMzZFN2RValhRSzZFSGFwVGpV?=
 =?utf-8?B?UEVIRGZldkZGK2xOa25pL01VQ2MxZ0Q2dFVib2I4Wmh1MWtPLzlaZHBPeGpx?=
 =?utf-8?B?N0RTTDRMTmZXdG51OFB3dUd0M3VRUDRicjVTQzdKd2NBcGRsZTJBdlZKYjht?=
 =?utf-8?B?cVpHSFRsNUJSYncyQ2M2UWQySWhod1VrYXVndndjOEZINlY5bUpMU0EzVzBQ?=
 =?utf-8?B?ajczQTZma0VDWlFkd3hib1JIcFVWei9QMHJ4YmhpRlF2MktwMXZqQnRJMFFT?=
 =?utf-8?B?aDdaemxodzBISlBvQ3VsRHRVZlA1REI4cm52VTNrTUlBWU9zTG92OUNsTEV4?=
 =?utf-8?B?bXZBL2daK3NZeSt2RlNyZlFZR2x0MHlpUjJaeXR2QU5BbGtWY0VpWFE0UHN0?=
 =?utf-8?B?eGNjT2FFcEF4R0o0aU1WQTVHSGxnRTNuZEVBeDhaMHUrKzRyVThWOFNtUjFM?=
 =?utf-8?B?TUxYbkFtQXJsSzFtVlVVa3VyTm1tYlB3OFBqT2l6V0prRXpNRXRXd0FkdkJD?=
 =?utf-8?B?THNCc0ZlMVk0V0dlM29QY0FvQlNzc2o4WGs0Kzh1WE55cGRnTFZkSWc5b1JV?=
 =?utf-8?B?UGV4aGYzbFRGbGk3NDgxaUJlZStBWWRMenBDS3FHcjZiL0kwdXo4VWtwSGZZ?=
 =?utf-8?B?VFN6YWMxb1pYWkxIU3o4Mm1uUTdudkpTbkFpMEhKZFV2NHA1UGxJZG5TbjFY?=
 =?utf-8?B?eHJHNjJaaHNnUXhHL0piM0VHUkRCbTBkL1R3dUU5Ujg4SXJkZE4vMmRNenBa?=
 =?utf-8?B?WkoxRVZtL3RneENIbG9NMEg4cWNicHVHR0Vsb3d3SFUwTWtvRUR4cTJjNWZM?=
 =?utf-8?B?QXFXSHpaM3UrMW5xUXFiR0RRMy9hKzl2c2FzeEU4OTVuaVVwdXhic1VCTVlY?=
 =?utf-8?B?TDdoSzU1Qlhwb2JhaDFWbzhHRmpBUnFpalBEQkJQNFdmTGJPbEdzZU9keTMz?=
 =?utf-8?B?Q0VwY0tobitQOGNHS3NxMVNlNTFVUjFaeHZ6UURVVGJodHJLV285dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5552dc68-e0e2-42b4-b456-08de54184e4f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:27:30.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZiYjwdqU+b02hOqE1dQsYYwhlL+z0t2bdMO92C6IeiOUJrfkiMMjCPpYVLyhhH0G87jdq45OLDejV0nG7S7AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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

--------------a6ts6al21Fo0xbidWlVWwU1O
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 14-01-2026 13:00, Raag Jadav wrote:
> On Tue, Jan 13, 2026 at 03:28:51PM +0530, Poosa, Karthik wrote:
>> On 13-01-2026 13:51, Raag Jadav wrote:
>>> On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
>>>> Expose individual VRAM temperature attributes.
>>>> Update Xe hwmon documentation for this entry.
>>> ...
>>>
>>>> @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>>    				return BMG_PACKAGE_TEMPERATURE;
>>>>    			else if (channel == CHANNEL_VRAM)
>>>>    				return BMG_VRAM_TEMPERATURE;
>>>> +			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
>>> I think this should be
>>>
>>> 	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
>>>
>>> or did I miss something?
>> I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies
>> there, all available channels are seen.
> Sure, but shouldn't we fix the buggy logic?
>
> Raag
I shall address this. We didn’t observe any issue during verification 
because there are no new channels beyond VRAM_N.
I’ll raise a patch for this.
>
>>>> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>>>    		} else if (xe->info.platform == XE_DG2) {
>>>>    			if (channel == CHANNEL_PKG)
>>>>    				return PCU_CR_PACKAGE_TEMPERATURE;
>>> ...
>>>
>>>> @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>>>    			       enum hwmon_sensor_types type,
>>>>    			       u32 attr, int channel, const char **str)
>>>>    {
>>>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>>> +
>>>>    	switch (type) {
>>>>    	case hwmon_temp:
>>>>    		if (channel == CHANNEL_PKG)
>>>> @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>>>    			*str = "mctrl";
>>>>    		else if (channel == CHANNEL_PCIE)
>>>>    			*str = "pcie";
>>>> +		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
>>> Ditto.
>>>
>>> Raag
>>>
>>>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>>>    		return 0;
>>>>    	case hwmon_power:
>>>>    	case hwmon_energy:
>>>> -- 
>>>> 2.25.1
>>>>
--------------a6ts6al21Fo0xbidWlVWwU1O
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-01-2026 13:00, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aWdGMjPTy3WnoejI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Tue, Jan 13, 2026 at 03:28:51PM +0530, Poosa, Karthik wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 13-01-2026 13:51, Raag Jadav wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Expose individual VRAM temperature attributes.
Update Xe hwmon documentation for this entry.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  				return BMG_PACKAGE_TEMPERATURE;
  			else if (channel == CHANNEL_VRAM)
  				return BMG_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I think this should be

	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))

or did I miss something?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I’ve ran IGT hwmon test and lm-sensors and didn't see any discrepancies
there, all available channels are seen.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sure, but shouldn't we fix the buggy logic?

Raag</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
      shall address this. We didn’t observe any issue during
      verification because there are no new channels beyond VRAM_N.&nbsp;</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I’ll
      raise a patch for this.</div>
    <blockquote type="cite" cite="mid:aWdGMjPTy3WnoejI@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
  		} else if (xe-&gt;info.platform == XE_DG2) {
  			if (channel == CHANNEL_PKG)
  				return PCU_CR_PACKAGE_TEMPERATURE;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
  			       enum hwmon_sensor_types type,
  			       u32 attr, int channel, const char **str)
  {
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+
  	switch (type) {
  	case hwmon_temp:
  		if (channel == CHANNEL_PKG)
@@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
  			*str = &quot;mctrl&quot;;
  		else if (channel == CHANNEL_PCIE)
  			*str = &quot;pcie&quot;;
+		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Ditto.

Raag

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+			*str = hwmon-&gt;temp.vram_label[channel - CHANNEL_VRAM_N];
  		return 0;
  	case hwmon_power:
  	case hwmon_energy:
-- 
2.25.1

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------a6ts6al21Fo0xbidWlVWwU1O--
