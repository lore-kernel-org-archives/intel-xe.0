Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D95C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 23:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08C10E1DD;
	Tue,  8 Jul 2025 23:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmhnyn+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2029710E1DD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752016316; x=1783552316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s/EulXnhVOWxRMGBhWLNVFZQdJQd1pt+rKwiaogdZTY=;
 b=fmhnyn+CFVknIYDhfi5oya0v3/t61mc67xRM2n0DUfCrr3rZ9dxGhcGw
 9DVPXA9U5cNuKMUzRy++eVueHeWHcgIZVfwVCmjSnFwh88/3QJJ8htxM4
 2DaxMSf2ueynWUD9fGsfJW8rbKZBfRFWqqoUC7Nqe63OStDS+V4yWsumO
 pBanmj1xs9ZAUoAk5inTAhn6P8UCqUOSfeaX8PzLUk2JqB2xIkBz+LcFG
 3/bYki1p6RhgnmJNCaf4jvfUXqe7YpEQnK2g+TU0Qyj9V6fNIRafQeZV8
 VShS6wHn5iKdTA/jgxK4FEI1b2wQk4xDj2aVtg9ViB2o8yuXBRGxNpldS w==;
X-CSE-ConnectionGUID: 3fgC9JjKRoCVypVaqVd0iw==
X-CSE-MsgGUID: laWppaZ+R9SmbPAt53/TEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53379015"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53379015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:11:43 -0700
X-CSE-ConnectionGUID: nl5Ma3t7R/2GXmoGqL/rMQ==
X-CSE-MsgGUID: Y9PEbWdAS0y1JMjzuAyJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155032570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 16:11:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 16:11:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 16:11:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 16:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2vVihNX6v3pkO4Ek/0i6+UBy4N1wSulJA2+dTQFjy3OqfxxTvK+MPH46luFQGOwBqDKw7rRNYLtRcVa9xnNN0kUrgBDwMadHAOwB1bAcQPgZYy1ubU26ntQKvGp/0Tkjm72LjqcSm3jErkN1tA/GHq8LgCg0Vzg4Up4VDbVRIPv2TD9iMN2E/JDIK7nOjXmJ8IbmrPoXuG8lOqaiQqHY7paSKn9WaSGxqHFPlGoGrXBp+4E2i+jKnNks/Ir0MsDNJ6JhtXLMkKDgJ74WZFKHUgRaxquK9ZdmMDgO19sZiKSXlooK25NuXk8UsWHlrlnYyTeeXpKm4TOQBqv1wZiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnPEdiqwLk2dndh2VQG5mEwxB1CgpKLlWHRDh8fOggk=;
 b=N3PqWMebtsB96oeM3AfllmN5lRK/IQ4y6Q8bVygILWvBg8aEowd6g7zb4kuceLXmy6EnsjWT3MklAnt9+Kh1NAeNm1fH6/srCPTYzVAYA6++WjIajvFU3sLNbTmGpN2JvN6THP3SyxOqvijavRydQhNl/88inLTfsBzUGWdnFWecfg50s7VGdhIb98oltAesz5JKMAHJk558JqDnwDXzeIf0lLZBEyb3jFFRz3V11LQ/k4IuI6H5gZj1cDT0Ylx0ykqD7r6eJkbo6URupf/KSNaY9Q75jG260FxAmK1ZtoCOuEeVUg+7CEvDDyla+3nGoZgj9/e5/Dc5xBrurJD76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 23:11:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 23:11:11 +0000
Date: Tue, 8 Jul 2025 18:11:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 5/7] drm/xe: Add plumbing for indirect context
 workarounds
Message-ID: <c3p5ysmlyp3so7zyg2xazmbqryyshsq6ae6i3by326z63mn5oo@rsr34lev4mk5>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703082059.61597-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 52909c46-1174-4b2f-9796-08ddbe74bae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XcZ1obTfcc3/89gmUZ/8KnSck2RGfNT9KcdGXwI/z9GfxW5zw/ImMFYVjP7z?=
 =?us-ascii?Q?JCqUMqCTxVoJy/YnRCGBLRSUsOadbJukXD0aIIjP6Z67393zuv6gAC14gCk0?=
 =?us-ascii?Q?LcC0KfOirvypv5ItRvli3i4ykTDr1VbjFnQqC27bmPEg8JTGRJ88q5lKvVSj?=
 =?us-ascii?Q?3qpRdCwsXj5cGIr25p9c7+/Ift0st0kkD9ZbiXdSG3PhUuUlVVmhoQsXq1fG?=
 =?us-ascii?Q?7rqwErdwDmvGXDWrSVfhO+g1EaKrw4Y3Gr7/VZ5jMiepD+yKg+h6wFU53rHJ?=
 =?us-ascii?Q?bYN0pHw6ZP2MwqvLdJN51CMzw2B0f0IPmyID8Ywg8u0LwA4k7TJxeyndiZqj?=
 =?us-ascii?Q?MFtIcptySd2FD2/Ww3FLK3a9o5B7pn0IlT5qAgMKJacEWd+8nniapgPLFgI/?=
 =?us-ascii?Q?KXgaWnYxyNNut1i7vZpc73504WDa14+FRV3dCzXOv/VqC5aPDwut3YCRLBBy?=
 =?us-ascii?Q?kLnRlw83Fn1VnMd6hyPTtgFWTNHX45bHnevpDJisBOOy4A3sakXi9FdCB3yK?=
 =?us-ascii?Q?CVA5qgkrW9qxdQpaLtyqVLEn3Q+jI3Qa1OM8S0+Q+jrF0Om8bnyi2PANnf/J?=
 =?us-ascii?Q?usY8femhztmCqKjKbLxyTytPl18wL267mKaiwVn2gl5MXPi6MNmIparsSfNk?=
 =?us-ascii?Q?XGhLe9lvZkIAyIiGXqX3HOOQPy8Q+fLGfWtJU03JiyaL2MIgZV82Kzic9nu9?=
 =?us-ascii?Q?4Jqg1I5z3J57SzD+8ht7KoROwO23X+hKYN89DbxV3GiiCqMKz2aOGZ49I3+a?=
 =?us-ascii?Q?u37REWSVV3Z6BwJrWbO23pK8oBPiRWgYL7rbTBz4puAIyMqVEPJ+NTC32EjP?=
 =?us-ascii?Q?VSKvs/3eAwKvFXaQGhuNNN4Rtvh3alE/wZ2w4ouowk+h/dMOA7m7IUeLvXUZ?=
 =?us-ascii?Q?JjEpl0xNWzRRsU5oUrCdEnMOrFXp5SJyAymY3VVXaVzIiK265fi6r3GcewGQ?=
 =?us-ascii?Q?wnoXuJc6hkNL7rqtAKOE4rHojvQWbSYcxtGsGTxFUPkfFVnA2cjtNt0PVBBP?=
 =?us-ascii?Q?WSr+Zdba9mXeYtSdGElRl2rA8dfFdt/hMEiGUgX6RQhDjmB14rO5KW5KRCzU?=
 =?us-ascii?Q?5wc2Y7ZcI5nLv854I7sHttLi7NyXytY0cdVF64q0hBW9DDGzivDoWGGecRpq?=
 =?us-ascii?Q?S6WwFiX1VWHY3hYfCuuW07bZa9/zvqRRL4q3MuI0g4mdTYhTt2emqN7ShTmL?=
 =?us-ascii?Q?1E42EqtjtwoQ9IxTuNuXrUqV8tbw6r3e/IyOcNtEAOp4RlAIYogQHLdokd5x?=
 =?us-ascii?Q?xymfVY5f2If9bsxPW93lHBXeUW5GVC+E4hCL4Np1RG7PebDvjL5bd9MRnpf5?=
 =?us-ascii?Q?FH+n9knuimAZXcKYfg4kQFTMzrkWGbTZKI+XXtyo4UsyJJRYriVYLAKXz7XV?=
 =?us-ascii?Q?ELJxq7TzJ3h1kEcmB1mSWXWQbZRkIhnRun5rOPaM3Jl7NRspnYQzEgtJZ5jh?=
 =?us-ascii?Q?Ar/UFrHL68A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v3AzXt73QSW/HnefRS4g96LP8U4PZ7VpxO4mGN+gUSj5XIsXAJNi6fH+ymf6?=
 =?us-ascii?Q?b0XmJbFgvxu3jJ9Gg9C9zrvkLUlrteX1MPHiuRIxfVweWAAHD5hOoS9tPaK1?=
 =?us-ascii?Q?u83m5DcTOjIvcpDwijgFSbzGy19mzk/fTiqmITDiMxWq9iN9LMhH7FxWrf1V?=
 =?us-ascii?Q?ARkdSbY83BbINltwV7/xkFtIXDrem0qlAlVGamEmjV21s1AXoKT+wtAMiFqr?=
 =?us-ascii?Q?zWW/dj5F7q5jZm88mh4rbYISs6/hBKr0agnCeWJ5rhaHuz8jdI6hfi/jogFc?=
 =?us-ascii?Q?HQ0o3co1w6SOUhwp5oqxOacWbbrMfAi/39QgQOUujqiwQAw7BCSeooEBhKTI?=
 =?us-ascii?Q?Mje/daoR0AB/3qFQAL3oUhlxAu5/dUL6Il5ZH9uA1dc+2SFpg+zb6WH0ZmIb?=
 =?us-ascii?Q?2xHXDAFrKQzXGpFF9C0MnRikRwT559DjBq0o4N16tkHCA/0REQBTj8xwJsOD?=
 =?us-ascii?Q?3FV+Yly1fYtVX4I43lIQTvug6X7V2ZAcIkDprO5eldRFJ/xsTHge3ozpYB++?=
 =?us-ascii?Q?0T0/BIIO5z1Ewr/wsHByu5T3f1+VwQJUktUJ3Rqyn39OX+7R3EsEFyb1nTwU?=
 =?us-ascii?Q?QEB1yRiSNZYe9Y8yvBsUZ8Us3Bav1og/mGouygHTgf8bH2B6glx72fMiwWDg?=
 =?us-ascii?Q?p4QyCuijyXa5v1Skk8WvkWW0fZ7MaDz+36S5CIyd56bj+psbnUeLYl+deCgb?=
 =?us-ascii?Q?bIPOAeNSQLaySD5/DqFH6WdEO8zAaBawkX+tuwU0Xki2T4COFrVChq9apDx3?=
 =?us-ascii?Q?WeRZi8ON8EYTppkai/B6eBerH51hP7MSIFXTI85XPmuAgyFghtMYaMYw0Jyy?=
 =?us-ascii?Q?Pc9xb4OkaluHBZ2cTf8USc/LU5Hzza8g5V7IdzF0aB6kXLfNHI1PhsF9A5ut?=
 =?us-ascii?Q?+8qmUrmFZLPJxeMK3cWE82e1ChGj2jeHxsREq5hsOmnVp5PnRWHDSuMPVcV+?=
 =?us-ascii?Q?y9p2MPecKues9FCvUXUth7xEvM/c6OmGHUqPoEpz2K4zCBd8fy4j2N2RfpYg?=
 =?us-ascii?Q?RJxhd0DQ8xdnqYxpTNog+KHxPq64qwG+tzdcoFyZr5FRV5+8AQiwEc70fqaH?=
 =?us-ascii?Q?BYrk/Ydkg5ueK+IWYvOm9o1al3ILP9ZSd5uo5xq57oPf0irUG7rowEDuU5It?=
 =?us-ascii?Q?IZUvOZ8SR1vtr7s6m9TET0FnbKJxmPB24+asEu+jC2nhudi9SexDgogWJhwE?=
 =?us-ascii?Q?F20IRwazqzFZDCyHXkZk2hV2sEdtIMRj3PU9SYJRqNez/mB5M2ZamFT3MQAD?=
 =?us-ascii?Q?7VgrVHVk34KejZAvRTjG1RhOtT56lYsPDhvdcfzm1da0HfoY6Ni7x2tYHJDY?=
 =?us-ascii?Q?6U9tkM48h+EBKRZeCInxTfkJVOd90ArtDbeOeIq8mMeQsP+Ip8hemwo2q4fw?=
 =?us-ascii?Q?MYPj+nCXH70C4vBgoHl3O8jfWDwV3fhj9vy6urm7XlSS3NswI7t3VcJn88wt?=
 =?us-ascii?Q?TPM5Snf+D3C4E9CcwqHmwhK6GRrB7LCLGc2CcnP2NckUqyv4c8sxU6HrgTdC?=
 =?us-ascii?Q?bDHvdfckJSXp9hG02QaEX+fqHumC9FWyB48cZNd3QDoQ04GTfLJ2myu5jIbY?=
 =?us-ascii?Q?CPoiV4WEv/JsWGXUlwDJsyyBg6tuA0MGA5893rftjr450Lrk9tXpyRCHVr6F?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52909c46-1174-4b2f-9796-08ddbe74bae6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 23:11:11.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZfEEX8x0VBL/1OGHYstpwFNOhJ14XtwV+cYyBISBu9m8E7pBCAi3e6MPInKN5+Psm9w1kRRPNxZYCpJNhqwzw1IT2mTaL9eCLNeD5MGrDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On Thu, Jul 03, 2025 at 09:20:57AM +0100, Tvrtko Ursulin wrote:
>Some upcoming workarounds need to be emitted from the indirect workaround
>context so lets add some plumbing where they will be able to easily slot
>in.
>
>No functional changes for now since everything is still deactivated.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 80 ++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
> 3 files changed, 84 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 994af591a2e8..cfa6db15488e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -12,6 +12,8 @@
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
> #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
>+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>@@ -36,4 +38,6 @@
> #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>
>+#define CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd

this is already the default,  so we can probably skip writting it?
If we are writting it, then we should use a REG_FIELD_PREP so
the `<< 6` doesn't feel like just a magic number 

>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index e278c12a41f9..70db4c5764e6 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -39,6 +39,7 @@
> #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>
> #define LRC_PPHWSP_SIZE				SZ_4K
>+#define LRC_INDIRECT_CTX_SIZE			SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> #define LRC_WA_BB_SIZE				SZ_4K
>
>@@ -48,6 +49,12 @@ lrc_to_xe(struct xe_lrc *lrc)
> 	return gt_to_xe(lrc->fence_ctx.gt);
> }
>
>+static bool
>+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>+{
>+	return false;
>+}
>+
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -717,7 +724,18 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
>-	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>+	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>+		     LRC_INDIRECT_RING_STATE_SIZE;
>+
>+	if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>+		offset -= LRC_INDIRECT_CTX_SIZE;
>+
>+	return offset;
>+}
>+
>+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>+{
>+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_SIZE;
> }
>
> static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>@@ -1065,6 +1083,54 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	return 0;
> }
>
>+static int
>+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	static struct bo_setup rcs_funcs[] = {
>+	};
>+	unsigned int offset, num_funcs, written = 0;
>+	struct bo_setup *funcs = NULL;
>+	u32 *cmd, *buf = NULL;
>+
>+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>+		return 0;
>+
>+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>+		funcs = rcs_funcs;
>+		num_funcs = ARRAY_SIZE(rcs_funcs);
>+	}
>+
>+	if (xe_gt_WARN_ON(lrc->gt, !funcs))
>+		return 0;
>+
>+	offset = __xe_lrc_indirect_ctx_offset(lrc);
>+
>+	cmd = setup_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, funcs,

this 15 is directly related to the 64B align below, right? It's not
something in addition, but rather the size alignment since the size we
give to INDIRECT_CTX is in # of cachelines (and we don't want to execute
garbage.

Maximum size per bspec 45954 is 63 cachelines: by passing 
max_size == LRC_INDIRECT_CTX_SIZE and reserved_dw = 15 dwords,
we would write up to 4036 and the alignment below will make the size go
up to 64 instead of 63, since max size is then off by 4.
Or did I miscalculate?

instead of passing a "reserved_dw" why are we not just passing
max_size + reserved_dw, why are we not just passing max number of
dwords, calculated here? This would also help stop mixing the units.

>+		       num_funcs, &buf, &written);
>+	if (IS_ERR(cmd))
>+		return PTR_ERR(cmd);
>+
>+	/* Align to 64B cacheline. */

	/*
	 * Align to 64B cacheline so there's no garbage at the end for
	 * CS to execute: size for indirect ctx must be a multiple of
	 * 64.
	 */

Lucas De Marchi

>+	while ((unsigned long)cmd & 0x3f) {
>+		*cmd++ = MI_NOOP;
>+		written++;
>+	}
>+
>+	finish_bo(lrc, offset, written, buf);
>+
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX,
>+			     (xe_bo_ggtt_addr(lrc->bo) + offset) |
>+			     /* Size in CLs. */
>+			     (written * sizeof(u32) / 64));
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX_OFFSET,
>+			     CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
>+
>+	return 0;
>+}
>+
> #define PVC_CTX_ASID		(0x2e + 1)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
>@@ -1074,7 +1140,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> {
> 	struct xe_gt *gt = hwe->gt;
> 	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>-	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct iosys_map map;
>@@ -1089,6 +1155,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	lrc->flags = 0;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>+
>+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>+		bo_size += LRC_INDIRECT_CTX_SIZE;
>+	}
>+
> 	if (xe_gt_has_indirect_ring_state(gt))
> 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>
>@@ -1213,6 +1285,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (err)
> 		goto err_lrc_finish;
>
>+	err = setup_indirect_ctx(lrc, hwe);
>+	if (err)
>+		goto err_lrc_finish;
>+
> 	return 0;
>
> err_lrc_finish:
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 2c7c81079801..e9883706e004 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -29,7 +29,8 @@ struct xe_lrc {
> 	struct xe_gt *gt;
>
> 	/** @flags: LRC flags */
>-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
>+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> 	u32 flags;
>
> 	/** @refcount: ref count of this lrc */
>-- 
>2.48.0
>
