Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C20EF531C0
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 18:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BB710E4F0;
	Mon, 13 Apr 2026 18:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ono6ozsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2AF10E4F0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 18:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776103521; x=1807639521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vGjGqCjb4wIVCEZ2vLlVKDUyPMwxgk4qCsN2gahzs7g=;
 b=Ono6ozsnsQ2VquA+FYO9uQjbI7Hr1qfmacIM6F52uJsaE2W8ZdKWvpLo
 3lb5MQtDabwCfjoGjj1SFVx88WwkNDmhpjETVwg8r/EesZJyKTs6nV1Ma
 MaaWxi4cUs2X5Dyeps5DIPUxtPbXBsb0xN9j4AtK09fiGKOqFAuJrRGgm
 0Iwuobve6uunx3/fFmVM91vF9Vx4Lpj0nhtsrg0GV8XY9fcUhHywOGKwj
 CC5+Z98vao8D0dAfbN18aVUYpjAB9PQfF4dkKKEixgpAMhMhFt9qaLiyJ
 mpI4YJpWKtvBqL/akPWzQXBtB6FlRGJhUd+fSWdrbT28k0WuwMu00A09F Q==;
X-CSE-ConnectionGUID: YVIgSqmJSSuxy4+HUIEMSw==
X-CSE-MsgGUID: Fj6F4gSeT3uVMUbTBVFKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102503666"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="102503666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 11:05:20 -0700
X-CSE-ConnectionGUID: x6udvVJSQfuyYjVWqFH/Lg==
X-CSE-MsgGUID: K2PBMZuqTtmrlVpWh5f9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229792325"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 11:05:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 11:05:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 11:05:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 11:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQvmghdibtVOIaZHMT3jiQmXjOpuS66GoWQ2DhVfu2BbEa6w61QF2TvFGABXbk7aCcBg+/JMkG6ROIaVFwlHImKEsTafKfM+W1cKpICCgzMlU5G1k8RMwpwx1tdlZd72OLiNXQ4HPNcNX9DWyUigjUC+S9wc34nPfIUNO5e/U3mBWN8Z1MbsPTH47LTnmaSTrBiN6H5UDmZeo25teA1k9HKY8XVEtoaFKgPpON9kbLG+vNkhvUYoZJP+RuGf47ds+oASRL9XFtiQ4K4hEfSUglWIPW3b7U1dVXCWSvH7fXKRavBPsyIfF4Jpg2sc1o3kBt0eAU/B5hmAkZzZDQHDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfIfKHx9kO3VVOpA6fPpQaDZyX66gW0WmXvWB1ntr5s=;
 b=IZAPvW1TV1loylVWg8aVcKIt2zzv3dHrzUxjsrF7XyCKewlBhe6enZhw0VdJeG4hN9E+yZhgC2DF7Fhp30HgTK0TqpN5OPpv6oskbm1QddEfXFrtZ3pN9XGAsykinFyYe2ov9/qY/vbFV/WslOjhL2R6zumKduE+X6TqDU0GpJhICBjcLtLYCzo8Lw2upWUISAZdtH/UCiKZMCRsjeyhTEseLX7SDRl515rxAQyiWA4GLSHEoTDvLqlngN5LEeCk6dhqn79tK2Nk9gMMr3uWed2o2QnjUTa/XIxkGoEm1M034+lnjkbCSisnn4cCDeCD77Dygmph4pu7NX3VjA63dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 18:05:16 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 18:05:16 +0000
Date: Mon, 13 Apr 2026 11:05:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <ad0wVf8UhVfhTKPk@soc-5CG1426VCC.clients.intel.com>
References: <20260409231754.528518-1-ashutosh.dixit@intel.com>
 <20260409231754.528518-2-ashutosh.dixit@intel.com>
 <877bqe8gow.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <877bqe8gow.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:303:86::26) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: e80037b4-cb21-4e36-d669-08de9987372a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: kGMzSD8hGmnOxwFmWDYk72HbWoiisZs0aYsiVxRO1R7BbLNvTKNfE0ABOmu/Nnh0hOWGWcuAbt8PzaI9Pr4ZFTtytOfIB487e37DfhLcxdzOPNaZm+amdISWDq0E9nkd5Hg6OiUM6Egg8s9+VtFzuHHWcYEgV2cz1z9jGTlK3VeXqu31m/KKsyvD6anhT/xoms2vYS9dLXbcPQUcbICZgnfGdV5HV8uE4pntuXytuXjUpcmS+enqd4JqWsr6VBcmWx5vDLBxdWfyFDQtaAnqCDJggxQ4Mr5nvlCT1oij3F2gEGOlyiC6UDUhsWDPOncS2jvRApdLeaO4t0J2IvnAmaL4sZIgxB77004EKsuYMNjwZFIy7nH3gnXqMfim1qgYmpbDIK79JpZucV4qW4/0+dywljTFsIxVkhShq8mkICv66WHun1bqY1UeLd+nYQe7ljK9WKBwfI/jFEThELMw0YEd98lJpvpnfz0NsWeefCYLuRZuXuMAursgRf4W16Tu+jiQKSrYXb3SqXN4Mg64mgTSC3tYz+yXeOZV56UfUF39knc45FwHs5Qjq3Cj47Q44xO2XkkD5JqdO1cwz1QRC9ph59hs5RxMZsVFXcEZvfg1MVqEXQr1YmIveu5Dd3m4Lt3aqYLJcZLZWoVKvIKN2EMTLr+o9IgE2BSOM2YsyHADX+3cDcgIzVcaeooxFFnoTAu/IfMGe0TQCrsCaHs+tp8fZvHeJFMxWKmXhyEQvrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVwNlJDcUROMXNjVmxDSjN0VmRXeHdJZzl1b1p1NzJXNFVXZWc2OG9xUEZY?=
 =?utf-8?B?cGl0S1BwZEl0MHRaQ2lXUzI1RWM4Y0EwdkJuM0dlRHN3bjRvV29teEkyV3hx?=
 =?utf-8?B?eTk0WlY2TGtraU9zb0NhVXVvVTZCdUNLcjF5NDV2ZmJCNklUeXRINDZUa3hT?=
 =?utf-8?B?QnN4TnlZOThkMTNnT3RHRUtWNTdPWlc0dzdFUjlXUm9QZVdWQUViMGlmMUJV?=
 =?utf-8?B?Z3ViU1lZVllYOHBYVkpjZ3kyOFVCWldOQTdnQjVMeDE0aXdXZ0JBejFlWWJB?=
 =?utf-8?B?dXY1ODJZSzNCRThic0diaUlKVlU1YWt4cnFOM1Q4M0V5WUM0T0h0UHZoeGhK?=
 =?utf-8?B?NnVjNDZKMHI3VWpwdFlROVB6TStQdGdlRXd2UU9KWUNldlFGQjgxektoN1Ba?=
 =?utf-8?B?UXJPeUllTjk4aU9UcjM1Q3Bya0lVRVE0cWI0ZjMyWEtTaUZSZ0d0cmEzOUN2?=
 =?utf-8?B?S0RkYWt3NGpjRzkvTjlaSTduNEdLZVBqYjVTVmNDS0JwQ2FUUXJHeHh0U1pa?=
 =?utf-8?B?dlBMa1RRUytjbUcyTUs1d21Tak9Ga2JOOWIxU3l1cUlmY21DOUx2QVEyYnpk?=
 =?utf-8?B?NmNKYUpleWlTU0F6ajhUVldXTFFNTXJsOHRtaEp0VldlU05adTQzcnc1V1gx?=
 =?utf-8?B?ZGIrVTNnLy85OTlNOElrVWRuSzJpWDg3ZlJKMHhkTmp2YlVGeG9ZWWlMYWI2?=
 =?utf-8?B?TWxUdWNyS05sc1o4OXhUMzZKQ1JEUEFXVW12TEhCUk1OY2ZSUUFYbTJoOEcy?=
 =?utf-8?B?eUs0dTgvYVlmd0Ric0FRQzFLM0Z6REh6UTlqd3RLWXpjZFlLSjJaRy9EWm1X?=
 =?utf-8?B?K1p3K2ZHOFg5R2FkdFFMU3czOG80T2hLNXJKY0xrQm1ZS1YyMFlzU09kNm9Z?=
 =?utf-8?B?SkJkMTlGYk01LzF6aXVOVXozSitpN2QrK3ZRRzN3ZndVWkw2c0hxUyszTGsw?=
 =?utf-8?B?L0Q2V3N1UzRrZnBQRDc3RGNEeFZudUFxUWtoOUcvWDdDZzBkcTlLQU11NXcz?=
 =?utf-8?B?b3k2cG9VRjB4MHFEeWI4bnVmallmSTRxT2Z2Vi90ek5HZFpEUFFWeHNDT0pi?=
 =?utf-8?B?dzNJODVET20yRHFvQUZJV3FIZEVMYTJ5dHFtVmx1cUVCci9udi9YVFRNYmN5?=
 =?utf-8?B?LzRueW5jS1FDblU2WVRqU3JLNS9KaFAzZ0FVUzBIL3drVlJ4N3Evb0F6ekJl?=
 =?utf-8?B?TVBOeEhqaXhHdERmWW9NU3dDK3BsY0crOElJaDFNaFp5S0dWTUkxU0YwcnAz?=
 =?utf-8?B?QWRsYTBsT3Y5R0g5ZVArVndidzNsa04weG5mU3prQjlpSHhkeFVwcHBJUzRr?=
 =?utf-8?B?N2crblAxekl6UVZWMzhtTjBkY3FxS0xzenIyUnQvTHBaMGkvS29uQUZjUncx?=
 =?utf-8?B?T1pQTGxEQ3RNNmo4WTdmOVJ6c1lOUXVHOUlQaWlXOWZTY3ovTkJCQ0pNdSs5?=
 =?utf-8?B?OEttdmFhUWxXc3I4eEZwcHV3QUxEcVQ2anhqZGNIbzhIMjF5dTMrWkNuZDVZ?=
 =?utf-8?B?MmZGU0RrdGorZFMrSExITUJ5OWdCc2h5TmFpcEtINTNLcUc4Ui9sMDZtRjZI?=
 =?utf-8?B?QngxVUtienFXRVdkSjZsZWpMd2RkQ3ZLRElzRWo1WFdKNnZHU0theDAyWnB2?=
 =?utf-8?B?NDE1ZDAxQ0w4VHRub0FFOG9WMHE4eEtaNmFqWGQ5bmFSTVpBRzk4ZisyZ3lm?=
 =?utf-8?B?Z0VpU2JlZXRQK2JzdG14bWxWMDRoYnVLV29GVmdYRmNBT0ZSMHU3WjYzTWpO?=
 =?utf-8?B?MENhM0hhL1hKMmxOajZ2Z2IxSmhEUFNTd0lGa0cyTmFOWVVkQjdyK1BRNTRI?=
 =?utf-8?B?NzdJVVJmSThKdTY2dktldm9CZE9Rb0R0SnhrbUdOSkRIWmtIMWtkRmozOXAz?=
 =?utf-8?B?YitaNE41L241N2VNcHdxMzBha284MUZXTkFxanlmck5aaGlDQXlOczFKOGZy?=
 =?utf-8?B?aUdZS0h1emlhZVNXL0NQL2l4NHpRVFpEUURHOGNnaEVhVVdlN1lXNWV5THhZ?=
 =?utf-8?B?T05wTERMdlZKQ1g5WlNOMTBvS1QvRWZHWHdVOVdVK3dTTjBpbS91cExBT215?=
 =?utf-8?B?bXVydWsvOEcyenRuWUEzbWU3V2lQRGRPaUVNWmRsTHF4NnpIMkw1eWZONVhj?=
 =?utf-8?B?UDVnWENHN0UrdXc3TFFMRTBHdTBmblVxWnVXU0RwR3pxb0NrV20vdTZNY2xv?=
 =?utf-8?B?TzBobjhKVFpQckszcnJhRUNnYWR4dmlvL09mRG9TTXUrcVRzOFpSSmwyUGxS?=
 =?utf-8?B?SnNPT2RUbzM5d1ZQZEIzanJXSCsvNThYWjArUWVwTWEraUZIOWlHb3VHc0JG?=
 =?utf-8?B?bHFMc1hROFpSYlNNd3ErQ09ja25RRU02cTFNLzhYQkZaYUZrWTliekNONzJ2?=
 =?utf-8?Q?Gx0Ekhm0bv/bCfhWmkz4kesjEJ/8DX4sLIowu?=
X-Exchange-RoutingPolicyChecked: IqdFH2CTe+9AX2ekjM+I40LUYvzIdbW5x8Z3hobeoS3ETeOgCFKP72x5PKLQxrSCuaK4tkkNZHJMawz3TjLvZft4UoHLuxcx4F1AyJDV1gnEx9EoqN19HLnpdjdBQlq70m6Q0ytm/oh80SoWM+euBOH0SRO1VR6XDwR4kJQP8zd5ceuFZ8gem24IMqTGOtxBafF82VBLGI2RChE+zKeQHuB1gOw/9oteaZ7YxBxOrnSGS0EtNKdxYRWOn6UtouJNCFV5IQ/1a4IT8C1PGlNP5Picu2R7NqT2BqfRK2ZOQH0rOlo++Xs8oEM9vaFmjAi9CcI8vVvo551TSFVd/5FrrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e80037b4-cb21-4e36-d669-08de9987372a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 18:05:16.1276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cCZivG6LsvwCMeWPywBvIrqKzGf7vUyKrJvMZ/VIM34xN4gzVB+9pEA24pNBCjeD44DLXT7qPhSq5rC8+J4Ro/HmJlUVOhZwbqM3o3NMak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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

On Fri, Apr 10, 2026 at 05:49:03PM -0700, Dixit, Ashutosh wrote:
>On Thu, 09 Apr 2026 16:17:52 -0700, Ashutosh Dixit wrote:
>>
>
>Hi Umesh,
>
>> +/* Because there is no iosys_map_copy_to_user() or copy_to_user_from_iomem() */
>> +static int xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 head, u32 len)
>> +{
>> +	u32 __user *dptr = dst;
>> +
>> +	xe_gt_assert(stream->gt, len % 4 == 0);
>> +
>> +	for (int i = 0; i < len / 4; i++) {
>> +		struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>> +		u32 val = xe_map_rd(stream->oa->xe, map, head, u32);
>> +		int ret = put_user(val, dptr++);
>> +
>> +		if (ret)
>> +			return ret;
>> +		head += 4;
>> +	}
>> +
>> +	return 0;
>> +}
>
>Unfortunately, with this copy_to_user() implementation we are seeing buffer
>overflow, implying there is significant performance impact, even when OA
>buffer is in system memory:
>
>  Starting subtest: non-zero-reason
>  Starting dynamic subtest: oag-0
>  (xe_oa:6798) CRITICAL: Test assertion failure function test_non_zero_reason, file ../tests/intel/xe_oa.c:2693:
>  (xe_oa:6798) CRITICAL: Failed assertion: !(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW)
>
>That is, we are unable to read data at the rate at which HW is writing
>data, causing buffer overrun.
>
>Therefore in v3 I have basically reverted to the copy_to_user()
>implementation of v1, except that I have taken the copy_to_user() out of
>xe_oa.c and moved it to xe_map.h, to make that implementation "official"
>(and OA code to strictly use the xe_map layer). This seems to be the best
>approach to me, it avoids unnecessary copies and works correctly on all of
>our systems of interest.
>
>Also, the previous code, without this patch, is of course doing this exact
>same thing, except that the use of the xe_map layer make these assumptions
>explicit.
>
>If you still don't think we should be doing this, I can try to get a second
>opinion about this patch. Thanks.

Yes, please include someone who can give us an Ack or some inputs on 
this approach because we are hitting some issues.

Thanks,
Umesh
