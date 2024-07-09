Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C2FC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477F310E5FA;
	Tue,  9 Jul 2024 16:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me6oCsEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C0F10E5FA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720543014; x=1752079014;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T4x8/g1W2XGe5PslS8ohFtck/YBQD+CsORhSysGThaE=;
 b=me6oCsEVaKLmQ1mm7uae8GsXF0tf7BzGqERtlO+QZxjmYh1rwqIKdPdr
 edYFsq9DgnbvkQ3dTjmmuUih/TpoyNb5p1sE3uru6Ms1CdsYia6wnbuYE
 m078td1dIuTPCz7ZdmiKNBtQ3LbpqQXLadx/9Hjn78gLT9VK2yXBbRs4z
 XqWn9aqlQZ+WDRUxmXPINbfPnCMRHLVJZZqH9UbIVW4u6RlHPgk43zwqq
 W+03RtU65pg/oYK0HyR7JskKJvjYrdDfu1hcYoWAZP0FvRXJHFgQuce5j
 j1pKdGbCkko5gfybNeCFqA3YifFzi1h5k2JEa+zTVN8ARMLAdL7TDRXGT A==;
X-CSE-ConnectionGUID: DJx9TIaNQdy3SqQcq1H3qA==
X-CSE-MsgGUID: iI+NtMjOTgWrSu4vMsr7Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17949999"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17949999"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:36:54 -0700
X-CSE-ConnectionGUID: gHmHz9eUQeeHSHv4+BGU2g==
X-CSE-MsgGUID: OivBAZsVSPmzPLvN82CU9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="85440520"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 09:36:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 09:36:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 09:36:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 09:36:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 09:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWvEl3oump/uutJY6E8oi7CW+RAj5hPmSqloz2Vpiuhmhc86q/jrW3Hc5EMSfWC8VzLzt48lgz7UeThUy2xOmQndfGZeX9ZUe4Y8EefO7/VFd+MDHvRaFjMWUPxIygpUm5H4o1r70rZ4Pds7o3DfOtvgCMm3nyhrxr3pvut7U2Lb186Xub4JshnBvTA7daPhY7sQKSiQHCCk1NC+Ztu6Mq2Jp46gapVPjXPRaV2tZr21ILKnLLQq6KP/hnfIxoD+XatVMGNNKbixoplISSQs+L7PaNJAM2rvrMTf7gGJkctYzITddG8YuMkp3jqOqzmnRH1is1kIs2/ynJZEBDWOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zFRosq3XrufiEsTEFGA4OfYCxQciAQSf+by2pfMhN4=;
 b=QJ8nhbzn5UmOPZKckPPGej2WdGBFAZiCQ4iOWl9zIR4p9G14u51YvzGTuZDUaHcRDF4PaiAa31AT4K8FC1SazAQymwOt+c9a6x8HACeZNTXTP3YWcqqcFZitSbxQc2GbEOVINgtbCReOwMdr8T5jfGCfPteEJbGiszzTCjx9dYQqAEXPQWNc2qoBcbtKJN7COQSwupbO6KRmjtqOy+7w6VrGOexuSIRTF677wO/nwlacLM+j4QVRicZHKoD2EzPbxuD2OjFWeGTq/hNMKgsCRQEuRqpCRDeINXgwZr6PJHzxKlYqNpPLq5ZCcLNiCNfijWDMimUMHZyqFOda+/W6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 16:36:44 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 16:36:44 +0000
Date: Tue, 9 Jul 2024 16:35:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <nirmoy.das@intel.com>, <farah.kassabri@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
Message-ID: <Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
 <b008d72f-8123-4f3e-827f-9e5fd9368983@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b008d72f-8123-4f3e-827f-9e5fd9368983@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:a03:331::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: e82248e7-a88c-478a-7587-08dca03551b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CL93uAbvOpMtCh7RLIwVICrmmFhfbJM/JCKYk59O7gUErHuQJJWVW6YfmH?=
 =?iso-8859-1?Q?2wo+os26GYHn2pI9zPph1Z6z6g+2jQghpoZJaamGNFLeiKPfrUVZDB/Nz1?=
 =?iso-8859-1?Q?6U7gToKGGlJmWSph9TUNC6Nh0t7rkkisr14xuuDevaxaWVkaAvIBdIyuaB?=
 =?iso-8859-1?Q?wrUals73lHkuy06brqvVSnJKNvcj4ZTUwUS6U1LYDdO9a940gCuF/dFkMB?=
 =?iso-8859-1?Q?d7k1AJPDZkNg1IfZb9Xi4EnLLob0bEbKlOQrnBAWa2SYht36tfOj6j2FzP?=
 =?iso-8859-1?Q?mXt7hOr8npesrYXrKGT5kXQTQ+XYpM4YaF8QNBA3SG70c9H+mjtXcJ0cx4?=
 =?iso-8859-1?Q?gGN40R7jNr6y9vC/xuFbpy3DfQxi3AL5TyCGAzm+g4Ez3WtfZFLpXf9JcI?=
 =?iso-8859-1?Q?KpwqO9zHZftJCu1V+Z0SUIh5xvhRUMmw1jRLkg4o8R1zwZu1+wdx1pGgTV?=
 =?iso-8859-1?Q?AVLxzsjvXJ3am1wEyciiTs9S89aOyQNGtKUQx3Vz+66nnYiAs7DksfM1BE?=
 =?iso-8859-1?Q?vSlGWblH9YcGpS92xT3fvhNAGm1jQA4U4rePFVhx2Wy5LxdGnRLTx8+jlS?=
 =?iso-8859-1?Q?16xYF/sdcBK7j44Syzh3vwOwxe++f6dOj1hwGm4MRfeScCOgmtqWMG9RA7?=
 =?iso-8859-1?Q?NjUOiIGPREUM+WXRYj5ZtjR1aJM2YwIO615gW6OkuGVWczq1M2xFXM7ixp?=
 =?iso-8859-1?Q?MH7HW0LAi6fF9Ed2Kl0hyUGx5Q0iUPdWVfDsGUoSJECV3XEO/++B6TAHey?=
 =?iso-8859-1?Q?Y7L5U1WZ+VtkRjHfbRQaLxyaoyp3TjAecHoBoeeC1qhtWa0Y0/uiQ1jbr7?=
 =?iso-8859-1?Q?IvJxqrAaDancyAqqZkfJtZ3kUfcxy8S9pWq0kCR1o4Aqd7cyj1wpy0Lm6X?=
 =?iso-8859-1?Q?zqm7CU8yCxYq0ivUhO/vyrDcA0C93WMBPZ2DNmeNgg86eXmoidGDBHzWBH?=
 =?iso-8859-1?Q?+TGusX+dR9uZ6WIqZ9FcoktKWjjEhtNJvTrkNMOeKe31VudnTqlKosYnBW?=
 =?iso-8859-1?Q?uoDjHiOB4G4GINyPu+wWd8/yAcptcx3SFgiMDNyZcVW2rdVk8d94kPo4bI?=
 =?iso-8859-1?Q?giFABU4yu5ofnTPc5t+HsHL7GDd52sxuY/L3MCD/7e13FA89f9ZIwb5AF0?=
 =?iso-8859-1?Q?ZfJTkvlzqP6XcRtNv+rZ897L19PoxjZMr/OkRsCumUg2mciVB+PZys+It1?=
 =?iso-8859-1?Q?xH+Di526d2C3Qua/ri1C/IuzbIEq2Za/bRHGKNjkR7H4zV2HMysMAcF0In?=
 =?iso-8859-1?Q?CteTBFve/8XMd+HMFcJ1biiEzLvjP3RJz2sA/TFs1zoeaXPQueB6P+tzLg?=
 =?iso-8859-1?Q?kOkGu7pdtw+CSFJVtQVIq5Aq/PVrh3+qyldfxNZqOd5sFoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JvqKUhCPnCyvBhPKsvoPTFzpE4IA43tzNVS0MeHWGPz0OqL13ZBHC2/l58?=
 =?iso-8859-1?Q?R8BBQDN/+4tbW9CIN1UAYjhfTHelGW9CzKs7guMQZSTzsMvvZI05eoRlx+?=
 =?iso-8859-1?Q?1OBQfZF19i8Br+cMqo65+sUKo6nTkYzTLcmTaAdhhAjOHA2+9NKn/XSbrB?=
 =?iso-8859-1?Q?BOslmj2RwaMX0/Cu1HtyvzPEz4EZSV6JWFnsO/JeVjaqR+DIf4YvM0Ub3j?=
 =?iso-8859-1?Q?4Q6mYYYiAS6h0hEe1YCKdgTWnlA4AZj8IIpH86hyLXP+cacnfJi5vDyVGl?=
 =?iso-8859-1?Q?dDnMAlvI/BnChOgzDYI7aoEuGCi4WJML97NfSR3TroSIQw/BqkMwFFfuvL?=
 =?iso-8859-1?Q?3EeFIeaGHwZ2FaCsSn2q9pAjjoo5aPgWGHppUPMdSX/arc20+imzFlugvQ?=
 =?iso-8859-1?Q?rDL9PxDL/RUetpzRQmhg8HQhP45cn8PQjZsJzoJwGVnwGUxnSd0Sf0Ygqg?=
 =?iso-8859-1?Q?AdPMkLhiivQ+Yoj3a8o1LwEWaaUMKhDezJObD8epnKRvXlYjVBJpUiPyGy?=
 =?iso-8859-1?Q?7P3tpznUdR05pz6TdgsiwE17OW9Y9uiDeUso1NuIaCMjR4vPqKKxn8VjwH?=
 =?iso-8859-1?Q?MoHDfJvLjvCJ1dtT8wlcD7w0zkQ6+wfwZL6fUoMn8seX1FRo2bgWO5ZJcd?=
 =?iso-8859-1?Q?9AyhaixwlY6K2tODyWeP3UgeqW0wq5xLdCPkD8WDdDLb4/6/Ba3lsN2nOH?=
 =?iso-8859-1?Q?PdPS4JEfdT8iDjmIce5ohTDt4nK6ddHUHkgFNCaWaxpsW9G8HIzTyXtOAa?=
 =?iso-8859-1?Q?JaxJXeddtKvP163twsCL0FY11uAmyaslRb1EEyLdr3Mcb6Gxu0Kvz47CsV?=
 =?iso-8859-1?Q?fLdbfpU3Sr7Z/5Bh9K64EQqrcsV51u7h/ja+sPsT1NJlydRCWmQz15TFRG?=
 =?iso-8859-1?Q?fsdFAIGmhh8b8M3d1Mlr8VdkuFb1BBvtuy+cl2U4EyCPn+G7hcjx9hMWga?=
 =?iso-8859-1?Q?5D6o2u4Fq5BEhE3KKkiT7W1xVngydEjPQGnr6IFcKpkgpCSIw2MxI2YIaP?=
 =?iso-8859-1?Q?2laBuR3EBPVn3Zj0/eCRdNxlIzcMOzWrJ+jAIQ4pKGkhzQlKg/RfqDLbNO?=
 =?iso-8859-1?Q?gXTgl5xUMOuyH/SuYgcadck+0YBc5FglwMaDMHfup+kh7aje2kjMy3I5PV?=
 =?iso-8859-1?Q?3CN87rmluzksCTwNpqAhISCpFeSu8L34xvI80Dc2Oa7CV7i89QaeIk4Lu9?=
 =?iso-8859-1?Q?nzsjqe4Jwv/G+3jJ7CxJHJJ9GI6HhhuvClm7Flf8Wuf1vxTfCFrPy9b2zr?=
 =?iso-8859-1?Q?kpJu73V44LYLFsaysDxgZJGzz/Vzd3xSulhshlydr0fMjzsXrIagEFpj5Z?=
 =?iso-8859-1?Q?9PBVTTkZhVsJwJZ3eiHMm1wG2WM7TlOjyEmQqBMekRLUQJFkyqYtdR/njF?=
 =?iso-8859-1?Q?2xrVkkzICPi1jSRNEAI5xFYSvjoO39WTOjYpjrNRSr3bq+o/o85o+MlnoG?=
 =?iso-8859-1?Q?alge/3eOL3HCJSQqB+I8y/VcVeWWZlHeHFiLyYhVpU4RyIkXIxFepURMzm?=
 =?iso-8859-1?Q?3cQw0SLCHGQJsMQlIWvO+9ZZrXkxhqUEoHx7pvmwAKzcX70E1xs8aln92r?=
 =?iso-8859-1?Q?moMNF6Ym5UUf3/gKOEPLBmw7GSZajkWmDG+A7aDgBa9HjB/07qGtSmf9/1?=
 =?iso-8859-1?Q?enVEFwf2f6Ebue+6u/NMpnxLnXmMERunUJxTDBjRpa2AT6uUHwUe+iiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e82248e7-a88c-478a-7587-08dca03551b4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 16:36:44.5981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRYsBDsTvM6Nn+4gJP0RXQ8S2A7t2ZwJT3WrJLXZlnPT176kEqE2QD37U162QlIT5ByeAa1H2R9PIAl+wul5XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
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

On Tue, Jul 09, 2024 at 06:08:54PM +0200, Nirmoy Das wrote:
> 
> On 7/9/2024 11:57 AM, Matthew Auld wrote:
> > Hi,
> > 
> > On 08/07/2024 05:03, Matthew Brost wrote:
> > > While debuging [1] an issue was identified in which if too many GT TLB
> > > invalidations are issued to the GuC, the GuC can get overwhelmed to the
> > > point scheduling of jobs starts to stall. To avoid this, hold and
> > > coalesce GT TLB invalidations in the KMD if a watermark of pending
> > > invalidations is past. Add gitlab for this issue has also been opened
> > > [2].
> > > 
> > > Layering issues with GT TLB invalidations are known [3] which needed to
> > > be fixed first before adding this new feature.
> > > 
> > > - Patches 1-8 fix the layering.
> > > - Patches 9-11 add coalescing feature.
> > > 
> > > We could merge these two as seperate series if needed.
> > > 
> > > CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
> > > TLB invalidation issues in the past.
> > 
> > Maybe worth mentioning for [1], we try to process TLB invalidations
> > directly from the irq, however we also only process the g2h queue
> > in-order, so if there is something other than TLB invalidation or fault
> > earlier in the queue then we do nothing useful from the irq and just
> > return, that is until the wq can eventually process those earlier items
> > that couldn't be processed directly from the irq. In the past
> 
> Seen this recently :
> 
> <3> [3763.731822] xe 0000:03:00.0: [drm] *ERROR* GT0: g2h outstanding: 611
> <snip>
> <6> [3727.857273] [IGT] xe_evict: executing
> <3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB
> invalidation time'd out, seqno=26858, recv=2685

Missing the last digit of '2685'?

> 
> Which I think fits your description. This series should help but not sure
> how much.
>

From arch level if this is a continued problem, perhaps we should ask
for a dedicated G2H queue for TLB invalidation done responses. It seems
like a fairly reasonable ask to me as TLB invalidations really shouldn't
get stuck behind other G2H processing...

Matt

> 
> Regards,
> 
> Nirmoy
> 
> > I have seen TLB timeouts where the TLB invalidation is clearly in the
> > g2h queue (and has been for a while), but is stuck behind something
> > earlier in the queue that needs the wq, but system is under such a heavy
> > load that the wq can't be scheduled in a timely manner.
> > 
> > > 
> > > v2:
> > >   - Fix CI issues
> > >   - Clean up some of the series / patch structure
> > > 
> > > Matt
> > > 
> > > [1]
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
> > > [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
> > > [3] https://patchwork.freedesktop.org/series/133001/
> > > 
> > > Matthew Brost (11):
> > >    drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
> > >    drm/xe: Drop xe_gt_tlb_invalidation_wait
> > >    drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
> > >    drm/xe: Add tlb_invalidation.seqno_lock
> > >    drm/xe: Add xe_gt_tlb_invalidation_done_handler
> > >    drm/xe: Add send tlb invalidation helpers
> > >    drm/xe: Add xe_guc_tlb_invalidation layer
> > >    drm/xe: Add multi-client support for GT TLB invalidations
> > >    drm/xe: Add GT TLB invalidation coalescing
> > >    drm/xe: Add GT TLB invalidation coalesce tracepoints
> > >    drm/xe: Add GT TLB invalidation watermark debugfs
> > > 
> > >   drivers/gpu/drm/xe/Makefile                   |   1 +
> > >   drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
> > >   drivers/gpu/drm/xe/xe_device.c                |   3 +
> > >   drivers/gpu/drm/xe/xe_device_types.h          |   5 +
> > >   drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
> > >   drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
> > >   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
> > >   drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
> > >   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
> > >   drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
> > >   drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
> > >   drivers/gpu/drm/xe/xe_trace.h                 |  10 +
> > >   drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
> > >   drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
> > >   17 files changed, 801 insertions(+), 279 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
> > > 
