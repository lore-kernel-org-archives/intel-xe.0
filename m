Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F809C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A810E6A4;
	Fri, 28 Jul 2023 14:46:31 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2910E6A4
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690555588; x=1722091588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0AQ2OcJLaOvEPq4Pv2piJ2wPhk80SGY/bBQyDegxfk4=;
 b=TFapTwuBnc2QbZYoyd0zNhyY3h75+pzm6CHZVuIG6iBP1Ad+BUTGrgq+
 FZW3w9pLbwSLg/4AaLWgq7AjUJG97OrHD1JXXT3Ex5TYgUlpQ51C7cLal
 rLfy+X/HdhX4Fg4nxAH1aKZQfuzXBi3fmN031tPwtdsTeJ7mc5PQa1gFt
 FOGC/ipiwqg0cIZTXdVPBQZyYPCUvZ3Cm/Mcx6JPkKitxIi9+e8Bzde2u
 LqntVFeVRyizu1vD697rh3TywCgA8UjHK7+5WJcX6O7vAej6gwhc6L95M
 re8y3PBucoy0YFnpdqFTzDaFYcFfwkjU1Ag33RD/i3ZdAHCwQno3K1kZy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372230078"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="372230078"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="841354803"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="841354803"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 07:46:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:46:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:46:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD04p5d3aIgWtvLRPXlWqmSgBN1rtzROlknI0QasKCIZWgFLZ6Iopn8oy2GHIJaAK5k/+g3Y37hz3a45eHXGfGYVTorqzpVr7sZ87IWvDh8E/XIuKE5sZ2O+x2XIJ62OEE3Alf+zSYZCVtkRRWKSSvCK4iAGyrYf3SMv74gOMhtpuNBXIUebmtx0+8kfWmDcxHj0Pna6AVkbS6oogKaOIYAIuNGq/+FOOFU9Wy/xlYJKrKtuNXMe1NGQB4n3U3b/utmuzXhYXfn+WkgDzl7TSVwKNKk8GgWLBKMfk6qJVBx4qglPpMArGSXU7OR95gs/rMkueouhh4AWqLyTQ6vikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCAniTfM1zWVRfEfhr0EuXBIbidQgyTCzQzrbCVxkgM=;
 b=X5QvWbi61h4Xo3LB0l/UOTQ0Ca+r+vLibjPa9sy6t0hJWQn/VLepNJshgE4LLKYtevZJN0bb0YkbZXAaBWYJHYlyvT233j2VIe6ZhBYoINVgj5LXlUfOQux0sTyNZXn8B2T+vZ9g2by0vl1aNpbDCIIWb0LoN8kIeVQT66NgoEv3kBKqyIN+jx9kMEjZjXBtdR+b+gf58aYCzUMTcwfcjkIwb/kN6ULTKci5YtcFfoWz2c+MoXIy63qyP5BvpEDvvfDF9HMw8BzNYr/oVW8mrcYAuIEMGRntOSFCT7eNVKJL684ebQHgznDvjzTdvAhFHU5iX/JhMzqn6MXobPe4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:46:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:46:14 +0000
Date: Fri, 28 Jul 2023 14:45:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZMPUhUv2sT6jq2W5@DUT025-TGLU.fm.intel.com>
References: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
 <ZMAE0yXpF+IdQ6KY@DUT025-TGLU.fm.intel.com>
 <4eda6552-9229-11fd-89ab-3441195e8520@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4eda6552-9229-11fd-89ab-3441195e8520@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5c44a8-6935-49b1-a96f-08db8f796464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idleoRThYA6PhNPwXWyj72bFXfILScbnA9kv/PYChCG/k0Lhf5uO+Qu9kzPMN7uwJgjlcmxNTDu6kkI8c3IsVvHXo+5Tt3usw6hjNgMOR6JUAWTKmWDXIuLrPZBWQH/u3HjVoCONU97GrC5xLkquYlbxM6IHa02+mdNZPL66PoV+Tvh+SamU8DCHml26QcUK6ikvincCs/iuNjq+VkfzKpZ0fR5mn1ex67MPr0Ew/cnwBAVxd5AinOFJ+LIRCWRc8qgOFgZF/0rlTNO+KTv0bsrMGo5zII4hKagp5O9nOOfCkZzbjD5+HbpXdsaiSYqacSkz53w5KaD+qCGy7ZAYp2TfGkRxTzYZHrTxPJpHKrRXaz4sS1w2XSfRLUllnFQtDyQZRZIkp/N2HdsINmDtjF2kptaIY4bTBMxhs9/Qy0gzOvRiu5kKoUfswdfXj+ZPmUbHd0DDPYopNvTWNItwH8laZGRT/9Y29/OKETRqXqmtfp8ee1dXrOv2fa2gA8iV+g+RFVk2fzpU80Xth4A+KJFoJKZtIX/NUP2LgGRNuXjsMqMd1bIrcBajxxn6fWgr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(86362001)(2906002)(44832011)(38100700002)(83380400001)(186003)(6512007)(26005)(53546011)(6506007)(6666004)(478600001)(6486002)(82960400001)(66476007)(66946007)(8936002)(66556008)(4326008)(5660300002)(41300700001)(8676002)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+BAU7JrN3R/vLUEBUBIFXTmuq1PrZ+DJsYSfB6Vp3n1+OPjeQkgBDYqshSiq?=
 =?us-ascii?Q?vq27kkKw6sxYcD9ky8n69wh1Metu/mPF732s2l7kchfyUl0ENzD8RMCF2BTV?=
 =?us-ascii?Q?cOA6uWhQhw+wg+KPgpiXOMXGknwCaqbNry01lymjW/Qnge6k/2JfqOtFcaqN?=
 =?us-ascii?Q?tRxPckTU8zUuHdZipv2S00PTx6ch64OcMKVBt3HRDdijYnV0HEjcU5Wb6E8H?=
 =?us-ascii?Q?zmC+dQYDbIC2EmVfPN8j7lluCra0XpgnT1cHDxQLX0SyaqpJRYs2mYN58Uu2?=
 =?us-ascii?Q?b//MHVthBNygXLThYEPe21DZpa6lDLYwVjKJ7DUjZeflGuV/ZX2qg+TJdW5f?=
 =?us-ascii?Q?qrK78rbOFXTMdLiA6WhJ0Z18fIZV3Fv8mzrU2kWODxSfI0H9okSBzf+nLO3q?=
 =?us-ascii?Q?2eGrw2Bo5H42t/hz100/zBMX0GyTl6MJN41B1wgBzWTda+a3d53sLDkUDpRt?=
 =?us-ascii?Q?Krlioz+uyJpt3MMRCZHIINHoRw5Peetsh9XOiMI+Y3ypP4slvO8AaEFAHqRT?=
 =?us-ascii?Q?DALm1JTU8tVBj6bHAfj10vhxMLMdTFbn/z9dGYYJXcLwder+TebuUiYMsTTK?=
 =?us-ascii?Q?jFwd9lj01md4oQztD5TbkMliNV2iaUIu5PWwLD9kih9RjQCFie47p1CLbWia?=
 =?us-ascii?Q?71eCfCAfvrLOqAWS1HL5myhI9a4J0gycWqLCnPnYX+5Djqa2LduAz8tSJkXr?=
 =?us-ascii?Q?korbloI6uu5UjV0wu8WUX+zPGLZdKxC13hbs9Ty9udzubdNMO/GlW0RYMH74?=
 =?us-ascii?Q?f5Kjrw+l4NFqeoeJdVisnjDtoMaX/z1GlpbF5AFgiW4g6ey1TjvkoTk98MCT?=
 =?us-ascii?Q?E3+v5p4sBGMSjzW6CH3S552yK2VaZqg7jaWRt+cfREMezkkaDnJZo7e7kpW1?=
 =?us-ascii?Q?eUBV1+rvsERjYjupRsUx8/ivqXVZSZDhMGEdIPV7XUDmH3ekkDD6KElB7Rvm?=
 =?us-ascii?Q?oKfnhYbCxDUeSB3H7vP0PrzUJOFxnJZf1iGkWqecXGsLgT+oFXGk1Bz5y1uE?=
 =?us-ascii?Q?JHwRRZacUg2Hy2ZFy9G8ktmlq+wAGWkpl4VLe3nj0J4PRBMihDSbO24pyNc7?=
 =?us-ascii?Q?qsxC8D/Kx9Owjj8O2/QRdYhGUaeEEuwhVB6hwIr6A/TN9NvyZr+DCJuu8Upc?=
 =?us-ascii?Q?i0tXidF9Jhb000gUPubS3OBSNz8IjzHp+vLIgXA6LCPcZ56/HbATmRCnz4J1?=
 =?us-ascii?Q?7XqPy/Idcmsjk8PDV8a7fjFwUbf2Te7KW2x586KhFeYkvl9j2AVrIUP7lWZF?=
 =?us-ascii?Q?4ugIfyiedz6lrDsDeDZgxsvmo57WdY32RSP+EfXw72veoCuFu4PwQgJYDEjP?=
 =?us-ascii?Q?AM7nGIMCo8wwF/lKObZGMDuvSOXHlHvu0ki51ZeTFrkpmqckZejZZQGU7wch?=
 =?us-ascii?Q?9hm3gWOyDU44kopjzOuHlA4hfE093UCq1BrgzxBVDmGlOM64LZSQbNxJfueT?=
 =?us-ascii?Q?xE4/1tPyKoaP+0E3mixYApdPXwl2KKyHrOT8NT2gtlfockYdpISdiv72DBNO?=
 =?us-ascii?Q?p38R+X+5evkdXJ/YgTUVvzYmGxwYTcosOJVMfD9Ta6BVm6FMpLjtpafparto?=
 =?us-ascii?Q?nfwZVkllluLF47ulBk7mbUMDRjdPuiclsbEnp/TcVFXpVnNXMbbP7Awi1Pp+?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5c44a8-6935-49b1-a96f-08db8f796464
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:46:14.2759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhdSQmeTA4O3HOS3HOvUO3bOFn8ng+riYUXC/tOhX0YjiB6+0Wwn/2wX8YG4waYzyIMbcD0RiZHPeef0R0wf0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix error paths of
 __xe_bo_create_locked
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

On Fri, Jul 28, 2023 at 12:15:01PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> On 2023-07-25 19:22, Matthew Brost wrote:
> > On Tue, Jul 25, 2023 at 05:12:39PM +0200, Maarten Lankhorst wrote:
> > > ttm_bo_init_reserved() calls the destroy() callback if it fails.
> > > 
> > > Because of this, __xe_bo_create_locked is required to be responsible
> > > for freeing the bo even when it's passed in as argument.
> > > 
> > > Additionally, if the placement check fails, the bo was kept alive.
> > > Fix it too.
> > > 
> > > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index e240df6c7ae64..b63290540dd9b 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1158,8 +1158,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >   	/* Only kernel objects should set GT */
> > >   	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
> > > -	if (XE_WARN_ON(!size))
> > > +	if (XE_WARN_ON(!size)) {
> > > +		xe_bo_free(bo);
> > >   		return ERR_PTR(-EINVAL);
> > > +	}
> > >   	if (!bo) {
> > >   		bo = xe_bo_alloc();
> > > @@ -1197,8 +1199,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >   	if (!(flags & XE_BO_FIXED_PLACEMENT_BIT)) {
> > >   		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
> > > -		if (WARN_ON(err))
> > > +		if (WARN_ON(err)) {
> > > +			xe_ttm_bo_destroy(&bo->ttm);
> > 
> > This doesn't look right as we haven't fully initialized the BO. An
> > example of this is the snippet from xe_ttm_bo_destroy:
> > 
> > 1012         if (bo->vm && xe_bo_is_user(bo))
> > 1013                 xe_vm_put(bo->vm);
> bo->vm is only assigned later, see xe_bo_create_locked_range line 1300-1302.
> 

Ah, yes I see this now.

> > 
> > This shouldn't be executed in this error path.
> > 
> > Also do we need to do a cleanup if ttm_bo_init_reserved fails?
> No, it cleans up the bo by calling xe_ttm_bo_destroy itself on failure. This
> is also why it's safe to call xe_ttm_bo_destroy right before
> ttm_bo_init_reserved in our setup function; on failure it would have been
> called anyway.
> 
> Because of ttm_bo_init_reserved semantics, the function is slightly
> confusing, but still correct. From the ttm_bo_init_reserved docs:
> "If a failure occurs, the function will call the @destroy function. Thus,
> after a failure, dereferencing @bo is illegal and will likely cause memory
> corruption."
> 
> This patch is correct, but the semantics are confusing.

Thanks for explaining, makes sense now.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>


> 
> ~Maarten
