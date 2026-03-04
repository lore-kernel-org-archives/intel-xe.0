Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E6EDEBF7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777B110E8FD;
	Wed,  4 Mar 2026 00:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmOH+C9f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F5410E8FD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772584004; x=1804120004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GbeAASOF0Kb7QDHeBzQXmU8gFseF4Ce/m711UB52KkQ=;
 b=SmOH+C9f7EAaIHwJIcE4PgJQnwXcBDZPBBaJvP/8sBbrhRK0YfmpcdgA
 Tem/zPtMb5Vcf0SwhSvPFK01bP4f7OTwDvk8iSU+84D3WmC7qXzd3QvHg
 +sNuhlb3Aw7UeOcyNSvaOW28PMrQaQSphdYI8o1NgXMVmT1ad9X3QX3J4
 OpJ6M9QkECYqfSk3c6XnmmP+h1P5llKiEHYks2lKaGadAzoUiKFYxkWND
 nA95tt4UYfUjlKEdG1iVrTlJgui1f7tGbuhVkGygdLr4gg9dvSP1uI3t4
 REsLa8MEtJzyDBH8koXIu6hrn4iT4GRvglZ9y1vuPfLxFLkRWsIfTdLv5 Q==;
X-CSE-ConnectionGUID: pmCmVr2hQuyeMsK25Jwlcg==
X-CSE-MsgGUID: 9FkZloPwQtyT9N/DqY8SlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73603297"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73603297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:26:44 -0800
X-CSE-ConnectionGUID: iyCreifrQz2rxm+8WovaFA==
X-CSE-MsgGUID: GNPp3v7aRZGeLNuPBy10AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217328378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:26:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:26:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 16:26:43 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:26:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlpHLEz99cUULKMHAuhH04Sedo9uXIKtxzJjtTm88ttql2deFDIC2b/sAEzfo+kUm/jcwZGQUBG/cB8Gau7yKPcScsk77sNPQMHZbiTAFlg0GS/b07WLo+jgBL0Tnhu2/myq3J0xXARikjG6ZNkCNgP2a0yZinJrnK2W3+/+CGF1Pv+cMxfmWVDqQ9u60nqHXrQgZQp4VKRRQG/bER3lECIEiamhQ8V3Ek+xfqHOU/IuoICLhQ8VlSsZVeWoZWvsqbAv7Kjv+Vmy3zTrWPviRocWyZ1TeJxAxpnKsJRXPMexOI3W8ZL1M/rIrOdpmkAmUk5Z8J3ZhBPEYNpRUy7UoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRQt1FnWxj/FVrH45Gp7FhuUX5/ikydJYNbfr6MnrUs=;
 b=RlaWARqTuSL/PGknxVuk8vokkrTGXmQjlUDxj2i3Ur1Yj7YzGOxyqZ6K4gxx88eL4Ruvd258DnSt8GEPREfggV7AI6FS/sWLHTwlvOy4mjeVaMQtK6/0X7qOZFYPnuQLTs+fIUOUZ/RdBIGGyEranC5RSY1KzNCv3GOZn7z36jhSf0CNXV7uMfayjVo9b4fi6kFUmf0zx52IS7ZWEXZO++kzE2F7VK6VqcNalo8hcT1pB66hpnh7tCWLsOKfhw85KdmWuOWsD82JqsYTWho0fbPhHxRtZt5FZq/n/DjEH/mGAPGqz5/Rs2tnKYUnqnJx7/QCbmfnPzIC9XdkCmHq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 00:26:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 00:26:36 +0000
Date: Tue, 3 Mar 2026 16:26:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 10/25] drm/xe: Update GuC submission backend to run PT
 jobs
Message-ID: <aad8OjQWtbuk5FqN@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-11-matthew.brost@intel.com>
 <c044f56096bec2616ebcb6d0247a1238d9ef8209.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c044f56096bec2616ebcb6d0247a1238d9ef8209.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 4798b1e4-797e-49cc-88b5-08de7984b214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: BwMLg0f4IkPDkDKy4dIpekpTyNo8IrJTSYAzqJCoj59lBlJ03D6IAudlMpti0mP9npZTfW6C3NPrGH0NZwVxqk8l2eOEj6I8ReY7+g5mVwo1g7Eyk1RqxVXMjE0IN5NVV2+dHEwjVzgBqFDbeRcBh5JMhpLxoqqkkBQ++IxDsx4yKjiRITj8WUjiUrouV4ehAh4KSImSlKvpHD/6EqiPHGBM4Eydx7MauHoFlXyBqw/egZ+r6pwA0gDgc3/DhXOAtV16DaNpNGx5qQ1KDECdTuswZXBxKVzGrznADKE6nJFkOoudnEqdY19KtRRK9uBcjAlBywBBXwgPfLaDFsX+jIvZh9HZuxjdVkAIA8q7ndn9V0hyZ9YRqbLxEFpGbCbgFGEl6GCgtWXCskYiNG/uW9ckVPeEWvt0TDcCULEXOi7SedKioowxeFYG4G673FL7/hTQeS/ZPUoaIPhmr5S3+4/BfeoswLsm44RuJlL8MdwDutyyh9eNYhpgObo56ZrLhYHaxKEesSkrquW0YF5FuL5XCEU9cJcFQRao9no+SjHOho2oOwziPDUCvLhjOb7wK9dTYvQJaGgF1nHwIyBIBtoqX1oEVFgHMWX73lscJv/hG/zgw99wihasLwfNmzIHrveHlhY7QMuGtrVVU/LqbXvts1BvnM4coSt38pf0ccJgtCF9uiI3+8ymrcINZWwOXCYAOHW0zJ4yV8ODHj8swQic0AZfh9gdOhzM9HW45k8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejFQUzhKWUF3OXRnZytLWjVxbWQ5NmR3dmxlVHQ1bDUrZnFXN2tqeFJIWm5K?=
 =?utf-8?B?RWdHTy95R0RHRytnTlRWZHJUcXY5MG9Yd3czY1habWY1OE5KTTBYU3M2SERB?=
 =?utf-8?B?eHFXcUY4L2lOakhid1RSRHRsSzdWOFBSUFhoRVlwZm9uZ0lvdjF2eEJ0TmZw?=
 =?utf-8?B?bHdIWVN2WTlDQlNNOVhzK2ZRcy8xNkRlcTAyaWVwMjM4bVQ2aTE0ZHg1SDdD?=
 =?utf-8?B?d0xjcDRBRGlEaXpxeVJEWi9BemdZWlgwSFAwTm1nMEVHUVdBQ0FUUGhZc2ox?=
 =?utf-8?B?YTFqZkcvOEhlNVV4cmd2OGhMWHRWVTQ5c2IzUE1zWHdKVW12U214a01EaGFB?=
 =?utf-8?B?S09VTS9vV0YyNnpKOUIwdXNMM05pUk5HNFMrd04zS0FYNjVrNGlXRW9TaGpk?=
 =?utf-8?B?aVlNTUZ5TXlJczhBUnJQVWhlT0tTUVB1azVxQU5UTGZqTGU0OUFVYXc1bnhx?=
 =?utf-8?B?WnluSi9qSm5WSmtFVm5lb0I2OWhLMXNXWk5XeGRZSUVmOVQwSStPdFlram84?=
 =?utf-8?B?N2s2eWx3NnJwOXhVUlBTRU9VYi9IUVhoQlFKM2NtRkxrRnZDSFRYb3J0cVNL?=
 =?utf-8?B?cmVUQ3RIMzEwS2NXL2x2ak15bkMyWk42SmJtZ3NOcm5LMG93SjROanVtRlFS?=
 =?utf-8?B?NTNnTjhqbU0xMTFzQ09ISnZHajRhMHh3WDUyMFN1RHV6QVBCYmpIZ3FJUTR5?=
 =?utf-8?B?bS9LVVh5T051NjR0cEw1WlAvOHJCTjBMd0FERVVCL0ZKRjJBSk9KNVlxMm1L?=
 =?utf-8?B?VHM1MlNoclRFMXYySlNTRFRlRlFBVmZUelhaTVR5bzhCVWNSWWc1MnY4c2xF?=
 =?utf-8?B?cW1DelJlQzVBK1RIRkxIWVZJTWVoMTVveUFjNDVtNVpoSlpHNlp5Wm5neGdL?=
 =?utf-8?B?eEtjbkM5d2pFUTlpVWcrMi9sMU9UaER2c0FrbWxyN0pqTElFeElRU1c1Nzhz?=
 =?utf-8?B?K1Nmc01wVU9UR0ZVZk1QcFFQMjRQQmpod1VKSDlkMGdwMlBDL25yWUpKa1BM?=
 =?utf-8?B?WXl0MDh6WVhWdWx3bVVaYTFoeXNuWURjV2JtSHRwWXB3TmRHR2MydExIRVV3?=
 =?utf-8?B?eldNTlNYQ3NQZUJvWDltcllHTFRHQldkRFRMNklRM0dQNmIwYzNtMHVPQkxL?=
 =?utf-8?B?d3FNeXJ1djZLOGdiTk82b2hPQTRRemNKUy9ML21OOWIxbWExYTVCbDMrSDd5?=
 =?utf-8?B?UnpXbE5VT1lWVXhUNTliNFBCZUhwb09xemV5MXljOFVmRlhBOTZ0bHkvL2Qw?=
 =?utf-8?B?cVJjM2dXODlCTy9FdU82dXdPdGpBK1hjQTVTU3pTUDl2K2hhUVA0QWlKQlQ5?=
 =?utf-8?B?NXRYaDk3NmtJWWFYMnl6bXV1MWpuMDRqaitPVjZzU3ZoNUt3alVlQmR4ay9k?=
 =?utf-8?B?Q2FLKzBBOTh0Um4wbmYrV09EdkFwUWxkREpRbFllcGYyQTBENEUvdHlqZmox?=
 =?utf-8?B?QXpWbW85TytZZmJoOWYvYWwxZk15LzdQVEhOQnRGd2o2VGhIeWFDVitORTZC?=
 =?utf-8?B?ejJVT0g4WWFBS1hVRzZpbW83VFdMc2RFMGtSamdmQzJHbzU3aXJma203ZUcy?=
 =?utf-8?B?a1kvdFpxbVZLWmdGYjZ1STg1TGJuQ0hYNENPSmJnQW9vNkxlMFpPQUhTNnpC?=
 =?utf-8?B?UnZxOFlnSHRTcDdXcUFuMW5ON2hoVGVJYzNzMHlYZ2UwelBKWXhRUzU4dVlq?=
 =?utf-8?B?VWtDWkx3aW1OeHBnMm5sdnU0U0YrQUZiM1ZJQ2x0SW5GMlppa3NML0dvWWFC?=
 =?utf-8?B?WUpCVTZQVzY2YWtsUWp1bVI2T0h6dno1M2dEWWFFRzFlVnNHVlZvdFB6c21U?=
 =?utf-8?B?S0piVjdJREEwQWxsTENRTzN3cnJMamFVV3kvQ3c1Z1JhTjNjdXhqM21sVXV4?=
 =?utf-8?B?d3R2bFRSdVRJVEUzRktEQlNka0YxeHRwL3VrWCswRkluM0Q5eFQ5cFY5OHhQ?=
 =?utf-8?B?K0duYmlocmVWckhmZlRxOXpaa2V6STM4R0k2VjdYM0t2dW1PeFBHblFhTzJl?=
 =?utf-8?B?NHk5cDdjeGR5azk2anlZVDdmY1VuTVNVWFhhSnY2eEtyaUxRTWlMYklMWVZ4?=
 =?utf-8?B?QnBmS2hTalgxanRpdzlxSE5teDl0RHAyY0xzbWt1dDBWT24vUEZPcGpGcUl5?=
 =?utf-8?B?cDZacHd6YTFXMGN3eXpJbCs1Y2tMQXZXZDMrRWMyUkNRNVl1alhvcHk3eUNn?=
 =?utf-8?B?d2NCZGltWTFRTWdnTFpoTmlYWG1TOVkxR3BkSGF0ZVNSeVc0TXVuNldXUzVh?=
 =?utf-8?B?eTlydWI1L1NTVHIvMlFBQXhKeDlKblgxUjRyQjF6dFFaV01OQkhkeWJrbmpD?=
 =?utf-8?B?cUVrclpxT1NVeUJiVHNlREk0T1RFUFo5ZjdpZE45eEIxL0JZa0FLckxCOUdP?=
 =?utf-8?Q?GxGpOJZhxqLrnmmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4798b1e4-797e-49cc-88b5-08de7984b214
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 00:26:36.4902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiXrcaThgjF0z0MsXkHUJ+RT24EEvJWlGTJoHXbcymMGDNRVRF9hJ9RdzFr91mZrslakG5Sa0XYdAxNZGYMfmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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

On Tue, Mar 03, 2026 at 04:28:50PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > PT jobs bypass GPU execution for the final step of a bind job, using
> > the
> > CPU to program the required page tables. Teach the GuC submission
> > backend
> > how to execute these jobs.
> > 
> > PT job submission is implemented in the GuC backend for simplicity. A
> > follow-up patch could introduce a dedicated backend for PT jobs.
> 
> Still looking through the whole series, but standing alone, this patch
> doesn't feel right to me. I don't see why we'd want to hook together
> the PT update flow with the GuC backend...
> 

I don't think it is either, which is why I called out a follow-up to
implement the PT backend. It’s likely a bigger refactor than one would
expect, though...

- Build the backend on top of xe_dep_scheduler
- Introduce xe_pt_job that inherits from xe_dep_job
- Ripple these changes through CPU bind, the PT layer, etc.

A lot of that is just shuffling code around across those three steps,
but it’s not too bad and will likely give us some nice layering cleanups
along the way.

The real tricky part is handling all the flows that stop/start the
backends while various global events occur (e.g., PM enter/exit, GT
resets, VF migration, FLR (WIP), etc.). All of those flows are currently
GT → UC → GuC layered (or, for VF migration, direct to GuC). So we’d
need a refactor there as well. It’s doable, but it will end up touching
quite a few files. Again, once we do this, I suspect we’ll get
additional layering cleanups along the way.

So for now, given the already large size of the series, I’d like to get
the functionality in first and then tackle the layering refactors.

Matt

> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 37 ++++++++++++++++++++++++++--
> > --
> >  drivers/gpu/drm/xe/xe_migrate.c    | 13 ++++++++++-
> >  drivers/gpu/drm/xe/xe_migrate.h    |  8 +++++++
> >  3 files changed, 52 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 453af51fe87b..1d6ac7a6563b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -36,8 +36,10 @@
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> >  #include "xe_map.h"
> > +#include "xe_migrate.h"
> >  #include "xe_mocs.h"
> >  #include "xe_pm.h"
> > +#include "xe_pt.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_sleep.h"
> > @@ -1183,6 +1185,20 @@ static void submit_exec_queue(struct
> > xe_exec_queue *q, struct xe_sched_job *job)
> >         }
> >  }
> >  
> > +static bool is_pt_job(struct xe_sched_job *job)
> > +{
> > +       return job->is_pt_job;
> > +}
> > +
> > +static void run_pt_job(struct xe_sched_job *job)
> > +{
> > +       xe_migrate_update_pgtables_cpu_execute(job->pt_update[0].vm,
> > +                                              job-
> > >pt_update[0].tile,
> > +                                              job->pt_update[0].ops,
> > +                                              job-
> > >pt_update[0].pt_job_ops->ops,
> > +                                              job-
> > >pt_update[0].pt_job_ops->current_op);
> > +}
> > +
> >  static struct dma_fence *
> >  guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -1210,14 +1226,25 @@ guc_exec_queue_run_job(struct drm_sched_job
> > *drm_job)
> >                                 register_exec_queue(primary,
> > GUC_CONTEXT_NORMAL);
> >                 }
> >  
> > -               if (!exec_queue_registered(q))
> > -                       register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > -               if (!job->restore_replay)
> > -                       q->ring_ops->emit_job(job);
> > -               submit_exec_queue(q, job);
> > +               if (is_pt_job(job)) {
> > +                       xe_gt_assert(guc_to_gt(guc),
> > !exec_queue_registered(q));
> > +                       run_pt_job(job);
> > +               } else {
> > +                       if (!exec_queue_registered(q))
> > +                               register_exec_queue(q,
> > GUC_CONTEXT_NORMAL);
> > +                       if (!job->restore_replay)
> > +                               q->ring_ops->emit_job(job);
> > +                       submit_exec_queue(q, job);
> > +               }
> >                 job->restore_replay = false;
> >         }
> >  
> > +       if (is_pt_job(job)) {
> > +               xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
> > +               dma_fence_put(job->fence);      /* Drop ref from
> > xe_sched_job_arm */
> > +               return NULL;
> > +       }
> > +
> >  run_job_out:
> >  
> >         return job->fence;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index cd6802642ef3..e9b9dfe19e48 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1715,7 +1715,18 @@ struct migrate_test_params {
> >         container_of(_priv, struct migrate_test_params, base)
> >  #endif
> >  
> > -static void
> > +/**
> > + * xe_migrate_update_pgtables_cpu_execute() - Update a VM's PTEs via
> > the CPU
> > + * @vm: The VM being updated
> > + * @tile: The tile being updated
> > + * @ops: The migrate PT update ops
> > + * @pt_ops: The VM PT update ops
> > + * @num_ops: The number of The VM PT update ops
> > + *
> > + * Execute the VM PT update ops array which results in a VM's PTEs
> > being updated
> > + * via the CPU.
> > + */
> > +void
> >  xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct
> > xe_tile *tile,
> >                                        const struct
> > xe_migrate_pt_update_ops *ops,
> >                                        struct xe_vm_pgtable_update_op
> > *pt_op,
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index c3c0740f908d..30c9c990a8b1 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -24,6 +24,7 @@ struct xe_pt;
> >  struct xe_tile;
> >  struct xe_vm;
> >  struct xe_vm_pgtable_update;
> > +struct xe_vm_pgtable_update_op;
> >  struct xe_vma;
> >  
> >  enum xe_sriov_vf_ccs_rw_ctxs;
> > @@ -157,6 +158,13 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> >  
> >  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> >  
> > +
> > +void
> > +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct
> > xe_tile *tile,
> > +                                      const struct
> > xe_migrate_pt_update_ops *ops,
> > +                                      struct xe_vm_pgtable_update_op
> > *pt_op,
> > +                                      int num_ops);
> > +
> >  struct dma_fence *
> >  xe_migrate_update_pgtables(struct xe_migrate *m,
> >                            struct xe_migrate_pt_update *pt_update);
> 
