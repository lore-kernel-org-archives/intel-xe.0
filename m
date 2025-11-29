Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA4CFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 20:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B410E21B;
	Sat, 29 Nov 2025 20:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYGd0jNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2610E21B
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448064; x=1795984064;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HXBmo6bKEXn/cIGCUDUigfiOxJTbBTlhMAWHJ39OgEQ=;
 b=AYGd0jNWXpoFeVwTveOq6yphx3xW01/G8g3UBGYnd0jLdCoXzJQWeZ97
 hNs7BlCtVdN+GyLXXT+F/cGOU50/MrO6RyXCM0zBi9+faU62VR4MOPOCI
 nIbl+zmkTKL8E2sohQQCKBxa0r1FgWw3/rN1rJV6Sg/gT9yTQxS9ThRdD
 a2SbLvMuGO+FkA3lfJ3iwiF56MYO/07xXRZWEhaj0QfjdbX2puwCgByYH
 s4MzZACSyHuoifTRKLcvXuDbiJgR+sF8X5s34Mz2uUKkfR7dgxB3GPKAM
 r9e7SsmV23toT8V8J4mZR5Bs4/3pAwde/SaQTb3Ra+saIAoZt1KZ5osQR w==;
X-CSE-ConnectionGUID: T/rYGz+qQzmmHBnu4RcZGA==
X-CSE-MsgGUID: B7DUd+KwT7G65ywfLl3b/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="91904754"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="91904754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:27:44 -0800
X-CSE-ConnectionGUID: L2Ht017kR6CYbCX36973dw==
X-CSE-MsgGUID: bhN/l36FR7y/As89dlV6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="198649866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:27:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:27:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 12:27:43 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIbvv2cPfYqroEPUY4gVFNM9KU3kjRDi2IzgVc1je6nofAiclb75FpFV2OJUKK0wS2PPX2ISX66K1R1fnm9/q4EBZDTZsMnzFSxM2K30QMAhun8QVyYvCmKltct59fVuPEYW//txiygLNixmFyFwPTxvBGxo+XOIuontx0LVxgIq1rML7ldZbchPAcCvuqDNBNMIgraFjPKzUNjEaTwFSGAScLM6rYcZHAH+OhaM74nn07xhS/H1pgpe72Tx/WmnftQ8wt6q5InkjRYJf8OsNwVOejmwB+pGuy2sB7sAfOc3gsTW0OIs0oJQgatYdGRJ8mBOMZaqYpXsXbsiXjaltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqNyBAUdREW1T9bEjgJ/Slh6i4tWfEHOIWq5NQjNf7c=;
 b=oc1Gb/zyvOXZ8SKxtZajTGpquz/RdqYKTuv4mPEhBsI7+m6tea7aamJWIfeLJ+LvW7gN2gWge6VWkZklVDmSoUW3Yn2HAs9iO66/nq+jgXVCdaNYZ+AecdQQkXU1QUMxYseJISnk0+PBtxq90I6iQrQJ+c0EbDJ9ONXXkcnGlsmplWtCLa4/I7Q6w1NaDL48AZkS/U2MANdm6osRqNHnixO70HjMUetXRAm/GkH0M+EsygQri4UfZwVIG2yzDxWVXT3xk7qR56rICHTp430Xa+It6injTI19jDVMavWzWAEMQ3hXp82jK40bcUT+QYQlmlEauTSzz3EniN7PcXf4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 20:27:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 20:27:40 +0000
Message-ID: <91d0b4c4-8209-44c5-8d1d-8960ca02144a@intel.com>
Date: Sat, 29 Nov 2025 21:27:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/xe/vf: Requeue recovery on GuC MIGRATION error
 during VF post-migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-9-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128133052.17120-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::29) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: 053dc8cd-9e8c-4633-7be3-08de2f85be0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0dScFZvMWpKc2wzT0JDZWpubHFXS1RiUHZXWFpBUzRjR1FzQTFQQlVkWm1R?=
 =?utf-8?B?SEROTDlNOHNSUlZnMGxDS0FVWm5HYlVuRFVIWU1FUkxNekdZbWlDYUpCUkoz?=
 =?utf-8?B?RE5QclA0b3BTSzdCTWhPSk9OVUNIeVhpTDRwRmFOZ2huUEFmcTd2UEZUN3dq?=
 =?utf-8?B?cExGS3ArZWRjcDFIUUtoTGtRSVZZbEZBZkhXVUEwUEdSRGthUzlpTk5xenlR?=
 =?utf-8?B?ekR1RzEwd3c4YWE0SFJIQ21yWkhIUUtrUFoxY3dENVkxSGs0NDZWMGhSYzN0?=
 =?utf-8?B?S2RIb3BLa01EeCtXRFBTTHNJd01qYlBUeCtHMHlhRG9qNDdZVzZNZDlCKzZR?=
 =?utf-8?B?TWZEZERWZ2ZSanZyL1NPR0h4aW1HSnRzc1hRSnBKL1Nnb2c3aVpkb3JSQThW?=
 =?utf-8?B?d0d1UDkwNUdOMTY4ZjkxRFMxV1o1ZXhNNyt0T0hpcTIxU1JjSXIvNXhBVmRh?=
 =?utf-8?B?dm0xcSsrUHBEM2VPdzNCZjJjQU1iL0MxWEp1QnVtOWx0SVE4UXJiQkhFaXlF?=
 =?utf-8?B?ekRzTW5kY3ZsUHk5MGVEWXRoOFJpVFRRQXZIUHc0aTJCWlQvRm9qUHY4RC9a?=
 =?utf-8?B?T1ZtL2xaRWovYzdnM0FtWlp5SHV6NGkzc2hENFZ5MC9HVU0ySlNvM3hQY3lm?=
 =?utf-8?B?WTM1dCtFVytzTmw5bFpkeUFUMkU4UVZadTQzL3hYSWhRRnIxamNkaEJJdEds?=
 =?utf-8?B?bUxyc3JuMkc0NC8zeGtScEJ5LzU1OFJ6U1hURlRBTHFIdnJFMEVYVFU1Qi90?=
 =?utf-8?B?WUY3WDNnaVpPVWxlSjIxMTJpbXVxUTFhclVVYVFmekN2V21iQUtBNjJ6SlE0?=
 =?utf-8?B?bzZpQVpielo4UXVzbnAvSVMyV2ZXOXBJSDBwekhRRzhnTmRtZmdlSE1TcW9B?=
 =?utf-8?B?Q0xtcWVQQzZoOXExZ1JUTXR5UzByZG8yS3VEMDRNSnk3eXV3WENaSkRPVUJl?=
 =?utf-8?B?dDVNVkM3dzlmMWU0ZXZqZVRqc09uaktyR05VdHBTdTEwejVrUUYzM3ZGTGdW?=
 =?utf-8?B?SkMyRVpma3lISGNIK0RJQmNVMUFCZGtseWc3S3BxTi84SzhabmNQSnVielJj?=
 =?utf-8?B?ZWRiNHpLY1NuUkVtYWNpWkRlS3BTRGNzL1dHVDdqUXRNN1BuS3FmT0hyRlhI?=
 =?utf-8?B?cThYaVVZbnR3ZVl3alg5ZnV6UEhCWkx1SUc3RWJtem1Mc3JHUW12YUtPWWxB?=
 =?utf-8?B?SHMxK0piblBzUU9pZ1p5UTZCVHJaSytGS25qRjVqbWRGRUFIK1JBRUJCS1BS?=
 =?utf-8?B?eUhRVnl2WWdCekxieTRBVGdlZ2JZVnZFMU82V3VVNDR0UEhZekVrbHk1WjMv?=
 =?utf-8?B?b3R5c1lXNmtIU2NYc1RlVnZnQzhOdmMyYjg5VU9laEVHYkhxM3d4WmFYMWhV?=
 =?utf-8?B?dWRTVm85OVROWWFoQ2xQN3VNd054SVFqQkFGejRpdm5YMUpTVHQ5eGVaTWRl?=
 =?utf-8?B?ZEFGS1ZuYXE4VHYwS2xDb3BicEJPRUFOZ0VuVEx1QVpJQWs3eFJrejBuNlRs?=
 =?utf-8?B?dGV1MWJwZ1lnOHhUVG5GNzh4bUxDdXBNYXpFa01SZ3hCZjhPQ0crSitUYW5Q?=
 =?utf-8?B?M2MyVGJkMXpoRHdLTjZXYVFiWkRhUnVFU3V5RW5oSTlma3ZoK3dBTlVjK1ha?=
 =?utf-8?B?OWRHM0Q3bEIzZzdnZEc1ZTFzbzNtcmV4RXZjKzVNVFo5SlAvMHZmTnU1dzUx?=
 =?utf-8?B?LzdvTmdIanFObzhDV2UxdUV5ZWgvbWRrNThhWUdzWGNkTUtKa3Y5UTkyS1Aw?=
 =?utf-8?B?WkUvNnZxQkczWW9TVUVoQ3E4elA1TmhRWFhZKzIxNjBSWGd0cEFKandMRFV5?=
 =?utf-8?B?VGdORlowdEVqWmJVcTAwRnhHV0M5WWdmbkRtNlJvVTJlQnhXanZUS24yUUFh?=
 =?utf-8?B?NUxVU2hxU1ZBQWVwbkFFb3UrYk02RHYyWkhNSzVCMUdCTTMzVjJkT1ZheVFH?=
 =?utf-8?Q?ZksUDzbCH9QRphkV9Z1u6soArqcKLpo1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDlweGhaVFNxZG1XeFZONDRkb25wbDgvVFNUdjJGdTMxMldBYlBkMzVkRzVn?=
 =?utf-8?B?U0w1TzA3UnFRcDZQMnBDbEcxcjFIRXB3dXRCMStYWU9ZNCtDRWhQU0U3OXoz?=
 =?utf-8?B?YVFqYXhlLzNUblFxaitBdCt6SmhQczljcSsvMkhYUSt4OE13TW8rWW1RRWtu?=
 =?utf-8?B?TTZFZWpoTXIyZTVZTUFRQ3M1ODFNc3JxdzJNdHZmbDFJeU1NMHlaYk9MdkhF?=
 =?utf-8?B?akZLWkZCeW9Id2tRKzBHeC9QTFI5ZW9Ma1BPNHAwL0xPVHRkS3BFUkt2UnJy?=
 =?utf-8?B?QXMwVGtUaXJUWkJtd3U0cVZhYitRakd4aU9JcmNuSWF3b25iWHpUd3hESklY?=
 =?utf-8?B?OWVuNWhiSFgxUDJBcW1BdG5GcndSaTBSY1RZR1RWOW1Gc3p6blRiMy9nMGtZ?=
 =?utf-8?B?MElzQnkzYzErYzBZSGZ6bE9tWHNTTzZzVVFXbDhMMDN1ZWNQMjFJeTJQK21U?=
 =?utf-8?B?VUs3R0VzdWlhN294dlRaUmVFdXdxODNsWGxyemtSdjZnUVhLVzBKMFB6eENh?=
 =?utf-8?B?ZDg2VkdwUktLMGx3cjhHekhpV2JleU4xZnhzK0o3SGc0eEhlYTByNnZyb2s3?=
 =?utf-8?B?ZmZDaFQvTUlOYlZKa1hQc2xIUXhvY29xSWY3N1VrRHc5aHlIMEp2bDlDZ2pZ?=
 =?utf-8?B?d1RKYVVvbXQ3M0VYRCs0SEpDeXNaeHFPd2toK0tBK2FyZ3BuK1VicGpKaXYy?=
 =?utf-8?B?NGVocTRuVmpGUXJ5WlE0dmRZVDEzZjF6WG1Vb0crODYwRnRZV2dIRTl0czJU?=
 =?utf-8?B?NEJzWHBNNVlsRDBpSVZmcWtHSXcvR3duN2VGV01Qc3Jmdk42QXJWc2tQYlN6?=
 =?utf-8?B?WCtLN3F6TzVuUzB0ekQ3MDlVaDFhckEvRXlSYzZaRkhSMElGaTk2d2RGUlB0?=
 =?utf-8?B?THVydnNENXFya1Z1eGVuN0NaMXZHcWlhWlRxRlJYb1FJNzd0enlJeWNqT2Fr?=
 =?utf-8?B?UEI3YW5ackZQbXhkcU1hUzFKaFowcUtBUHFRK1ZET2NTLzV1WEl1dzArVzRq?=
 =?utf-8?B?b0djQ2xZTlN1REFFQXFUY0ozaEtMMnNzZzZpTHNsY0ZhblVibHJRUEduTElu?=
 =?utf-8?B?NjRINFhkMm15Vkg4UThtcDN6YWgzM3ZLUVBlTWtwR0phSndPN0xNVzlHQUdJ?=
 =?utf-8?B?WUo1ckd0SVdreUEwTjV2WktUVG1RRDc2akd5MzE5QXNDd1RVWTdKOVFXZEVG?=
 =?utf-8?B?ZW0xNldnVGJJT0ZGaENxM3FVbWQwVXRnYTRkYWZSQlgvaEczMnB0WFZNZlpL?=
 =?utf-8?B?c2xET2JoOTE4Nm51WHBTdU9VMmI5b2Y3WDJqSm9JQTRVdDNPWGFyVlRnVjNK?=
 =?utf-8?B?cnc2Tzk1NXVPU1JGaEtkSnB0MExIa0xrekxzU251K0ZHaTZLbkE4QWdiTito?=
 =?utf-8?B?WjBBaTlhYnVGVjhLcjdGY0dQeHg1NmdQekd2UitTb1J1U0dnRnI3bHkyRG9Y?=
 =?utf-8?B?WWdmSGJiOUdvZW5wa2hQSGdEdFh5cGdQaHNyNGtjUVV6bW8vUXIwRzZJcDBP?=
 =?utf-8?B?Y3pIeTNIbmZpMWlIV216eHF2OVFzZFBtOVFIS0Nqck1zckxCQWdWSVJVTlRn?=
 =?utf-8?B?V2MwQmM4NW0vdThSOGdtclI3LzJ1ZS9NajdRdUN0dkYzOGFub3BPaHhXMEhD?=
 =?utf-8?B?ZGp4RnpkMDd2RG14MjlIeGMrMU9aQy9ZODV0RmpJSHRIR3FwRzR0K1A1WUQ3?=
 =?utf-8?B?NUZRZjVTUVhPUmxvdU1FbC93aFd0YUx5ZmlkaVhlUzZ3REhLdlBVekQycXBF?=
 =?utf-8?B?cWMwR0VoaFhaR0s3N3gxVk9TRWxEZk13MUQvWUVyclFlYklUcjRpanBwZ01n?=
 =?utf-8?B?ZWtQYU96TEVCeEZZalQyTGt4dUd0RFVEV2UwTUpuejJNamI4Z2htdENXcXZD?=
 =?utf-8?B?UXE4cVJEWHgwQVBKWStzaWs4ZFJmd1REU1dORDJkVXhUbzZUZzRENFRLaGdx?=
 =?utf-8?B?RGF2YUo0NGNnSTJaalMyb0NmUlZ6MmtYZThrNC9NSkR5UzJzRzQ1ZlJ1YytR?=
 =?utf-8?B?VlZ0RUFXT1pBWlMwSzQ5WkNUZnJXYWpGemtld3FXaWh0SVNRVlAxc2htdU5O?=
 =?utf-8?B?Ym4xYnR1UnFsTG42eGE2WTBGaW5kZ2dTMldqb0pudVplUVhOT1Y3Q3Q3Q2cr?=
 =?utf-8?B?TlYweVh3Zk9mZlZudDhvb0MxWGZ3djBTQU1FbFo1cTlpNHAzNHVxRjRZcFBi?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 053dc8cd-9e8c-4633-7be3-08de2f85be0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 20:27:40.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/3CEQzZwTSwp2rO+mEJP7SrQWaR9nus1RdNc9MrQEwmNGuwabMWNL+x9rWclVO4sHwR0ZI9MY4h9fswRO5PAq9kYvWpqYE4pQ/KWJ/yymg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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



On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
> Handle GuC response `XE_GUC_RESPONSE_VF_MIGRATED` as a special case in the
> VF post-migration recovery flow. When this error occurs, it indicates that
> a new migration was detected while the resource fixup process was still in
> progress. Instead of failing immediately, requeue the VF into the recovery
> path to allow proper handling of the new migration event.
> 
> This improves robustness of VF recovery in SR-IOV environments where
> migrations can overlap with resource fixup steps.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V6 -> V7:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 +++++++--
>  drivers/gpu/drm/xe/xe_guc.c         | 6 ++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index fd7dd4a4739d..937554657440 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1256,14 +1256,19 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	}
>  
>  	err = vf_post_migration_fixups(gt);
> -	if (err)
> +	if (unlikely(err))

no need to add 'unlikely' anywhere, we are not on critical path

>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
>  	err = vf_post_migration_resfix_done(gt, marker);
> -	if (err)
> +	if (unlikely(err == -EREMCHG))
> +		goto queue;

maybe it's better to code that as:

	if (err) {
		if (err == -EREMCHG)
			goto queue;
		...

> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
> +				ERR_PTR(err));
>  		goto fail;

shouldn't this err message be part of the earlier patch?

> +	}
>  
>  	vf_post_migration_kickstart(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88376bc2a483..f0407bab9a0c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1484,6 +1484,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>  		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>  
> +		if (unlikely(error == XE_GUC_RESPONSE_VF_MIGRATED)) {
> +			xe_gt_dbg(gt, "GuC mmio request %#x rejected due to MIGRATION (hint %#x)\n",
> +				  request[0], hint);
> +			return -EREMCHG;
> +		}
> +
>  		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
>  			  request[0], error, hint);
>  		return -ENXIO;

