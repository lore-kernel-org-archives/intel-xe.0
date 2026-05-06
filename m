Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5582CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 19:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F6610E280;
	Wed,  6 May 2026 19:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWBfY3iv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5A10E280
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778096562; x=1809632562;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LuAHHyHQYSNblLHUiXnEsz0f3iWcoyUTZbmVd1g7Qhw=;
 b=SWBfY3ivCfINX381pT3FaU7XxQo5asd2nk1kIwH2IY8UsmOMQ8Lzxzrc
 c95LvcaJCZh7mb9gn22r1JsBCHwrhffxNUIfZip49oIkcDrxu6AMbb45R
 Yht12aHpGgm+ufunOG9ImNQ01VXfy4FAU7O8Zfex/Lc4rCpVTkSn5hrt8
 RoKG3C/RAB5KllY1FGCrMacjtC5XBsZCTNl6CwKSCWgBYCKrc1En1QikC
 8RsXMLXHZo3mJaifEAzhTzjh8WUD9hdXuSWi4KpOKlawUboiob7GSxKuw
 R1b6H0T8p1OrGjkHM3xNTbmP6juiiPBqi/J7HCmPdj0Z3Eiu6Txj4cURF Q==;
X-CSE-ConnectionGUID: 2V6xZtfVTQSvA2HNef7ulQ==
X-CSE-MsgGUID: nsonZSAaRG6Ss0TPxsfuSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78189071"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78189071"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:42:41 -0700
X-CSE-ConnectionGUID: 0DTwT2S1TlCgHdwzMQ3clQ==
X-CSE-MsgGUID: JD1m8sgKRWmHM19+6qm/pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="241233237"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 12:42:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:42:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 12:42:41 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 12:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e51pAYNcTm32TGpMYGXcNcg2jntX6+EcFYar8zuNa0+f8s6Wrj3A71WwAxyns70L2kJpBnqGtJPD1gzgonwFXik5jrLxni1Ox9AmDmj9Fq/sM9r2ri2oBqXjHw+KayYbhDkR3WfjhKAUZlm77cwVp/PHj1ufYj7ril5B7aMvtCN0zUcrDa+dR75dqzNHfX9WJXyzUIiPLOztwfJlA+jqj3hB453moVgvQd6thoDtNRHjzB+BdF5v2jWdRFn9KEpMucBvIWlDJJgu8gASFQh2oxVBWwnPsvhILx+TSmv3Ti08iMvctpVEQ1QxnwaDAJJ1sIM3N+KRYMK2Ch/w9YS2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ0p4nXZo4a4LTlAJ6AThHWNPdoSWJdvD2iDV9eHyds=;
 b=dQLtjJDC+mSB9oL3vho/MTsfOsJgcD9MD1MJXCTuRs6RrA95TlNOhTzkZZ3P0hL6ZE65naBUzFU5PO3oJ+/ZumSQ1qkFX4R3Va5yTTncj7/bj5nJ9CTIuB3WDjpLSa+soeYkeZ1SkU5Q6E/CY+rSDoRdeFJNBhYhVJk8gfaAw3t/YIXxAIuuazknWFim7oEWDUnv1UUWL3JXsYLVFFYS+JQWHclGNs/9HHx7rOomQe9IDzpk2TACfPAV2xuKRaWfu/EA9YyDRkWkx/K3VCzy7Ife2QtWTAVvfrh8n3bv/UzCwmamGTZMVGivluHMv0UthFrkZo6d2VXT2vF9aggomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 19:42:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 19:42:38 +0000
Date: Wed, 6 May 2026 12:42:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <francois.dugast@intel.com>
Subject: Re: [PATCH v4 04/12] drm/xe: Use a single page-fault queue with
 multiple workers
Message-ID: <afuZq0+X070Inmhk@gsse-cloud1.jf.intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-5-matthew.brost@intel.com>
 <59b9532d-68ad-42b1-b7eb-c693b648b564@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59b9532d-68ad-42b1-b7eb-c693b648b564@intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b29ee2-babd-426f-2115-08deaba7a125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: pwNjVx80g47OIGPyy2F+sqgERXhl/ZYowWmUdbXYGmDxR/6MrC9OTZksejJ/Pcy1R35lPaja+tcxu/z1n9aP9EF6vJKlbeLXVZH9ESiG1BZJHlq1v9P3fPydnlXvCPdNsOtB14KLgxJI48yT/FcLc/d3+xovJLfmd5i2Tvx/VRjjhwRV0na6FH18fbmjWSGfC5wb1dKBq4ZZntGE3LxmxASQb1BctZ11p3yT6WMhZeNS8u+ydBkEIv2bcMZBkWQs/Lekj+ydYmncLEO8e5oomZ6gg/4FwwgolEM1rp4i6y6v7Y02ZMEYfRIo2AAW5e4dr39CyCy58xkWixw+ABCA7vkFBu14KetUXP5IRQ/coB9eqY5Tc3r9M4kRzk5vr+UsyRWVCBap9Ssy2wU+R4g+KqnzsmkgqKs2AsWDJ9/DMvysZ1Er/JG8mWD9L7+3Z/2zGaN9Qgo8iX75ZG7qzYKRlz9+lH/twF6bmj7lvMLzXFZ2b2srcuf9Tyw3gI7A62hwfeOlkydIOVLM05a0bPBl6hKzUyOr8iKsOVPPCSqhiZjaMo7pEKFhg1Hz4Fx222fUWebPRwBWylCI7MXgMqmSohZ3f8pdlz66EtJm6DbKv9EaK0+7C+xq1R4Rtwe0A1RQoATZ0TGPzCKuAKDoam2zS5lwx11wOdXhEGUSoxkoxb+ETzBqommEBKm56YzB0Fd7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmlpVFZBKzNySVJWd1FnQ3lOaGZQdWduVjRXRjJ1dFZBb0ZWVU85Um1YWGcy?=
 =?utf-8?B?amxqVnJjbGpsSEhGNVlrekxsRGozek9SNzJQL3RjOGlqTytLdFdVTDdRTFdE?=
 =?utf-8?B?K282aWdxVjMrOVJoVS9wL2NvV2hqeEQ0QVlXSFUrZWJpQTVoajB5NHgzYVNN?=
 =?utf-8?B?WVRldjYrbUZFdTY1WGJrdG5Xd2JScEhtZDdLdlI2TWR5WnZQVktuSU1OY2oy?=
 =?utf-8?B?Q3dpWUlWQ3BGTXhTNC9WTEJtRUlZeUc4aVlGOENkYUd2NVNoM296Nm9GNG1D?=
 =?utf-8?B?UXJqaEVONFhrWlhZeitXZnVidTdydnk4YVNMc0ZuWmdxbEFhQmpxU0R2bnlV?=
 =?utf-8?B?NjYvdHlYaHdsS2ZBZ3FuRnhYYm41QmhmOUtVQXk1YjFuWkpmeTl2WUpscUlV?=
 =?utf-8?B?b3hhU2FqSWdJUzZTNHpMZDRkUlZ6cCtVYkVCU1grbUg5VGFYZUZuekxKaTVI?=
 =?utf-8?B?c0R1d1FrT0RnbnVkM1l2WlQwbFZGeDZqblAxNi9kUkVDTWdPcElydUs1TFRL?=
 =?utf-8?B?Y1duZXJIYS9KTVl2VS95anVlWXIyQi9QOWJXVUpib2JGcWVlQ0dZaHMvbHF1?=
 =?utf-8?B?NVJzWWF3dkdjUEFsQnJ1UWMyVDlaOFZ6UUR6RGJVWnF1c2lHZWROdjdMK255?=
 =?utf-8?B?T2JaNDFWZUIxbVlSWldEOVk3cjZHNGZuYnlDVWVYSFNtN2crd2RHclZnd1Ns?=
 =?utf-8?B?VGx1WUdUNHlFcWpTMDhiZzZ6U0d6ZXFKK3NmZ0VQU3NrbGtnWFp5alpKeGkx?=
 =?utf-8?B?SklzVEh2Y2IwOWdtTUlrU3djY3BhcUF5bEZmOU1mSU5renRzaUU4bk9zM3V5?=
 =?utf-8?B?R29wU2l0ay9oVU1lWE5vY2t6TkNLOUhUN2gzT2lNdFVzRGFJMGt0L0VBeXhP?=
 =?utf-8?B?VzFUWkhLQmNHQmZ1TlBHT1R0blUwekUyQTlabndSUUtHbFRmWXl5aVIvaklo?=
 =?utf-8?B?dnlicE1pbmxmK0VpTlhtK0lGRExyV0d5Wng2elMzOVVOU3N4QTlwazVDWnJG?=
 =?utf-8?B?NVJEMmdocEJHbS9GQlZwemVVWG54QXQ2VjNjaU10ZFZreEFxZXhvazJJN3g4?=
 =?utf-8?B?eElUNFZpdTFTSUtlaUR1UFQxZjJId09hOHd1a2s1WlJOR1BOa2dxYnJZa3RM?=
 =?utf-8?B?MCtEWlAyQVFrbUh4QnZ3allIVkR1LzRvN0ZIVFZtR29uREREN1FxRk90aTlL?=
 =?utf-8?B?QWZrWG01KytZVFVJOW1Db09nTTNRdVBURDZsMkxJb1dWVkNCQ0lkdVZteklE?=
 =?utf-8?B?ME5tSDVUNysrUmNCdFpCTlNIMTBMd3U5c1p0QThPQ2pVak5peVhyRDFHTmRW?=
 =?utf-8?B?bVJlaE5SYStBajhmaE8yaGE4cW4yQkw1Z09udHNkY2RGU04ya201V0h0VDVx?=
 =?utf-8?B?NUNva3NJUXdvdkNkbFh2V21GQXhPeTFqMXlMUXkwVzE1TjVmVGRPUG5CZU5X?=
 =?utf-8?B?dXNxdGtSeE9ZSnU5bVpYbEt3QTZnRnVFQ2p5L1V3MWlsSlFOWVArTXBUb0tj?=
 =?utf-8?B?MzdZdHdKMSt3L0dJbGUrckFoc0dDa2NlaUR2WDhMVitMU2k4UUI5UG1EUmhB?=
 =?utf-8?B?Zzc4TDBvVGNlNC92NlVxakhWZzM1N0REdXRSbklUSndkQjNSbk1iMi9BTzhu?=
 =?utf-8?B?NFRFUHRaeDFROHFTUVoxL1NNL2FGdGo5bDUrMjFLT2pOR3pUdSt5Tk5semhM?=
 =?utf-8?B?OVBGYkg4cGg5S0E1OEd2WnhrcUhneE9pZTJreDhuQlNCVmp3ZnVYMUlFSVZt?=
 =?utf-8?B?N3Rzd1FmMHJVRHJNdS9LY3FEcmZBeDZUWlMwZVMrNmhtRlNFeHVhSi9JSWhy?=
 =?utf-8?B?ZXlKbEFsRGdrdE9SMzE5K1ovUEw1UVBXbzFJQWhtZWRTQXFMSnY0SUZ2aFhs?=
 =?utf-8?B?RGptc2hLVW9RNFI1bVJDTUJBMmp2Q0gvemJNdTJ4ODlCb2ZGcjlvTnZnb2wr?=
 =?utf-8?B?RUo2Z01icGdaV2VuNmRERm9TTDlsbTZMdndZZmpGa2J6WlcvcDVZQ0tkZVZ2?=
 =?utf-8?B?dHMxcjIrNFUrZWF2TURiSHlMeWR6N0dhVDAzZGxIbm1aMUM3MjVCM1pGNVRX?=
 =?utf-8?B?aDkyK2pOVFdlYUtNUFQ0UDZqSGpjYk14R1lJUm1DUnptYlNUTXFiMmgwNlhm?=
 =?utf-8?B?VUlBaWY3b0tlV3FHakMxUm8xdzJGOThXc0NMUnpZeU9PNEpOR3BuZnRGcGo4?=
 =?utf-8?B?NzJvazdrMkU5MkRGdzgyaitmRzhZOGdnSHN2bjV6bzhQT2Y0V3l0cFk4RFFn?=
 =?utf-8?B?dTg5blpJRzA0ZkUzbG1FZE9xYUZWWHE5ZU1vbG1PQjNZcjkxWGJJZ3RFeU9E?=
 =?utf-8?B?aWY3L3FuRHJJMzUxc1ZQSERESkd0V0ZlR1NPdmlZeWpRaFpKdndoOVpMdEdP?=
 =?utf-8?Q?XIq3DkqwFpQw9bHA=3D?=
X-Exchange-RoutingPolicyChecked: MTmCCgQnxY56gj5oV4riCtkh7rblhS5iWDM+vvai21BKGQB+MllkJ3TnjcjzOUSQjTfWv2SyUz+xq3eQwsFDVcfBBkaCyADa9RUkuATnFIuJC2djCaeikh/S1Xpn51KJbolow572zuH9ZXYST7lWRjH2jKMrQ6E55XMsNJjok4LKVLW2zV7EdgFL0t19QmYvNp32bbOxZA8xD8x5W4umUhk65971vXnqyLf2dbbhknM/vxkla9E9Z8LPd8LaXephyP40fhFISizcIKPMBxhNjtZRDiPDJV9+jfrdF9E2gynu7wSbv/O1dPml1XFbw3aHALKi/KYHukpQitgpTYbRfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b29ee2-babd-426f-2115-08deaba7a125
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 19:42:38.7148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sv52UJ8n0BzctyUbEijGceIvmdiBws2/mFjkuVhdLTi+QUEYuHlWct18HFuJpZASzcgtJxbWSPsFIKpPT9ktfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
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

On Wed, May 06, 2026 at 05:46:30PM +0200, Maciej Patelczyk wrote:
> On 26/02/2026 05:28, Matthew Brost wrote:
> 
> > With fine-grained page-fault locking, it no longer makes sense to
> > maintain multiple page-fault queues, as we no longer hash queues based
> > on the VM’s ASID. Multiple workers can pull page faults from a single
> > queue, eliminating any head-of-queue blocking. Refactor the structures
> > and code to use a single shared queue.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_types.h    | 12 +++---
> >   drivers/gpu/drm/xe/xe_pagefault.c       | 52 +++++++++++++------------
> >   drivers/gpu/drm/xe/xe_pagefault_types.h | 17 +++++++-
> >   3 files changed, 50 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 1eb0fe118940..0558dfd52541 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -304,8 +304,8 @@ struct xe_device {
> >   		struct xarray asid_to_vm;
> >   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
> >   		u32 next_asid;
> > -		/** @usm.current_pf_queue: current page fault queue */
> > -		u32 current_pf_queue;
> > +		/** @usm.current_pf_work: current page fault work item */
> > +		u32 current_pf_work;
> >   		/** @usm.lock: protects UM state */
> >   		struct rw_semaphore lock;
> >   		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > @@ -315,9 +315,11 @@ struct xe_device {
> >   		 * yields the best bandwidth utilization of the kernel paging
> >   		 * engine.
> >   		 */
> > -#define XE_PAGEFAULT_QUEUE_COUNT	4
> > -		/** @usm.pf_queue: Page fault queues */
> > -		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> > +#define XE_PAGEFAULT_WORK_COUNT	4
> > +		/** @usm.pf_workers: Page fault workers */
> > +		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
> > +		/** @usm.pf_queue: Page fault queue */
> > +		struct xe_pagefault_queue pf_queue;
> >   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> >   		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
> >   		struct drm_pagemap_shrinker *dpagemap_shrinker;
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index a372db7cd839..7880fc7e7eb4 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -222,6 +222,7 @@ static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
> >   		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
> >   	else
> >   		pf_queue->tail -= xe_pagefault_entry_size();
> > +	memcpy(pf_queue->data + pf_queue->tail, pf, sizeof(*pf));
> >   	spin_unlock_irq(&pf_queue->lock);
> >   }
> > @@ -267,8 +268,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
> >   static void xe_pagefault_queue_work(struct work_struct *w)
> >   {
> > -	struct xe_pagefault_queue *pf_queue =
> > -		container_of(w, typeof(*pf_queue), worker);
> > +	struct xe_pagefault_work *pf_work =
> > +		container_of(w, typeof(*pf_work), work);
> > +	struct xe_device *xe = pf_work->xe;
> > +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> >   	struct xe_pagefault pf;
> >   	unsigned long threshold;
> > @@ -285,7 +288,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   		if (err == -EAGAIN) {
> >   			xe_pagefault_queue_retry(pf_queue, &pf);
> > -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +			queue_work(xe->usm.pf_wq, w);
> >   			break;
> >   		} else if (err) {
> >   			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > @@ -302,7 +305,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >   		pf.producer.ops->ack_fault(&pf, err);
> >   		if (time_after(jiffies, threshold)) {
> > -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +			queue_work(xe->usm.pf_wq, w);
> >   			break;
> >   		}
> >   	}
> > @@ -348,7 +351,6 @@ static int xe_pagefault_queue_init(struct xe_device *xe,
> >   		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> >   	spin_lock_init(&pf_queue->lock);
> > -	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> >   	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
> >   	if (!pf_queue->data)
> > @@ -381,14 +383,20 @@ int xe_pagefault_init(struct xe_device *xe)
> >   	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> >   					WQ_UNBOUND | WQ_HIGHPRI,
> > -					XE_PAGEFAULT_QUEUE_COUNT);
> > +					XE_PAGEFAULT_WORK_COUNT);
> >   	if (!xe->usm.pf_wq)
> >   		return -ENOMEM;
> > -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > -		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> > -		if (err)
> > -			goto err_out;
> > +	err = xe_pagefault_queue_init(xe, &xe->usm.pf_queue);
> > +	if (err)
> > +		goto err_out;
> > +
> > +	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
> > +		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
> > +
> > +		pf_work->xe = xe;
> > +		pf_work->id = i;
> > +		INIT_WORK(&pf_work->work, xe_pagefault_queue_work);
> >   	}
> >   	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> > @@ -430,10 +438,7 @@ static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
> >    */
> >   void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> >   {
> > -	int i;
> > -
> > -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
> > -		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
> > +	xe_pagefault_queue_reset(xe, gt, &xe->usm.pf_queue);
> >   }
> >   static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> > @@ -448,13 +453,11 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> >    * This function can race with multiple page fault producers, but worst case we
> >    * stick a page fault on the same queue for consumption.
> >    */
> > -static int xe_pagefault_queue_index(struct xe_device *xe)
> > +static int xe_pagefault_work_index(struct xe_device *xe)
> >   {
> > -	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
> > -
> > -	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
> > +	lockdep_assert_held(&xe->usm.pf_queue.lock);
> > -	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
> > +	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
> >   }
> >   /**
> > @@ -469,22 +472,23 @@ static int xe_pagefault_queue_index(struct xe_device *xe)
> >    */
> >   int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> >   {
> > -	int queue_index = xe_pagefault_queue_index(xe);
> > -	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
> > +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
> >   	unsigned long flags;
> > +	int work_index;
> >   	bool full;
> >   	spin_lock_irqsave(&pf_queue->lock, flags);
> > +	work_index = xe_pagefault_work_index(xe);
> >   	full = xe_pagefault_queue_full(pf_queue);
> >   	if (!full) {
> >   		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> >   		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> >   			pf_queue->size;
> > -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> > +		queue_work(xe->usm.pf_wq,
> > +			   &xe->usm.pf_workers[work_index].work);
> >   	} else {
> >   		drm_warn(&xe->drm,
> > -			 "PageFault Queue (%d) full, shouldn't be possible\n",
> > -			 queue_index);
> > +			 "PageFault Queue full, shouldn't be possible\n");
> >   	}
> >   	spin_unlock_irqrestore(&pf_queue->lock, flags);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > index b3289219b1be..45065c25c25f 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -131,8 +131,21 @@ struct xe_pagefault_queue {
> >   	u32 tail;
> >   	/** @lock: protects page fault queue */
> >   	spinlock_t lock;
> > -	/** @worker: to process page faults */
> > -	struct work_struct worker;
> > +};
> > +
> > +/**
> > + * struct xe_pagefault_work - Xe page fault work item (consumer)
> > + *
> > + * Represents a worker that pops a &struct xe_pagefault from the page fault
> > + * queue and processes it.
> > + */
> > +struct xe_pagefault_work {
> > +	/** @xe: Back-pointer to the Xe device */
> > +	struct xe_device *xe;
> > +	/** @id: Identifier for this work item */
> > +	int id;
> > +	/** @work: Work item used to process the page fault */
> > +	struct work_struct work;
> >   };
> >   #endif
> 
> Matt,
> 
> There were total 4 pf_queues each of size = (total_num_eus +
> XE_NUM_HW_ENGINES) * xe_pagefault_entry_size() * PF_MULTIPLIER additionally
> bigger of roundup_pow_of_two().
> 
> Each of this queue had a dedicated worker.
> 
> There is a comment on queue calculation size in xe_pagefault_queue_init():
> 
> "XXX: Multiplier required as compute UMD are getting PF queue errors
> 
> without it. Follow on why this multiplier is required."
> 
> PF queue errors could be due to slow pf processing by handler in KMD plus
> generating PF for a single VM (asid) therefore hitting constantly single
> queue.
> 
> 
> Now there is a single queue which is 4 times smaller (overall) but it has 4
> workers and there are optimizations which potentially drastically decrease
> processing time.
> 
> In the end it could resolve to a case where a single queue had 4 workers
> instead of one which would be still faster than it is now.
> 
> Still, not sure if queue size is not too small.
> 
> Did you have a thought about it?
> 
> 
> And I think this XXX comment becomes obsolete with such change.
> 

I think the XXX comment was always wrong. We kept increasing the queue
size because of random overflows, but the actual bug was that we didn’t
round up to a power of two, and CIRC_SPACE relies on values being powers
of two.

I believe we never got around to deleting the XXX comment or removing
the multiplier. We can handle this in a follow-up after this series, as
I’d like a large change like this to sit for a while so we can test and
ensure there are no regressions. Then we can clean up the XXX comment
and the multiplier in a follow-up.

Matt

> 
> Regards,
> 
> Maciej
> 
> 
