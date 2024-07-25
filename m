Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D9FC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 16:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FB610E20B;
	Thu, 25 Jul 2024 16:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRz7zWeg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A267B10E20B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721924913; x=1753460913;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dqAiOIrb5zEW941uTF/0YW8J0RvQG43wTh/t2JouRCk=;
 b=dRz7zWegVEEly7Acszaxy3snmNsx5XK2D514pIsuhUj3CXEpw97w0mF2
 ekTMO3WMOSibkguUcU6KdghNTT+H78CTE/0nxA9Kbku9kDdfmu7PjMqZz
 aClz5i9rSnUt3IjMDN71racap45xqAfLoWXqR2160bapWrywrSVbQtl3x
 ce5MhNDeOMMvs/jKzK8ZOUWTMDEN2mH5qC5eG/mP+feg0Fle/esuacitQ
 puO5AiEs7/E7CsWCau8GwRQrci/rKS8bVJ4yL3clhAbhbiLkTKHZFIbwR
 qWc8e0lu/AT9qffNfJE30LMD4zVzvKtvsXO2ZEct4si9AOnqipErmFuVF Q==;
X-CSE-ConnectionGUID: uiN4ysi6QviZEOjjrHBrZg==
X-CSE-MsgGUID: Jb1ybKvoRRGk37koZFrStA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30281429"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="30281429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 09:28:33 -0700
X-CSE-ConnectionGUID: 1hg2L1PBR4mjAiuuHrcbSw==
X-CSE-MsgGUID: 49Hnqo00S9W8oPfefMMUXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52654502"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 09:28:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:28:31 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:28:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 09:28:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 09:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrNpeDJ+Z8fav+vB+7L0r5T+cvffeibJrhZlI3reaA3FwBJMnUQ1J2cvTA2qSqx4nPH49n9G4b/jbmjRAVjL4AioNXaOhNMMnRGh1T5/gI1rMrZqOXErWLqNvqIjREsgkLMmaHHQAWPfKP2UM8icOy32uBikMkdhBuUoT7eB8ADhNRkOqpwQQGKH3YUWPA4RTlsE49XMjnjaTupcr1FDZ51SOT9378Bhuv1kkD9O+wwDez2SAbadeXart5BFAFP/+OlT2rIlQkjXBuqJn5+GkpWBCfdp3YkeHLU4TG8IABEP+4waSckoFVtMBUpfn14BKClRX5ch7CyDRWeB6DUWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTVEyQYM5pvRg0MgVdAGUIknQ0vNBZYlWbVpwNQ7eFQ=;
 b=eUnGK7G45AqQgCsN/vhFcQGBLHO21Nnxf0+NJIGJPukips9KXUmzpT5wNOgKzIEmdpVxWotSqg83ggOZJyfYb2zcL4J1fw5cpcCpqcwkkdsQLdEe+T+z/ruNUggn+X0UGdGMjjZ4cVhtTuXUFxo5YSsOivgisd3ALaKee0ObFzA05qzRNvwy4xUEmy6l3yXleWsCuhdkfdzgoEN8rsk///T3lSFXqYnlix4SqmvFfuL2+bOVQNDQh/qTNKwUHPxrOiMpQ1SSvVrkcTV9YH3haEp9ARCxEkc0/kxly5XKSoQaHnPoV2EiuY+vjUuf372m6ibFy+5hAKdxosz+br+zUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Thu, 25 Jul
 2024 16:28:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 16:28:28 +0000
Date: Thu, 25 Jul 2024 16:27:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/2] drm/xe: Implement APIs for measuring various
 events
Message-ID: <ZqJ8+YwoOO9MtJB1@DUT025-TGLU.fm.intel.com>
References: <20240725150550.13085-1-nirmoy.das@intel.com>
 <20240725150550.13085-2-nirmoy.das@intel.com>
 <ce58c4bb-ab8b-4b29-b291-3b46a24c27d2@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce58c4bb-ab8b-4b29-b291-3b46a24c27d2@intel.com>
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 373c06ab-0175-4120-7991-08dcacc6d0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SdGX7VaBX2I0NWmJ9Jd46ZQOqCqU09TB+BiMy9NkuNL0hO1YmkrSpPTN0S?=
 =?iso-8859-1?Q?WqtiGxQHRYd2A2NWhWK81F+vNInRDuU9iHGCzrNCXdqnsAT2e5KBjZmckp?=
 =?iso-8859-1?Q?AV6UDKU1yVMWfH34ODcDyTOHIjtp8zD/WvsRjXQwTNe37FHQeWxUg2SN5s?=
 =?iso-8859-1?Q?a4Ihb1MaHMn9/QnHZ35Q9CAuSSSprMKuvgHCVa7p+chKRdYAjwodaYccIC?=
 =?iso-8859-1?Q?noInBwIMP0+p+OsmcQrgr0P4+DWbT7mdWEm26hDPT4Lbn59l+ux3XmSo9u?=
 =?iso-8859-1?Q?BG7u7x9RvakfUY9SCFb6N6mJux/OiMxV9+gpljbpUsle6aebIbj5c3jQII?=
 =?iso-8859-1?Q?yTip58J5orRlZ369/brRRZ8V25Elk1xx+cB+fhKGJAECQ5Vy84KExBPtBU?=
 =?iso-8859-1?Q?3VPB9WbPCfc8Q3G/7vRrUZ8exAtt2lWhQXhL8sklIbnH6PgdReF0etHmoS?=
 =?iso-8859-1?Q?JzH9RoOkDY6uGgnBdewSwYZXwhWJ3PSd72BOrRCgn/JUCDatC5UqJhLDOB?=
 =?iso-8859-1?Q?f800IOgrdbHOUEwFz5pxen39BLTPdBVTPUdJlWLWyhj0MB72oI4pyP/Kqi?=
 =?iso-8859-1?Q?iImsbVQYQ1Q+ZGqx84dJDTCW3yvD9ONBtcxavnvsvJt+e8P19s4HtaISZt?=
 =?iso-8859-1?Q?L0iztxW/NFf9nn/QBgpHD2Nles6UN5DyJADbkbRhw7xQb+GqIjQ1kyoiie?=
 =?iso-8859-1?Q?9dmWz5OXKvwr79x4HIsJ4FRCTyV82EwcG26zzWdtiJ8cNKuFzU+q7xGgg7?=
 =?iso-8859-1?Q?enm5FBTvCTjzQlNWk+iCkFhz2wM1QxKA3PfmHGGM+SJcbDoaS9DuVp1KI2?=
 =?iso-8859-1?Q?GQVuccEXhIoNRIrcflbnRYYMbe0W8p490Fs5Qd2BNz9pczuOlWx8WClk+3?=
 =?iso-8859-1?Q?01vCCuNa7uxXQZ0+lvdDzuZ9wcl5P0wyktuexXMlNDfFk6NYhLHdOWf/bM?=
 =?iso-8859-1?Q?GYoCY90nBfq6nNjU7qFM5IYC1dEOVOgzjXNoV4pLPgba+fAxLSXEjk+Oba?=
 =?iso-8859-1?Q?b0FT3m15wMckK8fpOBDXnFmesPfv1Ty86F+xWQG4QiM6quFliIpIE8Fxtx?=
 =?iso-8859-1?Q?PdnyGRnXbJSmNL5WifP5zWZXyLEKdua+VPOH1mQ32e+S3Ke1Q6yQuOaPwv?=
 =?iso-8859-1?Q?vb0hlqbeLddpyFsZEnVC/OL9Of22vNoSNzr6JIN1ZiRaDaKNdOrnAOkf6m?=
 =?iso-8859-1?Q?6ShvB274XoikLuZX3jbSCbeBtDZCT+eHPGjIBc9xBqoYtT1pWI9NQ3pEny?=
 =?iso-8859-1?Q?DgExDeVsUOrojtG7UW0lZY3RA9GEtC/JLwY82t5ZS5nNh1gT1FLWUxULQ8?=
 =?iso-8859-1?Q?N8p7oJ0mVmZmdKgwln5bX9pTEjnChrkw8aXemWhDWXAyA5NEzWYxj4Cxqm?=
 =?iso-8859-1?Q?ILfZKJa5hXBdiTlqIXsv/gDIQGQKPSXw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9fOErsdWvpQuVmyNlG9iSuO8AHvm/HThrxsvt/l386nBsqpLFLZ61sVxp8?=
 =?iso-8859-1?Q?+NOCR+Nmz9/Et9/n4koGHvpJ4KWziy+1Nawku3VREPcwWKml0vyTGLdTyO?=
 =?iso-8859-1?Q?5UpebxdGv5/u6kPcHjKH8j9R8bnunKKw+XW43mLujQ92BMWtLbraq5ufv7?=
 =?iso-8859-1?Q?3g0EzPBs41jigc3tWQjhgQJUJCcNBGsnRV/4OPfIC3JcHCwp8vLaBjag6A?=
 =?iso-8859-1?Q?LheCXb+ieqLuPQP40ZnsndLMQBd49ok6fTvZxxgNV0bpRH3OJbg2ejEH4f?=
 =?iso-8859-1?Q?jD6TpC8NssMO+YR018wom5qVl3LMG48N8eZ0WQ6/HLNQl2nOzbvdUfLj6o?=
 =?iso-8859-1?Q?n9Qk9/AdYl0xi9ADDrjz6VWr/pOVAeWwCu6mIRylgJj6zJsVAdISKDIKHM?=
 =?iso-8859-1?Q?Ns04CPs8p8+ynTgvJdxeDZXhxEJ/2eCGe6nsu5esi+XQMsAzfVlfnIyhZO?=
 =?iso-8859-1?Q?JjaSSm1QphFafMtCSD7xyOwCELhKfuObVAqnrn3s8z5tPEmwRsvZFjhHTm?=
 =?iso-8859-1?Q?qzFYWhhTD+KW+CBTgboob3W1Gvd8KMhDuS9Uu1J2991TTumujkhYyJvgC5?=
 =?iso-8859-1?Q?I24kLRfauy8zwrkG9fosximjrLPHz5TSpMGgI7pOXQNYzb7Aqx38ygsfvw?=
 =?iso-8859-1?Q?UI0BjWkKrzzdN26Bi6uyYR2MD2w1e6Pqd/8qnA069P0AA/74A6UwFSuRpk?=
 =?iso-8859-1?Q?vfu5BmiPMxSsnbG1PRCRLktU4r2Zd1n8UUhXjCC7T8zc6s0+QgR/mM3Cwo?=
 =?iso-8859-1?Q?7fWkB8BUHPIEaXRcECgV1VxdrssZ725cp1acm6rWX+4cylXfQ1jS6RDCTj?=
 =?iso-8859-1?Q?jS1pHFk8R9vkVkmZ64wyzfDmmLnVY5ygu1I3/PZzmE/C1i8Qz17VVC+DlP?=
 =?iso-8859-1?Q?doWi7SiQosusQS2+4yHN7HJSOB1Jm3EaQhltHvih2nmnAoJ3ycmoIZMAQZ?=
 =?iso-8859-1?Q?vrx8sSlDQ/fH2ZPemltEXn8J0j0tK7aIrQeRM89goUrD/7D3tyAi2BRSuM?=
 =?iso-8859-1?Q?hm+ePjnS0wS4KC/cymHtdNnY26EFXgdIJl9jInGzrdN6x0gyGhGe+j0ZFR?=
 =?iso-8859-1?Q?Ou/GDC9BQb1i3vPg+bEkOgX/jWx+gO33OcSXlRCxXM6xClW0wFoUIQ43JO?=
 =?iso-8859-1?Q?NpUif8U+urSeratcf61y+JJmEXIciIRgcf5Iyp7OHNESWDLLrDb0G1FEvP?=
 =?iso-8859-1?Q?ZDECg6IU6Phpd0LQ9rIC/+aQdjARX6SUe9B/DsSvrYXIIJbP4g93YXNA0J?=
 =?iso-8859-1?Q?cTdMUWbLpwU/YdL1gUCOWpyX2jnPrZgYRGviQOCBaRLY/zmgUFJnTy5BIy?=
 =?iso-8859-1?Q?FfASdYbBbVOVHhgO9+cbW+JHQv+y5R21k0fH0moc3HGBMjJRd7Zx/MC4em?=
 =?iso-8859-1?Q?HeM5fKn09LkQ2pLA9RNW5GAvaJwQGP/ur5jiTaEIdLU6XC1exGXvBwxkfh?=
 =?iso-8859-1?Q?tW4XJJbSowIDJ6WeKmQnbkDnewP1BagfuC6R3YhDeT1V2ild8XGeo9LoLs?=
 =?iso-8859-1?Q?cuHDFth+XMiFYQwC8MYRSndOK+69yK+4JUqjcrh7R0/4RJwM3sTujhSD1f?=
 =?iso-8859-1?Q?SOfjATuOQBDtLu431bRBxLm9glvfb/GXMbhH8BicocsregUU+/PfTvREot?=
 =?iso-8859-1?Q?WmACTeFGRdyTgsx7tyb2oZPeMBHRwlGrsYRbxYhtSQrEi+7DU4lh5FoA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373c06ab-0175-4120-7991-08dcacc6d0d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:28:28.8107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKjqFawbctWYDOR1MFl8+nlgs4ImTAmKc1mYJQHuRj4Y6pZHn3qOWcqp23g8wCb35ngXxwqL5lSmwiMFFN/Xkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

On Thu, Jul 25, 2024 at 05:48:34PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 25.07.2024 17:05, Nirmoy Das wrote:
> > Introduces a set of APIs for tracking and managing events.
> > This currently only supports counters.
> > 
> > This can be conditionally enabled with the CONFIG_DRM_XE_STATS
> > config option.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig.debug |  11 +++
> >  drivers/gpu/drm/xe/Makefile      |   1 +
> >  drivers/gpu/drm/xe/xe_stats.c    | 145 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_stats.h    |  66 ++++++++++++++
> >  4 files changed, 223 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_stats.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_stats.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > index bc177368af6c..4db6d707c1af 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
> >  
> >  	 Recomended for driver developers only.
> >  	 If in doubt, say "N".
> > +
> > +config DRM_XE_STATS
> > +	bool "Enable XE statistics"
> > +	default n
> > +	help
> > +	  Choose this option to enable support for collecting and
> > +	  displaying XE statistics as debugfs.
> > +
> > +	  Recommended for driver developers only.
> > +
> > +	  If in doubt, say "N".
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1ff9602a52f6..c5d9ec22c6bf 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
> >  	xe_wopcm.o
> >  
> >  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> > +xe-$(CONFIG_DRM_XE_STATS) += xe_stats.o
> >  
> >  # graphics hardware monitoring (HWMON) support
> >  xe-$(CONFIG_HWMON) += xe_hwmon.o
> > diff --git a/drivers/gpu/drm/xe/xe_stats.c b/drivers/gpu/drm/xe/xe_stats.c
> > new file mode 100644
> > index 000000000000..1b8910900fd3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_stats.c
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/debugfs.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/slab.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "xe_stats.h"
> > +
> > +#ifdef CONFIG_DRM_XE_STATS
> > +static struct xe_stats_entry *find_stats_entry(struct xe_stats *stats, const char *name)
> > +{
> > +	struct xe_stats_entry *stats_entry;
> > +
> > +	list_for_each_entry(stats_entry, &stats->entries, list) {
> > +		if (strcmp(stats_entry->name, name) == 0)
> > +			return stats_entry;
> 
> hmm, this seems to be very costly and likely will not scale well once we
> would like to add more counters
> 

Agree this won't scale well. See my suggestion a reply to Nirmoy. Let me
know what you think.

Matt 

> can't we just use CONFIG_DRM_XE_STATS to hide different stats structures
> provide nop variants of the helpers that would update them ?
> 
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static int stats_show(struct seq_file *m, void *v)
> > +{
> > +	struct xe_stats_entry *entry = m->private;
> > +
> > +	if (entry && !entry->enabled)
> > +		return 0;
> > +
> > +	switch (entry->type) {
> > +	case XE_STATS_TYPE_COUNTER:
> > +		seq_printf(m, "%s: Counter value: %llu\n", entry->name,
> > +			   atomic64_read(&entry->data.counter.value));
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int stats_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, stats_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations stats_fops = {
> > +	.owner   = THIS_MODULE,
> > +	.open    = stats_open,
> > +	.read    = seq_read,
> > +	.release = single_release,
> > +};
> > +
> > +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent)
> > +{
> > +	struct xe_stats *stats;
> > +
> > +	stats = drmm_kzalloc(drm, sizeof(*stats), GFP_KERNEL);
> > +	if (!stats) {
> > +		drm_err(drm, "Failed to allocate memory for xe_stats\n");
> > +		return NULL;
> > +	}
> > +
> > +	stats->drm = drm;
> > +	INIT_LIST_HEAD(&stats->entries);
> > +
> > +	stats->debugfs_entry = debugfs_create_dir("stats", parent);
> > +	if (!stats->debugfs_entry) {
> > +		drm_err(drm, "Failed to create stats debugfs directory\n");
> > +		return NULL;
> > +	}
> > +
> > +	return stats;
> > +}
> > +
> > +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type)
> > +{
> > +	struct xe_stats_entry *entry;
> > +	struct dentry *debugfs_entry;
> > +
> > +	if (!stats || !name)
> > +		return;
> > +
> > +	entry = drmm_kzalloc(stats->drm, sizeof(*entry), GFP_KERNEL);
> > +	if (!entry)
> > +		return;
> > +
> > +	entry->name = drmm_kstrdup(stats->drm, name, GFP_KERNEL);
> > +	if (!entry->name)
> > +		return;
> > +
> > +	entry->type = type;
> > +	entry->enabled = true;
> > +
> > +	switch (type) {
> > +	case XE_STATS_TYPE_COUNTER:
> > +		atomic64_set(&entry->data.counter.value, 0);
> > +		break;
> > +	default:
> > +		return;
> > +	}
> > +
> > +	list_add(&entry->list, &stats->entries);
> > +
> > +	debugfs_entry = debugfs_create_file(name, 0444, stats->debugfs_entry, entry, &stats_fops);
> > +	if (!debugfs_entry) {
> > +		drm_err(stats->drm, "Failed to create stats debugfs file for %s\n", name);
> > +		list_del(&entry->list);
> > +		return;
> > +	}
> > +
> > +	entry->dentry = debugfs_entry;
> > +}
> > +
> > +void xe_stats_increment_counter(struct xe_stats *stats, const char *name)
> > +{
> > +	struct xe_stats_entry *entry;
> > +
> > +	if (!stats || !name)
> > +		return;
> > +
> > +	entry = find_stats_entry(stats, name);
> > +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> > +		atomic64_inc(&entry->data.counter.value);
> > +}
> > +
> > +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name)
> > +{
> > +	struct xe_stats_entry *entry;
> > +
> > +	if (!stats || !name)
> > +		return;
> > +
> > +	entry = find_stats_entry(stats, name);
> > +	if (entry && entry->type == XE_STATS_TYPE_COUNTER && entry->enabled)
> > +		atomic64_dec(&entry->data.counter.value);
> > +}
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_stats.h b/drivers/gpu/drm/xe/xe_stats.h
> > new file mode 100644
> > index 000000000000..dba79ae28714
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_stats.h
> > @@ -0,0 +1,66 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +#ifndef _XE_STATS_H_
> > +#define _XE_STATS_H_
> > +
> > +#include <linux/atomic.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/list.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +
> > +#include <drm/drm_print.h>
> > +
> > +struct drm_device;
> > +
> > +enum xe_stats_type {
> > +	XE_STATS_TYPE_COUNTER,
> > +};
> > +
> > +#ifdef CONFIG_DRM_XE_STATS
> > +struct xe_stats_entry {
> > +	const char *name;
> > +	enum xe_stats_type type;
> > +	bool enabled;
> > +	union {
> > +		struct {
> > +			atomic64_t value;
> > +		} counter;
> > +	} data;
> > +	struct list_head list;
> > +	struct dentry *dentry;
> > +};
> > +
> > +struct xe_stats {
> > +	struct dentry *debugfs_entry;
> > +	struct list_head entries;
> > +	struct drm_device *drm;
> > +};
> > +
> > +struct xe_stats *xe_stats_init(struct drm_device *drm, struct dentry *parent);
> > +void xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type);
> > +void xe_stats_increment_counter(struct xe_stats *c, const char *name);
> > +void xe_stats_decrement_counter(struct xe_stats *stats, const char *name);
> > +
> > +#else /* CONFIG_DRM_XE_STATS not defined */
> > +struct xe_stats;
> > +
> > +static inline struct xe_stats *
> > +xe_stats_init(struct drm_device *drm, struct dentry *parent)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline void
> > +xe_stats_add_entry(struct xe_stats *stats, const char *name, enum xe_stats_type type) { }
> > +static inline void
> > +xe_stats_increment_counter(struct xe_stats *stats, const char *name) { }
> > +static inline void
> > +xe_stats_decrement_counter(struct xe_stats *stats, const char *name) { }
> > +
> > +#endif /* CONFIG_DRM_XE_STATS */
> > +
> > +#endif /* _XE_STATS_H_ */
> > +
