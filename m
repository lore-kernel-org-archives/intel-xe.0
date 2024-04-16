Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57748C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 00:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F3810FFA3;
	Tue, 16 Apr 2024 00:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXiMy8+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCA10FFA3
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 00:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713228931; x=1744764931;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=09pw1WtzDxdYZws/LojPK6vxRHkgdxsR7ONE/c0kIag=;
 b=hXiMy8+9yB7700dC3cGDczeZpOuSZ26MYVAXukou7DW7/5X7qYW5vMGJ
 1ir2jBcIrfARR2bAwJEViI7jsUn7GlzYBN5BhvzvaKEU1/jejP0C1rNCy
 oa6pEHEqcgrFe1EOjFgmH59OhRmb3yD9HBPgrN57Y2djA88eTenO+x5FL
 CiAGk5ESwaJjotMDKLTvGiDiw+RBbH9V82ViSu/OC0YsNmT8C3bS0tjYA
 pcHxNqfcOKkOKUEUHOO5Z1iCyzL0CzuA0FtDvlyQ1vF2p3txQbIoa1UAw
 R52pYez2tWxvz9VyPvaqB7O1OlueTk6mali/FTwT/sSdgWt4pYCE2tlbm A==;
X-CSE-ConnectionGUID: UiGiVW9JQT6cf45DihbNiA==
X-CSE-MsgGUID: ZYPMeaPtStOI1Bq9I1S/RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8809200"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8809200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 17:55:31 -0700
X-CSE-ConnectionGUID: kfH0/DipQXyEae/QAHmtVg==
X-CSE-MsgGUID: /F5vcd4XSzusYt0W5dPYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="45373466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 17:55:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 17:55:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 17:55:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 17:55:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtGnAtRA/JfLmz4dmtnQ5ooCq2S0/qMGgRhEyFXxPhPjAsWNuvCYGZn3n+MxidBUBkQXF4hTU8kDhRnSjW+qrh+ke4778epFjMG/y27nDBRe/MwTdm9P3IMlzMppXnTu/KssUPxZgTm5V8Nd/dktHGEglrl1f4AsCNfFcCq/6eydlXxQpIOQ+nkhZs/0euV1f3EtoQeRCtHqLCk3r7JUuhRSdMXXpMgrDzREimmjJ/yKW+wmCum12oHaemdLpcU4146Tqm+StsbkreQ24HWE0wzn1U4L+WCMrI9SnyerrdQbumAJQ9Wll6T2PF/n7tBDCrYmfHPkV8x1Hhw5fyE8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xb8FfaF0cBHx63GsEYhSPq9xS/onLDoBLIz1jbOcUM=;
 b=DYZJpVvTRe13poPXLOR1OSXauqmH0fbdAPOi5py3bj/XYW8HCgwsEYl4PT4fAqMvv8OofnsiOVp3yrTLfZL6E+4FGNEH1BqnQpFCzANkV9cYZToVZqARuEWFSoXBa3qft9dmEFqHJomOQj/6eGmRtkFhcmguH/xxj5lODa5V4PZRcONIrz6A4jQ9ePmB+okwKWqHvSofjHSCOkvCNrl/ovlzec1eBgD6Ivq9uMCONB2DsZchsxRqS16GkSqLQbKNPLsvzE4j+K7qNzJHRlm1IhedtMy9eXmeEWGOJPaL+KxVHyy0ooPNXqPN3TBLJQqGUE5XcLwVxaJHLbJFX7ubbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 00:55:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 00:55:27 +0000
Date: Tue, 16 Apr 2024 00:55:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper
 function
Message-ID: <Zh3Mfac/UZ+6K8g3@DUT025-TGLU>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-5-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240415145214.25641-5-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9b0aa5-e6f6-4692-494f-08dc5dafe80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wudr2wSKrhEjU0/cVOmTP2JMX7nrVwd5Gs9Evj1/wSlqLud/N32l+kHt2jjWL7QdbrJxrBcAP8v+TaXxSIDaXL9tIcCN3oONv5d5+gFDwXFX4ZVMUWOVtL9V9+t7f+AQwwywChH84B4DsUdqYLU2dPWBPDKn607LtjqbtIuZTT/UgnITtUkcdskGLkQADFkanBgEHe53GIhwMBAe7kmyBRX0NfcZutovyMFWFiI2qHX8FrMxPwW/Uh+Jj9SUJmAZu1m7MmeMy6TdiwIx3TzpSKZcLbj6pyoq9vZJsgMGkYT3fTs6EWYp1OwmVX+rjGB1A1/pwwDEVGlvPN+7pllcPSL3FfLm2irGFdlj2JvVEv/LlhylCO/b9SYl6vcE4SQ2zuFbk3Yl1UDyVmF6CZbQmM7iB5wr/BxIApkXn58OysMXbxHbQN417/K0VLBBtkmWly+t21WW0uBFKYQWKZ+OFUAFd9gjpdnWGFdOM+hWh5sovsteFBj9YA4lodjPOp44eu4tLtIpS1hfA5gV609EK+JrkDuqQkdeo/XMUe1QBgKctTpGhfO3UXlPr2H2MczDjfl7TYbe6N7++n2mnk+SHp7/Mxp6pdX8tj6vRnN3nQd5rPINn+jscG6T0ziKAemuAdUbmzf2ug9aD6rP+L+EofBjEvWtRlPU4i+M10s7TJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIXDyceaCUA5hKPtG1tt75tI91OlaZUjVV5WVz60L+w+PtTvld7h4JQ8IReu?=
 =?us-ascii?Q?K//mEo0CWpVs11RdvraEdqox/uK7fOMOYwbswmZlPREeRwuWYIyD91ENXqND?=
 =?us-ascii?Q?SDXTfu+D8Sgz15ii5GAMiCBsjQHsgVpsJ/bprPUIiLLc172UDqi4lQzV5+vA?=
 =?us-ascii?Q?dLWVMHM0iFGARmr2ljwMrBVy/OUtrqmYmxUtYQ5ZIuMQLbmDjm7gxUoxDMk7?=
 =?us-ascii?Q?sU+JmyT87xI5P8DzzMiARUy5KZUVonfq8w8r0xbRnkziDLC0GnsAHLwWxph0?=
 =?us-ascii?Q?95iAXIvn7tgUIDTEc8k2+y/VEqPaQOQ2eRWwRgpgufmiK0QquI94kCpYvDVt?=
 =?us-ascii?Q?kqCqoLkUld6Vy6TM9en4hNmymHcmNxHbhOsYYGKxREOZfB3wtcGv5D2HNI/x?=
 =?us-ascii?Q?SXI2oXOX9FtdZJwQh0JdVP1DoZzChkD7WHq9yLya/xLaVDFRiM8Iv0r6MPR1?=
 =?us-ascii?Q?nZqatH/zKo/ppwLxKDQvzJeJzp9eIaUkMWFansfizTeqzdotYAupfw77Icze?=
 =?us-ascii?Q?z0VToSr8tg8SxQiXhmKPiCeMWn4fIpCZx/h0WJDfB4oTcEB4w/jPB4wUm3Fx?=
 =?us-ascii?Q?EakwKexln6qtvbFH2VvEOfCU6JMs5UfZiCsXqGVKery+fh2Y1CWueNR8afbO?=
 =?us-ascii?Q?mNkm4wy8Y9YV76tRXoAcYud8Vwkte4W3vZQEjH54UZHUIpMMmPJGTsA6wTEQ?=
 =?us-ascii?Q?NQes2yrhC97cZicoX/wz1RKy18o7SpUzqupcR1SlPl2giTpATyUySOuBUW92?=
 =?us-ascii?Q?2/lGpUD4acK6DE1nMLNKbIEetDJm+rGCuNSMkqlMzU0I2X0An6x3i3qUkxEP?=
 =?us-ascii?Q?HIE3CfbniB2XpWWMJSsRIxcwg1XjYTA/Nd5Qk74XirweQWO+UHcweCy2vMW7?=
 =?us-ascii?Q?IvVewAzB/AO0bRXdZSuI/GjLGYgaFpvOIyVPrwBmuehKSWoTbGG9k3FouvC8?=
 =?us-ascii?Q?+rMtUw3/T03A2oDUAFIwte588voaSphFl8ef+VSLz1iJODXN9HxFdkL6aSEU?=
 =?us-ascii?Q?h+XP34RzOTDp+wRsyVhRrQS1nnLVE074Xs18NaNCkQpeLAMQQjjvDdfFt5Q1?=
 =?us-ascii?Q?1uVu3Pr1Z4t4bBp0Gr3E3WKxxquTnJj28/821L53AQvrK9qYPAIPMmoKmzYw?=
 =?us-ascii?Q?7ipI9uJcN9tpJ3wM59W+GtY6bB62AF30w2PPe0zJJ0wuyjpzHKem14rcgrXv?=
 =?us-ascii?Q?W6PyumRDjrZUV65carp9zraIRuKv6NnLcr6o+97osw64HfuLqsPVTW48LFo1?=
 =?us-ascii?Q?AjXu7xfAotAlCDbbG8mWQiagzVDRrqa3mGrpA+0QLl14/pQVX0v6xwJPNnjq?=
 =?us-ascii?Q?iLEDlwx4vhG7b39pvlYPqWj7RKdv2Zn6Vg8jSdtxOfoHHg4j7DQyhGrA1eV0?=
 =?us-ascii?Q?UFMs6PRQgO/02z/VcEnas4UHG34iHodpU/Nw5U6mgkSJkmdXPnN83xBigTj0?=
 =?us-ascii?Q?V3AQY4Qqe4Y0KZiuiQMeS7DmSgGgwUOIJ28fndu1ElgEtxqgQ2+YBIXTiqah?=
 =?us-ascii?Q?CwzBSPcgfJuYS5qXi8spWCH5ZNbtoUKw9oUyenUwd5CznoeNmvH5HK3nTKA3?=
 =?us-ascii?Q?ROhSTz2XrH0Ss+fHOQeeRorI9t850qIpEUfIrw95C0IjSqB+td387q5BPz3G?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9b0aa5-e6f6-4692-494f-08dc5dafe80a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 00:55:27.4689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op4lEIsvSUfQA+tq5Sng6BMVrzanvtK0elsXwJUdZARCRKCJ9Ic0BWjJHPjFHC32HZxbav0jAjdnAMDAsRagOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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

On Mon, Apr 15, 2024 at 04:52:11PM +0200, Nirmoy Das wrote:
> Move vm bind bo validation to a helper function to make the
> xe_vm_bind_ioctl() more readable.
> 

Change logs are helpful for reviewers but not going to hold up this
patch.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 77 +++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b1dcaa35b6cc..8380f1d23074 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2872,6 +2872,46 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
> +					u64 addr, u64 range, u64 obj_offset,
> +					u16 pat_index)
> +{
> +	u16 coh_mode;
> +
> +	if (XE_IOCTL_DBG(xe, range > bo->size) ||
> +	    XE_IOCTL_DBG(xe, obj_offset >
> +			 bo->size - range)) {
> +		return -EINVAL;
> +	}
> +
> +	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +		if (XE_IOCTL_DBG(xe, obj_offset &
> +				 XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> +			return  -EINVAL;
> +		}
> +	}
> +
> +	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +	if (bo->cpu_caching) {
> +		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> +				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
> +			return  -EINVAL;
> +		}
> +	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
> +		/*
> +		 * Imported dma-buf from a different device should
> +		 * require 1way or 2way coherency since we don't know
> +		 * how it was mapped on the CPU. Just assume is it
> +		 * potentially cached on CPU side.
> +		 */
> +		return  -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -2955,7 +2995,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 obj = bind_ops[i].obj;
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u16 pat_index = bind_ops[i].pat_index;
> -		u16 coh_mode;
>  
>  		if (!obj)
>  			continue;
> @@ -2967,40 +3006,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  		bos[i] = gem_to_xe_bo(gem_obj);
>  
> -		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
> -		    XE_IOCTL_DBG(xe, obj_offset >
> -				 bos[i]->size - range)) {
> -			err = -EINVAL;
> -			goto put_obj;
> -		}
> -
> -		if (bos[i]->flags & XE_BO_FLAG_INTERNAL_64K) {
> -			if (XE_IOCTL_DBG(xe, obj_offset &
> -					 XE_64K_PAGE_MASK) ||
> -			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> -			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> -				err = -EINVAL;
> -				goto put_obj;
> -			}
> -		}
> -
> -		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> -		if (bos[i]->cpu_caching) {
> -			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> -					 bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
> -				err = -EINVAL;
> -				goto put_obj;
> -			}
> -		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
> -			/*
> -			 * Imported dma-buf from a different device should
> -			 * require 1way or 2way coherency since we don't know
> -			 * how it was mapped on the CPU. Just assume is it
> -			 * potentially cached on CPU side.
> -			 */
> -			err = -EINVAL;
> +		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> +						   obj_offset, pat_index);
> +		if (err)
>  			goto put_obj;
> -		}
>  	}
>  
>  	if (args->num_syncs) {
> -- 
> 2.42.0
> 
