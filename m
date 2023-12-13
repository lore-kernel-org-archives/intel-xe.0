Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38246C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AD510E7C4;
	Wed, 13 Dec 2023 18:03:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E877D10E7C4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702490627; x=1734026627;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lQJ8pDEzi+IDD1lswHJVBEjOxvx6eYe1aXAiTHZCoX8=;
 b=XI3n2M/2Ue52piAXIBw6eOTmMndah3hpCEx1eaVyg5NJ20LGaXCYxuzW
 JGHml33NiINVyQ4QY5rMBY7oqvsE2itPs9Zj/xsgQFNeVxn37rR1Sv3Ay
 dqD39h0OmkKydKQwfKnq1Q+grMk16eal3LFpoUQrHvHV6G0xbMDZVszee
 OmX6R+JgMUjrReIkfpR844cFD8/VIbv6ykYT3OQSK86r9XypOYMETja+M
 3dznXjNyGnP021GwISr3/rdHQSfIfbJWqCoeCdbIA+TFHdmMaCLmFN5F2
 2VnMNEU86KIUE6LmXHm7lfEN+TozMaqG5O4kcRy6xa5rqdQsFsKJhSdoC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1859605"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="1859605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844406526"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="844406526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:03:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:03:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:03:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:03:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:03:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATL94b8SUTm2Jgx+sQYM8iswz3n8P/hDX7hFEYOzhOKbJ3M7A1gTxOC6XKFXKnkiXaRAFLBEp6vXGuCwa99CE1D7K1Yqptv3mwuy7lbY+ymVHPxV77/Kd3IaaROFspWvWRhVa09K82BvwhOElEv5p82m4o7/M6a5N6HOIryUocAcimbsy/nso/IX3IVwyFozDtZs4jQfD0j6bs22FmjjawTcl9Ox1hwEBpLpFYWTBZ9dAELUuVahDOIMel0TQLL5hxdhrOoR+jkgAXATtiNr4bWEVIDPJcwU1eabdNYK0bx9BMfVrBICDi7lyMr4nsNAoo7Uz8WfPap0iGLAQ7Rx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0prtj3+6SGUTEKQJ4pn9CNgP2xBL6OiCccZrqqujQA=;
 b=TRhWq1YOul5JCqjAki5Hc0AcPfbzeyx3C6htse0K8nmPVZJjTN6FKWY0p7hfJAqf8iaw//TTtJOTV4qF7opJw9ji/LqWY+W8m8SgEbUhvaC4lUjcV8qWY8s+G1zjpGw56tqSHvVUp77JjaEBEOx1eEpPDvDcEZrN119aazKXpCL8IJVoOBSym6rJKWfVKAtMj5+H12aMVzux9DgLQcLj2KDZjUkNz3N+8ZgJg/3gtD9CdToQqlIUM0F1wYNcUUdR1E50yJsgnoAKb4SoRIoOqfbayny4UkTITr+RnxMdBqV1JeXIi1pEtZFs0RludKw2CAC5svsHBSH99imwG1RieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5350.namprd11.prod.outlook.com (2603:10b6:208:31c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:03:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:03:36 +0000
Date: Wed, 13 Dec 2023 18:05:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXnyZZL+K1pIWRGj@DUT025-TGLU.fm.intel.com>
References: <20231213043517.609363-1-matthew.brost@intel.com>
 <e9f53dd5e339606c180da23ae3ebfb19e1bb50fd.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9f53dd5e339606c180da23ae3ebfb19e1bb50fd.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b6e452-0cdc-476d-f7ee-08dbfc05d406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3JRQihjBTdoleN4hU4SJQwyxZVbg60+Aa4q2AmC870Q8CeppE0RCb4p4cG/6wiE3QIYKgk6nTavv6FEBLAsQjRk/jC8AKRM5hDN+LJG2Nt9CjbGLdm+3ZNSa807PFHzYejAPce8hzBQ5wC3IXK6FLV9YOVsavk74ZrePsyo+7e9FQBrxqUWkuADRx8LzftZxycYrGzOxXm8bjXQ6XdiG4PUwYA7KrEZ0nKeW4UXFfAmb5rvZtDFT0Oimc7gxCPjtkGhnBV6FCBFi8uIm3CMDF1b9i41aXpmxdP06CTP6bSW1fJrqT5n10YiBhfnsd3+o78vcM+Q3TSdGlW8xppOgvjFmsx3ou3HJ7t+fM1slZ5AzlQ2Vz5OlYCVe+nU6MIEu5fgfgOhNCifQHi4rSBNJ5m91b8m0/VBhX9fZSNZ1QJI3pAytPpDH/XWVA7KvVZITnFUqd+NOPWdFvr3RLO3QPrmNyRQ7SHRpUS+BmI87w6crAw7AcxXyM1nyqHsC3rNdGg0jWh2aWrWVlMSlgYe2mIbqy2wX6mFMGxi+eOf2p/A85Bn9QeVMDiO646mmZhJUszFkYM1jqB0yjH59Hs5uMf/Nw59jnq29Gu5GiP8XRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(44832011)(6506007)(38100700002)(6512007)(66574015)(8936002)(5660300002)(4326008)(26005)(8676002)(41300700001)(2906002)(4001150100001)(6486002)(6666004)(30864003)(478600001)(54906003)(316002)(6916009)(66556008)(66946007)(66476007)(86362001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RaeGHGsX04u+JYp22IQqc3t8V2N1I6u+ZyZodFRUoIYiFG9hrBWh/KfCOs?=
 =?iso-8859-1?Q?05Lp+RRNSE7T3nkb2AacN4cNvsBeMW/G81OI5A8PUVnk+Lr84VfJTMBAWE?=
 =?iso-8859-1?Q?P5V/GacXwRVHQ76t0WKdjhaa2kankig+4iXqFoihJJ+dZXAZjbIWNlIATg?=
 =?iso-8859-1?Q?R9E9lZglmYlYKM0a4aAIpeGM8W0DTpmPNSw2ufFCJYhkZpqMBjiQXcrDd3?=
 =?iso-8859-1?Q?t+hZTLPTG59sKMJj+ogXVunnY+yrCjXmAKlslbS+ym+6IdEvilIgat/xHu?=
 =?iso-8859-1?Q?/4E25/eE/Hq6M/AOJWzO5tonsGoXsD1LQAwlPej3m35HtMbRGiuf1ERBB7?=
 =?iso-8859-1?Q?NZ9OFa55LuSseZQth+BVq5bAD+YQyQ9wdJx1dQmeVLxFoSJSObrhld3ZP/?=
 =?iso-8859-1?Q?qgbuhjfwj6sBUmSJfufG1tQHhmyZgc9waIhxHrhxjlQXq/+jG3aVYITKF+?=
 =?iso-8859-1?Q?cow2rBPB98wfTUb9vf8XdcWvJWgdh6HjY/jApsPhaBCp0A/+wIVEAbuDdq?=
 =?iso-8859-1?Q?vvHktWkh/7uIGbmVFDDdG0+cOD7/N5+Wy33lSy/ZMK5XfLRYylxZNmhwaa?=
 =?iso-8859-1?Q?IZqGX3Pn5CF2ReYZwf2kmrOau8yf8vU6zmxYWbSZGWyP5NmxOhYNgScR0R?=
 =?iso-8859-1?Q?M6/8OS0R4W4NHQfojdz3tEHUEOeW+zxe7diN/2TR8HDzid0qKx0MwuyZN0?=
 =?iso-8859-1?Q?uwzYGwQszguhuHZIHTvoVbxPkRQj1Yyw5FshV64zo5QCjTASD5TviSGhsn?=
 =?iso-8859-1?Q?uv2gRXNS8Mli8kCrGPzAb8dZqQ2SShsJcscpfQExUBYG1MhWvXWnAy3+2j?=
 =?iso-8859-1?Q?uhB0Iz+wtC2r8VZRg+RGARj+FeBb/rM8BwsQXqkqW3Yq4CHp3OrgpZDHHy?=
 =?iso-8859-1?Q?liN84mgIOoDOFdWCAovLu6w2JY3/6xyK6nbOkmfbfNLu0lptPOe2B2SuKK?=
 =?iso-8859-1?Q?JWX2AXVf29Z1vzu1JrRtL768RQoaI5AUT/VTEipIFtMhyofggxGLsyWkIC?=
 =?iso-8859-1?Q?ZNjGKSjJB1mUlS+dZKhgM31E7J4beABEOsK0c8v+uUfkaQTDt/fLXvpbdA?=
 =?iso-8859-1?Q?F62bvzaqv1V2pQXP6/8Cujmr0XVuJ4dw53rQeD61Z8UXk9U6hQTSEL8+9x?=
 =?iso-8859-1?Q?5oanmNIB2+BJtZ9K66sD4c+cPvitIeNVmyZgfLxIJCgG53ZiaLAxPOwk+E?=
 =?iso-8859-1?Q?xZWxWP1e925CD5XhRXn+zh8o9+VbliuatX9m0Oa/Sww/5Io2LHmdYgA/q2?=
 =?iso-8859-1?Q?DewGOAKWjD2IvO5lZm4mQYjf71MJEMwaYsaRC1MweHupZKLEgjKFko+ZgR?=
 =?iso-8859-1?Q?PEtGcv+ibY/ryIljb8RG19lXTAg4+tg53rx42mPKI6vL/1PsWsHG0TdstS?=
 =?iso-8859-1?Q?cuBes9CO4Uqg96+kxD/Lu+atxJXhWlBx6Y2XQqqhwlh+e6yTVLhbnHOGKa?=
 =?iso-8859-1?Q?egMgzNHIcmEmMYG4Aics2p5korauCNaxkYh+co9i+b50d0D3T9zS430iCM?=
 =?iso-8859-1?Q?h1V2z7OrNO4eCLiEIRnRS9hdcWeTlsQvqF4zEN3e2H/LmT5pxYeOeKhDoh?=
 =?iso-8859-1?Q?3+YZvUXVnfbnNEHNu5s6b82Z8LGwasvVmaKlntIy0rqKh1WLvabnMBl5Wf?=
 =?iso-8859-1?Q?hywcXttArR//tkURgEGHM/72PtK82djHfKj1B0dyVWjUeVD6MfvgcWDw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b6e452-0cdc-476d-f7ee-08dbfc05d406
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:03:36.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znREG1vxqE2SVrzP2nvOpVmQlt5JKGLfjCp4qBM/YWNPePpDfAnJJDWL+Z8GGg/jN84Lx9K2/thW8TzK9PP8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5350
X-OriginatorOrg: intel.com
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 11:24:12AM +0100, Thomas Hellström wrote:
> On Tue, 2023-12-12 at 20:35 -0800, Matthew Brost wrote:
> > Remove concept of async vs sync VM bind queues, rather make async vs
> > sync a per IOCTL choice. Since this is per IOCTL, it makes sense to
> > have
> > a singular flag IOCTL rather than per VM bind op flag too. Add
> > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
> > this. Support this new flag for both the VM bind IOCTL only with a
> > path
> > to support this for execs too.
> > 
> > v2: Add cookie, move sync wait outside of any locks.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Some minor things below, 
> But I don't see where we read the cooke and bypass the submission to
> just wait for the last fence where *cookie != 0?

See other email to Jose and you.

I missed that part and can fix in next rev if we agree to the uAPI.

Matt

> 
> Like:
> vm_bind()
> 	commit();
> 	wait_for_last_fence(); - Returns -ERESTARTSYS;
> 	set_cookie(1);
> 	return or restart;
> 
> vm_bind();
> if (cookie() == 1)
> 	wait_for_last_fence();
> 	return;
> } else {
> 	...
> 
> 
> 
> 
> /Thomas
> 
> 
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             |  12 ++-
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> >  drivers/gpu/drm/xe/xe_vm.c               | 116 +++++++++++----------
> > --
> >  drivers/gpu/drm/xe/xe_vm_types.h         |  13 ++-
> >  include/uapi/drm/xe_drm.h                |  64 ++++++++-----
> >  6 files changed, 109 insertions(+), 105 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index ba92e5619da3..8a1530dab65f 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -104,7 +104,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         struct xe_device *xe = to_xe_device(dev);
> >         struct xe_file *xef = to_xe_file(file);
> >         struct drm_xe_exec *args = data;
> > -       struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args-
> > >syncs);
> > +       struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args-
> > >syncs.syncs);
> >         u64 __user *addresses_user = u64_to_user_ptr(args->address);
> >         struct xe_exec_queue *q;
> >         struct xe_sync_entry *syncs = NULL;
> > @@ -120,7 +120,9 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         int err = 0;
> >  
> >         if (XE_IOCTL_DBG(xe, args->extensions) ||
> > -           XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args-
> > >pad[2]) ||
> > +           XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args-
> > >pad2[1] || args->pad2[2]) ||
> > +           XE_IOCTL_DBG(xe, args->syncs.flags) ||
> > +           XE_IOCTL_DBG(xe, args->syncs.cookie) ||
> >             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >                 return -EINVAL;
> >  
> > @@ -140,8 +142,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >                 goto err_exec_queue;
> >         }
> >  
> > -       if (args->num_syncs) {
> > -               syncs = kcalloc(args->num_syncs, sizeof(*syncs),
> > GFP_KERNEL);
> > +       if (args->syncs.num_syncs) {
> > +               syncs = kcalloc(args->syncs.num_syncs,
> > sizeof(*syncs), GFP_KERNEL);
> >                 if (!syncs) {
> >                         err = -ENOMEM;
> >                         goto err_exec_queue;
> > @@ -150,7 +152,7 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >         vm = q->vm;
> >  
> > -       for (i = 0; i < args->num_syncs; i++) {
> > +       for (i = 0; i < args->syncs.num_syncs; i++) {
> >                 err = xe_sync_entry_parse(xe, xef,
> > &syncs[num_syncs++],
> >                                           &syncs_user[i],
> > SYNC_PARSE_FLAG_EXEC |
> >                                           (xe_vm_in_lr_mode(vm) ?
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index eeb9605dd45f..a25d67971fdd 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device
> > *dev, void *data,
> >         if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> >                 return -EINVAL;
> >  
> > -       if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC)
> > {
> > -               bool sync = eci[0].engine_class ==
> > -                       DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > -
> > +       if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> >                 for_each_gt(gt, xe, id) {
> >                         struct xe_exec_queue *new;
> >  
> > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device
> > *dev, void *data,
> >                                                    args->width, hwe,
> >                                                   
> > EXEC_QUEUE_FLAG_PERSISTENT |
> >                                                    EXEC_QUEUE_FLAG_VM
> > |
> > -                                                  (sync ? 0 :
> > -                                                  
> > EXEC_QUEUE_FLAG_VM_ASYNC) |
> >                                                    (id ?
> >                                                    
> > EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> >                                                     0));
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index c7aefa1c8c31..0f7f6cded4a3 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -84,8 +84,6 @@ struct xe_exec_queue {
> >  #define EXEC_QUEUE_FLAG_VM                     BIT(4)
> >  /* child of VM queue for multi-tile VM jobs */
> >  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD      BIT(5)
> > -/* VM jobs for this queue are asynchronous */
> > -#define EXEC_QUEUE_FLAG_VM_ASYNC               BIT(6)
> >  
> >         /**
> >          * @flags: flags for this exec queue, should statically setup
> > aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 2f3df9ee67c9..ab38685d2daf 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1343,9 +1343,7 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags)
> >                         struct xe_gt *gt = tile->primary_gt;
> >                         struct xe_vm *migrate_vm;
> >                         struct xe_exec_queue *q;
> > -                       u32 create_flags = EXEC_QUEUE_FLAG_VM |
> > -                               ((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
> > -                               EXEC_QUEUE_FLAG_VM_ASYNC : 0);
> > +                       u32 create_flags = EXEC_QUEUE_FLAG_VM;
> >  
> >                         if (!vm->pt_root[id])
> >                                 continue;
> > @@ -1712,12 +1710,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> >         return ERR_PTR(err);
> >  }
> >  
> > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue
> > *q)
> > -{
> > -       return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > -               !(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > -}
> > -
> >  static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> >                         struct xe_exec_queue *q, struct xe_sync_entry
> > *syncs,
> >                         u32 num_syncs, bool immediate, bool first_op,
> > @@ -1747,8 +1739,6 @@ static int __xe_vm_bind(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  
> >         if (last_op)
> >                 xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > fence);
> > -       if (last_op && xe_vm_sync_mode(vm, q))
> > -               dma_fence_wait(fence, true);
> >         dma_fence_put(fence);
> >  
> >         return 0;
> > @@ -1791,8 +1781,6 @@ static int xe_vm_unbind(struct xe_vm *vm,
> > struct xe_vma *vma,
> >         xe_vma_destroy(vma, fence);
> >         if (last_op)
> >                 xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > fence);
> > -       if (last_op && xe_vm_sync_mode(vm, q))
> > -               dma_fence_wait(fence, true);
> >         dma_fence_put(fence);
> >  
> >         return 0;
> > @@ -1800,7 +1788,6 @@ static int xe_vm_unbind(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  
> >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> >                                     DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > -                                  
> > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> >                                     DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> >  
> >  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > @@ -1854,8 +1841,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> > void *data,
> >                 flags |= XE_VM_FLAG_SCRATCH_PAGE;
> >         if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> >                 flags |= XE_VM_FLAG_LR_MODE;
> > -       if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > -               flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> >         if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> >                 flags |= XE_VM_FLAG_FAULT_MODE;
> >  
> > @@ -2263,8 +2248,7 @@ static int xe_vma_op_commit(struct xe_vm *vm,
> > struct xe_vma_op *op)
> >  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct
> > xe_exec_queue *q,
> >                                    struct drm_gpuva_ops *ops,
> >                                    struct xe_sync_entry *syncs, u32
> > num_syncs,
> > -                                  struct list_head *ops_list, bool
> > last,
> > -                                  bool async)
> > +                                  struct list_head *ops_list, bool
> > last)
> >  {
> >         struct xe_vma_op *last_op = NULL;
> >         struct drm_gpuva_op *__op;
> > @@ -2696,16 +2680,16 @@ static int vm_bind_ioctl_ops_execute(struct
> > xe_vm *vm,
> >  
> >  #ifdef TEST_VM_ASYNC_OPS_ERROR
> >  #define SUPPORTED_FLAGS        \
> > -       (FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > -        DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE
> > | \
> > -        DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > +       (FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> > +        DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL |
> > 0xffff)
> >  #else
> >  #define SUPPORTED_FLAGS        \
> > -       (DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
> > +       (DRM_XE_VM_BIND_FLAG_READONLY | \
> >          DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> >          0xffff)
> >  #endif
> >  #define XE_64K_PAGE_MASK 0xffffull
> > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> >  
> >  #define MAX_BINDS      512     /* FIXME: Picking random upper limit
> > */
> >  
> > @@ -2717,7 +2701,7 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >         int err;
> >         int i;
> >  
> > -       if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +       if (XE_IOCTL_DBG(xe, args->pad) ||
> >             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >                 return -EINVAL;
> >  
> > @@ -2745,6 +2729,14 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >                 *bind_ops = &args->bind;
> >         }
> >  
> > +       *async = !(args->syncs.flags &
> > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > +
> > +       if (XE_IOCTL_DBG(xe, args->syncs.flags &
> > ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > +           XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
> > +               err = -EINVAL;
> > +               goto free_bind_ops;
> > +       }
> > +
> >         for (i = 0; i < args->num_binds; ++i) {
> >                 u64 range = (*bind_ops)[i].range;
> >                 u64 addr = (*bind_ops)[i].addr;
> > @@ -2775,18 +2767,6 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >                         goto free_bind_ops;
> >                 }
> >  
> > -               if (i == 0) {
> > -                       *async = !!(flags &
> > DRM_XE_VM_BIND_FLAG_ASYNC);
> > -                       if (XE_IOCTL_DBG(xe, !*async && args-
> > >num_syncs)) {
> > -                               err = -EINVAL;
> > -                               goto free_bind_ops;
> > -                       }
> > -               } else if (XE_IOCTL_DBG(xe, *async !=
> > -                                       !!(flags &
> > DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > -                       err = -EINVAL;
> > -                       goto free_bind_ops;
> > -               }
> > -
> >                 if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH)
> > ||
> >                     XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> >                     XE_IOCTL_DBG(xe, obj && is_null) ||
> > @@ -2854,12 +2834,25 @@ static int vm_bind_ioctl_signal_fences(struct
> > xe_vm *vm,
> >  
> >         xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> >                                      fence);
> > +       dma_fence_put(fence);
> >  
> > -       if (xe_vm_sync_mode(vm, q)) {
> > -               long timeout = dma_fence_wait(fence, true);
> > +       return err;
> > +}
> >  
> > -               if (timeout < 0)
> > -                       err = -EINTR;
> > +static int vm_bind_ioctl_sync_wait(struct xe_vm *vm,
> > +                                  struct dma_fence *fence,
> > +                                  u64 __user *cookie)
> > +{
> > +       long timeout;
> 
> Perhaps use err? It can only ever be <= 0, so timeout is misleading.
> 
> > +       int err = 0;
> > +
> > +       timeout = dma_fence_wait(fence, true);
> > +       if (timeout < 0) {
> > +               u64 value = 1;
> > +
> > +               err = -ERESTARTSYS;
> 
> Just forward the return value from dma_fence_wait().
> 
> > +               if (copy_to_user(cookie, &value, sizeof(value)))
> 
> put_user()
> 
> > +                       err = -EFAULT;
> >         }
> >  
> >         dma_fence_put(fence);
> > @@ -2875,6 +2868,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >         struct drm_xe_sync __user *syncs_user;
> >         struct xe_bo **bos = NULL;
> >         struct drm_gpuva_ops **ops = NULL;
> > +       struct dma_fence *fence = NULL;
> >         struct xe_vm *vm;
> >         struct xe_exec_queue *q = NULL;
> >         u32 num_syncs;
> > @@ -2889,7 +2883,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >         if (err)
> >                 return err;
> >  
> > -       if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +       if (XE_IOCTL_DBG(xe, args->pad) ||
> >             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >                 return -EINVAL;
> >  
> > @@ -2904,12 +2898,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                         err = -EINVAL;
> >                         goto put_exec_queue;
> >                 }
> > -
> > -               if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > -                                !!(q->flags &
> > EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > -                       err = -EINVAL;
> > -                       goto put_exec_queue;
> > -               }
> >         }
> >  
> >         vm = xe_vm_lookup(xef, args->vm_id);
> > @@ -2918,14 +2906,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 goto put_exec_queue;
> >         }
> >  
> > -       if (!args->exec_queue_id) {
> > -               if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > -                                !!(vm->flags &
> > XE_VM_FLAG_ASYNC_DEFAULT))) {
> > -                       err = -EINVAL;
> > -                       goto put_vm;
> > -               }
> > -       }
> > -
> >         err = down_write_killable(&vm->lock);
> >         if (err)
> >                 goto put_vm;
> > @@ -3015,16 +2995,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 }
> >         }
> >  
> > -       if (args->num_syncs) {
> > -               syncs = kcalloc(args->num_syncs, sizeof(*syncs),
> > GFP_KERNEL);
> > +       if (args->syncs.num_syncs) {
> > +               syncs = kcalloc(args->syncs.num_syncs,
> > sizeof(*syncs), GFP_KERNEL);
> >                 if (!syncs) {
> >                         err = -ENOMEM;
> >                         goto put_obj;
> >                 }
> >         }
> >  
> > -       syncs_user = u64_to_user_ptr(args->syncs);
> > -       for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++)
> > {
> > +       syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > +       for (num_syncs = 0; num_syncs < args->syncs.num_syncs;
> > num_syncs++) {
> >                 err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> >                                           &syncs_user[num_syncs],
> >                                           (xe_vm_in_lr_mode(vm) ?
> > @@ -3060,8 +3040,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  
> >                 err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs,
> > num_syncs,
> >                                               &ops_list,
> > -                                             i == args->num_binds -
> > 1,
> > -                                             async);
> > +                                             i == args->num_binds -
> > 1);
> >                 if (err)
> >                         goto unwind_ops;
> >         }
> > @@ -3077,7 +3056,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 xe_exec_queue_get(q);
> >  
> >         err = vm_bind_ioctl_ops_execute(vm, &ops_list);
> > -
> > +       if (!err && !async) {
> > +               fence =
> > xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > +               dma_fence_get(fence);
> > +       }
> >         up_write(&vm->lock);
> >  
> >         if (q)
> > @@ -3092,13 +3074,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >         if (args->num_binds > 1)
> >                 kfree(bind_ops);
> >  
> > -       return err;
> > +       return fence ? vm_bind_ioctl_sync_wait(vm, fence,
> > u64_to_user_ptr(args->syncs.cookie)) :
> > +               err;
> >  
> >  unwind_ops:
> >         vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> >  free_syncs:
> > -       if (err == -ENODATA)
> > +       if (err == -ENODATA) {
> >                 err = vm_bind_ioctl_signal_fences(vm, q, syncs,
> > num_syncs);
> > +               if (!async) {
> > +                       fence =
> > xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > +                       dma_fence_get(fence);
> > +               }
> > +       }
> >         while (num_syncs--)
> >                 xe_sync_entry_cleanup(&syncs[num_syncs]);
> >  
> > @@ -3108,6 +3096,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >                 xe_bo_put(bos[i]);
> >  release_vm_lock:
> >         up_write(&vm->lock);
> > +       if (fence)
> > +               err = vm_bind_ioctl_sync_wait(vm, fence,
> > u64_to_user_ptr(args->syncs.cookie));
> >  put_vm:
> >         xe_vm_put(vm);
> >  put_exec_queue:
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 2e023596cb15..63e8a50b88e9 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -138,13 +138,12 @@ struct xe_vm {
> >          */
> >  #define XE_VM_FLAG_64K                 BIT(0)
> >  #define XE_VM_FLAG_LR_MODE             BIT(1)
> > -#define XE_VM_FLAG_ASYNC_DEFAULT       BIT(2)
> > -#define XE_VM_FLAG_MIGRATION           BIT(3)
> > -#define XE_VM_FLAG_SCRATCH_PAGE                BIT(4)
> > -#define XE_VM_FLAG_FAULT_MODE          BIT(5)
> > -#define XE_VM_FLAG_BANNED              BIT(6)
> > -#define XE_VM_FLAG_TILE_ID(flags)      FIELD_GET(GENMASK(8, 7),
> > flags)
> > -#define XE_VM_FLAG_SET_TILE_ID(tile)   FIELD_PREP(GENMASK(8, 7),
> > (tile)->id)
> > +#define XE_VM_FLAG_MIGRATION           BIT(2)
> > +#define XE_VM_FLAG_SCRATCH_PAGE                BIT(3)
> > +#define XE_VM_FLAG_FAULT_MODE          BIT(4)
> > +#define XE_VM_FLAG_BANNED              BIT(5)
> > +#define XE_VM_FLAG_TILE_ID(flags)      FIELD_GET(GENMASK(7, 6),
> > flags)
> > +#define XE_VM_FLAG_SET_TILE_ID(tile)   FIELD_PREP(GENMASK(7, 6),
> > (tile)->id)
> >         unsigned long flags;
> >  
> >         /** @composite_fence_ctx: context composite fence */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 0895e4d2a981..d72e4441cc80 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -140,8 +140,7 @@ struct drm_xe_engine_class_instance {
> >          * Kernel only classes (not actual hardware engine class).
> > Used for
> >          * creating ordered queues of VM bind operations.
> >          */
> > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC      5
> > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC       6
> > +#define DRM_XE_ENGINE_CLASS_VM_BIND            5
> >         /** @engine_class: engine class id */
> >         __u16 engine_class;
> >         /** @engine_instance: engine instance id */
> > @@ -661,7 +660,6 @@ struct drm_xe_vm_create {
> >          * still enable recoverable pagefaults if supported by the
> > device.
> >          */
> >  #define DRM_XE_VM_CREATE_FLAG_LR_MODE          (1 << 1)
> > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT    (1 << 2)
> >         /*
> >          * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> >          * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be
> > allocated
> > @@ -669,7 +667,7 @@ struct drm_xe_vm_create {
> >          * The xe driver internally uses recoverable pagefaults to
> > implement
> >          * this.
> >          */
> > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE       (1 << 3)
> > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE       (1 << 2)
> >         /** @flags: Flags */
> >         __u32 flags;
> >  
> > @@ -777,12 +775,11 @@ struct drm_xe_vm_bind_op {
> >         __u32 op;
> >  
> >  #define DRM_XE_VM_BIND_FLAG_READONLY   (1 << 0)
> > -#define DRM_XE_VM_BIND_FLAG_ASYNC      (1 << 1)
> >         /*
> >          * Valid on a faulting VM only, do the MAP operation
> > immediately rather
> >          * than deferring the MAP to the page fault handler.
> >          */
> > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE  (1 << 2)
> > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE  (1 << 1)
> >         /*
> >          * When the NULL flag is set, the page tables are setup with
> > a special
> >          * bit which indicates writes are dropped and all reads
> > return zero.  In
> > @@ -790,7 +787,7 @@ struct drm_xe_vm_bind_op {
> >          * operations, the BO handle MBZ, and the BO offset MBZ. This
> > flag is
> >          * intended to implement VK sparse bindings.
> >          */
> > -#define DRM_XE_VM_BIND_FLAG_NULL       (1 << 3)
> > +#define DRM_XE_VM_BIND_FLAG_NULL       (1 << 2)
> >         /** @flags: Bind flags */
> >         __u32 flags;
> >  
> > @@ -808,6 +805,35 @@ struct drm_xe_vm_bind_op {
> >         __u64 reserved[3];
> >  };
> >  
> > +/**
> > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > + */
> > +struct drm_xe_syncs {
> > +       /** @num_syncs: amount of syncs to wait on */
> > +       __u32 num_syncs;
> > +
> > +       /*
> > +        * Block in IOCTL until operation complete, num_syncs MBZ if
> > set.
> > +        */
> > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > +       /** @flags: Sync flags */
> > +       __u32 flags;
> > +
> > +       /**
> > +        * @cookie: pointer which is written with an non-zero value
> > if IOCTL
> > +        * operation has been committed but the wait for completion
> > +        * (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP is set) is interrupted.
> > Value only
> > +        * valid when IOCTL returns -EINTR or -ERESTARTSYS.
> 
> MBZ on initial call. Should be opaque to user-space.
> 
> Could we add that the preferred method for production code is to use
> async vm_binds and if necessary wait on an out-fence, preferrably user-
> fence?.
> 
> 
> > +        */
> > +       __u64 cookie;
> > +
> > +       /** @syncs: pointer to struct drm_xe_sync array */
> > +       __u64 syncs;
> > +
> > +       /** @reserved: Reserved */
> > +       __u64 reserved[2];
> > +};
> > +
> >  struct drm_xe_vm_bind {
> >         /** @extensions: Pointer to the first extension struct, if
> > any */
> >         __u64 extensions;
> > @@ -839,14 +865,8 @@ struct drm_xe_vm_bind {
> >                 __u64 vector_of_binds;
> >         };
> >  
> > -       /** @pad: MBZ */
> > -       __u32 pad2;
> > -
> > -       /** @num_syncs: amount of syncs to wait on */
> > -       __u32 num_syncs;
> > -
> > -       /** @syncs: pointer to struct drm_xe_sync array */
> > -       __u64 syncs;
> > +       /** @syncs: syncs for bind */
> > +       struct drm_xe_syncs syncs;
> >  
> >         /** @reserved: Reserved */
> >         __u64 reserved[2];
> > @@ -975,14 +995,14 @@ struct drm_xe_exec {
> >         /** @extensions: Pointer to the first extension struct, if
> > any */
> >         __u64 extensions;
> >  
> > +       /** @pad: MBZ */
> > +       __u32 pad;
> > +
> >         /** @exec_queue_id: Exec queue ID for the batch buffer */
> >         __u32 exec_queue_id;
> >  
> > -       /** @num_syncs: Amount of struct drm_xe_sync in array. */
> > -       __u32 num_syncs;
> > -
> > -       /** @syncs: Pointer to struct drm_xe_sync array. */
> > -       __u64 syncs;
> > +       /** @syncs: syncs for exec */
> > +       struct drm_xe_syncs syncs;
> >  
> >         /**
> >          * @address: address of batch buffer if num_batch_buffer == 1
> > or an
> > @@ -996,8 +1016,8 @@ struct drm_xe_exec {
> >          */
> >         __u16 num_batch_buffer;
> >  
> > -       /** @pad: MBZ */
> > -       __u16 pad[3];
> > +       /** @pad2: MBZ */
> > +       __u16 pad2[3];
> >  
> >         /** @reserved: Reserved */
> >         __u64 reserved[2];
> 
