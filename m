Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97992C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3234E10E0E5;
	Tue, 14 Nov 2023 13:02:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEBE10E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699966967; x=1731502967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=p+L/3ou37J7L8OA3ooSYNsbY0L5NNJVF2efIrn5bXKE=;
 b=Y2RffN2v8I5VwB0gcH+YzGO/lUSYonQpVOMIXWujx+rg1zgTDeZoJkHs
 fZ/8vlRrkiaZ9SQpp22VSOkerN0b8qOC13aahm8Bp2cwzeSPdfQGlcUdy
 MQHxvNicYT6E628wSSw/1PKC1ROlI4V0nVGGBtmxm711vAEiQac30u5ir
 INMuJrddizo1+S0ylnfaYKf3sh1iItGItBRtyoeTzRBi1pcqm7oiCouRq
 WcwehbZv0Sp94Ddowl+wpIC1PTDQWatX2EA+qIJ3fhGtsEIKnxUArkVCR
 tjplxmAGb43sih6ELDOgOVTfdT1Cg80KXnbuaOjzTDfBGdmgbCfTZG07J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="370846854"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="370846854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:02:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830573445"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="830573445"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:02:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:02:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:02:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CT452dizxpXUvgnF8yf+NNUf1OtBks7MAFuSEaMNJ+nH20BD8zqUMnFkCvpi9tj9qxcgXmfB27dcQuRGHYthVVMCYhseNp33LOSAPqqnwDtbuWlt7E11JQLMoGZeeEoM2TwDtFgOoihAQJqda2VGRroMUKH9pTgrBKyX6sijwnD2AZzEEghKQCIXXQ1uQFZhUeXSd6rMAjeNLeRtyXm3MF1dEW6DfWJu4bSJAkG+zKdQMhOJrt6MDTGNgX3jfPRv/AHU9SCge3VwsfCw87cX8p+198tW/VgcIjjIKFtluCuIeeUGpNXVDTWWcQGykSPJcymSRsO+y4sKD00pFaBv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeLFOXrM+3UX3Vqz+qXiOkwhosho8UTpjos5vD6AuH8=;
 b=TgDhuie5/2mIkr64I8yf89JDOrYM3S1q4UTmdD/8PONzqi+9YbC/DFhbMz6SdpcCS4xO1loqTbb+jtPBgRH+brIkrXnsMS1J8MX9TtaCS47zJJ6MtxSdgl6ccELZnp2dIMywOfJ68j/Gb/D5aDEjKTJVzvVuPBMOUeSW5sYBWXAsa9aLSLjSyuBgWeIQB5LQQ5J08Oeb7Of+fefkVjdm0qtPAc38KVtcGEHGyzY4beH2LrSLanCQsZ7kav7d6bkzyCqZELGFKbMNq5AmwPgYjsLMXiqAN7XbFF0xG7wbgVbI9jjzLBEzeh6s8FkGZjYwRlcs+bwTqT4kkNpr7yMZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:02:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:02:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:12 +0100
Message-ID: <20231114130231.2299661-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2cfbf1-87d9-411e-b45d-08dbe511fd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jyXhoHImRjbnKhZDwqbSjVvqKk/Vrg4sdUDS/4Ij3iI6xzkyOD7spi3Eo5FbsKe9/dO+wxb1CDuM7DE6tRNIS3+7RQeQkVxVOCOadEsXHpWgf3y9+bF+S8kA+3xmcJBcExQQq0wwtZZY8skmmNLYQvjrdo6Ylp3iNRUJw02PVJrx6enjAevQ+NpIETUF4IFRAIYB7eZGTekJlc+wPVpoPeF6+9k4mjQI2kDZai7jRuFyAqNh6Ghysjma9Lyjg4CTqgZ1+HHD4sIVckh7gUonRSWze2il3GUB/tLC0pNdqx9Tn+VpzBYUhB0/Z+8Jad+QZTO+h0JwDGeNWkXKRrkxZHxRHdA+vRbC52mEgvMgTnvyUbfP+5U+8xn/+7EUoSORLv8AK/wkB8cIplvGv+E3D3acCjU8taiUPI70PUUipInT2tEi+yirYypCEj5oJNET1rP2E8Td3RfZR9o3rKh9Ef0Q3Irxxxb6CKd/2r8a/angTlyEJC2ytKEeTIrvnkNZbigQd2KfP4gg+Glg9uOgc5Dl4hHLZaM5WYe76iO41EdchLh6WLOY7VhIYJEFR1U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGV5TktmMXVJRCtRQ3FWdjB0K1JSTmJQVlhNQzRtNnJNS0ZIVHgwdDErQlZY?=
 =?utf-8?B?ckpEKzZNcWZIVHlZVFVlbkRmeTIvNlYvNDNrZGVwQTBRK1A2QWJZQ3ZkV2xJ?=
 =?utf-8?B?eHR3ek5wUEVBRHFmbXhVR25vdEhaTEVxZ21nam9Gb0Z2QU5nVXdxNFBxdFpp?=
 =?utf-8?B?NjFiZjRHclNJSDNiSXJRdFlqZXBROUxNSFRjSUJCUUtZNHE4R3J3T21vaWhM?=
 =?utf-8?B?aXp2YWV2anJmT3czeEcrN3NZL2liRDI4K3RZUEcwVmtqWFIxZnZKaG50T0ZH?=
 =?utf-8?B?VWZsRG9BRGZRaEdIUU9DOTFLS29OUFcrL1hsOFF2RWdGUzNEK2QzaS9BbVp2?=
 =?utf-8?B?bW44eTI0STNRdk9ucThvSmM1eWV0L0gzVWYyS1d4VTBMQ3Y4dmZJRHREaUxM?=
 =?utf-8?B?T1ZRaXBSeHUwUXE2OEpXN3dLNlpyZURQWnNsVzkyeTc5UGxwUjVYQzFXdlF5?=
 =?utf-8?B?cmlhajdzcWRFKzQxck9zbFFZZC9FUFJEUjg1aG1lckQ4ZUp1R3orNXR2eXA1?=
 =?utf-8?B?eTZHZkVCa3B2SUdobGRob2VJcjVpTTlOWitGTEZRZjRkc016czVyYy8zZ0pn?=
 =?utf-8?B?ck5wZ1h3eEVhSGZubGxsSDdkaEthOC9lWE54cEtHWitjQU5LblhhMHV2alVh?=
 =?utf-8?B?ZjZtWkZQcHJLSTVXUHQ1Lys5cTFaOVZqV0lpdUtFNFhhajg2bnVGVEY4dVZk?=
 =?utf-8?B?bitBUjdJNS8zOWNkaWU0YjFVUlJxS0o5ZlNSMFRuVGtZdkNCWU42bjhOTHo0?=
 =?utf-8?B?VWVibnQvZ2E0R09Qb2I5TWNuU3RabzUyV09Ja2JQa2h5NG5id0M0RFdoKzRh?=
 =?utf-8?B?a0pnc0pNSTNFNzdMMEYycEVUQjdIZS9hSEw5TWV4V3FyVHFVR3dNNExud2kx?=
 =?utf-8?B?WWZjKytiSGlNY3I4SllRSHNSV2grOXZGTWJkVmdlamdjR3ZZVUdteHMrbTBJ?=
 =?utf-8?B?VmcybUV0M0ZXVThJT0FoT1pheGhmWS9jbTlOVEFUKzhGY3A4eXhIQ05WbWFz?=
 =?utf-8?B?YXNndkpLZ3hXNHMyUGVHS0E3K1h3REJvYm1TV3dPbkwrVG1nUWROU2poNklo?=
 =?utf-8?B?bFVWOTM3b0Z0MXBwbkNPbklLbmhmZFQzb0FhNjNweEN5UkJndExkSFBWYU9U?=
 =?utf-8?B?WktTcndRRjZuUDVBamt1UUVMRGorSEdpZVlmb2R3QllGSFlmMlRsYWRLTTEx?=
 =?utf-8?B?VmRZL0tsVnRZdHc5RDk0SUJLZW5qbnp4STJpQm5iNzlKd2dlWXZMLzl0WWwr?=
 =?utf-8?B?N0QwU2FEeTNRS3I1TXhDbjV1MDBvZU5KWldqVFg3UjJsU0hHNklwU1BTWWh0?=
 =?utf-8?B?VStSYVQ0LzRzNnB1VWhpTjZwNDVWb3BJTDB1TVZISExVckpRSkU2ajZyMUp0?=
 =?utf-8?B?YWJSN24zcVdnV0dvMW1CL0VtejJFd1RicHJwZURHVUdDZ1o0dWFWelgyRC9X?=
 =?utf-8?B?dEZ6N1FmYmR2REpoQ1BSYjNxVDRKUGVYWGc1YVMzVG1qQXZmWjZmcWl4QVpY?=
 =?utf-8?B?ZkViK2hWZWZnSHVyNTdXSEJEdnY0akd6U1A0aVhqbzhLWVlWT24xYmU5S0x5?=
 =?utf-8?B?Qm5WelpNN05UU3A3ZmYranc4OXRQRTBPVDJMUHpVNnlKSmNpejJkcldVVVlB?=
 =?utf-8?B?bGpuUGZ2QkIzZDFhbFFGWGZMZ2w1c2lMcjhJL05VTjRKZUJtRVk0bkxVRDZ0?=
 =?utf-8?B?d0pvcnVhUkZwMkhpaEhzZnFFUk04Q2Fwd1JNenBDY3lPaUFvaHd6OTVTb0l3?=
 =?utf-8?B?QzhtbnpzK2tMbm9BVmNvRHVMWUl0L0FOQTZoQ2VjS0xaYytBYkhYbHpldlVZ?=
 =?utf-8?B?bVJnWkp4KzdoQVZTakJ6NnNpWXRSYWN4OXNEaGVOVEt5UzlkK3ZpWUlGMnBM?=
 =?utf-8?B?RWxRak11NHZoZXZpb1NxVUt4RGVxaThrZlJmelNvRHZsWTJnVlMzdmx3dmNL?=
 =?utf-8?B?RkJDNDlvT2J0WmFZM29nS1EzV0Jkcmo3QnpiWHA0ZEg1VHE3R3dTVFZRWU41?=
 =?utf-8?B?QUJIQ3BOSmNBT0JMMUg3Q3lRV0p6SWZDT1YxMk1McHJzQUZ3cEhnMmlScWpC?=
 =?utf-8?B?QW9lcFFucHBEUk8zNjMxT3lJNm1UTFl5ZzR2by9udG5WaVRFR3dPRnV5MnpD?=
 =?utf-8?B?Y0RYb0xkUnhmQ0ZRNS9FYTdxOUEzSUNXN2dLa2cvcGxVenVDeFU4ZkVveDhS?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2cfbf1-87d9-411e-b45d-08dbe511fd71
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:02:43.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoNfNiNTJfOKKBj+yC4V9PfwxE75vvi51yXeGmfyi7T/nDH7e1VefFEDAd6FTgwROjyp8BcfyO0EJKG6gG4Rgx/aWGPcgicjfHR9vKi43kU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 01/20] drm/xe: Skip calling drm_dev_put on
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
index 1202f8007f795..af0abe56c24b7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -217,11 +217,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
@@ -247,18 +247,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index 682ba188e456b..de986aaee3bb2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -701,7 +701,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -743,9 +743,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.42.1

