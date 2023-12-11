Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD5BC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB7A10E4DE;
	Mon, 11 Dec 2023 19:13:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6210E4ED
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322017; x=1733858017;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=1jlO03oxD5uHv6rGKY0QEGfX/GEacGWUcyfbEOqKeIs=;
 b=EyazMnqNzT5LO8hDJWJPC3A+74hBpu/8OpvK5igADlnEjVL3lciwbCCm
 wkNgAHYlNtSrRzgHJpN3+XSGvgndpo7xhsLlsMRP/05pwUHtC/hXNrRXz
 Y6VYX6AXwhUT5DXNvHeZaF8YVathuUyf6FVgXG3QBtWOMtpuYGzct2gbR
 idIGae2gGvY/bnOkADhY4Mombf9aG5H+Zvpf+8pWDJKoOgcMGOHl7IOBN
 bDTIB1cu+q/AwsQINZdQM/zLudWf2eF6/+RG6XzWoKtPp0SfrFa38dqOy
 oI0X6nydJ4FOtEdo4yJT4VbIRLvCsmbbnM5h4St6R1apDN8JNTn2lWdMT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866922"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585683"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:36 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWhy51T7x1pu1EyL/KGoyuk+P/iyFEdWoYLiMqDcduWFxvmi6AYs8lb7bTXosfyDZe15onS2my7ej3EIKqjL1weFh0j0MrkuZ6jjRNE705QZNCK5PjoxyzmkiHVgVOQlnkn98svrZynznf1Dm1305aNg4IN8zLSs7j73utmXCBRdU6skHM/q8wCtKWbqE8w6rFaxzz1BbfpAnP69u5OSjvFmYjpk/VkdAUzE1a1CPQq1PakNDHjWGcePAy7OLxqUDTgN6SlJigqzdCUmBjpgwrC6Mv4eTxjTHK50bT51Szqg2ZceU63fWBdUdcvDeXA9ot9MzRupyaG5vxwDUk0V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceIsWg430NSCulIHY154K5996APGeha+MoNkSrZuoHA=;
 b=CfUeCHZ2K/+BFiKTEo/3Cldt8XXRJcYQMN2CBlIwUASqo6MaHoVwRkpgwiDAHc5IvcoG6XbGMM+o3s/Ijv0t99uG/6Mknw7+fKAEvw0ZKboODHVVgOt3YKE+E2r8pKucgQbUNWmvVV9VuzFCay7oVMMBpDiL6n7XeoOD5PtbxBpszhjUsAsd9tat47S0bIQlrhj5SRa+zKOrMfH6JVK6iQvi4NrzrtJxzJjuPzPupNjBcp4JkSfFCqVIbmxR4cnUdUZr8OTExE2dN+73TYvuOAYiR7T7rAy5y9hQ19sgyQwHq+7xFPgAKzmq0HyT8uI9taO8Hv9MI7tbNNCCj8mCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 07/13] drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()
Date: Mon, 11 Dec 2023 14:13:00 -0500
Message-ID: <20231211191306.1069362-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: c680e70b-422d-481c-694a-08dbfa7d4384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwOMJxGOX1w36B60+WGUVx2L+DmOH9955UId2U3x1H/IIGW21iOfAr8KtSmI5zW9Ku8DWf8vFEH3oGNv3aYXv6f/+ou9tUBgEW5X6V91nn5cyqLZ2ZhehUb8HyCsC0d2qfbR/LBLNuYAaJxZOefzITWiRlLGRDAPZtOykgoaHfofEsoidO3K0WtKtJbgboFKKuWZ7ldFtiFgfrHuSjbMw+8tO6tSCZbpDVxyhegCWqoudY/xjT+kJAw06wyOh8+txjsIyz87tUN2PzmsGc0R1b/ifrGAoQcf0N0a2Hg9G3IfEuUNo9ApCIMzGUJchfVV2NMWnHH+rxiW2u0lf20jZKEfWT2fo1rcC2nc9daJXiF2HIuVbnTgbbXINitx++ouEblhuqanCPyLfg41nwLYHKi32RghEvLercdS8xWbRqw53jt7RfG5zWcS9m8RmNzZHWX8cBoz2kawbpcPjkRNak1hz6+AkI2EouYTAfL36fDH/JWJod7xB0Zb5vc4/Tx7+zPetRoFLXoo04k9YE9qiZ42ffH/n4uCAnMrDzH9nso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(36756003)(2616005)(1076003)(26005)(6506007)(66476007)(6486002)(966005)(478600001)(6666004)(8936002)(66556008)(2906002)(8676002)(6512007)(66946007)(6636002)(316002)(41300700001)(5660300002)(44832011)(83380400001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZlssMZvIk4IvDdaHFjov7wEAg6gcsYLW38COzUxFtpcGL8Hm8xhy+lxmtKJ?=
 =?us-ascii?Q?lRlJzkmYPODYfbWeO2Juhygug8cHfUfabQMazt8kUI6sowGyOd+S7RNb/U7O?=
 =?us-ascii?Q?vWmRtX60S5JbTKwwGFbZgyZkas7sDSPBBfnFpZJAV2ahxRt+i62CWExWqTKN?=
 =?us-ascii?Q?m079COTaAezFxn5o20LsYc65cvZhYFcbJEZroewpiRRfl5knoe63KMqdPAlC?=
 =?us-ascii?Q?hFd6PUqbOk+ennIgkhmelL2zWBI0/CPC8t7pecsuIZR7cSd6wgkJzTyeFmxo?=
 =?us-ascii?Q?RQW+StK/PCy4JVzcqpQqu6wTnf/cUt5AmHhmnUwIfibhUJmYhx2brpGYCKuI?=
 =?us-ascii?Q?X8IHkLfMbeTq9W+DraUSgdx6B0Rtb+osgVe4mIdu3PEIL5hDYyXlhWO4OW+P?=
 =?us-ascii?Q?YHLbSOs3uHjGnP50oNHxCT1zT5wsAm8EE1krhHprlkY1SCszsr7tHuUaGmlc?=
 =?us-ascii?Q?VVZho2ruRqnW+1Fh4proD0p+iXjb+1do9WxHSyMECOKmn3Oe1UDwxDBGdEtt?=
 =?us-ascii?Q?Swr3u+ahpcy90l+TF6xIBoQZqxM8nsrYw09KzfbqB20dKoQy8bjLxYiHD7dF?=
 =?us-ascii?Q?MNz6mOn9iTBWMoV6YbtaoWq4bxqQoEhs57vsdWw18Z1HABvjbB3jkQfxOJvn?=
 =?us-ascii?Q?YciRF/T+1L/fkv7iyCnWiVIhQEOsxAWFyRU3YGJj6oQoHT3rWg44zdcJbyrG?=
 =?us-ascii?Q?PIEhdQ6NkgQOAg/v5lhWei7yydLF8aGNQiMnSJ5gqeo56QGcU/Eof1yAA+2J?=
 =?us-ascii?Q?ZfX4Enjrj1Nr/vWnjmKwpr5I2B0jlZISQhtmHtuDNXUUoyeCXi4waa/rfAJt?=
 =?us-ascii?Q?ZuafDX4xztHNpt/Sc0nOcjpieW//yjy3WJV8g4MRI4cCL8eefEP/XvWsFH5M?=
 =?us-ascii?Q?CQhoHEv2d0wxJKdxo5Rvxa1lUleQvO18DCcXw1yVlRR2jxwrMRrwI6MXOws/?=
 =?us-ascii?Q?BtXiTt8ZuYaJe5/MXE9phk00mJC7fgc7TK7fktLvM+gzvZjDmWVA9G55HIil?=
 =?us-ascii?Q?KDXq+Pv5P2/vZjISYAszqxK9CW0GF4dEiPs9B2xLzFvJ0I8250JrSK85q0EG?=
 =?us-ascii?Q?OlhR9H+opfR4PE5jDrbXhajINlIX8IcAqgtXqe4cpR+BaXJ6X+6ghpMvBUBS?=
 =?us-ascii?Q?4Ow4JipCK6fMvlKwG+9XJmbLVw0oaqAfo11VGooN5p3qIb89D7klvvPNvhUv?=
 =?us-ascii?Q?LUAXrOs0HV431hkHEHGq+EniWOzM8rJ+YSVRatDnU7qkexJZR7mYlljwAm+5?=
 =?us-ascii?Q?Is8nFAW7YSIdh4e4OQnBSYDSeEJlw3C9bImDxVkuM28Foq2xmizr6KYOVmMd?=
 =?us-ascii?Q?Oz/6mfa9K47mu7llAjzYCKyzKG+9TJSbdDjIzzl1MqfF5+F8D7iI51q3B6Ir?=
 =?us-ascii?Q?4fqMRR6EXcTrxMVptgcNmO0DLvwdQHKGz91ZhalcgnHj07ZbE68WJvzdr7Re?=
 =?us-ascii?Q?jpamRMMWoFrcuU2Bjbud103jwwq8mbl2f9019oek0ODwcBc7casvkhAM5+u7?=
 =?us-ascii?Q?waOHHFajDohpFTMgeZ9H1UcgnXmEFv9TWrv1Ek6chIhfc0E34miWpZ05lPvT?=
 =?us-ascii?Q?d8/6VT53mfyJ7jgBrpKMnvfEAv8kryaB2+Xf1NTO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c680e70b-422d-481c-694a-08dbfa7d4384
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:31.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuPfv7opu46XTyMuFmCgYIlJ6swJnE0NJZ6hu8MYC5SqM6wpTqgr6mGAjTaAXwYo1CC4HMTiDnCMmzYlXU2+CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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

From: Luben Tuikov <ltuikov89@gmail.com>

Don't "wake up" the GPU scheduler unless the entity is ready, as well as we
can queue to the scheduler, i.e. there is no point in waking up the scheduler
for the entity unless the entity is ready.

(cherry picked from commit f3123c2590005c5ff631653d31428e40cd10c618)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231110000123.72565-2-ltuikov89@gmail.com
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 8 +++++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f1db63cc8198..4d42b1e4daa6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched, entity);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched, entity);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cd0dc3f81d05..8f5e466bd582 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -925,10 +925,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
+		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_can_queue(sched))
-		drm_sched_run_job_queue(sched);
+	if (drm_sched_entity_is_ready(entity))
+		if (drm_sched_can_queue(sched))
+			drm_sched_run_job_queue(sched);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 43730f1ecbfd..b838a3e53040 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -558,7 +558,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.43.0

