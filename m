Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4604C07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332A10E188;
	Tue, 28 Nov 2023 20:57:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386F10E188
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701205056; x=1732741056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k71ZTWT0DNJPLPx9GHSlt4XwVerOj2tLcUDZuZVwXK8=;
 b=LE7L5SfNGIeMMZslU4lz5C5VlkErB7OxF0nLbcUtmVYDulKItcmuEOjK
 VY/DcPUZx7sMCdZZzl4RQdKiolrn3sBMivdUrHE05zI44Shh6hXHgH1Sk
 H5wyiVcpLUX5D9ylu+q8wRFZtrmr00eFObK5dI99vqwvbtPExWqfxLryl
 QM8eJWreP8xExYfmYrR4UwxyTfU/AL3cdO3gEyPfb9VrMsEkWfgHD4Wa0
 3QotDDuu7X4ovRbCYgtFLZrCqRM66sJkkSYjWEel88Tmq4wuNdOb0cWIP
 w7sqJR5FFVLgKzB3eMwdqwMbXBQopZZqqIUW/YjwwqKdiIIEIDblipJqo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457358683"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="457358683"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762056359"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762056359"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 12:57:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 12:57:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 12:57:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 12:57:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPM076lFpaeu4vdN9iwL9IAsnA/wXDK5txG4FtXK0MsYSkTEmQtdKNUTPQZ/mHcexlIwX1H02oO6djOaPZLjLYcasCuG1dfR5c89YKiTof/qmQxzzmnb2/VPLdrCKTgjGqr836ktEONlSj9jEvR9QkuuZzHiauRbCC9JWNPYwzsINnIFISoNnZ5ekNlgQGsSiWHi6alu8nlApcVVEO4Aw1UT6/IzcQZtjT4sB5H08XBNm1nz4b3LTZQZkRJDOAGBP4IYHrHv4ptT/Sb2hd9ILM0oZVXMIgvt5gnaKT6J2YP9S6diNClTmFqY2G7ARR8P0KmepB5fq7XNhwDpKve34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk4FPtLpKZE8+kJ/YZwkwNEGp/mi9h7Rzy0ly7IkZ4Y=;
 b=b9Wun82VNpkoUbiq2M0+oLuUGeTHbtiZyGvAhUSMZnBX3WRdMCMAITprPwGHHrOjcYyx59sOjiUpjPd0T6PfAEVIJbmubmRvkbJTdhjYXVQbOXUe8yrvtVUJtzF8Lp5rNqVG8F/e1Df6PHk+QdhgR3+zKaIQakajnsSXaPxTFP0IPJZqvJmNRKfWlgVa64koVftvcGd8826AOF5TZYWylK3PUoBPrkC4BbRg+zOjTxYI+Di2WmuGqltmKTOntv9513AMPuFUwcnPz53jDfPVbYR3nXYR6dAKW1teXgX14KE/NiwfyWEI/1zPZ9VJxyH+MnssTiw2ntoY4BspO3Y6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 20:57:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 20:57:12 +0000
Date: Tue, 28 Nov 2023 13:55:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZWXxXAQLjYdfOEwP@DUT025-TGLU.fm.intel.com>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
 <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
 <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: a6717dc7-41bb-45ee-0eef-08dbf054983e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qn3lE2jVPbaaXCwqLn6jb5/XRLTlPJoBIYgKf0BirbqHL+umiycSZcCXubkQit5UfJ7GD+jKFUM+9QS1s4a18kswZKA5EEBYZCR3c3l6ZVLAjxSOLq3EgP2kld3u1DAc1+0z1F+dH2Tv6LQwut2k9PWbeJHGny7PlktJ7Z+75VqGGUzHaXwIiUhPRP96tZtLLVaSPDUSmVBc13ZChln/Fu5dC201TzY7XRPm3kTpAnQ2eT2ezK9HlmEvSLknsg4WwCeSjvIPmCnozxwKA4TzdeYI1O1kRK46e8qLdOJKX28zZrXR9m8AIXDlDia8cffcS3XsK1gn/BCM3guqNqp7CpYKkrPtmJGozrN9CylRcAWblcsbjUCS1T/lFuveo0Px/vkVdmRBHzOPAuNAmhsyQRLWGIIy+xFu0tBWR+UrRMxj0+f3iaEnBHs+awfC7dcGsEWK/gQXBWXmlLWqUJPiXuKZlCXEHVITlI71kxh5T9ory9vEShOKdNaOslhSNZWQ+ejjPeG22WFFBA6DkXPDSYBlW5S0K+Gd7dBhQX/dHWYHSaX0U17bHOxHwE0W38y4MkDhlhVIEgbnG+2IANaQCe1WlLLzAlRUJStDw1XJQd4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6666004)(8936002)(4326008)(6862004)(8676002)(6512007)(6506007)(66946007)(66556008)(66476007)(316002)(6636002)(478600001)(6486002)(38100700002)(41300700001)(86362001)(26005)(2906002)(44832011)(83380400001)(82960400001)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XctFGLIvzCm2YyywCADwj2jktxSpEhDqUOTp+o1BahMa+NqssuBhQ126XQXT?=
 =?us-ascii?Q?hkNaHWcvO9lc18/SiKwZ2g93ndjwBiEbtmn5EJecDoYhqH4KAnPlRjZ8meRJ?=
 =?us-ascii?Q?T9B7Y86XhYh18V6QMd+8RWbJb7rWC7k4CYJeQeDFaeriNgpB0pS3/bSQRDnQ?=
 =?us-ascii?Q?d704VpDc+ukY73XxZDL9WJoS/ZAQeAyl4gFOcgb6u7lnuT0koHLsjCpFJwdr?=
 =?us-ascii?Q?P5qaQTq/vUbCHDem8IqUSj27WL5g9piuCLdryHVxSt7usrz/++GzveqOW0Zv?=
 =?us-ascii?Q?hm5BA0S5CyI3xENuSE7/4QA5pVoD5v61FLeijIOa7IW228PkHOiZmvKyHGW8?=
 =?us-ascii?Q?Ay7Zr5iaKhkDwggmgEXeNgCsU1hcDP1cVIOHw/kGnZVUz1TW9/ZNLnQhPn3M?=
 =?us-ascii?Q?eHCqgBS83+M9VR573owd9HAUnsSMuRBS7tClnf8y8C9s6sA6vMh5VAPeqpAx?=
 =?us-ascii?Q?piR8hdWQiRdyhqU/yignWV1y9HtFzqDU88xFsRrlnVvcANdbu1J19SZ14zHv?=
 =?us-ascii?Q?ewLPyD2liV4xCKb7wf6TZ/eVC9ezETDhsEDPkJdQUYRCLDPS0QfCpTTzS7Vp?=
 =?us-ascii?Q?WYyXXUcNvrha8grOWQQQN/WJChXkCb8KdjCazbhcpelhwTr+vrrsxx44xGjv?=
 =?us-ascii?Q?h5MAeeMu/iSFa4j7PJGqI9TL54geDbgs6psKiGmWC4+6O6DPzStWH/Mbsypw?=
 =?us-ascii?Q?yocVODTSlpurNxA/tMureYyL4BXSrb5ZjUw1D9bJAJnDMSBAraJu68IDsrDi?=
 =?us-ascii?Q?rPb6RjNC9pGOf9DBGy8CAOGsHX6GyvC3gfXXDCmgls0Wd6sPsIrzZUgsGAxB?=
 =?us-ascii?Q?oLcpkNtobBr5YEYHBiNCyere830wwk+3tOIfdJHk9TTBAo+he6zrjLvhPEiB?=
 =?us-ascii?Q?PR+yajEmBwn0hUE2Kgn73cHYcBetCpQp4Cw8XB5ZF6W34buRqv2Zc2woEe0V?=
 =?us-ascii?Q?uNCK0vZ3/aey+dfOFNrMfxiPWYrdVPAuh7z/xFVoKpGamE0a07CvRbgene94?=
 =?us-ascii?Q?AI9B1/Un2VnQgY4S2L2PgpyF6eTvWSLep1GtiLFO+FUEB65kUC7rRkk92zoC?=
 =?us-ascii?Q?nrlZ0KdiDBxgU7af2/A2pLAFvFMhV+DFaX7jUjLM+BKWN0GLs96k21qzm8z7?=
 =?us-ascii?Q?8VbdtiqQFfJnvR7IBbI9PNixd3HLaWGSuJ+sZijiZoSQuf7NUQSfMnSe8HRy?=
 =?us-ascii?Q?c8gYBmMRjPSe1I0g5vJkTyQTe09D/0PApKjPxGXdc/pX7XjvqWXH5NXWB8LG?=
 =?us-ascii?Q?XLZhnsGwQE8fgtqoyHbJQJi0vqTbpTcTwYEhVQAK+Hay6mzgAvz9nHfW5Ida?=
 =?us-ascii?Q?TCs3z5+F/EpZvb8PP2xpyvxH0EQO6VI6pVvXej7UvsLmYRjvQnOsjd27F0IP?=
 =?us-ascii?Q?vsedvysMnPxlPeSzEWRGnAUkbOzDcad5C8yG74+Fp0xo87xhnVHkIqr9kPkQ?=
 =?us-ascii?Q?UkCTjOHjugwk2UvoB1piVVqw18HKK0jp7mujAiYDcBQFXgqY1Ry0zxDXZFy0?=
 =?us-ascii?Q?n5KRCkAVWzjVRCE+jzfJv7zrebhQsyiyPbyperl2DsWDt6kXIr57mcr08Ox9?=
 =?us-ascii?Q?YxvXHsvFjV2evCf3TqeLfC3A1nkNBH5/CMNvHZUH8Krro6U+sVKqj8V/9Ztz?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6717dc7-41bb-45ee-0eef-08dbf054983e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:57:12.6649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rhKtKIcJDSRqFfJDDc4zzidLIJvw+IRzkRcLHTO/71j4EYiBr57kS7BdDh1f4oJgGWZpclNmEe1JmBCEGpuLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

On Tue, Nov 28, 2023 at 11:45:36AM -0600, Lucas De Marchi wrote:
> On Tue, Nov 28, 2023 at 08:47:59AM +0000, Matthew Brost wrote:
> > On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
> > > On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
> > > > Currently WA processing for gt is happening in early init API.
> > > > It also includes processing of WAs which needs filter based on
> > > > hardware engine by looping over number of hardware engines in gt.
> > > >
> > > > However at early init stage hardware engines are not associated
> > > > with gt in software which skips processing such WAs.
> > > >
> > > > Example WAs which will be fixed to apply after this change,
> > > > "14011060649",
> > > > "16010515920",
> > > > "16021867713"
> > > >
> > > > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt.c | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 0dddb751c6a4..3d0f7b6f952c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > -	xe_wa_process_gt(gt);
> > > > 	xe_wa_process_oob(gt);
> > > > 	xe_tuning_process_gt(gt);
> > > >
> > > > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	xe_wa_process_gt(gt);
> > > 
> > > the problem with that is that if we need to touch any register already
> > > touched until this point, the workarounds would not had been applied.
> > > Digging the git history, I had added this commit exactly to be able to
> > > initialize the gt workarounds as soon as possible:
> > > 
> > > 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
> > > 
> > > And then
> > > 
> > > 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
> > > 
> > > Note that these commits are in the xe branch, not drm-xe-next.
> > > So, it was:
> > > 
> > > 	xe_hw_engines_init_early(gt);
> > 
> > xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after
> 
> did you mean "has to be" or "has been"?
> 

Sorry, "has to be".

> > the idea is gt->info.engine_mask would be set by reading the hwconfig
> > table from the GuC rather than from a hardcoded table in the driver.
> 
> like I said, the problem with postponing that is we could have hard to
> debug issues because we will think we have all the workarounds coded,
> not realizing it isn't applied to the early stages of hw initialization.
> 
> I think we should go back push back on the idea of initializing the hw
> engines array after loading guc... it doesn't make much sense from the
> engine initialization pov and we are *not* doing that.
> 
> static int gt_fw_domain_init(struct xe_gt *gt)
> {
> 	...
> 	err = xe_uc_init_hwconfig(&gt->uc);                                   	if
> (err)                                                              		goto
> err_force_wake;
> 
> 	xe_gt_idle_sysfs_init(&gt->gtidle);
> 
> 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> 	gt->info.engine_mask = gt->info.__engine_mask;

Right, we don't currently parse the hwconfig to get the engine_mask but
eventually they should be.

> 
> 	...
> }
> 
> The engines available are not hardcoded in the driver. We read the fuses

The initial value of info.engine_mask is hardcoded in the driver, the
fuses adjust this. Eventual I think we want to get rid of all platform
information hardcoded in the driver and dervive info.engine_mask from
the hwconfig. At least that is the goal from my understanding.

> to know the avilable ones. That is sufficient already to loop through all
> of them. Note that since it's *engine* WAs, we need to pass those to GuC
> via the ads since it's GuC itself that does the save and restore.
> 

Yes, but not for hwconfig load. We can load the GuC to read hwconfig and
then properly populate engine WAs list when the GuC is loaded for
submission.

> > Likewise for_each_hw_engine should only be called after
> > xe_hw_engines_init_early is called. With that, I think this patch is
> > correct. Does that make sense?
> 
> as per above, no. I think we are overcomplicating it for no real
> benefit.
>

I agree this is complicated but I thought this ordering / reading the
platform information from hwconfig was requirement. Maybe we should
follow up to check if this is indeed a requirement.

> > 
> > I suggested to Tejas that we add an assert to for_each_hw_engine to
> > enforce this is called after xe_hw_engines_init_early to catch issues
> > like this too.
> 
> I think that is already clear. Not sure it deserves an assert. The
> assert would for instance trigger right now in calculate_regset_size(),
> but that is harmless. Also we'd have it spread through the driver.
> 

Well an assert like this would caught this bug quite a bit early.

Matt

> Lucas De Marchi
> 
> > 
> > > 	...
> > > 	xe_wa_process_gt();
> > > 
> > > That gt_fw_domain_init() seems a very poor place to initialize these
> > > things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
> > > minimal GuC and hwconfig read much earlier") and then people end up
> > > adding random stuff in that function :(
> > > 
> > > So I think we need to get back to the original idea of _early()
> > > initializing what's needed. Then we'd probably need a few cleanups in
> > > the initialization sequence so the function names at least partially
> > > matches what's being initialized.
> > > 
> > 
> > I agree on that the naming of all of this could be better...
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
> > > >
> > > > 	err = all_fw_domain_init(gt);
> > > > --
> > > > 2.25.1
> > > >
