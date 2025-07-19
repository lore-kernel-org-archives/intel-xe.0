Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7DDC83F34
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 01:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A7B10E1B1;
	Sat, 19 Jul 2025 01:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfsStGVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A2410E1B1
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 01:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752887680; x=1784423680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nKFkjgE6/5XWrvMC7z9UX+Rx5/FwtrJe9AwFrrFr/vE=;
 b=gfsStGVUVNKsdLvocf38iP61Qd8FsdBYxb/Iv3RB2Xq8sbph5dJpzxNg
 eTblpiiomu3ggdI6qvjYwrXNl+0bA5OmezgZXoIjFzdcbXDnHglFGiGi1
 Mq4yJakIrtCwEbOL+n3sKyjv/IBnze1eu4OMTiE79Y1qEQN0t8ER6Ec88
 cEmPDsgwjcaJ5F0HCHXdk8Um0FlLYd3QftwLuEGce4v1vrlHm+nfW+lEr
 4tv90scwXqc+1Tpzrd0cOW4qhqj9FR7xG7qDOnPmmx9RcbrFJlb2y0OHR
 7Xm+48+AHW8en3XpMLjNR9Ol4K0MjFEwF9KIXHdXl4Pje0FwHH3j058hd w==;
X-CSE-ConnectionGUID: BhsBxz1VQLagt2KnQGbgLA==
X-CSE-MsgGUID: M1u4JzbfTNO+p3Ex5OP/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54291372"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="54291372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 18:14:39 -0700
X-CSE-ConnectionGUID: BmV9LJuFSCydXJtRT80N/A==
X-CSE-MsgGUID: kHjIuj4yS5+tS6hX2nd8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="162600261"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 18:14:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 18:14:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 18:14:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 18:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAq7PQfQ+l4lHt0x4NophMq9QYmOcE7vNnGpjrCdzg0/BNd1YxOW8uImmTcnu+dj3hgBV28xhkYJwLxfcfX8qYqlL3VEx5pOqYXCbMt3nt+XRlaHcX2lYqPMkZP2wvcCeMIYGdtQ1EIq2JOJy93B1XaLiq7JKdWtmmOlbD+YxVvIjtQ0YTotH2qJ8C9GawZiRtcSPWjR3a0Vd/aEUkDyZlInvvS2RsUTTvhxXCr4u1ZdlrFV+59UpJFJIW8IlSzEI/KBL30ifc2AMaG46P5iTMov300H0P3HvQGWK+52TSg77rARzRIaDF/n3JaIg50nDQu6w4ZuwZLoWKN+D5AykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNV2XjhgzzLMIjCwVpMFSISg5WNNa0WYxS02SRXsseY=;
 b=eUvgBqRJASAnes3mSWPbX6XCD9xZoxKzCI4LbJujwjkzCEKQemlERQu7ezLjm0Rvzd0qdsL0gSoIeLJ/iob/dWRRnnqtD2gouGPsNNMGGEhrBJhykwbJ9J04H7k+JouCmcxfhLmASydGdJtDYWXnGYMXJkm79DYpf7I5tkS5U5lQgzqgUx1frlVUviuZ8QCkaO2hiycbI3csFnxn0kjAmDvf8hJat47tgt82MH7nXlvEkkO/Zz/mLQbwCnQsu3efWircHqHYPUwxa/BaNnWZFDAm06GNXGOJLCcMqJerfGpEhKVRvnbQQWGbjUgUFCEJrDkhYwp5H/f/zYGKthHPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Sat, 19 Jul
 2025 01:14:36 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%3]) with mapi id 15.20.8943.027; Sat, 19 Jul 2025
 01:14:36 +0000
Message-ID: <5e3df4bd-5eee-46ff-9f4c-2c3f2bfddc68@intel.com>
Date: Sat, 19 Jul 2025 03:14:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-7-tomasz.lis@intel.com>
 <72lodafuq7gqnogeslpouyz2fvkid5zkdbvaollijeqeezopta@47bvtuczrj7d>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <72lodafuq7gqnogeslpouyz2fvkid5zkdbvaollijeqeezopta@47bvtuczrj7d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0230.eurprd08.prod.outlook.com
 (2603:10a6:802:15::39) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a06af7-4ab7-42cb-1c07-08ddc661a020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG5yRGlRT0JqenhWd0liMGE1NTVIV1llQ1ErL3FVY2QyeWJra1hXME9RMTcv?=
 =?utf-8?B?TytOQnhSVkNQK0I4UzYrbmFySGNYcEpYbmE0cXN6WTBCQXk0QTZsSDBFeXpU?=
 =?utf-8?B?bGgvS1c5K0RLQmlvdDk2eTdzRFB5MkVMd29zWmtRWUpVMWpYVjI4bzlIbEpu?=
 =?utf-8?B?R3dlQTA5NklIMnJuS01pd3FwVHYybVpTTkE4STJFNkxINlJxWFo2c2Y3SkRN?=
 =?utf-8?B?NEpWNGRESUU5YU5ZRUtmRWhJMEVENGxjYUc0ZGQxZE0rSUZqMC9meThOVnhy?=
 =?utf-8?B?K0drdWsyYW1Gcjk4Q2NvWkx5UTZrbTZTSjdKLzBzTXJCK01LQmVFNS9zaWIr?=
 =?utf-8?B?VWtCYmpOOSt2RklvdEFUdWg0TFlsYVlwZlgzUmcvNTN0UTJJL0lDcEs2Rnpx?=
 =?utf-8?B?QlRtN2pMZjZrMzEvUkNmTWZ1SXpQdnpySkNVWG9mb3czTVoyMlk0QVJXNHNz?=
 =?utf-8?B?NjR3cFFXYisxOHRjMkZPcGE0VGF2YjQ3MnoyQmhqcmtHUHVWMHJUU0YvRm0y?=
 =?utf-8?B?NUxmNnYwZUdoRUltaDJCcDJVM1N3OG1yQ3U2eG5mMmhVVGcva0R6Q2lqcUVw?=
 =?utf-8?B?NHVTaG5OazBYOFphZ2lld3VaK2JZNUZ5SEpyNHRQZVo0ZTF6Uk56UlZyL1dX?=
 =?utf-8?B?MVN4VHV6VWFlVnpPSGNjZXZoUVhaYXNWSUp1U1dLQy9Yc2pOb09GSGplMjF1?=
 =?utf-8?B?d3hsQk9zZnhma1Fydm1RVWdDTmhrUVRER2JRdHVWc3A2eGN1MGJWTmVHYjl4?=
 =?utf-8?B?eFRVVnBzbE1uWGVlK1BET2tCMlNTUGNYVFhsU3BmVDF4RGF5SFBaRyt4MFFP?=
 =?utf-8?B?aFBqUHFHWXdOaFlvUHFJZTlXd2krY1Fpa2hCS2h2WFY5ZWNsVlUyc3hWQ1FK?=
 =?utf-8?B?YU9mc0hTRGZHZkxaUUk4YWZpY0I2VlcrNGFqVVhLVDJHRDNFd2I1Vy91Z0Mw?=
 =?utf-8?B?QWJDNEdGdDFiemgxUm5EMHQ4K2hTaWZoSk1Rb2FYbGlaejhxV2xKbWFzRmdp?=
 =?utf-8?B?R3JGMDlKcklZU1hIdGw3M2JxcEU0T3FJY2ZuaVE3clEvb2dVUmN5ajVVOXZF?=
 =?utf-8?B?Syt5Z2NVMTVOL09KbVFOVjhWYmZmMnRFZmRBSWtDSnIzNk1ycXN6WkhlQWl3?=
 =?utf-8?B?OTVQRE9rZU9xaWNiUFI5SUhmd2F6VjlvTmpMNTlqUWFSWVdyeTJaWkkxUDR2?=
 =?utf-8?B?K0NvYUJiaXJqM0RLMEhyZHVvdXgxa05tM0tlc29FdWVqYXJWRjNCQ2VBVmpp?=
 =?utf-8?B?TDRaZkJrT3M3MTExWUNxcmlUNVJuSlBNdGZvZG0xeVRZbDQraGQ3bUZmbFZi?=
 =?utf-8?B?VDczNXdIUFpCZHBodWROSjlKZnNsZ1JqSmVlSW53eWVVUWZ0OW1CTUlrYksv?=
 =?utf-8?B?OVA3QUw2TzdoN1UzRlcrQ1BXYlM3SUVQeTl3SmtZYlNHWElsSVhBaHVMd3d6?=
 =?utf-8?B?QnhGcmJWNG5GSFdhWkE2cElqSU13UTFlKzFYcjgvVkxSai9uTkJzRlVBbzlx?=
 =?utf-8?B?VllCWHMyeHRHK01JdU4vS2tBcituU2JvYjZzYTM4WnFqSE9sbjlkTkI1eGhv?=
 =?utf-8?B?OW82NjQzUzhnMXNRWDZGRUdqc2RrSzZnRk5vZmduMjFsRVh4SGlmQlV1Ynls?=
 =?utf-8?B?WG9qbjdJSWVxRkNYSlhHMGtaMW80ZCt6Z0ZVeGpKaVg1Znp3Ri8zMXVhb3lH?=
 =?utf-8?B?Q1dLdmE5blpnaXVpb3BEZ2JDcnpPank3bjJuUGFJUDAxQ1hrckpQTTVMdFFO?=
 =?utf-8?B?bkFtQjluOFNOY0sxcHh0ZmhEdE95cm41eldnM1NGd2MzTjV1N3ZDdDZvZDB2?=
 =?utf-8?B?U2VlY0Q1MzVueDZaWXlvU01PZUs3bkJyY3FVMkR1U0xKLzROUmIzcW9XVEY1?=
 =?utf-8?B?QUpEK0tkdVZXS3gvY0pic2hCWjJTOXFyKzRyWnI0eHR1QzY2eEpSM0Nod2p0?=
 =?utf-8?Q?7vG0R/IBwMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXA0R1JvMVgzTXZYRVpabVl0dWhzN05idEVGSW1TV1Z1U29TNC81cW8zNVpI?=
 =?utf-8?B?NDVkRVlRbmk4c1NjTzZpRFRKUXh1Tm5HMmFFMnRnTlFnZzBSSVFabllIQlR5?=
 =?utf-8?B?RFJmemVrb2JQeFUzMVBpSG1EQm5DcWk3OUx6TDBGTGEwYUxxUGRIV3BDbldQ?=
 =?utf-8?B?MCt0cmZOSnpuVlN5ZksrQ0JRWHp1WjFhT3FHUkxuTHdHeGdMTWpxbHJKWVF3?=
 =?utf-8?B?SmxZRzlJNDg0L3A3a1haM1Yyem9hWGE4OXJ5M3BjdWR5N0syQ00vNlYybVZo?=
 =?utf-8?B?Q29kV1cvS01TVG9iOWZlaDJrTEJFYUMvL0FzenZMOUdycER3SFlvOXB1ZHVI?=
 =?utf-8?B?R3VtcHF5azBQZDZDMUhMM1ZubDUyS2RsUnEyUUVQS3JhbUE3RlBaNFFrN2Uz?=
 =?utf-8?B?L2xVNjNZODZIb240QWhDOXJEMXBRUWNmSW95MXJKeHhxblRJNjlEN05TUFQ3?=
 =?utf-8?B?cFF4UVR2MTczNUVqOU5TamxGR1ZicEFTR2YyV3MvZUR6bXVvVjJlekJlUWNo?=
 =?utf-8?B?QnUxVGQ0ZTcwbEFSdjFVTUhSb0pid28zb3pJck1UZnFGZVZFcW1vWTV6d25w?=
 =?utf-8?B?WWNjTWJVVC9ranFVd0NHZ3lxNXB2dkw5N09sL1dNUkU4NHVDU3RyeTgzNVZU?=
 =?utf-8?B?ZUNmeEpHajM2Z0N4Y3Z2TWxmQnR4S09zU1RBUlRBeGlVK0xWSk1wV2paeWRn?=
 =?utf-8?B?M1JwMExzeXlGT0gybDlpYTEzVk9La1ZkL3FwZDVBK05JbTUxZDNDWUJJR0Q5?=
 =?utf-8?B?WlUrZEJDdlcwSjlYTThlOXdLaStjY0NjT3dUSDdtT1ZWUjhMbCtlSmw0WVli?=
 =?utf-8?B?WndLOHV0OWtJZ2dwU1UrUjdsbjJnYWFXaDA0QnB0M0hwdjRyMnAyNi9CUHJk?=
 =?utf-8?B?NDVNbTF2cW5EcmZFeGVkOVN2ek01UmJncklQYmN1cWJZMjhJUUxYTGxyZ2V4?=
 =?utf-8?B?ekVYUkRmQ0NZa2tLaFU1eGNHK0g0dUl0OXNuTWJFQzNmV3ZYbEFieVk0S2U3?=
 =?utf-8?B?M1poK2pUS2N3dWZXWlp4NG9hblpBT3c1YkJtZ1lpR3JjUFk5L1l6Vjh3djN0?=
 =?utf-8?B?UTh3SVcyM2k3ZU9WTUl4YWZNVnViR1V0UnBiZ1dPb2NIVUM2N25sbUp3WFll?=
 =?utf-8?B?a2oydG9MdzFyL3JPVEhJMzdmK2pWU1Vwa1N1dG1OUzE4LzBwZ2RnckdsSlR3?=
 =?utf-8?B?eFVaRzRrdCt6ZWJ5NWNwK01wejlSQm8yR3JJTTMwOHRVMzZiQnNaenNBbkdO?=
 =?utf-8?B?VURRalI3V0s4bTFST25qdFVpOEpEa2x4Q0thVEFuV0FwQWFRS0dPTzYweTBl?=
 =?utf-8?B?b0tsU0ZURXZWejlRdnpGdHVja0FBSkhOWG1TYnVCNzdwZXJzb1I5dG9nR2Nu?=
 =?utf-8?B?aHp0dzJ6SEMwZXl1VGJoOWpHRHhOYmFFQVFObmJXYjlwUHVBdm0waHhMNVFU?=
 =?utf-8?B?ZVFMSzRtNXZQWnJlb0ViUHJCdFpIaHMzbWEvVmsrYjNrNXpZcTBXWEcrSVBl?=
 =?utf-8?B?QVVVTzdSRDhwd3Nib3VZNVRWNmdlYS9EbklpQ0l0cnRrMlZqaWY2bmp1d2Js?=
 =?utf-8?B?WmszSTRvWXI0S2h2Q3ZjRXlUSjJucWZFZWxGMWhWTktmSFRnYSt0SGkyTUJ1?=
 =?utf-8?B?UFVPOTMydE1Yc3FYbjVILzcvWnBQTml0dktYMFdsakVmalYvQmZnejBBQ1dH?=
 =?utf-8?B?ZEJSQmREY1FLRkpMcWV2R0JibXlNenorVmtLaFA0RnhCS3d4Q0UrQlBTWjFo?=
 =?utf-8?B?SWpqL0VCdExZZXEvYUZPK0pOMTEyWlRQT0ZDSU1NRFM4dkJXT0VEOGEyblgw?=
 =?utf-8?B?RGZmNndEcGNwQ3Ara1gvbHR6NjZER3Z6bFVEZ2Z5UlhScHFwSWhUY1JkZHRy?=
 =?utf-8?B?TTJEeFBCeTFJTEw1OWdOaTJDSGpWRmNTT2hlZTNEd1NOYndRSzBabHFqM3Mr?=
 =?utf-8?B?TTd2N3RwNktwRWJucUoxV3R1SjRjaWg2bGZaenFOY080Z2U2REtjbW9oMjRp?=
 =?utf-8?B?U1poYnMrVk5VUkRURkZFOUJ0TDUrNW96WlpHU3dpYi93Y281QWZLaDlIUXQy?=
 =?utf-8?B?ZmtDQ25ZWWtqSFd3RlQ5dUU1YUcyWCtZdWhwM1NBcWZOdUtObDN4amJ2U3pt?=
 =?utf-8?Q?QamSpjruqPYpLJKnHFFXquSSs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a06af7-4ab7-42cb-1c07-08ddc661a020
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2025 01:14:35.9531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRLG/5Gds7XkvLt0LEIbt6jegQ3sdNDBUXAaUCggYWrSkwKm+tQ5NrxlXmsqTfi9EwXxdCBfnJulYp78Rpk6YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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


On 16.07.2025 20:32, Michał Winiarski wrote:
> On Fri, Jul 04, 2025 at 11:02:25PM +0200, Tomasz Lis wrote:
>> All contexts require an update of state data, as the data includes
>> GGTT references to memirq-related buffers.
>>
>> Default contexts need these references updated as well, because they
>> are not refreshed when a new context is created from them.
>>
>> The way we write to vram requires scratch buffer to be used
>> before the whole block is memcopied. Since using kalloc() within
>> specific recovery functions would lead to unintended relations
>> between locks, we are allocating the buffer earlier, before
>> any locks are taken. The same buffer will be used for other steps
>> of the recovery.
>>
>> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>>    set_memory_based_intr()
>> v3: Renamed parameter, reordered parameters in some functs
>> v4: Check if have MEMIRQ, move `xe_gt*` funct to proper file
>> v5: Revert back to requiring scratch buffer, but allocate it
>>    earlier this time
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com>
>> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com> (v3)
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c  |  7 ++--
>>   drivers/gpu/drm/xe/xe_exec_queue.h  |  2 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 14 ++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c  |  5 +--
>>   drivers/gpu/drm/xe/xe_guc_submit.h  |  2 +-
>>   drivers/gpu/drm/xe/xe_lrc.c         | 52 +++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_lrc.h         |  4 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    | 20 +++++++++--
>>   9 files changed, 97 insertions(+), 10 deletions(-)
>>
> [...]
>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 54a6218e48b0..43ac73e432d4 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_irq.h"
>> +#include "xe_lrc.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -244,6 +245,11 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>>   	return -1;
>>   }
>>   
>> +static size_t post_migration_scratch_size(struct xe_device *xe)
>> +{
>> +	return xe_lrc_reg_size(xe);
>> +}
>> +
>>   /**
>>    * Perform post-migration fixups on a single GT.
>>    *
>> @@ -260,19 +266,29 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>>   static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>>   {
>>   	s64 shift;
>> +	void *buf;
>>   	int err;
>>   
>> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
> I would suggest allocating this temporary buffer at the place where it's
> actually needed, rather than dragging this top-level allocation through
> the entire call-stack. Yes, when done this way we can reuse it, no, the
> reuse doesn't really give us anything, as the buffer is small, and
> kmalloc is relatively fast.

That would be best, but also would make lockdep very angry, and the 
anger is most likely justified.

Well, not now - this series does not introduce the GGTT Address Locking, 
but that will be

added soon (in the next series), to prevent any GGTT address 
computations within the migrated VF.

Almost always, `kalloc() ` is fast and simple. Unless the memory is 
tight - then it enters a

slower path, with complex mechanism of persuading something to free the 
required

memory. This mechanism does use locks. So by using `kalloc()` at top 
level, we can place

the allocation outside of GGTT address locked area. This makes sure we 
are not creating

a relation between locks from within `kalloc()` and the GGTT Address Lock.

Here is a lockdep splat example if we do not keep the allocation outside 
ggtt addrlock area:

---

[  704.438205] ======================================================
[  704.444421] WARNING: possible circular locking dependency detected
[  704.450634] 6.16.0-rc5 #666 Tainted: G     U
[  704.456066] ------------------------------------------------------
[  704.462260] kworker/u256:0/12 is trying to acquire lock:
[  704.467583] ff11000152c6c160 (&ggtt->addrlock){.+.+}-{3:3}, at: 
xe_guc_ct_build_and_send+0xa4/0x3e0 [xe]
[  704.477289]
                but task is already holding lock:
[  704.483129] ff110001382d1528 (&ct->lock){+.+.}-{3:3}, at: 
xe_guc_ct_build_and_send+0x61/0x3e0 [xe]
[  704.492204]
                which lock already depends on the new lock.

[  704.500392]
                the existing dependency chain (in reverse order) is:
[  704.507883]
                -> #2 (&ct->lock){+.+.}-{3:3}:
[  704.513463]        xe_guc_ct_init_noalloc+0x2cf/0x4c0 [xe]
...

                -> #1 (fs_reclaim){+.+.}-{0:0}:
[  704.627081]        fs_reclaim_acquire+0x9d/0xd0
...

                -> #0 (&ggtt->addrlock){.+.+}-{3:3}:
[  704.760232]        __lock_acquire+0x15ef/0x2690
...

               other info that might help us debug this:

[  704.822458] Chain exists of:
                  &ggtt->addrlock --> fs_reclaim --> &ct->lock

[  704.832812]  Possible unsafe locking scenario:

[  704.839087]        CPU0                    CPU1
[  704.843793]        ----                    ----
[  704.848498]   lock(&ct->lock);
[  704.851731]                                lock(fs_reclaim);
[  704.857566] lock(&ct->lock);
[  704.863312]   rlock(&ggtt->addrlock);
[  704.867150]
                 *** DEADLOCK ***
---

-Tomasz

> Other than that - LGTM.
>
> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
>
> Thanks,
> -Michał
>
>>   	err = xe_gt_sriov_vf_query_config(gt);
>> -	if (err)
>> +	if (err) {
>> +		kfree(buf);
>>   		return err;
>> +	}
>>   
>>   	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>   	if (shift) {
>>   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>> -		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>   		/* FIXME: add the recovery steps */
>>   		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>>   	}
>> +
>> +	kfree(buf);
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.25.1
>>
