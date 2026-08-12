Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DEBC5B567
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 06:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82F410E05D;
	Wed, 12 Aug 2026 06:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDhYnT40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE110E05D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786517894; x=1818053894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K7utPPNOgEAryVqRUuZhxoTLZHxGlmjOHh1/Il4YGgs=;
 b=VDhYnT40IhjKZpzwSzQlV9CsUIqwQhe/AyWt+S6ab+E60bZ2aRgDMytF
 tJ/HZkSSpFu84K7I+0rCv6kMSbW3LrsdcGzfpSwzh+a5hjxV0HGtdUuqD
 y0Lk/g1ZKT4WkM58zQVSEnuPT4MBTvXytG9SSg1l0grppbtyk/eDX6Kao
 AFWZDjmDlN2yctunIoh+lxKTx544NbqxWqIZ86w4I4CQ4mWjJCgW1SwcM
 DU+z+/7FxvdRJ0nrvbuw0JX+G4iM3Xrb6l3olf5E5LIkzVShqxdt12m9W
 WPkjIIsrw6vMvqxLXmClAh6N5bmXG5xlFAldV32I0D4UotKaP/lO4GSqc w==;
X-CSE-ConnectionGUID: 5RtihHZtR06Q1faxnqOJmw==
X-CSE-MsgGUID: fw4iV5OzRTu9yVihYKlmHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87073874"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87073874"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:58:14 -0700
X-CSE-ConnectionGUID: cG1evEW/QuG5BjD0Hh9J1Q==
X-CSE-MsgGUID: +XhFojm8QeyZ3IXKRVEPSg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:58:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:58:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 23:58:12 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0+iziBgGsHRtNF3YQumgUgt3MudaHh7uv1YiarGYKKIV17rDexDOsZSyBSXKFU/6NmOIATbbYQR5BVDuKrmCToT+34q+PHqXWWkJtXJGTye5UfQscuCpe4RJufmxZnq5q+euMwmDwI3/QSh5XOBdWmlOgcfVHw/U+YV+/hoGYs+ZwmV8eU5Qs6sKv4eIJwqbRce8okUIPUMf6t6PNaFcDcqR5KUG6G0H7PntOrcDgGiJ2uaqAc0lB4b+WHDjR7qrhn1pu+Uslz+x6Hjem66B3OwPi78Mf/isSjv5dfZULOeCpUA2tgJ915VA5nAwAzGTJWYKJ8HBJpzPYRNWvkNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zey0aneZaYkr4vwvUWZc9743HnUICa/nKkIU3RzgLzA=;
 b=rt+V39oyBmolHlZwUzEa9WLDULOtCOcIv0TeRMVbVr86VL/fkwguZ4DgQPQsFRCUuqwvauqOyjepT2bAF8ZPhrgzyCD4Hup2QNW4xR2DHxtDpKVToBBDtE3Jk/4j/jOQiIcL6k2YQjKI7C5izJZC+xZtbV31aBPrHtdiTKOo2prWneMtFDh1ftkPsf//AyewbKjRiDdwYsNqDwCwlsVrmUeda5N+JxF/3hoG+Ca+6eyXFWqOQ5RiCOVtODC/6tbYibzT9/TFCYcAsa/tLDD/hcbFzmUSb4pB9Ks8fhQbSLakFvVizkmMSu8szkPXaiiKMMEJ9bGDboUD1k+ZHdDiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 06:58:09 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 06:58:09 +0000
Message-ID: <138490b5-9fd2-4921-9287-ec0d4434d7de@intel.com>
Date: Wed, 12 Aug 2026 12:28:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] drm/xe/pci: Report 'cannot re-enable' error
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-24-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-24-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1753aed0-a416-4e93-c8fc-08def83f1125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: S73XqHBIlyPknA7/zCkT7ObD5/0g/oD70koN9/5OEMjDJQA7HDAaV6y2VoAMsHXHNPv2cHf066L4f5YnLd1Gup5XZlcN4CGqty5YgDn6NjG8H+nDQoQa/qMfUTVPiecZlw52HEQ5SzyGdX4kCCi3S9eZvhuPbSzmq0a1pEngQr6FeVREQG1ExgY+CitGfIGnT0/BkxZAepsrJMmOeCTWmhkTILm6p5sMxpB3BQoDlGVNWs1Qf4K04IBVpy5WzuRxZKoEXCHfyEXBShevZxip+JlAYrF9T/j2Mvb7MyvlubKTY1AW6MxaBlCDN0Fvxyfx/GI8T+WW+0wuLOe9UVQQfixmHTSnwgRLPNc9dWbo3NXfuGMkMdqwPdUnZ/GtCAAXKLY2Ts94EyBZznyVtFODcLz2//cKc+a5DjLDu1lAoaQQfkJLvh78qba5VU+VJ2eskqlrED710PtAA4elEf0No7mlK/W2/v7hjwTUvczbhrWVoX7uAoibzHQMT1yq1UaPIaOKfkjOYh2ZtyIy3CYmhO+rkXabzED47h/xFL+4753kihm6KXSjHV3Njxq7LAE+wPS684Vb2F3ErmnEH7IUjrWtOAIiedo6yD8FGnpIqn4pRzsXoQYBwfKEPn3fsEZc/6uUcsXN+b7abPTwsP5K84IKEW73q7c2JNk0RZGy9Gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFJQ2hCRUNsa09OQ1ROVkFtMFh3MW96UWExZlY3SXV2VXd4bHplakdVY3JG?=
 =?utf-8?B?S2ZnSXl1TjJ6YkR6bWNvVVc3U090amUydG13NUNOY2FhRVo5NnQveGgvR2cx?=
 =?utf-8?B?OXdLVU1La29kby81Uis4R1hmNVhLcUJidHd1a3FFbDJtalA0SU8wWmtHd0Nw?=
 =?utf-8?B?ZzdZeU9wR0luU2d3Z1pBV0d0NURRVWZvNWRxNDZWeHFsQUplY0RlVW1EVUVT?=
 =?utf-8?B?Ly9zNDhRWmFwaDhlY1NYTWd1R2p0RTdET2pCbEtySHBUNDhxYVJtRmVSTGsx?=
 =?utf-8?B?cXArdDFsV1l5blVhb0UwTFRyRVJSVk43WmtuZzZXMXpxS29BWk5CQm9CaDF5?=
 =?utf-8?B?Nk9jNXcwMXBQeVhhQ2hEaUJsMFVnRGVWd2g3a21TcDA2a2ZYTkFpNXdhMEl1?=
 =?utf-8?B?eVdsd0ZaOTRkeVQ5bU5yUzU4bjRXWmVzWDZTWmo4N28zSUkvZXd3UVlGOS9T?=
 =?utf-8?B?MVNRV2txVFQ2anAzUitiR0FSRlltc3RvSE5nakQ3UWk2WDQ4d2Q3d3pINm1S?=
 =?utf-8?B?QUxpUkN2WkRQZWlSWXBVMjcrZTNNR05HdlY0RTdLdG52R29BZjBBemdidXI1?=
 =?utf-8?B?MXlOd0dLcVNpOFVnNlZlZmRnQ3hpd2EyMjZKczdTMWpVMEpPZ2ZnUXc1bE5D?=
 =?utf-8?B?N0JYVEZwUHAyMUxEaU95WnhoamJ2TDFodVlCL2t5WlRWY2NBZE5ROElUSG8v?=
 =?utf-8?B?cmgrMzlVYUpiWmdod0dMMFhrT2xpUDBPY3RHOXVkNVRaNWNqYmNzejFmSE0v?=
 =?utf-8?B?MUhiK004Y0pTOEVTQThjWEY2Q1ZPd0lIbnNYemE2WmREcHZUSEVHQXREbFJD?=
 =?utf-8?B?dzdBWGZwREh4ZXBWRUROamhWV1ZUZjZlSE1vWmNCVEJyQ1lEd2FkSnFLU05G?=
 =?utf-8?B?TGhuVnpVcWExRVFSaU5tR254V2tDVnhlOUM3ZWhaY2QwTmRGYUNLK0tjU2FU?=
 =?utf-8?B?VHpDNVFvWGQxMitYNVl4UHZtSERBYXlISDlHbThBY3ZRRFoycnJrdjVMNjdT?=
 =?utf-8?B?ZXlIZ2IralN0ckptSzAwRlB2TWt6cFZNUVBnVkJMNExRNEF6OGgwdUlwY1hU?=
 =?utf-8?B?SVJsb2FVZ1dSUDNUdVlER25IMnd1bk9POERtREJnSkFDWWlvdjY2a3lEV0Rl?=
 =?utf-8?B?aHVXdGlRcGtyYUhzbkpSMG9ZMnc2NjlFU0piUEd6L2s4amZ3cmVxNjA5TnJD?=
 =?utf-8?B?MS9FQk9rcUppcjRxWDFQTi81UWZIQTZ4Mm1hM0NwNitHSmFPdDJlamJvTW1K?=
 =?utf-8?B?b1AxWVlYU3VMeXVjMzJBN1Jic0E3eDgwUHZ1akhad2dGcG9XVU5zWnFnZzcr?=
 =?utf-8?B?NVRIT2tRcmdoVStwQjhSWXpxT09uYUdGTnB2YWErYlBZQWNyOFB1cTRvVGN4?=
 =?utf-8?B?TUVkRzdvM0VCVllVQUNxcHNuUEdTd1dpOHcrZlNNSk5jblVrU1dIYW0wb2Ja?=
 =?utf-8?B?R3hFckFManNFV1hHQ1VVdVp4R3l0bmMzY1VUV0NRSW5pTXpxTGFjczFhTlo4?=
 =?utf-8?B?bmpjdVErMDhvd2dTeU1uaGVsdlJweVc3VURhRzNiVkRDOENQa0ExclF6amli?=
 =?utf-8?B?S0oxcEpKdnhSSnNLQ0dnclFTempmSUJuUzQ5RlFjNVNUTnhPRDUyYWtrL2N4?=
 =?utf-8?B?U2FqYkpKYTk0bUJ5dllVUkk2czBqTXkvTkJ0OGp5bDM2SW5LSVk0cCtrWUd4?=
 =?utf-8?B?NUdnUmNpUTFUZklXZTZjbWxzT1BPMXBodDlBVXJwRlR6cXRLQU15UzR0UFgz?=
 =?utf-8?B?TGRnVXhqNFhZcllXR3JXWDJrQzJKYUZTdUFkTFpTWnc2aEZ2R3QrUitpK0xy?=
 =?utf-8?B?SEs0UXlYM1A5blRNTVB4N09Sa296enVnaG8rYlFjOFRFL2Yyck9rcnRkQXY2?=
 =?utf-8?B?Z2d5Mi9waFZ6R3didEw2OE1kaWJjZWtzUmthVG1UcEZSMUVnekJZZjVhbWlU?=
 =?utf-8?B?MFh1amwxS3hXcWRzdnhmQ2NzNTVUcFRVZ0x1Z3RTLzhrQ1pUb2VnRU1uMlZB?=
 =?utf-8?B?a0srVmVHemYvUUxxd3FDWWMzSUJONjFDdFZxOVo3UUp5bEFQcUFKSjVCMTY4?=
 =?utf-8?B?VFQwYkVjQ011MUZWeVd5WHRJbVprcnR5TUxqUldYaWNoc3VUandadWtIM2R1?=
 =?utf-8?B?Ri9xSC9RZC8vU1NCTjQycmo5ekhDUklMMEFseGo1Uy9Pd29KTktJSlViM2dR?=
 =?utf-8?B?NjZOckdIUENUM0N3OHpCQ3EySlVJUUxUYytZNCtkeFZ6bk5HeDladGVFeXp0?=
 =?utf-8?B?eFlwbzRObXpMR2xYbk1vdlNNa0hXbDdtTTNJS2VIUEg3b3hNQVc1QTFsMlpt?=
 =?utf-8?B?aVdxN3VQSXQ3bG1ydjVFdC9HU2tKWUJCSUo2TEU0cG5ER2FVbXlmRldhY3Vu?=
 =?utf-8?Q?TmIRSpaJ6ORhnlbA=3D?=
X-Exchange-RoutingPolicyChecked: ojT0tGLxb4lDzljMZ81IbPuHq8VY7CrAme4jJDXK0HUXuTwMotuHQwQ4Mdu6WUS9+voQz3JXpyUPBj+LegnbQNsNWVvSANIawZdDqPVB5fMDdvVULQlxnyojOaF7KRnwHjEK8KrSpCcAIC+O4+35+8qZ4ydcWuswtocXENpEmE/IdSPdisadfIvPYij0wf1anlTwxnSxv+jserBUGsaK91+blAwiWd2OS2epridJZDE4FbrvJPrNt/Aqm77u8V1HPmpcGSzU793eIyZWCgGlUDXhJ8HWC9DArI9sGtERJHu7OuhPNxniMEpbJrF1kTZO1UpBd9HH+F6PCxNwHvrtyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1753aed0-a416-4e93-c8fc-08def83f1125
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 06:58:08.9714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7r3MUFgQC466LGyPOgUfJ16KnlR5KbiRMnb2ofQy6J7n7kIPsJxGTHHomsqvnJeTiaU2LrsBgIxDTTqEia78HnBtt8vl51KXI/XVJoJXdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'cannot re-enable PCI device' error using xe_log() helper.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index e41af2ac7f23..fb965f52be5e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -7,6 +7,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_log.h"
>   #include "xe_pci.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> @@ -90,13 +91,15 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   {
>   	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
>   
>   	xe_info(xe, "PCI error: slot reset\n");
Please use xe_log_info.
>   
>   	pci_restore_state(pdev);
>   
> -	if (pci_enable_device(pdev)) {
> -		xe_err(xe, "Cannot re-enable PCI device after reset\n");
> +	err = pci_enable_device(pdev);
> +	if (err) {
> +		xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n");

PCI component used XE_SIGID_SW looks semantic mismatch, we can add 
DRIVER_HARDWARE with PCI and make

a PCIe link failure that required active recovery right?

Thanks,

-/Mallesh

>   		return PCI_ERS_RESULT_DISCONNECT;
>   	}
>   
