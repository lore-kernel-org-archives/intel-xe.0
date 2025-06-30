Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C42C83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6834A10E121;
	Mon, 30 Jun 2025 22:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNMy2fX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA0310E121
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751321661; x=1782857661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TiD46TbfG1ulyWQpFTmGgvbmo9NjJjK2pnNcFNS6eOc=;
 b=jNMy2fX9lz6a3W1SIMx1QUADZOV7+ljaZOLvnSC/GCO1JDc5NBjp7iBP
 VLzhLSUlLjgVV7WAbORto1G4XR42vwZMzk4HAPVGaIy+fb93LFZfc5p1E
 3Nf21rHRXp6KWGi5Bnlc5Q2hEY/iQJet/m+/xIp9W8OjrRTVTj8HEMBOf
 9cxZaRoSUcmDsAPImoUJ6JCXUF7gO3oxO28vWyOdDGtWHMozgCi/N4CvE
 c0YAqcGtGPZSb80gHIqyXTD8xzmaOipvKh3trYWHIPg81m8P6/7tnZmib
 T4tmX8HbrCbr5APXpZ4HiTUB0g+fZF4GNh7n1xRZ5n0l+s9bFTfeaayRs Q==;
X-CSE-ConnectionGUID: 3iiBgTh3Sui1frzpzI7auQ==
X-CSE-MsgGUID: GvY4acbqQhSHo5bC2+crFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53707699"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53707699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:14:21 -0700
X-CSE-ConnectionGUID: W3OuWBfdRZGeiapQtm4pqQ==
X-CSE-MsgGUID: l/u+xFNuSjWiL+swbyhwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="154109355"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:14:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:14:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:14:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IapFw0hwbxyZQHgu1spiiL7jpmzcaQ/RI31IZkXcsyTIrI91ySkJ8rrhRUOx8m9rYVKeXzFuQbZE2avLZqSa5vieLqCVCa308LlATbQCJkaFezkD7kLWfIj5KOFxPmcpGIxZl0WzGSh4nAL9LX8WfVQ9V4cb6YXRt+o+8kQwjBI3KtdR6sZeako878W0XBCVetQf6UYA2lX0SvOyHkLCTkseAjl/+NAUJ4c3Km1ixh5uhAFmqyO87Ud6ZzNaoslIDJZ6d27cfMdaoz+P5ClYxcM2gml5d6cKSIN2ppnRTlMrD4erWvaTsKOgWJZvAXUTcc1Q7nssVa4A7OTyqmZdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVUQ7JoYr6EsASQ/S2hrLqWVQoD6BBKUvAcFXba1w0M=;
 b=MkCEiBAqGGd1jxYwYifMaGGAteeJhp9YSa/zyA6WeZmerXd9NQL1lm7SpNSxdrFCGXbdxwPvSu78W4QVrZIpC04tjVkF4BhhKBnPacHBgMz73mPAab58/+fJH+JTuFu+hnRHlTlnDOvlFi81gnNEAo0iizD24WvF+7bI5RiNgTs2I+Yg5eyRC6E8xdjFjE6koYSjN+SKC8r091B6xGWHl+nuqpiBw0NWULkb45NopmEO9QaTqCD9E9fFjsJKMmFKBV3GLMvIFoFVxnjsQWqWPFbQdbhh2Futbh5brC2itSDotCREgDZUWHIgs4wJEKieIpWPMqz4mHMt9Vb9T+7ilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF4B53DB4B3.namprd11.prod.outlook.com (2603:10b6:518:1::d1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 22:14:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 22:14:04 +0000
Date: Mon, 30 Jun 2025 15:14:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe/xe_query: Use separate iterator while
 filling GT list
Message-ID: <20250630221402.GB1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-14-matthew.d.roper@intel.com>
 <CH0PR11MB5444F82FB885D480A0C5E9B6E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444F82FB885D480A0C5E9B6E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF4B53DB4B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fe862d-95c1-4d48-dc3e-08ddb8236cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kGYxYsqDEgPpm8iECs36ybOOZn1PzVwLDNNiCMD3iyFp6nyq5newDQjUbcIN?=
 =?us-ascii?Q?JbXbk+ALzy/kPZt+7x9teNeUzEn3DURudlCl3Ylvc+sck0Ztgbosj13JJpML?=
 =?us-ascii?Q?LV44RK/gs+1BTbLTTVuG+sgi40YB8H3m0FfbEJGNetjCqOfBE7jgyr+CDPvF?=
 =?us-ascii?Q?R9SVGid23lRG66sWOdKzeJEMM3d5rBaxmpb/VjD5YNOfj8aQxdDQCSzJgyYU?=
 =?us-ascii?Q?H7f+wPU8SWorqA8fMw3x6YB6Xe893zZsIn0n7+y2FYR5MfZhdqC9kvDKxolx?=
 =?us-ascii?Q?nKZQMdcm3Hif9bTR50+wWKhjJ2KOc21lYgqqsquCBcrciq/fVfC1AKG8KMjI?=
 =?us-ascii?Q?BGjUz8/2OvDuVi9Ifk0JQ8UM52B5lHWRQy3HU3uQeksZJ/vjyg4mA7mQBeMh?=
 =?us-ascii?Q?OBplt/gzdcm6SIOhjMcncCd2MUXiAXqqYvEnwUXTl2UdIcL2+akTm7Bsyk1i?=
 =?us-ascii?Q?LR6q6uaoRg4VHVD8CNEqRqeRniD1amyDZBAq2Jf+D6L0If6zuiDpa7qDpWFA?=
 =?us-ascii?Q?qp9sMvr2GhcW/sCEsVxly9/rOQJMYv4qVt11haOjqSDl5F01xhRINmUeFpCz?=
 =?us-ascii?Q?+WSGPYc35OgepK/6A7C34KvlabhDnmU7G+0wC60m2S+T8XMyTIoz0wxotuDn?=
 =?us-ascii?Q?YmGaIKbeErCTr8PXsbsI8krwm5ldfK/vfqRv7G26ucDsiqpbD7XKwPepjnmj?=
 =?us-ascii?Q?MRFwO1kILRrfco7xNkXWtg3lfeYVVwjisQCNchZeWGPbHO/vav5bJZS1Y1FW?=
 =?us-ascii?Q?Us5X5+in2LEh2/xx99OwBhNuzXjQDn9TtTd+3v4pyiViE+TYirSPbIPjGRjt?=
 =?us-ascii?Q?uWiY5jZJTTFTTpF2lxLKzS7DBBIzuszHOXyALDcxmfG1V1AKmjFCNL/YLkK+?=
 =?us-ascii?Q?274bAtcEPfEL2fvTLHDKJMM7X2aBDnEV6TDEnoGvQCL9qhxJXQfDlTwrE6ru?=
 =?us-ascii?Q?oXhkUWLEIlrMgIPdWaJ6Cd3iWsGA/q1dF091p7/6eHPUVZuIGCZ7gVfEkuHy?=
 =?us-ascii?Q?F263TevkotMa8bN1nK17mX+c9twYUisBvVKIdXM/6dC9vHn+JG342RiBWdEy?=
 =?us-ascii?Q?4L6WSTL2bn7AKd1GF2Es7RaZEKLrLoOyV+1mIPRD5FhkM0rNEpJlvx+WsBQ+?=
 =?us-ascii?Q?YiTnwVtpKlXy1pvIcYjOb+sI4a86QPsq+tjdCHrx3/vdZ3T8hTan+jigV93+?=
 =?us-ascii?Q?3Vk028CpXluYzvU7EMJKArWTrdmbQ1crmTvYa/Lyv7JZEiP7JeOHbu8bYB5g?=
 =?us-ascii?Q?FC3RJ/xTA191iokfKAcTFPOsPwT82icRGQlrIKZRtjylHU2FY0ztcs8KvXQ5?=
 =?us-ascii?Q?1+i2H8XLCiSS3urG65FgsS/YYBOYECNxEfk43dPYkTd8UddqAbOFQs0KmJxB?=
 =?us-ascii?Q?I7/aXB5WnDaxgS/qbM7UGmdvcw3nqR/ZOQGKS4/jd72eolkB/pt0FZfXMHxw?=
 =?us-ascii?Q?e9CeUIvSmYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZqDgG1+wRx6ZW/dPO/ir1bguq//TmypJdvIUHQY3EJwU66OCrMlxFodFYN61?=
 =?us-ascii?Q?GAoiSyAbe2xdZg/dgQDoN+fgjXJIOfIy/qXwwR0u51Mi2HhfcV25aXpHrW32?=
 =?us-ascii?Q?kDlmIawdcbmOZd3mN+MPl4dwR78siNub830APUiR7r1RIJSN7HNV4I6xClaC?=
 =?us-ascii?Q?FICvlmMzQAqvrPzt1BAMCo7faj2v9ykFrv8fKL8xFNgY9qOqqpaDfq+sZNTQ?=
 =?us-ascii?Q?ZEOw7e3l0xaSouvqMfp5vWPeBsZmHm8q26vQCtaQ1/hSLjpNJUoX4IuqFlbQ?=
 =?us-ascii?Q?dTpm8xHS+RJAarpbxzRx5S/pKJsUP1/FOduvmsthsw5lPgQfJxM1/PabtwVG?=
 =?us-ascii?Q?5JgvLtQ1HZtmSLrL6RhY+nkSe86ohxgGbb3RhZCtWy9+V/ZoFFHDJIY39uPA?=
 =?us-ascii?Q?I5wAwLMR+mRVnN/olxgsETiLJ5BzNWVHbCIrPrNAl2DDumAgaP0LKAdNWt80?=
 =?us-ascii?Q?NCdM/2UJQBZGfWxVUoZUJoX+2zwnvWX8VGdPd5kDyg3Ue9FU/anXIHo/JvfI?=
 =?us-ascii?Q?IIwSaVOM4cdT5/M1NsyzqGjOQpQaU/p0Ddab0gjygvI0iqnejG6LGmyqQAQe?=
 =?us-ascii?Q?FfbdOkdQ5u9ULaYniZGaBKnVdEEH9A6kFMLPEIKqs5g2LoVupj6+jILUdK7z?=
 =?us-ascii?Q?A8TPZybYJZ5QOHseMmgQ1qo1QxD6oYtIXsb1tc9tbe/u08dt+5l+D/tURfgn?=
 =?us-ascii?Q?TxlnBjY+SI+HP3uOq3hbqWhOvy/I4+du4C+ayoloA905Gsh0nu5dq9spAMaD?=
 =?us-ascii?Q?Ph0Ew6WWmYycHuIxnJY9QmYi6QKC02wYbAFLfDrX0l9OfQrt4ywqU1NsfKmF?=
 =?us-ascii?Q?Nlo+7b7Gx082FoBFFtaNkML8IruQI+TsbaqzBqeH4t4Ae0U+jG8p5A37i+YA?=
 =?us-ascii?Q?S5EEZK3YLeodFw8urmLs06odAhZiF+E7MWAeqkCP4AKMxr2vlgHFnQFzm9ti?=
 =?us-ascii?Q?EHKy+j1nBnUWXx6bsAOgppaaksqbiKnuilGQdCoijgEko5OU6XNPXdyJR2RE?=
 =?us-ascii?Q?GA+HxnVQzvIqpn5m00q33HkJZQjrJ/jG31TtafFjzIQjWpmN0m3/sLCsKk2n?=
 =?us-ascii?Q?nv1gTMstVW4zuHY7buoGzvkJgCSmQpa0cPCwlszoVu1GydqbEGeZKYr0LrZe?=
 =?us-ascii?Q?RHBPyKLAOHO3F4SXeP281qVxB4/KUpgMG3hzWQjEmtqgvIp+DawfBxlByP4G?=
 =?us-ascii?Q?PXqGNdD3ny8BoZ33iQadbTw44FoXQxABgFyFz9lA2HNppNs965Ib6ZgZu13f?=
 =?us-ascii?Q?YV1WMbFAq4My/GcwFRYTSdU+u8TOJlQVJ7c+nwkW9TlEXrxSGnsOlcmLonbd?=
 =?us-ascii?Q?HShAeXHMcCK4N9CQOA/xwpl1DyivS+tU9Dyg/BA7NWR8JC1J9h8NCiSGC+KJ?=
 =?us-ascii?Q?ZedpPEM87p+Osg8LkDzLwqeyOQjxU9u++y4a4nGQElQm486VKPp9LAvfv/jM?=
 =?us-ascii?Q?yg91E6uSSBIA+IHpv5ieQFaSUK+1pgXDdy0WmlI7t30Xd1iYwtB8HcJb24S6?=
 =?us-ascii?Q?i2coyQZOCSqcUaVARDpYfsFMEpNRXsJNCXPWL6QvJd58uhbBI2n/ERIcUM41?=
 =?us-ascii?Q?YyeNWzGTT/N+xgJqlHVir92cGqdOZsWNe/erwBavOYvWLgiqNLqjo9RTVvwS?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fe862d-95c1-4d48-dc3e-08ddb8236cb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:14:04.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SuDrQeTq3jY7Dv3MMRiq2+bLoFU0/3akD941A3PcyncIQWz8UGSeDrBJpO9Yz8L0brEblhXrl8mM3HehP2FtpSsSP1+qqjsZ3FKput2nxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4B53DB4B3
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

On Mon, Jun 30, 2025 at 03:08:45PM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt Roper
> Sent: Monday, June 30, 2025 10:35 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v3 6/6] drm/xe/xe_query: Use separate iterator while filling GT list
> > 
> > The 'id' value updated by for_each_gt() is the uapi GT ID of the GTs
> > being iterated over, and may skip over values if a GT is not present on
> > the device.  Use a separate iterator for GT list array assignments to
> > ensure that the array will be filled properly on future platforms where
> > index in the GT query list may not match the uapi ID.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index e615b0916217..c3e0a22f09f0 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -368,6 +368,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  	struct drm_xe_query_gt_list __user *query_ptr =
> >  		u64_to_user_ptr(query->data);
> >  	struct drm_xe_query_gt_list *gt_list;
> > +	int iter = 0;
> 
> It doesn't look like iter is being updated below.  Is it expected to always be zero?
> -Jonathan Cavitt

No, looks like I forgot to 'git add' the final change of the patch; I'll
send an updated version shortly.


Matt

> 
> >  	u8 id;
> >  
> >  	if (query->size == 0) {
> > @@ -385,12 +386,12 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  
> >  	for_each_gt(gt, xe, id) {
> >  		if (xe_gt_is_media_type(gt))
> > -			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> > +			gt_list->gt_list[iter].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> >  		else
> > -			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > -		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
> > -		gt_list->gt_list[id].gt_id = gt->info.id;
> > -		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
> > +			gt_list->gt_list[iter].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > +		gt_list->gt_list[iter].tile_id = gt_to_tile(gt)->id;
> > +		gt_list->gt_list[iter].gt_id = gt->info.id;
> > +		gt_list->gt_list[iter].reference_clock = gt->info.reference_clock;
> >  		/*
> >  		 * The mem_regions indexes in the mask below need to
> >  		 * directly identify the struct
> > @@ -406,18 +407,18 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		 * assumption.
> >  		 */
> >  		if (!IS_DGFX(xe))
> > -			gt_list->gt_list[id].near_mem_regions = 0x1;
> > +			gt_list->gt_list[iter].near_mem_regions = 0x1;
> >  		else
> > -			gt_list->gt_list[id].near_mem_regions =
> > +			gt_list->gt_list[iter].near_mem_regions =
> >  				BIT(gt_to_tile(gt)->id) << 1;
> > -		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> > -			gt_list->gt_list[id].near_mem_regions;
> > +		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
> > +			gt_list->gt_list[iter].near_mem_regions;
> >  
> > -		gt_list->gt_list[id].ip_ver_major =
> > +		gt_list->gt_list[iter].ip_ver_major =
> >  			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
> > -		gt_list->gt_list[id].ip_ver_minor =
> > +		gt_list->gt_list[iter].ip_ver_minor =
> >  			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
> > -		gt_list->gt_list[id].ip_ver_rev =
> > +		gt_list->gt_list[iter].ip_ver_rev =
> >  			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
> >  	}
> >  
> > -- 
> > 2.49.0
> > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
