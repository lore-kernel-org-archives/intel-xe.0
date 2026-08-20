Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3B1C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 17:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7210E234;
	Thu, 20 Aug 2026 17:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSvoMETt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3255310F155
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787247700; x=1818783700;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RQU1yAtjtKzJdaZjHenPy66d46ac/cq9hekqOjlwonU=;
 b=RSvoMETtsDQ6YjzsaFzANH91hXD2eG6a+En63rgqC6pRskmnSOcijTSk
 syIjdX/c0fc+1/a7m1Z1E9f8wY92klPrVHkMOjhDrp8mXgFQE9eBEdfN4
 Vcixo2IvpLrkX5uvwCRHN/aKJC0rNHr+DzDowITIz61r3xCgn81VG500q
 baLnWnADTLOR8y6pdVGpmy+CTAIQwliIibut5hInPbGwz3V1P5cCE5yn0
 4oTADGIL0v7xrcjmQICkWkFLYD6jWuJ8+9k7GiuiFUWsh2vIKZJ/cEIjX
 C+45+pu6rI1UM586MtZJ2sikK1ZBQNWNnHH5FApRZg+jk5M9dYAM5sQgW A==;
X-CSE-ConnectionGUID: f6QTwsTqQY6VcNWvxOrr7w==
X-CSE-MsgGUID: n/eiOapdQcmk+Am9KgklJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98128344"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98128344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 10:41:40 -0700
X-CSE-ConnectionGUID: lL8ZIg4UQpytJvyTB0B+LA==
X-CSE-MsgGUID: wRCD7fEVQ4u9wOuRd8O5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="269583480"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 10:41:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 10:41:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 10:41:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 10:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7wRX6eT83zlqM61WhUv+oRtS5CheyTHUEAoLXKG0HcLKal19JhmsTcLb9mw4Mdri+RKl3J/UY5V4ujeLThAwXB4bV0lh3sSux1c4+Ara7WIE+JvutjB2p3eyt9zh1EoP7uPW/wtXrhNv19dP98uPYHtyU/4MuaLTaRdyYzfnp8yZTtCDkpWZjTt4d4IsVXW8D+3lpfOuFtzHP56JBxhKlrvhnzx//Y9HXAT493h0ZT6MpytFDXfOYbNJ0eGgCOXsbuWygyvgWt/dizNle/gC6gyvd6bbxwLOCGYuaXOP9a8RT8EUVOw5qilkGkhjsXnPXTe9TYJ1iOCHv3hZ4kosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TxqlUWqIG3+L6YeOisQbEqTUar5/jxdawJjkOPUw+E=;
 b=w0PeHcam4dxjQJuVLIsdcWjVKJyNn9HWQr0i4mu4D7DShGa35Zf+Vl6X9lUdfmajjiU5Q7w+s79sCI+ckRY1vxZMW4EJ1QtsgeSZQz5phZEy+z5qd3oBoH9JP985gRP310fi9rBiC0QC846iBGMp6uc6NfPqhqst71/2FbnUny70Bn9wjEcJ2eRoZ2C65zVSwynRyvYFQqog3/pa4tig5mA9qmjTuhXogARR32573QwASdQXd2gY0PiDc+kWwdLUonJuT98jHxyq4mQK82Ykc+PFY1CHBgkUsSmJsNjWBZm4TQegcI4I7KOLQe22onMCu7+5Fwyls4eqEY7qsR4HfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:41:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 17:41:36 +0000
Date: Thu, 20 Aug 2026 10:41:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3] drm/xe: Flush L2 asynchronously in
 xe_bo_trigger_rebind()
Message-ID: <aoc8TQl/LlHBWc2g@gsse-cloud1.jf.intel.com>
References: <20260717193809.131394-1-matthew.brost@intel.com>
 <de4e2add35cf2be46b99d2f15f8741fc9ef8270f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de4e2add35cf2be46b99d2f15f8741fc9ef8270f.camel@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d949b36-7761-4183-1d65-08defee2481d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|22082099003|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: uznTnHI3KcXhL1f4M4bzLbR/xm6Vow/FYi0ts40whBqOB3/j3+bJPgRp+FSCfK08Vp5GuHS+i8EG0m1yRNgA5umqTziQLGj1gwuv9N2HKeERE/CebGgya9yWZlIxmuwAvMraeXpSi2xb8uFkgE1sPV7Q41lZ8W3LviLIea61ab64s3gMufpUxv59igE+JC2RIuRLUsFXgKa46QtvW9F0QOjulwDyjrXo0b8P5lNtsW90jRSAnfZXq/qk3xtlNT16SWstjtt35DK88ikNCJDBkdex03Um5xIhCfrlFrOpAgWtATRlNbWwzjnhTrPF/3uVpnLorScsSoeenwz7Fv3tlvsYX9owZXe3HB2iDkGR0uRcGaKIH6FSQFaOxCFrBTVUnRcfxdPATv7q3wWFlTUsPupGhX6R9zgkgDF720rww24n2s/I5r33VRtz7VbURQBoTW17JnTWT/BaJE6o0Mby2v+zRzrbc8Gdx0ArvS6OayoLD5hiQ16Es4HD4tv3txrjNYM5A1P5NaaEn66NKOGfCN0D8dXp40ohVvDJUhDgkzK44/KEbhQyrdQ7waR+kQ1s3XgOGf+BVS5TvkSUNFXH6iuKdYXNcjUgoTsJcMzglGBodiCH16KXyk+wXFkKqUQuTHSUo+pXYsfEkkpAOjgDWZmTKIEMxIjwUX+a0nNRXEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(22082099003)(4143699003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LZbI68SkOONnP5L81K0I/gKsPOnWIJI3bgy9MADwbahpbPfiWpU6kLYquV?=
 =?iso-8859-1?Q?wQAD/po07tmF0lp3I+tsCP5PU6z3oLbvzXtPrHKNGd+Sb4hjmxaAbHicPZ?=
 =?iso-8859-1?Q?FVwsxH0wfdTRf5E4CvCRhMuZdQ81iZbZl6SoXQ/dGpr5BwqIH3zg2B08g7?=
 =?iso-8859-1?Q?xb5ccNRhPM7M6oBWtX9r8hHeTXcQq35YAxqD8W8BtMq4yXdzyPhRIofuQE?=
 =?iso-8859-1?Q?Cxyna2kPmlvgGItCFBm7trmmuPXYGc0el8iV5FTT4Ot7o86uHL8WsboX3W?=
 =?iso-8859-1?Q?pkkbYhwOADTCAv0+lFCuPlITUEs6UuLb+/rHTG7/eAjrjV+446jMsPuvaX?=
 =?iso-8859-1?Q?vOyA+Vinw1Ak3IvHC5RptJollpstmcbo0apqS4FD8C+v4JifbgtgslkfTW?=
 =?iso-8859-1?Q?v+CKbo8RcqDV+whj4fXIeMwgDvmeO2JNCQX9+wF+1XfKY90YeycDUBIKNN?=
 =?iso-8859-1?Q?qLY0MAfL+U7N/f8wDgwF/ixIlorzL9LY38eKUG9UbVGwjAofbPis7Ycazh?=
 =?iso-8859-1?Q?hzoBQuNqz/sWZqCqIDQJ6hb+9ul+SuLbuXUNFpofacUn2a/uoDQ1IlMIYu?=
 =?iso-8859-1?Q?RZsihRfPDSWsn61GmvLj4P4EMkY/JQsiDgAfxEDdl+m3yi/+gqnNjWG5j6?=
 =?iso-8859-1?Q?Nz/M3GZ+1u+nnoxl15BfNkjug3rA4zkJ2i2h8qXlo4XX7kg109EE8+YgoW?=
 =?iso-8859-1?Q?o5otQW/cKvjcCHuH3faj3IfhmHIRTSeAMYnkuv7a3bOYr9S1lo4wAAbC31?=
 =?iso-8859-1?Q?zaRNEin2Vf8CZvEIMuQrbGTx9WzB3y57uYGBcmQ7ZUMrRg4fc60SwbfFVA?=
 =?iso-8859-1?Q?Y05OMZ+FrGyh/hil6865qV0Dd1FAfGL5o+VMKXtFObt0WJ7dMJjFDej+pI?=
 =?iso-8859-1?Q?2DjSNNgUxGqQiA5b4VwcAzwcAdA5CXcZkFZ4sYZQ5UDN+TQcU99xwRsBkf?=
 =?iso-8859-1?Q?5WYn5G+GsdHVWala3xGC+XEqgHmBBcKiwKtq5XtRzLbyUc9Nyb9zxLIz+a?=
 =?iso-8859-1?Q?zf+VAQurMXDDqA/CZN/htN/rOfSiWq2+/3G27oa/1oVHoFmGJL6kfuBFcr?=
 =?iso-8859-1?Q?NymFM/MgxFQVslSGA1uJtOSH9oFg3dOgjx9Ys+86NH1K3MfWq86uj1ZyMy?=
 =?iso-8859-1?Q?GIHG/RDJdyZZoNYpLasDAApyxtkGub1AAw9S1HLwIyOIgj/FLn4wd0I7B8?=
 =?iso-8859-1?Q?cf/8MQTfSe44ZP6AWPY7K5v6nYQJTnydCGEE8NzTSkwcThPQJuBeLp32Gc?=
 =?iso-8859-1?Q?vbXFKvlUfU/mdESSMIMJQBkgku/uuRBnm2EZvJ9EpM5bk3SfqblbAfv8n4?=
 =?iso-8859-1?Q?AZi9QouFaR3raEI8sQ9kyWdeZuEEuG+Dfk0fCLPiwIqBCXDaaERofkk2YT?=
 =?iso-8859-1?Q?VvCiVaCITL5kdL4BePy3xD0lxr4INE3DC9lR9Xi+2ZSXAEIUKTcITO2i7/?=
 =?iso-8859-1?Q?is+3/8BGujy8e8THTr7+78Ts/QOhgFCDw9YD5/OcygdGfXqTGJyd1IGIwR?=
 =?iso-8859-1?Q?zfrS/gw4VXfImWUoNn4RP6F5lDRbwmVDn1kM3TtpHzj28rwbAtPyEjopaa?=
 =?iso-8859-1?Q?uqs8dapywzhxzD21esu/QiE8AFtA3moqC2O6J4ZhSiplA6ewE7Uv+BQGgj?=
 =?iso-8859-1?Q?26f7Q6CQ58fS+Z2QIIJQ/MGPNq2l3QSqvMiY7HM5u4ooS6uEFrJWr2Xak5?=
 =?iso-8859-1?Q?D+5WKXxJ9Zxsq/rbgbnpvlk64g/w+fmuFTIwQoMt/1kVRRlCB/i3AS1NoZ?=
 =?iso-8859-1?Q?dQ8f3jXvDRUTdNcXdyI2UEX2yVyxu6ay+gH94s4GOKCAIT8guZdIzS1Ct8?=
 =?iso-8859-1?Q?LcMH/wNlmniwG9bgUEETzjipnTtaRUU=3D?=
X-Exchange-RoutingPolicyChecked: mLZJpobFCtriOgI/P010DpNkjeG8fWFRUBo3d7es67PNpjLkx0RNagv57O7kOpHKfzaBqK8MiPcb/SnSqTa9R9dgtVY3ExDVEmwjdwTyxCDcqcwkJgan2gdFaPlYOMo8q3fxSWY4N7u8JtHOTPt/+jO+dFgo0+T2IxSOzEC5gmQ1dkOw9N8W5ZWoqcvTANGeEUamJTHzx0VIuiukF3Ncxgaltf9OAb7d20MQilSnaQ/Ey1h2ldI4kayzmfHlErwC84xXdv63wcHhdlkj09NW7Oqd/NwCCzkiHgS5nmVuvjrE61Q98zuNm6litBvvEJiBa+HYZ9IQBNijdMKvFr09JQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d949b36-7761-4183-1d65-08defee2481d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:41:36.0571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yihfsg9tkkYhrZ/8GLA16XbqZJPCAACXD7Y4hlLi6ihxAQcneVuburDp8csYRj64jGKidg1UlJn75u1bs6W2og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
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

On Thu, Aug 20, 2026 at 11:10:55AM +0200, Thomas Hellström wrote:
> On Fri, 2026-07-17 at 12:38 -0700, Matthew Brost wrote:
> > On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a
> > BO
> > only needs to flush the L2 cache before the migration copy runs; the
> > mappings themselves are torn down and rebuilt lazily via
> > drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is
> > done
> > by waiting for the BO to go idle and then issuing a synchronous TLB
> > invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
> > the idle wait and the synchronous invalidation stall the calling
> > thread
> > while holding the BO dma-resv lock, serializing the move behind all
> > in-flight GPU work on the BO.
> > 
> > Replace this with an asynchronous flush. Add
> > xe_vm_flush_vm_bo_tlb_async()
> > which, for each VMA mapping the BO on each present tile, queues a TLB
> > invalidation job on the tile migrate (kernel) exec queue. The jobs
> > depend
> > on the BO's in-flight GPU work, captured once as a singleton over
> > DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done
> > with
> > the current mapping. Each job's completion fence is installed into
> > the
> > BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy
> > -
> > which waits on the resv - waits on the flush without stalling this
> > thread.
> > 
> > No PTEs are zapped and vma->tile_invalidated is left untouched: the
> > mapping stays valid until the lazy rebind, and the only work
> > performed
> > here is the L2 flush. On any failure the caller falls back to the
> > existing blocking wait-idle plus xe_vm_invalidate_vma() path.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > v2: Less verbose comment (Thomas)
> > v3: Honor no_gpu_wait (Sashiko)
> > ---
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c |   8 +++
> >  drivers/gpu/drm/xe/xe_vm.c | 125
> > +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h |   5 ++
> >  3 files changed, 138 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index c266fa6bade1..bb9dbc592941 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -686,6 +686,14 @@ static int xe_bo_trigger_rebind(struct xe_device
> > *xe, struct xe_bo *bo,
> >  			 */
> >  			if (!xe_device_is_l2_flush_optimized(xe))
> >  				continue;
> > +
> > +			/*
> > +			 * Attempt to flush L2 async, fallback to
> > sync flush on
> > +			 * no_wait_gpu or faliure
> > +			 */
> > +			if (!ctx->no_wait_gpu &&
> > +			    !xe_vm_flush_vm_bo_tlb_async(vm, bo,
> > vm_bo))
> > +				continue;
> 
> To follow the no_wait_gpu semantics, Shouldn't this be
> 

After thinking about this, the original way I had this is correct.

> if (!xe_vm_flush_vm_bo_tlb_async(vm, bo, vm_bo))
> 	continue;

Just the above if statement.

> else if (ctx->no_wait_gpu)
> 	return -EBUSY;

Not needed because the if (!idle) statement will be popped into which
honors no_wait_gpu.

Let me revert to the prior version.

Matt

> 
> 
> >  		}
> >  
> >  		if (!idle) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 57bcf0660eb8..28223e32fd26 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -39,6 +39,7 @@
> >  #include "xe_sync.h"
> >  #include "xe_tile.h"
> >  #include "xe_tlb_inval.h"
> > +#include "xe_tlb_inval_job.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_vm_madvise.h"
> >  #include "xe_wa.h"
> > @@ -4432,6 +4433,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	return ret;
> >  }
> >  
> > +/*
> > + * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on
> > one client
> > + *
> > + * Create and push a TLB invalidation job on the tile migrate
> > (kernel) exec
> > + * queue covering @vma's range, depending on @dep (the BO's in-
> > flight GPU work)
> > + * so the flush only fires once the GPU is done with the current
> > mapping. The
> > + * job's completion fence is installed into @resv as a KERNEL fence
> > so the
> > + * subsequent migration waits on the flush. No PTEs are zapped; this
> > only
> > + * flushes L2 via the TLB invalidation.
> > + */
> > +static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma
> > *vma,
> > +				   struct xe_tile *tile, struct
> > xe_gt *gt,
> > +				   struct dma_resv *resv, struct
> > dma_fence *dep,
> > +				   int type)
> > +{
> > +	struct xe_exec_queue *q = xe_migrate_exec_queue(tile-
> > >migrate);
> > +	struct xe_tlb_inval_job *job;
> > +	struct dma_fence *fence;
> > +	int err;
> > +
> > +	job = xe_tlb_inval_job_create(q, &gt->tlb_inval,
> > +				      q-
> > >tlb_inval[type].dep_scheduler, vm,
> > +				      xe_vma_start(vma),
> > xe_vma_end(vma), type);
> > +	if (IS_ERR(job))
> > +		return PTR_ERR(job);
> > +
> > +	err = xe_tlb_inval_job_alloc_dep(job);
> > +	if (err)
> > +		goto out_put;
> > +
> > +	err = dma_resv_reserve_fences(resv, 1);
> > +	if (err)
> > +		goto out_put;
> > +
> > +	/* Cannot fail; consumes a ref on @dep and returns a
> > referenced fence. */
> > +	fence = xe_tlb_inval_job_push(job, tile->migrate, dep);
> > +	dma_resv_add_fence(resv, fence, DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(fence);
> > +
> > +out_put:
> > +	/* Drop the creation reference (destroys the job if it was
> > not pushed). */
> > +	xe_tlb_inval_job_put(job);
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_vm_flush_vm_bo_tlb_async - Asynchronously flush TLBs for a
> > vm_bo's mappings
> > + * @vm: The VM @vm_bo belongs to
> > + * @bo: The buffer object being moved
> > + * @vm_bo: The gpuvm_bo linking @bo into @vm
> > + *
> > + * On L2-flush-optimized HW a BO move only needs to flush L2 (via a
> > TLB
> > + * invalidation) for the BO's live mappings; the mappings themselves
> > are torn
> > + * down and rebuilt lazily via the eviction/rebind path, so no PTEs
> > need to be
> > + * zapped here. Rather than blocking the caller on a synchronous
> > invalidation,
> > + * issue a TLB invalidation job per VMA per TLB-invalidation client
> > (per present
> > + * tile, primary and media GT). Each job waits on the BO's in-flight
> > GPU work
> > + * (all dma-resv usages) and its completion fence is installed into
> > the BO's
> > + * dma-resv KERNEL slots, so the following migration waits on the
> > flush without
> > + * stalling this thread.
> > + *
> > + * The caller must hold the BO's dma-resv lock and @vm must not be
> > in fault
> > + * mode.
> > + *
> > + * Return: 0 on success, negative error code on failure. On failure
> > the caller
> > + * should fall back to the blocking xe_vm_invalidate_vma() path; any
> > jobs
> > + * already queued install harmless extra flush fences.
> > + */
> > +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> > +				struct drm_gpuvm_bo *vm_bo)
> > +{
> > +	struct xe_device *xe = vm->xe;
> > +	struct dma_resv *resv = bo->ttm.base.resv;
> > +	struct dma_fence *dep = NULL;
> > +	struct drm_gpuva *gpuva;
> > +	int err;
> > +
> > +	dma_resv_assert_held(resv);
> > +	xe_assert(xe, !xe_vm_in_fault_mode(vm));
> > +
> > +	/*
> > +	 * Single fence capturing all in-flight GPU work on the BO;
> > the TLB
> > +	 * invalidation jobs depend on it so the flush fires only
> > once the GPU
> > +	 * is done with the current mapping.
> > +	 */
> > +	err = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP,
> > &dep);
> > +	if (err)
> > +		return err;
> > +	if (!dep)
> > +		dep = dma_fence_get_stub();
> > +
> > +	drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> > +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > +		struct xe_tile *tile;
> > +		u8 id;
> > +
> > +		if (xe_vma_is_null(vma) ||
> > xe_vma_is_cpu_addr_mirror(vma))
> > +			continue;
> > +
> > +		for_each_tile(tile, xe, id) {
> > +			if (!(vma->tile_present & BIT(id)))
> > +				continue;
> > +
> > +			err = xe_vma_tlb_flush_client(vm, vma, tile,
> > +						      tile-
> > >primary_gt, resv, dep,
> > +						     
> > XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> > +			if (err)
> > +				goto out;
> > +
> > +			if (tile->media_gt) {
> > +				err = xe_vma_tlb_flush_client(vm,
> > vma, tile,
> > +							      tile-
> > >media_gt, resv, dep,
> > +							     
> > XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> > +				if (err)
> > +					goto out;
> > +			}
> > +		}
> > +	}
> > +
> > +out:
> > +	dma_fence_put(dep);
> > +	return err;
> > +}
> > +
> >  int xe_vm_validate_protected(struct xe_vm *vm)
> >  {
> >  	struct drm_gpuva *gpuva;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index c5b900f38ded..dd5b070eaede 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -26,6 +26,8 @@ struct ttm_buffer_object;
> >  
> >  struct dma_fence;
> >  
> > +struct xe_bo;
> > +struct drm_gpuvm_bo;
> >  struct xe_exec_queue;
> >  struct xe_file;
> >  struct xe_pagefault;
> > @@ -254,6 +256,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
> >  
> >  int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct
> > xe_tlb_inval_batch *batch);
> >  
> > +int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
> > +				struct drm_gpuvm_bo *vm_bo);
> > +
> >  int xe_vm_validate_protected(struct xe_vm *vm);
> >  
> >  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
