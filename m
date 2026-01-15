Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10A9D46634
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 22:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610C910E0CA;
	Thu, 15 Jan 2026 22:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUXI9geK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1961610E0CA
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768517432; x=1800053432;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eM0Ofqv18HWKtzfpsY3rm6vRJRW/vYoFcrM511uYR24=;
 b=EUXI9geK6fADS0QOL+6VcmM3L09M0e5ipl9waNm8GXXkR2/m2wOa/Asy
 8q3QjtymXvMQ6rortgN70FY2yPodfSUBOrgI3A8PkEeS6ZUTS/UKd5isJ
 9+tN728m6fYNDwtFs9kwaEXm1YOmu5WAlnzG0h7wf/P9BJlwxOZo5/zTl
 FAvq8ifucbZb9KO+NFccytCVEfGYAA/j47Gd3JyiEGoaxSGaao+KmjqS9
 GjluVq8EG1x/ldPvL0AYAx+d/wqnKXFU3hyEmCLpDV/HYhbNV1tLI7916
 GrMRmr9WKzqwRhtKivMBJ1ul7e2+iy/FW4H/Fohzp8m3vOWYWcQV02s62 A==;
X-CSE-ConnectionGUID: Gkel7h1NTL2FgustyIuYWg==
X-CSE-MsgGUID: KkSUB2+wSMiK2cTBhmlPyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80945928"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="80945928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:50:32 -0800
X-CSE-ConnectionGUID: zMmZaOPwRsWGHIVOnPdulA==
X-CSE-MsgGUID: CsRSMBVGQhCwAgsPEyAR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="236324363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:50:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 14:50:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 14:50:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 14:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe01fNmxy5al8ABp5Cfp7mOH99cMQfx6Gx7qQrSaSwvzKZQ6Jt1V1+hoNldAuU+YlCIRv/eza3hOEAMeVGNyjGJ2thPmf2EnqLUN1IUwrTklm5uUm+X1hpQM42i6cHSMlbwW7nbEcnVg0JMgSRcuvMMuIrbUVJgp84Vkl//j6izoI/TBcq3Kl0Iv5uwcqAHXq+sEHs1xeXpLZYNA/jMWT0vhzDXtEKJdc8UdC+N4VKa6JLJkm/hBFJwBQ9NXvw4dI5/qSvoSSbcdnTV63/y+nfHGnjv3GzBPNGM0x9GONg3bv0fYFDsiSdnH6coVUUNYajN6o+Hvh44bxpIsp/UriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6r+HbX8BZFWm+nGL7fcZfr252y1CoVEe6HAyMls9B0=;
 b=shJmK+/3pgixUoLGUB8lGYz8j3db9KmluiQ4xQfM1D6XxmqBoqxXXRPQo3RYE+HOuq4U47ds2AMLA4LMIMkZoJ9G/ziPbOOvl6R0mFSMV1T5Lf6n9t0leC6HX2BBI6XLmPjsnrukBirOhIXhhfRll4WjaZHPjom2vawy0fnvysvBsq3dIBjVYkMV+dUZYZhtTfqlo8vqeYYGIM5RTV34umFAbsgP4yp1MFHowNNXN9/eWxvdy138vpqSfqbH2FtYJz4gG6eJkyc7leuK5pLCGn6sKr3Z9APn3zGzKgFfpHBOFH56Zi3BXAgooRJOHBa590hiIwyEI0FZgp7pEcJ3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7934.namprd11.prod.outlook.com (2603:10b6:208:40d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 22:50:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:50:28 +0000
Message-ID: <6e156a0c-ff1d-4fdf-a7c8-b0e09341a230@intel.com>
Date: Thu, 15 Jan 2026 23:50:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128123843.2763356-2-naresh.kumar.g@intel.com>
 <20251128171030.2774942-4-naresh.kumar.g@intel.com>
 <20251128171030.2774942-6-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128171030.2774942-6-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0055.eurprd02.prod.outlook.com
 (2603:10a6:802:14::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d088d4d-4a66-45d7-9a94-08de54887ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NytiMmVZWEhuNHgrazBSdXp4Q1RvdWhVYWlZVjF6YjVUaGJrenVMRWJlUzN2?=
 =?utf-8?B?VXZwMlZBQWlGSUoya3gyeWRJd3pEU2tiNzB0NHNxVmM5RHdDTEZRMElYV1Rx?=
 =?utf-8?B?SEFKTzBSL3VreDlXak5HbFVadlRpenJhOW5qei9mZEg2Q3VuRENUd0dqVXdL?=
 =?utf-8?B?VjNDZEREeVpWY3V2Y2haNHNqUnhLQ2g5RWlyalRKUXpNY2IxZlY0aUx5QVpo?=
 =?utf-8?B?dkhHdXFXSEdkeVZsUTl1LzRXUTNZalE5SS82dlJFUEhiUU1wcDBvamFnTTk5?=
 =?utf-8?B?dGdxcnFoc0tpYnpBbm5zbWNGRzVSVXRPMExsVlRzSmlVVXFlVUZSb2p3dXp5?=
 =?utf-8?B?R0RVRzB5UGhOVGtQZEhSbVN5VGhEOGM1cFF0VVBGN3Z0TnI5YTMvSHhQS1R4?=
 =?utf-8?B?NUFqd3BFVU9hTEhuZURPUkZjdFlYOFNOVXUva2VVRFJ1M0VqRVc5bmF3aTNl?=
 =?utf-8?B?ODJrMGZqLzgxQUpHQW1JV01PR1dwOXR2NXY0czlXbTd3SWRSVTJkSlVxUFVv?=
 =?utf-8?B?UTVObkp5OGhJVk81QTQwTTQ5aHpQZWg4MFNubDdsQWgwckxicU9YMnBaYnp5?=
 =?utf-8?B?dkVRVS9mTHhEQlgzYURUZC81WFYzaWRoeXpYWlRmVElmQXR3ekVtQi9zaHVs?=
 =?utf-8?B?WlVBTjFybnErQUNmeDhyWDZyazBtd28zSkYyTVh2bmRyRVV0SlFjN21uZ2FP?=
 =?utf-8?B?ZnBJVkI2N0l2MkljMGgzT1JkeG1RN0NFdHVMMk55Yk1qZTdlKy9RZHdsTnRv?=
 =?utf-8?B?amRxc0w1MDJhUnZUR0pHeGZTTjBCTVA0ckNyTTlOOUtEeEIweEo1azZ3VFJu?=
 =?utf-8?B?cElxc3NobUY1MTVwK0JodFNuN21TSnUzeCtTTHoxWmg2bnZkWWY3dm9zT0Rq?=
 =?utf-8?B?WHlSYTROSXJMNVpJbmMwZ1h5N293WFFlTGk5SzlqL0c3aU1XR0diRE1xdVVx?=
 =?utf-8?B?UDM0U2hOOGtwdWYvUHYvU1NmS042YkVwOG9LbFlFd2NrYUZPUUVVMHk2U2lH?=
 =?utf-8?B?a1AzLzhKL0VBRS9selNoNStoMWVNMEZRRkFPRmRlWWNkaDVzUXFHSlhNU1k5?=
 =?utf-8?B?VHNzUTViZWZzNmtvNGF2SjhZRUJRT1hOdTlvR1pnZHcrclFRSHViYXArNS83?=
 =?utf-8?B?QzlscExYcGtLOSsyUFF1T1NCRDE4aTdhUU03Vk9Ha2h1eFhxN2hoOXNtKzdY?=
 =?utf-8?B?M0NoWVlONmdCdjZLcUVlR01uZEJNQWJ4ZXRJcGhCeWdlTFI1d3VYVXNOL2pr?=
 =?utf-8?B?RWhxelk5YWVyS1dKOVROdHdJRnpKNXczTVRkdlNNWmdWMzdFYTlUN3hickVo?=
 =?utf-8?B?TjU0VHBTcnJwYVVrWlpoZ01KUEYydVgxU01Kak53TDJtOVZsZW9oUmVmSWx3?=
 =?utf-8?B?SGtrQUEzMTRYY2NpK2lpUnlKdGVoU3JIWE1IVnByTU5QTzZiUXRTeStEZjRJ?=
 =?utf-8?B?Zldidmt3SHBHZFJKcXM3MDJmblkwNWtMNGNVVC9zTnJzKzVhVlZLQytDZFpk?=
 =?utf-8?B?aEpZTnFJaDVGRnN2ZU91ako0cW8yWXcyaXNGODVIOUR0U0hkb2lwWGgxZndX?=
 =?utf-8?B?YmZ1VmNYZmlLSFhTTFNQUjAzcXg0cnVzSGVFSW1IdmQxMnFML2kvbXMyaVBi?=
 =?utf-8?B?SzFwQVZKTkZVa3M2L1lpMUs0czdCNlJ0L3I4V05HRkJOS2p3N2RjL3hhcjZ1?=
 =?utf-8?B?L0VZQW9lcVJ4YjgyUk13Zk01ZG9tVUV3VURJRXRVRjRUTFVNR3E1RkZyc01j?=
 =?utf-8?B?eXZtMGoxb2UrL1VNM05zdldldDNLN3hLY3grYU1rNWJtOHpLcGwyZ010TG8x?=
 =?utf-8?B?eDVlOWxSRSswbUhIYjVmUEEybmlCVGFMMTY5MldEWFF0Q2pvY0JqZHpjNlo4?=
 =?utf-8?B?RHQ3a1Jsa2IrYzUxYnQ0bDc5ZmVzT3RUbFllczgvc1NRb1ZCZ2NHS1hXL1Fm?=
 =?utf-8?B?Zi9ORE40c29vVWJtUXROeUJnQ3pIdWRyYTFNQllxZEhGWlJZNzQ0TGVqd0RC?=
 =?utf-8?B?Wlc3cmdQeThxMCtwM0liUzNubmhobXI0WHFyTUxHbDMxRXpnQk5lbWpzUkFo?=
 =?utf-8?B?V2toeXNDdlZvcEorekxWamtOZGVnR3ZVWFg4aG5DaGtZaEE0elNjOGdlbTdv?=
 =?utf-8?Q?3YJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FYVUNhRENYVy9sMWVpRS8yNHB2aXVEVFFnVzFueHlnTFhGNGtmOU9FMjcx?=
 =?utf-8?B?Nmd1RXhZRnJKM0l5c2NPSkM2aUpWcVdMUUlFaWsxTzNCS2RXT1FHRWhvSmxJ?=
 =?utf-8?B?NEJFZlZ4SHJRdlFxamNZM3QwdCttVldJeXV1WXltUVVXVmM3Vy81MnVCWE9C?=
 =?utf-8?B?TjJNdStWeFAwMjFQOUlpaXZYSit0d1owbjJCRnNRMlpyUUtuSHF0NmZQMm95?=
 =?utf-8?B?UW15azVSUGo3clYzVXpIaTRxZTM5Nmp1K1p3YmZEU2dZcENtaTB0bkd4UC83?=
 =?utf-8?B?V0U5RTl1cVRMenduY3Rwc2Z3bDlEOFNqQys2ejVxekRzOHRBbkZsSlBjVmEv?=
 =?utf-8?B?eTlBY0Z5aURUQjJ5Q3lES2tlblZadWREejloZXhrUkZGNk9QRHVHUTJBS215?=
 =?utf-8?B?MzB2VE1ZVjBxNnNkdzBLWWZORE1MM0pWR1VScmcvWjhLRkJNaGs0OVVRcDBr?=
 =?utf-8?B?MjZuOUJIVmcwUXYyRjc1SHdudjFvcmhEZ0dWajkyaEszdmJTNGZVWnZ3aDE2?=
 =?utf-8?B?cElBVzgzL3Ric1k4Q1JmUTRuQU5HMVNjTklnRGZ2dUF2bFZBK0dNaHpFTlVh?=
 =?utf-8?B?cWkvWXNGaEhGbUJrMVI5ZVNYTWM4MFRia2lrRm9aRWxOUGVsWENjMHk3TjdI?=
 =?utf-8?B?YXA0c2VXWjk2MDRTdW85ckcxK1k3NjBmWi9WbTNuT0ZMVGErTENZNlJrMWcx?=
 =?utf-8?B?UlFESHNTNFhST2hXVWtyTUFFUFhVRXptcHJkMnRSbHR1KzFwa2gwOGVNZ1d2?=
 =?utf-8?B?cnpuWWRMdCtUYkhKNDBLanlPSytwQlZJeUtZQzlrVHdiTE13Ym9Rc2tOM2dG?=
 =?utf-8?B?bWFqdUp2ZVFIQm0yRGd4Tjg1bG9wMDhGRzlRZE1rVjl5TkVvRmpibFdoUy9y?=
 =?utf-8?B?S1kwSENZK2tVN1ZFVWRJTERXenRXUnBQWEs2bFJtRUEzelRhMTlBcHV2bXZr?=
 =?utf-8?B?Unc4M2dadGdkVU11b294K0JKRmJHbHdkcEZ4TXZFRmlDMUlCUnc1bEozbUt2?=
 =?utf-8?B?d1ZiaFh1ck9QUW5hMWliVGt5TWJEbVlpL3RWWjc3czAyY2F2R0p3ZngrTjIv?=
 =?utf-8?B?ekU0b0VUN3ZFRmREVzYzdUhvZ29zZXNnNHJGR1FtUFBGd3A5VzhHSmNSVlFZ?=
 =?utf-8?B?dU4xamRlczd2cTlaSzBUZjZrT0xFSkZFSnZPQ3owL3lVdkc2bkZ4TFZQUGtl?=
 =?utf-8?B?QjBwckZ6d3NPMGVhMHRKUXozWkxzeVhyOFEyNWNxS1AxZnJwVzRtMUtWdHJ5?=
 =?utf-8?B?YjdUOUduRFFUSTIrQlRBL0taN2hRTzhnRGpxN0dlVUZxaWpyUlVXSE5ZWE9O?=
 =?utf-8?B?UXh2V1N6VkYyMGF6R0M4QlFNSnZGN3FRSEZ1dzBTSU1YOEtrSVloeUFETUgw?=
 =?utf-8?B?UERNNmEzbG90c0pWUURVSGhCVU8xRG5lOXVSOWo2Qkw5eXRmSGI0ekt5WHBu?=
 =?utf-8?B?eENvSUU0RmN3dWlRZjN6OTRBQmVnZ0ZIWWVZMDJJOGNPRUxDM2o4SjhJdDd1?=
 =?utf-8?B?bHZsRzhYaS9WQk5kRHF2RHpXWWtta25qWXZ5blQ0STdQOWVicnZsNnVQdzk5?=
 =?utf-8?B?eExDU3FFVUd1Y3p2ZXMrWjFhMm1hUEdFNEVLUUtEZm1OaVYrUldFM3V3Vmw2?=
 =?utf-8?B?THJqOTlWM3d3bEV1RjhLRktmeC8zaTYvcXZ3NmJ0SnNsdWRhanJiNWw3eXBa?=
 =?utf-8?B?Nkt3N1lGTEpjSGZsY2d4aUYvUVhhcHBsalNBay9VTzNPbjBCY1dRb1lUek1G?=
 =?utf-8?B?RTlNcTVybGFLSEx1WXBXRWdQTW10T3ltb1d3cWlwSVRCZkRObFhOV05ac2tP?=
 =?utf-8?B?NkV2MHdLNFNEeXlZeVJyUGpoZlJ3UC9VSGZRbE5qdFRMWFo5UklNaHNOdXF5?=
 =?utf-8?B?eGlkZXNHQjRMdHlraXRPeVBlOHlpazVPYjVCTUN5NFZ6YjdTdlFTdURtVkdC?=
 =?utf-8?B?U3B1M3NpLzhUVlRGQ3JUYUVmalZ3b2RtdTVNOXFoTUtMMkRBVENMQVUwbkEv?=
 =?utf-8?B?UjhDb0JTb25qMGVmSWxaVHh4TFE2RnhrL1BCU3hlanJ5ajZXNXh6UElrbWd6?=
 =?utf-8?B?OHRuY3lUaXFiOGo0ZTMvOWYrc2NaamFqTkw3OG8vdlp1QVlZci9NWHg2NHBl?=
 =?utf-8?B?RHJaREJRN2grWEl6QXlPTXRLZlpHNkVwM01VdnhkVnNaT1BwdjdYYVVZS2tE?=
 =?utf-8?B?eGhoQTlFNHNrdlBYaktvM3JDdGtwVXRObThRZ1N3V1gvNFJ4b2dncDQ4eHY5?=
 =?utf-8?B?YjVMQjNOR3hCWG5ibTRvT0lCUkxGbWE3aUVjOHV5UE92d1AzaWpEUitYUUt5?=
 =?utf-8?B?RmZGMkdNTnFYeTVVaVZNc3lHV1lKRWlSSFNnOS9GTUVlNDV5djNVQ25SVGFB?=
 =?utf-8?Q?wpcBdjkkiay6g5fY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d088d4d-4a66-45d7-9a94-08de54887ac4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:50:28.6237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lc8fIvWKtRpQ+X4unsfTEEjUKzw8UcKBJ187yTvfBPiHK8zA5TQLA2PogfCtxYMUloxSfMn9lfmycf7E8JirgxYY3KzZxIoQ9eB+nAY1kAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7934
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



On 11/28/2025 6:10 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs,the alternate CCS-mode
> cannot be changed when VFs are already enabled.
> Similarly, enabling VFs is not permitted when the alternate
> CCS-mode is active.
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
>  2 files changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index e146e00b0ca2..6652c468e1be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
>  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>  }
>  
> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;
> +
> +	/*
> +	 * We can't change CCS-mode when VFs are already enabled
> +	 * and we must prevent enabling VFs when alternate
> +	 * CCS-mode is active

nit: as it might be little hard to understand below logic, maybe add:

	 * Try to lockdown the PF only if CCS is still in default mode,
	 * will unlock PF after CCS is changed to the default mode again.

> +	 */
> +	if (xe_gt_ccs_mode_default(gt))
> +		return xe_sriov_pf_lockdown(xe);
> +
> +	return 0;
> +}
> +
> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return;
> +
> +	/* Allow enabling VFs, if CCS-mode changed to default mode */
> +	if (xe_gt_ccs_mode_default(gt))
> +		xe_sriov_pf_end_lockdown(xe);
> +}
> +
>  static ssize_t
>  ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	       const char *buff, size_t count)
> @@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = kstrtou32(buff, 0, &num_engines);
>  	if (ret)
>  		return ret;
> @@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> -	mutex_lock(&xe->drm.filelist_mutex);
> +	guard(mutex)(&xe->drm.filelist_mutex);
>  	if (!list_empty(&xe->drm.filelist)) {
> -		mutex_unlock(&xe->drm.filelist_mutex);
>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>  		return -EBUSY;
>  	}
>  
> -	if (gt->ccs_mode != num_engines) {
> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> -		gt->ccs_mode = num_engines;
> -		xe_gt_record_user_engines(gt);
> -		xe_gt_reset(gt);
> +	if (gt->ccs_mode == num_engines)> +		return count;
> +
> +	ret = gt_prepare_ccs_mode_enabling(gt);
> +	if (ret) {
> +		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");

maybe this should be closer to the xe_sriov_pf_lockdown() call ?
or 'prepare' helper should be named differently ?
as here it is hard to match 'prepare_ccs_mode_enabling' name with VFs ...

> +		return ret;
>  	}

or make coding more straight:

	/*
	 * Changing default CCS mode is only allowed when there
	 * are no VFs. Try to lockdown PF to find out.
	 */
	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe)) {
		ret = xe_sriov_pf_lockdown(xe);
		if (ret) {
			xe_gt_dbg(gt, "Can't change CCS mode: VFs are enabled\n");
			return ret;
		}
	}

>  
> -	mutex_unlock(&xe->drm.filelist_mutex);
> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> +	gt->ccs_mode = num_engines;
> +	xe_gt_record_user_engines(gt);
> +	xe_gt_reset(gt);
> +
> +	gt_finish_ccs_mode_enabling(gt);

and here:

	/* We may end PF lockdown once CCS mode is default again */
	if (xe_gt_ccs_mode_default(gt) && IS_SRIOV_PF(xe))
		xe_sriov_pf_end_lockdown(xe);

>  
>  	return count;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..53a595b0882c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  	return hweight32(CCS_MASK(gt)) > 1;
>  }
>  
> +/**
> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
> + * @gt: GT structure
> + *
> + * Return: %true if actual CCS mode is single mode, or
> + *         %false otherwise (CCS in alternate/multi mode)
> + */
> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)

if you don't plan to use this helper in other places than ccs_mode.c,
then just make it as a simple static helper in ccs_mode.c

> +{
> +	return gt->ccs_mode == 1;
> +}
> +
>  #endif
>  

otherwise LGTM

