Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0605C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 20:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045110E199;
	Fri, 12 Jul 2024 20:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgqDrnd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328D10E199
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 20:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720816450; x=1752352450;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EuplzD6L93zEjZNK5Ccl0hkju3tjV4kOMNCi6SfrR+4=;
 b=KgqDrnd/uEL2eLnrwVHPd3hnPrIBLgKy4FaMw5jfJ3q1LCT24LyW0x2o
 P+MNdEa6n08nh1q+KSPaCddMq1FY3/CWhJYvHBiGc8HGyjtANR6KyH/w8
 HFxrjgCLG4/QRx7PapJ4UX8jUyhjtuNpIjvkpeD5q9zUqa7xHIuFygscU
 7oc6gtf0Ll4OY/U7EaL7bVtEOU+z1vlLKntlR2fpfppagxwAG6+QT3Rjl
 NvwFKN/5lRS8PDtnFmx23nn5xGEKd6vcmzGp0yU3g08ZX3gqvqchpK8uq
 K/hi/h71/v1wN4sTfWHDnK1x6O4nt//CHiqFj5ZSpXr8NeplM+Dr3yj2u Q==;
X-CSE-ConnectionGUID: snBcT9VQSOeATG7lsBkpkg==
X-CSE-MsgGUID: qWfhcI9PT3uOLC7yGBbrPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18118605"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18118605"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 13:34:09 -0700
X-CSE-ConnectionGUID: UqHn4LlzSQq5cPjt8sm3Nw==
X-CSE-MsgGUID: atJWmsqHRN2Ptxs1GDlagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="49016132"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 13:34:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 13:34:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 13:34:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 13:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XF06TXkgd1ai4ZFxgmt4Od8N1zXiP+K0JPP/UXynaBIy3Z+0xvQnDaUPSdBCFk6D2U8cuZB8ZGsHSLwDYraLEaUqyCycvqIce7kEuWgacma24ve5I2ayIJ92d8w4ry0MuY2krHzTeL0Cbk4GveBXL/FTW5F3WSyxDnDYN4BfSu8POSea3ldOAMl7CvmqB1YjhxIGC6NpzbnfBW57i9yvWfWmE9bhTYIRYEycKihmKGkJW9BO8UXKR2WHQQlCKo/fvVlKYt/JaVpNOkkomdTjv+gdrC3xdNxWY/f3kTsqwpHOgBfE88Bvz3wh8Ox2GTGz0MMo+RhiTFvrJwB3Q+1dgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuplzD6L93zEjZNK5Ccl0hkju3tjV4kOMNCi6SfrR+4=;
 b=AOYtGDoLBby8/gOQsDXtCWWtJIhKwpd6mcxANRUpPcKZ6Z5s3AhQCC9othuIl9CZdFTK+7ghit83apuG964u/k/mKzaEmQvw8bwYop7EbJt7CTbelzaxXEh0Pw+hhHOP4XAcQVNKNAVI0sbrroghoIKk92vUCjZDk4GTK80iqE9z2eVACmZa4SqHA2g6WdK0FQoy46sY4DtiABLzOtQzoIZtBCovNgTsakvgiMZ/0YWKMPvyxTiJtQkTqV+FzRH3/WimlMEwL4VnwOpNZUmwqlIgweQspuFWKOxsBmI+0wyKmUoqpI6dqI5iK6A4y5ze46BvCyqrHe4V3E7nr0NmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.23; Fri, 12 Jul 2024 20:34:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 20:34:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chegondi, Harish" <harish.chegondi@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa0L7jLk5Pn9W4/0+8hkrEd96MvLHzlCyA
Date: Fri, 12 Jul 2024 20:34:05 +0000
Message-ID: <2addd1c874bca62fbde8349c942c47d0f2b5aa50.camel@intel.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
In-Reply-To: <20240707224141.2865472-2-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: b1694115-bbac-4f32-5ef7-08dca2b1f955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTd2NHp1VDM5c2lQa1dJOW9DQjN5a3d1K3FFTVgyQ2FDYVVuQ0NydWh1SVBs?=
 =?utf-8?B?U3Zkc0l6Z0VvamlEelVTdmI3TjZ1OWZLTEVzMkF3SzRoTGxEMFFkR0xyOHF6?=
 =?utf-8?B?VHRNUFQyMThaUlJuNlhPUFo4MmQrOVBkdSt4TnlzRUJhK0lGbGZwOFdnREVN?=
 =?utf-8?B?NjduVCsvYjJVWVpqMzUvdFRQQmNCcUU5V204eSsweWZhUlhySE1sdy9RbkFt?=
 =?utf-8?B?d1VYeHJYOGFFU0FDdmd4cUhFVThtREdFUUdiUHFZY0xaU0Q4RFZzeDRvZ3B6?=
 =?utf-8?B?NHpwVjc2S0UwQkpBYTFYT05WR1Q4d0ZWN2FQTW1FV3A1Z2R1M1FOTW8xbXNR?=
 =?utf-8?B?SnJBdHpFZDlmWkZiZU1aenE5Q0RXTDgrMjRqZzZFVnBlRmlNWVQxa21TU2lT?=
 =?utf-8?B?VkFRNUQ1dmhvZldZWGlzWWtnbmQvUlN2bHdTN2UwMDJGR2ZFWGhtVFBPQ2xx?=
 =?utf-8?B?bXV1N291UFNQYWVzem5Zdk5zT2hiKy9hYklIdUI2SUJDZ1M1N1pib3lhMHdD?=
 =?utf-8?B?QTlMbWdhZjVLVHMwaTRodjFsa25QQk13dWwyRmQzeWtoc01QejBrcXgwOTc5?=
 =?utf-8?B?K1dyOEVsWFlZMU1ENnV2eU5ZZFJoUm5DaEowWUZhWHZUeDE1MythRUh3UzRM?=
 =?utf-8?B?ZUFuVEI0aTJYZ0lPOUZ5bXdpK21HYmpHRFExQjU5NEwvOCthdG16c1lTSTBq?=
 =?utf-8?B?cHZjUlJYNDFPVTc3TDMrd3drVW5wRDN3dnhCZTVTOHZ4OWlXcGNUQlZIaWRS?=
 =?utf-8?B?T0xCYmYzQ1R2M081Z25XOVpMOENhY2NCK2NxaXpPN2l4ckZvK3FRTG1OdVhQ?=
 =?utf-8?B?Syt5b203OW1SenpxTEZBOE9QajZNak1NQ2JPbEtUeDlQdkFQK0t5WXBTK01O?=
 =?utf-8?B?bW5yc1NDTm5FMWIwSXNiNHpidXplTmtac21hWHQ0TTg4aVRuMWVCZXNtd2Y3?=
 =?utf-8?B?SURCTVpZL2I3Y0hibkYvS3JTZzhPekt2TGJ6SlU0OHhMcENEdzZmT1hhemJa?=
 =?utf-8?B?QmFjbGJLNVBQZ1VJTlVCZE1FV1dyS0NtcHFrUEVpMmljNkIxNVRZOVpSRVRX?=
 =?utf-8?B?dzZ4a0xIZXcwM0ZCeEpnUmZIRG9OWTZGemdHUlJQaGhMTHZVL0JEbUkwamNX?=
 =?utf-8?B?ZEdTZDh1eXU0YVpuRTZpblpsak1seTNSR1VBdXZiU0VEYWNsS1hJdjNhRU8z?=
 =?utf-8?B?U05JNXdGcWRlTExQbVpDWXh2ZjFmNFQxczJRMXZDdXBkRUkyMFNzZnBWQnVZ?=
 =?utf-8?B?SzdMWmt4UFhmOXdNQ0F5NTJCLzh0cFY2akFBWkVySWZOMlRWNk43TlhxbjZX?=
 =?utf-8?B?SzVZakJGMzJxeEFwMlJIVmhCRnMrSysrYUNuLzdRbG55YS9lSVdiM2xFRXAy?=
 =?utf-8?B?UFhkek9nRUxvRHp1Yk9wL0VsTGxMT3NyMFNuRE9QcUt0Yk5OU24za2t4b2xt?=
 =?utf-8?B?UHBZNE5Nc2hPY0ZIUlcvdVRCK1lFQkFwKzhCZ3E5MWN3WU9wUTVpV1R2TndQ?=
 =?utf-8?B?SEduNWR4MWtCc0oyK212MXNnSXUvb1I0ZmdxVWlXVm1DcUkwY0NNeS9idWFY?=
 =?utf-8?B?Wm1udWFaMXROeFIzWGEycXFTZk14M2ZUSDczN25SVEFISHNvM0pwMEl6di83?=
 =?utf-8?B?WGUza2d4UkdYQjZDRVVMTm9NNVdSazJNYTFTZkw4VjZycUdxcWdZQ2dKdCtE?=
 =?utf-8?B?elJiSFNKSjJwSzk2VHFzRjY0Z1FCNmdHVXFLMFdYRklWaE1PV1k1S3RaSmhh?=
 =?utf-8?B?c3QwN1k1NjNTdE9pOUFYZjFINmNBTExnMi8xcjBQcHRxMVlvR0ZxN0g5QXhi?=
 =?utf-8?B?ejlGNzRDcjlYYnVKN0VKczEvaFk5V1YvVStURWJ5aUE0Z1MzMTFDMWhFUC95?=
 =?utf-8?B?SXladFA4N1U1RHFPMzlERDhBdW1pd1JabmdDZ1p3TWhRMXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckd3N2QrVThBdTUwV3gzTHVNL3ZGWkJCRGFEbGFNaW56bFFpRWRkamROQ0U2?=
 =?utf-8?B?aGJmbVNhcXg1UTErYnhkSjU4NlFhWTF0NHJDSkNsT0FsVDdBUklhNGVDNjJS?=
 =?utf-8?B?Y2NHSzdtSW16dFlJRGszcGt6Qk1IVmh2M01vVmtBd09iUmxvSGo2ZVVTYW8y?=
 =?utf-8?B?SEZPcGp4YTF2cmR2N2FyMjEzTFBaKzg4SjBSalQ5MWwrdmlXbjdsSzhJaXFW?=
 =?utf-8?B?Y1orV3VwWE1xcjdCdlcyYnZTOUl4ZGdoUEJaQVROckVpTk9lTXZXNTVzOElM?=
 =?utf-8?B?d0xFaEo0UExNa2JSckt2Y2hOVlFCY00zTUFFeTZNbDd1cERwV2RBWmVoQlhO?=
 =?utf-8?B?aTl3TGJtTjlRU2hxd0NZY1lNZTFVaWlZVzd3blRmNE1xbStab252Qy9QUSsy?=
 =?utf-8?B?QTNEQWZtOWZ2a01qT25yTUJRclc4OHlEUVNRRTRsV0xyZFdjRWpSZjQrcDdS?=
 =?utf-8?B?cENIU0JmeHBTNjZVaHJCempYZnR5UEgyTjFzUUVkbHdqbXl5RnhiWWZCS1lG?=
 =?utf-8?B?aFVRV2RsYVlFaHQ4a3kvQk0wcEQ0RWdkaVdzL3MwUDFxcGhkTGZBYlo5bDdL?=
 =?utf-8?B?Q3oxb255S3F6RFZLRlFsM011dUo3ekJuZXAyRTBqeCswMHpZVUFNeFVTL2JN?=
 =?utf-8?B?QTg2WFJreVlzc0NOVW9yRWM0Vm0xMmJ1TU1lR0ZSVHZ0OWRqbStWc1NyL0Ey?=
 =?utf-8?B?RldSTmtlTkQ5ZzkzM3ZOZ2lMMEFmZ1dNc2hPdG0zajE2cUJqNDJ5TWRrcTVD?=
 =?utf-8?B?QUhXUmF0U1YzVGM3WnRDeWo2cU5iMDFPdXpIUkUwODBBeHc0S1FGRGhqVlhP?=
 =?utf-8?B?TVo5eVNIaUhUaWtvZjBoeVVMekdqSXZMUVNQVng4TTdkekNxcTQ1WVNIYUkz?=
 =?utf-8?B?T0g2aEZJMFQ3R25vOVBnUUVvQkZTeDBrWVZXR0RlYXllRzluUE83bXhrSTNr?=
 =?utf-8?B?UDJ3aVFNQ0ZQVW9pRnNoRUt2dWE2OENxRUVvQWl0UWFqUkptaHU1MHpOaVhj?=
 =?utf-8?B?TVU0VE1zdzZzRWxINnhkS2tROHMwQlg4QnVnYWFyS0s1ckphYmJaT1d0d0pC?=
 =?utf-8?B?WDdHWVhqNEMvU3M2TjIzYm9TQ3FNc0xwTGdtSzdZOU1YQm1SN0kxUlAzaGov?=
 =?utf-8?B?bzVHaWhoanVCc24vd0dSR2c2ZmtsUVZJZEZlZExtTFZaTFZwaWM0cExSd3h2?=
 =?utf-8?B?QUVXTTBoYXI3eGRtWk4yWkpKMEFlU2wyR1hmcDBxb1kvcVNhVTZsZzNWUDZG?=
 =?utf-8?B?dEZkRXdxT1JKSHBHTGFwYW5QVGVIU3JKZjdtNHlFdjBML0YzbzUvQk5yYmwy?=
 =?utf-8?B?MUJncmpFUVlLRFZWOUF4TTQ4STFYN05oVWY3a3V1dTZ1dlU0cjdMQUdoaGpa?=
 =?utf-8?B?c0MycThhQjdKeE9zUlo1L2tVRE5GMUozejJmRE1sYWtoNnAyWVFGOEJnUHRx?=
 =?utf-8?B?M1pubi9OS0MvUkM1UWEyYUh4MDRTdk9BaG14S3JUM3JOdy9mN1JybERUQm11?=
 =?utf-8?B?TGZtUkVDbHE3V2V2WnRNM3ZFREREODFuSUdJd2tnY2lXOUl4UkZXdzdsRHk0?=
 =?utf-8?B?MWZwOUtwMURMc3ZGVUJ1MnNHcm1CdTBWZ2JpUngrWGM3YjNKem5GcllwNDMv?=
 =?utf-8?B?M28yYUY0YUZmVHBtTXg0TDlQZ0pnRk5qanYzcXhHL0NZQ0o3RUJHYkQrK3Uy?=
 =?utf-8?B?T2VPSHo5UlNJWWozbVNxN2pseUQwbWhYQ25EdkRwQ1pvWnk4RGFWLy8rODRl?=
 =?utf-8?B?TzR5UTlTSXBnWWlYQTNIZ3B3bjVuR0tSTkFIcytnWmxLSkR6TVlGUFZPaUlr?=
 =?utf-8?B?a0pIL3BCUG84Z3l4RWIwZVZSbFREWUZURXI0ZTNheTRwcUVOVDV6MHpYZ0VI?=
 =?utf-8?B?amRqT2N3d3pKVk93aDZlODUzMkhLYjQrSncxTFphbU5jUkxqRmNGNWhCS1pF?=
 =?utf-8?B?S3J6am9IVGZrcnlrd0wvWFA4UDNaUlhSTllWZnFOUmxzYzE5L210WFN1NzYr?=
 =?utf-8?B?azFlSEdMRmwvZlZsUUJDaVVqWFpvWXN4NEF0UkkwbzhKbVNlbTNydk9Nekoz?=
 =?utf-8?B?TUZWc0ZjeGM0QlBQcEFPaTRPV0lDOVRFbHVIMVJZaTcwa0FmTnFodk1FME1w?=
 =?utf-8?B?VUgwWXJ3SzVsYTA3K2FCampjU2QxNWMzV0lDZDc5M25FN2pqOFlzL2IvQXpH?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C37EDCF9F16DC479A3F1C74905B0AB9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1694115-bbac-4f32-5ef7-08dca2b1f955
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 20:34:05.5641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCstGhO+EatIwtugLsEeKqBqsQFQEbI4Fdph71yTFwZEz+Cy0gl7MktZXkmWVgyi0eog153ASVDDmaf//YVgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

T24gU3VuLCAyMDI0LTA3LTA3IGF0IDE1OjQxIC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gRnJvbTogSGFyaXNoIENoZWdvbmRpIDxoYXJpc2guY2hlZ29uZGlAaW50ZWwuY29tPg0KPiAN
Cj4gIA0KPiArLyoqDQo+ICsgKiBlbnVtIGRybV94ZV9ldV9zdGFsbF9wcm9wZXJ0eV9pZCAtIEVV
IHN0YWxsIGRhdGEgc3RyZWFtIHByb3BlcnR5IGlkcy4NCj4gKyAqDQo+ICsgKiBUaGVzZSBwcm9w
ZXJ0aWVzIGFyZSBwYXNzZWQgdG8gdGhlIGRyaXZlciBhcyBhIGNoYWluIG9mDQo+ICsgKiBAZHJt
X3hlX2V4dF9zZXRfcHJvcGVydHkgc3RydWN0dXJlcyB3aXRoIEBwcm9wZXJ0eSBzZXQgdG8gdGhl
c2UNCj4gKyAqIHByb3BlcnRpZXMnIGVudW1zIGFuZCBAdmFsdWUgc2V0IHRvIHRoZSBjb3JyZXNw
b25kaW5nIHZhbHVlcyBvZiB0aGVzZQ0KPiArICogcHJvcGVydGllcy4gQGRybV94ZV91c2VyX2V4
dGVuc2lvbiBiYXNlLm5hbWUgc2hvdWxkIGJlIHNldCB0bw0KPiArICogQERSTV9YRV9FVV9TVEFM
TF9FWFRFTlNJT05fU0VUX1BST1BFUlRZLg0KPiArICovDQo+ICtlbnVtIGRybV94ZV9ldV9zdGFs
bF9wcm9wZXJ0eV9pZCB7DQo+ICsjZGVmaW5lIERSTV9YRV9FVV9TVEFMTF9FWFRFTlNJT05fU0VU
X1BST1BFUlRZCQkwDQo+ICsJLyoqDQo+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9QX0JVRl9T
WjogUGVyIERTUyBNZW1vcnkgQnVmZmVyIFNpemUuDQo+ICsJICogVmFsaWQgdmFsdWVzIGFyZSAx
MjggS0IsIDI1NiBLQiwgYW5kIDUxMiBLQi4NCj4gKwkgKi8NCj4gKwlEUk1fWEVfRVVfU1RBTExf
UFJPUF9CVUZfU1ogPSAxLA0KPiArDQo+ICsJLyoqDQo+ICsJICogQERSTV9YRV9FVV9TVEFMTF9Q
Uk9QX1NBTVBMRV9SQVRFOiBTYW1wbGluZyByYXRlDQo+ICsJICogaW4gbXVsdGlwbGVzIG9mIDI1
MSBjeWNsZXMuIFZhbGlkIHZhbHVlcyBhcmUgMSB0byA3Lg0KPiArCSAqIElmIHRoZSB2YWx1ZSBp
cyAxLCBzYW1wbGluZyBpbnRlcnZhbCBpcyAyNTEgY3ljbGVzLg0KPiArCSAqIElmIHRoZSB2YWx1
ZSBpcyA3LCBzYW1wbGluZyBpbnRlcnZhbCBpcyA3IHggMjUxIGN5Y2xlcy4NCj4gKwkgKi8NCj4g
KwlEUk1fWEVfRVVfU1RBTExfUFJPUF9TQU1QTEVfUkFURSwNCj4gKw0KPiArCS8qKg0KPiArCSAq
IEBEUk1fWEVfRVVfU1RBTExfUFJPUF9QT0xMX1BFUklPRDogRVUgc3RhbGwgZGF0YQ0KPiArCSAq
IHBvbGwgcGVyaW9kIGluIG5hbm9zZWNvbmRzLiBzaG91bGQgYmUgYXQgbGVhc3QgMTAwMDAwIG5z
Lg0KPiArCSAqLw0KPiArCURSTV9YRV9FVV9TVEFMTF9QUk9QX1BPTExfUEVSSU9ELA0KPiArDQo+
ICsJLyoqDQo+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9QX0VWRU5UX1JFUE9SVF9DT1VOVDog
TWluaW11bSBudW1iZXIgb2YNCj4gKwkgKiBFVSBzdGFsbCBkYXRhIHJvd3MgdG8gYmUgcHJlc2Vu
dCBpbiB0aGUga2VybmVsIGJ1ZmZlciBmb3INCj4gKwkgKiBwb2xsKCkgdG8gc2V0IFBPTExJTiAo
ZGF0YSBwcmVzZW50KS4NCj4gKwkgKi8NCj4gKwlEUk1fWEVfRVVfU1RBTExfUFJPUF9FVkVOVF9S
RVBPUlRfQ09VTlQsDQo+ICsNCj4gKwkvKioNCj4gKwkgKiBARFJNX1hFX0VVX1NUQUxMX1BST1Bf
R1RfSUQ6IEdUIElEIG9mIHRoZSBHVCBvbiB3aGljaA0KPiArCSAqIEVVIHN0YWxsIGRhdGEgd2ls
bCBiZSBjYXB0dXJlZC4NCj4gKwkgKi8NCj4gKwlEUk1fWEVfRVVfU1RBTExfUFJPUF9HVF9JRCwN
Cj4gKw0KPiArCS8qKg0KPiArCSAqIEBEUk1fWEVfRVVfU1RBTExfUFJPUF9PUEVOX0RJU0FCTEVE
OiBBIHZhbHVlIG9mIDEgd2lsbCBvcGVuDQo+ICsJICogdGhlIEVVIHN0YWxsIGRhdGEgc3RyZWFt
IHdpdGhvdXQgZW5hYmxpbmcgRVUgc3RhbGwgc2FtcGxpbmcuDQo+ICsJICovDQo+ICsJRFJNX1hF
X0VVX1NUQUxMX1BST1BfT1BFTl9ESVNBQkxFRCwNCj4gKw0KPiArCURSTV9YRV9FVV9TVEFMTF9Q
Uk9QX01BWA0KPiArfTsNCj4gKw0KPiArLyoqDQo+IA0KDQpUaGUgUFJPUF9NQVggd2FzIHJlbW92
ZWQgZnJvbSBPQSBjb3VudGVycywgSSB0aGluayB0aGlzIHNob3VsZCBhbHNvIG5vdCBoYXZlIGl0
Lg0K
