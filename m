Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5EDC61DA3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 21:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9CB10E0C0;
	Tue, 21 Feb 2023 21:16:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242D10E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677014216; x=1708550216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3n4oV921ee2YnDuWviq7nsgs4mXSx+c/9dWBZrRSosQ=;
 b=W7HRiDTtnTWryjxsGlCnd3MiJl2oEyQvTAEgLMHqJ4Jk3ZjiDVvPv56q
 ammQAOtcDCMKbgeRm2JbVI79afcAudihVsT3GEBNbPF9F7v9GXn8fOPh+
 UBEm1S2sfZS1gk0s37Jx530d9wCHeWK/czjls80TeHC/lLutvw0rtWhlH
 LCbUs3cFh3KiY9k2R4v97nb/Ec3Z+eqDd4ier9a5wSw1N1wemZ6YW9yIi
 qZXHRdJ3ZLlIrbOAxRlcSlHlAihSMT18rFBLmthIiJ/wOmlMMzpclDHTN
 1TWpFWPzH6UV0O+P2hWLE4DfM0Zp32hQ+CtxIXfGkUAzHYtLTH6Fdj0q8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="320894477"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="320894477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 13:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="665115785"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="665115785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 21 Feb 2023 13:16:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 13:16:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 13:16:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 13:16:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzoReNiq38M7ZTuo+Ld8v2pEvCtiWGN0y0YswxRhJ4K7f7DvaZAVErAtrUSClBOOBq5wdg7TpUgY8C/1b8M14g/Ed9NI1+HAB5UYx+Lk5m7H0RgpRo/GjZaHi5W0nSjsvS+kJHNkI958B16q1kLC6ET0Y37ikjYFaSLgvYnb+MfPwNbJwRsU8DUMN2fKrCujx4B0gZbjEs2k36XP9q6k4sYlJtNulaC7e5IinDfkwCUkMYt4WuyiWNRFi7+HxXfnZgs+F1cL0WAEReK8CimNFamOJivH4dwzL5LLaGDbTxMZYaijXr+qMkDxWYT6fKFpOnkMI1J+9W2z7DVtiQXv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmHnhruDFUEyatbiCVC2GpIc7fkmCeKpOSMbwT9Le+o=;
 b=WyM2MyNZM25RHp48d1w4+0/6qrnNB91rXEka/tftSokgCG2Rdt8zu94IJcXeDAX0g+7RIcQ22ay5x0IuEG+Bh9Dy7PE1B3zPSeDJMs1A7MCjw0YKtoSTI3HIZ22EtA8nGvioF4Uy3EGuyR9YO6f3Q9ipk9qozAFWafa/t2Z0Nm8qoQILA6om9cUyT/30Nbk4ZfBAHYxxXQd508gpU6AijWkb/EKevjZWOvQaFcBQuVY0F1R2WzvEeeMRbyMLUGZfSUbWU2HoncKARDR0gH9lBk2/fUdY2qpr6AO+XIZ2seaK3McLuQx/3qra3a2FyXjOhZJoUykt7803eof+baF2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 21:16:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 21:16:52 +0000
Date: Tue, 21 Feb 2023 13:16:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230221211649.novuq4b7ur2qlrs3@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230221145221.105361-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230221145221.105361-1-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 78db218d-e643-490d-52f7-08db1450f3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oa++McqEYCGNbfJSI4dskwgh6VihRTWXiLPRqZi5StWSZuLXM+BcFinQ6/GtghkBbaUEOa6Yv1iKtp7mz/OdnTcsdi+mvD4N4rL9FF2L4sjKpn7X9IA3gE1+1TSkf9dmCfbR9AFZ8f+VA79wW4pj0GDSJC02+qT/SFyouSElbJCp6dDMrWe5x99RL/C9H4hh0vte+up/DoPr8yqNfO0fFaupYbUKMwv1Qedz/XZl4kOTdoyRyKxEZNDkZEOJ9pWYM+YSjSqCY7aK9jaJbZfD63dWa5zlnjb886wWTZAruzhqZAftJ8rVptxWzx5IiZHXzwS63d2hFeqn/PlrOya4Qt/q22x4YjLIxB90ip0RcVUIRH0dtTkRHhvEs4MqEBu1q8UrH5bmojdpgOxQvaSdtptxmNmtWbN0MXGZzdMRJwpZmAp8Gpdsrj7jtQezo3E7Wqne/DpA4klUM59DZMLjMPJyLLuA6NOo/3OQTWQK2XZELxBNOKmsGyAMBSQKqqhpe+x5JHvVmITO3HK0N9g14sieyqENEEpXberc8f7ZAxf0sv43cyoZdCln4lFaqzm8aiV5I2RJmSA7XnOu7QinRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(107886003)(2906002)(83380400001)(38100700002)(82960400001)(86362001)(66556008)(8676002)(66476007)(4326008)(66946007)(478600001)(5660300002)(8936002)(6862004)(41300700001)(1076003)(186003)(6512007)(6666004)(6506007)(26005)(6486002)(966005)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4dw3BTBci8rTDOmn5aL9yU3QoyAXuV55HWgSreiJptQq4l73vHY1Y9bZEW5?=
 =?us-ascii?Q?7HL2hltfh4KBH4eMhc5koM1ZoyY+I1ImNUITvRO0nyIyyG15zDpqWKDMLGR9?=
 =?us-ascii?Q?+w69tMP1mkdryKoqfAxsXWcMU7yX4T3N26iMvzTTFJHxezJUPQOwPJCGoAP0?=
 =?us-ascii?Q?qGtdmUCfMi4xWH7rEteD50DSl0g0T56sCCobFW6qbsRUO9c/X08EAvyZI5xv?=
 =?us-ascii?Q?hNhxsr+bJcGK0ZCxjlegFrvKE1QIyUXTZSVB9B6UbRfByD2udyOYSuhdJ7Lf?=
 =?us-ascii?Q?RI6/6XjNZ7kAXE7EEAwx1WOfYwoqW1PDgPFfI1ZF9Jrcn89Q4+s0Ddep4seZ?=
 =?us-ascii?Q?a0XJQevq/Dm9HHDb1u0aJXZgugn+Un6ie3QAAsNO9smv+rS8b46JVY4V4dXU?=
 =?us-ascii?Q?ycHevgNM+X1XbWbdbTZcTEjc3syrlc8gppJ/il+M5KQiMEkgKvbpYJsiPTDJ?=
 =?us-ascii?Q?rZtohdYc6D9gXUeduLbVUnd+CQfkP7IkhY+iXh0dYCbGQKFtBAN2m2FYyYBY?=
 =?us-ascii?Q?6DW5YfmoTi4MH9H/X/+2uqZ6uJ35idJFYn7JbVJgYCRe4t8bikbAde2rkz7n?=
 =?us-ascii?Q?6b7e91PuvoBD3P0y11wMCyMGab8LQ8zf3QgLLHU2j73V4VmnmOAN/db0NbnL?=
 =?us-ascii?Q?m2rwC2rcA/O0q9mkAAUzZCWzd4qTBGbPbHp0o3X7tB9jXQvRQCBQ+GMCD9EI?=
 =?us-ascii?Q?mhPP9W/1Oh/2RmsahJLdcKe/m9VPYfAOl2mxj67g2y8JQnO7xbt6By9KK6wH?=
 =?us-ascii?Q?mKVEniTwtjlFkD/uaw5UIzwN9KntYMDCD3CwNKyYH2DUNlF1g3u/fFtRnziq?=
 =?us-ascii?Q?B5fzM1+uNNB7j3xtBRGsbZWk/b6axrLboedvYGAB6PVngNoyxl0ism+TBHj2?=
 =?us-ascii?Q?psS0zmXUIv+ORtdtumGjqT7yhj7qKHL3hyRMxm86QqAWdNtuXrWadmcow9JI?=
 =?us-ascii?Q?dtdFbA1T5/SqcWPDowHwDcKFxxhaavn9ieFAkbSqKc1+/wcsXhHe0B8GUATQ?=
 =?us-ascii?Q?LLo5Xr9yT0OMVhNJ3LyPTOvIotIpeiuUmXCRtjlHjATnbQ7HIvQDPO0WmMGW?=
 =?us-ascii?Q?R/xgfRr7J7FIi2MCFyObvdV04k4hDfA2XFiunriXqR/tzdtuSgzKuYaMXmRV?=
 =?us-ascii?Q?4q573gHDU5r3CkYe4ADfMMQhG/SA3jDjMVH+yIfKGXHe95+aC09yHLCOjqxW?=
 =?us-ascii?Q?ZE8/qtP7jyX4j/kOQFzv4QY15Byc/8ZW+SGzExcr6j/Y/KmMuK/Euw0DE9vD?=
 =?us-ascii?Q?Ee/IljmzsLnub+jMLJxEIKwETkMOAQGolDj6Bo2sd0ixindImd4LOQUQjuoq?=
 =?us-ascii?Q?GnhJ+wSPYnDnXSAyctE64EL2dVWIiHqhpKDBS2swAN15QCLGrPGSAWOf6WLm?=
 =?us-ascii?Q?VDpH7C0ET/KoPCZnmjqHcT1r1Wen7PJVP8FD0qeGA2u/hq6zEeET8aTg1x83?=
 =?us-ascii?Q?WAmV4Zv1B4lv4KYgXK5Ljn1gejIj5RKBOK0gzsK3RSbUcUiJfDNcuS19Wo9V?=
 =?us-ascii?Q?V3+YbC2i28T+kiu9v27aCoe0RL2vMTcvh/dwU/QPGiv+CqLbQ5Lca5TJQcZX?=
 =?us-ascii?Q?G2qJjPC8bV6hEgvLhc3sd29P74wLz8ykfUcVj9dsIYBWbuWPsInVqs5OFFMs?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78db218d-e643-490d-52f7-08db1450f3e2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:16:52.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DrvtJNvcGJm9jLpWNcDGnWG+o9fdJPaqet5BOPYmWJHueBwX5zTA9cRjVx4rxoXGCk6RlQ0o5jh/dRY7XG4ZsWr9q+m7Z9SNiSfvUU2frQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: give the core kernel its rpm ref
 back
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

On Tue, Feb 21, 2023 at 02:52:21PM +0000, Matthew Auld wrote:
>In local_pci_probe() the core kernel increments the rpm for the device,
>just before calling into the probe hook. If the driver/device supports
>runtime pm it is then meant to drop this ref during probe (like we do in

s/drop/put/ to be consistent with the terminology?

>xe_pm_runtime_init()). However when removing the device we then also need
>to give the reference back, otherwise the ref that is dropped in

give? we are calling pm_runtime_get_sync(), which  would be "take".

>pci_device_remove() will be unbalanced when for example unloading the
>driver, leading to warnings like:
>
>    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!
>
>Fix this by incrementing the rpm ref when removing the device.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 1 +
> drivers/gpu/drm/xe/xe_pm.c  | 7 +++++++
> drivers/gpu/drm/xe/xe_pm.h  | 1 +
> 3 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 25598de3a1fc..85d337cd8fbe 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
> 		return;
>
> 	xe_device_remove(xe);
>+	xe_pm_runtime_fini(xe);

after xe_device_remove()? Wouldn't that end up calling the last
drm_dev_put() and thus triggering all the drmm_* releases?

Lucas De Marchi

> 	pci_set_drvdata(pdev, NULL);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 44c38e670587..73d81621d960 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -128,6 +128,13 @@ void xe_pm_runtime_init(struct xe_device *xe)
> 	pm_runtime_put_autosuspend(dev);
> }
>
>+void xe_pm_runtime_fini(struct xe_device *xe)
>+{
>+	struct device *dev = xe->drm.dev;
>+
>+	pm_runtime_get_sync(dev);
>+}
>+
> int xe_pm_runtime_suspend(struct xe_device *xe)
> {
> 	struct xe_gt *gt;
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index b8c5f9558e26..6a885585f653 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
> int xe_pm_resume(struct xe_device *xe);
>
> void xe_pm_runtime_init(struct xe_device *xe);
>+void xe_pm_runtime_fini(struct xe_device *xe);
> int xe_pm_runtime_suspend(struct xe_device *xe);
> int xe_pm_runtime_resume(struct xe_device *xe);
> int xe_pm_runtime_get(struct xe_device *xe);
>-- 
>2.39.1
>
