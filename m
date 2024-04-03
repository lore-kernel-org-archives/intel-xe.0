Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFAECD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 19:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA62610E9E6;
	Wed,  3 Apr 2024 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOpuyvbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF8F10E9E6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712172499; x=1743708499;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qSj2j+8cBGwziK22ye8MVI2sjIOH9+e5J8mWyGVH+Dk=;
 b=mOpuyvbnK5g05aDSqoWAM9ZOTcXItLAWDU08dxjrdK/DkhtTgRNynSg+
 uANo1ztFLLc57maZpg8eU6+eWRVKGUpBYD+MbDRC1vwKC5w6pRtMoxPGD
 Ah/zs5a6bFoU3ThaMWSP8y6h0PgzUXJN3NHus84HiEX1KG8Fb88IQnWf+
 4/YL44PdTnIw3TzNhH4YQKFxuL6hspQbOFch3e4stlMm4Y3uGUs7uGvCm
 cLSQOtEb/gFKULYRndXuLp0cxMRx+SxPHmeeooacLN1wcLB+dwmkoqc9t
 ndyiKpju3QnOBtnNkFrVRqw/zuTQYi5RVFleINQV1/SOWDYB17uG1OBIO w==;
X-CSE-ConnectionGUID: k3O1c+1cTuiYdRDmHQ7hcA==
X-CSE-MsgGUID: aKQg/M1IRdyp1OV3PBMTRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7293788"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7293788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 12:28:19 -0700
X-CSE-ConnectionGUID: JG+SXkL1R9qPYyrOWlW/4w==
X-CSE-MsgGUID: 1+4yZQ6OQ9u0qlHiLuRJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18514965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 12:28:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 12:28:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 12:28:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 12:28:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 12:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4WVagHtHySE5RPyG7SI8cL8bCDaez8EmphUCkT2+/yX+vc7an4raMBr9iKY0Xi427l05KX9gSuUMvbIXYZ5QqJKJQO0I2pUmDfGg1IMsXzrV0puKrjCWriwYdFqe3Wgry0e8EIudmLkMw079oTTHs1W7bfBHqHjDG9mHyPFGdolrh9yopwZrisBFwy7m830T6ai0O+kUDzLqYEk+dN3ZofN6nDCOK4sYyvxLLOoGBXy7lTCJhw6kyIF5QZBrwdFQ0qMhtg6oT+kW/eSbcjs+zWc/16L/b+QF+y+uCQyxvJkntJJJjlibkZsee7xMugy9rspkfFCXNCL9NiQYNbjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5oQhXjYDq1dNokPlXnKIk+H4m3nBfBWflBZmxI6vrY=;
 b=HWnx5nJG6+G+QuSh0UkCX52YmWcqPdB1saMSe83XJ2xEd65aQfqAQljhws65ZGsUGQzJgPHONCImmfFFR36ILb4hHN2f4dIqybIktZXx04tfi2+JGCzNxseeQmIie9RfU0ZjwmflrbJiuZa9LUb0J4kXvSCOsTv7lSPoBk0fH38wYP8uFMT8IVnszWBfTBM5nI7xNOjWMwOHSdH7z5blw+gch7L4C70UpcRWGkq5hgiw00lSit408p5r06jZnAdq58aAOQNQtIw6TUUfA2f4RmUJ8bH1pmDktoEXTu4EJmUZ7loM614wOCZagQDZu6mhcNSyN2MX1NTx6G+WkZMVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 19:28:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 19:28:15 +0000
Date: Wed, 3 Apr 2024 15:28:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Anshuman
 Gupta" <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Message-ID: <Zg2tyimI-kOuUfK5@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
 <20240403150732.102678-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240403150732.102678-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6256:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQvSoKk28Gn8VVTArWYjHDNwgwSdReBlxGV5+7VrVsiSikF9sxSbovABvvPbIiJNJ1G90QBkzl1i4YNpfTRw/ee82eMSwtOF3SaU98zcyjOSakMpie5J9F+bS/6J26yJ9yeN2PkKrsE6wW+wm92ziYSzNiiwHfM01vIsrhf4Jh4Y9Cpzh9EYj/NfkoAQGEqrhJCGeHBv8CVGnm4tQFPj0oolQAkJBR/1AuGaXcbieHcYe13U55aivQRqqH/Uwfdq/nhE58lRkOhbT1WAOPkxwyUr487Lryxsl1KBh6ksIf2gZWsuJXZT6lMF3XVKKnn1feCto8dE2jyCwW+3lxTYPNZS9uMFcJ1ccw61JYnUz7TZwAokC4QgduFVG9yoEW6lUIBrR7rFex38Qqmp+/XyENNmWrF4tQiSLdRtmFuI7/pfMFXS3cPHaebFotNp6wyDsIW9yM0qloWNYLhAOaGEYpqfpD41xti9W0OLbA3owLGggDGutWJb00vjmYD0XRmyYBdEqe7E+ZS8gG0OtaYVHyP2rFPLUV8bGkn6gpUDd/ssSuzXTECCWE0KkKtOLpU988HxSbcVpvTpqzMHuRrD3asEwDiLFScveK/badli4Ek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LXhvR3WzVkSx6Ul6t9igerDNRt+ZARcwvSXJ6AAP4ZrGZOHwulxCL2qIW4?=
 =?iso-8859-1?Q?9h8S35ov18R66dJViwO/m2gdGl+fJOlTV3epW+L6zT18sOy6rV9zW6dr4w?=
 =?iso-8859-1?Q?TGqMIf64iGmQ/uf+twMIPiXjBvxNzYV38SIHuvxQMx5NquHjAPbmAtWWUV?=
 =?iso-8859-1?Q?hLT5d0vvQpGX/TIdzsTgj2y3PGc38k9lP/Ro9FCrNTNwSrI5mMtHoGFuwA?=
 =?iso-8859-1?Q?hV/2uxk9keApVJ1RrGuUSr9zzf4Rpz9emgGlrh08XD5+tHVPsjEgjOh+g6?=
 =?iso-8859-1?Q?nB8smUUp8uVuhL14vFujSM3ZhwbMuXfW2OPVHYdvw6jiYYqToebdWJHLuT?=
 =?iso-8859-1?Q?RAlLNCduYZXxv2JXdxkReD04DyPu7umyym67kDU4dE0pGe4XCQ5Zuwi9mU?=
 =?iso-8859-1?Q?XpZ95H+rjJRvWmGVQ1UVepp2J6FvCZnuJ/BKhYRbKDoMJbXQE/21ivZR84?=
 =?iso-8859-1?Q?oyj7n7+T2HXyPTnFt+MGJWAoKqANCri4GkBx8QV88xXxS+5doNP2HVIcHB?=
 =?iso-8859-1?Q?+x/KlktCUD8lwANS9RDgflK14CBfcQY9ulrCD2B8feJi5nsi5enPDdURA0?=
 =?iso-8859-1?Q?nr5wssuyNdJ2wDFq8ombk9gNZwlswfeNNcOokoxbmN1aQFKFT0PJ8UlaBq?=
 =?iso-8859-1?Q?ZI55Mg8so5yxXRfFQ0dV+tZ1d/zuitwJW1VYI2mM8LsLshOlr8f7tY482T?=
 =?iso-8859-1?Q?MKCGyfTQ2lqNj0ISBJQTjzuUFaFp5I2N9ImDhnbFthl5fAXyoKMKZjQDAt?=
 =?iso-8859-1?Q?9zII8yz3ntXLn+SFNjUZ1z27YJdXxOQqjNtDmT2NNiebL6+npSEjHwbAym?=
 =?iso-8859-1?Q?rycMc8yZBmFejDf66MAhEeZ/Nb4tlzcUTrgsguyJRpk9eq1m6ePRl1O/pb?=
 =?iso-8859-1?Q?/t3ss5eaWOBTDdb2ViDqszjhCAUcOgJKpvKkE8tICIa9mJsPV9ckiVf3jw?=
 =?iso-8859-1?Q?G1dWcmX7+TcvyUnFcdmAkozGYSDK6wy3uFsu0nyakm3f8U5+MjsneNQGbo?=
 =?iso-8859-1?Q?BSkUTzJYHqCRBZFV092v1g4LVRO5G6pGiGr/lcCZzodHb2/lQX0Z++ubq5?=
 =?iso-8859-1?Q?cK75FwL69XwOnQ6b4bA5u+saApL3MZWvKXxjAsfcDafL5OkUBXl0fmdyGV?=
 =?iso-8859-1?Q?XgVR6jCzXTqrTFoGigbQxThPlxKv2dVw4ZGAIitU6PSyRx3dyL0ozoVKOx?=
 =?iso-8859-1?Q?PjhD6He+/2bzLAx7tC3dDUFK4SqRWIfyJkj8/dokvZWgjmP4LrPIkDwjEE?=
 =?iso-8859-1?Q?K3/K3iqr+SYaeTU5GB22o+ANLOV85wxatXGVpLR6VzEcuo9BYJF8Lkb/3H?=
 =?iso-8859-1?Q?UbQptnMrmgFgFcglpzbRc7gYmoxknifAa+qm2MGKJGwBKYE5Ct8XYRoly9?=
 =?iso-8859-1?Q?q3F4e7EtC/m5DfTgKg4JjcLpwPdar6Agok4Wu1WIh+juXdgGMZTZED4IzU?=
 =?iso-8859-1?Q?cvBjjlbHPcooN/kh2/7AI42GoT2SwdaDudUymYiEqOu7HmDKkO3r2e/7wR?=
 =?iso-8859-1?Q?13lLnlqp7AXdrG0bnncKMv8i074y1fwtivOH/1DJ7jxrPVth5k0nLx2IlE?=
 =?iso-8859-1?Q?lZmJN/3NV/hDuEFYHqFg8GupVrVAi8YCMsJKHZxl4HtTHT51YjPIvZmLkY?=
 =?iso-8859-1?Q?JkTF/0ajOrbKBZ3m6dmbagEPHzDI/wnPhTpCeKXZwTofzXx1L58OWctA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f31b07-c12f-4099-6a01-08dc5414357f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 19:28:15.5853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTRPgalr/uv4nQGSHmHMX4FKYiQZ8fBKsN1sGJHIqG978y4xXGNJl9c8vIaN7cvqVmavprNetnRsTvkKKaLr8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
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

On Wed, Apr 03, 2024 at 11:07:29AM -0400, Rodrigo Vivi wrote:
> Introduce a very simple 'wedged' state where any attempt
> to access the GPU is entirely blocked.
> 
> On some critical cases, like on gt_reset failure, we need to
> block any other attempt to use the GPU. Otherwise we are at
> a risk of reaching cases that would force us to reboot the machine.
> 
> So, when this cases are identified we corner and block any GPU
> access. No IOCTL and not even another GT reset should be attempted.
> 
> The 'wedged' state in Xe is an end state with no way back.
> Only a device "re-probe" (unbind + bind) can restore the GPU access.
> 
> v2: - s/wedged/busted (Lucas)
>     - use unbind+bind instead of module reload (Lucas)
>     - added more info on unbind operations and instruction on bug report
>     - only print the message once.
> 
> v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
>     - don't assume user has sudo and tee available (Lucas)
>     - do inner protections against command submission instead
>       of avoiding only the migration for a more reliable protection.
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I forgot to state that the reviews were for the first version.
The new version here brought some changes to where I was blocking
the execution. and I found out some bad performance impact.
I will probably need to get back to the previous version for this
regular wedged mode approach and get the deeper one only with a
specific debug config enabled.

Matt, would you perhaps have a better idea on how to blocker the
scheduler of running anything on wedged without any impact on
the performance?

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c              |  6 ++++++
>  drivers/gpu/drm/xe/xe_device.h              | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h        |  3 +++
>  drivers/gpu/drm/xe/xe_gt.c                  |  5 ++++-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  3 +++
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  8 ++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c              |  3 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c          |  3 +++
>  8 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 01bd5ccf05ca..7015ef9b00a0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
>  	ret = xe_pm_runtime_get_ioctl(xe);
>  	if (ret >= 0)
>  		ret = drm_ioctl(file, cmd, arg);
> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>  	long ret;
>  
> +	if (xe_device_wedged(xe))
> +		return -ECANCELED;
> +
>  	ret = xe_pm_runtime_get_ioctl(xe);
>  	if (ret >= 0)
>  		ret = drm_compat_ioctl(file, cmd, arg);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d413bc2c6be5..c532209c5bbd 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -176,4 +176,24 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
> +static inline bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged);
> +}
> +
> +static inline void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (!atomic_xchg(&xe->wedged, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as wedged.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +	}
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1df3dcc17d75..0430bd51a5dd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -455,6 +455,9 @@ struct xe_device {
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> +	/** @wedged: Xe device faced a critical error and is now blocked. */
> +	atomic_t wedged;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cfa5da900461..0844081b88ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
>  
> +	if (xe_device_wedged(gt_to_xe(gt)))
> +		return -ECANCELED;
> +
>  	/* We only support GT resets with GuC submission */
>  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
> @@ -685,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
>  err_fail:
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>  
> -	gt_to_xe(gt)->needs_flr_on_fini = true;
> +	xe_device_declare_wedged(gt_to_xe(gt));
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 93df2d7969b3..3a6075021542 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -236,6 +236,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> +	if (xe_device_wedged(xe))
> +		return 0;
> +
>  	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>  	    gt->uc.guc.submission_state.enabled) {
>  		int seqno;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6c37f4f9bddd..2047a49c71b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -638,6 +638,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	unsigned int sleep_period_ms = 1;
>  	int ret;
>  
> +	if (xe_device_wedged(ct_to_xe(ct)))
> +		return -ECANCELED;
> +
>  	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
>  	lockdep_assert_held(&ct->lock);
>  	xe_device_assert_mem_access(ct_to_xe(ct));
> @@ -1016,6 +1019,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	u32 *payload;
>  	int ret = 0;
>  
> +	if (xe_device_wedged(xe)) {
> +		ct->g2h_outstanding = 0;
> +		return -ECANCELED;
> +	}
> +
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 521ae24f2314..f4663f1b0a80 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -902,6 +902,9 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>  		return;
>  	}
>  
> +	if (xe_device_wedged(xe))
> +		return;
> +
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 13b7e195c7b5..0a2a54f69f50 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -705,6 +705,9 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	bool lr = xe_exec_queue_is_lr(q);
>  
> +	if (xe_device_wedged(xe))
> +		return ERR_PTR(-ECANCELED);
> +
>  	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>  		  exec_queue_banned(q) || exec_queue_suspended(q));
>  
> -- 
> 2.44.0
> 
