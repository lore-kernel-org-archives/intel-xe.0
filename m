Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88746CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 22:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C0110E200;
	Thu, 13 Nov 2025 22:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/WX4J4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447C10E200
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763071941; x=1794607941;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=i3YXIoC0DxE6Iuafv5lPRmeEVgXZfQX+F8k66OoUUeA=;
 b=f/WX4J4W9LG3Rz3A8Z7Xlr+4Ut1jXcUZaVq7qlxz0Maf6T1b1D2nxahn
 ZH31e8SM0dGokwpHHjPS5QmAYxWcG+dbj9hUXaPmqhDlMRhL5VCVkSMbj
 HYkqN0RXUmsR9eeRRcbpMu3dkiE/wM64kZWG5cp81mFiO3XSXYJ4V7UlV
 zaAEob35ARA3R4V/mDtjp4PssyYAkKfbqYrIQaenZ8JA3hKQm2lA/Ih5a
 R7Heoc5tYYuxWLwUSist7FSBjIrFMydMRoMnrMkH+7GQWsQ/JuamBls/W
 J7SYoMoRDpUa2hVpk6PM9+k2ZKH8/24Mq5lzx1pm9xmj8KVxP5YU5KCbL w==;
X-CSE-ConnectionGUID: ZompHueOSrm9SX6BD4VSkA==
X-CSE-MsgGUID: fzGYFpDvTqS0/2FxqPzbbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75771819"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="75771819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:12:21 -0800
X-CSE-ConnectionGUID: TAKIsmZfSHCpkS7vUjHBKg==
X-CSE-MsgGUID: vol0GtoWQX+bNlXR0f/VFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="226943747"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 14:12:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:12:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 14:12:20 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 14:11:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWF9Cl9Cc+8E7UPMG/tZ0cEFMPHRI+1TfcCYXfiQz6FwVbeHDpPA+OYSeYwibtBv4rn+4QXUt/Hg1TU/lHPjDawJo7UhAShvZNuk4oaRdV3NVED9r20xgz+KOdpfAscs7o+s2bdpI9CoCmwiiqN71cFILgFbtBQ0to4nc9cE1JKaQwFGhXzAKIYHcuTUCXGxwcmuYPRpcB+vBJGrKY1wXrqtHLZjUp9CwJWXDWxhhoYHKbSFVZlUJGUmjKnMsHocGRvuqlvXfxznSF/4LyBRud/eEw/0z9a/cNwZqDyTYMJXA0tpXiayEXj0uxZGZsSu5CPhPfyFQLluW44xrebNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUv5l4LKrxF2KO45kccWns/5j0ZJ15JTXSq44LBIgEI=;
 b=NWBlOg22TwxQAOvk/gdtG3IgHWRXBv14BSf69b8mxHvUDAKLXfvzVNMgTq4ApDM/l6UjEqeDAVHhPHSKl0yAHfFWkn5EfhkHoQ1gwTSJh4pexrQlNQ1lTsCClfyejslW7Q915+EsvSt/iPRbann2ZW7yCPoyuYlV3QLmuz1ejVhAcpC6YGj6PcdGeOFhLsKhdSJU6nhyo2IeAw/cwWWpguDNU8dMMbeBWUEP/bOr0Qpz14ASZAV2HSHpBZbxGacsJrTg/KbtUWXoOaupFeUzUpOKMwstsmrIKQO+EjUVZCruN1aOukVeeYMOLF+ahgQtSH4VhtMbAHjsMHJL5IPnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 13 Nov
 2025 22:11:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 22:11:52 +0000
Date: Thu, 13 Nov 2025 14:11:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/30] Scope-based forcewake and runtime PM
Message-ID: <20251113221150.GO3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6315f446-869b-47b5-1339-08de2301a650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u0rXqgRkvBZt5zek0/vwl/fL1QqNk3qC5qh0HTxopMPCCG7r3ZT7SPH0MgLQ?=
 =?us-ascii?Q?k2/18m5omgC7qXyYQxBf+WGaEwIVq+IN3LyiqwirYlrCV2W6TOULhks/7Sim?=
 =?us-ascii?Q?03OFX9K8XJwsnjlnDWYRRfSvNg9nxBW5kg2fZRUlUcYgYyhvpM9pOY/MFwIb?=
 =?us-ascii?Q?YHALTe+rLKqFXRXsI5zI/qXTY6z7lonTbp/E1ifgkYr6vwMcl1ldJ607XPeO?=
 =?us-ascii?Q?/bMHMJQMo/nc/8baR2WdzBA4GDqdVtTireP2swxnqH2XKTd8H1y2qq8f4Ylk?=
 =?us-ascii?Q?9OnSSw7M3qkmQTFqIqfeMLE7thqi7Et82is+rjTXOwGrrwohs2Z4+yrNaXq4?=
 =?us-ascii?Q?QHor4tx5rosE03Xmvfxq/Tc9ANpZ+0lNTQIepxvpYrQU0egEzoRp0b8Ha4/o?=
 =?us-ascii?Q?YnFtUFdpzTT5BTLtF497k9UUfDegKOcuDATeXFhBN8eEd2N8GT525mnK+S26?=
 =?us-ascii?Q?anVOP26yL/mv+KPu/yPSNuX7pBPehmEY4TA53qbZgEzNbdPyLIRlo7i/pDlS?=
 =?us-ascii?Q?/JBU4VDU8n91owBN+ufz6TDWyboRCBmeWhkzz2S4igqq55Lk4AEoBg/XUQZP?=
 =?us-ascii?Q?9qOGIB5ICYLT+PM0LobCG+xBLAlrOlhfGyhJE/w0XavU8FTnY0kTrc1uoe17?=
 =?us-ascii?Q?O6oNEkX4uKEGDuUfDAtJIM1SQ1UsECkBoC8RvlOT+tgncNnPkZL6cXZhCZAv?=
 =?us-ascii?Q?NRyesurQ6UxFmCvuBeXHpVtZg4rcXWFupFt2Gay563jDRg7XoZSm3PJJgWxl?=
 =?us-ascii?Q?3YnS1i0RpQAcM0Cr9AnfWJv0u18YmcM5sx7b4dS4+i6CHHR68Vp9Ci4sSuCM?=
 =?us-ascii?Q?zVC0H5PERzJAimA5ijGV3BSx/vGiFFwLPYVTtRo09JLNCxkBJlKx5c+1XvbK?=
 =?us-ascii?Q?K3fGrsGWaa+ZmgHt36CzJiGoHPExxj7BqIY9z+gbs+zg/xN8qUwBrlOlKOuv?=
 =?us-ascii?Q?4hM5hZfBujElEFu/h4iTD4v5FYl4lh3ShVo/geDdVDN9RSZRdg5XUPnoclBu?=
 =?us-ascii?Q?roIk+sVrpjoPQPAslmRkgXVHo3JJOyLCCqQMSMf+OwKL3efweoy6raHalbL0?=
 =?us-ascii?Q?uiZn3J3UpPPosk89sd9gnwJQDatjqzlmpK8PhuVIvV2NnDVC+atP1mCtA8Cg?=
 =?us-ascii?Q?xrVrFVeY4xmiZMtVGTqPeGdJki0M73vKSXVMAwAJy3EY29Fsb5gM8bqJBt2q?=
 =?us-ascii?Q?uQUxOBCCd8JBVFZfQA8XHnR7L3uWy9Nysh8XMzSQ/wGlCk4Zt1+DMB35qh5h?=
 =?us-ascii?Q?K3EsV59WA3Ar9FhCokXR6l5/tMLHJT7rzbpJxdGEuzKlyL1B3TVIljoMoT8+?=
 =?us-ascii?Q?xHP9M/ZiH7fEG5qYEixKURHjHO19jGpcXkhOfByK5KopgB5KJbtW7981M19E?=
 =?us-ascii?Q?SRQvtiuUdmFLPdainANN+Vw7HPZDmDnB7Nsuf5SF2d4ngFYsPbBeU2YaPxnu?=
 =?us-ascii?Q?qO5YCwrW3j6QmhwIQ2h+hsp+VveaGIt7+pl0zR9dSUGijci4x8ZcDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NAdN0Jk1wMkElAOxXr/2TnbAexAVt9EKU+RalmQEFeYw/K6+w49avu8J4QlW?=
 =?us-ascii?Q?w3r8hESwY2SIMHlB+JHFPu0AzDFiCN5Ds/8CpmrX210Nr7x+xiNMNl+yd4B0?=
 =?us-ascii?Q?qmc5tCBP/2pi/6fy4gUQp0PcRvV4G60bhxyXlYJAKgJqc2+07SBvaR+Qs4uq?=
 =?us-ascii?Q?q+YuKbj4UvVWdD2V+Ij4SrnytDuPNEexHeqo8iNIl0ch/nYBvcy5nZyLssK2?=
 =?us-ascii?Q?Sygh3Nt00RtAejZp8JMY8A0coMd2+Ra1Hluvj8ZWeb/Ptj0oo/Ydv1SIY5Fj?=
 =?us-ascii?Q?Ii5uwWKkcxG4SlwOMkMWc1z6fwPntd5rad0cfUKsT1thMNnMra3m7v/KTia6?=
 =?us-ascii?Q?UtNY/raax7mOYuFMAih3ApEynsRROVbJv+vUb9JSsO1WYe/KE0D92SEHBkF7?=
 =?us-ascii?Q?G5vXkWOUepm93CoeqCFNJS4K0mkZ0JvMiZHZw1MSa7DVABAI81WnWTubc3A9?=
 =?us-ascii?Q?V4XDUGwXjyeC3P7awal00JKuaFAoiw/OquEWa4NEycu5NOhkRZf+AsXFEFj2?=
 =?us-ascii?Q?niAQ+c2jSgEQCv4yrRuFqXzjyHoprHBCbr1mLOkPL5beGIpe0qHGidKBlD2G?=
 =?us-ascii?Q?cecWj33HiPaT/qjqzStcOfe+g71eBg92ty0tGwZtm0dBB9CiEd7EleEnQYbY?=
 =?us-ascii?Q?Vl0zLgjsL8HF2IWqWcqB9yA3QjPbXJNYu1TYLSsrb6Cx6Jntxysmb+pVfkQJ?=
 =?us-ascii?Q?6QXQUy7Pd1/3Act8HbXvN9eryshjb3L0x1AHMfNW3rTBOwTwc6Q3YMXSvE6v?=
 =?us-ascii?Q?0p5z6eVEHoSf8Xbv3C/u8Z0h1hYLBNrg20274c/9RS+0IQiPOJaaWzePgWvy?=
 =?us-ascii?Q?ajWLMR3ZmCwynSIBpqw3fKwdrfvXGKrrE0I2Dt4hxbZF7NZmh38V6NnyX8Yw?=
 =?us-ascii?Q?Kd+WhCmSIQjR2fEM/+6jDpdebQWzMP7qaw5rZ2A4NuU8HM2NStW4PfksZ/Fk?=
 =?us-ascii?Q?LXea1xTrrDUQ3qe3VKQmbUa3PH1JZmw+MuWMXjD6puTAXDTLvuoZFzg2lg5p?=
 =?us-ascii?Q?UQlnCXQ4S3l9h5o8iV4UXfxDSlcM4ZSw8DBqa+TkP9mILPHY+iXeHl1e1CSQ?=
 =?us-ascii?Q?DcxJVaRVwf1K+5MAPQ1ADDiQ0BajQa25eZTsTGxU/PM+6JD4BEXy1U4nThDA?=
 =?us-ascii?Q?EFuH0DyLoZH3SCg97edNX/TPYNEJzMF2gjEId7cSDMkVjqOWVzu7JAWkRshW?=
 =?us-ascii?Q?CbYexHspmJFHcm9Jnr67pmioDHzXhSHw1KJPh8C9lNZ5xCZvUe1TOoLpjuoB?=
 =?us-ascii?Q?ywqIbPIGeUQbxvDtwKOUiAcIKZbk+eBe1RsUNWcZNfkoWkjhcgZxl9qwzk1V?=
 =?us-ascii?Q?mExm2gekRXyJ1QZVs8so+t91OjNtZ5ct2IpSUceqppRbY/0LSzfkE/uOQHz1?=
 =?us-ascii?Q?NRzMZZnoM7DHJjOaHbWXpJvZMnizLYUXxOGTXHKWhDqRIBOo4/hVhWVhbLCO?=
 =?us-ascii?Q?VyM+IRU6PYC8SiQLEdbNFtjVJOCn85Wjw78feRYh6824SBtUkzMvxLo5mbmf?=
 =?us-ascii?Q?5+qhtamuJcB8SnE/gR/jUIIp0cC15lwhYJlDoHhzO/1mr77eq+u7fzMTVFQS?=
 =?us-ascii?Q?ZLPNxtCS8jT0AAwAOWOP1IVicaQRx4DpIQVQlPaa3C9Ocpm0OIIS4htEpPwF?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6315f446-869b-47b5-1339-08de2301a650
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 22:11:52.6982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XIdP2jyAUwhygTd8WAJO7upFhMT37KnL+ns39jk0oloPZ6Xiryj2oiy+W+KqfuIY3styM4aOGdiDAqeiYUx6XM269Q9C7Lk29G6Z+Uw19U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

On Mon, Nov 10, 2025 at 03:20:18PM -0800, Matt Roper wrote:
> Forcewake and runtime PM both follow reference-counted get/put models;
> when used in functions that can encounter errors and return early, it's
> easy for developers to make mistakes and fail to drop a reference on all
> of the error paths.  Cleanup of these reference counts is often
> addressed by goto-based error handling which is somewhat ugly and
> subject to its own set of mistakes once we accumulate too many error
> labels in a function.
> 
> Scope-based cleanup ([1][2]) has been gaining increasing popularity in
> the Linux kernel for cleaning up various kinds of resources in a more
> automated way when code has lots of error paths and early exits.  Let's
> add scope-based cleanup for both forcewake and runtime PM, based on the
> mechanisms provided in include/linux/cleanup.h.  Scope-based cleanup
> allows cleanup destructors to be executed automatically when the current
> scope is exited by any means (end of block, return, break, etc.).
> 
> For xe_runtime_pm_{get,put} pairs that were grabbed and released within
> a single function or block, the preferred replacement is now just
> 
>         guard(xe_pm_runtime_noresume)(xe);
> 
> which will take care of releasing the runtime PM reference
> automatically.  scoped_guard() can be used instead if the reference
> should only be held over part of the block.  There are also guard
> variants added for xe_pm_runtime_noresume and xe_pm_runtime_ioctl that
> allow replacement of those alternate functions as well.
> 
> Unlike runtime PM, where all reference tracking is done within the
> object parameter itself, forcewake is currently a model where get
> operations return a cookie that needs to be passed back to put
> operations.  That necessitates a slightly different type of cleanup
> helper (CLASS instead of guard), although the underlying mechanisms are
> the same.  For forcewake that is grabbed and released within a single
> function or block, the preferred form is now:
> 
>         CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> 
> which, like the runtime PM equivalent, will cause the forcewake
> reference to be dropped automatically.  If forcewake needs to be held
> over only a subset of the current block,
> 
>         xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FW_GT) { ... }
> 
> can be used in the same way scoped_guard() is used for runtime PM.
> 
> The first few patches in this series make some general cleanups and
> restructuring of the existing force wake code.  Then the new guards and
> classes for runtime PM and forcewake are defined.  Finally, most of the
> existing runtime PM and forcewake usage in the driver is converted to
> the scope-based form in the remainder of the series.  Some of the
> conversions eliminate goto-based cleanup models and/or significantly
> simplify the code.  Other conversions don't significantly simplify the
> code (aside from a slight reduction in line count), but are still useful
> for consistency across our codebase.
> 
> An advantage of doing the conversion everywhere possible, not just the
> places where it noticeably simplifies the code, is that it helps
> highlight the remaining get/put usage as special cases where wake
> references follow more complicated lifetimes (e.g., obtained in one
> function and released in a different one, often tied to some other type
> of resource or operation).  With fewer direct get/put calls overall, its
> easier to identify the ones that remain as special cases and make sure
> they truly are paired up properly.
> 
> There's other areas where scope-based cleanup could potentially be
> applied in the future (e.g., mutex locks, bo locking, etc.), but this
> series does not try to address those, even in places where those
> resources are also part of the same error handling cleanup paths as
> forcewake and runtime PM.  We can potentially think about converting
> other types of resources to scope-based cleanup down the road if it
> winds up working well here for forcewake and PM.
> 
> v2:
>  - Add a proper success condition to the xe_pm_runtime_ioctl class so
>    that conditional guards properly distinguish success (requiring
>    cleanup) from errors (no cleanup).  (CI)
>  - Don't bother changing the signature of xe_force_wake_get() before
>    adding the forcewake class.  Simply create a separate constructor
>    that wraps xe_force_wake_get().  (Michal)
>  - Split ACQUIRE_ERR assignments from the condition checks.  Even though
>    this takes an extra line of code and deviates from most of the other
>    uses in the kernel, it's easier to read (and avoids checkpatch
>    warnings).
> 
> 
> References:
>  [1] https://www.kernel.org/doc/html/next/core-api/cleanup.html
>  [2] https://lwn.net/Articles/934679/
> 
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Matt Roper (30):
>   drm/xe/forcewake: Improve kerneldoc
>   drm/xe/eustall: Store forcewake reference in stream structure
>   drm/xe/oa: Store forcewake reference in stream structure

I went ahead and pushed the first three patches here since they're just
simple cleanup patches that are useful even independently of the rest of
this series.  The xe_wedged failure reported by CI isn't related to any
of these three patches.


Matt

>   drm/xe/forcewake: Add scope-based cleanup for forcewake
>   drm/xe/pm: Add scope-based cleanup helper for runtime PM
>   drm/xe/gt: Use scope-based cleanup
>   drm/xe/gt_idle: Use scope-based cleanup
>   drm/xe/guc: Use scope-based cleanup
>   drm/xe/guc_pc: Use scope-based cleanup
>   drm/xe/mocs: Use scope-based cleanup
>   drm/xe/pat: Use scope-based forcewake
>   drm/xe/pxp: Use scope-based cleanup
>   drm/xe/gsc: Use scope-based cleanup
>   drm/xe/device: Use scope-based cleanup
>   drm/xe/devcoredump: Use scope-based cleanup
>   drm/xe/display: Use scoped-cleanup
>   drm/xe: Create scoped cleanup class for force_wake_get_any_engine()
>   drm/xe/drm_client: Use scope-based cleanup
>   drm/xe/gt_debugfs: Use scope-based cleanup
>   drm/xe/huc: Use scope-based forcewake
>   drm/xe/query: Use scope-based forcewake
>   drm/xe/reg_sr: Use scope-based forcewake
>   drm/xe/vram: Use scope-based forcewake
>   drm/xe/bo: Use scope-based runtime PM
>   drm/xe/ggtt: Use scope-based runtime pm
>   drm/xe/hwmon: Use scope-based runtime PM
>   drm/xe/sriov: Use scope-based runtime PM
>   drm/xe/tests: Use scope-based runtime PM
>   drm/xe/sysfs: Use scope-based runtime power management
>   drm/xe/debugfs: Use scope-based runtime PM
> 
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  23 ++-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  25 +--
>  drivers/gpu/drm/xe/tests/xe_bo.c              |  10 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c         |   3 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |  10 +-
>  drivers/gpu/drm/xe/tests/xe_mocs.c            |  27 +---
>  drivers/gpu/drm/xe/xe_bo.c                    |   3 +-
>  drivers/gpu/drm/xe/xe_debugfs.c               |  16 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c           |  26 ++-
>  drivers/gpu/drm/xe/xe_device.c                |  33 ++--
>  drivers/gpu/drm/xe/xe_device_sysfs.c          |  33 ++--
>  drivers/gpu/drm/xe/xe_drm_client.c            |  83 +++++-----
>  drivers/gpu/drm/xe/xe_eu_stall.c              |   8 +-
>  drivers/gpu/drm/xe/xe_force_wake.h            |  28 ++++
>  drivers/gpu/drm/xe/xe_force_wake_types.h      |  26 ++-
>  drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
>  drivers/gpu/drm/xe/xe_gsc.c                   |  21 +--
>  drivers/gpu/drm/xe/xe_gsc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c             |  17 +-
>  drivers/gpu/drm/xe/xe_gt.c                    | 151 ++++++------------
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  29 +---
>  drivers/gpu/drm/xe/xe_gt_freq.c               |  27 ++--
>  drivers/gpu/drm/xe/xe_gt_idle.c               |  32 ++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  12 +-
>  drivers/gpu/drm/xe/xe_gt_throttle.c           |   3 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |  13 +-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_guc_log.c               |  10 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 ++-----
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  11 +-
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c         |   4 +-
>  drivers/gpu/drm/xe/xe_huc.c                   |   7 +-
>  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   3 +-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |   6 +-
>  drivers/gpu/drm/xe/xe_hwmon.c                 |  16 +-
>  drivers/gpu/drm/xe/xe_mocs.c                  |  18 +--
>  drivers/gpu/drm/xe/xe_oa.c                    |   9 +-
>  drivers/gpu/drm/xe/xe_oa_types.h              |   3 +
>  drivers/gpu/drm/xe/xe_pat.c                   |  36 ++---
>  drivers/gpu/drm/xe/xe_pci_sriov.c             |   3 +-
>  drivers/gpu/drm/xe/xe_pm.h                    |  17 ++
>  drivers/gpu/drm/xe/xe_pxp.c                   |  55 +++----
>  drivers/gpu/drm/xe/xe_query.c                 |  16 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c                |  17 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |   6 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |   6 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c          |   5 +-
>  drivers/gpu/drm/xe/xe_tile_debugfs.c          |   3 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |   3 +-
>  drivers/gpu/drm/xe/xe_vram.c                  |   7 +-
>  50 files changed, 387 insertions(+), 604 deletions(-)
> 
> -- 
> 2.51.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
