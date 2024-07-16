Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4177FC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 14:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF62689906;
	Tue, 16 Jul 2024 14:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnvBVBfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2410E2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721138433; x=1752674433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EUz4ZBASDzBMjEedxqeDfpK1AJUT87aEq2rCjeo/7N8=;
 b=QnvBVBfnrMGgiu8SquMM+CByP9ziD/byDEmdisyIFRr5b7g5qygi/X5L
 ycjLnruUizqcb+BaNfpW9AAJnQSv1S1/RSYbqrPmOKoxX3YEKFogDCHOt
 BnUi1G8u6UAGH2qXmH3AFptkQfWg+QJrDJlmMy6sow3Kc4d8SGnnI+2Uk
 S1ixVKkQSLZbdMni1VpEO48y2z8GzP4gcl9mLyY88Pcy5oJ4WjDrZ3Syj
 L4OweBrOuDTkhWQ6xttSwntKWazp5xcvQtBna0me3lv2+cGkKRRAmLr2s
 NIFOEf0bEZid5dKZ9UdUV+bX+PUALtYIoh6FZULqdodjtuQPTJ7qf6kJQ Q==;
X-CSE-ConnectionGUID: 8vb89odjSKOq6fqGjzhbfw==
X-CSE-MsgGUID: dQ8p66ypT+KsMqR0VAP0IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44004853"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="44004853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 07:00:32 -0700
X-CSE-ConnectionGUID: +t5ymqtGSmW8zgLMYiF8OQ==
X-CSE-MsgGUID: vsScF4txQoGVn61rl618Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49902917"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 07:00:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 07:00:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 07:00:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 07:00:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3sJnt6YuGV6/irDbwISfr9M+Z+DG6Q/bXAOCPOm9phUEC08ARkEBml+unJp3EJMOpeONyHFi2yX2YmHaHMjciWeNdihhrf3jnGPCnqi4K2jdGeSKQ/NegwJwsf+VyPyY1GnM4eP99PnMRLQT/4PMYWFrwepTa2xfgGdLPfg18qTgymGwYAWYfq/Ej5BrkALl+ArVA0x/vYBg/UmWc6gGfcr+/UhI1f9pl05yP17lSd/TFSH+2h1U31XjwZoowpf+YIdVBvpLdSajPua4oWXsFeS9FeheLzeAGbQMNKCH3M58K3bjAgCg4fl67flM7e0IoUgI5o7a+gSGYOgzq/v8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0H4l+4nlXx84LRszgusL0ke4alT4tYS721Ov+yoCsE=;
 b=Mg69Nir2938BzlyXlDyUIBYOhQD8HXkTbnNIE16Ruc0wXLuowt7xgDLIkOhe1lt04qP22CuQxIVssc5EsRa6FlnI+p54hw2F3swPW8BnGdiGpaE6txpCgIVejammci4Thyw/LH9CcfjoK4LHYeD23s6PuWJYs1K3PMMtUx4+2CuEXMrc3s3dX+q4sMC6E6FimFLSuTqWdriRYIRKY8lYy4oRJt3T875toi4UPTnowgKuj6J8cIlAqphQeOEAgOh5uE57vHM7uaFyMq1N74+9h8xrIeDZRrqNO2pFxV6xgwPx1Y5LSsR1LuPf/MWzf210032oqzy+wdY4JrmCfesTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 14:00:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 14:00:25 +0000
Date: Tue, 16 Jul 2024 09:00:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
 <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: d4231ee7-3160-4e27-5357-08dca59fa416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3vUpv0QdAItbzBZqY6QmjCfhwwcJ+Bit7Am4JXAu5jqqLvBTvvQsChuO8Q49?=
 =?us-ascii?Q?i6WFZK29sasuxZMhG36HPExdwOHOVg4GayBM9P95K+/6t2fs/BYVyO+toIGm?=
 =?us-ascii?Q?F3uVhFg3YSWRkasWWJRy8ErT0PkMTs5m7H09oBlWfWPY5j1+Ce2+fOqvXlT/?=
 =?us-ascii?Q?u+9KqnrEbSw3MzAbbr00lixIJ3YLguOB/dTsD8SGTCvDxEN8QbVkP93bUyjR?=
 =?us-ascii?Q?N01zucEYLGPqREttgSx46C/m/7XM9gh8wMjrbBqaZE3RY2F2anFYKzjjvvVG?=
 =?us-ascii?Q?0Xvxla829tTwZSnwJGmXtVjsvBbuguDHqhPDveyKJimMyCEHfc4gBlKfkIDC?=
 =?us-ascii?Q?2MxDnzoGpZT1bdLlu5Mmhum0c5bXTaVOYedjDeDt01Dav67xzOBVB1QAfR95?=
 =?us-ascii?Q?Y3MZwi5bzWRgq1m9rtU867G+uQKE+/uVQpZgy11LbwyrIWYSS1xpsTKtGZ51?=
 =?us-ascii?Q?eRh+3UJj74cInuWOn0XEIlorAWFPIsKQYGdf1K0642XzQgWe1ZzsxcdhCiFw?=
 =?us-ascii?Q?/gqhzCNdqdocdcRsG2B3k6riHbIrxRkVI6vxu8Kr8tS1maFmJsF9rGb7va++?=
 =?us-ascii?Q?VapnLjHc8BKIe442+XnIdVhlX5ELcS7hC2DHQxsOpIqZAHKSh0MRItz6xv+1?=
 =?us-ascii?Q?dGDs9RkdSievH6oGtYC+jyN6G69aO0hplWWLIrTNjwwAD0bQBGxYZFXhyFDL?=
 =?us-ascii?Q?VaOEZHVeDnXeSyHSgIiRoSvBCorJ92wGZBgc2j1NVSxBUpeeTiQXMv5uITl2?=
 =?us-ascii?Q?mryxjLylFv571CZ+YPOofmwBf/wwxVGxSOmd2fztv32Kqw5pdSh1fjsLcLxQ?=
 =?us-ascii?Q?k1AYR2X7FhQsnhDvolRLd0NV7OhtgVXdiMpqKDYy0VW0bCpH8wkd4pFbcmAb?=
 =?us-ascii?Q?bhwtijam8+E8gQeXLL9sTcz++K3LQwevJ9Ec5vWcrqEyjT3dEfLKHoWvfs4j?=
 =?us-ascii?Q?FGjp2/dZMHu8aExxUEYJ3h6dAY0LIL346NbqAbUxjiJBepF1BZbFV9oAYYj1?=
 =?us-ascii?Q?ZSwL9Uv/FvgJcxcDHUfm+x3T6/nxRZiKs88+WoOTtOQhHX/R7s/f3x8NHT/P?=
 =?us-ascii?Q?5VulRk2mv7aGxPg4a4Ksg/HoIq5CpLJlvh+e7gQHoEj7rR2ItXWDgBp7eVIA?=
 =?us-ascii?Q?iLGRn6Ymo/TpRSxbrjq4D0SBwkPX1Yn2NW152VVkXJBrwAb9njQViNHbJfFt?=
 =?us-ascii?Q?5O0w7V35PG3Dn4XVABbS+O3zOd+HCQEn1LVmbvh4zB8RdZrJv9xjkR963XQV?=
 =?us-ascii?Q?84qDOpihzEMlRaRqM0Pc+/vN/idRdI5pGLA9tm0ZUUbG1q7kx3DB9g5gruxK?=
 =?us-ascii?Q?Osw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v2zjyfzqp3aU2cq3ZmKcAShbuylauEGI3VfXdD2k557Qv3QIllUGPmCnw5x4?=
 =?us-ascii?Q?f3pfkBacp8us7i9xK+42s4mFgnaWcpNx0nmRXR5zmVAAtbVEnnGB9i85S+Pi?=
 =?us-ascii?Q?kfD4kc32ih4o87X+TqWYmdcMpqBw60Ajc1rwBGa19iAUyBOtzn2Lh9n/ivta?=
 =?us-ascii?Q?sjiLlf1CwgNdu/xg8wBj3M+/BrMol7lUWK96p6zvpL0zoJqQgOneCDLs/xmU?=
 =?us-ascii?Q?RWHlkt1K1iEMlHkLqMk8N3Ms8Tj1Z7QqzvqENS6CkjkT3K1d95kht8AkV7xp?=
 =?us-ascii?Q?w0YRGKSp7HMlWWrtkc4imGaGXrHdtX+IaflXHZPcrbRcpHefVJGflB68RB3b?=
 =?us-ascii?Q?9NrTLxeeXSdVMPweO25Th3HOGwqRNhvCzGoRszE9I3BnaPyZB1GrUcPev4F2?=
 =?us-ascii?Q?QmElheT8bnBfYqWyfNSnVFWJWrhUFwXE7KAhOYmt0zujlbqyaKlvdiLT83xW?=
 =?us-ascii?Q?5xRYhllwrXa5lMuKFEV+oQsKBs9yb3BL9BPSpWOkJ54tLIZBj4o+BTIMpJm3?=
 =?us-ascii?Q?QVpfJ7nmGs4FEVQgddlcnmu9jgjFR8wLWSHjPodHdPtXWtMEavanvuia+mwj?=
 =?us-ascii?Q?NB7xQu+B1hSgL93F7vxBZzKFOuHzNT+RAuoomb4Zq3wbfDFs7/VKIGbP2ghg?=
 =?us-ascii?Q?xho6AzVVqdQ24AJjajPnwypv8ZH+sBres0Q39ywIUF1Z9F86TQzLjrVCgfFw?=
 =?us-ascii?Q?xCLwdegXbNHFQQpFASSZqpWzEOCe4PvpYFgYhcqZ5BUAgkDgrCJkbf6/pakE?=
 =?us-ascii?Q?cW+3hWcSYn1Qids9P48pFWqgejrN+3PLzvhELr0bKllLg1LTbsZqZlCGjA7E?=
 =?us-ascii?Q?0e1tMpDvKFrNISOrCxe0uGUPXBygd28Y+MINQ+yFMnorpBNd0KKpCRo41IBL?=
 =?us-ascii?Q?RlbOE+PFXk9pDchoSUZO7BUtPlezaXNyd+wlB56u1r3uilB6nipXdle/Gg8+?=
 =?us-ascii?Q?wktLhmizho6DgQlqfffsgkqA4yUN0cM184AIYH6aBwl0MSSzj44fz33fyquH?=
 =?us-ascii?Q?p1umyAsQbuqq2eMII3OPGua5Lzevrn/PtAKR1uVXaHSvTFa/Ejqqi99/eQ0r?=
 =?us-ascii?Q?to76EfhXH5jvt58mL89GO//gEfXLhFz6ufoPDqlPz7w7130jbZiRJEfCkfS8?=
 =?us-ascii?Q?gqztN97alGg2ewO8Jypt/TYrL3Yd6DDXUfx5fKvXMAuKsSGvT3Pco0bvqibn?=
 =?us-ascii?Q?0Q4uvmuqJHEHrmEQup2LSVxEhDSsciYWiDczqWUqxycmvhVE08c7Lju0YAkA?=
 =?us-ascii?Q?YYMplDfwiMag0hR05Jw830ZNjXAfO5x06V7HDmE6OxjUCfFItTguFmW6HNV7?=
 =?us-ascii?Q?oriyt0B3YEGfPxYn3I4fNMnX2vZJxCG7QBo6OJROq52Or8wubZ6U7ETHfH7s?=
 =?us-ascii?Q?Pfh7N/kVX3r2/6YxH6OC+YJB+8/gwkvB/JQjDazcjMB2ZqiKokMtbxqHkH85?=
 =?us-ascii?Q?ntP6KT3uuXSghq6zjOw/7QQPmRwbstIT91RDu22eXQb/vYYqOY8+4bf4Bx68?=
 =?us-ascii?Q?/L69hQp1NAY3/PXZeGgmYEN9t46PUxwRm2Cn66MpbaV0cbWLUBpLR/Vq4tFm?=
 =?us-ascii?Q?OTOPnCkx9NOxsc52RYZFFz0CzRseMlgEd5bw61yoSt+wbWQQBho+b+nsZFKF?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4231ee7-3160-4e27-5357-08dca59fa416
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 14:00:25.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzFwJGToE/1/2U7Kntd+G5X44X1UCwr1YUZ8WyEpfgYy+EhgOCK/dk7/6XRKkFypyHrKPX+qX3pjUFhtFFIULAryADdRQD5oNnwJrSK48Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Thu, Jul 11, 2024 at 02:16:11PM GMT, Lucas De Marchi wrote:
>On Thu, Jul 11, 2024 at 01:45:15PM GMT, Rodrigo Vivi wrote:
>>On Wed, Jul 10, 2024 at 03:02:27PM -0700, Lucas De Marchi wrote:
>>>PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
>>>reporting for PVC the number of 16-wide EUs without giving userspace any
>>>hint that they were different than for other platforms. Xe2 and later
>>>also have 16-wide, but in those cases the reported number would
>>>correspond to the 8-wide count.
>>>
>>>To avoid confusion and make sure the right number is used by userspace
>>>depending on the platform, add a new item to the topology query and drop
>>>the one that is not available. The new mask reported for both PVC and
>>>Xe2 should now match the numbers reported via hwconfig.
>>>
>>>v2: Use a different topo item with EU type in its name to report the
>>>    new mask instead of adding the type itself as the item (Matt Roper)
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>
>>>Tested on LNL to check the behavior in dmesg, debugfs and ioctl.
>>>Test-with: https://lore.kernel.org/igt-dev/20240710220050.2169596-1-lucas.demarchi@intel.com/
>>>
>>> drivers/gpu/drm/xe/xe_gt_topology.c | 27 ++++++++++++++++++++++-----
>>> drivers/gpu/drm/xe/xe_gt_types.h    | 11 +++++++++++
>>> drivers/gpu/drm/xe/xe_query.c       |  4 +++-
>>> include/uapi/drm/xe_drm.h           | 10 +++++++++-
>>> 4 files changed, 45 insertions(+), 7 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>index 25ff03ab8448..5a1559edf3e9 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>@@ -6,6 +6,7 @@
>>> #include "xe_gt_topology.h"
>>>
>>> #include <linux/bitmap.h>
>>>+#include <linux/compiler.h>
>>>
>>> #include "regs/xe_gt_regs.h"
>>> #include "xe_assert.h"
>>>@@ -31,7 +32,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>> }
>>>
>>> static void
>>>-load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>>>+load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
>>> {
>>> 	struct xe_device *xe = gt_to_xe(gt);
>>> 	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
>>>@@ -47,11 +48,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>>> 	if (GRAPHICS_VERx100(xe) < 1250)
>>> 		reg_val = ~reg_val & XELP_EU_MASK;
>>>
>>>-	/* On PVC, one bit = one EU */
>>>-	if (GRAPHICS_VERx100(xe) == 1260) {
>>>+	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
>>>+		/* SIMD16 EUs, one bit == one EU */
>>>+		*eu_type = XE_GT_EU_TYPE_SIMD16;
>>> 		val = reg_val;
>>> 	} else {
>>>-		/* All other platforms, one bit = 2 EU */
>>>+		/* SIMD8 EUs, one bit == 2 EU */
>>>+		*eu_type = XE_GT_EU_TYPE_SIMD8;
>>> 		for (i = 0; i < fls(reg_val); i++)
>>> 			if (reg_val & BIT(i))
>>> 				val |= 0x3 << 2 * i;
>>>@@ -213,7 +216,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>>> 		      XEHP_GT_COMPUTE_DSS_ENABLE,
>>> 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>>> 		      XE2_GT_COMPUTE_DSS_2);
>>>-	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>>>+	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>>> 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>>>
>>> 	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>>>@@ -221,6 +224,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>>> 	xe_gt_topology_dump(gt, &p);
>>> }
>>>
>>>+static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>>>+{
>>>+	switch (eu_type) {
>>>+	case XE_GT_EU_TYPE_SIMD16:
>>>+		return "simd16";
>>>+	case XE_GT_EU_TYPE_SIMD8:
>>>+		return "simd8";
>>>+	}
>>>+
>>>+	unreachable();
>>>+}
>>>+
>>> void
>>> xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>> {
>>>@@ -231,6 +246,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>>
>>> 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>>> 		   gt->fuse_topo.eu_mask_per_dss);
>>>+	drm_printf(p, "EU type:             %s\n",
>>>+		   eu_type_to_str(gt->fuse_topo.eu_type));
>>>
>>> 	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>>> 		   gt->fuse_topo.l3_bank_mask);
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>index 6b5e0b45efb0..01ea87d8886b 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>@@ -27,6 +27,11 @@ enum xe_gt_type {
>>> 	XE_GT_TYPE_MEDIA,
>>> };
>>>
>>>+enum xe_gt_eu_type {
>>>+	XE_GT_EU_TYPE_SIMD8,
>>>+	XE_GT_EU_TYPE_SIMD16,
>>>+};
>>>+
>>> #define XE_MAX_DSS_FUSE_REGS		3
>>> #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>>> #define XE_MAX_EU_FUSE_REGS		1
>>>@@ -343,6 +348,12 @@ struct xe_gt {
>>>
>>> 		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>>> 		xe_l3_bank_mask_t l3_bank_mask;
>>>+
>>>+		/**
>>>+		 * @fuse_tipo.eu_type: type/width of EU stored in
>>>+		 * fuse_topo.eu_mask_per_dss
>>>+		 */
>>>+		enum xe_gt_eu_type eu_type;
>>> 	} fuse_topo;
>>>
>>> 	/** @steering: register steering for individual HW units */
>>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>index 4e01df6b1b7a..73ef6e4c2dc9 100644
>>>--- a/drivers/gpu/drm/xe/xe_query.c
>>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>>@@ -518,7 +518,9 @@ static int query_gt_topology(struct xe_device *xe,
>>> 		if (err)
>>> 			return err;
>>>
>>>-		topo.type = DRM_XE_TOPO_EU_PER_DSS;
>>>+		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
>>>+			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
>>>+			DRM_XE_TOPO_EU_PER_DSS;
>>
>>have you considered setting both for backward compatibility?
>>And then highlighting in the documentation this duplication in the case
>>of simd16 and that that should be checked first?!
>
>that would be a silently break, with software utilizing the wrong number
>until someone noticed, probably after force_probe removal... and also bring
>the question: does it have N SIMD16 EUs + M SIMD8 EUs?

humn... if we decide to set both for backward compatibility, why not
rather go with v1 of the patch?  v1 of the patch documents that the EU
reported in EU_PER_DSS is of type X. Having both masks here doesn't
answer that question and requires that we always convert back to the
simd8 number (and eventually to the simd16 number) for newer platforms.

so suppose 5 years from now we have simd123 (using arbitrary/absurd name
on purpose to avoid people jumping to conclusions):  would we keep
exposing the simd8, simd16, simdX, fooY numbers for the sake of
backward compatibility with previous HW?  On the other hand, the
alternative means: if userspace X really supports platform Y, it has to
know about that type of EU if it's using that mask for anything.

So my preference would be, in order:

1) v2
2) v1
3) v2-with-forever-bc-between-platforms

Both (2) and (3) have the silent misbehavior in userspace if userspace
didn't adapt to new UAPI.

Lucas De Marchi
