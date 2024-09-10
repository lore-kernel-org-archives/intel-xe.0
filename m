Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D9EEDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 19:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DE410E905;
	Tue, 10 Sep 2024 19:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRACazs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827DA10E905
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725996783; x=1757532783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=SRACazs6RKnuo9X4qr87kDHZkV8kzkxeKBuwbxZ1wbcUwKFvrgUDFtDX
 dahqwql/b6cigUFCb3rFuRYkLXsrkRewE8SUAQPbL6jmeI1a2j9jbLS2o
 nVFrWUDXJkZl5e8R/S4tbNjY3yV+cHouM7ihKw1w58NbIrFfcr+QnfPGG
 qbs1Ep8pMiWLmHBYX/ykDJKEyR/9iGOIFiIB8hH9/qBT9A+vK+5Sysvrf
 VpLLKRpHrLlRZ1kSZYICfA0FTUkU4iHqb/tUjhXycv3gAZR4PXlnWbvR8
 625pMEv78z/WnZ4+RYl6gvf/sMXyw12GRLomyhQbbxvix++PRT2fbxjmb A==;
X-CSE-ConnectionGUID: OhKL8daJRB6zuPsufAAnGQ==
X-CSE-MsgGUID: do6pQ7x+TO6JHv2mMwdAwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24643695"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24643695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 12:33:03 -0700
X-CSE-ConnectionGUID: x/rV2GQBTDW0CKErZLAXuw==
X-CSE-MsgGUID: +5sSh478Rb2X6AePPj66lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67425002"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 12:33:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 12:33:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI176uSj4D7c/6H9mUlFCoAYrj8T0MempHaq8Av8QPNGNfLoSxhQoIVDkHC8IZd2zVgS9tQJS27M8BVS04MCR4b1e3qwud5lLMJLckwEIxMWe0JBIiz0bhK9VhPqvgQqQ4uLZcxqo7stQcyGzSnine3+2Tkv4AgVmtELIpb6TvZozrVfooNCvlGL9wvp9kmqfCijK3634bgDsFKF1HzNHdqzv2iUmmCXfxn7ogLb6d5Q9wx0DUv90gWgr9ibs5yLz7R8A+4t8/s+D3CKNDyB4xX/kdx27xvmrI1uFo4KuBOqLtMrel60jKFQFjCt4qqZ3DF+gjgSrReFcSFGAAcAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=wxnjf4rArRBH8O5brtmctQ8m2qs5ZrlyKDXoVWy8A4Fc0Qd9qrNdKBAB0onkynlP7P2UDlnCItEwfvkpJhkCnOu7+IxaI0E7znAIYjbjINEq8LpANfhZsl0sZ4LipuG8Cwo/LsR/13VgBEd0yB+5pT08ypH6WsJHH5afXS/lTM90249B7FIPJ9MOjGq9gXa+R0qsEke+lsdEqcP1XGMa7Ozd0t504CpDaoAvu8sAF2eVuXfJxuj/wWceceVenF7R+JVzFtitvW3wE9ju0J1zuSRixOSyQM59cEYoOkZXLGck8vhPg9cZ2JVYj1diRNV3v9uNLhy0L765dbl7689njw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 19:32:58 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 19:32:58 +0000
Message-ID: <b8cf085e-ef0b-41d5-b191-d8313ae59f2b@intel.com>
Date: Tue, 10 Sep 2024 12:32:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/10] drm/xe/guc: Remove spurious line feed in debug
 print
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c303bf9-f27c-466d-07b5-08dcd1cf6023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFKUXE0VlNMOThoOVc1OFl2elluZW9lV3dSTlZHclJZNXV4N0tJeEFlZFcv?=
 =?utf-8?B?ZDhsREpsWGpRUFM2MEs4UkF4aVFrQ1g0VlBSaXBzU29JN3lTV0R0YXZETE5E?=
 =?utf-8?B?QmF0d1ZBRXFIUExqOWFUUEdEb3EwSkVVUnkwQ3M3aDNmMGwyYVpMM0dRTjVv?=
 =?utf-8?B?MFQxWlBnQjlkbHdXRUNyZXBiTUZ0Nm5waUt4NUtPSmMva3l6YTlYb3lWbFVW?=
 =?utf-8?B?dHB5ODliblpYRmNKVFJOMWtXQ0pYWTJGcTU2MmZHa2laeksyaG4wUXd3Skx0?=
 =?utf-8?B?cldXNVQxNGRNb0dTRXNkSGw0MGNycG5oN01BaDQycytuWWUrczJKSUxLTnNK?=
 =?utf-8?B?dHQzMHpJSEtGMmY5TEM0ejFIaWxDdnNIZFFFYklyMXJJWmNib1pNUG5jWE9a?=
 =?utf-8?B?dzRrdkZoZldubGNKc0NISVVoMWNIUDZCcXZlWWdxYlJZd1JvdktOZWQ4RjVp?=
 =?utf-8?B?d2RWQVpTQ2FINVNOdFhwY0EydmxWL1F6UzRjcG1JbFBCYU1YN3Q4WXc2N2pM?=
 =?utf-8?B?YmF3UDl6WFdzVlNJSC93MFVaMXh1YmNHRjdIc25BeEJVckQ5VDNkNGFEdVho?=
 =?utf-8?B?RG1yTDJaQzdpYlZydWJFWXRlSFdkY0dadkg1ODhoK2FpZ2gzQjJlekt0M1JM?=
 =?utf-8?B?eWdVdXVYaUJpV2FGMkFoa2tBV0luK2pvRlRZaXZCMTZSVnNSYmVVOFRXT0pB?=
 =?utf-8?B?ZkxHR2g1VE9Sek9iZ1EyVm9sUVJweXBMY1AyWm42aG9zZFhkbGFBUTk3U3RD?=
 =?utf-8?B?ZVcvZmZrSUllaVRTRVBLTS9US2h1T0MrekhjV2lONmtwOFRZekg5dXpZcngw?=
 =?utf-8?B?MVVtRmNoUGdTSTUvR1F2c3RSQkNzbzdnMERjb2FocU9YTDhlUmpENFlUbUxy?=
 =?utf-8?B?ME1Na3pCWFZRQnZPK3A1UU9NRWpKK1M5UWR4bDlxSncyZ016TC8vT2ZzSm0r?=
 =?utf-8?B?MWNIRkEveEUrZWY4NEx5L2FycER1R2JVd3VJSjMvWG9QMHNub2NaYXk1YkNq?=
 =?utf-8?B?SDR6OVBNYm5rRllJVDV3UXVNNHQxeVQzZlF0bFltRElENzBoQlhpSUhRcm9n?=
 =?utf-8?B?MzdNTGVmK1VMRWh4NGV5bTc0Wi9LTkZOY1FuZXVITkxmbWN1bHNFYkhER1NI?=
 =?utf-8?B?enlFbDJ6K3V4bW1qMDRNY3lGbVc1RC9oeHVjOEpITm9ad3V5UTBWZmJJN3NE?=
 =?utf-8?B?R0liazRpZEY3RjYvbzRNMEk0WnVQQUJEY1ZweUs4cllRQW50M09SaFlLTVQz?=
 =?utf-8?B?NVRSaWdqcXVYMlI1ZSszK2FQOXpuOElWcVRPV0NUTVFqUFFCRy9qNXNnRWY4?=
 =?utf-8?B?YkE5OG8rbEg5NGxZdDA5aTRqRGs0U2VEeUtGTUNraVhrdlB4bUhQaEhpMEhE?=
 =?utf-8?B?OXdJNVREZHlpUEdGNWovMERrdUNhWFdVNzdpendjNGd3cTVmaGdFQmVWelRL?=
 =?utf-8?B?Vjh4ZlBqeHJKSmVvMzNWbWIvdUZseTFtclJlY1VwK20vcjJ4ZGRTZGlhOVRW?=
 =?utf-8?B?TWt1MXFxSllmcmx2UkZOZmo1WE9oRGs5VjV6WGs1YnZUaGRxMGQ3ZExkWFA1?=
 =?utf-8?B?NTBxQ3B0bDVWd1pCcncxWm1mRy9vL2NuSVNyUUh4RkVSY1BKSXNGL2Y2QUlP?=
 =?utf-8?B?RWZRZktlSm5DS1Y5dXppUTUwZGd4djlzQ016a1dlbkpiQldRaUlaMkJDWWdh?=
 =?utf-8?B?b1lield1TldvQ1dNcnozVVVyeExiUEZ2aVRERTBubUZsYnN0NWV6bDBidmM4?=
 =?utf-8?B?U2YyOWZEdWo1d1RrdTB0K1NoV0thcE9oeVFCcnd2clRlUHpBaU8wMkF0aFJI?=
 =?utf-8?B?cFliMEZob1BxU1dKbmdPUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2pQUU54a1pQS2dVUUR0aW8rSDJXcXBMN2ZJNEt1Q3FDRWR0QW9YeHJwbUIw?=
 =?utf-8?B?eHRtdlIyY3dQMk0rZjVMWHR5Z3VhS1ZiUStwT1hRUXkzaTRlQm5nWWZ2YSto?=
 =?utf-8?B?VTZtRlRjTVRuS3EyY3RtWi9CUkpGazlVQzZRcXlUbHF6N0gzUnFZYllycXk1?=
 =?utf-8?B?UUd1T01KeFVHNFlzZ0pjWGpST1Y2NHNnMFU0OVRHQVdlMk9KSFlBRU9FWXRv?=
 =?utf-8?B?R1dxTWoya3J2RTFuM0trVGJMSElaTzFUb2ttOE9iZlNYbWh6bWx3dWJyRTh3?=
 =?utf-8?B?L1h4dmNSb3d3MUlLZzB1b2crMnNNck9LVXI5c25ici9HK2luV0ZnZUZXZGky?=
 =?utf-8?B?QVZzcTE5ZWQvQnE4Qm1PN2lPWFc4cVN5T1V0WXVsWTdYTExFRExOMmUzYlJr?=
 =?utf-8?B?Rkl6NEIwMXRqOExacjN6dmVFc0tTNUkrZzk1cUV4OFpIV2VhWk1wbGNSQlRs?=
 =?utf-8?B?eUl0M1YvNmVwdTZVVmhBWWprTmtKUVJ6QkhJTndrdEwzdDNqVGpXaXlURGI2?=
 =?utf-8?B?cWZnanU2V041anZDYThXbHRRN2toZFh0NFc4UE8rQVFWc1VzVERYSndDenFI?=
 =?utf-8?B?WXorVnByNXAzMUpSYVlDd2tBemk3QVExME0zbFlZUmI5dnhmK3dtekV3OHpP?=
 =?utf-8?B?K1UyblB3UXdXSHRLZkU4N2Y4c0VxaUV2NGJEUWdxeFc5RWowc1dyZnNsV1Ry?=
 =?utf-8?B?aEEyOFppSnlFcXQ1SEpZQW5tUEx4cUpMazBZWmYvYWRNcTVFS1hHSUdTaW83?=
 =?utf-8?B?Z0I2T0xCcXVWdmczeGplN3RieHl5NHEzOTg0amQ1MTJLVGtUc3krTlhOY2ln?=
 =?utf-8?B?enJ6aFhQYnZtdzlIV2IvcklxR3NmakJlSElxZ1JlMmtwSm5WTkw0Yk9XRzY5?=
 =?utf-8?B?QlY3blpLRmFhbjhBa2xLQ09DSmlqVXo1V3J5by9oTm5FRHFMUGc4QytVYTZi?=
 =?utf-8?B?eUhBRGlkRU5XdDNzUGFIVG1TaW1PWXI2eE9JVkNLaG10cDVONVVnemJ4enpG?=
 =?utf-8?B?N1Qyb2hLK3p3MUtPNXVkY1NjaHVJemd5WFJsMFBqREg1NzVYVXBPTVBaZkNu?=
 =?utf-8?B?VmVvSTRuV3h5bGlvL0w0d2VBblpuM3BCSG9VL1Vzb2lKaFZrUmJEUCs3QytL?=
 =?utf-8?B?enVnazFldGVEMFFycGRiZkdRTDlSWHRvVWtVTlhnd1ArZFNNbzB1NVZ3bk9K?=
 =?utf-8?B?YUo5QTBqSUdobzA2bUQrUHhic01icG9Ec1QrRDlyci9QQXFPL29vZFBKWTlN?=
 =?utf-8?B?SStlVldEbTF0aGxVQjg0RUZOS0lBc3NjZzdTajJsbkROM1E1UHdoczZiZU1V?=
 =?utf-8?B?UjV4eWhHbXh1d3V2SzNXc09tTkt6Z3YrbUQzTm1DVGpmUno2NldSV1FlUVFm?=
 =?utf-8?B?MlprQmlYYUpPRGlqK3ByZ2E0dlJOS2VIMEI3bGNndmtsWTBHUWhBQ3A1NDk4?=
 =?utf-8?B?aEdpWVl3K01CamFaekI5SDJTSlhab3pBckxpSVpTODE2UWczWE5mSXhlWEZE?=
 =?utf-8?B?T2dNOWdqckt3ZDhPYUMxQit0dlJEVGlIN2kxN2Z1NDhXYW1WQzhXajNrS25V?=
 =?utf-8?B?NkhEb2dJbE9TNVdUZVFLUC9FajJTR1dBNlphZHU0dnE0ZUo0ckYvSFAxUVps?=
 =?utf-8?B?c0t3eEY0dFZKZk02MXdDTWtuK29aQ2o5eFByTGttTFRxemt3bENCN2FIb2k3?=
 =?utf-8?B?OTV6MGxGcm5KM29JN3RyOFZrVXZpUTJhRWhYT2E4ZUtzTmtheUpwL0xVYmlj?=
 =?utf-8?B?b05yREtCVEJUT3psTFJUT2RTTWd1eVFSb1M1OWE1Um5qQmxTbjJqbHdoZyty?=
 =?utf-8?B?OGRyelJHRm1XMWFxejh5WEtGQjBTNmpPWTdsclhrem5HNnlPT2tSLzkyL082?=
 =?utf-8?B?UmJ2eW5XNUxyZHo4Y3p1ZWZvYUpXOEJ5UVhEZGFPMitTR0NiK28weVhxcnpR?=
 =?utf-8?B?OWNjYlZiOUNxTGJlaWlrZmJMRjJsSWtBQ3pobGhHTUJaL09Qb3h5S0tlNFJN?=
 =?utf-8?B?dFJjYVpIK0ZXRzc2UGs2RXV1YngyUTUwMVZHWm96RVFlaTRnOGgzMStMc2dW?=
 =?utf-8?B?RUlzWkI1NVp5UVpBYWZJMVM1SlpLUjQ1V1NFdzVteVRwckIyT01IVlhucng2?=
 =?utf-8?B?amsxRVliRVpmbm5rZ0E0TWQzWU9qZlRhZXg5b1Rjd2JoUkRSajhja0hEQmQz?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c303bf9-f27c-466d-07b5-08dcd1cf6023
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:32:58.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFdfW37dSjfrFDxGCiKxIJ0DUu84vIUoPX3hgJI4sVRh1pj3bqk5t2fHTLlqDzb54yV9WIrUCJB6FPFWApz0P+ovcF27Qh9KivBFxG0d/QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

