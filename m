Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F10BC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F090113549;
	Tue, 23 Apr 2024 17:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN61SYJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16111113549
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713894719; x=1745430719;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ISFUn8WCmHtcUUuh0YND8D0WoYHArckcMu0bMjwq1bo=;
 b=XN61SYJnceuQqyZDpZKNXArPQsNPPsxDTaRIHXFuhCFq+5xektNZdmYM
 XmYLT+BFkIIBRoHh7OpaYOXRMEPFAnXKmN4nASUslPJ371Y0Z93XSUiK0
 T+13lR5hox16NotVhm03QPJjdhEtpFdI78S9kg8w6mn+7LAm5OLfkz9Tz
 6qx1BgvpZYtcAVaalyIr4SWX/W8I++iVIm5Awg3B9A0U589UcW6Dl56Q0
 dQD7JFMkzzcHiIJEXNInVJm1x+/QimVT0B4ZS/p3kJuWIfsAGcqTEqT4v
 lDGN7fDU+icubwhSrObu61ZrmW7Pmes4q/xEhj6DxRGL/LXUBvcRdjlOj Q==;
X-CSE-ConnectionGUID: de5NOG3AR3C9UXPlgiTMuQ==
X-CSE-MsgGUID: khgTaI+9Sp+yFFD9HikCow==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9325650"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9325650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:51:59 -0700
X-CSE-ConnectionGUID: TxiAenMRT0Ooug7pgGyzxQ==
X-CSE-MsgGUID: cYggwFjTTf+xawPhuxm19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="25070175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:51:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:51:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:51:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC/fRTBjg+Gu8EaxpzVVA2nHCQCSWREworWHGZAC7E2kxdeC6mlFojA5Dl0fy6TpioZqo7UDTuGc2V3hBICd4G/2UPyEn++0QdCQ0Rs40aaveI4XQGTW/bLDTC9aKKfg95SrDYAe/jdJ28wp2xU3GyDYHeK+XijFTR6NfpQcfDKny3/2UYzTdCEBOwhDEYnsn4NvYZZzUhPhe716Z4kBsFnQcnXtAAriimW6wyMPzMpcX4rysf3BGT+K5/4wgIRC1BPDOlOvZHL4atOuP8GcEv8jkAWQlBNEJQWcG+RljZk8XWYWJ4/ej0uRNV3on0LDXnAZTmBLIng3h1GO2cP4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvhA7aUDic7xaMeGW/9LslV7E1owL+nGoiHGDHQzLEo=;
 b=LNMOzr9XULwqzYnny6OgmHj9UAYaYLNLuS2iXFLFvX97zqYexff9Uv2B47dChzz0N8fD7Zf7V+VjE4yGuHkqgkZXWT2TGoI+LSLTwDwl577Ntzw+RmvYWAUpfcVvSZF3qapa9F15dzqCPWyix2biyJ7tiowtVAMnddn8xMBrdf31Sx0g7HiMVtXtDC/9t5/UC73VuWRhMowZ8lJ5AJoUep6IifGR02fMAq+NgjDy/dYUy1YmGenF8cAGoQdR+C7VoCblXYmW0cfN3mj2XRQ0XXNrO5qzvfm75C2U6bgBSuMxpy7QB+mydvomYouuPzN59oCm2LEDCH6a+wNhO1KvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Tue, 23 Apr
 2024 17:51:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 17:51:55 +0000
Date: Tue, 23 Apr 2024 12:51:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix unexpected backmerge results
Message-ID: <5qxszrulhvr2jc3g42v3rgg5igdt6ixo3xqaxbrg26de43yai6@y5nupgmu2ku7>
References: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e21557b-7b74-4cf3-ef19-08dc63be107a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?euMkCU/FS9nKs/8zaBDOQ0pXmHTWCCjN4Hr2N7DYpGENipqFHgiHYnuJEW?=
 =?iso-8859-1?Q?kho2qt8PD2BZUgk1++ocxNbI2rF2zsXssdsA1RXEBsYtGBG62wtjN6lnRH?=
 =?iso-8859-1?Q?Yzq1Eu51ws9EkO8VxOTHTOC5u2jV2boz+lKQeCFCOC5g9PkvqQwIp1R4I2?=
 =?iso-8859-1?Q?NBnABO2flWYJtIa5wDURukn4kGZjhYBSQinf3M2BYXjQnQMUFi9WH88IyH?=
 =?iso-8859-1?Q?54X8Fytlm/FrJoIPD1Qps+8lzxX1vZF9hbKXflU3dXvZwAbMyetdv2OLPe?=
 =?iso-8859-1?Q?08XOd/C6mbJCsBZzpu1D2XlppqS+2HQVAZ1Wgjey3/nSXLWnGz/YdPPeeh?=
 =?iso-8859-1?Q?YQTKF3YTxjSFNek52Byvr9A3trdsYTaf99tApPSTpHIrtWefqdFdn3uOUI?=
 =?iso-8859-1?Q?Z1MXscE0Kx4TZlmk7Qie17y0ajPXk4m+eCq4L9FM2ctME5gQAkFdUhC+YU?=
 =?iso-8859-1?Q?KMjMC0ro6A88TqXU8tOmMW8ArF8dm1KK/XSSHRospUIx/WoUFw68p5z3cC?=
 =?iso-8859-1?Q?B7BNRWXuQQHVE2ea0+cH1lDHu9VjKphMCZje3NeYbDR3+2I4PcEJmf7hyh?=
 =?iso-8859-1?Q?T+C4t/Lhq0Am93PjT/tpJWks2OR1uN10KPGLPigE6JXsJXko1XpwdNblr9?=
 =?iso-8859-1?Q?rE5sMW4nEDtSNlxtxYs5ByCb24sH/RG3oUfHKkGMfdWKSmI+1RYZOouzgQ?=
 =?iso-8859-1?Q?W528krJVgTl3FsDQ6bMitXdr57oAEVXlnSRmAMP2GpjgueWQ8gNFc4TFrc?=
 =?iso-8859-1?Q?qPm16EB8xUNFS0ZxEIVZlnuq2s3S/eRcHkQhNVdQaNZfET/Nd9JnvWIr0J?=
 =?iso-8859-1?Q?GS/dKMIWFJh4qUkVgJN1W9XdsJxhUMm7Zz6vzMD81o6z6oEvyV8YmDQZTp?=
 =?iso-8859-1?Q?y/6NWZS3WidN5E+RfBSghDcm1muo26v6H/n7LN6e4o3Hw9VT4Gj/f68q0P?=
 =?iso-8859-1?Q?X6jneEAmC56livE56lgUXHUybpjmJN6SyrlXPBpwbKdGlWAxWZ/bWizu48?=
 =?iso-8859-1?Q?n4WK4X95Yz8gF9sX6QiIMEkM7dHwbjOHf2b2o/beyXWuFM2hhhS7Y4xmTH?=
 =?iso-8859-1?Q?9vP7QlGsb7XoK9weg6qtRXbFtl/eScjbDwtgFi96hNifOaxa7cWcace6Tl?=
 =?iso-8859-1?Q?PHElMK4lXuyNobjte7X60xQCp4iN6zFRfddjDhpdT/AACGp6gwES44IUBU?=
 =?iso-8859-1?Q?cCgXKU4ZqW5oDqYWc9Kvzsb03aKSAkr0xgeGtFTzYEFH8eLEmUv9hJTO8p?=
 =?iso-8859-1?Q?Mm3mHcDJOtWZpH/UaxsRHo+GCTBdVc55UTh0OWgYi93vbDMFQyE3SHpRyt?=
 =?iso-8859-1?Q?kakRy+rEVd+8aW7RBqjS/wJcUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1hvEXqz2xzSg31m7NRcvXVvW5ggOcqN1BtvZBlf3lr6VsxhD9XCjjTwi2J?=
 =?iso-8859-1?Q?KM2StJj5gO8y58YYqlGheKZ/KWyUpjnwxEB4yhwQYyOu0GGKrsolvNC1dj?=
 =?iso-8859-1?Q?AaDTyPflXJHGvUMIC/OCLCwpQE5PZ1FDjQJLQ9g1OY860euXIYjoS2sOXY?=
 =?iso-8859-1?Q?MVhuylGInHIUciGi9SaF5vnDiAx3NrEr/SbmhVSSxFUrEZ717hF8r4NWKg?=
 =?iso-8859-1?Q?6cNtsDbUn1yTA9NpCIwENdLKMeU4XHBU8hAtXIewpqbmkDA89dZZ3qCQsU?=
 =?iso-8859-1?Q?xIP3NMGYWTInNJztAri5HSnt1n9KX5Bb9wiWGhihdebfEMYsvtN2TeEWPA?=
 =?iso-8859-1?Q?y8yTlxtnSgsqVfE3+QPe/bMi8isQrDDvRmcJIud/yL2mxa3rZHHsC2Wkyu?=
 =?iso-8859-1?Q?evrEk+l0UA3WlDv5LuD0H5p5+YWATMyEgzzNU25p3ASNvLV5A8e4rG8pG2?=
 =?iso-8859-1?Q?t2tKhK3KvPpLbdhhR1P2XkEKzPQEO0AWVryTQ5cD+fn6a5fDoXpKunw2hT?=
 =?iso-8859-1?Q?fGOfkXmvMAVJ/VX81eRS405EiScVKVIeZSk5buO+V6iUOPHv1//rEj8gka?=
 =?iso-8859-1?Q?U3EsIYjXkTcg9c4dCtwP8PT45hhjcHgkPG8n5w76eoV0DrlyKA8W7KOT+z?=
 =?iso-8859-1?Q?7G6afHgDj/eXfsBxUkUFXXrZYGRd3EazJ49+LLbeK3rN4Ky175SW8iz61H?=
 =?iso-8859-1?Q?GQgXv1TwsinQV073o7cpgi3QpISX8mE4kyoY2LIFuEL58oKPBH9KtKj33B?=
 =?iso-8859-1?Q?Dda+8ShqXuvrIOTu7I/NXnm17N8RiPKjF9X6G7NNdbcPxNTIpW8JRd+Ydi?=
 =?iso-8859-1?Q?/dzStVyRu+J0ZdC33pxZ3yzqbRPHSNSFNQqDLXlGr1P84wSi0Zwbb+CfcJ?=
 =?iso-8859-1?Q?QSX+3iEsyEw3Mw28HyIbLSbyHqzy/QXK5loO96ao4EkfBln9mUS666bW9M?=
 =?iso-8859-1?Q?/uTE11EfAcrdIe/CyXTusRxzmzhlS03voYzL1uRx6l5Zfwo3tDq7R7WNDo?=
 =?iso-8859-1?Q?7IT0YwLfeQURr30t8J5O2N6TVZ8A5dIr+N6OypFPT8iODws2XmhEMIbHSB?=
 =?iso-8859-1?Q?XtUmiaMhe84t3KYlDHL+ZVzp26p1a7mdTZ9FL0BtUSUXa0FOXhdcOgrsvE?=
 =?iso-8859-1?Q?emkDIqMuOG81+EZyTm0z3eES4SP+XIOZ3pphpuY/566xA2xQ5bqJCb5uTY?=
 =?iso-8859-1?Q?9Wh3hOVZyPn2/+xyuP+wDsG2vXpfwHKV6IOkf4l9RdQQHUh2YdMYD75u8L?=
 =?iso-8859-1?Q?8nzG2Q/lfZZ55lZ8H/aab1tflegmXRwjObWiVf4ClJsOWFqJn5n/JnUPE1?=
 =?iso-8859-1?Q?VfEukFr0/ETYjNtp13Q0dTSkym0GPoFlgxP958oJwJsbUvS5OOPP/OLR0B?=
 =?iso-8859-1?Q?nzwED5Ob+/yJHW0ERoxz3M5TjLdBx7QwcK5YH0f1tiMsFy8VeXbG25bSXF?=
 =?iso-8859-1?Q?yt30+93vK/6KmRLI2IEIhor7XJFfbETWOi35QMJ+QVVa5HHKNZpNGzCLPN?=
 =?iso-8859-1?Q?8xOfDwvPKr6WWke4guRUWkJHKiNE2KTmMIGHcZwmIGwk4rm3fwfHiNv64T?=
 =?iso-8859-1?Q?37qebMFZFnDdJVRFzSfMukWfFoaGuI3VbV7I/zGzWuEd6Rk9L46T1znpdV?=
 =?iso-8859-1?Q?enImfk7rXquGeO6zykN4OVwBCrYbQMhEAKEtsuAXNSO9L5RomEkjWklw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e21557b-7b74-4cf3-ef19-08dc63be107a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:51:55.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjt7a0ebQQ0RC+p8SUH1AkAsLbmBhkp4jZRSwVuRl7Tbi2lJGFNT/9SfMA9lec3MYXrFljIgLm59ag0upJPoUY6eGTt0X/9VeCpxNFbgBv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
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

On Tue, Apr 23, 2024 at 02:11:14PM GMT, Thomas Hellström wrote:
>The recent backmerge from drm-next to drm-xe-next brought with it
>some silent unexpected results. One code snippet was added twice
>and a partial revert was partially reverted. Fix that up to

"a partial revert was partially reverted" sounds like what was done was
correct.... what about "and a revert in drm-next got propagated by
mistake"?

>reinstate the code as it was before the backmerge.
>
>Fixes: 79790b6818e9 ("Merge drm/drm-next into drm-xe-next")
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++------
> drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
> 2 files changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 85d6f359142d..7ae2b0300db6 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -863,11 +863,6 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> 		vma->ufence = NULL;
> 	}
>
>-	if (vma->ufence) {
>-		xe_sync_ufence_put(vma->ufence);
>-		vma->ufence = NULL;
>-	}
>-
> 	if (xe_vma_is_userptr(vma)) {
> 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> 		struct xe_userptr *userptr = &uvma->userptr;
>@@ -2100,6 +2095,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>
> 		if (__op->op == DRM_GPUVA_OP_MAP) {
>+			op->map.immediate =
>+				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
>+			op->map.read_only =
>+				flags & DRM_XE_VM_BIND_FLAG_READONLY;
> 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> 			op->map.pat_index = pat_index;
>@@ -2294,6 +2293,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> 		switch (op->base.op) {
> 		case DRM_GPUVA_OP_MAP:
> 		{
>+			flags |= op->map.read_only ?
>+				VMA_CREATE_FLAG_READ_ONLY : 0;
> 			flags |= op->map.is_null ?
> 				VMA_CREATE_FLAG_IS_NULL : 0;
> 			flags |= op->map.dumpable ?
>@@ -2438,7 +2439,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> 	case DRM_GPUVA_OP_MAP:
> 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> 				 op->syncs, op->num_syncs,
>-				 !xe_vm_in_fault_mode(vm),
>+				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> 				 op->flags & XE_VMA_OP_FIRST,
> 				 op->flags & XE_VMA_OP_LAST);
> 		break;
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index 7570c2c6c463..72a100671e5d 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -269,6 +269,10 @@ struct xe_vm {
> struct xe_vma_op_map {
> 	/** @vma: VMA to map */
> 	struct xe_vma *vma;
>+	/** @immediate: Immediate bind */
>+	bool immediate;
>+	/** @read_only: Read only */
>+	bool read_only;
> 	/** @is_null: is NULL binding */
> 	bool is_null;
> 	/** @dumpable: whether BO is dumped on GPU hang */
>-- 
>2.44.0
>
