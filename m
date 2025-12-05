Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F36D33995
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 23:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2310EBDA;
	Fri,  5 Dec 2025 23:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvnWw3cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3E10EBDA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 23:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764977711; x=1796513711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g9zxUFHQ9S0InIyjocIY4YNUtDRzbGivPIYcMJMtgFg=;
 b=PvnWw3cQczcDHQ92vUuOtBok9DcysJRmql3+SPj+yjF4k76ctoJUqNGS
 SIoH23mFDVYJxyxkbjWphrgUwFLK0C44kToIMvvwhTvJhnowY1lZuyUUK
 cq5HJ+Z+PtuiyXuJUnvkBGcDSAlTpTjXS4ripyEeO+CaFZvcPHM+y4728
 MLuHhFKH3iba/8IJjawwPVUKdymJK/J9ClbhxnnAQMv4mjyi6sC6Z+3FO
 +U9JcpU+lsodrqOWyU1c1ApIHA5UeJSPAdcGR6O7ULwBBxj7iEsxJIOY2
 luqkG0FmQJnpUfTFWGbrUcRxdeGTJZdw9Nufu2Ex18XZuv2Z1eWj7aVe7 A==;
X-CSE-ConnectionGUID: ZcXecJBmRVu4gz8zR9y0Ng==
X-CSE-MsgGUID: jtqzt6zxTduvzcyiF+T0WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66976966"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="66976966"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:35:10 -0800
X-CSE-ConnectionGUID: hUki7hiJRkKifatB55Ib5Q==
X-CSE-MsgGUID: 2kEZzhjZT1OlLOYCOFnQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="194478033"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:35:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 15:35:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 15:35:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 15:35:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjyJqJItrO852srEK4d7cK9Yzbcwwih8uRTQV5Qs+1s2JiAqjhUzTx09s9REZxPjg1HSzI3MDGyxFao1tH1PdRs2LFT6gLXVsPZNdUl+E+QWuDsIjxgf4RYZ5uRZqqLApNe4ogJuUnO1EBEADa++nX6oFLkdk8MtVXgLSEsSSkMiYfqDFBkaM8ijQASGVdJvCw80EYsgdqvjcz7R6A0+mG5T+gT6QrTzYZfWWO3QrXUqviTUCyN2F1/T7zYRfRGEBWVWJI+1xzpvScJmyN3Xezl/Vln34VMSf/OfT+hTggEH97/2rvMmbqAVcb2NS82eInMegpZhj5WbiEtNoLeFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3DA+UWhLo20suy7w/fYhaa6RVvwCF8n+2qwYuOUOCc=;
 b=fbMShoWMd9M7joPsarlvkcedu9xe1bYczKCk/gZaQCKsgF3pjWeJ7ENxtUoNrkK+ij4PPDK1Zy29LjdBtPdpYSOGRXCHWUw4R35kGd6Z01HwErQgIJa8G6zEgDmUcqo/oVftaC42thqU4T9s7ZHydYdr0XMTl8F9KxDLqgDKJzf2u1SjimwcKVVa+MVp4jJsUj9EOtk0NRLqdfYn6SbNPTmpyWP60loYX8V8DAMoInEPKhThnxwObN2QRI3ave59c3IQzgWdRpW6+vMmgV0UjGg5VeVtDcfbj/aeyYAEwzZCssrnJG79uDVL8qX8aOTJMYO4kVoxBste/hdIlyvIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 23:35:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 23:35:01 +0000
Date: Fri, 5 Dec 2025 15:34:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/rtp: Whitelist OAMERT MMIO trigger registers
Message-ID: <aTNsIOz+SRU7oTDD@soc-5CG1426VCC.clients.intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
 <20251205212613.826224-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251205212613.826224-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:303:6a::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b1c5b8-103e-452e-454d-08de3456e908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRJZDJ3ZW9yVzJnaVYxVkloQnFUcTNFZHh1UFB6dmFjZHh4Qi8vVnRSMFdx?=
 =?utf-8?B?MnB6ZTg5cnNjNWRXc0dMSVRpWHErYlRESC9BZHRpU2tzdFNqSERqRXBVN2dR?=
 =?utf-8?B?LzhOY1cyaVVZK1RGNDBIekREN01mUVg5aDJKV0Rzb1FydU1DKzRtR1lOVjdH?=
 =?utf-8?B?eDRWMW1Jb2NHODlJMjBkb3BFRE1iYlVmZ0dtOGJmYk5kdWNQUzd4WmhtYkRE?=
 =?utf-8?B?SEp2M2hjOEVoUWtma3BWaUtxOEx1cGxqZVJRSE41cXNuUEVqNUwrcVVUekEy?=
 =?utf-8?B?OHQvSU1nVTMzM2pvVDNsVEpMM0Y1RnZ1MjBQZ0pUM2dwMFV0K2o1M3JpeEhL?=
 =?utf-8?B?a3BkbG5vU2g1RnFvdkZXaktRcFNMdDhvWGlBT1I0enBnYjdrTXRNMWo1Tmg2?=
 =?utf-8?B?QnJkdUxiSm9PVnliR3NudERtVXp4OGxYQkwxVExkSWM4QWJ0a2gyRU14Y3JS?=
 =?utf-8?B?RnNVaTFYd2Y1dXZXd1JaU2ErZi9HeWsxVkJUNHBsbWt3ZFVHaUpaRStkdDNo?=
 =?utf-8?B?ZW1tSEoxMURYUVNLeGhHL3NsZjM0eDQwc25SaXdsV0pZcjZSeUNFU1NjeHRt?=
 =?utf-8?B?aWNkNm5CbnhSUERPeUV3Qm9LNlpWL2FTRmNKaTNFeVdMRURuWHRyNlNBWUZ3?=
 =?utf-8?B?MjY3U2dJZ1czOGZjdlV6SFNTQmlIaU0ybnRRT25Ba0lGUklBS21seGw5akFH?=
 =?utf-8?B?bmFiakowdlpsNG5jMDBSV2k4SkJOT3FKa0p0b082ckxxZzBDUzhBL0RTMG1i?=
 =?utf-8?B?WnFNejNhTTc3ai9wVXlGTi9reDFQYkhiTWNBSkNQcG1vcHhDTUZ2NXdkTDlx?=
 =?utf-8?B?OUZXKzVmblE1UlRnNUxoZzhPdWIwTm1wdElCck9jT2hERHZLSllNUTJYQWJl?=
 =?utf-8?B?Skl1YWdQdzd6dEhZMVpsaDEycjlreGNmRlNoRFp6amlhaURRK3RQckFqczRH?=
 =?utf-8?B?UDk4SWttZmJUQm9YcUJkRWMzcUZ5ZWFvc2FOQkRLd3JYeGZCbmR6VjIzM0tk?=
 =?utf-8?B?OGF5aHVmUE1MOG04eHRrT1ZtejlZbUN6cWc1K3o4WXlrM1pJMWNOUmV0L3Ar?=
 =?utf-8?B?WTNhUTFhc2hwL1JVUjRTRm4vTzdPUUVJVStHUGVXa2xxQm5aRTFvdlBhdTl6?=
 =?utf-8?B?WkdHZ1poRitRdnNjV2lndXdlTXZZTnpsQkdjZ2h5b2lJaXpwQkpKdm9WdWFz?=
 =?utf-8?B?MG1EajZLWStmQTlTM3cxRkpuRzRpWHJ0TDBUbXdWZytEM05LUkJrUG84U1Y2?=
 =?utf-8?B?L1ErK0FyS0dRdGY1Ty9kd0NQM3VQMGp2NytqeGh5RVRtc0RJNy8wZzZ1Mm5t?=
 =?utf-8?B?NHBqSi8ybGNORUZzcTBLMW9ZTUdTZER5c0FFRk1kTXp6M0tTc3FqYi9PVHFU?=
 =?utf-8?B?T3pNZE9oQmJOdkVLWDJqKzJHNEkxbGVTVjV4b2tHUC80cndNelZEUTVSUEF2?=
 =?utf-8?B?L3NaRlBTTkMyRkdCT2ZwMXNGZEx5VFdWblFBalFWa0gzZE5OQmRGY09FcVhl?=
 =?utf-8?B?S2Y1RW5yT2EvcXIvUjhDcmVZMW1LaGorVzFsTkV2OU11S2kxWWZwME5BeU5u?=
 =?utf-8?B?NXFCRjcrbk5TVXEvUzMrcWRYbFR0WnEwdGcxdDJ4VWtYNk1kR0hMZVhyTmRh?=
 =?utf-8?B?WTZpUklrTUcreFhwSUVVT0tsYWxWbmZOZGtEcy9uYUt0R2hEREZ2NDNQcW9o?=
 =?utf-8?B?THZsODlWeFdMV2R2TTE5b3BkclVFQThGa0JSbWduSFhMRVAzMFVlMkR4U3Zz?=
 =?utf-8?B?bzBocG9FUzhwc3BZT05GMThacWxnOGFRVzVkc056MDZpalYyTzVoczd0WVAy?=
 =?utf-8?B?VFowZFlRUkdXUUZHMStxekkzOWFtYnB6U2l6cENXd1ZpczFKV0lRQlp6YWhV?=
 =?utf-8?B?UlJvYzFJN3h3YVAvWSsrZkJnK3RWSWY3cHhYbjJPTWNmMk5NbWZ4UmgvVzdS?=
 =?utf-8?Q?vdS1W6k2OsSz3y+zBxKWehmyluhsQGSO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?endIdGh5cDB5TCtKY3VBdkZNeWVEL2FQbVoyTEtYSWcxMUgrczJyNXZyc2Fn?=
 =?utf-8?B?b2pwV0xIdnpwTVVWOElrSEc4cmt0L0RDWEw0WHI0NjZPY29UOVYxWVhncEwx?=
 =?utf-8?B?eDVpZi80dnNiRTJOQmtNdXhFMVFLdEpkMGVhTGloWFhiSUxLRWp2S0lZdHZU?=
 =?utf-8?B?clFvSXZMN2Ric3Rma0kwazFzZ256UmJ2VklzTnFCbklDZlRsN2phbUpOMXRU?=
 =?utf-8?B?QUdpZlZtVEVIYjVvUFlFdDdDYzlrcnJDQXlxMUpsb01WTVdQL0xmQzhOQkZw?=
 =?utf-8?B?Si9iODRid1UzZWpiUHppMHk5MVVPMjU4aHRKbldUMXMrNmRKWXVkcUNnS05S?=
 =?utf-8?B?NzBQcHhodXQ0d3EzU0hLdTloQzFiU1phUlczcFhkRjArcmRXQnp3QTVVR2hn?=
 =?utf-8?B?ckFZMjZFYmQrM3grR1lIb2hYcllkSzF3cFVEU05vcnM4eDVvTXpDTmkyZzR0?=
 =?utf-8?B?YVJqTi9LQUlzNmhMY1g5KzdONjVRbE9UcnJEdzJZZDJKMDBpVUtPcTVLNEpL?=
 =?utf-8?B?NWl4UUpYL21kSkIwY3JXVWd1bXZCQjlJSUxCWlNBby9vOWtkSUlaWDFoTC9k?=
 =?utf-8?B?Qm1RcUp1YXVpVWhnZUZIZXcxLzZEcnNJcG5lZm1xZXZCV3ZzUjRWcWpJbnkv?=
 =?utf-8?B?T1VuRm1YdzdqcUg2Z2tpVkllZy9IYmpIUU9CSkE1Nk5CRGNXNlBvcjZaQVpl?=
 =?utf-8?B?R3NSUFN4bHZYT2drcHZNcVkwVDBZei9yeUI0WVZYTHBaMTFMby9ocXZaQStt?=
 =?utf-8?B?THczM0g2L21xdXJpNTY1NGUxc003T0NaeFZXc2VyR0xJYndLSHczcjB3K3B5?=
 =?utf-8?B?YXdqWWsvMHc1NmVFOWtwSmdIS1Ftc0pJZW53bXYrdldQc2d0ZzVZYzk0bDFD?=
 =?utf-8?B?bFBPQVBIWGVZMGViOWRVNGFYREpuS2Z5VTdqZnJWTjkvbmx6TnUrd0tiL0VT?=
 =?utf-8?B?cVFYbVptKzAzWU03VFJCQ05iQ2lhMVdsYk1PL0E3T0Jscis3NnI0S3BSOFox?=
 =?utf-8?B?NHlHNFE1bldIWW1vQjhicmZsekJNZ2VIN2xES2hwZXFDQmFMT0JsdUY3LzdP?=
 =?utf-8?B?NDdnalk3S0VCdEZqK1JiZlVrT25tQjhvMDFGcFVaWkJuNklCazVzbmlDU2Nk?=
 =?utf-8?B?QWR3N1JOc056RkgwZ1g1alk5azIvcDEvQXB5K3NhQUhIMVdROHkzN0NFbnFy?=
 =?utf-8?B?bVZGYXJwSks0VWY2eXZOMlJyRHIrdzRRL2dEemVHTk4wcGdNMHhVWE9KUGJ2?=
 =?utf-8?B?VkVpcWZOVnN6WDNCRk13aE56bExLQXFORnVJWHdnSnJVdHhrY1MzUGpOeE1u?=
 =?utf-8?B?WDZvLzYwSlU5TTd6aEcwNnZPWTNMZFRZL09YUEwxNFZ6MzBmb3FBcFAwbm05?=
 =?utf-8?B?OC95YXlLT29zOUFvUnNia25ReHpDa0R1NFJmZCsrWnFySWxGc1ZUN3IweGxW?=
 =?utf-8?B?anJoQURua0dpZ2UrNWpZQ1pVVXZSYzZ5bzNqbmZnd3hyc3pNbk9vbEZxbGcr?=
 =?utf-8?B?YmFrMGdmQm1kL2hzYW1PK1lGU2V0eFF2cW9HL0gzbk5obFk1cGdkK0JWR1ZL?=
 =?utf-8?B?NnVKWHF3ekNsbkx3dTNtaHFESStOTTUvS1lQbGgwRzV1a3p2djRSZFBWVnBr?=
 =?utf-8?B?TkdnZWlWTFdyTjQ0cTVOUU11RCtCNGlFL3lrWHJJdjU3czlHWEhMZE80UXVl?=
 =?utf-8?B?VnhsVTFFRVhtYVd4Tjk2RkVZNmgrUzNYelhVZGV4anZ3L2IwT3FxVXA1RTBS?=
 =?utf-8?B?L0M0YlZBZFJOZEg0TUxMcDh6SUNFeU5XN2NMU2tNRUVGRElneEc2ZmtuRzJO?=
 =?utf-8?B?cVNMTnNnM21nMUxXelAxWGRtS2IwZlQrclJpbTgwblhkUHh4aFJRY1dzU1I5?=
 =?utf-8?B?R21FNWdmZlNkQWVxd2piRU02M1p2VTlSM2ZVWFhNaWhpZlBVaHJQSEp3WGtW?=
 =?utf-8?B?U2dkamhQR25JOHl6d3l4VUJINnpESWRNblVzbWUxWTJYblZaOXVONmtYeEhq?=
 =?utf-8?B?S3Zyb2U4UGttdzN3RWxNVkxjVm8xVjVQUytVdDBPZ0p1WHQ5Q0IyMnE1RGYz?=
 =?utf-8?B?bW9PWUdreGxMcW01WWVsMTVWblRYTFYzQnhTT0t2Wk13R2ovSXI2dFU0VXJw?=
 =?utf-8?B?Ni9VdU0rWTk2MXNteXo1TElBRHlIaEZHVjFvVjI0TmUzUmloZFNtbkw2NnZT?=
 =?utf-8?Q?u/DYDUBXwvPLv+Zgj5ZxHII=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b1c5b8-103e-452e-454d-08de3456e908
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 23:35:01.6793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik7B6HalOlM6qFm6KpltCApTnzXBg0xcC4lEa3HaaBgzAe7fFV8XHHAUbgnAFVnwcu/2L6e8BIcoyAEPQxC/0SBYKyj73WiRtS3JNf1s3ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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

On Fri, Dec 05, 2025 at 01:26:12PM -0800, Ashutosh Dixit wrote:
>Whitelist OAMERT registers to enable userspace to execute MMIO triggers on
>OAMERT units. Registers are whitelisted for compute and copy class engines.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index da49c69076a47..1391cb6ec9c62 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -9,6 +9,7 @@
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "regs/xe_regs.h"
>+#include "xe_device.h"
> #include "xe_gt_types.h"
> #include "xe_gt_printk.h"
> #include "xe_platform_types.h"
>@@ -26,6 +27,13 @@ static bool match_not_render(const struct xe_device *xe,
> 	return hwe->class != XE_ENGINE_CLASS_RENDER;
> }
>
>+static bool match_has_mert(const struct xe_device *xe,
>+			   const struct xe_gt *gt,
>+			   const struct xe_hw_engine *hwe)
>+{
>+	return xe_device_has_mert((struct xe_device *)xe);
>+}
>+
> static const struct xe_rtp_entry_sr register_whitelist[] = {
> 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>@@ -94,6 +102,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
> 			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
>
>+#define WHITELIST_OA_MERT_MMIO_TRG \
>+	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
>+
> 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> 		       ENGINE_CLASS(RENDER)),
>@@ -114,6 +125,14 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 		       ENGINE_CLASS(VIDEO_ENHANCE)),
> 	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
> 	},
>+	{ XE_RTP_NAME("oa_mert_mmio_trg_ccs"),
>+	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COMPUTE)),
>+	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
>+	},
>+	{ XE_RTP_NAME("oa_mert_mmio_trg_bcs"),
>+	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COPY)),
>+	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
>+	},
> };
>
> static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>-- 
>2.48.1
>
