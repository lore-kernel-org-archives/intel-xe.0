Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F462C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 16:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059910F1F9;
	Thu,  1 Feb 2024 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLC03M7H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DF810F1FA
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706805242; x=1738341242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8X2JDoeaOjQfbP0KEB+1CvHC8ZYt64Y+0ee3sgGmilM=;
 b=GLC03M7HX+TGDMf3O43L48QRcnjKbAGNh1mll4NfjIUsW67BEgCRYeFd
 n1q4t77UyEfOuEbxbgbQJlI64qDPM2lblIJ2MFs4zQeXwZ7yAUPnRk761
 R7t6XJlEO76dp+MiD9AUDZhMIEqrv93Sk9J4gLsK9I9HnXndzQ00SdqPU
 iXt1ZCYeFZuRfQnF1rV3GhIZdPqujpinIJWkP2OD731ICEfZeuM1VPez/
 KqP1W5N83C0MBEAyNwTHRPQd1KM6/v8AHXa5U4nbMxU5N179VWnkAM5ue
 SIbGvOgUrNqxWxIBips0srNJz5DM5SXT7yVpUsHKHbYYetZONEDUy9zXf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10686349"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10686349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 08:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738476828"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="738476828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 08:33:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 08:33:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 08:33:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 08:33:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 08:33:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjqSkecukc5pokUKFNpR8eAWOorZONjpoAVDuHcGYxXnkUatdCcflldF1ThcqSfhdAqaw8DbsOvEaFzHvkbdUJ2yoxZOb53yyMfr/E9MJzuq/DsxQVozVmdXIPmv7uRPykQ8WbYiTI2LYTdJPFQv4pmZlvkrSAmprErk9SRWd55WEqZPuK5CZIHiKdceJRBa02Ga/NljKTB56734mg0cG3dZ/v4dImgeeeIkcdGcx32fGeNw36nOH/TJ8tdQpHfGAEw1p98zSB1F6Wswx2Yk+k02p/DQ0qW3n6yuQpG829bk+gPitBrH4S9TRT7B1/qnZKj4ynS8Hbq6BdtiR7762g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVKAKIXA71DAQlarHoPOzrM1b0aGKcPC1/02J5KkjLM=;
 b=SqZfx2Pbsmx4ahPd097bzueaQQSvwU57UHC+KctvDwwgtBNzr2g+MGNe+28xDvNtTPgRifkH6ZsgE6IZ9L24fr9Tk3OTXhg/Qxzv5Kz4YA3jyQfDnVFTN5y4b7cs1nj2wckOyO6Y3VCzFzXH64xI6M7uiLUaqd/GDCIc7YYKD1m96lyKgEoef2OllEHV3xvLNKvD3zi0QdD41nc6Rv4xFYUwInkN1F+T+EW43JrQDHc6fCW8F9UauAQv2T7YLTPhaQ+wC7TACBZ+M0Ubf/4K1qfuNMYNGOuJKr6uuTFQb9rUeCF+huvVgpoDAwiaImzyT8BRCd+BkKNjPHu/dwDETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7908.namprd11.prod.outlook.com (2603:10b6:8:ea::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.30; Thu, 1 Feb 2024 16:33:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 16:33:47 +0000
Date: Thu, 1 Feb 2024 10:33:43 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/Kconfig: Select FB_CORE with FB_IOMEM_HELPERS
Message-ID: <p7cwd77cnvwkdj76ijcz6i762yhg2ibie2dh2ez7rjll6maehv@cjpxjvya5dva>
References: <20240201074754.3336-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201074754.3336-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 926f5051-93d3-4086-9319-08dc23439039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvgr0hhwHhiHz9KxMg6kV9OP1PgHeu2pmHGu6oPjKL1V1TDLWVf+SatsYZzOgLDietl+0H9eLDfehIR2e1qo5Jen3reT7y3i9v4WZvZLoK5sTva3v27C6YK7MKt55/4UcHciYD81xlCahVx73YlMsQDHvvH/W1n3d7iagICoXKAhoNWy/U05fjR+Nm5sNbNOxb5pwepvzCrg0tWY9qxnZYkG3B6WVgo5449f9oSq15WE6hmczT0FCPvn+yRQPJwA8S7TuzfVdqMDZ+dMVBzq5w5BLYCVrZdndpt7/6q4Gvwx1sQvK2yvOHSHdcFFRK/aEaGe65buopi3IxCTxICoU17/gvMuW1E4fzBtekMtRdykWGE8XkCO9K1OjPf/gPAccJja3iro3QfS1+ss6z7RbNDse/kwzl/KAijoBD3cgFkoW49Di+DkQA+krahboW3ARIpyVI/gce6jvC3lqDTCGYSWEuwRuk+QQ/NdfVha/NgQ2U3Njm/JWK1OUu5c1GYXUd48cFom6ShR1sPXov6HQLU6ApCuhKorHchVpeHQQb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(5660300002)(2906002)(8676002)(4326008)(8936002)(6512007)(9686003)(6916009)(66476007)(316002)(66556008)(66946007)(6486002)(966005)(6666004)(478600001)(6506007)(26005)(66574015)(83380400001)(33716001)(82960400001)(38100700002)(41300700001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ppad1ugaqAZY42dxpwdQCm9hyED4b2sz/RkYfvVOov0pcNSpoY0hcIZcOc?=
 =?iso-8859-1?Q?EigMIPBlYOCBunw1Z3QlWxTbRESQeGYZvwYrgufY/8OUYTOaYavSkYm33q?=
 =?iso-8859-1?Q?Gk2lXeYNt32iDR6qtHpmKHdbXmNNaHFtzXQZoiuMxAiuwYKTnfHWfe5HBI?=
 =?iso-8859-1?Q?Hi1uC9xhwp2UDMTlMwi4Ga37mkRaVqv2E5AS9EyL99ATb5vHmLcqOvcuIm?=
 =?iso-8859-1?Q?nlYTpjcjsOQoxDz3C7+duFbf7yIW6XW0Fcv3jYhebXd40qtHeDpc8mwyMw?=
 =?iso-8859-1?Q?40myDSa9CKT4hqpMoydZLFE/0iIyEWcprH62kPodCOG0zS4St1hkITjQsk?=
 =?iso-8859-1?Q?x9fvvMLSA+99OPnXm/25BH0WRgK/u18ek601T9Wia/loY6slo04omNkUZS?=
 =?iso-8859-1?Q?6gCLabSr+RHGN2/nrSFLGtjLdi8NOB8rERkFuLs3BJ6r07tuVyecJVYdb3?=
 =?iso-8859-1?Q?x+Vk7+b1USsiVe/VY33/m7hYby7TWjMA0MMkjixKY8j7TlXznyS2YaVw3U?=
 =?iso-8859-1?Q?0O/QyT48y93PmbQejXCryCQ4Zn8x51ZDJh8ziVGI5J7ISQ4W6EkUoa5vkG?=
 =?iso-8859-1?Q?D7Z8CLxKHxcZQBH3O67I9HRifewDnGcVzgrEYXt98w2ndU1QtUwVSS0gdX?=
 =?iso-8859-1?Q?ZAlA3Rkd0sJjdefgqn9QETTqbKOEUShyBaSYDz4bGg28HuQ1//7y8HazU0?=
 =?iso-8859-1?Q?TiUQ7j27YT1NjwL6MSi5Vgl38ssgsTBI34d8b/azd5ZhHS8Y1BLEsMkxc5?=
 =?iso-8859-1?Q?1toj/BsdP7fib5KsKnMTzxA9HyrQMgic9FTS9062NFwLXcCrAsANpoS5Qe?=
 =?iso-8859-1?Q?4AwTd0mnyGvZeCgNPOBh+GJryPbdDn9xaVp6yGq9+MAzNixeVgsKeItjBn?=
 =?iso-8859-1?Q?fMQu7+N264EhaY+VCwugJKf5uKz4Nc2wJMVCb6SIg8lMnoNoKR6jfcmax2?=
 =?iso-8859-1?Q?QSgGWoi1LhsC4TUrUrlitcbCDHxLMWQW6oYPpyR4iHAmXW0XDoNWADoHNr?=
 =?iso-8859-1?Q?4kJYg2S0A/++5QkCftpdDBVVSPvlKunBWg8gRCFak4oJBMIuxnqhz//uYY?=
 =?iso-8859-1?Q?3xLjX516N1iKgk+mBZgWCowygCGU4KwokyMpLGAu4UIuofW3sfPpT+0SeP?=
 =?iso-8859-1?Q?6VmM/6kH9uzVftxyToCXYVv2/OgrjnSZqtpmEpGHoAmHEDnCERpkBdCC6o?=
 =?iso-8859-1?Q?ixZxCvJTFPCtS0lQ6uc3ONcP1X9LoRXPomM8N7iarah/pgyII9HpHc8MIR?=
 =?iso-8859-1?Q?o3v6VOfBFx1smYIGugNBuKDXwO+wwwUYXuV1DHHvjS6GMIMIkZq0ODmMkd?=
 =?iso-8859-1?Q?7GKUa3yHrRWzh9F6bFr/Dcwr8G8brWAzoVBaHrzGzzy6AydNCg4KocGoCn?=
 =?iso-8859-1?Q?Wbc1QLzNh9k0/PFxN1w3z/bet7iXHcFVweda8UjrKt9QW864UhqT2bNV5v?=
 =?iso-8859-1?Q?LHhUgxo7jMaerK0jptIJZ5W6TDkp+RQg1nQ10uQKXFoEPfwVc3C8MN0ib/?=
 =?iso-8859-1?Q?ZwfRs8jCeKEWb7j+qlH41mdnccI6jK8pOlsz5Ufj7t5rQp8dLOP6A8mcCX?=
 =?iso-8859-1?Q?rhmHV/Af7DCbwtEwoLgzwvpv+gT6Cr+6s3POu0nm8Gl0Ls00YfmoWSSK+p?=
 =?iso-8859-1?Q?rwxp9H3Pi3oPSN3K5ivXK6nha7yl0ZHBqejjTKMaeeIgoZj5f4ipx8LA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 926f5051-93d3-4086-9319-08dc23439039
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 16:33:47.2314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8w3CyjOLjGYCsqsnC6hzPYsADS/OS1xeAtwJJDeodkHRda6FUol6ghhPfvtedPqgZWIEGJ4XOqQaDTxv62+lSc5oNZnlzWrBlhJQOK8ZjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7908
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

On Thu, Feb 01, 2024 at 08:47:54AM +0100, Thomas Hellström wrote:
>FB_IOMEM_HELPERS depends on FB_CORE.
>
>Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

Closes: https://lore.kernel.org/intel-xe/e1797d02-d947-4b35-af55-9ff1d72125aa@infradead.org/

?

>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index e36ae1f0d885..e0bcf835e0a5 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -48,6 +48,7 @@ config DRM_XE
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
> 	depends on DRM_XE && DRM_XE=m
>+	select FB_CORE
> 	select FB_IOMEM_HELPERS

shouldn't we be doing it like these other drivers?

	drivers/gpu/drm/armada/Kconfig
	drivers/gpu/drm/gma500/Kconfig
	drivers/gpu/drm/i915/Kconfig

i.e.:

	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION

and then the corresponding changes in the source code to account for
lack thereof?

Lucas De Marchi
