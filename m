Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F81606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ljd8M9wS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92B910E620;
	Wed, 28 Oct 2026 11:36:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0310E620
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793187393; x=1824723393;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eVqXFxf9Jp/BR/g8Bh7vwmpVIwEZD+Nj7aN8XUee+uI=;
 b=ljd8M9wS7hgbbPAFjro8GCKvIL3qyusoDktRTkWWSF1zh66vdx4NciOH
 MCyvTfInWVmxbVSx5IioCnValr+muADuavYy1M/r00lTWZnzwjetpqmYT
 cTtZWnGRipPD6lkglYgxtdKgIIPebMhsx14Dr5/qHRwbYzwo/BWKJmq02
 q2bBlwPCGe0mfewS2CbHJ+0EUuWRSUDdRhfRYbEbfa6xyiiQty5Ti13A+
 YwXdDoaptAPffvH1Pk8fOJxGarTE3c0CJGXFXgMMG07GRRrS1JXyjhqx9
 0wXhHyDueZ+go9iA8sNScqsRz8xCG73O2SLg97UjG8g1QfOC5MorpEKzC w==;
X-CSE-ConnectionGUID: uYCqC8EVRbqcnRxT9euRkw==
X-CSE-MsgGUID: i2mVoE3rRpGXNBLfAs+sBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1920024"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1920024"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:36:33 -0700
X-CSE-ConnectionGUID: Zack04DYSyKqGSL/mcz4qg==
X-CSE-MsgGUID: E7xEQ4GxSMW47FGcVTOobw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6585884"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:36:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 04:36:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 04:36:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 04:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRAC/upLdRXvMasNAKDV+/b2rdpCSStu05z0qrAcNVvO5mHqb7LspT0FGp1r5/sWruBYeTaf1BaHlYb5/dEkd0vn0RV2gX+weAAk/FzLhrAhz9IXRI8l13fDEppvp7KKPbdM/9j02FEawtI+URjrWBhTCZX5N6LPBMEFfQFCw1T9xiBye3TjXym+mnMsZHbOgcjnUJTaaW9erBZ1ZjJv3kFn16OGuf/2hPuK7z+2iAj96YdY8yb+zb/0ex/8Uw1WU/3TN+BDEnev8EtcZHf8+IBbakPDuK9bkJfV+RIyDfmh+ztatKGJF6dkEGskmD0VnWnvw+2jfq1zFB37TqttzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiigxQbUvW9b5JGJoQ6Js4rEZs18s3iDWrDOsXaJbgU=;
 b=ZdJY4ZxNhksEqTaV8LafLYj0TN3ylPHWj6ZQKc7aPPyjBAtw00h6RnYC32uxv8RRcxW9hedKj036TEHfm/hTz4nHhfr+0xdBGTujhGAtleDTN5duU0VB5+e7X+JDINOX3Z8vmUJ0vXrz9O01l+eUbPkC3nJ2P3kkZO7nx01GZQ/Erl4LhFS1QcifSpXgM7hugJf9jPPfiB9wu+MUstNp5aM1xUPzEYqVq4SBwDxOxhGbZwrPZWFaQa1qUzeZnGpv5XVxKnah6JNtxRDzH+9oAumgW6MGqQCwJ+91lONWWZS/bt1m/cm25U0Vqfc37gAog5ewc+v23Tr66L2UyzI7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by LV0PR11MB135625.namprd11.prod.outlook.com (2603:10b6:408:3e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 11:36:29 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 11:36:29 +0000
Message-ID: <239f14f8-87bc-4671-8564-edbe6b14481a@intel.com>
Date: Wed, 28 Oct 2026 17:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
 <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
 <507815d9-811f-47ce-a449-e7cf9aeb05cf@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <507815d9-811f-47ce-a449-e7cf9aeb05cf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|LV0PR11MB135625:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dbaf4b-7b7b-4163-ee60-08df34e7b4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022115727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lJB1lOIHbY8/vdyVE90up4nRGeZmNg2ZGGvbXHgSvV4GJ0zh32yi+gHa2DVK+sg1aYjkiP+qw6EnO6s9Y6wVPlK3WNt5Damkc4tGfso0aHq/7RfNW34bLQ61xXK7sozc1DRUzo3+2rsCZbfJbPWA1RQMYDQiHyonARuU17Df3UcZ9lsPv0B65qblSkz7+DoTzwi5pAFE2NTVnZdj9btPwqt6Lm6KPqU+u5OvunMYrPqC1cpDO4bGTxTV3R4sAC3Alw5shOMYmJeoOqfo4goLk9+6YtG2s+pt2+wjABkGgysDkrFHAGuxCV789R+8Oamr76DYk2iCprmeZgcN9IWRWEqPC7cLeuYis2aXF6f+2NfLZPhKOmdoVniWWxA+eISRug+EDcCr1dvx5aFVODDnTWQxTZj0pK1elY5QXEll0MwIEgj/DBaqvnf6LSCoPRdMQr15DOAVUbYm+mjPw6ewcXZ/pmU2zjWizxsq15V8JEiqo6Ut6DD34tGxzlMvNw71zb99NYQs+Ji9yOGj2OY2zkGiomOjcQ4zv/zLKHX3skh+wvK6yuerdV2upjAMDWu/MSbH8OXvQ+4eSueNSt9So5Lm2SqV2Zuw8FnHskLu/uDAc+mOsY/F/2P866zjvQU/r2lNetJmjMSaoPLVdjEbMFF2MIwEnkwxn4ZfXe3/W1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1YrSitibFdub0dIQkhsUnhVdDNLUlkxY1hUQ003aVlkMWlOdDdqazk1SGd5?=
 =?utf-8?B?THRyS0xpSmg0eC9yNVNHTTdScnA4dzRGN2ViTlNUN1dielk0dGtsWncyQUlP?=
 =?utf-8?B?Vmx5VVpqanFwMVpWYUJoME02bUw5T2NuazdqeGdUSU1QTmxDSGprUTQvQ2pm?=
 =?utf-8?B?S1lKenJQdEVzRDFhMzFNZlBmM21FTFVGMERiTk5rUXBhQnlHeUZsUmUrYTBZ?=
 =?utf-8?B?clE4TDM3dmdiRlk1VlRHQXVhNVlPQlFYTXozS2lzK0pnMHVidmVPcFdMbVZN?=
 =?utf-8?B?R05pSGpPVXp0QnViWlVmb1dTRGV6NU11VDBKQlNIUUh4QU1RMGowUXdQTjBL?=
 =?utf-8?B?TU9lS3QrWEVJVEUyem42dEpaUXp4RFRXMmdpZThVTG1yNmZ0UjRJazFmM21S?=
 =?utf-8?B?MWE1d1VjUS9rbHJPWFlETC9MdC9YeTNxbmlYWFJDaXlqbjNYcXd5cGdBNGQ5?=
 =?utf-8?B?dXVnclp5Y2ozblBXK2d6SGRMR1BVUENDckFnRlM4RUN1SWdqdGcrTVk1Nncx?=
 =?utf-8?B?bFQ5OWk3SlZzYzJYalZCV1ZyaHZqMWoxaEtQaC85MFJGZTArdW1PZFcxVklV?=
 =?utf-8?B?bzNYV2FyRFNubysrNmFmaWJOUFd0MWdEWWFUU0s2aERYZW5yV0tscnI1UWgw?=
 =?utf-8?B?QzBTY3R1NEoxc2o0MGVUOGNXYkxDQUFOOGJMUDNnT2VEcXgvVWJGNk5UY0M4?=
 =?utf-8?B?cWFOZTlWR044L2NFdDZ6RjcrL0xGSU5wMkFJV2dOVk00WTM1UkxOdCtBaDVm?=
 =?utf-8?B?aXBFemhtMlZjelBYUFh0YUVnN3hBc1VzWnlIcmhFbG9FTE9pdkVKamNlMjcy?=
 =?utf-8?B?cGNTM0p3NXB0cnpwZUFrWGhHYTJGUWpmZWVlQTZ4YTZvdGMxbmZRUFBKaFFL?=
 =?utf-8?B?aks0WkFlV3JzWWNhbkpXaDNQOUJNUmhGaXZqK2Eyb0RDRUdXNC96aXJmRUVz?=
 =?utf-8?B?aWFLK3lzdHBrYXRhK1J0MGZjZ3lmVTN5TnNSVm94YURKSGwzMGFIOFk4MVRE?=
 =?utf-8?B?ZU95UzdPYjQwWlA5RkJtZFVvTkdFRkpQMDVIZ1NEMC9JVngvMzM3VklhMVBJ?=
 =?utf-8?B?S2J6VmxwSUtxcFVoZ2ZOR054TWZqdUZyUmVOa3o2SjUvejdFUE1hL3lYVXho?=
 =?utf-8?B?SEVlWTJCdGdNdmFJaEhYdHBqSlpWQzhDUGRvTjQ0emFSUUVpellPMWxRQXNF?=
 =?utf-8?B?WmJQWE5Pcjg5VC9RR2oveVRXSEdUTXNsWnNKSnNaOWJId3ZVRElJK0VTdDIw?=
 =?utf-8?B?cFhsT2tVWjBmaWxYWURVRnI0SktaeVdQQW92bG5MSTREbHZHYlhsTC9kNEVx?=
 =?utf-8?B?UmhiV1N2V1BBTXJ5dDFCK1pFVHlRV1dlMUQ5azhSamx3QjJEckp1MmFiV3pK?=
 =?utf-8?B?cWZMSU9vSzlxOU1OWDQwUkhRNlZHOGIzUUtoQmJMZUxlSEp0ckYza2loY3hV?=
 =?utf-8?B?TE9GK1pkV0lDUHFlWWxHNkx5OG5wdjhlalN6U1IwSWplYkhoL2dXTkhzOEM0?=
 =?utf-8?B?cDdpWW41Q0dkamU0UTYwSnVjUXNsUGx5WjZOci96cHpldHNreXZIcVRzL1BZ?=
 =?utf-8?B?N0picE9kN29ESVk2ZlVQeUQ2aElPNG5TbVdxcFpZZ0I0SEdBb3B2bXhhS25J?=
 =?utf-8?B?MG1BbmFxb0Q1MHIvZWVENnhLNGNUSE04MjdVSnRsQld0aUVrSmFoQnJrYUpp?=
 =?utf-8?B?RFAyMndTbXd6aWt4ck5Md2d4Z0ErNXlGYUdwWmVRSGJKMUY4VFh3L3hsNFNW?=
 =?utf-8?B?NWJJK3pwZTZSU3cvNllXZGN4L3BzeXZmQ3MxNkkwLzVzRE5HTUFZd2p1V250?=
 =?utf-8?B?SDFVcWRCRDBtb2ZBVkROTnhVM0R4dDNYSlg1blFYWExUc2U4a0tXc0IvdzF1?=
 =?utf-8?B?RTB2Q3VwbG9aMm9JUzM2RGRNai8rUzQzZk5uMjZyVi92WktPaldOT3VWVm1W?=
 =?utf-8?B?VUVwNXRBaFFXeWIrQWpRTzNVaXg2Q0hkYlRWZHJKOEFoUzkrRkhNS0RqN1lV?=
 =?utf-8?B?Tkp6cTZpUnZoUjFLYjJGbWp6eFV4YkVDRXdMRmRUbE95aCtPRjNDU3cyalF6?=
 =?utf-8?B?Ykc1VkxVdWtwR2lLWEJ0bWxaM2dpT0xKbDBvTElLNGgvUWNPalIwWklRRkZX?=
 =?utf-8?B?eVhObVkyRmx3MjZWYi9wcmZXZDIyVVRSbUlFa2RTL1NDMDNYdm9XblNEOUJH?=
 =?utf-8?B?QW9SQnh3WE5yUG91MUxNRlRBbmFxcFFnYXFBS2lvSDhZUncvcVBWN3F4elg5?=
 =?utf-8?B?RkVIazl6Q2tuM0xsQTVsbjVId3FxYmhFcThEQ2d4RENIMGFzSVd6SkxFOEps?=
 =?utf-8?B?QUR4WDM5OU9relp5cXVDSU45VEl1a2VYcUd1QXh1aW5RdU8rWGs2UT09?=
X-Exchange-RoutingPolicyChecked: ujCq3KjBIjvQXlOqOgFamiduoEXX4NJ9FrII5D+9WYZHGtZm+Akhx00ZI4y+pjvpjXtiAgaA0wpYXPmHCf483M0FLyJQvGK8mMaymKPXkNM83H4lxCHgc8R40MQuG+/oviT0+Q9I4wiZfc0GL18CY4NwLSKI+hVaJfkU3YbuK7PPlFMD/kmyShQQUCkRx3nP3RXBoMtJIM28W8Vg4+HQ4FdRjsLyU1JVEPxQ1iMtuvky2EjFGqaj5oSrq/tGJbt8hE8GqCPyg4Q1q9/th6g4j6jvDkpDIdCD2YW8esboUN5lxgLFYn4zSDRysPXP8ymjpwNht3CjK631BUs0+nu9Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dbaf4b-7b7b-4163-ee60-08df34e7b4e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:36:29.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnO0bWkPcUZijXZkHll3+R86fpK7H+LYxcs6b62zqJnJi4MD+OtR7PqPDPPpj0wis4CutKC1tiH+1xmegQtn+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB135625
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 17:24, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 04:47 pm, Poosa, Karthik wrote:
>>
>> On 23-10-2026 16:06, Mallesh Koujalagi wrote:
>>> Store pcode mailbox temperature data directly in the byte array
>>> using put_unaligned_le32() instead of accessing it through
>>> different views of the same storage.
>>>
>>> This keeps the layout unchanged and makes the data access
>>> consistent and endian-safe.
>>
>> 1. Is this patch addressing any issue reported by a static analysis 
>> tool?
>>
> Yes, it's reported by static analysis tool.
>> 2. Given that |cpu_to_le3()| already handles endianness, do we still 
>> need this change?
>
> Yes, cpu_to_le32() already handles endianness correctly. The main 
> reason for this change is not
>
> to fix an endianness issue, however to address the static analysis 
> warning about inconsistent union access.
>
> The code writes data through temp.dword[] and later reads it through 
> temp.value[], which was flagged as
>
> inconsistent access.
>
> To avoid that used put_unaligned_le32 writes directly into the byte 
> array that is later
>
> read, making the access pattern consistent.
I understand the static-analysis warning about writing through |dword[]| 
and reading through |value[]|. However, since |value[]| is accessed as 
|u8|, there should be no alignment issue, and |cpu_to_le32()| already 
provides the expected byte representation. Is there any known functional 
issue with the current code, or is this change solely to address the 
static-analysis warning?
>
>
> Thanks,
>
> -/Mallesh
>
>>
>>>
>>> Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data handling")
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 42acfeb8818c..7bb1223dc30b 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -7,6 +7,7 @@
>>>   #include <linux/hwmon.h>
>>>   #include <linux/jiffies.h>
>>>   #include <linux/types.h>
>>> +#include <linux/unaligned.h>
>>>   #include <linux/units.h>
>>>     #include <drm/drm_managed.h>
>>> @@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
>>>       bool available[CHANNEL_MAX];
>>>       /** @msu_mask: VRAM subsystem enable mask read from MMIO */
>>>       u32 msu_mask;
>>> -    union {
>>> -        /** @value: per-sensor raw mailbox temperature; bit7=sign, 
>>> bits6:0=magnitude */
>>> -        u8 value[U8_MAX + 1];
>>> -        /** @dword: sensor values as little-endian dwords, 
>>> u32-aligned for pcode reads */
>>> -        __le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>>> -    };
>>> +    /**
>>> +     * @value: per-sensor raw mailbox temperature; bit7=sign, 
>>> bits6:0=magnitude.
>>> +     * Written one dword at a time via put_unaligned_le32() to
>> Written -> Write
>>> +     * avoid inconsistent union access between dword and byte views.
>>> +     */
>>> +    u8 value[U8_MAX + 1];
>>>       /** @vram_label: vram label names, dynamically allocated based 
>>> on vram_count */
>>>       char (*vram_label)[MAX_LABEL_SIZE];
>>>   };
>>> @@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, 
>>> long *val)
>>>           if (ret)
>>>               return ret;
>>>           drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 
>>> 0x%x\n", i, data);
>>> -        hwmon->temp.dword[i] = cpu_to_le32(data);
>>> +        put_unaligned_le32(data, &hwmon->temp.value[i * sizeof(u32)]);
>>>       }
>>>         for (i = start; i < end; i++) {
