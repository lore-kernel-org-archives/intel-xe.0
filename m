Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B2C83F37
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 21:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D666410E070;
	Thu, 31 Aug 2023 21:19:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7BF10E070
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693516744; x=1725052744;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DWR253qk5kGf8qCAAMtIGqEGX+VJz+5Pyx+oqoaUHjc=;
 b=MQaek0bY0b4hTmqX1BBfC3wWIE/hjzpxdzN5yKsv1O9gmp2N/YAvy3aD
 t3cx8r6pYXFtNbukcAm4E3fgfvAOsgiQMCKbVUdHo5LFSYtK/GbsZCBAy
 NNQB7F4pxb1XhOcDpj8za5gHhGMNpPTIsl5g2eLJ8HgZqC8s/Q83VCMJy
 RfarCdqNjrXQ2/ZEkD3LexBjL1TMEoHj29T4DUV7WxIOYi80VgCpBzesj
 0ZKZ/JiKCV8qqkdObXi1xX8gsDFhdMmvQyxG1/CjhinCsUuZaN3QiflbV
 D7nRGlePYD/TULdhTI+KEk4ZRtgyZ7V3Eu6SbWvDORiurBi8NXHI/Zpk4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442467769"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="442467769"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 14:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="829867264"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="829867264"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 14:19:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 14:19:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 14:19:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 14:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBa9OAliBM5ELjs7dG8Xgj4MgQO0Fk2St77ty3hWbXKFyNYbMzlF3pefHQNBXsxm3chJbawiU0WnNZU3SgJDtyq4/GM1qkZAclQjhXjSrw2CiUKw9oVtpne+Xf+pA4Kr4q/HiqRS9quVVSImj7nB3mqnyjl5mAxqTVaF2PskbvCgR+43FchSxrwrKlI9iToag4UB6K9NV1S5TKRaBN1obGPJOermHPEXJwW8W/yq7tBP79h4eybOAl8Am5ycye2b22+6hB32HFvBOOf4ZRGaarh2PYP/1Jm9CBRb2CA3KFMzuPRl+448IYW/3FS/W2U2sYggGdGKj0rvC+S/ESelAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4FsX2REXeP3ZO3uyaFaLFsDL1R3hpJjrQzQBe4iuhs=;
 b=Aw8GK+suQVZhFzEXsg21rnAM9FwbPwCAzv5/JiD48U0sy6syUcTmx6lL4QGd85jSWn/YB4osoGhsE+QqrMtJpB0YLKgIcUwBshO4dLJWEwhprNo0jxDiBVojUN4lWZMl/RKtuynZOtInqXtcAr5BANRHvAUbZXrAi9LAu+lnJcY+ZLBd+imWl54dGmXtw0PS0GtP5g4zrMPCwGpXa/Zq3riMVdX2IGbnM4PGPjpKFgGyE70olNF5aurjgx+Ot1h2Xoo7js6JlmgSekdlyy4+mvyYLQeb7iNU/ICiJuSHS1MzZsm3mvj9H+62SW/v3/EAAGROAiqcn325U3f7MXCcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Thu, 31 Aug
 2023 21:18:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 21:18:57 +0000
Date: Thu, 31 Aug 2023 17:18:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <ZPEDvQ3jSK6tqHMC@intel.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com>
 <ZO+u6e06mWzZqX2d@intel.com>
 <CY5PR11MB6211EA7222270115D2E3DCFF95E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211EA7222270115D2E3DCFF95E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 275beaed-b492-466c-e2ac-08dbaa67e359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHh7B+e+aBPu/4WInJlAZULdZf78Yfbonn3jOZM0oqxRm9OB7i/gBB3LgyjNaygesXvY9gbNx4/wD76KofaxXjhs2jPmDIvyixLC+HQyxJH94/WBREtvxKlqR8lCRDEtAcYKU68FH0Bo2dVtDZTMuBfYNu3B4sg4Dh+uXH89nBCUFU2K9IHrti3nXXdB063f/on/NdycxFhTU+DEaCTPn5W7LchPr+M3LNlvYqnzpKAL9y7C31VeizTV1208egfE3IU799EL7BILtvdUyrp2+IR0gRW9Jc3lNrp9aTnwYoCd2KtFTrgmLxklZ17Z2lR7EF5WLchCzvmvMShmwZcMPLRtdlrPNMS39HSyokBjbM9ZMbQSIydlHlMyia5roIfRIasoKDH27GgwA6OPtmKeKcYpH4iKF6R4Xa9wwCMvpvTYwTgDr5XSeF2MSd63LalxaW0BGg6uxWgeFtANGJV+iWEVupHfa6n2I+LKleZMozfyP2TvCmhOn+5O39CDeYEl32i7Kt5Tw5reQK6bygvGORxoqY6fPtGw+MmpQhqdRqAvNcvLTPVzJMhia6OrXVGC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(186009)(1800799009)(451199024)(8936002)(6666004)(478600001)(53546011)(66946007)(66556008)(6506007)(6486002)(66476007)(54906003)(37006003)(6636002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(44832011)(26005)(83380400001)(5660300002)(107886003)(36756003)(2616005)(2906002)(15650500001)(86362001)(30864003)(8676002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4K6F7sBJJ+2FJ1Sl4KTKnLpnDUxJlazgrIW28BeePB9We2PI3WtU3xLwgPuD?=
 =?us-ascii?Q?IpVcXSzCLTOxBpFCwSd4k9Q9vuqMSnRxT2UEdcblSe22NN0rLq7TvnTnJhMm?=
 =?us-ascii?Q?0nsRVzJztqNgm48oSc9HPliy12P/GcYe7QlBCbTFqBztt6vqsvyM6CvbbCI1?=
 =?us-ascii?Q?ioCXkNa0EKuljcnEqDjjz9MGeAaVeeIGT+8XKQItmJ164I2tUD8fM6Ta20Pv?=
 =?us-ascii?Q?CkfNF2kDs1W08+k/rhuYCPH/qlYbxSV1AodbFGE70PcPj3T23G3hyHydvugE?=
 =?us-ascii?Q?i/z0SKc7xXtJjBHwG2B/bzPqu0EKaE0lAupAJBcbUZd8ZZq5XMgV52jsIxDa?=
 =?us-ascii?Q?4SmRjHymQJhH8Js2sZCaDULzPimrs/nxuTLUSiA1DPdK2nlNrKgquBpNFao1?=
 =?us-ascii?Q?+1PMYvX15BGByPnq/BNLTFpq4foTFqq/ujI8zmtIhz4xx/hbKhpXA6ZPOa5X?=
 =?us-ascii?Q?sfe47LTp3KHNmSInieuvLXtJD2FgvWBVKu2rJXDD0A1Bv9sIsWkosW7xN0NQ?=
 =?us-ascii?Q?i/3/uEYbExuw6herIuL6+dNVwj5N5/V6PgzunAFgDziaojX0+2MYr5dXjNjI?=
 =?us-ascii?Q?ZmxkKx6+d5UhmSSNFtLsVJhXfVuJ3yjy/acO4NbjiPPAET/ooz1XsI4oC0uY?=
 =?us-ascii?Q?8SB1zgmi1ZyVks6KcrSot4qrsRvGPePJ3bxSE+hvQn2Isu/f7euAK/qh6z7W?=
 =?us-ascii?Q?gjUVYZ3ujnBSaY+9tSmmQgVM5jEx63btIk7A2/z8koDx39SaMGm2X8hvbkGh?=
 =?us-ascii?Q?StujmB+x6y7VqwXCCLcCbchEiyD4nZADGpMyNeFZ4j+t0MazCbVUqE8P7RC9?=
 =?us-ascii?Q?XOzN9oJnV20YR+MN4IrM36bDD3QJU7xf2HH6sqfHbloXbYhmKVD0hzWBNJS/?=
 =?us-ascii?Q?pTHmAlB75Un4VagsPrXj5dusyzW/ARtsyWAChdgBmX5jeF2yowMjKzx9UfV5?=
 =?us-ascii?Q?PSGA1AqF4U0LcxTO2PZ7Ee3OxoPyjtAfkwvjkmNKCkFXJazHHIVtjQxP4+rd?=
 =?us-ascii?Q?oMhOEA7/Vuoc/6+en1OXQYA9mVCAbF0RhxrMFmprYvzPhS71hc0jjHv752lT?=
 =?us-ascii?Q?O5nEcJI27tLWZPxW4GHUPpnBGfFhD78PVc3C9mC6JF6gd3EQ5+OO8dZbGtiD?=
 =?us-ascii?Q?Gjm6P4aKWwlFT39fI9cSZdgbeOgKjGyQdsIM07l5iJKQL8XMNUQtzl3rlKki?=
 =?us-ascii?Q?ViP/UQIFUlfCtOxu9FDd48uG03LJ9VsGLHsIhPX+58GwZyDSwywiECts18iK?=
 =?us-ascii?Q?v7GX1YjwRB6eBAip0M6YlX8ZMwP76CD3svWN7BWXy/KU1QdsWQaIlBUtEAGG?=
 =?us-ascii?Q?8632kaQA0Bs1UQsXa2L60ABotj09HezgaSn889H5Su2dgFzHrmYPFh6JNm9p?=
 =?us-ascii?Q?/1v2gcr4moYHMLOJItC4atEs3J3wwxgJrSk/8mim77//wCeJBMt8GBd2zuBc?=
 =?us-ascii?Q?6lGiZZ4gy4t+idYC6ReOayvcaj5t/0T8MyU9lCAdYMeR6gh//xrUaiujdhmP?=
 =?us-ascii?Q?soZyPQ0bERCsOYWMe4ZBDbMsuhrJNSpWWVXgSRQdjcNGW+/Gpis1j94pqzxv?=
 =?us-ascii?Q?wBSeveNZHWJRvrOTbL7pigGHQj7BIBc6DZ+5WL8d/VuoMxxvuRn8ZnpCjvTM?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 275beaed-b492-466c-e2ac-08dbaa67e359
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 21:18:57.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zD4Tue9Nj5hexq2iE9ENLjQESkwesRA8q5kkJqNTpfjmISewDzN87yd6L01RRLQNoEjRM4RNLgcPvDP38VUIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 01:23:40AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Thursday, August 31, 2023 2:35 AM
> > To: Nilawar, Badal <badal.nilawar@intel.com>
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> > xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
> > Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings
> > on rpm suspend
> > 
> > On Mon, Aug 28, 2023 at 10:00:31PM +0530, Nilawar, Badal wrote:
> > >
> > >
> > > On 28-08-2023 17:46, Gupta, Anshuman wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > > Sent: Thursday, August 24, 2023 11:16 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld, Matthew
> > > > > <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
> > > > > suspend
> > > > >
> > > > > Release all mmap mappings for all vram objects which are
> > > > > associated with userfault such that, while pcie function in D3hot,
> > > > > any access to memory mappings will raise a userfault.
> > > > >
> > > > > Upon userfault, in order to access memory mappings, if graphics
> > > > > function is in
> > > > > D3 then runtime resume of dgpu will be triggered to transition to D0.
> > > > IMO we need a configurable threshold to control the behavior of mmap
> > > > mappings Invalidation, if vram usages is crosses to certain
> > > > threshold, disable the runtime PM for entire life time of mapping.
> > > Agreed. Other option could be disable rpm on server descrete graphics
> > > for entire life time of mapping. But mainitaning threshold is more
> > > promising and gives control to user.
> > 
> > what use cases we have here for this?
> > I believe that for discrete we could entirely block rpm if we have display or if
> > we have shared dma_buf. any other case we should handle?
> If Discrete is used for display then anyhow display is going to block runtime PM completely(be it PSR or Non-PSR).
> The use case is with display turned off or with hybrid gpu use case.
> Currently on Xe we are missing to have mem access ref count on mmap mapping and therefore mmap for vram bo is broken.
> dma-buf will be also the use case in hybrid gpu use case.

right. unfortunately we don't have the unmap callback.
We could maybe get the reference on a new xe_gem_object_mmap
and just release at xe_ttm_bo_destroy or maybe at xe_ttm_bo_delete_mem_notify?

for the dma_buf we could probably hook the get/put to the attach/detach?

> 
> Thanks,
> Anshuman Gupta.
> > 
> > >
> > > Regards,
> > > Badal
> > > > Thanks,
> > > > Anshuman Gupta
> > > > >
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_bo.c           | 53
> > ++++++++++++++++++++++++++--
> > > > >   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
> > > > >   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
> > > > >   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
> > > > >   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
> > > > >   5 files changed, 85 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c index 1ab682d61e3c..4192bfcd8013
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -776,6 +776,18 @@ static int xe_bo_move(struct
> > > > > ttm_buffer_object *ttm_bo, bool evict,
> > > > >   		dma_fence_put(fence);
> > > > >   	}
> > > > >
> > > > > +	/*
> > > > > +	* TTM has already nuked the mmap for us (see
> > > > > ttm_bo_unmap_virtual),
> > > > > +	* so if we moved from VRAM make sure to unlink this from the
> > > > > userfault
> > > > > +	* tracking.
> > > > > +	*/
> > > > > +	if (mem_type_is_vram(old_mem_type)) {
> > > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > > +		if (!list_empty(&bo->vram_userfault_link))
> > > > > +			list_del_init(&bo->vram_userfault_link);
> > > > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > > > +	}
> > > > > +
> > > > >   	xe_device_mem_access_put(xe);
> > > > >   	trace_printk("new_mem->mem_type=%d\n", new_mem-
> > > > > > mem_type);
> > > > >
> > > > > @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct
> > > > > vm_fault
> > > > > *vmf)  {
> > > > >   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> > > > >   	struct drm_device *ddev = tbo->base.dev;
> > > > > +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > > > > +	struct xe_device *xe = to_xe_device(ddev);
> > > > >   	vm_fault_t ret;
> > > > >   	int idx, r = 0;
> > > > >
> > > > > @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct
> > > > > vm_fault
> > > > > *vmf)
> > > > >   	if (ret)
> > > > >   		return ret;
> > > > >
> > > > > -	if (drm_dev_enter(ddev, &idx)) {
> > > > > -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > > > > +	if (tbo->resource->bus.is_iomem)
> > > > > +		xe_device_mem_access_get(xe);
> > > > >
> > > > > +	if (drm_dev_enter(ddev, &idx)) {
> > > > >   		trace_xe_bo_cpu_fault(bo);
> > > > >
> > > > >   		if (should_migrate_to_system(bo)) { @@ -1127,10 +1142,25
> > @@
> > > > > static vm_fault_t xe_gem_fault(struct vm_fault
> > > > > *vmf)
> > > > >   	} else {
> > > > >   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > > > vm_page_prot);
> > > > >   	}
> > > > > +
> > > > >   	if (ret == VM_FAULT_RETRY && !(vmf->flags &
> > > > > FAULT_FLAG_RETRY_NOWAIT))
> > > > > -		return ret;
> > > > > +		goto out_rpm;
> > > > > +	/*
> > > > > +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > > > > +	 * vram_userfault_count is protected by dma_resv lock and rpm
> > > > > wakeref.
> > > > > +	 */
> > > > > +	if (ret == VM_FAULT_NOPAGE &&
> > > > > xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count)
> > {
> > > > > +		bo->vram_userfault_count = 1;
> > > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > > +		list_add(&bo->vram_userfault_link, &xe-
> > > > > > mem_access.vram_userfault_list);
> > > > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > > >
> > > > > +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> > > > > +	}
> > > > >   	dma_resv_unlock(tbo->base.resv);
> > > > > +out_rpm:
> > > > > +	if(tbo->resource->bus.is_iomem &&
> > > > > xe_device_mem_access_ongoing(xe))
> > > > > +		xe_device_mem_access_put(xe);
> > > > >   	return ret;
> > > > >   }
> > > > >
> > > > > @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
> > > > > *file_priv,
> > > > >   	return err;
> > > > >   }
> > > > >
> > > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo) {
> > > > > +	struct ttm_buffer_object *tbo = &bo->ttm;
> > > > > +	struct ttm_device *bdev = tbo->bdev;
> > > > > +
> > > > > +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
> > > > > > dev_mapping);
> > > > > +
> > > > > +	/*
> > > > > +	 * We have exclusive access here via runtime suspend. All other
> > > > > callers
> > > > > +	 * must first grab the rpm wakeref.
> > > > > +	 */
> > > > > +	XE_WARN_ON(!bo->vram_userfault_count);
> > > > > +	list_del(&bo->vram_userfault_link);
> > > > > +	bo->vram_userfault_count = 0;
> > > > > +}
> > > > > +
> > > > > +
> > > > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > > > >   #include "tests/xe_bo.c"
> > > > >   #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > > b/drivers/gpu/drm/xe/xe_bo.h index 0823dda0f31b..6b86f326c700
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > > @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device
> > > > > *dev, void *data,
> > > > >   			struct drm_file *file);
> > > > >   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> > > > >   			     struct drm_file *file);
> > > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> > > > > +
> > > > >   int xe_bo_dumb_create(struct drm_file *file_priv,
> > > > >   		      struct drm_device *dev,
> > > > >   		      struct drm_mode_create_dumb *args); diff --git
> > > > > a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > index f6ee920303af..cdca91a378c4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > > @@ -68,6 +68,12 @@ struct xe_bo {
> > > > >   	struct llist_node freed;
> > > > >   	/** @created: Whether the bo has passed initial creation */
> > > > >   	bool created;
> > > > > +	/**
> > > > > +	 * Whether the object is currently in fake offset mmap backed by
> > > > > vram.
> > > > > +	 */
> > > > > +	unsigned int vram_userfault_count;
> > > > > +	struct list_head vram_userfault_link;
> > > > > +
> > > > >   };
> > > > >
> > > > >   #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 750e1f0d3339..c345fb483af1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -328,6 +328,26 @@ struct xe_device {
> > > > >   	struct {
> > > > >   		/** @ref: ref count of memory accesses */
> > > > >   		atomic_t ref;
> > > > > +		/*
> > > > > +		 *  Protects access to vram usefault list.
> > > > > +		 *  It is required, if we are outside of the runtime suspend
> > > > > path,
> > > > > +		 *  access to @vram_userfault_list requires always first
> > > > > grabbing the
> > > > > +		 *  runtime pm, to ensure we can't race against runtime
> > > > > suspend.
> > > > > +		 *  Once we have that we also need to grab
> > > > > @vram_userfault_lock,
> > > > > +		 *  at which point we have exclusive access.
> > > > > +		 *  The runtime suspend path is special since it doesn't really
> > > > > hold any locks,
> > > > > +		 *  but instead has exclusive access by virtue of all other
> > > > > accesses requiring
> > > > > +		 *  holding the runtime pm wakeref.
> > > > > +		 */
> > > > > +		spinlock_t vram_userfault_lock;
> > > > > +
> > > > > +		/*
> > > > > +		 *  Keep list of userfaulted gem obj, which require to release
> > > > > their
> > > > > +		 *  mmap mappings at runtime suspend path.
> > > > > +		 */
> > > > > +		struct list_head vram_userfault_list;
> > > > > +
> > > > > +		bool vram_userfault_ongoing;
> > > > >   	} mem_access;
> > > > >
> > > > >   	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
> > > > > a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> > > > > 0f06d8304e17..51cde1db930e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
> > > > >   	}
> > > > >
> > > > >   	xe_pm_runtime_init(xe);
> > > > > +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> > > > > +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
> > > > >   }
> > > > >
> > > > >   void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6 +207,7
> > > > > @@ struct task_struct *xe_pm_read_callback_task(struct xe_device
> > > > > *xe)
> > > > >
> > > > >   int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > > > > +	struct xe_bo *bo, *on;
> > > > >   	struct xe_gt *gt;
> > > > >   	u8 id;
> > > > >   	int err = 0;
> > > > > @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device
> > *xe)
> > > > >   	 */
> > > > >   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> > > > >
> > > > > +	list_for_each_entry_safe(bo, on,
> > > > > +				 &xe->mem_access.vram_userfault_list,
> > > > > vram_userfault_link)
> > > > > +		xe_bo_runtime_pm_release_mmap_offset(bo);
> > > > > +
> > > > >   	if (xe->d3cold.allowed) {
> > > > >   		err = xe_bo_evict_all(xe);
> > > > >   		if (err)
> > > > > --
> > > > > 2.25.1
> > > >
