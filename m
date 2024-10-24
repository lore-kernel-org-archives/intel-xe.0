Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA782CDDE69
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 10:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8391810E8FD;
	Thu, 24 Oct 2024 10:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3sZSTSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E854910E8FB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729764151; x=1761300151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BRONbXFWzS/7SsRThgqNd5SeEXaDtT1wPzb3nzBF764=;
 b=X3sZSTSnjvxehbLlmN0pNPKaMHBLTmwhFUURI0cUtxpoo3Xy9IDwq6j1
 SvqWLX4jmcpQMrgcNClD+Ccor008hKQQRtTBjmR6X/2lTcZAQ+UOOyHLu
 4AlFzDkOPJV1Rn24EiRjzvwgJuAshuEgSKEfyczv5mnIPVscqgD8AnU+E
 oxwYvWrRri8CpiewfkrUNmYc6FYJ47lQ8i///YBYK2cWoLcClFgJzzdhR
 sadlS4p/ne6lieqEUNE3ayUlCrtjAbkE8qZf0FehJKbF2gqrSse9RVx+N
 cPi5R5Ks1HqzzU9XDYV35BbW9Bk+hhsa/j5J7ii9EkLcjH1t0/6TIk1ae Q==;
X-CSE-ConnectionGUID: t+kGT9B1Ry2iQW6sGz7Yng==
X-CSE-MsgGUID: 0e/vAA0dQQGX484mECC2yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29497708"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="29497708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:02:31 -0700
X-CSE-ConnectionGUID: myFWq3RxQcukV4ocaDPpZQ==
X-CSE-MsgGUID: P9TnCSc1TP+25amSwnSl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80471595"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 03:02:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 03:02:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 03:02:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 03:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Nf+toFRTGU1FSSO8WTY+yzd91pyn/JhaO+YZi11vLb691gz6vWvNKJsK9yxsJ66U0W5KC926juIy5CjdI724Puuxs3bp3YhL5H7DEPtg3qfAKV5NeJI02uwtAdiUlOS25Wz0KS8VruuaONjqVNH5q+dzkh9az4WaLglWZZlVuXxNBhlMRijW/ANVPZ+l0WaNZv7HmPVP/raNq+974hkSdYbX7D4nfNiH/GIZO9vdWuQU1UM9TJzGn5g5bIKVMENo0i4L34OF5vQjQzo69nDS1ZgZ+Y783v6JTkA0FTpYzEIKkVLHtV9s7ibXRfXapXHUMWtS8Y/TRT0hmhBql+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdFSO+6evuW5jK8WbHhiNDDATQ0Q4UbCjKOaviiHDDU=;
 b=u+hxqlBK2RLsac9LZI8R7j5pB3XFNXpXRQ0IzX7GmIrNOrMFdA6XZIjsDRhpydDo/hx/PbySoDYp0MdJ3jl35AB7p3UA+d1Cu9scfuoZBInoPXBbGMoLSxsd1V+VLuQoEEqu4OXpHTUnQXKgn7vuRUQc1X/bDhtVWSaK7qdWPVhxLYSY0cAeEx82qfKhMXq32Ig6A5n6LTgzVc/NmsU4OxUW0mCdQhFZ4911bi0uPPZJv64liiIc8ZYcnEirkv2tgSswT8hQ8FJFMNllknlCr0p3AHhmwhPfxs4DhKSBVzAgdmvY6oHP8pdj1T8kvEwLS5lOhxtn8FgE6cCTy9uluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 10:02:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 10:02:27 +0000
Message-ID: <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
Date: Thu, 24 Oct 2024 15:32:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241023151343.3463640-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e386de-15ee-48ad-7ed5-08dcf412f6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1NoU1NZVCt1UGdOcmRqVXdTZ0xQUkxWYlBWK1lqbDBnV0p6ZDMzVE1VUGVH?=
 =?utf-8?B?MUFpKzNDUi9tTTlsMVNnYUVpaWJGUTZYckRXUEJZcm5zZ09CbFA1Z1dSU0U2?=
 =?utf-8?B?enMrNmc4bFI5em03d0Ntd25CWGIrOXNHTHRxWmdXN2RjUHI1N09WVDFKVUY5?=
 =?utf-8?B?dzBzeUxrWWhoWEtXRUw1ODEyQXEwblI3K08rWGxuZkozR0txM1J3cWh0c1Ez?=
 =?utf-8?B?Q0k4bDNtTHpUcm9WbmZQTnd4aE9QOHgxa1hqd0NBNDVGdExOT3BKeXAzZXlY?=
 =?utf-8?B?dkNnNlFzZ2ZWTnljdU82NkJKTUxxcE0rWU1SUkxoUUJkdmgvdGRjbWlDbDk1?=
 =?utf-8?B?SVVpdjVzWU9kTVVyMU9xQzJmeDh6b1AxUUI4QWJZR2VqMUtUQk02S3JQelo5?=
 =?utf-8?B?ZFZjb0hzek5yZDZjQm5nbHV1L1VFVUY5eTZrbkxwOGtYQldnMHlHem9FeXJh?=
 =?utf-8?B?QjU1cjVBSGlRYWtlV0c3ZS9tU0dKQkR4OUZzdkVSSW9pTVJXYXFnczBNMUd3?=
 =?utf-8?B?UjMwZjB6anhiRUZHQkY3dFY4OEVjdnBXQ1hqSnJXeFpVUkl0SHUxVVBObU42?=
 =?utf-8?B?N2JBQU9aaER1VUNzUXkzR0lLbVpmRngxSW5XKzlySTBONDFKdnppTnpnRFc3?=
 =?utf-8?B?cm5VZHh0aGllVExHUGxRbTltMjZBcENvQko2NXQwTjdPb2o1VGVRSEYzeTBh?=
 =?utf-8?B?bVRaY0dXb2hrUU84cC92L3IvR1V3bmpZcksrOUJOSHdRY0xvU29nMHBkZ2hh?=
 =?utf-8?B?N0dVWEt3eHR1S1A5ZFNHVlZUMXIxaWZEbnY4Si9UTUk4eEV6YjVQL0oyNW1M?=
 =?utf-8?B?Y3l1c2JSNFE5ZDduUy9oZ0FzbmJUY2lGU3BBZ0lkQXJLcUZQQVhZOTJVZ1po?=
 =?utf-8?B?WlZsMnU2SWFNV2ZyM3Q0eFNuOW42YTVqK0x0eGZseGdUNGJrbGFoWWV6S0pO?=
 =?utf-8?B?TzQxUXlBYTRGTkZUZW9aSXhDc3JXVlVabGNIZXFOQjh5U3ZvdGlaUXY2cDlF?=
 =?utf-8?B?QnUyaXQrZkpWb2VGRk9aMFdiU1lFSGdFRkVJYitzMlF2dzY2RWRPNW5KWXRK?=
 =?utf-8?B?WmIrYlpLd0hXaXVLUDF4Z2pKNUUxT2g3aWsrbEUrYk5IdDhUbVQ1S1I5a283?=
 =?utf-8?B?NGVFYm9UM2Z2VHBQSDVlcWxES1R5eVRmZDdtUTY5a2h6MC8ya0ZncVFPZGpW?=
 =?utf-8?B?RTA3THdqSVRFaU45SUZ4NWsyMjR0YTVnbVhwOTdBdDQ4bE52eTR3LzJaNkhT?=
 =?utf-8?B?UjlxUGYvbmZnQVBUSkk1WDU4K3B4aEFWdnpsWlVBNUU3b0Z0bHg0UVQ1MGtJ?=
 =?utf-8?B?eEZJc0hXYTdId2VNT1FDY1BoWGorL2lrOTRBQlJRQTBpN3hvYkkrZ01ic1RR?=
 =?utf-8?B?UVk5L1JtdUx1ZXZrMWUvc3AvaUpXNm13QVZ3MkpMK0s4OGhzQkttZS85VjUx?=
 =?utf-8?B?NGZGTG5vQXJRZXoxTFRXRmdyR3JVSlViZTIwalF0YVh2V1BNdVdJcUNCVzBT?=
 =?utf-8?B?ZTVOdGF0cHBpcTVaMXp6VVVJcFE0UlhGU1RWNUUxVGRGYjErMTExUWVOTFdh?=
 =?utf-8?B?OXJ1WE9iOUc2L0dlbjhFTnYvb0t1bWpZSUkyTW9MUTZJaEtESDBSenZKVThk?=
 =?utf-8?B?OUc1Wk5JMWp3VWQ2NEJDMjA4UHdmMU1TTTl3U2d0em0yUDdkTTJTTTlQUTFu?=
 =?utf-8?Q?QOBU65L3FYUlHH1F0jdQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFETytVNFRDT1VjUzExWU9EZU1VTXIyNUg0TFRXd3R5dklPVTZ3NWNWUFdM?=
 =?utf-8?B?YkVzRkVnd0FYWVZlRmdBQmNPcTdlK0E5SDNLZlFlbEFrbGdyVGx2NlV0UlJ0?=
 =?utf-8?B?OWp2UzZKV2hpcUx1alVzdXo3dUFMWS93eUcrSzIvZHVEZnZ0NzB0L2VPQTVm?=
 =?utf-8?B?a1AzdzhrdWxkU2I4dnNTMmh1UVNxVGtScjJ5eHFGSGhKM2c3UEVjSUYxYVBC?=
 =?utf-8?B?WUptL0MxeVZNbkxwSWU0TXA1Q3MrTTl5Rzc5ZmlpR2EwYmlPNm1xYmRuQkNu?=
 =?utf-8?B?VEZ5cWFVT2R4KzJqRDg0MWlNV2hHbllhQ0NoOHdQVk5yWjBwQVR5TWUwVTJy?=
 =?utf-8?B?WlUwNjVTbFRHVVVYbHRaUllmN1QyVlFvRnZRdUUxdGJNWjVRS0F2ZWhHdVIx?=
 =?utf-8?B?RWU1YTB3RE0xb3hqNGMwblN2cVkxdFdjeFh0dGg5M1hGU1RTVlB2dTlVK1Vx?=
 =?utf-8?B?ZjRJOFArZ2t2bWhrTkxBTEVxRXUzM1ZNdW03RkkvYktRRzFZM0JSNFhnMXJh?=
 =?utf-8?B?eVZGUERHK29UWGdLVCtLMjZ4R282bHNka1JwYTljMUZXamZaYzE5N2hLN2FH?=
 =?utf-8?B?bEVQbG56S2lOVUJDcWx3SWJPeGo1QjRiVjdvaTFqL3A5N3hMRjhZaTVPc243?=
 =?utf-8?B?NWtuSHByUlJtaTg2WnN1R0ptZXVaNE56V2c3TVI5SENrTnhId0R0aGd0OHZ6?=
 =?utf-8?B?Wk5uN1dlSk1SN25BMDNtL2hVS3JWeXY0emJCdVVELzFFWGx6a01FVXdLTmZW?=
 =?utf-8?B?ZUQ1cmF6MHNUZnhMRFJ5Zjk5Mm1SejIrSXRiTmhYcFJrZ1l2R1FnUUMzTlNa?=
 =?utf-8?B?akxDY1Bjc0FHRFIrOXhKTTJhSkh5WEg1Z1llYlZPc3BkMWNIaWQzNmlyQVZL?=
 =?utf-8?B?UytNM1pRc3RLeVZ1azQ2eVloaThUZnhtSEs4bGZ0akR3SEtMd0J5MUhoTWM0?=
 =?utf-8?B?L2xJY29IMktOTmQzeGZiUHpOQzZKZkNTZ1JaMGl0OGpFQ2R3c2ZTOGtTMnpH?=
 =?utf-8?B?bEg2OExQTi9BVnhnNWQyaFk3L3p3NkdJekZNRVZ2SkNTayt6RHBKME95aVlt?=
 =?utf-8?B?TmNybEowcFhZcXIyd0F0V2hEOUxoZ2QxZy91Sm9ZenhUN2cvb1hVYW9YanZB?=
 =?utf-8?B?NmxaMHA3RU1DQ2xhQ3FqNWpZSXhyQVNiUDJDVkRzMDhCMlhRRkV2RGU1aWV0?=
 =?utf-8?B?MElrWHU0aTJDQ0tMNmtwbG9iajJoZTF0a1BpU2FqOGU5cGZ2VEFiT29wU2Ur?=
 =?utf-8?B?TXR1SWphMjJvZWRrOWNRMGFqTW0rQnZzc1ZPcWNIN2NaZDF6bkpQK2p6Mnh2?=
 =?utf-8?B?TzZ0MGVEOUVpRW51VC9lditLUzRxV2F6d1dDdDRFK25ISjJlY0VJOU1naGR4?=
 =?utf-8?B?S2tIaE1aZ3M2Mm92SFBGQ3FxVzNMT0RYYTVUOFAyTXROQlJaOURpU2dtTTE4?=
 =?utf-8?B?K3dIdThib2tha0VNUXoyTExycGRGTXZSUWtib293YVJLMHU2Z3JHTmFZU0lI?=
 =?utf-8?B?NFFic1hSTkNsUmltdWhYbGxzbjNxMVo5bTNibmlXNmdWTnNrY3NjTVZrL2pi?=
 =?utf-8?B?MTRHblJGamJYNXJIWm05amZ3TldDc25zWlhZUERIK3gwcnkyRmQ4K1lBbVJh?=
 =?utf-8?B?d0EySXY5cDNHL3FWTmhabURuV0NUd0ZpeXlXODAyZHhmTHg0MUgwbGRhN1cy?=
 =?utf-8?B?MzF4NGtKeno5U1lkbm4rT043WThzeHpxRWJIdUI1d1V6U1F1WWJraFpZM1dD?=
 =?utf-8?B?YVk1d05aS0lLWjV3LzJVc3RweWFRd21MYWxxNzkxcDY1TzEyd2hMK3hMMEtO?=
 =?utf-8?B?Znl5ZERGZ2ErZXQ1dDYzOUxENEZvUndvNlBpRVNGV1VxTTJOdEtnVFl6T0ZJ?=
 =?utf-8?B?QUhkMVRVRjdXZ29qUjBCU2U3SW1sQzF1aHcyNlFWL2VwOVAyL0lKbDJGeGZs?=
 =?utf-8?B?WHV0Yk5MVjhxQ3FlVEtFR1o1enJPZEZaNXN6T2kyTlFWOG9QT0V3bFlsWXo1?=
 =?utf-8?B?K3lLRzZzb1JQMTM0SUNFVlVmazZsZ0doUjNTQnoxcDZOMFA0emZIK2JzZzFK?=
 =?utf-8?B?dzZSbUZiWEVONk84RVU4c09IcGJ6a3R6dTZPM3ZqSzRGT3BYU0lmc29HR0Nn?=
 =?utf-8?Q?dmylUjAm3EdHccAjhhqzR9exI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e386de-15ee-48ad-7ed5-08dcf412f6e9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 10:02:27.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/aMWKfMjHIRynFMLkNM5dBt+0B3e1rdi+A4MUQwssJ1yzRMQQzEvJbcpOTI9/pm8tQDv7viiU7x1ivSY1bZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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



On 23-10-2024 20:43, Nirmoy Das wrote:
> Flush the g2h worker explicitly if TLB timeout happens which is
> observed on LNL and that points recent scheduling issue with E-cores.
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 773de1f08db9..2c327dccbd74 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_gt_tlb_invalidation_fence *fence, *next;
>   
> +	/*
> +	 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +	 * in case of g2h response timeout")
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is
> +	 * fixed on LNL Hybrid CPU.
> +	 */
> +	flush_work(&gt->uc.guc.ct.g2h_worker);

I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb 
invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ 
handler itself. Is this change solving the issue.

static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
{
         if (!xe_guc_ct_enabled(ct))
                 return;

         wake_up_all(&ct->wq);
         queue_work(ct->g2h_wq, &ct->g2h_worker);
         xe_guc_ct_fast_path(ct);
}

Regards,
Badal

> +
>   	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>   	list_for_each_entry_safe(fence, next,
>   				 &gt->tlb_invalidation.pending_fences, link) {

