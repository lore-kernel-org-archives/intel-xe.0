Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C506CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E09113099;
	Wed, 10 Apr 2024 01:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt3cUkXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C1A11309A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714350; x=1744250350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j3vkf7uLFfv0rjVsPQ547VzZGOWHCd051VQVcEYYb7w=;
 b=Yt3cUkXmjTPsFtj7hqHtiivivbr7/avwS+wyR5SBtsW3kVneVFw/Bvea
 GjWvnZUxFBvy4a7AVe9q+rAX6gZsS/gj1IBr7RTKlAUtuuc9VWWgjar7D
 7wH9oFh+tObtk5O18FdQJShGSRmqhb5AjRwCtn5PreigpIQmIgZDw/7Fr
 t/KC/Z6K6KzslFaXRXAayGwPtcLUyI8OusiU+UGKSF4liVuMjlIHJQgvt
 63Lq5UdkMRO4eSOK9TiPKACMxuWCk1dqk06Ro3TaXc8wS0HgeRM0wgk0o
 yMePrZ652sE00vCsymvQ96H+myi64CbmqY2dl++qLlspMsaE10j5RmmAj w==;
X-CSE-ConnectionGUID: 2VWgVlVWS0WAV3c1qJV87A==
X-CSE-MsgGUID: bLiQwt2hS5+PiVbf0EmznA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8226601"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8226601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:59:10 -0700
X-CSE-ConnectionGUID: 2YffAXfJRc6AeNQbfZ024w==
X-CSE-MsgGUID: NtxtofWFSFK43sVjUHRecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57849618"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:59:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:59:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9f52DOk6UKR1nkni+FlkMZEFPw6SCAIDDl9VIOlxTbXKWUarMNC2et19n/Q1ENitZ78JreoB0EAt03Jg0KkyrOlQ1BQC4zj7EKVvB679Zk9GoTnHzH2skn4Px2OaDDqlA7xGslel+x6zzrgxNrWLo2omCSg6JpxqfWpidayvq1pW/dLP83BcDdl7reCwa/a0gLmIQ1nYOXsm62nDREVh1ojVH6R+oKxkfkfumPzEy91VY6PARkZkdG+3MZovP1x2XL1QZr+wRpucK2UguAWGPAP/9MWLWPbqWWfGfLEsyYVSfcbL0gO8mqVuWCIZNHrU4K1J0BJYK9P0Eq9IiBdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkmS9Xjmx0LaNZuCLuqKIG32anxtY88NtagOFFROrWA=;
 b=NLG2E49RoFKNzVFZE/pmXmg2ym9Oi54BmNxMTR5u7qTAtBPdUjr2+FJNCH7tzMIzpETCbMi7pJNmPYnABiCOWdGkspW6e1XQwQFexCq3AAdLi115KfN2eNsFuyd1kXfXYcq3eZVa9tpluZyUUoiROlYdYLU8KAtnn72rLlKFohlRZHWOxihb4sb1ieMOVSzFPbYkP8I+5hShyrjZEALfrvMFXMrsPVHhFC9+vq2YVgTa01TuIg9TBx4x80BtQN9vqyYV5o/sRW65XrKEHXaAjqzOvuCVDhRBnyY/lO8+3D44VLzv5LYb5PqBTShlQm52vZgzCQ2vVr0ZKBu4UGsStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:59:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:59:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 9/9] drm/xe: Ensure all the inner access are using the
 _noresume variant
Date: Tue, 9 Apr 2024 21:58:25 -0400
Message-ID: <20240410015826.1093368-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNxj1/OkzzuvQsiVPC7m5VoK5W4Wa7a/S+1QwQUzTR4eiVtQghauVrX65kxdzpCBs25PtnRnIPRvgGgjNMOeieYzJdikSLhhWIgmK1gguYTPilITETO+98WwWr+sD4FVBoUUCth3RgDolJUwavbj1I82E6+bKivt+6GAOKkLN1Me3bqFcfxqRjfhaiq3mLdvC9WLp+mAZ7PVMx5MrxSR0CLmtw1tym9hkXRBZi2cZ45+9CMKbGLkqxl133evQTuwR0ZB1dG7O6IcfuNdag+U1ZkwQb8dlf2mOXWEKDoBJZlAJNGVcsbBY2QaKjAn8plVD7ojAi7Z/wnNOxtSG9Nz/x8IuEILQ/TbRngkmkZxEOCPyeE5B95M4c9EBeL+xxUMc4pgBD3HSJ6E2+AR2963ExZSJgaQXxvbiZPkgYPsG1e7ztn4mOnEwerqVpB/cLSnmypiht1KgMTetsBwcfvKyZQOPhwK4cAe0wd50+Dzf94/0VivqZiaY8ahyqgXJ+48sErN12SBlI9u2g/QJu1p0CYMu2Gp2F+GeuIsbkl/YIVG1eLVPWPd+z3+zW+Di06U9AFGEQ4XYxtjlyuPdyeE98oMvbiylSfpXYCwNlXoPSJ8YcvHLwqEftDYmEJV8JMI/gz5L4SLAhRnHIXoo1H2NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TjOva/rL+6eQjCEIOqdq8qOP+zBnn1BCpSO6KwMIJt+OF4CJAUGVXUjQDx7t?=
 =?us-ascii?Q?2nLVtouhTFlixu1ApQVnU5QYIEa9qEbYh73Hbs99Nl6sJFaXHrpqDQlr7OFi?=
 =?us-ascii?Q?eTbbndDZj38IzGgSCTMbrG6OjChSxzqeGfr9itUNKLnT0dAUQjuWLdC0GVK6?=
 =?us-ascii?Q?Z5qMCVqwQw4aMeKJcQlgnI+wMJiGzRi3BzmUiGaUhgassDJQpPd2HfnjhF9W?=
 =?us-ascii?Q?Sqyz4TcEXTg8Q9G1dnBHZgnDQQR7FGzKdjlegmcDhKSwyix/I+wejLr56xy5?=
 =?us-ascii?Q?80TT41B3izFSh1FQQNI9nI3dmkc/djsWD/UiYzQhAiXXHjyGaKPxluRP5HC6?=
 =?us-ascii?Q?jgJloC5Lc3OKYKp0mDLF0Ih7ExTwIIJQefwREecdMarv/POW/avV7DcMa4dp?=
 =?us-ascii?Q?wauz/VA1xjUqGWfxbt1YigcOutB68tgOmo34ENjy9oHlzbySlXZCUujF+7Gt?=
 =?us-ascii?Q?qij6u/FbJmENiEA9wibyYG9Mf9I5rmNX9CkSNE6njXuAuES8/MrV3zpD6QM+?=
 =?us-ascii?Q?gk/nJPtpM2jlpWxSOLZGLvKar1OfiEQjSrJCXhv03xkWwN9THIIEgW07/Tr0?=
 =?us-ascii?Q?R9/C0EPcOPVG0uXyhfzYmj/qqt2JIHYoEE3G2NWswedNKF/Nl69UQlOncCTY?=
 =?us-ascii?Q?yZjun6nqlbNweL5+rMyPxANR5PNhZeDKGUUEf3O/MEEypI1FDDuLIU9jUB68?=
 =?us-ascii?Q?wP0bVKJHSooxts0EZfgk3ZJAfoBngoQtJoxJ2z0pRaZTHEV9AZz1b+/T22+S?=
 =?us-ascii?Q?XNb1282SgAvhu3vyW7uJjSuoMenKAnK6NQ7PDEudWKeZwmk69A9c95c8Ld/W?=
 =?us-ascii?Q?IAH7wh0YUgRog1jMMLThlJ4e/7oORvEFHeQ5VOhs/FSWLcg90/vzOmDZmhim?=
 =?us-ascii?Q?d7UNgf/fmO7rc2ldqHCLp/iKgYM/NONbCk0PAPH7KM5Dm/CEuR5V3nQiSXtv?=
 =?us-ascii?Q?3AGog6UrdjUx4zDIUdoZiki5I68PT7Bzj2d/UPurkFd7+rd/8e5UwLsFKi5I?=
 =?us-ascii?Q?G8h2zt2kGFA/ASIFWbxY3/m9y7kWFJ/c16KK79NrJDZne6K7bOwTk5aARJxV?=
 =?us-ascii?Q?mzeIf+n8l2hcdBG4AIqwjd39I69rjNILSRCBYb75bZrjEN3064vNJyogLWoD?=
 =?us-ascii?Q?6hLgGB6mSgyfMfUdyCWbnK9gHKMKogl8hUF7EbTeCc9jBbRGO8XHt5pfD9q8?=
 =?us-ascii?Q?ju6gH9Dz4foj3/WxTmkYCmkYJlRpsa0OdeAE/u8F98GTJBCaRZndYmbOlkA7?=
 =?us-ascii?Q?ZU5sVt3PV0/utbmsTCxx2k9aJ+4p36Qe66BJwetdWFo9IHzmmTft6eEGz7fL?=
 =?us-ascii?Q?Of0fS+WVpVkYWzXEj9m0LZ+XHywgRKhshMyQhDqJSxhjRLn5lgrIF1f2LeuG?=
 =?us-ascii?Q?Kukm3rfpknf9rxh9HKMSNq7c/Hf6WXh5p9/awcdh4WEvIJ/cWdsTmYbEAaPU?=
 =?us-ascii?Q?gyhGJf9oVNgDM31Z4KFUCMskbZba6NWl52HgRHVOp1xhgj/eJ1/mHhRU9vY1?=
 =?us-ascii?Q?BCB2RSKFEzbB7tFdN/f9IdGqTlWxcLUs4/cHyGgoWbWVuiFgfjPF195j126y?=
 =?us-ascii?Q?nEEJy56Gxn1Har/MZ60F1dp9mf25FR4m229OGlTpNlBRup2ikuSXVgCMxJuO?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7629719b-504b-4803-f333-08dc5901cdc3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:59:06.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/84kBnGiJmuXpmbHlAwfs5yGuSA4Aar0o4Ya6kPzOHLVXUweLMiE+RSU8hpXV4JGuqJ+LRdFhMasrKGGEs+1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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
index 730fd6b455b9..8984e50bc32a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -682,7 +682,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	xe_pm_runtime_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
 	xe_assert(xe, ref != S32_MAX);
-- 
2.44.0

