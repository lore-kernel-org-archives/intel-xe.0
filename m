Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874F6C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 19:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A64310E502;
	Tue,  5 Dec 2023 19:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520210E502
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701805341; x=1733341341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bHS7nEv2Rw+iML6TWspL5Ku8ljMV+K/ZKlMPuPH3Dp8=;
 b=BaMhtlFhnDOS4RK7NMzG/AbVcsMbkc6zB5Bi7OKoxm+Csuy/BpQv/9gU
 I/2WOpMGVJ8Dn4+zzzf3YmusLETt53yXRNBVCGV3+2FodD4E+pmRpMWm0
 dpkTQpwIW05d+M4ffpuoUylvk+rgE32f1cfS+YqENCUww+GUECLjTMAB/
 5ziC3avaElBs8UHkByYeSv7Bk/rZE/FvUmfFaH/w1BRloAMTeiLmF7N2T
 ReI436W795KIcpF6zGVfn2mb5cMt4L+PlukLIW5BuJT5ppzFOhtWebBsB
 ecjaiAOz0zzB/RR2FZnM6GnuRFatKEYsQXYLoSdqCBGXvYZLt5acXi/fN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374134927"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="374134927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805387652"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="805387652"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 11:42:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 11:42:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 11:42:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 11:42:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwKcjHBiW4fbjcF7eu/EnVXPYo5eKQmMD+X3A6K6oWfmBh4PneSuyuRz3k2LXGyO1cUF6mbv+ZXEs8+f/kq3CeutdgdfejgH2RLYj5Jf1zROoyjLYDLxWRTZhNZu1W1XFV4v7seVADi5Pu/CP/Pi6AX1ZWylD4wwPeSRUTRmAgcwdmhrvgN7qIcNzXaIRCshH+46hDFAN1mbyp587HscqLgAXGhFQ1w+IBWgEmqZV+ZMSJf73bUALk606qGMuriSnbsRPb+Dz/g/mJI6LEF0Pwnj7Bw+xPAy83Ky3voD3ySMyd1dMLl8Z1bGHO3u5CqQAoj+WAxvlxZPiBflmC5Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdBYWZoy8TLMzpk9lx0yNEj7tJoF0/VmLKXfhxBlt44=;
 b=Y1uk/RZMVSk3/tSjlzcEjwUkb+vF8RQFkz/G1+/hmRoAlK1weu90xANMrbhoHTHALaraRBeoR5z1aqFpWsJVMFafKT5mq88r+kfHv+IiSEtX0RdJGk4j2d6pTcyweO6/JKsYr9BBycBojI4wE5rxElKY568aNandubLenngnn4kswL/t4zE9FXnsgieWMt6pl2ojahstHl4vddl3vKLrGPJMLDxJBIuEbY10QoskVxiAflQmd5M+gmLRbEWSj/Vo3O7MgEt7pLk44b+4STtaAog2o3NVOuS+FiuseDn599cucMeJcIV4L10HF6HGJnOsOiSwFpY+zl7ByWgxU7rdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Tue, 5 Dec
 2023 19:42:17 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 19:42:17 +0000
Date: Tue, 5 Dec 2023 20:42:11 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZW99Eyr_CI9a6Wud@fdugast-desk.home>
References: <20231205174349.2169863-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205174349.2169863-1-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 68362628-f45f-4510-80eb-08dbf5ca49a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdDvSNZ0gfRPVd0Uho3HjIwdLD6lXBpoET2sGsI+aTNEzAERX0/6O3RM/W6UYG2PLhvDSuwCF4b6XD3y5NrskOntxD94nRufWJMjc2pRZrj+A7rMhrcqdsqTIGsusPLakf4NMaKb+uUSLVJpf0aoTdcx2shJghWD/cML+51Tp6BwQCoKaLXPBJMrK+Wjby7HPoXWpZQbug/tB5vcILUR2Woh2I/jybRHyqZ4+sdEI/oYiz6HhyEOHNwtvDkkFXsh12iz9Rs18p3J8Z+s7sjR1awAssFqmLqxu7qYoMhylXNd6Bih92nSQ0+IriGpo/Bzg2JGJDmgipRFarzGSJQr83UZ580w5Fnha6XJQhF12Q+9RZOV4W57+kFvoX7BTpkZXSIWNKNd37Wqf7IzrDK2LGkNk95rDFHlxMp8dae0mN2zc6p7yn78/z0sl9F+Iuezs53AyrmNbYSmhr4U67N5zhYBgcJ7XDCiFIbNCCRaYMAw2lvZf+VziAILCFXI/POKINyfKdt+7nNjqGRdpS7sD8SIsqp4FxcmzUgMjsM8eG9drXglOA126sQY1zK34mPg2vk5v802s1+/MueQfKWzwgd0XXX59m3HODTLMpIQz+QqNZF+3GD5f+kK5Nh84j+yrnaHrZ08vrFuVmiVQ5lHnzswpsQcyvyImnOZQemVOcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(82960400001)(38100700002)(83380400001)(44832011)(5660300002)(8936002)(6862004)(2906002)(4326008)(86362001)(6512007)(66946007)(36916002)(66556008)(478600001)(6636002)(6486002)(36756003)(8676002)(6506007)(41300700001)(6666004)(9686003)(66476007)(316002)(26005)(107886003)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?weYXmm98ozwbjcyow3X6IBpjxMaFVrJzWIFOCpj0qag6OxKnggTxvaf0zcTN?=
 =?us-ascii?Q?MXx2tKNEnlcmB+LsK/vX/nhA61SZsmMUCdpo+pcHyT0JO0iJa6h5/TS57Nee?=
 =?us-ascii?Q?gryEW58HhFuCkobRd+kXlQX9HVPxfy1bzyLZ09hpr9WlJosZU1YbdctG6ODu?=
 =?us-ascii?Q?AzE0RPLkjuJ+N5ONp0LjTvdgPS+KwsWu/CgEUS0n/lg0TBSHRHDvmwKykJiJ?=
 =?us-ascii?Q?guRj8rLZve3TFM5OHN5vkIGh3jhu+IJ5S60oBqpqzVaUR8P+ipYQ3f4gEZrt?=
 =?us-ascii?Q?8aw8TmCCZkMoI+YiNhO3iVXcQyGCqmoAqIUskFm/xmDIdfF+3Dcjg3jbx1KA?=
 =?us-ascii?Q?H4CFUeVwiWV/TfI2rngrDzErdVAzXZSvdadPEQ+qf91YF3v2cMgw/0L7FRhC?=
 =?us-ascii?Q?1H99cr/3QGVrgiZRcskLnACTzxCPCFgQRpnIEMtVOaMqDbEjZAKdaKkKhQha?=
 =?us-ascii?Q?VQST0m2m+ne28M5OQtm4mbEjrljUsHURZUDkjTUFQPHRfbMiIn0q+BDyZlZP?=
 =?us-ascii?Q?Mrj8277tFZkYpbWSsAaTYhqZumYyIFYIeXtN8X00Ac9fCtWpj9qF/YcAxYJP?=
 =?us-ascii?Q?5/YrK9rJ+LnYI8klfbngHHHWzq36mY3ieSKs06iy1cwA9Vf7H1hiBbXhiSRx?=
 =?us-ascii?Q?q1SsKntfXPzdbBvzx6gwprp/4CAxplKF3rljPdrXtJWZ6T6okCTeQwn/TivW?=
 =?us-ascii?Q?T534SRjOEbVyue538BUVNraDyecxx/FKmSw0lhPgqPeoxfCjwtnR8nDWgaMV?=
 =?us-ascii?Q?JGia1TFZ05d3VDuTcgHpbHP+susiL0ppSd6M6SbeFcFN05aJV//yHvKtjfDk?=
 =?us-ascii?Q?p64ngfcXZukpTUIPUS1MTATr4er7Ics5c9EC6jCxQJiAdXMYF27sG0t3aYeP?=
 =?us-ascii?Q?D6Ah1aWmUXqpIUI7zfms+Ssr7XEpoY1m+0UZyXYUNT1WyAfqmLngUqC5hy6K?=
 =?us-ascii?Q?KhMx4KuIukff/V8UC87DlRbHlflUFR65e3XyjM5B8AmibXca9m/h8SOnrvbN?=
 =?us-ascii?Q?601+iLCI7amXen2/2mrrfay/9OBp4exP8ZYXMS1Kf1wzDNa+EsvrIPShhJZm?=
 =?us-ascii?Q?I6tIMcj2pK9ngFE1TG5KfIiB7UR/3vzQNiPf18CzaJtFM6qTL1qTjDQF7NPT?=
 =?us-ascii?Q?s32fW1wZesXzocXfiENeGFSZNpeqoMM3IqJqfQiN/kWfBv05tTzXTcNvL8Wz?=
 =?us-ascii?Q?z9TMltjZa/Jp68AgEDVZiYSJN94PBbUspMAoClZryFbKxYJi9nQiOySoUJ9+?=
 =?us-ascii?Q?oVsGKCbJqvoo97ttiN4x3eLUy8IiCqOOPvPxaZb++TamsEKt8PmvJ4B5Ub8J?=
 =?us-ascii?Q?oQCqqpE4YITIZKrIksklWmfwu0zx63BoH5Qa0yfJM5M+/IRFuIFZBpirLIbD?=
 =?us-ascii?Q?2ydcI8lZzmnXS4T9Z1jkJE38Dl+w6U1PY4lA1bpvVwFmjFRPhmFQLN2FlCMQ?=
 =?us-ascii?Q?nn8G1E9dyHsSgVamjkwgUvbBFkMvVb9+EIpQpyAc/dzIM7rkYAYipzI3zkCZ?=
 =?us-ascii?Q?J7ch49pkikthU9RMgI2bjaRjaBu5QlcsWNpbNQfM1Hf05ZfSyK3ZZlK64ukB?=
 =?us-ascii?Q?jmaaXVHWoRAgVEIIlUX5i4d+PaS+GjaQmRAWTI5zKDNxl/JtTiAiLnogLk6p?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68362628-f45f-4510-80eb-08dbf5ca49a6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 19:42:17.3901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfxGSqinzPqmpjAiwhC3QgqRZuoB8P4XDmaBq30jAA7hFAWrqjn32ocsScBVJxxXENFQlC8gFBilOPjy75VhFgtGl2c59U5aXEaI+Tp/NZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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

On Tue, Dec 05, 2023 at 09:43:49AM -0800, Lucas De Marchi wrote:
> Fix kerneldoc build, as being warned by CI with the Hooks execution.
> 
> 	$ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/display/*' | \
> 		xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
> 	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'engine_class' not described in 'drm_xe_engine_class_instance'
> 	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'engine_instance' not described in 'drm_xe_engine_class_instance'
> 	include/uapi/drm/xe_drm.h:152: warning: Function parameter or member 'gt_id' not described in 'drm_xe_engine_class_instance'
> 	3 warnings as Errors
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks. FYI kerneldoc series is in preparation to fix a few more things.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index eb03a49c17a1..0895e4d2a981 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -129,7 +129,6 @@ struct xe_user_extension {
>   * It is returned as part of the @drm_xe_engine, but it also is used as
>   * the input of engine selection for both @drm_xe_exec_queue_create and
>   * @drm_xe_query_engine_cycles
> - *
>   */
>  struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_RENDER		0
> @@ -143,9 +142,11 @@ struct drm_xe_engine_class_instance {
>  	 */
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> +	/** @engine_class: engine class id */
>  	__u16 engine_class;
> -
> +	/** @engine_instance: engine instance id */
>  	__u16 engine_instance;
> +	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
>  	/** @pad: MBZ */
>  	__u16 pad;
> -- 
> 2.40.1
> 
