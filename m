Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E7DD116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 15:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D6310E674;
	Tue,  2 Dec 2025 15:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Epxkff0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AFC10E674
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764690751; x=1796226751;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pe2EoH++s0JC6qNagXkVWZ6cQ+GCRCowE1LACWRe9Ek=;
 b=Epxkff0FkMzh7LVk0JE3Q5k+TJFE6m+tYBtirj7SxEoxoG5nQbDXgGfi
 bHpAsNuien83VeG+Uwv6PF9FEEas0nGFwkf10lnjhVHYEE8z3au0H09Ho
 hcf5FpdLes18qZCJp6O51ADZ5+9S5ZRukQSlrjn5km8UEZ4ryjF9U+Qhy
 PgfTwcJKBLztB22V32ochlVWm9zJvdtAsKTAOy20sQGh2dPgoKJ3zqOoB
 9+CbmPA/zKGCJzJ902Oc+rhN8YfjAPKk29Rs6bJRScZKRJ4Fv1KEZbkCL
 mmBISuE0A3dMWFlHXXtZP78drq+4TvneWkTMwmSUzpTQgxYwOGaJw8SNH Q==;
X-CSE-ConnectionGUID: 3c+CYXlCTqaIiBUHZdcxvA==
X-CSE-MsgGUID: kEB0HgmTQqWxrfSSidv2xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89313015"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="89313015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:52:30 -0800
X-CSE-ConnectionGUID: GP/11RnjTBqvangnPrdphg==
X-CSE-MsgGUID: N43TwhBZQvmyJyy0iZpSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198817552"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:52:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:52:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:52:29 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr8Z2icnj8ECsv+70dC4FLdxE82ypGI6vKWtEXCITsAQy+7cTp3JdasSVakPIZvic1fc/Pw9Eatk9dA+pBucwBjIlwD1ZN7BQzvsRzSXxogHnle/lmIsnMg/VabMyqikhqV/ct+5ocRX6IcP6ShhfElwCSr3HZvL99gNj3XNA4fFUdCEq9zHYnDvMFTmuZo6j29p8nPeZROWhf2jDVF5ZO8w5+1e5usGOp7UqOr7MXxqaZQNuSeDKnmI9c/OUcxXxcBwK2+Fn/IXmSRGPNCl2dGX0V97L8OxAaEaIvM70Ax8xW0Xj7uWUgE+UTnbXnz0MI7yqQeI4SywIydoSdimuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t2dFKgaZCnJUwFGPlyrqLc6qUhcC9spYFgFurqR1Js=;
 b=pzwtgkkrZ9TaisGxDUHPFEiT+AYBdqWUab0BhxWyOrbpbk7ZMinVmUQ00pOXMGZ45hT7wZr6anPbsNwy+5cUuMmh6Ew1Gie8Lv47qU5zTHVgtjyHyQNoL9J2fSUm/aU0aKWNbib8S8L6FX6Jt8Id/+peAKNlZeCWNPUhqhwi/PNWghBeQWrXZ61GXffdPlK9WAy0Sfm7tgINdgetnD8hGydwuQI6idbYenF4WDh5xpV8Uw4pozTGDadwDciGyzaosmPwLkT/pDwopQHwXD4JxfQUxdfSlKcELBuF6BvAsdXJa6xqd5gDvuwotmKZpuH+ap4tq6rDBmYt9pdyRBrzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8962.namprd11.prod.outlook.com (2603:10b6:208:565::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:52:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:52:21 +0000
Message-ID: <e60a856c-7ecd-4e4f-9795-8ba327f897fa@intel.com>
Date: Tue, 2 Dec 2025 16:52:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/xe/sriov: Add debugfs to enable scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-17-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-17-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:803:118::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdda2a9-8cc1-4510-9ca3-08de31bac732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akpUU0J1WmF2ZEN1WWNnTkJiTm1JSXVDYU9TY2doT0hNOXVBUmwxaXU3b1pW?=
 =?utf-8?B?aUdDc0d5QmFJREl4cHd3Y3lZNlh4L1VaU3g4MS91TDBjVGFFZC9jRkNpZnc0?=
 =?utf-8?B?QmpIOC84NUZ4UFpoWkVuSExJWmdtMkd0d0gyMjNmWG5RU2s4WVUrbWxyQVpD?=
 =?utf-8?B?bDdUdGQxZWU4M0o1bmFBYU1xSHR0cTlGUjBJUjFXMFJlYlFheXptaXJXTzZH?=
 =?utf-8?B?Tk5lVHJiMlhzL3VJUzVaUHgrQmllcFRad3AyaG4raGw0T1F2UjN0Sm9zL3FJ?=
 =?utf-8?B?V3dqcHoxQ0NPNHNxR3dFa1lMb2MyZlcvUXlWSGdHaENFc2N4dkxVcjQwWFNU?=
 =?utf-8?B?M1lwVVkzaENXWGU5L2QrM1F5K2Q5MGN4L2lJQzI0eFhBS1JuVHJIQW9iRjRo?=
 =?utf-8?B?K25JWGw3T3hseEZIbW11cmMrSC8xbmtJN003WFRpdnFiU1VHNStmNnFBanVy?=
 =?utf-8?B?Vm1JTzlPVWlQaEhQbWF2cEp4ZWplU2JIQld0ZS9wTkN6a09LVFJ3QXc4bG1M?=
 =?utf-8?B?MmZ5SkxzaWU5eHVySnBITG40NU1xZEtyOFphc0YyVGRRdUdIME9zakU4aU5S?=
 =?utf-8?B?WVZKVVdFYUI4VHRpOWJLOWhWMnUwbGVvRlpTRUpUL0xkTzgyV1FFcHFkWDhV?=
 =?utf-8?B?MEkyUU84anp1dWc1eHVuRjZoVW5wdDM0VEFodzI2aTV2OEVEUUROMVJySVls?=
 =?utf-8?B?TmZFYjhTcVlxMmI0bklabC9kVStSY0ZHVzZldG1vNVdLMW01cXBSbmpkVmhs?=
 =?utf-8?B?MWttdWZ2c2ZaZEJHR3VaWkp6T0IzUi9rS0orL3FrZFdLdHJoL3AzWVdzZGxF?=
 =?utf-8?B?K3hNcGRJazB6eGZxcVQ2OUpxWDB3clY2eU9vZmNEUEVxWkVXODFsTEVGcEVS?=
 =?utf-8?B?VU9lbUtpczJKVXd5dG5VZDNFNHFwL2VPckVIMm1aQmt1emZmZy8zMXVXZzFh?=
 =?utf-8?B?TDZxeDNjamdFd0lORWVWZDJzNCtzaE85M001NVpZWVgrenFEaHpVcks0TXcz?=
 =?utf-8?B?YXllMDJ4cGFCeWs2N3RtODBtUlFHSlFySE5uc0hqdDFLaCtCa1gxR20wRDBL?=
 =?utf-8?B?YVJYRXVxc29nbEhvWng4M0c4dEhEWHYzOW9VelpGWS9EZmpMSnZWUnlqMGpi?=
 =?utf-8?B?UHNNUWJIc0dTR2NyU3dCQ0psVmVDVkhWeXJyVE9PWU1lbDIveTFndElJK3lp?=
 =?utf-8?B?NktZVi9vRWJFR3BDY0FIUTdDOHdLTnJKaGtJdlJpMklmL0dFTkFkY1h5citU?=
 =?utf-8?B?UTFoOUg4Y0FSWS96THoxU3V4MDhlTkE4TlNMRHdiTDg4SmRXZmg2K05LSnR2?=
 =?utf-8?B?eFNqVlhQTjlmTk9vNmVFTVFuakt6eVhUYlREN3o4dkFaZjFYS0NURFQxUnVo?=
 =?utf-8?B?elRNV2dvUFVSZUdHVXFsbzZLRlFVZG96UFVVMVlsanVQT29RMGFsMEdrODBV?=
 =?utf-8?B?cUJjaFU4ZnpGOXdXZlJTS29PczFEYjdTTmx3dUozUFI0bk1uR3FDZXI0djg5?=
 =?utf-8?B?OGFValh5QjhHNVBMUHVWWU1YNHNPV01CbmxmMW41YTFnenpnbyt2N0hIYnNG?=
 =?utf-8?B?RjgrODZpQXRpRFUzcXhVbzNjemxMTEx6M2lIbVAraGtnSnVFaTQ1ckUyUitU?=
 =?utf-8?B?R0hheEMwRHlBZ0VXWFZHRVF6ZWNkTTRXQk5oeXJJWVB6RUszV1dKRW1SNWdJ?=
 =?utf-8?B?ZGN0S0MxalZ5UHVWUVFBVE1qU2ZLSnhmV1oxQWY4L1hFUHZoamdvblpjdXZw?=
 =?utf-8?B?YS80aUk1dkUxMmV6L3hYVDcyU3A2cEt4Wm9qQUNCUzlHdjlaelRUTEFic1hN?=
 =?utf-8?B?cWFVb3FQditVWitDSjRnRWFVdG9vakowaVBYTUs5eCs0WjVhS3J2RjBCdFBU?=
 =?utf-8?B?ZmRnQ0tjQzlKOGROT2ZNVDRzZ1NwSG9yLzNZbmFRckt5Wi94N1pqMFJ3Kzh4?=
 =?utf-8?Q?cMb0oOGU+S3zmVzZBxAGpmH65+dWxu6+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eldQWVdXL1RaQXdFeHl5TXUxU045Zk0xVEJobnRzNkQ3Yi83WDJWUXF3Zll0?=
 =?utf-8?B?ZDYwR3VERnJCOEJxRlRRcmJiYjZYL3JKemFnVmRxWGdPTlZ6YVZTeWJobHpj?=
 =?utf-8?B?eGV3cWZSaWZBVW82Z3pjT2J0UkFiT0dRMmUxaHova2VoWGcyQ0xIaXdacXBK?=
 =?utf-8?B?YjExdXUxeGlPMG1WYmVWK2VpVGtWeWY2cmo5UDdtTytzckJ6U2lnWWRDK3Qx?=
 =?utf-8?B?ZUxleE9JVHpxaUFIR1FISVZNb1dEQ3QzN1FCRXMwUmF1eFJjVzJvVytqMldG?=
 =?utf-8?B?clJGWHdhT3o4cG9TWW1SS0pENzE4SXJxUktkS1ZjRGtVVW12dVlkUlRvaHhG?=
 =?utf-8?B?S2RTTmpHK1FUc0J1ajlMc0pONklQZTF3dTY3YVk0RitKMnhaT2hSYUY2RTVR?=
 =?utf-8?B?QVJUbEFzSXh2bUt3YzRseFpiRzVKNFhJMWs4SGxkMGMwQjVwZW0vMmEwY3JR?=
 =?utf-8?B?STJoMXZRSFNFaUFCdWRMbE5NWjlPMGtGRHNsSXhvQWVwcUJuL0M3WEVjaHU0?=
 =?utf-8?B?VnVLZTNjalVmc0pqUytDSVpaWlhBOE0zWXFqS3dBeTN5TzdTRjgzWTJNSG5E?=
 =?utf-8?B?U0xQaENmUE81K2MzRVNIQ1kvb1RRcjhtVjA5K0NpcitqNk9lRkc3ajlRUm5B?=
 =?utf-8?B?NHMwcUpaUTU3Nk82QmhQQ0t5dUxiYjA1aTN5emxkWEV4VXQzUitpYWMyZGRt?=
 =?utf-8?B?c1NtZ2xMNW04Ylc1RTlyek1SOWhlOWYyamdhNjFnWEpNYm9ZU0l1M1dTNGl2?=
 =?utf-8?B?NlRTTjJCdzFuRnI2WUJBRTQ1SmlhcmFtUm13NEFRTk5Rck1xU29rUlh5bi9R?=
 =?utf-8?B?ZHAzNWxLTlZ2dHVseTlFL1BRZENrRWhlVDlyaDhIQk9ldDhocnpqT0NpZ1Zs?=
 =?utf-8?B?dEJUVTBIMmRZQ1FOcVhRbDVFNTV5dXJVeHFTSFd1RjVRSnRxMlpMRVh5ZVNQ?=
 =?utf-8?B?cjUwd2NJYnZnK29POUN6cm05OTVsWEl1K0dydUhFZ3g3VU5oYVBiM1E3cnVP?=
 =?utf-8?B?Uko0UG53Qyt4bkxjVjN5YnFTeW81STREeWtmSkxOOFdiMXY1Tmt2bDIwbDcx?=
 =?utf-8?B?U0xidkVDU0dmNDIyZTJyeGo4c01RVlVxSGdXV0xqb0xRWWRSR2xDbmpVTUE1?=
 =?utf-8?B?TUJRd0Rub2huaDQ4WlgyNm9wMStSYmxqK3l4VEZ5azEyUGxWTE0yaEVzcWZV?=
 =?utf-8?B?OUpvMWdhcm53eFJwWFpsNWtaNnUvODFnNVVZd0Y2Z2ZyVjNiWmh2MURJaTNh?=
 =?utf-8?B?Y0lFb25DYWlLRWhQQUdPWko2NHlWVFVPZ0xUZjBuS1pLZ3FOODdLZW01M3ZL?=
 =?utf-8?B?RmlaM0Zja0pLV1lCUHZBMUMyR2NrZmhBVmxOWVJzVzlZclNQS3pBbnE3Vmcy?=
 =?utf-8?B?ODQ4OGhpd2xTM3Z3WkVtNEI4UlZCRDRGSHpNdi9qSnRybmRkZFNlakZ6RkJT?=
 =?utf-8?B?c0EwSWo1Tm9QUkhvejdRNWVVTGhDcGc1dmxjeWR5RnVSRmhLY09aVU4rRXFF?=
 =?utf-8?B?bzlrZmtnUmJJeFNiREcyWnNUM2h1TWxpbk1TbmJuSUk3S2loZ0x3bGxSMTJI?=
 =?utf-8?B?cGhWOWxzcFNaOTdVNCtwWHdURm1KaDN6TmNNVUhXMWM4UUQwYTBCUEpJcDJk?=
 =?utf-8?B?akpwVVRqZlhlTUVNMnY1SjcrTkZpMW1wV1lZeHQ5R1M5MVNNOUJ5NHBpN2hJ?=
 =?utf-8?B?ME9RbHg3Z3FEbk8yM3MrL3R2Q2tXemZhbi9yVjNJb2hxb2V4M0VXbG1ReXZh?=
 =?utf-8?B?RXFFZ0ErdDNZVUdFa3BHcGc2eWNGUFdaMFhOSXY4NUpBUWFtaWdrYnI5NXBD?=
 =?utf-8?B?YjZjNHVzTWJHaUFPYndDSWFkMHU1eTljQnJsZ29md0U0TmQ0VmFhNHRwcVZm?=
 =?utf-8?B?ckVaYVhMeHVZeVFmSHJDQVVkdmpFTDJXemxlcmNPcnA3T1R2TDlqSVU0a3gz?=
 =?utf-8?B?T0RpYnlWOTIydExTNytTeU1ORXJNZVFCb1o0bUJtanY4NGhrSWlubUs1dFZJ?=
 =?utf-8?B?bEo2a0Y0WWd6V25qSlVUbGdyWmUybGorWER5UkFFTnVxQVplbkVGWEU2b2ho?=
 =?utf-8?B?aEtwU3ZWN3ZSai9mcm9pcU5tVVppWmR0QytESS9jNTBlWFpCbEp5anpzY0NH?=
 =?utf-8?B?dmlmWW1nakZDU2UvK1p3WDBzTjAydDBmc0JwTFJ3M3RyZURtRG9mbitSRzAz?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdda2a9-8cc1-4510-9ca3-08de31bac732
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:52:21.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvPha6C+vxrCaiuWghrp6tEV6l4QW9qkzZk6ttdscU9Tf6vWUbaQjE+kbV6GxPMgsMnvb9o6Tnjsc2Z+75cc1Tv6AyBk3CqzSakFNKi9su8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8962
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Reading the debugfs file lists the available configurations by name.
> Writing the name of a configuration to the file will enable it.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 116 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  10 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   2 +
>  3 files changed, 123 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 0fd863609848..2953ef21a5ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -155,6 +155,121 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov
> + *      :   ├── pf
> + *          :   ├── tile0
> + *              :   ├── gt0
> + *                  :   ├── sched_groups_mode
> + */
> +
> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
> +{
> +	switch (mode) {
> +	case XE_SRIOV_SCHED_GROUPS_NONE:
> +		return "disabled";
> +	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +		return "media_slices";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static int sched_groups_info(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct xe_gt *gt = extract_gt(m->private);
> +	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
> +	int mode = 0;
> +
> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
> +		drm_printf(&p, "no groups available\n");

since this will be used by the file read operation and user expects

	"the available configurations by name."

then IMO we should just return empty string

and if we check for EGS support earlier, see below,
then maybe this could be just an assert?

> +		return 0;
> +	}
> +
> +	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
> +		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
> +			continue;
> +
> +		if (mode)
> +			drm_printf(&p, " ");
> +
> +		if (mode == current_mode)
> +			drm_printf(&p, "[");
> +
> +		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
> +
> +		if (mode == current_mode)
> +			drm_printf(&p, "]");
> +	}
> +
> +	drm_printf(&p, "\n");
> +
> +	return 0;
> +}
> +
> +static int sched_groups_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, sched_groups_info, inode->i_private);
> +}
> +
> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
> +				  size_t size, loff_t *pos)
> +{
> +	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
> +	char name[32];
> +	int ret;
> +	int m;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (!size)
> +		return -ENODATA;
> +
> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
> +		return -ENODEV;

maybe not needed - see below

> +
> +	if (size > sizeof(name) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
> +	if (ret < 0)
> +		return ret;
> +	name[ret] = '\0';
> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
> +		if (sysfs_streq(name, sched_group_mode_to_string(m)))
> +			break;
> +
> +	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
> +		return -EINVAL;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));

	guard(xe_pm_runtime)(xe);

> +	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return (ret < 0) ? ret : size;
> +}
> +
> +static const struct file_operations sched_groups_fops = {
> +	.owner = THIS_MODULE,
> +	.open = sched_groups_open,
> +	.read = seq_read,
> +	.write = sched_groups_write,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +
> +	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
> +}
> +
>  /*
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
> @@ -528,6 +643,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  	} else {
>  		pf_add_config_attrs(gt, dent, PFID);
>  		pf_add_policy_attrs(gt, dent);
> +		pf_add_sched_groups(gt, dent);

at this point we should know whether we support EGS or not,
so we should create EGS files only if EGS is supported

>  
>  		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index c7f1ea8eb9c5..3c5fc1b5f281 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -507,12 +507,12 @@ pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
>  	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
>  }
>  
> -static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>  {
>  	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
>  }
>  
> -static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)

public function needs kernel-doc

> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)

if in the single series like this one, we know that we will need some function,
I guess it is ok to define it as public on the first use, even if it was initially
used only locally - this will make smaller diff on next patch like this one

>  {
>  	return pf_policy_has_sched_group_modes(gt, BIT(mode));
>  }
> @@ -553,7 +553,7 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	if (!pf_policy_has_sched_group_mode(gt, mode))
> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>  		return -EINVAL;
>  
>  	/* already in the desired mode */
> @@ -588,7 +588,7 @@ static int pf_reprovision_sched_groups(struct xe_gt *gt)
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	/* We only have something to provision if we have possible groups */
> -	if (!pf_policy_has_valid_sched_group_modes(gt))
> +	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
>  		return 0;
>  
>  	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
> @@ -615,7 +615,7 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>  {
>  	int err;
>  
> -	if (!(pf_policy_has_valid_sched_group_modes(gt)))
> +	if (!(xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)))
>  		return -ENODEV;
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 89aa3af6cc7d..13550cff7c00 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -17,6 +17,8 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>  int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>  bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>  

