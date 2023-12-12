Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4037BC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8B610E141;
	Tue, 12 Dec 2023 00:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827E210E141
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702341933; x=1733877933;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IJ5n4/wIpO190XWSMtyUP4opbbsYn7UBcTBtprzoThQ=;
 b=aQ92nE1lz1x7SCS0Pbl/GgX5EmrWH1isLK93OgTPDNce+07ZHwjaI8c1
 XEkyxYmr3StJY6AcMrLkxCiWeL2HMnKG+a6iJRbB7WfgjlW3fvX0g+C8g
 tGbYQB6mbhqrPctkobFRBfOdR3P6Mxv/xOXQxyQe/cq9rgHwbh717Ajy+
 Kw3Iz3vYnDw6IyHI5rdIyxt3Xrbbrz7TGjdRY+QY7xerm8A6J9zQwLuMy
 YImo99MJF2W1mh8WJo+KEgIcHqddP9OBFeFPnZeV6KGlrfl5E7U2Ji6XQ
 QQ90kU1jzypjQG/DdDGOcKCrO4Bs0Ymg+zBzmZnJ40G2K8XEGCa74nkh8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374238131"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="374238131"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="773312811"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="773312811"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:45:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:45:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:45:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3qYbh5zD0lMDXwrq/QD9eI+BTN0nMeXZU7K4d7J0iQVCDonRWE9Qj2QE1DMDxd6Hq/0Pr9AvW6I3ZnSTnwXORh+PCY92m4TciEOcyS97Ql8g35YUKT6VohSb1ARjl0GvNZp5Dqe9tzbiXnmNpm4aI61OHSU87R3NpfNXoiLPtCAjBedDuHzeAI1Jdt0XPj/yWDf411cUDB29D9FHcoS4MIM6WSYOxWLCZLQefj1vZFhAtuVf34kP89y2wnbPWB5AKQhqoIRyRwa2CKpiBbbLgPE8x0Tlk9rC0C+BHl0yY1pD5J+GDrs1qp6NiIqjm+g5tm71D+7h5BTJkvFbtaWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv0cmRJsvDnt6ReClmvoK4cPPedLGJD4HSdzY4S1kRw=;
 b=RzuUTehb7klu9mXAxyY2DAf8v16sDA5CFIhEPagb239oI+oeAAlrcUOj4LqEeT30igoJctqeJL5kG1/4wZlPCO3G/pBpy5XVgPUDg0mrlL6bPmxc1yXzuWxne80hvtOOhzgbtVSaCmHwUy4LfiNCoEE4ebTjQxm6qshV36gXfeJeZvJCTOu1y5GHLEb0NIVNX74xFfp097bwP8tlu4UCRUWEwntF5Kx0aV0qxwqPrrwnapaa55JrtmMJ1haQwPI+Dj7GVZtUhGlkesfOcGVdtG8/2wyVLIeXantMNiLAe94j8zCGRZMYd+wO2bXK+Tnlu4RQfFyopKI2Om8VRQCERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:45:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 00:45:29 +0000
Date: Mon, 11 Dec 2023 16:45:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 04/10] drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
Message-ID: <20231212004527.GE1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134356.1645973-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: d038912c-d723-4c5a-acbf-08dbfaaba3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IY1Xf96hvXQRfLHPk/eGneIueB4YocnJVKZQnWEdalr9l63MLWUz3K/bPK1Mu38U8QWce9PXSpqL1gfpHXkai7KWh4AW7Yvj4OamPmd8oNQj+R7MKlhqMs7VZIdzRzbS+eR3SFiAkrVrHi9EnDeXYY4RGFSUnWBIiCBSoJAqNlgpnHdOmYm12aqnJ6RJdhyTX+4kkaFKEAULoJaSlGAjJ7zjWYEqZxerAfdsRFgjY0LaNOYVhgUYHqK0QZNCpOhG0t7nK9X5QxKsj946ZQLe8ukRYcZzO0t6dBHrEKPHIM/U0k27KVIfz8bw8RI0LURkDzR5+jeK+YT/syvham1PKFaP6FC+xytHnxa+7tB+Bw6pUmM4ycgTxh5Bz3vYFKjCjvbAf9HfrBjxWN7+IG6B2F9dhBg3Q8homyb3rLWwNHGCuESUj5PdgXlX03GCQKtZjNuzRiMOw6XzP/sUw+28b8tx2WdxdcO/nBOVsEDRRn3kQ13Uov/xPEB6a0AAMtVfjXV24nB9ewhbXuAojrT9XbS0HlIx/0OBP/DufbBhb89/olppubTA6Jlo2SF4CK4L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66574015)(26005)(83380400001)(6506007)(6512007)(1076003)(5660300002)(6862004)(8676002)(4326008)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(66946007)(6636002)(66556008)(66476007)(38100700002)(33656002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QAgAq2EbMGt11D2mEG9KW4MP2xckuZOyQ/p9BvysLykI/pc3nt2T6uIy3U?=
 =?iso-8859-1?Q?CWr3zXx+68BhbkwakBxbjJwUZlDKn9VKmjbPiOnlc8vMBzLJbk93wK5+h6?=
 =?iso-8859-1?Q?X1LvUhKAYU2V1bA20RAABvOaBf3rOjNg0A1xD5Zlhk6/HpIaSWdKgryTt1?=
 =?iso-8859-1?Q?BZGlDqGuohTBdJsIJ7x4cJEu2o3QzOu/LctNVDtjclzgBSCsO+0rd2SQtR?=
 =?iso-8859-1?Q?vHXCJy7zO7k9ZQ+AvrCQ8ic10Au37MEYy78NYmGf17Z21LUijY+intPYMD?=
 =?iso-8859-1?Q?mkbsurhgPUWZ01Tn16CfYVk8QYRq4Fm6TZhkLBlrPTjHaDJlzSj+jypqK2?=
 =?iso-8859-1?Q?sTfqTDvzM6klTeXPbAvtnmjOn64ccJT+1uyMz0wHv66h8z5VTTxDfDvo/o?=
 =?iso-8859-1?Q?JwbbkhnqFdvtsKGsI4JqhgKciJRqmefOBETbkLGNwCNvqp+DpSaDaNkBYw?=
 =?iso-8859-1?Q?J+eiWrngW6NtYuNDKlAFRBmosYV8iV+DkqyAEk+VS3sYGpUcMCNsdJq8C0?=
 =?iso-8859-1?Q?F9YLpXtissJ1ve7wk7zdzqh8bm9pHoW3JHlQHnesJT9bN6KdQAWicyx4FZ?=
 =?iso-8859-1?Q?jJOD2SQ6ZCGMmKEdXj47uvR2mYOF+Cuhbosu3mUoshRApOTmD9spzIPM9X?=
 =?iso-8859-1?Q?v8k3OYsd+TEumd3W+LjoU+03ItYa9Na/QnSTY0Kfp/sk/eUEplME5ArIil?=
 =?iso-8859-1?Q?sFRbTkkWdwHEyTgTELaGMgU0D00dN2qJRUkHIDJ6yCvwBWDeRLn48892h7?=
 =?iso-8859-1?Q?aiGDD5lx5QsZSL7uKgvArLKo07uPl1RlKkWUtzfLxrg1nfoZ+rRxI/fzJV?=
 =?iso-8859-1?Q?HDywNugQVB2W/fkyD5UnyiLrOlr+fK+Mavg+e82xrSkmMGlv50UAt8GbtM?=
 =?iso-8859-1?Q?xQ//War0PqA+7EduxneEOoepqIxncyUMbKxi9qoKAKPc/FL3YcCpJTqhTi?=
 =?iso-8859-1?Q?dD66GV1L3qGBLNLAvtSmoAP2zhIE+xxPEtuInN0jgDBkGXI8MUQ5TOPWWC?=
 =?iso-8859-1?Q?uZOXH8B6NNe2F/EsktA1+GtQoNwuMHB/HobsO59rQz6JcrsC9HLgOtz8Eh?=
 =?iso-8859-1?Q?goxua2mHMLB+3fdiYdzOgyXv/X9uXmufG3zitPbO6lSpB3eeazBupNqyFK?=
 =?iso-8859-1?Q?dZQn1ZUxGnVAMZS5QzjhTaly6FQEL7ehsTV1fPOLd0HgmsoVTs1CiXGzbf?=
 =?iso-8859-1?Q?UNY/cyRz2fCkmNRW/0We9FRS7mDG1ucpcPK39kY8YysSnzPl2x3zvpw/z/?=
 =?iso-8859-1?Q?ew+IFrO7ihjlD26cI9XZ2v5zK3HjAb2WLz74/XQPv/Y999iGQ3ABppX1DH?=
 =?iso-8859-1?Q?oueraJg4Vz9XFQq8E5vq8OVbPi64UMTFQ5JnKHt6Tc6Cdl1iUj6W2qfnhE?=
 =?iso-8859-1?Q?1TPAcJ9XurdNI3gWDxPa1mW2lgk6HGYWD2qgAuVdrSg8IwSOtuqZVC5+iT?=
 =?iso-8859-1?Q?LyGIXNyIf1QtSuKKrRJcKrdKmnjEgGLtdMr5R8LGvpWJojETjnsZGp3E2V?=
 =?iso-8859-1?Q?vgNl1gk2fXH/s+0rNKTatZOcIwGimBtOJ7K7NS09VXaNuFK8qsu0T8ejil?=
 =?iso-8859-1?Q?6QdQH3YlkdL6ulF9xGcB8ceVxal07+WLPWbCsYr16d9+oPC71VoqKCsh8b?=
 =?iso-8859-1?Q?4U6mh/nzY5br4SneGPQxPlP27dr2mRlgIV0NApvLEGTbar/u+e5EdryA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d038912c-d723-4c5a-acbf-08dbfaaba3c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:45:29.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv015MT5jA6WoCAdEHz0zVsIlg5hrCoJJj4Zue+QnOP7zP+phBNKftltCNrsVixocJlYn0m8DWTgfmNvPugJxepxIrtO+BrXnkW1xMf74O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
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

On Mon, Dec 11, 2023 at 07:13:50PM +0530, Himal Prasad Ghimiray wrote:
> - The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data expects

s/operationg/operating/

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> size in pages of main memory for which CCS data should be copied.
> - The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
> shifted one bit higher in the instruction.
> 
> v2:
>  - Fix the num_pages for ccs size calculation.
>  - Address nits (Thomas)
> 
> v3:
> - Use FIELD_PREP and FIELD_FIT instead of shifts and numbers.(Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  5 ++---
>  drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 1f9c32e694c6..a255946b6f77 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -11,13 +11,12 @@
>  #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
>  #define   SRC_ACCESS_TYPE_SHIFT		21
>  #define   DST_ACCESS_TYPE_SHIFT		20
> -#define   CCS_SIZE_MASK			0x3FF
> -#define   CCS_SIZE_SHIFT		8
> +#define   CCS_SIZE_MASK			GENMASK(17, 8)
> +#define   XE2_CCS_SIZE_MASK		GENMASK(18, 9)
>  #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>  #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
>  #define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)
> -#define   NUM_CCS_BLKS_PER_XFER		1024
>  
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
>  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index be2a92dee52c..cb9f00697115 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -526,21 +526,30 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
> +	u32 num_pages;
> +	u32 ccs_copy_size;
>  	u32 mocs;
>  
> -	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
> -				    NUM_CCS_BYTES_PER_BLOCK);
> -	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
> +	if (GRAPHICS_VERx100(xe) >= 2000) {
> +		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +		xe_gt_assert(gt, FIELD_FIT(XE2_CCS_SIZE_MASK, num_pages - 1));
>  
> -	if (GRAPHICS_VERx100(xe) >= 2000)
> +		ccs_copy_size = REG_FIELD_PREP(XE2_CCS_SIZE_MASK, num_pages - 1);
>  		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
> -	else
> +
> +	} else {
> +		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
> +					    NUM_CCS_BYTES_PER_BLOCK);
> +		xe_gt_assert(gt, FIELD_FIT(CCS_SIZE_MASK, num_ccs_blks - 1));
> +
> +		ccs_copy_size = REG_FIELD_PREP(CCS_SIZE_MASK, num_ccs_blks - 1);
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> +	}
>  
>  	*cs++ = XY_CTRL_SURF_COPY_BLT |
>  		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>  		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
> +		ccs_copy_size;
>  	*cs++ = lower_32_bits(src_ofs);
>  	*cs++ = upper_32_bits(src_ofs) | mocs;
>  	*cs++ = lower_32_bits(dst_ofs);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
