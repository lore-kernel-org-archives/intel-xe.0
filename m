Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C959606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NuOSxKLJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD8010E1F5;
	Tue, 27 Oct 2026 09:18:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A423C10E1F5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793092704; x=1824628704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q8qxfgXIR0a89ic/9dYk7144NELQFrAhiv6N+chLpBY=;
 b=NuOSxKLJ/+yJ7kAv0+UAUujVfuMskqNVJdm60JH57TCpKmDvPU0EGsPw
 gz1x6M11paurNDkqVoUTKUywzQ/sgjRM1AsinUVLDkSnEhW7y5t1WMPet
 JFW/4MCYlK32nbOG8REMt2FyqeIR/WK30M/0kd61PtQVJEBpb4SfhWhJd
 pJQy1AO4IP9p8tEo+C/2T1Tb3jSvrgq6mVwVGKlQD0Ws5ND9g0Zyj3CHj
 ojrOEIFILwOj/l9t3GAP6Dd7+MElYsoc0/Pgu7qX352+rPyh+Y6U5LTjE
 5CWZjFlkfskIdrUKof2R9RMl1YgXVbYKnL5CoCixkOUicC05cmP7ts6h/ Q==;
X-CSE-ConnectionGUID: yGCNuvCqTVG2YHcbplHUcw==
X-CSE-MsgGUID: IHc2iQhpTqS6+z0uuAE+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1663948"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1663948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:18:24 -0700
X-CSE-ConnectionGUID: CR5i7VEDSpyHBFCkhWflgw==
X-CSE-MsgGUID: fGLLsVPGRKCMtiX5DLTEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4493236"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:18:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:18:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:18:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH+8bwk6nI23QZOnFUfXKCw0WJ2WKYVvbDA/PnEQI2rL0NScxJQDoPrgyBeAjb4grsjADs86al2TUWP9e8p9Vp4JustKmKtPMz0hGuBnKMbkhjqCK2JYShFmiaxiE366cJjiFriva7VQOja6REs3XsEY8jP3Ara4iL4DiQnKBdiJ7bhHQbf2anK2K+S+LVOzj1XW+b8DcGvQf7FEINXTM0hhxUALy3x9SDOixhxRLxumsghHv7ciEzUskVvnXBMazFbxzaD6yDbuchfjO7fAxHAEbTuNOXTuADCxvBUG7ggYgc6A/vd4frST3sH61zRk/YC/lomNew0HamDfAtZYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNJSjNNAVK4tpiDBcY4y59v2f5/tR7nw8GgMph7kbJk=;
 b=y//adBitRFtzo9yX0n4UQPxTS6esqMSdeCB1aaKNO3i0uzhkjZ/QXYr7GaAOSD2v/HrkBoybEybteRjKcjrVaH9XQ9yzgtpzdR6sfyQ2XbQr0uFcRyYAbVo56kN8laqVjIfRZyEmhAQsSlBb2fPEZlxPrw1e3Ry7qQuaABtN/eAwYpflynH5JKyHRj7qEWzLTQ5Are13IEjQStlIpcD7abYGcI/OBXIiWFMUYm0VHSko0tO3TqZ1TJFwSDjAcDwktl73FBkPYnzhXZzMyhnyFa8tJdLMmXuo7mI+KqKqYOaR/yA2XA1O6AsHJ7rU4qnHe18yO8Q4lAJ19flxlYzwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by CHAPR11MB9631.namprd11.prod.outlook.com (2603:10b6:610:2fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:18:20 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:18:20 +0000
Message-ID: <21828927-36d4-4ad0-bec3-b0b29db83133@intel.com>
Date: Tue, 27 Oct 2026 14:48:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bo: Protect pinned list check with pinned.lock
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20261026162530.74757-1-naresh.kumar.g@intel.com>
 <386706f1ccb81ab06257e75567976350f54d923b.camel@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <386706f1ccb81ab06257e75567976350f54d923b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|CHAPR11MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e330056-8d14-4bb8-fb1a-08df340b3e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261021123027099003|261021121427099003|4143699003|56012099006|11063799006|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info: J4yj5uiIZl9K8DWsoY/j55hW0iQGMqy+1KSUDJZ6BD8n1dTOb+MJ/id7Ij6L3g8NNb3dMO5jwtBmZ0FKwfxPE/3pJG3oteBcN4BSuwkgZIYrSXxeNAYPpqhb3palof7pONszCgJsMURP3/lyBOwa4hL10B/u+byOnKxCYY5giIz3jnZLWDT7BJvf0ZKAYwrQvJ1B6sXn4Dnr7LeML9LuFJnINir3danSLT6suqOqKYXUBsFE+whqRWVMOk3ee35YEYPJBQ0Dl93CRkKs3wq8pwJWZNKTUgBXooJfiGcZvT5aVVOo3X6NiA7qToGVqdH6m3VdfNE/ORoiJvNOvMfPx3HWnWtrzDWB8l6kbFXvDU2YMCELftp3WhYkKFrK7w59/FusJgWBe0NbKmvIYarQcZZTIx1Fd9mOangaQp7xkfF8I/jOdLnlNsphooamiomaDfF9+roCeTx5VfGFP0Ch5routla64nzxXWG5vq4g8lXESgKHXqsE+YzYOZbWcig78PQ6fznRJO8QDdeqr0n76e0Sd0HLwLw/h7BwxHwKmeqnxfcuhvWjHtIv+gPvx0QcAlTNDZDGWUenmdvc/8U97pn1Q8cnhe6zHHdchGQuSUtsD1OP1aCp5OeIpxFY7fi4jcINF00p5zp/EmsdZ4ojb5DzOfXQgfWoyldha9Lg0d8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261021123027099003)(261021121427099003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVnNEhjVE5ycHNpV0lVenp5RHNwSEtkV3hvRXVCQjVXcTcyR2JtQzBaL1Ar?=
 =?utf-8?B?RDJFK2o2eDlXb2RiR3lkVGJFeTc0cFhyaVB0dHhKdE5xVkxqRm9WOTdQc25M?=
 =?utf-8?B?ZUNlVUtSdmhYbkcvZTRObFl5VTdjRlU4ZHIxNTJCNXpwbENYWUxFZTZkRERT?=
 =?utf-8?B?dnlHVDVESkJNcDcxQ2E0UlVRS0xad2dvaXRuQ1VqQ2Z3TDkyZ2tuOE9RM2RL?=
 =?utf-8?B?eW92aXdZUndHSUhJMzZBNUVwaXJsZytTSWdhY3hSSjJqbWNjZ1pCbkxhRmxm?=
 =?utf-8?B?cytsc1Ayd1laVmIrdWsyZm9pQjFhb3NmcXJuaWU1bW15VXl1dGdJRmR4cDFY?=
 =?utf-8?B?RGVyYU5mNktJa2dHQ1FyQmh1N2hEN09kQ2xpdEdMOWVwLzJ3SEdNeFVTOWRE?=
 =?utf-8?B?ZzdocEt5NzR6RDVRenR0bWllQ3RkRWczQXNETjFXNHZOUnZXS3d1dUZ6ajZY?=
 =?utf-8?B?T1lGWkdtdWw2OS9wRjNUTmRVMXkxZkRiZlMyNWM4MWhYWW92ZEhGeisySjZv?=
 =?utf-8?B?N2xPNUV3WjhLNmR3U3QyMkJtZFhOY1VCQ1daQW9iUzVCQ2ZoQjZ6NXhGSWdt?=
 =?utf-8?B?TjlSOXdEdWR3UGVEbVNSUjhQazE2dE9ZZmNwZjl2aGRHMG1CSWUzdlNxaFZh?=
 =?utf-8?B?MTBvQ1gyV2VBSVVnd0RuU1ltWlc0TzlvZFQvcWxZTmtjNi9samdNZnN0RGcz?=
 =?utf-8?B?Y2FBUTJpMGRaZnUzeGp5QmEvdjNjUnBLMXFBd1l1dk1vT2xNNlB6N1VkWGlv?=
 =?utf-8?B?UTdjZlJQWTZ1Wlh3NDlPSkxiVzZzNWlCa05YbWhJMXBtTjJyckN0OC9qaklB?=
 =?utf-8?B?WlN5ckljTkhucnRFak42WkNkNklERkoyc2ovT2g3MzVuUzRyWVpySTc5OE5t?=
 =?utf-8?B?ZmU0U2dpdExvdGlqWGQvNk5ta05HS3BPTUd5akVuT3BscEdtaUVqVHhQRVhO?=
 =?utf-8?B?RWdhd25aM3Y0bmc3bnY2MENZeUxTazM3Tm9BTGc3WElGWXE4RFNEdFJ0dC9h?=
 =?utf-8?B?dnNkT2JvSDhVT3JjbFovUG9kZXBnYU9iVExYRnNReFQ2L3lBbkxzYjhnTitT?=
 =?utf-8?B?N3pUc0hBV0ZmWHFXUktYemgzaTM4OXE2Q2l6ZU1BbzNuZTY0cnhTbWh3OTdr?=
 =?utf-8?B?ME5SN2YzNGJOVlIwZHMra2RDVnAvSVA1VmQzaUIvdUx5dzUzVFBvOWp0Y3Uz?=
 =?utf-8?B?UjlzaWd6b3BqUC9ucFJtTm5xSmxUWW5wSnAvRVVya1JybWU1OXJFMCtGWHJv?=
 =?utf-8?B?aGJhYXBqTno1YXFSMlVKY0xxZXAxaUVteklzeVRZazRmcHhHVDdqZCtzMnRw?=
 =?utf-8?B?U2RzRnpzeG1KUWJRM0FhSmlHZkoxWWE1SjQ5T3NwMTJRWUU3QWR4V2ZZWTBt?=
 =?utf-8?B?amdGVzJ3UmJ5TFc0OEFxV05pTVJQVFFOazBtQVdwRUtQRStRVXBOSDEvRkFE?=
 =?utf-8?B?NVhXZHBMTDVMQXpiU0JKYm1QclJ4T3pXVmVsTkJtNVRZcFQ0c25HdmRXYllW?=
 =?utf-8?B?TjJkTHFLVXhlRmJlc1hrS2VEYmVSMEV1am9wbUhRR2djNjZFYi93MjNMSHNa?=
 =?utf-8?B?OE55RVlJdW4wUVovaE1QZ1JTUE5yWkdKckhGSmxsYVhvNkhnQXBrUkVqUHQw?=
 =?utf-8?B?YXNSbmgyQUJuY0lac0VVVWYyZ1A0S1hLYU1pSzdZN01lQzRNdzJGM0Q4YmU0?=
 =?utf-8?B?endrdGY3T1IvaUJzdEcrcTBFOGVBaW9NVndPakJsWDUxUWZCYzJnUlhYbWxQ?=
 =?utf-8?B?ck1zMUR2OFd4WFpqOFk0aVZvQXVVeVVtQnpGYTZrWGpBaWMyejJkVTY3ZGhl?=
 =?utf-8?B?a2M3YVRFNVFsT3JqTjFqNUoxM292WnRyZ3FxWGo0dnJpNWVwendTR3ZWcXo4?=
 =?utf-8?B?S2NoQlo3Yk1lbGh2V1VHRGd1NkhoN3pVb25Zakg3aThBbC9uajFNVlBMUThx?=
 =?utf-8?B?MkdSQitPbnR6ZVI3WEtWMmtBUlZaOVpzUU11ckxkTDRtNFNIYit3MkNLUm5U?=
 =?utf-8?B?UkFObmFTd0R0bmRleTF1UGNDNTY4R3g5dHRBNndzWndyL3ZjUUxZSlhnSXA1?=
 =?utf-8?B?cTUyTndyYXluMjRrTlJSZmRhNHFYRDgwU1kvbXBCbEttOHJlQjh6YlpRdDdl?=
 =?utf-8?B?dTBFdHZ3TGRuem5Bcnhjc0laclRTVVJuWHlhUlRSbnBobFVEdXRzR0dIeUJG?=
 =?utf-8?B?SXgzQlZNM1B4Wkh3NXRPby9uTnFXMi9MNzRJVG9tQTBhQUdsbkhEVEhsd2lE?=
 =?utf-8?B?aWRwZWFGbWdYczE3TVBrUXhldTkyRDJ0aHU1bDk0Szk2UXRPR1RRN29kcG9Q?=
 =?utf-8?B?WTREcFJ2Z3RDVzhUN0ExakpkbW5vSURFYXVXc2JEQytrQ1NaMkRWQT09?=
X-Exchange-RoutingPolicyChecked: uIQa/o9PT21RyRiUDR+vCPA/u/05y/ATlnwQhFBK1cVFHOeAYlh9kgnK9aESUvEHDJvKjFolhqNBq4BAUQhZb4MDMlFEABC2GcCAKzbB3kp+HEk0FGw9yvmsKJl/EwJA/jfs9/kYesngDOchojs5RRdgHtao9ZqPDO2w3mDktJSD+nES7vOzpV5LU+sA26q4HmAbDXPj44oYE2s85A7WMwtMhWyv2j1F24G1BqSJdn7grDfa8cmX3Q9p8lALjQLrTeO6NP198/SQzeTGO5/ijkjAMmUp4kkHa0Tvfsa59PUdMlNI2vB4ymHEkIlUpJFGjkyQUrz6hn+yFs1i6BOj1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e330056-8d14-4bb8-fb1a-08df340b3e61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:18:20.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHxTs9mHWlqUYbKvM8aLYQjGMAtKQ1nhytl59/O2D0G5vDmI9I/WmyAZVP/SUO0+2/6Fbuzqtlv9EnOVzWq+iPHwvuQnrz0HIbw1HEsW+Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9631
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/2026 11:11 PM, Hellstrom, Thomas wrote:
> Hi!
>
> On Mon, 2026-10-26 at 21:55 +0530, Nareshkumar Gollakoti wrote:
>> Move the pinned_link emptiness check under xe->pinned.lock to
>> serialize it with concurrent pinned list updates.
> What is the problem this patch is trying to solve?
>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 42a6aa1a2e4a..ffc2f467e44f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -526,9 +526,10 @@ static void xe_bo_account_unpin(struct xe_bo
>> *bo)
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	bool last_unpin = bo->ttm.pin_count == 1;
>>   
>> -	if (last_unpin && !list_empty(&bo->pinned_link)) {
> Common lockless optimization?

Hi Thomas,

yes looks, list_del_init() is safe here as bo->pinned_link is 
initialized with

INIT_LIST_HEAD() and remains self linked when unlinked.

I understand here we need for optimization so that we can

avoid unnecessary locking for unlinked BOs and as it safe to call 
list_del_init() on

empty list. The below check is not needed inside the lock.

>> +	if (last_unpin) {
>>   		spin_lock(&xe->pinned.lock);
>> -		list_del_init(&bo->pinned_link);
>> +		if (!list_empty(&bo->pinned_link))
> list_del_init() is safe on an empty list?

I will drop this Patch and code analysis tool triggered as race,

and now i see it looks like FP instead of issue.

Thnaks,

Naresh

>
> Thanks,
> Thomas
>
>
>> +			list_del_init(&bo->pinned_link);
>>   		spin_unlock(&xe->pinned.lock);
>>   	}
>>   
