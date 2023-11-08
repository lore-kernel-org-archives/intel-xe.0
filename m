Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5FFC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764D10E305;
	Wed,  8 Nov 2023 00:34:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3E710E305
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403649; x=1730939649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Jl97sGFxLx8m6gDh5+w0wW8rdBmbA88WCVw8nujlxgw=;
 b=Rcj0PMjOiKYQc8N/m89Zq7uS66N7EbYHJmLZTC02EIM+eOvC5FkzcwFv
 SfWjb6Nmw258ErAovzpReNOJpckzE+skXjmKDBNNLpbZn64k/fGRdFe9/
 rTV0WUUlC8HlRXXq6eFN3MAeTjG9NzhY3NFl6qs9bw/GsZGPGHOWgqqls
 GF6P/vtkXFiCuicu+W3U4bNDgA3UXWE9wofZofDt6JgkUnJYtnvBAYeuV
 5o1jl2R0clJeEW8+Ey84vWIE2VgDvwOrdf70qmh1zIUiWtDcRVLuzFRZC
 JRiHMPBA+0YnF3a+k/DKeT6sVbTIGqTKN9S8wkXIPtFWCpGr361vfQb2d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="369861020"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="369861020"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="4015004"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9xbOJbVxK6C1U6Msyf3DvTnZTIEsjLQh+B6hsRPNf/QQLgFDJZI1lvoJiwSrqP8DZ3oyRDtmEML4hzhqF7BJfhTma9lnIXr2+63WxiRtCv404MymBKqF1vK/0YT2SYkPUhfKT+dt7YtQ5MqYMBIUNbCYp1rzN8Xnay0FmY6H6TglZRQjBEgKobvZEqOdjlZPyJf1UQ75o+Fu1xYmyekRfGBukMXsHGxqNZ0BElta4ESkSuK9em8b+6ijsYKnfN0UvrR084sDppP2z6DchO07w40IIL0NdyhW6i7SJdF5hyh8+nq+40D0UCFP7xH1ho7aFqjcr6TefZHaYuuccF5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykAnQO5rd+AtyO8DQLNooG21VmIeRrAaSdd4gEBIXCI=;
 b=mlL7B3UilvqKjRE9e4agU4GGNMTZqq2enmZnHs15nlLOZt7mmTX2YRS5JH4CtA6b+W0AxDAs0hw5wZlLfs6MGeQMDsxE0P1skc1AagNWHSaVzCvxAaTBZNCHgnV+Y4M4q7LUnZcSpwmZ6PQomZTwriEztovaB/QvzAN/R8ZWBaxS+7qI9f+vJflPGTikK00oKmiQ85AfPqsNKsJgIj7nQ3TNRVUG3Vh/MyP+L33srF9H7TAqQhzFLd38aLDhtFJ5fJlh6v2eANbO4RYObSvzgOoA8rtykmTc6CZHd6a69OUsfeIryuGv9k5FsnhDS37DcSUqdP27o7Gka0Bv2l3cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:33 +0100
Message-ID: <20231108003344.1169016-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: f8847333-8580-40d9-4e67-08dbdff269b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFoZvhozW21RL/jlCGt+nETx6UxuTbGR9Wu8Yy9+3cRBTdMgZotr2iV6BoEqtANPYifQ8+uzfwU5OtSLkhiHXWt/cHzaSuiT4LIMoJjbBSZ61efQfBYEjtGOaTNJSVRUhw2oaWIkGuAMOwSYXdkdrdxlK/kPOKgLr8AS1ad/K5jk2bT1wQYLY2PCotWUOmigoNPeOZpswEFukqDeUnPBHdkHpOjbkCVWnPzp3FxLPPr0boZxHXIIs+2T6Ay94jZhTTPmBJ4/IuOOROzHxn+Th9fZ7Q7SJiJBEbcaPZL2xAPqGyUbUkSAM60vNlyhmWJnpqFGoQmEur/yAIhyLR7AJwZyR77y78wQB5HrKYS6j0hdtsQa+gqBicB0B0eiY+P4DePSTzREoguUgEFHnHf6JQ+2zdD9TjNRu7dI1DT7toKDG6qGpjg1XNIBezFiRMz5wF199rXN0IyPmJ4pxspnBR3dbOTzXMy3wZwf5U9eyCQQRbIS3PNPwh4LbVioahg1H9f+HsBmsLU01vX9AIPuZ+xvfAe9j6ftSXtR5IvGT6olMNOov7gfdrQ8IppmnadN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE1OdUJ5WnVSSjdRU1VJZHdiU1pTUVJvN3luT1U2OGVCc3FnVWU4ZDJvSHQ0?=
 =?utf-8?B?UytwWmdtS2wzK0NMSnE4d2V3VlJ1MHJYdlZuQmpsSEUyeUMrMmVWRmFtZXdZ?=
 =?utf-8?B?ZjBFZ3RCNWZlMjhYb3llUHN3cGZaSXdGUzkxOXZMMm9UOWtTN0FOZ2tnTndB?=
 =?utf-8?B?NnZVdms1dkpQWlBKTDR0bllHRjZ6dWZRdmxmdUcvbGpnNUFtS2gzTDh2N2VC?=
 =?utf-8?B?dFZtTXZXazRTTXArcXVMV0hwek5Qd3c5dHcvZVVkTloyOUVoc3hvaGpjbFpF?=
 =?utf-8?B?Wk1VK2ovNjJoQTlFUS8zdGwrbFlvRWVxaW8xYVBRWUd3UlEzSS94bkdWaVZY?=
 =?utf-8?B?UDNkLzVlVnUwcVIwbHVXY1FGMnJPbktwdzFLK0ZidGhPZ2VjL1BMN0dLRE1E?=
 =?utf-8?B?Uk5WTlpqQTNwNXl4dEJCRTM4Z0NtS0JsREZwYjcvc29JRnc4ZWxNd2JndWts?=
 =?utf-8?B?dzB0ckxBTjI5Ulo3RVhES080TzJnNTIxaUVnTTlocHhFakNLakhRbWZGYmdW?=
 =?utf-8?B?V0RPNmZBY2UrSXZHRzlSZlpRV3hxVGZxUzNmcUtuNkRvRzFFS1JEOHExTk9K?=
 =?utf-8?B?amgwSEhlZ1pTU1dKTzhiV3NnaGVkb3ZiMTZvWDMyaEZmamtaeTVVNFhRWUt4?=
 =?utf-8?B?YTd5WWpLdWpxcWJqVFpJMS9nTTFSNHV4ZElPYi94Y0tNN050VjB6SjNWMVo2?=
 =?utf-8?B?UDZ2dGJhc2dnbGhtS1prbGVlNlg2Ly81cmZsUDdPN2JVdzZRK0tKZCtmNnZW?=
 =?utf-8?B?bXQrSkpGeC9zc2N4UERTbUxKL3FOZ1BFZHNHMmJ3ZjduVDUvMmlSSGJvSS81?=
 =?utf-8?B?Z0l3RzB3RnV0dG54dmljc0djczRWRWtDUktDcGpYajI3NElLYmtSb1FyRVIx?=
 =?utf-8?B?TEp1UDJKejBxeW5lT1QwN2UyOGQ3TUZPVXprTGlqZnJqdUZiK0svVGlWWUZn?=
 =?utf-8?B?dnpOVG51QlZBeEt1V3VKby84ZndxTGJsSCtsTGt1RWc0aGoycUc2d2kveDVu?=
 =?utf-8?B?U2ZGVEFnTGtpZUoxWWdXUXZTeGdieFA0OGR0NEZSaHhBWEhDTzNETXIwNHlD?=
 =?utf-8?B?S09NUjhmcXY1RmhrZmlZRDRoZUNMaXIvM1BqVXNFcmRFSTRqOGdzS1BuK3V5?=
 =?utf-8?B?Y29RZXlGVS9RaW54dU83T2tOUFBvRmUxVjl2MVFxbmtzNnVFc1RSZUNBODdi?=
 =?utf-8?B?eGFmbTMvUmh2cXY1VHFYZGhxcUpkaGNHZWEvbVYvSUdsY3FsWFlkTDRJZlBW?=
 =?utf-8?B?VXl3aHhhR3dCN1h6eGpWeks4SVQvQkdpb3JMRUh5R2xTMHAxYXhLSDVHNG4w?=
 =?utf-8?B?ZXlkTjJ2UnlNSi9teGFRZVVGQlFLTG9ST1NERGpzUitvbmVtVlFNVVJVVkJw?=
 =?utf-8?B?eWxxSGRPWWRaM0FzTVozVWFqSWZ2QTk4MTFNRy9aQTJxN3RXeDZCSHMvSnNS?=
 =?utf-8?B?Zy9iUUFuNzFZOXpxYmpSTjk2RXc4dXJtb1IwYk9Wa3E1SnkwRTNwcHlCdzh3?=
 =?utf-8?B?d0dFazV2MGhsR3dJSDBwcThFd041RmR2Yk5rbmY5bnAzRWZNT05mZXd0aWhr?=
 =?utf-8?B?MjNQU3R3NWYyUllLZkNCUXBYRzI5SEpOa2MvSUdVQ2NraGd2aThyZ24vWGZo?=
 =?utf-8?B?TU1pZHUvTEgvUzZyZFN4ZkR5dy9STUEwL3A1RGptTTlrcHBBU2VCVkE1K1Yx?=
 =?utf-8?B?bTNhb2pRQ1dJMTBuSVFaNnBneUgrQ3J4ZEx3eGIzdlMzWHZ5ajUrUXBCdGpQ?=
 =?utf-8?B?SmNFbHNSb09OV2QzZDErYnBhdHBkZEtmZXQzY3hneHF2bXJ6YU9nT3RkSS9K?=
 =?utf-8?B?V3ZXM0RpalNTOVNCZitmUHByOWd6OWJpeStSVlBXaXVhL2ZaN1F0dktvalpu?=
 =?utf-8?B?b21hSHFvckkrV251V2h0MGI3ZVFqWEc2T0Z5R21aSC9rMkdrWitGQjdHSC8y?=
 =?utf-8?B?OTZHMHNQV1dqSDZpbmxTNVB0MFBNVWEyTTI4VlRHTE1uUVFMaEVVZzZpdkMy?=
 =?utf-8?B?R2l4SThtL1greTMxb0pCczhzdDRWbUlQOWUyNjV6cC9jZzJ3WEEyWUk1aE00?=
 =?utf-8?B?S0c1dFQvSzBJZFhZSzhhUGU2ZTlLell0aTdPSjQ2c3RiM05nN3FuRThvcDlU?=
 =?utf-8?B?TXJCKzNPY2JEdWNLWnd6cjZxS05HOUZzWkYxMGE0RnJwSHNlc2g1cHFCTTFN?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8847333-8580-40d9-4e67-08dbdff269b7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:05.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mz4A2Shx7nKuZ6+z+th0KMxiOyCLX6vXtcTO76CfyeRPAzozQLSSEdcmZZ5w8EP0hj+2AHsw76hNKKPekPeW3EYobQNNXL427YIT+BK9hFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 01/12] drm/xe: Remove shutdown
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's not a required callback, and Xe implementation is empty - remove
it.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ----
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pci.c    | 6 ------
 3 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 515cdf599fab3..078c92576062a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -476,10 +476,6 @@ void xe_device_remove(struct xe_device *xe)
 	xe_irq_shutdown(xe);
 }
 
-void xe_device_shutdown(struct xe_device *xe)
-{
-}
-
 void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
 {
 	mutex_lock(&xe->persistent_engines.lock);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c4232de40ae08..ee89af6b1ea9c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -39,7 +39,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
-void xe_device_shutdown(struct xe_device *xe);
 
 void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
 void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2fae45b9d88e1..007e272d2758f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -748,11 +748,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return err;
 }
 
-static void xe_pci_shutdown(struct pci_dev *pdev)
-{
-	xe_device_shutdown(pdev_to_xe_device(pdev));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
 {
@@ -892,7 +887,6 @@ static struct pci_driver xe_pci_driver = {
 	.id_table = pciidlist,
 	.probe = xe_pci_probe,
 	.remove = xe_pci_remove,
-	.shutdown = xe_pci_shutdown,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
-- 
2.42.0

