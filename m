Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A799C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D910E519;
	Mon,  7 Sep 2026 13:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flD46C0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A010510E519
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788786845; x=1820322845;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nXx6h+yS5S5RFDtmeni3/rRc4d0VdiIf0MIpxKmvXro=;
 b=flD46C0oYVO8DVLUYQerTHEr8+0C0JeR8HmO+WPd+B2RDWz0TOgsU+WQ
 l6CewpdlWjN2i3AzLr5RlIy8nS0XF1U7/t5Asy5SBEONIPyC3/9KPllW7
 tHjx11yprkZiFi04yFeN3w1+2quwwqJmJvj/TDKo9Y4R9v6V5XbRpPego
 zyy26xcs1zCG7MgrfGccq8siw0Wd7g6er6M39QMFmsOmJRe+dV7ltULDv
 GolfdFhYtwQV/cGwnkPouBx4tt7knlAQW89+J3LTTYADdYIfiCrEu/ZQ5
 MeSa2vQlYNjwi9LtG0jGS4ZtM4ht74ADQaMclgewRJ3FebPViuXYX6rXG w==;
X-CSE-ConnectionGUID: 6qLLtpP+T+SEXO5Se1xFlw==
X-CSE-MsgGUID: 04eZ5IK6RXWpK9/CmvsHUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89222352"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89222352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:14:05 -0700
X-CSE-ConnectionGUID: OItAlrN5SZqG4BjVnBgE/g==
X-CSE-MsgGUID: s6xjPFZ1SKmIPxCVlPenaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268134434"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:14:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:14:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 06:14:04 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1650DuFIN2ZDBo2oNvjCspQsBe1WdbdpTlP+1x09B40jaQUA2OnV96Z68SAqcv2b9XXMpjNQUz6JIuCPKmwfjhXqWir8qXRp8fExD3TfTE7d2wA/ZEWEZmwLWfDyDor3KfUIGvt85gwRVJUWAnYlSMLEwpuJq4QMgHjbkKE9AJNf3I64m3fewJ/crIJlYuACZ6UDYn+eF4oIn1/4k+J1rtuVilRkMIUpqrbY7dcyW84ujureNlHDaifzBwAYhuAU757QBALDF1s+oNbbY66AAtGHUgA5sEM4NxeVRvrkoTdfBMH98EwWgeCtugZ1QlFc7GM2Cun962lnFPaPwoXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/BcTtIJ1k8ONPS1PFurU4/HgNNt9r6cA+DFjgZKaeQ=;
 b=E6CooDzSunHnqJKPuVsUCB5y7qRLhStO20zJtT0b3oHKGaq4tIYbn9Pe+j/Uw+QTGY39reBsa+G7yXmPTIL9p5Bj4sX7gpM0OOG6iY4f+6citjbfuPXZqIaFXdM0Hjsq4ff3/QR6RPVEPuJYNtsKU8TfBhRKP4FLhOU0i4DttWvqofMJq0JFMT9B3pb4fahY58aDvHtcFV4yR1k12LPvmsxva9LbqVfxpW/u44IYZFX0khXQG1zkPbFnQnvKGZ3hClFeGKxlZ4FcMYNZhA2Fd113j7qvjvJYOjl/DBza+z94wf+GYVW4gTN9Sy1/HSAmbOqqLBbOwZQCwop1zoNK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:14:02 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 13:14:02 +0000
Message-ID: <0f51a1c9-a8fa-44fb-9733-97ea9e3e5899@intel.com>
Date: Mon, 7 Sep 2026 15:13:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/cper: Add Intel specific CPER structures
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-17-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260906172604.2215987-17-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0070.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:337::8) To DS0PR11MB7530.namprd11.prod.outlook.com
 (2603:10b6:8:146::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 169397f5-0de4-42ec-b319-08df0ce1e228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: JAe1rjxAV9fagE9Af7AzU19sRMaE5ZrZUVqvLlZcWWY5uG2BGtypVQEKz2zPktbjd0F1Tkq4/KsHMsQfFONBI7czHabhDClp3nOtQaT1scciDvqOL/neLhP4dTFscDJO5wdyI3uh+uiptvTmTC6bFPaqYFiXvxv0fRAxDKuJ6aGTETKT7cH7EtEw3t8lMAYeIpawCMybmwfvMmGoI0ZV4HXtF4vUzSNDwP4SJC8+7L3ka7GXvKHVBBIe1LsM3NWOTcTYsG2m8Nd8tTZW962l5LgvukzVd0EePILc2hRTdBBAwc35LsHkeMgoGgnKjqSij6IDIIQr1DplOQ2qzrH36fJS5D1qrl33i29S6RWr1tl4CSxxOcvm5Gt8b+IGp8PpFrnuGA2D2nqkqD7/peidVcXTMG5QqwQdxTh5St2yuG0+nkR90PoJQoJJt3Yxn5UvinAYcHi4DhFlq2f+VTbwmchbnYd1y8xvPgaipfamRE7EVot++tbc8sSB7qoexFEfEdPrB+/36BTWJn5j8psYbLXHSMmts1xkomGzJWepNPKXz+Wu620tP6pmr0k/GQ67naEj8rJtU9GxUv3RyKmpta3wmKcCN1jZKnEIkpG8oP4pFL1VwqexkboqUAoNL1+3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VpUWltNzZGOTZXQ09BOVhOM05GY1UyQ3lncW1XNzhWaGNYbmQ0azA1TW50?=
 =?utf-8?B?YWhTeWhNMkRzQkk2YkcyMmY3VzFvUnB1VE15TFdLQldLS2N3VktVNEFWRlF3?=
 =?utf-8?B?TEFiT3gxWUpTQm1FakQ4VDZab1kwSm9icVZEb3V4cFErUTM0d25UbTRENFdr?=
 =?utf-8?B?SDNGbzhHV080d2IxTU0waThMSE1hZGt6eXRXN05LRVJLeUJoZFQ1cVpwbGty?=
 =?utf-8?B?SVpCWFh4b2FBTUVoNXBLK1lhU0JscEN0Yk8rNVVZNTVzQmM3c0dacEJ3aWdj?=
 =?utf-8?B?YmhKYWZkODFsTmt1ZzByNURySEVyWlVwRWMrbVFIU0EvZnVJZmRsWFJCRzdm?=
 =?utf-8?B?NWdET0V4Ym1iVEtib2FMT01Va21VR2hVbndVTjg2UU5TTkdxcGRoSWZqemhE?=
 =?utf-8?B?c28rOHNqdGpSTTJacXVyRUZvamZ2WXVYbVRUeFdzN1E0UVlmelRWUkZmYUIv?=
 =?utf-8?B?MXEzdUtsNjY3Sy9nbHk0Z1NHRXllV0w4Z2hreWdVSzdsL2FPd2trUjhMSmZv?=
 =?utf-8?B?U21aSkk1K3R6NEJYa3V5VFZHOG8zT2dqS21MMmV4d2Z5bWZhTFNSWS9SOUxK?=
 =?utf-8?B?ZnNIRkU5Q0NqUnlkbi9KT3ByY0hoZ21DVmNUdHJNZWZjRUNJaWVqc0tPazBo?=
 =?utf-8?B?M21oUVhPUi9lRHpIWW4ra3Fqb1U3cGFkVlFXWTF1MlFSMklOSDBERzFGdytV?=
 =?utf-8?B?MnBXc2ZaV1E5MStpRTdMUHVEZ0xVZHkxQVBBQklKQUpuYzBUUVNJeU8vUzhl?=
 =?utf-8?B?alB2OGFWWmsrWUJjbkhyQTZ4QWt6b0JQWUgxejBQbVNnQ1VlM3EvRHY0M0ov?=
 =?utf-8?B?RVJzcWc2ODB2S1pLODRYeGJIWEdWS2lJQVpIV3VNYmllSStDY1JWRzk0R2Nj?=
 =?utf-8?B?K0E1a2l6K1VrNHNkc1poemtLK25Mb2pVdG1lRExSMlVXWS8rZThjclFuRCtx?=
 =?utf-8?B?NVk3TkNVU2ZIbk1PdXhMY1ZjdURnQ3NPZmpHN2V5T3hFT1JvajNsQ0s2ODNn?=
 =?utf-8?B?d3JDQVJUSDhnTU1rUkNzZUpzNVpTWkJsQVIyc2J4ZEZMdXViaHN1VlI4N0Fv?=
 =?utf-8?B?NXduczZ5VmpJVHdSSUlCdWJwVFVPbGZYNndQN1A2NmJoY2pUWEQxbGJsc05E?=
 =?utf-8?B?OHBKSkFEQlkxeU9OSzc5dmNlQTVIcldwL005YlJha0R6UWswdElOeXlrWnFo?=
 =?utf-8?B?a3JwUDdlQ3NmZERJc0Q0NnVBaVR3anNoamdFMDcrTkFiYU1yTEl5QnNvYWxD?=
 =?utf-8?B?RytESGwwTnUxSVp1MnpJdGRVOVdUL0laYW55M2VXdUhFNzJQWFcvZTBPbFVl?=
 =?utf-8?B?bnJWNVlNOFZlazl0aU5GNDNNSi9mSWc5YmxjSHNHdi93RytTdXAvQzd3VjNk?=
 =?utf-8?B?U2JTdDRLNW1ycVVuaStWVFg5RW1TOE5NMHZTMEd4M0crOWhOU0ZyS0FTcksr?=
 =?utf-8?B?NTZuRUdYWkRnVFUrVExjcnN4RG1mMG1Fc2hGYUJSU1lwVXovUk8yZ2czTGNY?=
 =?utf-8?B?ZXF5RFNkMmVIT21nYW41c0FPMytSaFNiY1VaWkFyN3FWam5jaDUzQlJmK09V?=
 =?utf-8?B?dEFUY2RHZUpNRlkzMzJEZGZwTUNQTHl0OXplOHVWeDk3QmNGNHFyUE9zTDhI?=
 =?utf-8?B?UWN6L001QUNVVDdOaGNUaE1tWWJneldaWWwzUmhuLzk4TUJGWmpRcXpRY0J4?=
 =?utf-8?B?NHJzc2xYQVJwZit1VVYzVzFTbGdjVnR3VmRoaEZ3R2tjaGc1Rk1YYjIxbjUw?=
 =?utf-8?B?alhpM0tTNVFyZGE1ck1vd0dsdDhiYmx6MXc0Zm1TN1M2OGhHUGwySmVuTEcr?=
 =?utf-8?B?RnhzYkI1RHBmQ0JGSDNpUXlyUVRyYmV4SnlTVHVMV0oyTWErRUJqSmswZFpY?=
 =?utf-8?B?WnJCQVl2a3dpa3dIdUJVVk9KaUdSSG1iUXBqRHlRNDlLUFBuOHMybEErT3Nu?=
 =?utf-8?B?Zmx4VjcvTmdIaXp1MGxVczY1YjNLZ1R2bGlyQXNsSVRGd01od0llOEdZUVdV?=
 =?utf-8?B?bkRZK3FLbHpJYmVUTWJJbGh4ck5HbXdPZHErZWgwL1l0dFBvRlAzVUdvb05w?=
 =?utf-8?B?MmI0bzNmM2U1RE5URTZ2V2tSWlcyODFUZHVOeWdXSjdha2JVY1dFR2JUNkRh?=
 =?utf-8?B?RnZRdkpNZ1JiSWhqOXp5RHhYdUhZK0o0Y2Z3VzZQKzM1YmxYMmhYUjliSWxi?=
 =?utf-8?B?YnNQVjRPd1Q0ODJDNzVoTVJtYW5sdFg4QXdVdm14QXNVcVJEQmkxMVpWZk1Z?=
 =?utf-8?B?Mkl4RCtGY285TmVYY2E5Z2QzNEgxc3hRbVJuSGUraDA4aXhWdFhkeVZXS0pL?=
 =?utf-8?B?SzllV0VwYTNhdkJQSjFPSmMzZXltSFJ2MHB5TzJ2KzQxa09tckJVLzl3dHY0?=
 =?utf-8?Q?KKTH7fokjzkkNt2Y=3D?=
X-Exchange-RoutingPolicyChecked: cqlCbijKkLNiYUV5WjDOG6W2ZiqnHSAraeW2x4Vh1f6oG/1o13AixOl4kL8+v0qVComXJ3GkFBy45nsrLjxntnmsYo4zxSdTsDXbj4dWCGbRf3g9nq5MQEtOU7IZeu1W1tDXRxRpun/LIt2oUUVTOsUEDuHOtdvPPAG/aUwfzADeetKlKna6LMQwGxkbHnxn2DyOIYPmlu4nMTM/lUedVmvCtUioMs62/te+RYMQo00sHN09BEjz9B54GXtitZJUHg62RLLRdQSeCwHcE/7ToAToHQosHrCh5hOg3nrEwq37sg5duOTbyiFf1uKTgOBbp4fPosmUw4haloKA7ncjyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 169397f5-0de4-42ec-b319-08df0ce1e228
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:14:02.3620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YaVEjeRkxr3LxWvJIXCoRA5U2teSSpwFmlSh+6DojQTtrdbbDlSj47l5FYqqw9dc2lD8Ub8f70O7QPracJ+TlIwm5BVCHl0l94yHHB5HPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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



On 9/6/2026 7:26 PM, Badal Nilawar wrote:
> Define Intel-specific data structures and GUIDs needed to build
> Intel GPU CPER recoreds

typo

> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2: Fixed sashiko warning about bit fields usage
> ---
>  drivers/gpu/drm/xe/xe_cper_types.h | 179 +++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> new file mode 100644
> index 000000000000..b81b70501e0e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_TYPES_H_
> +#define _XE_CPER_TYPES_H_
> +
> +#include <linux/cper.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +/*
> + * Validation bits definition for validation_bits in struct
> + * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
> + * contains valid data
> + */
> +#define XE_CPER_VALID_LOCATION		0x0001
> +#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
> +#define XE_CPER_VALID_SIG_ID		0x0004
> +#define XE_CPER_VALID_PCI_BDF		0x0008
> +#define XE_CPER_VALID_DRV_VERSION	0x0010
> +#define XE_CPER_VALID_FW_ID		0x0020

	BIT(0)
	BIT(1)
	...
or

enum xe_cper_valid_bits {
	XE_CPER_VALID_LOCATION = 0,
	XE_CPER_VALID_FIRST_TIMESTAMP,
	...	

	BIT(XE_CPER_VALID_LOCATION)
	BIT(XE_CPER_VALID_FIRST_TIMESTAMP)
	...

> +
> +/*
> + * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
> + *
> + * All values below are generated deterministically by uuid generator.
> + * Do not hand-edit the byte values.
> + */
> +
> +/* Creator IDs */
> +#define INTEL_CPER_CREATOR_XEKMD \
> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
> +
> +#define INTEL_CPER_CREATOR_AMC \
> +	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
> +		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
> +
> +/* Notification Types */
> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)

only this one will be used for now, right?
maybe introduce other when needed?

> +
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
> +/* Section Types */
> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)

as this seems to be new ABI, shouldn't we define it at least in our abi/ folder?

	drivers/gpu/drm/xe/abi/xe_cper_abi.h

> +
> +#pragma pack(push, 1)
> +
> +/**
> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header

if this is a Intel header, maybe it should start with intel_ prefix?

	intel_cper_section_...
> + *
> + * Fixed-size header for the Intel GPU error section of a CPER record.

if this is GPU section, shouldn't we have gpu_ tag in the struct name?

	intel_cper_section_gpu_error

> + * All multi-byte fields are little-endian; the structure is packed.
> + */
> +struct xe_cper_sec_intel_err_hdr {
> +	/** @error_class: Error classification (type, component, location, cause) */
> +	union {
> +		struct {
> +			/** @error_class.error_type: RAS error severity */
> +			u8  error_type;
> +			/** @error_class.error_component: IP block that raised the error */
> +			u8  error_component;
> +			/** @error_class.tile: Tile number */
> +			u8  tile;
> +			/** @error_class.instance: Instance within the tile */
> +			u32 instance;
> +			/** @error_class.cause: Error cause code */
> +			u32 cause;
> +			/** @error_class.reserved: Reserved, must be zero */
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
> +	u64 first_timestamp;
> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
> +	u32 sig_id;
> +	/** @error_count: Number of times this error has been observed */
> +	u32 error_count;
> +	/** @validation_bits: Raw u16 view of all valid bits */
> +	u16 validation_bits;
> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
> +	char pci_bdf[16];
> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
> +	char drv_version[25];
> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
> +	char fw_id[256];
> +	/** @reserved: Reserved for future use, must be zero */
> +	u8 reserved[5];
> +};
> +
> +/**
> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
> + *
> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
> + * is available. The @event_queue flexible array holds @event_queue_count
> + * packed &xe_intel_priv_event_entry records.
> + */
> +struct xe_cper_sec_intel_error_info {
> +	/** @error_class: Error classification (mirrors the header error_class) */

if it is the same, shouldn't we define dedicated struct for it?
doing a plain copy/paste is error prone

> +	union {
> +		struct {
> +			u8  error_type;
> +			u8  error_component;
> +			u8  tile;
> +			u32 instance;
> +			u32 cause;
> +			u8  reserved;
> +		} error_class;
> +		/** @class: Raw byte view of the error class */
> +		u8 class[12];
> +	};
> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;
> +	/** @event_queue_length: Total byte size of the @event_queue array */
> +	u32 event_queue_length;
> +	/** @event_queue_count: Number of entries in @event_queue */
> +	u32 event_queue_count;
> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
> +	u8 event_queue[];
> +};
> +
> +/**
> + * struct xe_intel_priv_event_entry - Single error event in the event queue

no cper_ in the name?

> + *
> + * Each entry is variable-length; @entry_length gives the byte size of
> + * @metadata only (not including @entry_length or @timestamp).
> + */
> +struct xe_intel_priv_event_entry {
> +	/** @entry_length: Byte length of the @metadata payload */
> +	u32 entry_length;
> +	/** @timestamp: Hardware timestamp of this event */
> +	u64 timestamp;
> +	/** @metadata: Event-specific payload bytes */
> +	u8  metadata[];
> +};
> +
> +/**
> + * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
> + *
> + * Contains the standard CPER record header, section descriptor, and the
> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
> + * (with its flexible @event_queue array) is appended dynamically.
> + */
> +struct xe_cper_nonstd_record {
> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
> +	struct cper_record_header record_hdr;
> +	/** @section_desc: CPER section descriptor */
> +	struct cper_section_descriptor section_desc;
> +	/** @intel_hdr: Intel-specific error section header */
> +	struct xe_cper_sec_intel_err_hdr intel_hdr;
> +};

hmm, this one looks like our helper struct, not a real ABI

[1] https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#format


> +
> +#pragma pack(pop)
> +
> +/**
> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
> + *
> + * Used to resolve the platform_id field in a CPER section descriptor.
> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
> + * with name string "platform/8086:<dev_id_hex_lower>".
> + */
> +struct xe_platform_id_entry {
> +	/** @device_id: PCI device ID */
> +	u16       device_id;
> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
> +	guid_t    platform_id;
> +};
> +
> +#endif

