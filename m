Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D0C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A26210E0F2;
	Wed, 29 Nov 2023 21:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABD310E0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294411; x=1732830411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EPJXE0zQ/NJhlDhX/2T87Wm3dxu1SW1HJ3p0+RLh1R4=;
 b=bv/d2JrsVRMr1qFN7mkORbZC+iwdPaRe1vMBqlM2eF5sIcyQTUw9KUw6
 xtNvTx52s09yhQtKvAerg6wNO3QbaPgxSv23b4bQPmz5ZYltjkO2ToYG6
 8Lc4DRIV+srZCCB7MjlVBB1fDLKOxCgA0JskpI9RdmEjzIOiQr2h6jP+l
 yJj0gDuQ1EKuB/taY2OarLznsBQG+xMo1Sw2KlP+N6r20VfrmpdVk+8BW
 opt/ti+8ftyrFjzJgGcKuJTqgicbXQgZ+KHhc3QCmiP0AMNpqHZQQGwK2
 XsjOWR9e2aO82p7r96UYoBayI9xICapIR8a2Ya1tamwkR6F1JL0ZYEfN6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975206"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975206"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100680079"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100680079"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:46:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4wBw2M7XECKWtRpW/ESIfa2icK/D4+5654MxObHyS8suSndO6qnQd35oYr7/r1e5hSX7qsv6HhtEcBEA1qnn2y4hUi4BIMgQuR8FujWlkmDYJYYe8Wi9mLykh4sS/9LA4fzv1MEe7McdIb1yjYqV1vBMSPDrWCCll5mN5UDVnlCJjzURRxZTU3neCufgLckSFn7/VF63oMFWJqdPu4kuGGVAiixXU9Bw82nkmjsTCDNhdPXfZ/XG363XVH2DAob5cGKF5jdFvUDi9G9dOz5VZVSB0nfqpc/qRi4wE4EMQTVexo0oN1+ire1xUMZiI1oxyWxYq7L1pkeUGqBIAC6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFUAigyiwqn1xolUcXcPI+6NWRdjSRgeSbMmD892lWQ=;
 b=mTJSFJD958EzZwvX9q7judydxKhIofNXWAvnRD+EAWzJ0IiHGKxO+zPfI6dEN5NefG5D48tP5MmyqyTzxVfMJ2qHAc0QnezBvGrt2x3Ej6d8Z2olhJ2VjeadWwBP8JgQ0S7Z5O+RKqpQngL7R9pvG28GWa6gM2R2zfh8cwZOM2TveyO8Q6qUvxXFe90/tsSJJGJ3NeWJEzWDh2b2BUkfuykrzIxEZsTXPDQAzJkTCi/HacwF7qjJLjx4Fq8fx6vZV7EN4J+d16l44g91NzqlKdZT6YP8EEWYT51QXtrEr608t0KN/hUOGnZzhm1ue7ocvAh2nLUKtlsVVyOshxMNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:46:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:44:59 +0100
Message-ID: <20231129214509.1174116-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fe7682-109a-468e-18f1-08dbf124aff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iuF7mWXwQvBuHa/IO73Gj7YRTHKq1VW0KOd7YCd4gdRRN6YBdtUDz+L5Z/xZp1TvJYkR4S32egpCCF4En516phpeW65myUbloW0LaSoofDt+w4NGHA0yfHGEiut3WFvETWYNtOGh9qJPcrJFEj1FIAOpJzErO++LGwiLP02VHp7CsJykreSc83jPY9owFCLHeYOU2hZdhWYnegEB+FRy4a2ROyYdw1uTV4+x3m6R8Sd9IhWX1B8kdluymfrPl9Y7yobMVLEaS3cWlBhi9Da+R5kg2MVD20Yv4i5SibKZwgSuA3vWnrQDA+vW/LLNgfdlKvcjg6SzNFAGOLPfHf7kVdiYKKH8nfuO3+iX20zcPjK8lSa+yZv8D7x1tEE5Azg6hHN0dnjOmePWC101MkodfuoPPZn2cgXo8Uc24d98lT0CaZtUtZD6EgCZDj57tWvuB3V4rysPPSlPlWQVsrHfRi3usHKWtokOtA7vw+Y3YMVf1AtkxId7vQyn20WouFjuRTjoqxvae72uQ7WjAS5WhOhcBelSJKLcWkkLGhoAOq9QTgs7NXg1tBVqrUjDkkKWd6NYaybkk0VLidGToepwHC8UVl5PuGRq22z40gZZVLQYcIUSjL+b3pSINz9RHreL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(6666004)(2906002)(86362001)(8676002)(2616005)(1076003)(107886003)(26005)(66556008)(316002)(66946007)(6916009)(66476007)(4326008)(6512007)(6486002)(8936002)(54906003)(6506007)(478600001)(36756003)(38100700002)(82960400001)(83380400001)(202311291699003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS8rRzVuK2d6RDQzaUFFNG0vamQ2SWdrTnZTRHJJT3FpVzZUN1FoUUFOalBk?=
 =?utf-8?B?OC9lUWRJK01uSkRNckxRZ3RSTDlYOWplTVY3Y0ZiL2NqTGhLYTJja3pyemZ0?=
 =?utf-8?B?WjJZUmoxMmZsT1VFL3VzWkswNFNFeUdsVnQwSWFwQWxvdjJ5MUNadWdDZ2hn?=
 =?utf-8?B?RWpPNVN3MnFVOUJzM3BTOURXTkdJSnlsUTFoVWZob2dYanZtcU9MeTRCSGJT?=
 =?utf-8?B?bHNBbzNQOURpcmM0RkVLMnhtMVZ4NnkzczBqaUxDeGU2V0pOVERqTlF0VTBM?=
 =?utf-8?B?eHZCdU1yREc4YWJzUlR5ZGIxbktqWVRUOUpjMVJ2YkNRMlRDb0o3TGttcktQ?=
 =?utf-8?B?TnczNENBbWFyMXFCaE1mSC81SFgwVG1teGVDQzZUVWdPemNaQ2xsc282WHFy?=
 =?utf-8?B?Z0kwbWJUNkUxUXJoMUkyWk1tVXI5ME82NFNNR3pqa09zSWp1anRHNjFUQ3I2?=
 =?utf-8?B?SURDNWNrellab25NT0xqRHBlRmwvZHoxc09SajBRNnRhd1FuWFF5SjgrdTBr?=
 =?utf-8?B?R1NrdkhxUit4WnJYSW5PdDNPVFJrSkF6WmR0MWdnZXlSZFhKNUNIRy8wUExr?=
 =?utf-8?B?SUtmYzJKZThJcVNINzMwRjBDYytDWnBDTVNUbS9SSkNGNU1vZDRkUUVEMlov?=
 =?utf-8?B?WmVMTE10MmZPd2pwWS95b0U5M3dYSFl1SXU1bE9DT1F6emRmVWcwblRXcm1K?=
 =?utf-8?B?aHhYMDQ2N3oxVkpVaFhtMW1zcmdHT2lOOFVlT0RSVlpFb2ExcXVoRDZncTZ5?=
 =?utf-8?B?LzNYNlRGYnFvbDFzVU4xMnp0aVg4ejUwRzlZYzY2Tkdza3Rpcktjc2RKREpw?=
 =?utf-8?B?VnY1NktGQ0t2NHpzSFJNNHNBaTRldFUrQXRGQkJ5UDNkTjRoNWlzdDZOYlh5?=
 =?utf-8?B?R0NvaGVBM0dmQjVGRjVnMUhSMU5nMmhNKzNGMEpjRXczZXN1TkJPWG0vNVFu?=
 =?utf-8?B?MFhDYWNNRlhBTTMzK0RCV0MzK0RPaVgvQTZmSTFlQ3dZeDlld3NEcUUybVNN?=
 =?utf-8?B?TE1FZmpHdnd6ZzNiWVpDZUdjQTlJWk41ZDI5encvekpkaVVDRkNSUkw4cDB5?=
 =?utf-8?B?VFRzeVIvbHFEOU44b0ZBWHJwdWx3T2lsZnp6bGZlTlNObmY3WWZMbFJ3WWpH?=
 =?utf-8?B?RUJoSEVJMnRtWHZvOFMrSDN5UU9zSlBLdTFkSmVBNTg2TmJ1N1ZGcEYwOTdp?=
 =?utf-8?B?UUdCSHVsSERrYlhtbGpsTm1BZTc3eWREQTJzbWJmaDh3RFFlMG5hRlN1NGVk?=
 =?utf-8?B?RmtEUmhTYTlBT3kvSHJEdklWZlpXa0h4WDBpcUI3SWtUZ045R08yQUwyT0Ev?=
 =?utf-8?B?Yi9wRTBFMlpNWVFDdHNjREFvT2hIRGxjd2ZOVG1aRzBTOXNZdXZ4ZzlLWTRm?=
 =?utf-8?B?bVc5aFVwU2htN1dYRDZnWkROMURMeGR4ODVZUFRRV2lyalpUNXZXRVNidEoz?=
 =?utf-8?B?TGQxcTBVYmpKTFFhRWY1eUpTRk01b3BCdEwyTUk3WVVpaDc4MmFhdVg1a04w?=
 =?utf-8?B?NnhpV3ZnS3FMUE15bkp6dTNEMnI3eUxzWGV4QnI1RkRCeWhPRjBGWXNrS0hF?=
 =?utf-8?B?WGJ4cExaNUZmS0FsaVdpN29NWFhvSythU01IcEhwRzFKVGtrUEI5YmZYZmdT?=
 =?utf-8?B?T2MwUUFRanJYT3BJVG04LzJUK2svVlhNSmhVMjFvclNXQmVZV1ZRQkNDWDlZ?=
 =?utf-8?B?bkFXc21Tek0rRXJCc1lUMjhBRnprWjFjc2FFSGR2OHNFS05DZlhlWGNUeHd3?=
 =?utf-8?B?Q0RzbGs0Vzc3dStFNTVYTXpTK2h1Q0Z0VGVqVGlMQXdhTXNsVkNFZDhLVWVH?=
 =?utf-8?B?YTdOcEFINGVvRE02dm5ZcHAzVFVPNUZaSnpsYlN6bGYzSytyMHZnNVZBVHFK?=
 =?utf-8?B?dWxqNmFnOFhjTlJXMmQvMW5zcDFQc0lFME9GQzYweW1KMUgrblQxMTZFWXFm?=
 =?utf-8?B?QlZNdEpwV1g1dGYxSXJYTUJGRlBqZ28ybXdmbDZvQm8zS3N1cmpZTXdXTG1D?=
 =?utf-8?B?T1A5cEd2MG9sWndnUWhISDE2cGJHZkhPMFRVZUJpdnlGbkxUclFXZDVLcnh3?=
 =?utf-8?B?bTlVczBZdVg2WjExbDFnWkV2NXVaVjZZbGYxNEdBYSs2TlpKeXppU3hzWGEw?=
 =?utf-8?B?RFNXTVFnS2lmUVVSMnFrdFlJRUw2RGlYVVhSRWNvaTJTeGFzckpNdnNCdk9E?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fe7682-109a-468e-18f1-08dbf124aff3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:47.7207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCXYSnO3TKWRsO2397O3wBCufm6gkFPIvhrJcc1bSetPfLJcpFo/QZhyRYTy69EYwLmdkjvP19o7trKJGjw9d9NHER9KS8BMeOteNdsRl3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 04/14] drm/xe/irq: Don't call pci_free_irq_vectors
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

