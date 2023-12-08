Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D621C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F347510EB1F;
	Fri,  8 Dec 2023 20:27:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8610EB1F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067255; x=1733603255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sE3tbgwUGumhAfIP3JSayWsGMd3LYwHJWTUaeu7XMSM=;
 b=GgvLf7ud3Sr5U4Oad5N92DCNbv1AQKqLcLZZXtzRJetX+5MrhusmE1Pc
 tSBGZ4Cc1riweZGiZvsaMdEAhrnFRqQ9eoMsBTpAV8pzx6wIjEWbCFLCD
 AdiB42wq/fvOS2FmH2LaCJ4WrXBJOlXQmq21GW4jzMw9YjqleJvUr0Syh
 XLSMH+NZ1fM/PsiNV5BcJea81S6mle1y4IO533DH9jnKFxz6gOcLBCXU/
 ykYrNx2e5j48WGNnbqJiM/Bfa9opWZPyn2HBOX8kT/ptOFRy6oAfZ5+/D
 iuOk57CcmUgtax9+qZbxxaNh263rw25X0blffuwV3zYkgLGKyz1ebk3rT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="384870039"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="384870039"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019466136"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019466136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTTXICDxlHe3VebzPWTV76O8eqXnK03eDQwBBNu27sZ/LHwtkaGVFJvS1iObIj8+aZ2ho302+TSKtfvvc86sj1yrz5w39qWxaw9SkjQIJsUIZM5hgFAt4dQaKZvN+QJ+G4byxwU07o52yayNUL+5YSH0vTryDZkoQdHuLQlFtAviGgMqybpby8+e2Ob3LtQgoZNf5EZ8Ctqvo3XABJSEEpNe51Yu2CDvvG9nmfVcyymIJf6MHgaqUAP9k7xx6KW/yBMWWfrZMebWY0auODE9M/kPj1MhF+8EOxxOOAMrf8viiuslNoRNfWoTsxyLjQ0LloTB9+4/5Ks+EMksaPoyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvcQLRIenTEf9QwQdpjn+ukOA+uXAf7QQKFgtTjeQkY=;
 b=D5ri5wIwXluJhE5HgqvteJCGQBj+dw7S3hO3fLsX27jjv7BVJzE6TqrmZjSDlaxeXqUrFZQEH8AarYEfPhLWx9YkrHPFhLWo0luAZrknRHgXx7mmNrG68pr1CYsHIJo1efb3ApFMyg6rLtrvkJ6TCzVTQ35L/IVAvgzfTwPyzE98p5Xm+a+HtdVnoWnzSI7a+90sNtdlbUa2go4GvU+T7WPz4eswpU3Am7wxHhdz/BOqPmqlWRE0Pf3Nv1iXr5aJ3IPJHKM/MFzBRbbdTQCMR8yfIVBWSRuYyzXQOedOv0XLw5bb2O+MFuySnh2kC9/v9bX2Ppwwx8Ads+M/OFCA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:27:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 02/13] drm/sched: Move free worker re-queuing out of the if
 block
Date: Fri, 8 Dec 2023 15:27:12 -0500
Message-ID: <20231208202723.918082-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5cb09e-663f-418a-7114-08dbf82c1a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lw6TIdgolhaWmzfedeDZ4+OI2+kdxp51DoYi4KDQKn0ytxWuHQbIUe75ywXzS/UZ7YrZ9oVBUF/jBd3B40EIWVlvp4mdxfhpO9eHNyBqMgchHCO7Ny7Yj++BYyhlVYarAJP1zSbyqnduTLzpMGZ+uh5qN+RYBPv9hFeRecJyaESrhiRFniM1O35D0oawUrF4cATl0Gi+n+eY9k2926GiP+2AVX9F+XE71wIoPS2Nm83BssTtK5rr/Q9gmX3PmyJTSbkz9Il/MC6oWJ3U5JxTIACwEOM+aeMKwTh0XH5zATZ1EobzlVF41znrAPVW0cDhVOAEM52JH+Z/78Ew0rtURKBoe8lAow20nE08dAV/ABGI5czUaX4Zz+gkKrQ0YCx2XL3qqIa3/BeVBTS42AVyzUyZy5ulTLAy/5FHa2sFOiqKTN32+Muawp6v+mRb5nxl0MB22x+IeDaZjMMdkCQusvhb8PVtemMz+cSzCfjvwu7IhesKNzUMVQfPmqBtPlObWgcBKzY9wyDHw5SCHPprWtqAA2Nx1BUJhkcqM7NawrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(966005)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZhlprfQXT720DVjd2yNTo6vXUMZH5l2sEboMYLurPhXZ1ZZW7dlXKPWGFQJ?=
 =?us-ascii?Q?rNNHSwhRJf5t9S/RB/6Dh9oHUPyfF54AbNzunU/jNBWW8RHc6LkfQDS7FX+H?=
 =?us-ascii?Q?WHfyVeD4n/yJNQxoWKFmFtNhAgoz2DrpeUl7IBGrPP4jb7cHt0KivH2Wlu0y?=
 =?us-ascii?Q?oJdWO8evaplkImG+28/1CFlJfTooGEP7akbr1aeQRe/rBrSDSZM4DPtoikQP?=
 =?us-ascii?Q?NGfGv2WLePZTK6PKyOUi7vgpWhenRLJ10y10HFBDtvYgrXuAkOxz5+udmwPS?=
 =?us-ascii?Q?mTo1IMshsBx2tnPv5mB2Tm0UKzMSVRrc2PITr5/l119Rc72wlPltedxWybS8?=
 =?us-ascii?Q?eFW5PRYtdsz4SJrur9v+Ys2YM3Rk7I2meXyF3VsvUwLSbw7IG0wht620uUFS?=
 =?us-ascii?Q?VbAYj0I031vZxNU0ZcocNlJIwwehdivvK9R3fFLZmdCfS4Khaf/zp9vlh8S/?=
 =?us-ascii?Q?yUgsVtXIn0moY7trs9JoCacwWY6pRSeILg2tt7nMPORX+zEfpgD7PiLVlICu?=
 =?us-ascii?Q?SEjreG7PS1Xy4Ocq67VGZcTdamJpUsOdf+rpzN/yyT51kD/G0u/qMEXlMJea?=
 =?us-ascii?Q?368agkHenTtIgtVPCJx7tRtbyPm7GFwgUfzkFmDlh7npBjf4ef2kPHgtrpht?=
 =?us-ascii?Q?sdfxF+WWl46PcULQgY0S99Lh4RH0xzRUHAAcro1hNPZhclUjIVY6+PENYX9e?=
 =?us-ascii?Q?k36XsTCbWXBrJzbqI87cg7uBMDBbcaUiq5Y2QTOXEYjmU6bsjhi2c/pdu7nB?=
 =?us-ascii?Q?yus5vAD9anvVTfmsURM3/72H6s16DrDE6/ntgA26cVgZva2wzHREtglowV6/?=
 =?us-ascii?Q?dEWs341HtwvmBNscN3dnivpwN4CWXg2ZdW/psy5H1nj3+ACKXJ54ad+qP5vV?=
 =?us-ascii?Q?tuQ6Ni4EqcGcDiT09zuWLTzCqMQOoD37tW0Vapp14P6vhFQqq/WNAHcoEy49?=
 =?us-ascii?Q?413oiacZflyRc7DLVcvK5XoQck5vVuum7N4fQaGSqnd2Tg69x+zk0v3RPtLq?=
 =?us-ascii?Q?2L8hi0QayfWNPoa2i0+KxmLm/TvRnFNep9KDgAOcP06Y0/4ZIH2xEyvjJV2d?=
 =?us-ascii?Q?Zh7Hwngml9KjXEmz7UoRvhuBZSRtECP3MSywkX91oV7rt8g85/mqSjy1MK3I?=
 =?us-ascii?Q?RUw2Y53ChDOQZKUTvIKG3Yrq+BhMentAkt+cXihgl/Ao82UdDxLd7NcNlZZI?=
 =?us-ascii?Q?BC3BSPMXe+EI95l4mHxW4bFCZzi4GRL1G110ldG01bz83nuouih1RfCL2BLN?=
 =?us-ascii?Q?sjJVOBe4uV+xbsJyoWbcEt0NzUDC98g6pIJIXXDrkTGaj8jeHbwMAO2md6r1?=
 =?us-ascii?Q?k+VO1RqWR5Qp3HAMDIu6TXIwhYTLlcWZgyveEmPyUr5gkEtmct24Vp+jufSc?=
 =?us-ascii?Q?qlhN5HmJ0+J844l2/8KqWqrf5ZHAFesGOLCgO7BUcKkkhJrxdLOKP3+oDghN?=
 =?us-ascii?Q?/GCYpjzKJVRzPoQD+chMXimkRx075IAWo6/OLM6M4Js6ULkhCGeGwFjlwfTH?=
 =?us-ascii?Q?FcD7xsM7j9dBuQhr5uc/BJvcbIsCUWTCfkvqiU3JG10RNU/6FVsDRUBVCmnZ?=
 =?us-ascii?Q?T2hgc7Udrn5vOo245S5y9Gl+8scf+53Z3fOTgKR+jCDCiB21LUSEAsMPDjRo?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5cb09e-663f-418a-7114-08dbf82c1a78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:31.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEGnYfkEsUusmknwlQ8XeNikjQ7f4Nze7p6oyMIElCd4gDCBT3DvJ2SlWPuKBLOAVQDEkzyJxfuM1m7MycaMdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Whether or not there are more jobs to clean up does not depend on the
existance of the current job, given both drm_sched_get_finished_job and
drm_sched_free_job_queue_if_done take and drop the job list lock.
Therefore it is confusing to make it read like there is a dependency.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-3-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit e608d9f7ac1a94a4a63d1ef2b37dd80669ad828d)
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fb64b35451f5..e1658030613f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1065,12 +1065,11 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		return;
 
 	job = drm_sched_get_finished_job(sched);
-	if (job) {
+	if (job)
 		sched->ops->free_job(job);
 
-		drm_sched_free_job_queue_if_done(sched);
-		drm_sched_run_job_queue_if_ready(sched);
-	}
+	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
-- 
2.43.0

