Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD10DCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 18:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5793010E621;
	Fri, 13 Oct 2023 18:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E686810E621
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697221043; x=1728757043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4novE6BgWpyYCrLOsA/QhYkoJShBHCbFM254oUX38QE=;
 b=Ro+ammqHOwZtr4leQuZrPx8qoOXPKZdynyUN8Nj7RfRJQu3TKnEY0uBs
 RnSelHY3LjJeLYxhPQOrOnYepRaa/jZsBCA452+/13joRK2I51qoMxkap
 CXKHoSB16o39WIaySSx+KoqF3z6MLEnnc+MXrU30Rw1kSJB/nSmXCq0Ou
 yGJ0qphVqyaLZIbsAGRfv/i6RcDaBkPqZd7sVNvu5Hupw9RV5FCeGAVK4
 VuS5SyAQNJW6rDzIQZ1V1uDhuLvLSIEI9w5eUiQkS7o2vLNyMGtRajtMq
 5P7ZzCzcwmHhQ6WPy+8Ql3eSJCKvxtDs6bMQi0gPYWOpWhXyCP7JAnuI7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388087049"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="388087049"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 11:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898653135"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="898653135"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 11:15:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 11:17:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 11:17:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 11:17:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5ogw8pIToa6IZTmHhisAd/Dn3i8m7pxdCLSC2zqtZ+JTMcKtbqN+smljE1ZY1IT8jargLpzRyoXzi0SHpVnrM8MEqEC9gXxzLNkgl32GtBcMLDZzpnqwpjSk2mH8/3mwhNahIEXbhgwKgTLn3pip6KosxdIMiTHAE3WLNvTSkm1LcrOZSfINHCaqgpS2/5jThbf8JDRtI46hzMxJmLX8Waq11v8Nk2wxLSctD2weH4ibF63Vj7ev0RqjmVdGMB/fFW/EB+9FRYV2hYqoeVbIbjHXDVFUn705BcZNWj2bn7/1g3XHpW8JCzBxMy6jtZEsw+8BCJhCx+gyrBnozG6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bGyjVGobl/fH1FjxgztEIVrhsyfavEsCf2kMgkTS0w=;
 b=IbowvwCzGBiD90+y2fM3MMzc7TsGTRqVzQ80g+IXISweRB43e34lsiP8k7z1Y/6Mf7ImiPa74GTNCU5U/0cFEE8fVRux/465UUiNNqPu3/X7t/0Kc7pzwrLzjI/2QP20PHGlSJ6DYrOCwcTQMn3oh8EAEcwlM//DHam/K5zaWNzZv55v6RLhmAgggeTlq5lOUfgC2hCxWvNyZNDzyMKV6xRODOnCuw/VW7STXNA/09bJGW+vp3S2QzjrU9SE1gsOS0uh3NYzWgn+q8XsRElobp2VoorcZn3yTZMHutt8nBPnWk/uS4TUAXKGc/u9a5S9kyQT4RXtH27+Us/JK10YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ2PR11MB7713.namprd11.prod.outlook.com (2603:10b6:a03:4f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.43; Fri, 13 Oct 2023 18:17:17 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 18:17:17 +0000
Date: Fri, 13 Oct 2023 11:17:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSmJqsqgRZlIhUJZ@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-9-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919161049.2307855-9-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ2PR11MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2f8081-67bc-4978-5513-08dbcc18a1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UFKMV3bpxhcq6wYrd+MeD6RiDrNGxR5t2FPN9S7jCGjJ3C4e8BU1FJyRxPCU/9GPhUd/86jTyB0akJq7+Cgbrw8RNvxkBP9e021APpkhXcXdtvTE4fWYy9zo9EHsS8DbGjSlbsx0YXT6bD2LgjU9HdMGxO04huFaBVCTxcTI/bCC9HwvbVQKCL+2A1bSbcqqUvx1rIDtPX1I7sGaW4ErjZK4DPEW/0vUKpZatpKiEXtua/Q+Exjjz053K4QaT9t+hsuqEZzeBMWAdFmbS3xcNMnpXHWpZNBJhfu2ymb3px3MeKjNb0/mw0KA1C0gucETrFYH3ro7hXFEWanLzxxta1lLnFc0d5WYQ2n3v0ljrpA4hzmAB2Wp0y6uWPTfYB5LHPuhZuV4RXrtXqZwapehcqfmqo+XS+oiFF/Ei9pmcc9qzIoqzr1c1xkH6Cx7wAOB28mhcGRB7HPeScfZk4+7hTBLw4KduEtWibu5oxQpNJLEpj+Xt+HWwEy5VeC9PqSBAb6ave4MMeiM7gikML0KAtwHv4cifzFWAfF9X2eNmMlRTfOkLCTHHwCdtqdMirf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(66556008)(66946007)(66476007)(6636002)(4326008)(6862004)(8936002)(8676002)(41300700001)(82960400001)(5660300002)(38100700002)(33716001)(2906002)(30864003)(6512007)(9686003)(6486002)(26005)(478600001)(6666004)(86362001)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpzVjgrZ0xhNm1LekxrbzgzM213Q3FRcndIeFF3dGJvVkQ5b2NWTm9qS25D?=
 =?utf-8?B?WisrcW9peGRXcmlxdW9nY2M5aVA1S1JwM0NYWEZSamU2YURLcHBoSzhBMzlY?=
 =?utf-8?B?UFB4bWY4Y2xmSmxNT3dSdnNGTGlvdlh1QkZza1FOYnBaT3cwWFhUbXg2c0hT?=
 =?utf-8?B?N3psUThOZlFzdzdrYjBkbUFkV0ZYMEtmbklEcFl6d1M5MjJvb1V3d1dJZzVj?=
 =?utf-8?B?RWJnVEM4eFhPb2d6QlRQQzR5Vm12Q2FLR0JidDZrSDUzS3VySzd0T05NMnpH?=
 =?utf-8?B?VlRjTmtXeHRSZW9YRWZ3LzBSRkhtMTljc2krNThyNTNNS1VIZjg5UFhDOW56?=
 =?utf-8?B?RHQyaGxxMGhBQ0VqTTJ6VHlYNUROT2VtdjR3ajg3SEc1MUxNUTlnc1dPQ2Zq?=
 =?utf-8?B?WHB0MEVacUJiZGtkMUhFWHlKRHZ5VGRkdEJUU0YwVEttRW9IRENmZ0dRTTcy?=
 =?utf-8?B?OG1IZ09xbC9pWUxOWUtSNHA0aCtMbUJENHFiMGVYditlSmxETTA1RHVIdEZV?=
 =?utf-8?B?c29FOXRiNG5hTnI3WU1OVUpwdkNoZXdvQVBFWjNJMk96SzJKY3JuRWlLL09r?=
 =?utf-8?B?aml5UzhVUzRlbDV6VWVwTE5QUElaMFRFUGg4REs0YjB5dkVEL1VGc1Z5dXBP?=
 =?utf-8?B?dnZzekFJaVF6ai85Y3hOM2dGeVZiRTdPa3Q3Y0lQUGFva1pmU0FZazJIWENQ?=
 =?utf-8?B?OXBlWlFOZTVkb3BTYThVbmk5TWxjQkp2WHc0UWR0dTQ5VG5oV0pOK1k0QjNq?=
 =?utf-8?B?TUl6QzBDaEZNTVdHSFV2RmJKY2ZwUGlWbkNVdWdDTFlQSGRyQjZaYmx5Nndv?=
 =?utf-8?B?dnppMVZSVVBsTUhlQXpIaVArUlZyckxsK0dGdHRXczZSOWZEYStHWjI4aGUv?=
 =?utf-8?B?SjdocnVDNHNZMHRWWU5lRm1BQ0ExY3JycVhlOHQ4VmtUdEJJM3JDQnNGb0Zp?=
 =?utf-8?B?dlJTUnZNWThyaWlWNkgzWjc0YkVhVTJWNVBPMVV2b3piVUs2Q1ZqVWRya2JL?=
 =?utf-8?B?SnRUQU5oamVmdm5iZ2MxZWczQVFJNEROclFKcEp0dkVSLzdWTkY5MHBZQlRC?=
 =?utf-8?B?M1B2NkRpcDhWZmhCT20xRmJsSXZ3VnNST0ZJS1RFSWMyMVEzVmhGWnpHOEVw?=
 =?utf-8?B?LzZEV1B2cEhqNGtxK3NQTEU0bnUvektTcmIvbFpNcjNEVnQwK3hleXVsdFgz?=
 =?utf-8?B?NUgyWHV3SU9HZ2k1M0tQeVFic0hGR254MkU1VzFZQ1dGVkFheEhSVmF1NGQ1?=
 =?utf-8?B?Tk5OemRxVlZ1cXN4bjVWQWFDb0lKU1c2Wk44dXBtUTVEODVYa3JXNllzODV1?=
 =?utf-8?B?RkhveEhEVmQ2d0pobmtjN0tJcWlXRCtOdEVkOHZwQWMwbnJtb1FqY2k2eEVn?=
 =?utf-8?B?NHBZdEFibFl2citKZlc1clhGZmN6NHBlWkNSOHNhR3hiSlZ0S3dIaWduMmpD?=
 =?utf-8?B?U3NXL0VxeTZQYTZaNndWcVVrRzkzcmZyeE42bnZFUEZwQTlhOUhQcGx6WVFo?=
 =?utf-8?B?ZmlxdEhjdDRXaE1wK0pvd2tscXZvVEJxc0Y5TG52d3kzOXZrdFVra1BuMTls?=
 =?utf-8?B?RHVHelNtVzJRZFhBckJ2a3dIV0Y3Q2cwR1A5OE5ON3N1VWI1VUpBcEJzVkZ1?=
 =?utf-8?B?aTdib3hMU1RSUmhpMEJYZS9VblVTRDFEajBDWjFUZ2NXcTliQ2l0dWwwUjN2?=
 =?utf-8?B?NHFvZFVJcGJEbW9mZ3dsdFBTd1NDZmpScU9CVnhnYTFQM1R4UzhmcExDZmVD?=
 =?utf-8?B?Nmt3cTJ3YzdlTHNVTnpzQ2puRWRMNzRLQkVoc1dHYnZTNVBHa2tRVU1JZVZD?=
 =?utf-8?B?RzR3eEFicWZaZXY2dEJKbWFuczJXbnlseWZGZ3duS291aldHR3pQcjNOZHds?=
 =?utf-8?B?NGk4Y25ZSURBTEJpcGJLL2xpbmVSZXY4RktRR1lKQVYvNWtiVVhrTlNhNWVo?=
 =?utf-8?B?L2ljMFNzT2gvbmNxRVhIVHNpcW5teksrTTg4c0lLSmhwYnJTek5nSzd4Umpz?=
 =?utf-8?B?b24yQUN2b3hBSmVCanhpL1plUlpQVENqR2hrK2gvZHhuS2pyZ3dxRVovVzBO?=
 =?utf-8?B?a2FZNzNPR3A5bFIwY2oza3VHRlJ4TkRmS1ZZeGFUL1A2bnpRVHc0MVdsbnJQ?=
 =?utf-8?B?cHJxRFUrb2J6cHVwRU9jSnFvZkhRaWlmTElaaHk5K3VQOHRDU2ppN2xrcStO?=
 =?utf-8?Q?jX9bkXs/oKv5bOBM+xuoU+8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2f8081-67bc-4978-5513-08dbcc18a1da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:17:17.1031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTLDB+oZ2R7TQ2iwJHwmuJc0lzMqyHOq67KvjcETHgW2mAHhz9fl/hOe/z3GY5YdXpv8Hc5GfFhaLd3CDKMUoGAvXRKXTffMzo389OKv0IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7713
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/21] drm/xe/oa: Expose OA stream fd
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:10:36AM -0700, Ashutosh Dixit wrote:
>The OA stream open ioctl returns an fd with its own file_operations for the
>newly initialized OA stream. These file_operations allow userspace to
>enable or disable the stream, as well as apply a different counter
>configuration for the OA stream. Userspace can also poll for data
>availability. OA stream initialization is completed in this commit by
>enabling the OA stream. When sampling is enabled this starts a hrtimer
>which periodically checks for data availablility.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 386 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 386 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 794ebbdc34cbd..261b168a61bf5 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -12,6 +12,7 @@
> #include <drm/drm_drv.h>
>
> #include "regs/xe_engine_regs.h"
>+#include "regs/xe_gpu_commands.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_lrc_layout.h"
> #include "regs/xe_oa_regs.h"
>@@ -26,6 +27,7 @@
> #include "xe_migrate.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>+#include "xe_pm.h"
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>
>@@ -33,6 +35,7 @@
> #define OA_TAKEN(tail, head)	(((tail) - (head)) & (OA_BUFFER_SIZE - 1))
> #define DEFAULT_POLL_FREQUENCY_HZ 200
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>+#define INVALID_CTX_ID U32_MAX
>
> static u32 xe_oa_stream_paranoid = true;
> static int xe_oa_sample_rate_hard_limit;
>@@ -129,6 +132,210 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
> 	return &stream->hwe->oa_group->regs;
> }
>
>+static u32 gen12_oa_hw_tail_read(struct xe_oa_stream *stream)
>+{
>+	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
>+		GEN12_OAG_OATAILPTR_MASK;
>+}
>+
>+#define oa_report_header_64bit(__s) \
>+	((__s)->oa_buffer.format->header == HDR_64_BIT)
>+
>+static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>+{
>+	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>+}
>+
>+static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>+{
>+	return oa_report_header_64bit(stream) ?
>+		*((u64 *)report + 1) :
>+		*((u32 *)report + 1);
>+}
>+
>+static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>+{
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	int report_size = stream->oa_buffer.format->size;
>+	u32 tail, hw_tail;
>+	unsigned long flags;
>+	bool pollin;
>+	u32 partial_report_size;
>+
>+	/*
>+	 * We have to consider the (unlikely) possibility that read() errors could result
>+	 * in an OA buffer reset which might reset the head and tail state.
>+	 */
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	hw_tail = gen12_oa_hw_tail_read(stream);
>+	hw_tail -= gtt_offset;
>+
>+	/*
>+	 * The tail pointer increases in 64 byte increments, not in report_size
>+	 * steps. Also the report size may not be a power of 2. Compute potentially
>+	 * partially landed report in the OA buffer
>+	 */
>+	partial_report_size = OA_TAKEN(hw_tail, stream->oa_buffer.tail);
>+	partial_report_size %= report_size;
>+
>+	/* Subtract partial amount off the tail */
>+	hw_tail = OA_TAKEN(hw_tail, partial_report_size);
>+
>+	tail = hw_tail;
>+
>+	/*
>+	 * Walk the stream backward until we find a report with report id and timestmap
>+	 * not at 0. Since the circular buffer pointers progress by increments of 64 bytes
>+	 * and that reports can be up to 256 bytes long, we can't tell whether a report
>+	 * has fully landed in memory before the report id and timestamp of the following
>+	 * report have effectively landed.
>+	 *
>+	 * This is assuming that the writes of the OA unit land in memory in the order
>+	 * they were written to.  If not : (╯°□°）╯︵ ┻━┻
>+	 */
>+	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
>+		void *report = stream->oa_buffer.vaddr + tail;
>+
>+		if (oa_report_id(stream, report) ||
>+		    oa_timestamp(stream, report))
>+			break;
>+
>+		tail = OA_TAKEN(tail, report_size);
>+	}
>+
>+	if (OA_TAKEN(hw_tail, tail) > report_size)
>+		drm_dbg(&stream->oa->xe->drm,
>+			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
>+			stream->oa_buffer.head, tail, hw_tail);
>+
>+	stream->oa_buffer.tail = tail;
>+
>+	pollin = OA_TAKEN(stream->oa_buffer.tail,
>+			  stream->oa_buffer.head) >= report_size;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	return pollin;
>+}
>+
>+static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
>+{
>+	struct xe_oa_stream *stream =
>+		container_of(hrtimer, typeof(*stream), poll_check_timer);
>+
>+	if (xe_oa_buffer_check_unlocked(stream)) {
>+		stream->pollin = true;
>+		wake_up(&stream->poll_wq);
>+	}
>+
>+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_oa_period));
>+
>+	return HRTIMER_RESTART;
>+}
>+
>+static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>+{
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	unsigned long flags;
>+
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
>+			gtt_offset & GEN12_OAG_OAHEADPTR_MASK);
>+	stream->oa_buffer.head = 0;
>+
>+	/*
>+	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
>+	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>+	 */
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, gtt_offset |
>+			OABUFFER_SIZE_16M | GEN12_OAG_OABUFFER_MEMORY_SELECT);
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
>+			gtt_offset & GEN12_OAG_OATAILPTR_MASK);
>+
>+	/* Mark that we need updated tail pointers to read from... */
>+	stream->oa_buffer.tail = 0;
>+
>+	/*
>+	 * Reset state used to recognise context switches, affecting which reports we will
>+	 * forward to userspace while filtering for a single context.
>+	 */
>+	stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>+	memset(stream->oa_buffer.vaddr, 0, stream->oa_buffer.bo->size);
>+}
>+
>+static void xe_oa_enable(struct xe_oa_stream *stream)
>+{
>+	const struct xe_oa_regs *regs;
>+	u32 val;
>+
>+	/*
>+	 * BSpec: 46822
>+	 * Correct values for OAR counters are still dependent on enabling the
>+	 * GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE in OAG_OACONTROL. Enabling this
>+	 * bit means OAG unit will write reports to the OAG buffer, so
>+	 * initialize the OAG buffer correctly.
>+	 */
>+	xe_oa_init_oa_buffer(stream);

In the case where we just want OAR/OAC, we could go with a small OAG 
buffer and set "Disable Overrun Mode" bit in the OAG_OABUFFER register.  
Then OAG would just stop once the buffer is full. I would think that 
would consume less HW resources. We can do this later too, everything 
here lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>+
>+	regs = __oa_regs(stream);
>+	val = (stream->oa_buffer.format->format << regs->oa_ctrl_counter_format_shift) |
>+	      GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE;
>+
>+	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
>+}
>+
>+static void xe_oa_disable(struct xe_oa_stream *stream)
>+{
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
>+	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
>+			   GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
>+		drm_err(&stream->oa->xe->drm,
>+			"wait for OA to be disabled timed out\n");
>+
>+	xe_mmio_write32(stream->gt, GEN12_OA_TLB_INV_CR, 1);
>+	if (xe_mmio_wait32(stream->gt, GEN12_OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
>+		drm_err(&stream->oa->xe->drm,
>+			"wait for OA tlb invalidate timed out\n");
>+}
>+
>+static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>+				  struct file *file, poll_table *wait)
>+{
>+	__poll_t events = 0;
>+
>+	poll_wait(file, &stream->poll_wq, wait);
>+
>+	/*
>+	 * We don't explicitly check whether there's something to read here since this
>+	 * path may be hot depending on what else userspace is polling, or on the timeout
>+	 * in use. We rely on hrtimer/xe_oa_poll_check_timer_cb to notify us when there
>+	 * are samples to read.
>+	 */
>+	if (stream->pollin)
>+		events |= EPOLLIN;
>+
>+	return events;
>+}
>+
>+static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	__poll_t ret;
>+
>+	mutex_lock(&stream->lock);
>+	ret = xe_oa_poll_locked(stream, file, wait);
>+	mutex_unlock(&stream->lock);
>+
>+	return ret;
>+}
>+
> static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> {
> 	struct xe_hw_engine *hwe = stream->hwe;
>@@ -327,6 +534,25 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> 	xe_mmio_rmw32(stream->gt, GEN12_SQCNT1, sqcnt1, 0);
> }
>
>+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>+{
>+	struct xe_oa_group *g = stream->hwe->oa_group;
>+	struct xe_gt *gt = stream->hwe->gt;
>+
>+	if (WARN_ON(stream != g->exclusive_stream))
>+		return;
>+
>+	/* Unset exclusive_stream first */
>+	WRITE_ONCE(g->exclusive_stream, NULL);
>+	xe_oa_disable_metric_set(stream);
>+
>+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>+	xe_device_mem_access_put(stream->oa->xe);
>+
>+	xe_oa_free_oa_buffer(stream);
>+	xe_oa_free_configs(stream);
>+}
>+
> static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> {
> 	struct xe_bo *bo;
>@@ -508,6 +734,148 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> 	return xe_oa_emit_oa_config(stream);
> }
>
>+static void xe_oa_stream_enable(struct xe_oa_stream *stream)
>+{
>+	stream->pollin = false;
>+
>+	xe_oa_enable(stream);
>+
>+	if (stream->sample)
>+		hrtimer_start(&stream->poll_check_timer,
>+			      ns_to_ktime(stream->poll_oa_period),
>+			      HRTIMER_MODE_REL_PINNED);
>+}
>+
>+static void xe_oa_stream_disable(struct xe_oa_stream *stream)
>+{
>+	xe_oa_disable(stream);
>+
>+	if (stream->sample)
>+		hrtimer_cancel(&stream->poll_check_timer);
>+}
>+
>+static void xe_oa_enable_locked(struct xe_oa_stream *stream)
>+{
>+	if (stream->enabled)
>+		return;
>+
>+	stream->enabled = true;
>+
>+	xe_oa_stream_enable(stream);
>+}
>+
>+static void xe_oa_disable_locked(struct xe_oa_stream *stream)
>+{
>+	if (!stream->enabled)
>+		return;
>+
>+	stream->enabled = false;
>+
>+	xe_oa_stream_disable(stream);
>+}
>+
>+static long xe_oa_config_locked(struct xe_oa_stream *stream,
>+				unsigned long metrics_set)
>+{
>+	struct xe_oa_config *config;
>+	long ret = stream->oa_config->id;
>+
>+	config = xe_oa_get_oa_config(stream->oa, metrics_set);
>+	if (!config)
>+		return -ENODEV;
>+
>+	if (config != stream->oa_config) {
>+		int err;
>+
>+		/*
>+		 * If OA is bound to a specific engine, emit the reconfiguration
>+		 * inline from that engine. The update will then be ordered with
>+		 * respect to submission on that engine.
>+		 */
>+		err = xe_oa_emit_oa_config(stream);
>+		if (!err)
>+			config = xchg(&stream->oa_config, config);
>+		else
>+			ret = err;
>+	}
>+
>+	xe_oa_config_put(config);
>+
>+	return ret;
>+}
>+
>+static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
>+			       unsigned int cmd,
>+			       unsigned long arg)
>+{
>+	switch (cmd) {
>+	case XE_OA_IOCTL_ENABLE:
>+		xe_oa_enable_locked(stream);
>+		return 0;
>+	case XE_OA_IOCTL_DISABLE:
>+		xe_oa_disable_locked(stream);
>+		return 0;
>+	case XE_OA_IOCTL_CONFIG:
>+		return xe_oa_config_locked(stream, arg);
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+static long xe_oa_ioctl(struct file *file,
>+			unsigned int cmd,
>+			unsigned long arg)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	long ret;
>+
>+	mutex_lock(&stream->lock);
>+	ret = xe_oa_ioctl_locked(stream, cmd, arg);
>+	mutex_unlock(&stream->lock);
>+
>+	return ret;
>+}
>+
>+static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>+{
>+	if (stream->enabled)
>+		xe_oa_disable_locked(stream);
>+
>+	xe_oa_stream_destroy(stream);
>+
>+	if (stream->exec_q)
>+		xe_exec_queue_put(stream->exec_q);
>+
>+	kfree(stream);
>+}
>+
>+static int xe_oa_release(struct inode *inode, struct file *file)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	struct xe_gt *gt = stream->gt;
>+
>+	/*
>+	 * Within this call, we know that the fd is being closed and we have no other
>+	 * user of stream->lock. Use the perf lock to destroy the stream here.
>+	 */
>+	mutex_lock(&gt->oa.lock);
>+	xe_oa_destroy_locked(stream);
>+	mutex_unlock(&gt->oa.lock);
>+
>+	/* Release the reference the perf stream kept on the driver. */
>+	drm_dev_put(&gt->tile->xe->drm);
>+
>+	return 0;
>+}
>+
>+static const struct file_operations xe_oa_fops = {
>+	.owner		= THIS_MODULE,
>+	.llseek		= no_llseek,
>+	.release	= xe_oa_release,
>+	.poll		= xe_oa_poll,
>+	.unlocked_ioctl	= xe_oa_ioctl,
>+};
>+
> static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
> {
> 	return hwe->class == XE_ENGINE_CLASS_RENDER;
>@@ -636,6 +1004,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	WRITE_ONCE(g->exclusive_stream, stream);
>
> 	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	stream->poll_check_timer.function = xe_oa_poll_check_timer_cb;
> 	init_waitqueue_head(&stream->poll_wq);
>
> 	spin_lock_init(&stream->oa_buffer.ptr_lock);
>@@ -663,6 +1032,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	struct xe_file *xef = to_xe_file(file);
> 	struct xe_oa_stream *stream = NULL;
> 	struct xe_exec_queue *q = NULL;
>+	unsigned long f_flags = 0;
> 	bool privileged_op = true;
> 	int stream_fd;
> 	int ret;
>@@ -715,10 +1085,26 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	if (ret)
> 		goto err_free;
>
>+	if (param->flags & XE_OA_FLAG_FD_CLOEXEC)
>+		f_flags |= O_CLOEXEC;
>+	if (param->flags & XE_OA_FLAG_FD_NONBLOCK)
>+		f_flags |= O_NONBLOCK;
>+
>+	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, f_flags);
>+	if (stream_fd < 0) {
>+		ret = stream_fd;
>+		goto err_destroy;
>+	}
>+
>+	if (!(param->flags & XE_OA_FLAG_DISABLED))
>+		xe_oa_enable_locked(stream);
>+
> 	/* Hold a reference on the drm device till stream_fd is released */
> 	drm_dev_get(&oa->xe->drm);
>
> 	return stream_fd;
>+err_destroy:
>+	xe_oa_stream_destroy(stream);
> err_free:
> 	kfree(stream);
> err_exec_q:
>-- 
>2.41.0
>
