Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5427EC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CD710E8A7;
	Thu, 20 Jun 2024 22:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsmWTYmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7710E15B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 22:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718922184; x=1750458184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xfx7+af0ZPTzl6p4qFE/EIhbxzvtApONdjx8nkQUjB8=;
 b=FsmWTYmHrRXt9stZV0s3R9YFj2i+igLWbdVFfSHkO5bnxfSLxUzBM1UR
 NoQ/5tfU/GAegdYjmXcxBKOs9kMBfDAK9KtkXTeNgK05IBytnILhfIJ72
 R60dDG9S+8dzh9irJSXXE45T9G61bh/4qmXJBSvD/x/uGJbc8mfU0G79O
 jdxata9yTV4+WzlrX20xLWHz50RsAjqVp02xXRKIZ+ycelSTZmHjFN7rW
 D8gkYQvUwQ0jHKolMhZwNdmXhnqu/RQDj7G7wnHfwfdSRnQZ34NFxopzD
 eTs50ysPLlpnxLfSRJ3ALExxF/lzLJjEs7g1p7j3S3jt5mriubEf5MzJ9 g==;
X-CSE-ConnectionGUID: qSfAGGUcTgG+YbdRr4Az0w==
X-CSE-MsgGUID: 74bCGRavQkKXn5kzXML3/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27344691"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="27344691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 15:23:03 -0700
X-CSE-ConnectionGUID: wGIvVk1ART2+/kV9KgRjpg==
X-CSE-MsgGUID: E17FCQG5RWSl0bXjpnKZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46845270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 15:23:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 15:23:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 15:23:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 15:23:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 15:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwjLhcfHbvPsWMBFmGeAequanZUkrBFo7b7h6mv+dDHkoIUFiaoBv+LY36Jsfi1g1AtYhf7cH3GFsuc5ydKpJTzHYVT0pjvNhTtuF0i9Y9adlbu+wiUc37N39eogXddTLlzVm6rvpwoM71nLN+Hf6d0Ms71wCxiIrtJYLWbOD4qWg9ghiBnLW7aJMOvZ/cDV9gUzDbXokISy/KwYVdnx6dhv6XkyyVN7JX/uEaOjlZS8z7oLRh2+fRfXATbAuV3jRROhcrO5UD00Wb44TeWb/g6mKCEH8MLThV1Y/NSjFX6UCUPlATia0a8doMX30EwDWy1BjBLmZcm4GJGGF1MV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWWqI1CdH6K1rQumAjlBIJvqPlwaqdApNHmORqCl6QY=;
 b=Z6FUoK5f6rjbOiIQhJjrafSm9jv+BfnMHbDGP/LKWYdLjdbnkiAPK5BA8nEfeigcg3/62LafwB37g5HF/2eNS57uNR7UOFUHO+fCRqv345Xhd2z94ITIhWSmeG7UICegZihOWaUr2/75jIjMq3cpy3jEWn1OG0PwNXYZ0UjEzbghk92VQOySOHW4G1/kWsrqI40E3lRlPyA++gYllx/YH2JQpQ/DZ5NvdYJh5Jn100RrS6pifUqTzRtsra9ihNGRIA6yEzWWb7bFBYs4ZP0Be6p1SW/vrEiz5IWnViMQOyLQUHwnyGXbCZHFxWHAODRTWYaxB2ncAQMeFsAR+FmkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Thu, 20 Jun 2024 22:22:59 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 22:22:59 +0000
Message-ID: <e9994cb5-b084-46e4-b23b-e9f7f174ff92@intel.com>
Date: Thu, 20 Jun 2024 15:22:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240619012617.3756043-1-vinay.belgaumkar@intel.com>
 <20240619012617.3756043-2-vinay.belgaumkar@intel.com>
 <ZnSncCwKW2wGUURT@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZnSncCwKW2wGUURT@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: f476aaa9-1e7b-4eaf-a2ab-08dc91778acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE9pQXRhQ25YcW5ua3hLYmk4Sk5yWXl1TW9EWFJJSEFvQzRCOC84TWJRQ05W?=
 =?utf-8?B?d0kyNWdlS3BUeElaMXhzWFp1NFJDdXBXcHI1dUVQUDV3YWw0VWlvSDJMUU1B?=
 =?utf-8?B?UVMrVFhDcC9tNXpvMWRkclpDQ2JVWXg1Zk83M2ljM1oyUE5rQWh4NGJEbXpx?=
 =?utf-8?B?TmFYUUtxbHlnNi9BTllPMXFFTlg4alFyVWtQcFdEelZ1QmNSQjRCMDZUSVdD?=
 =?utf-8?B?WllxQ3NBcVpLOC9zeXlzNXcwS1Y1dFRNTkNoVGdNc2d2RkQzRlhveVhCa2du?=
 =?utf-8?B?OWtLUHA5WU5naEszWElOVC9yTHAyM1lqeWRycTZ4ZWd4dmEzYUxNQWgyZk0r?=
 =?utf-8?B?YnlwSERlUjVja1g2QkQxYzlLK2tzTUovRE9Iemgyc2pQc3hIUDFkQ2VVbHNR?=
 =?utf-8?B?TUw1VEV3ZUh1MmNFUWFLcnd5Y2IyNkhkbWFCbGV1K0xIQU0vV0c0M09lUFh4?=
 =?utf-8?B?eUlMdDY5bzAxaCtrRnZrcEhHdzFTalBud0M4c2Q5NEFoQmlWbFZyR2x5S2kw?=
 =?utf-8?B?Y2VJRVJFNmVFQ05wcWt6cnkxYW1IMTFSU1o0WXNGcFRlQ0NDSDJwN3I1MSsz?=
 =?utf-8?B?Q2o2VkZjWnlTSXZHSUxUR3VhOWwvV1YwSWhaZHlpR0ExM2dYMEU2b1hERkhm?=
 =?utf-8?B?dkZTd2VPRGJ6ZmpYZ3d1TGlYMHkvWWVRTjdiTU1ueCt4MjBNd29jTVJ5THZt?=
 =?utf-8?B?aW9mSjhaWW4ramdwUFB0OVlmSFRSMlNRNUFRYmRLaDI3bEJqRDZuNW9uWWVl?=
 =?utf-8?B?eVI1NWNta1E2OWxIdVVUVDBhUkdGTGNPdXhueHJpclloU01VK010WlVRemNk?=
 =?utf-8?B?R0R5b2ZxWXhUWDg2dyt1SVhybnEzRDdSWWRabFV5VlV2cWlYblRENE93ejhD?=
 =?utf-8?B?a3Q3N3MyN2NRSHBCZTBydjd3d1VWN1lWNmVwQVZyMFladCtYeE5YdzlOYk82?=
 =?utf-8?B?WFU4dHZnR3VGemVMNWVZN1YxTGdtSlZZV2NVNFJVdHVsN1dOZDJtaUNKY09V?=
 =?utf-8?B?WU5NdWlrdzg5T3ZIQi9wck1TdVQrcTl3b2hFYmJMU2pCY2E0ek12ZzVPSHZB?=
 =?utf-8?B?Q3lyTURydm9OWEVZemcyUmFnc25OZ1p2b3BjYlJEd2t2MllGdXBIeWtkV3Bw?=
 =?utf-8?B?dmxjYm5WSjFrU1BqNWRBTXpQbjRhWU0zN2RWdnJ4cEhBUzNRM2wxMWJsa3Nu?=
 =?utf-8?B?ZmZ1T2NiWG1NMGxTd2REdmxPNnNLaWkxRTBuQ1lrNmZIY2N5OWR3L0VrMWdo?=
 =?utf-8?B?QmJZN1FiVDdhQlVMTzZ2T2NhcDZJb09uQTg1UzhGMHRMRE1pdHV5eHh4V010?=
 =?utf-8?B?UUtuNzdOeWFLV0dyOWtkWkx1KzdxdzdDdjZCYlRlT2dhaDJpZExVSHZDdnd4?=
 =?utf-8?B?eU9vNVpEZjhuVzh1MFR0ekZkc2J6ZElmL2FDT01MeFE2NERLeVB0Ulo1NUdW?=
 =?utf-8?B?RHhKeklSVzhXck5VUnlqendtMGNGQk9mTkw1ZDNGbmJ5OU9QOEhMVVF0RCt3?=
 =?utf-8?B?Rmc0UDJld0owUGg3QnNwamVpYXIrZVpNbk9mdkp6T280K0ZBd09ja2RtVzNC?=
 =?utf-8?B?Z2RraklJbTVHdVczV3JVZDErR1RyVjVnK245VHE3TjlhRUEvUW5KZkczaDYw?=
 =?utf-8?B?UVg4c0l1TTZXNVBLSGN3U0F1YUpBQXFOL2pFNWltWWNQd1NwaG1wb3Q3RjFI?=
 =?utf-8?B?MHQ4OGpRTjF4VVJ5Z1ZYTVJtSDBYRUplcVpaQmhJOThEeWFvTkhjaExZdVZ2?=
 =?utf-8?Q?P6YJrA6LjVy2YM5YX6N4MAFNSwHxseDUvxsuy8n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFGZmZJRFQ0RUNia1BGQjBFOTBpYyt4YlFoTG1oeWU2ak0xY09Zc1RkY1Jt?=
 =?utf-8?B?RFR3TlJOMjB6czNIVXMwdzYzR05KdjJxY2FBTTlTOVFZeU5TQXlmN2xYZnF5?=
 =?utf-8?B?c3dGQ0ZWQ0xFamgxN1VON3NsUVdtUmE2NkNDMXFhNXhRT3REN0RreWQ4NnNr?=
 =?utf-8?B?TlphRGFyY0NSR24vdzJqd0ZrM3owRllrUmxSczRoOTFpTnNEdmIyYnZYclE2?=
 =?utf-8?B?YkgvVTIycCtEVnZRcGYwcUdzY1hEVDZCMVdZUTJVc1hxeDV6cTNJZFY4N1p4?=
 =?utf-8?B?Q2RiVW1xSG4wZmI4Wi9RdTRZWVIxKzBGb2gwaWRmWVdHSnFia2R0c0llS3BV?=
 =?utf-8?B?YkpZSEZNeEhlZjlVWGRmWU9qZndFcU0yRGd5c2oxcUVKR2FJYzhuS0toQXBv?=
 =?utf-8?B?cWcyb01kYmcvWUx3bFdYa3VqbmN1Z2hJdkRqcDkwakFDZTZ5Q2ZVQzVhZjFr?=
 =?utf-8?B?ZVVkQ0NZZnY3RjY0d0pCNjJNNnJnNmk5dHpXNnZsUldZSmxQSTA5bUZHZ0dr?=
 =?utf-8?B?d255VlZxTnVHV2x6MmdicC9tSm9sK1JPZkVCRjBvZjNaZHJDUjNiSkRKZyt0?=
 =?utf-8?B?eXliVXFNbnE2RktBRU1VVmg1L0dxVWxQK0tZS3dXNnY3dk4zTWd5Y3pQR0pB?=
 =?utf-8?B?Z0YrZmRqc01acEtLNU5kMjFSeU5ubkVXNjMzamk2K0dtNlJTM0xyQ0NmZG9C?=
 =?utf-8?B?UlAwZ3pzNW9oSDl4aUk4aXlsSVhsZUM0TTZJK0JieFJPTzVEZWxQMG1ZYUV5?=
 =?utf-8?B?L0NWY3dYVXp1NWs0U2FNVkJLMWNVVlpiVUlFQldnblhtOGtoOGFEaXdsRSts?=
 =?utf-8?B?QUVjN1Ftd0tRdmRQYm82SUtqRDFjdW1oWXEvd3RyRkt2QUJHUC9GOU9LNzNl?=
 =?utf-8?B?NVE1UWtoR0JtWUtVZkFxWjJpSU9kMWk3RjRqSXJnTXRFSG10Uk5wbGN2cFdD?=
 =?utf-8?B?Q0VBdjdQZVlmcmtLcVBpb0tXM0JUUUoyVGJTYzhmMWc4V3FBR3kzdEc4Z3Nw?=
 =?utf-8?B?a3lTKzdRTGJ4MlorOUI5Y3JsV2trVGpUUzc0R1p2NS94TmljVmZGYjZodjQ2?=
 =?utf-8?B?VFNRRUM5azRvSWNBcTVZcm5TU2ZSVUZzUTkwa2o5V0lwOHozVnN2Y1ZTRWF3?=
 =?utf-8?B?Smg5cUhCeFVEYzd1RktxdUxqN0JGdW45K0F1QzNzZjAvcU1oMVpRWE5pM3pJ?=
 =?utf-8?B?RWY5MnhCK1gyK01vZnpGckF2dGVBVzB2TklVdHhtdWRYVksyZnhKTW5mQXhj?=
 =?utf-8?B?Q2RQaFo1bm1lYUVDRzdEdHJZTG9tdXVYSzV2elQwRXl5elRnajgxQ0thc3dF?=
 =?utf-8?B?cmdHY0NYRUxUL0NheHQwcXFkdW1wd2hsZThLNE5zdXhmZmhUUUE5UUp3U3Y0?=
 =?utf-8?B?M1d2RXMyZ1Z1bHR5c3NMekZjSlEzd2h6aVBpRUhKdy9WRjg4bzhSZys1OHNR?=
 =?utf-8?B?b3dYVVlsRXMvcGpQajMzb3IvbFZSK29HWWFwZmZIUHA4OVlJcnAzcWJLRkQr?=
 =?utf-8?B?Yy9acFJGNnJONVVrVzZKSWVjTVZ2cVhwVFZ3K2tCMTF6OEZuakl3cWt0SlQ4?=
 =?utf-8?B?VU43NEt2UVhGQWJ3K21oSlNaM1lEb3lpUTE4K3VXZUtrZWxUQjRDQ2VxYTEx?=
 =?utf-8?B?ODBaSkRxWDdmTzdhZUV2bmJkT2pCc09vYWVIL0pCay9SWEdLNGpjeGo2T0VJ?=
 =?utf-8?B?ZmtoaDh2MEE5b2pZeXRpcWcxbERnRmJWdFdlc3RodEYxUU1Dc2V4cjRqU0o4?=
 =?utf-8?B?YmFUMjZvck5BOUthZnhucWhOWk9rUUwyUm9nak4ya2pXc3JjMFpZYWJicEow?=
 =?utf-8?B?SjFVMWxaWW9YSmx4UFBxdExIWWNQT2dDSjlyeEdCNjQwSmYxRm9pVTBvOFNU?=
 =?utf-8?B?NXJKQXhuOXRkM1NOK0V4dFlRUWh4MzZEbFFtTDBUMmNraitCU3BjSjhWNlJQ?=
 =?utf-8?B?WXU4Z01BdGhRUlZsdnAvZEdMOGxXMU9hVTZFVmMzZFQ4L3pHUG9wbE45a3J0?=
 =?utf-8?B?UTJrd3BsUlc2V3dWRW8zWHNkaXhDMlRHRzNCNWhlMUlndzk4RFVvNncrZlJO?=
 =?utf-8?B?Z1NBcFRsTE1EOGVVUzhHM2M4SVN3WlVSMFlvdFl1WWNmZDFGMnhydDE5eEVl?=
 =?utf-8?B?NEYvWUc2VVR2N0VJb2srWGFKWi9FTmc5MHgwRFV3UVZENFFEQWg0dHNUa2Vx?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f476aaa9-1e7b-4eaf-a2ab-08dc91778acb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 22:22:59.6676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOf+SfJGOKEuHsfW064AkCk0EM3l0Sa1KzR3ifiE4XV5kL43Ejlh/srVV9pZey19v7IPLYf82xeGtN/204KycdbO4ELAMN3p7R6yEYEtge8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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


On 6/20/2024 3:04 PM, Rodrigo Vivi wrote:
> On Tue, Jun 18, 2024 at 06:26:16PM -0700, Vinay Belgaumkar wrote:
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load. Freq limits are restored after load
>> completes, so perf will not be affected during normal operations.
>>
>> During normal driver operation, this WA requires dummy writes to media
>> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
>> of the LMEM writes originating from Gunit.
>>
>> During driver unload(before FLR), the WA requires that we set requested
>> frequency to the cap value again.
>>
>> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
>> Rename some variables, check for locks in the correct function (Rodrigo).
>> Ensure reset path is also covered for this WA.
>>
>> v4: Fix BAT failure
>>
>> v5: Add a function pointer for ggtt_ops (Michal W)
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  3 ++
>>   drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>   drivers/gpu/drm/xe/xe_ggtt.c         | 40 ++++++++++++++--
>>   drivers/gpu/drm/xe/xe_ggtt.h         |  1 +
>>   drivers/gpu/drm/xe/xe_ggtt_types.h   | 12 +++--
>>   drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>>   drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h           |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>>   12 files changed, 157 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 20dc9759bb3c..b1e03bfe4a68 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,12 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>   	$(call cmd,wa_oob)
>>   
>>   uses_generated_oob := \
>> +	$(obj)/xe_ggtt.o \
>>   	$(obj)/xe_gsc.o \
>> +	$(obj)/xe_gt.o \
>>   	$(obj)/xe_guc.o \
>>   	$(obj)/xe_guc_ads.o \
>> +	$(obj)/xe_guc_pc.o \
>>   	$(obj)/xe_migrate.o \
>>   	$(obj)/xe_ring_ops.o \
>>   	$(obj)/xe_vm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 75d4c8ae9234..2172b7d0e36a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -676,6 +676,9 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_hwmon_register(xe);
>>   
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_sanitize_freq(gt);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 8ff91fd1b7c8..c345298d4a14 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>> @@ -23,8 +24,10 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> +#include "xe_wa.h"
>>   #include "xe_wopcm.h"
>>   
>>   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> @@ -69,6 +72,21 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>>   	return ggms ? SZ_1M << ggms : 0;
>>   }
>>   
>> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>> +{
>> +	/*
>> +	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
>> +	 * to wait for completion of prior GTT writes before letting this through.
>> +	 * This needs to be done for all GGTT writes originating from the CPU.
>> +	 */
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	if ((++ggtt->access_count % 63) == 0) {
>> +		xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
>> +		ggtt->access_count = 0;
>> +	}
>> +}
>> +
>>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>>   {
>>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>> @@ -77,6 +95,12 @@ void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>>   }
>>   
>> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> I also just noticed that this doesn't need to be exported... it could/should be static.
>
> I have a patch for that ready, but if the check of the hook failure make you do another
> version, please make this static.

yup, good point. Incidentally, I found another caller which now needs to 
use the fn ptr as well-

display/xe_fb_pin.c:                    xe_ggtt_set_pte(ggtt, *ggtt_ofs, 
pte);
display/xe_fb_pin.c:                    xe_ggtt_set_pte(ggtt, 
vma->node.start + x, pte);

which means we can make the original xe_ggtt_set_pte() static as well.

Thanks,

Vinay.

>
> Thanks,
> Rodrigo.
>
>> +{
>> +	xe_ggtt_set_pte(ggtt, addr, pte);
>> +	ggtt_update_access_counter(ggtt);
>> +}
>> +
>>   static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>>   {
>>   	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>> @@ -92,7 +116,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>>   		scratch_pte = 0;
>>   
>>   	while (start < end) {
>> -		xe_ggtt_set_pte(ggtt, start, scratch_pte);
>> +		ggtt->pt_ops->set_pte(ggtt, start, scratch_pte);
>>   		start += XE_PAGE_SIZE;
>>   	}
>>   }
>> @@ -124,10 +148,17 @@ static void primelockdep(struct xe_ggtt *ggtt)
>>   
>>   static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>>   	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
>> +	.set_pte = xe_ggtt_set_pte,
>>   };
>>   
>>   static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>>   	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>> +	.set_pte = xe_ggtt_set_pte,
>> +};
>> +
>> +static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>> +	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>> +	.set_pte = xe_ggtt_set_pte_and_flush,
>>   };
>>   
>>   /*
>> @@ -187,7 +218,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>   		ggtt->size = GUC_GGTT_TOP;
>>   
>>   	if (GRAPHICS_VERx100(xe) >= 1270)
>> -		ggtt->pt_ops = &xelpg_pt_ops;
>> +		ggtt->pt_ops = ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487) ?
>> +			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
>>   	else
>>   		ggtt->pt_ops = &xelp_pt_ops;
>>   
>> @@ -394,7 +426,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>   
>>   	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>>   		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
>> -		xe_ggtt_set_pte(ggtt, start + offset, pte);
>> +		ggtt->pt_ops->set_pte(ggtt, start + offset, pte);
>>   	}
>>   }
>>   
>> @@ -502,7 +534,7 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>>   		return;
>>   
>>   	while (start < end) {
>> -		xe_ggtt_set_pte(ggtt, start, pte);
>> +		ggtt->pt_ops->set_pte(ggtt, start, pte);
>>   		start += XE_PAGE_SIZE;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 4a41a1762358..0e36ed4cd68a 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -11,6 +11,7 @@
>>   struct drm_printer;
>>   
>>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>> +void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>>   int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>>   int xe_ggtt_init(struct xe_ggtt *ggtt);
>>   void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index d8c584d9a8c3..5d3de08831f3 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -13,10 +13,6 @@
>>   struct xe_bo;
>>   struct xe_gt;
>>   
>> -struct xe_ggtt_pt_ops {
>> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>> -};
>> -
>>   struct xe_ggtt {
>>   	struct xe_tile *tile;
>>   
>> @@ -34,6 +30,14 @@ struct xe_ggtt {
>>   	const struct xe_ggtt_pt_ops *pt_ops;
>>   
>>   	struct drm_mm mm;
>> +
>> +	/** @access_count: counts GGTT writes */
>> +	unsigned int access_count;
>> +};
>> +
>> +struct xe_ggtt_pt_ops {
>> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
>> +	void (*set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 80a61934decc..f8239a13fa2b 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_huc.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>>   		return ret;
>>   
>>   	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>> +
>> +	/* GSC load is done, restore expected GT frequencies */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>>   
>>   	/* HuC auth failure is not fatal */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 57d84751e160..759634cff1d8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <drm/drm_managed.h>
>>   #include <drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_mi_commands.h"
>> @@ -54,6 +55,7 @@
>>   #include "xe_sriov.h"
>>   #include "xe_tuning.h"
>>   #include "xe_uc.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_vm.h"
>>   #include "xe_wa.h"
>>   #include "xe_wopcm.h"
>> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>   	/* Get CCS mode in sync between sw/hw */
>>   	xe_gt_apply_ccs_mode(gt);
>>   
>> +	/* Restore GT freq to expected values */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_gt_sanitize_freq() - Restore saved frequencies if necessary.
>> + * @gt: the GT object
>> + *
>> + * Called after driver init/GSC load completes to restore GT frequencies if we
>> + * limited them for any WAs.
>> + */
>> +int xe_gt_sanitize_freq(struct xe_gt *gt)
>> +{
>> +	int ret = 0;
>> +
>> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
>> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
>> +	    XE_WA(gt, 22019338487))
>> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
>> +
>> +	return ret;
>> +}
>> +
>>   int xe_gt_resume(struct xe_gt *gt)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 9073ac68a777..1123fdfc4ebc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>>   void xe_gt_remove(struct xe_gt *gt);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 2b45a9cd3ec0..edf4a29a2aa3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/delay.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "abi/guc_actions_slpc_abi.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -25,6 +26,7 @@
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pm.h"
>> +#include "xe_wa.h"
>>   
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>   
>> @@ -42,6 +44,8 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GT_FREQUENCY_SCALER	3
>>   
>> +#define LNL_MERT_FREQ_CAP	800
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -695,6 +699,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>   		tgl_init_fused_rp_values(pc);
>>   }
>>   
>> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	if (XE_WA(gt, 22019338487))
>> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
>> +	else
>> +		return pc->rp0_freq;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>    * frequency to allow faster GuC load times
>> @@ -706,7 +720,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>   
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   	pc_init_fused_rp_values(pc);
>> -	pc_set_cur_freq(pc, pc->rp0_freq);
>> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>>   }
>>   
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -762,6 +776,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
>> +		/*
>> +		 * Get updated min/max and stash them.
>> +		 */
>> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
>> +		if (!ret)
>> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/*
>> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>> +		 */
>> +		mutex_lock(&pc->freq_lock);
>> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +		if (!ret)
>> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>> +		mutex_unlock(&pc->freq_lock);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
>> + * @pc: The GuC PC
>> + *
>> + * Returns: 0 on success,
>> + *          error code on failure
>> + */
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	mutex_lock(&pc->freq_lock);
>> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
>> +	if (!ret)
>> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
>> +	mutex_unlock(&pc->freq_lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_gucrc_disable - Disable GuC RC
>>    * @pc: Xe_GuC_PC instance
>> @@ -911,6 +972,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = pc_set_mert_freq_cap(pc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	if (xe->info.platform == XE_PVC) {
>>   		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>> @@ -959,6 +1024,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>> +
>> +	/* Bind requested freq to mert_freq_cap before unload */
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 8a7b91ce1b3e..55fdb55ab688 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -32,5 +32,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>>   
>>   #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2afd0dbc3542..13810be015db 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>>   	u32 user_requested_min;
>>   	/** @user_requested_max: Stash the maximum requested freq by user */
>>   	u32 user_requested_max;
>> +	/** @stashed_min_freq: Stash the current minimum freq */
>> +	u32 stashed_min_freq;
>> +	/** @stashed_max_freq: Stash the current maximum freq */
>> +	u32 stashed_max_freq;
>>   	/** @freq_lock: Let's protect the frequencies */
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 12fe88796a49..a6b897030fde 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,3 +27,4 @@
>>   16022287689	GRAPHICS_VERSION(2001)
>>   		GRAPHICS_VERSION(2004)
>>   13011645652	GRAPHICS_VERSION(2004)
>> +22019338487	MEDIA_VERSION(2000)
>> -- 
>> 2.38.1
>>
