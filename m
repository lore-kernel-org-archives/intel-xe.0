Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116ECD116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7910E437;
	Mon,  1 Dec 2025 17:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwswoOsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421E10E43C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764611044; x=1796147044;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sYzeB9t6A/5OvjTOoL24bSmQUt7EGUNfWWK6HQt/OLE=;
 b=EwswoOsr+z64scIjTTJxIth3Npzs0+ydXEEvTOvtVw0rncRhdCkW8/By
 ezDBnXyLOUjEFGOIl1hFIKhb2fiOv9fsewTSS6bvASHgch5T10ENtSzOv
 m6udScbSusGLseJcUE8XTevrAqgcZm0d6MBBHj0EWZ453JBHraeZSXTLW
 fXeFu7EKrh8HVXbUxXI0ZyBkdBrfOvfTssrc/IAGAxltICyS+Eu3r4NSf
 16Cl12ElfaPPvCOdS5EDcQ7Kxb8m1BP132N2udfpOqOd+E9xVEALi7MOV
 Uqy22Z3SVHJVkaOQ6DJHmhBBdA0Ams1bNAbtNJ1QPsYDpytSRNeNvcGET w==;
X-CSE-ConnectionGUID: Lvfngd7OQdmhR+npOm8sCA==
X-CSE-MsgGUID: l9tyS+KuRpe8PJGps0gRwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66517250"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66517250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:44:03 -0800
X-CSE-ConnectionGUID: Fp8/FUCTT5a+Mvh2yoQmEg==
X-CSE-MsgGUID: mpiV7lzfTGOD1bZDdbIC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199263771"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:44:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:44:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:44:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:44:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGPpT1gjdPyjYdWfBfLLWjIw0zi66E281nDjuVYxmJTu56wpqAAotiolykpAAGctAvEJLkF84JmoG+ing5gn+U5CL9jMeZ+83BmTjv3L4xRhfOe1J86gpJgKLWOANF2LB5kCVu8PtA76k8OKWLT+bCAlMihoERQvB9nRwL4QQPlVFg9L0NyPWuPIuDkZ4SKtfi14lMxTqR2rfhAwkDV6A50SwNgFd6uSghjxliJe3xH7jKfQU+fUYzqet9jfwdqVEkKtyukEZRaHTFVo1zhdaGpFOuPX5Mt9OMWDdSkyIUMZR4O3brz4LC96xiJrRKYyGk+oiKP+nU30aRfaMBSemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+Y9soSlDTO7UEO50+1RpqdS2Q6drzvanvYEqvfL62A=;
 b=OPsl0n+dmJEQHpggQc0vmu1czPzr4c0mbWLUCL2IlrMpxjgpZOnXJlq6vm4OG4AEf3mMCzrdlDl5Kgy9hBt9MgHQxU2YJiMVNChJtNSwDVW/yDB65hJpNb5Y4WZPe+p8fhlt4PYNO8hSUfEHkjDiv0Pd0gyWbHRWPz5X2XU4j5L2g4AYwItPYyFnYYMKHakAad2VK78iOyVokX3LQv2poCZFAkKLCIePQUlo/LZZCP57cIpg7tY1MYjQ5kb/DPQGUI3eRQple8xVjaxfBqUvH6x7H5veH6ACWxWiLqw7XMn3bSpQdJUiCGUV0FRldxAZKQmXXG2uhhUYO8DwEuxxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:43:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:43:56 +0000
Date: Mon, 1 Dec 2025 12:43:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
Message-ID: <aS3T2crA95cvORV0@intel.com>
References: <20251201143420.3158372-4-riana.tauro@intel.com>
 <20251201143420.3158372-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201143420.3158372-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d429250-1da4-4385-4d77-08de3101336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eYQ+3kDvP6LKNCP1c7kgyQdmTDxhxScozrBweHta9j8WeBuBVwxkSf24tc5F?=
 =?us-ascii?Q?N2i10WN+eSUGnrRM7YTNWVmhWqbUK/B0rzG0JeeHdf91giU5s/AmxOPO9bgG?=
 =?us-ascii?Q?1AGGiwSSYpZfnTRm4b/b0sVXAkswqVIe1myBHTgYhMBrsAmEVCftA0IWkcuI?=
 =?us-ascii?Q?Bda8HKGBoTso2I0ktUOp7yWGIkr4B1KbTOUqZn+I0WxaIt04sy5xDqsSv9nf?=
 =?us-ascii?Q?j50KkfCPHPbxT87kPrf4/zLug1z8n6b9D9GrGvAm5kGhw80QZ9Xx24ZCBnUV?=
 =?us-ascii?Q?qdySF+A9SWxuE1SsGI4lUm4YXYygwWOV6P2A17eeWKJNhJ1VSqHHzDu7xpHg?=
 =?us-ascii?Q?VwrMVEDB5ZvnhSWLTQOuUCj6V66YH15VzkdN8rnIHoZO3It/90AXbQlhoPjz?=
 =?us-ascii?Q?BBzEX5JIhJ5tFCkScRViIZoyGaQXTCOymta4t96nmpwZ4F94eLlAzAWjBNJs?=
 =?us-ascii?Q?cj69VakkUk2xGxj4ukgfew5YJM82ilpc0/nqC3st5RUvm9w794YgNGyKtqW5?=
 =?us-ascii?Q?oyQMn9X9AcAbg75G+cSPYQnq6uk45IpPraIct9F2WAvpuxn2YF1cRfcozE8r?=
 =?us-ascii?Q?kteCd7SGvGnxXvbv6ui5+7SQeJkWn1+j97ZukWASYwYXLB/LZ6BGaFQRL5gZ?=
 =?us-ascii?Q?no+p5RTEkeI0LCKtKQSbzhn/eXM8ADlPJCbq5ro+CC3Ef3yJFyQxCL0BxosO?=
 =?us-ascii?Q?ZCTe1AMoaFweC122S3WjMQTrbUNqofDc0XaBcHmOTz1qTDaoAlCL747OxP/E?=
 =?us-ascii?Q?eFV92sVP7tmCbJ6pH4BLsjmJSXPYI9xzNbyg9fdyILclWcS0Jzwp6CCXxfKN?=
 =?us-ascii?Q?rbRjZ78SNTktswsnyE1q9GehN7Eln992a6EJCnG+Pfwfqmj2/GfdVhZ8f30W?=
 =?us-ascii?Q?FwN41ezolXlP1SKm9UhXKg4WOHepUsOZp0bKE/XBkByI05cKiRtKmm0qfMVM?=
 =?us-ascii?Q?19uzifZDDLCrCuFAF6K7Q6H5idkj5jn87a89O2FSpsguLODWsX9veU941ZaU?=
 =?us-ascii?Q?GbwzN6TWCiH6OQcosTspQtMoyJmmaTL3YVoOcjeKAGzFp7dhQQQNfTsLf1/7?=
 =?us-ascii?Q?abdtCH1jdzexRMgGQKM2NCJA8TsBCU1t5PxmzmJ9FhuM+2mfnTobkObmgkDr?=
 =?us-ascii?Q?NDgQmc9g404FQnzur1JDAXD/6nbaRqImQphMdpfhkMchC49A16gDc1Qkc0vh?=
 =?us-ascii?Q?9GzYeH4XZyCT1Y0xanghMmXSmFCCLXG395ehbj7yc57v/aU+jcYgEKNJlLNq?=
 =?us-ascii?Q?AeE64rHB7zQnWOz/IP6aIDHWFMbQrBsmEueO7mPg0gJmqPZO7mM3oDB9fMcF?=
 =?us-ascii?Q?HnceH8lyb6ava4DzC2UJKnzKDv1pxTfWJoyK18eF141EyttAmEhCqLU7H1dP?=
 =?us-ascii?Q?T1lI6abilxmbjHB8Ds/ttOFdUC4jpEKug1ozSvitGJlsUZesf2IlPdVyC7U/?=
 =?us-ascii?Q?6FvVuWSvgg+PF8D08kesIimn7C2fQ+9g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXtfYScExPJodskp0kK3+4VAgD46usmUcNfDWwU2jf9/pG8xX8O7TT6dxAUn?=
 =?us-ascii?Q?f15gwY+50h0F5NJd8SLRr6eCZFJXkCEBosE+nJrWwI1ECzM4AnJOo6FBuu2R?=
 =?us-ascii?Q?0W5mxAQfIEIGuzty/DBQg/AAYw+zQNuZxru8i89G0S7nGgOtILxyY6gJYhQl?=
 =?us-ascii?Q?u2fINTwczCsaFsby77/GTnjB4+fiflXuMabkYtKKMPsjMa6nsrLkIuqPynvu?=
 =?us-ascii?Q?wiZO1lLSqnqg9OtZ6XZkuvm7ZTfBTN5mgIjs4woUezf7NFfhKMfEViRFJRHD?=
 =?us-ascii?Q?qfNk6OOGfg3HExHpMx8725MJX4D1x7Cz/NkxTUF8O0KAVOZb0P1j/i1E7Oz1?=
 =?us-ascii?Q?r/m0XbjF6+Yd9Tk0znoaDD6CBfBsyC9S1S9Wyw9spOUeL+WPnRd5acmMDvZj?=
 =?us-ascii?Q?auNFcsGit9KhK+gySR5XJ/XWmuzIRquus1oVHuGaEA2pA9ToyBOVVGl9X6oO?=
 =?us-ascii?Q?+LexzOakWSUSjE/otONJWB7CY/qkcxuPC4XXtJxKfjmyHpSbXLqiOmLQ2Zed?=
 =?us-ascii?Q?F9I1w0Y81qEBcg3LOzv9Ty0NgLfJAn74wGLn46WCvcpaeIo2481V7ACwMz2v?=
 =?us-ascii?Q?Hik2mc0QmRdIOF//7fLgJ0uBZEtjgnU3gtov0KQN/kLsGUXzcK6p4Jlup9tB?=
 =?us-ascii?Q?xmicF+zzYEd+2beQKIJxMZqnwpzGJXU7rvL0feN5LGBkXE3Z03pqTSSS2/wT?=
 =?us-ascii?Q?BjBcKuuDbZrJIYCBWaVBtRbMJAKPMW8LHLnSc3++E0szylt9HiASKgZfanzm?=
 =?us-ascii?Q?UnpjA6xAS3pTf50f7J5lsf/izioBtLjKP/sqa8TKjCqE0XBV55VohcDE0lwk?=
 =?us-ascii?Q?WZqVyk1dOoMWsBDv8KQttNxDyIo9zZvzE5izsncIzu09ujg/AWbKcDTvAxoI?=
 =?us-ascii?Q?6T2YR2HAKXuR9RThjYzLTXBk7rQ5Ztdwkf4ByqlWfIugbnqXrqrAT+XmgtmQ?=
 =?us-ascii?Q?6PxnBOqR7oDhYMOnlMLOELPYaKQGJvED/deC/U4DcHSbmakrsNEp35IYXFAo?=
 =?us-ascii?Q?y73I6Dw8oPxgCRbogVWLkoGLj9SW2snKx4ey/J8XW7hZJ+Wfpn66b/ivwq9U?=
 =?us-ascii?Q?/vgoysltB5OWJ4y1VlHWx3cvPcPlbYcRkuhs1Y6n+c3f/eEhKrJFAJauylWg?=
 =?us-ascii?Q?LmbE6n/1QrwxfK39CztyjRxxP5fjdp64NzJeVVKA5SBBtpjdjfONZ6La8aTr?=
 =?us-ascii?Q?h80V/2bTbFlVT880MBTg/ls35Fl+cC/uJVmZE9lAsbyXO5CW/cenXNa0+82Q?=
 =?us-ascii?Q?hoQYMO4P8UcqtpEicJUc92VfXUYhmB1ilxId5IXB6eG7K90dAzmcT/PMutfn?=
 =?us-ascii?Q?AvLZgyRb8Ede/j3jGgroN+4URgY4nCfox0JnYOTlzTqq/J9NxnhUcCiZnLOQ?=
 =?us-ascii?Q?Pim3wZ0BgMDOq8fGGostsLrO3mrMHV3PsqfW5u+q1zdSXwP4JnYAJgHdlRKs?=
 =?us-ascii?Q?614avVl9ojyx116TGOwjuxwhfWA7hdne/7RcZxbqiOzVw/6+X4bIJ0gHyQnV?=
 =?us-ascii?Q?SPhJHrYUsWNWY5/QyPrftfX2ckIkfiu6yYe8bIesWDToGNwjhWguP7bYi2WP?=
 =?us-ascii?Q?V+9Y+ImPu9Kx1jbuKyHUmD66AYrR/2RzZTYK8wl7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d429250-1da4-4385-4d77-08de3101336f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:43:56.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YObqAu4JOPw2XGLwQepY8i0k24Rv/zO40E9a8yhKUY7DhI/Ko1liUzGEqqc8UCtbn8t3eixe0pAhyXX9QKcd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
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

On Mon, Dec 01, 2025 at 08:04:23PM +0530, Riana Tauro wrote:
> v2 survivability breadcrumbs introduces a new mode called
> SPI Flash Descriptor Override mode (FDO). This is enabled by
> PCODE when MEI itself fails and firmware cannot be updated via
> MEI using igsc. This mode provides the ability to update
> the firmware directly via SPI driver.
> 
> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> 
> Userspace should check FDO mode entry in survivability info sysfs before
> using the SPI driver to update firmware.
> 
> 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> 
> v2 also supports survivability mode for critical boot errors.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: do not exit survivability mode in case of mei init failure (Rodrigo)

I still see the goto err there, what am I missing?
I mean, no strong feeling about what is right or wrong to do here,
I just want to make sure the code matches the doc and expectations...

> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 44 ++++++++++++++++---
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
>  3 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 70dcd6625680..975892d6b230 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -77,11 +77,13 @@
>  
>  #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>  /* PCODE_SCRATCH0 */
> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>  #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>  #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>  #define   HISTORY_TRACKING		REG_BIT(11)
>  #define   OVERFLOW_SUPPORT		REG_BIT(10)
>  #define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   FDO_MODE			REG_BIT(4)
>  #define   BOOT_STATUS			REG_GENMASK(3, 1)
>  #define      CRITICAL_FAILURE		4
>  #define      NON_CRITICAL_FAILURE	7
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index b5b582442637..8d409bc9c14b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -16,6 +16,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_nvm.h"
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> @@ -66,6 +67,11 @@
>   *
>   * - ``aux_info<n>`` : Some failures have additional debug information
>   *
> + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
> + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
> + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> + *
>   * Runtime Survivability
>   * =====================
>   *
> @@ -94,6 +100,8 @@ static const char * const reg_map[] = {
>  	[AUX_INFO4]               = "Auxiliary Info 4",
>  };
>  
> +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
> +
>  struct xe_survivability_attribute {
>  	struct device_attribute attr;
>  	u8 index;
> @@ -127,6 +135,11 @@ static void populate_survivability_info(struct xe_device *xe)
>  	set_survivability_info(mmio, info, CAPABILITY_INFO);
>  	reg_value = info[CAPABILITY_INFO];
>  
> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> +	/* FDO mode is exposed only from version 2 */
> +	if (survivability->version >= 2)
> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> +
>  	if (reg_value & HISTORY_TRACKING) {
>  		set_survivability_info(mmio, info, POSTCODE_TRACE);
>  
> @@ -188,6 +201,9 @@ static ssize_t survivability_info_show(struct device *dev,
>  	struct xe_survivability *survivability = &xe->survivability;
>  	u32 *info = survivability->info;
>  
> +	if (sa->index == FDO_INFO)
> +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
> +
>  	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
>  }
>  
> @@ -205,13 +221,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>  SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>  SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>  SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> +	if (survivability->fdo_mode)
> +		xe_nvm_fini(xe);
> +
>  	device_remove_file(dev, &dev_attr_survivability_mode);
>  }
>  
> @@ -222,7 +243,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>  	struct xe_survivability *survivability = &xe->survivability;
>  	u32 *info = survivability->info;
>  
> -	if (info[idx])
> +	/* FDO mode is visible only when supported */
> +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> +		return 0400;
> +	else if (info[idx])
>  		return 0400;
>  
>  	return 0;
> @@ -238,6 +262,7 @@ static struct attribute *survivability_info_attrs[] = {
>  	&attr_aux_info2.attr.attr,
>  	&attr_aux_info3.attr.attr,
>  	&attr_aux_info4.attr.attr,
> +	&attr_fdo_mode.attr.attr,
>  	NULL,
>  };
>  
> @@ -287,12 +312,16 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	/* Make sure xe_heci_gsc_init() knows about survivability mode */
>  	survivability->mode = true;
>  
> -	ret = xe_heci_gsc_init(xe);
> -	if (ret)
> -		goto err;
> +	xe_heci_gsc_init(xe);
>  
>  	xe_vsec_init(xe);
>  
> +	if (survivability->fdo_mode) {
> +		ret = xe_nvm_init(xe);
> +		if (ret)
> +			goto err;
> +	}
> +
>  	ret = xe_i2c_probe(xe);
>  	if (ret)
>  		goto err;
> @@ -302,6 +331,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	return 0;
>  
>  err:
> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>  	survivability->mode = false;
>  	return ret;
>  }
> @@ -408,8 +438,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  
>  	populate_survivability_info(xe);
>  
> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> -	if (survivability->boot_status == CRITICAL_FAILURE) {
> +	/*
> +	 * v2 supports survivability mode for critical errors
> +	 */
> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>  		log_survivability_info(pdev);
>  		return -ENXIO;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index f31b3907d933..bd5dc1c955ff 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -44,6 +44,12 @@ struct xe_survivability {
>  
>  	/** @type: survivability type */
>  	enum xe_survivability_type type;
> +
> +	/** @fdo_mode: indicates if FDO mode is enabled */
> +	bool fdo_mode;
> +
> +	/** @version: breadcrumb version of survivability mode  */
> +	u8 version;
>  };
>  
>  #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
