Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2BD3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 21:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AC310E4E1;
	Tue,  9 Dec 2025 21:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF8y2OoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B6510E55B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315061; x=1796851061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ufud0G2e0eKaBxhnRAkAnb49rz7klaBf6PH9UIX3f64=;
 b=PF8y2OoRThYyHCj3f21eWjzfIhLhSFECuFL0vo6ShaFvQnzroFjiNkph
 i50c+aMF8azgp9ucJ6heXl37TeIdZQkGWXV8bYTWcxNlJBDg2CKLpj9mB
 4af2VvVaeglIEm0g8SwuoY5ys3thVrtmia1oqV6T3gCzRlRtCzsI+geQz
 u2PMm9VgPQSgGYeBFpJiPxNDbov14LCslgRMzE42HAr6zMHlBNAmtIhHh
 O/BHSKLosKApd0xsRDdnl4pTbq9BRa4LHroFMC5AU2zdVdXC1nXIdrvpy
 sYP13BjOI1hgq8I22z9kKlQKsX+r1370pN1wWD9BXUZ0W/zvoOM2QT73b g==;
X-CSE-ConnectionGUID: BN/16ZfjQH+iIWAqb6h5Xw==
X-CSE-MsgGUID: sZLp30WCRLWTCuYsqrmo5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84886808"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="84886808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:17:41 -0800
X-CSE-ConnectionGUID: AxlNXrZBT+OsOiKunx8UIg==
X-CSE-MsgGUID: 5jRvjJpJQZKxQ0x5RsaHWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200753897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:17:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:17:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:17:40 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:17:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6oSyJbcQeResXm4NOigLic3xOG1FQU1UXADYF90BfI7BjAc0q0Y9y1DMUdHA8zAakOhi2wgsBkyrFjTe6IL0KeQb5mWSN40b8zh4xJoa/ZX8o4aX5fCpH4JK2zIpwagwwGr8Nvmk7oGE5TYE/Hgh/WQ0Jp2YyLnv0TzSxtjAG0m0FTDKGCQA7Satydy1JWF4rN4uiS3xDQ10qppBvyKk7j/VLKyoaZCghmHsGWnhHBpq6zlRTm39wPHh4M/TIBa1ixhybOueMIDITHYvY4YcqUv4vB/sbhI2NTPVkjECzOqmeLQOVVAb+aFrsaDp1tHW71Xz/kJ5iTczc3bDgQr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EmXtEc2TVILsc6zvAYvY8ZfT53qkRk2LwYGG6SQUIw=;
 b=RLXuJszA/E0dVUL+zYJG7KMUYdGn1O/3OIIsnRZGs+sOmbYVyFfHu7y8oe9gLxpJLO4NOzSXC1uJZYrHfxGb/4V3WlsvgHRzUpUlmB1IMCaHKFt0NhSFTsr5XPTx2m3ubG0XSO61/h0mE2m4ibL1sNGB5pUVUZe6moRFwVEsrrs0WJAILXqy9eRQ23RXE0tAGA0zaf+BjBQsmL9WbH5HJgNk1x1IwnT+ELJOTEOQUzJhEPln8+5vPf7V1VKb0cFe8XXsFNP9eN+B1FmPGmuxAPHl9sfhtFaSWDGb+eEx6tUlJjGHIp4E+ZUq2vKKp5trqMojbvFU7PRYPNKyD2JunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Tue, 9 Dec
 2025 21:17:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 21:17:38 +0000
Date: Tue, 9 Dec 2025 13:17:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 03/18] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aTiR7+zjizdtnu2D@lstrano-desk.jf.intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
 <20251209032055.1539229-23-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209032055.1539229-23-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: c03ea4af-7869-4cc6-c134-08de37686124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rpqsKk9ytNU2ji2ws5TLc3T1Rr3/3Z35GkZOrVDCffOsd7n+C+FBeARxGUs?=
 =?us-ascii?Q?syre2ZtUsrNlgKiBbnfXSV9RBJB9+lidlNL56/29a0vxhp9lZJauLOb59B/O?=
 =?us-ascii?Q?/ud5VC48xmbaQ7ZH+mkVfE46d8hYno5OQVzypnWPiuv9GH8HLsF4z7HLL2Ro?=
 =?us-ascii?Q?RdgbzuwH1Tot4AhiyBRjaYZA0hawQinL4B8SYcpzFX8QfrMYxCPEbnxfzuHA?=
 =?us-ascii?Q?ZVp7R0RKG77H9yrvPhPkeFXQ1i9T21ZLIVw2DC3RySlGR6kivrGUGjSDgglr?=
 =?us-ascii?Q?1OaxT/Hmi7aQsq/UU9gc5lCiOZUHv9pB6Ng/dXYVkk06BiC0eqqjHkajurvG?=
 =?us-ascii?Q?yJ2amT50ANk4rrZCRUD9HXTmn18La5aSVEpHMvYTCjvWYoXN3tWOBxCVPASf?=
 =?us-ascii?Q?DAR0rFhaPhtSXFvtTW1NtZMiKmk+SJ8lM9foAw/inN1WMXfRUK6jxGSUlwFv?=
 =?us-ascii?Q?W2m13sQ3HPzJ0oiyvj2WC/2BnBlGRYPhB/xFrweKDOnz2ngET+CTQ73DI9LY?=
 =?us-ascii?Q?3aDW29Er+bqvSnzU0ybglkWv2vBrAEnMJM7a9M6syTEbZ3/HRTD8mBk2/JiO?=
 =?us-ascii?Q?r9WZPgDG8d9G4o7tgJjbNik8z0nc+ogDg3X3yeIA8nRkiEaGmmAuMDre6ZdO?=
 =?us-ascii?Q?Oq+qvZDHlo5gYhsctghJesz3xqkrKPb4A55Pl0Q8av7sLESsoMaYi91tTpyS?=
 =?us-ascii?Q?PtOn/uLnZO200ofjK6LoOU/qo8keNM0c/WlUGEBmMfC03eCLdCLhdrL9JeXp?=
 =?us-ascii?Q?oihx/NuYrsJAnLmwrQvDkdXbmVJ+29lP1X2UBXoFnEPSSDvl/hisH4WPnWTJ?=
 =?us-ascii?Q?QW/8nZ6P2uv8G6GLowfP32Mmj56D5uJexjnhCLmcgmd2vjeTylSzPljBZmzj?=
 =?us-ascii?Q?P7RZrS+6oMd7P2sfap8b0BARtjNrK+Hy97neKBfSrJsw+9Pe9jH1hDN1IyLN?=
 =?us-ascii?Q?mcLNEoO54MAyjYKmZO+ORrJl1Df/L19Kod/tfGcpWiM7KlXC4Byiui/saaAx?=
 =?us-ascii?Q?PJmy+lajP1OmVUQ92oKjU9hfCrPssD57PFCPU/MZiF8zHdoY741LoAD9+IIQ?=
 =?us-ascii?Q?3SILhZp5uqlpSie7+mvcmBI0/OrVHnA1IL2APi3yOozjL+wYNaGMME0r8Jj2?=
 =?us-ascii?Q?/wWtBLrMgAhOkB03lXjiHqbL6xeEbNsbv/GMmt/C5bEHfq5iiEo+afTwhkGN?=
 =?us-ascii?Q?b9fIIrETYPlxVTzfekk8Psa/fIOp7QI9qQbbJUJpLTAQlcFwnlAQQs5lO878?=
 =?us-ascii?Q?WETO85j8ug/nKlz9S0KPfUd3Wuc4ZaM4C0ouWwubM6LZ0Y4yDlxVQ4pmo1lF?=
 =?us-ascii?Q?/tOgyPh4R92gQsODNz8HvoLAJ+Agp/szXoRNfN0nD4tS+JtTPeJ2dOVfVhim?=
 =?us-ascii?Q?jyw60cGSuUFlMR3MVV/XD58sdQiPO7l7lSpBc+/vehTS29k3o2+g4oBV/0Ov?=
 =?us-ascii?Q?YGRuDtVK+42EDrPbXUo8eq849DsrSwCR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEVdEdOKVHS2DxLnvCS6WVRrKW0MM2gYy+Mku1sfERa+XiHWGckt1JUCU2Sq?=
 =?us-ascii?Q?ZBJZ1TYmpr82q4PCa1g/koLsoV59RvqSR3lC3Tehx+Z0ocOzE5LppCm6V4hJ?=
 =?us-ascii?Q?FQ5+MStDwkHP/6uD+zP8MSvvPRH9m3c/onFksjy41r6Ovk8z1g18IGJBDS9D?=
 =?us-ascii?Q?EfKCiBmoG6F18pLMpYvkffjdNRFZ3LACnxBj1Gh1sZV5H3E2hjULh90ieGAz?=
 =?us-ascii?Q?VEwm+cQjyQUYQeGDG+sB8XE94oTjn7gh9Voo0gUkODAR9uw0rbIl5Ksb7qsc?=
 =?us-ascii?Q?57xQrOB3XgBnDV3qnrfCoMSVKC4g5GhTKvwbOFo7fmDea8xBCjW7l2sAw2QH?=
 =?us-ascii?Q?4UcGRKMUYS91256lZfaXURwIVrsOG1hCPqs0c/L45CIXEkVe00Uuy1EjFzDX?=
 =?us-ascii?Q?1CRYmmMFHKPXPavlXgnQSkcqLfvlC51UX0/uFiCX4vz3AdN9kpOSxO6n3xZE?=
 =?us-ascii?Q?xm/cNgvS9BhfsJwD4BLQpU95lefvLbOYsgOSBVm3fFtMz+7lvXhU3yQhKfXG?=
 =?us-ascii?Q?bbPwm3U5NXDJFzz8pDOIbwQTFlel9fBZh21G3PwwjFMtosgNMQbP/AtrFuL+?=
 =?us-ascii?Q?DULE0sIZ/qQqeiCG9kKNiZjOM2UUMLcB90jKO02FlfrziyYlmWZRe4glyO2k?=
 =?us-ascii?Q?X7h3Ui3Mcg5Fhj5GO2z9fLvG2qYNBkgGx81c+PoVOc9APQXSOmcgjpHdMI3g?=
 =?us-ascii?Q?XrshwGWmITkYAEaydK1tUh6UUMGMAaZB0J1SYXPW1NdBsWdfeEm2riWlnKj1?=
 =?us-ascii?Q?OGR1fqtUs/nPaACKHiC1nRVWH4V6hup2YJMIetRFhMmFKnqvuIlsok/Iy//O?=
 =?us-ascii?Q?bsPPOpHKagMAMy9FZk0dr2guwo/O9WXN+1PMTTnrVWOXlx7UmHPgKt9AclfE?=
 =?us-ascii?Q?jg/1VnEyMje9g3MIdVYMYQmnXwQfSiFWB2ZVsNdYtuzceUjFQvtllD8RpT84?=
 =?us-ascii?Q?oCkX2EbR1nLaHLysiCzd8Ks2ac2CtVGKpcopgvM9v3sUoKlyIJQ8jGSpzJ/d?=
 =?us-ascii?Q?qYt//wKVUh8d6WidTLuYz3ayc8wBkChJ2U4hCF0me36a4pIgdteMANjSAfxY?=
 =?us-ascii?Q?QLCBm1Ih3kDuEs4tlbFS26KwPDAgxcPY8mnmKpmLecFwj66TlUrEDUV7awxz?=
 =?us-ascii?Q?9mf2raMkQpCjZNTfqc+YPLHOktkDtsxvRQ57OZTT+Lo4KqgDWP5tU+BqsuuN?=
 =?us-ascii?Q?g7p+qu+Zv4FZuJoBCjhwjhZJV0Gc23IpI/TPJQT1bsOFcAz8BCFFRkpel6RW?=
 =?us-ascii?Q?AQL1zzjsRPQdkV62vK8nEdvNpnb9SIYlOkxvd7XOVp7DiOUjQ9722Pii7XsG?=
 =?us-ascii?Q?3Arf243LPtBD4/ul+XLBajPYeHQnYUh/F3NGXr7uYLSEwrQ95XvTUwsJyx8X?=
 =?us-ascii?Q?tsVFyzIotW+4S2hAGWi7BJb5h2WalvgN13am4Gz/nnQjp0X+Gfp/FiVOAuzw?=
 =?us-ascii?Q?XBW4FWQ1GxNnI9xApT/F1rnrmQPF3CXCYgBBgxJxOwhNnBaFwZquoi2hMrTs?=
 =?us-ascii?Q?H5GWS81YPMRsvWXVxG9IDio2vHlMiELKlGJYcqX2Y//Wo/X7Yd149OwB4uYw?=
 =?us-ascii?Q?/wkgQ0CX1M3jyAYCg6EA4qEzidN30lFrWW1F/J8hq1tPZ2uC0cXOw3NT8Bvt?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03ea4af-7869-4cc6-c134-08de37686124
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:17:38.0397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjR3yC3FXQZqcEXhfN5MJCGo+lkhN7UyowzMJiKJrPPVvqjpCua4JWZ45Ey0x5Rd77QO5sEEWAzWocPn1ZKM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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

On Mon, Dec 08, 2025 at 07:20:53PM -0800, Niranjana Vishwanathapura wrote:
> Implement GuC commands and response along with the Context
> Group Page (CGP) interface for multi queue support.
> 
> Ensure that only primary queue (q0) of a multi queue group
> communicate with GuC. The secondary queues of the group only
> need to maintain LRCA and interface with drm scheduler.
> 
> Use primary queue's submit_wq for all secondary queues of a multi
> queue group. This serialization avoids any locking around CGP
> synchronization with GuC.
> 
> v2: Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value, add more comments
>     (Matt Brost)
> v3: Minor code refactro, use xe_gt_assert
> v4: Use xe_guc_ct_wake_waiters(), remove vf recovery support
>     (Matt Brost)
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 278 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  6 files changed, 269 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..3e9fbed9cda6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -139,6 +139,9 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 29feafb42e0a..06fb518b8533 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -44,6 +44,8 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> +	bool sync_pending;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 648f0f523abb..4d5b4ed357cc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1401,6 +1401,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	lockdep_assert_held(&ct->lock);
>  
>  	switch (action) {
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> @@ -1614,6 +1615,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>  		break;
>  #endif
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 7d93c2749485..e27f0088f24f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		3
>  
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>  	u32 wq_base_lo;
>  	u32 wq_base_hi;
>  	u32 wq_size;
> +	u32 cgp_lo;
> +	u32 cgp_hi;
>  	u32 hwlrca_lo;
>  	u32 hwlrca_hi;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3f2c8556a66..933e3b548524 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -19,6 +19,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
> +#include "xe_bo.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	u32 slpc_exec_queue_freq_req = 0;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>  
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  {
>  	struct exec_queue_policy policy;
>  
> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>  
> @@ -568,6 +572,11 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>  }
>  
> +static bool vf_recovery(struct xe_guc *guc)
> +{
> +	return xe_gt_recovery_pending(guc_to_gt(guc));
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -575,6 +584,119 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_, val_)
>  
> +#define CGP_VERSION_MAJOR_SHIFT	8
> +
> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> +					       struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 guc_id = group->primary->guc->id;
> +
> +	/* Currently implementing CGP version 1.0 */
> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> +		  1 << CGP_VERSION_MAJOR_SHIFT);
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, guc_id);
> +
> +	if (q->multi_queue.pos / 32) {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos % 32));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> +	} else {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> +					     struct xe_exec_queue *q,
> +					     const u32 *action, u32 len)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	long ret;
> +
> +	/*
> +	 * As all queues of a multi queue group use single drm scheduler
> +	 * submit workqueue, CGP synchronization with GuC are serialized.
> +	 * Hence, no locking is required here.
> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> +	 * CGP page and sending CGP_SYNC message.
> +	 *
> +	 * FIXME: Support VF migration
> +	 */
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !READ_ONCE(group->sync_pending) ||
> +				 xe_guc_read_stopped(guc), HZ);
> +	if (!ret || xe_guc_read_stopped(guc)) {
> +		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
> +		return;
> +	}
> +
> +	xe_guc_exec_queue_group_cgp_update(xe, q);
> +
> +	WRITE_ONCE(group->sync_pending, true);
> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
> +}
> +
> +static void __register_exec_queue_group(struct xe_guc *guc,
> +					struct xe_exec_queue *q,
> +					struct guc_ctxt_registration_info *info)
> +{
> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +	int len = 0;
> +
> +	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
> +	action[len++] = info->flags;
> +	action[len++] = info->context_idx;
> +	action[len++] = info->engine_class;
> +	action[len++] = info->engine_submit_mask;
> +	action[len++] = 0; /* Reserved */
> +	action[len++] = info->cgp_lo;
> +	action[len++] = info->cgp_hi;
> +
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_REG_SIZE);
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +	/*
> +	 * The above XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE do expect a
> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
> +	 * from guc.
> +	 */
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
> +static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
> +					struct xe_exec_queue *q)
> +{
> +#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
> +	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
> +	int len = 0;
> +
> +	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
> +
> +	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +	action[len++] = q->multi_queue.group->primary->guc->id;
> +
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
> +#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
> +
> +	/*
> +	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
> +	 * from guc.
> +	 */
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct xe_exec_queue *q,
>  				       struct guc_ctxt_registration_info *info)
> @@ -670,6 +792,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>  
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> +		info.cgp_hi = 0;
> +	}
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -700,11 +829,18 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
> -	if (xe_exec_queue_is_parallel(q))
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		__register_exec_queue_group(guc, q, &info);
> +	else if (xe_exec_queue_is_parallel(q))
>  		__register_mlrc_exec_queue(guc, q, &info);
> -	else
> +	else if (!xe_exec_queue_is_multi_queue_secondary(q))
>  		__register_exec_queue(guc, &info);
> -	init_policies(guc, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		init_policies(guc, q);
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		xe_guc_exec_queue_group_add(guc, q);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -712,11 +848,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> -static bool vf_recovery(struct xe_guc *guc)
> -{
> -	return xe_gt_recovery_pending(guc_to_gt(guc));
> -}
> -
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -833,6 +964,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
>  
> +	/*
> +	 * All queues in a multi-queue group will use the primary queue
> +	 * of the group to interface with GuC.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] = q->guc->id;
> @@ -879,6 +1016,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_run(job);
>  
>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> +				killed_or_banned_or_wedged = true;
> +				goto run_job_out;
> +			}
> +
> +			if (!exec_queue_registered(primary))
> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> +		}
> +
>  		if (!exec_queue_registered(q))
>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!job->restore_replay)
> @@ -887,6 +1036,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  		job->restore_replay = false;
>  	}
>  
> +run_job_out:
>  	/*
>  	 * We don't care about job-fence ordering in LR VMs because these fences
>  	 * are never exported; they are used solely to keep jobs on the pending
> @@ -912,6 +1062,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  	return atomic_read(&guc->submission_state.stopped);
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state);
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>  	u32 action[] = {						\
>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> @@ -925,7 +1080,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  	int ret;
>  
> -	set_min_preemption_timeout(guc, q);
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		set_min_preemption_timeout(guc, q);
> +
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
> @@ -953,9 +1110,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>  	 * handler and we are not allowed to reserved G2H space in handlers.
>  	 */
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> @@ -1161,8 +1321,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  	set_exec_queue_enabled(q);
>  	trace_xe_exec_queue_scheduling_enable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> @@ -1186,14 +1349,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>  
> -	if (immediate)
> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>  		set_min_preemption_timeout(guc, q);
>  	clear_exec_queue_enabled(q);
>  	set_exec_queue_pending_disable(q);
>  	trace_xe_exec_queue_scheduling_disable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1211,8 +1377,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  	set_exec_queue_destroyed(q);
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>  }
>  
>  static enum drm_gpu_sched_stat
> @@ -1655,6 +1824,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
> @@ -1675,8 +1845,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> +
> +	/*
> +	 * Use primary queue's submit_wq for all secondary queues of a
> +	 * multi queue group. This serialization avoids any locking around
> +	 * CGP synchronization with GuC.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +		submit_wq = primary->guc->sched.base.submit_wq;
> +	}
> +
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> @@ -2461,7 +2643,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
>  }
>  
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> @@ -2511,6 +2697,16 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  	}
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state)
> +{
> +	/* Take CT lock here as handle_sched_done() do send a h2g message */
> +	mutex_lock(&guc->ct.lock);
> +	handle_sched_done(guc, q, runnable_state);
> +	mutex_unlock(&guc->ct.lock);
> +}
> +
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> @@ -2715,6 +2911,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> + * @guc: guc
> + * @msg: message indicating CGP sync done
> + * @len: length of message
> + *
> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> + * for CGP synchronization to complete.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> +		return -EPROTO;
> +	}
> +
> +	/* Wakeup the serialized cgp update wait */
> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +	xe_guc_ct_wake_waiters(&guc->ct);
> +
> +	return 0;
> +}
> +
>  static void
>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 100a7891b918..ad8c0e8e0415 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -36,6 +36,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len);
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> -- 
> 2.43.0
> 
