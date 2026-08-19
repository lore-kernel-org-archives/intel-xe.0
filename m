Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CEEC5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 20:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7710E0E7;
	Wed, 19 Aug 2026 20:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBMJX9QJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A610E0E7
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787171875; x=1818707875;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=sscXyArjM0mPVWVmrRdlbY5pMuHfqRd30YB12vR64dQ=;
 b=MBMJX9QJzYGeiW0s6cxVOWt1/3wt8ynBkZSNbYrF+B0fyJjMmAra8pKm
 vp+hK3jySwfAA+fkrWsyzjuhedCc7WnBo7wEpKbemjhNB+h3DZW/Rd9NP
 mjW7WYX560FrqaWX49Y7n0QEzPGBTZ8pT8sS4HarTl7RaukzcBZ8emw1y
 Z2LAbYj0FK4x1+VSh/rZdnAnSIEZUho7wEQK2dVBYs+PMQF/egbaMUdT1
 g4PnJf0jLGNT+vukfjQmkl+IILtCwlrH1Ulque+Olu+m9vUJnSpN2v+nA
 BeoAnu6GPSnSOYWzwwTjhOp/IF736NsJXxglR6leGArjoZKP1OX+cCGOY g==;
X-CSE-ConnectionGUID: frq/HqI3Sti+QpYP7cs/Zg==
X-CSE-MsgGUID: XIxXN9WHTUOY8w+bcGCsUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99226722"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="99226722"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:37:49 -0700
X-CSE-ConnectionGUID: pGgsuauWSEKBMHh3CSF/aQ==
X-CSE-MsgGUID: NfH06ENIRzib9w7HuZ/NUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="264345845"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:37:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:37:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 13:37:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 13:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM0LqjbOpYEpuJm5z8sEWILxS6CZodjGSl/XwI2QeW5KU7vgU+mDXW0AB/sXIRwf/aNRkr5tCqnD3enr9Y2QCcG/Dvv4PRIrSanS16OtPSdU5ETAZ+h1FZlBrWhXRcRMOknWxRgxcQC0K5maRktkL9gInnEKlOKGsdlf+r7qFWB3+4FoEFvrMeVJlTxE/Sgi1cxFo8J3eANKJhUmWRiYKU827v1pDmfnoyxF7TOC+MmKNWkQi03fU01ef7xRmO55o2MhXYEvK1yLghFTjoU8mpudXLb31bGjKahnv9y8i8WVpRPEkA2LPin+fvjrJhV6IYTdQUEKvC09v5nZXMQJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc0Oa1eyLIfpCBhb+dumBjQtxlF1++FI9dcvvM13WIs=;
 b=Bvt8KacteB2vXmRYnP+E0n60TyNOYLQ6CCJnsLuBGqqfU9BE29Gza4S/CPKeJznADdj4mAmHoYkIuHz5K/Nc2i3IdJ6e9W8JUozcI0msuwtD+UKMC/jneEE0s5WRyx7gafY04NArU7hNmnSWzOsv5/PSX6ygsojZy/b0p3sPeBuzHr9kV4DYRnz9gMXWZJ9gWoRjEZqDULaHxGCRGGRbNvKRr0J7nXOThdW+LT7yV7/Efja7QXKqF8360bulBUpK8pLoBGNBbnG/9DZYYk5rsIfl2VNO0SkEN5BpaSts9YgKCNY7UmYSsUY+Lnham3TTvAxZR1j5m1TRLZ2+X+iWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:37:44 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Wed, 19 Aug 2026
 20:37:44 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
In-Reply-To: <af024235-94b6-4fcf-8453-2e88f296348f@intel.com>
References: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
 <20260724-wa_14026539277-v2-3-ad786cc6ba1e@intel.com>
 <af024235-94b6-4fcf-8453-2e88f296348f@intel.com>
Date: Wed, 19 Aug 2026 17:37:41 -0300
Message-ID: <878q61c0dm.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a76906f-be12-40e0-5b63-08defe31b8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GtQPzEnoqfG74uJTb3Khz67Iecdij4bpjaJmzug7FZpEXVgnCSPXNHxl0ORYnJt2G3Pzp4MO1+icB3JjSrUMrWy7Nq9aS90XBWeLLgnsg4hf+iRf/ocFhbuynfTUncpHx/xfTDjGvCoso7v1czy/Iw155vm2t3/A2NMsR3ZQXrcIRIxBzEJfEAAu14h6kLfKCDBjJhdobU3JHknK2wQnKaOIhAKNQwV0vAf74s4yLN2PQ+qRF4YOk2ObwSvzRsbU4osWn3JUZHNUFLBdY55aMAlxzkzeLf1I84t8SWp2usN5aSudl7sSxtC6XAaj81y5iFs2p+m0+8zAay4yCGx1bhbl8jU+kcA7XWKnChg2ql8X/O4Eu+8ybbn6ZiL9Xkr2Vl1wvQWkI9J01tsVxqpFCzEIYzpGihHyJCoaVC92GpWPKbm+rog94HHsIFpNWDLLDgR4SBv9/1RZSxmfk/Q9MfUFwYevnsa0peeG8S3wi3B3FIddKS4cNDXtp10Z4vhCrHV5ZnfoxHnqUbQ/MjLvtbLpkDEYLoc+lKC00DW6McxP2L1Ck0T3hUHR7WC1GNQ6QKOPUYKFnzU+z/GMyIntqnrtPnUaIxx9GaeX37xjZ3JF8m/9/gCzAFouyplyrgaH+CqWIln3JXBFX/RhYCSRRgHJDnST1QsTuYcT0mMAyxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LxfHFodva7rJE5xvrCXHT2Z8wcz63gAcB0H//9YI2L0bUS4TlBil/VeC2eOL?=
 =?us-ascii?Q?w5/AakhYafyGfGpNKPe9XVDrWGFRQGDpcIwrixr0scrq/XyqniEvoB0h6/UJ?=
 =?us-ascii?Q?UCDqgKEQ9scs+4DA+SmCXg4wbO02rg2Wgfu7sNjK3XmBdVMQPwm+zW5PsmEV?=
 =?us-ascii?Q?8+XiYJbNfszTwbDKuddTtgq+ujcn3qwQTpSgU8IeMvbLEMn+EhM+AXsXEs/c?=
 =?us-ascii?Q?RQY8hyLbTq/lzllGeCHbwUcF9aTVARQJb3HD0HEByPBp0rhyjGddda3J2IDF?=
 =?us-ascii?Q?Ft28TMTTqKXvMEAsp86hucAmNYNOKH8oEspKvcU6IRUEs1LNPC0I1l75lbhg?=
 =?us-ascii?Q?X7HfKScU4blzqLB1bLWyJmmgeGZVMylFgVlnZTja2CMc60GCGyf1O3CVJFMG?=
 =?us-ascii?Q?aMfownmEQug7ETXj1RI6Cs8VUlL73n/rhE9RzeAn7sqWRt47x+PFGgr7xGgu?=
 =?us-ascii?Q?RjnZN1BauGDLbhJM21nLEfbeIgo3tuvuq7JtSoLc/ODqpUilhdTUhdvsyV4y?=
 =?us-ascii?Q?fq61ReGIHnmspZqvAU2GcVyT/Rj/x+29rEx72ji1/jyUyipRp+6oJrwVNErb?=
 =?us-ascii?Q?5nUKopma6et6M5V28MnjsF++FqMUAlp6EL1nPzStwige73qAK/9G1UqYrobx?=
 =?us-ascii?Q?bIUCJ/txxxLEN2Bv/Z2zpMvnAQmHCqaAtjUE0CnvYGjmuQErkOOWR46fqZ5l?=
 =?us-ascii?Q?XsHVDvIUzgPrZBGRIxyagm2bVM96Deab7+HekcqKio75TDCf4+t8IFRA9p+Y?=
 =?us-ascii?Q?lo8CWr3g59W/blBKP1orwFK0NYZGyqafz/vMZ5SvOJz6qj5+CI7/mJ5l0b4X?=
 =?us-ascii?Q?PX+8Ay10U01bvJ44vFn6+EV/TSV0zIha6zE3f8K9vQb7YeqIJeB4AaajGt9s?=
 =?us-ascii?Q?cfdFmI/smD4nwOzCIvF5jnZwXKwDAQ9DsmDM/UUoZtugHzgidHYONqe7ot8L?=
 =?us-ascii?Q?ad3r7RpS6lGLWQKA4FAuj3znRns5cSZ8hIO9feieuOthU5AaVKO73TPbqa8w?=
 =?us-ascii?Q?IYUC0eFHCdaRRKzuf5rFmPnCmqaNzc7bpYLdNFjIpo/kW6FVcktzT4DiYPm2?=
 =?us-ascii?Q?hkGmLvRBthzIgNYhxWZJSH+h9kPCL0k2LoKHOmcDkgAF4cILIWSgdYDcglQl?=
 =?us-ascii?Q?g2qczpl/w+s5rKuc1K/adcKLJkaBwzUSTRursM3OrtwrmdGLeWvweTYTHH9P?=
 =?us-ascii?Q?2jITZtoQmWoA8p2qQt1uWSmYO92p3m5zsfmdYq95ElVq+dgAKO9RNuhofNXF?=
 =?us-ascii?Q?2rCgsYZMFi28PRSR3sZcPwuSikHa4TVooIsiCTNIwwm/+twlv8/vVKTDDKCq?=
 =?us-ascii?Q?Jl5uniPMi4YSFU8Kt84bgtgsNWfsODA0N1FzwkzaSJfAHvLguDs7nf1WAofC?=
 =?us-ascii?Q?pd5oSe9DDMpYPQFQjfTmCIMlO0SC5dYp1nZVNy7l9yrwnLrG7EWs0JFVTFgA?=
 =?us-ascii?Q?porIoUTZJZkAUIWaJUE1z8/ISGZr0eUK5y46a/RJJIFMPRsjlco9t/jk35IS?=
 =?us-ascii?Q?oH2zqeTFQnfyWcdR2gCV/2iJ/GM634PCmee/5WLEL5yKc7KEL9UYf86s11Nw?=
 =?us-ascii?Q?va5ZrNmywlKlzqKYR2b8ZkcgpzM399DXpFSD/mww33Z1tx62mUJBymMaeARz?=
 =?us-ascii?Q?wWwCEmz/tPeGl490hjCLud/6EwHG6d48mR9rMEtUGU6XFX0PwItn2pGKUKWo?=
 =?us-ascii?Q?kej6H7p0fRAtqL8rKn4H7Dej98i4DuaHgQNn7qtUOoH411n9+N7Vwbf/sWAT?=
 =?us-ascii?Q?wm6HXV4MIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pm11DEeTEFvL/ygc2dzGduZtV3hVqqcvFjaLFfSZXtOhuB47MhFXHygQIY+CAGjFuzFYGPvq9SipaFTrQhj00u1qi1/CjLD8XwGpzQfWWUTdbuRpiuv2ZU1jwszfIpQbriVB7welK6aNP1lhDsqfclGTU65bPD5tu8IvkpwQP1lK2cIBtlisW+ySv5uYgIoYAymDdVrpfBM81BsLiMwJF18JLImm2YJf+W8IRnAX0+oaIGPpNswncISXspyI20qZAkqLD5jRq9ICnMgp8fgMmkxuEdehGkmviPbdYJhtI2PoF3UrVRfcJpgdVtl85FbPLJ4ARwPey8JUuc+v/uWyFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a76906f-be12-40e0-5b63-08defe31b8dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:37:44.3090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+yha0X/vjJYycsh5V83/qn30adhA6nt2vfvX01VPnK52MqGpw8ZxBTLo1BNluw8cs/ccn0Rok4QmUafmMuD0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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

Matthew Auld <matthew.auld@intel.com> writes:

> On 24/07/2026 22:44, Gustavo Sousa wrote:
>> Wa_14026539277 is a temporary workaround that targets only A*
>> steppings of graphics version 35.10 and requires that we avoid using
>> 2-way coherency for device-cacheable memory accesses.  For
>> driver-internal usage, we convert those configurations to be
>> device-uncached and 1-way-coherent; on the UAPI side, we reject
>> VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
>> userspace to select the alternative option that is most appropriate to
>> their usage.
>> 
>> v2:
>>    - Add missing bits to convert the PAT value to device-uncacheable in
>>      wa_14026539277_fixup_pat_value(). (Sashiko)
>>    - Also validate the PAT index in the DRM_XE_VM_MADVISE
>>      ioctl. (Sashiko)
>>    - Match against the graphics IP instead of the platform.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pat.h        | 10 +++++++
>>   drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
>>   drivers/gpu/drm/xe/xe_pat.c        | 61 ++++++++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_vm.c         |  5 ++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  3 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>>   6 files changed, 84 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 7060f66e1d63..10374022f1d2 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -82,6 +82,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>>    */
>>   u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>>   
>> +/**
>> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
>> + * use due to Wa_14026539277?
>> + * @xe: xe device
>> + * @pat_index: The pat_index to query
>> + *
>> + * Return: a boolean indicating whether the PAT index is reserved or not.
>> + */
>> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
>> +
>>   #define xe_cache_pat_idx(xe, cache_mode) ({					\
>>   	const struct xe_device *__xedev = (xe);					\
>>   	enum xe_cache_level __mode = (cache_mode);				\
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 5189419a0593..c4b8023cb8a2 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -836,14 +836,18 @@ static void override_has_cached_pt(struct xe_device *xe)
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   
>> -	/*
>> -	 * Wa_16029380221: The affected GT will always use non-coherent
>> -	 * access to page tables, so we must do uncached writes from the
>> -	 * CPU.
>> -	 */
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		/*
>> +		 * Wa_16029380221: The affected GT will always use
>> +		 * non-coherent access to page tables, so we must do
>> +		 * uncached writes from the CPU.
>> +		 */
>>   		if (XE_GT_WA(gt, 16029380221))
>>   			xe->info.has_cached_pt = false;
>> +
>> +		if (XE_GT_WA(gt, 14026539277))
>> +			xe->info.has_cached_pt = false;
>> +	}
>>   }
>>   
>>   static int probe_has_flat_ccs(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index a5fe1beec652..a9cde12eba70 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -313,6 +313,37 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
>>   	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>>   }
>>   
>> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
>> +{
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +	bool has_wa = false;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		if (XE_GT_WA(gt, 14026539277)) {
>> +			has_wa = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return has_wa && xe_pat_index_get_l3_policy(xe, pat_index) != XE_L3_POLICY_UC &&
>
> Just to make sure I understand. Why do we bother to check the l3 policy 
> here? Do we not just want to ban all 2WAY from uapi pov? The l3/l4 
> policy can often be promoted via the per MOCS setting, so even if UC 
> here it can be made WB via MOCS. Is this OK?

That's a good point.

The workaround instructions were to avoid using GT-cacheable
2-way-coherent configurations, that's why I was allowing 2-way coherency
for XE_L3_POLICY_UC, but I did not think of the scenario of the cache
policy being overridden by MOCS.  Thanks for pointing it out!

Yeah, it seems we should use a bigger hammer and disallow any 2-way
coherency then.  I'll change this on the next version.

--
Gustavo Sousa

>
>> +	       xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
>> +}
>> +
>> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
>> +{
>> +	if (XE_GT_WA(gt, 14026539277)) {
>> +		if (REG_FIELD_GET(XE2_L3_POLICY, value) != XE_L3_POLICY_UC &&
>> +		    REG_FIELD_GET(XE2_COH_MODE, value) == XE_COH_2WAY) {
>> +			value &= ~(XE2_L3_POLICY | XE2_COH_MODE);
>> +			value |= REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
>> +				 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
>> +		}
>> +	}
>> +
>> +	return value;
>> +}
>> +
>>   static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -373,18 +404,22 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>>   
>>   	for (int i = 0; i < n_entries; i++) {
>>   		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>> +		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
>>   
>> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>> +		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>>   	}
>>   
>>   	if (xe->pat.pat_ats)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
>> +					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
>>   
>>   	if (pta_entry)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
>> +					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
>>   
>>   	if (tr_pta_entry)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->value);
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
>> +					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
>>   }
>>   
>>   static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>> @@ -534,13 +569,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   	drm_printf(p, "PAT table: (* = reserved entry)\n");
>>   
>>   	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		bool rsvd = !xe->pat.table[i].valid ||
>> +			    xe_pat_wa_14026539277_reserved(xe, i);
>> +
>>   		if (xe_gt_is_media_type(gt))
>>   			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>>   		else
>>   			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>>   
>>   		xe_pat_index_label(label, sizeof(label), i);
>> -		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>> +		xe->pat.ops->entry_dump(p, label, pat, rsvd);
>>   	}
>>   
>>   	/*
>> @@ -747,9 +785,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>>   	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>>   		u32 pat = xe->pat.table[i].value;
>>   
>> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		if (GRAPHICS_VER(xe) >= 20) {
>> +			bool rsvd = !xe->pat.table[i].valid ||
>> +				    xe_pat_wa_14026539277_reserved(xe, i);
>> +
>>   			xe_pat_index_label(label, sizeof(label), i);
>> -			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>> +			xe->pat.ops->entry_dump(p, label, pat, rsvd);
>>   		} else if (xe->info.platform == XE_METEORLAKE) {
>>   			xelpg_pat_entry_dump(p, i, pat);
>>   		} else if (xe->info.platform == XE_PVC) {
>> @@ -764,6 +807,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>>   	if (pta_entry) {
>>   		u32 pat = pta_entry->value;
>>   
>> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "Page Table Access:\n");
>>   		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>>   	}
>> @@ -771,6 +816,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>>   	if (tr_pta_entry) {
>>   		u32 pat = tr_pta_entry->value;
>>   
>> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "TRTT Page Table Access:\n");
>>   		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>>   	}
>> @@ -778,6 +825,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>>   	if (xe->pat.pat_ats) {
>>   		u32 pat = xe->pat.pat_ats->value;
>>   
>> +		pat = wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "PCIe ATS/PASID:\n");
>>   		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 9e0176861cb6..64c03c669630 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3697,6 +3697,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>>   			goto free_bind_ops;
>>   		}
>>   
>> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) {
>> +			err = -EINVAL;
>> +			goto free_bind_ops;
>> +		}
>> +
>>   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>>   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>>   		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 0474768a38aa..265273294756 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -500,6 +500,9 @@ static bool check_pat_args_are_sane(struct xe_device *xe,
>>   	u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>   	int i;
>>   
>> +	if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
>> +		return false;
>> +
>>   	/*
>>   	 * Using coh_none with CPU cached buffers is not allowed on iGPU.
>>   	 * On iGPU the GPU shares the LLC with the CPU, so with coh_none
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index f02ac9bf7424..d53e7f75814b 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -71,4 +71,5 @@
>>   		GRAPHICS_VERSION(3511)
>>   16029897822	MEDIA_VERSION(3500)
>>   		GRAPHICS_VERSION(3510)
>> +14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>>   14027054324	GRAPHICS_VERSION(3511)
>> 
