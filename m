Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2765FC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 14:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7610E25D;
	Thu, 11 May 2023 14:14:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261EE10E4BF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683814450; x=1715350450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KvF+eVtfnTtFnZLUpNvI042dqdQzAtvrOKyTcdtMSXQ=;
 b=QAuKbsoifd9/MazJTTY6qXtsgMkUHz2Avdsqz7/DMR1DbGcL/tilX/v4
 osArCb0gmcf5qSvQ7nyZu4biQ77Vo5S6+acYJ6ABUwSVvBrJJrAfhIjfR
 Qlax1UfexGFPWIEI91n04JELvNT4ZYyC9y+j6ysTDQ6zvS6On4ghdxNBu
 1N174JMWk+hGDjwjWmF86jl2XQCyqu2OCo+gMuiogGteZOMKPbp4qxWay
 D2udCjuGzEqDXxpVhFx3muMvyVCaxtf/xLfeoK+LLM2lnkPz3BSK4LLWJ
 jRK2nVRB+ZdOXPQNhv4Z/5oILYdCQSn9lNjXT+UZHBXBMtZc/DXc+U6n8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436841173"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436841173"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 07:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="693820573"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="693820573"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 11 May 2023 07:11:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:11:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 07:11:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 07:11:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 07:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQYoPwpWy68XxA4sXMgalKHx0rtWihVWsTqE6lwdrj2MfrNWk7iJEaf7eZ7euaUNjrYEOPGMR/dq2maTGDzoTMrgwabLb5uAFq5UWQ2Bo6wEn6K/k0XsFauAJlaKnES+836gcAto0Op308w8485BNvgeKl4kiifVGaPsxBKGWQ/CkpPlj+Oh+PVZJnlrJZ903PE/aboxm1GN26jdMsIwJ0/6VZBI5MMpUXWEpVp4aV/GAXYHctnmr3ZQ/SgFvksCwfO2YvO0CaXI/H8iWq76n7y6p9PJzhUvZqH9vf98I0Ncb9I50tBULBf7oDBuIMglaclCfHa5ECR1Tvmr5ydh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmcKcAfPI1xUt67ejtzwW1FfmAFdVwrMe+KTnOfmAR8=;
 b=RB267nwpVnGogpeFEUPgQccxeS3O9FEWb/mTY51TIBWCIKcPb6AcpaQw00cdvaJIc7HaFwizwWyndtrN/XUhmPiUoA5a6az0udk3PxiF0PNthgHuE+4opCOIXj4oDsyZmAJIkfVP+j+EzQm17yh+AJfiT9BtXN10d/rdGF/7e2fIDP8oWmw+PHjOuQJvGC+8IaFmZri0q7nuZ23aNU/4x/u4yLMOp24NMU2hK0/otwaqsbTliP/1LJ1/ccVkJ9Kfco8TlIdso911OhSdgaMO58pAErVc38xWsauIsR3hkULAtyO2N9XVUzxTL/uz0sFfSVxm5t9+C5SsjRNQ924U9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 14:11:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::f76e:7b88:5465:5f5f%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:11:49 +0000
Date: Thu, 11 May 2023 14:11:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFz3e7ZKt4YSNB8S@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
 <ZFrDjttRaPf6hBeo@DUT025-TGLU.fm.intel.com>
 <c58f99e3-a11d-7f2c-cfa3-dfb14a44c6c4@linux.intel.com>
 <ZFvlBMEvuhiT9QSB@DUT025-TGLU.fm.intel.com>
 <f47d74e7-51f8-07aa-f845-2ea3f241653b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47d74e7-51f8-07aa-f845-2ea3f241653b@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: e74c14bf-f905-4bcf-e2ae-08db5229a9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/NxTXOgYoMPaSJTDXOUZ0AKFNHfy0T352ffVp5lGGcnorNnFZASwp52gxEyj5kGyqMsWbkqZLKJwf2vghTCH9BsPH5gUA/x1uS0gQSSZ3pYuj302ZCkqqB9MiRUwye9nOy8kMjk5zWUNe2P2xC5ohUyhm0JCS0QnEBWU3hQ7+HjweiCSuSB/yeXHtHHcA+/XeS633MsroXKpiAeKmq1quZ3YKR7YdPYyKn3ZVhboVWrYkv4hLKFklvvQdNtV8sqdegqArWc8UgjfNd/eJ3krJlbDJaOxdgCtRIDI4idlt6QaQgRw9omLOvusapte4DF0ayLXtQ5ZDUUaLRw+jPcBq4ciH0o1POz87FmZJ7V/JBbvFlmtZ9vzYaqiOMHRTchjjvtdw4rHEv4P/n1EZYfNSR15Wi7G6SlDUzEk08XOg2IReM2wedy0PvIT+luAH6gH55PJDYU+cbdcqZ7m/wkpNhT+cYY4/z+1NYv/y9S8+sJEJEhknAc4L2k+7Oy3DsQLNKh1xH2n3no6fGu5HYNBmZew7OeZWq5oYQ1jLYl/qyvCCSl7S2+LU/paLg7rQEA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(41300700001)(26005)(186003)(2906002)(53546011)(6512007)(6506007)(5660300002)(44832011)(38100700002)(8936002)(82960400001)(6916009)(316002)(478600001)(83380400001)(66574015)(8676002)(6486002)(86362001)(6666004)(66476007)(66556008)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vFebKCYkntElZ/yonhwyQyVcXALYJ2RNTHKwcUs4dzvLJpPhiulJVE18Rp?=
 =?iso-8859-1?Q?gLUt6SEzMRSnxmabHnS+AeWGLkK0iL0pajK/3h7dNDBJsOcJ8dMbFgqLLN?=
 =?iso-8859-1?Q?ZSm9KMHFNSPn/4hS/xO+hzs6tG4n7QsPmHDYMe8d85TrmiC0+cWYdfZLFZ?=
 =?iso-8859-1?Q?XJ5afo1/Ki+rG07i7eeR0PMonAqTArcyZn6iUeJ9EGv8rjuzvIdm4CkARv?=
 =?iso-8859-1?Q?TAaueI59QN5ELEmdrioRX6FHc/qQN4gXKzbezJMdLQC+cV3rPOmxYE06PW?=
 =?iso-8859-1?Q?+/688YLq7mjXKnIfkaoGzGmrQMYvn+eOSB+/h9nxVJVJs1FkkzSh34uo42?=
 =?iso-8859-1?Q?PlVd/sJ5EZCLTn94dax5vnBGDlx9wXgCa1nJhp3dBCBeiElqWA/wyg9prA?=
 =?iso-8859-1?Q?79PMZTM4abar94of/Z0+wLmi0F7hy1Wr/fZJ71p/1KRxny8iItMhuwNkyD?=
 =?iso-8859-1?Q?g0UIj4U9dvwsUgCTJjDTqlqyG3SYgbdN+NytIhfPIds15BN7PiBScIE+lE?=
 =?iso-8859-1?Q?bzVouESiCNIglOlG2IHS5Hlo+qk0LJfQMaI9+PVjVxrCmMh2SY+GD7rGeC?=
 =?iso-8859-1?Q?C0KqkOGMVPDmHSHS7BAX6wDCTu5cWowXanyv9HlwvY1QJSoALNSncneHv9?=
 =?iso-8859-1?Q?4rBnpJ2Rro36UVYCXeevx/e/NAcmgFaY9ChcB4bpHPhXJwas+yPJiq3wF7?=
 =?iso-8859-1?Q?iUPMpS/xvQCSXbGMoykrjYAa+S9akM1QQ8t2PThoTTAbiFMMp7kZt8NoM5?=
 =?iso-8859-1?Q?PXCySwMFdKfCibYZQZuoh4CuBoTQng3nYyt3miHHUjOV5fcSNu5o36IUkn?=
 =?iso-8859-1?Q?jmpcFk40sn6I4e2YSbWnkNwMtenBUQk9ryrGvDcBw3BQVMxNxyJ+dlj+Y8?=
 =?iso-8859-1?Q?n2AC1pIn8aEbRpsjgq8ZVy4pJlfzkSXnE09eC7jLYJXGC4b0mYjf9qiWzk?=
 =?iso-8859-1?Q?traeveGVAMJxZ9brK9CG8T1er7AI+1RvhvKzLYEjumSKKUL9AuSjhDzRiS?=
 =?iso-8859-1?Q?xzlwBhdbh9bz0aj2M9PXd3KYl871FoQNmqeXdQ2q5EHa+jDgsbinn/ODqh?=
 =?iso-8859-1?Q?lbGV+fW2UJY4EWuDUhn+XXpJ76Ct6I1xff+LpMiGssUF2yvifJHoFFr3sC?=
 =?iso-8859-1?Q?6mhZjWXgOTi9ncBWgRmssSZ5s1uhhIqgFDIROjrL6TMChXNBlclcUdbud7?=
 =?iso-8859-1?Q?OAV0CAWZyRIn/D3fAZb27eSGWbhKjLakqCs0mjDELbF0MowFPKGbJQTxJ+?=
 =?iso-8859-1?Q?PBcI5qSJ5cXCVMDrBhRhrh3CJGx1cT+I1ESt/1F8zvY6IKTCUcZoelqXfz?=
 =?iso-8859-1?Q?SLimd3Opy9diuMmyTsKEwJFktGn9Ur16VeyxHDba1qYvxIibBIKripb4UB?=
 =?iso-8859-1?Q?Q1GCvAaM023JZYAAMPXF3R1S0AmGjK4PaWqOKEUKehxBT0U4NePYWm2ouA?=
 =?iso-8859-1?Q?Ms9E2UAn27DSoGYtz16jG6Tr1gCBCQ78inSyreZSfZ6kDFoo9rn9TdBgwb?=
 =?iso-8859-1?Q?iKKV+ZzSSe72wSiZtMjEf6pQ3ThD09Vq83/qAphptNEvxcFfVR7VaOajir?=
 =?iso-8859-1?Q?cmyp9NiCnuW93zseAK+B0Zj3TlUnKE8yeZ+TO6pLIgfMR4IJ//fdAqU8Hl?=
 =?iso-8859-1?Q?QNNAXKJxSuRVZrDV7qjUeus3nS4OunHqPSCJWn2caIWDYhocKLCqhuog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e74c14bf-f905-4bcf-e2ae-08db5229a9a8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:11:49.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yblrPsDhflyNcufw84ApZROHI2qzHP67g6TPdEKf4HkvvCw45FdhkF/BHDMUMbq2uoONdfkVUxXErnCcemE79w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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

On Thu, May 11, 2023 at 09:24:05AM +0200, Thomas Hellström wrote:
> 
> On 5/10/23 20:40, Matthew Brost wrote:
> > On Wed, May 10, 2023 at 10:14:12AM +0200, Thomas Hellström wrote:
> > > On 5/10/23 00:05, Matthew Brost wrote:
> > > > On Tue, May 09, 2023 at 02:47:54PM +0200, Thomas Hellström wrote:
> > > > > On 5/2/23 02:17, Matthew Brost wrote:
> > > > > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > > > > > LRU position on every exec.
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
> > > > > >     drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > > > > >     drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > > > > >     drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > > > > >     drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > > > > >     5 files changed, 40 insertions(+), 7 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index 3ab404e33fae..da99ee53e7d7 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> > > > > >     	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> > > > > >     }
> > > > > > +static void xe_gem_object_close(struct drm_gem_object *obj,
> > > > > > +				struct drm_file *file_priv)
> > > > > > +{
> > > > > > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > > > > +
> > > > > > +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> > > > > Is there a reason we don't use bulk moves for LR vms? Admittedly bumping LRU
> > > > > doesn't make much sense when we support user-space command buffer chaining,
> > > > > but I think we should be doing it on exec at least, no?
> > > > Maybe you could make the argument for compute VMs, the preempt worker in
> > > > that case should probably do a bulk move. I can change this if desired.
> > > Yes, please.
> > > > Fot a fault VM it makes no sense as the fault handler updates the LRU
> > > > for individual BOs.
> > > Yes that makes sense.
> > > > > > +		struct ww_acquire_ctx ww;
> > > > > > +
> > > > > > +		XE_BUG_ON(!xe_bo_is_user(bo));
> > > > > Also why can't we use this for kernel objects as well? At some point we want
> > > > > to get to evictable page-table objects? Could we do this in the
> > > > > release_notify() callback to cover all potential bos?
> > > > > 
> > > > xe_gem_object_close is a user call, right? We can't call this on kernel
> > > > BOs. This also could be outside the if statement.
> > > Hmm, yes the question was can we stop doing this in xe_gem_object_close()
> > > and instead do it in release_notify() to cover also kernel objects. Since
> > > release_notify() is called just after individualizing dma_resv, it makes
> > > sense to individualize also LRU at that point?
> > > 
> > If we ever support moving kernel BOs, then yes. We need to do a lot of
> > work to get there, with I'd rather leave this where is but I'll add a
> > comment indicating if we want to support kernel BO eviction, this should
> > be updated.
> > 
> > Sound good?
> 
> Well, I can't see the motivation to have it in gem close? Are other drivers
> doing that? Whether the object should be bulk moved or not is tied to
> whether it's a vm private object or not and that is closely tied to whether
> the reservation object is the vm resv or the object resv?
> 

AMDGPU does via amdgpu_gem_object_close -> amdgpu_vm_bo_del, so yes.

I also think I moved it here as before release_notify() I think there is
an assert TTM for the bulk move being NULL, let me find that.

 319 static void ttm_bo_release(struct kref *kref)
 320 {
 321         struct ttm_buffer_object *bo =
 322             container_of(kref, struct ttm_buffer_object, kref);
 323         struct ttm_device *bdev = bo->bdev;
 324         int ret;
 325
 326         WARN_ON_ONCE(bo->pin_count);
 327         WARN_ON_ONCE(bo->bulk_move);

Matt

> /Thomas
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > > Matt
> > > > 
> > > > > /Thomas
> > > > > 
> > > > > 
