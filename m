Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851DC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 03:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8910E74B;
	Mon, 28 Sep 2026 03:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBslMN+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444E210E74B
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 03:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790566938; x=1822102938;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GTMEwHj1Xzzm6hRGoAHAuB9nU+PGQX8hSVVKEfk8P4c=;
 b=IBslMN+113al5o8DhNyjPcotIsz3xaMVlsRyF8KjoGbAqV2WVCFvKQjd
 8N+eK2Ah/R2yo4rsGkd8tWaB6P0CgKHe6W5kTT1Swskz617slKnxhn/bK
 U/kDaevarnyjtRC0pOfbUQrlHMBHxAGRfFrlVQyu8Jmz1PDb/bzyEAK3w
 oaGNfi9XUWTZZ6OPx4Q379ZgWekulvrjKZuvFaSi2YiFwyRDPQ9H0xHPy
 wOBlFgHf8oGFzXDzHyiWAlwJ9MNeMt5JEgBXS/ESkqfAS/Vafs7AM5YPk
 PlEnTdMNUZC4xC7qjonoNYtDwH9tcSA/Ml4/afTC7edX7FQyL2P9HeGj3 A==;
X-CSE-ConnectionGUID: c43/EZn3S0C82pOzEKN9Mw==
X-CSE-MsgGUID: 8ZIXsuRhTH+3CLjx1eh/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90383449"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="90383449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:42:18 -0700
X-CSE-ConnectionGUID: z05QYKzcQS6WCsSLihg4bA==
X-CSE-MsgGUID: ELkl5sZTRZK8ATWEbudUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="273074309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 20:42:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:42:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 20:42:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 20:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1c43ZunyqG5Opi8RTBQ+BXfGqwXyXG+ybGsfgna/iyGfhZR7VLDu8IbvsSaHeeSKVMyNgYb3moofGtvErF/gEN5RCN2qdbI13dnndjgMF/qsnlorJ7sc4BDllVwJnoct4VuhF+NpmBrVmXA3yszfGg8xwfJYKUCm1RB5h9j96rDx2OLqQ5L8VW8n14lCd7vfKs7trfwDylYKNRm9oZ70eLYGXty9xbCrQpBh8Cbqb6bcO+Sm4c52g1Xw66uD7RsfV0+VUvGdJbkwgb2d+mBfGcIeqcvFDEfysm/akWQ577hS+DfmHUlUHNHebhJXFRvOs2ngyAocX3ZGQgMQu9xFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTaHWX8ceAZqW/vxtJvawGx3nJoLvx8g1mxRKInodxw=;
 b=EGxG1dd0GpKkzoEwcOQaEHNXpLRpdEzYrbn7FsNg2ihslEauKxmrmELIzXGiYbOZjeCYVGhJlN5qzgUNRa2PKA4zmn+IPwblWgaoGG5rJp1aMVCvczAWMnVUylLAodJB03f61xWIRKSgoNRihZcVayKeYyKwdpwfQXziJSJnSvpP29tyT3OzkM8hkAyM1aKTvzBFh1IMfPsRrlcx/QAtqfKGB/Cw72G3e9SSm/M2b/cs5+EEvMa8DPXne+We3bchb8cgv7pnHFivJ+xDUYGDASVLbuBrPgkRBFf4PMNzZdNSkRbftZGl9t82kAGOPUotddpct+XRMkHCwws2KUEnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB7295.namprd11.prod.outlook.com
 (2603:10b6:208:428::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 03:42:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 03:42:14 +0000
Message-ID: <793bf539-62aa-4433-aa13-ec0d609cd7ac@intel.com>
Date: Mon, 28 Sep 2026 09:12:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
 <20260922043759.3057442-9-himal.prasad.ghimiray@intel.com>
 <arcmWgk9TsnR6Nbf@gsse-cloud1.jf.intel.com>
 <arcm+iAe5Ac7Yhab@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <arcm+iAe5Ac7Yhab@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: d266815e-f78c-4d50-1bfe-08df1d127c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zVNCbfU00CS//Ph5gZ0wXOjnc3ZHmaUh+XJmgb6HzYnft03ZB8WTDAbuKMzgVYkjxFFn1h9GXmvVdrx6SiVTKOIJVYnmL3zogOeMx3sMvqxK0KQxu4U7S/p2AEeMf6RHTFJsFD3PlNeWc/PWnCTidiBn68Yj7sHxT5tuzaMowCGQW9mkHirVGnSzacylRmGFcfXznuW8IlptcsiMsZzsjmgedp8cXw/phkazpQAHRlPsXQRG5QlSg6Sqomh5qOfurnLv/204JfsUuJF7IWal47Ui3zcx1UhCiRXt8doyq59cukdPGSl0Peu+dbuKXCMRhShS0R1vaJEPvDeT65A0+qkgL3qIbpjgRDOee5SUcxdsCNPBp5htwkIA+fO/yxapeCwLnF4tDx3RYzsFLT9y8ahhioSLd8IdWVFsvyNLhnFNz9KFEBhvoOhdaQ1Fo95SwHbK8IsJlIopFNJ9RoNHrHlp7OEMIuSUzt1HXoPspseHGOKQwJm2sO2IYXHEVKHbuniRqNH5EY/1Oi/y0L0D42OnnlenYpoxBOm18KYnw4Ed9kKHgSHEGOpuPIIYQlaFJNf9/XZpewHnIsaE1rakF+z0Ww3zIWveEjFxgvER1BCn+T39vfI6B07IJDrEWN76ZDB0dWdCsVPGGj6HJcneA3ZxoYS7L23HuIWacvNp5NM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y29vVGl5R3FQZ1hzeENqdCtwTWFrSGNqSXVJaldHS3F4Q1lvM3krTUN2Ulhj?=
 =?utf-8?B?bm9DTVpHclNHRmZudDlham9tTUtSQ0F4WW5IMGt6ZXBWRWc5MGdSZGtobVgx?=
 =?utf-8?B?N0NqTGdwSWhnQmI4TllTZDlVS1pMb0FkcUNEL1ZuMVZQQ1hpZkhhNUZqeTlm?=
 =?utf-8?B?OEk1MFFva3RoS0hSMXlHdHZmQ1FGQmRDSjE4SGxLWjBFZkFqT3VpYVI5azVq?=
 =?utf-8?B?VkF4b3hJUDZtMmFPdzZ5b1RGWGFqK2xvR2R0OTVzL04wL1hMMXhGQktDS1pR?=
 =?utf-8?B?bGRCbWF5dW9IeGxPUytvNkhVckRaQUlNNjl4ZmZnSU15aWdJRHlWTDNsZ3ZS?=
 =?utf-8?B?eXNrd3VtNkNraDIyK2VKaGlOdlFvMExjNHZhbG42a1FzaytqTDRVSHU4aUNk?=
 =?utf-8?B?V1N4ZjhndGRqYzMrSkFYV05EMWM1OW5TRS9jcHZXSDc0d2YxVElFQm5KSDFJ?=
 =?utf-8?B?VFlzTm5wYUt2VkRQWmdJcjJ2Q054T1l2alVRNlZTZ0xZREtKUjdlMjlzZFh4?=
 =?utf-8?B?M3hkaFdMTUR5VVBoQ0ZFQkIvYWRMZUN2YTZaSTI0MEFtL0JIaVNuTS8yQyt6?=
 =?utf-8?B?MjM3b2NQMkd3UlR0cVBuazlNKzdVZGY3TXZDZ0ZUdExmY1Z3aGVROUp6MHVs?=
 =?utf-8?B?WTVwVWhBV0FlbnZ5V3dOVFpjTVdVNGl1dWR0elVPNk02TVZOZ3ROZnNHdDlY?=
 =?utf-8?B?SHBONjVaSnp6VFNUeVJCY0RWa09WaG1QK2s2eDFhNERsL0ttME95ZDJ3YURa?=
 =?utf-8?B?UG16WWtmNGZ2VVNOK1ZINFZGQjB1eTB0L2V6a2ZsVk8vTVQzQlU3djFsdURX?=
 =?utf-8?B?SCs3SkZYTEpldTUxbnk0c05tb0JFSEFoVHBBS0xRandqZ3F5T3pQMGtOSGhF?=
 =?utf-8?B?V3Q0RURTZXM1WjBkemVnR2JTR0dRMWFyc3NEZ0xnQTBJSlVBeko3MkNIZUJS?=
 =?utf-8?B?dTRDQTg2Sk1ZaWZVYmRxdU1xRzZvL1Y2NHJoM0xrMTkzTWxhdUcxemtFc0NS?=
 =?utf-8?B?VC9nVnVzd3crem14ZzlXeUtBbE9NaG1mS2JTelRFcmlNbDFCQk9WK2YxVzRD?=
 =?utf-8?B?eXNmaitsRllyeHRFNGVieVM0dFRLNHhsS1JrRTlsNFhGbHIrZ2Npcit5UStz?=
 =?utf-8?B?UEdrT0ZpUGxyVkpVdjBQemJab3A0QVFpTDNxc0FzMmliLzVUYldVK25zWDVu?=
 =?utf-8?B?ajhOaFR4dE1od1RtQm40cjAwRnFoRHpFUWk3dzBWdnB3QkRrVUtBbi9UMWNp?=
 =?utf-8?B?ZVRWcFpURlNIQUVKRHBQS25KR3pGdmZiSC9TVlp2QzZsMWthalN4SWxXVHpj?=
 =?utf-8?B?OGN1OFB1U0FVWlVyanIybkk5VHVxaUswYnBSaGJZODZ5eUdQTXJNdUpCWllr?=
 =?utf-8?B?QkM1YU1HbklNTjFsemdqd2RvbzJYRElhaHEzaVJiWVFRNGFkZXh6VlNvOEtB?=
 =?utf-8?B?MmtRS2NiZnlxb3NsanlsQndwQy9NUzdOUkRHeXRkS2gzK2kwbHN0MWphZjZr?=
 =?utf-8?B?dXR6L2N1c2tVaXpIUXF6bXdXbWYyZFNpZGxVNlV3cnNKNWxWNnltWU5WemQ2?=
 =?utf-8?B?RUozMEVvVGc1QUJJZmhnNGtuaTNxRm8vVUZQMDVDajE3QmV6SHo2VkE3OU1I?=
 =?utf-8?B?VHVOVnBNVnNJZS9jSDNaWkhXVmZVc2s4bDg2emRZcGljMk1jSlVGci81blJD?=
 =?utf-8?B?MjkxRzBKU1ZBcWhLak41ZEhCZ2ZTTGRsM0RnMC9CeEdBTWJqNHZ4R0pqUHgv?=
 =?utf-8?B?Z0tQRTFrbFJWUEtsUDBYREt6Nm1QZEs5M2pRc0lkelo2RWRxS0Jxc0E0WHkz?=
 =?utf-8?B?VVdFWHpibm50SHNsaWp6RmVRd2szYzk2M2pNUmUyRVJTaUxHSXJ6TDQ0VU9j?=
 =?utf-8?B?cUhEbXVnbFQ3aDV2RFlPdXJZLzUrQzczNVVoK3Y5dVNFZWl5ci93VVpTOGVU?=
 =?utf-8?B?S2ZsVy8reEVLTGpJaW55UkxnZHEwSWhaZ2VNNUNSeS9EWStlVWhmVDJSams2?=
 =?utf-8?B?UHJnalNzeTZmVEw1Z2tuUFpUMmpWWHVaY29RQVl5WTVaTmhYU00yM1lHK2pG?=
 =?utf-8?B?bEo4MUpsbHhEUDF0QlVqeEptaTBYVjN5N3ZaTDdKUXlXQTlLc2twVlJXOVov?=
 =?utf-8?B?MVI4cTJkZEpHS3Q0YnNHK21acVpDWXpqdENZN2xuY2thdldocHdTazZ2YlNZ?=
 =?utf-8?B?UVcrdFpjVjlKdFJ0ZEt3TXNDd0R4d0N5VUxlMjdrQitqWURlTVdRK00yM3Jr?=
 =?utf-8?B?NG1yL1hCU0ZTOXhWZkcxK0xKbkFQNXBDRUZ1dGZLd0JtVW5ha1c3a0F3RVB2?=
 =?utf-8?B?TlJMSHNGMi8velZXK25YdHhOMm1sMitTaTBjcFB4RkxDN2tHenVad0pqQW9O?=
 =?utf-8?Q?O9n+pkEpA7Ce29ew=3D?=
X-Exchange-RoutingPolicyChecked: m+MaN3gEB5Mm+DeBVZtDT6b35yjdCBiJ1M+LA0TjESW3udBEXUGw3tHHCCypQTi8iRVCj5GFGAd0jR3mWxblGFBUcbt8kLDBEAedSxIE7GK7e06DYTKBU2+3hO6jBuJOWhf/5+IHg85yILX+5+dw6qhJiWCadvIGxPxGeIuJbtMXYqAvIcT8wqQYpVL3Rhn/ueWuYoCuSRHGEDiUt9CZyG7NaYquFSQJtQm38duk7byttc+Un/dpgTfhZFHgg+VXQ1KM2KnqXylZ3pcgvWDE4kJg5rnkZteSYlywizB9/tPuJ59kpfNMB7P+aMREe+jiFJjLVg/ogqQrzj2fzL+5Tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d266815e-f78c-4d50-1bfe-08df1d127c06
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:42:13.9831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHYoG3v7BzqU0wHhdC5XVY8+j6soeSQJrfj+ZinnXeoYB7wmGI2twRi8F7fqKzWZT71wtttZF24YkMVym2fZMGeSE7JscblIxqepYy8+zd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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



On 26-09-2026 07:29, Matthew Brost wrote:
> On Fri, Sep 25, 2026 at 06:56:42PM -0700, Matthew Brost wrote:
>> On Tue, Sep 22, 2026 at 10:08:03AM +0530, Himal Prasad Ghimiray wrote:
>>> Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
>>> the prefetch worker so each backing BO is moved to the LRU tail during
>>> get_pages.
>>>
>>> v2:
>>> - Guard xe_svm_devmem_lru_bump() against foreign device-memory
>>>    allocations before casting to xe_bo: return early when
>>>    devmem_allocation->ops != &dpagemap_devmem_ops. A shared
>>>    device_private_page_owner can hand us another driver's allocation.
>>>    (Matthew Brost / Sashiko AI review)
>>> - Add stub for function (CI)
>>>
>>> v3:
>>> - Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
>>>    references dpagemap_devmem_ops and to_xe_bo(), which only exist when
>>>    PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
>>>    (Sashiko AI review)
>>>
>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>>>   drivers/gpu/drm/xe/xe_vm.c  |  1 +
>>>   3 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index f39e647512ad..018836ecbb06 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -9,6 +9,7 @@
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/drm_pagemap.h>
>>>   #include <drm/drm_pagemap_util.h>
>>> +#include <drm/ttm/ttm_bo.h>
>>>   
>>>   #include "xe_bo.h"
>>>   #include "xe_exec_queue_types.h"
>>> @@ -1625,6 +1626,35 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>>   	return err;
>>>   }
>>>   
>>> +/**
>>> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
>>> + * @devmem_allocation: The device-memory allocation backing the range's pages
>>> + *
>>> + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
>>> + * the dma-resv trylock avoids inverting against eviction/shrinker, which take
>>> + * dma-resv before the notifier lock. A contended BO is simply skipped.
>>
>> This kernel doc isn't right.
>>
>> - get_pages() calls ctx.devmem_fn under the notifier
>> - the notifier lock is path of reclaim so dma-resv can't be taken under
>>    the notifier lock
> 
> s/can't be taken under/can't be taken with blocking under/
> 
> Matt

Will fix the kernel doc.
> 
>> - dma-resv also is an outer lock of the notifier when memory is
>>    allocated + migrated
>> - in practice because BO is private (dedicated dma-resv) a trylock
>>    should always work unless it moving elsewhere, e.g., eviction
>>
>> Somehow tie this all together into a coherent kernel doc.
>>
>>> + *
>>> + * A shared device_private_page_owner can hand us allocations backed by a
>>> + * foreign driver; skip anything that is not an xe BO before casting.
>>
>> s/xe/Xe
>>
>> Otherwise LGTM.
>>
>> Matt
>>
>>> + */
>>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>>> +{
>>> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>>> +	struct xe_bo *bo;
>>> +
>>> +	if (devmem_allocation->ops != &dpagemap_devmem_ops)
>>> +		return;
>>> +
>>> +	bo = to_xe_bo(devmem_allocation);
>>> +
>>> +	if (!dma_resv_trylock(bo->ttm.base.resv))
>>> +		return;
>>> +
>>> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>>> +	dma_resv_unlock(bo->ttm.base.resv);
>>> +#endif
>>> +}
>>> +
>>>   /**
>>>    * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>>>    * @vm: Pointer to the xe_vm structure
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>> index 2ef4ef026ccd..585ad64b672b 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>> @@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>>>   int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>>   			   struct drm_gpusvm_ctx *ctx);
>>>   
>>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
>>> +
>>>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>>>   					const struct drm_pagemap *dpagemap);
>>>   
>>> @@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>>   	return -EINVAL;
>>>   }
>>>   
>>> +static inline
>>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>>> +{
>>> +}
>>> +
>>>   static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>>>   {
>>>   	return NULL;
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 6b793ef31537..0fdc740f1a41 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3260,6 +3260,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
>>>   	ctx.devmem_possible = devmem_possible;
>>>   	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>>>   	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>>> +	ctx.devmem_fn = xe_svm_devmem_lru_bump;
>>>   
>>>   	skip_threads =  op->prefetch_range.ranges_count == 1 ||
>>>   		(!dpagemap && !(vops->flags &
>>> -- 
>>> 2.43.0
>>>

