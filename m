Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB460C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 17:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9534F10EFB3;
	Fri, 21 Jun 2024 17:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4arNgmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC3810EFB7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718990756; x=1750526756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MwvUU7SpxUVeHtJYrcdZOXK7JbY3CTPXxPCv/grCi6k=;
 b=G4arNgmt9RE9jT1m15cHzR/dCcePooVR2t6oxEvHyH1ryg5gnCvwOsKu
 ecg0EUtXPE4Wgscngrk8bhII7Feo1ABu+8XYPdhgIcBz70jUE6wCZ+eUI
 jp7YSrtRKi9hPgC5sbhyo15Y9Ikyf8wOLsr2Yf3+oS0Y/fXYsO5VxxaLg
 Ip4anljepqiQGUf1wnJ4LnWqkGDSGAPkxoSHzGfNV7AvYWzuSzsRzZpWu
 EwDy1LpvqzW7c9v+LFJ/owkJxczC1okBppdDPX2evjUtpnWNzvb0ZDKnu
 MpPAbB32j3NkEQeB1pJyuqZWgdObWhIfM8deUnslxYwTyA1chOIwE0+0s w==;
X-CSE-ConnectionGUID: Pii/8Wz9Ruas42rdz7z6TA==
X-CSE-MsgGUID: qgKTPYhbQ7i3cVvzx/P5hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="41440544"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="41440544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 10:25:54 -0700
X-CSE-ConnectionGUID: zmMjTln9StCtAPCyfghmsg==
X-CSE-MsgGUID: Ql4YA9URT/S2yb6GqD+SKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47569825"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 10:25:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 10:25:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 10:25:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 10:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VctQ39J/aRm1DyhC7O3rhY3SHfyIcCX06tKL1Bmfrff7tUGdVVJwGIXpeswkKwq5R2V4PNf4xyn8HB5zE6nwX03Hs/V4R7mMu8pM18Eu4/d9yFo1BmU8XOmXVPFlHqqt0ZR/JMKN857CqELGo01UAAjx6H86PNkBhFkXYNi3iBBDjDCfy+A7hnzms4NSn2Thhzku8F4Cxz5ZdWvYXlUFs/4a0T0lSVPb21T8Ztd7wxOjAFprf4hVOJUEFfvzPyQ1ucJmtEAhi1yU/4+RJiPBKuTAbYcYH9dheMcdjlQUksvz/VTvMBq9H4xivMT5FV8YtxL+IjSqrXaWm68brcQzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ENxhqXQRlKGHuE2JAKwV3jd6a+gOwaLvH5lOVyXyXg=;
 b=K7oxuv50wHqBiJuYPBSG3Vywh1+KgV/p07S/fh9/PPcTbB0s+e9MrhuqKCyvKE9fSeVlfRB65+K1Mb1X0Gz549ptPk0KrN94vUNq4cwQSQ3BUlzI1+kWBZQcnQH355oisBu8uoVhQuc6nHPnIqaIr2hTLWccQ6XUfcTpSG2VWGj2lk/PTm+tEe7m/uHfRdj2AGpLnFXngWnI727qEq4eW538GoTAl+E8/aIJQlbjr1BBOwG8yz5JtgtYHfSplVeMLSbUq4kpj7jsryXAkgZApqUNanfMqcIEalwY7beg/P8tTBeIcqdBqH9Z6bcoiPOic36sVkI38pfKFWFS7ebwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.24; Fri, 21 Jun
 2024 17:25:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Fri, 21 Jun 2024
 17:25:50 +0000
Date: Fri, 21 Jun 2024 17:25:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/7] drm/xe: Update PT layer with better error handling
Message-ID: <ZnW3equ0LSbEfflN@DUT025-TGLU.fm.intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
 <20240618171509.3336601-7-matthew.brost@intel.com>
 <f52347ce-bde5-4c1f-af63-55d3fb8d971e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f52347ce-bde5-4c1f-af63-55d3fb8d971e@intel.com>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: afb4c0b2-63eb-4897-484a-08dc92173236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lYUxaOpKQgVfYfsrNt/IpfqA/TDJb2QW+2XPk5xE2FRqsuy4mIW+KiP2wwLq?=
 =?us-ascii?Q?W9wOHU3z+6kCNGoa8Tdgfe2cWq2wMzPpxONqhtnjNNJVBD8xES5koGacdLOb?=
 =?us-ascii?Q?EY33A8sXkVSzQa3Fpj4x87qQmuQcnDzvtyN3eypiSxkfu0v/5GGE1fniywtX?=
 =?us-ascii?Q?ob+SNLyJghNcmrB/EkAFPyV5AGCFCzWFRRnbdB4f0YktOcIv63a0OejnlgDo?=
 =?us-ascii?Q?IRRNO978gKDDcNasgo/M67tP8Ie3M2MWt86TtXPXs5l/h6VKPUhi1IGDVJiO?=
 =?us-ascii?Q?dvyxHSSqmlUtZi/Z+Rc3Do044tnl+u5cIErVlUQb/mMwO0vJZUeHoHJxpodH?=
 =?us-ascii?Q?OPvMHXs0OB/ogTVfCYLUPt72MmVTxpv5LGDPeDsh3/StanxPAjpJGOFmma2q?=
 =?us-ascii?Q?kQZCxUzi6Z6CzQhL/VzSw39oObEIa45SxaQM0B3zKM2/gT0qnOI8lu61hqB8?=
 =?us-ascii?Q?9eM45sbb4Hximup5Er3DFHbuoDq7it6jrgS61eSUxCjSVQvCcp/qSlGJnn51?=
 =?us-ascii?Q?8lW4sKmKMaU1Ezv0i9feVUjGiXngyvkBv+nDBuEbGL1MJM1tXfEKdndYiKTd?=
 =?us-ascii?Q?xfbKgpixtWoVzAtiL20cWv5w3i2tX9puGKuJKJtB0v5NowqLQnUDm+3IdLxi?=
 =?us-ascii?Q?bzZyx8UcgE7zReZMAj2dL9t8iGe/XKrFJwrG/Z7+M/kWI6A8JF6LNIYcsAeD?=
 =?us-ascii?Q?ECJy1nfalyadEyrTF9IRzKGGfKJh/59+3Yo7b5P1c6OOuPU5157pWUGXwewE?=
 =?us-ascii?Q?fLJHr2VN14se8OOFg5D5HzkZdkCdBOHxS6Oq7I+l0BiiX7OqzRCtIJd9fRaq?=
 =?us-ascii?Q?5k4YMs5BCxpEneYcdPk7wet7cjyhMG+nUB0b+qRtB+Sn0j79a7BlqGVC4yx2?=
 =?us-ascii?Q?H/1IrePC3zYrikDt/kffkvuLclvV/NsCM2S84BnafmvCSt4SUDOPbzItUlD3?=
 =?us-ascii?Q?n9KiRawp5wuiDuOgtWWhANu0D8LEE142DoOQqXNe6dulTip8Ay9PeT66H8ya?=
 =?us-ascii?Q?RYPTJinVjSCDJxW6/FZp3mGrpjG2vXMJZ8vIgmVGAV6G61ycnmPFuHvJ913a?=
 =?us-ascii?Q?RMUIyALWu+8N1Yax5JfIU1e8GXY2dZ3CBOZeQGFpGx3KpsYPpK/cQm1vFZwE?=
 =?us-ascii?Q?vgLJD8ZQv4dBnuMIJRGLMX3YR+np/YgWZIHVZOs0jOrX+vTykESXthUFUjiX?=
 =?us-ascii?Q?An67Aso48HYeq+ilhKt42FdL3jkl5PYF7AbNlRWUy6zycgEtliAhBvIJY2mm?=
 =?us-ascii?Q?FAXzW8YdS4Xaem+wcMPB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kAaecmX1Cg7rX5ZzYerMyt7bhGDnRvQj59ZvLWbZRzvZKxnUnbw0sE6drW7?=
 =?us-ascii?Q?uspEK02q8CPfLOip336b8Ts2jdPy5qpHS4a+qIcCsg0IACj9tB20+1uvNoB3?=
 =?us-ascii?Q?kKSHp2hmBjor+uhaCxKmfUc8mQ3HzkKYFlavZ4zS1GZsY4/436GtIHeeMNOb?=
 =?us-ascii?Q?xLorVHHv81MIuhSdjCVRc4+QGJYOFuWjtbpt+KQgSaj2gewBsZ8ZaIfP1Ceu?=
 =?us-ascii?Q?TewdrAzFeh5sRxO2YV013DQYkrC9UOhGzm1/socyfkbQchdUUXbYcfU+cUXu?=
 =?us-ascii?Q?5uVaU5b0A1HseZ5xQH0EP51GbaUsUWhJzvAtvgiR0wD7hrXMtI8LfGAx/28x?=
 =?us-ascii?Q?47R4L5Dedk+SNh3e3DFqOTlfWIqzV+9Fb1C2Esp92bxOtrRmEkia+YUyUSfe?=
 =?us-ascii?Q?6j8n+VU0E9Fk8Q610No7/V+Y7OG1DDDkgdvTL+5xz6nZhMTGf6O6/8ELYwe8?=
 =?us-ascii?Q?Qnkv0V+7ouvdFQUJ6Ky6ZBV/psXDPJQlH8j3Twx9kCoSZm2YoHlZkFVdpIOR?=
 =?us-ascii?Q?XFwz0LTqy1YvxfJ3fZwIHZyS+GO91DPv9oOxZUTzFY78YdfPbkj3AvWfhTHz?=
 =?us-ascii?Q?BTc20NNlUaMLwJURpPQKGhkIMrHMds4hEvaxMqzeztVKBWYMlPdfRQQp0tas?=
 =?us-ascii?Q?eNSAVZhdU74Xj8mX+IfykghFSAwhekkRNVLX18pqOm3klvpaD7TeEOLo0Vu3?=
 =?us-ascii?Q?HvvphLzxRpsvO2mP/ar6EnEEIn7fJfrtRTkIK+T5VX06/0eMY80hWbNb0IDC?=
 =?us-ascii?Q?D1XhXPbkUEhjHZG9uMSeaKhnEBI3qXxpd7Di1tI01CqEUS7+rrTT7wOOsfxp?=
 =?us-ascii?Q?rNK4K30kRBVxOPVKdqTCrjciTeQsE/1ree7ymhOEbQ0egey5Z/mly5hSP0fw?=
 =?us-ascii?Q?WoT4ixOyMMzF82FJ5MTSSAks2EVQ3V5uCnUdrPGXA0+xfBdj6ZybniOEJ+Bk?=
 =?us-ascii?Q?XAi+tgF3dVSZ9Nts4jQbrX7+TmCazJB0rwYbk4KJz11ChSnDulbATBaNXoL7?=
 =?us-ascii?Q?1l7GSjN+zvM+WzdZ4YHU/NhbwCBSJ8QJZTDVqpzHb9sLzJ2gU3quRTYD0G0w?=
 =?us-ascii?Q?H8ChAVinEkOuLhVrXKnX8d9E/nEHjBFrE4x9m3w8EjiPU6MUVWWDQPXnJNAl?=
 =?us-ascii?Q?6jqNs48HGjuvN5Ag/Jwq4b7cgi5UB28dKr6CB5p0xYKlqDc+k4M/bSzOFieL?=
 =?us-ascii?Q?1inuZaLlopjp8tU1aUoSm4ljUmd908OyIXj9nvtZKjV1BEXQmNnVUO36JDUC?=
 =?us-ascii?Q?DTc7dAN29kqib41P4YsCoojyfHcNP9w/9USuNjZTXMgGl7lcjFVbCShN/9RN?=
 =?us-ascii?Q?qs7cLrPnB6vR8TROsyFes1Y0HtznTxo1YITxAUr/X3rXtA+g9N42xY1GSIF7?=
 =?us-ascii?Q?9Hbp0NoRcdJC/njEy/rbiP1L1WtRIFr/ZquMJbP+a6uATZDDXIMdAeVNlR8s?=
 =?us-ascii?Q?6dlKA6RF/+8I7kzr8YFGF56q70eTbvHz0hkVlFwmN4aaf6TY78/AYm7O48io?=
 =?us-ascii?Q?JnT3eUIIGdh5yLsmfuOS87alvDfQSLZu1BY5Kj0RtuLSYO0XDPsJV89SKXob?=
 =?us-ascii?Q?Q0zIcRBITMCi42Hc/CtqzrIpQUXU2N9gcv5REjur9O4fTmrtcYR0ifvldO3+?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afb4c0b2-63eb-4897-484a-08dc92173236
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 17:25:50.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrh2j4ixOK8YI7gaEF7CHGzH0iEm8DErgJfiMGrfQKcq4o462PA4P4wM5qbfQ7xm5q2G2ycenbi4GRn+2TnBzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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

On Fri, Jun 21, 2024 at 03:37:24PM +0100, Matthew Auld wrote:
> Hi,
> 
> On 18/06/2024 18:15, Matthew Brost wrote:
> > Update PT layer so if a memory allocation for a PTE fails the error can
> > be propagated to the user without requiring to be killed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 208 ++++++++++++++++++++++++++++---------
> >   1 file changed, 160 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index d6ce531f0fcd..b46b95531c2a 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -846,19 +846,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
> >   	}
> >   }
> > -static void xe_pt_abort_bind(struct xe_vma *vma,
> > -			     struct xe_vm_pgtable_update *entries,
> > -			     u32 num_entries)
> > +static void xe_pt_cancel_bind(struct xe_vma *vma,
> > +			      struct xe_vm_pgtable_update *entries,
> > +			      u32 num_entries)
> >   {
> >   	u32 i, j;
> >   	for (i = 0; i < num_entries; i++) {
> > -		if (!entries[i].pt_entries)
> > +		struct xe_pt *pt = entries[i].pt;
> > +
> > +		if (!pt)
> >   			continue;
> > -		for (j = 0; j < entries[i].qwords; j++)
> > -			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
> > +		if (pt->level) {
> > +			for (j = 0; j < entries[i].qwords; j++)
> > +				xe_pt_destroy(entries[i].pt_entries[j].pt,
> > +					      xe_vma_vm(vma)->flags, NULL);
> > +		}
> > +
> >   		kfree(entries[i].pt_entries);
> > +		entries[i].pt_entries = NULL;
> > +		entries[i].qwords = 0;
> >   	}
> >   }
> > @@ -874,10 +882,61 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   	xe_vm_assert_held(vm);
> >   }
> > -static void xe_pt_commit_bind(struct xe_vma *vma,
> > -			      struct xe_vm_pgtable_update *entries,
> > -			      u32 num_entries, bool rebind,
> > -			      struct llist_head *deferred)
> > +static void xe_pt_commit(struct xe_vma *vma,
> > +			 struct xe_vm_pgtable_update *entries,
> > +			 u32 num_entries, struct llist_head *deferred)
> > +{
> > +	u32 i, j;
> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (i = 0; i < num_entries; i++) {
> > +		struct xe_pt *pt = entries[i].pt;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		for (j = 0; j < entries[i].qwords; j++) {
> > +			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> > +
> > +			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
> > +		}
> > +	}
> > +}
> > +
> > +static void xe_pt_abort_bind(struct xe_vma *vma,
> > +			     struct xe_vm_pgtable_update *entries,
> > +			     u32 num_entries, bool rebind)
> > +{
> > +	int i, j;
> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (i = num_entries - 1; i >= 0; --i) {
> > +		struct xe_pt *pt = entries[i].pt;
> > +		struct xe_pt_dir *pt_dir;
> > +
> > +		if (!rebind)
> > +			pt->num_live -= entries[i].qwords;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		pt_dir = as_xe_pt_dir(pt);
> > +		for (j = 0; j < entries[i].qwords; j++) {
> > +			u32 j_ = j + entries[i].ofs;
> > +			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
> > +			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> > +
> > +			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
> > +			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
> > +		}
> > +	}
> > +}
> > +
> > +static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
> > +				      struct xe_vm_pgtable_update *entries,
> > +				      u32 num_entries, bool rebind)
> >   {
> >   	u32 i, j;
> > @@ -897,12 +956,13 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> >   		for (j = 0; j < entries[i].qwords; j++) {
> >   			u32 j_ = j + entries[i].ofs;
> >   			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
> > +			struct xe_pt *oldpte = NULL;
> >   			if (xe_pt_entry(pt_dir, j_))
> > -				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
> > -					      xe_vma_vm(vma)->flags, deferred);
> > +				oldpte = xe_pt_entry(pt_dir, j_);
> >   			pt_dir->children[j_] = &newpte->base;
> > +			entries[i].pt_entries[j].pt = oldpte;
> >   		}
> >   	}
> >   }
> > @@ -926,8 +986,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> >   	if (!err)
> >   		xe_tile_assert(tile, *num_entries);
> > -	else /* abort! */
> > -		xe_pt_abort_bind(vma, entries, *num_entries);
> >   	return err;
> >   }
> > @@ -1449,7 +1507,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
> >   				     &end_offset))
> >   		return 0;
> > -	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
> > +	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
> >   	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
> >   	return 0;
> > @@ -1517,32 +1575,57 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
> >   		memset64(ptr, empty, num_qwords);
> >   }
> > +static void xe_pt_abort_unbind(struct xe_vma *vma,
> > +			       struct xe_vm_pgtable_update *entries,
> > +			       u32 num_entries)
> > +{
> > +	int j, i;
> > +
> > +	xe_pt_commit_locks_assert(vma);
> > +
> > +	for (j = num_entries - 1; j >= 0; --j) {
> > +		struct xe_vm_pgtable_update *entry = &entries[j];
> > +		struct xe_pt *pt = entry->pt;
> > +		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > +
> > +		pt->num_live += entry->qwords;
> > +
> > +		if (!pt->level)
> > +			continue;
> > +
> > +		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++)
> > +			pt_dir->children[i] =
> > +				entries[j].pt_entries[i - entry->ofs].pt ?
> > +				&entries[j].pt_entries[i - entry->ofs].pt->base : 0;
> > +	}
> > +}
> > +
> >   static void
> > -xe_pt_commit_unbind(struct xe_vma *vma,
> > -		    struct xe_vm_pgtable_update *entries, u32 num_entries,
> > -		    struct llist_head *deferred)
> > +xe_pt_commit_prepare_unbind(struct xe_vma *vma,
> > +			    struct xe_vm_pgtable_update *entries,
> > +			    u32 num_entries)
> >   {
> > -	u32 j;
> > +	int j, i;
> >   	xe_pt_commit_locks_assert(vma);
> >   	for (j = 0; j < num_entries; ++j) {
> >   		struct xe_vm_pgtable_update *entry = &entries[j];
> >   		struct xe_pt *pt = entry->pt;
> > +		struct xe_pt_dir *pt_dir;
> >   		pt->num_live -= entry->qwords;
> > -		if (pt->level) {
> > -			struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > -			u32 i;
> > -
> > -			for (i = entry->ofs; i < entry->ofs + entry->qwords;
> > -			     i++) {
> > -				if (xe_pt_entry(pt_dir, i))
> > -					xe_pt_destroy(xe_pt_entry(pt_dir, i),
> > -						      xe_vma_vm(vma)->flags, deferred);
> > +		if (!pt->level)
> > +			continue;
> > -				pt_dir->children[i] = NULL;
> > -			}
> > +		pt_dir = as_xe_pt_dir(pt);
> > +		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++) {
> > +			if (xe_pt_entry(pt_dir, i))
> > +				entries[j].pt_entries[i - entry->ofs].pt =
> > +					xe_pt_entry(pt_dir, i);
> > +			else
> > +				entries[j].pt_entries[i - entry->ofs].pt = NULL;
> > +			pt_dir->children[i] = NULL;
> >   		}
> >   	}
> >   }
> > @@ -1588,7 +1671,6 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> >   {
> >   	u32 current_op = pt_update_ops->current_op;
> >   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > -	struct llist_head *deferred = &pt_update_ops->deferred;
> >   	int err;
> >   	xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -1637,11 +1719,12 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> >   			/* We bump also if batch_invalidate_tlb is true */
> >   			vm->tlb_flush_seqno++;
> > -		/* FIXME: Don't commit right away */
> >   		vma->tile_staged |= BIT(tile->id);
> >   		pt_op->vma = vma;
> > -		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
> > -				  pt_op->rebind, deferred);
> > +		xe_pt_commit_prepare_bind(vma, pt_op->entries,
> > +					  pt_op->num_entries, pt_op->rebind);
> > +	} else {
> > +		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
> >   	}
> >   	return err;
> > @@ -1653,7 +1736,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   {
> >   	u32 current_op = pt_update_ops->current_op;
> >   	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > -	struct llist_head *deferred = &pt_update_ops->deferred;
> >   	int err;
> >   	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
> > @@ -1689,9 +1771,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> >   	pt_update_ops->needs_invalidation = true;
> > -	/* FIXME: Don't commit right away */
> > -	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
> > -			    deferred);
> > +	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
> >   	return 0;
> >   }
> > @@ -1912,7 +1992,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	struct invalidation_fence *ifence = NULL;
> >   	struct xe_range_fence *rfence;
> >   	struct xe_vma_op *op;
> > -	int err = 0;
> > +	int err = 0, i;
> >   	struct xe_migrate_pt_update update = {
> >   		.ops = pt_update_ops->needs_userptr_lock ?
> >   			&userptr_migrate_ops :
> > @@ -1932,8 +2012,10 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	if (pt_update_ops->needs_invalidation) {
> >   		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -		if (!ifence)
> > -			return ERR_PTR(-ENOMEM);
> > +		if (!ifence) {
> > +			err = -ENOMEM;
> > +			goto kill_vm_tile1;
> > +		}
> >   	}
> >   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > @@ -1948,6 +2030,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   		goto free_rfence;
> >   	}
> > +	/* Point of no return - VM killed if failure after this */
> > +	for (i = 0; i < pt_update_ops->current_op; ++i) {
> > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > +
> > +		xe_pt_commit(pt_op->vma, pt_op->entries,
> > +			     pt_op->num_entries, &pt_update_ops->deferred);
> > +		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
> > +	}
> > +
> >   	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> >   				    &xe_range_fence_kfree_ops,
> >   				    pt_update_ops->start,
> > @@ -1983,10 +2074,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	if (pt_update_ops->needs_userptr_lock)
> >   		up_read(&vm->userptr.notifier_lock);
> >   	dma_fence_put(fence);
> > +	if (!tile->id)
> > +		xe_vm_kill(vops->vm, false);
> >   free_rfence:
> >   	kfree(rfence);
> >   free_ifence:
> >   	kfree(ifence);
> > +kill_vm_tile1:
> > +	if (err != -EAGAIN && tile->id)
> > +		xe_vm_kill(vops->vm, false);
> 
> It is OK to kill the vm here? The above one looks to only be reachable when
> past the point of no return, but not sure if that is always the case for
> this one, assuming multi-tile?
> 

It's not ideal to kill the VM, but this series represents a significant
improvement over the current state of the code. The failure occurs due
to multi-tile issues (i.e., a job might succeed on the first tile but
fail on the second tile). In practical terms, this situation arises only
if a job's malloc fails.

In the long term, we should eliminate this failure point by implementing
CPU binds [1]. This approach will allow us to use single a job across
both tiles, thus eliminating failure point described above.

Additionally, there's a failure point if invalidation_fence_init returns
an error. However, I doubt this function can actually fail because the
potential failure, dma_fence_add_callback, returns only -ENOENT, which
is handled within the function. Perhaps I should modify
invalidation_fence_init to return void, thereby eliminating this
potential failure point. Furthermore, within invalidation_fence_init, we
assert that an error is raised if -ENOENT is not returned.

For now, I propose refactoring invalidation_fence_init as mentioned
earlier and accepting the current use of kill in the code. Our plan is
to remove the kill once we transition to CPU binds. Does this approach
sound reasonable?

Matt

[1] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5

> >   	return ERR_PTR(err);
> >   }
> > @@ -2007,12 +2103,10 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	lockdep_assert_held(&vops->vm->lock);
> >   	xe_vm_assert_held(vops->vm);
> > -	/* FIXME: Not 100% correct */
> > -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +	for (i = 0; i < pt_update_ops->current_op; ++i) {
> >   		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > -		if (pt_op->bind)
> > -			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> > +		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> >   	}
> >   	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> >   }
> > @@ -2026,10 +2120,28 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> >    */
> >   void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   {
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&vops->pt_update_ops[tile->id];
> > +	int i;
> > +
> >   	lockdep_assert_held(&vops->vm->lock);
> >   	xe_vm_assert_held(vops->vm);
> > -	/* FIXME: Just kill VM for now + cleanup PTs */
> > +	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
> > +		struct xe_vm_pgtable_update_op *pt_op =
> > +			&pt_update_ops->ops[i];
> > +
> > +		if (!pt_op->vma || i >= pt_update_ops->current_op)
> > +			continue;
> > +
> > +		if (pt_op->bind)
> > +			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
> > +					 pt_op->num_entries,
> > +					 pt_op->rebind);
> > +		else
> > +			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
> > +					   pt_op->num_entries);
> > +	}
> > +
> >   	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> > -	xe_vm_kill(vops->vm, false);
> > - }
> > +}
