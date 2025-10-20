Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36780CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6D310E0DA;
	Mon, 20 Oct 2025 23:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlryl0q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390910E0DA
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761003868; x=1792539868;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XQb8TgMRApKaTQOSpuytQ9OjF4Z21scap5cUV7fp66g=;
 b=dlryl0q7DKlIayR84jmbMGRQkfbvubGBrqs0OcV7IeK+Wlyiq8AvJMjB
 BE8vTBAoi3JpPstrUSOUl+wLdvM48A9GvSyLZ48NldjH3rc99RhB1LPXc
 I82x45Fk37Z8rDVvj66p2JApM2ppI1qjYofnAMO3zUUeawkYbWqpdxMrB
 w9mYjNyt6zoTJARzNgbMWeXXIScdpodtLFGcQZzsN56me1/9neE+XM6TB
 NmtSWwpk6AJYz9m0vy7wzkPDfwCDv4Ji0JGE4R+oEuv1Na/WR1hfi70zj
 PFNPq15/jduyF7u1YUMKnagPGi7gbbgM8wFWu2g2PO8TaMrLspOefe59L g==;
X-CSE-ConnectionGUID: +3Xgb3skQrWwZk/mvpYLbg==
X-CSE-MsgGUID: h5bJ/9jESjig/mB9b6GWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63167444"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63167444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:44:28 -0700
X-CSE-ConnectionGUID: 73MZYWZKR7SVkpD46h8z1A==
X-CSE-MsgGUID: QA0GJ/+UShmUNnJJOt9zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183153728"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:44:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:44:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:44:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cI1c04LJPIvugrArMi4y5+TmQysbkJpvwpe05FB0el5TqxONB7DUjg/JgOm0QUsC4OrfT1Y/j0MZYOvlvQ404cwpsQ4ZVFGdUROHbbkahKqB1whzre1ICGd1atthAsCS/t41Zm8onPbW5SEKfBfpGmTiFWtkfwKsWrjRSG0tTmSA56hMwr2nFa5ZrvM/Ds+uKQOPeT9l1/qp7lC2MjS5Ds1WMCwpF2OxhJq1sh61YwLeFuAvF62xY/bWEMW2xF4tdogQs/ztx0gsqcZI29hLDq7r7lLfX11GNVjnfln0Hf3qxUNTVTxJASDn7ExMLpU9M4UW25AIOtwlJxWzDKWB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUtkbx9ZQaxwuGmwlYTSPgppwv9OlA1SSDnM77GpO44=;
 b=Q4buLJ1nyD5kBWQiGlv2wnqgc/vs50g7R6LTE/PhXYwle6gIiF0PjEGS544TMW2hxhrh/8IVLqogIiXadtPjPIAhMevPlHXYrcxrRpxwRHA81FvNB5pLYis3VkwyQ7gVdfvuWsvj123DkHAkcrmZp8dZkccZqLrFwNf5Nge5k0450zUwtzRicu+gUTdz8oLnejRhD+lfR9W1kTFC273I+3MlyQBljTMjMlwIRqSSu/P5nAWg8admUbFJv9vWkjjDfiOw8lkQLojw3ZMAw/OsIWvhTVhiEx/4Y4e4mX++GLGUVVV7wXFBOOgtPwTI8Do7/Zsm9bN5RcAb3npIyZJqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 23:44:24 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:44:24 +0000
Message-ID: <98cbe993-463d-448b-8c76-7b109d008673@intel.com>
Date: Mon, 20 Oct 2025 16:44:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] drm/xe/guc: Add GuC log init config in LFD format
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-4-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 92658ad8-8f29-4721-3ae0-08de10329963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW5QY2p6YXF3MFRoM2o0aTlIV29KUWdkMnVNZzE3dUtjdEV4MW9EdFhSaE40?=
 =?utf-8?B?WHcxTnJXSFNyMGx6WTBCbG5naktBdW1uVlVWM200dHZHcFEzcEw4VkkyNHdO?=
 =?utf-8?B?bDY0b1gwWk84cmRzRDVkbExLaEc5cEJBQm9od0EyalIxcHZPcEI3NEFmRDkz?=
 =?utf-8?B?elg5K1psNEZXRGFsWDNQdTltcFpDVEdZMk1RZjhENyttWThLUWw5Y1JVQU1M?=
 =?utf-8?B?ZkpTcjJ2cmNyNHpqcitNRWJiTmNuQjdkbFZPRnhySEYvNXZYV2Zvc0hqWjN4?=
 =?utf-8?B?VW1CRjV2UWkrbllPa1lvZHNJcVdGaUtZQ3BzSFQ1UDFnZVZWQnZPSDVaayt4?=
 =?utf-8?B?dFBaR3BUMEZva3ZBRDd4N2RqY1BhbnlGWjBidHdiM3dDWStGNi9Id0gyNklS?=
 =?utf-8?B?NGxLSWRTWWxBaVc4TThFS0xOY3NsNUdRekVDWXdQRXpmcm9mVnZwT2hlalVj?=
 =?utf-8?B?eWlwR3JGYlp4UUowUzFldGl1NHJRM3ZYUGpwUTZlU1BmZmNPRzlOUUN5V3hB?=
 =?utf-8?B?VVdWMG5mcEZZZ0VCSVBzb0pEcnV0NlpMQitGWmYvWkFJSXJGbjNNd3JJNFR0?=
 =?utf-8?B?WWFkU2t3eVM1Y3FQTUlqV0FHbE8vYkNLRHNadzBzQkNBZDZTcEF2R2RxVDgy?=
 =?utf-8?B?MzQwbkZVK2wwSDVnMkFyR2xFTUZyOVVzTXJaK1NQekFkTXFFZmswZTI2djhM?=
 =?utf-8?B?cU8weU9ZN3U5VUtEQ1UzTTBUcDhPNnlvYUpDZmFmaW9EQWxKUHRuVy9WZExL?=
 =?utf-8?B?SzJBcHlFUWxkT2NKdE9EWGxCOEdRYWRSVThaaG8zRlZ3YTJFYi9XRXFJYlFr?=
 =?utf-8?B?V3B1L0N6a2N4MHM3R1VqS200c0ZtbExTa0hYMEQ4N2NacHJqdk4zaE9ERHFZ?=
 =?utf-8?B?cWg2WTBHd0VWbTJTYmtSVmIrNkxMWkFqbGMzbnpDc3FPOGo5TlU0dWZzVEl3?=
 =?utf-8?B?Y0V2N2o4TXJpSGY1U0NvK1V1cW9IS2hDRlRvTWNPOEU4K0VPVmlneXhhbENY?=
 =?utf-8?B?aEk0Rk9haFpoNk15UHNZSnh5M3FyTXNmWVVyb2RPSDlURmp6eStQUHp1Qy9i?=
 =?utf-8?B?RjkzV3hINC9MekVHSVZTSVBtczZ6eUlWMDNCU0Q0RGFaM01zUm4zUTNIUm5W?=
 =?utf-8?B?ZmE4VHVFWEdNZW5STnlqd0MzTVhpYUFrNi9DY1VHVXpvWi9yY08rdkk0L1Z2?=
 =?utf-8?B?aWl0Sk5naXB4eVMzRHpBdE14N3B6UExjdWZLYTRObTlOOW9HcitQNENTYzl3?=
 =?utf-8?B?dm0vZzFyN2wvUnNuR0xxZHN2TEh3dVRXZVBZb3ZxTlJ5aWU3aDRnWkJ2L0k2?=
 =?utf-8?B?L3BhWW9zRml6MXZQVW8zUkk4ZXo1b1ZqNmEvTVJtQ2Zhd0hDZmMrZjRQLzBs?=
 =?utf-8?B?akd2bjFPQzM0V3lrR2sxM0M3cm9xb0ZkQjlvVlZ4ZkxkWk1CRWNGSVR0Vjhl?=
 =?utf-8?B?bGs2TUNkUnIvdXRacDhWeFhBQjdkVTc1UU1jM0hNajVjRGMvc0t5cDFVYXo4?=
 =?utf-8?B?TEhhZTdTQ0RjTXhGZVVjdk5qUk5PMU5yeU1xSlZ0M1lUU1NaUmNwOWtZOXgr?=
 =?utf-8?B?d2YrM1dXZ2RZeHR4MWc5ZzYzOSs0anRaQlZNL040K2JBS3ZDbThaRGZCSHdD?=
 =?utf-8?B?MnpaODhVSlRwcloxdHR3Zk5Ea2ZJYllXU29ReVVSZWsrcWd0cS9ncjJUZzNm?=
 =?utf-8?B?cGdjcHpkV1BsZitEc0VNaHJaY2VpcmdEWDVobjhTWHcvdGJ4ZGUyVmxXSERr?=
 =?utf-8?B?UHdtdWp1ME1ROUFaZTFUOUc5M1BxRDVDeHhLVndSVGVRUXZjTWRKWlYxcW5D?=
 =?utf-8?B?YkZxSEpGUXVxU3NVOGhqNndabFpoNWdNZU1UVU5hWGpDL2FpejF3TURMNXYv?=
 =?utf-8?B?OFFjRExNeFJzL2F4ZGkxY0RwdVNBTHZhRzVYOS8vdDNjUittWEE2R3JrRDlM?=
 =?utf-8?Q?spV3Z3/4hiUH1e2sDiwekUDw7KL6lxBD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpVQ2J1emkrN2tiYW42ZFprRDR3N3k2djFZc2xjNWhVNUxnd3VNSkR6dkR2?=
 =?utf-8?B?STBjMCsybmJZZVR1ZTR2R0NiR0NmWDAxak5BMjFtU3g0YWx5UU5YS09IR1Ux?=
 =?utf-8?B?NHUyVjlqT28wQ2pGQ0JyUjhUeGxJU1paaS9rU1dSMGpvaWV3czc4Z0FFdnhy?=
 =?utf-8?B?dmRSL0drOXpZTnRSRVFUVjV0UWtlUnJlMEpld2EyTXNLTCtoeTA1U0RmMDYz?=
 =?utf-8?B?QWdUZWJjRVQxUko1L2cwTU9CeUNrWHEvZFByVXlFeEpxMTJROXNyZklGU1J0?=
 =?utf-8?B?Ukc0cTk5Q202Q2ppNDdJQnAxaWxvUEJVenVBUng4eGZmRUJieTJ1MGp2aG8w?=
 =?utf-8?B?NWk3NmgySHFSTXg4WEFaeERHcHFJMU4vUGJMYlg5dzRhYzdBU1Azby9XWno3?=
 =?utf-8?B?dmlwRk9IZUlZeE9DajhWQWVYRjFib1JiRmhMbEI1WEVXYXZyZ0NzU2hEbUdv?=
 =?utf-8?B?TURUbmVXWSt6Uzl4THNiejhyZWhBV3c2Qng1VWYzaUswelZsTFdKWnU2T1Ey?=
 =?utf-8?B?aHE4ZVVBT0JSQlp0SnVmc05MT0dHZ296VkxUdVE0VVdERTkxMzVzckRVWjJK?=
 =?utf-8?B?eXZMa2ZSelV5Q2UvY2VpZWQ1YUJ3QVVYdGFKNFNDQUtoYmJWU1BVbzJiamRN?=
 =?utf-8?B?bmV5WkZzSzFsWk1aWWpFSmhxUGljTE1ncmdRNnp1MkxyNW9hMFFTMkI3QWpl?=
 =?utf-8?B?aUEzWDUySzlKbm9qUk1QQm4wKzZzZk9HZjkzbm9NcUJDY3RTMU1jUlRyNi96?=
 =?utf-8?B?R1NMdDVZTlN6eTYrbGx4dElzbStWZU5QZEFnVmRGSVZva243bzRSdDFzb0ZI?=
 =?utf-8?B?STg3bUplSkpOMy9IT1V4WlVlM2VKRmEvbzNWS1NwUFRFTURkalJuaHFJT2s4?=
 =?utf-8?B?OUUvRlZrWUxMZ25lanhNVzlMeUpCVGtsaUplbkt6d1hvZzczalRDYlR6WUNC?=
 =?utf-8?B?R0lnWmJ2dW9FUG5objdhZ3NQVkpqaEVLWmlXTis3ekJNNTM1bVlhQWZ0V01R?=
 =?utf-8?B?SlhhdmhFUUtYQmV0R3V1bmRTaVphME9JL01nS05wSlFiRThxVXd2N2dQZ0xM?=
 =?utf-8?B?VWxPclpDcjZTY0t3TXJYZEo1UjFXdWtVMU13VUVDa01pb1ZXUGNyNDBPbWJ2?=
 =?utf-8?B?c0RZQWZhbU5YUzJZeWFrWE8xc1dkSFBOMzc2WkFxc0V6KzZpc21US3NmUWVt?=
 =?utf-8?B?ejBGNnBhOGZoaTY3OHN1RWJONXBrM21pTVFyODVraXRUQ2pkS0txZHBNcDQw?=
 =?utf-8?B?Q0t2VS9qUjN0dkJHL1BXUmlXL0d4RU5NNWsraWkzTU5zcnpuVjQzazMyaUo1?=
 =?utf-8?B?Nys3UHRpRmRYcEJpRjdSbWgwTFg5d3hrMXAyN2dkb3p6YVNJalg5RGtTblNz?=
 =?utf-8?B?R1QxV2pjditNeXFQN1c2R2pIaEtVdnJ5WG1DNi82bmE1L1R6SjVHcU1Lc2lr?=
 =?utf-8?B?UWhIZlJuMUdvTXhxMHRZckRHbEFOa2ZOTTY3aEI3dHJXdDFYTjNEUWRHYWRL?=
 =?utf-8?B?YkVkWmg2UVFXdHNNN2FiWGwzbFBCZjJuVzhtYnRhVlpjKzBxeVUyaXk4TWN2?=
 =?utf-8?B?K29jQ1dva3g5OUhtQnNLVUhHSGhyTHBrb09rNEpQWng0aFpKaDZZMXNkRnZD?=
 =?utf-8?B?VG5pbmNockN4V3o3R3RJZlo3MWdZRFVDQVJXTUVTZnFxMGRtN0x1V0lrQzlR?=
 =?utf-8?B?Rkt4UXhRMWhySVc5M1JyQlU5Uk5ncmNKRHQ4bCtoSU5aa2NJZVp2a0VvSmxJ?=
 =?utf-8?B?SkZzRDBDUXVib2dMSlNaMXNkdmU4ampjbWF1aEs0c1YwL1YvenFGZG1jMUFQ?=
 =?utf-8?B?TjkxMWh2R0ZUR01reHVHVmFvZWdsY2x0d0JwczMwaWJ3TW5PeEtkVzJRUUNC?=
 =?utf-8?B?WkhXQnVWalB1V3ViZ3A2RHIzTWhHcGZmRU1EK2ZtMzlKMmMyMU9UQWRHd2cv?=
 =?utf-8?B?TDBBeVYrdDN3aEFLSTRzVVhoRGNaUVlnSUdjdWdrSCs0cVJwMFcySUFIeWFQ?=
 =?utf-8?B?RlMvaEd2UUFybjY5c0pNdU1Cd3kyRGMwTi9aRGN5bFQ1djVOSE1hQ0VlZEMx?=
 =?utf-8?B?VHhlc2RzY1g4TFdmMENVWW1HWTBDS241SC9OWHlJbVFvSzM5THhpV2F2WTUr?=
 =?utf-8?B?M0xCaER1bmVzTVh1WTN5OGVmQ0N6cnZkQ2dicVdkRG1rbzVTdVd5S3VLQnE0?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92658ad8-8f29-4721-3ae0-08de10329963
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:44:24.2830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUjwaR8JVbrXSaG4KgVfLMhMdFfPFWJzKn/8QlGeDfgeF9KNeYRPra53Z5O7xxrYCWSdAQotZDwueUFgAQ1eSY0eu2Pd+iMTs+grptrLe+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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

> +/* Magic keys define */
> +#define GUC_LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
> +#define GUC_LFD_LOG_BUFFER_MARKER_2		0xDEADFEED
> +#define GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2	0x8086DEAD
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
> +#define GUC_LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
> +#define GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> +#define GUC_LFD_DATA_HEADER_MAGIC		0x8086
Possibly fix alignment

> +/* LFD supported LIC type range */
> +#define GUC_LIC_TYPE_FIRST			GUC_LIC_TYPE_GUC_SW_VERSION
> +#define GUC_LIC_TYPE_LAST			GUC_LIC_TYPE_BUILD_PLATFORM_ID
> +#define GUC_LFD_TYPE_FW_RANGE_FIRST		GUC_LFD_TYPE_FW_VERSION
> +#define GUC_LFD_TYPE_FW_RANGE_LAST		GUC_LFD_TYPE_BUILD_PLATFORM_ID
Does it make sense to define these near the relevant enums?

> +
> +void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> +void
> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
Should this just be declared static?

