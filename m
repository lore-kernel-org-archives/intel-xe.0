Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C9C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 14:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A72910E288;
	Wed, 16 Jul 2025 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9TwelH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5EF10E288
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752674439; x=1784210439;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v30gfv4yIBfi589IhiM7q/8Z0jHF9szGwBnpqxWUFaA=;
 b=Q9TwelH8Lq1EDAPs5C4l7CAs++CFHv60RRq406lz7dXsYx+vJ9LMEueg
 9B8agPJ7rv8pO3WFUipIwRhk9i1lKzfvofjRh2WuhwP1iLR4XptB9rSm/
 w7M36pbINKmu+oQbUeF+xkYGhewZPG+QBWubB6y4dnENcP7mNW573I23q
 az/F3VR1L81uLZ3GsFDw2e2tBBP+nWGrbYK2vWkLK5G95ZmspYLitbuj1
 9UGkMOI3IBaoINhIZsg9kmpQBcavHjGQdc4IIm7kpxBE+r51Y5Y/Kx6J8
 fVEf7yFYutXLVSxnh4nbtzFOjXbBsJuc7gSLcIKUPU3zSVVCww8guILJn w==;
X-CSE-ConnectionGUID: 1PqeHhU1SVyS41Q8FioJIA==
X-CSE-MsgGUID: tafKKiCtR9OH7/pXAImDPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55067640"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="55067640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:00:39 -0700
X-CSE-ConnectionGUID: ndcdaJhKRIC58aG/tmOI/w==
X-CSE-MsgGUID: Spi3D5ZyS26y0Hs50BGJKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="161820615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:00:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:00:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 07:00:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUqA/wJQHLI4FX/ohi0k4uefT0uK3yR1VJaKqUQpSCjiJs213Wz+oQgDRCN7bM9ygc+zZvH7FmhjERQDbP9i5peL7BaO7hp8R5kRDK8QZegCndoCHuKXx+4W5nTarWidEyey+2+QnYG47DBdDR5yGLLoZQNAjX2iHSMcyBQduqHAq16hpimJoZrrPxWwYebk8wvzmSXLKZ0Txt9dJHKcWJZsGRojPI+a7ZrX4scGSTscgHKp8AjHtx9tAqtnzbtVG+jPonI88X3o7cSrc40Jn9NHlbCljhqa8siaKoQs0tZ81WKvMDKko4Ov2Z5GpWD7sSWi2aECTvSe6kapRKB5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avQcbylf9Ti7JDdbZutmzyvztqxnxtY81hVF/P9vLmo=;
 b=i10QSfpuKcj1y3Bvwrt46Hh50Eeqm2r9Fm56Vf4A2eAJ3rounopLWbqkgnblwuTk7K22dDqo/uEzIQU47yVp0aBETOWQTQzKFfqrj+T2/afWoq5/o5dZ4lnHgubHTfjgLLTWJWhkWFw/Oq4WWbyYfvwIfP4PY/bEzoeUlE1WAlLkYGHP75UinXUOC0FyTKyqUbDMXm5z0Bl9pOklNwXEaXfAaRwLSe/6yglLZ1BE1BOF6riefCkpmWq46DbpPPS8jNeOrWQY2TfQpMSxeTHBIOcW9VTPi5LFqCT/niSmhwxpuYKqQ8J2lkLd7+tRQKs6SLNtX3CKOm0Hr8FuEhTmhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Wed, 16 Jul 2025 13:59:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 13:59:52 +0000
Date: Wed, 16 Jul 2025 15:59:49 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v6 5/9] drm/xe/vf: Rebase HWSP of all contexts after
 migration
Message-ID: <luiuu5f7i4pgmjkv6zofddmsye745fmi24aly2pgskxqur5p3b@3rlyynkrkrxg>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-6-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-6-tomasz.lis@intel.com>
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1e4dbe-0a0a-4970-f2a8-08ddc4710927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHplQWVLaG93emtrTUJLbmlkK1g0cTNhMVV4UkhnZ2hhcHpyL0IvaE5KYk8z?=
 =?utf-8?B?aDVpSUo0cXlENFVLQVR2VFBKUjRjeW9wYzJvZGI1ajhpQTRxNUNOWmpJejEz?=
 =?utf-8?B?d0hMZ3N3Rm9YOGhYMlpXMHA1bnBjb1R2M2ptdjlkaC9ETnQ5NTF3K2dwRmlQ?=
 =?utf-8?B?WFIzRC9xWldtNUsxb2V1ak5KdVVxWnZHdldobGFYekxTQTI4bUppU2FyQ2NN?=
 =?utf-8?B?aC9keEVqbzRrNXo5T0ZOWmtiVVpPcENQUlRCOERlTmhUZ3RjRlA0Kyt5TGMv?=
 =?utf-8?B?L0RJUWpRYVI3MjNDbzdZeTE4UmlFdE05T2J5Y3lRYkZXTkxadUcyeWpMS3dl?=
 =?utf-8?B?Tm1IVHVpUy9pMlBhY3VYRUJURXByV0p2TjY2clVCQm16WHhJbldheS8xNnNv?=
 =?utf-8?B?MmlIU1p2WVdFLzBEN3dFc2ZFM1hjVXJveEk2R0xCSG9DekhLZW5GUnFHOWlx?=
 =?utf-8?B?SHNlNnRIbmw1SnBVcW9VWGE1WGdOSWdsYmtoUURRTVM0N3ZxQVd0YlNoTkZC?=
 =?utf-8?B?YkNFWDVsN0FoU0tqNjBwL0tQT3BhbWtZZFAyNi9uSjkwUExBajhSM2hYc3JQ?=
 =?utf-8?B?ZGhYTUJma3V5MGJFRjdHcUVCRHk0MjkzZEZGWFlhZ1B0bzZjekRwUktYVHVT?=
 =?utf-8?B?TFBjR2ZhNFRXWWF3YlRzMURDQmF3MGFPWHJrWFRSOGlZcndCOFhSa2pSbjdh?=
 =?utf-8?B?ZG54L0tuOStNWTBiMW05LzVtYlkydktqaDRGSWljenVtYlVWanhWU2NZdnhQ?=
 =?utf-8?B?NFE2b2RocXM0WjJmVVJGeXZVSWx6UDU3RGtOaG53KzdWSENyRFRidzF2dWFw?=
 =?utf-8?B?U0NOMjZaSHJ6VnlBZEFEVkJ2TW9jWnZJUFdPZHhpRkpCT2paV1I1QUowTEVr?=
 =?utf-8?B?dXFxUUdVOXgvU1BSdW56S2ZMcGtqM1ZKc0xFTWt1RjhiNC9iQTBadWMxK3NO?=
 =?utf-8?B?WHlSanl2cXBvdllwQXpmUmE1NTdjY3l2K3FlM1k3LytPNXlPdTdxblBtcDNU?=
 =?utf-8?B?aUF5ZW5XZHhJclZleDJTMTNxZGo2M1lpNFArK0VJc09wVVZ1aDBEOFJzNjFr?=
 =?utf-8?B?TjRUQTZQV0xzd0tkb3RCSUQ2NHM3STh1RWE3S2s4QTZBek9KeklnNDl5cDlh?=
 =?utf-8?B?alhITEk3dy95aGJGTTNEd3BiNzFvdlBLOTJ4NzA0dG8wcnFCNHJKMHgzek53?=
 =?utf-8?B?RVZyekxoaGNwK2tBK25BS2xZd1VDNkhIQWhON0xrWU5jK2ZlK0NRM2ZiejZE?=
 =?utf-8?B?TXd3bmdPU01UbCt2c2grbFh6ZHVWS1NEeTJoUWhzcEd1dmtjbU5abVR3Sm1R?=
 =?utf-8?B?Z2F4SFk5L05qWjR4V1JodmtGL1phUlE3cVFvSWN2Q0tQQlQvYVpxYTVYL3l2?=
 =?utf-8?B?Z0JjTldCK29Gd3VRcG5nWHQ3T3hGY2FGMllGMEQ1bGVoMU5uWStsSEdiNXVW?=
 =?utf-8?B?ZXdzRS9OVVBGS3NGa0hzSDNZRUx3eGk3V1BmRzVnUXpGbUxOWkFIYVdpYmIy?=
 =?utf-8?B?V3ZNVHcwU0RGWE9CUTJEUVJIZnZwYkcvY1hROGxHSVJQSTJEV3c1OXdKVTVI?=
 =?utf-8?B?V1ZNblZDNmNDVGViZTBKcDFueXdnWG5ybzFTalg4U3dxTStnVjEyK3FJbmJ3?=
 =?utf-8?B?aEs1K28xeVNRL2U0UnNxdlFhQUE5Qy9vckRweXpHQjN0dGRJYnRJQS9yQUNi?=
 =?utf-8?B?NzlFb0N1TmJ0anJZYmhpWUZ3T0pQZlhKeTJDbWxZRXA1aEpiQW1MbGJtbXJK?=
 =?utf-8?B?Vm5CS0IzejVjbFJnSmhGdTM4aXdyZ3M4M1R5ZDRHL0w1Z21oUVZqN0JGaHRx?=
 =?utf-8?B?c1FPbS80YmZkcHFkU3phZEpGK1VvRnVKOVNEYklkR1ZGdHNqS0hQVHFmb1Va?=
 =?utf-8?B?Y1NLR1pJTXo2ZWkxWTZmSzVxNFoyQkYvZEFhUitqUVAxZ29NT0Z5dUFpNzhz?=
 =?utf-8?Q?Q3zX11cvkkM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdPKzV2bldicGlRdmNDTllDbmFIaXBPZXFhV1REc2t1Vi9SL1BBaWlZdG5m?=
 =?utf-8?B?S2ZxVi9vMHdMR0s4ZUxOR1YweWpnV1NWbkpramtGSndOWVQrRDhsZnFrMVVH?=
 =?utf-8?B?dmxOT2VCZWJSOGlIZWJzY3MwRW5Wb25IWFVydytQVlZPbWYzTGR2UXFHbTUw?=
 =?utf-8?B?UFo4SG1EczVQWVdOaVNGL0FTcU9Qcm5qSURXYjlwL2ppaUg0eW1DaWtPTHNL?=
 =?utf-8?B?UnZyZHc1TGhFQlZGR3FHSit3Q29aV0tWRmJEQTl5SVdvUDZZL2JnS08vZldI?=
 =?utf-8?B?eVZ0OEEzMjUyZUUxb2pYbTdrd0lHdUlscVI5enVIczBQek8yOVFrVXg2Ynlw?=
 =?utf-8?B?MEtyYkFTZlg4RG9JQjByOWVkUTh2QUxINEIybUxLL3BMK0dSVWxHR3d3QW5W?=
 =?utf-8?B?TFhQdEt6cWZCK01NZHB5d0JydU9TbGxNcUZmc1hwYW4zNFplaWxqc3I4RWc5?=
 =?utf-8?B?cHhqb3lpOHFadE8xYkdNc0QydkhwSUVNeE4yUnN2VE9rQkVzbkM1U2pZVGhD?=
 =?utf-8?B?M2xtUmFPYzBOK3U1c25jZWRTcWYxY3FvcmRNRkdoMHR6Y0EvM09Vb2tRVTdm?=
 =?utf-8?B?b3FmbFE1ZVdldWQyK0VmYVhxU2VLMFg3TjZmNzl4Qi95bzNKL2hZM3RwNkxy?=
 =?utf-8?B?Q1lhTGtyN2ttQkUyKzRtR290cDFOdTk2cjlsQjhremhCcHRBdEZwYXFMZjBW?=
 =?utf-8?B?aFpLTis3VkwxWVdCL2xqZVFxUG1MQVBrMloreTNRd2trUjZCRzgrdUlZVU50?=
 =?utf-8?B?U01OTE5DTUJ6Z2NEa20ySWxYZGszWkxqcnQwSE5SQzQyTjhZNElKeXdPT3Vh?=
 =?utf-8?B?OTAzMHZVM2lDZ2xLdE0zWWd3NitWK2VEWllIc29DZjNheDArY2RrRmN2RzE2?=
 =?utf-8?B?cVJ1M0x0WVI3YWNMcGFBZ2xDbDFBSmx1UGxZMGtuYjA3WTUzSFlkWkROdzM0?=
 =?utf-8?B?SXhrU285OUY5L01oT1RRWWxjRWx6R0ErZHJOWTlYODRuVW5iZFRzTXJVbzlV?=
 =?utf-8?B?dTFkS3ZtZG5ld1FZNTRuTS9vUXYyaTFyK2NzTzFJeTJyRHJ4NWdvb2xmTU5K?=
 =?utf-8?B?N29iK09WcExlY3B1SDlUMlovbTN5b01HQWdVVDBaRmxGNjUrRjFPblgvYlU4?=
 =?utf-8?B?MDY5bGo4Nk8wU2FXdnB3SXdVNWh5MTdVcE1zYjBvS3lKSjJHZ0VEc0ZiZTlO?=
 =?utf-8?B?MU1uYXMyMjRBZ2xIYlFWc0laR3R0QStCQ2tIQjM0ckFzMXNhaHJQSG1nY0dj?=
 =?utf-8?B?S3lDK1IwVmFFdmEraVRZNklNbUNQWkRLNnBDYUVSRmxPR2NsZVMyVERjcVFw?=
 =?utf-8?B?TzNXcUdHZVFYS1YzY1hBVEF0UVBHbDZReXdaclphT2dSY3ltdkNlMHVVSitN?=
 =?utf-8?B?bXI2Zm10aGExZVlzUUhwZGswNGZuVWNOSWJYT1dJY0JNaUNqMFVsZU1FeHl2?=
 =?utf-8?B?YS8wZkhUa1JqL3BTVmRTNVpPTE9BemFWdkFGMWk5MDVoaHhBbHg1eXNiaWY0?=
 =?utf-8?B?b3Z4MytlbjFoU1JXeFgvSTBJK0xua1BFVUtmdDdSa1NNMXYvLzVGdVdybE04?=
 =?utf-8?B?Z1R2NmE0eXBiZnQ5U2JSU2tyL0RVcno2Y09BcHRiUWJZM3F6WWhRdEVCOStp?=
 =?utf-8?B?L0piQXZzMWJZUmZjUHlqYWk1YzdEbTdDVzBna2hZWjJWTmI0UjJYMW12ck9n?=
 =?utf-8?B?MDhqZUZ2Z3hyZ3B6Z3Yzb09RVmhnUEdJOUY4a2J4WmU4VnEwUzNjMC9LeEdo?=
 =?utf-8?B?WmxUUUtlb3dlM3U2YW8vcE1xYU5VU0pNT3hqR3F6WnZSUUFDanV4VUNWRTI2?=
 =?utf-8?B?bW51c05YRTU4ck1vM3JtdzV5NmtVTW1lejUzaUVnMC9OYmorQWw0Mmdqelp4?=
 =?utf-8?B?cGw5SE1pQWNFSDRJTEh4MThnb2lsbjRHdm9tdGphT2xXOTFvdWE1SER4SjJ4?=
 =?utf-8?B?WEhPRHdXc3JXK3c3TmdtbXgvS3hSYlJsTFo2YXBncEdQU2xTcXo4TWhZT2tO?=
 =?utf-8?B?ODdQanBIaG1ZSHNDM1ovL0YwbDZlcDVocEk1R1pFY3Q2bEw2bnhlNXdla1lH?=
 =?utf-8?B?SjhCV1VIaHcwemZVVktOVW1wZGI5RTFsUlF2Zmc4M1lzOWI4VXRCMlk4UnJt?=
 =?utf-8?B?UUR0Si8xdkJLTXIySWl1S1FVNlgrcjZCa3FVN2hnTzlwQ3c5MlVVbEhlSFYw?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1e4dbe-0a0a-4970-f2a8-08ddc4710927
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:59:52.4414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjCOGvXSxhs5tsWj/E0UOTT6uAzy4wuQZ6m+d0pgzEZsxbWPenzGVGHLEaFlUEysPAmaiZCWvpwHnihCc+8DbaNjJbgzuPOiiSTJmGdj97Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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

On Fri, Jul 04, 2025 at 11:02:24PM +0200, Tomasz Lis wrote:
> All contexts require an update due to GGTT range shift, as that
> affects their HWSP.
> 
> The HW status page of a context contains GGTT references, which
> need to be shifted to a new range (or re-computed using the
> previously updated vma nodes). The references include ring start
> address and indirect state address.
> 
> v2: move some functions to better matched files
> v3: Add missing kerneldocs
> v4: Style fix
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c        | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  1 +
>  7 files changed, 52 insertions(+)
