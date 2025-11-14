Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4AACEACD6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8E10EB28;
	Fri, 14 Nov 2025 21:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCwEf+ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26AB10EB28
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763157334; x=1794693334;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Usg6HyzdwY58XQcC1eqz+zSUJprvPPjskbtAQ3zqgSU=;
 b=QCwEf+ffjSHvS535YXBerUdwJfnQjMe0tLJgwZSY+FVRdgYbXi/l8f9T
 3AvNejJLFztNF8hkEPDqiCVIL3WRwxZAQhT04n6ClRv2U/w593l9E0f7q
 C+/WFfjq4d0T04Tn7vF7FUEhFMvWTnNO6Q1XDkAg11OtGAUPthYFeDzdf
 3nrpEq4YyOgRgFrUwrt1hZVpYbk5QgWw4pYec9AxqdebASxTYPkNd+uVH
 1HXpFQ8Wi2ByxDdWQpWJEC9CVeGQtruAFsmsU+ITd8/+BDPiUzutcl3/5
 hmpBp9In3eyw0mgPiK5Y6lakHg3htuuY96Yr2iI/1FGXClNMdnxev6fv7 Q==;
X-CSE-ConnectionGUID: s512xYv8QMCFcVV7jL7jTw==
X-CSE-MsgGUID: uC1dMt2RTQmvid5VLktBLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76602571"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="76602571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:55:34 -0800
X-CSE-ConnectionGUID: E3wGc/PLRcesvGfgwUfffA==
X-CSE-MsgGUID: 9qNNFEGPRieBkJfIvxehjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="220760243"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:55:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:55:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 13:55:33 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:55:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faTSo+jDg8W/HFZBhqWwrNmi/9xsak0ByqHFlOfdB/GUUo+wO0oHo9fgEtWa5sqtPb2yyDS+BChVxuBhpv9Bway2VNiDNCp4UqQo48QMWgEXskEmFDVod6tKRB0HyIH7Q6eyDNITs7sNLByrQTlDNi6tDMOAi/zXeTanbdChLYPz+IVQau61wgITBHahdWWXuyYT+StwPcwCahPQpggNTPnxfIvLQvza2pAEozH9rcUQy+4GInRN/UFebYdUhC9PDGDW6fPDih3XMCvBzDTTEu1lKK03okNe6Zt6w/CP7iDeqTzwJRh2Exz7V7WHHrE4XyMIFG0FDdYaw3H0GIt+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLvzNABBQFNfoV8fLPygph/oNXLS7FmgohHLCmGsLQ0=;
 b=Y5Ms3ok1ZEkJ4C6mVLVaG8SLx2FbTcf7qZOp70QQWxHMcDHYFdCmQvTIg9Bdg8ELmKYrzeT14CNC9y28ShH4FI7ER36NyIKoy+x1dg/Zz4qQH5WczS9DcPQXyfK/WqwJSo62hNNXW06xm+wgDhJ+QokuuXEAwcdrpFHLY/xjurRMLMYE9DLS3G+yimD9DyLHBXbsY1ekmAEZWDfxmXGuQSH0ayKoVtt3ey/mmaQzbOmf2qEayBFzAgiwXeJkHq1RL+38PGA++d1V22wEaqqU3PqMIuFm5anEzbJnseh7lSUaL9T1qBtA4gavs0bODrvh/P96uHSlKkGwh2CNLMuq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 21:55:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:55:30 +0000
Date: Fri, 14 Nov 2025 13:55:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Move rebar to its own file
Message-ID: <20251114215528.GS3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
 <20251031-xe-pci-rebar-2-part-2-v1-1-c4a794a39041@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-xe-pci-rebar-2-part-2-v1-1-c4a794a39041@intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: dc35ced7-a6d1-4cc4-5ae1-08de23c8878d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PtFE414wuRq2xcL3dnB8wSrLr9kL1uG3qsQep2eeiFAgpxBybfA0iFSUdZ?=
 =?iso-8859-1?Q?y6nyYcffEfPXz8asmHrMwmAkUXyh3Jkv9I1eWVQuRxGchXjjqYcHdAvdOq?=
 =?iso-8859-1?Q?Ym5FITDjbFbQ2CsqEqlAJyUwNrBgja1sbK2lcG1Hp0MvDfUIVzNDxFNPV6?=
 =?iso-8859-1?Q?dJFTiihUPrrvhGAJJud4wikPJ22RGlSw2WsooZdqKpdJITZb0GEeR331Nz?=
 =?iso-8859-1?Q?EsnmB3qHypMqhv+0BfsiHnrm4aLgqqBm24AwkHRacsIPMXpr5OmfrNdU+q?=
 =?iso-8859-1?Q?P597nYZmlS/FFSTrnrOk7ceMjNiB5Uw/HLo3OSM2E+eWva10orQRb9Ks1n?=
 =?iso-8859-1?Q?wEq/F3OL9jkIfxEPD0fYREZXcJ1em5xutWiCFfGnGAKcp+n29+/QzB/+AM?=
 =?iso-8859-1?Q?8otEC+I4FOkcjOsFqZpy2DYVSmawhQfUm/W1CurbfMiMNkf1AzlG5sLF4l?=
 =?iso-8859-1?Q?6DyciSioZlaE9rqWmCDsLVM/d5U2A2SZ+fO/4/iJ1OavP9nr4XzXmFkJeg?=
 =?iso-8859-1?Q?RGMQy6KNJvXJeybizHH1bkseqvthhYAiHNbPWBNDBH96ul5N/pTUQj22Bd?=
 =?iso-8859-1?Q?S/jesrdwoy8qnwXZN3h0x6LFYQIsrKnjnoS1xIcrFBxaNba0T9WlxZuCKM?=
 =?iso-8859-1?Q?JS1LHq4pC9PZbaj5K4Tq4Ip336u6VFoQDkCr+hpdPzhnFgBcHlyT8+wlDO?=
 =?iso-8859-1?Q?9SgXTjOn2F+hlR3uLJzDiahG4aU8rFjRPaZYx3jZ1OsEFdin7Ymkclx7eH?=
 =?iso-8859-1?Q?jXSt0MuGt4FB49fekHquHHvZklrLdrcLE6X3owYQcrg3bhpTEQAB+4yKKp?=
 =?iso-8859-1?Q?fz/iAEu1x5qU9XeepjYYnmCU3h/JnpEnhwg2H1cKHDI8jreQFc1QJU+AI6?=
 =?iso-8859-1?Q?NuKoPw490KSoV0BPfsYKux3olGDlqrjvSEeFGu/FFyUDEd1C3rLhdP0qCE?=
 =?iso-8859-1?Q?AY0nGl0CTWPE3kON1hzYZRvQnRW+CMoUAz9B9rzzTk1lRrwV1+gilZiIqD?=
 =?iso-8859-1?Q?aHl5MFm+jOnafok3B04c4TYHBQ2y827l+OM0JBQmQ0NuXcrRAik/la1Cgn?=
 =?iso-8859-1?Q?E9Uk6cosIgfce8mvs39lQDsl1+BbKDZC6XKZPtNx8y6nw5n8mEFql2iIsr?=
 =?iso-8859-1?Q?C4+etA13RLOKRQjusI02gROX2qtRp3og+VNBV4J74Nt80iV1EeAl2UFSWI?=
 =?iso-8859-1?Q?/qMsiozB0V4l98gRhxJEHryh2EBnsQ4mprlsOwBbZhB64+9XYgM92nkDqA?=
 =?iso-8859-1?Q?yFWgKBuRkNV9MB4TdUcsmFVcPXn2bLv1dW8+ujNjw8XWfhIT5PjMcIijDm?=
 =?iso-8859-1?Q?tPWQEMDyxoYcErKZV8kfW0rCyGxkVhbV7QEVXglLXd3b1YbOccGtLXV6an?=
 =?iso-8859-1?Q?AC4aGvh9FvonrJeoqTEK1LcncuVqnpoy7ekIQ+CKmKBlRRqHLH0lI6bH0G?=
 =?iso-8859-1?Q?kTXg0fKtvGmsOdKJIl81nCBC1tGTo40dxoSf5GDuIeZdtdHOZon69ljSTH?=
 =?iso-8859-1?Q?W90TXAWxGpL/l1AoDJJIcl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5UNC8b9A9SforujAxS887A4PuiBtjWUbAeIhfqtVdHB1uJDIql8ll5S4nk?=
 =?iso-8859-1?Q?A1nvrj1EsMxXClokCbkz+FQFzjTrMbeEEkMgWmNKtrDcFVC7+XWsHtQCXb?=
 =?iso-8859-1?Q?eo03SLvevl29SFtU09qb3YaJ11zKz26I1/hIZt5c1lGujrFQAuLGPg5P2o?=
 =?iso-8859-1?Q?7K6q5Vhluzl+9MvPFQNO9q+HLOw8LX6qcSlrAtS41wZpDvopRr7nvVX2xz?=
 =?iso-8859-1?Q?arv/BNSyPY3Yd9wbbAmj/aCw8qoKZf495FSIoQlkKHJvXuQqh2Phh68gng?=
 =?iso-8859-1?Q?vnAMYS3B73KQngWKI8AWrHCmHaS/dnyRCtf90lAujfnyo/1qB+nG7don9Q?=
 =?iso-8859-1?Q?cUFhHMT6YQs2z/QZAxiCULY1+fnvAJJP/4NJOTmT60kE12xAc/eu5y8NbJ?=
 =?iso-8859-1?Q?ShnYaO+CgE9zXSsRFfgTHkfZq9iQXUUGu2aEhXI906/3PxZ+HsZKhfGZuX?=
 =?iso-8859-1?Q?JZZPB3nexHMqzrr/uCM6OZiyOuCb+dvUI8qsYLYXQ4DxREKzPPn8XiD1sD?=
 =?iso-8859-1?Q?J4cpfjxw/99IqotajJ/tgLiMCV/npcFBk6HT9UTwZKOq1k4/aLa9+V6HKh?=
 =?iso-8859-1?Q?sJSaiETs7HcRUXdx+byT+Vc2jZ9SBRpVETgq8i8GVcnF3IkZ1WmnWde8AL?=
 =?iso-8859-1?Q?i6GcUPEuBNpQlcj0lz3MyEDxTYU42Rdwo5RTknrHo5fsqyiV+bxnhZJNTN?=
 =?iso-8859-1?Q?r1JA/luvwvO+VGAvSZRYWdyTHbq6yq2EErDx0DqhEzcMq8PgQS8oDXqgkF?=
 =?iso-8859-1?Q?+gmwUh5VfxL97OYJtTAeeOS3jSQedN3Ypw1kU14SpDGq4v6zhmZDYvxYrE?=
 =?iso-8859-1?Q?ha/TFtvMFibJYQ9RBQz/VDlWD4QbGq+uWnNy+pUjAZL+mBaiDMLCmgxrW9?=
 =?iso-8859-1?Q?sITi71SBYCSoIvDptradIALlEt+UTC5ZK1rmfOlb8toETQZUULxkC9ev3I?=
 =?iso-8859-1?Q?UEiGoPH8AqOm60dos0S74vysdtRcnwGRaYwy3J/1Uy+O2aBLC6JSVlI1EB?=
 =?iso-8859-1?Q?3eVZli3CxgraoSdnV0a/7bnToj3XBnO/bicLyTy9Io7oX/VMhAIVSrCU51?=
 =?iso-8859-1?Q?53yhSxUG+nTT6ydfyP+ZdSqhptZh6+Mx8+07VbH/y7JHDco+wsrrZeAx3F?=
 =?iso-8859-1?Q?w5zPvJpijrk9975KSV1JV5jYqWClRkhxUiP5+sk7eQ07SbPVOoKBmngo5w?=
 =?iso-8859-1?Q?zNcUXAZisFx/MKcqPfbO1Qk3TeMyou4fdP/Je9+LVYuXF+pMMKZFpSVBZS?=
 =?iso-8859-1?Q?AI//z6GqLg0oIKVvYwV++QwT1AqbHtX3uVp0WENpEVgCQRiYG9/gdk8XPg?=
 =?iso-8859-1?Q?MYW83+zZoOHCm20pX5792BbfMtlECFq4JuIImuxx2sYNzgWPDRqlnd/V6j?=
 =?iso-8859-1?Q?Cj4QDaaIHwDYrBp6vE+m6+/SXNXegkACJi0tGxFAGz3b6Duc4muVZ17wdg?=
 =?iso-8859-1?Q?ObjgqqeSgCmCRsfsKfMFNRWDBQ8j5wvE6rlo4SCJ+JkMP5ApAyuibDpvcG?=
 =?iso-8859-1?Q?DI7myawqLrYQozklt8ZgLP6xSkBl1EObC1FR0Gutygev/aQ4CCOJOKiWKc?=
 =?iso-8859-1?Q?B2Li1zuxWK+5bgdaAV8EoB81v+E7aw9+kHUOL/oVuk/lNdLUrtWQRXt+q9?=
 =?iso-8859-1?Q?H2vNrHkvOe3xV0wJvSSAnzZEKY6cXU6vHyJtrtgUKHj4iW0nRXKyD1XA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc35ced7-a6d1-4cc4-5ae1-08de23c8878d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 21:55:30.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOGFNzzkEXX/aTRpqHTw3qAZjYAeALAHVqEMDJcG/9G44YVjmJg4aCxUgzNlXQo0l9hKBxCeXaEanzpletNfP4pL5gADmACLseB9eqSA2xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

On Fri, Oct 31, 2025 at 02:17:42PM -0700, Lucas De Marchi wrote:
> Now that xe_pci.c calls the rebar directly, it doesn't make sense to
> keep it in xe_vram.c since it's closer to the PCI initialization than to
> the VRAM. Move it to its own file.
> 
> While at it, add a better comment to document the possible values for
> the vram_bar_size module parameter.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       |   1 +
>  drivers/gpu/drm/xe/xe_pci.c       |   3 +-
>  drivers/gpu/drm/xe/xe_pci_rebar.c | 138 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
>  drivers/gpu/drm/xe/xe_vram.c      | 121 ---------------------------------
>  drivers/gpu/drm/xe/xe_vram.h      |   1 -
>  6 files changed, 154 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index d36f4101c8e0f..98603ca39438f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -96,6 +96,7 @@ xe-y += xe_bb.o \
>  	xe_observation.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index aeae675c912b7..5f304ea2477a0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -27,6 +27,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pci_rebar.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
> @@ -997,7 +998,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	xe_vram_resize_bar(xe);
> +	xe_pci_rebar(xe);
>  
>  	err = xe_device_probe_early(xe);
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
> new file mode 100644
> index 0000000000000..d21e29c95ca33
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_bars.h"
> +#include "xe_device_types.h"
> +#include "xe_module.h"
> +#include "xe_pci_rebar.h"
> +
> +#define BAR_SIZE_SHIFT 20
> +
> +/*
> + * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
> + * assigned IORESOURCE_MEM_64 BARs
> + */
> +static void release_bars(struct pci_dev *pdev)
> +{
> +	struct resource *res;
> +	int i;
> +
> +	pci_dev_for_each_resource(pdev, res, i) {
> +		/* Resource already un-assigned, do not reset it */
> +		if (!res->parent)
> +			continue;
> +
> +		/* No need to release unrelated BARs */
> +		if (!(res->flags & IORESOURCE_MEM_64))
> +			continue;
> +
> +		pci_release_resource(pdev, i);
> +	}
> +}
> +
> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int bar_size = pci_rebar_bytes_to_size(size);
> +	int ret;
> +
> +	release_bars(pdev);
> +
> +	ret = pci_resize_resource(pdev, resno, bar_size);
> +	if (ret) {
> +		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> +			 resno, 1 << bar_size, ERR_PTR(ret));
> +		return;
> +	}
> +
> +	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> +}
> +
> +/*
> + * xe_pci_rebar - Resize the LMEMBAR
> + * @xe: xe device instance
> + *
> + * If vram_bar_size module param is set, attempt to set to the requested size
> + * else set to maximum possible size.
> + */
> +void xe_pci_rebar(struct xe_device *xe)

The name of this function bothers me a little bit since it's all prefix
(xe_pci_rebar to match the file name) and no verb.  Should it be
something like xe_pci_rebar_resize() instead?

Up to you; either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +{
> +	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_bus *root = pdev->bus;
> +	resource_size_t current_size;
> +	resource_size_t rebar_size;
> +	struct resource *root_res;
> +	u32 bar_size_mask;
> +	u32 pci_cmd;
> +	int i;
> +
> +	/* gather some relevant info */
> +	current_size = pci_resource_len(pdev, LMEM_BAR);
> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> +
> +	if (!bar_size_mask)
> +		return;
> +
> +	if (force_vram_bar_size < 0)
> +		return;
> +
> +	/* set to a specific size? */
> +	if (force_vram_bar_size) {
> +		u32 bar_size_bit;
> +
> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> +
> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> +
> +		if (!bar_size_bit) {
> +			drm_info(&xe->drm,
> +				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> +				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> +			return;
> +		}
> +
> +		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> +
> +		if (rebar_size == current_size)
> +			return;
> +	} else {
> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> +
> +		/* only resize if larger than current */
> +		if (rebar_size <= current_size)
> +			return;
> +	}
> +
> +	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> +		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> +
> +	while (root->parent)
> +		root = root->parent;
> +
> +	pci_bus_for_each_resource(root, root_res, i) {
> +		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> +		    (u64)root_res->start > 0x100000000ul)
> +			break;
> +	}
> +
> +	if (!root_res) {
> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> +		return;
> +	}
> +
> +	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> +
> +	resize_bar(xe, LMEM_BAR, rebar_size);
> +
> +	pci_assign_unassigned_bus_resources(pdev->bus);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
> new file mode 100644
> index 0000000000000..c87aa58aee718
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_REBAR_H_
> +#define _XE_PCI_REBAR_H_
> +
> +struct xe_device;
> +
> +void xe_pci_rebar(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index b62a96f8ef9eb..52f107eb1a80d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -25,127 +25,6 @@
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
>  
> -#define BAR_SIZE_SHIFT 20
> -
> -/*
> - * Release all the BARs that could influence/block LMEMBAR resizing, i.e.
> - * assigned IORESOURCE_MEM_64 BARs
> - */
> -static void release_bars(struct pci_dev *pdev)
> -{
> -	struct resource *res;
> -	int i;
> -
> -	pci_dev_for_each_resource(pdev, res, i) {
> -		/* Resource already un-assigned, do not reset it */
> -		if (!res->parent)
> -			continue;
> -
> -		/* No need to release unrelated BARs */
> -		if (!(res->flags & IORESOURCE_MEM_64))
> -			continue;
> -
> -		pci_release_resource(pdev, i);
> -	}
> -}
> -
> -static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int bar_size = pci_rebar_bytes_to_size(size);
> -	int ret;
> -
> -	release_bars(pdev);
> -
> -	ret = pci_resize_resource(pdev, resno, bar_size);
> -	if (ret) {
> -		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> -			 resno, 1 << bar_size, ERR_PTR(ret));
> -		return;
> -	}
> -
> -	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> -}
> -
> -/*
> - * if force_vram_bar_size is set, attempt to set to the requested size
> - * else set to maximum possible size
> - */
> -void xe_vram_resize_bar(struct xe_device *xe)
> -{
> -	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct pci_bus *root = pdev->bus;
> -	resource_size_t current_size;
> -	resource_size_t rebar_size;
> -	struct resource *root_res;
> -	u32 bar_size_mask;
> -	u32 pci_cmd;
> -	int i;
> -
> -	/* gather some relevant info */
> -	current_size = pci_resource_len(pdev, LMEM_BAR);
> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> -
> -	if (!bar_size_mask)
> -		return;
> -
> -	if (force_vram_bar_size < 0)
> -		return;
> -
> -	/* set to a specific size? */
> -	if (force_vram_bar_size) {
> -		u32 bar_size_bit;
> -
> -		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> -
> -		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> -
> -		if (!bar_size_bit) {
> -			drm_info(&xe->drm,
> -				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> -			return;
> -		}
> -
> -		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> -
> -		if (rebar_size == current_size)
> -			return;
> -	} else {
> -		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> -
> -		/* only resize if larger than current */
> -		if (rebar_size <= current_size)
> -			return;
> -	}
> -
> -	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> -		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> -
> -	while (root->parent)
> -		root = root->parent;
> -
> -	pci_bus_for_each_resource(root, root_res, i) {
> -		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> -		    (u64)root_res->start > 0x100000000ul)
> -			break;
> -	}
> -
> -	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> -		return;
> -	}
> -
> -	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> -
> -	resize_bar(xe, LMEM_BAR, rebar_size);
> -
> -	pci_assign_unassigned_bus_resources(pdev->bus);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> -}
> -
>  static bool resource_is_valid(struct pci_dev *pdev, int bar)
>  {
>  	if (!pci_resource_flags(pdev, bar))
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index 13505cfb184dc..72860f714fc66 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -11,7 +11,6 @@
>  struct xe_device;
>  struct xe_vram_region;
>  
> -void xe_vram_resize_bar(struct xe_device *xe);
>  int xe_vram_probe(struct xe_device *xe);
>  
>  struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
