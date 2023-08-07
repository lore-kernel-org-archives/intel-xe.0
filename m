Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAFCC001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA2610E2A0;
	Mon,  7 Aug 2023 16:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A702B10E297
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691425078; x=1722961078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x2+66ggqwADhw5VT66Ur4VhnoTlCPfe1QpbXvg11grQ=;
 b=fIXY021M+p8CNjiyVH5lTSRe3AmMqloWPd0E9rx3ZLWu4lgM02pq6wRl
 X6f1OS5VIDNlO+Fhhuk2yBd0+OXVn4eohQWxfJKh0B0PDEBsPGra8dN6V
 pFqhVPdGkEwoxjUvrzbBySc5kf8tMte+zWdqWUjohzJLHek6aqZuXF7kw
 LKZhfFE7sz6LWIsgwwzSuJaG19myxqzFwerOPocbXi9AyrnDcvCtwHU19
 M57ibsgGB5zJapypHXIs/1sQ/SyX6zMG0uF9YuUu5SJVx9k0ozhaME2oI
 cO3gSJoP6xNZAnhlrkWhlz/w0tTeexSuui7XiIowcA5sbuZ+ZypkFOGKR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="436917320"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="436917320"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 09:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734126173"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="734126173"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2023 09:17:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 09:17:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 09:17:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 09:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgXMWTfe/v4E7jjpun4TwowvvV10bVJD1VedmRHAc0Ym+u6+xtneaaxwhgyWwMjG/EZSt1+xrfEyEmtIZNZpxoDelqCROa4JzCrUJgqNzxtlPVXBz93FwEbHK+oyi1Q5u+0PXoy6f3RR5co9iVuZc00O9go/3maVm4nalCwqLLHdAD0jwXuPdoZF91RVEUyqGY560JLKqg43vD6HXAh/6VK1bmAq9XCF8zNTFFvo7Q148qsySCWd0AX1oidCaHJZ562pCuGHwDJxkhJGVUTciwNAVesJpBHne9+ijhJqy91xt7MUzOirRg/sXomttQMJ++/40NE0z7KgQOJwO+n8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxpe/aKoQ+tJycvKk+2qUlZ5/VRjiwz+rry15Do8re4=;
 b=jcbGJYd6UK+DvQjBOYoYIM7M/4zCUH2mvrrnkUuUebUTzBlvLA7G5nTeVVjtJiJANG4EwhhdIMOVpkwawSHmYJwNAHgsGB1bTrlMutp1yQCMtmyWHWlO7VQ9H5ZxzjOdUIBwp6G4pqljv4BafwgR5qKIl0aqnV+xP3DLHhrdkpbWx0tCxCmaAoq0CiM/FBW+87BdbgiS6yikETMB7Mq9ozlPrSUEywCo+XImi787NwZUf940wQ0bmzeCzbwj//qjE+0UbL+kCrK2Rn2Zy7nJgRWsyRuwOLe0e/B+9HzB+hZ8Hn9060KEAY8y1lQZYK0fuPKsGlMw1AHVN+vpPRQSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 16:17:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 16:17:53 +0000
Date: Mon, 7 Aug 2023 16:16:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNEY8D9eU/xh4wRY@DUT025-TGLU.fm.intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
 <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
 <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
 <ZNEEhcq8YTR0CbjO@DUT025-TGLU.fm.intel.com>
 <8f6fc52a-addc-d1f8-e8c9-47bc8e6bcc41@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f6fc52a-addc-d1f8-e8c9-47bc8e6bcc41@intel.com>
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e9216b-8816-4f1d-feb7-08db9761da86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gt30jv2pfz3nnnHbQi9nIAhgtFzc9eSAFGzpRWdHIIP6AXBa6yFFYuH/4Mt6Gt9Luz8bEwS0Fr70Jl+YcrPu5zVw+XKJopdi7Nw0iCdLMeken679R8Q0a1LWvqTi+0SxtNXv/E9Qf2i0LxoqJsM/BFlz2N8wqRmIo/cs4zeuI/5cQGjOcS5RnH3ZmFtz/JYDxpXeVpXbezaTHuvehy6sPjaPydD5BmwuwGgwSPQd2ECPzC7Hwd9lgbynsK3yIMVHBtbgwN8qeFhIHvH3zQrWjowhaz8OKQdHEO+CjHaL4q3oeSva6lErR7JmYcdb1vX37QeQ38jAMWPzf0ik9pQ/zafy9RVRLeW1Bp7J5EcDRs7uHkaYB7jXadp4DA/vSMrORZe4SOTsCRLBzmmTQJ3Ef0cqhSCyRlEKa3jz0LDjBslxlPkuJO6djMR/y5YYqwxXKRQEX1zVn57ftr0ow2urzvLuRKEUYs70brAtQM3jTR6FBe67sdfi+5Dh0O18QBDIc4hL4gr2kdWIoRoejq51HvbKxqHy4VhdlDjZrx875Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(186006)(1800799003)(83380400001)(4326008)(38100700002)(6636002)(2906002)(5660300002)(316002)(6862004)(8936002)(8676002)(44832011)(66946007)(66556008)(66476007)(41300700001)(6512007)(966005)(86362001)(478600001)(82960400001)(6666004)(6486002)(6506007)(26005)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AAmhtnTtIBNGwjLpS2R83AeuvMEvrzKUvYi/tUbivHsleQit6eV6j2H3gOLp?=
 =?us-ascii?Q?5pXzlxAI7ox4S5IiDUP3GYnzAssM3FClDTnMVT5QTTAt1BI7Nhi0CzvPw3ar?=
 =?us-ascii?Q?rChQ2wVf0iPI6DEPZf2c7W90ssLz3Yf+IU5he2nQdXMVonuuoDhThqdcfKSS?=
 =?us-ascii?Q?H0jSn1Wyb9mXB13YGT+wWraj7a3+HrBJqqvvSVVCvw2EolhqY6fXj9c3R20E?=
 =?us-ascii?Q?RRuIMv/zY8DI5wn20nRvVI764MeVIu6SGNQOr/73z9garyC0U4l6OLZH0jR1?=
 =?us-ascii?Q?Qd/+U4Avy4lzptIO4Fe9iTiXj3H9O4Bh/GZUviHFIVZK3cJoh0YNrHX3HT0L?=
 =?us-ascii?Q?vHrp9eOmTCzSdliOW5DU19EUYU50U0OKoC3Y0RCh36f1pEdC6gGdEMMG1QSc?=
 =?us-ascii?Q?QxdnQcuy2mIjl8ZvR4HWTmbZ0KhE+sypVFHuNurwByvn1KwNn7ckyvlIBT7Q?=
 =?us-ascii?Q?rGWNQ9HDpwy14eJGnrl7JalI0bGnhJAKZdmOzE9Xv+IJ+11kG/k8MJHnXIgS?=
 =?us-ascii?Q?7LZEi6DY6yi0w3R7CekvjvxzbinKpXWh8KNMtrLZlQUehiKJNUThvL1jrt2Y?=
 =?us-ascii?Q?pNdL+f6lOIxCQqxaPEJh1PVVwzsy63bmMau21N7eRnBaEZ/ep3dZIQ/Mnwja?=
 =?us-ascii?Q?OLPyvcZhZ1o+U1Z+xz3kmNFzJQ2TuP1+EtxQqNiYhgeiSDaPJO58P7PFOw0P?=
 =?us-ascii?Q?7QSdeJXGEQpxb4QYI6aNSRs52dG6kDAzWJe87GVtXoLIsg/1LZDyQwcCH980?=
 =?us-ascii?Q?+yV5izRugNZQV371y7uSjp5i50DRWejRF69uPNgzclc0abm/EL3pE2+1G9iW?=
 =?us-ascii?Q?5Np/ExN8sGbvsYYBuIsf1MzbLAsrFRCVE44iK+OuerCGX9MTtduPjEeyzfKu?=
 =?us-ascii?Q?/ZPHBtjXlEMETSiYBpUYRIHitKw7bNA1MMBNCPP9zXaTZ7R1Yh+/NDxdsBPq?=
 =?us-ascii?Q?RDCxxuCc7vByor+p7m3fuWgGP3PS/DFJD8DtbFaZziV1KTzW5PkCF7oReYD+?=
 =?us-ascii?Q?hMYV74eTjgcxCVT3/zswbfk5ymHvzReeaToeAA7utopQAC0iR/mLWVnthyVb?=
 =?us-ascii?Q?A+j2knIZjyK231WdeTHnXSxgWZIC/TEtbMOs+rJli4zU2tCGSlWWL8n50mhT?=
 =?us-ascii?Q?q+bG+19um4iNDg6kD/ctqTblJYWhtgZJXd/6IQvvu/pLXM9128QRlRppLvwK?=
 =?us-ascii?Q?Hrvah5AypJgwdAOwCNp89fGzW36UnMfBe2mIR9lex8Nlm6BsRrM6KFmA8Clx?=
 =?us-ascii?Q?7yiAniFK7ywqDOrWby2ZMPH4bifQB9sxPY/3NPjOENLY2ILJdpZCAiF1GXb/?=
 =?us-ascii?Q?raspvaL9a4SHsrt9y5NqQ0zVb84/XGnfEsbySSd0Lk6ZKH4ogY2bVwvQ6ntE?=
 =?us-ascii?Q?CKTTwwFBbuDuwtM1Tb0pDwcm8UXncL1/fAq48Uhbt7mdgR4ElP/avrOaK5aV?=
 =?us-ascii?Q?OA4BzhtA27lRb8u3Ag0beGa2298pTOVUNJ9f+A9xAXDdZbOpP4FWhK3/rOAV?=
 =?us-ascii?Q?I2yKJVd/i0NvO/xe8afgtxioZBh5wLnKhgRAHmJuifjs9l/ObUtRq/tJdkIK?=
 =?us-ascii?Q?sbQtuMPujQx3yy3FYr3JUoBZT0qKs5W9KphAsBkwClc+382rb1DpFqwdKXLW?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e9216b-8816-4f1d-feb7-08db9761da86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 16:17:53.8160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFyQjZpoMsntVHEu8iQLiOIVuQB5r7WI4wds0zahlp2eZK2rwnEhMfczqyaYexQ+T5QHS+cc1SKMtf6Vyf5Ahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

On Mon, Aug 07, 2023 at 04:19:46PM +0100, Matthew Auld wrote:
> On 07/08/2023 15:49, Matthew Brost wrote:
> > On Mon, Aug 07, 2023 at 03:41:30PM +0100, Matthew Auld wrote:
> > > On 07/08/2023 14:28, Matthew Brost wrote:
> > > > On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
> > > > > It looks like it's plausible for eviction to be happening as we are
> > > > > closing the vm, however the rebind_link and destroy links are in this
> > > > > case not mutually exclusive, since eviction only needs the vm dma-resv
> > > > > lock which the vm close drops when accessing the contested list. If we
> > > > > race with eviction here it can run rampant and corrupt the list since
> > > > > both the destroy and rebind links are the same list entry underneath.
> > > > > Simplest is to just split these entries into separate links.
> > > > > 
> > > > 
> > > > I think there is another problem here too, I think
> > > > vm->notifier.rebind_list could be corrupted too.
> > > 
> > > AFAICT that one always has vm->lock held, and close_and_put() doesn't
> > > release it until nuking the vma, so I think it's fine?
> > > 
> > 
> > External BOs do not hold the VM->lock in xe_bo_trigger_rebind so I do
> > think there is a potenial issue.
> 
> Maybe I'm misunderstanding something as I only see it being added to
> vm->notifier.rebind_list, which doesn't involve the combined_links. Once it
> can fully lock the vm later, when for example doing xe_vm_lock_dma_resv(),
> it moves it to the real vm->rebind_list but at that point we are holding the
> vm->lock, and if the vma was since nuked we never actually transfer it.
> 

It is not related to the combined list, rather a race between
close_and_put & trigger_rebind.

close_and_put can remove from the vm->notifier.rebind_list, then
trigger_rebind can add it back in, VMA is destroyed, and now we have
destroyed (corrupt memory) on the vm->notifier.rebind_list.

Make sense?

Matt

> > 
> > Matt
> > 
> > > > 
> > > > I think a better solution is to check the XE_VMA_DESTROYED bit in
> > > > xe_bo_trigger_rebind before adding to either the
> > > > vm->notifier.rebind_list or vm->rebind_list. Both checks should done
> > > > under the list locks.
> > > 
> > > Ok, let me try that. Thanks for reviewing.
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
> > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
> > > > >    drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
> > > > >    2 files changed, 11 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index cb28dbc2bdbb..aa13b2bcda86 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > > > >    	}
> > > > >    	INIT_LIST_HEAD(&vma->combined_links.rebind);
> > > > > +	INIT_LIST_HEAD(&vma->destroy_link);
> > > > >    	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> > > > >    	INIT_LIST_HEAD(&vma->extobj.link);
> > > > > @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > > > >    	struct xe_vm *vm = xe_vma_vm(vma);
> > > > >    	lockdep_assert_held_write(&vm->lock);
> > > > > -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
> > > > > +	XE_WARN_ON(!list_empty(&vma->destroy_link));
> > > > >    	if (xe_vma_is_userptr(vma)) {
> > > > >    		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> > > > > @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > > > >    			continue;
> > > > >    		}
> > > > > -		list_move_tail(&vma->combined_links.destroy, &contested);
> > > > > +		list_add_tail(&vma->destroy_link, &contested);
> > > > >    	}
> > > > >    	/*
> > > > > @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > > > >    	 * Since we hold a refcount to the bo, we can remove and free
> > > > >    	 * the members safely without locking.
> > > > >    	 */
> > > > > -	list_for_each_entry_safe(vma, next_vma, &contested,
> > > > > -				 combined_links.destroy) {
> > > > > -		list_del_init(&vma->combined_links.destroy);
> > > > > +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> > > > > +		list_del_init(&vma->destroy_link);
> > > > >    		xe_vma_destroy_unlocked(vma);
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > index 3681a5ff588b..a01dde418803 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > @@ -79,13 +79,14 @@ struct xe_vma {
> > > > >    		 * mutually exclusive execution with userptr.
> > > > >    		 */
> > > > >    		struct list_head rebind;
> > > > > -		/**
> > > > > -		 * @destroy: link to contested list when VM is being closed.
> > > > > -		 * Protected by vm->lock in write mode and vm's resv lock.
> > > > > -		 */
> > > > > -		struct list_head destroy;
> > > > >    	} combined_links;
> > > > > +	/**
> > > > > +	 * @destroy_link: link to contested list when VM is being closed.
> > > > > +	 * Protected by vm->lock in write mode and vm's resv lock.
> > > > > +	 */
> > > > > +	struct list_head destroy_link;
> > > > > +
> > > > >    	union {
> > > > >    		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > > > >    		struct dma_fence_cb destroy_cb;
> > > > > -- 
> > > > > 2.41.0
> > > > > 
