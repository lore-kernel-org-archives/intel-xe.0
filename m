Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E92C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 22:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212BD10E528;
	Tue,  9 Jan 2024 22:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735FB10E528
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704840093; x=1736376093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AEZsY8kjC83UwW0tQc+bUC0ODq6aTNFG0ojGExnmvT8=;
 b=MH7mWZAxwkjj1uRrWjAqPf4sAz1QGRfXlUkaazqmKlCW7cMTsVsNmzcp
 ePQh9+lg1gbSLRGVYBuOF7XfuG0X8S/mqIHARAtnSwZPwKegIqGVVYYN8
 YSY+HcROaxybz6I3HyMlXpa+4lR3emEJWZqw39zU/c3k34okk62hU+FUg
 xPmRxcwg15mhhmEpFHaVZh8gehahniRIJC9mskk9VshdVvPAJvadp3Hr/
 L8KBpayA0vdjrigUditatN1OQLohS8gb+iGHoodvqXttm0EeY+s0fVnuX
 RhDLfsoWyRNpJGd2Xm1f12oWuTj5RIl9eD0mi6F6ggZ3s9Ig29rWwb4H9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5116086"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5116086"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 14:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785398988"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785398988"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 14:41:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 14:40:44 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 14:40:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 14:40:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 14:40:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQpjiZNaZkqPN1jZY3SyoVqFvK4ehPpdTpc2F7MSpN8TXI6xW6L4hYxXt5sENr7W8P76ABDe29sue0iCEW0axplzG30pLG388tned/qydpv8lghWyACPAMgDnD1htdGFnZKBxp7rUgo4EZflncB0RnogpjNKGKGjcsplL1SnSRqQPS7MqCmQTepOLgHz/fHlBwSNIiGl728R1BwZRVgH3FhqrjXWSmkOtb4am63KDnJa1C+ig3OdEUshcnNAJtCponWHLwww0Z8Z8mZql6kXhJWkWgpT+CnML4ty6yk/EmG/E/5Wwm2pP9ZqcNT2BWxqrhSXINI4vRZgFWLlk8eXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/F1l03soPq9GrwMsrfW89nn9ayvXzJT027JHYje5DY=;
 b=XsQr49WGSywgeSulixwX8x9Y3rqWMvDdtZDbTUv65t4KWznY6q9zJ3yeD0vnp4Kdt6Z4YMtdLXGMyqPJg4PaFaBvDDSksQIF0hSH2Y6LplQYzmJfWDk0s41YPqQPmyys/T4//ZwQq5u6vmfLsejcRnK4MnQfOuOvUMjtR5BJU/Qf5vpGUnhrcypB/0ba8W9eOk7SwUHsh3913+PRmyBwGz1ZRs/t6m6usZ4Dy+I9Ewcfe8j9OdMHm5RHXREBQH2YIY1cARV2eTng3VxqdnDZCoJyYDEakqDBBWPzHCYlbSpAksQeW+M5aDo0s5OZj4+qoM2oKJlRTtk1TrM7qwxiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 22:40:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 22:40:24 +0000
Date: Tue, 9 Jan 2024 17:40:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <matthew.brost@intel.com>
Subject: Re: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Message-ID: <ZZ3LU889odBd3mrh@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-17-rodrigo.vivi@intel.com>
 <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com>
 <ZZ2JW1NQVVkNMsAw@intel.com>
 <062c816f-b825-4b8c-aacf-2e4221398455@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <062c816f-b825-4b8c-aacf-2e4221398455@intel.com>
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: d7028b35-7861-4ad3-26f8-08dc1163f7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+mbM9E2h00SeDZWVqoL0COylA0X9cAcVWIUP2Lt9SsD5ueBt17ZjZ8wcXAM5aP5Z2WN5woTf6E7H9s1K4YkTIf8U4/eu09s7IivjJ1BiwOVdsLw18J39W15G2dtsqnf/QXIHPPpEZfd2wdJ1ZAVgiBKkICEntPcmlOVeTht/Y0z500jGiouqrF0VlUPW/K9T5Y/5x2d3ifCst/9SBdv35FnQPxQbmzSBkut6a4qIUmtIihYlqYOsqnnRyCSVwue1n9J/UtQIpTEc0/RioB/o1ptFhRJ28NVWQ27SOooLlP71Urqbf5hsv42LUFtIykbiH/krPBCri2/S0CcCPM0z/LTpElt9SmBW2N4WdJ11ibGiAAsKnDOQO0jfkHOytNtBhWuqa3C3k3Km5cr1RF7T/T9irYUwEd66IEQywuJDZkErJxmDxrm+pjrnb16g8csnVFXkLH+HxlvUrpNFpTBl4/sHvJM2esYgCuk5H3B9hoNtO2YQ7m4hSwLRFRnZ7f1kxCoEUpi05oP4GGGwTZ7mVoLd8DPKizwu9KODsV3qFvGevKwD/tPU6Xe0Tvyki5f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66899024)(83380400001)(41300700001)(66946007)(36756003)(86362001)(82960400001)(38100700002)(26005)(2616005)(53546011)(6512007)(6506007)(6636002)(6486002)(2906002)(478600001)(66556008)(66476007)(316002)(6666004)(44832011)(8936002)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HLlIikXaRoiRuL0Oqs5OuTtDgk+uIPSdEZq3o+eGXI93ooRGniLvfc4l2joN?=
 =?us-ascii?Q?pCK/BKsBWaJ3a/zOUWSkiw5CiLpGov8JX+dmcnFYw7hhsERKYXT/agaCLAGx?=
 =?us-ascii?Q?eTRnu1E8aJngY/sHjaOpd02GZi/rEa8TWJ1HWBHKvUhdtfjoN6CDbh1mO0sk?=
 =?us-ascii?Q?wwfgea9/N/aoRpAmix80K0G5DCjki1877KWM70uE6n1AWwPKhi2Gma/CPO0T?=
 =?us-ascii?Q?my5KngVL8Lo2DNYx7QP1QqBHnOhyQu1y3NLsBQw4YSJzDqnm57Osuf0CUMGb?=
 =?us-ascii?Q?YP7sBQvUaAXx3owJjki59dwZ+SJ5gcoZpSzhspTktFLR0iOr9GflYlCvLyQW?=
 =?us-ascii?Q?ipB1aCYI4lnuXV7sfYv/gZ/287jf0FQnbYi5EaRgpEV7TFsQgT+uzkCTMymE?=
 =?us-ascii?Q?T270+9+PlNU0xvmMINScru51zMFw5CoMEO7PGPoN31zOLSEtMAGW1CY6GKq0?=
 =?us-ascii?Q?b/b5ZI0R44YnsqLdKfjhPEbc0f70d2hdte6/kMYjVbz4u5YRPnVTREaRt+6g?=
 =?us-ascii?Q?w8D5uDS9aCwujRgVMqk5l9FeAh0aCH9aS3tI+C4ELBGrSlIzB1XNBegDd2N3?=
 =?us-ascii?Q?tf1rFpIEapiS/iQmkXJIbmMkuRxZ0ef3EgFYdICitiiy7sweZ2M6PQylHrcH?=
 =?us-ascii?Q?ZfRwd5Dms6WZEwQ2UamrhSFjL63UvdiRsCtwYyAdNbHcc/iV5xjcUIp+/tpk?=
 =?us-ascii?Q?dbdbXBpkizOKtw57WG8WwDe8cmq2TKeH0mLSyihJksZAO7Pwc5meVRfHgSA1?=
 =?us-ascii?Q?hqP3ENbvtOUNTPyCd935s1osoGDNZefSRM67ufkRdAFglhrtxf5L8Z9TTlX7?=
 =?us-ascii?Q?oXu1Sgz+Qx8PXVF/FzNEL7yJY/uMN0NmZ+RSmX70OOHQmHsxeviDV/VaX4RE?=
 =?us-ascii?Q?29y5whQgVNSgflihB7I6rEa692iF23iCvt1zHLe+ECrTIofZioh3ZOFHmwQk?=
 =?us-ascii?Q?/vvPbBd9ulmJNqHgzd81yjjs15X2MrfN+lkTeTHANmtPWvjm7R38C4kt+lxp?=
 =?us-ascii?Q?SQf8HRaaXnhvvXYN4VpaT7vs3zQ7cmAPW+qnGUWeUcgDWP/UDJ20Mwvc/j+f?=
 =?us-ascii?Q?gEBeEBsDKVVdX97Kquio19xE0CGKS3jWV8wqqwq8YbmnYbuOYMtTyFvQcTI5?=
 =?us-ascii?Q?lN2zrWxZZC5Rol/ShItXLYgquC8QUHSv3c0rBV1ya815lCTFcsxtcdBl2vGH?=
 =?us-ascii?Q?qQUIE6vyuZPMidsxlUCc3LcKxsYSn1yzaMYf3B1sRv+X9w6ZWUPAYUokr8/P?=
 =?us-ascii?Q?GXEDt3dnu8nEMpm96ejPeGMZUU6qBfbGUL+3m7/L+GzaDg0Y9l0RSTct3vez?=
 =?us-ascii?Q?ae2Qdhf1h7a2YxaYOU52ZEQEW/Mk7WM4b+te04r/7WLIvzfs8xJtdzGJWbML?=
 =?us-ascii?Q?dRX8E8gE+/5EKo5S7X5oaRe51x8B3iAwSJZMpaPjBYDP2NJyInAARa3dCDBf?=
 =?us-ascii?Q?y9OvFdHBQ2n3BnM+dYVtEJ9nP5Cq72C7DoQPl4b+LF8OTKAZH+Ou0NRfbAW8?=
 =?us-ascii?Q?QnmtvdpTvR5+2oqKdVzg6MStTs7tn/hIsPDgdbmyueTlez67pr2FlnGXF++9?=
 =?us-ascii?Q?NeQi46xuO8FA81pAqEy6jMbvjzJUEAGPcONsPFyEH2ilPlML1DOb+kzhV8IH?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7028b35-7861-4ad3-26f8-08dc1163f7ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 22:40:24.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3KVLBqGWU42Wff3qTfP+np70KkhyJo/Jal2kXFkPrltImCGkGpLGCXEqfaT3GJbsv+NUOM3lgzbMwGRnaDOaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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

On Tue, Jan 09, 2024 at 06:49:47PM +0000, Matthew Auld wrote:
> On 09/01/2024 17:58, Rodrigo Vivi wrote:
> > On Tue, Jan 09, 2024 at 12:33:25PM +0000, Matthew Auld wrote:
> > > On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > > > The sched jobs runtime pm calls already protects every execution,
> > > > including these migration ones.
> > > 
> > > Is job really enough here? I assume queue is only destroyed once it has no
> > > more jobs and the final queue ref is dropped. And destroying the queue might
> > > involve stuff like de-register the context with GuC etc. which needs to use
> > > CT which will need rpm ref. What is holding the rpm if not the vm or queue?
> > 
> > The exec queue is holding to the end.
> 
> Can you share some more details? AFAIK the queue destruction is async, and
> previously the vm underneath is holding the rpm or in the case of migration
> vm, if was the queue itself. But for the migration vm case that is removed
> below. I guess I'm missing something here.

Cc: Matthew Brost

I had understood that every vm case would use the exec_queue and the destroy
would cover them all. But if there's more VM operation happening beyond the
exec_queue destroy, then we need something else?

Brost, any suggestion on an outer bound case here that we would be safe,
but without entirely killing the RPM?

> 
> > 
> > > 
> > > > 
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
> > > >    drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
> > > >    drivers/gpu/drm/xe/xe_device.h        |  1 -
> > > >    drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
> > > >    4 files changed, 38 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > index 7a32faa2f6888..2257f0a28435b 100644
> > > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > @@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
> > > >    		kunit_info(test, "Testing tile id %d.\n", id);
> > > >    		xe_vm_lock(m->q->vm, true);
> > > > -		xe_device_mem_access_get(xe);
> > > >    		xe_migrate_sanity_test(m, test);
> > > > -		xe_device_mem_access_put(xe);
> > > >    		xe_vm_unlock(m->q->vm);
> > > >    	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index ee9b6612eec43..a7bec49da49fa 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
> > > >    	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> > > >    }
> > > > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > > > -{
> > > > -	bool active;
> > > > -
> > > > -	if (xe_pm_read_callback_task(xe) == current)
> > > > -		return true;
> > > > -
> > > > -	active = xe_pm_runtime_get_if_active(xe);
> > > > -	if (active) {
> > > > -		int ref = atomic_inc_return(&xe->mem_access.ref);
> > > > -
> > > > -		xe_assert(xe, ref != S32_MAX);
> > > > -	}
> > > > -
> > > > -	return active;
> > > > -}
> > > > -
> > > >    void xe_device_mem_access_get(struct xe_device *xe)
> > > >    {
> > > >    	int ref;
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > index af8ac2e9e2709..4acf4c2973390 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> > > >    }
> > > >    void xe_device_mem_access_get(struct xe_device *xe);
> > > > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
> > > >    void xe_device_mem_access_put(struct xe_device *xe);
> > > >    void xe_device_assert_mem_access(struct xe_device *xe);
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 44fe8097b7cda..d3a8d2d8caaaf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> > > >    	if (err)
> > > >    		goto err_lrc;
> > > > -	/*
> > > > -	 * Normally the user vm holds an rpm ref to keep the device
> > > > -	 * awake, and the context holds a ref for the vm, however for
> > > > -	 * some engines we use the kernels migrate vm underneath which offers no
> > > > -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> > > > -	 * can perform GuC CT actions when needed. Caller is expected to have
> > > > -	 * already grabbed the rpm ref outside any sensitive locks.
> > > > -	 */
> > > > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
> > > > -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> > > > -
> > > >    	return q;
> > > >    err_lrc:
> > > > @@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> > > >    	for (i = 0; i < q->width; ++i)
> > > >    		xe_lrc_finish(q->lrc + i);
> > > > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> > > > -		xe_device_mem_access_put(gt_to_xe(q->gt));
> > > >    	if (q->vm)
> > > >    		xe_vm_put(q->vm);
> > > > @@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >    			if (XE_IOCTL_DBG(xe, !hwe))
> > > >    				return -EINVAL;
> > > > -			/* The migration vm doesn't hold rpm ref */
> > > > -			xe_device_mem_access_get(xe);
> > > > -
> > > >    			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> > > >    			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> > > >    						   args->width, hwe,
> > > > @@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >    						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > > >    						    0));
> > > > -			xe_device_mem_access_put(xe); /* now held by engine */
> > > > -
> > > >    			xe_vm_put(migrate_vm);
> > > >    			if (IS_ERR(new)) {
> > > >    				err = PTR_ERR(new);
