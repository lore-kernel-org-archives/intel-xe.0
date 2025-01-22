Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A94C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 16:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09710E155;
	Wed, 22 Jan 2025 16:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVh1Yd+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8056F10E155
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737564370; x=1769100370;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cvbMcz+1NEUsnTxbdWR/yG/clAKzgPwOuu2aICRF4Pk=;
 b=BVh1Yd+36q3OPMclRdGf9jbdSnsoZV5epZE16MtjBRMn3BCbG3vkHZe5
 vhSyUvrM+pv65HVKw/v5XfRiHTjCDLaWF7tqHGJI3ioLJgVw+WaONYUdX
 MRXjoJ7lb2obDdO1hrQ8wefHNRM6AxGVUOD0GV0XYRNjGOklFOu+foNN7
 emTHr+k6QLMBFOOc9RZiG8XcZgQu7o4zV1sLwxBUXsbPWeGdcSZgx6jJS
 nI3VA/4LBR6m3ElcRo0iEtGzmkhl3WNzeuAW4DeCqCSOgV3D64xrDI4sW
 8x9MAukVnoCiuY2/Rv+LXuj3R3iY7OCT4XalgLLwHkkquCEqhrv5nZKYH A==;
X-CSE-ConnectionGUID: BNye/GEuQsq7Gk1aDhxclA==
X-CSE-MsgGUID: 20zTmb35QS+RYpEQSgoSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63382312"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="63382312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 08:46:10 -0800
X-CSE-ConnectionGUID: bXMpeU5TTHKyHrYaa7LNvg==
X-CSE-MsgGUID: hpAUeIN1RRGgvk6WvHeM+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112169095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 08:46:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 08:46:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 08:46:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 08:46:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZPqdCGHTM9Q8qacAM1Vh5zDaMxb89NRg9QuzJQODTbyj3w3bxTtLlM/kEVyHu/rdZt7MJXt69zASj3lPAJifYP4rJp9hb2qzJVxQe/wCvjLnxGXWdV05IWeenoU4n45eoZ/yZC+1niLVY4dENFPHJephIQRuWAEYFOPsls+7gKCMra/njTQJuwunUgnaahs0sNiTwPzTVQp5Nlb4HyQ5urs80Fwpk9mDfShfpAbbpZQ/zLENy4pkbCIdYMAssZs215IOy8vgLa6S85f2WahQYIIJg0Ju+0T5tzEgXY0fPphWD3d3G+8o95CPd8NRlQdy9ba6BT1+jrnGMEuSgP5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyQzNX9gvqHlXJAs9wFRhJT9ONAvV/6yT21O39VQW0I=;
 b=JdmP0otfnApFu5MmRP1qj+07wArfGuIH/Ix4RH+gzvaeZ9pRwtensFicd+7309BAnzhga1bOqHnwrj5BpHeEAXsEf/3+/5o+n0wit8PtllHZlSa/w+txgB0+ebuIq3z5K8Y+4NVC89GbujkA2gMYKWWuW8NpAq4PXIB2J5lZqrnLbTnhuv9C/wt4h/ZZVVcZ7S68MybT2vTvGRExVQ2ZRQGNGMFyBn5xf09F6Is0o6w2TihrKTxewnPUFIja8Dyaf/SvhpHmZE2ScSIsdI24g+/Ld+BbSiz33/ANy4UoYx3RppYIZn2+dvPTNnZMxYgkG+Eu61GqWcTjyKWhurHW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Wed, 22 Jan
 2025 16:45:53 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 16:45:53 +0000
Message-ID: <2e2d831f-6b1f-457c-8166-ce8362182a55@intel.com>
Date: Wed, 22 Jan 2025 08:45:50 -0800
User-Agent: Mozilla Thunderbird
From: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
 <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
 <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
 <zkjzktceuth45bignihe2vy5j3durxymlur5ama4npxjtraetp@2cta2iw2pq7r>
 <b33cc2e2-d29a-4325-a92f-529ba55efc09@intel.com>
 <b5lvicq2uiplspkfzbx6im5c2bwt6xzajedqpvn4uyqns4sjvm@guonfjgyryju>
Content-Language: en-GB
In-Reply-To: <b5lvicq2uiplspkfzbx6im5c2bwt6xzajedqpvn4uyqns4sjvm@guonfjgyryju>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0245.namprd04.prod.outlook.com
 (2603:10b6:303:88::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: cab89058-4610-473e-c04f-08dd3b043c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alp6WHBadVdKcGg1TC9QNVZIcEhzRHBtWFcyL05UWTVBTWRRRndZeGx2OHM3?=
 =?utf-8?B?alJsS0pVNEtsZVVzNVN5NHlnenNOL2JWQmJIY1lmZnJNQ2FjeFl6THRRSjha?=
 =?utf-8?B?c3VEWFg4d2FDTExxVUhHaVZTSGtnQy9NOWRaREFvRS9hZmJRS2dvY3ZEV3NW?=
 =?utf-8?B?U012RkEvTmxOZDBUaW8xVFVmN045MGU4bDV2MHhkc1pMcmNSc1VYcHp1N0pl?=
 =?utf-8?B?TkE2L05EaEd1VlBFOW1saU5NdUVqY0tzd1h3TFdHaEMzZHNQekU4ZDJxc1N0?=
 =?utf-8?B?SG5Gd0lSb2lGQ2U5ZEl0U1NvNldFU205L1VrQ2xxR2NsNkJFKzl2TkEzeFd3?=
 =?utf-8?B?a3o2cWRRcUs1UERIeXRYNDBBRkF4TWVMb09qb0dzQ0JpL1JwT2YzYjhCc01v?=
 =?utf-8?B?WTl0Tk5GU2NtcWg3NEJHOWJmTUwrczY0TitrR3VwTUhkTEVKUGNiYkhRajZB?=
 =?utf-8?B?VmdMTS9HYi91UDFlQ2FZL0RDZXovQzJxRVNmUUdnalNFYk5JTVFSYlc1cnd2?=
 =?utf-8?B?VTNNQTVpN0Vwby9qTUxPK0ZsU3JBNHVoVWFqM1VFaW9tdlRVaktWNUhWQXI2?=
 =?utf-8?B?clp0S2Nvdld4bEZlL0IxazQ4RVhCRFlyVys5K0lmVzFSdlBqeWRRUXlYWWhz?=
 =?utf-8?B?UnhkS05RaHkrQ3JZWDVXY1FpTHNjOS94N3RseVI0MWlLaVpVT3NPMW8zWFBp?=
 =?utf-8?B?RGlNeG5paW40RU9rVGtpYWd1S0E4RjlXeWFVZ1k0c2ZYMStWKzlsQmZFUnVh?=
 =?utf-8?B?K3hFYnpJbnVYU3YwSzBvajV2cURDQnpSWnR3STc5dEhjVGxjR29aTjA0Y2Vp?=
 =?utf-8?B?MEgxRkVmckNJTGNzaEU3MFpKTzBSdkg1MUhYMDZUZnk3T29tdGVqaUI2RE5H?=
 =?utf-8?B?VnNxNHN4RHQ2a2VtY2dSSHNjNDZCUHpKbW16T0pTNTgyeU5tQXQvYks0eHBX?=
 =?utf-8?B?WWdUODl5YlVOUDZnZmludEtjUEtDVjVxZys5N3dXZzcyU0NsM0R1ZFRhQkdH?=
 =?utf-8?B?ZU1TYy9uU0RlQjBuMTF5NTVGeDg4U2NKcUU3czRkYjdTWXgzMTlzNVNCSkNP?=
 =?utf-8?B?SGtjMWpQTFNyZ0VJL1VzSmxLS1FGZ09Ea045RDBTR01uUXFvcHh5ZVRVTis2?=
 =?utf-8?B?ZU9CWnRpNHpCa1JMWHE4eFlUZVdka3ZVZXpnVDgxVVJ3MlkvVVc3RVg4dFNn?=
 =?utf-8?B?UUlCZ3MwTERyWFNBcEdBUDQ2K1dJeWVHZytEN1RhbUFLWTBGRzNvQjQ2dm5E?=
 =?utf-8?B?ZmVsSW1RdjQvTndjRitGZ2ZDVy9kcFN0eGFiYyt3Tm9vdHNOcTNZMzNDTExJ?=
 =?utf-8?B?Ukd2dG5UNUwxZWdmV01RQXpwMXIvWGNMd3ljU1JzSXVHUmJOcjVrb0plblN6?=
 =?utf-8?B?djBjdE92T1AyTXE3UG5MRDZERHEvc3o1Zmw5WFJsZVFjN1I1akNlcE81cDV3?=
 =?utf-8?B?QzQ2VittQ3ptdnFSekN6WlY5ZXNPNlhvYVI2NzZhTnFwQXFtcXg4bjB3Y0E0?=
 =?utf-8?B?U3lVYlg5RWl2YmpRQ09LR0s4WWgrbUxmOVVweTU3TFpiMGV0WXdueHlrSTls?=
 =?utf-8?B?TVgwdytLYytQeURYWGpkQ2M4dXZwTmMvZm9GT3Vxc010aHppZUtUVXlqcDFh?=
 =?utf-8?B?cTMwekx4Y3E3S0ZTaytMdmVscW5IRVZiOVpNblF3NGd6aFNYd1NrdGZLQlZL?=
 =?utf-8?B?cFpxK0dYdXI3MGtWTWpCbUxsdExpcnBqTGNrS2VYb3NiUzliaXdwUTJmTXNq?=
 =?utf-8?B?Wmx6Sm1ZQm1JQTh5UThOWEFFQWM4S1JyRU16bVdQQnBXWlhQWHdhaHZiNWhE?=
 =?utf-8?B?SWJtZ2wrQXlJdGhKMktRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFowd2JIYTVCTW9XejVOVmxsaFUrK3UxMkZqYk4vQVRIVzNKcEZ4REF3elpB?=
 =?utf-8?B?ZWZMR254YU5xcHdJV0U0bFJ1ck1mYlUyUmV5dDRQd3FBUVhkOE5RMzBsTHdB?=
 =?utf-8?B?aXljMWI3SnlKaDF5NGIvZFVPNEY1Ym1ORmhPbmZSZGY1c1BDaU80Vk1XQmtz?=
 =?utf-8?B?RGMzREp1cG9FWTU1N2NQdk9uVzc2aEZiKzV3QmdSMDJqbXNKRjhzN1FtdGRP?=
 =?utf-8?B?TzVLbjd5ZlRGb21PSnU4Q2JHRnlUQitRajhqSy94TlJnaDR0ZTZCYW15S25E?=
 =?utf-8?B?bXEwb1YycExmd2RVMmFjY3g2NUR4WjNUR05EK1ZZSUhvV1dwSlE5TjhkMDFQ?=
 =?utf-8?B?QTQvdVlpZzlBUGx1bUlBKzR4c2pxK0l0dUNBTUt5VkpRdVltNGFrZ0RQNTRY?=
 =?utf-8?B?TEFGdWdRT1BOMHloR2RUNGpmcGgvT2Z0b1VpQXhBU3RndnZjTEdRN1d3Q1hv?=
 =?utf-8?B?VlJKdEpnZ0lhd1pLallnWk9RZEV5ZUNIOUVrSVBqUW5WWGJqa3luMDNyb0pu?=
 =?utf-8?B?YWgvajdjU2EyMmtmZUl1NE5vVkdoZGdGa3JCMnJvWElvbk0xY3dPak9mNUxi?=
 =?utf-8?B?aWdiVjlyNHBEZTlKblJuY29YekJ3SWYycEU3eGZFdUZrK1ZJRThoSXFqNlVL?=
 =?utf-8?B?YThXTytvYmwrNmRUN1JJUUhuL0hORUNSQmFJQiszVnN3R2VyRG00SmlzYjA3?=
 =?utf-8?B?dFBZWmI4aWpGZTJXZHNCUWxISHpVbWExTk1EYkIyMllmTzMvSFlOamNvSVdS?=
 =?utf-8?B?YzJ4Rm9pcy9IOFpDQ0p1bGQyRzMzQmozcGM3U2ljSUx5NjEySDBQbVA5N2c2?=
 =?utf-8?B?allldzcrOC91Uk4reVhWVDBnQkFWbEtXMDZHaXZTWXpSVldsanU2bkRpRXNt?=
 =?utf-8?B?ajFQMEhxOGVDdFRKc3FRcDV2K0RaNEVTRHM4YllubUN2NFh4K09UMmkvNWYz?=
 =?utf-8?B?bVYwTXAvV01aYlEyRDY4Zy9qSGUyYW5BY0V5dzluV2w2VjhSaHJLejA5OGEx?=
 =?utf-8?B?RWVGU2RiTFFYNmRKam9yZ051V3hxK1pLVHJXRFZKUG5PdFRTeG00SjhpaGlK?=
 =?utf-8?B?Rk15QlhsazlKZy9KUzRhelhzbDhOM2s4Ynp1QjNqWEVrMGhOcEZsNjJpTFBw?=
 =?utf-8?B?ZjJybXJZOE1pTlR0WmJkRjE5Q2drUEYrQjI2b1NyRWkvNDd0ZUVZOWgvVmZS?=
 =?utf-8?B?SVlLMGExV05ObDFWYmNPV3YxZHpGK2VEN1YyUGd3a1E5Q08xOXM5TXlrRVR6?=
 =?utf-8?B?cjl0eW1mU3NHcnUzeE1WWWVpWlk4OElBMmNjSnZDMEdRQkdDZE9aL3BJY1Na?=
 =?utf-8?B?d28veHEzNW9MSmVzQU5URFpOOVlrMEdKa2dGRWs0V0ZKVVlhTHdqRWhlL203?=
 =?utf-8?B?MnEwOTU5aytlWTV0WG8reWNXQlBjUHEvNk5JRVlZOVJ2eU1IL0x6emtnaGpD?=
 =?utf-8?B?N04rWm90SmxkMllMR3g3aHdjVWk2dnh2RlJBQllXZzd6K3RkczBpekRDTFBR?=
 =?utf-8?B?aWhtdE9SWEs3S2h4bzdFVjUyYzZZeEM1bUN6ZFVFUHJOWitVck9Sc3hzME1G?=
 =?utf-8?B?cjR5RFBxaEdnOTNBM1FUZUhNemFjblVwVjBXR0E0WHgvNWNIVnUybERKbHJ4?=
 =?utf-8?B?TG9temtRcXJLRDMyUzRSQjVPajRmUGswMnd1YTA3UjJLQUF1S0ZGdWExWDBh?=
 =?utf-8?B?ejV5Z0l6bmpKV1BCbXU4MWpvNkhLbVBUMWdzWlI4THJxVlV2RWd5Y21xUDBq?=
 =?utf-8?B?S0lJb2VZbXc5cXA0c2JKYzkrVEN2Z2VFYVpxTnNqcWVYbEpESThUaFhlelFa?=
 =?utf-8?B?cnEzYlBOTVd4anhNMHJxNy9SY1oyTkFXT2RkVlhtVkRKeStneWZPRXo3eGdn?=
 =?utf-8?B?N0I0ZEZVWDhrNzYvWjhCTEJIK0ZtVllTNEtYMjIzYjJONWgvbzNNK0FaMHda?=
 =?utf-8?B?ajJzdnNYbkMyM25YTDhEOWQrZHdIeVNnKy9UY2JxeDF0N041NlpNeFhPbHJD?=
 =?utf-8?B?ZzZrbDd0cHZ4NjltTzNqaGFWbEEwYVJxUjkxUEdHZ2dscFdVWHpUWWxhV3Zr?=
 =?utf-8?B?WFFGUVA4THNnZDUzTmF5ZEY4ei9BUW1pM0RTcDMxL2RnWnNVZnhNZ3ZJcEJD?=
 =?utf-8?B?Mk9uZDB5c2JMTGFUUVR1VXFqalBKR1l3WnZTQnNJejJDZ0YxM1M3ZWpZYjc5?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cab89058-4610-473e-c04f-08dd3b043c4e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:45:53.5728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: curS+CxFMwAVdqm31y6432H1IJb6sIijxtASWj2CsZSkXuVn4PQI0y/V2uYINzRBQcqIpyjxNRJQ9OK5fHrekbVf+k61hmH08nwpSYSFN4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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

On 1/9/2025 14:43, Lucas De Marchi wrote:
> On Thu, Jan 09, 2025 at 12:40:51PM -0800, John Harrison wrote:
>> On 1/9/2025 07:39, Lucas De Marchi wrote:
>>> On Wed, Jan 08, 2025 at 03:59:58PM -0800, John Harrison wrote:
>>>> On 1/8/2025 14:11, Lucas De Marchi wrote:
>>>>> +Jose
>>>>> +Rodrigo
>>>>>
>>>>> On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>>>>>> On 1/7/2025 13:10, Lucas De Marchi wrote:
>>>>>>> On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>>>>>> Change to disable asci85 GuC logging only when output to 
>>>>>>>> devcoredump
>>>>>>>> (was temporarily disabled for all code paths).
>>>>>>>>
>>>>>>>> v2: Ignore only for devcoredump case (not dmesg output).
>>>>>>>> v3: Rebase to resolve parent tag mismatch.
>>>>>>>>
>>>>>>>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>>> ---
>>>>>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>>>>>> include/drm/drm_print.h             | 2 ++
>>>>>>>> 2 files changed, 7 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>> index 6980304c8903..8e5d1f9866a7 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct 
>>>>>>>> drm_printer *p, const char *prefix,
>>>>>>>>      * Splitting blobs across multiple lines is not compatible 
>>>>>>>> with the mesa
>>>>>>>>      * debug decoder tool. Note that even dropping the explicit 
>>>>>>>> '\n' below
>>>>>>>>      * doesn't help because the GuC log is so big some 
>>>>>>>> underlying implementation
>>>>>>>> -     * still splits the lines at 512K characters. So just bail 
>>>>>>>> completely for
>>>>>>>> -     * the moment.
>>>>>>>> +     * still splits the lines at 512K characters.
>>>>>>>
>>>>>>> did we investigate where this is done and how we can overcome it? I
>>>>>> Yes. And the comment could be updated as part of this patch to 
>>>>>> make it clearer...
>>>>>>
>>>>>>
>>>>>>      * Splitting blobs across multiple lines is not compatible 
>>>>>> with the mesa
>>>>>>      * debug decoder tool. Note that even dropping the explicit 
>>>>>> line wrapping
>>>>>>      * below doesn't help because the GuC log can be so big it 
>>>>>> needs to be split
>>>>>>      * into multiple 2MB chunks, each of which must be printed 
>>>>>> individually and
>>>>>>      * therefore will be a separate line.
>>>>>
>>>>> so there's no "underlying implemenation that splits like at 512K 
>>>>> chars"?
>>>>> Nowe it's something else: a 2MB chunk because of what?
>>>> The GuC log is captured in multiple 2MB chunks because we can't 
>>>> kmalloc a full 16MB block at a single time irrespective of memory 
>>>> fragmentation - the kmalloc function aborts with a page size error 
>>>> above 8MB, I recall. Might even have been 4MB? The 2MB chunks 
>>>> become approx 512K characters of ASCII85 output (when mostly full 
>>>> of zeros). Because each chunk is a separate bo object the memory is 
>>>> not contiguous so each must be printed with a separate call to 
>>>> xe_print_blob_ascii85(). If xe_print_blob_ascii85() includes a 
>>>> terminating line feed at the end of the print then that means 
>>>> multiple lines for the GuC log.
>>>
>>> now it makes sense... and contradicts what was said earlier about the
>>> "underlying implementation still splits the lines at 512K characters".
>>> It's this very function that is splitting it.
>> The initial comment was written before the situation was fully 
>> understood because it was a quick hack to get the mesa debug tool 
>> working again.
>>
>> The split is a combination of the helper function adding a linefeed 
>> to the end of the output and the GuC log being so large it must be 
>> split into multiple malloc buffers. But it is not related to the 800 
>> character line wrapping within the helper's output.
@Lucas, are you happy with the above now? If the patch is updated with 
the comment as above can we get it merged? We currently have no access 
to GuC logs via debugfs which makes debugging issues difficult. Multiple 
people have already complained about this not working.


>>
>>>
>>>>
>>>>>
>>>>> I don't really want to keep updating this instead of fixing it.
>>>>>
>>>>>>
>>>>>> The dump helper could be updated to never add any line feeds, not 
>>>>>> even
>>>>>
>>>>> when you say "dump helper", what exactly are you talking about?
>>>>> xe_print_blob_ascii85(), __xe_devcoredump_read(), 
>>>>> __drm_puts_coredump()
>>>>> or what?
>>>> xe_print_blob_ascii85
>>>>
>>>>>
>>>>> If it's about xe_print_blob_ascii85(), I think this would be the 
>>>>> first step:
>>>>> drop the \n you are adding. AFAICS calling the print function in 
>>>>> chunks
>>>>> of 800B would be fine, just don't add any \n. If that still adds \n
>>>>> somewhere, we can check how to drop it or you then may have a pretty
>>>>> solid argument to adapt the mesa tool with a newline
>>>>> continuar char and send them the MR.
>>>> As above, the chunking is at the next level out. So dropping the 
>>>> 800 byte \n won't help with the GuC log still being split into 
>>>> multiple lines. You have to either move the terminating \n outside 
>>>> of the helper and into the callers or add a bool parameter to 
>>>> enable/disable it. Either of which is just messy.
>>>
>>> If the caller knows it's calling the function multiple times to 
>>> continue
>>> previous data, it's not unreasonable to have an arg to terminate it or
>>> not. It's for example what python does with its 'end' arg to the 
>>> print()
>>> function.
>> Just because someone else does it does not make it clean or the best 
>> solution.
>>
>>>
>>>>
>>>> Or extend the helper to take an array/list of pointers in a 
>>>> scatter/gather fashion.
>>>>
>>>> And if you drop the 800B \n then you break the dmesg output 
>>>> facility. Which means we can't get logs out from CI panic type 
>>>> situations.
>>>
>>> Or that we should have another way to get a devcoredump. I don't think
>>> we are going to print the devcoredump to dmesg when the kernel panics.
>>> We may print it when we fail to probe, but the cpu should still be very
>>> much alive - we tie the devcoredump lifecycle to the lifecycle of the
>>> device, so we don't have an opportunity to get that data.
>>>
>>> The workaround you add is to dump the whole thing to dmesg, but we 
>>> could
>>> dump it somewhere else like a debugfs that is tied to the module
>>> lifecycle.
>> The point is to get usable logs out of CI. There are multiple 
>> situations in which CI fails to save logs. By 'panic' I was more 
>> meaning situations where we have very rare bugs that can't be hit 
>> locally and for which CI is not providing useful logs. I.e. we are in 
>> a panic about how to debug it and dumping via dmesg is the only 
>> viable option.
>>
>>>
>>> The dmesg (kmsg) format already contains other things you have to 
>>> ignore
>>> to extract the message:
>>>
>>>  * /dev/kmsg exports the structured data in the following line 
>>> format:            * 
>>> "<level>,<sequnum>,<timestamp>,<contflag>[,additional_values, ... 
>>> ];<message text>\n"
>>>
>>> so you will always have to preprocess it, ignore lines that don't 
>>> belong
>>> to the log, etc.
>> I never said this was not the case. The GuC log decoding tool already 
>> copes with myriad different dmesg, syslog, serial console, etc. 
>> output formats.
>>
>>>
>>> And if you print it correctly, you can even make use of the LOG_CONT to
>>> mark the new line as continuation of the previous one.
>> Reconstructing split lines has never been a problem for GuC decoder 
>> tool. It is only the mesa tool that has a problem with line feeds.
>>
>>>
>>>>
>>>>>> at the end. And then the burden would be on the callers to add 
>>>>>> line feeds as appropriate. That seems extremely messy, though. 
>>>>>> And it will break the dmesg output facility. That does need the 
>>>>>> line wrapping at ~800 characters which can't be done from outside 
>>>>>> the helper.
>>>>>>
>>>>>>>
>>>>>>> understand having to split it into multiple calls, but not 
>>>>>>> something
>>>>>>> adding a \n. particularly for the functions dealing with 
>>>>>>> seq_file and
>>>>>>> devcoredump.
>>>>>>>
>>>>>>>> +     *
>>>>>>>> +     * Only disable from devcoredump output.
>>>>>>>>      */
>>>>>>>> -    return;
>>>>>>>> +    if (p->coredump)
>>>>>>>
>>>>>>> but we do want the guc log to be inside the devcoredump, so 
>>>>>>> rather than
>>>>>>> adding more workarounds, can we fix it ?
>>>>>> The simplest fix is your suggestion of adding an extra white 
>>>>>> space character at the end of the line in the helper function and 
>>>>>> updating the mesa tool to support multi-line output. That seems 
>>>>>> like it should be a trivial update to the mesa tool and it keeps 
>>>>>> the KMD side simple and consistent across all potential output 
>>>>>> methods. But Jose seemed absolutely dead set against any updates 
>>>>>> to the mesa tool at all :(.
>>>>>>
>>>>>> The more complex fix is Joonas' idea of using an official 
>>>>>> structured output format of some sort - TOML, YAML, JSON or 
>>>>>> whatever. Something
>>>>>
>>>>> it actually doesn't fix this particular issue. It fixes others, 
>>>>> but not
>>>>> this one.
>>>> If we do it properly then it fixes everything. The format library 
>>>> would have helper functions that the devcoredump code can call to
>>>
>>> but we are *NOT* going to export a library for that. You are just
>>> shifting the problem to "we have only one userspace that is our own
>>> library, deal with it".
>> No. By library, I mean libjson or libyaml or whatever. The whole 
>> point of using an externally defined file format is that you can use 
>> an externally written library to read that format. Whatever userspace 
>> tool only has to worry about processing data/value pairs or whatever 
>> you get from the library's read interface, it no longer has to worry 
>> about file formats, character encodings, line wraps, etc. All that is 
>> handled by the third party library / file format definition.
>>
>>>
>>>> print integers, bools, strings and BLOBs. The debugfs/sysfs output 
>>>> would just stream the encoded output exactly as is. The dmesg 
>>>> output layer would add the 800 character line wrapping in a way 
>>>> that the dmesg decoder can undo before passing to the decoder library.
>>>>
>>>>>
>>>>>     "Guc Log": "<encoded data .........."
>>>>>
>>>>> if you need to split lines, you still need something to do do it in
>>>>> whatever format you choose. One json I remember working on in the 
>>>>> past
>>>>> that embeds the binary is the .apj format... example:
>>>>> https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj 
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>     {
>>>>>         "board_id": 9,
>>>>>         "magic": "APJFWv1",
>>>>>         "description": "Firmware for a STM32F427xx board",
>>>>>         "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...
>>>>>
>>>>> here "image" is base64-encoded  afair. But in your case, just 
>>>>> printing
>>>>> the json to dmesg wouldn't work because of needing to split the line.
>>>>> It wouldn't fix the kind of bugs we had in the past too: in json it
>>>>> would be the equivalent of adding a field to the wrong object and 
>>>>> then
>>>>> move it elsewhere. An application trying to read that object in the
>>>>> previous place would be broken regardless.
>>>>>
>>>>> toml is more for configuration and yaml isn't a good one for this 
>>>>> case
>>>>> as it further relies on indentation. I wouldn't oppose to use 
>>>>> json, but
>>>>> don't expect to have dmesg to magically work because of that.
>>>> TOML basically says 'use base64 and print it as a string'. And it 
>>>> supports multi-line strings, so the reader would have to drop 
>>>> newlines within a base64 object before doing the base64 decode. Or 
>>>> just use a base64 decoder that ignores whitespace.
>>>>
>>>> YAML seems to make even more explicit. From the 1.2.2 spec page:
>>>>     picture: !!binary |
>>>>      R0lGODlhDAAMAIQAAP//9/X
>>>      ^ space here for line continuation, as I mentioned.
>>>
>>>>      17unp5WZmZgAAAOfn515eXv
>>>>      Pz7Y6OjuDg4J+fn5OTk6enp
>>>>      56enmleECcgggoBADs=
>>>>
>>>> So the userland reader just gets binary data straight out of the 
>>>> decoder library with no processing required.
>>>
>>> A decoder library that we are *NOT* going to write.
>> As above, the decoder library is definitely not written by us. It is 
>> libyaml or some such.
>>
>>>
>>>
>>>>
>>>>
>>>>>
>>>>> So let's fix the issue at hand and let the talk about xe's coredump
>>>>> format for a later time.
>>>> The issue at hand is that we have two fundamentally conflicting 
>>>> requirements. DMesg output requires line wrapping but the mesa tool 
>>>> has been coded in such a way that it breaks when given wrapped 
>>>> lines. There is nothing we can do about dmesg but making the mesa 
>>>> tool's parser more robust does not seem difficult.
>>>>
>>>> Switching to an externally defined encoding scheme that internally 
>>>> manages binary objects and supports wrapped lines would fix all 
>>>> issues and guarantee future compatibility.
>>>>
>>>> Note that line wrapping is not the only problem with the current 
>>>> mesa tool. Unless it has been updated since? The tool breaks if the 
>>>> context information is not part of the "GuC Communication 
>>>> Transport" section. Which is totally incorrect. Context state is 
>>>> very definitely not part
>>>
>>> We reverted it because it's not ok to just move it to the "correct"
>>> place and break the users. If it's in the incorrect place and we know
>>> there's this parser already using it incorrectly, we can treat as a bug
>>> in the kernel and adjust the userspace (it'd be considered a bug there
>>> too and backported to their earlier releases).  What we don't do is
>>> simply merge the fix and break userspace.
>> Can we not repeat old arguments? No-one realised that that change 
>> would break userspace. Or if they did, there was confusion over what 
>> exactly had or had not been tested and was causing a problem. 
>> Certainly it was not an intentional "merge and everyone be damned".
>>
>> My point was that there are multiple issues here. Line feeds is only 
>> one. But using a structured file format would prevent both of the 
>> problems we have currently hit.
>>
>>>
>>> Send the fix to the mesa tool if you want to change this in the kernel.
>> When I can finally work out how to build mesa (it seems to require 
>> libraries that are newer than any Ubuntu release has access to!?) and 
>
> https://docs.mesa3d.org/install.html has the docs for that.
Pretty sure that's what I was following last time.

>
> For ubuntu, in our internal docs we document to install deps with:
>
>     sudo apt build-dep mesa
>
> You can disable stuff you don't use. Our internal docs have this useful
> set of args:
>
>     meson setup \
>         -Dprefix=/usr \
>         -Dgallium-rusticl=false \
>         -Dgallium-drivers=iris \
>         -Dvulkan-drivers=intel \
>         build
>
> I think you are probably talking about the llvm dep, that can be
> workarounded by the setup flags above.
I don't recall what the specific problem was last time. It looks like I 
have managed to get everything installed this time. However, the build 
does not appear to include the aubinator program. Nothing in 
src/intel/tools appears to get built at all. And I can't find any 
mention of how to build or use it in the Mesa docs or elsewhere.


>
>> have spent time learning yet another code base and how the tool is 
>> implemented...
>>
>>>
>>> And as I said, for this particular change it doesn't matter if it's a
>>> custom format, json, toml or whatever... the bug would still be the
>>> same.
>> Ideally not. Part of moving to a structured file format would be 
>> ensuring that the structure of the data is correct.
>>
>>>
>>>> of the GuC CT layer. That absolutely needs to be fixed. And 
>>>> generally, anything we can do to make the decoding more robust and 
>>>> future proof would be a very good thing.
>>>>
>>>> Note that the devcoredump content is highly dependent upon the 
>>>> internal workings of the driver. It is going to change over time. 
>>>> So the more robust the decoder, the better chance it has of not 
>>>> breaking when some new piece of data is added to the dump or an 
>>>> existing item removed or modified.
>>>>
>>>>>
>>>>>> that ideally supports binary data and compression natively and 
>>>>>> has a helper library that can be included in the kernel source 
>>>>>> tree. That
>>>>>
>>>>> oh no, we'd need to define the schema - there are plenty of json 
>>>>> libraries
>>>>> in multiple languages for users to choose from  and that would be 
>>>>> basically
>>>>> then main benefit of using it.
>>>> Well, we can certainly define extra formats on top of a base format 
>>>> but it seems like it would be simpler if the base format supported 
>>>> all the data types we need already. Doesn't really matter either 
>>>> way as long as the underlying file format supports all the uses we 
>>>> want of it.
>>>
>>> My point is that we are not going to add a decoder library that all
>>> userspace consumers have to use. The kernel interface is not a library.
>>> You are relying on having just one userspace to not break userspace.
>> That is not at all what I am saying.
>>
>>>
>>> The benefit of a common format like json, toml etc is exactly that it's
>>> a format already understood by hundreds of libraries and we can even do
>>> something like this instead of having to write our own parser:
>>>
>>> cat devcoredump | jq '.[] | .foo, .bar'
>> That is exactly what I am saying.
>>
>> The mesa debug tool becomes something like:
>>     #include <libyaml>
>>
>>     info = yaml.read_file(file_name);
>>     foreach_engine(info.engines, i)
>>         printf( "Got hang on %s\n", info.engines[i].name );
>>
>> The external library handles all the file encoding issues. The tool 
>> just has to put meaning to the fields returned from that library.
>
> to reiterate my point that it doesn't fix all the problems:
>
> if you move something from info.guc_ct.bla to info.contexts.bla
> (exactly what happened in the other bug) you may still break stuff,
> regardless of using a better well-known format.
But having the structure means that data will not be added to the wrong 
section in the first place.

The problem here was that we had no structure to begin with. Then 
structure started to be added. But a tool was already making incorrect 
assumptions based on the lack of structure.

Sure, when something needs to be moved, that will still cause the same 
kind of issue. But that is much less likely to happen if we are more 
careful about adding new entries within a sensible structure to begin with.

John.

>
> Lucas De Marchi
>
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> John.
>>>>
>>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>>> will then remove any and all confusion over interpretation of the 
>>>>>> file forever more. But it would require updating all userland 
>>>>>> tools to use the appropriate helper library.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>>
>>>>>>> Lucas De Marchi
>>>>>>
>>>>
>>

