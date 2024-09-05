Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15411CE7A89
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 19:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D229410E15C;
	Thu,  5 Sep 2024 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eE5Uxzuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC6A10E15C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725564640; x=1757100640;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p7BkR9kMJ+kety6HuEvPBadTAIz8GS4KLCgDKTNZ+Lo=;
 b=eE5UxzujQ+/BLEpmn8cLtjtyQMHrdq2iFO4V5xe+Fx/HQ8LZeLUQ13XW
 wM8X4tTl/PJeQqC/ZEU/6ToL+/uJqe1Wrlx/C74xo4WIKhZCjiJJduOBv
 62zZYRgFi+MGCtMDVJ7jS4yJWXhBJqlA/S1hFaEQsPyX7Mnoim73U5y8L
 niUFS0QA6Rmoz4lTPXb8WtIqew6dt+HVooMaYI5qkrCtyUJVnxG02pVkh
 1HaQ8AO4c/uR4drmEp+A1hyhuwJvrRskaRv3bJn+52g9rw2qxswGOSAF4
 uZQ6s726Xwrsu/sTpEtvQll+qFx+7XfP2NgZbT/KMlassPJ91wSOiSIRf Q==;
X-CSE-ConnectionGUID: GDl1peXVTkuipsV6rR1kZA==
X-CSE-MsgGUID: ZH3znmstRbuF+TP/kuk05A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41786596"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="41786596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:30:40 -0700
X-CSE-ConnectionGUID: 6Aax1eLIRyi4K/ZovUt2Gg==
X-CSE-MsgGUID: vmCeszyNREmLGBfKPzrjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66271580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:30:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:30:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:30:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCkbZOs6e7s7OAU9XSWUvyjojbDMMZpEuvfRFYml+v/dQcxnE6S3Msm7tIy12/Q8q728ZuVWm4eQ/rY5gtH305CXsSSP2SngH6akQdMm1tcbHdMp39mV9CWAgCO235PvBPq7sZ9XQlb/Xs5rin8O7YxDhMEBl9vx6AA0Tpg6FBOU7cou6zeyxrsSBrVOCTfkosnzg3NKYs+dr9GstrdKrmbSl9znNGR25VVYHe4mgdXQ+kLKoXVfU8Sf2EbzZc2Lq2GdqWLFj+gcGO1gMAfVMOwmqCBD7TdvB4EHEyta6x559iS4TwsZa3wYb0p328yVdEV4TifssAvJeLBBJStiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHJ0OgY/ABqzw2QCpkKzsyh4dMunbe/OpDsXYVjyHSM=;
 b=Lls7dIk2hvFOTuzc/5x7ERo1TvAxo2Ai0UOsJmJpMCZc8R51/sE98yaBxYnDfZ9j5R3eoTDrPRCubbcW2+cULS2QtNXIdQfulVlGGGR//NpcdDyj2KAk44x+C4jYIp/bxstFvsF4/xTGRiz9fa2spBkz1JBbfRH1hfw9I78tyPy7Ekaf6uyeeu0AXNZ3VIAt7IphM4wBHnyHOj1LgX2OewCRirK7cBL7OQcy6VbSzgHTETxWkiDu7zoZD7Qe0370wfiplDSjnRJ8PYB/zHFvUUUdPV2kriiU4K869e1klDKY53t+9S0BkX0IIqraskjS2uuBylgroKGNbUN+8D4AQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 19:30:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:30:37 +0000
Date: Thu, 5 Sep 2024 15:30:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC 2/9] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Message-ID: <ZtoG2dWWHKaq7P8u@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830052326.3707019-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: aaffc942-971a-4390-6746-08dccde137c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9094wtBc3rWWWhr8k2Tvz5cQx4oFU76fxc9sh/5qZDSjct/xsWIb0H2tEQyy?=
 =?us-ascii?Q?Bmf1CjBI52O+L6JvjEVtPTpH49BaQQGcbJid/Da8BtRscn9l+Vkc4yE0DyuI?=
 =?us-ascii?Q?JYrY9I2H8vf/wdrA8add6cgFpbfPzlAb1t5fvGXnkw4TiNvArxviQ65HPEMS?=
 =?us-ascii?Q?vQriDtWHp71yXuLrlF0OQrGiWrWEtzg6FymvGn60mfPyreyIUa1oYOFEE1Ct?=
 =?us-ascii?Q?Q/6MF74XoQd+eynyFf7B7oOiI5XjW4U9DoulzA6yap/tYkR50EQkclex/qsd?=
 =?us-ascii?Q?/hVa5QqOUFECzu8Vp/zgxlLs66jvEYPgJxaX3ZIGOQ+KHfmmJLBXcWsHJGzo?=
 =?us-ascii?Q?AJFo0h46vEehqnOanxmrfA9ea7UKDEI6TC1XgF2RV9M6PIbmrr01Vldh5wCl?=
 =?us-ascii?Q?09M7JUbVZ7pWX2zfogzEUO7XPDmkqN7fQb4u+Pi7kTpFjN6mGyAhUmVeysdu?=
 =?us-ascii?Q?82yc9yzB60XjXBG4wEHsT3Z4RdwX4Ok4kL5KSpvaTVNgVQMIoXTjhXkH0Iq4?=
 =?us-ascii?Q?7y02BGgrbGAqWNLnCCWPtdwADzK1lDg1mr+UaC/PANsmEjaih4L58lV4QayN?=
 =?us-ascii?Q?lVC5TwkI9P6HciGW2q3e8rrrBTwxE29Hv1GdfP3vPKLMRq/Nxwoq7z+sRYZs?=
 =?us-ascii?Q?nPtVq/kR5vogsJK5S91WcLPsIGOWSLdnBKbSzhCvwd9RgmJhL5jufLtt22UA?=
 =?us-ascii?Q?DjoBcQfAEomczQK8O8L+4lNalIBdBVv94nYz9zolyEeYOAAeReJA4U3W4KHS?=
 =?us-ascii?Q?ITe2LM2mkCAY3fIKoZwYq3Y0ank4i0HgKMNR140NNSaCIz1hWr+1xknRW1ml?=
 =?us-ascii?Q?qhT6wPUgSXGjYB6MX3AehZoiQtZ2ISt++9E1FWnOsxn/s7ozQQZzi22VBEbn?=
 =?us-ascii?Q?Hd6miwBo3oinP9fNij+3ocHozHXiP9bX/kJc1lqEFpIyU16A93dTcgaSU06V?=
 =?us-ascii?Q?B+6rD+fL8Ui2oyrU2vuZlwxYuQS0ZaAvuSxqy/Id9bDPtECtAcvXEhNgEbtz?=
 =?us-ascii?Q?2xVwVCNHCpN7fNlJel3cCuQVSK8c0XEQ+dVvru7v6h9bDjQSMM7WPbKtD8DY?=
 =?us-ascii?Q?mpj935ZCku/zQwcik+3l4tARM9+KW7Ibd+iUgXebmWc0xm+NCKDlaR5PqSD5?=
 =?us-ascii?Q?/kdotbgGYW25uCmKJhQamC6Yq1gGHjUcU8vZTjkQjCJPHxvVcTE4scUj0rxM?=
 =?us-ascii?Q?8DT4O7kmTkLUCjoP6PokUhd3qCAdBRUCwKZiP4VkxGgnmE9/We6lVuroOkGS?=
 =?us-ascii?Q?W9q64XdWPwGYSQ5ihfMBbi8RrNHF/Fxo0tx84dzgySaJprnrFyc11XopBsVW?=
 =?us-ascii?Q?Sr2LlmJ0q2FgGE8SkOG7NXamO6VI+oXKLI6310RgAQX2Lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?spfyUUxdWmjvUMBwzcLNqqvz2trEl/WY135wzLk/VqMOOGcThL5HIurNKJ0N?=
 =?us-ascii?Q?KYzs06VhgB3206BNtsFoxzQu+VeIND3+MueW4lekrhgEGowzF7inXzc+l4iL?=
 =?us-ascii?Q?soyehMdggCpCFi1FTzCXb6JjCMwwWh/IANE6+h1e2enDi1zV1rEBzS/ZYjKa?=
 =?us-ascii?Q?0DMIzSmwjTkTdWcVrgAs5mHWiRRc0DzCrrADxwhy0+ePU9Ud2qjb4ylGV2iU?=
 =?us-ascii?Q?k5B4vDsfhu+Ll9KON5HyvTXhMvBFWTc7OOAGkZNrXFRMOoZYrbH0W31ivIEn?=
 =?us-ascii?Q?Tk59Fek4TEih8xINwreETCCED4GfmV4hmgHGpPltOIlepxUvoAd8+wF0356j?=
 =?us-ascii?Q?aH5MVINPlsd3atyr+iUgg8QhwVEDwv42GgxmXvh0BoXe/P4AiUHPj9g1z404?=
 =?us-ascii?Q?fyFnnuX/yfuRq9eoayjU8sBPwhzY21hSlRNVPEW2X2WbxBJJqCShMjyAFXUy?=
 =?us-ascii?Q?g9D9JuQtIqqtMwP+v8eyGO2JhC9UcQcHqEk8/CCD1rFqYbGF0ERXEmKaFPw/?=
 =?us-ascii?Q?XQvxa8ii+sbMw9Iuit05+ojN0nTg4/s8gCMerhKBdpNdZgy10GLdGD9lCsgK?=
 =?us-ascii?Q?mUM3743mCVtOgQu468fS2YMKA2NkjwK4orsDzb/EzimjdT3iOKHCuF0nH59z?=
 =?us-ascii?Q?xkPZ0M9jaDlcoSzprjH07fdUiHNdzWa5xLsXJCbvf10QerV12tuc/AUVeyKQ?=
 =?us-ascii?Q?gJj57ALu1rVrCza02qOT2KzWqegshW67PTgl1nwHgvvPQ/4QFDIyvnUFEed4?=
 =?us-ascii?Q?HXBzqezcb73KYbqVzJOC6u/sE4KEI7yygs2XIhfIvLNtudHWQwmbinYfmCOI?=
 =?us-ascii?Q?o/39oXs+xGRioGq1wiVbV/62EZcwcsizG3v9Y9Ump0ygURhMax6tX6fqal5Z?=
 =?us-ascii?Q?n+ITzcMtagtNmEp5lTxX12VjxGnz6+GoH7Q0KRk29fT3XCDfIw2+5o8Mxe/U?=
 =?us-ascii?Q?4aI8nMwse326v4t11QAUGvJh94V6QuRCe34+ryDow/nygbyVTK5J8ytpXSbt?=
 =?us-ascii?Q?Mwqp7Vlyfa1MxXLKRNU8mf1S7sgS9TIui8xTbCznFV3hAQ1jFUTkOFUAaviL?=
 =?us-ascii?Q?8OThtHJPSd76xHyfhZ4+WUAvw2ngFCH4A5CSH3MF4EFV+2vNKTaWkPCmnh1y?=
 =?us-ascii?Q?WN/36pnbQvxQ6XOoLUTkAI812vOwQLwnwQWInxYMleOUBXFHw+SHxChx5ERu?=
 =?us-ascii?Q?g2q/Tm/I8Rvo848C32FaQcFycvHY+l6marRP/0nKdAhis8K7YFyJ1apoCnMX?=
 =?us-ascii?Q?Q/Wh+ElWbQr15zmJJyTHQ+GHmcQ9R348ik9sbNn3YGeFtTRMQ2v0zbE+2R8p?=
 =?us-ascii?Q?zXBiEYL3f7IyZu5y67OTbC9mxuCxVoxFhcQaHvqCM/AXfPt8VYO5RaxvaWvL?=
 =?us-ascii?Q?4ImuV/5o5jpeF/25pJnoUqAvX5yGh5BU/lTIWLq9xNAFiWt8XaXzw9t3t7zT?=
 =?us-ascii?Q?hfe/he2RyIS7NmpkZL4G4O23z49Lf+Hqm8F3WREExSRJIJ7XiH30D6Nz2X+4?=
 =?us-ascii?Q?PPtr61VIa6TnvUgh9YC38iNyf8pTFM/o8gZLdYouUXhY5jMH0OO1xHEgpZVl?=
 =?us-ascii?Q?qG7ZHGqO/eHi5yIXoufJ5ILjMw1yqdFH2najMp984Q2Twvc+LCVTzE3FBG2d?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaffc942-971a-4390-6746-08dccde137c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:30:37.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggTc4JwIedO4sG7U6jalb3NHMa8RNaSkf6riYVLy3Ki9ho7xa7oYx5ZxlsJloAFf0ot9xIIvSWT75i7AkPzVkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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

On Fri, Aug 30, 2024 at 10:53:19AM +0530, Himal Prasad Ghimiray wrote:
> Add __must_check attribute for xe_force_wake_get().
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>  drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 8aa8d9b41052..9949f2d7ee63 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -162,8 +162,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   *
>   * Return: 0 on success or 1 on ack timeout from domains.
>   */
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +				   enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..8939fc0fd09f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>  			   struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +				   enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);
>  
> -- 
> 2.34.1
> 
