Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9506C2BD09
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jun 2024 00:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC2310E062;
	Sat, 29 Jun 2024 00:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXz119ly";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB90010E062
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Jun 2024 00:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719622110; x=1751158110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8TsoxYskF0XMaeMucWiMJINx5PUIGNRcSjgPrKS7yDI=;
 b=JXz119ly+aVVaT+6VfQq+lrn9HiZ9AJRwuD8QdARgvXXevodvMiVNRvL
 wqWsE+FL+kp0THw2qFzNpjZSjEmms3kufnhpblkZ0K7hz0mf7t0d1X4Fm
 cVgXS/u7k8nL5yPvDsMNkKA/7LEPJN/HJZu7V0RvPJm7Fyo7uIuioXix6
 XYX2LpAP04CtmWhS0ugD8/xPXQ73xmYQVDui1n0rFHHDD/dp8LBHAyG9M
 e7hz1REsv6sYbvTBjWvZlGYSlSiTKXEQWeYFQjQjNAigsjhNOEbzi+F6y
 c0Qo2jEQzic7dUQaUPke6miZSFNOnPbrCtditb70iOSs2dgjVRk/5us8I A==;
X-CSE-ConnectionGUID: Pld8CjiDShWJuECHlUqpxA==
X-CSE-MsgGUID: oCKCg9eYQhye7gbRPV3sLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="17043888"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="17043888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 17:48:29 -0700
X-CSE-ConnectionGUID: jqBuBaSbTA+mQZRPO1RJ2w==
X-CSE-MsgGUID: K2lmi3ABR0mD6i18Qgv3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44934900"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 17:48:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 17:48:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 17:48:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 17:48:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 17:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn69PAKY4H71MG3Fmn/wZYhdggkMlMWLQWIfnJJCFG8/zEqPhO0nfe9ACR6bdAYvF0eLXg16m4DIbz0ipQUQ/MvLRcwa0eJs+LHFT4Gpt4u1k/TLne/o6isxH2k0fD+GpRakahbBR8GGKypoWtaX0vJEgYXMYC4rP17Isq8X5GbK6m7lO/D9jXE2HXw42IRqMd4Gfba7ip56sEpIDaicZREO9A4VeGXjlWB/aFPkxBj9YLA/C2EtGQd8WFxjrJ5CU2S/vas36vAVdDXVvmysugTKqyKkbJOzvnmLM0X/7EGmNPd7n7vtcMRGmD8br9zHncesba2uW09ql5OV9ay5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibva75+1JEhuqSGg9PiiaeTob/gtfCJu5AWBlHJSfkY=;
 b=QvmlTn6Py2Qx3jijoPYKWx1Us+1yb9zmJJusYeGiBAGTVfTBtWNH5abCPlnXc5XThKzlEt4sEfn1MUb/ORjOazpyFEBC98jaSP7LSNf4D2XJBox7+hy3f2DnKQ11TIYzSsB0YLwHyyZIKRzxWpX8xEJrAK5VwB4Uf8pjPQKX3ofCD18p1XA8GiT/LFg08OqcgDVEnGVW2/yDu7dEjjEyJxTCaM/BL/g1GUq3kdVTU8C6sGS3N1qKaOkYVkLzWvInwl8hpNloQlbgKY1GFc6DaodmCsmGMgXZLWzssTQHbRqYBAtTXwM1/GHYdRnC2UFTv3nxo/DWi2z89YlHTCCiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Sat, 29 Jun
 2024 00:48:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Sat, 29 Jun 2024
 00:48:25 +0000
Date: Sat, 29 Jun 2024 00:47:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <Zn9ZqVT7UqL0BeO5@DUT025-TGLU.fm.intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
 <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
 <ZnuJP4HOMsY0ImvQ@orsosgc001>
 <Zn0ATkJwe00C+hpL@DUT025-TGLU.fm.intel.com>
 <6egzvxymwun3sp63kwu4ceu6wd65osi3vaxmq2bsp6prddrqo3@3mskhio5m4as>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6egzvxymwun3sp63kwu4ceu6wd65osi3vaxmq2bsp6prddrqo3@3mskhio5m4as>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: c822c9da-208d-4773-3ad4-08dc97d52f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x3e9YTv29vldrV8070L6qyjxiv33Y0r4GMRQQQDVEvzNbzYKhP4DnlEs030Z?=
 =?us-ascii?Q?lYGlxj4M5b4WWU/tRE4If4GZHatHa4ggFsPgXmJN9FTsAQyCyqvmL5m+NMds?=
 =?us-ascii?Q?eyBdrs74WVbiknyJV/Yy5dgaZ+MJVZigJEH1niV7OKRMsr5U8QTFD6JkBP4W?=
 =?us-ascii?Q?onZX9eIhE8jFoPbRR6mGIDbR1gLe3tTY6su0dLaTJZb4mONgByM5+OukUrpz?=
 =?us-ascii?Q?8q0r2h+yRsIwV7YGLcvlOYTKkgGznOaTIebph2RVwwx8AZ8+eXDrzfpCDEEb?=
 =?us-ascii?Q?+xjt1ccW1thWQ+viXb/YRJPVknNpZ0oAceWvpSr9ASaFlfVJ/KsAbgZwzcit?=
 =?us-ascii?Q?Z2WeTHlJr9wRelksgFY4ARCmYRC6QX+8YOc1F4/Il4xYZAdJ7/amm9rLgTa2?=
 =?us-ascii?Q?LaYmLheFIdj+yxr9D8nkCztxkXlNNaq5tVjCi2igYkToVtRgK2MS6l5JsYvm?=
 =?us-ascii?Q?Sml4bFmjWmk5jYA56ojuMSMrNBvX7U+K8KzrWwiCZF+YqVlV88QemaFAtdXG?=
 =?us-ascii?Q?VwfBjIPMpWdI7G4OOLbN05T83S1R67WtRIAbB+saahSfxLhZqbLdPlhKVHfJ?=
 =?us-ascii?Q?6RZ223RBjMLIKlTydSnEFRgStvFiRXqTubKKGzefUcy1dlXkgoPpiOOL0Euy?=
 =?us-ascii?Q?RwdAJNzaS7uV/btjvwi5X5xNGTABVjNTWqIhLVfQ9IJC00WZ8odpqr43Vpdd?=
 =?us-ascii?Q?qszokxp4EN642ldwOPrYoFtnwR/v/0hHzcpxc6+yX+uo5eJQuqZOZmUBR/mY?=
 =?us-ascii?Q?XYT1Q+sEjIzApzGRxMus/YZ25uKLt7QVTS0Udh6938L0QP7LGLVLHko9FU3v?=
 =?us-ascii?Q?+pE53qX67yt7ummItBAVOqmzDtlpxlKWnMiXke2wveCn5u/y8yfYFAZL0RH5?=
 =?us-ascii?Q?53lYJqNR03klEFWmKNDiCGf39CIEA8k6ycD05ateI6EP6WR4gsr4V1SygLlC?=
 =?us-ascii?Q?vli7eYtUt+/gujgE/mWWbUxUIUDYK7XxxdjlwFNtATMZGA6KDuyQvxHrqkl6?=
 =?us-ascii?Q?eEEtzzqzSkw7QsXBTAD3qrahZXPLlzHOF/ynR4bSNAEht8FN2RMzPOFnJX4q?=
 =?us-ascii?Q?ZEkMBa1L85GHsEfWbMBYZSR9KdqkAHM21/GJnxUmOh/dogUPsCjN3k9xafn4?=
 =?us-ascii?Q?qJNEHL5C7nH4rmPaPfw9xlhJCOo06JUrKPUnEsv4FjHowJjHWTsZ47qsK38Q?=
 =?us-ascii?Q?pblmMraPUS7H3Q/hBn+uBSjgrXp9VN/2EQ/nhaLk0MGHb3iRphHYlkKkT5TQ?=
 =?us-ascii?Q?M6CWgNcrX3uzGyRDOOV3TeyRrGRIjWFq2KCdFMFtDOS6wlaCOzU4OFFw+N6P?=
 =?us-ascii?Q?ua8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HipwdQLRX9u2Cuxwk+SCGfEWuSLKY43Fo58I7H9PqLOZXXfBFUcO4L+tYkxN?=
 =?us-ascii?Q?ZroIknpxyAcUTqTlsyi5XYe2choajoLAHo1/oobnfhR9qqWIjTPONEZ4gbUu?=
 =?us-ascii?Q?YOGxKsd+c9sZA6ifTNgIc29QmNpi4SyXoyqh/RTm2LG8cGelN7s5z90cA2X4?=
 =?us-ascii?Q?ka77iJKHiT81IH7DmoRp0DAUQPVy7OsWmsfGFkonH5IxGB4bg9AvBScmwqiX?=
 =?us-ascii?Q?bLhZMQLvogzWIbe01/AWS5Ei/bsRlt7z2WTJ8ZJvYKRyE3nssCS2v1ONCrFJ?=
 =?us-ascii?Q?C0U6q5EN8FFY0FgPuOFV88B7K3iAN+zRzPefgrkPgfezYjvUAgh/Kp8Dmmau?=
 =?us-ascii?Q?uwUsPmJ6klW2/BdKWG5Ubd2exqUHXFKx5mJ5SjDbmhCl3qldwQ3vL3I35WNa?=
 =?us-ascii?Q?mjdtqgPTa/KSFUYQsyn9UhTWFV2IzAOVzwuVp/RfilwdVgCEBaRKw3eoJMH0?=
 =?us-ascii?Q?k/ajlXmjeM+kzLCM/kiz4DXR+UEQiNwJBemdN97yJjNpBn3d9HMjTg5mnr+L?=
 =?us-ascii?Q?lKWBgaayRtz1TwwG3lCkMMLZuGwQ6JgGx9yY8BaXZxw+6CQkpW1fUJS35hWb?=
 =?us-ascii?Q?qOfou0ZMFDYFeaA6VftnastZNMpuBuVVa5AIzB5/GDkLtTo+I12VYEoJn7Lv?=
 =?us-ascii?Q?smHDQ6Nsa+PY4r6bgi7nOcsJNt86vozxkyRBmTprMbLGa0aK4oBs8KUYcvjf?=
 =?us-ascii?Q?vfvMkbBsCG/2oeFcc1GnyaNb1VCqeuRGp9bssrBv2ag0VtZOhZIu/f41/D5K?=
 =?us-ascii?Q?clA8jOIRZHsuIMPyRWtAjp7qPGvefjlDVpVjQmG9HkM+knpzibDG3IVAcuCy?=
 =?us-ascii?Q?/eye5KK7vKPjurT8FbeoGOKS21HJZcUh6WXBd6wb35qCfff7a5XJ4Ikr/2wQ?=
 =?us-ascii?Q?pgR0jwP0mUjYCVIv8K6Im8q4rYEao27eyFP797QsfdV76w7fI5QTb1M1b8Uf?=
 =?us-ascii?Q?2waQUUQ0ClwpJMwdHM7oHBNDbZUpvt9LZfB7uf+7RNkSkp0y0pSl9ttFQPGL?=
 =?us-ascii?Q?wNfwWj2XG6NtdN6DTNanZ5HajQZEa/X003ZiP3FWhnBWOYJXGAxBKW9ITcwh?=
 =?us-ascii?Q?4kI9pxIzWPJS6QXeiq/rBNNMcYQmx5ScHhS/DlmvyjC/Wb+5Q8wc2pQ2JLln?=
 =?us-ascii?Q?a7ha4lwhBz3JmLs+07F/E/o2m2AlLZ2/RGQ/P8q/OS9dz89CJe35eis1OUNH?=
 =?us-ascii?Q?R+d7IKMQTzYd7R0F2oE58QV8orHo/h6COVQc8DbXRZC58I1Ga42mQOcvSCjS?=
 =?us-ascii?Q?sXD5fXK9fbSpetPbEGXassaX4TsXHFLGloWFuxX/Bn6p071v2uDb4kbRLtm8?=
 =?us-ascii?Q?M19GJdqjSDcbrK0MliKDal1LQOMCOXFY2xoW+s3/JzZHaX8g/vNJtmLLtdDq?=
 =?us-ascii?Q?WLtPS3pMAMzcTUhFD+GVNlWFtFsmy0H627A35aRGf0iACx9zrTvkGzpwrnhB?=
 =?us-ascii?Q?uyspd4Gr5HAX+dF5f0hdgsXv6fPEDbD9rqzm/UXjNkuVgdG0Dmv0OQAPTpIb?=
 =?us-ascii?Q?lTFwm1rQPmTlA/2ND6hhf4NlNegMT4mSI9k/juVNZRu8BvO7vwIIgz0CJhyo?=
 =?us-ascii?Q?nMKBXV5CcMmCNgX5JCzTsubqVTOimnIBwudTguTzho1HWGpRRTdVPlFOmcz/?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c822c9da-208d-4773-3ad4-08dc97d52f45
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2024 00:48:25.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jR76SS2HxWLQ05qa7ihYS4ytuXioA1n3zVr4e1noP4Jiq448Qkw06AslE4XqtnUwEsERhsJGIPmw+yi5XDpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

On Thu, Jun 27, 2024 at 03:58:20PM -0500, Lucas De Marchi wrote:
> On Thu, Jun 27, 2024 at 06:01:50AM GMT, Matthew Brost wrote:
> > On Tue, Jun 25, 2024 at 08:21:35PM -0700, Umesh Nerlige Ramappa wrote:
> > > On Tue, Jun 25, 2024 at 05:41:01PM +0000, Matthew Brost wrote:
> > > > On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
> > > > > On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
> > > > > > Current code captures utilization at the exec queue level whenever a job
> > > > > > is completed and then accumulates it into the xe file stats whenever the
> > > > > > user queries for per client engine utilization. There is a case where
> > > > > > utilization may be lost if the exec queue is destroyed before the user
> > > > > > queries the utilization. To overcome that, record the utlization when
> > > > > > the exec queue is destroyed.
> > > > > >
> > > > > > To do so
> > > > > >
> > > > > > 1) Wait for release of all other references to the exec queue. The wait
> > > > > >    uses the same timeout as the job scheduling timeout. On timeout, only
> > > > > >    a debug message is printed out since this is just a best effort to
> > > > > >    capture the utilization prior to destroying the queue.
> > > > > > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
> > > > > >    record the utilization in the xe file stats.
> > > > > >
> > > > > > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > > > > >  2 files changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > index 4d90a16745d2..f1028eaf2d7f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> > > > > >  	q->ops = gt->exec_queue_ops;
> > > > > >  	INIT_LIST_HEAD(&q->lr.link);
> > > > > >  	INIT_LIST_HEAD(&q->multi_gt_link);
> > > > > > +	init_waitqueue_head(&q->wq);
> > > > > >
> > > > > >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> > > > > >  	q->sched_props.preempt_timeout_us =
> > > > > > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > > > > >  	struct xe_file *xef = to_xe_file(file);
> > > > > >  	struct drm_xe_exec_queue_destroy *args = data;
> > > > > >  	struct xe_exec_queue *q;
> > > > > > +	int ret;
> > > > > >
> > > > > >  	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > > > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > > > > >
> > > > > >  	xe_exec_queue_kill(q);
> > > > > >
> > > > > > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
> > > > > > +			(q->sched_props.job_timeout_ms/1000) * HZ);
> > > > > > +	if (!ret)
> > > > > > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
> > > > > > +
> > > > >
> > > > > I can't say I love adding a wait to destroy IOCTL just to accurately
> > > > > report some stats. If we can't preempt this exec queue, the kill flow
> > > > > can take nearly .7s which would be pretty bad to block in the IOCTL.
> > > >
> > > > Opps, my timing calculation is wrong here as I forget that we reduce to
> > > > the preemption timeoot to 1ms upon kill. But my point still stands from
> > > > an arch perspective blocking in an IOCTL to collect stats doesn't seem
> > > > right to me. Maybe others have a different opinion?
> > > >
> > > > > Even the common case isn't great either...
> > > > >
> > > > > Beyond that, this code breaks if the assumption of
> > > > > kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
> > > > > code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
> > > > > forever even we wedge the device.
> > > >
> > > > s/even we/if we/
> > > >
> > > > Matt
> > > >
> > > > >
> > > > > Could this be added to exec queue backend code which adjusts on the
> > > > > final destroy? e.g. Add it to __guc_exec_queue_fini_async via
> > > > > xe_exec_queue_fini? Or does that not work because we don't have the xef?
> > > 
> > > That's how it was earlier, but the problem we ran into earlier was that
> > > xe_file_close would schedule work to kill the queue and in parallel go ahead
> > > and close the xef object. By the time, the queue backend wanted to update
> > > xef, xef was freed -
> > > https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
> > > 
> > > Maybe if the queue backend somehow knows that the relevant xef is gone, it
> > > could handle the above bug, but we do not have a q->xef. It looks like that
> > > was intentionally removed a while ago. We were using q->vm->xef in the code
> > > that caused the above bug, but that's a hacky way to relate the queue to its
> > > xef.
> > > 
> > > To resolve the bug above, I had added code to localize the stats to the
> > > queue and transfer those stats to xef only in calls where we knew that the
> > > xef was valid - like when the user queries the stats. The only open was that
> > > when the queue is destroyed, we will lose the stats stored in the queue if
> > > we don't transfer it. That's what is being addressed here.
> > > 
> > > > >
> > > > > Regardless if my suggestion works or not, surely we can do something to
> > > > > avoid waiting in this IOCTL. I suggest exploring another solution.
> > > 
> > > Lucas had suggested using a ref to xef object, but I think that requires
> > > bringing back the link q->xef. If you are okay with that, then I can add
> > > some code to make xef ref counted and solve the original issue -
> > > https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908. I can drop this
> > > series then.
> > > 
> > 
> > That seems to be a sane choice, in general I think we get into trouble
> > when we don't ref count objects.
> > 
> > So the ref counting scheme would roughly be:
> > 
> > - init ref count to xef in xe_file_open
> > - drop ref in xe_file_close
> > - exec queue takes ref to xef upon creation (user IOCTL created exec queues only)
> > - exec queue drops ref to xef upon destroy (again user IOCTL created exec queues only)
> > 
> > Seeme like a good design to me.
> 
> we will also neet to get the ref on objects where we store the xef (e.g.
> xe_vm_create_ioctl()) and put it when destroying the vm.
> 

Yep, thought of this after I wrote this. Once an object is ref counted
we should take / drop refs when another object has pointer to it. 

> ack, but the check for "user IOCTL created exec queues" is implicit as
> otherwise q->xef would be NULL.... because this is not coming from any
> xef.

Yep.

Good to see we are in agreement.

Matt

> 
> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Umesh
> > > 
> > > > >
> > > > > Matt
> > > > >
> > > > > > +	mutex_lock(&xef->exec_queue.lock);
> > > > > > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
> > > > > > +	mutex_unlock(&xef->exec_queue.lock);
> > > > > > +
> > > > > >  	trace_xe_exec_queue_close(q);
> > > > > >  	xe_exec_queue_put(q);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > index 201588ec33c3..2ae4221d2f61 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > @@ -143,6 +143,8 @@ struct xe_exec_queue {
> > > > > >  	u64 old_run_ticks;
> > > > > >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> > > > > >  	u64 run_ticks;
> > > > > > +	/** @wq: wait queue to wait for cleanup */
> > > > > > +	wait_queue_head_t wq;
> > > > > >  	/** @lrc: logical ring context for this exec queue */
> > > > > >  	struct xe_lrc *lrc[];
> > > > > >  };
> > > > > > --
> > > > > > 2.34.1
> > > > > >
