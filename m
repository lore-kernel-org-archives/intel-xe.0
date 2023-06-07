Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE1C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 05:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB2A10E423;
	Wed,  7 Jun 2023 05:29:25 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C7B10E423
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 05:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686115763; x=1717651763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mGWN5/65pFm20R/xG58W61jjiISG7si82gpX2up9HFY=;
 b=CEuggZuW/aEsec8Yt2jnMz4pl6kgVi/srR93tUTLcxFJTrztWdoEdMrO
 wdUq2/Dg5LocvvBXDKirvE9dlX0qfWaKzUplgcHuTYYckiy5B9TzR98AK
 B5txa6jFKShSqp52BpTrQ300nLxHcViWj3/M9kL3FyylFESu6ujI3utnT
 F5Knmec2muJUzO0dEFy/zvZ/D8OIpfYRrZTQ/EJYnXdU+7zJMpYG0mav+
 5pqbiYZ3veLBS7pLRad9Apay7No0swEa5CJ46xwWxY9TljZ9Sg0bMCulb
 4+tO4QUvlsDDbVMnys6FD3eCKGwV9VKGsgz1gYjMpzp7y7piAOFeXPAbx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337250363"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337250363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853692570"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="853692570"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 22:26:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:26:46 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:26:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:26:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We4/r8YFNML+HoAYfrpi+MX5lfpEo1Aim9YMcNqLMoC5LuXswcFMk7reUETtzWM1P7r3h+U6CWt+L61gfR6KG6fK2X51PjcbK0Vm95G0vdPpGl+9bhHA8pdDeHsskUrbFndEmndpNzWnHIwYjDyrpHVLrYij09k+fP6tWgOKnEVi50OFu0j2IP/1kBIK02ejh6fQjDoh+wSbbUZ57re6wna1vrZLNk918A4Bhv5/FpY2jaGiiOexPPCVAmMSSBKnJrdRTmGyUGOpkI/2K211kEku/dSKi6upBG9YSbiZCB5l+le/1m4OGpdjCytDXiPDuHfLIfj6R/BHSwimpyqTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWnKtWa8Z99v0cotPeRd9kJEkvSQD1N2z/Pa7wZVceY=;
 b=IoYYJQ2x7QoaFclNKdTl7WQhYsB42hivt0QmsowiLq/m+Uw9N3Neee/xsfYoAPnet/LxHYds0d7SkvBDVFiae6FEwBk8SW1X3XqEBx+9uNgHeOk2J5ijFZcWKz6KAe3SFCYecJ9kQqMmCzTog0T6UU418lZo+PBbgd8rkj6po1GaPIIYrXf76wE2dzxjwbkcD3hGzdRiFpQ14AKy3g5TjLnqItbPF76vIYEPblv8OYH90hnGQbRY7LQ6C3Gx5zga9ywkTFI3SlHpDDSBe7xkfT9fZTc7Jh7mi0+CSXfmBYmjWHnxFt4qy0OVwlPZSBrHZjRjxkMUxU1uFoJJNIE31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 05:26:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:26:43 +0000
Date: Tue, 6 Jun 2023 22:26:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <c4hvpr7yohqsutdtqcpysmtunqxby7cyixz6oen3zghdvmm3zw@2mnzfebqdp36>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230531152338.6-6-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a12233-eaa6-4a8f-45ff-08db6717c78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6L1zcSQSDvQ7po8f0M2d80ety97DCx92ohCNYN/G/rmczOPJqe+7G9478S+jocFn78vErREkBnKNUYzD016TGwiR6Jtf8R+pnrwbhV68/hymKHqev885hszD6f2Nh3r2ziD2HOmNmrDXtAd+0U5qFA9GdSdGa4R93T6WBOS2tM5+bkDgeKHKPlA2f3e1xCs1ptM9QU8Vd3QqeRg7dM0Ie4HGBjROSiJwkUKk/8tlBfJp9GsQtqTV5/KSQGljx4cSSsXuCEe23s/GewPHVVUfpx5QpOyiX+C+FTFT1SR0hUldkM/H1VlTLLvyFBACfKq+ZmkwaU6K2c/S7oEUG+lMIxZtvbdlum//RY44XS3Z6UIOfpkLR/d5XeIxibofmk8uvEkS6WJgPNqFnlVS2GCp8lK9Wwwt7acv8U+dGAOAgxAtQht3DwpVqp80NrM+YjicDvziw8jX7kQa42QbF9GqEnB7PY3PhPikQrfwaMirAqM9yadr+koaXj78LFZE4/2q4K03FyXkMUqb/vSC+Y0sxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(86362001)(83380400001)(966005)(478600001)(82960400001)(6666004)(5660300002)(6862004)(8936002)(8676002)(316002)(66946007)(66476007)(66556008)(4326008)(38100700002)(41300700001)(6636002)(6486002)(2906002)(6506007)(6512007)(26005)(9686003)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvIpB4nDsAE5lb2GP+/tRt2MOhIDOL8VAAcoKamWSUkkPH7PgP4u16rY5w2Q?=
 =?us-ascii?Q?WSqkLq7pOX2O+fRF9yFcCv0VV0Bp8IbfbAXy7JIcONBRE7Mc8Qlgh7DVEWYD?=
 =?us-ascii?Q?TJNCWfy3sEkiOpDgCMmPtADa7B+WhY+rl9zU80eYpZaXyOQ1xB1vMbXNZjVJ?=
 =?us-ascii?Q?hEMy7e/F4JO+msnzKgbeI99IgZi+fuUocwo81EU6lO1vkfQ3LgXaHkuGJ63L?=
 =?us-ascii?Q?VHvkExDS+rCdkbktaVN5LaVxWQdZdeZNu/CXR4jpzvQOQmNlqaNBB7LU4Ps9?=
 =?us-ascii?Q?HuUy+gyyMYZhtEDTA8maDD2sJTrgR+CSti0XcJFbarOlDi8V4qTwd7ezg4vz?=
 =?us-ascii?Q?28Nao2aiZVu7H1CT3/ZPL8HjWjCFCQf9Xs3VzWBkH5ul6D6sW+4rUqxn/GOP?=
 =?us-ascii?Q?GMWSq89T8NZEzA2PXrwRMEvZ9zmQLMwE6GVmrxyUHRklbWNpd8M1EG9JQg2K?=
 =?us-ascii?Q?ilX265Xhqq5qm3GlxB2H29rL7FeNdYaPwI2EEVzZks2mT6Hptnsg8A4izJ6M?=
 =?us-ascii?Q?NkGOkX3WSt+Rb1LoMmjSYZvq6v/3UWmFDnQh7rSX1MmZ9WMghFa7/KlepCZK?=
 =?us-ascii?Q?jEwITSEoYTEyR1CwyUwVP/CrJgIdKRJkU3/zjyYTrWyfMSabj86VT5m2E/j9?=
 =?us-ascii?Q?/LzEVL30eCdSGJiL0cCUJeJG8/ovbQYHaA21gjwewJE+44/MPFmuby+5ZWiW?=
 =?us-ascii?Q?NIll3Nz37rxW1YgEEIMQsvby+2wIXsm3LpZRgE1b0XgkTSJ18XA0Qhvf5gxG?=
 =?us-ascii?Q?LL2aSk9WyW3qMYnvVzkMjuSJAlQPzwz+Fj5yl/m+d44MVMh5tXmQmU8k8oGP?=
 =?us-ascii?Q?53/EPRextqEe6yqQWEnmjFSRvXRvHHQtnEQ/VsWXEEUssoF35A6yuEUd72pn?=
 =?us-ascii?Q?nASCoAN3gaUMDlfcLTCoX+dK7zyNsDme76oG/GEb2Z0+vdrOv4U6striowr7?=
 =?us-ascii?Q?HwYkxX6OUQFyavdZyWvoVVuLpWPxf/z2ddMxt7RuAGB8+oxve2mHOPGcApG0?=
 =?us-ascii?Q?6xykNbfG4ldCMAVMfihsOywQ/4fS8XK5dK5BmckcPZr51ZdNTtm1RkKYMjV+?=
 =?us-ascii?Q?EVHv7xcK15XcBTHj35vP/ui1D6qwupQcjnvWYNZMWTkOwwe+yZB9dphVottK?=
 =?us-ascii?Q?Sqy5lSDR16GCHMMzAfZX2E94ST1UAGow1Im/UZh7uOCt4+43EurqkMjQsjJN?=
 =?us-ascii?Q?59TEBUk1XOoWP2P4XJBuH5TJagbG0t2h+iS7QHhyi6MRQFP4mN62s5Q95K5/?=
 =?us-ascii?Q?oz6ngCMD+f0bmkcpwgcSG9ilamIcHWbPib2isrsSkF4dZ1nKhpcFmlgpLNkQ?=
 =?us-ascii?Q?jNJ6mPWUV3cgFzxDhyIxn4BUvq00bpABzi+AHC/vEmjx0n7nVsIodTZ4TfRG?=
 =?us-ascii?Q?njN5np8EFGoYMQLyQxADaV7QhCXnQ00XSIik6IfMRk40wJlPFgfmhC1qN9KM?=
 =?us-ascii?Q?d80SEJV4yYsNNVqSdzk5fiywkYffuI0PQKQbbAsOsubutcxmmKolzwO9FfM3?=
 =?us-ascii?Q?eRwvQQFoFT7R3lqqkvgNTVfbr6mDzDY7nlMP51FUU0D+CVYMWx1Z6QnA2dN1?=
 =?us-ascii?Q?wkAYvJGxc3Hrrp3G8YpYniO6bmJvEsnBJNgKKmT9kFrYzEwjfH1XdzTt0Ilg?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a12233-eaa6-4a8f-45ff-08db6717c78d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:26:43.4335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp1sLDHR3mKN/Aqxo07kBNCL2dieH2zlX8GRxwwubk9lwbFMBCHpV/QLvZ6Tlql1QAf7YTq6WOLofKApj2nu+0NfhmsI63JNK1DV4WHi8vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/5] drm/xe: Fix some formatting issues in
 uAPI
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

On Wed, May 31, 2023 at 03:23:38PM +0000, Francois Dugast wrote:
>Reported-by: Oded Gabbay <ogabbay@kernel.org>
>Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>

no commit should be without commit message... need to spell out what
"some formatting issues" are, like the spacing, alignment, and repeated
words. With that and a rebase,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Not sure about the "Link:" usage here as it seems to be unique to these
patches.

Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 24 ++++++++++++------------
> 1 file changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index e29399de148c..667cd60db3d5 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -105,16 +105,16 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
> #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
> #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
>-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
>-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
>+#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
>+#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> #define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
> #define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
>-#define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
>-#define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>+#define DRM_IOCTL_XE_ENGINE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
>+#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> #define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
>-#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
>+#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>-#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>+#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
> #define XE_MEM_REGION_CLASS_SYSMEM	0
> #define XE_MEM_REGION_CLASS_VRAM	1
>@@ -154,7 +154,7 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_GT_COUNT		4
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>-#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
>+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> 	/** @info: array containing the config info below  */
> 	__u64 info[];
> };
>@@ -411,8 +411,8 @@ struct drm_xe_vm_bind_op {
> 	 * If this flag is clear and the IOCTL doesn't return an error, in
> 	 * practice the bind op is good and will complete.
> 	 *
>-	 * If this flag is set and doesn't return return an error, the bind op
>-	 * can still fail and recovery is needed. If configured, the bind op that
>+	 * If this flag is set and doesn't return an error, the bind op can
>+	 * still fail and recovery is needed. If configured, the bind op that
> 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
> 	 * Once the user sees the error (via a ufence +
> 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
>@@ -651,9 +651,9 @@ struct drm_xe_exec {
> 	__u64 syncs;
>
> 	/**
>-	  * @address: address of batch buffer if num_batch_buffer == 1 or an
>-	  * array of batch buffer addresses
>-	  */
>+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
>+	 * array of batch buffer addresses
>+	 */
> 	__u64 address;
>
> 	/**
>-- 
>2.34.1
>
