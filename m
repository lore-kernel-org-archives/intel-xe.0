Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C5CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAD310E341;
	Thu, 30 Oct 2025 20:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRCHgw6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A76F10E341
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761855942; x=1793391942;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=5gW2BAPoERqVtQ87PgSdEglikSjVWgQNzDh42YAjjxY=;
 b=DRCHgw6nqusXz3UQW+4icRkalaT+dwnmZbf7HN+3py4YUOLfpVCjr6rj
 5iq0L0+0aCgPz3zUCvdDugFWN1jV4CBvRY50TSJFrYlynx8ZpjzzfqMYz
 YKzRnFQAtq82wUtGiUusRV/kUiEPKXHPxWzP0ayHFARz6Sr3Pz9u6Gx2s
 TGLg6L2+ihfPJoGGZwVsEN36IatdIfUHwULNBjEwm+ybS6Da0YyARazPP
 WQAGBuArKjMK+oKm1CSPKSvNJkylgtiV0zi3pq2a5JgbXrPH/2eFlPQDu
 9juWEH5T5aqeearn+9eo53HrBJFH0TUtBK5mc3oPVo5r3n5mHy4Wi0vHv A==;
X-CSE-ConnectionGUID: iK5JS932Q26JdSuhwwh3XQ==
X-CSE-MsgGUID: t55p+UZCRJyWMT4ZRKMU9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64108183"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64108183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:25:42 -0700
X-CSE-ConnectionGUID: kWYjqqxsQOWr/66Iol9vxA==
X-CSE-MsgGUID: iEjqYG0IR86gJ0yIWH6QqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185739208"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:25:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:25:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:25:41 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOh2r06Q8TBuzeWDy3FWrHIBPuNS7vDZeWgFRiIln+nAo6A8EynM5lFx5VNRlmNhus5i8GJ9mfZogRfQQFfhG0bQeWF89rVM5ZSr+WeiyWp08sIsu9O+SFqKAMPcIywsmYxL3gitnJKQh7L03aXsWbNl3m44VqeCwBKksOyswGH2ybXLQtImnSLmlYwnsCxtg7zjaYwg+ADByd5CaFZicv4yVXwjQtOnQvKAXPwazLRSCZc69HF0zX2HWhmIUlxw+Ia656DzyjfK6DO2vQffAQnRbqWgrHZUG+f9VrpIrozwwC+3ck2Hghi9v0BgZbzbsbaBtl7O/WSurLxnsYmaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qUL8k8cgpDlXJoV66BANx54YZyrTNsPe73lrRIp25A=;
 b=xAcmSSioDSIt2u5NWkWp5TSPtg7YFeMoIzHffB2nA9d4hijJ8GyWknoEkzi2sexdr46cmu6TovXow27+aTjYj42CFGT6eq3cdGoAbgQKfOG3VSUfpUisXembH/REmbLUiRbrO0SMoeKgZ8wj3lyn+DPQmvLNODmnNQzPCBmPINNIIUlCz6q5HMsTq6VsTy6u0mxzPW63CnC9W4zD8jtF1K0gggOZftQsjx2SpUOAiZMqxkQ5/OJe4Q3Z8w67Dovw4IQt5A6nCVuchngvEYqqUenEhpk2XasfdaN2O3+za4sKMpSQh5vyYABv2jYN7B0CjqQ2dmjfsSOSo5gKhJolvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 30 Oct
 2025 20:25:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:25:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <411769c1-d90c-418b-bd3d-30ed434d6285@lankhorst.se>
References: <20251030184710.359870-1-dev@lankhorst.se>
 <20251030184710.359870-9-dev@lankhorst.se>
 <176185045446.3303.6205563147139756281@intel.com>
 <411769c1-d90c-418b-bd3d-30ed434d6285@lankhorst.se>
Subject: Re: [FOR CI 8/8] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 30 Oct 2025 17:25:36 -0300
Message-ID: <176185593644.3303.41997236546217622@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 115feef3-62d3-436d-e10d-08de17f27def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qjd4S0s0UlZVdmdkTWlCc0N0RllRdXBNSnJEMm80Q0J5bWJjckd0UFV1MHNk?=
 =?utf-8?B?c1EvcmlqUXlJczZZV2FhTUZSRHFjTmRmZjR3L2VjaWx2T0ZPSGg3WWwvMWlr?=
 =?utf-8?B?d2dlYysxNU9KV3ZiTy92dG1XWmU3SGJDcmg5SEZ1WUhwWWFwUVNCVTgzNSti?=
 =?utf-8?B?a25UODBadFhLbGhyd1lzcG4rQmxSWlV3WGExcVcyc1FZbkdxSWlvekJJUlNu?=
 =?utf-8?B?TlN2clRhZit3RDlHOHRjbHpBbUZmQjdMaXBxcFUxeWcvNy9aSUp1dXdVei9M?=
 =?utf-8?B?aTdaRkJ1UUcyb3lyQUdFVkx5UmJKRm1nZm1pL2FVM21YV0pqd0YzUTh5K3F1?=
 =?utf-8?B?Z3BPa0QvWWt5MlJMdjlOeDFJRVdGa1ZMdE94NFZlRXNNQm9mSFp3QUhVdXp3?=
 =?utf-8?B?TnM1d2dLRzliWW9qYkFKcTg1QXpJdFVPYlB0RGlxVzlxSVAvT2JIb3hwK09E?=
 =?utf-8?B?TWhmWi9pcVRqVkRRNG13S3lmQUlEVUk1VUdDSnM0SmpDUmZLNkkzb0RhS3FK?=
 =?utf-8?B?cUdQTlR0SFZYVWpBK1FmS2g2MlRJcW1Ba2psd0lsNFM0aW9PRWF6cnl0eVRE?=
 =?utf-8?B?MEdZaUorbVp2SEJ6NnJvbzRjSzVIc3FXdVQvUm9JYU9QRmFiNGM4dDBobEpk?=
 =?utf-8?B?SzQxUGRraFlHUjJPSTJXWXM3TFJrL0dES1o4MUg5THYzM1Y5bXlMcmF1TWla?=
 =?utf-8?B?VDgxaStvVGNEUDdWRkpHaUtFbWdIT1dkZ3pyMHpFajlCRjgzbHFWQmtwcWV0?=
 =?utf-8?B?Ukg5WkdwbFF6U2NQcjdVdXBlMlBSRHNYbncwSUxtTm93Vm1SRXBiV2NMVzRY?=
 =?utf-8?B?WDlXSzY4bndvQzRyL0JtUkIwWU5hN3ZieUFSMDhZMSttdHBoa1RwdnFBQmtj?=
 =?utf-8?B?R1BIUlBrenVUOUxPVmpDbUhRV3A5ZDU0aldWSWhySDYzNzR2djNSb055QzdK?=
 =?utf-8?B?SUxSRUx0ZWhPRU1tcFZkSkZkV2hxVlpWbXdUSGp5WEdya0pGSU9OSllrL0Ro?=
 =?utf-8?B?TlN2bTBmSkFnUGNZS0FlKzJ5TlFIckI1elVOS0xYNGtWdXo5c0JSbEtROWhR?=
 =?utf-8?B?ZWl0NktxdGlnN2xaZnk1ci81amNLSnhQVEN6Slo5OHVzQ0pxRklXQnNKeUFM?=
 =?utf-8?B?TlRJSzFoWEUzb3VhMzBKSGxmZExTcnRxWUptb0FVY01VbVRrdHZmZnFxc3hy?=
 =?utf-8?B?WENNcU5yN2RMUHF2NG5GSC9hdXpHZ05aendYZlppVmx2bFJMNG81Y21weGJL?=
 =?utf-8?B?d1R2dzZmM3dlV0Jva3B1aGgvUTRaekZRb0hjTnFQTXRMN3RPVGJWOXVqL0F0?=
 =?utf-8?B?L1ZYaklHL2pTQis2U05YSkNqd3cxYnprM2tleVFkcVF6M01BUnp4UlhmeE5D?=
 =?utf-8?B?TzRhVGxOZmhmckRJN0JpNnVMSnhGQ2tWaURwd0VGQnViOC9TMGJucS9YN1R3?=
 =?utf-8?B?Umw3aU4yRU9Lb0lYNDl0R0NFUCtrS0c4MWI2MVN2VER2NWk4NnRyL0RqUGJX?=
 =?utf-8?B?cUE4UUVvMkt0VDRselQxVURHajExd2ZxR1hSbFk5OXVnZlFMY2lvRHNNakJL?=
 =?utf-8?B?NTc5TXRLL0dMTklsS01hRTJBeDI4U1RiOWZNdFRmWHphTTJaYXJwQjRpMERO?=
 =?utf-8?B?UlAvWFd3WXdLYmVuT1RXT05NOWhSWXNTUWZ4Z1VqeVgxTnQrOUk0SktLT245?=
 =?utf-8?B?eko0OWdwMFBWVHdRcG9kajNDRlBLMzVTNVRMT3FnUkdLRzRzWWN6eS96R0hT?=
 =?utf-8?B?Nk5xZXhIejRnU0lvWHorWE9HYjlsekova3p2Y2E1SDVCa09UMkpkQzFYSjVN?=
 =?utf-8?B?VUcyaFNrd0pDNkkyUHNGTEtYZGw0SThObEY4WUltcGErcjB0cjlmUlJ2S2Nn?=
 =?utf-8?B?VHZ3OUpMZ3ZUaW5zajFkVmN0bi8yazM5VGw3MXJRbk50U1VZSko1TDQ5eFZZ?=
 =?utf-8?Q?/SZi82i/a4rEb7l6Qf/W/rQ5AWaXcQp8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZYbSs3ZlZ1dDl3M3V3QWkzU29QcXErMXRsdGVOTnBNNjJpV3U0ejQrdVNR?=
 =?utf-8?B?WFFyUWtML1ROdEpURFhVUXQ3eFZSbnROYnE5NnBaUkorR3VDc1RyczltVUNE?=
 =?utf-8?B?TVM2TWFtN09JT3l6cHdXQzlka3RIcmtZNmwya2xva1QrZGR5NWswMXY1WHc4?=
 =?utf-8?B?cVB1bVJVNWZzd0t5T1h4bHJkU1lpeXRJL3hpQ2h6Q1BjL0RtRVdadEhBSU5X?=
 =?utf-8?B?RldURUg0dkFqbmhVdG1aYzlZeHBQWEJwQTVpL2RSQmFDQWp6STZ2ejBiYUFp?=
 =?utf-8?B?KzVlWXkrU3hkQlB2LzlQQnVmTGJ2eTBzVlBMUWJGTWFaZGVuT0NEclA1eU45?=
 =?utf-8?B?d1kxbE9LQ3p5RURvbnRpMi84RjVibTZ5MUQwQzR6a2N6MjhEZDI4Mm00STBF?=
 =?utf-8?B?azJURzBtQnBVdzJlMWwwODNrVEpOaWtGUTUrNGc0NVR3WGh0TURwWm9WL05h?=
 =?utf-8?B?TWxtVFZBUGd1TVBLdURkck40YU8yNTc5SnJ3UUdzbThhQ05MeXpWNU9HTWNP?=
 =?utf-8?B?WFJVRWJ4SEpRcVMvTkpoYXBNcnBjcXdOcHlvS1hsb3FnTG5sdEM5SDZmQVZQ?=
 =?utf-8?B?eVNXcUNrZlNvNThBU2pKS1p4UmVtcXZSZS9kOEZ1S0M2TkFjYzV5T2xlZm9w?=
 =?utf-8?B?bkl0WlpvWW9OZTZqMzFpWGg5cjZOWWh6NzlIblpXWUgwQ0FxYnJvQ1ZHQ1VK?=
 =?utf-8?B?TUZMc3BnS2dBUHRYclVSSWtmMFkvYmlNZi9KZEVZbjRCY21TdHhjckVRZkFm?=
 =?utf-8?B?eUxob1p2TThkejBaU0dWeG04SzlVMzNyUm44bUNlTEI3TERHaSttU3RHMkVn?=
 =?utf-8?B?R05iSjRwY2ZZWUJpZjZwUmhqYUE0WUhyZWpXbEhtcVNPVGdVN1V0S0RjTnNP?=
 =?utf-8?B?Q3JPSkVaOTZVbGdta2YwendRT2hJRlhxcHNXRkt6TjZRSTR6aENhT3BsVHVB?=
 =?utf-8?B?RlBIcFdYL0dJMzJVNzhtaXoyTkZCM3dUOW5RY1A3ZVVNY05hVUtyQThvSGNu?=
 =?utf-8?B?QmxiZUVmWXA4cklvZlFZVkFwRWVwUTJ5NFhEMjVaa29tc1pZWGNQYjBvKzhB?=
 =?utf-8?B?Yy8yRzN6VHhMTWpzSkd4VDR5ajliditwSjVSeXp0VG5VZHRacVJjTVJZaklU?=
 =?utf-8?B?TXhta2ZIcEd3Q2V4S1hvcnhSZFFaTER1ZzNqUDZXd2tsTFNoNHJ5dVBBc2V6?=
 =?utf-8?B?Q3FNeGhwZzRwbEhmSUZMK3RpUlBMMDk4NTRwanU0YlZsMHlCWlhicmdjdjFJ?=
 =?utf-8?B?eEozQW5yRHNQTlpHQjNIc24rNUZRVW4rUStBQ0hwNFhad0V4OCs0Wk9kdHlq?=
 =?utf-8?B?TVFqenJtWTh6ZUJCc3lrS0l5a0ZxQzNlTEZicDJOOE1yMERyT1ZwNXJkb2Fk?=
 =?utf-8?B?NEpJdW9vQWFySUp4SzZwTFloTFoyR1RpMTdTNEs0ck9XQk9QZFFVLy9jVkFx?=
 =?utf-8?B?VzA1dUc3b2JUWUJIU1JGd1hxcG0wVUJkeFVLOXFhc1dsZEZWWjRjRVZwc0RY?=
 =?utf-8?B?SU9TNy9Mczdva0lxWUk2ZE9UL0xkZUExblhPUU55aEZBRHIzSGY0WVN2TUdy?=
 =?utf-8?B?RHk4S3hMamNJTVFVR3ovUVJPNU8xOTBGamZLV1N6MzFwa2dkbElZTmcrZEUy?=
 =?utf-8?B?SkpKSjh3S0lYN1ZPZmNyN1BKOFZTcHM4dkticXlrb09LaTlnd0c2NTJPTUww?=
 =?utf-8?B?Y1J2SjhFRDArVUx4dE1zeUZYUDRKWGhUck94WHJnL3lEVERBVytSZkhDUTRy?=
 =?utf-8?B?MWZOWmxxMCtyMTZKNmRwR1FWRmVqNXBLVjIrVVJ5RDIzZ3QrMnVSUFJuek1R?=
 =?utf-8?B?c0FVNVhFQ0w4MHZWVit6OTBvakVtMDFUbXJ1MWNIeGRITzJVU2xkYjJDblB4?=
 =?utf-8?B?VVE4VUZNbHBDd0xwdG51bUFVVEpOMUJkOFNtL201Yml4SXpKRktpNnlqaWxP?=
 =?utf-8?B?MmxOenhQMnNVV3dBejQ1VDRpQU41RVFOaEtORk9YcGYyaS9BV1RyN0NXOFgv?=
 =?utf-8?B?blRVbFBhN0VUT09vdUozWWJLTWZhMHFjMUc4eWJwWEJTcmpZdjkwNGE3emVH?=
 =?utf-8?B?U3ZXaldtM3FoUEc0dUJFMFcvMng1WCsxNjcxaDI1V3gvL0VtQ3Qxd0pQejlN?=
 =?utf-8?B?MjlabWlwZFVyNnlCNWh4QVFtTmJMcUpyQ3R2Ly9sZzRUcEh3b3k5b2gwQTc5?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 115feef3-62d3-436d-e10d-08de17f27def
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:25:39.6917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STTOLV/S6eTvdKC/C9Xzm6mxx2TIVDHtKE6EUIzPHT4t1sAf9A7cgX4vMknU+rS32/cZZhgDVQ0dTbXjTjhIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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

Quoting Maarten Lankhorst (2025-10-30 17:00:29-03:00)
>Hey,
>
>Den 2025-10-30 kl. 19:54, skrev Gustavo Sousa:
>> Quoting Maarten Lankhorst (2025-10-30 15:47:10-03:00)
>>> intel_set_pipe_src_size(), hsw_set_linetime_wm(),
>>> intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
>>> are called from an atomic context on PREEMPT_RT, and should be using th=
e
>>> _fw functions.
>>>
>>> Again noticed when trying to disable preemption in vblank evasion:
>>> <3> BUG: sleeping function called from invalid context at kernel/lockin=
g/spinlock_rt.c:48
>>> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: =
kms_cursor_lega
>>> <3> preempt_count: 1, expected: 0
>>> <3> RCU nest depth: 0, expected: 0
>>> <4> 4 locks held by kms_cursor_lega/1505:
>>> <4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_=
mode_atomic_ioctl+0x13b/0xe90
>>> <4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mo=
de_atomic_ioctl+0x13b/0xe90
>>> <4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_=
psr_lock+0xc5/0xf0 [xe]
>>> <4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get=
+0x3c/0x140 [xe]
>>> <4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U     =
         6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
>>> <4> Tainted: [U]=3DUSER
>>> <4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-U=
H LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
>>> <4> Call Trace:
>>> <4>  <TASK>
>>> <4>  dump_stack_lvl+0xc1/0xf0
>>> <4>  dump_stack+0x10/0x20
>>> <4>  __might_resched+0x174/0x260
>>> <4>  rt_spin_lock+0x63/0x200
>>> <4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
>>> <4>  intel_dmc_wl_get+0x3c/0x140 [xe]
>>=20
>> Isn't the real problem reported here that we are using a regular
>> spinlock for DMC wakelock instead of a raw spinlock?
>
>Regardless whether it is, we should be using the _fw variant here.
>The idea of the pipe_start/end() sections are that all relevant locks are =
taken,
>and then complete as deterministically as possible. That's a lot easier wh=
en all
>locks are taken in advance. If the wakelock was needed, it needed to be ta=
ken
>before entering the critical section between pipe_start/pipe_end
>
>You're pointing out the related problem that the DMC wakelock implementati=
on is
>incorrect right now.
>
>I believe that too, but we should aim for a better solution. The DMC wakel=
ock
>implementation should not hide the fact it exists, instead it should be
>acquired explicitly like the xe_force_wake_get/put() implementation.
>
>This may be a bit of work, but it will be more deterministic than the impl=
icit
>api used in i915.
>
>For correctness we could validate and print a debug error if the DMC wakel=
ock
>was not taken.
>
>intel_de_read() can still optionally validate that the DMC wakelock was ta=
ken for
>ranges that need it if debuggig is enabled, but we should aim to remove th=
e
>current spinlock/refcount implementation.

That's an interesting view.

Adding display maintainers to the discussion here. Jani, Rodrigo, how to
you see DMC wakelock being changed in the way proposed by Maarten?

--
Gustavo Sousa

>
>Kind regards,
>~Maarten Lankhorst
