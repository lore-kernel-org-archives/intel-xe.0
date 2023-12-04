Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E9C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC3610E376;
	Tue,  5 Dec 2023 01:21:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750E110E376
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701739310; x=1733275310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mNf9+2Jx9sTlt94o2+htv0dAx8Vk1gJ6EwFyfA2Fo8g=;
 b=m0jJPsastHDc08K+0XKw8vrISmVvv4vMmL53CqLy2qC1exB3+CtuEC3b
 3DwBKlLzyHQgCK4K/b7/GclBAuKzsBAn9WshHQqLxidK/bALaLFoykg8H
 YbSRonpyI5UV9EenMXHSGFXGOwrD7dbviAT7oFT0o5txchd3lzwFsopaJ
 NHCX2M0EkfhNKFR4pSsZKJAwo5SMcBC5njmOBc9yrsOd3f5hKLzGe+ln/
 zHzdDA1hUG3KmvmErObBmWL3ZLdcaLmMtpe9LyVJbpa32DTCIKw+RKUPy
 mkwCfyfERvGpS8kQOs6K17/e60ceLHLipAO+ADhFEH0EdChH/7KAp+ywr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458145941"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458145941"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018040460"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1018040460"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:21:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:21:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:21:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:21:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQWYMfPMPpTcpSL8cKpfGN+HXs3OiZ1bKBphNDu75KxvuEhcWx4GDv3E20wvNvGNcylVU8iIH85+sJ03wl6XiD6wfs/6Qln/Sgy66GE17UXVjOYPNfKLFgdolDk1QU4ESDDWnK8x7j0tVi6A/UGRhjxIuA/0/Hc/bRgMb+VGH85hcIZPI9GVH+0BaAI+LXBh9JJvcxJxhxwbCA8Ea35gmD67ffTp8qO38v3XgWQ8s0B8dI5xCjQBXYN2RUqYg4zw1RFrtRVSDO/Wwk4wcyC6ReEfbyxeJ+HpxmUGAurj08J3NHGjmy+3jLVAGKVWBQobB6Oypma2eiHX2VlOzkCL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTeP3nGUj8LUEHObQPZDL1xbv/6wgn+MVtq9Toeb0BU=;
 b=UivL072hbTuZOihSFgFhjLm9l3ljZsT4le1vyDRhocRotL2ApLhgmjsilu6YqEgrw4qEFigPMv5z2oHpR5Gzs5ud6YH2QljfsefzM370A7CztmdW4aheS7U1t68Md0g8FZ3ctqPVnQko+2bDVv5g1sPvmknaARpiGqUGKZpiAKikLmlvDubmQyULXN68jBnIqsLoHP/bTYClBE1wW614krUqWAkZPlswLkwuLvXQ/LsuWaDDGE1tGowcRrvLUj+s75w3YBcTMj7eMHtqm3/q4LTHuDPOHHUC0wOWh+7QxAJvKXeRKr1f+d+WybwOBEYQc0VH7lvb0LdDqT5Sb99agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:21:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:21:47 +0000
Date: Mon, 4 Dec 2023 18:19:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZW4YRSS/T4dnBk2l@DUT025-TGLU.fm.intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-5-matthew.brost@intel.com>
 <5fbbab8b-d7c1-794e-192e-245c98a6c14c@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fbbab8b-d7c1-794e-192e-245c98a6c14c@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6a5c6a-72de-475c-d25c-08dbf5308c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WI4Z9Fu3HO7V2CiEV5sZ/hENbvXeg3d/uAFtUzJCHSWOejCkcX/WpaB4Jk7by8lp3k0W54t/QDN7+d3OrXQjfFXhr6VzCJE7eKcYgLrpqUOzo6Uxb8Y5B8VByBocgo9EetJMFX1D1u/cQ/f7OXg5vrF1gRXC1+LtNs8d1j5LEep8UadQN82hq8dWCE3l5a+DWnJnrn7361xTAMXUAyVDrUmf/VlCgytWi58QjGTbnOxeJIg9g2p1Eqj8RDUaULJ5Atce9cNYn2/1eGb7dkgGS029/DfgP7kbOojPtWnnAkezs4rHPkO1wE+zpG7Wp/cGyxtX+7Hdoc+M2XgpsRW1Um3DB7XrC3a/i1LztDc3DyCvoCVesY/B+bbVoDu/8aYbhGhEOn/Re2E+C8mZBPwOTyFzV77Bi5P63WpG2vkhBBJHcNaHwiEVsN6QRrbDTNXk9vyKMkc2e0y0Qpm81IAqk8iFzWD9TtLi4V9bdThx4oZdkmOviIRKG+LB5m68TfgO/dQvruZ+gAC5mGHtREX4gbZMzrE3t5DMhmRDhnJKIrOO1jVkCFKhU8Nv0pBKeWi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(44832011)(86362001)(4326008)(8676002)(8936002)(2906002)(41300700001)(6512007)(6506007)(82960400001)(53546011)(66574015)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(6916009)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JJKsExUUTpXxmMuKtMymkAjNmwyPq80tvEodC8RVgL7lyZHYwLlehguJAN?=
 =?iso-8859-1?Q?cRCK5fDImA3rY+ERV7OhLNsHmOBUSRC31UL+nFDzzBZinrdjgpSPiEvGQd?=
 =?iso-8859-1?Q?4LF41EE9VD1GzScy3AvTV7wIhAwIt7FHSmGe/sJ6LRMM+BaNhchWWEdiFU?=
 =?iso-8859-1?Q?6LrnFfiE4BcpOjXrnyV9zZtNpr8sVYdNoyrBvGznhaLQtmUyW6hG+mVMKz?=
 =?iso-8859-1?Q?dhKwf47Eg1+6y1kyp5Gorfiysodcol4l2VwMcQxyGNGVqgYvOJVlpm7Z41?=
 =?iso-8859-1?Q?3rBiRjdDkvNT77itt5YrR99ZXxV31FE/HuyCfC/7vzcbzt5RPyYg68/LjI?=
 =?iso-8859-1?Q?FTx4FSUsKnBeqSTqka2IqmtwR9tEXgjD/4Jl5MjBojdeheso1JcDmDjpdj?=
 =?iso-8859-1?Q?YPUOG5dLoz/b3Lnpkt4vyhekpRmKNlX21eSM6rVCT5CM6ZWdQRYmwCgkSN?=
 =?iso-8859-1?Q?2dM3d0GwaqqpMMuX56MAkZTEO6mfnKS+juXVUUwBmvMB0eU/Z0/j6lSAIl?=
 =?iso-8859-1?Q?Do0/UUpJa5xTXP364n2L1/oApQZIkSt4ZmR1nW0j9ItZ8d5O32FMIh8Eeq?=
 =?iso-8859-1?Q?3ffP4B1Yb6Mg0+h+63x9Ku+y/EhCBhz8awotraDCQvMAcTOdADrINMqNv5?=
 =?iso-8859-1?Q?4Syh9nG9kZBdNOT3bEVhZ7TG9E3r+E0CggfXdbxdzqLVqXbO2UOl6kZ3HK?=
 =?iso-8859-1?Q?jFqp6xnwjMJIaIJn2RVFA7eMy/knGE0H/wf7Hf6PpH6oIia2ljOUu7Y3YR?=
 =?iso-8859-1?Q?QyLI5pYyBQz/E6P4teVoLwicUhuwjALWJWs8DM9fbNw4Mm+38Jhn/UhXi6?=
 =?iso-8859-1?Q?8z0qQ62XnWDF3IZ+Q5vzvFQe7o4m+HculiaSGGjQmD5Z4+iAGzoTCxwus7?=
 =?iso-8859-1?Q?v+YYeef2h2eZLWC3vlhwmYhhQAlHoBZXuQPVa/2wYHixwiQRd8SVTv1fH3?=
 =?iso-8859-1?Q?R3VuikOV8XoHPgjD/TQVyyvqZWnJ1BGxcn7y+MKQdnYbm3UsKFh2WO7+l2?=
 =?iso-8859-1?Q?VHAAZxU4fRqQev+agDw5C9KB4/YMzJGIuKfUkY/YzoIWaXao9/bSZonkl1?=
 =?iso-8859-1?Q?yMIs1VTB8sShHj+yhAhzXUpaujBQTjWfZyt+4yjdmqqlN5E/K/G7vBOjZw?=
 =?iso-8859-1?Q?m7O7SkufBGH8GjhmtgRj4xknP1Jdx7HPTkAlhPILitrTEBydNiuwh8B7L9?=
 =?iso-8859-1?Q?8dTK51So7h+X0/x1uU5EBnSuNbNI2tjSeO9sF4XkmwioI+2DX44wIwTFwu?=
 =?iso-8859-1?Q?Y8/A5hVeXwRPp67a/3MW4rdn7U/O9Ir7XLPvUjk0lvrDbi5HkKVliq2auA?=
 =?iso-8859-1?Q?jzUWTs11SzJIfco7kCiFAQU+AvW4QrGY27YG0xETcmnhQa1FFLQLFXJR8v?=
 =?iso-8859-1?Q?g1RT07YSUr6CsoEGODN5TBGy4m0nr+Plq0j3044lTr4DZDafNhAUXe4VMS?=
 =?iso-8859-1?Q?TxvIdJyYRZnH3OqrAsd21lYIeB00t3VvNg/FaLIotGwIldjfB7/s3c0fhc?=
 =?iso-8859-1?Q?J/EJnElREITsgzWcu3gnmfkz1j3HNPlZ0CQw1chQYO9s6MqiJbz9GTXaqI?=
 =?iso-8859-1?Q?GrhnHdbuCLqAWoCcQUzT87Xu7HKohWM2VRaaWtcgvglbcrHxMY5WRxlF74?=
 =?iso-8859-1?Q?aQGzG9joUSNTLGhw7QjuOjxz0BSs5NskEwtRcUOg33V66QhX2Dsw53zg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6a5c6a-72de-475c-d25c-08dbf5308c34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:21:46.8366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mDvO4qgHy/kTFANPvFX3qTZX27Fv/0QcWSESAO4WAlW4H//Y/YKAHxtDmvXLArc6PgsBCP2Fl1nA1WYPdDmxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] rm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
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

On Mon, Dec 04, 2023 at 02:25:55PM +0100, Thomas Hellström wrote:
> 
> On 11/16/23 20:40, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous operations
> > on the exec queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > v2: Don't add last_fence for VM's that do not support dma fences
> > v3: Use a flags field instead of severval bools in sync parse (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c             | 23 ++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
> >   drivers/gpu/drm/xe/xe_sync.c             |  4 ++++
> >   drivers/gpu/drm/xe/xe_sync.h             |  6 +++++-
> >   5 files changed, 36 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 7d4d22c81a42..4989bc6038af 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> >   		return -EINVAL;
> > -	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
> > +	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> > +			 q->width != args->num_batch_buffer))
> >   		return -EINVAL;
> >   	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > @@ -183,12 +184,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> >   					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> >   					  (xe_vm_no_dma_fences(vm) ?
> > -					   SYNC_PARSE_FLAG_LR_MODE : 0));
> > +					   SYNC_PARSE_FLAG_LR_MODE : 0) |
> > +					  (!args->num_batch_buffer ?
> > +					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
> 
> Q: Why do we disallow user fences in this situation?
> 
> 

A user fence is inserted into the ring so unless we issue a NULL batch
or something this is not easy to support. I don't think we have use case
for this either. If this is blocker can fix change this. Also I think we
can add support this later if needed too. 

> >   		if (err)
> >   			goto err_syncs;
> >   	}
> > -	if (xe_exec_queue_is_parallel(q)) {
> > +	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
> >   		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
> >   				       q->width);
> >   		if (err) {
> > @@ -235,6 +238,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_exec;
> >   	}
> > +	if (!args->num_batch_buffer) {
> > +		if (!xe_vm_no_dma_fences(vm)) {
> > +			struct dma_fence *fence =
> > +				xe_exec_queue_last_fence_get(q, vm);
> > +
> > +			for (i = 0; i < num_syncs; i++)
> > +				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +		}
> > +
> > +		goto err_exec;
> > +	}
> > +
> >   	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> >   		err = -EWOULDBLOCK;
> >   		goto err_exec;
> > @@ -328,6 +343,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (xe_exec_queue_is_lr(q))
> >   		q->ring_ops->emit_job(job);
> > +	if (!xe_vm_no_dma_fences(vm))
> > +		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 4fd44a9203e4..35710b66e5de 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -924,7 +924,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> >   static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> >   						    struct xe_vm *vm)
> >   {
> > -	lockdep_assert_held_write(&vm->lock);
> > +	if (q->flags & EXEC_QUEUE_FLAG_VM)
> > +		lockdep_assert_held_write(&vm->lock);
> > +	else
> > +		xe_vm_assert_held(vm);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 5ba47a5cfdbd..52f0927d0d9b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -56,8 +56,9 @@ struct xe_exec_queue {
> >   	struct xe_hw_fence_irq *fence_irq;
> >   	/**
> > -	 * @last_fence: last fence on engine, protected by vm->lock in write
> > -	 * mode if bind engine
> > +	 * @last_fence: last fence on exec queue, protected by vm->lock in write
> > +	 * mode if bind exec queue, protected by dma resv lock if non-bind exec
> > +	 * queue
> >   	 */
> >   	struct dma_fence *last_fence;
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 016d0a2ea5bc..cfe8724ee954 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -106,6 +106,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >   	int err;
> >   	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
> >   	bool lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
> > +	bool disallow_user_fence = flags & SYNC_PARSE_FLAG_DISALLOW_USER_FENCE;
> >   	bool signal;
> >   	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
> > @@ -173,6 +174,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >   		break;
> >   	case DRM_XE_SYNC_USER_FENCE:
> > +		if (XE_IOCTL_DBG(xe, disallow_user_fence))
> > +			return -EOPNOTSUPP;
> > +
> >   		if (XE_IOCTL_DBG(xe, !signal))
> >   			return -EOPNOTSUPP;
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> > index 30958ddc4cdc..45f4371e94b9 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -12,10 +12,14 @@ struct xe_device;
> >   struct xe_file;
> >   struct xe_sched_job;
> > +#define SYNC_PARSE_FLAG_EXEC			BIT(0)
> > +#define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
> > +#define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
> > +
> >   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >   			struct xe_sync_entry *sync,
> >   			struct drm_xe_sync __user *sync_user,
> > -			bool exec, bool compute_mode);
> > +			unsigned int flags);
> 
> Should this have been in the previous patch?
> 

Yes, good catch. Will fix.

Matt

> Thomas
> 
> 
> >   int xe_sync_entry_wait(struct xe_sync_entry *sync);
> >   int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> >   			   struct xe_sched_job *job);
