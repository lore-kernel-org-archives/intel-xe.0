Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D835DCD4F25
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5A10E17F;
	Sun, 17 May 2026 09:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSi8fI2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432FC10E191
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779008701; x=1810544701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fkg21RDCKyD+/MNUVgd3PBfLwnieO97XjIj3xeQ9NqM=;
 b=TSi8fI2GWi7lcF+uU9uGa4XLF5nmeDt0uAHcntWIPfgLdWFIvu+3i1sf
 oNqX9XmvBsYR0Tzfp64xCYT5k3IjEN+knNwYef8o0TUcIYhqIngKfCV2p
 LSdtFgoI+kxc71tS+OEA4nzE5iDEAXo/6p48DYtlWY76Ba34MqClvJafO
 LhfWuwMeGiH4H9HjISR1x5p0NJPItR0QxCACw6WlyLRYzHFo5Vc6r2nk0
 I3RK7BMOWF5r0bzRdAsuIOhErBQBjGvPo04XdlYF66ZD6ihvI6QYJe3PH
 R/xd1gEqI9kVKs+Ef5fy6oCoGwSGlWuuwRomaDH80YnqvLIEyYZQ6pFS1 w==;
X-CSE-ConnectionGUID: aaTiaiXxQH+3S6yEynljpA==
X-CSE-MsgGUID: zC2eAYAuQJ+AByY1Bp7g5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90472606"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="90472606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:04:59 -0700
X-CSE-ConnectionGUID: s0h4ni3zSdSeL5f4ih00vg==
X-CSE-MsgGUID: KYcmAqn8SwmVm00Osp3lnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="244099652"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:04:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:04:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:04:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRHHm1Mb0a2PRCDrFDbjawBCAVI9GNlZiOwkZCLZZfrAlEkbljCi6pBejMLUf8GrPlHoLnBMM3RZDLJqckgaZ81s52I/FAHh1yBBmcb/8BlGNG4VGOxqbyweAj47+HwArnbndwn6voH5brTIelmPyJWn3gxA53NrJinR7kXdadRisk6JlLvgG1n0Dn751xXS8HsZ9+Nkk4zhf4IqKFjUItxmxbnO+MOAIsWj8ogwnlDjYfZ5aW9biSGj7NcuDY+ONvxZq6b8x+1A8mhN4ZMYlRa1eUL4S5KuvSRYwUsrTd/5yzYaAyqyb0/BpaaEDOIQ7x61VvqsV9NeAfcaU2sd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIOrTRKnXzVaTo6CjjmvqZoeIk8Gb5JxM8kVFJ9VKdU=;
 b=AIgl5JvyZIh8jReYDTlSYL1cNSIHoGHAJYnDarbjEiZ1qTx7UyIObYTOD7a7VFDXmXupNGi7YJSnXfwjr0EtpXVbazZQ9nwNGn7fKZNh9yhEuDLwv/yf1SjXHidjyCz7oBVEsv61SWBTxBMRasHxFFwIAqN+vpisNSyFUb/pA0xvT2TGwoLjGWd0ImhxZBbS0HJ8Utn1aKugx0aOloVq0NqjXuYiwNWDlhOLgyrN3QshoW00rQdm0WtWvB3EO/F2R3ZLdV0NGG7Gjj25TESCab9zH8Kadrb+R3RTT8P2y4y+NF4AkbkicjF6xR3EhzCUU0cjSwTXktfE4rhEhZNObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 09:04:56 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:04:56 +0000
Message-ID: <92989e96-b947-440d-80d9-1260b0312a73@intel.com>
Date: Sun, 17 May 2026 12:04:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm/xe: Refresh MEMIRQ code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: aedec0e5-6a8a-41df-b412-08deb3f35d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: b7zckYVEBrNNkUSQVyDCEP/YG1auYSQbteGQBiXJUgbtbswwEPuFQ7z2xrUwq+JG8/t0q8mzuOQKCTxmWp16WAlB+R8yRRQJ073iJUjl43W0oMlJWq3iBOdwFsJ80+UCuQrm7Rgv9sUiXUrSo+daUIHhWHW6VVdaKaIJAI9G9fGlMd9By/owo/kXBr1T96F+0u/wM0E3n4LGGqx1ugVp87CFjKvo+M5SfEFIFCfb01Po5IhEvvAzxOHWiciaCZ9FSbyrYzuwqManwTTMatnWjt/b4xkf+lERijxRV/ySx8ECgPk1jtLH1UeOOAyUzUCbXDg4NX7d+Mxfv5FI9FXBP5sF6rOv2CPZJkcBZgvxgeX0HjKz+TwUbwaDVv0KmjCvCYrc/qc3L+cf+0j/UsnRqJ/fdCaPrmfzlvTBzDBaonBCeftLzOGID1Kr+wthI98SAJSUfHRoFy1nhhT7TLepaj7bEJn5ZQY/0p44mhVzDIwzYd3rW2/RxID1lRvA18QRy712toqP2KPevtdCTPcFr73JWJK/8w8cKmZYqZy2JjWoOQdwtfrz+Mc1z12WfEs9huxUbfTQkaz4QmLWcb77Xx+NRa3FSFpKr+ShO/fYFV9WgVFNbF7xP3tqTdWBM4M7A650O7NYuTZMLE+RmxQ7VrZsdJvvdq6c0Quyj5yCFisHqSwkywzyqkFZqIvEwpqy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VStOUGt5VVoyUUZ6RDFhOUN3VVlsd0MxWlcrRDRhL2JRWVl4L21WZ05ISENG?=
 =?utf-8?B?Qnp0UFp1bE83VlhyM2puVCt3V3E2VTBRWVNQblRCQkZyTnJER2ZmSE9WNHZy?=
 =?utf-8?B?NVhpQkZwS21DZWtDdzhPWG1XU0pTUXFMdk85eGlWQXJpQTE4SFFIS3lDeEdR?=
 =?utf-8?B?Z21xL1FpOTF0bk1RL1VCVXdMZ1BydW9rL3JWMTRZRlFIZTJ2Q3hpUGlPKy8x?=
 =?utf-8?B?ZjV0U3hVOE1vVVVaTnlpei9JWUNQMUNTZEk0Vm1PdlhRdXVsSEpxSXR1U3dQ?=
 =?utf-8?B?MjZoMk91eW5aeFhmaWVqT0tSTzc0YlBCNWtPQ3lGV0svTG1nVHEySXdzaXpR?=
 =?utf-8?B?dGlya2JjKzBQNEhVQU5GbWpEV1YyQXBRTU1aS0dQelh0VEdjMVpTWWxSdU80?=
 =?utf-8?B?ZkM2M2ZvaG1WTHZXN0x6ZkxFdm4xL1RxWTBWWmRqelMxTVNGdzJoZVA5bDBP?=
 =?utf-8?B?KzZwSFZ5elVGYTI3VzZoNVdua3NEZFc1OVlVcUpWczM5d3ZORU9kbU8wSjZi?=
 =?utf-8?B?aGtzVWFEOE5oL0VMOEVYU1J0L0Ivd0x4RDcxN2NqSkcxcUU0Y1NubmdvYWF0?=
 =?utf-8?B?THJkOXhTaFdmdGRrcHdPVXAyRmpvN1ZnODhVeWhmRVhLR2ZWd01NYzVTeXYr?=
 =?utf-8?B?ck1mTk5WeEEwakRHYjI0MlNwKytPbEFQa0VnaC9IcmdwSm9SN3JLSktXMlJG?=
 =?utf-8?B?WWd0dG53bGtMeG02Rm04TTd4SWFsMTRIeS82d2hSWlNvL0dqYnNCbmdBQ24w?=
 =?utf-8?B?SEd6ZE93Q3Z0NUh4SmE1aHY5aGUxakVHUmpaN252Z205ZkVKbUcwci9MTnJ0?=
 =?utf-8?B?OHlkVGpLdGtRS2RURUZmblRucGIvWXBiaSsrWWtneGN4V3dFTjRld3hSRUFa?=
 =?utf-8?B?QUtUR0Z3M3lSNWd1ZkhDY3lIcElUdTBtczdxZEx0aFBwRS8rVlQ4aU5mNTdv?=
 =?utf-8?B?WWFncC92OGttNjV4bXpLZlFuZ3dPY2VOZjFPTmdVWjUyQUgyVVo0Y0RQOTZJ?=
 =?utf-8?B?SVI3eTFoUVhWYVk2Q1ZjcFFFdXJuS1R1cWZQTnpVYVcyV0trVmd5ck12ME9y?=
 =?utf-8?B?dVBZaFNXMUJSNU12ZU1qMmFQcjdxOEFSSVlUUU50S0lMcVRTMCt2QzVkNHBP?=
 =?utf-8?B?VDFpUnEvV3N6N2FhZGVyZ3gyeFcrNEdrTFZ6U3pRL0gwNjFxZ0FZbG1PWnMy?=
 =?utf-8?B?bHMwWkthV0hNdmJMdEFpb0VWYmVrbEdqeCswL2F3QWdPZkt1YkdUb29JZVFv?=
 =?utf-8?B?aHZYeEozZHJjQXppaEJ2eDBxdkp6aVJ6OTUxTGZKTks4MDdsQXg3eEV5azhM?=
 =?utf-8?B?VEdwVGYvRnpZVHB4TDAzSFVHRCtxK09vNnRqR3ZLdzZ2b3NXNTZmaWNyN1JG?=
 =?utf-8?B?eE83bjA2V09oWWdUOTVCT01NcElSTytDMVA1MmxIU2cyZDk1QUFRVHljalB5?=
 =?utf-8?B?dFFGeDRWQ0VLc0RXTmQ0YmNXQWFvNkxUcSs3QXMzQzkxMnJGZTE4ZUZrR2RC?=
 =?utf-8?B?eFQyWmxKK2VDQWJCcHZOYUpCVmxkdjlNcFl1SlVnMVdvTHB2SjlHYkdQaENw?=
 =?utf-8?B?NklvUFcrdlBnZGNZQ0hmTkZHckNNUDhqR2NBZ2VJNTJPWlhiNkljWFJoMStl?=
 =?utf-8?B?ZTNONUVISDdCenZ1RXZybFdzMkU5UXRueG1YSDNQdjc2c3grVjJ4YVpzcCt3?=
 =?utf-8?B?ei96ZWs5bzlrWUhkT3kzeW9SVkNpdTgxYWdOWVJ1VkZHUFFKalNOWDBRYmRO?=
 =?utf-8?B?ZWowZmFRVUNmZXR3a1RlTTY5UnpZK2xSbHhJUjE0VGVJNXFnREhsSE9CUTRz?=
 =?utf-8?B?a255YUxjMEhQZURJOFJDdEhMelowVEFWUXZJbEY0bElBakc3VE9wU1JPOGNP?=
 =?utf-8?B?M0RxbDZnN3U4UUMyaWZ5NmhiT2ZxcGdQd2Rid1FJYWtTcEdFbzNrK2orSkxr?=
 =?utf-8?B?QmtyU3dLNXViQmNsTC91SVFBMkRQMXAyU1pwSXBjV2JyN2VDOENQRUY2OVBx?=
 =?utf-8?B?dDd5WEdTTTVTdTZaYTR1Qk5xNkxweE1WNnFFSlpvK29xbGprQXZXM0U5TU85?=
 =?utf-8?B?WTRhVWtMdy9HZkxRbzRnRFo2M1pCanJBU1Rpei92bzYrSE11bHl0MWs4dFdu?=
 =?utf-8?B?MjFya0Zib2h0b295V2VPWXpnWVJab0E1V0I3cXQ3bTQ5YnZLUldDMGNlc0FE?=
 =?utf-8?B?T3MydUdvdGdyeTVSakRwSHNzWnBtaWtKRkNWRnJqSFBDUWtIZkxyeEJXM25B?=
 =?utf-8?B?bEd4YjNWNWVqSXBMMjIyczZ3WWVvQUpVNFFhc3Arc3U2TGRDckxFc2pSVS9l?=
 =?utf-8?B?ZzJ2cHdqbnkrbG5oWVpnajEwbnRZa0p2TXNnNTQ2dmZDVS8zUWNPdz09?=
X-Exchange-RoutingPolicyChecked: n6tBI/uiuDpoK4sEPhz/Zs4Q7mB3eTr9veoBa2Osn2Yqh7lgIqGJOTeQ2QXIy2ibJKNIlrjR8t1NJfzBbk0kaWbzceZl7jyUya85mKhzT4TVkmASoW7djnlUypoeFwbgdhUchgUa8P9cSn3Rz5ApZOyNdB7jaKR7M4CWqpsRoySTAvRSfM1EVQtGtApKGbDY1BfDzQsyvZAsZuGN0yI0pkia6FLIzQ3reRtfwh+1XYP/N5L7MEA7uhC5pUWnZCwOfvf3Ccvv7bvt/8+SDvOWU7Vd9+4pCDudfknHqnNbeIZzEmc9m5APu1HQ7c6935ZK31JKNJTg0GrJacI0bSTnZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aedec0e5-6a8a-41df-b412-08deb3f35d71
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:04:56.2186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzx2+wOaSpFEuZD8k6/2KrrS5hQKCHUgEuFR783L8QwqSdO0GOCtKoCZVzeMeFvPe8b70Cvjvfpqf85zpVwl7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> Cc: Ilia Levi <ilia.levi@intel.com>
>
> Michal Wajdeczko (9):
>   drm/xe: Add IRQ page to HW engine definition
>   drm/xe/memirq: Make page layout macros private
>   drm/xe/memirq: Update GuC initialization and IRQ handler
>   drm/xe/memirq: Use IRQ page from HW engine definition
>   drm/xe/memirq: Reduce buffer size
>   drm/xe/memirq: Update diagnostic message
>   drm/xe/memirq: Dump all source pages if MSI-X
>   drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
>   drm/xe/memirq: Drop cached iosys_map for MEMIRQ status
>
>  drivers/gpu/drm/xe/xe_hw_engine.c       |  11 ++-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
>  drivers/gpu/drm/xe/xe_memirq.c          | 118 ++++++++++++++----------
>  drivers/gpu/drm/xe/xe_memirq_types.h    |  13 +--
>  4 files changed, 83 insertions(+), 61 deletions(-)
>
LGTM, perhaps it would make sense to drop cached iosys_map for MEMIRQ source as well? It seems to be used only in xe_memirq_handler(), so maybe it can be initialized there.

- Ilia

