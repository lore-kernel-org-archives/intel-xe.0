Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E86C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 22:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED8A10E415;
	Wed, 22 Mar 2023 22:36:28 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D828E10E415
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679524586; x=1711060586;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KD56WZdnJLdfuazEAipJ6D/HKON1mzzydvFcl5DOGTA=;
 b=ksGEF5DRtDTQmDNuKI0vLTj2Xk3h2mRx2MDA14XP/Zm/bwI2vNV3nz2h
 ODZnnNz/aUlDKeGrOz8+DHPufOE3t03LIfaw/T0cF9YRHak9yovEusYRr
 27aa5uAtGdMwL/144TvwoYShcFRB23O4jqCpnntS+6CU0dhwNpwUpurXt
 t/CjzxOijmOWdyCLU4z4132nlbLCg7brJQQJ5ospSDVfOSO0egS2Shimu
 e16BYpacy5AR4T1uY+ykApNfpQ0XYTJhsXbQbtU6TZ0JuCX2/MPm3AARW
 AGPPIrxgRn/9sk4/bQIQcOHSFJjrKkef79wvo0nhRQUW0skqyrHdZCIi5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327725725"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="327725725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 15:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746492748"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="746492748"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2023 15:36:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 15:36:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 15:36:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 15:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAo1NzdpV2OYu3vLXbXGIqwprJddVQ+fsMEgguQTvOlTozfgGmENR2fFPjUr0DZFuaJkJs+s8XWCeVyfZFMp9lJelJsWPGGcqEJQD7JXK6IcC7Kcl11kq8VP8MS906BY5Iv7PcmqbYiM/IxNT3z8HrPzTlP+znygaqdoW4oHvn+ChP8p07WGoibqsn3rMn3wtPw3EKc177YeK1Iv0iB3SP7l5+ORjZDD7gFbmC91bIY78ldhJNoj/ys6pGVxzDwGA9cGLcho3sirSdpkkf/GGQsmfY481c2YpxTwhhZt4HgJXZcWDP+qpQIy5UTXmm7A2CZ4Y2L9JPr8S0imoB1YiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmj8cNeAXWMdSiSBTu+QWAry7Sm3YxNnA3fToDpUY2Y=;
 b=CqebxnCFK2GP/cTF+65Istoauh3uoRHixz6Z2IbqxkoS8BmU7SerjtHe1HryMNOeIQv6OaYPHe4Dxfmt7bVXtQj78U7BwsPPtLWC61d0E8f8rmfC0tWw8qjjT3Uw1h8kpw3+Gf36BoyIWYiPvLBrxtC+aiHFztXnQYCWuW09KCZdJJbde+0xn+AnMX9kDZQ7LONQV5FB0LrdQSB7G+1e8uLMwVMHNDdULbdW1I207pdfUq3RleK9uoSfY107CpE/UThOuSi3pwzDphvrNURfeILpEq1Q61HTb56fVMRYq+nLqgows9jUdv7Iu5gUTatMJrGHQgZ+GJ/CEzDUt4SjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 22:36:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 22:36:17 +0000
Date: Wed, 22 Mar 2023 22:35:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZBuCuOMEGC2XGyqZ@DUT025-TGLU.fm.intel.com>
References: <20230322023450.797598-1-matthew.brost@intel.com>
 <20230322023450.797598-2-matthew.brost@intel.com>
 <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
 <ZBtY8d6H8khAdPZR@DUT025-TGLU.fm.intel.com>
 <45226fbbc940eafc218bc2cc4a3798b41bad90d3.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <45226fbbc940eafc218bc2cc4a3798b41bad90d3.camel@intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7e8641-53e4-4111-8c5c-08db2b25d9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27CyMXLtmy/98RpVq5z3JzAMzv07h1bLfaGGVz/PEpJS3snSKFxAZ+o2KoBorZe3BeoK5zzgs9rYW5b3Cyv8CiH4cODYPuy/2rAkOOvBXygconLdcX+h/iryc9HuhJefiIqG/g08NCrAyJRxNvogTi7teZLxJhqXpZGLzck4ntSBLhPJf0SA5RmEfWT9APpq+MjqqQrB4H1iUAkynz5w061j9GcKdcZ9KqibS0Jjc5JZh4wnwaME/sI7FXOXKZp5+2G4S8fWwdaE5ztOhhGkVjM8f+lgDZwf/LIFDE2dv0OFcAMtUhs6oS8LLLp+7TS+3bDp8ZU3VbsRN7UUNRkjay4Wl86pF/R8JhQpepPh3e2K7p+LsimrJmb+qTIt+gH6KlFKyO0Hsm7cQ51tnkF1UILDvkVFKGLcnaRwyd2qPf2qLJUG7x5aTN59l0YttjW6/ZTAJbRrhFw/4+t2Z4FC9swBUOxpQinBQ4gCQCGCTzPria2NYHom9SqaY0Fqjte9MShd5WZpY4WQ7cen6VQ9TFq8cqPQlWni8yTIJ8uQGF//LwaruGiLZS4Xr19CgTu0tNIe6TSVB4LHEPxlmwNP5Drrou1yGz2TSKcNPLgxJuvXhlMo8N4NH3l0LiSGmT6XfCRy1LmmpxYBMlD7q+YF5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199018)(6666004)(478600001)(6636002)(83380400001)(316002)(8936002)(6486002)(26005)(6506007)(6512007)(186003)(5660300002)(44832011)(2906002)(4326008)(38100700002)(86362001)(66946007)(6862004)(66476007)(82960400001)(66556008)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BV1Vq9S6BSNhdLpTQninbdtXVOt9OQFWCEp7/ppKhqB1DL2FwfQtYUwslw9m?=
 =?us-ascii?Q?OHChg6rsCE8lekEjFLtIAEMzCqiXAGzs4MOm4yLMlJr0nkrYEZyvdw7ekcyO?=
 =?us-ascii?Q?DvmbkTXTs05hwfhDaPrGLns/+lqq9THVxNm0fTp9VTT6uiYa+ca19+k7Ldny?=
 =?us-ascii?Q?GXsg57aLp/LhXQIfZX7vlYz7+2GFqeTIccwqtSZFZiCg+do/RTu7hGdTCCiT?=
 =?us-ascii?Q?/Lq/xCf88gZGQREmqObtyaY3PmuwVNJBVHQCVvdzyh3xtMPYXIEqAn5fwomP?=
 =?us-ascii?Q?pq3KHramAiXMNh3QRqA/lX4Y/8N6vowsoi+zsOYIhN9fkdNQsTW3QRMaw3yR?=
 =?us-ascii?Q?lIBm9VLMguRJXNjxgTXqo4Zu0Ni9OqcTTO/JPNNaW6RpK7DWcqltzgpHRF3R?=
 =?us-ascii?Q?T2jUkOi5p8zyDpgfdyw7GwBn3UKcoxirVvb8srEQpu8MKvh7ApMyI3jehfC8?=
 =?us-ascii?Q?CqufpBobeoUdbSO14uepPN8MG2xkyu4spOYZm15cjmaW3uRZ9HGM1b4IfFZx?=
 =?us-ascii?Q?z0DVmJjirvUxIhg+qiMtr5JwXLtjgqP2XeteCPF4qDW9mTFJwmmGtf3Qw/4e?=
 =?us-ascii?Q?LV4ka5Ln+qK1USk0kurHqBSCCuaY18U1Y1k5v35di+8LX4X0T6vgDvuRvLFa?=
 =?us-ascii?Q?dRR6rB+tjOYKx3v/S3fHOLxCsYPtUNdFudtBeHAha/144GBYUbVfKlLQccGY?=
 =?us-ascii?Q?ZbBITPBbYSCRlmq/j+I/sNvegLcJwZgLOyOL02ys2Dncvu9YVbmU6dp+xUpf?=
 =?us-ascii?Q?AtbHLQGcrxWrf9CBg8iL2fBu7nUOdXAM+M/Q6PWUbABIDh0xvZi0nIrAFC0S?=
 =?us-ascii?Q?++2TUBs96naDz6HemUy456YxbWA+zDUvQdQwqvQxTBRQGkyQZPIQoxRgRfO7?=
 =?us-ascii?Q?lsuXxGHA9QBXkCG7mmle3I+1i6En7PVEBXhEMPUrVR50JXE48592cgBmJa3n?=
 =?us-ascii?Q?arGIap9uxooSKZYoaly1wtnxIYpJ8lP07sXijgcPhldLFWlwMkHuWFlKMsAl?=
 =?us-ascii?Q?3Y242hI9+iiw7EDH5jzwSS54sXnQV8Hp43EmW7+bs4X46T5pRSxHjSstX3fY?=
 =?us-ascii?Q?TFlNj1ehZoRdsEMOBQp9A5KHI8JIWfE8DstXQBEZaJCt8cBto59aEaL7Pmxu?=
 =?us-ascii?Q?NR4BhFEgtSiWTRw70t4wiYHB5UPdsQMc/iIRG56ejgJ75Vnnh6P00/ZRQzyT?=
 =?us-ascii?Q?ImBQwP9AEDFMowOXThmla2Wldpzn4ulaPPpJu+O9BBw7xK2vdRLBTZRwxOYX?=
 =?us-ascii?Q?MK9U5Lzjhngjhzd20dFF8Nfr4QGMG7Y7vGisXqU+hYmY0Wi7FNjB9GXTBNT/?=
 =?us-ascii?Q?/OIUY/gBK9eY7koC6u6xocsr88AhEENvyz0T6NFnt+QkusiZms82FgGpcCjd?=
 =?us-ascii?Q?kYRj/WeyI9vbQSclf5GbX3RWNilcG/RO+Ch7Me4I9u6gd1sWLgZO5wNNpxDl?=
 =?us-ascii?Q?aIGUFzp94DwaWpT5JyRXZNm7EMpUYTt7MF9LTxcE4mAHC4QmlwoN4L0Tumso?=
 =?us-ascii?Q?qxWJl9IE1XGmIKRvuvl5il/0+5O54ev7qm614jo+XnIyr+LoXEw0miRpH/YX?=
 =?us-ascii?Q?4TaME8pr1YBWRbKV2gXg00ZUsPsXTgP3t4Mi8Juy8fOjwTzGD7wF9WFPAV1P?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7e8641-53e4-4111-8c5c-08db2b25d9b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 22:36:17.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uem1o8C6aOOdXW+cPbWJau0ylPCM1DZgRvXSGBldsJx229T2UVPtBWiGn1NXNP49GyCHr4dbYTjepsAo+NlrEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
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

On Wed, Mar 22, 2023 at 02:55:22PM -0600, Souza, Jose wrote:
> On Wed, 2023-03-22 at 19:37 +0000, Matthew Brost wrote:
> > On Wed, Mar 22, 2023 at 10:18:33AM -0600, Souza, Jose wrote:
> > > On Tue, 2023-03-21 at 19:34 -0700, Matthew Brost wrote:
> > > > Not all hardware engines are created equally, certain instance have
> > > > unique capabilities or properties. Introduce a uAPI to query for both
> > > > capabilities and properties. The capabilities are represented by a bit
> > > > mask which is unique to each class. The properties are represented by a
> > > > name and value return in an array to the user.
> > > 
> > > When re-sending the same patch series with fixes, please include "vX" in the subject we know what is the latest version to review.
> > > 
> > 
> > Will do.
> > 
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  include/uapi/drm/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > > 
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 661d7929210c..557c9ae6f364 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -119,6 +119,7 @@ struct xe_user_extension {
> > > >  #define DRM_XE_WAIT_USER_FENCE		0x0b
> > > >  #define DRM_XE_VM_MADVISE		0x0c
> > > >  #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
> > > > +#define DRM_XE_ENGINE_QUERY		0x0f
> > > 
> > > s/0x0f/0x0e
> > > 
> > 
> > Yep.
> > 
> > > To avoid confusion with DRM_XE_ENGINE_GET_PROPERTY, would be better to name this and related stuff as DRM_XE_ENGINE_CLASS_QUERY.
> > > 
> > 
> > I don't love DRM_XE_ENGINE_CLASS_QUERY as the query is for the class,
> > id, gt tuple.
> > 
> > We definitely need to do work in general on the naming to avoid
> > confusion between a hardware engine and a user engine. Perhaps just do a
> > large find replace across Xe where a user engine -> context?
> > 
> > Another option would be the uAPI with HW engine naming as needed. e.g.
> > 
> > s/DRM_XE_ENGINE_CLASS_QUERY/DRM_XE_HW_ENGINE_CLASS_QUERY
> > s/drm_xe_engine_class_instance/drm_xe_hw_engine_class_instance
> > s/DRM_XE_DEVICE_QUERY_ENGINES/DRM_XE_DEVICE_QUERY_HW_ENGINES
> 
> I liked option 2 too.
>

Cool, in next rev I will also include these changes.

> About the new UAPI, what usage do you have in mind?
> I can't think any information that Mesa would need from hw_engine at this moment.
> Maybe add some comments about this in xe_drm.h.
> 

This a ask from media, I guess not all Video decode hardware engines
have the same features thus we need a way communicate this to the media
UMD. Who knows what else we will need to report about hardware engines
in the future so tried to make this interface as flexable as possible.

Matt

> > 
> > I'd lean towards option #2 but open to either.
> > 
> > Matt
> > 
> > > >  
> > > >  /* Must be kept compact -- no holes */
> > > >  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > > > @@ -135,6 +136,7 @@ struct xe_user_extension {
> > > >  #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > >  #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > > > +#define DRM_IOCTL_XE_ENGINE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_QUERY, struct drm_xe_engine_query)
> > > 
> > > 
> > > 
> > > >  
> > > >  struct drm_xe_engine_class_instance {
> > > >  	__u16 engine_class;
> > > > @@ -253,6 +255,48 @@ struct drm_xe_device_query {
> > > >  	__u64 reserved[2];
> > > >  };
> > > >  
> > > > +struct drm_xe_engine_query_property {
> > > > +	/** @property: pointer to the first property struct, if any */
> > > > +	__u64 property;
> > > > +
> > > > +	/** @name: name of the property */
> > > > +	__u64 name;
> > > > +
> > > > +	/** @value: value property */
> > > > +	__u64 value;
> > > > +
> > > > +	/** @reserved: reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > > +struct drm_xe_engine_query {
> > > > +	/** @extensions: pointer to the first extension struct, if any */
> > > > +	__u64 extensions;
> > > > +
> > > > +	/** @eci: engine class instance to query */
> > > > +	struct drm_xe_engine_class_instance eci;
> > > > +
> > > > +	/** @capabilities: bit mask of capabilities, specific to each class */
> > > > +	__u64 capabilities;
> > > > +
> > > > +	/**
> > > > +	 * @size: Size of the queried properties, if user passes in zero the KMD
> > > > +	 * returns the size of the properties array, if user passes in the size
> > > > +	 * of the properties array the KMD copies the properties to the user
> > > > +	 * pointer.
> > > > +	 */
> > > > +	__u32 size;
> > > > +
> > > > +	/**
> > > > +	 * @properties: user pointer to which an array of  struct
> > > > +	 * drm_xe_engine_query_property are copied to if size is non-zero
> > > > +	 */
> > > > +	__u64 properties;
> > > > +
> > > > +	/** @reserved: reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > >  struct drm_xe_gem_create {
> > > >  	/** @extensions: Pointer to the first extension struct, if any */
> > > >  	__u64 extensions;
> > > 
> 
