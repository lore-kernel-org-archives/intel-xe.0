Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7520ACD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 18:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BBD1123C7;
	Fri, 29 May 2026 18:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDCi0bSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BC51123C7
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780079753; x=1811615753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/1CZv8h3yGzYD5GUjcVchHVFaC6c5nYrQpGr5lh5Lhw=;
 b=nDCi0bSv7l0PLnNaZvwIRbcVmvsvnPQvLGUtzLwreHMGURnW0jHXHG+l
 +0q2MUEsw3fYWoFFoId5Akzz7eZfMTIAhcu/TCWxGDSEzRoTPJjtRQwG7
 uAgwSico8DbCTzIOjyhKF60dMA94x+f4Zgubruq7Pxlr0H3KbHnFfFEpJ
 D843yIf55NZvlaR/YB8qpuId+7y4AqO1pT7A2f30r0ZdmG82DDOAoQBFd
 inBOSFilIbmE1n4RoLtRmySwQiLrFgP4BLIBp8IWqx+rkJrY1zK0LGgyO
 5aqUsMcK8iMLiG7LRlYuMbg2wx5m4PoEHEyPP71m8nH33peXtC6T7RjbU Q==;
X-CSE-ConnectionGUID: VJIxmxnnRgeysJ/6Mhtwlg==
X-CSE-MsgGUID: hdA61Z49R2WvV3gykJ7yyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81123894"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="81123894"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:35:50 -0700
X-CSE-ConnectionGUID: md2GefEsRYCZcJDaswMT8g==
X-CSE-MsgGUID: oQDwo/sQR4uw3X2LZUDUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238540365"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:35:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:35:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 11:35:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLzpnzOhvhs3OayBt7shcIERXUICEzSAPFnDRvsiCQA00JKGZE9ZfUk+9Xg+g1vgFJyMdYE32Ed8Jb7r8Umeh7GhBEGkudhC5HtITK1ZbdrbL3xME3zVCZjP7cX8TYvCQ2OvKLIcSRFKjlBlbqgHd+tm+MtGWmN5sa5bCarCpcsxofTMABOrK/0TUhiU0HtZmEW8oRXjNNE3e6+akGBpkWbHmHIfmVXcMeE9MtDaksmgGt4WHewmTq7gCUAsMR3eLd9DPd2bffWH4vLnEP49bXIbrupr6sRuAJ5VcwO4SR3r4Y6ZchOeoONQVjn9HER5XhfnRGxS/H3tRNd94QCm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ambzeCYyTkPqmicNg1JR1TyyVa37bCBjHGu9ihW8SDU=;
 b=eXX3oLwCoDhsJ9aF8RgeHkS4aUiJ0hit+Q6B6DcS3aIDRVsTa+w4V0EIGg2SouN4eZeIcefuvUnv6a0YoePzOeDhEUJLwQJ5bjD+SRblE2kfCccsypq2b1VmzPy/POt8ooiChHP0hsSZaYxAzWiOvpbEfcM+t7e7l80CNlNpdpsbd0v42qVhUJdUwOaYL+8hQtGUr9DKrRomd6Ptlw+EC8Ac1u8eZQ7hAUhtzugOiA88TZyIJxf7h01LmVPDw1zjPTKbUttW0bUIg2XcB55MMQ1areCIkDjTq8VmrjRngr+T2CfWjwH5s/SIdn6XXFiXW3WSFHx0NLOi0oAy7G4/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 18:35:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 18:35:45 +0000
Date: Fri, 29 May 2026 11:35:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/xe/oa: (De-)whitelist OA registers on OA stream
 open/release
Message-ID: <ahncfsQd7a04tmh7@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-9-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-9-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:303:dc::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA3PR11MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c59a96-d4a5-42bd-23ec-08debdb11862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|5023799004|18002099003|11063799006|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: W2yfoZyGdv+YCKHRiThnXBu3bT7gc6qYEbUfuYYS34kMrgvfDQs9+EugxZbBA360qQJcyjaqMb2fr2moBnaqpNpi1YNQq1chk6i+nlt7deGnkARiegWCrdIbQWa6tIZFOkXMsuFfcMY0RWQwjG9QbeGa4j94WiOO/tn6yEV2qgYdz8K8Zp/cTGxOs/4Bfb7N/uMCpZV3rJUXb4a+KfThRO5QfYE2wwS/ZbzY4tkuP9CaHKp3uIdyYpS2SLSXat0PncDxs2GSRWMEV0JIdplKkN2mdixHEJBnNmzdrm0NdmcBkKaSBv4wZvK4Wbf4SS2SXkYW9FVLKJtxe79r4zdzfvl28TQNZ/pVYEV4gviH03MAB5B012MjIm3c99pbSkNNDAVD8Vu3gUcjNeTziM4Uv6l3fEAeZk4meQrgOCTLuZp2SOoJmMzD4Q05exhpY4G5N3hXKymNXkwegM2zWrYWQcG0YtZKHetSn26sX4KgX/WBCOmWKQyMEWXPA29UjwO5Qua4YywaLvNVXZgpLZwTqWwH9muNillc5nSQHb0XwT0/cnDiLyhF7eoA7mO88U9quY39vQttsgxTBswljnir2IpU6r6ek4nJyDATQrojZ4nwFK0D5t1zkmhF/6NsOQpq1b5sGDwjb38LWKk2Udedh5QXJ1ciK8jHsffq31t9X/PL7hz8MSSEKBbaAIocd/em
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(5023799004)(18002099003)(11063799006)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1qUXAwTmNDRTE0U2xEczBJelB2OXFHMTg3RUs4Mk5uZWI3QzFqQ1NyNWdY?=
 =?utf-8?B?Z01GRXFnMHFzU0o5WE9ibDBsb1RuTkMwNmNTS1FzanZNS2pab3dqWDRXMXBx?=
 =?utf-8?B?RUNEQ0hVMmQ3dUF4Zkk4TXJjdGZFTmp0QVhtN256U0txN3hEVnBzR2xhS0N6?=
 =?utf-8?B?a1c1dmwxK0F3TUhjUGgxVjBzM2FYNTlsSUZjS2VQbi9MYUx3ZWFENHNDdUwy?=
 =?utf-8?B?c3dpNkttK1NVQSthaGRPeG5DSVptYmF1R2trQVdhMmp2NUE0b3lKTS8yVUg0?=
 =?utf-8?B?eTAzenB6SThZaHZ2OHNUS212WC9NVkpnY3hpdExiTUs4QzZLU0p5WjVvWW0v?=
 =?utf-8?B?YXk5ZUI3L0xzYVd3cWVIQWJvNmxVTzBBK1BKMzVGUmpTUGZxYTlWRWliRm5r?=
 =?utf-8?B?R0lROVEvVzJ1b0xFRVBkdTR4ODFCM2M0QmJPdnJEdFJsNGpTblVFb0x0WFov?=
 =?utf-8?B?cmI0QlBCd01ucVI5bDhielZpMG9sSGJYMmRzNm5NbVlYTko0QU51VzdjTWJk?=
 =?utf-8?B?Q3RKdnhaMUpjTThadm1TNlYxdUZMK1lYWElaZXh2MkNLRXlIYmlGSG1qcUoy?=
 =?utf-8?B?a05TTzRUYUVNRWNCaE1kbWlrNXRXUzlCYlRxM1doazIvQjcrR0Q1OUJIUE5o?=
 =?utf-8?B?ektaRkdvdURFL3dYYXBsZmNtaXJYYTNwYlVwY01KL1ZLdmh4OGtRVVFBQVFy?=
 =?utf-8?B?bmJQWU9CY3FLYlp5TGdkVGkxYy95Z3lrUUZLRVUrdGh2OEZnTjFtZE5adGZL?=
 =?utf-8?B?Q281bmZ5U0hsQlR5WXd1RFRnR25WdkxWeGpPU3JRWmk1UGloSjNFZ3BPeHp0?=
 =?utf-8?B?ZXVIa2FLNDRDRjFTeEUzUDBjWm5FZXJScENBUjkwQXh0dW52b2d6aWt5emtr?=
 =?utf-8?B?TG9mN3FOdGVWWWtXcHVpT1BZbUQ2SktsK3p6anlkOWI4Z2pVVWM0TUVMSjFL?=
 =?utf-8?B?M1liL1ZZL2JnZHNpR2NqWUVjTEg2Mllvc3c1Wjd0ZnoxNDRNVit0TFBGNVVy?=
 =?utf-8?B?eTRNcDZsQmtoVFlXN3FlV25NM20wdFFBRmYrQ1cxREFJd0pxUWQ1Z1BVdGRo?=
 =?utf-8?B?czFneDJ0V24rN1dSeTA2NTBDWEoyQ2o0ZE9pMWFYTGxVV1ZvVnVhQ3FML3Zm?=
 =?utf-8?B?bms3NGlLNncweElHcklvbFFsZkV0NkFxeTNKeFJ2REtqc1NMc2VpTURDbEJz?=
 =?utf-8?B?bUhRN0N3RzVubFlYSndLaVIxdjBmUkxYNWVudjR1eFVZVTJrc2ROSlIvUXQ0?=
 =?utf-8?B?UlBiODNBN1RSWmJsVForL3Z5ZzFrZXRTQkxrTThhb0FjZ29hTEYzTDVRUkN6?=
 =?utf-8?B?RXU2RnhXTWhoN1BqNjFnQy9mV3gwdEtsRzRrNnVvRlAvQkRPVGNLdHZkTmZU?=
 =?utf-8?B?NUlvS0M0c1d5aE1oK0FuUnhYZ0JyWkFROTBWcVhkdEJIR09Bb2pUWE5kREI4?=
 =?utf-8?B?dDAzb2JaWTZ2YWZjR1BBaXZHM1VsTlVSSGZDZWdZandSdGFrV0djcWdEck8y?=
 =?utf-8?B?NGh1SkR6NUt0dm5MV1lWZW95MEc2TTl1Vlp3MGpyeXpQa3hJdE9oY3ZjVWds?=
 =?utf-8?B?emQvY2RKQjNJOWZWUHd1TkcyL3dCWGtlVGNGVDFpMVdEQUxyaFdEcW94aTdU?=
 =?utf-8?B?RFRqZTU3U0pJSk9lajBMUXNwWUErOWVCR01qN3JwZGhDWlh4ekZFRWhGWmVS?=
 =?utf-8?B?L3ZEdnBxL2Z5UkhpWXlVdG96R1lvSjI3TGVZeGpIdjdUeU4wVEtpTkVvWStw?=
 =?utf-8?B?OVozTnBOMVFjdWRqdXRqOC9HN0tUb1plWGt1RGpsTHFRVmE3ZStIY0wzczJY?=
 =?utf-8?B?UzBjbUxEYm1vMGVlZUFzS2txSjNrdUdzT0YvaUFaUENCZEN4OEhkMzFXa0ZY?=
 =?utf-8?B?L1k4NXZYVW4vbzZNMGJ6dktscGgyaDJpWGFWNnMwdVJDTkxsSjJrOWFuOTlC?=
 =?utf-8?B?Y1YyUm9FTGFyZFFRM1NicXFJbHhUNmJVOUJrcE9iY0h0Rld0RHRzZEUrQkxk?=
 =?utf-8?B?bWY2MVEyVFpwNkdtYWpQaXh5eE5DYkNvOUtLKzV1Y0FmYzdUOHl1MkI0OG96?=
 =?utf-8?B?bUtIcElNaXBBblA3VTgrRlJLMVl0S09FeUpzZjYwWnJ5cnc1a0JJRERobkk3?=
 =?utf-8?B?YlQyWVg2NE9HdnFjYzUvMTdhQWI2YldMNFE5blBGVHQ3RDVtTUpMRG5oKyty?=
 =?utf-8?B?dEVlVUpzcE9tbzlPRVNDMnBKSFQwcllLWE44MW93bEd1T25MOC9QbkIxUEZh?=
 =?utf-8?B?QW5jQjZ3bHZ4aE8vVTB0YzEzbm1pWkwxaFdkYTByNDJHOFF4SG5QNWVvTHFI?=
 =?utf-8?B?cmdramZtY1pRT1IrTnJzSzNYY2xuRkZyNldyZDRDbWdtYVJxRjFGWU5CM2Vt?=
 =?utf-8?Q?coc4BkI+iCHEbX/o=3D?=
X-Exchange-RoutingPolicyChecked: PEGAQnqm53tMjvhzF7FF9G3wD6uIV1i5lLNH0Xy4H/5apAaJFXuDPqeuDGqy1rkROpG/pNywWi6J46GJEAZRPbCvSXpuzPHBsXdv/nrxRlVAU3H+4jK559Zl8d0zdl9E3Kc0anwT962TRoqtXk6RaVZA1GHyVN7wARxU4C/cWEZ6yqMgmedK4XzlCuHbxhnSG+djEB8XltN1b/EPywcS77TNnTLfG+S2QU72lj7Eki4bsgUhyun8NRqqlDLvCjEF9VgDcshv4zIwPOu/+0/ifk5WN4R5h9aQxLmfg0V3/DB1sLvdFdbIXFQI2gB5YtIfT6NNKL3UVdXIuKHaeUtTiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c59a96-d4a5-42bd-23ec-08debdb11862
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:35:45.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2apd4tpNp32CWmD1hzD3x2OA1zcrzlGaKayIvJuhHUabD+oQLwiv7Wa35gyNYzxnvghok+7myzI1VP4/rPDBIAP7KTvh6+QVLCb8h9odMqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
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

On Mon, May 18, 2026 at 04:47:15PM -0700, Ashutosh Dixit wrote:
>Whitelist OA registers on stream open and de-whitelist on stream
>close/release. Whitelisting is only done when 'stream->sample' is
>true. 'stream->sample' is only true when (a) xe_observation_paranoid is set
>to false by system admin, or (b) the process is perfmon_capable(). This
>therefore enforces the OA register whitelisting security requirements.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 7c9071abb44f1..8d2865a66bf1f 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -37,6 +37,7 @@
> #include "xe_oa.h"
> #include "xe_observation.h"
> #include "xe_pm.h"
>+#include "xe_reg_whitelist.h"
> #include "xe_sched_job.h"
> #include "xe_sriov.h"
> #include "xe_sync.h"
>@@ -885,6 +886,9 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>
> 	mutex_destroy(&stream->stream_lock);
>
>+	if (stream->sample)
>+		xe_reg_dewhitelist_oa_regs(stream->gt);
>+
> 	xe_oa_disable_metric_set(stream);
> 	xe_exec_queue_put(stream->k_exec_q);
>
>@@ -1885,6 +1889,9 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 		goto err_disable;
> 	}
>
>+	if (stream->sample)
>+		xe_reg_whitelist_oa_regs(stream->gt);
>+
> 	/* Hold a reference on the drm device till stream_fd is released */
> 	drm_dev_get(&stream->oa->xe->drm);
>
>-- 
>2.54.0
>
