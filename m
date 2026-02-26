Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05025FD8FDA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB33010E0AB;
	Thu, 26 Feb 2026 17:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSanbD10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983B710E0AB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772125890; x=1803661890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NcGU01qOk7ex3/KAtXZXOgONPR70lKv3v9iE82fBIGg=;
 b=gSanbD10YAqm9mDj5SdRvsC3b52fVWPztGyQ/7TjMvKnLUw07uTsCwc+
 2LQbolV4hdl9fjgNRIKolqhRD3JB7K7QwVeaMJRHupBkLbGV79IPhFdNe
 voGx/Tu4VA2hbHFyq1EpV2itkBg/i8pve2oDAVEa2lZsyrDpRib7RWM8p
 EL9szaEmbLZ1XYNa2owzE15gxDZ20KtXYqZbatlRSbE//7JvpJXLRrFRm
 TcG18RbdaWH2HU/YY74pwuOT93Y9Ojag6w7x/F3tZ2CtS7y0eALTZlkii
 Oc0suyhept49bcLhdMnz5w6FjTrOk3kmvzSmYEkNhp4rY1DNrTtjFWAGP w==;
X-CSE-ConnectionGUID: vbmR+INoQHCN+K/a95jH6g==
X-CSE-MsgGUID: 0eROsfsFQ52RdCcQ4OOjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75796394"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="75796394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:11:30 -0800
X-CSE-ConnectionGUID: tCu7W8UfQxW+Nl0l5HACTg==
X-CSE-MsgGUID: zLNYfQXeQvmn5iDXmOr82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239617540"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:11:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:11:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:11:29 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:11:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZxs534ByJx7HXanhvoJAMLjX0D8vuDlSyTIaic2v/heYM1on9QT0K+bbSAhawRnVGmVZKOwuyW9ftqGmEGPtS95NRSvfY5ygGL0wkZj6X4MLzYFHryD/HE71SYXlgrl1n90KvA71506oyhmoM1H+o2ycDsQjPf4kS5WY8igIihbUKF+xPyVt25prrrod/drmnecsLqbodzRbYKGe9kF8BQ0YnK7sxAJ33qTuQEqBZWdesatc0ziNDp6KVRqyg20SumlF04uR5kgyHsZtRsW2APH95Yv8Ne0SQAYaHvi63tO69j69dODWX1L4hO84P4xWrt+pUEbvkrpydfeClafRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuusD3KkCuBpWS7X5j7VXH6KhTk8BNgVigJl+1oeGtQ=;
 b=CXB5rf3zF3nil+j7FpDhXMS9n9uPurSt+Xhzq4xeVgBhKTSzIZ9prijP5RcV/qKEXU4+LBwulAOEhWqt9iV8zSiflfAWe6D4vD7USpD/kPmWRtyAHA2mLyFR0CrsUhYeQCFWzlJkTzcn21TxlMub/S+ZjVmC46xtJ/RyO8Ai+lbphtuurOsG6wb6nugsVoMcsq6I+vPjkH/A4aI+OXzJMB8uZOTflaasIjpTeWuyyyjSSH13+yt9Ld0ZNzQL9C9dNC9kFHSRERjvzv3ZeYdSd5BB2AfRE2k7UFafbcq5htrJHEeDp/StrBD4vxh9M8xR6UpQBTqhRzBH/NzOMAOkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:11:24 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:11:23 +0000
Date: Thu, 26 Feb 2026 09:11:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
Message-ID: <aaB+uBE28cSkeuBv@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
 <95ad0e5b8ed775c2a8948a09ebab75c7acfd1a74.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ad0e5b8ed775c2a8948a09ebab75c7acfd1a74.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4e1b3f-b8c3-43db-215e-08de755a1182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: t4h5Hjmz0KUdGTeKgg2KlGjTjkilPgTvFNnGIle32y8pXYLtfk0SODF/tq3CpxzzJVSApolVq6IK6IsJgsfUqaG2Pln04CkQagJNjeZtajoEuOsGA3myyxR3GvYN7G4OutLZciTxAB3H2nQumo5M9kw+EJA0c4N6DlSiHpqPC0JmwDJEJ60B+uRgWn1ePpBIPWzToVAZMV1OMGvPT3lLlX+jpX4sI2tyQtIcvuQzDUinFkV5AaHeROXG90xs+a5/gJrT+VJmRsrAwRK0KtOpOskakdLv3atOkz7jfyezQp2RUC93Bcs/OguHTHVdKvTSdn8qdNzhtjPxZQSCOCpAWXhrzV4e7g1+belhcbJ65+aXUnasxUvOdL+PRjgs14kTHSVMqq0PmbOf+lfKJ9z34XSp21ZDu9gOYPJWovxOC/jcvx9qZy8f4hOhsDj/Kc1gz4nzojm9k8fZEcS6LVmws1x9RMvs1/96qfUBdZr7lh8ehMEfl6AzomBtJA20eDZWIp7HtWOn30iHTu2XJ471xW5hOmPQBbuYCKUlf2Qh+qbrjl1Aa/Oxy346Ua8LH/2W+z/bKx/BDZWM7+QTRfZGWQ54i4T5R9CuJ+Z8RML7P+4K+hEimEo6hkHpGm7NnlMZmN/Bdi+b17qsX3+Vgenw/8RzjAYfSwt2dDOXNEckFChixZkKAOIqdiVWJfRbthWFybZIxEuxjCH2jr3u1Q6perEx15e5U7GlT7xyltJB9lM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVpEKzJUWXNKcHdKRjRheDFreUJzYnc4Z21kcWRGM3k5SmVQZmZhNmFNclZu?=
 =?utf-8?B?Q0VjQlFVSTYvZEcvZHBkZTRiVnNXdWdUc2JZTVBJQkxzU3J6V0wvbDI3eVN5?=
 =?utf-8?B?dUIyYnF0d2graXUwOEpiQWdiRzhmVzdIZENmZkQwZXMzT3RLZWJwL0ZWanRl?=
 =?utf-8?B?Rk5sTlRWSUZ1R2tRK3N0MHJWbm5xVmczWndiQXdxWkp3U1BteGlNYWdscTBS?=
 =?utf-8?B?cnczZmdKZ0N3QXZTbi9qYUZ1TU1NbVd1Z0Zlem9nWEtIdWZ2OXA0eDFNQ1pU?=
 =?utf-8?B?Nk9KTFA4ZXlpb0FVTzJwSytPWkVUTnlXbStzMTU1M3lRSk9WT0tSUE9ueTZu?=
 =?utf-8?B?NG9SRlRieDl4djlxUVVjckI3NFVrWVNTeEVNdEczM1ZieGNvbmU4RTFuUXMx?=
 =?utf-8?B?MHdScjBMQ0oyUERpVzdCR3R3MW9RbTJaWGp0MExZZXNJTDVuallYUEEvekFn?=
 =?utf-8?B?NFRRM09RSDRsaGRQSWI3aEVRL0hOVU5uNEsrZXRrbTJkSnN5ay9oMXhFRU9W?=
 =?utf-8?B?VDA2K3lYT1ZEenI2dlVlSDB5V2VGMEcwelpjaEt4VDI2bjdTYzBRbFVYaFNL?=
 =?utf-8?B?MFdKM2liU2lkUHc0TERaZ0orclNpOEZxRFFlV21UV0dmT1lrS1VSTk8wb2d6?=
 =?utf-8?B?amQ4Mk1BQzRPdUw2bW1Ca200NU9SZDc5cnB4dnNvT1JRdy9jQzdqNlRObGU4?=
 =?utf-8?B?VzdnRVQ0Qmpuc1NLYXpyR2ZITjd5OXlMY01BRFdhZ0F0SGh6Y3lkRVlhRCtj?=
 =?utf-8?B?NlZrZXRDRm9MZkVQUTk2MXZXVU1pZUttMjlpdlhjd1UrZTF4c0ozSnp6SVJs?=
 =?utf-8?B?UWdqcmNYZlpOcVI1ZU8wcU9NZGVQRTBUeC9aci9BTTNPeDlNQURDdzdvaGRH?=
 =?utf-8?B?a1NLbENzTUVYVTI5Qmp0M05ZTzVYM1FHczFKMFpoWUM3RGlzRVIvWWJUQ3N2?=
 =?utf-8?B?dW9IQWczOVdTT1JYN2NFdG81VEJRS0JYd0NhY1FPbWxvNWQvUG1hMmR5TWF0?=
 =?utf-8?B?clVuLytEeGhEeGk1alJmcHpwNjNpenkwZTZzcUJUZ3E1WGpxRmxoT3N0NE0w?=
 =?utf-8?B?Zk1xWWN2WUtaWURnSUNPaFMrQ2xoajdoT00wblRpTURESHJ6TTJleUJ4TzNn?=
 =?utf-8?B?emNld0xnR2cxVXFJS1pXSDJwQmZLdHpmU0JSQkIxdmpndlBXWGhSZk43c2JH?=
 =?utf-8?B?bTZzTEUvUkY1aDM3VHd0OVlDY3RUbWNyVmY1MUJlcklyT2lhcmxSbm5BTW5h?=
 =?utf-8?B?dXR6bzdjUERyeFY2bnNZcFQyanVxS2gzTTZmRk11Q21GV25UT0piRS81ZzdE?=
 =?utf-8?B?WFhuaEZEUVlEWk42VGR2Q2UvTVVtbnljZFNkclZ5MFI2dHczWE44TkN6Vitl?=
 =?utf-8?B?WmpHa2VkUnppUitlN0V0Uko0TUJNTVZsTE4rbmplQjN6ZWgyc2VKbGdBbzY3?=
 =?utf-8?B?aXFPa3pzRTVSbVlSZ2s5dHd0VThlVStDajU3YUJCSGZjK2tBUkxXWk85ZEtj?=
 =?utf-8?B?eTlaYW5CRDRFNVhxR1k5WTNPZHlyQktBbm1icUpnaEIyT1lrd3Z4d3RaZURV?=
 =?utf-8?B?WVhKemJmNGQ5eisvdEdsZS9aZDFwV2xOVWlucFJMTEZXZmRaR3MxVVVDYWNp?=
 =?utf-8?B?TU1nMkxDWm5xaldVTFNLUzduMjVJb3A2d2VRc3BCcElpZ2ZmVXZBa2VlaXB3?=
 =?utf-8?B?dCt2Zk1rdzZaY3QzUFMyMWtveGFlcWNzUkZOaTVNcmZ6aFJPTDZtcEhLUGsw?=
 =?utf-8?B?UkxhUTJ5eGd1emFiNGdqMXRhdnl2YklzRTZ0SjJ0K0ZITEJtY3R5QzRhaWU5?=
 =?utf-8?B?WDRDUHNNNlpVUzNuZE1CdHpDR3Q2cEJGOVlXZWtxMGhwSThxdE1KcWhheVN0?=
 =?utf-8?B?OFdrVHo5V0l5TUNKWWdOV0lDa21aYnEvK21jOWVBL1JCVGtRcFJhbWNQY25E?=
 =?utf-8?B?ekFiWXFJZDAwMjNUeThTMEZLRy9UVm01V0lDdGxXbWp1UXNqREVCYUNaVlRw?=
 =?utf-8?B?S3pZNnVyUk1ScWtyeVZjRUlFVFBXdURpMzRXNWNSalN3cEdtT1p1eHp3Q0xP?=
 =?utf-8?B?dHFwNWh1SDgxUWZuSENwWEhqZUF2ZDBFd1dFN0NEcEtwS3hqVi9wNlk4b2ps?=
 =?utf-8?B?YTlDZ1dqS3d6Qi9vbUEyYllGRFQ0WHU1K1ZXREd6NVcvVVkvdmw2cU9nTjkr?=
 =?utf-8?B?S0FsNUNsS2RHYWprOW1oSmowZU1lcjBPYmhEbGkwTHhHaGZEMXcycFhuemoz?=
 =?utf-8?B?VXJPcElDbXVETkdWOUFMZWI0a0dveDRnc29BOWppT21PTTlienQvdjBCZXhR?=
 =?utf-8?B?TEp0MEZCcFMzWnNVRWZraFpodS9BT0dManNBYVNBUmwycDdhQ1NDTVEzZXUy?=
 =?utf-8?Q?+V2zizbHaS89Cud8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4e1b3f-b8c3-43db-215e-08de755a1182
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:11:23.8070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHwkOnQ7dkNXljR549The1v7wGUYtzQH+qjRwK5HkAddR7JRQ/0s5mxaSWhpe6I1rwgZSr9frb/h+tmMlwlF2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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

On Thu, Feb 26, 2026 at 01:25:19PM +0100, Thomas Hellström wrote:
> On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > The LRC seqno is read by the CPU in the fence signaling path. On dGPU
> > that read can turn into a PCIe transaction when the seqno lives in
> > the
> > main LRC BO, making the hot-path poll/peek much more expensive.
> > 
> > Allocate a small dedicated seqno BO in system memory and map the
> > seqno
> > and start_seqno fields from there instead. The GPU still updates the
> > values, but CPU reads stay in cached system memory and avoid PCIe
> > read
> > latency.
> > 
> > Update the LRC map/address helpers to accept a BO expression and use
> > the
> > new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
> > teardown.
> 
> I remember this was discussed also when enabling discrete for the i915
> driver but we didn't have any timing information at that time.
> 
> Whether this is a good thing depends on the amount of cpu polling per
> seqno bump, but I figure that's typically always at least one CPU read,
> right?

We store every pending fence in each engine class in a linked list, and
on every hardware IRQ we walk all pending fences to check whether they
have signaled (one hardware seqno read).

We do this because with virtual engines we don’t know which hardware
engine instance each submission will run on, and the GuC is free to
reorder anything. Thus, we can’t rely on a HOQ check to short-circuit
this or look at individual hardware engine instance. Perhaps we could
make the logic slightly more advanced to short-circuit redundant checks
on the same context, but let’s put that aside for now.

In bad cases, there may be quite a few fences we need to iterate over on
every IRQ. If hardware fences are in VRAM, this can add up quickly.

I arrived at the 1.5µs improvement in fence signaling by running
xe_exec_system_allocator plus a script that parses GT stats and outputs
the average time spent in xe_svm_copy—comparing the patched and
unpatched versions across 10 runs. Each run does roughly 2k copies and
provides very reliable data; I’ve been using this method for a number of
SVM optimizations I’ve been working on. I believe I also had
clear-on-free enabled in this branch, so in this case exactly one
hardware fence should have been in the linked list per IRQ.

I would think this is always a good thing given the disparity in read
speeds between SRAM and VRAM.

Matt

> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c       | 57 +++++++++++++++++++----------
> > --
> >  drivers/gpu/drm/xe/xe_lrc_types.h |  6 ++++
> >  2 files changed, 42 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index 38f648b98868..d72146313424 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> >  #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
> >  #define __xe_lrc_regs_offset xe_lrc_regs_offset
> >  
> > -#define LRC_SEQNO_PPHWSP_OFFSET 512
> > -#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > -#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET
> > + 8)
> > +#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
> >  #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> >  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> >  
> > +#define LRC_SEQNO_OFFSET 0
> > +#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> > +
> >  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> >  {
> >  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> > @@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
> >  
> >  static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> >  {
> > -	/* The seqno is stored in the driver-defined portion of
> > PPHWSP */
> > -	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
> > +	return LRC_SEQNO_OFFSET;
> >  }
> >  
> >  static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> >  {
> > -	/* The start seqno is stored in the driver-defined portion
> > of PPHWSP */
> > -	return xe_lrc_pphwsp_offset(lrc) +
> > LRC_START_SEQNO_PPHWSP_OFFSET;
> > +	return LRC_START_SEQNO_OFFSET;
> >  }
> >  
> >  static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> > @@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct
> > xe_lrc *lrc)
> >  	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
> >  }
> >  
> > -#define DECL_MAP_ADDR_HELPERS(elem) \
> > +#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
> >  static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc
> > *lrc) \
> >  { \
> > -	struct iosys_map map = lrc->bo->vmap; \
> > +	struct xe_bo *bo = (bo_expr); \
> > +	struct iosys_map map = bo->vmap; \
> >  \
> >  	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
> >  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
> > @@ -816,20 +816,22 @@ static inline struct iosys_map
> > __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
> >  } \
> >  static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct
> > xe_lrc *lrc) \
> >  { \
> > -	return xe_bo_ggtt_addr(lrc->bo) +
> > __xe_lrc_##elem##_offset(lrc); \
> > +	struct xe_bo *bo = (bo_expr); \
> > +\
> > +	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc);
> > \
> >  } \
> >  
> > -DECL_MAP_ADDR_HELPERS(ring)
> > -DECL_MAP_ADDR_HELPERS(pphwsp)
> > -DECL_MAP_ADDR_HELPERS(seqno)
> > -DECL_MAP_ADDR_HELPERS(regs)
> > -DECL_MAP_ADDR_HELPERS(start_seqno)
> > -DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> > -DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> > -DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> > -DECL_MAP_ADDR_HELPERS(parallel)
> > -DECL_MAP_ADDR_HELPERS(indirect_ring)
> > -DECL_MAP_ADDR_HELPERS(engine_id)
> > +DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
> > +DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> > +DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> >  
> >  #undef DECL_MAP_ADDR_HELPERS
> >  
> > @@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> >  {
> >  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> >  	xe_bo_unpin_map_no_vm(lrc->bo);
> > +	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
> >  }
> >  
> >  /*
> > @@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> >  	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_bo *seqno_bo;
> >  	struct iosys_map map;
> >  	u32 arb_enable;
> >  	u32 bo_flags;
> > @@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe,
> >  	if (IS_ERR(lrc->bo))
> >  		return PTR_ERR(lrc->bo);
> >  
> > +	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> > +					     ttm_bo_type_kernel,
> > +					     XE_BO_FLAG_GGTT |
> > +					    
> > XE_BO_FLAG_GGTT_INVALIDATE |
> > +					     XE_BO_FLAG_SYSTEM,
> > false);
> 
> XE_BO_FLAG_PINNED_NORESTORE?
> 
> Thanks,
> Thomas
> 
> 
> > +	if (IS_ERR(seqno_bo)) {
> > +		err = PTR_ERR(lrc->bo);
> > +		goto err_lrc_finish;
> > +	}
> > +	lrc->seqno_bo = seqno_bo;
> > +
> >  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> >  			     hwe->fence_irq, hwe->name);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> > b/drivers/gpu/drm/xe/xe_lrc_types.h
> > index a4373d280c39..5a718f759ed6 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > @@ -22,6 +22,12 @@ struct xe_lrc {
> >  	 */
> >  	struct xe_bo *bo;
> >  
> > +	/**
> > +	 * @seqno_bo: Buffer object (memory) for seqno numbers.
> > Always in system
> > +	 * memory as this a CPU read, GPU write path object.
> > +	 */
> > +	struct xe_bo *seqno_bo;
> > +
> >  	/** @size: size of the lrc and optional indirect ring state
> > */
> >  	u32 size;
> >  
