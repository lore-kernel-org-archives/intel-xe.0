Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478A8CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F9E10E04B;
	Fri, 13 Oct 2023 17:06:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE8F10E04B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697216803; x=1728752803;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=08R5T5ow3+3y0r8LesifBCMN8e7TlJk6I66XW0awT84=;
 b=et2z7U11g95mJZh7RbczVgzClAp/OQFSGAkyZc5YLndGVrLPInfKXJQT
 5jVW1OgB0URECAK77h9FsexaQ+j4McVxKJL+0iSDQcwt6xDk4Eu7AEhvo
 RfgUP0SidjN2ASkBwSCL/KmiXEtUgjK4vjR/7PT8zGdzkuVRVHO7cZfNN
 6sXkG1gFpuHHaDHy0qEm3HoZycmLEyhgVIurZv62NU9d/tPG43ak/nT+H
 kzHGEyoyu81h7WOfpfOwO7aCyl8VwpbVLXG5klIdild59HfL9oMNkDszP
 4l1uueuMa+S9rjfdSINwOk0PxtZeaVI3vz2Z8wXzEwdiSOKx43RD3WMCG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375574996"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="375574996"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 10:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845552403"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="845552403"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 10:06:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:06:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 10:06:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 10:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnlyti7ibYf6fq2xRW9hRO7K/MmptjqiSc/yIxJeCTPNMWBpatGVjkkppAG/kCBWqE8ra+lOfKA9lGZZc9KJrRuuSfbdhutRHGrc6ONKNtCMlVgMrZumpTRh69BRfO1sONnFtidmJ/3+dVXzZmlKlSZaRaFQFyIKwfWpV9PvZc914/htdsS9VuJjJwGHi3xAhJOBgy+jZZfBI0BsPr4qOp3b9warti2xHZnQ35YFIkEHEplcal9JDLRunICBxhCziCKs2gtT/kQjxFKdHO/lpz1+v8H0I9ebKigE9OZqEsh/meXzSBiwSBKwlf4mWMtuXgGpySyJ2yx1eGFzus9YFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSHCuVdSfe33YAZFfvX8/hKk0oGDL3dDW44+YVACMAw=;
 b=e7JJXuwER7WEV/zbppT71Gao1MUJhTHMUgOoeQdIQH7VE+WZHWMxPVxQ8ymrc8Mwx83b761gwrKdl6iqpUxJuXUPowuDW91snVQWa0XbSmtaUwWF0otW7ahL+YVdj+ss50r75IKP9MJF/UqeL/nyLp2QYq6BrV4d6Kg3fNpho0XJu/FY9y4OxMvGYgC+F4/t7grY3s6eJ9lHJS482jM6rEBE36JmuZAuVsrOmjK3v6AjDrtbdICrJNqgRxMKO4YKZxsyZHGgNEb9GiD7yW9A7UJ4omDjbM/UJHuX3oFbZbl4usWIYdDdfol0GluQ9K0DBhwqrvvptQWV5KPl5HCTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Fri, 13 Oct 2023 17:06:31 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 17:06:31 +0000
Date: Fri, 13 Oct 2023 10:06:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSl5FVF1tZIGvY7w@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919161049.2307855-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0f65af-92c8-4367-4e0f-08dbcc0ebf28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6WeOOb/6SjRn6+OTV95XSZ5tY6nxkm4yAtEPMLOP/b16DR98PnStFsH2MZlwavnyUfine4YuTN3zmfC5Xu7PaA3vToaUi5rYpcP0g78bn1yIlQbWxFrHleKrWZtQjIRpCGvr1PG/OJ5KGA5Tnqpj8AKlhxNG2rA8T4Jk1UNJhu+X3ciWcuYRk8CLvjEWgv0V4IV77G9wL6kpcKakRhP9xNzRbJYN0eP0cLc+UfNd4pYxazTNGwn7m/bJnSkncdEKMDKql5AHC4NXb+7D8K9btbp4TbT4lPbrR9aJuqnSIzUuBp6xUOrTQo/kRNpe1hyQ0GOsnAdKTzWF0rfLFPauxbP/JmUDDejauL5uR43HTtlVHDZxuj6fEWk61AkGiF1YmxLW7QIkIKSr3rDKfQ/gZPCVzMus558TerRvdflg8kWyuOZylPqAIi8oTBlQG2+Sp7/WytRiwUkwcl9b+Y7BPoL5OCEFygGzLpvWznauNlsnA+J/D10ksbDH4zrobYq19zpiLLAIaqWlWsCMYItp/MojfIsHlC0ea7LbUkTyJPjdX0IWOPspxz7K++TxinXt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(82960400001)(8676002)(6862004)(2906002)(8936002)(6486002)(5660300002)(4326008)(86362001)(478600001)(6506007)(9686003)(6512007)(33716001)(41300700001)(38100700002)(83380400001)(316002)(66946007)(26005)(6636002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGMwSkYvaUgvMlNXU0M5QXRKU1JLV2pWVG9OSGt3VHdDdjNMeFd5TEtiMFJl?=
 =?utf-8?B?RFRVYlFyZXZ6TFgwUHFHSkU5emZZNkhwRkU2cW9JMWtlMEJkL0dZcUFuRkh2?=
 =?utf-8?B?a0M2UWVNa3NJd01HYjl1WW8zNWM3My90ejNpUXVremd0Q3BTZG05M3pyV0di?=
 =?utf-8?B?SzMrQzVGeXM2TmQ2dXpVTjMwNWdicXdIQXpSZ1hvQmhQZXVoMWZab1I4SDdH?=
 =?utf-8?B?QXlVYXFsU211RVF1eUJTeXpudndDZFdlUm1yRWNRWDlRc2VPWmg4dFVKVXdh?=
 =?utf-8?B?UkdhNlJuWEltVlp3SWZjR1Vpemw5R2d0WGhJZGQxZGpITDJRL1VQYUJydlhI?=
 =?utf-8?B?bTZySk43WEI3eTRkcXhVRXc1cDZBMm03SEllWHBvQit4VVU3dTk1dkZ1MWgv?=
 =?utf-8?B?Q3RTZTkrdU5QbjVZbmg0Z28rb2pSalIyOGNHVUJxeUs4OVBJcWRxRmRMcVRH?=
 =?utf-8?B?bkVzcGdTVkdBMUpVcUhKenM5QzF2a1B5RGlWQ3pab0FPUDdwaEJDS2JlQjNN?=
 =?utf-8?B?UUVtQ2xhd2Ivd1hDSnlqYldTS2RqVTljM2U1U21zRzZkUGxiYlMrV1hTZ2Va?=
 =?utf-8?B?TVZXU0tZTHVjZWxUSEhZU1ZaMHcyQjNSQjVweHFGL2gvV0crSEsxcG1HRjVN?=
 =?utf-8?B?Wlp3bTVlSXMwbmJzNnZBNTZBQVZoSXAzNnlBSkFlOVBxYWFxVWFvdkxuT2Mz?=
 =?utf-8?B?RHJXQnpLSHJFN3lTMHd0ZU05aWZQMlJ3VTRIV3UxVlVSRTRGb01vbllsTUVx?=
 =?utf-8?B?NU5ucDV1SG9WTk1Va1RXcDVDbTlhaGdncnMzSHloakZ2Q25ORXVFODNZVzRk?=
 =?utf-8?B?MDJLTnM3cGhxVmxDbi9OMVlwaG5kbG16bks2UGRINmxoMU1LcDVnU1hpZkNx?=
 =?utf-8?B?aEtteEs4dkZ4dzRGS3A0MU5ZUEI1N0tQU1FVeGh0Q3NOY0ZzL3AwcWxnMldv?=
 =?utf-8?B?Vk43aTYvTitHSmtVQUoyQ0NZd2NlWlBiaHBEaHYyek5IdGlLeGtzbUhhRVky?=
 =?utf-8?B?dW5uaXZVaWdJYmFBSnN2emlSWFUvVnMxOUJSSDlNdUQrSUNYK2FIaldPYUFu?=
 =?utf-8?B?bEUwbC9sNlYxbmhmK3Nva3IrNGNMTDJVekRmOFZINWNZVlFBRkxJTjBJK3V0?=
 =?utf-8?B?eUpUcHBwZ2RKZ2xaZnhmUGo4WFdaWnJSazV3U1FGQjF6bzB4RjlyZGhQWUh3?=
 =?utf-8?B?dEsxRitHS2o0NEtSTjI5OGdIRVhUVjNiOXRLWjdtZzl4MnZsNldOTDFtMThq?=
 =?utf-8?B?RGRRMTRRZldLNnpRb0pZajYzd1NORlk4RjcvbmMraTVvQnF2MEhsc1l3Wit5?=
 =?utf-8?B?dGNFMmNqdzNNQ3Q5TjVMQ05PWHBoYnVac2F4V1ZNeWRvVmtxNTJuK0xnU3Js?=
 =?utf-8?B?TjI1akt6OUJtb0EzNGkyRWVvdVhKc0xPYXZkSzMyYzZzNE5PUmJEZEV4OVNi?=
 =?utf-8?B?SEsra1dKbVFiNFg4S2xZK3dTbkVvNmRWTVMyVWhqazB0SkNrb3dyeW0xRlUx?=
 =?utf-8?B?NWtCTVdCMjBWZVNldVc3cUhMU255S2t5YUs1S0NCNTV0ZGVnNkRTZ1lGVCtV?=
 =?utf-8?B?dlJiUkV0YlJiQWhDU29WcWtPRUR5SWdyVFdpOUNGUm5kdmk1VlBqMzZaZ0dK?=
 =?utf-8?B?VlB6bFg1SFpma2lTcWJIL2xRbWtQV2w0bUZQMCtiYWtLNDB2TWxjeitPZGZO?=
 =?utf-8?B?RDd4Q0QzM3F4N1JTOTV6aXZoa2lxSHAvMzJSMkY4cGdnSW9PSXJVNlpNWVZl?=
 =?utf-8?B?M0xNbGZBZEUxeUtMWXlqMlgvYVJoZFlsZjVYV3pWWDJlV3hZZFFZR3RqU0FT?=
 =?utf-8?B?SitiT2R0WVI3VE5VTXRBZlpUNjBYWnJZOW0zZ1hVMFVaazlVSTZnZGo1bnNC?=
 =?utf-8?B?eWJ3SGI4blFhd2ROSWNkZDRMYUExRVI1Ly9HVGZUMjhEZEhzZjBxY3o2bkZQ?=
 =?utf-8?B?T1VYcStMVXhEQmVoSXpKeXZQNUE5OXFOblB5MTVPQ083MGpFd25qSUpZQWdY?=
 =?utf-8?B?TS94NGxGNGFBNVZBa1ZVZW10T3JHWkU3Z082Y0xFc0E5OVBaUW5CNTQ4dmdV?=
 =?utf-8?B?NTNsUndlMUFsaFlSbWQ3RHZTZ09Lci9hTG84cFU4Ump0anlBU0FGbDJKZVMx?=
 =?utf-8?B?UWlNcStncjRxYWs1Nmg0YUtiaFZtUTlleEhIdkJERGFwL3Q0aGFBeEYvVjdE?=
 =?utf-8?Q?VnMsXAZ0HY2LMSrKpYcoNB8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0f65af-92c8-4367-4e0f-08dbcc0ebf28
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:06:31.3123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PBz7t+70ZEZqwgT9GuiRtPmvfR1O94p1yxaHAOh9rc3w8bdRcxzgM7VsziJnlxqCFz06exkNQmjUsZiuB0od+qgoJaVAihMk3qAFGCkd0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5536
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/21] drm/xe/oa: Add registers and GPU
 commands used by OA
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

On Tue, Sep 19, 2023 at 09:10:31AM -0700, Ashutosh Dixit wrote:
>Add registers and GPU commands used by OA in subsequent patches. The xe oa
>code programs OA units which generate performance data. The code also
>submits command buffers to change hardware engine context images and
>implement waits.
>
>v2: Remove unused registers (used by noa wait) (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   2 +
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  13 ++
> drivers/gpu/drm/xe/regs/xe_oa_regs.h      | 173 ++++++++++++++++++++++
> 3 files changed, 188 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 692213d09ceaa..c12d23526f6ba 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -115,6 +115,8 @@
> #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
> #define	  EL_CTRL_LOAD				REG_BIT(0)
>
>+#define GEN8_RING_CS_GPR(base, n)		XE_REG((base) + 0x600 + (n) * 8)
>+
> #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
> #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 12120dd37aa2a..f74cab662ad5b 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -14,6 +14,7 @@
>
> #define MI_INSTR(opcode, flags) \
> 	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
>+#define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
>
> #define MI_NOOP			MI_INSTR(0, 0)
> #define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
>@@ -23,12 +24,19 @@
> #define   MI_ARB_DISABLE		(0<<0)
>
> #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
>+
> #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>+#define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
>
> #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
> #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> #define   MI_LRI_FORCE_POSTED		(1<<12)
>+#define   IS_MI_LRI_CMD(x)		(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
>+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
>+
>+#define MI_STORE_REGISTER_MEM	MI_INSTR(0x24, 1)
>+#define   MI_SRM_LRM_GLOBAL_GTT		REG_BIT(22)
>
> #define MI_FLUSH_DW		MI_INSTR(0x26, 1)
> #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
>@@ -37,7 +45,12 @@
> #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
> #define   MI_FLUSH_DW_USE_GTT		(1<<2)
>
>+#define MI_LOAD_REGISTER_MEM	MI_INSTR(0x29, 1)
>+
>+#define MI_LOAD_REGISTER_REG	MI_INSTR(0x2A, 1)
>+
> #define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
>+#define   MI_BATCH_PREDICATE         REG_BIT(15) /* HSW+ on RCS only*/
>
> #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> #define   SRC_ACCESS_TYPE_SHIFT		21
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>new file mode 100644
>index 0000000000000..0b378cb7a6ddb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -0,0 +1,173 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_OA_REGS__
>+#define __XE_OA_REGS__
>+
>+#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
>+#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
>+
>+#define HALF_SLICE_CHICKEN2 XE_REG_MCR(0xe180)
>+#define   GEN8_ST_PO_DISABLE	REG_BIT(13)
>+
>+#define GEN7_ROW_CHICKEN2		XE_REG(0xe4f4)
>+#define GEN8_ROW_CHICKEN		XE_REG_MCR(0xe4f0)
>+#define   STALL_DOP_GATING_DISABLE	REG_BIT(5)
>+#define   GEN12_DISABLE_DOP_GATING	REG_BIT(0)
>+
>+#define RPM_CONFIG1			XE_REG(0xd04)
>+#define   GEN10_GT_NOA_ENABLE		REG_BIT(9)
>+
>+#define WAIT_FOR_RC6_EXIT XE_REG(0x20cc)
>+#define   HSW_WAIT_FOR_RC6_EXIT_ENABLE	REG_BIT(0)
>+
>+#define EU_PERF_CNTL0 XE_REG(0xe458)
>+#define EU_PERF_CNTL4 XE_REG(0xe45c)
>+#define EU_PERF_CNTL1 XE_REG(0xe558)
>+#define EU_PERF_CNTL5 XE_REG(0xe55c)
>+#define EU_PERF_CNTL2 XE_REG(0xe658)
>+#define EU_PERF_CNTL6 XE_REG(0xe65c)
>+#define EU_PERF_CNTL3 XE_REG(0xe758)
>+
>+#define OABUFFER_SIZE_MASK	REG_GENMASK(5, 3)
>+#define OABUFFER_SIZE_128K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 0)
>+#define OABUFFER_SIZE_256K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 1)
>+#define OABUFFER_SIZE_512K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 2)
>+#define OABUFFER_SIZE_1M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 3)
>+#define OABUFFER_SIZE_2M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 4)
>+#define OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
>+#define OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
>+#define OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
>+
>+#define GEN12_OA_TLB_INV_CR XE_REG(0xceec)
>+
>+/* Gen12 OAR unit */
>+#define GEN12_OAR_OACONTROL XE_REG(0x2960)
>+#define  GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT 1
>+#define  GEN12_OAR_OACONTROL_COUNTER_ENABLE	REG_BIT(0)
>+
>+#define GEN8_OACTXCONTROL XE_REG(0x2360)
>+#define  GEN8_OA_COUNTER_RESUME			REG_BIT(0)
>+
>+#define GEN12_OACTXCONTROL(base) XE_REG((base) + 0x360)
>+#define GEN12_OAR_OASTATUS XE_REG(0x2968)
>+
>+/* Gen12 OAG unit */
>+#define GEN12_OAG_OAHEADPTR XE_REG(0xdb00)
>+#define  GEN12_OAG_OAHEADPTR_MASK 0xffffffc0
>+#define GEN12_OAG_OATAILPTR XE_REG(0xdb04)
>+#define  GEN12_OAG_OATAILPTR_MASK 0xffffffc0
>+
>+#define GEN12_OAG_OABUFFER XE_REG(0xdb08)
>+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_MASK  (0x7)
>+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_SHIFT (3)
>+#define  GEN12_OAG_OABUFFER_MEMORY_SELECT     REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>+
>+#define GEN12_OAG_OAGLBCTXCTRL XE_REG(0x2b28)
>+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_PERIOD_SHIFT 2
>+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_ENABLE	REG_BIT(1)
>+#define  GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME	REG_BIT(0)
>+
>+#define GEN12_OAG_OACONTROL XE_REG(0xdaf4)
>+#define  GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT 2
>+#define  GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
>+
>+#define GEN12_OAG_OA_DEBUG XE_REG(0xdaf8)
>+#define  GEN12_OAG_OA_DEBUG_INCLUDE_CLK_RATIO		REG_BIT(6)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS	REG_BIT(5)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS	REG_BIT(2)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
>+
>+#define GEN12_OAG_OASTATUS XE_REG(0xdafc)
>+#define  GEN12_OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
>+#define  GEN12_OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
>+#define  GEN12_OAG_OASTATUS_REPORT_LOST		REG_BIT(0)
>+
>+#define GDT_CHICKEN_BITS    XE_REG(0x9840)
>+#define   GT_NOA_ENABLE	    0x00000080
>+
>+#define GEN12_SQCNT1				XE_REG(0x8718)
>+#define   GEN12_SQCNT1_PMON_ENABLE		REG_BIT(30)
>+#define   GEN12_SQCNT1_OABPC			REG_BIT(29)
>+
>+/* Gen12 OAM unit */
>+#define GEN12_OAM_HEAD_POINTER_OFFSET   (0x1a0)
>+#define  GEN12_OAM_HEAD_POINTER_MASK    0xffffffc0
>+
>+#define GEN12_OAM_TAIL_POINTER_OFFSET   (0x1a4)
>+#define  GEN12_OAM_TAIL_POINTER_MASK    0xffffffc0
>+
>+#define GEN12_OAM_BUFFER_OFFSET         (0x1a8)
>+#define  GEN12_OAM_BUFFER_SIZE_MASK     (0x7)
>+#define  GEN12_OAM_BUFFER_SIZE_SHIFT    (3)
>+#define  GEN12_OAM_BUFFER_MEMORY_SELECT REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>+
>+#define GEN12_OAM_CONTEXT_CONTROL_OFFSET              (0x1bc)
>+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_PERIOD_SHIFT 2
>+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_ENABLE       REG_BIT(1)
>+#define  GEN12_OAM_CONTEXT_CONTROL_COUNTER_RESUME     REG_BIT(0)
>+
>+#define GEN12_OAM_CONTROL_OFFSET                (0x194)
>+#define  GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT 1
>+#define  GEN12_OAM_CONTROL_COUNTER_ENABLE       REG_BIT(0)
>+
>+#define GEN12_OAM_DEBUG_OFFSET                      (0x198)
>+#define  GEN12_OAM_DEBUG_BUFFER_SIZE_SELECT         REG_BIT(12)
>+#define  GEN12_OAM_DEBUG_INCLUDE_CLK_RATIO          REG_BIT(6)
>+#define  GEN12_OAM_DEBUG_DISABLE_CLK_RATIO_REPORTS  REG_BIT(5)
>+#define  GEN12_OAM_DEBUG_DISABLE_GO_1_0_REPORTS     REG_BIT(2)
>+#define  GEN12_OAM_DEBUG_DISABLE_CTX_SWITCH_REPORTS REG_BIT(1)
>+
>+#define GEN12_OAM_STATUS_OFFSET            (0x19c)
>+#define  GEN12_OAM_STATUS_COUNTER_OVERFLOW REG_BIT(2)
>+#define  GEN12_OAM_STATUS_BUFFER_OVERFLOW  REG_BIT(1)
>+#define  GEN12_OAM_STATUS_REPORT_LOST      REG_BIT(0)
>+
>+#define GEN12_OAM_MMIO_TRG_OFFSET	(0x1d0)
>+
>+#define GEN12_OAM_MMIO_TRG(base) \
>+	XE_REG((base) + GEN12_OAM_MMIO_TRG_OFFSET)
>+
>+#define GEN12_OAM_HEAD_POINTER(base) \
>+	XE_REG((base) + GEN12_OAM_HEAD_POINTER_OFFSET)
>+#define GEN12_OAM_TAIL_POINTER(base) \
>+	XE_REG((base) + GEN12_OAM_TAIL_POINTER_OFFSET)
>+#define GEN12_OAM_BUFFER(base) \
>+	XE_REG((base) + GEN12_OAM_BUFFER_OFFSET)
>+#define GEN12_OAM_CONTEXT_CONTROL(base) \
>+	XE_REG((base) + GEN12_OAM_CONTEXT_CONTROL_OFFSET)
>+#define GEN12_OAM_CONTROL(base) \
>+	XE_REG((base) + GEN12_OAM_CONTROL_OFFSET)
>+#define GEN12_OAM_DEBUG(base) \
>+	XE_REG((base) + GEN12_OAM_DEBUG_OFFSET)
>+#define GEN12_OAM_STATUS(base) \
>+	XE_REG((base) + GEN12_OAM_STATUS_OFFSET)
>+
>+#define GEN12_OAM_CEC0_0_OFFSET		(0x40)
>+#define GEN12_OAM_CEC7_1_OFFSET		(0x7c)
>+#define GEN12_OAM_CEC0_0(base) \
>+	XE_REG((base) + GEN12_OAM_CEC0_0_OFFSET)
>+#define GEN12_OAM_CEC7_1(base) \
>+	XE_REG((base) + GEN12_OAM_CEC7_1_OFFSET)
>+
>+#define GEN12_OAM_STARTTRIG1_OFFSET	(0x00)
>+#define GEN12_OAM_STARTTRIG8_OFFSET	(0x1c)
>+#define GEN12_OAM_STARTTRIG1(base) \
>+	XE_REG((base) + GEN12_OAM_STARTTRIG1_OFFSET)
>+#define GEN12_OAM_STARTTRIG8(base) \
>+	XE_REG((base) + GEN12_OAM_STARTTRIG8_OFFSET)
>+
>+#define GEN12_OAM_REPORTTRIG1_OFFSET	(0x20)
>+#define GEN12_OAM_REPORTTRIG8_OFFSET	(0x3c)
>+#define GEN12_OAM_REPORTTRIG1(base) \
>+	XE_REG((base) + GEN12_OAM_REPORTTRIG1_OFFSET)
>+#define GEN12_OAM_REPORTTRIG8(base) \
>+	XE_REG((base) + GEN12_OAM_REPORTTRIG8_OFFSET)
>+
>+#define GEN12_OAM_PERF_COUNTER_B0_OFFSET	(0x84)
>+#define GEN12_OAM_PERF_COUNTER_B(base, idx) \
>+	XE_REG((base) + GEN12_OAM_PERF_COUNTER_B0_OFFSET + 4 * (idx))
>+
>+#endif /* __XE_OA_REGS__ */
>-- 
>2.41.0
>
