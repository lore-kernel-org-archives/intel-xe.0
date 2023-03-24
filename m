Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6E4C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EB510E008;
	Fri, 24 Mar 2023 16:15:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CCE10E008
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679674535; x=1711210535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4f7MbkhPGxtu3++J7jjcsos7T+N/46owiXIN+4vi5tM=;
 b=Fn4raXjHRYm9cJRshM9+G8qeeSE2swfP+nc0BU2u/AILhBMFbihpddYF
 SanavLz82wb2H9FmkMKG8hqbmYUtsaep8/PiYSNnksQYH99HzXS0p7UPN
 ZOV99MTqFiUEd6w06/CjS2BaEI8xS5ltnpHlqLgPdjbADqJWHr4VkMmV8
 9et99AnDtpP51Lazl9zC7No9m/iuDE0Uit8DqOPpoZK0T0QRCSkuLqzos
 luksZcFrgFEepUVLatxz8GxS+aDOGDqnnB/0i9ZERn9lnvkvhzlGy+o01
 +P0BKYuDqOHKKSAunYbSr9fhbKdSH+UpVmzYRPGd1UbGfo7qme98DXWxT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328239763"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328239763"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713123942"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="713123942"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 09:15:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:15:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:15:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 09:15:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 09:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b74aXu07HMm6oUQTNYESk3hfFqJAcmxQSJ9ZcuCacYRD/4XyLSkjlnuFtrwg/GyuFEdqT/r19C5dANCemyNADn+Kmjnp2wILl7vwp/WvmIvdA9IekDWCi8yQFKutmWf6+15nTQkaVJi5c57mcj7OxDMjwxIaMSC+vkVH36Xe3D64vf7Ki0WqO2YRrbElJFWty6ZRTRVu+E2YrcOBUKzElNytavh4rdy2lNZxPVeL39/CLPKoITkFfpCgoQ4owGYCS5s39ot59f1lVWtVLt5a23+fwuOGBsuPkQmSCNaw+guX1qd7CHmnhPcEwilWeDtDK8s52t+yqT78ZFP5DBQp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Omov6xyD0xXoOwIO/YO5Xi4OLwCmMAEApDRriCjrR0=;
 b=ezsqxTpWPMaY97pDviR14gap38RcjSSU53EnzdMe3zkbQvUddIZRTXrpSeFbMvabE/3j8FXfM+s8LhfWFZ6O4tIyVre0wZITOTOfmlxdshWMzv/kkrpiQkut5ynjiFCRh7bpC+jFT3s1q0goHXrsuMgDuoYkTr7dcm791xLiCkiGW77zj5lLBksL33IAm0x2icQcDZlVGtxaNnr6q7ILMSsx/LBdOZbXDECmlJfMd7oXUuWqn+R4ClEgYrg0LvOuuqNc6sGrZIWj2ubIpT4GhHHawlHSwdf9IFX8B3aamuVu8z6Xl+WlzGFNfawxiOrLkcS2DUZEcZ00PSlblYI9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 16:15:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 16:15:32 +0000
Date: Fri, 24 Mar 2023 12:15:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZB3Mn1atvjMFK29G@intel.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd1d6f4-5889-4e20-6d27-08db2c82fdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKhURJcGECTnh/3HldzYuXV49CDOdhHJdK7atNcvCKA0wNy3A+tapbBItsfoiUY4xb8uPGIlvLtdodP8LdnkiJ9V0OYptdBF1g2JbFbqarRtoD9Eg8VJzXuNVXfp+q7/1ffCs4ZUNn3WMKEmcS/JWJIU/ja/eCugRX8rbTxwpwZb96vh7AR5k+V4KXp57NJnFqf5G17R5Ss681qriM54xM75+D5pMA21wmthYAIRppNqnn+vAhO0YZdEBFhAeNq6lDv9NEecrmJzu/Zs2AAaXlcuQWI7cWgYGmuzI7EHPfLYENON4+jVXbvidc4hfZCie0iUqGzKUkmfOTw2Vk7WxOS3YWVKSHrAUDBKLIN4caycSrLa0HZ3WZW8ScyD+01RUeG5o+YL8815ruy4u+qomWZpmN8FZVPTxzpHTGxJeXVFNigYddUO+dwSmBd89On/uV9GcfgLMRdeCnAmifeLmVEpMSdd5Wd5C8nl5+T6eBb9xfA9aW9KkscFAuQYGwzyIdX2L1TlqyA3+H6Cv6Hdt7jtPQPn+QBUBSt0wN/t+qJeXOi5TJEMPH6Be/nYZ5KIpY+N7fknn6VqjNDT2yxBGRehtQp+upwRP1sRErRbfKp/0eiJLpQVG9dh8Q7eDBudwRlwzqghT2ll8vjjGB4Xdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199018)(36756003)(82960400001)(8676002)(86362001)(38100700002)(66556008)(2906002)(44832011)(4326008)(41300700001)(5660300002)(66476007)(6862004)(8936002)(83380400001)(6506007)(186003)(2616005)(53546011)(6636002)(54906003)(6512007)(66946007)(316002)(478600001)(37006003)(26005)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ozzm0UXbu3cTTiK1INPhk2mwVnoILiyGWFWJqPA1FjJZzfUl2QzFIPfyOxuM?=
 =?us-ascii?Q?EtNDXfZ/BzQGAkzRXGaDpE7D5tJSR1g4nsne2qukTorWRlMdM5048JQqct0z?=
 =?us-ascii?Q?kdw57877KdSp5Ue0iROZpEW7Cn0gtO+AkoO6s8mP4abNUDaC1BAWVmez+Rja?=
 =?us-ascii?Q?TsLPgMGQCh5QQLJQj2INcQW+WeHCO2PCJhe7qW8NfkewRKxFevpEs4hcdysd?=
 =?us-ascii?Q?r1LqE1fbFq4rhP0Y6qgXkyskMZpp8ejGNDSF/Shx00rr0pSX8pevhTjiII0o?=
 =?us-ascii?Q?iC5vW9JDlyECoToy7rQ3gBNYQGgGLjzSONc5YffdyXTeXZr6WM/uwtz0ckPL?=
 =?us-ascii?Q?Eiu7Sd5mnrAdzT600aI2e2gcP+YLP1OUgtFE0iccK99Ztj++4/cSdB4t7myg?=
 =?us-ascii?Q?UXGLmHmf+34399onY+tzAc5rzsr1pEoJcIOvHEJKJk2hDlqgSK0lU5FUZMr5?=
 =?us-ascii?Q?1Jm60iK3SnsbjkoCJe7KZ6sQbLE8+K/hU9sW6Ml/0QtmCXPQfmXyKPvyNCMd?=
 =?us-ascii?Q?7hgXLmy+nlRJmITHEWraQ3y+cpQib4XDzUBTuTZfh00NG2aVYTafxJFR7J27?=
 =?us-ascii?Q?9ahqbVrmrB/TvE76o/i/bkwLnIaeG7v6yWd2rbm8lolFSekQdX8GSYOqB+fZ?=
 =?us-ascii?Q?2DLD/QXQHBr1UNhbFF7jmjDUvmiBUlUOnG4jU1dbCat0Vb+4CR6+HQYTvRRJ?=
 =?us-ascii?Q?E/4uDRWnxramqJE5Vr1dG+34zGLi3jADofxzWVKrW5fjU1QHNDJtsDUmdFqC?=
 =?us-ascii?Q?5ch++w65+IT4BpDEHvZUdrNmai0bcndcmjC91xQo0DYeAUDIb9XG7EiA5gNF?=
 =?us-ascii?Q?G5eMtLPdxtqBVjfxHHWIc8z2dCoEAlioiSCJn+E/Zb7f4OW2xhG3i1o2uZ3d?=
 =?us-ascii?Q?VkYTVZKCB6L+H2j5978AzcfYkN1dDAf2sVyiwRVjhyUrx3XrZehwL5BdHpZq?=
 =?us-ascii?Q?QxU2jUj98qmsHl7/A/McUbvizxJMzCzEq4tAsyNs1+hOwEInrVeYB4NGu503?=
 =?us-ascii?Q?WHA2PN2Ll812A8YjXLHzC+tE7iq07kaQ6LSeclnJwcLPt/1uGLltIZmwYs7f?=
 =?us-ascii?Q?Z6dhRqWdRU4QKGbYWGWpEh4FOFfnj3p8A8GT2nmSaysN/aSkkiPFR5YzBEoO?=
 =?us-ascii?Q?aRFnh80p4/KLiJMtT9Kvb0VvkU7Gxg1W1G8gJWge/AZYplCpJQq8xkHHZMBE?=
 =?us-ascii?Q?atfhnrxsSbNvSHvh8yTFqMhnSkT/q+Z9pMIpd35HnPWeoP3e6emKm/Vz8sAk?=
 =?us-ascii?Q?psE0gE7imTi4yqU/2xnbsX1ncNzuPyJd2jwjPXiWQJglRTRHBBR8mMt3gOCS?=
 =?us-ascii?Q?EOUwn3RiztcAZ8A48GyorNtxpUydZorrFv5BCucvEsDPILf91q+pJKy6bWlx?=
 =?us-ascii?Q?Zugvy6KxIYf6yjMx/9YEo2hqx5TM83KmMhNZP/7e78pPC+ktJxz48YdJo8B5?=
 =?us-ascii?Q?5U7anxAwlCoV6R7cJ86vldlw6RhntjO4Y5HKXZyonUNB582vjd1sfyqPm4K+?=
 =?us-ascii?Q?j5rK8HkxlAGToz2Ty3FTtLRReCiAUqKqEV/hAEZDG52Ar5vX3ptA0QdImtYD?=
 =?us-ascii?Q?WMqpEBhyVEUHqtLF4PxBDS+ilVHx2uLAZAjWK7YcszcxyFsbBuubPXk9W79M?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd1d6f4-5889-4e20-6d27-08db2c82fdd1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:15:32.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vgmk1j4kZZlgynlf+Xykoj8eSxUVWapjqcC+85jMCo3lUApGeCSj0rLhRENqYK66LCSrjErPYPzP9Rzke2Jgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 11:08:58PM +0000, Chang, Yu bruce wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 23, 2023 3:53 PM
> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
> > if guc failed to init
> > 
> > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > > In general, this is due to FW load failure, should just report error
> > > and fail the probe so that user can easily retry again.
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > 
> > I have not tested this but assuming you did:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> Yes, I tested on PVC and it used to fall back to execlist mode and constantly 
> print out EXECLIST_STATUS. Now all those are not showing after this change.

But now the entire execlist code is bogus.
We should remove it entirely or at least add a parameter that allows
that to be selected.

> 
> There is still other unrelated issues during __pfx_ggtt_fini_noalloc, and need
> to be fixed as below.
> 
> [  223.839894] BUG: KASAN: null-ptr-deref in ttm_resource_free+0xe4/0x140 [ttm]
> [  223.847211] Read of size 8 at addr 0000000000000018 by task systemd-udevd/566
> 
> [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted 6.2.0-xe+ #4
> [  223.864921] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140 03/03/2021
> [  223.877365] Call Trace:
> [  223.881707]  <TASK>
> [  223.885658]  dump_stack_lvl+0x5b/0x85
> [  223.891200]  print_report+0x499/0x4aa
> [  223.896690]  ? ttm_resource_free+0xe4/0x140 [ttm]
> [  223.903268]  kasan_report+0x99/0x1a0
> [  223.908683]  ? ttm_resource_free+0xe4/0x140 [ttm]
> [  223.915210]  ttm_resource_free+0xe4/0x140 [ttm]
> [  223.921621]  ttm_bo_release+0x3e5/0x550 [ttm]
> [  223.927811]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
> [  223.934530]  ? ttm_bo_kunmap+0x11f/0x160 [ttm]
> [  223.940775]  ? __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
> 
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > >  drivers/gpu/drm/xe/xe_uc.c | 3 ---
> > >  2 files changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index daa433d0f2f5..8a436c95591e 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > >  			goto err_force_wake;
> > >  	}
> > >
> > > -	/* Allow driver to load if uC init fails (likely missing firmware) */
> > >  	err = xe_uc_init(&gt->uc);
> > > -	XE_WARN_ON(err);
> > > +	if (err)
> > > +		goto err_force_wake;
> > >
> > >  	err = xe_uc_init_hwconfig(&gt->uc);
> > >  	if (err)
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 4ccf2b3435e1..70eabf567156 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > >  	return 0;
> > >
> > >  err:
> > > -	/* If any uC firmwares not found, fall back to execlists */
> > > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > > -
> > >  	return ret;
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
