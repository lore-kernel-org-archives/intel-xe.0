Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA937C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 09:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBB010E139;
	Tue, 30 May 2023 09:28:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F0010E139
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685438925; x=1716974925;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4qqP8BlW/b/jSXh1IYYVhNYGVTC8Yafq3I2z9PWEdbc=;
 b=feMIZCRVWP0gIw0IinDwydfVNFiEPJpHzqhxqa4EZYwjoghyhEAqb4Vd
 DAGLq74aOgpEIklbhwmbO5HNts8BEPgznuYQIrg/oO0ASfKKMEaNTq2qh
 QHyIdAd404KYRhK9jjIBWWjtnb4DBIQ3bzBtv3mPYbcmAAFvS8VVv3/2h
 IRhgOAa6YF3DSs2GCKc1aV9bZimnEIfl7TWd8gBjukkU/BlZ+yIswY6te
 +XvoOZk2heMSZbNO7N2DpCFa4LoMcFcso4TP9bJOb1VEQ2qwQsHHXp+uj
 io1ZfgYRblJ9tT6FIZkS+GwNeqe0rfQhRVY62EKBhN/y4za7S2Lz4yKhW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357237259"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="357237259"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830667835"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="830667835"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 30 May 2023 02:28:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 02:28:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 02:28:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 02:28:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 02:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI+BRp6JZLMNiSAyH2O0dSCwFTQSx3LywKlFRf+2Cp6u7SEliuIBwb5JKQ+Ooc4XXBVk/9Rc8jrGru8XqY8y5l1WQhf/wxB2W4twfd+RGr8XbXk+XtMDSLm5OIwgix+YNXjexc9/Ew0A+iTFpXt13c3pIR54kSVvM72zrGrS5N6OqNMT8R8ZjkvtPPHFfQKaXHl1xJ1w69UxGFueUT+NFsDWWyBTBjnewbSw46bnbkeGyHnsapFHP/q68IrUamp0Bptq07VF6x1qrDoZV5qLPF98dYvouD6nckOmPkZSvbHkLzTrJFn3ctyFW6IB0CjrMMz+cQL7T0Lmj7SNREbqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ez0q8YGCwCnfgfV2fkzy5y9D1fYG3btF1U9CIW+sjXs=;
 b=OBHtv7s9wMrQfJxyG/cg/dsRzRFuIAs95zzlzzRCebxOjTrN6zFo9YUrH/zeADGXRjlJe/1yZxsY52sEGwCSNsYr3XkKzMpLJbAKxZo63ZGt1QCDGDqgkIzXvLKvvNLbTeMTXCm+y2APnugQZb04NjGXy9OcFF+vcKLSbbH2wyRunYX6CTfmQzd/WEMq2Zn6c54PgFPzKP4PjhgphZshVe28TBficUTLJiOemx9YBiMIAmSKexPyY7LWpoPA7juI2s6SaruvlqfhS0LjPangyr4QJlSfSS1oB1oE2188L++m1nVdSjehCskmJai6wsSDMe5K+3NSIiQvK4D/2ikFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:28:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:28:30 +0000
Date: Tue, 30 May 2023 11:28:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZHXBuoo1tm3nim2j@fdugast-desk.home>
References: <20230526190824.7-1-francois.dugast@intel.com>
 <20230526190824.7-4-francois.dugast@intel.com>
 <imrbklwbtm57p5x7ttv5d5tvad6oiulojl2pxaiwevdsiay5ek@ahymoyjynhaf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <imrbklwbtm57p5x7ttv5d5tvad6oiulojl2pxaiwevdsiay5ek@ahymoyjynhaf>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e502561-0a86-485e-227c-08db60f03b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVNNbeMIMGpnUuJWkwTN7FpDaU/JRuMp3mg5nA5fjazHVNohOB59T+JAyDqENe7KqJoyWF0vyGOPVDDYwBY2cJlkgbTN6xtyaYt7KgMGJT0MlkIRbhVlD6UmsYDVZUKsEYr9OmFT7nOGYh2GPws376Iq60XeqCRMHRWvwJ0BCgqYmfqBG7KiqrSHf/1sTtdei1NE4A1FGU1RZ11NKvWAjzQGGOQZ0HFDQACaaCmz6UjMLUKW9kkTSc7MFz0KOrnYuuxj0YMcTqX+ek2iJVrbtIikyzbtjm/hXNEZ7Zy5gtnuiWul9AOzT8SRsHD7zH6UkBWnD3+Vxp8CwQDAZTkvv5h+/DAEYvRdyShwteiAQTpGsMkhxdGpvjbLPJJp4IChwZ0ICQDQRzfDweFMT4lRFItRi6he8QIU4tMxr5PPj3u5MNuRdZgAB/mcRXTsurOG55DqdkZLjfU6hkBFf4JErDYIuWLNFW28LIUTjQeT6qERNdlJ8tXMIAN3bp6mrA/HPQJYxV+LFzxH0nVRc1AUTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199021)(2906002)(186003)(9686003)(6506007)(6512007)(5660300002)(6862004)(8676002)(82960400001)(38100700002)(8936002)(83380400001)(26005)(966005)(86362001)(6486002)(36916002)(41300700001)(316002)(6666004)(4326008)(66946007)(44832011)(36756003)(66556008)(66476007)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJZN1onkvMCGsxJzvoZrBW8jyJ4XA69OQTjTMu3XVrbdB0ap6jNIw15ajlfa?=
 =?us-ascii?Q?GAOqpEcBgvQ4UOdnNxmX/IjkLGpFkNK0eYlayq0iUDejLNWA3Lo665i7r2WQ?=
 =?us-ascii?Q?9BvjvFf88Mq9bW+gJy5AKPe7nrNTasNIOVWnr93ipqdbonbpWkkX9ouvO7cf?=
 =?us-ascii?Q?Z916pHqzDTh5D4vq9Ywyf2GF6Gbc1dRv2MAyyLqnzNL5pvkzkIfnPuGlWm9c?=
 =?us-ascii?Q?cA/+CxPw5xrXX909Zq4IOBNIejVtiOmIShA90m3FOBHqGto1Qjs9R7ZKO4oz?=
 =?us-ascii?Q?JAXgsvTyICS8104AZJGYpTCinUZmtYsFjTxAn2DetQ9YiTGbe0fxWueraAxK?=
 =?us-ascii?Q?ola7Yknopl2nX1rVjfBhq+Z4JpsrnmKtyQhOv5hP47pWZKNUgzBiOWmhYYba?=
 =?us-ascii?Q?BNzh5SqIG2w2N/ruVMG2gfQjnU51rcxAHKC7sSoUEfPkrj0c8+OoQ4kwvfRx?=
 =?us-ascii?Q?bEgw+S8vITZeD2JWXYXed6Sc63dk8NfF2yaReiIKhIWxty/FP++ZODBjy71Z?=
 =?us-ascii?Q?RE7iTnIpeXicKkGw5AiC/f8MplTXw7aVbiAUtAISshsMEmEeJeik6bwN11xZ?=
 =?us-ascii?Q?RAM+HwxSSpNFRzEHG9eJiC+mz7B21nDv/TUhrrkbceivz16NJHaOWfRkQvEv?=
 =?us-ascii?Q?HCL7Gku9iMKJm/MF94FunCb9AzTCGt04tdQjVV5HW95yvFP3yU1IB6xTBea1?=
 =?us-ascii?Q?oZAi3dg8dEIrn9ez0vPY6qaXKMVlEqGii+lflzO+u0gwrH/M2Jt8FktwglcY?=
 =?us-ascii?Q?bLKWGZDoOPJ+xoHyIq8qAyBGzAPvpmEkPHWGVqhftjooTOQYA0ao2kBkC6xX?=
 =?us-ascii?Q?OuQDOgKhWLKqrbullSJ5XHq8YEZhNK9Zj2EDpsh/W5KzbpBTqoCq2Y/kyMfM?=
 =?us-ascii?Q?XSzvLdY1VdXixVYcp+BoIDWJBqDY+blCI4NvxhPWwhC02uHfJBDGRl7nazXY?=
 =?us-ascii?Q?59qAGK+FyNZFdZCXZb+XXZBOWZauXk3N4bjEZqDSpsAQUhziTvE5tzJINADX?=
 =?us-ascii?Q?5/D9LWEFJHkuKYoyUF9yQIfQPuT95a9Pz4RjSzYgeAMv5hn7Z7NMdWD3oNBe?=
 =?us-ascii?Q?oN2/3JW7E00QTrygObzr6oB6JyJy4DSU1crE3RpUJhZXoiXzi/7uqzKwkqFI?=
 =?us-ascii?Q?ppjr7/0NzwB00CQyncqWJp0RAjWf/cI3oJBaMTxtmxrdGMVJmMmFyhNCA/1F?=
 =?us-ascii?Q?r3QqdbxtDAaZIQOCcBPq/+2qZB8WqIVIgfLUDB8mYieSL592dMkeSSMONdJb?=
 =?us-ascii?Q?lwH8FTsyy0d7mWJdj1tG8YwHrwPpvljzoAUicmgvwG41sePlzeezmr6azTRW?=
 =?us-ascii?Q?NGubGxL4LaYzm2dghl/MC6M26m9y3BmFjcmUj4BWEf0aA8bZ1AqF6sKMex30?=
 =?us-ascii?Q?ksubpjpWzijL2PtOoqsho4VW+FoBXsTTGRDmMb5T+KMkRtrxlLJ8la9V8DyQ?=
 =?us-ascii?Q?O+Iy2bFSGCADUhYFJ/1bvKydP+7D23YctAraqJ9ZhhjpObRZSncb4NC0bjur?=
 =?us-ascii?Q?Pv0bBoixW8JMsUCKj09peUbONm8QG9v6UuqS4dgaiR/f3g20EpC3zG2dkRLo?=
 =?us-ascii?Q?cgJuRxu7LTK+ED9NFFTomZg4EvIQbdAzsPTA9dSv39Eg0+cx/xMqlMTOjHSZ?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e502561-0a86-485e-227c-08db60f03b15
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:28:30.5758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXTZynlvuudkBAXlvGmxy6+wX7OPBsT1cg6R9574m4BJK/AVjajFiJAUcQpC8NgSNwCElZj6M55xyQ7GTE59qEOGCQkrJf3DvCPSIwN5vWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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

On Fri, May 26, 2023 at 01:35:51PM -0700, Lucas De Marchi wrote:
> On Fri, May 26, 2023 at 07:08:22PM +0000, Francois Dugast wrote:
> > Align on same rule in the whoe file: defines come after the
> > relevant fields.
> 
> is that a convention from somewhere? See below.

Not that I know. It is one of the patterns previously used in this file but
I am fine changing it to what you described below, in a new revision.

Francois

> 
> > 
> > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > include/uapi/drm/xe_drm.h | 40 +++++++++++++++++++--------------------
> > 1 file changed, 20 insertions(+), 20 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 5d34b570a305..160b0aad4a96 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -116,9 +116,6 @@ struct xe_user_extension {
> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > 
> > -#define XE_MEM_REGION_CLASS_SYSMEM	0
> > -#define XE_MEM_REGION_CLASS_VRAM	1
> > -
> > struct drm_xe_query_mem_usage {
> > 	__u32 num_regions;
> > 	__u32 pad;
> > @@ -135,9 +132,13 @@ struct drm_xe_query_mem_usage {
> > 	} regions[];
> > };
> > 
> > +#define XE_MEM_REGION_CLASS_SYSMEM	0
> > +#define XE_MEM_REGION_CLASS_VRAM	1
> > +
> > struct drm_xe_query_config {
> > 	__u32 num_params;
> > 	__u32 pad;
> > +	__u64 info[];
> > #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > #define XE_QUERY_CONFIG_FLAGS			1
> > 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> 
> I thnk it would be much cleaner to go the opposite and ensure a newline
> in place so it's not ambiguous.
> 
> struct drm_xe_query_config {
> 	__u32 num_params;
> 	__u32 pad;
> 
> #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> #define XE_QUERY_CONFIG_FLAGS			1
> #define ...
> 	/** @info: .... */
> 	__u64 info[];
> };
> 
> Lucas De Marchi
> 
> > @@ -148,7 +149,6 @@ struct drm_xe_query_config {
> > #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > #define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> > -	__u64 info[];
> > };
> > 
> > struct drm_xe_query_gts {
> > @@ -161,10 +161,10 @@ struct drm_xe_query_gts {
> > 	 */
> > 
> > 	struct drm_xe_query_gt {
> > +		__u16 type;
> > #define XE_QUERY_GT_TYPE_MAIN		0
> > #define XE_QUERY_GT_TYPE_REMOTE		1
> > #define XE_QUERY_GT_TYPE_MEDIA		2
> > -		__u16 type;
> > 		__u16 instance;
> > 		__u32 clock_freq;
> > 		__u64 features;
> > @@ -231,9 +231,9 @@ struct drm_xe_gem_create {
> > 	 * @flags: Flags, currently a mask of memory instances of where BO can
> > 	 * be placed
> > 	 */
> > +	__u32 flags;
> > #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
> > #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> > -	__u32 flags;
> > 
> > 	/**
> > 	 * @vm_id: Attached VM, if any
> > @@ -294,8 +294,8 @@ struct drm_xe_ext_vm_set_property {
> > 	struct xe_user_extension base;
> > 
> > 	/** @property: property to set */
> > -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> > 	__u32 property;
> > +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
> > 
> > 	/** @value: property value */
> > 	__u64 value;
> > @@ -306,8 +306,8 @@ struct drm_xe_ext_vm_set_property {
> > 
> > struct drm_xe_vm_create {
> > 	/** @extensions: Pointer to the first extension struct, if any */
> > -#define XE_VM_EXTENSION_SET_PROPERTY	0
> > 	__u64 extensions;
> > +#define XE_VM_EXTENSION_SET_PROPERTY	0
> > 
> > 	/** @flags: Flags */
> > 	__u32 flags;
> > @@ -368,9 +368,6 @@ struct drm_xe_vm_bind_op {
> > 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> > 	__u32 op;
> > 
> > -	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> > -	__u32 region;
> > -
> > #define XE_VM_BIND_OP_MAP		0x0
> > #define XE_VM_BIND_OP_UNMAP		0x1
> > #define XE_VM_BIND_OP_MAP_USERPTR	0x2
> > @@ -410,6 +407,9 @@ struct drm_xe_vm_bind_op {
> > 	 */
> > #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> > 
> > +	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
> > +	__u32 region;
> > +
> > 	/** @reserved: Reserved */
> > 	__u64 reserved[2];
> > };
> > @@ -476,6 +476,7 @@ struct drm_xe_engine_set_property {
> > 	__u32 engine_id;
> > 
> > 	/** @property: property to set */
> > +	__u32 property;
> > #define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> > #define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> > #define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > @@ -491,7 +492,6 @@ struct drm_xe_engine_set_property {
> > #define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> > #define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> > #define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
> > -	__u32 property;
> > 
> > 	/** @value: property value */
> > 	__u64 value;
> > @@ -520,8 +520,8 @@ struct drm_xe_engine_class_instance {
> > 
> > struct drm_xe_engine_create {
> > 	/** @extensions: Pointer to the first extension struct, if any */
> > -#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> > 	__u64 extensions;
> > +#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> > 
> > 	/** @width: submission width (number BB per exec) for this engine */
> > 	__u16 width;
> > @@ -559,8 +559,8 @@ struct drm_xe_engine_get_property {
> > 	__u32 engine_id;
> > 
> > 	/** @property: property to get */
> > -#define XE_ENGINE_GET_PROPERTY_BAN			0
> > 	__u32 property;
> > +#define XE_ENGINE_GET_PROPERTY_BAN			0
> > 
> > 	/** @value: property value */
> > 	__u64 value;
> > @@ -686,26 +686,26 @@ struct drm_xe_wait_user_fence {
> > 		__u64 vm_id;
> > 	};
> > 	/** @op: wait operation (type of comparison) */
> > +	__u16 op;
> > #define DRM_XE_UFENCE_WAIT_EQ	0
> > #define DRM_XE_UFENCE_WAIT_NEQ	1
> > #define DRM_XE_UFENCE_WAIT_GT	2
> > #define DRM_XE_UFENCE_WAIT_GTE	3
> > #define DRM_XE_UFENCE_WAIT_LT	4
> > #define DRM_XE_UFENCE_WAIT_LTE	5
> > -	__u16 op;
> > 	/** @flags: wait flags */
> > +	__u16 flags;
> > #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> > #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> > #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> > -	__u16 flags;
> > 	/** @value: compare value */
> > 	__u64 value;
> > 	/** @mask: comparison mask */
> > +	__u64 mask;
> > #define DRM_XE_UFENCE_WAIT_U8		0xffu
> > #define DRM_XE_UFENCE_WAIT_U16		0xffffu
> > #define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> > #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> > -	__u64 mask;
> > 	/** @timeout: how long to wait before bailing, value in jiffies */
> > 	__s64 timeout;
> > 	/**
> > @@ -736,6 +736,9 @@ struct drm_xe_vm_madvise {
> > 	/** @addr: Address of the VMA to operation on */
> > 	__u64 addr;
> > 
> > +	/** @property: property to set */
> > +	__u32 property;
> > +
> > 	/*
> > 	 * Setting the preferred location will trigger a migrate of the VMA
> > 	 * backing store to new location if the backing store is already
> > @@ -771,9 +774,6 @@ struct drm_xe_vm_madvise {
> > 	/* Pin the VMA in memory, must be elevated user */
> > #define DRM_XE_VM_MADVISE_PIN			6
> > 
> > -	/** @property: property to set */
> > -	__u32 property;
> > -
> > 	/** @value: property value */
> > 	__u64 value;
> > 
> > -- 
> > 2.34.1
> > 
