Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF27EC110C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930FC10E412;
	Mon, 23 Feb 2026 17:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQgWTrSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C5A10E203
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771868599; x=1803404599;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b7+PuBDjKuoUn9eImUder0wjOmeGsgOfOcuHGbOg/Wc=;
 b=fQgWTrSXy0VOOVuklB8HxYofjZ5r68U+h8vwFBls6OfHYt8N2cLO9NlU
 lhndyaDxt8A68zAd3SX8lmXW9Mh1IF2CIPO2SbT895KSV9gnu/eDSa9j3
 2naAG/jVgqV2T+NBTe6Xkj60g9+EXpJKIfMrx1QRFDcgcNlocVdE/8jAG
 UvXySShwnn6FLw5DCB5YH5qx2YrtYleIsmbuznDIq5eCtJEcvR7xtC07l
 YWT5Uqsqv+t9cGF6exbQKUlSBAma6nIbrSkgu/pIA9jbo7pQljMUjUC2l
 2jDH/EsEzv1mQdMAtuOgIcvkaDBsRIN++GqZoO1BzvIF5WNuJ4s2o/8BN g==;
X-CSE-ConnectionGUID: ZRGWAs+QSi2FO1Bep1ZUNg==
X-CSE-MsgGUID: WIavIbreRDut8N08naFpmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73051038"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73051038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:43:18 -0800
X-CSE-ConnectionGUID: MMtTPMwTQ4+MQx75z9niNA==
X-CSE-MsgGUID: C0FCc5UCRTqj8IWlzRF9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253364583"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:43:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:43:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 09:43:17 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:43:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKpwMRr+N/kY6uFXADA/ITw9fNj26l7EnooYZuVf/us9PMnz2Ix8VH4OS23Pt8/pyxFARka8nUq62A5ZTX8MAxq+hlUoSXqbecaFaWj5hBqTvfPRs0h39gdPviRmfxtjMitaz8dUNdY2kRKpNDXv7OeXIeZZkcDH8UoX68UJmYywpMFetWJ4c0LNIiuPu9w/gF3nvWnAmtKU9gUX1EE/aeW2Lx0D8g26qmYvqGwmxEq0RdyCs0xFuB6GfuJeqYR4wfGaaqdK/bJBPYaME4dqa5L2MuGo7d5P2+qQu7n1SuWrfQvaMMD5cnu6P1o36ipiYVDszjwcHaCLDuG1VbDcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgcsoXYpCycPQoft7eXSnVjhy7G19QUu4KQe1fq9iZw=;
 b=jyGmWjnNVzbhBUQNBFhAwSxZCtOjiDRKKpB55ZcG+6+YXvq5a7lpFN6xsiwyByaQBmkH5Bd5zGFzfdPwabGGT/l2XFyQ63wJlGM6jfDrFyI3nYq3k/ciwuvW5q9sPaXOKLbhPY7BGI1eT1ZsUHgnv+SbkctSaUMMVdNnLqNwH03/AH0AQIMNQkFKwxwUCTC2cgqOZJ3ELBaiI5wSdWGJ1rUAs0WsDSuS9i3ZC5xQOa3fURql1vjsbHsdF+su9TDdGpKCOR6v+CqcatTX8P9Zs3S20EdIQ+xnDeDU907vhi7FPkclbgW8+SHa3xyOWv1AhTzcM1lmYahTPWghMXsXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:43:14 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:43:14 +0000
Message-ID: <43ce9f61-d5cb-4f45-9628-752ad1c557c6@intel.com>
Date: Mon, 23 Feb 2026 23:13:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix memory leak in xe_vm_madvise_ioctl
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260223092815.1500739-1-varun.gupta@intel.com>
 <DM4PR11MB5456838AF22779035DB779ECEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <DM4PR11MB5456838AF22779035DB779ECEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 38eca2e4-86a4-41c2-39a8-08de7303052f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2Rja1ppYzJZb2ZPcWlUZm9HZDZlY0NVL3Z0ekZkcWNNbnQwT3VkRUhSQUlP?=
 =?utf-8?B?QjFjakU5U0gxY3NuYitKaGV0MnVWUEkxa2NWYzl2dno2UW5oU2NwVmlWajlJ?=
 =?utf-8?B?V2x1Nm12d3cwMkRXWlV5eFo0MnhETytvNXpkKzJzVUxuMDgwZW11RjNhT2pM?=
 =?utf-8?B?bVNSL3hFVFErTFBGWFFUZHFUMDZTNE5JZzU2TElER1BVc3ZSVklNdC9TdG9U?=
 =?utf-8?B?bldLb24xek83aWFWejQ0bk9UajByMTlqTHVGN3drN0JKSXBLZXFjbEN6Tngy?=
 =?utf-8?B?R2NiRTV5Tk4zYVgwUERobGd5alVpS2tjbU1KYTNIcVZ5RGo3YUZSd2NVMU9v?=
 =?utf-8?B?TlZZbU1rU0xJVW4xcnFvL2VyLzFpR2oyYWI2OXNBbFFPQUlyQy95NzlMc3Vj?=
 =?utf-8?B?VDgzM2krbkc3bHNCMnc0NkdlYlU3WHh4VEduMjV1YktyanRSSTVETDlMdEZ4?=
 =?utf-8?B?dW1kR2E3eDVGbDU4RXM4QjBjNDVTK3p0elNTTnZZZmhPQjNGdU9sZTZxSDgr?=
 =?utf-8?B?ejhZbE1rbmplaGc2bHZTL0JBVytGQXlNKy9jYXY2RENRbUJPNlUvT1dvdDFk?=
 =?utf-8?B?RElHclVoc3pPUGJHbzZISWt5S0NyeUlPSlZsNVFjeVVSM0tCc1RrNUhyTEpV?=
 =?utf-8?B?b3l1T3ZtQk9EU29mcG1mOU9VRCtmeTJzTlB1Y3ZMd1JYMldqUWJWZjVueGhZ?=
 =?utf-8?B?RjZOeGJPaW5kN0VzQ3JaZktTRlpiQ0JzWGhucE1mb3RNeVh2MWtQbXgxUERa?=
 =?utf-8?B?Slh1dUZaTWdmSWNLaGJWZ0xhb0w5QVZsRS9NRzJtRXNJRVhMQmJ3Rm5MMU96?=
 =?utf-8?B?N004M1FNdGZkL24wb3JTODlqeVdvTkFMOWRXZzRvbDlCYnRUTXAwVG5FME1h?=
 =?utf-8?B?UG9udzFBNGVMbnhoUktkRldhNThPOUY4SmxOMVFPRUFrSWFjRFRLSkVPSDND?=
 =?utf-8?B?dXRSZUFMS1FOVDZMbHN4a1pFR0xDb3ppa1BxK1lONTZobWJ0TWZqZEtuVk05?=
 =?utf-8?B?bXdZMUtoc3dXdVpDRk90WWFFSjdld2MzVC9TZCtjWUtINkVSY3Z5dkdGM0Jt?=
 =?utf-8?B?bExVcFlMY0lGMGYyWkFVTEhva1V5RHhONEdzblFsK2pWWnJNTU5CdFZWalN6?=
 =?utf-8?B?WVRXZ0RRM3NmOFFhWkNkbEIwOGFVazFjNGNrTkI4Q1VmZ3Npanp2Qmk1ck54?=
 =?utf-8?B?VWQwcTduV0tRYmtocTQ4eGR4TmhCVHIvQVNmYkFoZHZtZFkrYkQ2OE1KVlVq?=
 =?utf-8?B?aHhRREwxQXBVb1BiTi9FdG13WisvOFNrN3VKOUxnVkFtZi9tbWJnOWwwdUx0?=
 =?utf-8?B?QTlmUTQ0UklpOFk4aUxxRmZheHEyZ0JPWUdRYmFCemhZcXAzNXRpT3phcDZR?=
 =?utf-8?B?WENhUmthYlY0Q2E3Z1VFb1pXaktsbWpzaldFb3FodzU5Nkt5M2tGbjdHbjI4?=
 =?utf-8?B?VVUxY0JlYkFjdE9MeUNzdG91SEVNUE9PSjltVUYyQ2R1Vk1uY2Y2Q2hIZVo2?=
 =?utf-8?B?WXNYNUo5R0sxNnU5c3RRNjZaUEd5MXljZllhbG8rOCtzd2wyd0ZZbW9mY0Fu?=
 =?utf-8?B?R3JnTzl1YkErVDA3bkU1MmlicEltQmgwQkFMWWJHWlFRWUJVeXNwK3dHcjlW?=
 =?utf-8?B?TkNmY1cxUjRIdFZMb3VNL0hCc1dKRzBWOEZNS1lTdDA5TkFRMEZqRGFWVWl3?=
 =?utf-8?B?VjlmUlZub0l2ek44NkYzMTdHMWdBOGltRGZxcjZ2ZUtTNmM5UHppY1Y5NTlB?=
 =?utf-8?B?c3BUNHBBR3VWbXVTTUxGa1Njb2R0NkpzbTlOeUYrbnJNaHVnRHY4aXJYaDZO?=
 =?utf-8?B?dUdBQVVTand3VUtIRldwMWoxS3Zla0FtSjFWbE1LQWZ5bUVydklkN1RTVWIr?=
 =?utf-8?B?WDF2UmF5QnI5SXM2UlUrcW5DK0U2NmJFRVk4OGNSTEpYU1c4N08vQ1BjbjZS?=
 =?utf-8?B?OWplRW84eCs3a0NmbFo2VzU4RmVJS0E5T1hPSmdoR1dRdTZuaDJlY1BWWXgy?=
 =?utf-8?B?QjJXSk95bU95ZXFNc1prRE9PZVVVSlF2U3VwUitFUzJjeUJwcndRT1hGLy9y?=
 =?utf-8?B?bktZQ1EvWDEvbmp2c0pOL2xGaGt0MkIxY05sYW1BN0ovQjVjRWlFWnV0Zjhi?=
 =?utf-8?Q?YBE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mld6OGtPOWg4R1lyNU1Iak5na0VVNzU5dE5kZDdJbWR3cFdEZnp6QVFDS05q?=
 =?utf-8?B?NDNRUnVrbDdSaUNZdlFVamtXMFZuU1doT09wcTA1VktUemFXMmFYRG55WlJq?=
 =?utf-8?B?alF5MEtqK3p2QmFOejdaVEdVMUZkd3MzQTQ5T1ZxUDU1dFYwYzJKVys0blpE?=
 =?utf-8?B?Nmg2bkQyVEwrWXdiZXU2RDNGZDBIRTRjSjZRekhhOUJLSG5RbExuNkRRUGlv?=
 =?utf-8?B?SldxRXEvaWNlVUtLOGMrc1lKWDFtUGtwcGt4R1hTaGFPQW4rR0JRQjNBZXpv?=
 =?utf-8?B?SDNvZW85RmtzeSs5aXEwL1dwTzRuL2IyUzFmTkZBVHhtejl3RVFFOXFHUkZK?=
 =?utf-8?B?bXViMVF4VnZValhoa1BHWDdETlVTazdDd09hVVFGa0JLcUFDdFEzT3FvdFpI?=
 =?utf-8?B?dVEwdXFNd251SmRyUW9QWU5kVC9WTURxQXp2WTZCckZTeHUvTnNIRVBNcnJR?=
 =?utf-8?B?MFYwT3ZtaHg3ZkxuOGNXWmxTVWpOUDlYeHVwajFhOTNjYnRWTHFQRHg0K0NZ?=
 =?utf-8?B?cTBPOTIzWnQ3TkxwcjFKQmxJcThSbENXTDV3d0x4cWxhaWVPZWZlemdrTDlr?=
 =?utf-8?B?VUttS0N4UHVaYzBTNHJBY1lUemtvMC9xTWs4Y2E1d01xLzlQdUFML2hUeDdw?=
 =?utf-8?B?NWk2TjN6M2ZZZlBoRnVSY1Q2VmpTK2FmRUdyL2F3YXNwenJtOEFYcm0vTExK?=
 =?utf-8?B?WnZ4TDRiZEpjY2pld1FUSTRrWXB4YWwzaEt2Njk0WHluUk95QWV2MGFpS3oy?=
 =?utf-8?B?TnR0QmlWWkllY0VIZmRGRCtBMmkyWGNjZUZ1MUl0SGZmQzErZmhQQVFaRXpw?=
 =?utf-8?B?ZWMxS0R0dldENVBTNzV1eTNzTWFkdG5pd3NrSHIwL1MxSEViVkdZWXBPSTBu?=
 =?utf-8?B?ZWJZRDk4YXEweHYyeG5KY0VTemR2UGdkL016dlYyVjlPY0p3aHNqb1ZsZExl?=
 =?utf-8?B?ME1jblI3MjRobGxoZnR6aXRFME5ESHNXeFh2Lzcxb3FpaEdkaXFaaUREMVVI?=
 =?utf-8?B?S3NOaWpiTXVmZ1Ezbmp4cFdJQzNNYlhCc21ET2JMNm55Q1c3dnRvK3lpOFBI?=
 =?utf-8?B?YytqNTJzKy8zbUJzRCtQaS9hbHR1WFhHSFdzdSszeG1PZ2hpTXZJV0FjbExt?=
 =?utf-8?B?a1JIT3kvOTFQeGN2cDhmMm5Rak1FeEJ5S1ZxNVJNQURkMTJrd0xUSjVydm51?=
 =?utf-8?B?MTBBM1BLL1BmZUFxRmhqYmhDODBtZFE0WkNnVFExZVpsRFdTY1p4NUliVEt1?=
 =?utf-8?B?WnNmZGZYbTR3RWo2ZDVnb1BHOHdKR0FFNDFVSm9ybVZFYm1xRkEraHQ0YjRL?=
 =?utf-8?B?LzRsTGhub0o0SnQvN3hGanYzTmN0T2wvaHZHNWNpbzZGTDRFS04zS2V2VWlw?=
 =?utf-8?B?Z0hLSjJjNDJXa1dvT3ZrcGdlak5EaTlsU3lmSFFHU0dWM2x6cHdDdTZXMWVp?=
 =?utf-8?B?dWtBOTJ3c094bmpvVmhUY0JXWmdSWFNZYkRXbkFpNjFmQWR1UXpvRE9jUDJa?=
 =?utf-8?B?SVY0eW1nSE9QYlRLTUFoWHVEQ0FvQmVzMHVuT0VGejZNNjQ0SlQ4K0duanRV?=
 =?utf-8?B?aDgzdTZUa044K3dETjJ2aXAvN20rS094cXVBc21STGN4bmt4WkpLTEg5Ukho?=
 =?utf-8?B?R1F4Mnk3cU9oU1dLRXdZaWF4WmVMemRmcnhYQ1hhUzFFeEtiUEErNnU2WVZS?=
 =?utf-8?B?QjdGa3o3eXRJZTVGQnltZ3ppT3A2dUZTb3BseElGVTVrTzJmMUloL3BkL3Jt?=
 =?utf-8?B?UStJcENUdHp3QS9hN2hXNW1Oc2VOZUkxT2tETEMyL1VQQ1VUWGQ4TWpuUEFs?=
 =?utf-8?B?WWdSMWdYd24zdHVxNTlqaEp6ZjJNVi9KekpkNjRseERSbkhtVUFTb280eHhQ?=
 =?utf-8?B?WldJL1hQb1VCdThoSHFJUUkxcm8zQUhST056RkpLMmtWZTlUNmZvcllvRkw0?=
 =?utf-8?B?V2RJMnpvUWJDK2EwOTFWRG10alllbm0zV3ZuZFZaMkgzS3ZJNXozNHZFaFJt?=
 =?utf-8?B?YUVvRWdmSjRGMTdXK1BOMWYwQytZV1p2VFFWeWR4S2ZkU0hhSWlYUTNSWk9v?=
 =?utf-8?B?UWcxenFTYmtwU05rbGFSN210Y0FDSUlsQk9IYVUzdTVHdURTUjM3amtuamp6?=
 =?utf-8?B?NjNVWXU1VVdpeXd3UEJHOUI0NlZQa0ZqZU5RaE9URjRIaTl0YVhPSnJMUldw?=
 =?utf-8?B?MzE0Wm9LQ3ZIOFFsZWFwVnBEa2FKalpvbmd5T2xtLzRYdmk4ME0rbE8rRW9F?=
 =?utf-8?B?Q3NxS1lkRmlnWjJNcTdUOHc4eDZZUnNQNTRIYXd1VFNaNVZTVjdnU1BBVXNZ?=
 =?utf-8?B?blJRZ3oyVXNxOWVCWk9LbGx3U1lzYkdXZDhEQnhZUXdjdXB3blVoZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eca2e4-86a4-41c2-39a8-08de7303052f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:43:14.5376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBrh2FROaHGwm84ANbUFWuTNl6vabs8ORTwnP4nCVsz5pfiR+iAd3iId8erYNsF4DNTiCVIZaeOr85z3SEUWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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


On 23-Feb-26 10:59 PM, Lin, Shuicheng wrote:
> On Mon, Feb 23, 2026 1:28 AM Varun Gupta wrote:
>> When check_bo_args_are_sane() validation fails, jump to the new free_vmas
>> cleanup label to properly free the allocated resources.
>> This ensures proper cleanup in this error path.
>>
>> Fixes: dff547e137be ("drm/xe/uapi: Extend the madvise functionality to
>> support foreign pagemap placement for svm")
> Ths Fixes tag is not right. It should be:
> 293032eec4ba ("drm/xe/bo: Update atomic_access attribute on madvise")
> The issue is introduced by this patch.


Thanks for catching this incorrect tag, will send v3 with correct tag.

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>> v2:
>>   - Added Fixes tag and CC stable (Matt Brost)
>> ---
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 52147f5eaaa0..0c92fed6c6a6 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -453,7 +453,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   						    madvise_range.num_vmas,
>>   						    args->atomic.val)) {
>>   				err = -EINVAL;
>> -				goto madv_fini;
>> +				goto free_vmas;
>>   			}
>>   		}
>>
>> @@ -490,6 +490,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>> void *data, struct drm_file *fil
>>   err_fini:
>>   	if (madvise_range.has_bo_vmas)
>>   		drm_exec_fini(&exec);
>> +free_vmas:
>>   	kfree(madvise_range.vmas);
>>   	madvise_range.vmas = NULL;
> Nit: This set NULL could be skipped since it is a local parameter.


While the NULL assignment to the local variable isn't strictly required,
I have retained it to maintain consistency with existing cleanup 
patterns in the
driver and to ensure the code remains robust against future refactoring

Thanks,
Varun

> With the Fixes tag corrected,
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>
>>   madv_fini:
>> --
>> 2.43.0
