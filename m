Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E52C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7579710E1B5;
	Tue, 14 Nov 2023 13:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6AE10E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699966994; x=1731502994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=661EFXb/4JXypFnojQWyRaI8mE27PJdM1OGttNHDdl8=;
 b=LbdXzZar+2m0H3m6cW2fEzANsLHlQVWsCZAy4flAlYaSfatOd7oyJx0P
 7i6AJ0kfVxTJl205HrOxU+OuWEvKR+OvmM/Kl9GJy77gjx3Ldgj7ffGrw
 l/3pHGrovWETVXu35LbQm72CGPrWmP+Iz40SUULHVyymXRZMuTMq5NUYX
 RrhJYVRIigZ+7pN63PVAbezq0OvbiU3wB2LSE+kJYrRQhHCyI+UNU1P2k
 pc2ANqmTtOVTvUYFDcHZDvCuOuqJ5/VMilVL+WcAVDN1Jhrgdy2C7LpLV
 TK9H2cjEL4j5bB9q64tNdOMMi4NjkU7lz+OpRy5iLKPkXx+pMlzoSZBsu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375691830"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375691830"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882045876"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882045876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRLB9/4uvMROW3+J8TPulPdW3/CtQN2zSQcoNo1uk/wMW1pytrcCvYriKE7h9uzoJ89cvag3LauMvJTozLxFuiRpDAglRlC4UDXVhZVZMrdaw7AYvKXngzARCXin13XMlNIK2yzLjYOllArPnB9Ak6W7C48XQkWHzbfwgAJWRAAlQIiiNtZ0xscgMkJsWqHDx/rFjI6UB50qjPKVhCAiJpkurCyWhcrtBLZOKYmznu9UxDypJrBBflBqcINN3/QMyGN7YvkD/Bs6YAnPVjh1mCfqzAT15DtoCVuJ2uMXMfdKg2Lk2NA4zqC2tVgY2sL95vJlNyLDJwQlL69s1eyxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWMHnLzN0LbMZxnu0WygNoqgctR7TRpwhrWI27jL39s=;
 b=JayyfsSL0CQiT9eZCDrBW1y886WbmR68syDqOBx/Mjkh5FUfIhQ67wIXami5AXIdck9CcjzkVy7P3mjNI/flYhZMTCRr0JaJVAGGtFEccuFITkKyLg1Z7yMR3QS0nN55o+/ezki0iAIJs7wiV532la7DVU5RDiL6B2SJLSz5JgvMbamkIV0VZ7hv65bJdt33TJvX1S9Rar0ifMcH0RY2eGI+ttocLegJ736fnIzq4897sWdwSuGfRHNJmSg1dIXTEB3K6NBrvCiSQfiy6dDhJVlN/2aln3CZt5+rTZQ+whrpiiY0n1Rz6lcC+KW15QET4jost8C10CVlqAuShz03kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:02:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:02:58 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:14 +0100
Message-ID: <20231114130231.2299661-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dab230-1ea5-4b71-26b4-08dbe5120678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7A3KnS+PusYW6l9O9bc99r5CMTJd7Z877l/8AJckUZJNbznmlt19MIVmZXoynLHM+9IL3NCeN1A+WbIk2F86ZA31/5ln7+xuadbMaQEBkgrvRUrqsGQHTzzQXo8xHOP6Y3JHgCFbZJCXFUuhNUvgeMojYcDD7G3sTn5MmV7dIwCyonY2hMMpErvh7L30Ml9wIMgaj6k1ts0luM3RKSwx0EcyD131gyus/O6rpSuZEolq2kLLaTuehtkY7PH+aDxdDmcKPWDYHHhYRIhiQJ61BuGDPIay0izAMl0lgKnTjNphA+TKg9M4PHHgzGisOZEetX3Ud1S4YAjSdh/QWo0wPTCEPKWlRPRhs/JXAqTmNTJA8jPLXIYKH8prkExzMD8ysNG42F28Fn4ykN074Z/zLbp10Rm+MQ5jZQ28qrpozALpufiCp9aSIKlgFzBHjCloDckuJxBTeJGl5DCMUyXj65ZsbtsbB56W0taIab27W2tUS49RuU0lo+rwiGoRj9GT1qWWVSOBZxBBmcD1cJpmx0Sl+Sz6mnevBVXRSx58efeYIU6+d3oYm2FUqOCdLFv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUlCU0pSYTJQdUF1RE5kb09kT2Zja3VONDNBMWJyL002TlNWUEQxSEZsdHBm?=
 =?utf-8?B?eVlmUUV5NE1nVlR3czEzMWh2OXBqSzJKV0R0UUFwY3pqblFSNXJOaVVpQm9D?=
 =?utf-8?B?YlFQQVNHR3BuR0h3VUZwVlA3VExETWU2U3RWdXNMQTVDck40NUdWQmhtSUN3?=
 =?utf-8?B?SVRPeXRoTWhEcktKUVJXNkU1eGRieGd4eVZxN0I1MEUvQ3BtQ2RhRHFKWSt2?=
 =?utf-8?B?MUpPLzdaREFvd3BJS3ZBSHFnSnZneHgxVWJyOVNmNFZFSllpOEVkK2VPQ3Ar?=
 =?utf-8?B?cVJ4eGYrUXVpUDl2VG5Pbng3RDd2ZVEzUEJ0QlVDOVllVitOMzR6c2hnejF6?=
 =?utf-8?B?YTRoRDlLSk5WNnVnTDc5NEpkK1N4Umg3WUlydVZ6ZWZlOCtLMUVOVWdackll?=
 =?utf-8?B?YitieXk5cU1nQm1veEV1MXJKMU9GcE91MVRkb0tDSGlOS0Nrd0RHSjlnbXA2?=
 =?utf-8?B?MmFqN0VUQ3ZKaDBnbytpbnhJazczbEY1OXZESmQ2ckJYNTIxM2I2UWJ2LzJw?=
 =?utf-8?B?eDcyTWloTmtNQ0VETjRtV1dhQkw5ZGhua2VoaHFhdlB4SWEvblgxVWFGamFw?=
 =?utf-8?B?ZkZTaUNWbjZTS1JldzJMY2l3ME1UbUhVNDVkMHErNXFhaXUyTDZLa2JRTFRR?=
 =?utf-8?B?OUNVNTZNY1hHUlltNlRUSzdwM21wa1RmQTBqcGVOR1JQK2ZoSXhqODVEcmRL?=
 =?utf-8?B?cE9aRkpLN2dReHpkZGtidjV1UU5yZEduNWVxYndLTnJTdloxNWVtOG12Y1pW?=
 =?utf-8?B?WmQyVWtkSHdWNGhWRi9QQjBSN2xLVW5FcjdWSXpTZjZHNnliZEo1NzVZMjFa?=
 =?utf-8?B?ZGlpVlpEb1JkMUJhTm1WK3BPNHZXT0xIdVN1TFZwZkk4RG1LWVBsUW50OHM1?=
 =?utf-8?B?L2dWVnkzYncvOUZGT0xDSEhCSnp0VlcvMzBGOCtVblFhQXYxK3ROZEFyckU4?=
 =?utf-8?B?aHptZDFZVWF0dnlaQVRIa2haVFhoK3R6dmo2VkNML1FEc2xKUkttazJSN2Fs?=
 =?utf-8?B?Mkp6bHZqWHduNFJ6UUltZXRQU3V0S2NiTGJ4Y3pUSHpSZWtSQTgvVGtmS3N0?=
 =?utf-8?B?YWMwdG5pYWlzbW1qT2xaeU9TZ2JGVUdKK2tBTnBJSDV2bWlTNnkxV0ZNK2JY?=
 =?utf-8?B?WGpLOGo5WGFac0hyM3VOZjNXT3VXMHl1dnd1eXNEUXQ5ME9NME10ZXQvMmRM?=
 =?utf-8?B?WTFiMDJnWStTNkI0ekdKUDBkRTZSRCt4L1hKTlNwUFRJY3hINERjcGFTTUFS?=
 =?utf-8?B?MmFRMFdHbUpxMEJKOVNESkFKVTJjY0c0M2gyN0daTzVDSlNrdEZOcGpRRFBy?=
 =?utf-8?B?L3FXYm9DUmtZMjI0TU85NWhyNlY2cjh2VitiWHpiSEhVL2VISXl6SHMzK1lR?=
 =?utf-8?B?ckR1U1lBRmZJUzEya2o1MjZyMU9GM0Nwcmt6ZG9NUXZ6VURsRFZvUjNLUlo1?=
 =?utf-8?B?cjRvNnFBOUxRdE9Pc1A1OHNEZmJ2Ni8zS2svdHpRSjlnbjV3WjJncm1ub0Rs?=
 =?utf-8?B?alJyK0s2NU9FcndSMFBTWEJ4YjZBNktVQ0N2R1JLWlVnV3RZcndIR0g1OGdq?=
 =?utf-8?B?Sk1yM2MxWEZiWEpZKyszTm8rUlZEWlk2VFZoVTVQZnVRNFloWUdMS3JuWkVh?=
 =?utf-8?B?TXRXdDMvVzJGQjgxdksvZzRtUlpOVW93VXBVNjlzMGtoYUMza1BZT0U1L01F?=
 =?utf-8?B?MWpZWnhCTS9RS0lDSW94L2hRMEd1ajkxU21BU1I2RHNVSkZsKy9GYnhHU09m?=
 =?utf-8?B?WkNteEJlZXJ3VEtuTlVWUmE1YzVzazN2bWdzUDE5QTRpbUtrY0NFSFcvcHIx?=
 =?utf-8?B?UkV0eGpqOGdGUkpIaWgvdjFFTWc1UHUrcTZWSGRBUVM5cE05elhnbDV5WERI?=
 =?utf-8?B?VjVYYzdCZnBhSG9TbFdtZ3N5amVWT2FpMjZ3Rlo0dzEzMks5VEZTRzd2cTYr?=
 =?utf-8?B?a2NOaXVHUGtWQ3JITXBUY2YvSVU3bjg1WUZpWmJKVlpQUzl0OHBwdi93a3dh?=
 =?utf-8?B?TkRGMWQzTmdJRTlnTVVBUmlqd1hMYWpLeHlNQTVxYWE0NmhIcVpKcTB5QzJt?=
 =?utf-8?B?andCWEFmMmVQc1R3d2dZN1ZUNmNEemZUcDJ2UmpFdG1EamJPcW5JVTk2dzlq?=
 =?utf-8?B?MzFHL1FWOExLelRXcUk3V1dTRGxoa2c0SFRyL0xKNTJNWGEzZ2lpNk1GQzF6?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dab230-1ea5-4b71-26b4-08dbe5120678
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:02:58.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iKV1sYsNQEz2pkBrmtHJ+bnbMbjlnPyqnHiGUPWziWZOfGMT7s7gc3TiXByomEElD1IfSjVw/Ao14SqjlkCkhabXiuPmZpfTwIhXZkKWMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 03/20] drm/xe/irq: Don't call
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

