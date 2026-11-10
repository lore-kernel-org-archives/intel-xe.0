Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F4606A74C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JTo/Po4N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAFC10E93A;
	Tue, 10 Nov 2026 13:29:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C2610E93A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794317345; x=1825853345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NNp9Y5FMoIFaKnpJ4eoefWlAgGmzgo9lrRtgqCpBM5I=;
 b=JTo/Po4Ni3wyHTHezSFPdgGcS7KfuPcPYup97cdedb1S5RbU0VXxDZv/
 f3i/v5yJviBpdsYw0XSu9ceVHh0mTRdWgkJLXRVA0A/fVC08B6EayEKM2
 tJ2RjAJYtDcgtw029NGI5Yre+OTkFahzpOeKgm44o8AFZ9bOUHez6Mm+w
 w6iB4xDeagdD4MKvBEo5B5Wr/OoRenZEV6qrllNSkJNIKrLX+jfZ9ctzf
 YPKCGrl+yK4svQa9d7n9J6Be/ho0pDPK1s46RDW3XLx9FPrlj7Ays1LuV
 XhhOzGh7rDHOGGohN0HRz6Wug+H+H1fttoLZTTf2IkvjLRycKZ6SLT7x1 Q==;
X-CSE-ConnectionGUID: rV/4Wa69R3eJKhTAujtcZA==
X-CSE-MsgGUID: O6pLYqKNTPC1rrcNyTfBIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3099806"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3099806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:29:05 -0800
X-CSE-ConnectionGUID: XkzW7C+GShOZgawlqjn2Bg==
X-CSE-MsgGUID: 2hsXXbwmRGq6ofBuiObiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8598692"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:29:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:29:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 05:29:03 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 05:29:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7dju45eszkSUCtaMdYoBk5X7JmH/y/rvSNBfWoZ4gggoXDtFq8Pho7Ad1/zgj47Zmz5CKgGlA6aFcG0ZVAV/5lAh6UTKGesk44IQB+5PA2Gmgup/YrF9DREjwz5s/CiY6J5eIz18CcdTHfXX0UzQUFtVailhMy4O1t0i0K49VM6jJcLmi3bOMJrJb6sTm9sOo5ZctW+KExrX1sC95l3gvRakX7H5OuvABgN49cK4MlAX0ciDvY0CcnDV8sZsMjCspqUSw3Ob7Eyf1MQYqRMYaVOckS8mjKMcm1yLe8M86q46K2rBAeLcV3AlQYIqIANqzLH3Go0z947Wgw1jfTCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qge0EM3VTrpgXWh2yw/LdeKDjHfV/b2mqe0dAbW+kE=;
 b=FhzJA4sOBDiN9DMeQXvYmAYHlrnaWkSgMAeEK7Vuzs+0rueoS+r/LuEJjxbQeukGBrankem1R3qibrqngY2l5DmcvtsmFUSzW8iEJSPgdTk4tfaiZxvbMlgJ8rxsEPeyjIGqraeb6QbR1rtDyMmKr3Njv2oWF7gse2P64Vp2AneJp7+mhVml4y8qM8+NwUjPx/JR/dcyIvHdFkznBBxmcNlTZxVUXds+ePv2svyrKteG1MdK3Ze6xhOk1b5/IwX5nqnZNXM/+RWFtUpXcPMeS4r7ZAldvllSmLbq01QTAlxRa4pAnkXoCiz5bAintwcVgx8gVVgY3rLcD3QWPpceVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 10 Nov
 2026 13:29:01 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 13:29:01 +0000
Message-ID: <f58d57bc-05c2-42fc-94af-dbd5ea260323@intel.com>
Date: Tue, 10 Nov 2026 18:58:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/cper: Add software CPER emission entry point
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-9-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261105085348.1467925-9-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0223.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::10) To DS3PR11MB9796.namprd11.prod.outlook.com
 (2603:10b6:8:363::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: b8261148-8f23-48ab-20e2-08df3f2e94cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|18002099003|22082099003|10067099003|261026121527099003|56012099006|261022105027099003|4143699003|261026140227099003|261021121427099003|11063799006|261022113327099003|261102123227099003|261022075727099003|261009223027099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: Zjo07c6NsWjMsJmxUfrTX5XAQwsGRJkUBWfR4XOZ6+VCZC4i5S5pKlHX7F/aD6WNrLqpQi/ydy9n0J4oRh8fUkHSBK5SYfhc7BIZL8C6iuUejxjvHm6UEP81l876Ra/PPzS/B5y5GQO1D2TiAN7Bqg5l9CcOoBFMKUkQS7WYg4CNpDa7b+DjwwBPma+PrXifCG+4oXIy9POnrUCknyobnKEwC0/AhTSWZSsdMBruOQ5JhWQSYtsIuraGVrqTWU95MDsQ1sn0lHu7m7l+1AKJaYM09SPLR+bVJacIXkz4bGZxRRAHK+07ynAXkK/ByNmz51G0JErrBpqLeQ0dw8RUNkJdnSbVWVMOu8JZjmz5bWbZcKUzdriVlXk1KV1ZW+OBiUwx2NO4oVxN3/BFgRmALC7tUSuG1N8+HAUhfgpyS5g196eNohZEiESnt9QARemjh7Gub2NtUw2mEAgbcnn3g87Mu7v9jUe+vazeHbCfGawJJ3wBraX/5Dhp2d+R6BlWAJWV5leEUMIZvYVZy9SSZi5wBEZaPk//Mozup5iAhpIMV+uiwvgn3WWNMhb3fa8ovyf7nKa74HiWDmAuVjendwThVQhrA7HA4hWwFo9/e6lg1fi7K/4NiV4hUstyTQh3CEKsY4+I24EqxlN5GljTMnZH/gg8BAmrwW9ArI6J/3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(261026121527099003)(56012099006)(261022105027099003)(4143699003)(261026140227099003)(261021121427099003)(11063799006)(261022113327099003)(261102123227099003)(261022075727099003)(261009223027099003)(261021123027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDArSHhpaldRakp6Tmc5WTg5L2NCenRsdmd1V2R0SjA4cGhkR2JFU3V6a1B1?=
 =?utf-8?B?cU11LzJncG9MRGxVL3pnOXBBL3BaWkU3YzdkQnlYWUt5aTBhZkdBNUJzNWR2?=
 =?utf-8?B?MHdvbDVNdmV4N1g1R0xvSzJrTmNlMm9tZjduMW84d3NCMGhpQS9qT21QYW1R?=
 =?utf-8?B?TEViV0pQc3djNldlc2dpWUpyTFo3QlE1QzVWVVFWNjNORUdVWlF3SkUwVHpF?=
 =?utf-8?B?SENFU29scnNsYndid21jR2l3TmlQM1V5MU5idjdURW1XR0FTaXpjV1ZYZVR5?=
 =?utf-8?B?MHNhaXZUeFRISUtGNlQxZWJQWUoxMHBvaHd3ZmRGSFJLWnRQSXptYmF2WEZI?=
 =?utf-8?B?WnV6UGF5MVNKNWttVjRmMlZKN2tsSzE4WkVhQzErZWVuQ0t1TjQweVNyNGZp?=
 =?utf-8?B?STlqNkNaNm9lRnBaRHAraFBLSXQ3NHJGUmV4VlZMeCtXNTlaTkIzd0hiZWJt?=
 =?utf-8?B?c3p2Tnp0TDZrdGFncEpHb1JCci9UNUJSTVFNbkUvdjF6VHVCblE2aW1kMTdC?=
 =?utf-8?B?dmZnbzBxR1NZUHE4YUc4UTVHQnRUYXpBMFI2QzBsTFZkcmIwM2hCY1huaTVi?=
 =?utf-8?B?QWxTcThja0tmakw2S0xyTjJqcGJEem5KazFBWDh5aWdRTm9IV0w1aFNGV3h3?=
 =?utf-8?B?YnczczdYQm5lTFd4WWJncW9pdDBDdEdSNUpWRVhuU0dRUWJJSWhQYmVDMm1K?=
 =?utf-8?B?U1IzdFBHWTFycXZQL0YrMDBSa3Z6em5DSmRRS0FkMHNTTEkzTkovOW5leVda?=
 =?utf-8?B?MGNuOVNTY1F5UW02a2RaOVlqTEV2UVVGd1VmYkhnR0phN2hmenB4NXQxRUlP?=
 =?utf-8?B?TldZNk1pZGxpNUtKdDd1eGhuUEdvd3lVVEczbmJCTC9mdE0xNlZFN205a1BR?=
 =?utf-8?B?TCsrUmlQaFJKanBjNG45QmJrSGZneUtKQVFpTTNKSXFpdjNWVEhUYlU2S2Zt?=
 =?utf-8?B?dWZiU3Nqc29NQm5USXNqWmNaemE0NVlLMGtaMjdMN1FwckRLakR0WnNlLy8v?=
 =?utf-8?B?NU5UVVlrTWRKajhtdnJIY05hcWtXM2dmS0U1Q2VFM1R0WW1aZzFPQkVMb2dS?=
 =?utf-8?B?SFhZaldTSXdVdWtGRVpqN0tsNExUSlg1bE8yVFVUWTZRL3p5T2tXNHpMSHpV?=
 =?utf-8?B?U0lwRCtDN0FGa3ozbUZ0V0N1QW9PZnFQZWtFK2FXajdxdUZZMU5pYnFHNStD?=
 =?utf-8?B?OGhtTkxncHlWbDZGTWIvRE1jZFhuWVhWTFJsNzBoZmZta2xuYno4eUVEYjU4?=
 =?utf-8?B?MVdDVEU0SUpwUkNwU3ovbzlsYmluWldmeW5oRWNaM0NSRW15WG42OUNFUkdP?=
 =?utf-8?B?VjZzTSt2cGFqV1N0ZUM1QmNDd0RoQi9vQ3JEQmNyMmdjWmcvc3FxN2tUc0N6?=
 =?utf-8?B?R3UyeGlxVXhXTm1OZlFoQmlkNjhyRWwzUCs2L0dTMFBmenhabDFiaGpQdDU3?=
 =?utf-8?B?N01QQnNPVDAvd1BxUjFYckxFcVBlRUxFWUo5TE9CSmlOQjRsVmZVMmw2bi9s?=
 =?utf-8?B?NkZZME1UVjBlLzhQQ1pCYUNOcFZSMzFqWEJOTGxGWm5HK2lRRWdQREVuVS9M?=
 =?utf-8?B?bUUyMUVQZUdDY0lOVHdVNkd4c1JydHNwdUM1aitkV2NFbW9MRGkzbVlSMWFs?=
 =?utf-8?B?ZVRiK3VUM2RWdW40SktBdnZRMVAvbzJwY3ZzRFJTR1lRM040bHp0RE83NHZP?=
 =?utf-8?B?aFdrSDRocDJaMW9WUSs0UmJ0QVNiR3lVdDRob2JERFlxZk9NUkI5ZDd1ajlm?=
 =?utf-8?B?Y29UMDNDek4rSFlWSEFpYktXWTFYYzRQMUFncnlHUGZqWkZVSXVkcW9WNWFz?=
 =?utf-8?B?WFpoUXhPNVNESXJJNE8wS0V2UVczZTc1eGpEcXNZUXpQY0ZCYzd4UDlZWnpI?=
 =?utf-8?B?c1hjZmE1aGgzQXJnaWhmNTJjdGt2dlBLK3hScXhLOHM4SW5Ka1B3Z3FFMEZJ?=
 =?utf-8?B?MFdBT2lkK25mOG56S1F3MTdRcitDT0wvRFZaaGtDajZlbWVmc1pjN3hRZUJa?=
 =?utf-8?B?OVFXS3ZhckZTVGtYc05uZ2pVNWx4bUFHbm11WHVwRnFPekhYMDUranBFUjQw?=
 =?utf-8?B?dU9nU2ZvNW1nNkw1ckFJQ1BqSlQyeDI4UmZtZFBrM1BoQmowbE5NbFZVL28r?=
 =?utf-8?B?cmpvSk9jTUFLMHZJUjFUK1ZFc1JaelN4Y3Vsc2NIZk5mS1JRb3QwUlNSZEQ2?=
 =?utf-8?B?U0xvMmZYNmUvQ04wM1RsOEh5NHEvOWIrMHI3Q2RPTGJ1R3FqR0MxZ0drR0pR?=
 =?utf-8?B?dXZ2RWRuZGk0MVExSGxWYjRVVGJ0bGZEVlFkbG9OdWxmQlNWcEJ6ajlBc0tB?=
 =?utf-8?B?VThaKzJna0ZrVTNvci9ERGJPRWJYZ3pGUjJwY25oelpjOU1Pd0VSUT09?=
X-Exchange-RoutingPolicyChecked: 1l7nb6DkER1XFkZEbcBbiS8x4s4uKjtJBOnrGjxdrLGgPDCjfy66dksBDfcHMChBxzyxMLstOccyPMsf7yyumRZ3MylwEpk77SOyIR/s7YyOPQeh5XyP8SM/vd2FxZuucRZ2VF8e6tyR7fmYGVso0AcQHnmIb0PpQ7kzCABmS/GPTrVuwPvbfX8A+5Ex81oXO+5DP3OuDccgTpMwDLztzoRg0KFnJasv1grplvZHthBHjC1HtpWZQV6JZDPYwbKpZHLGK5A6i9OQHhC//de8TVIJ9O5d3ksCIbEiI4L3KCDZGZTFypjQnD40Ly5V6D/EVpctkNS0ZaIrmPYqEQMHtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8261148-8f23-48ab-20e2-08df3f2e94cf
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB9796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:29:01.5598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUs26v96n3cY1VSSy26zuE7xukQFltKrezJSL6tHu1REB3g3qrXSMpl+vpYbgBuzDBCth+1krThCTwxBRtVoZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 05-11-2026 14:23, Mallesh Koujalagi wrote:
> Add a software CPER emission handler for CRI SIGIDs.
>
> Keep hardware CPER handling unchanged and return early
> when the Xe device is unavailable.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Handle early PCI probe where xe device is null. (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index bb90030bcd2d..db3513c59834 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>   	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>   }
>   
> +static bool is_sw_sigid(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
> +}
> +
>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
>   static const struct xe_device_guid_entry xe_device_guids[] = {
>   	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>   }
>   
> +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			     u32 component, u32 location, const void *data,
> +			     struct va_format *vaf)
> +{
> +}
> +
>   /**
>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>    * @xe: The &xe_device
> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>   		  u32 component, u32 location, const void *data, size_t len,
>   		  struct va_format *vaf)
>   {
> +	if (!xe)
> +		return;

xe is expected to be valid here. Silently returning on NULL would hide a 
caller bug.

> +
>   	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>   		cper_emit_hw_err(xe, cper_sev, sigid, data);
>   		return;
>   	}
>   
> -	/* TODO software CPER */
> +	if (xe->info.platform == XE_CRESCENTISLAND) {

Introduce has_driver_cper flag here.

Thanks,
Badal

> +		if (is_sw_sigid(sigid) &&
> +		    (cper_sev == CPER_SEV_RECOVERABLE ||
> +		     cper_sev == CPER_SEV_FATAL))
> +			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
> +		return;
> +	}
>   }
>   
>   static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
