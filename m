Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C31C74A5B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 16:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7406610E473;
	Thu, 23 Mar 2023 16:31:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473A10E473
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679589061; x=1711125061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9JH1QlG9Hser8WY5symzgcGzKdiMTtx3M54iTGI8vHU=;
 b=a739oo5OcC4Q8pQUL5dToPoyKUCYCaIVADrCxDw608hh3wYYlriPcvlT
 0eZnYcNt4CchIW9uss5nofdO8X9vpco5M7VXGfhf28YSJJsJqDQmPZeyM
 oRTVGYsmX0xWpiGilcSDTUmrQDHGe0hmo/f2QEto3+8Y+KhCDtjnNYLHH
 wzKv1S9axSuTzEKXIRCnKrLe1Bv+gkFUu9pHHWwemUEgFosxEdsnI9188
 343TvbMyhTEpO+j1KXIxvo3SmiD0JwojvP6BW/CZChxpwy9lXJ+wV0eXl
 iAbpKNGRdyneJGWC7l4MSywd1KHj8CK0ag1DRFYUhsVRqfZBHNyGtD1Xn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339582887"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="339582887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682367736"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="682367736"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 09:31:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 09:30:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 09:30:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 09:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfTMYkUV0Ej1h2iRc42YSB97Pw6n6WWp7vek+/sDssaHM961nGszDyL87IUq8KppgcseeotOaVZuzU7Yy3rkSYdhgG/Mb6XoG4ol6YljSBR8/3iXiwmjfmhEQ+bmcsr/d1PYHrHikGiMSZqa19J4+z1r03a9BqLCOfIDDIvx4MgCGmfqU41GnnqLq2PztyPa2X6inZNNv4nbXUOwufLXdIE33kngekVPBz52l9c/87J83p5SadNsSDm8qUM0pLEFNPRFmwBIyjlPpdirRPm/ZVzH07uHMxqvlBr+wgExzrkWZN7Mb1j2/2QD/2gOkHaOa8IGt32Msy7hwhChreRQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaprkPm2wf1N9D/4OS7kyviKdUc+jQLTpQRKFloLXHo=;
 b=Y3LYC+sWejuZF7ZZvAhPubZThrNIgt3XmU9Q4jYghnB3IGchA3TaIIp8jFrPJw6S1S0kaZOqLpNNs6E7NWg67u/yXE+eN3agTZPYLXNiP/x3mhqxd2BXJ7DENJ0327CG/dk5mYkT0hYlyXzCoNBo03Mr3ZITfIq9T1ZNCDYzByv+33DXVe9UhRRqh4aRfiOi8mAf0GJyqzrR3B+osLv2aq5hwfdenj/v2qQzzWoBZqkRX7UqhH4uBbf+u7wbCwJha3IKTHZMTT5MXAtDurCJihsCE7BEAybQlNFhkvpqq78lgDG5/B0JTQkYcZ+EdUZn/GVP6KTMW9mAbHrOAgF5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Thu, 23 Mar 2023 16:30:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 16:30:51 +0000
Date: Thu, 23 Mar 2023 16:30:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZBx+jpuqQw/LFDcc@DUT025-TGLU.fm.intel.com>
References: <20230323025801.822678-1-matthew.brost@intel.com>
 <20230323025801.822678-3-matthew.brost@intel.com>
 <CAM0jSHO_iXUePB8D5x2uW3OhwGZUk3xzdT5J8v+Z6feXGL=BNw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHO_iXUePB8D5x2uW3OhwGZUk3xzdT5J8v+Z6feXGL=BNw@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6c8d1d-5c31-44e3-a4ed-08db2bbbf6f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G495TpCwmBaymkUvW7aYfDxNANDmIBvBTpDeFDgYRGBfOigANvs0Xl4M4/EVTb3H/EcfsIP1uU+aX3qiSTHDw2mffte/DyILzpbl+56XUw0b+lVfXb5fQD/gOlPCCeOA+bU9cPmsA43zX7MvlM4LBxIft+0+sJxBzsknt649qhl2fyCICBUzNTch1MykxuAzJaxe5XkW/l9wEfKQGT8ix+OmifV/rPxC4zlBcav4F2o3PDdzxqyyeypkHsnsvx2tOywnxeqMZt+T3UkdH9RNaHp2OpeI/QrnuKyseOt9eupL8AUxKsRVnRZ9nV9qL4+oiUMoldZIsBOPhJ2BE5RnGQEP/oMgZQFNQhD4CJ64iRLyFUgEbv7LUhNJ7uWFowI1PG2OxophzaNaF/E0YOcFSyNosBkE47SuyUA1my1YCXGm9CN0e2SUgh4RjKjC12W3glMwaxUOQ33YbeOkPq4ySFKELB7PqguS+NsaMnj+QmOLpZsZ2OBa9v5QDYEH96zXH4c0Gb1z6tp0987x01DNO5jJ/1HsrYQ10AN+FlKuOfpUFvCp5ZrfgApl8OrJjQToilnUSDMJ7LFAqqrzN0d1xMHLTqwH7NW3aDJZvS+Z1MGtOBSq6HRgVJDvcvRiTZoM7jdy3fFCU/8Epe++3ANBDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(478600001)(26005)(186003)(6486002)(6666004)(66476007)(6916009)(4326008)(66556008)(8676002)(316002)(66946007)(6506007)(6512007)(41300700001)(8936002)(82960400001)(5660300002)(2906002)(44832011)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RegnQqmWbwwOxc9ktWM4iOUTTz4SvbzbJJZsalAuIEAL+EmcFcytBFQcb0R7?=
 =?us-ascii?Q?/JgwsxM0vcrcYC/C/Ub4zl5ZfBiuTPbSpG1MtArYMG4FeUMHzJN7XZxbVuBR?=
 =?us-ascii?Q?AhW4oMFyFsDIh6ROdEshk8GzmJn0kPujh6I+hnYBJDz9T5xLGH96RykA/BNu?=
 =?us-ascii?Q?qJdlCnzpAcSHeWnOdT+g1+o3f9/wrDIrJxLlAQ6QWEJr1kA+N90PEimETQXZ?=
 =?us-ascii?Q?zdvm78J2FttS1OLjAoJXDhjhEHacHzfd+SfgLattlnyM7UlgEUJMr04IXO27?=
 =?us-ascii?Q?p7/d+w0G9JF7ZW44tf4kMJfBocVfcMdQ9qVmK6ubNlGr77RLPY4u3EOL0ocg?=
 =?us-ascii?Q?rLshU2Ef7XowQt6euOARcvY4wNszIO0dqA7eDI8qLi56Jo0Zs6zV3r2KN/p2?=
 =?us-ascii?Q?GjWl70ZO62DLIRFnjsP9wq6s4ExJd4KmPjo05IZ+BUQKQEPNALVhPJyvouMg?=
 =?us-ascii?Q?AJzI4cPjKkmEKZ5OsuEiKOc4KUE8sO7FJzfF+i+UaMdA86MYakB/rtWeZxW1?=
 =?us-ascii?Q?VeyRpd8n6rkSe5uAlr1iRB5ihJNB0arpsgZAank0PXxa/3vF4WYt5nE+baWF?=
 =?us-ascii?Q?BzHdBqEJ7ROf3pb7V+PjUzY6Kb/ywr0J86Sxy6raYxeUv8VnJV0t2q/yQBjW?=
 =?us-ascii?Q?y6POvqDr2FkVBkyz0/8CD4Agu52okDFvGw40bf1j7pw0GOPWPCu/r09Sqmb0?=
 =?us-ascii?Q?2vXGGwCbWk86zF0hPZtToZbrjE32Zl+qJnYwR0gMXhv75m4yu2cbFDC5hKI5?=
 =?us-ascii?Q?CY2lx8ms+xZaET+OoxQArcMMoppXhzzkmRL2yPZiaxEZ4fMYm7zxvvPjp99b?=
 =?us-ascii?Q?gOeCgoIPwOddx6dqG5UNIcLNsuWT9fTP9U+HOnnhmnkdIBhWOn+vCYi2XIq1?=
 =?us-ascii?Q?vgmgQs5t+ZVy/raJ+7/xtJigYHSp8+2LSMxwD05jvotheOQ4oaKcdvMHXuie?=
 =?us-ascii?Q?xkaXqqSkh92gYquRM/j3YvY/iQxmDZycUcnsQ2xX0/YEDGThf0K3EA7SyofQ?=
 =?us-ascii?Q?SNRyU5KegB9T47UeRgQ22tlv0l1MLbm0ccYt39qLyZD7Tl3ZTZUe/OGtydlq?=
 =?us-ascii?Q?x6VOGoV/OczRsIsg5Ji/tND/tgt3dE1mhLrze0Woh3YWK9YnbcxekQPm2S+7?=
 =?us-ascii?Q?lwmRvyoBcPBsFJZJpbAvuJ3PDHT8yy7pRY3qGr+MHoofBhnm1EOTBEON4OFQ?=
 =?us-ascii?Q?X4uqWvL3lKgM1symVYlW2AW5Cl0e/uLXfdxd+sx5bELxX5a3K69f/oXMPPt9?=
 =?us-ascii?Q?EoSuqmMLpsOPziYvtSfWEZnmJiYAL6zyP7Y+RZHogFaIFhjJCv+zI4731bQH?=
 =?us-ascii?Q?oBWOHz7e4xdwIRKciuzZT/+Tv4GPkZECq8FBUuS0xo2WWnf+Esi0bf1S5JTj?=
 =?us-ascii?Q?u/VMtTA2vsw6gdi7/dfMVxv6PRhmqeXlhu+Y9mpxVQJc1FUJflhkq3YNlz/l?=
 =?us-ascii?Q?7zP6orDG/aVISq/NAN2g+9amgphb2BD983sED3IyZAKZMyTzyMTATU38jZmj?=
 =?us-ascii?Q?/pDw9jf7KlQaaEHS/xhAuPDlJFRGQobWOLhfFMPqdpzt627Vawxd31rH3Bhc?=
 =?us-ascii?Q?3YT+aTk1eN7L/OOHweWrK/5IeLYJqo+Q/0c2NTBKTihEG8LwFct3t5AA7fWQ?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6c8d1d-5c31-44e3-a4ed-08db2bbbf6f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:30:50.6922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2lVXBrdhddASra6mvfm4BlbfYfpCEtCUyCmuZNBUccoci1iW+K+KYCV5dAdkFOHJZ78NL6ZTgi4M4krwA3nkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH v3 2/2] drm/xe/uapi: Add query engines
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

On Thu, Mar 23, 2023 at 09:43:24AM +0000, Matthew Auld wrote:
> On Thu, 23 Mar 2023 at 02:58, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Not all hardware engines are created equally, certain instance have
> > unique capabilities or properties. Introduce a uAPI to query for both
> > capabilities and properties. The capabilities are represented by a bit
> > mask which is unique to each class. The properties are represented by a
> > name and value return in an array to the user.
> >
> > v3: s/xe_engine/xe_hw_engine
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 89596d353d3e..2f936fe2e452 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -119,6 +119,7 @@ struct xe_user_extension {
> >  #define DRM_XE_WAIT_USER_FENCE         0x0b
> >  #define DRM_XE_VM_MADVISE              0x0c
> >  #define DRM_XE_ENGINE_GET_PROPERTY     0x0d
> > +#define DRM_XE_HW_ENGINE_QUERY         0x0f
> >
> >  /* Must be kept compact -- no holes */
> >  #define DRM_IOCTL_XE_DEVICE_QUERY              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > @@ -135,6 +136,7 @@ struct xe_user_extension {
> >  #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY       DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE           DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_VM_MADVISE                        DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > +#define DRM_IOCTL_XE_ENGINE_QUERY              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_HW_ENGINE_QUERY, struct drm_xe_hw_engine_query)
> >
> >  struct drm_xe_hw_engine_class_instance {
> >         __u16 engine_class;
> > @@ -253,6 +255,45 @@ struct drm_xe_device_query {
> >         __u64 reserved[2];
> >  };
> >
> > +struct drm_xe_hw_engine_query_property {
> > +       /** @name: name of the property */
> > +       __u64 name;
> > +
> > +       /** @value: value property */
> > +       __u64 value;
> > +
> > +       /** @reserved: reserved */
> > +       __u64 reserved[2];
> > +};
> > +
> > +struct drm_xe_hw_engine_query {
> > +       /** @extensions: pointer to the first extension struct, if any */
> > +       __u64 extensions;
> > +
> > +       /** @eci: engine class instance to query */
> > +       struct drm_xe_hw_engine_class_instance eci;
> > +
> > +       /** @capabilities: bit mask of capabilities, specific to each class */
> > +       __u64 capabilities;
> > +
> > +       /**
> > +        * @size: Size of the queried properties, if user passes in zero the KMD
> > +        * returns the size of the properties array, if user passes in the size
> > +        * of the properties array the KMD copies the properties to the user
> > +        * pointer.
> > +        */
> > +       __u32 size;
> 
> Just a drive-by-comment, AFAICT we need some kind of __u32 pad here?
> 

Probably should have that, world breaking change though so needs to be coordinated.

Matt

> > +
> > +       /**
> > +        * @properties: user pointer to which an array of  struct
> > +        * drm_xe_hw_engine_query_property are copied to if size is non-zero
> > +        */
> > +       __u64 properties;
> > +
> > +       /** @reserved: reserved */
> > +       __u64 reserved[2];
> > +};
> > +
> >  struct drm_xe_gem_create {
> >         /** @extensions: Pointer to the first extension struct, if any */
> >         __u64 extensions;
> > --
> > 2.34.1
> >
