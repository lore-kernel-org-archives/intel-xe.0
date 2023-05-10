Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C48C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 00:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A868C10E1EA;
	Wed, 10 May 2023 00:38:04 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5110E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 00:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683679082; x=1715215082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sIsUu6OFahtXZsBzh3IO/+VUArYZGGt+11F6Hmmyma4=;
 b=OChYYPJTat7cF9u8reVt9Gq7hX/cvH+O2m+SQr1i89xKsDnhUNaZB/Se
 0HqBQEX9G4WqJXRCh50zt0ZBHYIvhZVQZIr5xxrlewhcBpFb7oPhq2RDZ
 Ux6WVH7YgZHs1R3gMpdEHwM9HXUudJIRVTo8CAM/apWMIBMotB+PvRfWB
 OyfbKQuREs/xk/46JZ2coYehupt8+K4zIuOkxTobUSewMcKKyI1PU8nPm
 RKRQXsF3PGDud9l0INyX5WCZwBCw+p6+rEzHzA0uUudTRQxXQc/nJ/bC+
 h99vozUczrSXpuXutyNaIVHnfY3Pu88nFGDEdUn8ergKWfE3Fr0nbswdX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350127101"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="350127101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 17:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843322601"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="843322601"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2023 17:38:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:38:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:38:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 17:38:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 17:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcDnHKSvWkW5W/OGsvO8l6M8gLpe2pdvEzqUMwwFFDUNECdCdiZT3wQQ20nyC4vTx/0n/qxegyMKi31Jper9LwmdFeh5I8wcO3LuRQ5qRvYHAFItY/cEHJKewpUuODjX7RWUMvts1o8bbfMnqUo3fgOLvAlCH4stGxDRF6aVHmdzTKDVCQ39i1TizUdcMKJI3vfG5ivycgNcvU06hc7uyJDp3kt3VuWt29MxbX6Xw7CbQD3pBr+bnmtLf2L0iPUlQ7dpFp+BETMxogV8V0vrVolu1qfLZ25H4pC0118p92PbvVdoxcIb51FvWHEby1edIcwA+ELFJEFz5QmG1nEOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNuKul5jEpqaOAVu2JpHzQh0UHlY8mEQhDN9fuV1jMI=;
 b=N1RAEQwcFVgIe6ItMwKzypcWo4Y5jpZjOl9hzISh6xsi2c3i6Vp9YyiawIdo9qjBJvgT3zkiBzg/m77XCCpQTvIKM4dmwtks13oMb1Q5H71y+lKdAFYNZLmtjJuE1RPY6RU6Lyq64Ink91L97tZ/K/8gevoa4SHvk23/5hNJYZQidyfqNlcZ4HwQSjx38L7Y3mtFsvvEk4531hIDXAQSkocyh/gDxkzJxZaMggoPI7eAT4T+nrog6JdTKiiSKsi3gmG/zqWO3sBeoF5Y6A457kRL6FjsnhnGg0+ktjV0vL8f2oLYufVbLoZ9B97uxxyd43FtrUe+fUJXteJPfKnytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 00:37:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 00:37:53 +0000
Date: Wed, 10 May 2023 00:37:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFrnPXI8812ntBXc@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-27-matthew.brost@intel.com>
 <ZFpcgRA0y3Jy0HpL@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFpcgRA0y3Jy0HpL@intel.com>
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: e408c969-662e-4c42-6049-08db50eeca46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imPoQOkBOM3apn2gWPn1R12rBFL/0m9T54hPOXP1jc0+JeU/CZapEp67FpThzUgE3DAKUvAk8yZQeBze1IXscxGSC+N4DfRT8b3xxjJFksnQFPhWbkLf/Xo5wKzMr6h8UacAxBkxS+odiI28hFB7SV/FedOvEMhti4I3L9l3ITxkAi6iTQ7sRVK3d+EDD2XnlgusWK+vxaD6E77sBu3WN4+3mlY8yTSZpn2qMqAD4cHq8elIOhW4HTnwGTWFdOuLnnSp11jx23erFdGauj9g5EnxYjnn/6kCtOspACpFv/gGJppRjMrdMjqcoLMG+0jY7Q+SwIjQ1/k7l9FubNFBQKtzLDn9ou6IDXDU9JioFsByfOe8lfx6Ycjo9JUBhxKjbNGPAp0kyfxn8G64Ovn6mCOHRKpjtruSoi7cxJd0hukOp68QgDshi8mWaV5jAKe3IwqIg5iXHl7hG+7An66PVJ+MRi47Me/DmMhV53Cc87fl0RuAWQCr2SEbN9dGgmDq4SiHtmvVKCo9YY1Fj4yo6tjeJ98ZIRVf7aXwh7VhG1D13ouKiNbfRDjixFi8sdBE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(66476007)(86362001)(478600001)(6636002)(316002)(4326008)(66946007)(66556008)(6486002)(5660300002)(41300700001)(8936002)(6862004)(8676002)(44832011)(82960400001)(38100700002)(186003)(2906002)(26005)(6512007)(6506007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJMZvS5e24oXfvpnMYzW4CmNYNbyndK3HS44FIQNkU/Hppqg2kXPA1P/7b0z?=
 =?us-ascii?Q?35nAd3pPlw397vb1Kyq5lzhHjJ8ZzSM805Q6ZKCZBGLuo1hLynXTzpn2ect7?=
 =?us-ascii?Q?RMjpUq9ztLoHoqjIONQHtO6z/scA6Vz44CFtx41HNP6Alinbr3ZFR9yrQqdp?=
 =?us-ascii?Q?0hHmDm3srCIu/RFlL0O6Fou4MHISeFcDU6IGB9Gx4RLQLBE2PxcccwZEyMET?=
 =?us-ascii?Q?MWKw79vhz0lqMm6cdpf/ufB1ODy/qHYXd11imCZU1D5B0Dt80w+SlOq3LpOI?=
 =?us-ascii?Q?wKHg99lf+Bj6B3ja/bDTYG19DO1a6lruDR2Ud2FFPcJcIRZb7CLqrolrh0uU?=
 =?us-ascii?Q?OigbSdnJKtNSst4gjZivwoKqilDrlVxkxJMhLyQuCecBwXreVg+nAbV1Xsqg?=
 =?us-ascii?Q?pizvjBxJMDUMRf/+BShCeTMVp3q7J0iGVxyQPnJHdYYXef3CoDhyEsIoOvIR?=
 =?us-ascii?Q?XAr4bTXrPVRKwZURLpJMkJuHDFHVZQCiNBS/S5m1OdLo2kniwiIsgmRrYrs3?=
 =?us-ascii?Q?CQ8fVbSV6to5f9dkzNZpZxdm59Mzx6as1lQFa5Gxz3sew92AbM9fkVQAYTiS?=
 =?us-ascii?Q?tX395U0I633Dj59R01z9QxLL9lsowrb4tn82gme0/DEc3cnHpe1338EWndOI?=
 =?us-ascii?Q?KKhQJkC2xVEHtefVVYg5sHyZuW2y7YdVCwo2f30NGhDnKa/7D4Dpym4WMSvf?=
 =?us-ascii?Q?CPfqzbvRIA+FV0iEmVbZ5i1XjHNUUGRlGOLx49nvuRvGxP437U6AhxHFHTT9?=
 =?us-ascii?Q?+bw5ZMaxr+VAZgyFOupIxxUwIVez00kVor9FOiFsVD+zht/TBxwlFEC9UzZt?=
 =?us-ascii?Q?NeefRWzwnWdQV8AwAHtN57bCnmEM50+/ksCgMjq8X+uzvyFb4q+iCd4wvHiX?=
 =?us-ascii?Q?N/wd5Z31Ab22f4h67BA5QDWzlMSEYiSy3cyvVM4WQdnwp5dxK7HZvL+OqeA0?=
 =?us-ascii?Q?weWKxgaunUFlMtIIknZRDOStha3Nkz2OHpFORTAkqt4plNc67ZXUSBdQCjGB?=
 =?us-ascii?Q?E0PzTr0V+ZOdIR7XMBbsDthahsl1BFwsKYPpACJ4qwcdLHHvya2dAladQpKU?=
 =?us-ascii?Q?9pkFKLgyKYIRUavTn6CIdr6DWa81z1lFEvM9prigsSr2mAj/5SxEsayAefA4?=
 =?us-ascii?Q?NmrxgWpECSVS6RRKb0Vn1qjvpPFjnmQ63nRuO9tOh4Si6gtX48ByygSoaeaO?=
 =?us-ascii?Q?9Sx4BQhK4qHds2bB9/ebBNdYMaX5NsjxR+giU1w/yNzcpy3oVW46dQJS7I7w?=
 =?us-ascii?Q?/E/fbRnK2cgBiJCD4XoUE8qLpXDsASpTh48+jALFF7sSnNl6I9G0VhLKcxNM?=
 =?us-ascii?Q?2jn07SGozC+wPRqX4alWEQTdvl9Jb1GkqJjN3g+uRsZCBZboBKGNblr4cCCq?=
 =?us-ascii?Q?iHM9xMYMlCG/yrgE0W98tviFgb+sqd6B9TydY/JI6UPTsfeQJ4vDuD9gov4r?=
 =?us-ascii?Q?KMb9iT90b0AfShvAgdPGQlpDPD3Q4cORLdgaLPO9p+77JccblAJjIJPc5D3n?=
 =?us-ascii?Q?IRB72Wy+/HziFhiHxTfaDga93MxvVpBmxlSmBEpy4delFid+hP8QL1pR8oOz?=
 =?us-ascii?Q?Y0EL5PWZbARStYnKB1zuavh3URxtqtfg+fMWvPzx4yF66g7MSvK+WUM57j2B?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e408c969-662e-4c42-6049-08db50eeca46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:37:53.2543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bFMl3RTFecmymnO0T5KvoJsMLDgWiN280bnLGw4a0m3XlvKMqzNuqB1oCNru7ltZ0GooGnJDnNyZsiGG+NDyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 26/31] drm/exec: Always compile drm_exec
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 10:45:21AM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:22PM -0700, Matthew Brost wrote:
> > We want some helpers for DRM exec in gpuva, alway compile this.
> > 
> > Suggested-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/Makefile | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ab728632d8a2..40067970af04 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -23,6 +23,7 @@ drm-y := \
> >  	drm_dumb_buffers.o \
> >  	drm_edid.o \
> >  	drm_encoder.o \
> > +	drm_exec.o \
> >  	drm_file.o \
> >  	drm_fourcc.o \
> >  	drm_framebuffer.o \
> > @@ -81,8 +82,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> >  # Memory-management helpers
> >  #
> >  #
> > -obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> 
> shouldn't this kill this kconfig entirely then?
> Or should the helpers be split into some other common file?
> 

Yes we should kill this one entirely. Will fix.

Matt

> > -
> >  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> >  
> >  drm_dma_helper-y := drm_gem_dma_helper.o
> > -- 
> > 2.34.1
> > 
