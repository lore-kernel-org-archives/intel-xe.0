Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B024CD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 05:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882310E203;
	Tue, 26 May 2026 05:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvDKGPU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7F210E203
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779772682; x=1811308682;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1DlMYkLyVWW3UImGZ1W8JPqlhfautDEH+gJHlGW16j8=;
 b=RvDKGPU4W2++XsXKgp6oktAZj7PCr2U93zE84j0M6Rp4kkv0KnftixSs
 O2sYAA99qUQreljJ5+oOGP82UfT9rXnIMuNwWnHc1IHxJHPg4OT0oqY3+
 j8Cq0iYG2bCLXMWDqg0GZpaYHjCA3U3DZb0nTjgehB4QVefO9SZ8wRYiS
 zhRO5QbSoqxZ68Hn18fRpVaY1ayDAP9udwbePy3Wj/sIjlGVJ7vx/Ueq3
 3XA+900HOGc8WRfjA6HEBt+p4GQMV4CFBoXfIgCHhpDwBe72EDdmFy4Lu
 toNWBEaweTeyrlC8DKUB/USAFLYQgwl2JYQ/85ph2xMCK6eLZHhzg9o4h g==;
X-CSE-ConnectionGUID: UEtvhUUjRpyRNCL7zu4p2Q==
X-CSE-MsgGUID: wS0AULL2QRqd5h7HBe0n8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84432012"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84432012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:18:01 -0700
X-CSE-ConnectionGUID: nm2zfm2fSVKrd07RdiwWIw==
X-CSE-MsgGUID: mtA2SbMCQxqFdE4RR6IFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="237622079"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:18:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:18:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:18:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWzOPzqM1rOlWrcNfVBIoH2izkYRGXG3Ik7ttw0elK7V6jwAfXqL6ad7f0yAm8s7tkLGPO53tJtkNw7t26O82ReM43iVcilNnutuEWp2JPLL275QpaD4oPxgt/CjYnBy2tj8Rq5yCFb2CsrP6yZpYhKumgoYuhQDT8sB5vHu+OlxwHFc/HNzIjvs8t5Fwlxd05kwtkIMa9H8Ge38uG/+ZbQB4ApqA2MA8Ts5I2uo12CLTo3tMuCPSi3ZAv+gZGpyhi3eBo0vaDYBg+/5gKwpvyhxt+syg2XOp3x3IlQJOn4pmsphecXWUKnclct0zMkmH2FgcSJjZMRvVjpcSiRmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD2g+UCtKp/40dmYTmWPt8wzS2uxyveb9yGPoR8kv9s=;
 b=QM7J4fWL7KOUBC+QJo9o5SujgTtTrKuBxveibdLSMVPgMuyS6AwyWYUyPmbBWGZWzxecqi2UfeWdXD15NRfcIwjFEY3lAxboBkJ3ZJ/yzWDGkwCKKQb/S56yZKlheupwDrB+F45aOYsq1V7zZJbyV57J+q5RA1rctOYBPpjfyNc+6eSFIRgbvpRubFnIfgElwmrYa3w5zgYm7tmx05p7AqtJebnxZw/2bYGS7HAO+KsKr85ihqYiUPUF1j0J76maoY5lrJqJT+BF8A534cPomKoBXL5pe9WAw/k0Fbc8mz1rvewaBOYT0b7FgZQ/b3Cwv2TX2VQVcxvCfCwd5JfaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 05:17:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:17:56 +0000
Message-ID: <bcda8f4a-79b7-440a-b2da-6277ac2a03ba@intel.com>
Date: Tue, 26 May 2026 10:47:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
From: "Tauro, Riana" <riana.tauro@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-10-riana.tauro@intel.com>
 <agtL3NF1BFyEX841@black.igk.intel.com>
 <3138ca66-a606-409d-a245-9ded2fe91230@intel.com>
Content-Language: en-US
In-Reply-To: <3138ca66-a606-409d-a245-9ded2fe91230@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 857d2cbc-afbe-462f-c9c8-08debae624ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|6133799003|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Qy/574OFwKT7eoP9w8RLXXLB/Z33YGA2Xhw6jb29K/ckN0W7QHtpDSIXi8utOhN6KluoNCJ7QVAV09xpDFN3qhRfGFoDcZr5mPLpMBkoXLg9S877w1P+3Pzu2Z2FaC59HPj7LQTA5jn0X1yuhJFJV9bYAPE5q9I6zMkDyk/rTLy5yyYMZfqhEayPAXZtcroVQ9EIbU52BG6m7+6WPOTPNfOr5h+AONv3jDYq2PvAVQ/ThwFUMne/+zvQGjg0ybZNHLeTi2Ij3BhHE1nhL5mAQx/N1/M5dbpzOSw9Nufu6nf60FFj/X1OE7R6x2M3UzY6AbqU8wQ0tYl86AImfum/9eqAjFNSfe7U4X7e9hQsxMyS1ZAx59ZX1XgpgFqSUebC4intTcFpG3YfNF3WnLAjJJNQ/ZAiy+HLSrRdPk2JA+IfqaIUiw2HgNL7ORE5RD/rqbvjmyY4QjJjBc9NFK8LHJPoZ+TNZ5ubUgUKF9Ex5WqCywCcd17ttA3Pam6KaBYqSspUJfwrCNUF6tb59Vf6vgbHEEmG3Bm9aC42ivia3y0WCdr97nssDMtOqG7v8QfVn/Nr7zBLzAoly7+hfFZcQEbtjL9yeMFdEBNed2JkKr8X9qr7i3ydL8y2qf0pQIRMbMcsIaYTV1A0IhTGR+20TeKxPdU23rHtOzdla4vRJTm5lg2jnrWW4ZKb7EkN8bSmDm1j5fZAKYV9rCrfyK17hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpsRG9BRzg5N1FETGp4ZzYrR2czYjZMUzA1RlMwZ1NmdW5SbFZYTllwNEp6?=
 =?utf-8?B?dkdvUVVqRk5wTzArTW9UZC9FdHlLd2NlbTZKRm9RYm9jZmpiL1RXWnMrZFlt?=
 =?utf-8?B?TTdUVUs2WitEazlKczdPb01YTkltT0ZRdHlCOVJzcHUyMUFKWVBJR2tacHI3?=
 =?utf-8?B?YnVveHhRQzJ6U2J6bTF5dnBIT0VSajdDUWtGdXBNaWFYcUJLai80RUNSTVh6?=
 =?utf-8?B?Q1FqZlpiWUVGNGoxNW4yVm5hOElOVGhxQnllaTNPVmZSRnFGanI4VFJMMFhI?=
 =?utf-8?B?TTVaRTFPUUorZEZOcEpGV0RTT3Fxd2MzRElJZ3czOFVWYkFpeTlJQXJIcHRJ?=
 =?utf-8?B?dHZERGwxc2txU0QrdjFkRmJCS2w1RzkwbnBsdmxjTkI4Tnc3NFNJNkxBb0tZ?=
 =?utf-8?B?N1lHU0VGTTN6aFZ4UWJUK3lxN3JZRWdzK1pobnhIVkJQVHc1K0hvUEJLcUFB?=
 =?utf-8?B?NHl5TGQzOStxNnVlTE5HaloyT0tkNXJFRzdta09TME92MHVxekJubWNmYURZ?=
 =?utf-8?B?MVVZRHAvN24zdjBwV0tIcWJmZnp6ZnF1bHBuci9VOEFSb2FXdmdEb1NYSDNG?=
 =?utf-8?B?RVY2c0MzODhRRHdVZm01OU5yQ2lIWEMwS0JaUVhXeVR2ZU0rR0diYjEyWnVQ?=
 =?utf-8?B?bCtmZ0ZTRiszNVBYZjhJSzE0VnB1Yzlla3BSNzVMM2swSmJ5dDdwcTMySjBM?=
 =?utf-8?B?UHVmRkhtNVI5R2xNNDEvb0VQNEwyQ0Zvek5LeFowbHllaE02N0hwNVp5RHhG?=
 =?utf-8?B?Tno5STJ0S1p3cWd0Yk5oR1lMS01kSVhEMVpSSFoxNm5xZkdpcXVldTVjMkFZ?=
 =?utf-8?B?cVNWb2JxWnJNK0VtY2NYN1Y3NnFUanM1Z0tyY1ZPS0ErUjB3MDBqRC9LcXVN?=
 =?utf-8?B?N3dYOE1wU2Z2Z0xDRnZvcDlwV0VISjRGL2UxNmFSSjFTL25pYmQwT2o0b3Jx?=
 =?utf-8?B?UEJiZXlVNVJVRkJhZnVzNHQrU0NjUXEwbzBpUTNhWWtkV3JIRFV4REhPYTR6?=
 =?utf-8?B?djJZYTZpM0tYTFVjemxLbkt4bkxRN3F5bnZLTjlJb1JGMTRuMVhtR2ZUZWlT?=
 =?utf-8?B?NkppMGhsVFJlaG9MaGdOcUwyUG1KZmo1K2hDUlowUDllTWhZMCsxYkdlYVNW?=
 =?utf-8?B?aUtoMmtycXRyWUxIS3hodXptYzdYTWRNQzdCK1hBdHgrTHphbjFaV0xGcDRR?=
 =?utf-8?B?dXR0Zm1oWFo3YkYxVUlhcGQ5U2hOUWYrY21iNTVCRGVrTEg3Z3J4UWkrWm9V?=
 =?utf-8?B?ZThRUzRrdjFvaFYyV0tobXM3UGs3cDRGQWhZZ1kyS0hMWmZIS2xwY1Q4OEtI?=
 =?utf-8?B?RFR4WCtYb1dxRkxyUlVqeENXQThtdFhvakh1NDY0bXNBc2dkc1dBRlM4UVJT?=
 =?utf-8?B?TWZmdzBhT25PNnpmZFQ2azVRUkJ4WWd3SjYxQnFvM09mckJ1VkE4YnBMQWF5?=
 =?utf-8?B?N25ScERXOXdYclZqeTVZblRnRGlKNmdFN3F5VGROSWFOaE1oVTJmdUpPdm1w?=
 =?utf-8?B?a1FtVEJ1L0V4dVRHK1lscEU1OXVZVk5SRWlpM2ZMYnhLYkllM1V2cGh4S2NL?=
 =?utf-8?B?MFVjK2pYeWhKakluY0QzR01oRGt1WElwcFZUSFhJQmhrNm14UmZVYXdQQVRQ?=
 =?utf-8?B?RDcyVENmV2J6SGdmVUsxb0I3VDB2V0lyQUgxSVRWVy91ZFZTc3Vha2wzY2k1?=
 =?utf-8?B?Z3Z3TE9VaStzME54TjRlRkhLWGRRb2UrUVJBZWRWNldTamRLRUZMamVqejFy?=
 =?utf-8?B?VmhSRytSK2ZMd3VxOXM1Q0kyNHpTb0pxMUhhSjNvSDJTMlZ3UmFFenZMSHVl?=
 =?utf-8?B?eVFxUHI4dUxEbEJJTE5SZXhCQS9wZWMrS094YVgyZEMwNUJHZ2dyNno3c3lS?=
 =?utf-8?B?d1hObTY4YjF6Ulo4UnMrblVFbmR6VlR5Z3AxckRPL21BcU1hYTE0Q1JRMk9I?=
 =?utf-8?B?eC9pYzJBS3FsUlVpQlFSVEwyc3ZHTzR1MEI2UWxTMi9WVFNSU3V3ZzB5WEhD?=
 =?utf-8?B?WHRaWm05dzdZbDM0UnFKNk95N01UQXdUSVQvQ1RuN1NneEdaaGVablFITE1W?=
 =?utf-8?B?VTBpMTFlN2Z4b3pXVy9zc3UzREI2bkRHR2hZclY1YnpDVkNrMWp6bVBSRU42?=
 =?utf-8?B?WVk2S1h3ZkF2T0I5b0NaV2ExZ2FrRGRqMmV4U2Jwb2xtNXpRc2Ewd2FoWUk1?=
 =?utf-8?B?SHdWWmk0RU1MNGtEMzJ0RjhnUmlhZ2NTek1mMkNLUUg1UThOK1ZhNjBTSm9k?=
 =?utf-8?B?Y2JPeENDeC93WUl2MlIwQmhWeWFJblRrc0Q5VWRORlo2cExGQXY2dDZubk9L?=
 =?utf-8?B?U29YZ2NVaFhYdzAzK1crZVYyWk1iUkRzM2VIRUhyQnhsT1FDdHZMZz09?=
X-Exchange-RoutingPolicyChecked: BRcJB1gXGhDPGZZAppGnKrLIQ6VBApkFo8pb3lxKOuQPlU1G70bU04JEP4zT56YxCAkUquKFKA2oqSUksZmE7gJgzh++n1ak89rp3tWtF4n10zcbWXy0Ww3yf3uSqkmQJp7fP7w95mhNfwRQsZcb4ByvzvNmgvasCLAI2uQJwqL47hVC9zHiX2UcajJlYNWenCAFaHSXb7LZ8XVNSU/zWLwXjmwsKfCHRvO39bh/SPbx2YpQ3I52NQfg36nBIx/HNe6LWlKsQOiQ/cekI2umV9jhdYeB5OCeZTkHUBjzvYNUldgs073KV53WRg13Xt54xsyR28zrqaH5t6+xmR+qrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 857d2cbc-afbe-462f-c9c8-08debae624ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:17:56.1144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvgzeWsUiQfoxh+SClDAaL8A5Llvd60rqsEoTaLUaOAF1E2/EH9qL0MKAQfJ32wvUPVsGa+AchV1Kfc1mNQnOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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


On 5/25/2026 7:43 PM, Tauro, Riana wrote:
>
> On 5/18/2026 10:56 PM, Raag Jadav wrote:
>> On Thu, May 14, 2026 at 10:52:08AM +0530, Riana Tauro wrote:
>>> Add request/response structures and helper functions to query system
>>> controller to get error counter value.
>> ...
>
> I will change the mappings to switch. I was working on events and 
> there is
> a need of reverse mapping as well as default check.
> So to have consistency, will change drm_ras_to_xe_ras_component and
> drm_ras_to_xe_ras_severity to functions with switch.
>
>>
>>> +    xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", 
>>> response.counter_value,
>>> +           comp_to_str(response.counter.common.component),
>>> +           sev_to_str(response.counter.common.severity));
>> A bit heavy handed with nesting :D
>> You can use a local counter which will also help remove the wrapping[1].
>>
>> [1] 
>> https://lore.kernel.org/intel-xe/20260512191610.1817578-7-raag.jadav@intel.com/
>
> Sure will have a local pointer to response counter.


I don't see any benefit of having a local counter.  Even if i have a 
resp_counter or
common. I still see a wrapping here.

Retaining the same.

Will change in clear_counter.

Thanks
Riana

>
>>
>> ...
>>
>>> +/**
>>> + * struct xe_ras_get_counter_request - Request for get error counter
>>> + */
>>> +struct xe_ras_get_counter_request {
>>> +    /** @counter: Error counter to be queried */
>>> +    struct xe_ras_error_class counter;
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_get_counter_response - Response for get error counter
>>> + */
>>> +struct xe_ras_get_counter_response {
>>> +    /** @counter: Error counter that was queried */
>>> +    struct xe_ras_error_class counter;
>>> +    /** @counter_value: Current counter value */
>>> +    u32 counter_value;
>> Nit: It's already 'get_counter', so perhaps just 'value'?
>
> sure
>
>>
>>> +    /** @timestamp: Timestamp when counter was last updated */
>>> +    u64 timestamp;
>>> +    /** @threshold_value: Threshold value for the counter */
>>> +    u32 threshold_value;
>> Ditto, 'threshold'?
>
> sure.
>
>>
>>> +    /** @counter_status: Status of the counter */
>>> +    u32 counter_status:8;
>> 'status'?
>>
>> We should probably make these consistent across series', so let me know
>> which ones you prefer.
>
> Will rename.
> The status here is not the same as set operations. This says 
> active/threshold reached.
> I did not add the enums as it did not indicate pass/failure and is 
> unnecessary for
> netlink operations.
>
> Let me know if you want me to define those.
>
>
>>
>>> +    /** @reserved: Reserved for future use */
>>> +    u32 reserved:24;
>>> +    /** @reserved1: Reserved for future use */
>>> +    u32 reserved1[56];
>>> +} __packed;
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> index 3caa9f15875f..b7c4d8c37819 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct 
>>> xe_sysctrl *sc,
>>>       return 0;
>>>   }
>>>   +/**
>>> + * xe_sysctrl_prepare_command() - Prepare System controller command 
>>> structure
>>> + * @command: Sysctrl command structure
>>> + * @group: Command group ID
>>> + * @cmd_id: Command code
>>> + * @request: Pointer to request buffer (can be NULL)
>>> + * @request_len: Size of request buffer
>>> + * @response: Pointer to response buffer
>>> + * @response_len: Size of response buffer
>>> + *
>>> + * Helper function to prepare sysctrl command to be sent via 
>>> xe_sysctrl_send_command()
>>> + */
>>> +void xe_sysctrl_prepare_command(struct xe_sysctrl_mailbox_command 
>>> *command, u8 group, u8 cmd_id,
>> There's already a sysctrl_prepare_command() in place, so let's make this
>> a bit distinguishable.
>
> Oh..i did not see this. Thank you. will rename
>
> Thanks
> Riana
>
>> PS: I've used xe_sysctrl_populate_command() in my series but I'll leave
>> it to you.
>>
>> Raag
>>
>>> +                void *request, size_t request_len, void *response,
>>> +                size_t response_len)
>>> +{
>>> +    struct xe_sysctrl_app_msg_hdr header = {0};
>>> +
>>> +    header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group) |
>>> +              FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>>> +
>>> +    command->header = header;
>>> +    command->data_in = request;
>>> +    command->data_in_len = request_len;
>>> +    command->data_out = response;
>>> +    command->data_out_len = response_len;
>>> +}
