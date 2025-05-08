Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BE6C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 15:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC710E1BE;
	Thu,  8 May 2025 15:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KacGBVWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0794710E1BE
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746719305; x=1778255305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pCUGE3WMDfJRRNRBFiYOLp0QbzhutD/YXTbA7Z+O29k=;
 b=KacGBVWtDiw24StI6vGe6ctkvapgswx1hozavBeq6egEAHYZxiYRB+VB
 U9lssCIgHz1giqsUk8RRRFzPKEEL9ggA+JRatNjwHvO3LMBa9Uzvs/vjD
 Uqiev0twKJjALGNOn68fvZG6JPSF4fCx6SUhmE7M6UWrdNpKOLZzPb8yq
 7xSXr/aUcO1e/PKmVxq6hGkP7dWb7whXQrAPcDarZYVwEVWLbb0+jIJmW
 FFxJFZeUMEvE9yFRAjzwRHbNC1UBe3muvPsHI0IbRuALYUkbYJqsHjT1i
 H+WuEJTmA8vskZj1xzh9zV4S6/Tux46+PSQw6683mV2k3zh9ktZD5RhxZ A==;
X-CSE-ConnectionGUID: GfHcsNhrQwap6IuaF1KtMQ==
X-CSE-MsgGUID: 9KTrc4pERyqfaxtxofsMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47619292"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="47619292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 08:48:24 -0700
X-CSE-ConnectionGUID: LfSRLbh1SFKf47gF+Z/HZg==
X-CSE-MsgGUID: k9fXu5HiQQufv6zSMWd7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136347224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 08:48:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 08:48:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 08:48:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 08:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saZm3B9hk2/tvp4ygzvDYzP/xxB/VU8B3lzzIOUlHbxrZMYuC1mYfnHOS20nBfZ/jFKf/pL+/EOuj8w1bcVe5oWjwbI9nl5pWMNZTXD4sosuvfiRuh4j2fbKGGNM5wcgXIuwh+zqWMN7H/Z9ZgMHcQWYDR24HBddU4a+4wRZp2RdBgJOn+U5hpTSUKhsNzGOikRAgO7jrkOyjXyS5NCq2Y0NIa/WYn81WIXZk9sDRvCCtWdtx8FoFVztrq94rVRkQi+7LqyrPkeR52mYiIGJgIINCT4FrrmuoUeo3BfEB6MCnCpFoi9sV79WrAxLAN4eG97iyrw8EuGuTRxon6Y3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVuVLu4FPONbAfCJQHvOvSj+gsuIeIJuJvKVfDs1iX8=;
 b=DWH5hiyFaEDt75TrijOhPpvpo+Z4XwPzzwfcI70+rvtfpdlXaE/RzhM4Qgh0hrNy6KbaZiCidarSDcjrS9xNE+UOpU7UobAmsWUYnfRZNWAmw0vLK3aJvoCpg+vAbjIs/oc4moToBdWfeVT3FwDb2FDy4eQUlYlEI0eMmY27VnPftBBOYHxCZ4sdjwk2VslSQUQFSkqP54xECLIQ7QuzBm80dxPxqvITIzQavo4u66rVpHySy9cmrQ//FTAhZ5R96QcrhIHvyaA2aJKyMrEVf34ULtyE5t+Wuhk2//LvC2HZfLy43F8U/+eXdqVZIC1ptXdLBddMiJrEvuT2Cb2YJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 15:48:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Thu, 8 May 2025
 15:48:02 +0000
Date: Thu, 8 May 2025 10:47:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Message-ID: <lcn5wm254jscwodpvpwzkmqioe7jyke5yn7hcm6vjfpnyn23hj@42zcznbfhsui>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
 <dfd48f5d-3238-469f-837e-8df09176a81a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfd48f5d-3238-469f-837e-8df09176a81a@intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 01690ead-f771-4725-5203-08dd8e47b71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YmwIK4SL/UTPlZEwwY30QXChk3waiuTUDw9ZBLNW7HdukvbRaDPsgY7gzS?=
 =?iso-8859-1?Q?TIl4Z/z57Gw/ZZYl/zFk+Rbi9zCkVlPztSOvUVrrttsOpPNHfa+qdvbsmS?=
 =?iso-8859-1?Q?f6buzLlTPjqIF/5zM3uY644QH3DZX23lkBpNgWQ6rijnj/AxfbGgD9D439?=
 =?iso-8859-1?Q?g6QOWcJfoq34RBI+lxkB8HsOX1klgiNSHFfDBLXMhfUPPDWlg6Gy5nTwZB?=
 =?iso-8859-1?Q?MJ6jMbJAoRd3k43xyI/pItvGT78QLxIqqd3tiPH+pws6vz3mFuUfztuTbU?=
 =?iso-8859-1?Q?VKJd7pMzNpRy6WXonn/enMJ0TzW7Z5SWmAeqMBHgUZn/G6tkoHWq0SxpQG?=
 =?iso-8859-1?Q?962c2rwk5DY2KDQcEMZ+Iacqum98MNvb1IScjFxkTIzHg+wgwGF+gyJKnC?=
 =?iso-8859-1?Q?k87wAouUpJr3TTMu6Yfr7VcQWClDf+BvlipzzeaoQaRBPaymcx1Wnn1I+d?=
 =?iso-8859-1?Q?HCT2rvSYVvxeiIBxpH0UmZrwo6gkZtJEf1HNG0FyZjUNZZo0IXZmgYdNGE?=
 =?iso-8859-1?Q?cRwSOBcpo7ps0Q+IVYjubBRXqlFDEtDPiocE/yPE86Eg+m/iYsXwdA8jUk?=
 =?iso-8859-1?Q?PMFlCdNVq+JRH3c9FZjio4Ap3mwsUykWhNCYhqSKxfU41Y+GyMt2xcMBiv?=
 =?iso-8859-1?Q?+VmvT9dnnSPb2jmW2G4xVBZevjSNSgysWfSLbZ3V0aMH0/8QWX2AhxHUXy?=
 =?iso-8859-1?Q?DZWGLwMFo6v+or/HNcnUAX7S/2/JU0/2vMnMic+CyV7OGSfMF5B3iFfwnf?=
 =?iso-8859-1?Q?VI69m9LSYicFq+bKbk6k6V9yauLlBIoa/8ih5lzenfmNie6Ai6Dweaj7L2?=
 =?iso-8859-1?Q?Wu6bxhQ6cS4so1YLJy0t5TAOdID8OcEopIboi6qW33pNcDc+BAwUUGR0dD?=
 =?iso-8859-1?Q?4jSir6OUkPGNVwwo31DNSrSBHHretvpQ1DabC++BnWu0hPi+iS5cVT95Sm?=
 =?iso-8859-1?Q?1aCthka5CA0OhDMr6AhvJOf2Bbxs4Xl3pLdc/3XWa/wr0B0nmTQZuLfa9i?=
 =?iso-8859-1?Q?bOPBfcnGlKNvHx+BG4QfwtvUYQeNjer0sLZU8oeoIbtm2aybLtiqR/1Hlz?=
 =?iso-8859-1?Q?IvVzoMnpmcOOFyZbDJ+FNjR1uzwit5ed8O6BjGJRnJDaa5VwXenTqNFc4v?=
 =?iso-8859-1?Q?1pibAsCrUZqAJ3UIV4nu0w5g7LhLDRgGpus0c6Ub61eauucYeIPTHexwM+?=
 =?iso-8859-1?Q?9SBuimlVFjFBffCjPjS3sigRCxOq0eVuqiOGEyqCz8hXajRYTKc2K4/yRx?=
 =?iso-8859-1?Q?rz+vSfb7zUVg5882dJUgrGrOFtiFnil1WKwCHBtFHpaRWF/9WGn2jEadHW?=
 =?iso-8859-1?Q?iWXhHmk1ofcQzqc8k3yOSqo9Xu8feOYGjTU6gCwJW/gF4V/INYsFMeXkGp?=
 =?iso-8859-1?Q?Go2XOUiYlEh7QJ28P7oWh2eWTUsclPrD/vTNoiV/bUusqw2+0TFalMuPPa?=
 =?iso-8859-1?Q?Kr7j7YtyQ+QG6BVYf5hhH5FIGxNjVjjiw2dMme0JLwhxRqjii1T/8U8Kl2?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MfIccF8mr7LfnErGqGinrbfwX/uqK/KmOt/iMYce4WIKcl4DU39Eper+KC?=
 =?iso-8859-1?Q?4LGBv2UDyjDiL/6KEirxCuz1IwklU4fRGV+QaQ6mqGHFYM+hewRZEwnJJX?=
 =?iso-8859-1?Q?Vhc7JEuCVujb3lpLj77COYwS1bMgmbfAoD+4SueNs4sM8d05dBYsWSBpVl?=
 =?iso-8859-1?Q?fM91c56f1kFxUFmFlhb75AzDeM9X2lXEBW0a8k+B9sOEpcPRI04X/2RwL0?=
 =?iso-8859-1?Q?su0E33YyHnjcCfAd+jXKQg+/dKDNXMUQb4Q8q+hosbapMt+L/yUqi3se2r?=
 =?iso-8859-1?Q?ZFyOkhnONA1rgVFEdABcprGNFqFPcHepULDztIK0hODC91+9mr+r0bGQ12?=
 =?iso-8859-1?Q?RcWjB848SqX4FvCAEFLIKH2FSf4x51g418CMkau0n3pPu4lVUw02NiMrpB?=
 =?iso-8859-1?Q?Cxf55XhGXmE/Y/6hNKQ/fAEvD+zrxzddCuEWQ30M1m1QXm/hwTOwY/au9U?=
 =?iso-8859-1?Q?d11RW6FXAto6QfXIJ4UxElqh50y+I/+CJtQXNl0E1TyiKPmVYye7LwNcSL?=
 =?iso-8859-1?Q?GrhBxejBcc8xSrQggJoIRh1637kV9EjZRcSLfYHkNm4JYrBZ4j+RKXuUcI?=
 =?iso-8859-1?Q?vE0yiCy/9+jrjFUVmzcgY4aqRVGTCRFk7geiQADwzAfQnnNh9MUWuSu34Y?=
 =?iso-8859-1?Q?BkcN+YY7mVnjGKxNCQ9bg3lFvX38VY+Yug9MasgMEzr4WAY5Hazk970Tsm?=
 =?iso-8859-1?Q?T6iiHgpJcFYODc9mv7kM2a0kspSf0hua5FBKghFa7mwrGMsuMZDcMy33dH?=
 =?iso-8859-1?Q?A9OtwX8sYu9+dIKpLWOtgM2hkkqrwYY98uUkr0sNU5OoqItIw7/tn13z0G?=
 =?iso-8859-1?Q?+s5UAvhxRFvfdnTaoZp15/e8Fc2HoDBXCQxZ56xNCG+/qlWlVH97QlQnFW?=
 =?iso-8859-1?Q?m3zTNYhlt3gJxNQQkjrHOY2hxyvNHNafZx69IFP2yT5A3wLMPFZ6bpCOF5?=
 =?iso-8859-1?Q?bx6qcYGLzkKk52mEOtt5LiTKdjeW+FgaIiRBzUJmoWfeGKGBd0xdTD5qZh?=
 =?iso-8859-1?Q?N/5hn9wm9sl5LzSHXt0InFsERZvdlmoLOWaH+DL2N3HaDm97O5xzh7ORNp?=
 =?iso-8859-1?Q?OKU+YvJpyBXzyBQA7Mk3RHeMXRwXOIxpIiWERndRyYfl5sR5pKDe8AqLTF?=
 =?iso-8859-1?Q?Rtfw4s39VY/A0xCbW0DhLt32Yeu4Png5K3JCJmDN407C4eQFkg6VDjOQpu?=
 =?iso-8859-1?Q?eZtH+WeQ+Xa0RFOHXBrJZgaA/pISWOgtU1mDPgeefxDHfpp5a8KCDjOrTr?=
 =?iso-8859-1?Q?zIqx8wuzuVSheauXxG2t22qHhgMloErQ5NmtrIMjHhLKEJ93JxQEIM3F3G?=
 =?iso-8859-1?Q?z807UPUe9nSVSMo0s7n+wbUxxeyjvqtOukgahscjS+L9u+ejy+NgsBl8pE?=
 =?iso-8859-1?Q?MtPlhG2R4ZFqADt5LzxI4+7ini8IVYyTFF5rPOVrQmoPMM/hCEgKI0/gR/?=
 =?iso-8859-1?Q?sEeRlU6Y74UG/v6K8mDzfyhsRdSiV62ejeC0miHJdB2BDTf2bn3JsfOBGb?=
 =?iso-8859-1?Q?DzMqqf/gcNQVGS2tymRDzeK4ngGAcTXnK+TjIe01sXf21USB5fbv7sTnUM?=
 =?iso-8859-1?Q?p2kG4f61BcQxcPAzfX79s1OovU5uUgdD9su42f5f2KFLjQWawruoC05rHu?=
 =?iso-8859-1?Q?zAJ0QvtHUWy3KP0K0AVHvDlHiF+r508hmA8kVfIlihTK1xH1cOagbnwA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01690ead-f771-4725-5203-08dd8e47b71d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:48:02.4665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llaDltuGUCH+nmFksCGKcY9q+AP6f+BNK5VRIGUeqHZMmbS1voX2HRO8D10grAHktofun1eucriRWmaw1BTCsFmSMvC8qdBSr2gflQ+pb4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
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

On Thu, May 08, 2025 at 11:28:29AM +0530, Poosa, Karthik wrote:
>
>On 22-04-2025 21:30, Lucas De Marchi wrote:
>>On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
>>>Add wait for LMEM ready during system and runtime resume.
>>>This wait is there in probe and is missing during resume.
>>>
>>>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_device.c | 2 +-
>>>drivers/gpu/drm/xe/xe_device.h | 1 +
>>>drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
>>>3 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>>b/drivers/gpu/drm/xe/xe_device.c
>>>index 75e753e0a682..4c0d9eb51d1f 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>>    return !!val;
>>>}
>>>
>>>-static int wait_for_lmem_ready(struct xe_device *xe)
>>>+int wait_for_lmem_ready(struct xe_device *xe)
>>>{
>>>    unsigned long timeout, start;
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.h 
>>>b/drivers/gpu/drm/xe/xe_device.h
>>>index 0bc3bc8e6803..60bc92f9ab22 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.h
>>>+++ b/drivers/gpu/drm/xe/xe_device.h
>>>@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
>>>int xe_device_probe(struct xe_device *xe);
>>>void xe_device_remove(struct xe_device *xe);
>>>void xe_device_shutdown(struct xe_device *xe);
>>>+int wait_for_lmem_ready(struct xe_device *xe);
>>
>>if you are exporting the function, please follow the naming:
>>xe_device_*.
>>
>>However, I'm not sure this is really needed, particularly on pm runtime
>>resume. At the very least it needs better explanation in the commit
>>message. Do we have any known failures this is supposedly to fix?
>>
>>Lucas De Marchi
>>
>While there are no current issues without this check, it's a prudent 
>measure to prevent any future problems.

no, not without proper justification. I see no reason to wait for it in
pm runtime resume. We shouldn't sprinkle sleeps in the driver to be
prudent.

Lucas De Marchi

>>>
>>>void xe_device_wmb(struct xe_device *xe);
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>index 4e112fbacada..2e59670660c1 100644
>>>--- a/drivers/gpu/drm/xe/xe_pm.c
>>>+++ b/drivers/gpu/drm/xe/xe_pm.c
>>>@@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>>>    if (err)
>>>        return err;
>>>
>>>+    err = wait_for_lmem_ready(xe);
>>>+    if (err)
>>>+        goto err;
>>>+
>>>    xe_display_pm_resume_early(xe);
>>>
>>>    /*
>>>@@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>        if (err)
>>>            goto out;
>>>
>>>+        err = wait_for_lmem_ready(xe);
>>>+        if (err)
>>>+            goto out;
>>>+
>>>        xe_display_pm_resume_early(xe);
>>>
>>>        /*
>>>-- 
>>>2.25.1
>>>
