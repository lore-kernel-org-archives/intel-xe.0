Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EE9C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5836B10E79F;
	Wed,  2 Jul 2025 22:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jc9T6b3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5410E79F
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751496016; x=1783032016;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hLlgT/v52oQR4msGYXC2TSHetvD+WYKpKJ1yvAEWZlQ=;
 b=jc9T6b3mc3FbCM6TvrRhOLnXbnjJuvjgZNfgYiqAFeQ85XY7LDuZ4a1M
 aLFgrOobuMrdWo3CWK3tZ/unpcGoiS8gDm2w1n30nvG5Kgv401rCLcpuZ
 uqL4W9VQFNFPBQ5deGjbI4u2oymgThVFrxTicpsVD7F9Yxfs8NbAkKZu6
 LIvI1WpPtxhRHawNjWiav4GSPDxdVYNLB5N4Yn7UAy+r6GoEU/xSqkq/w
 HMHP8Z+tXj9jLBfCzJ9l92ydLkU7MwYtWMvTgnYHK8cb77VOqByWHZhIz
 S1bufjfnOTJAQBi1amJhAGqsFryNlcQwqvgtjVL13ozPnHZZEBjCcdvQ4 Q==;
X-CSE-ConnectionGUID: /evSH/KBSWivCDl8aLWt9w==
X-CSE-MsgGUID: sp4jUnI1RYWbLSWbzM3bVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52926475"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="52926475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:40:04 -0700
X-CSE-ConnectionGUID: DZCqEFu+QJy1E5zUXabsRw==
X-CSE-MsgGUID: 0IX5ALcaQb6qmCNhwj52hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:40:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:40:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 15:40:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT+RGk5ReuKR4CFDG4Uw3L1l6/OAPxi9oTScv1yZWOD3kLoRJoGMuz0hqtS1ys3ozbOZ75qUajNaMdEJH9VwlOblvkgBQbvkAuOfazPQeiizKMOF8JRe1J2c8p1NimsoG11ny2PF/O0tUBONpCo1TvOWEkp9WVyC3GB17cFQbqkY1f8BSrDF+Bj6rqp8pxofIFTlawGknYNz616/4XzChXULv5PGlwm21Hq/iLVd8dLzH7YHulBJGQNILBKCcoBaW0gQWsgwrDHjQCLOGyMVp7X5dU9LVULMhsDlwaA4K7F1HzotNR30yv645qLgGSORH4RoFiYJ3JFVmVjA+Noz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktAIJgmpEh24BHAWnqFsL6KJtoTBdflNucIQ8qa5dxg=;
 b=GtKOvNUL4Wqeed1IxbCtT6XP9mTVcrZMK6FDb3ejJdtZBJrtfZ90lAAI8zd7RdIKaIfxoQz74GxmJLT8TpE1yx9xdpDk1hXDcjP4UgiBVliWw+rkKXvJa+k0uwvdc51JJgw3Tw6JyyJ+8W5mTCA3bxAFOk2uv9N8cRiyhNJ0SicWbKG2tm3aXZDAwmvK4tR9oA5S+VILCKUP7kgzBBb3VMxdjlg6g6zjkwdIvPQ4lCXkTjrUXy8QHJB84Gr61RHI+gVljm+/GFBT8YDP/DkSWsrfqXmhDbaUwwBz+YPNYiHCaFwGjoDa5VMHeyDJMzsPLf0Hu92GVKHZU2ssOdBRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 2 Jul
 2025 22:40:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 22:40:01 +0000
Date: Wed, 2 Jul 2025 15:41:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/pf: Invalidate LMTT after completing changes
Message-ID: <aGW1poOpWmu2qa8P@lstrano-desk.jf.intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
 <20250702223041.1700-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702223041.1700-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ccae0c-7889-4c33-c67f-08ddb9b96143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHUzZTRNNG4vdjVPZm9XTWxCaEoyeGsxL2FKeSs5SlVNN3lPZzFvVHhQajJL?=
 =?utf-8?B?bkRCN2xyQjZBWXhKOWllaHBjdnc2L05YMytWTnZPUTNBNldGRlNCLytGdlZy?=
 =?utf-8?B?S0xaVlB0RWlMY1RaVDBlMTJHZmxTMFhYZk5wVDNtK3F5eTJ6UlJxZGRPSk9W?=
 =?utf-8?B?SWNaVnJCOS9NU0JzaGhsUEVtTHNwZ0JNS3pYOG03Z1B0ZWFaMGs1ck9jTzhi?=
 =?utf-8?B?Qk9GNUkzVDdaTFFXdmxKTEM0SUVQMmFPYVBBTnJSZ2RxSGpaeHZpTWVGUlIy?=
 =?utf-8?B?MzMxTnN0MzJwdVNvRWxUTFBSSTlsbU5haktiWS91TGtiYlltZk1IZ29adzBW?=
 =?utf-8?B?RnRmMFg3OEVza1R2T1JESFNPWm5qaUh2b1Nqdi93RUxxVVI4S1M0WFQycEVV?=
 =?utf-8?B?VXYrekovN0tjakpkUkp3Ykw3K0JTZk16dVVrb0h3QmpTL1loVEprM1FIRmlD?=
 =?utf-8?B?R3R0YnRLU05Qb1drYU9PemN0dFBzcnlTbFY5K0kzcUcvblBtSVo5K1BpaFdF?=
 =?utf-8?B?blNZcFdWSExTOGJCdUxIWmRuYWRnL1Frb0VzS3RnS2prUTZGemplVS9EYktQ?=
 =?utf-8?B?eGp1T3czY3gvdittcy9PZGdNRjA4OGhyRnVkcUYzMVg2dWxJay9RY3owdTJs?=
 =?utf-8?B?MHlUNkcwcWx5b0JYektHRlo3TkZmd3BxNkxKRG1yenNoeDNCZTN4YnZwcGRD?=
 =?utf-8?B?R2dUOWhINzcyaU9KT21nRS8yU1Y0RHloUDNLbXMzK0gydloxRjRhNzJqNzNp?=
 =?utf-8?B?cG9uOURRZUYzdmhSTEFudjEwU2VHYXQ5aWJiRHA5NEUra093NFI4bTRGUUdi?=
 =?utf-8?B?YzBjRm4vTUp0OXNoVGRHT1o4SUkxRmFIMWttR05nWWNkQ1RyaWYyNUF2RWhU?=
 =?utf-8?B?eFo1T29JcU9rL0kwdm0vZURDbTFLcVdDcmhqNm4zY0c2TURnYnFjQXUrZE5G?=
 =?utf-8?B?MzA2ekRaZnZTTUpEdndhVDlyUFM5YlAwR1l5dFRSWmlsbENLUDRqMnJUTDIv?=
 =?utf-8?B?UEZWMnp5N3BOT1dKdG4xcnVyN1VEZkhmM01ScHlWVzVRTEVWeTdDSjkvMlJJ?=
 =?utf-8?B?WlFUZUQ4QjhqNUNzK3Fla2Y2TElTWEJnVm1SSnI1S2tkQUV6bUpKMS9ZK3hp?=
 =?utf-8?B?ODkrZFJZd0FqUlpDaHJwN0xxOWVWV25xS1hKdFoyK04zL2JWbnhoVVRha0Nz?=
 =?utf-8?B?azJlYVJoWUdHeE5RSFo5bmYvWkozby9oVlAwcS96Q3NVck1WTEtoSnBwWXBI?=
 =?utf-8?B?L09TUDd1Z2dlanhSWlFoL241ZWpKY3FRTHRBem9VSWFoSkR2dFhhc0sweHhJ?=
 =?utf-8?B?R2dsYURFaEVyeEp0UkZoRFlRcEp4cXd2V1dqOEVDVmpyRjM3RVpvZko2S0FR?=
 =?utf-8?B?eUhQeDFOK1RqRElBOGNZSzY0Uk5vdm1zNVV4UDhqYndsWDhiRmFjclo1bkNr?=
 =?utf-8?B?bUZDRWJsd1g5ZmY1dFhkWHM2YWFQeWE2Unh6dlNpcS9YZ0ovZVFhZEtvbVFY?=
 =?utf-8?B?MjdpVUxBVHFCb210UmNjZGFxQTRrNmo5ZXZjWjFsVU40SUZQMlR3THJ6S1VV?=
 =?utf-8?B?N244TkRiUGFyWVhMeGw1ZUUvL0NHaVMxSmdKb0o5VGNhbEJVK1Ixc2s3enB1?=
 =?utf-8?B?OCtBWkZNZkFQeDlVckFpbFVSVnZ6RnBxUnM2MXlvakdMYlhPeUF5ajY0cjk2?=
 =?utf-8?B?T0xSVldhUkU1MnM5TnEvZmlDTlZOR3NmYi9ROFgxM2I3Q0lxb0NVQk1vVmY3?=
 =?utf-8?B?VHlsUXdTWWUvcnlSeXdFVlFWQlkwNjYzbkZsVDdFRGxYVnZjTXNscGwzVDdn?=
 =?utf-8?B?aUJkOCtuS1g5R2RLcDkwaXBrUEJZSG1lM2UreFNsbnA2LzZSUU9QUEptdG5t?=
 =?utf-8?B?d0dCV1c4ejgzQmUyU01LKzF2Zm44QWg5dFpGTmpPUEpvaUh5eUV1T3FTcEI3?=
 =?utf-8?Q?vdmBC1kLoOA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJGUkxNMmVwTjNKanJ2SllIL0tKM1FVaXh3b1NiY3M0Yy85dlV6YVVuekI5?=
 =?utf-8?B?QUhVeDBKUmxuTUQ3bHU5aEFmM01rWUd0Nndvb084K2ppUXBtSVB5ZHJ1R3JY?=
 =?utf-8?B?TG1nMFZzRkI0RTJDUENjR1FON3VvbTJneVdHcGE4Ynl1bDBXUkhQQlFQemlW?=
 =?utf-8?B?blg0OGtIMG9Jem1yYmlSYlpyMFk1Rmh6KzFmZzhYUVJiSWJuV3huMkxGS0w0?=
 =?utf-8?B?bDRZTEN3VUpHNmxUQW15cGtVcFNLK0RmZitLZk9lU0w3NStRYkJSdTVYWG5Y?=
 =?utf-8?B?SW1FZHljVFAzR0s3TjB2cWxqNTF0R0NNMVI1MElLemtGVmJsTGFDVWpvdUhh?=
 =?utf-8?B?UStLVXJqMFU1UjQwODFpaEdKcVdTZW1TdVB4SWprR0VnVzYxZW1Bc2ZGbDRC?=
 =?utf-8?B?MCtjVDdkMGtwakpRcStWQktaMDkvQVNjU2VZL3pLaDZuNjJ3UDFVTzNrZFdy?=
 =?utf-8?B?UTNVQ0hER05GNUZVUnk3K0cwSW1mdW53NjBSVWxvMnZSRUpBWmUwMkEreTNG?=
 =?utf-8?B?SDRIcGpSYXZDNGNIUVZMU3FuOVk3Rkd2ZER2STdkeHZVZUhNSytER2kyclRv?=
 =?utf-8?B?aStmbkpkaXlleTlQdEJmdll2aXZmSGNpQ1lLVDBIYUNsYzJZcHVhQng3bEl4?=
 =?utf-8?B?NUROdkluZ1dWcEtydmhFM052UVZFcFRRYXA2b0V1ZVYxMjdzcVN4bTJyMzB3?=
 =?utf-8?B?RjRHY2kvOW52a0oyd25TUjgrSmhFQnJ0SlRodGkrenR0NEVsdFN5TFp4QXRQ?=
 =?utf-8?B?OFlxMGdoUnI4TUdMQ1Y5MFQ5NzRiSHlwVEJoT3QyRlVDNVZYSFQySGdtdTlL?=
 =?utf-8?B?L0hEUkFOUUtocnpJcnU2T3RaT1Nwa3ErVjAxRTlTT1UwV2ZHNzcrdlIwWS9N?=
 =?utf-8?B?NWJGK21lZ2YweVY1bnpGS1FOM2t6T24yQXRPeHpoUnpmdzFaQy80MWlZYWJN?=
 =?utf-8?B?VW1nbUhpNmIwZHNOS0QzS3NOWWdjeUgxTDJQeGlKTC9RL2V1YUhnUnhTUWxj?=
 =?utf-8?B?OEtRL0FocU9aUDFqRjVkL28zT3lzM013QVB1bWt5RjVubzU0M3BJbVlnQ1Bj?=
 =?utf-8?B?TnByaHVqb3hWMmppeUM4Wkh3RDZ4Q0sxMGxodmJTT3RtUUVxSjg5b3M4MUZm?=
 =?utf-8?B?R0Z5TU13UVg4Umt6K3RDeGlURUVpbnVkczhaWXlBOVpZdW1lcUhDTExtM3pJ?=
 =?utf-8?B?dVVkbXN0LzU3cXpDSDhHQ2VCbW92T3E5MEhqRks3WnNWTTVMNGFXVERpUzdq?=
 =?utf-8?B?UWNVaFQvVlBiRzR4b3NoRGU2dit5RW9DaE5Hd0F0TXVXTzkzWGVrL091ZEk2?=
 =?utf-8?B?TmJyZjVOTXh5dGVJekRhQ0FwVHdINzZRQ2xjT1RNSFc5SEZKY2VZajJUNkVi?=
 =?utf-8?B?eGZxZG5BazBWRnkydzdHVzBnYStnbkJ2Y2Y2WGo3Yi9QZFF3TERPMlp0NlNO?=
 =?utf-8?B?TkdwN0hxNGpsNFNEc01aMUI2eGdTbWNsMCt0TlBrNHFzYzJsbnJFc2haM3kw?=
 =?utf-8?B?VnJ4Vzh0NXd6UDNRYzNrYmNhMU1nNUZSZFRiSjAzUXNDazFIRFRrQmRQak1D?=
 =?utf-8?B?L2JLd05hQ1ZmT2h1RVVTUTVmaXhaZ1k4N0xyWlJPa0ZlSjVlUjBFOWZjWTcx?=
 =?utf-8?B?V1hHTWcyamtFWE5UQ2lLaGpVOWdjcktjcUdmZHczOHVtUWhaVjNQVEYyaWhi?=
 =?utf-8?B?MDh1VVV1WE0rVVIrTDIwSk1oMktiSGtJOGdoL1piNFVVMUZVVEJBTU5TY2Ra?=
 =?utf-8?B?Um4za1h5dVFlcnI3Sk44bDMvVkZwemRnbC9PUmxNeE1GVnpGQUZGa3VnZS8v?=
 =?utf-8?B?dXlCZG11OWFLY0h6NTljYlluM0gzSlNXSFNnUmFGMHVoa3UzVnE3SENSNkVw?=
 =?utf-8?B?TFlNTVAwNldNSCtsYU1oaFpSbkxseFp4ODZvM2xwOGRiblphVWtVekF4M3FL?=
 =?utf-8?B?VXFVK3AyTzBrVktEb0dGek15aFBOTE1ZY2d6NU43RE1VZkRXeXU2K20wT0xY?=
 =?utf-8?B?aUcrNC9Ya3VGbVdLWW90RnY1Rkp4WElOaWFtNU5JZjhFMjAxT2FwZkZ3MytN?=
 =?utf-8?B?eW8rUTVtR3VhRTZ2Y20xc0xUWHd2aFFLOTBRUzFIM0NlV2V0ZEpMZkplc2ZG?=
 =?utf-8?B?eEc3RjFLMEJIWVB4eUh2QTNHWkVIRjZGQVZEejFhYTNzT1JvTE40akpGOTVv?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ccae0c-7889-4c33-c67f-08ddb9b96143
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 22:40:01.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UdWJBwx8YCqFc7Cojn3ilzed7tcgx1TRZU8dppsfL+IHYvNNgeoBzG6FkQw36wWw2TP41kdK/oI+8lL9n65Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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

On Thu, Jul 03, 2025 at 12:30:41AM +0200, Michal Wajdeczko wrote:
> Once we finish populating all leaf pages in the VF's LMTT we should
> make sure that hardware will not access any stale data. Explicitly
> force LMTT invalidation (as it was already planned in the past).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index a75ef4007a1e..a1b916e80fdd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1327,7 +1327,17 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
>  
>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>  {
> -	/* TODO */
> +	struct xe_lmtt *lmtt;
> +	struct xe_tile *tile;
> +	unsigned int tid;
> +
> +	xe_assert(xe, xe_device_has_lmtt(xe));
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_tile(tile, xe, tid) {
> +		lmtt = &tile->sriov.pf.lmtt;
> +		xe_lmtt_invalidate_hw(lmtt);

If this is a critical path, you may want to consider issuing all TLB
invalidations across all GTs/tiles, then waiting on all fences to
pipeline these - we do this the VM code which is certainly a critical
path. If this is not-so-critical here, maybe this is ok.

Matt

> +	}
>  }
>  
>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> -- 
> 2.47.1
> 
