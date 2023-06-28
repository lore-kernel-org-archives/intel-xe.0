Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD03EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 20:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7010E068;
	Wed, 28 Jun 2023 20:32:51 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FCE10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687984369; x=1719520369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DEhzXQeynPAmygQ6/qPT3xB0mU1Q7vlWo8dYxLw8gFk=;
 b=JIMLf83Q8O22Zu5R1rnuKFywIbGod8Aqe9+alZAMGPDTjEekiQ5uXjj8
 XS/E2noQvqQsQ/api758jg3RBr1hp2QXrowhLlnMhsIQDxn1kx8V/eO8p
 Dg4M6wHdRoS0qOAKgCuEmwqR4hQAbR1iY6H0k9sNYvMD5FG6DyU0N6LOc
 Zhcr8whlon5ZkY/S0SEL6UiL1WoJ5QniMww+fV5RqMIiZ6l+38Y5OD0+s
 IT9h5obG4VnDw7FFd9eZbPfzmp/uZr+E787Obz0gKa+/BXhXqnIyqrAMz
 Bcs7vPxEekvxKsn4iHq0pFYBosdF+E/bXhl7PeMMmAGagumhg53KCC87+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365417213"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="365417213"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 13:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="752398145"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="752398145"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 28 Jun 2023 13:32:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 13:32:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 13:32:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 13:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DALWFizh6Uhvc+SV4btPgEBLbSSJ3v/yEdMeb1oablb3PIF2+R0UIedyIBRd0QY/lsQ2KyaIb37i4D3sptNoGhAXNNvtnzdYjsBwyVojTA/jr1pPAZZOzx5/4eJry6eqv9v62sCe79Oavj8D5Zne2odnaRuxVhg39QFJvQ02KIJ/61iIwQaPwY/k/DV8bnOTeJAreAY1Ht/LOFZ7n+J1qLaXwkBBRKLxh4n5Af9XVb4WS5l1GtvVVIV9dyIPjOxKIU7ryX35QpC9Xlhi8SrdnRgW8KQsH4XTNLbUV3e3LGnXyP5uiVJPwKppf9sE1gJJNOodMBsgHdrDbJOHwxC9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5omdXDGtEK2myKc02QTc8nmEFJeb+r3auG+Lu274Ag=;
 b=K3p/+J8whlKauSalzf+qRqonSObUzXF7c0dEsnjeRB/YD+ThpnzMV7eVpSev9+D4sIQWHcWJegl+JIPqRHmaX9ZjcE82Krao0QdY1nCe8CvuBul3eJCihlgZoeuFD5QHyWJut0OaKyybWhuAyv6ngkj95CsJrcwqoK4e0PUpnPMYeqN/0vLDRl6oR3JeKGcYy1pXUjYzKF/wLvUV9o+xuZ+NRR5wII9Xk4tqSuLe94/JqyVpXV7x2ucCLFiDOwWlFfLIoVy3TCB+1aPQnpXw4KX9VrCHT1gyc8U/AuKNDI6hdUmlOy3wbSgTv6N5udazwLhWfM/KPuSsuN08oSyRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 28 Jun
 2023 20:32:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 20:32:44 +0000
Date: Wed, 28 Jun 2023 13:32:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZJyY6agT9EcfwRbw@nvishwa1-DESK>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230628114732.3598169-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e940d77-f31f-4981-7e3a-08db7816d37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5INIZJ6hme3UGe1AaizDc5kuU+ohODAmN+Vt+jyVq5W4koF0L++tlhDS2Ht+wQHDbu7wfPHjawkiRyDUpf3vtS1QuXMJn2X3PkSWU4m+zCljWBxV8xnpFlDAkT9GrqcDzkbfMxxpGuw+fw6lnBxmMi5i/hkAo9VAC1tepD6ohzelfnomfpO6LiJeLGuvVg2fOoQOgK7KUO1n7KQSRga6xkkp7Ge2Lh+8rbEPNuyiKij5/HZNzBH76/sh37AS5OeiXhhVjI3qEyHoAY4stUjY3ScrtA0I6OfcqKR/d5LALjIKg/S3qqVfC2rXrq7hXAZo2HBG+uJ8lOvXvuFCrrKfLLMOO1cFjaYfxZu2By3S6OG5srZMD1O6ZL236j6rhVwoYLnx10MTyhyll5NbeAdpAS4pd9DU8w35I6bohZVIUAv8OHm+b4sK7VE3bISNv2vfrTvZ8XZmWZPzMDMLMAM1iwCTacbLSweMWtHH6TSuLw2fSzHENCa/3nSulR2EnWNcTY5OlQmpHoiDCQeUTdONYOVWXYu7m3lpNGa6h0o7NzpK1CiOctdHU6hzE21EE8W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(8676002)(9686003)(86362001)(2906002)(5660300002)(44832011)(33716001)(41300700001)(316002)(66556008)(6862004)(82960400001)(66946007)(8936002)(38100700002)(4326008)(6636002)(66476007)(6512007)(26005)(6666004)(6506007)(186003)(478600001)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQ/hMu7kcZojhmMz9gA865plzFzp8/DLG2l6zYbT9+VLMIyRuKKfX38hvPsp?=
 =?us-ascii?Q?6vPWIa84JSMXF3SVNytui1UifkPIpR+t2dMGeXuNi6h6GZuc+R6PK7XXFCvl?=
 =?us-ascii?Q?LoqoG1/kmFifpGFlhPaWAiwrzMEWwvxAGpHZW0VPbudggThYWOLv8hezKpye?=
 =?us-ascii?Q?H2/ut4oFELbIs40uU+hP3cJFMp9yI/upx06AQbJJdWywz+ONv4VRyzNzTt1h?=
 =?us-ascii?Q?mjeAHJZYIvmZ01WIB4+dtctj3rFIRzdXIuQr0v+ymVpA7mGu3+7bYCMHpQAb?=
 =?us-ascii?Q?4Wg6L1MFfwI4ws0xEbp61fYVIFlvMnsur7GIG01g+qAlpzmLmAqaTd3y0AHV?=
 =?us-ascii?Q?A3bNF0+1KHZueSQFcHflpYJeWNT7DYozp07eycz06Noiv+NrOW4TfLRpue8V?=
 =?us-ascii?Q?ELSXJsZfgYihs4Pu73YwH9HiWU9p9Rlj9wveKBCMeyjNq4QJbwgkdGyBlerB?=
 =?us-ascii?Q?EJRWa7yCa0YhCo5A8a2h3cIsC/hzA76wpVs9dfmVQS6qEChRSuP3JedAwxcn?=
 =?us-ascii?Q?7laNlJOfNTxT5/2hPDwVS9xo2Tv4FzyF5K4lkqKthjNEfNJI8Nav7mJNNdTJ?=
 =?us-ascii?Q?eDMsjfiHVumxwdJ5G0A5N28wUrFSvwNgWRosnj9Xx0Isy4blo99X2S+KiXIA?=
 =?us-ascii?Q?00i33kR14wEfQgIT0QzBHLGbDUMWfFMj5NXHEJjJA7qt5uykNOWGWAjnqEv/?=
 =?us-ascii?Q?b2WtMgTlyqqL2qAzT1D1WX6ewWLCrsQqr59tMAboAjjz4eVl+226TWlFAiYY?=
 =?us-ascii?Q?OKtJUiTucA8GE5Yw7E4ulkVH9E81wKKdgWduKk3bzG6bj7r8p33fY9E7Plrz?=
 =?us-ascii?Q?YV/VuoIDTtBnyqjxkuWQosGqrezqdOmiDMbmiE8vo38K1y5HQUNO5NjHJ+RH?=
 =?us-ascii?Q?lsNJEI9YYfSsZSqOzWErSyOfLSnlX3tMY2doXCZICKUoLfWCpaO/8XSDNHwE?=
 =?us-ascii?Q?YKCdfNCuickIQCw//oXXXm/adCDa+N4uYBos3GkOCV1FbGIlC6BiNtyeF930?=
 =?us-ascii?Q?MH+kiwRH/xos0zM7CiSze1i8jYkOcKoHEvlEneQ/7hGz04rPJZ8QuYQOtYZB?=
 =?us-ascii?Q?G3wtxO7QxrvskIyMyjPY79HSWwPJ3VGbUh3eLyblhj7TTQnfPY+pxUomJ+Qk?=
 =?us-ascii?Q?arX7qm0V0JzUmMPjvw4cXgbiSr/JbBFhaRnSig2ua85b75QxcI30FnFVm1ZP?=
 =?us-ascii?Q?5SUjVNXZq0MJfceU+ygybZWywdaLmZo7hOFdgDxoc6MEf+gPBWfWKR+YJ2il?=
 =?us-ascii?Q?dGpLTQSf9vlUbTVUarRJMfuskd9SE1g82aOmWPU5XLJcTYcuNcKjis+zXzAC?=
 =?us-ascii?Q?oxkkPDp+Pi8sO1CbDfm/Pkpy9wMqBNg3BhM1vWOL4uMBIPSRTZ9eXroYxfmd?=
 =?us-ascii?Q?b37ebb1/bTaH8Ow2lYoNzhY4G0T1JBcvOwJRIGCxo31nD8pm2uuFulDVXuxw?=
 =?us-ascii?Q?M0k2qGivFJFPw0FHS/e7LLNBIA0R7qgzEq227DMMh3uwrn/bDnT9DUxfbATU?=
 =?us-ascii?Q?2Davj+uC0aUoORge5cmD4FCGXdj5hS089e4A4vbigMY0KPPM8OWIiXDn8AYZ?=
 =?us-ascii?Q?UNF3puKsVWGfAEoGShyl6RNK9EtQUziLVSA07kuGMVmFV2EDPDzMb1RAN1fW?=
 =?us-ascii?Q?mxbzPdV4jeKmfgzzhvT3Lt4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e940d77-f31f-4981-7e3a-08db7816d37f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 20:32:43.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3OI1QgAbXjfrrjVZhG7DTEhhLQXivBbKyOiw8NotZnQIQGZ1Z5EbK3zJzayX1GThIzV3YxmGKZAP/kgKcP5ftnFhfVGxCgUfZ5+jkXeHO3zvMDYVxI9Du4MwGk1DFPV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 5/6] drm/xe: Add sysfs for preempt reset
 timeout
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

On Wed, Jun 28, 2023 at 05:17:31PM +0530, Tejas Upadhyay wrote:
>The preemption request and timeout is used for
>higher priority context or kill hung context and reset
>gpu.
>
>The preempt timeout can be adjusted per-engine class using,
>
>/sys/class/drm/cardX/device/gtN/engines/ccs/preempt_timeout_us
>
>and can be disabled by setting it to 0.
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sysfs.c | 44 +++++++++++++++++++++++++++++---
> 1 file changed, 40 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index 6ca77c5917cc..4c8f589870ba 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -34,6 +34,37 @@ static const struct kobj_type kobj_xe_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>+static ssize_t preempt_timeout_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
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
>+	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
>+
>+	return count;
>+}

So, these updated values does not affect the already created user engines.
Maybe we can add that to commit description?

>+
>+static ssize_t preempt_timeout_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
>+
>+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_us);
>+}
>+
>+static struct kobj_attribute preempt_timeout_attr =
>+__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
>+
> static ssize_t timeslice_duration_store(struct kobject *kobj,
> 					struct kobj_attribute *attr,
> 					const char *buf, size_t count)
>@@ -100,6 +131,7 @@ __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> static const struct attribute *files[] = {
> 	&job_timeout_attr.attr,
> 	&timeslice_duration_attr.attr,
>+	&preempt_timeout_attr.attr,
> 	NULL
> };
>
>@@ -261,10 +293,14 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> 		}
>
> 		err = sysfs_create_files(&khwe->base, files);
>-		if (err) {
>-			kobject_put(kobj);
>-			return err;
>-		}
>+		if (err)
>+			goto err_object;
>+	}
>+
>+	if (0) {
>+err_object:
>+		kobject_put(kobj);
>+		return err;
> 	}

I am not sure if we really need this 'if (0)' construct. We could instead do,

      return 0;
err_object:
      kobject_put(kobj);
      return err;

In any case, we should do it in patch #3 (where this code is added) instead of here.

Niranjana

>
> 	return err;
>-- 
>2.25.1
>
