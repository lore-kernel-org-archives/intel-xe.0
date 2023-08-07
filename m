Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A416C001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 18:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC42B10E0ED;
	Mon,  7 Aug 2023 18:30:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BD10E0ED
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 18:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691433037; x=1722969037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uwDEbvLszMKq8fddjz1nXzn5xDPz/+nZvgAayIHRRPc=;
 b=DJekj5sqipoE9YIKbmTiqbBuf/3gwj3IXupJvbIdOERrk4AyLw3cBxvf
 G7EyS0Qig6WvgpcWSTmdL0lnXg4zvpgmIoxv+KQ7NgcQ5I/1LQ6OwXYTW
 AzKhuQMycFgk8wZG72MxBvsksC5py/D9AMy2FWTkcirFw2JzM7KDa1Zk8
 kAXBC202mDLEKr8gO773cpWQfRIyrhja1fvv18vSUafdZMvXixgOhRFdC
 p9H7vnJUktV6ngxWmszgNRsg+Ee5CnIsw76pd7WY58bvIiF+qhvlYUdmq
 BQoXTuuE7AlOs1f2vQgvwl6la/JZhg59yVSl8xaw0Acs9cbGaHki1b+q5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368072912"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="368072912"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 11:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845130445"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="845130445"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2023 11:30:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 11:30:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 11:30:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 11:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEzZn5jwFx1+NsCAEnNl4ExtKj4scQg9bLFQWQ/J4x73PjS+nswEWNHIv7rsKVa3kpRgeNJLmy2w9z8vrn2wTi+Z9rWLWRyoWUW6Sulx4nL4lKH29ktcc1cL7XPsEhuekkXFsE+wVoEAdthF149mz0/RZ58Bwem7TgCPH9/dA11ib0kkAJbamTMXh3aTrqA8OyNd1tFg00Ds3GNNOXMP7EeWgcmhZV4jxXH0yceFOqwDaYA13FBl+6XYYW7tqeV35EyjLslEsaT2wFjmb+8/YV1phR5BdrJ8cGQMeqRl0QXlrdkb111yw1bGLVxigSmWlFL4EfQixru8pLoGko1eYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hXR5xfs3dU4GZ7VMIW59XxpUR5ccD2nDxEheUQP8H4=;
 b=Osa8/5R0inJH+Qe+3ikISjXvJqMsZW3TdSH1s5b0N4/3k8npKcoSrl306MdI8gKcetGRf7fCub5bAMYJhBUnKSArynSK/W80ZOKufHyeOH7EWt82aC+cnZ/Q47Nc3notibhjQfOdYOX2i9Tj/rMJ655sq6rhc5rfp7qeEvrba8pyWQL7y9QqkbJCi0iAG5T1m5xQTasjWGCK1fm5xoFDG/QagtOxqqtrDnTMv/1Vp0CGba50pcy7X0ZMXMwTz87fFD4TY4YKcXzOZVZLrsp4QVLx+O7B0N6sBALHuiWsSWuy6nbi5TVs1nbliyl3xIFFojO1oDPwvqmvICQa/FDp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 18:30:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 18:30:34 +0000
Date: Mon, 7 Aug 2023 18:29:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNE4COw+b8WvqF69@DUT025-TGLU.fm.intel.com>
References: <20230807130226.49777-2-matthew.auld@intel.com>
 <ZNDxdJtc96V3tRij@DUT025-TGLU.fm.intel.com>
 <1019a70e-cbbc-e6e7-28b0-39666e3e9a88@intel.com>
 <ZNEEhcq8YTR0CbjO@DUT025-TGLU.fm.intel.com>
 <8f6fc52a-addc-d1f8-e8c9-47bc8e6bcc41@intel.com>
 <ZNEY8D9eU/xh4wRY@DUT025-TGLU.fm.intel.com>
 <e6d25a26-1f48-9d7e-1d99-9fe98f4d6e8a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6d25a26-1f48-9d7e-1d99-9fe98f4d6e8a@intel.com>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: be811e22-98de-4cb5-c4f9-08db97746349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCDwgpzdG+vuhnGjbzRc9xLqTRtOqlpIFNePf6UAlxC9xDcqrKW9EJjm6GJIP9dakMM/y+C6cwo2FJPGFGDYhGFM8Xwg4MaRNcKzkS7MzXuEqTnco+JZJKAIHhnBRSJTWjQXXAQBlQ2NIlCtqcOAv7JUuNmwcgyr5/pZ1AM7b3Hw4ojTk7niUdcY42s1RxRtP0nzdkK4/3UvnL0lT+xLADxSTO2/gOc8QZf+ERvg9qB5rQ08ANU0JtEsdf0j1jIczbNCSYTNkBYsu53U/0NGiAH4ERxqxXN+65Kk4FOpR/cTHvGlyUgIFem3BW6OTc5liPVKBrO05jFu71van2NRuqy2mt9+7QOpQ8ZSeJvO2Wok/c9zCR2yiF7237iTMMCc3sKlFFvaPFEErWoTFNoAeUjHkqhT21E1I+YJc+JZBkFWw0HUeyEIvpM7ocrDz8D5ACA+swaBLhdWNhCdpNWTmBFgi0bH39mjb5a26eQPWvgdH3A43gGj15pmN0LfQ91d+AGkQ4bhMndNUN3jPhEYuhISWqX54qxYePnTvpDGYfre5yJk8+7th8A8y2efj5UvmIPE1m69k67aTiwogu2IND+AE1+QeVOREFDurKk/Sws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(396003)(136003)(39860400002)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(44832011)(83380400001)(8676002)(8936002)(6862004)(478600001)(86362001)(316002)(82960400001)(6506007)(53546011)(38100700002)(6486002)(66476007)(66556008)(6666004)(66946007)(6636002)(6512007)(966005)(4326008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2C00O8bmiywkl+asoMcxUE0pw92niB5R1HoSq9xJugJ6qr9kW4HFUQyRQziI?=
 =?us-ascii?Q?c3OgYWOd/EJIatgg58F2er0XP57ENWumDqNfMJoWT3KhtD1SgdI46ur55KG7?=
 =?us-ascii?Q?rRtOJij5i0VlWaKtzWh/ILBQnNacbEzLuLhCP5JeyM0TeSsQL0UgO4f5Lfgs?=
 =?us-ascii?Q?MUZTdJGl8j2y00A0f1EN/chzuyKeoAL9A+I0Kp4tpkuu45dm89MtM0qqq7Cm?=
 =?us-ascii?Q?yxnRznv+sBmwWcmkoCHD3ZRvKyY/TiiWB82c1CA6X4ocyFKkRb4wFQLP5qyQ?=
 =?us-ascii?Q?UQEx/zLO0xFHBfY9NJwmvVtvW8kzrjC48duvW5PhOY5rnsmmcHNeXVuxhOva?=
 =?us-ascii?Q?/broHRt6w5hPCZVhSe2lKyZIXOLqOg6qf4iHX3HjbPB983FpllxG/axVIEA2?=
 =?us-ascii?Q?UspUGE6H/ZsrdYOzAAAgCJFB8Caf1Oh4P8V89pCASuzhzVJmmLJs1dsmRNJ+?=
 =?us-ascii?Q?ALpdWjoVR61bRuVn+3Ti2FMw201wPGc+UxUL+lIMv/XkxzEM6w5AePjWspR/?=
 =?us-ascii?Q?6sS045Yo+KJ9S1C7PWgN/+dn6qqWc8US4O8pqOW6OKo3c6SkiCU+uC65NDs4?=
 =?us-ascii?Q?azZJBPcRfKC4ACYSbMnIlFy77MT51KwQG9uKT/U2i7CYTKhjUVicRa38nRjC?=
 =?us-ascii?Q?J6Lybl4FxgfkrOydxyTqEXxyGlPtUMZiaYP7A27PI9aRqHmrPe34yGv2Uuat?=
 =?us-ascii?Q?+9CODNSdJnLFUGp0jsRSA0+riLWzOqab/z6Y9ub8Njwy6A7NwKQ4z/MIoRiv?=
 =?us-ascii?Q?USmTKEjmKkRsMHUjtoljIj1M3belK3+m6k5yviHhsJWmZPzp54/eS1fsOU0C?=
 =?us-ascii?Q?nFz8fgoPiBoBOOUdZQwWlVDvZxkP0M704TGm34Mv44h0tBPWXkIvRrynk0rV?=
 =?us-ascii?Q?78TxSJfPS1rg0yWSYvY7sc2TgaKa3zl3V960BpV4wgxltTGFlcqapDo32v8A?=
 =?us-ascii?Q?NguvPvHCITD5ttS0SIR5bxE5Y9m1+wB0nTd3P/HsWB0IfKSifdWnN8CqZw06?=
 =?us-ascii?Q?qM/x0ZYYYRjtAVTnMo+YVDRCq1RBX1jkcLu0czIccFeAIYOl3zHEeNibg9xy?=
 =?us-ascii?Q?s/yepg0g/KBVa2yeQoWGxaizUzN8yML4Z8j1icW6MadMp0GepMxgrsSt/YPT?=
 =?us-ascii?Q?DlcupO+tVW+yt6scc8KqCFK+g1GLWJiTOX5qQ+yUie7mqg41OXBCAXmy+bGA?=
 =?us-ascii?Q?xUhkR1OM2V7RhMSGA1KFfPxlml2givbxsB/ZsXeTVd2HH72V41GJ1gZhGxuw?=
 =?us-ascii?Q?l0OXS+VLBTJK1B6uSkGLRsHzZQiQT+BMpGneLwEiQTWPCv8ITh2Q1R3UPx+g?=
 =?us-ascii?Q?Qz5Yq6GNcPKZpQvzyN/yO2S76nilG31CJBQWXMH6BDntMBKGIQQ993W8AmtJ?=
 =?us-ascii?Q?S0GNYv7DtgNnMA+S5JFWyKucAup0/Tj9H8wYijMWvbl9/OJEt0olG55wXCjU?=
 =?us-ascii?Q?AsazhsC+DiWG7A3r0ccRQgn0EFwbJEKSuLv3WJf1Q9gl8egNTAVkMLo5IoJ8?=
 =?us-ascii?Q?a+8K0//is4SYfBMyjLJHamt0V7sXKlfOm371TP8wpCcxNguWoeLjEmNJuv6q?=
 =?us-ascii?Q?xdeLxaKZ50tVoNqgT6/Vn7w6OwJiNn/ZnlS5lVNnFikXYgS1AORnoW3sxZKK?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be811e22-98de-4cb5-c4f9-08db97746349
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 18:30:34.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76GNUNYfgFFgd6SITgzccUuCiogen4qnqXvTDkw0+5PsNw1czpIeZ3LYvorCB4aqC6i62V1v2eUGsFOrgGjY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Mon, Aug 07, 2023 at 05:51:22PM +0100, Matthew Auld wrote:
> On 07/08/2023 17:16, Matthew Brost wrote:
> > On Mon, Aug 07, 2023 at 04:19:46PM +0100, Matthew Auld wrote:
> > > On 07/08/2023 15:49, Matthew Brost wrote:
> > > > On Mon, Aug 07, 2023 at 03:41:30PM +0100, Matthew Auld wrote:
> > > > > On 07/08/2023 14:28, Matthew Brost wrote:
> > > > > > On Mon, Aug 07, 2023 at 02:02:27PM +0100, Matthew Auld wrote:
> > > > > > > It looks like it's plausible for eviction to be happening as we are
> > > > > > > closing the vm, however the rebind_link and destroy links are in this
> > > > > > > case not mutually exclusive, since eviction only needs the vm dma-resv
> > > > > > > lock which the vm close drops when accessing the contested list. If we
> > > > > > > race with eviction here it can run rampant and corrupt the list since
> > > > > > > both the destroy and rebind links are the same list entry underneath.
> > > > > > > Simplest is to just split these entries into separate links.
> > > > > > > 
> > > > > > 
> > > > > > I think there is another problem here too, I think
> > > > > > vm->notifier.rebind_list could be corrupted too.
> > > > > 
> > > > > AFAICT that one always has vm->lock held, and close_and_put() doesn't
> > > > > release it until nuking the vma, so I think it's fine?
> > > > > 
> > > > 
> > > > External BOs do not hold the VM->lock in xe_bo_trigger_rebind so I do
> > > > think there is a potenial issue.
> > > 
> > > Maybe I'm misunderstanding something as I only see it being added to
> > > vm->notifier.rebind_list, which doesn't involve the combined_links. Once it
> > > can fully lock the vm later, when for example doing xe_vm_lock_dma_resv(),
> > > it moves it to the real vm->rebind_list but at that point we are holding the
> > > vm->lock, and if the vma was since nuked we never actually transfer it.
> > > 
> > 
> > It is not related to the combined list, rather a race between
> > close_and_put & trigger_rebind.
> > 
> > close_and_put can remove from the vm->notifier.rebind_list, then
> > trigger_rebind can add it back in, VMA is destroyed, and now we have
> > destroyed (corrupt memory) on the vm->notifier.rebind_list.
> > 
> > Make sense?
> 
> I'm still not seeing it tbh. AFAICT trigger_rebind/eviction needs the bo
> lock and so does destroying the vma (if applicable). If vma destruction runs
> first then the vma will be gone from the list of vmas for that object, so
> eviction never sees it. If the eviction ran first then vma destruction will
> simply remove it from the list. So the actual vma destroy vs trigger_rebind
> looks to be serialised to me.
> 

Yea I guess upon further inspection I think the vm->notifier.rebind_list
is safe. That being said, protecting again it being destroyed in the
eviction path is not a terrible idea either.

Matt

> > 
> > Matt
> > 
> > > > 
> > > > Matt
> > > > 
> > > > > > 
> > > > > > I think a better solution is to check the XE_VMA_DESTROYED bit in
> > > > > > xe_bo_trigger_rebind before adding to either the
> > > > > > vm->notifier.rebind_list or vm->rebind_list. Both checks should done
> > > > > > under the list locks.
> > > > > 
> > > > > Ok, let me try that. Thanks for reviewing.
> > > > > 
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
> > > > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/xe/xe_vm.c       | 10 +++++-----
> > > > > > >     drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
> > > > > > >     2 files changed, 11 insertions(+), 10 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > index cb28dbc2bdbb..aa13b2bcda86 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > @@ -891,6 +891,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > > > > > >     	}
> > > > > > >     	INIT_LIST_HEAD(&vma->combined_links.rebind);
> > > > > > > +	INIT_LIST_HEAD(&vma->destroy_link);
> > > > > > >     	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> > > > > > >     	INIT_LIST_HEAD(&vma->extobj.link);
> > > > > > > @@ -1063,7 +1064,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > > > > > >     	struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > >     	lockdep_assert_held_write(&vm->lock);
> > > > > > > -	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
> > > > > > > +	XE_WARN_ON(!list_empty(&vma->destroy_link));
> > > > > > >     	if (xe_vma_is_userptr(vma)) {
> > > > > > >     		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> > > > > > > @@ -1449,7 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > > > > > >     			continue;
> > > > > > >     		}
> > > > > > > -		list_move_tail(&vma->combined_links.destroy, &contested);
> > > > > > > +		list_add_tail(&vma->destroy_link, &contested);
> > > > > > >     	}
> > > > > > >     	/*
> > > > > > > @@ -1477,9 +1478,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > > > > > >     	 * Since we hold a refcount to the bo, we can remove and free
> > > > > > >     	 * the members safely without locking.
> > > > > > >     	 */
> > > > > > > -	list_for_each_entry_safe(vma, next_vma, &contested,
> > > > > > > -				 combined_links.destroy) {
> > > > > > > -		list_del_init(&vma->combined_links.destroy);
> > > > > > > +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> > > > > > > +		list_del_init(&vma->destroy_link);
> > > > > > >     		xe_vma_destroy_unlocked(vma);
> > > > > > >     	}
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > index 3681a5ff588b..a01dde418803 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > > @@ -79,13 +79,14 @@ struct xe_vma {
> > > > > > >     		 * mutually exclusive execution with userptr.
> > > > > > >     		 */
> > > > > > >     		struct list_head rebind;
> > > > > > > -		/**
> > > > > > > -		 * @destroy: link to contested list when VM is being closed.
> > > > > > > -		 * Protected by vm->lock in write mode and vm's resv lock.
> > > > > > > -		 */
> > > > > > > -		struct list_head destroy;
> > > > > > >     	} combined_links;
> > > > > > > +	/**
> > > > > > > +	 * @destroy_link: link to contested list when VM is being closed.
> > > > > > > +	 * Protected by vm->lock in write mode and vm's resv lock.
> > > > > > > +	 */
> > > > > > > +	struct list_head destroy_link;
> > > > > > > +
> > > > > > >     	union {
> > > > > > >     		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > > > > > >     		struct dma_fence_cb destroy_cb;
> > > > > > > -- 
> > > > > > > 2.41.0
> > > > > > > 
