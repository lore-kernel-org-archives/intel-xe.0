Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D743E743CE
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 23:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331CD10E008;
	Thu, 28 Sep 2023 23:18:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0410E008
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 23:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695943111; x=1727479111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QCXQMX+InZaG5dEUIBGlHt9JACw5vVzEq+ceRtZXonQ=;
 b=Bd+0ztiVo5GnM2BOANXPbq+cBd2G44bAz12WaDV2AEgPcM779pjIttN4
 i+z8Q7NHnzDK+/DaZkxgw7dQ/4+LvcSss+I/t7GTMBsKKtAruawoyXJim
 k3H6eZkamESA8G6NxTyQpC+MuhBoqW4R59OVPCW/jf9E5vtobZf/ydond
 fhTY9T5fqASfGDcPYXJKJs9xvK/UE0XiFAnO2aSk7DHX1X0ND0l3awt3O
 JMPTMJc8BENEb1ZQ8lzQHHMecmmHCbO/rYvrdFQWvPfkmvMXaY5SCkN6w
 7nxoYe0EpUeWDSZDMKJYlCGRjhqzXfRfZGJpjCuhI0IAFN27QjHUM+Wlz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382096652"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="382096652"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 16:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726416637"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="726416637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 16:18:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 16:18:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 16:18:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 16:18:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 16:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixzcW7LmTLwHaQLetvja7edn6ua/u1OxHWBN2+hdB4xmYIhdt8DoSkHx/wC3G3KNSqERntSDL0l5uzgXWKs77y+EWnLX7DOpOWY7xKUPY5hBwdBHmx41vRjN4B68MEuP1yext7FxPxDSbNT7ElSR2cEazSmGmfPVvboeiVxLJjglQ/PAwYfSD4/k9pF9BJUSVXOdeXxDNS6lXrcpu9Yv8Yf29riA1qbO7dzb/5SsF9tR8KoD+T5ch10j5eSpfBDqFtYbwjQLBD99tKLRaEZeVu2ib4Qd2kyVRa2Gv8uS3TWVMmbMxeYu0+TOFdJGN4wyRtrY7T1O6+f5mfMTMfKgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1WW05aQgcGpGbYjKGKbHYZMXvN5lwcBWK83grUnXq8=;
 b=Irz6wxWRjSbRYRjh3EgOahu7fCC8mJR1LbL4gaL1oxfhitwB+S0se1/qD8OYaB0db6doMPLUlJIXd4sQwXhX7B2zqbfmW2Fm+h1RAdTfREfq5/8zIcGJWHQHBU1tIxDEN8tF2nvcoNfrfayDO8lVuKRgrfNr2ZqugYExMOZW03+dXyDZUR4XGYGecMVeQ9GuIlVFat0M8ZqlIOIub1Kj7BWwS8paYHd9k15HZUIvh9yfXuDyYdseV/60KYfONVh9X1Try2zSDZ5w9dVKmTBSpwWzXtcta+W+v4gxS3G0VIvU2GzvOHGIvTluOnfkM/tHeU0VICxbCv3kLKGdQ2oTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Thu, 28 Sep
 2023 23:18:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 23:18:28 +0000
Date: Thu, 28 Sep 2023 19:18:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZRYJwP4FQm1AslSj@intel.com>
References: <20230927165012.9048-1-bommithi.sakeena@intel.com>
 <20230927165012.9048-2-bommithi.sakeena@intel.com>
 <ZRSSyoYJRa18aXEM@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRSSyoYJRa18aXEM@nvishwa1-DESK>
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8362d5-2b10-46f4-903b-08dbc07938d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxkskhAw/A8o6N1GS/FLO4P1jirLQ//GpVh7xHDBs9cPmR1HrpKfEvBjuAWBggvjNVodK/HARNgWCOkXx7yVAD9aU7r6tiJrYr1SCXKKic1nTcwnwuRck2vdc4sq67+yhWG1yeZmap8RwECQGJvLLR31xT7FWcWhJXHdipkMilJ6H5xYKtch8Lhylvlg1UzxgWPRisDcfzp18pqwnggjFIextyC2xvcgG9wPJzdvCNlHOaRhhVtgGMtvhe1NUrfC41t4U/G6yZNcxzi0cctEQqmAEZlIaUOiTPb5/lIpg3WPFKxlj9Yy7C52eIcDbP/H8cKzQfD3VHdmQiG4Prc+O2yWSwzBjqzCfp8Bf8BLCpdRWlc5prc9VmjAdOVhgAVGLTp8XERamoOtgSrvNHmLqlh0Fyrf7WBJhN9kcRoO7j5jELmowUGlKfcS5bG+Msb5IoXWRXoxOEe/xJ/UglRHlIMvetIWfet8TIWONhkArMG4ICH7XRYMGG9NMdghysre4+p9uVhaSkOJFRu+aC0FaFYOZy90h7a8pQg/zya19khHxHe1v433kxhTnfqxGjiN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(6862004)(316002)(4326008)(41300700001)(8676002)(66476007)(8936002)(6636002)(5660300002)(36756003)(44832011)(478600001)(66946007)(86362001)(6512007)(6506007)(2616005)(6666004)(38100700002)(26005)(66556008)(82960400001)(83380400001)(6486002)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yopfmdmt/a8O5hmsWqKyl37Ur2nomyeGK8zdpsWw+EnKDS1O/lglqF3yv0RH?=
 =?us-ascii?Q?wPLAb+P+2+4yZJmjyfbnrODEzQHq5EualHKZd5IVzLdq1dRN186tUyBbrYpQ?=
 =?us-ascii?Q?QE4GYeD9+sS5r7cDkK8Uulh5LaQqIcit9XD1qrv/8orJlEIrXmoGbpkpYjDo?=
 =?us-ascii?Q?iXGysFLhbRN0Il4fVafSFq6nPcIGzjJOLFfRDbfI5sBdORAweGieC72Gm98J?=
 =?us-ascii?Q?2umLJ+bZv1vHf0Rqe4gsWf3wf/wq9Pn/E1hvIaGw8nPKGwaSyuBmVCOKd8u5?=
 =?us-ascii?Q?FEHvvP4F49LzP65vaeayWyN2Yop6KiDQnlFRa7kBzcN72GLq/tEYkMMysKGb?=
 =?us-ascii?Q?M8HAPaw8wQFAB5WBDw18iMCL9OoOBIuVuRReJ0OXvNhOYzWBlt7JquDomxKl?=
 =?us-ascii?Q?5Qw5Tz91twqY6+TZhSWrTaCCWwzIs2x1NsaePflQCp3w4gHOqRDR+jTR68Ga?=
 =?us-ascii?Q?e3YartTzXeNv8RC+GQUvVdmmS3DnWAiHpM9+N7O8QEEgtC32bH6PSjjHdDLk?=
 =?us-ascii?Q?7KkNVduIWAuvGQt2hNWhPMeCEm2kpmoZVhCL/I6xWS9lde/Ea6ZydPZTc8m8?=
 =?us-ascii?Q?5+8AeW0dkY+qPkdJ5aYtwv/qzwxk/oHbgK83CfhTt/loAbobrN1qbb1+I7aH?=
 =?us-ascii?Q?GBt96ONXItcyElhvOZIKw3fXCf0LD95Kh9wEJ5hfxxeamCRgzbvxYII1PGcs?=
 =?us-ascii?Q?iOyOLFWLvQ2OtosAACBC1X1a8VUCX1NdTFJoaKghM4utKOPcFUeubEvWCeio?=
 =?us-ascii?Q?Hrvw2h2eTJ5WLMfXdYTnd2plAvs+G93jLYhPP7sVfdowvvPu8HCfxP+VxnnY?=
 =?us-ascii?Q?ZBY1iFPhNWUpbyZ3PqUfCoalPV2r6OJgH2pxlCny3VTUDq0YB+PCqF/MXsAx?=
 =?us-ascii?Q?3AJvEzR/Kgqd5SHlfIrw0MVrdAMFu8+wDkiide12wOuSU547eVHYtJbZyRcd?=
 =?us-ascii?Q?4VHHfZHnYxdabdhPbnKVyisukjYFZhZldZHnLzkyfW5npOsPfIM2ziVVWrPV?=
 =?us-ascii?Q?+cuJz79OYE23GBWMTg7RyD2hCZjtnIxPlr/PEHS20eCSlD2bFfPVXX+T4oKF?=
 =?us-ascii?Q?swGly80LQmQNIfP+tOXuOD94b9qcN76YXkJOpGH/c0P32+fkHNIKSSj/2Gkq?=
 =?us-ascii?Q?3oL6GZbotU8PbA9XsZqGtOL8DImZH859r/69f/U3ki6CwvRqRLr3dkyQmvB0?=
 =?us-ascii?Q?eijLx/xMX8PauMplg2i30fhRqj2P7ei2V/XECSEsLHbh7iJ8QoF5U+HuRLeY?=
 =?us-ascii?Q?Yu+m77L9pz6EvQs6VeA4HOF4S3Ky8tc2XyvwBnqLkQBiQ5Q8/SCPe/8YfweX?=
 =?us-ascii?Q?3eulZm6ynZIoM5LnT0TE5v5f1+3wQKPb7KOBued+ZOTVajlERMEcQt25Rxby?=
 =?us-ascii?Q?bHeJn/hVBYtfiFvXxEcrHWks7XNzMOQhrN+Qlf4XIeZWNGbn5YUhrULfq1zP?=
 =?us-ascii?Q?Oo6Zh6pjBjNQrfyF4AQ+9dGfveA6+ShVkUVtTcbY6008bYIibCr4wtiBdgmB?=
 =?us-ascii?Q?Y4hdsIrH4J22hWr4llqx+oJe/9nSSViP74VaRR3k5jCKJXvvx3BDu1BHkDxJ?=
 =?us-ascii?Q?9tP+JGC1uRHxGa41zq/r9aA6GKlZjDYfxtKGd/zPiyFRXH5P3xtH2zQZr7P1?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8362d5-2b10-46f4-903b-08dbc07938d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 23:18:28.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2iz/bmIB1H1/PaC6Fe52+ffbWxOt0Gv8a+0av2c/TEthKDVJhoqxApPkKmhXcxQquLPNT8HldQIKOCXbHA5wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add a missing mutex_destroy to
 xe_ttm_vram_mgr
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

On Wed, Sep 27, 2023 at 01:38:34PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Sep 27, 2023 at 04:50:12PM +0000, Bommithi Sakeena wrote:
> > Ensure that the mutex is destroyed at fini function.
> > 
> > Fixes: e777edb47dc2 ("drm/xe: Implement stolen memory.")
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
> 
> Can we use 'fixup!' tag (instead of 'Fixes') if it can be
> squashed with the originating patch?
> In either case,
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

I'm taking the patch here to preserve the credits as is and
remove the Fixes tag. Since the patches are going together anyway.

> 
> > ---
> > drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 06a54c8bd46f..285791eb4a79 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -328,6 +328,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > 	ttm_resource_manager_cleanup(&mgr->manager);
> > 
> > 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
> > +
> > +	mutex_destroy(&mgr->lock);
> > }
> > 
> > int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> > -- 
> > 2.34.1
> > 
