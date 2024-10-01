Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EDCCF3180
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 21:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CE410E089;
	Tue,  1 Oct 2024 21:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdBSVHvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA70410E089
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 21:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727816582; x=1759352582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3gWE/XUE+n3N44XTm09D3zlq2s9wmVQlPoypWKhjdJc=;
 b=LdBSVHvsIVcAYHc/OVBoJRAYKYQ0prjXyUc1HFKfMbtMT01Jge6CkWee
 IMpBUlmdTNRhgoGQVjb4g/gj0Jq/gRQyEkQd+bgMrn4rV+2LkYbP3ozEr
 UxMBwntMvaqzPy2jsPPBcYSLiCCi808dVpOK9oL06OqU76w0ms+RHCfF2
 l/tm0y5RLPPKD21oWree1IpBEVLhw6leZzAJtKoQWPGLFiMZQoei8hgYP
 GQ+Ke1KhGhbRkd/OjGiV+7VUQjRLHnnjWqev7W3ZEWc5mYQ7+CLuxofPG
 Vze+HQjQq1TcriPXo4tFCingTjfFvKUUvLcoZxWk9Kni68TgjH5wa4EKD Q==;
X-CSE-ConnectionGUID: rRh0smElTN26oEd/71mgkw==
X-CSE-MsgGUID: OpYt56sURTC0I8Ny3QFp/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44499146"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="44499146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 14:03:00 -0700
X-CSE-ConnectionGUID: 6g+apa9OTsS2wkYSR9w72g==
X-CSE-MsgGUID: +6WHQbwxSo2h/JxhkZVevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="73774226"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 14:03:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:02:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 14:02:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 14:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kptzJVpEKJjzLpKW9spbBTOpw4j/DfOFayzFNAKfbicbPs86r4B1ovXvwQg0Y0NT7tBpQ9I8vB+pkoLt+k5CnMogvVBV4BOBmGnaed1belLJfxiT75rgj7kzIAOsmjG4hkKnEw4xcFgLGYwMFbIP1ux/r2hQKJsw0iLf+7vavBZcwChn66aIda97wFRVcj7MQzRuyE1r0lEdWogzi7tUDesenPKoIavykT5/3wNpY/gbCt+ifhrDP4G4UatOsTn11meQUh3eNYSB/KjcvBwo1GPUWu2RvCToCX7UIrB1pAYnozVRKRqslN2CiZoMjEO+utmNKD62bar1vIsxEzcwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJDVJbjdQhnmYGOZ5FikkMckzffZSl1ZfwVC7rYb4wE=;
 b=OwOkMxsIS0YYU1XZxrC86BaAfjlkEsq7u9wB2VbixPuIqdEiOU2LgQyxptB9ZEtub4/0mXr8IZjAuOb7mu0qlsTj9kF4k71fLP4oCsz7VJfOSsWoz1gA/E9SmXoCJSw92gJyuF8dXRUzH3VR7akXJUU9z5Hswu5Jl31P5+dz/Vz0I+I4vbVL+KNfeESUSt2oH9l7SJ+8GZKAbCsTe44FWmPkeuEQ2VKY3lOqTL4eYF8Ld4Q64aR5Ah0xFV+aZ96zan28RSEv7xZ30hBVXiYU0rGnuCYO2wqBqNTDLlauLjMs9DoHAx+c0w3MkHQbFsYJTKos+xkAe8QkGgYohn6RVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 21:02:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 21:02:57 +0000
Date: Tue, 1 Oct 2024 16:02:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <apoorva.singh@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <oak.zeng@intel.com>, Brian Welty
 <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Message-ID: <juv7n3jsyv6hqcxbcnlxgeq5rlqayukriwrcbjq3lmonlhrnos@t5dpzwna5r27>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-3-apoorva.singh@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241001135432.447074-3-apoorva.singh@intel.com>
X-ClientProxiedBy: MW4PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:303:83::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae74e7c-3aaf-4a07-92c2-08dce25c6d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mhqf1/rhtJW5h4nfA3Hk2HXlUuobGGeNzrQhJYK7KNf5LtUuaKJwKasuhN2A?=
 =?us-ascii?Q?fU9ythOO2rnqIkKqu4UmlpCLC8XhVjPgfDvtNuqBCs4eiif87osFPnytoyWl?=
 =?us-ascii?Q?4xnRk5xG1pIdI3eoPInqeYAvmXT1T550uFZAQI1gjDSYHNGRUUDzGn+McuZq?=
 =?us-ascii?Q?Md2IS0UMuQghbkwFdD3Np/nztOtJxkEewi6xXKAgpt9pUhk4i/VCamrv4t4q?=
 =?us-ascii?Q?6tBRUxN5ouv3U1bJMib7NDdW45nBAvWCAlDGwDxHzlrPfBvrppKhDKb1xkMF?=
 =?us-ascii?Q?ydxEyy0obdMxXtVrr+/9lYEY2+cYsy8ngxu+IE3D0s5GZcrEKuVxWhyDa4Zm?=
 =?us-ascii?Q?ePdy5QDlXxrs+4Ytwp8rcLTB0y3wGSYJtsLWntgDWGRysg+0zyS93zFGQcim?=
 =?us-ascii?Q?irG3z/xKKQlC58rltOQ1FY9gQICeKNY6RMIcqKCgxkMGIO/MU5H9l9JowJZ8?=
 =?us-ascii?Q?R7oXKqilGTYol69HyOYU/r6zccw+lfirUkEQ8qajGEnO/BtQ5fzCU4ugGYYX?=
 =?us-ascii?Q?tX8FX80qShcIr2rzwoJahlgkS+pqPC2jZTfTtiXEW+epTNs2Ey1Ao2KZDuXO?=
 =?us-ascii?Q?ReJrALG5FL1XY1ZM7no9Gc/Yms3p8H73XjvRGkjOKjtRj3EBCqDJSQ2ec56B?=
 =?us-ascii?Q?ThGMw2b9KLaOrbYPqFXP/t3oPG7TBJFenV/qtgNFpD3NUttJGp+xgbXM56jv?=
 =?us-ascii?Q?f4/6lpyC1xdJGCTYQWapd/oC0Hue7n3PyQASJqbPBtzaQ0klWcpVMcnerRgc?=
 =?us-ascii?Q?xMZ2TFgsfU2f88KhmKGNYohI3u+Wh+N3uTqIDyer/uTWKyVpq9awu/8j+Hsz?=
 =?us-ascii?Q?9DuCVAOC8M4BLG9HDQ+cerLNQuxm8CpyKdVpj2k7bC0RfmHY2KheV5duDuje?=
 =?us-ascii?Q?4wWCSomUdVDDYVES3Y1rtk0BgjSZTDu/o3nITRP3dmkyS74gmyju8VBNXCXO?=
 =?us-ascii?Q?CxsbyI8pGEeDmOIRJOajwvXkyiw8rLZSTfpZoE5vR2TTZMPyDyhqp7F4Lwr7?=
 =?us-ascii?Q?AcXFWfZqX8VxoKaeIBV1DXowejnJmxCJoJ+rwq61UTiZsXSrSDEj2dHPN1Cu?=
 =?us-ascii?Q?WhuyquxdivJh9fbOkK6UDY4ANyyNUcWnY0w6pj6MlinokWqbx+meGzj6MAK5?=
 =?us-ascii?Q?ogLeqgbayjtYOzR0FJO85mdE/AT/SMdc+kdBdSR/M6NLzHciFX9k5VIvJx3h?=
 =?us-ascii?Q?rb+PCBnyyEf4SKUS9mRWWYxMtRsvUXxNVj0D29X04L5vWvNNxa1I0x0mBvuM?=
 =?us-ascii?Q?bKj2L6EvPBbEooIqRbPANTpNgMeEJDuXBQCECbHaPQJ18/DQYidMVnjzoGcN?=
 =?us-ascii?Q?wG35M65pariKr5TfZucOFymajjX3H36rDK9AKxfkXdEZlQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8OX1iLYoyhK0LCgR1XrKEDJ0WAaSidM6uGyS6jp9nAeBIwJtjiZNE9JkL/3j?=
 =?us-ascii?Q?sFZGY/QpfTmj5li2EyIl3vwOdVh+K/l2wcXJw63e6lPGL6Wt1DXAzsEhl+Vn?=
 =?us-ascii?Q?eOcig5CdYVjDuMwd/n8IraQDRRPlYwVOiqOeeW/K8KN1F92wIipkgnWurvYg?=
 =?us-ascii?Q?gHe+BDsedIOGqmyMwvoIKfxu3N2SU6X57HSG80+JoDaig4/rj4QmidOPhMIp?=
 =?us-ascii?Q?/j0uKK7A9Z/5hudBLsSbRuvT78jpB2sD9HWBnvK2S25+T5Y9g4DBK0SbBO37?=
 =?us-ascii?Q?diljffTU2esXa0y3uAIU7Uw6WFgC8T1wkZ5/Swi2jKneZX3ntfcGnp9HX3dF?=
 =?us-ascii?Q?yklWLYl7ysCyAPpG/BH/OVZUn/YWf3R/h1IpMTHYoY8IQn3Gve0k54WDE1ZG?=
 =?us-ascii?Q?7VK8PNWDrEI16qJcgvyxRSyfbMLOoQBoTndb673CYiIgda1KGHDSyTihqOaM?=
 =?us-ascii?Q?TFkkkcKiI1+1cfTGZPiBuVhPpWqLc1UvjhSl03W84B1iyrvNjz96aa95XFp9?=
 =?us-ascii?Q?eaiPTR8z4MVVcX1dtrOv/7w55SDkHlEVmQ77ixF7fggnA8aLzYk4gI/jCgKO?=
 =?us-ascii?Q?W9mSQJ3L/lYnxLo+AJKaAvZpLA0owwqzbxlpnHyxqCBp55aKVzHcQe0TrF1q?=
 =?us-ascii?Q?C10g7pm2Ze26eznsPmrqkDfvGTGLsyZPHMXg/Nef3f7DZzr+X7JqNDuFDmlx?=
 =?us-ascii?Q?EMchYBv7a05ChL26Tx4K+K97Yu32amQGDaM+C9Xm9olK2PrtmTv8NhXdRoIT?=
 =?us-ascii?Q?7r8n505a3ouLiM9rjoRKAo3tovpCQPq3yN35dTW8jwFDsDmbR4KeLUuokBC6?=
 =?us-ascii?Q?1TFD8rcMtNKA0NcsrDZVDkM7AidVuNmMKmnrYJPKOnDcJ4YZIA1DY7EVaunF?=
 =?us-ascii?Q?Zn8J1Ao6NLdT+iJC23KIdmtlFr0yTK7n9s1D+/VD4TWN0hQ8K0eXAFsKv8GH?=
 =?us-ascii?Q?BvMMWP14HewMWwqd0gEnSzaPcY92SQdyey9goSvQbb+/C1YE/mNe75tBBk/q?=
 =?us-ascii?Q?upm8IPoh14CXVDC5tBYvVDQmHRedC6hpQ36tGMvMVH3bL5D64SM4HvrGoAB8?=
 =?us-ascii?Q?f3iJKrHOk6iZBXsND56Y+3N5JcvZRJRbJVgQltw7TIv25NjmnIoBA8p2zBJu?=
 =?us-ascii?Q?jw9BUINS8TzG7bee3VTtt0rZqg1CezX8HAC6WroRg4MCmEIFO8zTVM4IwG1y?=
 =?us-ascii?Q?IfOUNwoPlSSrT0yfEN0Wc2uapN4/HriQ4rbJHIl61QJsmPNHdixO3WftKCio?=
 =?us-ascii?Q?PhDCOhC0m+QbbQEmQgF2Oi2eJIwoLTQj9aSRsKlBSz7FA9nihGSHgIY79YqL?=
 =?us-ascii?Q?exd0TbH2u8SguVT/3/AaDC0yqbcKm1g1YPPAYgNKueGX/mRfj+06/Xe0vvSS?=
 =?us-ascii?Q?SNrduHztmItpwfLpFrk7CMurgRH5n2iF/J3wHUxVkFsYkwUqvKPLPUJHHdpF?=
 =?us-ascii?Q?ATAn/DTTtEyfZirS69+T3nmxcBoT3fqI/f7nKrl0MdtYgnwkyG6WJXtvwAq7?=
 =?us-ascii?Q?NTVyFLSQbirhiYjLM76nO2jpwG+Trq3MdJosvQiPzXrLN+dN+U7nlBlj6wBF?=
 =?us-ascii?Q?DmP1QFUFGHobAQz2MkgjBhWF8tdrS/F9CyTdkK84mdzVMw6M53236ML89Enc?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae74e7c-3aaf-4a07-92c2-08dce25c6d45
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 21:02:57.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUt5ncLqpfQVourbwiGMfC56LUuYdKGK3FdeJe4+uDrEMXPIa+nKqQYTtknATcAEm1XL83sbjgqxzPuYyiR9xZpsde2fjXyua+N3OxlK7Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Tue, Oct 01, 2024 at 07:24:32PM GMT, apoorva.singh@intel.com wrote:
>From: Brian Welty <brian.welty@intel.com>
>
>In order to enable access counters, this must be enabled in LRC for
>the exec_queue. Add basic uAPI to set configuration of access counter
>trigger threshold and granularity.
>
>When access counters are enabled and threshold is hit, the access
>counter handler in xe_gt_pagefault.c will migrate the buffer to that
>to that GT's local VRAM.
>
>Signed-off-by: Brian Welty <brian.welty@intel.com>
>Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>


What do you mean by **Restore**? I'd expect 
a minimum amount of documentation explaining what this is and how a real
userspace can be used it for implementing X, Y and Z.  Link to userspace
is also missing, and is required for uapi.

Lucas De Marchi
