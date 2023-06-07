Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC2C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 05:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A9510E42A;
	Wed,  7 Jun 2023 05:31:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451410E42A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686115868; x=1717651868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ouZ+WrRBBTqc8hZeTJCIPDot7Ry+/tYKI1sRvhXL5m0=;
 b=gErP6ugsNsZ9nZHTMz/duCVeX6MTOBsT1j4WzaTzD/5c0LSayvOsxPHv
 9cxaMk/nh2xsEp5LVnUI1Ug55IQ4VjkGzYQxovNAqhgFs2IbeLE8YELXK
 DzamtuCuCZZGeuupjleyRd4a3J6JV6uq/YPHRu6GqIjMGkJgCWuFnWCNT
 SDzR+bvsyaT4BxQZhPWeQ+vjT+of54cj1Z12r6OA4pmvGTjtC/dFRhMhm
 CcTSb5tEAM6EqohzVfE5YsMxQ9P1tFurcJTVzOtFe62He0IR0mXsg0myd
 DikqtDEB1bi6wvbJGSP9GMqNi8vQzQkXBX9a3zGjozsSffUvHI7Xu5OQH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354382218"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="354382218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712457503"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="712457503"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2023 22:31:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:31:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:31:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:31:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSoxyB45Qy5PjDgAFoDI96RrKuwYlchBGjHK9hemOyb7/vU8gKLg3zj1rhtwS0hfZ6081oF9GeCGasFUaCocLBBSkDdvjyCvQ5w4w8BVKGnK7Ihji+8oqvrezAfkflYmoHTIYKvR23SjSpsYcrMqo39wy6gtLNzTaC9oXtzX8OlbulZT08lx2UfQj93zgz4L3xiPgK3PARY6HGqd7yt7UNO4LjI1aOx7BKoXWbSfAOH+aF6dOcwPu6YZibJ1OgV/Ly5jMZGf1ohMhKZLRDKzvscE2ioZ6AJ7gvv+XPxXe9bdrY+jrEqdHsJmHS7TByMgGr3PqeYshY5ddpwqcykklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOflx5zZb7rY+c6jaE6jFFvjCMRcqPjUUeaEtlckxuI=;
 b=XJcpg7pwovWiDtzvQdx3HVZIGElS+Dvz0zbzNrZ0/dxlkSgQKDz5XHBpjgGM6vTbRjap4o+p+6uYRqfoLoSbVR7hJeGXjGDgOcbuO8l6auWUYLlSru1E6V9buGLYuGkNCpZ+z8Nrgt77lPJNw5bLFLQLssjxEOZvEUuaRWATrDiWoUQBjtjAhjU2cK/Ag+5B6zkW3qzQH8aFHeK1Xstq46ESnv5o97vIGGOZvZSNzgf+//jkFIfSz+4dAOzREnxXqXxHq2whj0WnADFgepD6WscXXyu4QvDChPR2JZWFbEg7e9NnTnNI8hZeaArRno3Bcbu91CNfRFO/0RrIvh/nQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 05:30:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:30:59 +0000
Date: Tue, 6 Jun 2023 22:30:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <pqvhpola5yeyifbtogytqql4nrrlj4icaxhtdclydomif5iyz4@nuzfaoc465d3>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531152338.6-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 260bb425-b9ba-462a-5e68-08db67185fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuNles2w24X3/4e8Pujm6/glWMY21YO16ZYUfcmfl8TrK5YUUyAAXj8cTRZBZN1Ou8vrmV3mLCrQgB1tUT+0XQFJRNmZMcTxEPCildqCB5iNb6r3ev+HvlqIFD2Av2Z6WawrExIURQhgn/oFGxhFm8hN42fCOSrrQAJmAKyrYbWWKUqv6l3y8TISAbjOxqapGqT9hI1L9EepVYjXX/FKQHuxkKjC+hJ6rCkC0svgqtpbQeP85EZ1kGs6RavYSFDgDOqHVv6dN+XRoLbvztn4pYWEvAIcs2Vtosfy2Mw5KenkwEnfBLfY2gWtXJg89HKgfcXvnQjGrvv0bOXZByuWyvB1mcobqIQxD4rWlQ6P23WxbKlyRft+0FCurq1xOoYAxmKlahYUjCxhmxEtuarzBAfu178IvygTo52EBVDmpceISHUFPONrcaZjkXNEtrHs8hUnLkLfW46qjUxQMsMGe/MxeRavioera8FCNmuy3mdN2r3PN7ydUiYHA2VF9WvnMkRtC6DCXIwJj4GEy+RWaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(86362001)(83380400001)(966005)(478600001)(82960400001)(6666004)(5660300002)(6862004)(8936002)(8676002)(316002)(66946007)(66476007)(66556008)(4326008)(38100700002)(41300700001)(6636002)(6486002)(2906002)(6506007)(6512007)(26005)(9686003)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYZDL52gtYldyTf9a6QQ7uWA/gFjsearC3OLGXedHfjdlFe9g0HSiDcghC8w?=
 =?us-ascii?Q?5yF0XhwXf0GZSl5ThA6P1pDYGFkCxNby9PUSJBi9KrAVCm3aOSNOR/6hU/7H?=
 =?us-ascii?Q?Vv9v1uJODTIJI6yrYDX2W8OcbocHVrNx0HWt88+kHibgnTx5olNlv9yI9xVQ?=
 =?us-ascii?Q?0I2+0cjCYepq89O1+A/EaSTvKE+KDwjUG5zP4h6ICvq6BD0rKqXwqz9fkuAJ?=
 =?us-ascii?Q?8+z29Kwe/PidRH7MDgsuw3MpCyPPXvPPw26hhQltcz15LGZWK+/vISfvFu7C?=
 =?us-ascii?Q?M+FuAXj8i76akoL2BRXvGpBpeWawBpsL4u/FpKeoeVjaZcpbU4FlIpMk2iMK?=
 =?us-ascii?Q?LDZ/8LKhZVHqzgBiPfU5C9Pi3tA9qNSh/6Ars5XT3axpMj8yce/TkHJcPXvf?=
 =?us-ascii?Q?VByoD/MobDPjKdHivyTDyLKdfdIlE/WaZiBFATztB8IkUGmACSCou8U2a/Zw?=
 =?us-ascii?Q?LlfVx3fzn2TMvyKyaORHZ14NeX5qZ/ZGY6Ahi9xLFH/bKfOPbkf7ko/85JXJ?=
 =?us-ascii?Q?wKGcQiaNd4P3YY/8Xi4MliTpp+qtTmeH3HKtj5O7Z6pIzLCTjbwGKzsDauL7?=
 =?us-ascii?Q?zTr968mCh45J+1OfhtKZAuFJtxuZuhXG1LTwvUwRkaQ/lnOXCbPUx1qo2WfA?=
 =?us-ascii?Q?XM2aqyAfLZQA9tKnwBb29C0EkwDYHzGZQpz/kCgpyhU9wEJya14XbH2qIbh9?=
 =?us-ascii?Q?5oCw/bpDOEULlAPxFe/raapok8MywTYtswSbMDSy6oEicafIFsNS/QfJOpkD?=
 =?us-ascii?Q?nPDNf/GptmH3SwrmymNGa8XyKOThmZH8+rBWBFP9tt0ZGfiOm4KPcuZztwiL?=
 =?us-ascii?Q?WwyXxXvVlj7OlyYdigF3dNVH7TqZAI+b7DPU258sZexbNeP5X987CcBmb4RT?=
 =?us-ascii?Q?EvTsI0gU2ZIxzb2Hcf6L0Q/eAkv6JdkppQ6b01B1PBjkld2w303Fp8+eRPd/?=
 =?us-ascii?Q?qzczgULXj0VZJlkqueYuW9JEkfmHhxBDNQOM1nP7/wRjvpAgObJhza3g+1Xm?=
 =?us-ascii?Q?dYb9ppuM84gtbazZyfgflpYij+mk5F232bh1bPr7ryXHGQqEIp8xbuJizn1o?=
 =?us-ascii?Q?4WsAyGDjKnBjMTzViudAg/covHUIgCHIL5kEeQWg16lQppP06eOmQwcCksAI?=
 =?us-ascii?Q?hs0as1rlS07ia3nJ+gkRSQXSCrUBhWZ+BTcXP4ypasiF9UALGgBFF7egbcpC?=
 =?us-ascii?Q?/YjYsoU66Um7q3ZfjcjndUXhJSL5gbPmbmARQycbhdzzEJG7chaExaj6z+tn?=
 =?us-ascii?Q?YIVQ9565VdzGfC90h9P+noUb4nd/qX2u+ZWfaYL+G7WvUfvCxzoKN4ATvDSj?=
 =?us-ascii?Q?l2M77zdYY3Y0kAcU4qXIxTUBf9SkzbT8MAotC21vQXjGTSij0B2E7VKVlaWM?=
 =?us-ascii?Q?sPD0VCcsgWLX9yPHlfF3NJiLyeyOGzUBQv8ult7Yh4t9NxqEqz+euVtdbuie?=
 =?us-ascii?Q?MSm8WeKczIu9yeQ6ox+NYgccONhwolcvex3oquYyEw2ryAWy9PjtA43q8R5j?=
 =?us-ascii?Q?nPW7cgawFa4/RiDjW76+eoLKW+DxSkeX3So/jNeeVufZBaSRQxxW/Go39mDF?=
 =?us-ascii?Q?kwWzCdsCfxFME14//hliiGa+pAr9Z315U6V/+dZIgVa1Pqb2lOPvbfts0OiD?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 260bb425-b9ba-462a-5e68-08db67185fde
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:30:59.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BS5gtDH42GS6qTqBoTeZ54U/77kOt1lpq37wzdpvmsHGfz35ao6lA2MKy9ZAvFUcd5u8BApe/VOC5J6yGrc7rA0ggr0Uv3h7k+n8LKdLY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/5] drm/xe: Document usage of struct
 drm_xe_device_query
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

On Wed, May 31, 2023 at 03:23:37PM +0000, Francois Dugast wrote:
>Explain how to use struct drm_xe_device_query, in particular the behavior
>for size.

While at it, also add some missing kernel-doc in related structs.

>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> include/uapi/drm/xe_drm.h | 27 +++++++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 2eea80bf0e06..e29399de148c 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -120,7 +120,10 @@ struct xe_user_extension {
> #define XE_MEM_REGION_CLASS_VRAM	1
>
> struct drm_xe_query_mem_usage {
>+	/** @num_params: number of memory regions returned in regions */
> 	__u32 num_regions;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>
> 	struct drm_xe_query_mem_region {
>@@ -136,7 +139,10 @@ struct drm_xe_query_mem_usage {
> };
>
> struct drm_xe_query_config {
>+	/** @num_params: number of parameters returned in info */
> 	__u32 num_params;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>
> #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>@@ -149,11 +155,15 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> #define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
>+	/** @info: array containing the config info below  */
> 	__u64 info[];
> };
>
> struct drm_xe_query_gts {
>+	/** @num_gt: number of GTs returned in gts */
> 	__u32 num_gt;
>+
>+	/** @pad: MBZ */
> 	__u32 pad;
>
> 	/*
>@@ -193,6 +203,23 @@ struct drm_xe_query_topology_mask {
> 	__u8 mask[];
> };
>
>+/**
>+ * struct drm_xe_device_query - main structure to query device information
>+ *
>+ * If size is set to 0, the driver fills it with the required size for the
>+ * requested type of data to query. If size is equal to the required size,
>+ * the queried information is copied into data.
>+ *
>+ * A typical usage from user space is:
>+ * - create a struct drm_xe_device_query with size = 0 and query = one of
>+ *   the types DRM_XE_DEVICE_QUERY_*, for example DRM_XE_DEVICE_QUERY_ENGINES
>+ * - call DRM_IOCTL_XE_DEVICE_QUERY
>+ * - create a pointer to a query struct matching the query type selected
>+ *   previously, for example struct drm_xe_engine_class_instance *
>+ * - allocate memory of the size returned in drm_xe_device_query
>+ * - call DRM_IOCTL_XE_DEVICE_QUERY
>+ * - read the queried information in data

looks ok, but may be better as a code snippet?

Lucas De Marchi

>+ */
> struct drm_xe_device_query {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>-- 
>2.34.1
>
