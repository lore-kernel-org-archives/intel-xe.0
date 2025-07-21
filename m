Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF753C83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 15:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39C610E56D;
	Mon, 21 Jul 2025 15:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me7I07Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1417910E56C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753111729; x=1784647729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uuBk67IbYpBwf4H/PDS8Ix30rjKH5BABKH3FndcAvWo=;
 b=me7I07Cxoyb7QWVK+u3XZYBtgFDXwdzAcKLTzS/IVJegPrmLC1GgLtdo
 T8L5ay//WibHUG09V5LvLitHZo5RQrcyiH0vE+6jiLJKcGCV4n8xtoCez
 3JKJKxUFMEJiUyBWJmhC+r7CtXqVIp9BsY6bUw54bAydZcnzDQYSMhZaI
 lVgEsHB4h6u86Sicr4PB+j+Khl4JxESsa9bCNldUceWyxXmpTnTmsmSBu
 VVUEXPdYx2SCzNScqEoji1nP0d3XxWdc2lzVT7T9M0b87pwA5Qmh7GTUw
 ZCzTjgG9vnV9u1sXvQ2ohIIOdnBFBNknRe3RXmZ5WbjYIMU6V2BsSMzRj A==;
X-CSE-ConnectionGUID: n1FgZ07BRsGdlc3u3qb11A==
X-CSE-MsgGUID: dloPnqZnRXK4grqjO+0uQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65897859"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="65897859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:28:47 -0700
X-CSE-ConnectionGUID: 04HnVpvMRhm9dqgTDjQy6Q==
X-CSE-MsgGUID: 8hpw2EUERXCeRXNXw+q9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="164529904"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:28:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 08:28:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 08:28:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 08:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdaZyKBrknBjLms2OTP53XD4f9v0vlbJ+JuKzgAq1GZX2svm3hZRi0wemSvfoRHAkgEs56SVNYF8yhiZuPao2t33Y7zvKl5hAC2/YMMm3X5D4kyY2Fyq6yjNnUayQysGrHmpfyc8tEv7mARDagzfrNBGlIR7MsAbFvKn1f/HQDw24pbf8UPgomv3OCvWRbEJK3gYebrgv9q1NGzOKM4ZfxEwaSyndiws922M0x5m8jymCOP+SrSojN1OznNxm6l86hr3mVUXApp6jDPvxiWmk8RujN9ffb3cnraqOO5CJFfUheU/9fJba+xfCbyOFehkQhR7NBQTX01vNRlT4XHdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PTI/XSda0UVEKFvcWcjyFZMnItU+lbgaW+iw4T082E=;
 b=Ag00IcwCWHPfeFD9g7mZwIqWE462Jw3K9TQp/K7taUxb7h0RKzX/HelkXb4LR0ZfnzcvwSjXo9ac4sQ2QERkKfp2jwmkRWMc0G5KVaq2U8kDvYxvJRzqgJ/GQaVDH6f2e20pYeON3ixD4tGcT0/5esxYNKuUIQj2GxBjoIk/70jF4Dj6TwJAt/wgp+FZiznBeuzoj5W+gzipEOXJd17XOrsqSGhYia/AwnD/53gdg0weibiv8bGQ8YMOsEeRPcNazATb2oMS42JfapUESzBx9nr2Q5PVc/8SNBYsyZmo7rZQfHH4LY2R6mB8jfiTTutRfoEsxWvWQaasVNwFhCctOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB6898.namprd11.prod.outlook.com (2603:10b6:806:2a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 15:27:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 15:27:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Misc refine for svm
Thread-Topic: [PATCH] drm/xe: Misc refine for svm
Thread-Index: AQHb+CqHfHrYySXGakObPRkSueA1+rQ4aEgAgARO8zA=
Date: Mon, 21 Jul 2025 15:27:56 +0000
Message-ID: <DM4PR11MB54561337886EF4D721A950B1EA5DA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <aHq+2MMN8Mly6KFZ@lstrano-desk.jf.intel.com>
In-Reply-To: <aHq+2MMN8Mly6KFZ@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB6898:EE_
x-ms-office365-filtering-correlation-id: f99de330-131b-42f0-a617-08ddc86b2b23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PJ1MWfG+N4vqVZQ1ihm8IZk8LOLoLYvUUufNe3sMyHJr5u2xtgbB4DOGT6NM?=
 =?us-ascii?Q?dSip137WsR3AavYKqYK5QC6Xa+542G11tGS3FTK48Gfmd4Ad4ykSrAJwoz90?=
 =?us-ascii?Q?2f9eD8sh/uipAMGGEVdDYBZ2W1gf6D/KKK08hQB07kFCUJGJs6ceCPKrNM4B?=
 =?us-ascii?Q?qMmE3G01UBnOV94CrEhHBRT9Salqg7GhgM3shCBMM+adA6Se/WAmuD0iehpr?=
 =?us-ascii?Q?JO5XRLczpkGP/yt2YHqXWu+GZbNZ+t7wLMSwzZxEaizdsmO1jl3U9lpOTq5a?=
 =?us-ascii?Q?iBMU1YwfiArj3HnDTc2BB3yadrhbN2pdIw4b3aTDl5hq2dtUoa5hQUc65leM?=
 =?us-ascii?Q?VUEV9HXepD05yttaYn8Hcn/ljbxyAkJt3jNXo87qrzZJas0oNdlLHfE+ednL?=
 =?us-ascii?Q?m+E6Iru8uLbgPFOHeQRBkn2BQyzDXWIs09pUV/SQyl+mEDaqMgiAEMka8at1?=
 =?us-ascii?Q?qalGZ36jWyJrzt73mFjpRTrq61QJGJj39QEoo4uI3ZqGkTappNBZFzD1z1US?=
 =?us-ascii?Q?dEbdCNAOGEzuIqt1g50W2FgTe1uJS5MEDU4R5t1mVdebUQ5KyuZ/SIEcmPsD?=
 =?us-ascii?Q?puG/vdCimEIRV/TvX9VZJX9d6Q9yuuPN4JiYCBWF2gHiwFPxheX1ZGkHn2mC?=
 =?us-ascii?Q?OAWQ24PGqtd5sWRG/QrqqEnHwmu98xCFV+Uv8SwuaSYOTfQ1RAzRA12KaU+U?=
 =?us-ascii?Q?89J+Hapxrtp23f4G6AcoDQ7oFB/8lKauNI0rfVOtu8+vq1ifPgyh6z2RTI34?=
 =?us-ascii?Q?RG0tj3hNkvMQh0joftb1xFMhXpPgw7Lby8TVJ80WsUw0wgEV8f+j4Zn+41PX?=
 =?us-ascii?Q?OojzTQlReMcd7y1zIXo9m3yjotZorjyeHhL+dl0wp8WLIxLS06xbWlHU21vI?=
 =?us-ascii?Q?tyrccS9dO+8329s5x1dVPR37pbHdsDxHHvAq9i8bc9d88R4/qrRh30IkS3H7?=
 =?us-ascii?Q?rWn26PJzWgVkCxdl5Q/ehe0DkXSTTpk1MGHLIgflhtHZThjMMec8eEMWp7Kc?=
 =?us-ascii?Q?g0RSH+kQSSfgUn2TH4CuaveGtHDNDtahkquOIS2h1b4UXS2pJlpxfHrhp7e6?=
 =?us-ascii?Q?kn+tRTT6fkAznfcXJThaqLg9j6MPrQcnofmrnhW4jageCdDtuxVjZqBjZRs+?=
 =?us-ascii?Q?UZfQBg/1txGUtLhvZE+TdKdvGbkPH2IjHHqt8+2DqWPvAUjCfkKkEU55kFLq?=
 =?us-ascii?Q?gzAU5+w/0rsYBBLQOmSoqsCvziOi02/q5phxCFMqgZF6H7pjqQBcENldKnoW?=
 =?us-ascii?Q?Jt6/G65Lwt4Iyo2AoqagSp92UocVOM/1z9L8OQJlqxCuDRXDR/fjbon+nCSv?=
 =?us-ascii?Q?JYm5hHu0AiJqf7cBAVo3ilDWQiiR2DFrt4lw65EDazHEMTM2QH7tx4uR406k?=
 =?us-ascii?Q?0r6jksIK12w/lIj2kaVYuclOxNqQfAcINNen5Lq70m4DaB2Zx+9Cit/eNrL+?=
 =?us-ascii?Q?bmQ8bPTL2SaKoEFnujZm7BhZ9xY9IJY2N0i7cDSosg91hOif2YfkzA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Voyj059OMOJLoz5j60gSfET6c3gchCBklILuoxDxdP7PYK8/I3+iO64hZ4pW?=
 =?us-ascii?Q?cPA7aaV6LYHZs7Fm/4TgGjw38emsIEvieTV+Dvb7bxY1WdpH0pFJU8tMPXt9?=
 =?us-ascii?Q?n7DA7mJ9hGjp1VVB5n1EMiplO9gHIyWmu2TQAjvMqyJ9IqQSmeR9HrzK3jKW?=
 =?us-ascii?Q?+hE4CmvbDKOOpPvf5wTAP3TBF8VA6976N4kPK5TsG5KaLPbHIjru6hAnd7Fj?=
 =?us-ascii?Q?Yg7BpFoNGEqNLeos7J+h/XsFIBPPBkj8yDeZCLMzoQbXam2SAIBZhbwfBQuL?=
 =?us-ascii?Q?S2N91OobdJoTnyPBYH06J5BoYKHlcgSN6rGZvAtVL7bypSEnRE1LLu4iQdQJ?=
 =?us-ascii?Q?1yI8MwKdZc4jff63OrvXISqQkAAlBk4dWMQh6tFOgE7L9s42bYsLSmPjJJaf?=
 =?us-ascii?Q?9o2SKwvRezjgya+NyhSbeOgOLI4NrjlF276dsARyLtZLFcAdbmAbfrHhU0pO?=
 =?us-ascii?Q?NXQmKTyKHZijZEdFT3ZKDHQ5q+lbKPHzWwvmmJgA97qrL5xM9vsuaEuf0tLk?=
 =?us-ascii?Q?xc9Hxgqd0eQk1wt1yIvP7r7EPjv06wuNQpO+w8uzez2CI7gnb5eN4pz8nyu3?=
 =?us-ascii?Q?beYr4Xe2+DPpdWby7QyKz6OcYho/yrhtnh2f0uveqUa235rVdL06WuJgE5jk?=
 =?us-ascii?Q?NQBE1+q8nezD/urgpmEmyADUnmPz4JlAFysL4dhQVoZevqoLADuFyqoDuhCX?=
 =?us-ascii?Q?hi2kQlrrSpVTK2Edf8k8ZfnuwS99Ngjtfo05kiEUqTshT45WCwKQRBCRLPk3?=
 =?us-ascii?Q?+9pptUDFtjxRkc7q3XLO/W2N2FK5PRbV95CaHr3IUt+GFJC1aid0VqaTOG8Q?=
 =?us-ascii?Q?xqW0Ut4ctTaWrRPrhorpwDA68EEWgknJy+gq+7dQMUu+ruzc939jX2hhImpm?=
 =?us-ascii?Q?lOGRzLw+i/4IHF74YU3vJmu8G6Q0QAsBgv1EIdJoDtItnIngKOU+mHC5efND?=
 =?us-ascii?Q?VuXY9FMRQmfzXA167kiwkJfLUBGiq3QUzBmDJ6J24hJtHMGm42KLMjU8mGlJ?=
 =?us-ascii?Q?sPfcEpHpOqVcRUpyf9F+w0RE30mLcImL0OKeticMiaG2rBiNURBbJWeWi9yh?=
 =?us-ascii?Q?ew/h9gvPPRE+qJEFA6wD8F/c2bR85VpeUadq5ZUwEdtMX+MYBUMWB0wcoHEa?=
 =?us-ascii?Q?O/GiAeqQAuhLfU6M6b+b4tU86ZShzZTuoBwGKHxTmELYihp33LdaR3VVqtv0?=
 =?us-ascii?Q?xCIS3K2nA/z3cHn/4er1PRDwNZo3sp71pbykErWyj2ogMIk/1ZsyW9NZzDNH?=
 =?us-ascii?Q?LYD0LrPatWJ4MguMY0bVVOPiveqaJ+xqiXeF0Lql9Lm29SPYFGm50dh4ts6w?=
 =?us-ascii?Q?f8Wz8rXBUmzUPXyeBnYLzZHNiFa5XYTbShjyL+xBaiHfpbutLKe7SEMq5f5r?=
 =?us-ascii?Q?QNGWEPaW/ftzaaQT/ZOgV9pGEmlytsJan6dcQ5YIgtpiYm7ZBo4B9o7Na/6J?=
 =?us-ascii?Q?bWWvPZEPjLiVUJKJ6ZrvS7C7c8xyCz4zRpie+C4jbHxV6xJr85ou7KTe5Yhg?=
 =?us-ascii?Q?EiiKdKM8xJIRjxmTyoz99bFsc9qVrqnCMIXIj6YmkQ0fP/VO4yCeh056Gus+?=
 =?us-ascii?Q?96jmKkZz88flPMWSawLuRPSse6VWvvWzEMQRhG0g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99de330-131b-42f0-a617-08ddc86b2b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 15:27:56.6797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atfg6zcp+cpZRDPI90+UU5yFiQxx20RwMBVIV5FQ0wsapY+0ZERs1wvTCcASHDMD9tk/2aNmtfnXpenkaT03FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6898
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


On Fri, July 18, 2025 2:39 PM Matthew Brost wrote:
> On Fri, Jul 18, 2025 at 09:24:10PM +0000, Shuicheng Lin wrote:
> > in function xe_svm_handle_pagefault(), migrate_try_count is set to 3
> > when ctx.devmem_only is true. If ctx.devmem_only is false, the try
> > count is 1, which means no retry. Remove the "!ctx.devmem_only" check
> > for the retry path.
> >
> > Below other changes should have no function effect.
> > 1. Correct typo of "operation"in macro range_debug().
> > 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> > 3. Remove preferred_region_is_vram check in
> xe_svm_range_needs_migrate_to_vram()
> >    as it is already checked in the begin of this function.
> > 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> > 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++--------------------
> >  1 file changed, 14 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 10c8a1bcb86e..2c47bbe7d4b4 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> >  	return gpusvm_to_vm(r->gpusvm);
> >  }
> >
> > -#define range_debug(r__, operaton__)
> 	\
> > +#define range_debug(r__, operation__)
> 	\
> >  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,
> 	\
> >  	       "%s: asid=3D%u, gpusvm=3D%p, vram=3D%d,%d, seqno=3D%lu, " \
> >  	       "start=3D0x%014lx, end=3D0x%014lx, size=3D%lu",		\
> > -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> > +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
>=20
> Looks good.
>=20
> >  	       (r__)->base.gpusvm,					\
> >  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
> >  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> > @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
> >  	if (xe_vm_is_closed_or_banned(vm))
> >  		return -ENOENT;
> >
> > -	spin_lock(&vm->svm.garbage_collector.lock);
> >  	for (;;) {
> > +		spin_lock(&vm->svm.garbage_collector.lock);
>=20
> Also looks good.
>=20
> >  		range =3D list_first_entry_or_null(&vm-
> >svm.garbage_collector.range_list,
> >  						 typeof(*range),
> >  						 garbage_collector_link);
> > @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm
> *vm)
> >  			xe_vm_kill(vm, true);
> >  			return err;
> >  		}
> > -
> > -		spin_lock(&vm->svm.garbage_collector.lock);
> >  	}
> >  	spin_unlock(&vm->svm.garbage_collector.lock);
> >
> > @@ -763,12 +761,12 @@ bool
> xe_svm_range_needs_migrate_to_vram(struct
> > xe_svm_range *range, struct xe_vm
> >
> >  	xe_assert(vm->xe, IS_DGFX(vm->xe));
> >
> > -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> > +	if (xe_svm_range_in_vram(range)) {
> >  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
> >  		return false;
> >  	}
> >
> > -	if (preferred_region_is_vram && range_size < SZ_64K
> && !supports_4K_migration(vm->xe)) {
> > +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
>=20
> Also looks good.
>=20
> >  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K
> range migration\n");
> >  		return false;
> >  	}
> > @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  			    struct xe_gt *gt, u64 fault_addr,
> >  			    bool atomic)
> >  {
> > +	int devmem_possible =3D IS_DGFX(vm->xe) &&
> > +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  	struct drm_gpusvm_ctx ctx =3D {
> >  		.read_only =3D xe_vma_read_only(vma),
> > -		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > -		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K :
> 0,
> > -		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > -		.timeslice_ms =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > +		.devmem_possible =3D devmem_possible,
> > +		.check_pages_threshold =3D devmem_possible ? SZ_64K : 0,
> > +		.devmem_only =3D atomic && devmem_possible,
> > +		.timeslice_ms =3D atomic && devmem_possible ?
>=20
> Also good.
>=20
> >  			vm->xe->atomic_svm_timeslice_ms : 0,
> >  	};
> >  	struct xe_svm_range *range;
> > @@ -841,7 +837,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  		err =3D xe_svm_alloc_vram(tile, range, &ctx);
> >  		ctx.timeslice_ms <<=3D 1;	/* Double timeslice if we have to retry
> */
> >  		if (err) {
> > -			if (migrate_try_count || !ctx.devmem_only) {
> > +			if (migrate_try_count) {
>=20
> This is a behavior change. Instead of retrying non-devmem only faults in =
SRAM
> we'd abort which is not the desired behavior. Run xe_exec_system_allocato=
r
> on BMG and I suspect it will quickly fail.

You are right. Xe_exec_system_allocator will fail with this change. Let me =
revert it.
Thanks.

Shuicheng

>=20
> >  				drm_dbg(&vm->xe->drm,
> >  					"VRAM allocation failed, falling back to
> retrying fault, asid=3D%u, errno=3D%pe\n",
> >  					vm->usm.asid, ERR_PTR(err));
> > @@ -860,7 +856,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  	/* Corner where CPU mappings have changed */
> >  	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EPERM=
) {
> >  		ctx.timeslice_ms <<=3D 1;	/* Double timeslice if we have to retry
> */
> > -		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > +		if (migrate_try_count > 0) {
>=20
> Same thing here.
>=20
> >  			drm_dbg(&vm->xe->drm,
> >  				"Get pages failed, falling back to retrying,
> asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> >  				vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err)); @@ -882,8 +878,8 @@
> > int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  retry_bind:
> >  	xe_vm_lock(vm, false);
> >  	fence =3D xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > +	xe_vm_unlock(vm);
>=20
> Also good.
>=20
> Matt
>=20
> >  	if (IS_ERR(fence)) {
> > -		xe_vm_unlock(vm);
> >  		err =3D PTR_ERR(fence);
> >  		if (err =3D=3D -EAGAIN) {
> >  			ctx.timeslice_ms <<=3D 1;	/* Double timeslice if we have
> to retry */
> > @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> >  			goto retry_bind;
> >  		goto err_out;
> >  	}
> > -	xe_vm_unlock(vm);
> >
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> >
> >  err_out:
> > -
> >  	return err;
> >  }
> >
> > --
> > 2.49.0
> >
