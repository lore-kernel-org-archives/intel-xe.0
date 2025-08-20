Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19109CA0EF8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 22:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291C10E29A;
	Wed, 20 Aug 2025 22:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBDc8xHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B9510E29A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 22:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755728720; x=1787264720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Naj8cVVtqIvjsQrr4Fp0VlYxgH2ENB3t5wzOQPJk0hs=;
 b=VBDc8xHNZVS8ZsbUgN3hxQ2h7ZhiWgro5PHkIqCXItM1GL9qLWMd2Up6
 sZu3+wyE0ZqaxVKlSpRawxUsejLZ0gpY9GEoQVL+yNHOVzassmXgrM47r
 k65yhEtw3Z3PP0McLtaaNYs2CiY3udKGxcOz6I3KnaTuVnaCqPoY0/6+/
 yjdyrRUYAXV/sMRvScn70rYPAwLPq2DBmLYYa+I/UxgKkkyt8TgpwM+C5
 rPvZgAbjfwBgUtiqayoB680JIXmd+65SuZgo43emyIfiPZ7r80cwdfses
 +02F/LiWYZE8JYynXdG2lzh9R7jkrmfs3LRYCzMQm4wXFSWA1KWmOD+a9 A==;
X-CSE-ConnectionGUID: GDTdbKt+RP2lrPDkJ6/5Xg==
X-CSE-MsgGUID: 1onHIAApQ2a+cFPmGTsnJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69452537"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69452537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:25:19 -0700
X-CSE-ConnectionGUID: wTR4ne90RzO3WPQyCYo3jA==
X-CSE-MsgGUID: ZlavsGKjR4CYcEs71cb1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172505642"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 15:25:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:25:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 15:25:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 15:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7mJwjxSEBRiyZhXpDUlxet8z7d2jlgB1heKoxlBxMt92i257VaOfdTQUt0eR/ETMG3K/RxXWlnWNVIG4W313FkxtUW19NTAgAFuV8+l6ugmaWuqpc2asXmcutsMuuLo+25s7++GSHFDOlWd2pLCpSJAeCbFPJ8epGwDaNV/eed8QV8tkIIRaes5g2wS9cK5XrvyIFZH1i5VhpNHUAayGWf3phjDrfFSmn6yk08o52aqwSiB2KMZBlF3yhgM+6xBD7Mc031M6DCQ+/+SgmBYwhm5EDOqGs/7N2QwY2uZwesqv7eIcfSON8G+E1oR8ZOU1iA5zLkJy0HFHIdpMZuLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4XUPEIaxavYmVy0utfCA7ITtjalNsoxSIOzXuhDri0=;
 b=pum7yOWRAI1FuDD4fL1sDTEtRSYc/sN/23iL4nQrFFTBSXeVZesNUyCHhPCwHn0YRxeVMmC/VVMkXMwM/vpq6BBrPLiiirYM9R823KLS0m+J4x4J88M1TbRUbcFL5EgVVDKRV8YH/ePTtHKSP1fr2i0Xmwah6COZNtdEidzTBVl6l4LIL4SCP+ouFKntkKWV8rjcb+14Mau+jFQ9+96JmEkywcGgemG8HmRj8N26IZTc+eo1SFbnoCyQatEVUmz3jkAHxDitv7pldLwT4j3G0d3rdDvSxEMcwd8yw1kN5C6k9M51rc12fWmcuhGCPlrHSOEJJZaKaoCsrFz9P+tGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 22:25:16 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9031.021; Wed, 20 Aug 2025
 22:25:16 +0000
Message-ID: <d83f4225-b3fc-4bae-90cc-79a308780342@intel.com>
Date: Wed, 20 Aug 2025 15:25:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/gt: Introduce runtime suspend/resume
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
References: <20250819113505.1592229-1-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250819113505.1592229-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: d553c36e-67de-41a2-d2fe-08dde0387039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mms2UGxKQ05JNUNQblVEWWUrWVAvNndmUTF5ZitlWm9teTFCUTA3NlBFb0Rx?=
 =?utf-8?B?MTh5cE52YU9tRGlZbW00d0t3bGVTMFdoeUY1SFJIR1B5dWdLNWFUbzNpVGcw?=
 =?utf-8?B?YUx2YngrTnUvSHVvcThFM3ViSjczQ0tLZk5LWktxUVFjMDNteC9ObG1xd052?=
 =?utf-8?B?TGk4SHZGSkh1a1FVZDgxWWlZWitVYWd6WVpkQk1SbXFVdDBKNEk3MitBT0VT?=
 =?utf-8?B?dHBQOS8reHlhVWFjZGdXSS9GTjhWbkVaNmtPN21RTWFRNElGbWc0MlZ5cDk3?=
 =?utf-8?B?UFNTajlRNkRRekpkZkFUR1NBbTFjV0V6UTEyRi9ZckhEQ2VFS0l3S3lkaTRz?=
 =?utf-8?B?MjBJS1JyVndPRkRnTWViczVJbHAwZWMrRFl6VWRUVUhTRXpEU3B4SUZQUzVT?=
 =?utf-8?B?Unc0Rkovc2c3cVlEb2tuUzUrNWdhNG1tc3BiSmF2YW9ENXdVT2tWVHh2d2l3?=
 =?utf-8?B?V3c4SnBsNFM5NlpsWE1RRTQ4cDRqcHQ3Ry94VEhlK2lTRWV4bWVKT3VlQ1hY?=
 =?utf-8?B?VTY0eHlROGNBZGFHQitIaFp5SHZIUithWW04RUVSc0pic3Y5L1YxWHdYV2FQ?=
 =?utf-8?B?WVE2VG9aL3B2RUpMMjAzRmFUcEM5Ukk3aG13Q3N0WXdGZnd1V011blNzdDkw?=
 =?utf-8?B?MmZkMEJpWlc4dFRXOGttaGcyVldIQlNxbXVvZWhDandsZ053U2NhcC9ubW1O?=
 =?utf-8?B?dklLYW1HUnRHWmF6dUR5aTB3c3VwMW5FeG9NaUp5TFNRclNMKzhKWFdkVE5U?=
 =?utf-8?B?SlJjUWhQMjJjaVJJblppMGd4MEc4eHJRTEZ3OTNWclBKZ2JWdVBJY1RyR1FN?=
 =?utf-8?B?dzlLSW1KWDZ5VGc3amFwcHVtOGRXS2kzdGNSYThJOUxBV1BXbmtybW5OM1U3?=
 =?utf-8?B?Z2UrZGlLS0VuSDd6RThQejRWRVZRczdCZDRaZ3pHMEcwdU5IdWVBTkF4YzRN?=
 =?utf-8?B?YkJ1ZW9qb244ODA4cUh3bVV6Qm9ibnkrSDdIVGcwSU5xYTdOektSMjJzcThG?=
 =?utf-8?B?SHE0QUdIa0ljNXdPRWdiSlU2R1ZYNE05Zmd6Y0I0SEhsZDRacTBNMVNXb0JG?=
 =?utf-8?B?ZE1XZ3NXVmw0ZHE3UHorNTQvbC9uOFpLRDVKZWZvUXB4THdOUDh6dk1aMTNm?=
 =?utf-8?B?RzZ4ejYyUU9wcFBzY0dBYXJGY0VWcG51RUVPWkFiMmU5UjZmZVM2OXlNbkdH?=
 =?utf-8?B?SVptM1EvRVBmUkhvN3pKRndaMTJibVNja1lJMXh1b21jeWRZbmZNUVlWK05Q?=
 =?utf-8?B?RjdsUEp6cVY4K1FKUjV0UWVRWXNZUkdaYkk3WnZmZGFkRFVVTmF5dVFiUWl2?=
 =?utf-8?B?Rnd0TzFDZ1A3UXJkVTBsVlE0Y3pMU0ZBQzFXV3JmV2dINFFQVGtIQXRZcHMz?=
 =?utf-8?B?YUhCZkdKdDJRdFBwQUZqT1FWbWw1QU9VTU9XYkhUd2RtU3BJNEh6Q01wR2ZR?=
 =?utf-8?B?bVhlMVNEdTltNFpmc1RlUE16TllyMmNJekx4MG5IR1QzR1VQRUFKNVNwZVlu?=
 =?utf-8?B?b1QyK0tFYUJpM01CdWRjUnFLbDVFeFpzVFVoS3FpMHBVL0dHcFFleHIwc2Np?=
 =?utf-8?B?dnV1T20vUU9SWTAzRVVXNnlWMHVYUkQycmVNNVlHcytRNDh4Yk9SVGVaNnI1?=
 =?utf-8?B?SVBnUzllN2dtY2FCRnZsblJvZE95VkZHVXZqRGF3L0lzTUhHUTkvaFdDQTBt?=
 =?utf-8?B?OWxZYnRtbUI3TzBKeWV5UVB2Y0NIaGNVbGtCaFFDVXJURmMwTFkrLy9zbUd2?=
 =?utf-8?B?NmlsKzVwbjZEMDc5VTZBMSt4WkNFV3EyYzVOTXpkVXA3elF3ZzNmaktpZzE3?=
 =?utf-8?B?QnRaaFowM2JOc01aaE1oeHZlOGJRanRPK3RFVjQyNkZGUXBmNk1WenVZOWFl?=
 =?utf-8?B?akVIZktOTklSWndleFFHcDNEaXV0SGFqc0YvMVBoNzNSZndXY3hROXJhRGpT?=
 =?utf-8?Q?WZNjN+aIs5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGNDSElvVm9DNTE4UnlIZ2cvc2s5cGlJUUM3TmlyK3BOaW5Ld3JEQXFTNmFZ?=
 =?utf-8?B?aWFrMDU0U2x0NkRoMmwzbUVUQ0Y1OVVzQ2d0dFE4Vlp4aDZWbi8zWGtQbnZM?=
 =?utf-8?B?MTVLQnNrRXpXcUYvSWdPL2Y3eGQzV0cranlDTm1yeXJUUGNBN1llVW91UDkv?=
 =?utf-8?B?S2RPNFZIMFBmeER0RkIvQ0ZzYk5qQjgrZUNFTjVKZDhPZmRmQWJKbzRZMUQr?=
 =?utf-8?B?enEwOFR2dGV0T0lhVnpYTjdCQXdEM0VXTWFNd2wyQUJIWHI2OEFXZ1dIN3Bj?=
 =?utf-8?B?eDE4MXdiM1dOK25VdEJNS1hNY1ErL3gxUFdxQVVjOHZNVzZFd2dhb1ZiZFJq?=
 =?utf-8?B?WFVqWEhVamdGek96VmhhUlU0TjV0WnR5YlA5UzQ0K0FoSy94Z1FNRGhrWXdY?=
 =?utf-8?B?TlR0bkp4dk9XQUZVMkN2RWRrS0k2K3QzS1UxdzhoRlAvTlJXcGVlaElJMTRp?=
 =?utf-8?B?NzVrSG9QeDJxR0FRYjFaRExyVU12WXVhN2pHbDh1MDBoWGFNWkJoaFFRWkRU?=
 =?utf-8?B?UXlKbk13ajhGS2x1NWp0SWxyRXFuZkd6T2UxVmNDb1Nac2ZvRnB6bnd1R0NH?=
 =?utf-8?B?R21JRlYrbElZNE1sZUJ5Rzd0aVIrdkkrZnJQWDFlaGp2S1I0NGU2KzZFQ0JB?=
 =?utf-8?B?OFVvYTBnQnlLQ1JSaXN1UnBpK2xwVnZzMVhaVC9HejlpVGVlWGhraUphK1BP?=
 =?utf-8?B?NzU1UE9TanUybWYwbzdhVTJkZzJ3cFpyNm1SQUYzWDB0dFY1eElLanZ1MEFH?=
 =?utf-8?B?ZEI0bm5EOWJXUktob1U3VzFmaGFMcWE0MVdqL0dvYzJuWEpWbEpRTkxkekdQ?=
 =?utf-8?B?TDkxNXJlZDMrMWtYc2pyN0FhUUd3WE0wVWlhT3JyMWd2cXJKZTc3b01VWGkw?=
 =?utf-8?B?QjNZSFl3K0xvTzA4WHQzaUJzeGpkKzZYQ3VPczJEbVdmWXZQNEh4KzNSNXMx?=
 =?utf-8?B?d05QMUc3MGNGWldHTjlXbnQ5V1FEaXJYdnlONXpZV1lWQ0VIMzlhTmRQZXNz?=
 =?utf-8?B?TUdzUE9BSUQySEx4RVJLajY0SFl2MXI5eHZqdXB2T3VSNEFCeFR6bWlvMkVK?=
 =?utf-8?B?T05QcXp3cjNnWnQ3aGpONlh5L3NaZlJpUkFSSUhCNlV3TFh0bHhUUzRsb0VQ?=
 =?utf-8?B?ZUdOOE1GVFBhUnIrQnJ2d2YyVHMzQ09aZkxIVnN2dC81Rk1HQ2VqUkdXSTF1?=
 =?utf-8?B?L3VaeFpkOGJia0ZHTDcyWXJGUU5VWlk3SDc4azlHdm5IdUtPcmpIWVcvR09U?=
 =?utf-8?B?M2kxTmNMYmVZdUxIM1pTd1VHOFByeTEwV0JuR0duWUh5RW4xdDFmQ2NOMll2?=
 =?utf-8?B?RVFNcmZabEg5N0VZME9BbUxDWE1xZHRNQjc0RmhkQ2dOMGFoLzcweDVpWXFU?=
 =?utf-8?B?Q2hSenY2ajdIMFVQeUZLSEZJYUp3VFVZanllc2k0RUdlMjh0a0FmWm9kcCta?=
 =?utf-8?B?elRvcGNhMjJIMGFqTExjUWRkS2pha3J5YUtKc2Y2Z3B6N2tCRVNNbTk5Q3Fs?=
 =?utf-8?B?ZHRjTkZTTXU0TXZxQzBLUU1pc3R0dDExUVN5SzJHOGxVVnM4NGV1S01XOG9J?=
 =?utf-8?B?SzFxN3JsOHE3SmF0ZmdzNmxqZ2ZRM2hIeVFGeTJYVnl5dENGWFpnS2IzdVRZ?=
 =?utf-8?B?MkNQRmovM0xrVzFzTFRsTDNXNFpYU3RoYjhkMVZhYmdodFJnMkprOWdHU2Vm?=
 =?utf-8?B?bGFKQ0VZVnJBRlV6Rzc2TVlqZ29QYnVNUlVBUEhSemVTa0Q0WHJwcXFxeGhE?=
 =?utf-8?B?c3RCL3hBVXpvK0lhaUc2R0haUlNEd2cvYktmVitSaDU2aWU0djYvaE1hM1pS?=
 =?utf-8?B?MndiN0lkYW1aWWxPdXJHVnExU0FkOUFkTHcrNWNZRnpBOXZCS0d5SittRU5R?=
 =?utf-8?B?UmVCVG1xdDVtb3ZYZGpxRmd2bmFKdnVod3lWUWVyWFVTbjQ1ZkJNRm9NVzlh?=
 =?utf-8?B?M0tNSnZ4dzdqUDhscVlDMmp4S1ZZOWNPWUtaL24ySkVvRThXOFRVcHNVMmxZ?=
 =?utf-8?B?UkQ3cTViT1Ntbmc4S3EzNUVXbVdNMzFpS3BrUU9HMzVWTEUxMHNya3A3eGVU?=
 =?utf-8?B?VFI2bFFTZ0thVFJiSncxbzFBSlVWdXp6VWVaeVdnaE91S2lNYmxzUWZGaTJk?=
 =?utf-8?B?UkxVZU9ESE93ZDdPbm9WWHlOSnpZb3RtSFhzcHZhOG1TL0RleUIwd1FuWHox?=
 =?utf-8?Q?qoHcw18TIOXK5SdQqKjaaIQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d553c36e-67de-41a2-d2fe-08dde0387039
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 22:25:16.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p23FG+sWVyrMcz2nWrULx/OFuViS90m6i77VU3+WHJIer7ks8ea5RkwQJoa5/ZkycZRaoaDQI9+yHUs803rdGfaVb1CxzPoQ/w3Y7HskUEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
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



On 8/19/2025 4:35 AM, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't have
> to perform full gt re-initialization. Introduce runtime helpers for gt
> which greatly reduces suspend/resume delay.
>
> Originally-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c     | 50 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c    | 16 +++++++++++
>   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>   drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++---
>   drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>   drivers/gpu/drm/xe/xe_pm.c     |  4 +--
>   drivers/gpu/drm/xe/xe_uc.c     | 19 +++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>   9 files changed, 103 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a3397f04abcc..19919760da00 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -943,6 +943,32 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	return err;
>   }
>   
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +	xe_gt_sanitize(gt);

This call to xe_gt_sanitize is a bit confusing. Historically on i915 the 
gt_sanitize call implied a full reset of the GT state, which is 
something we don't want to do during runtime suspend/resume (but we do 
want during full D3 cold suspend). However, the current Xe 
implementation of xe_gt_sanitize only sets GuC submission to disabled.
To be safe, I would suggest dropping this xe_gt_sanitize call from here 
and set the GuC submission state to disabled from within the 
xe_guc_pause path (which you're already doing). That way if more state 
cleaning is added to gt_sanitize it won't impact this code. I'd argue we 
should probably get completely rid of xe_gt_sanitize and replace it with 
a GuC submission specific function if it is the only thing it touches, 
but that's outside the scope of your change.

> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_msg;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>   void xe_gt_shutdown(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> @@ -1002,6 +1028,30 @@ int xe_gt_resume(struct xe_gt *gt)
>   	return err;
>   }
>   
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_msg;
> +
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>   				     enum xe_engine_class class,
>   				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..3f793230e78a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -51,6 +51,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 433abc787f7b..f4f55027dd7a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1618,6 +1618,22 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	}
>   }
>   
> +void xe_guc_pause(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	xe_guc_ct_stop(&guc->ct);
> +	xe_guc_ct_disable(&guc->ct);

Note that xe_guc_ct_stop and xe_guc_ct_disable do more or less the same 
thing, with the main difference being that the _stop() discards any 
pending messages, while the _disable() throws an error about them.
We hold an rpm ref when there are pending messages, so if we're rpm 
suspending there should be no pending messages; if there are any, that's 
a bug and we want to catch the issue and not just ignore it. Therefore, 
for the rpm suspend call we shouldn't call xe_guc_ct_stop. IMO it's 
probably also worth renaming this function to xe_guc_runtime_suspend, 
because there might be other scenarios where we do want to discard 
pending messages so we don't want this to be a too generic function.

> +	guc->submission_state.enabled = false;

Should probably set this before xe_guc_ct_disable (that way it's also 
symmetrical with the resume path)

> +}
> +
> +void xe_guc_unpause(struct xe_guc *guc)
> +{
> +	guc_enable_irq(guc);
> +	xe_guc_ct_state_enable(&guc->ct);
> +	guc->submission_state.enabled = true;
> +	xe_guc_submit_unpause(guc);
> +}
> +
>   void xe_guc_stop(struct xe_guc *guc)
>   {
>   	xe_guc_ct_stop(&guc->ct);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..6385159d1711 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -51,6 +51,8 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> +void xe_guc_pause(struct xe_guc *guc);
> +void xe_guc_unpause(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..283d7631a940 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -465,6 +465,14 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>   		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>   }
>   
> +void xe_guc_ct_state_enable(struct xe_guc_ct *ct)

Given that this is more or less the opposite of xe_guc_ct_disable, IMO 
it'd be clearer to name this one xe_guc_ct_enable and rename the 
existing xe_guc_ct_enable to something else (xe_guc_ct_register ?)

Note that I've only looked this from a GuC POV, not from a full GT 
perspective.

Daniele

> +{
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	if (ct_needs_safe_mode(ct))
> +		ct_enter_safe_mode(ct);
> +}
> +
>   int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
> @@ -489,14 +497,11 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	if (err)
>   		goto err_out;
>   
> -	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +	xe_guc_ct_state_enable(ct);
>   
>   	smp_mb();
>   	wake_up_all(&ct->wq);
>   
> -	if (ct_needs_safe_mode(ct))
> -		ct_enter_safe_mode(ct);
> -
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   	/*
>   	 * The CT has now been reset so the dumper can be re-armed
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..34ad8c31c4ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> +void xe_guc_ct_state_enable(struct xe_guc_ct *ct);
>   
>   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
>   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51ed7270994a..9a306b5fbdaa 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -495,7 +495,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>   		if (err)
>   			goto out_resume;
>   	}
> @@ -558,7 +558,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>   
>   	xe_display_pm_runtime_resume(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..ac2910ce027d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
>   #include "xe_uc_fw.h"
> @@ -301,6 +302,24 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_pause(&uc->guc);
> +}
> +
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_unpause(&uc->guc);
> +}
> +
>   /**
>    * xe_uc_declare_wedged() - Declare UC wedged
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
>   void xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);

