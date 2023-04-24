Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9401C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 21:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E6D10E608;
	Mon, 24 Apr 2023 21:00:00 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA9210E608
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682369999; x=1713905999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uM+CHCHCtiVq81r0GeTEl8wSqgeO7lJptqVIeupuiQ0=;
 b=nT76pXQ27KrFEXB0h35dTeO3cGaXP8hm2uXctR7PCg/bxf0Wkd8M+hrX
 J08i6YXtMTvpjb9npwixcYE9TfbaSzDnqi1Ge0xbLw+T8qHrxN6ur9vNt
 gz+pRLN9yZYOrH+P5tWUNV+J1IZiyxe+ryR2LpZw6RYrTG6x/vI/KeHlJ
 V8QnPKNxXtGReFjubxLFXmVLipYSxSztNVkwCbTIJqhPYgZ3ftr2GN8Gk
 Mr7wff9vfx7hb6uBJ1YXGKk0+h4qWxBtLxBJZC/zbki52YTkdZsVLqalC
 Qe0MbWyIMpZ9MKRTEe6JmlvlGwEi5LBzVdqeoso/Hr/tQlyv/LPUPADj1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345312622"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="345312622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="670636520"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="670636520"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 24 Apr 2023 13:59:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:59:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 13:59:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 13:59:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 13:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPAA/jAdDiuJrNmyto6mEavh9EMxhoyVH/85UfqhUIdmhrtHgbMtfHgBsA5A2X65G7rJZUcy0CPsc7V5lnv8waZUgmG9829dO6cSLC3iC5XmOUIWbccshqpXHDtcSnu2a+QYMp2sWbl3Zx1jFv9jGbioSwgM8EThWewz5Risyk12fNTtRBANMahz2NJeea+vBcPBEfuTNrRb556O+fR3xA/SSAfwioiV3PY33D5o8V9MfIqt8cgSaaks/M0qRWqUAnYEisiC1nGZdi+OU4W3wn/SgpSVs9a+j3V1dZT05HBCbsRTUqSV7S22adiQM1ruR9m9VQSyIj70h9v48gfbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8OMyNCUCZmLZ9HteVe7bnKv828WTCIQ0tqvYvqN0Jw=;
 b=A2enYVc9m5IxnfDcvSisGqgHVT9GP+dpNW1ah5xtwn7F1cQxweXXH3zckICINNLeR7yoqt440bSkt76FbQ/qbp9ppo4WR3nlj5RO6n0wSgEOG5PO2yFCpqZWbX2z7hqYrqCMFIrJRl7WFee4QCUZyrsbqVGA+arKoQAZBlG1vCZDhwauJDdINMb/Tj4b2bqWKNrR81M1FFzMrh/L5yklDtr/kupixWYVhzWylGnN1DbelyQ+JYaGdO7jVmps9bVYiPYq1VNvO4JUgBWqFTsKxfN1bwrA+tBG+AQSQryF4rnx7xEKGekCPXR0UUr11olYgtH78Qqc4vTBy5X+BpOXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 20:59:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 20:59:55 +0000
Date: Mon, 24 Apr 2023 13:59:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <gnqodp7ofwu5vg5nlsaiay3efckusnxpmkqjsf5dx2hbfna2vb@vz5xzczxnak2>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-16-lucas.demarchi@intel.com>
 <20230424204924.GD10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230424204924.GD10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 7033f884-173f-4ae7-17aa-08db4506db01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c742lCa0uLsTK85J7dXnUMa39ntKcht1N60fXpXd2pTWsWZf+hJxKoNbg8rFb8hlZgvC6Cdj2MjQM/R/lQzMFZpM/LCXsLufriIjWRH8UySmwEQvCRwlSSKMKdCfs8Ay0NM3K7bFM8Jiw+4g9jOx3WGVa5iS9/8OwxsaUfegh29WTDi4is1sUken9Evj6pgC70UXZE50J2zsl+5JZozOvypAqtFYxH4sgZ+jI0vNAdHXqqtOiHPqFtrwEeNLQITTnddD+6F0GEO+Xsj6ECnQX6LMSDUuZ7ZRdq+kdq5nlWBz4PyUgbGfg7Yvveee2CgmPXeSqepypCKM6heyyERUMJJ2jcYkxk25jlhZUzPnCRaiWEFi6u/szA16uI1RSeWZA1uMPyRQCaYjZtj1uDuMkWgdzXHgZsPVsssc35HOyOtMSzObs/2geGPVGmy3VQ+711J5p5O5CEq/qIRpIwdAEI2Nx46XmQJRcaz3xdrrdB7QaNspjZ21fb3119D2nXumcj4yNPVCNA4JsRo5SmksPVMr08PC9bYZetxtSfwj9cQ3EnNrQ/KHi2uD1frGxHZF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(9686003)(6506007)(26005)(6512007)(83380400001)(33716001)(186003)(82960400001)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(6862004)(8936002)(6636002)(54906003)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8LbPy5g8LtPQdzCpYaZyinXhqgcWBGjt2fLSa0RfKkt6G+r4j6LDXdLggL4D?=
 =?us-ascii?Q?FQnl0oKD2Ir8kOLPpqwo6Mj00n0ll4At9eX50VrTHi36KxlV8Jw6B5XLBpVZ?=
 =?us-ascii?Q?9sqFT39f+dRNrp1gSZx/UUf0CK1WQFYorGspnP1IT9CxTCBIEdsxVL67D3ly?=
 =?us-ascii?Q?Y2pckSvFhu8Z2K4gOd3iDxrzFZCN22BvksOqhNPAQtPuDtxJgKRklTsEbwmS?=
 =?us-ascii?Q?EfSNsSTmJwRj2eRLzE6+IkPEKlQYNAUciWOQn/7+kWQ4zd59LRIu58JlF/D6?=
 =?us-ascii?Q?s3pKaa6O9O8086Gp7zh99ggneKgc6TtqfJT+aHb8fwqt+WViGpPCcL+oannC?=
 =?us-ascii?Q?QoFt0F/wrROMu15+SYp5NTSteRUAeaUuZp6pexTftOPp8N0Q3ljoyUURdijq?=
 =?us-ascii?Q?R3f7k33t2pKRvO/xhr6HOWm8oQhtR9gIMAOgju1JwFCSy/O5j3RB69A2H/jm?=
 =?us-ascii?Q?aWzFHhq66drE8SPAr9Z5oOTUP+2sGixQ9RWtcx1fQZiMiCsPP/aMGbi4d3d+?=
 =?us-ascii?Q?H+aM0mKxCYlGFutiB5GlLul9VyCbv8iW3EtAF24s0dIjx24hZK+UwEOeObEr?=
 =?us-ascii?Q?78t7YzDwguZygKXOfiEfydapyQJ24OnEGS2g5TzOR1enDlnYQk5gRTtYFtDG?=
 =?us-ascii?Q?HkKEDYS5uMOemjxg976L5z60SDa7XSKTHGxIVri4/l13/GTkPJk7zCTDZYHf?=
 =?us-ascii?Q?+mQxRUK+fqeff4EjHbpI/OoHKvXuxyXmv7EhF3SQzMcRqXMaKKiVlwii1PuG?=
 =?us-ascii?Q?ZaSxvxM/BOS0IS73lcJbFrVgNEVl0p8MqwnjckNs//KBzxRe+qhVjczVuhWR?=
 =?us-ascii?Q?SWP5Siuntxbk+fQEhraW7vb7MFPTlUPXfXXRaVDfJWxROyHaoWSnw5q4ymFJ?=
 =?us-ascii?Q?wZiFXETUCCxcQTuktQL9Imgh5J6yQBbAeHLrhnkq7CZDkboRzQnLhn4h9QOZ?=
 =?us-ascii?Q?a+HgKU5VkNNRksCbyazGvbhNyvEluiiTsMvVZyhyejtHamNMc+Gtbq1GPMas?=
 =?us-ascii?Q?489RpKWqWxAfG8mDtdY+yXFLQcfCU89r5b2qTugtuo7yl8CqWtOu77CrR3Pz?=
 =?us-ascii?Q?JSwt2K8iigtkZ2SA4pd23sYCJTAFfnSCURc6PukUo2WVpiXdPi+vXX83niQ5?=
 =?us-ascii?Q?D8lxp0VSmww99i6XZ3wWuyOFtMX9mOtm2QPj2qCQt97jBEde1p65xHcZO7/s?=
 =?us-ascii?Q?n6oasAfh1CNHKTmA1Zi9vVi8HeG8vIg/JxYW4UNnXGGrKpmQbj5m+f2Mj6Bd?=
 =?us-ascii?Q?F7oOzbYGXT7t2tZyTQ1PfSclfiR0eaLRQhm54lXJ7osquxkisCpiIE/ZOizt?=
 =?us-ascii?Q?YpBSRzDQ94ipu9jC0gUTx+alA3Q6+JTVkkUKCG+CufxbXRjKZtXnWbzF8TRE?=
 =?us-ascii?Q?gu/qPiShoaoQbtxRSNQGeMN2a2VHkk9BiWlsYjTK0pan2sIDtSAxugOUFNDW?=
 =?us-ascii?Q?ieAL1wu4oVahCEWwiYr8py7OnmART9hWPtm/FVTtPbW4XrEHiyWLiGScDqtH?=
 =?us-ascii?Q?UY7ngLvjVy4n1EkPS0XY2TdDoEkHo9u3G46awhJaO8v9eP6hhubbvVDRiASH?=
 =?us-ascii?Q?AK7dk7QLIpX4dvMgm4LZTzYVJxp/XrHwBvDE6IkCkSOLlKRBO2VESJ1hPF8Q?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7033f884-173f-4ae7-17aa-08db4506db01
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 20:59:55.1105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXySFV0sHCcRzKiWfM/mxjwSAvje3MPwv3eX+qRzkcH2f/87GBJ3IAseDVTejZhy5GxSkB6hHStW8pzvjwHmFsJPNZciFc8wtLud56QKNzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 15/17] drm/xe: Annotate masked registers
 used by RTP
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 01:49:24PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:56PM -0700, Lucas De Marchi wrote:
>> Go over all registers used in xe_rtp tables and mark the registers as
>> masked if they were passed a XE_RTP_ACTION_FLAG(MASKED_REG) flag.
>> This will allow the flag to be removed in future when xe_rtp starts
>> using the real xe_reg_t type.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 46 ++++++++++++------------
>>  2 files changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index c13aac8f900c..f8851e045c0a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -21,7 +21,7 @@
>>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>
>> -#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50)
>> +#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 64ab2255a406..c6949cec1dc3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -45,19 +45,19 @@
>>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>>
>> -#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0)
>> +#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
>>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>>
>> -#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4)
>> +#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4, XE_REG_OPTION_MASKED)
>>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>>
>> -#define CS_DEBUG_MODE1				XE_REG(0x20ec)
>> +#define CS_DEBUG_MODE1				XE_REG(0x20ec, XE_REG_OPTION_MASKED)
>>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>>
>>  #define PS_INVOCATION_COUNT			XE_REG(0x2348)
>>
>> -#define CS_CHICKEN1				XE_REG(0x2580)
>> +#define CS_CHICKEN1				XE_REG(0x2580, XE_REG_OPTION_MASKED)
>>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
>> @@ -77,10 +77,10 @@
>>  #define XEHP_TILE0_ADDR_RANGE			XE_REG_MCR(0x4900)
>>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
>>
>> -#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204)
>> +#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
>>  #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
>>
>> -#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208)
>> +#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>>
>>  #define VFLSKPD					XE_REG_MCR(0x62a8)
>
>This one should be masked as well (bspec 46114).

indeed, this one as using the different syntax for MASKED_REG
so it went missing on the this conversion.

>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
