Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D12FC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 20:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06010E008;
	Wed, 10 May 2023 20:19:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C84710E008
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683749951; x=1715285951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Rxrv/aBHCaVJL7guQzny4MFsuu+xvnnyDKW6AlQumQ=;
 b=JWaGw7FPXHnUWJkQ0gOz3jl98Rc5npUEI5LkTiph7hjNs5IsI0JfMNq0
 LJCMMyi1/zDu+ItbWB5toIuwZTNihvNVhYGwK9ZWxf8QR4sgq+ANxKeil
 vPtV0QDj89gKm0khD5CIexGXzm/RQ/dsk/LjxPa3YamV+2mQPEQEDJ0C6
 CkvVqLyIojvqvVUtOaJIgWu2J+09arPp7brVYKrHkNZquXNxBAgIR5yZV
 FIL41fNcGw3Il6syFXirFxmOT9pWj6wPxjINyrRGruWdn53lrRtGe1/Hs
 GLXQWzhPQdpH2mkbuvZC0fihZ+23STndFHE+A6FvcPGGt2ZRh5vN0+FKU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339565913"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="339565913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029356536"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="1029356536"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 10 May 2023 13:19:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 13:19:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 13:19:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 13:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KW8vwqtsZ7+gqGHuc50Tkf+mOFJnTKFjNiH+ojhzehCqfPPZs9RPhlsw7CuDpaTYUENoAKJjALen9JXELsWCga+93w43DjyCb8mU00VMLgyt6P0ch98KbaD1agPNpLrOWTB5vxRfYyMbb+BafwjjKc5bOryondKkp+ZHdohn2a3ghnNT2SaB++aUDrtZxuDqCwsos1qLJJirouFhKO1ff7VxuShkoD48YyKSVd4oMfbPtlNRpnNRHElZ+fXf87SnrOZ90cJxFfFt0tSrd+7/no898ZuGgep+7m8tgNMcxrcB3DXm4ZmuQzFpQDjcJj0ro/HuJPxg25AKIoogeEYatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh/w8dsLKRuLU95ZmmgoRBkTNyteDPn6YcEwcaWDbm4=;
 b=jNlB62QJYiyCs2zlC6OGHo5i99xS6luwmcrajxB7W4FR64+3x2Mdje5JQ7EvUpixkaRnYV8UkCVSDKqhUmMNiagBNGTkQgPimBDkWPvg99s/0KT75XQYZSyEn1o/oyAqA8K09bjl30/d2igf0dHJR+EWf4swr7wbBOAAcOZh/eEu/3W6oRFeR+bjRgoALrqIr5bTQs2MBDCIxY0bAAxoo0udjXNCpkB1JOU3rjf0OxD/dWbw+/OpfU6RmcxtDsvINLZ7UX2Zj+gq2YFF5VbHEZB6023O08P+iOk0KnCp9Q1tFlwzngMAdk2kFYzAnZxOW8vGRBaJ8Z7hBCO47Krjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 20:18:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:18:58 +0000
Date: Wed, 10 May 2023 13:18:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <alvvlifl77qoztvsh55id5przuqgr2e3jl2blx5sngrykmbntj@gddqke73shtx>
X-Patchwork-Hint: comment
References: <20230510193821.9248-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230510193821.9248-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 24701dfa-6daf-4cd3-53c5-08db5193c90d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVAH/7QZyEfAZF9Abo8zygpFq7k3ThuZiOXMT1o5aLFINLnuLdPgPxuN+ZYAA3tDgYDCbQGBsquJ6IJvxcmGkrKD2TD559fj9+j0la5tKMKNDQ57YZlLw6s2+7nvyHfWdnEmUzUUsjUAUR8OIaSDYZgFIDGXmfLRxx7kBv8R2lUXQURhdT2v2W1ybRtEHPOiA1swxNQhVgfG/LiYTGMDAe44vwf2OZk7WT7nSafBXYLFZu24aAv6VSuQrzzxr+w3RzQRQgdPn4Wb/m3HMMRuBCdJKP9k/R5rfs3vLGCnuO7MiHyi62lK2cMGf66dc2DMl5UhZcdN+lxsw+40dccO+YGRNs+KXuOlgHnhAJ9ci0mywEnoQ8sikpldLxqG61o9LzbeByJ96Bd4VnAyOAYoMum+vyrfy30e/W9H5SLrogB8GcO4vZAJEJqbMKtFjaUMSNj7kv2t9laWLM8S2K4GyU6VRvOnbz0wjOb7eIxdLOIkI0oO5wgrHXbdFxluNxT6nIauyALUWZ0+lnh4B9LwmOzlZkg4F2MCdKaaGb8/TDuuVRBQzLeLvpF6A1lyfekF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(4326008)(66946007)(6636002)(66476007)(6486002)(478600001)(66556008)(316002)(6666004)(86362001)(83380400001)(9686003)(107886003)(6512007)(26005)(6506007)(6862004)(41300700001)(5660300002)(8676002)(4744005)(8936002)(2906002)(82960400001)(33716001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hRfgHdTDzVOwZJMdHXQGOJDBvt6Q86rRP1RVRNusVa/Pe4e7pyomWuIwR5gg?=
 =?us-ascii?Q?4Ufxue/DvYJ82Uozlo5d8lMpPCx2veZRFIYa4ZrNoV0tv7/FO+gNXGrwbSmT?=
 =?us-ascii?Q?BBrV/kdqGRLTtvLRcROsesm4uAfyvTQcYzKR+WzF0NVxstDiHT9jFWKNagWv?=
 =?us-ascii?Q?FcqQzOmg8VDxDDQZyjdf/X2arzeR29BPoq1hJm7wxDkDnK7uG7kgyHRNPP9V?=
 =?us-ascii?Q?6z6xkd3Ce6RFY+Hy7pheottHw6ffL3LAVwpJttOGQb1ZKFmVcrn6uuT4D5Ab?=
 =?us-ascii?Q?cguphky2OrGPb37FiVtR1rivKA6ApEW+Okep3hBEIpD/9JHUAEVmynmyY2zZ?=
 =?us-ascii?Q?0PJQfc63TNXzluiZEdR7tDEhRptL8OgJwyaf3ugp15NTH13G0D48SFfJ3RV/?=
 =?us-ascii?Q?4VMSYC+qQSeLbh00WyF57+MdCFC5AfaFX/QWkFKEELTjz9fGcNDc8EkI75an?=
 =?us-ascii?Q?aryOYe+62+7iHdxooR1n3AuRH/BeRMqiwQiKrRDWdHjZGyuAPQYoLJjhcdjv?=
 =?us-ascii?Q?F7N3AE4OIxrTDBVJcZU0WaIYgQedrKoG+WlpFSwVCdVEXy1ESnGiFXvsu7qx?=
 =?us-ascii?Q?a0prI0aM5HOQNLCmF3wY1AuDYYeU0ZnatOVf6Ey/AEbbndxay4o3nYJpUu2T?=
 =?us-ascii?Q?Rvrl8d6TLaxePb9AOQTyVIfWkOq+D96psG5Q3QoWt8YDT9r6T2/ypHpKYjFP?=
 =?us-ascii?Q?R6LskXzTAMOE38woWQeLObTiDgHaznaUwqN4mWtQ1BugCerGNm/Dq2rHMChH?=
 =?us-ascii?Q?MlmWMl1UxPNezRxwZ0W5qxDrBY/C+cbLL7vrriCfcC+2J0mytooJhBPoeVmN?=
 =?us-ascii?Q?6ms5qGuHVbA5l7LBStR7Jji1HPDBgBJrl7xrYQ06643L/pFq20z/ymDmpI+G?=
 =?us-ascii?Q?ESjMPoC6bwTuHCsQ7z8nAgyQ+04MleZHV8U832ziYVznrqbHw40aellphdGO?=
 =?us-ascii?Q?o0mCXEhZnapUQlS3YuyRgfMLnL6YiQiJkNRBo9apCCk/YrZmwqFDLfReB9ph?=
 =?us-ascii?Q?5hIxuj3CB1+NNyzt9jLtGLRwzvl50yh/FVJKKR7FEc2+3H/keWF0Cijxms67?=
 =?us-ascii?Q?uCPrz6/QRD5cZPsW1DeVUi17cc6XW5BNB69haD0TSVBIFATTjR05HAZO+Bp7?=
 =?us-ascii?Q?p5ja2QGpBK26Zo8azEuBoi94R/+a6x7lqnzZAbSbQXKq+oTN55b+/v16ExAC?=
 =?us-ascii?Q?PoybnwR7JYSPfshC3eOnH4rjLh02YpIZ2oa0yMsTmSo8Zfl3IPkeLSfxNPi0?=
 =?us-ascii?Q?JT2os+rXvftoO53mOLPM4rDBBY0yspY8cD3GMuWBWTudJla2kWKL3PUMcU19?=
 =?us-ascii?Q?dR15sxlANKsVwk1n+ksHbGW8qoFL2ymNY56B7H1MqpnjRo0G1EPpOLAaMVzn?=
 =?us-ascii?Q?Pg8Ys+bGIeszGF7NMLXat+xZ97oBKrtrHEhMdyAVHg0YP8gMu2HaPF4LUeW8?=
 =?us-ascii?Q?MrmvWDToG2CYLkg0A7GQdmv2o62sFYE4amhzYqwMA4jZRQ3keisOGnukxXWP?=
 =?us-ascii?Q?0c9VHTAYqrQlvDXpE7O5Q66qyWKeRGKsbb7FGpk2Q1zz8mj91mXhNwRJz866?=
 =?us-ascii?Q?qzBOsqlCLfGlMConN0nqQpAvVzE9VviU3YiL5mfm1+J1Dg+ubZD03mKjDAcv?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24701dfa-6daf-4cd3-53c5-08db5193c90d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:18:58.1013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hu845RrFHkgj0AipighymEHfpSigRd2IcnBgw3EhGQwcTf5wZD2sTEi+r0XlMLEn8mVny0IVchHdtjZAmQiKWN6X/evalzicmYNNm8IdNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6195
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 09:38:21PM +0200, Nirmoy Das wrote:
>Unlinking display will lead to guc tlb inval timeout for
>the fbdev vma as irqs are disabled.
>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 32cc83c43b2a..430bd6eb4053 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -349,9 +349,9 @@ void xe_device_remove(struct xe_device *xe)
> {
> 	xe_device_remove_display(xe);
>
>-	xe_irq_shutdown(xe);
>-
> 	xe_display_unlink(xe);
>+
>+	xe_irq_shutdown(xe);
> }
>
> void xe_device_shutdown(struct xe_device *xe)
>-- 
>2.39.0
>
