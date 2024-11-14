Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB2D6A230
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 21:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7B10E382;
	Thu, 14 Nov 2024 21:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfNDQ+DD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91410E06C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 21:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731620402; x=1763156402;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PdkyQZN19vF0VrvTGvlAJOO1ANWUPxD7XGsDRy3GO6A=;
 b=NfNDQ+DD+J+64TLg8JDpzbKkAHXS7RM3tVzAJO9WDmRjbQFJU1EVN/Fo
 jJkGwSIRnmEHKqWC0ayKsKk85Pw/gl3HHxzJCa9a2pTvMHLyTI14dZsuH
 FlmcFd3TxxWpP8/oCmek1Ka2KMeKYCJaBcdeVkq4mSriis7K7SiWScYpE
 tRnkrtqHMex4IdkI0fgY2jFRXiugWXgf9/CAxij2Q1ohqY4SEFfyhuNGK
 aWHJgHWl6HC0D9ROA5WQ0LRDyYitN6ZIWxcUQPtEoSlq4uUPuSkhsrgwY
 d75w19URhy/SwY/MPdmI5nvxY3DxeYl57EdkB3+RW0gLtqkUQMVuzJzJM Q==;
X-CSE-ConnectionGUID: 9hf07myOQ0anGT3dnsYjrg==
X-CSE-MsgGUID: +XjDtU0gSlilzFuE7vyJgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31502684"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31502684"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 13:40:01 -0800
X-CSE-ConnectionGUID: ldxlyaQYT7qn3rT76299PA==
X-CSE-MsgGUID: SV1bwnUqQMWF7Jl/0J+abg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119266339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 13:40:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 13:40:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 13:40:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 13:40:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBvecHWy/AJMNLrwgsvZBEdAcpy3zz/cJMqkekae3T+41haG3MrTAqpFQqhVNEizPSt/vEx3RJWOtGQkMS7FUkkWZ7AbEUOWanPhFlbayXg3Lqlte8P4hLP9ul6Wy4ZYuMCr/1DCZDK1JOf4Cb5EsU+kTi+o66H+wHkxmQNxJogv1At9erWCk/LjlHemhoseVYOqEwgsp7UD92gItsLJDRrnW5ctw0g+8fbYezdUCSubsfECprCQUvpie/dzo3LaWL70v1sKc+y3AAuXgOAEEf96dyPLX7tj4M/hIX6skdDoz8XbZJ41zSDMaj9bHD0EpgW6UxbyxyD0QdjA0Tzlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCobpQSz27Uf0ZT89I2GS2F/EVRBNk7q3UUmjiDSwnI=;
 b=vl0xzVZcAdWVsw14L2xwhmBa8WsezK31myuTl4+AQXSQkTrEXaLl8rOTaml2rZkM6HY87pZLDDTqfuGZadpbs1x9gpcqNedzsJGdeY2Fy2eWFjovDVauRU0YVSCAY1UEbOlRzVXP6YFZRwHQM+2rVtv9sL0xcRFUm0VQmKAKOJhS/elMqdYNMydQ6TWGQmfC7FmV8ch6gHiIASE+MWebrrFqG/qyjt5Jr6zhgELB6oUHIc9un9ZUwKx6KSm7YWNiMgP89fpdstLYD3Z6BSpHYNDMulK7RsF311Qh9bEv0zzwnaaq4g9mH/4iQq8u8eNF+EvQo2P1g4Ak3wFcI4tIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 21:39:57 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 21:39:57 +0000
Message-ID: <761cacef-18c5-490f-a790-fb3b5d439db1@intel.com>
Date: Thu, 14 Nov 2024 13:39:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/xe/pxp: Add spport for PXP-using queues
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
 <63591af8-7d95-44b2-b3c0-3890b850d80b@intel.com>
 <0f0b7b2f-b8c2-457d-bfba-c4311efd2c50@intel.com>
 <189089b3-561f-4639-9718-e96c098ee96e@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <189089b3-561f-4639-9718-e96c098ee96e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 9885deac-e56a-4f0d-e370-08dd04f4e212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clVVVXQvZ0xISnV1VVY4ekVOWEdPQUJDczZHQ2RVRkNYSWloVC96bFpNZUdB?=
 =?utf-8?B?SHlldXpSWjZEM1RVc3JhelY1UWZaSk5HL0c2a1ZiallWK251U3ZiUW1ndlNL?=
 =?utf-8?B?MU42V21KVExLdFNoM1BsQWcyV3VsU2RpS3BLcEdhR1VoNUM1dm1xZHFBeUhN?=
 =?utf-8?B?RC9jY0xvNmg2TGdYOHl2WHZBVXdhVVRoZXlKUWxNVEpHRTZCcTVvMTQxb1Vq?=
 =?utf-8?B?eXQ1MFpIV2lMOWdNUkNMOFFYVzgyVDRGVzNZb0tiTUJTRW1kZ2VLZDdDN2N1?=
 =?utf-8?B?eW5GMi9scWVJVkwxZnl4c3IyVkxNcWtmeW1oc0Z1Yld4a1lnK2FDVE5BNDc2?=
 =?utf-8?B?UlRaemRjZk82MFY2L2dEUlNTV011SHN1M3VHMkNUZHRMZkgxN09xQm5yOTNT?=
 =?utf-8?B?S1RjcGlSZlVzcTFhamZlVmRreXZwdEk3OXk1UW5Edk8rK1ZZKzRibTF2WlBr?=
 =?utf-8?B?aVJhbzZUWmE2dDZzd043ZTViWUQ0WGRMTGhKOUhET2grd3NhVExUd0s0dlVY?=
 =?utf-8?B?YzRsam0zbCtjUDNtR2lkcG9SNmt6YUM3M1JONWF4d0I3bDZITUs1UjFnRVVw?=
 =?utf-8?B?aTc0T2tjZkFXZVZ2S1lGTUVqZkpud1hJck1jQ2hlSUczMEJmVjByWkJCRmsr?=
 =?utf-8?B?MkE5bGIwL040ajZOdzN4VjhGVUMzT2U5cmpneUdNUGdjT0pKMTJNU1hxUXZm?=
 =?utf-8?B?QzNVQytnYURrVUllNStDUHVLYTRlbjc2MFhlSHR2SjRyZ0c4RnFwMExwbExY?=
 =?utf-8?B?ZjUyYkM3cVNqdmtNbTN4VmdHNmkwYWx5ZFhUSzZBK1RQcENiRWFNT2I4bURp?=
 =?utf-8?B?czQ2NFF5U2xOdkJtbDNTeEJmQXRnVFNybFEyVFdIc1ZSelRRd3BwcHArSFRu?=
 =?utf-8?B?MjE5bUhQUVhEandlcS9kZk1nOWNDMUc0SGY5YTlUbjlDRGZjUEZaeXZKUkkz?=
 =?utf-8?B?OHJ4cU5pNGpiTzJrVzB0QXQ4UHBZU0dQb2hZM3RnUGsxQmVHOVdqUnhkbS9i?=
 =?utf-8?B?cWJTMXA5WmJGdzBpZFdCK01KZnR1ZzBRTWo0dGxRZGNVOS9Ub055aS93cUJy?=
 =?utf-8?B?ck1oYmlVUVdabEh6TG81Y0hFVi9Ea1dRenRzSjQxSTVvbm9DWHIxcDFZVWcv?=
 =?utf-8?B?aHNkTTd1VWRqMU4xaCtqZ2RlV3d4NzI4RGt2TXN3UnhySCsxRE1rQ0tNWDEx?=
 =?utf-8?B?YXhjZisrRWNhVnBrMFVIMWlLV1dLbGpuZUMrcmlYQUdkQWZyS3lScitTTVA1?=
 =?utf-8?B?RzB0VkV3MnJyNFVmNWZDSkdHb3lyazFaRDhwbktxb3JSTi9yR3JodVFhcjlo?=
 =?utf-8?B?QnhUcW9aUFZ3SlQ4YktORkl6YVV1WXo2SS9Ub0I3MzArUXc4QVRoSDVvZC9t?=
 =?utf-8?B?VC9memFUN1ZJa2t2bXFveXV2b0xxSkpXbzlIWmVyT2kzZUZ2YWZjZ3VjNjB5?=
 =?utf-8?B?VzBYSmtjMGxYZmhFUVhOL1hpTTh5SzR1d3AraU5BazQycjllUkJhcmx4TFdI?=
 =?utf-8?B?aDlpYXJib3VJU1RQcktISlVRUTd2eE1zbGpRd0ZYVmpyYnhGV2E3K2FFa2d3?=
 =?utf-8?B?b2tma05tSkVaTUpmejRuNFoxUTBJbTVXekpwRTJVYTNlRjEvQ1hOa3JwbWZt?=
 =?utf-8?B?OTgwMFppbldhMnNSbC9TYncvVHJ2eEtWWjQwOUlvek9hMWZtVUorNm16Qmcz?=
 =?utf-8?B?N3c5VWp3dVVQUmRxUndxMmhVWTY0YmJMMTVsM3N6SFk0eGlnY0xyNnpHUjI2?=
 =?utf-8?Q?fETtwdZt14ey2HRi3aOw6WM/QCJ4ls529zrFW7E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDc4d2pvVVVSOG5jS3l3aDFOV1NicTgyMDgrUE9HeGxzWGl1N3pnRk9Va1Vq?=
 =?utf-8?B?UkFhVVpqZkpYRU1lYTRYS1lUNjlRaE1aZEVSTVA1RVdSeEtPbXBFM0NHRk5T?=
 =?utf-8?B?eWJKZGV5aGxXQzNpU3I5YW91V3lEdHRHYTlIenB2R3VueDI2VHU5MjU4Zmtw?=
 =?utf-8?B?ZHVWWTV5bS9WbWVic0piem96Zk1uSEo0ODBuZmpZOUhzcURUOUw3ME1NODhu?=
 =?utf-8?B?K1cwTGMyS3A0clRXV3dxQXFKMmtiTVEwbGh4VHZvOWJ1U2tCQW5INGpONHFU?=
 =?utf-8?B?cDBkdnJaKy9YQXpzUTFCZS9WdHkyNURud096clpCUWplNW5wTjJybSt6WW1h?=
 =?utf-8?B?V3RhUGswcFJ5dnRsSGxmK2V1WjhNc2pVOUFTUCs5TUgvU1JuZHp2Uzh6Tmhh?=
 =?utf-8?B?alkxT0FvYi9JY0ZiYXdvUmdFMmxEeUFXd3FFeXhuSXpqeDdDRlJVT0JxQ0Mx?=
 =?utf-8?B?YWNnVnRGYy9YcXdhb1hmUUd3ekFINXhSY3lXNFVqYnY0bUhtaHNaYzVsNElv?=
 =?utf-8?B?QXpjTW1XWnFxODg4cWNIOHdpcU44RS9pUWtYdjZwcDJhM1BwcTk3ZXhTZjVM?=
 =?utf-8?B?SFNQeHB0ck53alZIVHdkNktCbDNEejhHL0dtdVlCUGwxbkthd0YvME5jRnVy?=
 =?utf-8?B?aitjSjNZeFRNK3ZDR2czZjhXY1JjRTNHMEF6YkFtdmdpWW13NHUzMXJEa3FK?=
 =?utf-8?B?ZmxDVkQ5UDc1NXd3dFJFRktvMjlidVYxNktFRVlXWjlUR3BCODFLYWgwNFp3?=
 =?utf-8?B?NHZDMEtOb2o4TTlENHpCVmFRalN0cFI3ekFOQUlJMlY0S0ZUMDQzUFg3TXdR?=
 =?utf-8?B?WGVueTFMWDBYWHRFZXNZQUkxamhlZXIzS29YTjkyMWFMYk9QVlVUQ28vYnc2?=
 =?utf-8?B?UXdaV2RYTmZtRmVXbTdHRXFaOVA1ZjQ5Uk1wVEdiemlJREh3bzdBWUNjTHZw?=
 =?utf-8?B?TWticlc1M1lyT0lYbklQVnFpTkpERzBDRThZVWljd3VGbUFqaXFIM2RTeXNO?=
 =?utf-8?B?WndYT0VWWkJVMlY4cFFMbHcvTGEzZXEwU3gzd2RoR0gwbDAvcEZvQTdEdUt5?=
 =?utf-8?B?YUdHTHphVmZLd2lsaHlzTVBqK1VtVXA1cVZCQzgyeFNpdGdrWll3YklITWp2?=
 =?utf-8?B?RHBRVmJ3aHJKRnUvRmtOWnFKcHpaN3l2QU5iWjcrdG1aeFRrQWJvQ1BGdE0z?=
 =?utf-8?B?WDNhZFh2UGV6Y05WaWtSdDNDc2JUeWMyU2ZLeEx4c2liVGZtUzJyK1pBRDhM?=
 =?utf-8?B?dUorNytjNmZUb2dtbFBDZTY0bzhpdmRXRTZoMVZnS0RmYnBEQ1JIOG1tN3Y4?=
 =?utf-8?B?dEVaVHBWVW1iSTBLTFNSMU5rK3A4RUh5RHRVSWRwV2xNVHRvUU9YR3ZPbzBx?=
 =?utf-8?B?RUtNdHQyUFRobTZXWVRlRVBWMUVnRWVjVTFDYmlTZk91Um1ndW9sSzloWnk3?=
 =?utf-8?B?LzRyUHVKT1FHaExrSWdkQ2xzOHdDZnUyZDJ4bURKa2JpSlQ1VEhCNkQ5RTBw?=
 =?utf-8?B?azZiZWxpaWNTTFA5SDBHQ0dXb2hPRTJnaVJ6UUpMb2w0QVZiOGxYUEo5OHRI?=
 =?utf-8?B?MThrNERYQldDb0REZGZaNHJEb0lQeWxDWnBCTWNUTkg1b09icHQ0c3NrbXZT?=
 =?utf-8?B?NGxYUCtYeGxLTzdXTjdDK3MweWx3RUxLM1duNEtTSW42enFsWDFIQ0J5Z1pI?=
 =?utf-8?B?R3ZLOFBIRnBKdjBxcXVZcTJIcjZ2Vno2K3ArS0FrTEtka2RzeXF5YXFKeTQ4?=
 =?utf-8?B?ZGp5OENsSTQrVCt4Y3FUby9CaVV6K2VQcmxEc09aSG5HYkZGenlWYWZGTWxH?=
 =?utf-8?B?b21HTFJwdmZtWUpWZENUWnNHcVpPd2FUNjJHSUpoVVVLOTkyTEZkSGdjZ1VW?=
 =?utf-8?B?NnB0TnY2NzhGZ0NCZXdGaWVPT3d3SVA5a01CQjNTanc1T1FVTHZwYzUvWkZo?=
 =?utf-8?B?QWdOZlFKQlN5aHhlQ0pITG5lV3ZOQW4zU3duV2tIK0t2OG9kRXpUbVZzbExw?=
 =?utf-8?B?NHlWSW5vRVpVdmVzTGVpQ1dSWkVScERQOXZEeG5XVkxtSG8vUGx1cjlTbzZK?=
 =?utf-8?B?cDhWa1ptK0dWMTc1UzdGd2RZdVhJVTkxUlpvQzN4ZFYwc1J5QWlQcE5HQ3FB?=
 =?utf-8?B?SXBGM2tvajFGcHN5MGhoeUdSVElSYkFvbE9rM29VR0I1UklCMXpIUVBRZlRF?=
 =?utf-8?Q?y85IaTccAsIJvvKqGoxYGEQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9885deac-e56a-4f0d-e370-08dd04f4e212
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 21:39:56.9777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DC27awc+0N1ClosvsWN6GQ/j/C6oxA4N1Q+dF6oRY+hvY62tj94Nb0uU2HYlVjPVqet7JZihj+vACpny3O7nZPn3SP3ELxtKAdlki1wGOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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


<snip>
>
>>
>>>
>>>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of 
>>>> PXP session
>>>> + *    this queue will be used with. Valid values are listed in enum
>>>> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the 
>>>> default behavior, so
>>>> + *    there is no need to explicitly set that. When a queue of type
>>>> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM 
>>>> session
>>>> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't 
>>>> already running.
>>>> + *    Given that going into a power-saving state kills PXP HWDRM 
>>>> sessions,
>>>> + *    runtime PM will be blocked while queues of this type are alive.
>>>> + *    All PXP queues will be killed if a PXP invalidation event 
>>>> occurs.
>>> Seems odd to say 'values are listed in ...' and then go on to 
>>> describe each type and provide extra information about them. Seems 
>>> like the extra details should be part of the enum documentation 
>>> instead of here?
>>
>> This is documentation specific to how this ioctl handles those 
>> values, so it belongs here. The 'values are listed in ...' sentence 
>> was about being future proof, in case we update the enum in the 
>> future and don't need to add any extra explanation here.
>>
> That is an argument for having a single point of documentation and 
> that point being the point of definition. Then, if new values are 
> added it is immediately obvious what documentation needs to be updated.

Still not convinced. Having the ioctl-specific info in the enum 
definition would mean having to list the behavior each enum value has 
for each ioctl that uses it; IMO it's cleaner to have them in the ioctl 
documentation itself so it's easy to make clear which special behavior 
applies to which ioctl. Also, when I said not adding any extra 
explanation here for future extensions I was not referring to a mistake; 
for example, compute sessions (which we don't currently support) don't 
have any of the extra requirements that HWDRM sessions have, so we 
wouldn't need to add any extra explanation to this ioctl if we added 
support for those.

Daniele

>
> John.
>
>> Daniele
>>
>>>
>>> John.
>>>
>>>> + *
>>>>    * The example below shows how to use @drm_xe_exec_queue_create 
>>>> to create
>>>>    * a simple exec_queue (no parallel submission) of class
>>>>    * &DRM_XE_ENGINE_CLASS_RENDER.
>>>> @@ -1108,7 +1126,7 @@ struct drm_xe_exec_queue_create {
>>>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY        0
>>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY        0
>>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE 1
>>>> -
>>>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE        2
>>>>       /** @extensions: Pointer to the first extension struct, if 
>>>> any */
>>>>       __u64 extensions;
>>>>   @@ -1694,6 +1712,26 @@ struct drm_xe_oa_stream_info {
>>>>       __u64 reserved[3];
>>>>   };
>>>>   +/**
>>>> + * enum drm_xe_pxp_session_type - Supported PXP session types.
>>>> + *
>>>> + * We currently only support HWDRM sessions, which are used for 
>>>> protected
>>>> + * content that ends up being displayed, but the HW supports 
>>>> multiple types, so
>>>> + * we might extend support in the future.
>>>> + */
>>>> +enum drm_xe_pxp_session_type {
>>>> +    /** @DRM_XE_PXP_TYPE_NONE: PXP not used */
>>>> +    DRM_XE_PXP_TYPE_NONE = 0,
>>>> +    /**
>>>> +     * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content 
>>>> that ends
>>>> +     * up on the display.
>>>> +     */
>>>> +    DRM_XE_PXP_TYPE_HWDRM = 1,
>>>> +};
>>>> +
>>>> +/* ID of the protected content session managed by Xe when PXP is 
>>>> active */
>>>> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
>>>> +
>>>>   #if defined(__cplusplus)
>>>>   }
>>>>   #endif
>>
>

