Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A657C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 22:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908D10E26E;
	Wed, 19 Apr 2023 22:52:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112A10EB35
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 22:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681944757; x=1713480757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yNIO+NHQkfIFAknh2dTVDCnq0aEDDV6nJ+XyMX+Azsg=;
 b=nV2DCtaVp6qnk082GpqflfCA/ahYCfMbCeISs/OUfycgBjCxA3MGvxnW
 HRArDAGs2MzEz43wtaq+A/sT3BmIe3K7d00eyHkv6+17/3I87fWa4qofm
 V8JmesHlXGmbHlnDKNhoLRatiMLbX2xumKghu3vqHBKq6jPYXR8n3dz6Q
 bIb7jHKQFY3QNHRUrzVg6mnj/3hxorakUEfQ4SCxoQzhP9CNa/IWLy37B
 FyC0V0mpVJlJBQxdEsvXC8XAzS9ipPSamXC746dg+MqA4ejIhfU2fqnaM
 2Q6n1GxdJjxd0mYtVM/r71C8EoHhduGe3gER3G4oHtRsasQOCLzjZ6nwW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343060917"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="343060917"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="756261902"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="756261902"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2023 15:52:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 15:52:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 15:52:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 15:52:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 15:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHug/hHKQpJ2xky152+ywX1kE0aoacFuzaSdKaO64lfz0oQlWS61oRgUMQ2kxl8nzu9K+ijz/RdZSfu8IUqsAsncmek1yWA9Rnv3/LYC9K9kp/L6APzJCgF5fgiwgbYQn/1ynGYnglVDQ42jcaf7QbI5MSY81syg2Hqn42zby75OaXl4WjmT7XCAgmi1utaLztavtLEJsc6Y1XZDr/skiAI47ef3SW5yg4ne30q4Q5kUQ1zxkFK+fBjaoWKbkVwmwpvfAAAFoqyfucl/1MdHIrQocFbjwj2+TOrmRLHWw3rLfAR6YRvHIH0cGt6J8BS2Mn4ZhNuUn4zuhAA7PbJSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhmFou16guOqO8zjZJGxPgoqUGYNNI9hwh8MLEzQdo0=;
 b=bKFik0YgbIph9m2J60IuFcvtCA9LEwA4Ncb1EqmS4x3NdIbsOCygZOzEewg+/y0hbvUA7NNGHIqWhUNQa+v09djF3i7MJ8hv9DzuPoSIDtmf1R3Og9jvlE1UgI5A4sg+y+ymfD5JPu3OVC3CdUNS8KvOY5Wc0ACYf+7xvnNS3frYXPfEnN6kN1XqD7Q6QPgVPWi8DENdzQJRwd7d85iM3oPvi65hiqT0U8V/y698NKomFAS2P921hmMQNa0ipS8Xe1Io0typz5fMBXKjh8jGwhEW6kqLqSCVRqMuYNWiqhq3A1nWqpoRAjaA89+RZ42cZJyurzaWpvtOFYbnhMf8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 22:52:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 22:52:33 +0000
Date: Wed, 19 Apr 2023 15:52:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <npre6oxyeuijoibrppiqcg6mqbbko63uyyg5ywnhseyq52ueri@o7vdx4kicmhu>
X-Patchwork-Hint: comment
References: <20230419224909.4000920-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419224909.4000920-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf4991e-8742-40c1-022c-08db4128c2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLmYIaV5cW60vnhz7XaHxbtX0X5+S6HO5ge0UgJJj/DY6eICXsqXkYKY6nS6R+XlimFL8BVq9FI+OwuxAKA76wAW/2iZvDhuMdLrY3q4/50IgoEbJLdizhj++WbzDnm2OjWU8egLHI+/Hew6zji3RwKGLHpAuRDxxFavZyTrcnGrUkOteDl9Bm79eHwpaYlwtxZFZDkVrL7+dTc7ZSVBvm0Y2nD759tjxYoBqO4wsiZczYMSNAGvYJOEwgTyKjHpznWx7uhIN4dy4KdLhdZsKw5eOzp1Lgs7ZU5BlVNxO/aXtIIkH1aYEsvmuVdWBoLBDFwyTZLPTaKo5VyvWn4vcIU6TNbeM1bEBcTSulHVNRKOiP67iTPEd1wyAMvPmd/+OS7ySAPUFiiI8bVRwfHVhWhK2XkdLIOAqEKKNbI5sVtqCFOV/btfPafxjFKxNnWWrZwvgV+f7icIOVYO2jQscuNjeFtxckeHBHoodG3p87kNLkmoX6+W5Z9iwFOD1m6IgnnFQly4rqjqdYTASMzJ6hnqFYysFU0CuGbWsAJEs2JXlSI68+6LjhblgteVh9ML
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(6512007)(82960400001)(478600001)(6636002)(6486002)(2906002)(38100700002)(83380400001)(33716001)(107886003)(186003)(6506007)(9686003)(4326008)(5660300002)(316002)(26005)(66556008)(66946007)(86362001)(41300700001)(66476007)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3vuIC1wcXKbiEReMZIa1F+S1DwYTAnajIMibDgz/yJSnXTw1MOKvMLP/uzx?=
 =?us-ascii?Q?Fv+Pj659CM5kHj76Ool01PNrK+HwCDaVVxMUMcwUfK8WtfUbTy3Tz2sny+0H?=
 =?us-ascii?Q?Jsjzr+r22THZPwOOI6xBD41gImk5YPOGcOAJXyjvuf8TJi0oqvOMbJ59f7FQ?=
 =?us-ascii?Q?GyEBtYBwv6IrfnnLGU/5yyBt7mk8ODe9OhvPasbXOO7WEGNkz9qYBQJGiQNd?=
 =?us-ascii?Q?Aj0ywMPqsD/Cgon80lpn7GPRBAp0vsXNZM0oJCzjQ0Un/kn2J1KSjr2Xj8ai?=
 =?us-ascii?Q?uDU2+lhVL5sKcpwKJIzYHWbQ1i8a/l6G9ARx1CyFSN7LFSwUoo1v8GQzmfaI?=
 =?us-ascii?Q?7u7RPlP2yoralLhylaO8hfSwOykTl5ENdX7+Y7tsxSbCBMXNUTc9m/BCUrpR?=
 =?us-ascii?Q?taOiHrpthSIzuaZ9XmzXgdHkoJfAIQVgdUFc19D+WpwoAGCtu1y+UjqCIxsL?=
 =?us-ascii?Q?xRX+BvaN7/9PuzGiBlI6Wj3bAx16lNX0X24DtTI2+DZgSOYeX4QSPfTQ+y3p?=
 =?us-ascii?Q?olkHhqeGFy53dQqDxTfzPI2tdxE7yaOMyS26tHhBff3feYzDsNhx2Q3RdgYY?=
 =?us-ascii?Q?BvSg8LMS6QBWVPAngJG7A49lO5VpiKKoZdlgVgCzlWp1s0UYhsKA7FZSgfJV?=
 =?us-ascii?Q?Ef1NH2ekiTCdbdQqx9ARD5pH4VOGEMZVw6VQ7dCQIUtjk95KwNHadPjb/yAa?=
 =?us-ascii?Q?MAXsqmEtoqwWf7+zMmfbhfzndfQlui+fQZFm41/WhBwzcIXZZjxo5MyFS3/I?=
 =?us-ascii?Q?4v4v8xWx2m7HjzF38TEzhRMEh2or8UvPZKLlaeiaq/XY2FU4j167LvSvYQ5q?=
 =?us-ascii?Q?Wpmph6vX8pkQwUr7r2vsZk5lHYgi90xSGjhkF41WeZ9Ep/gEefBRsJUMmCXM?=
 =?us-ascii?Q?n4gBIyYdUffoxTNJaaSQatAFrxZnVdc3DEyCqFs73xREZBOk/IwAQep8zZLY?=
 =?us-ascii?Q?bqTnUaXCRdICoQFFnS4r5DXMu5irZvlnt12MRZBzzMP6CH/fpqIIxOXuE+6M?=
 =?us-ascii?Q?qPh/546RYyPxgFg0+Kcj3RB2jr0p9KlhAJVxdsLdSEhCp8BBtaqu+W988+6s?=
 =?us-ascii?Q?xYRQy+9ba/OFGKXi0jWm6TD1L1FP1xJiYERq3sLNQQWGnnuHhXUvhhsGLjAs?=
 =?us-ascii?Q?ZE9kOSnmcWnd7fEAKzDNpL/6ne+6sA5FvNDvyBmEZPSw0ixtLUlv27TJeRZu?=
 =?us-ascii?Q?YDYmwJO5B4dKuX/yCHjXeHB29UMLXSGsJhgix4s/nKq4k7UMo4YHKyWOoy0g?=
 =?us-ascii?Q?uBEr+58FeaN4m4k3CziLilWQXcbb8/FjSUCTJkEd627pAAENhFf8aA1jItzm?=
 =?us-ascii?Q?wfistZ9hGG/ujahr8fwnveWvDo6j7o9aVrbwPVCrrOaa/kVbjhdkMiWermNO?=
 =?us-ascii?Q?/YL/+Zw7UHiD861ufZzpeG3oAQsitsF+0UXgo70xVUatA/zRkjdeB6bMgKXE?=
 =?us-ascii?Q?HNR6VIcIhYU0xoiexXFqlRvKqvZeukBQb8HgUCEyxIwKy5eW/NTb7rm1ywnF?=
 =?us-ascii?Q?f/fkizg5JWeZI2D9sAplYjnbZ3vXyhsLnZBovW1Hi07lIMJzafphqOPonSy/?=
 =?us-ascii?Q?1O8Hm5gFGhHOgB3THLHXokZHEbjIcpLkuDWK9dXgp1ZtRkdtolK+3L7I6Bwc?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf4991e-8742-40c1-022c-08db4128c2e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 22:52:33.0021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+N7ON0SSBHT1geCiyENnb157bQIBt7Kc0+IlG3qBezbh3vdKhgcQr4VxI84/9dHF6Ml/8IVt2o/GUsECjA9U4XmQjaLu3GIs3Cu82TjQd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/sr: Apply masked registers properly
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:49:09PM -0700, Matt Roper wrote:
>The 'clear' field for register save/restore entries was being placed in
>the value bits of the register rather than the mask bits; make sure it
>gets shifted into the mask bits.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>index feed87109e93..f77203b32026 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -150,7 +150,7 @@ static void apply_one_mmio(struct xe_gt *gt, u32 reg,
> 	 * supposed to set all bits.
> 	 */
> 	if (entry->masked_reg)
>-		val = (entry->clr_bits ?: entry->set_bits << 16);
>+		val = (entry->clr_bits ?: entry->set_bits) << 16;
> 	else if (entry->clr_bits + 1)
> 		val = (entry->reg_type == XE_RTP_REG_MCR ?
> 		       xe_gt_mcr_unicast_read_any(gt, MCR_REG(reg)) :
>-- 
>2.40.0
>
