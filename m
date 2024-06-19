Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A549EC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 14:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C99410ECE2;
	Wed, 19 Jun 2024 14:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Csz79D/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8777D10ECE2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718808168; x=1750344168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ivbTFhhqtD35W2zxthXKqiAgydA4tLbYn7eIlpeer2A=;
 b=Csz79D/g5cX6wYWqeYDkhZyqm9d/yAAQDTjjHJIP+Fdr5ARof0ft+ehc
 JiwmhDK4qJhkxcyT7Q7y6jlT/uCXjbsX6LZpv4mbnyg2SiakLeVcNRAD9
 1tZalNTUMb9SOP+GFDVOFXkCb/W2fmIQo39Yfe/52psBd3JJlmChH6tgO
 t/nHZwgPNxkUvSVnd1mxKhYuBFWNHhSgdFxSimH3JO4gmvkso8bQr+TRH
 1TZ5a+XpqsGv/2zflmqBA3IgK4JoF+3KH0O+pQ0ajK3ydAhQyInGNrXxp
 1xrZhJ6RoiC4US45QlxYjSkVryqCaaNc6MDEA3e106NGeUN75VgEaov6u w==;
X-CSE-ConnectionGUID: MRB33M58RE+OgqOQ2SmUZw==
X-CSE-MsgGUID: KL/CPXmuRLaz8L7HM+B8Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15626738"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="15626738"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:42:48 -0700
X-CSE-ConnectionGUID: 2YwTbHtzRn2R0mJKx/NqBQ==
X-CSE-MsgGUID: zMJ6B53/QlKdbN7CFdZWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="42617674"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 07:42:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 07:42:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 07:42:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 07:42:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 07:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRAv0db2QBhBOeuVhwxnkYD7s6m4Q3X8s0n/sXLIB0w8s5L5A86mv/sNooTBwo7GchP1Cxh6ankeK46lB3XdqGIGp+J+ZTZWh6F6P2evHLRL1aAm+fcgeTuc4FtWeVKhfLlyiJZRwK/TIJe+fkFvmK31TAPF3CeEDJ7poBYfHP2Ap1mCWKmPpJVa5+h8JlAW8WnsH6VdyYnss4/5gtHZYgbXgV5vBlh/IZsOHgzQ7vS0W8qtv65TSXaa7fQXJaVGUOqldLPDQ0zAs2f6mLkWExV4jNOnnczIBPXwLe6Rq8gJwOe7LzGMy6pHS/R9Qm5PZ0JwTmyvpRBhxKvoL6QrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6coE0I78nunjLpfWihBit/KLMuKGrmjdr1lwFxiOVY=;
 b=XDbd+M8fIN54yw2g04Ja4yLTHfAe4BOi1IO2Z/Mi4/zOUo4+JdVFHOkz6SjBheS4yaSIfmWrvJTVeDLFyzNFppurKDt4uC3hQGIWYutaP8ag/E6+PoKwyVcTFSysIxcjlV+yS8t7K1DnBNZ1WJC1UlS27bWkjpmYsE50HzmOEhVGqgkxj43FzEpsq/JMlZAXeDydAMbVuENHEbccIbgKyfp9wkU3j+207QsXDfSq82kLl+uJfav5fYkCdIH1XJ5KRGApEQwiTR5E9N8SVQNKJlH6qSO5zo2HMe1O+4Mj0HPSF06aRkhx8LV1aleDxwZ0ogjzcP+x3oZrZgJYUGJiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Wed, 19 Jun
 2024 14:42:43 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 14:42:43 +0000
Date: Wed, 19 Jun 2024 10:42:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <ZnLuYD1t8l-Lt8S-@intel.com>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
 <729c1f1e-9e4e-480c-97ac-1c686afab8bd@intel.com>
 <7f44a141-2a00-4b61-ab32-28fe5940a82b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f44a141-2a00-4b61-ab32-28fe5940a82b@intel.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f0107f-531b-41f2-10c0-08dc906e13b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rwr3f3Z5wAt02IxafuCaW5/KPokwR6xRdvy+WcY7P4517SwyiYOM6RRFgQbN?=
 =?us-ascii?Q?Z0CXsbcethdi+Ii7djzJ/Zww8inROOXocQjtTgyfQgWSukLIsQTS4vZAzqHe?=
 =?us-ascii?Q?sgoqSu6j/B/vPsVkw6Tm05s9fkAmZGGjSsie3RD+deMLk/+twfXx/oCSConR?=
 =?us-ascii?Q?SDyJ7zduTTgt96uC912OWKANdm+OlGlzX1VYhf8I4rhzb79o17A58Mi/RwbV?=
 =?us-ascii?Q?r+4gRKpv4oI1i0xwOwJdqHmBuV0d99jGlZ15sSMyPYJZXkjvb6Os7Y7Vv8xb?=
 =?us-ascii?Q?yqVKUR/3wEKFEQWbz1a1BqgDAELNTUmYEIG9M7DQ/h6WkYA4RTweWB34iXYc?=
 =?us-ascii?Q?36V7yPDtJxFIqwEFt85rPnqF1SHmO0ayYFT7D5sS85NT0cP9dO4gJV1BBiwU?=
 =?us-ascii?Q?FX13SueBOWdztFpHsn4aAFc8Nbb86A+m07jbwU9NXadX0yNyD5Zwq/gGsNGz?=
 =?us-ascii?Q?LEERpjl2IuoTLGMbBBPBuPkHTjbIV+DGckth7PJWmZnMc67yDowp1NT036ch?=
 =?us-ascii?Q?ofW9lPqS8YnjHnmsJdeHZh83UPo70uoMDvxi7qw2/m/dRxul8eROASy8LMx2?=
 =?us-ascii?Q?2YFBciGYCY6f2SNt1HnlE6uzpB2qzKSNW+bz7aaUCuGoNk0us554jIeQ3mdY?=
 =?us-ascii?Q?CcTH4Wws2+5DSXje6yglk0a9yoGsLr0DGBj+n6m6I7xDBCjiZ4ms8hpYqSAs?=
 =?us-ascii?Q?Rrl6L8OP/4fH+XClRFKBefP55N+eOdOPxGKqjtkRRiKQVsSpFCCQXKnIbAbP?=
 =?us-ascii?Q?pcm1QOuxepnD4+JjIMhLZLbZo5sWL55W4diK2GmhNzihxmB7+hbcLy9PtQps?=
 =?us-ascii?Q?BPdUeEeqgULYt9lj8ZxSnYzoJBiGmqhl5+KprmGh4suDbzGgKLDp6OpZN6UU?=
 =?us-ascii?Q?QTDt+ts29lkD3bxWX5ZyUrxdYXBBB9to0fEq0r5XAoogTHXiAzcpCalE2vDy?=
 =?us-ascii?Q?Paz6ZcKym8B+b0PzXsfs4xplumSd+D6GnPchiBk/ZJLBV/M9HwYeZoL+s8FB?=
 =?us-ascii?Q?66Kpsm1+/JOSFC2dDyCxY69szOosOuAfJrIH3eBx1dRpHKNcBAVCnKEoZj4B?=
 =?us-ascii?Q?49m0sozA8BVomcsBYugXx74d5UBthPA2MVrrqfPc/s0BCUwNG1VjPITd2xyr?=
 =?us-ascii?Q?0WZOdHCvMh6MClwOvePjDqjbiY8rAysMsR0IPAL55FVcbHcV7LVaKgLuCOiW?=
 =?us-ascii?Q?nAT44qL0TEu8PeVDLSv4n9lSezv6p3i9d1CCg0C6S8rVPCWNPT2rNElK8l7P?=
 =?us-ascii?Q?gheK1BoTMDe98zytv2E1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3x8kurYRxaIYU7IZM93sFfohpH9JpxOkRRBqjS/goVMPVifiMl3CSUncRu+?=
 =?us-ascii?Q?thaMyNehuM1reutcbo/Hf4Kfm7pjft6n4/YvP6Gt4IEIyjsZz5ujBPuZEuDQ?=
 =?us-ascii?Q?hXQG2RWELWdbHm1/TU08tZWbk7BtY/gSUJ11ubqugMYNin71DE3yqXIVsrZw?=
 =?us-ascii?Q?SPjrWF/+fmjLQEWS9MPrluhJ81MRWY7DvUZOeR0LhVrF3sHLs/2ejVCEIO54?=
 =?us-ascii?Q?ZTIQL74y0DZceI4iaOMDqk+Id21TppH8XPDh9p7ND0S5B4Y53QV8Bh0sZ3oD?=
 =?us-ascii?Q?OLeO+k0nWUn2Pu+P+L1xD/rc18HmnulqEBM/61RY8JXCciw/pfxaAF13Ou0Z?=
 =?us-ascii?Q?XsLeWUXRJOMhvufZAC8oTHNWEB7scphL3ADRg9dbtNsS7EowIAfS+qBkOlIA?=
 =?us-ascii?Q?XwiH/TJDRKV7unWcgR8VB3YtgsQTCkDsE0ntZL4ZiZPPyt0zG0Bu/PUbWQrf?=
 =?us-ascii?Q?YzLnUi6BlackYS49lFJXSR09tBNC9pU01eLQ5oLLaaxZTOv20c5cXO3dCJLA?=
 =?us-ascii?Q?lkuIDHAnY6RnxLOHoq4fiprDf6JHaP95gKh8FXYrkjsPvYAhQMh2cvzQDDUU?=
 =?us-ascii?Q?TOTOXjdU4iaXvadQdlhyCD5kNhdS3xcBF7JGiIch4U/NtQzicjGXk4cSp5Nq?=
 =?us-ascii?Q?uVv5UuSV4cKazIMgzAg+8fmr6NGUizRQbz7GRWrCx+qxdwqtBkJYh5i6vrK2?=
 =?us-ascii?Q?f6HdBMCJe79ilMEyJ+i9S7KEul5SKE+gKVDoBg9omSSxzzLR5Edzr8i7Swhl?=
 =?us-ascii?Q?8o8DcTDl6w4ufcymfA5TcM19nILY+ozNQ7/TjSaM0FfviZ3PD/jHyLpMir2Z?=
 =?us-ascii?Q?cvWeqbBdde1eJ3joaduiP1W0Gf72WMF6rifFTl0ooYk/ybIOdAxbRNpHZTZc?=
 =?us-ascii?Q?OmQDoOYrcPyueldWMhxdcMMAY6+RPuuYX9FM3js8R9bx0icxfo8SJBvBOfw0?=
 =?us-ascii?Q?UGe1iawnXnKk0wZWjioGEs4DNaiKWEEa2EE55syRKocUz3wTCSSTHxdQOqdl?=
 =?us-ascii?Q?QOsFGSwD/EzCmWp5NMwHrmTvCJokHjWFHVItcT+FUXMIcA3kBKtCqEpPYMGt?=
 =?us-ascii?Q?9aMgHvPNbTPFKvTJ2tmoLyzJBo9H8+xLA5dkTdabwsg1X83ydMql4k1VZ56h?=
 =?us-ascii?Q?O+G66DMpDpfCeouyeD7K9CQ6Y0GeJPe4RpdcG4YtVyqMcYdfYFDSRlAew/Rj?=
 =?us-ascii?Q?yZn2hspvcl7fZOJWP1EW85n0eFbYCTfxcC303nguZrCzd3+0A0c2KDCcXN2Y?=
 =?us-ascii?Q?T58L9y5DN7VEtevshWeRWcGdDvzr87bftWFGx6akzMwO6WKK4R9Df9kAeG/X?=
 =?us-ascii?Q?ewaRdhBJFHcKQ2qprzdaYp66kkZLaAcQMKcNn+sdCAef1mQgyawc/YvJ0VOS?=
 =?us-ascii?Q?rqrffGnuWeFqNTUu3w9xBcu021nuy3i8pY6tbLtdT1PQh3BtfK+v24aFe2ns?=
 =?us-ascii?Q?2iesJFKNfxXX1kmK0gLHmNeg+A56nTMkYQCCb2MvyumQJbRMZFJHU8tk7y6K?=
 =?us-ascii?Q?zgLgX+VttZkoceqLjDt4fLTwNqK796gFo8HTtqpPNGmmDch3RW//4VcdyMuK?=
 =?us-ascii?Q?4x7q0wJuRPgoHWdn25PdnDWLPuBj3FKWP5Id3P8V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f0107f-531b-41f2-10c0-08dc906e13b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 14:42:43.2955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzwDENo0qPthIPyh2g7P8YxWCtAYMPTeVKwsF3cWvWilxizxYmd1OQTwp4WoQn6OGpRdn8obfFqJ8BFCwH1DRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
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

On Tue, Jun 18, 2024 at 04:47:03PM -0700, Belgaumkar, Vinay wrote:
> 
> On 6/17/2024 12:48 PM, Michal Wajdeczko wrote:
> > 
> > On 17.06.2024 10:10, Vinay Belgaumkar wrote:
> > > This WA requires us to limit media GT frequency requests to a certain
> > > cap value during driver load. Freq limits are restored after load
> > > completes, so perf will not be affected during normal operations.
> > > 
> > > During normal driver operation, this WA requires dummy writes to media
> > > offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
> > > of the LMEM writes originating from Gunit.
> > > 
> > > During driver unload(before FLR), the WA requires that we set requested
> > > frequency to the cap value again.
> > > 
> > > v3: Do not use WA number in function name. Call WA wrapper from xe_device.
> > > Rename some variables, check for locks in the correct function (Rodrigo).
> > > Ensure reset path is also covered for this WA.
> > > 
> > > v4: Fix BAT failure
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Makefile          |  2 +
> > >   drivers/gpu/drm/xe/xe_device.c       |  3 ++
> > >   drivers/gpu/drm/xe/xe_ggtt.c         | 22 +++++++++
> > >   drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
> > >   drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
> > >   drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
> > >   drivers/gpu/drm/xe/xe_gt.h           |  1 +
> > >   drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
> > >   drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
> > >   drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
> > >   11 files changed, 136 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 1905a80e61e3..8c72fe38edfd 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > >   	$(call cmd,wa_oob)
> > >   uses_generated_oob := \
> > > +	$(obj)/xe_ggtt.o \
> > >   	$(obj)/xe_gsc.o \
> > >   	$(obj)/xe_guc.o \
> > >   	$(obj)/xe_guc_ads.o \
> > > +	$(obj)/xe_guc_pc.o \
> > >   	$(obj)/xe_migrate.o \
> > >   	$(obj)/xe_ring_ops.o \
> > >   	$(obj)/xe_vm.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 94dbfe5cf19c..fee90f66246f 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -668,6 +668,9 @@ int xe_device_probe(struct xe_device *xe)
> > >   	xe_hwmon_register(xe);
> > > +	for_each_gt(gt, xe, id)
> > > +		xe_gt_sanitize_freq(gt);
> > > +
> > >   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > >   err_fini_display:
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index 8ff91fd1b7c8..e3fddd59fd9f 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -11,6 +11,7 @@
> > >   #include <drm/drm_drv.h>
> > >   #include <drm/drm_managed.h>
> > >   #include <drm/intel/i915_drm.h>
> > > +#include <generated/xe_wa_oob.h>
> > >   #include "regs/xe_gt_regs.h"
> > >   #include "regs/xe_gtt_defs.h"
> > > @@ -23,8 +24,10 @@
> > >   #include "xe_gt_sriov_vf.h"
> > >   #include "xe_gt_tlb_invalidation.h"
> > >   #include "xe_map.h"
> > > +#include "xe_mmio.h"
> > >   #include "xe_pm.h"
> > >   #include "xe_sriov.h"
> > > +#include "xe_wa.h"
> > >   #include "xe_wopcm.h"
> > >   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> > > @@ -69,12 +72,31 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
> > >   	return ggms ? SZ_1M << ggms : 0;
> > >   }
> > > +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> > > +{
> > > +	/*
> > > +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
> > > +	 * to wait for completion of prior GTT writes before letting this through.
> > > +	 */
> > > +	lockdep_assert_held(&ggtt->lock);
> > > +
> > > +	++ggtt->access_count;
> > > +
> > > +	if (ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487)) {
> > > +		if ((ggtt->access_count % 63) == 0) {
> > > +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
> > > +			ggtt->access_count = 0;
> > > +		}
> > > +	}
> > > +}
> > > +
> > >   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> > >   {
> > >   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > >   	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> > >   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> > > +	ggtt_update_access_counter(ggtt);
> > this doesn't seem a perfect solution as now it augments the generic
> > function used by all platforms with unnecessary logic (that triggers
> > extra step just for specific WA)
> > 
> > maybe it's time to extend struct xe_ggtt_pt_ops with:
> > 
> > 	void (*pte_write)(struct xe_ggtt *, u64, u64);
> > 
> > and setup that ops only where applicable:
> > 
> > static const struct xe_ggtt_pt_ops ops_wa = {
> > 	.pte_encode_bo = ...,
> > 	.pte_write = set_and_track_pte,
> > };
> > 
> > 	if (XE_WA(gt, 22019338487))
> > 		ggtt->ops = ops_wa;
> > 	else
> > 		ggtt->ops = ...;
> > 	
> ok.
> > 
> > >   }
> > >   static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > index d8c584d9a8c3..73fe6837b9cd 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > > @@ -34,6 +34,8 @@ struct xe_ggtt {
> > >   	const struct xe_ggtt_pt_ops *pt_ops;
> > >   	struct drm_mm mm;
> > > +
> > > +	unsigned int access_count;
> > missing kernel-doc
> ok. None of the fields seem to have it, for another day, I guess.

I will take care of that whenever addressing the review comments I got in my
series that adds doc to this component:

https://lore.kernel.org/intel-xe/20240613215357.307061-1-rodrigo.vivi@intel.com/

Thanks,
Rodrigo.

> > 
> > >   };
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > > index 80a61934decc..f8239a13fa2b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > > @@ -22,6 +22,7 @@
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_mcr.h"
> > >   #include "xe_gt_printk.h"
> > > +#include "xe_guc_pc.h"
> > >   #include "xe_huc.h"
> > >   #include "xe_map.h"
> > >   #include "xe_mmio.h"
> > > @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> > >   		return ret;
> > >   	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> > > +
> > > +	/* GSC load is done, restore expected GT frequencies */
> > > +	xe_gt_sanitize_freq(gt);
> > > +
> > >   	xe_gt_dbg(gt, "GSC FW async load completed\n");
> > >   	/* HuC auth failure is not fatal */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 57d84751e160..301594d1e7a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -9,6 +9,7 @@
> > >   #include <drm/drm_managed.h>
> > >   #include <drm/xe_drm.h>
> > > +#include <generated/xe_wa_oob.h>
> > >   #include "instructions/xe_gfxpipe_commands.h"
> > >   #include "instructions/xe_mi_commands.h"
> > > @@ -54,6 +55,7 @@
> > >   #include "xe_sriov.h"
> > >   #include "xe_tuning.h"
> > >   #include "xe_uc.h"
> > > +#include "xe_uc_fw.h"
> > >   #include "xe_vm.h"
> > >   #include "xe_wa.h"
> > >   #include "xe_wopcm.h"
> > > @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
> > >   	/* Get CCS mode in sync between sw/hw */
> > >   	xe_gt_apply_ccs_mode(gt);
> > > +	/* Restore GT freq to expected values */
> > > +	xe_gt_sanitize_freq(gt);
> > > +
> > >   	return 0;
> > >   }
> > > @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
> > >   	return err;
> > >   }
> > > +/**
> > > + * xe_gt_sanitize_freq() - Restore saved freuencies if necessary.
> > typo
> ok.
> > 
> > > + * @gt: the GT object
> > > + *
> > > + * Called after driver init/GSC load completes to restore GT frequencies if we
> > > + * limited them for any WAs.
> > > + */
> > > +int xe_gt_sanitize_freq(struct xe_gt *gt)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> > > +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
> > > +	    XE_WA(gt, 22019338487))
> > > +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   int xe_gt_resume(struct xe_gt *gt)
> > >   {
> > >   	int err;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 9073ac68a777..1123fdfc4ebc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
> > >   int xe_gt_resume(struct xe_gt *gt);
> > >   void xe_gt_reset_async(struct xe_gt *gt);
> > >   void xe_gt_sanitize(struct xe_gt *gt);
> > > +int xe_gt_sanitize_freq(struct xe_gt *gt);
> > >   void xe_gt_remove(struct xe_gt *gt);
> > >   /**
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index 666a37106bc5..d9194328b495 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/delay.h>
> > >   #include <drm/drm_managed.h>
> > > +#include <generated/xe_wa_oob.h>
> > >   #include "abi/guc_actions_slpc_abi.h"
> > >   #include "regs/xe_gt_regs.h"
> > > @@ -24,6 +25,7 @@
> > >   #include "xe_map.h"
> > >   #include "xe_mmio.h"
> > >   #include "xe_pcode.h"
> > > +#include "xe_wa.h"
> > >   #define MCHBAR_MIRROR_BASE_SNB	0x140000
> > > @@ -41,6 +43,8 @@
> > >   #define GT_FREQUENCY_MULTIPLIER	50
> > >   #define GT_FREQUENCY_SCALER	3
> > > +#define LNL_MERT_FREQ_CAP	800
> > > +
> > >   /**
> > >    * DOC: GuC Power Conservation (PC)
> > >    *
> > > @@ -673,6 +677,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
> > >   		tgl_init_fused_rp_values(pc);
> > >   }
> > > +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> > > +{
> > > +	struct xe_gt *gt = pc_to_gt(pc);
> > > +
> > > +	if (XE_WA(gt, 22019338487))
> > > +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> > > +	else
> > > +		return pc->rp0_freq;
> > > +}
> > > +
> > >   /**
> > >    * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
> > >    * frequency to allow faster GuC load times
> > > @@ -684,7 +698,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
> > >   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > >   	pc_init_fused_rp_values(pc);
> > > -	pc_set_cur_freq(pc, pc->rp0_freq);
> > > +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
> > >   }
> > >   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> > > @@ -740,6 +754,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
> > >   	return ret;
> > >   }
> > > +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> > > +		/*
> > > +		 * Get updated min/max and stash them.
> > > +		 */
> > > +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> > > +		if (!ret)
> > > +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		/*
> > > +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> > > +		 */
> > > +		mutex_lock(&pc->freq_lock);
> > > +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> > > +		if (!ret)
> > > +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> > > +		mutex_unlock(&pc->freq_lock);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
> > > + * @pc: The GuC PC
> > > + *
> > > + * Returns: 0 on success,
> > > + *          error code on failure
> > > + */
> > > +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&pc->freq_lock);
> > > +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
> > > +	if (!ret)
> > > +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
> > > +	mutex_unlock(&pc->freq_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   /**
> > >    * xe_guc_pc_gucrc_disable - Disable GuC RC
> > >    * @pc: Xe_GuC_PC instance
> > > @@ -854,6 +915,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > >   	if (ret)
> > >   		goto out;
> > > +	ret = pc_set_mert_freq_cap(pc);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > >   	if (xe->info.platform == XE_PVC) {
> > >   		xe_guc_pc_gucrc_disable(pc);
> > >   		ret = 0;
> > > @@ -902,6 +967,10 @@ static void xe_guc_pc_fini_hw(void *arg)
> > >   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
> > >   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> > >   	XE_WARN_ON(xe_guc_pc_stop(pc));
> > > +
> > > +	/* Bind requested freq to mert_freq_cap before unload */
> > > +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> > > +
> > >   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > index 532cac985a6d..7ba875c3613b 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/types.h>
> > > +struct xe_device;
> > why this ?
> 
> removed.
> 
> Thanks,
> 
> Vinay.
> 
> > 
> > >   struct xe_guc_pc;
> > >   int xe_guc_pc_init(struct xe_guc_pc *pc);
> > > @@ -29,5 +30,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> > >   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> > >   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> > >   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> > > +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
> > >   #endif /* _XE_GUC_PC_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > index 2afd0dbc3542..13810be015db 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> > > @@ -25,6 +25,10 @@ struct xe_guc_pc {
> > >   	u32 user_requested_min;
> > >   	/** @user_requested_max: Stash the maximum requested freq by user */
> > >   	u32 user_requested_max;
> > > +	/** @stashed_min_freq: Stash the current minimum freq */
> > > +	u32 stashed_min_freq;
> > > +	/** @stashed_max_freq: Stash the current maximum freq */
> > > +	u32 stashed_max_freq;
> > >   	/** @freq_lock: Let's protect the frequencies */
> > >   	struct mutex freq_lock;
> > >   	/** @freq_ready: Only handle freq changes, if they are really ready */
> > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > index 12fe88796a49..a6b897030fde 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > @@ -27,3 +27,4 @@
> > >   16022287689	GRAPHICS_VERSION(2001)
> > >   		GRAPHICS_VERSION(2004)
> > >   13011645652	GRAPHICS_VERSION(2004)
> > > +22019338487	MEDIA_VERSION(2000)
