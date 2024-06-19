Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1265C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68C10E140;
	Wed, 19 Jun 2024 23:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZGSG5QT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9C10E140
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718839458; x=1750375458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ro+UKS1tTVr1061Sq7fOBiI/48EWMwdGdxx9LxHhzcg=;
 b=PZGSG5QTwjm+qsD6bMePSuGWffbZz6dVzFhCSeFyJSkZXoCrRlAbs/rb
 7yS9zYikry6OMhLSkmnYQLqWEjVHECl9nk42LNuKOZUHTHg2nBJzL+ps4
 ck6MFfBnDVjGsJnVEXTcb9DdOttFVv6Xbs55Ms736o2+HGPgzqq7NI6jg
 9BC4NqRYIWuI85yV53BqSHrdfkRF4oWvqC7zlbz0Pw+VsN+2AMjOY/RRG
 y2hEh7VwcWnFkNNntkVBZ9mWj4BdgslIJ5bsT9ouRxBqg3YwiictZ3J1E
 GWwmsWxRkUzaczOA1PA6kXsYikrhvFD9DHnAH18gsNi5ByRHLwv13kq/F Q==;
X-CSE-ConnectionGUID: 4QDytjsNRa+L+VAdbLqzDA==
X-CSE-MsgGUID: VTUSf8F5TPKrrNeAd9Y4TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16025823"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="16025823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:24:17 -0700
X-CSE-ConnectionGUID: QTgVtmInTtieWQR4ZMBaaw==
X-CSE-MsgGUID: PgAc7cm4Si2FxrCC2h9Bfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="79533209"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 16:24:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:24:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:24:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 16:24:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 16:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDnVYMfR3dwt9A6I2AQsKlSqQasUBUaTYD9rpoTcHcoYrAvnVmoGn5NxhdH7XJllPMHbV7TpDbfC1WUdFEIlQuTA9ryKnIOO/M3qrFss8BPyJz2meikDa8MExImoCSUsyA8aLiLbd6zEzYclvFq5nwQ411l/5hWRSdJ/z/83ozEtsXOfnJvU2aQiLFNMesBmfPofWhzuukjAttG5s3FDfM+l4+NlmAiYGcMnniFrWLyhPhFk1Zhrdr07igCyUQIorTw1DXuD6XTlJYsPtyGuWzQ2mO3g68nSs/Ma6TT9bbiMmUnEK+5+A0vxdr1DU3GR2WbdS+6zczjRsz3FYTd8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XFBQ03zM/UpEOvtpVx4xw7WSa6qgHS9kUBPDYt9uKw=;
 b=O2KLJG9RVpb3j4OSxpAnSaAyTiSfe5YJ/x0rtj5BYYhdhsrn3fEU3nDdj+XqoJmZ6KuSp4FEtMGKMcgUpwfD3lEQEHBj2pJejmB2q2UA3ZiwZEB7rubVu+LU7z61Ckocla5KBk8Gzhy0TLD6JowqzEVbgY2XebzJMTE3oBdeCzfyWI70UZcE9zHeDEhFlrlgv6mQ+xPqG67JinH5aWX/s6/sm47sLrmzRjeuWvba/QjCIK1pQe+2+cB2M2ZPe+sKMEtqX2Gj5HdzzFrPQ8QaIDZNLVt4GS0ThUfp8R+6pOCk+2fRY6vU5V8oJ2vnL+B9inPERu3N26I287qRNezqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 19 Jun
 2024 23:24:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 23:24:14 +0000
Date: Wed, 19 Jun 2024 23:23:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/xe/vf: Custom HuC initialization if VF
Message-ID: <ZnNofcyDFwoy7MDi@DUT025-TGLU.fm.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-10-michal.wajdeczko@intel.com>
 <ZnNloxEj2yHTYahZ@DUT025-TGLU.fm.intel.com>
 <fff7c121-5b1c-4433-bfe8-403f685a889a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fff7c121-5b1c-4433-bfe8-403f685a889a@intel.com>
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: d111513f-c442-45fb-8828-08dc90b6ee7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJ6Y0yKHHA59bD77Me3hbAOhSDkQE7eGWPJdNQNWBCcqEc0OyXmg59oZoq5y?=
 =?us-ascii?Q?oUTlfz1cl4SG9gubHIZn+7w66v8Y7HkLJWozSZI3GwT/3THf3gtlTJSPPu/u?=
 =?us-ascii?Q?2Mh2vIC1DFdi2+LsjEzPWiuV8rwcuUwlPIeTZj7Prn28RsP9Fx8yy/xgYbp8?=
 =?us-ascii?Q?D580yUZDpE34QyMNOMbP3gz4HJwcp1o4eFS5yUdkpO9dWrHgGjGC35M2ijMO?=
 =?us-ascii?Q?om+tWb7cJomDUyQBJVpRnVc+kbYOKi5Suryps+B34MrVrgfmYE7L8ZxERn8f?=
 =?us-ascii?Q?Sh10IdhHtU/yJC3hAIiKhkGk619HOlEMauv3ITzJ4f8NLb/tQGDFevEyWAxp?=
 =?us-ascii?Q?xAFlHrAcas0NNsqbGF3d3ZpdD0ipA9SEgeZKyBY/UEJORl1TH/Tm7D2E7CV8?=
 =?us-ascii?Q?WSDM99Z4LLvA2eDR7IDRHHZ/5UFiFXmdJJoFRvtuzMCA8s3vDvTebgfnodju?=
 =?us-ascii?Q?3i7yfNb/O9ta03YKUp/BJKRMW5zvRvnDQZvYTsU2mxiakMkNCst2JJfROOv5?=
 =?us-ascii?Q?4YnJpzc9Dzj9AZ0awb6ulE0begg7K1uCDB4yIiblpRAPLvoiPoiLIo8HkDn8?=
 =?us-ascii?Q?DsUIZNRgClZx7f1bmTzq4tpwb42qxA58tm6rdpmmthb0odUqXN9kTsOiyfo2?=
 =?us-ascii?Q?BdmDycS9kRRUs4SJNsp91aitrdIcfJF3ZI999EdkiO9iwME8CK0qFWgOAMA0?=
 =?us-ascii?Q?qk+7Vim+mwaIP0qFDUONUcih9tHzFFIRy7TQHz1X2FaHSjeBrVFwIA7j9PyV?=
 =?us-ascii?Q?6q7mGsAqzaagOodrGpLoLA3RNaWeTQmoKB9odrJiAIj5zrxwS9Nha+uCGIdQ?=
 =?us-ascii?Q?/Ka0ZFXwt4Bq0w3sC3kTofZVuN4mBdciL8GkhlAL5lvWyoSoCAVKnuPybHzb?=
 =?us-ascii?Q?TGmy+Cx4+CwKs9486Wpcxb/PK6VoU2ZpZ4Rk1G6yqFhAJcGzOKZn8ka5oi2G?=
 =?us-ascii?Q?7KYp2Zzsk0kvG3gKqdo+JizNvSAQvdLnpYPqqHYTC0N1wBkiJE1WESK24Ikj?=
 =?us-ascii?Q?EHsmlwTNgRmmIOVtFP+fXVQntKkvDRfgW7aboRX24k8fanfNgnS2uKo4TUDM?=
 =?us-ascii?Q?aNSLGy2igywoHsm/R7eUS+2seYcxyE5yq0I6edNsiKOASN6/M3IiAx1/MQEp?=
 =?us-ascii?Q?fccY8mZngd0nm22NJ+SC869B/J3fmr6D8F25z398OJ2K9FH5e8Sj8mFJrk/2?=
 =?us-ascii?Q?UgrIM3FhHQQAAhZWsJOBrPOaoIt22v60pyKHZ1lhgk8RZQ0872H0IpwUgrep?=
 =?us-ascii?Q?GLyNMacZbR9VEkba9Qo4d4poIhjS2oh2uaWh7padW5aknuGowHj/IDN/hro0?=
 =?us-ascii?Q?8gtJZL40jYCQMfpnluwl5WEm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4ejX28GrPI27wVlHCRuAF4FdwMLGwap+SVQsATWeeAwanOqOBshkMjPUM8e?=
 =?us-ascii?Q?+Vvm8OXq8FtiARZ1tHeZjmnc5DW2fmNixNZotxH2vvRYiaJnSsUVbg1Ux/Yc?=
 =?us-ascii?Q?Zve96NsJXt6UGk3aKzf0dz0J+3jiaO4P9pao62G6QWcmbN2n2JSvSaJZ0JiR?=
 =?us-ascii?Q?i8GTfBn/ERCe6dS4ev7eAaiv/UWDe2e3Kb3JODzAbQA2jsICyS3TH0g4khd7?=
 =?us-ascii?Q?o8y6l1ZgT7l1EkHy+g5LcVAyn+3yU8ny18xV8f3dEcQwtZ7LCASsssc+cMdu?=
 =?us-ascii?Q?6K7znvtGrWwTOVBocXZaSnZkl12odj6JEthu0Xs4EReWS6t/qRw1SpXjrLa7?=
 =?us-ascii?Q?EO3FvQwCxkIlzKk9W4j6WlngFq8P41mIWXVQIcDrQpz++g0JyRvb645HOJz1?=
 =?us-ascii?Q?vHpe/vkznPWGeDQA7e5K3zfImkZlUXdzZgDR8eUhwqKGijgd3APGcUY2Gura?=
 =?us-ascii?Q?O72WgTzq4Uz8nRn1hPbyBMuWBNCOthGIKbwgskCSXiDXlQM78a073xsIA8lj?=
 =?us-ascii?Q?zhgk0hQBE42sCDkBsqwDemT3no7crIFk1qVc0ZhnBLrCrsikEWPUEXvQ89VD?=
 =?us-ascii?Q?K/1U+PhTgPQnI4/F6yadHVqiYWezqxh3vl5tTB0QCL5pmkHqFuL/feO7KFWm?=
 =?us-ascii?Q?z1YLW8zu6+rLTu3/6DpRp2tdmbViG3apfNqdqpC/kZ9epGVrmU5HYwwTwzEq?=
 =?us-ascii?Q?6kr6Us2sp9zxr4UHNFcGXbXeNHTAX2ku6BYgrF3zwX2LX9Ca9IS5Demd9dhl?=
 =?us-ascii?Q?y/UURRhVyJxyIsQwsjLl9i29+bBqUzf+0gIaVcaTkTfNlxPn23MTlWkaWx3A?=
 =?us-ascii?Q?Li/uAhbrnX/tpB5yJ+TcuJxuo1K6ed+XiuHOO4GHtqM31/nOhrU+90sCiwXG?=
 =?us-ascii?Q?0iiQ0TBhBiuKFyTTquWKI1RFBqfBttXX/EAfbs2Qt3m9uFQIG48Qm0V1aE/r?=
 =?us-ascii?Q?kgi/eF4WECfBLcTHpzj5pithHMOcK5XdHu1WphVQvOl6yr5/rvwepmOMDoRv?=
 =?us-ascii?Q?GVxEF8aIRx0Y/dIhnfKsO7K02JB6s+hEkIYTF2QU0uZn6PZEPS+RMflvTco6?=
 =?us-ascii?Q?dWFkOEGUBSH2QbwmXyFQbOiS/s8ISMktX5Gwdsce7dBmEVZTFYjEpFpD5Kfb?=
 =?us-ascii?Q?rmpOVOT5XPrwepQxfo94TR9o1OamPkroJPhCcbS3sTwvBeobw9fu8ApeNDD/?=
 =?us-ascii?Q?bVKnJYLsW8a/R3Yu87E0e6ksu9dP4zW/R7nu3+KqzEg3KW+VDsQOFZwT08dg?=
 =?us-ascii?Q?OJk0lXE8djbBSx2DRJ0X4yXda3a9sDka6djbk5NT4n2yd8u0+tF/0+JhQfYz?=
 =?us-ascii?Q?KKzO4HXo6wvs0ZwwcHY7drzSLlRxOmoC/P8H9AhhXWpPDZQZ95MSsRtN4Of/?=
 =?us-ascii?Q?+pQJTJB0tm+V58k1ZL1njm/jn6yByIF1bft2kcJFOB9yuoqKGQHt/Wqq2Lvs?=
 =?us-ascii?Q?soV7/+4cdr2hf9KDI5Hu74hVQySMY2HJ/oH2v0DdHyOSQua3Z3drCGqsZ+PP?=
 =?us-ascii?Q?H68LwcsuWjFZJm07SNoSmDZvaZmaJDka0YxOnVyMEGxCpLDrDQ8Qi5bGetMo?=
 =?us-ascii?Q?8ZLSWe07ElF921j7/eJ2UIzeQcO29Q7jv3RLCduYN/vMk30YuRkNXe3I+TpQ?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d111513f-c442-45fb-8828-08dc90b6ee7a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:24:14.0055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKpXm7hag4fKXZNKqllH+lM+nKTDkWSwANtYK3tH0hML1aXE7937GVBOF5m+MnCIarbYeygl2i0AhjZwbsEtTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
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

On Thu, Jun 20, 2024 at 01:14:29AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 20.06.2024 01:11, Matthew Brost wrote:
> > On Wed, Jun 19, 2024 at 11:45:57PM +0200, Michal Wajdeczko wrote:
> >> The HuC firmware is loaded and initialized by the PF driver. Make
> >> sure VF driver performs only limited data structure initialization.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_huc.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> >> index 6238fb354914..c88761fe31c9 100644
> >> --- a/drivers/gpu/drm/xe/xe_huc.c
> >> +++ b/drivers/gpu/drm/xe/xe_huc.c
> >> @@ -21,6 +21,7 @@
> >>  #include "xe_guc.h"
> >>  #include "xe_map.h"
> >>  #include "xe_mmio.h"
> >> +#include "xe_sriov.h"
> >>  #include "xe_uc_fw.h"
> >>  
> >>  static struct xe_gt *
> >> @@ -92,6 +93,9 @@ int xe_huc_init(struct xe_huc *huc)
> >>  	if (!xe_uc_fw_is_enabled(&huc->fw))
> >>  		return 0;
> >>  
> >> +	if (IS_SRIOV_VF(xe))
> >> +		return 0;
> >> +
> > 
> > With this change I assume the main part of xe_huc_auth is never called
> > on a VF?
> > 
> > Does xe_uc_fw_is_loadable return false on a VF?
> 
> yes, as on VF it is marked as PRELOADED, so:
> 
> static inline bool xe_uc_fw_is_loadable(struct xe_uc_fw *uc_fw)
> {
> 	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE &&
> 		__xe_uc_fw_status(uc_fw) != XE_UC_FIRMWARE_PRELOADED;
> }
> 
> returns false
> 

To be clear, I'd add asserts to parts of functions which should not be
executed on a VF if it is expected to short circuit on another function.

e.g.

xe_huc_auth()
	if (!xe_uc_fw_is_loadable)
		return

	xe_assert(!VF);

This patch LGTM to me though. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> >>  	if (huc->fw.has_gsc_headers) {
> >>  		ret = huc_alloc_gsc_pkt(huc);
> >>  		if (ret)
> >> -- 
> >> 2.43.0
> >>
