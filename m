Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00ECC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 06:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D1A10E418;
	Wed, 26 Jul 2023 06:06:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D4410E418
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690351604; x=1721887604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=he/8vNP2xvvw3BBFegwZylTqZW5KX7Ls16SBxGhFRF4=;
 b=n7ucyZ8qasFvjI0z1160We2xbSws3uVF0n6x6hrEcSrGZxzpiFrK3F8Y
 PE7xVitIdE2L0CHv4mQnzj9EMdPAtnuFRmHE5pJJYH44YumOQwOVdmLVm
 59R/12wxI2bg5D93/VGXD5Ogj+kxBhylK+w2/5x9s0q8eeErhZQK6nrYu
 Kq80H9ysLJBArJTbyg5fVtLbNFAC703wt0LR3ZwwXmqoAL6vnmblF3k00
 hx+4x1je2T7MQ4vBlJaIHbm+g8ly6VjHXlS+oBcX6S/g7AR0ZIDoJxOQt
 IiudCcznb0t92h+a06iq8arOd7kPjdqyXaLzHjyccuBLP/+q3/lbGeAjW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352829314"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="352829314"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="840138114"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="840138114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 23:06:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:06:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:06:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:06:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFXt9ybAlLq3AJKPLqQZ+sBoqes9EWRW2HmyYFXlKEi2atbvpAGlPiCtkGIfGg4kdw/30uHEO5oSx45iOR9pCV9zkMY/YMChQSK+JjIbiu9gYKOF1BxIAfc/l6ekp8iXixXaDz4m5Uqi/+/0csWOFU8US9kiFPYPBSumhTrleTFbhdFYKGQXWKFoamtKUpIAWQEH8Zn4SQw+Y0vLkWchPhIZXjN2jda7SAuZ0iSP+EvGF8AOBDRtSET0DH2twuprBO7xPhUPGnAJny3R1MF8gAcwFXIoY3ULQVIS8TAT61QPn/6OTCETPqnaQv3C67zbKZl9lSFQhdxr448OBpbVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAv0I/HqkmBKcXDgEwBA8JaxL3MYXLl+V8DR5iiGRSM=;
 b=FsXkS/zk8guUyFZHKhweouKNJvgQERDCwg3C0ym2UlnqPaB6Ap9g1H92eRnf8KIyBuiW+M1Q/XmWtq+BfVUTkugLeeYrXYf040viq2nhZ1w9y77HYzadZa2Ka67dirmJVoE1LW9UcL9O4Nuu6i6aPpJdnD920etHjLRJ5YGs+L4tjZ0NRgvuNFgMkwddL6zUieMxqgLoHRgdQ0MfiKYdK8OEdQkYHwSNpni2siufpHDchlZMX3uwo6BStJwVuaTCAxcdyyQ+6qapYGbSQiJ5shO7V9gW9zsC7jvr1iElTWneJXg1738AZj2hGUdii9vKEWEiF7w0MwI7PWyMlFxwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:06:40 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:06:40 +0000
Date: Tue, 25 Jul 2023 23:06:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMC37cHNOQUhxa+H@nvishwa1-DESK>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
 <20230725115003.785982-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725115003.785982-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c104ad-7647-46ee-092e-08db8d9e7a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +D8ERbETP9Cn8I3xcA6FHWLI66jb6agesUgwUiRHMzPxw8UfFiXQl6wHTnKxaC+eKUFkOtanKw1dIluNk8MXpYMyRkO1BMLxKbpiRjSRrXR/fh9fvv/UhIFpXcDIwDWBWWWYUpsHLLMVAN6HiFekCal09SFifl4io3qijjbz2KVZtrz6N2/ii28JDGrrhAdUt/ZBfkYhUcT9yda2hVbYqJ1kjj4iP3eyXkc5G202D3VGv5+RKe4NfBuZ9lJENWVc4FV8JKTzGn/3Ldg39p+9Bjc/n1AXRPR3aPw5TcqyhDnBo47j/IjiJQSNtxTZSf/P80Hesyc7ArlsNE+Y+TvgfkTM8f3L1YpMbpI7inUR6Z6E4J5IZsm46a3vWvxpb8UdIUN3dptF/yTHHLFtrMVrt8ty67Bi5oU65RxrvS60ALjz3dCQ6EKX3CJg502GL+mECC14UMF6lOWFJMAfM4ivvc/fV6eMbEjyjQRROBmJexqR0Rqf0dQQu6nXxmAe48wovnDFmrcpjTgtDPZbA+iahmfngk5OtyWaDN3jCvZ9ZgDeJr2w5cdtByWHfHcPL5OYuG5HGs4GdSr/r5/vA2t4ZvMimNgwwNF/qiFMtnQrwxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(6636002)(33716001)(66556008)(83380400001)(66946007)(66476007)(4326008)(6486002)(9686003)(6666004)(6512007)(478600001)(316002)(186003)(6506007)(26005)(107886003)(2906002)(44832011)(41300700001)(86362001)(82960400001)(38100700002)(5660300002)(8676002)(8936002)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93dLP4oX2v9KavjFP0En7uToLuNg0bnLQpNdgJKeG/AG8vH5hVtZMU7+JPmh?=
 =?us-ascii?Q?/g7Lcd0NzGQQHUUYnIMA/XB+q2dMY7E2mMUFCSeR8/AL3D/ANvjs8dRlggEv?=
 =?us-ascii?Q?lM9LVlXEtPj5g0WFUdZnUt/nuMaqa5yEuhdP/MwKjGQfFnzOnCmXsjdFb15P?=
 =?us-ascii?Q?4+tazEeFtppYpFO9pLFD/yi8Xoa9RFTVAk0KtYOzHXvjS+h/NFXjpMfd7UGg?=
 =?us-ascii?Q?Gun8hkph+w/srI217Y/um5MLzcXdQ9xQyB6gfUPlMsQLSen2eQXZQnas7/mj?=
 =?us-ascii?Q?M9SixS3ubAUGbyVMSF6a6O/fQwMzk16KJQ0amfQ65IaIdcWEP5WBXD0ZlMev?=
 =?us-ascii?Q?DL8Csxv8ocweL19QsjS2sJs2ERrgnzM0pHvc8p2UNQeHohIXFm1IKL7c6Y4+?=
 =?us-ascii?Q?QpRpVmSmKFRkPKfp1ChwzV90g4nKKeZfUF61oZjcdYFOK8DxWGkR6Lb4UpLV?=
 =?us-ascii?Q?BhwE6vM5k3raB0qFmKY4ywxoonnS5ZIqJGJIKtTof85tiz2rmTTwUali4hBA?=
 =?us-ascii?Q?EjaSPxYkKdI/eohjrGwKTtPOfn6TQTtthQsJo1kRRQw7GdluhyIgnRawkKAi?=
 =?us-ascii?Q?nUVlfnTYgpOsYhaZyG8id0/zF4RQxBXdJKcNWi7A7vwIAIt8qiqD0YBVOuqb?=
 =?us-ascii?Q?rK0wu4nnPwYQOfeWvRehdr1lddM/XMyISw41+VaKODn6eQAfy/fACrHDqQQe?=
 =?us-ascii?Q?+n+svTkTpK5LoYKFJMenhn3ZidLbkK0Ja8YN7+Gbc4ghwBeFbRh/jN7TOn+7?=
 =?us-ascii?Q?GjVu7+h5FLuPHYcys4aWNvL0s7VO37evcdPdcFOC7nRuJMGOu4tS6ObpcVeY?=
 =?us-ascii?Q?qgnmAvfCb7yvXUHcNy/EELa1qkE90mpKycHrgulBcUegEo7NK087Dv/UIIlX?=
 =?us-ascii?Q?tno1eAkmCWPrvQKS03pfDIuNGa3BJkM++bVR7uvjA40bbS/rTu/F5GJBYQ4z?=
 =?us-ascii?Q?zgfpGa9Cpnx9Iac5ATw1jbM350lenf5JVPIvOrlO2mFkepluep0h+xyDMUzP?=
 =?us-ascii?Q?CqnARM7AREWh/9ANr7xixCDAZCRSjU1unw0UrLJSIDfXmQzo+r0PMQvLrAu1?=
 =?us-ascii?Q?plXZneGSmx/VXeZI0WJbVH++L4hLivyaHtbD3EsnYDsF3UKHfgBx498gacDd?=
 =?us-ascii?Q?sjx1GyxNY2ZtapSgcd4L0hheobQnKV7pn6F79C0XPa6nO9G54/VlIhKOSIdf?=
 =?us-ascii?Q?iYt+8gDepsJe9OeyWyaNHDlJgrtJwpVe26WMu/3cpgSLeDRitSsNH1tNY8ZC?=
 =?us-ascii?Q?jJ9+fclGTIgb2nyukaG5gOI7p6aXku7pA36xbt7VMoV0rNppmHh3gvvLIzyB?=
 =?us-ascii?Q?OzpIxBlalRHNeeDxHbvjJYpdRTLT2PeGXsutM9ONW6Q4YwfPCoSzjwy2jBx5?=
 =?us-ascii?Q?+ZOBXYP/qdFsoGusr39paNKmwRU9y6elcQ/csE7KyKInzIGfoZvTF1RfT/Ou?=
 =?us-ascii?Q?6uql9fWwrsAvt/bbaEhxLtPEkms2ydrwyUiODlDI/metK1cMEbHP1FTu1qvd?=
 =?us-ascii?Q?Jl7LSxuf37i+3QvhaHe0qd7QsP/HTu8q1iSnhZ3LK01Ccgj5tDxhHCUaVVZO?=
 =?us-ascii?Q?QY9Rf/GHLgf5NvcZV+u8V36PIB+2/aohdGch5mbJGGzn54Lozx5Zcv/AEQem?=
 =?us-ascii?Q?VhHjAzKYThMMht+M1at136o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c104ad-7647-46ee-092e-08db8d9e7a47
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:06:39.9837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGaP7XAhegwvVEG1w2H8TVn0WuNLQPgT1MzCVSw7SdXJIMzqtblkQ9a5W5B9rESVjL5LpuKuVpWyhv09Jb3BDKCgM+CF9PW5CbsgrUgi5MurdzyRnbvAwC30x5pcruw8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V7 3/6] drm/xe: Add job timeout engine
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

On Tue, Jul 25, 2023 at 05:20:00PM +0530, Tejas Upadhyay wrote:
>The time after which a job is removed from the scheduler.
>Add sysfs entry to provide user defined job timeout to
>scheduler.
>
>The job timeout can be adjusted per-engine class using,
>
>/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms
>
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
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 42 ++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>index d9c7315b7f8b..9a2b69a1e5d1 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>@@ -39,6 +39,37 @@ kobj_xe_engine(struct kobject *parent, char *name)
> 	return keclass;
> }
>
>+static ssize_t job_timeout_store(struct kobject *kobj,
>+				 struct kobj_attribute *attr,
>+				 const char *buf, size_t count)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
>+		return -EINVAL;
>+

Why add this check here if it is removed by the last patch in the series?
Same applies for next 2 patches.

Niranjana

>+	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_show(struct kobject *kobj,
>+				struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
>@@ -80,6 +111,11 @@ static const struct attribute *defaults[] = {
> 	NULL
> };
>
>+static const struct attribute *files[] = {
>+	&job_timeout_attr.attr,
>+	NULL
>+};
>+
> static int xe_add_engine_class_defaults(struct kobject *parent)
> {
> 	struct kobject *kobj;
>@@ -188,6 +224,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
> 			return err;
> 		}
>
>+		err = sysfs_create_files(&keclass->base, files);
>+		if (err) {
>+			kobject_put(kobj);
>+			return err;
>+		}
> 	}
>+
> 	return err;
> }
>-- 
>2.25.1
>
