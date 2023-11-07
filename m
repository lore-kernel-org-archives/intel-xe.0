Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E07C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 20:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7B210E037;
	Tue,  7 Nov 2023 20:43:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5610E037
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 20:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699389828; x=1730925828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E91/d3h0f77AGm8Nu6TNA/Cc1fAWPAzzUSgiaB6fqTw=;
 b=JYDH2maf9GB1le+BOZy7hTjWnG00ExQtg9GtlJ7HBzTirqLHmriIrbsY
 ZvkrM9WgTLkxqbO76QTKKaqRyxCE/Nr2n5X/UZZBC3BPFWgiQ7lhH5NGL
 IFr+4cNoFI73Ud3gjik3zdsmxXzmKj77fPuwX02W+Vve0srwAKW5ccF1p
 dWr0tVeW9AecciBEzXXzFsLTEOIH5658u0yEuLfxKGI43B4fcHSH+3UKG
 Zr6xwa+QCdCvxYiJJOtKbMW1aTvKAlsRPuvc3wUBewiAbWuMnGhxQP9QE
 cvxqRmDBWE+Iworkb93xaUwZ3klVyoHd3Kya0tMyFV2+jvqxj50w8oPEr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393538529"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="393538529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 12:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762828391"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="762828391"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 12:32:16 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 12:32:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 12:32:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 12:32:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 12:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNOd3p16m5ZVMp6E7RkEre0vUUuLKVjBgh4E/ACg5zwF46cTc5cthcpQo5SU6hJPIsyVT/2cGzIJRhwzeACPaevxMb3chpR5MLnN6MrkyViQP8DCxPXCBCQfbfuYXE4gExDbFkxuZzBQFnFyrpP3NNYqpdNTkyphaZIInkpjue8PDfrSmNMtNzBhWSVLeVi+AoDxRFfEjMTg1xJ9e3L8Z9XpLOb7tzyPsEvaos+qZijSZoBcggFslL7FX+zCRfeS9F7wJ8UJMDGBjb1izyJWpspvDS/RVQWgPI80gpwCD0J4z7DgZxAewlM6X7NXxoWdzDZBExk+XC/XOzlIIne/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVFPURj4Xt88w9CzTB3q3J3AuMxXvgo8phv0Z+h3MKo=;
 b=oS5uKx4MTj3Q58KdnhKLsNabOD7hmyl8GnYjpCcpWUaLHFcmS5vynRBmteBxyubdLIuH1Wl/vGLJLvyvEy8DH3MunzEBFcaG3TztFaMm8mviFyl3FQnFJmfsuxmTe428j2I6w1MzOBi1DvVAEvPnesADj8bA/pqQrdfnBG9iNXYSOkO5ID1t6eZ0pZlvSiN/tn+ZUu0/SQxr9pDW+Upq79EaIVy1ThP3DM9alSobhdiMBBF+KoWkUGQzCmS2qMxvZqZhwiXKXTHxHz0oAXk071Y613SweVlbNgH8bXxUkE2Wy3wj0plnZ9Y3LIFm3W4ckpeBuI71aJEqxN3y63qVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 20:32:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 20:32:13 +0000
Date: Tue, 7 Nov 2023 13:31:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Message-ID: <ZUo8L4s9SMOiTB8Q@DUT025-TGLU.fm.intel.com>
References: <20231107193751.741119-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231107193751.741119-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a71489-c9f8-4faf-eb3e-08dbdfd09f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y57p1anUNwfaG39/0FfEEhgs2TY3w1P82BgObF/b5fg5X7PQsVfHf8hFZSYwM9vxjAaXMCLzwy/X/HLx8sH+N0g5X9ighTcjL8o/hkUlQ3HaV+mzSH0DW5xQMk9V2I8UEPP5zrH5dgOD56Unms02Voxp2p6BxHu7Pc29mIiMa05RNyjU5yZWUVQ+2d7MdVQot9z+M+yHvpvsy+wpDob0E8BYf3ZCmsm7GCxqZ4dINrcT1R0P9p1LmK5AoBxvECvM9olGUQa5Z28QEGTq0/SPD9ao8sHWu8b4gpZbWxZ4zha9Mrpd3Ff1TeNuMCTt3/525F778GT3ozPOqx+SI10KmM1UdVLaEhMBMOeYD4EEML5IQw94gw2hKlMB72Gz+7hXe8nqxGLf2NOCHvzAxR2DK28UF++bIaiWrYwLTaIYTBjZW3qLvDUq2NWv2zHrnEpHZYXpERPe1zdI7EFqVg3Qw3LSldX8nae//C8qoGpKAiP/JUWqBbT3UI7LSlw/FvMhMGuGfqQ13pl9Fc7dUo9XjWgZi4pRQVdbCZp4rAJlmwi6+bd/a8qxYKTpEyVKuVcK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(83380400001)(6512007)(107886003)(26005)(6666004)(6506007)(478600001)(6486002)(6636002)(2906002)(316002)(66476007)(66946007)(66556008)(5660300002)(44832011)(86362001)(6862004)(41300700001)(38100700002)(8676002)(8936002)(4326008)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cANb3SchmbwHMClIxblIVD9Ts18Lk0vgaAzYYdK8xuRfMa4iF7Eojwr0kR4H?=
 =?us-ascii?Q?DYhdt6++3I8+7B4F/FqjvJPfd6/X3QQkkcjmOzxbB5N2SkXhw2PwVFzbuKVp?=
 =?us-ascii?Q?9RFWux4Zf58mpBe0bKXBlwhtk0mYmGzsr6IvUoLY4IoBz4xwZos961LJ1Ysq?=
 =?us-ascii?Q?nKs6qmfdFEkK4n4kqFdGeVHH3d3cTE7agpMONXgEYXTb2a2B94oaVPY7Y5dE?=
 =?us-ascii?Q?3+G0uG1IyeYE09P22uBBCZjplWjRplW0tp6TuyQM2aaMObBt5JeNPKY7Hriy?=
 =?us-ascii?Q?5idslkx/5sDFMUxwEN8dhdHd/wBbSjMOVUyMpYRyfNN8WKz+gREQaUAAPCXK?=
 =?us-ascii?Q?T5DGHLcIooVcSXabYpkkHt/EV1Q3yxPc+3EhVHoxjYPJyVTFcKvXk8UYm2Nw?=
 =?us-ascii?Q?aMw5FZZD/p0XsfoocmixGv/276127rUUfTKHlcwALjqMO0vIkevIJ3uLVTCL?=
 =?us-ascii?Q?3+jRpm4aVnx1ngBaWSdJAunpFKP+UsT+G/8GegQOO7tzsbd8zFOC9Miq9hxc?=
 =?us-ascii?Q?pi7D69/e9qTkThESaBbo0pxWpAaFNOj0vF3KqLPxsY6WFNNCQbLqQfqhtCC/?=
 =?us-ascii?Q?z+6s6UU4WF4DS5n9hukDq8x6wIso4cmjgLpRVRMRdmqDk8DQzGej48iaLppH?=
 =?us-ascii?Q?Lg+oDXyM6D6ohEF9fkStR8p3ZIKTk7nMuplJ/Rx+NXhLjtBsazd2MD8iLsC5?=
 =?us-ascii?Q?tIe9kNBv8uWlzedizNTDQuD20wwyIPOy+iL9QCXx8lx27bOJyoy71kDZzdRH?=
 =?us-ascii?Q?Ddmz7hNVQ4YdmBMthSAGKnZTo55OPTwftjUZrB1cd4UE8Wt2CI9On0rENdGS?=
 =?us-ascii?Q?ylxKEEbF+CT9Frtj1Rh6+PHvqdTjqrWe3gHQaufO5tZ6iTwDq8ad/x5ukzcU?=
 =?us-ascii?Q?utlh88fNqichFiTDyljbm1mt1eCBde1ZhCtCvPnpJkHuDG9c9aDWKtnHTy3j?=
 =?us-ascii?Q?BDc76WJ8HXUjvP1DupwENrpaFNDRhu1MY4PbGuPVoHk8AarZOgi6wjcSiRyj?=
 =?us-ascii?Q?zDkNgdDmy1j/v9ytpjCXWvSCPqYnyUgngadkjYD/EMh+pFj78MBfQlhlo3mM?=
 =?us-ascii?Q?a3mDs+DJGzukgTbeHSzoQSb+9RRU/4rfl+Y6YQzraO2QDOH8LCLzOziJvjk6?=
 =?us-ascii?Q?Y8Ymccfu/JZHyR1jPHDz2y7eMjvy1gqr61uOgLJYnzazoooj1m07TeRI531I?=
 =?us-ascii?Q?+o8/MvUPgGM5VZYqdLdGvCYuvc9cc25fp6XqPwJuWncfX7WSCuiaiOrKpxC6?=
 =?us-ascii?Q?lyiZ+FgMPMb6CcV70PLhc+dRXUH3ea4YsZv5SWS0+KmrdcGaw/H9UjyW2j9H?=
 =?us-ascii?Q?RmZNIBXqbm/qYent7i6Cw3lnRlYUxSISZeCGGuBbDwJBW02mJZUO7nYHWyZZ?=
 =?us-ascii?Q?DCKrU56mYV75T+meAWuxJFrHjPCxYQT5lsVr9sucuciH0VHq4yIpC7Inx+NN?=
 =?us-ascii?Q?S7mhj74nd1tIRKHU4RGT9W+qxBjCYukBnCm5BdDO08yzdUX5yhQlsxuY2hZI?=
 =?us-ascii?Q?0eKk5mHCY9qK53rvsyOh/X6noVhEufFPwjJZsZT00kpThwE7me5TEWULTuRv?=
 =?us-ascii?Q?D1GbwY+ldoAUYeCimGlEYZ36Lro+9RT+NMXoOHlo5Ymi+YczpuYHMixYuuAz?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a71489-c9f8-4faf-eb3e-08dbdfd09f7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 20:32:12.7403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61SdYTxEjefvvh4gm++te+MMJiG/9T3UPXj5fIEL8WrGO0zK+jfi+nfSMAg6VtE/Jm0Lk6peO4A46VmSx6BKdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/tests: Fix migrate test
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 01:07:51AM +0530, Pallavi Mishra wrote:
> Pass a valid vm to xe_migrate_update_pgtables.
> 
> Resolves NPD crash seen with igt@xe_live_ktest@migrate
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index c984307560ee..7aad09140d7e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -236,7 +236,7 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>  	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
>  
>  	then = ktime_get();
> -	fence = xe_migrate_update_pgtables(m, NULL, NULL, m->q, &update, 1,
> +	fence = xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q, &update, 1,
>  					   NULL, 0, &pt_update);
>  	now = ktime_get();
>  	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
> -- 
> 2.25.1
> 
