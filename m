Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A649BCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 16:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6241310E719;
	Tue, 24 Sep 2024 16:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYpQ1q5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3168E10E719
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727194081; x=1758730081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yOpyiHhuua1y4e8gtjkNWcOlNcqwC0HjOWAn/DwJ3vA=;
 b=UYpQ1q5Cu5rxMN4RwmDdEybJTx7C++/rhj0ywQDVV7Cal+7OllA/dbdC
 GpFv0g2HQFfcAgP2M5xBYNSsfXdYh3bsyVzjYFRQn/dq8VGkTlAQFOT4o
 3u0qCAY0napehGlel0B8ebeyM1d/xmEn7rCH/MhOlFMwi+maQ5a+Meta2
 pWcoRqEIolLSBYS05HWIUWp4og5+lEvgwGt1ZCSOULp4V1leLNEugl0fw
 XzmRtQ6qqBsVBgIp21i5DiwlJ7k8WRWR9OIH6ckQ9QN7UKhbc+66/qfZv
 BAaU7P4BDjT1IgUVsz4S7J64pglwjj3A3c08l7DSQ8HAEkTog2Lt5Q+Tj g==;
X-CSE-ConnectionGUID: NVWkPZkASrigS4pNFsdKag==
X-CSE-MsgGUID: BS9z4DCeRgqg0FP0VxlAmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36769211"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="36769211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 09:08:01 -0700
X-CSE-ConnectionGUID: zlTzsv+6S2amgslDPIopXg==
X-CSE-MsgGUID: C45qEd8KSnmziSktdBt8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="94790938"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 09:08:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 09:08:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 09:07:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 09:07:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 09:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnMMZCFGy0JYJHoCz7HFvdzm5zcGflz/sYUsPOB7c9lIWzj36tFK21/US6/bqMeYCasLBnzEJhZ+ZhQuMRyxY7/+7SalYGaP7mm4YRcKU7l/yCc+c/BN391fqJ1GXTOkt07Kd+kls0+u99kUBPjiYXGDwqD0l+YSoWdS01RvEVGhmPQevK8ua/CQlU/dm4nT2+RbKwpmndLlDai9hQlMTeKvpLQUfAAZG2dxQTXpstUtjCH0gYh0QJSpimHXCaQZa8VGLmLLPtjx7R19G3V+CBGaLBkjbejmvsAqK4MGlQiJAVSAY9UJ0HGdX13F1JrhdYxrlV3nhNzUXArnuNkeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13ZerdUl1zqLYXAko3WOjJo40pPAyy+vS7TU9OrKOFg=;
 b=cjpeem3Aefjedp4mg3z4oNdHo/GPOvVWeCBlFFTeHslNE7tuYoIz8DIOQ4GawgmPqvffn/LbHLE/4e57YT0e8wS1/Kab9++W4hP9leDPU0lOoGzjIBH1i72uRrn4HTRnawuq6smVS8mqajkwrxjusled7HsO86kiZnbW6uGY9v1xl8P84sH14gHVxzO6UMxRWFtXIv4L/e/2ayOJj70l1x5ZZqGwJ8WqRvKEbUQN/z6Bod/tPaVFw7w6mq75bPMFv+XS/CeLtyKJtwkH2nDCOX3iq589IH5ta4UZDBuxmYnxV0Zg5zmx+hdtrXVLQ9Q+jrAwRcE/B9XJMRzfweI/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 16:07:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 16:07:51 +0000
Date: Tue, 24 Sep 2024 16:05:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/queue: move xa_alloc to prevent UAF
Message-ID: <ZvLjXzVdxcqVeXpc@DUT025-TGLU.fm.intel.com>
References: <20240923125733.62883-3-matthew.auld@intel.com>
 <20240923125733.62883-4-matthew.auld@intel.com>
 <ZvGR4eIX2jsl5sD4@DUT025-TGLU.fm.intel.com>
 <2b406f25-3a2f-4e9c-8617-79641c9e6085@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2b406f25-3a2f-4e9c-8617-79641c9e6085@intel.com>
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 24014368-7178-42cc-5bd2-08dcdcb30a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hm94hkGShRyP+WAVdpCWqXSoMCcb3Er+SisKyc996+2qkMck1RyF5CBWVPlv?=
 =?us-ascii?Q?ZaPpTp7ZVG/WcdvdGTwj/E97sPSJVjsIwlwgoOsASu6kjl4c4Hi2kl4SodZp?=
 =?us-ascii?Q?Eq86WE695DY43PBqo4uaU11wzDLubBqExlOdAKCRDeKWJUMXkh0L5Qq8Qd+A?=
 =?us-ascii?Q?rZf/CqC64zPUot0xJ0SJkSYDRmKKk+VzxqgxMFfpEVd8lYFIc8EA0PaBgEqP?=
 =?us-ascii?Q?kmJ897yeQhiwC7yCC+Kul3y055MAf1NmUoDf76VY44IJ85SVFOR6Tr6ic//l?=
 =?us-ascii?Q?B6p9/VDL2+W26Ll+rDYpOJGMpkp6WVNE2if1FlozlneKALL9uvKFjQTakQs1?=
 =?us-ascii?Q?DRMI8HPzfoF9aosKhTdD34ozBscFvc7Ap3VTEVyc6ENJypU7Xm5ah4wN6Hv8?=
 =?us-ascii?Q?44CJuZ6Ruy/y2Yg9kzF9PcBMEuYFaFZSiCdX8NhPq6U5wSSOKG4lf53K88DJ?=
 =?us-ascii?Q?wscYCWSGbQxsveSKYuugeQfF3cCPuQiHYIlyWlnPFuVkkCKB4NWTwQNsDle3?=
 =?us-ascii?Q?sBJosBH+agcUH9VPh+SU1SNjIZXXQkjQYs8T7B4mrTZ7wEHmMW+fCqRjRoUI?=
 =?us-ascii?Q?/F01+bAg73KY/kqt4wg724wZDaEhpPZTAd044c7M91Ibus4H951xychK7Lpj?=
 =?us-ascii?Q?K2niMT9xSio3WaPyzZE1/tXeAtUtwN0meQSBRy7tUk2qapmbJ8CFKOzCnwfj?=
 =?us-ascii?Q?OjgzMrfN8cQQceBDii57Tb+bKPofx/J0mIC8ANNn6AQE5BDF3CuEM+5iyaTM?=
 =?us-ascii?Q?VS0WEVMQh1hgvYag68Wbet48oW4UFJrz7irCwa2EgYqtQ2ZYgpEFDj0g2v2G?=
 =?us-ascii?Q?U2NejrnzP+wBItly54Ep+PSOLAtIDmozHnj+QE041KjjfWnQZ/4d2RTHQDZ4?=
 =?us-ascii?Q?a7ou137KjH8QY6NpMCSuA5kDK4wPJyLfjIIRwV1ulxux/6VG5Ggx3kiLyIMG?=
 =?us-ascii?Q?6t3OgfsrJc44U2SsVoq1vTjSGrZRjyEnqPR7mokIQqaHidYH1IM2UuTxRCwB?=
 =?us-ascii?Q?/Bmkz+xkG1TRxMtFZnmI07UN67xOziex+qSieNN2SxZ9oGtM43VW4p/p5kMO?=
 =?us-ascii?Q?dMdhMlQKBMaxhY8QDDclu4scN60rURk/dbP4235Ou/sayWFqPK8hZA8RCafq?=
 =?us-ascii?Q?oECRgWVQ7dADUOtpIoNCX0fh+4E6Cs7IjtcMf1AU76GPOD7VM6ytLJBMLRG1?=
 =?us-ascii?Q?woOsjO6JxUjBABoo6bmU5v7rvQoi1+inj4Nkm0tjMIF1VTvOK/gvwGW85Uze?=
 =?us-ascii?Q?QihK7iLc89ohJJN9OVmGeFWisilgqWEfSw/NzXhnbSFUERwf71lgG4G/cAFq?=
 =?us-ascii?Q?nMkOnUp9+aEzG0eaTESia/cEq7ap74B0hdmWOTR/okdbFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHyFCGVBC+ViG3K/10uXdOWF7ZXZLJ973Jm8ieWvEMaqqafuc0f8uSAb5jag?=
 =?us-ascii?Q?pouNF/Ra20uOshjTx7Srh69I/G8D0B1ZxQ0pB+fMriqhxdwRYIHWmmcTt7gA?=
 =?us-ascii?Q?qFvJuZpi+pJEuyJ7LxbRHELMVeZ7DiJYKEIIVG5zdydxoa86NCfKVj0nwuvf?=
 =?us-ascii?Q?7UkGfrXx1osdcI9sOXq3i/zMEs7dP40dLUWbTmcyDnU+ab4JUueYnHlS1p7g?=
 =?us-ascii?Q?y2xpW9GyXDTyTBzk8LBvD1e8HdoZjR9+WJ5Qd6F7Yf3tx6qpmWM9WrYI8P8N?=
 =?us-ascii?Q?MMTZEtR8lHIb4At4UF0Ax7OZk8Qqhy+W+TSczB1vXTEiAw3LqhGxUAZSOhO9?=
 =?us-ascii?Q?d8FD3yYUQ9WG9ok9liWoAYcfSN+vZyyRBjvlStksp7qkAh9Q5RLrGgdGmYx4?=
 =?us-ascii?Q?D6XU2PMJ1wrmV+evM2tDmPlgSEWzutD16VdwaSqwgu49LAOEzhbRj+XlDhsY?=
 =?us-ascii?Q?dF8S0/hwAilvxatciVBwynHpg//LyT58i2LpSdc7se2r8EbDEycSIy1V5UsV?=
 =?us-ascii?Q?v5BnJdc1k/iVlc5COmQ2gthXgZsFB7agL8qBKv0KRKZPfhyZgr8TmkfRYwrl?=
 =?us-ascii?Q?TxIKUa9l/wxbPy2bT3NJ4naupuLjSQ3DcOztIIUvuuiZj2QrB7PmfhQMxFk3?=
 =?us-ascii?Q?A+HTpGhfmHR8vBJCvCAwK5ut3q+PAZmVuYNNVa6lotwyOcPU7STq1xUiqY4f?=
 =?us-ascii?Q?iqWSRwIZ9ZhMrFC6Iw3IgM14qdrCf4C9krdvAA2m2djyhiqLqCql2eYkYapc?=
 =?us-ascii?Q?HAjjWgzTj3p0hyFRzlA6gDdUQjEyuQaGWqUuBGmrEZlj/4q0sdXT4TbjtVCT?=
 =?us-ascii?Q?rvPUnMRfxhGdfbJSsB+OK0rYg5qOSSachK61NpKe3ich8XHZ19f/vG5Mdkvq?=
 =?us-ascii?Q?uHFqtYI+jZLPJWsEH5SgWrT+tcF9lnh4lqFTmtqfB/XI/4myPAx8DqJbb4zH?=
 =?us-ascii?Q?YtQVuZGKnEvzev83C0GMjK4VFNcFFX3qzZP/Rn0dOQTX992BhxG59znhn0z4?=
 =?us-ascii?Q?pO8CvzDZNEvHaR2ihj6w31pnc2/r2tm74agJG60zooVrkW3wzOqK7ULW60SN?=
 =?us-ascii?Q?syfowiPmhLiX2YA6ZVnOU4BfD20F74ByDhz+MU2o8rxqWfORgFbxwNoijv9I?=
 =?us-ascii?Q?rQMopfpuC2yphnqfjLPywCLzavZcx3CG0bOXo7+5efwyeygeAsH9+v3ViwE8?=
 =?us-ascii?Q?UaWiTMoKrM8hzlwoeTirvcyVxOsxpRTo3HsPFZ0n1EfeBZXHFy+Y8MD28zMe?=
 =?us-ascii?Q?bzg+aWCq/Oo2equ5CRGE9jWo3N1jnw6Ri5CxH8DQdIbbA7e5osYZwlLPb8v0?=
 =?us-ascii?Q?tC2bCxLT4sIDIUmkeodqYU6rn2bXgUBhVOzCui0K48Nj6kIoSLbuXGD2KfhF?=
 =?us-ascii?Q?sLsDfoTUK4+y8mNaiZIeElTKtK/4rjE7udaexV6HAKBDgkGXCYhN/Qo/k40g?=
 =?us-ascii?Q?1GcoaQvcYXAcqLL2nUp2hGSnATrUT8beZMSgnncAKX3JbJNmCossSpF3atHu?=
 =?us-ascii?Q?pVHImoLL/el6ts3lxIlIqMACY68fauLHkJk9E0X2tNBZ+7GNR9AfjNqyHFtk?=
 =?us-ascii?Q?RGaCDbhGo0fI9MR/KWsCa86ldzDA9oGo/jpdNKCqP4WNNNT2WERb2rInzVk4?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24014368-7178-42cc-5bd2-08dcdcb30a61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 16:07:51.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTWkqs7Bg8P0ZNybOyr5EEs6lnZCJopKN2WB3BwCTYcF4Ae1K5KKcHoCT4opOP4+2zI7pcY1AR+qedgWPQ6LSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
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

On Mon, Sep 23, 2024 at 05:09:01PM +0100, Matthew Auld wrote:
> On 23/09/2024 17:05, Matthew Brost wrote:
> > On Mon, Sep 23, 2024 at 01:57:35PM +0100, Matthew Auld wrote:
> > > Evil user can guess the next id of the queue before the ioctl completes
> > > and then call queue destroy ioctl to trigger UAF since create ioctl is
> > > still referencing the same queue. Move the xa_alloc all the way to the end
> > > to prevent this.
> > > 
> > > Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 7f28b7fc68d5..a1d4b9b0726e 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -635,6 +635,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   		}
> > >   	}
> > > +	q->xef = xe_file_get(xef);
> > 
> > Same comment as last patch, this looks coreect shall I merge my series
> > and then you rebase?
> 
> Yeah, sounds fine.
> 

My series is merged, feel free to rebase at your convenience.

Matt

> > 
> > Matt
> > 
> > > +
> > > +	/* user id alloc must always be last in ioctl to prevent UAF */
> > >   	mutex_lock(&xef->exec_queue.lock);
> > >   	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> > >   	mutex_unlock(&xef->exec_queue.lock);
> > > @@ -642,7 +645,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   		goto kill_exec_queue;
> > >   	args->exec_queue_id = id;
> > > -	q->xef = xe_file_get(xef);
> > >   	return 0;
> > > -- 
> > > 2.46.1
> > > 
