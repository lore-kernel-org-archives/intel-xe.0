Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D444C83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 04:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423F10E658;
	Wed,  2 Jul 2025 04:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCl4j+F0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1BC10E63C
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 04:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751432079; x=1782968079;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W+crz4WYtG2wkWIp2BPmAcENMGhQOtIh5c9Ds+ZM7MM=;
 b=iCl4j+F0di3Kjs8i1vnvBchKgQktBZ/a0QyHVLD/8wOnd37LxIXXGaxP
 IqHXXCYm+CpHgg9YM+ZJqclE2PXZPIhTHJPWfcyORUJkrtz+QmywYdOY+
 7486x8YwlU9WimEIJxXuhp+C4L425OHO/HTRCrLGB3+VuUydLxaAymSgF
 DAr/vpc/UmeeZBH8sm00qxKc6eGGH8VcrejkG4/plFMpl8CxOqHLYMZiZ
 omDU7bhq+jvlsAaNsFr4Uvi/vU1Y4xzOop/pi+8T7t4DxCdfcPrWCRn+S
 nIjzJgnaB0GKuf+d9I2LXvOH42cZDCt2VkUQ7XvDkPSeDTL6MnncnE7Tl w==;
X-CSE-ConnectionGUID: CkA/Vel4Rn61Dy0AftdmlQ==
X-CSE-MsgGUID: ZZxrmOjGSdiQqziEusRNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="63960811"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="63960811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:54:39 -0700
X-CSE-ConnectionGUID: Z+odG+y8R1C891EUwYT+8w==
X-CSE-MsgGUID: vw/LlQAwTZmrdlnUEevLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="158525281"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:54:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:54:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 21:54:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdfxUKvm4vOZrgM9m6w3Z4sYZzsBeWGPd1UX6G2+j742Sd7namIKXhR+1h0PouYV/r9rNQwGFw2PkulNtuOm1ekkRVX9NNIZ+toy0SzPOiSRhuHvA1F0lwqHRuE1v1+8QuLytU8ES6QpQ+xlkVOA2ttauACEyBo3Cu/uYQs6tDfNoc+I2LMcYqIl3Q2CKPmhCJ4rj4894fn/FxhOxuFCpnqekMRGm7qArkO7wzUL0sj8ZAE95eMAHGDVbVzpkye8nJZ7JPBxxAZD2q/Zoxc/O0TxZ8T6zeXj41SlR+u+byyPlmYQ2ZCf+n+qPqTr62NrUv1/7+KXRkxD7HKzUYtAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6aOcNUNYWszlPJXNjwZrfUxaHKg/t8ElbE4dhFWqxo=;
 b=l/YMm5NQrhQ4TCqBIALkaIITp1u5zMRBfKxaoZp7ftYlNPvJzpcq2iKtZZqOk0bD/ddTLLNWfD5BAtW8BvEr37bQftQMw6f0oymKRt+0S93hb/dg8EwPrwKKTtwcGx9WNsoKMtuPsgAx7KGITAmEb2PF1L4CFCwyUtwqjEyeShQ1zkVjHi0LqKNMfApxgIGFBPj5Nt2F3nSzj6rKKOIHESkmP8VtqhNRnDT5XYav+T1rWDZDzCMSIxj+vNxfvkg1IPxmbQHRcbDA71n0/fS/EYceNy2Z3vT4xPMqnp0hozFK2OaVkJP8JksYEeih9CQdax4uv89B/vUunrAuVnW1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 04:54:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 04:54:35 +0000
Message-ID: <d524d82e-00dd-4881-82a1-1ffcea682138@intel.com>
Date: Wed, 2 Jul 2025 10:24:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
To: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <sk.anirban@intel.com>,
 <soham.purkait@intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
 <20250701203128.GL4868@mdroper-desk1.amr.corp.intel.com>
 <dn56hltsdh4ftxxrpcvyyow5rmv7j5jipq2mxymmaj4xucgknj@zhnnyt5r545m>
 <20250701211954.GM4868@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250701211954.GM4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ca98f4-e475-4854-fb4c-08ddb9248aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak9tUDhuK1JGTCtSTFNXSlBUMTJDQWNDWDhOTjFROGJvNGswclNMUkJEd1ly?=
 =?utf-8?B?NzUvV1M0SlYwdWRMcXJLVjdnY2krYVBOdmE4ZEZMMmtuSW55Q0JWR1ljWXhJ?=
 =?utf-8?B?WXNXT2lDZ1pHLy9mbllGSnUrUkF1NVE4eHZqUWhCMkxpdStmUktsRUYwdFcr?=
 =?utf-8?B?VDVzek5HUjFhcVBMWjZlYTVsWHVsUTNkU1I5L2xRQ1hUbEFNcVgrM3k1T3NV?=
 =?utf-8?B?TE0wcjk0LzJoNXZFeVBOdnl3aVNZbGNuTWdPRCtZL3JEMFlqNUxWaFd2dVFu?=
 =?utf-8?B?cUNmR2plNXhjQ2JOVHF2cWNEVnJDN3d6TEp4YTJhRHlkUllCSU04a3hvUkgy?=
 =?utf-8?B?K1F2ZjdqUkVmNUQ3TGNRMWpKa3pTZ0F6TlFMeGpvRkVHcnRHcUgzaWZtZEw1?=
 =?utf-8?B?eDJGRTc4TUEzQUZpc1IxREpHS28reThqRlZ6ZCs0dXJhMWVDdGlPVm1MM2V6?=
 =?utf-8?B?U2JiMjVZdENDQVZyTmlYdkNZNE40QnBHS0UwMVlEZDA4ZFhVc3dHOUVUZDly?=
 =?utf-8?B?b2FLMEJzTUtWMVFpZkkyUEl1Y051R0taNU1ELzM4Vi9kZSt0OG1QbHdGbmZi?=
 =?utf-8?B?cjl3YlZsMnB1VlpmSkVtZE1VM2FZSmRmRlBxYjkrbHlKVEJKOEV3UE5SczNE?=
 =?utf-8?B?UytwSVR5T1VKNXhxeWtFNERmVy91ZnFXWW1BNkpHTS9PSFg4dENLZ0dqT1hm?=
 =?utf-8?B?YUhGdFlkNndCNEJ5YlhpeTdDdjJMNE5oRk55ZjV3dlFuYzIvM0JzcmUwSUhu?=
 =?utf-8?B?S0VMN1loNFdDaWx6NTUyY0lMQ2ZyWENxOVVVTVk1RWM0Q1Q0Vm8zK3Z1eTBP?=
 =?utf-8?B?enpMRzlKbWtTdXl3YXkwVmZHVVJTM2t4SHgwc3NRUXlNK0p1eGJXVk9mQVVu?=
 =?utf-8?B?TVZQOVV2YVU5YUk1RnFYZmVNMUhvTzZBRlVpcHFMVzhSMWNCWlpVV2hDeEJu?=
 =?utf-8?B?R2Y3WWU5YkRRVnhpaytCR2M4TzRzYmx0akMyS3VjSWY3TmtPV3FpQ1BNaDFX?=
 =?utf-8?B?NUZNTHdBQlZoQW5aQkVmcmhPaFRkTXlwMGsrQy9TdDZPd2NQTFNRSUNmejZD?=
 =?utf-8?B?bnRpUGNsNGhJM3hHcE9vbjJiZnF1WnRERjV5OTlZeXFYcS9tWWtTY0oyVXdG?=
 =?utf-8?B?QWRzQ1JLc3J4dis5SVo1QWVER2JHWmx6K2RIS1VpR3dRVW4xNWlralNFWlVG?=
 =?utf-8?B?MTQ2MzFTZVUydlBoUkgvR0FGWkNVWEZDYmswVFpnSXZHVW04QUdBQTk1a21n?=
 =?utf-8?B?MVVRWDNvSTl4VTlEV3NpZUwvQmV2UUJSUzF4OS8zcU5EbUI0TDNRY1NzVUtG?=
 =?utf-8?B?b2ozZS9YM1pqbHJ3aGRFK0pxZzhIMmRrUytRN01pM1FnNS8yb0VSQ1hlME5Y?=
 =?utf-8?B?ZGp6ZnIwL0tEK0NLYk01cFNROXZTUklYbm94dHZmekNTdXlHV2JPcmpmSTd3?=
 =?utf-8?B?SHZxOEJPMDk2VG91Qy9idUdMYld3NXBqSlo2TU0yUTFKcjFmOWdVdHhhS3BL?=
 =?utf-8?B?VzhhSjhZM1Fydm9kZHVhMk1ibVFuQTJxVXoyZHRYQVdIMmJMWkpkbkdyb3ZD?=
 =?utf-8?B?QlY5dzhpT0IvcE80b1hTa010YVRYRVRyYnY4Q2QrbHk3TzJOVE1OejJFSkRj?=
 =?utf-8?B?aWxtVmxDekxDRFBYOS9HamJJbkFEa2JwTFJpY1VvTEZmdmM3NkUvazRmOXpQ?=
 =?utf-8?B?YkVtTHY1RUJmdHlKYWgwSytvYnUvMGRiUFdtZzVrNjQ2QmEvMTRCWnlVUWJn?=
 =?utf-8?B?OUxQOVlhUHdFNVlOQ3lqeHJGS2xiVVZ4M0JGYm9JaG8rNnhlMGdWdkloUE8w?=
 =?utf-8?B?YitXbmRZcGpyaWkrYlFFTFVxQ2RENVZ0bktibFlqT3R4V21xZmhOYTBiaiti?=
 =?utf-8?B?ZmRXTW9DRDBPNXN1OE5uQ2hQamF2UkpSZzY4ZDZzb3RxZFJZczFqWmZ4aHN6?=
 =?utf-8?Q?3qzhmqUmS2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hmeWVOK0ZEN2ZXejBFbklYMFBIa0JFSk5vV1N1bitwZFdVVlpMZndtL2Fz?=
 =?utf-8?B?UC9QZWdxMHgxck9NVFVQbnhyNGRRMVV2N2pSaTFDdjlMNVdiVjlrakJjR2hS?=
 =?utf-8?B?N1MyVHROM0djTlVxYWFBclpDZUUweWl6ZEVKQU5DYkI4ekMydnhyajh1ZEh6?=
 =?utf-8?B?cDI4RkdBUVRTdVRNbDZ1dHhZRmtpYkpSWDdINVlKUXI3Sk5DNkpGSW1lUi91?=
 =?utf-8?B?eFVPc2NTREhmUUdBa1JpQzNyV2hxUlhsVUpUYm1HOUxXeFhpRWhkRWRrd3p6?=
 =?utf-8?B?bVBNY21tbkhmbmRDVkdJekpTK0xBNlZ1Z0NGZ1FBc3lnQWxVYTJ3WUVCQ2ZG?=
 =?utf-8?B?V3hNd2h0YnR1S2JRWUJudjdSQ2NPYWxNMG1FeHFad2dmd1VpbDJQNm9vRm5m?=
 =?utf-8?B?dmVBWFdHLzFqZlh0WmRtd3RhTzQrWUx4SGpYbEVSR3FiekxRNTY5d2FGSlE1?=
 =?utf-8?B?SnBKNEU5V3VWKzNUWjN1Z3A5U2FCQXhSTmNvOGtsc1pvT1pDZGlxdStPMVJp?=
 =?utf-8?B?WElEL3JpWnMvYnc5Z2tmM2FORFlOS3J5SjhmV0hhNExSUmhHdVZCOGdQTzBG?=
 =?utf-8?B?cnBEMm5uRVA0aWtwdURxZUtsU2ZtOHpRRHEyMnZ1VGE3QmxMQWZzdzdTMkE5?=
 =?utf-8?B?ZjJkZUc0Wis1d1FaVWVzV3ZHUXkyUmlGWnl0Y1RmZkZXTXBnZXIwMFlTVVp3?=
 =?utf-8?B?TUV2bjZpZTdlaCtQQ01KN285T1EzRlNrbEhGRVVBamk4VW42L05GSnoxdWF4?=
 =?utf-8?B?alVFNjBFc25IWFR2a0dWZVdRQWsrRWk0L3VkcllXT1ZDRThqM25xLys3MGI1?=
 =?utf-8?B?SVMyRFNzSTg0Y2RkdHFwcjZXWlJYMFM2UHo1YmVXRE1VYXRuYVlHR1pKQXZs?=
 =?utf-8?B?NlBMeVJVck5kRkdSa3ZLVmV2WHYycDlEY1J4Z1prWk1mTzB2OHlnald0eEMv?=
 =?utf-8?B?SkFDWmxIeXRnc1E0ZnpwbGZZSVl1Z1A1eFpKdytzMTBlZm4yTGNwUVp4NHdq?=
 =?utf-8?B?UDJKVWtHMXVKU24wRmZVeFJtd1p0ZGhpVjFBbktPTk5QUTFjU01PSm0yUjB0?=
 =?utf-8?B?TXByZktJOE5RcC9KOWRXaU5BMy9JNWhQYVFUV25VNktreGxCRGxCdnlnNGRP?=
 =?utf-8?B?aXJuSTc2SFV5Qm9xQVFpOUpIWTJEcVBPdGUweGJLbmJMTmRoblYzK1JhbHdh?=
 =?utf-8?B?SEhacmg0VFd4RUpScGtuM1grakRFK2FabXhzajlXM2RMeUNtK1ZSeGJWSjIw?=
 =?utf-8?B?NHNZdUZiQ0ZvWFljaXU4aG1ZcHlCYVZYSSs4Wnp1cUhZYy9RclBJVzR0bmNp?=
 =?utf-8?B?VHRkeXpUeWsyUS9lckF3WkpBUm1qWFVqbHVxUW1ZV3FpbVBhZllXRmNmV0pH?=
 =?utf-8?B?Q3d2RHp6TzE5TTJjdUxUeTRDWUZpR1VqQ3VaSGptbjZXM3FNaFVCd2piMlpv?=
 =?utf-8?B?anh1ZjhKWnU2dWhPeGNlR3JIUmhuaFNuNFdBZHdGN3cweWp0S1RTRnNseWVK?=
 =?utf-8?B?WHRHSmRPVjdLYW1UZmUrMGNVeEMrQURqbFRaZ2tkQ0MrZlE4RW1YZ3d3aU10?=
 =?utf-8?B?UW9DV3Q4a1hEckZzZkFjVVRtNzlQV3AwLzBkWGlQLzVMMnA0WkM0M1hiSWpr?=
 =?utf-8?B?RUpnUUVqSHJFT3VIVUEwK1U4UnN4TFlOYTR1RDhJemVtQkFDY0ZJL1czT1l5?=
 =?utf-8?B?dDBSNXF2ellicmZIY0kwaDRaUzZGdkgxZ1RybUV4b1VSVk9KUTBBRU03R1lK?=
 =?utf-8?B?NnNoTVlrdmp3cVVyc1dEdUV4QklnbjZzallHdU9MTEYzd0t4K1FibUJYUHVj?=
 =?utf-8?B?WUxrWGh0OWF5S0ZIZjBwS056YjJybVVhWEczSDVsY3d1NWE2djhaZUd6bHlv?=
 =?utf-8?B?aVNPQ002NmpBdWdSOXVGSU1KZUJ3cWdaSnQ3MVhUQzUyaVpGVjRGaFBCdk9S?=
 =?utf-8?B?SFFQVkdnbWJLK1BBN3VBMk14ZjArZnJ6SXR3eHVNaVhmOUJjcytBN2srZnEy?=
 =?utf-8?B?cWpvbVlFZDdKY1MzbVpLUTdhTElkeXU2dnhlSDcvU2Q3L1NpcDBFNlNYYnBV?=
 =?utf-8?B?VnFnbGEySlkrdFRjemFXTUQ5amdVcWpjVGZ3U2ZYRmtlRVFjSjNvNGd0OWY1?=
 =?utf-8?Q?h9CFE8rMGeoZkKf9MOc/tyb/P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ca98f4-e475-4854-fb4c-08ddb9248aad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:54:35.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUIg/QHaMkaQH51gk5mm5z9AwFZBeeZclItRCAIHcXLE6Ao7yWwOqFbbQ2t5fuAiCsEyaaskm4A2qq/sEwaIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

Hi Matt/Lucas

On 7/2/2025 2:49 AM, Matt Roper wrote:
> On Tue, Jul 01, 2025 at 04:09:44PM -0500, Lucas De Marchi wrote:
>> On Tue, Jul 01, 2025 at 01:31:28PM -0700, Matt Roper wrote:
>>> On Mon, Jun 30, 2025 at 05:28:53PM -0500, Lucas De Marchi wrote:
>>>> On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
>>>>> Validate gt instead of checking gt_id is lesser
>>>>> than max gts per tile
>>>>
>>>> I prefer the series from Matt Roper that is refactoring this part well.
>>>
>>> I think we want this change regardless.  My series is about refactoring
>>> to future-proof the behavior in case we wind up with multi-tile+multi-GT
>>> platforms in the future.  However Riana's patch here is fixing a real
>>> bug in the code that exists for existing platforms like PVC (i.e., the
>>> code currently lets "GT1" through as valid even on single-tile variants
>>> of PVC).
>>
>> I misread this patch and thought it was an impossible condition that was
>> already protected during event init and it was added more as an "assert
>> we always have this". Now I see this is the call that actually protects
>> the event creation. So, yes, this looks the correct thing to do.
>>
>> Riana, could you expand the commit message to emphasize this is a real
>> issue for platforms like PVC?

Sure will do that.

>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Thank you for the review

>>
>> thanks
>> Lucas De Marchi
> 
> I did just notice (as Karthik also pointed out on another part of this
> thread) that if we apply this patch _without_ my series, then
> xe_device_get_gt() could throw a WARN and return something non-NULL if
> the GT ID is too high, which doesn't actually help.  But if we apply
> this fix after my refactoring, then xe_device_get_gt() will return NULL
> on any invalid GT ID and the logic here works as expected.  So I guess
> rather than applying this on its own, we could wait and apply it after
> my series (and I'd drop the patch #1 that I had added to v4 of my
> series).
> 
I misread Karthik's comment. Yeah makes sense. I will wait
and apply after your series.

Thanks
Riana

> 
> Matt
> 

