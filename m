Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE2606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+SduJGP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4EE10E077;
	Wed, 28 Oct 2026 09:25:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D273C10E077
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793179498; x=1824715498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bVFNFE1RyxaQeSQddEjrQoaJDiGZCtttaIGACDxtFBQ=;
 b=B+SduJGPMSeYfHkA/lX9klWtdJ24/368gIPLYVoWa8bkv19ywUrLDRT8
 yWFhT4+6qo5MwR51OE6/nceOlKK8+79pnXnyA9AXtCOMOPY9a+46s2lOo
 LCB8KZyKSRuE5AYu8XiP0/YUWwiNTp83UUQ/mkpI59FhayPDX4S2SGCGf
 1qB8LI7QeurMkOyNUm8my5wgDnKtlXDjwZvHwZ03IERghkO8BXFyXEOsW
 19ec4AW4lCEkVdLJMOKPmB0T8v+xfQVdYUrrWcQIA/nz5naFXKDLwuLrp
 cLCmcyLa68Y0mJk8tPEUzXEriyb80Vekjr02Y8WTZ6T77QajlF05z9VTc g==;
X-CSE-ConnectionGUID: nHfYkj1nRtCoD8f/YJFHsg==
X-CSE-MsgGUID: 6ofIG7Q/Rd+XedGZd1+bvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1803820"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1803820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:24:57 -0700
X-CSE-ConnectionGUID: 8JILX2hLSFWb6aX7mkOcpw==
X-CSE-MsgGUID: QPLgqLPrTr2nl2PEIqe85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4688714"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:24:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 02:24:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 02:24:56 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 02:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itJLB8o68IQnwP1/B+sHqM0N0DDCm+/60FmPtKMH98CCOpFfV77ERDvu/EaLVo+OHU3ESinCmzzC9vsq2LgKtRG8g0ghxLs6VlqaLmyKtIGYC52GfDPGOfXzdZJoAS2yQg9kXQL0UYbRjv1xx93MTKOwpNUMjCGoWNlajoUo25WlMpaPyjNAEPm3bNLSxdFyy5wEA1n253Xfd++TxDP8WgM2KkrgTi/gdkLoiTjmbo6bfhcWZMCmLkwr4cbLPOg2XJ+F1ERoXIU2tk4IAXMsu8/ZVvMKXyiG6zp7VYrzrQHPMTQD/GnGy3Vb7MRxMSyDS4lZoqI8Ghd6ZZdwpc5Epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtrmF4Z33/eYDTn0wP9MpI9xeboEiqs/M9q7Ghbwh80=;
 b=CYpMquWRBp1xSUPLjSWMUcJC7/OK5MXjzZQPx3hpMiKMWUd2YglnW/kykCsqBS+x677xWZjynsiCxqVUwg/XBLD5+eh6lyPmckp74EbPO0/zlBC1zh6sgI/Cx1Ok2uCwEYq9Lx072M6h6ZVmrBiU6P5qJNEWDP+WUQhBc+Px/n+/LOwyAkipQiSPgao7X07zKg9Y7CClklleL3XDbzgm1zSP5WUxV5ON/SHPmVmRvNJTS7fvUEBV03C7QPYmH/84VdSYbfCVzVFrKBkdbQFLZ502u6WVC+nnhEjsJRmKwTNoVvAzZJHo4vvsNVy2/f2CRzpN3OaCVnb+ecPUGhmmug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SA1PR11MB9873.namprd11.prod.outlook.com (2603:10b6:806:4d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 09:24:49 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:24:48 +0000
Message-ID: <23cd61ac-7247-4a1a-b517-dd2486963f2b@intel.com>
Date: Wed, 28 Oct 2026 14:54:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/xe/ras: Treat non-fatal PCIe errors as
 recovered
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-16-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-16-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SA1PR11MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5386d7-d6f7-4da6-34e1-08df34d54f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|261021123027099003|10067099003|56012099006|4143699003|11063799006|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: i24lR4kaRME2AUFTrccb2H3pHHEoghEfVs0u7wIrWD0bivbsJkZb8Za1K1gMIYbQGKuBBrs8/aDFV8sX12T3mCaLgCKfgJ1S54Vv7gm4f72J8tGtuzp0lXkBuQ5Q7AQ6tmO38XSIw32VNeqg2SX0W9+whPzIZpJcL1MKR8YWM4WHFoluwQez9W0gm2ZcVLCTOm+tg0wSDbVTh01s+kWyzOBngyg6ZQlJ1Bd8wJ4PoV5sWsy7owi/s8NonN74T1WyCEPmCYJJMKEUmrnp9ugjnIkNT78G2/4eBltBb0cltSmquwF9YW+lb97Hn1LJ7QwydhVg7KcffP3vNpFJJXYz8TnTqliUMmKaUIWHBMZUcsEdn8HNK8Hk+AYgcHjuF99VDw1ZzBPNuTyX+wYtX/FTrFHw+hCmaMhZl3/QX67oU0QktKS07gpPgJdRe4H++HegH4lbLA2CjXbZWF4BCvRWiYQhKY3rAGlAe9wWTEBXEFWKXixPGalmKO6GsLDKF2RZDge3lM/9w/EX68GO1cyiOr+CC3vM+8BcXCdp3tj04megqgAKhnQmNHDe2lzxMq4HZVOO29z0Je3V9PbfnVOyckB5YhFcLRTcC0nmX/AN5qEq6ifJe14YM1SuLpLcjSUsDUV7Fpy+Na56XHLQYkdL1uhzmOWv7wyyXGS6amQ2pQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(261021123027099003)(10067099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXl1WnRhVVNKWFhwVUhpcXJFSUFkcGkvOERyeis1NE05dXVkczBsNXU0RlJZ?=
 =?utf-8?B?L01rSGdLVFBIK0xPd1VUa0orK3dpYXJvSUM2ZGN2ZlpadVVReVVUMUNyZ2tI?=
 =?utf-8?B?QTZWcUk4c2pNSU1rNHJnMktXUmwwaUhkMVRRWDRhcU0rdkttcXlHZG1QVzVC?=
 =?utf-8?B?Z216UEZCQ0lnRnBsUUxZeERxaVh4KzF1TEx1TE1pNXVrMjlvWEFmcFRiUnRo?=
 =?utf-8?B?S0xmOG11S1ZNUVQ1NDY0OVp6NUxNZlozSVRhZXF3TWpLOG5ocHN3SXB6Vlh3?=
 =?utf-8?B?UkRodWNYZXlJemx5WDlmM2Z2UGhoVFY5aGF3UFJmc2RpUzN2Wm1aQmQ1dGlq?=
 =?utf-8?B?TFRIc0toOUhWcks4VGhET28rMUoxMW5DcVZOaXl5NVMrcW1oMWEzQmV6YzhK?=
 =?utf-8?B?cThBVGdUQStMOFJBalIwR1JISURMMDJvRkpDamlSbWVBSUVJSGd3WjlOWkJG?=
 =?utf-8?B?dnFjaEc0TTQ4MnExNEhlemtkbG0ydXBQa0U0OFZna0V1cGQ5TTd5MTZmUzF1?=
 =?utf-8?B?NzNPcU43RjZydWo1Q0ZvclBDYW9SSTFnYkVkZWVCT2RvL0lMczVMLzljcE5h?=
 =?utf-8?B?VnhuSWF2ZWpaU3AxWnh5VlJXalFmWkJHNnF0ZWVsUklQRlgrWGRvNHYzdVFq?=
 =?utf-8?B?OEJ6RXNDU1d2a2drckhCWkJTRUo3eU5ZRE4rM29hOVRCbDVsTURzeDdqS2NU?=
 =?utf-8?B?SjNYMTZsdVZjcU9nbDJmNnV4S0VFNS9CcTc3c3BXUzdsSW1jbEs2OUlWYkRZ?=
 =?utf-8?B?QXRhVUhCZ0ovTHdVVUN0WFo5RjNRWTFFYXFmRkd1SDZPWkpiR2VjNHNkQWlm?=
 =?utf-8?B?bGs5VStsb29mdFFSbHJXODk0TUNjNno3bkZTOWY0MXFKTGx0c011bGRZUmpF?=
 =?utf-8?B?dlE3MlZxT2lqcktHUG0xaDRuMmtseGpOQkJuQktMRGtEc0pMSFdINWF5Ky9i?=
 =?utf-8?B?bExKSEdKUGMwcDNBRGFVWnBhS00veWFWM2NNcmxaSlhoSVRlV3JvL2hEdE80?=
 =?utf-8?B?Vmk2VmIrTE1DQVVWMHlYbmwxSjJHWWhUQjJhZ0I1Mkw3MUNoenUydGxweEN4?=
 =?utf-8?B?ejlpaVJkSC9yREhKN3lXRHk0MjBWaVNhVWwvVjF4RXQvQXlrbWxwMXRReFN2?=
 =?utf-8?B?YnpFTUNYblYrbm5DSlkxbnpqSFRkWVk1V2JGeWRycTNuaWF5TjJoRWxrUGJj?=
 =?utf-8?B?TnB6YVRBTUNwbXU1Mnk4T0VUQ2FLNWdvejNhU24vd01PeEt3NGVtM0twRTR6?=
 =?utf-8?B?ZVNaRi80YmNyVFQ1OEUzNlhoeUgzOGdBYXZDL1lGVG8yUngrcFRieGJUODJP?=
 =?utf-8?B?anh0TklrSXZ2dW9mbEhzdy9OOCs3cnFpcy9SKzVhNk1OVW8yampreUc1Y0dE?=
 =?utf-8?B?V0FLaHVWbzFlcnF2TlNUR1N4ajFMcFJVbGRWd3Z0ZmhUcmtPdHhFQk5jdllp?=
 =?utf-8?B?Z1VGWDdNVndtMHEzZ2pya01nenZiMzdYVGhxUFh6UUN0Q05SVlZjTEtvclJ6?=
 =?utf-8?B?dXRtbDlBeGFwM0RxVkhKVysxTTdyYkVoVHNWc3lrUjJVbXRtTjRHb3ZGOUZY?=
 =?utf-8?B?Vnh4MmhzTy84NUl2L1NHNUR1bXB4OC9LRWNlVXZPb1F1TEs5NDcvWldxa2Jm?=
 =?utf-8?B?c1FtV1R1Z3lYekhsNTZWaGJaQUNxTTFqV2d3aUs2c29oQmd3Sm9kZ3p4R3Nh?=
 =?utf-8?B?di9lbnA2Yk94NndDaUxCZlU2U2YvTXdiL2NjZGZMWHNIaEpWeEozQ1YvV1lk?=
 =?utf-8?B?RkRGNU1BaEZ5TXUrZlltQW1RZXdCY1hqajVza2N2S1ZMR1lDVUpBQkg3c0Yr?=
 =?utf-8?B?T0JKYlc1RkdqcXFRQ0NzRmZIMnhpd05RODNqQXdQY25UZmtYcVVpYkllYndi?=
 =?utf-8?B?eGZxd2I3VG9MMHRVd3k3cXozdFY4bHpXS1pIanZZbFVMWlgwU2U3aGxQNkc2?=
 =?utf-8?B?NzEvMmwzWGNXYnVqOXpFVUtIQlNRMGNEUWgrdFRxdHRwNzBYNlk3UlFMZnFj?=
 =?utf-8?B?NmZIaEdaNnR0MlM0cnF2bEVES1lHUWpaNzF5RklFTVBKSXhLMkV1OTRSVXEv?=
 =?utf-8?B?bjhFLzM4MkxQSXgyN2xnb3BJTkJUSGNnTk4yL2lwdHJvaHhGQWo2RTl2RElR?=
 =?utf-8?B?cGora2FPNWxhdzF5dHV4MkpSUTJXcmhBWEk5b2JEUkt0Q0dlZGJHMmEwc1VF?=
 =?utf-8?B?Wm9WSXFmZEdxNE5JcmNZN1E1bHllTTFtUFRYMHRpalJPajdVUjk2MFZNaktM?=
 =?utf-8?B?SklkOTNQSmsxSGFwVnM5SEF2cURPczAra0JtWFJGWkhVY2N6TmcvU2RMQWYy?=
 =?utf-8?B?Z3RJRFBraWQyL3Y5ODEvQ2hnN1laWDd4bGY1dlBMZ0h1SnpxTUQ4STdHQk45?=
 =?utf-8?Q?V/n53wfB3Tc6Ccc0=3D?=
X-Exchange-RoutingPolicyChecked: f1m5KZg7g5Ww7FMZNpO0kkp/3+VpG4bHQUwLU9cBoIhUD6r3Iw14kAwAUKbeXbWxdnkkMUyYv3G0QxKUrm94svFoxQiSazP93qLjLb62dmD8T0ldELhmlr2tclVClOwX/7ii3H371VRXB8PpuxYb1AcjiHaNMR5w2D5PpzZqi6bz/m4MuDcl4SAK2ZZkkKYKHI1ZuJQeyXh6o/IMJFFmTU1B9FUmewkAseMlRJRMOjrRkKtblugHyGcJVH69vrUq5DZ+ZSpR7XVak1WKIjUmGx5/vCbZDszh87Yk+fgW6RHiBYyvxKtyThXTSbG7CDs9vAqRg+28lUML+OniZftdrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5386d7-d6f7-4da6-34e1-08df34d54f95
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:24:48.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZxHbCgWg9QTJ4qd32dufAzAIyoqRJoGEi5AQrbgRlW/GzeX3Ie7xOcLo7ELc3FJ8IM4z5U06mlnAEkADY/AIK9Gg31GRxAPcCsI9GQWk6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9873
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


On 26-10-2026 11:35 am, Riana Tauro wrote:
> On systems lacking RAS capability, only PCIe errors are reported, via
> AER, not device errors. Non-fatal PCIe errors reported at the Upstream
> Switch Port (USP) have no impact on link or device state, so treat
> them as recovered without requiring a secondary bus reset (SBR).
>
> Fixes: 25913a062cd4 ("drm/xe/xe_ras: Add support for uncorrectable core-compute errors")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e6a0ee468b17..2b1a7cb01b0d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -747,7 +747,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   	}
>   
>   	if (!xe->info.has_sysctrl)
> -		return XE_RAS_RECOVERY_ACTION_RESET;

Initially we see Non-fatal PCIe errors reporting via USP required SBR, 
however what is rationale behind,  not required SBR now?

Thanks,

-/Mallesh

> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>   	/* Default action */
