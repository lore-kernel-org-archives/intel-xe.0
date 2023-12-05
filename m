Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F6BC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A8210E45E;
	Tue,  5 Dec 2023 01:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A2B10E45E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740019; x=1733276019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xCBR9MihB+DQcsl/sHyYUd+bLpwC3aBPJQaRvo3CZPc=;
 b=aJ4GzZuDQlbq3DHguIaQhm3jUoDsWtmV8AvB20tHKJC5EL23YRRtyUcZ
 0B4L4vXr3lHNBAnzdxmF3zcGf+4Urme3A5nZ1HgBBwhfw2EJFRcVmcG+n
 ws05Mmiay3H1IVjCP3t86kEMsmlSFNBTCCg3oa4ph1TVflxXIAuQTi02u
 QdFE/mqiDnyc5UqGYr8xk5xmGruaXZVg1kSbUkMgj/153PWzBlYLlyJsw
 H30vRJqHag3kknDY1pc9AcA54Pq1gamtKce3lKuBWtJC2AwZwCzLkFNU1
 pATJgF1BVvJHLZaGe9MFg+tQOR43ej6mMgz7digTDduA+hqytEZYaVouJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268812"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268812"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277635"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277635"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+M57Lgn45esGs3l/rMpRVIOPbTTrYrYopdPFp4eltqZNwFz3Dg6z6Hc/kfvTPgBX5Noqf8J4l4pbqLm8U/FsGkr5BfMqSKTcXCMIa9P7BLuYtEcBz5+bjnas4J9NIiKQ1PetsmtA6LGkfBHbrdSrtjAu7nzs2F8McKkcFfPU7K+X/qYupuozQjxBWEbtwqx/Jxog2fSNJfnXOiBP1M3Fisv/ZT2+N2NyTkF+CArhd7dhZy5F+lyDoMbt0+iGTKLKiZ7dvK17amfNMEuGb6E8nfAtd17tuPb8fB+mFECT1K0Y0ORGD9jCPRdpWvLnV8MJ20QfybE9pF1Oq+GB5UWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MImZgGQxxdSSzODEFOs2mtNLTROZpv1XHz7X1lYMpNM=;
 b=J8/PCS53LVEsJFZxixgyXnxqmy8DDdC49jWYxeJAnJ0FYDoyMQhI4aZfgZS6xIoeURJc1RU8qSCoZAzAglGQmbZokqV9E9SWJ41bVSluMlzM3eAnd7xmXjijcUj3w38tO9HVw0/fUDsNGDAhYj61PJ9efUqkI8WwLYs0ArjWpn+wJ98fPKC6Mu3f9OFzW8Vj9N9l05o70zMQPBy8CJDD1EaJNTII1vuoH9MUEGH9bZzHvLV/n3j63t44Wo3o2sEtvcq6kquXjoT+Zvd/Zg7sEXeRo5KC8TDs7aEkWDaAww6WLYsHeAXE/qDuc/Ob3Zr0AujMZ8p3usWZV0VB7IGqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:02 +0100
Message-ID: <20231205013309.1497006-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 152b53be-3d96-4b64-d1cc-08dbf53233b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irgF4sPAJAwPEBPvKMslMgk9KGWm0HFvknwsY+w5gxdEPhzC7NCK7Q1pPB8xakKlkZBaoiLEjc2fu/1GjyJQQOaXgVuMJCNE5aiTi3+IcIYiJLK+92/C4c6EZxybJu3iN7EDyd3n8BJ2z9SfoKAGk0jDj/oLpXheObcPS7042iWN9fwoILJXuY5f79lXscuTRBYt3Z8mrCz4+69hldV2IAPBDoLyuX9OwJEiksPFmot+a+2t+QAv9v7yuRx4H+mC9nDzfStcC534PalplX5mpHP/0oScvhUoh4RyUyQzzQWWyPprfHaBrhZvhIwsjoV7vbvXNqFwFWlp3iO9AucWbWVdV7BtAKdMsbCXOylW/sLLZl7W4Sz1x+nWEp5el/vOuNgyc+lq78TF/zuBhEVWSfb8vX4vNK0B5RB9Cxzt3ZhkwaaGy4qYGrO5lMBD+S/5XmZZm9Ks8zsfz7YFXVg8uQ5KXkyz6y9q8uNwqnRQhO3yk+jhDCURyLkPkiirV9s+Fz2bvpHO6q6Y/aTJ+Gw4BOzr4OipJQWC3dhz+wdCmPDRaaIY/L1bbCaOYtXmCenj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNpa0kvK25ZR2swU1lFYXp4eEVET1IxQnU4Qi9KQWl0NTllZWNkaHViTjZn?=
 =?utf-8?B?bThIcHgrdHM4RC8yRDFwak1pRUNYSHRrZ2tWL2oxTzlmUENMTFh0Rm9UeUpn?=
 =?utf-8?B?Y2hGQW42R052cHcxZmNDMGkrSTJaSUs0akZ6dWc0a2pzeHFJM3hhR05qWVZa?=
 =?utf-8?B?VVZpK2ZVOVltRCtMVEhhL3dDaW4ybUhvbitXVXdoOHgwSVhVTXR6SWhIMmZV?=
 =?utf-8?B?b1pqSGRFWDVNYmY3NHBKczhaUEZpeXNxdzcrcmR6TFFNUXdJQkd0ZzQ3ejVH?=
 =?utf-8?B?N3lZZUc4Zk9IcmhlSTROckJZYXRHWG04c0dqdG50Z3FxZEoyeFFHL2dxbFZM?=
 =?utf-8?B?WE5mY2VRNDMvdWM0bG5BLzhsRFNkRXRId0h5RDVUOSt0cjExeGVDWnRVdHZn?=
 =?utf-8?B?MVRibEs0eTk0TGoyYWdwQmhpVk9Xc1REbzhUVDlrWFE3MU9CSWxTTEIxeU9X?=
 =?utf-8?B?R0xVNS9uSlA3Q1lRWUVtVzVkMW51ZEt3LzkzU0tEcWVOY1hsVEY4L1hZNkFG?=
 =?utf-8?B?eDV3cFlJdUE0V3FqV2RGbDhJODhjMUw4SEtMVXRndDlSWjc3bDZ4V2loNDRm?=
 =?utf-8?B?QlU1Mnp4ZmtySEdQUVRqRzM2MkVXMTNUcm85NngvcEw3MVJqN1BVL1dIUldJ?=
 =?utf-8?B?M3d4U24yRW5yU0pKZDJjKytaTVp4QTl4SDUrcW5Db21mZyt4OFlhbGViNS91?=
 =?utf-8?B?QW5HNlNVNU41cU5BN3pnU0xGUzhRLytGRjZNT3QrYlRobzJZYjgvMEpwZjU4?=
 =?utf-8?B?b0N4b3J4U1JPZlFFWTkyZnp3d1d2aUQ5ZCtmWCthZnh3OXFyaU5xallORHF3?=
 =?utf-8?B?YzhQMGt2bmxud1lLTktrUEZheDFkL1hTRTRZc3ZZaTJMdk9odWhkQldNRytK?=
 =?utf-8?B?VlJ6OHBJVWlDaGJDMmpUSmJKLzlGTkhPTHdLbExEL1o4anlnVTdvKzVIenM4?=
 =?utf-8?B?YmhJNDlGRFdnaEVodUJLVERsK0lVcXMvdG1wRHRZN3A0Zk5HSzYycGRLc1pz?=
 =?utf-8?B?WXNtRU1vQlhsY2NxODV3ZFRLRUFvUm5iTlVCTStUeGxCVUZ4TzR1QzNKZXU5?=
 =?utf-8?B?WlpaaithYUVmSzlsRU43MXd4bUw1UmtQSEdyRFduV3Y2NXdobzNDdEF0VDFp?=
 =?utf-8?B?UExUOXl3elI5bzRSZ1d4MU55OUxJb3hiaWd2V1RzeUNmUGRuOWtKY2J6QkVv?=
 =?utf-8?B?RnFzZ3hPN3l1MXBQelhISmg1V3J3b0NsZU9La1dTdHVYVS8wT0dhMm1xb0hz?=
 =?utf-8?B?YmNoYnJwQ1Mvb1QrelZTZXhhYzRDZS9DSnRGZ2NKNXVXdk1ROUpjWXhsYVBJ?=
 =?utf-8?B?eUN2TTZ5eERsUTNrQjNIWUdWZ2pmbDlaWVZnS2xYRFpwVkpZckZEbWhOYm1i?=
 =?utf-8?B?bXdJTElKRzRZc0tFakRNbmczT09oOUVXV0FTVUV3anpKNmRTKzVvVzZDMEVi?=
 =?utf-8?B?cHk2UHRGVm5LckZIWWhTS2s3dEpWY1o4bXJnL25wZWJrRUJqNnN6OEZOUE1W?=
 =?utf-8?B?MTd0MC8vNHl5bERURk5aa3Iya0FWMlN0NjI4T1JXMFJFSE9oTE92T2s3V3Jv?=
 =?utf-8?B?aEp6V3VnY0dUOWpsSEFqSDMrTFdmeEx1aWJjM3d2bllCcElGSUlWTHA1a3o4?=
 =?utf-8?B?bkNoUy82ZmIzSVQwa3JjRVFaWVBrdDVIWFlVOGE5Z1UyUTlkbEN2aExXTkdT?=
 =?utf-8?B?WFBYeXhsYzRRVDJaY1cwZkswQ1F4K0tiUmhjd0tsNUhIOUdsZG44LzdMNkJn?=
 =?utf-8?B?MGF6YTg4ejRkSG5KbGg1aFlnUU9SVmt1ZVhzcFZKRzQzWnIwd2VMRFVGZFIv?=
 =?utf-8?B?ZmhiMGxKd0ZESFJQVWNiRk1nZFpJQlNEczNYbDF4QklBdUlkeUtwRDlqSzV6?=
 =?utf-8?B?M0FCenF0ZmQzT0lNc1Brb29IRDRpVkd6WWJrQUxOdkczOWZVMjlaeThiOXRJ?=
 =?utf-8?B?eXZGYmxabHRPdFIwZEpQSVhWdzdMTjhVOTBMY29tS04xSXZSdnpyaGcyYkFu?=
 =?utf-8?B?bDJPZ3c0MFlqRGFkZ3VNcDdvOUJHWTVFMDFPTVJ2TlhSQjV4VUEzak1yaHNK?=
 =?utf-8?B?ekJvWi94Tkh2eXc5UXdyZll1cFlEa2RwQVl2MEZUUVcvV1FSNkJnY3pmVGRl?=
 =?utf-8?B?M2V3OEg5dEYweVFkMXEzdUp0dCtudkd5UjhzeUpJNnFXaXNScXVIeDFYZEpY?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152b53be-3d96-4b64-d1cc-08dbf53233b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:36.9080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0hbpZbZrZgdjpb2qc3VYTK5WAM+Rp35AAING0tcFc50s5OuLQwp3cbrCunIaBkEWlDan2/f5WTd5LxpbzJSpxJz6kW2pNMQRcirXISp9lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 07/13] drm/xe: Move force_wake init to earlier point
 in probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. And in order to load
GuC, being able to take the forcewake is going to be needed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd56a8c3f80d4..bcc10b7f23ab7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -415,6 +415,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a6fb9641cd69..4db94344bbde7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -293,8 +293,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.43.0

