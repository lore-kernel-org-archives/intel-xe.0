Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15583C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 04:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B655C10E1CD;
	Thu, 27 Feb 2025 04:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1eTMqyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A7610E1CD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 04:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740632083; x=1772168083;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=90zDWfbtlIMC/pNSfH4xlInfrBix28i1O4cyrMBOpOk=;
 b=F1eTMqyDhmsPbhWorAz/VknXMdF5LEysb06ehEhWRDr5pvlCnqLlozqJ
 GuQ3ivLSJjkZETlJncHS2pYqbvr6NzPqO5GOMrHyAOvy4tx589KNzBT11
 PDi+yAeq1JTaj9Q6C7t7DmI7dmYRDM27XofXn9sRB2qGlC7SIk+F3JGrO
 wmMppk7+yYTP07Qv1Fvr8So9NTItWs3UrxkFdDm4wU4AMHM7rHkw5E0HV
 8qtg2N4sFX/awSaFtaGPggT9p98EsbBCKzzCEMflu6/1Kz6XQDX7gDJkm
 KF3Z1Z9fbWJBCMzm8FHhWaZS827V75k0U4YNdpDv36hPBuotvlgEXwv0u Q==;
X-CSE-ConnectionGUID: 7e9albufQUmoCnRqlBU5Tw==
X-CSE-MsgGUID: 7frp/0l3R6yc0qTNiMuWFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45286503"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45286503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:54:43 -0800
X-CSE-ConnectionGUID: tMw4eoRDQV6JGIwKxBT4Tw==
X-CSE-MsgGUID: xR9W3XhYT1yBW3qh63PNkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117415033"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:54:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 20:54:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 20:54:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 20:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iurfClurnaXV6xAcR4fljRZ3jYf4X/gj6EstF2383dl4OZM6gyCj8d0yamvAZ9t5UJb6HZzpIHeX/04J4OsB1uXrFIbJWF4J+i8Sm0YtfWISr3E8hYJqv7L4xJ/Ug78t8lV8gb2MaK22rOHxegKYJuFMozSzg5Ti6gLzjXJ5de4jz57X+WYRViANtzv0VH2Hv1xJ5S29SkbJdvnE31NGiCAPnMqANinNcKcH0ihk1CTgbHTNIhOWiAv2Qp6OxUb/Ey0ONjhnzjXORw0tlOxZp8Mi2SZiLBD2HmNwTEA4EU7m5Fd0IHGlnAuEhV8spFHRY/N7QKjhQrjig6Cbc3jqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHTmdKf3ZqedUxRtnkw5GLUBwDtYZalzzwAcriEnzIM=;
 b=g0rH3by7QCPmWWCtErTI5CaZ4+dgOlSlLjYQPxbMuQDbfMcuMsy3S/bTWlc/yDkUvcauSXvb7Y6iUCGYFG2SYjlUsGSouN5wBdiU5iM//cLQO5dWbp6PZGG1/PxU0AnYBcZjP0qMFlDkts55jWRRFMj9qvcckT+vmCHYTBagVpG95fPb7BY4yZa47XpPXrCagbjX2OQgCjqrU7A8gb4Bs+oCM172sPErJhOuHmApFsxx9sCMqw/vMAVRA7ZbUnnAwaAhUQX1SEOEeZ/ubbW0xYbvXCk71u/x7Vq6osW3FSMS+usjZq2F691V28g7+5jVn1t5kwSYqcNDgdMEcM+NLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 04:54:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 04:54:31 +0000
Date: Wed, 26 Feb 2025 22:54:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Add performance tunings to debugfs
Message-ID: <646zlvkmyayh7jsgbxkwznx3pi2iv6xnubcjak3tie2akhynmq@32zf3g33s5yn>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226112106.28173-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c7b4c6-8167-4a86-5053-08dd56ead2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7mGfsFv/dkrCDzDpLPO1UJE7UUV8f0GVZI9JCirqFRVvQ8iCzEncH3pjrm5D?=
 =?us-ascii?Q?QABwo3fOyQVrvBTY3/0zRpyWvq01zO/MBP3A3EGhQVGxckTgp8PTga0Oc+/l?=
 =?us-ascii?Q?udmQkW4bH8iNkQdTCyHDBnlxMQnazQ8UJ2bHkY3xzhnXETeB/OELjl9Ho+24?=
 =?us-ascii?Q?8NtpCS4l6fNGkdGE6uW7Q/nqUQCJKoHJVxOOVVc2ncBNdh2ugtlvbxMyDtls?=
 =?us-ascii?Q?ZuIsFPXytFTJQpR+IahQ+ONstICMjWdhoh2AxXqppvBGSeG/CxyG3EKc+IUu?=
 =?us-ascii?Q?IDP46XCiAFg1o9O2qOHuyjK1f0uM22CWJ7h4CrwYpC5i4GyM/saYdoJ8NhcW?=
 =?us-ascii?Q?toByVQfM9duu2jRskaQb9hkKoULm9xRMP4HuZHPKNliwF3HQLLTH6lQutHiG?=
 =?us-ascii?Q?1j71+l5CYl4Uvn1r3WgXFN9bzahn1ZBF9iK1nq2zpbQIkcT9YlxACnA4XJ3f?=
 =?us-ascii?Q?2nDzda0O4hwISM/xyOAoB3TN1EJkqHF3S9foDi1o2B0DzkBHAcID0lqmTB+z?=
 =?us-ascii?Q?tJGCIoTJHbz8Jzzvxv0MDrtYsUC6HJFlzm3CozegW0o7BkoK6pTfnAD4u/qm?=
 =?us-ascii?Q?2IrjAafWPwiyl26ushz8/ld9KEfr5xT8vHq+K3RuO5u5LOGOc6zebyteSJpL?=
 =?us-ascii?Q?a70jKDK/J5cDVYI9gyAt3VaSgSinwBYgey4rZ3tMBRET4WBz4SJ3AO1z4/Rt?=
 =?us-ascii?Q?nS51+Fnt8C232IdZRwa7FaxZOkBsmT1QMDVckK0mjJHB7BcO4PO1qRUKbjch?=
 =?us-ascii?Q?qe/Ci178pm8V8xIpu3uwroBDEBrZnud+ev52Zc8Xadv2pq3ZhBQAIQozIV77?=
 =?us-ascii?Q?AU4dQoIGgLtkIs+cXPCwJa12S9aErdL8XPIg6cRfIWyNPgkrAAs8O70mMZD6?=
 =?us-ascii?Q?+1W6uzKJYFnARXp6RfDdVGVazwQDmK16Ik20WvAZKlglCHjB4vpEEaAMpvPe?=
 =?us-ascii?Q?G3i3GLx21f/jomIRhBwRQfMIxlgcAqMscI1k9AOeO+S5MnE1oJMIZKCsnJiW?=
 =?us-ascii?Q?lSiL8Ih923z+/Kmd8sb/DIM3vTsyLRALx7AfrJUZ4FuY+m78sX6yYR8IHeOg?=
 =?us-ascii?Q?UEQB4DWOTl5C0KMHQGD6i5TaMs9CJt9Ex2GNCXDZzIjyiYeRJ/bTJ4z+D6+Z?=
 =?us-ascii?Q?CaD251bEyLqBTzTShGyx4PyBKAkh8rtmWt4joLA+n/XTfUpVQeM5F1OShDCd?=
 =?us-ascii?Q?1703/JDLS4yB9O13uGFZJgnRROOcfxw4m8+Nia1PzRsD2Z2whhI8kRdrxhtk?=
 =?us-ascii?Q?cxQ07G0ZL18xb6DEy2c9uMrFVXDuaVqjfQenBWE2vCqPD3Jcy0VntM5Yso79?=
 =?us-ascii?Q?zHhhDh0lYEHPVXZ8Sc04IlRoAcTBvBw8R81naLUY+XULpaPfaWQOdBbacjI+?=
 =?us-ascii?Q?7tiVFZoC7XT6nW9TqAj6g9SELfNh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIWLfZn0I9XX3qUKmhoXYNNhILwrTLpnGZlE0e+bwh6FxihMiy+2mwV/umFf?=
 =?us-ascii?Q?Am/HtFb0Rh9MN0QdVPbQifG6DTclmOhrjevxJgDcvgxHGY2PypscrX2V0bIi?=
 =?us-ascii?Q?tQe7Zv9A70ryyejDUS/eO9BNXHXP2AyMkUIOdK+/w7DjjLFXGs1bL8N4rFk6?=
 =?us-ascii?Q?kFz49e3A3TwEoCeTw42IVaTy4+PuOllFtUcQoBHNNks3KMuwY60xquOCOAag?=
 =?us-ascii?Q?99n/IbdMdjYouXgDaneG/SNKvYADXtkY26LitMFOXCJ87TCP7m1Xlci4Mhau?=
 =?us-ascii?Q?JPSb3c9U3r9SRehGJ+e9OJ0gf1ueH0LIWgt4BrJ0Lf9kFAlZGy0psHvDvfkU?=
 =?us-ascii?Q?sdLeJuL94sd05jlOthG6XU1e4TzzAKT8fjwl6oln10HQQ2rGfT9fTS3Vnnvv?=
 =?us-ascii?Q?fb28PNVMC9aaIca3kPbD+9TUxbGCD6IrKXXRYJc8x3oXWDe3J1Fo3eZ+BRzw?=
 =?us-ascii?Q?poypaO7LOSIkLWk0Ohm8X44xdJ3DKWQxpL9vtesu+JQbU3kxL8FoD/SFusp1?=
 =?us-ascii?Q?eA1Hc3IeIdFbQMd1d3Be1l9klScYPhUkF4as4o4sQyLJVSEL/2ZnFKMgnsVI?=
 =?us-ascii?Q?zTRbK30ipD1W7onmLff6C0opgz1U6SHaqOI9aFU7AtCKQPDPQehFZWpAwnr3?=
 =?us-ascii?Q?YVU5fclL6JTABpwy2wHeWO4fPncr3cVaD0t6pfAc5mmk4w46WRBp4a69PTOZ?=
 =?us-ascii?Q?dnHZNxFaonmUktrFSXwzoLpyEPSHubhQy5cJJjgu6l07xRujwzM5mS/OnAIE?=
 =?us-ascii?Q?xpYR276LtBE058olyTkZWF3wVaNMnBtSZEyHZaPqJ8zTCATolvaJ9TQfV4Ok?=
 =?us-ascii?Q?tPWYHDelxCG15IIFnxgOfMxts/OB7D/ib4X09HGQ0eei24lRf56KhKPWWpZr?=
 =?us-ascii?Q?ZX+FRLXfmLcAOK6I5Lr3CbWZHNpHyHRXZ4/tlqHE+m0IwYUlsQaA0oeN+t+J?=
 =?us-ascii?Q?AxFsbxkhMTdzn2wxqvIheDyNnqUauu16T0FI7+HqrwHgeuIkASiIZgDXB9mF?=
 =?us-ascii?Q?pg96dhRGnzeu+BHW8Ja4f26VDY2c6BgFm15ojXWwmzOt0RBo7+EV+tJgcy66?=
 =?us-ascii?Q?xvdre2X5HBc5pRbLZtsWmqGdGxzlnb3hx1UdCHXgcpmnepGIUKOVRQ0w39yG?=
 =?us-ascii?Q?RI50+PpLefFbtU62+TaqhQrAqD3I2bEq7Op3kiva4P9+PsoO/iE6EI/V02Bm?=
 =?us-ascii?Q?Ir93zvISGEcLhWWugl4f8bC2pKKqvJhvfjLYwhv7QvHHmh52xxrde/g2Vrtt?=
 =?us-ascii?Q?2FvPoilTCE0zYR9rnzYl7mo5cE+j1Z7Qyoz4zk9x4jFxJvQkMI+1LMU9okSi?=
 =?us-ascii?Q?oFqFD1Ptxdxg3yzyAVFV2MnYdLgEA6MqMm4FA31f2hi45msAmCFgOe7VnBfh?=
 =?us-ascii?Q?nCJOVjzwpjhq/Bg2PFOKLRqhxSXJTHK7HHqa/niwi/MNn5pzwRgkRQcZ/UV+?=
 =?us-ascii?Q?lsx+hNoYr/IxUzCm/RivJbfxwjw6Vs6SfJhYPEYVP5jVqgSVTQgAmGXXdVnc?=
 =?us-ascii?Q?HdQegSeLBAIdQSS+fQGf82a3ykQLVB1IMWR9tNKAMz7210k/fT2wzBvCKulv?=
 =?us-ascii?Q?jrdOCMf8aflwCAKvIHOt/BmeRAS4hQZrMppGX4h1/EbHTjCx+GDRtiouiB3n?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c7b4c6-8167-4a86-5053-08dd56ead2ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 04:54:31.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lxAX41ufOeO65Wrp7UXPXFTpRnEhklsI7SNtUZ19xOw/jefGwDjkG6I/VNF1l70opGm/933m/6NfkF6UXNM+zqcprINz4LHovY4uzSXsf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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

On Wed, Feb 26, 2025 at 11:21:06AM +0000, Tvrtko Ursulin wrote:
>Add a list of active tuning workarounds to debugfs, analogous to the

s/tuning workarounds/tunings/

>existing "plain" workarounds list.
>
>Rationale being that it seems to make sense to either have both or none.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c         |  4 ++
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 ++++++
> drivers/gpu/drm/xe/xe_gt_types.h   | 10 +++++
> drivers/gpu/drm/xe/xe_tuning.c     | 59 ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tuning.h     |  3 ++
> 5 files changed, 87 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index d59c03bc05b7..cd5b14e38051 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -361,6 +361,10 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>+	err = xe_tuning_init(gt);
>+	if (err)
>+		return err;
>+
> 	xe_wa_process_oob(gt);
>
> 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index e7792858b1e4..2d63a69cbfa3 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -30,6 +30,7 @@
> #include "xe_reg_sr.h"
> #include "xe_reg_whitelist.h"
> #include "xe_sriov.h"
>+#include "xe_tuning.h"
> #include "xe_uc_debugfs.h"
> #include "xe_wa.h"
>
>@@ -217,6 +218,15 @@ static int workarounds(struct xe_gt *gt, struct drm_printer *p)
> 	return 0;
> }
>
>+static int tunings(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	xe_pm_runtime_get(gt_to_xe(gt));
>+	xe_tuning_dump(gt, p);
>+	xe_pm_runtime_put(gt_to_xe(gt));
>+
>+	return 0;
>+}
>+
> static int pat(struct xe_gt *gt, struct drm_printer *p)
> {
> 	xe_pm_runtime_get(gt_to_xe(gt));
>@@ -300,6 +310,7 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>+	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> 	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> 	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 6e66bf0e8b3f..dd2969a1846d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -413,6 +413,16 @@ struct xe_gt {
> 		bool oob_initialized;
> 	} wa_active;
>
>+	/** @tuning_active: keep track of active tunings */
>+	struct {
>+		/** @tuning_active.gt: bitmap with active GT tunings */
>+		unsigned long *gt;
>+		/** @tuning_active.engine: bitmap with active engine tunings */
>+		unsigned long *engine;
>+		/** @tuning_active.lrc: bitmap with active LRC tunings */
>+		unsigned long *lrc;
>+	} tuning_active;
>+
> 	/** @user_engines: engines present in GT and available to userspace */
> 	struct {
> 		/**
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index 454ee00ef45f..03fffd208483 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -7,6 +7,8 @@
>
> #include <kunit/visibility.h>
>
>+#include <drm/drm_managed.h>
>+
> #include "regs/xe_gt_regs.h"
> #include "xe_gt_types.h"
> #include "xe_platform_types.h"
>@@ -151,10 +153,44 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> 	{}
> };
>
>+/**
>+ * xe_tuning_init - initialize gt with tunings bookkeeping
>+ * @gt: GT instance to initialize
>+ *
>+ * Returns 0 for success, negative error code otherwise.
>+ */
>+int xe_tuning_init(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	size_t n_lrc, n_engine, n_gt, total;
>+	unsigned long *p;
>+
>+	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_tunings));
>+	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_tunings));
>+	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_tunings));
>+	total = n_gt + n_engine + n_lrc;
>+
>+	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>+	if (!p)
>+		return -ENOMEM;
>+
>+	gt->tuning_active.gt = p;
>+	p += n_gt;
>+	gt->tuning_active.engine = p;
>+	p += n_engine;
>+	gt->tuning_active.lrc = p;
>+
>+	return 0;
>+}
>+ALLOW_ERROR_INJECTION(xe_tuning_init, ERRNO); /* See xe_pci_probe() */
>+
> void xe_tuning_process_gt(struct xe_gt *gt)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>
>+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>+						  gt->tuning_active.gt,
>+						  ARRAY_SIZE(gt_tunings));
> 	xe_rtp_process_to_sr(&ctx, gt_tunings, &gt->reg_sr);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>@@ -163,6 +199,9 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>
>+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>+						  hwe->gt->tuning_active.engine,
>+						  ARRAY_SIZE(engine_tunings));
> 	xe_rtp_process_to_sr(&ctx, engine_tunings, &hwe->reg_sr);
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
>@@ -179,5 +218,25 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>
>+	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>+						  hwe->gt->tuning_active.lrc,
>+						  ARRAY_SIZE(lrc_tunings));
> 	xe_rtp_process_to_sr(&ctx, lrc_tunings, &hwe->reg_lrc);
> }
>+
>+void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>+{
>+	size_t idx;
>+
>+	drm_printf(p, "GT Tunings\n");
>+	for_each_set_bit(idx, gt->tuning_active.gt, ARRAY_SIZE(gt_tunings))
>+		drm_printf_indent(p, 1, "%s\n", gt_tunings[idx].name);
>+
>+	drm_printf(p, "\nEngine Tunings\n");
>+	for_each_set_bit(idx, gt->tuning_active.engine, ARRAY_SIZE(engine_tunings))
>+		drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
>+
>+	drm_printf(p, "\nLRC Tunings\n");
>+	for_each_set_bit(idx, gt->tuning_active.lrc, ARRAY_SIZE(lrc_tunings))
>+		drm_printf_indent(p, 1, "%s\n", lrc_tunings[idx].name);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
>index 4f9c3ac3b516..dd0d3ccc9c65 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.h
>+++ b/drivers/gpu/drm/xe/xe_tuning.h
>@@ -6,11 +6,14 @@
> #ifndef _XE_TUNING_
> #define _XE_TUNING_
>
>+struct drm_printer;
> struct xe_gt;
> struct xe_hw_engine;
>
>+int xe_tuning_init(struct xe_gt *gt);
> void xe_tuning_process_gt(struct xe_gt *gt);
> void xe_tuning_process_engine(struct xe_hw_engine *hwe);
> void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
>+void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
>
> #endif
>-- 
>2.48.0
>
