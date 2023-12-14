Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0E2C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 00:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9010E10E8A8;
	Thu, 14 Dec 2023 00:59:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09D010E8AE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 00:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702515544; x=1734051544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yd5JeluEd5IwtCMAz84qli8Pvalb5s3eLXQIvWNuIBk=;
 b=ek9O0PHqb254XXT4ZJMz06m1zs+V8FNUbmP0jnflwMR3e+ifMbGrPSPH
 YTN6RfnPx68HhESyJrpQuH38fFGVvlQgHnI75H8V+4CAi9JcPQg7OCkET
 US+ib9s/D3L1h/yhf9E/wi6q4x2pZg3Jppbw7kFujwoMiy8t5ZSgdR8Wz
 TatDOSuq59eCBfvpUiqBamRQcTVr8IzaO2vy3YgehMEaZBLRyiyTV6Z/q
 wv10BkLW7P6o2cEEjTKDaLG16vjZVmxuDHM8on7KAeXtMWjRLdmhGZrOf
 sbGjAdJ5Up/MqpL2geNAtGPWFwopIV8WAScBXLEexiJteqFcOxJwGD3kl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="481246322"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="481246322"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 16:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="750326285"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="750326285"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 16:59:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 16:59:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 16:59:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 16:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ep9W2+uxTgbQrJNnMlN8DAIYVk8DgwH6NH9MD/oFepfdgAOy7WDN7RMVHYEREaIkQ27LFAiS78CIK4wcl3Yd6j4AE5DBhtRKyTJ27Dp9t4CD7FObyD99C8wrlk4lU+RiBW0mb/kpbIhzo0+O8bHz0N9nmHc5eaRSz7+rFNPlNU+nF0JU/gnfcCSBTJUhvNWPzXiScPUzBe2uuHNuSn2tCicBG7bBxqqsUhnvPUygEodGchKmV/dAMaAzHAsQxn74ZZQaXVInw68xkrR0gP+AeFoINssCSpBP5eQwACNELi823AbZqgDPCs+XkM+rFPKgkRN8Xrpf2OGyeLRCp6i4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR0lsm6sOuQNnFUXCHo3vYiX2j/0R4+fGzj9GjR7Dus=;
 b=fOhX7Y1Wctp0pUBLMsYBjtb+L5JQK66JZMt9OGQ0ufDHlfR23Ll0b0VBOPaQOSqUBu9ymazjQfyrW7Y9OLocrVIjqOohhhZLaFBXRapGea16EKY0SOSRkRwBNld5b6wbcg3vFT26fX5TZP8r6dTl4zqkDkucomxkGsej4iA74Tbi+KQ+wDAFSeBNlRVKlZ1YS2WT1pFu9Se7y/3DyO3WUAOBXXvNYrX+/0ZpXUEA9Gs5juxlQpLNyMSZgN/DbhM/xkRvXWad3astQmqYUosdn07WME0YZBJJlMehk5uIYCqygbR7j1I/QuPO50vEgn+yV+cp8GcEu18Z7cznFcBcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BL1PR11MB5349.namprd11.prod.outlook.com (2603:10b6:208:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 00:58:54 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 00:58:54 +0000
Date: Wed, 13 Dec 2023 16:58:52 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 03/17] drm/xe/oa/uapi: Add oa_max_sample_rate sysctl
Message-ID: <ZXpTTIIl3rK5AP/+@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208064329.2387604-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BL1PR11MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c19dccf-9357-4a9f-6391-08dbfc3fd82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVrQI9GJSOiqj90gWV41sXawsiq2Q1zGqiLDQUL/P8FNZYNRGzLBltHJc1KMcJm3MT12GJp8KcptjndCjmm76HQ1pZAeHL9QXcNP5DFVHQuShrP9enjDl7TXf+vFDxFOzLNRWCkdSvIz/hZkKz2RB03usKjSs9+t0gzGyjnhvNBKj0/csKNl4hGIYlb6p4e/1GClKhX+WHC1yCPzkp2pbgYvT0+yXkvSA6znGMQlkqYxR+zILVij79qd1xRRcGBbWrvB2RNm6O15JJbLqRtA8WzrqBRuAlg6HKw2oRpnjnCFanVrbRyVWs5+BG6ft4IUNWDFXRU6IksuJYzSeBmmCm1BSuM4fXMM7WyNM3W4G/8GG6HDCloH4Lr8sA4ldABLEGVYYivq3autmfxomZXvLmuDeYy67ftXEAs/2DnIaApL08IlmuWrRdtELNXRYXS50BAEUFy6H/mUHmO3hPA3SVVqdJtvCbKxsvid++g++yDiZVdjCD1RHgXlNHgdt2lcrrW9/rIiQ+BGCSCoPlmgVAOiJnk0bLs0X+HUQucYsECx519PqH850OyH0FzlacLmvzqGTgNMo/jdECcn8uG3cmMALg9bmyd3brkBwp6e0/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(9686003)(6506007)(6512007)(6486002)(478600001)(83380400001)(26005)(2906002)(5660300002)(41300700001)(316002)(6636002)(66556008)(66946007)(66476007)(33716001)(4326008)(6862004)(8936002)(8676002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHYzdlFoL2M3UlRzekdVQnVIaHZFSFZVWXF3VkpYMERuWEp2TXhkYkFucGpU?=
 =?utf-8?B?YVBhZGRHU3oyUEp5byt2N0Zub2NEQ0pXRE52dnVtZE9jRS9RbkhLSmZiMGZS?=
 =?utf-8?B?NlhSd3huWm9xRmFJNVF5dGZhczNpTWFnMkltd0pFWFc2RC9nQnZpMjZtZzR2?=
 =?utf-8?B?aVI5RWYrN2diRWRmdHFEbWIrNTRFWThRRm5GYlRuSWkxZzNEUi96Y3FUaTl1?=
 =?utf-8?B?SmdsT2o1TmxQOStmQVBvRGlOUlU5NStZeUtlVmNVc1QzOER4MnZUa3JNcHlM?=
 =?utf-8?B?S0NJRVF2bW1iL21HWUtKZXZSVkw3R0crMXc5OHVsRWZXL3dJRHlxdkpEZXF6?=
 =?utf-8?B?Nks4TEsrWE42dmtCUTk4V2U2dzNJU3EyOW1acGxtem96ek43STdzZmVqRWFP?=
 =?utf-8?B?MkM2d2c4S2dGK25XUlM5U1c0VWRNcXRGQzNjSnpmUEpZSlZmYkg1aGFkcHRH?=
 =?utf-8?B?RFJlRlpjbkxSSjlIdEVWRFVBQXR2cWVTOEp6OUVRZUl0MTZYWEpQNDVhczU5?=
 =?utf-8?B?SVRhWlFGVFZzTU4wdndlNTNLdVJTa0xWV2ZoSVJnWldxTlROeFlrenNKSWVT?=
 =?utf-8?B?cGg4YXduSzA2VnNNOFVUemJQbW16T1M0SDFicUUySFJ6VmdFalVqZzZSWHBr?=
 =?utf-8?B?NERnRk1MK2tlbWRXb1F6Z1V2ZVcvdlJ3TndBK0UyZERwSnN3cklDcXpiYmxk?=
 =?utf-8?B?clRhdmJJYWRuOVJWeGRzNm9JbGh2d1BnRk1RaVdQbDB5eUQzdVg0VU1CeUIw?=
 =?utf-8?B?YWFsTjVRL3dQOENBR2svQWU2Wmk4eHFUbFh1YzNVRU81a0VGVm55ZHFqTWZq?=
 =?utf-8?B?V1FTVGNDQk9ndi9CK3F2VjNBc0N2N3ppNG03M1M3ZENGSnlQZEE1Q1MxZmxB?=
 =?utf-8?B?ZUdPVHQ0bUhDbmUxaURPaFZ5bGVseHN2clAzZVI2Z1g5N05IR0w5Qnp6SDdk?=
 =?utf-8?B?cWdSZkNwZDdsSFJCaWtmOUFDbCtaYXZqUjQ1L3NxaFpRYTl3SmV5dXMrQnV6?=
 =?utf-8?B?RnZTSkU3Z3U3QmZFYjRJWGEwZmZHYjRYYmZ2RVBGb3h4NTJRVUdVWk9XOXZC?=
 =?utf-8?B?YytsY0Z1SGdmc0cvN0J5VGlGeFdWTVg5UXB2b2RqSFRtNUx3dWtDbmZQR0s4?=
 =?utf-8?B?eURnU0FnYkIyUFNjVnF3RGFweFYyaVBEOUpRTG1VRzBCdDJvL0s3b3dEUytU?=
 =?utf-8?B?c1pubFJlbTRGQi9MdkZTMlVCd2M2VVBzMzZDUkE2VnlWS3pyNk55R1VVU0xT?=
 =?utf-8?B?dUwraDhpbVNLc1Vyd0dyWURQd2xIbTk1V1I0WDhja09UYkhzSlpoYURFY05o?=
 =?utf-8?B?b0tjL3hRa2RQSVpzZHNIbTRiUHVjUDBnRlNKU0tTWTZMWWZQVFBsV2lQZ0N3?=
 =?utf-8?B?V0UzQy9TY0tDNno5TEpTV0FjU2xialVhYUJ6TFBmOEN3MytIVVBTT2p3UkQ4?=
 =?utf-8?B?cmFkWGloenVwTGl4QzZwWDJIYTc5ZnQwRmpQZUpHNzY4MldETjhSbmxFT0di?=
 =?utf-8?B?N3h0L1ZRK2Y1WEZYcmtMcWRXRktTcTUwdmk0aTY2bkZTQXJkUVQySzlwUjVL?=
 =?utf-8?B?UHVoSWJYUkl0Smh4dzMxNWduSzZucnhkQWxBcFdDNTYwdGljTGRnSVhKYXJ2?=
 =?utf-8?B?MDZkZHRmcUZGL2t5R2pTZzJZQ3NXeTkzMkUxaVdxckJMeXJXUmI1NUJna0pI?=
 =?utf-8?B?T1FhTmhWZmRDK0FvNmsxSlBBUFZ6U0dhSE5jcVhFMVh2cWg2ZXFhanJhRXA0?=
 =?utf-8?B?YklkT3hBQitKQm94UmtlSzhmT3Fyb0lGL2MwQ2psLzcwKys4TlJrZ1JGL3NS?=
 =?utf-8?B?MmRRRFJHaGNIdUN5TW12SUdXK0puMi9wMTdiTlE5LzEycG1uUXAyYjFKbEZZ?=
 =?utf-8?B?RThRYjVoTVFCdVUxOEUwSWFXQTQ2aXFDcmpEVmp2OXVMR1c3czJ3eFlmR1o3?=
 =?utf-8?B?cXJkb2ZqbnJTdGYrWFpBQmlWSUREdDJVR0dtQS9PNnFidjZvM3RtQlVPdnc4?=
 =?utf-8?B?TGVtYTIyelRJWi9XbDFTOHc0SThJQzl1SmFqdzNYUDdRSXIvOC9ZSFVuL1E3?=
 =?utf-8?B?UDJvQnpoUjg0bEMzSzVBejBDVks2V2MyMUlzSTdRWlJuMExURWRGNE5BVFZK?=
 =?utf-8?B?WFpreVhSNjJoWjNjanJHZEFCbmtLS0pBZXFNVEZndVZKMVFpUm1vcmFabnJN?=
 =?utf-8?Q?7PemBJlOslUVZqQm+iV9gmI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c19dccf-9357-4a9f-6391-08dbfc3fd82a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 00:58:54.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIraPOaV8tg4ks0GEi1SvGTzqR2CMYeVNJsZloif3y2nYwpc6y8cekkGi7dQEDeEFcjiwLlb04MwGA8eGxUBuhIsj4eJosbhiJZIeA89tXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5349
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

On Thu, Dec 07, 2023 at 10:43:15PM -0800, Ashutosh Dixit wrote:
>Introduce oa_max_sample_rate sysctl to set a max limit on the frequency of
>periodic OA reports.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/Makefile    |  1 +
> drivers/gpu/drm/xe/xe_device.c |  7 +++++
> drivers/gpu/drm/xe/xe_module.c |  5 ++++
> drivers/gpu/drm/xe/xe_oa.c     | 49 ++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h     | 16 +++++++++++
> 5 files changed, 78 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index b719953d9d30f..cf7e0e5261f73 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -98,6 +98,7 @@ xe-y += xe_bb.o \
> 	xe_mmio.o \
> 	xe_mocs.o \
> 	xe_module.o \
>+	xe_oa.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 35616d1a81a31..744d573eb2720 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -29,6 +29,7 @@
> #include "xe_irq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>+#include "xe_oa.h"
> #include "xe_pat.h"
> #include "xe_pcode.h"
> #include "xe_perf.h"
>@@ -480,6 +481,10 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_heci_gsc_init(xe);
>
>+	err = xe_oa_init(xe);
>+	if (err)
>+		goto err_irq_shutdown;
>+
> 	err = xe_display_init(xe);
> 	if (err)
> 		goto err_irq_shutdown;

^ this needs to do an xe_oa_fini on failure, so should be a 
different/new goto label.

Umesh

>@@ -526,6 +531,8 @@ void xe_device_remove(struct xe_device *xe)
>
> 	xe_display_fini(xe);
>
>+	xe_oa_fini(xe);
>+
> 	xe_heci_gsc_fini(xe);
>
> 	xe_irq_shutdown(xe);
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 8629330d928b0..176d3e6ec8464 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -10,6 +10,7 @@
>
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
>+#include "xe_oa.h"
> #include "xe_pci.h"
> #include "xe_perf.h"
> #include "xe_pmu.h"
>@@ -76,6 +77,10 @@ static const struct init_funcs init_funcs[] = {
> 		.init = xe_perf_sysctl_register,
> 		.exit = xe_perf_sysctl_unregister,
> 	},
>+	{
>+		.init = xe_oa_sysctl_register,
>+		.exit = xe_oa_sysctl_unregister,
>+	},
> };
>
> static int __init xe_init(void)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>new file mode 100644
>index 0000000000000..f4cacb4af47c5
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -0,0 +1,49 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/sysctl.h>
>+
>+#include "xe_device.h"
>+#include "xe_oa.h"
>+
>+static int xe_oa_sample_rate_hard_limit;
>+static u32 xe_oa_max_sample_rate = 100000;
>+
>+static struct ctl_table_header *sysctl_header;
>+
>+int xe_oa_init(struct xe_device *xe)
>+{
>+	/* Choose a representative limit */
>+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
>+	return 0;
>+}
>+
>+void xe_oa_fini(struct xe_device *xe)
>+{
>+}
>+
>+static struct ctl_table oa_ctl_table[] = {
>+	{
>+	 .procname = "oa_max_sample_rate",
>+	 .data = &xe_oa_max_sample_rate,
>+	 .maxlen = sizeof(xe_oa_max_sample_rate),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = &xe_oa_sample_rate_hard_limit,
>+	 },
>+	{}
>+};
>+
>+int xe_oa_sysctl_register(void)
>+{
>+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>+	return 0;
>+}
>+
>+void xe_oa_sysctl_unregister(void)
>+{
>+	unregister_sysctl_table(sysctl_header);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>new file mode 100644
>index 0000000000000..1b81330c9708b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -0,0 +1,16 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_OA_H_
>+#define _XE_OA_H_
>+
>+struct xe_device;
>+
>+int xe_oa_init(struct xe_device *xe);
>+void xe_oa_fini(struct xe_device *xe);
>+int xe_oa_sysctl_register(void);
>+void xe_oa_sysctl_unregister(void);
>+
>+#endif
>-- 
>2.41.0
>
