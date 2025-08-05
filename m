Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3801C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923710E1BC;
	Tue,  5 Aug 2025 03:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeYTOX5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD310E1BC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754364678; x=1785900678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=208Gz+R/LhuaucIUJ8nxM731UtXZYA1e+44IxKw3mo0=;
 b=YeYTOX5WUNVGdttFwmVSLWLTFkzlBYV1QRZ4AbtHmuOlRiapbV4NZjmh
 kjv43NKAUofqTJUUU8YbVqEqCs+VFl2S6LCG7VlwIsXKdURc/esuW2Png
 i0DUVVwak/Sn5zNkHsB39hGRKVxx543afID5Hl3On/DN6LRdxG/IOzZcg
 dHlMIzdyRcA/Zj9/HLcv2xIVcFlfjhEa7nwmGjTGElU8QRdUvUQiOW6Lu
 66Hi8oQ5qAFvfjhsohGsVoA1qaVM6IvB549qObfFPdB/FU1ASGmQceNv+
 6RvfttV8WPRuRcF14CAyoEDgGuOu4dXRDcF6+tVwuSVTfFCsGRqN9bUGO g==;
X-CSE-ConnectionGUID: eU9bRedVSWOPxVoFNAqK5g==
X-CSE-MsgGUID: e8XE3wctQHSmfzvNYq70xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56720613"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56720613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:31:17 -0700
X-CSE-ConnectionGUID: ColJWfs3TeqyStvLthAhmA==
X-CSE-MsgGUID: XdFxckz3StOwASnU7k8bJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195182914"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:31:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:31:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:31:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXOAlZusJN7jVoQvtT2jx7yPBZfKjLEYyY2bV+KObnaxruyuvkWgo5MXitifA3ZFtmuGwyu7MRIhQTLg4cKmZgJajSjqC/+iLK1cEcDURAV2wswj8/qjsyju8C6LeWjVwWhADuHtVDUGNcz+wdcj4wkKA3d4Bl2KHU1508M470r2MpVEJ4K8JI6NiwPdmeC79XcSp4NOvR/8fP2bkO3thaozyTIfsblG+Xc1yDwCK0Q9D4mn2qCGD2KJaDmyglRWsCAEiuBQf2Rm5YepKlf+YL7lsQPZG+b6knnrg6vLBXKbWy3ed9cx/gKGt8WVt5xCXHKMpaUBHArTbKbgf5pK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wegAVS0FrX4pPOS8KwYNr36S1bZbHkVib0I/OFUiIfQ=;
 b=ZfdszK8nDuc8e8PcUI9wTyHN4XaC/O/oz1lX02x/E/TEUrv7RUtwUojWZ3gpT/pOArRB/Bwj3b4mWJgbVMzORnW5xi3Q6ZpiBBhbEhQvmmyKRdYTi0JWzfD5Vxdqor/60rF/t8LFH3Y5an3o/UfqSkZLbmVtH6x6zUTKKf7UNq6eq9TabOAcLdR3y5lEYOFJfcY1jA+n+Y/1QCiFRgS84jxOGoPf9huHEvljUrKlkPOEd/jgP67dqPNfxGT/Jp2suy5P1Ru8qLxEOKXopYuI6f277zPR/2v7nehAwLp/MerHXtSnXjrvqh5Om2T9PsD63MQ12+4DO8D4SDZeqAjhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 03:31:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:31:12 +0000
Date: Mon, 4 Aug 2025 20:31:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Pravalika Gurram <pravalika.gurram@intel.com>,
 <intel-xe@lists.freedesktop.org>, <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Fix coverity issue, overflow_assign
Message-ID: <aJF6/Sas9nWiZ7kV@lstrano-desk.jf.intel.com>
References: <20250804134543.3313558-1-pravalika.gurram@intel.com>
 <e9f4b13d-f3be-4b5b-9efb-35e809c21e6a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e9f4b13d-f3be-4b5b-9efb-35e809c21e6a@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: dc77ecd4-fc1a-4878-1ed6-08ddd3d0867d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XM6riCaoDt0JEdLz4SCQMS+8dZGtkQTp0itetomMyMtORCu9VllLPmOiap+L?=
 =?us-ascii?Q?CJ5wOJGL7Z7JrJeJSzK8SlTJZAyAdG9WCQZtKJyXhhhVWHSnIZI452xEDTWb?=
 =?us-ascii?Q?xhh9ZlzijgSMi951fkHmwhy7d3LP+4aY20p1dM6ucX//RSRIV2rHeTi3BfN6?=
 =?us-ascii?Q?HyCO6oVlEq09w2kRP+P5uKMGSJy7vqeadO/1h8pU9uOt9twSG2tdAm8ZkGIv?=
 =?us-ascii?Q?i3Rk335mSWHvN8ePdUKkiD+EW2I2GlcOuJAP/JFLet4ELkyNjmw2ZvXfBr6l?=
 =?us-ascii?Q?Cr+GGGDAMfyZ5SRMLHPOLh0NEE9zWvNUBwQK3Vt+bhs3/HesEWevJePlfVG3?=
 =?us-ascii?Q?65nrohauLProrLNk0aljoneLvY59yTTabcUbtxK1WhqJktrcUtCdXAFnRYWE?=
 =?us-ascii?Q?WcyFaqI+9UgltZ9h3UTUZIDDpKFVeNHj+Ym1HhA06CYkCdxGII3iDjp3uNZ4?=
 =?us-ascii?Q?/mOyIzRgnXjAkJpro6GPwwQSTgE/4wJHNuhtRr43BfgQxeaPW+mdjhPltFkN?=
 =?us-ascii?Q?hAJ+E5NiedZvhikTRARlf9BBvzzCRqyCqY5ICQDdd+QEmTFWzOLieVWramd3?=
 =?us-ascii?Q?nuLXmgm4RrKlLN0MB99whOJNbdkg7B3XABnjFDROwJjjOdTG3+g15kIfPeJq?=
 =?us-ascii?Q?Zf7L6CTFYohuER6oRG4xKWVAYehqHsIP2uPdlyhrP7qJCJt9OCbXKLgUgQDa?=
 =?us-ascii?Q?3EPujJOHVWp/C9cGEW2YuY8AeqJRfY1u5VsRUw5GPmGyDacd/Iuh8TNXbrMm?=
 =?us-ascii?Q?hpogd5UQt7SnTbPr0Dyobe+N6oDSU4wUT31YnPK4xbiTFs9Qs3aCNocsfaL4?=
 =?us-ascii?Q?l6jY3s4gC0IGHlZFNJf4BXSje44kp9VX/pIanu4uiMmRp5QUQuN477iLqq67?=
 =?us-ascii?Q?R8cvWruT0C2lXrKZJYRP34R/Cr818JOYTwwXZMv1cxbr/vXzkWO8TrRlHyvi?=
 =?us-ascii?Q?o9X8cN4w7hnrzMG9b3u12WyMook1C9k1u4kHFmmr9ZGdS1FBRxTgEwDwou5T?=
 =?us-ascii?Q?szcMk59rnufpe3/DMiTQ2rqgJvAkGgdh4RDK4gN9/06dpa2C1Blg24rdxJ2s?=
 =?us-ascii?Q?tZrozQAPNkZmiG+FSV0nEx6/mDI1m2jqQb+9pqPUsoQAjGwtyhzWrpDUMemD?=
 =?us-ascii?Q?2b6DrXkrAGpWgK/K5uk1B95fl2OqeNQnru1BrCiZ0BHO8V7PWjG3plgCn7ed?=
 =?us-ascii?Q?UufSSeG+gYqppJAVwKeTLGlq4VQVslJhJuAyRLYhs8jmRHYt4rNUITsGtwZG?=
 =?us-ascii?Q?/7Aaqo6Oi9e10PgxPXzs+3soJCmu2LrBMPFiDg6jwgMxgBA/aOgnt1S6hi6c?=
 =?us-ascii?Q?8nG7YkO5Gt7tsPTY99hU3Aixxcczcn+6cp89sJ3dtfM6Ju9r7dPXZXUoAM7m?=
 =?us-ascii?Q?6eNwlS0HQF3U7FRVIDCOfYGTbzkmCIxZ20HXt9P+QEaJ6j63KQSvl7HXNVhD?=
 =?us-ascii?Q?MOS6+qxHkBY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?el39NWAjpp5xq0Y0ZLm4KG/fGi3aPCd6GtyHVzUyKFeY/CT3BmO0H1DnZbQR?=
 =?us-ascii?Q?wcCfLKQFpeU0z8x/cE1wvF/LHdJXh6zNJOvwbFNdzWcjl+zPUBoxRlv4SkvT?=
 =?us-ascii?Q?fxbB+E8OZXj+x47F/q0XRtyzzmMkHF7wcajbEEOoEl6dOrU3CNfwnSOsx/vA?=
 =?us-ascii?Q?ZjB7vRS1bDSMz/iz8hLgXa3ykDArHO4y3huEYBVrnn+1A7SuKPH+LA/dz7x9?=
 =?us-ascii?Q?+zogLCx+OF5++f8N2haiAcv/OJO5tRq0BaG9OXlobOVAx5YJjAP5f8ZAPCAc?=
 =?us-ascii?Q?yOFz44T58ksBmHkxbYQkf1qxVyQFeZM+2rP8YJ0F65m6w49TQMO3D8O8Enm2?=
 =?us-ascii?Q?lsnQINyGqzoHI+U3DfNlRLte1k+SkYlH/F1ZbY7/GPFBN3pCb39NC0cShYV6?=
 =?us-ascii?Q?jZgk08F16U1Tp1dIeKmqzZmLP1gSRaB9SU9ND/Y8JpHE3Qnxcow5+PE3hmQN?=
 =?us-ascii?Q?Z6sQhU1K/kD09nIC+p+XqYOwlx3BXKF6baBTaXVt+zStVSfKUJKIQbQyNqko?=
 =?us-ascii?Q?VHFWMcSlR/dbF68H+H4Uzsz7MwROK/Bl/mJGwVbMphLJ0IdABIhB1zIHNtF0?=
 =?us-ascii?Q?bVRKJLbh6HQVCWO/rU/2R/EiyuDVkrCjQQsr9y6XFXfGtDZNFFgXkiQETZK9?=
 =?us-ascii?Q?TRGBy4nDrSza1YZugGpzuy7QTzOj4y9IsDEjA8XSH0z+gVAjaBt0TKSlQ6hV?=
 =?us-ascii?Q?phjuRVA8AQ75oQT8NlQzF8iGP8r2jzJJXZiyYS1PGXEiUY5y+S2eS06Kn9Dd?=
 =?us-ascii?Q?E1z87Di160Z/H3GNN2qhqHvgdVKiy0b5WsCah8xL7pjcPXjYVhkk/T226jvp?=
 =?us-ascii?Q?dlahN543ANXFLPShHwqbu/S5slMpFkPamBpf58Cnr882lfSiVIy6I8Oqmu+7?=
 =?us-ascii?Q?uUh5wGxxrrAqTcBYrIq/+5iBKTwXxgOF3V9dU+p9w4qi+B7SKOMsc6rvBjrS?=
 =?us-ascii?Q?sF+GF2LIDSU97PjydLenh3mWSaRrY/+SKmO34KNCNJiRf5tqe7Vzptv8y695?=
 =?us-ascii?Q?Yoecn1D+LCjz/KewgH6Chyr3Dqoe7IA+qmTvtHkvzKjTGwVGvRq0BL65u2ba?=
 =?us-ascii?Q?KC39H4Cx4QvcmJAywb78kd22MUj6751SH2FCtkU8kxp5iJFEi/jzP0hwyHI6?=
 =?us-ascii?Q?O7fBGVsYtqn4YMVcLyUMt3orj1rKtr4lJfepEqvM1xvBMaDruxKbFZG6FaVQ?=
 =?us-ascii?Q?RRjzeIRpzWJXLwKH3rrd1EMF9fucNrO1zGBAHNJR+jpsNFnM5VaBRkszwYWA?=
 =?us-ascii?Q?L1tkWGWF/zbXZQPUhff7/8V/kTeahCmbyR1g34QdbnQwJiejwhkCVMgcoRF0?=
 =?us-ascii?Q?onyeThJHV6LsShUjYLDbwCOHVJSs6o5+cg+NWQxS4KTF9oy9XW5w7BK0EICc?=
 =?us-ascii?Q?M8N4cRCWOKV8YpsOAiHzQlTJt3Mh+j7HPKeTFdSg+yNbtM5c2PuJtIlx3p7k?=
 =?us-ascii?Q?EGjqNvOOrzvGSqJKN9DVDpQsY34jltaj46oYtsHMMv0RAdX07uaqiEJ0IAmw?=
 =?us-ascii?Q?wvnSNjLmpNaQwHbSwXgnBYLo670IplzjMwKHazq9GYt1+JKIsZK6cjFg0G2N?=
 =?us-ascii?Q?olLH6qR2nxOOnq4daKkn5zYNFsnVxNmcpEokRIVwWFjDyZas+ieZ97Nmew74?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc77ecd4-fc1a-4878-1ed6-08ddd3d0867d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:31:12.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFwjUl6EmlSk/+nAPDi6QsF/b6tk9xkx2FYzpyIrPt2wdYL/f0xqS0jY2hSV44REFbc9z7qrAITaY3KwaX9w3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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

On Mon, Aug 04, 2025 at 02:50:45PM +0100, Matthew Auld wrote:
> On 04/08/2025 14:45, Pravalika Gurram wrote:
> > Safe cast of error code from long to int
> > 
> > Fixes: cda06412c0689 ("drm/xe: Wait for migration job before unmapping pages")
> > 
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 1a72561f987c..a1e82c879f1e 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -988,7 +988,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   						     false,
> >   						     MAX_SCHEDULE_TIMEOUT);
> >   		if (timeout < 0)
> > -			ret = timeout;
> > +			ret = (int)timeout;
> 
> On this error path it should only contain some standard error code which
> will easily fit inside an int. I have at least seen this pattern plenty of
> times elsewhere, even outside of xe, so this seems more like a false
> positive?
> 

I agree with Matt Auld, timeout here is going to be -ERESTARTSYS in the
failure case. Seems like a false positive.

Matt

> >   		if (IS_VF_CCS_BB_VALID(xe, bo))
> >   			xe_sriov_vf_ccs_detach_bo(bo);
> 
