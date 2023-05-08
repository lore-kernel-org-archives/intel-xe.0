Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB89EC7EE25
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947810E046;
	Mon,  8 May 2023 21:09:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701BE10E038
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580138; x=1715116138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iTRDZ2sTE6mq5Hs18TB+0R5X9Ax5ZCSzDTqGQr+PBLo=;
 b=D/p3CiJNGaIenc1ySDFhdYSfoIO0ia6H0Qqk3as2ww6hd4NWojw1HmKX
 XlqcvOkUgwS4hk7Rv74K43eJ95neutdmC6VMcUW9tS+bHcgFoSn6qgiqb
 t1oFMJ2omgn02Crh8oce4lEVAc6RRILqKgR1kSEZhDov3ezYWrTDDhQBi
 yBFGcl6XplFICDGzdArLmdLBcFc8UWm2Qptb7okgU0rEJAm/kzZC0j4yb
 GqgJLuww9E7XFu4iPbFcKaHZLY2W03pPB72/BG60Vilk+v5YK1qKWpfAB
 BY/LvdEWaYKcyaAVZberlz1hPNvP+XwIb6sHDtl95vz9WgHTM4gdnoukR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436075643"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="436075643"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945005560"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="945005560"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 14:08:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZccGRE9FJ3sR4k5b6xQyIwZBDQ76zBdQVGtBOgdVLaQE2PrWU2mFbqRjvF6Vxnusmo4DaT9Au13JeT3L/mSKkugjwqTOmw93Dbw6lWMif/ynStCFlkC6O09tgTg6RKQNdEBlYP7rOdqktb0FfKQB3Hx4mGPe6QHSoLM0ZntUATfabruCAlhpui/SKvD91BJBQol4Ls3AjZpZ2QGTC+nca8F9dclEZv9kWZ2q/i7IkXDZ7TkPthRhPHj0vlVyw4nqaergABSvYB/gKtlthtMrbdHpBmYOQoGSBLsh3n2g9J4jJcJKCOnZtDWFEGwZTu1VScEl1BWj5QY48QinUb4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9ot3BXurmBOG2PEkGMuq1Xgs7yYeBXn7QEEGRpn1zw=;
 b=WEDlLJ1J2lXaFa8aBmaEjRkeFMrSRyEKr/ljA+n597sJ5fyAXuZDCrS46RdKK7cIDHPw7aDFDfxbKw5AiUn1BBZMEE53iqVplHvkaOlWR5UTD3T9ueCZertIh2PUvuGL69jGibANmu0UR96UuMZeQvin46EsyJGPAoF7X1wIWVt54QgZs9mwEHTymASgR67+w7zfAhXJMWrYMTj/ChqYPCumdHC1I8++IlrU1R8JhBSQ95tysGt5vKPgr4GbssSaPu/qHUdBAQRVpcaymgQS8CpcQ2SyM0rCO3YzwOebyC6nqWKwjrsu9U2x/4LgsdguUH37HNY0mTN/LlAywZOmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:19 -0400
Message-ID: <20230508210825.1405432-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d4ef9d-18ad-4229-c3da-08db500869d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgIXwjxdtV0eS4aTdLiher3BZRXsqo+MUVorOICrTV9ZgkoZ8o7X9EwZtPMt9QlsK1ZpL7GbyTKu7PGeYSLkBe+DgpcHP7i31xeMS3dJPNS/eXqJ6qI/tBWIOX1jdUBmVRxdol4jOSsxToytJzzYTtr864M+5WU6ceTiQrk3OlQTn4E8UHCJPMR0fhDe/Kkf8Sh6S4wqPg6rPA1COAcQDcDCXkwlvFZcTBpjTxnrdNUvCSydwqYk7Te1J5fK4aSn0PefBwMPn1vq3Qx3Z4B1OAdJO58JpMGfIb443xzHrM0LLo3ejld6E3m9G9ownKWMjbIgnpfNWza0e19ot7X+7OX4qXKklgWm2YU6Szo9oda9k4tHiQppC2dAnl7lT6nn5ZqG35lz24gsCoddJ17GkZ6Pji35EJpF2Tn7mlXyFgalSbrzahwqyzJ6/vYwDboCKDi+oSZJ0ipVqBRs4/ZOIRbgu1j9CfDaBetcd85xuaoeoVABSVS+CMSBDDbFcJYkbBPcX1UtmXh2LXaSI0HnHTxrqWxBIRwMjrbskkLSHB+KhyG4y/2XWi84lZnOVaXX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?80xsq+ZQGzyz5OnyyfnKJF5qPK5zfrR7Qyg3WnBfoKteCswDzOcIv50FJp6c?=
 =?us-ascii?Q?lLwBqFlw6xvxowD/v6gDejIUZ9rE/5zLMkskVqPlPytFN4A13hVQgmYASkMe?=
 =?us-ascii?Q?6/V05hzqH6dD/4gEk2mAKQr6XXuzyKZLwcg67L+wp4bU9ZLzCV/ieogtkMmj?=
 =?us-ascii?Q?F414pOMvMdtsE41yrUIOUbCbz+a2htAyLS7g3mwMc77fZQzEY77wH3Xh/jM8?=
 =?us-ascii?Q?N797xKCeJ4Uwf7hRmaJlbxyjvyHj3+G9HTbVMChRlkR7ogFITV+VfV7xsoFU?=
 =?us-ascii?Q?yibmiEcA2Yb6VhEeH2XhkG+Y9F6Ld7EXZiLDdxl6TkJHkGuuzyiJG0zKAzQh?=
 =?us-ascii?Q?U8e4KOOiOGSF5Iu/sEXyNYzbhEg3fEuMGLoFHKEZ4OdroyTWN/7iobriM201?=
 =?us-ascii?Q?aWaZJ22mPnBCK7hGvozyze+n9qPF7a5pgagA9HT81kMcJEPSDsTfpcfKrGdc?=
 =?us-ascii?Q?1QVeHjab4F+1kSAvPmL79wVqFYT9JFbuoSRv+c78hmWch92unXOA+u9T0EaF?=
 =?us-ascii?Q?WVTP/zU3Ex+P8sFeN2Vh3OCbBZSGBu5Zwqbl+74nguVUmTP+kTYdVinFeBWV?=
 =?us-ascii?Q?qxSwg9moVU93xhKQJLuHJ49MTnVccJ7PVRkVBc9/HIZIjICRI2htmkHP3IIe?=
 =?us-ascii?Q?26FB/vUTOqYocQ4XmnHOgm0CM7lgnOWh6uKeFNOCe/9AkVN0eWslnsk0V9RU?=
 =?us-ascii?Q?wKzcnKu/wF+sbrA1eMhOQTpax17jEF9N7WFGZMiemGXgabnYisddBPn/lUyc?=
 =?us-ascii?Q?ImmVzdL4UYj+YC001BMMWcKDobE7o4oFZtz7VJOYw+jxoe5SI5U5fnW2KNhw?=
 =?us-ascii?Q?QxVTrdb7XipzRvww/Je7f0vCDuIf9ryLZWr/s8Q81iNxyGLd2INmfRgMH51V?=
 =?us-ascii?Q?Ksiv7Jnzs9mxPHI998+vmlPRwtkLL3exHLgaXGPICdkDW9tHNo4wEaPsWmnk?=
 =?us-ascii?Q?yEmqVWZK5LHEUAu4aJG/pvaTsCQfsZTVG7Xj7uGe0y7mUHoCI4Hg28XJPoi8?=
 =?us-ascii?Q?MSQjAoR6JXMJM4qrZWo1lAZliE+E/FQTir44wOtcnDgrPCBv4Mgu1ECU7PwW?=
 =?us-ascii?Q?n92/SNCxbyAJ+/OWaIoMWHKbquChuW018Moc/rpjCP9fEBRcqU27DNphOAdK?=
 =?us-ascii?Q?zCVPiMrTcUWUKMVZrrq6qr+KFtrjznV0N6Wg3/R6uyIQdMMHbuIsT7cXGWG0?=
 =?us-ascii?Q?feTU+HM+OmYrqzj5mMYKt9WKPdeMmpcLyxDkXpIsDlUXVJY9UskuC9TwQTI4?=
 =?us-ascii?Q?AZuRl7Gsr7toCOTIKAGxx+7qMNnST6bhvSWGZ5Y2eY/X9CApdP4YSSHe5Me9?=
 =?us-ascii?Q?7DkxA0h4nQMm56xMRWAfxfwvtj3M031AM/mnmPceIg5rCLVLHm4fdKQ22e9B?=
 =?us-ascii?Q?QUIIXnaqZ/yrWddx/LicAMIXlWle2on4Iz5Thm/+okpa2JlZG+oruMULZh6w?=
 =?us-ascii?Q?AIOeKLIETSpfS8TTeUl9k3uZ6B3tjRf0aN18eUZ9CQsGKoxPkqdVmV5mpkTm?=
 =?us-ascii?Q?xCjMIYgfakBprw0L36OC4m4AT/FashjdEuMXWsomS3DlGSgzPSO4j29BzYDl?=
 =?us-ascii?Q?zUnULgS0lC/RdyiVcySCIRKcCqmSOUQl6Cq+BKqdILX+Rye6AwyyuUcXEWnx?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d4ef9d-18ad-4229-c3da-08db500869d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:47.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNgUAlqBl3vnXjpclRlipaNGiNQkDuK/Dr9FNj6beJ4HazJtwtlwSILZ67kB8MrC3Y240WkfXFZFIRHxQ8S+aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 05/11] drm/xe: Add GuC CT snapshot to
 xe_devcoredump.
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

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index da1b010452d3..d526d8ec2fd4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -11,6 +11,7 @@
 
 #include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_guc_ct.h"
 
 /**
  * DOC: Xe device coredump
@@ -47,6 +48,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 	return container_of(coredump, struct xe_device, devcoredump);
 }
 
+static struct xe_guc *engine_to_guc(struct xe_engine *e)
+{
+	return &e->gt->uc.guc;
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -81,6 +87,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 
+	drm_printf(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -96,6 +105,8 @@ static void xe_devcoredump_free(void *data)
 
 	mutex_lock(&coredump->lock);
 
+	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
@@ -106,10 +117,13 @@ static void xe_devcoredump_free(void *data)
 static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
+
+	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3f395fa9104e..1e44d5346364 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -23,6 +23,10 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+
+	/* GuC snapshots */
+	/** @ct_snapshot: GuC CT snapshot */
+	struct xe_guc_ct_snapshot *ct;
 };
 
 /**
-- 
2.39.2

