Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4C3C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8A610EABB;
	Thu, 28 Aug 2025 20:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4fr1vnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F6B10EABB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756412105; x=1787948105;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hn+1UYltidevBRcyad3AAqKcrdeGPuA6SgTnRz7P4gY=;
 b=P4fr1vnAb0gSJcVHSC4iFR12cIy5CZo5Z7X/71aAWUQj68EPS61ZLQOc
 tkjQNDDR8+0vhdBJ2EiDDKbrn0UM2Z/eIWOP+NxunU3EaFb5emZV/eKID
 er7azfLqJoAct/I+k1tpX71T7+XVjgD7ecm6QTMqTI8D7SQJp2Z9d6X4s
 6TFYrn/0YNgBuuA/+0IBYEYUlsXXReuHTp+HtqWFUY9BLy0FvOIqTc4hF
 QS1asazRPlDIfc44q3xwn7qPCinVWpiaBT7prTFbnmc4YWLFo6qvNq8VN
 YifuboGBZ1qLFXutXI5RomAMeQAQ1CWSWgq/EosHdVX8ro5MjXmoNZFsN A==;
X-CSE-ConnectionGUID: odRPOqWLQwCoOlqP2ly30Q==
X-CSE-MsgGUID: N1oi9leXR5iyutrpkCPyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84098166"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84098166"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:15:04 -0700
X-CSE-ConnectionGUID: cuiJRT2UT8qRxB0AOaCdjw==
X-CSE-MsgGUID: r/Z7aZP3Sp2oJkedu0MPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170998988"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:15:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:15:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:15:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.65)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtRNomiFSE3sdxpYXdwVzrSSBje2v6EdaUsBjIlyGsp79mfkQsqW7/zTxd0Htl+E+pWkHgywagU8vlABFFIlHZAluFWsL8ixZ9iqT5kow3BTM4liou9n2UmZ/r1OAAqeZH6IRN+cmvWV46qGqzeJeoqqE/4JC5HCS+uMf8EG4gEz+EbajdttioQ7p316S6Fv9y15cDYHUKmp048PWRFdHEuo6F33d3L+cdIjrE+O6hwkf/qSDMyZ5qhtNOk931YFDgJHJInzJceeKe9FVn6EoifjEdq1XGvtO7TPzCeybUKuzoEKNWQw4fSVBw4koIXnOiyiyONe+YFTe4nuqZU4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efwAkQSXFBiwggT/n5nv7mYr/7HdGCmgbovs6fJt7og=;
 b=Mqw55wg7Ge0PXnoCoQ0uBiynSKDlCiyhXFaUpFSwi/u6CHBiyNax6Ps76tt97H0KAAugtEycXmOEjcZ7MSqQZxrDlTI1NtlEzd+DFVMx+o+RalPU+nwTFTN3RGkvJ+uV8BqfIkbXsExXwtDSvJQpOmFyRIBswNJ54M96SNSxKYWSipUHUyCY+jnPZK4CJYEjMYZUvR7AptiGwQ/6zl7c1wnbM3DUjA6RCNWJwMGASsxuLae/2BWDqJuC09g9+RU79Rc7U0V/lQjVogx/3xnIBJjh/BNF9titY1vJfK4QQf4NOQokHRFcHTfnhOrlLE6xCSEhUu+1lHJ6f1nSX9CfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 20:14:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 20:14:51 +0000
Date: Thu, 28 Aug 2025 13:14:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Message-ID: <aLC4uGWyD2V6hXgl@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
 <2efe98148129c4233337d92f28fba91dc2cf6f89.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2efe98148129c4233337d92f28fba91dc2cf6f89.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 1835f4ca-68e7-4d7a-bc8e-08dde66f8bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6njZQl6ygTBxLWwZoZZnHe/o3BphmhKXFKhHj+Q23qziY8CFPVOf56/i5U?=
 =?iso-8859-1?Q?brMtzxTCdouhoAWw4LiI7hTk9vQ77M7WGAn01xw9a8NzYSq9t+PBM8OFKe?=
 =?iso-8859-1?Q?KoJT2LlRF0DWptmOpLhk39nr5n8fQUxMJTSXF3sr8xLDDe5Dmjp0D/3bFH?=
 =?iso-8859-1?Q?iHuou6JX1JfnLIFdqnbh1oyzRFbO9idZ35ZRAvKL50qCJYsI2AivgFYdYZ?=
 =?iso-8859-1?Q?CTJtHch01ZiYkdSrUjXJrw50Ee72cHxb9tBoiVxmxrro5XgShk4r95ylOk?=
 =?iso-8859-1?Q?PDOi1YuNM6sTop/H5om2Jl6IMbZxLH5f6ayP+4ZHVAGO3ScezG53G0AsTJ?=
 =?iso-8859-1?Q?29rvka2Ontbz8LCNucqbeZnIUap+ptfRgX0Q2P0Xi5jWcWylD5TWwrjTwb?=
 =?iso-8859-1?Q?v80WrVKO2Sr/b+1oWXECHzOSXqyvaDHb+qomZ5iWDWlUU84cQtkrNj5SUD?=
 =?iso-8859-1?Q?5g+3psS/Wc1fm8qg6BlknvDyG/eFRR3GKN3mirCKHfEkFCGp8iFhenRrWo?=
 =?iso-8859-1?Q?BkZc0YRutNzJD+eXpEoASeeRPujnJrhaMHP8Hog+l9x5OktP5Wh0nHQTmK?=
 =?iso-8859-1?Q?vUNrj8h6034x7Q/UttDpg/oLaJFetZffJ2lVLrvnw0uFDJx/mWPp60Ot5b?=
 =?iso-8859-1?Q?JQBWMauJU3rA97p02zHP1yqLYr0ggUkA2jFwUXEXGqtXxlbMANsTKxP1p9?=
 =?iso-8859-1?Q?Co49ITAL8ujuPiwO9HjS75svWwD45JurscmoX5DIMrnGkzfJLCPDykSkM6?=
 =?iso-8859-1?Q?/rtWzVBkm/sIhpaDFpt2+yXGTGRB8n7jwUh0bpMEeCIlIEbAQbW/K7jtsL?=
 =?iso-8859-1?Q?vOYzqx/BqjepcHmmXPdpcaFtQ3rX+98QrGkHaLdZchHBXFNQh1EJyhfDDQ?=
 =?iso-8859-1?Q?kAo6/oWYiFgf5GNFR9rjekfWZVzaji0U9or+pGeoaS95l1Rq4rhkGVc3e+?=
 =?iso-8859-1?Q?c5gP3sdF/indCNNal2Iwv1XzVk7elH33YEqwNWkCXb4VUs2/l6+Eqm+ScV?=
 =?iso-8859-1?Q?66jPb455/36YAvpM5xkND5oDyP810u4J+fDnKf/DMoV8/2G1H1LG7a82S1?=
 =?iso-8859-1?Q?ztpKyXtb39EpwYsIbzTPT3mDzYOu9gXKLSbZ6NaQDDLHUIsXZ9UnCQ29ah?=
 =?iso-8859-1?Q?Qp+JnV94taWeSUmNUOqKcPL0pt8utvqdwJME3oIm7nNZtIBseYr8TcHaJT?=
 =?iso-8859-1?Q?goYxrWUg7YWdMFTOFtHXxjiwlMCcwsbpljPt0u4Sip59RL0BSCBe2tcqiM?=
 =?iso-8859-1?Q?KV9mSQfDNHfRqGADOAiiMqI7HX//ruH9V83Ynb9F6xlF02+AnnlS1Eis/6?=
 =?iso-8859-1?Q?z41qC1RoGm2iGo+FlFImWAW7EsMk84FA+GDx4hY5yLugPeXWFEEkJQnss0?=
 =?iso-8859-1?Q?VwGOwU4nCR9glfpDpAkgcovrsClLDFNcgQTvTDoRXe16UEuBCjoParp+HG?=
 =?iso-8859-1?Q?lRBSVFztoqenR5pZXnk8ZuPZ5arYNafVOkn/DG1wW6S+zLsc0tRT82OV9z?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ha1AOdT2VpdQqLwTdxoYT+N0NdkCjfHFqxKG7eAi8fBcY/takaGPE+/zex?=
 =?iso-8859-1?Q?z1b5wtAgqF40U+lgKAY/wdK6ajn0FFqkX5raTH3yr5/uNbpxwalUtIRTLU?=
 =?iso-8859-1?Q?CACJGBciBiQUBlMek3yAJt2iEIei0DG1aKfUcW9VYLYMHPeZyi8B3TaDRN?=
 =?iso-8859-1?Q?sqnDfrRHIlOVdE4XqU94xBVf9ffFNWxr1MibZdF5Q/YBbXD23Ln2X2PCd+?=
 =?iso-8859-1?Q?CHmcs1keKs0LC4lYZ2ak1/xTNjvIeLqDopOTT3rMDxPe3q7pGvhgu7WyKw?=
 =?iso-8859-1?Q?CBowUhGK5ibjodguqx1+kf9SapYV26PHSi7+xYzM8C8U13sUyDda3XDdow?=
 =?iso-8859-1?Q?yGdi7jXi0g6nXVwzsnvtWQL6IYZlLhfOMHKPMrdoHE24RCr+wjVUdpiF1F?=
 =?iso-8859-1?Q?NzkglTNWuGHsaufT1niHbbj2VG5jk6fcCchF73RFDSzImPYjs4wLjlyge8?=
 =?iso-8859-1?Q?++tEqW9y8DCbwsFDjsVblaxvcOG56gtSPkeXyBV0ZcbxdRwjJiqK9hqPGL?=
 =?iso-8859-1?Q?C5B2ZzpS4VqOuw/NHkmWtThvUki5zAJlPVQO3m9I3chJLC/zaytXQ+cgO7?=
 =?iso-8859-1?Q?ka4y7y/2WP1Pxt2Akf84Nt9wzhyLiEFGu77EQrxz/PcI+ubLkOXN44CmEQ?=
 =?iso-8859-1?Q?aYk5sxUq9EU24hC/z6eHXMrQ5qncc2PFSn7vJRA44psjxbdW60iyrgjorI?=
 =?iso-8859-1?Q?CvHxoQCnOtKZTlpOhy9vKpyFqUYbhg48vNaxV2ExF9U4jgX9HmMIkDZ5qc?=
 =?iso-8859-1?Q?HB/wJPcLBni6nbuMJ+6C6o3zfqf0lTkNomlpASaqh3Rg7nWPVuFN4uaPRg?=
 =?iso-8859-1?Q?tiYKfF+VTPVWybRNaze6lyWIdm5Qqgw+O473LcRHBwLovMwJtIKkfO78lz?=
 =?iso-8859-1?Q?WE5Nn/m2TZxZNBl/7mqKN196NKcM2AzBpj0VJ1+A2eacMbN2siLjQe2252?=
 =?iso-8859-1?Q?K8ggIpzORbz8JrrbC820oIP1cMxGP5kiMmIFBkatD4auUGEqwD9pmvOZu1?=
 =?iso-8859-1?Q?HXPNwtAbvKR8zmzoGL6TSXx6+zMLckUoPUBjDQFFDQouzjgduJ15Rqc79F?=
 =?iso-8859-1?Q?aFxQOhH48bMZic2EA73EBjrLKNbKd/WqfucPM/PaXsbE8ueh0iGgRTj1lW?=
 =?iso-8859-1?Q?XESJBui68debTuImImfs9Cicqu0w3OOUaeyiBe/YO+kkmQEu+rl766D9z3?=
 =?iso-8859-1?Q?ywoyS7fspP6UHzQtVsMg29RxlsRIFKSssaR4Ch1xriJamO0v3kONNMTDzN?=
 =?iso-8859-1?Q?pP4xk9kQCwVZ5+wsOGaZeIekeHDo886yksOVOkFpjvOlyjUMTMsQZKvVSX?=
 =?iso-8859-1?Q?y0eeXFK/1qDiRSVGfsFPOlxEdZOR36GgXw4ZldvWeaQD1tJURVt/sMniaA?=
 =?iso-8859-1?Q?QBUihKVrFX9FqjYC/6Fv2BpHgYo6ysKBEIxdCohUGlqB/TEGkiF2lVBt2n?=
 =?iso-8859-1?Q?3t36jDBMpRvtVbtk/j27Y+cDUqG5PRSq/tT5dKe3STAmR0M1JeOGZ7HvvH?=
 =?iso-8859-1?Q?CV6CRoTX8M7BUwW0FmBpDPu6rNB9KCcBd9QBedIS+udrFUMJ9ouzmcEhaT?=
 =?iso-8859-1?Q?bg8EDU8ruPz8DNewDkYdlXhBYz2JvcjSJlGnXDgCbGfzBbN5TBSRSS6n6z?=
 =?iso-8859-1?Q?OHd28yGTOxB6t74e3ubokiSShEvIH3lFXf/wK+qTt2BiIOXPtAHH1b9Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1835f4ca-68e7-4d7a-bc8e-08dde66f8bab
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 20:14:51.7844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meoaBM1GL3FouODih4IqJjMSIHPtUTb01J9EqG/bmzQrhqTS5dXRQG9td/tiuVDJojkg1zRqgAl1akgffTqD/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
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

On Thu, Aug 28, 2025 at 02:10:02PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93
> > +++++++++++++++++++++++++++-
> >  3 files changed, 102 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 57edbc63da6f..c7c8aee03841 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -50,6 +50,7 @@
> >  #include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
> >         if (err)
> >                 return err;
> >  
> > +       err = xe_pagefault_init(xe);
> > +       if (err)
> > +               return err;
> > +
> >         xe_nvm_init(xe);
> >  
> >         err = xe_heci_gsc_init(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 01e8fa0d2f9f..6aa119026ce9 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -17,6 +17,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -394,6 +395,11 @@ struct xe_device {
> >                 u32 next_asid;
> >                 /** @usm.lock: protects UM state */
> >                 struct rw_semaphore lock;
> > +               /** @usm.pf_wq: page fault work queue, unbound, high
> > priority */
> > +               struct workqueue_struct *pf_wq;
> > +#define XE_PAGEFAULT_QUEUE_COUNT       4
> > +               /** @pf_queue: Page fault queues */
> > +               struct xe_pagefault_queue
> > pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >         } usm;
> >  
> >         /** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 3ce0e8d74b9d..14304c41eb23 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > @@ -19,6 +23,71 @@
> >   * with a single shared consumer.
> >   */
> >  
> > +static int xe_pagefault_entry_size(void)
> > +{
> > +       return roundup_pow_of_two(sizeof(struct xe_pagefault));
> 
> And here, it would be nice if you could add a brief comment that this
> assumes the size of struct xe_pagefault aligns to the hardware
> requirements.
> 

It is actually not a hardware thing, it the pagefault queue management
code (software) where the logic breaks if we are not doing everything on
pow2 boundaries. Ofc, this isn't a strick requirement, rather it just
makes the code simplier.

I can add a comment around this.

Matt

> Thanks,
> Stuart
> 
> > +}
> > +
> > +static void xe_pagefault_queue_work(struct work_struct *w)
> > +{
> > +       /* TODO: Implement */
> > +}
> > +
> > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > +                                  struct xe_pagefault_queue
> > *pf_queue)
> > +{
> > +       struct xe_gt *gt;
> > +       int total_num_eus = 0;
> > +       u8 id;
> > +
> > +       for_each_gt(gt, xe, id) {
> > +               xe_dss_mask_t all_dss;
> > +               int num_dss, num_eus;
> > +
> > +               bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > +                         gt->fuse_topo.c_dss_mask,
> > XE_MAX_DSS_FUSE_BITS);
> > +
> > +               num_dss = bitmap_weight(all_dss,
> > XE_MAX_DSS_FUSE_BITS);
> > +               num_eus = bitmap_weight(gt-
> > >fuse_topo.eu_mask_per_dss,
> > +                                       XE_MAX_EU_FUSE_BITS) *
> > num_dss;
> > +
> > +               total_num_eus += num_eus;
> > +       }
> > +
> > +       xe_assert(xe, total_num_eus);
> > +
> > +       /*
> > +        * user can issue separate page faults per EU and per CS
> > +        *
> > +        * XXX: Multiplier required as compute UMD are getting PF
> > queue errors
> > +        * without it. Follow on why this multiplier is required.
> > +        */
> > +#define PF_MULTIPLIER  8
> > +       pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > +               xe_pagefault_entry_size() * PF_MULTIPLIER;
> > +       pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > +#undef PF_MULTIPLIER
> > +
> > +       drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d,
> > total_num_eus=%d, pf_queue->size=%u",
> > +               xe_pagefault_entry_size(), total_num_eus, pf_queue-
> > >size);
> > +
> > +       pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size,
> > GFP_KERNEL);
> > +       if (!pf_queue->data)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&pf_queue->lock);
> > +       INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> > +
> > +       return 0;
> > +}
> > +
> > +static void xe_pagefault_fini(void *arg)
> > +{
> > +       struct xe_device *xe = arg;
> > +
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +}
> > +
> >  /**
> >   * xe_pagefault_init() - Page fault init
> >   * @xe: xe device instance
> > @@ -29,8 +98,28 @@
> >   */
> >  int xe_pagefault_init(struct xe_device *xe)
> >  {
> > -       /* TODO - implement */
> > -       return 0;
> > +       int err, i;
> > +
> > +       if (!xe->info.has_usm)
> > +               return 0;
> > +
> > +       xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +                                       WQ_UNBOUND | WQ_HIGHPRI,
> > +                                       XE_PAGEFAULT_QUEUE_COUNT);
> > +       if (!xe->usm.pf_wq)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > +               err = xe_pagefault_queue_init(xe, xe->usm.pf_queue +
> > i);
> > +               if (err)
> > +                       goto err_out;
> > +       }
> > +
> > +       return devm_add_action_or_reset(xe->drm.dev,
> > xe_pagefault_fini, xe);
> > +
> > +err_out:
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +       return err;
> >  }
> >  
> >  /**
> 
