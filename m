Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE9C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 09:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF10910E36C;
	Thu, 13 Aug 2026 09:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFoYJpeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF3D10E36C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786612358; x=1818148358;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mpk7TAknTWyO/yhOyrWkCRGmFT5hC1yZPP9KCp+9wuY=;
 b=NFoYJpeYi8n8x38Shk9WTZheUKHzu2VMbALSjgAIOlhiC6zh28Nh0SA8
 zxPRDNOct/SLor3jJpUQ98xevzoisu35RzPN4LvbqKtohn7svO6WsUWA4
 F3lXICwRCRgRA2ugvWuxwCHpvL5roo6WUvL60xWcCHkquBfBVVTgAb1sg
 wqVat5MCs2Ku+eRnq/iCK+qHFDrk9d2EYfOKlrJkqzGw7QH7KtHCzMvqL
 hp6C+fPJArOzSBR3TyBH1VtcbvPHpyhZu+9kYsf8cbsYHSeIWlxD/Bh0y
 TX3un7kh37cp4frxNeXiHVgM0jtE9vYG08Pen+Wlx1NXnCx2RC93p+geY g==;
X-CSE-ConnectionGUID: DOuzsDdEShSwSFKIvcoloA==
X-CSE-MsgGUID: aMjzDDCyT5mz7ghbdlbKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="74719881"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="74719881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:12:33 -0700
X-CSE-ConnectionGUID: WKmafqGOTw2+S2raqDx6BA==
X-CSE-MsgGUID: CYrUxsdvTeeZBbneylmOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267405472"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:12:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:12:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 02:12:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 02:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIzQwwY40djlbJLtkeMJNMOIe4vzxmjNPLIDHgAOrDj5cCjdGw83zjCPMJhtO5NxCZmq9HPHItKQLCubODwCWwkzIfd4CpG+IVeTNS3SMm6HO9/kbJpNsk34zlze7ntnEdpfpPrvG+H4JnO1D4nRCiIKuT3ONykBDFXoLJewahrLD+gyoZaTjn5MBy9gFx/i4tw5JjskWA38iY3ePp2VJko7xXckCPOkTtfshtUJhHBDbDJ+ulRSVtMRhB4DFjrMqiOg07bm8kOMKHj48KzM3bB89lVhg8/ZgOWQrNuCp3XzEbB4Ew+UwDUV5djGTSeQFYqMQWumyYfunTu16aVqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEE0zirtz71YG921KyoKpUXfuKIihO8CTUcuuddQnLA=;
 b=GzFbqZQDVGDrCkwpnj/2ICbnhlfvNsu0dJ6U+SYvqFhE1/U0vnrysXH2UikOxblpvUc0abrz/r7jdUM3M+dYx7jIyDsg9omzluclSCA4OwR50ORtlORPwOfrD0Xb9Ur992/xM8nTa2LFYPFZHAxGZEIyHYO5QTuMQEs4NXQukf6ZpcSAuMYyO/+cpUAdTouMX0sUsX5JSFKGWZE5QTELJrmLGVzk6Mw2jUiks6ntqHwbjAbMZbSQcHFHhRNou7SYam1j+wAkDEgIWd4Y0ucRMPGX4pNadyQ1Q04/PoiLpSxxaplqcayFv69cuNLUgdYWz4bdGMCufqZIOcrman9Q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB9540.namprd11.prod.outlook.com (2603:10b6:408:378::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 09:12:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 09:12:26 +0000
Message-ID: <e098768f-4946-4671-bf80-e961f1d99700@intel.com>
Date: Thu, 13 Aug 2026 11:12:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/32] drm/xe: Report all probe errors using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-20-michal.wajdeczko@intel.com>
 <7beccc51-6814-4680-bcbf-225580abe886@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <7beccc51-6814-4680-bcbf-225580abe886@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c2651d-e1ab-4ca5-485d-08def91afe1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 87omuFKD4ykRdOpo/4OFpwKEgU+YHN95UfIDI6zlqUkNe9+k1+CAdf26ESGvfr2OGK8TzoVwBvYThN3dz4BmfrlgNojF/SiWHlmXPnp6RUHVtpqH7AxmTPB+VCA4+EJTbTBITCjLO5n0KchCjx0ggC77/CVW2X7weGWej9ktDKh27J/9u/P60kjQLqxp8fjqNjIQI3yMqLML51IdzlVnRazrW7+qZDiswhqwROlpfutJxiXrR9eQnmihbseby+7cE4slNGDR2IFFfuA79/pikUZzaVwJYckKiez6Ng5C1hE+YDjJXrKLwFSs8IlpP5ljaVnRUCIxL4wDKznoQajRu1lQlMiFXj3YRCsjO5aQ5IXyW2VDZSIdoATwkKTUkHywXBTEoNhGZ0k0+sSSH+Q1o9DjIkeknQYsv+tyYwMYDBr3Gnud6tLBZWm00DXzCvWvzpHFcL/pjlFmTRpYY0Dr3UyU3UnWx2te/gUKq6molWjhrokMIq7lX3au/pbdyi7i3LwvDIrAsyizgxu/BHGq6yYACV67kBrTLHH2wok78a4PG0P82O+7zhFjYmK9d/MLYoLe9uN8mhyaIldWEL5gr9WOhtyMGbKfDkN5jahRgHeM6RgZnVeefbKDrab/JQsdMcPGmjqH9NQtYmC81kc/2xdQs/sFIqfihwckRqW2k90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlpCMzQ1SUZpenRKeDk5TC9OV3NWTHF6eGR2aTJ2bm5iQlhWMHNINGl1NndF?=
 =?utf-8?B?aU1nY3Y5eFh5WmIwOWZUeE4yYndxckdaaFQxa1ZNTTF0c3d0T2NqbitFbDRN?=
 =?utf-8?B?NmNxODlRVVp3djR6TkZNckE3MUJqd2c1c2J0ekxMbXR5dFhsRVphZTZGMURN?=
 =?utf-8?B?K25JNXVqcVp2TEo0TDV6dG4rbzc2TEZiTVQ4WGZmaEdyMEIxUGhXU05lbmxl?=
 =?utf-8?B?dEFrcndWRkpEMzQ2cHVNMGc1WkdLSlI0QmtybWxzUkEzenZ4Zm5UOVVUeGd1?=
 =?utf-8?B?d0xPR0xMb3llSHRLZXZleTAxak90N3lJdm9pWjNxWGpSQTU5WnR6eHZzVVdE?=
 =?utf-8?B?TW4vZlVvS0xBYnYzWExJRHNSMUdUVko3cEtSOC9Ka2E1b0t6aC9senVCcndr?=
 =?utf-8?B?ei9oNkpPTHh3UWhuY3ZwcUg0UWd3cm1FUEhVeUhKTFRWNU9vYlZySVpiNXNm?=
 =?utf-8?B?K2d4TzFuSnRNM3F3OG9xd0t5a0dIZEhXdWUzNGRlVCsyUi9tYzFNRWd2WWVi?=
 =?utf-8?B?MjBJWlo1Wi9SVFRrbUt1dFEzL0U1NmR3d1Q0YitnTmVSZjY4a0FBOWI4b2tC?=
 =?utf-8?B?eDN1T3RUdkJIY3RqakwwVnRGN1pxbWVBZzIzVFFxZGRBcUFXalBaQW1sZGhB?=
 =?utf-8?B?QmZFbzJBUDhtajZZcVJRbTV0TURXL0h2L01LelV1bURTU0VxSHpNVDM3YW5x?=
 =?utf-8?B?SGJ0eEhvUEJFTHN1cHZqK1JjdGpSck9iWjhibm9kS3JNaW9sVFBuQ1VtajNR?=
 =?utf-8?B?bjhzQThrc3ZJaXlvUndRU04wV0FZQmlxVU85OE5tSlFpeUpNZmdJdDhZekFH?=
 =?utf-8?B?WGNxVjh1NU93cUlMMjZScitYb0pxOVYzeVVzM1E2QUFXU3VMTnBaaXY0VGNB?=
 =?utf-8?B?dUNaOVdnRW1YTXUvZnVtdEoyakk2MHZJZVpScHk4V214ejhWTnFSNUVCY1dt?=
 =?utf-8?B?N1orRWI4QVRKTTJNaVBxN1JTVDZvSGN4b3FxSndMYmUzVVFod0lUaHJTRXNF?=
 =?utf-8?B?SVZia3gxVkNIenRESjQvZWdyQ2ZXaUxMUTBNRmhSNWdwOGlCSlFVVTBqVVRz?=
 =?utf-8?B?NlJmV1pnTzMyRnN3V3FMVXdNemVSM28wV1E0RGs0ek5SYlZZbG9jOTBIWHV5?=
 =?utf-8?B?OGhWQUtxSEN4MlNjWmRnczUwVzc4dSs1TFgvUHBVWGVEVFZGaFZKTlVUbVMx?=
 =?utf-8?B?UUw5RS9LVnJIaUQrKzJnQzl0YlBNUHYwNXBxS2lhTDFxV0tsWVEyeGpRc0tK?=
 =?utf-8?B?bTBNUTRwNE40bHc3QmY4U0docFdEeE5pYW5qcUJCS1lqWWlxdnZYLy9kV3Nu?=
 =?utf-8?B?dFRKaTVzWE41ODV0TkE2dHJnWHZVdWxZWHVQckQ2L0F2cVpmQkJlWTN5UWR3?=
 =?utf-8?B?eG1HcjN6ZEVaYlJDK2xGMEJ4RkgvTWM2ZXNlQXFLd3JsNDdwU2tVcTFORWRX?=
 =?utf-8?B?aG8zMDh4MlFTNm1oSFV5WkNJaXlwcEFSUU8vMVptS2drcGthUjZGUWhwaHZQ?=
 =?utf-8?B?YUk5SzExd1Rsa1Vna2RFYjBsNnU1QmVXWHpUS0g5VDZiMWlCdGYra0cwcTRL?=
 =?utf-8?B?alQ3SlR0NEw0VitpVWN5RlBNZkRZN3F2TGdDMVlnRWl4dFlaV1RUV0JacU1X?=
 =?utf-8?B?OVFRU1d5VnA5YlMzTTY1am9IdG5QMDE1aGw3UnMwQTJQckM3NXVvWi9pYVFI?=
 =?utf-8?B?dUFTcHp6SWdZRVFXRnVBejNhTG43eWUwdzhnMU5seGNYVkQ4NWp6LzVwQzRy?=
 =?utf-8?B?TndYUG40T1NQQTRTT2k5U2NuQ2RqVEVGNDJQeEhVZTA2dk5RQjNRUWRQczUr?=
 =?utf-8?B?YzVSVm1yTjAxajliUE5HSnYxakQyVFJ5L25NQ3hURFBEaUYwMXhqVnZoMTFU?=
 =?utf-8?B?L0ZldS9iVnJEMjdkQmNKWUZFS2xibGFzYm1wc3Z3Ym9FVzQrYjVaQjU2aG5B?=
 =?utf-8?B?bWg2RUJRdnE5b05mb2ZZN293ZFo4R1NrM2pFSXpSaEJZQnZBT3d6aVFqZWRu?=
 =?utf-8?B?NTFaK2o4c0NlajNlK2hLR1ZuM1IwV1NGc3FyZ0hNRE5zZ0wzMUg2NktKazlF?=
 =?utf-8?B?bXlidnZiMmpWWXdKZHVHUFB4OEk2UDRsNi9Gd29ickd2dmlCRVRZTnMyVWt0?=
 =?utf-8?B?YXVWNXNKaEJvRjJFOVUrdHA0dlBsemkzZWozK0lqSzJYRXl0eFAxYnV5cDhs?=
 =?utf-8?B?WEhaQTFhUFVCdEZnRkg1OFdKem8rcThEZEg2STlJOUp2NGhTVGx6RXBmcnQw?=
 =?utf-8?B?bndTNFlHTE1KdDlXOG96N0hZZUVGQndwU1R5SUtnamFxZVl0VXl2SVVod3g4?=
 =?utf-8?B?VEg1SmUyajVDU3AxREtoNHFQZnhMQXF6VGVHcGRyQmUyVWlkNE5LS002VzNo?=
 =?utf-8?Q?Pni/DYFWo4h4q9xU=3D?=
X-Exchange-RoutingPolicyChecked: kcsmchSfGjdU7X0GBErQdHddQ4t9Lx8Lv40yQ1Y4aQkBX1N1qMaDfHS+Qg994jgu3gYEp9v6IJHoRjn13ip4nlxtb/L334pIOZAd4flqW2PrPbLC1BC7NPj8OPOwVkQDV33r+ki+wDFZUutdy83BKDpvBIZbV4l9UZ9/yOQOVe2ZgUYhcVuRZyK9sC2orDcQhbeLVGTBQpc2d+bY4pBGV2DA5s8S+SqW+UtQ4e3qgaHITU+qfMdJPd1YqjEqJNdfuozOhE8uzCbpJv31SLW5AUuKBD+v79FoCF2JcIP203Zrwv2C/jd73QNDJqQMcIKo+AeRNWyKCkNz5HWdeogGXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c2651d-e1ab-4ca5-485d-08def91afe1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:12:26.3141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R98leV7Oy3aIxMpnfJjZ8bnW3G+knKlwhCNTnya2R5z8JcKyf5+7S9WA3bAxC+VVzwCaVQI0Q/aXRzQh3NHBY7ntnl4FchGlaF/LURaFaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9540
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



On 8/13/2026 8:50 AM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> For completeness, we should catch and report all probe errors, not
>> just the ones that have explicit error message. Split xe_pci_probe()
>> function after a display check to avoid reporting -EPROBE_DEFER and
>> use xe_log_err_fatal() helper to report all returned errors.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b19efef1c5cd..ab4da1d9a9f1 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1147,17 +1147,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>    * caller. Therefore there is no consequence on those specific callers when
>>    * function error injection skips the whole function.
>>    */
> 
> nit: Align xe_pci_probe comment message with latest changes.

hmm, what exactly do you want to change here?

comment above is about "Probe the PCI device" sequence in general
not about the specific xe_pci_probe() function

> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

thanks!

> 
>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc);
>>   static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   {
>> -    struct xe_probed_info probed_info = {};
>>       const struct xe_device_desc *desc = (const void *)ent->driver_data;
>> -    const struct xe_subplatform_desc *subplatform_desc;
>> -    struct xe_device *xe;
>> -    void *group;
>>       int err;
>>   -    subplatform_desc = find_subplatform(desc, pdev->device);
>> -
>>       xe_configfs_check_device(pdev);
>>         if (desc->require_force_probe && !id_forced(pdev->device)) {
>> @@ -1181,6 +1176,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>       if (xe_display_driver_probe_defer(pdev))
>>           return -EPROBE_DEFER;
>>   +    err = __xe_pci_probe(pdev, desc);
>> +    if (err) {
>> +        xe_log_err_fatal(pdev, PROBE, err, "driver loading failed for device '%04x'\n",
>> +                 pdev->device);
>> +        return err;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *desc)
>> +{
>> +    const struct xe_subplatform_desc *subplatform_desc;
>> +    struct xe_probed_info probed_info = {};
>> +    struct xe_device *xe;
>> +    void *group;
>> +    int err;
>> +
>> +    subplatform_desc = find_subplatform(desc, pdev->device);
>> +
>>       /* Group all devres so xe_pci_error_slot_reset() can release them as a unit. */
>>       group = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>>       if (!group)

