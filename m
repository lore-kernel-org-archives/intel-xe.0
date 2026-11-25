Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9C5606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFlsS3Fq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MAFQLHiS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C6E10FE9D;
	Wed, 25 Nov 2026 17:58:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22FC10FEA3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795629483; x=1827165483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z6dXdAPP2gGroT/tjndCtmlajuqXsNdg8KnRUA80/7U=;
 b=IFlsS3Fq8Nsm94DtUXWaZarKXf6sMgwpgMcKAqwB9HUQSapThODo8CPg
 jymrH8px1Ql2O/ChslbcKBDH50SAXkzj0o3k53077XNO6kpejgQge+xdG
 xL6qBCm6YvwtVLKungLNHBa81HFQg6keO4vNFxcetEgLMqOqu/vSn9biA
 YpWW045MwjF97A0ersJ8UvmZOKvPONO8wVfzgFl55iGhTsk2ObBmechKK
 mwfHc0A/XPYm07FIyRt0oqU/Pf98Px2YlTPV71ufNSwgz2fa5TO6U70Au
 6JQzOT8igusJCQtFfr3Mmmd117P7k1aPcRZRwfacZNLsXRpd4E6bWAvSo A==;
X-CSE-ConnectionGUID: mRbY9qD/SM2f0T8tGurcOQ==
X-CSE-MsgGUID: WGGzUfYtTKOhPgnznlxKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4400483"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4400483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 08:53:19 -0800
X-CSE-ConnectionGUID: ofu4HecVQHWQDP3n4yczKg==
X-CSE-MsgGUID: DnEmB0azS4yEiF6NAI90TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11903839"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 08:53:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 08:53:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 08:53:14 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 08:53:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4G2w98RPR94j8pk9Ss2w1dMwUFj4Uswzogkbd0Qy8QYbx4NeGt8H5SCk+15pBsu7LBO4b1adPJxqTcFNbvSvdGGJj2/M0UTgEIlyHTh+opvugbJn32cleCvvzo0L4VLTqwaZFocQJ/ygQsEVJDi5E/bzrzmEtpVielYKUynMDDyYk2xqHK2hwBET0XoXj5ecL4ylRMqA868YeuI9+NuDZiwhrQ7apPcUuhpQdwlAW8ZipvaB2N1H9buve16ZMNN3ccZIcYTqDBExocPRQ46Jhu836hDiktBFVSnX9SDhOJr2s2h+p8dfTmNIhnJ2+MmJa2a8c2f7aEpVTQJjgYZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVjb1ZT9cleb0NF/QAj1+DGqSWHqx8aLN4XezHmkeRQ=;
 b=YwnYUiXS9v3sttERrgPC80g9TbrHcutuupVEaxFoE66d5stX3GBoQJGYfbrELMwEpKB/HXT/EuWXWx3R3jmEK338nKTiEMWMRhcjcL+sB764b1M9sZPzwrUregX18ONaS9NYIPuhnGNOw5i6Au6nLprXxcwE6soRoCGhGefjNRVaojTsMrneRYTVhyhG5jY2MX8y4b+TqSzxvEE7z6LPa5ZcxR8MYoHJCilz3podcDKql4HFRW8EOnlkstwfDV3U8KeIjnw1pDjwfeLJ7YPBdqAVtu1ihDOkWTE1vZbPRvE9kffrMYDRP0T4hdKHmzOahrLSOFK14ndM4EzRA70eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVjb1ZT9cleb0NF/QAj1+DGqSWHqx8aLN4XezHmkeRQ=;
 b=MAFQLHiSNjTDw2NWLDEyF546QncPF+JWUbY0oTk6HavCSbLQLw9o/S4p/AaPlw4klhAaK454IGmINAF00IpmFKdsRg2nbQbviB6NXzjEc9D6wXR1VGfiMWlTh8o57q8ioPKZgGyozjIjV370TRvak0P3JBFoiR/g8NKfdAFfqAw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by LVXPR11MB9780.namprd11.prod.outlook.com (2603:10b6:408:387::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 16:53:11 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 16:53:11 +0000
Date: Wed, 25 Nov 2026 08:53:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/bo: Queue async BO free on the
 module-lifetime destroy wq
Message-ID: <awcSddpC4mrJKbwL@gsse-cloud1.jf.intel.com>
References: <20261123045652.3575516-4-sanjay.kumar.yadav@intel.com>
 <20261123045652.3575516-6-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123045652.3575516-6-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|LVXPR11MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6f6571-698e-4ac5-9cbe-08df4b1496d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|261022105027099003|261026140227099003|261021123027099003|261021121427099003|261026121527099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: hRPMum6NPYpCe69KoUTS0BJqR8vzq60md/euY7LmXP1pOGDgNQAZE6nKsklWhbrqBb+VXzoctjdcskenWL6wkTvA9jd+Mpz/YN4xYY3WG+OfQpat3p2rbZ0G+ORIZ2QVawVZovg6SGoqi0qWzdp6DrAoZmNBgvkhX4iFyQohvaQyn9QDOqlCQQALK6VU/95TsGhUbj6tWSjiUHtBOsAfSGUwaYOF9wzNnF7oL5mbuf43QHdSXrzuVVOSIbZI/+isKyPgbjoGrUJD4QpUd8hM5WE2PKbZSUf7WPauNppLdfDddbz3cL0c1j7SpGTkwVJc33+BGdPHXvkn6BPkF5QVkbdTXZ74/CAXkIpYP7z85D+5AX+9qiL7o2H+kE1jh/KjLeywMq189PDsIGFL12fi+d3n8jCcduO3ljGF9X59lJBWhIRvBQFa6UOC6c9IEFAgBI/KPGUnpaSYn1slwCdUoBDBihft7vOtufPOFZHLsxrmCIFxcjDz+YihKJ8xGKxBoARGUwtxMlfR4JMaPnRgBi4M73n3Ype4c18ylFtN10umacJCidl2F44Xuk5+oBmlyf/M+o/5t+UPnuo1Bthxi7gQUyRIfwhKjepZLYHgmNXAFMnaGYzAItakZ964Bu6oE1FfTsz9mtPlAtRbDbvBBksS5TkccTfO3xgDP7wNjZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ig8Wf4NAZAeaPOtVEOe1DLJaRl10ofAMawpOc6oi9t6NQnIa0NjuAJgEYZak?=
 =?us-ascii?Q?fWpH784Y1SgLcm6uYKxbFR1++DBj51bCFq7tLOHa5F+gRYmIKEXpOhamWk1z?=
 =?us-ascii?Q?OUivjxdzTNvzOoIOB2Fqqtxlzqk2cx39Z0JXvEGkdZjhPKE/Ql0Wvro5UfKq?=
 =?us-ascii?Q?0Srjoo/WRLhciuap6kWRa28cmJNGPPH3E8W0+kEHbZQ55yPF8DvqVq2387SJ?=
 =?us-ascii?Q?ywheAhBKfVyOosf8CU65cpm5N/FhX8OBc9dkGWliRrvonyOGrO/dqR54GkDB?=
 =?us-ascii?Q?Xnfm7VGwDdi4gA4G8xyvF0pIVFXhNKvtsbC/op1fST9/RccKJI0GE67Izkne?=
 =?us-ascii?Q?KHORj0BYGS3Fii3L2zAtbs3Q12galkJvKKVP+wpcdWoZ1s1uTGE7cA0QEZyW?=
 =?us-ascii?Q?puzHNT8vehA9J5fxO7Q7DRQy+xxlp5dTO6OPpzRfS6tB6GsWCPw1ojt/atqx?=
 =?us-ascii?Q?PyKluBBpgnCaahVtCifoLEopryZE5s9R/T8jnOauh3bBoXLpT69pXMM5XDiK?=
 =?us-ascii?Q?LhXXUMjvqTYEK2QyZyjiwGoJ3P7Krq4gFa8Lx2DO51bDGZKn7P0HwGKEJZKZ?=
 =?us-ascii?Q?tyIUaFHkRadEmFGmf0gaqSif1pJRjH19sy+a4DKeLOHNtRpDYNb3if4jj8D1?=
 =?us-ascii?Q?Ov2llovGvaPkPtPlsacgl2d3hutjbeg6aJd3pcOIsVFAyrZf6EPpT1GwIZb+?=
 =?us-ascii?Q?D3Fo06zWLEnIN3aXyudWceAi1xohKIwZtP+Ns6Uw5zaWguG72KRdaqdY4xPT?=
 =?us-ascii?Q?GKvuNlUrVqQX1qZ4tamUC0gmsWLEIO6lw+9kKhRPHL7e8wZVgERaOtGu9WxB?=
 =?us-ascii?Q?vRh1T1L7Htik6aUf8japl/Ux+8/jEHkMsk+PNOWbrQrEKo/j7FuIHcixTIn7?=
 =?us-ascii?Q?a9yB6uXEKafzIJN3aCoSmkCMQZ5AuOQRirpMMzGWwP2WqtX+pwDenpTW1KLW?=
 =?us-ascii?Q?SozBG22vCpfNLOcBAvAXKHDwFo6qhjpr/p9SEMNyyx4j+Psov+4WN4Dek0A8?=
 =?us-ascii?Q?byl4GmDntALNpKlCkIv+qi2JwpgAOfHVdvEstGyPEcGOTsU/dyG4HCJTh11G?=
 =?us-ascii?Q?fWwspTo8agQ3EJR7knwAE+9UlBSmc1Bw7UsVaxekswx7fEsePo/zGZrRkvp/?=
 =?us-ascii?Q?RigAOeR2QSh8ajr+QiG3nCEjkQq3cWUMnVvS5VKEmdRa8AphOsf4bnCNnpns?=
 =?us-ascii?Q?EHxE3F5NUC5xwEQ78KtntD/Jzge9DxMZwbZvteqOv5PzRBwWER2WRwpjQkJZ?=
 =?us-ascii?Q?fBPvRKCe9yswMddhTKwrC9hZCR2GDaBLf8rNPZx3Ae2vxaKP1fALTGiPfrgn?=
 =?us-ascii?Q?QpDHNzjIc4ABQW3mMgA3mpYp9zEXgV5Ls0N5op1NRzRmW6iQ9CNObj0VPELG?=
 =?us-ascii?Q?cGpJ6O7RgAzcxon1sW5uwyAqPdUY0LzYHxZBMTm4tjl0rAl1dQZG1mkKNpbu?=
 =?us-ascii?Q?rKxSpL5Dq6gXliDcpUhLY/scK9qCEFWxoWIk1w/qEAxQSeA5mO1aVTPdtpQr?=
 =?us-ascii?Q?Ov7DudTSq3C6ug3BXt8MT7vvKRt+VGlvlJ/zjxPqV3al/bVMumFIm6dnd7tO?=
 =?us-ascii?Q?g/Ofn89jXliTF3VLnhvNPcuHRBH2YfU3Qmd8ps5SZjVX4yqs87Ua9Yw8kgDt?=
 =?us-ascii?Q?8qtyHn5xVfCr/c0mwbidWDjW1U5NZ0wCgjn4GDGLr2XAyeDqs2axeR37YoXL?=
 =?us-ascii?Q?RP2I45C8/G6dNhkwnd7FafKsDRx65Lw98mvgA20Hwo28DR9Xx3U/ehFyDP1D?=
 =?us-ascii?Q?aPtzmk+Tpkb/4RgBu55YA47+0szral4=3D?=
X-Exchange-RoutingPolicyChecked: aWqabToqNOWzlrdgsi2YOCJWIZwiNLVPzMxYmlNI+Mlhd4yLSbgc21Az/ShmN0CpLta+p72cM4fzpI7T+Kv0bIec1FQ3tzGWHGMW7+jkhLVMqyPvoKKilCnZvUgRNy70lGeMJQKhyxzyLfOqKM5bjfg9ZUq7lQkOQHpQWB/76DWq1jvsxi0/hwd5Pj//wO1VsELFY1y5NBUUDVl8XQQZazVbFBLAVrnxRepukQNW5tXEi4n6yULYav9XZYb9VTmIOmCh1t+E4D0QIYkEQ2N+1M/Fk5eV07pmWyGkJIEncOvj8pBJoNNObYGzYC7xo+AHEXUOQOS1TW+ys06qLTTEfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6f6571-698e-4ac5-9cbe-08df4b1496d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:53:11.3339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwdMwoFVWX+644AMDOVTj69m8F6hS7zh5IFTbrPd7ERWDVtD/88OoWJOLZqQzMW09d64NrI3AfqrpQbDRlUzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9780
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:26:55AM +0530, Sanjay Yadav wrote:
> The async BO free work may run device teardown and still execute xe
> code after xe_device_count drops to zero. Since it runs on system_wq,
> which module unload does not drain, rmmod can free the module text
> under the running worker.
> 
> Queue it on xe_destroy_wq instead, which is drained after
> xe_device_exit() at module unload.
> 
> Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h     | 3 ++-
>  drivers/gpu/drm/xe/xe_module.c | 5 +++--
>  drivers/gpu/drm/xe/xe_pt.c     | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 77b3a02e9b8e..a4c4fa6f183b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -14,6 +14,7 @@
>  #include "xe_bo_types.h"
>  #include "xe_ggtt.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_validation.h"
>  #include "xe_vm_types.h"
>  #include "xe_vm.h"
> @@ -550,7 +551,7 @@ xe_bo_put_async(struct xe_bo *bo)
>  	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
>  
>  	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
> -		schedule_work(&bo_device->async_free);
> +		xe_destroy_wq_queue(&bo_device->async_free);
>  }
>  
>  void xe_bo_dev_init(struct xe_bo_dev *bo_device);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 897724cb5cfb..c7323d59b747 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -116,8 +116,9 @@ static void xe_destroy_wq_module_exit(void)
>   *
>   * The destroy workqueue has module lifetime, and is guaranteed to outlive
>   * any xe_device, and to be drained before the module is unloaded. It is used
> - * for GuC exec queue and xe_vm/xe_vma teardown that can be deferred past the
> - * lifetime of the xe_device that triggered it. SVM pagemap destroy uses the
> + * for GuC exec queue, xe_vm/xe_vma teardown and async BO freeing that can be
> + * deferred past the lifetime of the xe_device that triggered it, or that can
> + * drop the last xe_device reference. SVM pagemap destroy uses the
>   * per-device xe->destroy_wq instead.
>   *
>   * Return: %true if @work was queued, %false if it was already pending.
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 81e3c2e2011b..bceead2938a4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3072,7 +3072,7 @@ static void xe_pt_job_ops_destroy(struct kref *ref)
>  			 * put.
>  			 */
>  			if (llist_add(&bo->freed, &bo_device->async_list))
> -				schedule_work(&bo_device->async_free);
> +				xe_destroy_wq_queue(&bo_device->async_free);
>  		}
>  	}
>  
> -- 
> 2.52.0
> 
