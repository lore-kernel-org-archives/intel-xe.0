Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512FAE7B611
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 13:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF810E0EC;
	Wed,  4 Oct 2023 13:18:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3110E0EC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696425502; x=1727961502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XwIMLqvmZsfKNqimFri1Ur0mSeQ1QCV4dD1KFZO7mA0=;
 b=VZPM47lMmfN6Djxf/Tuw4WNPXU/1XRDZpZ6cR1GmhRgS/kw7OUOvs254
 3hOQTDAVtr0Nr7OuZfTnJTKjtyF3pZTOo2n5WbIEiSGGacYYf9zyaoh5D
 LJZ9KHG0gDujHH4VKHJG8tQykcL4/ZSWVB/Qwp4gNBNMrrZCAaMyJ1LMn
 1jpEnF0CFOT4SsCckM6gJybRzalyYb4MvFhE2MFHmPswIm4fiEQ44O+Ia
 8JrZlm7RNZkX15tFa0FAfsaxiLk9YvZsAiqW6Sb8cXQhC08eq1dN6pPiC
 EdUcks9Ld8qzb1zrK6mh6usnOAQtaqJjAVYI5Wxo+xLZDusHVV+Fl5Co4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373508946"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="373508946"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751286046"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751286046"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 06:18:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:18:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:18:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 06:18:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 06:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLIXNaa9yknt74GKrjrhcmR6M/UjX100oBytHqjwyHdeNmD6OSb/joZo0Gk9HUb+CajpzBHsrDkBDx/AGfA0Ea10DKN9EM4sGExUXZNS/VY9I6YZ0/Lpkb+kLwfhFPJx/k/tKUgB1yYmHLSR3oBUKgHQohYYd4ZMxoVtk5/d8hUxSv8d1WAraacI5S1IN9WqryuSU5F59q3U9vtTmRmHYxjf+jecB8KaXanF8OBJoxdz4HH3/cXJDfy0tx73Dqqy1HexsRVhi2Et2YrOxu6vy8nU5nDBbebwrekg40mZLKK+mzemOoypxJB/v5N9TM8QMrAcyZwbRJM3P2TJrXG+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpNy7+OUsWPnuS2EmCOjPbhxsu6kmBD/mwm9c03JkjE=;
 b=MQpqNaa/fc6khxswOnBVJdX4uY0Dm4Q4WYxBPLx8bZDpMbjSXnRtjUmuiQf2BTgeYapXB/pktKGel43mVDlZMYW2+uSTvolTCEpuDM2dvvUv7/V9vaXklA/CV8EIin7kCi2KMxMdnq1T01y8atZ6SObPXiunSeGLb+fs38waFFyWO6kYmS0ki4PXDmNGy4oIu/3eU7rAEhPU+2Vdg9qHg6ovM2cKRYGMnujUM+jQyGYF2vMzAIxCVPg58N94ROQXPsU4V4Y1JCBksepItvfdU1pqp2ttosT68H1H3AEMaueivbbFzubTYQB5vllhMWZl8rbmb5S10wZYSTZmP4//6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 13:18:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 13:18:18 +0000
Date: Wed, 4 Oct 2023 09:18:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZR1mFbn3eVrYVoz/@intel.com>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
 <20230929173104.2014590-3-paulo.r.zanoni@intel.com>
 <ZRexCZczizPkWdNm@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRexCZczizPkWdNm@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: b721d2a8-bf58-48fa-7714-08dbc4dc5fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPQ2rcabDYW6Vy88aKE8D3gZN2QBmJuwVbZh2aflENsXxeeOz6P+oaTyvH29qKUT6tS4LV+5DP1ybudu3nENAqwHF71FAV7PNC1q56oRaB0uQEk+omgDJxFgvZzaYZIvuA7aoeOFcP70S76rOfHu5zd9cG9gcR2Y7dcYstCBqBJTZMQB9JqxzPwIgue+HhuMlDVB8rPsstEsTwFkQomDAOxV4Z9otLcG6FEdr7guiZzyZbrnadc6HfNnn1soxx2PGaI+OI0K7aUqwg88t8JunL2mzhFXMmRjS4rmw8y48EibSNXeEay2yjs7ExE07jOGgNY0QoVnhPs71bq+8F09hQJh78TjM0Z9fBHpkcnXWbXOLASADt0aA8hebJabhggU10xzcEcYHjMJ9WV7KWhXxVatEADpDHqy1Grxh2KtF89RKYL55seJp7diAJ5J+qXzENmwLAIoFPHtAt/dtaTzyeo/8mpDfhWQ+Yo9SATgAdiY6pKdAY48vwyi9S1BDTSrVg8z+3SBdlWlJUkUfHc0Qs1MMtDCyfNmnvIRkK9Ba7fv3wjs9LOhoTJAjUBbAClF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(37006003)(41300700001)(82960400001)(6636002)(2616005)(6512007)(36756003)(26005)(6666004)(6486002)(316002)(38100700002)(6506007)(478600001)(86362001)(66476007)(83380400001)(66556008)(66946007)(44832011)(2906002)(8676002)(4326008)(5660300002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8ExvH47UpoZ4uW4UMAz24XItMXaMVpHyZb9vbqsd4vl74qvM6JVi3WGfbng?=
 =?us-ascii?Q?RxMRGQtimxe/yQoJfzg03Yy84Q9F/tlwTFjEYnljtXKoaxaBoM5IRh6x1PLs?=
 =?us-ascii?Q?mU7rgdoSW9APXZol7ALtAcq46Ybn1Qwl+SlFdWPpimbowMCnl0YPZXVaeDNf?=
 =?us-ascii?Q?7XTiy9m1/aDt/p1fRWsvBeO5EI9PU4+VkyPd9k8c32vGIbiECQI24XF60uCC?=
 =?us-ascii?Q?pVdmTp/6c9uZD75FBlrnWtTVSSEtWi5LA5FFmfPzcfFDj8McbT+eiQK+Qw00?=
 =?us-ascii?Q?3knNQ3gIUDruo0jIy8vyLOo1LgwiIjMgeaHGHJX35izfaOIvK0a8cg1MMLgH?=
 =?us-ascii?Q?lHkbsxwEQDIl7CL5yvv73fOBSlaC17aymcwyX3xFMQ7o33kUJdb+zYfs6juy?=
 =?us-ascii?Q?R8KfsZzw/BiIXHxJiTDUrVBFV77jTdZCnax5vlmBiR8ZfcnSoDbPPLZJ40UW?=
 =?us-ascii?Q?C6zEG1VrZS1/+V48v4PHz7Ubct5lygSCjbJvc2OhwJ4eubI6JUlsmPhPaD7d?=
 =?us-ascii?Q?By4BfJuI2Xs/ev3p1PomSsdW4lXPaG7YDf68XGRi8vW5buiT7b/ya1mZZYcT?=
 =?us-ascii?Q?/E/F1+ulwaUt7MgD6qko9iGi7oss/jHOmGSF828v+KIbVFNi4xJrmGnPKzA0?=
 =?us-ascii?Q?8xDD4XnIY43YOdr6q9Wd5OrjcZKHleChOlkTegGcV5etQT+cCnBubd0icuCx?=
 =?us-ascii?Q?aJmogl6L8DeqfVxMg2WfzfM9wpzYBCN5x37Wtg7CEf4M5wDW1mGX3P7uVVUs?=
 =?us-ascii?Q?4vk/7YbtT+utEj4dGAlUUf+mnb5rZJsiuARcWKKoJCiJ6UHwOnhVRKlMnJO4?=
 =?us-ascii?Q?FIRvG6mzIeGPpA9h/lKK17kusaKe+7jNqs50V7geTTrbPaScNQS5CH/r4QKS?=
 =?us-ascii?Q?QasUyfmqMf7XcNvk8qbbKSIoisWnrRJ2JHOxQO8qz4CD6qzhr225KeqcGIL3?=
 =?us-ascii?Q?ikKCZSLECaWOFigH3GeVv5lTw0NWdj1OeoODk2R+5Tb9FUjGPZLmPpQQy4/s?=
 =?us-ascii?Q?DJvpMQNQE6cfOSHgRDpCx8Y5CHWpjIFlIJIJBT4Tc23uwv5p5MxdZaIHViJr?=
 =?us-ascii?Q?csmbR2t4E71wYCnxvZbQVD9j2Dt89IaiIYu0M92h3fnsXApSBZur4LA0wO4m?=
 =?us-ascii?Q?aJqeCS4LJ40xLWvJ1czBvgDwai3OMiEldY/DSyOnjt40ZlHTLCaEmrCd4LRR?=
 =?us-ascii?Q?dTrzSFhbWPFMbyGYQBIj1upS1bQwHK6b5ds4g4KRFzYbn72h9TOrSocDSzDk?=
 =?us-ascii?Q?pIRaWhfUhWHTyKJ6gob9e22riDyDNTf+hFPy8lDNJyiLi4NjQt1bcg8gxR4W?=
 =?us-ascii?Q?BMJi6mgbzBR3qL6nF81wDsPrx3URNGEdLddMUMxxLrJZdxcyDwMt3PvF1Qg7?=
 =?us-ascii?Q?92oSP4VW7+tcsW99/2izzWCFmAvSQXvDX45vqwpARAbv8cM2Pasc/VNsUizL?=
 =?us-ascii?Q?tHtw1pdBafpZ7QK8xIz/yJqByY6sQhv7nMy8zodTYbisyKjAupBvtks47zrF?=
 =?us-ascii?Q?Llzv1xnc460WmjbFHEZxCk3ST3qmbjlyowTTYWfCuu0IwwlNuV65jP2WCo7S?=
 =?us-ascii?Q?fDE0DCKmZwP8dWFRLBpiQtlapbz+cU/eZisFy8vy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b721d2a8-bf58-48fa-7714-08dbc4dc5fbe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:18:18.5877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p56sVIDfhiO9J6rfCmhXXV/TRHCKBy4WA/xKT7ySMc9DnPqc+zuWckKeSjjF712MsdhWcgdh9/qGfeBmF0hOpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: fix range printing for debug
 messages
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 10:24:25PM -0700, Niranjana Vishwanathapura wrote:
> On Fri, Sep 29, 2023 at 10:31:04AM -0700, Paulo Zanoni wrote:
> > We're already using the half-open interval notation "[A, B)", that "-
> > 1" there makes it wrong. Also, getting rid of the "-1" makes it much
> > easier to grep for the logs when you're looking for an address that's
> > the end of a vma and the start of another.
> > 
> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pt.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 4d4c6a4c305e..70a8bd3558c2 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1265,7 +1265,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
> > 
> > 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
> > -	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
> > +	       xe_vma_start(vma), xe_vma_end(vma), q);
> > 
> > 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
> > 	if (err)
> > @@ -1618,7 +1618,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> > 
> > 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> > -	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
> > +	       xe_vma_start(vma), xe_vma_end(vma), q);
> 
> LGTM given it was intended to be half-open interval here and in
> xe_vm_dbg_print_entries().
> 
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

pushed to drm-xe-next. thanks for the patches and reviews.

> 
> > 
> > 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> > 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
> > -- 
> > 2.39.2
> > 
