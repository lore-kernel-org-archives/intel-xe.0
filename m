Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB00C636D7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 21:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146210E0C0;
	Tue, 21 Feb 2023 21:42:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6010E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677015736; x=1708551736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VdeeFWpRbU9waImgPEPheXS3IBI/eXgxWwZUkaU6a24=;
 b=j28oQM9lYUIeynjFx/wzY8sH8gxiWftggxdINX/6kKqNFtmru2f8LT86
 Q0fQDPIMEggew33ELGtfRLu++rCtfXl89pjodsUiOfuM2xKiv09gjmpJu
 Hv3K0XbGmWZhAtOOmadTldZlQBzwDPC3bUe95Fa1ElbVFQ6V24ZBkM+oO
 mdV/9EOkCDPEEo3q/mlB6gd/pol7iF68yLgMNKJPvSFXXqn9NQ++mf0Qe
 y6eVGoliwzjSQU1LLUFlBo0jVS6BnJUCxkyBohF+5pttNH3zzdULASJG6
 H+XkjhzdRfyp8H6iWKyfNHKxMKEB2lHO5HVuaSarYbwjQd3NELpA3kjFU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334123179"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="334123179"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 13:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649326969"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="649326969"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 13:42:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:42:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 13:42:15 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 13:42:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGNBe6I6vx7OJCnOF3jNIj3qmWDxtXSrF6X5l38aAzkZDDBC61vp/J7ffBJoD0xFGkg3NwD0K9rLYWNAYT2Ey6ylbonpIA3JATYK2rJnJ+KP2jr2MZRjGZ8JC+6G9scGKqNzq6m++6Kf6MvVDZYFeEPZIR44cEcO8c2dMCTnxKU+hJDC4nRkKIttYtf/T5NiuyMb2YSkiBWTzc4f4ujvz6n7PX/vmJIfR3uhU2Gw358v2yCQiZs39EkUdgv2q8YNWSsImaBwwKXEhpWS7UeZTUmRVmtkRoIm4+NYn533W0GIwZpuTnfvUeQnKaPI16+kbiGrv66+a59el+nzcya8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjk+tR7HOoLJixZ6HoM8iVwyyKu5spfwSjQev7DMlOE=;
 b=AqJunuGuW6XkjSVo5fvBqYuWjS0C32ApY6GE2b9V0IvxTTIAmGeGExuBEDswUC6OHNC3XFQv3RHJzf/8brK3Ld9t9qkJPvBuBxp0F9ljnS5Ws6fEF+vghHdfUIKPC6pXeTmj+zGNJWsujtXEe1Qph0wDwQ4/q0CiptUMz8+GYza+9ykfkxxmnZDS2qjcTxy3y567kDzq7wdBazYArARBhYaXZrfxi6kgcOiaklDw5UDWXaeL5UDPMqxIgOMNEc+hLZIJqw6JqJec4gc4nx7uKtJKG5l6G9TSZGli3VKf3yg55shuRerIDNsQ4mFzfzuCBBAslq5Mi/pH8NGbNt05UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 21:42:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 21:42:13 +0000
Date: Tue, 21 Feb 2023 16:42:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/U6sPRqGl4Qo8sf@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-12-lucas.demarchi@intel.com>
 <Y+/jaCK7TSG+qHa+@intel.com>
 <20230217223007.n5cwcflrscv6giid@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217223007.n5cwcflrscv6giid@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: f9568c38-357d-4480-cb12-08db14547df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2U7BEM+fVbtn3XtT5/dslgw1dKWOtFrYqKXD59e00Hv586Qnq0hWNU8B4X7pvQ2N9igwzjeREhEtxbvhPDz47/SL5FrNeY1gfW6yIUpdyVW3oCjW8QDh+sWZfUwUcSTTlN/XhaM6INq0m0+VERRu+Un0uxCBQUrQK0YBfyTBx0ZZECgptClWucOGnOGBt6yeZt+QxcFaG7gZH8JQuHV7vxuTNaEbxvIm3c9PKUImpxxpeR0H5VHb8QjCsdpNNKFdydHr8U7bssk7LbSMuD68nbtD/PXjnHWMHW8j6UziinhFLyKnPzYoxjdgJxC0oDSLjFxzKFRbL+84jLzSkbuIR5rfTGbSogQ91nYRz71HcpgI7lc+0c80P6IHYhIkEgfYmP26G732Z7m38QKbNBsVJtiVM1ou6J51QyXdhzW8hpdsNNbLnfu4DOSMa0dJ83E2FrU3gf/e63OTd837yhPJrj//YPeG5rg3AZehttc7ow1nkj6jfQQ72SCEsIg9eJ8evcAtSvVmJC6ccHBfXs4Rcf7H7Krc7KlKbtZZILkrXT7taBDBcSkx07oqYlviH5NyuN/8oB/2s/4vSOtsTjCoLLThyDHvYI0n9P50gT7hPG7VNMmzbBtNH3wnH4eSw3Xe+3PgHLJG+un5qCml4KDN0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199018)(8936002)(82960400001)(36756003)(44832011)(86362001)(5660300002)(6486002)(478600001)(4326008)(186003)(83380400001)(6512007)(26005)(6506007)(2906002)(6636002)(66556008)(66476007)(107886003)(316002)(54906003)(41300700001)(37006003)(66946007)(8676002)(6666004)(2616005)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vWTtJ26Sl7QtRCK4PALvlVcPLd5kKIDfj3thrB6eW3LfYAQwPAf67vO8vNOU?=
 =?us-ascii?Q?Os6r2GRZGjXyLyNSB+20INgR3Rl0Fiia4HMV0GLCdkQ1o+S/jBWV55ZqpQo+?=
 =?us-ascii?Q?aY71cKr7+8jWM8x/xOA5BXpaWpnmpO98G7rDkuXWhXUKC4o39BkkzWndu8bm?=
 =?us-ascii?Q?l3ljapAg/ioqArdi9CyN5NNKhddvlhfjbkMmy0u2Y2IE1qeWDvjFDeaMyWU4?=
 =?us-ascii?Q?/IHyI/FDQU+G6Zvx/iJWbbF0GXfitR2+DmPjbLGkC1zK7YdsyZ1dQpFVlg0+?=
 =?us-ascii?Q?k0F5xxzr1GNk13vhVAjYf5svuvBfqOPQQE/53GLKVhlLxgsOv4W7o5H2iAko?=
 =?us-ascii?Q?q2yKEUs4QpeUELSiuw9kDxudHW686dGawF1SrWtkMhek8G1Ke9Qw6ZDXuejI?=
 =?us-ascii?Q?va7rLsVHIpXPRjDFvzOGER4J4+Qlroo09Ea70SKjddjR9xiAaki0gApYGUmU?=
 =?us-ascii?Q?l+628XXHUU6K4Yzp0WoTlHZ3J99FFzmpt72Q7ig2MSnCLStkq2Yq2+Fme7N/?=
 =?us-ascii?Q?e0MQBMylkBDEPk5bec+fED67vero/7VybVQm7ZMF0Ubx9nVVp1LxyS9rm6VB?=
 =?us-ascii?Q?TmhfaT8BDAPkTKNPPnxg7SMz8SD4UupRjTDvy1EIgAmQEs3vjkvClhsgCBFY?=
 =?us-ascii?Q?uxyV4zl9mC864WpPLIkTKNxiTLdMtlL2KE27B09Zn8KInrix+VXkFskPehAx?=
 =?us-ascii?Q?MbE9CShuzZ8UOm3HChYm5OOpIWd1UKPY27XvOHXD9makGqqLMUcClWodsQ/N?=
 =?us-ascii?Q?AV/2wB3zO4Qa8epS1DMxtisxJooMTZL1WDe31P0z+K44+7SOTOIdFGQP9a27?=
 =?us-ascii?Q?NsuKWQe8rN3Xvy93vudhA9zoY9bsBvLiSseb4ih1+ZQPhCzQQYnOeR39TL3+?=
 =?us-ascii?Q?XcFh37is6qa1c2R3dj3Tqa7HUsNqmL8J38Ad9rv49368UKlLHOfghhyjipj6?=
 =?us-ascii?Q?2guDhQU4+EKKt1m02NznBaBwa49zR1E1u2JnnxDnFzsTRDJQ+RHD71e0WrnM?=
 =?us-ascii?Q?GjKTxG+JGqTBT3/R/LaJm4DiHngpFEzXMVuaGPbRFc6sTADgQTo7g4a83emM?=
 =?us-ascii?Q?MHQk4pl59j7dMxummptuqdeldBkmvH16fr36jjShxIbjUA5SnKDW/BIjpIJS?=
 =?us-ascii?Q?m97/oHX0Go9IztAGlVlSdxiCjRz2WbaEINy5Ar3XdntCFqVaHGFJBQivOiEN?=
 =?us-ascii?Q?UzLawZk6EWEspF7JzlqwMjtqRHDw9iqhzJYkXM6RGCFGqcWRVJoF0v67+uNb?=
 =?us-ascii?Q?1Gnzc6vuP8QAMDIzKRXMF94SdxpDkrmxUsZSNcGRhSIaJvO52K+XoBxvrGka?=
 =?us-ascii?Q?VnObwdJ1yZ7s91ujRgnTN5VPzeJDRLOQ9OhIZjIq9z4IpDDkDxDivCZPToD8?=
 =?us-ascii?Q?Q5AqwqcPr2Cr1Bgxioh8+wlxLwzrQs5IJSAral3lFGBfheGqpxNGX2aLrYtt?=
 =?us-ascii?Q?mQDblLpaXTUWNYrsSUDOpVJHZr2bahgcWt0nCwMdHVRwn2F2JuijKddDN2tT?=
 =?us-ascii?Q?Qrc2Hx7LMTdBKJEYkMakvUGGcBrTGeAkqIxi22DCPb07OGF5P8pDYfA/myKI?=
 =?us-ascii?Q?TGsXY5jpfHQbFSQVskTn7MF4e4kX+uazt71S0urjni0xThrv14c/TUvKXizq?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9568c38-357d-4480-cb12-08db14547df5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:42:12.9250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STOr0XPQjiYhiBuedVC7wL8LCzgOUKTlGFAQcc/WV1nNCVDlFLq8hTmaicPVdthX+t/U0kxYZ1yyma2l1CkU+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 02:30:07PM -0800, Lucas De Marchi wrote:
> On Fri, Feb 17, 2023 at 03:28:24PM -0500, Rodrigo Vivi wrote:
> > On Thu, Feb 16, 2023 at 04:52:26PM -0800, Lucas De Marchi wrote:
> > > With the goal of eliminating i915 includes from xe outside of the
> > > display area, it's better to use relative includes for the only shared
> > > header, i915_reg_defs.h.  With this the build system can be changed to
> > > stop adding i915 as an include dir.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/Makefile      | 120 +++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   2 +-
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   2 +-
> > >  drivers/gpu/drm/xe/regs/xe_regs.h        |   2 +-
> > >  drivers/gpu/drm/xe/xe_gt_mcr.h           |   2 +-
> > >  drivers/gpu/drm/xe/xe_guc.c              |   2 -
> > >  drivers/gpu/drm/xe/xe_guc_reg.h          |   2 +-
> > >  drivers/gpu/drm/xe/xe_reg_sr_types.h     |   2 -
> > >  drivers/gpu/drm/xe/xe_rtp.h              |   2 -
> > >  drivers/gpu/drm/xe/xe_rtp_types.h        |   2 -
> > >  10 files changed, 125 insertions(+), 13 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/display/Makefile
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/Makefile b/drivers/gpu/drm/xe/display/Makefile
> > > new file mode 100644
> > > index 000000000000..eee576972427
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/display/Makefile
> > 
> > shouldn't this patch also be modifying the drm/xe/Makefile?
> 
> sorry, while trying to resolve the display situation I squashed this by
> mistake here. Next version I'm giving up on the idea in this patch
> and I will just create a regs/xe_reg_defs.h. That will be the only file
> with the relative include.

But does this solve your main concern of the i915 directories getting
included when display build is enabled even for folders that are not
related to display?

> 
> Lucas De Marchi
