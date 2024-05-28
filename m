Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAD0C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 22:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C174410E428;
	Tue, 28 May 2024 22:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLimYR5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CF110E428
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716934559; x=1748470559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6UfMRMB7WBwDuCM1EClmMelf2gnKmeCCKtme+49hT6g=;
 b=jLimYR5hhiAFEkr27f3+WkswtMqb1iRKpyAXL4PxE7MtDmBisVRSaTE5
 vHc5K49PyuQPdsQgLuJSLbyPvlzS33srTfCjl/iVud1Lv4ardztEn6m56
 v8EEP1FNjDBwkE1MTLYlBt/rZ20AZX6/0SmilmekSyca0zvVDRfYnWbvX
 5zplY6o2Cx0yrv/l3gNtUBxSKGBHyhU1/k3EpQdtRYKweRmZy66UaMy18
 oTv76mSen7UhH7v3OqlGDMmynIUv4Pfz3iqEGYqsEac734EuH/IbEyrmg
 G5hj5XWwj0PeUfoiqwzxZ7NKNfpdRhWZAxeOnz1POgk6j3DgpZydWSzS+ g==;
X-CSE-ConnectionGUID: 8Sr/OWgXTVWZeKhJSDmbpg==
X-CSE-MsgGUID: zC2wdjGYSJWWf+yO0s44Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13534837"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13534837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 15:15:59 -0700
X-CSE-ConnectionGUID: KbfwGwnjQ06q/oXugDktrQ==
X-CSE-MsgGUID: Luu/ZokdQyyMU9Ph+LwLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39638222"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 15:15:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 15:15:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 15:15:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 15:15:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 15:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POJoH29mG5BV69i8+nXCyFN4YN6vIRNyaK/hM+l+wvSlrZjLS4QvGPBJrCAj+RacBGsN86hZYdzg9YjSVw3/xkTeoNfLi6Nw5M5aKinLYY+Ztmp8Wod7KKvvjqTwxvKDMqN6KN3yJCrMJDX8mDYqU+qoqWK7B5gHUfYs2gCIOswQkOrGSgxDcPYoTqW4zUruh/d1yAerwTJx7T+3X1PfYgq+0OSQiyfQyF/aT5jYqDxUsSNLsAqLJbmkk6baB4GYv24j2C/8Mqpnv8Tcbpq42uyEHlRkUPfPpBITSIzZBwZCSkYg3THunS1tLgUX1RAgrARe1z0fODraMmduZ5ROPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgDN6uLBTFFjZC+lMNIsV7Al4SdBkUUHCJ1L9YxQUVk=;
 b=RauVPAZpXcHbVwm75q5s4b9DBGOJ5FZpPVV3NKuqdLS3k0ewkfLOYCJCd2OlabRBoupZquJbGekq4s8ze8OKmAWz1Zs4VwQBckF5BZomUsFqQOey4rAwcpcsNrHZziOuiUbAUWeOkK1aXu6Rn52GWSkCIyUsPjaYK871AnItmy9FIgOCInqE4C9SlTyWe2eGxGSEKmJn06RwYtoR14zXXaWqoxWtGVvqvNtqR8yY0ryDmW9yphqmcO80NNDCHBha6ctNxQHxbBQBft24GnRLqx0Lv1GSjQ35/8Ci4ODZlE7VWoDXUz2qMO+1c0TnFY+/kZqXh5XR6vpV/OVsfGg/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 22:15:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 22:15:50 +0000
Date: Tue, 28 May 2024 22:15:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
Message-ID: <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: f717db84-b77b-4be2-cd4c-08dc7f63bba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vqd6k43+PpqsuI20ob6VREHRTX+GGjfqZJyXGBBGX2vXqaEhhiYzWY78tcdK?=
 =?us-ascii?Q?mfis9LjsAPcguFQzRJAP0X8YFmi2shyZuXCDi9V8Jyr2S9+Ey7xvLcujFVOM?=
 =?us-ascii?Q?AE29lA/MNz5cVH80NlWvl63nwh1udyUDxTe6Pi5cL/FRXUYOiFbSPMjZh5Qq?=
 =?us-ascii?Q?/qzCdxtvLuJkXOZraLREEwHGUhMv0hPtoB/vDMqYXvyAsty9eGHwpIAKz8Il?=
 =?us-ascii?Q?/mwBFmXYZ1/54QLercyAhx8gxBuz1FjkVPNi0Lp37AczqM7bjB4QnlJTMqOs?=
 =?us-ascii?Q?Cs389k2joPzLRuy8MBBSiMx1D0h+87fPeHHyGZT9ZY6WcBbWRpbZgbs8im6E?=
 =?us-ascii?Q?n5Zd7IC+qT14Q34J6wmCbPM/7dl59qAB0Y/E57K7c1iDT4vM2i5XnMWSp0O5?=
 =?us-ascii?Q?7Pnml4bmwd2eYvJUQwgFLRz/f8omer02CzmJbW9RWokaUFSDSp6rkTnaRQdq?=
 =?us-ascii?Q?yGKWfrX7StdL1l/0/AYAMICc8g6UZyLdxyoOgqk+eR8fyQ5TLOfdSZgcq+JC?=
 =?us-ascii?Q?gvPtT8u4c3OOW1bEiytobebm8QNSQ9eXnGvU0WR6sKKsDLtJ9AiIp16XsbOE?=
 =?us-ascii?Q?bfVK7ymMjxJa2YnZPMjfZKig1zVRcFGpo/fIfdIV/fLfvCkWW/N7FOINdiCq?=
 =?us-ascii?Q?Nt56UBc/T5qMl3cCI+BBciEFx1jNIO72kmjIdU5cfIaac7d5BPumoeFPPUBT?=
 =?us-ascii?Q?HGHWc+0wSLmXbB2owuiFXXlmMXGRDl7Qkw+x8ZAb8TzS/Two1wSxXHAXx4X3?=
 =?us-ascii?Q?aFGl7EPYitmoZ53rgqDTBTgBOspoKcsD50dL7G6doE7dWtw0H5rYmNyvhy/m?=
 =?us-ascii?Q?doFQIeWSS8WnOC5G2Jg88SmLBsF1Z8RpSuKYxkkl1LuUR6aXhC8c/TmTI0AF?=
 =?us-ascii?Q?qZwYg8cHGG6FxDBERV0v0RcOTX0I5kswNw9/S56UVOeYX/aYAbkYSGKokp6k?=
 =?us-ascii?Q?cPSCT2yyKKjNVRkAedkY7IJOonab042/ix94CuKw3Di4mXAeg/J+tSMdM0Hs?=
 =?us-ascii?Q?M2h2rIT1N4vrOo2S4n3hgoZ+xazTR9usgGA9f21esJqztUKbBiJPKZ597Ypf?=
 =?us-ascii?Q?fPxG6slyXUUk1rW45kSWlPcZE90yBGSDxcaIh74IRE3orOaNG8nO/pIsHOUx?=
 =?us-ascii?Q?iKKgJ/de4/VJYnjsQYoAhW4VGhHMYtyOP0uSDaM73TxH/bVMtbtHbv23Mx6w?=
 =?us-ascii?Q?q7hlK6KMwBbfTCxCiV20vwIact+TEq1b9XEgczq9gERPVyYWWbRuy5GEFX69?=
 =?us-ascii?Q?4Y96G71gKXr4XBYI5m6MxREz6Q92OVGVDCB66sgjLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiktTQv8UqNYdpVcn1ja+MTh+l4HVxjv2cencq3jBzfnsPBlDN2Xu4v6JiMf?=
 =?us-ascii?Q?9hutNSitpp2xSMFqlDeI76Yfqne0E0e7lswuUpaJOyhrqFONpCVv2rE8ufNm?=
 =?us-ascii?Q?hOx6hlzJ15MHlapaJo70U4f+0qkmmAPQjQmn5r1j/6RpFQ9uhLbSzxXvheTI?=
 =?us-ascii?Q?pS4dlQvmUmeVsOli0Z3eoJYctTwYYdbVOElJdBYAeKOUkxD9H4/2+VjFhhYu?=
 =?us-ascii?Q?V2+gHSgcB5FIgsEUJRrpWk01w/d2qs+Q9RczQUsyg/0s6Llq6QB9JM08hm6S?=
 =?us-ascii?Q?f5HZuwV5EP8GIt3ogmOqo18tSf7AzaFFgF/Xd/AYdLS5zLARhdFJnYfgvfGQ?=
 =?us-ascii?Q?dCptap41Jk5iLrLlsLB8DSpn+1+PPIJkg4I1Y0i1YN0I3Qr2s6Xqe0hTJvns?=
 =?us-ascii?Q?0M7Sr4SgdeJXY7eSCrYvEhEX7cZS9ak+9R3r9pHALKSb3JVdDQCpfu9+877L?=
 =?us-ascii?Q?ifj90cLwxs8j8mMvrDErOAjcBgVF9/2/uuhEXPyWjd41LCPi730YJ1mz2s7y?=
 =?us-ascii?Q?VO+2hfhssMKdZG8XSzAqSedY2ZS1/9JibOJwrjgKJXIiatuV6axsNUkmMC7d?=
 =?us-ascii?Q?QfWR6fa2/MIUBweso8M3CYjjpWBPXfKIvilfB9KUzJk06BOtZ1Gzl85W/FOT?=
 =?us-ascii?Q?QddTkOtEtFScVznVFJic4c1yVEVXbPAebSoJNjpsgsWI4gKPybh+qkn4TNoY?=
 =?us-ascii?Q?0dLTqBfgoEzydWv7r13jAURnY4xfNXvOM97hnAIO6+fPH9e3OLIyznOfRBRg?=
 =?us-ascii?Q?ZNd+SvbgHc4hPnNG16iIE3eZ78iEZ/AaDphj/NYSamMnlw92F9sNkS0uELh6?=
 =?us-ascii?Q?Hgc13NXgBj/hJ2iOXibAMKOx+upQnBZSVoJFhk+pWwwPtMQswAT5ePpt6lgM?=
 =?us-ascii?Q?kxm9IoHTJSqtbxrf7W3JDgHoW9RcUNwTcovbfHhGdMnTyXtVLR3xCcM/dIKe?=
 =?us-ascii?Q?a16LsSepLRGS+f10gMw8yWfVlkNVLSH9PKciz5Kbr9dp2RI0HGWnGvc9FvsU?=
 =?us-ascii?Q?epxx+DqzckSNOWnPmR1CrqSRh2LpV+bwFG/y4QUzaNivZ+cTPzScB0p+jbgs?=
 =?us-ascii?Q?t2yuA0BWctHDGf5w08YOq9AWHKkOdFtNWs86dSQOhaPG2hYix9jp2Y97avHN?=
 =?us-ascii?Q?8meYmY/4KhQV2b77BIodx3abYvZkzYqFtsf35uM/5+H8sqa+aSC3hl8rhiu1?=
 =?us-ascii?Q?WtUPfPeDiwQcPUjp6M2rEhpW1vCkd2QlNr78AtOXsIRRF+ofQRVMzROGPqPP?=
 =?us-ascii?Q?WUFwfWRgYYRFtv+Kit3ZUROKxdNzTJb8Y9YrgFsY2O9iXzRBb3+zxGuzTTQY?=
 =?us-ascii?Q?LVTxbVIkMD4gyVLEKbfTCn9Dma5XpdfaIgr+AV0AG1V7AfsGkBPTI5WAbIGt?=
 =?us-ascii?Q?J/WKlW5n7g67jWTv0HcnJbjGVGqnEKag/r9fNLUZv+RI58PvxokwEjtAVuLx?=
 =?us-ascii?Q?HwSk6moEgvt5HZWTL/+9y3B7cCBNC6QH0HWM94tmwomPbsgsMCjctJA/3iP3?=
 =?us-ascii?Q?E9nvnmjN8Ejb2/+T68gunzKv7gOK0LQvk/sL2m8vhVASqchGhJaYhFfsVj0b?=
 =?us-ascii?Q?IzrxkUxsz9Fxf25iifa16f6TH2oQNOEm2fy6gFnc620PJPinPwUU77E6mAfi?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f717db84-b77b-4be2-cd4c-08dc7f63bba6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 22:15:50.7814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsZp2OIvY2pF27QmVW2r1NXtCXvN7N6hn0XPJrsjZvzhIR5c+0dI8tDeBUXie7itXbgbvt5FBnFguj7jgHzAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
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

On Tue, May 28, 2024 at 02:35:15PM -0700, Matt Roper wrote:
> On Mon, May 27, 2024 at 07:35:53PM +0200, Michal Wajdeczko wrote:
> > Drop no longer applicable "xe_mmio_" prefix and downgrade the
> > existing kernel-doc for internal function to normal comment.
> 
> As noted on the previous patch, there are several other functions with
> "xe_" prefixes even though they're static (xe_resize_vram_bar,
> xe_pci_resource_valid, xe_determine_lmem_bar_size, and the
> xe_mmio_tile_vram_size you're updating here).  Maybe we should drop the
> "xe_" prefix from all of them (and "xe_mmio" from this one) before the
> movement of VRAM code to a new file?
> 

We have talked about this before and I think the consensous was "xe_"
prefixes for static functions are fine, perhaps even desired. I can't
find a reference but I do recall a discussion on the list about this.

I think the maintainers should make / document a rule wrt to "xe_"
prefixes before we start making changes in this area as it is not clear.

Matt

> 
> Matt
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vram.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index d8b81e4e050c..411e8d23fd4d 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -192,8 +192,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> >  	return offset;
> >  }
> >  
> > -/**
> > - * xe_mmio_tile_vram_size() - Collect vram size and offset information
> > +/*
> > + * tile_vram_size() - Collect vram size and offset information
> >   * @tile: tile to get info for
> >   * @vram_size: available vram (size - device reserved portions)
> >   * @tile_size: actual vram size
> > @@ -211,8 +211,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> >   * NOTE: multi-tile bases will include the tile offset.
> >   *
> >   */
> > -static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> > -				  u64 *tile_size, u64 *tile_offset)
> > +static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> > +			  u64 *tile_size, u64 *tile_offset)
> >  {
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_gt *gt = tile->primary_gt;
> > @@ -287,7 +287,7 @@ int xe_vram_probe(struct xe_device *xe)
> >  
> >  	/* Get the size of the root tile's vram for later accessibility comparison */
> >  	tile = xe_device_get_root_tile(xe);
> > -	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> > +	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> >  	if (err)
> >  		return err;
> >  
> > @@ -302,7 +302,7 @@ int xe_vram_probe(struct xe_device *xe)
> >  
> >  	/* tile specific ranges */
> >  	for_each_tile(tile, xe, id) {
> > -		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> > +		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> >  		if (err)
> >  			return err;
> >  
> > -- 
> > 2.43.0
> > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
