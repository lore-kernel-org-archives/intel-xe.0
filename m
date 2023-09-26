Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0181E7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338F10E44B;
	Tue, 26 Sep 2023 22:53:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2A010E44A;
 Tue, 26 Sep 2023 22:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768808; x=1727304808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wdYu2wjosPidiw7ltzGxs234l0gtvdpO9c0A9x6zDI0=;
 b=I+JD+Zvo55ngSOnZX5wHhfMSzmTP+/OzgZHTsSQQFGAq70SlfU0B4Shb
 ZKLmYlzNhVIbC/3igqaaoHZzj7WbvM8NdHvdnSeSNEB1ud6GrWcp2TGOJ
 2v+GoWmVJG6BwXeG9acMRFu8nuzRXYazTwynEXo8E2gE8z9ogoKyOwlqp
 wiaQm/cmQCPzilYsEeb3aYa8YnjLXvzynEreaLo3I/O4jP0HOnmzF6qjX
 OaFkMsJIsP4LTPmIHwyzBPKze2aYLfjXA2i8ddRM7G5XEVewnYky9KMhb
 2wIpcy436h4uB06WjdbhRQFoO2CicT6LjLZKLqpqkqiFpfE5kZB0e/Y8E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448177385"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="448177385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="317089"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:53:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:53:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:53:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OscxgIlVMgro4e1qPkxodMB39f5vd05Mdq0Jh8IulPBw7dcMyztwbPutFO5ZLfqdA00x1vbvqOe3/L3M6U1rjPAixHXIY3PEqmcxKwASyScc8RFaAd+4wt5tpXAGzFLZIIsBxze6UNBvG3SJdAYgmHiqUePeuuYDQawX8LY7RlRsFF+rDsvQMAEe26vGW1GBML9poNOcGnZP+PzpyOLHxN0mNaGiLxLqh9IFyh1hqJxFHVfkSqfAoC7SYVk8PDkivxQHQ0LgcvJmeHRtd9iSJiGqQx7c0vzGtFZJ0VeugX70do/jIiEUn5/Qm2In3aW6zBbhFUMUjjJCo6dgSAWZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlfHpxKJCqA++HRfu/psCEE9rhjoyNpYcUq69Kx6DT0=;
 b=PBSbtQrJYLbEmqR0uiVRq0jXoEDsns/9Cy1lvKDPBhkmG/bLdCSv7B/VqVDGJ27w7p92kNEO+L442bChDFta+cTiVIBzwX7zTCZu6L7ya5ZtNuTdU6hIU44K1HgP8kF6HjU2dzY7sMyikMXTIJbS45vtO2hYawpDm2UVV5f9/8Lsg67AkK/V2vof0fiLU+1fW1EDnn2xOMNXdQruPDEzDYw3eqaoySblwOuP7iRVMKjuIb9eSGgwO7GXA8qxAvFRn6in/U1J4JVh0UqpSG+4ySq0eKWGC/+IARVnT/EV93eFurDdRGZ+hefGsSvfeAqWjTNNqaZH/aUmkw+jCUQTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Tue, 26 Sep
 2023 22:53:24 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:53:24 +0000
Date: Tue, 26 Sep 2023 15:53:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926225320.GS2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1ee29e-355c-4b5b-4b58-08dbbee36352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4IZ2U7XIkv1czkiRVAl3l18u/ywC02J44J2YmhtxZZePb8Ib8bOeFk5jPqHgZvwb4buDrmjPnRWP6gWHuhitfno4yWfnu2jWtLurNMF1TWUoEgrQNk5eIKm6NVDkXjaVtIbE8YbrOEr8SCWcE9piBcqLoWJNBDk0M8qA2q1625Bz5z/bsyY8xINYyZ1QO7AP0nOAwUbXxJoUOyxVnqJP1bWzrWuFfUQbDDYnRHqMEoVcuBAH0cy/nwBaWrDN9R2sJ/cTfKANtU7LSfFYtqy2bSR1fywzk0C1MD5nWdWPocRsPqMMHpT58A7BXkOx3OdIk1CVYzf40x+AV8p19dTbhkBdGq9s7QeuHex4hZ2nZuindj3b1+t6z3pKkiMWKpT7W0P2jEHFTSL7hkxhm1a1QP5pmYPt30fU09x9I0ebnlliEVdwG2RlN3wDG55qxmtgCVX24KciKPT6VwseQx/XsIm+Nh+c35KCyNxyjPfJBRKkO+T9gk5Ses4I6x/JEwBfLDJFdMDUe6tS/6lQ8FMKs+io2S1A4HfCxnnQbf7ksCJtLzmeJe9kH3cKs7rZrmR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(33656002)(86362001)(8936002)(6486002)(8676002)(2906002)(38100700002)(82960400001)(4326008)(6512007)(41300700001)(26005)(66556008)(83380400001)(5660300002)(1076003)(6862004)(6506007)(66476007)(6636002)(66946007)(450100002)(478600001)(316002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jpOzpX27hY3F9VILE9kBa8GGjwUohRz20Csb+8yj6I42MpynWQURrYu9OfAf?=
 =?us-ascii?Q?9oOE+ll1JiP9oeILg9/O7ZEXPtWvoOowDK+ZYmjrkB7KFIc/gkLOEohmtQat?=
 =?us-ascii?Q?Te95brFYE2b9gAvrRIaS+q1Ol0QUHDv1jBe+2gb+L+fbryya2i6L7cDe3oo+?=
 =?us-ascii?Q?nONVE9g+Xa+Xd2TzZp9mieX291HAadQC1nWkGrbaF6lhUfFXa+ra51MVB9DU?=
 =?us-ascii?Q?Z/zne9kdOPH4EkHwLpQBXOojiv4d9Iv0324aXmOZXhYY3QeG/lIY7HwVCGbt?=
 =?us-ascii?Q?oc8ae7JVTHXPY2JA6Vwd9HaD1Y8QI/hal/h7epWZoWcFZAceYKR7xt/cTpou?=
 =?us-ascii?Q?L4271jH3QB9QeIgbZ9qzAuKFoz0P7Qos1TR/isw3JeEvnIJ9TdgO7IBkgGQ1?=
 =?us-ascii?Q?bUG1gsHbxNwWu/zn0Kx7GtLsTxOZ2bxD2rdoOKe7Skj+ovLihCSa80szY0Nd?=
 =?us-ascii?Q?6xvve94G5UbzQOhd6tNVBORLVzXxo5SElY2b0tpk4EG6+mHLD2Ah470mDB7q?=
 =?us-ascii?Q?KFko0IdNFfXtpGnbMhoj1ZloT+BL2KJlb+xBTMWRy3q1dYmPyD/Gpiv4FgyI?=
 =?us-ascii?Q?3WzMiy5JsqNxBRZSesh5OdLDhbUBemTccGlFG/0yr6zZg1LmNXAtF3DYdwGI?=
 =?us-ascii?Q?doeaaq9qI06HZs5dPesz6Ub/YIMKSlJgtxE/2HhMHtVmwiiw4LGcEpcuX4cG?=
 =?us-ascii?Q?R33LhhbmLBjq8Eieqom9w0zDQziBNvt8nSdGkez4kGyfZ1bBZow+46Buxbva?=
 =?us-ascii?Q?LSnVSY5hiTtCr+9D/A0QRaMsQVBaHU0+EIGdlNJLTrlVB4ihqeJ1ROUrYFCJ?=
 =?us-ascii?Q?+WgvhFOLNT9I0YFnlFuRa5owNqwKCUtftxgdldYkqZ95p9n6FOazEj/HI1wy?=
 =?us-ascii?Q?NUCp/A9Wft3cnY/bfqlH04agWMNROczdTzO8TGa7v/xdf1wWuxO4+ik/meQZ?=
 =?us-ascii?Q?GSlS5YteR05pIrsRncNkyuzxev+nWRnifF7Y47rBin3EYnRehEYHzufNOOGZ?=
 =?us-ascii?Q?gRqRqkAHpfgKweOCS+aW5AiU/laUswe6vY1mvGiH0EuG9nsYykiGSww/58Aj?=
 =?us-ascii?Q?zHk8H0cm4rg4VsN5u/896N6j2EF8o3ZsS1tdnPh/oeSkB6BSF2UtT9TteBdp?=
 =?us-ascii?Q?ZCE1khgssjMDR44vwACfNTYsTNahtsjCm1B+gABfzI/zS+qtl+nUhe5Akppj?=
 =?us-ascii?Q?dl2zm4Lc+S1CYg/TVe33iBAqUbcwDxRbfjKZp6k49jzkym8SNC+gVX24ae1c?=
 =?us-ascii?Q?NiKwC71Iw6I4smtObbZlkvNRAfNGxFM0k+oYc38JmBl8lUW5YR1Ao8RJrbDV?=
 =?us-ascii?Q?sXyOCndjJYueKzM9FcCrhWi8K5u3VwB5dhPYm/TNCtZYiCZM3ciLDhbNRSm8?=
 =?us-ascii?Q?NEytokj5QD+p9uNuAkO8fduZQfXVAQ7Or6/nWLWvfSO5aVSnI5lJgrVrr3RA?=
 =?us-ascii?Q?TjdUj6gW1CSdVb8053gNOL1SQQkw9VNDwvs3tdeO29j0VWyALekfCyQOXY/j?=
 =?us-ascii?Q?Q7aCz648oH6NfPKTDIAfEWKaASjHXOkTKDGMvBDWdRAktvsK4AORCvjVVnaX?=
 =?us-ascii?Q?bdv/5RD6VjTsPc/QoPqEEEm7dTreDMC129Tz087TDkdnTLuLu02J/5D0gklP?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1ee29e-355c-4b5b-4b58-08dbbee36352
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:53:23.7927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pjMPYAlg+g1FMLiZ9Wzr3h1mr8+8wfswllQvKXNkz1U/7Pk3Ultna1LaqZGx9axZxaW3ZskUTUGHLGmfGmgOOvKiCW2PX7qL+dYj3qoNKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 12/14] lib/intel_blt: Support Xe2 in
 xy-block-copy command
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:44AM -0700, Lucas De Marchi wrote:
> Xe2 block-copy command is slightly different, with dw01 and dw02
> having a few differences: 1) different bitrange for mocs; 2) no
> ctrl_surface_type, aux_mode or compression.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

As noted on an earlier patch, maybe we should consider renaming the
fields "{src,dst}_mocs_index."  We're touching all the lines where those
show up, so it wouldn't really be extra churn if done here.

Up to you.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_blt.c | 107 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 69 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 9f8e3dea3..0658d67f4 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -55,15 +55,24 @@ struct gen12_block_copy_data {
>  		uint32_t client:			BITRANGE(29, 31);
>  	} dw00;
>  
> -	struct {
> -		uint32_t dst_pitch:			BITRANGE(0, 17);
> -		uint32_t dst_aux_mode:			BITRANGE(18, 20);
> -		uint32_t pad:				BITRANGE(21, 21);
> -		uint32_t dst_mocs:			BITRANGE(22, 27);
> -		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
> -		uint32_t dst_compression:		BITRANGE(29, 29);
> -		uint32_t dst_tiling:			BITRANGE(30, 31);
> -	} dw01;
> +	union {
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 17);
> +			uint32_t dst_aux_mode:			BITRANGE(18, 20);
> +			uint32_t pad:				BITRANGE(21, 21);
> +			uint32_t dst_mocs:			BITRANGE(22, 27);
> +			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
> +			uint32_t dst_compression:		BITRANGE(29, 29);
> +			uint32_t dst_tiling:			BITRANGE(30, 31);
> +		} dw01;
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 17);
> +			uint32_t pad0:				BITRANGE(18, 23);
> +			uint32_t dst_mocs:			BITRANGE(24, 27);
> +			uint32_t pad1:				BITRANGE(28, 29);
> +			uint32_t dst_tiling:			BITRANGE(30, 31);
> +		} dw01_xe2;
> +	};
>  
>  	struct {
>  		int32_t dst_x1:				BITRANGE(0, 15);
> @@ -96,15 +105,24 @@ struct gen12_block_copy_data {
>  		int32_t src_y1:				BITRANGE(16, 31);
>  	} dw07;
>  
> -	struct {
> -		uint32_t src_pitch:			BITRANGE(0, 17);
> -		uint32_t src_aux_mode:			BITRANGE(18, 20);
> -		uint32_t pad:				BITRANGE(21, 21);
> -		uint32_t src_mocs:			BITRANGE(22, 27);
> -		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
> -		uint32_t src_compression:		BITRANGE(29, 29);
> -		uint32_t src_tiling:			BITRANGE(30, 31);
> -	} dw08;
> +	union {
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 17);
> +			uint32_t src_aux_mode:			BITRANGE(18, 20);
> +			uint32_t pad:				BITRANGE(21, 21);
> +			uint32_t src_mocs:			BITRANGE(22, 27);
> +			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
> +			uint32_t src_compression:		BITRANGE(29, 29);
> +			uint32_t src_tiling:			BITRANGE(30, 31);
> +		} dw08;
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 17);
> +			uint32_t pad0:				BITRANGE(18, 23);
> +			uint32_t src_mocs:			BITRANGE(24, 27);
> +			uint32_t pad1:				BITRANGE(28, 29);
> +			uint32_t src_tiling:			BITRANGE(30, 31);
> +		} dw08_xe2;
> +	};
>  
>  	struct {
>  		uint32_t src_address_lo;
> @@ -521,7 +539,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
>  static void fill_data(struct gen12_block_copy_data *data,
>  		      const struct blt_copy_data *blt,
>  		      uint64_t src_offset, uint64_t dst_offset,
> -		      bool extended_command)
> +		      bool extended_command, unsigned int ip_ver)
>  {
>  	data->dw00.client = 0x2;
>  	data->dw00.opcode = 0x41;
> @@ -529,18 +547,24 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw00.special_mode = __special_mode(blt);
>  	data->dw00.length = extended_command ? 20 : 10;
>  
> -	if (__special_mode(blt) == SM_FULL_RESOLVE)
> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> -	else
> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
> -	data->dw01.dst_pitch = blt->dst.pitch - 1;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
> +		data->dw01_xe2.dst_mocs = blt->dst.mocs;
> +		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
> +	} else {
> +		if (__special_mode(blt) == SM_FULL_RESOLVE)
> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> +		else
> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
> +		data->dw01.dst_pitch = blt->dst.pitch - 1;
>  
> -	data->dw01.dst_mocs = blt->dst.mocs;
> -	data->dw01.dst_compression = blt->dst.compression;
> -	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
> +		data->dw01.dst_mocs = blt->dst.mocs;
> +		data->dw01.dst_compression = blt->dst.compression;
> +		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
>  
> -	if (blt->dst.compression)
> -		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
> +		if (blt->dst.compression)
> +			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
> +	}
>  
>  	data->dw02.dst_x1 = blt->dst.x1;
>  	data->dw02.dst_y1 = blt->dst.y1;
> @@ -558,14 +582,20 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw07.src_x1 = blt->src.x1;
>  	data->dw07.src_y1 = blt->src.y1;
>  
> -	data->dw08.src_pitch = blt->src.pitch - 1;
> -	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> -	data->dw08.src_mocs = blt->src.mocs;
> -	data->dw08.src_compression = blt->src.compression;
> -	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
> -
> -	if (blt->src.compression)
> -		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
> +		data->dw08_xe2.src_mocs = blt->src.mocs;
> +		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
> +	} else {
> +		data->dw08.src_pitch = blt->src.pitch - 1;
> +		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> +		data->dw08.src_mocs = blt->src.mocs;
> +		data->dw08.src_compression = blt->src.compression;
> +		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
> +
> +		if (blt->src.compression)
> +			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
> +	}
>  
>  	data->dw09.src_address_lo = src_offset;
>  	data->dw10.src_address_hi = src_offset >> 32;
> @@ -770,6 +800,7 @@ uint64_t emit_blt_block_copy(int fd,
>  			     uint64_t bb_pos,
>  			     bool emit_bbe)
>  {
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	struct gen12_block_copy_data data = {};
>  	struct gen12_block_copy_data_ext dext = {};
>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
> @@ -786,7 +817,7 @@ uint64_t emit_blt_block_copy(int fd,
>  		     + blt->dst.plane_offset;
>  	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>  
> -	fill_data(&data, blt, src_offset, dst_offset, ext);
> +	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
>  
>  	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
