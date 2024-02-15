Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E13C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 06:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C8510E229;
	Thu, 15 Feb 2024 06:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="He75mQht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8410E229
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 06:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707978854; x=1739514854;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5fCvjflnMwWau9PPMLCKistqwO6I2uiJp9atGC+Kvmw=;
 b=He75mQhtu+UcbKxmOdiKNBiA2ieQoOWqAGSdHvagaK6MH9tIab9n8Zze
 FaBUHryjCkN2lTv5wikamUc7QRbHbtpPd3q035plw5NW+8wfKkjz3pQ1e
 HOk9sDckV4lMWmWY+QghQ160poPV1b4KE5bVEJlMLuxtLQ+jlgtFu683y
 iIqjzcgnHNtP9nqTBJoz74vYy5mxn/j7f6im20hbbiw9yyHcThUNP9Gg1
 zLyyNCw/3SxncrAe3l8aluMxVChr0WDT/VNqR6KWQdHSrZ3dYK4uBhI0/
 HK6PDzGPzrf0G1r1SfNrmPoc5whUDnAH106c99epxByIKxsQpzyBE0LZi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13153046"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="13153046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 22:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40926166"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 22:34:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 22:34:12 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 22:34:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 22:34:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 22:34:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIybGZ3jiU6KPpj/Wj+lKovYhVNmIP9yx3Dpw7z5UpswAqSKUVAY5w3kr+O4tMXqo1388nAJhWATV8PxgbbL1oaEswQmskZ24II5aEJgV/B2fDmIoaGU0KcTakNQPmBDJV2wCrK3Ftijh5hdguILw0zWnze/b93enMCqFdKfZrdNgfTkHcmUx50QY9K0fVdUbBG32NRpzS0vrgOlU6uKfgRKOGgk9BcUSGS6OEibN/UeW0WOiRAm9dGuJoBfLfNIdCuKSX7cnuPpZ10ya25ipWDNYArdU8o6KFAAU3SrWDGAYrn7G03rmmYgTRJe+NNOYAZaYplEC3Pw9z/g1QM+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1uY7wjROOyMRoY8lLDCEH+TvGthj/w1ITZiJw9Uirc=;
 b=T9P84vgWoE6qOhlLI5aZDBva/CZlRGVDQWvsYD0Qk0LKJiHNe/sLyjWHEANfcyatXifDgt8S3lxulevUIUovK2qIkzfJIOTRfFyjjtoCvzhtbJQNcLIsw+fZkIP5rxt2yeQNObV7mFicYclmdP/sLvbtkBHME79JR1Ch3tYHtCc/IJQrLIOeV774CoUvXAfmns5iuGHSxMgLxoIhMFOOR3uDSCDppurHRwEOmYieMaPSQQ/OIsVP5XcOcXWHYnRmd67VYA617SkMr+43L3SEKQSAL+JElpwzaq19FMA+4mJQLc8g46bWzikM788pPFgfFlYQ5RRzUpTGca+NJxJV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.29; Thu, 15 Feb 2024 06:34:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 06:34:08 +0000
Date: Thu, 15 Feb 2024 06:33:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: RFC Deny unbinds if uapi ufence pending
Message-ID: <Zc2wPWDoZJFUfCIU@DUT025-TGLU.fm.intel.com>
References: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
 <20240214141217.361122-2-mika.kuoppala@linux.intel.com>
 <871q9f3zdt.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871q9f3zdt.fsf@mkuoppal-desk>
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: d2f82f20-1d25-41bb-4f5f-08dc2df01d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mK1n1B91SsSJqQVLU9BHxxHihx5TmqRSoiGpsU8ggxudy0o0ql/i1aF74COvTsUW2HSF/28LKsOwqaa1QrHn4qy1LYrqCWaGNV4USc9xfTAuqgVx44/m00i2l2XE+q0lec4VK0+D0JT9gNX7oL14C5s3RuXIBZcQLgZUvsXsh0ATUDT3f9B9ex4D3SfvzdCnOYzP33/hpgspqzHlF9f0SzUp3C5o80Y44zBTDQsAT8faRVewG2fMItBLkZXtod2Jz7LPKHUO0EgyGQ4i05KwtjfyTC5l+NVIhRAko1W5VeQMW8PqneVtT4iH3m6Dsr2Pw/WCuB7shIhGIVH6Pc9Dgbj/FR2dL/H+fju9ifpuU1w0lTegGf+v71ZewBgLtpvhG5CNYd7PcTUul8OoDiTuZ1hClLuw6nsqhNs0hGgc3cc7Xg2s2Olb9oEOchhK7q7neMAeGhlaSoIm9sGq8y/Imk+vTxn676Vfl7XkEaq7BI5C1uF1/VSPdyTURHl4mEDeSSl154hO/b508TxXK6rn3aqZo0kc20Tq4hgPT3d0rFBZC/obS8cLChemsesXhduaNEaF5HzZr994DYanVxbdxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(966005)(6486002)(6506007)(6512007)(6916009)(8936002)(8676002)(4326008)(38100700002)(86362001)(44832011)(478600001)(5660300002)(82960400001)(66946007)(66476007)(66556008)(2906002)(83380400001)(54906003)(6666004)(316002)(41300700001)(26005)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nxjxjhjjJCpvMZomxkCa/mQXP1BfQaS5sa7Vb/mNAM9F80szabaC6Egqgg?=
 =?iso-8859-1?Q?tGMoYlorsB1QbgRi8rmkoSe8fcKcnSp9sciaI33ryPLCl3MX4DvHNSBVBy?=
 =?iso-8859-1?Q?4fjuhsi4Ewuht3poeAbsIjbUu9A8SD36Zk28ea134kbQtJ1KdtI4p7uotE?=
 =?iso-8859-1?Q?MZVP0taDDOY753h6anaPF1dBiKlVOH1rdcJ0D3Lv5cA3SBdWmZfDgw1s4U?=
 =?iso-8859-1?Q?fmW9HxkZfibmWErWtyKeNMGjPaRcQpfqRBv6pSgU8cGHArIKXAaEN2BYnH?=
 =?iso-8859-1?Q?OxmML+BQ6HRNoNnt86G8uC10q1j+hNNaQQAk0ewqAWe6OfhrD5BtqJ8m5u?=
 =?iso-8859-1?Q?Tyhl4nil0rMNvZpJMBg9h/KLq70lxzPBSwikQMf8VXsAxubYs9FuR6oE5a?=
 =?iso-8859-1?Q?CWviop+U3qAtCJx2KGfRn9o+PyV6lgk3BbvXwQfw4nVQbL1z7NCAjh9+hb?=
 =?iso-8859-1?Q?gs1ASkmgezTLlbqJvIR58WP7mVq3mZHKjyewJ3V30P94fWOH/9FyzDV/l4?=
 =?iso-8859-1?Q?63r2Vipt31xmeElppZ0lQAgcVTWjGWuYRGgPa84MPgNyFJC38u2hpiOb4w?=
 =?iso-8859-1?Q?Qh9YcwAeJBoopDaa2pnjxTYOrcdN33OVp2NSXT5aPGRad+FnqKN4nh8FCy?=
 =?iso-8859-1?Q?IuI9bkl2pH8ZKejZbjSVloxwYcjCRJ/kWsSPo7+Zqb9+OVG+es349EOUgt?=
 =?iso-8859-1?Q?Gw+XZAVNJPcUTdu1P4sEyfLo7pXqMOjrGSt4+rpH8nxIddt4WwfdclgtlF?=
 =?iso-8859-1?Q?0VGzFF1dT12Igd6jqsiUxXdk3MQXqZmpxNjx4dX+KWH9kVpxUtRFberYV0?=
 =?iso-8859-1?Q?uxNGNN8876u/MGu6w6JvOGi3DfR9dokFNENACwReaeXJcXTg3sBSoJDXpR?=
 =?iso-8859-1?Q?GFj86EXzrZH9rqE4tDgjN/Pq5oawouKySrr9efdhkxtZPDgKTtUJ00Utew?=
 =?iso-8859-1?Q?mcMsQ2qTo4NbFMf7EY7ray4C9uGrnEt+ucirgUHP1Vkm3U2xG6l2rQm599?=
 =?iso-8859-1?Q?f2sNf+D2FzA9yqE21vTw/N8phH2dbn01Pl8OGdmlJeFaiIF3IHcUNHybnX?=
 =?iso-8859-1?Q?IBEmyYhCag/61bq8Z+OCJ2KjkgN+J7NZJ4ztFt0z/qjFA8yhmOnOrJ55JD?=
 =?iso-8859-1?Q?/4jh2S6CMtNVXhHYFxkVSXHuFnIL8ywhgtcwbPkd0tEuhH9JSKfVI3Q5nX?=
 =?iso-8859-1?Q?hSXxwY/K3XDtsnh8cBBbF5RcOzwWguhyl5vtSBWrOR0R8GLKB6J0KpQSAn?=
 =?iso-8859-1?Q?D+EvL9HcGOE7uDzylvZEhjlrnZtYenCE2yx7CyBr0edk/oCXX88vd1TLsq?=
 =?iso-8859-1?Q?Veouwavys0vsbwmQnKYQcweWZnnCck++XN2QFCYbN4yUr1PbHoeKgrulup?=
 =?iso-8859-1?Q?hpHQP1VWf7pRPA+BYE0ZdMOC2AbixSlm12CMLj1EVSMKBPltCeSvLtK2Lm?=
 =?iso-8859-1?Q?Z3UEhf2OIVcPw1jFs7WJcyZXoZbGRfag8OOqgHhHvbDmMQw8LgluFEtdvO?=
 =?iso-8859-1?Q?+k6npdKR8q3hoQFRwXQSFONMell3ScDVZcMlm2FNjvBFDLLf/fA7mxhY+V?=
 =?iso-8859-1?Q?Gny58DcE4jWRMm9YR4MfIr4udRsz383CcGn/ZXo5Zov+yP/wl2kz0qKM/Y?=
 =?iso-8859-1?Q?LTjtV2qqZ6x8mImdmGNXj6hH7RPwW+lw6s0qWgWecdocFabJZ/ey9eog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f82f20-1d25-41bb-4f5f-08dc2df01d52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 06:34:08.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvd6Zjzwt3pyHHYX0CkSzyw0vsuny1cAHBp97xNzxOtjv8nHOisi2bBBHOHFZ2RLON/qDbBG2t7QRaRxXYb35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Wed, Feb 14, 2024 at 04:15:58PM +0200, Mika Kuoppala wrote:
> Mika Kuoppala <mika.kuoppala@linux.intel.com> writes:
> 
> > If user fence was provided for MAP in vm_bind_ioctl
> > and it has still not been signalled, deny UNMAP of said
> > vma with EBUSY as long as unsignalled fence exists.
> >
> > This guarantees that MAP vs UNMAP sequences won't
> > escape under the radar if we ever want to track the
> > client's state wrt to completed and accessible MAPs.
> > By means of intercepting the ufence release signalling.
> >
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1159
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 836a6e849cda8..c26297568e697 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -897,6 +897,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> >  	struct xe_device *xe = vm->xe;
> >  	bool read_only = xe_vma_read_only(vma);
> >  
> > +	if (vma->ufence) {
> > +		xe_sync_ufence_put(vma->ufence);
> > +		vma->ufence = NULL;
> > +	}
> > +
> >  	if (xe_vma_is_userptr(vma)) {
> >  		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
> >  
> > @@ -1608,6 +1613,16 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> >  
> >  	trace_xe_vma_unbind(vma);
> >  
> > +	if (vma->ufence) {
> > +		struct xe_user_fence * const f = vma->ufence;
> > +
> > +		if (!xe_sync_ufence_get_status(f))
> > +			return ERR_PTR(-EBUSY);
> > +
> > +		vma->ufence = NULL;
> > +		xe_sync_ufence_put(f);
> > +	}
> > +
> >  	if (number_tiles > 1) {
> >  		fences = kmalloc_array(number_tiles, sizeof(*fences),
> >  				       GFP_KERNEL);
> > @@ -1751,6 +1766,13 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> >  
> >  	xe_vm_assert_held(vm);
> >  
> > +	if (num_syncs == 1 && xe_sync_is_ufence(&syncs[0])) {

Maybe a helper here? Also I think it is possible for num_syncs > 1 and
have a ufence too.

> > +		if (XE_WARN_ON(vma->ufence))
> 
> This will get triggered with xe_exec_threads: threads-cm-userptr.
> 
> Should we just silently swap into a newer provided ufence
> and only complain if the existing fence in here is still non signalled?
> 

CI caught a failure too [1].

I think the failure in threads-cm-userptr must be a userptr invalidation
triggering a rebind? In this case the ufence will not be signaled but
vma->ufence == xe_sync_is_ufence(&syncs[0]).

For [1], I think it is possible that ufence could not be signaled too.

With that I believe is ok just to swap without an error.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129900v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html

> -Mika
> 
> > +			xe_sync_ufence_put(vma->ufence);
> > +
> > +		vma->ufence = xe_sync_ufence_get(&syncs[0]);
> > +	}
> > +
> >  	if (immediate) {
> >  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
> >  				       last_op);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 5ac9c5bebabc3..4a06420b941ea 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -19,6 +19,7 @@
> >  
> >  struct xe_bo;
> >  struct xe_sync_entry;
> > +struct xe_user_fence;
> >  struct xe_vm;
> >  
> >  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> > @@ -102,6 +103,12 @@ struct xe_vma {
> >  	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
> >  	 */
> >  	u16 pat_index;
> > +
> > +	/**
> > +	 * @ufence: The user fence that was provided with MAP.
> > +	 * Needs to be signalled before UNMAP can be processed.
> > +	 */
> > +	struct xe_user_fence *ufence;
> >  };
> >  
> >  /**
> > -- 
> > 2.34.1
