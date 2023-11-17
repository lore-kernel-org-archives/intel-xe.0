Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A6C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 15:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A3310E1A2;
	Fri, 17 Nov 2023 15:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0810E1A2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700234291; x=1731770291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OnVgCfzzK6wQO+CY49tue32HGsPlFIgNVNyO3f6qpZ8=;
 b=Ikjz29Ph8axj2mD196B1m7w58uHBcYirJvB7jeTlTMV1md08Cxn/l4gz
 JyX2hXsqmq88XZAzyA4t1+xD2a64aDMwgstnjVWMhZHJ491if4d7hNuE9
 3swtM7WcjJQzcfC+0Gacrf53IlOQvuWgUJUv1Y+0Qk2wUIUuTROO+2dlP
 02hHamZsLdghBO8Ir01dLOr+LiWkF5NkLLqo2qBWf7k70yOGjLFPL5bN+
 1BkmHa8TBnihy8llKQ0Koj0N8rBVfG8u/h31xJLiFMZ3Zo28/gRAIDjzn
 3M2NPOXtWqmfKAst2DWKiSgcwU3kIh2+Cr+k1YTQ4fVW5go/uTgZFPc5E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455614944"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="455614944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909457749"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="909457749"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 07:18:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:18:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:18:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 07:18:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 07:18:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCc0NQDCsgNWUNgmvsIE0TYg8TX4ZzsSROT+7AqMpgAckZqRnagEngaz++etjqr9+u51NjbAvgqMzzgnGrmlVO+NFhGv4PAXx0UCI4l0EMvbHJKHYTZ/giE3K4zz3/FasKWr56md9lR2byOijvRima/KHePcaGXEdaZnS3P7FX92aiKoMY9b7zyU2I4IVgpDopuBAMEP6xZZcnwzzDtE/b07yTxmGFUagNwNkSLc1Tnd17eRLWb/eNfwRQEoE+Si04wOuhCVBWPwNFbjdsC+6GDkQNFII8NDuVoPPDKjC8XmbiaTiolBGWlgt3KuLkv91S2AP79/cTjd672xx045KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gHa1NKcLSJNQTwmKVVR0cE475kgQeXyuWzFhYR9miU=;
 b=m3HbVQelD7dck0Qugh2rNBz3QhVopO24pbR4icO+dqXTM8iB+OjF5HXNiFU0TtlEIs8IzZQWeC+H7bVDAW1s+yJ0WyCC4Yw9/uqU9U9U1rkyi+XQJiJmRlB21ChmJg1rToQbRHzWlZCYo6ZkDt73y5sxsHiw1brbsKGJDqi/8adGdp+5czGyjVDWdhoFo7/GNJMqxrIfpTWMWlqrti20T+H2DUz8azPBHk3Hl5bv0b9ZwBmH5PuLH+GTe2aqF7LhdEDVU6RThegIhvyUSSAyGN4/BIal3Fa9lsk3PW8lP7ImgZ7N4jFloJixo1P6lAiu6ezvbYXS5YkROagQ6GNHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5923.namprd11.prod.outlook.com (2603:10b6:806:23a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 15:18:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 15:18:05 +0000
Date: Fri, 17 Nov 2023 09:18:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <k44j466umocyafacwppftvjgfiosfqar7yvfql6d6jzo4dfgzd@l34dku4avpjb>
References: <20231115115816.1993-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231115115816.1993-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f1cc31-e02b-4a16-a598-08dbe78065d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPnKw0h6maSCTDmsZFBzEE4okpP5XkyMNs65f4rmE3pEhvMgQFy8FfvnsOyiykTZL5eSgeYIm4dfTT7jgiCupjsuvaxe5g609GgudYHcteuGELDF/bJxMxfDJ1MCDUJFsMMtR/CYOFj1fvE0n+8SWpYU+Hbl6mWqYUi9I1C8t509dM/XmxZ+vaj1Hawyhrn2Ce7z1z/f9qHAlx6weTqYOQfZhUjn1hf4OKDKlheUIQyoUx8JJUIavQHyMiZ4vXz57Lp39nIEB19DtqS4dUTtl/SgY/VsCtY/1bCrpIYFhIbXuJR410yLG3ShGPYdOi7YrS7pQ15n267Rr1LTOlJUjUwAK5RqtKQq7mbH8PNNWusWkADSSc1PMxWn1hXbPjbfqtd5cErSpYGnf0Uj+AvOc/ghLIKxpuy5yiyCqZ0Um5gF0lc2cR/mGIs00ZqRCQFh8DcuTmjN5hw+rc/1bld9w1edYLQApoY1XBMCj8mqoQq/imZfEEfTN6V06TIZv4kIFcAnwi+6ipEo9uRfqTsvtChDa18rVPysjgLx2bcsxpcf/sPuZavMF1zAEH2/fNXV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(26005)(6506007)(82960400001)(4326008)(6862004)(8676002)(5660300002)(8936002)(66476007)(2906002)(86362001)(66556008)(66946007)(6636002)(38100700002)(33716001)(478600001)(316002)(6512007)(9686003)(6486002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?98xgHxS5/OOUe+87t02PPJ1Gn9GZMl7YsjED4rV3wQLE3RR9n9XsJCOfg+by?=
 =?us-ascii?Q?hab4KQH+KsKsM5t1CZ5Bbh6GF/jehwvDmf4Qz4fZHcSstUEtyMKPNFFmxSdS?=
 =?us-ascii?Q?VVoXfa80quo8/qF0j9DP6yVoVNIC1iyg4AHaJ6YfespAiTElgRHsj62cxanY?=
 =?us-ascii?Q?I+YBg1GC6ZmmLCfWt91+1qQwFjhBORVx+eHm6GDy9EDEJqssh3lsOdYknlQv?=
 =?us-ascii?Q?CU7G1RYk9HT7xWqp/uveMK0uw7Cd17f32dN+bnFz5cnT7HbnCVK7mfxhGaeA?=
 =?us-ascii?Q?wOLqM3+10MnElUKEyd3xoZW562k3Zd68LT7jhYCZ3bRt7djDdKUEfxspnQth?=
 =?us-ascii?Q?kmql2DIDAB7NnpXbyVDSukPrBdfQ3PZJJPYYWUnXuMTqYBrNi/k+9/ihg6ji?=
 =?us-ascii?Q?PNTFNtpjsFtl9EfIxpBvB1uX2HJgTMLbZDgLxLFcNewe87FEFzv/dLsinNzV?=
 =?us-ascii?Q?1UjbCK1eIEN9tezzRXicRV+3wQ2r0grBRhvkp1Pk1P/e3RamiaTyGif/H/Yq?=
 =?us-ascii?Q?ltewNFWGVSyJuPSE0x2QBRvw4bWaIYBTfmX1AjAQqLQLkRFE4FZfNc5WrO9O?=
 =?us-ascii?Q?exDD0PZ+R8dRUQ6MJnGv2sstKEN/0LPHnO6Wbb6bvKlDGNz/iYPa19ZAaJuW?=
 =?us-ascii?Q?aHqIiJEyoExGDL9sqGogm/Z5s+L71d6eigu70aUEfb4g7FdYYolTM+CzJmY9?=
 =?us-ascii?Q?DuLRv5aosCKFHqFwYFEl5KBGNYYmkxB/db55S/E2x5zHyU/bRFUTlC7DzMkk?=
 =?us-ascii?Q?nlkEwgZhr0EEYTCJtxRpxiT4EQatxIL/UdJ9ObxaGJfurE4iPjVv/d+ZCz1g?=
 =?us-ascii?Q?4mB+6wesK771yccEB6NcrvQ2D7DXsQXetRgHS3anNceVdpojUUPxQ+3RZeUe?=
 =?us-ascii?Q?UTb9I33er0YCnDnRG/AK4uJw7PZRQzIsLNejgJI7qIwkP1VuMfsQ80y4dJVf?=
 =?us-ascii?Q?5GVE+r3e1GA1sAqI26OA+ewGtNkL++qcCg2i1h94kjr+4zyOc0MsHeQpZCfm?=
 =?us-ascii?Q?c9CDCdYhgfIfjnlE4r4Ob+6MxXwyRBtQ1u7eb6+wJKSqaB3b0mlJEgbC9zjX?=
 =?us-ascii?Q?hZ+bYb0i3GoxaKB/Ef51H46wOIVK11CprUMufbjawyFThjn6MrAfbA0gSGVx?=
 =?us-ascii?Q?BWUJvzRg+puJpXq1Qu7J+gRWPug+Zsrax+D27gCfI4GRMruQkC9aU3igbqQ7?=
 =?us-ascii?Q?S13ZHqreWHLCmXcwW5qHsAHZGN6UEwidFhMggAPr9LOYxY6VtCU/9WHujrvl?=
 =?us-ascii?Q?O/NM+vaRhqPg+s3RwHjnMDqIKoq3vtpfIT8eDJ+Yezq9tKFUFVi+MIZEvUrS?=
 =?us-ascii?Q?rgI44/0mTip2IqxGSS7pZWiQr++6k99xm7pkOF2QK7Lr1aqBvNsrCvErczVM?=
 =?us-ascii?Q?KBK1aazCd+fBT9fjZ3fhzSkjqOfkEY+zDXZS0hWts8m8ZP5wSoGltaB6o+ca?=
 =?us-ascii?Q?hKmYPNgR/exX615mwE6ICLeigfSYmTs73dD9lUL17qQM+JsLyUxtcRLG5ZGs?=
 =?us-ascii?Q?NsdmoEnc6QvvF36KRFwhsCjPpkgiPiQkLAxCLXQp6YlJOFklLDOiE2gtuYGO?=
 =?us-ascii?Q?pEftq9P8UaCPOAye+mLqucQZ6Qhx8WVQqv0/q9DuegOfJu1Kly82L9G7altv?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f1cc31-e02b-4a16-a598-08dbe78065d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:18:05.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaRn6CVjw7jVC7+VKN4DEdVfAARPDCL79ThkJL6MkpulElm9dO9xX1f/kpEt7gg7rl7qZxvjaI+wXX4PQkZ/q5M1vHGXDP9VrKArnvZX2VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5923
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/kunit: Return number of iterated
 devices
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

On Wed, Nov 15, 2023 at 12:58:16PM +0100, Michal Wajdeczko wrote:
>In xe_call_for_each_device() we are already counting number of
>iterated devices. Lets make that available to the caller too.

anything useful to do with the return? Is there a follow up patch here?

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index a40879da2fbe..306ff8cb35cb 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -42,8 +42,8 @@ static int dev_to_xe_device_fn(struct device *dev, void *__data)
>  * function. Across each function call, drm_dev_enter() / drm_dev_exit() is
>  * called for the corresponding drm device.
>  *
>- * Return: Zero or the error code of a call to @xe_fn returning an error
>- * code.
>+ * Return: Number of devices iterated or
>+ *         the error code of a call to @xe_fn returning an error code.
>  */
> int xe_call_for_each_device(xe_device_fn xe_fn)
> {
>@@ -59,7 +59,7 @@ int xe_call_for_each_device(xe_device_fn xe_fn)
> 	if (!data.ndevs)
> 		kunit_skip(current->kunit_test, "test runs only on hardware\n");
>
>-	return ret;
>+	return ret ?: data.ndevs;
> }
>
> /**
>-- 
>2.25.1
>
