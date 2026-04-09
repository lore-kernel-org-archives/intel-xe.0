Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A346F36B8D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF198921E;
	Thu,  9 Apr 2026 23:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuueAw3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FFD8921E
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775777444; x=1807313444;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iaEgJgPdW9r9NEetsSEZ9UxUCY8gQzXGwElz0VoxXiI=;
 b=MuueAw3UgrTToieMiSC1RCayq2XwbFYY3QIh1USIoASA8PMoUsnmZ0b+
 u8chSNPGTIbwHX1klvPVLeEKFAutbsbdztgqVVHhKcADmyCFrrga9oUxz
 eFsVxtMf1cjhQTqqvqPg/MVN24pWG8bu0nkjfdDnS1MMc3fyHoAxBgQ6B
 X/ER9YbRZc/7PXW8QAUtpcjZYnbRNl2VIVYmGrpL3Hv7W+UiMi0NU6k6F
 rNmocIV8XxpNdtlB/aSxkUxzzZW42TerXIEGmvVF82wjAU/BKnxBSqDBJ
 P2wXCc1BnRNYn2VTV9nAAsDYnwaDp80qjmVhEWrthP2juKsKWbuhWMExn g==;
X-CSE-ConnectionGUID: QdAqbD/xRayfnNlio3ltKQ==
X-CSE-MsgGUID: mW3z05K5TgiI9jf2eho/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76979075"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76979075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:30:43 -0700
X-CSE-ConnectionGUID: b2JZEcFPT1mFE9MSa3GN5g==
X-CSE-MsgGUID: kRcWO4LJSxixOv9adWk7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="224182093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:30:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 16:30:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 16:30:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 16:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V34ebh/DqWgbO5/ARknil9So7iNpg14MjBVtYMZeA3txZCk8nSrBdBJpZqg0AwwJDZrg2m0qwNvHHxvfmcKkM8S7j2Th8CMZ1m2qgW/bCj5S+u8qKqnDogWsstrNuCGOVs1dm6BN2z+R7PwtVOoOXD33APWAuAHU3LON0Av3ImAy87EFOEJD9TlchgNx3Y05H1ovz0rutGnRuei0E6RtAKP/CVkHU/Az7IYYS3Qky0Bn+IMsLf8LOvn8t3V5/urvIoQ2HvkU3sXQwm//cRuASkhCztxj0/q8e0J26UhBhDB+yvu9/ozxzIRJ9qX2N92wwDeQ6kqjj8atrQ1+uqKRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+eaO+XBWy1pJYYO9ziweafQ9Aw+pbntsw/m8ZelHAo=;
 b=AuyY7pwraHSyLMWLFek3oc1jbFrp5KzvNyg+WsawWeKnvdj9RPPWuYDo8BYgknC/nTHeDXLaUPYcvk1l0lQCEFe4rkzoS2BOZZS7XLwkCy8O4WVpaVDnY19CscM5FcOEJF4T6M6BdwuvD1m1RLomJErALz03xwaZRl7p+JL6RvgoysyLbsecXySDTF3uWaS8mqnUUA6YO5iRwMfFzYo8btWEIwX4pkCAORewztM26fn3FlxMUznMAPRZPiplJmdxkP/bjKhb2AIEmlVIIL4NBZi6pb21TKrUaihjLdWj1s2a80eKWtTS13DIFuLpjn6Y3b+8KJndQ+IAeVYKFj46Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ1PR11MB6105.namprd11.prod.outlook.com (2603:10b6:a03:48c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 23:30:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9791.032; Thu, 9 Apr 2026
 23:30:31 +0000
Date: Thu, 9 Apr 2026 16:30:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/multi_queue: Store primary queue and position
 info in LRC
Message-ID: <adg2kV/mMoqiU6A1@soc-5CG1426VCC.clients.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
 <adgTS+djMkyIh/8h@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adgTS+djMkyIh/8h@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ1PR11MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5bc44a-5e96-4c90-fa71-08de968ffd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Zt8VSqGmUIlY8kIYo4IwIIyCCw3NDZXSLL+nxogT5KZN/iEi4RYHTRQlr2t+veIC86NtWeVGxw2cvaExwbqzLbnKe8Xxi1h2/AncXk9E1WyMMI8iOH/z/Vzt1B1tNOIHTAmj8itCEFEMMaLsYpEnz6As2tYK2jrmJqSAuaj4HAO1OGGVsw66UalNbu9fLXNdcXkiqqtWSEdd4MNYymGFhCkBKpdKO41/JVtR5NkQFMjOMGHNHTULO/mWvXfxpszIG7WtGsSfYTH4C2eVDBVh3kr3QX40UtaZKCwomg5V6gNjd5YKsY4nUIvZChj2rda7pKV5MzUake5eqpeEblCk+0/TTVtvASnYOfs1Daz6u7kL0/SFcaRoj026fwDbDkX2PCBlBbm5NHdwrhRS+0ltlp6/+xKZLVk2n1h1QhKY4Mo04PF6GqM+/AKXyR7sUM7d1xl8aA7fQg1FIB19xfjTXtw/4zA+ycqc66FhgvQcEzd+p/WS1kLn7NWdDvNFncp0Zs4KAnfKzckqX/rCeRqrD3eTApnAh/ilLpKa1B7MHdOkkvBDlvu1huLhsSzIMIULRWHL9gVNGJY9XoMQT49dcSAG5IkDq0lsN2idchYUUMo9JXQly2aYnVvHm1eEgnHujNVb7/Cn+cX2gCOwqX+e1ykLubwOABbQXPj+1aawwT+QRyEP1KYKggVS8gVj21UhqrZm9Ch4URcHl/vB+b75BDBzSr7j9eZJZ2ddMf1nS9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmF3aVZINklMMmNGeWZLOWlpMUQvdEdNc3Fnb0lFZzMvdmFnNFhmd2srNTVM?=
 =?utf-8?B?MG1CSkF2ZE9XTVpNZkl4cVBNc245ZGZzTm4vZmxlMFo5aDlqak5CNWxTcmJ3?=
 =?utf-8?B?Zk1ydEpjWXdXUTAvSEJWYUM5TmUxVmFTditLN3VzNHU5cE0zaHpEUlNGNUJw?=
 =?utf-8?B?MCtoRzBpQWZCWVdrWnFRbWxKYzZ4QjJQeUZlSGNPQ09FeXFsS0FHanFGcmZF?=
 =?utf-8?B?YmZMMDViV1J2dHFmbmlYM2FIMEdnRU1oYU10MDgzejVpUW80RzBHU1h0bnFi?=
 =?utf-8?B?QU5BcW82ZXNVNnpwMExiZzdaWW5qVFpnTStER1d3MU92YU15WTVlbHkyQWhY?=
 =?utf-8?B?S2xGdUFQUEJ6bHo3cWRMTVpsUWhieTRzZ1RQOWNON25BSTJpUWhkU2gzK1JG?=
 =?utf-8?B?NVd5ak9LU0Q1WGxWa0Y1M0xWZU9naElNaXNGSEF1K0FTVFYvR3cvL0UwSHRQ?=
 =?utf-8?B?U25nQ0NMdm9OMmVLQ2pIcVRqSndnYm02VjZWckVCRmp4MEdxWXdORmtySE9H?=
 =?utf-8?B?SUxqQ3VhTHNTMzZJa24wN2VRZlA5NXU4SFZsVkMzaE5hU1NleXUyMXUzRHNT?=
 =?utf-8?B?NWJBbjdpWGtVZzI3NlM0VHdaZDJpdkxoOHAwcmpvSUhuVXJIM2ZGRTJCbHdx?=
 =?utf-8?B?dEpuK2ZXb3dnQXZHZFYwK1MrdUxGTzlyTXM4VGxiUmZPRWtHUnRLNEVKbSt4?=
 =?utf-8?B?bmtmMGdXQXQyYWd2aFpLbUxVcE5GMDRSUCtZWjFNMG9POS9PK2plcFlJV05H?=
 =?utf-8?B?NXhrUForS01LSGUybTlYN1VRaHdUV1BnZkNPY21hOWxVNTI3Y2JXQmoyczJB?=
 =?utf-8?B?Zkhnd1k4RmN6Wjk0cnM1U2FRRk5nQVp4SzhVZ05OUm05UGk5cmZQNW1DaXdl?=
 =?utf-8?B?OEcyVTZOQXNBb2hkdmg2ZFFCekZ4YlpuUTBLbVVsNkVJRGdhblNSSlhlSkwv?=
 =?utf-8?B?WUJCWDdoam5hQ1k5Y1RIWW4rcHI3RkkzQnUvTDNCbDd6Z0hPMGVPRVJ2Q2dN?=
 =?utf-8?B?SUtIK3NxRXg2RFVNUXY0TTU1Q0hBVW03bk1zd0Uya3RFaXNkQlRHTzM2b0dq?=
 =?utf-8?B?aFJvOXo2bW04dUU5N2tJR3BPQ25mVDdaQXhhZUdhVm9GamJFVTZiRWtsUms5?=
 =?utf-8?B?YW9sMlBhWFZEQ0RCdEdCZXZKcURtMG9NWGdpR1hsTFlOVlcrekEyVDk3SzdF?=
 =?utf-8?B?Ly8wQk9tN2w4TExnaXFyKzg4ZnI4L3c1LzhrbHlTYWZRbmhYeWtGNlpGdzM2?=
 =?utf-8?B?M1ljUGRCQ0JnZFZ5dUVHeWQrMmRpQ0phNWozWlpFNkN6YVR4T1RjTGsxYkc4?=
 =?utf-8?B?aEFLcjU1QTNQMWF4eml2bWp4dWNESXhJZm53YTl4ellBSVNDUEgySHlYRkZr?=
 =?utf-8?B?RzFvb2RGNFBoaFZQaDlpY3RaL3VncDdhSDNDcVBEekphdmtUcGFTTnZQUmd4?=
 =?utf-8?B?TUpKVFErWlJNeGJ0V3pudFNYdmp4YjhoRUh5cDcyQWc3bEJHZFJyYi8ySm1N?=
 =?utf-8?B?dWNoRW9LV3ExMDUzd1Q3c1Njd0pBWStIcXZkVEg2M3JKM3MyYXkvNmFJem00?=
 =?utf-8?B?eDl2ekk5SXNWd1l4ZjdPTHFLcFh0ZFNXcHRSemd3dmNaSlpCNDVLcXVObVNs?=
 =?utf-8?B?aitZQi84d2s2b0xUL3c5cEV6SXNnNm9QaHd3a3lZQ2dUVk5pNW1OT2Vaa1lM?=
 =?utf-8?B?YWcwQWZqL1lMaDZlSXBoa0pLK09HYklkeEN5MnBhN1V0VkdoOHE1Yy84R1Zv?=
 =?utf-8?B?NHZ6clhnZUYvMjR1MlVuQXljeWZBOWM5b25SWS80Wm1mY2VnbXlUYVFFazFw?=
 =?utf-8?B?YXBZNjJkbldNKzN2bnZteUV0c05vVUVMVWJHaHpvQ0FqN2wzSDQ1MWY2YTBM?=
 =?utf-8?B?SDVDaDNPMjBsS1FKZHZQNlI1eVhKM1Fna2FKUGg4Y3MrRnNTUnAwZnVKNU1w?=
 =?utf-8?B?RnYwQkpQRVdqWFF1Qk1yaXVNbHdzaW56QnBQbDV1ZTJ2RkE1QUkrL3BjRVVL?=
 =?utf-8?B?ZnJqWC92b3hkcE9WV1kxYzArZ2x6d25UT1JOaGlXRUU4aWdTUEwvV1NJYVI2?=
 =?utf-8?B?ZjE2VXFYL2NtSlJqb3ByRVd3ZlNXNWhtTlRlTUJxRVAyN2pEdXhHVUNHR1dL?=
 =?utf-8?B?OFBndVZDSlY2VXVyQUpiUlJ6bmUxNTRzZ3c1c3FsV1EwQzJ1dlh5VSs1Y0Mv?=
 =?utf-8?B?WmsraHoyeDZUNEdURUZFdHZ0THhEQkZKa3Y2ZmJ3YWN1WW9WcU00TTBHZURP?=
 =?utf-8?B?dHE4ZHc3TDRKMFpFc1FGY0luUDhxL3pjcTNNcWxWYU1QZDRubHhVdythOFZZ?=
 =?utf-8?B?YUJkN0RFQ1phKy8wMnBmZDBMbnA4TWx1QTNJTjNoWEkvSkV0YVBCT2Y3Y1Ux?=
 =?utf-8?Q?zLCeNRVzCAj1Zg79CO/4CYEBjkjWlQcykZPAZ?=
X-Exchange-RoutingPolicyChecked: AhaVTRWoaKmRKOFnixRWdDjFgjkVwsPKZqq44R4LTjktndVVkG0iE3vn0WfvLLfntMPDjFIokAQWD4nhhzZJlUNFICeTzwu4esaz+IcdgkulX3vo9tJ0g8tYBQ7lPUR4LNDEFlT1ycXQ8S8t+Pr7hqiFJy4KDBCGSClRi/4WufYPxKgdM54b1lOEbzoQmq5uC2ZPRkzUpUbXQS8jJKSAlGC2OBy8fRxifQu1GnTIXiyi+VtlzWEmF7tR+8ausIVIDNahYKp7ALriQfNQ42CbF52eUwwXxHJCKsMXr8cA4TP1HFAiyX+U48W1XN7WeWFiUIWpvyiUkkwrRELb8jNjsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5bc44a-5e96-4c90-fa71-08de968ffd5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 23:30:30.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJOT5YGe8WpCL9ivVA0SJyr/3p7wERljBDcqJhRoHnqILz3WlCRvYAOC/eTx6yf0QW2oShtR4aSFASK9K8CFrkHnemfKpB96qQw7h91fIpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6105
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

lost my previous response... resending

On Thu, Apr 09, 2026 at 01:59:55PM -0700, Matthew Brost wrote:
>On Thu, Apr 09, 2026 at 01:37:16PM -0700, Umesh Nerlige Ramappa wrote:
>> Given an LRC belonging to the secondary queue, in order to check if its
>> context group is active, we need to check the LRC of the primary queue.
>> In addition to that we want to compare the secondary queue position to
>> CSMQDEBUG register to check if the queue itself is active.
>>
>> To do so, store primary queue and position information int the LRC.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++++++-
>>  drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
>>  drivers/gpu/drm/xe/xe_lrc_types.h  | 10 ++++++++++
>>  3 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index b287d0e0e60a..4fb02eda77b4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -275,8 +275,14 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>>  {
>>  	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>
>> -	scoped_guard(spinlock, &q->lrc_lookup_lock)
>> +	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>>  		q->lrc[idx] = lrc;
>> +		if (xe_exec_queue_is_multi_queue(q)) {
>> +			lrc->multi_queue.primary = q->multi_queue.group->primary;
>
>Can you add a brief explanation of why this is memory‑safe? For example,
>why is it OK and correct not to take a reference? This kind of thing
>tends to trip up human reviewers in code reviews, and apparently AI
>reviewers as well—I’ve seen a couple of AI reviews suggest that a
>reference was missing when, in fact, omitting it was intentional to
>avoid taking a reference.

These are the references taken

primary_q -> primary_lrc
secondary_q -> secondary_lrc

primary_q -> all secondary lrcs
secondary_q_1 -> primary_q
secondary_q_2 -> primary_q
secondary_q_3 -> primary_q
...

primary_q can be freed only when all secondary queues are freed/destroyed. All
secondary_lrcs will still remain in memory since the primary_q has a reference
to them.

When primary_q is destroyed, then it will destroy primary and secondary LRCs.

Hence no reference from LRC to primary_q needed. I think such a reference may
deadlock the freeing of these structures, so should not be done.

Thanks,
Umesh


>
>Also, if we want to be really paranoid: in xe_exec_queue_group_cleanup,
>before the primary drops the secondary references, it clears out these
>fields in the LRC.
>
>Overall, this looks sane enough, though.
>
>Matt
>
>> +			lrc->multi_queue.pos = q->multi_queue.pos;
>> +			lrc->multi_queue.valid = 1;
>> +		}
>> +	}
>>  }
>>
>>  /**
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index e7c975f9e2d9..b544c8169967 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -90,6 +90,11 @@ static inline size_t xe_lrc_ring_size(void)
>>  	return SZ_16K;
>>  }
>>
>> +static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>> +{
>> +	return lrc->multi_queue.valid;
>> +}
>> +
>>  size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>> index 5a718f759ed6..93972536214a 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>> @@ -63,6 +63,16 @@ struct xe_lrc {
>>
>>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>  	u64 ctx_timestamp;
>> +
>> +	/** @multi_queue: Multi queue LRC related information */
>> +	struct {
>> +		/** @multi_queue.primary: Primary queue corresponding to this LRC */
>> +		struct xe_exec_queue *primary;
>> +		/** @multi_queue.valid: LRC belongs to a multi queue group */
>> +		u8 valid;
>> +		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>> +		u8 pos;
>> +	} multi_queue;
>>  };
>>
>>  struct xe_lrc_snapshot;
>> --
>> 2.43.0
>>
