Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04151CE8D5D
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 17:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C5910E184;
	Fri, 14 Nov 2025 17:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncACYAaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5951E10E184
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140082; x=1794676082;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2PC2X6RnNRDXw9TygBuUMhRusrC/5gJuhifg79K+XLA=;
 b=ncACYAaq0QrzkHdwVaYjismVzkmxAByTAc0btoSYjnvtPzSZH7a7oS7m
 9zv82pDuy/HnMWB217LcrV3BNCIxOgBBWac7ldflnfu5/ONtjWdF42kxh
 pVwckpyZFTIE04lyT3V5g1+4l+e2q/Pp2BaMZJwK7OuZzej++8FhuJmni
 cvbazoRTjXRZimp4jXkj+zosG0Gjs6l7MoXSgMZ3Y534stn76UjM+Db0T
 JVldkiMt1AzoAFq/YsEdraaDqop25xps+gqGUR2HR9u0R4BGKwMpSJ3ka
 o9NQgtwiGKykK7cQ3Lj9WaOHKG/lvwjH2lrucBzHSoiFar4WPZRr6X02m A==;
X-CSE-ConnectionGUID: mZFhPOTtRIaFTackIqt1Iw==
X-CSE-MsgGUID: /NIsO7bZTVea7VzS/4hV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76700716"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76700716"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:08:02 -0800
X-CSE-ConnectionGUID: 4L+iG17TQxeAwuCYRrqtIw==
X-CSE-MsgGUID: /Uf4n5m0SMaBtvKv5NtMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189471055"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:07:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 09:07:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 09:07:53 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 09:07:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQY2XoRUz/zEtov7B68E4tvoEWOqJbVxHRVaJjMZroS8MNaqTFzUXlr8DejKOJ0DYYMrcMfvR4hS8NMhbbckK+JRLaAyU1LW4y/zCt6XfGdEmgrswHintqv0FChdJF2MkFLqhH+3UVQY+rycp30N1qsoOOv2BPoX38Ueht2JNXa+mHKCPicTRVujRHHTVH7aKAzTFZIFB9vgRkEHJ42a2BNNOoIuPV40to0GbWpqUnUpteOQ9+slJEEWCHH6AurSVF79RTKzUKqoB+1pVMIUIiSErN15Jp3v+WMgDHEGlcLMT5jMCM2d3MzyQzLUCeFDSSvJWUIozPCaiccCZYxXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUXe+1eqw4IUH/IvJqh4ySmG53iuFNZHGVKrsy+gzQU=;
 b=necgugQjpB0eILd8tJk9iWWnmN1l0DgWQXyq5c38viXek8/v1OzMfMcDFlbCaJyTTK7MiC1Hk9lIW+spQq1MoQVy+xPKqawh40bHO0UCL6u5hBjFksKBqKClNRvJJMy6b9TpfIa9Yn7nlzZ72Bm2AR/kh2ctT7O8e/fR9c1bBnyCHoQkPk6GrwJZ/T+IGCam/UrT3LOT5MkM726kjLLD49ih1yP8feRHNn0mvje0mzQ4oP7gzjguhTIU9xNeEnpvumC/c26VGzeGbbLeiK52EqgAjRAlplYZGidNBuPD6EXLtTx/duJgNSGzSpWej4MTQA3rhXb3jG3EURNQUUpcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:07:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:07:48 +0000
Date: Fri, 14 Nov 2025 11:07:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove duplicate DRM_EXEC selection from Kconfig
Message-ID: <as3lydrytgncs3hhpeekr4geqj3cf3bxfddm45yqxci27cv7ep@i6li5klmxewn>
References: <20251110232657.1807998-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110232657.1807998-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: a3369295-f481-43d0-d7d0-08de23a0561a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5UnWI6uuypIrRccRstLY1Z4fVBtYgdWdSXXKYxv/fMZIfb6dnrg7bq/vMz?=
 =?iso-8859-1?Q?weeeH38zs3cJmoWdWvGYrd9GfqlxgKlwuE8+EzYtmTJenFLNBU4BJCrOmv?=
 =?iso-8859-1?Q?OGgL3I1FtrhFkroLLZNAJOOK3HHTP8cZaNEV8qv0ZJERuovSgHbtMeL+OV?=
 =?iso-8859-1?Q?Qtt5GDV10W0Jcg2FNSCvcwVZXJhxItBOHCN7I0EFGyp3etMANsUcbTcM0d?=
 =?iso-8859-1?Q?d+G0j9+incnP7lKTpr9NRl2Xwp50aSZZH7y03gTewbC0CB5FM1sPEyHkXW?=
 =?iso-8859-1?Q?jzbHwtZ+zz4n0eqgYm9RvzbujZXgO/B1ctKuGGAAJYJT1WUhosFZmqpTen?=
 =?iso-8859-1?Q?DJMVmr527BG2T1Er0weRhzIXRf2/ijAI5SCTi5AzllILnWhDMHoHNRFTOD?=
 =?iso-8859-1?Q?7NtHXkeEnVyyRh5jyMpQarvtgtTfIRxaX9+xWLss0ntMid6RX3v47c8drJ?=
 =?iso-8859-1?Q?r2VvAHV4DJnWH9c8I/nzYYIhcO6liVpIOPHi/tP8FOl3MGHopVx3I1A4fy?=
 =?iso-8859-1?Q?BztMAt9fO5/hj83hfzxYeEYrK2n8xLcD2Yi3RU4n34Fcjo4D9k/00PYVRz?=
 =?iso-8859-1?Q?lTbw6EiVMYFPpqnQ4LzPQlk+ZZejDotfG8Cyn/2k7ALCPIKoj/b1KH+FWI?=
 =?iso-8859-1?Q?mbtkSXPzSkYzzqayKildgFeUQysjHM7UDoqPPZCK0LODaMlAmV1UEx4dIi?=
 =?iso-8859-1?Q?7d2ySXRdnsOKgqQ7mElqAZCNFRVemFhcNLIVAG4AWbz6T/vMwI9l6yS4GP?=
 =?iso-8859-1?Q?bZNBoH7tHSJfX9gEJgLJ1nHg9WuiRIEQQ3oNu59R8nqHzKDqyTVUaxec3O?=
 =?iso-8859-1?Q?xHBugDOmMpzLATC3fSj9AUS2x0WohErSUIi3c7cUj6A3WieKl1pd8+RkB+?=
 =?iso-8859-1?Q?sHfx2ClaItgn19/ubHfb4Jgz9M/YXaeKYO9KhYtFqDotT45u3EU7Qr4DKD?=
 =?iso-8859-1?Q?TuZYGWF8Ioa05R8LGGT7/6NNlWGKomy006x+7eVld5rO71efRkRztXsm6i?=
 =?iso-8859-1?Q?AQ3E5Vgq2yvLFzxIf23cd1zGpo/kWckye8HyJ0VAqkTsSMT6ecuilkUuB7?=
 =?iso-8859-1?Q?k4swzfFK/fCw3Yt9dpX8FAiDGiZXd+s3fHWtbYpxTjXJsl0cj2uqM7eD3M?=
 =?iso-8859-1?Q?D0C6KX7E7EU/tOR+IK5a27w7NAx3zkO3l/2AJL0MmNdJVqRg/vdCPR+vL5?=
 =?iso-8859-1?Q?SpB79iasTua2UPUDIoycRIdOsR+XHaqMtJb+Butbz1oWSOwIeNsbfKnsVx?=
 =?iso-8859-1?Q?IeNgVVwKmi5XkGXD+T85PH6ucFjxeon+6soMHpzIX4Q97DqtOwB4JMDJFN?=
 =?iso-8859-1?Q?v9U57HQCvWTA9PduLsyk63DOTB6DaEzM+f3YJ0ZBeIVqldBiyn2tN+fOY6?=
 =?iso-8859-1?Q?I1K9iIDSVl7IlNNQA45zWXqg58IX3vo1jJXGVQTWKBD991foXSX0JasV/u?=
 =?iso-8859-1?Q?MToWyEBmj4u8Owd70HGjsEeL/skbgb7DUoAJEfO+/4sUcHaPCx/z6lwvSL?=
 =?iso-8859-1?Q?jhqXauTIssPgEehXeGIXAv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rIrr8WV1Nqz6+Acac/2mNuSi8vMyganahHOsx55wSGKrRABsO0o4kO4RMa?=
 =?iso-8859-1?Q?0tRMOVRSM3RYnoeDLhQCVfGnph+9lnG+4bG6Zf9sdOjACoOwkOvLo4voXX?=
 =?iso-8859-1?Q?arBgXwNrQR6CPOq1MJSIv6lNsuz7NpdvAjF1DAsI0CEqbk/H3lCo6rGuUt?=
 =?iso-8859-1?Q?tNv4Aw9b6xi4OmL7lw3rbo6NPb6Lkhx1s9afwFG9h5sdueKG27XptwpTA0?=
 =?iso-8859-1?Q?h3yosIaI6rcL+FZUDwJNpkfM4C2UFd8DL2Wej6MfdM+nqL15xPpuhDvkfv?=
 =?iso-8859-1?Q?OSe7EWREaY2iSJzIvNt7f7yL+JJu8GZv15xrZoamofhoXu/2bzCNOfI1fd?=
 =?iso-8859-1?Q?4mc5JOUYdRd/Lsawih/hZlkT8ZFwmr0RmR9XVYE7O+teLBupthD3m7seNA?=
 =?iso-8859-1?Q?yUkH13OXjW553Xdb1rElaD0v0L17cpCNtoWcNmqpnY3bZxTOaUDZ58ZgN/?=
 =?iso-8859-1?Q?ROPDQpzpb/DcpgsXo7LMfR05ewKAsOHuYdqsE0gaYGDxWZgwY3eR/iKBJ6?=
 =?iso-8859-1?Q?11dI5PFepDX5hxJouDJwUZ4Gm/0XwMH+E8LYVEEd66v8IGHtQSRTQ7jw7H?=
 =?iso-8859-1?Q?kKFL+S5GnGAGTkaGhVTL8nJ98wQ07i3FD18DaAs1Gu6fRAxE62oDXiY8It?=
 =?iso-8859-1?Q?chGz8ziYleJ9cgVwi9eu813CUEKjj4UtjXOr107zU4or1EPmNccivqW8E5?=
 =?iso-8859-1?Q?C5bG+TFJfg3BhVGs8/Z1ac5rJX3HlQ2DKsokDMldsFON4a82jZdhaEyIMY?=
 =?iso-8859-1?Q?dVeWzT/Y+RnRdFk20ocIFVSDl8OwlgpDZjaC7kFHcr+3et1rWj4+3UM81C?=
 =?iso-8859-1?Q?o3Hn8RpmKx2Itt/YYAE1t0SRy9tEKf2b+z1MDuL9A1yBz2j0PVQFxhqNro?=
 =?iso-8859-1?Q?5XyBcF7PBMzXBn1Bv6UHGM3xbJP5PvfiLO3h4mZkYVeqEo/FFu5l2SXMq8?=
 =?iso-8859-1?Q?INnkM0y0SngprbtCgZHENRep5pVV42TBKACnuICK3lSl6PUuPxsWW7rGwS?=
 =?iso-8859-1?Q?YimnZkX/gIdCeBaSIyJ1M5TfmE8kcITiTwhzXUH9RhP/HoAXmeweVHi3rx?=
 =?iso-8859-1?Q?Mb52IETTeqwo5jru0M0WDiQv/w/45W+uB6kMRfxcY9C9OBqImuiKTSnoO7?=
 =?iso-8859-1?Q?1p3TNdCZR3hRQtW8P22mNzRwp4tW15cVHOR1oyHYAT6zFSxZ/bIymZ3g+f?=
 =?iso-8859-1?Q?XOjY8l75U8B2HOAJNy3dsI/sHOTd2ZPNrGt2V4Jlt7FSdeAftytrHCafgq?=
 =?iso-8859-1?Q?9bBOwG2Rcf+zOvJBdw9YdFOdSez1k0ZvuC0bm1HG2pHntuPONgYSi0vqc9?=
 =?iso-8859-1?Q?rureTtsscjRPDKpTVTik/qMdBUx9/W938h1aOWeGBHsPvmq/50Z0M5MsrR?=
 =?iso-8859-1?Q?dJagz2nI266lSJbw+S1sxbL6HgXudxw+ml/PmuaDP1YpwAfZCfuk+6QQmS?=
 =?iso-8859-1?Q?BJc5p7hHrwilI73JeNXBrzHeeWtQfch0HuD5E6TdzjCD1Sr41wD/1azvwa?=
 =?iso-8859-1?Q?EnCMjpz1caDwaLXXDa7GPSw//lEXL6QrJnejlxqrRXkisqFFzydObfQ7T7?=
 =?iso-8859-1?Q?CO3ph5uREYuZBZ0CMQAdZYNilviLfx6fi2z9rUZDztHYCbRfRvqm7gPScl?=
 =?iso-8859-1?Q?R+4NBckoMYikmIos2uSmWfcfsxo92QToAuOsFJ87kV8uF7UuQ40lfbBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3369295-f481-43d0-d7d0-08de23a0561a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:07:48.6033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYv6nowaVfiNzbIoLe4t/V2Y91B2t7k3muwhhNB7FWAEz4pnnS59SmcEOFh7POwSq1u6jnnoCf75nYKUzWdM3Mx3+Ef7hl4ezotdVW38SL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
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

On Mon, Nov 10, 2025 at 11:26:58PM +0000, Shuicheng Lin wrote:
>There are 2 identical "select DRM_EXEC" lines for DRM_XE.
>Remove one to clean up the configuration.
>
>Fixes: d490ecf57790 ("drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushing soon. It also probably makes sense to sort the selects....
will share something on top.

thanks
Lucas De Marchi
