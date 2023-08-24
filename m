Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B6C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 14:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D122010E126;
	Thu, 24 Aug 2023 14:17:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341BF10E126
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886671; x=1724422671;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Q1JpEab4WTkqFF0lffpwanvs+HZmkIIEWVvd2p7OHDA=;
 b=n1iM7ZLUkSYa2rycxqVnFBfOofGqSq945GE8kxzu53TOQlnRv3I3Scc7
 pYF5RXJrdMsU3Z0oOaqebUns3iZIdDs5mwTWvoC1DiJDXkeJuY1wO3Xpc
 D+GU+AUNEMlaBkz0n///R+xY0Xf9QqFy+YvwHKyHDt62yM/4fR9k9Qgiz
 u/cNUgFZ6UP4qZBg6Trn8VPwndHyCTiCHWGdwUwYMDtLMNYzEzTyAKJmN
 Ulo46TOdX03W6b4WsG2hWZkv8mkn6g2qSpM3uICraWWWyqP9Vo9BTj3OE
 5qrdB4c/joktgzfVHLKgge2CjSEMxqvBgW74IyoEhdsDdRVb9Cem75wCU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354779807"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354779807"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 07:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="772111291"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="772111291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 24 Aug 2023 07:17:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:17:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 07:17:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 07:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxryEjvttIx2t1S5p4wXHiT9ayfF+tPu/Okt2JvCAQI83KkbM8/K2vZ3+KmrHEwXBaBmkdotpZJZ7JlVqXz6c0sg1JVUAWOrpVZ+cCRirn6pVVltQdF/IvrTn+RNf+Mci7FQz/T+xRD15s4KXkslwZpWt2DY2YsON9zqw1GzA2rX6Kp0kKPzW1do7tJyhPObDYAke7/hv5W/8dqDGzQsCF7/ztnFGcbV1EtgjAlfSCVu8yxYGWcSuSDZPjgkdXgo7jZlZIPrTR8g1Z30/CuQSBTHM6jQzGmFOzelmO/yQHh9Hr7fINDhehTtgn6R0DXTw7WGiPmBVFP1p7PQPT4czQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lft4isiHC6QrD3ouCUYWU99mEIz69L1kTrseeARMGH0=;
 b=E7v4B1C5QmtJid6z9cdQZnOkGH2PUrWOMLMu1gsdbkROeMKM+taGe0KmVaRUDt2CEwNidm0iqI7ajG0Op2qgJIgtNkQzqdJjiyBN4aQNoPR+bOAKv500eTXVlabVZIjPikcCaI/OnIQnAf7u9vCjpnPlxwhxYINo/Q/8bvPRBCNoNseFCcvl/OVS68deJpydqMUki/qCgawwdgEc4odP4O6Fz13DISXhkRJ6q3pnT9OhV1npVj0VOwI+sxIobqBrCUapCB0z92VvMFVYZepGy5xYemc2QMdZ7V2ni32fEkT2YXQcEUoosT4tlxe54w76buF4SsCtUUaMAHbiNtVfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:17:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 14:17:43 +0000
Date: Thu, 24 Aug 2023 14:16:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZOdmNTdCTiYyieA0@DUT025-TGLU.fm.intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
 <20230817043148.740495-4-matthew.brost@intel.com>
 <59e97073-bee1-31ff-2672-88fe4e3dbecf@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59e97073-bee1-31ff-2672-88fe4e3dbecf@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 508da1de-9c9f-4801-4a30-08dba4ace180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA4OcNO5tzTlsfIkLxymrSTajNoJw3AuuzBKIWHaisQej/xJzfa5Oqax76eMRjPShdUzmAwpVkE97f1DdWI4HzRtpK01uLroH2b/h7LTn2ebjqBcFfhRcQQdo8bye0yBWtX41wewQ1MjzT7Vav398Qz0HxGsAbT2o6F4WaSC4JmlQabpCt+DeQmTy2ZGYU2j7GiTR5GxcjYd4C+SM2ZSUKUvSAVmsgTy7JoT/0jAz1xoWQ7e7ycDRra2DRPYEvYF+vxxSNb7m40mvtFiXzMa+lpNrDlPTpqS10B415TzBS6GWOGdm1k/QD65vEoTl7MWYmhs1CKMXgxmkSuOcmNRBlgC3jp5gwoGTJRcg4/mtmcMVQpp9wZkHVJJ+S2ObNxAfNFt91fAO/RT91xxKszmLS2qMmy/M3N2Am6qgypwotsgmCkJfqlj4EGiTLSTh0s1TrZIN5umMw1B7gswuvTRpry/085Rn+2UqkAxTs7WdVJYVrkM+07GVWYfFSKf1eNDtrVkcSYpg/qS9sX+2ImU7jyXgIFSuEDg+YfoHm/u4tZc+mrxhL9a8d6A4EN4xamJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(1800799009)(451199024)(186009)(86362001)(38100700002)(82960400001)(6506007)(6666004)(6486002)(478600001)(5660300002)(6916009)(316002)(2906002)(4326008)(8676002)(44832011)(8936002)(26005)(6512007)(53546011)(83380400001)(66946007)(66574015)(66556008)(66476007)(30864003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LnJjjvfKnP+RvOuqQBhBV3UWo7SzySbyFbzdD3+1lunXvuKy8ZB+YZPB4G?=
 =?iso-8859-1?Q?ZWoEL9keSp4IyqSEaL3I14FXbcwHIbtEZUao7Nx2J1IUoBu4EPGGDp7Hsz?=
 =?iso-8859-1?Q?yPWcYlYQgUrFAbYfVo0aEWcpChd7EbRbQSlIsDRfBzvHVgFKztLH8Uoftn?=
 =?iso-8859-1?Q?Y6a3EaEEeW6FCYOx6imVGGZ7kz6ZF5lINra0w9vTkV9XYXOgDZXIOJ4G4O?=
 =?iso-8859-1?Q?AujhLTiMYWtlXizShkSV67zzWEgN6lFUDMbGuOC20oXFt46ZgLGYzOUuXM?=
 =?iso-8859-1?Q?5p+SA4M0Kpu1/ZXC7n4rnCAJWHf4Q1ZCelqCtr30HE/mnGVBgdusBC50mi?=
 =?iso-8859-1?Q?8t2mI8w6teynGKxcAMcq8wiwxE72QSPPWfFJjf4PdC6G2MycwIhMnk1W0t?=
 =?iso-8859-1?Q?Zdw4B2d7dN9JMEyWw1TL1ZUCH8Ti7VgphjH6IHVKUh2YzytPEzZ1UT+hSC?=
 =?iso-8859-1?Q?1ZSLJm79m1lZlKF8jKn9sf5KEG63CvA9i+Mv8ovueeEbMfEapoCa5Kku4z?=
 =?iso-8859-1?Q?/uRNst0Cat3yq1bGW4+u3UtU1OU0YuzKlaMGW5okuXg16Co50IC5J463hB?=
 =?iso-8859-1?Q?grH3zewjFY82WH3l5aD93wGPG6IZ256VQaeQbUELUaH+iSgN3hh9ihkCYu?=
 =?iso-8859-1?Q?PfqZWWeQ/VVNP4J7fLahyALWKoy0BDNgPGnoK9ybsJCijXuL1MRlFutEiT?=
 =?iso-8859-1?Q?zhk6wdr0lEPNJWe5A/5TG39I0+7ND5/Q8mQX6/h+YjdY+Gkn61vcvA0YRo?=
 =?iso-8859-1?Q?vN++l5Pt2WUWMYAtP8lLlp+TOHG0b9Bdr4MDN1Zi+AxLGFzJsamyneLRBe?=
 =?iso-8859-1?Q?ZVz9vLZZNdywZHu8BH2e14SetnY+ghrxHILGVelyRpm0YkHkO3Z1biMj1u?=
 =?iso-8859-1?Q?4NsTPFsIgq7olz/tKcIArjCwZvnoRN5+2ABHhbanKgUBaKLdApoevcsEfC?=
 =?iso-8859-1?Q?5W1tET9vnQ1Qm9fZI2S4JHdhOoRWrZZs1JlrHAIsPjg9QgoxnL4uiZDX84?=
 =?iso-8859-1?Q?BMiXk8Mm146p+h8qJTMnwnKef3o9gIXb9W9lXacK/7sldUlqePcPVGAwis?=
 =?iso-8859-1?Q?Qx0t9QzpO9Zp04sk7+di2nPRQYcPVDlF493VNLqgfX0FwqFTCKcRQNVswt?=
 =?iso-8859-1?Q?63UiYdMXbTAEEUGBeCxc/pupwcxpwirqeu/JD0FQXZZPynlZUP5cqQn7XY?=
 =?iso-8859-1?Q?czT0TzgvDzkMv5lOs3nSjSf2iDjIt0YCE5ox8S0tfiH1ijTFojOoGuYFfE?=
 =?iso-8859-1?Q?4Lr7P1ellkqZyQyoy5hDG4+/dG4q4DObS6jw1cGiTXnyFEttiW0m8ss0eB?=
 =?iso-8859-1?Q?waz6o76q5xOGCtzO7kZkAIk1r0CC/CvIS73suFauxeZCGuD1FcwTM/6hle?=
 =?iso-8859-1?Q?5GjfI3yelxijW4g53uT0D+86H+fSSFwC5VRgs2xc1izeNRYUdR7OBBxcI3?=
 =?iso-8859-1?Q?9sGaicWMcjvztYixXWuWUmnIHGbyz3qSpgej7cpKDwRBNxM17squE6zZ9w?=
 =?iso-8859-1?Q?P6trmzKoctyKzym0UmmBrN+Y400B1FElYYVumO0RnKYwaw7CCY/bG0+Vba?=
 =?iso-8859-1?Q?4sWtSciL0RnLXNt+Fcq9hL3WpPRvRJHmFo0r4OWOqNGP4mY7NbL7tY6g6S?=
 =?iso-8859-1?Q?fclGIR2SCUkjcWwbut4p0QtW2NRO6AcJ8aK6HJ/TeUcP+92nvs2sccUw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 508da1de-9c9f-4801-4a30-08dba4ace180
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:17:43.0111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K5MHDogkJTPZPDpgQmyHaPzY4qZsDogUX6RWcVkK5XScWh+nt9WjLg6YVmP5lMsJaWcNTLk9XL41ODLFvtqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix array of binds
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

On Thu, Aug 24, 2023 at 12:38:41PM +0200, Thomas Hellström wrote:
> Hi, Matt.
> 
> On 8/17/23 06:31, Matthew Brost wrote:
> > If multiple bind ops in an array of binds touch the same address range
> > invalid GPUVA operations are generated as each GPUVA operation is
> > generated based on the orignal GPUVA state. To fix this, after each
> > GPUVA operations is generated, commit the GPUVA operation updating the
> > GPUVA state so subsequent bind ops can see a current GPUVA state.
> 
> Let me check if I understand this correctly.
> 
> 1) The GPUVA helpers only know about one GPUVA op at a time, so the GPUVA
> state basically needs to be updated before we call in to get the next GPUVA
> op for our XE op?
> 

Correct, after we create a GPUVA op we need to commit it before creating
the next op so the 2nd creation is looking at the updated GPUVA
operation. 

> 2) We're still able to rollback /unwind after each state commit, but once we

Yes the unwind of the GPUVA should work.

> start the execute phase and hit an error we currently can't do that with or
> without this patch series?
>

The execute phase can fail with / without on a single bind operation and
sucessfully unwind the PT state then the GPUVA state. Unwinding the PT
state across multiple operations is the hard part as this is all an
iterative algoritm (each update to PT state depends on the all previous
updates). This will be the challege doing a complele unwind rather than
pause / error state / restart.
 
> With that and the previous comments from me and Rodrigo fixed, this LGTM,
> although unrelated, I still wonder what happens if we hit an -EINTR during
> the execute phase?
>

Will respin with fixes, I wasn't aware the execute phase could fail with
-EINTR but we should handle this peoperly currently. If not, well this
all about to change anyways and this a step in the right direct + fixes
a bug a user can easily hit in normal operation.

Matt

> Thanks,
> 
> Thomas
> 
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 418 +++++++++++++++++++------------------
> >   1 file changed, 212 insertions(+), 206 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index bd20840616ca..2452e24fbc81 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2426,24 +2426,73 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
> >   	return SZ_4K;
> >   }
> > -/*
> > - * Parse operations list and create any resources needed for the operations
> > - * prior to fully committing to the operations. This setup can fail.
> > - */
> > +static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > +{
> > +	int err = 0;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		err |= xe_vm_insert_vma(vm, op->map.vma);
> > +		if (!err)
> > +			op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> > +				 true);
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +
> > +		if (op->remap.prev) {
> > +			err |= xe_vm_insert_vma(vm, op->remap.prev);
> > +			if (!err)
> > +				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> > +			if (!err && op->remap.skip_prev)
> > +				op->remap.prev = NULL;
> > +		}
> > +		if (op->remap.next) {
> > +			err |= xe_vm_insert_vma(vm, op->remap.next);
> > +			if (!err)
> > +				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> > +			if (!err && op->remap.skip_next)
> > +				op->remap.next = NULL;
> > +		}
> > +
> > +		/* Adjust for partial unbind after removin VMA from VM */
> > +		if (!err) {
> > +			op->base.remap.unmap->va->va.addr = op->remap.start;
> > +			op->base.remap.unmap->va->va.range = op->remap.range;
> > +		}
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		op->flags |= XE_VMA_OP_COMMITTED;
> > +		break;
> > +	default:
> > +		XE_WARN_ON("NOT POSSIBLE");
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +
> >   static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > -				   struct drm_gpuva_ops **ops, int num_ops_list,
> > +				   struct drm_gpuva_ops *ops,
> >   				   struct xe_sync_entry *syncs, u32 num_syncs,
> > -				   struct list_head *ops_list, bool async)
> > +				   struct list_head *ops_list, bool last,
> > +				   bool async)
> >   {
> >   	struct xe_vma_op *last_op = NULL;
> > -	struct list_head *async_list = NULL;
> >   	struct async_op_fence *fence = NULL;
> > -	int err, i;
> > +	struct drm_gpuva_op *__op;
> > +	int err = 0;
> >   	lockdep_assert_held_write(&vm->lock);
> > -	XE_WARN_ON(num_ops_list > 1 && !async);
> > -	if (num_syncs && async) {
> > +	if (last && num_syncs && async) {
> >   		u64 seqno;
> >   		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> > @@ -2462,145 +2511,145 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >   		}
> >   	}
> > -	for (i = 0; i < num_ops_list; ++i) {
> > -		struct drm_gpuva_ops *__ops = ops[i];
> > -		struct drm_gpuva_op *__op;
> > +	drm_gpuva_for_each_op(__op, ops) {
> > +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > +		bool first = list_empty(ops_list);
> > -		drm_gpuva_for_each_op(__op, __ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -			bool first = !async_list;
> > +		XE_WARN_ON(!first && !async);
> > +
> > +		INIT_LIST_HEAD(&op->link);
> > +		list_add_tail(&op->link, ops_list);
> > -			XE_WARN_ON(!first && !async);
> > +		if (first) {
> > +			op->flags |= XE_VMA_OP_FIRST;
> > +			op->num_syncs = num_syncs;
> > +			op->syncs = syncs;
> > +		}
> > -			INIT_LIST_HEAD(&op->link);
> > -			if (first)
> > -				async_list = ops_list;
> > -			list_add_tail(&op->link, async_list);
> > +		op->q = q;
> > +
> > +		switch (op->base.op) {
> > +		case DRM_GPUVA_OP_MAP:
> > +		{
> > +			struct xe_vma *vma;
> > -			if (first) {
> > -				op->flags |= XE_VMA_OP_FIRST;
> > -				op->num_syncs = num_syncs;
> > -				op->syncs = syncs;
> > +			vma = new_vma(vm, &op->base.map,
> > +				      op->tile_mask, op->map.read_only,
> > +				      op->map.is_null);
> > +			if (IS_ERR(vma)) {
> > +				err = PTR_ERR(vma);
> > +				goto free_fence;
> >   			}
> > -			op->q = q;
> > +			op->map.vma = vma;
> > +			break;
> > +		}
> > +		case DRM_GPUVA_OP_REMAP:
> > +		{
> > +			struct xe_vma *old =
> > +				gpuva_to_vma(op->base.remap.unmap->va);
> > -			switch (op->base.op) {
> > -			case DRM_GPUVA_OP_MAP:
> > -			{
> > -				struct xe_vma *vma;
> > +			op->remap.start = xe_vma_start(old);
> > +			op->remap.range = xe_vma_size(old);
> > -				vma = new_vma(vm, &op->base.map,
> > -					      op->tile_mask, op->map.read_only,
> > -					      op->map.is_null);
> > +			if (op->base.remap.prev) {
> > +				struct xe_vma *vma;
> > +				bool read_only =
> > +					op->base.remap.unmap->va->flags &
> > +					XE_VMA_READ_ONLY;
> > +				bool is_null =
> > +					op->base.remap.unmap->va->flags &
> > +					DRM_GPUVA_SPARSE;
> > +
> > +				vma = new_vma(vm, op->base.remap.prev,
> > +					      op->tile_mask, read_only,
> > +					      is_null);
> >   				if (IS_ERR(vma)) {
> >   					err = PTR_ERR(vma);
> >   					goto free_fence;
> >   				}
> > -				op->map.vma = vma;
> > -				break;
> > +				op->remap.prev = vma;
> > +
> > +				/*
> > +				 * Userptr creates a new SG mapping so
> > +				 * we must also rebind.
> > +				 */
> > +				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> > +					IS_ALIGNED(xe_vma_end(vma),
> > +						   xe_vma_max_pte_size(old));
> > +				if (op->remap.skip_prev) {
> > +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > +					op->remap.range -=
> > +						xe_vma_end(vma) -
> > +						xe_vma_start(old);
> > +					op->remap.start = xe_vma_end(vma);
> > +				}
> >   			}
> > -			case DRM_GPUVA_OP_REMAP:
> > -			{
> > -				struct xe_vma *old =
> > -					gpuva_to_vma(op->base.remap.unmap->va);
> > -
> > -				op->remap.start = xe_vma_start(old);
> > -				op->remap.range = xe_vma_size(old);
> > -
> > -				if (op->base.remap.prev) {
> > -					struct xe_vma *vma;
> > -					bool read_only =
> > -						op->base.remap.unmap->va->flags &
> > -						XE_VMA_READ_ONLY;
> > -					bool is_null =
> > -						op->base.remap.unmap->va->flags &
> > -						DRM_GPUVA_SPARSE;
> > -
> > -					vma = new_vma(vm, op->base.remap.prev,
> > -						      op->tile_mask, read_only,
> > -						      is_null);
> > -					if (IS_ERR(vma)) {
> > -						err = PTR_ERR(vma);
> > -						goto free_fence;
> > -					}
> > -
> > -					op->remap.prev = vma;
> > -
> > -					/*
> > -					 * Userptr creates a new SG mapping so
> > -					 * we must also rebind.
> > -					 */
> > -					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> > -						IS_ALIGNED(xe_vma_end(vma),
> > -							   xe_vma_max_pte_size(old));
> > -					if (op->remap.skip_prev) {
> > -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > -						op->remap.range -=
> > -							xe_vma_end(vma) -
> > -							xe_vma_start(old);
> > -						op->remap.start = xe_vma_end(vma);
> > -					}
> > +
> > +			if (op->base.remap.next) {
> > +				struct xe_vma *vma;
> > +				bool read_only =
> > +					op->base.remap.unmap->va->flags &
> > +					XE_VMA_READ_ONLY;
> > +
> > +				bool is_null =
> > +					op->base.remap.unmap->va->flags &
> > +					DRM_GPUVA_SPARSE;
> > +
> > +				vma = new_vma(vm, op->base.remap.next,
> > +					      op->tile_mask, read_only,
> > +					      is_null);
> > +				if (IS_ERR(vma)) {
> > +					err = PTR_ERR(vma);
> > +					goto free_fence;
> >   				}
> > -				if (op->base.remap.next) {
> > -					struct xe_vma *vma;
> > -					bool read_only =
> > -						op->base.remap.unmap->va->flags &
> > -						XE_VMA_READ_ONLY;
> > -
> > -					bool is_null =
> > -						op->base.remap.unmap->va->flags &
> > -						DRM_GPUVA_SPARSE;
> > -
> > -					vma = new_vma(vm, op->base.remap.next,
> > -						      op->tile_mask, read_only,
> > -						      is_null);
> > -					if (IS_ERR(vma)) {
> > -						err = PTR_ERR(vma);
> > -						goto free_fence;
> > -					}
> > -
> > -					op->remap.next = vma;
> > -
> > -					/*
> > -					 * Userptr creates a new SG mapping so
> > -					 * we must also rebind.
> > -					 */
> > -					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> > -						IS_ALIGNED(xe_vma_start(vma),
> > -							   xe_vma_max_pte_size(old));
> > -					if (op->remap.skip_next) {
> > -						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > -						op->remap.range -=
> > -							xe_vma_end(old) -
> > -							xe_vma_start(vma);
> > -					}
> > +				op->remap.next = vma;
> > +
> > +				/*
> > +				 * Userptr creates a new SG mapping so
> > +				 * we must also rebind.
> > +				 */
> > +				op->remap.skip_next = !xe_vma_is_userptr(old) &&
> > +					IS_ALIGNED(xe_vma_start(vma),
> > +						   xe_vma_max_pte_size(old));
> > +				if (op->remap.skip_next) {
> > +					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
> > +					op->remap.range -=
> > +						xe_vma_end(old) -
> > +						xe_vma_start(vma);
> >   				}
> > -				break;
> > -			}
> > -			case DRM_GPUVA_OP_UNMAP:
> > -			case DRM_GPUVA_OP_PREFETCH:
> > -				/* Nothing to do */
> > -				break;
> > -			default:
> > -				XE_WARN_ON("NOT POSSIBLE");
> >   			}
> > -
> > -			last_op = op;
> > +			break;
> > +		}
> > +		case DRM_GPUVA_OP_UNMAP:
> > +		case DRM_GPUVA_OP_PREFETCH:
> > +			/* Nothing to do */
> > +			break;
> > +		default:
> > +			XE_WARN_ON("NOT POSSIBLE");
> >   		}
> > -		last_op->ops = __ops;
> > +		last_op = op;
> > +
> > +		err = xe_vma_op_commit(vm, op);
> > +		if (err)
> > +			goto free_fence;
> >   	}
> > -	if (!last_op)
> > -		return -ENODATA;
> > +	/* FIXME: Unhandled corner case */
> > +	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
> > -	last_op->flags |= XE_VMA_OP_LAST;
> > -	last_op->num_syncs = num_syncs;
> > -	last_op->syncs = syncs;
> > -	last_op->fence = fence;
> > +	if (!last_op)
> > +		goto free_fence;
> > +	last_op->ops = ops;
> > +	if (last) {
> > +		last_op->flags |= XE_VMA_OP_LAST;
> > +		last_op->num_syncs = num_syncs;
> > +		last_op->syncs = syncs;
> > +		last_op->fence = fence;
> > +	}
> >   	return 0;
> > @@ -2609,58 +2658,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> >   	return err;
> >   }
> > -static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > -{
> > -	int err = 0;
> > -
> > -	lockdep_assert_held_write(&vm->lock);
> > -
> > -	switch (op->base.op) {
> > -	case DRM_GPUVA_OP_MAP:
> > -		err |= xe_vm_insert_vma(vm, op->map.vma);
> > -		if (!err)
> > -			op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	case DRM_GPUVA_OP_REMAP:
> > -		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> > -				 true);
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -
> > -		if (op->remap.prev) {
> > -			err |= xe_vm_insert_vma(vm, op->remap.prev);
> > -			if (!err)
> > -				op->flags |= XE_VMA_OP_PREV_COMMITTED;
> > -			if (!err && op->remap.skip_prev)
> > -				op->remap.prev = NULL;
> > -		}
> > -		if (op->remap.next) {
> > -			err |= xe_vm_insert_vma(vm, op->remap.next);
> > -			if (!err)
> > -				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
> > -			if (!err && op->remap.skip_next)
> > -				op->remap.next = NULL;
> > -		}
> > -
> > -		/* Adjust for partial unbind after removin VMA from VM */
> > -		if (!err) {
> > -			op->base.remap.unmap->va->va.addr = op->remap.start;
> > -			op->base.remap.unmap->va->va.range = op->remap.range;
> > -		}
> > -		break;
> > -	case DRM_GPUVA_OP_UNMAP:
> > -		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	case DRM_GPUVA_OP_PREFETCH:
> > -		op->flags |= XE_VMA_OP_COMMITTED;
> > -		break;
> > -	default:
> > -		XE_WARN_ON("NOT POSSIBLE");
> > -	}
> > -
> > -	return err;
> > -}
> > -
> >   static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >   			       struct xe_vma_op *op)
> >   {
> > @@ -2878,11 +2875,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >   	{
> >   		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
> > -		down_read(&vm->userptr.notifier_lock);
> > -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > -		up_read(&vm->userptr.notifier_lock);
> > -		if (post_commit)
> > -			xe_vm_insert_vma(vm, vma);
> > +		if (vma) {
> > +			down_read(&vm->userptr.notifier_lock);
> > +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > +			up_read(&vm->userptr.notifier_lock);
> > +			if (post_commit)
> > +				xe_vm_insert_vma(vm, vma);
> > +		}
> >   		break;
> >   	}
> >   	case DRM_GPUVA_OP_REMAP:
> > @@ -2897,11 +2896,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >   			prep_vma_destroy(vm, op->remap.next, next_post_commit);
> >   			xe_vma_destroy_unlocked(op->remap.next);
> >   		}
> > -		down_read(&vm->userptr.notifier_lock);
> > -		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > -		up_read(&vm->userptr.notifier_lock);
> > -		if (post_commit)
> > -			xe_vm_insert_vma(vm, vma);
> > +		if (vma) {
> > +			down_read(&vm->userptr.notifier_lock);
> > +			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> > +			up_read(&vm->userptr.notifier_lock);
> > +			if (post_commit)
> > +				xe_vm_insert_vma(vm, vma);
> > +		}
> >   		break;
> >   	}
> >   	case DRM_GPUVA_OP_PREFETCH:
> > @@ -2990,20 +2991,16 @@ static void xe_vma_op_work_func(struct work_struct *w)
> >   	}
> >   }
> > -static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> > -				    struct list_head *ops_list, bool async)
> > +static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > +				     struct list_head *ops_list, bool async)
> >   {
> >   	struct xe_vma_op *op, *last_op, *next;
> >   	int err;
> >   	lockdep_assert_held_write(&vm->lock);
> > -	list_for_each_entry(op, ops_list, link) {
> > +	list_for_each_entry(op, ops_list, link)
> >   		last_op = op;
> > -		err = xe_vma_op_commit(vm, op);
> > -		if (err)
> > -			goto unwind;
> > -	}
> >   	if (!async) {
> >   		err = xe_vma_op_execute(vm, last_op);
> > @@ -3042,28 +3039,29 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> >   	return err;
> >   }
> > -/*
> > - * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
> > - * vm_bind_ioctl_ops_parse.
> > - */
> >   static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> >   				     struct drm_gpuva_ops **ops,
> >   				     int num_ops_list)
> >   {
> >   	int i;
> > -	for (i = 0; i < num_ops_list; ++i) {
> > +	for (i = num_ops_list - 1; i; ++i) {
> >   		struct drm_gpuva_ops *__ops = ops[i];
> >   		struct drm_gpuva_op *__op;
> >   		if (!__ops)
> >   			continue;
> > -		drm_gpuva_for_each_op(__op, __ops) {
> > +		drm_gpuva_for_each_op_reverse(__op, __ops) {
> >   			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -			xe_vma_op_unwind(vm, op, false, false, false);
> > +			xe_vma_op_unwind(vm, op,
> > +					 op->flags & XE_VMA_OP_COMMITTED,
> > +					 op->flags & XE_VMA_OP_PREV_COMMITTED,
> > +					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
> >   		}
> > +
> > +		drm_gpuva_ops_free(&vm->mgr, __ops);
> >   	}
> >   }
> > @@ -3384,14 +3382,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			ops[i] = NULL;
> >   			goto unwind_ops;
> >   		}
> > +
> > +		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> > +					      &ops_list,
> > +					      i == args->num_binds - 1,
> > +					      async);
> > +		if (err)
> > +			goto unwind_ops;
> >   	}
> > -	err = vm_bind_ioctl_ops_parse(vm, q, ops, args->num_binds,
> > -				      syncs, num_syncs, &ops_list, async);
> > -	if (err)
> > +	/* Nothing to do */
> > +	if (list_empty(&ops_list)) {
> > +		err = -ENODATA;
> >   		goto unwind_ops;
> > +	}
> > -	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
> > +	err = vm_bind_ioctl_ops_execute(vm, &ops_list, async);
> >   	up_write(&vm->lock);
> >   	for (i = 0; i < args->num_binds; ++i)
