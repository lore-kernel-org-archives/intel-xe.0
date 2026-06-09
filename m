Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8732DCD8C9D
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 00:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4171D10E027;
	Tue,  9 Jun 2026 00:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvBDWoA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5390F10E027
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 00:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780966228; x=1812502228;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cViz1d8KnQh8Tw5UUl93yboS8kdj+uGO1h0vYuJg+Z0=;
 b=PvBDWoA7qqZD/+VJVdbJelGENoUzdm6sJhm3LIv4wso345aOnWZONQK5
 LQFyEwCl3uDACfyusDjSVNOhz/YfWQWLrcT6zMXbTiA0NNsD5A5LWYBIa
 fpwCWQ0gMa9GP9sKYe4Znldr2TKVsG6o2rhrl3DbGjNbFm42hPwQ5csEa
 bxOyWgk81S3Mub0C5XtTjwYhNwI74R/deZkqs7fzlojGMKtgm6w9ZOim3
 wiZ36SOH0HDAEjgqzHwALGtMUQ+1O7GzTrem5htl7UvkmwSVRVO433/7l
 Yh2z18bgcf4U6bOfmJxAmCDmuDg8yRDBHrOCKdyzPFm3kNbU5LzPbiJWA g==;
X-CSE-ConnectionGUID: j3Zbd9gXRz6CD3sFOnlXjg==
X-CSE-MsgGUID: ImzQtzvKT/e+8AEixLvrBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81465236"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81465236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:50:27 -0700
X-CSE-ConnectionGUID: Ro+14gbtSDu6IOPBAamGFw==
X-CSE-MsgGUID: lUm7H51pTQi4DPVfvzcdlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250801633"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:50:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:50:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 17:50:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8S7WmNXTJpCWtpvcwGsz+15iqxZ4TDO/z8nP4xtfX9T6tetxDImgz9G79YMV3zrkrpbGcaWWcrfczHqlSYyQTeEOMR9tkVer2OPC3FQ7lZn8TAif846BMCx876tPiuB7EDmHXMgadslx1arU68xbnAdaDQ/kJwfhyxakIEO0CzB77x1Vc/sPJOsyVo9SYQDpY3AalDun8/jyH7X1pNBidwF5NyfcJt63JrWCcbPknv0cP33eAmmSS/K5qunDDTYNqTUibuJcPT+yLeK80F3LF0AZ3qLaCHsPGEmJ6OVDD0KFfQPFdeDyRC5lorkVTbykD4tisGERgJDJW1RvPqGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WxdbyLgIm5nbEzf9deecVx6VTmQysaz3i2JYvYezWw=;
 b=Mf4Ed2yZNSqOUXCPZ48HOcY+BIYGoB262Jb4YBtoVflO0pMQhAyRv/8BxS3lTiflfO4yRazJ/dnIssul2O388FWd+TPsE2BP5GsSJEgmy1c567/2U2Tgivx3uQ6XkqQwOd0ZLva9tYck1T/VQcjjSznmHX02pQ81BPITQNnBNVobNYOYSrmXpgZTgzXumhUsUk1kjGCPEcGyKQrpeby3ycdV6kX6syX2iGdAgVJ5Tt1rInwbFo0ppl/dcdMusBga7QftdNVhgMAhjo3M1ezJBXzzMRR1i4UHYSBvFEtvQ8iZ6Az2yI8ipF2CV/Yrcd1300VtRc8ev+F1uG12jUcp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:50:22 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:50:22 +0000
Date: Mon, 8 Jun 2026 20:50:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix wa_oob codegen recipe for external module
 builds
Message-ID: <aidjSmuniJLmR4Uz@intel.com>
References: <20260604074501.172129-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604074501.172129-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: e754710a-af0c-4c3a-9bf2-08dec5c115bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|5023799004|11063799006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bVNskRnYjbRwb1LcUI0+TJvZ1Y1iACYXkItPIfFGna4KcXSOXcLRxxmq2Zi6EaEaRlP/N+KAN8GB9p5fbFky+zhwo/5TKnNHIg6XaKiCGzH3aADR7Va0CQOrOhfSTG5Jz53ErjCCkVm1fJ5HW9/Vu+120+6kM5PoL3mIH66jtlWqJ2fp9VJYmBO+SHxJEJVSXQtj72YDB/n6rrHTrtmTZZZUuYOU62ByxUdIcLGuBB6DmYeJcZsN1SrYthdQAIChoUefoswNj1vWu7bLN0OB3VtbMYtfcO7W3h1+ANjnWXxi/EDCwEZtMlC7PX1J2BKYW9k3fMoTzYLtSGdRrfzGewvLqtJYzdrimAhwGrcAdEp053+C0G00rP/QHb2CPs0yser7Ib5vv0rY7le3rav3V42Id3JCKX0VEiWEyyuNPUS0MOJHSKvKtAoLdGgLwuxWYpjWl8HrMd8FRerzfSyz6Y6KIOC7/W4ztRjvMNIdj66pCAcqm+jn3ws5ChOvCjPkIXLWoEIqdHkBqnKt5auGQu9Pp/YQ1B2Vn91W6yWuAnF7hg7eZR8YRf7hUksDmrqgdKBRYHzCk7u/OI69FSN9j4WvMBonWeOtFe75gUxuibMfM1ssHkjWgUG1zs4pOE9V9xr/zRszjdEVcreRKHZUTIyy9BDoWhjzF8Jehib3lMw1iJUnwAcyLJ/5L3WysWF7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lAzgFnRl8gHWuS6n2JBuG5PaFe6IqpTrVj2SZsS1Dp0tdRhl2780EI5WCX?=
 =?iso-8859-1?Q?zTO2lzNtmnNlGoNXJro/+IxOP0dW+If40OXCpAYu/ta0O0EDxsYtUaU3NF?=
 =?iso-8859-1?Q?IJtCPnc/JRjs+a1U8ZXwOAxzsznYqEv4VLEe+M4k7jvUFZIvQl34nydanD?=
 =?iso-8859-1?Q?TpjkEqmkC3Oksi9qHMySwyP9OJ6FlYu6xNjQUDOcFQp2ugGZjIgt8Rt2NM?=
 =?iso-8859-1?Q?XzWByRepqyYkMITA0hDc9oPAJRgeCdLM5ACXLhVSgeRgDzIIPH56YNgJjN?=
 =?iso-8859-1?Q?fmN1eMTZhAmbGl03D2KlPcx4Zv3RSjJVkFHB++Q7h+x7WAK/oso+mvdXnv?=
 =?iso-8859-1?Q?UUKi4I5c03rHqVk6GBwDmEHrYJ8G7oPjsf9Eo4loqPqTZUd8A7ouE3lPAF?=
 =?iso-8859-1?Q?2iIdePQrNgmdH2RWdW6aKGITcWvqevjTZvMauYzJhpp/r+BRYT5At8SdFq?=
 =?iso-8859-1?Q?7pMdeEe2K+CtImGwvOKpHmFPjzTISK2YlwmIGHnmTqzygeVxQCz4YSVbh2?=
 =?iso-8859-1?Q?Ho9MJvXXOE1IERwQcv5ef3MyNamDz0zl2XhTd5OPPxp7EpuuLnvbxbfvkK?=
 =?iso-8859-1?Q?+2m6OzV3lRKGxdo8LC0Gwl0ZYGGyT4Da9yf0gh1Z5hfEAkI3jTTsP2ln/t?=
 =?iso-8859-1?Q?1we+EW+8QsQuLe29E0dhZCGkzgW4+S5J5aHbKuOqt6b1wUPTWNAGx29Kv6?=
 =?iso-8859-1?Q?M78Fw9iEh6767b5UlL04ZD7LPr2H19SAoAoDOkPUSP1i84d4froq4k2xPG?=
 =?iso-8859-1?Q?e9L+/L85wH9dB9+65Sl/jmH/C9y1prhFyQN8DVjISnAbc2KtH7A2DiIEyo?=
 =?iso-8859-1?Q?lt8MKwdBVZT5iAspwbuDRCyX1BspCRI+6CGXIcUxo5eGQin2ze6StmIGQn?=
 =?iso-8859-1?Q?AhKzzgXGspujdez7OXWCGRzk3mY4kjakF6+P7cJuMivq7BWseDBOo6edBz?=
 =?iso-8859-1?Q?PEbsopmGmYzLcXF2g11lAqCzc1WziYWCDe6+pJlHvTkIZhmqTwJ1E5SKz+?=
 =?iso-8859-1?Q?MuuQWMmnmtcjIs2wvLaGigDUiaCyGiZ4G61x5RREXNKDhbF5NKsF81PG7s?=
 =?iso-8859-1?Q?dV2PAQmfgQXc66JRKGCJGfGSDougQ+eLaywR6jCf6UJtGzz1P2PSCWNR3k?=
 =?iso-8859-1?Q?bdmGq8mXCRMxOQGvXjjKHj8PehGiNxZe+d1uuotCGi1EE2uh7N1JMS+h9E?=
 =?iso-8859-1?Q?JU21rwdqw6+RXI2DzTNCwKJXQX0c1UpyiAX+fdYFqtDFddXthTspfjehPu?=
 =?iso-8859-1?Q?ybMfUSfuYBbc8jViG2GHpk0c4Kv/JEq5OCAwaK5q70CH0D133o1rFKOSoF?=
 =?iso-8859-1?Q?XsrGZLioegdaUySglf1Crx3893H0lt6S5aC/CdqpSLMVkt2CGJlZKcEnnh?=
 =?iso-8859-1?Q?DfGlLvPNG07FQyTUyn6Fd6R5ou52u/TegJVsBfS7k3csLP23Kkasnp2t40?=
 =?iso-8859-1?Q?sIIyf9HnPYAVIuzCh56LcNQgXFfbPl4HpIjy7cglH3v9dbG6W5euOT0z4s?=
 =?iso-8859-1?Q?Bf86/mr56di0vwWSbRpAqpB3MQegPYQasvBjsJByzftVJGRkL0LflXPlAz?=
 =?iso-8859-1?Q?sqi7LQJ9Iam7132vcTC38/kezJHokFQfGwHClQxXVKt6+j4t893rs8VRsV?=
 =?iso-8859-1?Q?r0CpijLTSbmnJvqqoAVwnJw76SowaVOqrxCwEMCI0APKxWaEy8EZiCvnip?=
 =?iso-8859-1?Q?zCIDCImu4OdsLhJaGNtSqKSpK8n85iRTfnZVbo8tr0vK9nY2D74micxp9X?=
 =?iso-8859-1?Q?ThnxnvwGkfPi5pkGCAfXfpRrJapJTelgQ6T7MfwstPUXs4oEMSeCGAKnK0?=
 =?iso-8859-1?Q?xlsPANo20Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: TRgLMvHCzKoiQwbuaLHeo2G8/O6Csqc8dMTq2v9fA+3GCc/aAkeZiiASuem4RfyF+kNC5IGnkM/poVeXuEj2IBUOvbuArnWdc0OfLXiBNFEhVdFD+Pt1n2oes4Hab2tykItfjP2h0+oeWUyffYNTrWjLayycP39PQliqK688quE4+Fdxb6pkxTVNoLB+iuepI3qk/I8Ya/wIYd4JSkOuZe5qG6n3ci63qJSAZIQTtvXe1QxfsFjVlWAfAAD2qbM3nefC04uxVQIubh20a7zypCu9SIbaSODSKrfYZ5IDjEme6jh8wfRhD6WMce/tdNkMU37tEaNg63eoKcwEQ/cvYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e754710a-af0c-4c3a-9bf2-08dec5c115bd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:50:22.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKH2Wo3BBNePy0lDILJrcq6CLmpcfW+v9qBUKeIa216ql4fJ9QJO250oTFrPGzXpuZu+9mK3qA5zbcaokLvyOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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

On Thu, Jun 04, 2026 at 09:45:00AM +0200, Thomas Hellström wrote:
> When building with 'make M=drivers/gpu/drm/xe modules', kbuild invokes
> scripts/Makefile.build with obj=., causing $(obj) to expand to '.'.
> Make normalizes './xe_gen_wa_oob' to 'xe_gen_wa_oob' when constructing
> the $^ automatic variable (target name normalization), so the recipe
> command becomes just 'xe_gen_wa_oob ...' without any path prefix, and
> the shell cannot find the tool.
> 
> Fix by replacing $^ with explicit $(obj)/xe_gen_wa_oob and
> $(src)/<rules-file> references in both wa_oob recipe commands.
> In recipe strings, make does not apply target name normalization, so
> $(obj)/xe_gen_wa_oob correctly expands to './xe_gen_wa_oob' and the
> shell can execute it. This matches the pattern already used by other
> DRM drivers (e.g. radeon's mkregtable).
> 
> Fixes: f037e0b78e6d ("drm/xe: add xe_device_wa infrastructure")
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


\o/ - I suffered with this bug in my setup many times... I even had a
workaround here at some point, but I was always postponing spending time
on this...

Thanks for fixing it for good!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 09661f079d03..8e7b146880f4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -16,14 +16,14 @@ subdir-ccflags-y += -I$(obj) -I$(src)
>  hostprogs := xe_gen_wa_oob
>  generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
>  quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
> -      cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
> +      cmd_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_wa_oob.rules $(generated_oob)
>  $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  		 $(src)/xe_wa_oob.rules
>  	$(call cmd,wa_oob)
>  
>  generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>  quiet_cmd_device_wa_oob = GEN	$(notdir $(generated_device_oob))
> -      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
> +      cmd_device_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_device_wa_oob.rules $(generated_device_oob)
>  $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  		 $(src)/xe_device_wa_oob.rules
>  	$(call cmd,device_wa_oob)
> -- 
> 2.54.0
> 
