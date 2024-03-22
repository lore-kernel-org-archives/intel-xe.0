Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52041C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6F511261B;
	Fri, 22 Mar 2024 16:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCkH49uI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B6910E929
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711126438; x=1742662438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pmLzF/d7QWUxrgm9Mar7VgZHkZD0HfMVJ70qqmYRhdk=;
 b=KCkH49uIsxL+C9SlHFbtvitb5g6qxs+0LUmTzCg2s5oIIDomRd1Fjr/F
 W83cIOr/OoEsr3832tEJaQfX2r7iU4XzgUxLThkIxwZjrg++Q2uIwmaxp
 NnMX0jSdDlT/sx/Urcb5BsYTDeRFTG968zmc0DXw3XeWqvfKdQXRJaJYI
 ujOr8TATiBHGVmJQJ/iu6miL9qenNDYMpxEPPKUSVfbuPYT2ZeFtzOD0L
 KyXoFMNPg0WV9owNXot7YEHjF6zINjhlZfrWacsk8VhSLtPOIRvoH3ven
 kPmOar75JWgAa74bPdPB5VpU814FXnU3XjbW0b0K+zCnPXIOH1JX5rL+x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17330467"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17330467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15062619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:53:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:53:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:53:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLAKyGX3chJhzAfczipFrF/BxtdzAIL9WU5/zyFYhHdzvRRNw69A4yVto8RkNwKiQ5AD4HWF0Xwwrcmey0cXwoEwvEcMa0AWj+hvj7kQoamusZEpu1XkCUIZyxQJVvD3AuxeQqHeXITjcoO6uiN22UUZaua4ktVLvH3ZxABjboNRp5heT6vysp7xW+jSymtxVWhsni+AKiCDa9nlzfs3Mi9rdg1rVm37Nha3IAWybnzGXIzsuSFylf6va48NfNajmapIR4E9Qvrv5vsNJIJ2wiCX1Ho8OgWFGPPeVolVioSUnmBLIxanGq7U5dTlILGk7nahOgvGbqiBzRU7QHuvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKq9eYnPvICLwUD8WDOPO4+jxYwqORRRvxh2hWZMK8o=;
 b=MHfhaRgkvHWkgDVQwSKBYcrQxY9jJYnxPW1KTtx8GK9dcUO81YsBbZclUtCEyt6P1WaDj5ufLcssOmzP9/vOTtIJNLdVsNba1CMBVfKpRXZZs8wVGJM5S+HXQEnUEkSowodZTez20kERDksvRvP7bBq2Mk7uqY0bWipWkHMGjJtSEcd57zTCKEqdxRToQTZOUUg+z2Qa7FcFwkEsCQWwE/v2z3jSD3MhOyBvIMBS/c1h2jldcHS3MdVG7VSn0CeFwR8ggTJDuYft8/YnQQ/2WycQ36Y0co1jvmAbNJC5Ad6kJVLtYfKhf6Jh9tP4JbWQmiS+DflwmRzgCb21UprhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Fri, 22 Mar
 2024 16:53:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:53:51 +0000
Date: Fri, 22 Mar 2024 12:53:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Message-ID: <Zf23mh7m8044qXXG@intel.com>
References: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
 <24c1facddb694a5b500a180ba9e19c23eae47607.camel@intel.com>
 <Zf2oz5ItlLT97Qf7@intel.com>
 <4cd61e1479695ed6d48bf4c8ec90d897d4b584ee.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cd61e1479695ed6d48bf4c8ec90d897d4b584ee.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 54830793-2a5b-4084-52d4-08dc4a90a660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: stkW01o+LkA3ZvxB9NMDoiYIbsuCGaOx1Xnwmrw0n/bse9bWQo9la15DPn9R0khGMVpH53clXMLEnZXNqUZHRuUnd9onK2Y6RO6e2QUF4byuVMAzxF5Q4xRJ25Tjm6FiDCxRGW+ncJcWlkRoss3Adpf3ilnly2mUUNJg8ya735RV/hsm1zx4ZRHtTZNLkwptMfkHP6Fw7ucVnaniljjPdQlrcDxwGAwkSybtiplpIwlBUAoEtYrAMP+5noLkejxs4z9jRz5hg6dxSwhS2GllnKx17GuGbbIgN/OUc7zhlqU0ace+xMvXfgQBZ+op6SV0xQeVGBdJTbErKpjD0bugkk+t1rS5o4Sb93dGDMXJfaNTo5mQJFeZICkor/U0mhtLg370vQ39OrJKApKP4tRXa/JBZTCiS5KNP9ErLx2jPqiFT3YiUqv+686WGoj1nhnQ2UPTFYP/hB9JGBTx1UnxPfsl8cEph6REM6SpnvuOdw92cS54viFzjSSXvdUlgm94+NfuQ/M6XmAaLkfqx9W0D4Dq2TjK5PG+/0PtHM5GI8GAp2UCjbSXWYv6aiF6Qv8CwmnD8A2RURymITqSbBT4x5xTJBAcEjyg3vq7bxrU4/JGEUzx4iip1wA0ny7moC3f/K7tFTb6crmJ6eSdhPUo1fUEtxTgoKJ3e43OJbROV4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DIFstYs8kcQHLrLOENAYbrEsz7/Uu2cFJCMGXxQAzvBAwxGWPQ7F8brJ/1?=
 =?iso-8859-1?Q?E6opKE6HVKLJjbw3zyhmM3a1tv0/rop/h0H9ma1yaR5hef9WBdZzdSHw+q?=
 =?iso-8859-1?Q?Pl0QgWtQi+uB0zjU+l02+woc4HA3Gx7eC17gZM/T1RuwVQaol3MXJ3z1yH?=
 =?iso-8859-1?Q?TO32RZa2Gx8EQwjxRNvoAmGQulrw+hwHsenE0Xn1Dqvx+kCVLGfC8YH/yY?=
 =?iso-8859-1?Q?yYnvLgD4HZpGZHx3Z28cVkp57soWA9euUuM9e7X8V6zKhco6s4MybdN1DT?=
 =?iso-8859-1?Q?3U5bzITLnlTDhnsxUjncZfxTGwRvqeDO3ptsRaRILqEaGD05PyYlFx423g?=
 =?iso-8859-1?Q?7//Rew52alk6coce5CPa1bMn8SvbZqdPgEaCAcIcHQeuukaYOmX4ZYA0Hk?=
 =?iso-8859-1?Q?3BXdsqqlQPISVW/3E/O3gPtERDte2ma7QorF2cbhniOHNSygABfA9mMpdr?=
 =?iso-8859-1?Q?FDeUjXC5xxWiM3fYOhnG1GAOZm4oM9XkgCH9z+xlriMKLWDBxR3OFCgdhp?=
 =?iso-8859-1?Q?jXnTCgL358hi47ZUd8y1dkrpoy6U7PIglkPhaYQS3gS5OOs1XCvdRQvoB2?=
 =?iso-8859-1?Q?P8xogLIiuiuwcH/3H9l243W/CCA1sUjk2WtjfRu5fbEFWUpnjaAc2d9GRy?=
 =?iso-8859-1?Q?29CjvXuFIQkDVbYKthG4hj6joTKy9X/IsBgJ+/je2dwE7Xp02DkL6QPIpN?=
 =?iso-8859-1?Q?zvOe+SgK5i6M8IFmRdntTi2T4at2LC0bJ2OTuS7rrrQu/Ja0i7Rm7tVvcs?=
 =?iso-8859-1?Q?CrORTYb6DonwXt5bG32Tam9DhmqpAI/SybhfslMbarra7VYMfkoKiRQqOg?=
 =?iso-8859-1?Q?GVFSNdSccCmr3mHaARr1wKYeg5w9gbkmu4wf/pkJWeLpVRJo5Jk5EU+vYb?=
 =?iso-8859-1?Q?J4SaZKotzun0f2wKiYIf8MwiqPUFvqOaISa4SuAgKLX/t2CpmEUhzHAY8n?=
 =?iso-8859-1?Q?PJJYLVzLbMZW2YKNGcB7X/hagCzDXSK8JwN78DhSIe/VqPnEFVAf/V3/Ua?=
 =?iso-8859-1?Q?KXozMN3i3AmIAV1NmePVNle5n3UOIWbsOrbVNtjVAx91YK9wyUL2qbxQtq?=
 =?iso-8859-1?Q?s7ZjixqkKa26kHAqZcVT7UAVIptXV8jR5HxzcxregiTwc8FvuxvG/WOsyC?=
 =?iso-8859-1?Q?62Yra6VSfJYyuSyfCq2ETQbdXJbkvo2BJ91N0gNyFfcUl1xwnXYfE+7IEz?=
 =?iso-8859-1?Q?wnkIDtdOUVuhiZC7mSM9G9MfVsaFJ2BEZEZena+FQ6F55wCVbRmgy49ExA?=
 =?iso-8859-1?Q?kdb3ShqH2iBMaA+vVQPU0j2Q5UzJaDbjMgErnifyTI96CemjAJDA5dYTxy?=
 =?iso-8859-1?Q?B0XzNcf9VbmhhJ07oFQFohNEPoQ1XdlcEOl68p340FsPAKhyuNNng156ZX?=
 =?iso-8859-1?Q?4XEnGtYwrmSsEED8KXlw+AMlFMGwnbIxS2ZWfW9S7nIxN5c78gSf+P6Xht?=
 =?iso-8859-1?Q?xp1REqaG5pTYgCFJPW0CVjaa1ixjzM4AwKWp8Qutd+zWOmMVChY/0cDxpJ?=
 =?iso-8859-1?Q?FcWlFwUuOEda+0B9mZEcRF91sI5D69IISZsVXqJxjPRMAK9VUWD6Dq1Q6K?=
 =?iso-8859-1?Q?zG3YPSz0OWlFYCiy6laVhap03LWfYAps6hWf+5A5S6XKjF8tU1A1Y47BZo?=
 =?iso-8859-1?Q?BmHpmyMkSTCNxRJGAYFk5Tu+qMoByxLYNO5XxxzMpnoZ02mpOF94x2Hw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54830793-2a5b-4084-52d4-08dc4a90a660
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:53:51.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20I7KGwok/qgzmpQa1GwBKpHqt2Pxj07FhMqWpuWCl9JfpCzV2Kwr7m+drNXps2ojEuhHdQmcBa4GpCh4ohLmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 22, 2024 at 12:08:31PM -0400, Souza, Jose wrote:
> On Fri, 2024-03-22 at 11:50 -0400, Rodrigo Vivi wrote:
> > On Fri, Mar 22, 2024 at 09:57:32AM -0400, Souza, Jose wrote:
> > > On Fri, 2024-03-22 at 09:28 +0530, Himal Prasad Ghimiray wrote:
> > > > Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
> > > > 'coredump' is not NULL,
> > > > 
> > > > v2
> > > > - Fix commit messages.
> > > > 
> > > > v3
> > > > - Define variables before code.(Ashutosh/Jose)
> > > > 
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_devcoredump.c | 13 +++++++++----
> > > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > index 7d3aa6bd3524..5b7be3b5b906 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -77,17 +77,22 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >  				   size_t count, void *data, size_t datalen)
> > > >  {
> > > >  	struct xe_devcoredump *coredump = data;
> > > > -	struct xe_device *xe = coredump_to_xe(coredump);
> > > > -	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > > > +	struct xe_device *xe;
> > > > +	struct xe_devcoredump_snapshot *ss;
> > > >  	struct drm_printer p;
> > > >  	struct drm_print_iterator iter;
> > > >  	struct timespec64 ts;
> > > >  	int i;
> > > >  
> > > > -	/* Our device is gone already... */
> > > > -	if (!data || !coredump_to_xe(coredump))
> > > > +	if (!coredump)
> > > > +		return -ENODATA;
> > > > +
> > > > +	xe = coredump_to_xe(coredump);
> > > > +	if (!xe)
> > > >  		return -ENODEV;
> > > 
> > > this is real bug? because I can't see how this function is called with a null data.
> > > 
> > > if yes...
> > > 
> > > if coredump is not null this will never return -ENODEV.
> > > 
> > > would drop it and return ENODEV in the check above.
> > 
> > yeap, very good point
> > 
> > this patch could be simply a 2 line patch:
> > 
> > - if (!data || !coredump_to_xe(coredump))
> > + if (!coredump_to_xe(coredump))
> > 
> > we are happy and the static analyzer is happy
> 
> coredump_to_xe() will always return something so not a good idea do this check.

right, I had forgotten it was a container_of...

So, for now let's go with your solution

-	struct xe_device *xe = coredump_to_xe(coredump);
-	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_device *xe;
+	struct xe_devcoredump_snapshot *ss;

-	/* Our device is gone already... */
-	if (!data || !coredump_to_xe(coredump))
+	if (!coredump)
+		return -ENODEV;
+
+	xe = coredump_to_xe(coredump);

and nothing else, at least the static analyzer is happy.


> 
> > 
> > > 
> > > >  
> > > > +	ss = &coredump->snapshot;
> > > > +
> > > >  	/* Ensure delayed work is captured before continuing */
> > > >  	flush_work(&ss->work);
> > > >  
> > > 
> 
