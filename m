Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2342CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 21:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51B10EB7E;
	Fri,  7 Nov 2025 21:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekr+zn+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154BE10EB7E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762550235; x=1794086235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bce2183wTjzSna3yjl2o8bJCcy6D1mIHHzGc04GYOJw=;
 b=ekr+zn+ZydrbKXA6eoe1Oq8IqRi/BhejhgxLX2uQCG5YE/JzkMwXeuCy
 Ox8C7d9ipBEn63ksYCngo/utSD8WPNHyxruYzcPGmxSFO1cX3V94A1Wrp
 BGnrmq0F6rWAu23AoOY0mrxv8BPPSLYYMYwtIH+BkhIFrImICgVsHAO1Q
 3e4ZZMlxegvHmdm4Wdeb5H5ReKPQQ+8kH3QDvqwNP+Lb5x1oa1Isxs+Ve
 8n+veyj+I1/HvZWiIALDctq/MR817p5/Yu/ErgZ+AVl7Gk9I4qZPdrGwR
 oyEweeeaU7/UtnbAGruWxU2H2Pzy0zKfpZJlb+gvDiU9xPYimnkJ4Pwql g==;
X-CSE-ConnectionGUID: CqQQxuRNRg+r8Vz4+FJqaA==
X-CSE-MsgGUID: iEr9HKmdRkqOyT2kcli1mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76153995"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="76153995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:17:14 -0800
X-CSE-ConnectionGUID: 3tt6aocsSAiybexJtWmlBQ==
X-CSE-MsgGUID: 5n1JKdbBTxCwhnQArdOwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193305705"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 13:17:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:17:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 13:17:13 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 13:17:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTkB3mVtNMKGg8nN3py8Fs7bGc5o524sz3fWAq56gO8OfXz26qAI1QyKdsLm6njrkdkc6I4Leo5MFeN6IqoD51wNopvZIdfez7VzAWVQUnG/D+v5ArMq3jHJhddA141nF6hPy5d5uZkS5Q6WFjAGpOIYclcwWvx5zhXnmhJ2lZAcWQlWeKgJ1zsOqBg5Cmg7iqMRv0fJKXCLZpJ1UrK7QvRKpyxdnOYFvxNP4ComesAkXghLDYN7NheY+aYKuXHmViKSRYHW9FST6BqHcVfd+ouKbIuIwynqu9fUtmB6HzKD7tFCzXj+vPjjNn54IJhugqEw0LM7albM6tQUeo3JzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av4Ad67+tQXbYns3TPPHF/Ov+X1vzxNeBZL0wvgOEBw=;
 b=RMe+naE85lQfjJ/iy+2Q58s/KUqHd6hHxsUuzQf6UVMnQiynrAKsTJfFPa82o+yVWm3C4lEeo6wvtY6yPIImWXzgseGT6azTt5leE9jsiMrKAShIry+CVlC2f2hGKHxujobndPBMuAxAimHxTIfdkGJiFMaf+BM6ilUNAzxNa8TJ9TH17ZAiPCyk5PQ/m7kABWCcseUt/GcRMq/42OxAU1ulBy0n1E3Bh6WjB76xugZocNXOUBqK+6W+Q3kT+ATNHSqizXzK5rfl7fiBH5ylfKbOKBzH5A+B/EJ0iTYO53rV6T19E+JH/M/V3QZQw1K4Utq/+Z/RfllEM/RMliK4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 21:17:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 21:17:10 +0000
Date: Fri, 7 Nov 2025 13:17:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/33] drm/xe/forcewake: Create dedicated type for
 forcewake references
Message-ID: <20251107211708.GK3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
 <20251107181315.631642-39-matthew.d.roper@intel.com>
 <b93f3fe5-a39c-4e9f-82e1-4f3e1e328161@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b93f3fe5-a39c-4e9f-82e1-4f3e1e328161@intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc8ce26-3e4c-4c6b-e51e-08de1e430378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOrE3/bL9+4hyr8SArHKK0Sn5SME0EcgwTkIH8PnOb+GwQdaBp8koBOtwKYJ?=
 =?us-ascii?Q?mGQlxhBufjDc+4+b411hzwgfGszaVTrvAqFH1qbCHwNXu1mK+KIxhGMd8bGn?=
 =?us-ascii?Q?K1ASS7o2D5O7tdYA5rv5Cj2Z78rmSjKxUduMC9Wf9pIne9cLYRIMKZc7hvNn?=
 =?us-ascii?Q?Pk7rWXmXgz6WCtauXNxy/bU1N/vMhis2duLpO7fahhTDRXo8Ywv6QGhagDxW?=
 =?us-ascii?Q?1s5vNdCIvctdGK5j7nPLY2jd0BKAIdM1rWw3vt40JEH22cqMAaJb/lAyfFIu?=
 =?us-ascii?Q?BJSpXsQfgt1UHJ2kAGonXEVejaQb8jo0Hly6i+jUoQbRcWxXuecZoKN3OG2U?=
 =?us-ascii?Q?B8hrsx5h9HzzhB2DPU/mfMTPwNY3JtGPOE7dgnw+cx2Otd0VdYxd+HYfLg85?=
 =?us-ascii?Q?SgcAx7v80le6JiCkKb0lCOuIyWYWpR/2luuCnihLc0JganXotfbdz6tsMDGg?=
 =?us-ascii?Q?9Xfs1da285CD4Lq46/1F76dXLeFwa+biYJssylAv9BjSm1qZHyGGN1lZBFlx?=
 =?us-ascii?Q?qMbNEkP0PY8sNqDPRZlHw5zQah2sdPwc8TxZ5IzcoHp5Cn3rbgkxP0/byjed?=
 =?us-ascii?Q?ZTndrfApCuHcNKqPOY59oGVxMZeBsq5UZyUJDWzoaj569z0VNTIE10RAgDRg?=
 =?us-ascii?Q?SmAgma0h/kl+yUu63AKCfkm2PkryE5R222Kp9rIfQqJjWjkswhv0iJggMKQI?=
 =?us-ascii?Q?LTk0QtzegxrHE758wXJT+VdAEtVf9ZBRLQ+PPItN0vBO6Bc96kuXwRRjiNW6?=
 =?us-ascii?Q?0XlaXAkjQ1wQskv9/XasbL4mgqXvTdKkdeC3tb56TGkmq690YNOQDD3DC282?=
 =?us-ascii?Q?CzV9mqN/8vKKEZemSpwWViqZFtIq/7xE1yEN046umw1OZU2M7ihSsT2enWdk?=
 =?us-ascii?Q?/SIvyIF0r5CwO0AoWCdXWawviEJWsjaIjNPTfLawOHJfT3De7NmCqntLzhhQ?=
 =?us-ascii?Q?wSrQC0Es4H2p+8NlkN+NH29JF9tpThRsYpR4C4Hw/d1NA3y6Elbinm6rXGZC?=
 =?us-ascii?Q?zZixa4WyYyi2T6G4Xx8nGxTpLvM9uObud1N9fyjSi7UoGwCJDuQt7wrmdhhI?=
 =?us-ascii?Q?bPIvP1v1qfEJ1sZTPAKsbyoj7COin/rwvVE1eaES5d6FQcnjWVk8sNuf7byc?=
 =?us-ascii?Q?mrO6yGSB0I55kmkiRGI2E5GzN4MGkNsM+21tazj6TbZ4NdH/JlXgJATJy/tX?=
 =?us-ascii?Q?yDzBuUoURENpVdPLVYWPyQ5RmpZQwhqG6e98GImgzD4rMwkZ74ZVD+Ri1lqc?=
 =?us-ascii?Q?b7Vs09dn+ZXVWfvger3LdJcizWOmuz2/jGcDC/sxIjxqN0fjEXbrlJWV/Ok5?=
 =?us-ascii?Q?VTRC2r2eDjK1rTcjDclkzUZ6t7hXuE9z43m6jf9URPsU3h0CvKOaEZv58yoc?=
 =?us-ascii?Q?NrSects+UY5Hj3G1MmYCw0Q8xYw3NJtkioUnbfR/shcuRO6fQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFpqhR1HrrZLmao9yfidPQPzH7aIecXsydgGn6kh5T/dDYZ3H82KL1BUpnxd?=
 =?us-ascii?Q?hUoVcrG+SEwQKnVPVcnTlidPhmQY49Fzfsep5u908Q2tP92PcBeqEORsEQTi?=
 =?us-ascii?Q?NYBcdo0YYBnBPmLsSsWIoxm3VksGIBSn1F1pMqP0kH8qemrg6AU3yYw19VrY?=
 =?us-ascii?Q?QKei7tgZrHpoQL9NxJacNNSgtpWUaKJkznM0ridknYfqpkMxOS5q7sGVPl3E?=
 =?us-ascii?Q?XX8ySLIpEPTG3n7mrEbFVpxQ4YuVVgsHKU6LJ4fHyxO5z8jn4FLvKuh/M2Hm?=
 =?us-ascii?Q?YVNnfTlT4QCM5JyUK1BXVIi/vXAcEEzq6+Ibz4p/ltk20V2Yu+JO3lZV75ej?=
 =?us-ascii?Q?rbFdtcx5h6tqhsYkSS7p1piO7P7363gRkXySNdbnRYEw8ya3k8p4RWvnl05d?=
 =?us-ascii?Q?pW0ZuPLv8u1Z6uuY4XhDJxSiwKGd+wWH1XSJREE7s90L31ZAEEPeSemJgETO?=
 =?us-ascii?Q?wR4ujsCLeGd23dsLEnjnoaD8awMO7dHFTklQVPXRisiPHraB0poN13tgSD4Y?=
 =?us-ascii?Q?FALhjSqFonahb2ZjvHEntv2ED0bY5B/vPwdJshKUyl29uec5jc8uBTE3Hniq?=
 =?us-ascii?Q?bl/7hiaqTbLK4k1MGI5cdeMgNgyKQoC6AfbZC3SB9VqtHGjffrFrc1MnwtXz?=
 =?us-ascii?Q?Rd1Ou35utCu4usyX6YzvpdHzNPQtFJkchd1wFz6snLK833o7EJiAXDF1NDeA?=
 =?us-ascii?Q?9r65tDgzKfRndBzg1dFMDtqOJfMR1QXLTfOk1soETw4XGFzMrWpt27pp+NRQ?=
 =?us-ascii?Q?eVw1N8AXjG0YrXLMaqXTYp8NdCsvhHtYh2xlwyifh8p//WWeNeQzAb9MZwWk?=
 =?us-ascii?Q?QUqj//EGc2wgH/gKn18a/9GPFY4BeiAPlXAC3W+j8S/h+oJ+xo+sDL/9ewWA?=
 =?us-ascii?Q?JSegMKiexV+PxPVgMB6eKlN0zWP3GzJ5dAaaC4ElntEI/sBlxQna26H7DwbP?=
 =?us-ascii?Q?xkiYDuHVpl1ccAh2rDJTsrer6Q7iWy2CWnf1hEbCG2XgG/MircDfj1ktfuUZ?=
 =?us-ascii?Q?L873VXDiR1+dZ2rbD7bYjGmnl7SKk4/0rCdEKCUp5F1x3zbxmL2dKp+dUxOF?=
 =?us-ascii?Q?eF38KVJQ2nGLn+zOr5IM1SgoPy4rldlWlTrhDZcLqJpHHuxUwFfE9tpDgJD/?=
 =?us-ascii?Q?DIs805TRJDryzVKXNmAr7ZUPhcWodU1xA+b+VmpIZnwc7WpynHDJP2AVqTs7?=
 =?us-ascii?Q?Mvp44wNMG6zOMkFM+KDSjHgVawzVJQKp674GRuUQhA45yB4VTByCcQDr5lwI?=
 =?us-ascii?Q?KW8bT2I2n6hZEDaMZLscS6/ikDlbKVml1C81oAkIAbcqjyZwBMiAqqYsnun1?=
 =?us-ascii?Q?tgROBkbPZvz2oUo6zZhInMm6F/WsZJbQ/eiU2Worsd4EKDxaxq19+PZ/gorx?=
 =?us-ascii?Q?fvFGhKPOTelD0AJv5XTUiZsggAd3Vpgr7nsblkBtt/FJ9+HJO10Gx3nNBMUF?=
 =?us-ascii?Q?bbwKhR02mfqYjtNxCA6z2V3GXIR01Pa/fuSYsJWt8AmBjYHio2hTql1dnmcJ?=
 =?us-ascii?Q?VhrqxVdfv+pc+l8GJBfcjLyxwN0m/1pOacGjRDWrovSSd9fnmI0GZlH4+Lyg?=
 =?us-ascii?Q?tFuDos4bu60ZI62VYghijLeW86ypSYspCNY4xv4r5DcGeowJ1LdvESlLRKtg?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc8ce26-3e4c-4c6b-e51e-08de1e430378
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:17:10.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2YXfySwWxET0WtM0GDpmuCsJyfZTbifQ7M0xRSWEct+JEMYlaAKaW06sJKBzsOuo9VU0jN4y/EonBRY/MYAwex17566e1PrGPdoRhNgnZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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

On Fri, Nov 07, 2025 at 08:27:27PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/7/2025 7:13 PM, Matt Roper wrote:
> > xe_force_wake_get() currently returns an integer mask of power domains
> > that were successfully awoken; both this mask and a pointer to the force
> > wake collection must be passed to xe_force_wake_put() to release the
> > wake reference.
> > 
> > Create a dedicated structure type to hold both the mask and the
> > collection pointer.  While this change does little on its own, it will
> > make it easier for us to add scope-based cleanup of forcewake in the
> > future.
> > 
> > FIXME:
> >    For ease of review, this patch contains only the manual changes to
> >    add the structure and change the get/put function definitions; it
> >    does not build on its own since the rest of the driver is still
> >    trying to call the get/put functions with the old signature.  The
> >    next patch contains the coccinelle-generated changes necessary
> >    elsewhere in the driver to adapt to the new interface.  The two
> >    patches will be squashed together when applied, remain separate for
> >    now to help reviewers.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> 
> ...
> 
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> > index 0e3e84bfa51c..86e9bca7cac9 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > @@ -15,9 +15,9 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
> >  			   struct xe_force_wake *fw);
> >  void xe_force_wake_init_engines(struct xe_gt *gt,
> >  				struct xe_force_wake *fw);
> > -unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> > -					    enum xe_force_wake_domains domains);
> > -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> > +struct xe_force_wake_ref __must_check xe_force_wake_get(struct xe_force_wake *fw,
> > +							enum xe_force_wake_domains domains);
> > +void xe_force_wake_put(struct xe_force_wake_ref fw_ref);
> 
> but is it really necessary to change signature of all existing xe_force_wake functions?
> 
> in my previous attempt [1] this new helper struct was just initialized inside the CLASS
> so we can start use new approach and still use existing xe_fw API without any massive changes
> 
> +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
> +	     xe_force_wake_put(_T.fw, _T.ref),
> +	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
> +	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);

Yeah, that's a good point.  I had considered creating a different
constructor that called xe_force_wake_get internally (which is
essentially what you've inlined right into the class definition here),
but I ultimately went with a preparatory refactor to keep the
introduction of the class itself as simple and easy to understand as
possible.  But you're right that it's probably unnecessarily invasive
(especially with all the coccinelle transformation), so maybe it would
be better to go back to the alternate constructor approach.

Since this kind of thing is still new to a lot of our driver developers,
I think I'd still opt to explicitly define the extra constructor as a
separate function rather than inlining it like you did here though.
I'll probably do that in v2.


Matt

> 
> [1] https://patchwork.freedesktop.org/patch/625116/?series=141516&rev=1
> 
> 
> >  
> >  static inline int
> >  xe_force_wake_ref(struct xe_force_wake *fw,
> > @@ -56,9 +56,10 @@ xe_force_wake_assert_held(struct xe_force_wake *fw,
> >   * Return: true if domain is refcounted.
> >   */
> >  static inline bool
> > -xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains domain)
> > +xe_force_wake_ref_has_domain(struct xe_force_wake_ref fw_ref,
> > +			     enum xe_force_wake_domains domain)
> >  {
> > -	return fw_ref & domain;
> > +	return fw_ref.domains & domain;
> >  }
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > index 9cfa28faf7bc..26df4adba4c5 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > @@ -107,4 +107,19 @@ struct xe_force_wake {
> >  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
> >  };
> >  
> > +/**
> > + * struct xe_force_wake_ref - Xe force wake reference
> > + *
> > + * Represents a wakeref for a subset of the power domains belonging to an
> > + * xe_force_wake collection.  Returned by xe_force_wake_get() and passed
> > + * to xe_force_wake_put().
> > + */
> > +struct xe_force_wake_ref {
> > +	/** @fw: back pointer to force wake collection */
> > +	struct xe_force_wake *fw;
> > +
> > +	/** @domains: mask of individual domains held by this reference */
> > +	unsigned int domains;
> > +};
> > +

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
