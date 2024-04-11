Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0472ACD11C2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 02:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB2110ED3D;
	Thu, 11 Apr 2024 02:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTsn0rzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FAD10ED3D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 02:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712803927; x=1744339927;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u+kk44T8/FRAlcIhdS3iWqIro0ECECsdswzosl/VMjM=;
 b=aTsn0rzYBQ2ou6rE0WY217M93m3CBT2VZPwKHT6host3O759JCAZc39H
 9BpoPwM3EpZO4dEqFl8BvG17ll+TVwfnqWC93GG5923pCk+WnFQ6oB0tE
 3GJ3qUpi8wH819B25t26nMmOUrm0Cv1GxrKILU3jncPSyLva1OggJ4ooY
 si2y7nbrOZcdZz+EL3/6JWUw92o1gorCTbnFI2uk6J3WMqDGFZeq4M+ZH
 h5s6DBDgdCXBN/LyknVHHiNk5sVRGEv1Pq+M+iQa/HgygZBIDE00JQILQ
 FhxHaND5pYlPcZo5siwJoEZZnpCyzeATZsD/tL5U1ndhFsICqE3S/e8F1 Q==;
X-CSE-ConnectionGUID: SMXEdrHgTdGxGSalQU9cXg==
X-CSE-MsgGUID: RfdByNElR0GlHat02JzlqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18907545"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="18907545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 19:52:07 -0700
X-CSE-ConnectionGUID: lBagl89GQcyYTHO5FLGBcA==
X-CSE-MsgGUID: IlmIxje4TIyICRMuD7whWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="25532611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 19:52:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 19:52:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 19:52:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 19:52:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5d3xOZwTqDYH6x15S4QIrt2xCQh3HlSTvDM3PqLVL/PGgJCBXcE2OJVnfv1bXfuaX83odh/C6QhP6hs95I8G1+mYnSJCkF9a/gUqmzyRi0yx9UvNfFU7953MTLBt0xm3XwZMK8Gy2kJPldj4esjcC7Vd1oirY9EsqgCWDEn2bn02WfssfyGiaHETqaFdeCfduqLRQ4V/V5ND4LGTbYlQ9yv7CAdR4g9p+75Tw96le1CP6KphjqBj4WLmQHj+1Q1+gSpVfGmVC6IKPoO6QLdEYVLuXYhf6OCdlmaMcGfMRxdgVJnn7svs3u5wdsYwPW9Ohfc7THrq/0kQNnKH0oLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ME1zN7BVt9YLVfxMCWWdVMLhuIHPwBIUZsXoSYCxZKU=;
 b=WBrcOkmhev8ydf0EJs1f6hXssH6Wc6affuiUlV3E7geNpL3uBq3Q/rx/kvSQ97Od3Tgy6alT9Zih/NqNvEBlPs2Vp3NqY8kjTV6Fm42VscriNg0uOQsTQUeiuFTcuNK3p0NcCQfM49s5dp1QsvOINPH0UI4wMX1zcal65sBsmpijaa1qKGUxAitQcMIthj29MoODE1AX2vOiHS9cbi0/w7zhkxRupJsK5PQZXL5kMh0dt0sktxkhbKcAQCmuM9tDfIRtqMwVcCLinT9x8SFYD7zbRC70JUOtlcy7THTZ0qM2iFrt623qjJ0zJy4VUCHwWabozp1tQxguJ16CaQQFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 02:52:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 02:52:03 +0000
Date: Thu, 11 Apr 2024 02:50:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 30/31] drm/xe/svm: Add a helper to determine a vma is fault
 userptr
Message-ID: <ZhdQDwDaR6rRX5Hx@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-31-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-31-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6716:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkgNvKdJDgdY35SEE2G3NWY35cz137Zd4Ay2AXvozcviwZ9r1/5OqgvfMWULjxUmAKq3gJhZvjJKFZuvh7ZZdd+a0D/vIqW0OEb+Qk2Lod5TFxT6v0eM7FuBHy/2SWESTzieZwrY+PJrWgi1IkdsrpJMncWiQe2m9/ELfvc3lLCAnIvD6Zkd1KlRLFAL5h9f9Q7LpTlVONzCTBagxNA9td8bhnZ+m7XeFFIuN7uO44Kt0j3vHU7kv9FkTcaY4oQLIx1q9S93Cew1fcENkzcGDwcFhyYtL4gsCIg5xwQj0mzmWQ1IeyWX0plfkZpUnPD8Mk4UMqJKCgcJ4Cd0MsqtyZo7XSzvqGkIqTg+gwKlK3SH2Vb3QCUeQu7joczlNWqSy1K1Y6vFpCJF6v9myhb/hjVsKjz38t/6E34uJD3Ami8nqBhTUIkKiekczxElp53C1/vFm2fRohI5u+tR/jrMGAQpjnH6BYrmMnItJAp/UGT1auwM0/aQSnZqdSos6Of9OrnpfG002/suRubgI1rTkGrNZwOT1uoThKupGA7vsVDlBfJtlfh2YZykNJ/Es1FlVDRhSIHIgpEqd1oAMsKJE49EaoZe+h5wy9mzA0x0guiQBUdrCamLbbfcLAegAlRccWdHnaPsMOZiGtjRDojFSWVRvviixZApz/W2ppBJeA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSBK3b8zGBT96/+lp6UeoKfkOpYzxVwF13wF8oGfxnaZyzzHjApAQuULWfkp?=
 =?us-ascii?Q?KPSmgqCAYim0zthXNcZYUpLhE8iCLgOYpaoO8JEBc44jZK6/xGZzxYZFfSvs?=
 =?us-ascii?Q?Gm8G0D47jNLCokYChYvwOwHVEzJO6mlXweANveayqglOXGCdvZSgbSqQdJMi?=
 =?us-ascii?Q?h/4rxsmDFSWqVn7bSCfUnfI4azodQfpa4uU7NllLW0P2Dnky+2FqAwcl0AQH?=
 =?us-ascii?Q?aPp07LGr5EENu+E8FFLQKuEMmTSqdlBhRMXAAoA9/wTC2rGEROpIaGv/aZ6u?=
 =?us-ascii?Q?p9BT3DhQ3V6vfxL5xpWzFxS8HVKD4BoYiaEs6XqUOZV3V6S2fsw7GQtI1wvx?=
 =?us-ascii?Q?QebQiMDwbwBww8aPvhnN8fC9ibfMOvO24Zay2YEDvC+B2w+ahJ+Y9q+wyhOK?=
 =?us-ascii?Q?fAAPSig2buOndegTjZc/Wzf9sNpP6/Uj86nzkOn0ktHAUpAvGTZyIGlfy+6W?=
 =?us-ascii?Q?oUaTyYYS2noZfR87UFc7eSEkQK+pB2SA6mu52RqwH06dqPwl78pMGpC0v+vN?=
 =?us-ascii?Q?xbFanKJImdfSzEdf7cCFwc92TTYOJsD8YDw9BE1Flitkm/RnB0Dlkh+J/bxp?=
 =?us-ascii?Q?Eree2IdF3zTH+cvB5KvHc4NE9gJgSdNy/hFSlv1xFdilzEd7xcl1DPkYTmrx?=
 =?us-ascii?Q?EAboQEvB3bu+QRk32lyBzfSTruES5uNQO/HVolQV4wjNDCuGA+NW8rGFfIaI?=
 =?us-ascii?Q?6Q/vOjFuYCGdpqRZ1oTTp8IYDGlf64kVRC+EuJ7jlHkE99EsUBRrZPztZ8tb?=
 =?us-ascii?Q?o/kvB7APCf7SHmbCqBVJbvdZ5q9E/+rpR0bc800XbSUj0KUDCgBqRzk+XFXw?=
 =?us-ascii?Q?5L/ACiBioRjSCp/2TB5QVDFmCWLORUUr+i3TzFFnuGoAln28R+E5baMU5IOT?=
 =?us-ascii?Q?9A5NihYEzyBadbPwz6dNNXpavZfp2XRxL8XR+6w6lnvJI2rzRDnQAnNdNmRC?=
 =?us-ascii?Q?yycjggVC6Ye2V48VrvEe4tzfuJtnX6KXvVzZxeV8/9ghW974GfEMVX8O4x8Y?=
 =?us-ascii?Q?5SFM2cBOhUOBsK8NhumQ4Eg7di5HM4X7PoPSMuBS86uAmrMHAUa+AeLzoczP?=
 =?us-ascii?Q?z+E88iKwtWGU7soFnV1z4hFeKBkLfiwM+fOrZJfp/v35ZDZR9FHULykFNBRg?=
 =?us-ascii?Q?ckeOEdNIn7BYJc0IwK+DF0i16RH1YfDJ9xB7v/ahrpvldn2ODgYFdjYD2Hbb?=
 =?us-ascii?Q?mDJOZEWAb+yzVVnO//QPuOwQsHGHghrTMnK5y6H+6BBo1CXqELA8J2zav6vq?=
 =?us-ascii?Q?aTfBTER7PC4I84mYtK3wg/B5yc4ceHM/MEremj8bkF0VdVOEGmwdtYMsJzh+?=
 =?us-ascii?Q?f982mgXoWxzo67lhq/a+cOA7BrJosPtFOackuFhAfQJg4pVjEi9oMwZo8Ge4?=
 =?us-ascii?Q?sWYqrR6i/ZmN2hCw/RrpaG/yYRcVNE4U5FRtG6LX6KalErNlFwYJuTQXVrO7?=
 =?us-ascii?Q?Mj6lsJ2AohbfFKLMub2YycSdVxK4HPFyWXb/zaRHSyWVSCeZRsiutmIoQX2K?=
 =?us-ascii?Q?yRGQViJYmG4hOZ2O3/eHi4/Kxtwn/3d+jZ6pniLgrOgmyqSzTkx+YcrQUaAM?=
 =?us-ascii?Q?va2qQr+0qwKFceOZjLzzt43/pdG4blcEi4tcTy8OVcgwZ3U4/nLpsiM7YD7L?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f85fc31b-02f7-40cb-4f71-08dc59d25dc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 02:52:03.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9j0Ccsgq+7KvEAa7elXuVXtuu5ODPkykcO1S2ZgecyMU0ABZ3XueSkLF2kdDvBCm9K111W6ORdaDCZBDma8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

On Tue, Apr 09, 2024 at 04:17:41PM -0400, Oak Zeng wrote:
> xe_vma_is_fault_userptr is added to determine the vma is
> a fault userptr.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index d55330988e32..a718f927e362 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -166,6 +166,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  		!xe_vma_is_system_allocator(vma);
>  }
>  
> +static inline bool xe_vma_is_fault_userptr(struct xe_vma *vma)
> +{
> +	return xe_vma_is_userptr(vma) && (vma->gpuva.flags & XE_VMA_FAULT_USERPTR);

Presumably we never set XE_VMA_FAULT_USERPTR when xe_vma_is_userptr is
false probably safe to just check XE_VMA_FAULT_USERPTR here.

Matt

> +}
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.26.3
> 
