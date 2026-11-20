Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D91606A695
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oz/9aNSu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DzHGtXz5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6410E078;
	Fri, 20 Nov 2026 23:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC95810E078
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 23:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795219098; x=1826755098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rY27eH95Zfgn9mkx0cL/lrBhwiN0jw4ItdICFD4P8cI=;
 b=Oz/9aNSuDtCEU63A1s/XVHhJdj0mSBIkOWoHV2JeBal2rr4U5yfjcKTV
 SUM4+MOtzeY7KtnhOYXdEegb5bNoiO6PLkHUzSowVrt6R/+bEWUjiNWEZ
 MRLEy2NF4+BWy751d4aXYwtO7Ufdc911evRDmqgfnBQ4dFpB1BSqPR42Z
 /EYvm21CTL/kqYjHaBCmlUKG2c/6sKY4VQbERvGK3rYJ9DrD3Q95H2uHb
 LAjx2s4h1VIT402Tvl0BjeyxoqJO7qKXZS9GuiGHhFR7Wyj6G+pHGW6hZ
 SknKSUpwixP2B0SrJgVpjefebs1kUmWbllIVzK5thaUctFDbL+gibX1mK A==;
X-CSE-ConnectionGUID: yrZOHve5SLGjDemSB7vFZw==
X-CSE-MsgGUID: TIBeVJ9dSE2HRuzWDnibPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3992060"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3992060"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 15:58:16 -0800
X-CSE-ConnectionGUID: fsOUn7CnQPGidMdAGeCWQQ==
X-CSE-MsgGUID: 3g+gaO/STNqC86YnDCrgdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12814662"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 15:58:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:58:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 15:58:12 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPskHPyCwjoD08vhmSmxPsTrsuTWObIIAUAGb0MRXBjGJikgvY2sxkyrgHCAg+OWS42pyVtTQN9udlfO0Yg6ZQUMfjOow3IvnQlR749AF/muuczoOrTXEBrtjhtqHnJPQrm0zion+KAGDi3SacpU8u2bXCCzuxF6f+QZwiHNsx2GJmZM+2yubmAUsb2fnX0VFTAqN72tsdEV7ks4AB+4UyM+P6svSz7CiMqwQIOS9BIO7MZFKMJ6dR5gdZxby7/C32zkPkrSIGpocL6Ihi6XsrhEm7PCPVZRjOIuQn7MYGaHTvvt7WCacp7ltymdXLV4JgUnxRGMTVgV21Ng9BmjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt8iVdiHXg2PA7PHZQ44cXLjYfMS5WdbYOh60YBGihk=;
 b=DglfXrOf77dCyic2UcwiDqjJ4g/rmF9tWlXNVA8fUTWR7Sf3+LBK7flfLiawvVU+VcrJGnlvKtmx89eLiER/+O3QXUwQABeywiv4oSXbG64HqKGp8KNVZ9hW2XvXjQyrDNYTExf+j2Hg59gEAyg5R6VfgIhnMrTTXtOpJ5G3AfHWwoosyU7Dh5FJBOSpls38IPoFsNrFsw/meKL7LvTyWUGkQit6DrbSzt/TR/aU0mXxO1a5ZW/w/Ll133nRuoTGVZb3V2Pt78BRH7WnSQD2CCZtZUZLF11nFR3tTWiTDcqZxQtKQcL7K/skvh54KnYbeI0ajYvyex2aP9LaCd2NiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8iVdiHXg2PA7PHZQ44cXLjYfMS5WdbYOh60YBGihk=;
 b=DzHGtXz5SVpPvY5J5ugXWekBCis39namkNanR8bDrUa24UaFht/LEGHthqw4tHXiuqqIiPqaBiAMrhv45SPEQphd2N6WWypd85u0wx8PbJ8xJOhmNLq+l7gF0pz3EbpvCs3cmeDV9BBuYW3arPR+WQPboMSxGs3zTo98DRvvEDY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 23:58:10 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 23:58:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <nitin.r.gote@intel.com>, <matthew.d.roper@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH V2] drm/xe/nvl-p: Add Wa_14028564128
In-Reply-To: <20261119075242.3292552-2-tejas.upadhyay@intel.com>
References: <20261119075242.3292552-2-tejas.upadhyay@intel.com>
Date: Fri, 20 Nov 2026 20:58:03 -0300
Message-ID: <877bi7qcms.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 8295be03-3660-4f95-6c20-08df476220ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|261009223027099003|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: L6Uaz6gF1GxFFoWcMwHrXD67xhSpj1zTHC47qKwdXeeYpF7k0jU5D+nZwc83VFfolzGXDIjDjYViCqdNGzXEjAaezDm56MCBZ6aRCmzPrclPA3ghHq/2bQipGytdKk8ilLJM+goHPvnZrjuxldfRWcvXTw54QCOqui57fK6fRNRhicURgdF+h7Z54h6gUiw88d5q1VVkdhIwqwnKghcHNsDbeFWMiFwA6QdlgQj3YQ+jUUz2xg3fuedvD/Bl3fSuCs4fFEfqAuKuPXvgGQ4WbolyqRHx1Wh/ajShNTPc+PGDyIVpjNLq42H/HppZXnPrTFDWqyN6/L5CBxk0PpXN/cPHPeSm9mHxMRMzWQ0C15lIJ/Hw8aktD8hVJ/xFgVf7nF62REueIlZdMs3uNp9l5ZvueWTdl2V+7Mul7bXFkMboIz0NJx5lDMZbyQgvLiWVjSKmRkWRkpVgVd3/XbLZ+piUJr/SmU799XhdJDvHEI5ms4lYKlc8rVsmncAW4il2MnTEZg5M8R0xgM8yZEbNsDR2ycZscWPqNOfzZM4nVonE5RWTdDu/JCNXFuWoBZmGqFSZySNE6tgakNixfBtMBVQWy2F+MmtYvOjAIj+uY/zcMpMkvwHQIpYDln5Pst6C0SenRH9/iHRsZBJC7q4jQOvGBVAC/BOzE5h1xAOdA7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(261009223027099003)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h9G0arxOz2ejhjgZ2DXiZ2BpVVwTmTT5ofoeD4R+nQi0aMh+kqTPpUzp7lpd?=
 =?us-ascii?Q?Fivn+EkOBVkq8FMLPf32Z1zuQibLUKoIsPAwGUMrsDXwN0ySgMwmIQH4RZVy?=
 =?us-ascii?Q?NSpuyseC5IlqpbWq1vTHl9jNr8bH/NUSCvEZm8pDG595FqyfHhpBYmAVTLHG?=
 =?us-ascii?Q?UHUZvDjaLUxPoYdyX7pFanFfv93DWbIzDWokixKS2T1DBc1RQsiLOf3+6+2u?=
 =?us-ascii?Q?3oL8Hfdv8x79Je+igEftlLlyiOsmsmxOaDO2CENFA8Zf/0+KMN/ZwdNnm93U?=
 =?us-ascii?Q?jXiVTYEwAr75ptQesJry2nHF0oUP3ypC4zmK4TXzqjr82JOdofz1bVIjT2Sf?=
 =?us-ascii?Q?Ussmflvut3V4W9VVY3gxWdRmBD9J592EZY4hDpsTRlM7mHKBwdet9YETUeQF?=
 =?us-ascii?Q?28YcQFXW7y11d0Agpe0CB9pC6udPHkSTKyqfiWcGnpIEGlcgo1FwSDllUlo6?=
 =?us-ascii?Q?d0xy+RZQXnIrQvKacMxVcBZiEYkf4TYOCDnZBZgyO6pKW0yz/Je/MHRECaJ0?=
 =?us-ascii?Q?RPF5L/OuCjaVukEk5E8bXQINdLZwRJ1Pn+esErvx8nJGw6eLpTYtJqUWY1Zn?=
 =?us-ascii?Q?8f1ansUv/VYQ9ufW36yUcSqXetbJ68/GvxTV/TwcM778WI/WpRX0oQIN3npT?=
 =?us-ascii?Q?S7j6Zk14wgeBEmoZMfdZpRPlDT/SNOGfkhTCNS/kzQvIeWQ6TnaIB4qm8rZs?=
 =?us-ascii?Q?jUTX4UeGKyXL7CZ6hyLlP/+/I/NjTFYGKrHexk9VdHY87+KZzF4z9AbKFBjh?=
 =?us-ascii?Q?aCHEofDeDGT/XpOLhZdsJLJCKzzmwFn8I2pSh6SezYIDjRuj4m3mRLCp9PQV?=
 =?us-ascii?Q?5LMbI35xl6UYeU/t6+qi8v4qh0HHvNcfka11YSLuTSBHaSgw9P+mDagg3F3H?=
 =?us-ascii?Q?x73J9/OMVV4H4dWPrmW1D3nfGoqAvWurQZr67kV9aE9TLxTqHp036KtM56y2?=
 =?us-ascii?Q?+ewIalVwMac1yJbKicB3tgvs9VQVL+8yBVXPbqM2d4sC/NgZzLESEjoqMX1r?=
 =?us-ascii?Q?q7mdnI2DP7jNLa1WM2nL9NUEWigBOGQdlK5+EtBHrFPCaDANrjQMyRG3KE7O?=
 =?us-ascii?Q?fuD2KIrZL1OKdbF/QnifC43eyytJEuZMdtNj7Pa/FM0f5DsXrud7EyynDq08?=
 =?us-ascii?Q?MRrbzHqU+jSdySzdYjCl1h2IRPut6IdbXZaJXLg2UnNde5o8gxvCIu2mIz1N?=
 =?us-ascii?Q?b++GiE4/8DK07LqYBRPcbZHIazKTulwJhBc/jHOpFR02T/SJVrGamyM+Gsd9?=
 =?us-ascii?Q?7IAn1hOhIOkMxqAIZE+91yBS6sdeFQ0PiXQ5zzV/vXM2gIorBkpOtfIC/PTf?=
 =?us-ascii?Q?s4qMml8WQYKEk2HLXXmy/yuM9jbaq7xvuW5CYCbC6u1INA4wNHijIzrqD6H2?=
 =?us-ascii?Q?Qf4BEc7VhugPR71pf+4IJasswt+TYN14I5rcN77kmZjSh3eko7a499MI4c3P?=
 =?us-ascii?Q?fwoUig9AY35XUw0lh01L1PpYksYKUIKSO0GqP616PoL2PDc7/JkSry//R6wh?=
 =?us-ascii?Q?tm0EAu5qZzi5KxtXqJ0wMbAOt8jR8C/uZ8C9KNb7Tww4s6fQdPM7too/jZ9Z?=
 =?us-ascii?Q?mrA1R4XydcMIwzfteJbksruevHoy99Lt8ti39fGAQj4X4bIcBDP2sHMraZKm?=
 =?us-ascii?Q?g776CUF5PVaSqxwgF3/KCENs1SX3mlzi3nEFySGxdR2xLjnt/mMhXy9CJQt+?=
 =?us-ascii?Q?95/vTxNar6MButwGk+6OAN/v2leQgYWe03ab40cjX/oVOYrBJ3SpEEsfXIDF?=
 =?us-ascii?Q?DUDaq2Tq0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZtlTRXhw2c85dd9HpiLc2QHSh3hIjT3todSOrZeJmRhZews7QppllSI/59K8+nNlJNd8mTsNJT2LULUVNu8e9qSxKVURZARIm8/A96xuvTfWMZcEbDlTf18eatk344XTuU48qzSI018Rp7/xsz7NMYm2/LIlEZB7eARkbJAuLIVux+00xJUvvjG5nPTLbXablxL7Y0cwXT0lk+4CwlaKMgKUE6kd9DqG/ancgjSGGfVVqu0w0En7VAnJgjsAKAVfboIFG6OzMtxdJTWQuswv3sUHwtiv1u85cM+AO7f2uhvikN8nMFiD8y9j3B58qLTDvSWKLN/J5qUjlwKsXfDh9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8295be03-3660-4f95-6c20-08df476220ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 23:58:10.2256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW8U+/+I/rJprA08Sz5DZOnM8NgFoYWOzA7J1VAa+3XpilSRqbe8GUpgUu05n1XIcLBA9NM4TWyELQXD+1eSKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tejas Upadhyay <tejas.upadhyay@intel.com> writes:

> Wa_14028564128 applies to 35.10
>
> V2:
> - Add missing pat indexes to no_promote as asked by WA
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c        | 39 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        | 14 +++++++++++
>  drivers/gpu/drm/xe/xe_vm.c         |  6 +++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 11 ++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  5 files changed, 66 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 5938fef22579..24caed262642 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -337,6 +337,18 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
>  		}
>  	}
>  
> +	/*
> +	 * Wa_14028564128 remaps every PAT index that is statically 2-way
> +	 * coherent (indices 2, 7, 23, 27 and 31 in this table) to a safe
> +	 * no-promote/UC/1-way value, so none of them are subject to this
> +	 * restriction once that WA is enabled.
> +	 */
> +	for_each_gt(gt, xe, id) {
> +		if (XE_GT_WA(gt, 14028564128) &&
> +		    xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY)
> +			return false;
> +	}
> +
>  	/*
>  	 * Disallow 2-way coherency for any L3 cache policy because
>  	 * XE_L3_POLICY_UC could still be promoted to a cached policy
> @@ -345,6 +357,21 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index)
>  	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) == XE_COH_2WAY;
>  }
>  
> +bool xe_pat_wa_14028564128_safe_userptr_index(struct xe_device *xe, u16 pat_index)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (pat_index != 2)
> +		return false;
> +
> +	for_each_gt(gt, xe, id)
> +		if (XE_GT_WA(gt, 14028564128))
> +			return true;
> +
> +	return false;
> +}

Is this change really related to the workaround?  If it is just a happy
coincidence that fulfills some requirement associated to userptr usage, I
think we could make it a separate patch and add some rationale in the
commit message.

> +
>  static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
>  {
>  	if (XE_GT_WA(gt, 14026539277)) {
> @@ -358,6 +385,15 @@ static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
>  	return value;
>  }
>  
> +static u32 wa_14028564128_fixup_pat_value(struct xe_gt *gt, u32 orig_value, u32 value)
> +{
> +	if (XE_GT_WA(gt, 14028564128) &&
> +	    REG_FIELD_GET(XE2_COH_MODE, orig_value) == XE_COH_2WAY)
> +		value |= XE2_NO_PROMOTE;

This is just setting the XE2_NO_PROMOTE flag and is not setting the
other required ones.  Is this is implemented this way because of
Wa_14026539277?

Because Wa_14026539277 applies only to A* steppings, we would wind up
with the wrong PAT bits on B* steppings.

Note that Wa_14028564128 must be applied to all steppings of graphics
version 35.10.

I propose we make this function set all the required bits and ensure
that wa_14028564128_fixup_pat_value() is always called before
wa_14026539277_fixup_pat_value() (and with a comment noting the ordering
dependency), because the modifications done by Wa_14028564128 are a
superset of the ones done by Wa_14026539277.

> +
> +	return value;
> +}
> +
>  static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -420,6 +456,8 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>  		u32 pat = wa_14026539277_fixup_pat_value(gt, table[i].value);
>  
> +		pat = wa_14028564128_fixup_pat_value(gt, table[i].value, pat);
> +
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>  	}
>  
> @@ -810,6 +848,7 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  		u32 pat = xe->pat.table[i].value;
>  
>  		pat = wa_14026539277_fixup_pat_value(gt, pat);
> +		pat = wa_14028564128_fixup_pat_value(gt, xe->pat.table[i].value, pat);
>  
>  		if (GRAPHICS_VER(xe) >= 20) {
>  			bool rsvd = !xe->pat.table[i].valid ||
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 2ac6ddc66587..247dc0faa095 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -105,6 +105,20 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>   */
>  bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index);
>  
> +/**
> + * xe_pat_wa_14028564128_safe_userptr_index - Is this PAT index safe for
> + * misaligned host-pointer userptr/SVM binds due to Wa_14028564128?
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Wa_14028564128 reprograms PAT index 2 to the no-promote/UC/1-way policy
> + * required for misaligned host pointers; once that WA is enabled, index 2
> + * should be accepted anywhere PAT 19 or a 2-way coherent index already is.
> + *
> + * Return: a boolean indicating whether the PAT index is safe to use.
> + */
> +bool xe_pat_wa_14028564128_safe_userptr_index(struct xe_device *xe, u16 pat_index);
> +
>  #define xe_cache_pat_idx(xe, cache_mode) ({					\
>  	const struct xe_device *__xedev = (xe);					\
>  	enum xe_cache_level __mode = (cache_mode);				\
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571..80ccaa44720c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3888,7 +3888,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>  				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>  				  is_cpu_addr_mirror) &&
> -				 (pat_index != 19 && coh_mode != XE_COH_2WAY)) ||
> +				 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
> +				  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))) ||
>  		    XE_IOCTL_DBG(xe, comp_en &&
>  				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> @@ -4033,7 +4034,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && xe_device_is_l2_flush_optimized(xe) &&
> -			 (pat_index != 19 && coh_mode != XE_COH_2WAY)))
> +			 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
> +			  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))))
>  		return -EINVAL;
>  
>  	/* If a BO is protected it can only be mapped if the key is still valid */
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 31245c6c96d4..80dedeaae579 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -594,6 +594,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	};
>  	struct xe_madvise_details details;
>  	u16 pat_index, coh_mode;
> +	bool safe_pat;
>  	struct xe_vm *vm;
>  	struct drm_exec exec;
>  	int err, attr_type;
> @@ -653,9 +654,11 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
>  		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
>  		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +		safe_pat = xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index);
>  		if (XE_IOCTL_DBG(xe, madvise_range.has_svm_userptr_vmas &&
>  				 xe_device_is_l2_flush_optimized(xe) &&
> -				 (pat_index != 19 && coh_mode != XE_COH_2WAY))) {
> +				 (pat_index != 19 && coh_mode != XE_COH_2WAY &&
> +				  !safe_pat))) {
>  			err = -EINVAL;
>  			goto free_vmas;
>  		}
> @@ -685,10 +688,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  					continue;
>  
>  				if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
> +					bool invalid_pat = pat_index != 19 &&
> +						coh_mode != XE_COH_2WAY && !safe_pat;
> +
>  					if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach &&
>  							 xe_device_is_l2_flush_optimized(xe) &&
> -							 (pat_index != 19 &&
> -							  coh_mode != XE_COH_2WAY))) {
> +							 invalid_pat)) {
>  						err = -EINVAL;
>  						goto err_fini;
>  					}
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 03b713f55dfb..6a48b2c716ea 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -74,6 +74,7 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
> +14028564128	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)

This is a temporary workaround for graphics version 35.10, meaning that
we should drop GRAPHICS_STEP(A0, B0) here.

--
Gustavo Sousa

>  14027054324	GRAPHICS_VERSION(3511)
>  14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
>  		MEDIA_VERSION_RANGE(1301, 3503)
> -- 
> 2.52.0
