Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F96C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EDC10E5E1;
	Wed, 29 Nov 2023 01:17:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E95210E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220657; x=1732756657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=diSzggsSiPQOzEFyhqxeL2FWtjOvBXVDrDWsfBArQAg=;
 b=cxLf0OILRJBDVQPidfkHng95Jf2WGjy94Z7jCqBzPR5j0Grd0qoeYOhM
 wskCKWdGcut646YzHCgzuArQYnI5ChjauSlOqxXISsT0BjDilUS+WXAtr
 sya2kT63kcv0fPmeUOqCKk2QZqqgr7ODgDBMP3WwxGlEClfFSzbYLPQpV
 50bi/CDqy72Evhql1xqC6iecZHPlRfApPMMFeweiU/s4uagRy3R7pYesN
 iboWg2udMTSjcT4iUk0doL84gjARhOawDjrY1cUOgKnmHSZk9BrdbXMVX
 Tz/lFFVwnG0pNm/2gy2bnQ/gfpIdqVGTAw1AQnHPYt4ifYfgQUwq2owEK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479264081"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="479264081"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772504411"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="772504411"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:32 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaipACuldkSmKLXStJi7Xi/w27YEnZVmNmu+g28J5GJo95CdGTMoxnIvCGxhSB3QQ8B0PzsM9zRKFCUvbcYx0rcmZn0UAnxms011zUjU+dRGvS7YnjI2OCYUW4XRsdhSdzozKmfDp8NU2QJGGvAy4A8/hIcbIuY0hhXJ1llbEfENVTuoznsQQnb2I9eIYFhX4stgcJxKPE3b3ByqCGdJV0RSHH4P2zbGtrqRrQps1vkKXiEnZf0qwKHBOXsfYE1tSYZEBbGaWLFxnr6Y7qbJRP3SS3FnWf3vlE2oFKY1GKuLeliqBi5Uu9iLHo09DbR3Pxl3y+tCVBfJQxPyVoyRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/NNp5FnGN0gtyU/l0aATdIbsEk6Oq848S5/Uh4LFng=;
 b=ao1yDwQi6O4VEitvTDQTLq2N+VEecpANiQ6qhvJo+Nmq1FuO391UTLZDAarLbDoQEI7/jDYKNy8Fk4YrVKj09NI2/62Oa1MexMquHkBsDIcfh3vvc7NL7OD08QDL0+NOf+QPo4iUyQ8D5PJrPVDcMAGt7Ee47FCnwYXg2btSO1zcHfT3iS0oCw+GcIqzAUKykX0Bko74YKbl/wFIXl9gauNiPc/b1zr7nTQqGN7f7mg39gyPNfDkFqxh0Y97BgBzbLgpKIlsIMM6PokDj9ZJHlke87inHCGcIvx8bkSal+4af2u0R7uxB4g60wtEgbiONLv9vhuXArexkoD6ytHJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:18 +0100
Message-ID: <20231129011624.836843-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0027.eurprd09.prod.outlook.com
 (2603:10a6:802:1::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f32977-5e22-4b32-5a4c-08dbf078f4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tfqQx1pQ2/b0416O/e0pnG9qpMWJfVtUPll6t1aT6VYWRdEBeKe16sCBBM+1s5EVsXNgUkso96qTZ0ZoWRKhZAD5LptWEBvjNbAluafspWWh9Q63fvMseih7JoQ3SGj/iE0MCaR2uk9v/i5cqWIXQ112ve1Qwcdw3G/Y8KSYDR6Aj9CLKOT/bv6CK9eWshQn73tREqZ4ljKWxBcoZtxl62ljavgyegcM8IXpxR6YVxCkLk/CPEaNjQ+VuO9v/gJvUuyP+uq7dnx/vQ+7wp/PUlXyOy6G+ePx/FKze9pv7FH0gAYpSguruDbxLyyw93bhIaNRwi8lOn0H5ja2JrjrVsSPpm0O7288zTlJeDZpx/u7nhrI/O13JZaC0PuzPKf0coYcYdiO1zU1obzkcBTBr3CLz+x1w3jAdDVoxcixRYE7GeH0jUAO8nav8rMUUzTREYWHzeaM6hVv/OWDCuHK6VqZQk2LXKu6k/cgkxH9zfn72Z7zyOSAc6Gq10tAy6jiQ6MggiovgapLd1AHnjF8peo5Wg+8pu9ZAB6HO/IwM2grm9uozinAZjer99TpbxQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTN1VkxCb3FzVWxBR0tCTFphWFZzdElBQ0VOS1V3TWsvSlEybkk3VC9kYStr?=
 =?utf-8?B?bFpIcGY1NFd3aThTWmF5RnJibGlVNUxjT1YvRmNrcDc0a1ljY3ptUlRSRTJt?=
 =?utf-8?B?NUtVOVYybHZPVXZYOEhLVW84NW10bEJZRmNVOWlqZ29IVWdyS0RzUXpJQjVM?=
 =?utf-8?B?WVlXNnRTWk0zMm9vOFllUURQVnNlQWQ1a0ZoS2JvYU5ubXJ5YlF1VFYzU2ZU?=
 =?utf-8?B?M0t5dDVWNU9yU0ZreEtGZ2pYL3lCWlhiREdmTEpBV2dDYUZKczMwWTljcktx?=
 =?utf-8?B?cXNuKzkyeHZtS1RIR3hxZUtYV2p3K2NKN2FUY1pKeHlRWURQdWRrU3pFSUE5?=
 =?utf-8?B?b1ZGSVM1UEhDYVh0S243ZFRqRlNLRkpmc3pOb3BwbjcwQVVPZ2MxNjMzUGlS?=
 =?utf-8?B?QWIvM25BejRXb0dJNnYwLzNBMndqY0FJYVcvUlJrNVIvdkhsZTJBeDQ4MFI5?=
 =?utf-8?B?NTB2aWFHUE5ITVRWbW9FL1JpOEQ2TVFqU01Rd2sxbnhnNDJMMDdieUNXQWFn?=
 =?utf-8?B?dkIvK0Uwd1lCVTI3djdhejMvblFtNUQ4d2J4cDdIaDA3UTFJMEZpT2E0SEpN?=
 =?utf-8?B?OGdGZFZCdGEzZjVZT0t2Q1dYMkpxM1F2S3daeU04aHQ4ZXVaQnNhWmVsekpX?=
 =?utf-8?B?WWZCK0czeUtNbUZlSGtYdVhGai9QazQ1ZE1ZaW9hNGR6eTNaNzZ0TUQ5RlNu?=
 =?utf-8?B?MWVWQzJpNW95MXBJb2pTNTZWeHliMzRRNW1CbkNRNlMwbHZvcTlPOVpwR3R3?=
 =?utf-8?B?NkV1K1BucU16Q3IvVG1aZG1CaExFQWtRUHdBM2IzKzkrS0JCR2FlTFdjL3Bw?=
 =?utf-8?B?TXBkTzRVQ25MM0RUL0E2VUlOS3F1ZjNXL3l4Rkg2SVZGODhMaDNDWkJFcTIv?=
 =?utf-8?B?OWFrZzVUWnIvbmExMjFQaS9rNjFoZHBFMW9mT2xwVkRJSnBxOGpjMWlEV3Rm?=
 =?utf-8?B?dmhtcTAxU3MzTWtuQWg5aDdEWmxRVEpsWENRZms0TG1xbE5vbGV3Q09GL0N5?=
 =?utf-8?B?b2svQ080L0lWS25pZUQ2M3pNVU84MEZkWFkvY2NiY0lHSU5sc3pvWlBZcldw?=
 =?utf-8?B?LytqOGZ1UWtGakRYUlk3SzhaakVoUXRwbVBmUE10djdLWFV0SEFhNWREU0tm?=
 =?utf-8?B?bGxLYWhNOWlQVUlLQ21GUFBLQ2l1L2REOG8vMEJZdFFlc3lwOFAxUm95dEZq?=
 =?utf-8?B?Z1pZT3g4UW9oMWFSV3FyOVdFRGxLTzUrbCtZV25GbmRRVVhTT3QwREF5MFBz?=
 =?utf-8?B?L2EveWxUNTIwaDY4ZGYxcG5xekxqNmhCY0JFenZyVFVpdm93NXN5NFZ0cS9Q?=
 =?utf-8?B?Y0loK3NMSTM2MHRyV2lrZXNDQkVsbHUxSTR5MExOalhBU0xjRGhRMUhLZGVS?=
 =?utf-8?B?djcydGtMVFNreHJCRWZicnBnS29mUU9HNU5NQ3JrUjd3VDZXWTdhVktLZGNS?=
 =?utf-8?B?NWxrd1F5enN5eWJDMVFPMDNXMFZUZEpWZElZdTBIMWJ0aXBSWmRQZEZvVFRZ?=
 =?utf-8?B?RjNCcHVnRHAzSThicGFLcC85OU9YOUE4SVVZS0RFQjEvdVY1RTRPd25RRm9C?=
 =?utf-8?B?NjZUcVg4TS9SSTY3OUl5amVlYWpHb1B3b084M1JKdXVLYXdNemp6M2w0eU9W?=
 =?utf-8?B?WjlGTXQxQ1hQem5RMmc0aTVxaEZpZ2VMcW4rSzRzTVJaTnZFZjBZSjNCZzB2?=
 =?utf-8?B?bENXdzNITDBiQ1FKMStTVG1QbGtXTlluWWxlbVhaR1ppM3NQNlc1MTVyVU5B?=
 =?utf-8?B?MWpGd0NlUVUvVUlwSitVMmVGbC9jWHl0UmpQeVN3QVlnMmlqSEdYeDZENnBG?=
 =?utf-8?B?Q3lSWUFZeUpBU1pzazF4SHlOdWpVcmQ0UDlKYTZvTUVpd1RycHRiOEVFZ3Nx?=
 =?utf-8?B?TTMwbHlTQm5BUXNJbTJ2MktqY0NwZXVCNjdLZkFOS0pWc00xalhjQjFmRUxn?=
 =?utf-8?B?cWJDQ3ZRTmZtdWRrVE1KWjBnRTFyWGFNT1p3K0F0aEhiOXNyT3lTeStxQUda?=
 =?utf-8?B?NktpNGZMSXRJblk1aVNxMk1SUHRZNUZLWG8vQ0hwWi9FTGo0elp6L0IvdTFH?=
 =?utf-8?B?UklXdExrTHd0NUpYWCtIY3JjR0lSTWxQczYzemMwMHZJckdZVkNuWE91czRD?=
 =?utf-8?B?ZG9qVGlFUmRuUTIyQXVNNVJ5czJyZXkyLy9oWVVFNW9qK3l1cmVFSXk5TFMv?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f32977-5e22-4b32-5a4c-08dbf078f4f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:30.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIiZTa9ek+XlE5xxR6T47EEYTcCtJLIAcxmc/wLZpsFpT8YvRjKa8xuHDbH3jsM11Eywi75ThG+axaCjaFYIx+z/RnkHoZZVNMvQL8kQqtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 16/22] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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

The firmware loading for GuC is about to be moved, and will happen much
earlier in the probe process, when local-memory is not yet available.
While this has the potential to make the firmware loading process
slower, this is only happening during probe and full device reset.
Since both are not hot-paths - store all UC-like firmware in system
memory.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 31b4886ac43eb..606d686dc765e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -633,8 +633,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -646,7 +644,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.43.0

