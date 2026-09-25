Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D01C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 18:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9729310E211;
	Fri, 25 Sep 2026 18:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrotDITU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5710E2AA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790360229; x=1821896229;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tIDPe29ZkiCJOOJotyAsVMqBf6RZIvIF4POR7+Tg56U=;
 b=NrotDITU73kRNZewvV6Z46K3agVpHm+EwSILcwRfaGo2soU1BgGE9Eqg
 xn5VIpsKR+LFw1wUDxEEGD/7e7l0zOZ6TDLDn0MtDhd8UjGRf+LKmadaM
 CBqMwkpeaVqqO0KTBdMFN3/ZZY3AKQ3GFB0DfSpIK74KgICnloAnCRlg/
 lPqcyiJkLeUFW6GcPKF0oWnIaUER6lCnT5qVKSqkWcCPizpC1EEBsM/M4
 0cI0VNp2gye4OuRD9xbG9Q9dv+zaYjUKZTX65QQIHCxs38F+8VtPQLE9Y
 0qwltSwzYPUInwDpWQuefWGhqkek6LpoOzXrS/4nPIBjcG0mY+YXt9Xnb Q==;
X-CSE-ConnectionGUID: LMHWWLCuTzSxN94g3D2uXg==
X-CSE-MsgGUID: 6mqRURpZQ0qiGJSrhsTuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108644170"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="108644170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 11:17:09 -0700
X-CSE-ConnectionGUID: 56pPmokuRym7TRMz1RB3PA==
X-CSE-MsgGUID: qkSfFSuuSnmz6fSZU4priA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272541312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 11:17:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 11:17:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 11:17:08 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 11:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/8/2Cvsptz6B8S4CCync+/KdneuUGYPA2D2wrU52m5EFPB46nqxyom7t1lFbzLceT1JmhlFbyp43U5kGGM7zY5lFL7J7QpWnmBJggHdGW8SIQWh/K+Ih9bb8soBIJJmsWH1kANCfmIYZ9sWzdKIJ3ah/lg2JQtol1wkJej6EI2krafQEJ8WPnUqTuNVfAicFJeDD0yXgcy4TXjZ+U0gSFSbrnTXS2jWtpSksqZ+yG/X/Q06gTXxIncjixA54ziMEAesaeBA7y1MWZfOUci+aPnWoMyAbbG4d3RizeADyKYmVA/fNr2KFcB6ghmJmkJ3AlLDU6WdBSNemX7iMhbHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Bnmn+2VDkRcv7gdHqWIU5E21HHL3XzKH4/y/X49sII=;
 b=pkRTKtu5EBtPd4ZTyTIrCy/8MvLC5IkYxY5GGZoL4pdQiE+mhvflScvmV2e9aFJE9d9JVnylI3Rf6vjiSrK3K2VxbOsiwk3FLgxLaHx238XBNUOY2IzPi2gl4/YSJVC0h3MfNspCZPmKN1cZKfcwHM0AdmIAL6GyzZI/XiviXrLdoHvzKarhUXtkRBBZttgZnpPHD5cgQbNs5xMn2HGxUCE4WxdP0xqCaD7Clyf7ouGkZp0erqjOySrcewwX33cey3nW/D6s93nGdvV/z8Nwpzl/VFR8dzCfF9tC2Ufx5GrjgoHEAvbhFQuuHrUGqesFhtFdGMkVj9J3i/qooryMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by EAYPR11MB9971.namprd11.prod.outlook.com (2603:10b6:303:2d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 18:17:05 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 18:17:05 +0000
Date: Fri, 25 Sep 2026 11:17:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 22/24] drm/xe: Enter ULLS for migration jobs upon page
 fault or SVM prefetch
Message-ID: <ara6nyX17ARDHBnU@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-23-matthew.brost@intel.com>
 <d6c5c5b2-781b-46c6-8de0-69d59ccf7988@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6c5c5b2-781b-46c6-8de0-69d59ccf7988@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|EAYPR11MB9971:EE_
X-MS-Office365-Filtering-Correlation-Id: b39544e4-b788-4a6c-0854-08df1b3133f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: c/IFmhg1raa8zo/sfPa+/NV+6wRTjqDh1RHKObCYCC+EIuj/8Aw1dDGDV8mqnymnI/bEmVE9MuORTvtu8fBezYsYZBjuA9HR1ECYRtDamrRVD0mD8+Yutijot3tsNrMlpeG3GbwEGjbdrSDuh1bVuYkdE2kkV9STbyHGVknU7YDPaIpVyrvcLy5J6bQ6D7mH3OyGzrDpg+YW1+o9ThN9tcFX5QVW63nM+0aTB71OSlP8BPyv9GNtlRA2dxaG7oR+BucZzEmL7KFHRVSNPoAMQvlUOlAZJlF2/EgoOcUJUT38QbdTTopKljgM1VobtbaHt3muqpYX5/ta+DHeA91u+eUbJ/NB5oMf/0j2UgRBPwmmbKPWzrZdVS8e0iX+y9flEtcZRZ75f4q9k62//KiziVKo8wC8XYeINSk7GzK70kwLkcGztszYqwTHR/fpG6NMGzG1AaNst5sKF/uQFySZCzZW+RzsY5Rue71wwKZJQcd1l5v3VDhk0NcDaQn2xmmi38kkbE/PWtYmrlL0m74Z26tvdIU1aBgS31hXcQewiXijmDwxst2HU50MaDHCxHFQgh+dNOEte51boQkkHBwyTQ70xDnmUvTl4Tgmba4bmn1a1uYQrVfdzqrr/vFEESW2iWwjOwFhSn0SXxL5BV9VJF5NYI9W+T7OJHY2kNfmEDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OYoL2WSSZJgrJV9uDPd/yfxYmGojR3q7GLS6+AQOyC03tc42lT4U8ccDqI?=
 =?iso-8859-1?Q?HLbVAqR5xlb1Ji268Z5Vtd3m1fiRbdjyVQ7ZQXLGKfZ8nyrUmeCErstEvU?=
 =?iso-8859-1?Q?xvS87Igdw6C6vs9jzjjE8/+8wMGXFfndDTEY0NiiQBMAk9rS+F8+3wE2BM?=
 =?iso-8859-1?Q?sodIKMnP3eCz490SkhlA231TPh2c7uAMPbBtEdggfzAmfibKXxh3iFcD9I?=
 =?iso-8859-1?Q?J6m0jJP9Cb7lHetTUY4LcVVrsGXFBZnZdbO2y2XUVHWd1B+NBY9iRbVgYG?=
 =?iso-8859-1?Q?sLst3VGU8B7ubDnAxWvLaadVGHH4qomUOIjhaigUgPx0RwOAouQhVEvant?=
 =?iso-8859-1?Q?t4r4ZpswA2CM4FFyzD4BYHcghjJAvjTMdcLEM505KkmC8mz1bYjmJRC1lf?=
 =?iso-8859-1?Q?oUU9zOfz2r9qztpoiaueJwRez0f9my1ri80QwCv66yLWRzPjYigC6OzZB4?=
 =?iso-8859-1?Q?kAtLhDS0tph0t3tTfxOc0HoyNxTDXGRuv19lFvVvDgciuFr3kPIyS6XKlo?=
 =?iso-8859-1?Q?9P4PH679UrrOLOV2wnssvJrCubHNGBeOlOLYFc+Ak1yvPRqe3dC7nI30Ih?=
 =?iso-8859-1?Q?4mHcI+Ii5qZm6Lsr28HCgPIJt7w1mgDUKxfpM1LdzH5gafBUnwRh3jZEkr?=
 =?iso-8859-1?Q?bI+7pFI5Ki/YzWQvtfiGvVVHvo/593p4g5d2A0+XclMAxw7kGts9QsQIw8?=
 =?iso-8859-1?Q?lF5Y3JSbl1QDzSuviXSItub8Fr/1d9csa+XF0wDk10Phcu+9eFQksJIx6R?=
 =?iso-8859-1?Q?SPHiJVEdmeC+VhfZWv7yj0xeY92+TjUbUISOuVdczZusSrOJoZ66tn1rPa?=
 =?iso-8859-1?Q?6zQR1QaUrCfZqyhDaaiKW/MsQIMLDAmC78x3T4qkFD0onhXXBm6Kploc2W?=
 =?iso-8859-1?Q?aWUpE+EBzYtW6aF4woFSjLD1ezArOq1zZZ9ATC7B1rcrworCTTRvKOoU3E?=
 =?iso-8859-1?Q?3pq3f6eQURCN4j4upIGkfKLcGp2Unqy8cs/GLG7V3VZrOlTsyS39i+PZlv?=
 =?iso-8859-1?Q?hV2raX01TvaZguOsRU/M+jwM48QVLhVfW1u3qLP5p4LA+kg5hMN7hufn47?=
 =?iso-8859-1?Q?MP6+eb/AvpFF+rhqQ3Bg4lmapm99W5YyMdIGzEBNyNkogHYzaw7YOawGYy?=
 =?iso-8859-1?Q?6dDqSLu5AFc5XWv2N9eWJJ4YM7UCSlPybdyPkwgpKzBVGRpDPIryZ2wmNE?=
 =?iso-8859-1?Q?OWoGIB/BUZq2OSr14gyalqZjU3mUY5rYBmNkjOiAHm6XHiIzLY7HTXdt0Z?=
 =?iso-8859-1?Q?7fhAvxMvyAmLY/X0++3aK73c3/b65O5ZjzDYUfQLilsH/xehSbmJpc0oqO?=
 =?iso-8859-1?Q?mf8wF6Z/WW7CjkEahW4lM6eWSlqsNQ/1+eFYEuXlJounCCSnwZC6xuyG24?=
 =?iso-8859-1?Q?AXaT7ZkemAQyArXyAzFPLvSMnEjtvT0VIj0wYh2suMlVsUiIipmdpgh5uQ?=
 =?iso-8859-1?Q?Zohx2DW6//pnFqARuwAX/yKhlVnAdbFxIWCY1OBsGav6zsM8oBoPOfEr7J?=
 =?iso-8859-1?Q?p8LRXXFfc07hFihO4SJJKNtBIG1qfaJLUj6VTptfIaqi0hAJ2/K38050+t?=
 =?iso-8859-1?Q?zTBSHnPs2SCzWJgPSntwToLSohVkKGterrGrfyrDVldzeu7C8brleLPtq4?=
 =?iso-8859-1?Q?0aBkcMUSWeiqiy+b4ZBCVYW99MszQQl6Bughl6dPHVYHhC3ppI+Y1nFdU/?=
 =?iso-8859-1?Q?J9IxuicaOLh2mIN/b51mWsdqiN+fUOorpXVoJxqSfsSy9K15FDudzmuFBI?=
 =?iso-8859-1?Q?iv6pdDmxkr8Q0H+eNYUjqFfx8740UkyeuoscESp3bXNx4JfJj+ZyFRh5Da?=
 =?iso-8859-1?Q?BYqDqeudEwyXjc1ZfEMDDt3Mhyrld/o=3D?=
X-Exchange-RoutingPolicyChecked: ANcBswMR2VHTgu8obyrkXURZNDgUmzodF1CGT1Y+oqcaANu+RvOjHYWFg4xFi8omtLjP7Jpz4HBpWIVZLJDEB6cc5BIQxB1InbTwvZ1US54+gqSbxOiXVvVbQ9G5AziIlzRAXvmeQtLJTbWI3aHNVi9hoROjw9H2UvRdckQoFbiXFd3IH/LATlIjD8ljzRRSzcbLQjG6DKr9Ii8vSEycSEUjXi7d5ZjspLlOfCZex5lcmm8ku/msgsPpEWkh6SKwOJZQzBtqJJ9S3aJIVv2wrhm5vFXmBBh4G6kXIT2inJDEhos/MEPUQBR4xEB1j3RSw0JSd5tDBDEVMvnIvN6aFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b39544e4-b788-4a6c-0854-08df1b3133f5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 18:17:05.0417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOPd9mxiMlgNMSoImnXp9gKrXbSRplR3isHtH+mCUYaKaDBtwBGAO2pLaUIcxMUVUKzZbJ369BH//UGPZF++rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9971
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

On Fri, Sep 25, 2026 at 07:49:43PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> I know this has been reviewed, but can it be changed to have xe_migrate_ulls_enter + xe_migrate_ulls_leave?
> It decreases the amount of pingponging with debugging enabled.
> 
> I kept below patch in my tree that did just that, feel free to merge with this patch.
> 

Ok, I see the potential races where before we get to a copy job in
either prefetch or a pagefault before the exit period ULLS will disarm
itself - I'd hope within the default of 5ms that would never happen in
practice as 5ms is a *really* long time in hot paths (prefetch, SVM).

Is this the issue you are seeing in debug builds, I personally have
never noticed this but generally run with perf builds.

Are you using ULLS somewhere else where 5ms can be hit more easier?

Want to get a full picture before commiting to something.

Matt

> Kind regards,
> ~Maarten Lankhorst
> 
> commit 6beeb2f7ff909bdaf9f8b1eeaa014cd15a65c78b
> Author: Maarten Lankhorst <dev@lankhorst.se>
> Date:   Mon Jun 8 19:05:46 2026 +0200
> 
>     drm/xe: Keep ulls alive while servicing ops.
>     
>     Instead of bumping at the start, when performing a lot of work ulls may
>     run longer, so keep track using a refcount to keep the full benefit of
>     ulls.
>     
>     Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d28da51d71452..f0b6641dd9815 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -58,6 +58,8 @@ struct xe_migrate {
>      struct xe_tile *tile;
>      /** @job_mutex: Timeline mutex for @eng. */
>      struct mutex job_mutex;
> +    /** @ulls_used: How many outstanding ulls operations there are */
> +    atomic_t ulls_used;
>      /** @pt_bo: Page-table buffer object. */
>      struct xe_bo *pt_bo;
>      /** @batch_base_ofs: VM offset of the migration batch buffer */
> @@ -475,6 +477,8 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>   *
>   * If DGFX and not a VF, enter ULLS mode bypassing GuC / HW context
>   * switches by utilizing semaphore and continuously running batches.
> + *
> + * Pairs with xe_migrate_ulls_leave().
>   */
>  void xe_migrate_ulls_enter(struct xe_migrate *m)
>  {
> @@ -488,6 +492,12 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>      if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
>          return;
>  
> +    /* Bump */
> +    if (atomic_inc_return(&m->ulls_used) > 1)
> +        return;
> +
> +    cancel_delayed_work_sync(&m->ulls.exit_work);
> +
>  job_alloc:
>      if (alloc) {
>          /*
> @@ -534,10 +544,30 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
>      }
>      if (job)
>          xe_sched_job_put(job);
> +    mutex_unlock(&m->job_mutex);
> +}
> +
> +/**
> + * xe_migrate_ulls_leave() - Leave ULLS mode
> + * @m: The migration context.
> + *
> + * Leaves the critical part of the migration context, it may continue to be enabled.
> + * Pairs with xe_migrate_ulls_enter().
> + */
> +void xe_migrate_ulls_leave(struct xe_migrate *m)
> +{
> +    struct xe_device *xe = tile_to_xe(m->tile);
> +
> +    if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || !xe->info.ulls_enable)
> +        return;
> +
> +    if (atomic_dec_return(&m->ulls_used))
> +        return;
> +
> +    guard(mutex)(&m->job_mutex);
>      if (m->ulls.enabled)
>          mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
>                   ULLS_EXIT_JIFFIES);
> -    mutex_unlock(&m->job_mutex);
>  }
>  
>  static void xe_migrate_ulls_exit(struct work_struct *work)
> @@ -599,8 +629,8 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
>                   ULLS_EXIT_JIFFIES);
>      }
>  
> -    drm_dev_exit(idx);
>      mutex_unlock(&m->job_mutex);
> +    drm_dev_exit(idx);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 2e8be10fdb71f..c909e1afb476e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -98,5 +98,6 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
>  #endif
>  
>  void xe_migrate_ulls_enter(struct xe_migrate *m);
> +void xe_migrate_ulls_leave(struct xe_migrate *m);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 782ed50a2a43e..51b2cb8fdcf1c 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -315,6 +315,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  
>  unlock_vm:
>      up_read(&vm->lock);
> +    xe_migrate_ulls_leave(gt_to_tile(gt)->migrate);
>      xe_vm_put(vm);
>  
>      return err;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a1eca4871175b..fc9f587a35905 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2557,7 +2557,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>                  if (addr)
>                      goto alloc_next_range;
>                  else
> -                    goto print_op_label;
> +                    goto ulls_leave;
>              }
>  
>              if (IS_ERR(svm_range)) {
> @@ -2598,8 +2598,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>              if (need_put)
>                  xe_svm_range_put(svm_range);
>  
> +ulls_leave:
> +            for_each_tile(tile, vm->xe, id)
> +                xe_migrate_ulls_leave(tile->migrate);
>          }
> -print_op_label:
>          print_op(vm->xe, __op);
>      }
>  
> 
> 
> 
> On 9/25/26 06:53, Matthew Brost wrote:
> > Call xe_migrate_ulls_enter upon page fault or SVM prefetch in an
> > effort speed up these critical paths.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> >
> > ---
> > v7:
> >  - s/migration/migrate (Shuicheng)
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 3 +++
> >  drivers/gpu/drm/xe/xe_vm.c        | 4 +++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index f9e5bd41cfd1..f219e9e3b73e 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_gt_stats.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_log.h"
> > +#include "xe_migrate.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  #include "xe_pm.h"
> > @@ -281,6 +282,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
> >  	if (IS_ERR(vm))
> >  		return PTR_ERR(vm);
> >  
> > +	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
> > +
> >  	down_read(&vm->lock);
> >  
> >  	if (xe_vm_is_closed(vm)) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index f66bd1de2b70..425c678f4480 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2528,8 +2528,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> >  					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  
> > -			for_each_tile(tile, vm->xe, id)
> > +			for_each_tile(tile, vm->xe, id) {
> > +				xe_migrate_ulls_enter(tile->migrate);
> >  				tile_mask |= 0x1 << id;
> > +			}
> >  
> >  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> >  				dpagemap = xe_vma_resolve_pagemap(vma,
> 
