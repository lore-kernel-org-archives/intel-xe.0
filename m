Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4968C982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3C410E027;
	Tue, 22 Sep 2026 23:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AolA9hVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AC10E027
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790120882; x=1821656882;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YDD9xhaGOEqOJVj6Wk5IvOTpELMFPUFxxULeAsB42Fw=;
 b=AolA9hVucUksxH3OqnCw/SLdBZaUt8tovm6PUuD5TVHZBxRX3Lix5qU/
 ccINLba5yLaHERZFmoj5dae/QaH/VMaMJfRxHum1SxhIE9I3+zwfAAm/R
 EhE5xkTew5z7B7+ldn174owvHnO/1jT5BGjkakdbqgNJoss1fdG8psXu3
 2/Jpmux0vBZ1OTXB0909I+tvSiG2Wp9Mu6ZKMax09X0/OIb7Y/dEnzJfb
 doRBXf7TTMR3xEBnnzCOyxqJx+gAkkY4UNdn8C30BT5Z8E1GZtxuIhlfH
 5SrAsq8cpJqSULO2mSdggWad07B+RSa0d/C6D4OvsfeGn/szZaxML8iMU Q==;
X-CSE-ConnectionGUID: 1XCy14XNSyyTw+dnlPAhdw==
X-CSE-MsgGUID: OJyG2VofQBi5iHJczAtdmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1268964"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1268964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:48:01 -0700
X-CSE-ConnectionGUID: y3Nr3gPLTG2AHjE/YTZOuw==
X-CSE-MsgGUID: 9XKYgWbrSnOw+6He9AtFbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="272846413"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:48:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:48:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 16:48:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIezUPMsom99BHnj/4EUPz21e2+50riLJUKv3PH86cjQSDp/Hk0K7DN11UqvJWKNQUv1emrGo6781Bjg1KwsXsvx2I0YY9HaYTk5w3/w227RZCHT4lYZ8IYs2DcYHC25eQAEDfuNoL3K/xNtS6J5pKINCmKzDsZWXeKd9LSCWOhwC+INLorRsHLxtjSk9Jyavoj35hc90aoRTtbDVzavLDMfsIw9+9ScFSvjR+e2kfw2361SSxAOo9oNiBC0kemoHcfIoWoJAK1wcEMjfIArrCesbqTDKUB3Qz/TX/V6fyBRW6VNNzjx5Vyxvul+54B3/tEhMHtjOqjNUGp+Nk7POQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGXQYBk8G9KC8Eo5IdB4osN8XEAD1o1hLnXx2oWInfo=;
 b=yduJ1G04n7mHtNvfbHKhC/gAty+H7wGgSueiiIEIv2jZA3eo+SxOOXayoYH/gyc3ArIIruE5HYoDEtxT6NQA7vqPOOmebCPa2rTWxOVC2h6Osy5wI5EvOvjUkcCBAOjn/J0rU1SvfWcn5vvuJE804kD30rAAnlGasuDTNf5vStA2f2xlvEWbuBuNF6Ab6NJnVd3Qiv+RxlvRghIQ+Uzr7EDRveQT/hc4/flUr6axf8L9MUyJrxKzvuz/qr1VaZHVHtO/mW/ZkJS8ec2ZYsrTzdpAeGgfr4D0QRTFu43B5qHxAHatgBpatteiFmqE7EiZq1EyQ2PLNQKTVG7GQK1jQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV2PR11MB716723.namprd11.prod.outlook.com (2603:10b6:408:3ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 23:47:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 23:47:57 +0000
Date: Tue, 22 Sep 2026 16:47:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>,
 <Mallesh.Koujalagi@intel.com>, <anshuman.gupta@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Allow per-command mailbox response
 timeout
Message-ID: <arMTqlN2IBdzCB6x@soc-5CG1426VCC.clients.intel.com>
References: <20260922111416.94416-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260922111416.94416-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV2PR11MB716723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8163d6d8-772a-4e31-2b9c-08df1903ed92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kxpSiQ7KbediIH/UQ6REyr/Z4HyDf1a1xdf1YExG/818UgebjgtVJknxEe5Y3CHVVBBpfmUPhTWKNlKAteLbMyIl97UJMdd5MWpEp8MGTEYtBKuCd6O+ghWnZIMPw1qceBctn0z1k3MxsLWO+JcsvDo20WAhZtywAndToMu088eq1yWGb0VMo8T5dSP52tw67jzRPeKVfVbxNdrcDoVdI0QVhjf6gGUTLUJiD9zWgtTVXXyjTNqv6LEclJmekm1D0v4nmCz8wqdkwf018t3WxGym6ZB2JdMCVnF+777qRqiM8PhuFnTi1xmkGpKREzTJg4wutwkXWltRnLjvhBTHef+jk7P9TT/op5+jqM57ZJcve38glCmTinhijyH7fjz1uLggrLC/WCASedgMTunML2WX2ns1DBUv6APhb6vBdiFMz2VOHhbAAtXJ4G5CKh5cNf7/pRcnlYj/Gwg4asksAv/E95dCD4TpIzqAVLoTqpUCy9hUJfTiqkgY4Gmj5GbwBuIzCJK6vvfX3teshcbkygmvkvndhO44fsNhk5TkO1pEtgC/0oRujzbeiEOmqajxSVnwjAVQza6wQ2Y9/j3lZthU5OqpKNpGVBQIi1tBG16ho1/xE2YHuFE0FCYd2cuowei+CD6YRzcRiyGQ4HZvYTK2MzMla76Ngg6ExnhE8lE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5EM0dXSlgxbng5eXpyRmpXS2hPa1F5ay9qQlB4amxnTTFZVTZoVng2bkdv?=
 =?utf-8?B?M2lvM1NWdHo4OVZtK0ovYlZTSHpaU0taNktobTlaMmxBbmxsMHJ3bGNKTUpZ?=
 =?utf-8?B?cktXNi9DRnFoZnp0R09PUlR2SUFmMEJsYjJSMUJSMkpGQWorRGNiN2pyd080?=
 =?utf-8?B?cHYxSXZ2OEcxVGxjdlJrNGR1UjhXbmRiSEdkRXNXRGdwYk9sRkM1Zm5BT2VF?=
 =?utf-8?B?bDg3aVhuMGNIc2h0R1NOOE1WQUxBRCtBeEFUZnVTem9OVjV4d0trTXd4YkFH?=
 =?utf-8?B?bVE1aEJvODJnNGxFNDRNUVJtMXpuTE8xUUl0SFV6b3M3cVZ4UENGS1NlMmd6?=
 =?utf-8?B?YjNvRHpjQ2pVMXZVYUs3L3Q2QUhtTkl2ZVVCMitESnVSWmZaRnZyRDF4aUNO?=
 =?utf-8?B?aHlkZXBYYndKU2Z4Y2dsTkx4bVhwNU5qdkZMczdGYVRKZHRMaDArc0UvK1dY?=
 =?utf-8?B?K0ZIWEdleFVEWW9oL29qWFRlOFhib0xYR3FBdU1Wc3EyL0c2cTI0TkhkRnhN?=
 =?utf-8?B?WEZWUTRsekRRL0FxaGozai9GVTV4VE0xbjVIcHNPWnI5bHJwL3ZsN2RtZFlN?=
 =?utf-8?B?ZTNlY0kzY0FkdStWbzJaN1VrM2dNSm02eW9pdGFCVVMyWk1MQ2ttNVFhYVpt?=
 =?utf-8?B?N0VmSXMyaHIvWTRkb1VlRjkrYUR1SlNBNVZJU2w1RTZ5bW45SEREWU9vTHRs?=
 =?utf-8?B?SDRsSGdGUEQyS0JjYjBqYXloRTV1WnkrWFN3ZFNBeVZmd1VZL1lOQTRWaFl2?=
 =?utf-8?B?d0JISFFQZEhQbndxN3NpRFQxY3dkMCs3RTFaV243Y3dHeUZlWTlUL2REWGNR?=
 =?utf-8?B?Qys5TTNqRnU2VFhFZEQ5cFl2Q3hsVk0zTjdISEhOS2Z0dDBmLzRwdFAzMGxa?=
 =?utf-8?B?NEk4SEttOWxZK3BFSHNIVTBvL01ZQWtqd09WYlkvQWJqN1ZuK21mRHoyYXEy?=
 =?utf-8?B?dHFubGRHRW5RQlV2MmY5WXRDcjJUcWlVV0cvNmEzQU1sc3REdVhlV0NSYVRO?=
 =?utf-8?B?cTlVS3lDZkljVE9rVkxLVUs2Zkk4NnlDK0FYMDM3MzhHNEpKdFhYckN1SEVD?=
 =?utf-8?B?UnlNQmJJZFFqVkwzQ2xDL3ZtaW45aDFBZS82UGI0Q3RyTG0xNTZRU2RqcnZm?=
 =?utf-8?B?cDk5NGF3MG53dkxGNng0NkVmY3pCTXRua0VRcnNZNXZVQkExT3hpSUtMaTcy?=
 =?utf-8?B?ZTRoY2ZubFNCYlE0aVFpZzA2SzVnajhCOENqbGJNTnc4UlZBdHZVVGxpak1M?=
 =?utf-8?B?Z1J0ZVQ0c1plZFNPcDlsZVVEQWhiSFhralgza3ovbzlTa2NPUStZb3RXS3JR?=
 =?utf-8?B?UUZmMjE5dEtOL2VzOW9kU3NDYmNuNGlOcE1tVnRtTEFzZmJRTUZFY0UvQW1V?=
 =?utf-8?B?ek56VzhER0hMc3BUSUFHS1I3TkFUMTZOeXBXUjJMVVZVcE5oUzVhRzA5M1Vw?=
 =?utf-8?B?MkYxWnRqUGdsUU9lTVkyZ216WEVXaHlnM212d3Z6ME9QQmVtSHNIRXYvUjFq?=
 =?utf-8?B?aGVsTGI5S3lZNEhhRFY1TlkrZStLQXJ5YXRpbHMrbzBLczVDUWZDdDhONGF3?=
 =?utf-8?B?YjM4M0dvN25idmU0U01oanRVaUowdFRpdkJnenp5UlMvdnVjRk5mKy9OV2lt?=
 =?utf-8?B?OFFCMGJqRzU4NTdEdkFIKytCdGZyUUdFejUyLzBwV3hKWWVMNU5nUEJJWUIy?=
 =?utf-8?B?b3pvM2tWSHhTKzI2ZFJTZTU1TXoyckZvS1ZnNzZGZEsrQW52SmZGeWNubzFR?=
 =?utf-8?B?QVE4MTNFaWZMUzlJc05aVmdIeklheHg2RVJ4NkJGMWd5cldzS0dTek9sdTBn?=
 =?utf-8?B?cW1qSGhnbi8zNGxNWktuY0FDUWk1S0x4OXJxZURzNkdVVlhzOFBRSDV5dWtr?=
 =?utf-8?B?VzAxMDNub1Fwd3JKUEVIMnJrei94UU1lNE9oOHNmVitEazlCU092S2w0aWxy?=
 =?utf-8?B?Kys5T0ZhVzlrc1RhTmVaWG5rQ00xOEN2anViSUV6QjA3MXF6UWtBWlkvZTZ6?=
 =?utf-8?B?LzRJT3d1eCtRZndhNXozNDF0WmVCZVliN1c5Z2Nza2VhaWxRK3g4NFZRUzl6?=
 =?utf-8?B?L1VlcmJBK1hWaVRCanN4ck1WV3FwbHZnRENkeEhLSHVwL1dMTTZCWUdVNVBW?=
 =?utf-8?B?STROeTlBQXJxQzQ5RDZqT3VXR2xWVWowbkRvMEwwekM3WDdOdjFCeFZoZDkr?=
 =?utf-8?B?S2xtYnQyUEE4a2l1NUhaYmtIbWhvd2RrSFZSRERHSUV6VE9PelNDUnBKUi9k?=
 =?utf-8?B?R0RYbmV0cThuZFluR3dJb0JxS1hVYWRjSXpOa0E5TGk5WENuaWZ2R3A3elRT?=
 =?utf-8?B?cGcyOVlEdlRwak9heVlrWXZGeVZjU0VOVEEwWDRpZFMyVDlVM3ZmZGpQcS9K?=
 =?utf-8?Q?vfOmOW/Qnb9zF5YA=3D?=
X-Exchange-RoutingPolicyChecked: BYfOnQHYTdsaRnnhQqY6thsMbv6JdxpoyB5DPT6xkJfgKg93K3cbboY27x67uAGESW5g9BusbCMaUSRS/+OrnhbJyVjk7D6wG5USMJCFEnAdXXO7pVA9SiNUumEx511exluxvakkleRVD8KLz9H82v5xi+ci3Oyau1zGW8kyScyRqtWdka1cNGyFBE9Q1dV+LEfJbTG/tEPo7FmlMz26ovCSRaoKBygjLVNZvKbau/IoMXk7Gu7tNQZiX2a8xPQuZwRtbgJdzVt1IjEKK2ZKKnVDkxHoHeoxP8Beyo/cL14m8An1u+ZWrVLKP+z7p4v1U+4zegNToVfkPWc8HwPYVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8163d6d8-772a-4e31-2b9c-08df1903ed92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 23:47:57.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RGiBh9xHFy3tzwi5+XMqJkXr9oeSiUCYRwdV+5oH1u7Pj3d0dejYPmqmDub34A8jsXXaSiUX4GS6ZMqNYsyNK3e5urdsRZhB9f/YfaA0lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB716723
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

On Tue, Sep 22, 2026 at 04:14:17AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>xe_sysctrl_send_command() currently uses a fixed mailbox response
>timeout of %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS for all commands.
>
>Add a timeout_ms field to struct xe_sysctrl_mailbox_command to allow
>callers to override the default timeout when needed. A value of 0
>preserves the existing default behavior.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 7 ++++++-
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
> 2 files changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index 72baf1aa4b3a..e21848ca7594 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -334,6 +334,9 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>  * If a response is expected, @cmd->data_out must point to a buffer of
>  * size @cmd->data_out_len supplied by caller.
>  *
>+ * @cmd->timeout_ms specifies the response timeout in milliseconds.
>+ * A value of 0 uses %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS.
>+ *
>  * On success, @rdata_len is updated with number of valid response bytes
>  * returned by firmware, bounded by @cmd->data_out_len.
>  *
>@@ -347,6 +350,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> 	u8 group_id, command_code;
> 	u8 *mbox_cmd = NULL;
> 	size_t cmd_size = 0;
>+	unsigned int timeout_ms;
> 	int ret;
>
> 	guard(xe_pm_runtime_noresume)(xe);
>@@ -360,6 +364,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>
> 	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> 	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+	timeout_ms = cmd->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS;
>
> 	might_sleep();
>
>@@ -375,7 +380,7 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>
> 	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
> 				   cmd->data_out, cmd->data_out_len, rdata_len,
>-				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>+				   timeout_ms);
> 	if (ret)
> 		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index c236e5377f30..e98fa6877fec 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -105,6 +105,9 @@ struct xe_sysctrl_mailbox_command {
>
> 	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> 	size_t data_out_len;
>+
>+	/** @timeout_ms: Response timeout in ms, or 0 for %XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS */
>+	unsigned int timeout_ms;
> };
>
> /* Modify as needed */
>-- 
>2.43.0
>
