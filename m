Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37430C07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B3B10E666;
	Wed, 29 Nov 2023 19:37:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3010E666
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701286658; x=1732822658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qmcdlNEu48A0ciDOPxanlkL7RsMf1uG3i71wDkzziIY=;
 b=TDaTd2Phie6I6TdPaKwPwpEDd8cvlq3+ekL5hT9TklJdyZIdQVQaFN16
 n9NZeAJqkEbSy6AzeO+fZeKTTIL2NsZkoRwVRzey62RY2mq9gW9F1Q/rz
 mi2wevZ8K3fi54uxb+/pGuI87zWgl7ZuufH1d9WKLDjD6BzJVRSthncmD
 PHUWJrCYA9/DJMHmBOse8w+CCauWPmwK3P73a9nIdShej8rvbXelH9rK+
 wBFQeUifcdhEMJwskSlvUzV8EDoveqFkFzBq7fUsAQV7GdJ4YT6R7ll92
 YJ0wE7E/w1g601qMzQAhiKgqV12vBBiJTV0H7ij5He9dKQJ9ZyeQ9NjsO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="200811"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="200811"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016375651"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1016375651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:37:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:37:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:37:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:37:36 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:37:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUOwktbmLJ051d2CpY5At5W9iD2JYtMz19HcOWvc6H/QBjLRUEfxUI2hp4gnBWdgKpYFC42NrSPnWklHdOOtU4gIhpHzBuVse5bVCKna9dkKCFVy2EEB/pzoe2OALeE0i8sVxHcQ+0z0DHpCb7tisS1l+hpEZQL2TwWjmAWjxZrWylGJMm8m1IcLCEh+HqLJEVSSFHeZ+YfZE9yNBFuKsZ26OM646LqFFUzBsvAMzcNI7KKKvWMqWqr8GzGnZ1XOHMRHNWT10kmY+dZF30wHkXHfdofkY2DnhIS/gy+WmZ1Km5wNd0Sz+7dmJkQKAvr8mDB6Hw63zHe6ciVO5mU3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmpaNUL5pMxppOrlg+iEwP9eTJ/8ntU/dEtoBQhD8hg=;
 b=ma34Qj0k3v/63h+f8Bfhj7NXvRkSqcsFZfVzSJNWfUyZiYWx0yl4URusG5GDlbJqrx1v0OTUNhWKgJwgrC7Yy++xidLnPa03XJeBO/rRsgLcSWXfiMe40Wp4zmz7Xch6luPToHsaB+FV4KtdjjO4dOEt+zhufkwx2sOJPiitO5kXOxvlFZ1HjfpHW7rRZ7getWyXjjt3jaOVKcN2jEKs2lvMHz1KUywv3cqDonyQl+GaF9c7vJXayqGKTXxV+AbQX2GKuru+OrNm8cxjcGk86Pg5KG8zJ3/jJpsFvVId0lvDCW6KpDEM+fiH19VoE2+TAyHwb+eTxivrV2F8rnCxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:37:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:37:34 +0000
Date: Wed, 29 Nov 2023 12:35:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZWcwLhlAGj/o5xaJ@DUT025-TGLU.fm.intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-4-francois.dugast@intel.com>
 <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com>
 <ZWds2xD8bXkBy-t0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWds2xD8bXkBy-t0@intel.com>
X-ClientProxiedBy: BYAPR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:40::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b64b132-e8ef-415d-9275-08dbf112a2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCP3JllTvOZOQY9xKUBk5O4M/g00IPy/PRul0XLRiBVUhbAOsZC8y27Mz6bToljEp8Zsq9LFSRoYmqR9OBD+eRp2gjgxocLM7fRr5fQnckOaINYMpNnjOyXV1CeAAcqGRWoKMJH+u6WClePgMwiCKti7p2JEbQzwUjqSkHbsMF2+5GhtIJufb1gpl846fI2dxyqAxl1bXj0QP7uepwOHalvHRwoB7RR1ky4bvAVfbpM4MZyrQK/FOEWbcOoFRnJ9dj341TKvYDofLRmn/eOvq0gHEnNQch4rOY3MRjzUFhSzsos0BfO4PRJkUL6EOFbr+CbXr3qPlLQK/gHwKDupSJTqgJMYev8CbMhzfgm3fEd06pZioiAh6CNITNrRlLcu6ApGu/yBjgaEOKEJs+1uLelbjUEyFxOs+LEuYKRkx+OT4z0wJeBKLFMCdL3yVorPFXbbgtcsng4dwhLL5m/CqWohwZb8G1cNUAFGui0WrRN1hSU4dWxMiBOOHL3lzGEihXEZFolf0piUfykVd4/TjaD44bBSuK9hzjSktZ4ROHbzt27ovOYOpo5A6iFcd2zfAGou5YHmaVq3XAb6RlVJqtmzgqST7G4d/X1ADUpLi+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(6506007)(4326008)(82960400001)(8936002)(6862004)(5660300002)(8676002)(316002)(66556008)(66476007)(6636002)(66946007)(44832011)(86362001)(54906003)(6486002)(966005)(6512007)(478600001)(2906002)(41300700001)(6666004)(202311291699002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f0i6Uy2TGa+BDCHpGRkmQb6+k206JBkFcBhWmy3GGPb9HzVA45oVf4Ag7M?=
 =?iso-8859-1?Q?TViIIJThTmVBXbjWC50XMJNM0LMXKmz+PyYd9ViFCE54XSdqgsVG4T4z8R?=
 =?iso-8859-1?Q?it4Zeq6oYOBvP5/O94cuqgNihWAN3xe8PqPesrsvpADYx5nxa4U3oU7M2m?=
 =?iso-8859-1?Q?1IPyYX3G7A78/aFAnSz6fQFEUyY9cknX6hgJzLYVy7fMYF1rwXT9PUmowm?=
 =?iso-8859-1?Q?6hA/0o7i7JK04xD+yEVgpiAsqJTkbKahtPoZYg8MBcqVn8DAZEbtpjAWmf?=
 =?iso-8859-1?Q?XQ6w3LnMCqq73LYf0HHx7iDUVEVu5XAFdEvTkBmdyMvcGjEGIQp4u6LJaK?=
 =?iso-8859-1?Q?2xdxfHTMHowwvrIUj9nibAdO9xPebopNiOxYPmUJBju4k7dpts6RYKBDJt?=
 =?iso-8859-1?Q?5QvaScrYVdgjcMVINxcYnVMmCVnj6tg5bPA/SFpSmk6M0sRQb2alWLxHim?=
 =?iso-8859-1?Q?GngqQOF8jAfzWwHiq/N0fSHTqggYbvqzEcbVgOgKfCm99jYww1/0ZhLmJU?=
 =?iso-8859-1?Q?7RESQvid5vMGhdokp5UKB8G1rkYxZlOOwKQJKJy8Z0S0rBEr1p4PRRWM1s?=
 =?iso-8859-1?Q?4e9HzjesjvokJEdBeSZukRnTZBIkps42KkywRX+SwqYX28xJXcwwNM3EWJ?=
 =?iso-8859-1?Q?kqtqrQYyowjxijyc+Ubf/fR2/m4qLvNh0OjTyXfT8tCzNudhICD02cB5RY?=
 =?iso-8859-1?Q?aMkF0zJP2b7MeWcYaIU9pwbv5N0NT1J+R8itDqfHD+UAke0Wk4GTmlJgbk?=
 =?iso-8859-1?Q?jwNreTQkzjqvTMqZEF5GjzcfpgiYaCJ/AUiLWxeCC6EIcceu/pySCw/NXw?=
 =?iso-8859-1?Q?+u78/HeICCJ8C2nNQoRx3JTMvIuGc2PrW2jiQPMw3k5aFyir0qrQAcn7DL?=
 =?iso-8859-1?Q?Ta3q2QldrVmRt9W0bF3k0tzhvtYId9kJpQyCzCPRx1oiva9yXuuYXnuqCu?=
 =?iso-8859-1?Q?oqupCx9iUj1euTtjVc47p8/QPzLs9lSSfmknbT4cN8Hq8UKm3aGpHtNePO?=
 =?iso-8859-1?Q?ldIRDvOxBPaPuB5D8/IN8sBeVvpnunmynu4/ChvuF0a7cl2+EroIuJ+jUX?=
 =?iso-8859-1?Q?SW4Qr+oPAnP68uRtIwHHmI1O5dgAV7RLNSjiglx/WeR8YaSGm2f/nKacfh?=
 =?iso-8859-1?Q?AvsBx55EObo78n6kVe696kuu0fE8yz1UheA7NnfrLlQ7tqxgfoIMejgFb/?=
 =?iso-8859-1?Q?c0i7Awryk496d/NQ5C1nKc7FEdG5W9XEutu8bsv5TiJn83/cmxjCpKotnd?=
 =?iso-8859-1?Q?s/ZDRh5lCravUeH3tYM+nD8mj2ISPvsL8kGL+paNcL8JIzGByXgzMmMBHt?=
 =?iso-8859-1?Q?NHPkNjOD3obiFaLSJnSDTIy37qwwT1a5ZPNyhKzxXxVY6d8v2zxvWSuXKF?=
 =?iso-8859-1?Q?xuNdMORDgWA5KRyjG/jggKAOEKGpvtNrdO3vXm7HZmuFHmIt61jyFHmh5O?=
 =?iso-8859-1?Q?64fqNa9YMY5r8mGklKvwATgqixpZ0Ar3jyJI0yOEAgz2x09PuXZ57Zt9W4?=
 =?iso-8859-1?Q?2qjuCyvLgpzuiO6auV2lAU5PpxFJH1uB0yY+No2yBoKdyjm3U22Mr4KE6Y?=
 =?iso-8859-1?Q?03Njfrr6QmrcyF3R+Lauco6pX8oRC4rhtyS8W3s2Ob8D6v31dgWzsOIp1r?=
 =?iso-8859-1?Q?W1re0msQ1iHn28NnU7Mcmns67FG49Jl6e95EpBYJqfq49uHOJ4MmFjbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b64b132-e8ef-415d-9275-08dbf112a2e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:37:34.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vr784rjPaPrSP9KxxOPrtw7UVY0uGlQkRdegOCnpiy0K1UkKjChfrJ6Od9rMr535ddcX0CXvg0B8oTbRPi6TkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 11:54:51AM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 28, 2023 at 09:17:51PM +0000, Matthew Brost wrote:
> > On Wed, Nov 22, 2023 at 02:38:22PM +0000, Francois Dugast wrote:
> > > From: José Roberto de Souza <jose.souza@intel.com>
> > > 
> > > We have at least 2 future features(OA and future media engines
> > > capabilities) that will require Xe to provide more information about
> > > engines to UMDs.
> > > 
> > > But this information should not just be added to
> > > drm_xe_engine_class_instance for a couple of reasons:
> > > - drm_xe_engine_class_instance is used as input to other structs/uAPIs
> > > and those uAPIs don't care about any of these future new engine fields
> > > - those new fields are useless information after initialization for
> > > some UMDs, so it should not need to carry that around
> > > 
> > > So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
> > > array of drm_xe_query_engine_info that contain
> > > drm_xe_engine_class_instance and 3 u64s to be used for future features.
> > 
> > There is 5 u64 in this patch.
> 
> my bad, sorry. just trying to prepare for the many capabilities and other
> stuff we will likely need. But likely 3 would be enough.
> 
> > 
> > Anyways agree this better but what if we improve this a bit more making
> > each __drm_xe_query_engine_info a dynamic size.
> 
> hmmm... I think I like this idea. pahole seems to have a good output
> with our other existent dynamic array.
>

Cool, looking forward to what we come up with.

> > 
> > e.g.
> > struct __drm_xe_query_engine_info {	/* Bad name, just for example */
> >      /** @instance: The @drm_xe_engine_class_instance */
> >      struct drm_xe_engine_class_instance instance;
> > 
> >      /** @reserved: Reserved, dynamic size */
> >      __u64 reserved[0];
> 
> I believe [] instead of [0] is the preferred way nowadays.
> 

Yep.

Matt

> > };
> > 
> > struct drm_xe_query_engine_info {
> >      /** @num_engines: Number engines */
> >      __u64 num_engines;
> >      /** @engine_info: Array of engine info */
> >      struct __drm_xe_query_engine_info engine_info[0];
> > };
> > 
> > The size of __drm_xe_query_engine_info then change and can be calculated
> > to be:
> > 
> > (returned size of query - sizoeof(__u64)) / drm_xe_query_engine_info.num_engines
> > 
> > We then should be able to add additional fields to
> > __drm_xe_query_engine_info indefinitely.
> > 
> > What does everyone think? We likely can apply this idea to other
> > queries too as it makes sense.
> > 
> > Matt
> > 
> > > 
> > > Reference OA:
> > > https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
> > > 
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > [Rodrigo Rebased]
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
> > >  include/uapi/drm/xe_drm.h     | 24 +++++++++++++++++++++++-
> > >  2 files changed, 31 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 61a7d92b7e88..0cbfeaeb1330 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> > >  			i++;
> > >  		}
> > >  
> > > -	return i * sizeof(struct drm_xe_engine_class_instance);
> > > +	return i * sizeof(struct drm_xe_query_engine_info);
> > >  }
> > >  
> > >  typedef u64 (*__ktime_func_t)(void);
> > > @@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
> > >  			 struct drm_xe_device_query *query)
> > >  {
> > >  	size_t size = calc_hw_engine_info_size(xe);
> > > -	struct drm_xe_engine_class_instance __user *query_ptr =
> > > +	struct drm_xe_query_engine_info __user *query_ptr =
> > >  		u64_to_user_ptr(query->data);
> > > -	struct drm_xe_engine_class_instance *hw_engine_info;
> > > +	struct drm_xe_query_engine_info *hw_engine_info;
> > >  	struct xe_hw_engine *hwe;
> > >  	enum xe_hw_engine_id id;
> > >  	struct xe_gt *gt;
> > > @@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
> > >  			if (xe_hw_engine_is_reserved(hwe))
> > >  				continue;
> > >  
> > > -			hw_engine_info[i].engine_class =
> > > +			hw_engine_info[i].instance.engine_class =
> > >  				xe_to_user_engine_class[hwe->class];
> > > -			hw_engine_info[i].engine_instance =
> > > +			hw_engine_info[i].instance.engine_instance =
> > >  				hwe->logical_instance;
> > > -			hw_engine_info[i].gt_id = gt->info.id;
> > > -			hw_engine_info[i].pad = 0;
> > > +			hw_engine_info[i].instance.gt_id = gt->info.id;
> > > +			hw_engine_info[i].instance.pad = 0;
> > > +			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> > >  
> > >  			i++;
> > >  		}
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 1bdd20d3c4a8..c80e03b61489 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -124,7 +124,14 @@ struct xe_user_extension {
> > >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > >  
> > > -/** struct drm_xe_engine_class_instance - instance of an engine class */
> > > +/**
> > > + * struct drm_xe_engine_class_instance - instance of an engine class
> > > + *
> > > + * It is returned as part of the @drm_xe_query_engine_info, but it also is
> > > + * used as the input of engine selection for both @drm_xe_exec_queue_create
> > > + * and @drm_xe_query_engine_cycles
> > > + *
> > > + */
> > >  struct drm_xe_engine_class_instance {
> > >  #define DRM_XE_ENGINE_CLASS_RENDER		0
> > >  #define DRM_XE_ENGINE_CLASS_COPY		1
> > > @@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
> > >  	__u16 pad;
> > >  };
> > >  
> > > +/**
> > > + * struct drm_xe_query_engine_info - describe hardware engine
> > > + *
> > > + * If a query is made with a struct @drm_xe_device_query where .query
> > > + * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> > > + * struct @drm_xe_query_engine_info in .data.
> > > + */
> > > +struct drm_xe_query_engine_info {
> > > +	/** @instance: The @drm_xe_engine_class_instance */
> > > +	struct drm_xe_engine_class_instance instance;
> 
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[5];
> > > +};
> > > +
> > >  /**
> > >   * enum drm_xe_memory_class - Supported memory classes.
> > >   */
> > > -- 
> > > 2.34.1
> > > 
