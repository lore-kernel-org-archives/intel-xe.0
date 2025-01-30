Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3525BC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 19:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF610E9C6;
	Thu, 30 Jan 2025 19:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Raz/DHRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725710E9C9
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 19:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738263884; x=1769799884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wH9zZivZJZNiQvx98neuRwsHUMzeZ/t1aSlOxBvliFQ=;
 b=Raz/DHRUqdUYgTcmwSnyBJhMP20Ens+IjHmTSMjkltxS9XB/pL+5Pvo0
 tRQ/tDWVTO8des/6xFTWxNyKBKQ8lyInL3ULY4IJlgnx4uziNsWAt5jRE
 rlDlnONLJXvDalXZ26C+AvZRa6b9bxVTTmdDziBJ8xEPuwPwn04SmsCAW
 at+gNHna+5SNjq2iAB1fyVSaUQTQyZ5QuDWQwWAaCAJn5Tp/qrP+PG/tY
 wDfLmLDX1pGX7i6FiJqTdv8IBBqLy0lVitRBtj1tIaX3ceJAy6Ec1CBPp
 KCdtS+Td5u0TqzKu36f0w4OgolmySvnlYoUlq3lVylHBWrsL0ZWw/GzVg Q==;
X-CSE-ConnectionGUID: FbZaq7FCQZ679CyDb5s7kw==
X-CSE-MsgGUID: /7go53seT1u8eCEFFTLYBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="41660114"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="41660114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 11:04:44 -0800
X-CSE-ConnectionGUID: MOLIkL6sQ7mWcN009pX1Vw==
X-CSE-MsgGUID: 8rBYu9/vSrelsOZkKtN8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109565522"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 11:04:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 11:04:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 11:04:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 11:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIoAN0kjZ2fkmg5zGBV/N/JqTCmBVhFLkyocpf6vym5U4NcZz92HC+sgvHuK4vnaUqwZKTKdno+KJP9H3ig9hfR5SXNiaV8ehqiqZe+nrSVtI9tREfw8Bpwk0+03klZgnEil1AW6dJeMkN3cAEwKSh2FEZkvWCTxvOJhrKW93uqgvODqlTQBHQeF7vyNcucMYh5sdD1k28QE67cuKfC5CPx91tYq55P+slVqxKQ25FMOPacxbQZWYNkYAOgCJ1F4k9C3Foqsaoh/A7U5yZI/VotzefkwUwPWZlvqKfaXecONxDpu2/lNhmVKLt+yLLVtlk3P703IQMmfiq0A/SNkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K9RYtoM0k95wQlrCq7YXWMrUpLfRMxEmS56fM7Zdp4=;
 b=JLb9/CDXMyGu2ZiVJnOu65jS85944RKrMPa+sr3xikjOCyuUiv2qqFyVP5Oxp0FqSJXahHosn0b2mKhhWskiPOoS1WK9wVvgyHBJNgUyKjCByH8OMqcjDBgbkCGjGWklPNR5/7Y5sEywg9GAReChA4lPYRaIsyDMfNIF5m+BUVuniqRFV/kc4si9082Z9UpG2ldKo275vQNetyzpyYqmQdoK4JWy7KRM8rRh2b8IMVJxurlwCKCrEoOJczSZ7WpfqPszAPsmTN4yt9Pmu40KAlusFFpdXJI0XHCpZUMBp8OqieSpytTEknmbGoKGjW1057gRlhxY5UrBpsqnoN+NwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Thu, 30 Jan
 2025 19:04:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 19:04:00 +0000
Date: Thu, 30 Jan 2025 13:03:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add xe_mmio_init() initialization function
Message-ID: <rolgcctzdo3r5q56hsheiqwzetguoy3ros3n7ex4u5o42jwv5t@gksuwkujhjmu>
References: <20250130105057.136586-1-ilia.levi@intel.com>
 <20250130105057.136586-2-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130105057.136586-2-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR03CA0317.namprd03.prod.outlook.com
 (2603:10b6:303:dd::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 506292be-f0d0-470b-6ea1-08dd4160daaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZaf+MPS2pKn1HJXgqH9nWQSAgi4X2hHksm9N09u+i8GyHqlFVwBz8mzxF2N?=
 =?us-ascii?Q?FHXlvKzwSnCyUgELk7Jz7rGoM24hYzMTcuMdc+ceED1Kdu+DEGmXs9MrKshO?=
 =?us-ascii?Q?mYnM3SJ5iknyztOL/RXnM/z0aaa7h79xLr6vSKsC4QsCHyFrhGfqzWXJxSr4?=
 =?us-ascii?Q?pkJxw+IcYKuTNoQHtpC1fpBIf0l46Xp3C1ZhWWKvaTs+4X5iDEKTsskUEHLY?=
 =?us-ascii?Q?meHI4dQfAXG7TYWjI/3S5UM1RZCcaelYEKPo8D8AE9sdoXVibOdxD5xLLRpn?=
 =?us-ascii?Q?w/Pd+NDExZbw4z+L4ASDfD0cCxW3THOjW8z78r+2OqrYCikPzQ8FN+hdJfMt?=
 =?us-ascii?Q?zuZhy9CnnWgvYh2oivh480XFJ4t10d80SnIW2GNIv6sIW6xEN/tHOH6IPug3?=
 =?us-ascii?Q?Nvh43dy3cFTVGAsfrswxQeF7Zm8kmsSwluhkz5sU9GkTX4G/LUnIGMNnJRB0?=
 =?us-ascii?Q?AdplpNGSmPCHrxpD3+6Ox1szE/QqQ8n4kEwdYuJQG/AiwrgJnRptkxQq62ZK?=
 =?us-ascii?Q?wtzGYLl6EYIllIRGs8Kbxjm+FvqWcR3TmxLj3VkLpAcPT+lNN50/M22mAqvo?=
 =?us-ascii?Q?dX6Yy++egCS4QUAcU2IhCVdYs3OGGNhW0ckccY9fHIDA81FiITT5RyLALBtO?=
 =?us-ascii?Q?nwaV1AnzajYJHh3AyqFqOTbluid2+0Q6TTd7ZtW7SOk6jECKeY6EZbpYjT/T?=
 =?us-ascii?Q?jM24LbHbV0B93fTv2lM/iJYqahNKX3IF/PXqnRYrnz5SunZV9j9cC68CCdbT?=
 =?us-ascii?Q?6JJLIyLGXZBHFStyJXhRjhOOteTTwleH6A7cjqPbh0KmgdaE75n9HIQbV+hK?=
 =?us-ascii?Q?n3QVMA/xYoSmveYgD3uaH/Qq/DWPkfTQTHVzSxYzuvDVV2y4k/TS07UzfQ0y?=
 =?us-ascii?Q?K75pRBCdwv9JNKZGf3XB4L9zXDt4fRAvRv770JqEMOopUxiBwUatWY0SsWlt?=
 =?us-ascii?Q?j6fULCg3wl8KhcI8pZo8QN2r7jqUVFcK1MuQFUl1u9JgFUXmC6lB1U/SLKTQ?=
 =?us-ascii?Q?nnIERycxOQwO5ANjaYStjyIOI5WBRzEiyYqu+2dBmC1MRnKSwWmUs/YBvwtH?=
 =?us-ascii?Q?/Qw0/8xFuqsfzZXoMi5PL+RjwE36aER8BVsud61q5KXzFewuPGRV/Ryv70hX?=
 =?us-ascii?Q?TDe4OPsTYGxqMpKqdfRg/WIa+2wZ+0K0jQqRmtcjD7a/lBm9jXKVsB0zPl/9?=
 =?us-ascii?Q?5nrmdFtWpFkdrydxGnr3U+1azQWdLQi9juDAaBudcD881IHyTwVrcKUC6f8D?=
 =?us-ascii?Q?ynwFmR7Y75sV4QrbXex4HM+qLOYT5KXxhmR/HqvUPsH2R7JTLJFCMC5qf3pQ?=
 =?us-ascii?Q?GyHPvUuLLVGXWrQuzVWwG2aeoxTUXGqbOSf+939IyAa0F2UhHyC/kKZoAMrg?=
 =?us-ascii?Q?tiG7zOCNeJ3wVrZteBsLuT5RQeblhOq/NrHpUaFBsKZtjTthVBZTww957epn?=
 =?us-ascii?Q?2k8sQChpvhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FrG7dPdZN6zKrYhGYphw/b5N+m00JfBHOA9wOFy+RreeYFuFL4joaJT5q0j5?=
 =?us-ascii?Q?o3Bxy79QVCPN8OneRVmJMdXxmVqJOWxBdl0eYt05KiGPtJrdlshz159vRD88?=
 =?us-ascii?Q?pLm5Ql7a2J4Di21ACxO6OaFQ9Yl5f4rxgXIHJkCoiicEPGYBjPRdlzhSAQZC?=
 =?us-ascii?Q?K4y/c3tRK5CFrmu8kGtB5c6hEJIZk4FyRt7JPMTu1340J7iU7gvSglLaCUfx?=
 =?us-ascii?Q?6jPVPvT/Gkqx9aOmWQ+Tu4NoP8n22SzmK5x/QvAbZKVN0Vp7NjGM/ZkOcwOZ?=
 =?us-ascii?Q?Y5U3ZYvn40avlDgmjnjPxrLBcWOCaiEFYlzdUBt6Lcz7P+eJaAMrn82oQY/o?=
 =?us-ascii?Q?zccGwsrgu4rwvLGnL1NxZW8cBIRMb4G/nsOoCM/RC+gSJFktziGzasE/7Xyn?=
 =?us-ascii?Q?R3e3nzsRBZvOjBbR+HLivRgPFKeyT1s4MrGvzhH1/0GcnLiSc5NM5bhvxrwK?=
 =?us-ascii?Q?Cs1SXJgXjCI/v0vS2So5ez9v7LjyawBO3gEuJOAxz6FFnYsXwATs9YkAQPBs?=
 =?us-ascii?Q?bV0ZnJIlyRC5Hhj9nE5LUmH3tbEvogUPHJcqhdUxWqgsczkhRsdbHgweliX2?=
 =?us-ascii?Q?8oWu0ZRPAJxOtNE5BcENear89EAgVg70W9pJ+wu/pkg2h7LGnPlpiLYKhnnM?=
 =?us-ascii?Q?PVdWZGNRRfsbk4w9HlbpwyQzhwDv4t4cjGeq7y3MZGEBehGHfiSs2Ph7+Guf?=
 =?us-ascii?Q?z2bA6JG9byhAOXNICKjoVMF9s5aILdjNIs/i0ha6CIehWJO94Ykg90xz/Hce?=
 =?us-ascii?Q?/NfhKxuY8FEs4eqdEBHuunASI1ZAyd/UtKYFsklh0dscLbjelqlxFqcK4YxC?=
 =?us-ascii?Q?M9yfHMd9xGHMfyZvids+dz2x0UsscuOxB3sappzrgwt3pbzTFBlg4Xjy3g+X?=
 =?us-ascii?Q?g2ggMDSXUL1KdhNY1fFVNQHA//+OwFT3PoLur6XtbwEBBolia+5s6k7j3tJH?=
 =?us-ascii?Q?qWAgsdUjbpdzJ+VtlEef8t0Hg6vzatpIycWGVUg7b7fn0GVECiVe+grGIzIZ?=
 =?us-ascii?Q?dPFOVM9WocMjXtSM65o3fetctbhaqOuexDbzoDjVKrcSCe5IEIs8uEdR01C6?=
 =?us-ascii?Q?xioe6CBTMWjQWGMPKDxzL3dc7VNnIzagNR0FJCsWDYvOsRiHNMxvGOChZGNy?=
 =?us-ascii?Q?nzWbZCI2Gp4/7235wX5bwSGOy8i8d9Z0KaOV/3uAITDg+6tXr9pvCmn1QCrA?=
 =?us-ascii?Q?xKbl7mBLAwYXfMvqbG/M98ANsMGQOeuTkcF7ZiVTcngVIbzvd1PmTnK4q0kX?=
 =?us-ascii?Q?GHhyK65qedvhzdhrl1oJrmpukMT8E8BSCUuDbPFeH5NZmskZP2dn+/vrYedr?=
 =?us-ascii?Q?gvj5NmTit4/xZsuxx5+kDr4tccQG3PyqwTtqW+Ifhd4MQbDakAuCm4SWC6CS?=
 =?us-ascii?Q?3czIJF+FibaihoZRmjGyu9REIdz6gkS2wrDP6mFOt9HJiMNrUjHqHSQ+XzT5?=
 =?us-ascii?Q?WvHPjGBURLRnJtyoKtZhW1Zppvqrb2iSGqNkqwu9wA8vpxB6PwViET6/V+28?=
 =?us-ascii?Q?4pMUSjrIYvc4ByNoQb/rkjDSP+PRJNYnNO/iKcijZ4ZNRj9TME3u8dXjaa0r?=
 =?us-ascii?Q?ZTMMGKX7FMCn8Yekhkcw/WbCtsl+o4ow6rrHrSnavNlryhLDEp1Q3dfDNHNR?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506292be-f0d0-470b-6ea1-08dd4160daaf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:03:59.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crLQId38EIof4vQPsSUFsFaXFtIxZvBLN7T10WhPlYUseq9d9MimbJVCQYNoifkUftjw8lAImQtRYLhFjfUHSyawEtPItOuPWc0tqfKjobU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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

On Thu, Jan 30, 2025 at 12:50:57PM +0200, Ilia Levi wrote:
>Add a convenience function for minimal initialization of struct xe_mmio.
>This function also validates that the space referred by this xe_mmio is
>small enough to be accessed with struct xe_reg.
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 +++-
> drivers/gpu/drm/xe/xe_gt.c            |  7 +++----
> drivers/gpu/drm/xe/xe_mmio.c          | 24 +++++++++++++-----------
> drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
> 4 files changed, 21 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>index 89716172fbb8..26d00d825454 100644
>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>@@ -10,6 +10,8 @@
>
> #include "compat-i915-headers/i915_reg_defs.h"
>
>+#define XE_REG_ADDR_WIDTH	22
>+
> /**
>  * struct xe_reg - Register definition
>  *
>@@ -21,7 +23,7 @@ struct xe_reg {
> 	union {
> 		struct {
> 			/** @addr: address */
>-			u32 addr:22;
>+			u32 addr:XE_REG_ADDR_WIDTH;
> 			/**
> 			 * @masked: register is "masked", with upper 16bits used
> 			 * to identify the bits that are updated on the lower
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 01a4a852b8f4..f10c1f5fbbe1 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -637,10 +637,9 @@ int xe_gt_init(struct xe_gt *gt)
> void xe_gt_mmio_init(struct xe_gt *gt)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_device *xe = tile_to_xe(tile);
>
>-	gt->mmio.regs = tile->mmio.regs;
>-	gt->mmio.regs_size = tile->mmio.regs_size;
>-	gt->mmio.tile = tile;
>+	xe_mmio_init(&gt->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>
> 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>@@ -650,7 +649,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
> 		gt->mmio.adj_limit = 0;
> 	}
>
>-	if (IS_SRIOV_VF(gt_to_xe(gt)))
>+	if (IS_SRIOV_VF(xe))
> 		gt->mmio.sriov_vf_gt = gt;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 3aed849a128b..8cee986947bc 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -55,7 +55,6 @@ static void tiles_fini(void *arg)
> static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> {
> 	struct xe_tile *tile;
>-	void __iomem *regs;
> 	u8 id;
>
> 	/*
>@@ -94,13 +93,8 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> 		}
> 	}
>
>-	regs = xe->mmio.regs;
>-	for_each_tile(tile, xe, id) {
>-		tile->mmio.regs_size = SZ_4M;
>-		tile->mmio.regs = regs;
>-		tile->mmio.tile = tile;
>-		regs += tile_mmio_size;
>-	}
>+	for_each_remote_tile(tile, xe, id)
>+		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);

nice


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> }
>
> int xe_mmio_probe_tiles(struct xe_device *xe)
>@@ -140,13 +134,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
> 	}
>
> 	/* Setup first tile; other tiles (if present) will be setup later. */
>-	root_tile->mmio.regs_size = SZ_4M;
>-	root_tile->mmio.regs = xe->mmio.regs;
>-	root_tile->mmio.tile = root_tile;
>+	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>
> 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
> }
>
>+void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
>+{
>+	/* Validate that we can use XE_REG macro with this xe_mmio later */
>+	xe_assert(tile_to_xe(tile), size <= (1 << (XE_REG_ADDR_WIDTH + 1)));
>+
>+	mmio->regs = ptr;
>+	mmio->regs_size = size;
>+	mmio->tile = tile;
>+}
>+
> static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> {
> #define DUMMY_REG_OFFSET	0x130030
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index b32e7ee4b23e..c151ba569003 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -14,6 +14,8 @@ struct xe_reg;
> int xe_mmio_probe_early(struct xe_device *xe);
> int xe_mmio_probe_tiles(struct xe_device *xe);
>
>+void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size);
>+
> u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
> u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
> void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
>-- 
>2.43.2
>
