Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B333EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93A10E360;
	Tue,  1 Aug 2023 08:28:50 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3212910E35A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690878527; x=1722414527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YCnoR+cHX2GpPOyjUpTnlTRyjZIz8Pg0uNtSxe+zn1E=;
 b=PMwh0WtLvAY6kLSVt3D45IJ41baQn6SseHHqkfgIVlRqvovjPJKMfw30
 2Hg5zJ4jLappagCrKgOXUxMmKYWzeg8ovvy2+k9QPVBV0sPxvgb8a6QZT
 u466J3fNoyILe9zv54Iu1tgq4vcRm3IKD6oHI/fxVm9IQtV8rGn8sVCrl
 UiB1u8HlQM5ZEfAotiLMxUAFEvHcoq9vILNQqdoLzv69iOAFoBbWYwhKM
 KR2YvyZaizmOf/Rb2hulVaL3wdLbXqjIwx68wnbpwRA/tqu9j0qlsea1G
 S6ulNuMgc5d/BoDIRB7pdkrd8cLiEpENmmhXvZYRZryGrXMjLBHcJ9QH8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371948746"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371948746"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975202330"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="975202330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 01:28:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:28:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBDiUmS1xk318rjBwvs+jNQVYXAX7eLwoII7yw5PcKLTyCD1GygyUl5zjTRCHdiCWPZFDxDyi6tZeS2GVrdZDW6TIl6KP8GwCzadNkP/08jEaxd/4tRzc1CHfY8JnszTfXVvcUdVzwXU7HKJLXEmzjwEVkWrgaDNIQex+Eo8Y8/4P9GEpOBJJg+vNZqHrsZgqyMhMwcIXLMN2alU6+UJnwbUuJfocCZsjDgK/jfvBMXzUypSHyU6XDZwiLYun3xtDc9a0LZZPQGIdoskF6ZEychAyKFbVgjkNxwE82HpLTVWyELpjSJuNPe7SZh5eB6He+VoQ5nej05+LXVipn6xQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI3P6htNUP6mAgSS+8W9QM02NVimZl19HdhLtT7v/Uk=;
 b=RY9h1ixo29we3+iVbevGJ5FliZa3TdE8/8dWlFg1QOJvTpStgnKQbGnBVBljCaiOyV5nANCEUrf5zvW8VVnMswr0zK1SeIR76LjtPCUMkiAVtRUOshehl1E/iQe9Nz+x/6bJzCFa2gsbZM1vf7FRqkvY4Iq/FzRCeKonCi7g1W4kqHoPiUlqD6KVTaaYB3Q+xDA5abmBcHJpq5rWletG+B7UalNfw3ZttBRZ2kTd0QFNy71svSYRAFSyAc5TkU4mfdKqxKavz0oI8KMfM76LS4t5YwUw/OCSaYJ23IZNUZmJAxq38mK8jTQ7KGTa1EvU4FjMlzJ9cJximia27vasnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:28:38 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:28:38 +0000
Date: Tue, 1 Aug 2023 01:28:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMjCM/fuzN21BF5V@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4929c7-79f7-4ea0-d677-08db92694e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXTFD2yrd+8+VhnvpvF0zSKTk0EX4QYcyhERgSFuh/pO8INtDUWQueYqqAv93lvb3M8pCMzSzaKpyKqbudRumWgYBISO7PBd1EFaew5hBfH1/UUupTzsxAnscnrbn5x4MpITUfu8A1CZZHmo7nxUxaDV3CyapQr84bF0ZF3Cry5noN9VuDo24831amt+9N9gMaoHUwHFuV9HbGiwaGiTRIDGyN83ZBJpEFQ/4zTI3uLU60MoWsD8cYdRLak9RummCp4cyBP2QpXQgoHgpBgltRhpKzPtflvUX10qmheSnNjnviVWdycwmrP+e2AeDZyWV7SlxNsWOxWRHRPhAHqBBofPQpC6S8fj0VOoQMBzQnhe+DoKLBsHm5fTw/Gy7yK6qIMAsXKTndA/L5LARB2huVGdPwe93vDPnQosPA0KdsbdB1cv6ZJurSWLpRho6X6tmfScSGulStmVZY1LDtYsAw4k4I1snBD/QRy2AqmE5fXOsiFqeyBunAfGsY7jkGExJIlFFfqLZdabCJHtxa2D7PMUYf06iuic7Og0JOvupIEknkZOkyO5tQl1jNVnb3Da
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(6486002)(6666004)(44832011)(186003)(107886003)(26005)(6506007)(8936002)(8676002)(6862004)(5660300002)(6636002)(4326008)(66556008)(66476007)(66946007)(2906002)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ftPz6fPEE3q/+gWGsobnLYOkNWvBwoRxK5HbS28mLnlvbBLtgtNWozUYdG6?=
 =?us-ascii?Q?VG+LWWn73xx90oV1/jjkhnUl8K46Tt9j2IHfan9GAIRAIc7wD0JtPOHv99VG?=
 =?us-ascii?Q?mxdfQBee479/SUlN7WEv9AK3tBtDay/4bdIAmZhOoizRGkZHJS3FC+aRyYsi?=
 =?us-ascii?Q?i/nmJvZFxOP9K5cXztJKBt49kBgE4caH4B72b55ZsrxbfSmd/26KIIOKWXFm?=
 =?us-ascii?Q?7SHc+dbmw3y1012EYZSk/s4DhuCEEGUrVG7uSV53zKcL2QNBkIbbzz3P7SDm?=
 =?us-ascii?Q?4xiXgNSM3vhblykAiUwDO81hkO+e2MlWRWYXUaz5cbWlgnioS7R0Mh0JMjIS?=
 =?us-ascii?Q?8RJZT9NqWqtDrvcMkS7fI6nZpbRwb4ja8qJycgah5B1uTjFmuDlgw32ZDNG3?=
 =?us-ascii?Q?p46mc0kpu2jjBoeFiMl5xXbQSYqYJPm86oF9zhCSO6C9hD23tmkqlibKEmMA?=
 =?us-ascii?Q?NuF8WqNY+5OxYPV8mN6GxZOs1KBGfpywgFfGvWq0U5Mkl2cfW5jwFLGwCZLf?=
 =?us-ascii?Q?xgaqxn0XCydO5QYbx2hJ6HIiyl+skQhArmUlpHp6YCTJwPzVYzCR5/Wxdrnz?=
 =?us-ascii?Q?6fqStyU2a27tBogtb8wu16l/uzx8a5yORWUTldRaipdMv/DOol7yCuGMD4A6?=
 =?us-ascii?Q?fcjXJ1hdMuIWViVEchk9CauB9AgNR/ws4zaedOmEK6m8YzhO9PRst2xruTIh?=
 =?us-ascii?Q?z+vg6lFcwT5cekMmwGNFcAILvSnsQQNlmKq/2MJTatry+bliJ0/ky+6YSucD?=
 =?us-ascii?Q?BNWeEoLKZcJMSMKFLzG/x0h+LZdkWveOBiAnhS7u6TCIAIHVSExaMBSfGBuC?=
 =?us-ascii?Q?EMHsxj3iXgZsClncA+JcIclY+86NCfLcAXe3IUTc2Z+ar7W6SjO0TUFbZUsV?=
 =?us-ascii?Q?n7Mkm7Zg5jhJPz41rMVbtrK02kOQ8ST6X5aywl8DfZZdgiucjvvF/LxL7qIv?=
 =?us-ascii?Q?xF92fPmspKJ6miYHiW8eCAaASXHkfSIwKZayFPAepIQlz8aKBEVwKhhahpN1?=
 =?us-ascii?Q?hvPQwKFWsnzmFzUbKBWGkVDWxmCPIit5YYTB2RKBDcvonnL5S0Ybyk0Ld2Oc?=
 =?us-ascii?Q?+guSm8+EM8Q8+hNUErqBkB/YmtetmWKaBtM3OkmbpauEHyH0vuVF6Au1DICj?=
 =?us-ascii?Q?ue/PI91ToXl6lElOufAL8jM7jwn0LpU7CB3CE+3xcPI5mM3kHBTtsG2vVpXo?=
 =?us-ascii?Q?VJoaRa/Dp+iB7dy4AfPl5lCQAwXf7WIH/qB+sj6hqZNTsOTYC8vZoKpeiFpS?=
 =?us-ascii?Q?dG3GR5lDrrvgvAHKw2wvnmwzR11wxtObwOPZrwwtP/1hVFzHo9KZZWhtHG8y?=
 =?us-ascii?Q?7JaEfCZSPS7RMI+2JK+tbnZzF9On5pg4M2PWZwSB+5GnO1Nt1zLd724D8vJh?=
 =?us-ascii?Q?5qx1fn/oPqiaX4DVBqBrVpe3zmb9k7DnCYhSuUyQeUi+bYBWjb6sBgZve9nI?=
 =?us-ascii?Q?opDXctC7uYZ3X0+LvLdtgXJHAEMb1SdspHbTcYc6BIlJLGKE0y0ED0XnftPD?=
 =?us-ascii?Q?WN26lAxNSF6z12fyV33FSeoh8GTLZMbJSIQlQJloNrfCKGF6NuLJ+WwxHhlE?=
 =?us-ascii?Q?iK6gky04UmDcggsWZAzhCi0JPHTWQEoy7O960RuQJIKg0WQBOsOnQHEYDRE0?=
 =?us-ascii?Q?DxQoV2mOQfotYBSIYFCKkgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4929c7-79f7-4ea0-d677-08db92694e38
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:28:38.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxmSjotuLIq/4GZMUK3+iEP95IpqDcn8PT0cW/s49ZqjwnlDp8dLN1ozwcTgE5/gqEIvNmAY/ZE/yU2dAsw8vmJcmqv+EtN26C6KUCbTKS8dPT7FtG7QH7FB7cY/uR6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 3/6] drm/xe: Add job timeout engine
 property to sysfs
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

On Tue, Aug 01, 2023 at 12:47:39AM +0530, Tejas Upadhyay wrote:
>The time after which a job is removed from the scheduler.
>Add sysfs entry to provide user defined job timeout to
>scheduler.
>
>The job timeout can be adjusted per-engine class using,
>
>/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms
>
>V7:
>  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>V6:
>  - Remove timeout validation, not relevant - Niranjana
>  - Rebase to use common error path
>V5:
>  - Rebase to use engine class interface instead of hw engine
>V4:
>  - Rebase to per class engine props interface
>V3:
>  - Rebase
>  - Update commit message to reflect tile update
>V2:
>  - Use sysfs_create_files as part of this patch
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index 96e6c3c3c7ff..2169301cd9e6 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -41,6 +41,34 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
> 	return keclass;
> }
>
>+static ssize_t job_timeout_store(struct kobject *kobj,
>+				 struct kobj_attribute *attr,
>+				 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_show(struct kobject *kobj,
>+				struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
>+}
>+
>+static struct kobj_attribute job_timeout_attr =
>+__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
>+
> static ssize_t job_timeout_default(struct kobject *kobj,
> 				   struct kobj_attribute *attr, char *buf)
> {
>@@ -82,6 +110,11 @@ static const struct attribute *defaults[] = {
> 	NULL
> };
>
>+static const struct attribute *files[] = {
>+	&job_timeout_attr.attr,
>+	NULL
>+};
>+
> static int xe_add_hw_engine_class_defaults(struct kobject *parent)
> {
> 	struct kobject *kobj;
>@@ -193,6 +226,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> 			goto err_object;
> 		}
>
>+		err = sysfs_create_files(&keclass->base, files);
>+		if (err)
>+			goto err_object;
> 	}
>
> 	return err;
>-- 
>2.25.1
>
