Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5779CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 04:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57AE10E635;
	Thu, 18 Sep 2025 04:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrjlvPOJ";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCg+2FH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F244110E635
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 04:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758168369; x=1789704369;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:list-id:list-unsubscribe:
 list-archive:list-post:list-help:list-subscribe: mime-version;
 bh=33SZ49GjNEe06bgd3y9ELSYhJx2arhYWD0l5PDLrrGQ=;
 b=FrjlvPOJcqnL9Ir9kdvbLqJeUIJLpOmj15ZtThwPtxYjnnVCdwAKqU5/
 MlKSgjmTMSqesgx/htP+FRlhqqX3hJxEaM3v41wNg29DKX+7TUYVWRbEO
 ws8yl2uHlWt0y08cN+GyZSqE1Bda7hKVKemB23zAfbhxHVrW09dYzI8pw
 4VhQqUfz0S8TAclIjXr7GoUoLUPpfP1CAMg9letTDOhoViFD2xqGGN4Y9
 NE50hL6lOx6r+sVdsCIfDJYeYP5ou9ftLJonilS7ATx7r7i+hM//FMgRi
 GTJ0hmnG7cij+W1ky5HpyZzrqPixdiQVeKYC7c9UCY+WVlThlo1fxp8Pz w==;
X-CSE-ConnectionGUID: /oYpJmnSQ2uzo4QLgrdo8Q==
X-CSE-MsgGUID: gEk6LmwVTMaN0uNrRNr8xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77924670"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="77924670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:08 -0700
X-CSE-ConnectionGUID: ldxZhRkjToWzamKIldIzUg==
X-CSE-MsgGUID: lcs67t88TEC/naDqOu3o3A==
X-ExtLoopCount2: 2 from 10.22.229.23
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174542603"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 21:06:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRBAacCe5UZO4gpGy8lalLetkTNSE15BWJYibaJtyQzxwzlmzXcoyoYbEMbHYfYGvnRmZLUf5wSMVfMS8HQKhU6O166BaonJNly4NzjPCan/M0QNS2/sTFhBaHxNSGDtjLeIGoOUV+4ELdF3NtTZVTL5VHGF5u8+j5njbsaySCA4di+vlPQD/rSKB5uJ5fdIdbNvYKLCSaJHf6KQYCQE+Lj/PyjyrZ38iYy1qSK/Lu7cScdnli4Je66R6IKId0EhN3bdSfLxdLJ1MZK2eUIYS3tG/otQkJTzujhptjQS9q02ekcHK1cE7Ktt4toxiIJQiAzYlF2sfviWDMZVYEfTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btSI8Ka2ruerHivDAA6YsiNqY0hgykxO18QC4+9mbRQ=;
 b=cmP1ZnrkFHa0DU2MIgQZKRI2Fim+T7vYe9fKbLP6M120Dtf7r+7YVM9wYHusogfQgQdYES4wbFY6ztUOITpG9/tZ890Jpq2qb4ic9Kerq1MfLLJ+HfRW8jRYov66PLQnjj6e3TAXBOMjhrjthJJ696y0XkIaMx53DbgDM9THzIuPajNiq6Vjw3/s4TLqLT7NZKsWCdvNTbPoVU9yz/1Qfc0NH7ogp25M68O6uuWio4BtS+K2eIGIbUBO/kyslmNVa0aICdB+1LdvvPItG0mPJbfw+YvDuOObakzWzME+fTh+Z0N8jqW/9UBk9/ccTEQObtzmNkn8FN/TjrJcMporzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 04:06:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:06:05 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Wed, 17 Sep 2025 23:06:03 -0500
Resent-Message-ID: <svjszewrj3yzeyt2gyrqy2z4ciubgbqeqd3ssdlkbhqbbverel@uqekze4i2ath>
Resent-To: <intel-xe@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145073; x=1789681073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33SZ49GjNEe06bgd3y9ELSYhJx2arhYWD0l5PDLrrGQ=;
 b=WCg+2FH7u1+AGxu8iys3nSLoCsPgFhz51oHwmUX/S9zA3HQDxsYJRzxr
 wfIrHlblr0/LjX+Fn4vgtWR+5vHTOXyXWP8rjIlGyK9SjAxuClJBTY0Yv
 XPktXT77kr13HQvzBxdpYibYZXtsrGDRxuyJdi6pAU5+UmmvzJLeaSJue
 NZIVdn2h9scudJS/VlhGPAd9LSHT7bhkUeTH15HnsfFJGkiyLl9YtQiFV
 5HFJb3ftgNrWhRukCCy7prVbUBmmsVIRehFSLNj0bqPB3Xfrz5n/9uX9e
 creWWzSkyoahvDzmeU/i+wm3+8C58VNJ3TGM4Hf4iroRc847AIqFaV7pz Q==;
X-CSE-ConnectionGUID: abay2zETR26k1ooTAFwAUA==
X-CSE-MsgGUID: z7zct410T8u9EutexcRfzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522751"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522751"
X-CSE-ConnectionGUID: hioxbvtfT++IZdbCneVf0Q==
X-CSE-MsgGUID: urLIJHlAQl2VgGlnP/buPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643060"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Move rebar to its own file
Date: Wed, 17 Sep 2025 14:37:32 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c266c7a-6d8b-4446-82ba-08ddf668b076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkw2R0hFbk9rUHhOcmM0NkMzMXNsL2ZieVhDOURLRU1ZN0RrdE5ESFpXN0x1?=
 =?utf-8?B?WFRkUm1RZnc2WlprQzBzV3NjZWlFSHJyRzhyODV4ejJTUjlpMkh3OUtBd2la?=
 =?utf-8?B?REZlaEV5VzRnNnlselVZNXhTSi9FVU51TThMbTZLRFVCQnZudThnRjYvaTVT?=
 =?utf-8?B?U1E5a2Z4c1Q3RGdxQ25NMlRsT0Y3QVQwNnVtUXYzRlVOZ1RrOUFFYjkxVEJN?=
 =?utf-8?B?aWVvdlJsNHZnRUJPQ2w5VFpFWE9qUmZITFN6RFVkeWlzQXQrc2dvREhaSXJ6?=
 =?utf-8?B?eGExd0FxZnQ5aEQzZGdnRzZKWGxRQ2FRWk4vam43QzYyd25nOHQ4Mm5EaFpH?=
 =?utf-8?B?dVVNVkhTN1B3VHZtanJ3MEtvdFdWcVVOc1pwVnFWUUN3WTZlcVpwUk9FTXRl?=
 =?utf-8?B?elFrZXNuT0JpTkgxZUwreFAxNzJkdVFVakVFak40VTdXNVFHR0pHU0RWc24x?=
 =?utf-8?B?ekhTcEVDU3pHcUlOK2RKbTR4Qkdod3J1azY4dU9acWUwejVKRVN5V2QxNlh2?=
 =?utf-8?B?N29FNXNlUFRzUDhTOTdNL0J1S256dUNFcGRmWERYSzY2Vzg5bEswN2pKSVFG?=
 =?utf-8?B?bncyZk1ZWFRQQ1FIT2dRUTBFRzJwamxnNENneVJ3WlVNM1VOSkFLRTM4d2h4?=
 =?utf-8?B?eE10NDBXZUN2WGZQQ2loVDE2eWNXYXJSY0ZadktBSnV3K1NCNkE1L3M0RFdF?=
 =?utf-8?B?LzVFRDRxKzRMWVdJa1ZtUWJaQ0RoRWR4MjY1RnEzRi9tTUJudEpqbVV2b2lt?=
 =?utf-8?B?TlJMWHBBUHIxN29DYWZybXdrcHhrZHVaZ2hERU44VFovcUlnNlVVQjdyemNa?=
 =?utf-8?B?SUh5dnJaV24yczJLZTFnZSt1WTRIY3hSbEZRWTc0eEJjdVZLWmo5SlFyTzZF?=
 =?utf-8?B?bDJoekpDZFAyTlhyL0FvRHpzTncrSGVNYnFqMVp5d3Uxaml3ZXBvWTV5VVpo?=
 =?utf-8?B?YXFSeWZxVGErc1RQL1hpMEZ6ODBCMFpJZlc5cWxvM05oVUVFclhxK2JQclhM?=
 =?utf-8?B?dDlWYTV5blBmVGpkcGtUNEJsUGx5SEdkNG9tTUhqWmVMb2ErcFBFL3EzMEJQ?=
 =?utf-8?B?NTJ6d0l3MkZ2NjhDOFZadHJIdEhCNnU5c0RwU21zWmx0SW5rRnNYNTBIRWd5?=
 =?utf-8?B?akptRGR0R04zbnkwY0ZYM0JnNmliMjVicmFZeHdhaG8ybFRqZkhrUTV4TUJu?=
 =?utf-8?B?eGtSNmlhZ1hWQXFKY1dLc2RqTTBkN0RuK1BLUXhDMzZWdGR4OTdOWVZhanFQ?=
 =?utf-8?B?Y2VWVU14bTNId2Q2c1pLc3JHMGE3VUhRaGpiU05wRFdlYzBuUHZxM3BDOVAx?=
 =?utf-8?B?WXZiZXprNHlMS3Rsd0MxOVlKR3I4Tm9xczdvTkxsY2V4TjJVUXFPUFlTOXN3?=
 =?utf-8?B?eEtiZTROa3N6YWVETzBlYjFjek9uSHhWMGk5UDBvUjZ1UFp3bTk5REdMUzFQ?=
 =?utf-8?B?TWFGRHNLYU1NN3IxNG9HdHdNamlXdGE2KzZEWWdRSDB1dldkdXJXNXpoWmtL?=
 =?utf-8?B?ZzZZUS85N1llQThJa2Q4dDZPRFVCL3BTMW55ZENsamNtZEVQODlTckp4bHVB?=
 =?utf-8?B?QlJMNE01OU9aS2U2MW9laWFlSlhMdEZpbXpORUwvSXdZRzVKS01uQnU0Tk8y?=
 =?utf-8?B?ckt4S0I3dHVDQ2h5ZE1IWEFqTHgrVWM1SnFtQi9hczUyYXFpQWFESUxoY2s2?=
 =?utf-8?B?cldKTUpXSGZ4RWo3a2FlOEQrRkg0RDloc0d5d3ZXaW9sUXQ5VExLc1gwU3ow?=
 =?utf-8?B?eVI3YXh3K3hSSHhRcVZLRkxJOVFRWXNzb3pxODNVSW9oOS9hdUhPUXMxUlp1?=
 =?utf-8?Q?YDinvDFU09miS5+5dDaGx1iGnGb7qAFI8YePI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4022899009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blpwNmsyaXo1dVY4eDdxRnBRbmV3dVRYelovZzV4czJyanNEUHdrREwvdC9l?=
 =?utf-8?B?TkE5QXhwY3FTbTE5cjZiQ202S0ovYXFsWTZZbHp4b2hoTVlYUklXVm1SVkQ1?=
 =?utf-8?B?RVVpekEyRWVHUkFXTHFBZUlobXZ3UEd2a3Nla3pNZGhpSXpnbHJ0ZitzVkIw?=
 =?utf-8?B?M3FVSnc0Q1JyQTRRTVFNV013SkVwbHg4VTZwVVRyRFozR1FPUUVuakZDSDlG?=
 =?utf-8?B?dzl0MDF4ZkR3a3l6QzIwWmNaN2J2Y0lxVHdvNnZPblQyZzhBWW5DczlraGR0?=
 =?utf-8?B?V1UwUEpQUDY1TlVqekdGNGVNY3ZSZ3ZQZHZxM2NiR3RGVjVhcmJaUDZ3d0FB?=
 =?utf-8?B?R05CK3VoVFNwUlpmRFlaVm52b0VxdW5Za2V4dVdSdmNSTlpPb1E2NzJoK2xQ?=
 =?utf-8?B?dkQzeTV2YXlvTVVlb1FLVUQ1eWdkWE9mWisrcHFCbVpJL2pGZzJhMkF2L1Zy?=
 =?utf-8?B?bkhLcHhWOTdpNjdwSXZHdE5pQ1VYV2M2ekpiazFCS2JqU2NLcmRGMENyS2Rq?=
 =?utf-8?B?VnBpQlFnWUVueXFnSE5iaWFtVVZGQmVXTFdQU2gwb0ZCUGxKcUhtaU1odHlI?=
 =?utf-8?B?SkF3WU40ekpzTitkMWo0Ri9OZTNYNWhydGdXU0lvaFdySlBpUzdXUi9teU9H?=
 =?utf-8?B?dGVoSTB1YTFXN25va29xUlRINk1XVzFzVUk1K1kyb01nWEh0STRROGUvMXVR?=
 =?utf-8?B?MVVIL0ZhallSYStjdWJieVZCT1JDUzgxN0VnQVNCZjhJWGNWM3RlMTBrdUN1?=
 =?utf-8?B?aFA5UHo2b0l2M1NPRy9YZy9WTTA5S2RqbTVUeVdiemlEWU1HNWVSYzN2ZGdB?=
 =?utf-8?B?c1ZQQ2JiemcyMzg4dEpJRSs3MU0zeU5tU1owTDN0NWs4RnBvMUIzMGc5cHhO?=
 =?utf-8?B?bjZJK1UyckpPNDNlOVFvTHlPNUtFT3liU054NmhBZ3ZFUDlldWFhVURpOVV1?=
 =?utf-8?B?UnFHWDlJaVRkQmZmdEFCUWE5TnpyODA4dW9FSzZ6ODVtNWRsTnJ0OWV0NkQz?=
 =?utf-8?B?ai84VTFaem1UVlk5d24zdkZIN0xNT29aWWlZcHlZOHJCdncrTThQODdET2ho?=
 =?utf-8?B?NWNYMWg1UlpIZjArZmZwZWpwSlNZbmxCMW11SjR2ZHZFaGpCUVVQeXZCR3N1?=
 =?utf-8?B?WTg5UWlxQ042ZjRSd2sxMnJ5akVnMzhUaThjYjFpOVdFS0M5VGdFdTd2R08y?=
 =?utf-8?B?TmdGa1FkSzhudHJYYXJYU1JibDY5QXVwc3hoYzZVM3BDdHBHWXM1VnRqYVQr?=
 =?utf-8?B?STZ5RldCcGFTQi8yZk5vMEEvQzA4dVQ3czhMdjFYSmFKcW42ODcxSkVWR0VK?=
 =?utf-8?B?SDU3cm5BM2EzWkd1RGJtb2pOK2xwVWRkcU1MaUlBYTZzN2IzUlFEWm1wRExs?=
 =?utf-8?B?aHdHRFZMa3RGZ0xpL3RuS2tVeXFTOXdkNytPSGo3S1pHcmFzeFVEcGNURm5I?=
 =?utf-8?B?dmRJZXR0VnNKNDg5WTBpbTRKUmIyOXd1a0VyN2hBZGFmZVkzRFlINzdLajEx?=
 =?utf-8?B?ckZ0VGVVbjdQcSttOG12QVhBd2QyT3B5VkFNU2tKMVp2S09jS2pnMkVTb3Av?=
 =?utf-8?B?eEV3UjVSTmdpRENQSUlEQ3ZnQUlUNHNDb2o3WnJrL2JVWkJsMEIxU3NycXFS?=
 =?utf-8?B?cjlydXdoSVZXZUVTWnZuNlpZQkV1dnV0a1ZGeXplYktHcDJqajJsbUh3U0JS?=
 =?utf-8?B?eE1XRk9KTHZtSkZKYlB5MEJjVnB5WkNYZUc3TCtpS25Rd0tiTmJqZFB3Vk80?=
 =?utf-8?B?WWtDMXJNWEpRVTRCWFNYaVVqU1l2a0pJZi9DNk1QL0ZWSGpFdlY3MVQybmI0?=
 =?utf-8?B?U0YzWjFNdFNVazlxdEJmblk5UVBiMmpGUGhqekN3eW1EVTQ0c2FvMlZPWDNu?=
 =?utf-8?B?RXRtL2t0cHVLQ254YXhmSXZyR1RKTEFSWm4vUnJvRHJOd0FaNW1yS2RJbVJE?=
 =?utf-8?B?b0lieHVaWE5LclVxc0gzOG1wVDR5S1R4Y0c3a2R1a1JtVlZtNG1MYW5pWEdu?=
 =?utf-8?B?QVVRbTMxZnQ0d1dxdGNlakkwb28zUERhWGI1S01QQlVqcFQrUEFqRmRZbGc3?=
 =?utf-8?B?bHpKL2FLbHI4QmxTN1dXa0RiK0VNOXgraStheUdrZXVrSFBUWkZyYjIyNXFw?=
 =?utf-8?B?VEJ6WmF2L25MclN4SkNsVlhnR2xteG9qUjgwY2ZrQlRKUE43L2VnTk5sTWRM?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c266c7a-6d8b-4446-82ba-08ddf668b076
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 04:06:05.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHy55lworeDLWI4b9jkwxZyDcHItY+AMZwpjjHOSFoHeqLezNukoLEK5+5J+GllH9pEXmZYnnW7H1h53m5uYtbCgpgcgVo0Pzvk2GcbKf8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
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

Now that xe_pci.c calls the rebar directly, it doens't make sense to
keep it in xe_vram.c since it's closer to the PCI initialization than to
the vram. Move it to its own file.

While at it, add a better comment to document the possible values for
the vram_bar_size module parameter.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 109 ---------------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 141 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7a065c98a3b85..5a66d7a53d0db 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_observation.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1f4120b535137..6cc5e7b6901a8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_rebar.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_vram_resize_bar(xe);
+	xe_pci_rebar(xe);
 
 	err = xe_device_probe_early(xe);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 0000000000000..e04416630b573
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pci_rebar.h"
+
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "regs/xe_bars.h"
+#include "xe_device_types.h"
+#include "xe_module.h"
+
+#define BAR_SIZE_SHIFT 20
+
+static void release_bars(struct pci_dev *pdev)
+{
+	int resno;
+
+	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
+		if (pci_resource_len(pdev, resno))
+			pci_release_resource(pdev, resno);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	release_bars(pdev);
+
+	ret = pci_resize_resource(pdev, resno, bar_size);
+	if (ret) {
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			 resno, 1 << bar_size, ERR_PTR(ret));
+		return;
+	}
+
+	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+}
+
+void xe_pci_rebar(struct xe_device *xe)
+{
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
+	u32 pci_cmd;
+	int i;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
+
+	if (!bar_size_mask)
+		return;
+
+	/*
+	 * Handle force_vram_bar_size:
+	 * - negative: resize is disabled
+	 * - 0: try to resize to maximum possible
+	 * - positive: resize to specific value
+	 */
+	if (force_vram_bar_size < 0)
+		return;
+
+	if (force_vram_bar_size) {
+		u32 bar_size_bit;
+
+		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
+
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
+
+		if (!bar_size_bit) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return;
+	} else {
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
+
+		/* only resize if larger than current */
+		if (rebar_size <= current_size)
+			return;
+	}
+
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
+	while (root->parent)
+		root = root->parent;
+
+	pci_bus_for_each_resource(root, root_res, i) {
+		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
+		    (u64)root_res->start > 0x100000000ul)
+			break;
+	}
+
+	if (!root_res) {
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
+
+	resize_bar(xe, LMEM_BAR, rebar_size);
+
+	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
new file mode 100644
index 0000000000000..c87aa58aee718
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCI_REBAR_H_
+#define _XE_PCI_REBAR_H_
+
+struct xe_device;
+
+void xe_pci_rebar(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 4fb5a8426531a..caab5c1ff7ba9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,115 +24,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-#define BAR_SIZE_SHIFT 20
-
-static void release_bars(struct pci_dev *pdev)
-{
-	int resno;
-
-	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
-		if (pci_resource_len(pdev, resno))
-			pci_release_resource(pdev, resno);
-	}
-}
-
-static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	release_bars(pdev);
-
-	ret = pci_resize_resource(pdev, resno, bar_size);
-	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
-		return;
-	}
-
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-}
-
-/*
- * if force_vram_bar_size is set, attempt to set to the requested size
- * else set to maximum possible size
- */
-void xe_vram_resize_bar(struct xe_device *xe)
-{
-	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct pci_bus *root = pdev->bus;
-	resource_size_t current_size;
-	resource_size_t rebar_size;
-	struct resource *root_res;
-	u32 bar_size_mask;
-	u32 pci_cmd;
-	int i;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
-
-	if (!bar_size_mask)
-		return;
-
-	if (force_vram_bar_size < 0)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		u32 bar_size_bit;
-
-		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-
-		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
-
-		if (!bar_size_bit) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
-
-		if (rebar_size == current_size)
-			return;
-	} else {
-		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
-
-		/* only resize if larger than current */
-		if (rebar_size <= current_size)
-			return;
-	}
-
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
-
-	while (root->parent)
-		root = root->parent;
-
-	pci_bus_for_each_resource(root, root_res, i) {
-		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    (u64)root_res->start > 0x100000000ul)
-			break;
-	}
-
-	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return;
-	}
-
-	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
-
-	resize_bar(xe, LMEM_BAR, rebar_size);
-
-	pci_assign_unassigned_bus_resources(pdev->bus);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-}
-
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 13505cfb184dc..72860f714fc66 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,7 +11,6 @@
 struct xe_device;
 struct xe_vram_region;
 
-void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);

-- 
2.50.1

