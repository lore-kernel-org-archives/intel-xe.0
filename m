Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1935E77198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 23:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5C610E343;
	Tue,  7 Jan 2025 23:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxuTI7Pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84B710E343
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736292117; x=1767828117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GmjbdeKrmc9fFUGaUhC7SFlrSsQHzPuJTqNJVLhPnqw=;
 b=AxuTI7PiiGyqTsFlGTd/pTmuuTwulxAkJvRaYG3zqGnt5nhhlsYKHKYq
 0GjbtNwQQeu3YTevqJXMMOvBF2ZIZuWQzYMXL6uUXaCvCFt4hc/SFcjdg
 yjJuWn7VdIi9thAw6J/lUBr+rw97QT0E8e6xtQDK0WyF7HDZkQz6GPDxP
 bnSpPnlA0VEmzm0hBdotp9Ex1ZNOepwtOx+rBm6ZNJPyM0VeduFBydUJH
 1HtWiywYJ3p/nE3H5UX47q4UD9PcjDK2eQ7spz8Mz008Bn1nF8GRYBl3e
 JnX2DJqLGI9BVJlhKiCQ/r1m2Npd/L0MW7nYbWhdzdj66NI3njW7V7Anx g==;
X-CSE-ConnectionGUID: 80xsR/pGSDWOsiDXbeMx5w==
X-CSE-MsgGUID: s6YJwu6AQ+iskfar9CRXYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36662653"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36662653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 15:21:56 -0800
X-CSE-ConnectionGUID: 8N85WrBUTbaPRwcWjDZAew==
X-CSE-MsgGUID: sFy4gTrrRfGJJA/pPrxFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133794381"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 15:21:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 15:21:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 15:21:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 15:21:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TL6IF5pqUgKC8FUiH8uxzn64SMK6Hnn0TUIuLgW6UzDSbNeM21klZiKAbRXhvQPC0afwJ1+kUVHXM8Sgqy5YP/hYXNEdZSzuoYUIcm0JbdcvpHWn049x49hwhTEzXprWR/Y4j7IxppfdsBiYRU1AK4Fl3kU7fO7DbL6G/Iz9yV7jwED48g+tpv7+zf6N0EKAfkM+H1FqlQ7bKpzKTiuWOqFreSwbK9u/bUom6fgQVIDzL3cwzTlY4wqFzN/4etujlNKnUwaI5tPOHv+HCaNtApaEWf3yGtKmxZqMveO8l5Xury869SuV1e5qIbMpmG/x4C2x44zl00LqJRp89JOfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T6xDPbw0y2+NjnslseZuMzN1CfxANv10mkfjGNNjq0=;
 b=J0CL9TJUWs6QU73FfULRdsEkVC9w3haBfbhCnT94gK1ZOQMbbjaQoG2J4q07ok//4W3W3iUOiSWycj8Npwcd0NiF08EGI42yb4i/H34OdlLKPRCDxEi7MvcEnoFXmsQXW2HmGS9TrJYdSGxDu3lrVCDrVk7oJqph/StbAoLl3X299Outq/KMacSxLsRSBMCg5L2JjbvbJAAsURo7wKVjezxjCF8geu9dj9Yy0/+IV8BFapUriJorjtQYmMT+J68pfqQoW90zUHea8NCAsJEQ7lzxb+OWGbQB9b1nuAuRS+GoC9uBFWQEmv20wPQd3tIlBMHa4rTLkGlQ/nE3NcnyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Tue, 7 Jan 2025 23:21:36 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 23:21:35 +0000
Date: Tue, 7 Jan 2025 15:21:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Piotr Piorkowski
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/vf: Don't apply Wa_22019338487 for VF
Message-ID: <20250107232132.GC3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
 <20241211064211.781820-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241211064211.781820-4-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: dd017d3e-f78f-4a09-0b7f-08dd2f720790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3q7NUVDxQek0sRl7tJkDrwlJyBEFxRZ6pu+LBDTl2R2z8h5U593kSq4UI13z?=
 =?us-ascii?Q?OyPr1sBfpiMklLmr5/jM00drpSywF7rC67Jc4GybEuTDtOHLFtcs4i10DBvK?=
 =?us-ascii?Q?/lhQr/JMTsYo/biulKyWfhnut7DTQGza96o2K/ct6SYqZv420HURxRWwl2SB?=
 =?us-ascii?Q?4rCCJeDl4vsxziQTEGE7p+DiKRT5PcfAywgAp0VqqIUobt7Y3ZuSfNGdHSzy?=
 =?us-ascii?Q?Zun18SfrRfTl27MD+dugDloFtxF89EaGlIvWHPllM78b270sOz0tQBEZBvUe?=
 =?us-ascii?Q?chVL9zrx7X5IksllAkTW/AlzzaWkrqMbtx9w4eZhObeyKkNxW6v6qvVwcPbf?=
 =?us-ascii?Q?JCcIcqDnYiJo8NiRp12QBL126LPEqSUCX+JFpPCs4+jiDNnlpaUzGTWPlmbT?=
 =?us-ascii?Q?97/N1EtIBmZrzWDOg4l7zIFRqkSFh+kFmt3FXx3YGvzD8VyIUim6T8yHvIBE?=
 =?us-ascii?Q?OjHhwogkU8v809uj9hKCJQLYCFBuUx7FJSiod6Eozdq48HgRxO3ZNuGs8Syx?=
 =?us-ascii?Q?AWs5rsgC9O1TNJkZHyrWOOw7+IcZMbElLQZHZhFw2SVk/Nx2vyO9CFRrF8At?=
 =?us-ascii?Q?M7b2T6dagrgLARfoSwmCjesnGLcucX6d17EFYBBTDEbEFeMRDEZIAu4mpIXc?=
 =?us-ascii?Q?Hnod4lEiee0waWr8+Ti1iMvdVP5wyewUZKjNyv/791vh3jVqFnqDbsu0a/TR?=
 =?us-ascii?Q?wnXsyQ3LaEhpldgBvTu+EpehQvj/lp13zIzQWu40yT8oWi1e4vWJZ4SQ2gt4?=
 =?us-ascii?Q?cYjO5HD947b5UfYjulsc2XhASYmiJA3AJDWneEWyNulKO6+HdGF4K0/rlA2u?=
 =?us-ascii?Q?OtxXa20QSIaXBT3eK5aKUVX3A6IsU4rU9yxWEcZovgHQD9/mAjmU2oAWNF95?=
 =?us-ascii?Q?NGJf/mCl35QvpHVoY1D7W6JR1KOUEhmTUhPEb8vDPtvRQPjNch7/fmTDGlTp?=
 =?us-ascii?Q?VyeZxkiFp32SV+eRcWVT9sdLo2LQZaR5byyMVAmDPyXRkb0Goz83XbNRXKyb?=
 =?us-ascii?Q?zcOT+r06eOz16dqFDDkuUADIXB3J2FARo2FmnzGs6qcOtvW7kiB/1c+Txsgb?=
 =?us-ascii?Q?tkC4paiuloUh8pv//AZ3W5ZdZBenXmd96473ouEFnZeuTvI/ZxsIWdXoPu34?=
 =?us-ascii?Q?sh2Gdq5wXaRRB+alPkEIMxmy/5l8q2gQICg9o04BEUgORCkTqkoXfJdHTe2h?=
 =?us-ascii?Q?t7xFOWc39X4byyyCuWUrCdFOMTImpWckqbj6J8qDCVzvgtJy+Zc1c09MlIGa?=
 =?us-ascii?Q?+RUUNQQNocX5jbvt91cEYB0onCPoKxOiM6BwXwxY7SA6etAa50rEESM9o09L?=
 =?us-ascii?Q?CDFlGj1/wK9Uc1i/AtzPEEpK5sU2aaYcmG1OJ6M5tEAMSq3qd92hDTeZUHCN?=
 =?us-ascii?Q?M8oTqrGezZBhUNu6rIlxSm9KU5l2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mN0jP8aamTFCw6Kr52fLr/vfDJvut5ZE2AvTfBD0KGX1qvXEehaxXg/PFslG?=
 =?us-ascii?Q?jG5b3lIA3ctTWMycIGiO9Q+SpgvLh6baXUkGCULYQnA/RWyu4GrDGxC+B/g6?=
 =?us-ascii?Q?6LgI+vPpJDMK0g4EFJ6S9cPL6CVwheh1Bu1sUcNEG95mkn6U/p3mzoEKWWrJ?=
 =?us-ascii?Q?VKdZQKIOJnVSZo8ImFZmjybD5MDjpgfJ3JV4a8/yY+SNzeKWdwHUMHwirBhX?=
 =?us-ascii?Q?IrEftYM/PgFdoo3ibDSYFJhMPy06oiIsVx7mheuHICceoyETHgz5GmgJk10j?=
 =?us-ascii?Q?VT9IPvZ34kWd6jMtJUZC/4ARD8hZmwZSHXTGVi3yDp0IbF3gPyFXewC7N31J?=
 =?us-ascii?Q?Ne2BH1i0T+BkITC+USE/v/hooYOiu4vl6trr7TlSgvNZl4Jk3LZ04c52zRmM?=
 =?us-ascii?Q?bDG3elC0n+8CY1n/jc+RLuEvnW3yTocRmAliaveQyWFyHAg2IKxS4de3SSlj?=
 =?us-ascii?Q?vEfNeIx4rIbnqweWDu3bok9weH/NzeovMHjZlrZkj3ZW0J/Dn/qunoDHbL2o?=
 =?us-ascii?Q?S0q4Ceuua+8JUZWQ4//NtMRKdk9GKbMrRABRYOeQoj7DTKdtC+sIOyzG5ah6?=
 =?us-ascii?Q?HhdUSqJ3Fx4f/0yJ6ogorKULWwfmTWwnCsEuy2y0TxCP2wmAJDCNZxmh3qYI?=
 =?us-ascii?Q?r/z8bDu9W4c2gZhBjOrBuFkCXvAO/W4GD8DInlzibY0WVCL7F71jm6Kk4C0m?=
 =?us-ascii?Q?TM9Ik6rnIHBPDCGW0ZMivvXuGmEJsuyK8mXIoLAZa3tk5EagOdGiqUOW8v3p?=
 =?us-ascii?Q?HPmzqAK7t1tC+0e8migkX+PajFCHXscmidpoyd7IT5toZLjs81PUqN6OAy16?=
 =?us-ascii?Q?i18wfNw6CEnYsHLHpjrZGWNYbZSJBv1KHJW9mQ0CiksR3qA2nKsZnfHmCC3E?=
 =?us-ascii?Q?WGqvC7qLP5SKXFBDe6NNloIDn+B8FWSjMxik0kXAS4rKgRwDhVCbYrMMwmpT?=
 =?us-ascii?Q?Ga5rx1zN1E/IWXsj5jtdnovAFfjidoZQltyVad8Y3VA5Jg++knyHU3INWziq?=
 =?us-ascii?Q?AE8IwIs2zt+U7gxYBlYXyQ5OqH+nnYNZFx+/jJdmP5SUNLVwNC65zemGelL3?=
 =?us-ascii?Q?4X4QSqoKYaiZVHxbPhp0Xf7gJTIvb1dqlzG2R+h5xfKWBmXMXyA6X+0KolfF?=
 =?us-ascii?Q?nMkmZ1p2mSEjuymhFCmqorvrmlL1vY3qbW/kgYyvmHubKI2BY52JW+CgTkNc?=
 =?us-ascii?Q?IyubDMylpfvK3WlKQdn5RjcjnrveblaRFQd5oUcYE6INjL8Mb+xC8TnEgD/p?=
 =?us-ascii?Q?ZiCpWGabxdI3SgOFEneibxUufpaEbSH5G+svdztNhBwYXvty1HyuJXugwPdG?=
 =?us-ascii?Q?0lX1XUcuiQiRTWGiHheghpzjFVvB9M10oxtEIlDidQet1wkSfYpIdwwWi5e2?=
 =?us-ascii?Q?J2i5KkczOUNKdCrQre8nSXfYoc46mowITWXV6cBTFXEmq5/tY4rG8J4SJMdt?=
 =?us-ascii?Q?K8BTQMZtOB17WnKizIVB0d5WGm6OYdQytfWXUmWD5nvVXBXc95BfrabFldO0?=
 =?us-ascii?Q?C/xLzuSRN+JYzTz5v5TgjE4FoPeudz1jF8OI4cD1SWpDI0obPeLS51Alg2VZ?=
 =?us-ascii?Q?bFXGmTbeYeSrS0mcixlpoqqNJheCrio881x5AlbYRkU/jIZP9Jnrtxsf1HGT?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd017d3e-f78f-4a09-0b7f-08dd2f720790
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 23:21:35.8002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4hNAWFtDuC0nr00tMGFFOCVv95KOW9yIKrieKeuwumq6uj+vlvfRaNC+ngWjY1Dki7hgga0qX0vfPsrAeUmYyYBn/O/BF3cewlXq9LHPHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Wed, Dec 11, 2024 at 07:42:11AM +0100, Marcin Bernatowicz wrote:
> Don't use Wa_22019338487 for VF.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 3ed12a85cc60..40438c3d9b72 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -34,7 +34,7 @@
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)

At first I wondered why we didn't need the "not VF" condition on these
two also, but now I see we don't enable SRIOV support in general on Xe2.
I guess the hardware SRIOV support is always fused off on the Xe2
platforms we have today so we only need to worry about this on Xe3 for
now.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> -		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
