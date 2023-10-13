Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B3CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 17:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F910E060;
	Fri, 13 Oct 2023 17:59:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672210E060
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697219959; x=1728755959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AjdsbRZO7K1oBunlut87FzBBFkJvXt67vKOZw+CCELE=;
 b=H+0vdGCiLXTD21iazYnjRukF2spBmJhkoPcEQ9NGqDiVsSgXBDkU/skY
 MEPfWO80C2xC4ca/ixRARYCeZ2FI2tkNCQMDT5K5eHwT8OF9wjEJJhi0e
 9a+i6X3vkj1aRcj0+90N7ifCe6tTTNaK+0yDHZiqBF5G/KWj7noYtyg5/
 nmIgohYqwCdJ5uk1CtDGUqis/vmYxexQAEFf/p++S1gE0//QhFJIrCOhF
 RAlLDW+C0nu9sQdgDFmo2fPhB5GTUh+F28MCpNpjitwIUXXV+NbFewSim
 ZobSvVpC8hLuk53BJC2OKTz2bQKk+OCijnX6Zx7Rs+zX4HD9ZFPSntaLI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385072115"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="385072115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 10:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704731479"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="704731479"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 10:59:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 10:59:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 10:59:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 10:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW9feogCXn+1VQoPkONA+JeNv/l6iIm0DVhNXq+hAIcrf/1p+sfwCO9S9W/4pS1qekkwkzrUC19ZatdovfBfuYRzMTebj/z0BRL35hYy6LBp4tyWlZuu+GDdctaXO7NeEcd97dB6oSgLoCykZqy1us8MXgHY5h1Lorh+eh0aulpkpmy9Ng3Y6x14hv0uGP3i+1M+qnJKvWzrYA5KAhJp3ueY6dsNqsxfNwP426ibbZ2Qu9yl9jtHUkwPONcOhG8+vPISmyzt45g0KVdQn+39x5PvXHR+R4+CN01AMBFh1ZbshrmETQH3i5ysBjN1TGwDBQ8QQTOopBH6yYbcGoH54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLDBtbbyoQR9B+JNvL7rKR+tKXcdDPycaamENsygGeM=;
 b=gutVlxWdx0LtnoALOr1+jE2Bfd7OHDXYVS8sHjJTZor4Wt5ouYqlugHTsCfw3kWt7qJRbfpHIUTBWjXoUYObMgJ7QMtxKI5sJEX6EbIvBTOW59iMZBJi2A1JkV5QCHOtJSp45GD2/eDHj7Br/wUmGFJsGJnqg9Dl3L7h87UZN10zRVRR7TtIKrMzlSLRtBystos4C+jb+N/92tU17T56icns0I0TA6WX4bblMxQj0JYbQ/ilWaqskpw6EKJ9hn08oPGOry2Ax1K6JMV0PwuOlWxsQMNP5oOd1Cosjc9Ss45SK0qR9PDoNYeMYcIjHxtXiu2M5HjWcC3m9mxbocTjZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 17:59:07 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 17:59:06 +0000
Date: Fri, 13 Oct 2023 10:59:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSmFaduwGo1ECSz8@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: ae41cf4f-b1c1-4d7a-367c-08dbcc161805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hBIdoIS2qbNLj4RBUgHm8D367v4a3IaVaWUDsui0VN7tZaD8bm/9o3wOaMxVf4DHdbVg8buFEwquLJV6EbI2e/1FapTtMQMP8nUMXGfUNbi5QeK0+PqbA0+TfyQQGZ2R2SPTWFrUD8zr50dFt85JPZt0JAp9MFBwoND71pFDI+dF++VgoEFvgP5SLr+pF0zpFVtRJYUuid2CyBsfwXKXnwJ8BuMFiBYz598tnW6593Qc8LTqTRfFOnFL+qY/IHkNhjRxIpmLO4mHQfry3rXf1h1CbJzFy01HgaZQrVuxsQUEQ+yllm9PISL+20lSLF8Sq9A+EsWXBxCg0zWI0656ESZYJ/GIge4ISYP8J2EDW3Jy8fnDLLlSf8qJhqAx6H4k6uwpUoRYlXIv3vRMaGbcemOPDueFyr0zobNH2BIEm2IWqcefyfTKuBfYuWAPT2YlV3sEOK17+uh9f5r3XUsY10Yoy4NGxBbFYqcm28GNdRlddg1AtVap52e6+M8oKoic3kJqk3Nrhs0c2rAKt/myGO4f69Xhp/p4TcooitDVWRPKznFmmPr8R305/Kz2qPs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(6512007)(9686003)(6506007)(6486002)(83380400001)(26005)(2906002)(33716001)(6636002)(6862004)(66946007)(5660300002)(66556008)(66476007)(316002)(8936002)(41300700001)(8676002)(4326008)(30864003)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVJjYi9EQ2RMYURHYlNKZ3ZSOG84em9VYzdBY2NYcC9qVVA2d015Tm5KWnl4?=
 =?utf-8?B?aDFYR0RzS0JZSGpPS1l4K0ZFU1VURzFIbzRndjZrZGZrUkc3Si9sZUFZV2or?=
 =?utf-8?B?Z0d2ZDJubC82QUo2Y2I4WEVqZWdmRGRBZUFydjVLeWxwbEVkOE85aXQzTHhJ?=
 =?utf-8?B?UjJ2UHh3NDVHZjFWSVJhaGcyMytKK1JWN0x1TzJ3MVVQQ1QrNktUczI5dGIw?=
 =?utf-8?B?ZTVURnJ6dWhGa01uTTgyRGRIL05QTXlQREQyRjd4cXk4N1hvWHZKc3pCRHlE?=
 =?utf-8?B?VjNndW1ZYndoM0lnOGh2d1NKd0xtMHhDR1JybC9FUWE3cmdhLy9jN28rZW51?=
 =?utf-8?B?dmpOK1hIbTNLVlRDRm1oYm5iK2lia0VVeGlHejhCK0NFNkdqZlpSQ0RrYnYx?=
 =?utf-8?B?SFU2bUV5dzNxS1NTQk9yaGV0S1VBL0VreFV6SW0xcDRrQk8raEJLNWx2Q0ht?=
 =?utf-8?B?b1Mzb05hZEU5YTdHT21teEx2WkdLVStoL3htQXFWRE9SZUJSSEhsWkR0K0do?=
 =?utf-8?B?NFVVVmREN0ttKzBINVRnd2ErY0N6VGs0U0Z3S2tvVXdtZTh3MUxleEVyL3lr?=
 =?utf-8?B?b0w0bVFHM1FreFJGS1NYaDNkakVWZ2FROXJYR1Q5Y3RYbGxyb0d0V0FLMEE2?=
 =?utf-8?B?enJSTXE3ZFRyUmhwR1NGNUhMSENsU21FenNGenY0bVh1eHI1NXdhalFCajlL?=
 =?utf-8?B?dmFFaVhvVHlEOWNDM0lLcFNvWjFzT0ZMcnRYSlN5NjEzSEpCakFJNEdzNmNY?=
 =?utf-8?B?MmQwOHZBZDBlNzJRQ2FqK2czTTR2SEpIVzFtUVE5LzJkWTl3Z2U5S2FrSmdq?=
 =?utf-8?B?VUM4MXpSNndrUUJqbDdsTjIwaDFXeDBrSW9sYmk3dFZWanBwMzM0QXJvb3F1?=
 =?utf-8?B?UHVad1NWcW9NeWF4WFpXUlRFdlFUWjdXZHdGSk9sQUswNGRNdkgvOW9FTU1F?=
 =?utf-8?B?U3RSY3BqWFJxRkkzbnRSRitTQit1NU56RzVqWmM0T2ZFL2orS3VJTkMxSXdR?=
 =?utf-8?B?VGIwc2NaY3pmZDc0RWkwbi9SVERCVEt2cElScXRWRnpkbFZZMmZ1alNHQW5J?=
 =?utf-8?B?c0RxM3RzcVg3eWFWSGd5clhxSnhTTGpOZDUvaXVpUmlBYk90QUR0NldjL2hi?=
 =?utf-8?B?RS9OQ2RWaWFYZ0plcVlXTVJ4NSttbTFQcHc0NTVqakRJcjloQmx0QVZEaEJN?=
 =?utf-8?B?QjRROExmN25uVnMxZkJTcFhVUWZiREFRRXJtbURPbm1RdkNDUnBYR2E4RjhQ?=
 =?utf-8?B?YWZtOTRVM24zOW5IWWJIUHVEd0VzQWJOYjNQdmxRMjhZUnlOYXZSSkUrSHdJ?=
 =?utf-8?B?RWtqWW5zd2t6WHFFQzlrOHpwYTR3NDBtSkZzSm5NWnRvNFMrUW1IbnA1Q3l3?=
 =?utf-8?B?MUVEd1FuZk1SUmx3WnBxUGFlMjVMdHVMZ2VsL2lKaU0yY25VMGVPTC9VNElB?=
 =?utf-8?B?eUxXNVhYZXNBYnR6NU5oUTR6Y0trVFJmK2JuUUpWL3hPc00rcVRFQ3NGcXRx?=
 =?utf-8?B?Yjk4SUV5ZEdZU0d4V2U1MG1sSXcrN3JHaEdUcVlGckJ2UFBaN0k5R2l5ckdG?=
 =?utf-8?B?TDlRdWZ1a1Brc2h4S2JOcWtyR054UFFZZzgzNjltRmVYSll2RGRRUjI2eWE3?=
 =?utf-8?B?YUQ1Zk1EYTlkQWcwY0ljcktLSmk4dUdzZ3ZDS2JCbUFxYjRCTUxVNmUzS1Va?=
 =?utf-8?B?K0tjZFBtMGpzR3d6KzFCU012bTJGUmpqSDB0eUY3UGdDczBUeUFjdzZXRjVB?=
 =?utf-8?B?enovZVMxVk1QOStZaTVVdnRsemZCYkQySDNlK2FVajFaSGVWLzA1bG9udHF3?=
 =?utf-8?B?ZlpNK1JWU1FmYVc2YWVNZGd0ZjhaWGQ0VVdDcnhXYng0a2tweEV4VWRjaHRZ?=
 =?utf-8?B?RU5SUkVYSlNpYzVSZVRaaGVHVU4rRDZsaEJBelRTczBjOWNBdnZIVDlicTRu?=
 =?utf-8?B?MzlPdE1OYlNwRzdWMis0RFFZYVhXTEZLYjVHcUV1OFJMRkp1K0NlSFZLcVlK?=
 =?utf-8?B?WDBCc1RMWGpUbVZBbXJCZ1gyWldXMTRoTU5GNUFPeVR0enZmNGpqVjZaNUNr?=
 =?utf-8?B?ZE05QzdiWXBWNmdKQkVDZGJVNlJ1V083NUZUdzJscFBkMnZ5T0daazdmeWNi?=
 =?utf-8?B?bldiRUJRZXBhSlRDZUoxb0wrekN0czZzUk1pYUJZK0FvVktKOXNvVmZSb1lt?=
 =?utf-8?Q?b4LBEnum/7ZWjCiAaIVmFfk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae41cf4f-b1c1-4d7a-367c-08dbcc161805
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 17:59:06.8439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnYEizAM+rxkuIKU33m/dvAi+XK8O5UdXQYeXM7VRjBuinpTS/Jp5LNb1uv880rQZ1/XBqGNNSZbzaxvYx4QA0fbuZc0Pelm0mzlF9bUkUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/21] drm/xe/oa: Add/remove config ioctl's
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

On Tue, Sep 19, 2023 at 09:10:33AM -0700, Ashutosh Dixit wrote:
>OA configurations consist of a set of event and counter select registers.
>The add_config ioctl validates and stores such configurations and also
>exposes them in the metrics sysfs. These configurations will be programmed
>to OA unit HW when an OA stream using a configuration is opened. The OA
>stream can also switch to other stored configurations.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I think the plan was to do away with the differentiation of flex/mux/b 
even from the implementation, otherwise this lgtm,

Umesh
>---
> drivers/gpu/drm/xe/xe_device.c |   4 +
> drivers/gpu/drm/xe/xe_oa.c     | 379 ++++++++++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_oa.h     |   5 +
> 3 files changed, 387 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 2c3dac6340f04..aacca14e52b11 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -114,6 +114,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>+
>+	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
>+
> };
>
> static const struct file_operations xe_driver_fops = {
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fae067e73c027..1963bc6fad10e 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -12,8 +12,8 @@
> #include <drm/drm_drv.h>
>
> #include "regs/xe_oa_regs.h"
>-#include "xe_gt.h"
> #include "xe_device.h"
>+#include "xe_gt.h"
> #include "xe_oa.h"
>
> static u32 xe_oa_stream_paranoid = true;
>@@ -33,6 +33,376 @@ static const struct xe_oa_format oa_formats[] = {
>
> static struct ctl_table_header *sysctl_header;
>
>+static void xe_oa_config_release(struct kref *ref)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(ref, typeof(*oa_config), ref);
>+
>+	kfree(oa_config->flex_regs);
>+	kfree(oa_config->b_counter_regs);
>+	kfree(oa_config->mux_regs);
>+
>+	kfree_rcu(oa_config, rcu);
>+}
>+
>+static void xe_oa_config_put(struct xe_oa_config *oa_config)
>+{
>+	if (!oa_config)
>+		return;
>+
>+	kref_put(&oa_config->ref, xe_oa_config_release);
>+}
>+
>+static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
>+{
>+	static const struct xe_reg flex_eu_regs[] = {
>+		EU_PERF_CNTL0,
>+		EU_PERF_CNTL1,
>+		EU_PERF_CNTL2,
>+		EU_PERF_CNTL3,
>+		EU_PERF_CNTL4,
>+		EU_PERF_CNTL5,
>+		EU_PERF_CNTL6,
>+	};
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(flex_eu_regs); i++) {
>+		if (flex_eu_regs[i].addr == addr)
>+			return true;
>+	}
>+	return false;
>+}
>+
>+static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
>+{
>+	while (table->start || table->end) {
>+		if (addr >= table->start && addr <= table->end)
>+			return true;
>+
>+		table++;
>+	}
>+
>+	return false;
>+}
>+
>+static const struct xe_mmio_range xehp_oa_b_counters[] = {
>+	{ .start = 0xdc48, .end = 0xdc48 },	/* OAA_ENABLE_REG */
>+	{ .start = 0xdd00, .end = 0xdd48 },	/* OAG_LCE0_0 - OAA_LENABLE_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_b_counters[] = {
>+	{ .start = 0x2b2c, .end = 0x2b2c },	/* GEN12_OAG_OA_PESS */
>+	{ .start = 0xd900, .end = 0xd91c },	/* GEN12_OAG_OASTARTTRIG[1-8] */
>+	{ .start = 0xd920, .end = 0xd93c },	/* GEN12_OAG_OAREPORTTRIG1[1-8] */
>+	{ .start = 0xd940, .end = 0xd97c },	/* GEN12_OAG_CEC[0-7][0-1] */
>+	{ .start = 0xdc00, .end = 0xdc3c },	/* GEN12_OAG_SCEC[0-7][0-1] */
>+	{ .start = 0xdc40, .end = 0xdc40 },	/* GEN12_OAG_SPCTR_CNF */
>+	{ .start = 0xdc44, .end = 0xdc44 },	/* GEN12_OAA_DBG_REG */
>+	{}
>+};
>+
>+static const struct xe_mmio_range mtl_oam_b_counters[] = {
>+	{ .start = 0x393000, .end = 0x39301c },	/* GEN12_OAM_STARTTRIG1[1-8] */
>+	{ .start = 0x393020, .end = 0x39303c },	/* GEN12_OAM_REPORTTRIG1[1-8] */
>+	{ .start = 0x393040, .end = 0x39307c },	/* GEN12_OAM_CEC[0-7][0-1] */
>+	{ .start = 0x393200, .end = 0x39323C },	/* MPES[0-7] */
>+	{}
>+};
>+
>+static bool xe_oa_is_valid_b_counter_addr(struct xe_oa *oa, u32 addr)
>+{
>+	return xe_oa_reg_in_range_table(addr, xehp_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, gen12_oa_b_counters) ||
>+		xe_oa_reg_in_range_table(addr, mtl_oam_b_counters);
>+}
>+
>+/*
>+ * Ref: 14010536224:
>+ * 0x20cc is repurposed on MTL, so use a separate array for MTL.
>+ */
>+static const struct xe_mmio_range mtl_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },	/* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },	/* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x38d100, .end = 0x38d114},	/* VISACTL */
>+	{}
>+};
>+
>+static const struct xe_mmio_range gen12_oa_mux_regs[] = {
>+	{ .start = 0x0d00, .end = 0x0d04 },     /* RPM_CONFIG[0-1] */
>+	{ .start = 0x0d0c, .end = 0x0d2c },     /* NOA_CONFIG[0-8] */
>+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
>+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
>+	{ .start = 0x20cc, .end = 0x20cc },	/* WAIT_FOR_RC6_EXIT */
>+	{}
>+};
>+
>+static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
>+{
>+	if (oa->xe->info.platform == XE_METEORLAKE)
>+		return xe_oa_reg_in_range_table(addr, mtl_oa_mux_regs);
>+	else
>+		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
>+}
>+
>+static u32 mask_reg_value(u32 reg, u32 val)
>+{
>+	/*
>+	 * HALF_SLICE_CHICKEN2 is programmed with a the WaDisableSTUnitPowerOptimization
>+	 * workaround. Make sure the value programmed by userspace doesn't change this.
>+	 */
>+	if (REG_EQUAL_MCR(reg, HALF_SLICE_CHICKEN2))
>+		val = val & ~_MASKED_BIT_ENABLE(GEN8_ST_PO_DISABLE);
>+
>+	/*
>+	 * WAIT_FOR_RC6_EXIT has only one bit fullfilling the function indicated by its
>+	 * name and a bunch of selection fields used by OA configs.
>+	 */
>+	if (REG_EQUAL(reg, WAIT_FOR_RC6_EXIT))
>+		val = val & ~_MASKED_BIT_ENABLE(HSW_WAIT_FOR_RC6_EXIT_ENABLE);
>+
>+	return val;
>+}
>+
>+static struct xe_oa_reg *
>+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>+		 u32 __user *regs, u32 n_regs)
>+{
>+	struct xe_oa_reg *oa_regs;
>+	int err;
>+	u32 i;
>+
>+	if (!n_regs || WARN_ON(!is_valid))
>+		return NULL;
>+
>+	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
>+	if (!oa_regs)
>+		return ERR_PTR(-ENOMEM);
>+
>+	for (i = 0; i < n_regs; i++) {
>+		u32 addr, value;
>+
>+		err = get_user(addr, regs);
>+		if (err)
>+			goto addr_err;
>+
>+		if (!is_valid(oa, addr)) {
>+			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
>+			err = -EINVAL;
>+			goto addr_err;
>+		}
>+
>+		err = get_user(value, regs + 1);
>+		if (err)
>+			goto addr_err;
>+
>+		oa_regs[i].addr = XE_REG(addr);
>+		oa_regs[i].value = mask_reg_value(addr, value);
>+
>+		regs += 2;
>+	}
>+
>+	return oa_regs;
>+
>+addr_err:
>+	kfree(oa_regs);
>+	return ERR_PTR(err);
>+}
>+
>+static ssize_t show_dynamic_id(struct kobject *kobj,
>+			       struct kobj_attribute *attr,
>+			       char *buf)
>+{
>+	struct xe_oa_config *oa_config =
>+		container_of(attr, typeof(*oa_config), sysfs_metric_id);
>+
>+	return sprintf(buf, "%d\n", oa_config->id);
>+}
>+
>+static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
>+					 struct xe_oa_config *oa_config)
>+{
>+	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
>+	oa_config->sysfs_metric_id.attr.name = "id";
>+	oa_config->sysfs_metric_id.attr.mode = 0444;
>+	oa_config->sysfs_metric_id.show = show_dynamic_id;
>+	oa_config->sysfs_metric_id.store = NULL;
>+
>+	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
>+	oa_config->attrs[1] = NULL;
>+
>+	oa_config->sysfs_metric.name = oa_config->uuid;
>+	oa_config->sysfs_metric.attrs = oa_config->attrs;
>+
>+	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+}
>+
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct drm_xe_oa_config *arg = data;
>+	struct xe_oa_config *oa_config, *tmp;
>+	struct xe_oa_reg *regs;
>+	int err, id;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_oa_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
>+	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
>+	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
>+		drm_dbg(&oa->xe->drm, "No OA registers given\n");
>+		return -EINVAL;
>+	}
>+
>+	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
>+	if (!oa_config)
>+		return -ENOMEM;
>+
>+	oa_config->oa = oa;
>+	kref_init(&oa_config->ref);
>+
>+	if (!uuid_is_valid(arg->uuid)) {
>+		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
>+		err = -EINVAL;
>+		goto reg_err;
>+	}
>+
>+	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
>+	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
>+
>+	oa_config->mux_regs_len = arg->n_mux_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_mux_addr,
>+				u64_to_user_ptr(arg->mux_regs_ptr),
>+				arg->n_mux_regs);
>+	if (IS_ERR(regs)) {
>+		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
>+		err = PTR_ERR(regs);
>+		goto reg_err;
>+	}
>+	oa_config->mux_regs = regs;
>+
>+	oa_config->b_counter_regs_len = arg->n_boolean_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_b_counter_addr,
>+				u64_to_user_ptr(arg->boolean_regs_ptr),
>+				arg->n_boolean_regs);
>+	if (IS_ERR(regs)) {
>+		drm_dbg(&oa->xe->drm, "Failed to create OA config for b_counter_regs\n");
>+		err = PTR_ERR(regs);
>+		goto reg_err;
>+	}
>+	oa_config->b_counter_regs = regs;
>+
>+	oa_config->flex_regs_len = arg->n_flex_regs;
>+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_flex_addr,
>+				u64_to_user_ptr(arg->flex_regs_ptr),
>+				arg->n_flex_regs);
>+	if (IS_ERR(regs)) {
>+		drm_dbg(&oa->xe->drm, "Failed to create OA config for flex_regs\n");
>+		err = PTR_ERR(regs);
>+		goto reg_err;
>+	}
>+	oa_config->flex_regs = regs;
>+
>+	err = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (err)
>+		goto reg_err;
>+
>+	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
>+	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
>+		if (!strcmp(tmp->uuid, oa_config->uuid)) {
>+			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
>+			err = -EADDRINUSE;
>+			goto sysfs_err;
>+		}
>+	}
>+
>+	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
>+	if (err) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		goto sysfs_err;
>+	}
>+
>+	/* Config id 0 is invalid, id 1 for kernel stored test config. */
>+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 2, 0, GFP_KERNEL);
>+	if (oa_config->id < 0) {
>+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
>+		err = oa_config->id;
>+		goto sysfs_err;
>+	}
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	return oa_config->id;
>+
>+sysfs_err:
>+	mutex_unlock(&oa->metrics_lock);
>+reg_err:
>+	xe_oa_config_put(oa_config);
>+	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
>+	return err;
>+}
>+
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file)
>+{
>+	struct xe_oa *oa = &to_xe_device(dev)->oa;
>+	struct xe_oa_config *oa_config;
>+	u64 *arg = data;
>+	int ret;
>+
>+	if (!oa->xe) {
>+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>+		return -ENODEV;
>+	}
>+
>+	if (xe_oa_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>+		return -EACCES;
>+	}
>+
>+	ret = mutex_lock_interruptible(&oa->metrics_lock);
>+	if (ret)
>+		return ret;
>+
>+	oa_config = idr_find(&oa->metrics_idr, *arg);
>+	if (!oa_config) {
>+		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
>+		ret = -ENOENT;
>+		goto err_unlock;
>+	}
>+
>+	WARN_ON(*arg != oa_config->id);
>+
>+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>+
>+	idr_remove(&oa->metrics_idr, *arg);
>+
>+	mutex_unlock(&oa->metrics_lock);
>+
>+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
>+
>+	xe_oa_config_put(oa_config);
>+
>+	return 0;
>+
>+err_unlock:
>+	mutex_unlock(&oa->metrics_lock);
>+	return ret;
>+}
>+
> void xe_oa_register(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>@@ -258,6 +628,12 @@ int xe_oa_init(struct xe_device *xe)
> 	return 0;
> }
>
>+static int destroy_config(int id, void *p, void *data)
>+{
>+	xe_oa_config_put(p);
>+	return 0;
>+}
>+
> void xe_oa_fini(struct xe_device *xe)
> {
> 	struct xe_oa *oa = &xe->oa;
>@@ -270,6 +646,7 @@ void xe_oa_fini(struct xe_device *xe)
> 	for_each_gt(gt, xe, i)
> 		kfree(gt->oa.group);
>
>+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
> 	idr_destroy(&oa->metrics_idr);
>
> 	oa->xe = NULL;
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index ba4ba80fd34cb..79f77f445deb0 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -12,7 +12,12 @@ int xe_oa_init(struct xe_device *xe);
> void xe_oa_fini(struct xe_device *xe);
> void xe_oa_register(struct xe_device *xe);
> void xe_oa_unregister(struct xe_device *xe);
>+int xe_oa_ioctl_version(struct xe_device *xe);
> int xe_oa_sysctl_register(void);
> void xe_oa_sysctl_unregister(void);
>
>+int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>+			   struct drm_file *file);
>+int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>+			      struct drm_file *file);
> #endif
>-- 
>2.41.0
>
