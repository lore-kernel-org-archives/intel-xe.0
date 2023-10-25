Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795EC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 21:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12D110E5EA;
	Wed, 25 Oct 2023 21:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40B010E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 21:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698268058; x=1729804058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aPLKBMHNMY5mrmJpNUslgpiviaP/a/aKZstG/OspQCc=;
 b=bzhG53w1G30l/U0IdBZfGiz6uNd+mSCF5/K76n9bHeY/MrxqcYHFX8TG
 3wBmolI1q6W8tzgn7f7BOg8x+uVjT6ng/5Ch5paQ/h2nwarop1yDURIkn
 v2S4dluLU7ceDLiHaTKnYp2bYsn56sLpI38E5ECnDnttuXWRuzrXrn7Sm
 X+gmtgcbhXlMOJskv0nDlKG5WCtIva1L44vSgcU5fkk7tCYDQafn8pB87
 kV5zOxYhF5RQolLY00oH2hkAJLjtwsbDWsa4AllyfPz16G7vD2EzIRFnX
 ZVD1seYT1gpgpQpvAjxeqA4O3zkAJbw3VbGC09jotgKXQRvJY+m0iB0qm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418523353"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418523353"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 14:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932502738"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932502738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 14:07:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 14:07:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 14:07:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 14:07:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 14:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlGBYO9bnulL5h30aQQgovxQEsPpzZ3XfCfW0ovLgpNWls9oo2SaEKD9hXT4LSDNijf1krepwVylg9q8W/pC9SUdqGJtA/1mNixoOup85NSwssxOjGKHMDVAjgOov8CGgZbagqZyLFDh5sFMSmXUgQOeLVgIgjV9WBCDJ5j5mGZTTQK8nvp/W7rGQfPUKeNBuq+fkZnQy/iRtUYfOdTRcIPhxN49xvHqdyim1NFSm3zrj4FcJQNwasVvJlhHzh20HON7GyLrU1i/bvok7Kjdd9LQj5n/k4YERVDldaF+f/pJSfTqdZSC8NUBAZtJUdHznXu8SlN2U4Zif9kZOuM3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kFl2qUzLNzdPuiQ+QYjLSDh3v4YTsP2Rf7QMwrre4s=;
 b=fjWCYFIn0B6O6F37AoFdtAOty3RzXDXtsG/B2fGJwglBn+wvT4hXe8ss5pi+2+gYaIRUjhG2v/Bb6iJDHUBqtwW/AJeFSfhcNA3o9LS07uWhv1KNaVw5BhbhzmK98mJouZS/bU44D3RSFO1UpOfSx6rsPAIpBWUrEsGXuLkeZBd8G3X3dcUrxVdQtTvKCMxxcsHrpRsTOCxnJWUVSbWe5756Kfqp9vA4QeQxsP9D6YJ6E0Sy80AeIrmozhpfvU3PJnloMRDW/3QMghB7ZQCi0EkPpjZihYX14BO/4czPy3A0H1FuNlO3CHA9g+supURVZtVlj+aFJR3r8bqu5aKgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 21:07:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 21:07:33 +0000
Date: Wed, 25 Oct 2023 21:06:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTmDR54qHxBlXPtm@DUT025-TGLU.fm.intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231025173937.197744-7-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dc7b30-3bb9-45ef-4846-08dbd59e6860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITkOQoO7HnheCyseTwo1BTkQZQdseoJpa2lqU5JYsAMaVw/fSC2NyhV1TNY/Ev1Tab6G+7B6PCes+KXYnUgoc91r6BIf+PXA+oxj/ICVuWJagc3xkoCH2waFeF9DPbiIT6cNn9lw0zN/jVOQUXB1WPra0apm8pKLm+sRGPcS9i1uv3ELI6i+eez+HhhFe7hHfugcIX1LqE5Ec9ZU3DsHh9cZUwM1RN7JpJBJyVZ/44vrZPL1Lbq4G3lZDUKdODS/c9spaMXOTUA46Zaf2C4Cko7CLRCSUUMN2uO3MgM4wZaLh3X7pu8vZ/wGjo5UNHR08RQhKU0aEbwbJ0Di2RCOkEGlRg60tv2o3rt3RuEf9lyypmLM5BIgmCAJnUDdANhbErzHoBIfIg4cwJEh+symJHx2z+knlLaY/eXiWghxN3+Zo5U5gBw3jV65vulZF9GEICyURU2pHIXK4P8g9it6oGoFIuy+7DnktboMv6hPtkRD8g1mKMBl1jx5ZxWALzO6pZxvDnCotHdckvdkdqnUpd1bNs/KgbmvWpAOJhUKtRPSgU/pluIYPYqsQ6U1U3Wo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(41300700001)(86362001)(5660300002)(8936002)(4326008)(6862004)(44832011)(82960400001)(8676002)(66476007)(66556008)(66946007)(6636002)(316002)(478600001)(66899024)(6486002)(2906002)(83380400001)(26005)(6506007)(6666004)(6512007)(66574015)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OxiJqYJLD5PGP6G+cl8MazIgPvvQQkESvjcqOlzbZrPB6KQwhlIyc0puS0?=
 =?iso-8859-1?Q?O/JBJG2fPpDfb6OJzEuhzEnIElHn+o13E8QgguvsjMMb3ebl9qprPKs6C+?=
 =?iso-8859-1?Q?psWOsaVNuz9hU3IcKPx/4Jg40+unR2aCMdOCD5nP0awSLjefcWOq4KfwlS?=
 =?iso-8859-1?Q?QPVxN6/oi71YKkgpt1k/RHUnL4E42L6MJmxNtYjdgDkKp9DiK+IiP6wpZ3?=
 =?iso-8859-1?Q?iEC0wKU3d/x1YIEDeIUam9zPmlBI/IWnAYonUD/JEXCTWTA8QgQxkOkJfU?=
 =?iso-8859-1?Q?Sfs4q43cr4yNSt7KY0y+Z25AAu/CiZb/rMNC2jIkcb90ghqHJwYRwZHF9V?=
 =?iso-8859-1?Q?2wOgwPOo45pneiuMupIDY95u2jyoG0k8LiDlkhIZyDUQsbCLpmcwtTRMzJ?=
 =?iso-8859-1?Q?c+25B7rr1XLl9HhO6mmFeu1nYBzDLZDgKdbxJLowbL0saUkSgbYbr1BY7D?=
 =?iso-8859-1?Q?yDRl7fyAWYmyX7zwprTLz8/qPdOH97+lSHC1NT8kK7Kkkdntu8lWs0BnC0?=
 =?iso-8859-1?Q?8+aBoSd5I2wa0lTzyR/usdZ2kqgo/TzC1ld+2AyVq5foKyG4ad5fUvJhZS?=
 =?iso-8859-1?Q?6Jya4BPKNoNp2Cdlm/JYU/F6F5/2IJIoNgmni7cHhM/CaWoaegxXnEVaXP?=
 =?iso-8859-1?Q?pciLSwpyiL6TcxI0eKvpsYJ1PlhRmlW3M8E4o6t8kONrS173xUkPPw6JB0?=
 =?iso-8859-1?Q?xaSxAwWljaEYFlQdTewsHxKOy2MSTqxtwtziCo5/+qKxzj3dvKIOkGZvRO?=
 =?iso-8859-1?Q?xsnH58VzW7PWLdPOkOm3/SQ/nKtAIS847eiW4CZ+b8VPJ0wknLUu1QXRlA?=
 =?iso-8859-1?Q?Ws7Yx7Zc9oRhFLq42VkAHTNAkJw3Px8TUe+8hIrR7qnm/llzQgRFvcgVZf?=
 =?iso-8859-1?Q?3rKBekqI82gTa8oYjGG3gpo8WtGsRPV4qxPY7w2QV0VqQvwlUQOSGT1Jip?=
 =?iso-8859-1?Q?k5kiDanF0go94IK3+IQ1Z5mOnMzagh2LObdQZMvD+dNxpqenyQvxxzt9n5?=
 =?iso-8859-1?Q?38iV4mM4l66AR5RKURwnoZAueu01F1DOkz4er28mgyeDxQg05tHmPuK23c?=
 =?iso-8859-1?Q?HmygJ7ev6ANFcCu/LlVApMrOOQBVtwAjCmAs/FSPNKn37e19qgWKx36MNP?=
 =?iso-8859-1?Q?pLtLcW9+lVCKiDksycTc2lo2epHkYP2UNt8RNLXPgmapwnIfnk9Q+cVMn7?=
 =?iso-8859-1?Q?Mqhgvn1GERuM8ZaadPyRiSzQWfOy2Bsjd8uQ8rrktOyC5TOG+XOXa86u3T?=
 =?iso-8859-1?Q?gaSonC9irwA1YvYTkQNzvjcGesT0aPXjRV5AtnjaZBInmYDLamGKNM0/uN?=
 =?iso-8859-1?Q?XKoCBNi/gQGl+QK5BoEDdW3PW3YfKGkLqAG0NXuAfJyHUNhWFJjxRH30eu?=
 =?iso-8859-1?Q?uOj1SySsasX2/WVXizp0UrTJU4UQSiOJIeHLLyOaWfN7dZf0/I3375pcwD?=
 =?iso-8859-1?Q?SIAlLb1/SVysMhQkrWRoHpHWEBt8y4GcTzCitWa5E5XVVOlq9wo34VugQv?=
 =?iso-8859-1?Q?2QoMsnckI5C1GtYfWTpcO6jU18AjkvgLlumvPKFZPPCoRnnxQIlj5L6R7X?=
 =?iso-8859-1?Q?66AubIt1ONKCpqJuk8C+1SFdNRXE23h7RwPhdkWOzS1vMgUiEKHh3dq6SC?=
 =?iso-8859-1?Q?uYWMPK3aplo+svqhDPqs3/ARvN73bM4TJvSCp1mE3CnMHPtvRhvmIIDA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dc7b30-3bb9-45ef-4846-08dbd59e6860
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:07:33.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zS6i5VXzW6v/f3N8zAZFaBNXz3gGiW1itA0kXgAKg8TRRZoz5vXpbvNBN26v3aEliyr0boZHtP5+pz661zkRZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/bo: consider dma-resv fences for
 clear job
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

On Wed, Oct 25, 2023 at 06:39:40PM +0100, Matthew Auld wrote:
> There could be active fences already in the dma-resv for the object
> prior to clearing. Make sure to input them as dependencies for the clear
> job.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 009d728af762..896a6d8398ea 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -980,8 +980,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		size -= clear_L0;
>  
> -		/* TODO: Add dependencies here */
> -
>  		/* Preemption is enabled again by the ring ops. */
>  		if (!clear_vram) {
>  			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> @@ -1010,6 +1008,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		}
>  
>  		xe_sched_job_add_migrate_flush(job, flush_flags);
> +		if (!fence) {
> +			err = job_add_deps(job, bo->ttm.base.resv,
> +					   DMA_RESV_USAGE_BOOKKEEP);

Hmm, so if the BO is private to the VM new memory allocations for VRAM
(triggers clears) are now staged behind the entire VM being idle (e.g.
no execs, no binds inflight) and since this is a kernel operation all
new VM operations are stage behind this clear. This seems very, very
expensive. If there not another way around this?

Also on compute VMs this would trigger preempt fences which would not be
ideal.

Matt

> +			if (err)
> +				goto err_job;
> +		}
>  
>  		xe_sched_job_arm(job);
>  		dma_fence_put(fence);
> @@ -1024,6 +1028,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		xe_bb_free(bb, fence);
>  		continue;
>  
> +err_job:
> +		xe_sched_job_put(job);
>  err:
>  		mutex_unlock(&m->job_mutex);
>  		xe_bb_free(bb, NULL);
> -- 
> 2.41.0
> 
