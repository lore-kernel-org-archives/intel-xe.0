Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A99CA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 17:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5C210E2E6;
	Wed, 30 Sep 2026 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgswkVmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11B710E2E6
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790789081; x=1822325081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lv/rkBRb9rhp7LSbet/12SsOiZRePs1FN+bRxenuKHs=;
 b=LgswkVmyznlqGhd8SEZ1cHYn0UI6DmQW5hZbT0wTV8ncBkNm9EfdfVtO
 TBQ2IatsnvOVJCFgEl9xRdlO/8LD6an2MGwVTHAyDyjNNm1UGzdqslyB6
 clBfQvqaIKgkHXQdzyvAh5H6wMQsaIZQbkMuvqoy4wuD/VEjZurcU59dm
 vznUgB+m2apk+WuxtHaPOyiF6etJUBQrqy/Ju/dpraA9caqDFSPOLRHo4
 +Z8tibyL4IHEXkiBablltWKIU+u/G4w2yd4DB8ts7kX+uvQ4wSzFTiVX1
 5joOm7HQEM6n430Cw8uvOP14IAkQk+fJiLIlqKZual3bH3sBUnwmeTvr1 Q==;
X-CSE-ConnectionGUID: TrFpOToAS12Wv4UQMkRO9Q==
X-CSE-MsgGUID: 4yik02TBQAOa+R7hVWNkJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117060212"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="117060212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 10:24:38 -0700
X-CSE-ConnectionGUID: SnovTorQS4mVemBq2F/Yrg==
X-CSE-MsgGUID: 9yH0UAMVSbyTc/ukx//qgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="283822073"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 10:24:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 10:24:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 10:24:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 10:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rjigq1UU9MPNgw6YLS66MqQ7a67rI6KQ9yvDaKOkhBtCSxQhrHxLkDV2+5JjbdGt3X3hmNu5mR2D4SHFyy8x3cBwMhqkDnZgn+fVIIIGLy70+iBKgtQ98Hnr3O/cNKSBKL2I3cDcRxXoY8B7KTtN5q0tjAm2rqKznlhw2Txe3+1EM05YRWmULDcb9NE4e3JBhe/lbtY1ugmlanSBE2w07kDkvjH3HLo01vSh1ZFzGq6+c9M69yIjLii6BxzJs8Xa+N0b+8w+CVCmFmWm12deutZj4Nv9AhbIWLZAvaDbjADYVI8QRs1/1lRF7/cPN7T3yPfx9LcBS7xsNQg9Bx4ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmSEv4EQK0+V7eP4zKK3r3LlPKKkNCOEPgkWncgAHnE=;
 b=xCb2n7RXFuwhZM9E0jae+vWnHBkfiwRAAtchdJudQgbMbEC2XxBVSELNzss9fokFx25TV8Jar/1NSvmuPGDd6YxZViS5QHb5N9wXvxQL7PRKs05vX2HAc23GQPASFGQvsfT5Llhq3G5rKSD6FCKI0Hm2XGjzz2xDNqqIOjVtXLS1asXwCI1nOTgizQ1jf3h8tPXYKANxxa2Cif/oYGDpsZN6w18K3jY0Xu8kgf9MxNOpPTDdiN9mHf7/JOXhIPnuXGtPLviMuSqgubCa8ULAr99sJ0Dk3VJVR3zQXAZdQi0YGMp8G0/3cGPVD5hox30QNMzdDx6BJfSqvvBojR917w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 17:24:35 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 17:24:35 +0000
Date: Wed, 30 Sep 2026 10:24:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 0/3] drm/xe: Fix ULLS chained job loss and GT reset replay
Message-ID: <ar1F0JjTvnH1vOQ+@gsse-cloud1.jf.intel.com>
References: <20260930094031.3365707-5-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260930094031.3365707-5-varun.gupta@intel.com>
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc55cc9-7c98-4efe-3013-08df1f17b28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|5023799004|56012099006|11063799006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Q6ZUYneoUUELiYYtFC5l8bZnWckCrUuJg6AnKwZQJiGtBE6kB8dS/fvsa97HKhXaDn/5ra5bP8L2YbAfZJK3fEbZHLjUoetXnCF6cXmo3gkFGfbJ+w2zw9+FvD6MqjBQhVqe/u07UaYNR3nJrD9P1ZXAmrxJSIQlnoo5qT3T+U3KboXCad4dp+0yu7F6BIfDWebjqRH65SSmQUsm+GwacBSN7ccxr3uPwXhNSNb0yrv/b67LmZiDi5qoh6sR7FUm/B0sGNXzujDIIuygK8EPaxVHlcVKBkLqQrYq9RlAul8bJ5fkYAiHfXf/kVfbSu2awRYRQDHAcBFG/K9es6RkmrsKW2xFa0xeuPzkCQpfszLgchA6yGf+ZRJnaBv7YSLjF4n0vjFCP01k0ddPH8v7BFzImslx/FHmeJezEcT66gYIw3yjp8fX7Yrn46edrGjUFkFzIcgvzJ6k6qJPlqVnOEpkUPzyCsa1AaaEednsQ1SbmQ5GKXKplAT0bBcp5Oie/ci2bCs3+dG6z8aSE2u8V3tFtttCD4pVFPNojTDl9/wwzZGhndJEDUdVyEoKpBwDy9aE4DCMuL0OmFe+WU+3KJlYPD6SYQll2Xc2dWvaKIFBJ+Ds4V/ONO99d+dnYZViuI5/6lLuCkShH+dNvKZiFQV7Mx8otZE7v6Gy01sBMfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(5023799004)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjiIS/SBJah3JJUSm+AC91bNoJ/S2bYfHtkpI23qOoYqt0tpjOaxPj/179Fl?=
 =?us-ascii?Q?4+KJyytid1/byG6li5dgZhrWGS1Ee/t4ZRU6NK17+xs1AR9OszDdz5co+Urd?=
 =?us-ascii?Q?l0fpUYB28EYra1/QDTkXcKXHoDHsJ5EeZSzv6JYUon6lxu7gWQkihhYhp4cr?=
 =?us-ascii?Q?i90qz4aWD96a2tIqj+JGM305I2gUJ6IouLfv6+riIzPxlIA9j6gwvMlq7kFO?=
 =?us-ascii?Q?/KAYqRIHH6v8vLWJCnqT83pC3v+9tXxBCNBqA1VDgZw4sb+dGUF9Cgo/aGzu?=
 =?us-ascii?Q?jO3z8WLu4KqS8gVfeFU272/e/Ro0E+GMlqNwk/N3WLcpZjwvWnwhwOMK/7L9?=
 =?us-ascii?Q?DwsUuvySEd2tgN83K5bWqss4T6i9kqdib4EvXdvuKV1jsjll/PEwHBlv+n5D?=
 =?us-ascii?Q?GLAU9f7TRGFYLXRTVXIwJry03tNG5J4wZca9f7ir9ns5eg8jDgPqOak1LUUP?=
 =?us-ascii?Q?4l2yI6znY91QL0yDtNH2IFxM3i+Td04badymE4fCJfmCkQ35kHJ7IEbsmZY6?=
 =?us-ascii?Q?GcSbO2IPVhUgQyvhj21WSRqo5L1ltnQCf6OzGVpmishsrKueLlOWnQ1hO3MB?=
 =?us-ascii?Q?LRT2FisF4Y+fRlsw9qfPOxnETyjOMtAH2SUU0jR2F1nPgxv/SJSB5SK1BbjJ?=
 =?us-ascii?Q?chQw2Xge8LUrlWtWhKy+czRCWzhIBiXIw+3RgsX9j7X/7hT2rzMk69il/ZbX?=
 =?us-ascii?Q?F5gzdx6Dsp81FyGVpgO/RwS8I48xXi2crZw5GQ83kBMb/lN1DAJFsAdzxWy+?=
 =?us-ascii?Q?lwmGqeOUCr5EM4nY+KYw/nBcUjMzN6cgBRwt1nvrwuFRAMyh4JjDAj3njKcO?=
 =?us-ascii?Q?15nIhc2wj5bJsmKAiu+QPtsk2SAgwZuN+gx0vzIVWy+9xEALED6qdqq5/2gC?=
 =?us-ascii?Q?00wYtjwLudgbnfHOXNUXhkHG9tULD9XIvszlImtJeD998JKaOVYofAh2HbkF?=
 =?us-ascii?Q?fx7ie9d4Z31ULk1ljOWQz0Vqq1YGRWecC2BMI9iPGsIUBHJCcme1GA96LYND?=
 =?us-ascii?Q?+5PMFnKZZMI/GoI2MKt1vSJHVAnnmSWnjhAR85uBff9/u5c7hbW3X3RfPqhR?=
 =?us-ascii?Q?pey9L32KyZiwNyWe95a2j08qMzR4DGFy+FoUgxgWihnckm/yZMxxhElk7xYK?=
 =?us-ascii?Q?EPDBXVlD1zs3kYcvTF95oEwTJNWV6TDF3K9gFqwE3fbuJXEd4PcOfVPdBrmt?=
 =?us-ascii?Q?gK6jNdcHb5GwDbddiDTYpvnvQYqqgbKv8NUNUIytvObvt6FkJ8HXrl1Pyqo9?=
 =?us-ascii?Q?El+aJB/aqZDXc7FVJ9Sq504hI0/rj4FSgvWORYzW0PjSekA83ITuWpZ5IjxX?=
 =?us-ascii?Q?yMwT431UBuZjNJfnmgBUMgzvoaQg6SXN3Aak/LT7/MwASfV4AsXc1Cp8J75j?=
 =?us-ascii?Q?ZWdw20uvqiDpHpvKKtiLf7ZJnGFImdatK0XMZZXEoGmJQ61a9gL6WQqv4GfJ?=
 =?us-ascii?Q?9wcXddvJPtHUt5JwgBbkJIUJm7hlSlxDuRjYLMhaw9FQ2e8ndLO0uf8/841/?=
 =?us-ascii?Q?g3y+wSCixW+mXm5iA0xQdUzkqSwstdEihWdDcPKYOLwDPpINA4uqPzMHH1/5?=
 =?us-ascii?Q?qdW0tm/kWbKH/8B1cp1TXqAZnrjDRrTZBIVrIMEUciI6Oz81FkP/GFX7syib?=
 =?us-ascii?Q?1W1caQ9Y6MaW1+cd1TIt3VIBMsB0ThY+T/LJmbQmoC/m5iNUaOs7RrAcLsbo?=
 =?us-ascii?Q?6cnLFpnAj30qZrFmny9FUWvRoLioJQTkqWTXCV87hvUhBhVsfV7P0K9zZFyX?=
 =?us-ascii?Q?UDqtVJ3JsX7cgtXmG+dowLcdK/Mf7tk=3D?=
X-Exchange-RoutingPolicyChecked: JdFNbEXC4SI6boQggmLezlT1rhOY+SCxxGQIzHVCc6mwKp0mmmq9VQVDi3zpW/mrltgVk3vsCxShfWxgEEAjF6gwWrVgW3c7jg5o+qBOxuqgm8ZFzU/uxBSwxgdo/ZN4sMbnEDoC57v8rX4sGm+G1iLVeAkmi/a9h4KINZ6wV5BdlAJQw3K10lQt+LFNO7LggXAotA1brYmzw2glWs2CsFgg6W8ptRIAY/PBZjI5hRv1jMFf2XHPTGbPMNTuuYiINLrtvRArHU+EctsEEIrubyuqKu7WPg5NQCzWcgqfK57X2jLuMoE4zMzztAxptB5GqvL3oomwH+3RMnG38iXjsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc55cc9-7c98-4efe-3013-08df1f17b28f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:24:35.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS2401svDq9kuarEVI+Bn+YU5TWIRcZvkfBRIvsKFfazV9Gzixqtyf9P8wd7yEgL9MKxhkifEOGCaEgcNsviAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
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

On Wed, Sep 30, 2026 at 03:10:32PM +0530, Varun Gupta wrote:
> A chained ULLS migration job can be lost: its predecessor's postamble
> publishes the ring tail over the job's slot before parking on the
> semaphore, so the CS is free to fetch that slot while it still holds
> padding. When the job is later written and the semaphore signalled,
> the CS runs what it already fetched, drains to the tail and idles. A
> lost ULLS_EXIT goes unnoticed, a lost ULLS_ACTIVE hangs the kernel
> migration queue, and because the GT reset replay of a chained ULLS job
> does not work either, the second timeout wedges the device.
> 
> Patch 1 is the fix: park first, publish the tail after the wait, so the
> next slot stays beyond RING_TAIL until the job is in place. This puts
> the non-posted tail write on the wake-up path, which the original
> ordering was chosen to avoid. I could not find a way to keep the tail
> ahead of the wait without the CS being able to fetch the slot early.
> 

I saw patch 1 as a possible gap but at least on BMG I believe semaphore
acted as prefetch flush but if this isn't true on CRI, fine with change
going in but let's align on the issue (I don't have CRI myself to test
anything). I'd expect if this an issue on CRI a reproducer would simply
be run 'xe_exec_system_allocator' and we'd get an immediate hang. 

> Patches 2 and 3 make the GT reset replay of a chained ULLS job work,
> so a future ULLS hang degrades to a single recoverable reset rather
> than a wedge. Patch 3 covers a state patch 1 eliminates and is defence
> in depth.
> 

Patch 2 certainly looks corrcet, so does 3.

> A couple of related items I have left alone and would appreciate a
> view on:
> 
>  - The SR-IOV VF pause/unpause replay only routes the last_replay job
>    through the tail write, so a chained last job publishes nothing
>    there either. Adding "|| job->last_replay" to the patch 2 condition
>    looks right but I have no VF setup to test it for now.
> 

The VF code likely has gaps but pagefault + VF migrating shouldn't be
enabled (this combonation can deadlock), thus ULLS should be
unreachable. I do think we could workout the VF gaps if needed but agree
we'd have prove this on VF's with testing to have any level of
condidence.

>  - At replay, pending chained jobs still have their semaphore slot
>    signalled from before the reset, so the first re-emitted postamble
>    passes its wait immediately. The resubmit loop writes every job
>    before GuC processes the enable, so this has not been observed;
>    clearing the slots in guc_exec_queue_start() would close it.

I'd actually lean towards GT resets eliding the emit_job() like VF
replays do. This step isn't required as the ring instructions should
already be present in the ring and that memory should be persistent
across GT reset.

Thanks for looking in here - I figured I had some gaps which we'd catch
after merging my original series.

Matt

> 
> Varun Gupta (3):
>   drm/xe: Park on the ULLS semaphore before publishing the next job's
>     tail
>   drm/xe/guc: Publish the ring tail when replaying a chained ULLS job
>   drm/xe/guc: Rewind the LRC ring head when replaying a ULLS job
> 
>  drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_migrate.c    | 24 +++++++++++++-----------
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 15 +++++++++++----
>  3 files changed, 41 insertions(+), 17 deletions(-)
> 
> -- 
> 2.43.0
> 
