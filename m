Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB1C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5139010E6F0;
	Thu, 16 Nov 2023 20:52:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97A10E6F0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700167972; x=1731703972;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mZiUB86BjgR+Q0I9e/EKEgOeFZ/uIlCaPr+DvbkGznA=;
 b=iWtFTiuz9RykPLJcQHYkYwrpxMV2Jga4iteSr/l/Jw4wEiOWCz8ItJ4R
 sSxGmoroKVae3xmuAHlSWHdjp+c5g8HvUkRmsOrfw6MxCiyC59Bp+Gujg
 EOIWEnKmz9WROikGMczJzgquLxX9D9vYFPF7UzyAt+cGxDxiHUAciUcEm
 mrBzOH1ShFHFWdM2Z1fqvTvixaxuwPfCai2M+4jxi6REY0b9x60NPcU88
 gjqnrzbnA5vQbuWug7pttumKReJCfkfaKKX4DTjj6OwYy8xwVRZdBcObI
 S31atcCF4+Qcexe7M9a7ySRj9rm5kikBSziNGDZio6g3r+v4nehw+Qeyf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395097083"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="395097083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13677554"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:52:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:52:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:52:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:52:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2UOAvLAjZbcCZT5FMG8LrEu5Um5K8zLg6K03ReoPPL8eVlUTdHsrsUrDZVhVY87qiZcSm4Wc62NV/x6reGgPfGElXF80r5AKfudPQWacUxPbFpG+MM7punzCcDibucoherc8xx1K8sHIbkaKMmF55CcZnxN4VoqDgT7BS91oT9v1ZZLpDCSljD7Chx/Rsdxan0/wvABSZ36zotyP5Vdaw9Lvo2Xa9UecMacR/j9h1+tDk3pyCblS/P+EFn9T7Tciog8alqIBwnKomrNuCx4hWwyxq0HNEgn/WtxtdyoZR3iZZeN14y/3AgJ5c3IJx66+x5vvXTKgFrx64EkxHWKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biOjIuMpYhZMgLGWufPzdxGkGnabUSVJ20sLSy7rLbA=;
 b=NYWsGFlXopmzMO6hu0Ot9uJ+eJszkXSPorWxaDjFQ/WXlWOLEI1W9MB3ej/pGid88PfbwlgULUP8PlOJGMPSAMRLEQPCVM5iWDFmVtvNAnS+RSiddafybkXkWaayTsTNwAW9byWZfZpNZAjQHVJm8R0HcLA1QdNSgjjBC5ovRTi+tLOsyGNfn4TDwsSLbdHLPhRwJ+FFOd8gNFiE3j16UyxkBfoBUM0y2DQxIF6tRf1Re9huCvjOp4CKpvJrtOnC0eWVPrjanohfU2hGUiC3h83++UXTNXHbK9Ihp+MoXwB1k0D9ldGL1cbHfkoibq/QgyEtXlpdawsyTx8hlFxeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 20:52:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 20:52:48 +0000
Date: Thu, 16 Nov 2023 15:52:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZVaBHT55caDmX2Mp@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-9-francois.dugast@intel.com>
 <e15046e7999170bb0012b519ef994487d1823f5d.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e15046e7999170bb0012b519ef994487d1823f5d.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: c65748d2-bd26-48c0-054f-08dbe6e5fe03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTYL/ddK7MBV8S3mc19Kq8tSdDOWjoNf46pLVSwWbzvnFqquBkrIatv8uLxzDxlR/JO3jXwMYVeOBRulgfvPtS+/l5iG/1SZoERy/zUfzvkPKtVhbRj+uP6I891CbTMFMxpDFQkk6R6EmuNBFQw9tsFm9wfcoFh32IR4Qn6+ZjwTbSc697T1TqPwmw9FITjhvW/fZGfGyJ7isXVkxMAajhqCeq3EKh0YsBcTveMrtJEt4rpyjAk3isqdBge14n0VHB7EjEq95yUyDkFHFjLaYnQQlL1yfxBy3isrYVvxr4cKZ6D8+PMAc+gQrCM6pt7YlRH7+r2dlvA41CLeiGK9niMGYfTMyaikxW1doO7iqGBB/E4CeFf8t/2IxNpUkup3v166pOwvZiTljf13CB7VZwdV8OdNhZI5ohMclCRV5mGODYvU9BTbu294rZvfIb3JnqjSqRPMFDlKSafnUrMrkW+wDainBMA53puqpDx7+RQrN9VsUL7ZaxP1SMoVB1mJnAZMS/wXvWlfzBGyaAUV/G32dZN2GrjJHYPPLD1grvEj5qOfIyKmhHiYy+RDNKys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(83380400001)(82960400001)(107886003)(36756003)(6512007)(6506007)(26005)(6666004)(478600001)(2616005)(6486002)(5660300002)(86362001)(41300700001)(66476007)(66946007)(6636002)(54906003)(66556008)(316002)(37006003)(8676002)(8936002)(4326008)(6862004)(44832011)(4001150100001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FIk1td1bthmc86j+754iPiH2BwtBXY81WCde1ZIi12u0jpG9j6dA64bQgEEJ?=
 =?us-ascii?Q?DxMt2W22cstrBzl/xzcIotpFHWUFjduyK/AKxBQnIkkyeNCuMms7KZQN7bSF?=
 =?us-ascii?Q?4qko7zlaAr756+nBC8dx94HD1WVR9qtZVEr6IGfQBlyaequ6EruswS5soA5s?=
 =?us-ascii?Q?X4psk/azHMlcAWKurikMp4PMGTVp/K5UH4Qfo2N76OQ46bvVE5jXTE1XorOe?=
 =?us-ascii?Q?zgrZiZ1OBNSBl6nyQrrTOFXqMUXXx1re7SGWTFu/0SELkiAaUEx432kpTHrC?=
 =?us-ascii?Q?cOguKiiojB9mE68tVKjrsnZvtai7wBt/FBFCXJcOseyKXvpFDyWuVaaoD3r9?=
 =?us-ascii?Q?5ZpESDDSjlpNtepml9gUPzoduUUPuHNqraANhVuve1e2dsUEwVBs51H+NaRg?=
 =?us-ascii?Q?bagMy5v5YSvhdxzCOSlKRX6u7q3/BZqTF09n1WgBJ6pvdgducy4aEdjUhj0y?=
 =?us-ascii?Q?OoCKnLSfbuZRqwnKPN8GXnjx/D1dvZJmF7+y/8q4aNEBUh+z4+lUykXJfGSQ?=
 =?us-ascii?Q?IhHffICgoAbBlLwCuSM8P9C10aoBOb6YZEYaVr0my0We42NTZ1vwUmGbItLQ?=
 =?us-ascii?Q?iN3z4knmHMzpsekUFbIEnvdQD8TYWfaHycunWXMRrOcOGurGQBGu5aHgik1g?=
 =?us-ascii?Q?i3vy1b93nu7A0KHHmjMLS4u8tMgCHc0wt4HrfVMPiDL/KF+GtuUAp4Ck6pC5?=
 =?us-ascii?Q?KRMK/0LXPRsruNVjlu6eOS65Gm/nJSs6sAgbf/XmAEx4Xo9Zc/rBAe/Bbr1n?=
 =?us-ascii?Q?d41wjYxrDo9I1Hc0GnEu115Z0QbofTcCwX+HG02s63YH3KfTO7Q+SlskxWs1?=
 =?us-ascii?Q?h2mwUUmJGcZxoU8OHDNjwaEHoUK3mIDqkry3ieGYvZZCk0MJctmW6ObtSDuC?=
 =?us-ascii?Q?+cxR6C/9UxIGRsE99j2itjvNXWWGVLL7RLtPzgrTX0SrPU6oekguyek+U50Z?=
 =?us-ascii?Q?eJDbIcmUK/evfHuKHWpdP9J7MNeH2R8IG8di+IMNhLqY3CHzQi/tNLDRDH2+?=
 =?us-ascii?Q?GgrPlWakysmJbkcXj2tuNcFnD9SSt7ocn1sb4zk884RwxXPLdulTzXiqavpS?=
 =?us-ascii?Q?NkvK794EhkjW1LTB9vFHGY1iHSCFYNqs+x2wf5XPPz5xTImaNrhi2P+pNmkK?=
 =?us-ascii?Q?7aPPzERjxHJW1uLOLBnZz8t5FODra6yKeOw5JQ2G2Va/1r3ckOQ1Nq3DykG8?=
 =?us-ascii?Q?xyCGtbsjmmRhQRRYsaBnzrOZr3qApP/VMEXUusbLCEm5Hl6JjHTLAMgU87i0?=
 =?us-ascii?Q?PRLQBqypFsqdka7mbXEWFHfOiyWl+IUcyvJijlh9dj9cj3LSoGTlFBTD+rd9?=
 =?us-ascii?Q?GNi4sROO9rOERJtpgxg5ZEtyNG8DNEYa3nNP2Kp7tkqz6DyU09TMEf1wd6Gz?=
 =?us-ascii?Q?4rOJzIGgVG4q24MP1K87qHABPUj+P8k/grit2qHUEqiyJmTppFYatE7I/fvJ?=
 =?us-ascii?Q?yaggSajRpJO8MX7WHwlP1wCfmNIebaeLiIhW5XOhE1aszpTGaYVevnLwJfph?=
 =?us-ascii?Q?FyG7JRzJ5pRcUoqv4tEszS0IjP5VjBv1UgsDRgju5BWjx6JHmYQ/S3H5qC50?=
 =?us-ascii?Q?dMJhN8ybW9ZeZPVLJET2QcrugvL439pf0emAcOA1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c65748d2-bd26-48c0-054f-08dbe6e5fe03
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 20:52:48.9396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x11bHiwBb00D35qqcn7NIHYZVDJYS/pjZojKkwBw8hvvKdGwhhRH8RfhJ+rw5j2pcVcyjWWC1YHCVwbU2ZX9Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Add Tile ID information
 to the GT info query
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:44:29PM +0000, Souza, Jose wrote:
> On Thu, 2023-11-16 at 14:43 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > As an information only. So Userspace can use this information
> > and be able to correlate different GTs.
> > 
> > Make API symmetric between Engine and GT info.
> > 
> > There's no need right now to include a tile_query entry
> > since there's no other information that we need from tile
> > that is not already exposed through different queries.
> > 
> > However, this could be added later if we have different Tile
> > information that could matter to userspace. But let's keep
> > the API ready for a direct reference to Tile ID based on
> > the GT entry.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 1 +
> >  include/uapi/drm/xe_drm.h     | 2 ++
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 87345ed99151..838f03795841 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -382,6 +382,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> >  		else
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > +		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
> >  		gt_list->gt_list[id].gt_id = gt->info.id;
> >  		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> >  		if (!IS_DGFX(xe))
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b6d3d4d52da9..8610ac461619 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -380,6 +380,8 @@ struct drm_xe_gt {
> >  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> >  	/** @type: GT type: Main or Media */
> >  	__u16 type;
> > +	/** @tile_id: Tile ID where this GT lives (Information only) */
> > +	__u16 tile_id;
> 
> ack on adding it but just adding it breaks the struct alignment for 32/64bits user-space.

The padding was broken even without this pad. I had noticed this yesterday, so I
reviewed that aspect and found many more incorrect paddings. We will need to send
a separated patch to fix them all instead of hunting which patch was the culprit  now :(
> 
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> >  	/** @clock_freq: A clock frequency for timestamp */
> 
