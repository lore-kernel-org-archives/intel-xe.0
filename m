Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F64CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 16:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F010E242;
	Thu,  2 Oct 2025 16:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2OZAUyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AA510E242
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759420874; x=1790956874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gmoMXXijzJZB8lETRWVCTYYmJA1l+GfP+aN//McRHfc=;
 b=c2OZAUyY3GgNKond7vZwIWy9C6KphclOAypzTmir/5JvfPlv7sSvAFFx
 7aRmkpSxJdSQ8Yv/daTNkNisWxRlaFKo9iUDupwIQJdRznEdMexP+NkML
 WKgGz8yp+lpxHpHfktvDvQEG+2Xot4QIPN35/4PfLmKE9eP+7kq+7rDTJ
 rWTD4ZbmuTSvm6yCLJW6qWuYYrAFx42bCRqMzRWnisbVfF4hQoCpVlqYV
 mXq2geHisbDXddBqEKYy1pkE6DqKxhPzuNMFwv5A2Cst7bvWQX9FFcAun
 4CUqztpWl0W3NSov7obzHHL3OHkw6y8GuH1EUu37QZTQnDaXnOnbiQZuF Q==;
X-CSE-ConnectionGUID: LOjUOlQhSYygUOxlCfe8Cg==
X-CSE-MsgGUID: l4tIQvuBRI6N9qzaDVijoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61594836"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61594836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:01:06 -0700
X-CSE-ConnectionGUID: vCbhpluqRyGfC+1gciIZKA==
X-CSE-MsgGUID: pZQuQk4cSzmckfx5RRZqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183369894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:01:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:01:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 09:01:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5YiO9+OEvCeB7IuYRwgYjykl86lcHE9XG2Nq01QaGR5y87HyBzGVo6MO8PyU+FeWIUzpFxDVu1bH7ayrJgljH9KOMnD5A4lJDSBBoJQFfC+pX9hoK7Wl4thJ9cFPeTr5+dVnjnkU/vI9Y12OzVC0C6moTQ0tDeWAscplbhWBdRNjdt5aiTBnIk0HJJakyGHzU8V80fmzM4Vkmmy/w5GAwR2k1aTSKKHWrbh6iDsvpRG13A7Wu0pAOXF4Yen7jdn2VH3RlYg7AVZJwePSwkIXVR7AR2bssIgh/3SkBiKYgP1Uwh5vs0v+J9WIcto/FzcKzOfKicptbXNRg0XzJH2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlIenHmyLvJzC2jERYgOtmw59sikA2UrX6haTUtzOCc=;
 b=GTt5FcjQt4/tlgZ7B5xXbhefWmjJSE27UgMR8XalUXJswWCzy/6IrogH8MckM9rIUzPaf2iD13gBYsHwAzoq0YfAsK+Y8tzOJMWV/1cw8w5XdFy7KmwRFsVEoEzNjjeQMUx169a9MzXBsIliuRmthLLSvRGf8DmmwrAGL6rDZtsgCI6pXZeLANS1WSvMRrWK2g1HI4J2/Kc9vHDKmIY9nq16FX8lH3WeRqqGB9rdUKzKx0YpVTloM8NeDoiVmGOPPtkg6vKS61jb7ISNYzNao3KOuDPuUcqRUuFz+1rO0HFEbXTcYxNtj4jdpVxBL7WJuDlyJd8kmdriHuZZAVENEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 16:00:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 16:00:58 +0000
Date: Thu, 2 Oct 2025 11:00:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
Message-ID: <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251002150302.99524-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 4129c472-5447-4a2f-2cf1-08de01cce024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sXrrsOSpzq5Lo/nPi63Sn81mKTBqWV4DRIEbvwVRuTzyi1jhql6dptPk2XtS?=
 =?us-ascii?Q?tter9SsnGj7FizAbQ8NgdNjd3BzOLwK3VuQru5CNrypzJfk9levGiZD7ok4N?=
 =?us-ascii?Q?+NNA9V/iJtw6NbDwO9oaOkuNzlsUzl3AfORdo6DZSfMWbUcESxdA0c6BeH2u?=
 =?us-ascii?Q?NVfu75Tp5Nef7Wyhm5kKMY69Bg0Ng0QpXYPfu+dACqeSB/zI55HaYf908BJl?=
 =?us-ascii?Q?XmNprIPqQPUXt29WVS0U6TiRgNxuIPRTTlEiwldP8XJttsMpo70ErjWhSywm?=
 =?us-ascii?Q?fb7XhXbi4rvUPpk0gl6R6i4/YkB8jDMslu6UykhLuaydV3X6TGURnq650zbm?=
 =?us-ascii?Q?BlSfK0ul3kWLbqh4GCBAzWY+eJgRg1H7lm5PMkwQ9+Q/MsfjMsqs01zg3a9P?=
 =?us-ascii?Q?CW5pegT2vpj3LJMa/oN3Z3gsZAKEFyssHr01ZThV7xVSZesLPunk01OkiOPf?=
 =?us-ascii?Q?cHkhoTHecLs7pt4QjnYXS3RfNVFAFw1gq2gCFeickxkpAGmCVMIa6AAvocsS?=
 =?us-ascii?Q?0D+U/Hex/1/0HvE7WYxPwbzCAS3zTpsp1JmtTpaRu/KNospWujGbB+Cmv1ns?=
 =?us-ascii?Q?zIyNEBZSucWhBDQLEf99pPSVLYzMJKsmljTLkOwVevTo8Mg+3N3snrbXGMI+?=
 =?us-ascii?Q?O2LCBKnLHVKgfc7+BloCC+khWHEP6/Llt6oh+Bmh2vzEIRX3UYRudHoGa3Tl?=
 =?us-ascii?Q?nGs9hBHMzemLWdGyH7IYAu1e7LlHu/eOwlqdu/n1CAHsjJd4sE/avjVX+Ewn?=
 =?us-ascii?Q?RHhonnIBFGCNHE6PwXUjjfXbGUuCVIeMBD2BuAlCNrMOVNa7eXH/GE7Ch9VV?=
 =?us-ascii?Q?hP+BKuw9rR1YJGnPpoNOkv2+8qNrDCJcseW6XZytui266PupRCJLDGWXPocE?=
 =?us-ascii?Q?VzZHEx0OiYVkDDW+h38AeDtJkj92qN59pawwRiQux/Dkr0obJoEOnV6XWhrW?=
 =?us-ascii?Q?rhgMG+VNjy1WMCAsmHE17lOK0xlYm456maZlZghWCj8t0NH4XtvedfacVGAw?=
 =?us-ascii?Q?uQZR1FF5YePWkaNsYELbCHKjw6ypCHCerTSOm7Y0rYB5QbMKsx1RAc9spV8G?=
 =?us-ascii?Q?Te9G8u3e2rYj16UgXaAy2MiifTblq0NfZ1NXEUywOrIVGHY9AawqOPUm2BUl?=
 =?us-ascii?Q?IWs5bekMLT/xXEydeG3h8aEOpXvGPzOLdMvOnjgwaj6Oc9ad4Wvzn4yYWH1I?=
 =?us-ascii?Q?ko0yjgpvesxwH9WmvoFhlQwN8dsR5bFwZB7iYRRk3/0JhnSbzunfeVAnNAT4?=
 =?us-ascii?Q?G0NJ8SWMjFW2Q7MHP7Cy4+rwkTiM4f9z2avn0meiONSY/5ODwU+6Z/T6z6Q4?=
 =?us-ascii?Q?Y3Pj9pG/hOr+VA76Iix4SLpENczN2/+ydq+iMOao0xnckDTenjbSmunN84c5?=
 =?us-ascii?Q?T20l7leWMfNq1g/ijoaV/81kd0DGmgCFCH8Oxjj6m6kt31bQmDbabVVdV52T?=
 =?us-ascii?Q?sDVMGkdznUPLgjvNScgRW+i1XPhMA1xF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMy3z5mee2zXbpF3KseCRi0SC1mGDsOoNmS6yEqTWDwXoVhujeK2AGB3Lclp?=
 =?us-ascii?Q?1YcYQ4S7zVR2CGv7jwz+kDcWuH1EDy5PuaXZLlC++cAWoW1z4dYlHvROUNgT?=
 =?us-ascii?Q?61ZthMmNNreMA04VyhXAty8GwbY63IFBmQEBZgldOXjNbLlz9U79HMK/TlcH?=
 =?us-ascii?Q?H/4MkPywKeiHyx2hjH6Aw4dNl7IOw5d5EA1lAkaqYrXZVeHzNqfVs/PAAPsi?=
 =?us-ascii?Q?0/Cz7twZarlHJosIjHH65iCNAkiYhzSw/kDkGIJnaHI8jttcXEMwCoCR+5pI?=
 =?us-ascii?Q?arRm6SzJaxihkly2bpDTojSLiAdBV1d9SEQjl7UI5dlVziJgL3DsBIk1Z8hF?=
 =?us-ascii?Q?KlVhl2eViK/M30NXzTSYL+bw8IO5P1GDhRmc1jrYHo4Vaw+ZFIsCRG7hQNH2?=
 =?us-ascii?Q?DBrokUL7QUKVOQ9B2UsK9n39MBTR5QNnkiAnuBBgUXIwjV1ABSRVXVAMhxzj?=
 =?us-ascii?Q?vX0sU9qbVvVBFr2C8jTs5zXNaPFPHdUO8qMMzVnqRXqtAiCxZxMDSm7l/gDU?=
 =?us-ascii?Q?uoeZa9edCjnMk0i45MG3VGmEUvNeiV6qfoQK+RHgjI1LIJ+1ZudXY5m3n03U?=
 =?us-ascii?Q?zegNlFHCT5PVEF56rt2e3r9ubkJVSy2rDQ6KYx5tQYH7ZZZlA4nZlZ+5UkxS?=
 =?us-ascii?Q?JqQaiQqFoI1UYp5cJ9ehGg7LMYvw3B3feVYfNfs/MwmSgrssjgpPTLuGCAg1?=
 =?us-ascii?Q?+xbejU2LeQGz9gCeGhn5XNdjD/J+tr3yTV7SeQN4BRI7aRR+++prcFEIvZmx?=
 =?us-ascii?Q?+fI3DZyJlD8FboIFPErf7cfILCmE/zgkGFhMAiEdQscQ9Ox4rTWtzU7semxT?=
 =?us-ascii?Q?ZTzjgkKLLTuwwZyD3TXX8JL/kdi0lp2YEgEHk3SQZDHFGA8iZgtlg2DcDbZc?=
 =?us-ascii?Q?KXmZAi9L+N0BjyHppesSeiXNcRWOWT4/x5KmsVI8tuWBfais88JQ0e4Zuy/U?=
 =?us-ascii?Q?6k3ODTR17Vx0PLhdE6yK01LzF4yFyspUKHb48fLOOaldQgrh8d34u2pcIO1R?=
 =?us-ascii?Q?83jHfeZP7E35papL0b56w0wlSZh/TqJrf+xad5WDL7ONKdWhsIbUiJQPZsOo?=
 =?us-ascii?Q?rcX527VQGzA5fq0uSHNKNIzKqxhz7etIen55mjYQT5p1VMIKKls0HeGGV980?=
 =?us-ascii?Q?xXVkv+oPB4nVmJiPTjHD/oA5bt8L2Rc3HoNkjHYu21O2mxLRZU/DLlmAM6KQ?=
 =?us-ascii?Q?4P4GItjzMrUKYUgSji8bOLOach7K30c+p8KppeDcnO7QbtW33OD3eKmXnvkv?=
 =?us-ascii?Q?VFt+WGZIbWMGXTZ+3jhn+yW1MSqY1F2rweYTC/XPBs+9Hp4RWD6G3zleHOeC?=
 =?us-ascii?Q?b+760VA2M3ey09bUn25xL3oKzN42ExxUH8G6r2xvHe4bT4R8Ze5MS6izcSyH?=
 =?us-ascii?Q?/DzvT0+EzjNjya25jFoedh1sTA88/PLfDAQ5E6KehcqYvwtQJlWuqbH+tzNb?=
 =?us-ascii?Q?AkwJKBt5hchmUa3WmIaLQX9zVOVbjs/ZnynNK6MMDEqNIwmhbebuHq74b29w?=
 =?us-ascii?Q?wCtqYJNdX76TBy6royk9eGw1Lfw3pWThee3MV1CThebB+JR3B0duzsbrFEIE?=
 =?us-ascii?Q?3p1PwdAD2zTcXFEg1iFaeFyHO/XnyL41LAVEHaloKmsY/ztx7yGGnKl15dn5?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4129c472-5447-4a2f-2cf1-08de01cce024
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:00:58.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcRMfQyIDbcM0HjJIjbJxYVKplQyD2IQVOlm6x8NRdly9bRATZp7y9mldv90i2uQP3L/gcSCaEJUwN3nYAz3k/DRBoLB3fKQ2iNqijyC7kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>Add prefix to GuC log buffer macros to follow Xe naming styles.
>Remove helper functions, replaced with macros.
>
>Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
> drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
> drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
> drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
> 4 files changed, 36 insertions(+), 77 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index d5adbbb013ec..b0ea9a13847a 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> 	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> 	u32 flags;
>
>-	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>+	#if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)

can you also add a patch to remove the excess use of parenthesis and
indentation? Should ahave been:

#if XE_GUC_LOG_CRASH_BUFFER_SIZE % SZ_1M == 0



> 	#define LOG_UNIT SZ_1M
> 	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
> 	#else
>@@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> 	#define LOG_FLAG 0
> 	#endif
>
>-	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>+	#if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)

ditto

> 	#define CAPTURE_UNIT SZ_1M
> 	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
> 	#else
>@@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> 	#define CAPTURE_FLAG 0
> 	#endif
>
>-	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>-	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>-	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>-	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>-	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>-	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>+	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
>+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
>+	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
>+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, LOG_UNIT));
>+	BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
>+	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>
> 	flags = GUC_LOG_VALID |
> 		GUC_LOG_NOTIFY_ON_HALF_FULL |
> 		CAPTURE_FLAG |
> 		LOG_FLAG |
>-		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>-		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>-		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>+		FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>+		FIELD_PREP(GUC_LOG_DEBUG, XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
>+		FIELD_PREP(GUC_LOG_CAPTURE, XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> 		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>
> 	#undef LOG_UNIT
>diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>index 243dad3e2418..acb95a93b530 100644
>--- a/drivers/gpu/drm/xe/xe_guc_capture.c
>+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>@@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
> {
> 	int capture_size = guc_capture_output_size_est(guc);
> 	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>-	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>+	u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>
> 	/*
> 	 * NOTE: capture_size is much smaller than the capture region
>@@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>  *                  ADS module also calls separately for PF vs VF.
>  *
>  *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
>- *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
>+ *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE (warns if on too-small)
>  *                  Note2: 'x 3' to hold multiple capture groups
>  *
>  * GUC Runtime notify capture:
>@@ -1368,7 +1368,7 @@ static void __guc_capture_process_output(struct xe_guc *guc)
> 	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
> 			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>
>-	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>+	buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
> 	read_offset = log_buf_state_local.read_ptr;
> 	write_offset = log_buf_state_local.sampled_write_ptr;
> 	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index c01ccb35dc75..fa1d490dca0d 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -50,16 +50,16 @@ static size_t guc_log_size(void)
> 	 *  |     Capture state header      |
> 	 *  +-------------------------------+ 96B
> 	 *  |                               |
>-	 *  +===============================+ PAGE_SIZE (4KB)
>+	 *  +===============================+ 4KB
>+	 *  |          Event logs           |
>+	 *  +===============================+ + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
> 	 *  |        Crash Dump logs        |
>-	 *  +===============================+ + CRASH_SIZE
>-	 *  |          Debug logs           |
>-	 *  +===============================+ + DEBUG_SIZE

what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
referred as DEBUG_BUFFER_SIZE

Lucas De Marchi

>+	 *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
> 	 *  |         Capture logs          |
>-	 *  +===============================+ + CAPTURE_SIZE
>+	 *  +===============================+ + XE_GUC_LOG_CAPTURE_BUFFER_SIZE
> 	 */
>-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>-		CAPTURE_BUFFER_SIZE;
>+	return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + XE_GUC_LOG_CRASH_BUFFER_SIZE +
>+		XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
> }
>
> #define GUC_LOG_CHUNK_SIZE	SZ_2M
>@@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>
> ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>
>-static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>-{
>-	return CRASH_BUFFER_SIZE;
>-}
>-
>-static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>-{
>-	return DEBUG_BUFFER_SIZE;
>-}
>-
>-/**
>- * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
>- * @log: The log object.
>- *
>- * This function will return the capture buffer size within log sections.
>- *
>- * Return: capture buffer size.
>- */
>-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>-{
>-	return CAPTURE_BUFFER_SIZE;
>-}
>-
>-/**
>- * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>- * @log: The log object.
>- * @type: The log buffer type
>- *
>- * Return: buffer size.
>- */
>-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>-{
>-	switch (type) {
>-	case GUC_LOG_BUFFER_CRASH_DUMP:
>-		return xe_guc_log_section_size_crash(log);
>-	case GUC_LOG_BUFFER_DEBUG:
>-		return xe_guc_log_section_size_debug(log);
>-	case GUC_LOG_BUFFER_CAPTURE:
>-		return xe_guc_log_section_size_capture(log);
>-	}
>-	return 0;
>-}
>-
> /**
>  * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>  * @log: The log object.
>@@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>  */
> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
> {
>-	enum guc_log_buffer_type i;
> 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>
>-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>-		if (i == type)
>-			break;
>-		offset += xe_guc_get_log_buffer_size(log, i);
>+	switch (type) {
>+	case GUC_LOG_BUFFER_CAPTURE:
>+		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>+		fallthrough;
>+	case GUC_LOG_BUFFER_CRASH_DUMP:
>+		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>+		fallthrough;
>+	case GUC_LOG_BUFFER_DEBUG:
>+		break;
> 	}
>
> 	return offset;
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>index 98a47ac42b08..0cc059cedb9c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.h
>+++ b/drivers/gpu/drm/xe/xe_guc_log.h
>@@ -13,13 +13,13 @@ struct drm_printer;
> struct xe_device;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>-#define CRASH_BUFFER_SIZE       SZ_1M
>-#define DEBUG_BUFFER_SIZE       SZ_8M
>-#define CAPTURE_BUFFER_SIZE     SZ_2M
>+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_8M
>+#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_1M
>+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_2M
> #else
>-#define CRASH_BUFFER_SIZE	SZ_16K
>-#define DEBUG_BUFFER_SIZE	SZ_64K
>-#define CAPTURE_BUFFER_SIZE	SZ_1M
>+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_64K
>+#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_16K
>+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_1M
> #endif
> /*
>  * While we're using plain log level in i915, GuC controls are much more...
>@@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
> 	return log->level;
> }
>
>-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
> u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
> bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
> 				   enum guc_log_buffer_type type,
>-- 
>2.34.1
>
