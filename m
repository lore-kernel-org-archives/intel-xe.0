Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D8BCAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 14:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5644110E76F;
	Tue,  9 Sep 2025 14:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhJtT7cf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F1F10E76F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 14:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426620; x=1788962620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RW8VqcM/Qc+rfLfsV2IahPGb6E1euF+7pacFkof/Lb0=;
 b=bhJtT7cf7dM1jYV1bLu/WtT8WrDogD4hPFjIa00EC7iOf0/5Q2u2YUNz
 SYMhpiUWfwnfp11oqILfL0Putu6xziH3E5snb18okvsDDc3KuNmVHOjJt
 hS2S4IGLTo1f6SRNSsjO2axkpRKYZ7sK46ZtDfdH6eszie2zWdaRWMLpD
 8BWY+7/4a7LemBr8dX3QZmOgIJTPPu11TJmsA9gMUaYaIoaLly4SPsWty
 f6VLyKts9JPLicVfw/hMBC6Zd0blhMjFJmwdtod9q/J0qFwTqGsuBIxdL
 jcV2Ew71pdlyYY8GpSKH6AAk/BNsZKAJffZEW9JtrNl4axR/lt9UcsUQN A==;
X-CSE-ConnectionGUID: CUGEKh/sRjuAjeLyzeIAew==
X-CSE-MsgGUID: oNb3SmVHSF2YNfLJOBqPQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59638031"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59638031"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:03:39 -0700
X-CSE-ConnectionGUID: XMxrK2cVRF6H4Ee+SEq+uA==
X-CSE-MsgGUID: xzd5CMyPRry0/61/SofKyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172685488"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:03:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:03:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 07:03:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8jW/RdD1F84UyzoIOFoaYQxzAoyxe+iYqdh1rpVPy5agWCz4ZdtOsvqBsAlBBsnBDNXA5kmq0vqX9r2NsHYdn1zhEBideuRSIacmS8IF9UCe8Vv8HINUFX/0hSNOlddLVGqtmY5N+xXnJuwpCFpTLpIhBBLX2gdmY02ee2UgEOSMGdCtHSk3DDaAmlPAS7y+etsQ7nz1/Ur+lyNAH/u9wdU2qYExN+9mVStkCINKrzIc6FTol8YomMgnLrD3PltwLBkI2p0i5dXerpMbf/95r9+YicoLQsQOqSmtkObv71LWqDpYlCIG+kjhyHWpDVLHV9fg84Sdf9ehi6zSKC+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Tk2iAN5zW53IyjQN/VTS1SUxuueej1J6dwpMrApISg=;
 b=LYxlBQE3mYdm+I4VNtzjnT/dGu3zrSDhmKBtqxgSqdVhcfGXPUehDCfRnz4O1ZLVcE4VS9WPWNtZPXudov6Up+sEEFr45rHTjJRQdNQVhFwqCdkSPZKMiJtCN2/k9+5URFGqKl+DOZKkX+hURox0hWxSHGDJ5LaWyw/ixlWD4DsT1jWrxDl69QmYMfhkRr8gd/8Ny0HkPOanRILSSU5AuITYSafiEsZA2FSjZpBwFTbeDzTOZnLH4D7tY8h+id8kIiFfbWbvCU7pEQRYWATAb7Yo9dlw8gs1sU/lJ6t2OKInhxGcOixX+Q8cS3hXl94e8EF2p0xyLF8/cX2fcV8tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:03:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:03:27 +0000
Date: Tue, 9 Sep 2025 10:03:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes
 on VF
Message-ID: <aMAzq15goFScBzCI@intel.com>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
 <175709654211.5916.895894170330275840@intel.com>
 <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 899701aa-a98f-4da5-3919-08ddefa9a643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7prTZ0Q+VUppY2W2nTotVZc84a9kjQ/WLPZxJg5vmQDScPbO7/jtolw78eTu?=
 =?us-ascii?Q?usvySZBnVDWTm1Aw/vOJq7/dy/5SROWkqL2wuabtJGECfcNMb3oPv+mY9Qd3?=
 =?us-ascii?Q?vZbyPgnVudFUR1mr8Rz99NQulLGnOa583JtPFObMKWCTyp3pjElael1Cztnu?=
 =?us-ascii?Q?Rgaww3DK3o+UL89OaBCK9iC0CTTyTOQviwFhPA5oPJoEpodqryh/LtH6K43k?=
 =?us-ascii?Q?tHvUmSjnHvV1t1cUavlAhApJpTJGmUPak/phPwnOLujf9L27l8ZlQDzYbCvi?=
 =?us-ascii?Q?LhZmxE61ekbtpX+feuGYWC+IYLkWQIp/30mwwOsQSJa5BMtYaFiBLAvmwbgs?=
 =?us-ascii?Q?tR3PZMg4tPsTjVcWetaRhS/OFK8IOC24aTQaZZt4DN9NOl67FfHFDwRi3hdu?=
 =?us-ascii?Q?SyB6or27z4RPL38dZ3mf2DiaYH9q6cwo/bKI2+GJE1aSM2DNiJ4jk5LRJAyh?=
 =?us-ascii?Q?4+6T4Smnnz30UQyQ9rVJH0tX/bnMCuaWGIlna07pukCFIuqf0hHYs+7WUyzx?=
 =?us-ascii?Q?aUnLWmh5eRmRT+Er72sGAHntNxgYGKD3gWRkMEKtLgMYqeZuAoYFqByWxZi1?=
 =?us-ascii?Q?5Gpah0OKgXJkhXz+CVrzYqSU6oYupv2BC8JoGNy7LRN6CMqLAISKgrrBz9BN?=
 =?us-ascii?Q?gTDlZffoVmIgKEVS9AePVQ62tC8F1mhYQBqZPacBWfWD2z/ksO7POwcq2NzE?=
 =?us-ascii?Q?yKGHfVwSshOj1nbcWpvtaJ3G/PBhS0m1fNh6jcn8ggGeyaTVtU8aHRlfqOeB?=
 =?us-ascii?Q?SKBhmZRoETgXBYpynIsEmVscbSxOX2/rZHIrzkDnaArsNZkbRgdEPWdQXTF6?=
 =?us-ascii?Q?pqPq33pwpNEMRzgye0dGcMYV46VqwEej+F6UrBSxFgH5+22vkJ5cuCKwqHkE?=
 =?us-ascii?Q?s6MTRvwKyp9Mm7zEYkHNTC+aIHSVzu7sw5AnGjiTAYJdvkc4WXsjaUmrA17r?=
 =?us-ascii?Q?YkvkgKbgP5Be9zxyrV96HlS+QSdapqp5QS9VzCT5i8LJdSrrx1dNzUpokt81?=
 =?us-ascii?Q?uDPF6Cbp/aDj5hIZhpXipv/J+MEopMszBNVTOTR/ltX2bScnIHBuOvLzASvl?=
 =?us-ascii?Q?ywao3TEq5ntrYWIF0PWFEEZaONsf/KYa3KV8izmsj3wBsDfRlghniH56Jbj4?=
 =?us-ascii?Q?DIXcUdauEJjO2dFtC45Vs1Chq41X1LuwmwV/o8TmoZExShtH+2wTYJutCFoU?=
 =?us-ascii?Q?EiTixXSR2Cgy92Xi89WHJLo0YjyrK4Ml4u4QFLfr1zckFo7e709JX+nZax51?=
 =?us-ascii?Q?+TSI1N0+awPTc/6xKEgiYp2FJnHCiDZpSfLna8A2jLNr/+tIp3K2eeBe0mxK?=
 =?us-ascii?Q?o5U8dKYZAgJfyZFHtE8CCLVblrONRLIvg+YNWfNdWGoAa6tl3i2O7Q6JtBxQ?=
 =?us-ascii?Q?2FdtH2AWseNtSF///eEeK/ncTLigDHn2zlXUOozAqUaphHYFlJ/hqGgzboRV?=
 =?us-ascii?Q?gV54nqrXpw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uxH/KnXOpibpugf7DaBJt3LT+bvFxl6tZ/CPd2tUpspn7wGKpcBaLPIy7cRX?=
 =?us-ascii?Q?+PiNMq49X63bZi0LpkdF6MDgMdd6AyyMI+KJxzYBVFz8W6PHSUVXiVbMo/lh?=
 =?us-ascii?Q?VdarZ0HGzsrLjbCMUASmGLZgSutLi2OtyvFlCf3R6EwmsBAU6DY9qtnGPRuX?=
 =?us-ascii?Q?GSkfKmfUUdOGfxtaPxKoq0612QBaTyrD0k2Z033vhiurOXcS/tAIYMYx0bgr?=
 =?us-ascii?Q?9mgmW3xpuQ3CAxWaNfE9/XGv2ARExs/PZ8/xbq5Zse+E2Lxo5n2h4R3rHJL7?=
 =?us-ascii?Q?XTrts7okb8Od8e2ICp+bAdP9CYrle7lrfonMdXi0Phd+8M9ZZw1PrpMhXils?=
 =?us-ascii?Q?VSBFRPAI2SPCkOz5jmNkOnAdigeq3phOfV0RhVJshKfFk+x5DSAPP273+/J9?=
 =?us-ascii?Q?QIAVf5grGy/HIYI9Fic18qX4ytTHHW/w5TKnI/02gYgGxnaGrPfHjBJ4kF5A?=
 =?us-ascii?Q?4Paz3Ma/AWLZY6jGDfPR0SEMBgtTQ12RsDP9YldmdfVMrpSSu3vK0LlpCZUk?=
 =?us-ascii?Q?n6V+c4h7NSw2S9eLTCp4SEGDwACLdhrxWxhITy+mRInSi8FMbxUpDpRHRkkv?=
 =?us-ascii?Q?lZzI7hzb5XKaNoHq3ecyPiR+xLpb3aULhCiYNhmE92Z5jdPbVB4TdKI8F7Qe?=
 =?us-ascii?Q?7iKihrmBqC2IRB7zVRzbvwsc03ZtNI+NKlbGIMBPvmQuK7pk47yMFVJIkSj6?=
 =?us-ascii?Q?APTcN60dhGRG+hHh8PCKomSuAFgVKZAneFM9T7HhnyxfGnouA4GtieikHi3O?=
 =?us-ascii?Q?B2ccQESD3d5Fw2oukiqfVwaFkSnvi6iG7md6Y3AcxEXUAUne6Team2wcmIKC?=
 =?us-ascii?Q?WgvoAsWQq6WZPvUqCMgm7oZeZbG/1mWXkb/cUDlIiz+wEFn5UMP9T2217Z+n?=
 =?us-ascii?Q?NABJBoySJUd9ekbuKw1fjDXj73AesMPq7GZ4FYVacRMQMcSbGMvkQN9/4kbY?=
 =?us-ascii?Q?pFQGegvnIipg34rHfGgZoPmVxogwnRd8PdeGfjkayQ4ix/GHN7n1qsLxbcgz?=
 =?us-ascii?Q?oY5wDvcBcYQJYf3lRl6W04Zgs2QzTxF9Bp3YpbTdqU/d87UGXB4LxDmEFKYj?=
 =?us-ascii?Q?AAXmAuTMXwhWq1gXfkNpuvNeW7XhcrfHyk/UQtHuSHMNHKSADxXDHv92518J?=
 =?us-ascii?Q?fiBN7+OEUZ+oTFkgTA8wHywG0+LuVZKRu4BQOoODTUCzNQEB9o0Z3+ueM5oy?=
 =?us-ascii?Q?LmI2KZd8yoNwxefaDfe8jeQdHSXg1dbRrp+w1+t6wID8dyz47W6MHsEfm43m?=
 =?us-ascii?Q?Rmsmls/L4AjQy+KGQiCZzu7SGg06UxE0zx5fL72c2FnklFPpKGppL9kgiZq+?=
 =?us-ascii?Q?+Qi2FCkBgXOMW92VPNgGHWBWMupHSnTvTzan4xq4vuYkieQ+XyAa4NrXsegC?=
 =?us-ascii?Q?vT9f2zhNUpOJ5iCg+reTud3aMZ+Ou4hnr22RtX7Xy4SOwJC6GnEE2L72hziD?=
 =?us-ascii?Q?f/klBlO1rEUhIn/B6l9zGp2TV8atwPKVKbnRR7S3ZFitXEWyHDQVBRvYDNqB?=
 =?us-ascii?Q?ZUZMnlTPiBsl0jba1BkK1Elnh8QpQlOtk2IWJLydXqqZLHHI3xtaXNYYIRyg?=
 =?us-ascii?Q?mauXiktn+aEtiilMXRjfVhavtQ8KIivuk9gvD/81ZcX/cH7skCjABKlmY8qr?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899701aa-a98f-4da5-3919-08ddefa9a643
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:03:27.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwF/Muvf0J9VnC6mZp+f8oCoi8hdHg6MF/JUb2WZygZ1qqxbxNqUTMKn0njjmsJpQvENoCNbc+DxX35d8RRTUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

On Fri, Sep 05, 2025 at 08:40:14PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/5/2025 8:22 PM, Gustavo Sousa wrote:
> > Quoting Michal Wajdeczko (2025-09-05 14:36:25-03:00)
> >> In addition of checking if we are running on the BATTLEMAGE,
> >> we should also check for not being a VF driver, as VFs can't
> >> access necessary registers, and doing so leads to:
> >>
> >> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
> >> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
> >> | Call Trace:
> >> |  xe_mmio_read32+0x110/0x280 [xe]
> >> |  read_residency_counter+0x42/0xd0 [xe]
> >> |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
> >> | .. [drm] Package G2 counter failed to read, ret -19
> >>
> >> or
> >>
> >> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
> >> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
> >> | Call Trace:
> >> |  xe_mmio_read32+0x110/0x280 [xe]
> >> |  read_residency_counter+0x42/0xd0 [xe]
> >> |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
> >> | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
> >>
> >> Similarly, there is no point to expose inject_csc_hw_error on VFs,
> >> as HW errors support is already disabled for VFs.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Soham Purkait <soham.purkait@intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Riana Tauro <riana.tauro@intel.com>
> > 
> > I posted a very similar patch[1] ~1 month ago.
> 
> oops
> 
> > 
> > There was a spec-related question from Rodrigo, for which I could not
> > find the answer.
> 
> I guess the answer in indirect - there is only small set of registers
> that VFs can read directly, and above one 0x35b004 is not on this list.
> 
> Bspec: 53221

Thank you

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > [1] https://lore.kernel.org/all/20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com/
> > 
> > --
> > Gustavo Sousa
> > 
> >> ---
> >> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> >> index 4b71570529a6..8be8304cb05c 100644
> >> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> >> @@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
> >>                                  ARRAY_SIZE(debugfs_list),
> >>                                  root, minor);
> >>
> >> -        if (xe->info.platform == XE_BATTLEMAGE) {
> >> +        if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> >>                 drm_debugfs_create_files(debugfs_residencies,
> >>                                          ARRAY_SIZE(debugfs_residencies),
> >>                                          root, minor);
> >> -- 
> >> 2.47.1
> >>
> 
