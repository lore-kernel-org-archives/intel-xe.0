Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F2C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 21:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B59310E6C9;
	Wed, 13 Mar 2024 21:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gruoMbMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B952D10E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710366018; x=1741902018;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i4r4xjlG/UJj+A8qzYG1nvW3ZJPkofXk4PtxWXU7QiQ=;
 b=gruoMbMSs4hOC+2XnRBoy571GvLJLon3OHTvgJGFw+2iMzWV02ayHK7H
 nRM3Ls6E2ZJimxjkuoUkXMaAvGA3sSWUPkKi4UULQil7P1gNda8aq69yS
 qbXmCMMFSYb1TCPBN1Nn9GNkIDbbQiK5rSQrk+urnfbTPh+EIiwIQ9kBf
 CWvnzpQ1Fz+PVYOBPoeq2SAxH4EherW5DCWb59Aiyg4YVfWQRbwiyO7FF
 Sib5dXJUJD6Kh/oGpIrdDCIZlIWN2vRLzTM78YAYJyji2ry06aui2W65C
 VNUhMXIu93Ug54yuMoF3dEW9K3DtOgjY/bGeUrt/e36FA23e/orznQheW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16559264"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16559264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 14:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="49512413"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 14:40:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 14:40:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 14:40:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 14:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffSUOPtgiQaYmjCXOLG4Ss3yIIvpNlTuzcbOn1ZGU7W8gGuM3ysVvD6SvPqRoB6EOap/JVg2qIhaAOrz4FV5aNo3FWA48oVrLJkyUA6a37JlRfcsSTZe1vHPsH5wR7hN+1E51m9pBcncO1oRVsg/7PbUMc7CJQlf4utxqgBmHO87JY3vZv07HAVDCnFiaoNXwMQICAB9aY1GyzDgyN3WmYnSHnmlt+6RC2fSIf8+zwaa4Abh/YAQs+5Ab4VR7awF0aXVfR2fCmDx24wuJDqB9pt6zm0nTvbHqdnMR92WMHFu9AREG1QKwaDDbMI6vJY63kZg5uARy1lE0ZVGxCq8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ROYeH4rJDTHNOy1i9fj1BXqIHmcu7g4sfyOnzWInIo=;
 b=bVlDRwFLNRFS6Ndt+FSyYX+nBmBdSD6VwUT6MMUzLQYc3MLYCzOq8ta6jPNHTsXUKfgvt6Xv/SG2UBV91Ci2jEmgdmm8A//tDUzNustRISRHkrAlj6+FcujKidDYYzkVPOMQUk9//dOpPJPasI6+Madh9h/g3/Vw+tiq90ZVpXphN1NTZTAMdG72fPOCo2IEnOCnwm2WMooOjPlBVrqwl3zbHOaHmg6E5bUXyDN7WUfAZlHizVltt60m1pA5gBm1voJJKG2QMtKdVWmsva3/W+mxMu/t8XKvsGNeVPPhrFnGs45Mi7FeiahwLY/opzbdSUxbIpktrSLFdJF2JMXfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 21:40:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 21:40:14 +0000
Date: Wed, 13 Mar 2024 17:40:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple wedged state
Message-ID: <ZfIdOd_wHgm0VcQx@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <qjap3n4uesovz4eaxnxjwvdiylv7gu7mz6p75umc2lvvcqi2hx@ghdxl2vwkz4g>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qjap3n4uesovz4eaxnxjwvdiylv7gu7mz6p75umc2lvvcqi2hx@ghdxl2vwkz4g>
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef61ac7-be7a-42c6-334a-08dc43a62a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F6MBrOuOMU6kd+8ZIZJNymjS2rAlSe8EGeEGwE6jfFdDzpslMAeZlc+Ht/Qmw4H0jmsMdd8X+3oZlUAsEivaBUedwVdUHkcB7rQGC8mMCWoYDt0405ZU9qyGYpn1guAvcsJ93qLIVbj30dzngTT4zpUDLWtq9DOLvFvTzvvofg1UJ/hR8vkk+qvZcEt436+SlY+D/yhFVpzxS5ZMDja4TeVlxXK5eeRq3bw3PgGPkK/vohTsv9EvPuQv5mfXmAmJe+YoVoqhk1a4IYdLzrh2Ubz6kK0YVaIhsgMfvGq5bvLH2LKFK760Hvx19rx4bm+yUptIsZK/OTXlLOYqCVa30tW1mH5jQq7ALE3XX6MaztNTkNwAJ70JReGGBh7lEQlJIGKE23JDtQa7wk5rXz5Oq6c7kceUiDbyw2tGiYFaL0/qmwQJZbhSR3YD6Tz+6R9SMhmF7upEeZ1nVF11U8fHZmwfcv2PbHfqeeUhoCVEfS1P0o71HJJXObzPkoJ61KW0UvmAOZ70rVG5lsum0agdydWHyBXYibu+hscTGqQDc7mkiU8RTI0qsFsr4oXDKCFK6BCqpuffqsI85U4oITKGz8mk2JZcjM6DHtefE6ATVx5wctAV4Zt9e/usIKhKdRPI+YLDGPaRebVioBKQpKkeW1t338f9rVkzdp+sw8XQYNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IsepzxZSlLC2uPts+qSRabUciPaHUd7M2+w9RmUal7CRajNGt6xLrw6pdO?=
 =?iso-8859-1?Q?AuU6D9+KbXPUMfgi/SFafLa1SP6SfZUUZNB8rva2Nq3q+OyzOmkTGHionF?=
 =?iso-8859-1?Q?PVEkSrHo5aT+hHPAqPu7c7XRjybLrI+j8+0C6zKCGS1mp1MzUaKbJMjONq?=
 =?iso-8859-1?Q?ZF5+vkMVm0gvRJoSOiAdnpj46UJrKx5YxUVp7gDXcXuAdEAu26ThdVWWQL?=
 =?iso-8859-1?Q?ymlGwkk+LqwQoSMJp5aQcT27+6v8m2Nn0dzxLBZeoeVaPOahTKJNtquJDc?=
 =?iso-8859-1?Q?3nUxdwQYlMLqIhWyf0L5iIqdnvCW/BPEGB2QlkywYGH2Bkw72000thhnF3?=
 =?iso-8859-1?Q?DQRavVAlbT8fCOzL8TUn97KR7j0XttlD4imtGSTbATLUPF5VrcbUs69XNp?=
 =?iso-8859-1?Q?jGlAZBy/v3QUX4oD+cwjsSRUU3MKybFAezpFUO5oxUBQAUvJuENfPIYQmK?=
 =?iso-8859-1?Q?SZ6k7GKr1C9qHAuY5Hu71n5vQj+vTmjMJbGm0gNH435w2zTf2jbiUZ6h8j?=
 =?iso-8859-1?Q?eRXHNW9Qj2gqivcuU80AieUPpJiogY/are7TbYCqC6LOYDxaxF7Sm+9Jb4?=
 =?iso-8859-1?Q?J/V4r+/QLRGWVvjb5o2SrMbJj1VckNSvFowswV3wEA2phAXZAI1TlcQ/Yq?=
 =?iso-8859-1?Q?PoscDGPSBFIlEczM9fcWOJNiHi1O7Lz2XBAnt1TKvv6TvW8WKubWT1SzeC?=
 =?iso-8859-1?Q?bysGmbFVG8NXDYqVDqfyU8VLtlMjWHAHZFi7ai8LlbU16wDC9joZQqH9J8?=
 =?iso-8859-1?Q?W95I4+UIiFXA62fscJYXweDePs2BC3ZlzeCacAl43B2NM00KRhNuOcR2Ly?=
 =?iso-8859-1?Q?YPQ69nBd4rWCYJMsocbGAFdR/xl+7yS6QXYy0xAZcmkvU7ggoZbxEFVKXP?=
 =?iso-8859-1?Q?bLiX25Wp9GK5DlchmQZrYvdsqfqHhVqLNxc42LgzxqWCv+l5quAGyi0xuX?=
 =?iso-8859-1?Q?XNw3eEB+I9HwcIK7mjabToQ4bBuPnPwKCTMrswjJEEgkEj8wko1a9/MAyv?=
 =?iso-8859-1?Q?CrD2FydeRDChoMha4VsL2rXjfnBC7pvsvmZ8+RxqvXxxcZWyiqMngDOQsK?=
 =?iso-8859-1?Q?K57W0Cz48MatnuuIlhWSItXwobCVOcmYay5lCBMr5WlqAgmDDTvZFHsI7w?=
 =?iso-8859-1?Q?6zsalD5ZHPY0Np8w6sAeYe1dQhxCKPfEQ74rqpZC63OhVFjLrGl5M0B+FQ?=
 =?iso-8859-1?Q?MmFLJWpLdBoh9v0JOY1yhYyMbZMG/AWZ60SNKxt+jCzkn1KqrGeqaRAiEI?=
 =?iso-8859-1?Q?nG1CGtahISODUlT0//hwnI7xITwqJpOi97SgG+c3DGIARAJhgmbJy9wYlv?=
 =?iso-8859-1?Q?DHOMtUEsl1d8yBYjRvyP0j3ikVEtcwj3ftG6cDIKPMVypf65YvmpMO7puB?=
 =?iso-8859-1?Q?dFP/seoFS3arLyirLVxtvIwM51IqndGHHzXOLUqFtsikXsaut/qOVkUz+b?=
 =?iso-8859-1?Q?Kco6/LochoYDJd+ECWqyW/eFpq3CxL5dM7P/VT0ZsEh//qkSVUp/FD4E+p?=
 =?iso-8859-1?Q?VWec1mGRGn1/c4boTrPsiYOKCDaa8ySCXj5woRE/+ex5q/AT78ZCXSyMkM?=
 =?iso-8859-1?Q?FbnisS45di1SNBWLvTXYixAlTZgIDitMDfs/8z3Rudx/G4uxgfG3I2vjtT?=
 =?iso-8859-1?Q?TcgVr1NUlXsAlPumJGlmjnL+b6LH1qgWW2V8Gnmk2JlFBN5uzQahbjJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef61ac7-be7a-42c6-334a-08dc43a62a94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 21:40:14.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iucpqKAMGVHu69ibg2F3fiKctYmSYR325qd9KkFxhzx3FkyULa9WUc4xmh2w4sbcY0vWG4qp3CDnd4y6EZHgDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Wed, Mar 13, 2024 at 03:27:05PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 13, 2024 at 03:54:57PM -0400, Rodrigo Vivi wrote:
> > Introduce a very simple 'wedged' state where any attempt
> > to access the GPU is entirely blocked.
> > 
> > On some critical cases, like on gt_reset failure, we need to
> > block any other attempt to use the GPU. Otherwise we are at
> > a risk of reaching cases that would force us to reboot the machine.
> > 
> > So, when this cases are identified we corner and block any GPU
> > access. No IOCTL and not even another GT reset should be attempted.
> > 
> > The 'wedged' state in Xe is an end state with no way back.
> > Only a module reload can restore the GPU access.
> 
> I don´t really like this last line. See my feedback on igt: this should
> not be a module thing, but rather a device thing. I don't want to nuke
> xe from my igpu when debugging something in DG2.

yes, I will take care of this and everything else...
it is per device, so unbind + bind of the device should be enough.

> 
> > 
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
> > drivers/gpu/drm/xe/xe_device.h       | 11 +++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> > drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
> > drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
> > 5 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 919ad88f0495..5f0a2bdb7c24 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> > 	long ret;
> > 
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> > 	ret = xe_pm_runtime_get_ioctl(xe);
> > 	if (ret >= 0)
> > 		ret = drm_ioctl(file, cmd, arg);
> > @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> > 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> > 	long ret;
> > 
> > +	if (xe_device_wedged(xe))
> > +		return -ECANCELED;
> > +
> > 	ret = xe_pm_runtime_get_ioctl(xe);
> > 	if (ret >= 0)
> > 		ret = drm_compat_ioctl(file, cmd, arg);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 14be34d9f543..d10664d32f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -176,4 +176,15 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> > u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> > u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> > 
> > +static inline bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged);
> > +}
> > +
> > +static inline void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	atomic_set(&xe->wedged, 1);
> > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> 
> should probably identify the device and remove the mention to module
> reload. At most say "Device needs to be re-initialized" (or "re-probed",
> not sure which is better). Do we want to mention it will be FLR'ed in
> that case?

I don't want to mention the FLR specifically.
We have the driver-initiated flr that will be likely trigerred on
this unbind, but that is not the full PCI FLR.

For that we would need to write 1 to the 'reset' entry of the PCI
device. And in some cases we might even need that done by the user.

Or perhaps a big message explaining everything?

> 
> the rest of the patch seems to be device-based, so it's more the commit
> message and log above.
> 
> > +}
> > +
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 9785eef2e5a4..13971eb2334f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -455,6 +455,12 @@ struct xe_device {
> > 	/** @needs_flr_on_fini: requests function-reset on fini */
> > 	bool needs_flr_on_fini;
> > 
> > +	/**
> > +	 * @wedged: Xe device faced a critical error and is now blocked.
> > +	 * It cannot return to life without a module reload.
> > +	 */
> > +	atomic_t wedged;
> > +
> > 	/* private: */
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 85408e7a932b..972c0c6d0608 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> > {
> > 	int err;
> > 
> > +	if (xe_device_wedged(gt_to_xe(gt)))
> > +	    return -ECANCELED;
> > +
> > 	/* We only support GT resets with GuC submission */
> > 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> > 		return -ENODEV;
> > @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
> > 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > 
> > 	gt_to_xe(gt)->needs_flr_on_fini = true;
> > +	xe_device_declare_wedged(gt_to_xe(gt));
> > 
> > 	return err;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index ee1bb938c493..5b2eeb2048b5 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> > 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> > 
> > +	if (xe_device_wedged(xe))
> > +	    return ERR_PTR(-ECANCELED);
> > +
> > 	/* Copying CCS between two different BOs is not supported yet. */
> > 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> > 		return ERR_PTR(-EINVAL);
> > @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > 	int err;
> > 	int pass = 0;
> > 
> > +	if (xe_device_wedged(xe))
> > +	    return ERR_PTR(-ECANCELED);
> > +
> 
> bikeshed: I never liked the term "wedged" much from i915.
> Wouldn't "dead" describe the situation better?

I'm with you here. I was even pushing back on 'wedge' so people
would think that we would have a complicated machinery state like
i915 where people get that to plug some workarounds.

I had 'busted' in mind. thoughts about 'busted'?

device is not completely 'dead' because display is still working...

> 
> what was the motivation to add the checks on migration and migration
> only? If we want to make it die/wedge, shouldn't we be checking this in
> other places as well?

on migration we try to submit ccs commands... and on unbind/unprobe
we call the eviction of the buffers that ends up on that place.

So far these are the minimal places that I found that could block
the execution without entirely blocking the display. So I'd like
to start with this.

Perhaps we will end up finding more places to protect, but for now
I don't want the big hammer to block display.

> 
> Lucas De Marchi
> 
> 
> 
> > 	if (!clear_vram)
> > 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> > 	else
> > -- 
> > 2.44.0
> > 
