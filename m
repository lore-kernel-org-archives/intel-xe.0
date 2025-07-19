Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686FC83F27
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 06:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89F10E1CA;
	Sat, 19 Jul 2025 06:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXSyS0sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EED10E1CA
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752906073; x=1784442073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rl0I32Nmya8C/viUmozqci/SHz958fHLneTw1MiW4MU=;
 b=MXSyS0syBloa7FdSm6rjZ2Mw3Y2D6HMMqwzzhxMgyz7zsLpL2grPcI8h
 dk4rrYqJwGwJc2mDacPngFdLfEGy8xCin371cWRDbPRRcGNxmJEqqMYfr
 thyd4vmxV/gxPSDOLDC06iGKz+883ovbWy41ivryHPlxC3CHJCRuEidfy
 rthPHRoY2mErxdLjtN696VKBxT93XcLYlH7coicuzy5VzlIs0ariz7DT4
 /y2wXeAK/Bn7qvFdDOUCRJNSyKa57/US2uj7t41wLzDy9qyN5gqeo35yL
 buNtA9ZIF25h192YY4xQT0VKVaraQ5KEog4MhMhwtRWm5qDy6xlszKy/H w==;
X-CSE-ConnectionGUID: vmwmZv0GQ0qpYbQoojYrxg==
X-CSE-MsgGUID: 7tvGhSyxSIa7tRcNA2pc1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="59008470"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="59008470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 23:21:12 -0700
X-CSE-ConnectionGUID: 5RQvcc7CS728T82E7/ixgA==
X-CSE-MsgGUID: pnqjt5r4Rhew2z9VuDqz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158836722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 23:21:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 23:21:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 23:21:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 18 Jul 2025 23:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZScUNg8Eg+4WSY3mIOssc4/6eKIR7m3Sk11gXUJ+rSyMWmXhR094fnteqlvtys7Li6iykMhrn9ysNGBkD2/un6UCou48/z/MlfnO+t7Hm8AwyJfx0tXed5gmLyH+2Fts8owEas3Z+8so1rEpiLAgVGsCDedZj5K9TAC336Se/LzDRDiaO9eUBx4n+7pue8/gTcAHo8GohPaPCThKuRzgiOUYapQqMgBo2+HHf4LwQEAAVwysg+ewYjgrClV+SJc69bDApO+HPAototg3dW5+JiApQ8xnDcZO4k5CpC41rctyGJzd9SmCT04R8gVA7A3YowtyTOsfsr1xQXtTfbjRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgI3abYQFaqeOEvPlTo4owOHTLUYv5lkFNS3RBT5UX4=;
 b=IMMieTXQ+/umLJTmlBC5A0ER5CYgvGnMNtMh+V0pGQLm565sIsyti6yMepnR/xWYWnvU45h77M8ssX5dAIQEsiOigVYSSXoHbbKCrgWpESYUAlxLaFMOzq7YpWpPd0yz+9Xi2gxH1DnhMQVLGD5T+wbImVe948aK9qoD6A6CNYqxnw82hTlfIqA99lFwqbxxLg94/OzmUMTzb43pTP8McRGALjYkUTm1ZPjj1gsgh1MSo0U7qHBQYyJS6tq4QFadL04BsaViYC4VOIqaw3gN706zbNB84hB524epMNxMMFgZyZJY7clz+KI0DvniXZW//gRlYjk9KR0I9GSJx+gTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.41; Sat, 19 Jul
 2025 06:21:09 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%3]) with mapi id 15.20.8943.027; Sat, 19 Jul 2025
 06:21:09 +0000
Message-ID: <681e8889-959b-4aa1-a15f-59378edb2966@intel.com>
Date: Sat, 19 Jul 2025 08:21:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] drm/xe/vf: Rebase exec queue parallel commands
 during migration recovery
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-10-tomasz.lis@intel.com>
 <w73h3uqwdrobsx2pveedl4qzp3idwr62ochkrwljzhvhwbpajk@2l2b2coedvyr>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <w73h3uqwdrobsx2pveedl4qzp3idwr62ochkrwljzhvhwbpajk@2l2b2coedvyr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0052.eurprd03.prod.outlook.com
 (2603:10a6:803:50::23) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3273824b-4067-46c9-a4af-08ddc68c733d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTJyRlRXZG1LMUxhUS9jNm43QUhNcUJPMkxmVVVuWXlVY3NiczYydzMwb3JR?=
 =?utf-8?B?Q0dndGx5K0lZcml0ZXEzb2NYbVN4TUdsUWw4elN2L1pvTlR0UjkzMWRmRENS?=
 =?utf-8?B?dHpHMWhidjhZWGxtRE9WYWE2MitKMFVvSmRCUkVuNGh5dksyakovMi9LZE9B?=
 =?utf-8?B?VWxNRzZOdnFteEdvdTk4d2g5VUlJTHhWTHJ0dFF3RFppWkpCNG1kdjRibFQ3?=
 =?utf-8?B?d3hzR1ZkSVVXNmRkdVgrOSsvMW03Sm1zM0dldnR3djhJdGtGaUR6eVR3VCt4?=
 =?utf-8?B?VzFlckt2akhFQUlNcUJxSWhHTWFKYmpvZFVEeEt5ZkNnVFhtY2RySXVNc2dX?=
 =?utf-8?B?bHV0bmw0QUtrSm9UZ1poOUFVa3l0N252R25aMnRDS211K3FHZWcyK3JLR3A5?=
 =?utf-8?B?TGxud0ZWWThQemNDeWVqQXJpRTE1bUltWXFuUjI5WVpNaTRSeTdGNWY5SjN4?=
 =?utf-8?B?OExqQmwzaHZGVW1IRUhCK3dmVEgrWmRwTFFPWGFyaHY1bHA1L0RkQ3NMTjgw?=
 =?utf-8?B?TUNBWUpKYjZBdXczWU5OWm1VUGlxMzYvOGlKbVVkMkFUa3ZxZTV3UVhpY2hx?=
 =?utf-8?B?T3ByelNNWEJsdVplTmEyODhzcTVLcjMyckYyaUovVEdRelRBYVZKWmlOQXlX?=
 =?utf-8?B?WUtXc1d0MHJFZi9lKzlEU0twTElIZGMwa1BHMHlmazFyRU5oZmVVY2UyUDlD?=
 =?utf-8?B?djV4SjhKUU9TM1oyeFVYRlV3M0RxV2JwTVNidndabDU3cW4zY05ma2FiSHN6?=
 =?utf-8?B?Y2w1RmJ4VmhERmRMbFAzZi96Rko3cVg5UktidEVDb3kvUi9USjlEVFcxUFZO?=
 =?utf-8?B?bTdSeThaVkt5WjJicXczWkRndllTTWk5dkt4WGZQU2RVYXZxMWNmRHhvYmdY?=
 =?utf-8?B?bCtTdzU5Mi8ra3pUQ0JZUHRaWGYwcG9lMGhzZzcrTkdwaFB3NUtCUXRBMUVy?=
 =?utf-8?B?cGNOOUFuQlltUHJ3aWZmOTArZjRpNllCcnlPbHU0a2pEUlBxdis0RGJweXRT?=
 =?utf-8?B?N1cyeTV0NmFackFxT0FQTXJoSFMwUmdRVVFEb1p2eTNrNVBpUW5XZlhWM0w2?=
 =?utf-8?B?Tmx1ajRzY2dHeU5kMkJhYTA2ekRJOXlxbzQvL2tnYU13dHRXMlUybHFySllE?=
 =?utf-8?B?b2ZLVE1yUWJjY3RjYS9zSkFYNHNBUzIrNDRONUlhTHBZVU1kTlVKK3QvT3JM?=
 =?utf-8?B?NzF3cWp6UEYyWk15ZXZvSlFvdmVScU1CMGNsaXhhVUR2QlEyTzB5QkE1d1R2?=
 =?utf-8?B?RFRwNkZ2c1FjWFJ3bVBCNHhabno5RmV0N3UxWnpXWWRVYUZPMXpXMTRKbXBO?=
 =?utf-8?B?Skd5VnlIYzk5R09LWkY3clp3NXc3bWE5blR1QjJ1NlI0Z2ZTdHRjdSsrd0Nw?=
 =?utf-8?B?R3hPa2I3TE1LVGZBRWZlOGFqelZnYjBYRFpJR04xUHpQNEhXOUdsM25zbnZu?=
 =?utf-8?B?NU5uUnF6dTVTK1BFYnFqNG0wS1FVcFNZdVJuN3dYODJQbnpwdy9BSlR2Y2Q1?=
 =?utf-8?B?dEF2cjd0bUJScUh5RXJmdSt6aUlISmFjOXpvZWYwa3FzTXpzRUxtSzNPMzFp?=
 =?utf-8?B?cTBibU9paWN6WjM1K0Z0bTlGa0F1TEZ4MlVsdG5ybjl1Z1h2dW5Kb1kvQVFl?=
 =?utf-8?B?Zk8rS2Y5cU5XblI4V0tJaWhoQVNYaXc2RkVFcHpWakhaUDkxNWhlMnN0VTcx?=
 =?utf-8?B?M1A3bUZEMEdzRURNNjR1WWc1WE1Ba2FzSFJWcEtwRVp2SHNmdDJaVkJlQ2N5?=
 =?utf-8?B?NFVGT3ZvUFBjZnY0MjFRQXl5bGFBNGVPdU9Wajd1QmFHU1pqbkVZeU9FTnFR?=
 =?utf-8?B?bFU0Y3kwaXBZdHJNRnBmY1dSdHBDcUZsSXZyVnFGL2cyQzh5V2NUZERGMHFa?=
 =?utf-8?B?ZDhUUDltVjRhVW9SU2k5SWFGdTZMZkI2NlhlWXJwb05mdytQa1dZUnlGRnRG?=
 =?utf-8?Q?0YdzjjzYtRI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZPejhYdU04bTZUdm4rK3M3ZzJHV0NiaG5EemcyWjBjRmJqU2Vkd3VidVJM?=
 =?utf-8?B?c3BUTFRNbVJWcktSeGIxdDd4VGNPSGZqaFdzaVhrYU1OaUdubk82RlE0bFdU?=
 =?utf-8?B?d3RGMFF1L3F0Si90MlA3aVVNdzR2U1JCMjF1dUVRMUlaSlN3Y2JjRkdYN1dz?=
 =?utf-8?B?RkdLNzlBUjkwZWRWTnduRytkYjRPREJHZWhMUmZrY1R5dWF0SGo2MFRPNU13?=
 =?utf-8?B?U3V5NUxzWW16RWtSZGpuT1dFY0llQ1JnUVg2OXJTdVN2NDFCVTlqVjNRY0hn?=
 =?utf-8?B?T3FiOVlLSHJGNlZYZWhWY2tvSWN2bEZxblpPK29XVTdMMlJQRUgwZXRyOVBv?=
 =?utf-8?B?bVRHVjcyWk01Z2lkNTN1UTVHbHF3aUd6L256MVl1ZTE1V2dEM0hSVVZHYkVj?=
 =?utf-8?B?dHV3ZFlSbkRMT0dNODFKWUlmZWUwdnhtS1I3VlZiSjc3Y3BPQ0d3NXQ0VGhl?=
 =?utf-8?B?aytOeitCK1QxbVVsTmVBbGtJUUdrd25HVHhsRk9LWXUwd2lUNEtJZnR0R3o5?=
 =?utf-8?B?UzFKdkJ2eFJyZmJvUVduS2s4WENYSkJtZlZtL1JBOXoxazJhWlA2OTBEaVVN?=
 =?utf-8?B?WjNNRU1lU1hxNlg4M0tNZjJ3a1YyaXVrd2xUbnhYY3NQQjFjZ0EyKzVLZ2U1?=
 =?utf-8?B?VXpEeVNacFZxRFJLTzFLcXVPWVhNNERMQjRySGZpU0wrem9weXg4c0lKTk9Y?=
 =?utf-8?B?aDd1T3lrYyt5Q1MvVkR4QWZ0R0tXeW5mYWw5ZDNPYjVsMTJNbHpxZ1V2Tmw5?=
 =?utf-8?B?djBtNFdxMldIK3MxMVFzOFFubGFhY0NnK0pCOW5rYnpNUDhOWFc5eTdpbm5p?=
 =?utf-8?B?Uk5XSG04OHVSZ0JLRjRVbEsyb3NOUTl3aXY4Uk4wRFdZTjNRMDhBNGZjWEcz?=
 =?utf-8?B?Wm9HSSs0SmtVVjYxZnA2TDlpSlVTN3orRSs4Q3FTbHIzZGZDYkxLby96WjhV?=
 =?utf-8?B?c0dQS09FdnROMzRTT053SHJpSVpSWjBrVk5ub0Y4Z0xUTFEvQ0YzMUtSMFV6?=
 =?utf-8?B?UFpDdVp5SDRwNk9DNlJZNXdlQTRxQmk4OEdyWVZNNkVHbG5OWW5icVY4N3V1?=
 =?utf-8?B?NDNXZTlBUC9PY1ZTQ3ZTZWs3VmRoanRNUmZtZGdIenp1MWtkUjRKbzR5cmVn?=
 =?utf-8?B?Um5rRDdJa0tUdy9xUWQ2RTZqaE53ZVNES21mMXhWUGlMY1VnWVd2K1BYYXNB?=
 =?utf-8?B?TU9zRFBRaVUxVjhxVlZVZ1NXTVpQZ20yV05BQmwxWkZaSExlVm9hQWw0ZWQx?=
 =?utf-8?B?YkJLTEpXQ0lLM0EvWkR2QVlHY0hVS3hIcmdpNFpSUmM1QjdPbitMODIxZ3hP?=
 =?utf-8?B?cW9Kdyt2OW9oRW9KcWlrTFhsOXdzcU80Vkw0alF2a2RMZ09HRTZaUUpuNFhM?=
 =?utf-8?B?Q215OHQzSnhHc2lRK2FjYndKMytueFNUZ3BMMGVJUmhQOFlKcGZ2RDVkbGVr?=
 =?utf-8?B?NjN0WU9Da2VLVXVMTTlrd0VmN0gxcEJpR1FUcEtBV0FkWjVkZGJjZlZrbE1X?=
 =?utf-8?B?UlFIS0FGN2ZVcXdjWk01MkJXSXZQb1lCQ1k4Qk1jQzA5dFVFcUFhMEErV2hQ?=
 =?utf-8?B?MkZaNWErMVRIYWo3eElZYnVaUU9RZk1Mc3JCR1c0a3ExbWxWOVZydGhOK0tU?=
 =?utf-8?B?VEh5VnBKRXFlbUR3UE5XME0zUVlwdnBncUF2a3NRWE9Ua3QwdXBHRzUvd1Bi?=
 =?utf-8?B?bVM3ZlZzLzViY2RVOS91UnpDVjIyaE9TM1pXZllGUkRJSUFudnVEVVNycmxQ?=
 =?utf-8?B?YXh5VldsL1hkM0svWm1JcEY2dXBnNmFpOFJ0VndtZ1ZybGZVR1JrcmtWK2po?=
 =?utf-8?B?K0NSdnpyMklGcjFnV0tkUXFVdXVlQURic2JJVzYxY2VzanBrc1Vwd0JFNW11?=
 =?utf-8?B?eThLYkNpTWpWWkwydGtWS2tNM2FsN2xraDVRR3ZtRXBvU1dRUXFtQ2llWW9t?=
 =?utf-8?B?VnBtWVg3UnZaY0tRVUdzeWo2TG1LTS9xNUx3SUdoK29SdUxGU1ZHY3AzZ3Bo?=
 =?utf-8?B?bTc4dGh0VVJJNDJZalhGbFdreHlUdzBmempROVo3QWNCQ1dLeEdMTGx3Zktr?=
 =?utf-8?B?eHJ1WDNEZlZxTDlUS3pJVHJ0MU5UaTlkcHBtcTgyanpqdExEN3ZsYlZoZnNE?=
 =?utf-8?Q?1A1u47rDeoQswgGig+uPojjWq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3273824b-4067-46c9-a4af-08ddc68c733d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2025 06:21:09.2044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tRZUdLVK79ux5MFUIIkBmlHFFWIl3rKwXbTiVuEM3G6lqXpT1GaeOc/zwqV1BNkjuCb+pU9i0dPnK9tCSiKmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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


On 16.07.2025 16:27, Michał Winiarski wrote:
> On Fri, Jul 04, 2025 at 11:02:28PM +0200, Tomasz Lis wrote:
>> Parallel exec queues have an additional command streamer buffer which holds
>> a GGTT reference to data within context status. The GGTT references have to
>> be fixed after VF migration.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 37584a064574..96b94f7fcc31 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -693,6 +693,27 @@ static void wq_item_append(struct xe_exec_queue *q)
>>   	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>>   }
>>   
>> +static void wq_items_rebase(struct xe_exec_queue *q)
>> +{
>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
>> +	int i = q->guc->wqi_head;
>> +
>> +	/* the ring starts after a header struct */
>> +	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
>> +
>> +	while (i != q->guc->wqi_tail) {
>> +		u32 len_dw, val;
>> +
>> +		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) + 0, WQ_SIZE / sizeof(u32));
>> +		len_dw = FIELD_GET(WQ_LEN_MASK, val);
>> +		val = xe_lrc_descriptor(q->lrc[0]);
>> +		xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) + 1, WQ_SIZE / sizeof(u32), val);
>> +		i += len_dw * sizeof(u32);
>> +	}
> This type of constructs make me anxious, as it's relatively easy to turn
> it into infinite loop. Can we rewrite it as a for loop? Or at least
> something with a fixed number of iterations as a condition? (instead of
> != tail)
> Or at the very least - add some asserts...

I think I got distracted while implementing this, it's clearly 
unfinished. Or maybe the emit code looked differently when I implemented 
the fixups? Either way, I will prepare a correct implementation.

-Tomasz

> Thanks,
> -Michał
>
>> +}
>> +
>>   #define RESUME_PENDING	~0x0ull
>>   static void submit_exec_queue(struct xe_exec_queue *q)
>>   {
>> @@ -2511,7 +2532,10 @@ void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
>>   	unsigned long index;
>>   
>>   	mutex_lock(&guc->submission_state.lock);
>> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>   		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
>> +		if (xe_exec_queue_is_parallel(q))
>> +			wq_items_rebase(q);
>> +	}
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>> -- 
>> 2.25.1
>>
