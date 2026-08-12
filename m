Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28CC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D23110E44A;
	Wed, 12 Aug 2026 19:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZc/+55h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487AD10E44A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786564351; x=1818100351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+1kuVCIF3IfF4zr69vWXsTGmJWgcZkgmWR/XhGFCTyE=;
 b=KZc/+55hsvp9WeExDDnJM/bmiTdN/zzlo8ewz4mlKA1mWg5qDoAH/sWS
 upG6etnmLz8x0wl+3EQjrlDoZ18M7o1IBsbyzST4EgSigQBwCOt5k/ahn
 1KdR4kilXG7Vuz3LIX17IlQsm+f+K/Ajk1arbaTKCi9FkXQfgpKbKNQd6
 xZUpmyZdqt3WvwFg1ZoFbUgs7lbXP8s/mYqzmgdjG6AYd7vxDI8IUhyGm
 OsU1n2GqBU0HNtlNrkoLX7Yh6Kn15YbcwCafvCaS5jZH81Ii0cjRDBcQ6
 wEZA2Jq29jYI0as5krA+iqCpkt/dNVr1JSVKknHUEJUbiAj4P3/rlTddr Q==;
X-CSE-ConnectionGUID: EqMCmYHYRL62knkiAj3O+w==
X-CSE-MsgGUID: ZaDRb3JbSmOWFxFQxlhEag==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109919262"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="109919262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:52:31 -0700
X-CSE-ConnectionGUID: cVub9LvhRo2NVZrKsXCPrg==
X-CSE-MsgGUID: MYfSOMGtSOmMjX1YDUW/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="267593266"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:52:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 12:52:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 12:52:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 12:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+Jp1PFwOxZjOqQsxAuyGQu26qcprluqgAr0dOS/ypo5NvT2J2OaCUW3PDMNKvo2GPFilGC83GpDOgApLVGwfLPuhIHfDL9rM+PEDPtBQN//T9TYfh8n5D/zNkY1XwhxoglhmIJZFORlIcJoD+B/fzTrdjLezH7kBW6+poN53l50KgC24JGrVhXgPrrDsrKI/y4yegDSCMR0PU9ywYrTvHK1KUUAyGqfoHHsTj5U9CgJRewpDgSLxq53r9jlKMWhv0ShGtb0RsBZC/mswFrJtjpU9xtc/MxsqCQDmPkrJVwJkjOU3ZkJTEyV/NYTZHVkz+MSb2q/nCJ1C7FkvKNUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4nazMa58H68ddPEe3+zPXM8l7RXII7vOniwrDH6W1I=;
 b=P9iyAu3wnE4I0Ht9j/JuCBgOCr9e2bh3cbBs5XrgY4mAey/GqIANnVFu3TNdcnmVhmc2B2wYVVWtTNtKHtLUWaDwUKt6w+dC97TZtfkl4CgpxnQbXsHXlsxzJIz840MR5ZbtXzNxJn5frb6Dga8GCggZHMCewV3SAL8FNtHJwezUvd1GAPiMitTqvhT4/l52+X6di+XJaq4cZQvUFImmr/WQkdfuHe4KjkeC1bzNheNEVeV7bd9abZeHtyXp/SIVcZZ4UTFT3sUIhzbYn8++0xgjmAbgknKWsNRDmz9r9TTGkSnkRu/gnzm06sqB+XftWus4XW6sk5kbyQlOoV60QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 19:52:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 19:52:26 +0000
Message-ID: <3520b3ac-9798-4077-a7b8-45b06c01ed2b@intel.com>
Date: Wed, 12 Aug 2026 21:52:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/ras: Report CSC errors using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B98.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62d) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: b82ded08-32ae-4714-cd76-08def8ab3bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: CGfSXCDaYE/wn5KJooDJ1weAodvay02NKT/AtQL3rYP0g4Pj1BFrit6znD6NJ/6DXYRPFd0+YHKT3m68TNxsO7twIAtAwTFR9wrZ3DB51MqMz9LcfHQ9VVQhMMfXsEuVIHJ3D1z8A5U2/DoHxLkHIVRjQ1COR8OPyC1CVYLKm/TFXuzVxZkgr00GBYg51HilC9AJZ72PpSCGOl32JRJOx0CvhDU8MH33khqpSvnEVfD3QWPHhs5GZhUNcFNDadtxINnTsFsOzDEr53nOhd0wKxCS/LY62aVKRMkG7eK5f1o6ATmWe1mzPWqyOghUZYch6ojTPfRPvlQjs//bWzeqguUTt6n9P2Pba0mFNXbhsi2WpXqAvhnqidsYwP8XPXvMSVNZUNb2BlbxoXlPRnb/z7KTOXWJPTJYMjTg8bmvKjR9ux1hUhd4UW3QH2iP+IK73/UGUKvVm5HAQGeaC0OPJ4W4wflK+fn7m2hQ7x5dvjX2VSw49+WRiaT70gb/MyPBKtcMNlfDI+hv1SrDn0w+7g3rSLqJeskzgc2T70dnSp4+gOh3WrF71bzoQ/t/ldRHyaS4l9/U9WItXRNSW0dXc/9/1Cm8Kj+i/JInCEe2tV9K+lH59vfh+Ugb84Y55dOC8VLa5M9rmmGXHW1mX3Lkmpmgkk80yruwxcxgYduj/1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0VBU0o0YUptMWR5RE5tMnF0TFlzNzVDSjdUc2h0SmhUTzNWTEtxdzF5YnY0?=
 =?utf-8?B?Z243bVJiWnpmSzNlTGVubUFUSTNrQi9nSFpJeHJiaVNObitTQkRnTjRXaC9J?=
 =?utf-8?B?VW43ZXQwdE5ETnoxdktjWEh1ZUp4dXBJK3lhZ1hDVnFVZ3NFT0NKb1IreDlS?=
 =?utf-8?B?d2xzeUMyK25HSXhBbVBDdG1UcnRHbW0xa0tYc1BXTDQ3TkJtWkh2cUNSazJq?=
 =?utf-8?B?MGVNdmNEQWhXcFErWHZlakU5enYweVFkR3M5ejR0b09SZnhuaUxLcURrVVB3?=
 =?utf-8?B?RjFTc2xMMjNoTjRETlJYWGtoR3YrY3BtdFhla3h1MmpKQW5HSkdDUTdXaUhy?=
 =?utf-8?B?VUU1RDRKRGUxM21ubllMaFBveTFEUS9Balk2MHoxKzM1eEdsZXJGNEdpdjFq?=
 =?utf-8?B?b3JWOXhqSGJQMjR4L0pWY255cllodHhOTUUreXo5b0JhdWZUY0R2dzdJT1dl?=
 =?utf-8?B?WnN1Ykl4TDc4NW1lTDFqNitlbFRteHIrYjltL0N4UDNTdlE3NVZUTnUwLzBB?=
 =?utf-8?B?L3o4cnBGek5iSFVTVElkdW9MWTZXbjBkek5BNlFJVjNOc29FelJyOU5QSjJu?=
 =?utf-8?B?VzI0NUtzdmVRREpHTHUwWUVwTG9LcHpwMyt5R3JoYlhRWDhiNjhwNXNvSGhm?=
 =?utf-8?B?TzBsQWtBSkxhNzkyaDNQZHI2eVc0bC90aWErM1hZSHJNNVNML0hObFNkcGVp?=
 =?utf-8?B?ZVVkMDNSbG56cGxaWXA4YlYyTGozUDlnRTZyT2E5MWtMZi9uYm0raThXYmd0?=
 =?utf-8?B?TWVjMXJaOTVKZzk1WHRicW4vWU9UUlFVUnNrR3lraGQ2Mk5ianR0OE12UUVa?=
 =?utf-8?B?ZGJTZ21xVnp3WnR3NjdiNjdkekJKVW1Fenp3ODIvL09HRmZKT1NrVHJjZVV6?=
 =?utf-8?B?UXRLNEFTSTYyNmc3UXlKbmJtLzJPTXczemI5M0diMmJYRlR5ejRYcFp1bE9M?=
 =?utf-8?B?ZkNDTGZmREJYRmhpR3dIcGJPamJEekdJLzZFZXlWVndpNmhXL1JjQkdxYzhZ?=
 =?utf-8?B?STNyNU5BT1VEdEVBSWFkZSs5enFxVmlYUHg1MkVFOE5HRTQxUjRZblRNOTd5?=
 =?utf-8?B?WmdITFBjQWNFY2RIbWU0ZTJacmsyRVBvNGdOa1FuYnlpWWlLQzlkc29yMlY5?=
 =?utf-8?B?VlhBa21hb3Y4aWxqV2QrZTNrcHpKNFljQkFNNWpyV2R1QjdVemdJT3F4Ukx4?=
 =?utf-8?B?M2doR0hmemwwSEdLTmFhVTVZMjRWeCtSYy9YR0RublhNQ2dlRStaemxhR2p6?=
 =?utf-8?B?bVZxZmJZZkJDeWI3bVRkd0M0c2RuMXNYSkNvZFV0YnRYWUkzd202MjZCNjlZ?=
 =?utf-8?B?dngvUW85MEM3SFJrVVloREFMdmtMZ3R4a3ljL2J5VWpJa2VSWFFWTDRpQmww?=
 =?utf-8?B?cDNRWDZUK3ZiVFV3dUJFVjc4aUo0aTlwRC9waVJaVVZKQ002czJiTDVjY0NT?=
 =?utf-8?B?S3hXVUNlRFRuY255MlJFUTcxNXRGbERDNTkrZ290RzZNb0NhSWIyQzA2YXVS?=
 =?utf-8?B?aEZHSFMza1A2Zm9TbHNxUzQ0N0ZyaTZ1TzBBMitCZnpscWswL2Urc25NOTJC?=
 =?utf-8?B?bXZ3VkFiU3dkaDdEbmJVbm9yQVlLZ09meWZKVGxXam1yMnhibVREUkpJOHZO?=
 =?utf-8?B?RHlkbEFzU1ZuV2p3S0x4N3hoNmlyNGtzTWdXT3V2TGJiaG1QdWhRQ1R1bERQ?=
 =?utf-8?B?SlNtTElOTitXZXBpK1d4aGk3UThYRnNkQk8xYUpSU2JtUXp6TnNSSnYvZU81?=
 =?utf-8?B?UWxCM25DYTBwUnFGcGVhbVlVTURUSjFUc3ZYYmhPOG94UzF3VERTY1Z6YkMr?=
 =?utf-8?B?R0Z0VmZNMGVZWDNDdDdkQ0lNelg0NXdoSG85UFVWRmRBZWJWaTA5bGh4eXBt?=
 =?utf-8?B?QTMzNVJrSlpMaXFBVUFEZWtSTjUrQmxrS0Q4a0dKOHJ6ZTROUldFNXFjRUNs?=
 =?utf-8?B?WDd6STdrYTlCQVhSekl3UnNuK2JrZEc0ZlZlQis3czBNajVPaFBQdG5icWZ2?=
 =?utf-8?B?UmVyaC9PYlAzREgvK1VJOEtxTFoxNXdZa0FYaklmWTZQWDRDNGM5WXdGMmIx?=
 =?utf-8?B?TW9DVXJsY1V6a24xNklkNTBWd1JTSE9hSFhsOTBJclF2Rll1VUMvQjVXdzZw?=
 =?utf-8?B?ZGtaU1NxRFJBYW41MXorQkhPdnZMUXdtL3puSTRycFFPdVcxZGFtVXFKbi9y?=
 =?utf-8?B?ZDM0bVJqK2RDbzdzVU1qQWh5NjRyUVlUd0pYMUcvay9iS3V6N1ZPanhGSFY4?=
 =?utf-8?B?MHphemNxc0Q4aEY1MTNuVjJZVUc4VWxsMTh4QlUvenVpeEh2REloUEkxSXla?=
 =?utf-8?B?THpxSXpxRy9tSlkwb1A4aDZHQ2hycDFlUnhvRHJFcHE2cThQczhwcW91aFJK?=
 =?utf-8?Q?PSMut6U332sjoegs=3D?=
X-Exchange-RoutingPolicyChecked: MBBdFWFN641AhKeUuCLWgbizdEmeWEkLGkbr3RLlBOBWFhRt23Zf+CaO6O7GnGjYzQgPAkYOzYhPZ9iENw2exHpcKTgUhPRD/og5U2m0EM0rvcGO5hEHzMYdeJCBgHmxVkdJboMo68AM9No4PpJ1hLZjOQupNt15Ysr28zSz8r8pboU2UuZ4WE8FbOSycvUC10AneGVEHYNFSck0CJVb2bffYtbn+NUYBS6e9IeqDaYhbkyXr3FYuPpRpaMFkEK5iCCDR5MaLpY9ssB3GaLQqRrXHRUnhtY02B/IhpGHPKa1G4UW+sOj82BXCNEMnpz8rRFA+60BsdJEgl/CfLGB+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b82ded08-32ae-4714-cd76-08def8ab3bc8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 19:52:26.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuu+lwCQDm8xDHWuPt8VqPQSMo30vKOicx5bVAngVOIYtidzzZ8HE9scmWrLfJ0g0oGShwLCS7wxQqvbY/xZpHmS16EXK2zf+UM2evVm+2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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



On 8/12/2026 1:52 AM, Umesh Nerlige Ramappa wrote:
> Use xe_log_err() to report CSC errors using SIGID.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d1aa3794f2e0..e50ab49bce5a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -283,9 +283,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		 * is required.
>  		 */
>  		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_err(xe, SOC, 0, "[RAS]: CSC %s detected: 0x%x\n",
> +				   sev_to_str(counter->common.severity), csc_error->hec_fw_error);

hmm, it was assumed that for HW errors we will use 12 byte data
while xe_log_err is mostly for the SW errors where we use errno

do we still need to use "RAS" prefix ?

maybe we should add component XE_LOG_COMPONENT_CSC with SIGID_SOC_INTERNAL ?

shouldn't we use common.severity to select right xe_log/CPER severity ?

>  			xe_survivability_mode_runtime_enable(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}

