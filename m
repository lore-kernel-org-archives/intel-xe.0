Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C6C07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCFD10E5DC;
	Wed, 29 Nov 2023 01:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9568410E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220605; x=1732756605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=54vhc0IazdIb6KPFPcNcyRftRZafTPKPZi/X+6QsvOc=;
 b=JMoQx16wA4iz6/KKCC3ER32Zdh+Tto2ZbjzKMvZbZgbupYjpg0PL3s34
 6GozSNsT/h182FD2ueZ7LV835uiUdlfeyfmUv3YJAfqmE+iDtOnuua+Hm
 vfcKNgLX5FcMX6LUFgK8rwv9Ww9kUO4fRmLTlUUxbA2jP2abbf+dSUSw9
 2HSsbZvvDHPEcRrnxRqxkQnAJzNZyPBz4txPybs2t0O08eaMgcdsVnA50
 rGg2F2PoTbrdUt8BCgMAq/7wmxzsZ9lODo9LtMi0u2QgS2QI+NU/T5YxN
 busWt4EDqZq+4H7LMP+IHTv6rkQTaMZpbETfIZd6D9LXD8noCHu1Qf23E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436524"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436524"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272466"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:44 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYNPOyd6UOY0pbdHRtDxQ3xbdFf0ehIBfP17dCLJsJaTYs9DKZ+FrtyQOY0FD7Va1/ZEbqUiE59MLK81G50M3GIlUs5S3DOH6SbvUXu2jDcLH33MFa/Fl9zd33exNDyXMmIZjBd3KENRdYi9b/n0g4pWl/2i5JaPbBbRXpvE+oilgzeACrA6PsXoYWgzpDSVFWTXMgk7Yoj6UsArpmHWw/XpZsHvsLsJHGvRS7f6frfizmpzZyGTVPqdBShBbPNySiidKCgYevItkKdi4bla/Fz6uocQ7fH2bgveaPBYfIW698zu3EtuiL6sS8p9Gd3h4RoflJ7Hzp/ijB0v+nWxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX3ZXzvKoVqhP3OVfHwEh7tDk+qu5lFzd0TFxuVGorE=;
 b=liyLsAIUiOp9jHY8XFkmdqglQadYYPSbKg58gNCVZPnVwl+nOgba5vmepUw0TOin1xPDbca7nj0+MinhtE2+E4uXuQaVX6rnWEAasHWqTh5nYvZqfl6XNIsVHROuBjzVzWB2+ogJFfHoOHnSgH9VsW1QLi+yDz1IcNBOc2GyaaCEjBKuJnx9u/P3MXhVrLx58CcuaRCBG6Aq60aCPuHqMlk4MRyaw8khJbOEKosUFL+l+PWPAHRWX0SNaYF0fhEOU32BJbZFHXnE21rmuWWBA8n6Hl4Q1hlxrVwCBk+xBgNypIABwStTlIF7l3vR3zB80YsHefIoYk41+HpYJGMRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:40 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:40 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:04 +0100
Message-ID: <20231129011624.836843-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9be1ea-1210-4b24-d140-08dbf078d764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsgOkyIFaBYkxdccD9q+iukqcqXU1vlTtRcmnrbbyXXITtB2lGdOLdxvv0xEv0QHsMKLTog2bVyIufX2NDI86cmeRRj95wGDSGumPmgZfKwmkJxPAVsSnxaOJIremm6zir/8J5jGK78UpVPlyukBM5nfzIAZUhQHJdLwGKj/Ar6YbSJVDvcVOXVdzAfmvvn7KZXuM5UfVLenSqYxyzrEmju9R5VtY+xc50PiEhn1q87ALlGb3r87BfF9ECQuZPmBetTqd8NLng5wOtWQ7xXUTq/LHsoaYNmgAfqml93umEeGn9jLHOj5PUvph+fUgityWkF8OG4N4V3mDMwXBA4G9yqCUTHs4uXUu+BmjuFbrL9j9KuJZBxQdjZNQGpCoo7Ub5KGEQnRuhWHsYWsXuhOhAm3HloKqPipqWuJlBX04C8VauLVCepe+D9UyNmO0GEXzBd6r7D02bzFkRclLGarouGofechEKIgjteaGzP2D5gHHvs8ggi6IlDVVB9ALW+XCv57MT1XkHPGJIuBGIl9QxFQr0iL2KFKDRz6/ageylQWotbDI4FcvOVpfw8LTOOlDdE42Vyw51TfcW0REelHtN57wrPY8g3rikNu3cIVi2ZzaE6vID9u8QyyxvG8BXTg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5JaHFhaDg3Y1VBMUhzQ2JtQndDOTg2UE5pQytZK2xHZHZsNTNKUE43dXFB?=
 =?utf-8?B?RVhUZTF1TzdXd3UxUDlFMmJPeS9GL1pSeU9qdGlBaThqNjNCaThoNlUrOEM5?=
 =?utf-8?B?NW9xR29USGRzZjlKMUducUtGVEN4QWFMSmJwUEkyTis0djk0bVYzRzdqVWNT?=
 =?utf-8?B?MzFVUWNWeWk0VGJuUFFjVnNVZmcwMCtoVmtSSVBRL3lPQlZKOHN4ZFBhWlFH?=
 =?utf-8?B?OTRLZjRIYXZMb0tJaWo0Z2taNlJxc1NFVGFKN25sVjVxaVVGNXZLdVJWZmlu?=
 =?utf-8?B?TmhmV3pEN3BDRzFxWFRBQkhEdm90TU5LWjduNWVYcHdCU2ZaRythd1R1ay84?=
 =?utf-8?B?TkJHdW9JdWhRUXcwRlRPNlBabUYyVkxyVXYrVzdaYXFza2ZYbHdMZmNzdElx?=
 =?utf-8?B?R2lPMXhOakNPSmlpOHdZZnBUMzhpVWhHaWgxL1pkcE5JRzAzenRubllGNlBk?=
 =?utf-8?B?VFFWa3M3WHVCV2thZzZvcEh4Zk54SExGTWhqTUdsa2lpb3hDTVJXOHBTR3RD?=
 =?utf-8?B?SndRek9TQkFKZWFmTXROUHVYUTlqUDZ3QUpSaWtBSlRuNmJ2RzFuL1lRYlpx?=
 =?utf-8?B?ZHR6anR6Ym5MdWtCbGZqd1czcFFmZW1HM01QNjJ3bENzV0tvYkpKY0RNdUJw?=
 =?utf-8?B?aytMYUY5NytPNENBSkE1MFlSK1EwanVLWTJzcUlqam41SGxITUxXS1A1L3Zm?=
 =?utf-8?B?M2I2a0c2SytxTHo5TlVBWnpRdTRpZi9jVFBxZitVQksrM2Z6K1c1a1VwL2pF?=
 =?utf-8?B?LzVXMHAyS0VQWVdTdUl6TUVGYUZpOXRGdy85cTkvU0ZlSm1CYUlhK3lSME04?=
 =?utf-8?B?ZUNrUFNEdE9RcWpIZ0lWeUNyeVNkcktxOXdPQ3l2MnU4S1VjZWgyK2x3QWFX?=
 =?utf-8?B?YzNZcnZOTmpmcmFsSXlLSDdjc1RKNUNJeGpRR0swdXZLQmRaWXJmYzhjWTRH?=
 =?utf-8?B?ZHNrZ0hlK2h2ZFhuTlFhcFA1TXFDNU5QSDBBMmxiYWJSK1lEMXZ1NVEvTGVq?=
 =?utf-8?B?Qm50SDlEUmxveDh6dDNKbUtHc3R4bXhSUEdTTTdVaFFETy9RMFNtcnlRbXMw?=
 =?utf-8?B?aXBiZE5pNUhkQmdNb3hEdVlpcnhWUVo0cXphWkxncUdmSFlJVjRXSUlDMmFD?=
 =?utf-8?B?bHlmTXBJaGowYlVkZzlKTG1KODFyakl6Q3Z1YU05Vnp0SnJuakJtbFRVUTln?=
 =?utf-8?B?TVVvN0Z5UXdGWnY3SHd2bTJDaUFsVGpGYzkveVJXTzQ5anJpOW52QXkxWVRB?=
 =?utf-8?B?b000Yk5rdXBSbUJhbkdjMmRPS3lIcTQvbmRYSGlPWDlINW9yRGdIMFNWUUV2?=
 =?utf-8?B?Ukl4TUd6dVRDWFRtekQ2ak84NnNBeWVBR3ZEdHlTS0Ezc1ZkbkdIKzVMbm0r?=
 =?utf-8?B?anlWbTJyV3ZVR3NBNTk5ZEZwdnBxYmNYWEZadUdvci9MaU1pL25sTmJzdFFI?=
 =?utf-8?B?RExxaTNMdmE4bHNuTHpyaVJHNldYL3dEMDRyUUJrTW5pZ2VEVHlQSkUyU2hW?=
 =?utf-8?B?SHV5SHgxeUNIcWlkU0J5SytVNGVnTS9FM3dCWTBJWS9JL0RyMk0xdzQ0MGo4?=
 =?utf-8?B?dy9GcGxuZGJnV09aQVgvUVRLVWFvNFhhUmlyWWs4bFAxbjJJM2JqalFtNE5z?=
 =?utf-8?B?dUFLUWcraTNjTG5MSHVUNGo0Tmt1SUhJQkNLZUMzZ29kQTZFRVhCR3RvaWY0?=
 =?utf-8?B?aEpEMEdyaWNBY1lqckRoYjNKOWg1endnT3AxRVRYK2N1aTMwbXN3dEZ6bUQ3?=
 =?utf-8?B?ZmMwSVBBMXhUK002UDg0bFBKQ25xdzUwNjlzOWxGcVU4ZFpKcWNoOElFaFVl?=
 =?utf-8?B?cTlGRHFYWEZyNjhLZHNyYUZmVXlNRGhoTXpnNWZPT2hGamlrREh1NUxLbWhv?=
 =?utf-8?B?SEhBaVdvOW1YZFVwcW1SYnVXWDVnWW5HeUl6RXI3d09XaEI3a3Q1V1dRVEJa?=
 =?utf-8?B?SFNWZVBDWUFxdVV2ei9FaTl5c3lyZWZ2VmVyK0ZFZnpwRkFNbHVCODBHUHNG?=
 =?utf-8?B?TkhnRER0WTIrbktFdXFWRmJpN2xpaWQvaC9qU0VJcE13YWptQ2MwTXlLcllx?=
 =?utf-8?B?NUhZdFlwSUFMUHBpa01ZR3cvK2ZGWExuK1YyWlRsRFNlVVd5MjUvZ3o0R2hk?=
 =?utf-8?B?Ri9uWTlYWUdqU0Q5U3E4RXN0czg2ZTMzMVlQNFd4Wnc2aVpkaVFVVm1wZS9m?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9be1ea-1210-4b24-d140-08dbf078d764
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:40.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z26Y+FOt5KA8GX3DS5MeAU7w4hmjNGqkxIutll8qOMN8ue9cIJkQyY03sXilHwfhJ3uruOSGe1JsvEU9sFjdybw4b79CAW9t6YHKJOJT5wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 02/22] drm/xe: Use managed pci_enable_device
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

Xe uses devres for most of its driver-lifetime resources, use it for pci
device as well.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v2 -> v3:
- Mark xe_pci_clear_master as static to fix W=1 build warning (CI)
v3 -> v4:
- Drop explicit call to pci_clear_master (Matt Roper)

 drivers/gpu/drm/xe/xe_pci.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index db2a58747e25e..cc5dfccfb8c08 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -693,25 +693,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	pci_set_drvdata(pdev, xe);
+
 	xe_pm_assert_unbounded_bridge(xe);
 	subplatform_desc = find_subplatform(xe, desc);
 
-	pci_set_drvdata(pdev, xe);
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-
 	pci_set_master(pdev);
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_display_probe(xe);
 
@@ -742,16 +743,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = xe_device_probe(xe);
 	if (err)
-		goto err_pci_disable;
+		return err;
 
 	xe_pm_init(xe);
 
 	return 0;
-
-err_pci_disable:
-	pci_disable_device(pdev);
-
-	return err;
 }
 
 static void xe_pci_shutdown(struct pci_dev *pdev)
-- 
2.43.0

