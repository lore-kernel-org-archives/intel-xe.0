Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE8C531E9
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8DE10E764;
	Thu, 19 Feb 2026 23:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXimZZhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363D10E322
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771544832; x=1803080832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0erZtUR8JRxVWPFAAXj5v6NZX7+htJkIVtZlRsORxA8=;
 b=aXimZZheq/6Z3k7bDSFdCYmRcZuSD0VCVltgl4ObditnazNplr5VQMfV
 4pvilkZq0GtUHF5cYlkjHzUaETMasvAykjSKU3ib6fhp6ZGaRe3uptlM+
 HJtPdH/46gupv5/JofAl9+KB4oSamKcGQgcnaWspIuziWVsOuiHP+T+ww
 XNGRhSc1INO0eARN0q/DZO44f+Bf5B9BhxqsyA5kcdyo3VxtA7fI0rgKs
 40kU4rJIh5+QEQ1ICoq1V/zcfDTl6l125MFBvlkQBTkTa7CJaGp5u9ElX
 9ET8zlfYJiRMCWx89zSnrCemxGH6OWqoZjG8mpDinH6Lf14iNq7Vy31yL Q==;
X-CSE-ConnectionGUID: xbuJuM6HQRKTzLW4vipDWQ==
X-CSE-MsgGUID: 4WPTd/VSQTCj5dW3smnf5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72628032"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72628032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:47:11 -0800
X-CSE-ConnectionGUID: cyPexoq7R6+WzPf0PtkkRQ==
X-CSE-MsgGUID: QhTWgpu3SXibno0pJqxkeQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:47:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:47:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:47:10 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4vkF/LK3Dhoxg1L9XWr+lBNtbna+Q0FT68/tYtZLDALD4El1P9u9bZ+qeFxMd+GV1W8/Sqv65Hr01O6DAmvxSiluD3CbOjZiUA4TCk8aq2cynHzHraLhUWwVurXuNlZ5uhE8geTULfTLG8pQFuTwHqlgUZyrU9yWcgB0W539utNLdSJ+fMJlv5sFlhbyrkvFw0/3xu7BPz0gKfqim2bSychXEJEmN4kJf+OjjEy0nIigGfO0X4rqZFs5jqgV35hrbaNJIfXVMLDk+QdpE5l1eetEvEG7s3oK9d0kNDn0JqBfxWFbVLgpCMv/lI5PUz0XFPKqK+TnAzGmg3kR+gWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8NWMDorZlw9saOoxqMVVLielCspG+Y3kvm2adf/Ql0=;
 b=yeL3qKEJQ5lz0DbQGPb/LZCjmy3HFB0AF0iXW6iXVLC2hplp1Pv4M3BcImpajym3S8ggF86IYjc5A0G2vrLRT20fn/LFiHv+sffEGignLTAa9M3CBhpTsNQbMOJIg1WUItSpGSR4jKE3QJYfMDtNqu3cRgnFeKAdF85BRYN0R4QonEnV5AIhMBprDa8nzV1s9HPQeI2zZC7KNvzJNKBAN7T0KA+KKVttmhEi91uemqsRY8YqF7+tKEHbvGanxG8MdqelO5yTwSXkp/yKcTjVQQHPj33xsEeP42ZU9eNJOk+9fheDWNvxWS4zhpLI3uRnwU2TDP6MkV86owZq5dH4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB9521.namprd11.prod.outlook.com (2603:10b6:510:3b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 23:47:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 23:47:07 +0000
Date: Thu, 19 Feb 2026 15:47:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add Wa_14026781792
Message-ID: <20260219234705.GH52346@mdroper-desk1.amr.corp.intel.com>
References: <20260219082931.2199618-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219082931.2199618-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b62bc3-cff6-4a01-3c3b-08de7011313d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1MMf9KM05zpV9vfzg7JM7jJBhsE54xYxmxLocN1JC/kVs79GcRdj1mMUzoMs?=
 =?us-ascii?Q?qoddECmpjsYgvOAR6LFwtv5ELuoLi3Wx48fg+FkFxd9qOitwZnyLeYTGXul7?=
 =?us-ascii?Q?Fnai4M4E45WwuUX3HrDte0hIVrmmiS3fyC8I28PJErjRCYBdPyklvFCafgOJ?=
 =?us-ascii?Q?tMJkCB9Z6R2ST2NtwNP7VQp3mZN58b/XUmK/ru1Q6SBe6bqoNEOfoyxytD+X?=
 =?us-ascii?Q?r+GmFAkZaW2lyTk4whzDvWBHcNph5hDwRtOcHjbdVsQC5mVmfyG3Uql273uA?=
 =?us-ascii?Q?Gwbsq4oqgvv5qtGWRb3CC7ANvs2ElqgQ9/HUsTb34fsYNkai6W7a/FnqHeoh?=
 =?us-ascii?Q?IgNv/Z3h/RdLnvIIxKIKVaF+VYeTehKZdoRSQBcAhjqjvK9Zr1PuMWX6Aht5?=
 =?us-ascii?Q?/OyLBnIwkj7Kqgz1+kYiMtH2pzOUdOvY5h8kjByGlxbo88OA2MVTFf5s/rSI?=
 =?us-ascii?Q?JdlrzRsmX/yYK5TiUrIVQOtkLGf+u5plQqYBGFRH1MsIcH9cRrpCRSrcQQCL?=
 =?us-ascii?Q?/LYgseQ8F6gMIDTe499UyaiK5MRrTEN0JAjuRbE8FaWVTaCnErpvpVOXynJ/?=
 =?us-ascii?Q?e5fCzx4nCofDkjWTW68EPiiSNX+/OfAQMOTBAFLLV8VSiN1nA1zojHpIgA+i?=
 =?us-ascii?Q?2lNDGQNTp6vOCVlAHQvRd7yrqJANRx7eQLAxq8Kp19TarWlHmN3bwKgGKn0O?=
 =?us-ascii?Q?bKBP6u0Vjfe7CniA1+1DPa1xmPGhem82fWf7qjPPL2UVS8sD9eWFu9bS4iWB?=
 =?us-ascii?Q?XCB1NmrhWvR3bwha0kXs/3pSdUsaRjx9A9MOUPx2GnIAE6BJkPV4ilk+q/rf?=
 =?us-ascii?Q?fo6K6N0cwDvpQoTdxh2R8UXz1fTzgXtU60gAr3Jka6Mx0cxgcKlVpb7pzIvR?=
 =?us-ascii?Q?ReDJkySoqr9ThNuF4BUWg0zkOzc/c4gLCclKY4dh0Pih+pFb3hH9kMxIbW49?=
 =?us-ascii?Q?jaz3js5due5UK996v+RA5Sk+HFVR45rjP08iLrLXNXmCcnsA3bqhnjOLScLB?=
 =?us-ascii?Q?ZmLSv4xIOJkGxy1xik9PkcJTIdkdTEnrSOyR63uCjW7vHaApw0xtY4OykQVK?=
 =?us-ascii?Q?r7IfrAbQT1ZoGgC3tLqlcc6VQhlhXgOJNDss4lGFwhXnDgGMlFKwJVFNL5ZZ?=
 =?us-ascii?Q?KhDrGL9HzCO2ewZFDYjLtjUJDumN+ckjO90dzFBMZ3VOXDgOhP6cAJQ51W7s?=
 =?us-ascii?Q?tpfl7e1T0x87xSvy8Nm6qkCFZDVMVNlva08eqGAMQOfyJKvsmMih5xdttfdH?=
 =?us-ascii?Q?vuasfPZTDSdaLVsOcWCG6k5nWz3xF+QfxdWMYW0Ao9RdnJQdQDUBtpUyhU3l?=
 =?us-ascii?Q?S+e27JmMHOFr996FBDhpzqn2n5CK5EhDHGJD7MqiTihrxT8wDXGbpraFHuWV?=
 =?us-ascii?Q?/KvRNQHqm30IIzO9XGNL8XQEL8qkcNkZoA6gcAqFRwBUoVnUVPMlsKa9m5gC?=
 =?us-ascii?Q?svPm1BH+xSMWZ5bdvMokfOIW86QlyK4aR/A0n0Igb5vR/CfxE9EVqI9KPQAv?=
 =?us-ascii?Q?JdYnzWRH59olsUDILK7Icb1W8hxWjaCH6X7Gvx82V120s7RI+wN1f77dUNM8?=
 =?us-ascii?Q?NSp8rweA6dSTPY4nfWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ul/ii3Zbmu/w5bJjW+J9mzMIdU9Ssnkw5zYQxl9ZbVleGJNmSS+h+ZfHlCb1?=
 =?us-ascii?Q?JHOk4/AOvQPbhkswrDqUM2itMXDPTvvmyaanAFLSyRAHXIaFCYEJexVd+kzJ?=
 =?us-ascii?Q?CMiDIzLLGi1ShTneJcdVnBIQ+B6Q0aI0FE078xvpW/6dfkXC8p7fViPCtwH9?=
 =?us-ascii?Q?L8fc21SU+kaBtI/xGzlC+WnxIrUhMHHTZ7SQVePrzI5xPh0da43SSOyfG9pf?=
 =?us-ascii?Q?mx3NsLSBbSoh6GWtx2LP00PuazZEO4IDmfLnqEx1j5Mqz3+AhsFwOqi7nykY?=
 =?us-ascii?Q?IbyK0KyhryAa5VNOQoWU8qAqn4yFngjkW6TiE+Fj10Dxg4VUEltJSnX/IV6x?=
 =?us-ascii?Q?HZs6prU1KtFJhGaodUJBqEeKwqjUfqCeN5/eafpIbaF5vCYdmMs0wSBcHILm?=
 =?us-ascii?Q?V5pP23DjuIYerGN4CLrgdO57R0/XHU1UDHq3pl6aUj7A06JGqn9l5aCQPCcx?=
 =?us-ascii?Q?Yv5Xd6udKExYNRVktqr647v6NdHPRnwN37tarMSbmDWcIZEpVtrxz9cNAgAR?=
 =?us-ascii?Q?/qiUXrgQqS4cYWmOeyejDOBFpPL9kOlOS6CnHuc68EK6gBUNR+BV204q5dX1?=
 =?us-ascii?Q?VFfVDoygYvrzVTGTvOjkl4vJWWnbQ45j0tvrGLcfkh7QkdVf2oeMx5KHol2Q?=
 =?us-ascii?Q?NPRC84rzKdR39lcPUIhvHFrz8WEYynVo9UGX2aYQmKJsK5P5BGI3lDvhUYNP?=
 =?us-ascii?Q?XwFBSubNFgbnGxSZLmhsvR847NWt60L3bSVzLngV8feLqc8CSjszdhSl+Pln?=
 =?us-ascii?Q?Z1NhGDXtT8fqsR05Du0lN7G3w0ZbUwCu49Ac3yupkjEVQPkwuUNWaCtDdp0r?=
 =?us-ascii?Q?qkgxXCjbY6nOII/fVALj2nHlQe0wxJcTwbf2kr52O1ce9+ugXNdbdv6YBZp8?=
 =?us-ascii?Q?PSxtaE8D5w6CRsTLuNiYsTNa1i6SkF5ULaUpyL8MXBqhyRw9CyLLN8jQ1A2X?=
 =?us-ascii?Q?WWXR4SVPao94K7eYwE6suwR9nQTDIFwp/qp3evIICqfcE0wnfRj+OgSehrjN?=
 =?us-ascii?Q?Itzd5oGUl4eq//3EE6j/E/DZeo177bz2GjLf4d9hgIvxHyg6vId+TifoaEf4?=
 =?us-ascii?Q?90DWTxKZ/6ZBBk8FX1/kfo2A+5SS7V0CdVeXrmjpC4IroSRBITJ0ns3HR0xs?=
 =?us-ascii?Q?PosVqdQ8MTvOWZFsebBa4B+ASXzbHDs8jDuzfCmmlq7BMEWL4YDLMhCqIcCt?=
 =?us-ascii?Q?6CMQ+zdUgofp+ETQhWGWO3X4pS8QP9a+8jqpnNTYKySFi0edkh8aGjJrLBe8?=
 =?us-ascii?Q?g31dEhDxTV6YiaS+E0P8vDux/KoHjIFwlQDAB5sOEiJXeplnLfHE2ZxttXDY?=
 =?us-ascii?Q?mEK7xSDlSNPapB9E9u6idVr2N4HeEPhGu2XJRI6zTTvLe8LlEaLKfGE0Xej2?=
 =?us-ascii?Q?6UgUmYyv8IWM76cWBS1hq0dDV+b9fU3QiMnZ3rR8AlYi6+4bYKi3o9tBAuc+?=
 =?us-ascii?Q?wnsZX6kOhET2fIKUjs3AcZKuLyVDdtZ8oTRIS35n1tC+NpEYCu4pjCqnOfTT?=
 =?us-ascii?Q?N+eL59RuNvO7fdQbQpmuMazVpx/VucjeGkTja4YrnrUrO/S3tym8Tl5sir/h?=
 =?us-ascii?Q?+6oA1q4xKCzevL6yeHRIGpz5oJmJj/D0ssGg7WfzN6jtVHDRLcExgCa9/d7D?=
 =?us-ascii?Q?0VDIEHI2Q16sBNHiHZ1OLM206X4GpVLjU1s68mjmZS9gBixtZTEgu6tFdQph?=
 =?us-ascii?Q?NvXhiH/b0HDTo4WNhTt0cj3h5bheOpqZojrhWBcpmCndckCZR50Q1kDcMPJF?=
 =?us-ascii?Q?acEq89FZ7bksJV9YD6vM94UMcCj73oc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b62bc3-cff6-4a01-3c3b-08de7011313d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:47:07.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmqeEVF9L1kJ0F4/+wKgoiXQS8lBp281z1nSAsF+fUbycFIOj7Df2Y6NTOlosM7Tki1dhhXuyxCUgZrMAO6rjmAXT7swY3xEgoL5kvKIcQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9521
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

On Thu, Feb 19, 2026 at 01:59:32PM +0530, Nitin Gote wrote:
> Wa_14026781792 applies Xe3p_LPG graphics version 35.10.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: WA officially approved for 35.10 in WA database,
>     So, only apply for 35.10 even though the text 
>     description of WA indicates that this WA applicable
>     to multiple platforms (Matt)
> 
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index a375ffd666ba..90b9017770ea 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -131,6 +131,7 @@
>  #define   VS_HIT_MAX_VALUE_MASK			REG_GENMASK(25, 20)
>  #define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
>  #define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
> +#define   DIS_TE_PATCH_CTRL			REG_BIT(4)
>  
>  #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
>  #define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 61c4187dc0ae..0f52c30728a8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -939,6 +939,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
> +	{ XE_RTP_NAME("14026781792"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
