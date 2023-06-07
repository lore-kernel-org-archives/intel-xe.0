Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49EFC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 14:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC0210E057;
	Wed,  7 Jun 2023 14:24:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841D10E057
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686147877; x=1717683877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zQlb1ptaZIzp4EhjNegc9UUsMyX6VdIQW7arptoo6Gc=;
 b=FJiqDPSxhE62NB/hVt3IYrMR07i2IupaPN5cYS/kNtClkS35xxSJ7krp
 wpDbGJnZC7eRmupfgwXzrZFsSTZtDrLljcfc+LChdAoCkkWIpAF94boVS
 pq73wmgN33mu7ubInDyyt4HOaF0IndMWWcK0JTOXkGaqL/I/lFTpjFAlv
 ptwvXEbTC9VjrX8mIrNTE9zVE+LSXg+AsGbaLv/rfgrTw7WKXzOJr1D+7
 454BWlzNJf4vwAyWbvGRxmq4bhjFZnacc2FX/1Sen/WmepjpDvYJpuptE
 ro0S6O7z9IaOORVnhnXohouLdAHruEIC1LZs+lJ85SiX4S25y05tFhTD2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385326004"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="385326004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 07:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687023989"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687023989"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 07:24:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 07:24:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 07:24:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 07:24:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 07:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STnwmsXojkJVbWmgAbiRfBzqoXWP1MVln1q2lXEh4Cq/FD5SjxabQpSFiXis3B25C13XpK/IEt4wJFAfZnSseEY83ZfdAhZBTc4KhY1sVs5QpCgZfVFXrke3DwcIR3ct7+mKVUQlzYU6K8kq7d+mD+gmvpyGtXbAT/pBhjiU68lSVVN7zhRD2grcvN440FPvC0I3YSu8OHRy2K3J4aZI24+NIBwp12Yu2i4MOhm6NIqWRdLw4aCPKIiDMIDYHYfyT/YSw7B27phUt2RZJ5r5dk1jPmSG1nv6HAf5dXdBhisNlZpsnUdU6V4JQ9NywAt+Cwt4x6IJE8KNP/wsn3vy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tu2OAm0cQVxFE0V32IoeGhJ3YDPNkGcAm1FKsJ3XRQ=;
 b=IFzGV9ZRcNtecTn4vzlEeZPAp212+HkdCB4FV13PrPEtrkpSuSSjnXer2tAYQrKUy+7S9SSk3QTj96/0ysc+xkbrKHrVbEaoXFYgbYI75bzD3ipljYVLtjbe/kKimXUJWnL+3IXB/VbXcrEM5+oJyWQOvsTW/t21BGvOUCp0TZdSykVyMEb4zmGTRhCc4vAZeRt+O7W8vYZ8T7TMgJy2q7FWzFS4Ddt6OcI5veeCzF7hrzTrZYbiNaQguISm2XliYY4dsK9flJWPmdewo9C3qdJPLRo8FwrrLTRSIA/8uPjI2R9OIB5UEzLFGw53Qo5nQhmHphpAhvOtoYnDeIIEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 14:24:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 14:24:31 +0000
Date: Wed, 7 Jun 2023 16:24:24 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZICTGIMD9jWtIzwV@fdugast-desk.home>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <20230531152338.6-6-francois.dugast@intel.com>
 <c4hvpr7yohqsutdtqcpysmtunqxby7cyixz6oen3zghdvmm3zw@2mnzfebqdp36>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4hvpr7yohqsutdtqcpysmtunqxby7cyixz6oen3zghdvmm3zw@2mnzfebqdp36>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a406e8-3242-49f2-da4d-08db6762e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRzO/tNICvixSBiiE275/FqV6Z8G8fXK9gSYxJykDH/0/wsvIWY96cMi8kXGn9l5AOtjWtyhmASsfWA45qCMsUyyzQa+Jl54G64UnB2XQvv25VgVs4ZJElPT5Uq2Rv2SegTXQxeifQ+7rozbdPOdDrIEXcmPCtwOHRv4GOQafqWooR46CbMeaKnj7agTjITq6UQNVJQlfA3uCx6yHDajxLHyXX3QK4874uvDWNymUMfxYTOp6aV8RWd0Uiy4gcubV+rLjixjOny7vs+aC1QSUro6M25XtvW2IR/29YBpXdZtC6vsUqVycynYQ2zgENNABraaGKxix0SG6LT3DVB1fb9jtAaQmf7tNymPS2xy+2eyVXujzZw78SScQSYj1pq0i/GrFeudW51B0VePwLy0JAQkHySiObpfeEU7f7XKQIHj33x7mdgXdQbsnW9fRxekXNkBEmDE4fGGKgfP2xWAJ51G0byayp9VFc/6zpaMQy5uF3E3aU2QsPGt8+seVeJ52nkWRQ1oTcnV4ZHkTnsE7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(478600001)(2906002)(83380400001)(9686003)(186003)(6512007)(6506007)(26005)(86362001)(82960400001)(38100700002)(6486002)(36916002)(36756003)(966005)(6666004)(5660300002)(8936002)(6862004)(8676002)(41300700001)(6636002)(4326008)(66476007)(66946007)(66556008)(316002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAv987V86Qppu9YUmCRTWmctmOLG/aaNxUmvnHgi2HuF+vyMViXIK52WUG+J?=
 =?us-ascii?Q?h9hpEe3MyKNZfi+YF69PshdJzchcVXqZsY5fkCZit0WbQkm6lHTd+ga7aZ/2?=
 =?us-ascii?Q?lQRNpS2Z+J12VQVZ3ffBjLXBoeAYeQFnTf4kcj3xh6lnElCsYZTXfNMp+Q5a?=
 =?us-ascii?Q?48QQWMmWbsSC2yJdhYi5jQt/hXOyEGg3ON8O1pnnvvgpbGa1DNzoejGQPc6K?=
 =?us-ascii?Q?PA4ztn/eM/qv4qwoVKln/wNLhVOZR8FX+RIJWpAzOSUWvtJ02s+0zUvke3Du?=
 =?us-ascii?Q?iAU+eeIrOias0uM7n5OzJTNxH2zDXzRwmaqxMLdgzZDzQ+LXtYRENx+v74u+?=
 =?us-ascii?Q?gTRWzjc/QqicALALtJbedhjfQIEHygSvxVgltuqisv1bDnGiSZg6X5OLn2l6?=
 =?us-ascii?Q?VQkpDWM1KSqeaeZEa2PeOLK8+evRGDP7L9MVQariyYklbr6CQscw1URfzgm1?=
 =?us-ascii?Q?yLkyL4McNg6MYTU1M4c0aY17an+Hj9q7dYfWiSlKw1NEGoh37mm4lSvpDOZS?=
 =?us-ascii?Q?s71jbekXwFGxDrt4FW32SBa8wzPWlOQTklc6vRR0K8z+q4xM8GCG3iXp3HFM?=
 =?us-ascii?Q?CuDPA51q3V+dxklD5VHBg//yJbBQwCePRZh5Dr3fLXbP1Y5TbG9SoST/qfyU?=
 =?us-ascii?Q?aoEqtdXrjgOEC/eSXpSHFn4RGo7VWtkT5e+DGP9Qklp7Dea0s7WuY2z0rps7?=
 =?us-ascii?Q?FzMNpZ+VRLafj1gFqxwmlnjC3LB8ZTBUoRG5ryCrNEOUouagh9u1pByaB+8+?=
 =?us-ascii?Q?pJVe2reg+VlHOue+Q+l5niDpjKi2rq7wl/iSTk0eSjJBrc2YyDf3pwCywT5f?=
 =?us-ascii?Q?bXPKS3JU325KvaPN5zRizjXB2nQP+Pc8uFIUPYikGF9Ii8fKP+LdUPd1JwBZ?=
 =?us-ascii?Q?+rSO6Q2nlcY6gKwd3exBEQ6KWScjkNWqLFpdyIw4z9Kzh2kwgXnuDn58d47l?=
 =?us-ascii?Q?aO1Ynm1nkLpydrsLB9LweopujdMLDGQqyoXR+KKR6kuLwd7tE1CSVkPfzcZs?=
 =?us-ascii?Q?BVOyCABVHQEepu37zDU8ZSHjPb1VJoqNc5SNIvY/czkE7CxQueQsuYWJ64vk?=
 =?us-ascii?Q?OhFlIIbBEwyInp6ik8sFccPKyYHiT2dBOnRD7S9i49FFCpiZz9iTRJiy82z7?=
 =?us-ascii?Q?nkU/4sSpQ19PuWvmQQJK7xxTbXdX1RhiSBAULjogVhO6NmBPQxv5BasD19Mk?=
 =?us-ascii?Q?mBGo/Zk8wnIlF86IXPmT1paR0tU+qk6KhEVGWoWXsIua7ZywN8smDVlv3c34?=
 =?us-ascii?Q?apt5yFpBkWVdDhHAVpCBY2atfvMuijuwxmpBX4G7QbEqGdHghGAG1inwaSkd?=
 =?us-ascii?Q?R4fJvmtRjYNYNle//mxQyoBqdBjl6ZV0uJbZregGQXJc2Q6LeUp1qDOEUSFt?=
 =?us-ascii?Q?On2C0j+fQpF5DySiM2+WRFPFoGk+A/yXDRLBm2yfNd7iMoAzs4ch7hMBmlts?=
 =?us-ascii?Q?9xDU3BKgk4+2K/Bfl07iPaKcvlDWek+t1D290GO4eG+uSVyxUFQDsA3Z+uAj?=
 =?us-ascii?Q?oXz7B76eHpXdSz2CM1UcPNv9kyfjNVfFnGxz1G9e0tG1Qhqw6v4/3Cj0ZtVp?=
 =?us-ascii?Q?xbkwWgObtJfNVZ2Cgi0NAbM1z1a1xkdPWNWQ1v3suHMyl3K/VXE5vwFrCgsZ?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a406e8-3242-49f2-da4d-08db6762e8ce
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 14:24:31.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYjUc68IyDF00DcA7jRmgp0lQoEuJ7LFGD9Iul4J+ghlABbcKgs/kkd/TSxlEQlkURov0RitgaDPwSfR5fgiTCr8hD5etxBm2Vg91FTLjIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

On Tue, Jun 06, 2023 at 10:26:39PM -0700, Lucas De Marchi wrote:
> On Wed, May 31, 2023 at 03:23:38PM +0000, Francois Dugast wrote:
> > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> no commit should be without commit message... need to spell out what
> "some formatting issues" are, like the spacing, alignment, and repeated
> words. With that and a rebase,
> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, will do.

> 
> Not sure about the "Link:" usage here as it seems to be unique to these
> patches.

It seems it is used already, even to link to freedesktop archives:

	git log --after=2022-01-01 | grep "Link: https://lists.freedesktop.org"

The intention is to link patches with the review batches but I am fine
dropping it and keeping track in a separate list.

Francois

> 
> Lucas De Marchi
> 
> > ---
> > include/uapi/drm/xe_drm.h | 24 ++++++++++++------------
> > 1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index e29399de148c..667cd60db3d5 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -105,16 +105,16 @@ struct xe_user_extension {
> > #define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
> > #define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
> > #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
> > -#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
> > -#define DRM_IOCTL_XE_VM_BIND			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > +#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
> > +#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > #define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
> > #define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
> > -#define DRM_IOCTL_XE_ENGINE_DESTROY		DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
> > -#define DRM_IOCTL_XE_EXEC			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > +#define DRM_IOCTL_XE_ENGINE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
> > +#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > #define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
> > -#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> > +#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > -#define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > +#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > 
> > #define XE_MEM_REGION_CLASS_SYSMEM	0
> > #define XE_MEM_REGION_CLASS_VRAM	1
> > @@ -154,7 +154,7 @@ struct drm_xe_query_config {
> > #define XE_QUERY_CONFIG_GT_COUNT		4
> > #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > -#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> > +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> > 	/** @info: array containing the config info below  */
> > 	__u64 info[];
> > };
> > @@ -411,8 +411,8 @@ struct drm_xe_vm_bind_op {
> > 	 * If this flag is clear and the IOCTL doesn't return an error, in
> > 	 * practice the bind op is good and will complete.
> > 	 *
> > -	 * If this flag is set and doesn't return return an error, the bind op
> > -	 * can still fail and recovery is needed. If configured, the bind op that
> > +	 * If this flag is set and doesn't return an error, the bind op can
> > +	 * still fail and recovery is needed. If configured, the bind op that
> > 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
> > 	 * Once the user sees the error (via a ufence +
> > 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> > @@ -651,9 +651,9 @@ struct drm_xe_exec {
> > 	__u64 syncs;
> > 
> > 	/**
> > -	  * @address: address of batch buffer if num_batch_buffer == 1 or an
> > -	  * array of batch buffer addresses
> > -	  */
> > +	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > +	 * array of batch buffer addresses
> > +	 */
> > 	__u64 address;
> > 
> > 	/**
> > -- 
> > 2.34.1
> > 
