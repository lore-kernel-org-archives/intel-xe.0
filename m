Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A4EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2E410E6F4;
	Fri, 21 Jul 2023 20:22:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE18110E6F4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689970917; x=1721506917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HuZ6MtGZaEJk9IMxZTGTol1y2XRq+6k82te7rLeAYME=;
 b=Qky8fzwCxDLQdEeDkolE9e8CEd0T2ZTr+IK7t+TWM0KaMJutEuFNIYth
 m/31aFWOBys4UXtIC1za7mDal1fINj/M28Qzt2vyr9YevffPhVZxmsWUo
 sJRm/iUbNTdQ7tNM9QN09M31lvOPnFbOHFvR0/2utGKF/OzJuMb0PlhlJ
 cLU4uOp5GpMZjaJO+GEdnsacOGasGZZ42lQJh89A2llGUK9BfNvvYByhm
 G8FP8ePpgdhWfDMYrVOKG+BV2V9N3ILzHfJEtpEsgammHYwR8dlWXuYYa
 OnFDoRvsxkIu3Sxa24d6WWsz29F9WdfKLmtwIR8avqoly+2+gxClnhBbz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453489583"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="453489583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055684504"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="1055684504"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 13:21:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:21:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG7y1XiwqkvDEjC0YdLX4upzHWmLhLM+wrKL/k9fBAcsAIVdByBlvY/hwpYPJIJg/xM38ruIrzUrdkPznijLZ0DjzxzyQbjOP1Sz8MNiece2aw8uGKpI98TPo8zan2nkamBfAZamsmTtmSHPbq9XsVmGD8J1aW5XDWA9Obun6u+LR1ZyyISv8g/Sux8n42ed22pzuSexAAd6MaZaClF4qY0wKsBqz5BfY6BD7dgcaolWA+lZAvoR73Ev3cCzys1R7vVybjA7MZ5+nvcPiFA8L619mCARcohDBWWQwS5OgY0kO+T2xgdVt6lvJ4RLx5vD+ruHfw9Fd9SvSuG2uZ9IxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrPeMp/LKceDPFUT0gKRMj8GxmTdsmDnIH6PGakOvbk=;
 b=cuizmMdGTLlruIyzodIwr6q5IKv9qpryk9Gs/YbOr0Aj7Y9DFWuA8RFY2ZpZ5Hb3UOHl6X1mKADO0cC1+qpLJ/7yoj5SczLZzbQW8dXqsrdcPGLnhsYvQfNcA+EEnZQBGWgl8EHp1/Ve0g2StT/3eurVUCAEvzP9UMiafUJp0/cjjoCNzmaNkYeNnT5gyfNhMFGpP8iqzQJUObWRxaBDI8cowUxQQ04DwLg8UrdoGPRgFx1H/jceOYxhIFkYATdrz/xe3HjhIbNcvFjwQp97R54VgU/MyhJGSd7M4/Xl6PSkj/MeJ0RY5O1dvhKwkllEMsyL7pYlMSq/UP71PkFgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 20:21:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 20:21:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 16:19:12 -0400
Message-ID: <20230721202144.269837-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721202144.269837-1-rodrigo.vivi@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d68c19-468e-44d3-777f-08db8a28200f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JpeXfVWUZsJZkZB3gWYotCrFUjvugdy1wOxuOyt1Jttnhk5hl6ahcZeCkcPqynZAyDVXc9IjeWvBjaZRISRJ6rLqugGUXHR6eMJ/+BFfvV3TdD8weZkYofbQNY2VLqBxFTzF7VTxSjpHxX6WaUwc+YpD/XU/r//CxWIhz+lXxRien8+Fu/7RmhkI0q9gF6BLXd/RsZTtm6SbQWKndqU10zwKPHsG5WGtZE0BkAdJ/aTbXzK9YdQgJjsrmCvZnijPVDpyTsjlaPvpaMia2DrVj/KX0XJm8aisuxVSlbUbkyWlGFLZuUjoqYaNyyRjhSaU1cXBTzN1bcTN6JbsblE8qH3hrZQTAW91dMv23k2+Weet6VBHvFye2Rw+ug6jBUNkd+G897zcuWWiAMd6nq7TCG3AqyWUZaJ0tmbzUSnB09ufIbQvCgXKfbRoywVeQXdnngmJpGDf1k/LsWrwCrcNb3QEFjlBLccNuXonA5DfcP67ND2z2nxlC4CfuHDRjuCpSnASuTcm7Alu/0asyBbGLy2fTVR9Om6W2ImBrcUqCUgZeflfnIW2sq3GJd4eKxg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(107886003)(6506007)(1076003)(8936002)(186003)(8676002)(26005)(44832011)(41300700001)(83380400001)(2616005)(36756003)(82960400001)(86362001)(5660300002)(38100700002)(478600001)(66556008)(66476007)(66946007)(6666004)(316002)(6512007)(6486002)(4326008)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nq+2j8Ct+Hg3eDeKrnFRITpYTm2zq43r6xe2mGIiijpIf68yv5CVQVE9Uvve?=
 =?us-ascii?Q?PJSqnOFVbi0r/OsAneE251tsAuCoQaD1szrCW1VHhCOeKA7JvVKYVbWJZnUF?=
 =?us-ascii?Q?g+bd3sOweeEKAZ/PnkNxArbXl3I3uaeKpquFCFOIxPspbwYoukoaRa+F7uKw?=
 =?us-ascii?Q?GN/qwzTLg2Xk3wTO8qWLjZWPfYUPnhJ9P8hwr/Z3r5jV59wmEo450GN3sfah?=
 =?us-ascii?Q?Pz1mJoOlrA1RtkhyiNT+bha1K5seazd8k9Yk4zHwuUwIPj+7PndpOQyLNNK0?=
 =?us-ascii?Q?H5j4nFdQPyrAo4Ug/Xq6tYAtr7+JZ55QFyzpXC/5P57tJzz5TT/La2uClTap?=
 =?us-ascii?Q?Rc/SUo8LDRxe89pAX++55l2KOv6IfKQ5tlHQ6kg0NDzH2IAbL93N9FywBHK2?=
 =?us-ascii?Q?IOeuwWmC05/+iaJ+j2D9DRIfm/5cgbUAWQnMZMF68AV+vBNTzS9ref/sAu8/?=
 =?us-ascii?Q?LjfolImry5Su9vsCgQXi5oo/bMt6NEXrHbgIQfP2XGYPAIpRuiEBe9rPr0Gr?=
 =?us-ascii?Q?nRf/qGrBAn7sQq32E61WzGk93hPhaYYFyHgZ4IZ/sLGIX8tVPQOvaiJqHhSL?=
 =?us-ascii?Q?HCOV9bK3da/vFQWHKTqe1FY384Jmk6Jvu8W6xnsw0fc+PGthNqtvUlC6+OJZ?=
 =?us-ascii?Q?ZTUG+Q3RGyLKkO0jww9S8h9r5F43q7I1lNdFpfUef2Ghh4PmVT3uaztUWLRS?=
 =?us-ascii?Q?xzZbcb81kpr8MouBmAtpsSEmQZe7d62qouQZ1r2jk4PJ6VxLza9KzTSAsLac?=
 =?us-ascii?Q?e5GwR4QezNbo0Leupo6tVPSo3idCxwthQ48O2V/UXKl8NMe/Bpe4zOub3WZc?=
 =?us-ascii?Q?kqoQyrJEmR4lDeaqmoz7dJaGHF+PppEinZbH1a9VZ+b44PiF3+R7i1akmz8E?=
 =?us-ascii?Q?iRFVJjY3PwOvr3AIIFYQNdjEhPsf4lM5RoGPRfZRLvHG/etUvrHlMRaEuIvN?=
 =?us-ascii?Q?ksqsxEbIaxxfB7XM/MY5PzAaeHW+kdFN5y5iPez8OPNIqnPYL4trToHEOqYF?=
 =?us-ascii?Q?9l6ommMz+A0bYg3WHHRh1trY4gOcr9u1T/npV6lFb4cPF6k4oyjk29+0QnXo?=
 =?us-ascii?Q?4HlA59t2mVSzm4iKK9U+PwTUgejbU9t9BUZoAMf7RC9w9PQHOMlHSszWMrPk?=
 =?us-ascii?Q?yUou3Yhg0wkEUfAUSLlCiSjEeMUUGCf4pR7PEg/lJCDaRRWp0d5Be/RW7MGQ?=
 =?us-ascii?Q?D7nADzo4V0jPbhUZAcabDARYu64tjDaTpXt+wlXfmpoFOtXEnF9/GAKaTYR4?=
 =?us-ascii?Q?O1sstX44s4tPqYPZgj1mZ6JYdEergyQTX/se79UvWHgJtDBWTm4uvgMxGhB3?=
 =?us-ascii?Q?0ojx695+VClxrjpKnwbHMDCNCtpBwgbLR4E84gWWT8tkHLmFYZIjb2GWk6oX?=
 =?us-ascii?Q?2whwm/mso5KO3c9/IDmIOkY99msxMWU89KP6cWM/TEd62PIixssvgqsOGAqG?=
 =?us-ascii?Q?+ff7QcnyJQ9bwmPvNOJouvPcYmu/rbS2jHbdtNVBWWaLLrJRi1uT6+0fwt+A?=
 =?us-ascii?Q?2maWY6wSyJUbuKAKRGbg6kKlT4GA7vRZSE/m+NJGtkQ40d2zwCZZN58JqxkH?=
 =?us-ascii?Q?G4dZZEw7OTAiv06GMRSbNMoZPBHJkEaoz3WiGfx+KRm6hFBaxpW1u6M+j1iR?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d68c19-468e-44d3-777f-08db8a28200f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:21:54.6255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcMBiKSbQZfAYarCtNnfQYf3ERHL3uFJCnVdJVdGAGinjhDcE1eMSS5rKIE5DUNgKQaPRPXINEfa2/5YVZS6Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/3] drm/xe/uapi: Remove
 XE_QUERY_CONFIG_FLAGS_USE_GUC
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

This config is the only real one. If execlist remains in the
code it will forever be experimental and we shouldn't maintain
an uapi like that for that experimental piece of code that
should never be used by real users.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 ---
 include/uapi/drm/xe_drm.h     | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index f880c9af1651..56440a27ddba 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -191,9 +191,6 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[XE_QUERY_CONFIG_FLAGS] =
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
-	if (xe->info.enable_guc)
-		config->info[XE_QUERY_CONFIG_FLAGS] |=
-			XE_QUERY_CONFIG_FLAGS_USE_GUC;
 	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = 12 +
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 347351a8f618..790bf27407a5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -217,7 +217,6 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
-	#define XE_QUERY_CONFIG_FLAGS_USE_GUC		(0x1 << 1)
 #define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
-- 
2.41.0

