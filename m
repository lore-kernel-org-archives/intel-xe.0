Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A8C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 20:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EFE10E1ED;
	Fri, 26 May 2023 20:36:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140810E840
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685133360; x=1716669360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PCx8xFyBTZdW8q0GIfY1xJrVFaWSNOxuQHaRA+kq2T8=;
 b=V630yOmXLEyV5MMXytOXuxA0YN7o0RwJIYw207Uc0Bp7CKZV4vDvVS82
 fGmwU41JD9XxyjBCDIOJrRVq07BW4ikmWtCOrm/qXMygKO8TXmSrfz2LT
 kbvMKr6zF7lCtzBJ+v55JvS4HMsrGlu0o5ObxQ59ltMjoZrrx7yU5pEgM
 l3HboxVa1v+jh4ITf2tOYLsZcFsV0RZKn4GhkT5SQtGgNQtlqWmXQItqX
 zhExiR6l7qz3qhO82qrhv7fhT7Xng4foJoShJoNRB6LiWQVVWPmm2auF/
 bjC3FbbENDPDnwf3vhqgU0VRx5tJFwELixoswE7Xc3xA1f1oF24F8rNOL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333925083"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="333925083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="817673541"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="817673541"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 13:35:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 13:35:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 13:35:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 13:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVN13pUlqVsWP4dziUpiB/a8A7/j0R2dz3+Jw0uhbq+fYHPcPz2bR0piwC0Z2Squ3is/z5ddIp0MQG9djG2oHljfsdZJpHIP2HB9Lqq5dyJnFCLVI0ABUOs76o7PgAI2c9GxPR2cX4f1p0fy4XKp+B6QWosscdZk5ORYCKtWpJ3kKIV881iKMdScJNFJCBm3GmBESXbrqMuql7atHCbO0pdBZukB2C3BGGDZx5aKKhKRpkWi8JH2r41upwvVufFbVAwLT2j2cYaQ8zsQyTyjj02orwoQ76JaiR6vQOQDSyCbsolB/JsZxrZSGTCpTIHBWC1EZwC4n964WpF0uqbzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV1NY/G2puoqwbzw3d5Y6ZFOpix5j+BXcb0akYLU4K8=;
 b=irDzqKaJ7xd6MpO4ptov6tgfdxqGIoZ35soYvxQ8PvR9+MjkVnUIrUXIFO71bg6JaZQLjhH/jcJ9U117ufb7wpWwhyESWJVP8utobmG5UZZXeSJigMIbDMYq+gICqVL3iOeLWraR0WRNXMy9F6U96cHt2L8CBBi8k9e8CGpfNTzQu6FyCEbaW5If7vm9oywVOtfRqx25CkdwTXEbpEFP2RUVGiRBKcwwpJVEiD+kBEj+/HVAd/N86UDfnQrLLYlPrv7OfHYud7nzwnExX+6vW0Me8pQUSA/NoalcL6rN3aebTyW8XHgQE70FrnJ0KBM/6wClKEpOwJRE7Y0O8j66wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SA1PR11MB6806.namprd11.prod.outlook.com (2603:10b6:806:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 20:35:55 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::6713:5f49:6e1f:97]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::6713:5f49:6e1f:97%7]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 20:35:55 +0000
Date: Fri, 26 May 2023 13:35:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <imrbklwbtm57p5x7ttv5d5tvad6oiulojl2pxaiwevdsiay5ek@ahymoyjynhaf>
References: <20230526190824.7-1-francois.dugast@intel.com>
 <20230526190824.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526190824.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:303:6a::21) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SA1PR11MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b055271-537f-4f13-55af-08db5e28cdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSckcmClUPtiY9kJ58ZwNQbhlvXU9pZ4l9UCJ21O4ICdjbNjXizLEkTv8R5/1c0RHXSwiE7LXvTRAtA5y189yfLYCZhT/b8UFBtUdErheM/MdsAMpDmRf4gBc/fA2WWoDeYZR6wm6HqfvC13KlygKMJ0TSYvJrDFlHQeA4DwRz8LzskZkY4TQIA1Z9BiwCu3c/XW+7V9haBiWSKfs5eoTFm/Ks8g8LXHSSvGhQxPEfZiQSCEhsb8NoY8Xhfi+7N+zKNfRNUHfEejaVAqg9HHvKksMDZIh2raei5SQoFqhtATSLvL78cyTNq0Yz3GOLyitGM9wXPWeL2hUv+e4F/9QZK+Poj2+/2lP3vbFsGLKDERoiDrJkToaS2G9J2l3LGi8Zf53HU+K2YHa6JWTzujlbROl/+X/gLtL2ZCxujtXS7XN+pL1Ar9Ro54v5jaASQnLErVmauqQ7s4ywZ8HxGVkLLttJA+Fgw40Ekxb7nR7mXctwANUwHj1dmKEYKPE5c5KFMo+qMxDlEqPJ/ccAgLJ9Rv7vMMMe6W8cLap6v9jL9nqIJCTkZR3ddrx4VIaffr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(186003)(2906002)(86362001)(9686003)(8936002)(5660300002)(66476007)(66556008)(33716001)(66946007)(6636002)(4326008)(83380400001)(6862004)(8676002)(82960400001)(26005)(316002)(41300700001)(6506007)(478600001)(38100700002)(6666004)(6512007)(966005)(6486002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XlCT/TPu2Nhal036uWdJnvqtXRxJi/5pfN3WZ3es0FWDlIu25+wzy3Lyz7RI?=
 =?us-ascii?Q?0lZVStWxZczY05tjIHoiucVQSodTeeTcGPY4fEcC8wunrsrcyOiYw+wThnp1?=
 =?us-ascii?Q?Ck2ipQ5xa7pKB/U7iFkc8kh2biV4CYoXJLxXX1nWxcM8+YTVVuB2PRtepMiV?=
 =?us-ascii?Q?9B9kTmd+3zQX8OVda4iwx9czmnttbbDoKg0fccEml5U0Fmu94zy/BZQVzZad?=
 =?us-ascii?Q?gPv6aH70c0D3nChCiKVqtriJJKnPWUtSYOcF3+vobsBN+Nzc3q8OHvMLU0VX?=
 =?us-ascii?Q?vQrd8HycoL5gmAqQP5tMAEGF3gfK9W/JvvE0FLbKqDcILa3fZaWU0eMyY+u5?=
 =?us-ascii?Q?+5C51wAfx6F0pQvk/2HEx3KgdyqIVFVrVJf/zt74j8x3hsjf6trSSQD7i2hK?=
 =?us-ascii?Q?bmcbV8qM/y1nhxWZtyohGYq7s14RmcVGklapFjuQdmX6MO4Bu2ODzyQthi2T?=
 =?us-ascii?Q?2fF6Jn2WYlb19jGixYIb38DQpKlQ2v5PRHOrGBwtVIiALaOAtcrhnh7iW9L3?=
 =?us-ascii?Q?EjovHXrFoGvKhA4WZvulyKgrLbiWHO+B/oawvkUbNOguhmEcvByaEbgD1JgI?=
 =?us-ascii?Q?/nTiig5jJ3xOs13poeo9UH26HBdWrBlqKzpO/jkfba518j7z/2rMXKRvCzkd?=
 =?us-ascii?Q?3mQfgUz8gx4XblCG5XhjqyGfEgLNsI1CX+RZwauWO6F/OnKgfzj4HYe7CJRE?=
 =?us-ascii?Q?Ry2n/Cje4rRfv+y5NAOoPZrKWiydFYHlPlbSiFGkvm8GcUW3eO7WdGIMDreM?=
 =?us-ascii?Q?o+fMz9z1u/7LS8lDKRx/90WQgVw3aXi2zELK02Ui28DD7ImPh3Fj9BmhJH1I?=
 =?us-ascii?Q?/Ds9y2Lc6jU2zzsg8yua7I0U6UwDpzGYs6J31N+t/AyjYJt7skpY3SU8cNzA?=
 =?us-ascii?Q?/KPEz+HXKreOLqJ+MvWsQUIM4xR+Nx6nnQjW+uJn2TGDZgNPVvejQ0E65q0i?=
 =?us-ascii?Q?bbCpkq9X8RYQ/cyJ44uWKQ2/CQ3mp/w5FpSzNXFBws0eJTfuZ+KfjwGeAUXD?=
 =?us-ascii?Q?fnHTMjUMCzELMfNDZJs7S6yriJB2Vwaq0L6bCiCnqQc1xKMtHL55TtdCGuNI?=
 =?us-ascii?Q?QRJq6pFUycVeFM0YXSU278Qm0B5vWllRztsQDQLwXO/1AKaFp2HTkrEHaOou?=
 =?us-ascii?Q?awOZcMGp8Vz0xhh5H4b/K0HRlN85LnmEVh9YR4IqMhc4HUBOT1F8ossHsF79?=
 =?us-ascii?Q?Kxcz+7t5ff/WK53PFhnXT6vokCSLfl/7/bhBs0U0Khskr6T5/RSmb9uYkBoE?=
 =?us-ascii?Q?jMlNf7pz8g6Tk6cfx91bwdF13rt3qt41H2ecaVpejfB8QfY9I2b0MOpzu2hS?=
 =?us-ascii?Q?we2m5sjYB9XKJ0Xk1JiCcMin7OOrEp49TNcFG3GpcfGFe0kTXDU93h9lBtJN?=
 =?us-ascii?Q?FB++lnlcoR2lHssQDhHHUL/gGPb7r+3RuCmUYFdih91U6q3o6NRQDzGUoZc+?=
 =?us-ascii?Q?ccyJE7fPq4YfOAn8vsGAJSLhxMrtNH2Pv97uvAIeDsv5zkjZJENbbXNes1F5?=
 =?us-ascii?Q?weWuRhh5LD8qiKDjvVOyG3qIy4BqRL2rDIW76pfK6uqfG4dgIPpSyYtP2EWx?=
 =?us-ascii?Q?fsp37XZxDRsUQimn7hhWOzIIgPlsT4Q6GiZkfljmUYrjFdZlTF3aHcF9XKjj?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b055271-537f-4f13-55af-08db5e28cdec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 20:35:55.5351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0nUDoZhXpDPzQ3ovnqnxdI0c9f92nmBuA2ZVNX9Q6zopkr8K+sFcWw4lz6LM7UZDND8Xj0JRiEEmz1kxaeJxSGnsUaDYab2F2JXhuqzOxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/5] drm/xe: Move defines after relevant
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

On Fri, May 26, 2023 at 07:08:22PM +0000, Francois Dugast wrote:
>Align on same rule in the whoe file: defines come after the
>relevant fields.

is that a convention from somewhere? See below.

>
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> include/uapi/drm/xe_drm.h | 40 +++++++++++++++++++--------------------
> 1 file changed, 20 insertions(+), 20 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 5d34b570a305..160b0aad4a96 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -116,9 +116,6 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
>-#define XE_MEM_REGION_CLASS_SYSMEM	0
>-#define XE_MEM_REGION_CLASS_VRAM	1
>-
> struct drm_xe_query_mem_usage {
> 	__u32 num_regions;
> 	__u32 pad;
>@@ -135,9 +132,13 @@ struct drm_xe_query_mem_usage {
> 	} regions[];
> };
>
>+#define XE_MEM_REGION_CLASS_SYSMEM	0
>+#define XE_MEM_REGION_CLASS_VRAM	1
>+
> struct drm_xe_query_config {
> 	__u32 num_params;
> 	__u32 pad;
>+	__u64 info[];
> #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> #define XE_QUERY_CONFIG_FLAGS			1
> 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)

I thnk it would be much cleaner to go the opposite and ensure a newline
in place so it's not ambiguous.

struct drm_xe_query_config {
	__u32 num_params;
	__u32 pad;

#define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
#define XE_QUERY_CONFIG_FLAGS			1
#define ...
	/** @info: .... */
	__u64 info[];
};

Lucas De Marchi

>@@ -148,7 +149,6 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> #define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
>-	__u64 info[];
> };
>
> struct drm_xe_query_gts {
>@@ -161,10 +161,10 @@ struct drm_xe_query_gts {
> 	 */
>
> 	struct drm_xe_query_gt {
>+		__u16 type;
> #define XE_QUERY_GT_TYPE_MAIN		0
> #define XE_QUERY_GT_TYPE_REMOTE		1
> #define XE_QUERY_GT_TYPE_MEDIA		2
>-		__u16 type;
> 		__u16 instance;
> 		__u32 clock_freq;
> 		__u64 features;
>@@ -231,9 +231,9 @@ struct drm_xe_gem_create {
> 	 * @flags: Flags, currently a mask of memory instances of where BO can
> 	 * be placed
> 	 */
>+	__u32 flags;
> #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
> #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
>-	__u32 flags;
>
> 	/**
> 	 * @vm_id: Attached VM, if any
>@@ -294,8 +294,8 @@ struct drm_xe_ext_vm_set_property {
> 	struct xe_user_extension base;
>
> 	/** @property: property to set */
>-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> 	__u32 property;
>+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>
> 	/** @value: property value */
> 	__u64 value;
>@@ -306,8 +306,8 @@ struct drm_xe_ext_vm_set_property {
>
> struct drm_xe_vm_create {
> 	/** @extensions: Pointer to the first extension struct, if any */
>-#define XE_VM_EXTENSION_SET_PROPERTY	0
> 	__u64 extensions;
>+#define XE_VM_EXTENSION_SET_PROPERTY	0
>
> 	/** @flags: Flags */
> 	__u32 flags;
>@@ -368,9 +368,6 @@ struct drm_xe_vm_bind_op {
> 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> 	__u32 op;
>
>-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>-	__u32 region;
>-
> #define XE_VM_BIND_OP_MAP		0x0
> #define XE_VM_BIND_OP_UNMAP		0x1
> #define XE_VM_BIND_OP_MAP_USERPTR	0x2
>@@ -410,6 +407,9 @@ struct drm_xe_vm_bind_op {
> 	 */
> #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>
>+	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>+	__u32 region;
>+
> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
> };
>@@ -476,6 +476,7 @@ struct drm_xe_engine_set_property {
> 	__u32 engine_id;
>
> 	/** @property: property to set */
>+	__u32 property;
> #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>@@ -491,7 +492,6 @@ struct drm_xe_engine_set_property {
> #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
>-	__u32 property;
>
> 	/** @value: property value */
> 	__u64 value;
>@@ -520,8 +520,8 @@ struct drm_xe_engine_class_instance {
>
> struct drm_xe_engine_create {
> 	/** @extensions: Pointer to the first extension struct, if any */
>-#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> 	__u64 extensions;
>+#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
>
> 	/** @width: submission width (number BB per exec) for this engine */
> 	__u16 width;
>@@ -559,8 +559,8 @@ struct drm_xe_engine_get_property {
> 	__u32 engine_id;
>
> 	/** @property: property to get */
>-#define XE_ENGINE_GET_PROPERTY_BAN			0
> 	__u32 property;
>+#define XE_ENGINE_GET_PROPERTY_BAN			0
>
> 	/** @value: property value */
> 	__u64 value;
>@@ -686,26 +686,26 @@ struct drm_xe_wait_user_fence {
> 		__u64 vm_id;
> 	};
> 	/** @op: wait operation (type of comparison) */
>+	__u16 op;
> #define DRM_XE_UFENCE_WAIT_EQ	0
> #define DRM_XE_UFENCE_WAIT_NEQ	1
> #define DRM_XE_UFENCE_WAIT_GT	2
> #define DRM_XE_UFENCE_WAIT_GTE	3
> #define DRM_XE_UFENCE_WAIT_LT	4
> #define DRM_XE_UFENCE_WAIT_LTE	5
>-	__u16 op;
> 	/** @flags: wait flags */
>+	__u16 flags;
> #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
>-	__u16 flags;
> 	/** @value: compare value */
> 	__u64 value;
> 	/** @mask: comparison mask */
>+	__u64 mask;
> #define DRM_XE_UFENCE_WAIT_U8		0xffu
> #define DRM_XE_UFENCE_WAIT_U16		0xffffu
> #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
>-	__u64 mask;
> 	/** @timeout: how long to wait before bailing, value in jiffies */
> 	__s64 timeout;
> 	/**
>@@ -736,6 +736,9 @@ struct drm_xe_vm_madvise {
> 	/** @addr: Address of the VMA to operation on */
> 	__u64 addr;
>
>+	/** @property: property to set */
>+	__u32 property;
>+
> 	/*
> 	 * Setting the preferred location will trigger a migrate of the VMA
> 	 * backing store to new location if the backing store is already
>@@ -771,9 +774,6 @@ struct drm_xe_vm_madvise {
> 	/* Pin the VMA in memory, must be elevated user */
> #define DRM_XE_VM_MADVISE_PIN			6
>
>-	/** @property: property to set */
>-	__u32 property;
>-
> 	/** @value: property value */
> 	__u64 value;
>
>-- 
>2.34.1
>
