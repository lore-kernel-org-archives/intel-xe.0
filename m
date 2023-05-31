Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C211C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 23:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2B10E0DB;
	Wed, 31 May 2023 23:51:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1910E0DB
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 23:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577105; x=1717113105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2XNrRQojddhK6OZluxf9EtdFZAGoc5tcIvVo0T8uDnY=;
 b=LX5y5Ip63UZgAzLetkc1VseYLMaF2R7mvkgPqAPdRB0GCuQNQ05rLESp
 +C67Wf9nRYWmpjwEFgO1FrXL/yoe3vtIsxTE9gCdRxn/c7lCEQE6loWyi
 8EUgdC2faYAaLoeNNE7OeRUEMcCJTXHiOhoD3HT12yxuW8fZRjG1D0PU0
 UJzmmxvGKaP9xqWenu4aZHyDnp+JTnPZby27dK3m0T+3ny2iibE3oaX6K
 psCQgesvtE9GXqbyZv9YCVAT48amWBFosH4e26m9nVLfA4czjM4AB4Hs6
 GZ1qFFcL/H/qq1D9ozxAI+utQOWiWPkKpVdGqRlIokC4IQdakf8GAybJx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352900235"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="352900235"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701309470"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="701309470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 31 May 2023 16:51:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 16:51:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 16:51:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 16:51:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 16:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk2lf2bcT5K3QGVHy4oBWTg0iUd13Q3VcWzw+tNFidsC+1qH1oGc/uIe/RjmnxpjJfYUa/oUOib0sfsrURLoS9Wk0ZWYXRluY6OKED50JoGVa1+hwsHM0hJxJbgq589BtL4SIE9L6nyIcqZAn3WivUPwoBWlb9Oia9bWSNdLxeyKUcBVB+5zAUm9WpxXDg6VRA0MIcwE9bSgUo1VepntgttUZ6zqSjohKVGdC+onqAOkp9KHAFd0eR2195krlpwHBjPEQbLDeHSZmh0s2D1Yz1xNnoNeDo9t7O6p24XiyVgHAc9PXHAdX48I49p88nOk9l6tz1d3Yw3vip2OFSpy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZjBM1UZPxeR3xa7XNppzZca5peryCtlmwsNzTik0NM=;
 b=IZGwhkkXNLBs4ZrOW8p22f7e6LLc9Y2JFyOoBKtsI9Lma12VV4FurUTeURFFC4A3tHg0zRFTl9FfmqhK9hLzQ4UHl4pg4iaBfngAFmZ6uDp6FcNjLVBpSPudAInteDycuOkmXAX/6eOAjS7Nb7HdqKfXFJkYGCewnW9MBYO+2X2CqiILlH4NpBCdx5LaHdsxdQUeC7DX4ULUitcWGKPrOakuiSwFwEA1eR64lwzENsPnq0UGiqZYPF55oE5UId3OtbLDc9KIiTTpr98HI1Y5AjrwQmDXcIjb1p7NoQW9DJq1GFTcagbmdWej9l2x30TKbAc3G9YmkJTaWfe/6fXSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Wed, 31 May 2023 23:51:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 23:51:40 +0000
Date: Wed, 31 May 2023 16:51:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230531235136.GC6953@mdroper-desk1.amr.corp.intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-15-matthew.d.roper@intel.com>
 <168556649753.1068887.14814865037521875125@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <168556649753.1068887.14814865037521875125@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 8505a4a7-cd1d-485d-95c9-08db6231fa4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5p0zmcsvXEtHq+nrHELF/mc2UtOVi89iujKsCjgmL6G3gJMVpq2S+qVx5abvfN5+HEjk/V7uuL917GkORos41/PblBBiRCRyzDxVUKcYkSSaPM8FHByhb5BLr/EcE8ReK4ERmk0JwPM7tV9SGiV6jBv5LW7SuoygYs1i2RdyN00oH3ZEHSB8xlmsYvRXZw/FWI0YPcuW3PvD9rGnjxjCGlTDrLO6YxzArHBXgEec976/BusV3MF7pKPMegPSw1l9hlxGxaVSpvUSvfgAjtTqGj2yUmiTgulb6g+19vcjMmXsBYpJuSEjvtdozkZLvoiFTtR2bzyqLOotwkuZIDMW6tE6T7YqutpK15pFLGznDeqvLwLEsq2pcfiP56yok4Vd0iNQADCxyl7LpNBZ2k8oCLSrVsiqIvuQikfErWY/B/cOH82h+0GsaxhSIWyMclP8nEhIZNOEFYSGwRtfzdnUEK/bulq6255gCMFYOnsqQHt7oEEJ2lKb/213pFbrmz/FBRvx+nYqZhnNsJaKBi3k8m4Zl9EB2i3OIytLZOlt0RS/MicM5lLWzJ+3ZMO7sSEu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(107886003)(6486002)(6666004)(83380400001)(38100700002)(82960400001)(86362001)(33656002)(1076003)(6512007)(6506007)(186003)(26005)(2906002)(6636002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6862004)(8676002)(8936002)(41300700001)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFfNw3YQuLg69O/TGt/OMpIKGpUsyI80QshUZFog1OogKZg/S873GsPrRznT?=
 =?us-ascii?Q?S6+FMh9YxWjhnL3glbLdLrKdVFt/buXvCPZi8fDa8+5LgPegB9lyq0pugKkB?=
 =?us-ascii?Q?F9NoHIRKxx6zJtGyIKnyU66biCZlzck5dI1gdgMbI4O7ZI7jAqVJnXhe1LPl?=
 =?us-ascii?Q?hre6DXxE5CPBVQQIspndD5h8+i8OCZXxEHNOT3+356scOWcKnLm07weQpxAA?=
 =?us-ascii?Q?S5nddamxPTEoz1P7TakBaHr8GnJiZIjUhkhW04geTO7L524+PSdUT4ThHf9x?=
 =?us-ascii?Q?qly6GMpB6KiscsadtvLEPlcVmJ1s300YHyxlWz6Xo5b9KM16Z9t4kXuML67O?=
 =?us-ascii?Q?FjIiOHv9co0bsNAYh2rMGM2tyCg7Zgt2PK/8n3o7YijYCGVhunYnNhtLiobt?=
 =?us-ascii?Q?bRZDD/AJglz45jsjf1l5keZje5Vc1/hHO+eHQMZqglRe/w8/SHE3S0zpiTgo?=
 =?us-ascii?Q?jzTolTmvOtknl+qpi2Go5PVZS2DxBR6sNi7sdNN/8Nl7wPvGsZEsRHNyijgg?=
 =?us-ascii?Q?8+kl7+V866p2dho+EjhtS35yXcaFbGzecB9igLt+mUSKXVeMuwuKK/7nByqZ?=
 =?us-ascii?Q?9tjPmmFuHdr+t6knVCNp4gteoqD1OfPG49wJbC4QK27M5MSyqbK70pV6VKpr?=
 =?us-ascii?Q?oeWEsGse4QZOY6MW6NCMmguRsfFvebZPfpP+8yeckL0pWp9mL3HTwWYSBauI?=
 =?us-ascii?Q?OcM9H/bZoxYuyyUx1xKtxTZmVpUCG/P6AwhVQ95dIIEkQTtHdoC1jefGKPLG?=
 =?us-ascii?Q?RnrMZYaOH8O+O/MZrggFxpM5fYVtbIcwvnOf8UIzkQt2QsAhFs2IinnihQaE?=
 =?us-ascii?Q?rVTbDSZlSiiawVa1j2hiHkd5hDphKE8RJvk15JaXD78i3ArXT1Y0EUUjtXSq?=
 =?us-ascii?Q?nDmg695v8jqygZmhIeMhmf/gutASkHDeAUymNeN5SAV5lT5mavWLPTzJD75g?=
 =?us-ascii?Q?sLf0ZJuIQlY8NtwpArIzEx2uwQcsJL9qIqkmT1XF75GKyPp09ih+Wuwd2QK4?=
 =?us-ascii?Q?/cZ8hmv/IY/AyfgIb1yNEZHaMbuoq3bwi7/XCqk3JVdY1g8lBvqtEQayYZxM?=
 =?us-ascii?Q?bk8yrASTDBr3SYIKR+/vHGZqK6EudzljNDt9rLOXzNBIRN+SkyOShljmwgYF?=
 =?us-ascii?Q?6kpMfCg2geBfHfHocszUbI6vNA8G3xKa+nDCWE5sc0ggOhu2J9osTfkRpSzX?=
 =?us-ascii?Q?8KrLBiA/0e1GeI8Q2HIWishyJEi6z9ostm6SE1nL+KAshKimuJEWjjDh365n?=
 =?us-ascii?Q?awlVPb5pcP7gDxSHkB2yl/7HEJJyfzHAWHDvzSoB8bM1ml3KmTqry4pwFJmi?=
 =?us-ascii?Q?mFjXz6m6oEOIQJ8ENGsURXqIB583x44GzpOeraUGimAheWwupLWL4eWTvnQf?=
 =?us-ascii?Q?HbYtY722qrg6PPMTUknO4rbh6oyQTBX1nhirufNd5TbheHdP5yAGpCUTbaap?=
 =?us-ascii?Q?dTnH/xgmcVp1GvwEa2ue0mw5xBWPNtDy+3nVMOrN44gmlEiat9GEBx5J9ck8?=
 =?us-ascii?Q?vo3ib+P5nf4hpiuJEc/DF8ZxqGrAfYZn3ox6Abtt4UGQ1omsB59ZgukX4hIw?=
 =?us-ascii?Q?WD6gTVGb86MT3mtVrv9t7QBnGxVf6TQM5iq3Pghd+ZVHrlL/Wm2wTISsyBgY?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8505a4a7-cd1d-485d-95c9-08db6231fa4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 23:51:39.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbhiyyA67A8BQsF97XN3z0yk9yW2/jwM2pcJSUONCJ8GQQu1g5v0aMUjOX/rHX578pU3/vhqAyQX8mIorxN7qCe3gC0RAHJzHRDiUgctjUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 14/31] drm/xe: Move migration from GT to
 tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 05:54:57PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2023-05-30 18:15:32-03:00)
...
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index 74023a5dc8b2..aa047db4c937 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
...
> >@@ -383,13 +375,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >         }
> > 
> >         if (!xe_gt_is_media_type(gt)) {
> >-                gt->migrate = xe_migrate_init(gt);
> >-                if (IS_ERR(gt->migrate)) {
> >-                        err = PTR_ERR(gt->migrate);
> >+                struct xe_tile *tile = gt_to_tile(gt);
> >+
> >+                tile->migrate = xe_migrate_init(tile);
> 
> Couldn't we potentially be calling xe_migrate_init() multiple times for
> the same tile in the future?

This is inside a !xe_gt_is_media_type block, so it will only get called
on the tile's primary GT (i.e., once per tile).  If some third type of
GT ever gets added to tiles in the future we might need changes here
(and a lot of other places), but I don't think anything like that is on
our radar for now.

Although migration is a tile-based concept (memory-centric), we have to
use a blitter engine to perform the copy operations and the engine
itself lives inside the primary GT, so we want to do this init while
we're sure the primary GT is under forcewake.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
