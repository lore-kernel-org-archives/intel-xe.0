Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD2BC55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 22:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01310E0E5;
	Mon,  3 Aug 2026 22:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UV4+cLPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE4B10E0E5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785796447; x=1817332447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K1c7b1gUETTqgeWMmE2QOG6Pvj7hr5B0yA2OZjailn4=;
 b=UV4+cLPolrUMv43yqKf/+Fu4+ycKOh2YkENKzLQaI9nTPmUTIFIj9LWE
 1kP414B8A7fULZQ4LSclnRQYHqcMJgYXYvmJneoJ85Sh6Q7eJ5SPC+OX7
 bULuVZSxasa//u1wMgi0+2QkOz4SmSdY9eFX6xcjlPesPISemzR8hAsrn
 4sOp6Rk831Sx4gD5NNdiNNch1MqBtn0AURoW+fmvmzBDVyyC1bj+N4VQ0
 Kda7mALDNffIRzngpEFETYE/pupRyxTX0paChsHd9HLO+aHpmN15UV7eI
 Cw4FdT8qLDgy2vcjgzjSxTklXvS5ApblL9RFs4oDtYePR5NCa8rEamRlp Q==;
X-CSE-ConnectionGUID: TnEuCi7qTVqQ9Ooa8VPBYw==
X-CSE-MsgGUID: Se5I3C41T2WZF6US4hwgug==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86539058"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86539058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:34:06 -0700
X-CSE-ConnectionGUID: gIgdMqG1QuWOlTSNF5d3xQ==
X-CSE-MsgGUID: v+qNVYYBTNmQK8H0Cb/Jew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291279940"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:34:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:34:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 15:34:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktcMoKgOj2Q45sa6/tHrj4uGTPnKaniyApC2Dv4y7SC2PEY1nr4s5dXhgPLXLM29GgrAMNt73pMmFUPmLD1gb5hshcFJEfizsipr3U3cTWH9UGbzQG1pTLVI08u5fSvNz2jHQ8E3OLg8ufnGHaONHlKksB1IqocvaxUGwjJZcP4cWpqXsHWJVbigxuqO3IIHdKnSneLowQZdlT9Ypt8Me1IbqQW/li4BCB7kSgsZRZWYOiSC71N6thGjvZc0ijzXAOKgNWZQWu6Bmc/QY8VqARJPqyGSApOo2KkZ2E+dwgYg+x5aCC95JzLWitfD+7teestLJM414CiyS0zQiHaCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCVMKfUfSfizuNwNyVYYYnmgScK8RXm4DGRNK5HtIyM=;
 b=TuwmqFBh3X/gYeikWaQ5ufc1gxLqkynJw+QkcFS07h8ybrtDqPIYk2mkXuNb93rkslKRNd/Rpjfq/LQE1R0mot4Vya+DS5T+hSwvx1PECEq1jFnC2QlmOZEwLe77GWr9q8R3D/xSo/IZXcp7ny/qe1Jk8+U9fsHnwQ8XwomkGDRWCKLgZPWC0JMP+9hFy8j4U+vZmRMm0NWuxRHhpPiLUv90SC/oTBByzcvNvoxWi7knkHX9ckHrsz/FDJwOO4kisPZv2tneYdl9idhcmciAe1cT5IPwMwiHC6E6F3GDVZwJdeCFvcXs0/7ncFT2Ig3QIPNfvEJZUKlYMeDbnZpMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:34:03 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 22:34:02 +0000
Message-ID: <4ef87518-3755-4289-a224-9252c325c4d6@intel.com>
Date: Mon, 3 Aug 2026 15:34:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe/xe_late_bind_fw: Convert late bind flag to
 mask
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <anthony.giardina@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
 <20260723083659.716683-9-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260723083659.716683-9-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: c3959cb2-b313-426f-339b-08def1af51c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nvsS1NiYq8k7TgEqAX87KUu9K6U3RElV6x9QWwUm2K8qd4VAGb+d8xiF2jIcbqjlgF3UN/GvjWLLf9n42U6LgFdbI8ux6VLdpyb8t1DIpU0h9VlVj3KezYmMvHlMUIsKmH5hs/0D1YZ6EyBJSpXM+YG5Oe7CrI9wqzCBxpCTJ4txCi0wVPnFSIohKvJxl71AE+W7VuKcSawnjy5EkKYlk2dpYYNJlMacTOHb1WbO+XiSpszoSkDZQd3tXRAqG7dE39/JfH7XNTxl7AKgvXZZ2xtLYOGQMuQTlpfeQWx/29B3/UUH+pxRGEmnSE75qynGMdH+2jiYr6zU4ACs9dlFU0kNju/4/WUIoLfQDoRItBnj59/ue1l4FkE7bc6khq/etW/zUw8HSJx0b7i1V2C9zFMwRBtFfTRO/6fvs7QKeTTvD0vyrB/SeKsknXmxebAMOpIGtDmKdco+a7iOXltG/p+ZmnrtwXZVLZ6j7KC8Ep8o5l0LXgVP1vNSYYOCpbuUBtxo8Ghw+YvvpyYbrjm6OUlmx77ACXs47hoiQu1uitHzemJA5PyTMbF+Pjq+L8uKOQPXa5WnvDCiruoW+nwPjdYJ1VOK9X/tTW275wJktvHaDMwq5hAb7q8NlzQOz6RVuTGFGJe+C9OBW5GMdoJrQwP1PAuSOZYQ9g3UrwjW4h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdRTGxBdTdWSXBYRThUUXlwRDdQaTU4SDVWUDBYOHJMdFJFNkErYlhWVi8y?=
 =?utf-8?B?aXF2UysrOHZ5UTR5ZFJMN012NFRFa3JPS3hvb1AwSDEvbGlhd2UxTCtsaTZG?=
 =?utf-8?B?d2xvWStVeURyZ3BPendoR2l6ZW5PemFTRHpoQVFZN0lZa2VPeFlBelFyZkxB?=
 =?utf-8?B?MmpGMFFCelo4SVR2eGJtY0JKSFh3VXhnbURvbkpVT1Z2aTVGcE5ob2JmRFJY?=
 =?utf-8?B?dXF0TnFSeWlUYy91ampPeFBJR2ZHVzM1cDMxcVhEQWRDQVRhSlI4bmZ0MHhj?=
 =?utf-8?B?OTRBTEQ4NFZKQkVwa2thV0N5VjJYRC9Gc3lrd1krbFlsV3EwTnU2eXpRUFpH?=
 =?utf-8?B?NTRBNzJaekF5OVVrWE1WS0wvdE5zV2JJWUx4TlpmWXc4V1VHa3l6WWxaMXY5?=
 =?utf-8?B?ajRtaURsUS9BdWtMcEJtSzc2MEgxWnhESE5oYkVUcGpaM2hQZmNkSDE1ZTRz?=
 =?utf-8?B?Lzd5SVdMUFVnSitGSTNjczBwSEtNVURnSzUzTzFQc2Vxd0dRY3lQVUtPV201?=
 =?utf-8?B?ZnVQbHhVam9DWk0waVcxc01WSGJ0dWl3MmR0Z3BkeGFGRHp1RWhJYTJrSmVl?=
 =?utf-8?B?dDJXeFlmL2poaUx4dnRHTGFJNW5wcGI5RlRsaTkwM0NvY1pOZXFIU2NQc1I4?=
 =?utf-8?B?ck9YSVJ3SFNmbVJwWXk2L0RVaWVpWm1pRWV0ZytSOEEzZDh6K05pSGtnK2hT?=
 =?utf-8?B?enBqRDhhZlVGZWM1U1dnUTIzR2gvZThlNHFYeHZibHREbkd6OG9ycHBEbFE4?=
 =?utf-8?B?RVkrR0YzbitpSENqbVg2MXZ2Z2ZkN2tBamVQbDJ2YUErQ2U2QVo0dkFiOWdn?=
 =?utf-8?B?QmF6YmxWY2FpVVJSNTVxcXdlam8xUE01UmpWYW5EUHFIYlc4K2wvRUNicTg4?=
 =?utf-8?B?SnNjaEU4KzcreFNFeXFvUmtrVkFUeXhHbGFPMWRjL0xEVnd5RkF3dTcwaEtY?=
 =?utf-8?B?SHdvTC91MElSM28yeDY2Vi9iZXUwb2lwVEdsTXFab1hZR2tZVmVtYmF1dFVD?=
 =?utf-8?B?aXJEUkFvTy9ab3hXTlMxRWMwdVpXeitHbzVGQ0J6QjN4UVdPM2JEalYvSkds?=
 =?utf-8?B?amNpNVlEZEdDUEZBZ1cxcVBralVKUms4b3FrVTNjSFU1dXdBdUIyb0Jwckxr?=
 =?utf-8?B?LzlGbVRQdm02b1Z0ZkgwUXhodHlOQlBGMmRTdENnMDVQVUlFWGd4ZXo4UGVM?=
 =?utf-8?B?dGVlQWE0S2drL3hZaFNUbkU3VjIwa0N4eldheTdQVlN0cmRJWW5EcHVFWkx5?=
 =?utf-8?B?Z1p1aXE3UGtjM284YXVQWTJldTcwV2FNeFVTYlVmcFIxeVhGemVHMkt3WDN3?=
 =?utf-8?B?YVZLbGtXM3UyOW9hL0lIb3BCSmI5LzdNdWhSbGoxbnRZbGdFVlBVTFdUWUZ2?=
 =?utf-8?B?bFpwQ3VFODJFNGFxWXM5VzZjMjAzbVBuN1NkRDhQejdjdHBGc2NCU1VucHNn?=
 =?utf-8?B?V0pETndtV1NMdjZLR3pnVUFvRkdrV3dSdDBQQW1XK01xVFBTL3hLanFnaE9y?=
 =?utf-8?B?VUJKZ3pGOEsweGhHTHpGR0EzWXFHS1JwQkUrdkhKZ3VrZWROSzlMSFQrWHVL?=
 =?utf-8?B?UVE0RHpDZVNrUkxHSEhHZlh4YmdkYnh4ZjJ6NWdaUHVuNFFpSTNKSEhjOW5N?=
 =?utf-8?B?Sk92UkJtaEdVaGFtRWZ5QWJEMzhQeGsrYW9OQm9ZeDJ6YnpWUExCVjVGaVBO?=
 =?utf-8?B?SGJTbmpYa0ZZTjI1dEVYNUtiMTY5NEpZQy9GalVEOERIaXVsZXc2VEgxV2FL?=
 =?utf-8?B?K20wdktnUFlmdllOMVFiRndFbTNCL0FHUExLSFppc21uVmZ5bGNoYS95NGxN?=
 =?utf-8?B?TTRQdU9XcE5MbzVxcVBwVWZ0OExYL2VhYm9DdVpDbU9adHVFaU9NbWZiR2Mx?=
 =?utf-8?B?dUozL3hDY3JGRkMwcTVqc3B5aTJEOUdXNWtSOUExdTRWamNkTmZxZDhTVEJw?=
 =?utf-8?B?NlZEcE5FVnY3WGxEUGh6akI3QTRIaTN5VTdUM3RVbHdtazVLVXRjTXhPZFp3?=
 =?utf-8?B?ZGJGUlo0TUVhd1ZORjJLT2ZBV1FqWHZiY3RXSDdPNE13ZENLQnVKUnJhVXhL?=
 =?utf-8?B?RGV2VUVRbnh3aHZEb2h6aXZpSGN3OWZ3YUNvZ2hucUlLSlZoM1VFanpwZlZl?=
 =?utf-8?B?WmJqQW1ESVVZRWVNQ2M3UUR0aWMrTlUvVEd2eFJXbGo4YXJaN2Fhclhqckl0?=
 =?utf-8?B?VWhUWUh1OTh2QmlHdzFwNVZ0ODdUeUc5ZjJNb2ZJa0sxSzNTcis2S0cyTkdw?=
 =?utf-8?B?VXJNU2ZMaVh6MFZIY0RsU2xmOGxPZExrVjdlR3ErczNsSUZHN3Z6ZWhxNzNp?=
 =?utf-8?B?RFJvQTNCT2xBb0cyVTBFMTVBSU43ZVE2U3lGdkhieHB4VmZyVE1DQ3hYczVU?=
 =?utf-8?Q?HA17Q6s60yaWV94I=3D?=
X-Exchange-RoutingPolicyChecked: jIRiCmKcKjr2BpznQKkWBeCFHrgf7JJ/Yqey/W6O1vmyt0lQQ30Etsn6Lg4ujzAer87u3qoDxkjTEoVx+dH5c2ZVciBTW7RYUcVzDgwpfzbSemFEHlyrbWfmv1/dtvKYHtseiRkPWk1ggvwu7nVGYS9nYa5GZjpjTCQ3QCL1kc7uSQj9659k74f3+fD51q7B1bvh2IRZEPhUMp6KJd4HG16gcO6klUNpfgY+h9BeR5LK04siO2LLkRB4+K5lMkGZRFd5xj2GYa38qJEJ6zYdPlBON392PzoJZ/e8z8acL23RIuFdkGXv9+w9FK5AmEMcJk2yWtsXB2LXCFx6z817lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3959cb2-b313-426f-339b-08def1af51c9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:34:02.8051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NAs0E6pvxNX70KSKSSHVo6jMJ64vPrYm8pT58EnFkTQOYCePT6K2TNiEs6fiP0wsogivO4tzynS+7ktQJiXRoR/3S3kMaunrGbfbnp54ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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



On 7/23/2026 1:37 AM, Badal Nilawar wrote:
> Replace the has_late_bind flag with a late_bind_mask to support
> multiple late bind firmware types.
>
> No functional change intended.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_device.c       | 2 +-
>   drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 5 ++++-
>   drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
>   drivers/gpu/drm/xe/xe_pci_types.h    | 2 +-
>   5 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..1849e1f072b4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -738,7 +738,7 @@ static void vf_update_device_info(struct xe_device *xe)
>   	xe->info.has_heci_cscfi = 0;
>   	xe->info.has_heci_gscfi = 0;
>   	xe->info.has_i2c = 0;
> -	xe->info.has_late_bind = 0;
> +	xe->info.late_bind_mask = 0;
>   	xe->info.skip_guc_pc = 1;
>   	xe->info.skip_pcode = 1;
>   	xe->info.has_drm_ras = false;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 860ad322237f..db56d35f453d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -139,6 +139,8 @@ struct xe_device {
>   		u8 vm_max_level;
>   		/** @info.va_bits: Maximum bits of a virtual address */
>   		u8 va_bits;
> +		/** @info.late_bind_mask: Indicates supported late binding firmwares */
> +		u8 late_bind_mask;
>   
>   		/*
>   		 * Keep all flags below alphabetically sorted
> @@ -168,8 +170,6 @@ struct xe_device {
>   		u8 has_heci_gscfi:1;
>   		/** @info.has_i2c: Device has I2C controller */
>   		u8 has_i2c:1;
> -		/** @info.has_late_bind: Device has firmware late binding support */
> -		u8 has_late_bind:1;
>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>   		u8 has_llc:1;
>   		/** @info.has_mbx_power_limits: Device has support to manage power limits using
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 1529a1de4051..8f3be55060f1 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -366,6 +366,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   
>   static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   {
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>   	int ret;
>   	int fw_id;
>   
> @@ -374,6 +375,8 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   		return -ENOMEM;
>   
>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		if (!(xe->info.late_bind_mask & BIT(fw_id)))
> +			continue;
>   		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>   		if (ret)
>   			return ret;
> @@ -437,7 +440,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>   	int err;
>   
> -	if (!xe->info.has_late_bind)
> +	if (!xe->info.late_bind_mask)
>   		return 0;
>   
>   	if (!IS_ENABLED(CONFIG_INTEL_MEI_LB) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 36d62927b969..283919fbbc04 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -421,10 +421,10 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_gsc_nvm = 1,
>   	.has_heci_cscfi = 1,
>   	.has_i2c = true,
> -	.has_late_bind = true,
>   	.has_pre_prod_wa = 1,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
> +	.late_bind_mask = BIT(XE_LB_FW_FAN_CONTROL),
>   	.max_gt_per_tile = 2,
>   	MULTI_LRC_MASK,
>   	.needs_scratch = true,
> @@ -802,7 +802,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>   	xe->info.has_i2c = desc->has_i2c;
> -	xe->info.has_late_bind = desc->has_late_bind;
>   	xe->info.has_llc = desc->has_llc;
>   	xe->info.has_mert = desc->has_mert;
>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
> @@ -818,6 +817,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.needs_scratch = desc->needs_scratch;
>   	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>   	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
> +	xe->info.late_bind_mask = desc->late_bind_mask;
>   
>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				 xe_modparam.probe_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..d1d41c65133f 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -28,6 +28,7 @@ struct xe_device_desc {
>   	enum xe_platform platform;
>   
>   	u8 dma_mask_size;
> +	u8 late_bind_mask;
>   	u8 max_remote_tiles:2;
>   	u8 max_gt_per_tile:2;
>   	u8 multi_lrc_mask;
> @@ -47,7 +48,6 @@ struct xe_device_desc {
>   	u8 has_heci_gscfi:1;
>   	u8 has_heci_cscfi:1;
>   	u8 has_i2c:1;
> -	u8 has_late_bind:1;
>   	u8 has_llc:1;
>   	u8 has_mbx_power_limits:1;
>   	u8 has_mbx_thermal_info:1;

