Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB4BC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 04:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F1F10E02E;
	Wed, 20 Dec 2023 04:36:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F1A10E02E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 04:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703046982; x=1734582982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L4jMvSAoeNoRTOzvS3mjfkT3CRdFWRAsnWCdIDzRFac=;
 b=Ryr3tv6TL1qYYJmdrqAtjy7pU56BtMY5BmvBG0i36vacxgIGggYQYz/U
 4eq6YdslBPForKrM3a64X6tpqH5T8nKxa1B1Dsv3Gp6tg04eT2X404Pbo
 xFxHqSmvji2R3Cd/dCLtXc+UnlVTcQ0SlFIUlpTr80yeF+5kKLD4Mk8GH
 RBT1kvokLrx9X5MikurkREtr2Mq73Td5XjC0zsoZz+cNDKWm3ScAksQMM
 Uur2r1cbpa7VfbQI0vC/HwSkt5hVAKYmy7LlcZ1Vm/PGSVyNUTobRchaV
 6l1GisQJ9Y6q05luRC4Llkf9z8658NmT0J3HjlavGhIpkJY0d2EgAbNdU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9222830"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="9222830"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 20:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="24439375"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 20:35:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:35:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:35:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 20:35:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 20:35:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIdJbkTR1ffvjAlKQSBB1+JHEHK960CRQBsm9Uzq0K84gSTifRlYfBKmgHqkFXfQBV46L4cR28NB2se+VBgH8miFWyN2+IwySICu56Sx0V8nY3rHJxUoReR7vZ2CkGgeYyAKe+d2tlKbcE91Z6dwJs2uUKIdUe/jhgZKB88Aya7B0fZi6gncourd1Vl4CgAqyf+tA4almkzLzrlqJhzxWMpuBi7sDP0dBjAkFnRbEeR2HUGVoEqAQCVedoeWuCDRmDO3T//JeZ7OSt57fon96PxJUfrL7Nb/IZbzQWnJ66Lb7Xuayrn2DdCl+NH8IHPZsZ+glbMSeVbbxNSzA4F1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LINBNLFF5jEpcG53BsAbxaoap7UKXsygePhHCLK4cjs=;
 b=mpRs4Xeu1rSTad2Tg3ll60q68qfCkRAMDZRisoYb2zS+4grGBAxSxFdSWXVagyYRs1xUmUTLqNVVHp5UDiXbMyMHsD5xUATsyfyGjOMYKjm1GIWn8ObRhYo5w1TXggunXotumikz1KdcwhgGquH8QpCTZ5yZ/RpKIqj6NshwST3DFAq33Q95tXgWKGvJdyM0Yw8VfGh9IyTlFQL/yOTc4UeG5oTPGZYin/aq9sS7sqVvFVjw5JqBXgjgZX2MVUX69bf5zrYaXmoxI6jS42m8ComQEHLb9iznGsgyJIJ6bU85xKiQO7dSbU3A4GEwvC8KUSQPZ9t+zNafKMFkyvT12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 04:35:23 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 04:35:23 +0000
Date: Tue, 19 Dec 2023 20:35:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 16/17] drm/xe/oa: Add MMIO trigger support
Message-ID: <ZYJvCTqZ4ZYC0vgF@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-17-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-17-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: dbde2548-1542-43e3-9cdc-08dc0115141f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YGZBgPR632yUXj/M2BaCRwnLzWAY3fH/RKU6FgpTsGHM+2snGhj+ju8iCHbZo9kLotyW4kFbg5sCrnOlkn8kIYmWads2drYzPI5ep3O9IaoeYka2Kr/zFETmA5px+R53uymTxLzYB1X6/Vx6YHaYtRQVPSi6zHSeweMDKYwuDP67QlvAQBTZwdSjV8mKRQmuCBBUgVE31r0mQ1o+cjQ5NloevuLHiovag42k7YRDofk6VIp0IH4zyavHvkpLqwe0Nxew2597mW1a77qXOz3uBQ9ofw7YhNXCRayKx+SbTpq7eqc4+mr8VIBn3AECr/zO7GL584Fb7wJrkTJ1zO4XTV/2InwVBJDb+8XxV5GU3o01z5Zr+Lcz9wXxMVS18amX++ZvA4sHdBydLkRt5KtSVhNt3nCF1Z61r2nuC9sPFZE9HNDu4EQ0chwYt5pzi5JvIsEXAfTjeXTSZdiiNggMELEhvvxsvnjgESU65encQ2rPHKW3BrdJvMchK7uGqxjhNdlJQSybJDL6yfWj/1yEAEsmh7MyYFpLzndTX8EHq3xWEDFQurcQToIPVO/1dsN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66476007)(83380400001)(6512007)(9686003)(6506007)(316002)(4326008)(2906002)(6862004)(6486002)(33716001)(478600001)(8676002)(8936002)(41300700001)(5660300002)(6636002)(66556008)(66946007)(86362001)(82960400001)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2NkSjZpemF1Y0x6NTdFdHFOK0VDTDUvaFZubk5nSjRldUJaOVQvd05VSTUw?=
 =?utf-8?B?MXlld3d4M0tacitnN0k4QjFBekFuRDRUcXhNb0VoV01CU3dNaVI0TFdjYjhn?=
 =?utf-8?B?YXcyZFA3RGl1Nm1FWjAvcDRHSitDUGpJVHliU1ZpMW9mMDI2Z3FIZmZyTmdR?=
 =?utf-8?B?KzNNRkpLN0N4N0g5ei9nUk84eW1TbG80ZCtLWWxKS0F3NGY3YVQxclpScXJx?=
 =?utf-8?B?cStvOHQyL1JSQm9qcS8wUzNWZVowY1ZXL2JYOXNRck1RenppVGFMRHJqayt5?=
 =?utf-8?B?S2hycGZ1VVVzZUtIdGptdE5Cemw3M2NmTnIwaDlQTVBlQ2NxMTdXK3BNZ3ZV?=
 =?utf-8?B?OUNPTWowUjljUFVsMUt5a3FxZ0RXUWxYdVVidXZjRGdPSWdieTgzMnpkRGdM?=
 =?utf-8?B?MExLNGdReDI2R3pwcU13OXhNSG5kSytHb2RNb1JqdjRFTlZTblFoSnl6dHFL?=
 =?utf-8?B?a0VXWGpaaDZmejgzdlRTQ3ZZREpJbFFieTlaWW9BUWFLdW13YWRVWjdXdDg1?=
 =?utf-8?B?UUxxQlhwMGc0QThCdEs2RytjVUFhSzlZbUlHRVNoRGpldFpXU01JTzk2OU9p?=
 =?utf-8?B?eTVUMGtoeWh2NFVHUTZhelpZMWVkUVo4THlCOGNPc0NvRXplRzh3dVdrU2M2?=
 =?utf-8?B?dllSS2lyaGpVUjNiU21GdmlISFJLcGNtdVRVSDlZbE5ydVhMZ25zM2NwV1k0?=
 =?utf-8?B?SGgrbzNSUEpuTzMvRjVOaWVCYzNGemFhSU1YM3dWVFdHUjkvaUp2akFqVmpu?=
 =?utf-8?B?bHROcXJNRGhibmwrYWpjTVBuaHIvRklobTRaWGlnc1BuUmJwcFE0QitGcUYx?=
 =?utf-8?B?QU90aHdUeFpwT2xMU1NleFRnU1VveEpqNWo2MnFUdG0ybTdXaUkrT2NZVmlL?=
 =?utf-8?B?bmNSMkNoKys4TjZvTHRDWjVsU3B0eWJ2VUU2L1dsdDNyT3l2NXUzckdQdUU4?=
 =?utf-8?B?NzlXN3ZQbXpNQlJ2MWFtUnFhTzZIMlAxczlXV0oxZ1VMSGZpZFBlYVpwSllH?=
 =?utf-8?B?OWVOU0VVdi9nTjdLZEVsM1BtOE53T2ZoMXVtK1BhNWVEMWZuQlNvblREdVpN?=
 =?utf-8?B?WVpHd0syTlZ0eVZDQ2s4eGFCNmR2bzh4YW4wY1ExRGZnL09wUHJrNVAzbFEx?=
 =?utf-8?B?ZWhXY2pzTit4N2pxdVBja3hiR1ZvSWJrQS9zSWNJSUZadDZrVlJobXlFOXFr?=
 =?utf-8?B?VXVKdFhETm0wTy9qRHJsZjdST1BGd2lQcmY4R0RlZHpkZ0lvYnJQUmliSnFn?=
 =?utf-8?B?TmNiTTEwV1AvZFZLUmJ3U0QxSG9SVkl1OThVVS83YXNDb3hneFNNamhLbHJu?=
 =?utf-8?B?c2w3LytyY29DNFhRM1h5UlZ6dkM2bEY5UFZ5RUcxckh2cWNka1VIbWJHeDVy?=
 =?utf-8?B?cmF2RzBJcC9ad0RNYWJ5UlkzOGxmKzNubGR6ZzEzYzFuSEZDLyswUHJ4OUhX?=
 =?utf-8?B?K01Jd3hJRVJUS1R2R3JEWnlzUG5VWnRvVVR2SFlndmsrOXdUSEtVZjdJRklP?=
 =?utf-8?B?cWJQcFg1bG9rYWFETWp0OW93KzZXQnMvMFJKb0IzU2Z5OGZPRjJtRzhqMUVw?=
 =?utf-8?B?UklHc2Y2b0VqbnI0VTVLSzk3eERyVDBTcU5OTE9DTkQ4S2xIY0hzR0ZGRWZE?=
 =?utf-8?B?NFRha3d0c3NPeDk2YkNIMHNkdU9DbVVyV2lUZ0RlVTArVnZFZmI1VjlJeGVh?=
 =?utf-8?B?K0FQOFN5YnJ6aVVPcGwrUFdQU01Da1o2YkdGd09uM0VBbVAzbzhQbEFYdzNt?=
 =?utf-8?B?Rmh6S2VKYVkvWlRnQmlBY0tibm1wMzRnWVRhRkdTL1NpRGhLMXF6R0VKcHlw?=
 =?utf-8?B?Uk8reWloL0Fid21MTTRKd3M1YWpKVm9yT2ovM3grS2pjSGlxWkdtNTFudWVZ?=
 =?utf-8?B?YjlRRDE3YzNCdDJWOVh4SnVuZnVpTXE3MTlrcnpyc05BMksxamFCdldtVlEy?=
 =?utf-8?B?Y2IvVnpQY3NuSW5ZdUpVaUJxYnhqd0FqYTgxSDEyYXVaeHpKQjZEejVNNlFw?=
 =?utf-8?B?b3BUSE1rbXNxdTVYcExmZmVtK1ZIQmtuQ0Q4ZnFkYVBKSTFTcVZEWUJ5ekpT?=
 =?utf-8?B?cEdjemY1Z0l6UllLOHlDQ1hDRjNCWTdrajNMNmIydnFlMXZHdXU3NVYyKzZZ?=
 =?utf-8?B?VjBkcXNHRTMreFduMWlKdW0vMk05R0JlNGJiSllDTGZmUmZIek5kYW9hSGVJ?=
 =?utf-8?Q?M1pce/G0Ih/MdDtFMNz0Y2o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde2548-1542-43e3-9cdc-08dc0115141f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 04:35:22.4882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvzy5oK/5PZknDVrp7O957t4s431ATrTtfd7ED0s6M+H5emeMLTUkLNW0Qmq8r1ok0D6pX6ys2aqW8JwY8E+7jQwUfHipXznX8vI82zv0ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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

On Thu, Dec 07, 2023 at 10:43:28PM -0800, Ashutosh Dixit wrote:
>Add MMIO trigger support and allow-list required registers for MMIO trigger
>use case. Registers are whitelisted for the lifetime of the driver but MMIO
>trigger is enabled only for the duration of the stream.
>
>Bspec: 45925, 60340, 61228
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  7 ++++++
> drivers/gpu/drm/xe/xe_oa.c            | 34 ++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 23 ++++++++++++++++++
> include/uapi/drm/xe_drm.h             |  3 +++
> 4 files changed, 66 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index b66cd95b795e7..1ce27a72079ad 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -64,16 +64,23 @@
> #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
>
> #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
>+#define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
>+#define  OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL	REG_BIT(13)
>+#define  OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL	REG_BIT(8)
>+#define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
> #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
> #define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
> #define  OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS		REG_BIT(2)
> #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
>
> #define OAG_OASTATUS XE_REG(0xdafc)
>+#define  OAG_OASTATUS_MMIO_TRG_Q_FULL	REG_BIT(6)
> #define  OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
> #define  OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
> #define  OAG_OASTATUS_REPORT_LOST	REG_BIT(0)
>
>+#define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
>+
> /* OAC unit */
> #define OAC_OACONTROL			XE_REG(0x15114)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 97779cbb83ee8..13c6e516d9169 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -525,6 +525,16 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
> 		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
> 	}
>
>+	if (oastatus & OAG_OASTATUS_MMIO_TRG_Q_FULL) {
>+		ret = xe_oa_append_status(stream, buf, count, offset,
>+					  DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL);
>+		if (ret)
>+			return ret;
>+
>+		xe_mmio_rmw32(stream->gt, oastatus_reg,
>+			      OAG_OASTATUS_MMIO_TRG_Q_FULL, 0);
>+	}
>+
> 	if (oastatus & OAG_OASTATUS_REPORT_LOST) {
> 		ret = xe_oa_append_status(stream, buf, count, offset,
> 					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
>@@ -835,6 +845,13 @@ static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
>
> #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
>
>+static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool enable)
>+{
>+	return _MASKED_FIELD(OAG_OA_DEBUG_DISABLE_MMIO_TRG,
>+			     enable && stream && stream->sample ?
>+			     0 : OAG_OA_DEBUG_DISABLE_MMIO_TRG);
>+}
>+
> static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> {
> 	u32 sqcnt1;
>@@ -850,6 +867,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> 	}
>
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
>+			oag_configure_mmio_trigger(stream, false));
>+
> 	/* disable the context save/restore or OAR counters */
> 	if (stream->exec_q)
> 		xe_oa_configure_oa_context(stream, false);
>@@ -1031,9 +1051,17 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> 	oa_debug = OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS |
> 		OAG_OA_DEBUG_INCLUDE_CLK_RATIO;
>
>+	if (GRAPHICS_VER(stream->oa->xe) >= 20)
>+		oa_debug |=
>+			/* The three bits below are needed to get PEC counters running */
>+			OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL |
>+			OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL |
>+			OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL;
>+
> 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
> 			_MASKED_BIT_ENABLE(oa_debug) |
>-			oag_report_ctx_switches(stream));
>+			oag_report_ctx_switches(stream) |
>+			oag_configure_mmio_trigger(stream, true));
>
> 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
> 			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
>@@ -2259,6 +2287,10 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
> 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
> 		}
>
>+		/* Ensure MMIO triggers remain disabled till there is a stream */
>+		xe_mmio_write32(gt, u->regs.oa_debug,
>+				oag_configure_mmio_trigger(NULL, false));
>+
> 		/* Set oa_unit_ids now to ensure ids remain contiguous */
> 		u->oa_unit_id = gt_to_xe(gt)->oa.oa_unit_ids++;
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index e66ae1bdaf9c0..267af6759332b 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -7,6 +7,7 @@
>
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_oa_regs.h"
> #include "xe_gt_types.h"
> #include "xe_platform_types.h"
> #include "xe_rtp.h"
>@@ -56,6 +57,28 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 				   RING_FORCE_TO_NONPRIV_DENY,
> 				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 	},
>+	{ XE_RTP_NAME("oa_reg_render"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(RENDER)),
>+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>+			 WHITELIST(OAG_OASTATUS,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
>+			 WHITELIST(OAG_OAHEADPTR,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>+				   RING_FORCE_TO_NONPRIV_RANGE_4))
>+	},
>+	{ XE_RTP_NAME("oa_reg_compute"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(COMPUTE)),
>+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>+			 WHITELIST(OAG_OASTATUS,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
>+			 WHITELIST(OAG_OAHEADPTR,
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
>+				   RING_FORCE_TO_NONPRIV_RANGE_4))
>+	},
> 	{}
> };
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 5f41c5bfe5e0e..34cd7d5206834 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1357,6 +1357,9 @@ enum drm_xe_oa_record_type {
> 	 */
> 	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
>
>+	/** @DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL: Status indicating MMIO trigger queue full */
>+	DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL = 4,
>+
> 	DRM_XE_OA_RECORD_MAX /* non-ABI */
> };
>
>-- 
>2.41.0
>
