Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96A6CDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 16:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A14A10EBEA;
	Tue, 23 Jun 2026 16:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mL90cPar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321DE10EBEA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782232104; x=1813768104;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VDBQV+soIsvATNb96oJClIk+nPp212xPt1pYiOgfmv8=;
 b=mL90cParHNC2Mbfo5v9AI1NqZcWcZJKFNpayli4KYXh7OZY4vjv61Kus
 5NuvSRmBeXUfTLgphWsgUX3AQcDiFGpFbAV780LdWfIlfQgKMeK1aqoBA
 b286v2lqaDmWa3IAju8IqecYc1y9CsXlU37E93izoE0/30iaF8zN4ezJn
 OtYbm3Hsq3PU5D4n/OD6o0Waz0+4YQjx6O9ZdeOV5vtlC2k9YWO7WFzkt
 cHn9jc44dMJjimQT4wpcKQXQ8z/jq6qaIsZf1WaoFe9nfG2IWzFfQPPNq
 dsyHH3seoNWQYUhsTQ8Gul0ycAvDY9ONzv6lDV+hTm7Y0JCPHHWRc69g2 g==;
X-CSE-ConnectionGUID: zWfEVsRoQWCVhQOw/f9DoA==
X-CSE-MsgGUID: Zh923ZaUTpWryWdo8uMYBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83072221"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="83072221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 09:28:23 -0700
X-CSE-ConnectionGUID: sBIRE6S3Roelrb01/c3hFw==
X-CSE-MsgGUID: p1OLV8H0Qw+/Yn6RzDD3iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="279732363"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 09:28:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 09:28:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 09:28:23 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 09:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRJ1VXJ5lnDRMu1bScqkdgxOWyakagJc12F3LdUAmyBHg/60XQC6ai0CJASqv0ZUstn/AcSf6fQ5e6a4iRtrCCiJkEx9mal0zPDi6YqWEVRBYUGnQjHr5b8aHOPKWDXIngGbB704sVdd/hNwTNd3RxcX4Dtaool/8IVjS0hBAKZjeXsmXK7a1gz7I61eWR40NQSmICBFTzdnjpRzYAQ2GnF6mi8vXhLrH8D5A1JryRXqmltpyYnyNRXW6aw5CbhAbX80yai/o4QUTzhFviCheyVavsfQF1HHw734hWAFOAzlupfSVEVZjQbuQJkrVU/vg/8PrSAME64M/MOfroa7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXx9eskGFaWzUSmYSNtNLVOZxXdrE5L5tfq8usJkGzw=;
 b=cN/j1nNs0AhGUmTqSQ2OuAQ1S+xQGvYTbJNeGAUxvxB4IaPDeukD0VMeWZyDR+bYNMwiJlvD69h4UwGzcFUycgXooUY2/MjYQOhW/Ls9cr3ejWVPl5WHI2606oXL48/uz333K06fzdW8nm8YodGcmCZ/5q7uZ4m3txJGOh1/1+/MPd+BudpQaM5UUslYXi8AWuq3mNht9OfO9MHe007YNkyL0sEYbT6YGaDfTElSeYniWVXWb/vzQPAEY8UI1FtcR+s1jsG2EdljQ5nBGR0XjNt1Nj2+X4aVg3+2FeBN8555bFb7yh+k+HEBTTuBQBSL0UdZeafoT/Rr9oeAGDFBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB8152.namprd11.prod.outlook.com (2603:10b6:208:446::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 16:28:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Tue, 23 Jun 2026
 16:28:19 +0000
Message-ID: <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
Date: Tue, 23 Jun 2026 18:28:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260611161634.506476-20-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 51efcb90-4ae4-445f-6e0e-08ded1446f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xHPcLkVORjuZpLv47+QwEgR1EGoxYHYl9etmXtsWuHBjTE3uH3PAH46m+1k2uCeMa4jjt7hE1Q+vSazmzsdeFRpTpnTeqGJ9tAgTrxf5NerrAfUooJ7JO1Pf+KfrUslCf+c98hE1g8+tSTLVjVgwtdqwLIwnGJyfL0b0o6hjHhNKgUaCJUTkNlibmq8/MhSJL9HkZZnK2iTXgaZz5nB3TQOHhwC7P57pxSHvY7Y4uq6mXK5E83o2HOwirhLMUkSnAyrrX7Zs6GW9Ml79VE3T+F569NBlf9XlOtg249NwPa6ueiX7/6KayvX+Ag3DppU4DmMPHjqzF+xE1dNWvVyXkYHrsomixk1vRSzRLVwGmUwnb08s4jErxXYIwCCegnFSSWQpeIfE404LasntdV5J5lXjv+XT7O3QW9VcqcAUB6nuEqtBfYIKihcOmPHAX6PtULjQHmiND1BvorOx+mze5upXGCPbphMzPwq89fysdQ53F0OdWB2dw5VeyUbw6qkZgQxFDuaj0mOPux2NAkLnDw3C4n35sOHbrVrehY/p/fquRsnKGGBPpreuDnRGA6Vx/K59NfTYk18FN0N8uklgoHWgmjzbc1xBK/gkzNzDL9TF6e567k758d9vPiRltH14lainvlaB0yeQFpk3WAyuVFP4AM0GOVtwtUlxPmzjuGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGVHVHp4ckVaa015QVV2MUJzeWpWTWh1cGE4WFkrQVZwWjFDWWJ4djMveHZO?=
 =?utf-8?B?L0UzUUlSK1luZmNJRS9VRHBJVS84NzB0bjg5M0JNeGVuRDlJQ2NQSkZoSFpn?=
 =?utf-8?B?NW9GaUUycEVCMGpyUzBvQUo5WW1iM3ZLeExDS1dOVCtQRHE0NFdUeEtsaGo0?=
 =?utf-8?B?ZVRtYmV0N054dzRrV0VOOEUwd1FtNTdxRWhRWTNjQnd5eDR1M1JKTkRQeHVO?=
 =?utf-8?B?d0JVWlNrWjNIc3orbTBlcXJ3RTVWelpiWlZPUUZsSFdGQVI1cjlQNDdJeHN6?=
 =?utf-8?B?RWpZUWZsTUFIYVpVQTVmdGh1Y3Jra0ZGSW9MWWtpK3JsUm80Rk80Q3I1T1Jo?=
 =?utf-8?B?RU5jQTZiNFB6UmRIVGdzcjZBTHQ0WStRRmcwRkZFUUM1VDNGempuaU9XcVVs?=
 =?utf-8?B?VjZLcE5GOWdicithczV5cmk5N1I1UEtpRC9SUHc2MUVxQW1aaHZ3T2xzdmZx?=
 =?utf-8?B?ajdWYU10TmRpQlZDZXFQTEFzbDhzNC9OZTVKOTdKb2tLQjYwMnVuTlk3MThx?=
 =?utf-8?B?N25kbGdkV2pQMmNkdVVWbEtkNWd0K2lKeUJHb1JPdUVCYmFGNjVVWVJ2NEtD?=
 =?utf-8?B?bS9EMEJjam1EcnhQaTRtd1l3MEFESnNJeUdMU0JSK015MEFINlBjNUl1WWVJ?=
 =?utf-8?B?d3FnTHEwOUVPOEpiT3pjeVBkTCtmMDF5NEZTY0ZoMkI3RTV0T2M2bWgzcDZD?=
 =?utf-8?B?RmZtUEVwVEpFVVFpNjA0V2xkYTFXZTdPam9HaXdBS3BhbjNUbGw2NmNIMzla?=
 =?utf-8?B?cGk1aURyWnFwZk1tKzc0RlJrNjlvcjFjZUN3ZnZyQUNHbUpzOXdYUFIyMGxJ?=
 =?utf-8?B?VktFU1krckYxU0IrZlIrYVJBMTAzZGVLeWdaOWY2eko0M2NqL0szejFkcFd1?=
 =?utf-8?B?R3FtanBtQkdrVUh2YjNEejYrN1VxMXl3QVhWa0dmeUZBbURJM0pLNnExOE1J?=
 =?utf-8?B?WDc1eVlLTjJuREMzN2F3QW1zVTVBRnJONjc3STJHR1BydHdwVG9JaFFTQXdm?=
 =?utf-8?B?Yy9adHhEakdON0hFTy9zQTBUUURPUG9rYTAyTm1YY283MjRCaS9wOS8yQzE1?=
 =?utf-8?B?Tkt2TDlJU09rbGxzeVM3bVVNVWNXR0YyQWo1TWJQK3NsVkgwSTdYY3k4RG02?=
 =?utf-8?B?QlhFeGM5U2syaHJxcHo5eFRoMGludGkrUzd0MjVWL0xaQXVyRmhIU2NrZkto?=
 =?utf-8?B?VnNCdW5FUFNZVHRhRUxJOFJQaE5ZQzR1V0pyQWNGNFEyUXZ1eUZHNTVlYW9L?=
 =?utf-8?B?S3V1NlJxQWVXazJOYWsrRlRhOTUxZVNEWFFIdmU3QWFJbisxRklOR2dhcmFF?=
 =?utf-8?B?czZEaXFnZGZYNkVOUEpyYmRpcjZWUVlGMnA0cW9LOWZWV25DOTFDU0g5elFN?=
 =?utf-8?B?UVRPQkZMQmkvUTBNclp1NDBpSm80RUs3L3crTktBeU5Tc2dqSE5oVTBtNHBl?=
 =?utf-8?B?S09XdytLemVGanhjblU5ejd6RkVVQWxsdjUyRm9jd3dYMThPaHh4TEJRYnRx?=
 =?utf-8?B?RGwvRDkwcnArVXNWcHBDTkI0SVVCZFV3M2E3eVR4cU40R2NWMWlHTVRGTTVF?=
 =?utf-8?B?TGE2SWo1Z1U3MEFnRTBhaGswdHh3OE1XYnhWN0F0S1RUMTFnZGhPWDlOc1Fw?=
 =?utf-8?B?LzJETEJ0Q1h5QXJaNE83MEpoRENtVFhaNnNGeXZBR3NoVFFReXVRbTJvWnlK?=
 =?utf-8?B?dERGZHd1R0RNc0dpYU1id09pZGxVQityenFnNXQxLytKMkZJbXM2YWdRakwz?=
 =?utf-8?B?dmtoRXp0YmUxZzRwcGVwVXRQeGdJZVdZMGhuZUVhOGxxVmhNYzZiZXg0VUZN?=
 =?utf-8?B?UU9jNDgyaTRYVjAwU2VoNDYrVFZrVVBJM1lELzBPQjZvc2ljY29TR2VLbGVE?=
 =?utf-8?B?RUFNV0w3bnJRZG5zcit2MTE4Q2kxMFRaZEhYVDRmTGp6RmxjRG5PWGYzbkUv?=
 =?utf-8?B?dnFQMDU1c2pnYmJlampkYi9QcDJYNnVYTUF6a3YxcjBRSkp4TU9JVVF4Zlhw?=
 =?utf-8?B?ZmpKT2ZMY0pkblRnMTV4NWIySkxOTU9RbTdrdTc5ZGcxdnd6K2xnZmZJSjY0?=
 =?utf-8?B?cjJ5Zm13MldLMFdGNjloZnNaa2xIZTFNRzR2N1BORjFLajZmQmlubHI0cWZN?=
 =?utf-8?B?dEhaUXYrYk9jUldhNU84d1hkWnVOTGhGYUkzU3k0eWVOZjl2Z3ZSb0dDdTh4?=
 =?utf-8?B?a2ErTncxcXgyUTJYRnVHODJrc1Z3ODFyUHF2TmlNeWJCZUN0SGl6YmlNNk1Q?=
 =?utf-8?B?WS9rbXNCN0hZU0twcDAvYWFsMFpzRjZLcm40NHpQK1MvYS9zQmo5aEJpTllR?=
 =?utf-8?B?T0RnVHZTT0xxMTBoZDVwVVg4SzVyUlpHY2dFNG9qQkY2bDBWa25QdW9BMGZG?=
 =?utf-8?Q?4ZFt0pNSNs2K7PNo=3D?=
X-Exchange-RoutingPolicyChecked: o8wCPGWL3W8UTvw5Uqbvc/GwliNXxsD9J5BB76ZW3I2aXo86eyWfS7VgcaFKsP4IKYpI2LKgee40R09Dwe7ZaCsmzCDxZOMTZ83uZqswMaEWCi3QF4OtULqdMYlb1JcnK9afIDcHG4liQZTddSwnaFOZR8qN/Flrs1bRKCbBtnTSXyq7wS+MnsDYPdZe1PjLvVablFn7NZb17ymqKLzxJFuKwJcsYoMs1anqYa0mkCwnxJF4Mia+FwNc8CPr3q/Oo0bwThsYZKUXwUc5NRRxDreoUzMpYb3+EBr+gv2AWPh3nZRzDyDckaaXFvCGxNnmDP3VOWWA44gPWhppwIleNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51efcb90-4ae4-445f-6e0e-08ded1446f67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:28:19.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXMUIN8D8SuoBaxUMr590a6k9rAvSrzSz8+45PaTOxspSGDeUYvIWzqoZXIOmyW7VHQpOHplkKI9+lJqwE5ekvL7tbG3lwXCyee49qcYSXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8152
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



On 6/11/2026 6:16 PM, Matthew Auld wrote:
> When host PF writes the logical configuration for the GUC PAGING engine,
> the VF is meant to query it, and mirror it. Size of N means we have
> paging logical index range [0, N-1], with N fewer normal copy engines.
> 
> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
> should be zero on older platforms, where we should simply fall back to
> the old behaviour.
> 
> v2 (Sashiko):
>   - We can't call use the guc_has_paging_engine() this early in the VF
>     code. With that just unconditionally do the query, if the GuC is new
>     enough and take the value as-is. With that drop the -1 special case and
>     just let the upper layers figure out the rest.
> v3:
>   - Also update xe_guc_klv_key_to_string. (Michal)
>   - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>     tweaks. (Michal)
>   - Update with final GuC version.
> v4:
>   - Just fallback to manual reserve when vf reported paging engines is
>     zero. Will revisit in the future.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>  drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>  6 files changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 644f5a4226d7..753c049d2fc8 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -52,6 +52,12 @@
>   * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>   *      Tells the driver whether scheduler groups are enabled or not.
>   *      Requires GuC ABI 1.26+
> + *
> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
> + *      Tells the driver the paging engine configuration.
> + *      Paging engine logical instances are guaranteed to be dense starting at
> + *      index 0.
> + *      Requires GuC ABI 1.36+
>   */
>  
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
> @@ -60,6 +66,9 @@
>  #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>  #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>  
> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY	0x3003u
> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN	1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0cd9d77f3351..0a11e63f470b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int vf_cache_num_paging_engines(struct xe_gt *gt)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version guc_version;
> +	u32 value = 0;
> +	int err;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
> +		return 0;
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
> +					    &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt,
> +				"Failed to obtain the number of paging instances (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}
> +
> +	gt->sriov.vf.runtime.num_paging_engine_instances = value;
> +
> +	xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
> +	return err;

	return 0;

> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (has_gmdid(xe))
>  		vf_cache_gmdid(gt);
>  
> +	err = vf_cache_num_paging_engines(gt);
> +	if (unlikely(err))
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.num_ctxs;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances

nit: we don't do any query here
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: number of GuC paging engine instances configured by the PF.
> + */
> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +
> +	return gt->sriov.vf.runtime.num_paging_engine_instances;
> +}
> +
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>  {
>  	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 79878f21b1da..d171a8242a34 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 80562ffadb16..21cb9bc1a341 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>  		/** @regs.value: register value. */
>  		u32 value;
>  	} *regs;
> +	/**
> +	 * @num_paging_engine_instances: number of configured paging engines.
> +	 */
> +	u32 num_paging_engine_instances;

nit: can we move this up near .uses_sched_groups

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 97600edda837..be992b8da9a1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>  	/* GuC Global Config KLVs */
>  	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>  		return "group_scheduling_available";
> +	case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
> +		return "num_paging_engine_instances";
>  	/* VGT POLICY keys */
>  	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>  		return "sched_if_idle";
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4d7cb8b54b4b..1227b9e66fd6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	return err;
>  }
>  
> -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int num_copy_engines = 0, num_paging_engines = 0;
> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  	if (num_copy_engines && xe->info.has_usm)
>  		num_paging_engines = 1;
>  
> +	if (IS_SRIOV_VF(xe)) {

maybe:

	if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
or
	if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {

> +		u32 vf_num_paging_engines;
> +
> +		/*
> +		 * PF could in theory reserve multiple paging engines, which
> +		 * internally the submission/scheduling backend can load balance
> +		 * from. Not something we currently expect, but we are at the
> +		 * mercy of the PF, so we just need try our best to mirror the
> +		 * paging configuration.
> +		 */
> +		vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
> +		if (vf_num_paging_engines) {
> +			/* This should only be non-zero on NVL-S+ */
> +			xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
> +			num_paging_engines = vf_num_paging_engines;
> +		}

hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?

can it be due to GuC FW being older that 1.36 on NVL-S+?
can PF skip programming paging class on NVL-S+?

maybe 0 on NVL-S+ is a good reason to abort the probe?

> +	}
> +
> +	if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
> +		return -EINVAL;
> +
>  	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>  
>  	/* FIXME: Doing a simple logical mapping that works for most hardware */
> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>  			}
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static void read_media_fuses(struct xe_gt *gt)
> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> -	hw_engine_setup_logical_and_paging_mapping(gt);
> +	err = hw_engine_setup_logical_and_paging_mapping(gt);
> +	if (err)
> +		return err;
> +
>  	err = xe_hw_engine_setup_groups(gt);
>  	if (err)
>  		return err;

