Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB161CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FEF10E661;
	Tue, 14 Oct 2025 16:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7mbNJAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF40710E661
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760459812; x=1791995812;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hge+dDZj/R5f+CoRTIFw4eviNO12zEtbeCdXwriOx74=;
 b=n7mbNJAh1zfooybRBBhTne0DV47JaJB3XVYDiMKLpDVci1BpnE0/4jem
 b3fcl2iXKFo5MXbNpSkMJzp0uZKmlWQjdqQmkzRMLBIx3ANxzE9JKoBL3
 tF9MA4MxfgYih3e6irTAokEPjNPGs9JEmyDTAYTglFF8C3AemHgCeqir2
 mcZHeN4scmm3r2PiF8rS8I3Unt37jTu2X3OFcaefsK3LoHWIw7ebW1r6T
 zZPKb44p5BPsgZb54XOaPFIPEANEn1vsa3R93pVBggfs5ZrLEp2MboG6B
 /nwQMJJnLG4wDEpBcwIZB6qlYMBsKyR2/FqOGTWiDC9HhFnus/Lt3+s6p A==;
X-CSE-ConnectionGUID: uSTHHmEITVKh0apB48y4NA==
X-CSE-MsgGUID: maGjO7gMQ8mbsn/zLbnY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61833110"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="61833110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:36:51 -0700
X-CSE-ConnectionGUID: /wH9Bje1RduKRQHVP+T09w==
X-CSE-MsgGUID: HQQmnFllTZitJyfxOJ0xqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181873750"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:36:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:36:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:36:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAdyLLMvT91VS6KR3e1EqmJl0eJI/FXVwTKeIBjRwJeucDkZ3lDv8BpbU8MUvpUJIZ/t147CGQp5rEiiUTSemy2DcTf3Re5NbYr/DhuwW6830AO7+3oPLuefnphJUPknycZyx+duGJK/TeHpQQeFNemjkQmNtCIbK6xQr1HEDX9uABvw0b7/o4ylf1mxGI5HbzFSfuJad7g9dj7QtMRFJKUefJifg8nJ2Bkq6bq5GyfuizCRLBnYOiqnUpr4EBXdjvnCh7eI6PmExq4tl/5pVqmjts569gCmiLJj8QWo2N9fux4pMjD4QovkzR27x3GD7ZzTtM18V9xkcMz2yc7RMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnbD5zT6ri6iegD2Jtxji3dSl181jmqyyjhJ5oNH9k8=;
 b=poqefPF16UlykeSmWJ57JHrXZ3owJEEuniqES+d8aM3OZjmjfaUjSkmFdzUFAKVdwnI+YA+hclqGBRzh7hrc3pXZ+/7FlKL6TlCQdS1FjKV5PP6IKKkaP1UDMOnebxjPjJqQbVT2HRAog5Pgrxv5D6rQ9gCYGdrEiZw4C+QUsYhycOuInm0opFJwUKCYS8R5IR/IOSVacAvHwll63HZGsEWNVIUMGFzmP/XbM17DNpE3xz6i0DxG6AA12X2ZrwBvqznKxEn1NSURljp8w0gxoIbB9Gpcg9yznXn4n5NfBP/HGpr2hXM2mTjntlUwQPamxyQyjI7atC8fzokhyYLQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 16:36:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:36:47 +0000
Date: Tue, 14 Oct 2025 09:36:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 04/23] drm/xe/xe3p_lpm: Add special check in Media GT for
 Main GAMCTRL
Message-ID: <20251014163644.GP5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-4-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-4-bfb74f038215@intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: a484bf3e-2c0a-4ccf-2b09-08de0b3fde14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uHWFFwtFN4xqSnZdtAClK5lua16kT7C6tX2V7TJsAJGxED23hR4ySIPbremd?=
 =?us-ascii?Q?Y+d+1QhsBWh5drwxqlsL6mukR74Ryn4Gs5d4IjR1nFwoY4DpBVA2E8nQKxqE?=
 =?us-ascii?Q?bE0Ex1+ZQ1cT+9OfKh8cw/pq2pZLrNDn0yVLMOs2kgRiVy47JwZQdeKS8Pqg?=
 =?us-ascii?Q?BWd35fWABxros32QTXtj+iZUusP4qK0QRida4XNfmx+zJ+KRQzPud4474Kqk?=
 =?us-ascii?Q?aeB+eFdswBzMSqVgx73oHYGnVlAemo7Gr23K66nuF+ljSN1XRTCuH6f1Dygm?=
 =?us-ascii?Q?MA4OuRTIV3w990HDaC3Ywa68whHK5Xv5894KuH+T5NDVnhoEUGM4sBLA0htK?=
 =?us-ascii?Q?6QOY7fjfct1CEMOiDWHBi9yg0w4P1kNbxMvgUKWdhn8ENot+Ko6OjT7V9Ezg?=
 =?us-ascii?Q?mU1sQkoyJr6APzV5zhbBUMMruerD/vLJel0ocBXjarxHM921tE2L6M/ZWJmA?=
 =?us-ascii?Q?lz9fw/KAssX8gD8xVcq21iXZoVn07xFNZ4wTUelrdKFPbSXppBJLo6osMSrp?=
 =?us-ascii?Q?u5u8TPp22nY40UAggKMSLTQDpvyirzpy/VKT9k1KsR0bC/jeqH1gPt9C6Ako?=
 =?us-ascii?Q?Hs0HroZdc+NX9RJP16pNKOELUBBwHQD+PtVo41mor0MN4Dk3KyUCP5PwmlTi?=
 =?us-ascii?Q?fD0juJRKO2psvRtRo31YkfiZBfVFcjb5SAu6HwbFXfFaokVowgVE+4csUDWU?=
 =?us-ascii?Q?m1EdlhKsr+LUP6vx64eaEp3w9LyJeGhXk/HvaFVT8QK48Y6Cz2cKKMhkH/Jv?=
 =?us-ascii?Q?A7iugvSfbQ8PWxq81LOfH++U87Ow0zgA1OGSsgr6fOF/G0nnX5cpPqyf0uQv?=
 =?us-ascii?Q?SGkWV7FbD2N6kQAkCfdkN9PVRahO2baf74FXCBbsPTloQCa1BOlOy3CHimew?=
 =?us-ascii?Q?4XM5jU24zBz12cn7LKObJmU6Vg7E2ESlIfo6KCX75ZP9M0h3zEku+LFFiZR6?=
 =?us-ascii?Q?/kDkFLmWe7gToK6e+meyI9z5vvUlnHrCzJI+nDyZcYaogRTWFIZ2dEQ8nFWv?=
 =?us-ascii?Q?HKVCvZ6ZqSh2+FbG+43yB19/S1n8w8lvTmYJLpy3TxvNlJPgCHFNlwR257VD?=
 =?us-ascii?Q?58S/K+l71JQ9Ij2zNezyhogp4BehlDTZPhqah0KQ/oGc3FPZb58xdQOVdXHr?=
 =?us-ascii?Q?QPbyOzLeZOYYP4WV1Ts6jIVzZIxr1Zm36hyZ0TygE/JV8o/mlxWQrIXj8xo2?=
 =?us-ascii?Q?glFBvxIA4QfkcxjB86UpiS/cvKVUXED9+SGKpZDRsyibejhdEZOEyvG7fbXc?=
 =?us-ascii?Q?i70jQz2tZEmZpju6dOxzcdD94pU0QZB+5YNgwifaE3W1uK6zqQV/vOLZFPZK?=
 =?us-ascii?Q?8WwS/CVH92qLoMo9i0lHK3b1QbduTghV9BSTPi0MdizI21FJErDIqHNyJ/pZ?=
 =?us-ascii?Q?VgO+ECIIkUbPP4YFjL65lhHsJ63pScxGhcnjJaTDX94/w6r/y3re3rTCjD5d?=
 =?us-ascii?Q?S98ZOy4VGGeYZBXr/Itn8PU79tobGs9U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LV05S5oUZC463swpI0MQjEol2KYActjf0R65pz2OMyVJu2vQw45ZrUhILgcP?=
 =?us-ascii?Q?NkbMKkZ1Z8zgocFXjw6EMa2Hp9ulJ3PuJmiTjzNjU/w67k5cdzLzsMvk264U?=
 =?us-ascii?Q?MwtkLwtqvYsC7s0ZA/c8ZPqaAGGqXHYGLuCw1UEvYx6Bk0JdKjrcO1w4X/Dk?=
 =?us-ascii?Q?puyQvrjdEl6vucn4gqUweki0RBAnuIk5bxe56GU3Q5c5PGp0huHFxLmg2zOd?=
 =?us-ascii?Q?jin3X+76YZ3v8jn631xH5pjh6QDYnuhcKjL0tYyc1x31LloccLX9lEYZLMBd?=
 =?us-ascii?Q?IVnV6jWI8AtWPpJ+QOcgG5e/5sYcXuq5lif7hUSkiZLya+75EoTrTYibMWSV?=
 =?us-ascii?Q?UU0DNMmuyQuGBJHvR8FKpyHrpNTOU8JW086YYkt73nZLHcchuxuVoHOee+AK?=
 =?us-ascii?Q?SMuPdtOLlsIt2vKpEBqz/zgtZCyAy95tFePIKvIRYxNRb88Xzzn0Y4HeAPvI?=
 =?us-ascii?Q?DEGkOg2ICF1HrgdSNBZlU5AefrYht2ToReZy34iQqMqlfZnyQthDf5nSzEbf?=
 =?us-ascii?Q?viBuibkQtn9L9WCR0wW479kv0eJ0OiScXprl7l9Wo8MjfkMBeA9etkt544bm?=
 =?us-ascii?Q?P7EeJFg55xS3PyAR4DInAT2KUuWuiPY9IzJnuwK41mOaCxTZYlNb87ZDmBUu?=
 =?us-ascii?Q?fGo4IFPjt1PJjHZdEe8KV1KPGJi0mA20j9HaSyrT3T6x8x3bCSN/l0jerTlM?=
 =?us-ascii?Q?t5VdpXnbUrkABS/E289cZ97I56yetc64jP1M/KSaY/ICBfDer8mOjwpqzQDO?=
 =?us-ascii?Q?UGzdqB0tm+922cPTmE+G0fvM9arxtHdT0VG0YEnnKgwAta/I4+JQq/O6fj3o?=
 =?us-ascii?Q?GmwI1vaioEz4ftdMGeWvEj3RNjyFTsiEVHlk0QJ4zShsgLGHdgFnYICTa1Yr?=
 =?us-ascii?Q?3HqVSNWLmNHXEstzqYyk3HadTOb0T1yU+T2wlduDFarpM3X2trWQSdFUGpP5?=
 =?us-ascii?Q?TVpQid7HY3dycAPnMSk6m1bYz1uQVO/9PYlH2qM2f8OsMHUgC98biSEiDRPi?=
 =?us-ascii?Q?3PtK6dYu2vQ1jFdxoN1GRfRZ5MyNS6fIvkTX11KZQEOJekczTlZrJ4DlR6Qq?=
 =?us-ascii?Q?MAEtKbmZy+r7LtQ/hlmMNNLOO56Ax5A3qCqKTSQWmU0PnLYT4IG3NGoYSKh/?=
 =?us-ascii?Q?aHiSSi/Q7e8FFHLyrridRxu7+NjFXLHvc/x+/h83q84L31befVGv9IB535/D?=
 =?us-ascii?Q?+17SfYZymhh/9y0sDJhVtlgZ/6YV9uKxOVxqzaUyY2ifhdzU2kBKxlQUmtwu?=
 =?us-ascii?Q?gSAX+cP0MaZPirhCbIzq3nPQxSWEm6befy3IGWAC0lyn/mrtUWOjrkaxJIAf?=
 =?us-ascii?Q?9ZIa4X+vxs2iORnj3RP/Dt9NYkRXOL5xQOGe8X5h9ihGFUMlMzk/rYwhjt9k?=
 =?us-ascii?Q?g/Pols/l28a7uk3jAlx82r9ylK2Q5YRAEV22GtVXthNGLJAOxjP5j1aHveQl?=
 =?us-ascii?Q?bv9Xde+s3IHCklenGGZZwANcBzrKLDTa5Gf9Z/mqIEg/tkLvs9VpM9SxKBIU?=
 =?us-ascii?Q?Bn5yhBKTN4quSzBdtP1Un7xpaFSzgTr8hBUdeujxZtJsfU83/49w8CoVtg1e?=
 =?us-ascii?Q?YQljycPVLXIYC5OB3L/qqsbEz9u4taNQBJ8vSvuYly+9O5G/TTM5JxLz+asz?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a484bf3e-2c0a-4ccf-2b09-08de0b3fde14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:36:47.3075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Rl8MhELcey30Xkph2EVSMTIwlu18i1K7o1gutg9WGsylgI/y0s76WWMcBwuSf4ESh/dg+xCAcUJL/a1GJNQALMeSlx/G73GUdJO5T5YSkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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

On Mon, Oct 13, 2025 at 08:24:36PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> For Xe3p arch some subunits of an IP may be different. The GMD_ID
> register returns the Xe3p arch and dedicates the reserved field to mark
> possible subunit differences. Generally this is an under-the-hood
> implementation detail that drivers don't need to worry about, but the
> new Main_GAMCTRL may be enabled or not depending on those.
> 
> Those reserved bits are described for Xe3p as: "If Zero, No special case
> to be handled. If Non-Zero, special case to be handled by Software
> agent.". That special case is defined per Arch. So if media version is
> 35, also check the additional reserved bits. To avoid confusion with the
> usual meaning of "reserved", define them as GMD_ID_SUBIP_FLAG_MASK.
> 
> Bspec: 74201
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_guc.c          | 19 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 47e13a3fb9072..937dc341abe5e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -37,6 +37,12 @@
>  #define GMD_ID					XE_REG(0xd8c)
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +/*
> + * Spec defines these bits as "Reserved", but then make them assume some
> + * meaning that depends on the ARCH. To avoid any confusion, call them
> + * SUBIP_FLAG_MASK.
> + */
> +#define   GMD_ID_SUBIP_FLAG_MASK		REG_GENMASK(13, 6)
>  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
>  
>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37e3735f34e63..ecc3e091b89e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1681,6 +1681,25 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
> +	/*
> +	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
> +	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
> +	 * inform the IP version of the subunits.

See feedback on previous patch; I think it may turn out to be the case
that main gamctrl doesn't exist for the media GT even for the cases
where GuC and CS subunits are fully Xe3p.  If so, we may be able to drop
this patch.


Matt

> +	 */
> +	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
> +		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
> +		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
> +
> +		if (!subip)
> +			return true;
> +
> +		xe_gt_WARN(gt, subip != 1,
> +			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
> +			   subip);
> +
> +		return false;
> +	}
> +
>  	return GT_VER(gt) >= 35;
>  }
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
