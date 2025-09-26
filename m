Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA300CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9147D10EA8E;
	Fri, 26 Sep 2025 15:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2bUh9s6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4F10EA8E
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758899519; x=1790435519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FEq+GXziAT+/aa8OtFbsQyBkp9r75IxQ9cB6JS20Fbk=;
 b=L2bUh9s6wZrXDRooauyfDJcNq03t2MtUuR+aEOJslmSb0fzJ9jsyX3Wr
 GfIEXK1rg1dHTeytYiS8jFwkndGQU4VOCYgfMWYNMpnz6A7XsyhtJf0lb
 lcJ2Yqes+dSRb532vNaZh66b3cikL94W4INzBWGGHW1WiNxLIiOcKyEI2
 yeVr87QlTKv3KVYxrNP1atAHfbc48QAm0O2v855D7I8kptDDkJBx0VQ8a
 KYOfjES8EmOVQyTtgb7QQD5vULX/Mjhv7tgPEyrNTaORh1xy2FQrHLmNw
 S/+P5jc0lPaxNSUZq/nUv9CirfyE+udFTUCl2igrwdB+viJ9cVOtZk8sw A==;
X-CSE-ConnectionGUID: k0kTJLG5R7KpUHlF4IQ30Q==
X-CSE-MsgGUID: hKhtjZsFSrikFg7Mu7k2Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72595403"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72595403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:11:58 -0700
X-CSE-ConnectionGUID: 7vRANW5eQay/bxPWk7NJbQ==
X-CSE-MsgGUID: +WRrHnSwTvuvF0tAJxppLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177565582"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:11:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:11:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:11:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:11:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHOzLRiGv7d7rtXbRaH7hu2KaHQjYTOZrJzmdVdCoHKozZamL5TDMKWu/IxxbCH8jhRQRZQ9uYoCrWllzt9yOReArx0ob300iFopzG5GMYuVTpwm88IWapQ57AFDbsrpGJEotdDwdNgnH3ogdugKCbeQZZNURD7Hui8I6DlT2JG9DWzCTzJHQchOCGZtrhknmtSLW82iDjjZFz4Fg71Xdn30wsZLbFGU/PXf6gJ3FBgqMIifApKhy9Mkoj5OA2vXYo2L14NXfA+lK1bDjjp8ZXiUvkVv/H20m/lYNgaJVO5TVmsZNNXm/cf25WPLy+/v/zkwjsWLhpCOeWGroUCFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEq+GXziAT+/aa8OtFbsQyBkp9r75IxQ9cB6JS20Fbk=;
 b=kwpLo41A3DWNFvE00galvEzVkmmGaHDkrHF8gD4OcFq9WBVjsA19Z+nh33rXLAz8sLngfvP0B/l5CJIrxtKSwCx9VX2zL27Edd3lKC++MxfGxW8Vz3uAK64/d1+7kJhpX/iO8EEn1jL1NkCLbPntF1+uQ64bQukFO982PntfBGeeAcpnqlPtHRCX9Iz2pXK5deajOmjX/FotWbACkAvs+aGhvrANM0XShP/RksBqyyLxge26FKXdtc2QhJvwwxJ3a8LC1i85vYs4UZNH6JFWdOQsaEnsykeM+1YJYGA0aM0gFPaHeRrrYj7THn5D+4QurHlSHI8/2gPmvITgrKHmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 15:11:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:11:56 +0000
Date: Fri, 26 Sep 2025 10:11:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/6] drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
Message-ID: <nhm5suomqbrld6cvr3x3p7trldgirfz3gikk3oukdxsz3mvq6c@xt2f6bryh47z>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925220425.196860-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: da629178-6d8a-4a0c-420f-08ddfd0f0858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pGYPkiYFzL6lsQiHbWgPvbFWjylv/+91IwFGAiP8JAfSGxzxV6AIfRcBKsWa?=
 =?us-ascii?Q?ELRSSbH4OWPvtZMAxI88LHA9fxK3BwrmN3v4ZGM8IEasicqO4h/cg/qHvayJ?=
 =?us-ascii?Q?knfQ9y1ewQW8kdFMh6Z2JpEIICGlZectzkxcROuWssPe2mPhNAdDp5VeHZ9b?=
 =?us-ascii?Q?VNtKkuKFYk/NZRTaAxkANaBZAuMm4JIJaJ3mcPpLrKP0QTOGz7lvb7Ob069w?=
 =?us-ascii?Q?d3DxvwRPnbToRDu5vNw1+hvOL6FKxlsZYOy4EPsbP78KZMSnBH32PjDzqux0?=
 =?us-ascii?Q?02wDlu2R+GmTLrc/eMKK/EeRc5DbqOhKxqHx6wrhphFGEtJ7WiiqRTGxrjnv?=
 =?us-ascii?Q?jpL+1RtMdKxIaCGMLnuGhMF9/TAZONhCWoIw2iPyKoVQV5G3O0o4hVBGx7WL?=
 =?us-ascii?Q?h9mAzu8ZfPy9AL3ldFdcpSs9nStncTZHZvAxBrOBWxoiMNY8mm12rNhlaB9+?=
 =?us-ascii?Q?VcYtsrnIiJcQQiyuhLKe82BI8AGAbnOd2z4JEL5ads0NWrkOsAP2e1ID0czA?=
 =?us-ascii?Q?TwGYw0H2RYtFhln9suOYxW8up1kQBzcW/3QlebQxFUrZQdKUBnTMj4U3vD0q?=
 =?us-ascii?Q?XK2J43wN7TUD0q2X16p9auzezXNUA1BdUwxdXZAwmZDUpFCYQr4ZwpnDJcU3?=
 =?us-ascii?Q?F88cx3+hDavKlZ5dP62velcrxjM56qhGSYzrseWOEZWb/voL4TT0RNvfcbhl?=
 =?us-ascii?Q?5v0W2hAAva0GbBEo3A1YfxfS9XpKwQL+LYFpgn23/2EYy4XSlfVbKKm1DLxb?=
 =?us-ascii?Q?5KcCyb5JNQfFvl8NcKJlDdcSfnZxOPvX2RkFAbFk/IHtJChTJXDTCRFXSXV3?=
 =?us-ascii?Q?inE8H7ZH0Nz8Ol0BR4nn/MjgYqOnOClJJSF3B36VWvbg0fiZ8Hf6LIFkzhEF?=
 =?us-ascii?Q?ePjoNjnspgrvtyo3EiD160Cir7w1EC6gMAaAimPTNJNv4b7492XwGRxC1MBc?=
 =?us-ascii?Q?QE0y8j1Q2A7I7ozPK4Osfjj5kTmbPV8kRVJASOSp+3VwBNYTehFrsXi4YHr2?=
 =?us-ascii?Q?Y9T4EXTGx09Io6OUFDDj7lV/ctTw7rbt545rDg0aEXBWBWUedYNpE4XYu4RD?=
 =?us-ascii?Q?ZxLXcv0key8NYD8CyK+7uU6o1SQXVsNmZ9BU9VIMY6hBAnycz+VvHaPtLOst?=
 =?us-ascii?Q?woU3BWG0UC/affwRLUOK2dwavjPK7se8j8AnDZCtP0NEa5yBlq9KvAQ5ji3A?=
 =?us-ascii?Q?sstQtu6ojAQuyG7jqSdd9bkjt0mQKSyN1XEba9ovOEkXIOFDDO6SBpTNwPsy?=
 =?us-ascii?Q?HhdzQ9IVeBAYABcragAk9+lflGeCznPddPmv2gy3k/O5fsnbWoJvxLL6AMNy?=
 =?us-ascii?Q?RU3BIABokIYwzKincJMwArYnSpDHi+TKt3kntmgZMSZdozfdaCn+gkGYHIEV?=
 =?us-ascii?Q?ug5QJsvRgIoXaL7im5vzMtCpWf8eWQkIkw4FC0EFtGsWQ6lNZCta9cDDsM67?=
 =?us-ascii?Q?YRNhQJ39ySkt36k0oxizkEbHseTa1xBw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TVVBNCHtWx/xsO5lJiey45Gbgl7jkjWVoCXZ3nMcORBWJ+Rc6dMMM+R0IzgG?=
 =?us-ascii?Q?uV7pubgiUBY5g6hSzHzQHusDQK4xmVk1d/xpCdhDjQgC1/8ucYOujWYeBCGV?=
 =?us-ascii?Q?Ebr9Llu0Aqw1pa+uP8bu7aHsf1UGVIStq3jCfHaO+l2N8rnt5q/rbNMoWywl?=
 =?us-ascii?Q?32DF3w/U80Ej35BVTizj7O68ifwVEkWUvQL0MyjgPfJfBohqJv16zzU2HhNy?=
 =?us-ascii?Q?ViXuyYf/DGpYDVHCgH0mKc3Io0iD7BxP01eTPSzKRff3yqo0WasfnDmbBLHl?=
 =?us-ascii?Q?COO81NDdEZlvb7s+Eb6r+bkHOgbWtnQ3MyxbXJEvBK78WiRct61g8JT81viP?=
 =?us-ascii?Q?nuRRaJuBxWtCMzH3eLhFTjL3/VTtOFlMunxG8CMM64Y4CBJNh+DELhSjoJgy?=
 =?us-ascii?Q?y6prOOWwQC472Uq+mNLNyZUON1nUetOBmVcEJKc6nNu8e3IJSJY+pRgIqJlj?=
 =?us-ascii?Q?4PdMDNCqhH0fNZrPO3KoWjuxh6ljr+88yv0JVmBqORD2gIP8rJozZAbS1pQt?=
 =?us-ascii?Q?wyqoVg6Sc7/gIzPqNtT8r0cQcE1YT34NMbnLu6TnS6XLCwLJvYrDg5nRXmET?=
 =?us-ascii?Q?hShfepogYZt5pbq8Dymg4XeJH32/+BklsiGesJ0krkVB6ZdLNMPahvQW6hNA?=
 =?us-ascii?Q?Yv9IlCY+Bj+FcmRCP3njqT8kMEozUI70pI9fQB/oh0t0VJw0biw46eeKxCus?=
 =?us-ascii?Q?1gUKfPMacN74DyKbJjfIZKQ+auZ1ccKROsssompDNIAtL2j1uI7QclNK8zJV?=
 =?us-ascii?Q?A/xTxCySXEXSf2+vT7dzfAjvjEqCFsP/6Ty1iKK0MBpIvGPYMb7dHEm9LiaY?=
 =?us-ascii?Q?8uGJD7JuHdxrxqI646IIyZJ4vSAmqHzIiVra3ZVbaeA4KrxWRvkzDukNo0WC?=
 =?us-ascii?Q?hAaAUHWpd6rSn+mNZNIjdpvwmxUFwIxkOwsHJPSOHXFyth8E0N2COQ7aX+I0?=
 =?us-ascii?Q?Y6Iows91/Q9ytcAZRRtZSSJSUidGuIeFO80ZJxjzp18Bksb061NzJbTy7jY5?=
 =?us-ascii?Q?OFHow+zzeBfeisNzTEpduLoKiQEYdHKyxPC7/Q/BlaGdf6puVqVFq2yp1mPt?=
 =?us-ascii?Q?rIfp2sgVIMeOi86yGnzfMyujsh1/xtOI1zvUZNaP+ppmifErOXJ0BURERGyy?=
 =?us-ascii?Q?WOZtUwL25/69rnJ3Cp3xQBgJD6PIrGpNi2qWUKhSPH8FhSMXKzjqLuOQymsd?=
 =?us-ascii?Q?gchH5NbOg3yi/PzyjZjTvijHKwJTqTjwhBAzaxgrp4pKoKTO3JuNBrZzC2zk?=
 =?us-ascii?Q?4t8ydxHqFGjwnr0zLzmHuOz2hsaON+FRgWW5pulF0pADMrtl1gdc+nGcZm1G?=
 =?us-ascii?Q?FUbQFoALh6zr2XMJpACM87MZFH6mF6+tcG2LXbnEw0Zn3ePze7di2OtWnHMZ?=
 =?us-ascii?Q?WZ38TI5wK6Rpn34tRNqRjqvF0cBiqnsTpGA2iAQw9LNe+TtfMlJI4G3R6JxT?=
 =?us-ascii?Q?tKNsX/lNrzpwUCvjV8Q2vVTxKoYuctn56RYEubKyWMNzIVP+u9LCyORVm2qA?=
 =?us-ascii?Q?N6lQELwCTlFlEsWUikevbCCjidcbrOZZOo1jBItoJe08gMWO8Jm23R3qabyF?=
 =?us-ascii?Q?Zokyi5AOu6+hMc5vzKYwrm+xyjeDe3pIL2SaURV9JnjdC+zjzt1/7Mzzdzno?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da629178-6d8a-4a0c-420f-08ddfd0f0858
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:11:56.4392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw3wUFQGB9BUkh2uXbCJr58nkr50d2EopAgoosW2FwGNxTbX2ea6xf7/x6PwVgO96qr5HYsmgmvK5B4LgZ0wr5Ou8P6o+9Hd6Pl4DoiL1q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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

On Fri, Sep 26, 2025 at 12:04:22AM +0200, Michal Wajdeczko wrote:
>We will want to use this helper function in other files.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
