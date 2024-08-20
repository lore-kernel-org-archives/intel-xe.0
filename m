Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F90C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AA610E472;
	Tue, 20 Aug 2024 21:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrW/WTX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE510E472
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724187841; x=1755723841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kNhJTdImjQKUwNZKcwU3kVzZWmN9J/uxtAbjRS8DEX4=;
 b=nrW/WTX3hiQQjxywZlfXuG+pUw1LIFkBfNOtK5HePU4nvA+YXwPSNmNJ
 at0t0z4AObii2L+VusT83NQMg3Gzn9sIaezQ3Az0sjrRuM8d2Cl2EPMyX
 g1Kp/qDH2M7Xemb3MmnXImqCCUePO+JcRN6NzjWiWJGAMlHYrDDChWddY
 3HqB/3Si+s+6EAn2U/0T0qw0zA+Imz7Kz6R8O88ZmGD8MwXqPgbO6Fy1U
 qaj07WhxYTj5D8WYfEjUA9Ptf/V3HeUqYSeeZZeMZXn+ZvrMSlvhEn4Ul
 zQ+ocbtEd5KPWibVlSRzwcVbF4iEwfAo9qgD4SKKnJSr+/ZWhVir3jcEl g==;
X-CSE-ConnectionGUID: a5gy54JPQni4GdLhBP8bdA==
X-CSE-MsgGUID: aAnlsouqQbSZoseYOZI5jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22682287"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22682287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:04:01 -0700
X-CSE-ConnectionGUID: oo6sdLWuScm1VfdJ8gl+dQ==
X-CSE-MsgGUID: jnCbY55YTg27Y9uDVgGo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60902408"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:04:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:04:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:04:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnS1ZWocdDI55gViemBNkULuoeYkxDYCZvPDyCxUgdC/9BoxOT5vCogr7aZ/t13cZ2qrtfFHa/jO9H1uUFc19kgbsnUycS7nLJH/NIcxMreHA+p6P+pQoerfBMx3bVZx8/0J2e7XjUBxzE67fBEUyfRKh7gtscfTrIcgmzH7yyjHchuna3cKUw5bDcocVakS8wTFNAOVvMBGtuGHntQxow1rDiG5FGfrysw0hUOhi7UP4OFvF5mR23Dzi1AOq5xRqeGzTURXtQ3+b/XlF1QKWrL5QflSIWsOWT0gnoaWPK8mHHFL0iWzoAw3jTZHbsl2LHw4PuvNoVqr2dVg0wKPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VYAA2syp7gT7JQNYWw33upPoCkUl1KFwpNgL4m1dbo=;
 b=KL6eX7xq8jUfpdIWAX5glOlqg1J79i8/AkYmR5x1wCptNql3fqy+zPbWMvTfCkSe0yiFuXxze6a7Qh6KFgfeNCMkQmsuIR6H47VbKXCE5rRfBOXf4PK23urAqbznWVI7j/XFaW2S/uxsIOuO4D9Po2xaM8t8M6nv2pHSrHehGC2+Ql+kxFCtrhF5yJAh4Lx3qWoMPaFLUNpRilp0sw07aZa/+sk9zM4AQTJrkFD3z8/Buc73wKXIyQSh5fxRhShQea24htdKsdAEIP3jDWdpkDS14De+qdtdbz4Xoqf3BZh8sO3VGpmXq7az6DhJfl5/3r4aAuGQkDPhuDS7sUNX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 21:03:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 21:03:56 +0000
Date: Tue, 20 Aug 2024 21:02:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/6] drm/xe: Move HuC init before GuC init
Message-ID: <ZsUEbUXXf8STbNK0@DUT025-TGLU.fm.intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-6-matthew.brost@intel.com>
 <gbqo3m4judjcvi3zfq263xgwfzcvxvcibaws2b4h4ahxm6pchr@ur6r4uf2ndx6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gbqo3m4judjcvi3zfq263xgwfzcvxvcibaws2b4h4ahxm6pchr@ur6r4uf2ndx6>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 98df075e-09c2-4b66-5ba9-08dcc15b9af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7VDL58XSYvS/JIU/sc0E94w7/gI35eVMpX6KY3pzEei1Qd021eFl5AyKb3NF?=
 =?us-ascii?Q?JZM0eLN6szGGF0T2tiw8wMH3gITRkNrLbMwy61Vwjhkk/Cn+L9jBSP4f/4DM?=
 =?us-ascii?Q?I4DAtIXiQyny3XQ2E7+VNEVu7SjEimwrTsZY1DJmq8gXEBGg0v794WVgG92R?=
 =?us-ascii?Q?Z4LFRxBr/wNpGJscK0An9pnxZ5dzkaysLWtveA82tV6ymQoHFs4GFU6GyK2U?=
 =?us-ascii?Q?4wFsrivNJ8pPNUy+kcepqt4TqApKtIqwMKnPEHse5f3maxKdHbiaB3NJmTYO?=
 =?us-ascii?Q?L+80ToR58uBfT1foAYyx+rtzMYR+uiiWVaXyH0AEGPLAu/elGIu9CduCDItU?=
 =?us-ascii?Q?b79otfc1VwcmcXwJTceJUEcZvkT2HzL5louykAiRnLwVgNk9MzNeaMgDFHIS?=
 =?us-ascii?Q?VZ7gHCILCtQfrCqRCwp35MCZCcX76kMvkpslncDDfAIpu2hdFl8MKkyPetgJ?=
 =?us-ascii?Q?h/mauxKZVMYaM4XloD2erLJecbl6nb2iLnM2snBCMxU1qZMHe2++TKm2EJU6?=
 =?us-ascii?Q?lNp86RrkPB9T8VeooNVtO5/zhlzqCFydoQvybuOoHnL0sPyMQjGFtpSGwx5U?=
 =?us-ascii?Q?fQuYa8Oyiieve96/mpUDHOfq7m9mgrp+Rt+AeYr0eynXkcHEi3CXTu1jDRMu?=
 =?us-ascii?Q?7IGKMmNd6z6Ieu2FnFp8AoL6i8/jQoCOW//sbHkyWMlg2rx7le4vo/+AVgnf?=
 =?us-ascii?Q?ShHgKhbtlwOEGi+QrPLdrNGZB4h/lqDIcWJPHuorXV5azIJKTdSK6d6ESj+x?=
 =?us-ascii?Q?GVjg3qAk1nN7cCMVRd/i2Thg5FYNMgfe6+Ir6+/jypqnibh3p9WJvY/+QVxl?=
 =?us-ascii?Q?bIv4I05fUyN3MMu6I8pBXYjMs0v90Je7ZcAzal2sJMJtcc+my/kpUS9LsvaB?=
 =?us-ascii?Q?fQTzBPSA/Ust9WYbvkMDFfJPGfFRC1tgQIpxCB8n7U9MzVl1HYvW1Y6vi8WK?=
 =?us-ascii?Q?bWX4Ij7/5IGB9rZ7IoJVhVVo7PDgQ8KNF83qC9bYREli7WjLXW5gbeMSxCsf?=
 =?us-ascii?Q?+x/sTI9/P6/inZCgMt334rqNl7hn879BRpyOdJzGnPArkPEf3A6MxWxqGnLI?=
 =?us-ascii?Q?XchcajNnnwhX+in9BsjeAP1ZY/bBdguRTukgLB0IR5vxcsrfMqMq8cy8ONFZ?=
 =?us-ascii?Q?7fXNFvXA6nRsLvrkndYiQo0eoOjL2LHSEh4lGP1YZhX+UmIRFs0vWSF4P+8n?=
 =?us-ascii?Q?KYl1ppQFdmueusWnbYBFuhrAYGR9wvpZ3GyR5/H/+T5gLSBf7SfbWFxFRVL+?=
 =?us-ascii?Q?DBLNUOwqGSdTR6k0wFQH6ahelJ0q9oeEruTDj4tg+pGjoCD9sF5ljHCw8wJN?=
 =?us-ascii?Q?gLtgZKJIZ5M/zesWOmWkXDDXeMMHfsNOnqIOrGlGAWqybg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wwthdIWGmMbjGMUVD22LCcVUonr5T2hQdPIFnNJ3huqUTJ+HWWBSxHCpzSQt?=
 =?us-ascii?Q?wRA6+RwMy+y811q9YwvUK65S186+vzzFK7TMt1yWfC3BnCBJ9u6y/pdSIH8a?=
 =?us-ascii?Q?cIL8QtnHdpsN+udPTYKq8UfFVmvz9rtHEpd+htFp86gbSb8fOU8jrGUK/xCm?=
 =?us-ascii?Q?XcVrcHO8ykTS7xeeW1oM32N6E4bPyjKsZ1y1KlydDa7ORL6AJfVr65bUrfmt?=
 =?us-ascii?Q?B7NWLpsY5HRlGXcDEKY7i2h0UD/wUpjSddq9WLNgJoCh5I66DriY6Bk9e1ix?=
 =?us-ascii?Q?g38u1RL9ApqEo4XHBgRK0XgvqcJKt6JmuTpA3KuRTMvtG9Nl7qSSEnxB2Ru/?=
 =?us-ascii?Q?SoN3CRmM0DqyKWsyigTGQnajUIlgZHZitoVsc6jwRlJU/2wwoDLjMz12T9ua?=
 =?us-ascii?Q?KmJtAECJSw8ly9lYzsOXDPTv9RS5L1tRjJ3oBXmNoo+M1XtLeXb8vlNSgD8D?=
 =?us-ascii?Q?hmmkbVXe2wkwGclWireH3C6lsymaixge8MavziJgXxrLyhzH1Gk9u44uB57O?=
 =?us-ascii?Q?ONeX9C+MVZ32/6bAiwdUrbAfwWL6RwMcsfyDlgRzVUXBS0gSN4kbvdr8RDhO?=
 =?us-ascii?Q?jtKQC9JM+M7lSs5dIYW8sELpRnWrncfnWWV8HorAuk8G1+7vCW+YeK65m2Yr?=
 =?us-ascii?Q?0psXuDtDhpQFK/SLOkCMkuchmTubXf0tBabJ8fl0HLibtnhwtUmmOzuBn6V5?=
 =?us-ascii?Q?XhQjx8y3XK9znag4HuZsP4a30/KdYVrnW4UlXqetMk7qXREN8GwcmlM4y0sJ?=
 =?us-ascii?Q?h7L4sXyOmdV0lousJ591JWoBcdFGRrvlQZFcN0253StFUB95gttnbjSPMGu9?=
 =?us-ascii?Q?KN5K6JAHJ7srCCxjxyHK3cMuHBV4+qkygewsNXvtpyOntQcLExh4uqdo0zt0?=
 =?us-ascii?Q?OQj+NHLgAqT95P6hDZws/FwJlpJloNO80+S8yVzW54zC/tBowoDmeACY78+J?=
 =?us-ascii?Q?WZVYOCS/X47Ltr7D6EoZn/EqeWwP6aCrUvCyQmvw/F0OE1OC2EFXWYKh3mlh?=
 =?us-ascii?Q?Eyg3M+DgnZukbOpsiJtwYqhUukGeCVcsVAnXhpDk/rLQSxU4jg5Ujn1GFmix?=
 =?us-ascii?Q?qoAXeTEA/6hZTt4L4JHa99KyBndCqyxILgapVV91xL+EPrZofsLBg/Qv6E/6?=
 =?us-ascii?Q?S+b+wTXlUb5Dp0hOwB+IxaQpm3jD/KjvCO2uMTGVQri3jW/J9iUb+D2+Yu0D?=
 =?us-ascii?Q?0MiTQbzVQHgXAZDeBDIKK5dmg0URyzb2mfEUK1oazLk2YvtVCHnT6jjF6l0F?=
 =?us-ascii?Q?2Tuqzl338zROh3gU4z1v7QeB5o2o/JqsFWBjC4/5l+nxGQwUzWI+ZA3Rfe2M?=
 =?us-ascii?Q?wv4O89CZJquxAIXx0Fu21KqmNhkxeGUlrOOdH9swkSkCeV0NTcGnR7/WNhKA?=
 =?us-ascii?Q?Mxo/H3xAFRm0zdoXAJDUAp/V5fnEyJ0t6Q9XTP6ZmeydFssOH+IjmzVnqhdl?=
 =?us-ascii?Q?CjKLV2HOnIqqf16KHQzuT4PpBdbVM2exez36UQZ4maaklxj/Ivuv/wza/DS8?=
 =?us-ascii?Q?fgUlpnNlo6VDUdM6jVz2svA0/VxSfwkuUAWpbbKJGfrd9G0+WziIYyNv0Pne?=
 =?us-ascii?Q?Up3uMGiA5ll9yeZQW41iHIV+Ifak/xG/AmHIFM4bmirQ7npqFeCcWNknfyFU?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98df075e-09c2-4b66-5ba9-08dcc15b9af9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:03:56.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEAwRx6eieShC89MvKwQsKXV1oniihT0pEMW8T5mmmKplKzMi4tIQX71yrLaIiUparIrJALHg+sjjWtIupVs6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
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

On Tue, Aug 20, 2024 at 03:42:35PM -0500, Lucas De Marchi wrote:
> On Tue, Aug 20, 2024 at 10:29:57AM GMT, Matthew Brost wrote:
> > The GuC fini, also fini the HuC so move HuC init first.
> 
> AFAIU this is about
> 
> guc_fini_hw()
>   xe_uc_fini_hw()
>     xe_uc_sanitize_reset()
>       xe_uc_sanitize()
>         xe_huc_sanitize()
> 	xe_guc_sanitize()
> 
> 
> but why exactly do we do that layering? Shouldn't xe_uc_init()
> be the one adding an action to xe_uc_fini_hw() or let each of the
> uc to sanitize itself?
> 

Yea we probably should just cleanup fini call stack so each of UC
sanitize itself. Was lazy with this fix, will respin with a proper fix.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_uc.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0d073a9987c2..5b7d6f44a7de 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -36,6 +36,10 @@ int xe_uc_init(struct xe_uc *uc)
> > {
> > 	int ret;
> > 
> > +	ret = xe_huc_init(&uc->huc);
> > +	if (ret)
> > +		goto err;
> > +
> 
> if we are keeping this patch, then the comment below should be on top,
> or maybe even on top of the function.
> 
> Lucas De Marchi
> 
> > 	/*
> > 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
> > 	 * to correctly move our tracking of the FW state to "disabled".
> > @@ -44,10 +48,6 @@ int xe_uc_init(struct xe_uc *uc)
> > 	if (ret)
> > 		goto err;
> > 
> > -	ret = xe_huc_init(&uc->huc);
> > -	if (ret)
> > -		goto err;
> > -
> > 	ret = xe_gsc_init(&uc->gsc);
> > 	if (ret)
> > 		goto err;
> > -- 
> > 2.34.1
> > 
