Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BEECCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 03:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2910E078;
	Sat,  8 Nov 2025 03:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAjhtGtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14E10E078
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762572128; x=1794108128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7o48N8FgWJu9f4p2UDIQjVH8q7HDJrNRX/dZq4m8GCY=;
 b=dAjhtGtGGIZq5gL/exPLbSNCYW6TWlz0RnaUqcK0DdNTiSrpzgkBwOG0
 /U18hiJrNIHSsSNgwrrqZR9Emvn5nxQVbgBos0D8/EAJyXrNamYuIWVio
 HixckuNUBmPgZizT9zUnDq0gF1dUckBXz+xishrn3Lvxyb6Sp9mB7ciL4
 UYQ6Mt4a3XGFNP8FLQb+KPpVgnUK3KH0FWXdrFB6eH33u9iyC7ws6yoXq
 3cosjLWIXXxAFgl9JQJsboFTHKf/2Tfvc1HfdhMkZEz+YfPmNG3kuTY8a
 9O3zgntbjn5LHqWZN0P+xI0iYGyNMtabDTCBiaVnu5Ek1KkdiUSP6ZW7n g==;
X-CSE-ConnectionGUID: m97rrqvyRDOta+NNJIyfLA==
X-CSE-MsgGUID: WDxDkiVfSwuUvZDKC5ykEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87351937"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="87351937"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:22:08 -0800
X-CSE-ConnectionGUID: KDmh98ELSeumvyvwbsrqlg==
X-CSE-MsgGUID: vObKfULZQSulF9neIEnXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="188366759"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:22:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:22:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 19:22:07 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUqzYiZnzFvDHEsbQ2jes0Vl92Vu8B/wJ1Fxpb5j0iIbcNBGXsCTaip69qZglZ1bVudEj5JZC8U86MhGM4rJj5A0LlaEPdRfkVNO9YjrMa7oa/hUmsslZ5Oy/TZOFw4VtMbF7EwEB/oA9lZxNJaYVw7uIMHR5kqKfJUqI2lX77bB5QyXuULUfEFGqER2o0tmJ6KC2KC8xbqK08pFfmL8U6b1Y2fcIXIwGEZBUGD0OQFa9UXidQVdsJa54wxbaJ4slHQXtDCsZPp/PsWRWUkv+Y8NB0XRgtuiWq/fh05q7S86LPfJ3jqx8f6RyIrczcEubQVgcG4N6tgBIkH018vF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNcB3GpVxRXqXSpkPbWE96D9ZamGvsdQ2qScbJJvdmU=;
 b=nTj7CHk+iamdOSQNnzpDS1M9Qr9pZ6B7zBvTTtxamYV11S+QUymqDH9NQJm1s2CPlMa6V7Aimb7F5nJbSNNSkc7SIj3vDytmUvWFBA+V3fn6eRuhgSbgleO+PkdVB25J5UcGkhQEy5pekv8fs7m7FJ0bT4/NHo2o2m2DvJsEnl7HyxGO48n3ZKANWssdwtn79T7DUflEubTbjyPTdZWnIMhzouGI+AlveJM9hLGcFgJ5oIizZnPHmEjE6PKpGbJqr1DbIaqWLJPg8+U8qUBpfQUIipcMiygKuQ/Dphe6guS7ngT9C6Vel+CXyhPrCupMB2YHKcjfCQKxFDXIlBeYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 03:22:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 03:22:04 +0000
Date: Fri, 7 Nov 2025 22:21:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe/guc: Eliminate RPa frequency caching
Message-ID: <aQ63V87uylxo77ie@intel.com>
References: <20251104195735.1606126-4-sk.anirban@intel.com>
 <20251104195735.1606126-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104195735.1606126-6-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPF4D011AE7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce7aff1-bfe1-44a4-46ab-08de1e75fd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwxcOTpTpaAt/jSKmdAYetVCdpplL6S0TsxptIReI5h2MBlbPzDJdjxOVQ9p?=
 =?us-ascii?Q?wRCtIHcOAuN8jEXltwukxkJjI6mbTvgjUrVdvgKzsiPrbPf4OWr8okXz93ZQ?=
 =?us-ascii?Q?rEAOPU8KZfzoeC2Chc6TP6/w0vo4oUTws7sPeK3ptpRGd64Dx3lZTwyVZUoB?=
 =?us-ascii?Q?B5jmDDDO7mvZyITvmZzuK58ad7zirjUqmIBL63mAunaUrE+0CckjIRDnvZka?=
 =?us-ascii?Q?BUFisouARjnahrcnCDMWBNkALbc4njpdRzNRE0GDc8o1nAeikIvLisRSZXre?=
 =?us-ascii?Q?AGkHAu+2AxB42xnUZuZtZDz7rwnDhb3CWc53Xo2+w0ebB7SzGVekASW/9DeY?=
 =?us-ascii?Q?Mh7IKnl6TrCZJMAtfOQUCbJYuVGWcDtyv2vkYKk7uyQVgh+22h7JNNlIPog7?=
 =?us-ascii?Q?LOOe/ro0iDtZ0w2rVx4dU8aGrNVDbfvHMHUCs2i/QYy93A+7U+tBO3ER3xbe?=
 =?us-ascii?Q?KTDA4+LOPy30DiCknROQqg2Zy6Q49tHoN0CH8s5Y6cIbT0SzGaC7g3RHIYCx?=
 =?us-ascii?Q?vor4SvypulW93awjD7S6evlJHWPq7/E6yWpBLgQgLBnnvnXcnNbRPiiOQiyF?=
 =?us-ascii?Q?qkECZivW/+wrAM2Wr3PRHzbln4L3RhCwBp+Qltlvh9sTwOpzIlAqDTbtWckk?=
 =?us-ascii?Q?1SqTD1gBB3f12dSL6PyxwROVqwtwTUIncPP4t/5TMieDvpjEkA5g9eR/SGnB?=
 =?us-ascii?Q?AGCCb2+VdxD+uGcefgLL1Zv67Pc2fnBBvf3Jltx2jCsoJftP828KxbMGNEKw?=
 =?us-ascii?Q?JuIsqV9j1n70h/+Y0Y38eqQnS6rKq67DFJvq6fnFifTOCzOmopfD7iuQ24J5?=
 =?us-ascii?Q?unQlJQov1YWd9FAhmN4D+7dOAYO+tBOL+DEJmQzraeCiJjBlzYNayW3fCqSE?=
 =?us-ascii?Q?zrYWMtsUdbxal4ciQg3VCJYf2QRD8OuIe58MOjX2bz95Qe1whb9aWvrNG8rq?=
 =?us-ascii?Q?vduqGNowgitK1kZhB0tCwpkmh4hsNQyF0PcJn1GW7nL2l0sGW6VmIV2UcFBZ?=
 =?us-ascii?Q?b16aESMXtg+zB7AJzChZc2QWs3yPRP7zxnvn5kqd4d54XY7MtmGTYB3i2DXK?=
 =?us-ascii?Q?wAYZzEHIik8h7/Jbukntggfwcev1iPipD6MXG4TuemhiVEma604b+jajqvPw?=
 =?us-ascii?Q?f4rOj/7H/zUCqqDQBnCE0WrrllkMbqkxqEFtH4yy/oewStkFSRlTA8CUXKKW?=
 =?us-ascii?Q?/TU6LUqiYe3huBT+7bFiQ91EvlTqEMHiHDmsJpmxnaqik6vS16xQr5p5AQfP?=
 =?us-ascii?Q?BfMP4djXeX2m79td8TQsZKTzPusZnbHOunHIDmjcv7GjIeYs9+Y5EXjePxK/?=
 =?us-ascii?Q?gJXGzSSd2cU/3Y6F+dYFCNGrlQKTR7uZqzhkjQi49N+1baraSNJR6OeG99HF?=
 =?us-ascii?Q?LIu7i2MgDxQf2WzYu9fazyZFdrZqpJlIhAHn3y52gRTEXnO9CsZHVUF9uvgA?=
 =?us-ascii?Q?sZ6nvPMkVbhgGdTAaXDvxSLIWGBcG8nK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jvS/GIA0Rhu9YL+QzTP1VC5u+QZhT+f1Nfd2V9Iklqf5I8x8d0pFaykKk/gi?=
 =?us-ascii?Q?UCXG1XP2A1uHO4r0P7H/R0nqarVXlpJxIiWoY0Qv/h+TfM+FmLOW+guRe1Qz?=
 =?us-ascii?Q?91uWfjX/WFsZO61/gfVO6/YOVqJOOS9DX9uA6kXPlh6Pfj6VcLC+AMxl5tQm?=
 =?us-ascii?Q?6/MGiQGS2cqACxwC0iJOEjsxxmadPY1RBmBhq9c4LZn2oQOAe/gNXHVtJ7dV?=
 =?us-ascii?Q?1lKf3gIIVAjXx+8n1vplr7tLHKXYjQKIOjtUzdmttASWJi5szT6+38xG5UUN?=
 =?us-ascii?Q?ExhYwamPhW5g62EyToaY6AE7HUgjo9fR6z08xqQebIEbKtuDSoszgQ3hYbNr?=
 =?us-ascii?Q?jpvx9Qo3Qt9VR96cTa3Mi9FhX4A3lUharQjRLsiA03oeNRiNNgp4QU061/1D?=
 =?us-ascii?Q?mAn21Sxnit0s5vJu6B9gDbACI1XEexXWw2yzM5bsPzYtlXN26F+AwG+1diQb?=
 =?us-ascii?Q?MNc7dmmLx69JY4OvFL+g6ccEuZ9rjoCL7ZDtNlktV1iIB5wZkEvs4YVrVhzH?=
 =?us-ascii?Q?FN4nGWvgqoig+Mcmnr8JhSeXk09etwrr77N8JIVqnv20rL7BlXDTyGEPyfnJ?=
 =?us-ascii?Q?gQ39lV0mTF0Jx1kzy0ZuNWUlldws0RE+LAMGdxZDpr/tdfiL6FNSfWGgNSN/?=
 =?us-ascii?Q?AxooTkwPAF1t4xgXPa4TyJXd4cYuBgWp1ORaUlFKG8cG17CAkMu4l+VlvCtg?=
 =?us-ascii?Q?t17Wi7KuaQuETzUG4wCetzRsyzLPxWAIRt8t2Kx5lE5ttoEH+wfOK44ch1M4?=
 =?us-ascii?Q?rDNG3SlMD0T6Tr6LJH+YAVM5Nx5uNbUIIZiJgF+WkycPe3lA4VltUXxw7vyM?=
 =?us-ascii?Q?81gol875uXlICW8N2xEO2e5jgfFnclO7CaPaQBeVAv464JAjDFy5DTnh8QJA?=
 =?us-ascii?Q?zrO/YRZu2XYfOugoWJz53idFfXDZAl+XFb0De7ANXRMY/0oh1BlrtUEvpKma?=
 =?us-ascii?Q?QwSxq6dqv22taNQ+1GGnpnFcdVRhmlBuISjMzXBT61PxOUdpuBn2guGw7csT?=
 =?us-ascii?Q?fJsW12wmI5ek7hvLiwjLGYWiijKYXyzo8uTHEjyXVaPgMq29uDvrksvApsJe?=
 =?us-ascii?Q?lCamYWvjh2HesuHFokMkL+NC2yt7ycACKpFZ6kQBjLwKm8Xw9+Ib0DlsD9s5?=
 =?us-ascii?Q?fm5Vn2qhguaGpBps0QhWASa+hb/LOYzxRKzLnmfEp/PL8Be3W2nTtbeS2Jgm?=
 =?us-ascii?Q?JoDcBt42KBxhyxQ/SsVptAB875tuDYTsuXGYGDGiu+bb+m5H5SBLFD6mTqWg?=
 =?us-ascii?Q?vN8qiAyP58hv0JmnrLXjVNyNEVprGudmjm8T47zUVZJUjuSEmC0twOfospr6?=
 =?us-ascii?Q?tPFwwTdmpT1DxalczHR8dSCLZG/vjni5MZ5m/clY1/gU7ksfwtYPCg+MEbIu?=
 =?us-ascii?Q?WrC1ZXcM3YX2Vq6IF6aaMTMNV3+PU6O6Wu+yUrsBqojvI7TvvTXdwlFYytAZ?=
 =?us-ascii?Q?My7rjq06Alr4AY6FxNUdzEmmyiQ/QpKFuU+XkBGHHcoO3ILfCveYaSWjEB5a?=
 =?us-ascii?Q?CLas3BdUtqj2Vk2yWx9fRlc3VmBCpvSPAXKSugWmIIyOQd1hW/mi9q1j1znP?=
 =?us-ascii?Q?KGJfXCH/Ot4vhy7hLFxaC/Q4aqEnjboVuRZoMs2uRk2GlkyX8Rk1dEML97u9?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce7aff1-bfe1-44a4-46ab-08de1e75fd25
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 03:22:04.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8Xqj0n13R0OZ6+/QjPr52fbzdmri6boCruu0/vgXQyz1WQb9U6JlEfR+mTNTxuArKEZoXK6mYvuwaNJNloSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
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

On Wed, Nov 05, 2025 at 01:27:38AM +0530, Sk Anirban wrote:
> Remove the cached pc->rpa_freq field and refactor RPA frequency handling
> to fetch values directly from hardware registers on each request.
> 
> v2: Check graphics version instead of platform (Rodrigo)
> v3: Fix graphics version check (Badal)
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 55 +++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>  2 files changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index efa9318c4587..ea9925cdc107 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -363,7 +363,7 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>  				   freq);
>  }
>  
> -static void mtl_update_rpa_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpa_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
> @@ -373,7 +373,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
>  
> -	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>  }
>  
>  static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
> @@ -389,24 +389,28 @@ static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>  	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
>  
> -static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> +static u32 pvc_get_rpa_freq(struct xe_guc_pc *pc)
>  {
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	u32 reg;
> -
>  	/*
>  	 * For PVC we still need to use fused RP0 as the approximation for RPa
>  	 * For other platforms than PVC we get the resolved RPa directly from
>  	 * PCODE at a different register
>  	 */
> -	if (xe->info.platform == XE_PVC) {
> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	} else {
> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	}
> +
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	return REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
> +static u32 tgl_get_rpa_freq(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +	return REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
>  
>  static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
> @@ -427,17 +431,6 @@ static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>  	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
>  
> -static void pc_update_rp_values(struct xe_guc_pc *pc)
> -{
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (GRAPHICS_VERx100(xe) >= 1270)
> -		mtl_update_rpa_value(pc);
> -	else
> -		tgl_update_rpa_value(pc);
> -}
> -
>  /**
>   * xe_guc_pc_get_act_freq - Get Actual running frequency
>   * @pc: The GuC PC
> @@ -536,9 +529,15 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>   */
>  u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>  {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	return pc->rpa_freq;
> +	if (GRAPHICS_VERx100(xe) == 1260)
> +		return pvc_get_rpa_freq(pc);
> +	else if (GRAPHICS_VERx100(xe) >= 1270)
> +		return mtl_get_rpa_freq(pc);
> +	else
> +		return tgl_get_rpa_freq(pc);
>  }
>  
>  /**
> @@ -1135,8 +1134,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>  	if (ret)
>  		goto out;
>  
> -	pc_update_rp_values(pc);
> -
>  	pc_init_pcode_freq(pc);
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index f27c05d81706..711bbcdcb0d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -19,8 +19,6 @@ struct xe_guc_pc {
>  	atomic_t flush_freq_limit;
>  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>  	u32 rp0_freq;
> -	/** @rpa_freq: HW RPa frequency - The Achievable one */
> -	u32 rpa_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
>  	u32 rpn_freq;
>  	/** @user_requested_min: Stash the minimum requested freq by user */
> -- 
> 2.43.0
> 
