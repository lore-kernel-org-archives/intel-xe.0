Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD36BC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B7310E478;
	Tue,  9 Jan 2024 17:58:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD8610E478
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704823138; x=1736359138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/nMP2HDMfXkSVuILRoYRrBjfgDox2ghTIku5kHf3D7o=;
 b=cQraLHIvL6S8xW+9Dvf2T83kaRpI5oyLQhz8wvyI1ZtoB95iH0apAcuS
 2f8yzMjYMCpY6hBJZiM/FLkqo89VsO45ORScjL/xEKAHgZCqXDeJv6TsT
 ddMlI2lMRkDd7ISNPfKF52t3wgg9icBNNw7KW9ioGUL7AbEQ4twEOVNIS
 j4sxGtj6II62FeFcHTTsmzJe9ZqBq6VU6iXTgFPNiVoFemrRWY1htUHAH
 uYnk2+XyXr4eOXPBoE5ipkPo6QfVdJMhNTPu8Sp/LtCrt/1N/DLt3uBjp
 EAgA/1/JU6RF6olOSSholoNvCbG+a4o2eMbWkjQPIMW9g3Vn++DjFigJY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464675446"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="464675446"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900841620"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="900841620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 09:58:57 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:58:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 09:58:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 09:58:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta51w3rpIIApQLrz+gPJ7kiaS7sho5hdTBhpWfQVwyD+LEKR/KpB65m8WRLzzu5drL9e5sQ0zNmrwl6YKjA6f8iGx4M1IDplEfOOxcHQXWHoE3CwUM/VcToUP4nrZFpdozRR3Jgh3XrmfQYxYjeYp1wsJPoMEIo8xvEwvVnyBRCvGdn0+0ryrDMa0EvtjSD7OjWF1/wMtE+eotdSFM83j/wQfReUC3qH5dhcN9nQCq1w+5twMxl/e3IgeTdhhvWRN1d1jo96BJaPGiQL5wzoxwKlPFFIuIs0kbemp+F3uXRxyz1p2ACni6dzKB80KrVivwGf+eNkfdPTHuMTMTldeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6ZZkkDI2GOmj4HDoW8TrSHpkOdj9mWe92eaqGOG4Fs=;
 b=jTuUjw7gmXIUULS9Q+QEP+NCRs1EshhVFYrm5TbovBGtDAq4mmBw03XslaXI8zwxnijy/bT+DAUttwVrHzozDdnImiXdq+kVKfnRjsQbQmrhhzcFyYtcNWAfmKf3zhpcnWlC4gIrQTDbykk0q3qldZlAk1gQzPRZH5o6ELtBbpYsGCZOqKL5CiLcjQn+Xlc7JKVlhCjDHImEEUUaPG+6FdgSN3nPSEXvvXYgpl+yBPPQ7yKBg0J40tJg0i8DytfVZHoLyIPcbgN8Y6kL0XoxGKhAj+NiLzaqqcz5uVlxqnC5SzsF0bFBFIEYBD15I0dqcKfCkzTa5Zdx1LYtAPYhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 17:58:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 17:58:55 +0000
Date: Tue, 9 Jan 2024 12:58:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Message-ID: <ZZ2JW1NQVVkNMsAw@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-17-rodrigo.vivi@intel.com>
 <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a68db0d-7c97-4a4c-f9fc-08dc113ca531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oiuVwKYQtO0td9CGxqLoFJdpYMB/Xvju6MCx8NpFlyLeHemgawqfMUaQiTToGd99l83KUfeV7LztH4vFzQXzhzca+SlVK3s5W2K26L4JdFll7/q78B3yf0jwXjTbsp7Tnnpt1kHdBZvzH7uGFziObMQ4gOHuENxmaH5j/2WA/kgGM8LPMffxTBIV2AwmnpLZsM2X1lLbvApaMrFUoKGQszieQ/M8bGhWcDJESueOLe/Wm4C8Vx7sQXiomaRA/GuRsydl6dABWakvgUT13hRlEkeJWPSFaH/Ug3YfBky8EW+YrGJdBjY2s7xgWdBAm8YvvNVfL3pJy+eA25lRUsSVDWdDyLr0C1ogOtrXlIEQ/8uDQvTQTtMDmIguh3Hq2GuPXxccmUl2OtIYnu2E7CmKsWsDAV0WXrvKGQYnRslrLf5Yw1go1ToO7v7FeTXcwR12P2Ld69NOyib+C3frt5zxdcFpv5l4bEaSCC29ICwFRgvYHQaG0PZzaykt6RtVvq4FqiwZ+N3ovZlG6HjHm/pL8BlYIyyJIR4GRb6EpzPtZYvPtunk1o0QnpvIwEiGxQvU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6486002)(37006003)(38100700002)(66556008)(66476007)(66946007)(316002)(6636002)(2616005)(53546011)(26005)(6512007)(6666004)(6506007)(478600001)(83380400001)(2906002)(41300700001)(86362001)(5660300002)(66899024)(36756003)(82960400001)(4326008)(8676002)(6862004)(44832011)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nKP2xlSH4k7Loid3RbxKt88uaYrh483UYWwByBJVZtpy62VF0RLKDS5sc++3?=
 =?us-ascii?Q?Qem6o5NCD2nxBLTVCQuWMqoue2LdqRuXZziQ49LeQR4tHiKW/ctUGEBe3RLJ?=
 =?us-ascii?Q?51MJaf+sLkVeetWrQn6V0Cipp9vuJxepSMzfY2795Wvr3K5OC6ZhvPM2uvva?=
 =?us-ascii?Q?woJTQM9BtCvyM3Zi5RcBHv4/6i0qfpTD2h/7ZC75PVLXzkCSKAVmZAihQQIi?=
 =?us-ascii?Q?8nvqN3yzgA6RpQl69faxfWmUsXmfo/FHeDHBZDNX5TkpI0hyXKyQjt45ksiu?=
 =?us-ascii?Q?/vJAJlIxBZUJWl6mp7QscumGeVex5Q5UwpmFWkrZHb7X7GSJt5JL4BV+ZmTZ?=
 =?us-ascii?Q?aNPXTqnW1xoAhgg6owFZPrY05aFFiOdhz1eowyo6fX9bucJ5UFhHFCRQm9iW?=
 =?us-ascii?Q?y5T/M1TzeZ4ppCIUGgQy2SrcEx8C3MnJpWleWetUZIhoZsCPDXcNzniOXBhf?=
 =?us-ascii?Q?axaQKj6zUW/9O1OIR8fg0BG7ZOeBKxFbzGbilXLupOxTsseTs1CkDHY5Lm7N?=
 =?us-ascii?Q?dyp1x9Wt5v8x9iw4K/gJPpVVNt0psRgknnE6jeO6tDAGz14uu+WJsI6Yub8S?=
 =?us-ascii?Q?SrbyhF7kbcv1meZMUJNLXU3DOPQnvwLmYDCpC9MM9zTFpYW+WoxQE/N1AJrT?=
 =?us-ascii?Q?jxn5iPfjwktZBvYxaWjo3OuKZxh2tcJhIWXn1sriXJkPLhw+GSni9lc5xV33?=
 =?us-ascii?Q?wEp0h2p6ZCPkMfYhASCRPU8p31g/IjrAJs88b20kGaMfoFo9SwioyhfhHgRH?=
 =?us-ascii?Q?+olR5nzD1w99+AfVLdc+huFJGlME6ugtQOPa2Jubb2++Z4ZGz53d2jGVIBVA?=
 =?us-ascii?Q?zwzuDN0FQJbzDfBGoYFuDHlmJgXVpLyWSEHjaS0IPGfdQZ5TgF3z95U2Hro3?=
 =?us-ascii?Q?bZNDApHrp6G9+9t75zDMLsdGN9ugt31f9Y6wbTQRcwQYTALEqB8Xsuqm3Yye?=
 =?us-ascii?Q?+Xrbs2c+fDYTIA7fsKm/p7GxU84OtEw4wwCxiL423zBxvnIU44Ywm9skkzTR?=
 =?us-ascii?Q?9ZaYW6vbKjLAwNuDoDz+zMiBhYm6PFpuX3smi8pBYTuIhteQxSoJ4FPYfgPH?=
 =?us-ascii?Q?DrHYOa8phihPMBPW2wTQzCCe3l4m2/N57lYpQ++Hz35+UHkh2F0aL6o5k4vU?=
 =?us-ascii?Q?tPGAifH6O2PXK/g0gHX3UkSTpyjUuT6x3wVSDxiBPVtUIqMkuxPubCMmeZG9?=
 =?us-ascii?Q?Q/bu75rHdu6faoDV0S49pec6rg9TBBrGPKoEaH916N4qa6qowP+T2DsvVjFT?=
 =?us-ascii?Q?RUK+Y0wz6BkMFUiQdz5tcXw93IskA12VgalfJaXCxxMiCdGiDrcw/daD9hf1?=
 =?us-ascii?Q?Q7cbMEpD+UhoyyGN/yINDUwt4vcIwdjApPEtPtMP+pk1yEipkqOO1TsCfM1H?=
 =?us-ascii?Q?rj3HLSxiBemoNPlWMn/pCK3UE5vbaQ/BFPIklMhFCOPNdiCXP/pxmHuSkMhR?=
 =?us-ascii?Q?WtNsXHbNnK3myegeh7eELVPyxplE/z5/qTbMlpW0sNODnXAp31kHY4fbNg92?=
 =?us-ascii?Q?spn/Rg8a6Ms//AzUZwOfstvzsPi2dVj2uvHwyZbeA02QKf/vmrhfS9+tudFs?=
 =?us-ascii?Q?sFRL2O1t7RRDMEbkgxoGEpznes4RJbKivJb5z3ZdGStrNDVBYBYjc0av930C?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a68db0d-7c97-4a4c-f9fc-08dc113ca531
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 17:58:55.0082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX4zWmjBc/LYKKC0vOS01I8skA+KJS61xyglYxfOOOJblkrvia04gJ0qK3e356qJhUQP82BfWW+/D4SF29gt9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

On Tue, Jan 09, 2024 at 12:33:25PM +0000, Matthew Auld wrote:
> On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > The sched jobs runtime pm calls already protects every execution,
> > including these migration ones.
> 
> Is job really enough here? I assume queue is only destroyed once it has no
> more jobs and the final queue ref is dropped. And destroying the queue might
> involve stuff like de-register the context with GuC etc. which needs to use
> CT which will need rpm ref. What is holding the rpm if not the vm or queue?

The exec queue is holding to the end.

> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
> >   drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
> >   drivers/gpu/drm/xe/xe_device.h        |  1 -
> >   drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
> >   4 files changed, 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > index 7a32faa2f6888..2257f0a28435b 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > @@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
> >   		kunit_info(test, "Testing tile id %d.\n", id);
> >   		xe_vm_lock(m->q->vm, true);
> > -		xe_device_mem_access_get(xe);
> >   		xe_migrate_sanity_test(m, test);
> > -		xe_device_mem_access_put(xe);
> >   		xe_vm_unlock(m->q->vm);
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index ee9b6612eec43..a7bec49da49fa 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
> >   	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> >   }
> > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > -{
> > -	bool active;
> > -
> > -	if (xe_pm_read_callback_task(xe) == current)
> > -		return true;
> > -
> > -	active = xe_pm_runtime_get_if_active(xe);
> > -	if (active) {
> > -		int ref = atomic_inc_return(&xe->mem_access.ref);
> > -
> > -		xe_assert(xe, ref != S32_MAX);
> > -	}
> > -
> > -	return active;
> > -}
> > -
> >   void xe_device_mem_access_get(struct xe_device *xe)
> >   {
> >   	int ref;
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index af8ac2e9e2709..4acf4c2973390 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> >   }
> >   void xe_device_mem_access_get(struct xe_device *xe);
> > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
> >   void xe_device_mem_access_put(struct xe_device *xe);
> >   void xe_device_assert_mem_access(struct xe_device *xe);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 44fe8097b7cda..d3a8d2d8caaaf 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> >   	if (err)
> >   		goto err_lrc;
> > -	/*
> > -	 * Normally the user vm holds an rpm ref to keep the device
> > -	 * awake, and the context holds a ref for the vm, however for
> > -	 * some engines we use the kernels migrate vm underneath which offers no
> > -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> > -	 * can perform GuC CT actions when needed. Caller is expected to have
> > -	 * already grabbed the rpm ref outside any sensitive locks.
> > -	 */
> > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
> > -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> > -
> >   	return q;
> >   err_lrc:
> > @@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> >   	for (i = 0; i < q->width; ++i)
> >   		xe_lrc_finish(q->lrc + i);
> > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> > -		xe_device_mem_access_put(gt_to_xe(q->gt));
> >   	if (q->vm)
> >   		xe_vm_put(q->vm);
> > @@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   			if (XE_IOCTL_DBG(xe, !hwe))
> >   				return -EINVAL;
> > -			/* The migration vm doesn't hold rpm ref */
> > -			xe_device_mem_access_get(xe);
> > -
> >   			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> >   			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> >   						   args->width, hwe,
> > @@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> >   						    0));
> > -			xe_device_mem_access_put(xe); /* now held by engine */
> > -
> >   			xe_vm_put(migrate_vm);
> >   			if (IS_ERR(new)) {
> >   				err = PTR_ERR(new);
