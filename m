Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48799D75BB9
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 04:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7810E037;
	Thu, 21 Nov 2024 04:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4dbA/6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB81510E037
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 04:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732164874; x=1763700874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2l9OAjazv2wGd3HZMPIIXZGHCKZiys8D7g81JfR8tRQ=;
 b=U4dbA/6qHVRVCO1GOrH9Q+I9ldYqfregXrZqnlFKOGKb9KdxfXI+pE/R
 GA+CBnECCL9slM8TL/XO4lzI6O02gXHpz2eFhAestxlQ7Y9XqpxN2lioS
 CMUhoyBTexRKY1WBewI8yrDN9+xoHzHKRuQGlCi5yinNT8utCChJZe0jr
 2GFst3xSaziBnah/mOv5zSb0rgIY0gEQYG36lzWjiLqzMwp+y7pGA2thw
 ynbykQA2RXtZntZBbHi+BM42RQdzxZepFuMvKMMqzWayt7YYsUMWLNqED
 gxKbYUqjCIbz5fhpcM7cclDbOvOZdLTvtOSdFtNltvFpGvc2WvhlquMrD g==;
X-CSE-ConnectionGUID: N2ed9tjCQ2iKtL5XA4fckQ==
X-CSE-MsgGUID: Uxi25ttZTluCvsi4zkYgaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35115455"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="35115455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 20:54:33 -0800
X-CSE-ConnectionGUID: fVfGlU96SwS3fJ2hWwg2gA==
X-CSE-MsgGUID: MiiOSwP+TiKYr1ZYWZYpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="94196850"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 20:54:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 20:54:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 20:54:33 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 20:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBGn1c2TYaivofU+k5y4DfeJFya2vfusZng28JBEiepT1deK2IFNtaFsl3zqpjajr4bjZJwlotiV9L/i2Xd4RRK/Opx+JDlbtZxp/7CzWqvIIJRzeVnLmizbS75Hnlm5n6u5adn8jupXGumc1FQ3WXo8VorQYqU9KsvxhXWi5x2ixNlkAx6i4inQp0d/AXRfsEfWV4Mla77QM3TTGi7RMQ3F2uszTT+Cg1PDmVA7UiEb4tT2LifDUI/IpKIewX/wZsA4q5sMhLdrjptpEJcqmUD2wgiisASZIK9IimGMLR27PTwzvKYSbzjQdj+s0N2FEFpYMYc9Z82Pdtl3CjU9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUD1+5q7q19UXLg1NzMyCb6wbNqoyD/SmdcTrg1u/NY=;
 b=VeZsaVh9/DzefQrQ3fidHx3UZliTptvwSvbOhvJcwirCpG+pFxGnqLG0ty3u1CNUwc/XY57KvjpMjd5xbds0R5ub3LZQx1DDtyv4UsDot635DLl1bZYS7EPiz1ZnfDOBO98yGkqbLtORPCE6qox+/KkAE4ggDyQrcs8cFi4cI49+ehXll1pZPIHZNJFXUMkpW38NJXdeSkgqe27EJFAATxpTwm+xTaWfGkdkXVg+xcme0LvuVWNwctbcFQ+af0YMj46AiM4tZ4W07ggKskXA3RJL1SBJEGvGSDFZ/yp+fJMFjCXh6Xuo6W5ibrftBQ89cuUs8rC7CuFrVaypPZP3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 04:54:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 04:54:30 +0000
Date: Wed, 20 Nov 2024 20:55:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Use new force-wake guard class in xe_mocs.c
Message-ID: <Zz69Ksdzuqb4TO1v@lstrano-desk.jf.intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-3-michal.wajdeczko@intel.com>
 <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <q6oftdodc3xpjczeddv3ghr2c5msrqgekbz3f34yi5leg4hz22@dwodxaqpk6pd>
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: a861229c-9ffa-4fbd-6c89-08dd09e895b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O6W1h8qRpk8L65XAU/Mji5gudhTHgDpl2HD48HjIA9kDLZ7a6MUaxfvNxXmt?=
 =?us-ascii?Q?kFPk8HPyIBSNtoRuOi75f4oPJlUIYPjplaxE1L3UmOWE7YV4aBg5phAbWfwn?=
 =?us-ascii?Q?UsTO67+b8BBtcOMbAXF7oVuTU0pvOQgEKpiWrhNYa8i+SNQNveOcKhEJC4HD?=
 =?us-ascii?Q?UoAaQ7jrtX0bksZ4BmJKZpGRZGtoyPH38pxTIq+96Wq0JpCwATC6egfVaCnI?=
 =?us-ascii?Q?YUdLvbpAhqIppx2IGRoiBaCfVJvJrga1yYEoyPkBMDJeJr+A6NAiaTkvMBHW?=
 =?us-ascii?Q?aeBO7o1VYdtMw5v+QEV8TUIwKYyatcrSfTtVZerixY89Xo8qiFDez5A2yL2X?=
 =?us-ascii?Q?bns+FKLIzFNZJw6BR1BYboXqfR6OPTxgSN/21lk9Wb7oxCHHGgbf+s2U8Oy7?=
 =?us-ascii?Q?nnMorc9A4YrEXuA8XEwdb0RzKVjdM1nrFdka5WrzLItjmeRzvs9AogZxX22J?=
 =?us-ascii?Q?kBmP22ANGHGYjYOliMO6dwnT2x18uTaUH37+lHhrYGEHDc9syQ/XrWNO23X3?=
 =?us-ascii?Q?8GGyv00W9avmAHKe5Zs0Mg3nEdGamdIkYXFbI1Qx9m7z61Hm6zF7KapjdY2w?=
 =?us-ascii?Q?3bDC01h/4weLkCA51x+xpv7bT/P2NFV1gZ0lh/19CyrhU4XGX7sMTm+3DAPv?=
 =?us-ascii?Q?ZkswBZw36NC/MRvqKXC2QYuhUeF6jaBeoScWVlVtIKs9CFuk7sCQtU5HGBm+?=
 =?us-ascii?Q?AWjXVk/3XHW/dKnhKLvxhYAZ9SNSnFPUzXXBL4sTOsEaV+GXGz3rFqiVl9+7?=
 =?us-ascii?Q?u8sXd8sfWhmLC8m14z5grsPIZ24hNt5DPIPVEv8n09QBn6ig1We0mTp8IPCJ?=
 =?us-ascii?Q?W6qlCdo3F1m6VWMf4RJ1+WkfgiN36bVBaZNBtCj+7e/YH50cx3zYqAiNnNLI?=
 =?us-ascii?Q?qN+M8+byS4F6PrZs3Ei/mlSSy/AkJ4gmQ9N6nVLEWWSqZ7AghLU2cmSn620X?=
 =?us-ascii?Q?0avJEXhwWYtvQDlgg8jeok4OtLU3ldWQrn2o9czUaxiORkNJTIkViGU+0Pp6?=
 =?us-ascii?Q?ztjt1tkaWxZF3S4LZlNB4C6CgRUlMdk1PRFEbHNWAOEIWdivIcWg0ANi8e8U?=
 =?us-ascii?Q?Y1ObbuiQHd9s1ALAU4ixpPbO8tQBH506WyqNwbmd2eLArbR1/nE5mkNJnZE0?=
 =?us-ascii?Q?CTzYDesuXcJ7/ZsueK/ov6VLf8ynpIyOAQ2xzQLrpSuw2r8GmV9Ljy3q5GVn?=
 =?us-ascii?Q?C1cKBjl97vyGRjdmQtJG7SnHo+LMGRNnw4bAwlolOoCpqTSZo2EGSc0N6osE?=
 =?us-ascii?Q?uYxWlF5G4eVTFlYCfyLo+34JJmEInCTjzRB7b7znN+5b/Uqsi4gqIOM4njAK?=
 =?us-ascii?Q?W5nrYP2RMetvFgXaCbx0MCaG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SE0UmqTQOQEJLyM7rdXibrdOg5M2sNURDkrvmR6DbfxzgfFxKkNLH+eFr02s?=
 =?us-ascii?Q?qzASzX4dXXUZfBVnNgk0SA0jnjY6tFgrep2aiY86W/deruRHTDAlhlAzJ/8q?=
 =?us-ascii?Q?2Dw4Cyldct+goz70u691keQMJOtvfmge6VSYDV3AooJhS6mWLpo17XPoD50J?=
 =?us-ascii?Q?8cmPyJvoSwLoiFuNi6bj9SXOJADxEh5LfgrFZXh55OBCgAq06HKy0dzH6fgJ?=
 =?us-ascii?Q?j4UwtDr6JOAB+EG8zb4pbIXrea/Y9Fu/uaY0Hw7/JLcJUV0jhEEucBuFOOaY?=
 =?us-ascii?Q?yqQhKJa5W56MDoS5Zg7QRUwh1sXikOgfhAh++FhUkrUvPw9TdyGSWO2mu2H4?=
 =?us-ascii?Q?nX8zSQHssYw4RopQImzumAIFJBHdWYCuGW7uPml0z6hZ9HXpQxWQ4UD6Etwx?=
 =?us-ascii?Q?stj7yOtFExQf0eYc+pUBJ8fY0tQVzOn1NNBqjijhk2GKaxiMcoNDEzaxt7dZ?=
 =?us-ascii?Q?ynuSli+fb4UNuyiWkvR62p0HwIHSiLKIznrAfMr3wZw5csys7mHp+1pznQ1Q?=
 =?us-ascii?Q?I6C4H0kX1CxzF1eSaO8Hx4G+eM79N0EQiooiZ8MPA+b2nt6iOrvHpCv9UP3H?=
 =?us-ascii?Q?IhxYJ+grmWluXGYft+5mGHYvPoPvgp4RRRbQVsJYOoIsrUTYgXQJxW62z0JT?=
 =?us-ascii?Q?DU7w11JjcMf2ldt8lpqCtSAOuXetUmvn6wBg9uSIL2a1zveACL4qFLDQUAEN?=
 =?us-ascii?Q?DfUQOZ5FZcTngpm8dgONteUw6T1UIj3is0oSv9GMSwQmRTVsEI4Be73ZS84e?=
 =?us-ascii?Q?FatJZ9D3SbG5TOKU/uN7pZwfHFxtEjxU8fMHAwiYE7d8cHVhgN1rme/Uqv5s?=
 =?us-ascii?Q?898T15sPptuKaZHSdw7FxggM9yZQE5di1RxGwkIpfUctsZzisRgouHQ9c0u7?=
 =?us-ascii?Q?GX2i0qizKJdWk5PAlpvcChpaeAPMT+GI1DFqdxOBVZ86opqvkg0bebiSZrAv?=
 =?us-ascii?Q?fpxP04HSwTJCjnNRPNdQSFOR4S93/OGZXkep4Fja4tagwWByfIhi0UE/L2UA?=
 =?us-ascii?Q?mEPfo4yMzwf4WtwBvBU3343L34Ugr+4EMbgoNOVD43M+5JvzjIIXeWfT7J9b?=
 =?us-ascii?Q?vhiUgAzKCeRf5cfXN5zxBhJRFQ1mZBwiCOJ1jV9AfruATpHMYlUlPvXTsW12?=
 =?us-ascii?Q?pzDl2wJD1CGjGThhPGfSIk+uh3dAaHt0f1IoYWvX7fq9+Sh5e1dNFRZlpdOe?=
 =?us-ascii?Q?sba8o1U3CEC/gNmkpRZowOAzmYAAv/Wxk5YDyme8G6bdHADXf7qACWmU38ln?=
 =?us-ascii?Q?xSU+J2OBG7k1SYT/mv0xzng//gizhOMN47mmIxo8jv6uzVY1K0pcVH6/3l2l?=
 =?us-ascii?Q?02okqE5wsXzyOf5tA7LWRmRMZxxO+rI4tFY1A9WZOH7RAysJaqKl8SCe9jO3?=
 =?us-ascii?Q?gF4pdYf3Ql13yT6w+SQLhxth7f1bQFwv/zihGvqmN307kYvzbZ4624i7JsTu?=
 =?us-ascii?Q?AWzMgh5QQffaH1oHLKrqoA0lsHihafFJui3nPO0DiHVIvdgEHHMfIaWo7BoY?=
 =?us-ascii?Q?nlt4JBz4yNdLhT2ZjiuRg6iLA8YU8wR66LRk9lGF/CBmz9EE5pFvg7ShrZ7U?=
 =?us-ascii?Q?Iz8up2gCyt7r4A5mIFTFOJkhDRno9w01E6qiCJuUEw3oT133IJSyL9ixl6gr?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a861229c-9ffa-4fbd-6c89-08dd09e895b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 04:54:30.7065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf+BmBSJIrlJQey2DNLB3VZM8EIZuRz6jipUgdkHcmdIxeiuyK9Bt2PrfwRcNZH6R23U9SuoaqYIV/ZBAIM08A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

On Tue, Nov 19, 2024 at 02:03:12PM -0600, Lucas De Marchi wrote:
> On Mon, Nov 18, 2024 at 07:45:11PM +0100, Michal Wajdeczko wrote:
> > Start using new xe_fw class to minimize risk of leaking force-wake
> > references.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> > v2: rebased
> > ---
> > drivers/gpu/drm/xe/xe_mocs.c | 10 +++-------
> > 1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index 54d199b5cfb2..f18aaa6595c7 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -776,19 +776,15 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	struct xe_mocs_info table;
> > -	unsigned int fw_ref, flags;
> > +	unsigned int flags;
> > 
> > 	flags = get_mocs_settings(xe, &table);
> > 
> > 	xe_pm_runtime_get_noresume(xe);
> > -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > -	if (!fw_ref)
> > -		goto err_fw;
> > 
> > -	table.ops->dump(&table, flags, gt, p);
> > +	scoped_guard(xe_fw, gt_to_fw(gt), XE_FW_GT)
> > +		table.ops->dump(&table, flags, gt, p);
> 
> 
> afair one caveat is that you can't have a goto that jumps over guard
> because of the usage of the cleanup attribute. Is that still the case or
> do we have some magic convincing the compiler to do the right thing?
> 
> once we get agreement on the approach, please let's convert everything
> that can be converted to scoped guard so we don't have to keep both
> approaches for a long time.
> 

+1. I've come around to using (scoped) guard but if we commit to this I
do think we should try to overhaul the driver to use this more or less
everywhere it makes sense (e.g. fw, spin locks, mutexes, perhaps some pm
refs where the ref is only held within scope, also maybe also tmp object
refs?). Having a single sematic IMO makes it easier to quickly understand
different code paths. Maybe we even put the agreement in some kernel doc
too.

Can stage this a piece at time too, e.g., A series which converts spin
locks to scoped guard, etc...

Anything simple which also doesn't fix into patterns handled by scoped
guard we could also review if the complexity is required and if it is
flag for comments so we can understand why it is needed. I know for sure
I've added odd coding patterns which are required, don't have a comment
why I did it, only to forget why later which is not great for long term
maintainability.

Obviously complex locking patterns, e.g., the VM lock's + drm exec, will
still need to be open coded /w unwinds but that locking itself is or
should be documented too.

Matt

> Lucas De Marchi
> 
> > 
> > -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -err_fw:
> > 	xe_pm_runtime_put(xe);
> > }
> > 
> > -- 
> > 2.43.0
> > 
