Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE1BC4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 23:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CF610E127;
	Fri, 12 Jan 2024 23:12:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F4910EBAE
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705101124; x=1736637124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IflUBbWEuiBcp2gYtcPnozVzKktfu7pzr6YxxeBfVgk=;
 b=NRa5s93V5k/722YXk914wKCsOehwgd+CtbjilmQrlF8xMl+ceXJPg8xC
 YHlBkfeXO+VlEo9AXAzD8Y+QI2GZd0K+s9DML1xoRgwNT3Bxoy6HX2TrH
 gC42AtxHkAS4VtH4qdwANBBhKLfNqESiyh8rFy52tWObZRLruMQX3vLs9
 JYSr/Q8xQuNttPAVoZAhYCl0y+qWYtJ2E7UGJTMwGPIXh53UmUYyuJnAr
 GKfMeI8uFUGyXBIWWrz/QtPatzXnEUYsVebq9ZJc35T7fXuus/ebpEPdu
 p0NL2tnUugKUJGwuNYCvCS+UARxFdYissT3T72w9Py2dwjqoMEZVfpvAT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463589921"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="463589921"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 15:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="25155754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 15:11:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 15:11:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 15:11:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 15:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZRwBtcMDCPVaU3caL5MhBoam35cIGnMgYMGKKwyivRQQmNgrGpAZdWxTZuiWzjQHOmIIjA7Np9+1k8Rs1Llc5sSAZSdsiXACtWS9rycH8PASxFnqj5IuiyGxKRTK/mSLlxu7RT7dX0wIwXrohDrgM70dTBsglj7T+j4yEvBND1oB2QmME0ka/21CWZBAuMP6vCrSGqd966xVvBYCaxx0VsNyA+NUyXjKF5PxZLm66ugVPSvKF6gI3H1oCNaw79Bt4vPlH5LncNo+EjYwwTmbcKp5OF6edGrfJ/PPVmWLugSiodGAAwJmVb9J1hMgQ5VG2GfBvyQ1xI//iRi2yPT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oo/yKBkNVT43IIaOQdVzS/NwIPp2BPeXPxIv1RcHObE=;
 b=dP0GSZpoywJDC/4x9FKxPpUsUArCs2+MDrowd4uxrWOoHSn/A5q+MAKgukcf34gCbbQNk9rr799+PUF+UeXa67fHswMUO4udArGa5AoiVJnNM82kmdfnc+YHHzpaHDNaJUo/vYUx6mXGEIv2ouOuudKNEQozlBvIiUs3XJqz6+PxgCWCXjs/er32YxjizU2phoPNeFTAFU9PMpBQX8qySuLVR4Vd6H1BbIZdgHbh1j3nxiSlIPERYY1XBHonRUVvN2oBBpup1p4zA5BqI3wKz7nXx66ynAWTAkh1QsROjlgTPnKWYgijW9BnCX6svGu2cApgpzNpJ0JX9O9zvB1DRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Fri, 12 Jan
 2024 23:11:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 23:11:41 +0000
Date: Fri, 12 Jan 2024 23:10:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Return CTB HXG response DATA0 if no
 buffer provided
Message-ID: <ZaHG3nGTGam+TTrq@DUT025-TGLU.fm.intel.com>
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112102554.761-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d54446d-3648-422c-cf35-08dc13c3d601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNaKeIj2yZjzyQwkrnF5b9neanI7yksyBq71LOLENBQH1zROPewPiqQa0ZayIpcyQ7BbsUFZU+JvwNIWUd8caY5FkY2x1PHhLzdpE9saHzjrbmHlFgF2Zo8lSSZU9rvDSJp9cg0WD2M+5CwAj2VoS+7+1UiUfqgD/qI9491Ejt1OevFLoQZFb5XC+fpRevUVQkGp4X9odau2LYSzjPB/+PDoZvmxkXqS9KH3Au0Yr16czZn6mVzJwgZQW1JI7XCvoeFVTNNMbZJqsin8a+ev/yDolmqBVX0qfaIdr1EddLz+YHLiWEvqvae/9GkK82aIZB27KGH3Q1FBdengER+2z5QxEQtXsD7N8PcY4B2s1D8B18lqeuGKqNjr3wZkfE+IL1v1dcAaF2JokUFYmjqCfip5oB7IGy3BzjObBi2zHVXoaAYx7JbGhRM9ei2uTClFTXnp+cPoNtAsnFguHcAMLO/auqKUSXzSRE2++MhLNxkxaxj+DwUWCgrtak7VidsfjRUhe49/WqUZbi6GBeEDpbH02gzExoH4TJG936br4AJmUfRQbVrEya10q7/4EkggS3XQwCQcOpkmdOlnYIstb2/puJc/XkFTGyOGknzlz8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(86362001)(38100700002)(26005)(83380400001)(82960400001)(6666004)(6512007)(6506007)(316002)(6636002)(6486002)(66556008)(66946007)(66476007)(2906002)(5660300002)(8676002)(8936002)(44832011)(6862004)(4326008)(478600001)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nixhx/VvEsNKEDjevWHVxCc7YJfrFCC0t7yj3Ur0zvPAeA5rAVlLkCRWkNwu?=
 =?us-ascii?Q?ubOYTy+lw70MzBVXr1OvmK2uMli5HOGed8p77psDHd5uQHFJ274y36XbJYR9?=
 =?us-ascii?Q?b9Du0clYGW+wZJi9qnbT9hswJyqBKnltIrawniUg5vpbaxEsWUvJsDdqS3iz?=
 =?us-ascii?Q?/na02CXGyBaTTW9rD7OOTq6jSquDSVQQcDkZncsmoRMjpnh3Vkzh5HkfS+kL?=
 =?us-ascii?Q?b+XweKRtiERa/jy3LCBknoUBmkTqD8axDNnr85nFCE1YGAVSy87yW5UaQdlN?=
 =?us-ascii?Q?SJ/UM4sS46FdxrKslmzi8hRMOOpnGmHYurbf6QYpruenEAj8Ztnn0hkLWRfv?=
 =?us-ascii?Q?z1ZomRaXQni2IWP9AZgjGhzlGkt1ye7sr1IUiXersxsCCMSRpYVhLbU/5Ekj?=
 =?us-ascii?Q?gqAbJvrhkUYqHlQ91BTF46XXBUAnbDNkINTD7CbTzTUAgEa16G31IAiRnWbB?=
 =?us-ascii?Q?N5pj1jr8/HRyYbbIN9Fvw0xtwf4v4UKb7tMia03X4zLEej24FQ2t+WnQycgt?=
 =?us-ascii?Q?iNUT7y/UAHMu6L2K0ukw4EAEdstagmjUEQtsVG6BvzON1kqGVyNLRFleA0/2?=
 =?us-ascii?Q?91w/MwEvz5KehEUVO9bTctOxN0wB2bxEUVU649wPXmW9DAxEt18jUXBtsKf1?=
 =?us-ascii?Q?ZMHSSwhBkVb6Ozy4OmzsukLXa8JNFo4W5jmNFWz4t0Ib7Nt0yNwy9oChfnDg?=
 =?us-ascii?Q?klyR6UC3G03yOlCl7H9vYjoBLfNEAM7HKiWtP44feOi9Ex3lBckbmh1rCbV6?=
 =?us-ascii?Q?HTdFBGKWt3wXcaU1z+ZN6fA3M/Abg5AaV+DZsgH2H9mamgLed4YTcAeqE7jT?=
 =?us-ascii?Q?bhE/RKUjbUEaQp3jxAmD7dzxOFONzSI24tnYKTWNlHSQiCkoWtIAOmmbTVkm?=
 =?us-ascii?Q?jLUSWq0SW8EFZhsEgZspeA5KDeA9EOJ20N10xg99RSw334iVams8WqqNCrov?=
 =?us-ascii?Q?ZMjfZw2GEglL0CVGF+HyQEd8kTqKysP2NmCZovlF9+5Sk+a8nngRqRLcnsft?=
 =?us-ascii?Q?CQz7onKiuCDukta5zBK6znAXJcoGX5L3aIdoG4rkpAqgd0w6FNeG+YxPFlOi?=
 =?us-ascii?Q?cO2l5qa4GoL352rUjLVokt5m4ievKYMoeTk1ebW4sxhklrgLc17V29jCYc1z?=
 =?us-ascii?Q?K5l0AgvnnCJIF9og/unYThm4SDQdtOXIeZnt+dvsxJDvF4A222Q2awLwv6jF?=
 =?us-ascii?Q?bn5v9eE57Sxl4fgj5qTJS2+e88RvxLWxjPkPijTXl6+RRjA9jN4iAKzYLb7F?=
 =?us-ascii?Q?iMEF40GfGwRZ5S/xeU6n2Ob2d9QdFC1NPNFRq/UD7voYG7IWMoKs95c2Ops3?=
 =?us-ascii?Q?h9Uo/WYdaW/NvPY7evVxo8ebnofNVdftbpHOrV9oGAmF+cB78Khojhql1/z/?=
 =?us-ascii?Q?9pn+xoNAYlCllc6kQDgYGp3Fy99ybMEG33xCwGp7EsaDGaZ38dOChrrQY+jX?=
 =?us-ascii?Q?hyhpZqgTjLZlXDiuvy2nngTqlAjujIMf9PNMRn3O2kVRBZXv2M5mbor4qk+c?=
 =?us-ascii?Q?DfZejwTJLSadoFOj1TjCigKqq4YYuZ8gHDdAEoJjdH/HlVMfJTTcsmrpgZek?=
 =?us-ascii?Q?ae3efYd1M3yFfLuf9jA4nVG/qeIHBe+M3hQWhDdsz/n8klOLZrwm5Hh6acgt?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d54446d-3648-422c-cf35-08dc13c3d601
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:11:41.0918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro24VBPZgCAiMTKE1s6DM2kUFvqIAJWh9m4oBYmb5yGXwfrjUdHiv1TXeAfKJiJ0PhHfOaBErG8sYvHfWzhj8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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

On Fri, Jan 12, 2024 at 11:25:53AM +0100, Michal Wajdeczko wrote:
> Most of the synchronous GuC HXG action responses are defined in
> such a way that only mandatory DATA0 from the HXG header is used
> and only in few cases it is more than MBZ (must be zero).
> 
> For those cases where HXG action returns just DATA0, return that
> value if caller didn't provide buffer for the full response.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b2cc3f993eb6..4ae1a0cd9537 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -33,6 +33,7 @@
>  struct g2h_fence {
>  	u32 *response_buffer;
>  	u32 seqno;
> +	u32 response_data;
>  	u16 response_len;
>  	u16 error;
>  	u16 hint;
> @@ -45,6 +46,7 @@ struct g2h_fence {
>  static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  {
>  	g2h_fence->response_buffer = response_buffer;
> +	g2h_fence->response_data = 0;
>  	g2h_fence->response_len = 0;
>  	g2h_fence->fail = false;
>  	g2h_fence->retry = false;
> @@ -780,7 +782,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		ret = -EIO;
>  	}
>  
> -	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
> +	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
>  }
>  
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -877,6 +879,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	} else if (g2h_fence->response_buffer) {
>  		g2h_fence->response_len = hxg_len;
>  		memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
> +	} else {
> +		g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
>  	}
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> 
> base-commit: 10923212b018be3edb1c21b75f432c6cf3f50c6b
> -- 
> 2.25.1
> 
