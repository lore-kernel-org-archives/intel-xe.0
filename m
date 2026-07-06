Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3845C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 13:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC8F10E303;
	Mon,  6 Jul 2026 13:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER7Mgpdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344A10E303
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783346381; x=1814882381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JW5g8MIxrW5kIVtmO1oZcKkz48pInfmf7oFqlhk9kU0=;
 b=ER7MgpdpcaHZMKDs+npOSwmkMyLYt0GMyudUD5cZiS6s9ZBVaXLWYxQz
 /WVF4kW+K5kVU8FsguO50FZ2AvmOyhsfCQu80P7pIhbDBkWWgf/EbA05x
 cXCgVInwh5AT1YQYEftvxM3k2vcsSPLCBWlzuLyySevXzfAtVJS4ySb7u
 aQKIAriz1agoBqKlD5QShAjsPiCbLk0kUefkdHD+9BQDWe5lyGqKChH48
 L/SXYgWcbJoZK1CASUt9lb90PLvuI3Rb9ld1B7HzUuYJV+yiRttcrQA0m
 2RgWHva0ycDbF4xS8b6HjyEz4J8hc1n65UwyfhjFsozTzhDN0HamVKlw/ A==;
X-CSE-ConnectionGUID: qVW3wyfjR5u4BZLUXj4qag==
X-CSE-MsgGUID: zuCJp+J7TXG4ogMzocCDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="106778541"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="106778541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:59:41 -0700
X-CSE-ConnectionGUID: qKFKz27AQ+qFIOCNBMAhdw==
X-CSE-MsgGUID: N1FJpBJZRP6BKjUeil9bZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="257305549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 06:59:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:59:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 06:59:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiXiOiLCd6gJ4HLOTnavwK+5yMmoXbDNx/57uIPq4LWXTkVZ4E7fmx9OQZeQhf7GnX7t5vC2Z9+QHDXb8iZh5Grbs+ClhbbBJJiC6Z0qkjb+OTg77THYyqhr6o8VVqz2BoqXQ+zfzwUKriw5ofWiOKpDaDvA0sECDuZZfV4hraDClgTwJOH0jLOLP2RLfQ86vYZZjLyrXVlcUAPpHfFgKaXE/qeKb1C83k0pcycNBo3oFU0X4eFOi+A2CrMdcyAwzKhLPxiNiA3BYM3cOg3OZfmPUFAr/zGI2Wazs3wgOAFQOSmNNMoiUqiB+7d21sH0Vem2D7TzqWi5dQchsJ6dGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEm1JmFY1iJfLtQPKxC5l5vDs4Bm0KM3YiTmpLOALYU=;
 b=Nu98bkqZ0BqFnlaClhSfz/6vUQuZMbkF+8aDAS00zLbdgywtAlbUQbXT6g1GtZnNyjt9HGi5eKBlnyg62rICBnAhrczBvu8J4NGiwBnor8NjxU7852ZASnf1SyiOVWXITY54AoHFYMCt6JTP76lIG5tFkoptP3t2g/fptFs7G1G4kreoNxGf/dp+L6MPPABVJ7A2YkvPwdv6BncuRkPAOAIKTVIFM9wydjThZHcQWZJXsKW37XmxIGFCRvQfD65VaLAwTizw4wY/AvoSJe8IFZPTYWvCqYp4sccpiYYCsgaU3Rivppw7o7aEhEsroPYu90BrZFzrIRSWt5QDhUrK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5878.namprd11.prod.outlook.com (2603:10b6:510:14c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 13:59:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 13:59:36 +0000
Message-ID: <4141ff43-62f6-400e-a27c-edd80530b98c@intel.com>
Date: Mon, 6 Jul 2026 15:59:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] drm/xe: Add SIG_IDs for RAS error logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-8-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260630115503.407158-8-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0120.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::49) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7ed684-1c5e-4770-7f2f-08dedb66cfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|3023799007|11063799006|5023799004|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: WIPZcY5dAXL2IOrDfvBVwzkSppHjXL4ApfjB/ECslR6EJyvblve+qr+euifa8vodb+zuFWgykWchW+Z35JAbenCThzasVJ/XyMkpsEpQSkeKMEaNrJi7BKINzQ8RHA24jTcY/K62odRNHlen8QvyVGrSnzk0KcddW1y5ZOhdHpJlvJ1hr4A0vyEcnJIu8R4Q9iUlBe2E22sE62lufduvUxWbyV9wP/Yf91p1OqfqvYajr1uSW2MkbWE+uiJooRDTPrTMymDrASxAHQXpsBc+QF9/hbM0m0ksDjVUeAzho+jt1fNYwJjNLkKt2pGfmylOu528njmuoOGmK5FOOJVY7pftaPfxT/PshdMDlqPhDfJNDErmDRq1xmAGTLsHVkyAP1NyyPQz5sR+NDO3JBTen97mFQbw5n7kJe+D2xo/osFJSVigTv01r/8dkdh/HnBhKOsABEBQDImmZxSwk7mLvXjaHN4IGH3N4C9VemORUDM2tB2ef1RFHDO/iQXZq86JnpN/a9JcHd8dI4/da1yVEjgKTVIRv2/SBwyTPagblzmY4fadFiHSgcs6DbkdjZSWsSXRRXXrnLGtnf1E07HFs4YbvpJqAczgMyzPn4zF0pJMnYeVtuG+/L0hRVmvIJL8ch7vO6nlvivzKzr1luMo+budgLaaobQE8/3BeAShOtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmVYQ1ZnaCtqY1dZeE9mZFN4L21QTHZNdm4vbUsrNnI3T1BMUEViay9ZT1ow?=
 =?utf-8?B?UGJYbTJmYVlGUDltNmYzWGJoeFBUdUJmSHF3NmFMWjZkUWY1UXR1dmJYemE1?=
 =?utf-8?B?dktIMkQzd2lKV1ZPdGlzdExQeFJ3emNXNGkzbVc5cGQ5aWQzbEZyaEMvVWZp?=
 =?utf-8?B?bnJtdWZ3ekRQc0hkU2V3UVMya0JlY2ttbFl1MDV0bC9ZNTJURDI3SE1nTEti?=
 =?utf-8?B?c00raFJPU0RKcEd5L3RyY001SGVsTnNabUYxOXBBbFVNaS9zMXdyOGJIcWl4?=
 =?utf-8?B?Q2QxY3RTbTZDSnFsWnhTZHpjZEt4MlQ3ZVg1dUI1VDVjTG50Z2dvaVJCTDE0?=
 =?utf-8?B?bGhKYkR2dlBUWS8wMU1ReS9FTVVRSHNXaXdYTU1PS0dBVm5YZmFGRy9odWtQ?=
 =?utf-8?B?WHN4SnBDK1VqdDNyWUM4V25VV0RrUW9GRjlXMXFKVzZRdTdNVVM0VEZ0eVB4?=
 =?utf-8?B?QVZHQXZPTUVmZUtVenplT3Jzc0lwbG9IMHN3Q29YTTlXOVI1bWFlcDFBSzRv?=
 =?utf-8?B?KzUvS25vMjBpNU9qclhtT3lvZklpRjF4WnduZitiZ0Y0c2t1WHJpUE5FZVow?=
 =?utf-8?B?bjRSSXZJT2tPUFMyVXlYZjZMbU9mVkttR0g2QWVqbHIvWWRtd1pXc3R5UXM0?=
 =?utf-8?B?UTU2S1RNM3plVmRHcGtvcnRCQ1pHcXhKb05ZcjBGTmd5aUFaY3MxVUVaYWFs?=
 =?utf-8?B?alNvRjVuYlhGV2wvYnFLNExPL2QrUFpJWEFyWFd5LzFwMzBaQU5JZmV1U3Yy?=
 =?utf-8?B?NW5OOTA4UjB1bVpCRHRLMk51c2ZxSUVyZDU5NzJoNm12VEE2ZHY4NEdpY3NV?=
 =?utf-8?B?VGdyeUk4K1ZVNGhMTjdJVEYxVUdRSDV5MDlqNnQ3eEVCL1pkYUUrSUNTOTN3?=
 =?utf-8?B?Q3hHcGppclFYUk9pS2Z1eUllVHlLaG44WGpzY2thbjFXOTZmTEdISkFiSUZv?=
 =?utf-8?B?OXdHeitNeGNIdEsvZ2YyTGM3U1BIZFl6dVJOem1OVHdzK3lKY1ZDV3VxSjc0?=
 =?utf-8?B?UE5BN0RPUUNWeGdRdkxuRzlMRkdVWWpqVjdDN0h4ckZXNkNnQnBabzhtcXpW?=
 =?utf-8?B?YkxteHZmdnh0QjMzdzdabGtPSDJ5QVFONW4vYTJqNlc0QjRkUkdLSzlMdGR4?=
 =?utf-8?B?VmVLWllTNHBSMVhDbnF4bW5xOHFjZkN1OWpVQWh1VXE1d0x2dmNxbzZxKzlG?=
 =?utf-8?B?S1JjRkVtendUZE1MSCtwRGRsS3hSeit3Q3d6cWZrbVdCL0VNVG9FdEYyRE1O?=
 =?utf-8?B?RlduYWFJM2lEbDR4REt1N1ZsYXlPdHRBUEJmWmd3WFJDY1pTTzI5djBMS3lE?=
 =?utf-8?B?WDdQWDZMVmhYQTJtdEdNay9ZcU5uQUxST0ErT1laYUY4SlFHMlUwNmRia05E?=
 =?utf-8?B?S3c1Nmw0a0lmOXF5MmZwbGJyelFwbXNya0hjQmxyWHBVTnNTNWZEWWZNUjQy?=
 =?utf-8?B?cTZvQ1FkU3FhUG14YUtjS3gxd3JNdzdJYkU5eldJeHQwQ1JqVkMxUkNYYlp4?=
 =?utf-8?B?clY2VGRRdGZ2SWdlRWEwVHlvZnU0Ris5ZThFYy80VGdma2pvR2RvZUdaQVdG?=
 =?utf-8?B?TmYzeFRpNGllQzhMRVYxWGFvRE54d2NoODRiZFNRVkV3WVpONi9ZSzUxYWIw?=
 =?utf-8?B?UnlCS1VzYm1oVGlrTHF5ZDc3dlQ3M3gycGRUTk1ha1BlTUZFNjc2aFhFZHNq?=
 =?utf-8?B?N2l5QVhrckZaV1NuVlAvcENva3hUcmJRcHVReS9YcDNVWTFIZ3lIbGhZNnlx?=
 =?utf-8?B?aEFPM0R5a0U2MzJBanhSd1Y0aVJFQVZ3UXp6YlFUZjcwZkdkZXpMNGFHYVI4?=
 =?utf-8?B?akFwamIxZkYxV05NM0Q1Y2RTcU1MK1JBSDh1T3UrUVAwSk1Hd2lWQzlrZ2pP?=
 =?utf-8?B?SHFvMUZpWFJyeVhTa0NUYys1SUNZb3JYQVVLOXhEZ2JpZmxENTJJWVJSNHg0?=
 =?utf-8?B?VVFGbkx4endla3NqVW1YWlhsUHFTNU9YRzJQSmk2dkltWXI5MHBkRkhkVVc0?=
 =?utf-8?B?bGJGcEZEM1RMYml4THMvNko5bmRIbGkrQTBqa3BFYllTb2xUNjFaQVVlU1Yz?=
 =?utf-8?B?aEtOWVYzV0gzdS9VUzk1YTJURFpaaXl0Z3lsaytHQUpVVUUwSS96alc1ZnYv?=
 =?utf-8?B?a0lQdm1lZ1JxTGlDVEh1N0VxMWtaOEsxS1dRdEpFVTJmeE5YTzVzVHBNVEJK?=
 =?utf-8?B?QUdNUjlVRG1RRmQ2OFJtalNXMVhHSFgzNzgyQTdDN2VBMjh1Q3pqT2xqZlV3?=
 =?utf-8?B?Uzg3RFdJeC9UVHpBZysyZGxGMThkaHJhc2YxMmpURUsrcTZ1Tkp1WUpzV0Nn?=
 =?utf-8?B?eWo5cXR2b0lQS0FCV1lTeHo0Vm54Nkk2bkVtM0Y3NTVnV2JvaVh2WmJ0OVJP?=
 =?utf-8?Q?LRSe8v9b8KGgF7YQ=3D?=
X-Exchange-RoutingPolicyChecked: LlShnVVSWBahx0hOFBpQHADVxKsMPlUfBjWi2FvVuJN4AvAKc66h4OrlSaBtScyYLeAYeGYU67ETCu+TGb6bbcdVNUBM6R5/QbTkFrw7oTp/6VbQMbi0/Tp0/xDez9eXRuj6MYff2xSyAE/HgFS+2TmIax4cIQLlOoF1gTnoxEcX9BqJ3gev+kZXuJs1FoEjq+OhffKK6nB+df/TL4/bwjH1n85XR7sy3YtPztgMZUxcVCJPHySL5kaLlsQfwfnJEeOxsD/Wus4W7pfIEvHCEeEvTicHaBcnzkOfNcPJCCspffpzkpE3timJeTrvsfNySqQd1hMOcuRPTTs0EguH1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7ed684-1c5e-4770-7f2f-08dedb66cfef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:59:35.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYBsMtdNJXrXaiDYVXGo78pKridExE8kFr5EFdNbzLCgxkNYhcsZBjJREskzx3HkKD4HOo+0QD+ILqS38x424t6PPUVzRyuvbu01rT5hTAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5878
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



On 6/30/2026 1:55 PM, Mallesh Koujalagi wrote:
> Add xe_sig_ids.h 

nit: the file itself does not define any labels, there is an enum there
maybe just say: "Add stable numeric labels for ...

> which defines a set of stable numeric labels
> for Xe error categories, called SIG_IDs.

hmm, quite unusual transformation from "categories" to "SIG"
maybe: "referred as XE_ERR_ID"
> 
> Each SIG_ID identifies which subsystem reported an error (e.g. probe,
> wedged, GT TDR, firmware). 

from the above list only firmware seems to be real 'subsystem'
maybe stick with the 'category' naming?


> It does not encode the full failure details,
> those come from errno and the free-form message:
> 
>   SIG_ID  -> which area failed
>   errno   -> what failed

hmm, errno is also more like a category of the failure, not a 'what'

>   message -> extra human-readable context
> 
> Also add a DOC: kernel-doc section covering design rationale, driver
> severity labels (FATAL/RECOVERABLE), usage guidelines, and the
> distinction between driver and hardware error paths.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Add HW SIG IDS details. (Riana)
> 
> v4:
> - Change commit message.
> - Update the document. (Riana)
> - Move documents to xe_sig_ids.h
> - Update Hardware error.
> - Remove example in Hardware error SIG_ID.
> - Make Fabric errors.
> - Add kernel doc for SIG_IDS. (Michal Wajdeczko)
> - Provide severity details.
> ---
>  Documentation/gpu/xe/index.rst      |   1 +
>  Documentation/gpu/xe/xe_sig_ids.rst |   8 ++
>  drivers/gpu/drm/xe/xe_sig_ids.h     | 124 ++++++++++++++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_sig_ids.rst
>  create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..557877837348 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe-drm-usage-stats.rst
>     xe_configfs
>     xe_gt_stats
> +   xe_sig_ids
> diff --git a/Documentation/gpu/xe/xe_sig_ids.rst b/Documentation/gpu/xe/xe_sig_ids.rst
> new file mode 100644
> index 000000000000..0e65d577927b
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sig_ids.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +SIG_ID Overview
> +===============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_sig_ids.h
> +   :doc: SIG_ID Overview
> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
> new file mode 100644
> index 000000000000..57e4037fd7d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SIG_IDS_H_
> +#define _XE_SIG_IDS_H_
> +
> +/**
> + * DOC: SIG_ID Overview

The Xe Error Signature Overview ?

> + *
> + * Signature ID (SIG_ID) is a stable numeric identifier (u16) for a defined
> + * Xe error category - it answers: "which subsystem reported the error?"
> + *
> + * SIG_ID format

just above you said that SIG_ID is u16
maybe this section should be: "Xe Structured Error Message Format" ?

> + * =============
> + *
> + * Xe error events are emitted as a single structured line using stable fields.

I guess we should first explain our plans how/where we want to use this new
error mechanism, how we will capture/expose those and define the mandatory
fields that we expect in each new 'structured-error'

then we could show how those fields will be exposed in dmesg

> + * Driver events use:
> + *
> + *   [xe-err] SIG_ID = <u16> Severity = <CPER_SEV_*>
> + *            Location = <device|tile/gt> Errno = <neg_errno>
> + *            Message = "<free-form text>"

this heavily deviates from what we currently have in xe via xe_err() or xe_gt_err()
without any benefit, just making the output less readable for human admins

> + *
> + * Hardware-originated RAS events use the same overall format, but typically
> + * omit Errno and Message and instead report the hardware-derived location /
> + * error-class information.
> + *
> + * Important
> + * =========
> + *
> + * SIG_ID identifies the reporting subsystem/category only. It does not encode
> + * the detailed failure reason. The detailed reason is carried separately by::
> + *
> + *   SIG_ID   -> which subsystem/category failed
> + *   Severity -> how serious the event is
> + *   Errno    -> what failed (driver events)
> + *   Message  -> human-readable context
> + *
> + * Example (driver event)
> + * ======================
> + *
> + *   [xe-err] SIG_ID = 6 Severity = CPER_SEV_RECOVERABLE

"[xe-err]" seems redundant, as the dmesg line will already have "xe" and "ERROR" tags

"SIG_ID = 6" will provide zero clue for the human admin what subsystem/category it is

"Severity = " seems redundant as it is followed by the "CPER_SEV_"

"CPER_SEV_" is also redundant as "RECOVERABLE" tag alone is fully recognizable


> + *   Location = tile0/gt0 Errno = -5

"Location = " do we really need such prefix ?

"device" - redundant as it doesn't bring any value
"tile0/gt0" - differs from "Tile0:" or "GT0:" used in regular xe_tile_err/xe_gt_err

"Errno = -5" this is a step back, as in regular errors we use friendly error names
printed using %pe format

> + *   Message = "Engine 'rcs0' hung; TDR triggered, engine reset succeeded"

"Message =" do we need such prefix ? everything after a errno can be treated as message


so this message could be rendered as:

xe 0000:00.0 [drm] *ERROR* \
	TDR RECOVERABLE Tile0: GT0: Engine 'rcs0' hung; TDR triggered, engine reset succeeded (-EIO)

without loosing any info and being close to our regular error messages that we have today

xe 0000:00.0 [drm] *ERROR* \
	Tile0: GT0: Engine 'rcs0' hung; TDR triggered, engine reset succeeded

> + *
> + * In the example
> + * ==============
> + *
> + *   SIG_ID 6   = XE GT/TDR category
> + *   RECOVERABLE = workload impacted, device still operational
> + *   -5         = Linux errno (-EIO)
> + *   Message    = extra context for triage
> + *
> + * Why SIG_ID exists?
> + * ==================

I guess this should be earlier in the DOC, as we should start with the
rationale, and have examples at the end

> + *
> + * The goal is to replace inconsistent ad-hoc error strings with a small
> + * set of stable, structured error events that are easier for operators
> + * and tools to understand. Each driver event carries a fixed SIG_ID with
> + * a severity determined by its error category, and structured output that
> + * can be consumed consistently across driver or firmware versions. It
> + * reduces guesswork during triage and allows machine parsing of important
> + * fault events.
> + *
> + * Driver severity labels
> + * ======================
> + *
> + * FATAL means the device cannot continue operation (e.g. probe failure,
> + * device wedged). RECOVERABLE means the driver encountered an error but
> + * may continue with degraded functionality.
> + *
> + * When to use the xe_ras_log helpers (see xe_ras_log.h)
> + * =====================================================
> + *
> + * Use them only for defined Xe error events that belong to the published
> + * error categories. These helpers are intended for important fault paths
> + * such as probe failure, wedged device, survivability mode, firmware
> + * failures, GT hang/TDR/reset, memory faults, and runtime IO/bus faults.
> + * The selected macro fixes the SIG_ID and severity for that category.

fixed ID/severity mapping seems wrong, as the same subsystem may have different
errors with different severity and different recovery actions

or our ID definition coverage/usage is wrong

> + *
> + * Do not use xe_ras_log helpers for all logs
> + * ==========================================
> + *
> + * These helpers are not a replacement for normal drm_info(), drm_dbg(),

what about xe_err() ?

nit: we have and use xe_info/xe_dbg
> + * tracing, or one-off diagnostics. They are for stable, structured error
> + * reporting only. Using them for ordinary logs would dilute the error
> + * stream and make operator-facing fault reporting noisy and less useful.

who makes the final call whether error should be reported using xe_err or xe_ras_log ?

or, actually all xe_err() shall be converted to xe_ras_log as 99% of them are
about the HW/FW/DRV errors anyway?

> + *
> + * Hardware errors
> + * ===============
> + *
> + * Hardware errors are hardware-reported RAS events and map to the
> + * XE_SIG_HW_* identifiers. They are reported through the hardware error
> + * path (e.g. CPER records), not through the driver xe_ras_log helpers.
> + *
> + * Unlike driver xe_ras_log helpers, hardware events do not have one fixed

while this is inconsistent, it actually shows that we shouldn't have a fixed
mapping between ID and SEV

> + * severity per SIG_ID. For example, a fabric event (XE_SIG_HW_FABRIC) may
> + * be reported as CPER_SEV_CORRECTED, CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
> + * or CPER_SEV_INFORMATIONAL, depending on what the hardware reported.
> + */
> +
> +/*
> + * Driver errors: SIG_IDs
> + */

please use correct kernel-doc formatting for all categories

/**
 * @XE_ERR_SIG_PROBE: failed probe error signature */
 */

> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_RUNTIME_FW		4  /* RECOVERABLE: GuC/HuC/UC/GSC */
> +#define XE_SIG_DEVICE_FW		5  /* RECOVERABLE: PCODE/CSC/System controller */
> +#define XE_SIG_GT_TDR			6  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		7  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			8  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> +
> +/*
> + * Hardware errors: SIG_IDs

any reasons to have them grouped (driver vs hardware)
any reasons to have them contiguous (driver followed by hardware)

what's the plan for future additions of new categories?

having an option to define 64K unique IDs, or even more if u16 is just our limitation
why not pre-define each ID for known component? and make it really 'structured' ?
	
#define XE_SIG_CLASS_SOFTWARE		0x0	/* SIG = 0.*     */
#define XE_SIG_SUBCLASS_SOFTWARE_OOM	0x1	/* SIG = 0.1.0.0 */
#define XE_SIG_SUBCLASS_SOFTWARE_PROBE	0x2	/* SIG = 0.2.0.0 */
#define XE_SIG_SUBCLASS_SOFTWARE_WEDGE	0x3	/* SIG = 0.3.0.0 */
#define XE_SIG_SUBCLASS_SOFTWARE_OTHER	0xF	/* SIG = 0.F.0.0 */

#define XE_SIG_CLASS_HARDWARE		0x1	/* SIG = 1.*     */
#define XE_SIG_SUBCLASS_HARDWARE_BUS	0x1	/* SIG = 1.1.0.0 */
#define XE_SIG_SUBCLASS_HARDWARE_DEVICE	0x2	/* SIG = 1.2.0.0 */
#define XE_SIG_SUBCLASS_HARDWARE_TILE	0x3	/* SIG = 1.3.0.* */
#define XE_SIG_INSTANCE_HARDWARE_TILE(x) ..	/* SIG = 1.3.0.x */
#define XE_SIG_SUBCLASS_HARDWARE_GT	0x4	/* SIG = 1.4.*   */
#define XE_SIG_INSTANCE_HARDWARE_GT(x)	..	/* SIG = 1.4.y.x */
#define XE_SIG_SUBCLASS_HARDWARE_CORE	0x5	/* SIG = 1.5.*   */
#define XE_SIG_INSTANCE_HARDWARE_CORE(x) ..	/* SIG = 1.5.y.x */
#define XE_SIG_SUBCLASS_HARDWARE_FABRIC	0x6	/* SIG = 1.6.*   */
#define XE_SIG_SUBCLASS_HARDWARE_OTHER	0xF	/* SIG = 1.F.0.0 */

#define XE_SIG_CLASS_FIRMWARE		0x2	/* SIG = 2.*     */
#define XE_SIG_SUBCLASS_FIRMWARE_GUC	0x1	/* SIG = 2.1.*   */
#define XE_SIG_INSTANCE_FIRMWARE_GUC(x)	..	/* SIG = 2.1.y.x */
#define XE_SIG_SUBCLASS_FIRMWARE_HUC	0x2	/* SIG = 2.2.*   */
#define XE_SIG_INSTANCE_FIRMWARE_HUC(x)	..	/* SIG = 2.2.y.x */
#define XE_SIG_SUBCLASS_FIRMWARE_GSC	0x3	/* SIG = 2.3.*   */
#define XE_SIG_SUBCLASS_FIRMWARE_OTHER	0xF	/* SIG = 2.F.0.0 */

#define XE_SIG_CLASS_DEVICE_FIRMWARE	0x3	/* SIG = 3.*     */
..

the number of IDs will still be manageable IMO

to build final SIG_ID we can have some macros like:

#define MAKE_XE_SIG_ID(_CLASS, _SUB, _INST) /* SIG = class.sub.instance  */ \
	FIELD_PREP(0xF000, XE_SIG_CLASS_##_CLASS) |\
	FIELD_PREP(0x0F00, XE_SIG_SUBCLASS_##_CLASS##_##_SUB) | \
	FIELD_PREP(0x00FF, _INST)

and use it as:

	xe_err_fatal(gt, SOFTWARE, PROBE, "message...");
	xe_gt_err_recoverable(gt, FIRMWARE, GUC, "message...");


> + */
> +#define XE_SIG_HW_DEVICE_MEMORY		9  /* Device memory errors */
> +#define XE_SIG_HW_CORE_COMPUTE		10 /* Compute/shader core errors */
> +#define XE_SIG_HW_PCIE			11 /* PCIe interface errors */
> +#define XE_SIG_HW_FABRIC		12 /* Fabric errors */
> +#define XE_SIG_HW_SOC_INTERNAL		13 /* SoC-internal errors */
> +
> +#endif /* _XE_SIG_IDS_H_ */

