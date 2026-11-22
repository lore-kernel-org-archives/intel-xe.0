Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71730606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E54rnKyp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FBtmoxCm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E44110E4F6;
	Sun, 22 Nov 2026 08:39:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18AE10E4F6
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795336756; x=1826872756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IFFIYMEgWql3OTuNaDZxY4B8ivXfpI1WhbD1vAgDLuw=;
 b=E54rnKypvjzHHwXieT+3vWOrUwsbi8k52x1x6X9dVBC4dhBsL4ccWNsY
 ilmIGSraLV1xiefTkc9tOs1waV3A/VwebXCLx8ak0D6zgFadUvV2cnrSr
 YbLCPmElXVMci2zJclQsMgXPFAJUEymm3DWzQ/Xdo9JNsli0UjgJXANdb
 njsxenIjaJPR1J/Cv4Am+ehbACYK1WklZR9aB4ECjSpDR5CR3NMQxNjNE
 59WLzpN4uWlmROtIQEJ1bgHy8p1RlL7eEYnrrpRc0O3yV9++30PsMbG89
 DcugZbi0oUeSU8lQN43JKcmTr80u1m4W2VyDIxyTfn6xWvNOuEl1AnvQ0 w==;
X-CSE-ConnectionGUID: S/rd6NbOTUG2Ti2SNM5QrA==
X-CSE-MsgGUID: I2/7KsOQSHiFoLWwGA02Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4195231"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4195231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:39:15 -0800
X-CSE-ConnectionGUID: Wy/08yYLTOKvNaROcE5auA==
X-CSE-MsgGUID: 9QjJG31LSEGcXe05YxNKmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11337395"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:39:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:39:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 00:39:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBaAXs9vQvOaSDMrKiFkIr2zIZRBGtnJyYdinTm+UbPmyIlo/WozElaFoZyNUkhHf7JVaudgcTpLox8AFX3UiS1pCozGC+TG3fk+3E7HFc7XAOFE5OqxI5BZD3md+oTUsW96P4Bi8UELiQoy1LIBftQvOCCzv0u125L6Nqd3fmwW1/YrvDxqOc7FWwKGRVQAUtq0HbEkrRxNYuVvb2OtlI69Mbd7r1u5Y7lCWRMge+uthSd9F6dyfYI0Vmfwk7RG/E6EP/OMqDX6dM9bV6C6V3arByyKtj1/C5cUX10KyzB7inS/Af9L++u2VupUsDpZYhT3rluhpDuu+7XDN4XtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhnJ4fmQBQD+cRDS+GyFg4xgXWc8yvY/r8tv0yk9iAk=;
 b=q71IBXpE9exjtEsw7OSJf6nFjQZD7E5pwta8qruUnC0wheqS9cNnUhOhXCmLaLanV76gztZGyv6j1maan+NQWuOYV55sJvuI78XwcqtYB7PMciJlI5UlfBQUhkTCB5qJanfWoRF+6uOEVKynEdzsfOgsoQrFVAMQUmMGRMLZV063S2U4u5UyNhzx/tTDKtI9VQALJR9fw5IHDywhvglHaMKt3HjUrbdIovqjIwyPYT2YccQMe8h2gNhS9jtywvZmmW09bEKSvQZeEsGZbvIe7owmylQWwkbYo2typo/AqXyQ5bvNW4a4xYCpQUh7oS6s7ABJxmeFnms9JyabU+8NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhnJ4fmQBQD+cRDS+GyFg4xgXWc8yvY/r8tv0yk9iAk=;
 b=FBtmoxCmtsSY+O0Kr+RL3CRj1Elz6WvRb8p86ayLz3KyqU7DuBWNEt/NuNPgYTyM/kEtomiSaFV5t6TSId64Un1VDOfH3wXfQpFfa+S5D/W3clIHywCgknnPt0YGa84FPiyX0ElRB2hEwtFytwEkJekAW2lvj8Inphk2KXJvOX8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 08:39:06 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 08:39:06 +0000
Message-ID: <fc02f5f0-6020-4b81-a380-35726e2ca948@intel.com>
Date: Sun, 22 Nov 2026 14:08:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] drm/xe/vram: stop decay worker from rescheduling
 itself forever
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <matthew.brost@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-8-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20261112124329.2960272-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1202c6eb-ebf6-477c-f458-08df4874119e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xBReqWjnCK9LvPFsIfYJJDTr8ijktFz6UCIPo1KxCpFM2T4KuV36+69UOyAFD35bmSKStveEPN+8/6smPne14PeO8Ec9J/UmuC5qVJSxGjaJaFMsOWnAHgjhxxoV+/8F9SevjxF9S0kXXjxUjd7M7txQq4SjBCOrpb6gOD/Jl7Ui7W9jWuTJyLKHORkOcovNACsDnmWjR0hmB6I6rCuIGjFYLQ+9wNL9PQ/UtXaBE65wEyynocJI6C1HgWHR1MONOp3/zrlNZm+pBsGx/z8Sg/JYnMTQsch9MiGVabKhF2q5pGWB9PHmUHuMazEAjjJjr8y85jFG25w94NIPMl6hW8a6neOZSTXbElnOl9fzxAJLQyfJtCrUVxcFUggUD9nxjBoEkI8NUhOkqhOgdLkwWRMHEwClmJPobKwn6VfDQNdudoKXiKIuo0BVOSzQY9fTUcHXDgveHohyCJuXFJWgN5ntPlQXyj60OXcAA+cybLYCD9NYcigrtXzGHam7SStn8RffNQvSjro6jfRwYLYmo52EamjPFo/uVhthP3exgBMmmR0mSy8zAxL+OlCU+vILMu/C0AFio5LpKdTzWa6NEeZAsy9Rq3VXXiqr7RCebFx1mFKx9kVxzT+lgDH5Krr7DLit4gHwl4D6xfHhCWNKwA/dOC8F4c1Od1DuxlYxuQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aER3bDVBejNOYjIwaFBqOVpQa1VnT1BQNHhsK2dORVRWWkh1cXRTM1BxYkVV?=
 =?utf-8?B?a1hrcUtSUHcxRWZPWHVkQzFCYTExKzQvSkpVYTlSWWlLbjcwUHZhNGo0Wjhk?=
 =?utf-8?B?T016NVVpalNuRjJQbU5XK25kYUlMMmtjQmcrRDlCOU1ZejNtUVVpcTVTMjl3?=
 =?utf-8?B?WmNEdlRWcXpOSys0Z1BYcnRYOC9lcm5yOXB5RjF2cm0rdzE5eTJISEMyNlM0?=
 =?utf-8?B?SWhtTDVsU1N0SmFHRmJsMXFuU3lGNVUrNDNMNlM0VE9hVDgvTkowcjBnMTdi?=
 =?utf-8?B?SkM5d29RdS9wUkpiUFQvZ0Jld0FOb3ErQlFFM0Q5NlRjRVBlSmxFdjkvMldT?=
 =?utf-8?B?U25oTEpZRWw1RUZrdC82MVhXd052cG10Y29XVU5ubFFQdHpuOCtxM2puMUli?=
 =?utf-8?B?QzNHNkYvOUpKYkRpNmZKL1FHSkl6RkRNcHd0VU9sTityK09XeHl5ZWQwU1B4?=
 =?utf-8?B?Y0dadk1oMkpISjF5eUx0NjcwN0NVWEQvUmg4WlBoT2hvYzA3cmhlelJTN0Vv?=
 =?utf-8?B?NUhrTnFZamZhRFRSTXJPZVRIR2ZCdGh1MERQQk03NWJpcDd1YWlFSkZKUGlO?=
 =?utf-8?B?WWZSQWZPZmcvSE5ac1pqcDZFSEZZeFMvRHYrUytHVm8rNUFiRys5MmxYcGth?=
 =?utf-8?B?aGNtOWUwZWdHS3k5bkFHVk1IV3IrWU5Pa1RseUpkNCtUR1JoMzVRMVB1WHpI?=
 =?utf-8?B?cW5sN1NOY0hUUkIrdkRRc3M5VHRLYzBxcENrU2FZNnBkdTBlWk1POWhoOEJI?=
 =?utf-8?B?OGhUa2loY1JscThHS2RrYW5YU2c2UHY5dHErRCtTZkkvaEp6QmRWREZua0JK?=
 =?utf-8?B?WkF6elJEcmFsQ0huREptaFp1NVE5eDNIQVRySzExSy9ZazZsK2M3MWwvYWxl?=
 =?utf-8?B?NGVVa1hjRTcxK2Jmam8xQXRCZ2N5NDk0SW9NbkwrMWRHSm9vQm1LT05rTklx?=
 =?utf-8?B?SnFncGRDcXRkR0lCVlg0R0FiandncS9yRVVCbmVKLzdFUzI5cEpFZFJueFRF?=
 =?utf-8?B?azZkOHJOdEVUVHNKZ3FHcW9MR3lBbXVwRW1ac1lWTCsreUNWb05pVTNnN3B0?=
 =?utf-8?B?NzhwR0Z2STVRN1JqWTFvck9idGNwdWJaMTZJOG5EcTFmZ0NoZXVqdXBDL2w1?=
 =?utf-8?B?L0dyLzdrMTFmcDJtNDA1TFpHUmZ6K2VIczJiS1krVlA4VTU3Yy8xRndNVG1z?=
 =?utf-8?B?Q3I5NEtkd1E5MlZvQUhXNXFVZ2hDYy9GNVE5eWRuWlFoMjVHK0dPeExmVnNh?=
 =?utf-8?B?TUxIRWptQVR6UzZCY2Rabm9oenN3dkFHelVVUU1NY0VzVkFuUWNISTVSQjRi?=
 =?utf-8?B?aWYrY29RRDNpTWlZcjFMRkxpNHlNcU90RmhxRU5pZjJhVkI0ek1NMC8yY0p6?=
 =?utf-8?B?dDI0UFcwR1ZEUHQwL3phTDV2UDAveVFsUU5Sc1N4T0ZkQU40TjBEbVI5Tm05?=
 =?utf-8?B?cUw3S1JMelhVZjVxVGlaUjE1MEh0S1M4bVI3a2JrdnQ5MkdYUUJDRWpVTDFG?=
 =?utf-8?B?VFpXSXYyZHFINWRyUGtZSEROWGM4cDJHM3IyL3B1THc0cFRxZk9JMmM0VTdK?=
 =?utf-8?B?NW1BVWFiS3lDNHBYYy96ZFpnL3Zya0gyNWJEeUNlbS9lNEI3ZmdEeXF3YVdn?=
 =?utf-8?B?cEVPSkRxbVpVRzc4UzdNQjVuNHVzakdIYlhmUVgwTXV3UVI5QlRrZVZiRldL?=
 =?utf-8?B?cFB3T1FXa2RvemUzY1ZhTU5vL3ZkQklkVEtnaHoxZEJFazZ1ckU0NEp1ek42?=
 =?utf-8?B?S2xRSEFCcEUvQUd5dlJ1S1Z5eGN0b2dsL3RzK1BYZ1VSWlhrNDB3c0ViK3hV?=
 =?utf-8?B?WXNDSkl4UGpYczdteVJCblpGZFA0MWJwTmhGSjZxRzN6UEtlZWFBTGc2YStV?=
 =?utf-8?B?bngrazlZMVZTQnNVaW9sdUtIc0FhQThRZ2ZCcjJyZUZUMnl2YlQ2SDYzOWwr?=
 =?utf-8?B?QnZ5Mjc3WW5xVE9CZWhUZGtGSVVuRFBjOElmcTZVOGxqRkZCWTZ2OGRyOUJW?=
 =?utf-8?B?djJBZDIvZ3B5UXFyRzNLTStIRWVTa1R1WGZZNjZZSEVBRjBUTDJGWmgrZXlU?=
 =?utf-8?B?MFZ5UnhPV2F3Y2I2Q0prQW1URjk4ckJwZncxN1hiZHVQSHN4WHA4bVFyRHRE?=
 =?utf-8?B?YUpjSnNvanBySVZ6ZGhwY3FxWHkzQUJGZHBOWWY5dlNPS0d3K2FKNEVKb0N5?=
 =?utf-8?B?RWE2SjBmczZvYWI1NnhnNDZSck5uNzNtZGFhYjRzTEhKcTA4Z0xES1U0MjR0?=
 =?utf-8?B?czlyWk1pZXI0V2RDcnJuVEJJZlNnRGgxdzFxYWJwM24zYWw5eE1wREJHWGNP?=
 =?utf-8?B?MCtSZjJNWm9kdnI4OGFDMjdNWjlGeDVPVmFiL3l4V1d1YTBRWlZsZz09?=
X-Exchange-RoutingPolicyChecked: PBQvr5JRtEBiUsFmpcCaLckC1OgW9tYt+RPTa578agr38H7c0YPhEcbebpS7+k9cMIAdfozbVFf5isFbPSF6/Ax0VQ1rf64CcyzFd1LleXGqPNoYpp8DjJz/jMDSGogKIfCo2eWCBPhoJHmG676u67my3Smwqg0Xax9Ta8bTGUyhNWuckxQBKg9PLx1PG32eX+IKRRoq/9F/LwRBL3H8+wVmeTimU7xKmbtcB5JHKCusYFexcFhyKALe2WGGArQUEOO1YM1ftMaWWQsBj1B5sGfWaXNEXiStn//p0zCqtcz79q9Qmtyj8Zzu4ZKdNhnHNJrNVYHEUou73m/3awLpig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1202c6eb-ebf6-477c-f458-08df4874119e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 08:39:06.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMYrjYh005LZ09OIokB94wZkuwAYlPdj7URiUN+usohTKwGYzxtV7MWvcJwBC1uzEKaY5/13Wtg9gVBdexPFxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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


On 12-11-2026 18:13, Tejas Upadhyay wrote:
> xe_ttm_vram_decay_gc_worker() unconditionally called
> schedule_delayed_work() at its tail, so once the worker started (on
> the first SOFT-offlined page) it kept waking up forever at the decay
> period, even after every SOFT entry had long since decayed away or
> been promoted to HARD. The reservation path already re-arms the worker
> via its !delayed_work_pending() check whenever a new SOFT entry
> appears, so the perpetual self-reschedule serves no purpose once the
> list has nothing left to track.
>
> Track whether any SOFT entries remain after the sweep and only
> reschedule in that case, letting the worker go idle otherwise.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 07360ab7b072..7613024a1410 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -373,17 +373,20 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
>   	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
>   	unsigned long now = jiffies;
>   	unsigned long decay;
> +	bool soft_remaining = false;
>   
>   	mutex_lock(&mgr->lock);
>   	decay = mgr->decay_interval_jiffies;
>   	if (!decay)
> -		goto reschedule;
> +		goto unlock;
>   
>   	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
>   		if (pos->mode != XE_PAGE_OFFLINE_SOFT)
>   			continue;
> -		if (!time_after(now, pos->last_seen + decay))
> +		if (!time_after(now, pos->last_seen + decay)) {
> +			soft_remaining = true;
>   			continue;
> +		}
>   
>   		list_del(&pos->offlined_link);
>   		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> @@ -394,9 +397,11 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
>   		kfree(pos);
>   	}
>   
> -reschedule:
> -	schedule_delayed_work(&mgr->decay_gc_work,
> -			      xe_ttm_vram_decay_gc_period(mgr));
> +	/* Nothing left to track; re-armed on demand when a new SOFT entry appears */
> +	if (soft_remaining)
> +		schedule_delayed_work(&mgr->decay_gc_work,
> +				      xe_ttm_vram_decay_gc_period(mgr));


If the worker goes idle then what starts it when 
xe_ttm_vram_retry_queued_pages() moves a SOFT page from queued_pages to 
offlined_pages? Can we arm the worker when that reservation succeeds too.

Apart from this LGTM.
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>

Arvind

> +unlock:
>   	mutex_unlock(&mgr->lock);
>   }
>   
