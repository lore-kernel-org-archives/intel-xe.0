Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88032C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 18:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3688910E029;
	Wed, 10 May 2023 18:40:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9036010E029
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683744047; x=1715280047;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lF0GbUkf2+mtvJnp9th1ndynXb8nAPiwVQdMc4ceclQ=;
 b=lZ0YOnT5Q3ywYWXYsRL7vrZA/Z08dvWhVjQbKJBmOnzCbfRmtxJ/ceki
 AFvwV9csgz7aQjgRjLbnsxwyO7g1DVQo9T1naz+WZX8w/e0HmieMo/kpZ
 9brE6zuVUSED/b0KvvvNeGqjiL3A1uUkI87eibNCBRntgX1XFb4csa5xu
 TgKneaxfGaUMJ8iLHopdgJXJumoZDqWcB982k6D+0tYpA/GbnQzJwP4v2
 xP2DG9kURYwLd1A36Z8VUwdWmvahbv6McEgoE32GHXTYxEMIxi94AtWmr
 nssw5hM0MWleLG9bakM3RuRYfEimT3vl6rufwZV7tcj7ZqHDuYDRj9QHH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339544416"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="339544416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 11:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676944385"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="676944385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2023 11:40:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 11:40:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 11:40:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 11:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOavZlxljgA4VvCuxdN2GogDEgPiutktKIE+ZPlnayqubUmf4lMzWXd2mbdPGSuGIjGofqplDur4X04F3xOF+bSRt7FB0/oyYdQnYjT1rUCHWfS4RO7gQUYH+AZm0FGJYV1NlEvxgqagMhGaidGDGcA1v6a4PUhm23+c/IQ8ggAlBs/NaIiNUgrB5l2qLE65GGRmIp7Iek508S5pNSr0XbCCfl08FvfpqsfWDNfPfP282GPZih7W5othvhOgO5E9NJvm9/uDKn0xPb3fhupY2N3/DnV6yGZg5hKw6R/+ReS7VY+LNe71x3FXRPZonkr2s+J9wPtAMMdPzj9bA8T3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et63de8JayPolP099VK3veSkEI8ZvacjZKULtAWcvTk=;
 b=V/TVrV7fCiCEjpRK0+MbTmiOuSvz/LBhYswKcbCwjnbth4BfPa0rOPuHsQW5g3Gaw6wtxR6EaUT5S6CaQumg6JOqq1tRdOl4BJzMjFTv3cgV1XdR/LP/uC5JAGCZ4HpWFEUjTv3+V0x6aKviZIp+ikqqUotMeiYy5UnDqeWUNVLRdxlAk1UdQo+9hj2zKsBCmY7nMbQFgY+5Qx7El/IbOt7uzBtUxZHbmVEAifoeMLcNUk3aDMnSpWOzVnIIepcdMiNJ28+PLN3OcvcmcrCgQji1y6zfs0/xm4ggRM9Oqw2Nwwx8dQE5auK4Pgw3NUK1Om+TYpm4PJQJ4u+wh6hrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5422.namprd11.prod.outlook.com (2603:10b6:5:399::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 18:40:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 18:40:43 +0000
Date: Wed, 10 May 2023 18:40:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFvlBMEvuhiT9QSB@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
 <ZFrDjttRaPf6hBeo@DUT025-TGLU.fm.intel.com>
 <c58f99e3-a11d-7f2c-cfa3-dfb14a44c6c4@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c58f99e3-a11d-7f2c-cfa3-dfb14a44c6c4@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abe073e-86dc-43a7-cd31-08db51860f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1HXoZWi5yD696TMFVrgy6LqXnaz6iKKdvtnkOLAvkEM8VCZzQ269AB7FJGM4zDreozcFQH7jtLN1Ugq8896BoQ2CRfLSjC7VMfIQLLvR6IXKILt/cra0g7AV/2dYKCzVc7OfaXKDwFp/m6MZzRl0zQzG0ic31i88plZucq9h4YWYY6x3dXYFpGZxxzq8hSH1i5+9RDieK/ta8qw+fcAOPVv0yjP7V1HTVT47X7TkyusBLremuXyACmfPwYsQmfi4g5Dt7KWQmp+9RqmHNguaya9OKISmdeFLYnfN83yFd3jI2S8HcLSEyFx3E+4qgwfIHjidoLpDyrMH5zuPC58dD4Jt04LJnijYNnJX4l9Q1gt9CCr2ia36W7Ingx9oXolWUv3hVkR2LXVrV0hVtP+q84yakSRpyvldOP544czGOIl8zAySzOWruQ7nAEFwl9w1WCq/2ONzIos2OlkaCsRKEDsr1pH6ETDMtDKGLmpDlPesQQDLmaB8ejKpd5ivLtQmkGtZvJ4wE0BEGKHeb3GObEtvL9G9bej0wT6f+PNpBkeWNLTYnJDOUnaXvSwyxCO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199021)(38100700002)(53546011)(26005)(6506007)(186003)(6512007)(66574015)(83380400001)(6666004)(6486002)(66946007)(66556008)(66476007)(316002)(6916009)(2906002)(4326008)(5660300002)(44832011)(41300700001)(8936002)(8676002)(86362001)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S/4/AmnxojSohk02ckQIcLzJwsBtbuQpULlF7DokgBqTFdzp6xcq8OcZfM?=
 =?iso-8859-1?Q?XxD4TVso1W+F8XOOMDTdTyIYF0b8kaohKgNYSpvNn5YMhjm1mdNQrwjw8H?=
 =?iso-8859-1?Q?6kL5VB4FBMGEMqleHVjuoGoOjIb6QPRMqcLSQ+cvJKOg7ptSOuxob0b0D1?=
 =?iso-8859-1?Q?zLcKBhHzfkcUfEqYT7koW7w7UuYMvVp/zsiyEiqNs2/ApCBAUMaKmJhdI8?=
 =?iso-8859-1?Q?PK5YOZoZHUzySoylpWawydg32MwTzNu7hiSgiKeWG8rlRoqDYp4C1QxPVf?=
 =?iso-8859-1?Q?qdh8qMJ6FHYLylVtXQnYf+0+C0uuIfDIcoFActg14gvwO8qBb1lHH4xMto?=
 =?iso-8859-1?Q?8f3akHuD/A/4II6zI0Q9l7Rz6ST6c6/fJrQXqhzkVxQO8Ao5TJg07Cu9py?=
 =?iso-8859-1?Q?p08vWJ2qgAXQtfc0b22PqQZAC38JJAUQ+PDluYtWMEwmLQFtlIgrycYAZd?=
 =?iso-8859-1?Q?gXU+WdeQYzj30d6rhoWnIXH+kc4DbLvO7czZNlk+9uO2oxS6HhE7QOBXMV?=
 =?iso-8859-1?Q?yFwJ+TWonG/YZt4vrUCg4Jsl2Up1IXFwRj943pXc207ftvrGLrjgIK100U?=
 =?iso-8859-1?Q?7YsX2lcggcdgPe2GEST34lD3F4Ts1xCGidLKTJ7lARcdrKGpnIfIREQiZs?=
 =?iso-8859-1?Q?qMvxduZfUU2kAXz/kOlS7GhugaHgHnmYUNTM6CmtxfCleMDvKVe0DqoZOQ?=
 =?iso-8859-1?Q?UZwf86Q2k3WKU6OSzpY4lxzd29r8wEqnJo3ZNa4XhCKQ1GvRceWBwGBtxK?=
 =?iso-8859-1?Q?3vybKubXKllArhalD9kcOmO2xwVngSVG88p5UvxQTriWV/oiSktvLiyz7O?=
 =?iso-8859-1?Q?oOhtRG+VMLU7ofDs+TgYGLf6jwbbSa2id14S9jiTLHUcBqVfzijILTLbi5?=
 =?iso-8859-1?Q?MwieJC8tHsfUKSuo2sSKffE6euKOc6h62Cceu+G7eHgLOCgVik9Vi9GfwY?=
 =?iso-8859-1?Q?5isQhrPuyhIVIQSip16pDQHbrwgo8s3q3EcwzFor/XALuT9nLyoKcpX71e?=
 =?iso-8859-1?Q?X5ZDWs6YjmJcwzWMddZM2V+qDYsNNkpYG16aEGhBu+3WTmy+U23oqE3aKh?=
 =?iso-8859-1?Q?p6WWJacJF68JBnRKUf8LKLeybefl3m8FuVqJE7ln+m6s81ZdlRIg4Hwmaj?=
 =?iso-8859-1?Q?h7exghL2x1f+PUieke0bMXON1BVthdgP4LKOttK5Fgjx2NvCuyCL++AVen?=
 =?iso-8859-1?Q?ts3IBea7IY7mOcSuU13n19rxm478ksHzbTdpgRf1PbAXEOmcJbE21/uKaN?=
 =?iso-8859-1?Q?F1f7ToPILuQ5Yuou+DxMb/BEiTOuAmbKJ63EV4zT8ufXSm8ZWlUvjuCPdV?=
 =?iso-8859-1?Q?6GTwZ4jZmLB3ab53nkpMGKceIHSaSaH+Ms81M1RmH89RLGhDrer1CfR7va?=
 =?iso-8859-1?Q?yrv/h4VjJpHNvQwuVoML2LzmuvsR26e9Wo6om68cbESIQPORpfed/TxDm7?=
 =?iso-8859-1?Q?d0lRYOAvftTkWhE59pSxqI2agIpTVCUvOcagVIT3kzjSyM4AFnNyGS7Xli?=
 =?iso-8859-1?Q?e9Dwry3nZXMHArw9PwW1XDxEKQbo5p9uJNEufpRzdonQR8ynRbpJ+qV1ta?=
 =?iso-8859-1?Q?8VbNQWlXkZowF+x4cu7jFL2z0piK4tT3QCtykh4ix38K7kGNJQ0g9/jq4l?=
 =?iso-8859-1?Q?mS+x5ezgihnYXf4BxLodsHWuCiZ80jArXNijguhN27iQmHyRPuU/3+Ew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abe073e-86dc-43a7-cd31-08db51860f66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 18:40:43.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uqV7TSAFQZJUzcY+6SUc9g+yJJbo/WYBhr4vUuOjxCUNXWaLkt1hmH4a14z7VlTL2SbR2HyI9yEWC0r9Oa+Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5422
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

On Wed, May 10, 2023 at 10:14:12AM +0200, Thomas Hellström wrote:
> 
> On 5/10/23 00:05, Matthew Brost wrote:
> > On Tue, May 09, 2023 at 02:47:54PM +0200, Thomas Hellström wrote:
> > > On 5/2/23 02:17, Matthew Brost wrote:
> > > > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > > > LRU position on every exec.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
> > > >    drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> > > >    drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> > > >    drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> > > >    drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> > > >    5 files changed, 40 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 3ab404e33fae..da99ee53e7d7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> > > >    	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> > > >    }
> > > > +static void xe_gem_object_close(struct drm_gem_object *obj,
> > > > +				struct drm_file *file_priv)
> > > > +{
> > > > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > > > +
> > > > +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> > > Is there a reason we don't use bulk moves for LR vms? Admittedly bumping LRU
> > > doesn't make much sense when we support user-space command buffer chaining,
> > > but I think we should be doing it on exec at least, no?
> > Maybe you could make the argument for compute VMs, the preempt worker in
> > that case should probably do a bulk move. I can change this if desired.
> Yes, please.
> > 
> > Fot a fault VM it makes no sense as the fault handler updates the LRU
> > for individual BOs.
> Yes that makes sense.
> > 
> > > > +		struct ww_acquire_ctx ww;
> > > > +
> > > > +		XE_BUG_ON(!xe_bo_is_user(bo));
> > > Also why can't we use this for kernel objects as well? At some point we want
> > > to get to evictable page-table objects? Could we do this in the
> > > release_notify() callback to cover all potential bos?
> > > 
> > xe_gem_object_close is a user call, right? We can't call this on kernel
> > BOs. This also could be outside the if statement.
> 
> Hmm, yes the question was can we stop doing this in xe_gem_object_close()
> and instead do it in release_notify() to cover also kernel objects. Since
> release_notify() is called just after individualizing dma_resv, it makes
> sense to individualize also LRU at that point?
> 

If we ever support moving kernel BOs, then yes. We need to do a lot of
work to get there, with I'd rather leave this where is but I'll add a
comment indicating if we want to support kernel BO eviction, this should
be updated.

Sound good?

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
