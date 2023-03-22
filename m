Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC3C6FD1C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 19:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FD910E05A;
	Wed, 22 Mar 2023 19:38:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65D10E05A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679513892; x=1711049892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZB1gJuhWtmE4xbR03LhYCcTL3QB8sildPPXUJtPKZec=;
 b=Cu504t0W6tXAOfVxz0HcoG9klWlsM1+LleGV4bXG4SD15rNJ06o7VqSZ
 Jzar9AcXwnonc9PQi0eZuTJjnI5e8su2OxW03UCgSIKTfhfbIKzWTS7CI
 mhwOv+qMXLZDxa9G/5K21firagxpaiBtNdmUTkHQfOUzNEfsmJAJVYBP7
 zFZ3Jx27NiyPkVl8svM9nhJGnaBZvPHj3Shv/2XrSHuT1rx20TvgiqKrd
 rCeKiz/k3ebyJUxoWJ5M74vQK63D2Y137f0PNwUnl6Al184PEZXBxkbKH
 adQYsO39rvHg4YVDgE4XyZQfVbBupwzDEelVC2ukHj3WZPGLcsZxyvPBJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367054328"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="367054328"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 12:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684443512"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684443512"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 12:38:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 12:38:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 12:38:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 12:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDn3kItjDjxedi1B6o1WHdVg2cTc+lv7TygAYOTjMt0a8dsp51VYaT0XvIKYio66LeV0XM0WEVETz+tKJmuEDDPTQWpQDWPKQsmALhKGZZET5BYewqwvUBbn/tuEo6mTyFxctfQgl3/D3+4Pe/LCWoNT8TaslSwzeFwIsm6NVQ5m9gP6teiE3itqN9BK+OLZjEh+ZK3uVkCNX2pJxxM4sAao4FjkwTSm+0P462E9mPEOBufIhJ9XjDYy44xlY+Vsdol6G9s0fe0ITtL1SCAUw5LwKoBF0HN+A9QMp935zoqVVBzAy/LEkpLKEgtxR4Dtyi5xYAe0Sju36kQ7ve6/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df7loPn/e3xVTAAb9CdHENeq+v5cUkQHKnXpJds9HG4=;
 b=byoVbeeJpSqqb/GGqr4DRiPkExKbm4PCDb9d0ZnW1LqVqZkQPG00z+7Kze/SFeLonapHPd41yX0SDjOV59tLMdJ/JioX2EYHg0v13lFavIsHComRkKeRLLrphLDGdHIyKh1tt3e59rvDUhkaje/q7yqSHQRs5kzockeSF/8sm92IoGSif7ub7kvWOcSkQRbc0Os7iE8Sr2f3SnoZw8IcEm7K/Omrot7ZmAfNmL4auBDdLcYv/0bII/lzFk6hgdl55PSiZTwOg+KGkDMelHXknzl2nuUdV2XQgWa4ITxyj/MJkBwuxYlho2g3KJvS3UPTxUmX9vsauoMKwPcySkAUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 19:38:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 19:38:02 +0000
Date: Wed, 22 Mar 2023 19:37:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZBtY8d6H8khAdPZR@DUT025-TGLU.fm.intel.com>
References: <20230322023450.797598-1-matthew.brost@intel.com>
 <20230322023450.797598-2-matthew.brost@intel.com>
 <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f31840-049d-4960-6553-08db2b0cf2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FItLDX2Qe55FBIdyPGPR7hgAswOa4Wjdo6utY+8+LaC3RBSbspiqqy1D6iUgRz2fp9lKxyIBS23JcsNHGJIFfN9gL9m3egs7Is2oaRTzehmdaky6tNtN6FVQkCkmwi/fA++wG5CGYyDgKotl02CSsKcCzSSIy82vOEFHli4vlT9geY1PQ/bfRpUs+STAMc9LaJ2OCxfwfDKnSdSo0Nq4iw1nbca8D1HBSn/baUZEwxQA8csi9SELqPvR7DNwSpgYIKGGo+YzpvyX/cLPTZuoy8PwsP3MbtaPNey3sR6mhpuaTsrMqYpoO6n3dMkVFE6bnHJQkJ7opI267kagTGpXxpujypNIUEIsVofvCw9X4+c4H8cAYS6t8htlxgb61zU3e7TBY3l0zPSF7/BoVyt5Xn70YkcZKpqdTkkphFGJIX16Lxxwt8C9rl0oQGlf7OZMJvugjfN5SZsvp2M9VHOJQla0QKUtDq3haii42/tY2pszVg7sJ/5YG/4CZdax/wJbU4xFyT5ptmWTq2Qvt3i4YkuLKjpUHKeZvQ1q4PIEId4LhvH0aJX1zzJRJCmsADjWHFntET6ILwmLi/0Llgv3v/CHbtdPK+n1ZyVhAB9TOb9mMH0xC0JrEa8L8T3tFMZJMgKOyyWce+tHaAUwRr8s9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199018)(6862004)(5660300002)(44832011)(41300700001)(86362001)(38100700002)(8936002)(82960400001)(2906002)(6666004)(6486002)(478600001)(186003)(6512007)(83380400001)(26005)(6506007)(8676002)(4326008)(6636002)(316002)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H3dszgUXGjaUGLQ7xnf/Anf7mMtuujZyLFT9/xtvv1dq+XEP1KE51duqv71B?=
 =?us-ascii?Q?yDDA3jr4oz9UFYh7Vrp7V6rs+Ew4kNnkjOgstCmyUKJ+r+MRw/X/aGMf2ERp?=
 =?us-ascii?Q?qdgs87IanEzFzaHgWHoWXJZLjvDHcoJ/OKIez/hnnhHehtww3dNQS69XSVtN?=
 =?us-ascii?Q?W4ZT+owA2ScvrLTA+Iv0J4TJVOQw5YkfELtzV0fwr/i9o5o6U5jFDZ4Jc7T2?=
 =?us-ascii?Q?cahYYa/TG8n3JlZxlzqFQrR7ERbEsqYa7Vv99RlZz16o4zAFbyq/lXvyfZfy?=
 =?us-ascii?Q?+XfwXW6yZGP2KXU+qB3yloRLKBg5RE3iU+M/T8opmxYi/w+KL+7uurkx/+Fr?=
 =?us-ascii?Q?nDd9PfR+6rYQFILZAXKzouXt87DDhTQSa+cVWukfyW6NyqmFFsZE2KIWWTtd?=
 =?us-ascii?Q?eluXilio4CaRueySXGKEJLtUD2Qij6Swk4sjurs8E/sZ2mmbyocfo7p5zvAi?=
 =?us-ascii?Q?VOdR6//Chxe4l74e6w0TxjHX3wLgnPHTEMtwefACHKSbF7wmLsBqblWFaV/Q?=
 =?us-ascii?Q?02t4CxkkQQigJU70oxBG1zBQulhgx1AOpl1W1UFvC7VFAk7r3pTIvmI1kM0J?=
 =?us-ascii?Q?W7rXO3ZsAy4PHB0D2ey3M+4WaPyrCgEUqxDJsiEYSx0jw0L29xlmhdrpUTCq?=
 =?us-ascii?Q?P6kzfp8BprXEbZPVF955yOBcZrICMvGwhY85a0d226McX739cJShCCN1svKB?=
 =?us-ascii?Q?wqNOlJ00WK2IHWaOzPFg2c0z5OtWnlZm+FAALOvQWSL/aBd/77LThDxx0PUn?=
 =?us-ascii?Q?P+mwUl866/uHZCueege13BLXCnKWVA6Dlcl6tusrevlPwyvWv7Y+mpDI7iwV?=
 =?us-ascii?Q?dfl5E/yKaGCtAFSzQRYBgeDlTD9G8khPvbix4H99o+tGsYKl0soPB/DCGdUy?=
 =?us-ascii?Q?v4pZEfDi3irOLy/RvKXtG56CaXV3jnooM/jOZP8CE2mgKpixF1Sg9Bo1J5f/?=
 =?us-ascii?Q?TprDEngSbztBzkqFOpzNNIzLkfTK3TMazyLvBOq/VyfiSuwxokp+S7VsmDiz?=
 =?us-ascii?Q?GFCl43/RutF1Jv+Rjsp7bIX4AmJ34fYJGbZRhJ7CpyPpXlX8TnQaf98MqZyU?=
 =?us-ascii?Q?gkTSW4pe11peb+1gtOnbHI/5jr25eAb0we9zHVeGIGlxBSaNJu7Y2rQ3oBo/?=
 =?us-ascii?Q?HDaaaw0BZURzzDWsYEEGnd1OmEPX/TbcsVAfN217n0j3vFuWT/gRx/lT3xqH?=
 =?us-ascii?Q?2cRsrL0rWe0XiUlsf408uwu1oMjohuACNZE5hPESDBtYpI9nsbfqKUW658sZ?=
 =?us-ascii?Q?M/Cn1GECeE6zM6TCusPm5YAGmLhxh8xdKY8bOKKByPZACtBdjg7A5t3pLFII?=
 =?us-ascii?Q?ZHzCuWUFMiyUNGrkkFjflVOzwqVFjLVYHZCqjzGZf+94JuOtUdmULyPnogab?=
 =?us-ascii?Q?cooAABIZu3SYTVcGrhi9GjrOy6FC9jvfktmZjnci5JmB67nRdObIA4+bXeZ5?=
 =?us-ascii?Q?q6LWGzBVf/Zn0HPuPPvWlRijrjzTBzK8wUK50l46r+9Vn5BVo5Qs6kEO5WqY?=
 =?us-ascii?Q?lefUklFbcZVOxLDGUwhGdYIXNMoU2az9myXotjoiGZGd/Yvm+HGKvZuGh8V2?=
 =?us-ascii?Q?TeN106F/fEKab5bi/FI8B++XJzImmLGn7lNREI6tVqG4t0wfkYn7OTi3Xcer?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f31840-049d-4960-6553-08db2b0cf2f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 19:38:02.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XemCludPiNg4dSCObbWTAzInjLYsCDl+XwYmKTv7WUy8Bh/g3WQLPp3WRXll+FLqR3VyU1VDJv3wyQDEWk2Qcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:18:33AM -0600, Souza, Jose wrote:
> On Tue, 2023-03-21 at 19:34 -0700, Matthew Brost wrote:
> > Not all hardware engines are created equally, certain instance have
> > unique capabilities or properties. Introduce a uAPI to query for both
> > capabilities and properties. The capabilities are represented by a bit
> > mask which is unique to each class. The properties are represented by a
> > name and value return in an array to the user.
> 
> When re-sending the same patch series with fixes, please include "vX" in the subject we know what is the latest version to review.
> 

Will do.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 661d7929210c..557c9ae6f364 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -119,6 +119,7 @@ struct xe_user_extension {
> >  #define DRM_XE_WAIT_USER_FENCE		0x0b
> >  #define DRM_XE_VM_MADVISE		0x0c
> >  #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
> > +#define DRM_XE_ENGINE_QUERY		0x0f
> 
> s/0x0f/0x0e
>

Yep.

> To avoid confusion with DRM_XE_ENGINE_GET_PROPERTY, would be better to name this and related stuff as DRM_XE_ENGINE_CLASS_QUERY.
>

I don't love DRM_XE_ENGINE_CLASS_QUERY as the query is for the class,
id, gt tuple.

We definitely need to do work in general on the naming to avoid
confusion between a hardware engine and a user engine. Perhaps just do a
large find replace across Xe where a user engine -> context?

Another option would be the uAPI with HW engine naming as needed. e.g.

s/DRM_XE_ENGINE_CLASS_QUERY/DRM_XE_HW_ENGINE_CLASS_QUERY
s/drm_xe_engine_class_instance/drm_xe_hw_engine_class_instance
s/DRM_XE_DEVICE_QUERY_ENGINES/DRM_XE_DEVICE_QUERY_HW_ENGINES

I'd lean towards option #2 but open to either.

Matt

> >  
> >  /* Must be kept compact -- no holes */
> >  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > @@ -135,6 +136,7 @@ struct xe_user_extension {
> >  #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > +#define DRM_IOCTL_XE_ENGINE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_QUERY, struct drm_xe_engine_query)
> 
> 
> 
> >  
> >  struct drm_xe_engine_class_instance {
> >  	__u16 engine_class;
> > @@ -253,6 +255,48 @@ struct drm_xe_device_query {
> >  	__u64 reserved[2];
> >  };
> >  
> > +struct drm_xe_engine_query_property {
> > +	/** @property: pointer to the first property struct, if any */
> > +	__u64 property;
> > +
> > +	/** @name: name of the property */
> > +	__u64 name;
> > +
> > +	/** @value: value property */
> > +	__u64 value;
> > +
> > +	/** @reserved: reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> > +struct drm_xe_engine_query {
> > +	/** @extensions: pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @eci: engine class instance to query */
> > +	struct drm_xe_engine_class_instance eci;
> > +
> > +	/** @capabilities: bit mask of capabilities, specific to each class */
> > +	__u64 capabilities;
> > +
> > +	/**
> > +	 * @size: Size of the queried properties, if user passes in zero the KMD
> > +	 * returns the size of the properties array, if user passes in the size
> > +	 * of the properties array the KMD copies the properties to the user
> > +	 * pointer.
> > +	 */
> > +	__u32 size;
> > +
> > +	/**
> > +	 * @properties: user pointer to which an array of  struct
> > +	 * drm_xe_engine_query_property are copied to if size is non-zero
> > +	 */
> > +	__u64 properties;
> > +
> > +	/** @reserved: reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> >  struct drm_xe_gem_create {
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> 
