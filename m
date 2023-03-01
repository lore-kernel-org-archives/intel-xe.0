Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214ACC7EE32
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 16:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06EF10E31E;
	Wed,  1 Mar 2023 16:36:37 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5610E31E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677688596; x=1709224596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8WDmYoW2O+JPYRasAs7dmeBpXOUM66ET7bPiRS1C2i4=;
 b=oECcstPU7n+yKDsUmhuwNZF9xjmCeLi5edtpcicxKrScwTai5KuATl7s
 4wNOpuwdlO63gpTv/Lp/DBCAf+sEB2Uz2Bf0vO2xex5jonH5BrXSb4LBT
 8jH/Wn/gCUMhBTRiJUB18VtDLwMYk7RRJVopm8k7vqMZOCSMujCZY1bzS
 p8yZ38HPbLqxjstc11ngLifn3j40K/A+c1W/Rdxh0ea3bwzO/UWRpD5Cb
 B5fnb2W/IsHESFd9ipOdoyb0j1LqRPFTimvHdlYALv8uaOFwkOoNfZwY4
 WiPgWthUkasM6kLCPDDzVEatQkvhB8coO5yyXLa8ID7STzg+A9q0H27ku A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333181231"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="333181231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 08:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="704910541"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="704910541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 01 Mar 2023 08:36:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 08:36:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 08:36:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 08:36:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdQ3cLf1ZhYWofPRPclfcOegxG8KPX031g7QPC+mSzaV3PMa2m6W4LzCRnNKa1UIP4E3rOMZ+aTuxLyDXSWpC1GLWu9/PdZNgvNbfv257FVJ2g42WwZl5w2aDkZFTYSRr4gOUPTF7HHlE7Fzkwaumoth2ZqcKu0h2KuoFhP1XdmGnK79YtnBEuTZyjx+bqAF7w5uzGXiipPYdLnce6hTDxN/8fTyOvvB9K5WLAjFR6hlBckqtmwxbPyZ3wfw5vlxhpjX8SiDZ865Gn9uJoyGQbhQVYw1rkM9SACCg2vQxpYTbl+ey7l9/UUGgWIVAd7cCIhB4xtEY3tKmtT1sGCAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M2LsQC3tD2Oe27Q/iLHufnYeG6XMpe94PVmv8mLZkY=;
 b=NnZuCkB+nNndTD4ksM7faEe+ub1/sWAub0Rz8g6KtfVVEz3K0q1BjD8YQRiYOaP1nQ/2tYNQHRbopAVpEMhb73lAvyi7N1Jp81XFA9Ng53HeTocZIVnjdOFz9GHYyiTgo+baT7yg5hR0zFYEf/fB1mXrS5/HgyMY36bPlmlmfBQ9dTNOYcrT/acNg4axUA11e6FDYnetEDVWf2lIG0ABzpqWYmPu7NR9IkjkchJiwW37i9RXsbeVRzZEbWUSbuuE6atv+zrFvUl++jYJbecFf3tI4uFf1QCALMGNZQYqJq5WwLLkliiJF/6NSnxeqlTXBSyoIFCf3qiU2xNO6QvZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 16:36:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 16:36:32 +0000
Date: Wed, 1 Mar 2023 08:36:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230301163629.axukda67v4rsqb3l@ldmartin-desk2.lan>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1d6585-0398-46c6-e814-08db1a731d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzdQrNZ8aRGQx7MzEX/rqz4w/NQTuhRgdd7QJAHfDUu+P2I0qc59Og8TZ4Fl0ZZgWlb7NBgezskQggxRM/2ZOd/FORlj3SzQx8AYEwiBHoariMUEA2XR+qCmWbGuY2Z0sET8pNntyJu2rVimaocLIepCxcJkh6aanU+blJV9ldf8iaGr6n1fyKSc9ngH/0qSkshWGFIwuxYfDvnTDrNBonTz1Ye0vk4i2v3esD70W2cuSUNQitz2oWUiaHzWyZWnzKyZjQ6OgYw8tIvMrOvaFuAlJiWTuolL3hkjuLYmidZAt6K5bNZESx3lgcnEe4UzE59D6ffG7cE7gZNwXzf5dV3ez3Rx3FzCOa1KVSpKWB2Cb3xAIy/VjV6pF9ucUA3Am40zMIzd45+cqz6J5lkyAX7ay7bB7bvO/VcR/oQ6VVXx3BEhRWyPsvjM2z0AzLX/esmdgHomXRcci4dz+HV4tEcHI+3LR45H9mWweAE4DRdoPCi1ha/eGWM3go3+8LZVhjNwvEtolGmbTJ+uGIgCXJ1ILuKIiSuPBTskq4XgbFQSx5Fl2OFRR6spykVjDMcQhiRdSFbg8RIvOvRQdJUzHaecCWRg9ptitkPX2dEVknqQfFLpXPd07VZXiXQE/c7twXDYDYZ67pTeslecrU5eeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(86362001)(36756003)(66946007)(66476007)(8936002)(8676002)(4326008)(5660300002)(66556008)(41300700001)(2906002)(82960400001)(38100700002)(6486002)(6666004)(316002)(6916009)(478600001)(83380400001)(9686003)(186003)(1076003)(6506007)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wEchpsrETOHHCSyZyqFQ/WWGv+ezI+snYkC/J9Ct4ydB3w1EDlowmKRm57qw?=
 =?us-ascii?Q?wB/D+XPtHzYvnWCXUVFR+LcYMRRpJmfQPOGB45q+NULIlzpWRyVpxxoR5RRU?=
 =?us-ascii?Q?VdADLwNDXfJuzdTAknJ20v0gJS9czj/ixXEDIyQ7D/pKNfO2P3G+H52yIHto?=
 =?us-ascii?Q?fxRb0G//rt3GSmSk0FE2eHKf2eMi4uWvUCIxF2birONbV7atMRgTK4q7G5nq?=
 =?us-ascii?Q?kSF9sDU0bgTXUDA3dmXYaKtrE3sEBod6h3hPobIGmlLbM0XBO4UlF5ZQp9ge?=
 =?us-ascii?Q?g+ykL8PfElOR1jaQLbH4QojUtiazTPVvAr8d/YS3qO3hL5lWhyCYWg+7okkU?=
 =?us-ascii?Q?OAEcREqc0eNz2VyEFqKHPRXIWlC2nYkEEEqvjJzirR+K4Ai3A5M7yMnUIqS0?=
 =?us-ascii?Q?dggbdDrqcmKyMI8mPa3yHARZW5hAr5KHQCMJAVhpS1naRL7c7SIPOrzw/z4A?=
 =?us-ascii?Q?uAnJS/0gYHJj3W6v5K68JQzvyx1IZQCiLfWThaKu9q8+96ptbnB6qRuomBqh?=
 =?us-ascii?Q?CmdGu0klzH1o27VQhER2UroaDRMejH8KBE2MRMFXOHFRZxla7eTzqpmAjWI+?=
 =?us-ascii?Q?GVU3hSPoVviHnCJb074OYUG13u+xxGScQkdpSWKXqo8bXuUxqJq/WYvt4RfE?=
 =?us-ascii?Q?+TG2abb8SL/LhkO/73V8CjlTodgA5Oh+HpRVxf3sucoSA649U6qBcYTH809e?=
 =?us-ascii?Q?mI+PzINu1T/1f2S6Q2qtjWzykBLO187K+9pttj3S9SY1B/WSB39AFUNkfG2R?=
 =?us-ascii?Q?N4Wl3mqZgKXRWNEZp1cu3QkQPEnarMzb5RK7kPGSR71BpWMNxZPPqRzVAdya?=
 =?us-ascii?Q?2o7wypp3rRfVbnWvb0x9CihpWrv1qGdX6NVmijGZrARhFE7sv6nWNgsUKaPb?=
 =?us-ascii?Q?1FmrwNldvILRRMed6N2e0P3sbpwsISoIAN/Cijzc9w4Nwvl/hIZMeOukFItU?=
 =?us-ascii?Q?1mxY1lBqZqaW9JBuqQipZIqPxMv/eKKf1CFzvqUPLO2JbRr+Ueu9yw97hjtq?=
 =?us-ascii?Q?Y6JJQmFmboW7JJyU/++2JSmQ8EjP2yKyMHqOnOw4Z6UtHRVftYRAqrjBWo1n?=
 =?us-ascii?Q?tjjWuBGhqGldRmyBn7Drs6Hg/LPM1XT9NGEkj5ebG4JnW8OkonKEdep+iuy2?=
 =?us-ascii?Q?Bje821bplhZ4A1cPWMYD7er1qa0SrTwvvfE2TjAtROErAPyhu3HCQYYGQska?=
 =?us-ascii?Q?PGhkIP9KgbiEIFFbgUyOWtTgs0tAQZoIre2xLAqEAwFBH9+W3vZErx3JAKUr?=
 =?us-ascii?Q?E8T6/jMwGvB+nTLpKybyfRKC/LqSSC+K3fe/ofyiOZFtkTF4B/WR4nxenE/U?=
 =?us-ascii?Q?cVwdfVmj+f4CZPtAKaxXStz7hU19DR2/p9g9K/gmLqpMU57rKKimsAOUSpUC?=
 =?us-ascii?Q?lCIyA33etKUdHIt3jqWF9QOmex0jGT6IeD1NYcE04A8KicZACEZ4tPUhlfTu?=
 =?us-ascii?Q?oeELrcqP2lp7SZI+uMbC/d+thGPEGMqhC2bjRCy0+SIG0K7NY9wg+k3WZFzT?=
 =?us-ascii?Q?ojfyemNXdHo8qyhR7P/y+/Ih+UoqNCSZvLyRLjGFxN8TDdFqSKJYzU1+EQk8?=
 =?us-ascii?Q?kIs2jbHBeovWYoFmQqd6IhG4DfLYOZ8lcPKR6MfXvQlGqC7fCgYVLcMB9cjs?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1d6585-0398-46c6-e814-08db1a731d48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 16:36:32.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqaD6aWc4OKbt0CGNfwRi0hjp6p19Pdgqkp6At0k0YjnJ2ggl9w/fmjGIIyhhk+KVmrzzoLV//UIbRCjZdw8s4/w0Nrlgfneya/poGq7isk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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

On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
>xe_guc_ct_fast_path() is called from an irq context, and cannot lock
>the mutex used by xe_device_mem_access_ongoing().
>
>Fortunately it is easy to fix, and the atomic guarantees are good enough
>to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
>
>As far as I can tell, the runtime ref in device access should be
>killable, but don't dare to do it yet.

I don't follow this last paragraph. Could you point it in the code?

>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
> drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
> drivers/gpu/drm/xe/xe_device_types.h |  4 +---
> 3 files changed, 13 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 4eb6786b11f0..ab179b1e24c1 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 	if (err)
> 		goto err;
>
>-	mutex_init(&xe->mem_access.lock);
> 	return xe;
>
> err_put:
>@@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> void xe_device_mem_access_get(struct xe_device *xe)
> {
> 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>+	int ref = atomic_inc_return(&xe->mem_access.ref);


+Matt Brost

Any reason for not using kref?

Lucas De Marchi

>
>-	mutex_lock(&xe->mem_access.lock);
>-	if (xe->mem_access.ref++ == 0)
>+	if (ref == 1)
> 		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>-	mutex_unlock(&xe->mem_access.lock);
>
> 	/* The usage counter increased if device was immediately resumed */
> 	if (resumed)
> 		xe_pm_runtime_put(xe);
>
>-	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>+	XE_WARN_ON(ref == S32_MAX);
> }
>
> void xe_device_mem_access_put(struct xe_device *xe)
> {
>-	mutex_lock(&xe->mem_access.lock);
>-	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
>+	bool hold = xe->mem_access.hold_rpm;
>+	int ref = atomic_dec_return(&xe->mem_access.ref);
>+
>+	if (!ref && hold)
> 		xe_pm_runtime_put(xe);
>-	mutex_unlock(&xe->mem_access.lock);
>
>-	XE_WARN_ON(xe->mem_access.ref < 0);
>+	XE_WARN_ON(ref < 0);
> }
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 263620953c3b..96b4f3d7969e 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> void xe_device_mem_access_get(struct xe_device *xe);
> void xe_device_mem_access_put(struct xe_device *xe);
>
>-static inline void xe_device_assert_mem_access(struct xe_device *xe)
>+static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> {
>-	XE_WARN_ON(!xe->mem_access.ref);
>+	return atomic_read(&xe->mem_access.ref);
> }
>
>-static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>+static inline void xe_device_assert_mem_access(struct xe_device *xe)
> {
>-	bool ret;
>-
>-	mutex_lock(&xe->mem_access.lock);
>-	ret = xe->mem_access.ref;
>-	mutex_unlock(&xe->mem_access.lock);
>-
>-	return ret;
>+	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> }
>
> static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9743987fc883..0b8c4ee0ad48 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -230,10 +230,8 @@ struct xe_device {
> 	 * triggering additional actions when they occur.
> 	 */
> 	struct {
>-		/** @lock: protect the ref count */
>-		struct mutex lock;
> 		/** @ref: ref count of memory accesses */
>-		s32 ref;
>+		atomic_t ref;
> 		/** @hold_rpm: need to put rpm ref back at the end */
> 		bool hold_rpm;
> 	} mem_access;
>-- 
>2.34.1
>
