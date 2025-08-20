Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2064CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 20:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C00310E28B;
	Wed, 20 Aug 2025 20:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBE+C6Iy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378A10E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755723161; x=1787259161;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=d85aYJLbHuzOyri9t6hwcIzcSVkYdCQVQPUSml2PZkI=;
 b=bBE+C6IyGvNzFmaKcTxuQzaZw5N8SMDayMNLsQ/ZkKzl6SejPljtfUjQ
 Mu30HWZIFhFPmta7sDGD3aS0iDi3LURcmQY2F8zN2hvGCYiZdkqFWlhdy
 GBUM1NxHNjRf6t6S8emb7gStrxX4qj2+ckM1rkmIVmfSO5Sdy6nR5oai9
 gr728UaNkwMvxUODiCKxxs/VUL0dA6WVO9dXLjSAt/t/5Z5L368wvJZNs
 genCjIs7HW7vD1Z9nPT2IIez/sp8BvEqUlo4AdjgVvZIjsyd3XxG1KqgX
 Fys10yTpHaPOxykRQ01wmkMHrXUqCFP84uXLmfHrVcxlRQNTESbrR/hBF w==;
X-CSE-ConnectionGUID: lBikcAlHTnem6gGYLvnFGA==
X-CSE-MsgGUID: Da62fFGASvS8dzf0FNaV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57860322"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57860322"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:52:38 -0700
X-CSE-ConnectionGUID: 0+fapQR7Q5G0HbXRZ4dW1w==
X-CSE-MsgGUID: KxwalJh8TUOATBJEZoD1dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167449086"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:52:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:52:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 13:52:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIgfvrnKeQSjzFEphtb5gaYaVtNBhaJInMpY7pyzyth2psrVh7bzGVyHPJWQMZ5sWXD+t1kuedIhfFezSjTVzAetmSCgfrhKvBurPn3kgOKfvZn1/IAj7MBe+rqwtNMCLd1j1nd8F4pLxDxBSpSgM+XAKtmqatsg7qbidJ8p8yVZXDsC4afTH465s9ZJMoxPKiqhah23oiAL9Z2t0/wGcrPaFsGNiRv67HwQsGQBL1LDMcYKuwAlug4GTmhJ3AQEyZy1uBjgvYe1pwnwTUPSrmmAQVaMT69eScAma2+/rZB/WeAfYFo73CcYhjVu+Yl4SMSvqORmnn1Ojfyrd68i+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cHZDinMrIu2e4oxjWU/KcC0zmsahT2C3f2sb4PKqJw=;
 b=Xj31AAhDUgQpCFAMaFfCbNur0kXdE9zT7foWQPqurJGvTRLEV+5PrBlH6fz7wcrpxlgcPbsfczNWSLNSe34+s2hCrbK9AYIXAfLrjHYGES3FoShwh7rBErTvbklptdBePV/mi1WZG9pBbr+Vbd81xMMhcs50j2j3JjZYLeJhB9nQZnx+80nE8paXntlx80pPrWws4KZjuyVDizS9XnB77igPA7rgnVVEnwdBkYsN1mZyGsEsL93mBXdQxo2v2aUc9pcyeLbcyBfI6PkOjvWDsPprcI/Vabj25W+XitcPvWkG4ZBw6A8cGcCPDIpR9SHUjuaNGNuRZcY9bonkN9MFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 20:52:32 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 20:52:32 +0000
Message-ID: <db12b7b9-d126-488d-a768-548587e6a1ae@intel.com>
Date: Wed, 20 Aug 2025 16:52:29 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 2/6] drm/xe/guc: Add LFD related abi definitions
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-3-zhanjun.dong@intel.com>
 <662c3ac0-0fef-4c66-9827-9b6cd20b2d4d@intel.com>
Content-Language: en-US
In-Reply-To: <662c3ac0-0fef-4c66-9827-9b6cd20b2d4d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:303:8c::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 010c2ab6-5d2b-43b2-51f8-08dde02b7bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHB1SllZZnBQUjhyQ1RWM0RvOXZqdVBQenNYTzhZZWRKVng4RnRIWXM4OGQx?=
 =?utf-8?B?azl5SVNYVzNSOHBkdG8yUmY1RS9UKytValJEUy9tVjU3dkhubW1SS3p0UmNx?=
 =?utf-8?B?TXNLOU1RMGVyRlRlSFpveXh1Ung0SFpPVTQ3a1RuaVlzaDZhaEdLdHErTytw?=
 =?utf-8?B?UW1QSENXRGhRaXd2MmlENi9GbEM2am1ORm9EL2dtRk9IUW9ReXBIMkk1OWlZ?=
 =?utf-8?B?UjFGOW1yTDJmUWVCSTRTUCtQN3ZNT3E3Zm9jYXE2TlhkdWpFSU9iYWFYdE9L?=
 =?utf-8?B?di9MU08xNEhlVGtjZUw2NUZmVVZBdkI1UWsrRS8xbjd4a0FFZS83bVFvTHhi?=
 =?utf-8?B?QnFGZGVRTjJSZUlLdWRMUnp1RU1OQlRKc1ArbUpqUTdTODVFbnA2YzZMMytp?=
 =?utf-8?B?ZUJFQnJ1RlVNdHRvbGJmdHdrTU9jTTR6WHllcFlsTU02RTgrZVNVaE9GMTFu?=
 =?utf-8?B?amJ2cXJqVlFsRHMrVXNScWtsaFcvdG4wTVpkWUhWc2U4K3Q4bklsZ3VuVUdi?=
 =?utf-8?B?RHp6V1F1ZForNENsMHJTNG9kRGN6RXZzZXBxenZFUXgxSHREZzVKb2JOK0Vs?=
 =?utf-8?B?Qmx0eDI3Qng5bzRiTy9oejd0SGhuZWVzUzgxc2hyY1dTMkFWZ1h3OFVJKzFY?=
 =?utf-8?B?bVNvTk10VGVETXdKcDRUOXJJM0FSdVJOL0d3Lzh3OCtxNUMyMXhNSkJmdTcz?=
 =?utf-8?B?R1ZSdzY4VnFaZGo2TEVlOTBYVmlvUWc0WmNoZW9YL3pQbWI1QzlmYngvVjJD?=
 =?utf-8?B?ejkzUkVTc3FWb3pTT2dSK3JuM3FLWnlRMnlDeGMrMHVvYXFUTEYwWmdjaXR6?=
 =?utf-8?B?NElxQ2JNRGRHN3pKMk5GakVlUTFFamFSNGRjYVRNM3Z2a2Y2RFhrc2FQSUY3?=
 =?utf-8?B?SkJUbTZZcFBEdUFwZjNnV2VsMlExL2kzU21iWDJSbUdTUTFyZWhwNnpGVzBp?=
 =?utf-8?B?MFQzR1M0aUlUNmlwbzJFdkVLU3R1QUlVdm5SL1JOWkZZQnBYRC9vbVlMUUpm?=
 =?utf-8?B?ZCtUYU5BeHZTQWp2SWdZVnFWSGQ0Q2grTXk3ZlR3OHl5RlFQWGZFODAwbmZa?=
 =?utf-8?B?ODZpc3kvOUlTRUxNY1FwbVB3RThjYytBbU9QemtGOFBzSDRaeEpxMlRiUmJV?=
 =?utf-8?B?bnJ0bTBpZWdyWTh6bGdCcjNnL25xZWFaeUJtcnRRdm9DYVRpd2ltRkJvNGpy?=
 =?utf-8?B?RXF0L1hOZkQ4SndNcGlWOWdGT1ZobnNVaHFWMWNtL3pQMDRpUFN3M0JDQjBV?=
 =?utf-8?B?V0xlVi9zZWpZKytMM0EvL291UFhqVXFuNU9BT25SWDBBUXFqS2lhUTZDQkY0?=
 =?utf-8?B?L0NxSHdwbUJZaWhNRDYzU01YMkdmTWh4bEIxeHZ0TFNzSmpGWDVZb2hkMkh2?=
 =?utf-8?B?cE1FZ2xtV1JpVUpQcVUwRDU5WUhSTFhKd0NKbGN4SmxOOFFJdjRSY1NicWJm?=
 =?utf-8?B?cCtHaWNYSWFsTkFHUXoweHluMThxZ2tJR0NFd1lwMWFEYVV6cVdhNHFjUGVU?=
 =?utf-8?B?U25Oc2xaa0FTam5tOHBqMUFldm9wSHVVa3QyVXJhL2VSaG00bXM2ckYrc2tj?=
 =?utf-8?B?NGdWN0MydDFycjBhc1hvZjYxQkZEMHdLdmlwYU5kQ1Z6QUNURGkrRFdQekU4?=
 =?utf-8?B?WVlFVStnZkloKzc4K3M3bytKK2JIWG05V1doSk9jUkYwd3dkQUtwam44RFBs?=
 =?utf-8?B?SWF4N2I3bHFUYkx3MENBY295c3ZuU3lqQ2ZmT2hiWkpwYXVkUUlydjRMeThV?=
 =?utf-8?B?eGdXNlF5K3ErSzRkU21zVzkwWFA4RGpnSWZiS2F6aldISTRlWlJlSzVmRWYv?=
 =?utf-8?B?T3krRVNDdVFpb2JaZEdsc0Q2NkgwL01aMERONERTN3pGc2daVk1POUtpZmgw?=
 =?utf-8?B?UnEwM05RRXFPM2xHbjR2MGp5K3hEcU1uaW4vendXRE5NQURxQndPeGlWYXJt?=
 =?utf-8?Q?Gp+triL4W1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTB2cGUwSGpwaEljNlNENVl5dk44V1FnNUZqNDJHQUtubzF0aG5ZV3Q4ckxw?=
 =?utf-8?B?NjQ0SktEVlVXbHFmZ1lYZm5DbURvUkptU3NyL2RIT2RvelhURHpkbTJnMjQ3?=
 =?utf-8?B?Q0JEMndFY1kzY3M5Y09nclBhVUhRcHowUTR6VzBxa0tBK3dyQzJBODlxU3hG?=
 =?utf-8?B?dnNXcmtiTGk0ZFRBZTFDa3pzUjJKdlR3b1Ivd3NTeDJYR0k4ZS80NndnbWlk?=
 =?utf-8?B?QlBncFpqcVMzWm8wZEI0dGF3Rmh6T1dvanRCNk0yQzFRZTJKVE1hTHhiOTJy?=
 =?utf-8?B?YXFMQlpPUUF5U0YrbGJYSnFObW5hTXI1eWlnRjBRdW0zVGJFZ2pET2t1U3ow?=
 =?utf-8?B?dkRpYS9od2VENGlRRG5nZytVZnMrdmoxcm96Y3FrTnJVNTRWYTAyNFp3ZGQ0?=
 =?utf-8?B?WVVZTGdSUjBLTExocTVKSlZ6Vmgrc25oTkJkWHJFaG1abkJqVk5QOCtFem9k?=
 =?utf-8?B?MzYzb0JUSDkrSllkN1p3VE1jTndqT1BDSlJjcVhjQ0tqa2dqMFpYb3p2NUN4?=
 =?utf-8?B?ZlIrenBzT3E1UEExZm1VcWNXNHdUaGtGTnBNRWVLZGowdlMzVWI1aWYwcFoz?=
 =?utf-8?B?V3A1UjUxMUJmVlA5djFCcjJ6YjExZlNlcjY5WDFhSHpHaEV1eVBkdHJTMTZo?=
 =?utf-8?B?RnFmZ3VnUWZvYXdGWElGYVNFSFRHVjE0NDF4WTdWUWk5UzNyN1ZPR2N3MUtD?=
 =?utf-8?B?QXo0QTgwMS9VcW1Hdkt4UFBFUm1wVU0rZGtObDJQV0dZdkFTRTVwY3VPNHR2?=
 =?utf-8?B?dStucDZUVWFWcEwyS1dVaDAyazd3V2VjR1pDRTlvTk9TV3NzdGZNK3p4OWVa?=
 =?utf-8?B?NkRkU0NOTFZySkhwNDdFYWNPLzE2TzZIbWxWM2luNDJNb0lVM1pzVDZYRVIw?=
 =?utf-8?B?bmtjSVhJWlNXL3YxQXJCcFdKZk52bnRSU0N0bXVUOUxLZndBTysrWkxEQW9K?=
 =?utf-8?B?TjZzNlJ0TWJ3WmhkWFBLV0xRNy9GdlRLazZIZE1LY2twcDdIanF4MFE4bHJH?=
 =?utf-8?B?SXlVaW1hQ3E2M2lkRGg3MGdYYzN1eHZUWXhCN2J1ZXNiQXZsTTdVSXFSZ2lQ?=
 =?utf-8?B?Y0xmUjRUdStPR2MvUTU0cXZSNjRGdUxhM2UvZFR4SkZoSkxKb3BJVXdQeEdD?=
 =?utf-8?B?dWUzRjRkaHRrcE9Lb0JsbWdCZU92emd1LzFuVTZJSEpPS1czZjQ0YUZwSjQ5?=
 =?utf-8?B?OFkwSjRMVHNLYzB0T0ZVTEkwSU5TRDFwVEc1Z1NReXRGeDE4SFZiVGFoc1dv?=
 =?utf-8?B?WUw5WXJiYmVrcFUyZ2M4U21HRytZOXlWbWNYSktwcGtoSWRrL01wMXdJTVR5?=
 =?utf-8?B?cDlaaVBQd2hZSzFtNUIvdjdqeW4vVWgrT3dKdEUxMFIwZVEzYmg5NDY5dU5r?=
 =?utf-8?B?OEFLMEFvRTYrZndISmcyeTlJQ0VnQWxwVlIxZS9JZU1ORXducFV0RlQyeG5X?=
 =?utf-8?B?VzIxYnJnYmtkdjhxU2dnK1V4R3cvNWdtZHZ3cHkzS0lBd0d1allIYTlwRHhS?=
 =?utf-8?B?cEVnOFFxVU1CM0xyZlI2cjBWblhmV0szYmR4Snc1Q2JDU0w2UFNjekJGQmFK?=
 =?utf-8?B?RHg5UFNKWVZRQVlFbDBZLzNpTFlBS0E5TVFCczlhajFPS0U2TTBFVzhkdG9m?=
 =?utf-8?B?UmZTMEVJdmpUekpramZsbFNXdGlQOWNLeHNNaS9aK3piVS82R0lRTFBpeHZN?=
 =?utf-8?B?UmR2UTZmMUpNSExQZFRrMWpVdnJTZFpBU09wemNKNXJmOUZ4RzZzRklmWkJs?=
 =?utf-8?B?SU1pTmJVZDZOK2JZSkMzRDdBMzI3bzkzL2pMQTI0OXpBNHJEeFFDTkZqT0NC?=
 =?utf-8?B?cDd1c3YyL3ViNFhjNUt0VVdqQ2l0L3JqSGpvbUdSZzBOakpodjJZMmxsM2wv?=
 =?utf-8?B?U2hJaHFlQnZ5SGg1dndVK2YzK1ZvM2FtQlhzckVtUmNOaXk3SmxwemU5YWpC?=
 =?utf-8?B?MCtlbU51ODVuMHhWTE42aGZKTlIrbWdjS2dBQWJTVVZsWUp0WUVYOUdJQ1Jj?=
 =?utf-8?B?WDlMUXJSZHVaRXhFeU44azVTcjJUWS9QSEZ2Q2Nzbkd6QUVnZlNnTXpnRXFZ?=
 =?utf-8?B?WnBTUCttUnN0emZtcG9xYkU5azlCR3R2eFVEdlNlS0VpS3ZrbTJXVVBzc2ky?=
 =?utf-8?B?bWM3cmFpT0FTMzM5L0dwbjgvODVTVHFVSmkrcGhIcGpzZEtLcUc5VFU2MVZo?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 010c2ab6-5d2b-43b2-51f8-08dde02b7bf7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 20:52:32.6107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8Vkumr5oqgOgzvIow2YZMHUhZvNlpmH5fd4hbfuv3q343hOZfO/MGWGe8viTg4ZDoXfB0Otm2fWtI44lZ2tiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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



On 2025-07-29 3:08 p.m., John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add GuC LFD (Log Format Descriptors) related ABI definitions.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_lfd_abi.h | 282 +++++++++++++++++++++++++++
>>   1 file changed, 282 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_lfd_abi.h b/drivers/gpu/drm/ 
>> xe/abi/guc_lfd_abi.h
>> new file mode 100644
>> index 000000000000..b6888ab47e25
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_lfd_abi.h
>> @@ -0,0 +1,282 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LFD_ABI_H_
>> +#define _ABI_GUC_LFD_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "guc_lic_abi.h"
>> +
>> +/* Magic keys define */
>> +#define GUC_LFD_DRIVER_KEY_STREAMING        0x8086AAAA474C5346
>> +#define GUC_LFD_LOG_BUFFER_MARKER_2        0xDEADFEED
>> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2    0x8086DEAD
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2    0xBEEFFEED
>> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2        0xCABBA9E6
>> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2    0xCABBA9F7
>> +#define GUC_LFD_DATA_HEADER_MAGIC        0x8086
> These are not LFD defines. They are the in-memory buffer header magic 
> words.
Sure, to be moved out from abi header.

> 
>> +
>> +/* The current major version of GuC-Log-File format. */
>> +#define GUC_LFD_FORMAT_VERSION_MAJOR        0x0001
>> +/* The current minor version of GuC-Log-File format. */
>> +#define GUC_LFD_FORMAT_VERSION_MINOR        0x0000
>> +
>> +/** enum guc_lfd_type - Log format descriptor type */
>> +enum guc_lfd_type {
>> +    /**
>> +     * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
>> +     * required LFDs from GuC
>> +     */
>> +    GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +    /**
>> +     * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
>> +     * payload is guc_lfd_data_fw_version
>> +     */
>> +    GUC_LFD_TYPE_FW_VERSION = GUC_LIC_TYPE_GUC_SW_VERSION,
> This equality is coincidental not a definition. Indeed, the original 
> spec had different numbering for the two enums. It only change to match 
> due to an implementation bug! So you should not define them as being 
> related and should not make any assumptions in the code about them being 
> related.
Got it, to be changed to numbers.

> 
> 
>> +    /**
>> +     * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
>> +     * LFDs payload is guc_lfd_data_guc_devid
>> +     */
>> +    GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LIC_TYPE_GUC_DEVICE_ID,
>> +    /**
>> +     * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
>> +     * payload is guc_lfd_data_tsc_freq
>> +     */
>> +    GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LIC_TYPE_TSC_FREQUENCY,
>> +    /**
>> +     * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
>> +     * guc_lfd_data_gmdid
>> +     */
>> +    GUC_LFD_TYPE_GMD_ID = GUC_LIC_TYPE_GMD_ID,
>> +    /**
>> +     * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
>> +     * payload is guc_lfd_data_build_platformid
>> +     */
>> +    GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LIC_TYPE_BUILD_PLATFORM_ID,
>> +    /** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */
>> +    GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +    /**
>> +     * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
>> +     * required LFDs from GuC
>> +     */
>> +    GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +    /**
>> +     * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
>> +     * payload is guc_lfd_data_log_events_buf
>> +     */
>> +    GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +    /**
>> +     * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
>> +     * LFDs payload is guc_lfd_data_fw_crashdump
>> +     */
>> +    GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +    /** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
>> +    GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +    /**
>> +     * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
>> +     * required KMD LFDs
>> +     */
>> +    GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +    /**
>> +     * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
>> +     * guc_lfd_data_os_id
>> +     */
>> +    GUC_LFD_TYPE_OS_ID = 0x4000,
>> +    /** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
>> +    GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +    /**
>> +     * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
>> +     * optional KMD LFDs
>> +     */
>> +    GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +    /**
>> +     * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
>> +     * GuC log-events schema. LFDs TLV payload is
>> +     * guc_lfd_data_binary_schema
>> +     */
>> +    GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +    /**
>> +     * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
>> +     * from the host/KMD. LFDs TLV payload is
>> +     * guc_lfd_data_host_comment
>> +     */
>> +    GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +    /** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
>> +    GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +    /** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
>> +    GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +    /** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
>> +    GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
> Personally, I find the above impossible to read at a glance. The 
> comments add nothing - GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START is 
> described as "Start of range for required KMD LFDs". Well, yeah, I can 
> get that from the name. I think this whole section would be much easier 
> to read if was just the enums:
> 
> +    GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
> +    GUC_LFD_TYPE_OS_ID = 0x4000,
> +    GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
> 
> The structure definitions and such for the individual entries can refer 
> back to the define they are associated with. But this section would be 
> more use if it is a simple list of enum values that is quick and easy to 
> scan through.
Good idea, comments for each items make it hard to read here.
We might still want to have kernel docs, so maybe I can change each 
range like:

/**
  *  @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START : Start of range for
  *  required KMD LFDs
  *  @GUC_LFD_TYPE_OS_ID: An identifier for the OS
  *  @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END : End of range for
  *  required KMD LFDs
  */

     GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
     GUC_LFD_TYPE_OS_ID = 0x4000,
     GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,



> 
>> +
>> +/** enum guc_lfd_os_type - OS Type LFD-ID */
>> +enum guc_lfd_os_type {
>> +    /** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
>> +    GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +    /** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
>> +    GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +    /** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
>> +    GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +    /** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
>> +    GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
>> +
>> +/**
>> + * struct guc_lfd_data - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
> This description tells me nothing that I can't immediately see from 
> looking at the contents. Maybe just say "A generic header structure for 
> all LFD blocks".
Will follow.

> 
>> + */
>> +struct guc_lfd_data {
>> +    /** @dw0: A 32 bits dword, contains multiple bit fields */
>> +    u32 dw0;
> 'header' would be better than 'dw0'.
sure>
>> +    /*
>> +     * Expected value: GUC_LFD_DATA_HEADER_MAGIC.
>> +     * Helpful in detecting file errors.
> Why 'expected value'? Indeed, I don't think this comment is worth having 
> at all.
To be removed.>> +     */
>> +#define GUC_LFD_DATA_MAGIC        GENMASK(15, 0)
> Calling this 'DATA_MAGIC' implies it is related to the 'data' field 
> below. Assuming that 'dw0' is renamed to 'header' then this shld be 
> 'GUC_LFD_HEADER_MAGIC'.
Will do a cleanup among this series, to rename all macros names for 
GENMASK to be
STRUCTURE_NAME_XXX_MASK_YYY
XXX is structure field name
YYY is bit field name
for example:
	GUC_LFD_DATA_HEADER_MASK_TYPE
	GUC_LFD_DATA_HEADER_MASK_MAGIC
>> +    /*
>> +     * File descriptor type (the 'T' in TLV) is used to identify how
>> +     * to interpret `data` below. For the range of types, see
>> +     * guc_lfd_type
> Again, this is a redundant comment. Also, the KMD uses KLV not TLV.
Need to confirm TLV or KLV
>> +     */
>> +#define GUC_LFD_DATA_DESC_TYPE        GENMASK(31, 16)
> Again, GUC_LFD_HEADER_TYPE would be a better name.
Will be GUC_LFD_DATA_HEADER_MASK_TYPE

> 
>> +    /** @dw_size: Number of dwords the `data` field contains. */
>> +    u32 dw_size;
> data_size
size might mislead to byte size, will use data_count
>> +    /** @data: Data defined by File descriptor type. */
> Defined by GUC_LFD_HEADER_TYPE.
Sure
>> +    u32 data[] __counted_by(dw_size);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_version - GuC Log File Format Version.
> LFD is Log File Descriptor not Log File Format.
Struct to be removed
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lfd_version {
>> +    /** @dw0: A 32 bits dword, contains multiple bit fields */
>> +    u32 dw0;
>> +    /*
>> +     * Guc-Log-File Format minor version. Must be
>> +     * GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +     */
>> +#define GUC_LFD_VERSION_MINOR    GENMASK(15, 0)
>> +    /*
>> +     * Guc-Log-File Format major version. Must be
>> +     * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +     */
>> +#define GUC_LFD_VERSION_MAJOR    GENMASK(31, 16)
>> +} __packed;
> Again, no point in having a structure defined for a single u32. Just the 
> bit field definitions is all we need.
Yes, will do that way>
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid - GuC Device ID.
>> + * This is mandatory fw LFD data
> "fw" meaning firmware? But this is the LFD as created entirely by the 
> KMD, the firmware is not involved. Should just say "This is a mandatory 
> LFD block."
will do>
>> + */
>> +struct guc_lfd_data_guc_devid {
>> +    /**
>> +     * @guc_devid: GuC microcontroller device ID defined as described
>> +     * in GUC_LIC_TYPE_GUC_DEVICE_ID
>> +     */
>> +    u32 guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq {
>> +    /**
>> +     * @tsc_freq: GuC timestamp counter frequency as described in
>> +     * GUC_LIC_TYPE_TSC_FREQUENCY
>> +     */
>> +    u32 tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid - GMD ID. */
>> +struct guc_lfd_data_gmdid {
>> +    /** @gmd_id: GMD ID as described in GUC_LIC_TYPE_GMD_ID */
>> +    u32 gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid {
>> +    /**
>> +     * @platform_build_id: GuC build platform ID as described in
>> +     * GUC_LIC_TYPE_BUILD_PLATFORM_ID
>> +     */
>> +    u32 platform_build_id;
>> +} __packed;
> Again, not sure these four are worth having structure definitions for. A 
> comment that says LFD_DEVID maps to LIC_DEVID, etc. would be sufficient.
Agree, not worth to declare a structure, especially a single u32.

There is an difference between LFD and LIC values, The payload(or value) 
for above is one u32, and for LIC, it is KLV, which has extra length 
field, make it possible to more than 1 u32. There is no conflict at this 
moment, but some assertion is needed to prevent further mismatch.
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
>> + * This is optional fw LFD data
> As above, this is not a firmware generated data stream. Should just say 
> "This is an optional LFD block.".
> 
>> + */
>> +struct guc_lfd_data_log_events_buf {
>> +    /**
>> +     * @log_events_format_version: version of GuC log format of buffer
>> +     */
>> +    u32 log_events_format_version;
>> +    /**
>> +     * @log_format_buf: If `log_format_version` == 1, array of
>> +     * guc_log_format_version_1. If `log_format_version` == 2, array
>> +     * of guc_log_format_version_2. Dword size determined by
>> +     * guc_logfile_lfd.`desc_dw_size` - 1
> This does not match the name you used in the parent LFD header 
> structure. Should just say "Size in dwords is LFD block size - 1".
sure
 >
>> +     */
>> +    u32 log_format_buf[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_info - OS Version Information.
>> + * This is mandatory host LFD data
> As above, this is all being created by the host so no need to specify.
To be removed.>
>> + */
>> +struct guc_lfd_data_os_info {
>> +    /**
>> +     * @os_id: enum values to identify the OS brand (1=Windows,
>> +     * 2=Linux, etc..). See guc_lfd_os_type for the range of types
> Should not repeat a subset of the enum definition values here. Just 
> reference the enum name.
Sure
 >> +     */
>> +    u32 os_id;
>> +    /**
>> +     * @build_version: ASCII string containing OS build version
>> +     * information based on os_id. String is padded with null
>> +     * characters to ensure its DWORD aligned. Dword size determined
>> +     * by guc_logfile_lfd.`desc_dw_size` - 1
> As above about naming.
Sure
>> +     */
>> +    char build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version {
>> +    /**
>> +     * @guc_sw_version: The full version of the GuC microkernel that
>> +     * generated the logs as described in
>> +     * GUC_LIC_TYPE_GUC_SW_VERSION.
> Except that the log data block is optional and so not necessarily 
> present. Should just say "The full version of the GuC firmware.".
> 
>> +     */
>> +    struct guc_sw_version guc_sw_version;
>> +} __packed;
> Although, again this is a single u32 structure, which seems pointless. A 
> comment description would be sufficient.
Yes, no need for single u32, To be removed>
>> +
>> +/**
>> + * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File 
>> Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_lfd_file_header {
>> +    /**
>> +     * @magic: A magic number set by producer of a GuC log file to
>> +     * identify that file is a valid guc-log-file containing a stream
>> +     * of LFDs: Expected value: GUC_LFD_DRIVER_KEY_STREAMING
>> +     */
>> +    u64 magic;
>> +    /**
>> +     * @version: Version of this file format layout as per
>> +     * guc_lfd_version
>> +     */
>> +    struct guc_lfd_version version;
>> +    /**
>> +     * @lfd_stream: A stream of one or more guc_lfd_data LFD data
> "LFD blocks" is a better way to describe them than "LFD data". Data can 
> mean pretty much anything, whereas block implies a discrete unit.
will be LFD blocks>
>> +     */
>> +    struct guc_lfd_data lfd_stream;
> Technically, this is just a single LFD block, not a stream. And you 
> can't really do 'lfd_stream[]' because blocks are variable in size. 
> Would be better to just say "u32 lfd_stream[];".
Sounds good
> John.
> 
> 
>> +} __packed;
>> +
>> +#endif
> 

