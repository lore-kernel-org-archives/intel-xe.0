Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2041BC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 20:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C858910EAB2;
	Fri,  3 Nov 2023 20:25:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC1F10EAB2
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699043146; x=1730579146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MzDOOtLrweCIovLD69Dd4ub8uTSDDn94cJEwu1peo1M=;
 b=PD33gszK4PXSRHYiGVSrtm5wWQisZaWdJiaZNOueK8nlYnUtyclYfp+v
 hJtiuMjRowzuA1p0QhsALNgOYkGXi0wLWKp2IAsQUE5YSMDzIjTR0WtF4
 QsecYcYITN8f5E1sm14F284WpH1Ff5Xb80Il4nvPmuVirhz6Gin10C+Te
 3Y4vXH8VkkCNjskLQxHECdTHhNG5pT4AEGlbEVS0ndlRpLB0XHx3xXMkM
 /9UBImkVjpml1oTVMEWEdZOp/YCqCZM/wqVtq4puKHba0dj5jtv/RrfZk
 BaZuzADIMjtE++ypkLvQCvlUUVcRGn2wzF5b1LKBNWUgz0w2VGwwT1HrF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369221809"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="369221809"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827607195"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="827607195"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 13:25:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 13:25:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 13:25:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 13:25:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 13:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLjvJ97QPp03Z6Gg92sNcyHur0M7IvvD05InHg+V3gR10pUhhYV+lrjnGgdVp8VpyW+PzFSRrYOn9smHYnE0SJF8fihHCFpllgXKGG9jh2XktJsglRwIyJ6s3t0hxtL+PIav4G4iPs1qWI8uRU4b48eGO54sUw1j1Y4A6FrY1J4oXTo2oSVj+HKMsk16cVSmkOkT6sBAeo5COMH7Qw0MS7a6g+yVzFMNNuS7pxvLoW6NupHtC9ByG9UxlzcVIOJGMdPktt1nabwAa0FT0w4tMdSytag7Wq8bLBGs3en9JBS99BBw07h+ZMfgJsuITsRh3z9dWgxOuLOBuoqoHW+tyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7mPFIo2nOVJlYNWmElwcWFHHJY7aB6r2XNydzzRJ58=;
 b=HR+b/sdyK+nRY6VXMO0cSrmAleTgvFR+jIZGf0SMLjjI9P/mPevrhctakoonBuk/ZeNMtK7/ZBX/vt4eFIhH0B6/lSpCG0hxqxqkSgLju+1W9VWYh8JvJcG5vBYzZJ6trhA404z79oGMZiKkpOE87ESXYko5YHyA2bGMdQE4s/G1JsnWslwPA8P0uw5bXKDcl1D+25Tb0eCmkE3btWFgrFgalRah13xbDfelaSkC5PBW8TbfFlUb0Tdp+lk5+DpqwhEBmyoeyNAsPUzgP1Jz+PXHCZxx5BiM9LHwoEujwLlwA1pISS/U9Pk03IuK6LCxOnIeGUSYk+slUqk8WjdoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 20:24:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 20:24:31 +0000
Date: Fri, 3 Nov 2023 16:24:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZUVW/B8fTHJJ8x2y@intel.com>
References: <20231103195338.912645-1-jonathan.cavitt@intel.com>
 <169904205455.29108.3516403421905182291@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169904205455.29108.3516403421905182291@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2530b6-0535-4446-6f6c-08dbdcaae314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72gy7A3CIIyUO/D1i5il/tAoNbdazEWpWigt+1hznGDtrm2d03Hv6KuHOD58+4+M/FJSQ0QKLXO3Xmxh6/7BU0SUxBht4aeNtGjCOj6bmB+o2H5QP5tvlagfeN3S+6xuNTgH6ol7nb0Z04hiRf/gKFetZcn8qRHbNnAO//UgwJuXuvIMXpp4H3cvHUkoUPGwtpU7ZlNhL+pytQ1lVGuqFgReo3uPR51LmSCQK8VdNol3NoQk0253S/MzWyYSQ7Fl9kCPwQywYYTXQzcoeLGhN2i1HD1ZZEzYWI3AJVm3irWvfVn7bBLVEWYc48hVmLkkPGy5ehVEPUGKEfsTLxVKq4L32nkwQ2G7E8ufr9SyP/nELZ+azHiCNegssVNiDf8WZVBIQ105GRuRJg3Gf9E9i+nLJYQYZQFT02qnQ9ffx6ks/+vNoMXgjP9vDyCLzWLDDdt4Hf/9N6uSXMYUOoUFllVHEvyoLmJGnJzNNhJ/DGNAkAY0JJTFrwoiLqSJjJ84twBGiIXzSW3vMFy4Ig8so/ReQztZwWLNbA85CbUyzWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(4744005)(2616005)(44832011)(8936002)(4326008)(2906002)(82960400001)(38100700002)(83380400001)(6666004)(41300700001)(66946007)(6512007)(66556008)(66476007)(5660300002)(316002)(26005)(6916009)(86362001)(966005)(36756003)(478600001)(6486002)(6506007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jmW9oR+VC9+hrkp9oo3l9yEjI8JREGCQyoI2DbreltZOyxit7xqatTHHHDUU?=
 =?us-ascii?Q?0szjZj/5HISnsuNWUAy0L+CrLgoPRDa4nEc5s/dNoJbN0HnySighvRalNtP1?=
 =?us-ascii?Q?pXscEr3Sd3VHHJdi/0LVDl2L4Ofbn59VXl3PBZej0qCFiE8uVn6IY9fYZQE8?=
 =?us-ascii?Q?j/Qc2HnkzRoYSHBiVky7I9kQBJCWdlapDbyhAes65yxdvrQwNS79Fp7cngyq?=
 =?us-ascii?Q?J5Igupx2cCj167jvbJQiy92/CmCbC14P90O7a8LRFgCUDpI13LrWTOwP0IJD?=
 =?us-ascii?Q?2pbN4BkCSOG6NpWFMzF46hR1CiezUdC874qsm7Y8RJkQV0+yEjxEAv2f+Qqa?=
 =?us-ascii?Q?/2bOYN/TzwKRGRTwdatVrWplSetf4jwI5Whnv3lnyJEECHZiJCzZlxJA2WFT?=
 =?us-ascii?Q?QJ7ruXj7rnCEjIMM7yXgSUxBeYzEINWhobC9+tGtrtPYR0onmfB2FMXqetgf?=
 =?us-ascii?Q?Ept0oKNrSc3xWJ7SQSFysZgAdkRAhgpxrGeggvVkTqAMJtewdQM0lz8eH21P?=
 =?us-ascii?Q?vAyg0WuiSp5eSHEwLNntG87AZXIGsfcGnytaPnuo68r2T4gvmZNg7UvT0Ufw?=
 =?us-ascii?Q?mNQSRxA8IO15hsvB2HkO38I5UXG4uN5EEMhh/BFOZGeW6vCZeEJGcHgYHBsj?=
 =?us-ascii?Q?BZSI/pGmiXta6wOpwMxz/qG/TsUJZlO15pmM3IONOi3DlPVtA3TqI7+qWRP4?=
 =?us-ascii?Q?21u+88y+CaITwx1311mN3B/WOoGkIZhY7qFAhsUGvWKjcdVwqieySwkwkAlZ?=
 =?us-ascii?Q?vrmBVjay4eeUvzXwlLPowX/CiLm4A6wD9Z8w/NF888fLAhnQ6bTh1ezHuJs+?=
 =?us-ascii?Q?sImvE0q2whMNU0JX/DTFGnCQbIsvqZT4GIiH+YL568Pq9H/tuYwJMMSC9jJV?=
 =?us-ascii?Q?V7RoDpuhgoL3ifWejku2LAFr2rcdhrzlIDAUKYomLKB+5u4pfgxYX5LNc3bh?=
 =?us-ascii?Q?Mb8nhYwwirmi9JmwN5l6r7F4/NGNKh16fQE5WJ1SrFNDAypgUDl5zfs0QceR?=
 =?us-ascii?Q?enTuF1P95Ybt50u6y1kbVmpfAaFwD8mSXVHD4bOB6G9QM1SaXn6MOrN97nLR?=
 =?us-ascii?Q?wu6i+6EBrM3KXtylhXoeBXqLpOKjjsVo03akd2UCU0t4DxzL82B8cKnQxrO4?=
 =?us-ascii?Q?a49O8xBHWIRKmuC53syqbFuz7vlUhJFlVX1nZdmk7dMx1blIj5y3042d0eS9?=
 =?us-ascii?Q?ekxln4H+i5nPVz0ugZ7QrQAYXEMUjOVwrF4p9hI1cXfgwcOy5DsUVxoUbshy?=
 =?us-ascii?Q?58EvNAwcX8g9VBGmkQ4yoia/iKPfVnLBVAjGKDTniHqvBSdziSC65I6eyhBc?=
 =?us-ascii?Q?u7Lto1H9Glz1+5jMuUA8TMlaWkgv2cZlZJm15xnuQUSdj5IlB+x27kVAZhxW?=
 =?us-ascii?Q?/K3ICfsmAn3bOvBg0a0d/0ew+bOpw9ab8nMU0bXVE1faeCCXSq5ymwYJacTi?=
 =?us-ascii?Q?AodGZXWwmQY+m4sRHqjCdSc/xtvS6iGRpnEz2LB2njPePQ3t9kvZ9yMEeXGD?=
 =?us-ascii?Q?qSzTw4bEVaFxj7NtCe4CvhEQbkCWgBKzTFFWHa1PKuBpkpecyS1xmKvToGSQ?=
 =?us-ascii?Q?V0y6HB1hbLuHtm4vwdoOMar0Q7uYhOrtj/rXxDPQGFTdmg3azIxlFtXj0U8s?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2530b6-0535-4446-6f6c-08dbdcaae314
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 20:24:31.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1n3PxqaeZj2rPLjGhlXhDsLpgTMkxtjolnijC9uE1m3M+dkHXz6Ov3FAE/9kjiB/Dg7rtSbomMBMmgF85yFDYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_drm/xe=3A_clear_the_serviced_bits_on_INTR=5FIDENTITY=5FREG_?=
 =?utf-8?b?KHJldjIp?=
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 08:07:34PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: clear the serviced bits on INTR_IDENTITY_REG (rev2)
> URL   : https://patchwork.freedesktop.org/series/125971/
> State : failure
> 
> == Summary ==
> 
> === Applying kernel patches on branch 'drm-xe-next' with base: ===
> Base commit: bfa43da8e drm/xe: implement driver initiated function-reset
> === git am output follows ===
> Applying: drm/xe: clear the serviced bits on INTR_IDENTITY_REG

Please rebase it, but feel free to keep the rv-b.

> 
> 
