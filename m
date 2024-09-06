Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2F0E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2418E10E1B0;
	Fri,  6 Sep 2024 21:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM4+WGZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3246B10E1B0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725656963; x=1757192963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T3gR3ocjmB6U0CKnDUHBZpxlAPs+71Nrk0bi9ZHQHI4=;
 b=ZM4+WGZCdYXn/cmXf+BwuMGVptHg+vqiA2TfO66uu10Dn2VxB5bQmJ3L
 9qTlC8GbJ3YNY6hSV2DjAsgqfqTHfts2rBA9D4O//a01p1ZGHX1A5Tsct
 KwYFboOsQNrrOJnEh7CqeGDrlsENxwR033R5qN0Y6DDUCREZQogTAna/4
 xxByjHyW31nq9kejzAtkHgvf5ISXvvctzBLP85/MnJ6/HAPoBWXnxWBkv
 9kZ6qD84gT95ev+czq/fJJ//HmT59pakOqjwCsPvqioK9X5B1QjyTvuH7
 J1zlkxb2xwR63ZUssMPs/aF1x6F+CNMAZfBpILAKBCdOkdMV5ldplMC0E g==;
X-CSE-ConnectionGUID: 4zN/UKEpQv+K1XZRLpdWFg==
X-CSE-MsgGUID: pK2AIoJyQ4OTodLrp9rZDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23934995"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23934995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:09:23 -0700
X-CSE-ConnectionGUID: ZDFrNgLJQmec0HtT5mMA1A==
X-CSE-MsgGUID: GjVFPvuDRNaVE/+a5dshpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="103532886"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 14:09:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:09:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 14:09:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 14:09:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 14:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TV7KTfAQStYieHqOic4mcX9P3g2mP7hegR2tnH7NwPrAXcis8Qx14XQWo829dLG1CN19cM4XtoNoxCjdfwp/IAklFEeXkRNaExTzNvDxsXBXt85rHUuZyo2NZcGoNAd+XavPe3n/tB8O85XISA8FKxrfDhx5eSXOv5LOcuMkBa7fmP55LLdqUcbzEkJX6fdwQq/xS/bTHQzLKGKVYjUsUCPMqhwALOrp0LBaUBJn8/iWa8IpJJklZAuZpS8AIuonsKy8IIVDsuuJMSEtrJzoGkNL2SDMq94XEP2dtp4FNhJ4rNTgnxRfgupEI1QZ8voEb0/Cqn/qtIe0lSuTZkbObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTAQJEkAPRBGk2i+ewOey/m8A0EZKYydXqJOqsoieE8=;
 b=QO/hQAKteFTW0EiuvnEUgtsmw9c/3kAE0aQVnj6Nk0iiJ+jMGxRvyIffkTeDth9uMy+rDI3BQ6t7EjZ9VW7DC1FEbyqz5mPx744JEK3t9MGUoCZwX+Nq272YT4Memz+EgcFtsUEyrfz7pXlwnlVj2tHrBKvgIe9oyoLvmwc4D/T3iM3W34Bm0s+ATJcM6GbP7uc6fGsObdY7OXOPE2WEWjN/L9hSOaGg0ehJ2Q/+NC26dFniCSw5pukX0CHMYOs+jY0v3985kVb8j387iVZRsaoNgduTQnoJjQtgLAWB+aoTAE9mAAaiZxtQdtyAhlpZLPfuV+ptKxV4dVe7/xf4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 21:09:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 21:09:19 +0000
Date: Fri, 6 Sep 2024 21:07:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Mark reserved engines in snapshot
Message-ID: <ZttvB/xfNUwYVlp6@DUT025-TGLU.fm.intel.com>
References: <20240906205609.3131330-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906205609.3131330-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: e48f1ab7-6575-4563-09c3-08dcceb82c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7YTrYI2o2/AeEIWiI0OAohXL6OHrrtvRUkvBRAON6d0jzGt5dTZMGLXvcK?=
 =?iso-8859-1?Q?6cXJglO/1WVuQUd2Cl8NLMgnEJiYgBlGzO+U5rkBKeNF2uqmAOduMXY7b7?=
 =?iso-8859-1?Q?+8DWdAhUQST34CEjlFQewKaZtIZH35cYgNoHCxrcUyAr+IVdhXOPND7zQm?=
 =?iso-8859-1?Q?SVkiOiMM6OFscVbaSSVZ/zCaEsUk0ry8qFdPULWUZPuzUmrJ8Ae/szCcAh?=
 =?iso-8859-1?Q?t1aWH9ZAA+J83uSB4BbB5OBLN5nNWPH+x5k6/piCTg812uvwEoz1DGKBsN?=
 =?iso-8859-1?Q?WZFFbbctMSbR/CAQO6SrX5IrkhOEi9WDkqGjHbN8mktWLf3lrtTHVDGD+B?=
 =?iso-8859-1?Q?44mcVAswvw08/kTBg7sX0Bp5M4m3IGiTABPEHZKju9ZqGmM0oaUfmR0fIB?=
 =?iso-8859-1?Q?CAzA58jvQYQ7JhpxkZGdMZP2IlqtVG3iEnIwzkEWm43bvtbvVNwKkUP2XT?=
 =?iso-8859-1?Q?6pxE+TlmIpgoRGm2CzIfHhlLYvKHHyrf1mIZlYTL1puQh6qGQqXl4m9Rul?=
 =?iso-8859-1?Q?KhMkWzydD4YkcDR7B3qvU69SW9TxaGgdAfbQI2j/KJxgkgDFGuuas2nKb0?=
 =?iso-8859-1?Q?AGS27eo/JSCWD5q3EfJdwSLiDkW0sFG9gPDTwyxLRjv0gSjQFDpC3wmkAb?=
 =?iso-8859-1?Q?86GdDF5qlWkUXYkz7M+WsDgSNkWo5y3Yqia2695XSoybWCpo33i7TD2eik?=
 =?iso-8859-1?Q?OLHngoa349ktlg9b7XdSWebhU81YJaq2+F1+ZWMn7U9jmlh/QRIDphKqfG?=
 =?iso-8859-1?Q?ALRRdFXzBjU1zvCvtSm+yvM8xur6xQ63H+X2955VLbtVrF9AsBIZOzYXVu?=
 =?iso-8859-1?Q?Zl37teDiVar2uUsqdEwMpqhazWIxIBWbKSrzjKuCrC9KetDCWSPw3XR9hb?=
 =?iso-8859-1?Q?Hmo5lZDgfKFhbpgYbbNtyQZsA6d4SfUPPqxFsTMpnUoplpZS2g8xSPTXrV?=
 =?iso-8859-1?Q?I0XjpIWCyhJOKGjMypaCM7C0AIZfltlytodx/lcboLAyE3icj/qdj4ULPP?=
 =?iso-8859-1?Q?BzV19qL2gB+TwmY3j3TsCNQ8mVm+W/wlvMnxwxAkBu0rpZSJte23T0Mz+Y?=
 =?iso-8859-1?Q?fEfr5SVvY3lZnJZ8jicXhObfDry5T+uQmfq+enDdp0spkLbSoNV2hffnjV?=
 =?iso-8859-1?Q?xlAi/UBD8EkeUwMS8TExotOv1FIt45TyoU4lQA3czly4sPxy/DzO32Aky7?=
 =?iso-8859-1?Q?60sD4Cc+S5FsndDKjJbZg8caPj+zn3QPOEzKmVTiFIYqW4ZJ7gZTloPvov?=
 =?iso-8859-1?Q?Q5Makp8er4vIbZN+RqQy2XNNlW+f1WP1O19tDSVxvy+NvOTDbShfAeCJ5x?=
 =?iso-8859-1?Q?IiVbupS8llRME0V5ndrG2aoz6T4g9bKng9kLS5BZPvmerx+qXY/esF9sH2?=
 =?iso-8859-1?Q?aqGOI8Xq+NrVKfopz7mNycQUHm8xetbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FvcnBnMmdEGYhJCMrWC+tmgxrQNdRTBk5g04EsT6MbuXDmh8UGGG43QPbx?=
 =?iso-8859-1?Q?daZ9x8MoqfNAlFVY/6qPc53MO4ziT9w7MwCtKYPD6C3bX1V3tWZl6jJN9L?=
 =?iso-8859-1?Q?Ju5+V+PKypSNrlCyklSgIyRCAwceNDsiZRC9P9D1GIDsMv0N/Yr0EjcX3n?=
 =?iso-8859-1?Q?G1wAxHJ3AQ0ry8JrfCrEe3fH1fIu7iKghRduo+I0+eLP4rcEMGOdFIs0t2?=
 =?iso-8859-1?Q?HQX8FkrjpetfcIoVUGWsla9BP+zH1JB+7skAhJbTSh474Q8dAYsXih3fr7?=
 =?iso-8859-1?Q?v98GMuHKG7RrlIbx0RR0W1zFNOrhPphf/2j4Fqwbhk72WQFfF1I75BC92A?=
 =?iso-8859-1?Q?puQQoGcb+xT+bSnLdfRjIaWE9gmO0oWJWu4g+rga2ttkf6DGzb+pJaCWmm?=
 =?iso-8859-1?Q?h+WNg3eXOP13YF5tXE6rguwhwuYHtVXT/MLTUEy5Yijp5yBxe5YATZHn83?=
 =?iso-8859-1?Q?wCyhokSzx3LTnDKWXsrua2aBBVS3sYk1Rbkzd2/YsXkxRr1qXIrlubhe+t?=
 =?iso-8859-1?Q?SS1XW4PKhJBZ8K+ubx9KewhqUujAF99ntDDACVf+4hZWk+7nCHnBIt6bSw?=
 =?iso-8859-1?Q?QJCGo84qUlf6xFgKHdJO9iwNarW0QqpSoBjFe5SbVjhdUf0x5jbe7/hrem?=
 =?iso-8859-1?Q?N5WoRxSDJTP0f63Shr0igKnt5tpH01B2ajARsaQ8ewKtvlkhGJe2vbgino?=
 =?iso-8859-1?Q?IZizgTVNyd12itmYschG+l5aIPvO8Uvg+1gSxsPukLtSCn8+yhKsJlwZ/W?=
 =?iso-8859-1?Q?Zu+TQ/C5NANbDatEriYEjTIt6D1Mc81MRMrNlrmtsLW4KoLMm3ddWkc0Nh?=
 =?iso-8859-1?Q?dNgbrDTaaeK/KGRFCfdSUAruJQ5UfesEU53azWDT7oGQ7enl1Oj3I8OER9?=
 =?iso-8859-1?Q?nb0phPxGb8nHs2ASuzestXKsa8pAjvUNHEEiRWbvbgjV26c8i66zeFhvBy?=
 =?iso-8859-1?Q?Hjewa5mwbKANdkNFaQUFvgj9kYyGOmtmk1a8FjMsGPztBI80lRwTqB/yR+?=
 =?iso-8859-1?Q?zLJE/zm0oQydKafi4lNJfD5ry63Rss96YjhjHklZY/atromXtmylTOmp61?=
 =?iso-8859-1?Q?j5iVD6bqgTxNLt6lDhi/FVmren8SiivsVDETeGef8zynkiNMqx7XSlibWS?=
 =?iso-8859-1?Q?lHFLv3DQaUQuCqFHG/hc3QNm6k/lUAD7EF8tpW6Cr9YSN8nBryOp8Mzx9n?=
 =?iso-8859-1?Q?6nu5iL/WWx/wQoZPAtLyDYEu6pRrdjuvHsudvPByW0nOFfNGrFdfjFQRv9?=
 =?iso-8859-1?Q?zwFdVw2DOm6VDLNHIw07Igv7JbFGfrs/+vDD6o2SVKoklVN1IQqVZig9UB?=
 =?iso-8859-1?Q?hC50I86k3BHPq+dJVHMYk551skiYZ/Mf6geZ6TzIrXgkY2PFf3aB3/R9qM?=
 =?iso-8859-1?Q?zxFA3oGPl/4L1Ua+H5XoNoAqLzEbFJ/STG8T5E7YCXPUZMgxoUxGdkK2XR?=
 =?iso-8859-1?Q?H/InhYcvoXUQ8OaTRFWO9LhlVFBzHQQU6/uQEMzF2u7KBh4XwzIuKmp3aw?=
 =?iso-8859-1?Q?abqqhJo8NSBGocLqBE0Xa8aHlgqmDQ+SwI7NfDJ1dyhX6JjpfaG2bCE30c?=
 =?iso-8859-1?Q?+gOwIoVL+MWURuM2Udk76eCC04C4jUep/PS4TrXJ7a2mMqL4NQvoKscKkF?=
 =?iso-8859-1?Q?SiBEJ+T1+4m8R1P4wsYH3Hn51FhZVxXK2G1i2UT4QmjWyoq99726jHfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e48f1ab7-6575-4563-09c3-08dcceb82c84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:09:19.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyNO/ZEmniqb2wBmrmcfsL6dbLVgY117FfRuHKGDjqL6NKdHZQwCllR22FTpAOMrPh0r7+Jfks0myM3e18UUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
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

On Fri, Sep 06, 2024 at 01:56:09PM -0700, Lucas De Marchi wrote:
> When printing <debufs>/gt*/hw_engines, it's useful to mark
> what engines are reserved so it doesn't mislead developers
> while debugging.
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Seems useful. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c9c3beb3ce8d..ce180faf2592 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -903,6 +903,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
>  						    hwe->domain);
>  	snapshot->mmio_base = hwe->mmio_base;
> +	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
>  
>  	/* no more VF accessible data below this point */
>  	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
> @@ -1025,6 +1026,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  		   snapshot->logical_instance);
>  	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
>  		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tReserved: %s\n",
> +		   str_yes_no(snapshot->kernel_reserved));
>  	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
>  	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 8be6d420ece4..be60edb3e673 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -173,6 +173,8 @@ struct xe_hw_engine_snapshot {
>  	} forcewake;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
> +	/** @kernel_reserved: Engine reserved, can't be used by userspace */
> +	bool kernel_reserved;
>  	/** @reg: Useful MMIO register snapshot */
>  	struct {
>  		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
> -- 
> 2.43.0
> 
