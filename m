Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A68CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469C10EA81;
	Thu,  9 Oct 2025 14:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ytg6rHyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2E610EA81
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760021713; x=1791557713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1rYrGBcYZaDW+KsXcUIarSGvqK0vohmZ+9D6wyd1vek=;
 b=Ytg6rHyj0LxvR7Hi/c16eM4oKxVg5cnl5xnV0zMQrDT8h1IeGHtuU1u4
 LsHWg7AGXcs2MuZdxvfoNXstjUqXrgi3IQeZDlTcrXY9aaHRky6UHTMf6
 sMhCex15hDDtQWHZoprCdRYte2xYl4YL4fWzDK8vV0qM8wyOJocHiWsc3
 WbOPCmFDKRy0AjJfrw+H7ScGzaSSMGYZQiFuS5OjNq+d3MeFW3uRtlbZv
 SK4N49v/DDO9mDKBXi0UieiyX8epmIlNOSN3tVsy2DMaB9BUpH5yy84oY
 isaeSNkR2l18gqfoTsHUcWmK/hLsNCj4Is5BKgHcDmYMUpQIMpbPDlHEo A==;
X-CSE-ConnectionGUID: 7tK//cYQRQSN1HLP2vmwDg==
X-CSE-MsgGUID: feE5bHxgTpCvCXMn/9dLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84854947"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="84854947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:55:13 -0700
X-CSE-ConnectionGUID: t0lEel7xRuiJ/ry0c2DMXQ==
X-CSE-MsgGUID: kUfqVFaeQwKR4qe9aYo8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="185859558"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:55:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:55:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:55:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLB8NExgN1hsO7PLxEOvXExShiRoFuT1jXKqnF0XY24/nWAhF0xJ54INvUuarmnDjPYWtR4RFZHpfXyoa8nZ7N965pydmpSkG+CxC8H1IGXmmiIOypamWE+7w79EaGboweKDMdx5DV5t5JZtZaNIWS8C8gv3VWWn2F6H3DEEjs6bueuLegZpW2hd7ISJGl0VnnXRn1FFVHohm42XFQa8GBZMgxbd2u9/RegXWLdjwm5+/DTUOUbMLITKjdnTfY2DJGQaeQuXBf4J6q5s+34+I3E93T7ZgQ//kzCLzc8Ufyz96sVEnQCftjpIfHIX6m1T2Z+EeRGgvBCYG9T1kfPyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suMKllFyY2cwCGuXuumLWq+XPUAQF2djX8envQYkyYc=;
 b=kJVE7WDx0jo9H/45b4cAHbuG/dAWURpCFXsOdkpDEvTfH1nYnJuyHzIlodQw3+I05pATIWGvAdG9A5m+4VT9tAHP8/hyCXwvxN0qgCOoB3WZ4fFyvqw7SjWeHXJ7kmxqXWcr1YeoaUHDjvrRhT6BZj+o7iDSRAYMGZxKjg1roiWYaMNcbcIMkXcxqNFe43haAlcC6AfoG1VeOD1dIrcbQpa5T1GHMhcEZyuUcBDz7jP2HtSBVaFN+oDkIxTZ8D9raPzMts74+Mzvi7rMS8IQL965bXoNfuMdZwp4alkfBNU3YthDkmJF9v7IJi+70MuVnmGsVDnt5fIhyACvRdewDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:55:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:55:10 +0000
Date: Thu, 9 Oct 2025 10:55:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Fix copyright and function naming in
 xe_ttm_sys_mgr
Message-ID: <aOfMyuuHVj7hIP5o@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
 <20251006201339.2603160-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006201339.2603160-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eff0f4-3eb2-481c-e023-08de0743d7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eTWW3qMniea+xeJLbxbENms9OPh9o5bn76kuJOzQrKTffsrxeQHcuYjBVx?=
 =?iso-8859-1?Q?dKZo/i2K/7//fk+psxVnhSS26fVeBI+hgQwr5aqYeH44hp4lWWXQgfeZAJ?=
 =?iso-8859-1?Q?iAOXXaXlF0q3kBFH8EaHyT1H9gHxJUgEzsVYzlnJN9T0LaS8RvUP5Zi76K?=
 =?iso-8859-1?Q?u1nVx1CwMY3egWuJbGu9vMJ8I7cu5RknLDfy+Fqiet5OpustgBxgATDtll?=
 =?iso-8859-1?Q?lmUd7djGSScQEEydFwgEQFRBBfggffiQOXny+Jfty/AGZH0wn+DLUxbyGR?=
 =?iso-8859-1?Q?TSJBRL0dS0KvYzYM7aiqbke1ULpRQbL7S3DI8We+GiiztNLfSg/khWhA2i?=
 =?iso-8859-1?Q?lby6GqLi/ovN9dX94iLA6iE5t5410d8VSmI9qLEVFWzQQd8tl5QAMHcEKA?=
 =?iso-8859-1?Q?f/kk3UMsFQ3yQ/pzWR/JLUnmgMYvyr87zWKTzsMTPX+sQRtijI5MymSC4U?=
 =?iso-8859-1?Q?5knUuTZmFTiImJ2LQAYo1P4gF9SCva1RIJo8jAhsiNFk60PrV6NTpoz2pS?=
 =?iso-8859-1?Q?MeaB5J403hupkuSWsm7pBafnIsLNGmlthfbxeC7RtMhvBpz0rsjXAbBa7j?=
 =?iso-8859-1?Q?Acwk1zHGft2WC0H1k9o1fprUsfU5hlMzh6oOPUWCq+u1Tmz5nzTYtG6No/?=
 =?iso-8859-1?Q?Xt+yiLNLkEfgEG78Jb4gePRUN9UduHSoZcVuV0/TkAGEPheklzWe+RAg6Z?=
 =?iso-8859-1?Q?/uJxRbYqEr+SDrj/GnuZJm313Jdy9okjrkWCFVh/JZbSNIJZ3S5wBGt1GD?=
 =?iso-8859-1?Q?JFgbw3sqRITEKfsCm+G7sYfdWjuGaTC3Lg6MPHyUNBbCil0V7lajcP+DzD?=
 =?iso-8859-1?Q?GgnPeDy/KEe5FYDccM5+FWJOnXNU57cYaXsEDFINMFy0kpLhiIgjI/N7v+?=
 =?iso-8859-1?Q?zvWoFX10P3KGAhJiPEya0m7DKuhefKXwXE32H4Gpy2nwvXYEjp87Ivi5bZ?=
 =?iso-8859-1?Q?T1GGoJYbCQ+ZInm+4AVIEoyKBZFG/5oISUCC4wNDYcZ/qa+vmD2bAda74B?=
 =?iso-8859-1?Q?sN1oH5KOCDeZmF/LLrNIQibR5ynLKSlxOW8iGVBVCX53Eg30+srHfdXXMY?=
 =?iso-8859-1?Q?MQ9W3lD+ONz1It23Ou/0/MXJRMfnsJDVRFDakvbTKZ/YkC41NZ4NMhOFI4?=
 =?iso-8859-1?Q?NF7z0DFY9GranZ5KXUVL8ZMIARU01xmjw6R5OA6ee5JwsiZ9+H81f4k9RB?=
 =?iso-8859-1?Q?rIWnxf2MwyKVScsaCJ8eMSuM0SiNcul5sF8S103SQmSY9xdNaSAE5zAhyt?=
 =?iso-8859-1?Q?/GOV6HAeH8Qi/Kh892QkukuMhVar9m24MsXKaFMiSp/fG9/qGJ4drgQRIQ?=
 =?iso-8859-1?Q?IhQ4eJvRKTwMuwZQTb81aYhM+ZhQAm8d+C+3fx+mHa1QENta3BQqNwLUF8?=
 =?iso-8859-1?Q?TxziBEQtsUghaN/CnU/NJBpvgEt7KzYHOmtdys6mXfUXXESUdhJjZAC00b?=
 =?iso-8859-1?Q?ivCZeD1fhpuNuHJMnu0ksDe2o/tOxeYRzM7so9129U40/spqicPYZKg2fT?=
 =?iso-8859-1?Q?TeU0t578RSJgvjyzy/3XMV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3ZhfAqI6CS5o+5IZUpR6ddQZTtpo5EuSrpswc0Op7yqMemE7I5w6jnZn28?=
 =?iso-8859-1?Q?VhPTAMd2cEXd8Nixuea4MrXroSgMSKuQVLNVUASoc7bhFMwFA+JaIpkHld?=
 =?iso-8859-1?Q?NJZAV+waFQme6tp6oSwUTw85zrkxNKswlERvUSiPRqPuHsoNRj3nQ2oEI8?=
 =?iso-8859-1?Q?iOtQRyghHWKGvuXxSt6KgRMEUDBFIUxj16HEXDaBVui4trZjg7ArWL5d04?=
 =?iso-8859-1?Q?2mQVWwiEa3htCuoCGLsfo+bjiV5lSEzeKjw6XTPbfK8T7rb1S7zWy6WZyt?=
 =?iso-8859-1?Q?Mhqwf/2PLxrgaOkK2hbNO5rp1fudBy7zFgNez836Z2GKlvTPg8n7yDC0jz?=
 =?iso-8859-1?Q?O1wE0oz8y2eLXrxWi/shQYa4EN3R8pE3NY8pljRmGhU6nWZBnYAf3ttppI?=
 =?iso-8859-1?Q?keas1tEM9qFwDz108x0vp6+rxrMPWinTz1S0gpDZTRiRZ3oL8CZipN6Y2g?=
 =?iso-8859-1?Q?xkgbHXbEAAz0dGd8ctGe/IvB/56eEgT86258RKsY8snGOauL818nmbxQpM?=
 =?iso-8859-1?Q?NsANWnRPn1H6qXCC8xtfz3tJCjBvuxgePnFIWmIpoa7LpI3Q29g1mN/CSq?=
 =?iso-8859-1?Q?NgsRbgXT8a/AiL44BOuvu8f+e1ulpUtqYoMszZi6b94rEanrliq1bpbPaV?=
 =?iso-8859-1?Q?RLO/Fs3roJoEjhewNY2wRTRndifnRzHw5YdGfA8cBtfc/8bWV7lyWnjpmg?=
 =?iso-8859-1?Q?6hJLvUMNsjaY8WTCjIRzsXixOLY/rEHX0AfICC5p/Ppm+MGbbl1VFf84/4?=
 =?iso-8859-1?Q?twmjdhNiwPoBVRWPxBFBrkwuVVTzOQOM0jSKgawFC407S6NACxUd36Taf0?=
 =?iso-8859-1?Q?xHqWarOHVJ/n5FTBZE8t7YfHYdM8cBPLpGwd1z2IWnEWQm9S+xD0vtAehL?=
 =?iso-8859-1?Q?8ArkhFSIro+vOOPjOmSGS1WYo90zl3+lxop3RWNkGVvUWBtnmTA0b6Vd42?=
 =?iso-8859-1?Q?Yavc5bZXV0/sXiczcKwhT3XuM0E+IuaKt9eNH30d2S2x+X7mc1Tsl3CYcj?=
 =?iso-8859-1?Q?G75ifSG2BkaJiK07DHJ+oixVb8TzOG/r/XZLE0000hRQWtyZNO7WPk15pQ?=
 =?iso-8859-1?Q?h2tqaLHPvublB32ahZeoaKb+10z55cVo8BYSfn6sCX1M+3H+0qf7GEJFzB?=
 =?iso-8859-1?Q?0xxHS7P7Q0KU+1iFK/Te/9g0XKzQdyvn6ELAjUpW/4wvNyQ3lA2FMZcolv?=
 =?iso-8859-1?Q?rHfzOJJ5W+9MjXGlF475dn00jUsc0NNdAr7DejYA7i4LGI7zGOgDgMbljD?=
 =?iso-8859-1?Q?eGBe67tVGkEILFH5sDhhdN00JdrF48vEqyvEP3aPjU9koyEBpZtdKW94S3?=
 =?iso-8859-1?Q?ztcgVz+oVeucLyQmnn7zJLypAuRcj9WyosquubScYgVYceeY9Iokjpqncm?=
 =?iso-8859-1?Q?dRLVv//Px9AEA8yHlLbrGIOgXxBhpERmSjDGDQHQ6+FEe7XZJQ3ICK18yE?=
 =?iso-8859-1?Q?zkP+ciJSAuRZXG5jcMljX1OpnhdH0DfBnzG4gh3kAt2azFzoWS0A9CJMYB?=
 =?iso-8859-1?Q?XZSS5CQgzYo2+iR+QU0nivkp4OXGKIkUfkIjnpbB0XZe5j3eDF7Tu4w0/P?=
 =?iso-8859-1?Q?94BkmyeEcL847dd7ZVnE4J/HoKIo7UZr2MQiKOngpl4kV13n+fuBEFu0jN?=
 =?iso-8859-1?Q?zHn+Q5YbKjkOvf9E2bBkx1/Ow51GdMPgM2m32EfS5hsC5TQx0+WW9N7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eff0f4-3eb2-481c-e023-08de0743d7cb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:55:10.0150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ruq1II8iurE4+9H4gP5PM3WxRSsAr6qwBHP2CgmE2aU3Fp+9lWyLFjMz+LYeJXiOe4jYfFjAEQnl85OsIU0MiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

On Mon, Oct 06, 2025 at 08:13:25PM +0000, Shuicheng Lin wrote:
> - Correct Red Hat copyright year from "2002" to "2022".
> - Rename ttm_sys_mgr_fini() to xe_ttm_sys_mgr_fini() to avoid
>   confusion with generic TTM helpers.
> 
> No functional changes intended.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

I think you had already gotten a rv-b for this patch previously right?
if so, please add it here now as response to this email, but next time
add to the patch before resending it please.

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index d38b91872da3..3e404eb8d098 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /*
>   * Copyright © 2021-2022 Intel Corporation
> - * Copyright (C) 2021-2002 Red Hat
> + * Copyright (C) 2021-2022 Red Hat
>   */
>  
>  #include "xe_ttm_sys_mgr.h"
> @@ -85,7 +85,7 @@ static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
>  	.debug = xe_ttm_sys_mgr_debug
>  };
>  
> -static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
> +static void xe_ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = (struct xe_device *)arg;
>  	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
> @@ -116,5 +116,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
> -	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_sys_mgr_fini, xe);
>  }
> -- 
> 2.49.0
> 
