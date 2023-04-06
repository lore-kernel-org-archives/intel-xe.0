Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14FDC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 04:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF610E012;
	Thu,  6 Apr 2023 04:23:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE1C10E012
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680755030; x=1712291030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CoEB7dTR5GsHu1JAi1rGeQP1HlErA/Q4Ii3kXTG46KI=;
 b=KG5OXFBZ7iwWJqT5Eu116TZ5vGxReSqrWnfUnitzvsVyFHDHWvEGehZX
 U8651ptaA6twYBpKmb16PP2p5dwfqgf2UGgkQ0yq2Q0v5MT11kwFrWZhK
 TVEPRLyaRjWEU9zb/T4YJuOP5vdxM2O/CAFGuz4SQV0j1N421KvxWLWzU
 YWhPDA5fx7qmHWHF3/sduqsA4VeTpp2GqCN8wT/6w1newdN7EvYAqXIS3
 sqqJC+WA22gtrPOJeQNnBVnGlUgYgWFLqsJPOebNQNcUlddmC1O05lokE
 cAwQ5dAPcoamxqp0uEL/5rxauXOrEfoHjwXU1ikllvG05jGZf+RwYoD2o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341365107"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="341365107"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 21:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="637129831"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="637129831"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 05 Apr 2023 21:23:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 21:23:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 21:23:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 21:23:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 21:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9jiVHEq7WV15vvBMATY6CnHZRHwijiudxviguFW4CmQ68k/yu4qjJBZi9wVVQY136fXicdZnm+7qD1dgShVZtVkZ9k9AXt9z1o/4NRDkjecwiMKjjGzxEBRdaVCJ6A1lyGQCzGdE5m1Eue3YTVzOXtVj0QmOxguCbPu5THE+lAU/7GlXXvx7dClyqqpiHVnTrgP5uiJ5oR4LjqsQblnsNngq+shPB3ru6gpllfK8kB9wWZzLMzpqBt99peFQ9ylyDzp8OzolU5X2BN8ua+EPwbRgdX1LSg3rBW9W53i26OdCZvNhugYNdCiTlCvIPu+kGzcWrPG/uow+WJGSsPizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TaYnGLZ4m4NKIZ3mGFkn9fo60J2ZACWiEpYzq6Zo3Q=;
 b=MrRdaCciRasSDdB/kZWtTQhApqtlMzBghmhMQ8Y8nJVW7BcMQJW+Ykt+kROFDpo4PPR5tqgioDpCs3grt4x1Kp6UYfVoqaX7kurQ/0fygzmIViME3VxTB0k4lhw9b8ethvnoFjM5SlYSRpvUIr5kytFoUaJpAZ/xU/j+gRnnDF75OYXieGrfkeU6uTeanJKPAxghGH934uNFsKBMyY/rS0AgVw7TA9tgBLfroDY09bZ7MP8faVplvmvN40ciCETXVKdh9+soiAG1T37J6mMpaousZC6eA5Y+O3p9ppzoG0IuzZyEScL4iF/5sDnYZPYLe8z0pvfcaVL5lA5rxQYkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 04:23:46 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 04:23:46 +0000
Date: Wed, 5 Apr 2023 21:23:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZC5JSj7jzd5TGXUP@nvishwa1-DESK>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-3-matthew.brost@intel.com>
 <ZC4/rAOBkwv6z2Ed@nvishwa1-DESK>
 <ZC5AIY7zIQdm2z3v@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZC5AIY7zIQdm2z3v@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA1PR11MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: f17ddd18-2f38-43f0-51b2-08db3656b670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddjlnSR9InNOE6NST6cGhPinCYqijhWNeTuv5DlvFMxFGAkAeDLMzpykmnwpTv+4AYjX5aXePoDTVbqqK+bUlc+vjAEUBdlC5f1QFb4hPRUdHy6m2RPHLlRjO8VXnk9qBW1dDQv4PULizTZVmFQYTQkttM84m1TV8g9HHjX//eW4pIk9OrACHOJmMAkD4ta7ZVIacyJ2FpJHJn9UNcFiB+yJ/Bl0kUlKaLoMr9C31kDmh07kW5w2z/WqS6vBmu/mNwyf0mvP8epjaZSKjrxAHhmd66BlCqVZsSnnu8iyVqxElRcoFWeolLHJlux7ozWVz973jTGN5QCM0NA2/zs7Ug+4OYmcqwWFvzoJ5w4jh+CNH2gule8NzBr8KZWi4EcZBQuKJFblwNzFDjJKo/2Hhsb+32TZVqLjFTsffbz8ppbBals0dexyJQcPwF+93DTIkmJOz/xvCsBe1uexmsOoeQw2igApZKzKsDCGSXNGX1AwEnfFdgzC+dNelRa+hJbGU2fV1UFuhLUK1x6eMYtpUt/cztepO+WsvCExoHBQKnUZOS43f6cBbIxsS8Yrx6ZU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(2906002)(8676002)(8936002)(44832011)(6862004)(41300700001)(82960400001)(38100700002)(5660300002)(33716001)(86362001)(6666004)(6486002)(6506007)(26005)(478600001)(6636002)(83380400001)(9686003)(186003)(6512007)(4326008)(66946007)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YvsiLCZWJDa73mI9bnGVWVd/wDWGKqGEPGF4xBEOH55WZOcVCvE/4wvEG2NO?=
 =?us-ascii?Q?1m1eryfyDs0CxFIDrjWxq4XOwH138Hh+zDAdGHcXxTNkiZLAg7rcmc4pUSt2?=
 =?us-ascii?Q?h192apvypgjoJWfEBm+vUFE6BY7vhgsfbdJm3FVE0X8K0pkiO1p6lH+7QD9X?=
 =?us-ascii?Q?erOUaw7ipbfCGWLujV2jw/5MpP8aFl5wX986sXfQmgcBACrG8c23nv2cRI0I?=
 =?us-ascii?Q?3DQDNYcXyIX7VgX9l9mU46XLN4au3mqe1Aw/RnQ9juK8UbkGxWgFOaJS9X0W?=
 =?us-ascii?Q?wLl34UeUpizDYQw4t/Sz384iZXs9NZH4Qjnn7OfE7hZj12k0mCKe5i8ICPet?=
 =?us-ascii?Q?fRaz+DRlx9boQqRxww0cyqm//m8d+tGKR7uMcnzz6LFpacg7RCgwezMjKbOT?=
 =?us-ascii?Q?dMyEBlmk1L9ympNnvLi+edhIkw2e9mdTqAISwQ3RVuZB3M+nVZmHtu9AP2x1?=
 =?us-ascii?Q?aHIhQYCcopR+ghA043Q28AOGRZobn6ZFqtDJj7p5lIXkxpYGsWYCnDRr/UdE?=
 =?us-ascii?Q?mYXiATqUmKWYJULnjLzxXhhNnAn8aEP2MpY/03WSjLYnT39iECgOWjAKm10G?=
 =?us-ascii?Q?EwT0MCPs6Zqme76KCnpeDzRsepddvCZ1zZ/t4HE/01KMfAIhUwhh7lnRjayi?=
 =?us-ascii?Q?IkVFTo9jZknzohV9cJ1cfF0MBp87u1ehT0skNEv7efRCevihcXWo4gouu2a6?=
 =?us-ascii?Q?d42pqYKtZlqjSMxcCyfW/YUCa52aEfN1EmXm4KyLuns07XUIco/zQptW5o27?=
 =?us-ascii?Q?pCucSH8/YEl344UC/nrDgIYM7MDSVe7iqooJRKUz1FDAOuHDD52zOWIKYP+d?=
 =?us-ascii?Q?v0nCFMj8wLu4dhnOiuMxUE48QyRXHOfaZKtjq+V9tnLwKQ8af3RwPyUkmyd1?=
 =?us-ascii?Q?p7IDkSjXNfbCDJZP68zNauF8gEPz4nKEiTi61VepwebeyK8Eqz/KDj7AWIZw?=
 =?us-ascii?Q?d2cfL6jolxkgeGDkRu2AjKnU5KWMPFRBFHBK6bUV0Cc4GzXLPEpH35GOY7vG?=
 =?us-ascii?Q?pIx4st+Enb/6ShtDXaELr1V+ZP3EC3NnxE6bQqouPf65rjy6sIHtJC3nSBCA?=
 =?us-ascii?Q?V+4amwSkYvpDiNB8VVDN2JGkeDvYHJ4BcIfjDEzLf+styW2VcUj//IQRXcyK?=
 =?us-ascii?Q?PCBxEpeN6yDRaHEZOZHrQu+FNZrIJikmT3UCdS4yFro6lWEggYD3K4+I9SRB?=
 =?us-ascii?Q?v547bIxwt8H1+d0bGTiOtk4lVpUZ/qpaZXxCCYHxgdfICL5rj3lq3DxFNj9F?=
 =?us-ascii?Q?HlHQNFovFALIq7nRLJTbhNLOkwYF/tl+O8PCLlOsW3HKlIWLUWgIzg/ziVQN?=
 =?us-ascii?Q?uDeNQO5++SjAmrFjWMnxIJ5kpMdn2YSGYDH0OVscvWa1+bZF0gST724E3Zk8?=
 =?us-ascii?Q?6sJZ5C+NxqUcEVHx3mfRtiqzBN04VT9xcQsaLV5OSjIJfOVX6gyFocHbvHpw?=
 =?us-ascii?Q?OzlIUrFccmLwHus7/MhYEFh9WLso5V1w8dtnv+v9KHirqF399jhzvz5nF5py?=
 =?us-ascii?Q?G5nSWy4cTeWphgCur5zN6X0qujGt7Q/3bZhhomavfmMRBVQngwOOmAmSaofI?=
 =?us-ascii?Q?oAt8/CtqniP9CUwO0GCqlrVl4Np1SW6+dbUcWRJgqOY1TUB8No0RoniWleO+?=
 =?us-ascii?Q?C2pHpcCCYzpyp7d4TKmhUNQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f17ddd18-2f38-43f0-51b2-08db3656b670
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 04:23:46.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvMxrEZfoVHBkBa03w/v8cqN5o2SY1U1MC5pLw6arMhc8FnZgKQEtnLHrPVSwdcBrRAcr+bXTvUFFHL/+dx+f6zhE+PwNuV6pgeCjDSsEVRDHE7R7Ia3lQ8/6QC19I/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop coalescing of GGTT
 invalidations
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

On Thu, Apr 06, 2023 at 03:44:33AM +0000, Matthew Brost wrote:
>On Wed, Apr 05, 2023 at 08:42:36PM -0700, Niranjana Vishwanathapura wrote:
>> On Wed, Apr 05, 2023 at 04:34:03PM -0700, Matthew Brost wrote:
>> > Causing a bunch of hangs driver load and in user space. Benefit is
>> > rather small too, so just drop this for to stablize the stack.
>> >
>>
>> Looks like this should instead be revert of following patches?
>>
>> drm/xe: Coalesce GGTT invalidations
>> drm/xe: Pad GGTT mapping with an extra page pointing to scratch
>>
>
>git revert conflicts...
>

Looks like a minor conflict.
I am seeing reverting above patches brings back some XE_BUG_ON()
checks and a xe_ggtt_invalidate() in __xe_ggtt_insert_bo_at().
Wondering if we need them as well.

Niranjana

>Matt
>
>> Niranjana
>>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_bo.c         |  1 -
>> > drivers/gpu/drm/xe/xe_bo_types.h   |  2 --
>> > drivers/gpu/drm/xe/xe_ggtt.c       | 25 +------------------------
>> > drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
>> > 4 files changed, 1 insertion(+), 29 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> > index 5460e6fe3c1f..c7f175a149be 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.c
>> > +++ b/drivers/gpu/drm/xe/xe_bo.c
>> > @@ -975,7 +975,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> > 			return bo;
>> > 	}
>> >
>> > -	bo->requested_size = size;
>> > 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
>> > 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
>> > 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
>> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> > index db217500a970..6071611a2b29 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> > @@ -23,8 +23,6 @@ struct xe_vm;
>> > struct xe_bo {
>> > 	/** @ttm: TTM base buffer object */
>> > 	struct ttm_buffer_object ttm;
>> > -	/** @requested_size: Requested size of this buffer object */
>> > -	size_t requested_size;
>> > 	/** @size: Size of this buffer object after alignment adjusting */
>> > 	size_t size;
>> > 	/** @flags: flags for this buffer object */
>> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> > index a430d1568890..93f78aba2c8e 100644
>> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> > @@ -273,15 +273,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>> > 		xe_ggtt_set_pte(ggtt, start + offset, pte);
>> > 	}
>> >
>> > -	if (bo->size == bo->requested_size) {
>> > -		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
>> > -		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
>> > -	}
>> > -
>> > -	if (ggtt->invalidate) {
>> > -		xe_ggtt_invalidate(ggtt->gt);
>> > -		ggtt->invalidate = false;
>> > -	}
>> > +	xe_ggtt_invalidate(ggtt->gt);
>> > }
>> >
>> > static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>> > @@ -302,19 +294,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>> > 	if (err)
>> > 		return err;
>> >
>> > -	/*
>> > -	 * We add an extra page when mapping a BO in the GGTT so we can coalesce
>> > -	 * GGTT invalidations. Without this extra page GGTT prefetches can leave
>> > -	 * entries in the TLB pointing to an invalidation GGTT entry when in
>> > -	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
>> > -	 * to 64k already have padding so no need to add an extra page.
>> > -	 */
>> > -	if (bo->size == bo->requested_size) {
>> > -		size += SZ_4K;
>> > -		if (end != U64_MAX)
>> > -			end += SZ_4K;
>> > -	}
>> > -
>> > 	mutex_lock(&ggtt->lock);
>> > 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
>> > 					  alignment, 0, start, end, 0);
>> > @@ -344,8 +323,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>> > 	drm_mm_remove_node(node);
>> > 	node->size = 0;
>> >
>> > -	ggtt->invalidate = true;
>> > -
>> > 	mutex_unlock(&ggtt->lock);
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> > index 8198aa784654..ea70aaef4b31 100644
>> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> > @@ -26,8 +26,6 @@ struct xe_ggtt {
>> > 	u64 __iomem *gsm;
>> >
>> > 	struct drm_mm mm;
>> > -
>> > -	bool invalidate;
>> > };
>> >
>> > #endif
>> > --
>> > 2.34.1
>> >
