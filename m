Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E41BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 17:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF7E10E041;
	Fri,  1 Dec 2023 17:49:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BF610E041
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701452957; x=1732988957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OvyXjfbjvnCXlThWUmX+5HnPwihYTjDCX0LyRFmE/gI=;
 b=MnH2GaMr8EpqL1av6VhCLhumcrmF9F6OvanOI2T8SXZllDZp9/RmkxEV
 RnFZG+iAXCS+H7QfOMtZbNEA1wBEM4tPo5pf7V3Wkbk6TlPKm+vxdmObC
 FgEGzoftFTWdJXpYgFOOEYlUvFey+NTrr3AMZq/RIqD257t2DX+xcv1OW
 p+FZOQ9zn/voQmQSTzpPH6Cd0TS9FHVkOM/D7Ng+lEz2YrfGFDpiCi6B/
 mHw97heDXk7RKA/6tNDqXMJFbbbPVt23EEeZJY8GwCbt3xp3gNVZ6STRu
 D1zU/gLdG3ZCHLqSiRFPoMokLxHeEhICZ7y3TCs8XxCn0Tu/g2i4KbEZb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="540522"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="540522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 09:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="746088037"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="746088037"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 09:49:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 09:49:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 09:49:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 09:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf8F0WCIiR5KEn1o9yfHBta2XjVmMyxVLrg8nYvS2pLYVIzHjHA1N4BVC5Z//oc0nBv4AlGWeQDZ8HZOPBaQI/qhTyyhO2ZwjSi8eh5dIpzRd7b3HHSaJ46p7HuptzWRlTS9guDZJsUj4S1+JGwccwkbOznLWeMjeqQBM0DU/YStXEuS7fCVLAB3kvYHLFLAloyahtm50FW7Uylhltbr/gpGtQjZgM36qqbUtVkxUpNVdPo/WNL8LfptESE9JSKjiHu3kJk0iiPJXocusuNbR1ahip+vMOvnjoNBVFHpq3IurOkdz2J7gi3RcNfO3Yaa3tH8JLZOE/dsUf8G7iA3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25nMylkdTvXjPPbmRm7AwV23E9fPj7J8k/cKSplHMAY=;
 b=GjPTUAK/abE0RMyYgQMNaFi+1Dg6xXZJNI3QEVYdfxjLnmquPxXfD6q0FCHaLhRGuEUekUgs7aKuzcGdzNB/kyOzHgfcxknAMQK/60byi9pV4CA4NqDYsFj8VC4CtaPsJIPowVQzAFgDCSMfz0j2Ee9PeFfbPATtN9f5rvj/eA9PIS6m3LADJ8OflvpkpD7x1sM/MMHZsT39pjwJvIvWgRT80dmrtj20x+oDU1YsI8oTm9g3IiEwx9MzHRt/2oJPIYL7A5tKVIovNnrk15nsXox8E8BBYBi+adz0U5g0UItIYOUEWofdf8udyHbpgPOI0YtgQaRGd/38LikHOEat2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Fri, 1 Dec
 2023 17:49:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 17:49:12 +0000
Date: Fri, 1 Dec 2023 11:49:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <3lijdior6jvnimsuugd7gp2tkctevsgtsgooygbc436gnnt4tx@cqfypscfji7r>
References: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BYAPR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:74::41) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: ec59a779-01c1-423a-7ffe-08dbf295d3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Wc8R2yt3Xx0v57Aia6AgEtJqVjGkkMvBzR4h3SbvMgj7WpzWCZq/n9BPQy6klLyW0ErrT2kVSk/Yw1G0xxQycLH/QgejqPdB6BOAJh09QQ0TY/cXXMR6DhckB7s+Tlkz+yd2eRKukv2EYLuD0I6RQwxrwrYvn7wEhY+LqQwPxeVVcZn37g65aRIl0iajCO1mwcl9BgttS5xNMwn7N6dW8QOdieSDjiB09kM/3M3u663P7pB4TTrqi7lSfKzba7p61bg7Bt7wuX3nfohTOztWNclgYIidarnpIvfscIhlQLxdGvE5rrTjKE12WRoeR9Wehg2jU313s5T5ACCyPgCLI6LO8xVicSA21M9RxOra0GG5hGGpwfAK6APrVO8ttEpg1zwgzcTCRn+Cn7vk9BmSYTpKUfkgcS1lzIh16siTvFMlTaAOwTLjp20EJNuxMpamB1QGQKwhJlqa2Y1NVTxpSoxtFsEl4SbD8o+nkyHw2XMERKMQdsLY+wqeoW6vCVIMTksajqI4DwPgCtPheN1c6ABvcCoq5s7zb5TF4vb/eE2xxMIA6F7/vu22mcYP9GL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(82960400001)(26005)(6486002)(478600001)(33716001)(107886003)(9686003)(6512007)(6506007)(66556008)(8936002)(66476007)(6862004)(66946007)(6636002)(316002)(4326008)(8676002)(38100700002)(5660300002)(2906002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I4qBbDvNqvuT52vChkKCkzLpVEHXvLtha67gfpSAlZAPun6ou4nv9GMxs6d?=
 =?us-ascii?Q?DcmGf4qPMzfKyxdUbI/diTMAX8a3sXN6lVWTn8nfSORS6NlCWlRoDWzX9caT?=
 =?us-ascii?Q?oSjBgtWQBgNIyienwHslHy+uiN9ERfnfjLZlTiaRG93rZF6tBfebnQALY81q?=
 =?us-ascii?Q?/z7apHW2UYdfGcYtMLOJrcJonQP5SZXzYgy+A5ZIAyHJV6M6butvZt+kmrqi?=
 =?us-ascii?Q?M0py0nl91jklhNaHF6RY/c41ieBHaUq7s0XtdGhG7P+YaXc9lobbE5pnuyts?=
 =?us-ascii?Q?AHrek7Rogz2O4iN6wLHGweAYFVlYs6RJqH5J1moKqVAPfgm8gFoejp6OCPMh?=
 =?us-ascii?Q?rbqUTOcVOL+9GPxcrUCCnZSncHxOavDq1iKZj4B4hY+sUJI/lvFG7JnZGD76?=
 =?us-ascii?Q?QBIBAHTLn8qp4qMG+DKeJ0qwIe+S6No/9BDNtg4RCRuRQjeor+zvXJZtUuSP?=
 =?us-ascii?Q?x7wbiLtcySC9jSD0NxLdkgZtPW1pxPaNzVIUBL7XZ26rYsiTUduMe+nEzAAD?=
 =?us-ascii?Q?gP9PRIF3kuzlsVot0z1LVi0Z64aJU+UjFbAZ7Q6DfOMDPue0KomtTGlflPD0?=
 =?us-ascii?Q?kBMNj6No4UYCOISH78H85s5H8jINkuawhfzqseHJnCBHtMbe2L9p/7uVqF86?=
 =?us-ascii?Q?C8U9dWbvFlz9y16/h0A4MfzfW/jt3JhSGfoJGs4/wDSVwoZi3vafohRYRR76?=
 =?us-ascii?Q?dcI5CQhXqtv7RQU2R3iogVwjtHpYhielx5FIhrpJq0etZrHqAjfk1UjaLPF5?=
 =?us-ascii?Q?VGS0sRj0PvP2iE6ta5xb3j9qxlx9+jQXUN5FIu5UYHYD+7y7fpkqpL/AawGU?=
 =?us-ascii?Q?sX2BHLSsP2suly6oSYn/DPpycooI7yRkZpQHp5lZaS+JQsxTnsIVMXmYAi54?=
 =?us-ascii?Q?rjIiGtiAPUezFMcbS42bYSGnZLN26TGGFLZtd6E2bg5obkvI+W6S87Rwi/WJ?=
 =?us-ascii?Q?imRSAbrgvvxF3EaNZuwT9pXw4CWviwCq/+MRaUINL77jO0ueYSezld0oaSA5?=
 =?us-ascii?Q?c6wrcyGKAfWunj8ICfT+ys5soXt9Eg9cgtZcAe7sASh+CDHZ719t+/7pzenB?=
 =?us-ascii?Q?w1McVgO9zTFmM+s39X2ABJV19zCDosH2onEFsJgXIN7xJbz7QaBsHzNaOhff?=
 =?us-ascii?Q?QwXh3vytFlmyZSWoXX0G0LIQrmiJFQdMQxMSdYhCBHc9eF40xDUnyWI0/Rs4?=
 =?us-ascii?Q?lbZdiv0ErYOpcllmzeLKt0lK/epZ7ImJB6qs/6wKQqBDd6zclSU8a2T656Tj?=
 =?us-ascii?Q?KeAGg1hbXvkZ/LKiLBz+UWUJG/RU1s+0E6M8LfB2XYoqG3iKhzgMa0rPdHU9?=
 =?us-ascii?Q?LKx+rCcorIJlvvCC5EKRcYYuh8e9UR73Un/+/6rFdvE+RiDU9IA7p4286QxW?=
 =?us-ascii?Q?7YPl0z5rMvHMNojsQQg27HIX2J38PzCK6yb+rwR56dno6hzE/VwcDuqJb8jC?=
 =?us-ascii?Q?o7fm18VP8mzA7tTb0u6QAOoWLhIcf3X1DdmELN/sMaUynjUjPhAMz6+YoBDr?=
 =?us-ascii?Q?yrmcdl57PgSWl7X3fhyr3LNJnKbslD5q0GuciGkPRTlW+Cz0/3YN88wN0YHq?=
 =?us-ascii?Q?An4MnOZRMwF2XTx3vFbpOteTWiZ4kHNSRdJqgZq05NOIaUb02Cd5OSACtCdy?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec59a779-01c1-423a-7ffe-08dbf295d3f2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 17:49:12.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EraTskQNkZ+lsFbR5LLI5h7b3uB+6f/txAqIHYcLO90jM9GmU47a3N1gFFf+QShDeyX6CsgJjLwm7v7alBK7zGRAz77Jda2qYrdY0OTbZqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Change the name of frequency sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 10:09:14AM +0530, Sujaritha Sundaresan wrote:
>Switching the names of frequency sysfs attrbutes to align with
>required devfreq changes. The name changes are as below;
>
>-freq_act -> act_freq
>-freq_cur -> cur_freq
>-freq_rpn -> rpn_freq
>-freq_rpe -> rpe_freq
>-freq_rp0 -> rp0_freq
>-freq_min -> min_freq
>-freq_max -> max_freq

what's the correspondent igt patch series?

Lucas De Marchi

>
>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
> 1 file changed, 30 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 1943893a3fd7..8233277b76e4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -60,15 +60,15 @@
>  * Xe's GuC PC provides a sysfs API for frequency management:
>  *
>  * device/gt#/freq_* *read-only* files:
>- * - freq_act: The actual resolved frequency decided by PCODE.
>- * - freq_cur: The current one requested by GuC PC to the Hardware.
>- * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>- * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>- * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
>+ * - act_freq: The actual resolved frequency decided by PCODE.
>+ * - cur_freq: The current one requested by GuC PC to the Hardware.
>+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
>+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>  *
>  * device/gt#/freq_* *read-write* files:
>- * - freq_min: GuC PC min request.
>- * - freq_max: GuC PC max request.
>+ * - min_freq: GuC PC min request.
>+ * - max_freq: GuC PC max request.
>  *             If max <= min, then freq_min becomes a fixed frequency request.
>  *
>  * Render-C States:
>@@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
> 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> }
>
>-static ssize_t freq_act_show(struct device *dev,
>+static ssize_t act_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct kobject *kobj = &dev->kobj;
>@@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
> 	xe_device_mem_access_put(gt_to_xe(gt));
> 	return ret;
> }
>-static DEVICE_ATTR_RO(freq_act);
>+static DEVICE_ATTR_RO(act_freq);
>
>-static ssize_t freq_cur_show(struct device *dev,
>+static ssize_t cur_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct kobject *kobj = &dev->kobj;
>@@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
> 	xe_device_mem_access_put(gt_to_xe(gt));
> 	return ret;
> }
>-static DEVICE_ATTR_RO(freq_cur);
>+static DEVICE_ATTR_RO(cur_freq);
>
>-static ssize_t freq_rp0_show(struct device *dev,
>+static ssize_t rp0_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>
> 	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
> }
>-static DEVICE_ATTR_RO(freq_rp0);
>+static DEVICE_ATTR_RO(rp0_freq);
>
>-static ssize_t freq_rpe_show(struct device *dev,
>+static ssize_t rpe_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>@@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
> 	xe_device_mem_access_put(xe);
> 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
> }
>-static DEVICE_ATTR_RO(freq_rpe);
>+static DEVICE_ATTR_RO(rpe_freq);
>
>-static ssize_t freq_rpn_show(struct device *dev,
>+static ssize_t rpn_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>
> 	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
> }
>-static DEVICE_ATTR_RO(freq_rpn);
>+static DEVICE_ATTR_RO(rpn_freq);
>
>-static ssize_t freq_min_show(struct device *dev,
>+static ssize_t min_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>@@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
> 	return ret;
> }
>
>-static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> 			      const char *buff, size_t count)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>@@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> 	xe_device_mem_access_put(pc_to_xe(pc));
> 	return ret ?: count;
> }
>-static DEVICE_ATTR_RW(freq_min);
>+static DEVICE_ATTR_RW(min_freq);
>
>-static ssize_t freq_max_show(struct device *dev,
>+static ssize_t max_freq_show(struct device *dev,
> 			     struct device_attribute *attr, char *buf)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>@@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
> 	return ret;
> }
>
>-static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> 			      const char *buff, size_t count)
> {
> 	struct xe_guc_pc *pc = dev_to_pc(dev);
>@@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> 	xe_device_mem_access_put(pc_to_xe(pc));
> 	return ret ?: count;
> }
>-static DEVICE_ATTR_RW(freq_max);
>+static DEVICE_ATTR_RW(max_freq);
>
> /**
>  * xe_guc_pc_c_status - get the current GT C state
>@@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
> }
>
> static const struct attribute *pc_attrs[] = {
>-	&dev_attr_freq_act.attr,
>-	&dev_attr_freq_cur.attr,
>-	&dev_attr_freq_rp0.attr,
>-	&dev_attr_freq_rpe.attr,
>-	&dev_attr_freq_rpn.attr,
>-	&dev_attr_freq_min.attr,
>-	&dev_attr_freq_max.attr,
>+	&dev_attr_act_freq.attr,
>+	&dev_attr_cur_freq.attr,
>+	&dev_attr_rp0_freq.attr,
>+	&dev_attr_rpe_freq.attr,
>+	&dev_attr_rpn_freq.attr,
>+	&dev_attr_min_freq.attr,
>+	&dev_attr_max_freq.attr,
> 	NULL
> };
>
>-- 
>2.25.1
>
