Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4F0C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 15:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94A1124FE;
	Fri, 22 Mar 2024 15:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwDZS0kU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F291124FE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711122654; x=1742658654;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V/XbW86w/N3ee0gLnCbp1Rvc4tiruLNM2h8TZDR1nnw=;
 b=RwDZS0kUqDclYDYnQiIKaaMmJ5Tqh2XLQiD29goMAYTzEdPDdpkU+X9Q
 5NH1GCrB2GWcbfgt7Mf6rjRBmACj5ZgONPObX1CgHnYCBZFNecdZY7oRd
 1kdujcwx6low4dOS/MN9iAz6IOd81EEm8d3CDPdBdqaVgTxcYJ3d5x95D
 eT3r7njtNpc/PGdBZcV0ZnI9laf9bbj368m1G13F1nEdcIQbwIwImu2iN
 dNGn78zWLJAFIbTQm1xWuF9DU7tVT5iVSgE2gcsL2bW3cq3lZpMkEDarS
 mLdAA3QQxlKVsIzgShj9FLNJeSObS45I0JZVEuhqb95USqebgaqS+0KX1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28652105"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="28652105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 08:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="46073400"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 08:50:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:50:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 08:50:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 08:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLEw4fQgAVXMJ+jnGug477LIrx1SXfF1oOk9NGK62s/8swF+HpjX7gOEayqwCmUAi1VvjxwW1tjvGk1s80kTKYbpqMbsy6pqEnkFeeJw1zNKqo2URq68EG8QYmZoIxkdRzX3JJs3HgqtjiDQK2G+51WceAF3GHOQo0MybGMYQQWo5yPl/fRz1eyPUYGMkFjlGKWVo+4EDNedCZRzN5pAzycfXgie9gGMJgQnBoMAYE7MgzJM5t0sbLTcfl/UxddCEzMHZk5ucYBK+EfzihfAe/eksAV6QtBd4SYAs92xa8KZV9WNdo8ggMhARun23s1LxiCLZX/8F92nVsnGji9z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N4qoBLLUxMVr9JXdPv0rxxOkmjvDSyTGDpJq6SEedk=;
 b=LDieqJfZ90AZO/VDpL945vj/BxUqte6ZYsXnPEWhUJE2nJdpeusHkJ5UigfZa2QVpfZ+acJTDJN8D+nJ3djAHsD+sy5lARjQTRkwm6ZY6BfrYkI0DPCx6xebZoW8TEDJol3qPMdcorE3bklf0R7h5h+LvJyVNqcJ0JKjSIw9OUrG7HAfmufwXN8VKdJSi5SSvoKln2HbgH+oH3qQ94gVBPMjcDB43egwxHdozGAoCtl7n+RQa/kNeBtL7hncFPJcKmwu7XZZCoV60EawwB7LqnKzu483eeSWVOczjFZKxMV0EWVv7buZaQavPKD4TNlYPvECyuPri8s+VcIx9DwhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Fri, 22 Mar
 2024 15:50:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 15:50:46 +0000
Date: Fri, 22 Mar 2024 11:50:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Message-ID: <Zf2oz5ItlLT97Qf7@intel.com>
References: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
 <24c1facddb694a5b500a180ba9e19c23eae47607.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24c1facddb694a5b500a180ba9e19c23eae47607.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 8833d4fb-d2e2-42ca-9ac7-08dc4a87d692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+i7Kbhzs66KOe4LiHPB2yw96IJTgBgsZc3xtZ7bwPzCR+7McJp5JM/qCfjxFMcl0H40k4kZQ6abvOI7F2YGLzpAEh4KR4cFAftNgKVAW7TQjMoYeQste7rlw+B73OaygqvJc1ixyF0haxQoM0Ed+2EijGI0qPsDPJWrb/QP6mN7Xciv8qYJ98gA3rPWsZS8hNHBGJii/RjqWF1fKIbM3oQizudFitn80naordDwi5oaN889aDeBbudpL3cGcsrpVGsF5ApiDuZJ+LBJj8mCEDKN7smY9MV+UvCwku0ivF7AT5S2zvmiPmDqzJedkGnL+ZE+rxUXfC+5dfLYdVBk0EAV6wVQgrjHJ9pRwtk8gEOeX8fnJNgSZrHXIgwSM9tdvI48oiYhPGQ5uG0PD/rhDH3XPM9f1ceTDzYO0aNrjNIi4QvJaJA+n12dEbvO3uf5k3a9jyxxDCPLfC95iattU0UbJ0KE/HDKKV0GFXNo+MiSut43hIV6FfC8bBGzI5nD9fGoNAC08+7l509EiZJn2Gjvd9F8ZRwQlM8KJswSRkqpq7wuij4SrfGxHo6/92JqUpI1x2Ti07HfYj1+Qwo13aHbPEOi/g/pHobvJo8AO7IxhR4E927OZKPUh1HjkMVZoQvTXx6+iAD+7KFuEk9zWVZw5x2yY32QYFU9T2j3QNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2YjIbDgfVipW2Go1k74fHDdblSwMkQ1oOT0w4H4SslQuRhizlf/cGiSqSs?=
 =?iso-8859-1?Q?r2pPOEBN2ZvYljTNHqQMidCQwO9ub0nbP1og589cwGURkuWvA4sL6rnnup?=
 =?iso-8859-1?Q?Nfyvn4WCunyVJ5ZwX+iXUwpXv4tSHJf85uyL5c4YgJnyXTWSe1kSKx9kzK?=
 =?iso-8859-1?Q?IbPFKD8WgdYwgC+1Sq85z4RphNDSUeZ5ET8mN5uqSiEiP2qAM0C2xO8pih?=
 =?iso-8859-1?Q?HyKfZqTLst7lVPvmTmmiUX7GrgLSOpF7NZKsh5yjDwWbXnE5ukhVP39VHf?=
 =?iso-8859-1?Q?2RbcbVdJ7atIMa/c6+vcqW0u73sasjVQ8JAy7GNxEgUSC176Vs5EOF0beH?=
 =?iso-8859-1?Q?6DLJFnBhTy8/m+Irkn2Q8gN7TFuNlDo4Mj/y2Qkd5N5cRnbpnX/m2r89qN?=
 =?iso-8859-1?Q?9pqPD3TxQ4T8r/r1Tja13nOhd4Lx6YtGfdQqRIpA6Kr4SCZ5oUQCCDeaF0?=
 =?iso-8859-1?Q?qqzJQ6l2KXQFdeUiMpXCnlNKzwc38JAODicrrcmDKWQ+YXozKBFiomwhsR?=
 =?iso-8859-1?Q?Q8+3dx+Lez8OgVD0STjyTnT4ceVw5DbKIgUTpMkbn9pB0xzel4NS8Nt1Br?=
 =?iso-8859-1?Q?OXqe+fuO64w/gD0964OYihqUvowmjOC2nuWECmlyZW7ce+jawVOOCyj2Ij?=
 =?iso-8859-1?Q?o+XF2X9MJB+7WUfmxaMJReJnDYlhaCVmJCejiW8lIgGcVKgpIOMG67Pkua?=
 =?iso-8859-1?Q?U0GxXBrCJlRJQY9NApBfGA+sVA9ysx8G5YDjlZwxghCLk8Igl4UBYowdL2?=
 =?iso-8859-1?Q?LyeWnOu0GdmbpNt/KVrpq/m4VyDwI4u1enVn4L2IUgtFNH77PTGrAjzcWW?=
 =?iso-8859-1?Q?N8ogLpimeHVK8n/pzdPu/V/if1btWKVfCa/dgTrfPXIlqxa8f7xH4A1iLV?=
 =?iso-8859-1?Q?Tgh6glK+VBjDe9th96D/70rLETCDLdMX5yQ8u2/FIsdwYF1Wm5xaZ/TkU0?=
 =?iso-8859-1?Q?QwAzroDRHEGlNtIJFASgROqp2rk3kUU5U1I8NWeKnw9NuVLxCGmJCAxUwb?=
 =?iso-8859-1?Q?XAXb2eV1cAvyYmBCFXlJPzdKWBUTkp0r+k6KjweshWy7UZ4faErTfhDDa5?=
 =?iso-8859-1?Q?rUaqO3eU7wjo19dDmXXuDfkXm3B7DIGcqvSwDd3j9F/aA+vNu5LieWAAkC?=
 =?iso-8859-1?Q?zL6XPXpuaUa1iNOJPF9wDlaEmu5+iql22ia16EMRZfYV8cWuUYGh0k6+Ml?=
 =?iso-8859-1?Q?RglWEAmfFTaEwKkmEUItAAd0TF06kqsaUJwfyRzjJt1u0UMm5gp4IxRFYe?=
 =?iso-8859-1?Q?f0rpk+bUxYugYtEJcH5xfDwIqULxiB+HP1FFqZ/kkPXdBWwtd4kwsogm30?=
 =?iso-8859-1?Q?FlVlzm9ppRqgHd9f6wA2yDSll4PcBqzt/jX87XRhnLCNzBJmsD4SoEKZG5?=
 =?iso-8859-1?Q?m10xWSv6HRpFgFcx6QbQan59kKt210SxFguzfLYu+/xBUEt4FxLzHPWm91?=
 =?iso-8859-1?Q?dfbIXJd6JYgQXCsKKH8Pu++mR4VA2DnuuzXJsr1+SbCbyzFYlMhgkW/fQ4?=
 =?iso-8859-1?Q?qArF+b6/NNELXW3qL/GYmDWO14uICtwyMrmJxLece+xFEdSKoShjnQsIIh?=
 =?iso-8859-1?Q?S0lZ608xkyXOLhfHDhXR6x3MrYRtpz4nLXKxZa5FKRz4p/sm4oRLTMK4fx?=
 =?iso-8859-1?Q?eCuiz2kvmA2ucSrc1sa8CI/3eV1SBqzX24?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8833d4fb-d2e2-42ca-9ac7-08dc4a87d692
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 15:50:46.2958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hKOkQUzKp3VnpeYIGCxnMDKHDp4JYyYZHUBfY987Vh3vuiS/UmKU/BSDw3BT4Q2GPuo4WVZHs5TnYggAcdooA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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

On Fri, Mar 22, 2024 at 09:57:32AM -0400, Souza, Jose wrote:
> On Fri, 2024-03-22 at 09:28 +0530, Himal Prasad Ghimiray wrote:
> > Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
> > 'coredump' is not NULL,
> > 
> > v2
> > - Fix commit messages.
> > 
> > v3
> > - Define variables before code.(Ashutosh/Jose)
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 7d3aa6bd3524..5b7be3b5b906 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -77,17 +77,22 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >  				   size_t count, void *data, size_t datalen)
> >  {
> >  	struct xe_devcoredump *coredump = data;
> > -	struct xe_device *xe = coredump_to_xe(coredump);
> > -	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > +	struct xe_device *xe;
> > +	struct xe_devcoredump_snapshot *ss;
> >  	struct drm_printer p;
> >  	struct drm_print_iterator iter;
> >  	struct timespec64 ts;
> >  	int i;
> >  
> > -	/* Our device is gone already... */
> > -	if (!data || !coredump_to_xe(coredump))
> > +	if (!coredump)
> > +		return -ENODATA;
> > +
> > +	xe = coredump_to_xe(coredump);
> > +	if (!xe)
> >  		return -ENODEV;
> 
> this is real bug? because I can't see how this function is called with a null data.
> 
> if yes...
> 
> if coredump is not null this will never return -ENODEV.
> 
> would drop it and return ENODEV in the check above.

yeap, very good point

this patch could be simply a 2 line patch:

- if (!data || !coredump_to_xe(coredump))
+ if (!coredump_to_xe(coredump))

we are happy and the static analyzer is happy

> 
> >  
> > +	ss = &coredump->snapshot;
> > +
> >  	/* Ensure delayed work is captured before continuing */
> >  	flush_work(&ss->work);
> >  
> 
