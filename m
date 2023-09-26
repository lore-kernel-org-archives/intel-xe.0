Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B130E7F144
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1C710E44D;
	Tue, 26 Sep 2023 23:10:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174D210E44B;
 Tue, 26 Sep 2023 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695769836; x=1727305836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UNg9RXzWSoOqdeJeNUQ9qZyWbBLzYOUfEc9jY/Nm+Ho=;
 b=g1OORGNOXqUAITLywd9azWGOz4m6Q0D0tc8LWWnlK/jpaoXdRy0LAkYW
 FCBA1GLSXKeJQXqYQqcuCEM/hmgBYdA8LOde3S3O6WL3kNSlSAxJbUH+K
 /5U/Q7opNEimzDcBW6IuYdBdYLsPpwAm6UMO2w8yCzRhhf7VnQt8xA6VQ
 E+jZYequY0xaAPyoWJG3G4C6XDy1cgCZ93ZkjhOjqdiduJl3v2wlewMnh
 iLOe+ceSFbgUtArJLYA9bvlh5UFoTBWwcFnb0n8CcAmq08LYZu7xJgbFm
 6/iDPdGlI5/NHPZgGBOhGbQkn4T3T//8cZhGcNKPRKyUymTSxaUZFOepG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385540350"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385540350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784125266"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="784125266"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:10:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:10:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:10:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:10:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVQOrWVQpOdsefLArWtelyHsVuBnaEBFhvebNclK0j89tzBh1H3PaHIXzGrjnE75LinTo7YtzfkXNU2PFzHAGj5/QWGkudg+oZKsIb/n1cjnChTPR5EgKfgqb+Jn/sxngSH5/1ljFY9275ZSnbiKW2VdPeY02VO6/BPagpAck7m4SiqZ70o/1B06ppIUWCR4jlpaxKEDEnt19aUi/LObHudgX1EqCCAnFgEOrW0uT2CGkxepLmMglGqoO+1upnMwkSDeweDy5qtYdUNIk+IJscIf645nu6GLOXrBDS7lcI/KOWwz3e12zBg2eHLA3wd2mxOmAJfthz72sog35/l1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRXEBq0Miv3DF1vZWltevUBkSyR8Xj3WnqzRjBXhNA4=;
 b=Pv1Zk2AMRuLS9yP+A7okBXZXFtiHUP8Xvi707OQ7iEIiIetlZ7Go8qDPLTkgeAH1uGz7S7xpFUFVDUSwUMBf53zRIOeS8/z82shLeQjbMEOSu2qkhu3n1Ex8tdhoByAPocv8wGz/RoKiX38/WRH6ZnISrUSGDalGSfQAjr8/DPRTmJ1rKwFvw0ZFDuQcDBV5Ul0XYdAGjjXcFvgBDmgCYaQTBhQcLxK/gu1BzvnXKRhEtyjvmm0quQFqhr6rxqm5s0pq/cWYItpTf7VAZQkUlX0HwDQIeBqvlL7kiJ9PzdXTiiRTmeQU8quVdAFLrwGsnHENI7SxXINP0m4iwfqKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Tue, 26 Sep 2023 23:10:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:10:33 +0000
Date: Tue, 26 Sep 2023 16:10:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926231030.GT2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2f2f52-8e03-4c35-4d96-08dbbee5c916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UF0/lQ+HkoBK/7tXlYl0urd94kzR/nwFFz2bPrUeSRaDQp5CtRZXgdMW9CAsNAAtdaovwq8hEhgCe96CzE5vI4L5dA/17qlMDAvK9aKssHmzgkfm8ju5d8FOBjmTrjYNCqOdQv1TKn4Umf9UPgo7fduMraRivAZJL7CMOByZOK1V782BUgDEg+w+8UtaaC3pyywX9nM5AsEry3a1AHAg42Ty6mWhgqN0ECsh89M2le5GFrWQUk6gf6hjS5leLAo7BJ4Or5jb55+JHnXoWLpcHGJGYdIC/KBQAvvnBDDZGIiGgiOj+E7n+WTi8Qi8aGSbNyA4oYe2GxqlOpJySVz6Rmi3TeCTDZiavWIou04tpugeUVEPvlZF7k1BobNJOHJA9GgkFsPVUBshvdDASRaQWYOtN4U28YNtUtO/Eq3mlbTa/kyuRp3eXuZhq3RtQHGWY2Bkcqz5u/aDAghKwT44DgF0Q1YMD8ZWiEvySpyqQFQ/Mfw5N6/4ZeE79oOCaMV3EgUVbSrPlKlH34dI7Nrgs6+Avar5etNDWhu9Y19WMt638SBreA7ODFQU4UfPUuf/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(41300700001)(5660300002)(38100700002)(450100002)(33656002)(1076003)(2906002)(26005)(82960400001)(6862004)(4326008)(86362001)(8676002)(83380400001)(6512007)(478600001)(8936002)(6486002)(6636002)(316002)(6506007)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GNcJImZXkIBWdWi2Ue2WFWdVU+LGk9hsNi+zZEYKh2tB+/P5DEylN+1mbM3n?=
 =?us-ascii?Q?mV+/+eAgCjcndcHSf1T+Tpa6Ox3f9yMje1js9vFyJIXi6iQZiIXdcaCiykSz?=
 =?us-ascii?Q?YakJhI+XGYoI2IThzpXpxdiS94k0Ub9VNhkZZHH+ExkuHd8oGPeqbIIwO04U?=
 =?us-ascii?Q?1Be5ZvhE4Ir+tKPx2LHjLJHCf5IBz9iOkofNrH5HT+HxNFH9lmb3o0hPUDG7?=
 =?us-ascii?Q?kMBRaMHUo1bH2xmeHnWpkzif5QH3v9R0ipsoRQ+21crKqt9LWqPEBNwuYvU6?=
 =?us-ascii?Q?ajLDo04BesRudnoQYklr2OTYmfhX3ObfkbHhODFiEg8p7INcnpH7yhKTPpgA?=
 =?us-ascii?Q?V9RCDzqt2ubmVhoZb6EWGMPoC22Gj0lAOSWzxBWDi1axO+AyF69tSNQP1nEL?=
 =?us-ascii?Q?9x91k2jOEkxt9sLK3JPsHmJcRtFRypKnxMBIHErdrDRKYRjaaSIUusyBY6QA?=
 =?us-ascii?Q?/wCeL+0nMkQgzSeQMn144WuRmA/BDxK1g8QkI4I5c3O1iOciRAJRWT6LdJ71?=
 =?us-ascii?Q?SJrUct6Gh73IvUiihJ2ijzJ5LpaveJJCWL4Qb9AHyaQJmcYLhyOcGFJ05kT+?=
 =?us-ascii?Q?d9ytDRLnZoWxNZuxujEFK3nw1jwiH12/I4wCGPWravholKM+E5sERnGQExI/?=
 =?us-ascii?Q?uU1Hxgtrdd+e1kgY71awwRP5t5f9jBZlZ5GiKqpALjS+yPG0SkET2MsCRhEE?=
 =?us-ascii?Q?Wsux3v6e2ZmjCyPc408MsQTrLagrfrjMmWSIKxH6j32YhLpUPlVfMXRrgtqy?=
 =?us-ascii?Q?i9ZYxsgiZzXQbTi+tZf8/Zj0eFnb2sUIc/b1Je8Y0Alk+A9Fr0GnREMYGEl0?=
 =?us-ascii?Q?8M/6mA6BqXU1mKtbEXOPcv8ykeWuX+snxamT/L05h0/PxH+z1FhMHtcpIQGg?=
 =?us-ascii?Q?baoUP3OE5yACV2JrtAw9FJr8KIync2slLCGFwB3h/AxF6CUM0BFAWGexXEex?=
 =?us-ascii?Q?mKgR6LApfbisXPTs3HxZVM7lbV0F7E9zbrC6D1Hkn3C7GafEQiIP5ubRpDbb?=
 =?us-ascii?Q?lS9Hw2lPCiK2moUryM4XFazDHy0GQizf/4PoyeO6E6X8ATE5eM1MRRq+695Z?=
 =?us-ascii?Q?TEiFaXRWsRDPUtaKept+ZP7G6QkP6Kih14F++rXPSoOsrNX5BidGRloBinqj?=
 =?us-ascii?Q?MNCU6BcOMpXIceFSLPYkt5zMRusJPiqmhxAjYlbSI33sVaQ+sCcMMTdopte2?=
 =?us-ascii?Q?rPX5lD/hmysEBta/IAXOTcrN8aGQon6f4FhWfN2bFjJWTiZhNVUkQu2fnjF5?=
 =?us-ascii?Q?cS+ZDiRZTWWeZvk3MmLAh5pHncNjd+ZNIuH9oA+IUw7u0UgEywSKNHIp3vOs?=
 =?us-ascii?Q?g+Q1D5JYP4xv1lzLOc/mZ8igl1TYuZpYfcE8oyTfu+HrFnJH0z8KqHZUTwX+?=
 =?us-ascii?Q?wjoqwq5JdkBsG/iLYvLlH2zeVQBuhizkVxZ+QIdTORDtiCZ8bYWvkQ4qw9YM?=
 =?us-ascii?Q?2T4GkV0AOwYqPMURzjoktcjsfacIHTbJunXMN5kI73Mb2PqYc+/4u9+JgQK4?=
 =?us-ascii?Q?ICirJiCUppAFjW0YBzwAivNGWUWbIh/LKrVKhU3PoTeDLnmVPTpwCWKNCgFU?=
 =?us-ascii?Q?llkUrOcBs/zkBoSFCl6YmPfOTx0zhG5M1hyMJvap7C2nBMs2gGWMFhZxu9m7?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2f2f52-8e03-4c35-4d96-08dbbee5c916
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:10:33.7717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QA7lklS64Mc92qFxNM4y1F1wuBrv8llL1WCDE02gfdzV9cNsRKKbf9fk5ONUMq8kt4Fl69cEjgBZEGvDtGpRbQsyv1E+DzAg44xpYPxDsk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 13/14] lib/intel_blt: Support xe2 in
 xy-fast-copy command
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

On Fri, Sep 15, 2023 at 06:23:45AM -0700, Lucas De Marchi wrote:
> Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
> having a few differences: 1) different bitrange for mocs (it was
> previously absent in dw07); 2) no dst_memory, src_memory;
> 3) hardcoded dst_type_y and src_type_y to 1.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_blt.c | 76 +++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 55 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 0658d67f4..508c2de46 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1149,16 +1149,27 @@ struct gen12_fast_copy_data {
>  		uint32_t client:			BITRANGE(29, 31);
>  	} dw00;
>  
> -	struct {
> -		uint32_t dst_pitch:			BITRANGE(0, 15);
> -		uint32_t rsvd1:				BITRANGE(16, 23);
> -		uint32_t color_depth:			BITRANGE(24, 26);
> -		uint32_t rsvd0:				BITRANGE(27, 27);
> -		uint32_t dst_memory:			BITRANGE(28, 28);
> -		uint32_t src_memory:			BITRANGE(29, 29);
> -		uint32_t dst_type_y:			BITRANGE(30, 30);
> -		uint32_t src_type_y:			BITRANGE(31, 31);
> -	} dw01;
> +	union {
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 15);
> +			uint32_t rsvd1:				BITRANGE(16, 23);
> +			uint32_t color_depth:			BITRANGE(24, 26);
> +			uint32_t rsvd0:				BITRANGE(27, 27);
> +			uint32_t dst_memory:			BITRANGE(28, 28);
> +			uint32_t src_memory:			BITRANGE(29, 29);
> +			uint32_t dst_type_y:			BITRANGE(30, 30);
> +			uint32_t src_type_y:			BITRANGE(31, 31);
> +		} dw01;
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 15);
> +			uint32_t rsvd1:				BITRANGE(16, 19);
> +			uint32_t dst_mocs:			BITRANGE(20, 23);
> +			uint32_t color_depth:			BITRANGE(24, 26);
> +			uint32_t rsvd0:				BITRANGE(27, 29);
> +			uint32_t dst_type_y_mb1:		BITRANGE(30, 30);
> +			uint32_t src_type_y_mb1:		BITRANGE(31, 31);
> +		} dw01_xe2;
> +	};
>  
>  	struct {
>  		int32_t dst_x1:				BITRANGE(0, 15);
> @@ -1183,10 +1194,18 @@ struct gen12_fast_copy_data {
>  		int32_t src_y1:				BITRANGE(16, 31);
>  	} dw06;
>  
> -	struct {
> -		uint32_t src_pitch:			BITRANGE(0, 15);
> -		uint32_t rsvd0:				BITRANGE(16, 31);
> -	} dw07;
> +	union {
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 15);
> +			uint32_t rsvd0:				BITRANGE(16, 31);
> +		} dw07;
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 15);
> +			uint32_t rsvd0:				BITRANGE(16, 19);
> +			uint32_t src_mocs:			BITRANGE(20, 23);
> +			uint32_t rsvd1:				BITRANGE(24, 31);
> +		} dw07_xe2;
> +	};
>  
>  	struct {
>  		uint32_t src_address_lo;
> @@ -1285,11 +1304,13 @@ uint64_t emit_blt_fast_copy(int fd,
>  			    uint64_t bb_pos,
>  			    bool emit_bbe)
>  {
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	struct gen12_fast_copy_data data = {};
>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t *bb;
>  
> +

Unintended whitespace change?

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

with some kind of comment explaining the "mb1" (or whatever you change
it to) as suggested elsewhere on the thread.


Matt

>  	alignment = get_default_alignment(fd, blt->driver);
>  
>  	data.dw00.client = 0x2;
> @@ -1298,12 +1319,20 @@ uint64_t emit_blt_fast_copy(int fd,
>  	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
>  	data.dw00.length = 8;
>  
> -	data.dw01.dst_pitch = blt->dst.pitch;
> -	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
> -	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
> -	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
> -	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
> -	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data.dw01_xe2.dst_pitch = blt->dst.pitch;
> +		data.dw01_xe2.dst_mocs = blt->dst.mocs;
> +		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
> +		data.dw01_xe2.dst_type_y_mb1 = 1;
> +		data.dw01_xe2.src_type_y_mb1 = 1;
> +	} else {
> +		data.dw01.dst_pitch = blt->dst.pitch;
> +		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
> +		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
> +		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
> +		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
> +		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
> +	}
>  
>  	data.dw02.dst_x1 = blt->dst.x1;
>  	data.dw02.dst_y1 = blt->dst.y1;
> @@ -1323,7 +1352,12 @@ uint64_t emit_blt_fast_copy(int fd,
>  	data.dw06.src_x1 = blt->src.x1;
>  	data.dw06.src_y1 = blt->src.y1;
>  
> -	data.dw07.src_pitch = blt->src.pitch;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data.dw07_xe2.src_pitch = blt->src.pitch;
> +		data.dw07_xe2.src_mocs = blt->src.mocs;
> +	} else {
> +		data.dw07.src_pitch = blt->src.pitch;
> +	}
>  
>  	data.dw08.src_address_lo = src_offset;
>  	data.dw09.src_address_hi = src_offset >> 32;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
