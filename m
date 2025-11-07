Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C3FCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 20:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380910EB7E;
	Fri,  7 Nov 2025 20:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g37c74hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A5310EB7E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 20:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762548186; x=1794084186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=02ypWNS68+gWjbDnrr01Waq6jTxylXo73ONvicWYwXQ=;
 b=g37c74hrVALbhTBkgTlKnRLwEHf6mwDthRUTr3LoI/56pWdbeCb9ExJA
 fcB1bVJ2wxF4pNxjiK3ub9bQ3hGCd3wlQGXJXhLL/5tIU5e4jRpa6FDa0
 dmHbcudXs7Hc9Rdw1eiB8FQCnuBTHontOdQOTrOg6uLbQW6jahr0ycr1x
 u8RvtO/XwkPXH3XsJDvwVcAKtIOzRaOC44D7+zHCZrLWEx1QFQIDxUWJ8
 +vtOt7MZVQDZO6bKNdveEN/VZdRfYGyyXMXSIJRLyqz1Kp1xnzvlYeKeI
 taOL5kpwlAAkO/bbxywL+1/2NLKyA5K5TWXb4s3twOS3DFB9kf10uaCcn Q==;
X-CSE-ConnectionGUID: 3jVHDhLfQZOK5GAs5bxSMQ==
X-CSE-MsgGUID: 1jw0WjDXRWCxDDEarlafIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87333442"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="87333442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 12:43:06 -0800
X-CSE-ConnectionGUID: k+gRqxvkTFSNkM0/Hwk6xg==
X-CSE-MsgGUID: y2UYeSGAQtS71BgJRPjgUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188842577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 12:43:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 12:43:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 12:43:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 12:43:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/RLxJrLCYK9KgUVVMuShuA8Azcp8cG5716RzLL0bCG+gRtlkRORrJ9uTpHpQlrrBvBlPZzUdQLdapInSe6EIMaD6/IF6vFhVdZe3YmnczqJCcrrJcSzQ+ly5bUwghcWB722kbFmbifLdYgpH1ReEkLwTNlyoMJRcJGe8wRgpVuISJng3NoHNjYNELhYcVMwcI4i7UBcjdYQ1o1x7Sc2RK8c0IXodgd514sc+tSUvWALAvYqPiPi/MQ3ZSvWL60pqou+ohHnDy5N298ihhCU6ZhkJpcjnOs2Jbh6gwNT62ZBkHhtZ3P8ITs6ymuK/ZKMxa865JVOnfZ0JW7F3sCSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QK9AsbyrjWDnG2L2Pcgu26IEV44DC+XqfDRg6QfgRk=;
 b=Y/WhuvT9o254oKc0QV2CEnP9ykX5Gv86DfSLIo5HM4efVw3fgNWhqpb0QsiRLPwajD2TEjV5vjEx1uKTY//F+E5UXTsp8tpuLnOxEXCs3qwIE9x+8KnIkTvytFxTiwoWGQmguuUy6JuiTX5q0NvRn5RZSZXjvLoZ5i4M//Lu3DgQrSlTBSQQVlw8Q2bc6qmgraq31EpIb0CrTxHosEbwNG7xYrZLPSvGDp72GmyUaUPp1FPHvJmP3DjqDMQnHWvbTzozVFqxKgK3e2vJPGhrF/nXPNhhMtsJmi3yTaOA65EvTc2th+qpwOb+IXHFd8sJVyQrDoqR6AldpQfeVNWarw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 20:43:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 20:43:03 +0000
Date: Fri, 7 Nov 2025 12:43:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [FOR-CI 01/10] drm/i915/display: Make get_vblank_counter use
 intel_de_read_fw()
Message-ID: <20251107204300.GJ3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107193946.1075137-1-dev@lankhorst.se>
 <20251107193946.1075137-2-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107193946.1075137-2-dev@lankhorst.se>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: d021dd2d-7c19-443d-88c0-08de1e3e3f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?juZmCmO50di7OXsGzzr30ZG1VwvzAHE3Uq4vGxTfZ6oPteSXro4tpJ7U/6ka?=
 =?us-ascii?Q?phADcki8jU4wlVYFSLg+LrccABcf5Vdmo7oQT789cHouO25gI4G9qQcSwDDh?=
 =?us-ascii?Q?ECUqFLS8EqAwvth+3/yW7JG/qDXc1WO4WfpSRuV+WmLZS3r9yWuPWGpmoZmx?=
 =?us-ascii?Q?/vWPUNXvlpXu5vZyr8f1V/2pOLcPR1efI8LZqpwvOzRR2vdNhYtNGSQdBI4Q?=
 =?us-ascii?Q?SFzVOPHAF4Q9dlHKfyE7ObuD+S8MTd3nlH/HPF2If0kOOmJbiHL8V6gjmykj?=
 =?us-ascii?Q?6wUu6WqKm3eSpz6vYZJpjll/fSAtS66hIMo3/mwBN+s7slhfpkOC9C+IXU1R?=
 =?us-ascii?Q?TLkeN2wVd0AziQl5ugKgLkbqNL1G/2xc0aBV6Gj523uyys1kFAPTLhFd+VZ0?=
 =?us-ascii?Q?9xTp1oRKIxH6JbtU6MpRdWBx07LpyWe5llY+RTbMT9RBMnakCH63LV2tmybF?=
 =?us-ascii?Q?7LsK4rcl1pCw1nlZ83vPWhxNKeTTx+t6boULxcgv8WQ3tgIL/IglBXeQImpB?=
 =?us-ascii?Q?uH7jHOQOFc94MfelsBK5O9YJgY/n+IPD+YTAemM2VaSqZABJJmF7N7vtVqB2?=
 =?us-ascii?Q?juI0FHZq4nFZWv2HmZqB8jNq/x71WodsvUu1dS3ikYM2SdV2rxv1+CISEk6+?=
 =?us-ascii?Q?pPeQxZCR8t/q6MiTvVYRqqm4tVZ5hdHJMZwfj5J9CyEbkcC669twokHqFA3J?=
 =?us-ascii?Q?8lB9EfcYLtbXnfn3I3shqqylVXwxj8QutA0VG7CeC2n7N9QGz5HVghnu/AXh?=
 =?us-ascii?Q?AXnG0SrYi4t2ehUG9j8UNInba7WPx5empHYPvQkbYdAXaqq6ywygAP9tg/yM?=
 =?us-ascii?Q?im8CocaOw9jugZFHkZdXVA0ZAmRcftjx1DSjBjx7b0yUP4KlomqveOxcmgZL?=
 =?us-ascii?Q?iV33eZeCQ28viRDE3lApyjpXJlwvrCB7ePrrd8JzyjvNt9EIxBxOhhsCZ2p8?=
 =?us-ascii?Q?tN/z5+2JtE+uCz1Eido/vUI+1v7aQ6lmS9xHtp1pUTqskfEX2cdsmr+p9UB9?=
 =?us-ascii?Q?A7KVOCCyZyfOCwisMNFEecUEuY4drqahVVaTY3RJ+S9RsdNtryxqefn7VcKX?=
 =?us-ascii?Q?5Hl6Pudz+4bG+jBfZKcNgW8Kwhj6z2ax0VeZPPOSAyL/kMoffQQN3RFoH6lj?=
 =?us-ascii?Q?8I6d2tcTNoPsjJOoBlxb8M5Q1vZtuzclH6qJyJz3w/i5NG3FuatHPf/GHDln?=
 =?us-ascii?Q?B3y+scBy/ikkBC/jxDA9M6pdTPckl6RLOi3A1wR1hcAdD12KF4PNd2WkGcC+?=
 =?us-ascii?Q?uKErw0j4xc51QcrM/EgYIekIUONSMDgEjbFZ89bkN9lomWgzH30vnDUSvyUm?=
 =?us-ascii?Q?yXvRgmbUPu1HguMFv3ZwbrLlqFuyAMfEnivgwU2Sc5jkrXQkTXfCnXKExAWr?=
 =?us-ascii?Q?9mOmZKi8y5ZFm8OuVPLdAhuQcMzTU+94BA8o4ydh2L3EMGxRr6HOx8HSZtTx?=
 =?us-ascii?Q?EVcKCnXtExHYFVUO5Jq7F6KE+bRM/46y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66/YeYOn47Ul0eSvDfYw1oTlij6oyEiasRHrlCyp98rtvuEzcdEEyQafxqF1?=
 =?us-ascii?Q?rZGBTVDdE5Es70A0o8qm1nub8Q1IVw38aLha3uRcNhyeSZ50/+oHMgVxjmZU?=
 =?us-ascii?Q?I0ZssaV223rn6I0xg1Pat//Fli53GYdANibKDRl6dDPtjg1v2Zw4ljsydHZN?=
 =?us-ascii?Q?iHuFF/gqWUoVFu/nMxZ2m2so3e6GI2vtYwZZ6pLNSvTJUQnI91ZqV3Ww5Br/?=
 =?us-ascii?Q?pN7WXd9j6z0XrmDefffREnaqfctbkbdhvYbOrG/hftnJfJEv8nL71ZvbT1O8?=
 =?us-ascii?Q?5dSjV59io+VaoJvpBc033PgMFqMpZ2nkMMRINnnogtR4L9Da7RHj7KaEVD1i?=
 =?us-ascii?Q?ifyBx2y2tXzKvTKVj0dwzdnfrhFrwh0yrVASFnvQD9clVjgBmQmNCvsByAAq?=
 =?us-ascii?Q?bs51wjlky3/3dSWPz0ABlwFysV1LpCvZazrAvsyfbFT3e/dxRk9j8/76eDdb?=
 =?us-ascii?Q?lEfYFIW/rzyBzoo4v/rSp2ieZ5yS1OcqtGdAJ2TvsvaJdLnKaR/07xtDZFvD?=
 =?us-ascii?Q?M0Gv0fXgyM81/g6zr83lXLM4avEPbIZvPPEoa8+xA0zZbTcJqkYjNQFp/h7d?=
 =?us-ascii?Q?bf8VFgksGkL+indltqCcWc3SOCl3FYdQH9F1OTbhjBg7mt/Z4W7GTq0c0D9Q?=
 =?us-ascii?Q?BQwwgOtjf5i9oGOE98k8RM877KJrlBfB6yAG8fhII4xuza6wudV+2iaZW3ow?=
 =?us-ascii?Q?fYIoGBFw9qM8htTjabXgMx1Wg7GBvu1DPinGo/nW/JpQZP8+mfFq0TzeX15T?=
 =?us-ascii?Q?PlV8cdzXTyEF0/4PzupD4GoPVHkxtXVLGczOblIyJYDbvgSgDRgiT+WThL75?=
 =?us-ascii?Q?k/ItNMefojsz0F4EghgrvIx+BfCkdMyitv+IVvXrXSzs8MhNPd6csCrmWs25?=
 =?us-ascii?Q?AR1nDQbydWorgkMZXgN5OqgINrmJIc0gn/rs10+ws6N5Yxv5o3Ntqbz2Rx6g?=
 =?us-ascii?Q?W3B+X4CdNY/Vu1v6kJZJK3tsApdXH+ydYpcUJf5FZQv9uilibOE1YPZzqTbJ?=
 =?us-ascii?Q?f3jjLh4mDi5sTlRrgiRnfZhbkLfJAXN/wianbLXtGeDMub+3gbcz8+3twd2q?=
 =?us-ascii?Q?Iot4dZFZpBkbVtImkgbFMZ1hgGOSp8MRgUMOnm5xMUnRU0rOnsB5j5IpqG7J?=
 =?us-ascii?Q?UKZr7aAW0RSSN5xqla54NMYXeJY8H6R0EtS3itkSgoQgJoE2aMXbGTxXnVz6?=
 =?us-ascii?Q?20hMN+zLHbkWompuCRIUzkepMPpauNtqIOqyiRfIE3zUmj28tzyzZBl8NJcv?=
 =?us-ascii?Q?/6yecVK61wEvsfcnOSGmgIkryNeit3E8Bz/RVI2oTgXnImQrnWfLTyXC0186?=
 =?us-ascii?Q?UaSumYpKKqPq9FfoverXZgdLA5JP8fl/k2VZqI3h6IejTAe7V+3SiuOwPf/0?=
 =?us-ascii?Q?TqbJPl859XtDKpb5Q1Seaq0g1W6y4oMEkLAh33ujwGfx8FnmL7vOyYfu7bVb?=
 =?us-ascii?Q?cnFGtZ71lqucMwELimddRBylMrFS4ES8QLcgxmSKP/48cAPQc3ITZYQ9DLQu?=
 =?us-ascii?Q?UZWNzPOHl3tyWs8uhrBpkIZkJiWjNPqVqbiCYqoHGzDMUi78eVznaaxKlehs?=
 =?us-ascii?Q?MQORh40zIxComtVy3zoUOZLI83L9oX3BPWCgkewow6r4N9eexLR1pC5Pjk3j?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d021dd2d-7c19-443d-88c0-08de1e3e3f23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 20:43:03.0540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tb3WdLpDHnN6DjHtBR7ZRYKv9Z+rgwSrNEuTUHFah3LaTeNT9YCu10xDvyUKxVGon0yedfdPsO8GPtPYp6pRzddoQfKfHAm7Wy1wPBmbgfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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

On Fri, Nov 07, 2025 at 08:39:36PM +0100, Maarten Lankhorst wrote:
> Fixes the following lockdep splat on PREEMPT_RT:
> <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1373, name: xe_module_load
> <3> preempt_count: 1, expected: 0
> <3> RCU nest depth: 0, expected: 0
> <4> 11 locks held by xe_module_load/1373:
> <4>  #0: ffff888107b691a0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x104/0x220
> <4>  #1: ffff88813cd30280 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x32/0xe0
> <4>  #2: ffffffff837f88f8 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x1b/0x50
> <4>  #3: ffffffff835985e0 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x6f/0x90
> <4>  #4: ffff88812589e6a0 (&helper->lock){+.+.}-{3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x7b/0x110
> <4>  #5: ffff88813cd30158 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x20/0x50
> <4>  #6: ffff88812589e488 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x2a/0x1b0
> <4>  #7: ffffc9000031eef0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
> <4>  #8: ffffc9000031ef18 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
> <4>  #9: ffff888114f7b8b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
> <4>  #10: ffff88812a0cbbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
> 
> This splat will happen otherwise on all tracepoints too, for similar reasons.

Drive-by comment, but this isn't really a proper fix, right?  Using the
*_fw register access variants means that (among other things) the call
doesn't acquire uncore->lock.  On some older i915 platforms,
simultaneous register access from two different threads would hang the
system.  The uncore spinlock ensures that register accesses are always
serialized so that we can't trigger those crashes (the uncore spinlock
also protects other stuff like forcewake handling, but that's not
relevant here).  If we use the "_fw" variant of register access, we're
removing the protection and allowing register accesses to race again if
we aren't already holding the lock explicitly at a higher level of the
code.  I'm not sure exactly which platform(s) had the problems with
simultaneous register access; it isn't a concern for newer platforms so
Xe doesn't need to worry about it, only i915.

PREEMPT_RT creates a huge mess because it silently changes spinlock_t
from a real spinlock into a into a sleeping mutex, and that means it
can't be used anywhere that sleeping is disallowed.  Since regular
register reads/writes require spinlock protection in i915, that also
means that we suddenly can't perform regular register reads/writes in
those areas either.

I guess a real fix would be to convert uncore->lock into a
raw_spinlock_t which is still a "real" spinlock, even with PREEMPT.


Matt

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 671f357c65638..2b106ffa3f5f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -133,7 +133,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
>  	if (!vblank->max_vblank_count)
>  		return 0;
>  
> -	return intel_de_read(display, PIPE_FRMCOUNT_G4X(display, pipe));
> +	return intel_de_read_fw(display, PIPE_FRMCOUNT_G4X(display, pipe));
>  }
>  
>  static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
