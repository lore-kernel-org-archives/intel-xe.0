Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA5CD379F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 19:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31E10E67B;
	Fri, 15 Sep 2023 19:59:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DB810E678;
 Fri, 15 Sep 2023 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694807992; x=1726343992;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IXETeS6hCM9Vamy+zjIgZKB9tTv/jZ6zy977xyQmHz8=;
 b=LlTIRphKu5axKRNgKUKa3wArZ+84o4an/WhXe8gWhmGOGB0RhC3EiO5Y
 Our2HrYVoqVYxESeExDxPaI3miTamtUDfnhxp8AZjCvgsBmDgSifu0iJO
 19zgxuc6I+6/9blqNA/n1OGcoeaEhxOv1DfSn5p2IPl8Qarh1Za3hW8vp
 oAhVvFRRblgZoA/LtLBLES1rp7J9Tso3OYNRR/a2dQfB8T/omt4cf7cXr
 uY5IEhG6o4ZYY2pH6Ays4pmZTtwKkZVMWOSF+xP279YN5RzkJ7gjJ1djW
 r484EWt8mkr06nlZY3MebI/rxbL+LXNOGltn5se6oIIrDX1SP0L8ZyULB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364382134"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="364382134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="738442913"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="738442913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 12:59:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 12:59:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 12:59:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 12:59:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 12:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcaHgCdrw5EKB8JXA1AgiDQq/Io3zCDR0EsB2AMjSdX8cJQSrT0rHz4/VT2SX5KRR1sUJPcXzB5jI/8VhO+MxGLLa73a3awhysMq+dneRy5W+xf/ZO1seByrJs5BCTqeDfc24HjEXPUYQZJ+VC8WYa60Vn6UaZtsRKNcfPLE2ypmxteAazhQNJAguTxw5k8SOLiQdQ0ONMlZBkROb7SjVAl8aRmRwl8LZPOY4slCLl0FdtGAq4k+abAM0GGvROKvHfF2e7pY9rb5ZXZvHzTrATvw5bYTOojyOxH7s7Ejb9dopAAiTosYceZ0ygxjSZyy15Z5XOgdaiTWfe3P92dgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8vQC4GNhpvTzcUiTi2zPJXyKJ37e2fRyC1jSf8LpBM=;
 b=EiG0qXE31dApIm3mYgptvr6f1umUMeiLJh4qTljkvD26eIAERmEIJUo0KDQJfwLQtYxzLqB17kA21x/5hbH5A0I85IUdXrcvT3H+D5HDaxKTe70tsSRMI/ijNSD9CnNbKoHICTSIYWqk2Rwgok2c0ER16uBJkthrVL8HJM+tDE7zVdjgLPOO9r7ibF1+VuLWUFJptl+nX+JzPruSih+JLGwsKeBDmpgilI3u5pw4MosmZjwu0wNtjBHjqUmh2jgVBEqDykO+1KDtpDudGflb27r0fODV8fu37iNyYgQP2q1zieqx3Dy45a1c4+FHAWEHNtsRq4JvhSbmjfCbmqsnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.40; Fri, 15 Sep 2023 19:59:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 19:59:48 +0000
Date: Fri, 15 Sep 2023 12:59:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915195945.GH2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1259c46f-6772-4250-3c58-08dbb62650c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5Ppx3ZguHPHuTFkJhFHt7YbIulg/ektcmPUQGSO9YVRD8Wjfdg/FihcOUvXIzjdo9LTGH5S6utPW1h0TgWLqHz+3wtSjwU0nSoKItCQ831D/1QIE0yTJ75RPDyeP3e4HdbFPGJul6ok5H6PsmQhj8KlFgw9JB1wbK+EbiOfT0ClHC3LPox5hLeEtiSx+CPW65pMiZwT/RuJgXBwgkSwz0doLvzL+5XrYP6iD6MVjgmVokcbK46/XVPyyJgYEnb5PK/J8grhnpkIZWXSfdgZ9vFPHWM57fKWCaBVUcJTXoRSJwkzb/rq3Mwdb45ZUFkFqkBKsZt0XJgzHQRcvT7Q2eTKECAzcP6i9qI/4THqjvelVYCISzpj2ARK3FhCiFOYEln+kzPBSx2UimdwRvKo1i7/zlBlWwEKSwLkROyTRp3qmgEoyhDocTOnmEMLiHqEz8ZCGPtNqhkAivQQQFwLN2wLe2dlA03gyurGgrveh9CAEdp4BBJU9BGHhsvfpkgrPjuoD/nJ5IyX0mF0A7lLVBmXVmh4Qn+ktaIOmPNWDzaTh8eLWylpMB9D1UyBtGoT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(186009)(1800799009)(451199024)(6666004)(6506007)(66946007)(316002)(26005)(6512007)(1076003)(6486002)(41300700001)(6636002)(2906002)(450100002)(8676002)(6862004)(478600001)(66556008)(4326008)(5660300002)(66476007)(8936002)(33656002)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jzeVrTm5MQR3Yy3Da4/ZVlYxAKgvYW0UyH1QSOm8FuZatJv/P7AIUgTCgr2?=
 =?us-ascii?Q?J63K4i8sXF4kF7NDOpeWuTYUk50HLnyeYzBrp1y8MJW6WgAG9J0KIZWH2dQq?=
 =?us-ascii?Q?ydMjZA/j9kFJqLn1E1X4ozJRjAYcQtb5CKElZ/g3vk+ONDcGBVfkIgM6tU+Q?=
 =?us-ascii?Q?9Dm194nGMVYdFkOvm6AX0WMaAS1NxHCX7rWIxFmoTyJEi9AP42zeExn689k2?=
 =?us-ascii?Q?vIS7onJJyPGru42RNPCdHCNatJbTPlX6iPOLYiQ/WPC+oqwMgoK2OKxXaQU6?=
 =?us-ascii?Q?Wyjn0Nh3NI7f49NxtIX03qAY09+hYjpZR/l/1lKrYCARYpB/NfP3E+ZqY52p?=
 =?us-ascii?Q?iFqEXkQlu/8Fv77qPPBhzdwV8GwZ2DxhSQtp7RCC5evp8WMJ9/RzKLAiBSmf?=
 =?us-ascii?Q?DfLEe4UdyZgPod3L4P0hS35PdXvTIaMc5/JpdvhB72QcfsvKs47WoMkr7cSW?=
 =?us-ascii?Q?LJpequ737f+tJqYEeeUHNlzPvZkaaw/wuUzRdnvJWH371gxZcSgsPuuz5f50?=
 =?us-ascii?Q?ptZ9/bGeO9+RBq5OC3CIkd2RjFROEdrIkBcfXgSf8QQoN7yERaqY6024Z7wI?=
 =?us-ascii?Q?WbH237c4qHKXJEZK3thD0AOlvRRIGZBLtNGzn4gn+FWpca7qe2Hz8oN84Jmp?=
 =?us-ascii?Q?CMUgRDiYhfps6b9M9R5dYYkpBB4GW4Wv4ZKsFRAPs5a8eLxVFMbu+at3SiBA?=
 =?us-ascii?Q?uS+z9EFKZN9RpLynS6JsvIFV3wDeCsTFf9IKf6ddZnA1L57/RdKLzYrkUz+F?=
 =?us-ascii?Q?c3dDVU/MQs9f5fBgr4gE7+NeqBtjhN5CjVTzFcgJCOkjn2xvcFxe2YjT9U2u?=
 =?us-ascii?Q?reuyLIGYo4RL8LPHarOH3LJ7wC718a2ZiOp+BpZrma1VW1i6DCbOsyt6zSu+?=
 =?us-ascii?Q?5M5T8soRFrgIFDs4+HL96atwbE+Sa3fQAX/r+Ce+S1zEiKoGsR8PUQmeh37q?=
 =?us-ascii?Q?4SrgtMZkADXcYqAsiR4XBFwTNcQHQyuUJatwhW0+SrRC3TERBKtPfNbqlttg?=
 =?us-ascii?Q?IU4p1cy7Iwk+f02GvyJ6arw7CvW2YXUHTT4G2rDzbJJTyYyOH8HafB0LRspO?=
 =?us-ascii?Q?gg0hS+v4N9uJv96SsBDCd2zSzviKrgIKIMzd4hf9Bzhn7FUYVwo5ozgUjSYu?=
 =?us-ascii?Q?uoatnhvTQYmuzo9e3Li8ROQbSi9BQXMN3jxwVA5JrnF+7D1qj1nThQiX+N8B?=
 =?us-ascii?Q?/Vzd5OWC5llwER1Bv4p9Iae0gAghRpztxefrLqEmvyYYLRKFT/U6cPVSYeX8?=
 =?us-ascii?Q?D/vs1em9gh0tTHiQtcoYz7JWSHBmZqgVxSG4pP1D/GqWpIrxD/jmI+Qd7MEQ?=
 =?us-ascii?Q?eewmiwI/saVlWDjs5hw7EAmZT2WFUvJwFltgTPtVWQHmx7y97nHaDrxdP7ob?=
 =?us-ascii?Q?NIFdwpbQ7tHoRLSo1DQuYuZod69isiKnsP+DYdqdFaWfbZ/GPiXDFl5TIgLl?=
 =?us-ascii?Q?EFfLx6xvX0sWis718KdzwCNiTLZ8EyJUwIDi41A4AHn0b1jz0Xg8Zr76Qbf5?=
 =?us-ascii?Q?BDMYiTny6MJ8IeUNqYPMJPj6S2YOirLeXgK0DXPgNRR0jDK8OdUrVTkf1d6L?=
 =?us-ascii?Q?LFV9RQFznB1wrHbGgerASFQxdeb5F+z9x4UCfIU14rkc90zeq9MQrKPyb4tV?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1259c46f-6772-4250-3c58-08dbb62650c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 19:59:48.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IJw4U4d0WIInKY+ZjXug/wSG3tDWfPspHTY59Jw14H1tviw1JQyihFb+OVUqDxWLTjPnV4VYYeWQuY9w5qnyhgt+so/9i+rEjUsLZLAW9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 04/14] lib/gpu_cmds: Fork a
 gen9_fill_surface_state()
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

On Fri, Sep 15, 2023 at 06:23:36AM -0700, Lucas De Marchi wrote:
> Commit 02c2cf17628b ("lib/[gpu_cmds|intel_bufops]: Enable surface state
> mocs setting.") added support for setting the mocs field in the surface
> state. However it's not until gen9 that MOCS uses a table, programmed by
> the kernel, and only has an index set in the surface state. Previously
> it was the specific caching behavior.
> 
> As such, it makes no sense to set this field to `I915_MOCS_PTE << 1`: it
> will only add garbage to the batch buffer. Solve this by forking a
> separate function for gen9 and above, keeping the old behavior for
> previous platforms.
> 
> Bspec: 12483, 12239, 12236
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 0fd8f8213..83d2302f9 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -136,6 +136,58 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>  	struct gen8_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> +
> +	if (is_dst) {
> +		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> +	} else {
> +		write_domain = 0;
> +		read_domain = I915_GEM_DOMAIN_SAMPLER;
> +	}
> +
> +	intel_bb_ptr_align(ibb, 64);
> +	offset = intel_bb_offset(ibb);
> +	ss = intel_bb_ptr(ibb);
> +	intel_bb_ptr_add(ibb, 64);
> +
> +	ss->ss0.surface_type = SURFACE_2D;
> +	ss->ss0.surface_format = format;
> +	ss->ss0.render_cache_read_write = 1;
> +	ss->ss0.vertical_alignment = 1; /* align 4 */
> +	ss->ss0.horizontal_alignment = 1; /* align 4 */
> +
> +	if (buf->tiling == I915_TILING_X)
> +		ss->ss0.tiled_mode = 2;
> +	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
> +		ss->ss0.tiled_mode = 3;
> +
> +	address = intel_bb_offset_reloc(ibb, buf->handle,
> +					read_domain, write_domain,
> +					offset + 4 * 8, buf->addr.offset);
> +
> +	ss->ss8.base_addr = (uint32_t) address;
> +	ss->ss9.base_addr_hi = address >> 32;
> +
> +	ss->ss2.height = intel_buf_height(buf) - 1;
> +	ss->ss2.width  = intel_buf_width(buf) - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
> +
> +	ss->ss7.shader_chanel_select_r = 4;
> +	ss->ss7.shader_chanel_select_g = 5;
> +	ss->ss7.shader_chanel_select_b = 6;
> +	ss->ss7.shader_chanel_select_a = 7;
> +
> +	return offset;
> +}
> +
> +static uint32_t
> +gen9_fill_surface_state(struct intel_bb *ibb,
> +			struct intel_buf *buf,
> +			uint32_t format,
> +			int is_dst)
> +{
> +	struct gen8_surface_state *ss;
> +	uint32_t write_domain, read_domain, offset;
> +	uint64_t address;
>  	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
> @@ -273,6 +325,9 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>  		binding_table[0] = xehp_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> +	else if (intel_graphics_ver(devid) >= IP_VER(9, 0))
> +		binding_table[0] = gen9_fill_surface_state(ibb, buf,
> +							   SURFACEFORMAT_R8_UNORM, 1);
>  	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
>  		binding_table[0] = gen8_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
