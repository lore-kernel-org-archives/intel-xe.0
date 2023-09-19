Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C405ACE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 20:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41A10E1BD;
	Tue, 19 Sep 2023 20:42:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52D10E1BD
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695156167; x=1726692167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rFIsaruRTnK9loLY/fWzuFSDf4O2RA7CfvxvcJhYLsY=;
 b=JCxz0ItSKe2bvGGtATA76+WPIu8TSZ7eP3IGfLDcqQNRA66lVQC947Tp
 LIOQSyLt/QIty1gCX452rWv/0WEbkugRJFZlX/INR6wqaY8McyvQbjGQ4
 jNVR5o9peRlCiUgkaE7sATEd7NURIOWe7/u8XRSQj3406jYIpJWuONURd
 xNT7WMpBO9tRxCyMwgdUOSh8tmqr7O5RfVBipUmXlblzbuwdm/tPVG9QX
 omp4W5ggdpbwZ17QwF0btgHl3tg5cy7eD3vQrqcZtNqjoHzWpZaMSvmQx
 lvZXjWfvpmG7Fi3ELqpDrpSoVDi6TqllRbT0mMMszVx4eK36S0sUZYWeC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378938411"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="378938411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 13:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920013261"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="920013261"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 13:42:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 13:42:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 13:42:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 13:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2MSqU5/nMf+eeZXwZL9N85rtR2b/KCkslCnC1dDfKmzRdob4/OyeGINMgV2MrgZO3AwzEznL3/ACMIZpia4ko8D1R9ND1ee8eZennxkeuPXcgYLjN/8CtlqaD6ouBVB47V31QNWOOOPwcRPIQirnTWhaGs2cdc+XYWpL+mQVnyFjB3iGZZDN7XN1S1EyjsqwwXbAacIdOBfWMNTMNmwVzlcw3bQ+0ziz1GeON5QO39p5OxFv4zktR8Ghl42wUFHENK1QS7uew+Egafk5ylOf/DP4guzRHUlEGIAuxbOFq400kPsgtNUtVs9Os9e/7s7ut6Bk+n1XYbpwr+H5oA6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+aVY2GJb3lbeyYyQRg+KNhTbhBrTbIEK+fAT4aS+PU=;
 b=mG5SeZToNsWy9tOgHPA74Rw+pF+uQibnlsCMV+M+j5ywrPFFJqntfx9uAkwp88ke9QVVI9WcNLZ3+RoWHbM9tSpWfwCcB2erhBTv2yHMVnlLqEVSn/ZLP7LYsnqmYu0h/EhZC3rwl6zXz0DwLfmYnVtfKhvmL33E9807mbnY0gadqZF3/qYmpNRkkxm0nUTaCbaM5l/kZ8DPkWWwmQuaEGcxvNeM7SGZHmCrftJ+NgITBnDIp/034zwIXK1U2JBe+u2Pxkr11YOPe0nvofFp2pNvOH46S7zKRSC5nISUz6BHXA0Hd+4xJeBSs046K9K2lq+yFfcOuPWB/Og4ZRRz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 20:42:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 20:42:43 +0000
Date: Tue, 19 Sep 2023 20:41:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQoHfzRgLricNE3U@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-12-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 28750587-aa3b-4c0a-77c8-08dbb950f945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2zwKlkI/V15sMeSC+7C611Q3v6eK10I3ks4Og6Bcv7agi8cZay261NBIHwK/8KGXCJuRzG7yoP+OE2FgbNoLCzm5D0vlBZyLlbDnR5ABPYDoP+5cnuu/leYEgJN5rQpvJF3o71qojXgTnFtbOwkB6hkBNQeq4JATK7ST0woxvW3AKGIBGOzQjVBM+zL7s7GmrrMJyacDHu/Jpm9EveMzKOCRtu/i3G0pNCuxS5WgFMneGOXb87J5SA6qAmSRJ6TOPfjYGhMeQH7J5QEyHger5n9mQrSw2H1br9oOyUlK10/66+3yH8ZC6qO3AtYF4T7eyTAZKoUQSjoeXEnpVAmYY8PIYDA8xCi3TZd3bnIzbeg5c28IlinoyS7kkxJgQ7SYR1mheKU8RdYYmvuCxaUqPKwWZaJs1ljhwsCX7tA93zpfoR+rGpKgAo+7rqF6h0+ksR9+QD2/PitZB7N3eOYVTP0CyYXo83frTX+YB5cTnVfqN+Y4OYQMJc47DFD2mn34WGPosJNad7CDmys0CO6TKJ1NrfIr35iU4QB014QJhAbQE7dpJ/NfGUDTRqGltmr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(1800799009)(186009)(451199024)(6506007)(6486002)(6666004)(6512007)(478600001)(4326008)(83380400001)(26005)(107886003)(6862004)(2906002)(44832011)(66556008)(66476007)(316002)(6636002)(66946007)(5660300002)(8676002)(8936002)(41300700001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLHi29ftqP+GN5QZnE0ZSyASQ4eKdBbZQJhpexQtPbb2hcFxmw1ndvnGmvWl?=
 =?us-ascii?Q?YEuEnCW78+v1rG7ljkZLQS3rQwVPzHZMxHvx7a6X7NYjTJ7fT+1E5En1kOB5?=
 =?us-ascii?Q?7GLNmKxmQgobRPEevl1aGDshssI9Ol5Uw5p2srDr92GQyJS8DvHxkdRbS9vZ?=
 =?us-ascii?Q?b7QRNgC1HMUczIE6QhLtRO+AlEfMuXQknbKQ6Jmj48qsBRhQzS96JRqfE9iH?=
 =?us-ascii?Q?uRGT4nauzzgvBgB1KqHs3BiZkNaKV9rLHFWY7vX3zANkAxIfrJHduR2O6K9U?=
 =?us-ascii?Q?dkP/wOoDMvAZmJnkNSDs+ccYqQMNXIkZWmLv6JycLODHJIVutrufQ85sLLRo?=
 =?us-ascii?Q?A6UlQLlXijVFPqM7tLaW7bX5mPj9cd6WyAv/VltzwKOzCg3ukJ6ayraEngb1?=
 =?us-ascii?Q?BXeGNPpvg1XBDLameg2/ztRy3fFShov2+0CI6+5wyEuGbch/SEOacDsRPH8U?=
 =?us-ascii?Q?bDjDr3O7NaKJH/pFDjrmgtmrAtTlcGo8BD1BAugEsRneKiR09SUXa+sG/zZb?=
 =?us-ascii?Q?K2zxFAa/wAUAw6U0ZfOL7T6uxMAPPaNm8JadBsdL0wiCXEttb1r0ic085FBo?=
 =?us-ascii?Q?HvPvev71Rl6L/igyyTL0j4zlFCvj6c/yKW7d9ms6mw4Nuj1L74no9cb+rHE4?=
 =?us-ascii?Q?w+NGA2Dl+ENfrqsCvIgBhsRYQTEJSZWRIO2tJ4ubse2sA20INhtIhK5ieIu5?=
 =?us-ascii?Q?w/1OUVipiIkt2VYsRvoszyioGJIhw/QAfJV1qQSkX8+13zy0y177MGZJQlDI?=
 =?us-ascii?Q?yYlP7ROwr4ZeYsTCi/X8x6/qehbo4Wy99545aHKAjkJzxJKuf3mXeJRohvjz?=
 =?us-ascii?Q?ubJifb+PPDaUczRwyIQU4bcPik/hTxnkfcNBGp5/R5NG3IwFGujqlrD4oEZV?=
 =?us-ascii?Q?45fXr4IDxSrbdLE7vlQDnEwFnaKrW21DnYHS9KANWjlBXbbCCBvPIDMeonp3?=
 =?us-ascii?Q?XPFbo8Dr37QrtUKfAH3pJ5U/8KBCkaQLPyZBtIhBTK/+GBlxSiO4QNqfVqJy?=
 =?us-ascii?Q?gdrnF3yESEztEQMjQe+GdFInPbPirYaZwgn0ztMMe9eJqpbX8j7HUoKdkihi?=
 =?us-ascii?Q?5/0+Iftez0tCwjKlyEyut0P+3ip9MHRVLmPo2fcIfxgTSGqkHMH4zVTsg2u1?=
 =?us-ascii?Q?yp2r+p7xQI4jBcJbt5vMaT7yf8zqujl6wzYLrIWhCVt1icYWfzQTtPbaMPXp?=
 =?us-ascii?Q?kcXGrlOoMJnZ07PEQwWXqwcpsl41kwn2l+YP9ED4+EO978zBMww+bxVPnfTA?=
 =?us-ascii?Q?DdhwXQHb6UtseEy955sWzPZ85ceGdkqIyDgYrKl7K6d/ME7h9tQ8JXE9KnO4?=
 =?us-ascii?Q?nI0u+wGGm5PuLbdrAlbK6MpufbWB7jImcS8MEY6SGsyW4Vw4KpRRRw6o90tH?=
 =?us-ascii?Q?5l2q2xf/U2fopr4XhledD0GDw8cen/A0NggB95M6hfG5uKYMW1uVI6bzzlJD?=
 =?us-ascii?Q?xzJXM0zThf3E1m+GxjokH9CKt2CXSUnTtrKSzOb/WRF1jTY33BaQyoNydQgn?=
 =?us-ascii?Q?VSk+iJHhazCefKc3vM+Sd7ontGMKj1RsRT+C3APCBqh9SqWo8ltYPVFn+ZgE?=
 =?us-ascii?Q?zuZB4kWxc4NpUrx0cTxzR5CJDjtSKRLnowJJRqr6lY/A/oGmknhflQUfpTFv?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28750587-aa3b-4c0a-77c8-08dbb950f945
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 20:42:43.5450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udWS3+/B+I5Alpxgr8eVTE9CoW8UdKZ2/b6eWfH755ztpAy3MJL4y7lzbEvId1FFwbE8vgUnsRhtcuewcUjNwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe/uapi: Use common
 drm_xe_ext_set_property extension
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:24:58AM -0400, Rodrigo Vivi wrote:
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> There really is no difference between 'struct drm_xe_ext_vm_set_property'
> and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
> specify a <property, value> pair. Replace the two extensions with a single
> common 'struct drm_xe_ext_set_property' extension. The rationale is that
> rather than have each XE module (including future modules) invent their own
> property/value extensions, all XE modules use a common set_property
> extension when possible.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         |  2 +-
>  include/uapi/drm/xe_drm.h          | 21 +++------------------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index f70332986c73..411ba38cb2b8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -418,7 +418,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  					    bool create)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
> -	struct drm_xe_ext_exec_queue_set_property ext;
> +	struct drm_xe_ext_set_property ext;
>  	int err;
>  	u32 idx;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2af331cf2d35..33a02aca8971 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1935,7 +1935,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
>  				    u64 extension)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
> -	struct drm_xe_ext_vm_set_property ext;
> +	struct drm_xe_ext_set_property ext;
>  	int err;
>  
>  	err = __copy_from_user(&ext, address, sizeof(ext));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index fb7c3a8ac572..8be3b25928bd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -572,12 +572,11 @@ struct drm_xe_vm_bind_op_error_capture {
>  	__u64 size;
>  };
>  
> -/** struct drm_xe_ext_vm_set_property - VM set property extension */
> -struct drm_xe_ext_vm_set_property {
> +/** struct drm_xe_ext_set_property - XE set property extension */
> +struct drm_xe_ext_set_property {
>  	/** @base: base user extension */
>  	struct xe_user_extension base;
>  
> -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @property: property to set */
>  	__u32 property;
>  
> @@ -593,6 +592,7 @@ struct drm_xe_ext_vm_set_property {
>  
>  struct drm_xe_vm_create {
>  #define XE_VM_EXTENSION_SET_PROPERTY	0
> +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -757,21 +757,6 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> -/** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
> -struct drm_xe_ext_exec_queue_set_property {
> -	/** @base: base user extension */
> -	struct xe_user_extension base;
> -
> -	/** @property: property to set */
> -	__u32 property;
> -
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
> -	/** @value: property value */
> -	__u64 value;
> -};
> -
>  /**
>   * struct drm_xe_exec_queue_set_property - exec queue set property
>   *
> -- 
> 2.41.0
> 
