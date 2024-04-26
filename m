Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51644C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011E510F069;
	Fri, 26 Apr 2024 09:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUU0QwFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B510F075
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122952; x=1745658952;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jSXcbEkQtnY8h+GxtXjmgMUSznuGFwnyK1i1Cjq3Aj8=;
 b=FUU0QwFU4IFPmr7hNJbFh6oqpCkWpFRh3btMfx8CW/CILDQQj80pxzjA
 NfBd4OYF0IzGJBe5e9QzIkYtwpn4uATifrjKiPinVZ8sbz3ETjbY3aYab
 gRtuq6mTOXAT/yY8y3ygx8kCjsNMFmdyNxxG5W1OYhyvEQeOTT5PhwOY7
 q/eWuatPEqpdjm9+v0BOXffHKa2hiym79R1KKY6LCkqcJQ34GomL3xHta
 7OXlhPEBITH8AEMHeb/KvRX8kHI6q60Yo0CjVsrT+xp+8gL+JV8fAXxQX
 GM4/YuR06r1+rvAF/9HQ2AYNFD3Beecdkp8DjDGoVY1Nl7F/b6bLrhFeo Q==;
X-CSE-ConnectionGUID: SR2zQvZBRBe9+rR4rL0AGA==
X-CSE-MsgGUID: 9mf4235pTmWu0b+RSd1iBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="12787188"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="12787188"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:15:52 -0700
X-CSE-ConnectionGUID: CW0s53avTy+4iH37zMEKYA==
X-CSE-MsgGUID: Jo32iNSTQwSU/SzCilvwgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30158769"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 02:15:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 02:15:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 02:15:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 02:15:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 02:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPVRYjehAv2MpMf7/TYRB2ncA/0kDye2BHfB/8bR7ZyEQzjq74aY/fMN7HvXJCYDV7wNRL4ljwbLCAV1x/098LZCqNFkppgKXrlX18F/5UeNdreoK3mo3AGjvJYJz5Q8OgcVyOqd8NJIv1chW+apUrRUuuGY+1gKkHbba/JCK4WyznI3h97qeQIO5uxSCL42GXiecnTPjZ1raD52rVfPv9XSI9PnG+EbEDDhY8Fc8C15yKpCjXB5hx3vxWTTG8ul1ISOXZfNn2UJpA2JXfJDRQzLprB7sBWuOXs1jIRbumu3m6g+Z+UgR5/qA36f+FfCZgrtxHPuIgn9oTN8+rM6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0pFCAuU4UfXMMqP+Rw7jwyAD74Keg7jw+SZ9fFsGIo=;
 b=JFQY4pzFO7EcZfqZsAh+b9zUPSwo2xwinPF7pXnOlnfAsg7OtEZn2jwwN8DCI+bhH0Nn3Jn0xwYcyCih1PkC1PHP4cDUApMp/nmJ5cYAdSh6y0Pm35k0FoUoi9UJM5fhYThGfAsc3HKPI35khVnWTZppDqK2nw0SOhHFtgbBjulNNwQK1UeNyZNy85iD3SX/Do1JDyGnIZUqSuFFoTd1T1SgGOvVK/hYZutybjXC+o3DRp5NERmulbWR/3LVc1pwgkjUyOdkG/QmT4Et8jFIOt/Fn/wf0Rn8EwoI1fxksc6mr5NViMy0kN1IRUcZFVsGfx3bxFU0wfjNmyeHL5HuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 09:15:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 09:15:48 +0000
Date: Fri, 26 Apr 2024 11:15:45 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pf: Re-initialize SR-IOV specific HW settings
Message-ID: <20240426091545.mts7k6mfs7ks2wrl@intel.com>
References: <20240425143927.2265-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425143927.2265-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 59573b37-8c17-49a4-8ba0-08dc65d175f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTBBVnNJSlFSY0JYZHUyc0hjZzF3dlppVVJOSnNUaXRJRXluY2F6RDAzS1p6?=
 =?utf-8?B?U2lSamgxRzJIS3lWZnRLNXFFU3EzVDhrbHM0WWFwaGxMZ2oraktzYm4rSmJ2?=
 =?utf-8?B?STJ4ZnlRRGZadlVBZmRXM0xnemlvVURad1hpWlA5d3RaWi9ocEhOTHpBR0k3?=
 =?utf-8?B?Y2NuMlBpRCtONUdNUVNIb3g5emVXRWJLUWFwSDJ6UWJxSVNxUnEvQmlqOTdQ?=
 =?utf-8?B?UnJLa2MxV0s1TVBIQ0pRRXZ0Ymk4NlZDOGVBdGhZc3p2czRMNFBrc1dWR1Ni?=
 =?utf-8?B?dUpRRzBiTXYwTVR5VmNWdWpVa1B4a290ZWV1NHowelVPVmRyMjJaU2UrTWRa?=
 =?utf-8?B?ZjN4aVR1eDkxYWlySkFMaVBGSUJ3L2NuUE1CdlFITUtPODNzSUVhVUpYOGgx?=
 =?utf-8?B?V1lmT2JvZGZqU3Ewb2EyYWdjNVFZSHdNZjdkMjVOaWZ5K093Zzg2bXhNOXRY?=
 =?utf-8?B?OENBelQ0djFjZ1EySmVYalpSV1VXVmI5S1RGVWdEOWhubDgwUXNYTExsY2V4?=
 =?utf-8?B?dWNhRnpnRDgwNDNJT1dIZFQyVkFmZGRmRUV5VEFlTmE5cHduQzl2K1NVVm5p?=
 =?utf-8?B?b1d0OUs1YXVOaGtVbG9kNU1GYW03aGl5cHUzdGpRQnhjeEhmQVNwUU9RNXpM?=
 =?utf-8?B?VWM3VVdwSW16dzNmUHJ5ZHlvM3VRWVZtdUQ2THZMZmpWQ1htZUIzNys4THhl?=
 =?utf-8?B?Y2l1dVc3RTJuZ2xaWlU1VGVCdlMvSm5vUzU1UnRuVGQrYThUeUV3QmZhclF3?=
 =?utf-8?B?eHZod2lMcXNiU1RNbDNBMDlwamdzNEx2bjQwYlFhazVQNm1ydmhpTXdVeEw3?=
 =?utf-8?B?Z1dNNUhtckZNTS9KLzFGWnZwZXpkR2Q1N3UzdTRiT2R3Zk95Q3Rad1ZSbWZ0?=
 =?utf-8?B?U0xTQktxMEJHeDNKRFAyalZ3bi9vZjN5NkxhUTFoU1JRcWFMN1JORlgwWlJq?=
 =?utf-8?B?aFRuMTBjcFYrRmRtM2tta3RSazBHVVIyTDM0UGg1aGFSSjN4eDVGc0pPdWM1?=
 =?utf-8?B?NlN3ZDhKNTJGUnZBK0phbm5qcEZBTmhNOXZFVVNZbkVKNkdGVDhPT2UzSjBN?=
 =?utf-8?B?L2xjTTRCNnNPWW9HMGY1akpia1lmZG9OYWJERVFnKzNReXUveVFzNGdzTnZp?=
 =?utf-8?B?OG9OdWQzOG8rdzNsT3JURW5oQWMxZFVvRzRwOEZGdEU0RDVGNFdjcHhpWjJr?=
 =?utf-8?B?bHIxOTRlZStMdE5GVUV3KzdsYnhVQ1lOT2NpeHMxQ1d2TzcwWWptUXl0dmVH?=
 =?utf-8?B?TWw5YkpKWmxrcXlCWkRrWHhkY09INzR6SkdpS21wcnNoaUZhK2pEUnpjSFM4?=
 =?utf-8?B?alB4Qng4TFhXQUxoV3VIS1FFa1Y0NHhEZXFTeExSalh4MkpiVFVYVTBYQnFh?=
 =?utf-8?B?Rm1zY0xzOU5HSDJ5eTd4TjU5dlNEemtOLzlEdnNQVUgvZzkxNWJROEMwVml0?=
 =?utf-8?B?R29VdkxkSVF3ZzFDVWVwYmVTdno1dUMvYlQ2RUk2VTZRSDlXTllkZks1alZ3?=
 =?utf-8?B?SVR0R2JQUWhQUGRIZ3A2bVhoNnM3YllKSVBIeHpBck8vdkRjVTBCWnFHMUR4?=
 =?utf-8?B?K3VPZXpjVURad3dqdXZSSkFyT1F6MXNZMlRrdzVBaE1KR21qYTJZcHBjTjJh?=
 =?utf-8?B?WmtSL3VvVE9hT2o4ZVBtQjh4QVJWbUtoUVVzblh6MDZYeC9hVnJuSW1RenNE?=
 =?utf-8?B?RHFzcmltN2w1SGU1LysrclZCSitSZUpGcnhCK3l6cW9hS2NiN3l3bjdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFJ4dFMzZkVscTVmNHBIMXN6ckNGc3ZTVHovTFgya2lpRVBuZFRkWU81M2dX?=
 =?utf-8?B?anJTN2FuQlNNMHlINE93VkZDR08vQURNUWNGNEpVTzVjb3JxSmVsL2FJaTVR?=
 =?utf-8?B?VXBXSWtzOGpTK1l1ZEF4TGVscjVDd3dDOWlxaS91SU1peVoyZGdzdzFIcVFO?=
 =?utf-8?B?NTF6Y3llVFU3bnZlMWdHTGxuM2RkUzJKdm52QzFXV1JlQlFNZC94L1A4UGVK?=
 =?utf-8?B?NHFaOUpPbTRSTEpyYlRXa3pjOHpNQTZ2Y090ejVsZ3puMWRxSVE2c3phVnkx?=
 =?utf-8?B?OHJFTlZSUVYrRGsxSlJOTTNNVHBGanhSOTdKbnJ6R0V0MFpHTTgvWjRVb05r?=
 =?utf-8?B?VHhwQ1lMUHBEcjlkMGtYS29FWXEwTWdZakViaGVBNmJSclUrVU9jMi9oVDYy?=
 =?utf-8?B?L24xU1FORHBDamljeVpxczNReWF3VnYxQ0c3L2NnbVNlbk9HMEpoV1dqSGNG?=
 =?utf-8?B?cFQvbmMyL21KaUt6SHpMMDJRMnlLbDl6b2FlQ3c2Ym81K3ZUY2VHY0dtcWYw?=
 =?utf-8?B?WUZSazJHOVFKWjRWREdod29JeUliSU5tb20wUGE2R08yeWZtTkpsMGJyYmxE?=
 =?utf-8?B?U200MStkdk5OY282RXhxTWMxZHFRUnk4OE92dE9Ockpmd0tORTcrV3poRU9k?=
 =?utf-8?B?NXpkMTBmckhnY2lUdGdIaDFLMUdnOGlkbUY5d1FIQlRxQ3lIQ29vVlp2aGJF?=
 =?utf-8?B?VlNRQ2FIWWgyaGNLL0t5STd5VWhtM2JxeGpyZ1pmV0M2NTJYd3E3MmZ0aEdj?=
 =?utf-8?B?K2JhU0Z6RXk2d1A4SXFNS0ltK3ZwUElyeTU0NVNVRHNMNmhYQjRSRDkxVVRQ?=
 =?utf-8?B?dWFuMUh6MG9jVEJBVGpVSHQyaDZzc1o2RGMxUWVPNHpTVytmTFNERE1BTWt4?=
 =?utf-8?B?V29vclhlOUxtUjNoVDdqQmxnNUtxYS9BVDhpZVpmNTFKckRId2tja1VYSVdW?=
 =?utf-8?B?SzVCSU1kancwcXk5ZUJQZ0V0ZnFnbnJpWi9yV2JyeXpRVVgyZDFwaWcwOFd0?=
 =?utf-8?B?QkIxWU0zbGtsVTJUUlE1U3VGUFZMcHZPUEd3S2tSQUtDeEErTXNwWHVZQ1Nn?=
 =?utf-8?B?TVdDWHRCNEZkaVBhUU9Cb2pUS015SlI1eXVnQ0VYOW1kOUF6Z0F5NXRpYUU5?=
 =?utf-8?B?emhKQXlYNzk4aUd3emlRRVhLYllMNTUvaGxNTHV1a1JDcUNiRTU0aVdYdWVX?=
 =?utf-8?B?OTBvZmFIT1UranJDWGRTT0lmZk1IZk15YS95ZUw4VmY2cSt1OHkxT2Uyd0Zx?=
 =?utf-8?B?NExUQzdmS3hpWjdzNHB2QXoxL25wV2NvcEhxRW5nYTJuVGhRbGFYVUJGYkN6?=
 =?utf-8?B?Q1BKSSs1bit0RWJJWnpXNFNvNnd0VWhmcnJvaU1TNjB0OVdSUExtM004QXJ3?=
 =?utf-8?B?eWtRcG9vOGhqZWhxYm40dWtzQkp2aEVROVhEUnAwVTk5OVJBVkJzeCs5UDdU?=
 =?utf-8?B?ZzU2ZUJSd0xtSmVkSlZBZzdKOWowdFlXR2wvTEVkd21UWmVCNHZpVVlxNlln?=
 =?utf-8?B?QURmWlhiSXNWZ3I2T2FyTGhFMlVpUlR1WWl3ZWcybldCd1N1dWNTK2hvZkoy?=
 =?utf-8?B?STdCUUNEeTFXcEkwSTZ1V3BRVWhDdWJENkhPbTBNUTJQN1lMOGZ3cnlDa2xt?=
 =?utf-8?B?YVlSVXlsQVJaRDRkemVXQzN0ciszbFl0VDlTYm1Dc2tnYUtLdHVJVkwvL3Nt?=
 =?utf-8?B?UlplUG02SVZRa1Z6RFgvNXA4b1ZsZUE2Mm81Q3hUVVkvTTJpK0tzcXZxOUc4?=
 =?utf-8?B?N25ZQS9IeWN3RWNKSmk4MWdFaEF0dUVMQTA3TUNtVlhUM05TMFFTdzdieUk1?=
 =?utf-8?B?emhQb2FiWlpZcDhHYXBFU295WWF3S1puemRyOU10SW9CNXRVcytscW9oRHBT?=
 =?utf-8?B?UVVCeGpsMUQxTUlQa04yOHVyMFJHWERyNFZTQytxcmV5T1ptKzlSa1VORG1p?=
 =?utf-8?B?UjhOL01yY3ljK2tKVHAwSkZldG5pOHdCaVo4TklDN2tOeWtRMVlpZ09ORnZj?=
 =?utf-8?B?d3lJTFBGZGxzSUpvdWJXTkVEZXRDZmJqbm5sV3FHSzFwQ1JRNy90MXMwVU56?=
 =?utf-8?B?aUN2d1JPdS9pSFh4bno2MU4rMHl6alFKbEplM0c3ZURRSkswbXJBYmhiUGdr?=
 =?utf-8?B?WVYxcVk1WGNDbVlGY2xKM0M3dXlqY053TUpMUnY0OUxmWVBWaHVOd2FMb3Z4?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59573b37-8c17-49a4-8ba0-08dc65d175f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 09:15:48.3091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa6a397lYf2cJ35aFhpnsbUe6GeNSpvlrCr4lXs+1IX6lr5dBe67lnZwmU/HXtgYxUX7rYti/Jd01Klrq/whLDfvrImFDzhdsnoAYBh6sUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-25 16:39:26 +0200]:
> On older platforms (12.00) the PF driver must explicitly unblock
> VF's modifications to the GGTT. On newer platforms this capability
> is enabled by default.
> 
> Bspec: 49908, 53204
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt.c              |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c     | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h     |  5 +++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> index 617ddb84b7fa..017b4ddd1ecf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> @@ -14,6 +14,9 @@
>  #define   LMEM_EN			REG_BIT(31)
>  #define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
>  
> +#define VIRTUAL_CTRL_REG		XE_REG(0x10108c)
> +#define   GUEST_GTT_UPDATE_EN		REG_BIT(8)
> +
>  #define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
>  #define   VF_CAP			REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index e922e77f5010..7cd35871c978 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -477,6 +477,9 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +		xe_gt_sriov_pf_init_hw(gt);
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	XE_WARN_ON(err);
>  
> @@ -613,6 +616,9 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +		xe_gt_sriov_pf_init_hw(gt);
> +
>  	xe_mocs_init(gt);
>  	err = xe_uc_start(&gt->uc);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 791dcdd767e2..687ea81931d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -5,8 +5,11 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_sriov_regs.h"
> +
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_mmio.h"
>  
>  /*
>   * VF's metadata is maintained in the flexible array where:
> @@ -50,3 +53,25 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +
> +static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) == 1200;
> +}
> +
> +static void pf_enable_ggtt_guest_update(struct xe_gt *gt)
> +{
> +	xe_mmio_write32(gt, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_init_hw - Initialize SR-IOV hardware support.
> + * @gt: the &xe_gt to initialize
> + *
> + * On some platforms the PF must explicitly enable VF's access to the GGTT.
> + */
> +void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
> +{
> +	if (pf_needs_enable_ggtt_guest_update(gt_to_xe(gt)))
> +		pf_enable_ggtt_guest_update(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index 05142ffc4319..37d7d6c3df03 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -10,11 +10,16 @@ struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
> +void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  {
>  	return 0;
>  }
> +
> +static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
> +{
> +}
>  #endif
>  
>  #endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
