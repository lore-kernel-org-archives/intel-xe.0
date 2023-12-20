Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE8FC41535
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 02:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317F810E307;
	Wed, 20 Dec 2023 02:53:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5717C10E307
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 02:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703040789; x=1734576789;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FIvX6WGE91y+lHFvpt2HxVrboL3kPB/yAUpLSlOBTEE=;
 b=Ibxvz4WQducK4c/p5PEA6MMsnm1NeqRMDpql3GqY073VbcwF8vhwO5kk
 X+WD+uFmtZyiQpDTiu6K0BNyTK7sXmFzsbQANlS6o5o8FCkX7sjxnDpFo
 G/2wgcRMoP+u1MzF6a5zNxxIVesC+BbySq+6gsB3PU3gUwWkmRRHaXVim
 rrrr0NyVx8z9AfOLzRtnTuIsRsRHkpXoHBjI8OUeJkTTXK//MM1+1WR23
 o3hxFyLnB/+IIzXwrCqj7s6piqqn0BG6GFvXPTa0wOXb0706CFWn4ljLg
 n6Oy8kYJtw94C7XL7Z7GSmE9sdOmgnt8OUnaDCD4CwA8sms+mmsx9XP9v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="460095594"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="460095594"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 18:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="805104263"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="805104263"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 18:53:08 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 18:53:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 18:53:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 18:53:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVvVVQ/ynARO5fAlaWQVFTSYYiKtTN3Zks4yu70aMbil1JUzX46WUdaFhM/IiiDwRJwdGLt/ZEnYjRrXLrg2+yoLY7TKVrZNe4A493/yBueOqsvhfdUjHQqmLitbBDrwOJtO3FdK+zJrZhvBLg+yIavFCo3bBqh4htbqPaK+tvNs8XoLCt7WYukDrdNu2z8PD6HwUH4d0ohJ4l2dVfmY0uiu8CqI/h6ELT51FE1lI3aucjHAsH+fYEe9C+sXkxJAOBZlqinNu8s89oJqWzlofzUhZ0PeUdTuZ2nvHCPAp9v69u54JWIHrtbLM2pltdt0g+d87oa2EY2R4a4k0bidgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFWBKSdas2d5yhK4/S1NblZdTXNLtTCNWYngY/TpkcA=;
 b=mVcYd3HAgRYigPiHOs4OBuaA+GDAQl2LAkA6IszzR3hTtE5NbqUAjn0fF3D5kqv0qxLPHscu7wRB+DRRBKkorLpjaiz4zyjr52ZyDDKhvcgVnZo37dY6gJqFggC+ipiFnK6FLVOyDA3Gh5XJaCPQOpjqKMjWCTxZNjawW0/hpKrdYtCZsmdbNaDAd98V9kB7/WdgS5SdTRowzsGiXwwgmkIU7ytI0UA4S0hMKHZ3CNVqkOvMWf83wI5wV7JHmKrPwhRy7gZ1GX24H+S9NqnFIWBy4tAOD0j5NvI8aKsSRL9ej5fIm7UKF3iOrR+krd4r4HSYsiYwxIQr5aknyGA/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 02:53:05 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 02:53:04 +0000
Date: Tue, 19 Dec 2023 18:52:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 09/17] drm/xe/oa/uapi: Expose OA stream fd
Message-ID: <ZYJXCr37LMiJnxNK@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208064329.2387604-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: b9951adb-3e44-4eb5-6bf5-08dc0106c92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZy0C4uAI4ajcQGTUD6UfvMhz5gtyExRLJENc4vm0XcwmMyec+jQX6dBnO4IveVUThOAkfubJQbwBtR8tYMsVIb3OHHX8CiYW3/lJtcCLwztgz6tIxyqKVS802gbAUzl4cldg6Pu56xgG6Xe+ONZqneTNJCcJa3boW8anqbexRiZ7ewLe9gVlJxSIx4mTo7GNCSTYI6jqorCIhvPy+PBdzCw4Yf3UyROc7ks1qnyexSxgtcxZDpOKxAauC60jpRdJQgtIZDYQXIrq108GCgehapA0e8DfwUy76luUqWZwZBN1KKRujQCVRAOkHk8AXgbBJSV/X1IXtDB8dht4iZcThnQmrcrrNde3ZMJlDBk6Pe6cfGo1+tQb1D2fvrjM/4vJ1SHBV3BGJDJWpGOjmjjFnSRhp19qFOrJZoGCzo1TsL91DVRBwXnG1Q0+P9W+9CBvtxaMATg5xr8VmyQ6Ndj7f7NrQvcJD9DI0R1i4l7rgGdOdyjxuSnEMy8ZWSxNSAnRT5ReuOSH7yZjofZjwLtGFeTC5yNQr3lBAHanLZwdKtVq52Mqro76rSqomCi3ini
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(26005)(478600001)(41300700001)(6486002)(6506007)(83380400001)(66556008)(6636002)(66476007)(66946007)(33716001)(6666004)(9686003)(316002)(86362001)(8936002)(8676002)(38100700002)(2906002)(30864003)(5660300002)(82960400001)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDh2aElCc2pIQ1BKUkpRV092SkZhQ0VuYS9pZTFYdEMzdTh6YjAwZ2FBUmJu?=
 =?utf-8?B?OXJFODJhWURlQVRQMVcwRGJYUHFKSlVqbU5ySTBRTlYrdEJnRG9hV3I3QTlE?=
 =?utf-8?B?cGNVQTBSSXFLMVdlVG9kUHNNLzJQUXgvSUZJS1lxSDFpd25GYjRvY2ZFV2lS?=
 =?utf-8?B?eG94aE8yMFhoaHVocFhLdUE0TUhrWmJPaUI4YWlWN1FjMXVjY2ZGeE1hcEdZ?=
 =?utf-8?B?YVhNeXFCUVdSQWNsQjI3OTNyLzY2N3pIdUNUR0tLMHVTdzVGN3RXRkN2dXA4?=
 =?utf-8?B?Z1hDQ29RdFNoSllnbEV6eHlHejdMdHBWQ1ZNa3dRc0EzM3BRWXN1N2x4NE5X?=
 =?utf-8?B?ems2d0xCM0YyYk5yTnZQNXJtUlhuVFgwT2tRNmJPWW9IY1hLcFdLUzJnZVdO?=
 =?utf-8?B?Q0c0SVRjeWl2cEZZRCtrVDFZYU5GWWovWmsxR3BPSzNCVTQ2UnVWYVYvSXpj?=
 =?utf-8?B?WmtpTk1IV1QvL2hSSWJ3TjE1Q2xSbmFnNHVjN0hHWEhzM1h6YzNCN1VhZVQ3?=
 =?utf-8?B?REQxQ0xHOGpBTmxvTC9LZlp6Sjc4bTVGbkl4VTNKcU5OZVkxYjZHck10eWRv?=
 =?utf-8?B?TTJXek5iRzE4RXhObnhEdU1iRkJOQkp3RDhlK1ErcGxxdDBxQ1J3aUR1ekY3?=
 =?utf-8?B?bEIzS1ErdVEvS3dRLy9oS1NjOG5uRG1Edmpkc1lrdEpVV0x3SDN0d1VPZmJD?=
 =?utf-8?B?WXlqdWcyaXZLNU1MV0wrRHUzTGdpYlZ5ZnpKeUpPaXJaWVVGelhMNjF4aitR?=
 =?utf-8?B?QnlMS1BMc3RsOFdZY0ZlekYzOEsyWFZpbW4ybjBQaVplSFhlVlc1TmtsSk53?=
 =?utf-8?B?VFBOWVRKMnAxRlNGcDNXd01seWxQbm9mekg3ZkovK2xaa1plWkV3RzN6Wk9q?=
 =?utf-8?B?cExHUlhPMkc2anVGUmZOd0JDS1V6ZlR2QzdxeHIxVXJQaS9vM1E0OW5QS3hR?=
 =?utf-8?B?Zmo2eHZIZHp1eVdOcVRLTFNtVGFVbmZOc2FHMExBc0N1VzBXMDhvSVFhMnND?=
 =?utf-8?B?ZGxZY0RsSDJMYjVya1pNSWJXajZtU0svQVFwcFpjWi9BTk00UWY1c215Uysw?=
 =?utf-8?B?OGFGeFg0cnZjZ2s0dkdSWmtRTEJQcDBhOC9ybVIxM0hHZUkwZnlpaW83RGl4?=
 =?utf-8?B?NjkwejNZd1JXNEdNd1k5NjlMZ0k3WmpNVzQ4YXM0S1JWaXQ1eW5DaUJyR2VD?=
 =?utf-8?B?d01qWTNtbVlEak50UGphUGgyNnZhRm1uM3hYcUVDS3VIdHhMS2JwRnQyTFFU?=
 =?utf-8?B?VVFXS3NvcGhKNUpqZFdEdXVGL0pmN3FXcHI0dVJBaUk1bkFtQXg5U0VpY1FR?=
 =?utf-8?B?WXB2azNKZTZ2SWpBU3JPb0FUNWVuV1NvTXJUUTF5ejZTOUE4Yzh6Tkk2cUsy?=
 =?utf-8?B?YjlEWnhtbmpISU4rS29TcVppdzIrdndOeUs1TmJQdTFQU3RJS3FWZmhMM25q?=
 =?utf-8?B?Ykhzdk5qQlJzVFlLblN2L2x4S2FVMlptTVlzV2ZNMTJwM2V3eks2U3NUalNt?=
 =?utf-8?B?MnJXVVJjZENEMy83azdKQTlxTjdZMnRVTmp2cjRNK1ZGOXlYVFFUaFpwMmsz?=
 =?utf-8?B?NTBQaDF0MGVVc2xUVXNnTHIvOGdSRWphbzN2VU9Iend3cm5RSjgrdUM1a0h1?=
 =?utf-8?B?Q1RWdlBoak1SRTdCTmIwL3BjaTNSSDJvNHNFODYweFdTUjlNMi8zTkR0M3dn?=
 =?utf-8?B?TG9jaFJUVW5lWWxGRlFSM1Nsc1hxU1NaMnFiUzVLU2lkM25PYVZIbjkrekh4?=
 =?utf-8?B?TnlMMVp5WVdlWHZ1MGdwQjBFOE1YbU45VHJwK1FWT3lHSFRmbVFESmpXM20v?=
 =?utf-8?B?MnF3alpNczlJNm5kY01RanRGYkdJWEN4MjB6Nk5EYXlrNzFkcFMwallpM0N1?=
 =?utf-8?B?RzVtZURKZkZmQ1hxUFUwc29oRjB2bm5VRFJyY0lXejVVcmdUQlIyT3ZySGM0?=
 =?utf-8?B?KzNIWGE2T3c1RlZ2MTgyZlQ3RXdQN2lJcnZ1SVJlVDQ0YitwRFpxTjk4Vk9Y?=
 =?utf-8?B?VGU3amwzSTljWkFBUlR5YWVLMjNpWEhtTm9ZSi9aM0pZRDNzNzhHKzN6TVBT?=
 =?utf-8?B?Sk0wN1liMEtVdFU4Mml2TmVpVzR6cnIvdFpPaEhTQmpNZGF1ekM2SG5zWU8w?=
 =?utf-8?B?OVVENXVCb29RWVpKeUhzU3dPVlVoTndnUFMzUFVKY0tiNjgxby9tTGVyTllL?=
 =?utf-8?Q?pFBCF9x1FJP0gt3coCprOfA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9951adb-3e44-4eb5-6bf5-08dc0106c92e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 02:53:03.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xn+bG39RvZbVjmKxiiuYAzc3BdAMcw/4RqXNjZDLFvpNh9uN24lSlHsgh9jDWHiCuO7LMS1xjjJgkQ8qjqRoFHnET0rGhUaaGb6WMZvQfWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:21PM -0800, Ashutosh Dixit wrote:
>The OA stream open perf op returns an fd with its own file_operations for
>the newly initialized OA stream. These file_operations allow userspace to
>enable or disable the stream, as well as apply a different metric
>configuration for the OA stream. Userspace can also poll for data
>availability. OA stream initialization is completed in this commit by
>enabling the OA stream. When sampling is enabled this starts a hrtimer
>which periodically checks for data availablility.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c | 373 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 373 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index d898610322d50..b6e94dba5f525 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -3,7 +3,9 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>+#include <linux/anon_inodes.h>
> #include <linux/nospec.h>
>+#include <linux/poll.h>
> #include <linux/sysctl.h>
>
> #include <drm/drm_drv.h>
>@@ -23,6 +25,7 @@
> #include "xe_sched_job.h"
> #include "xe_perf.h"
>
>+#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
> #define DEFAULT_POLL_FREQUENCY_HZ 200
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>
>@@ -153,6 +156,202 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
> 	return &stream->hwe->oa_unit->regs;
> }
>
>+static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
>+{
>+	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
>+		OAG_OATAILPTR_MASK;
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
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	hw_tail = xe_oa_hw_tail_read(stream);
>+	hw_tail -= gtt_offset;
>+
>+	/*
>+	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
>+	 * increments. Also report size may not be a power of 2. Compute potential
>+	 * partially landed report in OA buffer.
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
>+	 * Walk the stream backward until we find a report with report id and timestamp
>+	 * not 0. We can't tell whether a report has fully landed in memory before the
>+	 * report id and timestamp of the following report have landed.
>+	 *
>+	 * This is assuming that the writes of the OA unit land in memory in the order
>+	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
>+	 */
>+	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
>+		void *report = stream->oa_buffer.vaddr + tail;
>+
>+		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
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
>+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
>+
>+	return HRTIMER_RESTART;
>+}
>+
>+static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
>+{
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
>+	unsigned long flags;
>+
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
>+			gtt_offset & OAG_OAHEADPTR_MASK);
>+	stream->oa_buffer.head = 0;
>+
>+	/*
>+	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
>+	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
>+	 */
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, oa_buf);
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
>+			gtt_offset & OAG_OATAILPTR_MASK);
>+
>+	/* Mark that we need updated tail pointer to read from */
>+	stream->oa_buffer.tail = 0;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>+	memset(stream->oa_buffer.vaddr, 0, stream->oa_buffer.bo->size);
>+}
>+
>+u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>+{
>+	return ((format->counter_select << __bf_shf(counter_sel_mask)) & counter_sel_mask) |
>+		REG_FIELD_PREP(OA_OACONTROL_REPORT_BC_MASK, format->bc_report) |
>+		REG_FIELD_PREP(OA_OACONTROL_COUNTER_SIZE_MASK, format->counter_size);
>+}
>+
>+static void xe_oa_enable(struct xe_oa_stream *stream)
>+{
>+	const struct xe_oa_format *format = stream->oa_buffer.format;
>+	const struct xe_oa_regs *regs;
>+	u32 val;
>+
>+	/*
>+	 * BSpec: 46822: Bit 0. Even if stream->sample is 0, for OAR to function, the OA
>+	 * buffer must be correctly initialized
>+	 */
>+	xe_oa_init_oa_buffer(stream);
>+
>+	regs = __oa_regs(stream);
>+	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
>+		OAG_OACONTROL_OA_COUNTER_ENABLE;
>+
>+	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
>+}
>+
>+static void xe_oa_disable(struct xe_oa_stream *stream)
>+{
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
>+	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
>+			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
>+		drm_err(&stream->oa->xe->drm,
>+			"wait for OA to be disabled timed out\n");
>+
>+	xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
>+	if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
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
>+	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
>+	 * are samples to read
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
>+	mutex_lock(&stream->stream_lock);
>+	ret = xe_oa_poll_locked(stream, file, wait);
>+	mutex_unlock(&stream->stream_lock);
>+
>+	return ret;
>+}
>+
> static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> {
> 	struct xe_sched_job *job;
>@@ -222,6 +421,26 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
> }
>
>+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>+{
>+	struct xe_oa_unit *u = stream->hwe->oa_unit;
>+	struct xe_gt *gt = stream->hwe->gt;
>+
>+	if (WARN_ON(stream != u->exclusive_stream))
>+		return;
>+
>+	WRITE_ONCE(u->exclusive_stream, NULL);
>+
>+	xe_oa_disable_metric_set(stream);
>+	xe_exec_queue_put(stream->k_exec_q);
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
>@@ -389,6 +608,139 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
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
>+			      ns_to_ktime(stream->poll_period_ns),
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
>+	case DRM_XE_PERF_IOCTL_ENABLE:
>+		xe_oa_enable_locked(stream);
>+		return 0;
>+	case DRM_XE_PERF_IOCTL_DISABLE:
>+		xe_oa_disable_locked(stream);
>+		return 0;
>+	case DRM_XE_PERF_IOCTL_CONFIG:
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
>+	mutex_lock(&stream->stream_lock);
>+	ret = xe_oa_ioctl_locked(stream, cmd, arg);
>+	mutex_unlock(&stream->stream_lock);
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
>+	mutex_lock(&gt->oa.gt_lock);
>+	xe_oa_destroy_locked(stream);
>+	mutex_unlock(&gt->oa.gt_lock);
>+
>+	/* Release the reference the perf stream kept on the driver */
>+	drm_dev_put(&gt_to_xe(gt)->drm);
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
> static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 			     struct xe_oa_open_param *param)
> {
>@@ -445,6 +797,10 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>
> 	WRITE_ONCE(u->exclusive_stream, stream);
>
>+	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	stream->poll_check_timer.function = xe_oa_poll_check_timer_cb;
>+	init_waitqueue_head(&stream->poll_wq);
>+
> 	spin_lock_init(&stream->oa_buffer.ptr_lock);
> 	mutex_init(&stream->stream_lock);
>
>@@ -467,6 +823,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 					  struct xe_oa_open_param *param)
> {
> 	struct xe_oa_stream *stream;
>+	unsigned long f_flags = 0;
> 	int stream_fd;
> 	int ret;
>
>@@ -488,10 +845,26 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	if (ret)
> 		goto err_free;
>
>+	if (param->open_flags & DRM_XE_OA_FLAG_FD_CLOEXEC)
>+		f_flags |= O_CLOEXEC;
>+	if (param->open_flags & DRM_XE_OA_FLAG_FD_NONBLOCK)
>+		f_flags |= O_NONBLOCK;
>+
>+	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, f_flags);
>+	if (stream_fd < 0) {
>+		ret = stream_fd;
>+		goto err_destroy;
>+	}
>+
>+	if (!(param->open_flags & DRM_XE_OA_FLAG_DISABLED))
>+		xe_oa_enable_locked(stream);
>+
> 	/* Hold a reference on the drm device till stream_fd is released */
> 	drm_dev_get(&stream->oa->xe->drm);
>
> 	return stream_fd;
>+err_destroy:
>+	xe_oa_stream_destroy(stream);
> err_free:
> 	kfree(stream);
> exit:
>-- 
>2.41.0
>
