Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C57DC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 18:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2328A10E260;
	Thu, 14 Mar 2024 18:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BU4AnUd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5BB10E260
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710442423; x=1741978423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cE4degS0H9sgeugwJjMHBN8MJ+aYZb7r97MjGngay5I=;
 b=BU4AnUd/ydQtoTX4sDJSC8KT3GaBsTE0B9+4wZ96dEkAq2Q6futwrP1Z
 2Xx4JTR+gFNCjunzJOXt6XAkW5QRczsC7yqpZqn79UIVUhy1KI2Wdgz5k
 923g5X+APryH2SPwtdIE62RcxYZJDO5ARlvWDI2M6ZQqzPDPrXoOkD9Io
 ivo/O3WHXfVm4IMOrbOFi5qGAj/FPWYjvhwj9sZwF1y5PolRZarRo5S6g
 SuBSP9hUEMwxkgWFZBxhndrjpQmXHkp8jR4/y3qJF9kV4xVDLHimx6uzh
 KZad/n96FF0dRmzcOiIthudGGCDN9+0rEg/EqDIZpF43TrJTLxrzzAgih w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22802459"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22802459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 11:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="49837812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 11:53:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 11:53:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 11:53:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 11:53:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 11:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNmX1GVXvsI5gjXdttCvK+9W0wFjCUh/X6mdTnBrQ14vmD0E+S58EUmEpLq/6y8+yQQH8vaqRzEzHnNFG9DbaIW7RnN241irKIrJEFTcCJ5bQPQb6Ayf5mfwlsaHds9xo08+vh42RUQgcJFKscHpiPEFwzrRrnEWZeaKN229n08lu5z19F2YAYaEmRmkgkO6BW3NJzRWRA01Xdj2ZoO/kpwUyr5SqI9JmQc4ixdlnhevC7D0x6JnOD6i/ScWi8do4aDQRKNCGDOMWVzseNhj5OT8Kh2D+Sl0K+fYLL3Qo+HO6En/gSkwFtl/bQ+K9g30L7jdCmvVe+VQ/AeNS7vadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPiNihjr/Bllzy6QV24eYpn+O6Bdcminj527Q5zNtcc=;
 b=XPwiYFZ7/1vxWBDoBJQ7vbm3lg7TxBCkeoqaYpI/3+UTMo0I4gwjSmJlr2c8QPjiw27oK9jYa+a4gmQQ7uKrohSvl4eVO/KNLF43EaHR0FpyQ8soot6++Hun+5qigVZ2jfJKEHco5EHRtRSQ6TMp806SID8XnAxAaNQoDa/bH4ooBqxkZjgO/E5OCVUU46ZV9NHUUjpkzGhK7NZUDjhU/roAlaCbowDjsNUvzxbKBPnpAtqw10UtICZMwb1eV5EMs9I9waeQEZ92Y1BUCvSquXWmWoOx1RPbuBLuPnHK05GNcaxpj2L5EB1IGOtPcfROEnRgYO2Upa0NpRDJj971Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Thu, 14 Mar
 2024 18:53:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 18:53:32 +0000
Date: Thu, 14 Mar 2024 14:53:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple wedged state
Message-ID: <ZfNHqIhLyE6hrsaW@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <8609d8ba-7a7f-4513-9cda-ad5029f6cccf@linux.intel.com>
 <ebc3280e-ef66-48a3-b307-9eb9d4760b9d@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ebc3280e-ef66-48a3-b307-9eb9d4760b9d@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:332::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0942ac-2c11-407e-f89a-08dc44580b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0S2eZHenLFopPUc8pYjPzuPIYTj7hStUfEywiHJHOxQ96CNJ+WGFWHSOsTMUMoe0vo//ls+9XMGOKpET+FNhmP2NSPo4tf9Qj7thFva52qRDcZw8UzE9mj4dwkoB2R6qCrIDyhbLmCtkM4goWe4QtQaOpxEkyFVo24NYgwQTxScT99HIM6GuHK7Xk7PMK83EkWTdPgCgmFsEXuA4BGgXcLko8acFNo99D4S714pxTSHX7fIZeddlIqSPTMiC6TqKCp8vhgwtK9NmQlQzT73XdYi2VHMU09rU9u7emSik3U9LQgbpGZTdnyiWWC4jWFjnRWZjd0OR+LlgY7l77b5DkRzvpCgvcObZjCYODVyAKCsT8VaqopIccSH7jMLjDAEdhHez4hoVVmgNSHYhxUADDTWbNlAFq1beuHxLBGhsn+d6rLfFdaLapqXMeQwjXnuaDxIrpXeIj51njddteJ0ltXLA/h8bFjAuzXn1SAmkwnEUahM3T8X5P4iYy0zoXg8hs3EOXptSyx0PER7Nlxh1bAJQwGVExIeN6fu3RE+TUOW2E1XgDFmMdBcXy2cKvReBkUT7ZQ5c3VcnMT+tupWFhmKwMXK+srNyp/h7kAN2deTtOmckHqVb11i6lHvYazY/kHUkZCJNcjuAY8GzSa2h6daAspoFMptqmhA4yrZHVTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kkXRLcPmsB1eZH1GDuQ8N7ti23INX5w0SrCAEORfJASFeMrvFRe8tolz756b?=
 =?us-ascii?Q?/QAJ4cWVr/ymIiK4qeEqyf0xrRNZ4r9FBZn4FBj0ADbe85aOWKfv94/0LGdI?=
 =?us-ascii?Q?5tZ9Uplev+AlL0qXDsY/o75aIgisD/2qEX62tzkx+v5s3pc7DxjHW+U+khRa?=
 =?us-ascii?Q?iG9EnuHn7xAjFkz3XBYZ29uX44o7j7rqAQQkJu3fk38XV/elP9UQ3hkB92F0?=
 =?us-ascii?Q?7rYAMss/3cjkJdGlVOCl/tc02fABh68uNUTAZ1wMmMIE41czWcl/5JSgNmVX?=
 =?us-ascii?Q?BJnyPf3h/OlcWia//uvtggF6TWrnbA84HWUrxeXUXQuDhd/BFK3lYp0Au3KQ?=
 =?us-ascii?Q?DHZKxamEE7T2H999oro/9qQppQrVhUpluc4AF4xtqqVIRBEZ00gobGQbdBLe?=
 =?us-ascii?Q?kzoPfmUN6HC2tLz4W61XZadMkj/2lTcusHNBG4Vk9f5ALL5fvxx/mK4w1K7y?=
 =?us-ascii?Q?jRun2MFbt3JxZfYw30yorgqRbjge1MjJnhk+BF7tNj63cvseNbSavkK/e7Yu?=
 =?us-ascii?Q?2CXsYaWjonQNGULUC4F9AJgKT4vq6UZ/ov+XYXV9lRFVAQHiYGF+q+N13yEd?=
 =?us-ascii?Q?e5nSsHGcdt+ep782/as9W1FNenq0ShmEEPdo2Z6SnGQcHNHJaCZadOgcBhn0?=
 =?us-ascii?Q?UWg5QrMJny+eeBTcU29SY/3yfUsvBzfh0L1d3VmuHhjec59XbHOd4kjAc3qZ?=
 =?us-ascii?Q?SFGzGc3u2NBy1VfeOHaBHYi9zSa6iWHAKbIdKlLBsdVgUq+9LyCdfkOuzFeW?=
 =?us-ascii?Q?zZSWBaxuTxeVUUfG2Is2TckPfDblg+baRFROwkwFM3I47/U6JrdjxSRaQJ+Q?=
 =?us-ascii?Q?bgNGcoJHjeIN/qXXE9NOIE1J8h15raNixGUxTsE/bVjYVPtWPB3C0rK9NgxH?=
 =?us-ascii?Q?2WBPUMxAqo6iMGciThVDyaWTheOyQAWdrkhRGzZfUXvXtdxZd+fKHm8RZoFN?=
 =?us-ascii?Q?ND1n68Tc+aff+pFzt0ry3aqL0FN1jSq7HUeRLF619ZvlFj8E3cEejGB/wqzQ?=
 =?us-ascii?Q?DAsHLcLyJjc7wA3FJ+z8WFIzpLlNP1OGq8JxDql+NYPx+naaWPXVc2QSoEP7?=
 =?us-ascii?Q?l16kLrTFagrNsGBhtmWGBBNhgg+pRsoiRI7+FJ1lezJ4d8TmyE7zlNtvI0RV?=
 =?us-ascii?Q?NRa+eqmf33+y9vR0fBJJ6QFZRzq5uUlQtMWnnk54bt75dB1O/1NOyEdwoP0t?=
 =?us-ascii?Q?rR9v++MvzQf+GVZP2kEs4/vB//AqbEF55KXo9RV5sHCGetnaoQ9rIVOuacIw?=
 =?us-ascii?Q?lvh5sXm/zhqRDeqCTr4vG4a0kVUeFxE83g8HbPFE97UavbrZBSDmqK0qxT9U?=
 =?us-ascii?Q?F7ZvcIQNTBE8AckylXGj4EK9iq/twdLhzM5oynsoSMEuws8YLtA3C2xfmtS4?=
 =?us-ascii?Q?uFYbDJc4YdueAcyCkd6UFqRLFPjKnOvZWPnN/AqrLgfc3kLq1uc8geK6aHDz?=
 =?us-ascii?Q?7c2cMRekw7SF544+SPgdENzxgAqu70iAu8bSlSZPyRsXPZ8iWMpK2mOiIhjq?=
 =?us-ascii?Q?6WT8IG4D3dUoQIfs4YbXiggvXzKbxirMF1NjbxS2RQC6TLnzcMUPgjzVQZat?=
 =?us-ascii?Q?hN6Tw1r7p9vaNIZq7AJtRkwg3CP6HXQaMH3DxpHKHHUnC4ifUKPYfmDstCwb?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0942ac-2c11-407e-f89a-08dc44580b3c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 18:53:32.1523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Caxg5lY8fGn4+YiKEOTkfgIzkj8kLpuw2r6pTgPGmiLpCTBnKTjNmSZI9HFSxuzxomrYgZJqCxBsoitx0RTUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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

On Thu, Mar 14, 2024 at 09:03:10AM +0530, Aravind Iddamsetty wrote:
> 
> On 14/03/24 07:10, Aravind Iddamsetty wrote:
> > On 14/03/24 01:24, Rodrigo Vivi wrote:
> >
> > Hi Rodrigo,
> >
> >> Introduce a very simple 'wedged' state where any attempt
> >> to access the GPU is entirely blocked.
> >>
> >> On some critical cases, like on gt_reset failure, we need to
> >> block any other attempt to use the GPU. Otherwise we are at
> >> a risk of reaching cases that would force us to reboot the machine.
> >>
> >> So, when this cases are identified we corner and block any GPU
> >> access. No IOCTL and not even another GT reset should be attempted.
> >>
> >> The 'wedged' state in Xe is an end state with no way back.
> >> Only a module reload can restore the GPU access.
> > I believe we should also expose this wedged state to userspace so that
> > any admin can take action, typically sysman is interested to know that.
> >
> > A sysfs at the pci device level?
> >
> > Thanks,
> > Aravind.
> Also, I feel at this point we can reintroduce the RESET_REQUIRED uevent
> when GT reset fails, which we dropped for realignment purpose.

Hi Aravind,

Thanks for the feedback and ideas.
Yes, I believe it is a good idea, but please let's have this as a follow-up
so we don't have a risk of lingering the addition of this protection.

Then we can also work together and prepare the sysfs and uevent user space
usages at the same time so we don't face any blockages there.

Thanks,
Rodrigo.

> 
> Thanks,
> 
> Aravind.
> >> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> >> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
> >>  drivers/gpu/drm/xe/xe_device.h       | 11 +++++++++++
> >>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> >>  drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
> >>  drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
> >>  5 files changed, 33 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> >> index 919ad88f0495..5f0a2bdb7c24 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >>  	long ret;
> >>  
> >> +	if (xe_device_wedged(xe))
> >> +		return -ECANCELED;
> >> +
> >>  	ret = xe_pm_runtime_get_ioctl(xe);
> >>  	if (ret >= 0)
> >>  		ret = drm_ioctl(file, cmd, arg);
> >> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> >>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >>  	long ret;
> >>  
> >> +	if (xe_device_wedged(xe))
> >> +		return -ECANCELED;
> >> +
> >>  	ret = xe_pm_runtime_get_ioctl(xe);
> >>  	if (ret >= 0)
> >>  		ret = drm_compat_ioctl(file, cmd, arg);
> >> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> >> index 14be34d9f543..d10664d32f7f 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.h
> >> +++ b/drivers/gpu/drm/xe/xe_device.h
> >> @@ -176,4 +176,15 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> >>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> >>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> >>  
> >> +static inline bool xe_device_wedged(struct xe_device *xe)
> >> +{
> >> +	return atomic_read(&xe->wedged);
> >> +}
> >> +
> >> +static inline void xe_device_declare_wedged(struct xe_device *xe)
> >> +{
> >> +	atomic_set(&xe->wedged, 1);
> >> +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> >> +}
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 9785eef2e5a4..13971eb2334f 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -455,6 +455,12 @@ struct xe_device {
> >>  	/** @needs_flr_on_fini: requests function-reset on fini */
> >>  	bool needs_flr_on_fini;
> >>  
> >> +	/**
> >> +	 * @wedged: Xe device faced a critical error and is now blocked.
> >> +	 * It cannot return to life without a module reload.
> >> +	 */
> >> +	atomic_t wedged;
> >> +
> >>  	/* private: */
> >>  
> >>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >> index 85408e7a932b..972c0c6d0608 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
> >> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> >>  {
> >>  	int err;
> >>  
> >> +	if (xe_device_wedged(gt_to_xe(gt)))
> >> +	    return -ECANCELED;
> >> +
> >>  	/* We only support GT resets with GuC submission */
> >>  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> >>  		return -ENODEV;
> >> @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
> >>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >>  
> >>  	gt_to_xe(gt)->needs_flr_on_fini = true;
> >> +	xe_device_declare_wedged(gt_to_xe(gt));
> >>  
> >>  	return err;
> >>  }
> >> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> >> index ee1bb938c493..5b2eeb2048b5 100644
> >> --- a/drivers/gpu/drm/xe/xe_migrate.c
> >> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> >> @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> >>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> >>  
> >> +	if (xe_device_wedged(xe))
> >> +	    return ERR_PTR(-ECANCELED);
> >> +
> >>  	/* Copying CCS between two different BOs is not supported yet. */
> >>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> >>  		return ERR_PTR(-EINVAL);
> >> @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >>  	int err;
> >>  	int pass = 0;
> >>  
> >> +	if (xe_device_wedged(xe))
> >> +	    return ERR_PTR(-ECANCELED);
> >> +
> >>  	if (!clear_vram)
> >>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> >>  	else
