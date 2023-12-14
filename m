Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0690C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 20:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2C10E30A;
	Thu, 14 Dec 2023 20:57:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48910E221
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702587452; x=1734123452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6+BWaoU9jA4zvcppavDKOo33mEBe2uqtxmOGwGggJSg=;
 b=Tm8EbMInMVmlHog7EnlZWksINm1FP6r+N5fZEB4CglTWznsv0BofqIpa
 8X3D0eWXEBzDjL2lWCVtxGKF7DJHQlQiaYSmcTdAnIJTcXDQURXntzpRJ
 TVILwMtx9JK+ym6/Gf6tsclABgd00BtdvJfbImJWEYv1bscY/zcmkiXE/
 QcSxMGRUhLftWkDeQLW4+wTwNmhJQFwsSubu7q67wC4Dp3ZRbboir8XZW
 r5sfSa7aexTadSV1MMZyuysXNv8ZAuVG1Zk1o1yAc7GvhXdUBsQYx4mwJ
 umqgnYwB4mVKY42pGQP2jIU3Bnq9H0own2hKiw10Te7A722FQ96hzEmLd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461649319"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="461649319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 12:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15996921"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 12:57:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 12:57:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 12:57:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 12:57:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmMnzcNFkVFoRR6++rtT4GdzvqMaIYIidvBbOcfwsUtQEPfBTe3a6Sjo3tRa0MruH2y11OezpoQ4Jc63TO2mDxlE/9pPHdlBEZyX3FN+M/bmrNjR+u7EOWMY7GixMRK0z7soXxqc/qscU3SBevYtfMqDag26Yk8uZ5xajS26QGCPxLmW0+sGF8UOIObEgs+fMKtytEv+X6HpsPP24RBlZnGSOCXAvq9bj1etEJsVSHAzOvxFcDW71h27om2+a7Bx5Zw8I4NOu6oEg08Wlhfdzux8+7XcSb4w1hpc0YjJhr/L/Wx5NYSDnAy0Ltj6GAK3AjNrRPz8Hjwp9SbjI0a+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZY3huFqO0CGHWCc8SFmqGqzipX7silJz4/aGcYt7v4=;
 b=QRdxE21ZdEPN55v9ZcUaGMfW0XMBZbIP6q/MlaWirxvWL5gmC8DHSYuMXlNwZqibV+NPa54VQjcxJQ44SXK2kUloNuEg+thj6fhAyKYUYc0RJdkq6Cugj0FDrR+nzIu4BwaWOGJSzBR60jn1b4qMQ3xni1x0+jtW4zmL06s4lWffHG8CGDsd736oyjV8G/xSZJ7w21v3ja3vOYo5fqh4P+IaQrYCKvCQqzP50MtUAVSyUjGSn9VzCT+7Pn+GZny+fyC5vwUFEgi9EEAmDO076pBxVO2RCkPWN+gz3eHK5ailNu+Y2pwMBfmEKHD2/jHQkgyVuJhF0M9Os/pHA18lGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 20:57:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 20:57:27 +0000
Date: Thu, 14 Dec 2023 14:57:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 08/14] drm/xe/uapi: Order sections
Message-ID: <6bqke2ogy77tiprn6hifcyy57yclahjpi4ueeuatxmtfuvmwt7@qypor7sctqx7>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-9-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207135009.7-9-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 8162f893-54e0-4e54-0c64-08dbfce74750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBXX/ieIJKOFW8yCescS5HJaSs1Th+X9MUZFNHNlYqryqiMVWak0L7bsbKovVknaRvQOV8XgvpqW/zoR/Hrm7PrnTHZA/KRJ/TvaTlJoWloVcevqLJnr2fNA9aHCTPkR8NodXxx0FMfRX2ztJbtwvgHyhY8JrpgK8kS2SOQsAUwRttGCCF9H11TZbI1CTImR+/93GJYLv9OvSEt8uoM5NFamPMXrM1UzBPLw6QpbauuthP0JWEj4u3mNgD6520vBMkH8FxUFNLkU7y2N3vqE5FUq+xX25oYVT49YepF97R/DyWggi/rQPHtPWPW5ll6kusddlAUvrdA7aV+sUUTZGtOLB+qtZEDhe3nxL/WV3Gdf2F2tnsK4NwsyUg2h/Vss/48VrsrH6Zu8GLd37UPQym1cfkFe6PRS4ntykL7AbBnRfeng6Hne7fy1uz+UCPljG6fLN9/2SpcmuTG657Yj2UY+36ACrJJnsEcXl29foLBqMSkJNLKmqHP5gefRHcIDS+Rh7nr0r7pJ5cgoUfnQETTZn4aEBTW0JcNsne9CynpPROQ32szpMdORcGyltqtV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(86362001)(82960400001)(6512007)(9686003)(107886003)(26005)(6506007)(66946007)(478600001)(6666004)(6486002)(66476007)(66556008)(8676002)(316002)(6636002)(83380400001)(6862004)(4326008)(8936002)(41300700001)(33716001)(30864003)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+VDKABo0w16nJsp8og+pXt4j0tdVSA5OoH1isct2TIhLe5UWUSHpUkCpkcW6?=
 =?us-ascii?Q?ib4TlFepPmcvaiZoKXTRG1VNETDrO9OgEle03U9NNXr2s6zQZaKuBTyxwyb/?=
 =?us-ascii?Q?TEw4rmKHPgDeEOZENK3+KSaOwoM804Q1WLk2LbYY5YAVNI8Oj6gO5WzMmyU8?=
 =?us-ascii?Q?ho+8iFb4nPZ4e0Lto8oGOmcyBQ9IntrXhZBZq0eRBW1NNyQkJ54u96AIM0y9?=
 =?us-ascii?Q?oznYbSQwu2nwTsL726IhzXByKl+97HngJZhBVjVmPlQxOcCKKlUuh3TSEgcB?=
 =?us-ascii?Q?1RGpvu7UgAuj/FICZIyQPwJUMGUjVx8v6bhf5mq9Iu0cxZrz5JVq9CXRvtmh?=
 =?us-ascii?Q?yAosXHQQMmCjPnTwY9+wWCckKK6OmfybCEZFSUAoz7cYt587dxq22wqP8Hih?=
 =?us-ascii?Q?axJfJ7nvypwJk/R38AFhOPqLHlM94+CKyZlsLct4VmN3luprgx3X88rqKG6A?=
 =?us-ascii?Q?vfQaK1yP8m2Tj0KLA7fIdyfClhxkJXEdEZ+XCcNDdU56umZgs6HxhwSAxoey?=
 =?us-ascii?Q?yberv5o23U5eedYoO9WlU1GskrPr1lEJr8CKkX8ebod+av5qkQceT8SpisQa?=
 =?us-ascii?Q?iQ3TNHvLpgvIHZEQ+syetRdAbObetzBm1qLsw3Z0WQOiRD79FueAahBwbGTD?=
 =?us-ascii?Q?HykEamNUzLx+6uLi4MI6iJPWX/jB3LSVccBbbC7fx20d2Ql082VZiC0PWnXk?=
 =?us-ascii?Q?No1XHIjL2gFmeH3zaLMP+bvWB4Q3v2d2SpgFm8SKXJbiZkgE+RaiaWLmg3IK?=
 =?us-ascii?Q?eHB6bbUxUpit4CMXIVOCLOSJM5QCt4SXxEURyf7g/DRad/x3SyUHagHUZvTu?=
 =?us-ascii?Q?sWiMqkodv47/3JbgaM1qH0Uo7rZPXiEEY4eKAxhxfSR35nyWzqW6VavltNRI?=
 =?us-ascii?Q?9gg9/Nva/RMxjeKE0VZqQ+Dld4PMBG06sdsb44TuGG1tiNJSKo/qqKuYJrZt?=
 =?us-ascii?Q?deAf5MqpvBpW/IZa4gBrVTMhEZeMyyxoWO6WXMdGgYuyvpN0eCYc2dLWhHwe?=
 =?us-ascii?Q?KnYCkbBQghjZKKzqt4egavPGwrqACps9d2m11mjI6PviRrqPh8Y6w8CFdRfU?=
 =?us-ascii?Q?SjSSbfN7mWaT2hwJf4a6Q9tk5WqCaSLLQGrd0+E94/emaTnd1t2pzdlOhDN1?=
 =?us-ascii?Q?+tpLt7LY1nBeT1Ih8XGG2tjZWJkgT6jJe+Ykphnj+D8C4ONTtlbTU3C39fWG?=
 =?us-ascii?Q?B2/qFAaImkZ3T7HCS/0dmxB7lxXdzmW0eVICH/IYS8gr+VNPK0W+pIxAWr0W?=
 =?us-ascii?Q?m6kJebxfu6Z+H5DIB+CuOChTpTae/KftNh93E/tfmAmjdm+gLVnGSsgdxux/?=
 =?us-ascii?Q?UusOjmGQV1t/QR3fZtA2Egewuo8dZ8LcRtQjpIps45tKEPkEYMLS/wXif6KG?=
 =?us-ascii?Q?dJ6WQ+9oLVYwOEQpTm6dzmgh95Kas5cp9KN1M3aymykSPtRktRFYa783Tit1?=
 =?us-ascii?Q?LqJ3k2ybif4g7X4MVuIHjZL/vakMUEvb368Lw2kAHtiIHk0eYFwVmHli9KQz?=
 =?us-ascii?Q?bZhlqpmc/4kRQO01X41b/9rW2BbBFhmpERZFgV15BlxV0DKmcPNRi22uEmjG?=
 =?us-ascii?Q?HpwZAL4hakhj8i+dIYVG1TnqlFMJwbFfeRh4m5fGZtD8bfJ50DagVwbdDpoa?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8162f893-54e0-4e54-0c64-08dbfce74750
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 20:57:27.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3ejOCXJOc6IGCy7ZLr29cxVU6kMI54eues4LrtecNby7cxLI5DapIjh79833+QqEetWaNhijr8A70LnvxHuTD+gkaRPtOONQ0nU2Q4OeV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:50:03PM +0000, Francois Dugast wrote:
>From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>This patch doesn't modify any text or uapi entries themselves.
>It only move things up and down aiming a better organization of the uAPI.
>
>While fixing the documentation I noticed that query_engine_cs_cycles
>was in the middle of the memory_region info. Then I noticed more
>mismatches on the order when compared to the order of the IOCTL
>and QUERY entries declaration. So this patch aims to bring some
>order to the uAPI so it gets easier to read and the documentation
>generated in the end is able to tell a consistent story.
>
>Overall order:
>
>1. IOCTL definition
>2. Extension definition and helper structs
>3. IOCTL's Query structs in the order of the Query's entries.
>4. The rest of IOCTL structs in the order of IOCTL declaration.
>5. uEvents
>6. PMU
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> include/uapi/drm/xe_drm.h | 255 ++++++++++++++++++++------------------
> 1 file changed, 132 insertions(+), 123 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index f9178fe024a5..b36f3bd53611 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -12,19 +12,51 @@
> extern "C" {
> #endif
>
>-/* Please note that modifications to all structs defined here are
>+/*
>+ * Please note that modifications to all structs defined here are
>  * subject to backwards-compatibility constraints.
>+ *
>+ * Sections in this file are organized as follows:
>+ *   1. IOCTL definition
>+ *   2. Extension definition and helper structs
>+ *   3. IOCTL's Query structs in the order of the Query's entries.
>+ *   4. The rest of IOCTL structs in the order of IOCTL declaration.
>+ *   5. uEvents
>+ *   6. PMU
>  */
>
>-/**
>- * DOC: uevent generated by xe on it's pci node.
>+/*
>+ * xe specific ioctls.
>  *
>- * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
>- * fails. The value supplied with the event is always "NEEDS_RESET".
>- * Additional information supplied is tile id and gt id of the gt unit for
>- * which reset has failed.
>+ * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
>+ * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
>+ * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
>  */
>-#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
>+#define DRM_XE_DEVICE_QUERY		0x00
>+#define DRM_XE_GEM_CREATE		0x01
>+#define DRM_XE_GEM_MMAP_OFFSET		0x02
>+#define DRM_XE_VM_CREATE		0x03
>+#define DRM_XE_VM_DESTROY		0x04
>+#define DRM_XE_VM_BIND			0x05
>+#define DRM_XE_EXEC_QUEUE_CREATE	0x06
>+#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
>+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>+#define DRM_XE_EXEC			0x09
>+#define DRM_XE_WAIT_USER_FENCE		0x0a
>+/* Must be kept compact -- no holes */
>+
>+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
>+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
>+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
>+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
>+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
>+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
>+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>
> /**
>  * struct xe_user_extension - Base class for defining a chain of extensions
>@@ -90,38 +122,25 @@ struct xe_user_extension {
> 	__u32 pad;
> };
>
>-/*
>- * xe specific ioctls.
>- *
>- * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
>- * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
>- * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
>+/**
>+ * struct drm_xe_ext_set_property - XE set property extension
>  */
>-#define DRM_XE_DEVICE_QUERY		0x00
>-#define DRM_XE_GEM_CREATE		0x01
>-#define DRM_XE_GEM_MMAP_OFFSET		0x02
>-#define DRM_XE_VM_CREATE		0x03
>-#define DRM_XE_VM_DESTROY		0x04
>-#define DRM_XE_VM_BIND			0x05
>-#define DRM_XE_EXEC_QUEUE_CREATE	0x06
>-#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
>-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>-#define DRM_XE_EXEC			0x09
>-#define DRM_XE_WAIT_USER_FENCE		0x0a
>-/* Must be kept compact -- no holes */
>+struct drm_xe_ext_set_property {
>+	/** @base: base user extension */
>+	struct xe_user_extension base;
>
>-#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>-#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
>-#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
>-#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
>-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
>-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
>-#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
>-#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>-#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>-#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>-#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>+	/** @property: property to set */
>+	__u32 property;
>+
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
>+	/** @value: property value */
>+	__u64 value;
>+
>+	/** @reserved: Reserved */
>+	__u64 reserved[2];
>+};
>
> /**
>  * struct drm_xe_engine_class_instance - instance of an engine class
>@@ -279,57 +298,6 @@ struct drm_xe_mem_region {
> 	__u64 reserved[6];
> };
>
>-/**
>- * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
>- *
>- * If a query is made with a struct drm_xe_device_query where .query is equal to
>- * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
>- * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
>- * .data points to this allocated structure.
>- *
>- * The query returns the engine cycles, which along with GT's @reference_clock,
>- * can be used to calculate the engine timestamp. In addition the
>- * query returns a set of cpu timestamps that indicate when the command
>- * streamer cycle count was captured.
>- */
>-struct drm_xe_query_engine_cycles {
>-	/**
>-	 * @eci: This is input by the user and is the engine for which command
>-	 * streamer cycles is queried.
>-	 */
>-	struct drm_xe_engine_class_instance eci;
>-
>-	/**
>-	 * @clockid: This is input by the user and is the reference clock id for
>-	 * CPU timestamp. For definition, see clock_gettime(2) and
>-	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
>-	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
>-	 */
>-	__s32 clockid;
>-
>-	/** @width: Width of the engine cycle counter in bits. */
>-	__u32 width;
>-
>-	/**
>-	 * @engine_cycles: Engine cycles as read from its register
>-	 * at 0x358 offset.
>-	 */
>-	__u64 engine_cycles;
>-
>-	/**
>-	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
>-	 * reading the engine_cycles register using the reference clockid set by the
>-	 * user.
>-	 */
>-	__u64 cpu_timestamp;
>-
>-	/**
>-	 * @cpu_delta: Time delta in ns captured around reading the lower dword
>-	 * of the engine_cycles register.
>-	 */
>-	__u64 cpu_delta;
>-};
>-
> /**
>  * struct drm_xe_query_mem_regions - describe memory regions
>  *
>@@ -487,6 +455,57 @@ struct drm_xe_query_topology_mask {
> 	__u8 mask[];
> };
>
>+/**
>+ * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query is equal to
>+ * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
>+ * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
>+ * .data points to this allocated structure.
>+ *
>+ * The query returns the engine cycles, which along with GT's @reference_clock,
>+ * can be used to calculate the engine timestamp. In addition the
>+ * query returns a set of cpu timestamps that indicate when the command
>+ * streamer cycle count was captured.
>+ */
>+struct drm_xe_query_engine_cycles {
>+	/**
>+	 * @eci: This is input by the user and is the engine for which command
>+	 * streamer cycles is queried.
>+	 */
>+	struct drm_xe_engine_class_instance eci;
>+
>+	/**
>+	 * @clockid: This is input by the user and is the reference clock id for
>+	 * CPU timestamp. For definition, see clock_gettime(2) and
>+	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
>+	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
>+	 */
>+	__s32 clockid;
>+
>+	/** @width: Width of the engine cycle counter in bits. */
>+	__u32 width;
>+
>+	/**
>+	 * @engine_cycles: Engine cycles as read from its register
>+	 * at 0x358 offset.
>+	 */
>+	__u64 engine_cycles;
>+
>+	/**
>+	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
>+	 * reading the engine_cycles register using the reference clockid set by the
>+	 * user.
>+	 */
>+	__u64 cpu_timestamp;
>+
>+	/**
>+	 * @cpu_delta: Time delta in ns captured around reading the lower dword
>+	 * of the engine_cycles register.
>+	 */
>+	__u64 cpu_delta;
>+};
>+
> /**
>  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>  * structure to query device information
>@@ -673,26 +692,6 @@ struct drm_xe_gem_mmap_offset {
> 	__u64 reserved[2];
> };
>
>-/**
>- * struct drm_xe_ext_set_property - XE set property extension
>- */
>-struct drm_xe_ext_set_property {
>-	/** @base: base user extension */
>-	struct xe_user_extension base;
>-
>-	/** @property: property to set */
>-	__u32 property;
>-
>-	/** @pad: MBZ */
>-	__u32 pad;
>-
>-	/** @value: property value */
>-	__u64 value;
>-
>-	/** @reserved: Reserved */
>-	__u64 reserved[2];
>-};
>-
> /**
>  * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
>  *
>@@ -984,6 +983,20 @@ struct drm_xe_exec_queue_create {
> 	__u64 reserved[2];
> };
>
>+/**
>+ * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>+ */
>+struct drm_xe_exec_queue_destroy {
>+	/** @exec_queue_id: Exec queue ID */
>+	__u32 exec_queue_id;
>+
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
>+	/** @reserved: Reserved */
>+	__u64 reserved[2];
>+};
>+
> /**
>  * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>  *
>@@ -1008,20 +1021,6 @@ struct drm_xe_exec_queue_get_property {
> 	__u64 reserved[2];
> };
>
>-/**
>- * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>- */
>-struct drm_xe_exec_queue_destroy {
>-	/** @exec_queue_id: Exec queue ID */
>-	__u32 exec_queue_id;
>-
>-	/** @pad: MBZ */
>-	__u32 pad;
>-
>-	/** @reserved: Reserved */
>-	__u64 reserved[2];
>-};
>-
> /**
>  * struct drm_xe_sync - sync object
>  *
>@@ -1200,6 +1199,16 @@ struct drm_xe_wait_user_fence {
> 	__u64 reserved[2];
> };
>
>+/**
>+ * DOC: uevent generated by xe on its pci node.
>+ *
>+ * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
>+ * fails. The value supplied with the event is always "NEEDS_RESET".
>+ * Additional information supplied is tile id and gt id of the gt unit for
>+ * which reset has failed.
>+ */
>+#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"

Unrelated to this.... Aravind has a patch renaming this to make it
future proof. We will need to either rename it now, or remove and leave
its addition for later.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> /**
>  * DOC: XE PMU event config IDs
>  *
>-- 
>2.34.1
>
