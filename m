Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9844C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 15:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902BC10E2B1;
	Mon, 12 Jun 2023 15:48:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3D10E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686584917; x=1718120917;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=shI2IDVQ0ASA4hyY6TeywiEhQcljUNn9fExOz9xC/GU=;
 b=hiSXkGyavfLS1a/Djg/baAafNEWJu963BzFhY1zcFcusYDbAbxh4rAjv
 Tq75HkZuR5uhG/JDrBIslTXzjqi1NpHVI1v9BVMEVquK5J0TPFav+RZIN
 07vGNp8GQalsPizPIJoPBtzz+UH7smx/MxUEEicT09vx56IGuzKv2zf9B
 AWNvzdLAXVHp5L7i+H2hsKnd/hYLcQ6NtzD4+R2SWhIM47396ilgAQ8hA
 Cnb+JgZ7DByPbF4V+QXZLybrRMrevPBbYkbqX7ccS4pdU73Ax6T3DXjeW
 LnMixFnhk2CKrsn7wIOpuUIWjxKhKECeKEuXzqS9P+koWkGHpsxffBEFA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="356969254"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="356969254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="714437535"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="714437535"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2023 08:48:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:48:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 08:48:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 08:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwTuGhN8mUZezrU9717+rmKh5APNwxsrzqbw5NjljjLkKP3mOzT7oetiHBqfimuyiTJWkL0d/sKkSlmXazODN7mGbGItTXZp2nR9TfF6/lHiBbGUPBoNRgOPHauN14Fcgl0mv8mOrDgJwqocrRVCk122NUThGmGdqQeea5OF3WuESwV//SoKNrqEtHOtxK/4HA9ukB84+cubCXLXJkPyfAtMl8pR+uGLV2Stpld1ysueWHsO9f0+38rIHrgR3XxYX9tuP3V6IpFzR/QdsetcxNGfOmNZ8lWAuPNZrRuVPTNYy9td3/1+Jmy6K5zqtP/7BeGc1paSDrBAzOr438Nu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEVdNRwK+77+eSPAp63I/wIipaTmPvMpe72oSEhIKT4=;
 b=Z1ZKOxW8FbqTT6DRaMVoaFf3AIGgfdMCf7UUy21KxcRFA0f05BOojeItf1EMVPP2+29HgErDw6YDmxxnNdLIOjIL0sN4KSY/Q4YaEu/KbBi7lwU62tp6N1YNg4YkEZxTNob6i+HjGK0XJlRHsqDMgMksqcY3pOmF4jvI/g+SLQsCa/u1YvgplHuUO7OxfLMzQ9u3xhs6DSAo2ETHhU8QhYUm+od7GbaK75lW+H4ITI+8YdS0N6UWzIOuZ/vJzFPDkJQrC86jwCmOUvHhSGRBsdBgaFnfJ/zLTAOxn1MUIc93ipb0JRN9ETGE+wIhgjhs4H2C6VOei4wVuRHq8ixtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Mon, 12 Jun
 2023 15:48:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 15:48:31 +0000
Date: Mon, 12 Jun 2023 15:47:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIc+I6LnF8o+yzYg@DUT025-TGLU.fm.intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
 <03ad932e9cabfea3b29a4029d9693c8296b14c29.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03ad932e9cabfea3b29a4029d9693c8296b14c29.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: feed425f-53fc-40c8-7764-08db6b5c78d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRletdmfhIPfMeuAijAzM/vQdoLTBKBBFcczY7E+TRfDWu0XTReNxzIBBsFQgUXU2FSitOs6e+hE2cTdlvTOr/j6d1PgYMBL9s63daByZSBGGw6L/rLIhDVaa2x7O9w/NMsAj65aSEyd7tFwX1h7j9ZJBpT29ZMV6XVrCrmgMBl51yklgr5+wYjdwHiywvzfqRvVLlqfOaEOf2XiKrcJXEzuATcGwU7ZBB7ClKShjlBoPkub/L2ypnZ5QZG9TiOAz8kZWBj5OPjxL+QqOEZCfqhmPj9icAld7GCPluBeWRxWlRpS4nvPoubXbxuPrBJeqxwy4TkIeTCqaPqb5xcvuE5Z07YyvSMBzYoKAWAAN45+RmwfNEisYUq/ItCADf9+f7r6NfUIkdESxljZ60jT8HqVoaoYGOykmaggKR7QQnDj2PKpau+eBLIs5q7BTG/rQB/olFNkBc1f9d2nef5QVYHR5RN76B+b256xb3ai3Aj/4eoBSCfBGiHNJLMYJRw+VdWYH1uKfq2ornLUX2WBAFgtWtQRNVnDn76vpq4gHLQlo3BbCzHxgayGbqTkATy8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199021)(6506007)(26005)(8936002)(44832011)(5660300002)(6512007)(38100700002)(8676002)(186003)(6916009)(4326008)(316002)(6666004)(66946007)(66476007)(66899021)(2906002)(82960400001)(66556008)(6486002)(478600001)(86362001)(83380400001)(41300700001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1mpoM8YkTaeZb2ZI6iW2KhYIsK/xZZRLlfjBOc7+V1v7cpKmM+rFx25UGY?=
 =?iso-8859-1?Q?n4wicwMfiIy+78Ni4lZ/JYiyEAcOuaCtpiNKappWjBA4ComavuYbdIVOuF?=
 =?iso-8859-1?Q?htsMbiN3a56JgSvnu8BqxrBdAsqNhUHfW5uWC/lXQAQQdSyy5lVeGzKiF6?=
 =?iso-8859-1?Q?dRKxeRk3hsA/FpdCZ3iwPDRU9GKtWmiPaa38VGbtt423OVwNZ2SwD39MfO?=
 =?iso-8859-1?Q?DFUBpuY0V1k7SIShO6KXoLBzZJ8/lReLqFErZ60dJ2EYvB932ININkDLqE?=
 =?iso-8859-1?Q?j2p9O70HXsmiLUjqLVoVzCH8xmol4ZXQz86FnGyZgbQUibevHmXiU5cIf0?=
 =?iso-8859-1?Q?/qcd9kykEWKrT8J+ujZDj19foWt3t5pdL4M078m++pb9cayPaLJpsTmg4Q?=
 =?iso-8859-1?Q?NNork08hqxcGUbRmd21MAv1LIFBDgf69tNSDZPbOcqK8otpAbzENurs7mC?=
 =?iso-8859-1?Q?ArYdS/KGxr6pK1NJrAFH/PFnUCwPeUXDrtmvwZiqFLpLjKuoE01N1aSnjX?=
 =?iso-8859-1?Q?4VvTtF6lHpvsAog/bWgM2guT8zo88hUUC8iiKTe1y3VEQtfE5K01m+3hwE?=
 =?iso-8859-1?Q?mgNSCLOszA43JXr2DU56l+YIfoM4v2/qh1VCwIyF9C4O0/lrS4fdFfXtW9?=
 =?iso-8859-1?Q?idkTiX+a7fKENnbFx8O2Qnet3XwtDCj0SUbqm4r7XlYDWDN7EqweOGEd7E?=
 =?iso-8859-1?Q?Jhixc43lBobQRD3pNKuncNY745twHnb4yDJF33RqamBqzaT59I437Pz7Wg?=
 =?iso-8859-1?Q?56hvEIwwRaGBBkETwFir4eFUEKgow4wo+ZVZ+dL1eS8l7603Ze6s13RaVO?=
 =?iso-8859-1?Q?K3cD/lO0QP5Hu1HM0/NzwGCB4kb7CB/k4s4CqehuKX7dAClSBzuBoZBF7c?=
 =?iso-8859-1?Q?keGG9UI3fOq0TzCsFK11UDrNub2CcuSjTBCn7a/7mg85kU38dJ1b++hxYM?=
 =?iso-8859-1?Q?My8ZpLCHK2+j95AoBAwXGE2umUQOzXQbB9+ZU6/a4HA71qW42jNQoxBagp?=
 =?iso-8859-1?Q?QrcXnEb2FG9Nog4YbZRmplbJaGrpc14FREcGujLJxgIxLUv/Re6SW8OTGf?=
 =?iso-8859-1?Q?0U1ddONjUy2YTea9jSPk9UN46FkUFrJuBqfRMdYkp+V/chYYSErz8rj9vM?=
 =?iso-8859-1?Q?6i3NgBKRcSxb62Bqvn5aLiSHU3I7BgpXH/gEIWGpP590zMY4V3athtW0Up?=
 =?iso-8859-1?Q?ypw2+ceBG7/rMcqycfNS2deGmQCOTRkKATWL5RpLlO1cDenAURTCV718xf?=
 =?iso-8859-1?Q?+wD1GFP7jZEKLjxjgjbSgvZ4K7/ZlM19uNNe7TlgG50Un/C1H1yGP+pzeq?=
 =?iso-8859-1?Q?kElQh+B5gWqUpZb3RKUiAquuBtEb49l9cJAYUFwpnAOAT2BvUm1KM/MObx?=
 =?iso-8859-1?Q?fuBL88XteTKQMGvGEPX5saqcwx2vvrrQuPfSmYuK4e5I1lilYJTG37lrjj?=
 =?iso-8859-1?Q?kGPRH7b0Jwfu4zrP/+SoWU+yrka8h9agRYvOentkvJslTgsnKNCWOjZ+lw?=
 =?iso-8859-1?Q?sXlwubC2ZeXosUzM+zWj3HgnCkR/tGN1ikG3H2vSQtJtacQKLKcG/I0Wr1?=
 =?iso-8859-1?Q?JC7Z/E2rqlx/GIV06MbAjyzUoJCLLw4aksekDzzcyLeoZULMtFQ+ClMqln?=
 =?iso-8859-1?Q?IDczsvnlRnn+l1bXQMqyKo7rDjIBCSxTItftekR1sp+NefF1AYkWHcUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feed425f-53fc-40c8-7764-08db6b5c78d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:48:31.4100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pxv6yuGqcw6GKO4euDZxce4wLb8OYmtNeBtGg/JgODRlvIiNW24tO941HE2s2ZCwhhU+PzkVvZA4NzkA9+cBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits
 an error
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

On Fri, Jun 09, 2023 at 11:10:15PM +0200, Thomas Hellström wrote:
> On Fri, 2023-06-09 at 11:26 -0700, Matthew Brost wrote:
> > We cannot recover a VM if a rebind worker hits an error, ban the VM
> > if
> > happens to ensure we do not attempt to place this VM on the hardware
> > again.
> > 
> > A follow up will inform the user if this happens.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c     |  5 +++++
> >  drivers/gpu/drm/xe/xe_exec.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_trace.h      |  5 +++++
> >  drivers/gpu/drm/xe/xe_vm.c         | 27 +++++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_vm.h         | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h   |  5 +++--
> >  7 files changed, 48 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c
> > index b3036c4a8ec3..b1f808c08dc5 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -597,6 +597,11 @@ int xe_engine_create_ioctl(struct drm_device
> > *dev, void *data,
> >                 if (XE_IOCTL_ERR(xe, !vm))
> >                         return -ENOENT;
> >  
> > +               if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm)))
> > {
> > +                       xe_vm_put(vm);
> > +                       return -ENOENT;
> > +               }
> 
> Hm. What if the VM gets banned exactly here? Shouldn't the banned and
> closed status be read inside a vm lock? (which must then protect the
> entire vm->flags member)
> 

It doesn't really matter, worst case we create an engine, we won't be
able to submit to it as the exec has the same check. I can move if you
think it is a big deal IMO it is not.

Matt 

> /Thomas
> 
> 
> > +
> >                 e = xe_engine_create(xe, vm, logical_mask,
> >                                      args->width, hwe,
> > ENGINE_FLAG_PERSISTENT);
> >                 xe_vm_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index e44076ee2e11..27c11812d733 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         if (err)
> >                 goto err_unlock_list;
> >  
> > -       if (xe_vm_is_closed(engine->vm)) {
> > +       if (xe_vm_is_closed_or_banned(engine->vm)) {
> >                 drm_warn(&xe->drm, "Trying to schedule after vm is
> > closed\n");
> >                 err = -EIO;
> >                 goto err_engine_end;
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..eb89ac934394 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -472,6 +472,11 @@ DECLARE_EVENT_CLASS(xe_vm,
> >                               __entry->asid)
> >  );
> >  
> > +DEFINE_EVENT(xe_vm, xe_vm_kill,
> > +            TP_PROTO(struct xe_vm *vm),
> > +            TP_ARGS(vm)
> > +);
> > +
> >  DEFINE_EVENT(xe_vm, xe_vm_create,
> >              TP_PROTO(struct xe_vm *vm),
> >              TP_ARGS(vm)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e4311c48cc54..1966a583b761 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> >  
> >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> >  
> > +static void xe_vm_kill(struct xe_vm *vm)
> > +{
> > +       struct ww_acquire_ctx ww;
> > +       struct xe_engine *e;
> > +
> > +       lockdep_assert_held(&vm->lock);
> > +
> > +       xe_vm_lock(vm, &ww, 0, false);
> > +       vm->flags |= XE_VM_FLAG_BANNED;
> > +       trace_xe_vm_kill(vm);
> > +
> > +       list_for_each_entry(e, &vm->preempt.engines, compute.link)
> > +               e->ops->kill(e);
> > +       xe_vm_unlock(vm, &ww);
> > +
> > +       /* TODO: Inform user the VM is banned */
> > +}
> > +
> >  static void preempt_rebind_work_func(struct work_struct *w)
> >  {
> >         struct xe_vm *vm = container_of(w, struct xe_vm,
> > preempt.rebind_work);
> > @@ -533,7 +551,7 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> >         XE_BUG_ON(!xe_vm_in_compute_mode(vm));
> >         trace_xe_vm_rebind_worker_enter(vm);
> >  
> > -       if (xe_vm_is_closed(vm)) {
> > +       if (xe_vm_is_closed_or_banned(vm)) {
> >                 trace_xe_vm_rebind_worker_exit(vm);
> >                 return;
> >         }
> > @@ -662,11 +680,12 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> >                         goto retry;
> >                 }
> >         }
> > +       if (err)
> > +               xe_vm_kill(vm);
> >         up_write(&vm->lock);
> >  
> >         free_preempt_fences(&preempt_fences);
> >  
> > -       XE_WARN_ON(err < 0);    /* TODO: Kill VM or put in error
> > state */
> >         trace_xe_vm_rebind_worker_exit(vm);
> >  }
> >  
> > @@ -1127,7 +1146,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm,
> > const struct xe_vma *vma)
> >  {
> >         struct rb_node *node;
> >  
> > -       if (xe_vm_is_closed(vm))
> > +       if (xe_vm_is_closed_or_banned(vm))
> >                 return NULL;
> >  
> >         XE_BUG_ON(vma->end >= vm->size);
> > @@ -3048,7 +3067,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 goto free_objs;
> >         }
> >  
> > -       if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > +       if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> >                 drm_err(dev, "VM closed while we began looking
> > up?\n");
> >                 err = -ENOENT;
> >                 goto put_vm;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 372f26153209..858207a20017 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -49,6 +49,16 @@ static inline bool xe_vm_is_closed(struct xe_vm
> > *vm)
> >         return !vm->size;
> >  }
> >  
> > +static inline bool xe_vm_is_banned(struct xe_vm *vm)
> > +{
> > +       return vm->flags & XE_VM_FLAG_BANNED;
> > +}
> > +
> > +static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> > +{
> > +       return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> > +}
> > +
> >  struct xe_vma *
> >  xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma
> > *vma);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 0f5eef337037..76458f8d57f3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> > void *data,
> >         if (XE_IOCTL_ERR(xe, !vm))
> >                 return -EINVAL;
> >  
> > -       if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > +       if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> >                 err = -ENOENT;
> >                 goto put_vm;
> >         }
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 76af6ac0fa84..566b67abe1c3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -178,8 +178,9 @@ struct xe_vm {
> >  #define XE_VM_FLAG_MIGRATION           BIT(3)
> >  #define XE_VM_FLAG_SCRATCH_PAGE                BIT(4)
> >  #define XE_VM_FLAG_FAULT_MODE          BIT(5)
> > -#define XE_VM_FLAG_GT_ID(flags)                (((flags) >> 6) &
> > 0x3)
> > -#define XE_VM_FLAG_SET_TILE_ID(tile)   ((tile)->id << 6)
> > +#define XE_VM_FLAG_BANNED              BIT(6)
> > +#define XE_VM_FLAG_GT_ID(flags)                (((flags) >> 7) &
> > 0x3)
> > +#define XE_VM_FLAG_SET_TILE_ID(tile)   ((tile)->id << 7)
> >         unsigned long flags;
> >  
> >         /** @composite_fence_ctx: context composite fence */
> 
