Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F12C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769E010E8C5;
	Thu,  9 Nov 2023 14:58:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3467F88CBF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541931; x=1731077931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kCQ7GsLIb4wLPriTbdiDZpKR7D0X7s9khc5ySqqbLuM=;
 b=FIYTPLUpEVQ6LuvUE+SNFLdPK3pPQiCcTVFOqi/DdC6hn3J9HOrt4QCr
 HumAeJT23auY17sIsrbcdkOFE0Klp1uRtQgWf34iK1ywwzwtrPgkxHz1v
 42T9g9vE/u7rndM59fySUEhLoufDLugQAQkj0Dr+AFKTK6DmZ+0jVHdVj
 XIwQjT5hj5cGHmZ0PvwzdBrWAJ4hYnNO5xdVFboIpnEvXHB0avS7A9KCE
 +IfqsV9ub47DzPHhPAg3Tv3NI4LuPzJuDZRnAbpQqmQSSuYmS8LsaAHnJ
 4QOTpazlFbaUkejBmVmRRisHQ6jm5kEWvOU0ki4A5d7y+W8DSNg1U8VKj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300185"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756897299"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="756897299"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzPX3td7EsEMnfO6UYwpKurUiwiixaJpXrUhM8UiLToRPoiSOlhmvmNaw0tPEYTT4H513SpNLeYX7SqbNc0LJUy8RRXjc68+rnMhTjQvTwWtYfEmHERVAb0qhyhznIgv/sN4tBYkDIIyHNVY8LjcULbbCDcLQgcmbSj+IINapCIfxi16of+Zx9zKQa6dcATyTxhd6CN/qJvy9ecRd+xlAC4sfJroXTs7yL/j8Amy6CgRcFmBI+M6l/+NLyaucI7jp4nZyZ78ic6HQRQWS5Uez1+posH2zjR4QkCSFpEoAUSk2jwJmpGu1iccJ5WbyYgMol/Sih32XVm/kMOpHgBuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kq6rWfd7OONb4M0fjbzSGS+iBO85RAPv3xFX8lhzfso=;
 b=MJzD5rimesaMsk/D5Oj6Tg2tAlKJzf8B3CdlqG+QswMBSkzS1tnAFXylQzKdbPO9x/TiEoG5rDIv1UL1fCq01be8Z2fKaZEJ5tiRRx43284AyN0hS5wsG+DFbFDYnHAsazd7DOybaLII+zfmkpXKM0MS03J7g34ECxlSxojQtKymY5yy1G++CpJn7gzMY1tiRy3N161MhVCZFS02G0FkDlQT4uVkXWx5rP5VDqHvAWmiBUXCQNkHcnL4/M/WQP4xeIy0k6E4SwpOIbNQhknPwQsVFl3WZLhexVLUyv1q4RbUaTxyfTraVJO4caJaU71fT/ABM0Y51odg5XLhjiF7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:22 -0500
Message-ID: <20231109145347.345120-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: b1123e15-5a9c-41c3-6563-08dbe133bbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cU7gbAA5KlZGbqsUdsvU+YuQeneoHFA5dTetcKPHZMAOsOWGr5uf7bXIS730iCVf4l0KvlPmb/GsIWONWeHsB6HaDESJBNX8D7TSJW/pcLGwf8SoY4u7wLb0GxnZhe+9Tku84y/gm/6sUBQzz+dYEd9fiSP9vMZcPCKbhN5E1cMWsYpnuFk0J/KtpkdsVKjXSOT7wC1wgFNAFasncAq3cdJweOEtPQKM355LqhyGyaqHJbMfN7MlR8kGnca7qO+bZ/UOhnMaVHKj3D24hxtwt6D7Hgz07qkMH5e/U3qKcs2sUIzaAArQ33AUoOiOCRZ12RVHEgCYcFpmzVeCMp6K+lRWt1d9aB0lXhRo1c/OS+MeoRWZ+CPDPl0zHZeML8Suk+Z2XgKVLihbHrZhlA4S27bZGn10LJRcqcZhgMg7GQvdBk3zy5RFktvEFK8PY6F/MuXy53xDd/GWUCzL/XyTEB9pDOybLNBoM/sTb9l+mJ1zSxVk8Ptj0KKOQkltXBCnVnMS8xUuKja1TOwZdl3i+lrvWzd0CL8p1oNVEshL7FZcEto2dbvu2dDAGfskWxW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XCvu+9HsmoVubTQk3TIQX7mVQZCFDBPdhv3h+ZsqTjHU0sMiJKPJDzC8RKDG?=
 =?us-ascii?Q?fl/jZHIi3je/yVUlDA5RBh1scaDtmzR3QZCoLCvmDvdt0sADNLoAOAU78+NL?=
 =?us-ascii?Q?O+CC5oqachdvY8J51lJsaRGlU7WOIgWBNcmFbvA1OLOgNJlhl88LmExUlhgT?=
 =?us-ascii?Q?8yxai2R+KGowLTyO00mXHrhvTk+kj7dH7WC5SSy91J/j2TsuNakYEvN2sEvw?=
 =?us-ascii?Q?6Xap8t0oBkNabpLIO4n4O23m83VFf1fEIXnPRXhFkvaFMz4FDnPT+SSb/rKr?=
 =?us-ascii?Q?jDrO/aL1jQf/BG+AXOdRPcoS7i/VYbseKFfool/UdYL9PyKDCbwf9+Bh3qQT?=
 =?us-ascii?Q?yp/vcpwo3w8XZWo0As3xlYj17ozubLZ1a2pVgzjJnNaBwor1YeD9ynpN+inJ?=
 =?us-ascii?Q?rmsNFBHrkKH02GppJ9r28UPH9XcIW9D3yh0Uhm1iaHnGjF9bnwDptEYA76vT?=
 =?us-ascii?Q?zjmB1EitWQz1V7CdNgUyL7vE61YfveHqXvTF2kIrhODj1wWOtXhdgljOPC3/?=
 =?us-ascii?Q?fD11Ch3BZ67/b1tfIwQhODuuQ2tdrp4hg1svHZntZdMiEdOo3AjitgKZDcfR?=
 =?us-ascii?Q?wGuCf7oZYNWkQRaLnP2s4kMlx3MRfXPuMx1NfmsUFw/N5ULq1aFxJMnTzyZ3?=
 =?us-ascii?Q?Torl3eIA8egM/IKhL/hUe35VNdDnwOL7ogIsGABBemTwsxFx8nyTCfZJ2dsZ?=
 =?us-ascii?Q?OCBiPCbzRHjSrMFo4x/7VU7Pa0m7+I0XwMwHxdeKvKInUBCi/XfUqt9JfCX7?=
 =?us-ascii?Q?6DxNTHBfjQlK2tfi0CZxln+j3UPAYL8dUFeO7L9Lz/FYNhiUmY89HRTbSnQ/?=
 =?us-ascii?Q?S2Rrl91AI7B01LfJGWTwZ0hShawDCozZGxb0MyUZgQ95b6UorEUvTfHxNBmW?=
 =?us-ascii?Q?q/ZIHk5pUv+VKweHTRqNm/Ypn3nfRVhl01riT48KfLNgzVsytBNNpwoHF3KF?=
 =?us-ascii?Q?9oRo/87nm6sA7WmuTJIRAOn3L3Xz8a8OJLV+fZdexbY9hBAMFO9xmBYjSbTD?=
 =?us-ascii?Q?wyR/Tkox2MnqgEbuN0MAp5tzEYyEhRJeQPjhd/+VSaQHcVx6x0PKR7tVIzCH?=
 =?us-ascii?Q?GFELz0gT1VlgGrqzGssACydbV23x/ZjX8dkCDhxfZIPzJbPphJRnlkNtgg7o?=
 =?us-ascii?Q?G6R6QIIzDirRUkcoWSoY03osbYbBgPXsNchahF0b1MjoBWXKZkAajrnHVHEM?=
 =?us-ascii?Q?hvkO3Q9s4G3u0RnLuzo20ZgYV+FgCjSulQ37T/xQ30J9i4A0GoWr7iedMXR8?=
 =?us-ascii?Q?4cOz70eNXtgMBAIdArvzX1lcxyUyPribc2fHHv+nmJHWyv0Odiu0xNavdfjx?=
 =?us-ascii?Q?cwBq3a9Uxc94rE9SPmOrHnhHoKZmanQ/pcqJhYIyUnxnhtWVLWVUhkMJn1YK?=
 =?us-ascii?Q?ggsd8BGGkYyhL7g+TcnaLLXR6KyrAnwHgB9ishVAppg6SklLiYMb/4WWXhAY?=
 =?us-ascii?Q?S22jbA9rSI+BYZPEm2fIuj2EEFacF+XU2esVg0o1mNc/xRIvpbYd+5tYGRbQ?=
 =?us-ascii?Q?p5UqjIHHZJuN6xCJXP99JZ2NAOcey4jqcDkCQrl1jCIGWLokD+sYNKTo5SVM?=
 =?us-ascii?Q?DZ447yMCrn81oVvRD5dTe4I3sNLTPVHgA+GgOpRl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1123e15-5a9c-41c3-6563-08dbe133bbc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:11.5493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CldZBcfixIrCIjYV1QymX+GZny2YRtdPM+5qsDwjpzJr0+19R4SB4lrM0swxURRecktjwdg1AS2fDtiRO62QNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 04/20] Revert "drm/sched: Add helper to set TDR
 timeout"
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

This reverts commit fcaa05c341776711572a1473678e5814d5c46bed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 ------------------
 include/drm/gpu_scheduler.h            |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 856366d326e8..3056e0462619 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -350,24 +350,6 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
-/**
- * drm_sched_set_timeout - set timeout for reset worker
- *
- * @sched: scheduler instance to set and (re)-start the worker for
- * @timeout: timeout period
- *
- * Set and (re)-start the timeout for the given scheduler.
- */
-void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
-{
-	spin_lock(&sched->job_list_lock);
-	sched->timeout = timeout;
-	cancel_delayed_work(&sched->work_tdr);
-	drm_sched_start_timeout(sched);
-	spin_unlock(&sched->job_list_lock);
-}
-EXPORT_SYMBOL(drm_sched_set_timeout);
-
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5de4ec663791..bb3470e0b16a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -575,7 +575,6 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
-void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-- 
2.41.0

