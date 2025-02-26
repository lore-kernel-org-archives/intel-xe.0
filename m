Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFC7C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 21:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD9010E259;
	Wed, 26 Feb 2025 21:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcCMGEkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5910E259
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740607193; x=1772143193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ogf7hMkuhBkq6z6cl2ZV0zesSP0dBtKzugltdo+TXAA=;
 b=VcCMGEkz/QzIoPFJ7WjZxZ9aAX68N/4DDfsu/+mE36vJL5dF3/1bcZOy
 SBEMm6WCjd3Hf2FLeZpE9iNz6RO6KjrPPbItIjm0Zol+Lg+AjnYuCAE2J
 Jg27Txjd4i/M8fT0+zVMbgsuFTVPu+JHqRrlg0jZ3G3I6Ic5Ms55H9cyZ
 f+cS7tG0juh89UVPHkoq7Blnj9z5CN4cLOZhSWtcdpKFaGgW3uKH7OLzN
 VAYzzwqmcDxK3TsqqO/M5UOx+IWq/T0hiH4Jqt54MD/5khqJGuZpZx98R
 R5tNJkJ7RrBBAWxEE3pBiZbzO8bS49CqTvJRvBGQRjPAAFba2vegtH6CE w==;
X-CSE-ConnectionGUID: OWGamBU5TKmu/9811tKPLw==
X-CSE-MsgGUID: CLq2NcvtSAq0xmP2SjQgKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41499514"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41499514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:59:51 -0800
X-CSE-ConnectionGUID: k9wZcT70QKer/t3cBi17Aw==
X-CSE-MsgGUID: RaM2CPoXT1usiDRfX4jQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117335081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 13:59:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 13:59:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 13:59:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 13:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F34UrGfxjgzKCoqDZL4Ert3EqFkP8HTk20wK8cLZ6mEfBnJSom8N783d5Royf/FL52yclyObKZwyKq9RL52eJsiCL3Pwxt4g8ahPmzjlcCcoX7M5AeUvQlVZqG8Xumds1gzHOeUPcsgY3ZZOwzPI7yNcFOPP7wBRKgj6rCPr83/4lj2LqSvm0J466MpN6YYH04QE0E8AYqJS33MglLONilMbVpvdB4zHMm5r+QtvuBCHzv4R4q8HrvUJfhNxnVd1864KDXrzcNa6v2qVgSKLlk05s4BdlVBkwJtjAzysOzQ8T5rBP0mZEDqnUZZXjOkppaf3RtGT0dXqzr8EN01Mog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U020+fIpMVVMNr2o67ZQfHYQc/fSSjl729Ifwyb8Mg=;
 b=EIA9GkcvWook8J97eipO90dUwaw0+sBj36ML5ielnNiuXot5wnwTRt2+gkuICOJPde5ed8O/qQ6Rbm4KH9e9Jw9GIUMmc/wV+qzfgT67zNPcki4kVZh8HaL6AGLfSdo0K3ZAq1ka2ApcjCrmn2aKeAdflpXbOAEyC7FudAjsd7D6aiyRiDFkTUKnR5XhNW0cBUl9r1EI0s+FZuPOYR+tS1s50tEMAuZuZBtiv+P48ugOsnRwsaNEVmTels1Hl4Ib4vx7x+rcnSYwEBVXGHCyBJQt6IAiXYkZismiyMJ2M3sbfT1u23XZix07Tn5d+kOf+RqL1/KnKGC0tJehPxkAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 21:59:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 21:59:47 +0000
Date: Wed, 26 Feb 2025 13:59:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
 <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 5933823a-8939-4f8e-9655-08dd56b0e26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nFxbAfIOY8tqEh66j6NPajxi8s637f7igExaiGmC3OW4UnZQwwG0iCKAWj3E?=
 =?us-ascii?Q?8IlsptLcZ2qHGgAW+oTR7SGNwedGMn0dKrQqxH9Lk0vjhDr6n83xFVsXIIFu?=
 =?us-ascii?Q?cZYfDrYaLkty2GmAF0GOoOgfASGUrb3udGoWHGkpsHKVKgv6aJxLzJHIEkAh?=
 =?us-ascii?Q?wZqyvgsxqpAsy/gNhMh73Qnm4v6TvgH6Q637L863D93n74UhQJclNFse6Nkh?=
 =?us-ascii?Q?pi36tG7HS/ZOEFejwun8cpLBx5X4mhaXy5RlyqhSaSpC+Lwo5cbwGXFj2iD4?=
 =?us-ascii?Q?dD3s3Oo+Iqe600B+TeiK1mcqoczIQps5W4yDSa1wTNj27LQlgHYkyHKEUo+v?=
 =?us-ascii?Q?Vof4YW/BmQ2AcDvf0SFRAe/qle3NuZtUkiGZpUKURHNFZCvj3Yc1dfufrxMp?=
 =?us-ascii?Q?A8rFireB4PASQ3ZoEh0jW7AH8By0PZOYRV+c1tR0aHO+UpiX8RfR5jjdiiFM?=
 =?us-ascii?Q?YyEfAfFAwt/oYFh6UxxRuRHEZ0yfIDDxNLNJp/aMzBJ2qJSbgrSVSFCX6+N0?=
 =?us-ascii?Q?eVcFsCSrocTH/uNEqce2WkZwHFezr8eXF2ebxTwVe8PcoK56eWvgJGqd9yj4?=
 =?us-ascii?Q?VpiO8TYMZV9LNc2w/T/Ij++TpSU+0ph2wGcerT61XWhOBMpPhBP8+dqCxHqI?=
 =?us-ascii?Q?rPh1p1WZU4yQNC6+2wadE1EIWK9Xe7vm19qsRF9RJ5IoIP9KGaJhDrjBne5k?=
 =?us-ascii?Q?8mCFMAa3wgPEmtPi6PfG+RfcmbPWPZe1/V1lBgPH+lKhi1xA/fJ+8Ak6Fdoj?=
 =?us-ascii?Q?pnpN2GYo7191YUBTpmHPaPtNNfmCitzGE/oImS3/vyk82MFzkaAbRDImlfiH?=
 =?us-ascii?Q?RBr42PUDhmAIh7NPGKs71rwZD5p1mOyDbjK9iSFuW9QEAXTzmurSSTKlg3sL?=
 =?us-ascii?Q?fm4VBvXl43+h9CWSrFl/w2Y9JjqXUz7zYNsRC62uvR4YRpl75ZCteRrR1Geq?=
 =?us-ascii?Q?E9QfNCXqRqh/JLREATEYNLjj3t1P4PRzjlLoh5WcZRqh94pwjyAjzTgcXMDk?=
 =?us-ascii?Q?sUVKF3QUCCLwAvulLTA0z+Y3N/M3I8y4i/kgrU5WrCS21gK7Ef3uhMtJlwLj?=
 =?us-ascii?Q?CrsX6/qkLDboFVc9NMIYxMrBoJfzb6E8lREfm3naYM6ymSMZmTyXn0gFYaMZ?=
 =?us-ascii?Q?jT3RQeAFkZemuMqcMl6++f9CJZGXNx+NQUrQqQ/oW/ACH3b0inmw2JCvgsbE?=
 =?us-ascii?Q?p025gldJxJy7/rJLGjIE3XwScTMx7HBT1yVpimIsTbL61tEPOPE/7daXbg1O?=
 =?us-ascii?Q?8rAndDZ6mFQspR+JWal1OQh9fJoU1h7sHfxlbiLU7mvjewh0vPo/Ozb7x2Bv?=
 =?us-ascii?Q?ipca+mvD9C4EGohGNSxD4WQgDjjH2VBt5BGAQOeGRgFHtcxphg3UB10Hti+x?=
 =?us-ascii?Q?CInn8kmNddchjF0Si3dnGdDVaUwa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4/zjJ+NtFjr5PtyCpyfeT4kEx27rtAYvFiNMnUpfUnxto5v2betbfbKpeuH?=
 =?us-ascii?Q?MgXw0cgxEhyLeLMtpNv3UKcEp+8iVEKdI5h9Ww0+Og0uHwhMVXpB7N84Pt+v?=
 =?us-ascii?Q?ReSf1emo40C72m2IiwSRMRCi6XsotXeZXfEMVIIlI/FfuNu59gHR8/h3OhEB?=
 =?us-ascii?Q?q9Y8dps8GT6uBEeFX6Q3ovIFtYM5MKwgOuNGl17M3QWcg+37ZgapRqs1uc5B?=
 =?us-ascii?Q?MoMVENMomduWBuirwNnSj+339MhvxGiTVTn9xPXMIbsuxE/zrCqsA2PVBoVm?=
 =?us-ascii?Q?auvpqk50vVmBHmUiYD4qDZNgLEhlAPurUQk1NQlKEkY39XnteplqeLg+2WG3?=
 =?us-ascii?Q?Au+T8L9u22ujBUO7tJWFX7yvtVTIMjF7zFtJpuHUNjDcDu23XTjL3aUVXwuE?=
 =?us-ascii?Q?SG529oSFsyZqnn3FRMzIiBQ7jOKf87VyBkBuccuyIhqBvjrOFmI4DYY+VagX?=
 =?us-ascii?Q?H+9M2DtYi5gR1MK14C8FzZDLw+jrovS8XKtzMN4U3UdOz7En0MILij6yhUdb?=
 =?us-ascii?Q?1/CfEeqtxTCguYQTLPq1O2yNa/gS3D6VE18V6DnMQhzf6jJw4JqnR+gCC14X?=
 =?us-ascii?Q?UdspsYLiRnvqUailtTOX77SthcMN3skoAPu9dDBzkmYGiKnvTfFin+l0fHO5?=
 =?us-ascii?Q?i6+2KlPD4HCa92ygA5DOQkwIiUs3wc67JFHnPbjJVuC7V4bLEk1QPhaEBRaS?=
 =?us-ascii?Q?g729dLRab2S6JhxRF6uuthTcmUNo6lBp5iS8vlRhlbhkuS7VBl70CD0PR8Aq?=
 =?us-ascii?Q?JhrmR3DxpddfblAZ1J1axhpYUSWz/4W7LgjbDkkvsNo+FYh3vmovBmX4Gg0I?=
 =?us-ascii?Q?HjIsUWhGPxYLE+2RVbXDWivzo4Oj6KbWPG0+3sUlVxlfTFzkdxH0pXrZWuae?=
 =?us-ascii?Q?RrRZjt44w46bKZL2j3yDN77ejWoFDXoSwU+31ae2nabyTI0bvWRbphe/acaG?=
 =?us-ascii?Q?sZNcnctdbdesIUF/GK9xxYqxXsVSnTJUu5BepRwr/C0I0wWSFF515syfP96I?=
 =?us-ascii?Q?i5x6w3GBWHjP8Y8IHuhj+WDkkE001n07PwRfn3f+x7CuSHbY+Y8qSkSu3WEV?=
 =?us-ascii?Q?SVj2D7BKf5Lqwmd1pNGOljFyuz7vUGPppXExDTofhw0SAVpq36/Cg79IX0V5?=
 =?us-ascii?Q?Z1kNlyNRyLECeWYSTept/N+g9dD5wOZ+IZbRwZ43lgBmbjRWQmrX1VkaVLd4?=
 =?us-ascii?Q?zeWKPqt22tAQQqKbmpgPI59nlT4MgOxLQjMgWn9dgkr5SNP3xoYb+18UPH8J?=
 =?us-ascii?Q?/zIUJmR4mGBpP4TxQ35xcjRS7fm8sHjTp0fPcxU4WP5uWui728U89FrgZ1++?=
 =?us-ascii?Q?zbs2BMJddPEvkbWh5taVtGKUEQ+GJ9xICE/9dPFu20rngnj2uuosHrRcmbfb?=
 =?us-ascii?Q?kORqxFyoz9KIf0jxZq8Fuq1QjRiVjjIJ33li2DrAZfEWvrTl9H4tljh971YA?=
 =?us-ascii?Q?/13oWVbFN3MYUQ8gagYOj4HYpAEyffVuiKRRIhDcVLmqBZ8oMmc0TPzmGVuA?=
 =?us-ascii?Q?EwOdX/Cv4jDyhIqpzKYjGA5sleTNZlSoQHYg5Rns+QTrE5tLsRO41sPHllXM?=
 =?us-ascii?Q?VpiA5S/kpLH9zVx+/hbZCXdtJQybsLxt1ivYknbcSYC9zXbKzyB6Jy6nYwBF?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5933823a-8939-4f8e-9655-08dd56b0e26a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 21:59:47.0378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7mkVfCWkCQ+euAhzWjF7MI9Ym8CW3H3SE7+8QCuJ0vMCzG7CkJi5Zr0Wb+Ns4FdOGnKw1R/UX8DWFwtLZpZVz6zLuBbkR7La5+9Mpni+JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

On Wed, Feb 26, 2025 at 11:20:16AM -0600, Lucas De Marchi wrote:
> On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
> > Any rules using engine matching are currently broken due RTP processing
> > happening too in early init, before the list of hardware engines has been
> > initialised.
> > 
> > Fix this by moving workaround processing to later in the driver probe
> > sequence, to just before the processed list is used for the first time.
> > 
> > Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
> > should be present while we see, before:
> > 
> > GT Workarounds
> >     14011059788
> >     14015795083
> > 
> > And with the patch:
> > 
> > GT Workarounds
> >     14011060649
> >     14011059788
> >     14015795083
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Cc: <stable@vger.kernel.org> # v6.11+
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> The version in Cc stable is because it's what matters for officially
> supported HW by xe.
> 
> We've been using the reset domain to decide if a WA is an engine vs gt
> workaround. Although I'm thinking if it wouldn't be better to simply
> drop the FOREACH_ENGINE processing and move those workarounds to be
> engine workarounds. Matt, any thoughts?

That's a common mistake we've made in the past --- it doesn't work.  If
you try to put a bunch of these registers onto the GuC's save/restore
list as happens with engine workarounds, the GuC will throw an assertion
and fail to load because it considers them to be outside the very narrow
set of register ranges it's allowed to work with.

So no, unfortunately these do need to remain "GT" workarounds, even
though they need to be applied to registers that have per-engine
instances.  :-(


Matt

> 
> thanks
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 650a0ee56e97..d59c03bc05b7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> > 	if (err)
> > 		return err;
> > 
> > -	xe_wa_process_gt(gt);
> > 	xe_wa_process_oob(gt);
> > -	xe_tuning_process_gt(gt);
> > 
> > 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> > 	spin_lock_init(&gt->global_invl_lock);
> > @@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
> > 	}
> > 
> > 	xe_gt_mcr_set_implicit_defaults(gt);
> > +	xe_wa_process_gt(gt);
> > +	xe_tuning_process_gt(gt);
> > 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> > 
> > 	err = xe_gt_clock_init(gt);
> > -- 
> > 2.48.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
