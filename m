Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26EAC48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 11:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D1B10E103;
	Fri,  2 Feb 2024 11:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqO6jLa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB310E0DF
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706874757; x=1738410757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EysHKK9InL69yNcTF3NNWcuRDcZhnIE20feVcePr+3w=;
 b=LqO6jLa0TncC5TBgg4wyvTrV6Ex6BgFTN311UdtGgY7kW8llY7I+SPo8
 3U7IcNzhuS4at+0EtdRtxuUHQFlQSgP//5B7Hy2ynTCROgcLJ6Xq/4NVq
 0ZaLEplk1u0LLPh4BQ+o0KpIC4otOsaYHmwdsOW/I7bqnrwNFqwy7XmKp
 GaFyGbwbXl5SQo3XIWd8E6dGxeV5AIqxn42++N/XBYEelnRyUW1e8sAaz
 5sbsyOtx2T/nAtnUYk2OEHv6SJ4EhpOxfDiGw7OPYTP+NJABEF7PibrFR
 fk3b5hpVfUCWspoNBax3wjAj9mgsiTzH9a+tnr8H2uaVRF2rsBChOhiNC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17672292"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17672292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4811021"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 03:52:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 03:52:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEiOqVXV8fhAyk29tGE1xTuw/zv7LP/zaETQGsUWvHl/8akIUUUWFyMFtT66gNMXtEjnRlCjMXF6E+n8LG2upop4EcoEm3g0/24CmyciLkKnOLERZZr5eG+pgLogp9hC6KW7RvGKPa73ybxtPcfrPwBdcMFVO5gMTswtZNmgPl/94QpmXOwgEQTCykYpB7y/ckR8UlnH8ITWYAsmcTypBKdaK8Rno1z/8PzNIqAktRgpdLD7MMnqFVSInLHAg3qq9aztZv8YSJuqSMojfPvUDpH3ULU9Yyo8wACxnwimgp8v45EQUsSt6XbWmCAplFpNiMryJ37GZ+ajO4bzv1jf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2ztRvx8ghK/KRBVo0XGVlqFOcl05l/54JyJy/mTgQE=;
 b=LE6rOo+Ok6/cJdlu/w8aX9EDt7NqiugZi+j/0EQjlgKJG+pNEL1quJkpo0GMUD2DC8vCafqGEWfyoBa+S6AnaqT6d48GkSiGayhDcNBzlLtr4HLPrFlUkoSx7JXZG9Q9c2o3J5PXGGEdFrKK25+vO0Gjk/6B992QTkQCHNQGrGq+Z010NEwUUNsurnCSGjxYBs+bCrFkpqksFbg/LnvusNPyIUED2czSxTZh5r7ow2txUfV8OMrs0UJBeewL3KHkqzg6FCdCLOKzmtinbTGTPJ/n5b8jPyvrB8hg4MXA8Fuj5AVsx+DsppkegYMO8jtAWlv9BaXjro+kmglC+TBLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 11:52:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::c3f1:7053:cb08:737e%3]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 11:52:23 +0000
Date: Fri, 2 Feb 2024 12:52:18 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, <John.C.Harrison@Intel.com>, "Ashutosh
 Dixit" <ashutosh.dixit@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Avoid crypt message when there's no GuC
 definition
Message-ID: <ZbzXcpK3_tDghRXW@fdugast-desk.home>
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
 <20240201224724.551130-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240201224724.551130-3-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0351.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d73e2a-6235-4418-82e6-08dc23e56b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqiJCYQNB3RYSpgFKiIM+QbOZUAQUHCEKOokAXYetGIb/5uubayqoIxzfZhdWdCjvPssREKWEzmUo3s129YWN77dG6OvuFu2ups8819Gg3WlcxHQEZkqSIrfb/Kh/QfAkwL7lLyKH+3MvEXchul5+VztxPRSdP5PWe+RG3jPP8ZoluRWxRZ5zHNoZaBEBey1e8z95U5uXH2H8bVGtcQthtAmXOPt9PA9FioAYA0h4MHDlCtbYCzil+zVUj49Xp+S2VAmlYPgP4YoqJZEHzemTqNq+i0Bi+RocxLU1V9N78M9IXBMrlQ1dlPZo/B+4EDcLWoDCq6Dxu4UWePwmejDrgfZbQfSzXUfu5IdWnznXoAtaM9FuGkxei730BFMyRG60EgymBtOQzsVof/P4V9xRd0A6Qj6MOOHOF51tKy8pQmqC5nG/gK76rMb3mhf0iARgYh9zYmjUSMz8sDkf59ThnveWU7EPcFTBEuYzrVOqtrcHu1Mk/t5RrTqVpXU+LZiT5GeEt/mh+qd1U5//SZdPWqzuHMfGAZiHmIc9WcTyUsDYz9LOhRmaWbNfvUHrx4t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(2906002)(6862004)(4326008)(8676002)(66556008)(8936002)(5660300002)(66946007)(44832011)(86362001)(15650500001)(54906003)(6636002)(316002)(66476007)(36756003)(6666004)(36916002)(6486002)(38100700002)(82960400001)(9686003)(6512007)(478600001)(6506007)(83380400001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jzdGTMiooEnFvVfm39I3i/kp/3wcVoeDyQ5/9e27w37gm3DSj+dQX5myx4b/?=
 =?us-ascii?Q?khLkmcdjQSIdoF1kcGfHRbS5RLma8ApQZL+5GfStW0ZBSXQCwwMo7IK+6A8z?=
 =?us-ascii?Q?4WbRrnwYR+94gwUuPWzfNMp9nyopNoAmRv4JJYvyA+HgboALyUz2Ga7FoQRO?=
 =?us-ascii?Q?NWAHFD+/2QSVVYm/9BrbFTNp8RCb5aMVxkV1kSwFEwNFARVSwJPykTEdwWY/?=
 =?us-ascii?Q?z3ADPUoqE5JS1RKVlZfNN94xvCNmwuVU/y5xstLqr/PdbMaKb9rObnYgQHFX?=
 =?us-ascii?Q?JxiDKj+xLWZWqJ8O3Zlkqv8gFN28BqU3TB0fuMzrXSOZEGc907JhNDi33XPa?=
 =?us-ascii?Q?Q4BY0LVqIF0gtkubqOIcL4ICbyc0E7D51Hgv5EfqxY0/UQUMBDB+T3xKlKbV?=
 =?us-ascii?Q?r3P1w78t7F5wpQ+mfM3EsG1JuaY2pUtqqRt6K9fdK8ZRUASRr2p90atAWWaY?=
 =?us-ascii?Q?odgzwpqgeuXe9S9GMg8JcdY3KSVHhpwy0vwkg6kS4AE83LvUP/61LKZKcN9B?=
 =?us-ascii?Q?cqv00zfqBbJu/NwViaAVpaCDEUoYilYVxo1yx19Ovfx67Ub6nltHtk/NRs4e?=
 =?us-ascii?Q?qGBqcqMM7lr7tshZtAOb5/KbCJbw8K+Ig+4eElWwhGUyOtMs06W9JtS2elI7?=
 =?us-ascii?Q?704cC9RjfliyQ/X0n1sfb4HUJ3k8To6HhgP9Dpci2ul6NQxApYl7DO0dAsFY?=
 =?us-ascii?Q?ajs2VuQ58/Ahvq+NMUbbJnFuaSGkKiMtEyw8MMVVd7j1G4JjHhVOsEczNKKH?=
 =?us-ascii?Q?+92po3DNx5ZAmV7PylY/gDh0kvkiUtb20Fm+CymoVFbdZzbxSb54v69M3+g2?=
 =?us-ascii?Q?s/Bsfkf5S3zyvxDj72094xuISBizdzYVG+lrEGhv2Jk0cX8AG3b1i/Z4o9rI?=
 =?us-ascii?Q?85y0E/G1bhNWzL+iwgu+Cx8rlsfzV42aWVhew/cHvR8mRMAkiWjVdrzvnwar?=
 =?us-ascii?Q?qMnjL67t1MHz1WsoNToj3C6zNJTlVVKYnOIGKtPkazP9r2+2fki4G7gj9JyL?=
 =?us-ascii?Q?v8wsJnf/xWDfIO3Rz8sXSrH7vrxsUdzZqrejHzjrBrhfSFN2sO2oEvcKLPBi?=
 =?us-ascii?Q?QVd8WyGD7PsNMdwTjN6OmaeUvKnHUq1mmgxOuD8twP0Id0g8D9dDKxMjldDE?=
 =?us-ascii?Q?5Q0Zw7c0W9S0g5Rw+vNS8metOKbvkL0fE9qe82BPs9JbfGlDfDiWEKgjAFFR?=
 =?us-ascii?Q?DMz3WP7lDbrZNJi8y5ZDTzl4mMNIiyPbuRFyWUrPvnNUHH3rE/hqM7NjDRwD?=
 =?us-ascii?Q?NDynucf+F1qX5Ed7AFdkw3nrIQr86p59PCwbfN0uIGUT6iv85+vO7O7eYISm?=
 =?us-ascii?Q?Ky46gGFb9FeaHbqDuyq86fZN+SSebgpVgigbxUblvPV7LjUBZewNe4GzVbJM?=
 =?us-ascii?Q?4kmXJtHXFXGCWhoO7YZqC2Q3RvFsmlE3MhcfU1hI+zvhgfTgXnjKjmHPb80w?=
 =?us-ascii?Q?g/iDsTsHoROVp0BOEai/1ek1hQqomUHS/ao9spsw67nm0LQInuzx4VLCOzno?=
 =?us-ascii?Q?tbGmbZOl9QVJJOAhsgm+HI9qEvtTSklEsmp7+bAXXuf/1VsV+ATykVehFVPe?=
 =?us-ascii?Q?8g4IWPbndVdl0siVNPkK+bXzsvMuOOEnhXYmctsOjR0je222S3AVnH4HoUmz?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d73e2a-6235-4418-82e6-08dc23e56b68
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 11:52:23.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJU50OzXIy+B/OyPjJ2+wsXbGhTh3GrRDbYOSNY1BL/5kNFen2hLk68omB2b1mgpyJ4iRVM+eUBtWfOfBPi5ArFDbOwfqdhGmO3lsOzwiDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Thu, Feb 01, 2024 at 02:47:24PM -0800, Lucas De Marchi wrote:
> If there's no GuC firmware entry in the table and the user didn't pass
> an override path, the error message is very crypt: xe will simply try to

Here ^ and in the title, isn't it s/crypt/cryptic/?

Anyway, LGTM: Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> continue and then fail when submitting the default context:
> 
> 	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
> 	...
> 	xe: probe of 0000:00:02.0 failed with error -22
> 
> Add an explicit error message and bail out:
> 
> 	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
> 	xe 0000:00:02.0: [drm] *ERROR* No GuC firmware defined for platform
> 	xe 0000:00:02.0: [drm] *ERROR* GuC init failed with -2
> 	...
> 	xe: probe of 0000:00:02.0 failed with error -2
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c7541f1a5c0b..742170bc1a9d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -665,8 +665,13 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  			       XE_UC_FIRMWARE_SELECTED :
>  			       XE_UC_FIRMWARE_NOT_SUPPORTED);
>  
> -	if (!xe_uc_fw_is_supported(uc_fw))
> +	if (!xe_uc_fw_is_supported(uc_fw)) {
> +		if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
> +			drm_err(&xe->drm, "No GuC firmware defined for platform\n");
> +			return -ENOENT;
> +		}
>  		return 0;
> +	}
>  
>  	/* an empty path means the firmware is disabled */
>  	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
> -- 
> 2.43.0
> 
