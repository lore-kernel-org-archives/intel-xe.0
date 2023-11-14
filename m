Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B6EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928210E441;
	Tue, 14 Nov 2023 11:45:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE410E440
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962298; x=1731498298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=661EFXb/4JXypFnojQWyRaI8mE27PJdM1OGttNHDdl8=;
 b=Hu9G+SZaKoK9POfhxoQ0D1bH0vwUYBpRASrA2t/HvN4Xt9dy7vjKpixS
 BL6P3YhjWeMxRa9K01+rASEN+WviHrmHGGwubwQsysgifYS8LDGY0IilO
 qlK9h80gWF+eDcqmOnZzNWid+xTCz52/A+gWoUSW0v32HNuhxlKKDPANI
 1Hlmaf3a4ZjbNe90NkGNGNRmxdl2d6d/n4+NfL+UR0z1Yg9EuZX4WZR7X
 byaOn/X3d7TQ9qHqbNsBXsVWbwPuU1GF0KugSSEupGflKO/d/3w4gGmK3
 DO0V5H5jJj3rQ0Ch4+vtPaEshZUVR+PPGAxLlugtXayUA/BWemlQBteHg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849737"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849737"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:44:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070861"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:44:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:44:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY7PtdSzdrBxXF6dt5PqLVrBAplbTZjJS1Y67ZFh+Fdefa8TmsjfqMhEoa4K3KJC4UZKMV7DlVhCiH3S+g5z6pOREElzEN6u5GX5s4pPyRkQdZZHiCVjnjSJjJMy3NIuJrCZ72Aska0+LPB+IgpJhpVGyRFdNqy05quJuKJTE8qY7ooFfwiuboFNHFgr61JVmlY6Ws1UH19qdMy0AHKGeasieHNEcNbBASqc0hA+8+R6V1zuJh3Adcod455tr5dMqfHw5KmPXCjBkGJivauZtg0gTrqKP3jCKtryWsAk8rjxrUeN9EZEDlu0uBGsMKib/q0iWCsvDzhRRbDQ0MtAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWMHnLzN0LbMZxnu0WygNoqgctR7TRpwhrWI27jL39s=;
 b=YigOCITa2xZR1p9tsf+9NJZ3q2lqa+9si6uxTHyUdcmJvJLhseU9qms7YSJNXo1mVx7+S02u23j4VIS8boqQLspKMUS8OQX+sI/Xv/nxi/MkHWNtO9gaqP2fThRiMgYliS9uInauO4Za+Lw/94GrZfGekSgOQG36Cqq8VmLKF5nZ8lTPTDe9rHWPzj080BTzgv48pZssPxyiGIQCIe1ZDZn+MZ8yH5Eaf37FZNzQ8rqd7nY4wbE4naeaN5ObtUrZ3tg3PA0CGTK51pd1q2Adtb8G7jHkjUSMtCbCPodBxfMn8K99FvUodqjuMRAg2l4GhV4lrb8vgXhI3bQwtJGu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:44:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:44:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:48 +0100
Message-ID: <20231114114405.2207747-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6544484c-77b7-4e13-6ee2-08dbe5071eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7Qm4lHt4KbcrX8oa8WXT1wZlv9WuLn20ptcjkhGsa29OY4g4HIjBp/VoEYU2b0lp1O3ks5PgWxI5O/rN1BS19tLtyiPDlnWx1P2eJ1X9QWtjqThSjjVkdwPmsmVRE418Aady9RCvMs0LjMp6LO5wOWUg7bqpyU/zlFT2XOLcdnsaTyI0kB6szC+irRN0l5ZSQ0LMh8SpWsR+iNTXcIRO0d03YXYhsk3LxGvpjKmDQleFToSYLqzcN8AmfMkhst+oRhmmybFd+s6o+pJm0Y/WY8AzeNJmEYnQvWZvXgFHDKNNR/8BQemdhjxlYUfZo7lDFG/RoIQEXg2CGJjriQ7vtGg5wjoQZuBMmHBdU/INtEbhseyWKcOZHYMwy0qzw4i1g70x0MLN/lsP3kzYOauizjg6HkpVQCsNtk2Ier62gAqsBU3GUMsW0YzfxBb0B+J24OGmBBtMuqnAOJsjUtt8kbtUmmSFdsAp0oOOjWSqsueuPrX3vZBSUsTzqMldGXgaLE6PV/77NIfvMXwCUNiXwIPXHj26oa6pQwBJe8nQ4j/z6MjD609EqI+nOSifV07
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVF0L3RHUHJ3WlFKWXROWWwvUDZqK2ZvV1NBc01QUmtCSnM0U0hXWEZLdVJn?=
 =?utf-8?B?eVJxNkpqT3Jwc21PemRldVBNcW9nS3RPVTlrZmNjcHlWZDF5SXI3cVZYTlN6?=
 =?utf-8?B?dTAzQ01NMURrTHZaeGtkZG9iQmJWZkVNWXI0Q1ZOK0JRMWZ5SGJEVGM3RHFN?=
 =?utf-8?B?QTVhbVVQTFFkOVE3UkRlUUZ6SjRFV0FtMHJhU25EeFBKYU9IS3FhdmFLUkNB?=
 =?utf-8?B?bVdxdzlUcUxQSG9ENitrMndZNlNUa1VnSWpyeldmYjR0aFg5a0pud0VNNGEw?=
 =?utf-8?B?NHNjenJNblI1OXFZYVZHMGJSOGFRVUxkUHdpVmlvejFlTEJBOUZ4akxpYmM3?=
 =?utf-8?B?RDJiRmdRU1Q0bVZPd3ZSSGxPWkhLYXhrQzZBL0MzYUhDR3Uwcm9EK1RrQUtj?=
 =?utf-8?B?ZlJPbk0rWHNKYUlkNUk2UCtNSG5zcSt3WFpnM2c5NTVXN2VGY1pUdEZhRFRM?=
 =?utf-8?B?OGs3ZUpMOXhlSUxKb1NRUEVDMTBiNU1URC9Zc2Q0djdhUHRhMTdzUzQ5ZTcv?=
 =?utf-8?B?ZU90K0laSUxnc1JFVWJwV3FNNjBrMmRUYnNzbGdhOWQzWlRsVmlPRnRtZkwx?=
 =?utf-8?B?dHloSnJxekU5QXNHQmROZDNPd29aOFBWT1lzTUZsZnBISHF6cWt5Uk93ajgy?=
 =?utf-8?B?ak15N0VYbTN2NG9NY0p6TTNLZHF3TlZJWkZlRkhmRlJzRE5iaGlPV1Bod1Ru?=
 =?utf-8?B?MTIrZ2UzdUlzV0VWZVExYUxFUHBibXBDM3Z0a2hSWFZiMzBMdzhOV2gyVm0z?=
 =?utf-8?B?Z1dLWUtWbXVUNE5NdTcrRTVhNnlCRmV4ZHBCUW5raFE3bUxMYzQram5yUHZz?=
 =?utf-8?B?VWdOVEowMFJNNDVrMngvQTBGeUlCcXVyNS83QUZSN0FlR3dIY1hXbEFKdFNB?=
 =?utf-8?B?ZVgwaWRyUzZXYUxNdGx2amhnY2E5cC9ZRWZJVm1PcXdUOUJuTnBJWE9Dbkhy?=
 =?utf-8?B?dWFEZUZVODEyT1EwZ2R4MFA2S2QzSFJFRkpyRHNVb045dERiOFdlOXNJelJo?=
 =?utf-8?B?ekVqcTZmVnp1QmpqM3lUM2lMYU9ZeUVtSFRxcXp5UXAvTTNkcG1rTkxOVVNY?=
 =?utf-8?B?cGpOZWxiQ3M1S2M4UHRLclI3eDdVRm5SalZMSUlaMjZUMlN5dTk4L0hVVTE1?=
 =?utf-8?B?Vlp0b0FWd0NOdnBQdS8wUUtXMjB0UE5HRnpDRjJqQ1FTM0VsSHNMd29RNm1u?=
 =?utf-8?B?U1c0a0t2WiswUVRaVklDRW5xY3VUVVAvMHZYYkhsQUtoUVh0Mmk1UnJ6UjRr?=
 =?utf-8?B?c2kzbGxueEtrY0Znc2h0R0t6aFEvZVhhVWlVNGJENytJVU95NmhQV2xMTGJM?=
 =?utf-8?B?bXgvaEZDb2x0cFZoUUNoRnJ3dGlXYldaa1NlNlN0R3VDK0VJZUo2NWYyNllU?=
 =?utf-8?B?V0JNVC9EVEpzWnRQd3oyVEt3NlJDSjN3VDVWRzk5OERtb1g2VkRHb05vaXRR?=
 =?utf-8?B?anluNUR1SU5sNHBLeGxWb2QwUUYzaVFnVkk0dXhuQ0I1cTFscnV5N0ZzS3V1?=
 =?utf-8?B?dTZGaFc1QmxRV1d0QUJXQStXS21HZTdWNHBVa3R2Y3ZacUVHa1VHaVBvU2ZG?=
 =?utf-8?B?Z3UvWThGU3NLOFA0TlRzYUV1OHh4ZDVLcFdCZEhGME9VcHNOTG1NUTROMGRw?=
 =?utf-8?B?bDVhZXhtZStCUVdKd3kvMnVMQWdiRjUwVDAwNk9mcCtUY0RINHRLeG4vZk1L?=
 =?utf-8?B?czdJTktPbmVNUE9ma2RUaVgvS1hLd3ZmYTl2V1Jqa1kvSENER2I2ZXNCOGQ4?=
 =?utf-8?B?SjZvbEhpdUo3T2FjVTJhVHJTQ2x5c25rdjM4anduQ2ZUQm0yZTQ5TTJ3SFlh?=
 =?utf-8?B?ZE1EQVVBc09WYS9NdHlzdS8xT3daL2xQSWptdmNpaXpEY0VKOWpQaDVTUjhY?=
 =?utf-8?B?SWhmKzl6MEJSVTFjd0dWQ1JkWVJPRmFBYVU0UXM5UlJFWmFGMkEyOFhJbWhW?=
 =?utf-8?B?MXZFQXpsTGkwSXAvUmlMQk83RGk1MHNDRWFZUllKZ1ZDUTVtMjMyeUx4SC83?=
 =?utf-8?B?V0Q5eEVlTHVydUJuWmljWjdDOFZPdFAveTBZclMzSjBRSkhENDNxYlo1N3Fv?=
 =?utf-8?B?ZjYzOS8ya2ZzMVR3ZkRFbEl1Mk4rNDdXcGRjYXlGTlBhTytPT01rYnJHMDNK?=
 =?utf-8?B?UDJJZEpBanZ6ZmhSUGlQa0pBZlcvRzdYeStBajhtSmlrcm5hNmt6ajFiZ0hE?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6544484c-77b7-4e13-6ee2-08dbe5071eae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:44:54.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPNY/ce4CSXroroXPLv0DNWy7N5EbuQ1MwMVt+Wap0XVzKaf2cezIr2Yz5w1rzra8pN6tBvj2lvwELtA/f5jADgmBKqhmLVgEPHlcK+Yaks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 03/20] drm/xe/irq: Don't call
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For devres managed devices, pci_alloc_irq_vectors is also managed (see
pci_setup_msi_context for reference).
PCI device used by Xe is devres managed (it was enabled with
pcim_enable_device), which means that calls to pci_free_irq_vectors are
redundant and can be safely removed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index c5315e02fc5bb..df4da774d0275 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -603,7 +603,6 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 
 	irq = pci_irq_vector(pdev, 0);
 	free_irq(irq, xe);
-	pci_free_irq_vectors(pdev);
 }
 
 int xe_irq_install(struct xe_device *xe)
@@ -630,7 +629,7 @@ int xe_irq_install(struct xe_device *xe)
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
 		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
-		goto free_pci_irq_vectors;
+		return err;
 	}
 
 	xe->irq.enabled = true;
@@ -645,8 +644,6 @@ int xe_irq_install(struct xe_device *xe)
 
 free_irq_handler:
 	free_irq(irq, xe);
-free_pci_irq_vectors:
-	pci_free_irq_vectors(pdev);
 
 	return err;
 }
-- 
2.42.1

