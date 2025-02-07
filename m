Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C6C02199
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 14:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A3310EB11;
	Fri,  7 Feb 2025 14:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6uwY0aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F4810EB09
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738936791; x=1770472791;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nJGAVj5JE31aA50r2dTIGfLrvUa+k7VKxr2wIeamuag=;
 b=G6uwY0aqZlB8onH0T1QDkSMScALjQ7egjlzBqTPSy52n+XzEV46XA9hI
 PD8Ivs3fQIoHjowjUpvWzln8s0tsz2RUhBBMGOjtQ9gLgNm8enDW5zKD0
 /bm3jVbYwVoQK8JayIBTP/RM7P0C/r+4fXERN4ozgeOeY2E/Qnf0lYjfq
 MiN4e74veZikg5FDurBEYLuKD5fki6ugBhalDpMUZrK9LawONchJU6jqc
 3VYTuAdK8PbTF0rbT695oCyErs+23+S43D+UMPUcZeTXk2+LdTZ43Ietg
 spUuP8FVWIC3eKT35KvMlL2rePLGAloIp74smZk/Sdv0mo18BEP9VG3oq w==;
X-CSE-ConnectionGUID: pV4TLkx4StGWHuK3JqmCEQ==
X-CSE-MsgGUID: O2fLje1TQUGIx7tmWciCLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39842319"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39842319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:59:51 -0800
X-CSE-ConnectionGUID: pvxPJ2c/QFOV6XT+RwjyBQ==
X-CSE-MsgGUID: OBJLqQcKSJCr5NiIQuIqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142402359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 05:59:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 05:59:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 05:59:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 05:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aypDITjyslts9rzrUVsb1EKCFmRv+v1M4WdV1kPzNl3YpH8AUIkoFcDuDGKxRdp1ftA7g9SNW8O7Nl5XKzbWrVgXNzJPh8RgO/Dl1MfjGPszTeZtwBgjwwuaxKDkXWwQ//mZD75MIWdPp6VWXryHABuZXBxVxovRkq0wycJyqIRgtCLdyfIkSUUqNy0RDsn6joGIKCNXlnS+xpTXahxax1/U//t1l2GzNX+2EmwIRJ4Ht+kJsuGBk40+HgwBI5Gsz2tIDgRh35L694xfiQhn3QpLSkzwH7tzjWuJYxxGXGTsOFyK3GWyFxvBJudCDgOK1L07fcKRp5Z6rjr8XlJErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13SoR+GnaupXmrctLKgo8PQ08OYW8G7aM6gAuSlJDjk=;
 b=wSONkOTowlteDDC/aYBMhycme8LSwEqHzfTnyFBNB5C0VAfeo0z5jYA6Gp+XUlMFKUqSJV+W6eJgEelH0Q1f+9aQchxiImoASA4eSSqlXHsZ4I0ZJgVQj2HP05Md9CkOoHQ1TLn67TW7ratmUN+VwPWAHPF/KDm+izAn8f6kOuYCicYP+HfOjSAn6tF4Sp09vLoFyk5dGDor2a453fo/c1RtaEZRZViiM1B8eh/fY0koCOtowvXdCd63AkKo0Zh+RQt0j7f7uHKc+JZrMSIUtgJ1qnMQkSKgAiVzodEVKt67F+CKHtOUYTMih0fgyuGAcg3y7xQVqghFO2IgG6u8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 13:59:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 13:59:47 +0000
Date: Fri, 7 Feb 2025 07:59:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v2 13/14] drm/xe/hwmon: Fix mutex destroy
Message-ID: <qxcgkdmkprffu5owlqbagbxffl3i6ccuylhlutyaarbnsi7spr@lnnrh6u64pno>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-14-lucas.demarchi@intel.com>
 <h3qkpwdljkdfi22j3ldgqenhlb6j6k6wuksmazdfnuy3twapjn@umhq67gyaekc>
 <286f74fa-1021-478b-b8db-74acd4f320cb@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <286f74fa-1021-478b-b8db-74acd4f320cb@intel.com>
X-ClientProxiedBy: MW4PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:303:8c::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 3081c0fd-24e0-4a15-e019-08dd477fae9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T0TNPZgvI7pRIJ94cFZse8wN+gLzprzFJkb8w6vc6xe1erj5KLg3vC2Onh?=
 =?iso-8859-1?Q?i4Tzqzm8IgBUIdeEFBT8l3gci/IddkPQrWrhFIwLwJj/RbGiLKInxZDIjf?=
 =?iso-8859-1?Q?Qw8UKix6wvXAv4pk5xLn68AlyNfyFx5tAS6BWEu4jNSPv3Erf5IpcvsqHk?=
 =?iso-8859-1?Q?qE6PN4PmoIVkCd5IqLDWVhxdDMgOkLNQt/YoZJXnmfbYRWfb9sUkQlPdve?=
 =?iso-8859-1?Q?AgeGEqzluoogocYZuRQxZdIQ1PYh5RR374d2tg1Ep1ksmMS/F1yRgjDLFS?=
 =?iso-8859-1?Q?XeA7KZ8k/X9ALhDu53ACOPz9EAMC37r1/3Pse04FTySAgmlWNsTCYzle49?=
 =?iso-8859-1?Q?jnhNlEINu1dkgbdgFozDAql+Un8NnWCJGbEHVzR05sRoV6Wlydu6g9mKOB?=
 =?iso-8859-1?Q?25NqH8x6e77wbALYu/BBRNm1g4NKaHo6KnN5jBRb7pmWYrkueRKlYZDpI5?=
 =?iso-8859-1?Q?SZ7ycCULbtnGEUjq+YlXB2q2SWo65PW25HQ52JDOWG2Zmw9Be7N7RMGLIx?=
 =?iso-8859-1?Q?PMG1lZzEVPYGSV9Dl8fbPIVa/Ies4aBOcVDPowBVE2ZmLID+YRCBBioNX/?=
 =?iso-8859-1?Q?2G5MVa8+ws8A2t0neRjynmc5MswNWjHg+dPA9mYEOxI6ySSFVo4Qc9MyjV?=
 =?iso-8859-1?Q?lSpFfCSXZfD2lBDw4IdPJKUEUCVz6tXtj8JcJmCp7sVvl1Y71sVRrUFHoD?=
 =?iso-8859-1?Q?mmcdcD9t5ANh1xsgyrABN0ypCtOF7yJRb85/7lPZge/MnJKfVDH1+mmu3r?=
 =?iso-8859-1?Q?uIMOyfWyNrGx2BLx91pAx15olFNH3DBxAU8NNl7j/eK/pIWkKu3SnO63vj?=
 =?iso-8859-1?Q?Ewvuzj4/gk926RhbDXGh2T4ldJIuDyUeJ8OD+LAkR3uOtIY0PoZndXCSGI?=
 =?iso-8859-1?Q?jVS7NOHWQGtVbdgGjZzQAJ7D1tKioaxuowO6NpflIt2ap5+p9d6IPEo0f1?=
 =?iso-8859-1?Q?ueTeOjS2/XZCkEVVaR/dP7xFfor6LHGVturNa8g8SQUUmBiiJXkceCv97V?=
 =?iso-8859-1?Q?dP0opEkT3acwihs3kA0qgw4uJ105+byMBDrx9/j+k96IH0xuNO0bAMBVi/?=
 =?iso-8859-1?Q?6EikTiX1FJ/cbIkbB09UhMhpHPSO0xc9+V42nOV7cpbc7J5bvQAwrSm3ah?=
 =?iso-8859-1?Q?kAvdjtE0qBfD+2p87PQ2QaoyYWYaaaKldpX+/6ut6Q7KxKeQ0TCTSPGjfs?=
 =?iso-8859-1?Q?sAI9+0V9VWE58ejyfT/2BtamBUN3PgOxX2HYDfWnVtzl8qOpV6yaNaM3w1?=
 =?iso-8859-1?Q?dR63naWvFn1on+WpIYiBgT7XuR6rHtIXY9DJ7FHIhyzQWo+zAGiqCUQINL?=
 =?iso-8859-1?Q?Zqo+QhA/tz1tDYf+qIKSZ8AIIDGK+0l8VlYe4hyRY1mSRDEKh7t/beTusd?=
 =?iso-8859-1?Q?JQX0J08uEB3DbvLycdB/lhNhXsLeaDkuOrHy6mzKtE4PcX8+jS2kUEfY0K?=
 =?iso-8859-1?Q?sK26LWtyICDuax1w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UTzVz5lIaWFqQm6VXHbDExdxhhswoebPfVZD/ZY01u2mGpPnTmnTTTestP?=
 =?iso-8859-1?Q?Sy9rvDhu1DePy2uzbMmFDamwxDEQKPlsV2FNTeqyGLaS9+31ZmwWklaYCP?=
 =?iso-8859-1?Q?6qwP/DBlDZfAkVP7vT8MbshvlZoh9h3fYz4QQHJ05yiaQKrsCTIa3arwlD?=
 =?iso-8859-1?Q?9wFh3qBw21oYOcp21BTm4kHJ1YXC53LQmD3MCmjEcyUX3/8Viacg8Z+9SW?=
 =?iso-8859-1?Q?ybH3+HetRkGx26Yi61YsJNxOXCCfaJkb7NxadDNPrEewHIAAGw985dezyO?=
 =?iso-8859-1?Q?Iz/rd2ty39pGiMmiIHY/ZBi2pYXQ5o7JiH42ASAxtbYpbDm2EwwYORBOrN?=
 =?iso-8859-1?Q?rWee8B02rK6uUBiM+kA5+lq6odK5V/HTg4KCdAPW4Pj97yprOsMmIB5uAs?=
 =?iso-8859-1?Q?1fnA/PbvljO+gsQh3NhJ1CbjSOMKWhX1Ynv0Ia80lKNTwvAXJawUShgP6Y?=
 =?iso-8859-1?Q?YrXF7Tn88oAlUdaRSGFLMqIlNmNIlnv3cEYBKq5JIYJJf8mieu+qbhmMvk?=
 =?iso-8859-1?Q?wr4Z6IfeTBv1tyzsM0DyoX8HzlJ49ZRUI/Df0LIG8LJ/y/8s52QvuhtlPa?=
 =?iso-8859-1?Q?SeAoj9RIR7L8TPZ/5/uGqpZMFdNdlBQkfAAHKhxuk060u+sleGLJICeLVG?=
 =?iso-8859-1?Q?efWPLnZVIGOze7RZsTa40z2PvkNsGPZd8oSCHQKbsEhV3cbZlqnQFIh0UO?=
 =?iso-8859-1?Q?mDuqvdGzBuIiPZ0uL6KB8XwIw5PNj2Vr8Lger0DxtJBnlxbdTVs51XBxla?=
 =?iso-8859-1?Q?E7KS0zPafpM+8t7q1bgnZafbRoqGMWLbiz83Bb6WluGExXXOLSrHDs/uYs?=
 =?iso-8859-1?Q?NLajcmaSD3TinQnFvxDvLKA88Xyckh7alcCXnYHLLZLsT95fagVI13nfXZ?=
 =?iso-8859-1?Q?JT5FzhcawgkMIgjW3lDer9DfpSzblMQZ2GI1464pt+bw+gUSXE6A8+XBNz?=
 =?iso-8859-1?Q?N0Ra2M57mTEZBgvtm/yBwfJQl9u3bPzFvDw3lmXlUF7HnlPUSEvTDFeTVK?=
 =?iso-8859-1?Q?sk1nQ0nPOTEHi8PGjd8wFFOiZowfLpGsA1ENEQT1ByXitnGMXtUe7jr46Z?=
 =?iso-8859-1?Q?09g2im9PrkPJl7J2wb8GN5BP4Uvzi+NDtUM7TJhSffD0hxaWqHhAKnRrBP?=
 =?iso-8859-1?Q?DcEJ0chCh+iEn1EjhlvbzEwhB2Xk03paXtpk2HJiW/DkIKjOMHm0E94ZwC?=
 =?iso-8859-1?Q?rEWoJytncAB1U4oPe3clN3LSueMCz9orlfpincKDnRXXP+fDho6g4pkbuw?=
 =?iso-8859-1?Q?RqxWlKnK8VQt/pxSPcjpEEFSlY/Qq56WLKz6Yi57H/YlRlpx9ra9DbP2qT?=
 =?iso-8859-1?Q?Au0+1IeILsXYGNVkHuPu8rkJuFV7DlF2SWlW/kyPuOIBDiu5MIRPmh6/SP?=
 =?iso-8859-1?Q?Jy6/nFDdF8utE5tJ3fHqeUpYanK2MtpAomQYzJSJWRhXDloKd05QVOrAOn?=
 =?iso-8859-1?Q?/WzcnbI7BFzRl8hlzdLmhIN/5TVznxxcyiFcFEG/wsbkOX9en00ceINvgW?=
 =?iso-8859-1?Q?v7emxscoqTLhCDiFmIUkGzi7ff7Bfrtm2FC6iq7/FGHcEJ0hLA0rcB8q1x?=
 =?iso-8859-1?Q?eUuAn8IdwNLSL30X6A6Il/jasM2Ag+WwxxEKyFgoTpAgyD47e4mccmgMqr?=
 =?iso-8859-1?Q?vqurZaZJNkOtsPZ+lDw5euylV5ZElp6VuBZTDu/H+kefogDECjfRitMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3081c0fd-24e0-4a15-e019-08dd477fae9a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 13:59:47.3819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ahbx8NyKvoFqcftxPtZxzO3sWvP5DRHu0Dgw70jWMb0/GY+8kETwIQrM/jIm8mTDhkMJZcWnHvm7DUXfyEYhgy86JNaUL5C55JjAczhkkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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

On Fri, Feb 07, 2025 at 10:20:18AM +0000, Matthew Auld wrote:
>On 07/02/2025 03:27, Lucas De Marchi wrote:
>>On Thu, Feb 06, 2025 at 03:23:31PM -0800, Lucas De Marchi wrote:
>>>Since the mutex is used if userspace kept the fd open, it can't be
>>>released together with the dev cleanup and needs to be delayed. Also,
>
>Where is that? I would have thought here that 
>devm_hwmon_device_register_with_info() would ensure nothing can reach 
>that lock once the physical device is detached, since everything 
>contained in xe->hwmon is tied to that, including the lock. It looks a 
>little weird but seems like it should be fine?

yeah, I t hink you're right: I forgot that in this case we are not
dealing with the file ourselves and are one layer down the stack, with
hwmon doing the necessary thing to protect that. I will just run a test
and probably drop this patch in next rev.

thanks
Lucas De Marchi

>
>>>there's no need to add an action just to release the mutex: use the
>>>specific drmm_mutex_init() that should be smarter if mutex_destroy() is
>>>actually a nop.
>>>
>>>Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>Cc: Karthik Poosa <karthik.poosa@intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>oops... 3a13c2de442d6bfaef9c102cd1092e6cae22b753
>>
>>the reasoning is true, but the entire thing is in struct devm allocated.
>>Then CI complains:
>>
>><4> [321.873848] WARNING: CPU: 13 PID: 12544 at 
>>kernel/locking/mutex- debug.c:114 mutex_destroy+0x5b/0x60
>> >
>>Lucas De Marchi
>>
>>>---
>>>drivers/gpu/drm/xe/xe_hwmon.c | 10 +---------
>>>1 file changed, 1 insertion(+), 9 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/ 
>>>xe_hwmon.c
>>>index 7f327e3342123..0fc91c184570d 100644
>>>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>@@ -869,13 +869,6 @@ xe_hwmon_get_preregistration_info(struct 
>>>xe_device *xe)
>>>            xe_hwmon_energy_get(hwmon, channel, &energy);
>>>}
>>>
>>>-static void xe_hwmon_mutex_destroy(void *arg)
>>>-{
>>>-    struct xe_hwmon *hwmon = arg;
>>>-
>>>-    mutex_destroy(&hwmon->hwmon_lock);
>>>-}
>>>-
>>>void xe_hwmon_register(struct xe_device *xe)
>>>{
>>>    struct device *dev = xe->drm.dev;
>>>@@ -895,8 +888,7 @@ void xe_hwmon_register(struct xe_device *xe)
>>>
>>>    xe->hwmon = hwmon;
>>>
>>>-    mutex_init(&hwmon->hwmon_lock);
>>>-    if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
>>>+    if (drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock))
>>>        return;
>>>
>>>    /* There's only one instance of hwmon per device */
>>>-- 
>>>2.48.1
>>>
>
