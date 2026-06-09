Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AF0CD6E79
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 00:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FB310E027;
	Tue,  9 Jun 2026 00:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxHjCRJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696410E027
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 00:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780965487; x=1812501487;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RKbiRjWNcqNuzIKYzJr0zr3udVNVCMIjRC0ARbNv7aw=;
 b=kxHjCRJKCNTfTHPY2Raigo1Yo8xFR/2/1CBtL9lusbVfXuJXoQQ+c/25
 qAGhNOjPRkWHE6Sr7k2+e6ACqJbhbH8aiDrHKXNnWnuZlOWG5wD7HmUsm
 xQiTE3Nm4Ep9e6jcyhxIEiacHAeQH1XJDMVrLeowtnHOqQUz3M7RQDJEE
 ZHHIB64GhhJ5in2ivyBFAceVE/vHTQoIC0oZDRL8fM9yd1jba0tn1dQBO
 yQEQgF82Ojg+dXdt5pXfI8gnZfKWpHT5RbGq4S4esHc9jM+KHAFXowwuK
 X540raqUyqy/MgK7FvbztscyHzNEfnW6KrF3y1wA34V4/pkLC5JGzIzRy w==;
X-CSE-ConnectionGUID: O+YoOvWqSU6syRup14F3jg==
X-CSE-MsgGUID: 9d59EfRsRQKm8RsMfILuiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81570273"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81570273"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:38:07 -0700
X-CSE-ConnectionGUID: 7AkOgnaaTZaF3jBPw98xFg==
X-CSE-MsgGUID: RiAVKyMjSo2q/IDF3r6ImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="245797761"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 17:38:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:38:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 17:38:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 17:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0q8AytKCJLn3Ouh1qckxuyn41+DZYq8Klgq+s3BGcwx4FOLeFrt7OZ6e/ztSe7srqLRwXKRhvEfZaxX0PnbpB3YjTp9UMVDCl1lbRyWZJ+KYKWXQJV+j+74QEV2vrq8MX1rSL5WzZIacaneNVZPnSbv4I3OIjYN/wrW1xg82wl010eICtu18gYdm8ZBubOuRQvf0/PpaMIt61ZheCxcp1CL65OiaJLlFpvXgGQvdHXT1mKu8n2IxcGCdd88KVF6FknQo0vLeKhBYZFGs2z5XSD5zm70nv8KmuGF7mHunSfdxxlm5Q4eh4IUwz7+97y9RRk8NuO6zHhvgL/6z2D5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/AH3meQq7ZfComg5an8xwxmd8W2ggw2EwmMNfMEZh4=;
 b=lpzKx9bPWaDGjdO0bWSgG1mvTxQ9i0I4DEy0Tjzy1CxuCbjb03uCaNttH9MbzCz/A0rH2q/t3JKrFvCF0Oz83stQ5GfFLxUsyRbACoVCGArqkwQDyjdBQ3Clc34XSbgvs288xXI57n4Nscy4gYiOvWN9A/YuE21K0dczxwnCTIuhjllNO++KUEfLrXuPGZnoyNubf2Q6acUFO7hv0qIifebomrpQJ+aF9QlywmyZlXfnFntSCKHxYY+Yx8VmJYiiv/lBBQqX2N7v8fbv6BOpwPMaV19yewiMyvr19BFlPLQds6i52cJHMyM/6bUFMOSLii+XdzBGfMZmtqbqsk6DIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSWPR11MB9956.namprd11.prod.outlook.com (2603:10b6:8:3a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:38:03 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:38:02 +0000
Date: Mon, 8 Jun 2026 20:37:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Message-ID: <aidgZ1zsihvCPGqq@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
 <20260605123839.236021-25-tejas.upadhyay@intel.com>
 <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <543ed281612b0f8b1cd289448ae917896f18200c.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::11) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSWPR11MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8eb5b0-71f3-434d-d07d-08dec5bf5d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3NmbNSZbiCogQ5H+EhPu820B0Mx9jWGxIl5CCZSO6HyWEcU9C6s8RRL5GL9wE9qqm0WWK6qSqnzm1K3NdL637eQXMWu4UFT/y4E49Ay3N8Yk277QgFzvuxrtOyXj3cVBZizJCZnXgff34PPrVmqJlbgFFwQPKhYv4R01ioUqPndDfBqOwuERpttyHByI6KyDRSZUjchtA+M5KB+3RAlZIEoS21dxWpPQcvYIZ61q73M+QnqWhnFubWmDgMylnmM6CM3Yc9WobFrYS1Tp8soKlbqDA8oCK0j27yckGaZvjjn+GKr9lZ62GqWSfnU79DvIQEUwgEOvRmljnh4alBISCGDrAh172YhuHXNy2+58Ulewms3lf/gFC6CW0Cr0OJgbgzDt+sorz8mT46JMrkRS2JK86vFyX976JEOWH/CLR6ixMGKVH5cr88yKNZFpPKInoH9j8rAHPxPJGi+0JDaCkFl65e9PS24v+GzhLbVnrqbbJt2n55R5FRbVKn5n48S6rMX2vXDku7pc/H2cRGW4ZK1jStJ+VmQB4K0YseWvFx1X+mzKBEYC2qvfAaTGDVBV6j0VpFCxMQCEFxLTgllSHEa5boycnvktl3kN8yDg54A9RL2qKH65+8YB2BFSxT3dS8tKAaB8670WUXwlQuZxgtDNNjAKlmpK37SR04Qpy1D0+M01CBgn/fdc5JwkK/zh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?92E/JobE56AIIC8Z/Xj1SZfStq3gKye78EnWfodhTHMjzA4TKgoYAXiXLe?=
 =?iso-8859-1?Q?65lzxboMlBlWkQjdlon8n0W0hR3Ga2x3fyzrxj16oE7GsAbWS/O+U1n5AO?=
 =?iso-8859-1?Q?vqOS+Ta2Ju4AixkozMLE/42s/HsF56EG1iCJYoFqVvJxvW2Z3QpW2CCM4r?=
 =?iso-8859-1?Q?h6RmiTGJ3GTux6PfbxmvWK7gZk3/ndxZTlw8ZOsm3uYdF/OOQlOetsGgz5?=
 =?iso-8859-1?Q?3wl8Na2b9PKwLg35PkCLIU8vxuIMWIiKtF6wNto6Gm88vyAFupMqQ3jIAU?=
 =?iso-8859-1?Q?TglbCklsjTvgbQDfDZa3RzS7zFOXFRKyCCw8r8+wq8TUIYzKmD1smaehmc?=
 =?iso-8859-1?Q?lss+3RVp/fYYxofxXoJwgKazYcUM7pRlSZoiJYa7oUvCvAmC7wgWOp1ptT?=
 =?iso-8859-1?Q?MAXpb0DD9kKPaJ90RK9EPv8e9nQTUEe+DEpqArVNZfpHEJnEVMVQQfh8o8?=
 =?iso-8859-1?Q?elCsIqhLmpxEQQNFpq/CaZdP4EZuxHUlIvlE7EzBjZHmptaLh4mFRMty0o?=
 =?iso-8859-1?Q?A6csSPGfIHxHInaXhLdT7gwOABhKbCsQxpOWK/WS9P8NhHclmNukJKuDfF?=
 =?iso-8859-1?Q?tA7X4Fmi2ufdnodmny6Aczeh8OpcRt8NBYCfzA3ZdrsZIsZkcgFrGoBBjz?=
 =?iso-8859-1?Q?VC2CPnq3vXeR2xN32TV2ncfGVuAm7BsB7oXsMeSunU8pa9jAiaHwJdxEQ4?=
 =?iso-8859-1?Q?SSS7wuNzNKulnWZWvrNApZOwZ/t7aAIkW0GtrZeZPZ6JBvMx7JfI84ARp6?=
 =?iso-8859-1?Q?uWvIwkfY6Q8sCIv7dzBqdW3yyCijkWK0kfLYGByfV+uCmiTMVG4qLxhU76?=
 =?iso-8859-1?Q?Kq6Lh8fIzQ0GR4pWJvboHYDuPrOpi6ECAfZjd9YzFSyseclM2Aj4z/cy0C?=
 =?iso-8859-1?Q?c5ZxXvQV6N4WQ4/BjavZViAfvBs2Ao6MeFIBxamgHQQ5GXW8ejKFhXfKcP?=
 =?iso-8859-1?Q?ZsngST2gDmAhlQ1Vkdlr9sYZZ2MrXWPEyEdcY38Or2R3wTflpX7Y8sUlf7?=
 =?iso-8859-1?Q?SyvvgQHqdBbS9Hi/pOsbZqynHpe2FTwK9QvEg0zIJBWqMwoVwlmkYR3VGq?=
 =?iso-8859-1?Q?zrolkLfP3UoU0aj1jj5GgXdU+sdNqveo6mxkUDnkZ9Z0GJfIoWwHs5cZ4f?=
 =?iso-8859-1?Q?pin84UUcqTrZmCH6d8CiAUYWwdg+Z/RqcQzVpTODKwhlQJg+NzdYK5q2yV?=
 =?iso-8859-1?Q?Ivsw0mn/k4ucVZYXvLz9in2t63WfYhH78EeUik8MmADHYF9udXGViHdXNw?=
 =?iso-8859-1?Q?7hozHGQQAKB30Wwza6tRLTVVZCzPIjsMQdjYkrU19FmljQhouZf28IWq5Z?=
 =?iso-8859-1?Q?g/yKlW24S7PbiWa8CEQJ/Yctc9aSgPUn2HCRfYDxHzDW6tlyWv1AuGizqH?=
 =?iso-8859-1?Q?xx5oeywjobJqhSYZZCjRsTrCAor42jifFOr05LWxDBzTHKQ/PANeEVJome?=
 =?iso-8859-1?Q?h4cFxRrsB4+FCqYp3gtzKGV2RPEcozBFsg0itzY4PfHMT8oYwkh5nXpeXE?=
 =?iso-8859-1?Q?7/yFVDMHFDjXQzs7Yo+CSq2zCDW5AGPklX4W2D1bUWOY/ylGt0C8/it+Hf?=
 =?iso-8859-1?Q?F8mcPDCNo4dF8lbrIX5gWL6rKxAcPtIt0t66S8IXeT0g/VmxhyhgeGrJhh?=
 =?iso-8859-1?Q?punzleNJkwuWlT4MM/RciTCVM+0k74bV1xM1e+l0K822diWSiyxEtd+5xA?=
 =?iso-8859-1?Q?gRJ4/8NuH7g4eFjuI84oFvmsyClPVnx9J3pYvxktv603dO7l8oI+CJLPA2?=
 =?iso-8859-1?Q?ZF1QZzibQ2XXVY1CNtQvA9PoOYzddWzlXQ8thcnlV0Gpy57GG1H3zIC4Hk?=
 =?iso-8859-1?Q?hgr8krE5Fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: IPgAw+ol8PyME3bMrgHB2HyX+FjfAVmQfKTpL3dFgTRG03eMwpHILb9tb+5eMn5SP7+cqiDX7de7G+EgBX1SSEOXtygVR28eeClZKzvuQWlQPpfU8KlECVWeWg9bsIM5+PxFj4xQfG1ZmDxToP7DJRx/3oPtsNhVXva7piPR4i9oykOp6iRV7ysRcfcU58QdAUjlCpxsQDscE3bzU/tz0cXFDzt5hrZ+lje9eQo5NrqGTmXF30XOshKiPEMeNThMjun4xCN8k+I2+4lW6/lebo3vtfyIWfVNKg081DH4VToWwuVfTMHlT7AO3WjJbmZnE9RyJLyzYR5p7BkbjQ5X/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8eb5b0-71f3-434d-d07d-08dec5bf5d2e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:38:02.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWSOhkyF4/TtPJ+ZhE0AU3aTaahNROVPFPXkoMmylRdeBAPfFHG8mDG3lhWiIZtcCzfxPDcUpu8g4VLuAJeGoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9956
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2026 at 10:03:50AM -0400, Souza, Jose wrote:
> On Fri, 2026-06-05 at 18:08 +0530, Tejas Upadhyay wrote:
> > Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask
> > indicating
> > the reason for the ban, rather than a simple boolean. This allows
> > userspace to distinguish between different ban causes:
> > 
> > - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue was
> > banned
> >   due to a GPU hang or job timeout detected by the TDR.
> > - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec queue was
> >   banned because a VRAM page backing its resources was taken offline.
> > 
> > The ban_reason field is added to struct xe_exec_queue and set at the
> > point where the ban is triggered:
> > - In guc_exec_queue_timedout_job() for GPU hang.
> > - In xe_ttm_vram_purge_page() for memory page offline, before calling
> >   xe_exec_queue_kill() or xe_vm_kill().
> > 
> > The reset_status op is updated to return u64 with the reason bitmask.
> > When a queue is banned but no explicit reason was recorded (e.g.,
> > from a
> > generic CAT error), it defaults to GPU_HANG for backward
> > compatibility.
> > A value of 0 means the exec queue is not banned.
> > 
> 
> Acked-by: José Roberto de Souza <jose.souza@intel.com>

Do we already have a userpace change with this?

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thomas, thought on this vs the watch_queue you have or they are orthogonal?

> 
> > Assisted-by: Copilot:claude-opus-4.6
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > cc: Mrozek, Michal <michal.mrozek@intel.com>
> > cc: José Roberto de Souza <jose.souza@intel.com>
> > cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++--
> >  drivers/gpu/drm/xe/xe_execlist.c         |  4 ++--
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 24 +++++++++++++++++++---
> > --
> >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     |  7 +++++++
> >  include/uapi/drm/xe_drm.h                | 12 +++++++++++-
> >  5 files changed, 44 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 2f5ccf294675..77a621da4487 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -143,6 +143,9 @@ struct xe_exec_queue {
> >  	 */
> >  	unsigned long flags;
> >  
> > +	/** @ban_reason: Bitmask of ban reasons
> > (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> > +	u32 ban_reason;
> > +
> >  	union {
> >  		/** @multi_gt_list: list head for VM bind engines if
> > multi-GT */
> >  		struct list_head multi_gt_list;
> > @@ -316,8 +319,8 @@ struct xe_exec_queue_ops {
> >  	 * signalled when this function is called.
> >  	 */
> >  	void (*resume)(struct xe_exec_queue *q);
> > -	/** @reset_status: check exec queue reset status */
> > -	bool (*reset_status)(struct xe_exec_queue *q);
> > +	/** @reset_status: check exec queue ban status, returns ban
> > reason bitmask */
> > +	u64 (*reset_status)(struct xe_exec_queue *q);
> >  	/** @active: check exec queue is active */
> >  	bool (*active)(struct xe_exec_queue *q);
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index 9fb99c038ea8..35e6e05ba418 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct
> > xe_exec_queue *q)
> >  	/* NIY */
> >  }
> >  
> > -static bool execlist_exec_queue_reset_status(struct xe_exec_queue
> > *q)
> > +static u64 execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> >  {
> >  	/* NIY */
> > -	return false;
> > +	return 0;
> >  }
> >  
> >  static bool execlist_exec_queue_active(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4b247a3019d2..ff28eab7cee2 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_guc_submit.h"
> >  
> >  #include <linux/bitfield.h>
> > +#include <uapi/drm/xe_drm.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/circ_buf.h>
> >  #include <linux/dma-fence-array.h>
> > @@ -1530,6 +1531,7 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> >  	if (!exec_queue_killed(q))
> >  		wedged =
> > guc_submit_hint_wedged(exec_queue_to_guc(q));
> >  
> > +	q->ban_reason |= DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> >  	set_exec_queue_banned(q);
> >  
> >  	/* Kick job / queue off hardware */
> > @@ -2211,13 +2213,25 @@ static void guc_exec_queue_resume(struct
> > xe_exec_queue *q)
> >  	xe_sched_msg_unlock(sched);
> >  }
> >  
> > -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> >  {
> > -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> > -	   
> > guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> > -		return true;
> > +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > +		u64 status = guc_exec_queue_reset_status(
> > +				xe_exec_queue_multi_queue_primary(q)
> > );
> > +		if (status)
> > +			return status;
> > +	}
> > +
> > +	if (exec_queue_reset(q) ||
> > exec_queue_killed_or_banned_or_wedged(q)) {
> > +		u64 reason = q->ban_reason;
> >  
> > -	return exec_queue_reset(q) ||
> > exec_queue_killed_or_banned_or_wedged(q);
> > +		/* If no specific reason was recorded, default to
> > GPU hang */
> > +		if (!reason)
> > +			reason =
> > DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> > +		return reason;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static bool guc_exec_queue_active(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 35b5eaf590fa..3765e8fcdcec 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -7,6 +7,7 @@
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_buddy.h>
> > +#include <uapi/drm/xe_drm.h>
> >  
> >  #include <drm/ttm/ttm_placement.h>
> >  #include <drm/ttm/ttm_range_manager.h>
> > @@ -537,10 +538,15 @@ static int xe_ttm_vram_purge_page(struct
> > xe_device *xe, struct xe_bo *bo)
> >  	xe_bo_unlock(bo);
> >  	/*  Ban VM if BO is PPGTT */
> >  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> > +		struct xe_exec_queue *eq;
> > +
> >  		down_write(&vm->lock);
> > +		list_for_each_entry(eq, &vm->preempt.exec_queues,
> > lr.link)
> > +			eq->ban_reason |=
> > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> >  		xe_vm_kill(vm, true);
> >  		up_write(&vm->lock);
> >  	}
> > +
> >  	if (vm)
> >  		xe_vm_put(vm);
> >  
> > @@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct
> > xe_device *xe, struct xe_bo *bo)
> >  	/*  Ban exec queue if BO is lrc */
> >  	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
> >  		/* ban queue */
> > +		bo->q->ban_reason |=
> > DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
> >  		xe_exec_queue_kill(bo->q);
> >  		xe_exec_queue_put(bo->q);
> >  	}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 48e9f1fdb78d..904d58b039fe 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
> >  	/** @property: property to get */
> >  	__u32 property;
> >  
> > -	/** @value: property value */
> > +	/**
> > +	 * @value: property value
> > +	 *
> > +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a
> > bitmask of:
> > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to
> > GPU hang/timeout
> > +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned
> > due to memory page offline
> > +	 *
> > +	 * Value of 0 means the exec queue is not banned.
> > +	 */
> > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG		(1 << 0)
> > +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 << 1)
> >  	__u64 value;
> >  
> >  	/** @reserved: Reserved */
