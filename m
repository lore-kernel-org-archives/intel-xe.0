Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DB4C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F14F10E69C;
	Wed, 29 Nov 2023 22:36:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBA10E69F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297394; x=1732833394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QycBI7Kt9PgTyJxaiH/+LWXtKXKuLCo9OVwQRLqdWtI=;
 b=aWz4b31gS32aQAyfxTmhwt03cmwIWQF74lb+OnCmDHNJuNotoLFtFtt2
 k7BwJjUrpYJlv+BjmrRwWGFKMMg3WvsGJzc3/7FlqapA1uikPdzjEu/+/
 foRAilIFeRvcRKCGEhyVpW4v6gbmE3p8Ts3rDZQgL6K2iNP343CeaRArE
 x3ynSPrwePYAtI+adfHGhmQEg0Kmaj1SYbisKHczOfpa/sEDSMF4eHXYq
 IeNRLifWXXlNIGiiRK67O7DotxaCQDwU8BvO+2stZL08CMj7qlT46FAaE
 lgyTEMXuWjcaTxxvMYkjfOeGxAfR2jIGHDdQRX438eYUNT9/bJ5wFfDuw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219793"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418319"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418319"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRK9MiHMBtSBXyux4uxDFBeOpk6ZvtzTmpUD8cl7a7+bJ/2C1RX2Wdy6tYVm84BwET5AiN3yEVj5k0XZQVk5RJLfkohaT7i/LNlth8WRUtAv7toKCuHDAL1bT8HrXHNwM3YO3C3X0mJxlF9nqhN0e8u86+9RDva27X4j5wJkBaTzdP1DnHaxEL870lmRnbcvlUJo94w/m1KTvnnlM+j29dovRy4KUBkC/LFjBg1r2fQAyjqY5vtlTirzu+apgNrwU30PlP38KByNKJ+oRhUOufgZXnpN4vBXE5/lDT1M+qVpfxPtgua2vRHeR3VPRng5Sx2lJDyE8cmnwJJs1czNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmFrd6XZVfmcX6t5o754wGjAQjnYdG1Cx10L3HP9BJc=;
 b=OvMOS3csTqMxFi7xLi22m7OmwbqEbuKA7jghj+c/5KN2y3A/hjMEpxyQAXEJtNJlFgW5QjWuycKmRArCaq7X2r+po1oKOLXgQGtV+xoaQ+JH4TQ44iAf5Z83Hi7uimaP0BQZ9nv7Ap+aDYJTrs6SW3VYienzHo9xc4I92pPMzOTkSDMRyKi63eMu+Fk/K+EMbYcwgll6hyb/WRUMNQM8y+vD0Ez4pkteHQaUM3K+5UG0MA0S7FYXBe6qNVCCEzBuBM3/jcwKoe++iiR9yPLS0QojvaAqso61P3Yid1kMe9vYEyCmSihLmTL0tDd6QcQS11kLgTwiRo9qPJVPUVvXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.28; Wed, 29 Nov 2023 22:36:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:04 +0100
Message-ID: <20231129223508.1189461-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e96b74-93ad-4c7a-18fd-08dbf12ba138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMltqfwi+f9dL2CSdYns8Q5qsQrSiCjRAbCsvwjB4AK8QI5Em2w+Joak0nN2z+myqX8RAuffRE1DvQ4gtdn/PSqK7EAk/73/hMAcpR5e5kd2KPcr4HGG/bpKHCnU8U7OTp1ejUyxLm9qENSwBCpQ7kVZWIuq2BUienb55qEAOx0IeQDVvASMVqk46PNhSC7idkDDJRLFlBnpZKNO5fMNa6qE1FRflaiW8hKw8+RwN9feLOhAQUJ0tWPpkq1ewIMWl6eiHU+lvuUKu7J4Ei9C3Trh4QKKV9fp+hwYDwwEARnWdrO5jijFJM719TzzoP0odhSvnttiuB38AwDW8eh0jOMw6xoF/Mu9KyBhxZFvHxPCnJu3CqnFNzkqaOT4Q5TtO1PVahClH+19YfXoIX1jkL+8w3KZiSYjhgrSgKa5GMutPB/Ttk4dvPm+bLNUNHXCkG6u+e05D/EUCCGRDpImVRupaeYd/3PPK2GPS2SD7j6HgtEyrCJDBx6Zxw8hCMPjfUS0045MDkGkl5vWBOE8maVtkWj49qXj+tcQUw/5lNX5JIJB/jvmmIzXU17fvNxX6lqB5/Y1BHuPyRNfieuH0onpVBY+2MJmKWup7DvWJ1xnjk19zUcgGy4Qb6ydVRXn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(2616005)(41300700001)(6506007)(83380400001)(38100700002)(1076003)(8936002)(4326008)(316002)(2906002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(54906003)(478600001)(6666004)(6916009)(82960400001)(36756003)(86362001)(202311291699003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnR6dEw5cnFIRldINFdDLzNLWWNNdlNwbkpXOUZFeXVUbjNVcSt5cGVsbkZT?=
 =?utf-8?B?bjh1bGt5R3BoZ1JnMi85VG5rbnBTMmZpVEJYSFVsemNXV2dBcHQrcHMyeDJN?=
 =?utf-8?B?Um5SMGhiR1gzdjFnTldQa29DU3ArMXNCd2gxc0cwMG9TNXlsaStyYVNXWmJ4?=
 =?utf-8?B?U2lBK2V4QzJ2N3JjQTY2T0prQXZHM3dISjMvTTk5ZFZ4Q0FVSk5vdmszU3pQ?=
 =?utf-8?B?TDVLK004aURTTHRjcVZlVURwcXBPMEU5cUVFUXNsM1FIdEJ0OGdYV1ZnQkpT?=
 =?utf-8?B?aWxnRWJ4QUQrUGVHblAxRzRVR0ZoR0RYcjNFaG01eXA0VDJTTEZDeFp0R1Av?=
 =?utf-8?B?dmNEckI0K2pUc0pBcDVIcGZrZnB5c0hyUkpURmdldCtnN0NkdjBwK0JwZHFI?=
 =?utf-8?B?ZlVjaVhzaGNWQWE4dUV0dlVaUkIyblpQOThZelI1NERZUGZFaGZPV0lwcXVV?=
 =?utf-8?B?Y2hiRm5qRzd5VitrTEx0UUJrR3NYNUZuOUFHYzZHb3F3TWV6T29XeHBzOS91?=
 =?utf-8?B?NFI3OWJ3VTNPWXA1cmxyWlJRUm16SWg2RUVFN1JhTmYwS1ZqYmUwT2hodFB1?=
 =?utf-8?B?RDJxekIyK2d2c2VNaXJYcTZBcGIrVWxDanVGREszQmtVa3RVZGRwZXBORjRI?=
 =?utf-8?B?Wk45aGplY2pmakl1Njc3ZURNc2FIMTZxMVlOeGsxck93RWFHU0ZWT2NsUnNh?=
 =?utf-8?B?dkVwWElzTURTZ1NnUkE1c3Z2aWJBWkx0aEdLRXptdUNod1dHQzVhaXQyZ3Fu?=
 =?utf-8?B?a2ZZYlRKQmlKNGZBMVB6bC8vTDE1STlnMEM5MXhZSmtMdmw1Smx6bGpGRCtU?=
 =?utf-8?B?VmRFNU1Yd29CNWlncnlXUWFtcklRcmVRTDQ4OXpBdGwwTzkwd2hoUzQ2RWNI?=
 =?utf-8?B?aU5YdjdQVTdMVnpFVWFCQ0J3Y1BCaVMyQkJ6VTNKVUw1M0dlREdTS2JRSnp4?=
 =?utf-8?B?ZkV1R2NMY0cybXFrT0c5NkJyYjNURW9tZ2dIUDNlUDAwZnFwUzBiWnE2MDRw?=
 =?utf-8?B?WDFoZEdPa0xuNmU3NXpyUmdiV0hPQ2wzSCtKM3ZBQm96L3oxRVoxWmZKNUJT?=
 =?utf-8?B?Q29SRzNQQ3hxNEZ0NUhyWDVtTWdLTkVxT2wwTTFpbGYwZHhYNmx2UGE4Y2Z1?=
 =?utf-8?B?SWZZRGR0VmFVSXZnNDJnZlF0T3FlQnpuMmJqQjBQbXoyanlLV3huV3d5cXFG?=
 =?utf-8?B?d3drYVh4WkNKdm1HcUlla1ppZkFYcDBSWGRFZGU2N0J0Qzlyd2RJUzQrVDBE?=
 =?utf-8?B?Zkk0OGhseTBONGhBM2hqOHZ3Q1pQdE9qTVZmZ1RnT0Jxbjc0VVNWaGZFSkxH?=
 =?utf-8?B?QUVNRzFPWWlqVlJiMGRhYU5QTExVeGlveWtBeEV4bTBMZ0tjZVdFZWVmcm5N?=
 =?utf-8?B?MlB0ZmJOZDBGU2g1UWhxQTZKMUFGSGRsRFRPMEIyYmloR3RLYmovck8vL29F?=
 =?utf-8?B?TTJzdUF4VTNMNE5Bdm5jMEdtSC84QkFPczhRc1I2L1pMRkIwWUxoR2hmQVV3?=
 =?utf-8?B?OFpwZGgrVU9SZ2VBNzBxMml3clhxZUtBZUdwY1cwSEpNcjc0MFVDbVdEOStt?=
 =?utf-8?B?TEM1bmlIc2dSbEFwSWdoelFTUlM4dElDRFRKZloycGsvdHYvSFdvaFlOdEhH?=
 =?utf-8?B?VFhkbDFNRXhObENYdjZvZjE5aE9IN2VyaVFnR21TdUY5OFB5ZDZjWFZFUkZs?=
 =?utf-8?B?QkN3dzRIQTRUb0s2Ym8yUWo2TTNJNStuWHNRUms5T1VaSkRaaUI4aXpUeklL?=
 =?utf-8?B?TEJIcy9hOFhmRU5OSEJFaWlQcmx1Ui9GZ09qNHJQaVY2cGdVNjNLU09hdCtW?=
 =?utf-8?B?Z1lkY24wYnZGNFNzYXdNMVd6NUR2azl3RlAvY0lpbit2eXJ6cVBqOGQzNjFp?=
 =?utf-8?B?YW9HZCtpRmxtMjJpMy9tVGFBQkVPaUJreDRUUVIyd1lEamRLVjJUWTE4clQv?=
 =?utf-8?B?MHlxTmltTkJndDF6Rkw5WkVmY3JhcmorTVFkUWU1WTdTblpWbDRyYTROd25P?=
 =?utf-8?B?aG9kUHY4QjlxS09HbllIUk12b0YrOTZBSG5OYlB4anhqbVB0dXlLYUNNSS82?=
 =?utf-8?B?UUlSdU9lMkcyRGdvU1dqNkJuQVdVM25Cc2prWjgxRXE1cDV2d1dXVXh6amEy?=
 =?utf-8?B?akJ5M28zY3NwV2lGZnZWUE5sZ3NHcXJtNGxSQzRDYkVaTlBncFd0d0REQXd5?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e96b74-93ad-4c7a-18fd-08dbf12ba138
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:29.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwK2f2X6VWRdHc7ywbo+2sBxwPWN2rWTEizh+sdv+z7aojo83wYI69Hal6G3cQ9c2HLGbTaYj0iE+Ak9/e8aNFCwxi830IMisKoznVByBbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 19/23] drm/managed: Add drmm_release_action
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Similar to devres equivalent, it allows to call the "release" action
directly and remove the resource from the managed resources list.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_managed.c | 39 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  4 ++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index bcd111404b128..7646f67bda4e4 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -176,6 +176,45 @@ int __drmm_add_action_or_reset(struct drm_device *dev,
 }
 EXPORT_SYMBOL(__drmm_add_action_or_reset);
 
+/**
+ * drmm_release_action - release a managed action from a &drm_device
+ * @dev: DRM device
+ * @action: function which would be called when @dev is released
+ * @data: opaque pointer, passed to @action
+ *
+ * This function calls the @action previously added by drmm_add_action()
+ * immediately.
+ * The @action is removed from the list of cleanup actions for @dev,
+ * which means that it won't be called in the final drm_dev_put().
+ */
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data)
+{
+	struct drmres *dr_match = NULL, *dr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->managed.lock, flags);
+	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
+		if (dr->node.release == action) {
+			if (!data || (data && *(void **)dr->data == data)) {
+				dr_match = dr;
+				del_dr(dev, dr_match);
+				break;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&dev->managed.lock, flags);
+
+	if (WARN_ON(!dr_match))
+		return;
+
+	action(dev, data);
+
+	free_dr(dr_match);
+}
+EXPORT_SYMBOL(drmm_release_action);
+
 /**
  * drmm_kmalloc - &drm_device managed kmalloc()
  * @dev: DRM device
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index ad08f834af408..f547b09ca0239 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -45,6 +45,10 @@ int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
 					    drmres_release_t action,
 					    void *data, const char *name);
 
+void drmm_release_action(struct drm_device *dev,
+			 drmres_release_t action,
+			 void *data);
+
 void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
 
 /**
-- 
2.43.0

