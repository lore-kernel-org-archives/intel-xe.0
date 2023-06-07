Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A3C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 05:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0D10E427;
	Wed,  7 Jun 2023 05:17:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DBA10E427
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 05:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686115056; x=1717651056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=989G3MWlC6M0Mq0w8pxIXkFn5pA8w0l/h4f58gHC8kM=;
 b=WAnF/AxJHkccblMfU7lyHVTErohPWl5mRXNm4+ytN3eFhifT1GYGC2ZU
 TBBQfX0ru4qVIH2h0NfUBcrXrhTVSJUec52g7rg68E5qWfFyxdc+QyjAt
 m+fq8WTiRpE1iZOWCwn3xrhYT+Y5Uj2p+13wx4ydlYbwNW7RKf1rCEEZN
 9zsO+zYGJvlPXTibLOzcXhgn9Su59rmYnfmjBeg+wGWjfqlLN5nB+eDXU
 sf0Ldnh9BB7B6n0/r3GuBhfSkhgkGUfRpT0ngUh3ueqsxm5fsvGzFFbVa
 ogPfGEzu34VMQAJytEXIhF1xKAlfXW0NFagcWWaKGMlZP0mDO2ztOTwRb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336508761"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="336508761"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659796406"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="659796406"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 22:17:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:17:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:17:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:17:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lchmG6yWg30+TfcrNwKoIkxgiWJiMG1FCQjTSxw1DUQbMwSgUY5bmUyAZvdRDF9QrGnkIK2dP0pk7vOwneIBhDjrlrDmCLNTyo/W1i617PQnx3QxgeHCufqAG92so8ByWz2swjAj4/GS7q8qoh8DAPNF+DLhAh/v4VjiaoVr4R6TCjU+bLTz7tZSJC0K7ZKm/tLC/GBBoZ0T8UVhufvZTAHYz/xv4OcNZq5qw4G0PM4IkpmLDOOjclK1sAkXxpESRWgydOMuVXMZ7nQMQBja4zoJEgEIYgzEAWy0Ft3lOjR1HKyFVCfZB9hTJMj9miH9RigaghmPDlTnD2hixyV8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkmemTOsfRheuycv4YndZK6B5J6DjprJ6g51JvXbL+s=;
 b=Cwc9Gd/X1SmahSY0M+k9vo3rQgNWJN2Pi+2DQkqLMxjSnWSIGYksKgkt0AlHgRdK0fuNeBWh0yvogJiPYVxOLAIK4+MIXbYgty614tdfdUSom8PIlvs9e4zNF2gakX9SCxjgwYnoh/b+aQ0I5wdsTnTjFLqth/cARYX+L0VdEOh5yoj0aFkeaZgRUOD7JEKXHnQWfv0I/Fb1YsaClqcqXDF3VjlFAhHbaMQ3jgtpMlUno5RQRrH+JxIVlgW2WLbitY0MqHlqlN8lC/0CxWxbIg+GUwAdQPrc7xRxYl79+T1KlQh8LA8db2KbJUn3dTVbpRrWxjqpDFFcZnTPrnUUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 05:17:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:17:30 +0000
Date: Tue, 6 Jun 2023 22:17:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <t6btiexiprynolkaqlvvfc4uivt5z5zrgamyqg6lqpa6aac5yr@l5uud4i5w4ho>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531152338.6-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d24de1e-104a-45c2-c547-08db67167dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuA09fVeqg/00gK8V87apJTsOim2UgLb09P92xLwBfQIeZ8D67AfODC0umAQWiz76YG8QNLk+BYdD2tD9AmgR+B3GGgbtw69ukeuqPgaDCmNCj0YuWDqgtVHzxJy+dcm5Py3GLYcI7iBUBcW0I2ChvAJnF3LA8c5lhppIkwRRfP8mSqBsVLGMogJ5ZdgoS686uJirKRaXNwMzW9MiADy0LTWVMzSkgsSFFVen6n5ysXttxVhcBdqoNuo8I7t0/acXPFah7Al6UL7/VmpXcjWd05bX3eiLwaco+8QYsHwGBMsxOP6K1Rb3L9huO3U06AJI9CuUIub/FeKGJTqstDuazJESdkLmu9PVE7mpWVHy/HwmODTiwOSe/BtGwsFCviLnnpxv08qEkquGAmBiSeTH9lNt7FMH3hlu8nGl62ajEcQE2GQJgCXpIB/LzbvGB72c0uS3aG03j7mnF38Bvdidh2cqza3XpvguT8sYl8Tyuvn2+eXDQ43ulJ/AWHXAythTl48DCT8eCQuV3yWvo9krA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(33716001)(82960400001)(478600001)(66556008)(6862004)(8936002)(8676002)(5660300002)(86362001)(2906002)(66946007)(66476007)(6636002)(316002)(4326008)(38100700002)(41300700001)(9686003)(6512007)(6506007)(26005)(83380400001)(966005)(6486002)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CxNk6+jRhWumPwjCBUGT7uXBrsEHIzhfqdUgtX+8AKf9YJDY2jcYWBqIeQS1?=
 =?us-ascii?Q?KONbO5t/VuR/LTdqYyhf3RuoJywWgmuLWZVnsbI20k+J8on6/uO6X6d173vz?=
 =?us-ascii?Q?JsQ34tXCBZHtPT9U24tU4/eO0316+z6XqPLHtaZxrYFmrRVXC+KeisAxLR2Q?=
 =?us-ascii?Q?I5M6KxFpe1s6BVYjUJnhZemGN29cr4QAB/ffZFPh8buhYtxpFlIpsFLjQZvK?=
 =?us-ascii?Q?Gg3njraZSp7uTzTvb7zb83BXz+njMgUZnNUAd8XS479AxTUuqp+voXffcCj5?=
 =?us-ascii?Q?TuUvVZGiehCUi4FlJfsuOikkQxgEQeK1w+bfBtQMQx1E64Iu7yIzg6vgoB1D?=
 =?us-ascii?Q?7qa2Eat1jzyw8ahJ108ByqGz3u9G+Q+AFuhX3lRJv/tG5rMlkHhjeDn+Sv56?=
 =?us-ascii?Q?NWam5QaoyYBTiJ0GWMIomn/f1Z2VS+ZDSKXOXijODYcYO8yBacAtrK+LGzTi?=
 =?us-ascii?Q?4oKQxy5hg1Nh4Or+JV/7t7t1qVE4yzMR4j4zqV9zqNkhV3E3PshbfM4Vc2UA?=
 =?us-ascii?Q?hk/eb8yN6LeEk5AmtcInUjXyKMz5Jt9hk/dPOBogXDmHf0U2n5ikKfMFJCel?=
 =?us-ascii?Q?gtjzh1l/668TMDQwtN+d99MvUI89VcMq7/G/frmJVEAFaKMt6NeBdNIABTni?=
 =?us-ascii?Q?243j2KbhnGuoHqDjvmKcYVeIecrbsOnHN+jrT1c2UzdGKIgnh+J7kmm+kKzY?=
 =?us-ascii?Q?5DXaJBxDZes2s6z1YF2BmXbI5Au+MdKuAFkHVE/rDwqfoVptqmvmJqjha4Sn?=
 =?us-ascii?Q?G/O8OhrKnpGr3UcMjRBPhMjXXlgP+JG6/vlOfcLvtGxkAZcIlaTZRIEywAVu?=
 =?us-ascii?Q?0nwBX4+VCzrjOr2jMlI18ZfHetclOYrEy0JOXYa4zoGTgVqWtCmby/sgfo5y?=
 =?us-ascii?Q?xgTq5g7EOZiZXTvnf9IPtzehSMZR/cIkhpuKc+2ekpPnqm8sBiqvKPgVFlT1?=
 =?us-ascii?Q?UWsVzkjnBQOSbwmQC4oaCL9vkYXJ2SEadbFXr0EjLbcg/VNIEvRpx6XAPzG0?=
 =?us-ascii?Q?IHL3DzX0Zcavhec+kdVyVyl3YfJs5WWzWlY5O5Kt2yUjn/LWzFAAy41R07Lm?=
 =?us-ascii?Q?tYZ510BOfGHDCT0xCIPRWbwNEjDc1xAMB3Z8z+ISRQscQ6C6Mtnm+ZtfBDkI?=
 =?us-ascii?Q?nEFU3TvTSwJTwrG61JKlhs8zB7oaUlIlvhn5GEju5SE3X7iNhJ/eb/lmbr79?=
 =?us-ascii?Q?kGobVeh8fqiIHx3U3syUtzLoFZaFJRpkjp4C3/SGzLhbSw1pISS5UgARgvg4?=
 =?us-ascii?Q?vU5zwfJ//Vddj5y6lIv7CPY5coNL5KxUmiZ+hKo6XdxkArM9OEynSeiCW89P?=
 =?us-ascii?Q?m3jvFO9w+q+ka6Tq04n1Ki9bY5J33WEed7DoYsMb6aVr8EjIY34uxDCqdChC?=
 =?us-ascii?Q?GkfEYlwnYn4UfMRsFFmqdhbGh8g0221o0L7Ew1b2x6be/tsUjUPSQsIBGwDR?=
 =?us-ascii?Q?pZZLsxi1QSx5JX8vgX0uId7qc2RYQIN16T6YtR9Rx620/H+auvFG916sQoTN?=
 =?us-ascii?Q?8pbmLvfJDP+MIfBpXCEC/mSGPSRUoyQcUvn/kjPGigqQ2wZDDVOETVug9YHN?=
 =?us-ascii?Q?7dmWFvauF9tnlE4b6PxKGXeDWvevxRNCy2vcKySpTVqyy538T4UlZJHAPqmH?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d24de1e-104a-45c2-c547-08db67167dd7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:17:30.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aAPa942OGk040LSYFHIZ7Lk1oZplAZ7KaAdNOTHDcl3d8FslCVRztAgGylmc0ZDt7nI1tlrEbwzyDiX9zy3w4va2SODi6s7BVWUREEJtOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/5] drm/xe: Move defines before relevant
 fields
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

On Wed, May 31, 2023 at 03:23:36PM +0000, Francois Dugast wrote:
>Align on same rule in the whole file: defines then doc then relevant
>field.
>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> include/uapi/drm/xe_drm.h | 62 ++++++++++++++++++++-------------------
> 1 file changed, 32 insertions(+), 30 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 5d34b570a305..2eea80bf0e06 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -138,6 +138,7 @@ struct drm_xe_query_mem_usage {
> struct drm_xe_query_config {
> 	__u32 num_params;
> 	__u32 pad;
>+
> #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> #define XE_QUERY_CONFIG_FLAGS			1
> 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
>@@ -179,11 +180,11 @@ struct drm_xe_query_topology_mask {
> 	/** @gt_id: GT ID the mask is associated with */
> 	__u16 gt_id;
>
>-	/** @type: type of mask */
>-	__u16 type;
> #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
> #define XE_TOPO_DSS_COMPUTE	(1 << 1)
> #define XE_TOPO_EU_PER_DSS	(1 << 2)
>+	/** @type: type of mask */
>+	__u16 type;
>
> 	/** @num_bytes: number of bytes in requested mask */
> 	__u32 num_bytes;
>@@ -196,15 +197,14 @@ struct drm_xe_device_query {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	/** @query: The type of data to query */
>-	__u32 query;
>-
> #define DRM_XE_DEVICE_QUERY_ENGINES	0
> #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
> #define DRM_XE_DEVICE_QUERY_CONFIG	2
> #define DRM_XE_DEVICE_QUERY_GTS		3
> #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>+	/** @query: The type of data to query */
>+	__u32 query;
>
> 	/** @size: Size of the queried data */
> 	__u32 size;
>@@ -227,12 +227,12 @@ struct drm_xe_gem_create {
> 	 */
> 	__u64 size;
>
>+#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>+#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> 	/**
> 	 * @flags: Flags, currently a mask of memory instances of where BO can
> 	 * be placed
> 	 */
>-#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>-#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> 	__u32 flags;
>
> 	/**
>@@ -293,8 +293,8 @@ struct drm_xe_ext_vm_set_property {
> 	/** @base: base user extension */
> 	struct xe_user_extension base;
>
>-	/** @property: property to set */
> #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>+	/** @property: property to set */
> 	__u32 property;
>
> 	/** @value: property value */
>@@ -305,17 +305,17 @@ struct drm_xe_ext_vm_set_property {
> };
>
> struct drm_xe_vm_create {
>-	/** @extensions: Pointer to the first extension struct, if any */
>+
> #define XE_VM_EXTENSION_SET_PROPERTY	0
>+	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	/** @flags: Flags */
>-	__u32 flags;
>-
> #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> #define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
> #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
>+	/** @flags: Flags */
>+	__u32 flags;

not for this patch, but we are missing a _FLAG_ in this to be consistent
with the rest.

>
> 	/** @vm_id: Returned VM ID */
> 	__u32 vm_id;
>@@ -365,12 +365,6 @@ struct drm_xe_vm_bind_op {
> 	 */
> 	__u64 gt_mask;
>
>-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>-	__u32 op;
>-
>-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>-	__u32 region;
>-
> #define XE_VM_BIND_OP_MAP		0x0
> #define XE_VM_BIND_OP_UNMAP		0x1
> #define XE_VM_BIND_OP_MAP_USERPTR	0x2
>@@ -409,6 +403,11 @@ struct drm_xe_vm_bind_op {
> 	 * than differing the MAP to the page fault handler.
> 	 */
> #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>+	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */

any idea why we mix them together like this? can't we simply have it
like this?

	__u16 op;
	__u16 flags;

>+	__u32 op;
>+
>+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>+	__u32 region;
>
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
>@@ -475,7 +474,6 @@ struct drm_xe_engine_set_property {
> 	/** @engine_id: Engine ID */
> 	__u32 engine_id;
>
>-	/** @property: property to set */
> #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>@@ -491,6 +489,7 @@ struct drm_xe_engine_set_property {
> #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
>+	/** @property: property to set */
> 	__u32 property;
>
> 	/** @value: property value */
>@@ -501,7 +500,6 @@ struct drm_xe_engine_set_property {
> };
>
> struct drm_xe_engine_class_instance {
>-	__u16 engine_class;
>
> #define DRM_XE_ENGINE_CLASS_RENDER		0
> #define DRM_XE_ENGINE_CLASS_COPY		1
>@@ -513,14 +511,16 @@ struct drm_xe_engine_class_instance {
> 	 * creating ordered queues of VM bind operations.
> 	 */
> #define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+	__u16 engine_class;
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
> };
>
> struct drm_xe_engine_create {
>-	/** @extensions: Pointer to the first extension struct, if any */
>+

here and in other places you are now leaving a newline that shouldn't be
there

> #define XE_ENGINE_EXTENSION_SET_PROPERTY               0
>+	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
> 	/** @width: submission width (number BB per exec) for this engine */
>@@ -558,8 +558,8 @@ struct drm_xe_engine_get_property {
> 	/** @engine_id: Engine ID */
> 	__u32 engine_id;
>
>-	/** @property: property to get */
> #define XE_ENGINE_GET_PROPERTY_BAN			0
>+	/** @property: property to get */
> 	__u32 property;
>
> 	/** @value: property value */
>@@ -584,13 +584,12 @@ struct drm_xe_sync {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>
>-	__u32 flags;
>-
> #define DRM_XE_SYNC_SYNCOBJ		0x0
> #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
> #define DRM_XE_SYNC_DMA_BUF		0x2
> #define DRM_XE_SYNC_USER_FENCE		0x3
> #define DRM_XE_SYNC_SIGNAL		0x10
>+	__u32 flags;
>
> 	union {
> 		__u32 handle;
>@@ -646,8 +645,6 @@ struct drm_xe_mmio {
>
> 	__u32 addr;
>
>-	__u32 flags;
>-
> #define DRM_XE_MMIO_8BIT	0x0
> #define DRM_XE_MMIO_16BIT	0x1
> #define DRM_XE_MMIO_32BIT	0x2
>@@ -655,6 +652,7 @@ struct drm_xe_mmio {
> #define DRM_XE_MMIO_BITS_MASK	0x3
> #define DRM_XE_MMIO_READ	0x4
> #define DRM_XE_MMIO_WRITE	0x8
>+	__u32 flags;
>
> 	__u64 value;
>
>@@ -685,27 +683,32 @@ struct drm_xe_wait_user_fence {
> 		 */
> 		__u64 vm_id;
> 	};
>-	/** @op: wait operation (type of comparison) */
>+
> #define DRM_XE_UFENCE_WAIT_EQ	0
> #define DRM_XE_UFENCE_WAIT_NEQ	1
> #define DRM_XE_UFENCE_WAIT_GT	2
> #define DRM_XE_UFENCE_WAIT_GTE	3
> #define DRM_XE_UFENCE_WAIT_LT	4
> #define DRM_XE_UFENCE_WAIT_LTE	5
>+	/** @op: wait operation (type of comparison) */
> 	__u16 op;
>-	/** @flags: wait flags */
>+
> #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
>+	/** @flags: wait flags */
> 	__u16 flags;
>+
> 	/** @value: compare value */
> 	__u64 value;
>-	/** @mask: comparison mask */
>+
> #define DRM_XE_UFENCE_WAIT_U8		0xffu
> #define DRM_XE_UFENCE_WAIT_U16		0xffffu
> #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>+	/** @mask: comparison mask */
> 	__u64 mask;
>+
> 	/** @timeout: how long to wait before bailing, value in jiffies */
> 	__s64 timeout;
> 	/**
>@@ -770,7 +773,6 @@ struct drm_xe_vm_madvise {
> #define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> 	/* Pin the VMA in memory, must be elevated user */
> #define DRM_XE_VM_MADVISE_PIN			6
>-
> 	/** @property: property to set */
> 	__u32 property;

apparently does what it says and lgtm, but will need a rebase to double
check.

Lucas De Marchi

>
>-- 
>2.34.1
>
