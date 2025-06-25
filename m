Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B3C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0A10E121;
	Wed, 25 Jun 2025 19:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQTYjpcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB4910E7F6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750881198; x=1782417198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WZORXtMbLTlOqd+Hxa9T8t3c5ahiVWbGAJJ+jJ1KqYU=;
 b=VQTYjpcZcrj7V47C7b4EvQ4u+xytNYDeYBnrrHZO1vDYAK+1YgZpoQMH
 Hv35JWUqxpU7sBWE4XXjLJ00uFCawNbEjUwdsuh80uXYq+VA4FtUnsQsB
 tIro1SX8jnDaKVd9wQGzAScGpcvzcSrmuD9xNZRLXR6gI18Nd8JhtpPg5
 e6X1mKIgSOOY5Tvr6AgonJsa9GDxbNARF1kOmZODHnmxsADdOiiWiRdzX
 9UpSqvRHn1qAOrPs/+ihtEbq5RAU0gO68PWYyDv60DI4+QUclbcXadUeA
 fwrra+I9oGzhxtlj49o/ydczNhEX6KZ25qNi+MlodetU+vE9L1FGx+zf2 Q==;
X-CSE-ConnectionGUID: X8W7Io4jTQ2Xo2VHWfY62g==
X-CSE-MsgGUID: CCcjUZqeRFChEyzzh/DuAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53260956"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53260956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:53:17 -0700
X-CSE-ConnectionGUID: ROD7LsQbSJOXZuABa4C0Fg==
X-CSE-MsgGUID: 1r7cUmjlT2uhr1ySttG0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156875371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:53:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:53:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:53:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5Ra/Rtemdsc57icNTrdtJ9C8ztNJNSHJvwrtCgKNSVQErmMI/wRfUXGHcBFWjnLWC/OSuwcTz2XlUA+2kgLitBkRcGb/qAEINdNuiCbaDjV9yI38JVxh4uxGUWf0dz/+NIjrJaqb86mI+tF+RlB7DcFjR3BaLc/noNmRvc42LHasveyvlNeLHceu+b440/kmmzMENDtl8KGlxCKlw7EbkIj4npkmt6SucLowMSNTOLWMqAdyx7V3LY5iVcU6woUlEYmMYhFKPMQswA0jj8jTvVAFQGvEmcGxJP0S4Wm7s7D6gXTyjig4wv8qnt9WlLNYingTCzl08txWRcUL3+7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cMJrojKvzlow1QyFFAxcl9Nn0jOEuSfjMtSbkce4A4=;
 b=X972tL4cjnmD6o7W14EfuB8fple63U9YFi47jsSuSkPkLhX7Ffe81sMQUOR9CZSjOBx+MlnVqAgfdKupNFuc+OfAsF78wW6v5a3BIFA+5vOCkSMieZpiHvXSuyJOt8aNjorqX16EozHRJVBoTXq/C77jCKNhveG6OOw9iDvtEr7KtN8DJ0VgSIpRP4rZsUCZNJ7tENxDXrCcxdO/JSjcOL1HTYHJ09mki9GcRZWIz7z8ASRsEIRlCvjSZUBWtHaSylDu20JKch+QkMm/jGVzFpPikdifIdQZYGqvhmiDgvu4bH26CP7UK9kQiqdzrIEul0RAgqDjzCAZm0wFGxYrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 25 Jun
 2025 19:53:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:53:14 +0000
Date: Wed, 25 Jun 2025 14:53:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/7] drm/xe: Consolidate LRC offset calculations
Message-ID: <m4m4hvwhkuonvkvemhek6lr5knpvzochdzy6xnlafciqpapsep@ygt65dkcshz5>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
 <20250625153632.21220-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625153632.21220-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: a218e4b1-b6a9-4732-4e63-08ddb421ebe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MfyPeavXFaPsyUJnHOEXBL0lVGA2EMJfyyfnlOI0dL9PPCMlqdrSi5YyGqJW?=
 =?us-ascii?Q?ja2TXgb7NFyRVfbw5DuR5EHQLCW/KgqTl80riJiiBTnkBpAKrVry3jymAo1b?=
 =?us-ascii?Q?FZRsyrf8qLllUi7uTj1mbi1061XUnJgHSNHnXapkoZxDyzuJU+L6q7BpsZEw?=
 =?us-ascii?Q?vDRBc9CE04uA22WuB0LCADYXoNB5UWdwUpB8A+Z9kLiVMmg1CssnDLK+zbQm?=
 =?us-ascii?Q?oRTCVygs7aWD1VidgSxEqqe5hn1n1US5EbOXe7LDlu3bMqLhtnb07vjN1vbG?=
 =?us-ascii?Q?jOmzN2NF485UYtsptQ0BDU/AYH1qfLUnKAkPgvwfSQtgzbquMWdAoSEka7MG?=
 =?us-ascii?Q?jvLQ/tmWKFHeFfxeu0cufdbpn0Mn8867C/k1fuvUMpnJBLHKC1Zru5Rzp2Mp?=
 =?us-ascii?Q?ys7G7seIWfGbaABE3pVswyZRnNsUxQtw3ovtxrPm1tnIn0HMQFgHaTufuuCx?=
 =?us-ascii?Q?u5+T6TczSSQU+rFgWYkUfrFM0w9wptzImgeI5p02X//mCEWxfwAqsVfDIAWc?=
 =?us-ascii?Q?kv2oUdHO4paxQgS+0NYx0Pgjp37aR/pqxO0+nNZUsHsNL2NHX0CbLAQVaxRi?=
 =?us-ascii?Q?lYEbW5P73gSJUvRJt4S5adnRjJu14ro2Fn9QtKMaBIMS6JMftJVSrWtIkPKV?=
 =?us-ascii?Q?ble7pBfvptNFdT/MxsiX1zZJNiTbtNJg6aJ5RlxuVbglG5CE6wxRqaQ7Vqn9?=
 =?us-ascii?Q?OI31bXD4yDtDYGhx1Aa3vNTQbJPn3Dbbx4e9oWiQy/koh14MkWPRkeULgDGD?=
 =?us-ascii?Q?6ofDs1LStbO8vqM/tkam4EZb+TdNImcgTj6XG7S9IvUAwp1yEf5BEg9ng7sV?=
 =?us-ascii?Q?+gBVqO1+UeA5uY78VbqVwRWz4F2h4ruAqCWOex1pevmUCYVVrqmTlrI+6F1x?=
 =?us-ascii?Q?BTj4NpBjUo9xSbHa9uxqKpoEtlRcJIQHZl//GTB2FQNQrctrxHigBZvm/Gmc?=
 =?us-ascii?Q?ugptNqH+3GJtfD2ZxdTt3dDCFgKUYKvXH2ADReRoZU+Frvo2Qm3o0gT070Ba?=
 =?us-ascii?Q?3xdLmcjiFNGyu4P0MsIBk1/tBRlQRst/0Keaa+LiF5LH/oTriSMlM0V6SA2i?=
 =?us-ascii?Q?ahpwQsCBPlLN6nASBxIxBJTI/aVpnS/sxucWHIuJqdsy7klKiTDpdDsKXqKC?=
 =?us-ascii?Q?LMm0dMlvKNKemcw9ocCZTvlAyHxsztloG7DfDfnKCn3rHcGnyOIJhZaI5Kzc?=
 =?us-ascii?Q?WX5UDfE9HAi5V+bcok3tM1aZ7Ym8z4h7dAI70ZdSvNfmiqa83Uhq6WbUDkp/?=
 =?us-ascii?Q?tC+bd1Tt7Uy6TK5DciB6PXPztYGg9B274TvpKb8f7EzyqEOA3bumKyjBw9wB?=
 =?us-ascii?Q?rF2p5tEijeNzdMOR6MTZ31vME2tcjGmutjWHG+A9V7PnbitRH98w+QK+rJzM?=
 =?us-ascii?Q?FuC6OX8k3U54X4sDrOJLieXrtfUIfjtVX8gGVCIkX+mNbVrFPZhUwF1hL+zG?=
 =?us-ascii?Q?LaiFbhoFGU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvhWwDQpXRkOEV05+ANZyzExi9EVSSTfFzDh3nhkIsRgP4IJzPaUDRJX9SRg?=
 =?us-ascii?Q?SBdcTZYjqIL5YlDrSfgkIUSo3U/hIObfsRDERnsZRT8oRO1vfr4+d2oY+bvj?=
 =?us-ascii?Q?yPTJgSNnSrAa60pj1kiJjDFcO5/GdKtnKWYVoDYi4Wg0ieKsuAnkFwsQUXi0?=
 =?us-ascii?Q?eY7Fzr5aQfhzl3gXFRnW4kppGktjL2wiIrUkL2u9NvwYBoUBeXsyo3X+9QGz?=
 =?us-ascii?Q?/7XIel9zAERpvLvHEG/c2F1DbGRmJNDOAZUqARwXprWFGN4xkDjhJOVEgu10?=
 =?us-ascii?Q?j9YcuyqaGNrwhncUimjxp8bTwGjnlxXJ4Pr/jjRwZzDVs7HFJbbZ69OarUb9?=
 =?us-ascii?Q?hxnU9Bw8v90pC/vuqiW49KGfiBK0y+oURKQwkufzi+BF1qHVxo88DV6KpCsb?=
 =?us-ascii?Q?nXo+Mhv8UorUG/L0r2fw215Mr44PEiZUbi5W7CtXSOeHiUZcuQPNaT35vL8J?=
 =?us-ascii?Q?oY+a6eVzuffLuqphVAOhUSjuSJ/5BHnQ/gZFKsPvhdaplxGbwA5ORL7rjTkb?=
 =?us-ascii?Q?HvyCkxAh23ELr47lOsmaoOF2uHE/b9gzanILFuPj6ZxJI4NzsqG2Qj/gBJUg?=
 =?us-ascii?Q?aYzar2Rg4Y2Te4VG8XeH0owfVrpwEDCApxeXXIGrpPbiOCbihHfqxHmKKNwM?=
 =?us-ascii?Q?J9MR4r3ir9paTqzKaEu5h0Xt9yTXZuAXPywLj3Zme1m4v0kXwN9YbwbNSFLO?=
 =?us-ascii?Q?EYHuXWMaenxqyQE+l69gbpvrDTlJdCnafwzQlWWPpIOsVJQBkeJsFDeO0EHo?=
 =?us-ascii?Q?wuw8sT9X+1PbxLpJH5FFw0SywUuyePEEy/IEhSEOnmxqkESIZMspg50/okqG?=
 =?us-ascii?Q?zJbZJfZ/042rtLot22nQPZzQ9ZF88uURAUk3VEsicpqYimCA0Y4InOoPV/w8?=
 =?us-ascii?Q?Sk1h7JrCZO3Tz8lw8y9vTxTU51DUqHVz/afI2hL3QpKWchCcuRsHi/4CfibG?=
 =?us-ascii?Q?WuaTBAQSKm3UtPaTmfkXOco47im0oaTC4rdW8slNEnIiFLh/LUr5b0unuBuf?=
 =?us-ascii?Q?O0GEOOlGzvEhW9Qdcves7o+UP+0qz9vkd7Uf05c3krEQnvy/478XBV1jrQgp?=
 =?us-ascii?Q?+1+QDTrYOUN3tphQqZOueV+jFyNji/S6TsaygJ/D072Uje8Uu5ErbPfjlzhX?=
 =?us-ascii?Q?K7Hu45Mnhh8LI4aNiUk6W/Q61buluQ/cYKTJTf5+DJAiPOCxExPHsamkrgzr?=
 =?us-ascii?Q?NBDwOOK90cStYFeW0QwC97HsMzHEoDDATaFjrvRKfq8g4iLvJSvSDJh7IgRJ?=
 =?us-ascii?Q?15nsiEFYIiP39nTlSg85g0MF5UMb3op+ChlARslcx9+Oud64H3s/dxxznszR?=
 =?us-ascii?Q?NWrvUv5zQiFx6XjcQsLfxZlbZ6LRQNkn+oYqobFO7Ol9jCCOcCVuZY1p475x?=
 =?us-ascii?Q?Hssy950qvHyw2oMmYJQyWLzVsJQy2nGUs4CuHVEB3lc/Q0DrvOLgT3dkzo6X?=
 =?us-ascii?Q?PXYub23sPkQigC3T2G85rjfqA79FpQQ8dYJYUobvITMCNBP3Hir7NeM070FU?=
 =?us-ascii?Q?o5QzThnylFr1FZys5LRTn9DQJT9yMBUEeDmUym0yN56BaIn/AZUDikIdNgLz?=
 =?us-ascii?Q?aPwJKY7v/2/odTgRQKUo2xGaAzKemro4QBDNE3BEVuqGQiMOcQ7Xj5t8M/T2?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a218e4b1-b6a9-4732-4e63-08ddb421ebe0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:53:14.2829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVcFljWROhxsoPlGX5wOYAsh+HYdeVupgE0nZ1WumNo1gkv676BDPq2bXzCYUCs4zOPd21ZdxhMM0qz7q0xhPNVMb1nJCM23JF4knW/a6po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
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

On Wed, Jun 25, 2025 at 04:36:26PM +0100, Tvrtko Ursulin wrote:
>Attempt to consolidate the LRC offsets calculations by alignning the
>recently added wa_bb_offset with the naming scheme in the file and
>also change the size stored in struct xe_lrc to not include the ring
>buffer.
>
>The former makes it somewhat visually easier to follow the layout of the
>various logical blocks stored in the LRC bo, while the latter reduces the

The intention of not using "lrc" in the WA page was because it's not
actually part of the LRC, it's just part of the same BO. However all
these calculations with lrc->bo->size vs lrc->size are confusing and I
like the consolidation you did here.

I had started an ascii table to document the layout. I will rebase it on
top of this later.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>number of sprinkled around calculations.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c       | 41 ++++++++++++++-----------------
> drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
> 2 files changed, 19 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 37598588a54f..f0c33de4eb6c 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -717,8 +717,12 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
>-	/* Indirect ring state page is at the very end of LRC */
>-	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
>+	return lrc->bo->size - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>+}
>+
>+static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>+{
>+	return lrc->bo->size - LRC_WA_BB_SIZE;
> }
>
> #define DECL_MAP_ADDR_HELPERS(elem) \
>@@ -973,11 +977,6 @@ struct wa_bb_setup {
> 			 u32 *batch, size_t max_size);
> };
>
>-static size_t wa_bb_offset(struct xe_lrc *lrc)
>-{
>-	return lrc->bo->size - LRC_WA_BB_SIZE;
>-}
>-
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
> 	const size_t max_size = LRC_WA_BB_SIZE;
>@@ -993,7 +992,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 			return -ENOMEM;
> 		cmd = buf;
> 	} else {
>-		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
>+		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
> 	}
>
> 	remain = max_size / sizeof(*cmd);
>@@ -1017,13 +1016,13 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>
> 	if (buf) {
> 		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>-				 wa_bb_offset(lrc), buf,
>+				 __xe_lrc_wa_bb_offset(lrc), buf,
> 				 (cmd - buf) * sizeof(*cmd));
> 		kfree(buf);
> 	}
>
> 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
>-			     wa_bb_offset(lrc) + 1);
>+			     __xe_lrc_wa_bb_offset(lrc) + 1);
>
> 	return 0;
>
>@@ -1040,19 +1039,22 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 		       u32 init_flags)
> {
> 	struct xe_gt *gt = hwe->gt;
>+	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>+	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct iosys_map map;
> 	void *init_data = NULL;
> 	u32 arb_enable;
>-	u32 lrc_size;
> 	u32 bo_flags;
> 	int err;
>
> 	kref_init(&lrc->refcount);
> 	lrc->gt = gt;
>+	lrc->size = lrc_size;
> 	lrc->flags = 0;
>-	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>+	lrc->ring.size = ring_size;
>+	lrc->ring.tail = 0;
> 	if (xe_gt_has_indirect_ring_state(gt))
> 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>
>@@ -1065,17 +1067,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
> 	 * via VM bind calls.
> 	 */
>-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
>-				       lrc_size + LRC_WA_BB_SIZE,
>+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
> 				       ttm_bo_type_kernel,
> 				       bo_flags);
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>-	lrc->size = lrc_size;
>-	lrc->ring.size = ring_size;
>-	lrc->ring.tail = 0;
>-
> 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> 			     hwe->fence_irq, hwe->name);
>
>@@ -1096,10 +1093,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
> 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
> 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
>-				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
>+				 lrc_size - LRC_PPHWSP_SIZE);
> 	} else {
>-		xe_map_memcpy_to(xe, &map, 0, init_data,
>-				 xe_gt_lrc_size(gt, hwe->class));
>+		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
> 		kfree(init_data);
> 	}
>
>@@ -1859,8 +1855,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->seqno = xe_lrc_seqno(lrc);
> 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
>-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
>-		LRC_WA_BB_SIZE;
>+	snapshot->lrc_size = lrc->size;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 883e550a9423..2c7c81079801 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -22,7 +22,7 @@ struct xe_lrc {
> 	 */
> 	struct xe_bo *bo;
>
>-	/** @size: size of lrc including any indirect ring state page */
>+	/** @size: size of the lrc and optional indirect ring state */
> 	u32 size;
>
> 	/** @gt: gt which this LRC belongs to */
>-- 
>2.48.0
>
