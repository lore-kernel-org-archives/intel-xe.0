Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D027EE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 08:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D143610E1B1;
	Tue, 22 Aug 2023 08:31:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624F10E1B1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692693079; x=1724229079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CHNZLx8ZtPmE6SUcDECcqvKbWGJxQ0QbRGqlc2uyZOc=;
 b=YY7uGCKKCqBkdm3rcv08LnbWQrYAbbu4A03mlo5BW8nrrt3jv54xBEe4
 kDLeFLmkmkW0+QCgHBTvK6pOy6gqJbNlCnVTwaE35IMEiPIzRxibSMIc0
 IgSwSQrzWhWEVv7YHKU60k2dobx8w2Vro8irSyL75izxsqTZBB+zXnGxJ
 57vMm/YqYMBBRphj0wVDE5Ys6AiXOFSPkNF+OjcGggefBpB/BkCdbnxXF
 cYGHvwnX42jXZs+K6LLBzhiG0iMtFeR1PfCmMaWsOQXJ/Zp07oL332LSX
 UhIrRTvqYsqRo8qUWycKjKm01u1dwJrImSjdKTtkbNo3uXLTZmbAgm/oI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376554231"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="376554231"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 01:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739227491"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="739227491"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 01:31:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 01:31:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 01:31:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 01:31:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 01:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPYpmEeBQ9n0a2TfQQUMT4iInpPK09wENkCMQKBQucRUTZArCM5RrIH73OCf1+Dlf8N8Njfed+Ul7BUbQ+09SX3eajMp5Rvh8cOiM3E7ZeL1dGuhw5XBmYjfggexY84UpSNzYguROehbmkuV1HG7E7tlBwctGH+feWzMCFQB0HO4r3a7ufM/cs5hsQbBPP/DL086Ci9maNfPdlJu5WjGCF1yfUiMqZPv21dh6FBoaRs8Jjwjf1IX0Mpm6aHj+dMk1+4rvLtpzpf1BiCg93zea0dHPO02tFIA1QUa++uGsez7mjAQQNve+F77hYCeDyTrKJ5c5vF70lLyw6EKlRGHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAYncuRoFPyA2Qe3MTCotrxB0kq3ekT0DObh6q37Fwk=;
 b=XuVp4U5DghJcZGTkTGJ5Z7f8XEUBuWt0ajecf6SGP8UuaZUAvXMfLRgxqsyiZsy2rMpAC7V19mfqAARk0vhn9BF3aptxrtE3MUmudc6cDoFPpRY8PTo1IP6WabBiIwE8YlwyU2K+u86YmtYqTrREoiAAs1lStfVJh/ECxDCPJtmM5lZRNqWAIcLDrcaMXfNDudiP+RRNgkXLyG60pgsmECytnoZjVQHukMV21K+10kjXJfaWk3JVNk3QyWh5Z1OA6AGz72SxCwMK9Nm0UtJMWI6V2E1WPCSYhbyrh8MWu9NsSG5OLEWlLvG8jxrTTsOnQEHGGzcW6bscnA29l4x23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:31:13 +0000
Received: from IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::e3c6:ac94:5f4a:a4be]) by IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::e3c6:ac94:5f4a:a4be%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 08:31:13 +0000
Date: Tue, 22 Aug 2023 10:31:06 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZORySgimMKjigx3E@fdugast-desk.home>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808013159.38811-2-ashutosh.dixit@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7838:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc07ad4-7a42-4662-f3cf-08dba2ea24ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWJmYHJCDjiR4n4iB1B3Q8HwHoHqLxYDhhr/VBph3pUhigeZKaUn4eVoDv9F7fKKeGvqTp0WLYFtBowIrcw1xc3vdDsu49dMyCrl30O1CcHdMSWATgmI0fcbBGkxi5Vq/fXbvnD7jfD7u/ZA1Eu0nK/il57ZDINFTyuFCFRK7eDaopBJZU6VNcPj8uMSHj7l5dzjt6uUe/TFT52ljFzPXDSbZxeHi1i3KXjY0WFfNM9cQnbiduPzw1MthxX88G3MYJfPudvD8flkgA06TKPqKW20KDZ+sDIykUu3ey0mk1vjMffFHQx/TpZM+sTA7yNIXxFdDPCzwEe53QvcEf7cuIo16kCRJULernikpOXfXs8TdMZ8BUtpHp2DiWv0i+L87emuQn7+XlAfG31GRbrcOicSMa0wNDc5cexggO6Axa4fGYYl+Dx4r4ICtahvExOQPbcAZu0+Al67150lgESBO0uY7/KU8NZTnBdhCo4MaohXVNQp/AxoedBwB0Peq1fYXvYvVKghMpEWVjjg4o5ISt5LMoW4fmW/G4mGfVn2IyFhG2wwplp4HBqzFO4Znmif
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7838.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(6636002)(66556008)(66476007)(6512007)(316002)(9686003)(82960400001)(8676002)(8936002)(6862004)(4326008)(41300700001)(36756003)(478600001)(6666004)(66946007)(36916002)(38100700002)(6506007)(6486002)(83380400001)(30864003)(2906002)(44832011)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BXFJYye+ncT1DjH1YPSQ++nl3OflaECr4tL0+NhAx7GjCeJP7XMsP6+P49An?=
 =?us-ascii?Q?Qp3hN760w9nJ5kp1stFUitUhnmoyHe/t1DdOEqRwVoiUWHoKj0CLBfRoB9mO?=
 =?us-ascii?Q?INbTBaKZnaSFR+Fcqo0OSI/kdwQ+bAkXS03DgzXlYNn4sTdfSrMOwsQFK3Rc?=
 =?us-ascii?Q?+b4U5P7fGtJXuwR+Jjno995h3YMUH7L+TlS/TI0/g2LEM6zSE4H9rd0HCw5U?=
 =?us-ascii?Q?9Pe9I7GW3dzAJ+V5E3RzgCXxlylTeGxkAZxxx0cdUtFZ5rZ8ysHi1X+csXJo?=
 =?us-ascii?Q?iQXkLOUWP+F2wyrX5uwQ2Ya10xvAXrjNbbra1ioXPSRcvUcro47W8FziO2xh?=
 =?us-ascii?Q?C0a7/g0zcX1Hff7P5EHbciOYNlANU5P6BYIetJFmDIZkr7L8RqKKuSM61Whr?=
 =?us-ascii?Q?UVOssJMYkO+mc/yrYodFD/ToQaW3vKJPoG4zWIqlQVQ7GuKs+W8Rnyz4ezNd?=
 =?us-ascii?Q?E+TehzEYGYsQ5R8xJzANbGCxgTOuznEbGZoSLILGzbmvt+Zf2w0nVqPuTXqn?=
 =?us-ascii?Q?K/rjzeg7Bh2i1rp5oN+D+28sqI6Pzq1gE8o5s8FdIjd/HqL/5N5hC+d08e0M?=
 =?us-ascii?Q?HeieTXJH4NyCIwWD9msWoLKw+yT6nBeqtMJd6RhX0T+vDT0LiBTbt08Pgl1/?=
 =?us-ascii?Q?iZiuYq+acTV1JTvO/5k/3xn9n3UfPe5GZsg+6bnX7rp2qmg0wdRAIioXYNUV?=
 =?us-ascii?Q?/GNeRiBRXysu2+qfwDomcIaFyCB5SiPJkOpByEhuYyODdLsXZ/dsQASPuUUd?=
 =?us-ascii?Q?btUPpb+1gr88kaEuQbG/Dre1+NxKmH2XfnZ1MvB0S5i9HdafpuUtjcWEuyq0?=
 =?us-ascii?Q?/PokS1tUTqSLYuuSU/exkhiTJ/TW2adSk7IdrBIRsgvL8OeGhVsne8cTivvU?=
 =?us-ascii?Q?BZhE9/O5WY/fdgVw4rN8icJnRpFYGcAaSN0kMcejCjuoPYlPYVhPFMhOeTJQ?=
 =?us-ascii?Q?RAVJotT0Aw2jJ+sxNdlV7qAM+s8X+I+CKvOn5Sq29UrOIQyRk7pjynvmV5Uc?=
 =?us-ascii?Q?hXl7Pd1g31Y1O7CBlgwgq60Lf4CaKid8r6VMDFH8I6pLKbx9JuynyBWATLsT?=
 =?us-ascii?Q?y4hMBHT0z+uJOfPZLLS9JaTw/advjZRCF9nWMTUtBftsOg7V7kA/XhjiNnFd?=
 =?us-ascii?Q?wwJPJt0tNOwUL4rbkQygnbNUJTcEUWaAwNgM0RfYbtsGP9WbRCmR2Y1FFV1d?=
 =?us-ascii?Q?NexCHH3KgLtgoS5K3Uwym3+KbpqW6kpMxj3PibjGOqZF8Vf6cB7lHBxcYKTC?=
 =?us-ascii?Q?Zp4HT8z8wwIrriHzkKIzUatuNyN1qLaNcLUOMMrb1PG57e2+pNW8ZIxIy3tT?=
 =?us-ascii?Q?IHPpfPOzX9klAVAvzmkN5sLq2wk/oeLSZje1rRzVprlJouruH9PPu/xFNRzl?=
 =?us-ascii?Q?bg9C/zdiTnYuFWDLLyy6JxF7e2QL1+dm7QnI6YdGG6k2TMMZhu1aWTIQxzL5?=
 =?us-ascii?Q?769mNKgR56qk6nzr7z3/GuM1hrsgSjDd+0Y0/wIhqGFpd6fG39RS8hoQibss?=
 =?us-ascii?Q?zMqeKrWTN6O4hPKZHDP5drZ3sWhis2miidtmSg2WDd9K/D6RKAV293WNdR4N?=
 =?us-ascii?Q?d8l187BhQP3CS1kxCo1m7SEe0RkMxc2Nnbyf8q0UQ+362/3LNMNEx0AgjG0e?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc07ad4-7a42-4662-f3cf-08dba2ea24ab
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:31:12.6836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeAE/6dAYquX0wHip3LthlFPJ/CD+2sG7L7W2tJVHOQcNlKZkmTgmxc5cF33ywJRX+lke12y0lVAddxutZFDJhFq+TtXrEfA+IEOKz+MY8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

Hi Ashutosh,

On Mon, Aug 07, 2023 at 06:31:50PM -0700, Ashutosh Dixit wrote:
> OA uapi allows userspace to:
> * Read streams of performance counters written by hardware
> * Configure (and reconfigure) which sets of perf counters are captured as
>   part of OA streams
> * Configure other properties (such as format and periodicity) of such
>   captures.
> * Query associated parameters such as OA unit timestamp freq, oa_unit_id's
>   for hw engines and OA ioctl version

Please document the uapi structures, not only their members. Also it would
be nice to explicit somewhere what OA stands for, maybe in the commit
message as well.

Francois

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 257 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 256 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9ccc..b4ab07c285245 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -111,6 +111,9 @@ struct xe_user_extension {
>  #define DRM_XE_WAIT_USER_FENCE		0x0b
>  #define DRM_XE_VM_MADVISE		0x0c
>  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
> +#define DRM_XE_OA_OPEN			0x36
> +#define DRM_XE_OA_ADD_CONFIG		0x37
> +#define DRM_XE_OA_REMOVE_CONFIG		0x38
>  
>  /* Must be kept compact -- no holes */
>  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -127,6 +130,9 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> +#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
> +#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
> +#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
>  
>  /**
>   * enum drm_xe_memory_class - Supported memory classes.
> @@ -261,7 +267,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> +#define XE_QUERY_OA_IOCTL_VERSION		7
> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> @@ -298,6 +305,7 @@ struct drm_xe_query_gts {
>  		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>  		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
>  		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> +		__u64 oa_timestamp_freq;
>  		__u64 reserved[8];
>  	} gts[];
>  };
> @@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
>  
>  	__u16 engine_instance;
>  	__u16 gt_id;
> +	__u16 oa_unit_id;
>  };
>  
>  struct drm_xe_exec_queue_create {
> @@ -1056,6 +1065,252 @@ struct drm_xe_vm_madvise {
>  	__u64 reserved[2];
>  };
>  
> +enum drm_xe_oa_format {
> +	XE_OA_FORMAT_C4_B8 = 7,
> +
> +	/* Gen8+ */
> +	XE_OA_FORMAT_A12,
> +	XE_OA_FORMAT_A12_B8_C8,
> +	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
> +
> +	/* DG2 */
> +	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
> +	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
> +
> +	/* MTL OAM */
> +	XE_OAM_FORMAT_MPEC8u64_B8_C8,
> +	XE_OAM_FORMAT_MPEC8u32_B8_C8,
> +
> +	XE_OA_FORMAT_MAX	    /* non-ABI */
> +};
> +
> +enum drm_xe_oa_property_id {
> +	/**
> +	 * Open the stream for a specific exec queue id (as used with
> +	 * drm_xe_exec). A stream opened for a specific exec queue id this
> +	 * way won't typically require root privileges.
> +	 */
> +	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
> +
> +	/**
> +	 * A value of 1 requests the inclusion of raw OA unit reports as
> +	 * part of stream samples.
> +	 */
> +	DRM_XE_OA_PROP_SAMPLE_OA,
> +
> +	/**
> +	 * The value specifies which set of OA unit metrics should be
> +	 * configured, defining the contents of any OA unit reports.
> +	 */
> +	DRM_XE_OA_PROP_OA_METRICS_SET,
> +
> +	/**
> +	 * The value specifies the size and layout of OA unit reports.
> +	 */
> +	DRM_XE_OA_PROP_OA_FORMAT,
> +
> +	/**
> +	 * Specifying this property implicitly requests periodic OA unit
> +	 * sampling and (at least on Haswell) the sampling frequency is derived
> +	 * from this exponent as follows:
> +	 *
> +	 *   80ns * 2^(period_exponent + 1)
> +	 */
> +	DRM_XE_OA_PROP_OA_EXPONENT,
> +
> +	/**
> +	 * Specifying this property is only valid when specify a context to
> +	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
> +	 * will hold preemption of the particular engine we want to gather
> +	 * performance data about.
> +	 */
> +	DRM_XE_OA_PROP_HOLD_PREEMPTION,
> +
> +	/**
> +	 * Specifying this pins all contexts to the specified SSEU power
> +	 * configuration for the duration of the recording.
> +	 *
> +	 * This parameter's value is a pointer to a struct
> +	 * drm_xe_gem_context_param_sseu (TBD).
> +	 */
> +	DRM_XE_OA_PROP_GLOBAL_SSEU,
> +
> +	/**
> +	 * This optional parameter specifies the timer interval in nanoseconds
> +	 * at which the xe driver will check the OA buffer for available data.
> +	 * Minimum allowed value is 100 microseconds. A default value is used by
> +	 * the driver if this parameter is not specified. Note that larger timer
> +	 * values will reduce cpu consumption during OA perf captures. However,
> +	 * excessively large values would potentially result in OA buffer
> +	 * overwrites as captures reach end of the OA buffer.
> +	 */
> +	DRM_XE_OA_PROP_POLL_OA_PERIOD,
> +
> +	/**
> +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
> +	 * identified by class:instance of any engine mapped to it.
> +	 *
> +	 * This parameter specifies the engine class and must be passed along
> +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
> +	 */
> +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
> +
> +	/**
> +	 * This parameter specifies the engine instance and must be passed along
> +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
> +	 */
> +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
> +
> +	DRM_XE_OA_PROP_MAX /* non-ABI */
> +};
> +
> +struct drm_xe_oa_open_param {
> +	__u32 flags;
> +#define XE_OA_FLAG_FD_CLOEXEC	BIT(0)
> +#define XE_OA_FLAG_FD_NONBLOCK	BIT(1)
> +#define XE_OA_FLAG_DISABLED	BIT(2)
> +
> +	/** The number of u64 (id, value) pairs */
> +	__u32 num_properties;
> +
> +	/**
> +	 * Pointer to array of u64 (id, value) pairs configuring the stream
> +	 * to open.
> +	 */
> +	__u64 properties_ptr;
> +};
> +
> +/*
> + * Enable data capture for a stream that was either opened in a disabled state
> + * via I915_PERF_FLAG_DISABLED or was later disabled via
> + * I915_PERF_IOCTL_DISABLE.
> + *
> + * It is intended to be cheaper to disable and enable a stream than it may be
> + * to close and re-open a stream with the same configuration.
> + *
> + * It's undefined whether any pending data for the stream will be lost.
> + */
> +#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
> +
> +/*
> + * Disable data capture for a stream.
> + *
> + * It is an error to try and read a stream that is disabled.
> + */
> +#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
> +
> +/*
> + * Change metrics_set captured by a stream.
> + *
> + * If the stream is bound to a specific context, the configuration change
> + * will performed inline with that context such that it takes effect before
> + * the next execbuf submission.
> + *
> + * Returns the previously bound metrics set id, or a negative error code.
> + */
> +#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
> +
> +struct drm_xe_oa_record_header {
> +	__u32 type;
> +	__u16 pad;
> +	__u16 size;
> +};
> +
> +enum drm_xe_oa_record_type {
> +	/**
> +	 * Samples are the work horse record type whose contents are
> +	 * extensible and defined when opening an xe oa stream based on the
> +	 * given properties.
> +	 *
> +	 * Boolean properties following the naming convention
> +	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
> +	 * every sample.
> +	 *
> +	 * The order of these sample properties given by userspace has no
> +	 * affect on the ordering of data within a sample. The order is
> +	 * documented here.
> +	 *
> +	 * struct {
> +	 *     struct drm_xe_oa_record_header header;
> +	 *
> +	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
> +	 * };
> +	 */
> +	DRM_XE_OA_RECORD_SAMPLE = 1,
> +
> +	/**
> +	 * Indicates that one or more OA reports were not written by the
> +	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
> +	 * command collides with periodic sampling - which would be more likely
> +	 * at higher sampling frequencies.
> +	 */
> +	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
> +
> +	/**
> +	 * An error occurred that resulted in all pending OA reports being lost.
> +	 */
> +	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
> +
> +	DRM_XE_OA_RECORD_MAX /* non-ABI */
> +};
> +
> +struct drm_xe_oa_config {
> +	/**
> +	 * @uuid:
> +	 *
> +	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
> +	 */
> +	char uuid[36];
> +
> +	/**
> +	 * @n_mux_regs:
> +	 *
> +	 * Number of mux regs in &mux_regs_ptr.
> +	 */
> +	__u32 n_mux_regs;
> +
> +	/**
> +	 * @n_boolean_regs:
> +	 *
> +	 * Number of boolean regs in &boolean_regs_ptr.
> +	 */
> +	__u32 n_boolean_regs;
> +
> +	/**
> +	 * @n_flex_regs:
> +	 *
> +	 * Number of flex regs in &flex_regs_ptr.
> +	 */
> +	__u32 n_flex_regs;
> +
> +	/**
> +	 * @mux_regs_ptr:
> +	 *
> +	 * Pointer to tuples of u32 values (register address, value) for mux
> +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> +	 * &n_mux_regs).
> +	 */
> +	__u64 mux_regs_ptr;
> +
> +	/**
> +	 * @boolean_regs_ptr:
> +	 *
> +	 * Pointer to tuples of u32 values (register address, value) for mux
> +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> +	 * &n_boolean_regs).
> +	 */
> +	__u64 boolean_regs_ptr;
> +
> +	/**
> +	 * @flex_regs_ptr:
> +	 *
> +	 * Pointer to tuples of u32 values (register address, value) for mux
> +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
> +	 * &n_flex_regs).
> +	 */
> +	__u64 flex_regs_ptr;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.41.0
> 
