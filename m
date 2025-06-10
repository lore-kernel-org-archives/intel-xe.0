Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CE4C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 00:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB5110E04A;
	Tue, 10 Jun 2025 00:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+1ho+n8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7DC10E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749516288; x=1781052288;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9FnRxuL0/ZI77SKQ0G4fxhBDxwr/69l8y8HpjE2ORHw=;
 b=i+1ho+n8/1CNLx/1iXLV+9a6G/JCGoYJBfJa4V8JISoaR1dZAteXHasN
 QSpZOTWaYfMFWdB1VT+MWa89QUFvzZIMHIlUTp9pd278xZ2ZhUazoWF/w
 5C+Mmu5QXaP3mEQXrIQrgH8gOH+qe5tKopoPGwRw6OnmatgYO1MwWV33s
 kXoAI3SPwagPfZ30JLWmYgm4j7N8Hv3Y1X5NouqQwwZt5wxc3QVSZ04lE
 qHsCBNIkiRtfKNJ5/AqZtVT11fHDsbTi149Oe+9S7LicuyDMpR2y/ymM8
 l3HnGXSaTJhBg4YIYOh6lO135fg5C+KJWU2twAPilumjTX1DQMeO1oQlz A==;
X-CSE-ConnectionGUID: CxUR228cQUOG5huFztfcTA==
X-CSE-MsgGUID: idQjTpTtSqWpQssZ3eVJ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74144833"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="74144833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:44:48 -0700
X-CSE-ConnectionGUID: nPyH2rY9Rn2aEPzG4/KsOQ==
X-CSE-MsgGUID: yBeCcny+TOyy9en8dhzGoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="146573470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:44:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 17:44:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 17:44:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 17:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZDIM8jc0ckhpuURuZ+qtcAobWD0JwnG2fnM/v0CNOvVps/JBdX8cddOX6vAmwR+yu//kf3ajkiEyw2jwJloxL3odz+iiCYnuY9CHEVdLxornp6xVUvpKSr8hLxlA7DUdDF1yr9QHueIRKhQJw+zFcsOHGQRDzBOsiia1tltKREataw5dLMwF157K6TGMD9q34cX6xlimXH6xqds5bbE3Z7yUPp12gQFdFj8I2j72/BHzAKZzbwO1YbTdNNuvrK3HM0VTqo66gO3Q2TGPqSIFz24zLxqcJDaZ1ZuMwy1nHNMzT8G2TfTaF9K/TMT5uKqwi/E/FBJahGJ212KV10q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqkHDlDk6C03Ry5GwN3+mxCjgvYU1+tkCk1JVJNdvDM=;
 b=fJMcBu0SX0BR52cUy0OmMb13EA8lqKPxh4ct/VFIKcNmOlSgVXY3ryPIVYplPOdS94cRKlaM1G+dnoJIuLUAxRqVLG/KytVozBouMOtatsw21bjP/ikOYVw/ihICXzt6z46f3Ycz0s620b0Fug9qCYhkDvlckXlTWwaodBOgJFQ3fwf3lgF+T9VkxHCsQga6FwSjTghu0ctXoYvdvFyO3sGSYUTCRtRhTeRUQFnAhaBf76g/mteBQx28cJymZs+6QHFqlz0pANsv/p4HUcsX0/LVSxH2rloBpjUoVo+VCDkaLsJ94RlwxBYmj0dB8HWN6xfdJ1WSxQ6Fq0XPkibLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 00:44:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 00:44:38 +0000
Date: Mon, 9 Jun 2025 17:46:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: Enable ATS if enabled on the PCI side
Message-ID: <aEeAVQLCj21e600V@lstrano-desk.jf.intel.com>
References: <20250609135408.102001-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609135408.102001-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:303:b7::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: 563dae36-9a95-4c74-19df-08dda7b7fada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3CFVU/CkYRyMvG4nO1fOwauxZeYV5dOm0GPBgBEFG4MDkK50SM9ePwVT/M?=
 =?iso-8859-1?Q?mn0Zln7a7NkHag2iCX5GosUNpNWMmsm0B52K/aHcTfMziFKR3ItwK2HzWJ?=
 =?iso-8859-1?Q?6+6Lc4xojhtvEtVfxWSSSOrROB8sCjPBtX5TNXKAGrMxxaBVHt1ZGcWv5/?=
 =?iso-8859-1?Q?vvkz25Ce4f4mkG5Bhgnv8lGv8d8ei49qgQqoRYHIReQR4g8WEiUDnUMF7P?=
 =?iso-8859-1?Q?zvokJt6lUSVYR5HAkQFHykt1VMbIrAFSwJbnaahEabv9EO2RW3qY3/+B3u?=
 =?iso-8859-1?Q?LZojRXsn0M+uGLiRk2CFDTflX0y+G5FOX7XxkBYObyPk+l+tLyFG9hLnyq?=
 =?iso-8859-1?Q?bSgTjmdIjbU04z4hC4LCUsjjMy+1P1/QUhkJO4jgl/Mvv22YXxKr44aqVO?=
 =?iso-8859-1?Q?CbZrzSoOv4dzAONHZo1mag2N6FkR7052bB0/Jc7fvkwPLeXjPlJvGTiXGx?=
 =?iso-8859-1?Q?1HwKYKS5cwBZTWNNwCtTYBoKBxnwcYUtHU+Ss/A32TQP7Dxk70IwU17lap?=
 =?iso-8859-1?Q?V2rjwZ3NSJLiKb65v/1LvaMLMtHfGUUnIUYIKD6fbDL15S7k+09BW7tLQX?=
 =?iso-8859-1?Q?R0N9D0tZBtXC7l5lzmAY4YuwXgx74dYcw9KlVLwmqGRe8UQXd2qbvHXAiN?=
 =?iso-8859-1?Q?JE4UYbbK4zU0MJfa8MxxEYIsnccbams7W+nJh88BT7cbBSabIU0X3KxK+H?=
 =?iso-8859-1?Q?/4DiL9zzNRJ6qLHpw99/JntWBFngE7LtTkQpa1r74XTIPa3JoP+hYT4WRH?=
 =?iso-8859-1?Q?OiPiuDi+/Os2DC4hQOrPSOz0TVyniEMzKaRoGvJcz4TT2GjH2oGh1It8rF?=
 =?iso-8859-1?Q?VqTvTiYyo+v87gFQW92Z3OgvQ2tuTfY2X2da8zCFGBCWeQiHaLQLRDz52D?=
 =?iso-8859-1?Q?c1bLqt/FTj5Gdh+2Fq2hHlb5zLHs5XTJtkjy5X8ziiLjG2fhYMj0W+LWmP?=
 =?iso-8859-1?Q?Eu1AIQb9pBKGnxMhdeqHoRgvEVtkP32gHw2G2VNwt0QT4LHtFUvxC2vIMn?=
 =?iso-8859-1?Q?4zdsdz4BxICGIK5W7C2m9cZqHQ4lsZjhzvewlidNYvq3SAAddsK7S9mFDn?=
 =?iso-8859-1?Q?e5Ft+BcgbGKc1JQsgK3PmJIjrBC0okqhnWJ5YyANZ/a+m1LHjmlrFNamQS?=
 =?iso-8859-1?Q?sfU7o3JzjWHf/jWXLCXtHRezqfLW3/3Uj80AH3EwOPa32K6+H8uW9pC2yC?=
 =?iso-8859-1?Q?iOICuvuQSB4yZtxi0Lzo9Y2dXcYMGCOJ6DrJTI/+8M67A1jg4Gc4Gxve7V?=
 =?iso-8859-1?Q?dtea7FI9g7XFSGQi1ctWpJmKuIBSvopuE93DJkdcW3S6bZbOpVloPwyW9M?=
 =?iso-8859-1?Q?cg4eJ+eRv+6rlWoQY6KjoIWjxn5jJBb++VDPelzby8O0nQjfh6Dp6XP9sr?=
 =?iso-8859-1?Q?0wfNtnHZy+HiElhvWIfg45T4qab4ZDeK6hupTd7yj+3B5w0Grnas4uBfVh?=
 =?iso-8859-1?Q?hGt52l0tg1p8/7kAMlNK7QTmEbzho0GokxdxRzH8Xh7PssowqJr1Mm58F5?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BNUCzruxQY8jXZQcW+BXZo6X+Fy56cZoIcVKAAivnKwCTmPE0K/UC0XWEF?=
 =?iso-8859-1?Q?2q7A51gheme5PRqtpuxKCrLPQ549NFnIItTQn/DM1wEAzSFViewP6rvecq?=
 =?iso-8859-1?Q?dOSyXGDakI05T9Di8QCKHAH+SfkB8omq4yn7+di2r7r/b9YkME5ox9jU9Z?=
 =?iso-8859-1?Q?19k1xX+eVViKCJDPb+NmmwT9JtakYPyaHb3Xf6i5t5TcwQ4iepenISBARS?=
 =?iso-8859-1?Q?ngTVcLqRMycva01tSUf5c05o+V4w3Cz0EHYkSVya7xTnpnG3M3JIbtbgE1?=
 =?iso-8859-1?Q?Ej29JiWm/V13j51OibJkOM6tJkjqod3bpWRP+ndvdsJUXyCpsQ3xw63oYP?=
 =?iso-8859-1?Q?noHIYlcaj/X7uhYjqmlSN+D11uqjrr1nlou7DVpexxUmjQkm2htEWnDH3C?=
 =?iso-8859-1?Q?5JzFnWKjdZfKfRGFFaVX7/KScDx1y1ypK2BikhmYtVgRqpYr2zyvaCRzdN?=
 =?iso-8859-1?Q?QbiT71VuHgTpb+rH2sGih/KrGgtobxetXOagwknDEb1/ivxxU3c5s7438M?=
 =?iso-8859-1?Q?7NThsg56ci1E4D0ti/Kro2A/Ymeyk/vX8G3Npjo/1J/OEucWX7YvJZBunp?=
 =?iso-8859-1?Q?8UWXM4dzayGPf7dYqTlE596ojuvjOal1rnwByogstGg5qCnZ7UA4DACxlc?=
 =?iso-8859-1?Q?aqc1WAL6B5mToCHRAjLv37/AzX95IHlyjfxZS4C2JwowjXD3SNDUoSkOU9?=
 =?iso-8859-1?Q?GizTINx7bHJ20PaIgQIEyHREPTds+DjwgMZcqfuS4EexRrCgjjLY1EAgTL?=
 =?iso-8859-1?Q?K1WBpaFadd0TmsSzqoxircBxAnj0LOcSRssLoxBfygRbziHsgCvAIFGej1?=
 =?iso-8859-1?Q?+AlX+J/fAczqvgT4L20jKz4Ihrrs7vx2qoEtXL6oOSr59ZtK+HiRHJwhli?=
 =?iso-8859-1?Q?KTCfohN6wIKiq5eAaRt3nuZotnX9YGfu9g6n9mTt2xk/p70/1cJ1PQ4xDo?=
 =?iso-8859-1?Q?5UcfbyFH4SpEXyY09LcmzjoRMEbQKtNlOusHVYxJ04iPBv2KE49vvafHok?=
 =?iso-8859-1?Q?1DbcW8ZQ3ZvXSY8XPdR1ByB1LjXQJnBGZESRN8hciD7oPHjixNiq5r1wul?=
 =?iso-8859-1?Q?DFMA6jwG+J2xUHWkdRuUtX/3d9tBHLC8Ncw/8Oa5Z1npyHaxGTBYRCFB4m?=
 =?iso-8859-1?Q?mQxQks28eNdXJzLXiZoZ5tXcc9r0jo4XJHemg2DUvx0+yMsN7uCpMv6PHv?=
 =?iso-8859-1?Q?68t/bhXPE1mIr8s+IFE9Yl7f6itg052DmrnJH0y3pnH1L6fYoWbRls8Ati?=
 =?iso-8859-1?Q?exACNulY35IHBRf3DfF/Sxr27elbT5rz7DZICNQITz7PWLRfj6zSGr/Se2?=
 =?iso-8859-1?Q?hKPjPXlXXddLCNwp4ksDpIOjlKxTJIL2SLX2H9/8jnXVG/aX54DsLUPDnO?=
 =?iso-8859-1?Q?TOT6sLMuGY/ax08qz8fLrkKa1qw9n5eMmPTuFsyHMG1nTV+RJN9qELWQG8?=
 =?iso-8859-1?Q?0hHjDv/+EYBJ20ItCL1wbf79Inay16yvKIPwR54uQ5ZSbZZjeucbfqjJfG?=
 =?iso-8859-1?Q?sbhKYZaEbhsLvFcv4vxanPXAHb8wZ6/Al46sSvHzzXfTygxD12bdOM9fJG?=
 =?iso-8859-1?Q?qAfKoogcaNIUi8kRj8ENc+F1wmjwy+NyaTcoBuayT6LX6MajN0V99g574L?=
 =?iso-8859-1?Q?hcLCD6PWUFFvKJu/T53/wiTDxe3b2zMrNv4oEowTJ8SNy5W5qy6FUxyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 563dae36-9a95-4c74-19df-08dda7b7fada
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 00:44:38.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hY5/8fjaZmeHrPnRqejQEdYRXZAAEUHB2sitDJjeYuMmguJjdxfDA6T7II/pk6v6Hzv7pPvZ5coIisX7siBKxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
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

On Mon, Jun 09, 2025 at 03:54:08PM +0200, Thomas Hellström wrote:
> If IOMMU and device supports ATS, enable it in an effort to offload
> IOMMU TLB.
> 

Can you explain what exactly you mean by offload 'IOMMU TLB'.

Does that mean physical addresses are cached on the device rather than
dma-addresses for system memory?

Matt 

> v2:
> - Set the FORCE_FAULT PTE flag when clearing a PTE for faulting VM. (CI)
> v3:
> - More instances of FORCE_FAULT flag. (CI)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c           |  5 ++++
>  drivers/gpu/drm/xe/xe_pt.c            | 36 +++++++++++++++------------
>  3 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4389e5a76f89..c6b32516b008 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -33,5 +33,6 @@
>  
>  #define XE_PAGE_PRESENT			BIT_ULL(0)
>  #define XE_PAGE_RW			BIT_ULL(1)
> +#define XE_PAGE_FORCE_FAULT             BIT_ULL(2)
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..085f7e0568e9 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -976,6 +976,7 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> +#define XE_CTX_PASID            (0x2c + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
> @@ -1104,6 +1105,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>  
> +	/* If possible, enable ATS to offload the IOMMU TLB */
> +	if (to_pci_dev(xe->drm.dev)->ats_enabled)
> +		xe_lrc_write_ctx_reg(lrc, XE_CTX_PASID, (1 << 31));
> +
>  	lrc->desc = LRC_VALID;
>  	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>  	/* TODO: Priority */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c9c41fbe125c..6227ea238b1b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	u8 id = tile->id;
>  
>  	if (!xe_vm_has_scratch(vm))
> -		return 0;
> +		return XE_PAGE_FORCE_FAULT;
>  
>  	if (level > MAX_HUGEPTE_LEVEL)
>  		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
> @@ -163,17 +163,9 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>  	u64 empty;
>  	int i;
>  
> -	if (!xe_vm_has_scratch(vm)) {
> -		/*
> -		 * FIXME: Some memory is allocated already allocated to zero?
> -		 * Find out which memory that is and avoid this memset...
> -		 */
> -		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
> -	} else {
> -		empty = __xe_pt_empty_pte(tile, vm, pt->level);
> -		for (i = 0; i < XE_PDES; i++)
> -			xe_pt_write(vm->xe, map, i, empty);
> -	}
> +	empty = __xe_pt_empty_pte(tile, vm, pt->level);
> +	for (i = 0; i < XE_PDES; i++)
> +		xe_pt_write(vm->xe, map, i, empty);
>  }
>  
>  /**
> @@ -535,7 +527,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		if (xe_walk->clear_pt) {
> -			pte = 0;
> +			pte = XE_PAGE_FORCE_FAULT;
>  		} else {
>  			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>  							 xe_res_dma(curs) +
> @@ -865,9 +857,21 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  	 */
>  	if (xe_pt_nonshared_offsets(addr, next, --level, walk, action, &offset,
>  				    &end_offset)) {
> -		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
> -			      offset * sizeof(u64), 0,
> -			      (end_offset - offset) * sizeof(u64));
> +		struct iosys_map *map = &xe_child->bo->vmap;
> +		struct xe_device *xe = tile_to_xe(xe_walk->tile);
> +
> +		/*
> +		 * Write only the low dword in 32-bit case to avoid potential
> +		 * issues with the high dword being non-atomically written first
> +		 * resulting in an out-of-bounds address with the present
> +		 * bit set.
> +		 */
> +		for (; offset < end_offset; offset++) {
> +			if (IS_ENABLED(CONFIG_64BIT))
> +				xe_map_wr(xe, map, offset * sizeof(u64), u64, XE_PAGE_FORCE_FAULT);
> +			else
> +				xe_map_wr(xe, map, offset * sizeof(u64), u32, XE_PAGE_FORCE_FAULT);
> +		}
>  		xe_walk->needs_invalidate = true;
>  	}
>  
> -- 
> 2.49.0
> 
