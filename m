Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75FCCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2AA10E7D3;
	Wed, 24 Sep 2025 20:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QT/U/RpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665F210E7D3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745401; x=1790281401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N5zIvE6nr85Yh9YAxHCLdazBZ/E0nG4tT65m0bijvos=;
 b=QT/U/RpADgzN4iXdSwq1xOV01WzY2bB57yAzImjNc6C3asTTAixiXA0X
 VUCvsY0ygI0LehnwSllrXOMhRtC1DzSF8ibGqbn9ls7AixcuVZxtCXlQ8
 dHhl5O7TzekdL6wShRMdIBtUhdyp5t8stYEHwnYeiUKjoyd5tt/Lu/MH8
 roZYBZjB4ZhqeHY5pG/5lil2RfJmYINBPls+AaMB5WrINXDJykgiiprrm
 fIZZEZbilHNaUeu2lQUfLDvTMUPRrWG8WokZxOuekNV/HIFj1zdETWZ8v
 MOkXGYYRO/7P+SkVhXBwYFFhGeX1mxDH0s6ofpq3RNI7HETkOT2TgcxR0 g==;
X-CSE-ConnectionGUID: bUSVentwRa64Y7KuoTn/uw==
X-CSE-MsgGUID: WU8/A0epT/yELTpwFR+7tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61106114"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61106114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:23:21 -0700
X-CSE-ConnectionGUID: NBXEe6HnSGyBgs99MJwG0g==
X-CSE-MsgGUID: noBUwcc6SFO9sNIAlJIe8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181134929"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:23:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:23:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:23:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kixTuJq1ZJHubBOtI9iCgmEZ7BG4HbMcDy5L9nAlKqkZF4qIZp0Wwrnqyod1M3Z8AOYI0rPIPI5pYcl405YsVLlhEeS1vOnJOXjM0Se1dCJQlBCftpXowmrtAI1eqbutb24Y1xvK2ZstloYRzeqTjxSqJDzMt42lQjvmDykpOiBlbv+IUI5L/+WTLw6cDGxRCpCFsbgE70+HvM+4ux+lR3zFeAUs0djBgcGaH75vEUR7Ev7pNtNNpnWkC/bcB0V2oP7vhEb+t1pELvrfNeE0fOsTM2hf2GUR3+Z4csXaV0y2PaReNWmiEjLvRt22hIGfPhjbBsy+Cr3EXddtU+SahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q0e3iezkHlo+7/FG2gs/GKHt9geF3Fdq4whbdp2lfI=;
 b=TPyRtTnva1YJNlsE2C0xOqCsRbng/t1MuW91SXuDvEvGxyNnoPsYjgLeZbstONmtCUPiwLifgn9z3gKI8Hkx9bJcjfZ3BqTxsnrsXB2DliHCIvvdXJ+BlS8U6iCW6QdSd7ILWuDiLsTK5TyRykCtryce3/R0sPRUs94Fo+3pCMhYuVkWikpGAkKiyHTPRzkaE8S9rMBaKTs0cmy4o1ZuHyYeDGUew1GUeM09Ii8+HpLLTmuV5jsib9SCGchsSbPn8voVnzXM88ORQa0CjG/6PMgwjrc0roFF0VSC2t9Rq5SHbhiplUskE+B4YSc4Rh5JWW2xnO0F+mCdWq03Sk/dHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 20:23:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:23:17 +0000
Date: Wed, 24 Sep 2025 13:23:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/34] drm/xe/vf: Lock querying GGTT config during
 driver init
Message-ID: <aNRTM4ahMFul34Xr@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-2-matthew.brost@intel.com>
 <95e75ae6-0d2e-4dc9-bea2-daaaf94150c1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <95e75ae6-0d2e-4dc9-bea2-daaaf94150c1@intel.com>
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a18de29-e4aa-45e4-d7e3-08ddfba8327a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gdG4qwqwIhyYhP8wKGTC/yql9wXc7NB7+t4i0UvQosmWt12BpXG3e/qNmILu?=
 =?us-ascii?Q?yhg6xb3KXZiR3x8jpkQUgzpP0Bf6hVP7wxDLvvQIRBIpMkvQyiHYyPBhFz16?=
 =?us-ascii?Q?jEDeSHe9qX7dh1Vl0yNrtQEZRwoGBLJwc5Gd0gn/GHOCxQQPkzQ+3GWpeOoF?=
 =?us-ascii?Q?BsaQHDtLFpzHe8poKh39ZC2nKD3tjMfsESIAHzdNThGT/1Aacp74mLmsnC22?=
 =?us-ascii?Q?7QSytKNqN6XFUGuC5EIrdG0O2Muu/qU2OrWX0zwUmfBYbRV1NpAOvVi42a2k?=
 =?us-ascii?Q?5Nu0LjU2c0OszMTpU5Npar6pPpc0Z7aESJUOrkwm+fcwTGEBPcHjPXaSYkC2?=
 =?us-ascii?Q?idTSPs0wnfxENTgh2B4QCvdBOBGS72YOe9O0ODO3BGqj7z29cbOTSXLHjfwV?=
 =?us-ascii?Q?QcvsTAFFYCRkaoDn91g2ZKzYRQB9gwyjMOnbwAXm7Ma+yqn6pNviIdfkQzt7?=
 =?us-ascii?Q?JwWuomA2NtlUfrhAEzOt4mjSY2dQ/J2QqSBNHYx0NzVQ2PsJjmOMiY9p3MYp?=
 =?us-ascii?Q?AS2GghQoBIbrSipXR7LYlUn2lT2fIyfyvbtnOrIAZedKuQO47ZbR0aP5zMnD?=
 =?us-ascii?Q?rbE0oPWcpai20pQ63TIImQTV3um4/sz/hN6815Ey/IAiiCe/fChWQc6kvH2h?=
 =?us-ascii?Q?oLOwdEizmqwt5A+4Pu3ZkxhvuxVuYuDU01XZbG3IS4iOTFZBxR0Qys0tRQ3W?=
 =?us-ascii?Q?V4mG9GRtKwas4Beb6RJzl+E3ZOQ0iVpDvsNthWch/j31s6BagDMnemLmObB6?=
 =?us-ascii?Q?vNF9RRituIwqYkZaEDRaRlelWAcmaJPIedKIYjWXZQQGiuayiRKFDi7aelAr?=
 =?us-ascii?Q?gHMZOAUoyc6c1yWtTPKhDgUePVBm2peG5Omy3aBR4POYwGP1TeQjjn07uY75?=
 =?us-ascii?Q?WTYU2oBU3gx8PZy6F9DPKGQ6MpT/usWbR9d+iRBHCbTkAf2XV2c61gouCFUI?=
 =?us-ascii?Q?4w5/B3xYtUl5e2pRS3o+A0V1oFxwQXA20fQOSyxStfQ+J7koZaMAwHHtiL87?=
 =?us-ascii?Q?FdONjStJ1C0UoHA0ho9A9JnOFWq7u57bRwh431mc7rCpj/K8kGVDGUX61lBs?=
 =?us-ascii?Q?I+CscxpY+i8TaSBd5ZCHDm0JHJyHaibJLQaOTiwyAiG5SSwK0PHKQTSPFqrO?=
 =?us-ascii?Q?37v05q+VR5LD8LHOjcXbkaBDgyqTNgTqnQWIo0DX2CW2IwyYhzS9IiISSiwr?=
 =?us-ascii?Q?ANdOpEDfc4TIpzn1dKwS04vZaFWZWFh0P1bF/lLzGytYUkPy4FtOU3ChEpM0?=
 =?us-ascii?Q?rutOH9taEPEKM3Peqh05VuxhWsJwDgxyvbFOw1T0/wlSVL5XoGFjAMgYktqx?=
 =?us-ascii?Q?Ajj+SVl3CXc5EdUrVnLJAVjyk8C9bzcmFuC7ZCXO4l40C9+imG+y8xqlLUIR?=
 =?us-ascii?Q?RH/XKrHv3jSbrA3i2i+1VPbdmLdM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?501tW+V14hHf5W10J6Gm6KxRZpAC0n3cHCZuU0HK8mbUBBlbVuvJSbyyPuE5?=
 =?us-ascii?Q?+Ae0pQBZSHvAMS64wp0RxPN9TI06dKnF+kXcBWmRv+LbAw0lVbUY3elte94x?=
 =?us-ascii?Q?0FAmOQUx3mM7JlXmeSraJN97FC31WfmPMATdz451niiFg0gCcom2R/4TAYQi?=
 =?us-ascii?Q?xy/8HSm8oYzWtFTGmmMPfIwDPM62QEzMhg6O84yxNfXzPx+dVVyw431dImnP?=
 =?us-ascii?Q?4vlgOnmVxWTsLqR9+bqrVcTPE4vb1H3Xna9PD3YnbsFe9IXES10pYlMDMeTc?=
 =?us-ascii?Q?q70mDsk5RtUhdBzsAPBcEcb8bChH6nfEbPwqsb65c6+FOY8wMWnTFFNofP3P?=
 =?us-ascii?Q?IRsBPDbiQdSiV/VutTIUIkYExa7GLHinCzPXiUiOPUuzBTQxm6CH0DRAL1z2?=
 =?us-ascii?Q?O7bYfI/BfM3WHJN5Ed80Np7+GoqO6Vs9TWre4NvRqw6Pwl4PYNr9e28wzxeC?=
 =?us-ascii?Q?bk2eCxgG3ZM7MPJDaD/AbTQbJY5coNS0BtvhYeieWANVNK8TNL3z3MulEYDW?=
 =?us-ascii?Q?+KJbYk8YdBrdo1hCZega2VmLJ0g6rp/IC6aWQTQkexbINQLFLBI3vivSkE+U?=
 =?us-ascii?Q?m4xrIiLCFZ791dQ11ymSm1aPdG7a1vQbu1x3SzR/ZrkZPSUW1itKNCC9yK3x?=
 =?us-ascii?Q?5qR0LtdZH9XmspTfV3Uf+J3xN7Ivg3msdxWKxNooG+kgTOVIzF4WDffljAQ7?=
 =?us-ascii?Q?8JpEc+Jp52tn9jVOkXgPhhHn4y1CpH+tGfaauaKfY649ujLyj+zM7k4qgo3P?=
 =?us-ascii?Q?tsA/Slg0H4yD+mXGmgrt1H35nUZD5kPW4173J9yOOuG6F+zapJy+BsAz2RYd?=
 =?us-ascii?Q?3zP3iJSPYGjgtQLbBWbCNBZ3nBH1oDJ6mGPw4AeooIlqfZ35f5j/vfomCzBY?=
 =?us-ascii?Q?gwuAuReC85P6Oia1pwGHhP+kZ5Eojtmp6fSLYBsCXDFqcr6/BkphJExbHu6U?=
 =?us-ascii?Q?pidOr2Z7SmqFZaJ9D6XZ7pZ9zGjvvJjk2pVSBesyAeJfYI5fXlYBcupCufeC?=
 =?us-ascii?Q?eCuOtfYRu5YmTp5vCjZnt9p7+1KdbRYhOTDMhYv3KUAiGegHeEaDnADY0zEb?=
 =?us-ascii?Q?BxXIYBZuc8BKhsEJMyCI4INFqUSzge9QXjVf1aQA0NBMW/fDTPMdpb58CDJv?=
 =?us-ascii?Q?kzdDE3bR7fYLe572+icxfEcv9JhmpR2BegyabqQhy2ZjDVP3zyd0WSFdymYY?=
 =?us-ascii?Q?mBqOH+G+LbjYZmf3U/+4QrSWUOxQ/2DgNnPFL4yQf+OntnPwMepho6nILmbW?=
 =?us-ascii?Q?Uk1BPhfwBCWTc+59Ltc0IRTzHn5cz702MmQVVe1cGFyxvkeAZZzW2Bq3qlYy?=
 =?us-ascii?Q?nUxvv6+g+r3sbq+Yfiau8aRLjPmGodZk2p0LvBFe7mfHQuCTL/PJjp502Jp0?=
 =?us-ascii?Q?A7RHa5XQK3Cpvneci3PC86Lozrz24XoX8p4OEIr5EB27KUe0aBn8r2Kc973U?=
 =?us-ascii?Q?JnZEh0rcswLY7UpDSpMXT0P8xbcltnbNQzN+KCHTfGso+Ah0b/+ciHTF5TOh?=
 =?us-ascii?Q?OZ11Z+UPZnfPt+1N3ePAuLefLMHB1qlKFDFQy82ugad64bi3lbS3NZmUPvjT?=
 =?us-ascii?Q?CpJcXEZoHMCEe8HcNOfKOmjjOiuzXuwyEppoJFsQmIom7bKZGGs9W4vy5VNc?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a18de29-e4aa-45e4-d7e3-08ddfba8327a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:23:17.8936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxNEmOM3JLFAJXIHz2wELBZdMw7SLYEEZCpuJrlc7R46+9a+9BVgq4LvTKDFZaRO52TFwhLob7oshfSf+KNgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
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

On Wed, Sep 24, 2025 at 11:29:22AM +0200, Michal Wajdeczko wrote:
> 
> 

I'll let Tomasz respond to most of the commennts as it is his patch but
replying to last comment.

> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > From: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > Protect access to GGTT config as this is non-static information.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
> >  drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
> >  3 files changed, 84 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 0461d5513487..016c867e5e2b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> 
> do we need to protect also VF2GUC communication ..
> 
> > +
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> 
> .. or just RW access to the data itself from here?
> 
> >  	if (config->ggtt_size && config->ggtt_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> >  				size / SZ_1K, config->ggtt_size / SZ_1K);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> > @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  	config->ggtt_shift = start - (s64)config->ggtt_base;
> >  	config->ggtt_base = start;
> >  	config->ggtt_size = size;
> > +	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > -	return config->ggtt_size ? 0 : -ENODATA;
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_lmem_info(struct xe_gt *gt)
> > @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> > +
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->lmem_size && config->lmem_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
> >  				size / SZ_1M, config->lmem_size / SZ_1M);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
> >  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
> >  
> >  	config->lmem_size = size;
> > +	err = config->lmem_size ? 0 : -ENODATA;
> >  
> > -	return config->lmem_size ? 0 : -ENODATA;
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_submission_cfg(struct xe_gt *gt)
> > @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> > +
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> >  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
> >  				num_ctxs, config->num_ctxs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  	if (config->num_dbs && config->num_dbs != num_dbs) {
> >  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
> >  				num_dbs, config->num_dbs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> > @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  	config->num_ctxs = num_ctxs;
> >  	config->num_dbs = num_dbs;
> >  
> > -	return config->num_ctxs ? 0 : -ENODATA;
> > +	err = config->num_ctxs ? 0 : -ENODATA;
> > +
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static void vf_cache_gmdid(struct xe_gt *gt)
> > @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> >   */
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u16 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> 
> the purpose of this assert was to make sure no part of the VF driver
> is trying to get num_ctxs before we finish querying it from the GuC ..
> 
> >  
> > -	return gt->sriov.vf.self_config.num_ctxs;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->num_ctxs);
> 
> .. instead of moving this assert in the middle of the lock ..
> 
> > +	val = config->num_ctxs;
> > +	up_read(&config->lock);
> > +
> 
> .. for code clarity you can add assert here as:
> 
> 	xe_gt_assert(gt, val);
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> 
> ditto
> 
> >  
> > -	return gt->sriov.vf.self_config.lmem_size;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->lmem_size);
> > +	val = config->lmem_size;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> >  
> > -	return gt->sriov.vf.self_config.ggtt_size;
> > +	down_read(&config->lock);
> > +	val = config->ggtt_size;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> >  
> > -	return gt->sriov.vf.self_config.ggtt_base;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->ggtt_size);
> > +	val = config->ggtt_base;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >  s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> >  {
> >  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	s64 val;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> >  
> > -	return config->ggtt_shift;
> > +	down_read(&config->lock);
> > +	val = config->ggtt_shift;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> > @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_read(&config->lock);
> >  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> >  		   config->ggtt_base,
> >  		   config->ggtt_base + config->ggtt_size - 1);
> > @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> >  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> > +	up_read(&config->lock);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 298dedf4b009..d95857bd789b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
> >  #define _XE_GT_SRIOV_VF_TYPES_H_
> >  
> > +#include <linux/rwsem.h>
> >  #include <linux/types.h>
> >  #include "xe_uc_fw_types.h"
> >  
> > @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
> >  	u16 num_ctxs;
> >  	/** @num_dbs: assigned number of GuC doorbells IDs. */
> >  	u16 num_dbs;
> > +	/** @lock: lock for protecting access to all selfconfig fields. */
> > +	struct rw_semaphore lock;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index cdd9f8e78b2a..d6e2ed9b9bbc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
> >   */
> >  void xe_sriov_vf_init_early(struct xe_device *xe)
> >  {
> > +	struct xe_gt *gt;
> > +	unsigned int id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		init_rwsem(&gt->sriov.vf.self_config.lock);
> 
> this is a wrong place - VF's per-GT data shall be initialized in
> the per-GT code somewhere in xe_gt_sriov_vf.c
> 

Yes, it is moved to the proper place in [1].

Matt

[1] https://patchwork.freedesktop.org/patch/676383/?series=154627&rev=2

> > +
> >  	vf_migration_init_early(xe);
> >  }
> >  
> 
