Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD9CC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3573C10E0BC;
	Mon, 14 Jul 2025 15:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdScDr++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E4E10E0BC
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752507376; x=1784043376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eETu6wav+GZNwLnVUaxaq4vAE1vTUc29rQ0Tlm35b5E=;
 b=cdScDr++33PjrkV8X6VV0Lg9CK8sApe1/l7un7K9fNjvNZBs/rqaoWBh
 1FnoJxqWDZtCl2UTB+1fx3ef3+7pkpECHL0JJTgG19bhrKPo4Cf6d6i5u
 terQyzI0j5KohXB9PtsXA7l7Zi1ksbrN04awNQuMxskGHboghSU4WV+gv
 phBzs5UV7jT3kiI+U/R4i7CYtpzE9EqfmjUKKq8nQeUW8H7R1W5XvFq/s
 5V9qsrUacsoDPHIibWHrddnnoGOjMEyQuOu1JlMAJUC+DV+OnzaWh5M+E
 4ZZMXadp2VV9/XfJ8jXAFuY0Mx65tIqo0T96x97TMJPLDatnRyf/iD/R9 w==;
X-CSE-ConnectionGUID: TOlwMHHkSWWkKIghKiQ0SA==
X-CSE-MsgGUID: OhmwrdSSQbeEzuVe0UENBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54412268"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54412268"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:36:05 -0700
X-CSE-ConnectionGUID: qDbQalvDT1iFECr5RNDrOw==
X-CSE-MsgGUID: wSIrnZ0ETnin59mBNH9sgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161269524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:36:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:35:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 08:35:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqWmyNExE5U2IVRDui784ojCfwO16vErFSzElIwi/fR6e3DhgviKkUx0PaLi3QXM9OkbU/rNrzCUo62sk7F8kl5A3dOZH/AP/Ximz60si9Vb9PjqLiY8Mubrw4KU5rdetBuMwrrXMId7wR4TOJcoJp7FPFfIzdbzw56Bma9XcqYWni9n3JZhL+vlJ3FEtBqBnEh/D4G+cutLdYLayjb8kmXHxUSEjEFz2brHEmeCiSmQGHXCDfSo9KJFK5t39DoF20nrH/9I7LnzhdU6tduhGLc5Kbiudf8u1f9fkVOPOy2FQIzYm8rXSHO53h5vfS7I2iHF2sZxE1DYJuGPRpembw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8c/9bLUpSm/QwAGZgSXohf6ZkHLfQIUACmqQIFeIOI=;
 b=dN+JIK2/vLUvd32Xfd+808411QGHiaVFdCd2x4Nin/sRL8a6Qi2loHZGnRNjuJFZE+4q1TFprEM5fspwq82ZOwS3pTJSmmiAw7X9fo9W18ca2t6fRfxbvjKI9ORLspb/VDuUX0xQNV1SLxvcamiKhd9l4ey+4nRaqgVefQgsbyPm74aTT4QmvrrDkJJdNnAItzhxlpQsbZTqV0f8tFiGgHdmgPOVbroS8z6Qgulo3W3P25/TUfskZHZlD9ff5sB9wak4NMRCj1942ipRPsrOsA+ay0Y/ttesT0rE7bwV6+nFL+INIoIKqQbjLbf94wnpp4y4p25xYfw+gd9It+NcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:35:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:35:39 +0000
Date: Mon, 14 Jul 2025 10:35:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Update register definitions in LRC layout header
Message-ID: <gw6l7q2hsbr2bem3flg7renvxsvldv56r4c47lylgwunglh5nb@mrll6up3q6hc>
References: <20250711060924.7373-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250711060924.7373-1-x.wang@intel.com>
X-ClientProxiedBy: BYAPR08CA0064.namprd08.prod.outlook.com
 (2603:10b6:a03:117::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd74870-8e0a-4b60-4107-08ddc2ec15ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3PU+3r/EN4OU3Hty5qgaz9OvVBIJLvu9EbUaSjXgXxYFJ8Syw0UyBjNKbG+d?=
 =?us-ascii?Q?0aNGVQ4+DwH0KlNcc9YazvmvP9+ZJsCjc9usI+t7IQLzQU7DL+AhvekRAhW0?=
 =?us-ascii?Q?m7HWcGLnRmjMTo926WB/pYRfT4t2liX5Wk8ePGmEKafwbWm0k64NdVl8gwMK?=
 =?us-ascii?Q?OTjuU8DsgW3ZcMsKd82aiwVia1gg9VJQrOYVsmCwCwnGPKAZojpONvLG3Thn?=
 =?us-ascii?Q?IrCqRvVW3fU7mGI/NEgOlqlUjiKMQC+PpSKGda1wA1QZWmOccjoW4QdDbW1K?=
 =?us-ascii?Q?SDC2N3hlKNT8/tqPfRjBBcjEcPeq3gBKnCc3XMcL11HG6ZoAJWg+WPTij3m9?=
 =?us-ascii?Q?NYFASzl/HjfDxf93PkZxMrWm3xwopsVUvIZy8GKQI5Yjw6nVZ1CtyIRcU+w1?=
 =?us-ascii?Q?Vyd4LtVezCiQoCtY8PphD34INXVUM31MMgIamLQWvxL7G3GGXE4w4Fl+ra78?=
 =?us-ascii?Q?9FLjHDIOJxOkniNpgkRToZH7l4/cabcMhvd0irJz3J1ja4zjs0MCn/4A4cd1?=
 =?us-ascii?Q?iKj2khuEnMfxtbzC60xHVi953IdpzGcLjgl151HHH/g8RGE4A535hhbWUyPr?=
 =?us-ascii?Q?ELp3ckVkA1o+lDMs82E9BqvqXU5BHoNZH4AAI5dzpkw2RUeFdrhAreId0uQk?=
 =?us-ascii?Q?Uq/T501KhNwjyOfM1LDvH34Cp4XoGCYoX0N1Gz64jpJv+P/xi7kL6zmOEhh7?=
 =?us-ascii?Q?misNAEER/yD8Szi+tnDZwYArNGP+bqWnMUMtlwt3jZIp86DtwCFUo4EHWJmG?=
 =?us-ascii?Q?+e559RjjtiZVi1tkUeA+JdPm6PJt/MqDZs5bTSBoigwUxaQOwwSdMlAwnnSS?=
 =?us-ascii?Q?zP7EOv+Pmd5lFz7VN07Pu+1cjJlChnLgmryZFUCjuuAGjD2O2VfoKw9Kj1xu?=
 =?us-ascii?Q?X1okx8YzXs/O+cBawcrYAlLacBLJUhdvSDQ/I17llpirXVaP+bJuZtLpw+BM?=
 =?us-ascii?Q?MN03no4K9LNSHBTag0TpwZfj4RsnCWvSZ0BzjOQRqeMMzKA1EvCcqw1bwaAw?=
 =?us-ascii?Q?ALsUCvgSkvDkp3Qj+qB2V9oD9lIsmiepG1M78UovfQsdH4XU1P2dNcReUXYs?=
 =?us-ascii?Q?pSWLk67PjwrSZsIFpb09XjuyZKrv1FgMg476oGghqnEL8xjEegByn7I1/Qkc?=
 =?us-ascii?Q?/3h/56qneK3GkEzlpq8DD/HwMvrx22y6f7WAB54IpCT2UPHoDUFYqR3ny6ku?=
 =?us-ascii?Q?pvD2LC7yUh/e1EpCJH8c/0dS/19HHgtwjIL+DbFDyS3mypi/4pnFM66US6yo?=
 =?us-ascii?Q?mVjI6y8hWTQwpsIuB3p3MPkSXbR0MmB3DOCvUCCzu8ea8QRf6CTAHqE0HiT9?=
 =?us-ascii?Q?dVQFAc+s5jw1S+ph0cg4Ltzg5hIoDApxay5fPG/feUVKzE+w8mig5h8c8AGM?=
 =?us-ascii?Q?pASX5FTAqlUbu+Awz3TOP390lWOSnO2ZkgryQWe5dWEHRdMxYqjUQK/DdaWf?=
 =?us-ascii?Q?AORMWdzGG5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?odNSkBJ+P3G7yumGRrML3yie0uaImBuF1P/FZPWgzA8M3BdbMlTeGH2wp+g8?=
 =?us-ascii?Q?n/sA83w21OQzvIo5iUVnZe/4mjYKZ80h3Wj8wl69H6TOJXZZ6UWBkai9gh9U?=
 =?us-ascii?Q?HqNz+cY8hLqAdrQGKChVmyt5etx2h4qHgxz+5Hox0lx2gQbudYXC3YKumHkX?=
 =?us-ascii?Q?xgsgdf92S/zyeu034HrTNRxE9UTFK7RvL8kgDrXBoLOsQijxGCmu7aA6ZKvi?=
 =?us-ascii?Q?qduOH75bCrQyRnoA1fOnhvR4ZL/gdrE+E+rdHt6y4UTJX6aTzCPmpGGKGHCS?=
 =?us-ascii?Q?iZKflmuk1M9xYlXHioEE64FPQfkcsRk/XO7xRnMFmu7DYc3pinZFjFtzT56X?=
 =?us-ascii?Q?PbMSzldvAzJRRHGG6AMUnWCOyjRbYgzjQNXzQWQGsU5pjCyGIQZRZ6XQjXa4?=
 =?us-ascii?Q?DA2xcq/4vE/g2A7/HrYrqgLrPjWLRjLgkmIMaytS14fWxggFxXTu8FLWlMeA?=
 =?us-ascii?Q?CjNZePy9vypZkPa0pQngB0qutrFFuT6Ka8RwvbhO6aCLCNohfQjNYThq7LWh?=
 =?us-ascii?Q?ni6hm/RxjF70/MZTnld9c+eb5fG0zblu+aJDJzM3ywxiShVmtR8ub1w600Or?=
 =?us-ascii?Q?2q5mE+JgTwfg+8vn4S3qxIXG5qxWAgSrT5+ude6saD4CZX2D2Lzg4Gqz0TSy?=
 =?us-ascii?Q?uXP/3aoGiZy6CYXPbSf1VT3YpR69T5qf72N1wNL/0X5In0oOlvbvGTF/QU6P?=
 =?us-ascii?Q?IyUW0Hz5oPT+o8XstvYtrOEjSCbn03Jh0aoSwqOzmMbFHdyv6OW0vTynht3N?=
 =?us-ascii?Q?RD546u2OCKguK/T3CyPBJsluf+YsBBLtusxOKjjGMpwngDmzNXlAeG2KIcIS?=
 =?us-ascii?Q?9hHLFBG5/ShhMjLB6A1VK/hBTKf1STAfbJ7isEBsIh1UogkI9t4P2d9nGquQ?=
 =?us-ascii?Q?ubwfYnvfNVI7zdpkHB5YSR22nn+ZIN4+oW9udVeHRGD8yFXp41iBjn2oybPZ?=
 =?us-ascii?Q?1J+c/MwNcUr5qV9T1+OzJzcvbUQaEUBtF2fmD9C/fRTj5LQCiPretu7bXZlT?=
 =?us-ascii?Q?OvjR9uJHKullb5MOYPwuKPqG7aeOi6Qem2JtYExN0ROMOkvtPoIBP8gj04jY?=
 =?us-ascii?Q?oum1O+ZV2krDWHbDbF/0k+Oykujz774oSPgs73pdsfmzGZzyqhWiguQq/H16?=
 =?us-ascii?Q?VvBZEvxfm0mnvjX8/63rmoUqOcYjF1bNf/42pnHJGzuzRCWp+VxnkkrVp4dv?=
 =?us-ascii?Q?m9xRAgi+3+dvTm8325lKSzpMfDljZbvB1O3Zv5+N/4k4kApwp2MJKL52j9I2?=
 =?us-ascii?Q?N8iC+RFAMo3eEZvvNZDJc2opZttuk1oP0Mx6/33frLzZxfFNcus0cqY3uBk/?=
 =?us-ascii?Q?5YxelxEIkWPeIL1j3C246+A0lS1OlYEOFVHw3ULvuD9pNOhv7PmeTwDbE5WP?=
 =?us-ascii?Q?TRxIcMYF3PmtkY/kXcImdU+I1aW9yU6bYcLeD53poTYNtFxrT5kO3NeXpkQn?=
 =?us-ascii?Q?kzrYlUrdFlOtC8LeQX8W7asetbCRKJ19EAn73zE6Rlejotldrh+a6GBtc3vv?=
 =?us-ascii?Q?+k2Jf0hjnzNs6MSaT9pNKEvg1w+OMBTQHuaZBOPp+BNTqIOsY1e7/aaBYN/j?=
 =?us-ascii?Q?+3cBUyPDT2kuEm1qa7Xy29ytZ3FJ8L5rKGo9Mdv9EtVdz1eIwNz6WBJWmxl6?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd74870-8e0a-4b60-4107-08ddc2ec15ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:35:39.3086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYxgpX2NydxChC5fEmGF6G0sSGlP7uwbSGFhxFYHXViY95rMHd1YeDE/kgXC7VVz0QsVIiA6dz7vHHuacmmdWFk4P7LDrbI3dNFeUvKCiBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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

On Fri, Jul 11, 2025 at 06:09:24AM +0000, Xin Wang wrote:
>Update the register definitions in xe_lrc_layout.h to align with the
>official hardware specification (Bspec) terminology. Specifically:
>
>- rename PVC_CTX_ACC_CTR_THOLD to CTX_ACC_CTR_THOLD
>- rename PVC_CTX_ASID to CTX_ASID

some context here... It's usual in xe (inherited from i915) to add a
prefix to registers with the platform where that register/field is first
supported.

Here's it's not very important since the first platform comes before the
first platform officially supported (xe2), so we can just ignore the
prefix and consider it is supported "since forever".

>
>Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed to drm-xe-next, thanks.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 2 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 5 +----
> 2 files changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 994af591a2e8..e4cb1a487a37 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -15,6 +15,8 @@
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>+#define CTX_ACC_CTR_THOLD		(0x2a + 1)
>+#define CTX_ASID			(0x2e + 1)
> #define CTX_PDP0_UDW			(0x30 + 1)
> #define CTX_PDP0_LDW			(0x32 + 1)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index d2ad8fe737eb..452bcfa6cc6c 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1031,9 +1031,6 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	return -ENOSPC;
> }
>
>-#define PVC_CTX_ASID		(0x2e + 1)
>-#define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>-
> static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
> 		       u32 init_flags)
>@@ -1149,7 +1146,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
> 	if (xe->info.has_asid && vm)
>-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>+		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
> 	lrc->desc = LRC_VALID;
> 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>-- 
>2.34.1
>
