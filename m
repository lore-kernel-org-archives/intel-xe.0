Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE4BC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 22:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2F10E2D1;
	Tue, 25 Jun 2024 22:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NehhxplQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB9E10E2D1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 22:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352976; x=1750888976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ky2a/KXywBbRtByNbzwXcu13IZf1Iy6+P+HGC29P92I=;
 b=NehhxplQoqzZnEr38mvznEsjCf96/hC30FRMObKI/OdztfOlz7u6Vzdg
 YntyQjZEzoJ3HsIIDsoMNxnF1YscsQEelpLQqEcTUDMba6vzkPt9dUTnV
 GanYEM6SskT7AawL6MS6VAr/Cv5Ky21asFWl0Yo5RA4clPqltL8P1bLQH
 r1UfGM9siagwNuEYOwSfBho7/Ao3IKZUh9evlv7EinOHpm2iifyPTyc3A
 600/zsOou0RFBy1ecqUDadMxF8G3ofKIhFOn0oYC94VAlnBLHWF1MpnY1
 lm99ctWxOnk1HRmVxsjFioRb4cKBnS4xKpcHiJ/O1iIvYbl3jevV6P1Tx g==;
X-CSE-ConnectionGUID: V+pd/xZxSPWwnbZy/N/OSw==
X-CSE-MsgGUID: MJu1eUbPTM2R1t0+RW6xYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33854524"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="33854524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 15:02:56 -0700
X-CSE-ConnectionGUID: ZZF0xGEBSN6GL6ZKZ9o2oQ==
X-CSE-MsgGUID: MbW1ZwWoS1a8IcS8DlikjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48371308"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 15:02:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 15:02:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 15:02:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 15:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6jGYEZ+VsIrZRZdDCskpW3s376yf6U/9mkx0amcCfpNBe0LTfXla2c2lJfB8o4/d+TPuDvzOqcnIqUSiQRDKIT308oV9j1t/H48NzsyYI3RaXsJp5fPaIGpYUgG3OvQRhk74mmhukntbFudU7N40HtRJxXWnIBCnKwROPQyN5P5PHJJ9sxks2kIIucjPftBWbukszJDB/6ZJwABc+nLMa1wyROZTE1fxkpspSvp2v4QBF7gc2a14//5k6R1fSPXdX6FjEaFH6PPJRMQgMmuUmNeIM+qxqnR/6liT1n/AMS3LPKZyUP+rYTChjLX0mzIvkxuNN1AOaSwU9L7wsa/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mz9neXe1KIILQxnELx/BUW7gZ58XJDmYmOEb6ar1ng=;
 b=OTbadCUJNUoEGO2CKuLUFdXScGtlPu93tmeULyqTvbvOLmcM+zhjoYo13/YZ/D3VtHKMFV1yXFCW4nkgfkw74+zmwtv6UkAKLmINFqS2fzsi2bPrLlBVRJz6hm000eNluJwUksOEykNQRTblW7fN09QN4q5ftjut365Sk+2+dWrGd79Q6w1Na50KgZlb2GwmEqLCtkr6dMW1WpjkFX1yTZQJivf3Xki6MRaadA1IK7GEbS77BEsCnUGrA0GeBsxpB3ahAXA6MG9alKjX1U7QrPzawdRsSC2PhjFvbrof828YnkgiOA/jq62/IzqIXT3cWAdBCEZoMyK1yG55gz/Jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Tue, 25 Jun
 2024 22:02:53 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 22:02:53 +0000
Date: Tue, 25 Jun 2024 22:02:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/oa: Allow preemption to be disabled on the
 stream exec queue
Message-ID: <Zns+ZU0GFxKYxiFI@DUT025-TGLU.fm.intel.com>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-4-ashutosh.dixit@intel.com>
 <Zns8yGvoUSSLpZQe@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zns8yGvoUSSLpZQe@orsosgc001>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9fb41a-dee8-41f1-25d7-08dc95628f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DvNxpzYUDASDUshNopTk3UrKe9VLHNakxgnl3yg96wLw/u0o21seNOFk+Z3O?=
 =?us-ascii?Q?Fov+hH/i7b7ct9Ze7oT/1Vrr79gz7BJhtPXwkFFH6bSI3tX30DXl11yC/D46?=
 =?us-ascii?Q?oijkVKsvXU4H6p45A5JjOXqrKje4NbZDeUsZApazF0Gb6b2FL+tXj672hff1?=
 =?us-ascii?Q?gLbHr6EFPygNCuR/AmXRGJEF2kdDhmhS8nqb8N5vM90Dv39DpNQoLUBLkeHz?=
 =?us-ascii?Q?dLofcIcaDZMAOqhMNufVoMR+hsCvntk3ILAcKSMxLvKyMQhqGfS2ZYRsGs0M?=
 =?us-ascii?Q?0qDtgD8OftVCL8e3P0SlA4+44UecRMgRarhsz9S5zxglqKilDAhB3Wk/7QHL?=
 =?us-ascii?Q?IYMLzNWKmTRtEfQHrW7Fkyhn90VJl3HV7bBAGsww7QZMWHZKQ2k0yWyTnPQ+?=
 =?us-ascii?Q?8sMOChnv/ZB05feaaNlrwpTqyR8YQP7uhbkLChRiJ2tGLTDr2tflT+mIYAUG?=
 =?us-ascii?Q?KSwIohCY/wbYs3RsVqRUrQ3w52uYI0iUGen4B9qe0OM0J/gIiORlOc3JdW/2?=
 =?us-ascii?Q?fpy7Sk/+CqKeE7LivwFelfbBNm/Ez5Fq6D0mCc1yZGdq8pyknN6i2J9v5QKl?=
 =?us-ascii?Q?AzdXwe8mm6B4rh21hk91SEOdQluc7PkMneFRMiw+My/bsqm6zLqyu7TKxYXw?=
 =?us-ascii?Q?rdmPbeS8A0CybWunMW/FhS8wfXqGVxWRrCCwHNh2bokvZQyDgIh8H7Sww4fA?=
 =?us-ascii?Q?0VsRJ+/gPcDctheMJCJ9kfPAcN9HGLupuzHpUn2nn7vgSf+6cmLnnMDJpctJ?=
 =?us-ascii?Q?cQxs3YHLAn+HrO3xqYFysfqAUAg4WjBo+b9fBBuIqaSV7q/JxILv6WFMrXrb?=
 =?us-ascii?Q?oOgkXWZb7A+Gx+Ye5Q1UEAvlOZ89NXygrHH1Dk4kvnf98ic+wlXaTg+H98Gz?=
 =?us-ascii?Q?eel3B1tcXtiKid1gf/MX2dLb3Krm4MUBZbvU431JXqnYWsYDx3DDLD4GL9Cy?=
 =?us-ascii?Q?V2qksUfUy+xTtidLul77IrzkqoD+9NEs+INF3EEMbSAvGmk2giJT6BP4syq1?=
 =?us-ascii?Q?uRRD70Lbjm7XmnhF/2BW4bgaVmj7JytBbMG8mQ6K7t9NOz1WTLQrbhkPGxKg?=
 =?us-ascii?Q?BhE09XouWJzedP69VNrImmUKry7MCL1N345dsC5QxVYsjBggwoEx7iXO+cum?=
 =?us-ascii?Q?Cl/yPzYx0YFFh+Y09schyxtKp0AwJSsF2QLvfzRMARoOsIajkDFdSDVmvbcN?=
 =?us-ascii?Q?Ulp+kLHA0q7LL4SsDh+7862daELxPom1DMuiFIBt1VIuSG45vT20mMQwn5eU?=
 =?us-ascii?Q?y/0CWvZJbfDULhubloxQqywpkBNkHWK/Pimsipml1gS6ezCrH8SrqpM2btSr?=
 =?us-ascii?Q?Yn6IPKTXlQGiiBHJGVpLu7sv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cV63GHCMhZGLwr46ZkkR8N5821AZ21ztPDBemg278WP35jRyK+g6I1pEO9yH?=
 =?us-ascii?Q?F6HCEi8pFLKRX6/C77p60xUqWd/fiS79UkN9omrqZA/iMvn180rDho+FhJIz?=
 =?us-ascii?Q?jkUnEKRJw3wg3+9pIyL1Lcz8q80roj184qfb9NUNVW8I+kTu4uAdXdXpIP5Y?=
 =?us-ascii?Q?b+Wjg9L+AcniIJH0j8Vlqa1hVLNr92sJjpGprJ8QS5EU1U1coee0gGAs8bWW?=
 =?us-ascii?Q?kq82kQfhoUUQKEWIameOeHaUqkjqvrWOgWqCZfjmTJxcgFz9/adlHV+kYJcV?=
 =?us-ascii?Q?2d4uO/0b5fObvrp0q3mzXDArqUE2BGTduKkkSY9Mgx0zdat76NBAh7m9ocyo?=
 =?us-ascii?Q?suW+1rvFvDHm8bOMuyrJFlutry6J4XszDvrxOgj8Z43bFYVJ1EmY4nd07qbj?=
 =?us-ascii?Q?m25qGoAQIobsvkqllceYOnkIYsy6nWF2oKTNHCcoQXGk2v1ckMnJwMrvjI30?=
 =?us-ascii?Q?kQzVpCHzMGlFKuP1yDjcemBC6LsOs7o91SS7bfSs3MNYZRUgA7wwcmIK4vzx?=
 =?us-ascii?Q?81xaNrI0e61CWAHHp5LYih/fNvMaaFoBLM/1Tp5ZLr6lTIspBF81SlOTp8UL?=
 =?us-ascii?Q?JOJiPzJ9EtXjt4H+XLe++GGpk2YN42WJousBQvwdRcYl4JoKcH1oUwg28eDy?=
 =?us-ascii?Q?JI9YCI2K1k/zvXMyAV+ng7aHe428Gz3JZXjRufEevKDxaFF6lgtw3yU6UGE5?=
 =?us-ascii?Q?ma5EIyhP/ZF2tEjjPUwFGd2kyUgbtffRDOQwmus4CLk9bhpoIJDV7s/oSjzi?=
 =?us-ascii?Q?b1TZqF8v/7WQz1Bfl+C6KdVfMN2meOFfXFtehbdS8TOexkcGB7YpyM/nlb/6?=
 =?us-ascii?Q?rN8qUvGaokLEAi/5Z6+QWkgfgFXXSGr7PEaJkcWy0rn3yY+TBO5FKqgwPaK2?=
 =?us-ascii?Q?E8bXZ6HdX/o+OMJqC0BIZ/n0Nh43S28nsiU9ckcIaWFI4fr8wUKpC8bo1YMc?=
 =?us-ascii?Q?oye6FQwGqdoJs3OM2UU4OdZbH52Aa24VcPP52el95StBOWUs0YlBmy8Hcemb?=
 =?us-ascii?Q?MGBNHmSJ3fUwdXJWcJ1iKtPipG+UF3yE4i/BC2Q03HyhwT0rAy4zAViA1XbK?=
 =?us-ascii?Q?Xe2C8nvF8IMaHsXpU3wNO0fRWqKghsLkETnvQ/GywSLnkt9xqqbLrqueXeVS?=
 =?us-ascii?Q?Jd4r3j9xWXiI0RDlfoN99+WhSfPEM1RkeEhCXtzo2tN4bdxkPBrIIYEhOU7u?=
 =?us-ascii?Q?49Lq7GWiY2jEY2+AY4tNLW9nXxi1yTgRovKAuxs7Un7GJTx7PB3Ah3x+LKjw?=
 =?us-ascii?Q?cxRI9B/zHfFFkOgEto6u04VSFgPIZRyFLKJZmzVkk2BUjm9OyL5ssZ4GvMG5?=
 =?us-ascii?Q?eNBXs+pg7lAZrPQhIjRfpW9c9/H0JkbiEC5VmYGoLHNM0qon7AI+bRWfugJB?=
 =?us-ascii?Q?nurdUmQYLmRsYIDZwRBN1ruYZGlx0YXpaGGbZqSsx1zJI3ImKe2gzNWkNcox?=
 =?us-ascii?Q?WAMshPqkEG/yLdW4TT9s8iRsCSGPTGsjKEww1FuF9iLKhp5rTWRmVHaJUP5q?=
 =?us-ascii?Q?NB0vj7bD8joLWCakD5DBZFTpQ3Ax5W1FsjLhnAxF2pEHn6Gv2Mx9K1Mawtae?=
 =?us-ascii?Q?QY2dyc6fRFpsw+XyPpMYN590/5g0gxN37kLY1+mgaftcUnalP1BtxL5YR0GK?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9fb41a-dee8-41f1-25d7-08dc95628f4e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 22:02:53.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IE8We94sw2+Yv5FBHimxmbnSUE3kdbqXWR56PS7rZZ7WiM0sd7pftDJDyj/5dxLiJvgu+216uVV+U14XcHwZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
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

On Tue, Jun 25, 2024 at 02:55:20PM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Jun 25, 2024 at 01:15:18PM -0700, Ashutosh Dixit wrote:
> > Mesa VK_KHR_performance_query use case requires preemption to be disabled
> > for the stream exec queue. Implement this functionality here based on the
> > new set_no_preempt and clear_no_preempt exec queue ops.
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> lgtm
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 

This patch should be adjusted based Umesh's and my feedback in patch #2.

Matt

> > ---
> > drivers/gpu/drm/xe/xe_oa.c       | 33 +++++++++++++++++++++++++++++++-
> > drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
> > include/uapi/drm/xe_drm.h        |  6 ++++++
> > 3 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index a68659fd5386..6453c36c4539 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -80,6 +80,7 @@ struct xe_oa_open_param {
> > 	int engine_instance;
> > 	struct xe_exec_queue *exec_q;
> > 	struct xe_hw_engine *hwe;
> > +	bool no_preempt;
> > };
> > 
> > struct xe_oa_config_bo {
> > @@ -1018,6 +1019,13 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
> > 	if (stream->enabled)
> > 		return 0;
> > 
> > +	if (stream->no_preempt) {
> > +		int ret = stream->exec_q->ops->set_no_preempt(stream->exec_q);
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > 	xe_oa_stream_enable(stream);
> > 
> > 	stream->enabled = true;
> > @@ -1026,13 +1034,18 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
> > 
> > static int xe_oa_disable_locked(struct xe_oa_stream *stream)
> > {
> > +	int ret = 0;
> > +
> > 	if (!stream->enabled)
> > 		return 0;
> > 
> > 	xe_oa_stream_disable(stream);
> > 
> > +	if (stream->no_preempt)
> > +		ret = stream->exec_q->ops->clear_no_preempt(stream->exec_q);
> > +
> > 	stream->enabled = false;
> > -	return 0;
> > +	return ret;
> > }
> > 
> > static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
> > @@ -1307,6 +1320,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> > 	stream->sample = param->sample;
> > 	stream->periodic = param->period_exponent > 0;
> > 	stream->period_exponent = param->period_exponent;
> > +	stream->no_preempt = param->no_preempt;
> > 
> > 	/*
> > 	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
> > @@ -1651,6 +1665,13 @@ static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> > 	return 0;
> > }
> > 
> > +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> > +				struct xe_oa_open_param *param)
> > +{
> > +	param->no_preempt = value;
> > +	return 0;
> > +}
> > +
> > typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> > 				     struct xe_oa_open_param *param);
> > static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> > @@ -1662,6 +1683,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> > 	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
> > 	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
> > 	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
> > +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
> > };
> > 
> > static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> > @@ -1766,6 +1788,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> > 	if (param.exec_q && !param.sample)
> > 		privileged_op = false;
> > 
> > +	if (param.no_preempt) {
> > +		if (!param.exec_q) {
> > +			drm_dbg(&oa->xe->drm, "Preemption disable without exec_q!\n");
> > +			ret = -EINVAL;
> > +			goto err_exec_q;
> > +		}
> > +		privileged_op = true;
> > +	}
> > +
> > 	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> > 		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> > 		ret = -EACCES;
> > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> > index 706d45577dae..540c3ec53a6d 100644
> > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > @@ -235,5 +235,8 @@ struct xe_oa_stream {
> > 
> > 	/** @oa_status: temporary storage for oa_status register value */
> > 	u32 oa_status;
> > +
> > +	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
> > +	u32 no_preempt;
> > };
> > #endif
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b410553faa9b..12eaa8532b5c 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
> > 	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> > 	 */
> > 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> > +
> > +	/**
> > +	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and timeslicing
> > +	 * to be disabled for the stream exec queue.
> > +	 */
> > +	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> > };
> > 
> > /**
> > -- 
> > 2.41.0
> > 
