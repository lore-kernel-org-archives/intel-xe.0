Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095AFE9381F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 05:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A113910E028;
	Mon, 13 Apr 2026 05:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEZ78PD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64610E028
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776059775; x=1807595775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EEKmfLEgj+n0gG6VuJWcXhYFCIyy73noKR/7f0RZ4NY=;
 b=HEZ78PD5IFo52wjadl4/EkiCWTulrpbbF1G5xCWJEY+B/wLr2ztIwrAP
 8dl6H+390iI4oVA6A+dGxZblL9TWQCVMYT4909CtyuuOIDOk2ZMFbO5EC
 LYJ+IzDwpPXrgyZtXQxxHm8/VkDfBwTyGeKtXTfUSKWGpBe8oecKzmSGK
 gBBpAYZ+mXa2TDImI7JvLPdZVCpZ5zbqTxHAwgK64xysRiLBv0Yplvyqi
 SVq9Q0KBLYe9UdI/0IZGTswVco984n6qY2CE7YevsaE/KMo8UZQS3zMFo
 +ndeuEaNHTONKC/b/YJbgUwKmruY+D6XFq8mFE9e4vhQ1f8pxcuTG1lEW Q==;
X-CSE-ConnectionGUID: 1v1VKQy6RMy7HUNGuW2sfw==
X-CSE-MsgGUID: vU9/0c2tTuGAvLqEPlfwqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88437322"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208,217";a="88437322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 22:56:14 -0700
X-CSE-ConnectionGUID: SXyecraWQ1uGVV3RR2v8bQ==
X-CSE-MsgGUID: 5CYzdkhwRjOayL1aIzEykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
 d="scan'208,217";a="234613140"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 22:56:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 22:56:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 22:56:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 22:56:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cooijhk2vZdzji63LfEIpIA2ba+BIScoiwq5FytPwdVgw68R63Ejb7x2KdOIUbeiQuIY3EtWHR1/bL+WrBLW5L2PXVIr2BMk70/tQBH9Zq+E7PwvsFxVrnnvltp12eI+dIba+sru2lo3yJyjcEuxW9jT/POtNmTDKXvUGERHUeygLsC31iW/jnRjYjn3bfceTp9WeaHfsybTM0zzun3WYaIwbnVxJhi24shUnxk52q2l/xj0x7Jf1XSj88dOrFP2jy2QBG3cTG7LNGdsVf9zapAdv4/Z9BJGOtgTYVIjuMhw+WHYseR9HQRrlatK5/IzperbGI2x5fwr5ligIGLnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJRPtfg5zZ4P53zHcx2u7ZghV2OBJ/Qrk+8OprTwbqg=;
 b=WDVgjqhpEQBzW56C28ZapS0QitWINRZ9vCzGHPEEsFYQ2lZ2+kBJ2a5FRQHrBZlXfpIXSOKEe2HB1fY1s/rSQqOMahGUWN6FUOR1ERdzgh7H0HYHluEYoRMPiLndd+Uo+klyjmf0Peac0QrRN7YQnuW8yIPT4xG/ner3QNPYPF5AuIFD7gYE7+f/L3nmcZcTIMPX066t2KaLEZFuQE5lm9dUzphqR2SV+hsqvdh6EjpJTGRglujLH3JUm1bitPX1lGUmknQ3NjaNabj/wvRABbIwXc4LmEDybl9UO+9ZYC5Zfu2R/b6D401CSl2982GhRc8GFA4pt/ZLCfyQXyZ3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 05:56:11 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 05:56:10 +0000
Content-Type: multipart/alternative;
 boundary="------------btQeD3S7nCTdCpEK8dyzi015"
Message-ID: <c180bdaf-e8d9-42d4-b18a-92078a66c7b0@intel.com>
Date: Mon, 13 Apr 2026 11:26:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260410102744.427150-1-raag.jadav@intel.com>
 <20260410102744.427150-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260410102744.427150-4-raag.jadav@intel.com>
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: e4615f94-66ed-476f-fdf8-08de99215cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: X3Hp+Qb6K+6ihsMW8uvSXXo2TB4a9ux9OIBF9MpAnugpXv+ra0cvsp+ZZnzE0yTXz372P8KLNSjYewc5Db85AXgOkJGDYnvIuDoSpytVyUzh1QgVMLb0q5ZBqgmh6GzAjtO6IRu2zncVIH1TodsP4lXn4vAy8gII77Jm0+LZ1hFonnfwo7rp94eBSuiFXvr9r2oKbwkjl/K3AOz9tDgCB3PhPgXKYs20erGjjMsgusBaHjTnF1K9A/gu92lY4WwO8R+Kxyx9GSAYaF+YRmxZb8x2kjQn8JHZpdUNCspHBaKXHLxdq8MCNxmgSlPvhPzO63NGLWKAw9F4NL3dnbp4bj2NPlbhSTjsOrRysFhcy4AOXObqlvFn+NbkIMSnAaln5kfa6LRaiUJpRPSsSVaYrs92WQaOg8+RsAhsDQvLhdnLKPVH6YqEkdijS2Esjb6C13n6uKpVcnmSRbpzRaaNUSHe03oSMWME1aLnzVBLoHQ2KYOCtGRknEIvlMPD/odhuVlG43GrVoe9xWdq+6BSbHLi+OtrignzEDSTvJuJmjVOlp4LVuEoDwuUxKr5G5bcw9IelZjJVNSmUXvWiT1CDGceBg5G1UIMss87PGHVXwtwSjcOxDcAbQYq4FEaZgOsrw53MYNrrDvltJyXvAxHEAXeq5GainZKT0nCvM5PDy0pY5WiTfHo2qmadBufpnLgX9rxIsigQuw9VlpwzSpmZ8Wj8Okodnzaf2VDC4KkjBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FjUnQxZXdyR2wyTjRnZmxZaE5ZYWd6K2FwYlMxTG10M2FJUXc0T2RXelRz?=
 =?utf-8?B?THlMVVVsclZBbnp3Rkd0cDd6RGtHS21RSExPVDk5ejhJakpBM3Z2RVpmNjQw?=
 =?utf-8?B?MUZ0MVpoL1JCdk1wck5LL2c1VUR5S0NHc0lEK3BnYTVCUlZsMzJ3U1ZrSkh4?=
 =?utf-8?B?VFJHb2crVzlvcVA1YTFmQTZoQ3dvd0hZdXpDTGlvRStTTGJRMTJtc3MyblJQ?=
 =?utf-8?B?bC9Kc0Y0N21uUm94bXVhMURlSVpuYXgrOC9aTnVKb2djdU1tWTdWZnhkVEZG?=
 =?utf-8?B?NU1WWVJ1b2U0NVYvQ2poTnBSSGdueUZFU3kvTVlIWWhpTG5QeFpnMVBGZDVm?=
 =?utf-8?B?V2EvM2JRWDE0MXFpYkIyZWVTQjBwOWlpZjlGWkUvV1hwdmZuaEFOVG9XWC9h?=
 =?utf-8?B?SmxpWlUxN0RLVTEvZkttbVhZbnFGeGdzMUJ6cXBZL2ZmU01BeHcxL1BsdDFG?=
 =?utf-8?B?S0pmZHVtNlNtWWV1WEppNkVldGZKWm8xbkZKbE1DMXNTMUVrTk1Mdmx2WjFs?=
 =?utf-8?B?dWFxbUo0YlZBTkRWVkFPdTRyWk1PZ3Y0dzNJOGdnUUxlaUNsd3dHV1ZKQkd4?=
 =?utf-8?B?WjdFZklGMDIvL0FLTVF5cjBTQVlUVmNJWDNQaHQ1dThSdTVjaVQzTzVqM2Y4?=
 =?utf-8?B?YndqbkRDQmY0Smg4b29wSDlOZUpmSHBWd0dsOGRvVVZuSmQrUjRTZTNpWTd1?=
 =?utf-8?B?V1NqSU5mUnRyNlNkbGRqd3lOWDZUZmtGMmFaQ3lYRWJiREl6VzNnRFI3bHBB?=
 =?utf-8?B?bkQ2UHl4aktKa3ZWQ0lEdmc4OHZJU1BOcGwvcUZzUklEdjlQd3dpMEd6RUlj?=
 =?utf-8?B?dHoreGlZVEZDamlrV013QVVIbC9CZXdxc1k4UkoxZzMxb1ByN3NMZWdCU3Jt?=
 =?utf-8?B?d1RtSDFtVFh3VEtONlZTWVdPcHpvd3hUVGxtOTNxK25VcjJiVEw0elRmSnZZ?=
 =?utf-8?B?RFpybjFIbmxlVlNqTGs0b3llaUJLQWdxTE82WVdVdi8xVFQxdVRoNXVSV1NU?=
 =?utf-8?B?b0lrL1pvcUd6T3dEKzV3N3BnTHdXa1hLS0Rzd095ek9TeURsMDh3NWJ4NDBp?=
 =?utf-8?B?K3NhU2crRlJld3A0bWswZnVjS29lSTdqNmlOb0hHWDJhR0dNcUkwbXppY3RD?=
 =?utf-8?B?QmoveU44bm1NNFl3RDZQTHVpeWlVb1pXVHMzZEVQTWRteDlPODRZR2g1UEdJ?=
 =?utf-8?B?bXRDOTYyMmp0ZXBBS25NSGplcDBGTFd2T1ZZcSswZEJtd1hmZnJGYnpzVS90?=
 =?utf-8?B?WmdxUkVHeHc3d2sxWDlSZHRTWTFOellmckdqL3p0Y3VFaWE5T2twallOLzBI?=
 =?utf-8?B?ZlZtYzgrYk5OSlFBRGZZakxFM285KzhYVHVUOVN5cnFHUWlNQUFRcE1zU1d4?=
 =?utf-8?B?bWhvRUZ4SU1vZDIyZ3ZGdWdwdnd5S2RpOUVTTmRuYnl0OVU2VzU1bEQ4Z3RK?=
 =?utf-8?B?Y0Y5MHJzd0ZGUHdUeHM0SDl6VlFmQm9rQ1NheERvdEh4VFdubkFmMjZXbzZ4?=
 =?utf-8?B?ZnhkZmh5VzVQYjZnWTV3YTlzUC9saEZWY1hYTk5ZSnlmVGdpKzZsckNFTTd6?=
 =?utf-8?B?L2lKQ256M21zVTNYa3FTb1RDdHYzRXU2dzRiZjJLUlFNWTdweUI2WStEMnV6?=
 =?utf-8?B?Z3F3MXArYWNRd0RMSGp5ZnNkcW5ob016WVE5MEQyY3I2TUx0MDNOUDNVZGVr?=
 =?utf-8?B?cVNDZ0tPWVMxdW1tRGUybkxtdGF0VWY2cmJRTXIrNys2eE5ZSXUybkNMaUVX?=
 =?utf-8?B?MGo3OHUyeStTajQzbGthbnMxNVV2aVZHMG43Q3hLS0puc2x1YzZ0amVUZWdv?=
 =?utf-8?B?TFJzWDVVM1hNak14bi9sU09ZcTNkR2NTMGtYbXVJYVN5bS9ieStwVHM1Sm5o?=
 =?utf-8?B?bGcrTzZYakVyTFZWenlvV0J5ZkJ1V2xxV0l0MG9LelpnRHpZMnp0REFhcU9M?=
 =?utf-8?B?L0dSVzBHbEZjcjVndFVPcVFySUtBZEsvZDF0MmttSWxwR2xjL3YvRUdhTy9o?=
 =?utf-8?B?dUo5MHYvYnQ2WjBnVTIwcklpVTZyOWtGVEI4dUx1b1BKRUZuMU1kVFl2MWps?=
 =?utf-8?B?M2FYSVA5SnVJT3gvU2VGcmszOU5IRFVoWTdUQzNReUlhbnlXaCtLcEI3TjVi?=
 =?utf-8?B?c3ptd0gvejkyM0Y2ajJkT2l6MklPNmZMdWQwVVdPTWE2akNtOE81VktxZ3g2?=
 =?utf-8?B?RVl2RzZySGkvdHp4UFBTZXJXaDhtNldjd1VrZHBBYjNFMmRRUTI4T1d4L09B?=
 =?utf-8?B?N0h2UjBVT1dQS3lwc05BeGIxZFQ4VmwrTnpBc2VPVTUwL0VVWDRZbXowWnZH?=
 =?utf-8?B?TmFOWGpvQlhya2JOMVpmd2hZYnp4eDVPS0NFYWxjaEdYZ1VxQVRtUU1VKzRp?=
 =?utf-8?Q?QWudelNY8UXAStn4=3D?=
X-Exchange-RoutingPolicyChecked: d2X0XlaG4EIEgI2fUgUh1JSmR12YGbQw4cRU8E2W6fi9mf7XCxUeOPzFpEFb/bK61dj4dFLe2v7IYyXVSErOl3lpryF2BsO0ZZDylVPFB6vUuzEKnbBri5IxRW+yd89FF+V1smisZ/pB5VAa0lTNp8Uskums6onvd8zFkYP1XW/1DaKvQgfErE/R9KpLB3YqheaGcEaBhF1P0qrw/ZdStBiUfcT0xh8vPbkwB/yae8RD0DbwPNP5ZgMr0vXZrios/MUhCFMiO+57oRikWwVb20O4ZLbFyopcozUSrlyJi8CS0IYPbarq2xjgiQeO0yn+ymHFOLXJiVjAqGEeNbRm+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e4615f94-66ed-476f-fdf8-08de99215cef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 05:56:10.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAVSyumdWYGFGwZaA4tp5qbUtQ9om428Sp52/dGXUirFLNyGTuSqSaVp6Qgx1PcPSr+KkuexEfevxvxHOaXxvTNnZp9rSeWUpFRMBBSt8m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

--------------btQeD3S7nCTdCpEK8dyzi015
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10-04-2026 03:57 pm, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>

LGTM,

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> ---
> v4: Fix Severity/Component logging (Mallesh)
>      s/xe_ras_error/xe_ras_error_class (Riana)
> v5: Handle unexpected counter threshold crossed (Mallesh)
> v6: Drop unused xe_device parameter (Mallesh)
>      Fix unexpected counter threshold logic (Mallesh)
>      Use xe_device parameter for xe_ras functions (Riana)
>      Shorten dmesg logging (Riana)
>      s/xe_ras_threshold_crossed_data/xe_ras_threshold_crossed (Riana)
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 92 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 15 +++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 183 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9e6689c86797..0e6e91a6063c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..08e91348c459
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable Error",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational Error",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(u8 sev)
> +{
> +	if (sev >= XE_RAS_SEV_MAX)
> +		sev = XE_RAS_SEV_NOT_SUPPORTED;
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(u8 comp)
> +{
> +	if (comp >= XE_RAS_COMP_MAX)
> +		comp = XE_RAS_COMP_NOT_SUPPORTED;
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> +				      struct xe_sysctrl_event_response *response)
> +{
> +	struct xe_ras_threshold_crossed *pending = (void *)&response->data;
> +	struct xe_ras_error_class *errors = pending->counters;
> +	u32 counter_id, ncounters = pending->ncounters;
> +
> +	if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS) {
> +		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
> +		return;
> +	}
> +
> +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
> +
> +	for (counter_id = 0; counter_id < ncounters; counter_id++) {
> +		u8 severity, component;
> +
> +		severity = errors[counter_id].common.severity;
> +		component = errors[counter_id].common.component;
> +
> +		xe_warn(xe, "[RAS]: %s %s detected\n",
> +			comp_to_str(component), sev_to_str(severity));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..ea90593b62dc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> +				      struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..4e63c67f806a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Combines common and product-specific parts
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_threshold_crossed - Data for threshold crossed event
> + */
> +struct xe_ras_threshold_crossed {
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 3edde46a9711..c6ea32f3471e 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -34,7 +35,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>   		}
>   
>   		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> -			xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +			xe_ras_counter_threshold_crossed(xe, response);
>   		else
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response->event);
>   
--------------btQeD3S7nCTdCpEK8dyzi015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-04-2026 03:57 pm, Raag Jadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260410102744.427150-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Add initial support for correctable error handling which is serviced
using system controller event. Currently we only log the errors in
dmesg but this serves as a foundation for RAS infrastructure and will
be further extended to facilitate other RAS features.

Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a></pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    <p class="MsoPlainText">LGTM,</p>
    <p class="MsoPlainText">Reviewed-by: Mallesh Koujalagi &lt;<a href="mailto:mallesh.koujalagi@intel.com" class="moz-txt-link-freetext">mallesh.koujalagi@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260410102744.427150-4-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
v4: Fix Severity/Component logging (Mallesh)
    s/xe_ras_error/xe_ras_error_class (Riana)
v5: Handle unexpected counter threshold crossed (Mallesh)
v6: Drop unused xe_device parameter (Mallesh)
    Fix unexpected counter threshold logic (Mallesh)
    Use xe_device parameter for xe_ras functions (Riana)
    Shorten dmesg logging (Riana)
    s/xe_ras_threshold_crossed_data/xe_ras_threshold_crossed (Riana)
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_ras.c           | 92 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h           | 15 +++++
 drivers/gpu/drm/xe/xe_ras_types.h     | 73 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
 5 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9e6689c86797..0e6e91a6063c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -113,6 +113,7 @@ xe-y += xe_bb.o \
 	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
+	xe_ras.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_ring_ops.o \
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..08e91348c459
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include &quot;xe_printk.h&quot;
+#include &quot;xe_ras.h&quot;
+#include &quot;xe_ras_types.h&quot;
+#include &quot;xe_sysctrl.h&quot;
+#include &quot;xe_sysctrl_event_types.h&quot;
+
+/* Severity of detected errors  */
+enum xe_ras_severity {
+	XE_RAS_SEV_NOT_SUPPORTED = 0,
+	XE_RAS_SEV_CORRECTABLE,
+	XE_RAS_SEV_UNCORRECTABLE,
+	XE_RAS_SEV_INFORMATIONAL,
+	XE_RAS_SEV_MAX
+};
+
+/* Major IP blocks/components where errors can originate */
+enum xe_ras_component {
+	XE_RAS_COMP_NOT_SUPPORTED = 0,
+	XE_RAS_COMP_DEVICE_MEMORY,
+	XE_RAS_COMP_CORE_COMPUTE,
+	XE_RAS_COMP_RESERVED,
+	XE_RAS_COMP_PCIE,
+	XE_RAS_COMP_FABRIC,
+	XE_RAS_COMP_SOC_INTERNAL,
+	XE_RAS_COMP_MAX
+};
+
+static const char *const xe_ras_severities[] = {
+	[XE_RAS_SEV_NOT_SUPPORTED]		= &quot;Not Supported&quot;,
+	[XE_RAS_SEV_CORRECTABLE]		= &quot;Correctable Error&quot;,
+	[XE_RAS_SEV_UNCORRECTABLE]		= &quot;Uncorrectable Error&quot;,
+	[XE_RAS_SEV_INFORMATIONAL]		= &quot;Informational Error&quot;,
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
+
+static const char *const xe_ras_components[] = {
+	[XE_RAS_COMP_NOT_SUPPORTED]		= &quot;Not Supported&quot;,
+	[XE_RAS_COMP_DEVICE_MEMORY]		= &quot;Device Memory&quot;,
+	[XE_RAS_COMP_CORE_COMPUTE]		= &quot;Core Compute&quot;,
+	[XE_RAS_COMP_RESERVED]			= &quot;Reserved&quot;,
+	[XE_RAS_COMP_PCIE]			= &quot;PCIe&quot;,
+	[XE_RAS_COMP_FABRIC]			= &quot;Fabric&quot;,
+	[XE_RAS_COMP_SOC_INTERNAL]		= &quot;SoC Internal&quot;,
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
+
+static inline const char *sev_to_str(u8 sev)
+{
+	if (sev &gt;= XE_RAS_SEV_MAX)
+		sev = XE_RAS_SEV_NOT_SUPPORTED;
+
+	return xe_ras_severities[sev];
+}
+
+static inline const char *comp_to_str(u8 comp)
+{
+	if (comp &gt;= XE_RAS_COMP_MAX)
+		comp = XE_RAS_COMP_NOT_SUPPORTED;
+
+	return xe_ras_components[comp];
+}
+
+void xe_ras_counter_threshold_crossed(struct xe_device *xe,
+				      struct xe_sysctrl_event_response *response)
+{
+	struct xe_ras_threshold_crossed *pending = (void *)&amp;response-&gt;data;
+	struct xe_ras_error_class *errors = pending-&gt;counters;
+	u32 counter_id, ncounters = pending-&gt;ncounters;
+
+	if (!ncounters || ncounters &gt; XE_RAS_NUM_COUNTERS) {
+		xe_err(xe, &quot;sysctrl: unexpected counter threshold crossed %u\n&quot;, ncounters);
+		return;
+	}
+
+	BUILD_BUG_ON(sizeof(response-&gt;data) &lt; sizeof(*pending));
+	xe_warn(xe, &quot;[RAS]: counter threshold crossed, %u new errors\n&quot;, ncounters);
+
+	for (counter_id = 0; counter_id &lt; ncounters; counter_id++) {
+		u8 severity, component;
+
+		severity = errors[counter_id].common.severity;
+		component = errors[counter_id].common.component;
+
+		xe_warn(xe, &quot;[RAS]: %s %s detected\n&quot;,
+			comp_to_str(component), sev_to_str(severity));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..ea90593b62dc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_device;
+struct xe_sysctrl_event_response;
+
+void xe_ras_counter_threshold_crossed(struct xe_device *xe,
+				      struct xe_sysctrl_event_response *response);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..4e63c67f806a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_TYPES_H_
+#define _XE_RAS_TYPES_H_
+
+#include &lt;linux/types.h&gt;
+
+#define XE_RAS_NUM_COUNTERS			16
+
+/**
+ * struct xe_ras_error_common - Error fields that are common across all products
+ */
+struct xe_ras_error_common {
+	/** @severity: Error severity */
+	u8 severity;
+	/** @component: IP block where error originated */
+	u8 component;
+} __packed;
+
+/**
+ * struct xe_ras_error_unit - Error unit information
+ */
+struct xe_ras_error_unit {
+	/** @tile: Tile identifier */
+	u8 tile;
+	/** @instance: Instance identifier specific to IP */
+	u32 instance;
+} __packed;
+
+/**
+ * struct xe_ras_error_cause - Error cause information
+ */
+struct xe_ras_error_cause {
+	/** @cause: Cause/checker */
+	u32 cause;
+	/** @reserved: For future use */
+	u8 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_error_product - Error fields that are specific to the product
+ */
+struct xe_ras_error_product {
+	/** @unit: Unit within IP block */
+	struct xe_ras_error_unit unit;
+	/** @cause: Cause/checker */
+	struct xe_ras_error_cause cause;
+} __packed;
+
+/**
+ * struct xe_ras_error_class - Combines common and product-specific parts
+ */
+struct xe_ras_error_class {
+	/** @common: Common error type and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_threshold_crossed - Data for threshold crossed event
+ */
+struct xe_ras_threshold_crossed {
+	/** @ncounters: Number of error counters that crossed thresholds */
+	u32 ncounters;
+	/** @counters: Array of error counters that crossed threshold */
+	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 3edde46a9711..c6ea32f3471e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -6,6 +6,7 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_irq.h&quot;
 #include &quot;xe_printk.h&quot;
+#include &quot;xe_ras.h&quot;
 #include &quot;xe_sysctrl.h&quot;
 #include &quot;xe_sysctrl_event_types.h&quot;
 #include &quot;xe_sysctrl_mailbox.h&quot;
@@ -34,7 +35,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 		}
 
 		if (response-&gt;event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
-			xe_warn(xe, &quot;[RAS]: counter threshold crossed\n&quot;);
+			xe_ras_counter_threshold_crossed(xe, response);
 		else
 			xe_err(xe, &quot;sysctrl: unexpected event %#x\n&quot;, response-&gt;event);
 
</pre>
    </blockquote>
  </body>
</html>

--------------btQeD3S7nCTdCpEK8dyzi015--
