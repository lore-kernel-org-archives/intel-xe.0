Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E6BC0018C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AAB10E367;
	Wed,  8 Nov 2023 00:34:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8DD10E367
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403678; x=1730939678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dItSu+cPGhyWgoWDzZ6RrK9PZIjDJpfhbx032uPNppY=;
 b=EvUifvsvjjkdnB9vLuVazfbCJCh6k7lpRnEwbWAD/3+ICr+64pW9rZGC
 Ua3V0hiQLzE2w3YU1qmhAqQd7UzSIZrj5/Y3v2Kt34JACwomuq/FdjkZw
 0cINbdF9SFblgEWcqJImceJ0Fhd8jW0V5xXKWNhh11IhfJqU9Et7F4hOw
 XQTk5r6IcpK25gu5SFrORrEOH53l1saJxzqinVfLljOtZpd3S7hxczQZ/
 uNeCd6LwTCFlrvAonaGO4LSBYOKIfQANO1/FVdx8riRHWO7d1auH/B9aP
 XcwHcnEX6FPMCAo41dtw4+q9eEw3RPqF2N2MjzoxkxRVSfiCNKmvYQBCw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886146"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880018966"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880018966"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuC9YG9TJOP3VhRhjHOvgDXnYNedWp05Iwwm0LN4G3fGckI7xgTXWSFCsQKNiF653T8lJddLvdaezAtK6uBP4rz/zsdOpTtYYk6JDzO3BfxNBgDHA838XSKQFk7mlMrdpx5yWbbaY91+qitEBOzMDb1QpDPI9y+delIDFToOLrxPBRvrI2GtEiKeawMR1NUsilXPhNlyycYstwt6cXb1NbikU3P8siqcxNNChkxotPfu9gI5gReqPgvXW0XfHxDNoz7xrZqk9AWQNVub8Dcof8d+oQAx7wYIDEDU8SRGWdKq3fS4gHjYHxwImeomHzAKeUv3a2aRakYd2Y1fkZlzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiQ7/XVGTWGFdq8wMuESrb/D/9Pm7GcOKMk/T/i/Rjc=;
 b=FOjVibJ8Z7wPeoX8bNj+wSSqs8Qd0LdxW8EkvxE87K92RMuIL8Vp0nmI0uPQeB0Kk/QGxLkBcnYKXwOBENWyW+maSnrh3yot98Pp2x05RVxBa9zjfu2YpRTpg1Z/SKdhUHF7fInbnjj9O/2HDYzgYSvAzFKxNJvM16mq2XPoG26aj0tVboJfdS3xv8D8X8r3JhSrRV2rqVHU1XyHCY5mYeGFULKpksfPNYg9tN/SiLixbiPp2tn7JkTTZMT2MBnvrQ/G6yvjxkJVL7Z4bzeUgdPqF+DJvMRUD5HJrAncMa6RRdCNalstJCNzoZFO01NKFdSq75tuFHam1p5slqGzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:36 +0100
Message-ID: <20231108003344.1169016-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff89078-e52a-481e-84b7-08dbdff275b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WGuTZIaIRkNkZK/7HnOYaWbI3qfJnqmSCT7gm3Bsct/dbb6/DXn9gdx8qkNZLIAqMzhIjSw9nRhGchSKoSND93dH7dFou688lBQVwd+I8th+mQvX8y6XDFWi/djoD6+n2VhkfQLapUJ3EjtSfKWFZn46URzJ95NQ1zsMqaq67WVlRvMZmHXi2Io4yF3Lyh6FkLux0KocRd2ShQfguXblFudlrNc12e47HA7+VXvLhhh8Dqh9MRL68pTX3Sq66t1Q5FeUaECKAq6TPhouFhSSUGCfz3+bynMy5FBq3OP2GerVEkTxdn0Q5IbRgBCeuDuu28UN3+XLgUQezKC12f2a5zKvqFeCg5yE/BUVCw67pkPAhadRx03+OTT4a67VeojBfR1UrG7PHIffJt2hBYGKaLjIbRmVMgWULnJJxNEWdetAAxYECW7eo3MF3LfJOYoQxwrxp2HIiLKa7F4bof84/cqcuhZ1JWdLOOw4//hamlZNVCRlpRPZiZtH5PYaMlcV4bt3CzsQbrvg7AWbViJfU6zsXNA19GjRlEsNq1KSlFSR0ERbuLEIe31gWib8yAYK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFEyRzVuaVV2ejk1dXgrbldCNFpWZ2QzQ3RVY0twalh3T0x6RFNyaVdza2ll?=
 =?utf-8?B?UE1KdHZNSUtwdGNkMWZiT0E0enlxcDJxN29hMGNkZFNXMG5XTVIwVzR2bWti?=
 =?utf-8?B?dW1MQU1rTHQvZjc2Z2l0TnRoK1hORVh5VTk2L2hCOFo5SjZTRmtpSUlCcnF2?=
 =?utf-8?B?bVp5VVJsQ3B0ZHpFK3oxbUcyelJIUlMzQ2RuaGdpdmZSZ1drOEtHOW9sSVZq?=
 =?utf-8?B?cndIc0h0ZkI4WGlhdWdSRG9hM1MvT0oxa3lGenY2Tk5qMy9IeUhkeWo4Sm5V?=
 =?utf-8?B?TTM2Q3hvVm9JVk5ENWtSVnhtc3RYSUk4RE51R0xmV3BiZFp5ZitLTUlWRWZs?=
 =?utf-8?B?RWtQaEZ0MXFkZ0NpcEVjRk96WFg1MXRmS2l1MTNGQlh6dWx0bVFFWm04elpv?=
 =?utf-8?B?Nnc5RE84RzZTMUhzREpGMXkvWUs4cERpR1M4MUw3dUc4MDh0UnRrWEhyTTE1?=
 =?utf-8?B?WEJEUVY4ejZvbmZTVU1MQ2dRcUtCNWNhM0Y0YnZYQUpsajdjZ212Y2pRTkIz?=
 =?utf-8?B?OWVydHdzQTJmRHNrdU9NWklnQWM3QXNtR0ZBUXN1RjNMdUxNdkQ0MmZDVnV0?=
 =?utf-8?B?TVcxTzBGQ0w4WkxiQktlUHhDdlZqVm5KOGJtc21lRkRLajhzQjZuaTVoTVdi?=
 =?utf-8?B?d0tIUm1HTVN4eXQ3V0NxN3dJSzlTb0h0MFVVa2xWSjZJM0NzdlJiS3B3Njly?=
 =?utf-8?B?d0pzRlNxckxQWStvRVNWN3ZGeFF4NlZGMGk5THNGTm9wZDhRaFJzTFNNZmpS?=
 =?utf-8?B?dmVFNE5oajNla1c2YVhIMDMybVlXcHdOeUFiSUhRanhNMmdPY3RWSVA1Z2dy?=
 =?utf-8?B?ZE83cVVYRk5Lay8wL2lsRjQ0SVB1eDRKZEpaR0ExVE91S3d2Um55MTlxZit3?=
 =?utf-8?B?eW16c2FkdHozTFAwVHpJZFVjZHJnajQvVjQwMDlhZVErQlhKdmpjWWVRTkc5?=
 =?utf-8?B?Z21hY1dsd04yYTh5UXBlRjNyL3cyQ3RYazcyT3lXbmV0Qi9oeC9VcWJNQm9I?=
 =?utf-8?B?WUl2N2dONXVQUlQwenV4RWtpcEphajNzWlB2Rnlvd1cvSlp4T203SStIUTd4?=
 =?utf-8?B?VGM3N1RUZEZTSnhiS2hrYkF2R0hkTGRWR01sWlM5dnQxMWpXRXl0R3JkWGFl?=
 =?utf-8?B?OWRNcHdMT1h6U2s1V3JDRTZQNkVWR1ZyTW40SjNIRkd3NEg2TWFqUGVOc1Ex?=
 =?utf-8?B?OGpHMm5QaVpLZTUyd3V2OWVVL25iRzloL3AwUlNDck8wY1lwVU1Td1QvblNX?=
 =?utf-8?B?QVloVWdlT25zY3AzL0ZzRFBmS2MwQVJwdGRDQmhXQUxjRkdvaWlxb3RzYkdJ?=
 =?utf-8?B?SDFIQXpVUmdxWlRhNzU2R1AvdEE5QXVLSy9OZ3orM2M4bExaUEJkNWtiRFlv?=
 =?utf-8?B?UFZSazBUZVBrUmlyOXNGWlJlVjNXY3BZR1dKVzVNbVhkYVlRSm96OFlhaE1E?=
 =?utf-8?B?UVZLbUhacHZXVHpoUnJOMWxBd2pybkNvTzFCYW5VdTJvYlNrVyt2cnNOMEdy?=
 =?utf-8?B?MWtZWDBoUW9VM1JJWkZqVWQvb0hURU1HMFFSRUY3MHdRRTJpWkl2VkZSMG5K?=
 =?utf-8?B?NHBjVUNRUWJwOVlOUzZkL29OV3V2YVorUXNJbndNZDZWejlUYlFrMGo5T0FU?=
 =?utf-8?B?NHBUaEtSZnR5cVZiUFJ3TlZHQjZLNDdyOFZwNDNXcUx6ZFB4ZjBFQTZKV3No?=
 =?utf-8?B?YWtZUXlqRTZUbjBFQStpNjRQcWhUMkYwWEJsR240NmRseEI2WW9TbmJQT3VP?=
 =?utf-8?B?TVB0d3B1YTBONWw2T3Nlb00yNlVVV1hpV2ZoNGlEZm5ZSmVRRU9rN0JGTlFw?=
 =?utf-8?B?VjhNT3JRY2VZc2swOUI5OXBCUk9FQnlaOXdGdzdqNjg4WUJBMXlsang3VXdl?=
 =?utf-8?B?RFhjKzZzY2hUUENETmtNY2g4MnYxakxvakxZT2ZKWnlMMzRBQW9rWXFkZnJB?=
 =?utf-8?B?SzFRSFRtclQ1YzQ4NFhsZjU4Y2xxQ1o4WHVLeEVQUEl5RFpuQ2pKZjg1Y1kx?=
 =?utf-8?B?RzlJZ3M1TVZRaUJ0TG5GK01BNG1CK1dwTnBpM0MrQ3IvK0RiZTVtWFVNYlhq?=
 =?utf-8?B?aFVBT24xOWJvZHpCTFhWQzgrMWtLdWdDV1l1TmFHcE9nTGJCTkxHY1kxc2Ev?=
 =?utf-8?B?cmhsQS9HMnAzdDhWd3VJaThrT0lDY2g1aUFxM2tDeWJEV2YvREppWkF4RW5P?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff89078-e52a-481e-84b7-08dbdff275b1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:25.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SoMfJpFkIVb1wwIpOUcHUYvrMLxKAKj42Nx5RL+6k/QmOZTaKpMOb9QV4WbG0bC4B1So4x7QC3A+ZaVDQNhRSsZKjjqPyJGKwPvhqpMwHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 04/12] drm/xe/irq: Don't call pci_free_irq_vectors
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
index 21d5273d7e611..f6792917f643a 100644
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
2.42.0

