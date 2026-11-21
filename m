Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45263606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djdkGVQN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Qb4q+xf5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9AD10E49E;
	Sat, 21 Nov 2026 13:23:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BA010E49E
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795267402; x=1826803402;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pygCDcj5HMAVhpL4FLYZ7WnESV6Is4JmDeOKxFxDP4U=;
 b=djdkGVQNwYw04qy+7H34ooXmQrhFZo1EnR66aIB1J2mW7/x1V86yiZXj
 Skfp+LQ+YJOBH5vmxxmdjtU1dJ0hIzalc9KRSBuwfk2tDYUk82IIVLVa/
 Xxjcc1dkoFOTP83BsMYVYzerBshlT2JgW5lBxF701oBPQMFkDV1hbdb0f
 ch7YJ7uiObU7V9xL13lgECfouXaxeWDHjoJBrKE5Ioh38TgtUQnY8O8dn
 BlmLIhUB2ll+OSrZGdR46eHaN5bu8ecB6Lfxe9LUNFS0hjQq42N14pFt9
 iNVL21naZFqAx73tuNC/lCVIz+gUte5Gs5hmT29BOEQQD/77IA7I7tidt w==;
X-CSE-ConnectionGUID: e+bgI0MLSQCGU5lpmyocMA==
X-CSE-MsgGUID: Lil+c51BR0qsLg63f0M9ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4162858"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4162858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 05:23:21 -0800
X-CSE-ConnectionGUID: +avhoGEgRXiawoxJLevpRw==
X-CSE-MsgGUID: Q5i+mMeNTLiOwfibimDaxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="11182613"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 05:23:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 05:23:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 05:23:21 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 05:23:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb9i6CIlPASPH5oSIRo7IfpVQPI93BBRQP8GB8+s9LjylHULcbimiyOFx46rUrRxU+PNlzd8yPMgzE2f/ayNpfcDab1FhVVfchpQULRvvKabCnBgW/+JLPWhqKXmXZqZQUZQFGtP27HKUvEyeD6UQR3N58AGpWjH8B5X1OFEoT0VYzbJTZHz9TJY+h9koJiwT5oRp5AyEacQJ0eKpFP9WqUWGT+/6T1GaeUV52nIpzSoFolAXPPUqBIwdDjbwuTiTLdwt0q6EAGGNtSWzd35/hbf0n9UwqLaMxqycrO6nBVmCznYgKTQP5c6PkJtaMoaIZIdJoQCU5gkTZOsdRJoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRZzP+5ulY/fWTZcmw3l9gcEPIQaZ76ZvAO90vJzok0=;
 b=YXPCdHcBCjNY+IEP1n1Kn1Dd0wY1oX7ncMpeqrmapjTtE9F3mCSQgn/7h6ik0JsualTRTYexQAY7qlfnF38ahRcUxOFr+iBLgb6RE1noACRqfa/wWHtnnmR2zwWVMk5A4u/FtA63geCuH45yX7dq66XsAe7taw7wo52RRvkUKBOgRkYl9BixhE+EjWX7Q+jhmYUYd7yHkpcUUfCI6/WsMuYa2YbLq+5mOhh5Jvmcg85T9+GhMGHE1NqZvwa2HpzQQsfxtAGACe1zMTMNSYlmR9NdZZ30eMW56UAgF+VxpsQllW6Wg01RGXT+ELF+UszigbdQFiXflUL28FkRpIWBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRZzP+5ulY/fWTZcmw3l9gcEPIQaZ76ZvAO90vJzok0=;
 b=Qb4q+xf5dmhsvFsS2Kcn9ujga9Van5Hb1gAnz2lkWjOzFP8mWsOzbEVdDgSSnmV7iFDzBKB3wNwWneLpNHW3lnIC5WaG0b3Urra9vyaUBAraTi+w/+L5+lZdu4zS+6+QoGNLW3Iv7p8fhUSGBo7XZFO7PYTDGkNkOFUJMlsx4yM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 13:23:16 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 13:23:16 +0000
Message-ID: <0c4c526e-e181-4702-bf14-2794c191fa9d@intel.com>
Date: Sat, 21 Nov 2026 18:53:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261119104029.3066660-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0297.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::12) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6df3a7-6448-4bdd-7e90-08df47d29a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|261009223027099003|261026140227099003|11063799006|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 22nqKcRO8Y2Yoe5eG6zkZantDibw9P4hnhRsu67nZQZ03Wzv+0z/7AjFOtW57b6SvSQe4CNoXM8PIT121Z5440V9Bjd+srP5XAn2OGk/kHFu7ThQwbSWnXQygs0STbg/cNYs8UX2L/l2QAV4vzHmrfrKlq9CK1/LFyLltCPPOL5JuyFffUIl6AmhbfvGHYWmyX7Xrx4NiC290xW3MY7NwykNdvrDoezydapK34AM4+UGNXwgCQT+j4sHO949NwkBvcr4AOSiKyRoIhvxgpTJP7NE6eZG5nZso8tA3JY3rGQo207ZCkUgJxEFbCmstCX//L+Fl+ViOQLcuMpsn1VkDd1UMxYWr+fpE8TsCTgVd1IOkaaGA0sprzzrWIhvCb8YlNa6AkPWPlMU8KEmk6/vmM8dERBH9zj6XNbm0J5/E1RFKsviHIlVoezsXtHXa07hTFC9mwnHslsouNpep6/kTw7T+REt/CteqoieA/oZ6EJ0hvxunafvWTYFgthk3mBItzkzsmFhX2kWFz3TKy7Sm1feQBMnLAaI40smQzdSiiTbCsEvNEp5r99oKfXZ5W3BqvFhU4kCCnStrCJXmLAVZtwIunk65ROcznKgVExY09K32CxAKYzG1BziP5UIM6mR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(261009223027099003)(261026140227099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9RTzMvQWFUdXNuajExNkdraUVyYWI5NkxOcUtDVVoyTWRhZXB0QlN2cVNP?=
 =?utf-8?B?dmpQdmNnQ3ZST2RXN3ZyZzBhYWZ4MWp6MWVzb2ZmOHVpTmd5Wkd2bW9OZEoy?=
 =?utf-8?B?QkhhNFFPR2FJejdJb2RReDl2dnZFK21Ic2lDaUxjSmdINm9kOUJhLzVpTDZ1?=
 =?utf-8?B?TWdDZ0xkOTdkQUxZRGxBTTUvYzJGV3hTNVpGblpTU0hHSGJlOTE3UW1UaVpw?=
 =?utf-8?B?SG1jSXNvUDAzSW1MT04yUDZRWkNST0dPTk1EdjhRQ05KZHI2WWdkcFlQTWFP?=
 =?utf-8?B?dUdhOTh4RDFvMldpZUUyT0lYKzVnYjFBQkViMi9EZWRaTHFhZHpERVBIM2NV?=
 =?utf-8?B?NUxYa1EwR0V2a0o2MjdSQXBQRkkwVWhJYlhpaXNRQlNpYkh0ZWZDQ0VlRXFW?=
 =?utf-8?B?NXNsTzNLY29vMlozenRNcTJOTE9WcUtNeTk5bUNad1AzZ2FuVElFdTIwM01Y?=
 =?utf-8?B?bUVETjM4N0VhRzRhQ1dqMWhYaFlsRTNVUWZPMnZSRnJ1d0VSQzFiUmNDdURs?=
 =?utf-8?B?NldhdHpvdHE5WXRkVjRST2FNSUNXcHFRakN1VXhaYUYvdlA0bC8rMnRGYWpW?=
 =?utf-8?B?WGRMZFp4cU5waEdGL2lwWFZKdXJUMlBZUG1Bc1RkL09TdVR5OVlVbDJKbzFV?=
 =?utf-8?B?NWhhWUVPMU9WeENheEl6V2xmaWJSSW5NcG1XYzNxZHB0QUlrRmQ5U3A1K0M0?=
 =?utf-8?B?b3RlWWh1WDFYUHlWWkUxOGNEUHNqM3pXSmZrQVdOaGxDeWJjRlpQMHM3dy9K?=
 =?utf-8?B?ZHlIc29kRTBxTnA3VHJxeGNJMi92dnNnU05zcUNWcWloR1JhTCt0VjlwNTJR?=
 =?utf-8?B?TjQvMUM5Q2NORnBoQ2FBcG1SaDAzM09yVUc0Vjd6VGVqNnl2MDNVTm1jZi96?=
 =?utf-8?B?NTFnMm9RaEcwVUYwMW5YUmh5Zy80K0ZVQ2MvcDMzSDdqdlQwcURuVHlVemJy?=
 =?utf-8?B?M3dZRzVrSldxVlZNYmZxeENjYkpMNHZzKzd5MkFvU3hQZzBtWm1qMHNPQ2x2?=
 =?utf-8?B?cG9UeS9kamlNSXNxTSs4NDVOd1ZNdFZkQWpGQWtQaDI5YVFyWkY2RWVoOTky?=
 =?utf-8?B?U1hkRFZkQnQyVk1KeEVUL2E1T1htNkZQTm9Mdk1GUWQ2Z0F1VmNkeHR2c2F1?=
 =?utf-8?B?VlloeHlKZWlTLzFuNHoxTjZDWUdRdGJUVEFDTFpsbERXZkkzeVRwUGs4SHhv?=
 =?utf-8?B?bW1DYjMrMmV0Sm9IOXI0VVB4UXN2blBsZmJDTGN2T2JnQm1OblozMVZ1VjVj?=
 =?utf-8?B?V1AxQWdXVFI2bzF1a2dhNkpWYi83TVUyWFhzRjdlWlBhR0RodThqNGY3TTc0?=
 =?utf-8?B?Z3JCMExuQWx4SHhtZTVWVlZUVmFiYmtPNzZlRUZSOVBGUHhER2ZnR1cwMmZB?=
 =?utf-8?B?Rk92Q0duTDlzU1FxZk5oRGpnbm9iUHhVYzJqbXJXbmVZR1g4MFlKQXdQTW0r?=
 =?utf-8?B?YitFTEdxSDZHczN4b0gwU0dJR0dWNnBJZmRIZEJ5SkwyN2RDUFB5NlZWNmRk?=
 =?utf-8?B?QkVJM0hZeE50RzdiL2tKQThId3RRQnE5ODdzV3IzUk5lellsL1BtVWwzNWlO?=
 =?utf-8?B?ZlZLZHBzcXFETVFXa1E2Z3NsbkpnZU5lb3BYUmpvK21XaFNaV1FPQ0s0a2J0?=
 =?utf-8?B?aEZ2RVdsbVBHeG85dW9JdlRZOW8vQVIraDMzWU9JNjR5dlBoNU1jSkdvSURJ?=
 =?utf-8?B?WjBsaGRzYVJ0V21MUDEyb29YdER3RFAxTWJYOHNWWDRtMUdtQXVkOHhwdC9z?=
 =?utf-8?B?SHROVlB4a0lmeHJRSThuR2FzWk1Oa3RRNC9ENERrSkVkUjFSMVU4bjlhaHhk?=
 =?utf-8?B?ODZnTW9BaTBHM0FBeVNHK0QrK1RCRVRqMVRESVZmRlQ0Tm1wanVwMWUrSmRm?=
 =?utf-8?B?M0pXVkFpaG0yMWJFL1hyaDNRVlVTRkcvbVlYbkdMOTd6L2RrNUpwRk5kN1pw?=
 =?utf-8?B?U0t3SVdab05Xb0pzR1JtQ2pQN2FyY3g4L3lPNFVtQ1E0RUh6RkNVTGdITmxl?=
 =?utf-8?B?bCs3QVUvK0loOC9jd29pWnlKTEF3TWRPVElTNUYyWXM1Q0x3TGtkdDBFMGpr?=
 =?utf-8?B?ZlhycTlhcFVmUG1sUG11MWlnVEp4QmdSYXFJdFhiQjBrVmhPWlFMMUUrbVBh?=
 =?utf-8?B?Z292Z2dZem9pYzdsVnVlV2tVcXRZME9XaHZYbGFOcUc0Rmg3K0RCOGluTkY4?=
 =?utf-8?B?cjRvS0pCR2FKSFhJQjZ5SUxtVG44UUN5TGw2VWVGOWFkNlIxNWt2V1dUQ0RU?=
 =?utf-8?B?MmlydkUrVC92M05jdHVWMlN0TU5mQ1RBeWZLTG1mYlRpaUIvSFc3RTRIdVpJ?=
 =?utf-8?B?YXhJV0Ywb0IzMTBGY0dmUkdrQzVObVV5Q1lLQk9tWFg2Y2swRy90RUM5cnZZ?=
 =?utf-8?Q?qUnX/645J/TEsTGQ=3D?=
X-Exchange-RoutingPolicyChecked: A8ZS8zF0woM4GbglOiic2X+8stEacpExjMIfThLQrq72eSXN9oB+AYg11q+T4DGUlwsZ5MSu8GiFTo7XwQMIObfoxk/n2RcPe9oQzU4lTt12ZmQpzv4k4JYtByIjTl1NGq6u2FSkm2ejuUwBhfOsbrDe1itGVpfCmrXLDrCGbLGctDusdD8Q7xBMq/CE34Zz+sa488T095kTYI4Y8LtnTPSUOSj7jDdiNolHaNmaYENr8Rm5d5K1HLLzp8euSvtLM6GwgH8vbvUPvUUXCB7fYyW7oQFc/jkq5AILyXElWKCpiD36usmVMpM56ZyrmIbLgXCNxtlq5aJo0taAp2ln1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6df3a7-6448-4bdd-7e90-08df47d29a07
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 13:23:16.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fhi2h6OERGVvvpwXJx+1vhy8/+5cgeKiDd8yd8s3/lTzawO+WC1pg14UDZ2+2rTwY9G1NWieIlyseve3ubiQgqJiMLmU1rciCn1fKf8pvVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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


On 19-11-2026 04:10 pm, Karthik Poosa wrote:
> Add a read-only power<i>_cap_max attribute for the card and package
> channels. It reports the PL2 (burst) power limit that firmware sets at
> boot, which is the highest value userspace can write to power<i>_cap.
> The attribute is present only on platforms using mailbox power limits
> where PL2 is enabled at boot.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>   2 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 0da739d9a816..097902fd8346 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
> +Date:		November 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Card default burst (PL2) power limit in microwatts.
> +
> +		This is the firmware-provided default limit and the maximum
> +		value accepted for power1_cap.
> +
> +		Only supported for particular Intel Xe graphics platforms where
> +		PL2 is enabled.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_max
> +Date:		November 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package default burst (PL2) power limit in microwatts.
> +
> +		This is the firmware-provided default limit and the maximum
> +		value accepted for power2_cap.
> +
> +		Only supported for particular Intel Xe graphics platforms where
> +		PL2 is enabled.
> +
>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
>   Date:		May 2025
>   KernelVersion:	6.15
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 515b288f18e5..023a317a443e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info hwmon_temp_info = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	&hwmon_temp_info,
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> -			   HWMON_P_CAP,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> +			   HWMON_P_CAP | HWMON_P_CAP_MAX,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP |
> +			   HWMON_P_CAP_MAX),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   
>   	switch (attr) {
> +	case hwmon_power_cap_max:
> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
>   	case hwmon_power_max:
>   	case hwmon_power_cap:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
> @@ -1486,6 +1489,10 @@ static int
>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
> +	case hwmon_power_cap_max:
> +		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl2_on_boot[channel]),
> +				   SF_POWER) >> hwmon->scl_shift_power;

At line: https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/gpu/drm/xe/xe_hwmon.c#L1501
What happen when pl2 is nonzero and scl_shift_power is not initialized. it will show 8x high value. right?


Thanks,
-/Mallesh

> +		return 0;
>   	case hwmon_power_max:
>   	case hwmon_power_cap:
>   		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
