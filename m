Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD05C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 20:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA34D10EA55;
	Mon, 29 Jan 2024 20:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E176010EA55
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706559286; x=1738095286;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EtLFPSnLrplrzJGU/XfXcB9UBQqbTj/9FWzwMNh8MxU=;
 b=mARKbfIsjvlwHkNFzSKRNmDVxxARo3J+spTYkCOGyJiVmcH5YQgCfa6M
 iVQ1y9ZAtVxIJnyrPfLp8ama86jSgXfH9C3T6UsIihbRkFHjhpo7SGMtv
 DyWMF9ekY4lQ+MuyVHzmpNsd1ADEmpb9gYrcof2wB/gSLIgpVocGmy625
 AkqUg1WkfL1n/3E0tE+OTuGuhRZ+DakhrQLXWsHpjodAzaSi8Zq9/wmGZ
 DdCoKqRZqhmxKqKFCGeXteSdEpIXX7MnvC+LsFNaThcSjxA7btkJLexs/
 EojTiUnjKza8DvgKFLap/SuWFnqcgtUFgapmYOpN5V4mSX+dJTs924b6w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402709690"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="402709690"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 12:14:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911196396"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="911196396"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 12:14:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:14:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 12:14:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 12:14:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOWyScfG0KRWL8Me6Z+d41u4igdL4G1cuSbWnMRjibT1ZG/GpbGn0UV1/P900LTfGEcBfxZ3C1DV+gz4aSFn3iyAXVAsI6i2Y5q2H90x3G6vcNReqHiGiuhld6PE9hfizZZmEw4fcQj8f3+Da7gt5GffAZtnzxJt2qmg21P6hkIHZv6+UhFh0xMkXbGw3Q2i8IoL0jhdUdHzQWAJU1Zuo5xxgMyY21ox85Kphyfb/xbDbA4ytTYJyok8FDb1SffF1qLT9r8AUvd9qL56N5ssvJ91XYafAAp+Mj+FrC9V/NebOc6HVwMWeF1p11qBTGl/WklTpP1CsJtFe7D7TPfBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGkDkON55XfJOf6v91Nqc+yy6kL/HaoGrPwe75wLuKE=;
 b=fxXTmfGVeOFojQ4Jiz+1aibk02k6PG7Enmg54IUjOUM198nXufPbqQyBsy1qR3UQpyqqe+VEU3PU6epD2Cu+bOIlIstOIoFR/CWgotDH7FbJmmgsdTpU5ikTtV33jW+2CTiUx90WLgEWb+O5ZVM4nxm+1PqqcUf0TfRgEJ/H1LaxTFj5HrlsejxVSDCB2e2GObgAFuRVBHI6pPfhaVG/ruNgfX0ZYHweF5JSW+Qdg17J3JyAO1KyrXDC58z807MK6vCyisVY71Lb/vzc8+lp45qEO4rKokzlbGuiKCEKYIQK/c4Wn0yP66hOUjtdnQD8LCw5+QuMClNdRJgvYQ258Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 20:14:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 20:14:42 +0000
Date: Mon, 29 Jan 2024 12:14:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add SVG state table for Xe2
Message-ID: <20240129201440.GI5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129194615.282624-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129194615.282624-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR08CA0035.namprd08.prod.outlook.com
 (2603:10b6:a03:100::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: fbde643b-811a-44e6-2ab6-08dc2106ee0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUPXQ1Sx0jtCLzZiFy4jtUWlppRKMrP5lqe5UeM8ThBSFbhM63PM+9RkqngRBhQUg/XCqHZvnac2e6Ko+5EbQlw6L+9RNfjT+thvIIH4zdHFFz5A5jnsvGbYv8jBuHoVDN3F6hTU0XfhbbDdE+vP/+84GTl1jaZdofwytOQ9xOdhj7dNwQ/yDpadMEP+97x8UV4+kbC9u1nOALaIV/AlSX2b5VErRu14n3DjDY/ZrX1uZ/6Dp0Ia7znTplAsw1m87x4ghuVjBjKhTRlG9Y8ww4MnM8swqbFAoCevPuYCbZgtRgufAaQHaO5zo33JGIkPMH0PZcFjNl/kvfHC1E54OHOVcCGp4/6CdgraYi+GLkIhWMUI9f6jLMN8H5vt9255zulFcLaoej6ZsXr4+xOcEPowPIVsvKkyEGs89kd5KfHN7ozrEvUBSwyXpyWRXXteeWWBxZKiHcGCXt8jcy2NafnohmnpRmBRXM62IpkfoOXNfWj+SIPGP7evrsjZJcu7mHiwf0JLHytfNPI350j7itzuyGT9VStZ24d5ZDymI9LI/EaT+0Alh+7upS7gSvHO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(82960400001)(38100700002)(1076003)(83380400001)(26005)(6506007)(478600001)(6486002)(316002)(66946007)(33656002)(66476007)(66556008)(6636002)(8676002)(5660300002)(4326008)(6862004)(8936002)(2906002)(6512007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1Rfg2QuXLV7odueaSFsj9Q1MPHyienZQTGnLTAbWTfFT/+kpPEHDabPHeT?=
 =?iso-8859-1?Q?wO8xEYMNgR2tu/NNo0i8i/kY7leZXaIwbjBRLqp2s3i3u18+l6QIoM24f5?=
 =?iso-8859-1?Q?6jc8lawq1XzzAkbUD1DTa7Kgzye2H9WSrON56JW7vx4wBEb3+s9ZOGAtsi?=
 =?iso-8859-1?Q?pKsTsA6jLpBjeOqIanIvFgqCfiW1PGs6M8OcDF3IzZrnotsfjPiH0oD6qF?=
 =?iso-8859-1?Q?FNmhTvxXZHePNtI/dbt2/oYoAoPu1f81cHoYzM2z69vjwlHR80KJLEa4pW?=
 =?iso-8859-1?Q?PCQCk8DrKBQf1xdJNgUaKmzYApGa0tik4VN+X2FLBovHIOOWVtfABter6x?=
 =?iso-8859-1?Q?cvnVbTuNZeUE/R3jv9PCQAzdVhNVNYQsLebGeWn7ck0zbx1aeUIIvDxJVM?=
 =?iso-8859-1?Q?mix2nI0WPQ/dBHsdwg95UNQoxKa8B06lEVaO9Z7oshuJ/voy/z4Bwd5XkL?=
 =?iso-8859-1?Q?i38wNtF9nKwJqgQ+eJJqW5UT4ac66hfDMgxzgKS1bAR7fLI7T7vKg0kC5w?=
 =?iso-8859-1?Q?KzG3DvXKPpZTqv7WOARZRmAgalnFAgURolfwAN8ZNo23+DKtoy/QTK4IVF?=
 =?iso-8859-1?Q?tmVXf0oZSCcs43Sdxv8DRmyWpThlKFlNRGCDavp4X1VcBhh02IHumFOP4c?=
 =?iso-8859-1?Q?eJzM5+dph1fxKZaLM1yVQ0YjSrosr0PnV/oHkHnpBE/1Jpk2SwYFQgkyAa?=
 =?iso-8859-1?Q?S3ftIPSAFeAZXVDpfWHB8B0hUwJ/N4yvrf7NK79UvSvGoTW1p/xoCqlbi5?=
 =?iso-8859-1?Q?IQ1sciruDZkJqU7TMy4sDAlFifDMiPf1ZM19HHgcUWohzthA3c6/RZkmVc?=
 =?iso-8859-1?Q?AcrpU4CTdgV2xlCSyFATQiH/ik2SartRUWIoIJrnGAJUDVxc6q4K/OvIU8?=
 =?iso-8859-1?Q?lylK64rp94onrsOymeC6MrN5HTs3aYOUiqj3dvfsNfJLJdepLMHpag+chq?=
 =?iso-8859-1?Q?DsbhEvNFp+toEHhfgO4L7qA5WcF0jdK2iQgdhHHNEb2v9+rg53ZHbMa3Ix?=
 =?iso-8859-1?Q?JgiNK7pYt4tKgY5hXra1MAOWlFLuqTten0XdXeCagV0qBWgeJ2ZCKy8I1J?=
 =?iso-8859-1?Q?jh77kA3uwAcuDYnk1h6p33z+OWyRx6GbVgws39g3/Qh5XoDGpCeIGbxGc2?=
 =?iso-8859-1?Q?23VBmFHQ8sY87hWqcHLEch3YiHLV0LOailTARhy283uIQe2RKwpHLPyDYJ?=
 =?iso-8859-1?Q?evVCgOXT0Drndjslvhy08YJodZBNQtTDgPFDA1yvCyGq2CDNMOL12ycLsG?=
 =?iso-8859-1?Q?5LIT3MlQZZqXIKnuuAO3ve+jVVwCBF1ZJfZ1pK3UeGmLjgx8zK5qpvDna0?=
 =?iso-8859-1?Q?VQHlz6echtIiu6p7OY3/4YLKV7Kof/r1YuxSD1yhTcoTWjoEyV9jLdvQGL?=
 =?iso-8859-1?Q?M/AN2qfGf/PEgVnYPIBwhmrcARHPp7k6qdnQ2A27CB/PRCpJCUVdJUoyqk?=
 =?iso-8859-1?Q?vnGw4Npy0R2iCfWweBfDEi0vnOygISPdIt1USx/Hu+1NIo95NWjlVr1qCq?=
 =?iso-8859-1?Q?0FAg2A5oQ1y2k8452pzu+/LkTy+T3kxz64+SegXNOFwswjXZuOV7qcYYIK?=
 =?iso-8859-1?Q?kkwuGSpf78m4VUlagNBE9vh8J3yCk54fp7DWvAq90zbkzQO+TSzm53Of4h?=
 =?iso-8859-1?Q?JM4cxSQEusM1WVNX4uVLZE442TI9gKSy6scDY28DttP7nAPtNeHFbuRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbde643b-811a-44e6-2ab6-08dc2106ee0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 20:14:42.7991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTT1ZFTZnRAC0SkfThWZB3+aG7pFTNyJnWZZmIZYcif2Hn467IxXffd2UCjDGSSueNp8c3br/nWY/h+95x9tF6E/pU1dXp+Tu4jua7qlV84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 11:46:14AM -0800, José Roberto de Souza wrote:
> 3DSTATE_HS has a different lenght than gfx1255+ platforms.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 59 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f17e9785355e8..87ccff1f8e20a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1255,6 +1255,59 @@ static const struct instr_state xe_hpg_svg_state[] = {
>  	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
>  };
>  
> +static const struct instr_state xe2_svg_state[] = {
> +	{ .instr = CMD_3DSTATE_CONSTANT_VS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_HS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_DS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_CONSTANT_GS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_VERTEX_ELEMENTS, .num_dw = 69 },
> +	{ .instr = CMD_3DSTATE_VF_COMPONENT_PACKING, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_VF_SGVS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_VF_SGVS_2, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_VS, .num_dw = 9 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_VS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_VS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_VS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_STREAMOUT, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_0, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_1, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_2, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_SO_BUFFER_INDEX_3, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_CLIP, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_PRIMITIVE_REPLICATION, .num_dw = 6 },
> +	{ .instr = CMD_3DSTATE_CLIP_MESH, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SF, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_SCISSOR_STATE_POINTERS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_RASTER, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_TBIMR_TILE_PASS_INFO, .num_dw = 4 },
> +	{ .instr = CMD_3DSTATE_WM_HZ_OP, .num_dw = 6 },
> +	{ .instr = CMD_3DSTATE_MULTISAMPLE, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_HS, .num_dw = 8 },

Hmm, the bspec seems to contradict itself on this one.  According to
bspec 65182, Xe2's LRC is reserving 9 dwords here rather than 8 dwords
as it might on certain other platforms.  However bspec 56209/56250 only
describe 8 dwords for 3DSTATE_HS_BODY.

Have you dumped the hardware-created context to see what size it
actually uses?  It may be that the hardware team changed the instruction
size, but continued to use 9 dwords of storage in the LRC due to an
oversight.  In general, I think it's always "safe" to have an oversized
instruction in the LRC (the instruction's "length" field is mainly just
used by the instruction parser to figure out where the start of the next
instruction will be, and any unnecessary dwords are 0 and just wind up
getting treated as harmless noops).


Matt

> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_HS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_HS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_HS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TASK_CONTROL, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TASK_SHADER, .num_dw = 7 },
> +	{ .instr = CMD_3DSTATE_TASK_SHADER_DATA, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_TASK, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_TE, .num_dw = 5 },
> +	{ .instr = CMD_3DSTATE_TASK_REDISTRIB, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_DS, .num_dw = 11 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_DS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_DS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_DS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_GS, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_BINDING_TABLE_POINTERS_GS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_SAMPLER_STATE_POINTERS_GS, .num_dw = 2 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_GS, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_CONTROL, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_SHADER_DATA, .num_dw = 10 },
> +	{ .instr = CMD_3DSTATE_URB_ALLOC_MESH, .num_dw = 3 },
> +	{ .instr = CMD_3DSTATE_MESH_SHADER, .num_dw = 8 },
> +	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
> +};
> +
>  void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
>  {
>  	struct xe_gt *gt = q->hwe->gt;
> @@ -1271,10 +1324,14 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
>  
>  	switch (GRAPHICS_VERx100(xe)) {
>  	case 1255:
> -	case 1270 ... 2004:
> +	case 1270:
>  		state_table = xe_hpg_svg_state;
>  		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
>  		break;
> +	case 2000 ... 2004:
> +		state_table = xe2_svg_state;
> +		state_table_size = ARRAY_SIZE(xe2_svg_state);
> +		break;
>  	default:
>  		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
>  			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
