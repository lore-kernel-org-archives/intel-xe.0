Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8046AC001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 14:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904BA10E1EA;
	Mon,  7 Aug 2023 14:51:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CECE10E1A2
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691419866; x=1722955866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SLkum5ghZThHlLh7l/ryr9lMR7M5Vh7VCzO3YzOfOEY=;
 b=diKGRv+Q6HGY6AeOgF326lKBQ+gzdcMIWT+sGUE62m9Q+j9BXATQ0hQE
 67lSIPMiOrqsdG4BTVNtd364KUCSLnesZMRU4A92dAJygSE5N2pTWXwRu
 E1wpd4Ulyywvy/XJbR5bJLbL7O/FvQTz8X/uV+h3zNHR7wN1Hm1mVQ92I
 enLomK0t5xLKnflsiMbCOmivQUjKNR7cIrdbzhshZTohTLSvuUN3Fshz1
 vLd5gFX+FZ1FCSD3UUQpxuv6v/NJzf46Jujhkl6hDJfPEuo1LptsBiGBg
 uCGsHIl+uotGkRrvm/qJkiEwRguvow5LFDOhhIL2Ti9fTBHzAKE088UmZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401536659"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="401536659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724541955"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="724541955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2023 07:50:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 07:50:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 07:50:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 07:50:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 07:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVow4N1wNpjfNKTssJq9/SbgJFoREQP9c4tr1eFUe+y1hpOnOJXbiUchfsO5GPhXgFiMHvYPKZRlvzpf1ULtJBfgHS+jJ5X4CuppM61MxhM+QnA8J/nLKYxd9ooqurmWd51Z4GybbeWeaPC8xLKgWDH6/diQCzKPXigh7V4BaNvRjFWEKBL3hjNfrQ9dUIAQhcpkzEeJBS+9uB29452aSupaWeyDve/LnZHFQA19xT3JqjbeFJS6QUlkelC4Tp9M3EqLA7IxfJty34pU2bhOw+uSQvfvGfV1pSjoGWKQFDQjlRYeFJbuTDaFJYB70w5n2624ibL9TuO5dOLLLSedqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJqoE52Hi699hfiOdjvUzCwtw19fBtS7q3Dit6zduv8=;
 b=iR7EYYjFdnDuaQcSAOEqyTfoSNOQRzPZ01RN3G38dnOzo19ZMLhcZiaQ0EuvpGCys0nFLCqLfp7KNwGVf9/4lO7v66cs3O2wqGpoZw+pklcEZ3BBaBesLE7jp9Ok+fDsCZxp6kNx2cx2+2Q6PYiBkMQp3fNm0ljYflEqRWLftd9d/ir4RD3qtgGN67bZBkyr1eJeK9L0cLaOEW+WWkghGWM7JlJW1AQyyq5Ahq2Ri87W2Z6aGJOoU5KrEl4H7V/vlJ28CHoExn4VesAwzMHHSrggGtQKpTD/h+9cOlbKTl3dgo4/BTfynfC6bsvkoPTy+BsTXzB+Wq/RxggULQrAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8384.namprd11.prod.outlook.com (2603:10b6:610:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:50:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 14:50:46 +0000
Date: Mon, 7 Aug 2023 14:49:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNEEhcq8YTR0CbjO@DUT025-TGLU.fm.intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
 <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
 <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 122cb0c5-6411-4fc0-94bf-08db9755aeff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDfZwlrPRVCyBmARpsSNnmnE8Ie4fpHwqk7KBYX0+IikA0FyrKiTXBIE7/GFVTGd4YYsq1UTCpt5dlI8ICgCupurKOzbPtqRKuPiwDFFoe5xWtJm8ZR1yiM//VCTnTy6qu826xByaPr+e1/Ysy595dP/Wa6u8rDWHt5GvXMFuo1tunV2kcsvpwthK4dn//iSG7AsdKsF/Qm/FAGZ4ICIL93+22NNC4LXtu1KKQDEnNpcNC5ngrQ3inMzYV9f87+gWjgL2sAlmoSi2UKz3DHbD2WAlaN0SJot54xxz5ZKrtJlRhga9v1DJiQCzzC3VJ6aBKnm47CZbPz7FsKRpckIQgD3PRvZiCoTdYvE+DS5pT5AsRkpKMzk0j1gXOCo1SEa/J/83vLAT8yBnQVOnC60oXx/w5dw4fsME03JWpsY7fqRIvR4TuKlTH7ZkyFGOy7LWumlLUlfiaa8Tcrr0kahmnSw34B94iVMQ5aI3bL8e2kp4fHDFvVGDI+xd8bbNpOUN81QhYCiPnMSt5LgRF+82zX709pF/tu1U8G05byVnT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(186006)(1800799003)(66556008)(66476007)(4326008)(6636002)(41300700001)(66946007)(316002)(2906002)(478600001)(6506007)(966005)(6666004)(6486002)(6512007)(6862004)(26005)(53546011)(8676002)(8936002)(44832011)(5660300002)(83380400001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgTH8M/D4Ex6QCoM6Psti4UAYloGui/e0tk2yq4HWBnLtqcsrAnD+i/h4QPn?=
 =?us-ascii?Q?yBgk5NzzRtNpitMPe5JZbcXIHm2bhVkswDWw15I5d2zhUY5RN09Y5EVtFAD+?=
 =?us-ascii?Q?UKZLYvzqNLgZgeP1xJppIv2OuSO+EvWAObQOF+g2qXDiSfHg6va+Y5HGF2+o?=
 =?us-ascii?Q?izHLxwPa8jqEI0vqlEwgOMiMuZm1zxyNgwKhNkO3Fuujk5Pi7PuEkPyBn2H6?=
 =?us-ascii?Q?fGgxIbuoxQaP8EjkGjb54bASGJWtCuEPtlUNprHXUu6uTlD+T4eQrTMFVLlc?=
 =?us-ascii?Q?MZXaKxE+TeArB0rsdndmLS6LzqsPXLjN0pXqqeagEVfSfLhwTg9pXZ3RNEMy?=
 =?us-ascii?Q?JtE6iATRh6Ks8Mn9PMFVlxGTuTjFlrlmth0X1KtmVYbLq1c0yu8E3Qc0s7oe?=
 =?us-ascii?Q?zCRwyWDY6FKxabd01RPHCKF57oKg3N+RxWxtMQKqU6F/+jSF+Jn3LvidY9Ns?=
 =?us-ascii?Q?bZcspfSBOHmbnfAbK63ePSQ9l/dFjcDtUNlihcRK6jLSXOnxQVYzRah5TkY0?=
 =?us-ascii?Q?hc6IhukyJQJD4dzlWXGR5cGhUADxsvMtd4tzcCwKs20YtRZdCWlHfTYREMjj?=
 =?us-ascii?Q?XxYDtBB8gddOmqAYGNOgBfmY2086QJSwocfsqYok53RgE4VTRWq5sFHoZC4k?=
 =?us-ascii?Q?rtTK2lVkVJ+RbqwzzLVt9lv+Iw1zR8W3RgVmD2EMcXWtiQaGHj9HE1EJQlIZ?=
 =?us-ascii?Q?YThguhAYqQZbhEt0+M/38Nobj+ddtEaknPW10zefJm02IeTPE4WYuhf/Sdi9?=
 =?us-ascii?Q?iPl8kP61d4qgBre0d7cFAA+W+kv64ha0TVXiKoJj1nS0Pu9g/hT7d45j6GPg?=
 =?us-ascii?Q?4C0JjOZ3I2z8mJaek1er4SFVLclrK00Hk3Ypmg7sRBN4xIeomdXGZEKz1Z8d?=
 =?us-ascii?Q?TaE/Bz3OGmYK0oqIOVSI0XunyqkRjy4v9D5pLaa8xCFz0twi5AvoxSrh8R3+?=
 =?us-ascii?Q?N009NN+PykbM7kjO5+XeLWRy79HmQj3F6OL7Pim/eHJX8IIKbf8yBih3IWIM?=
 =?us-ascii?Q?JIWhMiApjvDqSbN+0OOxrMpOipAoVKQMUv9N0xOo2ahARbwWPBBqMB2PrCwl?=
 =?us-ascii?Q?ILrVYjEtgqJVq3EUOlJGRcHEXMW0QxOSrS7Swesxr+9gai6ZDVkumonXiRUi?=
 =?us-ascii?Q?pC4bmHyrNAlwA3sShZqjUgsiCOnT1qcpfoaEVZ6kEaIPAC/ZxXbSGqSVA+2Y?=
 =?us-ascii?Q?HtWGv7OeJRzXW4t2BA0WYKb7IKu3O820rYhlJxXdtDTsvU+O+VglyS19vb3G?=
 =?us-ascii?Q?T8cU0awadcNjmnxEmArkFvD4YvwaEX/ytRKRic/v7y8q9OpXGX9lGEaL+qOH?=
 =?us-ascii?Q?5rJKwMsm3Qc+Q8Cf68XLNZFV5/CfJQfZz1AWZirKYDEWwrim3K9HlU0BMXHB?=
 =?us-ascii?Q?Xbte0AY51mo3Ld7Qizt//DyUTncm57jDvvDTGxWX+vWUPFHkNWA5DO0l3d81?=
 =?us-ascii?Q?Dxh/Mypkywex6+5aj1fgJh8zewkqNedm4t7LI/eZzed3q3qRgLuUCbUEluyL?=
 =?us-ascii?Q?GIquU1uxuKHZ0T7B7H6xwNdPBDZ//QSPqzoWkSZXe3ZR1WP92+/GA4/swN80?=
 =?us-ascii?Q?bJ7YqyFYRQ/BnKOg0d4wBmCH/SxxnxuMa8Z9l09EjEaRlXD9KjxRt2NijEP2?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 122cb0c5-6411-4fc0-94bf-08db9755aeff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:50:46.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fw+nw0pCa5b6KzKrTH2TVuL6EXgrzw0Mxtzp58DEAtLjdZMv3Y+9xVkiYclYc8EGCSrIC2/Q5PN/NP1vC3eUtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8384
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: uncombine the
 combined_links.destroy
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

On Mon, Aug 07, 2023 at 03:41:30PM +0100, Matthew Auld wrote:
> On 07/08/2023 14:28, Matthew Brost wrote:
> > On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
> > > It looks like it's plausible for eviction to be happening as we are
> > > closing the vm, however the rebind_link and destroy links are in this
> > > case not mutually exclusive, since eviction only needs the vm dma-resv
> > > lock which the vm close drops when accessing the contested list. If we
> > > race with eviction here it can run rampant and corrupt the list since
> > > both the destroy and rebind links are the same list entry underneath.
> > > Simplest is to just split these entries into separate links.
> > > 
> > 
> > I think there is another problem here too, I think
> > vm->notifier.rebind_list could be corrupted too.
> 
> AFAICT that one always has vm->lock held, and close_and_put() doesn't
> release it until nuking the vma, so I think it's fine?
> 

External BOs do not hold the VM->lock in xe_bo_trigger_rebind so I do
think there is a potenial issue.

Matt

> > 
> > I think a better solution is to check the XE_VMA_DESTROYED bit in
> > xe_bo_trigger_rebind before adding to either the
> > vm->notifier.rebind_list or vm->rebind_list. Both checks should done
> > under the list locks.
> 
> Ok, let me try that. Thanks for reviewing.
> 
> > 
> > Matt
> > 
> > > References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
> > >   drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
> > >   2 files changed, 11 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index cb28dbc2bdbb..aa13b2bcda86 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > >   	}
> > >   	INIT_LIST_HEAD(&vma->combined_links.rebind);
> > > +	INIT_LIST_HEAD(&vma->destroy_link);
> > >   	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> > >   	INIT_LIST_HEAD(&vma->extobj.link);
> > > @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > >   	struct xe_vm *vm = xe_vma_vm(vma);
> > >   	lockdep_assert_held_write(&vm->lock);
> > > -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
> > > +	XE_WARN_ON(!list_empty(&vma->destroy_link));
> > >   	if (xe_vma_is_userptr(vma)) {
> > >   		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> > > @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >   			continue;
> > >   		}
> > > -		list_move_tail(&vma->combined_links.destroy, &contested);
> > > +		list_add_tail(&vma->destroy_link, &contested);
> > >   	}
> > >   	/*
> > > @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >   	 * Since we hold a refcount to the bo, we can remove and free
> > >   	 * the members safely without locking.
> > >   	 */
> > > -	list_for_each_entry_safe(vma, next_vma, &contested,
> > > -				 combined_links.destroy) {
> > > -		list_del_init(&vma->combined_links.destroy);
> > > +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> > > +		list_del_init(&vma->destroy_link);
> > >   		xe_vma_destroy_unlocked(vma);
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 3681a5ff588b..a01dde418803 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -79,13 +79,14 @@ struct xe_vma {
> > >   		 * mutually exclusive execution with userptr.
> > >   		 */
> > >   		struct list_head rebind;
> > > -		/**
> > > -		 * @destroy: link to contested list when VM is being closed.
> > > -		 * Protected by vm->lock in write mode and vm's resv lock.
> > > -		 */
> > > -		struct list_head destroy;
> > >   	} combined_links;
> > > +	/**
> > > +	 * @destroy_link: link to contested list when VM is being closed.
> > > +	 * Protected by vm->lock in write mode and vm's resv lock.
> > > +	 */
> > > +	struct list_head destroy_link;
> > > +
> > >   	union {
> > >   		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > >   		struct dma_fence_cb destroy_cb;
> > > -- 
> > > 2.41.0
> > > 
