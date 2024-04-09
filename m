Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DEEC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 18:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D030112ECA;
	Tue,  9 Apr 2024 18:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvPGhBVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97528112ECA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712688173; x=1744224173;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eWNfRRCC46NFlx1iK6c8MVaPxXzVtg/BjlTx3BYDH8M=;
 b=XvPGhBVTjN8KpYbo+RrL9GdB1vYv8uGoNrOqd6b91g6quIQK/9Rf96tA
 piPkeX6qG+LCOw32VoDjfUP5ITWnDfpC7FQESP2eFC/M7aBO0dFrxPX97
 EObIx7u7z8wQCDBvKg+fW1g43fMxJYAYaR9jKi1+nYW8LVzJj+rKtvXDO
 OJDOQRyvMtnL0vBN20QDaNjl0YMMejaGmQoDNTovG3fAfnzmgcQkkBVU2
 HtL40owEgeAzrCIItAD2eWX17guGtMwbkHOJeii9z3oj8oQaZV7Tq3HZX
 rcxCv5hu8342J3GeS6DonOB3pJPS7UmnJf0yGhUNLvHJu3NkRHZAs9K8z A==;
X-CSE-ConnectionGUID: OgAvJWovRFmfwRCwUtfVWw==
X-CSE-MsgGUID: lw1NfERAQyqsLsjhyqvRfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18738742"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18738742"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 11:42:52 -0700
X-CSE-ConnectionGUID: J/SqkvuDRvegmgqvH74zvQ==
X-CSE-MsgGUID: vdLyMU2AQjiw/PDuo5uq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51524613"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 11:42:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 11:42:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 11:42:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 11:42:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 11:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPfz2MGX7RabEERYzgdsa7BgU9I8+mUvxquluFSIDm1Ug/ClUaYVeu3jDytazUdP/46wU1JlfqYoQUWSi1VntRpQVR7gtdxIAljBG+ug2NgPLFAWdL3AK9TWaMzoxPKEz1SpYS+3df+Ia5pQhTTcRxFBVm4CTJayJ9D0sHs0NsmhXEeKQHp7OxoZC04Bs+NxwFGnG7+ri/smoo45ypK1F3NBzJ0B+TM7vNGpWGyBfp8S7sx57UqoJldYiapUtCNva07WpEoYtGiRZIAJEN+EwqGRN49Z3la0ZMgLwlYH4stPf3zI92VV8RReHeCjY6PK/fHvTRnIw+TLqJLXFSrZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DN7n6ZdyarqKafw/SKv9AZF8LGHOHVfx7VSZ0Afq//I=;
 b=PfQm6efxKq1zg1C8jn1xY2llJNLUtrr8skC/8oGgaHJLvhD0MhLj2KQsI6Jxps+pz8ecf5lFCU7U/e4uUh6YDxf4bzkQnHAfzD28wTfFUb+iuRvniG7nJfYFK3fmhixaevZnZC9jLP/asWIFBDX3g/2OFvFWHN63rR7/+ryjATVBHOsDgFYafSRVUboqmm6wHtjzYo6L2L+KcwfFh50IAEBXd27bJY9p5Pzbc6IxHMmdjRRkdiYGMlFTXVhWcHz6grCZ8XyNBKnwrFoZDnoqHCK5iMVNFy8Q5e3qhXD/LLitCiM4dxfSb7Nnc3aHBqkBl8NTx8zkmeEvLAVGGojkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Tue, 9 Apr 2024 18:42:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 18:42:49 +0000
Date: Tue, 9 Apr 2024 14:42:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Add proper detection of the SR-IOV PF mode
Message-ID: <ZhWMHexIL0EfnRym@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
 <20240404154431.583-3-michal.wajdeczko@intel.com>
 <ZhV_KLj-fMeX2Ggc@intel.com>
 <e231b006-cd0c-4cd8-a401-2bca79ca13d8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e231b006-cd0c-4cd8-a401-2bca79ca13d8@intel.com>
X-ClientProxiedBy: BYAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6431:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAF6l2Dhps8HJrdq/0WoCVYDlZHdkxJNgVJHR2oCxcL5yspONdlosQTlY8W3J5XoFlYwXmMiEPVDyJm9UpPqdWzo46sY/xImxowDuOOpWQfpPfe9SbwsSCevDj9QIYDAYar3zS+hfyU20Vy6W4dWbkGRZm5j2KcOzrGgQK1NTcV2YPG8Qb1qCVKUqTILXMs5aRcpr0KN3q6+DDmWHzfqDVYhisI09Pc6El6LNUFyJBlbV4+OwCiIU8hwQGJX+LPtE8h6IWMaXi8w5XFyGRAy4Htjsr+DzsNT1G/Z0aCi8/P/rst+ztogK0cA5T4FEEvF5Pn7DrzE72k3F0e/pCmu1//B6PpYNXfmBmF1nDfd1VPHRPkMdUQVRaUrGr/J9xckE/A4t/XB37vwxx6JK+p9p/SPGsXYrPLEVx3ZRE5RCM2Z9Mm2NTUk0AYTC5Ch4Bwe4OsURiTUNrEZKB74hgUNXTa7sNx9bs3XTZi00Ytm2tdjLuV2xcWjvJMsXLibLLORKi8NAtZvLxQ6L9lWCddQrSwYfNbTH7M1tTXff/epIGvDnxbbf/3mSowWmT1QAVOHMkO5Ol2INIrtwp8MUKi+MG1Hg8oZJQuX4c+i7zHmg0k2R7lilVGl/VlmZYtqoP25viuJmXV3LCtXDa5XJTVQSJZZlLivUpNMM5vQvHb2/4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dw7Q7p5ZKVvTo1249n+m8TA3SIBnPTi37MY9aF6En1f5ES1+CjZoGI0GFc?=
 =?iso-8859-1?Q?6ToSZ8aUZYlFefWILXCYXcdGLFDZcPjcyMhARBc3yhm0CB1kgInoZ7LJHQ?=
 =?iso-8859-1?Q?8jaWYce0ypQD0F3/RrzBU5VsSs+OuqsytX7xOz/lZnEZCKeQ8YOQOZGSg9?=
 =?iso-8859-1?Q?mgdtOlIjhlWmoLK2GXKq863bLYgjU+vkZgCoEyTg6OUUia3KQALa7Bp6fP?=
 =?iso-8859-1?Q?E8EfzPxlzR9ypS9vhwTpN0eqR1Bk39pHWgmWVh7ZrXEOPJStQ5vcDEkGyp?=
 =?iso-8859-1?Q?NGhZvEoXe68wdfIKQvl0MQB+cXesC6pOOS4iqpZqeGqwT4+k3FoimHc0KS?=
 =?iso-8859-1?Q?3sJ3D8JUQYerX109H056oAzM8+ATKQQ8rAugrE1qQVLxEZNcSzUrJSsQlu?=
 =?iso-8859-1?Q?0wNUpJAx4a81s0/kc2Zw1gOlgOOYo5fmYwor0ptAn4pxV9yhRGZb1A17dp?=
 =?iso-8859-1?Q?hEcRRwS9gBFTjHQt2N9uNDmTob5Ooq1QORFbTMS1xAKZ5YWCXm0thFTbXs?=
 =?iso-8859-1?Q?QbPmWpdGqcr/G3WjUG0QgSRhpFP6BBlzC0qT1uFwO7exNQHqGhTNyhJvr+?=
 =?iso-8859-1?Q?JLfJni6hGqStfPMQyLIHr7dADuKLr61VGcCykeTaKvJEablhonPRTLUjDn?=
 =?iso-8859-1?Q?T0KEpel1XmVpYlRz6JoyFu1MbstPpo9TZbGY/bc+2R043kJL+R0+ANFnjY?=
 =?iso-8859-1?Q?b+0u7wqygeILudeKeT5OsxikZeCyy3YXVJfeUjrbzZUQtiebNh4pQwWTIu?=
 =?iso-8859-1?Q?qasckSl69vn1QWKCsVCMOPmrN/fMQAdMf/u+lNbgeT57kUmIgyfo6d31S5?=
 =?iso-8859-1?Q?+usuVmFUXC6AbgMaWidxfdrVk+iO8+Tcxznkxyd7iNN8EhtG9dsSJ0psar?=
 =?iso-8859-1?Q?+Et1Vup+CUzKATIMwqOoGjoIPwlhu4n965N0eVOvlMZFkfaAwL1EwCJvG4?=
 =?iso-8859-1?Q?90/dLTaDrhelrh6o+YTjGgWEM/Gg7SNpDSNSDTD2A8NjHjxX9hVS21zAN0?=
 =?iso-8859-1?Q?Nndvd/0wXxzHQ88Wy2ROU/3ALTy0aah8IVhkDGGNy6OcanuAM6pds8FiU/?=
 =?iso-8859-1?Q?bqmZ6bd2MU2Kt+Wg2EQ5kRvbt3RP2fkUvuhnGkM8kuUEFfLEQXEDj1/Z/o?=
 =?iso-8859-1?Q?1jAVw1MKibiP62VLs0MIWSk8Gyugn7jL0rx2pYf+35OOIRr/m/YnVZnQ05?=
 =?iso-8859-1?Q?a8oMHjDiHDcXNxDC9dzLgpgpEXVDbIkZQquWBGNKBpY2yufMd0EKmfu0tz?=
 =?iso-8859-1?Q?kMu7FW8+rNTi7zv63DpwFNkvM1hjAjLhYFuqDX/1UPCXTtCIPt7ZTsNkYw?=
 =?iso-8859-1?Q?XNAeo3E8aNu2KFhXNXA7FuyU+L3luG/w+IFpv0abekn58jRuVY1HbIWD7S?=
 =?iso-8859-1?Q?TIXOSfFQpC386M7EDCyvTBuI+k0lmSCB00MGarBbpIJ+j4ZsMDzyg+1pYm?=
 =?iso-8859-1?Q?Qad0CzwtI8dQ70BItfrg4mR/jeQkVDihvgTscav58r69zxvY/UYzPOaeuR?=
 =?iso-8859-1?Q?YR518rtOISeoVSeaQN7tMFzxj8FPttohTQuqC2IfikkBRXVDqa3u35+r2p?=
 =?iso-8859-1?Q?Vly2RgUgyIPv9xgxEeen7XDoY+GxQCW2IIObtKaoVTpqLdP35pwyo3xpzw?=
 =?iso-8859-1?Q?zGA17TBZLD4mwq0yfMp+PfwVu8z4IdwP18wNK0K5OhHoCQJw5JY1RnXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b8b7d6-b610-4d42-2d48-08dc58c4d8a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 18:42:49.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //Evm9VQLSaw/vWTG1oSAKE2jDXtrH+RpVlzPtfc96VnlLhDUXmuZ4zEX+owuD69YoPz2kWHKAd+WFPyR5L9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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

On Tue, Apr 09, 2024 at 08:39:36PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 09.04.2024 19:47, Rodrigo Vivi wrote:
> > On Thu, Apr 04, 2024 at 05:44:30PM +0200, Michal Wajdeczko wrote:
> >> SR-IOV PF mode detection is based on PCI capability as reported by
> >> the PCI dev_is_pf() function and additionally on 'max_vfs' module
> >> parameter which could be also used to disable PF capability even
> >> if SR-IOV PF capability is reported by the hardware.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/Makefile          |  3 +-
> >>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> >>  drivers/gpu/drm/xe/xe_sriov.c        |  3 +
> >>  drivers/gpu/drm/xe/xe_sriov_pf.c     | 89 ++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_sriov_pf.h     | 24 ++++++++
> >>  drivers/gpu/drm/xe/xe_sriov_types.h  | 15 +++++
> >>  6 files changed, 137 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
> >>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h
> >>
> >> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >> index e5b1715f721e..8d79df05b84f 100644
> >> --- a/drivers/gpu/drm/xe/Makefile
> >> +++ b/drivers/gpu/drm/xe/Makefile
> >> @@ -159,7 +159,8 @@ xe-$(CONFIG_PCI_IOV) += \
> >>  	xe_gt_sriov_pf_control.o \
> >>  	xe_lmtt.o \
> >>  	xe_lmtt_2l.o \
> >> -	xe_lmtt_ml.o
> >> +	xe_lmtt_ml.o \
> >> +	xe_sriov_pf.o
> >>  
> >>  # include helpers for tests even when XE is built-in
> >>  ifdef CONFIG_DRM_XE_KUNIT_TEST
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index c710cec835a7..8244b177a6a3 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -321,6 +321,10 @@ struct xe_device {
> >>  	struct {
> >>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
> >>  		enum xe_sriov_mode __mode;
> >> +
> >> +		/** @sriov.pf: PF specific data */
> >> +		struct xe_device_pf pf;
> >> +
> >>  		/** @sriov.wq: workqueue used by the virtualization workers */
> >>  		struct workqueue_struct *wq;
> >>  	} sriov;
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> >> index 3e103edf7174..94fa98d8206e 100644
> >> --- a/drivers/gpu/drm/xe/xe_sriov.c
> >> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> >> @@ -11,6 +11,7 @@
> >>  #include "xe_device.h"
> >>  #include "xe_mmio.h"
> >>  #include "xe_sriov.h"
> >> +#include "xe_sriov_pf.h"
> >>  
> >>  /**
> >>   * xe_sriov_mode_to_string - Convert enum value to string.
> >> @@ -58,6 +59,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
> >>  	if (has_sriov) {
> >>  		if (test_is_vf(xe))
> >>  			mode = XE_SRIOV_MODE_VF;
> >> +		else if (xe_sriov_pf_readiness(xe))
> >> +			mode = XE_SRIOV_MODE_PF;
> >>  	}
> >>  
> >>  	xe_assert(xe, !xe->sriov.__mode);
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> new file mode 100644
> >> index 000000000000..030c2b69ecc4
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> >> @@ -0,0 +1,89 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2023-2024 Intel Corporation
> >> + */
> >> +
> >> +#include "xe_assert.h"
> >> +#include "xe_device.h"
> >> +#include "xe_module.h"
> >> +#include "xe_sriov.h"
> >> +#include "xe_sriov_pf.h"
> >> +#include "xe_sriov_printk.h"
> >> +
> >> +static unsigned int wanted_max_vfs(struct xe_device *xe)
> >> +{
> >> +	return xe_modparam.max_vfs;
> >> +}
> >> +
> >> +static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
> >> +{
> >> +	struct device *dev = xe->drm.dev;
> >> +	struct pci_dev *pdev = to_pci_dev(dev);
> >> +	int err;
> >> +
> >> +	err = pci_sriov_set_totalvfs(pdev, limit);
> >> +	if (err)
> >> +		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
> >> +				limit, ERR_PTR(err));
> >> +	return err;
> >> +}
> >> +
> >> +static bool pf_continue_as_native(struct xe_device *xe, const char *why)
> >> +{
> >> +	xe_sriov_dbg(xe, "%s, continuing as native\n", why);
> >> +	pf_reduce_totalvfs(xe, 0);
> >> +	return false;
> >> +}
> >> +
> >> +/**
> >> + * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
> >> + * @xe: the &xe_device to check
> >> + *
> >> + * This function is called as part of the SR-IOV probe to validate if all
> >> + * PF prerequisites are satisfied and we can continue with enabling PF mode.
> >> + *
> >> + * Return: true if the PF mode can be turned on.
> >> + */
> >> +bool xe_sriov_pf_readiness(struct xe_device *xe)
> >> +{
> >> +	struct device *dev = xe->drm.dev;
> >> +	struct pci_dev *pdev = to_pci_dev(dev);
> >> +	int totalvfs = pci_sriov_get_totalvfs(pdev);
> >> +	int newlimit = min_t(u16, wanted_max_vfs(xe), totalvfs);
> >> +
> >> +	xe_assert(xe, totalvfs <= U16_MAX);
> > 
> > perhaps we should do this check before the min_t?
> 
> this assert is just to express/confirm SLA with the PCI function
> 
> > 
> > should we also check what we are getting from the params?
> 
> we don't care, param could be any number up to U32_MAX, as we will just
> use it to limit what PCI function (and thus our HW) reports
> 
> > 
> >> +
> >> +	if (!dev_is_pf(dev))
> >> +		return false;
> >> +
> >> +	if (!xe_device_uc_enabled(xe))
> >> +		return pf_continue_as_native(xe, "Guc submission disabled");
> >> +
> >> +	if (!newlimit)
> >> +		return pf_continue_as_native(xe, "all VFs disabled");
> >> +
> >> +	pf_reduce_totalvfs(xe, newlimit);
> > 
> > do we really need to always call this or only when newlimit != totalvfs?
> 
> it's harmless to call it even if there is no change as this just updates
> internal data in PCI core, does not touch any HW, so one "if" spared
> 
> > 
> >> +
> >> +	xe->sriov.pf.device_total_vfs = totalvfs;
> >> +	xe->sriov.pf.driver_max_vfs = newlimit;
> >> +
> >> +	return true;
> >> +}
> >> +
> >> +/**
> >> + * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
> >> + * @xe: the &xe_device to print info from
> >> + * @p: the &drm_printer
> >> + *
> >> + * Print SR-IOV PF related information into provided DRM printer.
> >> + */
> >> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >> +
> >> +	xe_assert(xe, IS_SRIOV_PF(xe));
> >> +
> >> +	drm_printf(p, "total: %u\n", xe->sriov.pf.device_total_vfs);
> >> +	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
> >> +	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> >> new file mode 100644
> >> index 000000000000..ebef2e01838a
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> >> @@ -0,0 +1,24 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2023-2024 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_SRIOV_PF_H_
> >> +#define _XE_SRIOV_PF_H_
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +struct drm_printer;
> >> +struct xe_device;
> >> +
> >> +#ifdef CONFIG_PCI_IOV
> >> +bool xe_sriov_pf_readiness(struct xe_device *xe);
> >> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
> >> +#else
> >> +static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
> >> +{
> >> +	return false;
> >> +}
> > 
> > missing the vfs_summary function in this block?!
> 
> only xe_sriov_pf_readiness() function will be used regardless of the
> CONFIG_PCI_IOV, the other xe_sriov_pf_print_vfs_summary() function and
> few more functions (coming soon) will be used only for CONFIG_PCI_IOV=y
> and thus will not require empty stubs

Thanks for all the explanations.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> >> +#endif
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> >> index 1a138108d139..fa583e8fa0c2 100644
> >> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> >> @@ -7,6 +7,7 @@
> >>  #define _XE_SRIOV_TYPES_H_
> >>  
> >>  #include <linux/build_bug.h>
> >> +#include <linux/types.h>
> >>  
> >>  /**
> >>   * VFID - Virtual Function Identifier
> >> @@ -37,4 +38,18 @@ enum xe_sriov_mode {
> >>  };
> >>  static_assert(XE_SRIOV_MODE_NONE);
> >>  
> >> +/**
> >> + * struct xe_device_pf - Xe PF related data
> >> + *
> >> + * The data in this structure is valid only if driver is running in the
> >> + * @XE_SRIOV_MODE_PF mode.
> >> + */
> >> +struct xe_device_pf {
> >> +	/** @device_total_vfs: Maximum number of VFs supported by the device. */
> >> +	u16 device_total_vfs;
> >> +
> >> +	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
> >> +	u16 driver_max_vfs;
> >> +};
> >> +
> >>  #endif
> >> -- 
> >> 2.43.0
> >>
