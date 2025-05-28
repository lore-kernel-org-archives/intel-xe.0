Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393CC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07710E673;
	Wed, 28 May 2025 16:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff+2vns+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B7E10E670
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748449026; x=1779985026;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=epnaZkw/bCHBfZNj2n17UWCJCmbdga2iNiiCJGiOzmk=;
 b=ff+2vns+3WiQPHcwcE+ohqQNnvYLArVbjaCrtSzDzgCPjuZUS97j8HOS
 ifAcwkQQcFuNERXNWsQyTl6X08QaEpEsXkHhxdXdwy7cl6X8rYmXwPmcs
 rultvmphNjAQldjppxfhO2kuhZsxIrp6/8DG6oUfX7fiB6izVtmS+5aci
 acY+rPc5MniRec7Rdxl8Yhpxo/rtm5MU3Q8bE+B/AWSv3+G1eOdMhYZVF
 O4FyUHSgOSFRcxhu7/Kk1Di24YofC46tzoNUwDjMSEqOSmt6FmF/mZ4b7
 DhrSiuBVtq6bef5KwugSagLrCJgVQt8RZTnEZXni+Tgb4OWW7XyO1T6sk w==;
X-CSE-ConnectionGUID: axY5rFTURgawfIFPifBOKQ==
X-CSE-MsgGUID: qR5E8GhITCWHdPTvX8KWKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50636866"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50636866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:17:05 -0700
X-CSE-ConnectionGUID: GerpeJsMRHK7JuQEg9dfGw==
X-CSE-MsgGUID: Hg8vsxFaSCSXhoIMPZaEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="174288640"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:17:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:17:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:17:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:17:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By87zEUZYZyM3MbjLiPJSop/I/+5YjdEpVtnjQeGGL6tAiOC33695nRqTpzUCD0RLnmqPhSIA9D7AtrdTItU7ialDYm9tWw0mbXcIxX7uLKdJouQ8jS+DCebESqBEhJTc6nq3RScHoeO7vmWh82+LwrTpIeOaAz9Feq3v066v8a+t0B6VWDd0ZZ17Fimmb2rMfxxMGONEMnA1P+FN7FPMxYpmTaYYw0Drom9Ciw92P0J69e/dmyR4GVjMXi6F2dOTldDQj/fqi/Rg433aXb7c8J8KFZJqYA8x6BJlxsiuWC9WkkpJhyDaTzlmffKyzQKbgSW0en/C+AEhASLhTyrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiixNWMAYsiZ/idokpmzWEp3DMC/KLFmPb1S90pUKvU=;
 b=BTAumB6jyt7aGQNRt4vpzW1MgWoiXWaBxL3h0i+BpnG5+Xd9fDrkQ4KWs3ee1PwhL/s0K6DqNwiBO8FsM+HQv8R40CkP6FU+wzNqJBBtHW0nI8mxFbR3T/80nl5ZIV91nrAV/9f2h0FnuAIUAuFAG81Rmq9bhZNws8mSAgSAUhktJ2x0ugEtz4JJBnY8158b2yoUj+OYGqsz9M9xjDRC5dNCDzSD3RtAbbuMAGo0GrFeMN/0Z4EguUzR/uVH4GlLvHHdtDvmnvJtw/wtdO53ni6pGuR/sGM4VO8LXzR2GpBw96lrWum0lSHjPgfBAnFZkvNm/5+WWgvBlGAq3Pepag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 16:16:19 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 16:16:19 +0000
Message-ID: <26c6fcdd-3766-495a-b04c-26bdf4b1327b@intel.com>
Date: Wed, 28 May 2025 21:46:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
 <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
 <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
 <aDX4X7X6GAZcaBBv@lstrano-desk.jf.intel.com>
 <d9a23e0a-8173-4c30-8f8b-1f9dbaf7eccf@intel.com>
 <aDc1NYKT/0fFlt1k@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDc1NYKT/0fFlt1k@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f75b47a-14cd-4106-2048-08dd9e02faf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2dnMmdTZi96ZE9uVjdGVHdEbHJKZUFGRGk2U09IQllnZjVLNmY1RkJZV0V5?=
 =?utf-8?B?V1o1dVl3c0VKakk2RGdEZkFBVUJlbGxoa0VxMWJTVWZCYS82WHpBR0hTbnJx?=
 =?utf-8?B?RXpQSFppRVg0dGQvUjR4NnpoQjhudmtaR1AzU2ZaR0ZpQXlLVWs0aVNOQW5O?=
 =?utf-8?B?Wm5aeVlGaThWc0RDK0IxN2hwNG5neVdWcWwwVk94RENQZytLQ3hyVUR2eXkx?=
 =?utf-8?B?ejI2WHF2V3VCbXNkNUF4Nzgrb0Zuc2RIeTR5TVR3UEhFQXJxODgzSStiWENP?=
 =?utf-8?B?cS9TZjJscW0rWXhYV0ZsVmF2eERnU0FHcWtXcmFXTGRqUmZCaEwzUEZlTnZv?=
 =?utf-8?B?NDh2N245MG9IUHRmRWpRWjludHR3NzNZQi8wMTF4NDZialQ5d09VWWRKdjMy?=
 =?utf-8?B?T3FlRFF2SzkwU214NWhjMkZLaXVsc2FuTjBHTjNWclJYY2F5OGh5aXN6ZnhV?=
 =?utf-8?B?c1QvZnc4M2tOVmdqRFJvTEQ1WWdKdmJScStvL05CaVpRdmZIT0NCSHRuamt5?=
 =?utf-8?B?TkEwMmI5VGFPK2lBMWJLMXo4U1owZzJmVzFHQW5MUTdWeks3aHBMaURFcE5X?=
 =?utf-8?B?Y011WW85Y3FvK1ozL1FPcVRiWUhqMWs3ejRJYmFVQm9tTkNXby8zclZoMnZl?=
 =?utf-8?B?MytrQUJUbmdpa3BiYUhlaEZ3WTRkU0ZvUjdYbFAvS1p1ZkRmRFMyalBUcE13?=
 =?utf-8?B?ZU8zOTVNclJEVVd2Z3RsbFN5YTNabGRrWUlMVzh2RUNJVFVYdHJzZmtJczBk?=
 =?utf-8?B?UU5ldDRwa29VZUw5MERVUnVrMzVnZkJ3WXNiUndLSmY1U3hWT2kxSVZIOFZx?=
 =?utf-8?B?dFJoOFZZU3lZajk2MUdxb3RJWXc3SkxOUk1VdDlEcjVsSmRSUkN5Vmh1d2dL?=
 =?utf-8?B?UXlyKyt3RHVXaWFEZ0p3UEhwaGpibTdvZ0ZtNXRWMWVtTTVEdlgzWmdiOVJq?=
 =?utf-8?B?ZmYyaWpDYUw2TjRYbDhKMzNkTjBaREZYOFQxUE9XdjFMVTNNUGlBc2w4NWli?=
 =?utf-8?B?YVkxOXpxaXBmOC9TUVl1eFU2ZGUveXZCa3FQb2h6MVFTUlRoWGJXd1FwMVFn?=
 =?utf-8?B?by91R0lCTm5iR0NodkxaSWM4Uk9DV2ZBcFRoUjgrMExWK2pwSjhXTFFqcjJn?=
 =?utf-8?B?Q3MySDR4VUl5cFpZS3pqNHc2eTVURFZkYnNWYVkvbFFUUHArQjRxUFpFcVJo?=
 =?utf-8?B?SzJDVzJ2V1FiMXRQMVlKTFdMT0VGVVVtN25KNTI3SmVMY2pJa0s0WTB0L1hy?=
 =?utf-8?B?ZWRVaHhYZGQzanVxSTJ1YUlmWm5RSWFEQnYrQW9XaDdMY1JtbHFlNjZYenA1?=
 =?utf-8?B?THczU3lXRm1TMGZ4ekg4Y1I0RVhmOWhVZUNJZDd0N1NLakE1aHFGek0rYzA4?=
 =?utf-8?B?L3VUaXY5K0VuSHdhOVhaWVV1YkF2UTdaa1hkWjhGQ3hkOGlkWHkvbXBWSGdO?=
 =?utf-8?B?OEU0WVJHNUFDVWRpY2ltbTRtc25UZWFNZFpaWHpQeVVhb3ZPckJnNEtpUG9h?=
 =?utf-8?B?RmVvbjFwelJwdWFKQXNpdklOZ3RCMXdYazZTaFpBM1NnQXdmbUh5bC9FWkV5?=
 =?utf-8?B?Z0p5RjZkSlpkZ1JYMCtuN1YwemZDcWtPbkY3aWVya0YrQm1mUXU2ZGJKQ0dZ?=
 =?utf-8?B?TGIzZ1AxNk9WWkhJcExmRnJ2WCtIckI4eG44VUNnZWhzRWw5eU90OVRGNWpX?=
 =?utf-8?B?NXU3N0tuekdZY05Od1NIY3hOYVhaTERPUldoNTlRUktxZU1ydk9LK2poYUJi?=
 =?utf-8?B?ZGx3b2JXdTJaZTgrRnN1bk92S2xic01CQ3c1NUxraXhJVERxZnBzd3M0VVNC?=
 =?utf-8?Q?SHD5MXEMzPiIHEqjP7lC44PvKKryDY+gH31NM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpzQjFhanhveHJlb2wxazd6YnptZU9iSGxwYW5obTBMd2ZrcG81L1YralNT?=
 =?utf-8?B?R3h3Q09yYTYyektDOGIwckFyK3NLT0pHb2pUNGJqam04Q1V4VjJzbnk4RWpr?=
 =?utf-8?B?MkhJWURJZ2N4eVRBcURURG9EanpQZElBWGU3Z2hldXZMeE1TQWcxL1dIandi?=
 =?utf-8?B?NE1FTStsVHN3a1djQVBaWndRUWFLS2pYaUxhVU54Vm1VOEhNcktvRXFZbUR2?=
 =?utf-8?B?WDZLVlB4TGF3MUxncWlUQkdYRkd0dWplaWpvRCtNZ3V4Y0ZXWWlXL1dLa1Qz?=
 =?utf-8?B?dnZUaGl3RVBwVlBudHY4L2hTekZSVEdrTnh6QjdHV3ZFTnVxZXNkYXVvd0tY?=
 =?utf-8?B?eklBT1NGMGpuQkpGVTRqZGcwSVBsYkdCWWxyWnRxMDBNejRleG1uTFdDNFZq?=
 =?utf-8?B?WlZBVHcxZVRaNk16aDZLSGMzeEl3aUVXMmw2TEluWTROazBhK25OWVpseDRs?=
 =?utf-8?B?c256R0ZwT2xHa0h5YXBrdURNWWJrWHMyZ2gvNDhTcnk4anFxNy9xdzJSQ01D?=
 =?utf-8?B?RlRLdkwwRHFPVFdpYld3OE1kOHZEdWFRTTA3UVZWQUlMZk55OTd4Qld4WldK?=
 =?utf-8?B?YW9wWDM0UWZXWTArSXEvd0lwV2xkWDYvdTV5ZllFcjFHM1J2SDNCY256TjAw?=
 =?utf-8?B?N0lnUTN0Y1VxZG5RQjZyWGw3TWlQOUNLWGhGSklDSVRXbmQ2cmpJQzJQZGlI?=
 =?utf-8?B?UUtrSmpkMUlkQ24xWXp1bmhuVitOeWhuV0REUEdBVGZ2VFZBcXU4OFVHWVYv?=
 =?utf-8?B?Vm9PcVI0a1Q0bGJYR2NwRnVXQXNZMUdIbkZaakdqVEpXd0JXU0kwTzEyQ2sv?=
 =?utf-8?B?NjBVUDZseGpmTnMwaUNmc09JbDdWSW1tVnpXb0pYOWtySHZPYlh2U2ZYZU1u?=
 =?utf-8?B?anROT29BMVY4VW5GRmlNclpxOWtiOUNzdTBoUFhRKzVKUVNjNTk1akdYZkU0?=
 =?utf-8?B?QzMycnc5NWJzZWFxQ1FaTTMzNVJuTFVkUXJNamFIb2o3Y0F4TlBYeXk2TnhG?=
 =?utf-8?B?R1N4aHdHY0NvbUpBZGZmM0Y2eHZOdnY4aEoyd3BEN1RNMElwNHc5OHdTZmwy?=
 =?utf-8?B?ZlM5YW5QWTNMOEdFTFRpN3JSakp6YytmYnJzcEY4SnFFRWU0bHNpN1VMWjFD?=
 =?utf-8?B?dVV5L3plOVdGblFJK1BjK1RQcUd0ZTZtdUN0Z1RaeHcycUtSWkRWTURvdE5J?=
 =?utf-8?B?YmUwVk1XSnRsVkZjblhVNzBrWnJ3NGlLTTV3U2U5dWs2NkxzMlIzcTVpaTBF?=
 =?utf-8?B?Qno4dW04UmcrQTlDR3RSM3dMWmVweGdOUTI0U3FobVpZL1RYVTREaWtxM0dG?=
 =?utf-8?B?RTZRbUpxWG85VzBxM1g1c2trNE8zWE9sZzRLQlZlWnI2NGxOTlJOOG5wNmpx?=
 =?utf-8?B?R1JtaFUwN0ZKSUtISjRnNXAxKzFvb1VMNS91QnlpTUIwekRtRnUzQjU1SzN5?=
 =?utf-8?B?cUxYbjVJcFBCWkg5S1pGR3c4V01HMFJSZTJPTUNyM2l6VWIyVFVpdDhrS2I1?=
 =?utf-8?B?ZEtrV3RacUZ0L04zdk42ZFlQT2U0cHUzS0NjaVRlUW1VUFJwQSt2M2dWZ1VR?=
 =?utf-8?B?M2d0M3IwVTJDNGhkamFVRlAvNW51QmtyZGRZTWRrV1ZyV2ZLT01ibWZnUUg3?=
 =?utf-8?B?UlAwbHJJaWZMMHVYQS9GeXdBalY1WWNzMlZqbG9rMDJEQjcxcVRBUCtNNUI1?=
 =?utf-8?B?TjJlZVNNVlNraVpHUUdGOTUyeGFUMU95T25RVzVtZW9nYkhyckc3YVZweE1P?=
 =?utf-8?B?YVRKY3MremthWVRHTEdudFJ6RGdyTC8zdnBsdXNKZUFJRW5IUGtScUV3OXhq?=
 =?utf-8?B?MWdVNzE3UUJxUjI0amIrMUw0bDYxclV0YXRYK0xaNWUwYStNWjdGcGxVdTQz?=
 =?utf-8?B?eG4wTXJENDZRVVpURGRaZnhpbGxJRnJ0K040THNMdHJST0dCZ0VqREV5T3JZ?=
 =?utf-8?B?V2l6cGhla3A5aTR0ZFIydG5ydzRIeXBYWXI2UXdoYmNrSVNiQSt1dDAwVDhp?=
 =?utf-8?B?Y3NsVEJnVXdDS1dhaEhzc0I2RHhNQ1ZHbFprZUE0OVFjbFpTOG9qQlRxWkF2?=
 =?utf-8?B?bDREWkVwMlhjU3VzZWN6YmNSQ1hsc3Q4RDhsYTFDUER6S2lkS2RjL0FrK0xn?=
 =?utf-8?B?SGhBMVR4ZTZodndzb2dxdFlnZFg4US9SazhlUzJROHpzSFNCRER2ZUtUZTgr?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f75b47a-14cd-4106-2048-08dd9e02faf6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:16:19.7604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yHam9s9GdaDwTkf9V2fcj9JzPQjqqJM7Efsk3ZF11FgEr8riAvNM7r+6lMN1zXPQi2trE6EL3uMi6nuB1TqxUg8q4X3TZxnUmGZ5+lIp2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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



On 28-05-2025 21:39, Matthew Brost wrote:
> On Wed, May 28, 2025 at 11:03:31AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 27-05-2025 23:07, Matthew Brost wrote:
>>> On Tue, May 20, 2025 at 02:57:45PM +0530, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 15-05-2025 00:06, Matthew Brost wrote:
>>>>> On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
>>>>>> The attribute of xe_vma will determine the migration policy and the
>>>>>> encoding of the page table entries (PTEs) for that vma.
>>>>>> This attribute helps manage how memory pages are moved and how their
>>>>>> addresses are translated. It will be used by madvise to set the
>>>>>> behavior of the vma.
>>>>>>
>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
>>>>>>     drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
>>>>>>     2 files changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> index 27a8dbe709c2..1ff9e477e061 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>>>>     		vma = ERR_PTR(err);
>>>>>>     	}
>>>>>> +	/*TODO: assign devmem_fd of local vram once multi device
>>>>>> +	 * support is added.
>>>>>> +	 */
>>>>>> +	vma->attr.preferred_loc.devmem_fd = 1;
>>>>>
>>>>> Assigning a value of '1' is a bit odd... I'd prefer using a define or
>>>>> something similar to indicate the intended behavior. I noticed a few
>>>>> other assignments to '1' in the final result—same comment applies to
>>>>> those.
>>>>
>>>> Sure
>>>>
>>>>>
>>>>>> +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
>>>>>> +
>>>>>>     	return vma;
>>>>>>     }
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> index d3c1209348e9..5f5feffecb82 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> @@ -77,6 +77,19 @@ struct xe_userptr {
>>>>>>     #endif
>>>>>>     };
>>>>>> +/**
>>>>>> + * struct xe_vma_mem_attr - memory attributes associated with vma
>>>>>> + */
>>>>>> +struct xe_vma_mem_attr {
>>>>>> +	/** @preferred_loc: perferred memory_location*/
>>>>>> +	struct {
>>>>>> +		u32 migration_policy; /* represents migration policies */
>>>>>> +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
>>>>>> +	} preferred_loc;
>>>>>
>>>>> I'm a little unclear on how these variables work.
>>>>>
>>>>> In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
>>>>> MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
>>>>> DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
>>>>> mean or how they're used based on the final result—could you clarify?
>>>>
>>>> With multi-device support the idea was to have flexibility to move only
>>>> system pages to preferred location or also move pages from other vram
>>>> location to preferred location.
>>>>
>>>
>>> Ok, I think having bits set aside for this makes sense.
>>>
>>>>>
>>>>> Likewise, I'm confused about the devmem_fd usage. It can either be
>>>>> assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
>>>>> as a region. I assume this is anticipating multi-GPU support, but again,
>>>>> the plan isn't clear to me. Could you explain?
>>>>
>>>> The devmem_fd is intended to be used to determine the struct drm_pagemap *,
>>>> which in turn will be used to identify the tile associated with VRAM for
>>>> allocation and binding. The changes that introduce the
>>>> devmem_fd->drm_pagemap->tile [1] linkage will be part of the upcoming
>>>> multi-GPU support.
>>>>
>>>> To ensure that the current changes are easily scalable and can be extended
>>>> for multi-GPU support, I am defining devmem_fd in the UAPI and using it in
>>>> the KMD as a region placeholder until multi-GPU support is integrated.
>>>>
>>>
>>> Hmm, will this break the uAPI though? e.g. How does the UMD choose
>>> between region and FD at the uAPI level? If the answer is once multi-GPU
>>> lands it is always a FD rather than region then we really need to land
>>> some of the multi-GPU patches at same time as madvise - at least the
>>> ones which export memory regions as FDs.
>>
>> I have tried to streamline these changes in the latest revision. Let's see
>> if they make sense. This is with assumption that in a multi-device setup
>> devmem_fd <=0 is actually invalid and doesn't point to any remote/local
>> tile.
>>
>> A value of 0 for DEVMEM_FD means the default behavior or VRAM of the
>> faulting tile.
>>
>> A negative value indicates that SMEM should be used.
>>
>> Other positive values correspond to valid devmem_fds. With the landing of
>> multi-device changes, if a positive devmem_fd is not valid, we can fall back
>> to the faulting tile or SMEM.
>>
> 
> I think that makes sense - so then multi-tile (or more specifically,
> multi-vram regions) within a single device then is an extension of
> multi-gpu.

Correct

> 
> Matt
> 
>>>
>>> Let's loop in Thomas on the multi-GPU assumptions too to ensure
>>> correctness.
>>>
>>> Matt
>>>
>>>> [1] https://patchwork.freedesktop.org/patch/642773/?series=146227&rev=1
>>>>
>>>>
>>>>>
>>>>> In general I agree with the idea of xe_vma_mem_attr though.
>>>>>
>>>>> Matt
>>>>>
>>>>>> +	/** @atomic_access: The atomic access type for the vma */
>>>>>> +	u32 atomic_access;
>>>>>> +};
>>>>>> +
>>>>>>     struct xe_vma {
>>>>>>     	/** @gpuva: Base GPUVA object */
>>>>>>     	struct drm_gpuva gpuva;
>>>>>> @@ -128,6 +141,13 @@ struct xe_vma {
>>>>>>     	 * Needs to be signalled before UNMAP can be processed.
>>>>>>     	 */
>>>>>>     	struct xe_user_fence *ufence;
>>>>>> +
>>>>>> +	/**
>>>>>> +	 * @attr: The attributes of vma which determines the migration policy
>>>>>> +	 * and encoding of the PTEs for this vma.
>>>>>> +	 */
>>>>>> +	struct xe_vma_mem_attr attr;
>>>>>> +
>>>>>>     };
>>>>>>     /**
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>
>>

