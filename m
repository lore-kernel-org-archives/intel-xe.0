Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66987C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 17:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699A10E0E0;
	Tue, 27 May 2025 17:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBovp3NM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD19810E0E0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748367046; x=1779903046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tnsy6y3Z7BmbGtYUt8Ervuw0vJYv0iQOm7Umj8kxsx8=;
 b=PBovp3NMwUtz/4kjOL9RFovCpr3igxNk0LSeS0zzGDSbCxRbBwj2I420
 c4LZOUl4aOWnGbxf/liQ6ITPC8caFP9tbtuGrU8E27gFjiSFz0MjJDCPb
 pEGtjhNZTUVBQbEfCuATxyi+sarCHJT/XqRlBF/bLvf80aFXeVlIf0dND
 Tn2uPbDCoIBp9lBDeBhsBO6/efJ0lD3rASa0lewcq0D5T8VxpZCkmEyJ3
 6lWeFludXErSl1SRxxrjRnEm7qqk+MSuanZLDqp0cPA0aPsDYZzdKVGED
 8DiroJikfYRMiE486sPoTQPc4DHGfy4AaslLCdKYf1ffAgLmQtQH/ndoN g==;
X-CSE-ConnectionGUID: +T1CVjoRRM6KfYPvoYjtAw==
X-CSE-MsgGUID: 2OBffhI6T1qwOjs37AsEEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72907387"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="72907387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:30:36 -0700
X-CSE-ConnectionGUID: p/IOOQSTTsG/qqH2YS2zUQ==
X-CSE-MsgGUID: de2QRdc5T8GcpklPegQYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="173871922"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:30:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 10:30:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 10:30:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.56) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 10:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOdCJQ4Mcb2mdM3/wgiz3f4onbXf4db37mdjCUf9vjCQKQhkYVx/ddyUETZTdqXhFnQdho2KuvJlk6SFlPnQ+Q6tqeIYdtlHZlDx68n1xzPY20gwPWoQKZS6rS+A4+wn6qsCpr52Hi4MOFL4tzBv9shSKWeGMsSDmlKHQAOpewKFQMMSzGUS0o6rCfh/oOQaJqylyCaOSA0In5dZdf/cdPidDEHWjtTUIy84tkQDCB2sZCi6DgakLZMl9GMqMoRXAbhVNGSa57O/hki2cKYs8aqv9AnNhphhjvgsgrw168zLt7+fN6tIQeuPY51fLruFJwLmNqMoIvBrDF1b22QcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGsx9LaVDDHJ3AzGZh/v3//THsATpmDhUGvF931aFfY=;
 b=cBbjN9kDfJ1WsIukFKt6/ayElAqg+q3WlkZOJdh0hnsys6svhfyboRgwmJV/sINBjSsD2weRQNifac1wI6Xsb+m92cW+8ngveklyhsW5tUoWEHAUQ342b53xsMPnZYDKrCUH3hEVNpKmbTzFOE+KB5+Dh6lYT4ie4hNNRv8lXgTwZrWaghyRgt1A1zpZyOYQGFRmLiFRHWaHn+b6VHNGl7eCNLTzdviIZJfO4Tk51XhdkDzGSeBUBtXZSFK4zlLFxvOFeDHF1APi6I5S+qLFO87Yofn61i90vh0T1nllfFB6Sm+/3+apqPhyvK+XTm37bzN2KZz/ZPZ9t9c66s+8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 17:30:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 17:30:31 +0000
Date: Tue, 27 May 2025 10:32:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 24/32] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aDX3EiUjQDCTrptM@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-25-himal.prasad.ghimiray@intel.com>
 <aCTs4du68Hs4Kgla@lstrano-desk.jf.intel.com>
 <e8e052c4-65b5-4618-b4ef-61596e042b78@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e8e052c4-65b5-4618-b4ef-61596e042b78@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6292e7-bf4f-4ec4-3709-08dd9d442ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5xadI8hcAkn+G6uZtzbKkVCS6IibNtbf7kjVjXdOWl5H14tOsWhS4O2vxinc?=
 =?us-ascii?Q?yeGvrPLQc6yjcUiB4um6Csghx4GD5RYSnElrQJfe14cl899xKXO1GJ8jJnD9?=
 =?us-ascii?Q?+KbABepzjsDleSTX+UfIGmh9xp7jLXNYQIyZt+KidfKgsMIqE/BZueufBMaD?=
 =?us-ascii?Q?S1F5nRqOli/NKO3GLzBicPj+ZdpiDDjxj2A307b26Vb0vapjreoTvN5IHxsS?=
 =?us-ascii?Q?/kH8Qkw40L+wwVOjE5kwkmcbBYnsX4dQcqKo3ZIxAP6AxPA2yeYEhVeLxnzy?=
 =?us-ascii?Q?Bip/SDmJ8rLZRPDamf7sXGBv7qjc1D9YeAcZIBDzy2qB2DBlUCJJ+O/eWAGj?=
 =?us-ascii?Q?yB/ubMMbfqgNgPAAit8Ibz2XKQTUZh+f8yjix0Jt1pUP8kuNka0QIgsLXJNx?=
 =?us-ascii?Q?7VU9WK909O4nKWMgP7i5T0nRvhyWhTuY/LHUDl4XhKacNU/A9K21bglJunAo?=
 =?us-ascii?Q?QO3cO3PfT30TaLQ/TKV9MTEQMNbbw30YrNWYTfrN0mvECJToPc9dLOPJul67?=
 =?us-ascii?Q?JxZRag6AVB4aOwGo3d4zMY2yCJJgwUOAxFLLxmfjgyUq0FTTE+owiBh1ezDf?=
 =?us-ascii?Q?SqKkvGQuTwKzdR9tvV5iL8DRsFNw2vn0oB+NL/OZnf0kdUq3Ixzv0C+h0Jto?=
 =?us-ascii?Q?Z+dN7s74XHda+Krp+a1YkrkETS7a6+J+HPg4xzI3lypzsvGBhWgkNeF+bjvl?=
 =?us-ascii?Q?ff6RlQ/Vk8QjhnzObwcqdkAC++XjdqByg8ibpKFUw57kU71zrl+5rjweCWB4?=
 =?us-ascii?Q?28uQ5HBpp0sHS7Tdj/8Q00tvzeclxaUn/tyr2Fii7eVquqeuKbIY7FrLcfch?=
 =?us-ascii?Q?F9k8aa5OO2rN2rV1XVXWbii6t90PHn6ofMQNb9zzDG2i9IInTLI7pjw5S2Gh?=
 =?us-ascii?Q?jZmSJpPO+jKWLl0gU+TtJW4gZSRd8y8F92zZ7mjXMT164zon2j5EOmCuT/0R?=
 =?us-ascii?Q?fJgT/tPqWuP4WgostfRsPQYa/7wLm11Y7gss5fRgsWBh9Pzyx+mZyIbyHL9L?=
 =?us-ascii?Q?0K3CpwxSPwcA6okPZhCQpZste94tyxRsruwQ8RqXYsh5bs8hAk2fMlNUmhGU?=
 =?us-ascii?Q?GzvihLCFVDCkUdBoWCezsxaMZvd5OTC8B1B6MJwDQcGbjmuoD4xvvc0NvcpS?=
 =?us-ascii?Q?g/AziMLLa2yJb/S2hnumSokQnZeVComDPKA92k3ViMY9SpjTVbez9xhDFCQy?=
 =?us-ascii?Q?NGflf6rXLflHhzyL6BdPHn3VpHDZuAiuNDMkmr6NQQgsJVpuQ9jNCKOpIki+?=
 =?us-ascii?Q?M7j2k58+Gp4qbU1hFe5qhmwuGHcOlr+j+Bk5W2hY6Bpt81JSUJ/qdogNMyFg?=
 =?us-ascii?Q?5ijMUdAEHKqRWjY7rqCt5mccDzWrZz/4wEAn27daJEXhVnqSilHxhNLgoXW6?=
 =?us-ascii?Q?V2oNaKCOJRqYrr/joj6gp/YEFJveflpuCuEOXZsRik47mgNRWrNV2cPTczIi?=
 =?us-ascii?Q?x/HQc30FG+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+I1LDl/JO2S4sWl87zPj7dkZuFCUD62CXk6AskkXRJ9Bys7TznGin1M4MOb?=
 =?us-ascii?Q?qlHj9+9xnhJrGKleAhTJNfDXMVEW04zJYfCxdfndtD9Kf/z0/8ZVqWFlpRTq?=
 =?us-ascii?Q?VyMMjXRSp6Z7BVrG74mfkIACdfYwQgCYu3x/H2VGRtEVW7DkXuiLsuOJQpAF?=
 =?us-ascii?Q?VVB7Exzqt5ucCp3AD1ZWK115V6H9j6JOoAqCYELDd1V703cIp2yD0RN6IS6n?=
 =?us-ascii?Q?8ll5ml5rRwhF1TgI+o24+qwKel0MZHK9CoaVLokIoUJfoGdXvSuu4oFJMZ9F?=
 =?us-ascii?Q?D14tY0k1w5W3qg9K9SrJGgc2AQceQ+9q4fdKUgentpNhowJxNXy6cv+o294f?=
 =?us-ascii?Q?i8eb+ximvkDNQIgpQKZewt1Gn2uph+YdpYUSt9BoxEOOXTcysw9Cyqh8noEZ?=
 =?us-ascii?Q?7uNQ7T6D4qE40Rds68Xn00CpGkg7C8WwZP6RP9tqH0RRhQxqGMmuJACxjv67?=
 =?us-ascii?Q?VIerbdzC8fZj1I+DPwvC+qExQyhb+w/HL+v4suMumSTeprBEVTjRdTQavsNG?=
 =?us-ascii?Q?4cQbUnbTV0IvCfuV+tm5zTtjC8mM6jk3OxgPd12iyIp5XWNvoURHrSOr+e0r?=
 =?us-ascii?Q?cUcNSIGHimDaGWTP66gCBJwze50m/61PzcTaGWyP8lVmz+vJ72IkU1IngivU?=
 =?us-ascii?Q?QtkXVOnI9LKNKaR5dOyajH4vNKT4gR3aV1b44JpcshcNGDg4ll6FziAZziQ3?=
 =?us-ascii?Q?Aqd791TCmuBMv7sTe038IzFtEsAR5LUM8v97L0PHbGsgF9rTJEdHIylytT0C?=
 =?us-ascii?Q?z432cKg5Dww0tTeb4KZswZv3cG1ULbJkv+Wp3pHd1Q8eQtZfsbYIRPLCzmOb?=
 =?us-ascii?Q?VziV9/vhH0PGNiEwRSNp28jPR/7Ju56PEmXgs4LHX+612NKGPfAYlxKdb1dy?=
 =?us-ascii?Q?YR9EOuuzjntagCsSKRrbrB0W1Dadx9MbpAQqMcFiHJFW1QIY9jIsst7GdsbU?=
 =?us-ascii?Q?cyRj0UCVlolZoI08IFtGGLd2BgwMrSbGcYRLKyGY/E5wsHnr5NHIhZnjGh8j?=
 =?us-ascii?Q?OIHfcudO4HW6GfOkkIrW4n3WSCF7GP9xVvPfspuHAq46kvnc77x+ofOYR9ez?=
 =?us-ascii?Q?5VqLtxfS/QLZrFxoZ0EKs/AxCUo1eVKdrb5ER09/bLH0endv7LWGJhCcYHQs?=
 =?us-ascii?Q?+sRy2HnNBlOOem9Oz3rSEO8mDmoqEiljkejgkOZ6Z+ld3Lq6T8qqikKeVZUr?=
 =?us-ascii?Q?jaL2yLaHdXz44Rw1V7ozsAS2DuB0R9IWfNMtN+NKGJoFNHebXq2Bct5VCFLy?=
 =?us-ascii?Q?toT+LKcVP3et5NLdII3a49II54nc9qgWLIrkz8VJqyRJaX1E4skmFDQ6hvU9?=
 =?us-ascii?Q?VcqE45+JNBqnTLMhAxIXydMvHYDzMx65iF6Vn8vWjr9ZfCvaglR9zcq8oy2k?=
 =?us-ascii?Q?GPSg0UHkxAvMyQxObokdPDC7LMvAlt9LINGyUQYnhodGM406Vi3uYd8rqpLC?=
 =?us-ascii?Q?dOI7qJ3SAb96PKQTWBdheYp0LZNU2dlRIjA9zb5oO4S1LhUxYnwItzmSs593?=
 =?us-ascii?Q?7pD0C99JEOervfnwU68nEX+hGxOe4xPkxyLVR3TTYaK0guTLw1VUHyQIaK3V?=
 =?us-ascii?Q?5ujz0axjO5l5Xhd9cGLgnqzWzL49vbWKv4/VmihTvqDsIZ8W2mOz/8pWtDAo?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6292e7-bf4f-4ec4-3709-08dd9d442ddc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:30:31.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFY2gqkZZ3DKbxGFUNeqcNLaGUPU18ez7CTN494DeEf+5GLkMKovQbml4wFZgasKFNvOVCd6o+dYavg/OItGcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
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

On Tue, May 20, 2025 at 03:51:26PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-05-2025 00:50, Matthew Brost wrote:
> > On Mon, Apr 07, 2025 at 03:47:11PM +0530, Himal Prasad Ghimiray wrote:
> > > In the case of the MADVISE ioctl, if the start or end addresses fall
> > > within a VMA and existing SVM ranges are present, remove the existing
> > > SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> > > unmapping of old one.
> > > 
> > 
> > I'm quite confused why this patch is needed. Why is invalidating the
> > ranges not sufficient?
> 
> how the madvise is supposed to behave if start or end of input range is
> within existing svm range ?
> for example lets assume :
> svm_range of 2 MiB exists in offset and  offset + SZ_2M, madvise is called
> with offset as start and offset + SZ_1M as end, in this scenario vma
> boundaries will change and previous svm_ranges needs to be removed.
> 

Right, this is a weird corner case that needs to be handled. Will review
this patch in detail in your latest rev.

Matt

> > 
> > Matt
> > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
> > >   drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
> > >   3 files changed, 49 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 7ec7ecd7eb1f..efcba4b77250 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -903,6 +903,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> > >   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> > >   }
> > > +/**
> > > + * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
> > > + * @start: start addr
> > > + * @end: end addr
> > > + *
> > > + * This function cleans up svm ranges if start or end address are inside them.
> > > + */
> > > +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier, *next;
> > > +
> > > +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> > > +		struct drm_gpusvm_range *range, *__next;
> > > +
> > > +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> > > +			if (start > drm_gpusvm_range_start(range) ||
> > > +			    end < drm_gpusvm_range_end(range)) {
> > > +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> > > +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> > > +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> > > +			}
> > > +		}
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * xe_svm_bo_evict() - SVM evict BO to system memory
> > >    * @bo: BO to evict
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index d5be8229ca7e..d00ba6d6ba53 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -98,6 +98,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> > >   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> > >   					u32 region);
> > > +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
> > > +
> > >   /**
> > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > >    * @range: SVM range
> > > @@ -291,6 +293,11 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> > >   	return false;
> > >   }
> > > +static inline
> > > +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +}
> > > +
> > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > >   #define xe_svm_range_has_dma_mapping(...) false
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index c7c012afe9eb..92b8e0cac063 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2362,6 +2362,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> > >   			op->map.pat_index = pat_index;
> > >   			op->map.invalidate_on_bind =
> > >   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> > > +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> > > +			struct xe_vma *old =
> > > +				gpuva_to_vma(op->base.remap.unmap->va);
> > > +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> > > +
> > > +			if (op->base.remap.prev)
> > > +				start = op->base.remap.prev->va.addr +
> > > +					op->base.remap.prev->va.range;
> > > +			if (op->base.remap.next)
> > > +				end = op->base.remap.next->va.addr;
> > > +
> > > +			if (xe_vma_is_cpu_addr_mirror(old) &&
> > > +			    xe_svm_has_mapping(vm, start, end)) {
> > > +				drm_gpuva_ops_free(&vm->gpuvm, ops);
> > > +				return ERR_PTR(-EBUSY);
> > > +			}
> > >   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > >   			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > > @@ -2653,7 +2669,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> > >   			if (xe_vma_is_cpu_addr_mirror(old) &&
> > >   			    xe_svm_has_mapping(vm, start, end))
> > > -				return -EBUSY;
> > > +				xe_svm_range_clean_if_addr_within(vm, start, end);
> > >   			op->remap.start = xe_vma_start(old);
> > >   			op->remap.range = xe_vma_size(old);
> > > -- 
> > > 2.34.1
> > > 
> 
