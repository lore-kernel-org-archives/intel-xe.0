Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8081EC52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 16:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBB210E4E7;
	Wed, 14 Aug 2024 16:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndJacF7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFAD10E4E7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723653840; x=1755189840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+xUqQXk2THfQJAhbae8rgFAWwJkCqVTKoqvYMgOeE8w=;
 b=ndJacF7/FD4k29Ol3IpgjngzYmhm/8oikaMarpxHzySC7Vuowxy5bW+N
 GH7D3O8tfDeAFErq6PZdkdxE6cn8R5Dnu2GApwCVKSL+6b3F7pmm1awG4
 f7ANFGS28OzoDotv3L6TuXX+qxkMP1ST1dTt0X9z3si72gKGvtr8fLNNd
 oZG9ahgrcYIu3qz4+sIgZPb7042QnzCHxgAqTd0x/+sOw/otvZHy95jaF
 Mgz3/EokdfXvdr+C5EZ22ugiKsLl8MOdji33qOS0XQ69G1yp0rnh4tp93
 Ks9kA33w7mcdbGlqseNlMDH3cdvaV638h5mLcSOICQ84wAcg65Uweiywc g==;
X-CSE-ConnectionGUID: cy01lwdaT5GyL3IxwmifZA==
X-CSE-MsgGUID: oddjz1PORQib9xXlAQxW8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24789537"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="24789537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 09:43:59 -0700
X-CSE-ConnectionGUID: 9Mms58QJSFqlQppKgxQBVA==
X-CSE-MsgGUID: e99K/NFFTzyR0k6PTdc0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63218731"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 09:43:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 09:43:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 09:43:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 09:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqd5X7VyOOjf1Bn5Y3BuFBsnpHf1b1mPb+9zIsnnRAOoqGA1pzzX9ExSkN6hZT6nLrqit4s8rhHI6djmo5YFM7W5bwovEH134vFghFHGAmyHkkDtF4csN9OqX1M4BdWkuI36Bot9mn2BgnNCxie0tvgU+4QSoSJb6x8NlBuWJ2xSjAhDR8tDNQ3DhnkbK6Y7Hnwf5NUK87wWq+cLwGwlAmh9+C/GsUzztI6S9T2AEsRaukcZ2olR9kHycDDWHMR7bRUYHVRuuXKRk9FqE7shlfTJkMMLFjQhptuhxKQ19SSgm0BNWhW+RB7EdCX/zKuKkC654mvgTmKGwATfxelUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD/EMmWhEnWk8sZzyCD8GOaZrAlK3Rp69n+Z9pJLMa0=;
 b=RXl+iuuXJiuthzilYSk86sAa+gU4ioPTx7xliX5QedinawWRCS5Un/YWe78Ue9vEQFRN9FjoQN+pasaHlIJKQPn4BOOGZ4HRdgW9hp3P+c4RROFyHsCX60xhfDkXNfoYO9yhBgQ/lzYAy4AJWFD6tT6NmvCyjwEgS/XfR2aphK0ku8BIK9pa2QlwPClMj3ZWaDdyL+7VS1xy8R3tb9VKnQfGfYgLiM31kLF/M7yCAWOj5YCY7lNWqEoCgANnc2YwHmTpzvR4stAuZR1iWxTdcZAjjpaxRWDW3+6yHCCCagwYhCov0WndGhH6D4k+rfgMkwAxb4Oy9yg4zpIXup7Yfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Wed, 14 Aug
 2024 16:43:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 16:43:54 +0000
Date: Wed, 14 Aug 2024 16:42:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add NULL check before deferencing pointer
Message-ID: <ZrzeiWJ5zTCqN3Ae@DUT025-TGLU.fm.intel.com>
References: <20240814101750.857665-1-apoorva.singh@intel.com>
 <d3a3cccf-e615-4620-97d7-0bcb75ef41f0@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d3a3cccf-e615-4620-97d7-0bcb75ef41f0@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec8a652-210e-41a1-9bea-08dcbc8048f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4O+de0wINyrGpuKBkVGVx98Gr/1dzb6MxG8Mhjffd6utATyCcdi5tKpSCtVG?=
 =?us-ascii?Q?R/lMuQRhJMIXkkCiBeTnebXVaNLlGu2fKJ87dgeXXjLzi7e6V/rh5ZaVk6Ux?=
 =?us-ascii?Q?E+BPRemvpT5uC5efVZR41kcbVfibDXO+n0jcke2LGnki7Mm29JWh6/2JMYGh?=
 =?us-ascii?Q?Gvs3izp8FcafuMPvBck3eArcjNCdvR8m3PkPuvp/eG1Qzf6zlJBe1RoOoDBo?=
 =?us-ascii?Q?sQQaXzL/p4nWp6PpPbMO1d8ot9+9ohQIF8qY1KqzYnB5XAb8asmgOUEijirg?=
 =?us-ascii?Q?aw3szZUT/mbhT7cBkolLrILKhneEXy4PHaqKlc2OwT0JukvnR/OdDgnz6Riu?=
 =?us-ascii?Q?mLm1otElDv+zn6LyX3lR/s7McoYa92XbO6+bKlM9q20cHONuM1R3P8iTpjAS?=
 =?us-ascii?Q?Ju7pv5E+0aReghbOTc58PtbrfISlWIhqiVvo7nIPgYHEUm2xnBz3hEHB3b68?=
 =?us-ascii?Q?gJjVEZym4/n8zVMspyN5q9A93YNqfDeHZEZkv5iK4Myt3FxvMt64xWL5yqd/?=
 =?us-ascii?Q?0lFHgM5Nn7XnZvha4peOptni/sB3mepf7zdxB05DBPcd59CZg2hLgqouQodi?=
 =?us-ascii?Q?egKz1melU28xlhem4x2cDWd7OZGp60kuBCvgMwZalsox9px4Mvpi2C1dA9Mk?=
 =?us-ascii?Q?SY4IQjURcPfX6z4pbb9WJXZKEv6HwGgzIFmRXP8vr8GFe05ReDbjR/vmnyTo?=
 =?us-ascii?Q?JPVGkdE5PjJ5tUKS6Z7pOM/ik+YGV3QFlTlxQ1VmqbmNPsnZcf0YyyhSBhTG?=
 =?us-ascii?Q?p1umBakqwAC88l9HGAIQHYlLsb68phvqkFsCNkp96jhb9R/gqQQy/Vwto8G2?=
 =?us-ascii?Q?9CKxrqNTxmhwAdMbTyIerzSYz6EusUNE3paZin6P1sErq+84eRx6J5X2h+ZW?=
 =?us-ascii?Q?JDWa1+k9zUTfQbXz/RgFFkdC4O6vREqf5O4iPzumfy6kAQl1XvpKlSkn7Uum?=
 =?us-ascii?Q?MebuXSpxy5bL0hvcSKVWAeTjVQvyCt8+dMydHSJXAudaHC0eoikwvka6CMZd?=
 =?us-ascii?Q?GdBbnXJ3TsBQ3/CH3s1Edza9bP+Wcw+a6rAc1tZ6lKaeevesRVGWZ5BatDf9?=
 =?us-ascii?Q?HGqtgstqSmZ6XUbYlttbybETCuUtfkPG2sHCY54LM8fXMsXidce6qvjVQ/Va?=
 =?us-ascii?Q?BLfLk4p5n53vmhzXtaC9KJHvcTFjLAVvZW3xl5rVgB2SyVkkpKnTkD/VqQQq?=
 =?us-ascii?Q?Kc44dxtbWDJe+zzB82jsg4N9JUajZAXKOZedR3uH0w8mFUQ6TtUSROQtiyj7?=
 =?us-ascii?Q?Y0jV+cDBfQt4Fo6i4LDQVK9XUqGUwmGKtuVogtKxZHZ2usaJNzUaLNl967AX?=
 =?us-ascii?Q?gL7uOdK4E8wstKLvd4yM0pn8tCKmVfIDg/fLkpOvGesFYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hpk3btvh/l6OkCRmEfxkWlBGfqxQwjU1KaKjBveIYLD1zucRGoU1j8+Vu21D?=
 =?us-ascii?Q?T+RZzesnKNIR7ozRbnWsuFwp9Yuvp5of3A0fiBbroTuYlzLJBNyhnvOMvcGf?=
 =?us-ascii?Q?FkRrK+kOrzksg91qV4S2JgsmSFXHOuMvK2AhtqcQk3rdZ/uVUs/PzQP2Jwpd?=
 =?us-ascii?Q?K7d5fCo7uiluEadEp/uqPLkbER8xkwXUdPCuXoh2w8raSevWjJyKe6rwXwjZ?=
 =?us-ascii?Q?pAlgK+lDu11lfIBE0RDNNU42SCNHJstJs2xXBhcQwZoR8ipZ1B0c+bEi9C5u?=
 =?us-ascii?Q?a0rhP2ZheIYarqyxJ/lEurUdMMMi05nWNZ7bloxgtYCLK5sNQGOsxk5tIRGb?=
 =?us-ascii?Q?spPKCyWnveSDdj02FsZNcH2Kc3LJbKRPNMpeS7ClpgZBLXjMsZ9kI4+Azyfb?=
 =?us-ascii?Q?COVhr8zkPiVD/C/lErkE+5kyGpQtmAQbeK9kJ8CO1TjYl27mOf3/OlhtqTIx?=
 =?us-ascii?Q?siCce17UDv9OaQpiEGxJM3pj7GEdJm/ZrsHhZ6wnXcn71t9da4aDft0rnXfa?=
 =?us-ascii?Q?5NuUW0BzJOFClXNIx1YtUJVyMQFxkm6FCG5A4d+aAzR8CNTYyaL9JCuMrP4m?=
 =?us-ascii?Q?wX12Jyf1JAVSBVNB5QpzKn3qlpNfAdk7loelYGqmL4/rloGJP8MIcx+a9GoJ?=
 =?us-ascii?Q?UcNJDgm4f5QbR3qOKq6Le0Z518HzCGpXVFvN7C3F25At66YN06isr+gm6k03?=
 =?us-ascii?Q?OdH63mvTMs8VN5v98dXnlNJ3aaSmH73OBMdN6EW3vXvhJXLJCKwgALneYHuT?=
 =?us-ascii?Q?fy3pidhmBFAbWiPvTB6fjSEDEMQARcLue63s+hn394WsJvL/A/IYpO9ngkwG?=
 =?us-ascii?Q?/7pVGsDq8JrW3Y7vafhGv/4RKEUebfTogTps263alV20q2BKYCL36FMKZse+?=
 =?us-ascii?Q?HXR1wMq/l7GYz0mg29n3IiPHF5oIXmC01WfQv/7LrR6mF+k3tMVoOP/AdCVF?=
 =?us-ascii?Q?sD3EgA5UPbvp7NAsBr1wOOPqsI5adCg/nyO+OA5towvfUCmZbuta2ZL1i1ty?=
 =?us-ascii?Q?k2aDfR2yok1VIbGlPzMSrvKntbxE7/YdXp9pO22eG+nMtbUQyes1XMSO0aHS?=
 =?us-ascii?Q?oI6Yyw6XHnVEf6e0i/nUScFLbTE4buRywOOWvX3JUxpENDmJnstZC6/daa3b?=
 =?us-ascii?Q?8oIrHsyGrXH9wiBUH3U8LUuMRi12pP1ovumdR+kA1Jb0/OW+tWBQka+36+jA?=
 =?us-ascii?Q?d1at6gLtlzAj0fkRpT/eMpY1nTwh4qRzCoj6NNzWQKjmldAf8AH0Rew790AD?=
 =?us-ascii?Q?RS/4RgXNhf3ta9DLk+3XAbsHGGEi84nwTXyu2nVTllKKO+mzPeZVY5jOGt+2?=
 =?us-ascii?Q?TLP5o5afhLqlyrqnRjuhk0vFD2/3lSgjtOz/ToCc1GWM5+QJcB3Ck3Oipd4V?=
 =?us-ascii?Q?oQO/18JYrbillMsnspH68QGHaZdOiqZferIhPiiK0bH4NTT15HC1M8Z544tS?=
 =?us-ascii?Q?lXP+IbVeaw4rXOEu9MCYnBQCxLELi1pvWVsfKaNxdWS+kf8uiuN0/QZzN0eZ?=
 =?us-ascii?Q?CisQe36kWv6N7L/4ke9SXQTh48iELfIctOizDFPJpLZhvukp6pM8vIJuXR7S?=
 =?us-ascii?Q?iK+0JW0WfLthkE8RJDQvXVYyxuKc46RZdwKhiT2C6vm1/jlAdO4IuC95xjhW?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec8a652-210e-41a1-9bea-08dcbc8048f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 16:43:54.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/h/zQTesZQ2k2jlA7e/XyDwWtixdiECB0ZoQDargxZ29XF0BPr54bvUORbxd0yw8c58uSY6tHdLYYBuzy9MRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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

On Wed, Aug 14, 2024 at 01:02:45PM +0200, Nirmoy Das wrote:
> 
> On 8/14/2024 12:17 PM, apoorva.singh@intel.com wrote:
> > From: Apoorva Singh <apoorva.singh@intel.com>
> > 
> > - Add NULL check before deferencing of lrc->bo in
> >    xe_lrc_snapshot_capture()
> > 
> > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
> >   1 file changed, 18 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 974a9cd8c379..e31d9bc64ff6 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> >   	if (lrc->bo && lrc->bo->vm)
> >   		xe_vm_get(lrc->bo->vm);
> 
> 
> Looking into xe_lrc_init(), it seems we are always allocating a bo for lrc
> so remove the NULL bo check instead.
> 

I agree. I recently touched this area and thought the lrc->bo was
unnecessary but didn't care to remove it. Let's go ahead and do that.

Matt 

> 
> Regards,
> 
> Nirmoy
> 
> > -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > -	snapshot->head = xe_lrc_ring_head(lrc);
> > -	snapshot->tail.internal = lrc->ring.tail;
> > -	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> > -	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> > -	snapshot->seqno = xe_lrc_seqno(lrc);
> > -	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> > -	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> > -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> > -	snapshot->lrc_snapshot = NULL;
> > -	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> > -	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> > -	return snapshot;
> > +	if (lrc->bo) {
> > +		snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > +		snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > +		snapshot->head = xe_lrc_ring_head(lrc);
> > +		snapshot->tail.internal = lrc->ring.tail;
> > +		snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> > +		snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> > +		snapshot->seqno = xe_lrc_seqno(lrc);
> > +		snapshot->lrc_bo = xe_bo_get(lrc->bo);
> > +		snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> > +		snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> > +		snapshot->lrc_snapshot = NULL;
> > +		snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> > +		snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> > +		return snapshot;
> > +	}
> > +	kfree(snapshot);
> > +	return NULL;
> >   }
> >   void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
