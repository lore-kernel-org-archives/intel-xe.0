Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D521CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 16:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC7B10E677;
	Tue,  2 Dec 2025 16:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcTHPGXE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6800A10E677
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691312; x=1796227312;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6o5tbBM4T4vhTdhFxZZN973kz1pd5FlUh8948d2n40g=;
 b=GcTHPGXEnTxIlYW6IKhXhY2gv4BIm3EkiO6Wz79KkbdjUSAgvDTbumq+
 7SPzZPohfBYdhpn8X7haGRj7uYsDythloWpRuFAp+Om1gAboCzzwZ6be2
 k0tHVjZkoDG647uBCjBlYKAgA1NIEU6vPAAFrVUiQiI5nxs4hMspdOAkA
 5WD9MaHo7zjSHS9dfJcuN4v3q5qmvFM81SwgovROGPFW0zVrkX9lE/HB7
 c/rXqv9E7v9qL2ErIkE7TrJXK7Agr9LZe3Bepd+P4wyWmarUWYvpDu7pQ
 pz0pOi/HzZ+WWm5LptdUFpXfjyJwJ30yyTgmdXgUlbtGcelGBhXjNI/FE w==;
X-CSE-ConnectionGUID: LwFNh1FqQWOGaQAg+vpVyg==
X-CSE-MsgGUID: iyCRV+gmT1C9/uKuxQFHkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89314320"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="89314320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:01:51 -0800
X-CSE-ConnectionGUID: 4rTfbTIWRWORNO4DLcG9OA==
X-CSE-MsgGUID: Cj7VyuhjQDKR7JRWEVvn6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="217765466"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:01:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:01:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:01:50 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:01:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+tMc3Eqwn53YDwoVx1WSQm0F2+yi6XV+p3II+Tk8bZiyVsQFtdxxBuT5rFbnHmLV4Dbi8cn0fJ4uKyBYvLrlv3IvgBaFQRBtxm+CrlO5gZo5BaG+bkucKO78icKdNfUKbjwjWrK1a+Y9azRSikuuwkDFeyQ37GK8OBEvAvcCIBbZDU6DLGNlEdrgr/h7Hz5u5IGjD9GZwQDQkxfV78yobu2QyRPIeTwvDoT08MK8l+jZP/AaWLKSxg/7L1CdvkOVg458YiBq6O4Pc0QPz7v6KQBuvSSQm7/4zK4PMCojRDUswAQlVt6V5p56X0vTo8E9yyVi73oxGPy5Vv6Z26+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFQ+/LwGrCXUxrGmS/oPwl3EO1hPzBZKrnus7knQw1g=;
 b=K/M5ivU4F72PXdDOIRT40CIuj8EieE/HQaMoEGAA5NXd7Adw8tGjm+LWr9ZxWa2+2xuZn3yV8Nt/k9NiGqIc3Q+1MYCPEXyrQJPWsFcB75qPxtw9ZYDPon7VT5LGk5XbEXYQzq23x5+U1+gfTtr7tchC9JLryi1dpSiplfwv8fmgn1t8+yWuqXNBsYa2aR7NGJfEu4YrBwDtMCcyKQAjFuFFqZTZMfNCpOkoY+UUSY02QhHexPdzO6X7v0h+8OQkNanibAGJy6ZrAE8KEOrbICl7SKibMWbj12qP/Y++y03hK8qr/+5vqC/JVsa9KmkWNl52aWujnjnpbylPCn9oCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:01:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:01:46 +0000
Date: Tue, 2 Dec 2025 08:01:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe/guc_ct: Assert on credits mismatch during
 runtime suspend
Message-ID: <aS8NZz36I8vOpWHn@lstrano-desk.jf.intel.com>
References: <20251202083334.554045-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202083334.554045-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 0999be7d-1169-4e7c-21e8-08de31bc17ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TmKPdAxH9DSsXa4ObMm/vb5qhD+S09gpoFgoEGhVvPi1XroUqi+c9POge7/Z?=
 =?us-ascii?Q?cIEtkv4FysXhwnV8I6fXXjh89xKsAg+k+bNpTHMRahEOxUbdJFV2UAnceOn6?=
 =?us-ascii?Q?5SgpPTf4RxakSxErM5r/cqtLPehE74w0gkz+LzbP7cNDQzAaWS06JLG1/X+U?=
 =?us-ascii?Q?+qO8/sbayC0psiOpoQPdrFSLa55kdtSaU737GDr6wmX58aF6fm5eUGebpBKG?=
 =?us-ascii?Q?EBPv4o2/44qUmeI6UDVmvbE2Xk9Sqrd4y99Pm6uyyg7qGOGLeiwU1lt1vv2x?=
 =?us-ascii?Q?BXgV3v1SohE/rnwaFjdBnMnCxJytyPRN8VndBo4QQTETSbo6MmYyLvzDvxJ4?=
 =?us-ascii?Q?J3rNL2CSGPpGgo9LLkut1EZld2gicZvRNdHF7ApADWoyzUG8+azHuy1MUHlN?=
 =?us-ascii?Q?blQWkujzRXgH3DWKrxgET9PwJV+Cbq5iY8EblMeGykNxH7Ct5z3bCUEq4/0D?=
 =?us-ascii?Q?BrDatiY5vtt8h3kFUi+u2l/Zj+qL6qwlA6ghtGNIkq2NGIlhj9AvrwG2GIgB?=
 =?us-ascii?Q?S1+DxNBrJE3HmgytlMRPnP0GjmcPcfmonk52iAxSBIr6SWod9lxYMQg9rWGO?=
 =?us-ascii?Q?OLQ1RYDRsHdxcEQ3+rgn48cFRVczTBpJLZbczXQdxaYtHjcM5F9ehoRNIJk2?=
 =?us-ascii?Q?4eDQeeR85yMq6iI1INg6q1F+MHZgoF/BFwFTddrnOzHi2WOfHsKTt4bYsxG4?=
 =?us-ascii?Q?og9GXLk5N+l4QH5x3O+WOUkKceiSQKC8aN7lowJwq4GX3AG+vQmf0s5vUdbA?=
 =?us-ascii?Q?jB0Sue6mn4RCvjiFTP5giZ9wssYD1Wnn3IqV+VlRbB97jCwaI1ewkmd05Er5?=
 =?us-ascii?Q?1fF4br+04AmmIe1b+jg/0DaY2OHVoftI5c3e4e7Rc7BovVaHUNqFE3kfgFPD?=
 =?us-ascii?Q?wMK10wrd6NEcEeiFL/bWLTSRZhIxRmdb3kHisRMO1xWicDsZI08RY8myWzgY?=
 =?us-ascii?Q?dtZ5DEmeoj8Gr2U7XI4RPoRGujLYZo9npBCvO2IcqPmaINLwhlnr7diz5oQs?=
 =?us-ascii?Q?XIFToBikKwg61O8j577zYf40iVre5Ya9CdV/PU5nWaqlBTuydeZliqEfXw2R?=
 =?us-ascii?Q?qv3qdMQZ5G9nFAqh5mrCJYfZF8BlUikwlHpkx2m7wz8et9oZ6A48p+krLUoh?=
 =?us-ascii?Q?L8XTa4MluFZOBHAEsxKSYLzDPSWnnjSv9AwHuR361cMTDUis4kCsJ721J7iT?=
 =?us-ascii?Q?A+FCj0FcY/I8jZbkiDi0tRNvFdnqEXnnkfbpWDIdA5/IaoZTmLnskytcIBjk?=
 =?us-ascii?Q?8g9DBSglzXnjDjabL8jvBKzMR43tHbbajmeAGqrVENvkwlu7fvxqv4Tg61pW?=
 =?us-ascii?Q?51BGUbG3VcGXC+05ETiAn6YbEF1sg76lIe9cCm/o5iGx4XsFa+1p+d8yFf5B?=
 =?us-ascii?Q?4XQ6g6R4mZyULv9+Rer+TxszNez3ZJ++JkftRey0IgfTvxOatk5LItATpduu?=
 =?us-ascii?Q?m4AszpFv//cyXQ2ogfZrffRQnDpwkgaf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DlbYAeBvZpMvjQ+oasgLyzrW3MZsV105HRYKPn2ZRkzTUNebuZTkN3NV38go?=
 =?us-ascii?Q?Vb4RABDMgiQ6Z9yIrtgFNQROEH9dgk+gVJfllB+8M6lFKSEQTsfb9YjglCK7?=
 =?us-ascii?Q?+B12vjlcBCxNSOeuo4gSzNFMsRktyMnkt6onpdTmessVdxPhkxgypjS7AbKf?=
 =?us-ascii?Q?8Ipw7vU0SbSKyvgX5fyStone8Fnue4LIK1+hUfF7NYECCMDCxdV/rRmidHc9?=
 =?us-ascii?Q?gdnJOu+5I2w6MVh6bp/aLaTFO9PbEljM5y71kWwseps/XDAUaRYJZSLgAKes?=
 =?us-ascii?Q?zOrpkrXsfrpKWLBA7nF1N/BUZ9pKUJDiFyu8BAnAnv1FtIp0nsPpgids0zR2?=
 =?us-ascii?Q?Qz/lhKp7tNybUTw0GvIci5EQa55+Rp8oE+XXd7AdltQVmExeZ2tOVzn5Hu0E?=
 =?us-ascii?Q?nKCTmutiDMZI7DYrMByPMZyLuigU2tSfQT8FEPch59lMvjujPqRJc2VDG8l+?=
 =?us-ascii?Q?o7H4d+50hdrDsWpBEOlCWLE4fW06ZMSb7QEMCRavPNF6v+3g05JlvozAqGde?=
 =?us-ascii?Q?IqwJ/IoeScCr08X9a+4JF0zlpRI1iRBJ7IACrCUmXRczikLHXqm3pGYas7pR?=
 =?us-ascii?Q?rz2DDCHqIN25VLCxN/+xex0fhpNd2Ok324hy9HPTId+yhvN/UcsL9ZFkPrjW?=
 =?us-ascii?Q?TLyfmxPY+EECvf//Zyb35GBDVMCBx5fcwB2OsMq5RXuBMg+ugKbHsfj759MZ?=
 =?us-ascii?Q?yilvwh/NBQpGjO8ziPUb9TiqVUfIqI2oG9KyOQknE+eUDK9aT3RRSNHMvt4H?=
 =?us-ascii?Q?/JFAsgClDpGI+VM5DNpERycBNB/YODM3q0SQltTrqFN4TCSlaryCmp5tmE68?=
 =?us-ascii?Q?G3gMAoz74PMpvz1uVwMRtuNS3yMAy8nIxr0yE5ChbaeXx5LSbuRZf14CnOsR?=
 =?us-ascii?Q?rd/OoZ/CeLVWIT5e2DeIuvl7rl5+GoMz0SXbHT4z9DBboxLpQ6UhrHZMdOsA?=
 =?us-ascii?Q?z1Z4qxxj0Wptu87pxvKn5PRW4W1rvst+JjABhyp5CwYkyOMTu9pfs1brzzYo?=
 =?us-ascii?Q?cENqzVCr9ym/vLQ2zMg9ZtYDSffzpJQbSmhBcctUBl4KSwrujLmCf+1YU+wf?=
 =?us-ascii?Q?z4xmd+VG2z4b50X237GOQx86Nr6dXz2eEGNpDCO9bIuVQdmCiKibRFh/keXw?=
 =?us-ascii?Q?gnAjQmB/IH8Lw8ZxBEfGsac//pxMmwdxkyMUPdZTZeDdmE1mKJgfkyGiNo9B?=
 =?us-ascii?Q?JE2FAh58hmaf6oQiPh+e9zhDcyHYI0xJnah8FXStcBTaGlMg6QRg/FqKd7Rs?=
 =?us-ascii?Q?MlsG/1w6T8mi8DjV65tVNnvmL9rVe8Sn88JJ6YuEZyh5y/cTK+xKBTiT3fvf?=
 =?us-ascii?Q?tP6hSJQLdJ0+fbr2MmV0cZhrzK4jQ84KFh6h314iCCNLHC1BeGAnF2kQmLaI?=
 =?us-ascii?Q?GnbvuJ5alqMAGmDAtb8RpBPib7UNYluvSmDWDT0ARyfnqC/aA5BDUlmOuo1Z?=
 =?us-ascii?Q?QTAF0bhvDktZoqqATo0uW9DwzKL65wF8V+CZyC9shOccrpJFCDf2vPsdPSYH?=
 =?us-ascii?Q?ZjjrEKoXnmfdkjyS3/mbG04kqi4+OQGqZS92QTuMVQqKpPJobc2BemtbNvKq?=
 =?us-ascii?Q?Cnq1fgglcfKs0FrxFEucgFP663DDaVN0o3b1w75Sx8gKPeOUQjR/9IxL50Qz?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0999be7d-1169-4e7c-21e8-08de31bc17ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:01:46.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6Plt9QtByneWarlag9JtAbvS3pn9SmC82LLi+pNav2dcHnTOqN4WRX1271z0C6LwBmuHyr4VgglhBrmoq8Clg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
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

On Tue, Dec 02, 2025 at 02:03:34PM +0530, Raag Jadav wrote:
> G2H credits should be in fully idle state when runtime suspending GuC CT.
> Assert on mismatch.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2a24d3fb6881..648f0f523abb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -253,8 +253,11 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>  #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> +#define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> +#define G2H_ROOM_BUFFER_DWORDS	(CTB_G2H_BUFFER_DWORDS / 2)
>  
>  /**
>   * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
> @@ -403,7 +406,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
>  static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  				struct iosys_map *map)
>  {
> -	h2g->info.size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
> +	h2g->info.size = CTB_H2G_BUFFER_DWORDS;
>  	h2g->info.resv_space = 0;
>  	h2g->info.tail = 0;
>  	h2g->info.head = 0;
> @@ -421,8 +424,8 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  				struct iosys_map *map)
>  {
> -	g2h->info.size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
> -	g2h->info.resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
> +	g2h->info.size = CTB_G2H_BUFFER_DWORDS;
> +	g2h->info.resv_space = G2H_ROOM_BUFFER_DWORDS;
>  	g2h->info.head = 0;
>  	g2h->info.tail = 0;
>  	g2h->info.space = CIRC_SPACE(g2h->info.tail, g2h->info.head,
> @@ -725,6 +728,12 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>   */
>  void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>  {
> +	struct guc_ctb *g2h = &ct->ctbs.g2h;
> +	u32 credits = CIRC_SPACE(0, 0, CTB_G2H_BUFFER_DWORDS) - G2H_ROOM_BUFFER_DWORDS;
> +
> +	/* We should be back to guc_ct_ctb_g2h_init() values */
> +	xe_gt_assert(ct_to_gt(ct), g2h->info.space == credits);
> +
>  	/*
>  	 * Since we're already in runtime suspend path, we shouldn't have pending
>  	 * messages. But if there happen to be any, we'd probably want them to be
> -- 
> 2.43.0
> 
