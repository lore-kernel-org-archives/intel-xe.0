Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD98C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE18710E69B;
	Wed, 29 Nov 2023 22:35:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606E010E69B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297348; x=1732833348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EPJXE0zQ/NJhlDhX/2T87Wm3dxu1SW1HJ3p0+RLh1R4=;
 b=LMK2tR27LKSWI06YhNWStrEXLiGs7G76nHzDUP9FW6xbgNVmGw74CA+O
 XZjxOQp+FSt9PQFGKPsAFq/mvsuNw9ZvtVPVOEqUIPJ0h+wOfHkaVzC5P
 VNxJScffjE7mckJ/A7Vm6kHhVpdFB/WntBO/BuPwNPg2/jZszdgVnAKcS
 HfShufj0kGagQkOph13RzUSA5S5wrRGL3EmXk9QwRdPdRhPItlBMjCi3j
 qOGUvWMp2JFaqryOrw/7Iq4UZEtcA6Y/m9BIMxoy9Wijnt5bB3go1W376
 iLQ08SZBNjUjk7rwAIcEP2ZH8u/GIpIDr5jPggjb3aDEiljYONOE7D2dI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420111"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891840"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891840"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:46 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ96AC9EsKFwOeOrByPYsQ+RN8iuO5f3ZSEYRjksAKfAm1OSUveTmoqIxg9vGQW8fXt2narbeqwilnyLd/tpO/f3u4BAAp53rVocXGc1S1I4njITzcSPIkA7ru7koY8qZjL6k3Kxnn3Kqgx0cCZlgMf1Su/YJBKTWyjCN+wHoqSN3m718QbTZjrlC89oxrrKFgQd39Ls6PXKB8DFpmR3WV/H94I7No2CgXDTQNy0mM+tyvm0fQgkcH5FWFs3C22t4RZXUKaEJ5bNBkwWkai8QJsCGQfrOqGAcqItjLFlVz62AoFjMcZr9Zfr2q56mR+LnlDy+R/0mjqa21oEV5PRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFUAigyiwqn1xolUcXcPI+6NWRdjSRgeSbMmD892lWQ=;
 b=lzsubMHm9gPK1nVK/4IMuNdzoJ9Sr+bL3lc6nYtnBO5IGJk2lz+r4PfcR/NAcu6Srz9a8TUV67jh5hnOtoGfCDx4NN1NhgpVkLpjfA6rOXySKynuXCA8LY+N0OnIgZNVkRZH6mnzkmSAR6tw3CVV+FnqdZTCQd50KAgaV0zdpiVue02GsZpzsNnkeJTpSY/i2My+A4f9wJXGUZEAiqjc7FUFMyAhR2kOrp3VHk8V2ZXEPjjIeKMolpvKlWWJ/PegR72qbEoda3oJZLeaznbE0I/2e5+LnVTBWnf3OQve7RkyR71qP9/jzT2cJ8xxuoc9nKL1dSfF9PSxl85rElxGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 22:35:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:48 +0100
Message-ID: <20231129223508.1189461-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 924110bb-3f0a-472f-de74-08dbf12b827c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 80fJzZ79I4W5lHgX6uABbBNxjYIsvgTUiu7mwOpJuXOPAHS2iokISv7BWzJ68vrzLzxDRUZ7JQkf9Y8cJuhzFPPFRvCIKPQGF21zeCn416ZJ0Ce3dPs8eeVUBYT1u28QF9G+LSYd/6Gmq7sH8FkBcjuthYQUXFqNapSj3qHmA5uY1Zt5HnHz4KTMNCTjN6DrqtaI/S5HYc5R93h4Ug2Q8WdVYv1qpMuaQCVy2hXhaFjf2/25rV/rb8i5qyTef7dHRYa7+bmdYZnxTtm2v3Kb6ZbKgQ9D91rqMbCfpU2etQuaLtZ5TT1DL3ACdsYYlN3mx4S3rC/2qF+4zub8ZN+Y4L/RPC3xRGRcIoSgIjybUMOwpsHPkUdEbESTVUrUQNAOwnDzEtG2XiJnBJKhjZIcGUqRalD1HMdMmB16C9ZxhdI4jRSfl3G46/tWvg79avPdK0azOlhJ2usujWsQXCqsy0WrxnfFrKciujZHqnkX1anv1m2uebQiHWFDhaCzSs2MdmI3vT2C+j3LnyzyNGh6mdQUur8cc73dEy5xEwAN6bo3HTq+9QQCLe/p6ZaBM5GMdZUVAfoixh+Zh2eVeQHvVyW82tv5CxSsJht8ETZpq+v1EgFGLCxy+phUbBg7Rqb/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(82960400001)(83380400001)(478600001)(2906002)(6486002)(6512007)(36756003)(6506007)(6666004)(8936002)(4326008)(8676002)(6916009)(41300700001)(38100700002)(316002)(5660300002)(66946007)(66556008)(54906003)(66476007)(86362001)(202311291699003)(26005)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm55UlVYNjBaR2dTR0Q4SXNMWkc3WEV5U1JVNlJ1Umx0Vk9Xa3AxclZBSXQv?=
 =?utf-8?B?VDdZK1FweXdVRkRLMHhKOEVKZHVScHlhZmRJZWQydWRFOHBXNUJRSklZYmJB?=
 =?utf-8?B?RTRmaTVvTzI3ZHJHdjJ6MXFDMHFRQ0lVZFQreHRuR3RiZ0pWRU00TDdWZ1Ft?=
 =?utf-8?B?eXNrR2svbzJtTGxFUW1PM0tjNmhvRFdZYy94cnpaOFJzS21QamFLN1NjRHZ0?=
 =?utf-8?B?QkVxSmxUNXBrL20rdDVnbEJIYlhndTNQSTYzNWVURGZlZUV0NXNLMFBlaVhp?=
 =?utf-8?B?VEhzU0JUSVdiWEpENjhyQno4eWlHWUtFc0QxZC9QMFI4cHY5NGVLSGZhaTF5?=
 =?utf-8?B?Q0w4cnhnQVZGWHI5NjNaWmhuZGN0aUl4aGNYRnQ4MzhvQUNzalY1YnR4UnhZ?=
 =?utf-8?B?c3d4QkE1L2R2Vk5CS0V0RW5sYmZUWFFEODdNdHFuVzBmVmdNWHRURDhSUlFw?=
 =?utf-8?B?OUtTVVdkKzBraVc5R245UFU4TVhYNzRFWEdWN1QyUTJ0OTJ6VUJ3NU1jYk5M?=
 =?utf-8?B?SXptSklCLzJrdHpTSHFkUXdHbHhycVFiSGR4aHdNRWMzTnFLR0JGZTNzNUZR?=
 =?utf-8?B?bFM3akdmcWZheTBHRVFlWnlwWG5STDRIdUdkMHFwVjdkeHVHY0VwVmJqYTdO?=
 =?utf-8?B?UjhsNFBXMnZ6VVd1Ylg4RCt0MW9UckMzaU9hMnE2ZU9IeHlSNDNFSXVnbG8r?=
 =?utf-8?B?YStOeEdEZllocCsvSGpWT3V1YjRTMCtEYVdLWC9hVU5kMzZJQ2U0L2RGVWYz?=
 =?utf-8?B?OFBqbk5scVMxS1pSQlFlQzdvZDFkcE9Da3RkT1lGczBzNEVPSWxaZkZjSlRJ?=
 =?utf-8?B?ZkwwTkxlYkF1TU1sNGx1ODBtelFtQ0dmc1B1WlFjMHRRUWliQy84cFN0c3Vq?=
 =?utf-8?B?c2hFNVVXcFAvcXlyOEJlNzFnaXFBUDZxZVg1c3FSbDdwcDNSQ0hlbjUxNGNX?=
 =?utf-8?B?bEE3cW9qSzBjNzN0dE44S0M1NWhrOXlyMUhCQ25DdVI1aDVEWUg5MnVIUWNt?=
 =?utf-8?B?d0RLZ2ZEd3VxSk1XSUdtenRwN0pOWTJld3FKbjBwVzk0NDNZeDAxUDE1NE9n?=
 =?utf-8?B?NmJncWVsOFhVN0xrbTJrcVMrWnplSDFmeWNVTWZPY1VpTTljNE9SYzcrbUVL?=
 =?utf-8?B?RURob1pKQklJdko5dDJkVXdYS0tHOEVjZ1lkQUtGUHFKMFRMTUkvcUlSeHY1?=
 =?utf-8?B?VlFOWS9jLzBtWTZrUTJRdW9obnMrQ3NqRE9pZk01bTlCRlBZWjBLSlhYMTBR?=
 =?utf-8?B?RnpLbnJrYUZ0R3BYZTVxNFU2dFA5aXVwVkVCdmZjMVBUZlZ4dXBQR0hCeVhr?=
 =?utf-8?B?cUFia0xXS1V1YTJQZHZzZndOYVdNNHI0eTRrTE12WmxJZ2t0cGFZVE14cXNZ?=
 =?utf-8?B?bzZsNkhjTitBVGIyWVlSMHB1ZWJHTlVJd3RRZDRoL2c0TmZJaG13ZjNyYy8r?=
 =?utf-8?B?a2pFTkg4cVZ5Z1Z2QTcwbWZSdzlCcjlVM1R4UnU1SXlLREpWOXBxODdOYndv?=
 =?utf-8?B?VVpVSGJ4OVVGbjU5MEhtZitmRzRCbUgvRzNLeUZ5R1ZNdjMyUG5Ja0FUbGQ2?=
 =?utf-8?B?bC9PbnBOSHJjN0liOGM2VU53U2hkSlNTdWFNUkNDOVIvMEZIMFliMlVieWVo?=
 =?utf-8?B?Tmh1djQrODFTOFdnWk1oK1RxVjFFckV5aW1NQ05xYzYrN2Noc013VTBRWVpP?=
 =?utf-8?B?dVo0NWZLME9xS0JFYXRZZHR0eENhMXZKSmpaR1QxWnBucEFIcTJ6K0MxVVFT?=
 =?utf-8?B?MzBLQ0MzdXE3RTJZMlVHejhGSFBWVS9nV0U4dUVvOFRpcnRnTnhlS296cWhX?=
 =?utf-8?B?N0M3MkdCRnRvL0lESWNzWVQ2YlR5ak9iMU1zeE9WTzZzY3dRajVyN3hMS0xu?=
 =?utf-8?B?WWoyOTg0ZUpEa01ORU1UNVNhZWN4NGxPR3U0UkNMNXV3RTJ6SEFtRWVlaTB0?=
 =?utf-8?B?b0w2SlRGaEpXbC8rMHFLVnc5OVZzVnp2ZDEwKzEvSTZQZzYvdUY4TkZoZGVa?=
 =?utf-8?B?S0QvdVhYNXBpMCsxNEVCQTRQeFdGOUlEVXp1UFIzMCt5amR0Ly8xRk9mV2Vs?=
 =?utf-8?B?ZGIxV28vZ0F0bVV4YVRjVkFHbkt1bE43cnlsV09BMkl2RS9TWnRzSEZJdlcy?=
 =?utf-8?B?aDV3MzB4eXcrcjViUVlkeE1JWVJYY21TKzBkU3gybSs2bG93TTg4ZnBNakFq?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924110bb-3f0a-472f-de74-08dbf12b827c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:38.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I960V8RuAjKLMKC/rIwaRqzS5YI1RMJHgsJT+ZsP+nXXrnNX48CcDc+WY0p5agOEMHL8Vv0IkLFaZoWUxkYLHfGPRsi82uaypC6i6z6I8T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 03/23] drm/xe/irq: Don't call
 pci_free_irq_vectors
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

For devres managed devices, pci_alloc_irq_vectors is also managed (see
pci_setup_msi_context for reference).
PCI device used by Xe is devres managed (it was enabled with
pcim_enable_device), which means that calls to pci_free_irq_vectors are
redundant and can be safely removed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 25ba5167c1b92..d1f5ba4bb745a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -585,7 +585,6 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 
 	irq = pci_irq_vector(pdev, 0);
 	free_irq(irq, xe);
-	pci_free_irq_vectors(pdev);
 }
 
 int xe_irq_install(struct xe_device *xe)
@@ -612,7 +611,7 @@ int xe_irq_install(struct xe_device *xe)
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
 		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
-		goto free_pci_irq_vectors;
+		return err;
 	}
 
 	xe->irq.enabled = true;
@@ -627,8 +626,6 @@ int xe_irq_install(struct xe_device *xe)
 
 free_irq_handler:
 	free_irq(irq, xe);
-free_pci_irq_vectors:
-	pci_free_irq_vectors(pdev);
 
 	return err;
 }
-- 
2.43.0

