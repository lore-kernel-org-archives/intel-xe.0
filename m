Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A4FC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4B10F827;
	Wed, 17 Apr 2024 20:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAqspWrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC341137BC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713384207; x=1744920207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M2duKIfv2KEKP5sxZWKqqv5Ii5HOeo+R8/RWNiuulLA=;
 b=mAqspWrTwaAOPmIQ9FbzEKS81Jdb66UB4klT6Ew2BMzRNwi3NEAq8UdG
 CEvOnKJmeufSiO2Yra8DQrKaM/v7ABYcJZXwIhQDDL8VhhLlohKG3ituG
 4wfhioeL4QoHXWoEtV0x0gVy5khzAc57Qxq7tLY1I10XbfcUPFiWeR7vu
 XUebX9CWV91TSAcVJlYZ5U96S9f9527KwfKwvpsYUOL6L/OQA3jO4UPed
 gW5j7Ck0n4+e6QaaeY8AnQ74p3fnxEFYVXV4y52DeDW2SA7ZBbbrzFIIC
 83tzFz0EXStzVKjXs1AVH+6amW97nH6CmkUOnzeIBWR3pXZIFgGnKlRAN Q==;
X-CSE-ConnectionGUID: 2E+tbkiCRFaeVpL9vQB52A==
X-CSE-MsgGUID: bVYcOGWERf+SPdxmT9/IjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20290822"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="20290822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:03:26 -0700
X-CSE-ConnectionGUID: QVTZB0+4R9qmG7ttvxDAZA==
X-CSE-MsgGUID: EFFGp2dSSra7UYl5kpu5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22616719"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:03:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:03:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:03:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:03:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuZgDOFdDKDh2ZKGgx7/TXMjL4u6fWAkPzIB0kwEkrmRtpz77OEzdTCJ2PPCHpBNoHhrLiZAZ44oZHJS//DPWdafwsP+xtoaS1DQb29Zo2+ATQ8Rvn3K9ul3qlVP3gdn3Ahtj3ts444QXoAwAmFt+HxfuBLzHIET7nzOa4qARJdPosV7WZ9BItrn5G3PQh8WvFW8pBHYEsj8jQppIaXdNDcsA0PgaKKGNxLEgHB9F/IJk3Lq02iq1/H9t8ozk7HAcbE69D4xEBDskByIQ8ktNWU7oCHnP95E4Fr56YAR/5hHei8xIPygY3qCRsx46u+Q3uzav6yX5JcHhD9gmLZBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnMs9PcgskWQqA7O1lA2sDxtoApp7IaDOtNj4qXdHTU=;
 b=jjIZsRTnni9OvNNXRiMB2+syxdYCaQSlqdMVpGg7SmqcDl/1eZMrWkJswAiDTZHQPC6bV1niD25m21akgTf44GcsaE1NZnU1JOuA3NPuxo9NLrvu2uHqeFQLvkpRyKqQibfnKdo5jRyLnWHSvCArBjGyv90JxpREDm+N0KcjMRld4nco/6N1P18ec1cfqnwa3nF34vVadUDRIFRelkDQW5k7OXRQR6ldTJvDtVGmpu2FipGc+EosSTGZAJGgM2/CixGPKZWNGR3AXGXHlRTIE4TqjtCb9KvZLLMDUMQxA5SxHU75LxwVWewB0HY9AtGGKV7MscYrFuQYU9QBnnvcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Wed, 17 Apr
 2024 20:03:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 20:03:14 +0000
Date: Wed, 17 Apr 2024 15:03:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [xe-for-ci v2 2/3] drm/xe/gsc: Skip GSC proxy init
Message-ID: <e7hcwbjzcxifwhkeewg63x4ivrxzp37uefebbqujmmqex7wfvp@az7k63tgf3xd>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
 <20240416222159.1332619-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240416222159.1332619-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a71e355-4841-476a-0b9c-08dc5f196a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYv5cIgIXyvgKa+e9CT2qym5LZkiYyY66O43BSzQVI87yCV65Mw4Z6Ca0zXUafa8njT3WHcH8LmiZVhCZklrGm11WTR2Dn0DXHdOgwxeDqtxDdUnf74MjLJDgECt6hBX/v2ak6M1AboXknS5B3pNA7v82zIxfBolZP7ndHkHkWsTUmP+zJsETrgN1Pz0fF/EqKQ9qYC8Q4+3USVi+ZgYfzcV3kiFHR4GxloN29dfgPeSJQhgq8yh7zLt3Zjdh/Zd0o4sN0AoY9m6mGymIDU0jeUR7AFxt+I88T07cl5cOlNrXeIE4F5chktsIFoQm4J8YeT6sTNqio+RkEV0MLc1BlX2R9x4GOnGclVi22CbUEke0tvRbF32lpljzmhJgrCWvgcuawQaZmSKTqJHkFQUdhlyYhm9LF+1m2djeNSa+aWCDfeEwLVLREWPz94GSGQ+VAefdrm8K9+SLQbufffo58lGm5JtUlybAj2LrtCiy8tKgiCrM8LybDCYYLh0NN1sEpijp55d6tVbZa0prNgAYSDxgBJiz57yVz0tQ7ayv8Jjv7/eWT2gMbCnlb9CNa7+5nwAxz1Hx9+tUkjvSwHAA5lHTKmEHLX0Vq3k71v2gEx0FemCSp4ZchFvOuXWopKztcdWFqOyGIxqj5HuGg6Jn03ia45av32l3qrDbX4J4X4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jcJsH6ArSxoSps/cNcrgnUUbhazScbdVqfoeXCcUppJYFV1u4gsBjUyVTGuR?=
 =?us-ascii?Q?Zr+NDomfovEO+b7dr7tTbdBejwhlv/ghG7m3xX0XQ9wDhZ63uzl1IYYm+zLA?=
 =?us-ascii?Q?UQ50znf4O1KpepK5+ydZ3PW3N6owQAHWyd2oPojLtYJoPJUQOsVNfPbQxaTk?=
 =?us-ascii?Q?4wAMMgU+XjqViqgZOE0myKICDfe+eiC53xhKibdaHE4LWxuo8IuzhwHllIq4?=
 =?us-ascii?Q?bvaGhXDvl/G05qCXZm6rfRtaAAGYvEQ/jCjvaf3jLW+XViejNgO3bRZ34Q61?=
 =?us-ascii?Q?THZimIMKcgpCSbyiG5OAPDaQ5ps2p/7upTT9s8Y0zL+gL3BlghFoLpdnghn+?=
 =?us-ascii?Q?Z96xbkJShhvuOMV49eOcJlefWV8UvXBoVhmKiZ2hXNS5TWgpIUSwtV71dOqa?=
 =?us-ascii?Q?Yy7OqqkNqBOJ0PBUhFI/1YRns+nm3LyatOGOF5dYNo/9zacgVC8cdvhOzl7n?=
 =?us-ascii?Q?lYle0c2VydsojtnFnUaGU2dj9RBY5bQSu7s0FOkptwSOVcymF2jvHjKbLs9z?=
 =?us-ascii?Q?jp17qBjVz2gZfCrEF++WbYYBdkjZk8LYXQ2MaYR21XZkDfAgI6PKj6x945de?=
 =?us-ascii?Q?vn59kqn5ZOMoJ7KRTRwQB3nuEf1Ehym9uS2O7h2/jy9lt5uhOiwobtsbwYgW?=
 =?us-ascii?Q?OaiRl6naE9eUMibc+SzizKSch/joIh4aPwr322b2gD53iE6p1TQmM215b+Pa?=
 =?us-ascii?Q?PIXwwk5TjXm8SMe0D47hhDiE9zc4mm8ry7aGVrKOC+GxnjqPPXAheHkeCINU?=
 =?us-ascii?Q?tzWMhOtybG27AYfZBI4du7dAjE11cHCy7tVHWVqRFC1+e8+CV2bWqRNcdzem?=
 =?us-ascii?Q?iOrYq5pWF6LosOpcPEKQAgFgWJWV6RD+V10EYrxxGqS7nCQyUJkbFrat0MPL?=
 =?us-ascii?Q?kBDDA1JFA4zz7FpLqJYIYQNkK87l+fpO30pT4v+51ukG5Do6haFpRn2P979f?=
 =?us-ascii?Q?rGN0MDOvymBmTuVWg9svLyD65OXvyaBK1VgYBP6SU0I337tO/bXRdMmpR32r?=
 =?us-ascii?Q?YT6nHVR77dq8tm4gM7cnwPsi5EQ1DWnqibCOgpygyPnCcELghJ/cFQpKPi2g?=
 =?us-ascii?Q?Rwl8MkayDIAsXMeMShZ8gEaaM/hn17xDjb30XM1ZnusAXOOwXRIG1NKVKBgO?=
 =?us-ascii?Q?L2vUE6kOfzgQbCMwhCF13U7r5beSMWyf9EhqumRyeK7pKtQIxOXt8HfgqRXV?=
 =?us-ascii?Q?BDWSKoHKjDpc03kOLHGrs102NcsRAGEcQ/I32ucePRs4HXcCeR984bAckiuH?=
 =?us-ascii?Q?frvZyn2e/KQaRJr9Zj5WELQZCFYxMd2ddNmjQh8nXpriVlIJgKM6dUUMF3y7?=
 =?us-ascii?Q?MRg/cFRc001J/4yE+aeKgdVA63PYua6ULxY0ipLUzIlyIP6+pI2Sn3ehuqlc?=
 =?us-ascii?Q?ozvH1khNc2TNqbScgbQ1dhbuHIc8FElewbgq3041zrfafXMKeBjpdEC3cOGr?=
 =?us-ascii?Q?GlGEv0EFKv8ccI//gBZ2ab3RLKWt74osPr6HCoYR1PNnStV5VH+Ws+MsI6aJ?=
 =?us-ascii?Q?x4nHaeCvcP77XPz3jv7zMh7LmhFKeP36UZQdFKHPjgMF8OQFRRKDDe+pcE5z?=
 =?us-ascii?Q?W8pM0TUxMLkbby7Sb+qabLxn6u9woeeuHxArIVPwBqf7Qq4OtZTWJ6iNj4/D?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a71e355-4841-476a-0b9c-08dc5f196a15
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:03:14.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHrNbqAuFX6butCssYsLBKYfQ+SpN7BxwNskKU92ZNPHnxETDmlArSnMqZf2hcBaImfpHcatBmak+gyTcLPuUcIQbk5n4zFUQI4mNC8TYZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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

On Tue, Apr 16, 2024 at 03:21:58PM GMT, Daniele Ceraolo Spurio wrote:
>The mei support for LNL hasn't landed yet, so we can't use the GSC proxy
>component. Note that the lack of the GSC proxy means that the content
>protection features (PXP, HDCP) won't work.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I agree it'd be better to just add the mei patch when it's ready.

let's wait a few days and ping people to see if we can get it
sent rather than going this route.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gsc_proxy.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>index 35e397b68dfc..3a7ba63b5bf2 100644
>--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>@@ -446,6 +446,15 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>
> 	mutex_init(&gsc->proxy.mutex);
>
>+	/*
>+	 * FIXME: mei support for LNL hasn't been merged yet so we can't use the
>+	 * GSC proxy component yet.
>+	 */
>+	if (xe->info.platform == XE_LUNARLAKE) {
>+		xe_gt_info(gt, "skipping GSC proxy init due to missing LNL mei support\n");
>+		return -ENODEV;
>+	}
>+
> 	if (!IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)) {
> 		xe_gt_info(gt, "can't init GSC proxy due to missing mei component\n");
> 		return -ENODEV;
>-- 
>2.43.0
>
