Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E229C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 23:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E329C10E41A;
	Tue, 15 Sep 2026 23:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQx5HJUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659AE10E41A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 23:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789513850; x=1821049850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VJqWuSDqdm3cIwJtKvSEApnfpHEexq1FeAGvQD2s2iI=;
 b=aQx5HJUGT9Qi2R4dc1SbeiZB7wyBMYnVLAtVcpwnkc3CVciV0+qrycUA
 m7GD5W/EGvXBHI5etbRSc2JbXWET87sn5wA+e+56QtNUBDloUI1XWojuh
 6OLDS+fDbjLLwvpo7CbKeqc4Fi+M1jvU7ktGrNygCRlmSVB0Qx039jf48
 6NLqvw3hSkeyITs/gaSkGFojKVp8OMjVTwfneWQdPiGTqwt5utswf8SSp
 MQCHRZxaNtaZcE7JDTWqlFmJFTCs2MJACFAd2CASPV/qji/fVSyQbM9j7
 nY67Uhyd46EIX5RC1kVX/753sJM+PpBTQm4GH5deDYozZwtAbYFp+QNk/ w==;
X-CSE-ConnectionGUID: r+7Kq3N/QxutsnIVXV5+6g==
X-CSE-MsgGUID: lHThCMKQRWm6Si1bmWwNRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89906769"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89906769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 16:10:49 -0700
X-CSE-ConnectionGUID: u4YPptRvRqqYuuDxG7yYMQ==
X-CSE-MsgGUID: EkGEd4jSSOODg9rUxX5RRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273122744"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 16:10:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 16:10:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 16:10:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 16:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b33/L7bmQRaE0MZuu0C8emxqNBUeuSLfFB0SScNdSCEkML8PTB1au0b9gJADwNsVfT1+dVx2rTxNvvw2C4W2nCOwrM/PTZrJ8F7/ZEoVtLktjPLQ/Vhf+eCmjSEpPbwm64RCZYCP3m4dh0uwB+fWTPyHgHLX1geVm1ehddLF0vMOalreKzYp3gTcuCZkfejajNaME/B9dwK2xTKJxUMydQJcMiHjQPNH69LfRS89nuFbUWnCPHYbn+bDqhPjilyAmmIVaoz0bIZ6MXe+9Rg/etSFYEVvHBT2tMQGipxZY7qRaCEZjcmNVyyC8XS7Io+ZvdH13JUfbkIJGBlU0Nz+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u15rbIhyqzLJNN79fFEIhvIge9xqZBp99JpRwtSOH0=;
 b=SkFqn+56ar2eldGBcP3UTCzRJcZec7RWH9HEgOzOxhpeHcDF4oDyd6IMJhESx1D0DmNcHP1IjzB1SjkEkVEjW0ctfQhzdZID4iG0NHMDebjijDg8oA6oOpKdRBD9D9fgXBlLhAfWG27z6AgCiyBakAIwva1XhhY4eu9TEtlIIPd+aVzL2O31bz4vehdWoZa8j18jTY8l6xeoFffvFz6/hzx8dpdwCYJSw7D/ztRtRN6Y2b7GMzTSGmWc+RBulKH5ZpvPdkmaxS8+dFshuBp3F/yjr7yc5FkTmGvoyxA1We9mORG6XOehDVkquz3XQ3mmOgFfq9SxwPSnXzBaniahVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 23:10:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 23:10:44 +0000
Date: Tue, 15 Sep 2026 16:10:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Use different error codes for CT errors
Message-ID: <aqnQckN7OUBIcnT7@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
 <088c7152-3776-4670-b939-c1fe558e0381@intel.com>
 <aqnNykdW8AeYUzpG@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aqnNykdW8AeYUzpG@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:303:8e::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: c68b4265-9240-485b-ce92-08df137e91c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|10067099003|3023799007|6133799003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: lxc2e4WKb+Kpmyg8XXcqRGq5o50Wd9TIehYEiruNzgyg0G+UInGAan0Gm5af+v4dzoWQ52hEgjR0RJSgOvLof9JArCcxwUfkWVsdoCxY2HhcUChqWTri56X78P+tfqV+PB0JUZ7IlmuTL+1n8/NIDsa26TvWBAqL/PrC1eAFEUH9iG689HGpZIMT/WipH1UTra00Xek7JRiCyk4L5g6SSyxow86ZaRGv2B/bA938QPB9kbi2820xQXTPdXohlWFtJuxz0ZPB7Qd9O7fc9tv0DUN9JDZ0Yqrt9bXyseXlz6/w5jRl+XemtBgb3gX+7V5rXYop45kmr671D71rA+vrZ7EcTffZJfaeBpPxS8mKa6+8KWxnZ4KU0AsKhJEFYwAGs9uYwhEmQkub1F4bdciCCX2FNTHeSzGxtw1zGHEmBDpvjvulqCPFLXK0I8xtvw9hKfjy0ZI8S2PRibwQ38F6w16vnMHCrmG/9E46dXiUKZ3ZPERJcmVcZ9wJWN+q8Eqd23h6Xhwe/zF4MXl5k5R0GFwKiLMNZJHrjUgr2jJL3isxOBJvxY5EvNsXQY0Htst9poGjZ/ZeF+XmsjSMGzoE6Rk7ML0+OppSmjlIc/tnoy5JBiKlSP3o1+9jLi8T7+hC4AtwhnDKP2IcN3VAVfuffl+wyLX22yHub225BjIL70g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(10067099003)(3023799007)(6133799003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3BVUGt2UUthUm42K2NhL05WS1k0M0dTMzhoMFZhZXY3WHJmRHNYaldkbzVl?=
 =?utf-8?B?UTZGbUNJSVl1eXNpMVhEZVFjQm9iRTdOeUtsOGZ5U1QvajVpZDJBY3MwZ1d0?=
 =?utf-8?B?NUxMRldmeDBEeEJGYXBTWFc5dnBvNU01UFR5amdMRWNxNERPdXRFQ0gySjdB?=
 =?utf-8?B?RGh6OXNDTDJJTzAzQ0FyV0tjNDdNSXhLcWNIdk4zZG05MUd2a0FaN2xGQXBR?=
 =?utf-8?B?cFN2bTVacHBJK1RteFg4eE5PdEQ0cUphVHJCQ0ZaTnpObHUyb1JLK2dIREtR?=
 =?utf-8?B?RWtGc0dXVGNjLzBZYXMwNHJhWjM0aGtuWWNZS1N3bDkydVZuSGdiK2NpM0pM?=
 =?utf-8?B?aU1CbElQVzY0WjFvTGxNaTVmSE1SRy9HNHd3aFFoWVgzNC8xV1dRWWQ5aDZE?=
 =?utf-8?B?R0VBMytZeWxvUWE1V3FLZTdxK2gyWTVtb0RjNmRwT2w2QnBqU2R2UGZDNXA1?=
 =?utf-8?B?OHNhbVo0U3pLSkVRSXhBODN2N01lSStNVWdwdm8vZGN4YlRsYmw5RmtNOHFI?=
 =?utf-8?B?WnJqdVN4UUZqQVF3cEZ1dUpqd2dxRU5kM0R2b0ZXV0o1aS85RVJtbDFaRnAr?=
 =?utf-8?B?Ly90K1huTUN5WTdZelFrNGRPMHpDT1hQWTd0M2ZXT1JnTzl0bms1S2NjdlB0?=
 =?utf-8?B?cnQ2WGZDVUpMUWIzRHo1WldGK0pqR0FETy9DQ0xIbmQzNEpJNUhFZ2tITWdY?=
 =?utf-8?B?R1NzSy9ucHQxczgxZ2F3TGJjQzlCb0VPOEZsL3UxS3RYMmI4bVgrRGxlQXhi?=
 =?utf-8?B?Y0VQbWc1MC8xcUpBQ3h6Z2tVcUJCSkdETkZ1ZEVVQ0h6UUJjc1VBRlAyakl6?=
 =?utf-8?B?L2szcFlhbGwrLysrTlVPVVp0NmtXMWVXbEhhZ2VqVUtONll3V1dUc1hPVUFw?=
 =?utf-8?B?b3RmYXZRM3g1Q2I4cW90OUNaY2VRREsxaDhhaTFxQzJMbGhEeHlHZmthZkZN?=
 =?utf-8?B?TDlxZkFDRTh5ZnRON0FiNUhHcytkeW5hdzUxUkJ1alh5Z0JKR1ZSSkYzYkhw?=
 =?utf-8?B?V2p3bFhkdncyRFdFSCtLYm8zV1BndmY5VnhiSytXOTJtaFU0cGVaUHUxdFJD?=
 =?utf-8?B?R2k0Y0lkaUhxU20rR2JpSUlIMW5KTDZ2VFFDUThrWWQ1UGY0YzFyRXJQcU1Y?=
 =?utf-8?B?SnVpOXltZWd5YktYQjlJdHduN0pySmtBdzBqUGRjN0hMZlIxaEZCaENwMUd0?=
 =?utf-8?B?aFJhQTRabWY1S0JxSHhGSWxDeVN3RGoxN3NWRHJ4bmJOVjJBTkF5K0t1ZjBE?=
 =?utf-8?B?ZTFpZC90U0FaS3o4byszZnpuWWRReWZvUFh6TUlqN1FrekdLaEY4N0UycHJl?=
 =?utf-8?B?VlVnYkdhREM4cFNNTDBzRWZYY3poNTMzYTVsc25Jd2laenRxS3FVNzVmcjVp?=
 =?utf-8?B?UFQzbDIyVHJYK3JGUHlxTmluTGIrQ1BZYmlabW5sazlESEx5UzRQdS9UckRS?=
 =?utf-8?B?dXdVN0dPTWZGMW10ajRRQ0w0Uytjdk0rR2ZGZ1NqbVZIZHo1RkM0ZDg0Q21K?=
 =?utf-8?B?NXE5RVdxTmhxbEt0UWF6UHlRenF3cnRKVzJ2ZjBVRzdOVS90dktEU2c2d00x?=
 =?utf-8?B?c1pMRk1HbkNzZVJ0Q0UyU3RXenk4TVZraDBVSXIrc1dGcVpMeUNHQWJDN3BG?=
 =?utf-8?B?d0hMZUdMbGM0RFdKT1cwTTcrUDdabmMzK250UmxJNHZhd0lUZjFXVThyY3ZX?=
 =?utf-8?B?Y1VETmRsVk9sSVJpZE1sQzJXTysrekx5alU5bkFiZWg1Z245SEFpTk1HNHhU?=
 =?utf-8?B?TXRnbXNyVWowV3duWXlmM1hUU2ZJMEFmTGhRck1pcXoxSlMyZXptZHE2azNM?=
 =?utf-8?B?QU4vMnVVd0lsa1hVUkdZVkdmZTNrRk1ZWDVIdHhGZnMxTy9rV2pxcis3QlVi?=
 =?utf-8?B?UXpDUVlOQ0RUV3FpTkFxNWdxMVE1dVFhcnhtSEhZRnp1K0svb1pnalFIVGpC?=
 =?utf-8?B?S01xb2tESGJvdlV2endGTG5qRGEwUlVsUVBONzRHRDQyWnlLLzFseXBweGpK?=
 =?utf-8?B?MTcweGd2a1ZqQ0VZTjVRNm5Ua2t4bm9CMFlydHlaUGN3VkNDYWFkZDJGeEFq?=
 =?utf-8?B?bmhKWUI5eWkvamNaR3RWZVcwVVo1a011K09Jck1DMVB4NGpxN0g0R3RwL2py?=
 =?utf-8?B?OTZLMVY3ZXlkUjBsMGhueVd5eCtHaW9TaVpNblUrUFJzMlFuWkJpZEljY3RC?=
 =?utf-8?B?anpZMm50dFF5U2NjcVljN0QyREpiVTVWN3ErdXFRUjR6V1ZSYUVmRE4wQUdN?=
 =?utf-8?B?VUZWUDJQQzNmekxXemdObW5ucWo3VExXTmJiOUNNbmw5a3VlbkFqOXBBWkVZ?=
 =?utf-8?B?RDNBbVNkcVpiZGJ1Vk9qeTJwcEZQbnptYU10NCs1VUk0TkVnTysrRWkrNTBX?=
 =?utf-8?Q?a26MW6SJgDaEBlj8=3D?=
X-Exchange-RoutingPolicyChecked: AVM8FZPBpxuA6E1n7vu3OBFWroKRABhoxgB0yVkJepr0QXrZnfCRLjOq49dv2YSBloJ5D+IExqnszDcFOa+2nhVHKFBgbf+8a+R6x1gfrC6OwDnHZ7zycPruHTO1PG1ullMBwKpDM32GIaolm8x1p8e3Sawlab3Q53w0B2MTTn2mQQ7INC2C7W0yC9mei7JxZvBbZ5DEJuF+lYwIhByLwTmG0i8oMNlj1qmjDEt/PzzRykKpzIMXboc/FwDw77WwcOWa7ykQgKH9hoEzpLCabRLKotBfya+wvcQRMyidJr5vXir30WhhT+L343GY3r8oFOeU2UC+d9FCAkyN4H8KSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c68b4265-9240-485b-ce92-08df137e91c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 23:10:44.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRQwl2ODXL5pk+Gte7BOqeLRyScDluAyTu9tiKQB2WLSpHLk9Oi3bhJQDYMc3FGnKLYhseifyUxyOi2wGDvwxjKdQcNTqoRuf/ZxbmQkpZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On Tue, Sep 15, 2026 at 03:59:22PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Sep 15, 2026 at 11:49:43AM +0200, Michal Wajdeczko wrote:
>>
>>
>>On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
>>>Instead of always returning -EPROTO for most errors, use different error
>>>codes based on the error type. -EPROTO is retained for the cases that
>>>are genuine protocol violations by the GuC.  The remaining cases now
>>>report what actually went wrong.
>>>
>>>receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>>>two error codes that dequeue_one_g2h() could return on a fatal error.
>>>Invert the check to simplify reset handling.
>>>
>>>v2: (Michal)
>>>- Sync order of errors in g2h_read and __guc_ct_send_locked
>>>- For CT errors use EPIPE and for HXG errors use EPROTO
>>>- Convert the non-fatal EPIPE to EPERM in the helper
>>
>>nit: move change log under --- line
>>
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Assisted-by: Claude:claude-opus-5
>>>---
>>> drivers/gpu/drm/xe/xe_guc_ct.c | 51 +++++++++++++++++++++++++++-------
>>> 1 file changed, 41 insertions(+), 10 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>index 5c4733da385c..c5a417fef913 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>@@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>> 	u32 cmd[H2G_CT_HEADERS];
>>> 	u32 tail = h2g->info.tail;
>>> 	u32 full_len;
>>>+	int err;
>>> 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>>> 							 tail * sizeof(u32));
>>>
>>>@@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>
>>> 		desc_status = desc_read(xe, h2g, status);
>>> 		if (desc_status) {
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>> 			goto corrupted;
>>
>>I'm wondering if maybe we should introduce helper:
>>
>>	int ct_corrupted(ct, const char *msg, ...)
>>	{
>>		va_start()
>>		xe_gt_err(gt, "GUC: CT: %pV", vaf);
>>		va_end()
>>		CT_DEAD()
>>		ct_stop() 	// ?
>>		kick_reset()	// ?
>>		return -EPIPE;
>>	}
>>
>>and just call it instead using goto?
>>
>>this helper can be later reused by g2h_read
>
>kick_reset is not called in the send path for -EPIPE (like you mention 
>below), so not a whole lot of reuse we can do with the helper.

Maybe I can use the helper without the ct_stop and kick_reset...

Umesh
>
>>
>>> 		}
>>>
>>> 		if (tail > h2g->info.size) {
>>> 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>> 				  tail, h2g->info.size);
>>> 			goto corrupted;
>>>@@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>
>>> 		if (desc_head >= h2g->info.size) {
>>> 			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>> 				  desc_head, h2g->info.size);
>>> 			goto corrupted;
>>>@@ -1044,7 +1048,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>
>>> corrupted:
>>> 	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>>>-	return -EPIPE;
>>>+	return err;
>>> }
>>>
>>> static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>@@ -1067,11 +1071,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>> 		goto out;
>>> 	}
>>>
>>>-	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>-		ret = -EPIPE;
>>>-		goto out;
>>>-	}
>>>-
>>> 	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>>> 		ret = -ENODEV;
>>> 		goto out;
>>>@@ -1082,6 +1081,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>> 		goto out;
>>> 	}
>>>
>>>+	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>+		ret = -EPIPE;
>>>+		goto out;
>>
>>to be fixed with -EPERM/-EUCLEAN, or ...
>
>I changed this to EPERM
>
>>
>>... maybe this should be just xe_gt_assert()?
>>
>>IMO we should immediately STOP the CTB once we detect that CTB channel
>>is broken so we should look for STOPPED status rather than info.broken
>
>Maybe, but we don't do that right now. Probably a future improvement.
>
>>
>>>+	}
>>>+
>>> 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>>
>>> 	if (g2h_fence) {
>>>@@ -1809,10 +1813,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>> 	s32 avail;
>>> 	u32 action;
>>> 	u32 *hxg;
>>>+	int err;
>>>
>>> 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>> 	lockdep_assert_held(&ct->fast_lock);
>>>
>>>+	/* Keep in sync with g2h_err_is_fatal() */
>>> 	if (xe_device_wedged(xe))
>>> 		return -ENOTRECOVERABLE;
>>>
>>>@@ -1823,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>> 		return -ECANCELED;
>>>
>>> 	if (g2h->info.broken)
>>>-		return -EPIPE;
>>>+		return -EPERM;
>>>
>>> 	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>>
>>>@@ -1840,6 +1846,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>> 		}
>>>
>>> 		if (desc_status) {
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>> 			goto corrupted;
>>> 		}
>>>@@ -1871,6 +1878,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>
>>> 		if (g2h->info.head > g2h->info.size) {
>>> 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>> 				  g2h->info.head, g2h->info.size);
>>> 			goto corrupted;
>>>@@ -1878,6 +1886,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>
>>> 		if (desc_tail >= g2h->info.size) {
>>> 			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>+			err = -EPIPE;
>>> 			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>> 				  desc_tail, g2h->info.size);
>>> 			goto corrupted;
>>>@@ -1898,6 +1907,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>> 			   sizeof(u32));
>>> 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>> 	if (len > avail) {
>>>+		err = -EPIPE;
>>> 		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>> 			  avail, len);
>>> 		goto corrupted;
>>>@@ -1950,7 +1960,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>
>>> corrupted:
>>> 	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>>>-	return -EPROTO;
>>>+	return err;
>>> }
>>>
>>> static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>@@ -2042,6 +2052,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>> 	return 1;
>>> }
>>>
>>>+/*
>>>+ * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>>>+ * is simply not available right now, which is expected and handled gracefully,
>>>+ * or the channel state or the message itself is inconsistent, in which case the
>>>+ * only way forward is to declare the CT dead and reset the GuC. Since the
>>>+ * former is a short and well known list, check against that and treat anything
>>>+ * else as fatal, so that new error codes don't silently escape the escalation.
>>>+ */
>>>+static bool g2h_err_is_fatal(int err)
>>>+{
>>>+	switch (err) {
>>>+	case -ENOTRECOVERABLE:	/* device wedged */
>>>+	case -ENODEV:		/* CT disabled */
>>>+	case -ECANCELED:	/* CT stopped */
>>>+	case -EPERM:		/* CT already declared broken */
>>>+		return false;
>>>+	default:
>>>+		return true;
>>
>>shouldn't this be other way around?
>>IMO original fatal errors are:
>>
>>	-EPIPE
>>	-EPROTO
>>	-EDEADLK
>>
>>as once we hit them, we should trigger a RESET (which will then
>>result in cancelling all pending H2G with -ECANCELED, turning off
>>the CTB), so any new CTB request will get either
>>
>>	-EPERM - already stopped
>>	-ENOTRECOVERABLE - if recovery fails
>>
>>>+	}
>
>Correct, the default case is fatal above and returns true, so it 
>matches what you are saying.
>
>>>+}
>>
>>maybe we should document in a separate DOC section all error codes used by the CTB?
>>
>>	-ENODEV = CTB disabled
>>	-ENOTRECOVERABLE = device wedged
>>	-EDEADLK = CTB deadlocked ==> RESET/STOP
>>	-EPIPE = detected problems with CTB descriptor/channel ==> RESET/STOP
>>	-EPROTO = detected problem with CTB message ==> RESET/STOP
>>	-ECANCELED = pending H2G cancelled due to a RESET
>>	-EPERM = CTB already stopped
>>	-EUCLEAN = CTB already broken
>>		btw, should we ever reach ctb.broken?
>>		shouldn't we move the CTB to STOPPED state before?
>>	...
>
>I will put it in comments in the beginning of this file.
>
>>
>>>+
>>> static void receive_g2h(struct xe_guc_ct *ct)
>>> {
>>> 	bool ongoing;
>>>@@ -2079,8 +2110,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>> 		ret = dequeue_one_g2h(ct);
>>> 		mutex_unlock(&ct->lock);
>>>
>>>-		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>>>-			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>>>+		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>>>+			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>>> 			CT_DEAD(ct, NULL, G2H_RECV);
>>> 			kick_reset(ct);
>>
>>hmm, it looks that during send() we kick_reset() only for EDEADLK
>>error, even if we detect broken channel (EPIPE), right?
>
>Right. That's the current behavior
>
>Thanks,
>Umesh
>>
>>
>>> 		}
>>
