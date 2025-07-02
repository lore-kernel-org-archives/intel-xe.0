Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9401C83038
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 17:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA2910E06B;
	Wed,  2 Jul 2025 17:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGJfuX9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434B10E06B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751476041; x=1783012041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H9eNNaJvMSoh571TKBcmuq6NvpnZ1dokz4Me6LEDO64=;
 b=nGJfuX9b/8t6emejHg92b5TLz24v2DCf81u2d1BizKdZjtypY4+wneSk
 1TozVTNWIthCPfJGzadMBw569p50ClCdmNqAp15e60r+wuPk6FN0LLJC1
 kf0oDo5++pl/Ig436muq1yy/jD2QMUZn24YoITzKb75oHWnsNUQR/GlR9
 PPWg6GA+5Bcot4heRKFEXYpL2b1+4VOTdigXdnuUFc8ayBn7zyImOgAU7
 7iMrAX5REKjMzXkaS89wHj4b/25K3OhjaT4EB0Bt2AydbIhgap8gQifJP
 lJEVbLDcaRl1yrZgOQMWPqwTcedMgkObgy3jSxFADCQwdR0mL1fbUj3k8 Q==;
X-CSE-ConnectionGUID: m337StKRQ4K1WZ9Az/pW+A==
X-CSE-MsgGUID: Xu9zUkKJSnuLDFOMkxwnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76332057"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="76332057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 10:07:20 -0700
X-CSE-ConnectionGUID: gjA484N7Re2Qs00JVtvJzA==
X-CSE-MsgGUID: hdxn2BVeS1GGKcq1Ed+vSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158176510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 10:07:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 10:07:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 10:07:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 10:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmzuN/83gCjRlwWl3KqsfwM8kKvxj2DhjrnZ3BIY+9AXlfVQlEoJeGZxByhKPOTzlZkURlN6F03Ew5Jj8s1YVmL8NlrVS45Lk2Oh5nGpMVe9yoaH3330GyZJeQQG0oByLeRzuA2qic81+QoougRUwSkxdEQh9MVCvEIPvgwKLg7qCXBlStYgxMIeHeMctN1pBHBy9hZ8XYjq/9AujwsVbbEef43hElecn1zWYAuSX5JLueka3IGZAmWJbyo+35sH04Au4qkqxqdHQ4D2PC0cENapi3UzuTJYzPjQ2Dbwxtcr8QStpXH6Qqnntzi5tVCz+Ftq3ixbmj9pHq+OCM0RdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA9mFnV4YwDsSmW5jYz79lPMJm7w7oNnNeApmPZ8qxU=;
 b=fOFgVv6O5QRTJA/9/NNUJVawpWkTUd6kAt0tM01ySG6xaFhO00RARFmJ0FC0fx299W5XDZWGCnAl85jNAMwqpvaqvPb15JnkC2wAu9VuA7KMLxVNv1sW/Uw19/gkvQz3acwzXshFEdiz0tVX/gs0y4WJy3A91WHrVrervZWBHlqdILfW1e40w5+21CtevssCeGrUBUtSRshPvpAFfHm9ttKvkA0En7Vw5KYoa8M28okSBEua3fADYWtRLWvJUTeuKTXOvzOFeO3vAbV2HEj5X8bXsTkr5mOtcWXCntkbESSSkId1alwZiMkp+wwuzMOhAXPyDgClN6Dyl5Y9SaufiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 2 Jul
 2025 17:06:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 17:06:48 +0000
Date: Wed, 2 Jul 2025 10:08:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Don't allocate temporary policies object
Message-ID: <aGVnjenl5duaWQTf@lstrano-desk.jf.intel.com>
References: <20250702142504.1656-1-michal.wajdeczko@intel.com>
 <aGVaSt6g9og1Iyir@lstrano-desk.jf.intel.com>
 <a1abff7e-62ce-493b-b5fa-094312411e58@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a1abff7e-62ce-493b-b5fa-094312411e58@intel.com>
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f134661-4a4b-4e55-c77b-08ddb98ad47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZO5wb7AYBNdDIc8IwrGV1Y5GUHgc1NPh7kpvhEdaZuprr6OhndWCOoY2Lhwn?=
 =?us-ascii?Q?0DGwtdIDnScv29jXzSuMG+loHgT9V2MogBV+MWPRt/0qdnqt0S4HAFjHXpwy?=
 =?us-ascii?Q?51rXdCynIJ4xdTZoROUrSqmWvcchbTsLPaH8mI73ffYNk6DfKhbNDMvdhxZQ?=
 =?us-ascii?Q?kwLCrmu+bF+Y463oE3aLHLv1QlyTVdHqjm8u7b5geOt9+7sADXCICMXZysl4?=
 =?us-ascii?Q?yj4z9UTchLlndbv36AaM5sQfqyTEEu/I99ncyBxm14tYvCWqmiv5CxdPebPu?=
 =?us-ascii?Q?Wl00XwLCizvSqVwIO1gJoKphpOC7t/x193OqTnGVNidvNVLF/HyKiQhPaS86?=
 =?us-ascii?Q?NL7sDKtbS/FB+6lULgXw5a1wy2qYZnZb4ov9a9Dpzo5GK7tqBP7rhDY9Rhl7?=
 =?us-ascii?Q?t9l6tj9OkxWf8QZh4Hslwm2srvoHUKDhs5zaZzXe+QJ6wK5NoafUJxfkCr0G?=
 =?us-ascii?Q?ch911iyK7sjRdpeyInIquQfCDVPHdkiD+kKR2bOZkplRtx8EOyWUY63XUJCg?=
 =?us-ascii?Q?2el0jevhvDLDhaiDMiApaib789tAw/qgG3Hqk6SLU7NegY57wXHvwKNysbT3?=
 =?us-ascii?Q?Tm8iZdkOorlVw5XbqI8t+LoL9OtNUw99EnSELv7Uj7lhGGPssA7W0cMXpVtj?=
 =?us-ascii?Q?+CoRTnlaS5BfOjF99MNpYkUgu886b/n1g+LsNwrdqnkuMbYG3N7nussOVf1g?=
 =?us-ascii?Q?TLrecfB0IVb97aoSMSMlGQnXSfColjY0P8dca2SlIwk9zWk44D1Ly6E9I8Sc?=
 =?us-ascii?Q?dRR3iM5VetCDuZyt1x5oK1+HwoS+dK1dNlB7sPQ7l508vtYMmRtprp1w2zkx?=
 =?us-ascii?Q?FOn5VjpB/GkeBeN2vxpHlALJQhGBuLR8EhtRYPTP/7T1sU52/WhyFOefNu7d?=
 =?us-ascii?Q?WDjWiPmNw5r+RhQVbSaIp+dG0GXo9/BVorqkEmTRdqlwxhiFkgyiDHNlbVBz?=
 =?us-ascii?Q?r5QGnYswEnZzlGemkI1AiQgNh+8Gy7/O+8SA7LeieFswTAMJvH2DjHdCigOd?=
 =?us-ascii?Q?s2OsWvcDWtDDApG4FGhMTfjssVdJsKrLqY7C1cQM3kdEqqwaxk/lhbS+JvLC?=
 =?us-ascii?Q?OevgHLZsrdDhiIs81QrhNAdaa1EbvO0qlo3soA3CpmjrKevaR0CU81n1sqBV?=
 =?us-ascii?Q?wB2jzGcHk8UMuDjeVwZtY3m+hYwA+k2F15heeCJlEOlnh0vuUyfjWJTeV4YF?=
 =?us-ascii?Q?X+mh+wxCgt3FZYHMfXuhiRCPfTj1SQVWEAn+jJzQX6pS9wrPLmuxrORGOzr8?=
 =?us-ascii?Q?9aLBY1T3KvQWIc5plVCUgBdngEpG3Cyv5i4MKL9al9wU6758bJuEt4aZXlZp?=
 =?us-ascii?Q?4yXM+M/Jm7JJ+VkhGcwvqQjD/5cFQj8r027KvF73yYEQyS2EyD90Pc1HJndG?=
 =?us-ascii?Q?jSJ0mrDyR5mE/SrPnknW/MMjxJsIwc7BZJhJZPwIazMVWJ3ryz6T1+at99gG?=
 =?us-ascii?Q?LNEbfFWassE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2BouuDTwht+dCqU5CX5xrxrz8OmAxwbDDT3rSTfDA2EDJbp+MZTNG5CsqxH2?=
 =?us-ascii?Q?/VEkQLzqV9OhLaH5rXMrBzXmIeu37ZElhHiNCcE3eUJuWHeudWx7V+Dpi7Uj?=
 =?us-ascii?Q?0MCTlWcET3JOHrsx0FHyVRJbX5mNBkYo5JqnU445JTLik6agJhB4kMJ41Rer?=
 =?us-ascii?Q?y41wJm6tOEMRSJtXTnCPfc+J13ymMzQcCNTQxqaeua8dRvmvmKmBzMj8bdap?=
 =?us-ascii?Q?Z/iGPNA6XD7bGpG6QiULEgW24GpOa8eCgJS61esumowvyjVE3d3Ve90Id+7Y?=
 =?us-ascii?Q?jasHNAzprMQzz2xZi6WQSuluxAPPS5zJvcG1A9Kgfp5tWKghVT3Q1b0nsIRi?=
 =?us-ascii?Q?s5/1DfD/l67BeZTPiyBKwT+JZwR02mZ+NNju4Jcy0/IhW2V5AS+GCaoDFpbp?=
 =?us-ascii?Q?GuY7q20HRchZGknBrPo6i6WT8gMr2cbmAWoxb79Vj1Cwtsf0MxpOe4oqC3kQ?=
 =?us-ascii?Q?JIp8xzyixUFL2w/KltVjzDB2SZ2juVgPOwujYvHcEH6x+0wcre4o/1UQJz/k?=
 =?us-ascii?Q?EmP06tug4BNkzBMrxhXdOHOnbNKo9FmYMRNmHylO1MRCWjSJ6JoV/eLaaaEe?=
 =?us-ascii?Q?vx6NIfXFFligmgE+/KObeohUutedzxqA8ljPpMndWtEH5KPGRo9kJqs9LkmT?=
 =?us-ascii?Q?NR4cNzlspHRsl1WhmEQc88wnljCOJTVgEQNPS2dHkzrY4J3QJUxK8ubUfayL?=
 =?us-ascii?Q?02uwD0/r3+FOWX1s8s9spXwMtgfy8uHIp0dmG+6PPKOMza7Dif7K0/S+GpzH?=
 =?us-ascii?Q?hBlvN9W0Wjk19pSb5xuItA+IHbB1brSocb5wgVZ92poYV8rhROMaCxDAAOz6?=
 =?us-ascii?Q?PlliVkDgz+WKFlRvgSdurohv4cQaIF5NoWOZsAgL3YNFXpnfq6ggkl5v6/NC?=
 =?us-ascii?Q?ZzXABaiLOJ/tKDo32VgrBCOygvCCvP7uPV50Wgg8V4fX4FKdb2LSA9EMeGMU?=
 =?us-ascii?Q?oP44j7d/lZ92FEq1EMbSs8P7KfKaODdu5qrJyr7W5JWq/LLO+W1aR6qz+JQY?=
 =?us-ascii?Q?RYjnnoPBgNuQnplVR3mH1V9ZJArJLZKatM/fmUZ0+PWblWyr/+T+KufjSHN1?=
 =?us-ascii?Q?5ljSiBOkMUDhLWWfzxShqGp22doHr5wvn73L3fDk1BlyNM8gx6L4zp1+bz7Z?=
 =?us-ascii?Q?MG8hCD66D8COjoN1/h64GTnG6X8+Ic1cO+W7vGGbK/kNw6WH/6AryMGT5tqd?=
 =?us-ascii?Q?SthzjHBur3hf1gGKGPZUOyuw86yrIw//TelBsnKKv8Tadbg6siXzkIdpe0lD?=
 =?us-ascii?Q?he8jAnsDTa4Cz1SYGsztW/ppvUft0uWBjaQWtdjAY2N6tIqGIxUXAwcRLzhi?=
 =?us-ascii?Q?wpydR02aYSV347lwmnxIHJwVK30DjXoAvdM8S1HdD1RJ95HM/iXgRKafEccG?=
 =?us-ascii?Q?BZvAACXnp0WotqnKILlZONESZGxyh0HKIwv/ALVdRGdme5jv8zAW+V/5To0M?=
 =?us-ascii?Q?NnhNHcGVjjccUHRReKC+s3/4VkOub3j2a2X6G36at5z/FWq6RRpjUVSqNscP?=
 =?us-ascii?Q?InKQ3B6kK0TdJrTHnmseiCYeeqlL52GvP6i1rbmaLEuwGuHmzInWpwdPqI02?=
 =?us-ascii?Q?50UK/CRzI/70aOQQdQQvH2o7/S4SFroh0h3JQuhJzu78F7RMcazG/Yz2ydKz?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f134661-4a4b-4e55-c77b-08ddb98ad47c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:06:47.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yd0cUP3I6Z84RzMVCRAfyNT/hZ3OifosH07/ZBtB0ejJexwxFf07DngMvxjrnZmCMBMxm8Xg0HmhgvgfbhKykA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On Wed, Jul 02, 2025 at 06:25:59PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 02.07.2025 18:11, Matthew Brost wrote:
> > On Wed, Jul 02, 2025 at 04:25:04PM +0200, Michal Wajdeczko wrote:
> >> Since we are already using reusable buffer objects from the GuC
> >> buffer cache, we can directly write into their CPU pointers and
> >> spare unnecessary temporary allocation.
> >>
> >> While around, also make sure to clear obtained buffer, to avoid
> >> sending some stale data.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Patch LGTM:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > QQ semi-related though - guc_ads_action_update_policies. The GGTT
> > address passed in is 32 bits. I thought the GuC firmware interface
> > changed everywhere to use 64 bit GGTT addresses to future proof. Did
> > this H2G get missed?
> 
> dunno, I was not included in any non-SRIOV GuC ABI reviews
> 
> but I guess we can still add new action (minor ABI change) that just
> will be a new baseline for any future platform with 64b GGTT, no?
> 

Something like this, I'll raise this issue with the GuC team.

Matt

> 
