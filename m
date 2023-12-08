Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF715C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235F10EAFA;
	Fri,  8 Dec 2023 20:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4510EAFA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067252; x=1733603252;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=EAHXY0dFHw7akA6K2B71K8oQKoxy0CygTpWeYvsWK58=;
 b=CedH5ALnQk8+jcDU1bW4rS6DUloLoPvgrAUMN1pTiSxkJPQCM8ac4fHu
 fXlHXsOafl9cmGW/eyyPcCiU1MQ4MR7kRvbdfYOEraqHBp8YayD9NdtEN
 M5PLcVWSqFQ6uuBzdgeym6Vo9Djto4oV3hqUBXGGeFcTWlAgamp/j9mqO
 C7pdMtDbk1zhedH6CkaEZ+alFFE/yUowvZB0J2qX5CRqfft0fHVpN7pxK
 mnCXdlkFzzhcye9bQbTkdJUOFSUYUIBywC2NNCXPzpIqMGcs9ki+waDYs
 uN2rWpvUX/Y9UGvrXpkuUj1zqWSVtLr1K7SveHTCYTF4FY3JaPM/AyXjw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1279036"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1279036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806515929"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="806515929"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkuFPHwwxKsszdq8umxXuSriOsdTrDZ/BDAfXfQCNyz9QPQpzswXfP8rvrmVYDQRRgPKLZf7G/if3MnVQgNwxAJeQs75IO1V16GNMThZnrBWnCPpKZDZTouzdSpgz02AyDwfMoljc/Ss4o7jWWip+5qZD/Wt5SoGTNGNV6FNJP4DD/96bALawPdGocKJiD5BfO/omewPQHWELa5qclVDnWEBQ9HeBVQw9fbXTtDR4gveEeEVZEoKUf1cdQwlhVRlniMbd4eKvYNPjzmRdNPb2deujr4FvstlzgG364boIxpJR9OC/8OdoB4QEtuzO6ft2oFw3FirlaK+efWUUTwDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+7uUPTx1Tws13Swkub4K1MA794ssoj59xRab/+LZ14=;
 b=dtJS0F2EH15VALMyusBZO1iivPix5YzVz+hX6gu+iTQyoZWOG1ZajZ1DN3AuYqYIIa17TFZ0g+f69XDViQ3YhTIL7BlCFjivCyY2JzHu7mUvdyHDrx+pQ3GX1mIBB0+buMPJQiCR1b+yA0JdoH+rx36Iv7Ca2E/SZ7mUzhwOOPP2LrtkB36UlTlqGOSbJjiOh5zdV16+khlU9P/pXyYYtXOYEG0vEXU7yt7260z/bfVii+MPeOwQW1T/3dAH1yeYLuJm2eBntM9bW9xEm0nWNc2+yGoD8fLECUv5oo+VCE/E3/EEmQ/nbr+dxr7tnr/BluRpPNF7HxfRyNBBe3U3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:27:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more
 descriptive
Date: Fri, 8 Dec 2023 15:27:11 -0500
Message-ID: <20231208202723.918082-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b96570-bc19-469e-ac54-08dbf82c188f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg0Xy/LgGHPGGrWY4N+tpiMegPB6XCbQULDYYfr9KDEF+ajFsBlD5oNwu9f/FsgHS4GRLCyAumSgp8azMeFPUTBOBkrQdzbyefXeCeCZr4UEkv2Sa/WKYckloIW9SIx+Qsyb4/1fw4Z8e/PmxtjXJFePHMytJa6k1Fpncgr6QZVEK/PNz8iFGgTm+Ua36RVgdPnWB5CXo3usWhjyy68vsbK9Sr/KbsAD5IyzRL8fsxG79wg9YQ7DytCGJXVXDYweYyVdTmluWLFOP47n2qTgaoTJX2oYO4z0jwcO34VykcAPEqMSUq7ZRnF+OM3ynUkCyCXuAbNkmX4CoPT8kGVtHwDaJ9SphiyTIT/6y8fjtZOnbPNXjwb8mLNMX3vRHxif++pvPb4VsVJJsR7kPrQ6qXllVj3GIR6XBE+6MLGZDUcY/2zWK/JkuZlJIh+Uni3fxjhO02Bj26piXg9v1btK3SKcIEuBpuSKsvEaUamekA9RlfwYqEeihsaEQsuEvvVM7YWKsvOqNI2wyn8pOs0HG1OYdRD3rDmLTMC5PU3Wur0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(966005)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zPDZWaG0OMjpoS8BlhUa2/0VoB7FRvcJRLQ4FH9k4QSLlP/ZM/vwtjLa61tQ?=
 =?us-ascii?Q?Fwe7JqGSPgrVsh5W6nMWz4eISz/46OspC39nHjwDj2Rq0sDztjA7tVo8o9BG?=
 =?us-ascii?Q?pUx68QlVPlXEClDbKhyOQw889k0lzgOc34ptbjjfqrsBq3FoBDVpLJGtiFmA?=
 =?us-ascii?Q?axpfjEOhg8Cow9Xubk2ZbVDcnRUqXfrxDJ+rj+0up5TK3KIhZ3XRvxQyHX/8?=
 =?us-ascii?Q?fGzVXmb098D2f2HNrUJq/OnxiImmedwqWBAmX1OZydv0Gcm0cy0gzZadv5OF?=
 =?us-ascii?Q?J521x+7sVqR/6MoitOEEnp3TOoN3Bg8yx9cfypNEDbwLM2NK2XYR74rTyrOO?=
 =?us-ascii?Q?zQEUIv9vUKV/lyDzLt2wuu2js8SfkyAB6m3qTGtvy44QabFw+9hnPwTP/W1G?=
 =?us-ascii?Q?zW6sKUiOT1GE8qhsjfjll8Wa6wqd19ewrs3PdDaSAEcoGGxmY6oaCXGI42HS?=
 =?us-ascii?Q?2lxDBMDlwvPjJgGjdFKE5mdobBb1tVH0nJVFIWlOGu7xPYFPpEe5/V1xZ9kf?=
 =?us-ascii?Q?fdOptni6Co+XWhDN+SeyNqaDDVrXOfKUl95/11mL9ukqk+qW3sffOqOteV3t?=
 =?us-ascii?Q?u1DgC+MYvsyYFQZIF3LA/1t0w0B4FKkPLA0dFQB7HAhWhXLpuK1vay23V6AP?=
 =?us-ascii?Q?FL5CQCDzB64x9gmRYd11vG4fqsciSSGzqnNBDyknOtllqBXF2CyOVCHKGKMF?=
 =?us-ascii?Q?ZFu/MRe8NFcMElKcCQP3cqH4tEbSGalqgU1zIyL/UhF0vBsdmcRigQ+d3Elo?=
 =?us-ascii?Q?jhKdlccCf4EIEBW5n1GXEB86/ZcdD8TnvEBmnp65x8YVu6q93lt6RJhby5N2?=
 =?us-ascii?Q?IrtdIwK9W0tUtFdet6H4y4GbVNTcdMdUbCUQgtSmfIjp+AGvgynDiMYpr/I/?=
 =?us-ascii?Q?xQOJ8KUC3kZj1/cv2GJ383WIQhlUZDJ7pbWjyDFu6nhFGQGadHmxRHvC1B7V?=
 =?us-ascii?Q?CrxNUibDGaSgjHFqAsgZLUzV6fph8sPAL278Kbvm0AVh5H5wX7+vGsN/KNmm?=
 =?us-ascii?Q?jZ1gwpF2xJi/mSQpabD+AF6UrWqlWBIqo0Gja68DF7BaZA6tNUY5YEbCZZUp?=
 =?us-ascii?Q?XNnpJM89+koIMH9jkWajNe9rQ3VuFL8oDuJ+rVcjpBQAXydiFqcCl0XIAdZQ?=
 =?us-ascii?Q?r5NeodPntOuq+yImPTULZVfhXmG9lIrmRNDBwuIEsefmtwMNIeKjx+sXzT+E?=
 =?us-ascii?Q?GhEJmQO6YiyXIAR/PXjCQOAy0Y8kkenAysPIYG8WpRkCRYoWI5DJtZ3AUce/?=
 =?us-ascii?Q?OMJDa7CIFdkV0mo1GF92yBJZBtKfrtC7uXhFw0C4APMffBxoaK0tD+TCe68u?=
 =?us-ascii?Q?BfiFt9/dJ6Wfk4IP62PZmFJQWyia8cNuIdMGeI5COHzJj7c0nxyVYYvBGhDM?=
 =?us-ascii?Q?MLb8UIrfMTtvG7bV2+PdS2L3xENWXy2QIVTXTaekAOKs3mcw4NwCE2eEdDj3?=
 =?us-ascii?Q?shKPgu7VbJYYR4Q31Y40mBN+rQVH98xArRzUFezYIAgbHOJaAQPHwYfEqB3O?=
 =?us-ascii?Q?tzjzuDis18L9AIjvOxIo5VkWfAxgv0EyQ4ZiQpUQ/9KIFIZu+VIcLM098JYy?=
 =?us-ascii?Q?b0f6Bnh2qS0ZA73cVjOakddSUgW9QEEsBcMm5yiwfb/8LaS8uCfkqIvErNaJ?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b96570-bc19-469e-ac54-08dbf82c188f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:27.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUKnEGoxLoYPL7ofHQjrR5bzPjPsiGeohzuijfpaxcu5dBSBjjB5H/RW4ck3SXWEHBuTzsN24lK9uOD7BQ+T7g==
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

"Get cleanup job" makes it sound like helper is returning a job which will
execute some cleanup, or something, while the kerneldoc itself accurately
says "fetch the next _finished_ job". So lets rename the helper to be self
documenting.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-2-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 7abbbe2694b3d4fd366dc91934f42c047a6d282d)
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 98b2ad54fc70..fb64b35451f5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -448,7 +448,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
-	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
@@ -500,9 +500,9 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
+	 * drm_sched_get_finished_job cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
+	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
 	 * now until the scheduler thread is unparked.
 	 */
 	if (bad && bad->sched == sched)
@@ -960,7 +960,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
+ * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
  *
@@ -968,7 +968,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1059,14 +1059,14 @@ static void drm_sched_free_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
-	struct drm_sched_job *cleanup_job;
+	struct drm_sched_job *job;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	cleanup_job = drm_sched_get_cleanup_job(sched);
-	if (cleanup_job) {
-		sched->ops->free_job(cleanup_job);
+	job = drm_sched_get_finished_job(sched);
+	if (job) {
+		sched->ops->free_job(job);
 
 		drm_sched_free_job_queue_if_done(sched);
 		drm_sched_run_job_queue_if_ready(sched);
-- 
2.43.0

