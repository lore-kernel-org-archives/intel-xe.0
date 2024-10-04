Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7191ACFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 07:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD8710E8F0;
	Fri,  4 Oct 2024 07:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7qeSRfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5D210E8F0
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728027620; x=1759563620;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g1eDHzP1tdMG9jJHVq3pWAXp4QAnxcDMVhVXsuegI9w=;
 b=k7qeSRfkQVzsvfsZ+uY903AoGjHxaDJN56JP3LT+J0xRXfFP+aA76EWI
 rtx702aXDnZVnb38QANyYABTJUFu9eUZ9tCh0/dP7Z3/qxe0W/8YsEtDP
 12JWycjJJGLde/tfEF/3aTXI71CsxD+K2RgFrKIOo8uYXw8GxjvZDl6B0
 mpmxWbd679QEtUGY+2WL/4XudLCXiYAfoCEFAWw8sWywDjUlEQopMRIAH
 BRyvr9bIxpw+4qAQTHc/KmPJl8+fnrowOLofzJoABfCAogB7m5igYxxlC
 33vWxOWsC3ZT+whR/qqUrzwxoEqQvVpj0yctTA1ArURHbyUuucjBfxnaM Q==;
X-CSE-ConnectionGUID: ftkxPPXUS4iZnnKw8BLp5Q==
X-CSE-MsgGUID: bHROViHnSAiBvqrShC2L0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49773664"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="49773664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:40:19 -0700
X-CSE-ConnectionGUID: sx1e8QGsRtWsaNclcCnROw==
X-CSE-MsgGUID: DqSznx5RRMCuqlBEOxUPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="105368686"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 00:40:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 00:40:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 00:40:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 00:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk6hVpnbXY13G0MgJTRUeSw+KFprfq5z+272jtwVmQVMn4v42NM4cetQz8uapvyR3wcPYcpAeUxl2BJwBTHVVfCvgfWCoxS0y15G1/zRi3nu7aXRLQTtR/CMq951l6ksCs5/gilFhl/mxpskgZRp5oqLNoHgTnDMdSw7e9BPWBJmK+AFVQXzjIGYyQJX3DlT9s+lSlbWpLFlR652d80kEQjC+xzDcylgn6T5cGnfBRH0n2sXpxxu+iA1EasR4vci5cPzMkWtNii4qsk8IbJ6/fSJNvS0gKOJ+zcNxMh5jB7kDTnMjXzSwHqLNm8yUw+fW/1eiRxbC+PLMZJuoN6qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nACFXZh0i0rm7G5a3+5yS2RCF+tibJcs1Fx+tzgcBe4=;
 b=Tt+VPa60+BHqglmRYy6Um+5F8MapQGoJNabLucNagiQfhRSYrQqmAcKE80nHm8fhO6Wj/a1iJHgKykPZJTv2sn+xAqxfubSQ1wXMsEzAv7guDuTduOOlHrTDqbAIH+b6il87szP9hYKLIFIA53luWH2n+NZtsQOhRAqchl/Jj70xN8JbpO8wPHBtleD6JSiwnbzd9x6hDllj4WkgI0ovFLjTaIzVo/z4g4HLpoq14EhOKhrRefPxfugC29dculkeurbfmr82+d3tLA+Yr9Au9ZNg0cOdsE7jrStLYGWtVLvjJZLOOQBsGmhUNSqCZUDXY0MihljQ1IObTYYUILXAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 07:40:09 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 07:40:08 +0000
Message-ID: <c6094193-0059-44eb-bab7-73d139a0b4a7@intel.com>
Date: Fri, 4 Oct 2024 13:10:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/25] drm/xe: Error handling in xe_force_wake_get()
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
 <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
 <232163cc-1978-45b7-a920-2890a014cb95@intel.com>
 <fd421437-87da-4b9e-b6e4-523723898965@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <fd421437-87da-4b9e-b6e4-523723898965@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ba1d4b-f66f-4f6b-afb7-08dce447c501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qks0bGh1K01PenBtSEFSQ1N0eHkyY1h5M1VJQndNY1pyYUZQeUhnUnk2b3Fv?=
 =?utf-8?B?RW9UY2JoSVVlOWpONi9YSWVYY3ZuWVJzRmdweDBMbnFaaVd2Uk5vUTAraWhY?=
 =?utf-8?B?Z0xRcUpyMTA3QzNMeVdTcmxqTzRneDFaUU5QaXlNRlUzLzJlTmlXcVdpd3Jz?=
 =?utf-8?B?MktWNzR2K0tSbUFTeTFkSjFWVnhuUm5FYkl3UmpaN3ZNS25sbVhpWlhBM1NL?=
 =?utf-8?B?SnNBMlBEMFg0TW5BWU5odnJMdmNhQUdiMjdDajQ0SXkwUXZ0aFV5YjhtNEJ2?=
 =?utf-8?B?UWVGcXdmVnBiaUorcEpjY3RxQUJ2YzZVRHI1ODBsRHpmT1U1ZjFyNHpRS1pH?=
 =?utf-8?B?dDN3bFlJS0NmOWJneGtTV1ZTQmQ0L1lTUW9BWVJXc1A1TWJRVzcxZ3MvNktw?=
 =?utf-8?B?L1k4cmFHUy8vWXFkamtuYklicnFaUThJK2dQNXpLVzZFY2dIclhBeDcrZXE0?=
 =?utf-8?B?aUNEck1SNStHd3RvN1F6WUVxQmJlUlhEWC9iZm5xdU1rN1RFQzk0eVg5Zzlo?=
 =?utf-8?B?bE9hWDZsUlBwS2VYaitsTm12Vy9LTHRFaXczbVd4MDUzZUU5V2JsZHJ5TU02?=
 =?utf-8?B?cXIxYktDbmpTSFRsTkRXZVFMNGMvNGI0TUIzTm0rZmlvbGVSV1l6bTIxMEJQ?=
 =?utf-8?B?NnE4UkZBbTNtMVViL0o4MXd4V0dFcmRKdkpiUUQ4cExXQlh5OG5ZKytXVjQ0?=
 =?utf-8?B?cWxVbGtXT2V5c29oeVVUbWIrVUtJUHoyWFBJSnZabkhweWhNRWQzUlRhM21q?=
 =?utf-8?B?b0FuT1RvaUcyTHpUblBHVnRWcHpGV3NyZFBtbWtrUXhlNDUyN2UxbTd3MC9L?=
 =?utf-8?B?Z3FjUWxsTnZGQ25RRFJLMnVDdExVejdOckVzbWtzSlk4d1U4SC9qcFVDOVRM?=
 =?utf-8?B?eXJ0VGVmZTNyQ2pDbDRXZ0UrZ2xlU3JIaFNUeWtWR1EvQkoxNndpSTJtNGV6?=
 =?utf-8?B?emxiejBrUnJwdUhycC94RkdYRXVlRkVxVzRXN0VnWERZZU11NS9ESkUwWi9x?=
 =?utf-8?B?T0VyWEMxb0hvOEt5WjNQc1FpWXozdzZhT0puMlIwdGt0Y3YyaUJrbEFlNXNl?=
 =?utf-8?B?SHdHRXR0Yk5LV3pBNzhyb0ZxWVdzYUpKWWg1VEdkcDZLUWtRYkhXbjNvVXFV?=
 =?utf-8?B?Nk9QQWdaM3o2MlZjSkkvd2k5czBpVWpQZmpsUURKd1k1VForSlpteExtcDhW?=
 =?utf-8?B?TkRNb1Y0OGUreC9aNyswK0p5dzBSUkVrTnBCeEpUMm0xTGExWnVVYnYwZHpC?=
 =?utf-8?B?ZlZ3TzZZWTVGNlVtZFFaOGtKaVduTGR1UStqellCMUZNekpTK1NubXlMOEdh?=
 =?utf-8?B?OXJvOEJnU1VhM0p2QWJQclJhckYyOE5ZaDR2RmhzSmFpUDFxV3VmWXVkdkli?=
 =?utf-8?B?QnlpTG5TWDBGTWZ4VXoxRjlFcVJnNHJobXQ1Rm1RazVwZnBCTm5zbk1hNzZZ?=
 =?utf-8?B?N2NFMDZkckZiSG1JcFd5cm11VktyRWdGT1VSTjRaYlNhaDZ4WnBFb29XK0JI?=
 =?utf-8?B?Ukc5WUNMVzJmQ0E1RUxtQUM2MU84ak9hbFJRd1JjNnRwWWlhVEN0c1IvNWxM?=
 =?utf-8?B?QXEvelI3dWIwTHhxQnJWSTBOK3FWQm15N21XcTQrRmFtTk02Z1pJOGdXVlov?=
 =?utf-8?B?M0FPZHJHR21uTFVIZWlPQnEwS011SlIwYlVUVGVJZ01icnVkU3RDcVRRVUk1?=
 =?utf-8?B?bVlrTytGV0pHWVFEMkJzYkFwTXNDQm1oWW5xZHFXNXBZaUdlT3FJRVp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0RJbVc1dWpsU09ka0ZHYWZHQTBhNVhnT0NzbGcyRFZvdmxWZHJGZ2pzcE1j?=
 =?utf-8?B?T2JXL2dMZnA5dGtYRmN3ZHZZb2JoUUtnUXJ5S1V0b1J4OHJVUlFBU3ZVUi9J?=
 =?utf-8?B?WU9pNmNKREY2bHVDL1h0WGs3cnNlUlRKYWFxM3Nodklybko3YVFzMzVySkFv?=
 =?utf-8?B?dlRXL28rcmsrTzRmamhtK0sxYXhhc0lWcUs5RERjcmRmVmlMWTlaM3V3V29Q?=
 =?utf-8?B?NTB2cFRBNG5jQXhEeVlOKzkzZ0VEVlpmeVRsd2xybXZpKzc3b1ZsWDlZUHNy?=
 =?utf-8?B?akNudk56dldGYTg0d3hnN2ZIcHoxb1JDNHBXZGtqZWdLcnB6UDhtWTlUWkEr?=
 =?utf-8?B?Z1I0Um5heU03bUg0SmlFSlhiN0JHVUFTVEpVU3NlMlJLSWJJUHpYZ3RLRk51?=
 =?utf-8?B?aFU0TUNubG5SZ2dlVnNPRk9ORTVTRmgrZlBLQis4R2I2cFlycG84eXhaMUJH?=
 =?utf-8?B?WXozUEpFWEdZRmVON2dWdXFHTUpYV205LzlPL1ZEU2wwZDcwbFdOZktPQUlr?=
 =?utf-8?B?cDN5TFRvVG14ZVlIOVVNN0FSbm5lbFRWYzhjcVhtbElMRlFZMm9RVENHRDVz?=
 =?utf-8?B?cnZvMS9TVWtwSENQV0d2TVhpMVhsUERKT2JVNWxMTms1VjJLd25ISk1ZSVhI?=
 =?utf-8?B?cDMyODhsV1JtOEZQdUVHczZ1RTA0OWFZTDZXUXFCOXVzbGJmSEtjbnk2UDFR?=
 =?utf-8?B?ZlJ6USs3a0hUSFFDVFU0bUZqZ00wTmdkaUlRTDBXS2VNUmY4Vm9TNE40NHVV?=
 =?utf-8?B?RnVEc3kweDBCeVBNb1l1R3RHVEs0QzQ0YlVsZWNGVkZWM3pYRnlwbm0xbmVy?=
 =?utf-8?B?TXU3YXkvVEZoNk9hSjB0WFpSWU80MGZSa1NyM0pUZ21QaHo2REZUekJVb0l1?=
 =?utf-8?B?QXVERUNVOEx4cjJwSjJBejVNK0tkWVgrekppVllCMEt2c0doM2lrYkw3ZUd3?=
 =?utf-8?B?L2x5Q3h1MGdMNWtVb0FRVW5QdVZHQVVER0xBZitBbWhHbysweTZVY281b3di?=
 =?utf-8?B?c2tibHEyYjdGSUZ4RGNyMmdtekFrK2ZXYjBNK0RockFqZmpWc3pPL3l6TnN3?=
 =?utf-8?B?cThkdUxLaGNoRWRwaWhLRThkSUU2akdWRHp2N2ZEOGpua1JVZmF1RFNhSnRw?=
 =?utf-8?B?dFc5RWcxUEsxZUY2RGlzczhyb0o5azJKUFFjRmhkVzdtaXBwOHZmakhvL0N5?=
 =?utf-8?B?LzFtelljbE4xdVFGeFZ4REkveEdnTXZmZVVaWlAvVGY5cm9XZ2pMS3Flb0k5?=
 =?utf-8?B?aTNXY0Z6dWlvRGsvWEZNYWRZVjBYeklWNlpzN0JuQk9uNjR5U0EyWkQ0SG9h?=
 =?utf-8?B?SHhUOWZQVkNxM1ZIdXpqVm50Smh3d2kvQTlacURsdEd1d0dhRW15TGtUdFBq?=
 =?utf-8?B?Zk1qaDFESHBVeWdtNHFJU1BUT0dXdE14akFEYUVqeGt3b04vTHZYTzJTanlK?=
 =?utf-8?B?UVlzM204YnZuclExVmVSOUs3eWVkSnNOc1NyOFpseXFGWGxDUDlzT0lLMXhV?=
 =?utf-8?B?UTF5NjBqZWRrUGMyL1ZJUkNuK01jSU5VYTNqdjdFWFVNai9vbGV0RmJGTWpo?=
 =?utf-8?B?WkhCamk4SURhaWRuckRZaktyNFZYN2Z1TjVveTd3UXFZenhNQ0xZZ3BKc0Rh?=
 =?utf-8?B?bFg2MVp1eitmandLZjhVa2YxMk1PZDZ5RmRhZlp3Y1c2alNndzVHVDVCTFo2?=
 =?utf-8?B?bm9mbVRqTFprRGsvSjZyVnpXd1dCYldEVkJsdHVIQkJHTTRicUxZSXUrQ2pZ?=
 =?utf-8?B?Z0FrS09yQ1pUT3RaY1VKSS9BRFpTZXJOa2d5U1ZiR2hmZlFsYytzTFZjamdU?=
 =?utf-8?B?VTFlTS9NUnhmKy9jK2M2YXk4ZjlDMjV1elhka05XN1pUeGN1Z1lRaFkvMUZR?=
 =?utf-8?B?ZUQ1L1dEeWt2RWJGaVJTRytFY0pGNW4rcWxKa0hzMzRUYldxTnU2LzZISmwv?=
 =?utf-8?B?MUJnQ2tCUXc2SDJjUTR6TW9YMnlSYXJFRTZ2aE5BOE5ueWxwZEVaQlZjdW9j?=
 =?utf-8?B?YUN6WXhRSnFPZlczRGhQZGM3SFY1YVI4UE5yZE5DbDJGaEFtN1VZaDgzbHdV?=
 =?utf-8?B?T0VzK2xveEhCa3BMdHh2VGdGcGYvNkZNWEh4SnI5eUN1ekdiVTBqNFgrbjVJ?=
 =?utf-8?B?SXZIaURIVW1FbXRqZHBrcFJUTHNQTjl0Ym9uQ29ud2Nobnd5SE1mQTF4K3ho?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ba1d4b-f66f-4f6b-afb7-08dce447c501
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 07:40:08.1892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d8BKvLI/RqMp8+XU6prRContZpBe1g45S0OJA22dqEeWUAdop15xbpn9mQCxxBMW8Hn1fLeAR1m4pTE4LZgxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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



On 03-10-2024 21:40, Ghimiray, Himal Prasad wrote:
> 
> 
> On 03-10-2024 17:53, Nilawar, Badal wrote:
>>
>>
>> On 30-09-2024 11:01, Himal Prasad Ghimiray wrote:
>>> If an acknowledgment timeout occurs for a forcewake domain awake
>>> request, do not increment the reference count for the domain. This
>>> ensures that subsequent _get calls do not incorrectly assume the domain
>>> is awake. The return value is a mask of domains that got refcounted,
>>> and these domains need to be provided for subsequent xe_force_wake_put
>>> call.
>>>
>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>
>>> v3
>>> - Use explicit type for mask (Michal/Badal)
>>> - Improve kernel-doc (Michal)
>>> - Use unsigned int instead of abusing enum (Michal)
>>>
>>> v5
>>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>>
>>> v6
>>> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
>>> actually refcounted domains in return. (Michal)
>>> - Modify commit message and warn message (Badal)
>>> - Remove unnecessary information in kernel-doc (Michal)
>>>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_force_wake.c       | 45 ++++++++++++++++++------
>>>   drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
>>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>>>   3 files changed, 38 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/ 
>>> xe_force_wake.c
>>> index 5ce9e912818a..7f358e42c5d4 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>> @@ -160,29 +160,54 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>                        (ffs(tmp__) - 1))) && \
>>>                        domain__->reg_ctl.addr)
>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>> -              enum xe_force_wake_domains domains)
>>> +/**
>>> + * xe_force_wake_get() : Increase the domain refcount
>>> + * @fw: struct xe_force_wake
>>> + * @domains: forcewake domains to get refcount on
>>> + *
>>> + * This function takes references for the input @domains and wakes 
>>> them if
>>> + * they are asleep.If requested domain is ALL then only
>>> + * applicable/initialized domains will be considered for refcount 
>>> and it is
>>> + * a caller responsibilty to check returned ref if it includes any 
>>> specific
>>> + * domain by using xe_force_wake_ref_has_domain() function. caller 
>>> must call
>>> + * xe_force_wake_put() function to decrease incremented refcounts.
>>> + *
>>> + * Return: opaque reference to woken domains or zero if none of 
>>> requested
>>> + * domains were awake.
>>> + */
>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>> +                   enum xe_force_wake_domains domains)
>>>   {
>>>       struct xe_gt *gt = fw->gt;
>>>       struct xe_force_wake_domain *domain;
>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>> +    unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
>>> +    unsigned int tmp, ref_rqst;
>>>       unsigned long flags;
>>> -    int ret = 0;
>>
>> As we have fw->initialized_domains lets add check if valid domain is 
>> being passed and assert otherwise.
> 
> Sounds good check to have. Will add it.
> 
> 
>>
>> Regards,
>> Badal
>>
>>> +    ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw- 
>>> >initialized_domains : domains;
>>>       spin_lock_irqsave(&fw->lock, flags);
>>> -    for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>> +    for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>>           if (!domain->ref++) {
>>> -            woken |= BIT(domain->id);
>>> +            awake_rqst |= BIT(domain->id);
>>>               domain_wake(gt, domain);
>>>           }
>>> +        ref_incr |= BIT(domain->id);
>>>       }
>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>> -        ret |= domain_wake_wait(gt, domain);
>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>> +            fw->awake_domains |= BIT(domain->id);
>>> +        } else {
>>> +            awake_failed |= BIT(domain->id);
>>> +            --domain->ref;
>>> +        }
>>>       }
>>> -    fw->awake_domains |= woken;
>>> +    ref_incr &= ~awake_failed;
>>>       spin_unlock_irqrestore(&fw->lock, flags);
>>> -    return ret;
>>> +    xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to 
>>> acknowledge awake request\n",
>>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>>> +
>>> +    return (ref_incr == fw->initialized_domains) ? ref_incr | 
>>> XE_FORCEWAKE_ALL : ref_incr;

How about we simply return ref_incr at this point? Then, in patch 2, 
given that we have a helper function available, we can validate ref_incr 
against fw->initialized_domains, particularly for XE_FORCEWAKE_ALL, 
within that helper function.

Regards,
Badal

>>>   }
>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/ 
>>> xe_force_wake.h
>>> index de720881a300..eb638128952d 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>>                  struct xe_force_wake *fw);
>>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>>                   struct xe_force_wake *fw);
>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>> -              enum xe_force_wake_domains domains);
>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>> +                   enum xe_force_wake_domains domains);
>>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>>                 enum xe_force_wake_domains domains);
>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/ 
>>> drm/xe/xe_force_wake_types.h
>>> index fde17dc3d01e..899fbbcb3ea9 100644
>>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>>>       XE_FW_MEDIA_VEBOX2    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>>>       XE_FW_MEDIA_VEBOX3    = BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>>>       XE_FW_GSC        = BIT(XE_FW_DOMAIN_ID_GSC),
>>> -    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT) - 1
>>> +    XE_FORCEWAKE_ALL    = BIT(XE_FW_DOMAIN_ID_COUNT)
>>>   };
>>>   /**
>>
> 

