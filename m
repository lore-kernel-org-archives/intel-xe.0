Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89C1C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A922510E5D9;
	Wed, 29 Nov 2023 01:16:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B0710E5DA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220605; x=1732756605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PKdTBuxpiKnKLg4ii4TA5B8g1bO5JVz4jP6dzzdicWo=;
 b=BnszZTUDLs4Bk10Xl4g9X4H6HpNibUoWFBTfJ9TaDFbN490SgYpJDrjs
 84V5xF+3xzZnbdWxmAQhL4Cg43/hZ8UVwwLAlM4yEX0DCOQ9py+qHLcWQ
 N0FEANzxP10h9uT5lxV5rbvfjjOw3l9WAw+XMMTmnb0XiCL3NuEl9UGBM
 SxM1tPWVp+ogEP4896mUPNbtUK9HWMI6hoeqUrORKAX8JwPDi6Gj/5U2U
 5ytmGqQgfisoMdnfyR8E4/i8C+cE4Bz8lsa12JGvlCSnp1BQQFgW+cXUB
 JJAPMtnwFexYw6Y8s1evjlzhHgFwP+EKpzlOZu0YuNHjFAiwnyjyrsMzK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436520"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436520"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272458"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272458"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5owo0DvA5ey/ItagdBviuh0biRiJLOUt+CApxvNW2/FCp6y2HazVzNlFpZjVJTNer7W4XPNfA92jboxKUmoOhOD6Cv+uBE7pDJhmS3eeTnGo6uiaHPm85AGs4yuSXEOfr061woLEZZJpl+97fvxaPjvnZeghPUkSo5YcO68Ew1+2IqsAS03wAhcmTGjDatmA94S26Tip2xBRyU9tLi++VwPQB/S1ffBfcRQRmUAuBk10muBPbV0R0DHqONDQAR/gvhi4NsErdBTZtUxFMUq7yLs9AHF3s50j13b/ZYMHShzeMWM6I5rZ/alHJEI743sRzcGiz8cMWwmVvWgGX2/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV/bqKepYPSaj8zjGVSnd2KAEWeVeLNx+OJ8i1YmAHw=;
 b=JxqAqrY05o/B/GHP3hjJWAnRvlmjZ1QCRd8x2OWrkiaEeNB1sR0HgVgIn8+EI3qYsZEFhJchofBkarHwEMN8EVPfOEvNxUW8I/MIeO+bWazgLsEl0fOe3Uc6ywddkQ7F8pRYFxSXho8pOgHtPm+LqT8gJV6hT9hgCJganuAGm3HbUZ/iMIknJm6PMXOynmHAkn6a7q6AbMDvClCSeFptSwXhvB/5xhIXiLv3nz/tuqdbyK8SgDarIPYC4S8azwrZxRNNGRap3OpxK70C3c5p7+FNPVmBoTsXhgMOBcc0jkqo42R6w4wP2yArS+ZY3YqLvDBqMI/Wpdw/VRWUadSLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:03 +0100
Message-ID: <20231129011624.836843-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: ca81db58-9981-469a-81f5-08dbf078d590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NiJh0wgzX6wpQ64+sJFCU0tB92M2WX2dTkGwrUwtikzXeUx9/IiNkRKekXub5HPYUt86WUs9/ie3dhBTENVRjW/TEU+ruY/KtqyXjs7/g2VRtarlh6SKi0NyVhkHoMY1TPOYNWD+G/3GdXAHYxh7WmYePNAbA4p/UT7fsvItJU+JLEvVcdzK/Y1QmUsV0tQuQvFQ6zfgMhHtK/uFk2yc9C9TWaL2mtbPc3n+HWcpUhT4CAgdYIDPdQC+u8RlfUslLq7VdjMwizMTqrqHok4PEzjRbgQfmdOG6f+Nfm9qD5oaQmcCopeKCDuXQCgs1elY5sE0L4izYscDnju9ZEbQHxZ5WoNP3mVVEdXOZFt1KdQ0itH5lZMeYQnOsgDCohSrueGVejh1U7vwRaBn40aqhlJhPNzj3VnpyIaHUEDaG+YlCN6dIU9lfs4rBCEGsVwuDLaXdE0Es6gaOAgurCVjS9UtPu3NhVVQ0G4yOmmhcSaRY1mgowuvkJJ1mB98V8q5Gbxh1HJhzWkzE18nkSTshbePG6vJxFJ3ayJ28J/QTWrryzPwgmeTn0I2OGBacVaq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhRaDM0cVRTTk5pZ3ZqWDFYY0hlYUJ5dnB0a3drZ2FqMmp6KzlzcVhWOW5Z?=
 =?utf-8?B?NzBzV2NxVGFJTHd4cTl2aUd5T0YybGV4NmpNNXI3bW1SSUxWeWFETzUrTVZ5?=
 =?utf-8?B?Szh6NHpOQURMRG5DWU5nTjJvMzlqNFZmeCtnY2JuVGlCTCsrZlpaSGJEc3lP?=
 =?utf-8?B?dlVzWkhES2ZCbUVmYzlBZkt5anNLZmUzY2Z4T1pFMVVqN0lYdmV6MU9MelBJ?=
 =?utf-8?B?ZzBTelA2ZUtReUZ6UWZ0MCt2eEdKdmhrcTFXZGNGVlJCODhHN05KWHpMYll1?=
 =?utf-8?B?NFFJT2ZpSDNpdFo1Znd3dUpDNUJXQXNQVmQ4R2pIZGJ0SDRwQ2d4dkgrdE9u?=
 =?utf-8?B?YzVxRVd4bTloK1IxMHkxVXpEem9UdHpBNmJMNStqdUNlUFFxeVliMFE5b3hO?=
 =?utf-8?B?UDMzNEJTMDFJdUJLTnBSeE84eXVaWjV3bHBiV2J5YzlVbjMxSmluZENFd253?=
 =?utf-8?B?bGhMWjhpdi9kNE4wY3lEQmNNU216cmFWaVlmYlplY1gwSWxHU2U1M0lpQktJ?=
 =?utf-8?B?cUg3VmJTM1RWelFTRGxiMituL05Wc2kzc1VrWDdwV29zMzIyVlROQlBJTjg3?=
 =?utf-8?B?NW11aUFEM2IvdXdPenZzRmVFaWI2S3hqR0xDNzVjbktqMGZiYlplZnM5QndN?=
 =?utf-8?B?dGl2U3padmI0OUlUTzhIMU4rUGl5NzIvSElOSmlvN0w4OFlWbjdISkM4ajVD?=
 =?utf-8?B?M0o2ZFRIUGR0S29tdWdOL3dpYmJqaWlyekFqbFdCNjJqaXo5ZmFQaDhnMW1C?=
 =?utf-8?B?d0hoemFIU3Y3bE9lcW9ZMWZqTWNlRDRzZEx6UUtlS2oxbWJTVk1vY2ZTaXNK?=
 =?utf-8?B?SVRWWmo4QlRTZXlLSEZaQ0ZONXV4VndGUCs2dmNtSXpLVDh3NFVmeWNlR3JP?=
 =?utf-8?B?N1VHTnkxRVVKOXR4aFVZQ1FwT0o4S2pIVmhCUElPbE1zUkZoUnVxQzNiSDh5?=
 =?utf-8?B?eVFGak52eklEUFo5MVZnYjRVREc5NnRMZGU5M2h3c05hWHFvbVBJN2ZHelRO?=
 =?utf-8?B?UjU5MjJlRS9Sd2xGd1lCSHgvS21Oa2VVOXZsazdSQnBiTFhSZTZiOHRjK0lu?=
 =?utf-8?B?SkVxY081S3BlL2NtKzRLUGdCcmZ2UHM5NUtlKzRRWXA2eDQySnpjZDh3Yksv?=
 =?utf-8?B?ZUZuQ1BWOWZKRUM0eWpwakpOM013dE5OaE8vdzFoY3cxY29CanduWEVRVGEx?=
 =?utf-8?B?TW9SSmlqZUF6L0ZtWnRaV3BWejEwWkZZVGU4bWtjWnJIQmt3RDMrNXRtQkpT?=
 =?utf-8?B?SUxVVGE1NUp1bDNQRTNJWnJJUk1kTS9QWjlrZEkvbVVvcFZCZ2N6SFQwcUxn?=
 =?utf-8?B?SmpUYnlEckU1NWF6cmIyMkV3RkpPYy9yNnBNRUExdllGeFhJbWZnemdueTlS?=
 =?utf-8?B?cDdjQXAva21LVE1RM0ZEYXVhNXpWY1JkYjBZVFFvcWRyN1lMSGhXYXVZMXdG?=
 =?utf-8?B?dG8wcmpnNXBSL3pqWnNRWWFKNUo3T2xOd0FmSnV1MGErZDljTWJNL1ozUzZM?=
 =?utf-8?B?alJJNm1YNjg2TkRvaERNS0JXQ0NiQTNBVkdrejBaV2tIQjFMallYY2FLeHlh?=
 =?utf-8?B?WTZHNm5lNTBmRG5IdC84cEg3L1crN2NLdFNCdlV2M3ljUW5lYjVxekRsWEpK?=
 =?utf-8?B?M3dORlJtbkt5TVRQU1NFZHdDUnd2RUd5RWt4Y3pZbDV1ZHlmNzB6V3huUFhL?=
 =?utf-8?B?MmRMRENFRU9pb1daeDNRRmhWL3dubjlpVlQ1SFU4THNOVkFOK1gvWS84OGpR?=
 =?utf-8?B?elBSV0RCQnNaYllBeWdTRFgwMTlsVGFkS2FqS3djaVJpN1EvZ2VlQVNBSVdB?=
 =?utf-8?B?NmNpOEw2R05qV1B0MmlVTWJSMG5lb2JNZ1kyMHg5cUVlR2N1Vloray9XQnFZ?=
 =?utf-8?B?eTJwUkU2cmJadUlaMXVvNmY3RGRrU1ladTlDWk9sSDA2MXFIMkx4cE1sc1RS?=
 =?utf-8?B?Q0l6QWkxTFd6dUVUL29nY0lWNFQwRzQyY2pRQ25qY2RuT2l4SXlPMVZLOWpB?=
 =?utf-8?B?bnE2Wi9tNFI0S3BZSkUydityYmlzNFN1MDE4WVZRbHdoVlQ2UGtzaXFuSGxE?=
 =?utf-8?B?NEphM3ZYYkhKVVcyY0djeE9jU2UvaFhNMnNVY0dpYVhTRWtuNFdvZXRnSnpT?=
 =?utf-8?B?K0hqR3dkVGtZK0lmV0JwRnRSeFlHMDEzekpzZSt2U29NMHdFcjJlb0lPczRY?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca81db58-9981-469a-81f5-08dbf078d590
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:37.4297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IPEYSqlLOJD9b+WCh8mImQsSm+a7EjBGNQtpUisDfEfn+nThWeBm2psdO+xKWHHPTcNgbSfv4kD8EOFu0BNF2ILqycJL1NH8np+X9WPx+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 01/22] drm/xe: Skip calling drm_dev_put on
 probe error
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM device used by Xe is managed, which means that final ref will be
dropped on driver detach.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54202623e2553..296260f142dcb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -215,11 +215,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err_put;
+		goto err;
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
@@ -258,18 +258,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (!xe->ordered_wq || !xe->unordered_wq) {
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
 		err = -ENOMEM;
-		goto err_put;
+		goto err;
 	}
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	return xe;
 
-err_put:
-	drm_dev_put(&xe->drm);
-
+err:
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 994679a4eb897..db2a58747e25e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -703,7 +703,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -751,9 +751,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.43.0

