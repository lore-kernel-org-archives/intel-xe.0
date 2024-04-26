Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD50C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 08:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC7E112290;
	Fri, 26 Apr 2024 08:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/l62KOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4E11228F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118770; x=1745654770;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JmyqX7HCwMGdV5hZYUw8233p1x6XwcqpORMCesPG/zI=;
 b=Q/l62KOFa4qTzZpt1ggXBYcloQdfxNaSewxNmnrykGCycmXmmySofARu
 +IpMgwB6cf3FLpD13gmqBoixAHPMkwLfb7LIeJtNpljXMeBzukNtZI5o6
 IHJeFhKzxHHxx3MOve5RRkKvUh6uGK0uPicPWSKdFX3kuaG3ZEZzzYD9y
 U+dFeIqYhH7YOoAxIJOAickyEcymhhk0RgtExBqCjsHRox24nN5fyNivb
 bdDwoH7gVzLYqZyZUufxr4lCqwlZD0W/UdT+vpy7e5vHQN5vaQzgTq6Hr
 05yQq6DsZcPoaSwSaE3OqL502kSGbiXuTd96Byg+UAq+Dju0oP3EOLmBs g==;
X-CSE-ConnectionGUID: ESqT0HcUT2uYJZ+JeR+gtw==
X-CSE-MsgGUID: BTovYAYBS425+jqcIBXqiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9772587"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9772587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 01:06:09 -0700
X-CSE-ConnectionGUID: KvZEjZmoQ9mvZzer2jjn1Q==
X-CSE-MsgGUID: JbrJpsMbQFSd+F+5OKqChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25439321"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 01:06:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 01:06:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 01:06:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 01:06:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 01:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATRmraiP1kzx/OKPqq5yMyR0FQEvq792YSoBGyefjZrpI8Ifr1WL1j/h3jQ0ze7v6GN3ejTRENXzlK7wVGck52jd1AQCuLovIq1Im4FtpaUHglOcqpp8B+/yI0IoKt+s6I3o2zs9+ayLGZKBKvJq6LjJ8D+YWAJQyIlRp1N83bzym8z6URkpdLYhZnSfH7JNv9X5Q8kSWZEmIdmh/qhATkGr4act7Iamh8t0PgcU55V5g/tnUmISnyaocbPY79F9hg+LkZIc1rpKkG8ZpNON/dNEB6MxSROsxSxEPigLWwO3mGUd5VkuvZwjsjrJhBq8u0EhvuRqmlIggFbMCnztdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6v/QumL6ZF5wam+j20uk1Upt8L/0+AwrxNpfnJWBx4=;
 b=bnm7a5M2oscY4him38nGqQ/RJRLCCKcd1KIe7yL4MxO9Plsq7Ml4ZiPLiUVugkLBDouf3Sn1TPDRcaXud/QPesbWkxKlOcBFgVfYMHNHqBhrrOLA0eagi6oMgGUpjvNPBhHpv5LvxQMekYW447eXYQ5CKThUEJpbsBy1GYCiJCTLB57COwwd6AftX8TcbFle1KkeHRFVmsqtAYtQ3Iqt2jvW4Ag1xM9RGJWuJG0++ybFMmgj2SNttjxR2++5i4numwOu0ugp/vc/MosRp0u/QRAMeN8TnIWMAMe75URpsF8Gad+JRYlW9CMQBUucEInHaTeysoAhlWNLYhYE+ato0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 26 Apr
 2024 08:06:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 08:06:04 +0000
Date: Fri, 26 Apr 2024 10:06:02 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Implement pci_driver.sriov_configure callback
Message-ID: <20240426080602.vte7266rm7db4ylo@intel.com>
References: <20240424212101.2221-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424212101.2221-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: dac732c6-48e8-4ec9-72f3-08dc65c7b7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDk4RzVxSFhaMEQ0V1ZpU2FwNVZTYklFLzZORWdDVHI3aXFXZWxrYW1ZZEpN?=
 =?utf-8?B?UzlvakFCMGd4dE15R1cyZDY0ZkZORXRpWGpwR0lDaFBtZ3BJb3FEUi9nWVBw?=
 =?utf-8?B?Tm02UVl0WUNuN0dzMExFdFJmd3VhclFFMmZsU3VzY2lWUkRub0FhVkg5UUls?=
 =?utf-8?B?bHZaUGppYjRlS3ZyV21OZW44dU92SGhuZmtQSkltT0tZTDdJUDc3TlRYWFMy?=
 =?utf-8?B?OXlKTUlPeFRDTTQwOFc4RmtJVXk3ZHRyckZvbEQ1aU1zSjZZM1k2d0E3QzhQ?=
 =?utf-8?B?TVFKaEU5R2swSXBKRHVRNitHSEFIM0hLMGNRenE0TkZPVVBQVFZlcE52R2ZM?=
 =?utf-8?B?OFN4SWk4ajdlU25YYU5lM3RLU0h5U0dLeU4yc2JhakpXT3F1eWRLSjBSbFBz?=
 =?utf-8?B?YWFQbHl1OC9zYmhyTjZCU1dlb1FjWTAzOFBWTk9BZTdERTBOV1Z1VkJUTHI1?=
 =?utf-8?B?TW9DWDVhQ2wvNHJ1RDNEMkhNTmJ4aVNIcnluZXpobEVOTDRiU0RIMTA4azFX?=
 =?utf-8?B?aDNGZ0oweGw5TE5GMFBMVXpCRWlYT2JXSVpYdVYzdmtHQXZ3RklEMVdtNUc3?=
 =?utf-8?B?NG50bHhVTDZTcXhsY1VUTTBrdzRPbm1XNVhuOXFRK3MrSUljSUIrd2FuS0xS?=
 =?utf-8?B?TFRmeEovUTBKMlczYWs3cHdZcEFrd3JLK2pmck5kS2ZhQ1VhalRMeVUvYnd3?=
 =?utf-8?B?bjlrUlFPZkRaTnhQOWtHVTFQLzRqS3hXOWxvTDVwaDB2elhPdEt1RmlqRDZF?=
 =?utf-8?B?cElzRGpsOVNRVUoxS0FHOHZUQWtCYjhueGZaMENTd3lERzlNN1lCUHRJMGFL?=
 =?utf-8?B?WVlpTE53QTIrSFZmYWU2QS8wL3F2WmRtcVZUYy9mejFiUnk2bVdlMkxydG1I?=
 =?utf-8?B?Y0g2aVRlaFFZMG96cFhhWWY3TXdBVjQ2bTN2TmJkdkpZV0tRUVB3RTRJbzdX?=
 =?utf-8?B?UHI0OWZTRVA5djZRdGJ1N3krMmIvaUFtandob2xSY2JMVGQ1b28xWG1peXNa?=
 =?utf-8?B?Uk0ya3RQeFRkUXIzajZKUlFjN2kzdjB0czFReTdQbUxhc09qYVhKemxxRy9G?=
 =?utf-8?B?N0ZhR2MwbWFXdFkrTzlPT0dMM0RSNW9KL2h0MFlrL0xzdjkyMzBRY1JxZ3ZY?=
 =?utf-8?B?Y2JrY2JtQzFMTlVuWk1scVNTV1hSa1BCbkdaOEUyWUJxZWlTMGg2VFQ0Q2w4?=
 =?utf-8?B?a09JYW5UdEE3cmhxV0VEUGFjaTV6QzdVdGtPV1h0WDJaWktUdE14d2pSVzRL?=
 =?utf-8?B?S043a01wcEwrWFV6QWsyNHJlUlowU0REd2EzVXVjY1VZN1dLZTIwalVzSGJN?=
 =?utf-8?B?NFRoZTFzNlRyZk1qNnNXNU5WZTh2UVFvdGtqRmxCeFFPNWVTSmM5Z202TlRa?=
 =?utf-8?B?TXExOHlTcmtIcHRLZ2NtRTNFZGZHUnJLMVpVR0M4eHY5VE5nY0lvTVk4V1Jv?=
 =?utf-8?B?WXVsTWlhNkVZMXdyamhtUEhkZzczbnl1T1g2SDE2LzJnbkNlbXNqai9IMjNY?=
 =?utf-8?B?cDF4bVhXU3FUeE1rWEpwbmhRalFuSTFiTmYwNzBrVXdBK29LeTVkNmhac3h0?=
 =?utf-8?B?Y1R6d3NwazBqdStTSTN0RnZ6dzVHSis2R1hrWXlyc20wMXlzN0t1TStLemFL?=
 =?utf-8?B?UDBQQlVqcUNKWEJLenRWajlyN1RQRWhWazAyWkVpeENBTzB3cWFpS2k2OWlh?=
 =?utf-8?B?bFFUQVd4ZGhmOHN5TE5KUEFGTUJYYno3WnY4WFJGeXJ5Mlo1N2Y5WEp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzErbG9ORFQwSzFBLzhzdHJ2WTJIOVllZHNFMkxGWEJCSXErd0gxV0FoSEFr?=
 =?utf-8?B?S29vV2RZOEdkMGxyNk96SXF3Q3NEWW0vNFhBQ3BQNzVTUHZuSTNodERUNUhZ?=
 =?utf-8?B?RklPNk5FTG9XQjQ5S1J0a29LTDJWY21wbGNEL1oyalFnaHpVeFpFMmRqb2dU?=
 =?utf-8?B?cGRwS1diMVpwSjBVVFc5ZjBib1ljVXN3RnJuU29jVzlOSDgyaFp5WllON0VF?=
 =?utf-8?B?VEV3RXJobXU3ODlWL1B3TWVrYlRybW1zODVuZUQvMTdkWjhOeGVvMW1zWXUx?=
 =?utf-8?B?SEtOV0huTng1MGc2ZlNLUnNZWEFiVXNoZ3ZmeFlwdDM1c0hsR3p2M1JnQ0lQ?=
 =?utf-8?B?YzU4d3c1N2c2UjQ2UkVJaVZ1Rlh5VXUweHZJUjRKYW1aV0x4eTVrUmJmcGRX?=
 =?utf-8?B?QXVMaW5rWWRJM2dIM2VVb1Q4b0FSL3RiQTZob1d3TFI1NDEyTitqU2lDUTZC?=
 =?utf-8?B?eDFUcW01L2lkd1MraGhIb2k2RlorckZSS1JWMTYzeE1tZEIzUVRCRkxCb1BC?=
 =?utf-8?B?aTE1andCK0RzdWNqTUZNY2syZzFwS1VWTDdQVDZBbmU0N1ZhMExhUWVKczlM?=
 =?utf-8?B?WldUd2tkY1hBaDhGbEtlTUt6ZlVjazVXVkRvWWp4d3ptVnZJL1R3WUgxWVk0?=
 =?utf-8?B?OFkycEl6L1VhTTBVV0lqWVJBUjgwYllUVkN4SE5QemlIbjl5MzdRdnIwbEdz?=
 =?utf-8?B?b3dwZjJmcy9kaFFyZzhpNEVqYjJ5WjZyZ3hVOXl1VXB5NkNOVW5TdWRGUU5s?=
 =?utf-8?B?ZmxLbTFZVkYyNWFEUWU1ZUE3THdwRmE2dkk1TlRSOG54Y1kyUFdNSVo1MitP?=
 =?utf-8?B?YVNTcWJsNGhtME4xTGFpcVVGaTBlN0RDRGUyM0EyYndnZ0JVdzNvc2I4ZUhW?=
 =?utf-8?B?ZjBES2FuejhQR0tnZVlEbms0MkFSaDhiVlNKOFZaTUh3TU5jUi84L1V6aDhv?=
 =?utf-8?B?cnpOU2FTbkw1d3lPVGNBWk9BTlNWM25xa2Z1Vy83K2tHUjJMUUl3bDRQaTdt?=
 =?utf-8?B?cUgzYktiTjdRWTA1eHNhZkx4a3lGOStTWXdpM0dJWFZHWnJyeWVDWTNBYS9o?=
 =?utf-8?B?cktIa1E4eGZ6Zk1nY09kZzFIRXR3V3BxbjRqdFJWUU1rRXFDVWlHejFGQm1G?=
 =?utf-8?B?MlhnYXhFOVFGbG4xVGNUZkZscGxQU2hYa3BSVjNMdFJ4RkU1YWQ1NDd6TzlY?=
 =?utf-8?B?QXY3dG11c0R6SnJQQVNaZ2l6aXhEWVlGM0ZGdVhHVmk0NlBlQXBzMFpBS0wv?=
 =?utf-8?B?eEkyV0dxTm5ROTVMM1ZiM1dzVzFoR205Z1ZFY0ZRZTJkOG9OcXBERTM3b1lS?=
 =?utf-8?B?cDFXNkRoYVAxOTB3N052bnQxWm8xcTRUdnplV2tlTlZPV3BnKzFEdG1TcVpx?=
 =?utf-8?B?VlRiWDZNMVdGMFdaakI3NHRZTlRibzRreWRLbkRQdkxnLzJBQWE4dzNUaGpt?=
 =?utf-8?B?OEg0bzN5MkZnRUtpcXVlSG55WStlQVJNK3lyY0tDQVdYRXBrQWt0ZjkzWlI1?=
 =?utf-8?B?NUdzY05FT2tmWlUvZWpxN0tDRnNFSDUrSFBPeFN0Vkl3QTZxU3FuWkJEa3Z3?=
 =?utf-8?B?RUJxUTFpTjJrTDU3OE4xcGt2djFhdDBhcU5aM0NKVW1veWo3aHlST0YwKzc3?=
 =?utf-8?B?enZBZm10bkV2SVlYQWYxRGRmTFNDOHdhd1JvdWU2VisvOFZWNkFzaERGaGVl?=
 =?utf-8?B?LytCOFYwakFRM2dzRU9QSlFYUThyTDZaWEhPblBQL1FMajFncGNPWDJ6aVlM?=
 =?utf-8?B?QnZrYTVKSmVSRElMSjh2WEJneWxOaVdXSkhUTHJ5SE5wbWlHNCs0citKZEhx?=
 =?utf-8?B?VE1aRjNrdExOTnRNRWkwZy9SNzF1Q0s4emJIZ3ZadGpRN3JNRUJNVXdZQXdm?=
 =?utf-8?B?Nk9TZ2lmZlltV2NQMDZqQk1Wem5mMGN6bW1Kdm9IR1JmRGJlMndmZUMyeFRF?=
 =?utf-8?B?bkZXRG9Gd3FPVmF0czV0NHRUcmVRUzNqZHdZbmpVQkQwaWZ1YTl3Qk9JbDA0?=
 =?utf-8?B?UHFyZ3U1cjhqaDZicHk2dmNXSFRoQzRHSFZJMUMxcHNVRHh1R002NjU3RUls?=
 =?utf-8?B?OHRHempSWFcvK094dGQyeHp6WGVUd2tQU1ZFOGtySGI2cThvempKV0hxWkhk?=
 =?utf-8?B?MGN2NjJySUNTMm02UFZYcFYwdXBHY3FVejRuNmZiam81Q3REa1VPVE1ZOUtG?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dac732c6-48e8-4ec9-72f3-08dc65c7b7fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 08:06:04.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnJ4ohD7mrMjmAg7R1vONbVzauVU13Yw+qohNjbuFcjvs8WDwbuWkF9zm+/L/JpSU3FWxDzPvGKMtV3KjS5ma0c+KSx7M++CzDPMfrCscuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-24 23:21:01 +0200]:
> The PCI subsystem already exposes the "sriov_numvfs" attribute
> that users can use to enable or disable SR-IOV VFs. Add custom
> implementation of the .sriov_configure callback defined by the
> pci_driver to perform additional steps, including fair VFs
> provisioning with the resources, as required by our platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   4 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 137 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
>  4 files changed, 155 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a67977edff5b..6acde66f0827 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
> +	xe_pci_sriov.o \
>  	xe_sriov_pf.o
>  
>  # include helpers for tests even when XE is built-in
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a0cf5dd803c2..f3efde939df4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> @@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
>  	.probe = xe_pci_probe,
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
> +#ifdef CONFIG_PCI_IOV
> +	.sriov_configure = xe_pci_sriov_configure,
> +#endif
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> new file mode 100644
> index 000000000000..b4f312ebef80
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_pci_sriov.h"
> +#include "xe_pm.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_printk.h"
> +
> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0, err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_fair(gt, 1, num_vfs);

maybe VFID(1) ?

> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	unsigned int n;
> +
> +	for_each_gt(gt, xe, id)
> +		for (n = 1; n <= num_vfs; n++)
> +			xe_gt_sriov_pf_config_release(gt, n, true);
> +}
> +
> +static int pf_enable_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs > 0);
> +	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
> +	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	/*
> +	 * hold additional reference to the runtime PM as long as VFs are
> +	 * enabled to keep GuC alive - will be released in pf_disable_vfs()
> +	 */
> +	xe_pm_runtime_get(xe);
> +
> +	err = pf_provision_vfs(xe, num_vfs);

Why don't we check the err here ? Is it not relevant?

> +
> +	err = pci_enable_sriov(pdev, num_vfs);
> +	if (err < 0)
> +		goto failed;
> +
> +	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
> +		      num_vfs, pci_sriov_get_totalvfs(pdev),
> +		      str_plural(pci_sriov_get_totalvfs(pdev)));

NIT: in my subjective opinion, in a case like here we should use a variable,
     as we use the same value in the same context. I know that here it doesn't
     matter much, because the value returned by the function in this case is
     constant, but somehow it bothers me.

> +	return num_vfs;
> +
> +failed:
> +	pf_unprovision_vfs(xe, num_vfs);
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
> +			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> +	return err;
> +}
> +
> +static int pf_disable_vfs(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	u16 num_vfs = pci_num_vf(pdev);
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	pci_disable_sriov(pdev);
> +
> +	pf_unprovision_vfs(xe, num_vfs);
> +
> +	/* not needed anymore - see pf_enable_vfs() */
> +	xe_pm_runtime_put(xe);
> +
> +	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
> +	return 0;
> +}
> +
> +/**
> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
> + * @pdev: the &pci_dev
> + * @num_vfs: number of VFs to enable or zero to disable all VFs
> + *
> + * This is the Xe implementation of struct pci_driver.sriov_configure callback.
> + *
> + * This callback will be called by the PCI subsystem to enable or disable SR-IOV
> + * Virtual Functions (VFs) as requested by the used via the PCI sysfs interface.
> + *
> + * Return: number of configured VFs or a negative error code on failure.
> + */
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return -ENODEV;
> +
> +	if (num_vfs < 0)
> +		return -EINVAL;
> +
> +	if (num_vfs > pci_sriov_get_totalvfs(pdev))
> +		return -ERANGE;

Shouldn't we check xe_sriov_pf_get_totalvfs here ?

Thanks,
Piotr
> +
> +	if (num_vfs && pci_num_vf(pdev))
> +		return -EBUSY;
> +
> +	xe_pm_runtime_get(xe);
> +	if (num_vfs > 0)
> +		ret = pf_enable_vfs(xe, num_vfs);
> +	else
> +		ret = pf_disable_vfs(xe);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
> new file mode 100644
> index 000000000000..3b8bfbf7e1d9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_SRIOV_H_
> +#define _XE_PCI_SRIOV_H_
> +
> +struct pci_dev;
> +
> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
