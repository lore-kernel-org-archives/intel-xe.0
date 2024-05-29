Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C7C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDABB10F0B7;
	Wed, 29 May 2024 16:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1KCY3tK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE3E10E5BF
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717000710; x=1748536710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ELEwJN7UNg1NCRJe2YP7uERRn1A+P4ZFPGvLBGNRJNg=;
 b=V1KCY3tK4TqM2aW+X0+ISvhlavo99migyb9YHqMQOLapBZJC3yz/1tV7
 Hi2qrjzPYQabYoZBZABz8UEMmvILZ2Ri9tJGtgU/EEi4t38T7fSnH29iq
 poqqCq7hnROasmW6e03CiOpQPcp5FAAOuBxekJlz/N/cMsPA4iPgMnH7c
 3DPtzh+jB44ONHo4TQBpmgISCOfyQi2GOXe1Pka7TR3xIB+Hb04X2IOwu
 9TDISmnqMxnbMzIOA5CnqqtLGFcflVcL1A0YO9qli2p0wXsyQAzctWd0B
 hPp/7h7E+ewIJLKF11GQAQp9qHyHVFGD12ceKai3QWEpwCS+L4fbuCME9 g==;
X-CSE-ConnectionGUID: YHQmgQUaTIOgW6KSZvfY1g==
X-CSE-MsgGUID: dkXbkgORQLiC+nBl9FMMeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13267791"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13267791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:38:30 -0700
X-CSE-ConnectionGUID: TRXRO7COSaeMD9KcvOwXvQ==
X-CSE-MsgGUID: s9pUxs78SYiFd+hZ7yUOEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="39918637"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 09:38:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:38:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:38:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 09:38:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 09:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvQ5QnTNCzGOWogUtj08GQ0GbjkjC4snAdMkGLUQOhjvvdm4CH8tm2GSnDhYbqoUhHLJWkDWr0oQRA6XkuhfrlpTThrG7AA4EftHfcF1zxr53zPYvIfymSbYSENa4ed9sby0Ph7xSRBmMIvBtisFW7FtH7wZHkU5htPjTFZxv1xPKQLw4Tx/w13tF5Ja1hxa+yXbXWtXOzBLakXQEHJiwJMCO2V1TbpI0kbShz9RWhDJIJSKvb1l0JNL9zWCsI0jfwcy5g+sitMZoDKcCy3uz54Trisi7x5h0J5WIoy8PG/uag3HoqmurbFpMwEGOS3dbjCosteFnn5oMveRnFqDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OozvB6XMIDhphhLDUZUb8Z2MXNw4b/Q8wbRKJybRbdg=;
 b=epxZWkPbIYxSvOCFLO4SyoAf7sIDDyRVczB9OIHNh0g58fC9mdcKTdDFzu+98F50lvmByW0XtYGD/2GOY7isRTHEaxricPi+08ol4lfF1uxhuZvNdw4DhslC0lmKxIh1IpnWYPrMoPys6MaYSYJRGzqyzz7cc8XqwXiHE/bAyrQufLk1iKgpKNRfEq54HjKzfHsPXky+jJ5qaN5Uv1k0O50nP5Z70OMVg1p5BwZY01j2V9VtkA2HVIqCJpdwJ9fdyrB3NyRAaxzWkV7Ma7ND9S7WkkkvUmJeGAlUKTFSkHJi/CST+R7CtV8hM/0hEBRzgVze48Dl+lfkWKXEeBajHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.31; Wed, 29 May
 2024 16:38:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 16:38:26 +0000
Message-ID: <eec3dfb5-8eb6-4de4-9562-cd2e593a53aa@intel.com>
Date: Wed, 29 May 2024 09:38:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe: make gt_remove use devm"
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
 <7a949a77-88c2-47e5-aa19-773965181bc0@intel.com>
 <001d2e4b-e9d2-422f-9f4d-dfe1c7b8bbaa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <001d2e4b-e9d2-422f-9f4d-dfe1c7b8bbaa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5607efef-4169-4fa6-2f8d-08dc7ffdc38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDB4Smo0YktRNnljT1MwK2hBTlI4TjRaM2pFMTVuRGhmd3RZQzliOGt2enBW?=
 =?utf-8?B?SVA1SWY2VGFaVk9QNlBvS25QSlcvbW1nU2ZncTgxTUJZTnc3L09SZ2h0ajha?=
 =?utf-8?B?MEU2QWZhMFpTVDJCNjRPdlI3Y0VySGZ1YStVcW5CbEVva2VZQ01BaDBrcTRv?=
 =?utf-8?B?am41WHNDSklIeWtUR3p4NVJva25aZHh6R3NVSUE5R2dZR3F3bEdmZ3FMYUpT?=
 =?utf-8?B?M1NTQlpLc1pJY3NrREVQZmt5MWJlYlFRRDdQYWRnOGh4WDIrdDRLNG1MajYx?=
 =?utf-8?B?aDcxeFlFYVZVTkRLMXFYeXlXdXRGams4bE1nVit5NUNxTkVJeWFBVFNmS2tV?=
 =?utf-8?B?aGJ6a0Y1RjI5c0FYSDNhN3I5Um4wVlRXTWJ5SmdvVVBodlYrcFdhWFlCZ1Fl?=
 =?utf-8?B?SUM0S1F0U0dGQXBWUGQ0ejBjSG1Jd052VXFQeVRSMjhUbUVtMkQvWUt3bmZw?=
 =?utf-8?B?Q3ZPZitVZmhwTDFjZ0lKNURIbkRPOEhKdE50MHZsbWc4U3pCKzV1dklybm1O?=
 =?utf-8?B?RHEwZVVtNitHZmlQaklySGtsZHBNV1hIeUNuTFl4MSs3TzhBRUNMMy9VemJa?=
 =?utf-8?B?QVJOZzFEemszSzhNNGFYN0t5N2FDSnU5cEpzODlVSm94cEZyRTYxOEI5RGp6?=
 =?utf-8?B?ZWloWWxqRC9WOTNlSjhEUUhCU20vRVNVY2RQUGJ1SDRmTUdpMVRMbHlwdjl3?=
 =?utf-8?B?Y21UOWVocUFEeVNhNTVaK1lCaFZLOVg4RVVFemVXOTNtS2NMTGFGN3FiTXNM?=
 =?utf-8?B?QWo3SjUvVkJXVDFLT1pNdXZFenZ2VHFtcWM1ZjlZa1BUbTlhY1hLdFc2dzJR?=
 =?utf-8?B?cUtNSEdlZS94TlJ5elp3bmY3b2ZaUDBYaGI0KzNXL1pmQzVjY2FlUmhxT1Fn?=
 =?utf-8?B?T05pRVJCNGZnV1BDSTgyS21Uc1Fyd0pvdit1WDYwbE5BUGVHZFRxUTJtRDFs?=
 =?utf-8?B?TVBtYm9QcXJZTkhzQ0lZV1pTeUYvc1NxV05YMzU3eXdCZ2plME5RS1RLcVVT?=
 =?utf-8?B?SjQrVkdnSW5pSitqTVZ1TlllUyttaTY2VHRabEhzaUhYMzlFc3lVVmxGOGRU?=
 =?utf-8?B?QmJ4cUV0WHF5WDljYmdZNlU1NEtGa0dSeitIZ3JOazFzaDJ3dDUxS3VaaDVq?=
 =?utf-8?B?SDhOQXhiaGo2R3Y5QjVta2R1ajJoRUNINmVMTkRYZ1FtdGRWbVRvOWsydVh5?=
 =?utf-8?B?K1BaVk9rYWFaYi9QcnF6M2JwMmJmc2RnVmd4SjF3b0tub1d4bFVSRE1yQWtF?=
 =?utf-8?B?SjRlQlgyanZ6L1NpemppYjhVVk13UTQ0NnUvUldoZFNjT084bkRveGtETEs1?=
 =?utf-8?B?eGVuK3VoSkhvRW56TDFmdzRjaWxneFFEblhPZ0tuRWdxZk5yV3hHWHlxcmM1?=
 =?utf-8?B?d2MvaUI3bG5TdDlJRGN0Nmphc1hhMlRFYXZVTjVDcEV3TVQ0V3BSU1MzdTlJ?=
 =?utf-8?B?R1FLVXRrU3g5OS9CSW1LanpFeHBlVTBKWDNnTVdOcEIwN3dlSnJLNEgvMHdu?=
 =?utf-8?B?MmtseGdhaTNZYnEwejNwQ2ZKODYwajhMVHVsM1MyWitaemtrN1kzT1FvdjRK?=
 =?utf-8?B?cmtyL0JNbk9wUHEvaHN1TzB0aTBYTGZPYW1mc2JLY0ZnOU8wWVdCZG9lQzhN?=
 =?utf-8?Q?SfktZpsih8Shg9xbPQvb9GZL1AsnsxVwe/xrbn5lEGV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGdqajFGQkNEVS90dytoU2U2Sk1POWJieFB3Ry9KSWFvODlYUVpITUwyMHVI?=
 =?utf-8?B?VzZ1UFBvMlFaRnlOdW5BUHNFLzRwWWczcnF5VzVmSU5WdG80eU43aDRORnR6?=
 =?utf-8?B?K1pHZ1RtaFU5NHkwT2IvYW9lUGxQVml6djdPZ2xrV3d4MENqSDBmRVEzbElJ?=
 =?utf-8?B?WTdHU3RFaHNRWDB4d3pwalM5OWVLQWwyWTJLYW9wQ1JDY2RwZlpRWHJ1UE5G?=
 =?utf-8?B?QVVSY1JHVFV6QmtLcTlrZDB1cG5DYm5mczNwR1lpWEdDWU5KTzJXNzJTRStj?=
 =?utf-8?B?QVlvcGRBSVBSVi84YkwwM3l0R3lseDVRNll5djhWK2M1RlJadkFOeDMwOUk2?=
 =?utf-8?B?Y29RRVJGZDhFYW9vYnhrK2JvMUNiT1I3TDhFR0tYbGhOTGZGckdyUXRIcGxS?=
 =?utf-8?B?WW5BOXEzSDVjNndEQndndUplOTRBemQ0TG5MSWtuWkxaSWdJdmpjNHAwaVVT?=
 =?utf-8?B?dU8wQnZEVThaUU9MalhlUTlCRzVFcWdCeHVpN1JQQkdxd3NWVGxydStPYnhI?=
 =?utf-8?B?cGNYdDVicEZxTDNnOFFPOGRtNldWTDlvQUJuc3lET3B6VVdXeEpiMmxZOGdo?=
 =?utf-8?B?TWk2My9xN2tYdE15ZDJCNVlOUzV1dnFRSlVqcVV5T2d0RGtpNzdJbSswVk1v?=
 =?utf-8?B?RWxRaVM4ZmFhanp0cmRPeXdBZkhXV01VYlkrZlU2UmZ1Q0lLSTh6RC8yZDNM?=
 =?utf-8?B?Z0RNaWhvLzl5eWRjSWxlYm5NNGUxb1hZYXEwVDBiaUozdUZoYzB6ejMyMTNQ?=
 =?utf-8?B?c09pYVpOcHhSV1FuZktmK1gyaUdhYllsa1hVK2hYNUYvZitQUm9JcWlBamNt?=
 =?utf-8?B?dmcyM0U1bUlUbDR6ZEg3MlJ5dUxIUnN5R3ZGU1lXUEJTTm5Wd21uem1YTW9G?=
 =?utf-8?B?Tnl3a2tSWElqUlFmNVZRQ1RwRVF3S1JRN2xVaUUzbWkwMGdrZXRUTnVyRStE?=
 =?utf-8?B?VDR0dHdOWXRneXF1b1l1N0YzZW91Y25waFhCVytCZUxmeHcrdjhtZVFIeW1v?=
 =?utf-8?B?WXNIMGFhaHhlOVdVT2x5L3ZKbmN1amVBRmRDMnRjWUdka29uQlZ4UzFKdElv?=
 =?utf-8?B?Y1YzYytEMjdaNm1QeWFJT2Nsc0tlZzJDbC95RktqNy9aU2FCcVZQVzFXOG9N?=
 =?utf-8?B?QTZRcWRIRk1iTDFtOFhUSzBRZUUyQno1RmxubDd3eURZYU0xaldDeEVKR3Rv?=
 =?utf-8?B?UXZYVWpIRVBlSWVuQ3hESC82NVFpcEIzd3Z2RlBWQTNqR1VscGJWTEdreEhI?=
 =?utf-8?B?ZkMvdGgzZ0JuaU95d2wxek15bW9yTDdWWEczS1RISHVDN29MVTZWR2xrWlFO?=
 =?utf-8?B?VUR1R1RXbXVhZVF3RDdjc0ppSFBXaUlTaWp2TTNLYWxEYmRoL1hsV2J4bXNy?=
 =?utf-8?B?UjdoVmtscE9WZFFSREVTSFVzN1U5Rk1ZTnUzU1ZLWC9aMHlqYzdldmdZT1lB?=
 =?utf-8?B?SWkvSzhzM3pmQjFHK0hucnByVzA0L3VZcWQvcldCc3FydkUzNE53UGdQWEVx?=
 =?utf-8?B?VWVvUEJJYW5MU0RCbS9CN0RYcEFzbEFHczVPVGFnbkErV2Yxb0htb1kxbjlZ?=
 =?utf-8?B?czcvQmw5U04wbWFla0d4Tk4rZC9LS2ZWaEl0TFJxbXRUK2d6b3NMVWVBMjhx?=
 =?utf-8?B?VDExUUViNGx0ZjFVYlRJWVRCZEg3TkhzWnprdmVjMUIydG9rZ091dEVQNVpz?=
 =?utf-8?B?MmJTTnUxeStaYlczWEg4UWNLSVMwdkh0MU9BcmM3a28za3NCamRiQTdPcHR2?=
 =?utf-8?B?STY0NXRrT0g1TzVkQktXdGhsS0pOWXNzeWw1cDdMY2dhVk5aRko0bFBvK2p4?=
 =?utf-8?B?SmQ2Z3ZoS3VpZ3pGSzhjRjRFYWw2MTBGMG82elYyeWgyaE5IOU5yVTAvTWhy?=
 =?utf-8?B?dVRBOCtkWHBZTTdTL2FQK3NQd1l4S0tPVVBLcG5vNHh4Mm9mZTVyL1BkR1BP?=
 =?utf-8?B?RW9vdE5sS1hTa04zNmxSNE1ZZ3RNc1hjT1duby9xOGlLdGtYU2hHbndBTmZv?=
 =?utf-8?B?R0xyQXA4a3prL0RwL0phR0dZWXRWb0QvdXB4d09hR3FlY3VycTZzdm5TNEF5?=
 =?utf-8?B?NVlwZ3ZRRVlRaHRQUEVYRG41V0dmSG5HMHdWZnBsOVY1VXFlRE03a3ZsZ0xS?=
 =?utf-8?B?SjBvRUtFNVBZKzVBRG5jQUpCMkk1b0tFa2ZDdElvZlREbURpWjNsVHRUcmVi?=
 =?utf-8?Q?1RNidjMu3ALO6V0VOihobqM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5607efef-4169-4fa6-2f8d-08dc7ffdc38f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:38:26.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wdcn/JUWJUUknKu0lrx06QYcOGLEH68xDMQJ4NYfr+7GyyEnZZbB60lID45IIeZZNlA+uIuawENpMwHOgDpfXbJKM74NXzGlfV1CjNffMjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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



On 5/29/2024 1:26 AM, Matthew Auld wrote:
> Hi,
>
> On 28/05/2024 19:27, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 5/28/2024 11:23 AM, Daniele Ceraolo Spurio wrote:
>>> The gt_remove function was explictly added as part of the remove flow
>>> instead of using drmm/devm automatic cleanup due to it being illegal
>>> to remove a component after the driver has been detached from the pci
>>> device; the GSC proxy component is removed as part of gt_remove, so we
>>> need to do it in the pci cleanup flow. The function already has a
>>> comment above it to explain this.
>>>
>>> Note that the change to use the devm also caused an invalid pointer
>>> deref in the gsc_proxy unbind function, but I didn't bother to debug
>>> which pointer was bad since we shouldn't be calling the unbind that
>>> late anyway and this revert fixes it.
>>
>> Here is the bad pointer deref log in case anyone wants to have a 
>> better look:
>>
>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/shard-lnl-8/igt@xe_module_load@reload.html 
>>
>
> I also ran into this. If we remove the explicit pci_set_drvdata(pdev, 
> NULL) in our pci remove callback, and rather let the core driver do it 
> for us, it seems to fix the above. But then we trigger:
>
> <4> [69.885925] WARNING: CPU: 2 PID: 1441 at drivers/base/devres.c:690 
> devres_release_group+0x103/0x120
>
> Which I am not too sure about.

This error is why I was saying that we can't delete the component after 
the pci_remove has completed. This is my understanding of what's 
happening (which might be wrong):
the component resources are auto-cleared when the driver is detached 
from the PCI device. Since the component subsystem has no guarantee that 
the driver is still present after that point, they can't call the unbind 
function while doing their cleanup. If we call the component_del after 
that point, the resources are not there anymore, which result in the 
above warning.

>
> Anyway, if it is indeed a no-go to use devm here,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks!
Daniele

>
>>
>> Daniele
>>
>>>
>>> Both issue were not seen in CI because the GSC loading is temporarily
>>> disabled due to a critical bug, which means we're not binding the
>>> component.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_gt.c     | 16 +++++++++-------
>>>   drivers/gpu/drm/xe/xe_gt.h     |  1 +
>>>   3 files changed, 30 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index 85c1b0c406a6..4c44f23e58ea 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -549,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
>>>       struct xe_tile *tile;
>>>       struct xe_gt *gt;
>>>       int err;
>>> +    u8 last_gt;
>>>       u8 id;
>>>       xe_pat_init_early(xe);
>>> @@ -647,16 +648,18 @@ int xe_device_probe(struct xe_device *xe)
>>>           goto err_irq_shutdown;
>>>       for_each_gt(gt, xe, id) {
>>> +        last_gt = id;
>>> +
>>>           err = xe_gt_init(gt);
>>>           if (err)
>>> -            goto err_irq_shutdown;
>>> +            goto err_fini_gt;
>>>       }
>>>       xe_heci_gsc_init(xe);
>>>       err = xe_display_init(xe);
>>>       if (err)
>>> -        goto err_irq_shutdown;
>>> +        goto err_fini_gt;
>>>       err = drm_dev_register(&xe->drm, 0);
>>>       if (err)
>>> @@ -672,6 +675,15 @@ int xe_device_probe(struct xe_device *xe)
>>>   err_fini_display:
>>>       xe_display_driver_remove(xe);
>>> +
>>> +err_fini_gt:
>>> +    for_each_gt(gt, xe, id) {
>>> +        if (id < last_gt)
>>> +            xe_gt_remove(gt);
>>> +        else
>>> +            break;
>>> +    }
>>> +
>>>   err_irq_shutdown:
>>>       xe_irq_shutdown(xe);
>>>   err:
>>> @@ -689,12 +701,18 @@ static void xe_device_remove_display(struct 
>>> xe_device *xe)
>>>   void xe_device_remove(struct xe_device *xe)
>>>   {
>>> +    struct xe_gt *gt;
>>> +    u8 id;
>>> +
>>>       xe_device_remove_display(xe);
>>>       xe_display_fini(xe);
>>>       xe_heci_gsc_fini(xe);
>>> +    for_each_gt(gt, xe, id)
>>> +        xe_gt_remove(gt);
>>> +
>>>       xe_irq_shutdown(xe);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 6f4b59a6e710..98c2228b51d0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -93,14 +93,16 @@ void xe_gt_sanitize(struct xe_gt *gt)
>>>       gt->uc.guc.submission_state.enabled = false;
>>>   }
>>> -/*
>>> - * Clean up the GT structures before driver removal. This function 
>>> should only
>>> - * act on objects/structures that must be cleaned before the driver 
>>> removal
>>> - * callback is complete and therefore can't be deferred to a drmm 
>>> action.
>>> +/**
>>> + * xe_gt_remove() - Clean up the GT structures before driver removal
>>> + * @gt: the GT object
>>> + *
>>> + * This function should only act on objects/structures that must be 
>>> cleaned
>>> + * before the driver removal callback is complete and therefore 
>>> can't be
>>> + * deferred to a drmm action.
>>>    */
>>> -static void gt_remove(void *arg)
>>> +void xe_gt_remove(struct xe_gt *gt)
>>>   {
>>> -    struct xe_gt *gt = arg;
>>>       int i;
>>>       xe_uc_remove(&gt->uc);
>>> @@ -566,7 +568,7 @@ int xe_gt_init(struct xe_gt *gt)
>>>       xe_gt_record_user_engines(gt);
>>> -    return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, 
>>> gt_remove, gt);
>>> +    return 0;
>>>   }
>>>   void xe_gt_record_user_engines(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index d0747edfe020..9073ac68a777 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>>>   int xe_gt_resume(struct xe_gt *gt);
>>>   void xe_gt_reset_async(struct xe_gt *gt);
>>>   void xe_gt_sanitize(struct xe_gt *gt);
>>> +void xe_gt_remove(struct xe_gt *gt);
>>>   /**
>>>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines 
>>> and return the
>>

