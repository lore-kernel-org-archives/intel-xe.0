Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D0FC3DA61
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 05:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E1610E0B6;
	Sat, 27 Jul 2024 05:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMSIUIBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7B710E0B6
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 05:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722057863; x=1753593863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JeJJVz1LmgNqJexva2VJompQdtMIAQ9vsQSC0ZWkupo=;
 b=HMSIUIBwSQ3Sz7bltUG4sxFdIeI86F69+TR3RDx3t+2Iac7zWR160iL9
 s3zJGPhB2JWHDsNFN/UCh07+supVj2S4Mc4RJL/7lgDLX73hA/hy72PWF
 Y/Qlw2QizFSJhph5YaUL2zkq85U/WvjYJT3gwG7PYDiofIPbFR8PJEK59
 EWR9fABz9la9NdLuTWLxEbMHB6TM3Rb+QYCXipDWJqoYn5xP9DiLc45lS
 ZkiLRk+DSrP2XI+SznnLaXN4263l4kV+43UcExbyr7AeDdpNenXBRu9v8
 rOISyuT/7ogR9q/xTXkZxMzd9ENytkFMmKDDVtsaFf//CLB51tGtrJOeb g==;
X-CSE-ConnectionGUID: 073DK3HgSL2SQrFli4D+XQ==
X-CSE-MsgGUID: /PIO7kV8QRuiJLz5XPbAxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="37371553"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="37371553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 22:24:22 -0700
X-CSE-ConnectionGUID: swbIidGgQhSe2PNeb5j0Nw==
X-CSE-MsgGUID: PwbUnfGSQGyqaMdN7EgTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53526825"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 22:24:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:24:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:24:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 22:24:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 22:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX3CRyGLlWYOG+2Qqq0sZKK7cVZ6t2trYuuK8tvsDinXSE1ovIALDy542Trr8you2fdE8o3U6YUf71OSaFzBDu5s/DENiJLuZsHHFfPc+Y8Xgd3lfBGZRqpG8hgkl8SqYlwpoHV6fGxggC2AZWWbJTExS4zkJ+RAXCw/NIx8DWRG2H62xtE0UAgw0GNBKJIPZLd9qGpnt4RjGXnltnDHOWVRKEi73tGL6z3IZu/0n2d5hKcimZi41EXi9nN3zhXGY0QanqLF8fgjpIHHIVL1yh9nWLmUeZt5XhW3RfFJJnaqjxEf9XQ7cC7UDnWI+RvLee561+rD1hCtQQ9Gk4zMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1Ct3GZ3Wwp5H5NDmY/7qS4fQf3eySnXnmWUxiy8CNY=;
 b=Qufo2ECA2Vke5DLPAnLu13xtewXQhQGE8W1Fg2NCbRKfC3qV6PfjoIZXDJBZLKNVl5giP+AeitHMkeO3GjN+f1bqUjU1IGNwAJLacIDQTtpSjKuH59Udc8Z7sut+dxe/bHgkM68YW8AwvUnTXDkd2KF7RniOyCFPeX2zJpvf5MlFEJxe7F6rPnC2DJTvzDSilRKcgMUY9xb2HKv5tjrE4jSGBmzKyK4Sv8aWDKmMuPDDMfPvQnOS3cL56a8gluvhlt1ZPxu7epyhuaihIQ3dk1cyxYUFhD9YAQJgGKp4VQ8gUcslUN+9YPqaVq3qnSC+cogxyccv7Ljyomh5ua2DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Sat, 27 Jul
 2024 05:24:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 05:24:16 +0000
Date: Sat, 27 Jul 2024 05:23:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/21] GPU debug support (eudebug)
Message-ID: <ZqSETvUP8g/rwq9x@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: a6636cf8-61e0-4823-2d15-08dcadfc5bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OsOjYK+FYkJWFIsxmzgbqhnWDn9eNMgad1ERBHb6qQU6z/JNceYDpiYEXN+B?=
 =?us-ascii?Q?vsNB2DS3NH6PKPfPQz1ZKqAwpJ1o/JGDoN70soCoNnmHgbQ9HGWcT2Vn8viY?=
 =?us-ascii?Q?H0YZjSiBO5Ciq/lTLpv/mk+C2Eg0lL25Z1cj0pNA/x7YON01S4rUoQyXl2We?=
 =?us-ascii?Q?r72/nlWup+tInKjkfFG93LYqutvR5WdcikSD6Lt8NvmLPj2fchFPsHHlmnzP?=
 =?us-ascii?Q?wDVE3jA6heE+057fK5p9dMhdpirNCPiF0OJELJXl4a8cZCIB+uVq3hDLNpLw?=
 =?us-ascii?Q?D/oIOkHZYNxUK+3pmRofpighg7klMngpupTBeyptnwmO0A85iWydN1hhRzMk?=
 =?us-ascii?Q?/azMpxgLihmk8KK+HMJnEPQaZCoB9ejHXgcKNqC66L2GWoR1bMCX7KVppW90?=
 =?us-ascii?Q?EoiIabNPoAzcLuaQXz0djPVuwZaI7aS/Y9ltA2kW4lShMa2Jce8KNgIc0lYb?=
 =?us-ascii?Q?From1XG3/LzuCs3/K41fNhkCpd1s1bsh/Vdxf51d6OsvbPdzDB2qC7W0BcLt?=
 =?us-ascii?Q?nvqcWm62bDLUTY9fxt1avQvwVM3XboxLqsKHZdE0g9R+6yOBhURyReZYaNdV?=
 =?us-ascii?Q?YNL25d41KJhYcPrHC3HnyOPeJ8PhUBx6a9DaCzeSBXwtJ62t1kfruObe1/b1?=
 =?us-ascii?Q?sXgsJqMp2nkFLQDkt4RgsosRdtDMAizH6rFKLmbJjguTe/Cxihj3TnqtoifQ?=
 =?us-ascii?Q?M6SirmbzCDLqH6iuyq5xlaoeYwVN64L4N3fKWq50kGYpBNLsNQ6L3mEcpKuB?=
 =?us-ascii?Q?+336gIbOgntzPrbyX7KB3fH7c7r1HnftKhgDEJsczexY1syY89jo8msqQcEK?=
 =?us-ascii?Q?5q1XAiaR9cOP7YfltEw4bB80hotv8d10kY6VmhbcYVFpAwdG5FrEvV2RWSp0?=
 =?us-ascii?Q?CENGOam8DN+/k4bFyPZFmnrVK7atXZQQ/O6tBO6x6GvffkSJssQ4hY7MfFaO?=
 =?us-ascii?Q?HdU+deQe/EKR9zL8aRljU879K08IgkAhVaryQ5qVibiNFaaJ7fRmmPZzJD77?=
 =?us-ascii?Q?6V1y8VeqQW+0z72eiqVt3oo4FHYQVQdj3KonSpL33mF003V9kQ4C9p9AsqoR?=
 =?us-ascii?Q?D8UDGs42OAu7xXw1vGGqxqsyYee+sZzO5c0Vl/MU/1QRD43bEPSaQPfXxQRT?=
 =?us-ascii?Q?O7aIvOhdvJmDuS132sk4pueMHpsBt6wjwbpLgfsqmZ/XgDsWvPk91gNbBPEb?=
 =?us-ascii?Q?kOkED2Bk1TUmUPpXaqM21BdA/jQkQWCz7or5UbHjbT7/j0hfBU3W5T8r8X6I?=
 =?us-ascii?Q?6xoRnkqo+07/S3+EVgg8gtF1U/jNCT2OoNqtJTvWERhTO2RLtEQRA7tdb14Q?=
 =?us-ascii?Q?LwM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qoGo3gdq1yYeKkCrhqJaM+7QdnmkeX45wOgl6fZKGiBoeNpP3KGboLRWYOSf?=
 =?us-ascii?Q?JdzihQSMv7rbGHdGEkkGw0mQO/PSjwPCxUzsYLgGhwlfdkycdwlza1TwWNgK?=
 =?us-ascii?Q?71MVUFACh6MKEx6NlshINVeGntZH+S/ZfpI7M7jabmkXKx0iM9LWb3Ro761W?=
 =?us-ascii?Q?Xtn1+2DGdktY+laWdvIR4IgtonVmdsQmEuAvvgcsOhuLhP1Lpfg0Z6UEXy7M?=
 =?us-ascii?Q?dQtDeLfpK4YUGGveHy40PgM4P3DASLdbcT/GnJsia2Ud90JQ0Sxk58IZ+PFy?=
 =?us-ascii?Q?4cb2ecIPdWgmEDzs4qWF7tzu97RtS16q1UmWZGvXGwBw3WWpa9jBImFsB7IT?=
 =?us-ascii?Q?rN/LyZ73c9JwbA5Vex92xni4PV0Ka+WEB1SveP4uFM6LDc/G3D9e8jdTEQj9?=
 =?us-ascii?Q?9Nm0QqKOTD7jQge9RNAeyqm6un8njcp/qegn29GDUNF2C+bMbNxbvkG9esK2?=
 =?us-ascii?Q?utmUFN3X5vlZdAMzxVsKr9GYe6WKdn9FW2C3TddzZK9oS7Wl24sR8dHJmTAk?=
 =?us-ascii?Q?TrBsE1qdoJggAkBs7flCmlWSxWRPNRz9RKzTmxSOeUeiUX9RW1umOfwySeiJ?=
 =?us-ascii?Q?3slCm8bSsOOAELvqBcbfeG5imqx0JVlN95f1o/Sj/NSUfn0dDZ3HsHjC7sL9?=
 =?us-ascii?Q?ywpXWChFCrdlAgIpWdl663iOJlOsi3zxg2OikOReUebVvb+XOITCB3Aynm2E?=
 =?us-ascii?Q?efm94v0wgTfiWNp+nIBy018JnPbFjh+aCK5qGJ5gNhiR+ygbmKaGyO4hDTiW?=
 =?us-ascii?Q?5bd8gG3lV6b65gsXPUk4C829kZ1191z4Df0OVHJIh51YhyYTBG6G2qyMpg9u?=
 =?us-ascii?Q?yP7DlE7Mu8H+nRacgVNEuinjaRTIfymEr+JpYgu6LRIIUCPVqfSWdRcB2Xg4?=
 =?us-ascii?Q?DYBsZFESCyBOEmn4jnYUyNZ6TphOeUCVuL4h6Q+37wlsAHrCpVC7AvOoCg29?=
 =?us-ascii?Q?eUcDfC0/AkOKBBmPY1J3BUIFrm1w5wug8oVJuBY9kmDCVWFnEeXxrxElDHhY?=
 =?us-ascii?Q?xk5b+LrtHXoElczmZiNkHv7oHSt0T8As+Hx7V5wTs1ofUSDrvYpYEa3PZ2b1?=
 =?us-ascii?Q?EkpIbinFOf7QH0P6dUbfBkGFYNCXpGibaHb1Fe8SMWYXA7q4Eoc11qoG0B3d?=
 =?us-ascii?Q?D3BhzpxZZ/0oXr58APowMVWkDc1KqODQBRSYt3ktACnyBad4y8Lw40/tQJFr?=
 =?us-ascii?Q?moyAMgxEV3kXdI8dss1DwMHhoW8urQHFFDc2CmDKqI/iwAcGBZMro0FhhY+0?=
 =?us-ascii?Q?aMiqnHxDqFlViu5h95FL40iuFP8vFAzckZACflRDw3OXGPOAvCR9verdGxAI?=
 =?us-ascii?Q?2ssuAIrny65VnTSxBNgnsb0WFpP07xVKQlB8r8293WdeksTm8wcEXxp1WHgb?=
 =?us-ascii?Q?afvdEFVmSqO4S6nkfgPZY26e6Pq5hhLxXmlgPxaHC2U4J8HTyOHPOVwZ/Fyi?=
 =?us-ascii?Q?svnCdb3kTbdCX9hXQZxvQv0XZw7uMV6hfdR680LX4nThPoZ85EkUemQUUF/4?=
 =?us-ascii?Q?/pmBVG8nm5pGpcGcNY6q6qhFPykoFZX5N9Xbq5kiSC5ZhtRufpySa+Rtu6sB?=
 =?us-ascii?Q?NJZ7TQya2Uu7mnot0esq3X7FY7boAivIC5wA/Cdq1RV7Bews6e9PdPvk4p8k?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6636cf8-61e0-4823-2d15-08dcadfc5bf5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 05:24:16.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udACe9EAvMn66kbDsxPQFygcrYVxls8eXWerYZjdhotrcJCFo997xAIMUyykc4ZfkXzvx+Rjp5in+SpDgX/ZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Fri, Jul 26, 2024 at 05:07:57PM +0300, Mika Kuoppala wrote:
> Hi,
> 
> We (Intel eudebug kernel team) would like to submit this
> patchset to enable debug support for Intel GPU devices.
> 
> The aim is to allow Level-Zero + GDB (or some other tool)
> to attach to xe driver in order to receive information
> about relevant driver resources, hardware events and to allow debug
> related hardware control. End goal is full debug capability
> of supported Intel hardware, see [4].
> 
> Debugger first opens a connection to a device through
> drm ioctl with debug target process as a pid. This will
> return a dedicated file descriptor used for debugging
> for further events and control.
> 
> Xe internal resources that are considered essential
> to debugger functionality are relayed as events to the
> debugger. On debugger connection, all existing resources
> are relayed to debugger (discovery) and from that
> point onwards, as they are created/destroyed.
> 
> uapi is extended to allow an application/lib to provide
> debug metadata information. These are relayed as events
> to the debugger so it can decode the program state.
> 
> Along with the resource and metadata events, an event for
> hardware exceptions, called EU attention, is provided.
> The debugger, with the assistance of an exception handling
> program called System Routine (short: SIP) provided
> with the pipeline setup, can determine which specific
> EU/thread and instruction encountered the breakpoint
> or other exceptions.
> 
> EU controlling ioctl interface is also introduced where
> debugger can manipulate individual threads of the currently
> active workload. This interface enables the debugger to
> interrupt all threads on demand, check their current state
> and resume them individually.
> 
> The intent is to provide a similar but not API compatible
> functionality as in out-of-tree i915 debugger support:
> https://dgpu-docs.intel.com/driver/gpu-debugging.html
> 
> For xe the aim is to have all support merged in upstream,
> starting with this series. With Lunarlake being first targetted
> hardware.
> 
> I have split the events into xe_drm_eudebug.h instead
> pushing everything into xe_drm.h, in order to help
> distinguish what is controlled by which descriptor.
> If it's through the original xe fd, it is in xe_drm.h and
> if it's through the opened debugger connection fd, it
> is in xe_drm_eudebug.h.
> 

Looking through the series, I do have question wrt to GPU fault and
eudebug. I don't see any interaction there. Without knowing eudebug
works, it seems like setting a break point on a GPU access to virtual
address is something a debugger would want. On a faulting device, this
is something we should be able to support. This really comes into play
once we have SVM as the UMD won't be issuing binds either. Curious about
your thoughts here.

If this something that required, in particular with SVM, this something
the SVM and eudebug teams need to collaborate on early to make sure both
designs work with each other.

Matt

> Latest code can be found in:
> [1] https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-dev
> 
> With the associated IGT tests:
> [2] https://gitlab.freedesktop.org/cmanszew/igt-gpu-tools/-/tree/eudebug-dev
> 
> The user for this uapi:
> [3] https://github.com/intel/compute-runtime
> Event loop and thread control interaction can be found at:
> https://github.com/intel/compute-runtime/tree/master/level_zero/tools/source/debug/linux/xe
> And the wrappers in:
> https://github.com/intel/compute-runtime/tree/master/shared/source/os_interface/linux/xe
> https://github.com/intel/compute-runtime/blob/master/shared/source/os_interface/linux/xe/ioctl_helper_xe_debugger.cpp
> Note that the XE support is disabled by default and you will need
> NEO_ENABLE_XE_EU_DEBUG_SUPPORT enabled in order to test.
> 
> GDB support:
> [4]: https://sourceware.org/pipermail/gdb-patches/2024-July/210264.html
> 
> Thank you in advance for any comments and insight.
> 
> 
> Andrzej Hajda (1):
>   drm/xe/eudebug: implement userptr_vma access
> 
> Christoph Manszewski (3):
>   drm/xe/eudebug: Add vm bind and vm bind ops
>   drm/xe/eudebug: Dynamically toggle debugger functionality
>   drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
> 
> Dominik Grzegorzek (10):
>   drm/xe: Export xe_hw_engine's mmio accessors
>   drm/xe: Move and export xe_hw_engine lookup.
>   drm/xe/eudebug: Introduce exec_queue events
>   drm/xe/eudebug: hw enablement for eudebug
>   drm/xe: Add EUDEBUG_ENABLE exec queue property
>   drm/xe/eudebug: Introduce per device attention scan worker
>   drm/xe/eudebug: Introduce EU control interface
>   drm/xe: Debug metadata create/destroy ioctls
>   drm/xe: Attach debug metadata to vma
>   drm/xe/eudebug: Add debug metadata support for xe_eudebug
> 
> Jonathan Cavitt (1):
>   drm/xe/eudebug: Use ptrace_may_access for xe_eudebug_attach
> 
> Mika Kuoppala (6):
>   drm/xe/eudebug: Introduce eudebug support
>   kernel: export ptrace_may_access
>   drm/xe/eudebug: Introduce discovery for resources
>   drm/xe/eudebug: Add UFENCE events with acks
>   drm/xe/eudebug: vm open/pread/pwrite
>   drm/xe/eudebug: Implement vm_bind_op discovery
> 
>  drivers/gpu/drm/xe/Makefile                  |    5 +-
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    8 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   43 +
>  drivers/gpu/drm/xe/tests/xe_eudebug.c        |  170 +
>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |    2 +
>  drivers/gpu/drm/xe/xe_debug_metadata.c       |  125 +
>  drivers/gpu/drm/xe/xe_debug_metadata.h       |   25 +
>  drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
>  drivers/gpu/drm/xe/xe_device.c               |   47 +-
>  drivers/gpu/drm/xe/xe_device_types.h         |   45 +
>  drivers/gpu/drm/xe/xe_eudebug.c              | 3841 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h              |   51 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h        |  326 ++
>  drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c           |   80 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
>  drivers/gpu/drm/xe/xe_gt_debug.c             |  152 +
>  drivers/gpu/drm/xe/xe_gt_debug.h             |   27 +
>  drivers/gpu/drm/xe/xe_hw_engine.c            |   39 +-
>  drivers/gpu/drm/xe/xe_hw_engine.h            |   11 +
>  drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
>  drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
>  drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
>  drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
>  drivers/gpu/drm/xe/xe_rtp_types.h            |    1 +
>  drivers/gpu/drm/xe/xe_sync.c                 |   49 +-
>  drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
>  drivers/gpu/drm/xe/xe_sync_types.h           |   26 +-
>  drivers/gpu/drm/xe/xe_vm.c                   |  227 +-
>  drivers/gpu/drm/xe/xe_vm_types.h             |   26 +
>  include/uapi/drm/xe_drm.h                    |   96 +-
>  include/uapi/drm/xe_drm_eudebug.h            |  226 ++
>  kernel/ptrace.c                              |    1 +
>  34 files changed, 5655 insertions(+), 86 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
> 
> -- 
> 2.34.1
> 
