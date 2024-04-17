Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A00C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978FF10EB48;
	Wed, 17 Apr 2024 20:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1PUGNTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5592710F63A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386428; x=1744922428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Li6NaweAcfyCmDx12DwON4i3tfHKBrRxNafVaQdMjeM=;
 b=K1PUGNTlwiRBNejZlCx17PjWzagcgdEjdnVy7PpEAF0cmWqWI4+YhwTq
 h6tbQYJjdynUJhmww21WxNP1DxASMtP3gx+DDV4kz9C9pKU1Wvc/DeHjk
 N4A0BHsCNXtdNSe+QsAS3ujtxROq4aEWf/hZN/gDr7Vxl0MVZ0LCs7/Fh
 4pVmHmUmx+Reypi3butQTgpRe8gythXzzJn5tGZHXSJavmjS1+GUGVMWX
 XZOQSbLWK3tHf4S2lzM/YrMKfx419cbJdEqBScWS4tX1COBBBFGNUxxrI
 ri/vA+KzvWbnqeaI9erdKRRrOg3Wqc8k37tJazlTBpe+tkshWohl9C6wq g==;
X-CSE-ConnectionGUID: TZ+sCAk0Qqi4OsqAeXVJew==
X-CSE-MsgGUID: o9TutE2sQ/yPjnt/xB/7aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9070462"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9070462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:27 -0700
X-CSE-ConnectionGUID: CkZWatf6Re+PwDMj9jAHfw==
X-CSE-MsgGUID: iFILFIV4TwSih8BY9RZrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60172059"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIGEnF3Rr048W6C5xiG0/wQjteuVYlDMJvBjImxkGqiuezu/BcjV+tSd0ca/EDTAe8P9zfnFoZrPeG9AK8IU2QgPMCWXu+kem60KLpSJ0TSxSOnUYTO3h9RSs+EBNOlepYm1zttJZvGMPLzhA80MZ9UY8Zdvnni2krlPPwNJRddU+Vw/M+OT4Xs7xHC1PuJfNWacO0KYRoAwQEvxtlsbHb5hVL+xtDjMJlcuAR/2eTiKVhqj5fB/Z3V4upAgoJC157Mgk5RaQJ/6yD+20jrvfvIezEAhQB8YB8dwd/8bBd528hhLmEotLpa/s15N4WypFwQcVEEpimCv+ooYSywzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6SlSu5VtpORBFq1JU8YdTHDcT1ixZsJVD0PUAswLcE=;
 b=VFIn4thUhMsfGKEtY7zJ7E1/AospwwHEeZVKy7W4Lqi0OiO+k37e+VKIFXOEpanCajKG9XJc82JAK9b6fwxekz7dCG6LWBFFo8dmZpf01Rib1mvN2DRPwc7DMQdqKg4pfs74QaWFDVMpdwdXzrGolYNzNX1kKP9csbfDNjaPlEQNCb9Ev7K8b+hLrIhI+FdaD4P05NYyFHGGCXGvFi0HC20hX5YuESN3Mhb5jx14XCgUgrD+tJ+fJZjzzHhMc0ut7VaqoMUVj5WDvxlhgXNpzuF517FiTbfTTZ84fO/QgLDt20iLDM9EVIaFJ6W5+Xi0Xbz6WFWP2/uH+TGpuzxr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 09/10] drm/xe: Ensure all the inner access are using the
 _noresume variant
Date: Wed, 17 Apr 2024 16:39:51 -0400
Message-ID: <20240417203952.25503-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a2c741-843e-4fed-873e-08dc5f1e9b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rAP9PhHn7VSn8nWfpIs/7ILE3DtG+BZAe0GdwOWWCYlYU/F1vqocbdu9Rw9OoKMrlYsl9OVqahdNFaYJmwW73jfS2bHa5Y2n5gUXH/yPaHcJMRvJp1tTaHFBrwATEOZYhFtsLRZ9YB+2evB+omjsqbMBAH4Yxip4d4fF7js4PyLdAzFrUmaVAmLnX2i8+rzn9SPwNXYwJYtT1VkJznIOuynpyrHEwKvu97assRzrDnjPiglXvUveqlfRvthE9qvscwez67A+4TqLL+5ywYRR9DgaQnmCHnX2MktWL9qPphBbj+uw3oXR90GPipBLoujM0mXoiWqTENgqcnGrprL4gfwukin5OopauskOAo0P0Mp+MO3BLlxZkWT480U5T8q18DG5X8cHDH6TFshR/6RJtdSJ/la/LfFoIIFw8dizCiIbWYsktp4G/B5lYqUtwhA85owDql7NuKzjwTd4ozcIY8iqxVq7cjP41/SX/AfbTJkFbQR7dBqA1qOBKnVtXSK4R96/jdwiDMxOAYwXTTqXkdEliSq57EIOQHqJtVAfnfc6P0CAmeDFNM4iFkKTmrjgU6uGnMlg32feOA+w1naSJlq+hQ1q79wKszPEuLw6Oa/gZjueRRUTBgL6N8DkV5dssIA7vFoRzvpcz3wQ8yTcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsS2GP+vpO3SKuu74YctWhjmNn8/tiDQPXCoyd77saAIiPn7UGjfr4g7+Gm6?=
 =?us-ascii?Q?aghSXeVEcSOKoXQVKriBGi2ulnsaojJstAQAxIU3zLkEo1hs5aryaAwHQjj3?=
 =?us-ascii?Q?54kxZV9v3PwVI/3FOMhCNvd0vqy+IlKlO2R4O4lPY94bOQvAKCiO4iz3wUU8?=
 =?us-ascii?Q?BFXfkxKVKGLoY4HWpHQ2XnrsyxmrAPSV+iN1B8IhW8zEdRxQKDVA9whFp/1x?=
 =?us-ascii?Q?TpTOXHLVFai759uBFTMndYPmtANGzkGYiIYRw/n/Wqz8VD4hDfVqad7Zvkxw?=
 =?us-ascii?Q?mqj1I53le6eXyMXuyDZOmS1tr5qiQDUYgBcwBzjWmrUH5nYx2dsvAnpucxve?=
 =?us-ascii?Q?8F6eV9jcLQwfLbiji/h4CsqBPHEROcdifma5pCA3hGn3b4flhCjuIXfrtd4+?=
 =?us-ascii?Q?Ev/HbI2MEWAQW0gTL5PJha0oFoCjbS5wG9tX9AiSwVAx/0pjpOY/qQLYbb0J?=
 =?us-ascii?Q?HQvjw9tuOVCMq4l7AIKiu8baKaxmoth3t66VBnIcwRddUc3kh8XVxb8h4Wmf?=
 =?us-ascii?Q?kyjAGjwPis5GegVHQzDckKvKwIDHOs/YjaVgu63++TCeU87GVK1n8wd/u70U?=
 =?us-ascii?Q?9c2Co5ulPH3UXcMf8kd8Jyd17qLmUhzIt9sHvhK5nxldtw4Gyz6a4vmTFLmR?=
 =?us-ascii?Q?4vMf9i2uehGKkvr5JmjnYqhGq4AoT74bX++ZFQbKmktgGghhKFsvlI+TTY/2?=
 =?us-ascii?Q?2CJWU5H4XMzPv5vuC+LUXLG2hAezoBsDNeLoG5ji+7nvHJoUe+YjOkftk+PX?=
 =?us-ascii?Q?0dShqvHvEjBc3wjH2f/LoufB21GxEbMks+z5CYnbDHWYwzU7ESjb4gmPZ7r0?=
 =?us-ascii?Q?lvgHPAvyZz9jNW30TEVTR3dVApI4+z4NiLlmkFnZq1tOstxQETJenhq0oRHV?=
 =?us-ascii?Q?+zFv8wFFjq30rg5/mDyeu8EXkE/niRKhF1CoUSHmbDlrmzEBUC2YUWNAFAMd?=
 =?us-ascii?Q?j1MdMiZI+3pcMa1gpV0Za+YpG6TlS+yVL3WQbM7y+zM8A3CJiS+BsQOrsb5W?=
 =?us-ascii?Q?Fw2RGAlG+uHoDptIqDe+P1gFwEacJjQ0MuT7jzg3DcxT16sPl6qiWQoYU4a9?=
 =?us-ascii?Q?DE5ZrlmmnMFbHihNT1ASOT2qsEPauNgm53cqAgCMaSYJQMjA4fS2P0kDkifa?=
 =?us-ascii?Q?t9qf+hm6gNREXtUAoRHo6YuJls6PUlA5JTvoS4kwfX9EbubYneIFWBFRkXrP?=
 =?us-ascii?Q?kjKKElz9z0nRgJAi9rkPDg/AaD/j1FLnO0mjrb3WphQbvQ2GajgBDSib0t4N?=
 =?us-ascii?Q?ZGsMwt/Dq02vj6bI4iJaCOX5GHFIeRon43KtEkuIQQJtNZ65WiM0f9/FRJUi?=
 =?us-ascii?Q?2zi8TflkQ3joufopxGQbkhv6jRPtZVCbYlf9BuMaHF8yCdbOp5F2jZDo1osC?=
 =?us-ascii?Q?3fSzktwWMFBn67YcAJJZ3lLEqhRSy29nETpS6qlTl7slhAv2/lg+TKlaX72u?=
 =?us-ascii?Q?+VfCBkQqNVFsFwtIpuQvsK/r/QghfT8dGjCCecAo4T/eG2FA5yekLr2H+bjJ?=
 =?us-ascii?Q?qe2LPcbIPrCN5ExxPVcRirWdVsYE5bz610x+7J59hyJ1J9gt/TyRq7d4IQX3?=
 =?us-ascii?Q?y3K8M4P73zqXJITceV3zD+s609jVOyn3wSuGWf88v4BWvQwxoUPyRBPbFno7?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a2c741-843e-4fed-873e-08dc5f1e9b4c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:24.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO9mcAI9X+3KyjykwIkyynoKdJvCOyCWOrtBGStiQvwQrGGDlUtR7fD/BJGbZTURLLOumG1dECLou3cpUR8/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

At this point mem_access references should be only used as inner
points of the execution and a get with synchronous resume previously
called at an outer point.

So, before killing mem_acces in favor of direct accsess, let's
ensure that we first convert them towards the new _noresume
variant that will WARN us if no inner caller happened.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 47a4bb0b0a7b..a7c4e4f73200 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -749,7 +749,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	xe_pm_runtime_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
 	xe_assert(xe, ref != S32_MAX);
-- 
2.44.0

