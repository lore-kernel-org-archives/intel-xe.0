Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CC2CA9EC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F8910E501;
	Tue, 13 Oct 2026 00:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3362710E501
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791851304; x=1823387304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+WwIOzww7FIykK93sjxwm7yjg0EQUDtID71aVY6bXWI=;
 b=PV4VVp8kW2MgNY3i/wk8hkMNfGcDGJYl8PnEGNb+vDHueRNk0Dyx3xI8
 UWBgbx4Em6zrX1Xw3uBQshTQX7q+Zn24ALItCaoYlUjC8Wq5mTX5VcQ3B
 O3En+n2MPRkLvgKe+NL8C0CZCpiL6blAVGMriwsVOwDlvz346FrubpEUf
 iK8Y2GnWs2lcQWbRUnnYmTLUMslgOCibATIVnPFM7FyWuOcyNTtgHld1g
 URj02yjzmygmIwk5tCvTMGpWcJz3UI2v0k9drv2kv9fRe1Pu288PgCz2Q
 KaYNiJfuh4c7VtWI6F+P4v8KzFH27ycJizEkniQaldM2fSad1lCkEbnpp w==;
X-CSE-ConnectionGUID: sZONoP6pTWyOWPCWbc4qow==
X-CSE-MsgGUID: 2+04zr20QnS40LrZZx/WoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="665149"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="665149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:28:23 -0700
X-CSE-ConnectionGUID: jXVU1szTTNywTsKxSx/uDg==
X-CSE-MsgGUID: qolThXz6TfWd7ScCy/A96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1351344"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:28:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:28:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:28:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:28:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5Dm4jxKbo1mSL6ShbxFIeyy9+OU7wICoWHJN4h3HUir/HRj3UQ1erd2S/XuZkvCMDq2ku2L+VXeBVsOuH0atTCpNkcZeREAS0yuEBHgi04aNt1g2O9na10F2o5KvNyV4VAZRCeO82xy7BwvI/TNS82Qqf8qnWnx/wkPNDLvlCKIE5M8PUU9Bsgzj1LAitvxmbwTtZneFbkhWdl227KHGdiuA2lbk1UNX5iTWMfrOeK9ENKpdeChSxefm9ZCnMScuBwaaPQEspkD1UdCKXU6lvf6wGwe0ldEshgbjxn4wl2WjZnuh+qEoEE04jrOdQoAt95kMvUGIjFgqsY05PT5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6XHsG9Fde60CUZ4ctB1RWVsAl4A9CsuJ/YfqjGbLO4=;
 b=TVhgpzVzHWVXOclKutLNbYSV+hNo5VKUDb0V6j87Ir/r19jNloNl/7NM2VuOjgBjw6RtLLpWQnCdpu6Rn3h1kLQ9l2RktXiy7JmI7Z//1xB3yj/fytPhwi9Q7BhQsIxFGDsdLPj9mc8wmFVM/8f9NeeBOOwIolVMNK6aVQ9bLP2jUFuPnNT+LqQtRRccRHl3VPBUez64w752IRdk2oya5SgqTWeRq5Wb23ATT+X9G3YDe3YSNO5hRuTgtfOOvFlxyk2z4EgJneJjpU2vDIKJndcKVyvw/euTz7TG2U0ObTrUDvDNBsXxl5hRGTRHzF9lixO3b/otCIgpcWm/AlEttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by CY2PR11MB590615.namprd11.prod.outlook.com (2603:10b6:930:111::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:28:21 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:28:21 +0000
Date: Mon, 12 Oct 2026 20:28:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <michal.wajdeczko@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v9 06/10] drm/xe/sysctrl: Fix mailbox header handling
Message-ID: <as17EpmqkfoSG0-b@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
 <20260924060900.146167-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924060900.146167-18-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|CY2PR11MB590615:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f7e146-7ef8-4cb4-4d03-08df28c0e1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EQSLeBoORDHSTZ+KoVQ6QhF3VPPXDx88dejdgok/Zmx4DZbZZW1VW0p4VWvJrIfVSJlgTQl4EABcpLNcDS0PEwNJLtqaLPo8APnCC5RgNtVJ2lHNW3KixpA+H1I02P28zIYKCeJUE27arEHPp1v6FI+9aJ9YrUxfzV+4IVurtk+wRQNOR/Tkfv4pO0pQaFgNcQSWQ5nNVCWKVwoShNU9zyKfsHeQLCti8tEd/Fd+zvoQfPfMsVAOlmYhM6fzGPl8tbEhP8j3v1RjzYv1ozbS2MdlA8xrhqz5ZhCsML4LIlGNfvd9UR/M8RoYRzyi15tIPsO4ab/59G1VsDnWtnswTlRa5dInCNEBzaw6+qYjAZIqbGnbECMqnFuWFv2eC4zXvhy44IlqtqzKDYNv/1tESl5hidZvio2rX/uPYN07WrUqknZN0w8x8WsSxjGLMJWHHKiX7egI5B1hMVSPgidc9pFXmQNJGPxQXjGElkOwp9UaE093b304tyEiqyJ0pef0wdgaI9AOkpyk9+nTPNia02qEvFE55Zm5Om5B+ba9IgJ3y0lTJ7wU/ylECklOc5hU+rjZ+qzfsIwyD8DqJF7kfiY8s7yrMu/A0VkV0fJ3HztlQY0P3+3PWt7qw2StqDzfj1Xuggl4NTYhlsmjsNSciPzya24jwNIkFJhu1UmJQLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e2QCnwCrMF4Dr6Gi457A9P13fS+LWEXeoTce5uiO8vE81F2IjDquShfLbXPn?=
 =?us-ascii?Q?88nAXXWIUZB3a5+8U7Ri9hFH8zbw69oqfGHoWMirA8izCKrYjcA1Iv//D132?=
 =?us-ascii?Q?/wmmjrcO5nhl/I+EYzuQbg2g9wX0KdfqsqsxJ97N/04KWxgXKxtfFdRQRC9T?=
 =?us-ascii?Q?Xntt356usIBI5749trhQhgaILGsa5mDpxqBQSph7J0XZnUZDHWeD4HNavQhq?=
 =?us-ascii?Q?RK/W9v3s1HLfCmidTIyshVfv/1bp3yp1z0JsQ46JC1oCe5uGkBtT1+/TVaN5?=
 =?us-ascii?Q?mwaPVC14u7zGDHByfZDhruZCWNacVa5UkVgKKe+P1QaknVz53o/T3tp0ZUlK?=
 =?us-ascii?Q?QfjeRvWe9SP/i/Bew5xVEipriiv7F07xKzm/APP17wzaJXT0ON2lKXbKdf4F?=
 =?us-ascii?Q?hwj4B9NCfBh9O3hxj7cUJ9x+bp4KMbAuCnX9cVEJ6WMhjFnKoRNf5EedK+ic?=
 =?us-ascii?Q?5VOzO/ft2vu3D5snemChAYrOTkKB0j0b5OdiDIkGtHGXZozphI8eu4ILsXCu?=
 =?us-ascii?Q?3yulUrGaA4e05jC1X8JNyuTShiFb0y8XvNUpWuFruzJfnfsenbhVXo47mPr8?=
 =?us-ascii?Q?k8idhhbKxtl8R43NZdioTCpLRWIVbMNJEcXbCZaUAW4GlAtY6AuBJo5tRQvp?=
 =?us-ascii?Q?TDXu0CLM3fazd7XlLrEOkceAq3gJoJS0nWYuTnMlgV0JGTCjTJCe1hX/IMQk?=
 =?us-ascii?Q?RaEHVk2/Ba3EKTfU7XaOAlxJMj2V5S/unT/VSwHqMP+TLSfMVgzBanN8LTMg?=
 =?us-ascii?Q?xFVuP/FLPWdIURldua2L/61pMMEhVCzsZuEuTdZwHo7Sl5brZQiMfSadm3TT?=
 =?us-ascii?Q?+AbJf20SFPMg/tEJQ/4AUVHcu4/ZxyqyZgKnQvLHriy3QPo5dA+PDFKU/fyo?=
 =?us-ascii?Q?VMoR3yfACw77N9czzS2g6Th2aDYTa2xRufmchp4AkQyMrL1sgOTwW7N8xJk4?=
 =?us-ascii?Q?hZDrifjy1EeVFMoYVuDp1CancUgWdFzy8jiAEqOTKwML4IACtxAFUwcI/HrL?=
 =?us-ascii?Q?ZMi49psLOGQ5wNL0Y9rZdBS9sW1pgEc3OWKbUQCahAoKof+CSzh4PvSIFOuC?=
 =?us-ascii?Q?TDjsfvfvwn0abJzwHPlJE5eFpTnro4OLG+L3PETsvAPPj7P0+Qhtbx0Z6J0G?=
 =?us-ascii?Q?aaXR5Qx/F2swDUodWsfjLrTrmQfENQborp2oOUKr+1IGK9VqI3SdLkTVJyrg?=
 =?us-ascii?Q?h7YO3p+mYJQxjg5Usv4HGmN5OPxxz5jHKvd3goHqO3cozXY523KcQpX5AhGn?=
 =?us-ascii?Q?YXDwmi7OVM166wCrOR++0DaaGmgRmpvqh/lsjF1x4xfg+cqaTp3QHY5AHj30?=
 =?us-ascii?Q?ZqIxxVigTt/ZzWzesPnTaa4eOX5b7HfkPFVHE29bL/oO/2c/KSDMaPyBPhJ6?=
 =?us-ascii?Q?rWgWWjjGJHUoWrcNVuXGxnN21j2cnh2embV4MxNpWKtDJCjW2LFtJdpKyNmb?=
 =?us-ascii?Q?e3O8PbJzONRHe2M/QIdRih/MmHpwB4Jz3r5Gg7qExJ/5PL3qXiOgzq3FJlSU?=
 =?us-ascii?Q?TuFO0qw0Q6NyBatdH98HtUZ07DCU+4QFaiyWqc8c7l7tDoI5Ppimjz/imfcx?=
 =?us-ascii?Q?E0Du2zReiM9r97u0vLU5FCG8PRnD0dwRX58ExAieeAQ8StdQAI3/AZauRQh7?=
 =?us-ascii?Q?L9rYsCqPr5DNb2dbKZLduhrJ4LmX9SsjwKEt59XbFQXNdjmR50Is86QlmFAt?=
 =?us-ascii?Q?8fnGAfHwtWNCPxPXzVrUWOLPgr51Gwx2nP1S7OZWiCI0Gy//G5ztnFl603P4?=
 =?us-ascii?Q?KwDugCccLe+Sr1xyhPJSHVuVqG0mul8=3D?=
X-Exchange-RoutingPolicyChecked: yYjcBYPSmOFISDZhVXn+yyaUYij5Zfuv/3NBKIzlRYYDMH8AgJE4GN/ec32s6sfTZ8c3wJOsIbnt27LAfZWXTJXOjMiUZB4XxImqz/sBJYI9/X7pJrg30i9eVZHe6HS7r6JbpfNet06QwXZ6llEbHyjbcOns2gTtj4ozU8tWku771CVcbxVkTNtvjO0xNxMFKuEaLcA+NeoJ7BHp6+qF5y9mt6KkuoRA3yzZtsRTKxME/5WJcFbNgIzpXhdnsRbucGUoaEZAAx8cXld0VaU3Q4kXUKlgrRD1xeJEoBX5q1wAkGnl9dKTbQFBPGBsuRrO4BcprZvhzWSAAopskHWhqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f7e146-7ef8-4cb4-4d03-08df28c0e1f8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:28:20.8155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9NPhbrNSWxpIiUa85fckGO3wGNmxsFWxLSFKETlsz9j/ee1d7iO1g6crgeF+dAPlqOXL1CgRCdKeaHIKXtgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB590615
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

On Thu, Sep 24, 2026 at 11:39:07AM +0530, Mallesh Koujalagi wrote:
> The mailbox header was defined as __le32, which required
> cpu_to_le32() and le32_to_cpu() conversions whenever it was
> write or read.
> 
> These conversions are unnecessary because the header is always
> handled as a 32-bit value, not as raw bytes. It is written with
> xe_mmio_write32() and read with xe_mmio_read32(), which already
> handle any required byte-order conversion through the underlying
> writel()/readl() accessors.
> 
> As a result, the header value is already in CPU byte order when
> used by the driver. Keeping the extra conversions had no effect
> on little-endian systems and could cause an incorrect on
> big-endian systems.
> 
> So use u32 for the mailbox header and remove the unnecessary
> endianness conversions.
> 
> Fixes: 1f95f618182b ("drm/xe/xe_sysctrl: Add System Controller mailbox communication support")
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v9:
> - Update commit message. (Michal)
> - Use fix tag. (Umesh)
> - drop __packed.
> - s/simplify/Fix/
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 2fb317175922..2e4247914bf9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -20,20 +20,20 @@
>  #include "xe_sysctrl_mailbox_types.h"
>  
>  struct xe_sysctrl_mailbox_msg_hdr {
> -	__le32 data;
> -} __packed;
> +	u32 data;
> +};
>  
>  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_COMMAND(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_RESULT(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>  
>  static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>  				  unsigned int timeout_ms)
> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  		return -ENOMEM;
>  
>  	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
> +	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> +		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>  
>  	if (data_in && data_in_len)
>  		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
> -- 
> 2.48.1
> 
