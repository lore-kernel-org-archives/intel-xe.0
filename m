Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A56ECCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 17:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0893D10E829;
	Wed, 22 Oct 2025 17:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hml66XSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD6E10E828
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761155628; x=1792691628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yTtfUoRByyBwWO4FL66fI4x4YEjPZKOYslaNuSHbyt8=;
 b=Hml66XSdeCPRedKkjZIha68dpXWnHzYZf6WvetXc/mfaAWYPFuiGwFfE
 icXxb8jSzKmj3tcn7VgZJt1nlfkpb+iJXT4oHQo4e4CuxqApSSaYPzJ6x
 DXlRupgdPBm0JQVfgO7pezLSDDO+fa7dWv5mxtmvFqWLfhMMwa/tl545Z
 1Mt/3oQZcG5WHDA655A/nYDGNCFFvg09ywCygXonQhFau7BybEtxsM8Vs
 w6ZPBMkeje5KIrO/NQH8b5y5AaW9vtsMLbr2AjdUwi95ANMH695gH272F
 McqktKR/UULy1YmvSWBW7zIKdNrVaAqC4FLUcFPPFOwXDYpBhMG1Qigx4 g==;
X-CSE-ConnectionGUID: kaWlXOG+T0iBXT63FHRQyA==
X-CSE-MsgGUID: 5Szv+FymQFqnuV2QpITjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80941999"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="80941999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:53:48 -0700
X-CSE-ConnectionGUID: 12LG4PsDSXuOQ7QWwFlUug==
X-CSE-MsgGUID: ZwMT0pZBR6eh2HqzfAU/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188341238"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:53:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:53:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 10:53:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuGFvqhIHB/jTKFOoQyiBn7CdXjkkR5JkXl6N8uh9VL0+eGkE6kpz1eM2ThT418qMF5UpbGdRNK7XfohHR7ulfK2XzTm4fBGQ7+m77SmzUjW8W0cxf22OLK6PLW3ecyobyB4UqE0xggiSY76nbUd7pi8chHvxNsoo6Rac2L7mE1j3EwVkVRBXXQARXw5hj1Xcg9ZEdkBoTev7OqvK1/xvn7fSBFX5Sa2ObzTc9Ki8SsTOn7KnzVuBE6Vkyl3AqMT0qmGTjODfXZ2wW/apAqr1OtYNRdHHCOnEs4iQrc3BcImxGCJzLcYKbR7BoO2hFUGjOd9ec8GulxxS3c5344GFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bYP9QksDWsBP52nNSx/5+cn7uIuvJzsVzdb2++yJ0E=;
 b=ex7AMY69A93Avzf11A0pHaeqP+kazHS7Fpf2xXjfjau/h9SKovnt3IFui0znlTq8DHLnSi+EgAyQZErcsj4XY4Hdth0ckdrGKaInhimvZp0MJwf9CKdEqB2CggDe3YY62w9CfaKhBvhR0ZK0xoNgSBAvtZKa+8GitAlp1tC+KdCUaQRN6vtYxFRUBYqV8/s8OLbn96Tfp9yje+O2NKuSB+bPJO7Fk/m63vu5eZDbkvz9egAu2NimBZVVPTpU9K9L135bNJQMpoUv5BZurUj+r43ovSmpgtNFqzkkXi9gqkO+3KUfBgZ9dtEZP8wAj9PalPjJfZwxRpdpsUY0Kfl7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 17:53:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:53:44 +0000
Date: Wed, 22 Oct 2025 10:53:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/7] drm/xe/migrate: support MEM_COPY instruction
Message-ID: <aPkaJnsZmaIXF6rO@lstrano-desk.jf.intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
 <20251022163836.191405-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022163836.191405-7-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:303:b5::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f8768a-02d9-4dcd-97ea-08de1193f1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S+tP07jF/dgUGXX8sVccxRS7P20vm8Tle2yBZVWj1QxazS6693Be7BNMNoZP?=
 =?us-ascii?Q?EERJxKOUj5eyYKwT57uZn+ihrrSmDljDdKYYJ2m1taMoHCAMcn51AYjeMugY?=
 =?us-ascii?Q?a7GuqnJsTNgG9j37VNjflitOlDAHAe/v0sK93arinULZwE4vt1tYEcZdlsKl?=
 =?us-ascii?Q?jzF+uyuVl6zMJIaTCtppeIYUF5bkx/C/rptGHQP+i6DBscaAJH2CyJj3r9It?=
 =?us-ascii?Q?+XqF9YYCLgUzvsoKWbUMrdjHNx35tfh7UtpVBNWQJ9Oa5Z7J+bioj0Gn5HKK?=
 =?us-ascii?Q?6RUpXDOLc+7InVRrkyfvtQ1voc5pIlnJvdeV7ofA+aXES92/4kt/VL2NiZXi?=
 =?us-ascii?Q?yrGypI96qfnSh4MTT+cwcxh9IGH9W4eRtdFyiN7Wizj+BQFjabBME2ol/8/1?=
 =?us-ascii?Q?0i9sya1YeAxjkvYHewe9IAoXkAXrG5VbFRqsMEYrpshLjaUCYCN3I5Brz8/2?=
 =?us-ascii?Q?OJBeTFTzKAVVkRgQXhZfWGdaPFDeFKVf8Eya0F6sU1uBvDfJuBqBe6f5y0cC?=
 =?us-ascii?Q?oh/SGd2V/NvHLd7zdL250DpPh1VO7Gj35f9KIhLuf8vnDnUXZToxMr/oSaoi?=
 =?us-ascii?Q?gXH3jDG6YwwLT85zGxl5cBtQjKhRlpjJDAVYW2QLbGeJMAMeGO8Vjp29Ko8F?=
 =?us-ascii?Q?NevJAsg1BwbM92L6YPTexX+Ioz34mwePBwoMevHXOeNaICuBcK57aoB10EaK?=
 =?us-ascii?Q?zYwdgSP0A1fdpdZsTmobaLIxQL5zGAkf1bqLftL1pYTmNeV6M+aDJ5F45oZu?=
 =?us-ascii?Q?K0VcsEtTpdgLpf1SqzsEf0g5TNA9ZwRY+3JDhUHqRZl6wnGEdSs8mZBL7xtx?=
 =?us-ascii?Q?TaKWyI+HouKZ6qGiS0tRRlKd5OogArSOFyIkmEz8QLEp18CJqaJv/82ITx0j?=
 =?us-ascii?Q?Fjn+62G8kidUHEK0+OBYm9owYPpJiqRUfdZibgMtZY4EVbUwtEYIOIo1MCRK?=
 =?us-ascii?Q?FCyaopHRXgb8adJGHwCK9FunZA00jLXAHKDpKIDLUC5NWQ9ohwr20WBkGP+8?=
 =?us-ascii?Q?GCmD8AB7pRhR5e+3vvhBioFXFQGDpy6zzrFf2fdCOHV7T0itUtF0w32dI7f2?=
 =?us-ascii?Q?sbVeAcCw5SQOzNHXRu9iRPGNa5Prsm8fGY1of96hl3R8WM/tP3ZRK1fKm1/b?=
 =?us-ascii?Q?OQ5f72u1toqIkdtnH4G3zfwd3Ge0r9BJSEVSepJdh7bPjrdZRXP7/kOV6mMQ?=
 =?us-ascii?Q?p8RHhrD0YTZHTakL7SbYPpS1tj0NDaQF/F1TRL+Ku+R0R4JQp0h8mrqm1IaW?=
 =?us-ascii?Q?oIloQgem9BjafvRw50UDjc+YFqHiGxan869Q5G2HXCorbX65LLsW8XETPPFY?=
 =?us-ascii?Q?7nE/iGxW4vrX4xS0E4sBZnbQ+TqNqxg3EOXbMluNBLiZVsr8TtiosjnqN2ZC?=
 =?us-ascii?Q?n13AYqy+8Tlu89tPgMfuFDZiqometNr1FukxnEV5d8ny281dQ3f/qREq4cYa?=
 =?us-ascii?Q?sIYrXmAH9Z+NRsTFpnaWkQlGfES5A6WD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Oc51F2c1BntOKq39RYZPsiBM/aOz4OXFvvJMf3tHv6U763HKL6bIY/kyUmk?=
 =?us-ascii?Q?FkKEjfneGw3frC4dpe5W+g+lGSIfmPPPURLveyxQTgHNTOZqRdXiaZqVunro?=
 =?us-ascii?Q?eZv/Pc+/TNFiCbuMhHnomRBYLrrJIMPv9T6zJ9oasUr+h33b/JqK6/KqPK8V?=
 =?us-ascii?Q?23s8a4hdfHQ8UvZ4bKoqgJx3IdThBDzcv9JoDOchj8aPbPyy8+z0Jk8WWvX3?=
 =?us-ascii?Q?NVmx1ho/ywIX6sRKVUKm3u0wxoRbQhMt2blTkWlgMALFHKpaPNxkmQ9WQBEu?=
 =?us-ascii?Q?K+QB7ZpVvOI3fhlngM1rxst97lGn4HKTtpCkv342I+vD1Uws42Mw2auTqtsl?=
 =?us-ascii?Q?nsxf6+Ob+VaDbcVtGhYxf0mMQ6rewHYG3Iuwtfcld57O/2dPEvqhra5a5B49?=
 =?us-ascii?Q?qxlF3Q2iJaVpFaFG0iiR1n4SUmRNCIX9zEunljXfVFlLbUyHlMfK86hl8zPM?=
 =?us-ascii?Q?1PoloUkddnyYpLf1NtxEhMXPgLhl6Q7u1bGRR3aPr3ykxvwTxJ1eOeLk8Td7?=
 =?us-ascii?Q?JOJiq31VuReaum7aXaDjBS+dyKkEGuSd+qoe0py88zPAxLyYgoP3klIgThYl?=
 =?us-ascii?Q?2mq7N6jtOCyViWXoxjqmfoOkmjGLLCcEr8+Pf+1C+VJMASnxukK8Vw5MePPX?=
 =?us-ascii?Q?Q0RMxZuP3PSq6wLxNkvm0RChTkunPtqDJOo6CQgLvhkwrLxV+hzWzMOPh5ql?=
 =?us-ascii?Q?fK4ph186vTeUrLjNrPC+aGPI35BfF2qY0Lpq61woxB+PZ8+AM+wJAsH5b3St?=
 =?us-ascii?Q?3D/yw+IMwU+vpQwuTfHXGC6tmHAw/CFl0m+Xv+QpE5qgx2hVs3Enr2ttghRx?=
 =?us-ascii?Q?F1BaPrgx5kVt2F2kaNoY1A6yg0ihx2LRSUqLGfrzm6kLD8JpxkgdV7fPjtCu?=
 =?us-ascii?Q?oafmIoPvov1Ruca0IKKJqxCweyuURqinCldSIWuV/FG/ChsFa4EYks3mFHhn?=
 =?us-ascii?Q?1lZUE7+T/nrGK9Qo7vXLXhPqFLdskqPOM9MGxhrjfJc0ER1Mn9AYIjSx6k02?=
 =?us-ascii?Q?sXI2hUbJEu8xNbd/6ivigAU74JsQ0oB0gn/ND7qPrXnmHTA013N5++218e2E?=
 =?us-ascii?Q?eGSSGzfNlosHX1UCLZo5WsdMqqhwWjuDPVAT+igTIsx+yA9eX/v9dasvAkIg?=
 =?us-ascii?Q?5vioKlI53CngeyYauKj9WNCT1WT9UlC9FNdnNnVySD7wnMI5JPiyt/BVhDXO?=
 =?us-ascii?Q?co4SQ0t/aJ2eYfakiWb0DeFXKqqjLwLvnTIotlOHpnE7mKskefG+b29kQBOw?=
 =?us-ascii?Q?WAiJc1Fr56MvPMJLFRNihpEnQ0sZ8OcSCsOes4h2L6zH475gJpY89NIyOWSb?=
 =?us-ascii?Q?bzcwdQ16MlewwQoiUh0EW1dWlkljAA3csmVk4YAd5jgsQYRW3xepepM6L2US?=
 =?us-ascii?Q?mljzV9079CwxNXv5ks8zPe6PjlBU8e+YeiRCGS1cHGZhoW4Qg7j9VukWyl+e?=
 =?us-ascii?Q?OcEqteFn8dDEj7sHRzZL4+mg/tVRI3AHlt+F8cRjJ6ysCUusfwlb8tSJgao1?=
 =?us-ascii?Q?NTpDDWctFBRy9lT8oj8/D09+9BvBkklI4f7/kofxcob2iW2m7TG1LfYloHrY?=
 =?us-ascii?Q?nnU9U22rIFkSb2xG4ZamxD4Dv7Eca/5I5vlNfAQxNKTSvuojmgZlQmgOnJSF?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f8768a-02d9-4dcd-97ea-08de1193f1bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:53:44.8455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab0tS2v4bJMM61A0Xxgyk8gBHcxY6yGNe9VnRPAsqJ0xpb60NUi113nv6i/dCIfRPSviG8th0WMnlm8zghyg5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Wed, Oct 22, 2025 at 05:38:35PM +0100, Matthew Auld wrote:
> Make this the default on xe2+ when doing a copy. This has a few
> advantages over the exiting copy instruction:
> 
> 1) It has a special PAGE_COPY mode that claims to be optimised for
>    page-in/page-out, which is the vast majority of current users.
> 
> 2) It also has a simple BYTE_COPY mode that supports byte granularity
>    copying without any restrictions.
> 
> With 2) we can now easily skip the bounce buffer flow when copying
> buffers with strange sizing/alignment, like for memory_access. But that
> is left for the next patch.
> 
> v2 (Matt Brost):
>   - Use device info to check whether device should use the MEM_COPY
>     path. This should fit better with making this a configfs tunable.
>   - And with that also keep old path still functional on xe2 for possible
>     experimentation.
>   - Add a define for PAGE_COPY page-size.
> v3 (Matt Brost):
>   - Fallback to an actual linear copy for pitch=1.
>   - Also update NVL.
> 
> BSpec: 57561
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
>  drivers/gpu/drm/xe/xe_device_types.h          |  2 +
>  drivers/gpu/drm/xe/xe_migrate.c               | 61 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci.c                   |  5 ++
>  drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>  5 files changed, 72 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..5d41ca297447 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -31,6 +31,12 @@
>  #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>  #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>  
> +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
> +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
> +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
> +
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
>  #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e..6a62b520f5b5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -305,6 +305,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> +		u8 has_mem_copy_instr:1;
>  		/** @info.has_pxp: Device has PXP support */
>  		u8 has_pxp:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 95aefe2e71f5..1bbc7bca33ed 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -699,9 +699,9 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  }
>  
>  #define EMIT_COPY_DW 10
> -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> -		      unsigned int pitch)
> +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			      u64 dst_ofs, unsigned int size,
> +			      unsigned int pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 mocs = 0;
> @@ -730,6 +730,61 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>  }
>  
> +#define PAGE_COPY_MODE_PS SZ_256 /* hw uses 256 bytes as the page-size */
> +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
> +{
> +	u32 mode, copy_type, width;
> +
> +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
> +	xe_gt_assert(gt, pitch <= U16_MAX);
> +	xe_gt_assert(gt, pitch);
> +	xe_gt_assert(gt, size);
> +
> +	if (IS_ALIGNED(size, PAGE_COPY_MODE_PS) &&
> +	    IS_ALIGNED(lower_32_bits(src_ofs), PAGE_COPY_MODE_PS) &&
> +	    IS_ALIGNED(lower_32_bits(dst_ofs), PAGE_COPY_MODE_PS)) {
> +		mode = MEM_COPY_PAGE_COPY_MODE;
> +		copy_type = 0; /* linear copy */
> +		width = size / PAGE_COPY_MODE_PS;
> +	} else if (pitch > 1) {
> +		xe_gt_assert(gt, size / pitch <= U16_MAX);
> +		mode = 0; /* BYTE_COPY */
> +		copy_type = MEM_COPY_MATRIX_COPY;
> +		width = pitch;
> +	} else {
> +		mode = 0; /* BYTE_COPY */
> +		copy_type = 0; /* linear copy */
> +		width = size;
> +	}
> +
> +	xe_gt_assert(gt, width <= U16_MAX);
> +
> +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> +	bb->cs[bb->len++] = width - 1;
> +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page-copy/linear above */
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +}
> +
> +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> +		      unsigned int pitch)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.has_mem_copy_instr)
> +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +	else
> +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +}
> +
>  static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>  {
>  	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c3136141a953..c9f07fac48b9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -342,6 +342,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_pxp = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.va_bits = 48,
> @@ -362,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_heci_cscfi = 1,
>  	.has_late_bind = true,
>  	.has_sriov = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> @@ -378,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_sriov = true,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.needs_shared_vf_gt_wq = true,
> @@ -390,6 +393,7 @@ static const struct xe_device_desc nvls_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_flat_ccs = 1,
> +	.has_mem_copy_instr = true,
>  	.max_gt_per_tile = 2,
>  	.require_force_probe = true,
>  	.va_bits = 48,
> @@ -657,6 +661,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index a4451bdc79fb..9892c063a9c5 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -46,6 +46,7 @@ struct xe_device_desc {
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> +	u8 has_mem_copy_instr:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
>  	u8 needs_scratch:1;
> -- 
> 2.51.0
> 
