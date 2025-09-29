Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D467CAC5BD
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191FC10E3B2;
	Mon, 29 Sep 2025 08:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYwknh2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911E510E3B2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759133100; x=1790669100;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rVBOo5LF0is4IuCU4+ItaqXLZyv84Xk7RuCemFuqoB8=;
 b=YYwknh2LgLVhW6EX8nWFH0lDYpwHi8UlevKtyEELoZo2kINCa2j29QFy
 DnPr3M3eEAspZcszT1NQXvyOL9LrxNR8j2fDDIivB8P2fczmnqpzNsf4V
 GpEjR0dGH+AWI7CvXLfaBtgllQEuf3ZUfPoWhV3pdBBmLVCDM+uVHNxFJ
 BgPCAm7dXA+Qqgcg6zVlNg2XpXvPkTa9BwouHOr51K2GxCSjbMNkQM8bB
 SvcIhbAdqQLu2+ELiHHRWU9MhTMUNK4H4uFVh6tAptYND3Set6CMgHfYQ
 roFRXXdK+A2KzspjQj3WHUTM9WbEomCjOmrtcEwEIpSv6qkQ6dHUmbMCS w==;
X-CSE-ConnectionGUID: Z58jaJGiS66seisytAhJnw==
X-CSE-MsgGUID: tNmHMHfDQ5K/C6QI2cIqow==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48932859"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="48932859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:05:00 -0700
X-CSE-ConnectionGUID: KqPK6mLCR760HqVq0gHCVA==
X-CSE-MsgGUID: 4/Zi/N6uRRSuSbBxL1v13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178230970"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:05:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:04:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:04:58 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zir9SoWEmttQb57MJ+hZXrjTGSofLxzpLE8lOHnwa/kWJT4P591o09QHe1okMPbAxjh0vrwENm6av//Af9WOMzA1mq0la/oK9o7nfjEYFUXvSpRK8Z25hl4SOyfIPloB2zvwCfHqViGJnXfppLVLhd6BLjxSpfafdpEGEoQ+bl2KSU5Nfb5sjkC1hpBZuHGFnzexyFrqQrQ5GQnkYY9GPJZ+z/qWFE+CYoGVrNdIbMgfiQz5IUchJJ0xF4cwVge4MB7GaPDhW9EiKvSSIIPPW7M4qIXRTDF8FMSG6DDBGKjxVKFmS+Eu4bodF4cTT9WGd/dcya7mJjEZOCrNHmuPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgdqe3WQ1iYhd/ktdkQBN3pEuDMSLWGOwfKYQUhJAhs=;
 b=ldO7gQedRZS60f5uVEBgNqIgVfQI8gfcvWsZ/Bydc+xmPIkzeEAgQSHpUcDnEeVjIs/QaVPeg3TgZg697rcqwzq3WaA6qd9FJVl5d57yt2JlFeL+3yeYkBuq6ChctdA3Ou+VdoTh9iiiQtyGI/Hy1NlK9ijeVGwr9eV4CczRMybpB0KiMy6LoodZ6B7sW3nih6RUVxEz2QdIRThntSZ6kiAoAz5B+LotuMG7GkqMzp2lJlG6ri7p4ViEKEpLu0hEqbUsHHo6b1WpO/DFyvcTQSsfa5O6lYySsLlXrezS/yXriaArXEhfmuTWiOp5/yaSJu8eApvb9esYb5pL4Nx41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB8158.namprd11.prod.outlook.com (2603:10b6:8:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:04:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:04:55 +0000
Message-ID: <2ccc4c58-5ca0-48ef-be4a-902073f7b8df@intel.com>
Date: Mon, 29 Sep 2025 10:04:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/36] drm/xe/vf: Add xe_gt_recovery_inprogress helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-13-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: a12b8fa4-9271-49db-da1b-08ddff2ee07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VLZnFuU3QwWDFITEpmb0ZQWkxmT0FhczZpbnJ2NVpRZTlvaVBEb2lTWXZi?=
 =?utf-8?B?N2JuU0pxRUtvUy9FRTQvK2pkMUtweTBVWFpXeHVweTJNNGN2dDIvbzdveDJn?=
 =?utf-8?B?T1EvemlJWmNJTzZJUFNxRTYxOEpPK2ljTmNRS0ZoUVZOZ3dRVzI2b1prTkls?=
 =?utf-8?B?bVVsbVozUThyU2pvd01XT0h6enFwejl6dmk2ZGp6eTIyZk1Na0JiTWF2bWFT?=
 =?utf-8?B?eVFSYVYyVVRFOUVDa0t6R3p2NzNlczBOMkJHUERSNUhSM2c3NE5TbjZTc2M2?=
 =?utf-8?B?bmtDYkRrd2lIYU1PbGtZZVNXeVZOWHBlV2k2TGM1bmJvT3VmN1hEMm16N3FG?=
 =?utf-8?B?QjE4RFZTeStWRFhzZXZ0ckRZSWxPeWt2M2c0QXEyR3lKOW5ncHZxamgxWUhK?=
 =?utf-8?B?b0hXQWZBT0tEU044SVdTbzNJbEtlMVJQMnRDYmd3REE5K3l6M2hVbThNMXZL?=
 =?utf-8?B?NVJXT2J3dTVIWmZPSjJWT092ZzVhREc1djBWSGFGcVY4c0Q1S3lCVzJhQzE4?=
 =?utf-8?B?NFp0MElheEEzMmZBRXdxaDFrZFVuYnU2NVRBS1E2WnpHeE00RERNTUZ4ZUxJ?=
 =?utf-8?B?VWZYMTE4RjhGdm9kQnRVZkEwZ21EZWxCQkJpUjcvd2pDRFp0ODZHT29RSGcw?=
 =?utf-8?B?Ri9LU3B2eHVQNmVvUDc3Umtmd3p4OVNzdHpNMG1pOE1aNzk0MWFiL3hYODl4?=
 =?utf-8?B?ZFdpVzYydmRrdy9DTnFsUzJ2OFRpQVhsSWNjVGFUZlNLdFJGdmNtRjFWY0tZ?=
 =?utf-8?B?cEZDckdueXpEMEVRNExyTHFsSjE5bldCdlkyaTA1QVFHK3p5MCtDUURBdXVt?=
 =?utf-8?B?Y3RIY2hoTVlNYTcyRUhLTUlWNlBHNXc4RnBOeGF6VXUzV2xjaWhCbHRnaG9s?=
 =?utf-8?B?YjJ6aGRMT3B6c0V4OE5ua1l0TE1QL0hDdUxhaHdzYzMzd0FSWDNjazVvWlRm?=
 =?utf-8?B?MFBlR2JCOFBXKzAwRXc4ZEdrZHNPdU5ZUU5yZ0szZ2UwVytlZ2FyR3Jla1hh?=
 =?utf-8?B?dnVwVzRRaGZNdVMwbE5PSC9DNStHcGwyaHA0VkRjNFVTSTRTSWVKUC9aY2M3?=
 =?utf-8?B?dnNDZWJtU0l5cUFSVlMzUjl6OVllSmFnWGNDSGJXbzBtY2dPNHlRS3FsS05X?=
 =?utf-8?B?TGhFSDR2Q2dCVGhtbHhTS2pLZGFudTdtUWl3UzdONW8xd3NESnEwWm9TSDJa?=
 =?utf-8?B?TUViSjlUVmQ5ZE9hNHhta0dNdndZNDdtTW9aYThYSGVDY0pwcmk4aUUySVlX?=
 =?utf-8?B?emVNM21NZm13TzZ0SjdzSm8rNmtadmdsWTZnRi9zVlRZeldjdkZjVWRHK3c0?=
 =?utf-8?B?am9rWVluMFpjSzQ0MlUyc2hTVlVFREtGUmV0NmRpUkN5MFFCcU9DdWVrNHdG?=
 =?utf-8?B?eUFZRmZRcnp4bFRFditiVyttWnN3LzZvSkVpYXNNTkU2OUhsS2ZMYWtDM093?=
 =?utf-8?B?OEVuVHBITXlONnN5bWdZUURWZ1Z0K0ZEVjZIOEprNkFRVCtLUWdHZkVxZlhp?=
 =?utf-8?B?VERQblFRQ1k5SVBaK0dqU0lrUjl1SkVLQzFyUUxtMmRWaElUemJPK3pQb0o2?=
 =?utf-8?B?Tk8rM0xPN0VzcFBmZFIvZVhNSDBrekpHZktEMW1XQ29tTVI3K3FVRE04YklR?=
 =?utf-8?B?RnM4aUR1QWRkVlNDQy9SekRLT1dJaXhYYVlSdlczYk1rcE16b1B0KzgwMXll?=
 =?utf-8?B?UXFUY29HNXJNd2tmd2dsYkl6L291UjJ4c2dTUTVTSHM4Ty9JbHZzZDNZeG5K?=
 =?utf-8?B?UDk4Sy8zVHJxT3VhMklGcnlaWGY3QkplR1JPZlpLRjFWeFRqejBvZ3BRcjlx?=
 =?utf-8?B?VUtQQ3lEYUFnR2crVjFFM3llUjhaS1JJOUowMlpKY3I4NkNpdG5JeUtMaXVZ?=
 =?utf-8?B?RHZtYWdXK1J3SU9NK2dvclRXWUVZd3VRekIwSmtTSGU2QXRjR21pdXJZc245?=
 =?utf-8?Q?YW1kU5yqxC0GPvG5CsNyxcB27DhC5+13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGxnaFBuTi93RFh6RzFQUFRzUG5sRXRoV1JFL2ZIcHliS0EwQW1TNWdtaWd3?=
 =?utf-8?B?elJhYTJnbGJ4UWNOU1RjQ1k0OTRPNE11RzFaS1VVWTdhazNOdmxIMTNwbTly?=
 =?utf-8?B?RUJBbnRwMXlSK3RKNytvczJ1SDB0OTlENlp3QXc2Sk9CWUd1YXMvS0hKZ3ZV?=
 =?utf-8?B?T0NIenJxM1U3Z3pyd0JCeTU3UnBiQzFsYmNxQnBHdUY5ME52d2J6dm1lSmpt?=
 =?utf-8?B?aUwxdWphSmFWK2pzVFF4MCsySnFoMmlRY0hpT2NmM3c5RXR0dTExTHBoSjdQ?=
 =?utf-8?B?UklaOVhkQ3RaY3JEWnU1OXl4N1F3VWIwWjg2SFdLQVFzVHBIbS9NWllUWWxq?=
 =?utf-8?B?OHRrbUpsaWwvclF3YjFuZDYrY0RiZDVRcWZ0aWhKbk1JMDFLK0EzWDhxUG1K?=
 =?utf-8?B?YW9DQTF2aXJ3WU9ROGhFZDEvTW5tZ09rVXpkN1hlOHl3NjZHNm5FUEFscis4?=
 =?utf-8?B?TXRUS0hOUnpWSFRja3ZBU2h3UFFWemcvcEVGcmtCSjVNTUJqNnh1TC8xaFZP?=
 =?utf-8?B?U1hBLzAwRkxNajR1ckRiZWJURG5KcHhOQ2lobktMa1lCR1duR1h3VElUZGk2?=
 =?utf-8?B?VGpuSmhyWjdqcU9RS1hva2N0VXl4Y2RwRnBncDF3R1dyOVVkTUhHWFArOFZH?=
 =?utf-8?B?Q000aEI1czFQVnFXOVowSW04eHNBaXdnNU1DOHBGa3p0NEtaSkxMbFE5OVM1?=
 =?utf-8?B?OEpsNkFxTXoyUnkzZ1hhV2k4UE9rUHFmYllOWnBQZnJrRXVDeVdvaFZ5SCs5?=
 =?utf-8?B?QVhKRFRwZmlRdEE5WVo5M2tHekJiZkQ2MFM5Qi9nd1pOMTA1Uk0vdnFyNGZQ?=
 =?utf-8?B?MG1kSTJxMGZVd1FiTit3MXRPQTBtSjRweDNybkhxemtOZHBXT3BQUFpSS0x0?=
 =?utf-8?B?VmNROENGQXgrbDVteWk1dy9hby83Ni9sSEdBMnBmdWdNeG5TREcxaHJOVnNL?=
 =?utf-8?B?c1JjekdhZGlpUEFYZG15VEpUTXUvTlNTbjlVMkFjK0hQQ0lsYVVwTWRzTGN0?=
 =?utf-8?B?NDJ5QWduVzVaS2VvK3kzZmthMGt6RWxoSHpEVEpnSlpBY3hFcnd1QkhBY2Zw?=
 =?utf-8?B?U3hOQW1tQkIzVk82QWhFcDlLdWVIbTNxT1lPOFc4THUzdDAxeXBpNlhudUkz?=
 =?utf-8?B?RVB2OWtDL1BZNDN0bnBteU1xUmZINGFXb1hZU0I0QU9IekZaRi9ZaDdLd3FF?=
 =?utf-8?B?YWI1SGlVVFRjYUZucXg3R3J6RS9kcnJKWjI2UUdvOXFqS1dLd3B5cEZRVzR1?=
 =?utf-8?B?eTM4WWRHRWowSkN2elNFenB2Mkl5VlIwakFDd0RLQjgydUlScE9EWGpDbmt1?=
 =?utf-8?B?SnZCTmxnUlFROTNqTVoyTFJ4TGNQbkNYc2RMMGhrSjZYekZYakZ4R1Y4VUNj?=
 =?utf-8?B?RHBNbno0UnM1cVVabGlpUUVPRDJxUTVpaGtTZGcvSGp2d2VUWVlxdHE4NE1p?=
 =?utf-8?B?UXNlOFoweXpEZHp6c3VWWWVBaUpnQ0ZBQTcyankxdXBVd3VPRVBRTVRBVkVx?=
 =?utf-8?B?K0p0WDVPYi9kenM5NFNHbkJXYnFqNGdlVExzdGdSUjhrcmJEUHZ4d1N0UTQ2?=
 =?utf-8?B?WUlaREdlTStFSG5OcnVzWi9DVXlGYzd1OW40elVpZksxVGprakZDNnNIR3d3?=
 =?utf-8?B?SEl4R1hsajRzNVM5cHFPM1g4ZVpYUjkyUDlsWmt4QmRYTUs1RU9JZVFsbEdL?=
 =?utf-8?B?T0dpUlJKdGxQcHVsa04rUlBxc1N1K0JUa1NSWCtvZWNPNGZUWjVjS2RqZWYx?=
 =?utf-8?B?ZW81ejVFN1Q5R2FNUXBQMDhsMStPbHpQV2dRajV4WHdIenp5ZVBEUEl0cHBC?=
 =?utf-8?B?bHY2ZGltbWRJbG5xTlhoZ0E1eFNsUDZzUmFqRmVYZUpMUUYvS1k1Ry9wWDhQ?=
 =?utf-8?B?RTFjcmNadWNaUzY5VEJPejE2TnhoSXV3ekUySmhMNE9aM2RqdCtFZmlXMHVi?=
 =?utf-8?B?VGpjSWw2aTJtRHREOG43b21VeWg4Ky8zaXFiODN0MnYxSkZuUVNlTjhuYUR1?=
 =?utf-8?B?MjRkaVdCUXYreCtTRy9sNTQwUE93ZE15bkF2NnZVcWw1NjhQTGZIOTZkY3Fj?=
 =?utf-8?B?RkVtaXR6aE9udkU5dHVuTCtQNzBMMWlGSk45UkRuQkJlb2lFT0MrcnE1Q0k1?=
 =?utf-8?B?aHZwWmJaVklRajV2SkExSnA1dy8vYmhTa09ZWkdock4yZDNkNlBaaTZzYnNO?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a12b8fa4-9271-49db-da1b-08ddff2ee07d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:04:55.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaItbE8y4Pyicc33BFJKvPORMgKBuTG+IyrZB2YpVjClUNt0c/wp2bfPeFTGRQVln3ICsGfLpEVbgWFGgppCcJviEhL2M6C4C7XDHWlxbjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8158
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Add xe_gt_recovery_inprogress helper.
> 
> This helper serves as the singular point to determine whether a GT
> recovery is currently in progress. Expected callers include the GuC CT
> layer and the GuC submission layer. Atomically visable as soon as vCPU
> are unhalted until VF recovery completes.
> 
> v3:
>  - Add GT layer xe_gt_recovery_inprogress (Michal)
>  - Don't blow up in memirq not enabled (CI)
>  - Add __memirq_received with clear argument (Michal)
>  - xe_memirq_sw_int_0_irq_pending rename (Michal)
>  - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 25 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>  drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_memirq.h            |  2 +
>  6 files changed, 96 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..ee0239b2f48c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -12,6 +12,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine.h"
>  
>  #define for_each_hw_engine(hwe__, gt__, id__) \
> @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +/**
> + * xe_gt_recovery_inprogress() - GT recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if GT recovery in progress, False otherwise
> + */
> +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> +		xe_gt_sriov_vf_recovery_inprogress(gt);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 016c867e5e2b..71309219a4b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_lrc.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));

do we really need this?
with current code this function will be limited to memirq platforms only

>  
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
> @@ -1172,3 +1174,26 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>  		   pf_version->major, pf_version->minor);
>  }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if VF post migration recovery in progress, False otherwise
> + */
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/*
> +	 * In practice, VF migration will never be supported on platforms
> +	 * without memirq, avoid CI blowing up on older VF platforms.
> +	 */

maybe instead of closing that door simply code this as:

	/* early detection until recovery starts */
	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
		return true;

	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);

> +	if (!xe_device_uses_memirq(gt_to_xe(gt)))
> +	       return false;
> +
> +	return (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> +		READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..bb5f8eace19b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index d95857bd789b..7b10b8e1e10e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
>  	} *regs;
>  };
>  
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>  /**
>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>   */
> @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
>  	struct xe_gt_sriov_vf_selfconfig self_config;
>  	/** @runtime: runtime data retrieved from the PF. */
>  	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..b681c67dcace 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>  		memirq_set_enable(memirq, true);
>  }
>  
> -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> -			    u16 offset, const char *name)
> +static bool __memirq_received(struct xe_memirq *memirq,
> +			      struct iosys_map *vector, u16 offset,
> +			      const char *name, bool clear)
>  {
>  	u8 value;
>  
> @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  			memirq_err_ratelimited(memirq,
>  					       "Unexpected memirq value %#x from %s at %u\n",
>  					       value, name, offset);
> -		iosys_map_wr(vector, offset, u8, 0x00);
> +		if (clear)
> +			iosys_map_wr(vector, offset, u8, 0x00);
>  	}
>  
>  	return value;
>  }
>  
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, false);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, true);
> +}
> +
>  static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
>  				   struct xe_hw_engine *hwe)
>  {
> @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>  }
>  
>  /**
> @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	}
>  }
>  
> +/**
> + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +
> +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> +				       guc_name(guc));
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..f87e1274b730 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>  
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc);
> +
>  #endif

