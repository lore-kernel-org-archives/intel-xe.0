Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45809C83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 11:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9C10E104;
	Thu, 10 Jul 2025 11:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpH5Fjte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D010E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 11:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752148311; x=1783684311;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MVbRre0qqhfWOUEeUS2CHsTwrmMVfBIZQbasckCQ1aM=;
 b=ZpH5FjteWkV8cdtUtmk9Al4GyGpEn4VtmV+CTTjU5f09TOQOXhmAbogv
 IOeXnPLofdjTz8a532crrvNZpo1zG4z30499yJEexxZZUd+J9Q9lbaJ9t
 7nR/kbAm9lG4d8LEGBJnEpXWPCIJRFg4uvlphtI6WffUz0cMnZqXOSYuG
 r+Jz2K39LB+xFd3ZmA5PNsDOJS6/i0ZKHBfKckEpqRo1LUvTwgk/NQr59
 SNRDyRkx9Z5UQIu16d1XiynvBTAyhbNOcwAw/shw11Cvz4Iji2IUxaMyV
 OU2Um4fmJqyxc7/Na1Tz3acTOi+76xegrj3kOHidlGPcMrXMcvF9MTtnM w==;
X-CSE-ConnectionGUID: LrF1kmkMR1G31iet99ki0Q==
X-CSE-MsgGUID: xfqIj4HzS+2CbgzTG7ZUmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79861069"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79861069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:51:51 -0700
X-CSE-ConnectionGUID: 4nmqeM79Tt+gTLNLNnETTQ==
X-CSE-MsgGUID: a1fTNcERT6m4uEOTBvSd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156526736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:51:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 04:51:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 04:51:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 04:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFdezjpHxC5p+ojtb7Jo+D0htYKQcaux4e5LhZUVHIT3jmBCcAtufbuPLLtPjCWlFnGtaLKdpbV5cstdoQ49uVPecboEkSUZAO2mUUmDNSqkDMwS/NjgcWpzxhpMQC+sTxQO/LW1n7ycey6a3T39e8GmeYPEhLTDe86ukJoyuXFGKualtpJtvQov+PfEArbNnaEc1PvDo3b1X0tPbro0NWj8U7a2rtmSvU2wf22sFTI7rH3V0qWPw9gXFtG/GfdqtDyXaw995L6rYKCT2+qWKfOn2RwToRzMk2JFbNDu2TSASvkp5kJgNgRA6qIySAZJ8thBySmPmdqU7JaPZevttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMUZ0sVTQQL557yhiv4salFr6BYQ1V7z2Lvn9WaCpsU=;
 b=T8gwWlKwEyPotxpCqht43u3p4kJOJyXfPUfeACj2Alc8hapfbMuDEjjVG7R7QPuAvret8ruRUli0auz3f329mcmHPS3dcLtGu/AkWXoM9v76S3oERu26seGlqJafXKYBrQBk1I+qH2kXVk9wKmOSfo2vhoa+KDa8Y+6mu8parSl20SueR/WvbCln2c6hm3FK5NN62CjpxC0y5rkBxtCWZ2Y8Rmf/vPtLrX7rfm4MmRrnDF/aud3b1RWyuIn/t3uU4uxnS/GuAIS+H3g2L6Z7TDb6n58cu8bkNbt8yd7scRvCLk/UOjFeBCF6Flk1ngdjHn05Rca8fZUR+hkgG0gJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 11:51:20 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:51:20 +0000
Date: Thu, 10 Jul 2025 13:51:15 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aG-pM2fCmMmRIYsh@fdugast-desk>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702234222.3278264-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 673d19e6-354c-4df2-1f5b-08ddbfa81600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T260hTSqKfo966TDM2PKOyy0lmItirz3BfJT9vX2ZJ6sRKDAIdq8PyMtTt?=
 =?iso-8859-1?Q?KBhGye6wQtuLFm8ftiGl3+3uJ0HEiADkb7JRxX5aGRysKj9CQQ4EeOCe6I?=
 =?iso-8859-1?Q?bm6Rfcdj9wajl/OuP28eEUAYSaiR8tWz+MZAS5mqdqsL3zETQTXP5IrLtH?=
 =?iso-8859-1?Q?/52g5Mbu3tBo0MMGDD8FtcDxtSo0yxb/Bnqw/wINizvB5JWrKuVs09IWg0?=
 =?iso-8859-1?Q?W49MsVW/x7lGMtVXC6R0r0NDky/WOJwsr2XThH3/uI3ITiAYd3NTXuyfTi?=
 =?iso-8859-1?Q?wYa15pc/8zNEYRe1Nmm2Nwtj+uwHgaIVej0W5pOLWzhvHlPnEZGbt4dBKY?=
 =?iso-8859-1?Q?60cDxCc9wLNicuW0FY0MOrPwb68vPldE/Nnhhmc4+cWxRcmAC8Ab86yLcY?=
 =?iso-8859-1?Q?9F52f7a+l4TbSwSiRyYynRwLethW4cphbxQlxOzUW64GRy5Bm7q5zXvWVf?=
 =?iso-8859-1?Q?Sr7S1LV2q41wicB1RFc1LEjTwD+nsrjQh9FkWxSyUxLHiHxBXuRNU9jqW4?=
 =?iso-8859-1?Q?5aGhwN+x8yiq94Dl8WoDVMriRXWyBvQQ9NMB8NFCJ+hnK7yEn10GmH6CXt?=
 =?iso-8859-1?Q?476fYuk/e+QrEIitafXWcyQE4M/DjEATBNutHgSzIAdQOtkrE60bQD1sW0?=
 =?iso-8859-1?Q?xR04XJaD/xR+zmAj26CJtXvsdIwH1YOuK8GurjiiyorUeAx78wDwgesLK/?=
 =?iso-8859-1?Q?jvhiEBUmT/FWco/10qcREaPMNAazPcNM4pPh0m5bOIlpLuNsbpot6D+1kc?=
 =?iso-8859-1?Q?0d9IlEPqeMPzARD0SvBYhpM1stQq4kDlaimMvDeeFcuB1lgBTxG8KwB2Hk?=
 =?iso-8859-1?Q?+AavM6pUuWPuhmroODzyjcmbbBOKt9LZbL6UvA/Rm3NyepGL8PsZ1V+sGb?=
 =?iso-8859-1?Q?4ODte84OK9CBGastoFoUQgMQ0aDChAgt1ZXd57OKjPCuXyty4SOZmTDGQi?=
 =?iso-8859-1?Q?sN0c16mpkMlyd9IvyrXBXzs00PP6Coc0hanYMcIMipkYhs8ZmfaAhssubc?=
 =?iso-8859-1?Q?pdSI6U2Vd/D/d12ZsosVnUXLAHNuS/ee1ZYi8MKOxbXIX/mwpwSgggCqtg?=
 =?iso-8859-1?Q?SZvpM5q4sHyU4XvA73o0XYHUJ36dD5AGi80jr+22KLei1uR0oHMFBJSpO+?=
 =?iso-8859-1?Q?SJVjOrFmTNbm6sxz6QANbKKNhDjsUXEVu1OopjeBOJ/qCBfIoDvJ32zaL0?=
 =?iso-8859-1?Q?jsnhOjEJwlFkHPRPDN4Nx5Gj1lCKeJJxOHBHo2USyZsuERVbXQlvdh5eNc?=
 =?iso-8859-1?Q?ekg602DX+MK5YlFLCsk3yfb07rdS0RLIVPuKBorVdnacfz6CqTd+Onkkrv?=
 =?iso-8859-1?Q?tYwEfSiXc9D/v0D2M3Oh7MLZxE9H+49LXTqq+fB6pL1IsXXUbwM53dYF98?=
 =?iso-8859-1?Q?tAGHWiM+sh6jPtUfRZ1IBSbWXJ2XfHae9HJbS3RU57YqtfraoTZIiXkwBV?=
 =?iso-8859-1?Q?XYRKPtQvlLbAKHCL7Kf0SOGtMOyVGz3JvQTyGDlS1vhfh+ri3sC+ygTmMA?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GHUutWzfswhDz2NdveZMWPcpV1RYrBDmzBeYgHrNJ2yQaNIlUjCw/C/3ts?=
 =?iso-8859-1?Q?PYkTmrLNJd0SZfKznBXZF57KbVh7Q5X1+13ZS+5F9WgWITotDo+lNN3WZy?=
 =?iso-8859-1?Q?+8rg74dzcQHKLLGcXU2onxUNfNp5zXDTtbIacnD77w3cp0SylgFw7A0GSZ?=
 =?iso-8859-1?Q?VltfQUh8KcPyjY6T5J73LeI8FwyQrW8Ga3psU4PJIQ0UDQtwe7N0G/Lhw8?=
 =?iso-8859-1?Q?MlBUJoytvgsu/HEpF9mYQCj6V4Jfc+EMfpYTv+ravaZ3nC/obfSmBIVDWk?=
 =?iso-8859-1?Q?VDoVe4qgdSR2HCBvcFCMW4UNCJqwVGPNFZdriBzt7XlEES41zm/ERNGuLu?=
 =?iso-8859-1?Q?6uzZNdc0XUTghiuakeMCzQF7+c+J0x6B6uHj1gEIPJrd3ZpKBAjIQeFQ8B?=
 =?iso-8859-1?Q?39nS9QK/o1ZLlDq0kxmZwcEa36dXTCueczIjdzMJiL0kZPS0CtQYozUGor?=
 =?iso-8859-1?Q?4VXwCYDguX8aGcBgIT3it5HWwK0pCBsmpmhv3I89RJ5BEluU3KICLk2Lye?=
 =?iso-8859-1?Q?YhWaa0euIclJJ6NFJTokfsjbx14SX29pVX1ck+6epvFwkHhc+syvelDq1G?=
 =?iso-8859-1?Q?tghGBt0Zi0XWuiA99h8a+fPwiWLtyARwisgK6n62Q86rpq3U1O1IrW36O7?=
 =?iso-8859-1?Q?2c739Eeob+3dGkpwl8m3FB1w1Mol0wMK7vaxZK1jmGIvwgdRpiLh2V5e7v?=
 =?iso-8859-1?Q?nff/WzH9lkZbbvE2za/2joNVYKrJkIt97jXULyBbmO6ZWfelmf1wjHydzw?=
 =?iso-8859-1?Q?+P4FoyNHTDMe7ZtIIfFAYXP2aS5hlveGYHzDX25magGs6mvbalrmB+TnlB?=
 =?iso-8859-1?Q?RNO0hGNlj1ZReiOUZ1yhHNszjn70L+nxxHGKJlUtgVXWfHlIRrBiSy04Ll?=
 =?iso-8859-1?Q?ZthElRpsXBn2+tn61NtBWIsLrr8d+3HusL+BRSIZ4yzmLOU3Yt463qQFTi?=
 =?iso-8859-1?Q?/OwrxlazfcJKj2wCHqZ00ghuHJkwKAlctZ9StZcIQigo08dG0urO+M/vmn?=
 =?iso-8859-1?Q?lbBwnLU8CoMWALefegFNgz75J3Zc87sn3mY1BLTkqBUcPx0KySWdjSbzvV?=
 =?iso-8859-1?Q?Pqal6nei+kTMHWDIbS5E5uQnywj1OEPuOKSmQNn1lC4Ra9CJIWkvkiqtnD?=
 =?iso-8859-1?Q?uEAurG55fj866FSgoTenUW3wNJ8AbrQ3NVf7T2J7EoQ8otSv8zboTEfNi8?=
 =?iso-8859-1?Q?ufAagPCevknrUI4Z6fQdel6eB2HjSazzuDA1TvIxpf3RJoePfUms8c3HoD?=
 =?iso-8859-1?Q?MYAl62MxBxpWgBrpfFYgXyy7frkGsq1mExTLgF+H0+4Hh0j019I9a7477w?=
 =?iso-8859-1?Q?EsRL3CF9nBrzHRoN4CGMnGwtDkUjfVl7zIdFVUCRmwzeYBqSOI3ER5dKCK?=
 =?iso-8859-1?Q?LYx7AzR2ukvUsgy9knlcPQqeOvTRzsyHIcAEyxi8vWhywMIFXFijbuaH9b?=
 =?iso-8859-1?Q?rI8g/6Zc88XGU7PWThOoExHUoH0+xmBkdlGijt21o9gdrqy7KWNx8GIs3j?=
 =?iso-8859-1?Q?s/+XRIX2SpOwoj1WIN+dnmAVbnu02vzYrzlhB5kXlRzTRgDEm/rVKuZx3O?=
 =?iso-8859-1?Q?bH/dvR+uetV6gku1SJfkvfkmJY3VHGznQ1JWn+m/46xWYnYuXARc9uWupC?=
 =?iso-8859-1?Q?WaL3JZkIX48kOjF8PcbYvqA2GjAPykDOmUVxODMP5svj9lbRRuNSB+tA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 673d19e6-354c-4df2-1f5b-08ddbfa81600
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 11:51:20.2614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0PCFw8rDcQ0tifUdn7N+0YrhC8/1tmnLzydSsvx7YDTwU02LPn9oPvXTFm3oMlPXZ555iS3QVNAmdT79kgvgukpyuY56jr3kAObGVOuZCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

On Wed, Jul 02, 2025 at 04:42:15PM -0700, Matthew Brost wrote:
> Add generic dependecy jobs / scheduler which serves as wrapper for DRM
> scheduler. Useful when we want delay a generic operation until a
> dma-fence signals.
> 
> Existing use cases could be destroying of resources based fences /
> dma-resv, the preempt rebind worker, and pipelined GT TLB invalidations.
> 
> Written in such a way it could be moved to DRM subsystem if needed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
>  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
>  4 files changed, 196 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
>  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1d97e5b63f4e..0edcfc770c0d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
> +	xe_dep_scheduler.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_device_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h b/drivers/gpu/drm/xe/xe_dep_job_types.h
> new file mode 100644
> index 000000000000..c6a484f24c8c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_DEP_JOB_TYPES_H_
> +#define _XE_DEP_JOB_TYPES_H_
> +
> +#include <drm/gpu_scheduler.h>
> +
> +struct xe_dep_job;
> +
> +/** struct xe_dep_job_ops - Generic Xe dependency job operations */
> +struct xe_dep_job_ops {
> +	/** @run_job: Run generic Xe dependency job */
> +	struct dma_fence *(*run_job)(struct xe_dep_job *job);
> +	/** @free_job: Free generic Xe dependency job */
> +	void (*free_job)(struct xe_dep_job *job);
> +};
> +
> +/** struct xe_dep_job - Generic dependency Xe job */
> +struct xe_dep_job {
> +	/** @drm: base DRM scheduler job */
> +	struct drm_sched_job drm;
> +	/** @ops: dependency job operations */
> +	const struct xe_dep_job_ops *ops;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> new file mode 100644
> index 000000000000..fbd55577d787
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/slab.h>
> +
> +#include <drm/gpu_scheduler.h>
> +
> +#include "xe_dep_job_types.h"
> +#include "xe_dep_scheduler.h"
> +#include "xe_device_types.h"
> +
> +/**
> + * DOC: Xe Dependency Scheduler
> + *
> + * The Xe dependency scheduler is a simple wrapper built around the DRM
> + * scheduler to execute jobs once their dependencies are resolved (i.e., all
> + * input fences specified as dependencies are signaled). The jobs that are
> + * executed contain virtual functions to run (execute) and free the job,
> + * allowing a single dependency scheduler to handle jobs performing different
> + * operations.
> + *
> + * Example use cases include deferred resource freeing, TLB invalidations after
> + * bind jobs, etc.
> + */

This is already well documentated but as this code might eventually get
promoted to DRM, maybe we could add generic pseudo-code showing how it is
intended to be used, for example:

 * .. code-block:: c
 *
 *      struct my_job {
 *        struct xe_dep_job dep;
 *        struct dma_fence *fence;
 *        ...
 *      }
 *      
 *      
 *      static struct dma_fence *my_job_run(struct xe_dep_job *dep_job)
 *      {
 *        struct my_job *job = container_of(dep_job, typeof(*job), dep);
 *        
 *        // start the job and get a fence
 *        ...
 *        
 *        return job->fence;
 *      }
 *      
 *      static void my_job_free(struct xe_dep_job *dep_job)
 *      {
 *        ...
 *      }
 *      
 *      static const struct xe_dep_job_ops my_job_ops = {
 *      	.run_job = my_job_run,
 *      	.free_job = my_job_free,
 *      };
 *      
 *      void init()
 *      {
 *        struct xe_dep_scheduler *dep_scheduler = xe_dep_scheduler_create(xe, wq, name, 16);
 *        ...
 *      }
 *      
 *      struct my_job *create()
 *      {
 *        struct drm_sched_entity *entity = xe_dep_scheduler_entity(dep_scheduler);
 *        struct my_job *job;
 *        ...
 *      
 *        job->dep.ops = &dep_job_ops;
 *        drm_sched_job_init(&job->dep.drm, entity, ...);
 *        
 *        return job;
 *      }
 *      
 *      void cleanup()
 *      {
 *        xe_dep_scheduler_fini(dep_scheduler);
 *        ...
 *      }

> +
> +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> +struct xe_dep_scheduler {
> +	/** @sched: DRM GPU scheduler */
> +	struct drm_gpu_scheduler sched;
> +	/** @entity: DRM scheduler entity  */
> +	struct drm_sched_entity entity;
> +	/** @rcu: For safe freeing of exported dma fences */
> +	struct rcu_head rcu;

Is it used in the series?

Francois

> +};
> +
> +static struct dma_fence *xe_dep_scheduler_run_job(struct drm_sched_job *drm_job)
> +{
> +	struct xe_dep_job *dep_job =
> +		container_of(drm_job, typeof(*dep_job), drm);
> +
> +	return dep_job->ops->run_job(dep_job);
> +}
> +
> +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> +{
> +	struct xe_dep_job *dep_job =
> +		container_of(drm_job, typeof(*dep_job), drm);
> +
> +	dep_job->ops->free_job(dep_job);
> +}
> +
> +static const struct drm_sched_backend_ops sched_ops = {
> +	.run_job = xe_dep_scheduler_run_job,
> +	.free_job = xe_dep_scheduler_free_job,
> +};
> +
> +/**
> + * xe_dep_scheduler_create() - Generic Xe dependency scheduler create
> + * @xe: Xe device
> + * @submit_wq: Submit workqueue struct (can be NULL)
> + * @name: Name of dependency scheduler
> + * @job_limit: Max dependency jobs that can be scheduled
> + *
> + * Create a generic Xe dependency scheduler and initialize internal DRM
> + * scheduler objects.
> + *
> + * Return: Generic Xe dependency scheduler object or ERR_PTR
> + */
> +struct xe_dep_scheduler *
> +xe_dep_scheduler_create(struct xe_device *xe,
> +			struct workqueue_struct *submit_wq,
> +			const char *name, u32 job_limit)
> +{
> +	struct xe_dep_scheduler *dep_scheduler;
> +	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args args = {
> +		.ops = &sched_ops,
> +		.submit_wq = submit_wq,
> +		.num_rqs = 1,
> +		.credit_limit = job_limit,
> +		.timeout = MAX_SCHEDULE_TIMEOUT,
> +		.name = name,
> +		.dev = xe->drm.dev,
> +	};
> +	int err;
> +
> +	dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> +	if (!dep_scheduler)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err = drm_sched_init(&dep_scheduler->sched, &args);
> +	if (err)
> +		goto err_free;
> +
> +	sched = &dep_scheduler->sched;
> +	err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> +				    (struct drm_gpu_scheduler **)&sched, 1,
> +				    NULL);
> +	if (err)
> +		goto err_sched;
> +
> +	init_rcu_head(&dep_scheduler->rcu);
> +
> +	return dep_scheduler;
> +
> +err_sched:
> +	drm_sched_fini(&dep_scheduler->sched);
> +err_free:
> +	kfree(dep_scheduler);
> +
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler finalize
> + * @dep_scheduler: Generic Xe dependency scheduler object
> + *
> + * Finalize internal DRM scheduler objects and free generic Xe dependency
> + * scheduler object
> + */
> +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> +{
> +	drm_sched_entity_fini(&dep_scheduler->entity);
> +	drm_sched_fini(&dep_scheduler->sched);
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(dep_scheduler, rcu);
> +}
> +
> +/**
> + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency scheduler
> + *                             DRM scheduler entity
> + * @dep_scheduler: Generic Xe dependency scheduler object
> + *
> + * Return: The generic Xe dependency scheduler's DRM scheduler entity
> + */
> +struct drm_sched_entity *
> +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> +{
> +	return &dep_scheduler->entity;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> new file mode 100644
> index 000000000000..853961eec64b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct drm_sched_entity;
> +struct workqueue_struct;
> +struct xe_dep_scheduler;
> +struct xe_device;
> +
> +struct xe_dep_scheduler *
> +xe_dep_scheduler_create(struct xe_device *xe,
> +			struct workqueue_struct *submit_wq,
> +			const char *name, u32 job_limit);
> +
> +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> +
> +struct drm_sched_entity *
> +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
> -- 
> 2.34.1
> 
