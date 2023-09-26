Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB7E7F140
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34610E44B;
	Tue, 26 Sep 2023 22:46:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229A110E386;
 Tue, 26 Sep 2023 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768388; x=1727304388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vMvt0W0izLnzRR7dRDqM79IVKjfgd8me0iJcg8F28Sg=;
 b=S9Vuu1pnBUwEmAum0rgAa+MxlHo7gEcsiirUXRfrFaMo5tRbPWJ2hFhH
 Lc9drE6CAe7ErcjLZp+XtWmM71wZwtdnFdcQcnGlSCFYIkG2JYrBOZ3nC
 uJIMYfbmHuGrO+NZ6S/Es+h0uEpzNiD8HKKWNypyaNmWfUhrsJzu687DQ
 t+rlOFWsYCx6iX4sGttZQoQz+W+Jtw82ODiiXEpDtUSlMzkzh4jfynYOG
 yeQXyVwAj8DWD/J2stiqvxRL+2SOo/sWMrfmofKzxPb7IwKpQ18k5pYk4
 43fUjjFdxUZQE1t91exH1enp/jZK5jpmM7c8Ql5PpLe2fcHV1TDLyABXi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385537074"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385537074"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995946037"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="995946037"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:46:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:46:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:46:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anodANtyd1P+gl79uhLuhhG2L1seZeNhCTV9MlTOoqOcWQD434CFCwBERsfleydol2vXFMFPPelZwpashFrecY4e+7esLEo8nJOlLNikZDcxXLEvsyevZszusxh7e8p+s+UU3iNsFay3NVBnjvb7YyJmpFrvPeMCRZoZvmpbAcVtAoEuYjacvncZGxQV19UWlOauJww85DCcC7+9jWK30UA2kRbPwvbCN7kd9Mamvv7bjZ8gb1bkht15sKp/ClbR0T0rAs9P8eKVZiFqs9NL+g+l/WM7ImwLu/J/DiqwA6YpEIvWAyi2bVdHXP3GMCSsnEhJJvNJTooU1ynQLvPf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qZ1wJFr02KbUvYbXvlhDqnThQTXH1HOenvwYrsCDRY=;
 b=Qb3wUjLzxGLo1lhHeGAYh3Yc6mV9VrVS2Un5dQHlPJI3lyZNVwFSuE0Xp9V2mZQafkCAy0A2Mrw5Tw3Xu3Ze4khQP9OzIb8tzl0I+rPvnbm4+cL4eRyi7pJ7LBEpxfgA+5yWXNYCq/MKnccroEyA6xss0a8s62dlpvDGhrg/jqq56dyAprKxcgI+X1LBSoQ3+q1pEEDNr+E0iqD4G74DuR2YirxuFcS7sOrxi3OcYXA0ygy3TH9WY3dJMtACV1DIdPqZ9ddinh/cwS2x+Mfn+odOyYesLkA65YEDm+7Ay0jjoIzv1YNSqz5KBPpdyBgeMySrl0YrpHVs2Hi/n+Kkzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 22:46:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:46:11 +0000
Date: Tue, 26 Sep 2023 15:46:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224608.GQ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ebd145-d005-4d97-c7bb-08dbbee261cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1w1pxkitonqLxB1Rhlc6B1FPpkr+spxT2J8Tp5DPLBG5PB/5DSb7uy1gRkisuexxdv/KwyVlNXys2cMMQoeB7qUBj+WP4aINBp/1gnDtX04Fj0f0TPxlYklRBT4akqIlPhEsiNYjN8wmPLl6oZHnVfjAgsbksbgP8JDC6mqraSeimO7mw3OG5uoBmNLvnRtNzjU3pQm5m/rs0cxf2LgAj2oOvSPeO6iZu6V2zsVdeK9eqlaufz4EOsdFNXIMpm3Ry4XK+vYJWJdc3I3WRl3dl3VIh6EEfxIAhFxdKF7/S3TLocRDfwmSoO5x1uE7B3coh1E+xfv2m2ohUDVecsQNF3CfgIa7yldVrwblbcOk0r8pp2Jf82mgc9xyhzxACDfo6MgxsFoqDAEzDP9ISbfGwByCcr5B4/W4QkxJJNsLiIZUKY8QefO1L0xCRqLQkNaoTlTzSe1+UUtw6dFKQRQHDAk77B/08jh+nxEAP03t+Goyeii4VF+K250ejvKa6dwdmBqwo6BkYvcjawGYSPkoLHPIBO9uadqHgrkMPA7CDe9ONg2Jc/IFdxd2dZ4fygH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(6666004)(6506007)(6486002)(478600001)(5660300002)(83380400001)(4744005)(316002)(6636002)(33656002)(1076003)(82960400001)(6512007)(66946007)(86362001)(26005)(8936002)(66476007)(2906002)(4326008)(8676002)(66556008)(41300700001)(450100002)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u/Gp7mGQ+LDXJPVsMGXmHKa83MpBkHZeQO0smI0qxspCCm/ik3FLdJZS6wm3?=
 =?us-ascii?Q?fOXSCc9nIONnR2hGSp/ODrT9Cz4R1nVz2i5JuNUa0PT911X7ZnakhKlrrkVn?=
 =?us-ascii?Q?B7nnuYBpQQ6kFoCJ8d8hN8sp9Bn+yvvAGUntPCFoVSigMGBvJ8bCi4ywgcJ9?=
 =?us-ascii?Q?l14ndwJCPmiUiSmFZxKaTl/cqj3VmE2G0x3zekbzxCJGkiQVZ+j3t3RhvxZR?=
 =?us-ascii?Q?/mjNhUXetLXRBuQLMwGlJ9WcUKwAG6XRxMOeY7tq6ozlpJt4+igpvSS1LUln?=
 =?us-ascii?Q?/eE2FmcskQDZiEi4S7xx0VNhe/ugZadoMfAFOAzD7YHo1iW9TktbT20SFQHx?=
 =?us-ascii?Q?dMq9593lZWVI1R9nIpfZd1Q5hZ53/AO/38idJRY4TFganZG5mVNMLwCl2FpS?=
 =?us-ascii?Q?hogRaRGBxu2puih2VdBfv3TnVEhEFtCrbuwWgQoivLCJKhU8heQtlqpIJ2bZ?=
 =?us-ascii?Q?NO+NxEOE7cjePmH51+glRGZkP+BcOXSzOT77Yh045vegQvetEc6mrQpLHla9?=
 =?us-ascii?Q?LAZ4OQ9FNi75uahRGNZxEDDmHoMT3ASh9dFXNbfo7wNT6fUaiNOVc9JZ/cDC?=
 =?us-ascii?Q?A5nYbG3wRqCvOgtGX5AcDaykczdfI5vNU6xWThoznUfj3b7jyVkv7Brb9f/r?=
 =?us-ascii?Q?96purTycIOMnpyfyAMHfMou+58Q93gMnIgzTOguTPxYt2qxDkV9PRlRvt9p4?=
 =?us-ascii?Q?MNiMGiF9+B72wbwmgCHbtZSUgXrgc1NNg8dGR2AX7IabuJEmKhFhdCt9nKH4?=
 =?us-ascii?Q?Wy/r/64ZuO1nZ1Dr2rIW/s4lP7dOs/PSrrr54myFQEU1WyaHDiyS+f/LBVWk?=
 =?us-ascii?Q?2AjcdZYEncKYBeV6JVU15fPFEVo2cdcNoEbZLkXs8kHxShbPvkuWwWwMG200?=
 =?us-ascii?Q?J7vpepTedudl/KsQrPNJqj3GuWWi9Z0hF6lltKAbCF0mxF/fnFyrDRIOAIp3?=
 =?us-ascii?Q?125x1+wmaK/eII60LvnFnLj63KHbtVPpu9I7wlZbzHfPntLq8KAbemK4CArF?=
 =?us-ascii?Q?qy1mftIdW0DmpBfRmvlUCoMmZLAx0T2nkEZb5A8+QqOqxCg3oN6ho7E37zmq?=
 =?us-ascii?Q?XOhKZng6IU+I3wDNtK8Tsiktwbe4c1R+AjlJFeON/kUoczA1b/wip7KVvGM5?=
 =?us-ascii?Q?5H1RvgyxjYMiix7TH2qggzJ+1FG4R4vgyJr+lCUsUX1rWqmkJXXE/wugRQ1X?=
 =?us-ascii?Q?jhQlO3us0H4DHilYD3Ma7G6nX6joC71G1X7AHuEfeAOoB/vKqcTbnR9v/DDW?=
 =?us-ascii?Q?/9d3/s3JNMW4v+qkLYmoKipIqBI7zhej9GsNOyYY5E+UeLLJN8Uqy6FhVSSZ?=
 =?us-ascii?Q?G47EpZP3xt3/uMJiCQVo0lD25e4A8bvMA/AeiWSit1Rl6UECeo+gHZVR3jy5?=
 =?us-ascii?Q?yDkaYEjKjSPlT8wJqFUB+efZ3uHmUXfiUIzpTDoX2HP8Gz53yRoe84VpNbjJ?=
 =?us-ascii?Q?eE+o25mbnPcp1BBDuLIN9lPH0cWnjW/w8luZ5vn6+f4eHOFT6LerLAvKXKNu?=
 =?us-ascii?Q?r/weU4rjd5UC6zAmhOvLxjLidXEp2sEvqlbBnk6i27GEuuChJZBdtZtQtCPZ?=
 =?us-ascii?Q?zJE1hqseeToLnrqMHzILTmBGm9RpcQjmvs0pjaUeT7H0o2jCyG5znsypGzuV?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ebd145-d005-4d97-c7bb-08dbbee261cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:46:11.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI/8fBg2JvE7oJfLuRbqdh0iX37lWny+Vyz6DFx3faxak73kUL98NapbK4GImQnf8UWOE8j9+RnokxiUU9aRI0qVTeMG1Sql8aCJbBWc9P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 10/14] lib/intel_mocs: Remove unused
 lefotver defines
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

On Fri, Sep 15, 2023 at 06:23:42AM -0700, Lucas De Marchi wrote:
> Leftover from previous refactors. Remove since they are unused.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_mocs.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index d9de16932..aafe27692 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -16,8 +16,6 @@
>  #define GEN12_MOCS_WB_IDX			2
>  #define XE2_MOCS_UC_IDX				3
>  #define XE2_MOCS_WB_IDX				1
> -#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> -#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
>  
>  struct drm_intel_mocs_index {
>  	uint8_t uc_index;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
