Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79421FF510E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 18:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9E810E2EB;
	Tue,  7 Apr 2026 18:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTStCSWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2147410E2EB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775585803; x=1807121803;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TN100nvm/sIBpWEjYzdwAApto9E5J8d0MQrmpa/3JZ0=;
 b=mTStCSWa9QiXdr0o2Sw/O7mvWrvz663Hai9v96SozAzCKgbAdXVQ0od9
 g6J/AqU4Wn1osVJQdczTc74pYOda8m/m4ipTZQFBoCIfJtEacq0I+X0oE
 u29OEPRizTZpkW+dhxBF7T2GshAxDgNNSBXFTa9zcVJ89C5YO7wcLqAl2
 ViCBabIlPal72y4RN6bqyfGkNpFLmGIkJj0cTOlxxe++VJg4DfkLKQMRF
 sS4QB7q+PCua0YB9f1eL8o+tt/elmYYIWiT8xA1VeZXme2OMUxImFDhDA
 JqlOR8g7Y3npJ8WB9f852Rs0CqYa6/DTzVnuH1yjzm88Tbz2okM27BMQZ w==;
X-CSE-ConnectionGUID: l7lOQrViSHSUpTZZKdHASQ==
X-CSE-MsgGUID: ccBVO3OoTPmkkfspWNPXsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76277319"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76277319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 11:16:43 -0700
X-CSE-ConnectionGUID: cd6JRMwtQqmaKMJ3YKeL8w==
X-CSE-MsgGUID: 2c7uZ9tmTxumBDvJJMnj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="251387400"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 11:16:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 11:16:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 11:16:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 11:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qmocv1N1tAOGDQDTOSBqqHnQ/5A9AzSvoRMFNoBL8+a3EHh7q2cFvtYWszOeQyZAKhEhX9eV57Pocf0SDq7yawkS/xppxgNz1SZq9xwHso9tXJtP/K9vo5Et3YWCmyjmySjM08ZBP1ZYF8bfZ8seXnCLjmkOlsx1AhZasIZTHjyKTUTA62LdkIGHBwOLd6nAZuewqnnWy01R9BAwkouBDYF2xjtwH0sYH68bdqK2q9kafCUj0UEsjo1TGYdOqI9vAYDA8IFvCFr5/x+/SrtjSWATtm7v6c5WD6HBjz3IZUl2rK+tiE50w9+PBgz2JFaUFEyOzWLZ/PDNAJk7D7i75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbCjOa54D/JQmVDfLgzX9xptohXLQ2OIbSV7jP4vilY=;
 b=GdtBQUFdEYCKl0mKd5039Ou8bRD9n+ceGXIXpn7pMwT0kMoLQ91VlI6fLiuJ0JJQ93UjL0mnzBAMJFCc/xkibHI5IHJNzBGvVdKT2FZb+mrsxbt7pgzSUSFt0hQVO09yPm71dhLVp/JPz3U/K1K4Rxjh+SBzwWIi37z3g/bhaJIeIMsollEKjzy2ME2ixxyAaWqJxcJoYgyQAGHWez7ABBigZxEpBymmcMmpvVfeCjQ7tEiYWsZU+ta8Yok2jACAwklsT8Z5lrmUSnkWG/xWK2SBxj/nnEvn2dl21lXt/b/NFNE9hgUb4eyKVdzOcYEkjwnpGJ7O/duSbKV9TbhaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PPF9623118BD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Tue, 7 Apr
 2026 18:16:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 18:16:31 +0000
Date: Tue, 7 Apr 2026 11:16:28 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_sysctrl: Fix sparse endian warnings in
 mailbox header macros
Message-ID: <adVJ/JgIF7Il0k7G@soc-5CG1426VCC.clients.intel.com>
References: <20260407180339.794310-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260407180339.794310-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:303:16d::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PPF9623118BD:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df7346f-c880-4691-3cd3-08de94d1caee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Cu8bwXvkMbuwOQ9v7WwMESu4ZxvuQh/NFORbz1LETVAe/aeJ4CLFPcdSxsAWf8R1yqpldbjae05Gf/GoHzeoDIHeVbxZNtTAMihAYYYHBSfmoBLKuBNZ17QkHLt6OnkggoFOk1y0UKnJMd3sGCeuSrAFNRAS5euf1H7rg+Hcy4kFNWnKDipNlmCflZ+weyHG24kg0i36VCP5acehnrVHKvHWp5L9Rg315OxNxIpOGZRP3X0r8NqAQ9z7Q3xfIgvfDHnnpPfS8/j2fbgK2ZD0gL+smzmTshkmoez8SFep6/6oD66Qzcmh1DfuB8bS7AYCoWHdn8ER/9FHPELYFAwIN/zsVOlj/RaU+M4es9Weoqae6rovWtan/nkUF8u9fJjcHkA6SKE178YLkG5G2p5M7/uVviLspVJ2kVroIKiKZNvAY/GY12ROH2g2MRnVurChHy+Kigjb47y2wN9AvxX9jcCcDjNIWgjIzBjwnCeIZNiDqWUta+9rQ3RgevWoV+vBZ/Fz951Bpb8mINrZq7TmhhEVmfvFi/e6QW8SCn//flBpCPsL1cRz0uxuIDwaSwJoM9d2k33Si7FAfzp7Y+FjU+NoB15mnDC27IqO78wVxDCRmK9PSwSGQqIV8mnIy2oCSjyBDIQ/xVQtxOKobH0PFhw+QNPMx3pq3XRS1L/Jfi7lmUg05CWoAean7SC3AFGBj2iLsRDJp3izXjAPxM/bnmNqXxZyCIgJ3Wy+22w4MV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V29CK0d6ZTZoeUxVRWFVbHlnWitJVFZoNXhpVVhkMXFNRVc0d1daaGpOclcr?=
 =?utf-8?B?cEZ6Z2tISjdtU3hsTEVsZFZjOHQvUzkxaWFzcXVzY1RMT1RZanlOMWVHMk5r?=
 =?utf-8?B?bSt1akQ5c2o1TVVYdFJ3aXRGcWd6Um5DMnVQTHlrZW5CSUVEMDFKRWg1cjc1?=
 =?utf-8?B?ZGZOZ21OTGJyeWYwLzVoYklMQzhvNFhPRVUvZmlqUXVGRllybzc0cVh0eHlL?=
 =?utf-8?B?UWRxSzRCTjJnTENUc1dzOUNWeFdTaGNQMXMwem9NQjdhdW5GY29QRkNxYmhF?=
 =?utf-8?B?TWhMUXp0RCs4U2tZMnlpVDN4YllLREFQZUlhU2NYaGtiMmJsVDJuaXNKM041?=
 =?utf-8?B?K2RyV2V0NDFreHd6VHMzaXU4SkVwWi96WVRRNXBCNk4zc24rSkRZV1FNVUJP?=
 =?utf-8?B?WjdFalp6cWk4ZXptUndEcXZRTTFjOE9WVEs1UTFQMXUxSUxlcnlXZ1pNaGVW?=
 =?utf-8?B?SjhZRWc3R0EzSTNJaEtYNTQwOVFyTHF5Q3lKSVMvUW9IRjNIWDkzZTNtd2RV?=
 =?utf-8?B?a3hxMVhuWnIzcUxnSVo3VWY5UWNkRGVpbWdTWGZ3aWFVdS9vTmFQQXBzcUdn?=
 =?utf-8?B?ZXd1UndLSEpJZCs0TnhmRThMUEY2cEJraSs4cWhMRnQzelRyQ3VtMXN3ejhj?=
 =?utf-8?B?UGovYThPcXh1bVRoVU9NUGFOVHU1N1NVOFlwU2xWLzRKVUt3UUdqVHUvMk1l?=
 =?utf-8?B?RVJsNUZSTnZHN0l3SWpzZXJuNGVseFZGSi9Qd3dFZVk5WWh5YzRoNGk2ZTY3?=
 =?utf-8?B?R3VoeDIzdUU5YjQxVnJmZWtnQ1BCcU5FQ2V6SWFVY29nV2NlUmFNVmNGby9x?=
 =?utf-8?B?N2lXT0l5amtxUVNVRWtPNjNObGltWVh5YU9mWDRBMjlJNVdwblNMQ2FFdkJH?=
 =?utf-8?B?b2JWZGwxcGpIZUk4ei9KU2ZsdUFCYVBRT3JKWjlBN2ZRRzJ3cDZadWxjdytS?=
 =?utf-8?B?RGJNSGtjVkhFSTBENUIwK0NraFBmUk5rc0paQnVNTHhZeFRTbkk2RGNPcXhQ?=
 =?utf-8?B?QWRMck10USs2NkxyVVNmZ2hkSjZsc0ZjQWsyUXRGOUgvaDZNVE9tdTFwenVE?=
 =?utf-8?B?VkdWR2xLNGRaekNPVXZaRkNwdzl2bGUrdHVtMzBzc01oeHgrdGprand6OVZL?=
 =?utf-8?B?ODZIa2dpQ1dmempCNWNoQzErb2xJcW1SN21Dc2NJYnNWTUJxYVhvYklJaThC?=
 =?utf-8?B?RThqUkVySTU1Z0VGUGRWcDhvR0ZGWnRVUHhoYlBrK2hKSWJYWTd6QU5oa1Rp?=
 =?utf-8?B?RUcyQnZCSjlvQVpNT3NRZlNuVkdlUjl4R2lQTGh2OXY4RlRTcDFFcjk5MWZ5?=
 =?utf-8?B?V2wvaUMvb25FYmxDV3dmNnhjQzJCNlF3NzRHakNZalJPL3VZTWxVYVV1cWZl?=
 =?utf-8?B?aklyTTdXaHdjdVI2RmV4dVJua2IvVTVjT2tHcnVrdUJycnV2ZHhZWmg2cVRN?=
 =?utf-8?B?bWpCSmNHSGJ0Sjczd2JFSHIwaHA0eGovMTJqSktRNFo0V3NYaVYvbWZkN0Ur?=
 =?utf-8?B?d2VDcTJlT1cwdGNySnYzWGxiaUU4NjJkenlVSXltK3ZURnIwZHlwSnFKeG9l?=
 =?utf-8?B?Zjl0UnFENStzb283ZURDak5wRGtZL3NLOVdiZzBzVzNUeFJ3cThCRWNRR1U0?=
 =?utf-8?B?d0tCcDNhWmtZUFEvMzg1NmNSb3BzMlRSQ1FjN0FqdFpHYlJIRlZhSG52RDRR?=
 =?utf-8?B?NWFudmkyY3BodkpJVGVXYmtsekV4c1MxYVNHTmx0TVhTZlhKd0Y4eHRyUDRF?=
 =?utf-8?B?blZ2V0srZHpmQWRlbytlbFVEeXZrVkxzOVgzcWwvOE4xYmQ4UCtmdlNwcUx1?=
 =?utf-8?B?b2h4SCsyNDYvRWJ6bXYvRExycDQ0MDFOZXlxaGc4N0NzUHd4MU44bUtKTFNY?=
 =?utf-8?B?MHlZUnlBYnlMK3JZQUszejY4aUxjaXVBY3NESWsxYXRPdUx5NnZ5dmphUVp2?=
 =?utf-8?B?bWEva2Jlbm5wbUgvR0xWaEFDTVpQTGNwSS9qUytIY3dJWTdtNHhaVUhObWFE?=
 =?utf-8?B?bm9jU3pEcDBOMmhWSGZWNDFqWXdHNmtRRTJzdE5PdG1hZllUbFc5R0ZBMExa?=
 =?utf-8?B?YjJWQWpVVHEydHhmRVhQbUlaN1ozcnFrWklPRHhvdHNLazBnZEg4dlpTTHRG?=
 =?utf-8?B?dGxVUWVTVUdSc2RvYkNGenJ6czNocmRabkcxdXEvZVBsNTBJT0phS2k5QUFK?=
 =?utf-8?B?K0ZZbFhoV1lvZ2tDYVo3bVpBM3FWVy9ka0RpOE1RQUNOU3c3aWN1ajF1ZVNL?=
 =?utf-8?B?Y08rdmorZmVBM1hQd1Z2cThVcDc0bTZQYjljSXF2RC9keW5jNFRFOWg4aTN2?=
 =?utf-8?B?UFM4QmV0akFjMW9sb3pUWHErU3hNc3pCR294Z280YldPYTFYMkxLelEvWUxH?=
 =?utf-8?Q?WDJvbLmhRatxrlqd9fz80clVHF7q1paTf+eNJ?=
X-Exchange-RoutingPolicyChecked: Esknvxd1l+uQ6JHqIp5NoI4luXeeTC3LF8SUsFCaR4EYUlM7II+xsHQ+hiwmk9OMOkGj5Kd3oW6L3wFfNT4JkbqtFb8mXsniI4D188dwhQwdViuq9G4ueh3xzn2PZWUOofD5ckn/CipDGZ/x5IgbIx14UA5ZN+nhBZh/+EJB1kG3T/O7I0cmjAJbiwtSwTWHOBIB2YUm336uEgT765TUZrtZFb76pL09bnjh+9loli1fdbtQLYZmiQhkSNrmipcwh4DKHGCu8E8MD/oml4ANSEvI47weBMv71SWS6m+uW/sh29CTl9EaBFgsbxJTElB3Vhp/LPhFum1v59trzeBeqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df7346f-c880-4691-3cd3-08de94d1caee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:16:30.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFkl2OtJn8/lWf+g1Qu/F4sn/CQzRf5Wgsu5Wnh0AqWs/TItfNLvWU32MQ+U8Azugly3PYmFexLRcbZ/UnJYDXY17ihKmMBocx6G/bp0edU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9623118BD
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

On Tue, Apr 07, 2026 at 11:03:40AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Remove unnecessary le32_to_cpu() conversions from XE_SYSCTRL_APP_HDR_*
>macros.
>
>Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
>v2: (Umesh, Riana)
>- Fix macros instead of changing struct field, per review
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>index 91460be9e22c..f67e9234de48 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -15,13 +15,13 @@ struct xe_sysctrl;
> struct xe_sysctrl_mailbox_command;
>
> #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>-	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>-	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>-	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>
> void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>-- 
>2.43.0
>
