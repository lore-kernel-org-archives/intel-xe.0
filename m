Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D654E92726
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F8110E482;
	Thu,  5 Oct 2023 18:41:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B8010E482
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696531301; x=1728067301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VjWfh70Io1SegLLmJlbbg8WyoKgyiDVhZMCUNso0POY=;
 b=ekHtyJuoZJ9iYvCV/k5WYJggQRJomItRKdyib6KftrkwP0sByfABUYkO
 MWpUWAGp6QIAuKJy2HF6sdW9t7JmfXOl6NULy30tAxYqmSESMRPHXThmm
 kZyXAupHnhfSihNvynTwj7H1YTvhoP5qZybs92ZcxK3gHlcNF5Wbk0ocb
 LshSArJnKruQhUr5jS7LmLAyMXmgMmtL1ZjoGABO+siFt40fHCyotCF4Z
 OrQy0qqfno3SF5fEkzcaJ26vkjN7lLGicEOi3DwwK7dQsijaUJ8Yo1TG4
 ldL4d9xaocaMeyQUq+v70cH0vFaSvlnFypKJzZo21zn2QaX3RYqfmeuz3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380860110"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="380860110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 11:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="822232718"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="822232718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 11:41:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:41:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:41:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:41:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHGMjA84Onima6j/OW9latNYU3EDmzjdb2uSvW3jVz4A+YcU6a4dcnGXZzZyVRRh2muYU5Y5gokgSMs5rInQXbF/Ei6+xkkgpufSGPM/DgF3EFWxvHgueGVm01otkwARhALYxIt4dRAd+r3grc1Fku/OgH+M5NtTdUHXZcusf0VozfQq78WmU+vfzsUavz1A8H95Uvrmj3m0r5JIXrIbO4Z5/Zhby4fRc5vsVudml/OwNTvln8CIVTC+sCapkxooXCoJcgBXMZOEpK2PjbBlo6VJoSjUDRNJkrRrbU0/gMK2zRPt+EXhVDdTXtkyK9YoDzLvEp7PSZTjf0jHLPn3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwWHnsTXln7VYgN1X+iXg0FbvbDBGjF44nlQgyyQfzY=;
 b=GXVyulc1PeQIQaj5R1ch56nMT43WpxukUpsbn9iUu7x+eES4KmMF7pKyHhzFHAiAK+iieFqZw+U61XhBWlMjnjAqGEyD5E/OtQOjYbPyqChpLrNn3oJo9phH9OlXY1+fWvpLFyiI8PiKRovjO+S0Aj08VxhYO4EG+xtR4QV2hx2aK4WrkFjjEKspYOQu2tAWEebVPLAbbTqj2YJPYeJ0jsJx6QXtgqWJe9zK8dkdhoBJCOnZucRsKs96uSk5+A9Sio/z+jmCB5MAjGxpWU2VFnexWfdSm0z2kwx1XNYw7y0dwlaY8bzKnUigfiPi8k54dicRxGroTfgdh0tVTLLc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Thu, 5 Oct
 2023 18:41:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:41:37 +0000
Date: Thu, 5 Oct 2023 14:41:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZR8DWVeXtkrIU8Uj@intel.com>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-3-anusha.srivatsa@intel.com>
 <87fs2qg6pe.fsf@intel.com>
 <xgggupdygmhbyruwqgr3d3hoorvokgdahfqpfdnhb64qna23mu@zlcb3borrej7>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xgggupdygmhbyruwqgr3d3hoorvokgdahfqpfdnhb64qna23mu@zlcb3borrej7>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f7bb40-d7d6-464a-3e77-08dbc5d2b2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcEkUqhNXTnPUkvudRYLcEcbG9+J5HQPi+6pNkx7A6BfKIzq54VQvqE8szv3zIhmsL51i4aHvj5MGOL0BvIhqP8lDOtYUxxN8mGM9dXWjOAmJJZC8f6H0RStzPaOEewvlIWUsN3sSlQoS70LO6dYnqm/g8Pj7CLR1e9AHUxHUQqsCwS6BVdjLCIyArXoahGUTkAy2FNME0xd0IQX0KiXCVb6zWtgG0MkpzeFAP47BX+/yDespbitbbqBfi7RmIKr06M6dWF/UcdvRt0xZl7yKgwdc30PsA2Nlgz+rCz3rswIsGaeepqAohHeaMXFo+61bou4+blMHUF8K+LJcQZHf3mcsGm0QzqK90XacG1xUmWMDfMGmrt27WeJi3YjJaDevasoDQBnitc1AkyiYZsMyrAKyAYsPedNajyVY0iLPG7N6yCE8246l7c45u1d1+OqMD62ICJISdoyJeqFxtFFmB5JzYhkGaEoK1VutWemxrdEqsPEHK/uh6aBefhNoDayKHUiQGectq5gKKqpt4cuq8/YvukupofRcv+jO0jYv/jWQCsWuEpXPQgtwjH2pCEo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66556008)(66476007)(37006003)(54906003)(66946007)(6636002)(316002)(41300700001)(2616005)(6512007)(26005)(36756003)(6666004)(6506007)(6486002)(478600001)(38100700002)(82960400001)(86362001)(83380400001)(44832011)(2906002)(8936002)(6862004)(4326008)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f6BuT+7iYRKKOiB7AE6dcero1mWI/pKxSFZoDrMK81ULYuyks3zWaXqlnkm7?=
 =?us-ascii?Q?lUFjtr4stztUIcTW3ipsI8F6PFSNtKrBnfS9fcwe7w5J5haUpGART8zfZOLr?=
 =?us-ascii?Q?cATj5YqB388gdFrsoKE4Q6wp+jwib8OxhqndKojc8lIi2MLpm4k9wDNzU/9h?=
 =?us-ascii?Q?Kbf3SLyfvFxgVmr+N9k6LkYC5aExv2+jemZmFfeWJwvbVf/J1/sUq1XfVlgH?=
 =?us-ascii?Q?gTL5OyWnrJVxm1k8xyQTST0eCGAFG0mI/ljRdRgrNEvON8xKhTVpyVMnE/cZ?=
 =?us-ascii?Q?IIgvd9vqD3kKBJOguv1vbyCE9rXLqjc2uNeEnfZz8egF5nsFbqJiyYDmHWdC?=
 =?us-ascii?Q?X++8+1S+/tAq4R924skauzNteYXrxQ0UTxt/9rAhD28HCtnwZtcko4WGdslw?=
 =?us-ascii?Q?XwFP2/V+XL/ORHiN9J0rfBj/zdxMs7eKV0DSJIEv4EwP+HoP8+SVBJQCRMPJ?=
 =?us-ascii?Q?C6/RhvZd5XHgd2tk+SRlssid7Vx9P7S6ZCGuziXNprCoqGTOwpYrZRamkAcO?=
 =?us-ascii?Q?dfHU6oFOBcV4OZ71NvP1GNAIwcGrOMxxw5JH/E5vLel9uXcJ4PvRZvPUmbE/?=
 =?us-ascii?Q?j+pw5sKbwu9SrtIXBQcdMZPK6KVNrYUO9d38WPBLGc5MEzoFyH2yWACFWqH3?=
 =?us-ascii?Q?8d65yFMiwVjGF/I4RDQh/PHTgDX4wOTL31QB+tT3w6mVSFCtzj7KVcrQxufe?=
 =?us-ascii?Q?83hmgF0fQng23sZjRyk48ZuQRxNDaUTAkaxYRgA4GirSjCDcdeLf+jP0RMuZ?=
 =?us-ascii?Q?igj0sf6eulwHFks8EmtBFz1IkSpD3Pst0wiyJcn+qnU+oRRHSqDFi3HmZltB?=
 =?us-ascii?Q?4Ls2BaLw1f1Fo/62a3lDg8dn/ICuMPlBwYhqDe0yKQoNznVUbt8ZxyVi2KC0?=
 =?us-ascii?Q?cEIO2rz2/3MtNucNFX9L34l9EVpgYPw0pc7t9A3+AQyuZ+OIWv6zMOdnxkO/?=
 =?us-ascii?Q?/wkAve+491SiFWXQfrou2v01n3gYx3XibBP3iJuObh8VxIZt9Z9GRVJxlTKb?=
 =?us-ascii?Q?SyrkIZko3QzUsy/9gRDfGV/nBa7D1McKMS+aZXCCSXVgbVH522KwsOpLk851?=
 =?us-ascii?Q?eYEbryGvt2r2XICX7qh/B79jnBaLPxKLTDJQwvaze4jXrM8WL58cz/MFx3Ux?=
 =?us-ascii?Q?gevo/V8XqO8QY0zSkHZW0iVzjLc24WmaeSWe2sZQzBHMi5Y4yvpoR//FJWSz?=
 =?us-ascii?Q?25/q2Fl0QtOAvNzYTxsEzLPXO8CpPfkrDISrYprf6Yw4GYNOipp9EghD3n8j?=
 =?us-ascii?Q?vn7unnZfkvMFtU3NerPnPQ39aOIKL3TIW4nwiX8rAFCuvbVDOCWO22Q/wbF3?=
 =?us-ascii?Q?2y13yNQAMwoKWtXvGrIXjmZTn17wxmvtZhNiWi6FblMO9pEg7VAHQZbDCfqc?=
 =?us-ascii?Q?P0HiqJOEJIljuZ1JE6rO+WB2TX+aDj+dr3z6BBUkSb64gr7vlcX9OWXNsMIF?=
 =?us-ascii?Q?acAD9nVFs01nTM4uat/ZZi1pgzSJJ5yki2vMFjjyFSsiAl8LFXgUK2sYlYkM?=
 =?us-ascii?Q?FTy1/S8CaGHBb2sUejENKG5uUrRlW6gkX9/PjRoTSJZJVuuoeNwyAwOcor8Q?=
 =?us-ascii?Q?372V0Lzfx4y3/cUQnOeG5XdmMFhRdCkKCAuQBj7i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f7bb40-d7d6-464a-3e77-08dbc5d2b2f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:41:37.9325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv5YBOXUKMb4pkTSoDmP7YVRNrZxFf6CL6Nybm25+ibeJXoaKXiK5gPopQtWYBNhvlFaTGWiq9Td44+oiLIm6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 01:16:48PM -0500, Lucas De Marchi wrote:
> On Wed, Oct 04, 2023 at 10:58:05AM +0300, Jani Nikula wrote:
> > On Tue, 03 Oct 2023, Anusha Srivatsa <anusha.srivatsa@intel.com> wrote:
> > > Extend the change introduced in the previous patch to xe
> > > driver.
> > 
> > This is not a fixup to the previous patch. This needs to be a fixup to
> > the commit that added the file to begin with.
> > 
> > The order of the patches will be changed to add display enabling last.
> 
> 
> assuming we are still going to move display up. Rodrigo mentioned
> recently about maybe stopping that. +Rodrigo

I hope we don't need to move them up anymore. but let's revisit this
in about 2 weeks.

> 
> In this case the commit message should be:
> 
> 	Subject: fixup! drm/xe/display: Implement display support

since this is the fixup, then the right placement is as first patch
in the series to avoid further conflicts when autosquashing without
moving the rest of display up.

> 
> Lucas De Marchi
> 
> > 
> > BR,
> > Jani.
> > 
> > > 
> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > index 7c825f129166..918dd27868fa 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > > @@ -146,7 +146,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> > >  #define IS_DG2_G10(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G10)
> > >  #define IS_DG2_G11(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G11)
> > >  #define IS_DG2_G12(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_DG2_G12)
> > > -#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU)
> > > +#define IS_RAPTORLAKE_U(xe) ((xe)->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU)
> > >  #define IS_ICL_WITH_PORT_F(xe) (xe && 0)
> > >  #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
> > >  #define to_intel_bo(x) gem_to_xe_bo((x))
> > 
> > -- 
> > Jani Nikula, Intel
