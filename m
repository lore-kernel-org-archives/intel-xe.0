Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFBC30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8BF10E34E;
	Thu,  4 Jul 2024 04:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyewBKzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04610E174
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 04:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720065677; x=1751601677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rRroN8J6L1amOnuywzWaQ2CoQyn/mNmARMBgoWP6tDk=;
 b=DyewBKzw7rj1QMI4PJfLZRyKkGKjjpUzvlD2HPKGzoBmC7JSUrkdPrn2
 OXr52ENsUaltf0nNPrGqd9g8x6YSVe9wTbdAwfnMJPxdwbMmVFoOG1so3
 /i1Nwn8W+gThZ9UZhYu6vlTV+fi6jF75WB0ByTx7tjx5/kseebzLTa0Cq
 c8LIk9YXIh0NYie/R+bo/YxKnGkuZtuMsncyFeT9c5NPc6fJPa54jqBiR
 gv3Au9VHKMA3gkpW7LbzVjBZTFCwbGP51HY18KaWrzwCcY3h6/7oq1tAi
 YjTK27DGnGBxTYdE989ualRVHc9HdTbkKr4NJ8+qUstvZlNQNxty8u8Uz w==;
X-CSE-ConnectionGUID: Hy9myd7sSl6TPIIIBeqDEA==
X-CSE-MsgGUID: yuM2Y5n8Tj+4Np0CTDzWwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="42747765"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="42747765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 21:01:16 -0700
X-CSE-ConnectionGUID: 8f2VCZtjSW2SceeQWpHOag==
X-CSE-MsgGUID: HugLpcktTuaKB9rEJwlcCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51331710"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 21:01:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 21:01:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 21:01:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 21:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShUH06o8CBvYuBbVlaAnKHkV5WU13vAU8At5hsEAEgKzMYzZMMIFwRKOUg2owX8e/rFQ9EYT8QexkcGslBDE2h51iJqM1IMxxnlPYqx7JxSCm3gvJIotHzlcZID+syrUPWxcW+yvsbB7Fu2q+ElskeNdi8rf3NArKlO1TE6FwN648VHbAlokKBs1RxwVHe52iBxhi1D9F2/GzhY7upqyEatRsR0pLfjrKVvmsbNrD9PSKYkscfRrwQ69Xoxdzu7GmrlOZXrrfauqjLvBJ7slrhzdK/ehjv9YE/s1bV+tkhSRBVbJf8NXbTIW0prZr0OIaluTN7LFc1LH924K1Tun1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ix8cRPa7gMT1q7w+gzNDV1CCVqVvMhGjYo/8vtjXm4=;
 b=OLpRvFaEM0XZipA9oiTml1ir7zpHnCgSuVoQleBCb79V0ov7vm0/8EB1imGlGDxA7x3vlsbIRkZF1oIujz/1hIQwCrgw1SWEl2ferng8IUVPA039ppBXBh0V9Fx46kTZ1vsKYxjSBwcVY5LBAny9Jzem2bMB+UZ7I6LVxkkNAwHCEJMQt23kA2XNX3ZWfBDngKzvJ7nBTcb6emuJmfTWBwYibiy6x9/tK/F/EYSnOgkBdN89k4Rk+1yhvBYjeEVB/6bs6KXuHw+ehgqd0JpmLJ8JD+MBXKNKEQdE1HwsCAn1txW4hz5yvw2ZuH905/33IxLQeZ5l8I1Cx3voPPNoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 04:01:14 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%3]) with mapi id 15.20.7719.028; Thu, 4 Jul 2024
 04:01:14 +0000
Message-ID: <5ae45770-524b-4b5f-aecd-5edb84da5889@intel.com>
Date: Thu, 4 Jul 2024 09:31:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Use VF_CAP_REG for device wmb
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
 <20240702183704.1022-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240702183704.1022-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: c50904a3-d88d-4af8-47be-08dc9bddf26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU51VGhPY2Z4WVZhNERxck1mbGpMQkJnMDh0NC9kNnNpN0lMYUlWd1F6NTJC?=
 =?utf-8?B?MUN4NXJwTUE1WjBoZHNZV2VkZEI0Y0lxKzZXbEFoS3NUOXV5TmZHSDJCZmJU?=
 =?utf-8?B?RkhBamJLNFlOeFhTS2ZDeXJ5c212NDJjME8rRWFKS2tzYUdDRDE0ZFZib1B0?=
 =?utf-8?B?MDBkb1Nid0pwVlI4aFRsNVJ1QlVIWUhrMVY0SlFQN01rMnFYUnVlSVUzVjdP?=
 =?utf-8?B?blE0UWNXVmZyODVadEY0MUxqdms1OWRLRXlGYVBwZUlHTFB4L0VHWEdNQzZu?=
 =?utf-8?B?aDBUUFVQN3RqQ1lxQ1ZjR3hSSVpua2hiQ2tlMldEdDJVdmtVRHlBMnZLY0I2?=
 =?utf-8?B?V2RUc2JrYjNCSEhheUVxanVyRE92Y1M5YlVPdFAzbitiZ1ZOelF6SDNMK3dJ?=
 =?utf-8?B?MUtnRGxNaFc3UTExNTk3WW0rNG1VcDlLME9FWmg4OUJjUHhoc1UzVjZTYkh1?=
 =?utf-8?B?emdxWkZxREFyQmNkbDQyYTJSUnJrNjRTbUNEbVlPdGs3d2w5Y1g0Njh4SkZY?=
 =?utf-8?B?MTNBWlVSNnJ4THdlNzF6UWpwREJuMUVBbFdNMXlvUmpqdkgwTnhLMlhGQ0tP?=
 =?utf-8?B?YnNkWkJSS2k3eXFacFgyZGNsY3VQdmt5dEprSGZFMkdmRGIvMDlsZ1pqd0w0?=
 =?utf-8?B?SXFtSW9qOXp4Q0w2Rk9idlQ2WXJZUlNuMCsrMUhRcEtIR1lHNU9hV2xFVVF2?=
 =?utf-8?B?dlA1cytHM2l4WnZCazVkcjdHejdZd1FUOUtYMHVoN3pXYTRPbTdlWHpzNDMz?=
 =?utf-8?B?QUJrMSsxTnI0Q1VCa1JxVXNKNVgrSzR6ZXBMbno5dkVPbENPV0hnOWNrRnd5?=
 =?utf-8?B?SC9ETDBpMUQvSFRyY0VibnpQTlBwYTVhTnVPK3dtOFJYTEVSRy9NVGpmNHFK?=
 =?utf-8?B?eERrUHRJTURqSXVsZVVuMVFBWU5idCs0SVJEbHgxQy9tL0IrT0I5eDBFZ1dF?=
 =?utf-8?B?eURndzhFV1NINUh4ZDhHbk9VVC9vcldFcWxnUlkvdGxUYmJ5RUxqZGdYT2Nh?=
 =?utf-8?B?MmgrOXBoTm1vbmJ6TTNYR0d1VWY3TERsUmg3T0dub2VNUjZPbFJrOEVWUTVR?=
 =?utf-8?B?cFE3ZXdLSFdzTHEwdlBpb3craHl2RmZqWllYaWwxNmQ4amNaUyt2Nk8xcW9N?=
 =?utf-8?B?VTJ5Z1FOUk9KazU4Z1BMdm1uTXRLQmh3WjgxSFN0a1pJeDZMOFNGZTZuZm0z?=
 =?utf-8?B?dm4rRFF0ZGtEZ0JHZUI1Y21rbEdpWUQ0T3pFNytlaVA5SjN6ZEI3L2h3WUlh?=
 =?utf-8?B?OFZoYm5ZL2R1SUtQTW1wb2hwMzBXSUgxck00MExBTFBqSXMzRlRnWkhtcGFo?=
 =?utf-8?B?K0NUL0lJdUxsUDJEamFhb3RPa1Vic1R4WUxYdmFJN0FxcWQ0aTVhNk9TOWxh?=
 =?utf-8?B?RldoNzVHOS94SkR5ZU93U3JWUVBaSDZ3dlVTVVljdUdGdHFSM2lPWU1SNC9R?=
 =?utf-8?B?NnZkaWR3VHNSeEp2VUFYOHB4TVlXWm5zRmRKMlI1bklrWXBQRHlWNTdnaDZF?=
 =?utf-8?B?WVEzYmdTdDFPbk1rdmdGZGFCODlIN2d4VVJOdExOSzFPVjRmdDZzRmVzMW9Y?=
 =?utf-8?B?WVVmMXhsQzhXWjQwaTIyOExpTnA0YmxWUmM0R3pQMnR1TktvUElIQVZPa3ln?=
 =?utf-8?B?TXA4YzE3Mkg1eWd0TVdnRjB3eXhNbkFJYTdnZU9ET1NSdmFJK3FFcUovWW54?=
 =?utf-8?B?NmhQWDZYR3VCUjhZbW4zSWlMemdpTnFOR0V6bjVDaUhtcVJVZ2QwTTQ0WXpU?=
 =?utf-8?B?TUJ0RkR4b0FhUWpDckk2eERZQlJYM3M4dW1KcnlSeUhIL2pvRnRDRW1QM2hM?=
 =?utf-8?B?NWJ4c1RLWkFFR0I1MWZvZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWlQN0VPdGxMVFErekpLNUhNNjNzOW9oeTJlVlo3Z1B6UEJLQ1FUcXNOam9T?=
 =?utf-8?B?UkJrVFhML1Q5Q3ZySzZNaU9jNWVFeE5pbWt5eFpEbkZ0T2E3bVluQzJlU0du?=
 =?utf-8?B?MmVSYmdESVBvNS9TQzZZMGpTVThuZFBhTmNoRkJTZ2NSL3kwZ2JWN05TcWkz?=
 =?utf-8?B?YjlIWkpXY09RTUpmZWQ2QThWUkNoL2hUVGhUSmY1eDI5RVEvT3d3d2FRRmsw?=
 =?utf-8?B?dVhxTURkNjFOSzZhaFhGNjBOM3pxYXg3TVpYM01uQWF4SExhSUxNL3N4aXhM?=
 =?utf-8?B?eEp6Smw4NUVWOGZRZXdFSEdnSHBXZUxZd2FCSHp5OU5KaHU2R3IxR2t2VS9x?=
 =?utf-8?B?VklDY01RMW1wTk1EMDhvdUozQ2N4c2k3L1pqOTZ2L3I3b0lIYWF1aGJ2U1d1?=
 =?utf-8?B?SVlGY1ZGcHdac2dYa0hPeUtOcm52T1ZKaVFVOG5IbjFnNUtLUVFTcDNubGVD?=
 =?utf-8?B?b1hyS0Z4TWZyYnlvd215M1BZQUxGanRCanFHdStGRmdldU1ZYmRBd3Z0NTN2?=
 =?utf-8?B?RXE1TWk4OFVIRGhuOE5rejhQUG9ZT0ZDNktvSWl0V3VWVW1jeFlQMWgwU1Rp?=
 =?utf-8?B?bmNPdG5qL3pUOEJzZnZySFRsc2lJcDdmbHB0WVp0elIyNUJnQmowQ2FxNmVG?=
 =?utf-8?B?RjN0TXAxME04dGc3SjBHWXF4azBHbGVYTEZpY0svckQxT0tBMk1MZ1VRTm5S?=
 =?utf-8?B?V3pyQ28zeXl4VjIwWU40bVhsamk1UURkYVZSODVnWE56ZjF3OWt2ZHlGL2x4?=
 =?utf-8?B?V3dIbWhDeVZrczVDSVhQVmRWeXVzODRNeGZ0RmlnZkNHUm54RVRHU1ZzNGZT?=
 =?utf-8?B?ZngrVWZmQzZQMUp3bnMrVVhpYWdOY1EzOVVsTEpZYlBMOWNqNGF6WW9JR05Y?=
 =?utf-8?B?YjB1K1JEckxkS0ZXeFRtdnlJV0t4ekExUWlySDM4UHd0TXZjVW14RzRIeExy?=
 =?utf-8?B?ZEJiaWdIWFFUTDRoNEZ2TzFUcnFZQ3dyUHBVY2Y3clBSY1JNTHQ0RW81L1Bk?=
 =?utf-8?B?a1hlMHF5R1pWcU81VGtYOHZEQ1VwT2ZEWi9haGFhQ21RK1ljYTJyUS9Wek9J?=
 =?utf-8?B?d1BhczZjYmt2YmNYN2tkQlJMeWFWWmEwcFZ1NHMwbG4ySmswSDRkVWpzMkNC?=
 =?utf-8?B?QlFkUEtsUUxYQTZza2lBaXhoOFZxRmxNb3owS05LS0xXOFYxUVZPTUtuc0Nn?=
 =?utf-8?B?YUtrQU9TMC9TRW1FRFYzTVNYZmdPR0NlR2cxM3A2aU1pUkxYNEhjaWRDeXk3?=
 =?utf-8?B?MUlLMXhoWWZKWmdnYkJxOEc5RVFGVGttNlNrUUN5aitONmVUVVdjbmdDcmZj?=
 =?utf-8?B?QWN6OHJJRVhZSTJIWlU4Sm1ERW0wZHZJcDJSb1BPaFhkc3pWN2Y4ZjZ3aDc3?=
 =?utf-8?B?NHV0dFY4a0xKZWh6N1VmOXExWjRSWTRSQzNBd1Z0LzBnYW1nNzQ2bXpDUXpq?=
 =?utf-8?B?Y2QyT0JVZHdPZmMrRWlzaFFma2hscXhNcDdTRDFSdTRlb2xEMlVkSXgzNTFD?=
 =?utf-8?B?VUFoQnQ0cjBUYkYrcEdUcTlzQzI5QkIybjBzNkRHTElPMXpYbnFvYU5Tdkxy?=
 =?utf-8?B?QW8xak5FSjV4TzZIbnFaV0Y1QVlCd0YyamxaNSs5cWpmQjBnSnlUZHRkbnd3?=
 =?utf-8?B?ZHNHakdmTEJrU3I1dW1TL0ttZ0VIRlFWMUtvYytuZmIzMGNHbHpwTm1xOFc5?=
 =?utf-8?B?SWRhN1ZVckhkYXJzU1BUMG9NQk41cjBFeDhCc2ltQTJrNVVGTFNwL2o4QldD?=
 =?utf-8?B?RzIxVjFUZnUzRzd1NENLZGRJbTNGdkFCRjFZOWhJYnNXSTk2Y1V5cGs1WE11?=
 =?utf-8?B?ZGEzOHJuVGxlcDdqSm1hdy83a3ZhNGRCUkJ0dWNxdjhwcHM5TGVCTm85d3c0?=
 =?utf-8?B?VjZOUkorYTVUS2QyOHFIWmJPelNoTFNTZHhiNXp0WlZoK282NWZYcDVLRXM4?=
 =?utf-8?B?YnFOVEtGcUJzWWo4RmpkZzA5WkhIcHF2T0pmTUdWSDIyUlA4Z2d3ZEhWUXJ3?=
 =?utf-8?B?SFRyY093ZDF3MzBIOVFUTGV2TnpYa3QvWkd6ZFdDMEhxWnhFeklBQkMyU29I?=
 =?utf-8?B?THZUUmdITnFUOWorOGNBdk1WSGlvRXpwd0VaaFNLOURMYTE5aVJISmZVc1Zt?=
 =?utf-8?B?UXcwSWRBTE1UbWRGdFZOME1GcHQ4Mmd6TnJGU1RvRVIvcXBOOWdvTDkrUktt?=
 =?utf-8?Q?4sqLq/Z/6IPAPJMhJQ4DwVw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50904a3-d88d-4af8-47be-08dc9bddf26f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 04:01:14.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPskZWV9tC3tnWzwt9198nYQuxfIFv9OcQp24JcCNKeWhXDSJTa7t1FFTtYLc95REScgKSYGWXAoEx0Ile5W9ifmZfK+GCurH4l1N92PCt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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



On 03-07-2024 00:07, Michal Wajdeczko wrote:
> To force a write barrier on the device memory, we write to the
> SOFTWARE_FLAGS_SPR33 register, but this particular register was
> selected because it was one of the writable and unused register.
> 
> Since a write barrier should also work if we use the read-only
> register, switch to VF_CAP_REG register that is also marked as
> accessible for VFs.
> 
> While at it, add simple kernel-doc for xe_device_wmb() function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cfda7cb5df2c..74beddb55284 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -744,13 +744,22 @@ void xe_device_shutdown(struct xe_device *xe)
>   {
>   }
>   
> +/**
> + * xe_device_wmb() - Device specific write memory barrier
> + * @xe: the &xe_device
> + *
> + * While wmb() is sufficient for a barrier if we use system memory, on discrete
> + * platforms with device memory we additionally need to issue a register write.
> + * Since it doesn't matter which register we write to, use the read-only VF_CAP
> + * register that is also marked as accessible by the VFs.
> + */

Thanks for adding the doc.

>   void xe_device_wmb(struct xe_device *xe)
>   {
>   	struct xe_gt *gt = xe_root_mmio_gt(xe);
>   
>   	wmb();
>   	if (IS_DGFX(xe))
> -		xe_mmio_write32(gt, SOFTWARE_FLAGS_SPR33, 0);

Since SOFTWARE_FLAGS_SPR33 is not used anywhere, it is better to do 
cleanup in xe_regs.h too. Can go as follow up patch.


For this patch.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +		xe_mmio_write32(gt, VF_CAP_REG, 0);
>   }
>   
>   /**
