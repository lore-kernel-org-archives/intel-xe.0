Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1611C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907510E1CD;
	Mon, 15 May 2023 13:10:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9558B10E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156241; x=1715692241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t+EObzUy66qXhUs9nus3TkLmzznU2LU47zuR/W6z/zA=;
 b=aLnPdDLE56CMyZqjLzGFYP2ooiEMcPYywaKCIq+t7kCWat9OD9T1JMzH
 +jXNCvXeow6B8tm/zSNtg5RdCf48iwaBHkTsA0tXLyCKmJk87efQkHNdx
 M27+bRYmaPVSnr4f3g4eAN+bO4JLJ2Uo3y+4xHXGwPVddptHA66SO0lAU
 Zg54Fwa/epuzGXIESb66AQ55fJd0txUYhabs7O9WW2m0SC+V3BtndK7wZ
 i1GLVQ6AvLvSL3wl1Sq8dTAq9UjuLN+FkLOjFwQ+cXTPH/Ug5rx7xhAD6
 n8hlqlNoDQbaK4W6cM8OlC7WBwDgXGwapWKKpsrUpoRLSKyVMD7vCFTId g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354352526"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="354352526"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="812952573"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="812952573"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 15 May 2023 06:10:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:10:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:10:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:10:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR0AzfWict+MDI6W2eBlPBVIaDEGNlYbnbSwQOgaumgV96/LH0m37+obRzui0S2gXTzCGrLffWlfEKBCQAFoM1zqjIhhzuMlwaUuiDvlAK7FPTqVkgcOZpgGCmAMFE2amSqjWqv1SFIguJVnSyfjMMZdQVSviOOf4ZEM87EPFdSVl1cUqRhchSkxHSUBRI6HmkxYxoRPYRhiHQr+HwRdzAlEstUg90Z5zaooMLw11VWNbbL+Qp/C3hR3cXSsdA14S8y3pMEDVotXwWeLOWXU55t5kTk32/0LY67hplJGTo3WDcKy5zTGZ1sVkULnegFGhMcKYzZbCSM6PT+Qwvwm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcN6v0tK/HEeGR1z/62Rhhhk59hcWIOt5lXJlLVL8Mw=;
 b=JGY5N4HpJF0yEhI28dlJ6juBCRHMovm+/Hp2Q8FW/H7oSHBeKKbtdkyOgvTW8CLXfYLCxJHCfH0pXOefTjztLidRL+D2GsiOPl82/4u6iFreU4IQ2JsvBu02FvWja9GHvF9UBf10tth1fEvdRubt6PI8CMG8kFubrc/XeWLb6MNPHLym8kyTAK5bOQgIzdKlZ/Rl+i/wgMzktN54eRePI892zs8ywzycdgrFxj7tOyyf7/O0JWzgvasE+sObd4c+SoaylLllorCUQy3nkzqD2ibZ+XTE0ms1hD/mnqrzVR1C5XaXMWrluLQx7VUVIQeF4qkvQnBLluGips30N0GlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:10:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:10:35 +0000
Date: Mon, 15 May 2023 06:10:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <a4fgfg6czv7h5pywo244dhwhd76wnycl2iaa4yxet7umnsdq3p@zsze6tbkfxbg>
X-Patchwork-Hint: comment
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230512180313.1765011-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0255d7-3194-48b4-3062-08db5545c527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v51Vg4BbwXJvMjF4dfUJ0a5Ik2LcM6wlEqXZWhZ/b2kuuEf7ZwHA8HpavPRFVrz0fYHJ0mstoq43Psi+gSX4sSwXW8Q35IXi5PJUogZ7WZch5ajw+U/7VIM85E8WScQYvVlCJoJyVBnn75osfn+CqNzK+pthHKn0aEbYeQI4RbUV+HTMYiqf1RdwTkyxppQBpHgEXs6oaNf898Yjrw7EVKRjyNdFZqEJMxsdDH+A8njI0xl0l3AWHz9mwq6eJWdtZXXQZiyCmMgivOUnJWhJUP9tf1QsPeqqiSIxj/MKPhZpuGu4y33RjVa746MGeSDi6nYekIKPa7NtwVl5eHmWNwHxeccfZeH64KbWwkalkhIOpMjDXGdaZ0lDxKNH3EbF4qv/LHtiIToZ36Ul94jOHk9EcR5/FzBlh85Har9YQOUQthqPPRwEWVPTvbmxlmf1nnN+/fAjEn1v6QexHjTdmG688zqMBsV+IKZz9p3n0ax0GJGfD2mY00hWec+KN5+UmuofF9Ngvj0bOMlur0YRyRDvhqDkxr3m4sTfLs6jB4kusj7KuogBn4C81Lcmkb24
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(83380400001)(33716001)(4326008)(6636002)(41300700001)(316002)(2906002)(82960400001)(38100700002)(26005)(6506007)(6512007)(6486002)(478600001)(66946007)(9686003)(66476007)(66556008)(86362001)(5660300002)(8936002)(6862004)(8676002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kA7UdUnf5xXvt/6NmILTNjUj2PKCRqmX6nkFBdSUMSwVG7BjY3mKh5s4lPfq?=
 =?us-ascii?Q?jtyBhXO/IeAyhpilT80nY7GZbOFqoEIGAkcs/PZDwZElLH8anTxbnauxIt+I?=
 =?us-ascii?Q?GoeU/vW07ahXjDdxDZrun6Z1DO/fAZ6Nv9/qnmFxbJqv9ItHoBl2sq/iRo8h?=
 =?us-ascii?Q?M3G+7+ZXN1igs9J5kDIuO4O3l3hs/Xq+x9WFvo+dndsbEuvKt23/Rqj+lfYN?=
 =?us-ascii?Q?N+vYqEx6RXvQoFAlIO0k9oP6aKb60HBhYIAmBG1/m32UTLlsIVmY7KAN3IjN?=
 =?us-ascii?Q?nnZSpoRPt2VHv0SF61io55ASGwChn8ITAF40g3xAkmBcWS8qnlMv11VksNJO?=
 =?us-ascii?Q?1/Ml7aiAFDu6+VGnNyIDSXn9GTgeWBaYclLFR3CZFYvUYEY0r3iAx/qwUjX4?=
 =?us-ascii?Q?huD6qebo/6GhmypruDjBow6moFcuuPAOcSLizCRXVH/RJXgV6qyhcj/U8Zh2?=
 =?us-ascii?Q?bHkh8us9cSytHA9Ps4mwxpXDl+fjVFlZvaRA3lpWS82NDW7LQPtL7X+fP0dB?=
 =?us-ascii?Q?FM+2TQql77Bi3MB+fAfZHg4mAErmSOpDshZVrEcYzkyLGxTCS1PnO6PqNgT4?=
 =?us-ascii?Q?GZ1ZktYmiZT9AbPfEa6uAT+fE3pFmTTYncJhE6UCOk7fDKaqhYudp6Btbljo?=
 =?us-ascii?Q?1IkAXV1zX1+1RlLN1eGp/DeFB+qKkc3D9PYuMfqJK14mW6wT+HQ63YMW7+6L?=
 =?us-ascii?Q?MmvgnW+1zJZahAUJTwGzM/1cWBbyl2VUdJMBpflePjA5SgwksYp8EySfFpR6?=
 =?us-ascii?Q?B/Y1QNFGMQ9bSBwVJ4MxM9DbHIzz0dcEr3Yw+T1lfdi1lSgbeITfIw76otOq?=
 =?us-ascii?Q?BQiJhz44udX4Wr76OrVinwR/fX6fh/91QQdWkheGb+znwUgXyu7oGseRLCKl?=
 =?us-ascii?Q?PMMlK6kGRdYj1Fz5QVbTELHYOkiSvYhhO7X+712ZUIgVb0ZWhSKRD0uG/d97?=
 =?us-ascii?Q?SKfCSqjXw8eOTqU5fUojpTOEWfN0i6F/p01tttKjeiG1Q01SqyA5lMYRjYQD?=
 =?us-ascii?Q?/Qcp3sXExYPgqTNIg+BIdyxYaaToYQC4XVhrFJcs2NqKsCIRZIRfiKjrWj/E?=
 =?us-ascii?Q?iK+CwHJngzGsJyBEo/F37HYEWS7NPBxnOvygDLLMn30tCQb0LOF+m+hzvNIf?=
 =?us-ascii?Q?ZYKEa2/3z5aH9SqiBZApcTtYt7pR+YzKHkMFeDn3Cs1JZ1/GOx51v+BOSpSx?=
 =?us-ascii?Q?ft6mi1XnvxhKHQBXL05Y1gWSBhQtcVKBrS9+0DPD3zxQyAuW5MgVFuOmxATR?=
 =?us-ascii?Q?4RyR99hX48rI1YHPxg+uqjZmVQW/FlynAapDQojPdVoPZlur2+7gqrGXZnqk?=
 =?us-ascii?Q?nbx1f6qCxkyRMvopMhpPIfdfTRDEH/csjiQnBnXNBacGuhHLrw74DiRx0xU+?=
 =?us-ascii?Q?ATcF2ZnCi9SBtpHpzxcqSbV3lTFL+GtkRhB+969FEVzsZ8Wa5OvPU3cjQDI2?=
 =?us-ascii?Q?ozoTOXm12lNFrKF4qWGwyPYKkcN7vA298T8djrrj3f6wxkCMtbfSs11WlYSY?=
 =?us-ascii?Q?TsrSXByMsNg847be1TOF79BuWgkYkUHL5vj5WZW9IYL3r9NvVRdIOmy1DsUG?=
 =?us-ascii?Q?vQCep/42I5BC0peOJwUoaQ3+mlebVMn4uQgmWqKhJhsxFI3OIc91TQpp/8tQ?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0255d7-3194-48b4-3062-08db5545c527
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:10:35.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWefbgG8f05OnwedfUqohKxN3HKtiNwnkbfRMvZE+PWHQQyGMeQnycDAwfTZVLmJ9FxNLwtCfGAum6iQwY9upRKOsA5PYrbRHDHuSvZ4ix4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] fixup! drm/xe/display: Implement display
 support
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

On Fri, May 12, 2023 at 02:03:10PM -0400, Rodrigo Vivi wrote:
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/ext/i915_irq.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>index 2317e60cc682..e9dfe3658ca1 100644
>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>@@ -1027,8 +1027,8 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
> 			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
> 		}
> 	} else {
>-		intel_uncore_write(dev_priv, EDP_PSR_IMR, 0xffffffff);
>-		intel_uncore_write(dev_priv, EDP_PSR_IIR, 0xffffffff);
>+		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IMR, 0xffffffff);
>+		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IIR, 0xffffffff);
> 	}
>
> 	for_each_pipe(dev_priv, pipe)
>-- 
>2.39.2
>
