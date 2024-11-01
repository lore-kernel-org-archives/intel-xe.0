Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79732E6F086
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 20:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CE510EA00;
	Fri,  1 Nov 2024 20:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VnbjvjrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B632D10E0BC
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730492037; x=1762028037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p/6gPWiWg+R2WTO2d4NaaAwl4rrVjf1TDdtCMQc3EYs=;
 b=VnbjvjrV4X8BoglzJ8mSOswLy3j7IHJpwjwlun7GmwbWqRQh6PxVehT8
 +tqqcKfVeQ4aDoH+em4VlGn9yKzwmBmydcO+SksKDpUBrGtugUB3KdS+w
 l6I7HkqmbvyNdjgq4+eqz3zRJg2AZmQoBfdwRVvxMeCqRreCg/F7CU/9n
 lvP7345OhiZHPOAxOafonuyhXuM8vOHJr0ZNidqxfmHUVQ7Muo9cBNqJn
 VIAh8hASmXLdyWbP8w1z52sCNgwQG545Bk7ozaKAhM3SW9p1VU/f6UEcV
 vCtcqtH/UnL832Gknj3+FlIH0PvT+hcKoRT1IGKKxTak72BuhYsWd7DLa g==;
X-CSE-ConnectionGUID: 4zVir7T3THGaiSwv288Kvg==
X-CSE-MsgGUID: IipXPLsGQBaSXvNovr5Ucg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55663111"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="55663111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 13:13:56 -0700
X-CSE-ConnectionGUID: UzlZLVaHQbmZNKpP61iOEQ==
X-CSE-MsgGUID: wNsCxPuRSMSF4BXWPziVPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="113886986"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 13:13:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 13:13:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 13:13:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 13:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFIk71aHVi99wBYYjWGkE9tJTV7gXVM59aS8krNo+pQnJR3oaUYuBhOkODF6HbhN094MJHBpcYu3aMyZTMH234HBFiL4A2Ah6jMrVNliUUqC83R31B+0gAiF6yqCH76YbzcrjJui6UyhXkBj9pksK54mZgb9hxYwIXKYD4VL9bkb/Blmky+OmdoHgLZoyu4sbnAgwYJKL+yzRg+bMP1wZV/BcTSdntz9t/W2oervEjIS1QMVbbbd4oY/DpBWtvSDyKeHKzxK8I0NdTw2NTYcIU/nEeEdCti7P0ixLQjW76vAACggnUpdsx9+3wa7M/bxOQLTB/zrMYUw5nKWnfu+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1zylRL6Axf3nQg+qUwtgzdkfwufzezKjBqt0LbD9ac=;
 b=q/M1awjmpdfbjdc+kJ089eljhrva72+RZnXHFLACEcExlDyLT848uZ3IlHOaryTGt5foiQK+wjZ8ftdpBQhOD8eju0lxoAW4EM5N/spNA7SJgkzZyOets2286LZu3/S8LgK1xil8GnNUGHHReqoxnO7M248c7Vf2cnFERHkYSJ1zlwPTmaqI/97ES3sdqI9LnLP2PXnQg3PbhMHKBLnSrJV2kyQk2favhgDHXbec+l8OU94GR2L0wA0B8daAs9ppX23uXLAVD2ohndPFhGWdcDncqC86vL9ChDb9faanuJw56pz1zV6Xk/NXt5plFr7fE9D+t1+GELI6VRL1xZA7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 20:13:53 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 20:13:52 +0000
Message-ID: <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
Date: Fri, 1 Nov 2024 13:13:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:303:8d::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 6385dc4f-81f9-439b-7c70-08dcfab1b498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnI3bnZxUG13NGFBMVhEeERSTVRvTDI1b21HZUJzZVgvUnVPbVB0OXVyTkgy?=
 =?utf-8?B?ODZuN1Q3YTVHano5VnBPdThMNlpLRDRScS9xTitBUnUrdDh3SnA5aUxTWno0?=
 =?utf-8?B?eGh0Q2RPc3grdEIwaEJUOFY5MjdaSWpLQXBoWTN4Q0JCaWpzY3FrWEVPdE52?=
 =?utf-8?B?VUxhaVZqQy9MLytMb251Z2NaTjBIMFZ1UkZNSVhuM2NKYUZqeDN3NWJGcW5V?=
 =?utf-8?B?eFJVeFNBMFNod0lwUUpGOUl1OWhEdHAraTVrbjVwVHFwUEFZUDlwc3NLS3J2?=
 =?utf-8?B?NkFkRkNGM1V0YnpoS2VTM3ZxQVBiaE14MUJNeVNNemRjZXNQOHJVcE4yZit5?=
 =?utf-8?B?a2ZoUFpHZHpZU2hNcUZOSG13Zmg1MEtxa212OGJQNGZQdVp3N000R29qWFdm?=
 =?utf-8?B?cXNrN2NpQzFaUjUrcTZ2RWd1Z1dhaEFsRXhqMXlaQm5Tdlc4TU9GMWNjV0pD?=
 =?utf-8?B?dXZjU2JKZ3M2QUZZaGtjZng0a2tUS09SU2YyNjM1TkhBNmwyQ1FtalIvalZX?=
 =?utf-8?B?akN6bFJrR3N1cnJMZzNsS3NwdVJWYUppaFNqRmVsZ0hYOUorZGRQSGQvWnZo?=
 =?utf-8?B?eU1ndnUrQytYSDdVVXRWVmlscVcxaEtUNGJiK21pUFphanlBb3lQZzl2d0FR?=
 =?utf-8?B?MlVqN0hPU3U5d2grVzhBVGU5eGJRTkNtZHBWaDJCcTI2MFFOQjFONE1KZlZE?=
 =?utf-8?B?ZGluaXBqcFJpL3dHOW1jamlvUzZRM0FqbkdGVjdiMVNhVGVBV2lzc2pQajRX?=
 =?utf-8?B?cW13MVZHWnBocFNIekNYRk5ocWd2UEdLY3pFVUY2VFZKcUVVcTB5WEIybmww?=
 =?utf-8?B?djRnVkVST1NtN1lxRmZLOTNkUkxnUldrTDZrSHczdnJpUjNMQ014TzVwN2NH?=
 =?utf-8?B?VGhDcE52TWNmbzJlWkpzdTBpeS8vOVJsRjF2LzJBbzRKQmpnaFlJR2dRQWhr?=
 =?utf-8?B?ZEJUbHJQMk9KeFFLTElOMFI4bCs2QUtOYTlYSlNySlJRSVk4K3JPODQvQW9T?=
 =?utf-8?B?YkpWS2w1SDExM09iaWJkTzBZV2Q5NVlmWldZSi91UkJrUGk3a1RsenBrckR1?=
 =?utf-8?B?dmZKK2hWNVpNaURxN0ZPd2NEVmxydzBoeEE3NGNrUmtEV3E0R0xYNVAvdTA4?=
 =?utf-8?B?bThVUkRaS2ppcHMvWjYraW54YjRYbkJwbEZvSTlrL2pkMHN0M3YzZHo2clR2?=
 =?utf-8?B?bGgraEFTNTlSMXFOMUZiTGNLSFphL2lhaDR1eHV5aEd1MTBOb3ZXVVAvcVVv?=
 =?utf-8?B?SzkzdFNZL0g0UURuQTlnSEJCRU5hcmpLS2Z4bnBYNW9qRzN4aWtDaXY5Wnc3?=
 =?utf-8?B?WGJXdlppZmFLVzVidW5YMUlObVNpNGNhazFuTmNsQmJ1d0k4RnVIa2dtZXNS?=
 =?utf-8?B?WmIvcFZ2WXQxT0ZHeGE3YkJLTU9lakFnbFNRQnFWZUluanAyU3dGK25VZXdt?=
 =?utf-8?B?YU1nSUQ0MzdWaDRqS21PTFBwNWxDcndyWmNoaHJPWXIvYTdNUFA4eXRjNWVu?=
 =?utf-8?B?cEdnYXVnTnNlc25IajBTUm1uNUdIYVhTbFdFY3p2bVVValRWQnk3dFJvMVJn?=
 =?utf-8?B?NkJtRDF1OHozbjNVVjBhblFtb1VGeXgxdG1rV1dxQTB4MmtnRlZidkk5ckV5?=
 =?utf-8?B?aVZlbnFBREF5Y0Z6RFRhSURGWldqSWxZc1paNHFxTUp3Ymd1UjVwQlpmS3RU?=
 =?utf-8?Q?/fMY5qRVfp5CvvMmRyPG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBvcUdaT1hidHl4MG1YVlNGSjNuTC9XaSs4Wit6QW9SUmFsSVc4ZWNTak5I?=
 =?utf-8?B?OUMrS1NhTXBTN1FFVnN0TEpoMzJOZloyWURyQzh4djRrNjhPYzR6aHlvTGl0?=
 =?utf-8?B?Q2lWVTkzNXhvMSs1L0hULzFHM0paL1Fsc0p6UlVLaTgwNlhvTlBmY0N2aWpW?=
 =?utf-8?B?L2RUMURGQmRiSktzZFJXbDIzNVVlZ0JuRktuWnFnVzl1OUJQNjFtSUk1ZDNz?=
 =?utf-8?B?NG1HYzdFcUJDNDRXR2tDNWJWVGh0OWNlbkRjU1A3WEQ5Szk4MHl2UFJLaFJR?=
 =?utf-8?B?ZTJUNkQ3eEFIaUpHaUdwcCtHc2x2T2dVQmZhRnJ0VXZEcFRUQVhkTmx0RVJh?=
 =?utf-8?B?L05vb040ZW1SS0tQQm54ZmdaLyt3eng4c3R2aGR4K3lCN2VRSkE2RThrd3JC?=
 =?utf-8?B?MVdKUmlvWjE0R3pPYk5Uc1ordXFzd3VwSU15a3hWQ1dabzlQdmU4S1B6RFNL?=
 =?utf-8?B?MGlidlBlUlc2VnkzbWNXdkVzWVhlTVdLdURMaTh1ZlQrbGVHYkRjRnRZbXRz?=
 =?utf-8?B?Q1U0SFQ0VXgzN3dTTUVBbkpvUGZKeFpXSWdpUFBOdGZ4aDZWZWR3dkJJY0lm?=
 =?utf-8?B?ZjAxMzNlWEtzeXNFcTNCTk5FNzBuVWpJY3U3dkU2UXZGM0FBQjQ1K0QrdFJw?=
 =?utf-8?B?SExLYVRZN0hmYU43VGhkWXdZUWVHaDZLNUR5ZXB4TS9IalV0K1cxWTUrTHZG?=
 =?utf-8?B?NzFEK0VJenk1V2JtU2NwSXg0MUZvTklnby8wbmYrSWdxeURUZEQrYUQ3aU91?=
 =?utf-8?B?UlBWbXVnODFkR2V3bitUYU5PZXBlMW1QWHZMTmVwVVFwUmxHa1ZqU1ZlY3dk?=
 =?utf-8?B?NGR0TmRFY0RGYmtmbE1rcEd2UmVnRmY4V0pyYnZTeDREcjFuTUI3SkkwUEFk?=
 =?utf-8?B?UEhyWXFBUjBSSGxWYVpFN0lTeU1ualRpS2lKVktJOERUcnVsNDlpekJ2Yyt6?=
 =?utf-8?B?Wi9qWENSN2pCQWdFeWRnYUVCM2w0bnZsU2RhUkZYelE0bXp1eFduZitzOTA5?=
 =?utf-8?B?amJ2RVoyWktGd1pVZXdQSVBxam9CQXo5eEJtczNjb2RzbkZWbVBkNmpxUElZ?=
 =?utf-8?B?dEVrL2xzNWVhZjVoWEFGVXE1TEZ2NEVld0ZuR3Vsa3BtZGZONVBBUEdoUmZ0?=
 =?utf-8?B?ejMxcElwdUhxcENSUjV0K0ZHVWM3Z3NVOGQwREY2WGpQb05kSHZFamRBWE11?=
 =?utf-8?B?dG1GcXE1ZmtOYVlxbGxCczJrQjRvYm55R3RVNXlDVUViUkRPdXI5NmJxRlMz?=
 =?utf-8?B?RzFmczFIUDNLaExjM3lTK3NybkMvMTFHZkNmdkdjbktMUzVJdDJ6TW5nVEkx?=
 =?utf-8?B?TjJ5VUt2ckIzK3NaM1A0SHQxTDUwYUwzbWR6THFMUlMwOUxZQTM1K3ArT1hC?=
 =?utf-8?B?Qi9sWkpFdEVjcWd6Q0lXdE96VGxxcE55M2srRmdGMEg5ZWRzTFVBNjE4eXR1?=
 =?utf-8?B?L29SRnVKQTdWYzZEQVZXZStQeFFnazV0bmE3bHhLTnNTNGdOUjNpeFNSaVds?=
 =?utf-8?B?L3UxcWdhYytSejJNSmxpd1l6M0JKWUV1NmNwRm8rUXAxUWl2UTV3eWRwa2Np?=
 =?utf-8?B?NGlPZUVNTjMzRG9Zcjlad3pJRnljd2o5Zjc3L09hSkZadjJOVlJUVnpTWUVR?=
 =?utf-8?B?Z0ZTVzBVRjlJd2dkanZXeGZFSHcxeU5BU1Zab09sZTBPMnVEbTJmenFWQzVo?=
 =?utf-8?B?cDd5SUdNdDNnYU80eU5FekN1Mkx6bE51dDg1VlFSUmp1SEtKdDVSdDNCMUFU?=
 =?utf-8?B?TURKQUFWSjJOdFVNV3RJUWtadzRWU0xjWGFoOU00ZVFMdnFCSlZpTG9WaGhV?=
 =?utf-8?B?cHlpQkZKM1p1K0FuQ1VOS0pSNE1lN21Ra3dKV0ZMNUxLMGsxWmtJcXlHMll3?=
 =?utf-8?B?NCt5NlMxcFNZK0oyR0ZCVllIdkJtTzN6UndPQlpXWTh6WGMzejVlSmU2aXBF?=
 =?utf-8?B?U1pPUHc3MnhudFNFeVFVYTBVeE56WnFwNWdHa1hZVFZ3dkhkL1RsU0xiQjBy?=
 =?utf-8?B?akpSeWFUZERscHpFMWpTRktTQXhKR0hHSUJUUjByMnFJQmNmaldLQmlaRDlq?=
 =?utf-8?B?MldxRGhVOUlSQjZmdVlzaHJpU25sWkhCT21KQzhRMWJwenRrK1pWRElBMUI0?=
 =?utf-8?B?a2hNUnB1eTdhY2F4Vm10M0h4TFN0UWFGcnIrK0FGUjNJV2dKYW0wV3hkRk14?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6385dc4f-81f9-439b-7c70-08dcfab1b498
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 20:13:52.8432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyljJzvIujyEvi4c9GeUrBnkrXGybl3hYWFmNeKURde5s6CikSEqHuVgUjE+tV3QV9JpL75Ohb6zdEUv85GE9LMhJ+uD5rg2o+TYw126tDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

On 11/1/2024 12:40, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Friday, November 1, 2024 11:46 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>> On 11/1/2024 11:04, Jonathan Cavitt wrote:
>>> When performing a guc_mmio_regset_write, we add all the registers in the
>>> reg_sr list to the save/restore list, but do not do the same for the
>>> whitelist registers.  Add them in.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> CC: Lucas de Marchi <lucas.demarchi@intel.com>
>>> CC: Matt Roper <matthew.d.roper@intel.com>
>>> CC: John Harrison <john.c.harrison@intel.com>
>>> CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++++++-
>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index 943146e5b460..2fc6b1ccc8fc 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -239,9 +239,12 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>>    	enum xe_hw_engine_id id;
>>>    	unsigned int count = 0;
>>>    
>>> -	for_each_hw_engine(hwe, gt, id)
>>> +	for_each_hw_engine(hwe, gt, id) {
>>>    		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>>>    			count++;
>>> +		xa_for_each(&hwe->reg_whitelist.xa, sr_idx, sr_entry)
>>> +			count++;
>>> +	}
>>>    
>>>    	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>>    
>>> @@ -727,6 +730,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>>    	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>>>    		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>>>    
>>> +	i = 0;
>>> +	xa_for_each(&hwe->reg_whitelist.xa, idx, entry)
>>> +		guc_mmio_regset_write_one(ads, regset_map,
>>> +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i++),
>>> +					  count++);
>>> +
>> The code that actually writes to the NONPRIV registers
>> (xe_reg_sr_apply_whitelist() in xe_reg_src.c) explicitly clears all the
>> unused registers with a comment of "clear the rest in case of garbage".
> The code in xe_reg_sr_apply_whitelist calls xe_mmio_write32 to write the
> registers, whereas the code in guc_mmio_regset_write uses xe_map_memcpy_to
> internally.  While the former seems to be writing to the
> xe_mmio_adjusted_addr(mmio, reg.addr) + mmio->regs, the latter appears to be
> writing to IOSYS_MAP_INIT_OFFSET(ads_to_map(ads), guc_ads_regset_offset(ads).
>
> I'm not particularly well-versed in these functions, but it looks to me that these
> two functions write to different locations and thus would not impact each other.
> Or, in other words, I don't think the garbage we're clearing in xe_reg_sr_apply_whitelist
> is the same as the data we're writing in guc_mmio_regset_write.
No.

The apply function is writing the list of whitelisted registers into the 
whitelist registers themselves. The GuC ADS code is adding lists of 
registers to the save/restore list for an engine reset.

Specifically with regards to the NONPRIV registers, these are a set of 
registers which hold the addresses of other registers. When set, they 
allow untrusted users to access those 'other' registers which otherwise 
would be off limits. The whitelist code is setting up that list. E.g. 
adding the OA registers to the whitelist to allow applications to use 
the OA mechanisms. So it does "NONPRIV_REG(x) = OA_REG". It also does 
"NONPRIV(x+1 .. max) = NO_OP". That is to ensure all the NONPRIV 
registers are set to something valid and not uninitialised. Otherwise we 
potentially have unintended registers being whitelisted and users are 
able to access things they shouldn't. Whereas, setting them all to NO_OP 
means we are granting all users access to the NO_OP register which they 
already had access to anyway.

Completely separate to that, the GuC ADS code is creating a list of 
registers which GuC will save and restore across an engine reset. These 
are all the registers which get trashed by the reset but which are not 
saved and restored as part of a running context. The NONPRIV registers 
apparently fall into this category. So we need to tell GuC to preserve 
their content across a reset. Otherwise, after the reset, the whitelist 
will be lost. But, the reset state of those registers is 'undefined' as 
opposed to 'NO-OP' as suggested by the whitelist code. That means that 
any NONPRIV register which is not part of the reset save/restore list 
will be no longer be set to NO-OP after a reset. Instead, it will be 
giving users access to some random register again. And we do not want to 
do that.

John.


>
> -Jonathan Cavitt
>
>> If we don't trust the reset state to be valid then we need to ensure all
>> of them are saved/restored across a reset. Otherwise, that garbage can
>> come back and cause problems.
>>
>> John.
>>
>>
>>>    	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>>>    		if (e->skip)
>>>    			continue;
>>

