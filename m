Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE4CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C04810E11A;
	Wed,  8 Oct 2025 11:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h05PK3og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC3010E7DA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924579; x=1791460579;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bv3yk0ctSMCSmg2tUqurBxmYjoXhamgBVKzQTPTMDtU=;
 b=h05PK3ogGwayFz8/h+Go9KNrxqvuujgy8YXhZi+JYz88gf2qv+chaCTo
 b9M+xvqrQbdBfi4wR6QJLnY6PyjrroHCHeoizvcQd60q8jO/XPGwlfL3w
 wJ8px456SF7NFx1Tvvq6rL0Oki2W5jqYLPETZSPlNqQ1wi32tWVVYUDvu
 xATwhfEClWMJNaLvHD2bwPgiDw1wYUi+Wf1C3yY9wI7ZqAkCJIwH0y02Q
 DVY/Bn2niRaUiHcM5uwLGZVapPBTia3oEGBFxBdWPeN6SzD1KY72oJNUV
 vWUaEMZBIhlD4R/IVIZQprchLtwWMKxxC9JoSEeK1hVRtNTTv7WG86igX g==;
X-CSE-ConnectionGUID: 0PrDzmveTr2CTSiPYyM2OQ==
X-CSE-MsgGUID: zpm5CZCqTT+Ooq8MHA+hKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62212454"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="62212454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:56:03 -0700
X-CSE-ConnectionGUID: YwcwQlC+RPeEB/rCCPgmoQ==
X-CSE-MsgGUID: iOZo5otPQjGHoP9PY9LmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="181179122"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:56:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:56:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 04:56:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob8kFpUb7hHr+IJHH0Qofh+SpvYhpsc8AMNpRxqSvvT1yq59KDiMJ1PJZR4UdM3SNdWt77n0x8ryRsqbvr8jEXkzpNfmNhaI94iOcjkE+7t05JOLhndJMOnSuBraA0vDT1CIpawHDSkOGYBoZU9I+6e1n1Ff21l1pKSnxHbz7Rjy7s7naqVRC0wQRs9ATKV66LyNxhHDcnJknBoJPkqlsP85DYW8RN0atT8DcPFaSSgD/+4zEd7iI4F90loWnSjg/gyhzLIRtkGHIGh3GlcqnychgUGRR5uSudRjYhbYSedAu/fgJDwCfWB+GiTVACdVG6vvb71SHpxjr86qUnWQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFiDmOT5hriInvVX7EHeevR8j35otD2OSCsgJxwSnK0=;
 b=F4HZWHEK0ojKC0kXuzji4ZVuC3NxXKsXj8KUKESfF1WDnY8k1no93yEVZyUwtXC090SfDZYNmc01Vj9hr235xi7dmb5qyL5uSdesyQN1XFg3NFZUUO/35/g1/bHKJDlwr5v/xnxKRicBMEeiaDNdK99WpoxhC10gsaZ55vQaJ7G6enacBOEfeuz+p24QuSgwhN8/EmF/GMDML4MO1rykgxBdDcV2Q8A9CtuIO7TrnbDd3ENJEGx37whrG2xjkgGLA/Hhs0eICoWDvpQETnp9XfgXehlQii0+yhEi7Yxh1tRdHaenH5U49UXkPafdTOXD8hqWUxLyxQxa97kdVzB1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 11:55:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 11:55:56 +0000
Date: Wed, 8 Oct 2025 04:55:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/svm: Ensure data will be migrated to system
 if indicated by madvise.
Message-ID: <aOZRSSIpTVIXuYPi@lstrano-desk.jf.intel.com>
References: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
 <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
 <aOZOMRbYFsJlaSSP@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOZOMRbYFsJlaSSP@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: d7cbf7b3-9ef0-415d-d48f-08de0661a387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vLEnzbzdcVTJDzW50XMJO20UmIWlCc2kDAhCrhclY5GBh4szBCJdbb2w7w?=
 =?iso-8859-1?Q?fYFXTCvQ4d97OBgmMvySpERLqLG2nhcnl8TYMj4CSQn8TiUc7TFOILIWcd?=
 =?iso-8859-1?Q?Wo+OjGCPw0tYVpSLmXuwjnyj5fMKI783CRLrHoOjK8Lo/p/r726WZfnPC0?=
 =?iso-8859-1?Q?T9i0rQLCohLMtGWNsc1bdcH3tiQ4w4o3qDj8lj//P619mw88hiEvTLSXCJ?=
 =?iso-8859-1?Q?Ep/l3EPsdUx88jNLaUZa6SG/RBTcShjMNmrp+RJy9OGWKUFWVSZscPkkd1?=
 =?iso-8859-1?Q?4364aA4SkLKC1cVrJJ0GlxYqbQwEpwdZANcaqjPh0+b4Z0YA7PqstdkjiO?=
 =?iso-8859-1?Q?e+QnPqjO/nbldNhrCZFPJ3akbweGeWqfD+2Bc3eAykFerVWn5F2OKEiueu?=
 =?iso-8859-1?Q?luPg3BEilupEs7BApVBEh1AfU9Rg/uJrgk8YmaCFqrLKUwfHYlsHWy6uHT?=
 =?iso-8859-1?Q?hA5Qx3kIzU+W36mfhDGJOrvKBTMrf1sHUzxnWO3PYJ/NXx8KMrTlR/mOOd?=
 =?iso-8859-1?Q?3SBceH++71zZGnfKLkUOPWs62bSDrd800nViwZhV7TNzwbUSCa6XTHgcXM?=
 =?iso-8859-1?Q?r2BA5Bi6/iXGL6yIpdfs2LWjTpHrUGW7RN4FLfkw78Rrd6XlL0UgI3tVvF?=
 =?iso-8859-1?Q?WW8Tibb+YlLys+HpJbpoIo7FTswPBWrGM2tBbtz+JzPlT39k3e/HcHTK86?=
 =?iso-8859-1?Q?UpjcPm1Opvk9126montdUSJiZluZ7vEdOma+6Q1FgF1bKKAQjso3YNNomW?=
 =?iso-8859-1?Q?mzBeqTft4MhuGFdjQwqA9spSmQuv0toSwF48zFJoB78sdeYogxA1WUkByG?=
 =?iso-8859-1?Q?Eb32n/exTjLc+/DeURdQRaagW0tHn90knTIVyc01yujGH+q1DRYAlfzzmI?=
 =?iso-8859-1?Q?3LPuNOr1rSiTFCwlsGkU+hMyRlqN1T5IbAGLpg8vFp2v1oVV3paODIg9og?=
 =?iso-8859-1?Q?hSsFhkGg1jbOFT8aph0T1+HcZxkXbkhzPSf1z3hI9e7FmWKoa/k+BOLkDg?=
 =?iso-8859-1?Q?GuefVPpuz/TkU/0XBZEY97R+yBBJBObvNpwh1MKdQeWQlK7IZWQWEa65H1?=
 =?iso-8859-1?Q?3jhnBUCZlm3y804yfywdtuYILtCGa4pjWHn+hgUakLUQ5WjVHndzOZWSyr?=
 =?iso-8859-1?Q?hbawhmu7aYIbaqqT1wU0w7W2aFwVrlhUmzElFs+WTnj/ABRRuGnRGaTKSI?=
 =?iso-8859-1?Q?JcCAyBhlyRCfzubA0jV1psG4ByFljoIYDH0arAss1UlR6hfXvJYidvCQDB?=
 =?iso-8859-1?Q?VUuChah8VKvly7dk7faKk6mXBFLLuuWrGMO8EhLh98547QhUb66+CqcgP8?=
 =?iso-8859-1?Q?EOKNfUr62Us9hvbc91zNWm6ra/vzVI9GAS7q7RrXwUczNgR8Ur9LEWs4eA?=
 =?iso-8859-1?Q?kjxF8bRMnARjDVH4c3eP8b4fTWnHU/wJxFhofJJwCERzwEeFHrt6P2y0b4?=
 =?iso-8859-1?Q?F5XcM0QlAS8jsw6vhF3iWtdWV57KKD2Ycb4cP+XX/YLqYRnv0ZuPf2v8FE?=
 =?iso-8859-1?Q?eOaCNDcMcK7MnegpNXsSjk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yDlhDD7llThK2iCmJNTG1XgQgBRHlsXkRakqd44nhWRKKt9uaXkSJ26UeL?=
 =?iso-8859-1?Q?HMTLQXLTDvDS+i0HTLExDC8LwAfbJtwdV7NNkxiSHJrIAV2hy80s4UBQeI?=
 =?iso-8859-1?Q?eOUYNAtPsc3AQmT2Nq9NiZTANDO/eYOwnm8oe3BQnGqSF6UhYX9nywN17T?=
 =?iso-8859-1?Q?WLsECzJdnuFmjDP33pmHA++nnzayILuePCmIcCF2UQGPqZrD0h7J7deY4V?=
 =?iso-8859-1?Q?nn9kwK/5mQOwamoGoIP8Y1qtGFsT1XSbK++TYcCV8rdzPD244IBIv9osSB?=
 =?iso-8859-1?Q?UnRVBloTA7gPaYX0+T+K35sOk5dqW13xoWCVEKwQuwxUH4cjMjBKSk9Oo1?=
 =?iso-8859-1?Q?x69RaHnacV5r0jk3MXeiyRrQpIyiijDGgkolaYRfAE5ZfiXkJuQ6vyWXff?=
 =?iso-8859-1?Q?fU98Y4JItCpSnRhEWzYObxNoHQDCK5BkHup2Ruf9bbPllWYZlw5wW5UU8a?=
 =?iso-8859-1?Q?EbFdSsJSW1YmPBnrvEiG2gUdC27OyI128YEhbr7djgqKbpAwp9foOz4emc?=
 =?iso-8859-1?Q?UJ0CUzXgnvEP1Ub209wpQ9tdAkKJYLeIREuk2K8l2f85Qm1bQpUqpGAFBz?=
 =?iso-8859-1?Q?KJLCRyn6xuVifmFmnkab/NkzeEzVgnkrGNKuQfiUPHSdMovnmHirDsTYei?=
 =?iso-8859-1?Q?s/bPhqe4dPEfwrY9BN4ierc2PnCKRvIcKCU1rdmDOSSAob6TrsN3NEX45J?=
 =?iso-8859-1?Q?495cU/SrlbWC6ydhacecAdek1j3BF5vE8K9HBIcYsX7gU9DZdNpLDNBrpk?=
 =?iso-8859-1?Q?4R5MB2rvZzV4fP+JADdosWdLVKxF/HYniBHnj/YhplskCDPYhx+WCLyih1?=
 =?iso-8859-1?Q?+KbTW7KUg4sdwycvgKKxFWMIXEqak6O6JUhN5hygS7FPfQ/c4oMbvhch3r?=
 =?iso-8859-1?Q?mx9gA5vWiQedw7s3QFNFNqVmLGUNxwVLCBM8pgL/kh5NK86hjvOyX1e95Y?=
 =?iso-8859-1?Q?0CTvbg8vp6PGEQnt7pRzbmnF4Qd5vwzfcarx3+aM0S0aTqdlFUoxc/5fjN?=
 =?iso-8859-1?Q?j1cIBappv9dPk7GM9lMoGBgqNK4+Shpr+olwTDMa6mEfrAQoYtgHa2KZsB?=
 =?iso-8859-1?Q?uYixLiPVjnxNsewo3uiYz662P3JXvLUtjuIBCkjpqCetPaX3Ng6+a09d6C?=
 =?iso-8859-1?Q?RJva+a6B3kYUOoOErsCgJZKBN3eTMi6NGAn5csFxSAVWuPqeIBV3clPuJ6?=
 =?iso-8859-1?Q?qfh7PK9dYh1lPgatcLNsYe0lX2xLoryXhUGto+NfoEmzHzQCAcp9+d3lUz?=
 =?iso-8859-1?Q?V2kcf8IgGndbqXKQQiVn2C0xIhYnmItR61lNYqqZs/oxn2i1YhMwnRj50G?=
 =?iso-8859-1?Q?HYsJ9lDw7Y2k+NwqrDdF1Q97nqZWqJWsYKJb9o1tIjJemmJNdFvp1cC4p0?=
 =?iso-8859-1?Q?1fdfUUi4Oqc9ytng6LiImXOj4JOUEs3+asa/VgN/qyxf1mEfH3S91num1y?=
 =?iso-8859-1?Q?mDCQxRpJR7Z3A/z/7WmhG8NGHzuzK+6MCsfof6CnDawv8JdGu7KzrfmbR3?=
 =?iso-8859-1?Q?gJ1sedNVzHjlUJOPFS+kL8LpLE1aa3zDze8oi9PM8KBscMjcg1Ub6RUPvs?=
 =?iso-8859-1?Q?DWZt5t9VQfOnxmfTYIzjaftZKEFKr2OvQE9Qf6/ZddtmFTtJs55xCPLRll?=
 =?iso-8859-1?Q?f2+EiotuEyhHG6UyHbGTY4N0b6nHqguKClY9v5OFekV+I/VCaXVj/FYw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cbf7b3-9ef0-415d-d48f-08de0661a387
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 11:55:56.0464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0BhfQquAKOAhUB3XK65VEj2G68q7sCprMpXhUhqBlLUOSCEwnHnxaFR2UEIJb7lcB+Ui6wiO37clIrppQTpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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

On Wed, Oct 08, 2025 at 04:42:41AM -0700, Matthew Brost wrote:
> On Wed, Oct 08, 2025 at 01:10:49PM +0200, Thomas Hellström wrote:
> > If the location madvise() is set to
> > DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
> > SVM gpu fault handler will be set to NULL. However there is nothing
> > that explicitly migrates the data to system if it is already present
> > in device memory.
> > 
> > In that case, set the device memory owner to NULL to ensure
> > data gets properly migrated to system on page-fault.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 7e2db71ff34e..fd906eb03d71 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	if (err)
> >  		return err;
> >  
> > +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> > +	if (!dpagemap && !ctx.devmem_only)
> > +		ctx.device_private_page_owner = NULL;
> 
> I think xe_svm_range_is_valid below can still make the page fault
> handler bail out if the memory is in valid in VRAM. That a really odd
> case but maybe it needs to be handled?
> 
> What certainly needs to be handled in xe_svm_range_is_valid is if system
> is the preferred placement, the range has mappings, and is in system. If
> we get page fault storms on system memory address every fault will issue
> a rebind.
> 

Correction - I misread the xe_svm_range_is_valid logic - the 2d case is
handled.

Patch looks good, the first case still exists but unsure if we really
need to handle that case.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Matt
> 
> >  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
> >  
> >  	if (IS_ERR(range))
> > -- 
> > 2.51.0
> > 
