Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D983C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 18:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1CE10E0A8;
	Thu, 13 Jun 2024 18:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsP30Imk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0510E0A8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718302701; x=1749838701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ChvVNZXQZZK758ds6Ha3DL8tEg9RVlffCzVzBGPvxEk=;
 b=GsP30Imk4r+HnBrX9yzbl4qU5SrWquJ0uHgQgCy0ACvgYcy+Idk/2SQJ
 o5oKbXvJfUXXSELgTtnUd+zGZmv2AqKK357JYnOFUSuL6CQBX7Uu7a+PE
 A9ZUV5TlpjY6jd+oTQWBcN+A6l7C4ntDCKAOJIIud8fleDdqvmBTxEVKs
 aHblrhmYCKW6dJWCsYrjmQojdcawF3ZrIN51zG5fnMX555q8Fgg2Y5ze9
 mMGNfq1tJQoUwpDSqwyw0t0m9pxGB0HqobO14q5nZMEbnzrbw1kzveG1X
 y8U9EixcyvobCbZcgBEo7T3iNo6RO6XYqokj6Qs+ygVas4tFMFAAC7N5S A==;
X-CSE-ConnectionGUID: EX0t9DXkTWK89paiu/lEdg==
X-CSE-MsgGUID: NHjJ9lDTQ1O/9Kn0jpMYqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18078921"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="18078921"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 11:18:19 -0700
X-CSE-ConnectionGUID: r7PtgzwdQG+gzZ2zRo+NsQ==
X-CSE-MsgGUID: j9R8NJfcSeaLEoX2uS9u2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40163398"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 11:18:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 11:18:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 11:18:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 11:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiG1Ev8am7YdX9EYODMN+Mqu/Woo/ulo7B0je6ZoSgDMW5fPItqJuGu7ExQ/KonpotrOsmI8JczQdPjD06pg3UGyIfHBllXoxTNo7rNddALylr00bGcVYwzmO4pnhbGANd0P1xB9j7T6KXcLX6ouri07CuuUxO4z1L6bVfLg9Kw287hPO21rEnJB3zGK5vAGIj8Kd9uSnlF5RsDbrLtZ1IHdpGHaE3RIURySAKfKMWb3FNyTn2eGpCbkAhzlQsSlsuwNkOeDCX9X0f1qneeZW65/H6KWKOzKZiPuj5fQAEHfn0znd0v4RF62ZrZuBngX4vKD1njzbK4yuz8etyvQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGN/G+PAlMQSAKozWDPSFu7KUO8stnQbUd+g31eC5aE=;
 b=MLZSbR8lcaTISCICOgXC07nEYPNVRFm1jCK5qbfPcj9A/HR961tHCBDAOdFe/ah4aBs0R60b8O2odEcx/7SNSfP+5exjPJd9hghCXVXsVKdPc9t07e3b3LQRsrVKREDT88IgCqF1eLAO72CWM5dzym54tcOGhdxNu7MqB4u3C/Vj4tYhZwjCNPbsI3N5IedVL9kXMktDyySjeRRbl+wIVrBh+KG45IDnt4Nh2aRS17tRuxIU088FjyHaHdu/LDnebqnzyZEtAFWJsXTNjHhU+yUT8cFpdEei1ALqZWF1CHI/ac1BYkTMAjGAUiyX+18OuHRgP65L0uut+6gK2FhbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 18:18:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 18:18:15 +0000
Message-ID: <224b2a7c-8f1c-43ae-a5a9-a5fb0846cdfa@intel.com>
Date: Thu, 13 Jun 2024 11:18:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe: Add xe_gt_clock_interval_to_ms helper
To: Jani Nikula <jani.nikula@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20240611160846.2812036-1-matthew.brost@intel.com>
 <87zfrpica5.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87zfrpica5.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5eec9f-7fd6-4b86-07f0-08dc8bd5315c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZSK0I0ekthMGRqdG5zajQrd013VmlSQzNkSGxISkYwSTRWMTRKeGZ1SkxJ?=
 =?utf-8?B?QWM1L09tSFczOHpUdmUySUJpeDUxRlRSUWlnajVpQ2M3RklNYkhKR0dkcTAw?=
 =?utf-8?B?WmhUL21wb2hWeW1lTW82cTlDNzNaL0svL0xEaE1UeGlhRVBuN3hnMU50NDh5?=
 =?utf-8?B?bTY2VkRYQWFKZ0dQTTNJY0M0SVpiZVRieTcrWERxM0RTbHduaUdkM2NnQkJq?=
 =?utf-8?B?RVpsYnkzU1dZSk9jTno4dTZmdkpESkNJKy9iUFJrTVdJb3M2d0JuWXBRWW1D?=
 =?utf-8?B?R1JUTlRheWJpL3B4VjdUWERKeEhlSGhybXVMWmZLSGxWeFAwMFhhMXIyc3Ew?=
 =?utf-8?B?Vk5zbjhLZXViSHJ0K3VCUkNUMHZjcXhwK1A2Skp4am1XOVUvNWRiZ2pxSXRs?=
 =?utf-8?B?U2RnNC9VV1Z6S3lKRDROdU52OXBLSlNLdWJVNlhvbVF5UWJTak9BUkdFdm1C?=
 =?utf-8?B?UFFCcVR2K2NZb2dpOXFoV3dRNU15NjV4ems3NDRGYTlWNmsrSXhVZEswSXRp?=
 =?utf-8?B?cVkvR2hTZWlINjJySmRSVVNyck1Mc2VOL3JTRlVvdElkWlB5OW9wd2lVRy9G?=
 =?utf-8?B?MGlyV1plU2pWNHMySnpCckFlYkJWTm1yZW9mN2xmVERVYlNUUU5UTjc5cktx?=
 =?utf-8?B?R3MvQkwzeXpHNGd1VlhjRVNIYmN2eUwxV0ZPcVZ0WWZDYVV3VmUwZ0U1Sy81?=
 =?utf-8?B?bGswdU9iRDAzc2oxYzJXcnNQQ2VaUzgzWmhQdi8rK3NQcW1rc1VXZERjTkJs?=
 =?utf-8?B?a21OUlIzSkRlbUhWaHpuWTVWbGRrUWlTa0I5WFE3Ui9jOGRTbFFIU25LUHAw?=
 =?utf-8?B?RHpGUVZIV2NmS2NnTXFkbjVnZitrZXd4TTdwNlBCRi9kSWNhcEo3L2swU3Ax?=
 =?utf-8?B?ZlBvelpjdEp6WmZwNy82dkVDOUx5cnZHYUJqZHJJTE5TNzB5Yms1bzVGUXN3?=
 =?utf-8?B?T0poVU1ZUGtXMXlEOHphR25CcU1rZVJhR0VLMFlzbWRUOERXbUpaNTF3RUFw?=
 =?utf-8?B?S1hINGxrMmpRN2tvU3Z1MHl3VVdKZGJyM2tGTkdCeXlCUW9OaUZUV1padlZu?=
 =?utf-8?B?ZnNHWlFqcVNxa2tYNFQ2LzUzeHp1S01tM3k0OGQyeUVCdWFOYzhhZmsza2F4?=
 =?utf-8?B?RHJ5WHhKRUxvcm9hWEFWdG9nRGFGVHc1Y0JoTWNDbHhuVTVmOEdJUER0ajEv?=
 =?utf-8?B?L3JaelR1aG5CSTQ4a2JFaG9rUXZqY3EzT2pLUnJMZVd2STRpVUVweHZ6Z3lS?=
 =?utf-8?B?c0dXcHUrN1Q0Ly85cWIyUXRWS1lHT2tPOFJWVmJ2RlpvTTF1T2ZjbE5qT0xC?=
 =?utf-8?B?allBYUtJaEFOeTVtejBTVHRSdy9Cclc2ZnB2NWdnWkRZT3lud0JDMWs2bnpl?=
 =?utf-8?B?VUJSWEhoLzNGMGhhNjlTanhzaXdjOThzVTZKeFlpMFgreUhsNFhWMlFFUFZK?=
 =?utf-8?B?TXRITWhiNVUzK1NZcmZDaW10bGZsZElNOXp6bjdkc1BBekthVVNwYVAyTVJP?=
 =?utf-8?B?TFZBeTF4MEhHWFpuVVBoVU9idzh2QkNpS3ZlQzdaMkVPd1JOMERQWEJXNGIy?=
 =?utf-8?B?MlhvS3IzdjhxT1daenZUMWZCWnM2VXFyM0RDN3pIZjJkSCtmNFp4b2xPU0ZE?=
 =?utf-8?B?R0NDa3h3R3FLMlIxMmZ6M1VGVWM5UFlwN25HVkZLYUJOQzdCVFl5MDdrY1JB?=
 =?utf-8?B?TnBaMGRTV0cwY0pIYU1pMlVSZm9SOXBTa2t0OW82QzJqeHVQajhuMEd6UCtM?=
 =?utf-8?Q?iQbC3UILyj1giTfkWVyJl4mPlRGbIx1WS/QUNUV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFYra1JpVzY4amNjd3VrWmh2M29GUEg4Z2c5cWc1TEl3RGhSNkY2T0xsYmlD?=
 =?utf-8?B?ZXNVTWFZRzYyYmg2am9rVEdsWHBodm1aMUtlNjZ5UU5WaG14cVpCMVFMVzJt?=
 =?utf-8?B?YmJyYkRyWjlEY1J1MTQ2QTUvSldUR1IvRHo3MWFNaURrTnp3S2xGN05zckl5?=
 =?utf-8?B?R1FnZ2lkbUtTZURTdGdDL0RuU013ZExEYTVETjNnbW1lY09NbDl0S3p3U1JY?=
 =?utf-8?B?a3lzVDVKK005V3A3SnpDcXpxaEVKN3RxaFhwVStrbkVrN3l6VXkvdVNGMGdY?=
 =?utf-8?B?NDlDNGx2VnBMK0xaVTFDc1hVSS8yVnVIajhOWTZXeXYxN3NydDh1Q0lOdWhO?=
 =?utf-8?B?NVkzbjVJb3g4Y3p0cXN2R1Q5SktkT3hqbUJ0Ni83cUVtdnI4L1ZiUVRYalht?=
 =?utf-8?B?ZnRDSWJuZWwzcGt3U0FidkRuT3hjeEx2WXV5aTFoU3lFQmRpOWVrWFR2YkFq?=
 =?utf-8?B?ZEhZK2VjcGEyZDRLYjVURk02VlNNcHlnVGZOdTRXV1d2N1FnUFRMYlQ2QmQ1?=
 =?utf-8?B?eHlOQldVV2tBUVlVbyt1c3FrYU1JL2dDMjhYZnJRVUQ3c3hmTEtVOVpWN3BX?=
 =?utf-8?B?RnBqaEVjNUJnSElQdTkvd0JqQWxJWHlzN3F6RFdBZTlwZGc2VjZONnBrMjZ3?=
 =?utf-8?B?K3Z3WDI0T1VKNDJwQzROWU4zQVJIQmFOaDBVZlBSWnN4elVTWStmd0VTTVFK?=
 =?utf-8?B?bHdvSzZJTjBkbHM0OU5sbjlUYW5rZ1V5blU4bWd6NElib203SkJ2MCtPMG5N?=
 =?utf-8?B?c2doZVVkckR4Mk1IOUxhT0d1TEh5SFMxVjVpbWVHU0wxY25JOEQ2K2c0OVJV?=
 =?utf-8?B?V1RYcm92TTBOZUlSODRlRTBqcnBTU3ZFdXZhbDRDUllObG9WM3FiNmJOYTNa?=
 =?utf-8?B?UHFuVFpoRjVkTVIrWkhYRjNEbUdJbGhhS2RsT0pDb3lFRlp2eEZkVURhcWly?=
 =?utf-8?B?Y3B4SkIxTFErQVFSTDFnVThwU1NBcDVTNUNmSWZyMVB0UDRSVDgxdnhtKzZI?=
 =?utf-8?B?NHhDQ0pxRDBZZkZUWlFjY1l3RGpLaHBSdWZzWW13Y3YvQ2J3cE9xTHNmZ0Jv?=
 =?utf-8?B?dHU2Z2FVMmN3WC9YV0xVcTd6T0swWFVrMFlTWVk5UDZHVUxDcndFUkUwY2Jw?=
 =?utf-8?B?cnNROUp2MnNiY0JMYm1XVysvK0FtRkU5a2xtSzZOdWdVT055dm5xdnQ1emxz?=
 =?utf-8?B?ZWNDMG9qS2plMzdNeUd0WkQzL3llUWlxZEdva1J4SnhlWVVDZFFmdnBMRjQz?=
 =?utf-8?B?MWFrSWx2R0o1NGZZVlBjQkQyRjkzbGg2ekhDTWxrSmc5UEJudk50TDYrQmp3?=
 =?utf-8?B?elRxdFFvQTdldFdEbVhLNTdVOEFTTTRDaUpDY2VjMXN4T05McWV6WFBzeXhV?=
 =?utf-8?B?dEQrRUtYQzhQQ2xGVVM4NGJUMmRtOXh2b3ZpRG55b0RQdW9ncXVhNEpyL01Y?=
 =?utf-8?B?RE4ydHd6SU1DNzFGc3ZPL0JFQ0Y5a2VscG1BYXI3bzhydVl6czhwSi82RERW?=
 =?utf-8?B?L3FBck5RWmJQTmt5THlGTitVa0JoZFNhdVFtQkNCOXBOcmN6WEVBY2ViRG0z?=
 =?utf-8?B?ek1HTFJGUzlLS2Jub1dVVk5BTDN1bVljZFlUQ1U1bmJOZmUrTXRWQzMxbURF?=
 =?utf-8?B?TjREUFNvR3ZLdW15VTB2eW5qNGdlQW9nTjRaS24vcmFYcDdzR1pFMGp0R2hm?=
 =?utf-8?B?emhFbWJrdysyc2o3c3d2SUo1V3c0M3BlazlqekJqZHd4aE90TzVvcE4vUjcz?=
 =?utf-8?B?MTExZEVJK0VoZzNzYytsNUhHa29jWmhkV0xhcFpUdzJONXpsa3I2UExMenRG?=
 =?utf-8?B?dkxkSDdFNFpOQTZDRlcrZEtIN0tlaWE0TzJvR2JYVkJDMzllSjhwYVR3WUgz?=
 =?utf-8?B?NzFSSmtCSFg1cWl1aVd5L2dLK2FRQ3ZkdFRWVVl6NjlXTUZKclRNUzBLa05s?=
 =?utf-8?B?bGdiZ3N6cy84V2sxZWsxUDU2bUhVZmR4WTdnQW1iTWhqWGJ5VGtDTjU4cTZ2?=
 =?utf-8?B?engwQTdXWXF5VzVMT0FJYkNqaWxRRU5aMXlhblBJSm5ZL1VkeEEwdk1BNGV4?=
 =?utf-8?B?bTRnMU9Neko3bUxvQkxJVGc5YzNmK293dkZOZGdUYys0MFBQSERSNTgwTVUr?=
 =?utf-8?B?MldwaGlBcU53VTZEeDJHSHgzN2hQOVM5ZHVua3JBWkoza2Z1aDNGeGtzTkZI?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5eec9f-7fd6-4b86-07f0-08dc8bd5315c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:18:15.4986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ8JHcY6noDnpwBwjAm7iAFdnkXxaGE3wYDMqaZHmrEVhunE7skXJSNxlENdaxhFB12LyLlHmKUb+aW/hYWTIJzUl/V+Jbo42e57yVyMjks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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

On 6/12/2024 23:31, Jani Nikula wrote:
> On Tue, 11 Jun 2024, Matthew Brost <matthew.brost@intel.com> wrote:
>> +static u64 div_u64_roundup(u64 n, u32 d)
>> +{
>> +	return div_u64(n + d - 1, d);
>> +}
> If math64.h doesn't offer what you need, maybe update it instead of
> accumulating local variants?
Isn't it just DIV_ROUND_UP_ULL?

John.

>
> BR,
> Jani.
>
>

