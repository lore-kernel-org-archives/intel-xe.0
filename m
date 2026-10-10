Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06684CA601E
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 01:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8963310E0DB;
	Sat, 10 Oct 2026 01:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8PoPB8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6B710E0DB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791594877; x=1823130877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OsvMTaGAmlLADC1mhukiPQ4sgU7SbEEjgWrAciw7gKw=;
 b=g8PoPB8KSqGOiU1YVn6HR+eDcjuNiSjsl458vuQi7IrgXj3huQP/bDxN
 +7trp4HDFRccExj9a64h8VSA8+f6H8wmvHw8/XbwOjMhHkue4q/5p9R+e
 BoiOvJdQs14/9p5hQ+YruWzoVLTLazyNTNwaPTFZwrxfh/RD7yIoGocZK
 wroMsjIhrhfV/CbPc1coB6AugtfxGgDbgGomYtj0iDOiyXBKIRIBEuXw0
 6e6zZ6dJ0Ug+u1PVuTdTlA+Q7GqdKI58OY/+9KyjtCKM5GkwxAIiLn3Ik
 vcTK1Uyt2EujP9WS9hUFTjHBb3fw66S8ZLlOrq4vONfwoTKvXA9RwJSvR g==;
X-CSE-ConnectionGUID: c1B5Bdr2QNmrxUTOSr6LmA==
X-CSE-MsgGUID: rQpfouTaQTOkl7RPt2+/7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="406601"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="406601"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:14:36 -0700
X-CSE-ConnectionGUID: XgP0gAJuQBiX2Guf0v6nlg==
X-CSE-MsgGUID: bHfecbAIRpyfEjkoiCpydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="756817"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:14:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:14:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 18:14:34 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doYF46Xrn3zD84l1myPPgmOAI7L4G/DDkrYjzQKeyXP+GA+qlSvSh4Qa4uX2xcaYv3JkLp8/LXsWPB7V9CQTQrHiIWrPnp9J3g8K6Sz+rj/JG5wpkj0x/JJ8EJahiEzUUzUvwF0GGyZc8kmzQOlVBkx7O5WygORQOhB1BLnGJhK+76MimNZLg1szND77ddoG83zDWdFkulyOgSxQBmiMVEWMBOR+9fYEhwYE36ih8dqD3rsX+nDKORW1u5MfElQH337BgsvYDqRkghed2s1JFmFSHXnTdMUx75YIDDyUgw0//SlO6wNzfHMBifolT1zvro/y9i39iRPvYnjrtZUAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VZhr+bzoTqcWpoJdAXlww6pu6Q5YYwSKY2b4Kj61jI=;
 b=JhwBREneskkM6YhrqCXEPJfP+G8aJZxjl/sNHovAQbXq2sYAhrmSLf78ALoxqKxCTEgBmLg9nmTqxiSmZmeAM+Zh1kZNHeHDSG4nVINRSVCmpCHDtjLzcrPlCxWd+H5JIuZSN0IJ29X7LZ5W9EXDYpUHm5xp8nXjMqmNv/G8JdfOT+mUUCjApTQXiM/Szx+0uJTng2XcunR1aFUFem0IJlFSkT9WLhIw5YU5PZu87os3JlJIgqrwizr9/3bSIx2p27v2g6qSq82dm+qHMys0PKtXQPLbeG4PXfJVZfxkVItWCyP/cKcaamtxr/zHcmPb+Mgf+kp5LL/QADZnhMh0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 10 Oct
 2026 01:12:27 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 01:12:27 +0000
Date: Fri, 9 Oct 2026 21:12:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <lukasz.laguna@intel.com>, <matthew.d.roper@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <asmQ7RRHQ8GtK2E4@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-2-raag.jadav@intel.com>
 <c3eb2bd0-119d-4c72-8332-721efb763c19@intel.com>
 <ap62ydY-_7AYdxPs@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ap62ydY-_7AYdxPs@black.igk.intel.com>
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc14bad-f8cc-4b49-da2b-08df266b8c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|6133799003|261009220027099003|261009223027099003|11063799006|4143699003|261009223327099003|22082099003|18002099003|261009221227099003|261009221727099003;
X-Microsoft-Antispam-Message-Info: pWuDwsoersihE1irmfgt0pTccngHbcJSzy2f/2cNF/bDOZEpBv/25t5Si2qecJcHfQVwRvioUSsx/Ga/VPLqgSuI5JpyW7vPd2YPM0Cx9ZQEmTYC/nTedm9/QRmHervuTvUY84z0wD3t9z48iD+SkZ0utw+FsHl0kXurd5NdcHH/nDgRv5nFEPvuMfQHjPPHalp2RvH7cnDnoSAYY2smoXIK4+hqsUH2C/k+qxVlVV9nGj2h99t13b+UNEZ28cYp3JvN7nbmj1jEMg6QOQ3aEc2Q+i2mXm3f+s8eRYh1hQN8+SoXl37Z0oCwEYDAn5YKBoB9BuROwUg492SIA+HEYaF7/sVs0Ii87h/5nPl6UNeUz5xFSZDupbHSM00SHTmYbRVSyeOOdISi3uNO6nttWZ+xcMYwtOtdr9sBJ257bUmawiFwR3k3fHTnzPD9S6v4r2s1WsuDFEIx7M1Kklwp0LGLmX2HHL6Z9GLHYhzRR72juuRcYRcUyHQj4rb5+wJYkWfvRyPf0nRVKkwA8Cw0Zol/hAZKgN2mYil1JBgaQFw8q7dlNEPZqxwBTyn4fsQlJ7XnOprcL8hFqIIRCt92E6QSI/YVWlzEkNaEF3w2WKaT+6YNZ25QTsxAe/Q0CprbATwMNdPkbp9wTMoqArZw4MfHiNLcWLLIWPJypzcEWwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(6133799003)(261009220027099003)(261009223027099003)(11063799006)(4143699003)(261009223327099003)(22082099003)(18002099003)(261009221227099003)(261009221727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vr8qQYo757wdZPplkX20BNIAlSfWsTJfRifcDBY16KOYNl+Q0yWamyRjGw64?=
 =?us-ascii?Q?VICNH/mjYjmGIB3APjPSItG8G5R50OCCXAM26W7S61Z1zd9vjjQ8WEVGjs12?=
 =?us-ascii?Q?4Y28r7SDotO3qMhEEUx1yLkcSbWajVG33iiynUdwItZzaNox1gMGJoSnuqAd?=
 =?us-ascii?Q?+ha4wP4m3uRWDdUMHVRiMcN6ryCDTcKoB07nzcqhp9twdZ7KN9yIHzlf0JYs?=
 =?us-ascii?Q?7ZkmmX0meYzV539WqjQ1T5coo6duA8k6tfsuGNUpSJaSS6W7Yy5eyzPAHyFC?=
 =?us-ascii?Q?O/av9Ca5XrDrpb/MmkBGeLMKXZFz/m4FvhdwFkVBQNHfJcLjAGrdBzCWULTP?=
 =?us-ascii?Q?eUw6gftPEsV6kCHjO2bFX4395OHk4JytgHWT+1S6E8f1PMEG9RHtMe65gCBu?=
 =?us-ascii?Q?yud3X7/Obuy8k8nzf4ZT+29R7KF7IpIlEr/cSfOdZsGcxIun2rSFCItXKw+1?=
 =?us-ascii?Q?JSq2dwOHSlyTc7wGLFIfGPt8UNFAQo2pC7thKIclpcrCkZevFNjQdpqRgPZE?=
 =?us-ascii?Q?NSCBFkiR9nZdz4cSwSmGmol2ueCViXPn9Q+4yaP6+KJ0TrRt5XG8PRZbUnbD?=
 =?us-ascii?Q?1DAD9NA9bKEzqA8/wnateoHLrHYehrbUaCqkL/wc1XPIWPLWnhiAYX22Cnr2?=
 =?us-ascii?Q?vQ3xz8r7z1c6HSfS9FelsmGzyoeUcMa2o3dX5ebaRrCu49/cNLcgaR70jZuI?=
 =?us-ascii?Q?qZb2F1DtXKXt29KE1ZmUb/+fYC5EilIgo6KBf9QvekDsL3uFa4xeJlw1ccDq?=
 =?us-ascii?Q?6mD0nIWrDEr3HW1Tpdg+DX5ryvmQcX/Z/FmdP81xm12pjvCfF2Ncom6K1WkV?=
 =?us-ascii?Q?zFGwGqENyPogugqp0c9RGLHl1Lx/B9IGz+cWoRR1/BjaZSTgZHuBkdITBuhU?=
 =?us-ascii?Q?7YQaQXqsOJspvaxWfuVve+WP3Fe5A9gkvme9DPl9wi8Zzi258+ntViKOYdA0?=
 =?us-ascii?Q?BNd/5bs57TVsljNh8ZmhO3pG8EXrPYS9tXuvd5xG+qQMh+suyx6YjujZ1ygL?=
 =?us-ascii?Q?zh/PYRuiOpYkoBYq85kRBqukg//bXq3r78xA6xdg6mtV904t+wIkR6/nafb3?=
 =?us-ascii?Q?u9RUiHcMyZTB6lUyPwo8/rCmpaEpAzlqdAWceV7rrJvH4bjB8uMj78U8ha8P?=
 =?us-ascii?Q?FoO70+kKUEqSBBcivjh5KUtJWvObt3i9SQTMj4R+8ngi/cHSF8rp4aX3glwd?=
 =?us-ascii?Q?2qq6aYhiv6kgMYB6Vy3I5bxmKBHzQbdJiF4wpUzePlgzJCj+IyTqk2NV8yYv?=
 =?us-ascii?Q?qHEYC/YhMgOj2I4UDEvwuYokCIiFJBiAOYSJXcKE/U3LTrE1mBdwWEUXoXON?=
 =?us-ascii?Q?XnYWMC+JLXEizARev5k8cGEUwfve8fbAV7Xnn16s0baMb0C5pBwOMn2KD+v1?=
 =?us-ascii?Q?LZkXEAi1BzMQZe2GWmg6fs9H/09ucTK7Nei8bQsMUq9F5O763MfIqC6u0hkS?=
 =?us-ascii?Q?r6oL7BPrfYOjnLhRewrVJ1GCLOm/utC8vDsEMABadztFjFt7MuM0rx9prItp?=
 =?us-ascii?Q?zxjc0mBQ1gfY06lPKXir/hCd+SEtF/lgXAZm60eduNkMehh1fVuwCBIPLbe+?=
 =?us-ascii?Q?WHchh3hG1IEOO6/MvcX5BEgnf57G4ACm1nV7L2lqdmhQimZSVjfTSoa83O85?=
 =?us-ascii?Q?Na50rTAklLL076dp45u3SyRgA3QoDgDsvhTbvzu2FCoQKbCFr/DRodWWr2Oh?=
 =?us-ascii?Q?ctT35t3OsSv42KB5J5b8rtnv9PSMIVf0BfRAAJBJMEWbcQ1Zec8rJAl/1ZOG?=
 =?us-ascii?Q?70XDCD65zg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 06C32EgBvGBl0TmSPupVLpmSlDV4qEmOWrk18xXNfvSMQo5uYdAxv6IeBtaJReOrWVkgxlK58LLst3wjBaDG+XNzP+cdG2/+VXV28qZ9lr+qYy1/zwsCBfzRiEeVAcdWIj9zqfHvEaUiLccjYIWgPRS6I2ncXUlSInoznPAdXTYkHLVs3a0sSM74nYMogFpKixKsCi/KSuoyLmGMokvZV/9R/GeLVWPHnJ/2HFzb1ClZ8kxZFnseF5Q9SHUAXUrb3KH99myBonOpDJ6VJUhcgL4LGrzplM6ur77VDKd5k7YAbmW5ymJD+5Vg1O2Fjec6SpAm6AOU+PAP99K5Mb9kDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc14bad-f8cc-4b49-da2b-08df266b8c00
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 01:12:26.8906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA6OcF8V+kMvdIQZ/pADTP/bMiuvf+8D/m/subQIOUk32JFkkHriYppkxuX+QLZd0BtVDsvna55QiylV1+dlgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2026 at 03:06:17PM +0200, Raag Jadav wrote:
> On Mon, Sep 07, 2026 at 02:02:59PM +0200, Michal Wajdeczko wrote:
> > On 9/7/2026 10:34 AM, Raag Jadav wrote:
> > > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > > teardown synchronously. This can result in tdr timeout in cases where
> > > the device is declared wedged while jobs are still in-flight.
> > > 
> > > Introduce a worker for GT specific wedge handling and queue the teardown
> > > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > > are still in-flight.
> > > 
> > > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > v2: Split fixes into separate patches (Rodrigo, Michal)
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
> > >  drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
> > >  2 files changed, 21 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 478e047031f4..200e34331c19 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -173,6 +173,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> > >  }
> > >  
> > >  static void gt_reset_worker(struct work_struct *w);
> > > +static void gt_wedge_worker(struct work_struct *w);
> > >  
> > >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> > >  			 long timeout_jiffies, bool force_reset)
> > > @@ -704,6 +705,8 @@ static void xe_gt_fini(void *arg)
> > >  	struct xe_gt *gt = arg;
> > >  	int i;
> > >  
> > > +	disable_work_sync(&gt->wedge.worker);
> > > +
> > >  	if (disable_work_sync(&gt->reset.worker))
> > >  		/*
> > >  		 * If gt_reset_worker was halted from executing, take care of
> > > @@ -723,6 +726,7 @@ int xe_gt_init(struct xe_gt *gt)
> > >  	int i;
> > >  
> > >  	INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> > 
> > hmm, shouldn't this be done in xe_gt_alloc() ?
> 
> The worker is touching hardware, which I'm assuming shouldn't be done
> before xe_device_probe()?
> 
> Raag
> 
> > as xe_gt_init_early() seems to be doing something else and much later
> > 
> > >  
> > >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
> > >  		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
> > > @@ -1005,6 +1009,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
> > >  		xe_pm_runtime_put(xe);
> > >  }
> > >  
> > > +static void gt_wedge_worker(struct work_struct *w)
> > > +{
> > > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > > +
> > > +	xe_uc_declare_wedged(&gt->uc);
> > > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +}
> > > +
> > >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> > >  {
> > >  	xe_uc_suspend_prepare(&gt->uc);
> > > @@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> > >  {
> > >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> > >  
> > > -	xe_uc_declare_wedged(&gt->uc);
> > > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +	/* Prevent queueing uninitialized worker if hit during probe */

Perhaps this comment itself proves Michal's point?!

I believe it would be cleaner if this would be per device and not per_gt
and already INIT worker inside device_early_probe...

> > > +	if (gt->wedge.worker.func)
> > > +		queue_work(gt->ordered_wq, &gt->wedge.worker);

This can race with other wedge places now, like:
prepare_device_for_reset()

we should perhaps flush all workers there or whenever
we are in the sync path?! or perhaps move all to the
queue?

> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 628911346455..b11ac52b0ab7 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -233,6 +233,12 @@ struct xe_gt {
> > >  		struct work_struct worker;
> > >  	} reset;
> > >  
> > > +	/** @wedge: state for GT wedge */
> > > +	struct {
> > > +		/** @wedge.worker: worker for GT wedge to be done async */
> > > +		struct work_struct worker;
> > > +	} wedge;
> > > +
> > >  	/** @tlb_inval: TLB invalidation state */
> > >  	struct xe_tlb_inval tlb_inval;
> > >  
> > 
