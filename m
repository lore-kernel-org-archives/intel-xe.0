Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D0C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A4510E469;
	Tue,  9 Jan 2024 17:39:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508110E469
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704821947; x=1736357947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EoMkzEasqboGdlO6BAnuSjXsmZyr0jpNyuEv8eypiwI=;
 b=K7gOpaRagXWMjjzCB2zJ5p27UkSdmsx/DpCCVmmefj+TnUDSrooBPcY3
 EFJ+/Bkb37V1D2iLyur6tvLJTu+QQNMJqgnxOgNygLEMlBX6h3P3pexDe
 h1WqvKJdGHUNExpWBY6aydco+jHY6otOi/iih9H9pHRBE3WzUK7nqtJ/s
 LqJxP1ZGpyiw5y/0EIhgvo+5lQ9baPvcuTHWk0NpTG8dtpNYAH2RE9ZNV
 lEEKw1qHFQwyZBlQiCg92W7LOQaN1uWpeLdP0WYj70fYnryuv84XLpkdA
 TxMhfkiM1sHpiHF0/RZbpcoyWwFtMCzFNq4IFxAjNIUSjKgT1VTmngARW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11758429"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="11758429"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="816056117"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="816056117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 09:39:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:39:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:39:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 09:39:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 09:39:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DS0nUw3px04HdEIYjz6NkLSCMTr4hgIImcG8w6GmC5sSRrtx6uk/L0Dfq2NqhpgQIvqJ2MZR9nBMo8jfnFKjklAt4UP4QjcF3N0j9h1pgBravgwm6viSN9aOpLuIgMqGdcPsA2qLDyHZfJ+aWc1Whg+u7RThwRs7XHEJKqRm4ep+vOWyr/XezVRJ9vyNUIaeIPiyYIyrwr68ecBhHihwMMko5g1PR5GOJgKe7S9eGCyOhoaCcIBJn0Fl060OHoGje+vyU2G4IsQT8eBBT3bKhrhl20i7HFC6ACwc68kQUdTbOTUgYZKSZkMkjY4y5dxZ/8QE1+KVeL2zHmcX3VGLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tGSVDaAKphwDNguXnvM4gfdAqoRYR6jY8KX0U3H0+I=;
 b=nrOcalv4ne5ThszDFR9L4iovJdMHZWJ7+jsfKGRtfI5XBGTME46E9xiRZbg597Q09wOnfw9D9KLE8ga1A9vg6rZcSKRZDUG+NCPAbscjnM4Q9DoHM/3XFkq3MPElJcGgFSNXX0pknyjh/uigdyL0idX+pzaGfP9XCO4rQBivcz+cB3IpgzOPPXGbC/tp6rnd7+y5C2w5MfxE6O0wXI7oNsapxGgh7OyEbAvfMeIsQRhibWSG3qf7Hb938QOCfAcjAlpksZuZx/uc5LfYrptSsaK7ixu4Svup3Nk9DUVfcQtRimYFerDr4gzJN2cM8m4KAAkv4nhKIZTPICNil2918g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 17:39:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 17:39:03 +0000
Date: Tue, 9 Jan 2024 12:39:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 20/20] drm/xe: Mega Kill of mem_access
Message-ID: <ZZ2EtGBVFCTH7rFW@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-21-rodrigo.vivi@intel.com>
 <5b532ac1-65bf-4ef1-9a1a-f4f328b576d1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5b532ac1-65bf-4ef1-9a1a-f4f328b576d1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 12599b3c-971d-460e-135e-08dc1139df02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXkqsq2Scesfd4qD7Tiem9TZRPJG8I45pnUnW+ff34VnIpZGcf0/KSLHh4S+siHVzzZ+9VWFy0Tby6Q4lag9vEhPwhDdIeDBRku3F4sD6yRV8KptE8Xz9hblFqbNoDjDi/T6zTCHvOm+09DfW1gRutBEKOgn+1wHayFlrpaqzpACB6iwRlQfKpz6OcSMRXM31KuMrXo3oslTqWBi328sx8k8coetaxssm235etyAPN9R79+NLZP+VhWf7axIwrn9vLHP9EFRn/5g7QVnkS82Snans6PbZw9DcpVJaVl3cfjYq4lfpjqY2FMQsrNKWC9p3KZe3SbNRdirE0HOxY64fNHhCmCG9PckoL01BVYIu5IXIRKE6zHvWd8Qo7g2liGmuQOKDUEC5waENPukHNEwYg8hF2oUMw1OCL6RIxPXn1uagyBUG4DstSTtUvnYqZTmoaaWidmv90H2fbVhuT6IRSx3kHEkgwO+wUazOPtObg7B68zzLH5zgQHp5DwXC9z1GA6EESkPbDX0ZfDwKUbJB+jsmLWAYBxxLVtI0aHCecpxiKmtFRYDtFJOjUJhX0e9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(37006003)(316002)(82960400001)(8936002)(66946007)(6636002)(66556008)(8676002)(66476007)(41300700001)(5660300002)(86362001)(2906002)(36756003)(6486002)(6862004)(2616005)(44832011)(4326008)(26005)(53546011)(6512007)(83380400001)(6506007)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97GIQoRwRVCWpodltMwZgnBEoBX7IbdCO0XumGsu42UhOhcb4iGT4bI2X1uC?=
 =?us-ascii?Q?jd/4Wz54Vjkbv0T2Dm8UDbBfFStlRBqkfbO4QrBx83664qgOTP4LqggUwQfj?=
 =?us-ascii?Q?wMi48eD8z0tdmHQyjHY/kSZ4VIe8KowNivvwVB6R4HeO5G+j9uDzj+9WEAHo?=
 =?us-ascii?Q?+EEovhV9vMXW++nDFMaXvCukMeyve0lnf2BXrXTcFED+Wpvb4bD23qJ4/a8M?=
 =?us-ascii?Q?AcQ/cBAADsmsPJhEf9OoAurFt5S9B2Iq0wnPNqgj9PgE4s5WzaB3NOh+C6YV?=
 =?us-ascii?Q?P6yZS4ZSfE1UcrxdzbADfb9o6TV4D4CGWF1rV5pin/l1nglR/alKhNlyXopz?=
 =?us-ascii?Q?jEOSf5dqcD9mh1Mr26Icohcdygx1/RWI84mEp5mdbB23pQWzhusZbBYW6ah3?=
 =?us-ascii?Q?CAHG8vlZqPoer4ZYJHxS/LMrIy9vbi6LxnNqUEUPw8/dNG1X+CfwT/HHi9cu?=
 =?us-ascii?Q?wEnjLEQHQxUvGwqgt1ERBknBjIjnUWo0dwTTEbyDzeFwfSklnsN/779W+tNF?=
 =?us-ascii?Q?hmD6kamrq3UPYlYHxa54n6jb0hhqbaQaRajeDLHtU10Cun4zhPuTDB/Qzxx0?=
 =?us-ascii?Q?j0SP30Fa7nrlhWK+8ETtByyrN17bGZXTfjvVSCO0Cqodv6XUS8Ij8RcUrZNp?=
 =?us-ascii?Q?2eNcdIqCgDdiH6Bxny0JY0eZ2ZHYO4ImkH4EPZykLq4HKQsW8DkGYvh288oo?=
 =?us-ascii?Q?mixA2QLqxBkq6MKpOSR7eauJ1nW8DI0PJswcFWM7/yUSK6qvyP1SnBEXeizv?=
 =?us-ascii?Q?QeIBbrXPPvVeDgNNWp4aayXx+FmKTQ9RQLJx8CZEc3KIKMREtJBKLqFuE4VP?=
 =?us-ascii?Q?u+9QvYeKXVEMsZUj5+PYZu9HGriNNDkBa1buXlTXUH6GBbJjyn3M6Bxz3XCd?=
 =?us-ascii?Q?ZPPKKwtStIV5yv/WpaqUpFuJrRuMSnpmZbmB3Iq7MAmQ9TtBXLmFcsX8t+Xh?=
 =?us-ascii?Q?uX7mqd7N4u2j1vqB6bKJbTsD/PS9V1HBOAA08b8VMvh0Z5cTBkzoxxTZGOjk?=
 =?us-ascii?Q?A6waR0quiA7SeIaDQGsesew2i1nzHqdcWcoVBB2P1ntT0honnxmW6uQBpYjI?=
 =?us-ascii?Q?03QWq4XNcfZayhDZzFffJl6FppuRA4bHVKmWvA7sB728m2Jk3JtOyWH74UGe?=
 =?us-ascii?Q?lB/Xf7TW04uYMBylaAvaH1dmWXkfUgRDQBYCJRC4p7fNppxfYYf/Hity72C0?=
 =?us-ascii?Q?xchtaOrOTC2uqbUIjS+4nxY5xb+P1hSyTIwfubWs/iTe+JYtRwLXaMi/i13a?=
 =?us-ascii?Q?Re053gemMu9J7RvDAuKo39TV7KXNoz7hvtuBFachQmtagrGbGe6ds8k7tWKO?=
 =?us-ascii?Q?z0DRzip10zeX5KtYeyMQGcYJ/ymKQWQV/WELCP1+uLeJqttUg7a2Md3JQuis?=
 =?us-ascii?Q?9zUnYaUpxM6fEmL1i4qRaNL66hXGkNABue9ejvvAS3e0QPq4Aspt1qMAh/m5?=
 =?us-ascii?Q?dw4qNgQUA9VcHJzmFCA5k4vup89UZyewdxhKCTwOwt2GyraOyUfL3CTv5oz2?=
 =?us-ascii?Q?7o3UGMg4VdmUQTN4xQphzOVm1f09mLcu+xkNwUXD1Ryvq63igijuhSski5tz?=
 =?us-ascii?Q?d2LbXAG3mtDMzL54J4m9bN0EHzPliMwN8/ZT6c61?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12599b3c-971d-460e-135e-08dc1139df02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 17:39:03.5329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAq6/0fwfq3fS/RBQnMeGaG3RiGgBMBgXPbN3HT7PaObIj3P34j5M3Tvg29yCiJkCRwQYLCgCrfaazNweScEUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 11:41:35AM +0000, Matthew Auld wrote:
> On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > All of these remaining cases should already be protected
> > by the outer bound calls of runtime_pm
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 +--
> >   drivers/gpu/drm/xe/tests/xe_bo.c       |  8 ----
> >   drivers/gpu/drm/xe/tests/xe_mocs.c     |  4 --
> >   drivers/gpu/drm/xe/xe_bo.c             |  5 ---
> >   drivers/gpu/drm/xe/xe_device.c         | 59 --------------------------
> >   drivers/gpu/drm/xe/xe_device.h         |  7 ---
> >   drivers/gpu/drm/xe/xe_device_types.h   |  9 ----
> >   drivers/gpu/drm/xe/xe_ggtt.c           |  6 ---
> >   drivers/gpu/drm/xe/xe_gsc.c            |  3 --
> >   drivers/gpu/drm/xe/xe_gt.c             | 17 --------
> >   drivers/gpu/drm/xe/xe_huc_debugfs.c    |  2 -
> >   drivers/gpu/drm/xe/xe_pat.c            | 10 -----
> >   drivers/gpu/drm/xe/xe_pm.c             | 27 ------------
> >   drivers/gpu/drm/xe/xe_query.c          |  4 --
> >   drivers/gpu/drm/xe/xe_tile.c           | 10 ++---
> >   drivers/gpu/drm/xe/xe_vm.c             |  7 ---
> >   16 files changed, 5 insertions(+), 180 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 722c84a566073..077294ec50ece 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -190,10 +190,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> >   	/* TODO: Consider sharing framebuffer mapping?
> >   	 * embed i915_vma inside intel_framebuffer
> >   	 */
> > -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> >   	ret = mutex_lock_interruptible(&ggtt->lock);
> >   	if (ret)
> > -		goto out;
> > +		return ret;
> >   	align = XE_PAGE_SIZE;
> >   	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> > @@ -241,8 +240,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> >   	xe_ggtt_invalidate(ggtt);
> >   out_unlock:
> >   	mutex_unlock(&ggtt->lock);
> > -out:
> > -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> >   	return ret;
> >   }
> > @@ -381,4 +378,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> >   void intel_dpt_destroy(struct i915_address_space *vm)
> >   {
> >   	return;
> > -}
> > \ No newline at end of file
> > +}
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 412b2e7ce40cb..97b10e597f0ad 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -164,8 +164,6 @@ static int ccs_test_run_device(struct xe_device *xe)
> >   		return 0;
> >   	}
> > -	xe_device_mem_access_get(xe);
> > -
> >   	for_each_tile(tile, xe, id) {
> >   		/* For igfx run only for primary tile */
> >   		if (!IS_DGFX(xe) && id > 0)
> > @@ -173,8 +171,6 @@ static int ccs_test_run_device(struct xe_device *xe)
> >   		ccs_test_run_tile(xe, tile, test);
> >   	}
> > -	xe_device_mem_access_put(xe);
> > -
> >   	return 0;
> >   }
> > @@ -336,13 +332,9 @@ static int evict_test_run_device(struct xe_device *xe)
> >   		return 0;
> >   	}
> > -	xe_device_mem_access_get(xe);
> > -
> >   	for_each_tile(tile, xe, id)
> >   		evict_test_run_tile(xe, tile, test);
> > -	xe_device_mem_access_put(xe);
> > -
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> > index 7dd34f94e8094..a12e7e2bb5861 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> > @@ -45,7 +45,6 @@ static void read_l3cc_table(struct xe_gt *gt,
> >   	struct kunit *test = xe_cur_kunit();
> > -	xe_device_mem_access_get(gt_to_xe(gt));
> >   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> >   	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> > @@ -65,7 +64,6 @@ static void read_l3cc_table(struct xe_gt *gt,
> >   				   XELP_LNCFCMOCS(i).addr);
> >   	}
> >   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > -	xe_device_mem_access_put(gt_to_xe(gt));
> >   }
> >   static void read_mocs_table(struct xe_gt *gt,
> > @@ -80,7 +78,6 @@ static void read_mocs_table(struct xe_gt *gt,
> >   	struct kunit *test = xe_cur_kunit();
> > -	xe_device_mem_access_get(gt_to_xe(gt));
> >   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> >   	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> > @@ -100,7 +97,6 @@ static void read_mocs_table(struct xe_gt *gt,
> >   				   XELP_GLOBAL_MOCS(i).addr);
> >   	}
> >   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > -	xe_device_mem_access_put(gt_to_xe(gt));
> >   }
> >   static int mocs_kernel_test_run_device(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 8e4a3b1f6b938..056c65c2675d8 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -715,7 +715,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   	xe_assert(xe, migrate);
> >   	trace_xe_bo_move(bo);
> > -	xe_device_mem_access_get(xe);
> >   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> >   		/*
> > @@ -739,7 +738,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
> >   					ret = -EINVAL;
> > -					xe_device_mem_access_put(xe);
> >   					goto out;
> >   				}
> > @@ -757,7 +755,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   						new_mem, handle_system_ccs);
> >   		if (IS_ERR(fence)) {
> >   			ret = PTR_ERR(fence);
> > -			xe_device_mem_access_put(xe);
> >   			goto out;
> >   		}
> >   		if (!move_lacks_source) {
> > @@ -782,8 +779,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >   		dma_fence_put(fence);
> >   	}
> > -	xe_device_mem_access_put(xe);
> > -
> >   out:
> >   	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index c1c19264a58b4..cb08a4369bb9e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -44,12 +44,6 @@
> >   #include "xe_wait_user_fence.h"
> >   #include "xe_hwmon.h"
> > -#ifdef CONFIG_LOCKDEP
> > -struct lockdep_map xe_device_mem_access_lockdep_map = {
> > -	.name = "xe_device_mem_access_lockdep_map"
> > -};
> > -#endif
> 
> Did you mean to drop this? IMO we should for sure keep the lockdep
> annotations. Otherwise it is going to be really hard to validate the locking
> design and have reasonable confidence that we don't have deadlocks lurking,
> or as new users come along sprinkling rpm get in the wrong place.

Well, the whole goal of this series is to actually avoid sprinkling RPM calls at all.
We should only protect the outer bounds. I'm afraid that if we put this to the outer
bounds we would start getting false positives on this, no?!
