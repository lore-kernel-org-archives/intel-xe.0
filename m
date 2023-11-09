Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264FDC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05A810E8C4;
	Thu,  9 Nov 2023 14:54:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5717710E8C4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541662; x=1731077662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fAoq9htjUX0aRzuMr2TjffvnA5m0c4T8tv5/vHymFzU=;
 b=Acmrwc8ssTUN5CeI94MylaxmJmoQjF5ATWiIlFbZPDWS+HJgfRBwEcnU
 6xjejOXUrZkcRosTUvAH2CCEguREh3rMKuyIzOvqg2U4pDd9O5rfaS9D1
 nZyHgm2BiDVOHSioQgggs814/lsSO/GbtQDIdaVOZYgLQjNATKmjuiv5c
 Qd6Pg6aGWSK5qSpa/Y6NbxljSi9b6g6wfN58tBqb67jEE66jfu/eoW3Aj
 h6oaJI6NpCx3dTOZcVMKwl8dqjPUYB6iXBYN9Ivv+oQOxNRO+44R8fTa+
 3P9fnL0BkRcW+2Dm8V8wQm+njwPcb78EuBhin4D5V0nT6vtAA2EgmiSvL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389801356"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="389801356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739866646"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="739866646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:20 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbdVc51zCZQKeGPUHx6cyIDkvidjqTtKhT7kraFucW2Zp/lh5Z+A9jhdUOuA+9Kz1H3o1kEnYuLbkyxeB+oL1DKcz6D5MsylBJ9XbcRrWSu7sB2YtNBlxvFvSkrRGTchw0E5HLHHFMsX366vYV/OTLU7Rbi6RC7wpklClmliU0MoI2BVE7H4bnByHZkjOr7l/mPFuZ8KbLmW8jdgX5ihxBVxd1j94J+uWfLOoALplQc6Q4SDUY7vuVl93CUDHujTH0RnUnOPPsFaKjufOf/fSooqI/Jhn5f6vI/SK9GutR+kx2lMXtqMHVqDm8p41bNqO/hWDudoNgAL4ufAv5f2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StabjsDIQd/DlkswPJZOGUI6QbsMupxS1LEV55Jh8a0=;
 b=XxsAhKDxWR6nTqBJx0MZYtnHiKYmgM4LnDSocSuS6IjK7rEb+RX4RfSNaZfcnfAqySI1HfcGMiibuJfMEZthzGgH9WdNooMlcj6DkPP6qvdP11AnJ8UjAI7B4zEV18NrUc2a/sDDg0NGw5d7BZltZ5dcHU9pesbM8GHszr0DE/to+HXOjvtoPciMk8rlqFufwV/PfxGgkB2nkrraps2zShhJpUwWKF6ypEx6P/BUbeLZ+ebeC0oOXr0jhvtSvF1qt7stl7lIZwB2VEIlBIt4+Cyyjj/f9yQOvbbNgzlLdCGX5Sk/joraYqfbXq/j6osgmeeu61KbatIOetqWJ3m49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:24 -0500
Message-ID: <20231109145347.345120-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: e144fd5a-343b-47e9-fff0-08dbe133bfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: phXotBWLpoJPdssuBBTgpzf6DZFYrqaSF/HRZeC8bNF8m14KvRlafdif4c7yFs4QExKCORv2hD4BCOwWbkredpztVwvFwBtVg0TG2X0lQn9yN+4auyy/g0uqDy0Z1RjywG/S7otuTTKLlyj26JBnQPoQOl5ZnYmBCRZoGxZxbL52RNzSAi8pNwdyi2eVdLpCjHRPBt2WyGDd9YvdvYbNOqFddfY/BrENRTg7XdxnnD1cMj7WcOOL+7C7WtHD+me8PPDm6eGAL/24AfCrHCPZVC3slHACwedfX0JUWZVkUZUf+Hu+y8fjmGy4iDwoaz1nUb4taEO3qz/vFEWXIWy0lVH2iRgf8L5Tk/qQEYtc7OpW11XZL39fzruP3DGhvTIW39LEc6ufoWwTDBn4XtwojtyumzU2Z1JMQEiHY0pAEgVay8R4iCDZa3z91AQ8Sk8ORFZlWHm0xbiWfsnXIHjVcd3b0D44gKdgDVuJ8ppXBydVVhWqtV8mulGkpLNpH2DOuuFOrlWhwB0lZvaxM1rW+yLpnhp+6hl20xEl/XuMXUpJK9jZyAeyGp0GzqQJfBxT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(4744005)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sZtSaUQcutIqN0TcYsa/gzRd54/WkfA3RDNknmumvQY3FD9zdSJ7BhIbP4Cs?=
 =?us-ascii?Q?yB9FeYyXea7vd5LhuQVWV++0lcrs70AMlN3aMauBmIx6obNmq6NJwK8/55Jx?=
 =?us-ascii?Q?yUmoMOnNhu2PsDijRBqssKpqXsQi6aIeOcaZnZ7JFeR/2ZoV7ZwcbwpsMl/2?=
 =?us-ascii?Q?QjqH9il05OVdy93HZX5sJ2MZ9h48sQSyO+q/q1ex7yQZM/3gM44AgT6Ttpdj?=
 =?us-ascii?Q?dMmnBXGFBAiRHOz3dbjmYHKIQ/FTvuig1/PaaLOWZDUd/BTz4rbt0OwwMK9g?=
 =?us-ascii?Q?lvUw1IXrMA8aRm8y14c/504lxt7HvirfN1LcW6yh4xrQ35NXgACmomPySmA6?=
 =?us-ascii?Q?rWT4fHdPTkC0qly6fd26h0xCMxaZbXVTV2CQRubVolt8wMvHDueV/mSngd3U?=
 =?us-ascii?Q?BWaMNAXLERyu4L4xRQb53TXPZ24OSSFlOU8+/tH3PanIsLJYiGj3KIc8H8ZI?=
 =?us-ascii?Q?KTja5zuEOcDlbLkuVV57MQ3est5dBkH9cOFLUavdNoLJ4LJPXXaiMZ0MGN8M?=
 =?us-ascii?Q?d8rVwogdWJ3wiyxQ4+lDnzH8h3UqO9oqMjBU5InnVcO4LijMfE2FqbxMJ+IS?=
 =?us-ascii?Q?nVqmvveX+yrEPaBs1DktUIAgBk7GZlcjpX+tbJ12uGmrTPMoUWT6ZR7CPPGv?=
 =?us-ascii?Q?ENJ871jFKSmEc8eQxuqFnc1N38naXGXoN0Gi6PQNOXAWBO4rKO33kF4U9D2r?=
 =?us-ascii?Q?d0U8gRuPD4W4UIHtqmwt1ghaBFS/ljqwJenHvkyFQKxKpsv4yQM5refC0eCm?=
 =?us-ascii?Q?kvDtJw7S/JpNmmY+cRYTbKlTqZymeKlZjT5JmKhOAWs+IXp0wdBKoKq/z+lx?=
 =?us-ascii?Q?EuBSqt38sMws/Dh8u5ERUw8pryCfpCTapW79qPwyPBcXlzAxXRnSGaq8GTgW?=
 =?us-ascii?Q?42+ybtfpNievHvjBieBa6OkbS3Tr6BSDcyG37DNdrmjAA6kPU71vUm7FKYPP?=
 =?us-ascii?Q?/D7AqDFCOWeVEzvKs7VqfNLlWdwtHY34i2otozADRqTS7J+s4voDftdoWkA1?=
 =?us-ascii?Q?/osAtddeZfXS3GWYdNjYb5NK/50w6imyaSseUecZYBLFKi/tR7lmEluAf7Fq?=
 =?us-ascii?Q?2b0+DggVI641YwO4iBGKosVT3fXl6UZtDVnfielMWMoCGqVGPbWYzYc3PNLM?=
 =?us-ascii?Q?jPX/M60m8TOMtjkTnG46lEWwREA5AKS8eKZxIq8s3wjNJRIBXqabEA7M+0hw?=
 =?us-ascii?Q?RSd/dCRzJV3H1YPDlk1dbD0H2XXruv4+NJX+b24Zv8YScFLaPo6on00Qy9am?=
 =?us-ascii?Q?WgbMj1c16dJEc3vI5B1ZDdigFZaEr3aS9GBlNQXuJld81WmlxoBLVWnmWu4l?=
 =?us-ascii?Q?7OqtedtF7CikIFMPP2AZfIrsBaKW8pnzIcu6Odf4u+VbGoFFN8uckpeXfJSp?=
 =?us-ascii?Q?YY7Skmca4UH88QJ9PPCcldhPIFtlUtY0DOvrgnfTbMyaXU9HfinJ1hZ7yf4f?=
 =?us-ascii?Q?5fHkW//dYOF3go0nPl0Z6z7FcUIOprVrNt5OlIJvIi7wd9f0f784oKTLIpkX?=
 =?us-ascii?Q?gJIEiI4zUky34igOvJVuds6Qc7wCkVEletJWgKjYISLCVbAKKsMLNHn4Xu84?=
 =?us-ascii?Q?UFzGflnqReG8p2pbZjRBxVKo9NykrM0sFJ6EwVcP1pmoHkgSINRK8qPFB5SD?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e144fd5a-343b-47e9-fff0-08dbe133bfeb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:18.4568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rahZw+2V7W+fqXdFJK1rwtyPwhY8vY5FzWLcJSvmuP9NsSfE+O6ykbTgMLgZTLM1ds1f7hkUWLqna+BnXQuP6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 06/20] Revert "drm/sched: Start run wq before TDR
 in drm_sched_start"
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

This reverts commit 5cc2f8e4eeb94814a95d46fa3ca9d2f7a0dc89b5.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 334acea98619..ca2d7a35eec5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -592,13 +592,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
-	drm_sched_run_wq_start(sched);
-
 	if (full_recovery) {
 		spin_lock(&sched->job_list_lock);
 		drm_sched_start_timeout(sched);
 		spin_unlock(&sched->job_list_lock);
 	}
+
+	drm_sched_run_wq_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
-- 
2.41.0

