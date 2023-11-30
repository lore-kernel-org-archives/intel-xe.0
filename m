Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A6C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D65F10E37C;
	Thu, 30 Nov 2023 00:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E159C10E37C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701305849; x=1732841849;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MrzUrsxgI+Ik6sy52TIVuZO+NC0pX+mf4FcV6KWog5U=;
 b=dt6fIMG6Y2ZjD9TKl3BVipE5ZxzHaqxNmi6mAyhcwDHnFxSmUX3ZvEHA
 E9p4LcyEvXwRHpHyn+AKVzK/kxqyaqx+WVX6YYDi5+Hoea03AoNSrHGWI
 XC8jbgwDr3fnwT9bBgaP7IsY+A9Nw6xVThxFK3HgZKasi8dMg/GfQKxKt
 yVMVBHP3jEjtfa38qAxeS04vIzw5ezql3eWCEw/5maQrMc8MwfhtNBGoj
 erLRN0KYOCDh+p0bGW2n0TyxEKsAXCi0pdUvDnd1i2Oiw8mXgaVrW8c04
 XdHAHwFSeQ7hMTyKhVxm1IIEvTtFXCS4qDQ2mQAbcpjyFtpyepxKvHTmB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392993231"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392993231"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839627589"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="839627589"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 16:57:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:57:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:57:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 16:57:28 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 16:57:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYEEJvT+WxeJbi7Z3uXtuavYVQKBF8t7payeDN2tMLnlh6RbMm43nDYaCfgfHF8HreqVqC4V4W4+prnrHCRFOX7ljwomIyUvm+kHnqN2gxYr3UdQgjI104C2k733DsTe9znoOAic4vn+JxmTzkX/3RcIgXdx/4aXKuLI+WFI66/w5Wgsw9VBXnkGuWQriAoxUS7Lowqr3XQockxqgp2MPmjTU0xiH+VOgOnQ/jgoXmOabxSk5LlmZw5h1kevOP5yM7YCAoChBEs1Jvmym2rzRizycMHb9DdM74D1KmlLkWh9/Ls9MuPMh6IC3ff5qfrVvYiki82TqqSbJzno747IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaT/xWLyCUuxzcHpHq/e9HsOPetNkbmCkh4WUrSsmaw=;
 b=Hf6NUMPETIv2Ai2ckBLdgspH8bqrp8Eumho+ZLzwsQ5XZFHH2JSsOcM0TIaimFsuy4peWhIPEopvyw/aZ+7+pi9rSnjQr4xr20n3lh0ghY8BuQY40+7YHVlaubKJoG/1hciJAPwa42EcB5ONZA8f2BGYHgJjLfi10MdR21lQ94dcPnCLuh1o0a1SbvPSfCLvqkRcTlOWhFqUx5Oiwjo74MthOSnSfCQCvsUqGifrQ7hVv5mw4QkKIFAKzpIdux0Yl8L2ssIz3OMpj0oHfwztth2173NlpizUgnpsdTZlCDp3c9z69JgHOFriRoi8QDSvUQcDehgeLrMf/e8Jnlt1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 00:57:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 00:57:23 +0000
Date: Wed, 29 Nov 2023 16:57:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231130005720.GX1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
 <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
 <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
 <ZWXxXAQLjYdfOEwP@DUT025-TGLU.fm.intel.com>
 <rmydfe5prhckhm7lnsyyv25v6j53dw4kqjjos4eiilscgcpgpw@odhrkdpytyjy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rmydfe5prhckhm7lnsyyv25v6j53dw4kqjjos4eiilscgcpgpw@odhrkdpytyjy>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2576bdb2-369f-46d5-58bc-08dbf13f4f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvdKhdK6QyftP/KgdafEHY/gLldrOYRmxkYBkCk8umkilscsN+hBNVlQu/MU7Ki5t0v/nC6nSCzvc+6/gqrCYX99V1U0VRszi2wzKjYGdGSm84GvxuNsRXudTqLq8yLodkBEVWcVFiz1BRppkP7oazOiQ/VPxvkIAsurDsiOzVDUnTWpAFLMJvX/jn/zvbe6Cu/poMDIeLJmHW81vZ3z+7ZRDDk/rsgk4RXA493g3RkSDwWTKbjapbtJg2o5jjR5AmRIW/KsyrlkW9Xi8/gV6hO9t5tHmgRGU2lapMKVpOQ2Fj8+RdwDYB2quThj0b62Y9KnbUdZMBj5esvJmYFNxvIfJ3n2yJdEE9mkAtTbiHgp0wsCC8ZIFbN2tUlyDetEtAFiW2t7H0uxqmlZNZn/IyGpmYoqtozqEzZqLE9N+NPnSMnqO5oNSn9ThYyXazxY99v+Ku9RLmVsVEOD1B8G69c4Nxcq7NsJFzslwUxR58A7bbPMSMDZezalfg25ekLJxsflptfDUjsR2mheoT55mr8SybcA9plXE7kWyGs56wwWjMRKICcj9tOLA8jX/darppAuuhDgRlDcxWUVG6ca/Ik//FBklY/oIyMD7qWZPbJ+frBYQeJcbwY3trIUIpoBfca03lOwOYLFFlTDkAJ/3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6512007)(82960400001)(38100700002)(202311291699003)(83380400001)(2906002)(316002)(6862004)(86362001)(8676002)(5660300002)(4326008)(8936002)(66476007)(66946007)(66556008)(41300700001)(6486002)(6636002)(478600001)(33656002)(6506007)(26005)(1076003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QadbeTnGVP+KI5be1KO2kSDuFR63lQqd+Yett2oxR0jLn5pSsKYoZUjcEV7r?=
 =?us-ascii?Q?2ZQI1kZQQCUSM1wZh9BGriSRKVnNxKkUnDJu9lRH8Of0cd+Weut37s0vj00i?=
 =?us-ascii?Q?5T8Tfc0EUDqHvJOxZHDK/DYnBOfmUR2slCSA3LUYDozm5FCO5SG8nXEpiefV?=
 =?us-ascii?Q?i/9YZpz8hTYGOUciwS0qDTdmqcMd2ise9aOagMWjOx+t0djQ4BeOt20ls4/g?=
 =?us-ascii?Q?bAaAp3b1y1rRvhAXDhkByB5Vn0ZfxNic6ocAkDlnyGscEhzlAFVslF/hvRp5?=
 =?us-ascii?Q?E4N7gPOi6CZfFwenC/NJqFuOxAfq3LW/DL0wsz5ZKH7u2cwBZmGmZG3Rz0to?=
 =?us-ascii?Q?28F+WC3PB/CfB7KDi3AqZHh7Xrh5jS6EhMXHe2XvWP/YHc7PcrLdqlDO9HcX?=
 =?us-ascii?Q?Nu3JiCP8bBNk+69UZ/d5X9eIy/Enj20vkoM1PQHrVt2Rqj/AC8wo9CAiTJhm?=
 =?us-ascii?Q?4r0+vtHiDICAzUV2uKVV/afYLuoY3yCg9h6c5oYTha7+s2viRY2aszEZJpwV?=
 =?us-ascii?Q?eYCzF/i8GYTlIKsbb5pQVzlgPeOYY98JTgg8SWjUQvwssg/e/MjZIfBtUh3p?=
 =?us-ascii?Q?/4apfA8gD0phUN23dpFrY8E/uRRbu+D+pKrHP4o6AE6drPGag568XTyf15gN?=
 =?us-ascii?Q?/M/UvqHI+TJXlpVpotEfiNSlvjRcId6SnKXs5bpKcmtcC0iKeP1CQNEZvrZN?=
 =?us-ascii?Q?tgM2BgDJAwFCAyazmLxK4pln9+14Zo5yqSuPPph7IP7Upb7PT3rZ7fZKL6SQ?=
 =?us-ascii?Q?qckH+eX3AHSQGTT8jn0rqxMcqXu7wrktRGZ9Vki3MJelr0C5g0E7Wbzrgcn6?=
 =?us-ascii?Q?pcI8Cjv80pzSTlZWkUi0vMdurPaHC+99peGgOqCJGG8RqBDmlIi+ke4BQo/S?=
 =?us-ascii?Q?VmM/mdaSA/72maXzuEABEDFIPwavvx2yieqnXReTcfVyi4bMs9autsaY7Bsi?=
 =?us-ascii?Q?mczTxnvcTt5MfHl6v9NrEqasZUtHFcPLLEEnGiVYIoMX8NK7UA2BuZikDMKK?=
 =?us-ascii?Q?ajiC8qHjnHX9Ku/5r+l2golvpb/588dc1ihjVm1SVJwU1ufHrkui1I3ghaTB?=
 =?us-ascii?Q?LmVHVdWSrFStNDypHKfQExwYKjve6JMY7RQC+doBZiWFgvRYexLBhCPMeVwq?=
 =?us-ascii?Q?HKxTEhbcIHiglRwrg9snEXJFbVxjYse86kyUTMZ7iGv9dF1UCCkrlCJJQNlX?=
 =?us-ascii?Q?sNrK9rou17FAEnA6sVGqfq7biCIwSOq8Rb5vINd+vJKfhQu5QgOcy/c2LihJ?=
 =?us-ascii?Q?5lj9n3gYIblLMZBGv1SdwBF0DFccfxKI7Yls4W0YjM31SqSNRJp4gGFk7y1l?=
 =?us-ascii?Q?MgmYqxOd/Q5D6KsjHHpi9J6Mcl5+5JZQHeQ0IGBjPUAwxp/4wMRLXNx0R69a?=
 =?us-ascii?Q?UYM2kwPfBy3y/aSaGSUH7X2KoYYKr5nsGaNkIhnaFxGXc/ZrmtlSCSTV7B43?=
 =?us-ascii?Q?cZWR4IS6AoTxV5hGkLmMbgsTIdHzqymsO1PLYZYGOPsE+JrrK+G5ATQq67U3?=
 =?us-ascii?Q?V/lOTjVyvg/8Nixo+c50paAGlC3LTheNI2SrPNev4792J2zP/yamWzbt1GUm?=
 =?us-ascii?Q?fLCfvaf8Qwbi1pLzxU0z49/uHjkNQLBa1LGDS7HPJiFQ0FGYnJ2kpcY0G9w4?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2576bdb2-369f-46d5-58bc-08dbf13f4f9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 00:57:22.5467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKc6C//k4tlS++GRjksayMrC0AHI6xJ+ecd8XKvethtv2pMsBqbhEVrvJYdkom2M/LOBpWBV4G6mkrFVmBAxcwrBRafSbuQKwGjmdngnO88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

On Tue, Nov 28, 2023 at 07:07:39PM -0600, Lucas De Marchi wrote:
> On Tue, Nov 28, 2023 at 01:55:40PM +0000, Matthew Brost wrote:
> > On Tue, Nov 28, 2023 at 11:45:36AM -0600, Lucas De Marchi wrote:
> > > On Tue, Nov 28, 2023 at 08:47:59AM +0000, Matthew Brost wrote:
> > > > On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
> > > > > On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
> > > > > > Currently WA processing for gt is happening in early init API.
> > > > > > It also includes processing of WAs which needs filter based on
> > > > > > hardware engine by looping over number of hardware engines in gt.
> > > > > >
> > > > > > However at early init stage hardware engines are not associated
> > > > > > with gt in software which skips processing such WAs.
> > > > > >
> > > > > > Example WAs which will be fixed to apply after this change,
> > > > > > "14011060649",
> > > > > > "16010515920",
> > > > > > "16021867713"
> > > > > >
> > > > > > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_gt.c | 2 +-
> > > > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > index 0dddb751c6a4..3d0f7b6f952c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > > > 	if (err)
> > > > > > 		return err;
> > > > > >
> > > > > > -	xe_wa_process_gt(gt);
> > > > > > 	xe_wa_process_oob(gt);
> > > > > > 	xe_tuning_process_gt(gt);
> > > > > >
> > > > > > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
> > > > > > 	if (err)
> > > > > > 		return err;
> > > > > >
> > > > > > +	xe_wa_process_gt(gt);
> > > > >
> > > > > the problem with that is that if we need to touch any register already
> > > > > touched until this point, the workarounds would not had been applied.
> > > > > Digging the git history, I had added this commit exactly to be able to
> > > > > initialize the gt workarounds as soon as possible:
> > > > >
> > > > > 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
> > > > >
> > > > > And then
> > > > >
> > > > > 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
> > > > >
> > > > > Note that these commits are in the xe branch, not drm-xe-next.
> > > > > So, it was:
> > > > >
> > > > > 	xe_hw_engines_init_early(gt);
> > > >
> > > > xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after
> > > 
> > > did you mean "has to be" or "has been"?
> > > 
> > 
> > Sorry, "has to be".
> > 
> > > > the idea is gt->info.engine_mask would be set by reading the hwconfig
> > > > table from the GuC rather than from a hardcoded table in the driver.
> > > 
> > > like I said, the problem with postponing that is we could have hard to
> > > debug issues because we will think we have all the workarounds coded,
> > > not realizing it isn't applied to the early stages of hw initialization.
> > > 
> > > I think we should go back push back on the idea of initializing the hw
> > > engines array after loading guc... it doesn't make much sense from the
> > > engine initialization pov and we are *not* doing that.
> > > 
> > > static int gt_fw_domain_init(struct xe_gt *gt)
> > > {
> > > 	...
> > > 	err = xe_uc_init_hwconfig(&gt->uc);                                   	if
> > > (err)                                                              		goto
> > > err_force_wake;
> > > 
> > > 	xe_gt_idle_sysfs_init(&gt->gtidle);
> > > 
> > > 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> > > 	gt->info.engine_mask = gt->info.__engine_mask;
> > 
> > Right, we don't currently parse the hwconfig to get the engine_mask but
> > eventually they should be.
> > 
> > > 
> > > 	...
> > > }
> > > 
> > > The engines available are not hardcoded in the driver. We read the fuses
> > 
> > The initial value of info.engine_mask is hardcoded in the driver, the
> > fuses adjust this. Eventual I think we want to get rid of all platform
> 
> but it doesn't matter much. Even if we were to read from the hwconfig,
> we would still have gt->info.engine_mask with the upper limit and then
> use the hwconfig to trim it down. How different is it from doing the
> same thing, but with the fuses? We don't do that today and keep a trim
> down engine list, but equally we don't use the hwconfig on
> this part of the initialization. The hwconfig could be useful for
> something else, but I don't see how it helps here.
> 
> > information hardcoded in the driver and dervive info.engine_mask from
> > the hwconfig. At least that is the goal from my understanding.

I think this has been mentioned in the past, but there's no expectation
that we'll ever be able to read engine masks from hwconfig.  In general
the hwconfig is never supposed to provide device fusing details.  You
_might_ be able to get counts (e.g., "this SKU should have 3 BCS
engines") but it will never tell you which specific engine instances are
the ones that are available.  That information is always expected to
come from the fuse registers instead.  The same is true for other
hardware concepts like DSS, EUs, L3 banks, etc.

The engine masks we define in the device info are the set of engines
that might ever show up on the platform.  The full set of engines might
never be available on any SKU of the platform, but the constant engine
list serves as the starting point which you then pare down by reading
the appropriate fuse registers.


Matt

> > 
> > > to know the avilable ones. That is sufficient already to loop through all
> > > of them. Note that since it's *engine* WAs, we need to pass those to GuC
> > > via the ads since it's GuC itself that does the save and restore.
> > > 
> > 
> > Yes, but not for hwconfig load. We can load the GuC to read hwconfig and
> > then properly populate engine WAs list when the GuC is loaded for
> > submission.
> > 
> > > > Likewise for_each_hw_engine should only be called after
> > > > xe_hw_engines_init_early is called. With that, I think this patch is
> > > > correct. Does that make sense?
> > > 
> > > as per above, no. I think we are overcomplicating it for no real
> > > benefit.
> > > 
> > 
> > I agree this is complicated but I thought this ordering / reading the
> > platform information from hwconfig was requirement. Maybe we should
> > follow up to check if this is indeed a requirement.
> 
> What happens when we need a gt workaround to be applied even before the
> first GuC load? This patch moves all the GT workarounds to happen after
> the first load so it potentially creates issues if any of the current WAs
> in gt_was[] are needed before that point.
> 
> The alternative, adding yet another WA type for when we need to decide
> on the WA by looking at the engines it has, doesn't look pretty and also
> complicates the decision on where to add new workarounds. When Tejas
> asked about the possible solutions and I mentioned making the early
> stuff happen early, I was not thinking about moving the WA processing
> after the hwconfig, I was thinking about initializing the hw engines
> array earlier like it was before.
> 
> I think the possible things to do are:
> 
> 1) move the engine mask to be initialized earlier like it was and stop
> pretending we are getting it from hwconfig
> 
> 2) what this patch does, moving the gt WAs processing after the first
> guc load
> 
> 3) split the gt_was[] - all the WAs that need to check the engine in the
> GT would need to be applied later
> 
> 4) ... something else?
> 
> I'd say my preference is (1), (3), (2).
> 
> > 
> > > >
> > > > I suggested to Tejas that we add an assert to for_each_hw_engine to
> > > > enforce this is called after xe_hw_engines_init_early to catch issues
> > > > like this too.
> > > 
> > > I think that is already clear. Not sure it deserves an assert. The
> > > assert would for instance trigger right now in calculate_regset_size(),
> > > but that is harmless. Also we'd have it spread through the driver.
> > > 
> > 
> > Well an assert like this would caught this bug quite a bit early.
> 
> ok, fair enough on this one.... as long as it's behind the debug
> kconfig, it should be fine.
> 
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > > 	...
> > > > > 	xe_wa_process_gt();
> > > > >
> > > > > That gt_fw_domain_init() seems a very poor place to initialize these
> > > > > things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
> > > > > minimal GuC and hwconfig read much earlier") and then people end up
> > > > > adding random stuff in that function :(
> > > > >
> > > > > So I think we need to get back to the original idea of _early()
> > > > > initializing what's needed. Then we'd probably need a few cleanups in
> > > > > the initialization sequence so the function names at least partially
> > > > > matches what's being initialized.
> > > > >
> > > >
> > > > I agree on that the naming of all of this could be better...
> > > >
> > > > Matt
> > > >
> > > > > Lucas De Marchi
> > > > >
> > > > > > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
> > > > > >
> > > > > > 	err = all_fw_domain_init(gt);
> > > > > > --
> > > > > > 2.25.1
> > > > > >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
