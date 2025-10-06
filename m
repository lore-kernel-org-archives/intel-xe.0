Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01208CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 19:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D2A10E12D;
	Mon,  6 Oct 2025 19:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ve8f8AlH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FEB10E12D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759780746; x=1791316746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WOp9JpSZIOFWKCgFLwNevR4EVwSaqwLejmMkzqPGxW8=;
 b=Ve8f8AlHThpy6yM5fougNImNp2wzEzWvHuCdn9bXqkhOYPG8L7FwmXzh
 VS5GI4rP3sPgMPn3rpNjleEJK0oxEYZMTVENcTkQXn7+klFr5pHN4Ioca
 6oFdowpbLX9STL63T/f34LJ+DU5cmxYfcG50KevfkdIwlaYkhhf1YUpBW
 4BOJosUU9C8SP19T8u5JW31bELxcqKfl9JvBW/IdE3XRpAnc2VA45IyXj
 tyBmxIas/WFjIsOBDBAlmQODVnFbwKmjsHfsXEyX+e9x3NwAoMoKQamZH
 PsljuQ9ETAGNXsysijg7Oj+Cy5qpdyuP8gq8GzDCCWNklHpkH4+rrOPbE w==;
X-CSE-ConnectionGUID: 4SDOa3YaS2+A7uLHN0epqw==
X-CSE-MsgGUID: 2gQaZeCUTC2SZ9hg5jXDfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72636834"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72636834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:58:52 -0700
X-CSE-ConnectionGUID: z5poYGdHRd6/1WAq3IQJYw==
X-CSE-MsgGUID: TzRKwg1hRueLnivbd0rIYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185132161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:58:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:58:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 12:58:51 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJM3BRdOmvRnXJbhv2wsGBXnVtJO6vJvEHww2pqJdZuMOAAlvoRFiZqiv3oEJZxRm/eUWeFRRhRpalVMPj3JBfQIz92XaZcv+Q1X4VHT7Wb3b1nS0FAr5mXV7D9zc0upuq4XWid0Py8UMGO7P7w4Q2My5ZTji4bK43CAdFLGhg/hlg5cTotJphwZpmWOXvcaikLVExXCKHHpNp9pu5VEt40U5i94kENU+a2TMo9BfZvcIEXEqxumdkoX6wAtpy3VfVJ7z4OpCOIS48a34alsLgjzWeYmNJgiiZc5QOYiQ0PeiqP4FuNS6ZihLjVDMpA3p9MKwh7n9Sh6oB96HHfOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TPaQ3xVwJVByey5iBSRLwhih4HHoyE34KKrfvCpvsk=;
 b=OH4PWkJnwcQsdqIsQxnKDHpXjV5bA5/aF2ASnuSHNLQWwE0IaTad4py4Jzc2nSXFsjgbjX4sXtOSdGyubrNKWX6VT8snwgBm9WDdalI1pD0KWluuV3GbnpGW7/mUIpViO0IjdOELUvVPyq7oqqOpd5M2+koyOK56ecVoexVolUoykZk+CrKDjoHGHkbH+JJoVxjyuUcrHQD3tSqUUUUqsTb2KbJcuXM4YsLiLOoXbtl/MpkGDWhBwE8Noz1cR3fvPKFP3VkMxTmdmJHMmE6uOpll/CfpiiyFxMBWa+q1cTrFT1ec/3v3zeEXNknVxz07ABo0Qkeempl15O5YfKxDBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:58:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:58:44 +0000
Date: Mon, 6 Oct 2025 15:58:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Add max_vfs configfs attribute to control PF
 mode
Message-ID: <aOQfcQ8YhgvkB3Yc@intel.com>
References: <20251002232648.203370-1-michal.wajdeczko@intel.com>
 <aOA2n4npjuprZ1hD@intel.com>
 <a148cc9f-b20e-4c93-9977-83d6ba12d379@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a148cc9f-b20e-4c93-9977-83d6ba12d379@intel.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ad8d70-cd5e-4ff0-49e4-08de0512c12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VygffcyWUbShIDX8QfR4vDJjvv1TXmM1FZvpcWgUE7AwmDNB0uSP/jDuhPmo?=
 =?us-ascii?Q?UQnfBp+U8C6tK363uGUlaHhklGtuZKXncdszN4GIAFuzfeQp1B3NUout1V/d?=
 =?us-ascii?Q?hmMdqfB8JKW+7scvksAatTYcSIkzz3ih1TqsFDTWqiUC0X8AyzHbXHMu7RLj?=
 =?us-ascii?Q?2ppr7qs6pTLZbJ797N5Z88au1n5GgiIGs9Rh8lgttkMHqpBJ47bA9nUpNg/Y?=
 =?us-ascii?Q?pKLi7kOsTWIJVix5wHoUsc3/Bv0yZzkKOVIpnj6ibyxSLIr+HnyVakKG4xJd?=
 =?us-ascii?Q?8axXiELUnJnyypE3cwpf7BQhCdRpchjCFTT4i4bqyZN72LALv+2rZ4iHEbUX?=
 =?us-ascii?Q?BrFmoBLYDlhvpe7lmoW21jgiqkhtmXDYiK1NBQxReGMh7XSI5EIeDYRtGd97?=
 =?us-ascii?Q?eHeuqILwyKQ0nskJsb9r6aaECu8Z6M+6YMMZYBdrdv+/MeYK8fbFXkhB/8/V?=
 =?us-ascii?Q?nd6sV9oOIhIIvsgd1MrG17K22xVPtgvZijcBQQUHtoPM5ejZqCdd2N9LtLz7?=
 =?us-ascii?Q?Uy8RBrQCanLkmwaU4mwtp1euwt/04RP4j0f/F11qyYgUUGpWtiawwVN7zj47?=
 =?us-ascii?Q?2I85aohGxZJjlcVTU0Eg+X5LMYEzNOsR8oT76e2bx2dMvmfdN1Qp7NCcm15y?=
 =?us-ascii?Q?Rhk8pp8JAxWqpuCnT0iiy5TPuljIL/QY02pv5H34GvyYYvho8piiE3pEIlFC?=
 =?us-ascii?Q?+f+nlv/E44L6wm7+6qy6Qf7VgHGWSxnDXNpOVfA650kzMnfzAW1ghjNrtzQ1?=
 =?us-ascii?Q?OJ1NOjeK8t21PHHF/Bb8eZMxGsLbd11hsoBe5y1a00/DH9dxCyg+QUjslUtU?=
 =?us-ascii?Q?6WNAeZ1kA6La/WxICljOL+uHvOmqWLnnGC8/SiYMjCBD66l63NreV61hHHUd?=
 =?us-ascii?Q?C+FConoCNOWoQIJlROa9Qs+dKDaSLwT7F9DFAHcAGABcc/BiuUp23m8rZw/5?=
 =?us-ascii?Q?xGcL55iJ3NXddfRPb9oZ2BljOKUWbpE2J63OqVBiKoY4Bcxb99iuRgd+qUS+?=
 =?us-ascii?Q?hH5/ZPZtHDLAH/ZOCrJ00bkbGP3+xWn6wzL2mdfNvQ8PjPEnr3hIZ127U5ov?=
 =?us-ascii?Q?C3fBOYIA2gDfCKe2fTbXxnYBiYnRnfFVh9qF6eDfF7n50kTYoU2xmTEjWyFO?=
 =?us-ascii?Q?EgScA8fIQVNL7ILmkVoIbMfpawHVpzIJLEXt0QGjiT3TBP++iYmEpVbLtMB6?=
 =?us-ascii?Q?uS/bk6vsw931g5sKIr1XFQo6VEgdqNvXsXOg1QxRBDyVI8e7l7YnuwgML1Xc?=
 =?us-ascii?Q?33otkH0J+W2IfvT5ZwQKKQehYex0mMrsTcADoGJrhDz7K0d3DYCV04CYpuWd?=
 =?us-ascii?Q?oYc0fY/ZJaeFLUydxESYDpPxeZPhIti9c0u+s6OM6DKCt5VQpqiq46TOeuj/?=
 =?us-ascii?Q?uRRqrQeMQ2bV50G7QYJUucG1f2Fnv7NQcDF/A9790nslSiZROqOSpldAGv68?=
 =?us-ascii?Q?IvN/KiLbVquCX2793yqptHaqO9SnUCzd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIwtuIWDl7/l/7RsvDi4zUjUb3eaGjyz+3n2UKaXCogr9FYHEZzwIuNQPpZH?=
 =?us-ascii?Q?VJEYlYu7kXflocLsfI0SefYHt1Cc9aBjJYo5KXyr0zlBQFgj3T5HWG8MLmqM?=
 =?us-ascii?Q?3E+ttL7+aJUj3YVdjculrJWNOs6Yw6y6Pq27F9NRqnlihQVBIi2J7NuUIG42?=
 =?us-ascii?Q?3zuvIcgwrIXLIo9S6vSxM0AG/3Ngs14jjGXtaWm9LndJy434zIAWyUzfE8Z9?=
 =?us-ascii?Q?y+vfUrrrGt0tnjUUozG6ySsxqvKFtXvw7LBPx74dvOQrhKZ/ormKiK3rMRit?=
 =?us-ascii?Q?/Jx/i+f+p6ZX/GWgMh5/cAQ/ZEAz/8jCp0fkm2eyc7HHdNh8Au9y4sKXzu+I?=
 =?us-ascii?Q?D6ZBfM5bO4GySSd2qMuZG9zejDBCTves4EQD8n3wU+uoTurj0TVSg858wyDH?=
 =?us-ascii?Q?jy2cbhCqXpYrbfOfWGJHNXMiLkNUAYPDRGEhfALe/0UIqpvSCfnLyVFZjn1k?=
 =?us-ascii?Q?I6AMoEwOgm7r6JiYZRAfQwcgM/fy1oFu8mVnNwnZqNpu3kc9DXaCR1QsnghJ?=
 =?us-ascii?Q?ay4TUYxi2zfND0DdsNS65+8S+xJhDphhZ/IgVqP/VHqDlhU+NJyQuLJ+A8gk?=
 =?us-ascii?Q?1g4VHmLEGRiZQVSsVmES8vqWILMJUWWVlBMCV6k09b13Rf/Fy3RV8dpccbll?=
 =?us-ascii?Q?7kOX2o59aJ3vrYa7S2uHDbg6jQTZLh21wnoRhe/tDBOjWk76/zQCQaAsjRn6?=
 =?us-ascii?Q?nRmaIHR5coFUSWa4HbBRbkwzpx+AlO7yNlTr6Vb2BFADwRetZaQzXFQveDJb?=
 =?us-ascii?Q?y3S07WW2hrG329lN5gZkcjcybKpNsFnkVnfpWiho7UwgkJkm/u287zWOIMWc?=
 =?us-ascii?Q?TUckC6MYulia5fp0DMST52Qtldv7CV6Eeie5U3ayaMCLuvIRa3KEqipd5qoo?=
 =?us-ascii?Q?WQbnTlO/WvKGBnic690447uGQFr90O8X1ommndHUYdpXVS8nSWiyjhkdZrsI?=
 =?us-ascii?Q?EO9OZINR6mauuU2jZ5utCU+8gKgcU0Qve3SBi/5KUQy/9SuOPDjuyHFbXGuP?=
 =?us-ascii?Q?rLs4Ve47udWL6qtIbitlpryPuYpi6E9jqzbofsBYdKPN88uVqouaA1ytOGVU?=
 =?us-ascii?Q?izlNAnLLa0zbvraZfP7r57DT23a7fa1nOk6oeqPh6yN21xaykvXCdjQyRK7k?=
 =?us-ascii?Q?gJ+FbDN9/XnlaQAFdXMW2FnF3VuHgnB3egb+LLaw3UGrk38QBbHBbU3GLI/Y?=
 =?us-ascii?Q?nGT3m8hgTgzyE/YFG1O/2gXkpC7WsjPkv9RiHRxsyA0IScZNkGZ/AGizrOpk?=
 =?us-ascii?Q?XyucjeNjUJ2khWvoCRr1NO5qipqvab8aB1JD+uxUEk++UvpbcYdHKiHmV03J?=
 =?us-ascii?Q?on/sompvDQO4n4V/0lwEMluDk1LWq4jwQCRKMuWlCTPexoJ6aW/1gW0JMTD+?=
 =?us-ascii?Q?a6OswchS/upL8IsUdnObPDShSZpjMg4rBWrt2L5IKlA27lEzYTzScqALi7rt?=
 =?us-ascii?Q?5dYtDmj6e+jG8YkBdKZmJvYW0JkphU+ERV5xM6+jnJ/5PeoNYHNwr9eN5GLY?=
 =?us-ascii?Q?6VtgtAmmkRjxkhSiVZVDGjGQW2fLCNHyPuTNF96CDPkrdpx+x0p7XrJt/c/j?=
 =?us-ascii?Q?Al+r/2/kEqmbmXa1J3vrQVEIveRdmT7f/UPpjYzZZEcXlI1+VxCqu/5LWFPx?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ad8d70-cd5e-4ff0-49e4-08de0512c12d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:58:44.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5BJLEvNUWGTDaJ4DzE91bFyBcbvrlYiWpQa1hbYl1wFZumSWvexzIkhVQq87nicysBsJjveZ5RqiXGWohSQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
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

On Fri, Oct 03, 2025 at 11:06:21PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/3/2025 10:48 PM, Rodrigo Vivi wrote:
> > On Fri, Oct 03, 2025 at 01:26:48AM +0200, Michal Wajdeczko wrote:
> >> In addition to existing max_vfs modparam, add max_vfs configfs
> >> attribute to allow PF configuration on the per-device level.
> >> Default config value is still based on the modparam value.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_configfs.c | 139 +++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_configfs.h |   4 +
> >>  drivers/gpu/drm/xe/xe_sriov_pf.c |   3 +
> >>  3 files changed, 146 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> >> index 139663423185..464a79c2a903 100644
> >> --- a/drivers/gpu/drm/xe/xe_configfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> >> @@ -18,6 +18,7 @@
> >>  #include "xe_hw_engine_types.h"
> >>  #include "xe_module.h"
> >>  #include "xe_pci_types.h"
> >> +#include "xe_sriov_types.h"
> >>  
> >>  /**
> >>   * DOC: Xe Configfs
> >> @@ -169,6 +170,32 @@
> >>   * Currently this is implemented only for post and mid context restore and
> >>   * these attributes can only be set before binding to the device.
> >>   *
> >> + * Max SR-IOV Virtual Functions
> >> + * ----------------------------
> >> + *
> >> + * This config allows to limit number of the Virtual Functions (VFs) that can
> >> + * be managed by the Physical Function (PF) driver, where value 0 disables the
> >> + * PF mode (no VFs).
> >> + *
> >> + * The default max_vfs config value is taken from the max_vfs modparam.
> >> + *
> >> + * How to enable PF with support with unlimited (up to HW limit) number of VFs::
> >> + *
> >> + *	# echo unlimited > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> >> + *
> >> + * How to enable PF with support up to 3 VFs::
> >> + *
> >> + *	# echo 3 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> >> + *
> >> + * How to disable PF mode and always run as native::
> >> + *
> >> + *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
> >> + *
> >> + * This setting only takes effect when probing the device.
> >> + *
> >>   * Remove devices
> >>   * ==============
> >>   *
> >> @@ -185,6 +212,7 @@ struct wa_bb {
> >>  
> >>  struct xe_config_group_device {
> >>  	struct config_group group;
> >> +	struct config_group sriov;
> >>  
> >>  	struct xe_config_device {
> >>  		u64 engines_allowed;
> >> @@ -192,23 +220,34 @@ struct xe_config_group_device {
> >>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> >>  		bool survivability_mode;
> >>  		bool enable_psmi;
> >> +		struct {
> >> +			unsigned int max_vfs;
> >> +		} sriov;
> >>  	} config;
> >>  
> >>  	/* protects attributes */
> >>  	struct mutex lock;
> >>  	/* matching descriptor */
> >>  	const struct xe_device_desc *desc;
> >> +	/* tentative SR-IOV mode */
> >> +	enum xe_sriov_mode mode;
> >>  };
> >>  
> >>  static const struct xe_config_device device_defaults = {
> >>  	.engines_allowed = U64_MAX,
> >>  	.survivability_mode = false,
> >>  	.enable_psmi = false,
> >> +	.sriov = {
> >> +		.max_vfs = UINT_MAX,
> >> +	},
> >>  };
> >>  
> >>  static void set_device_defaults(struct xe_config_device *config)
> >>  {
> >>  	*config = device_defaults;
> >> +#ifdef CONFIG_PCI_IOV
> >> +	config->sriov.max_vfs = xe_modparam.max_vfs;
> >> +#endif
> >>  }
> >>  
> >>  struct engine_info {
> >> @@ -721,6 +760,68 @@ static const struct config_item_type xe_config_device_type = {
> >>  	.ct_owner	= THIS_MODULE,
> >>  };
> >>  
> >> +static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
> >> +{
> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> >> +
> >> +	guard(mutex)(&dev->lock);
> >> +
> >> +	if (dev->config.sriov.max_vfs == UINT_MAX)
> >> +		return sprintf(page, "%s\n", "unlimited");
> >> +	else
> >> +		return sprintf(page, "%u\n", dev->config.sriov.max_vfs);
> >> +}
> >> +
> >> +static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
> >> +{
> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> >> +	unsigned int max_vfs;
> >> +	int ret;
> >> +
> >> +	guard(mutex)(&dev->lock);
> >> +
> >> +	if (is_bound(dev))
> >> +		return -EBUSY;
> >> +
> >> +	ret = kstrtouint(page, 0, &max_vfs);
> >> +	if (ret) {
> >> +		if (!sysfs_streq(page, "unlimited"))
> >> +			return ret;
> >> +		max_vfs = UINT_MAX;
> >> +	}
> >> +
> >> +	dev->config.sriov.max_vfs = max_vfs;
> >> +	return len;
> >> +}
> >> +
> >> +CONFIGFS_ATTR(sriov_, max_vfs);
> >> +
> >> +static struct configfs_attribute *xe_config_sriov_attrs[] = {
> >> +	&sriov_attr_max_vfs,
> >> +	NULL,
> >> +};
> >> +
> >> +static bool xe_config_sriov_is_visible(struct config_item *item,
> >> +				       struct configfs_attribute *attr, int n)
> >> +{
> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
> >> +
> >> +	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
> >> +		return false;
> >> +
> >> +	return true;
> >> +}
> >> +
> >> +static struct configfs_group_operations xe_config_sriov_group_ops = {
> >> +	.is_visible	= xe_config_sriov_is_visible,
> >> +};
> >> +
> >> +static const struct config_item_type xe_config_sriov_type = {
> >> +	.ct_owner	= THIS_MODULE,
> >> +	.ct_group_ops	= &xe_config_sriov_group_ops,
> >> +	.ct_attrs	= xe_config_sriov_attrs,
> >> +};
> >> +
> >>  static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> >>  {
> >>  	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> >> @@ -746,6 +847,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> >>  	unsigned int domain, bus, slot, function;
> >>  	struct xe_config_group_device *dev;
> >>  	const struct xe_device_desc *match;
> >> +	enum xe_sriov_mode mode;
> >>  	struct pci_dev *pdev;
> >>  	char canonical[16];
> >>  	int vfnumber = 0;
> >> @@ -762,6 +864,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> >>  		return ERR_PTR(-EINVAL);
> >>  
> >>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> >> +	mode = pdev ? dev_is_pf(&pdev->dev) ?
> >> +		XE_SRIOV_MODE_PF : XE_SRIOV_MODE_NONE : XE_SRIOV_MODE_VF;
> >> +
> >>  	if (!pdev && function)
> >>  		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
> >>  	if (!pdev && slot)
> >> @@ -796,9 +901,15 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> >>  		return ERR_PTR(-ENOMEM);
> >>  
> >>  	dev->desc = match;
> >> +	dev->mode = match->has_sriov ? mode : XE_SRIOV_MODE_NONE;
> >> +
> >>  	set_device_defaults(&dev->config);
> >>  
> >>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
> >> +	if (dev->mode != XE_SRIOV_MODE_NONE) {
> >> +		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
> >> +		configfs_add_default_group(&dev->sriov, &dev->group);
> >> +	}
> >>  
> >>  	mutex_init(&dev->lock);
> >>  
> >> @@ -988,6 +1099,34 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> >>  	return len;
> >>  }
> >>  
> >> +#ifdef CONFIG_PCI_IOV
> >> +/**
> >> + * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
> >> + * @pdev: the &pci_dev device
> >> + *
> >> + * Find the configfs group that belongs to the PCI device and return maximum
> >> + * number of Virtual Functions (VFs) that could be managed by this device.
> >> + * If configfs group is not present, use value of max_vfs module parameter.
> >> + *
> >> + * Return: maximum number of VFs that could be managed.
> >> + */
> >> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> >> +{
> >> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> >> +	unsigned int max_vfs;
> >> +
> >> +	if (!dev)
> >> +		return xe_modparam.max_vfs;
> >> +
> >> +	scoped_guard(mutex, &dev->lock)
> >> +		max_vfs = dev->config.sriov.max_vfs;
> >> +
> >> +	config_group_put(&dev->group);
> >> +
> >> +	return max_vfs;
> >> +}
> >> +#endif
> >> +
> >>  int __init xe_configfs_init(void)
> >>  {
> >>  	int ret;
> >> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> >> index c61e0e47ed94..16a1f578e4fe 100644
> >> --- a/drivers/gpu/drm/xe/xe_configfs.h
> >> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> >> @@ -23,6 +23,9 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
> >>  				       const u32 **cs);
> >>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> >>  					const u32 **cs);
> >> +#ifdef CONFIG_PCI_IOV
> >> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> >> +#endif
> >>  #else
> >>  static inline int xe_configfs_init(void) { return 0; }
> >>  static inline void xe_configfs_exit(void) { }
> >> @@ -34,6 +37,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
> >>  						     const u32 **cs) { return 0; }
> >>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> >>  						      const u32 **cs) { return 0; }
> >> +static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
> >>  #endif
> >>  
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> index 4698348c010a..428b1b62cf48 100644
> >> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> @@ -8,6 +8,7 @@
> >>  #include <drm/drm_managed.h>
> >>  
> >>  #include "xe_assert.h"
> >> +#include "xe_configfs.h"
> >>  #include "xe_device.h"
> >>  #include "xe_gt_sriov_pf.h"
> >>  #include "xe_module.h"
> >> @@ -19,6 +20,8 @@
> >>  
> >>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> >>  {
> >> +	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
> >> +		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
> >>  	return xe_modparam.max_vfs;
> > 
> > I like the idea of the configfs, but this here is strange.
> > shouldn't be better to simply remove the modparam?
> 
> well, I just wasn't sure what will be our approach here, since all our
> current configfs entries were just new options, never existed before as
> modparams, while this max_vfs is the only new one config that previously
> was defined as modparam, that some users may still rely on.
> 
> so my approach was to use modparam value as initial default configfs value
> for all devices, or immediate fallback if configfs is not available

I had missunderstood the flow here. Thanks for the patience and all the
offline explanations.

> 
> just need a clear statement

Well, I'm afraid we don't have a clear one-rule fits all.

In this case here, as you pointed offline, if we have desktop case like
igfx, admin might prefer to set on boot and not depend on unbind for
setting the configfs.

> 
> note that there are few other modparams that should be promoted to
> configfs (like guc/huc firmwares) and I assume the same rule will apply

while on this case perhaps it is something that we want as a police for
the module and all devices, not a per device in the system.

So, let's move with this patch as is and we handle and evolve case by
case as needed and as it makes sense individually.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> >>  }
> >>  
> >> -- 
> >> 2.47.1
> >>
> 
