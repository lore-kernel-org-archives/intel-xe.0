Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC1C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 06:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6B210F7FD;
	Thu, 25 Jan 2024 06:20:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7CE10F802
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 06:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706163648; x=1737699648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XzuZxIg9FtLDNGrM66cABEpzvPpnNr7eKTZ6ncCbcuo=;
 b=MGLgTgZzTgiGnSVOngnaGnCxH/OhA0ZdEaHEoMcdp0Adc2f9Z4qcQ+5c
 z2Lz62V/ivplkW0bwZNns2F3P9EKZPDxLnzml4KIyaOhD//Ioj8oxRXHt
 aDmKudb1gTKABrIb/glZvgIGbiheZJiZKQIrMYb1Qgkjhf9uJtq58UWhU
 SM7UC8H7WXT2RzW842K7Pz7x9EtgEkdf8Ibl6zh3pbrm5CsjBnOxfxchH
 Udy2Z4Kg+vuVZkdqW3MLybKfb2jOoBLf5vQcOUTEg6m4xj8wqc/E5uYnU
 x6cSKM/IiHwRGdnyvM6xF/9+XT+RVLEBR91qSbJzPk2R/HYsmHopa2WW9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399231940"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399231940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959758586"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959758586"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 22:20:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 22:20:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 22:20:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 22:20:45 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 22:20:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtlVniZJGXB2UAQu4I7UIp3aBKEIv5afGX7HtRmYueKOx0Q+n//9Yh6zI2riMi2z9PjBvPIM75HO69xMJ9D6ocA0dRpKjeMk8fzS7nUdTxGAEJ7J3khyYOV6INpAvZy6jeh9uVXMbefWFfmpAas3kQrqbI2Z3Ngeo6JPwnjLGdN6jEcm+6OBQptfsx9s8f23AJ0gPAW+LVNTjoPSwNIaOcLsKOZEkuxoYE+apNqS3o45G5X7sUuTl+3MdWarO2yaCJ8pee3FcNi1vdnSvhubL/5ZDMOLjithx80CJCEvOyXJfKo7xVzJF6XpSGhyx3tpcOit8G1vyYhm5JVF0yh78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sj8GcIKmWZiuNZ0b+z3vRJJBb1C6vPZgfrp1ACDM7Kk=;
 b=TjG7sn5dCk3o+HYg7gACW1rOVCcdXXyPJ3HJfHQSeqpD8xPtgJuwM0igLHZX4VtHYFGZShYjDLIv4zw9GDeaK+VZpBqNgZEd1P3H7oELqGxFQWa7O+3Uyx9Y20CugQUStoYH1E28xHRHa8tjdT7EvxZQdxtkolDV+1CVTsBQPqRA5xhN9m6WSvV2fofyhccFI32tmlRTNx6kxoWd4PLVZg/clW0ImL+dNPtcm2SOnrszMhLM5gbdXafcVit6VjASnllSd6jIFZetTkC8QBLhfkjPTzvbvAosAuhezIKomndA9xA7evxsZQCnfjKEd0rwtFOkfWQLIfBpAwbJGqMnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:20:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 06:20:34 +0000
Date: Thu, 25 Jan 2024 00:20:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Message-ID: <xuxpun4rysnn5ylcexelbzaskbtjpzh2jgkeu7jwac3kojwgho@nva5qk6c5tij>
References: <20240124233712.1640409-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124233712.1640409-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR21CA0025.namprd21.prod.outlook.com
 (2603:10b6:a03:114::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca4cb8d-fa6c-4429-8f68-08dc1d6dbd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFL7YJXvK8EweQ4JIcQMGBoYmsSzOonhD38pQo4eWynU5mmF2pT7wKATnF8Y8gcpbSPenfdXJrMluF0iVtWfBpZanXwCWzgGfwwlyKfDhH/7juDHZeN/RxJbXiKUg9WzwIZeZae/rOH2FYNVK9r6jmK72+rMX6c2y/J29KG87XFIhtyinqRLjjzpmCkX9V6GkqXPl0OFwWztSma9ZCsxqO5AjxLUxSCYHZHjNpJP8ZT9K7MGeN37/f/7RVltwBuWByp+iaFx2QoUl7F+Ma0im43dZtvaGaum084OOExCvpBfyzJauQuWIJghlPWDGvbEQw64Mb9PmeVg2Qb71ikHHsxI7LOZczMVZPx6Ie3fX2LXFMXEdSAsSj5WAja257qmyrKZNfiSNCqqELtSIAOueL0txLiTjJ2Tqkmo482F/htRVB6PZdPf3JD/mS7Jvgi7h4n3+WHZxA8D8f3nGzOxQTH/IsdMGX0bYagEVOyjFUKpM/TueXh+weAgA+nVVuONcci0fbjlweJGK740aeLtzyjaxHK4HZa1+fhX+N7Nq9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(83380400001)(478600001)(86362001)(82960400001)(38100700002)(66574015)(966005)(33716001)(9686003)(6512007)(26005)(66556008)(66476007)(2906002)(66946007)(6506007)(316002)(4326008)(6862004)(8936002)(6636002)(8676002)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pMhhlHykuHVSWO4pJNwRL8tWLKA1vI9ETffBuXY0iOBjsnbXAQr4W1Jz1Y?=
 =?iso-8859-1?Q?55g42Laa5nylWlhFd8YsrqUbj4Ivtlg88BNzrHiJTl4/glznq7iqUQvpKg?=
 =?iso-8859-1?Q?PgtjQnC12D58A7ZjkTuDy8nx17IhQZgSPvAGxEusfGqcM7cipykBQizS2/?=
 =?iso-8859-1?Q?Om72ffSU70KkYnNO9mm+os3UDdd+xnKX9NU/be4T6wbwqwJzJP4krHHhnO?=
 =?iso-8859-1?Q?37i+mpcvWtTqVzK3QOjgso/EmAcMSdvLdmamwkDGjXA5Ws1CRDpe8mjwRu?=
 =?iso-8859-1?Q?PFFe4HeOWPnH8T/7F+Q0dGghk6UWt1glXMEHF1hMwbZqkPZrjii1bhatwa?=
 =?iso-8859-1?Q?n4PxnIjfI/7eXNfIw5xdK2I0qaoXpMYeydm/7CVF5WdrKw8JTd5ubmFPsN?=
 =?iso-8859-1?Q?bHr3tIcC3KcblI6rzy3IZDZXf5wCNUEZ8CCzV8ymUHuvMaGGACtwjOKVKd?=
 =?iso-8859-1?Q?XpzK1pOLDAbiyd7Lig2OP/aQZJZUoKpAChWMyaa8EdbZ/AbdN7X5fNXwiF?=
 =?iso-8859-1?Q?hAovozEWP7gNgo0KzBWCqS9uTA0rOWr2PicMPupfyri+kK41WOPNWcTk4f?=
 =?iso-8859-1?Q?nXaEprX0DSaaAGb89CMj/q3PJC17li1qpKjVDy7N60GRPTlAAk0o+j8Mtb?=
 =?iso-8859-1?Q?CD9V+E/RfV/KS3k6t8g77xeg1U0N3lwjXnduHPjvw5UYiZU4VQHrFHTDJw?=
 =?iso-8859-1?Q?Jx9TZ1UNk/ei7sGfSgsJoEiZ++LW+2SWbyBSfEbKuK87CIB6SgjzlMc75G?=
 =?iso-8859-1?Q?JjQp4LvqcE5VNxs46b7OzvmTOV62MOZvzVJQkTW8J9ORw8V4OZpFeD/HGL?=
 =?iso-8859-1?Q?tZjLNys/MFp+Lu9NyoV9wh41K/xSjuPpx9yEdeOA925Utzgop0kRG8ClMG?=
 =?iso-8859-1?Q?+oZfp5CDdAMWO3W25d+Wy/8TnbosgOCDxmbwHTTkluQQmwyUzI6C2p2JV4?=
 =?iso-8859-1?Q?kPmavsFgJXkOkREqkBhZlpX0HME3ack/eD5tNX7B9m9xAuEngCU8VtEucE?=
 =?iso-8859-1?Q?leJDlI6id4V6+YYV46VHFXIIGDyTYveRewn6sROQiPxjvEx+mybMimTJxt?=
 =?iso-8859-1?Q?7y3L/uLPmf/v72mPZRCqNN+cXkrKYtScwUOpJmBmjL05dhwKAYZ0Jd8MTR?=
 =?iso-8859-1?Q?OyQ/zUOOMdteHzN4rYp9nKLIM2cvjuG8jkBCpoGSkpGidRRg6z6RnFr7Tc?=
 =?iso-8859-1?Q?X0j1g9HEe4kJXcu1KF/YxEn8TS8sj4KFbrF6HjvLc4enzsDff/QErz3vV5?=
 =?iso-8859-1?Q?6r7ZjDCidvxJvXLDO7MCS+kGpxQst7HDzJfRPxVH9iMl1AGVUAxuByLIup?=
 =?iso-8859-1?Q?Ppm2PaZbULmnq84kshKnc+d6NRuLhN/scpjMC23DOKnBKDVNF7ZW167qI0?=
 =?iso-8859-1?Q?zyYywixWq7RGS3TOUBWy99jQEMMPI0TIsVTYjB4EzGHUx9zGQ74MWc7czD?=
 =?iso-8859-1?Q?36ICbx+oFAlVPWSMglfFCjMgDCDv5eCCsyBbT7RbF+OGIkCHTNPehEFKdH?=
 =?iso-8859-1?Q?a3Zom4aYr8NFHBoH4XScBEJoVOZ6PEaZJITG5MboDnPNRi2XmN5jBzQOar?=
 =?iso-8859-1?Q?AFatJoWFBFCzYI+WbZeQ8oaTChoTU+mzLbIdghuSKYSxSTALXDy0Z+nkmD?=
 =?iso-8859-1?Q?Xd3J1p4ubf4NxOHea14sKcaHEhF1d9boWcr78886B12Fl8vCpJSd51zQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca4cb8d-fa6c-4429-8f68-08dc1d6dbd21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 06:20:34.3175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFB3T9AwicWnYzLixBOa5kc3UR6VcVetmxAFjbE/OWEMUHn9RmWUyRbym3ojTXgnu14rBVTd+h6hJvGF7dgHkIqL2bHCpe56uU+X76LtwSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
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
Cc: intel-xe@lists.freedesktop.org, rostedt@goodmis.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 03:37:12PM -0800, Matthew Brost wrote:
>Hide all Xe tracepoints behind DRM_XE_LOW_LEVEL_TRACEPOINTS as these can
>be considered uABI. In Xe these are subject to change so hide these
>behind Kconfig option DRM_XE_LOW_LEVEL_TRACEPOINTS. In addition to
>possible uABI considerations these are low level developer tracepoints
>only needed in debug kernel builds.
>
>v2:
>- Reword commit message (Lucas)

sorry, but still not convinced. Looking at some past discussion
makes me even more sure we shouldn't add this config:

https://lore.kernel.org/all/20181217211417.1b9628fe@vmware.local.home/t/

I'd love these tracepoints to be relevant and an actual
problem, so we are careful on updates. They aren't.
Hiding them like this will

a) prevent them to be used and
b) not solve the problem at all since setting CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS
    doesn't change if it is or is not uabi.

In i915 there was at least the worry that it was known the tracepoints
would break soon (not sure the reason presented there actually mattered
in the end as the updates in the header seem to be due to other reasons).

	git grep -l TRACE_HEADER_MULTI_READ | xargs git log --no-merges -p --

shows tracepoints changing all throughou the kernel without regard to
uabi. Are all of them wrong?

+Steven who may provide more input if anything changed since 2018
or if I'm completely wrong here.


Lucas De Marchi


>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug |  10 +
> drivers/gpu/drm/xe/Makefile      |   4 +-
> drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
> 3 files changed, 352 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 549065f57a78..a8785e71e224 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
>
> 	 Recomended for driver developers only.
> 	 If in doubt, say "N".
>+
>+config DRM_XE_LOW_LEVEL_TRACEPOINTS
>+       bool "Enable low level trace events"
>+       default n
>+       help
>+         Choose this option to enable low level trace events.
>+
>+	 Recomended for driver developers only.
>+
>+	 If in doubt, say "N".
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index abb2be8268d0..9e591571b2ff 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -130,7 +130,6 @@ xe-y += xe_bb.o \
> 	xe_sync.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
>-	xe_trace.o \
> 	xe_ttm_sys_mgr.o \
> 	xe_ttm_stolen_mgr.o \
> 	xe_ttm_vram_mgr.o \
>@@ -144,6 +143,9 @@ xe-y += xe_bb.o \
> 	xe_wa.o \
> 	xe_wopcm.o
>
>+# trace support
>+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
>+
> # graphics hardware monitoring (HWMON) support
> xe-$(CONFIG_HWMON) += xe_hwmon.o
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index e4e7262191ad..831925a3204b 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -21,6 +21,7 @@
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>
>+#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
> DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> 		    TP_ARGS(fence),
>@@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> 			     __entry->tail, __entry->_head)
>
> );
>+#else
>+#if !defined(TRACE_HEADER_MULTI_READ)
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_cpu_fault(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_move(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_create(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_submit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_register(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_close(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_kill(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_reset(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_stop(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_create(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_exec(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_run(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_free(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_timedout(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_set_error(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_ban(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_add(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_create(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_free(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_flush(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pagefault(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_acc(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_fail(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pf_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_unbind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_usm_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_evict(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_kill(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_create(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_free(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_cpu_bind(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_restart(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+#endif
>+#endif
>
> #endif
>
>-- 
>2.34.1
>
