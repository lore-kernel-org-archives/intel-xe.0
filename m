Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2ECCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 21:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB1E10EA42;
	Thu, 30 Oct 2025 21:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giAoa9QC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908910EA42
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761860627; x=1793396627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oQ5xmDS6/A3ME66oZcObUMrRelsUk6G5wvuZ5Hn/92E=;
 b=giAoa9QChvOQvp8BaVUFjdl9ofdx4LMUomOwDG1HCJiotvB/ShrVWWuF
 Ym4tAmEON6J7hYnCL1zVZ24VuMEkrMxKfNdWoHWiWNLOVc7pwchpNSOSv
 UBuJBGuVv7EifXuadKdBA3Mbpy41NaxeiBHjGt2HnoZ1SqpXGCEXL0wn5
 EfecHJCFZ7wbRloN9rRKu28Lo8smHMISACScYLRby1u0LYN7b+Y/MA8t4
 95W4sUT+QAB3remw9hF/Abd9sVEVZ60VDehOjkvtk75EKor+bt0b0kZS7
 a9yn5LgOCfvOFHLlusPIz2XmLjy8D4rkeB3h9jdfysgmvqpI/UEjSpnwZ g==;
X-CSE-ConnectionGUID: b2pDfZWwSd+wf+95AnFvCw==
X-CSE-MsgGUID: ivbj8BarR1eYQkl5LZvYLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63944537"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63944537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:43:47 -0700
X-CSE-ConnectionGUID: 9XwPzNwWQd+FTPl26fFpBQ==
X-CSE-MsgGUID: iijwGf5NRguY6tcGy6837g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="216721411"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:43:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:43:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 14:43:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiHkMKto3y/htBLk6OvMiQMXtlp21yeIC2qAYRyD+U4OvU66aH726DJpJA99K2J2UKRjqRecCGGRqv/Vq2l29DobqRMxINX/ui4EDcsBqwkklKuD2Zb+OKz2RcYxp05D6ontXirryCB/4VbveDqz8Y9d+SQHgKyoFMwTefm2hZFmdqjpt6RBE5jMX4gL3MTKXJKdNZu8VWxvLA9yHEdSoxD839oO9xJF8vzZvu5DM8X6g3lrrSOk1K0xY88QnZ0wjTeMYDEJPonAwAF2+DG9+CNdpeRMezJk7ohSrDQkYrhuV0ZwfMAWs/w82n9QjbGvMZmnXL8sofwfcLsjXu5XjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM+SG+UhHxOgRR2lHmZroMnAyHUECqe2SE4gofWRSkI=;
 b=ds0lOgAPra/PUl3NhaVc8ZL9+OQUDPcBCrCM7+ObjbRa8+IRsoK87mXnxLjbRSWTiCjStwuQ0ewRJCJwAFta9BUWqfciZ6OBK8bbDRL99L8iWHfY/eim8OFbV3xRZezOb5uny7vAPbqMMiPz0SKfbGybjW8gdcrkrwSciLJU8Htc6oOxkf3ehqpUjEjYVLxOdEKhHRoK4BX24kgys2x16Elup6bxGps10J4PPWhR4So8+NtSfaOZbRwQUYpJu3XYJga26S5aj5nkL0hw6U961OCfsR7uuhU7wuuq7fD4vO061eOFJvdSBlx/ac0EgkUpVrm4/iq8MSKZD7DshI0Iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 21:43:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 21:43:41 +0000
Date: Thu, 30 Oct 2025 14:43:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_14023061436
Message-ID: <20251030214339.GU1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 6456a0fd-719c-4822-9f28-08de17fd649a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KVABNQg1hTbFkh/H9gyfTXzHyR55EM9FYr5MsTpqizjELOdkKKO7X0v+r1zV?=
 =?us-ascii?Q?goI9CRy/chqEXG3C9AxIjDr1ewvUXlGyStZuQxJNfgCJxq1zk7T60+knX44b?=
 =?us-ascii?Q?l55g1DuucbsiaOp6xKWNEZACnp+8yZWbIPBJRUGo9VnfbGp0j+t2rQwfVPzS?=
 =?us-ascii?Q?5k1amRseLnpzxWzfcByX24nMBzNegB/OjdP44SZPwZpUdmcEdcmbNXHHT/uz?=
 =?us-ascii?Q?85Fe5GOL2wRAWGMSy8HIF1B0F8aOasj+KFnmJ3H28GOJ26lClarxh+GZiu6k?=
 =?us-ascii?Q?eaZ2G9jXmz9fi/QtJZLXgtgiwrerkBLhldFZuLqzAPtqtZPVHpFuPiLZ02oE?=
 =?us-ascii?Q?NRdam1FoXzWVcidArM9X3H5aGSMjr1mwxHwK/hbacuDRJVzZN8NXR5Bem2Tj?=
 =?us-ascii?Q?HHZD4Sg9JqlKKXMyw7kHxoXC0+RHYQoG9Qo+ufuu7AU7tnkLZI+7k4fpq/4v?=
 =?us-ascii?Q?De8yw0dW2upBecUZdTS9bDzISBqLTMp+2XefyBhGh6TInFmqBK4VdiGfYdRE?=
 =?us-ascii?Q?SZbyz/rKw3geHcsUdrleqhNDEdB7dRlFEWx5HHik6gAhmUBgB+vgTFyHwsDm?=
 =?us-ascii?Q?YJ5n4bv+8pGzWXcIEt7M0kScoZ1ei7TyHvMq+HhJP53ON4wq7qw+lXaHoOxA?=
 =?us-ascii?Q?s8zziW44ewJu1RXbq+Xj26vh+Zaw1HT0ndLFewgWgSfkGWrPOlEg+bGj6eSo?=
 =?us-ascii?Q?p5jr4F4cnU7pqZFpnAkz6YaGyMCPhCemH1OXdCt48OGV41ysznMT71cTFNUR?=
 =?us-ascii?Q?llYXmTeTBCHkSFVlsKQ4MLW49/GCaTRMNYyPbc/wW7/e4F/U3xNR6Yy7PEUX?=
 =?us-ascii?Q?3aUDcmomgf+phSrI5B7HuLha/byUoJ/EKWR1ZPlfN9/ivsJ4iNXtpc2vc7nL?=
 =?us-ascii?Q?zxyILKEvC28G2GRSx9au1h2NRAgnGYTS4vqeP3cbQcy4HccMyhWN0V22b/pZ?=
 =?us-ascii?Q?g3gFLmcy90a6ABCaM+YPuDZdaMSwMUCWp/qK3tEv/7vWz2PVt8iPr91XSuf/?=
 =?us-ascii?Q?8CeUJ6jTKFxe2KeOaTueVi0XB4LTEAI0Ng7ExvG+8iRDfA0AOWrrdztdn3xB?=
 =?us-ascii?Q?sLyzwaaP/s4+QeX/VbTUOGnxNNTvO0S+3fBoNsY/HrkW1Vv+mY63bX5BTwn3?=
 =?us-ascii?Q?GWb6FIeJ3k4ht5oCFQ8F6c4uEy4gA7a6VjFI+4MuozKUC74JlkbAebCqVUn6?=
 =?us-ascii?Q?w5YqgvTISlGhJZtY0Ew8RNAHLFRaa8SwksSPnaLD4slzXcpm4orJjin0Uu+p?=
 =?us-ascii?Q?OBLeCCAU9GF8yc7DQtJHZNjBvI0uXGUlHSjTp+A55khu8zHufflLYENA5GN1?=
 =?us-ascii?Q?uDchnpqB8iDKQK/FNinTs09Z37U4yBjfaMVoYxGEI4H2WsSWVTaRdQ8S8SGN?=
 =?us-ascii?Q?iSMMju+csIctYYNfc5Z1W3zR4E/r5yC1foEEoDlza+UMZ++3gn+e2v/titpt?=
 =?us-ascii?Q?iknUy4UG8OdK9jzVNgVB49aFcK8LRTmD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9AxXZQi6niO7ZS8kgyr4IrnUS5IZkHXQXzhr5BmV2/LT6+ofIw6j5siE4VUV?=
 =?us-ascii?Q?Ixwy9xN84hdMMtN8KY1ZhQeDjcx8BtiCMvwtDQ7vxRYhPqe4irU4387KtnT8?=
 =?us-ascii?Q?d8J3+lHIGPsAxwyApwfIT3jOLXmN22P4IWe839UxVC1XAxL1yNqRCbELBCTt?=
 =?us-ascii?Q?V8j3fHjxQ2JfdbnplvM6GvRe2b1pIc/RdTRbANbWsJvT2hHNeMvhBabQCj9J?=
 =?us-ascii?Q?Cs9p+xRh3gcB3DCvxS/kMPSxaftHcSJg6R0o9Hj4g/LFUUxdmMWUvhmfdwrt?=
 =?us-ascii?Q?z+8+bcwGcvpP3LgCaf5TpbEWgMsVqB6BOqtuXoFRdhCXJSP7pqMHSktH4APs?=
 =?us-ascii?Q?0g+wSEgyRfPU0OyVKwIAtYNz223SOlnbpFm//BhI9cdUNPzofos3A1MwucFD?=
 =?us-ascii?Q?QwaGXf+glGSL/LYx1PdS4+C2VgPiGQU+NMrNVLnBkG7ANydd8ctTGm4kpEkB?=
 =?us-ascii?Q?c7B53elHOHf7tB2J3OUPITsHESLaqXbLMTkbwNedRElzL9E0FLtxUrfhSWqf?=
 =?us-ascii?Q?34COPCpLVIZMLDvd5kgsKZX4iR8i3mpqx4bYGuIwHuQLGw8zXA9vrZK4QzE/?=
 =?us-ascii?Q?BkNck9u4kc5nCwSBJ+9oZoyYUkS+vQ8eYXfZjtP6KuYxWUFuogjMu+7lj4pr?=
 =?us-ascii?Q?eN8R8xCTuJwtl/ZzNFeQjm7GSAKg5W1/SkbZWnnLX7t4y/++c/uk9TcJfYIr?=
 =?us-ascii?Q?qhtf7LwZNtFwTxWVd5Ds/HuKrsqJBRvBfmIE3Vtg5KJagaV3wDVHjeQbLXsv?=
 =?us-ascii?Q?rv6ZGPitk0chiyMHJ6UzqB1g1LYgkzLhmP5Ycn+tNUCi/Gkf2Tcx8qJe4+7Q?=
 =?us-ascii?Q?3AwDmckp7YG1y5NzpsSRFaM0i7As2wp3CC5wrq5FbVOxsktIfXr1y11RYdJh?=
 =?us-ascii?Q?39KzjtIHceqp+PgU837RZkKzq7dJnNLH2IOpyCIIl7ygwEpBkRuXTmlcCo8t?=
 =?us-ascii?Q?kbXORaB+bwdXV1IfCVam/RvFHTXviFGbm+Qja1EPdhXFSrWMqJIEW/ZNMO3m?=
 =?us-ascii?Q?iokkV3ESe0eEggSpCGZi9iYKsQUx24KK+qRjgbAnTT4RDE5RzUF3CNyFkHDk?=
 =?us-ascii?Q?RuWdpZGrtZq9bdnNPGb7mHXxzpVU6QPxWSO/e1Yf/6TFdMMsXsrwpuNDMSFh?=
 =?us-ascii?Q?8e8sfnYH3yJYx2WeaMvcTAYZELJUaPNmLpCGFTjSOvJXnI4ds5iZ6Zv95YcU?=
 =?us-ascii?Q?Kg+dW3G8XHXB4mnGDacx4V3qu4PyXO0ohv5G2yiFB6kf7nKgdm7/Rkocyfp+?=
 =?us-ascii?Q?H+7Zb0LwucsKV+Vw+jgNLI/wyFV1lDRHeJy2a4boz9OsUnSVYZT9x7kcsK2H?=
 =?us-ascii?Q?i4w4SCIfdoe4Duia7YhICB2MI38rjZpot9R0QOaUPD4Awih3O+hnqyS2CGpr?=
 =?us-ascii?Q?9mMGeUh79Mp5i+dr9U2TEnZ5xq4JNysjiH81cr3hq5S0uJzQZ6FzgD2dwmOl?=
 =?us-ascii?Q?FzftNA9cG3mZ0FBUqvroDbxFsllrLIrmO/03JkJla/1rtIsLsMMPtDK3SRJY?=
 =?us-ascii?Q?icX16bxtiPGvPHr9B7YoT9U7hl7UdVyf2NEemOHlTjITw5TjJyfADofCvySi?=
 =?us-ascii?Q?rhCdn0pFDcPNkKfP9GTqFm+Fd+q40kxEWd6rHq8tm5rXJPzKknb7AERXMIAB?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6456a0fd-719c-4822-9f28-08de17fd649a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 21:43:41.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFJfp48fjC56dxLDkDQvGiKD1nEnx5ItA9QCr9gMfJ+MdCD5EG2KHox7C25OpUcnPw7dVqyeCEWSAQ0zZi5O0agZX3OW5uJDm8I2sfuHT9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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

On Thu, Oct 30, 2025 at 09:16:26PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Extend wa_14023061436 to Graphics Versions 30.03, 30.04
> and 30.05.
> 
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index ec638b431131..81e62291af45 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -679,6 +679,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("14023061436"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +		       FUNC(xe_rtp_match_first_render_or_compute), OR,
> +		       GRAPHICS_VERSION_RANGE(3003, 3005),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
>  	},
> -- 
> 2.46.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
