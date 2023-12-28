Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FD3C46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273A410E1D6;
	Thu, 28 Dec 2023 02:13:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192810E1D6
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729578; x=1735265578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YduTNBZ4UJsQfPmmupqPsYZOR7w0UQsMSzECXGjDqfk=;
 b=O2Au5C5QyfAi4RGEpuNuOR6MZ5i8lNOr9aeJ5EuvlA2MBHmMqgRyx9E0
 9Wts7ejnjD4H8WKcG7z4Fu+QrjXHla0SoZlR14DyTKRfvP44piz9XR7vn
 zi3S2dpmoz2oSlpWLJtl0czyg/33bptC4oAyopmmcS3fTLLwmr1Mpp8uT
 +Kho4JNl3Fg/EHApLmrZvnF9GYECTH7EL6d8e4YgdyXTGJQmw0uU5W21A
 YPVsnUpP/niH+I1hQ5C1sLh9Lxl/VvHpTTq7QtsrBLUUhUhqXkQfBzM9s
 vo5PAY33y706FpHktxj2LIA4TAKfIW76EqKB5t7qvqlSe7qIzgSqYlhYl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460830248"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="460830248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="20451618"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmSp8561TBOncQZTfZ5O0P6pcyCko1hyYPqTz9SwGGABbNHEZNPqElY7NLEWZOSqC0oi3nfYq2L1YlptfybFG1VXg0om34X6AKciYm5ej5jsGO6RRQFt/LzlEvQd4zpbo5OTBz4TFZOmZpcxE9mvXPSsjo6JZdJqCtwG0XIC1NayTt6dvgXzjKRJb2hNRInCLEQGfTwUs3LA5UpTEqrOWTsrTt+ZaocZJwSIw/JncKppCrslo9Id4gfMI2nEmIDolSMGV4Df0R+xwt58TP/MJuEOcv01x6l2S1Jc7q9U0OTJED7buWN5vCkrQ/V0o5VWTKegTV9zmIi5PaqBYOpMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGbyZaAkaWOdBJY2sBXhUKdvb1MaCK1nj0zFpXbOAys=;
 b=PZAoHT61BOz3XNpLrwpAVSR9rfjBaOzP2yrTkhOuZNGQqlEL/D+mmaWFmFwFW0H6ortiVrmXtx67PdoNQIk/rAoU2L+qhUVXrhm+FZS7WB/bYsZJKofg5wi9fZyEZoei63eW9J/249ICUPR+uEfOfCudQQgmx9zA8t7HJX9NSt7MXDymqFzQuojyiphGEsHsTCYLwoe7LEgHQoxmgVbRgNpQral9YjMpgoJYEdL9bXFbQBuMg5/tfD38OKyAxRA77cfCQ8f2Cpi/0ZYC8Kk7gJwhxikUH2Hrnl0oPKjoXAEZIHnkBle24Rx7NCSNaOE4T6+7rmxon4VDjR50woXa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:12:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 05/20] drm/xe: Prepare display for D3Cold
Date: Wed, 27 Dec 2023 21:12:17 -0500
Message-ID: <20231228021232.2366249-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f91143-6136-4569-3bf0-08dc074a8105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+cb+qwnOZmGLsxbU4i6+hkD6ETTSHng8GxGBd7erjOXklt7zXhZi9zD87sz7NgF5TGcbRAqFaW0C5oNjE7PgghEomWNFldrN6Ll0pMmOv5RxKLFLCtbH6LOBbkpZNS8wJ6gfvAWWVqwYDZMMEO3BVoy/ZQ21fZgtNQ5VGuBGL4+n5RUD9l4gTIX37MSzJYCGQtLzywfgPM/7hKVcyhYns+NARXpHPFk8eOMAx/w3HrivW+ch5tWnPG9yGUmWWnrKP8C9K4TzgxlZiOa58Ec4lUHvf22ylExvG1z4BFbtWWqVapDLrTiPBvlJRFQ2UGY3XxZU9n1JuKFF308aHpOx6fXSI/Xq5zlv/l4Urj7Q0PognexJnaG9OatZtrDp1RaFxKoMa+XGNq6LxoHxDkksd/DQ7PQAnbk5DVaxV5P8oTn+BSaxwT+4vX1j90i6T/tAzLbS3QUXX89zD03DDmPtaoDplkwNxQjlQL/cJWqwRvQsLC7LLWI8QumSjmCsuGObznF2OZjRt/BnQWC6jkxnSETEC2G4sO4Fr7klhoMXHNCpQI47j0B/8nF0kpUPojHyhpucLMwAuft97EeIGhYLZFwQIgRx2HPUxIYCIq7eiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZhRVSnGGmzS4C07At7nn4W1V8/zavXBcCQ8l7vbzmvubWg6toEBR20c8/rui?=
 =?us-ascii?Q?XEWqanq0pDu8wSMigm63y/uq/pgSkTLVKQdITBZtFbAkk5jc/AtHiujW+bWR?=
 =?us-ascii?Q?08KxCHWic2FnRSt5hIE4j29ub8DxHFYRNOx8U1TckZuN8TNthhBpvBOSRBIZ?=
 =?us-ascii?Q?1q6+W4ohOBD5Lzrn0ia+/H9adUztl38T/H3E3AvXzcZyeEDPaHdQJG22mhNo?=
 =?us-ascii?Q?qf9gYWZPY4B2tBop6b9KeFNoldhhqeVJ7gBEC2pw2t3CpQbgRUl2r39+z51G?=
 =?us-ascii?Q?yTho52p2SV3Gp1i6q0tn4vlcRgDUFiSRCg8XJRk/w5/bpUXCkAn6Fp9OzG4R?=
 =?us-ascii?Q?ia5E7U7YeJCN52G6JkK1Rcp/xIhCPvVHo7gmL9sqcRyuJrY6nZ6f9xBAQZc+?=
 =?us-ascii?Q?OLwwatFWfabtNhPsj4usGqdoAJMvklTYF43zYmpCWN7b19t1328uOyfmumqj?=
 =?us-ascii?Q?ZWpRU6td1rAg4g+9G0/A8n1hODHHiOeGhVRlzxUHh0LSuubIjC8TvRlTDl6p?=
 =?us-ascii?Q?uSFsMnYv+u999OeSGof7cLoORYKiLKlBuLcTCxH8+CTC9WMxuyDUPZ419yOX?=
 =?us-ascii?Q?PjjCi6FIbJ2w2HcEeNyOz/ur9vZYMW6uu6+ICa/F5Hryfl8/cCtvCl6pGgM2?=
 =?us-ascii?Q?2fUP8bOOCoJ0GjB/Dxkqau+vrXkHvKna7ISs8jcv3v9IwDykc7uY4sTbAlmN?=
 =?us-ascii?Q?cpVzs6zalocFW6ZduLXzhhKHpKFlkPZzHmumUK5KEZvl4IGiUp82qLsgcBtB?=
 =?us-ascii?Q?P9HWxXNlNSd2oBYIFuq5coymNqeM3C6FG+7V0EYhwkhfMYvWKTEkCLp3UC8O?=
 =?us-ascii?Q?FA3BZakrZPVOYIn4n/WSMWI3gKFuicYXDdRrosNC2HBrcstTAxo61HX4tDz5?=
 =?us-ascii?Q?zxma2b55fAe6HAzSxCMUPip4I52rRSMeUQ1q1vmd0VCWCGFZY+xX280TLCSx?=
 =?us-ascii?Q?j5D9g3ij7PsKpPNS0kN3gshgE5+VnyLx+nOTzr5RdBHc1krBa7wzOAd2VN2y?=
 =?us-ascii?Q?sbzPGqr/mZazawASpJ0H7UDytD/8txM4BjxaltdEcl/9jI13euxLLmuPU7fu?=
 =?us-ascii?Q?+Dyw0q9g9hxG/NqXpHJKjQvC6lBSCBV3dQKQUkyGFjc5y1ZTGkfiTmW27QpT?=
 =?us-ascii?Q?LZcB1Ci1wX/87myG0MGq/+t5Cqw5TEoc+4LsFs2rWD7/AQld6jf5kowbflMA?=
 =?us-ascii?Q?RQiw1OI7nfOqDIzjdt25XYlINRpIUfJ+xOGdVkysgcmRIaqwKXy3NQVOvKz1?=
 =?us-ascii?Q?cLxhkpWVXazbdR2iDffPk5QYFhqJ10A5lzvGmk2kkz64L5XPYntdhd8MfbjQ?=
 =?us-ascii?Q?raUF33+iUgdsb3xdM9fDjhbcS1T91fP439huGw6uv0mijanDDUhX+DmVmalZ?=
 =?us-ascii?Q?R5zML543MjIqSohAMzUQTzesjCZ9Gjchi26iSdvyiE94CSrsbT6zpZp+mc7K?=
 =?us-ascii?Q?jp3imae19Nl0ymrWDAahN46fjyY0kNjS0fX/qhO7yy7lR5o0MXjeLwIlvv0F?=
 =?us-ascii?Q?EVp/iaULp676qvPCpJkDkSi6dc/TrRdkP/bKS93L2sE9lLYRXXeeyS/FrUSn?=
 =?us-ascii?Q?2bzSAqdq/3kD3qOVaxit/LhugEAI84kVshi24lZh9MTW21GTyzt4HVJ3AISI?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f91143-6136-4569-3bf0-08dc074a8105
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:55.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uns9sr4ZyG5VekN+gz5klcvJVHp5Rh/WrRU3BatnvCb6bIkKE5GrRTTj+y2yoNgkZ/q8d+OKNcAKm8MjfChEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A full display suspend and resume is needed when the power
was lost during D3Cold, so the proper flow for DC9 and
DMC restoration is in place.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index bd5ca41e19c5e..cabed94a21873 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -291,6 +291,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 		err = xe_bo_evict_all(xe);
 		if (err)
 			goto out;
+
+		xe_display_pm_suspend(xe);
 	}
 
 	for_each_gt(gt, xe, id) {
@@ -300,6 +302,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
 out:
 	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
@@ -338,6 +343,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 				goto out;
 		}
 
+		xe_display_pm_resume_early(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
@@ -353,6 +360,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_gt_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+		xe_display_pm_resume(xe);
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.43.0

