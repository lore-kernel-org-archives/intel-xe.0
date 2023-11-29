Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF068C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 01:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678010E6A0;
	Thu, 30 Nov 2023 01:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D992310E6A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 01:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701307546; x=1732843546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LzPF3jZymcD/uJXhZv/v+qLYA6R+KRLs5UWOvncsheI=;
 b=S3+T1DWn0AyCL/8jXtv7RXUm7OiqosPN0K/vavF3Y52pVpBg9Hm0qqW6
 JYzONH03NR34xZzii/AfJrKJUL3F9KX55oz5IY5uOvq9eQtShgrBncCnK
 IqwUiZWNinWtyqbhn72DrHbNtUgy7Uy0u+y3hMbhvH77FnvvwNkRwq5u8
 +kLZxYq44T1RW3GPekcHP9zEs8cpmQwmHiSTQvsZNpidQE+1Upq5iAUT2
 vTIF3vI8fYz8idrUhzuAFmnR8I/NEYyeZOtBspHzNHCmdVIiZLwAjgyK7
 rkZ8oXXGidvMkae4u1B+5g7ad5M/Yp5nCV9TOVV7UmN4UR1o4zfuIstVe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11953670"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11953670"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 17:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718937771"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718937771"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 17:25:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:25:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 17:25:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 17:25:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 17:25:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAbimCvNTuzWFT1jKrhZi7kmVS+UrvKFs5F8U41z37FmJroH5CxtmyssBnre0riOzf+F1zoqSRV79ZoX/Iw0QOpbqWRz/fLnV9jSqpDEP+DE+GSqnrZI/B/wftZQ0Gt0wIfyATfatZTvvWdH4PrkTBFgcdSZ8GjhAf7DZchkOzANvIUFF2wHLnmRw7f1GnuEit4JCPF8E7kvV4wGasJqNeMrtn/ij3CXM23ZYW3sBbMwucRUH8xBnX3Ge5XbJ4Dpd44ZV48ckhS1mIx49txMrgytw7W9DGwTbsmOCCaUzAp6AT7RE9YhsC+Itfyx79fxo96AvLrhFIDqmHklFGyH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ignsgROFDk+X5OtqCHQ3l4ogRtqHCD3/rtBJSirzYuo=;
 b=HqH41V+/fW1o3MziVJu8KSNyUQyxgjkY0talbfTyu4WSbPFDh7HQ/FKKNXdWGk84MNDwnsB1DtD7D6fK1nYWpaVkHVCecmiqERAKBlYcS2x91rvLyIHbjuMgePr3h7G5sWxdeQXoiNPdEYkMKx5EtZagiXhdrl/EcFfs4qbiBEh3uzYEKpWgaoG/sHegZm7lmn6CpmLQ6bBJawGjOcqbkwDOt/kZtIFW21YeyvL9kUFHXNWQj3OfBs1KCWg1Z3kUSl+xpHgQkplNung+QSEbo8qynI1gN4QoQUlkzkjxNaCIu7KWDPbWDQiPg0ie+XblnxRvPHggabmtca1hoIbGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 01:25:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:25:42 +0000
Date: Wed, 29 Nov 2023 18:24:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZWeBxEEHWlNGZLFu@DUT025-TGLU.fm.intel.com>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
 <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
 <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
 <ZWXxXAQLjYdfOEwP@DUT025-TGLU.fm.intel.com>
 <rmydfe5prhckhm7lnsyyv25v6j53dw4kqjjos4eiilscgcpgpw@odhrkdpytyjy>
 <20231130005720.GX1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130005720.GX1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d29d65-2bd3-4eec-695f-08dbf1434492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EIUw7s7o907ZEA9kNPjoPMvgLtLh1WvVLQNts2Dlk9CtJXzteOZYEZsGmXh8m0xmqa6/ie11HV6Z+KsvX53oWZCaqwn+6Lu65tyorwuGXezc26DiNTNHPZeTrEkMUHlE+otU2+b+5k3X57LqM9dIafHMbsrnAvSnzHgP27bN8aydhFc8caPymMOiq31vbfsAStanHHjcGdtE6UIWJhmmc0ncBgkl3opZogshG8BtsXmujRDHBuxfztOJfVptfdIzhbADrE3Vi2Cbtaw7Il297ncpMPU/b7PO3QdYmu5GLeb+yNlRmnFzg+UFJfdLCT0ruusrlwzEVn8eD4+VrHw+QSW3LzaW4D3LF3TTEkmNDthaqDYNNHeT65cgjYXFb1ADRalCB6OOBoi2okzIFrp5Y8awBsHrSEUpmpoH1+oMWh97SMofKYO+lgHJNkak8jN+Bd6wkP2oLFk9tw3j7BgyFKUBTgBTuL+h1wQw3aHyRXMB7V8OruKtaclyDCPlK30tSptKGKxiOKOIko5soARx7Fcq8jUNfnjBH/T4XKT/qZyAbEbkvZY7xN7ncd4wRaTqFB1xbxfj81I5NXPCbG2x+gQeERoQqDmWG2NC6t525tPOx79OZTIZsSfh7JiL4kbzju4Gy7wet5jAp9kJgOvLi5Nka6Bo/JRCjZNnkE3bU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(478600001)(6512007)(26005)(6486002)(966005)(6666004)(6506007)(30864003)(83380400001)(41300700001)(2906002)(44832011)(5660300002)(66946007)(6636002)(66476007)(66556008)(6862004)(8936002)(316002)(8676002)(4326008)(38100700002)(82960400001)(86362001)(202311291699003)(66899024)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLmztdtvLjjegMAyNv89bOaIq1UmhgzfFv5qmwDOHCKp4qWcYWZYw3eJdPD4?=
 =?us-ascii?Q?uRkXJmUxBijTQfEamW5bvV+/aUwRMDxZ01rbF3Cet6bUyG/fxrLjVB//4OCd?=
 =?us-ascii?Q?ix9XWcB8BV9N3IOPhDW/i3XNKHwun6UJBG8wrCi5ImScfil4+uDfJTvZFH1N?=
 =?us-ascii?Q?HpJaZo64ztWM2At1vDBi4jzs7ipryjK9wz8ZHtVPNoyQFDL/wk7F857E+nmj?=
 =?us-ascii?Q?fLl6utCunhEOYGqCbJauQkehW5vx0sikoMMFbkBDWATxlK3Mhs7SOSA/2SBx?=
 =?us-ascii?Q?vhwZQA/Usr2PNsrdjIHunAat3VN6JYH1EwbFgSUdgDtPAgUI6GIM/7BQRRJM?=
 =?us-ascii?Q?0EU0LM8NfFu3XKA8gqgqZGlmHcWO7ZOFR7QvsKEJk/vFCPRiML5KhDYk+V+J?=
 =?us-ascii?Q?wQEmDvuPI7jI3p5XrPqEfBao0Y8//hQrj6Qy23bWCTEpGaNBMn+3VvNfY94l?=
 =?us-ascii?Q?sQwRvrPvbiT+y+sceUHedr+2kqhY/E0ii3TYlTmBWAl5IPgeE8iQQOxqJPfB?=
 =?us-ascii?Q?+N7iilvmpoRqr7aJSdx8IxB6k5Lc41EYtpMaVtIUyur4dH7wQMVFiwkELv4c?=
 =?us-ascii?Q?V27GJ72XWjpRcz/RQE6L9aqvjAACDntz7SXokfbXog9CfhSAJ4/vfLrvrWnA?=
 =?us-ascii?Q?hrX75BHN3DKTS4/wFN7bIHAVZLeGtcmsCJS6VopmE7yhVOyn3aEZ1XspAOPa?=
 =?us-ascii?Q?2ZQULfr/Ckq2KrLjAYX2Zh+TqvQWcfo/6DDLkZOpv+ehaNB0N8LB1EltBLUh?=
 =?us-ascii?Q?lPMSTJNSFY0s/Ctkj7b4iXoHDcp40btaVd2k6rsNAdeJdaa3V/pcTm0kwnIT?=
 =?us-ascii?Q?MnioBRg2Y/MD9LjBDHT53VcnYJ6wgr2JBuBcujiGKOGLWPH4jH3U6U5IpkXX?=
 =?us-ascii?Q?qRh6qKKCo9jxjkSpsFFx8HOLQMjrbgCGWZHTgxMAfWBmlaLNsOCXijMHExwg?=
 =?us-ascii?Q?1yQZvDWSJ+PAvNNi8HRHaZ9xVDXFGz2p2I7xkxZyo4N4hmEUWGsvPfCW4WNF?=
 =?us-ascii?Q?xuXzJFby6Jczz3aiUL0siOIjC1oZDRZ24rps+MOYuGlaMhHn/T44dFYUFcd0?=
 =?us-ascii?Q?ZdZsu8K/3GP3TyVylKa8MihVhFavmfzf9O+cIjUf6BOAvu/PDr0YrlcDLhc2?=
 =?us-ascii?Q?u5VPY/KDn0RRJX8BYaTOlO5oGUzuLZ5ZUlGw7HFe7JeiW2gBVaAQpgx3Z5n4?=
 =?us-ascii?Q?uhQJbvLW2pSWYuGvpOEXtMSa/ezC8JkaTuuEUqZK9OkO+zbIPQAbUym+8a0i?=
 =?us-ascii?Q?54lH70NsCwxzsOlfRT4b6mDshUekUfHiPYpWSPRSdndkBWQszFjB9useF8n+?=
 =?us-ascii?Q?SCC5Bh2xy2AYuZCmCiz53tKhRDlUxo/ZoByUYbZSxh4AP42fM31wVhnFF+Ir?=
 =?us-ascii?Q?eTN8dF0Nf2B9/a2IC4FR1CfTo8dXUklm1PLzEciW7GM4CCGdtUQY6F+6CJvc?=
 =?us-ascii?Q?nbgzCGQT2upt5FTMCKmDW+7sj6F6rt4MaYx/OZC7bwyKA2gbIv+k6jEs+eJl?=
 =?us-ascii?Q?hwQqdwq2bLWeRB2d02/G2m3L0uytb+m0GIbbct8ZY5POljhg0NscnLeFFCqK?=
 =?us-ascii?Q?i023Ul6srdfiiS6u6LGlEQfzgKi983NUPXeK7c1tdvHDDT2Rldf6Br9GzZFc?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d29d65-2bd3-4eec-695f-08dbf1434492
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:25:41.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSnTOlxrzey6+5gaTwbuUt9fCKQ+lS9D+f0y6F+VDYs1sLeV80ca60Z8nNOz2ZUEUNWSa5k6PmFLhqqCp3kurw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 04:57:20PM -0800, Matt Roper wrote:
> On Tue, Nov 28, 2023 at 07:07:39PM -0600, Lucas De Marchi wrote:
> > On Tue, Nov 28, 2023 at 01:55:40PM +0000, Matthew Brost wrote:
> > > On Tue, Nov 28, 2023 at 11:45:36AM -0600, Lucas De Marchi wrote:
> > > > On Tue, Nov 28, 2023 at 08:47:59AM +0000, Matthew Brost wrote:
> > > > > On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
> > > > > > On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
> > > > > > > Currently WA processing for gt is happening in early init API.
> > > > > > > It also includes processing of WAs which needs filter based on
> > > > > > > hardware engine by looping over number of hardware engines in gt.
> > > > > > >
> > > > > > > However at early init stage hardware engines are not associated
> > > > > > > with gt in software which skips processing such WAs.
> > > > > > >
> > > > > > > Example WAs which will be fixed to apply after this change,
> > > > > > > "14011060649",
> > > > > > > "16010515920",
> > > > > > > "16021867713"
> > > > > > >
> > > > > > > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > > > ---
> > > > > > > drivers/gpu/drm/xe/xe_gt.c | 2 +-
> > > > > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > index 0dddb751c6a4..3d0f7b6f952c 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > > > > 	if (err)
> > > > > > > 		return err;
> > > > > > >
> > > > > > > -	xe_wa_process_gt(gt);
> > > > > > > 	xe_wa_process_oob(gt);
> > > > > > > 	xe_tuning_process_gt(gt);
> > > > > > >
> > > > > > > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
> > > > > > > 	if (err)
> > > > > > > 		return err;
> > > > > > >
> > > > > > > +	xe_wa_process_gt(gt);
> > > > > >
> > > > > > the problem with that is that if we need to touch any register already
> > > > > > touched until this point, the workarounds would not had been applied.
> > > > > > Digging the git history, I had added this commit exactly to be able to
> > > > > > initialize the gt workarounds as soon as possible:
> > > > > >
> > > > > > 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
> > > > > >
> > > > > > And then
> > > > > >
> > > > > > 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
> > > > > >
> > > > > > Note that these commits are in the xe branch, not drm-xe-next.
> > > > > > So, it was:
> > > > > >
> > > > > > 	xe_hw_engines_init_early(gt);
> > > > >
> > > > > xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after
> > > > 
> > > > did you mean "has to be" or "has been"?
> > > > 
> > > 
> > > Sorry, "has to be".
> > > 
> > > > > the idea is gt->info.engine_mask would be set by reading the hwconfig
> > > > > table from the GuC rather than from a hardcoded table in the driver.
> > > > 
> > > > like I said, the problem with postponing that is we could have hard to
> > > > debug issues because we will think we have all the workarounds coded,
> > > > not realizing it isn't applied to the early stages of hw initialization.
> > > > 
> > > > I think we should go back push back on the idea of initializing the hw
> > > > engines array after loading guc... it doesn't make much sense from the
> > > > engine initialization pov and we are *not* doing that.
> > > > 
> > > > static int gt_fw_domain_init(struct xe_gt *gt)
> > > > {
> > > > 	...
> > > > 	err = xe_uc_init_hwconfig(&gt->uc);                                   	if
> > > > (err)                                                              		goto
> > > > err_force_wake;
> > > > 
> > > > 	xe_gt_idle_sysfs_init(&gt->gtidle);
> > > > 
> > > > 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> > > > 	gt->info.engine_mask = gt->info.__engine_mask;
> > > 
> > > Right, we don't currently parse the hwconfig to get the engine_mask but
> > > eventually they should be.
> > > 
> > > > 
> > > > 	...
> > > > }
> > > > 
> > > > The engines available are not hardcoded in the driver. We read the fuses
> > > 
> > > The initial value of info.engine_mask is hardcoded in the driver, the
> > > fuses adjust this. Eventual I think we want to get rid of all platform
> > 
> > but it doesn't matter much. Even if we were to read from the hwconfig,
> > we would still have gt->info.engine_mask with the upper limit and then
> > use the hwconfig to trim it down. How different is it from doing the
> > same thing, but with the fuses? We don't do that today and keep a trim
> > down engine list, but equally we don't use the hwconfig on
> > this part of the initialization. The hwconfig could be useful for
> > something else, but I don't see how it helps here.
> > 
> > > information hardcoded in the driver and dervive info.engine_mask from
> > > the hwconfig. At least that is the goal from my understanding.
> 
> I think this has been mentioned in the past, but there's no expectation
> that we'll ever be able to read engine masks from hwconfig.  In general
> the hwconfig is never supposed to provide device fusing details.  You
> _might_ be able to get counts (e.g., "this SKU should have 3 BCS
> engines") but it will never tell you which specific engine instances are
> the ones that are available.  That information is always expected to
> come from the fuse registers instead.  The same is true for other
> hardware concepts like DSS, EUs, L3 banks, etc.
> 
> The engine masks we define in the device info are the set of engines
> that might ever show up on the platform.  The full set of engines might
> never be available on any SKU of the platform, but the constant engine
> list serves as the starting point which you then pare down by reading
> the appropriate fuse registers.
> 

I think GuC CT channel is needed to read fuses on a VF so for that use
case. So in this case xe_hw_engines_init_early needs to be called after
GuC is loaded with the hwconfig.

Also BTW, maybe we should shelve this patch for now and respin it once
[1][2] is merged as bunch of driver of load is getting reworked by
Michal.

[1] https://patchwork.freedesktop.org/patch/569627/?series=126392&rev=4
[2] https://patchwork.freedesktop.org/series/126392/

> 
> Matt
> 
> > > 
> > > > to know the avilable ones. That is sufficient already to loop through all
> > > > of them. Note that since it's *engine* WAs, we need to pass those to GuC
> > > > via the ads since it's GuC itself that does the save and restore.
> > > > 
> > > 
> > > Yes, but not for hwconfig load. We can load the GuC to read hwconfig and
> > > then properly populate engine WAs list when the GuC is loaded for
> > > submission.
> > > 
> > > > > Likewise for_each_hw_engine should only be called after
> > > > > xe_hw_engines_init_early is called. With that, I think this patch is
> > > > > correct. Does that make sense?
> > > > 
> > > > as per above, no. I think we are overcomplicating it for no real
> > > > benefit.
> > > > 
> > > 
> > > I agree this is complicated but I thought this ordering / reading the
> > > platform information from hwconfig was requirement. Maybe we should
> > > follow up to check if this is indeed a requirement.
> > 
> > What happens when we need a gt workaround to be applied even before the
> > first GuC load? This patch moves all the GT workarounds to happen after
> > the first load so it potentially creates issues if any of the current WAs
> > in gt_was[] are needed before that point.
> >

I'd hope that isn't ever something we have to deal with... If it is,
probably just special case in the hwconfig load.
 
> > The alternative, adding yet another WA type for when we need to decide
> > on the WA by looking at the engines it has, doesn't look pretty and also
> > complicates the decision on where to add new workarounds. When Tejas
> > asked about the possible solutions and I mentioned making the early
> > stuff happen early, I was not thinking about moving the WA processing
> > after the hwconfig, I was thinking about initializing the hw engines
> > array earlier like it was before.
> > 
> > I think the possible things to do are:
> > 
> > 1) move the engine mask to be initialized earlier like it was and stop
> > pretending we are getting it from hwconfig
> > 
> > 2) what this patch does, moving the gt WAs processing after the first
> > guc load
> > 
> > 3) split the gt_was[] - all the WAs that need to check the engine in the
> > GT would need to be applied later
> >

This is probably right option, per the VF use case.

Matt B
 
> > 4) ... something else?
> > 
> > I'd say my preference is (1), (3), (2).
> > 
> > > 
> > > > >
> > > > > I suggested to Tejas that we add an assert to for_each_hw_engine to
> > > > > enforce this is called after xe_hw_engines_init_early to catch issues
> > > > > like this too.
> > > > 
> > > > I think that is already clear. Not sure it deserves an assert. The
> > > > assert would for instance trigger right now in calculate_regset_size(),
> > > > but that is harmless. Also we'd have it spread through the driver.
> > > > 
> > > 
> > > Well an assert like this would caught this bug quite a bit early.
> > 
> > ok, fair enough on this one.... as long as it's behind the debug
> > kconfig, it should be fine.
> > 
> > > 
> > > Matt
> > > 
> > > > Lucas De Marchi
> > > > 
> > > > >
> > > > > > 	...
> > > > > > 	xe_wa_process_gt();
> > > > > >
> > > > > > That gt_fw_domain_init() seems a very poor place to initialize these
> > > > > > things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
> > > > > > minimal GuC and hwconfig read much earlier") and then people end up
> > > > > > adding random stuff in that function :(
> > > > > >
> > > > > > So I think we need to get back to the original idea of _early()
> > > > > > initializing what's needed. Then we'd probably need a few cleanups in
> > > > > > the initialization sequence so the function names at least partially
> > > > > > matches what's being initialized.
> > > > > >
> > > > >
> > > > > I agree on that the naming of all of this could be better...
> > > > >
> > > > > Matt
> > > > >
> > > > > > Lucas De Marchi
> > > > > >
> > > > > > > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
> > > > > > >
> > > > > > > 	err = all_fw_domain_init(gt);
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
