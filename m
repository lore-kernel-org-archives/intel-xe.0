Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA1C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EFB10E6A1;
	Wed, 29 Nov 2023 22:36:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F4D10E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297370; x=1732833370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xCBR9MihB+DQcsl/sHyYUd+bLpwC3aBPJQaRvo3CZPc=;
 b=RPhboXWv3EsVC2/XTkQTCudkrbr4EbeELaT5b94u/HcRwarD8YGyFCDl
 apfG5tZPUIs4nD381RFYTqnQqvK5PyHK3Xi/zCEusKt0kTTS331ibqeXm
 8wGOdnyfuvZoZ0bOwk7tCscyCrZ5dnkfsWyPA4gQRgbnLlWc/irosBT3a
 U43jIvy0q2JrzDEc1cXSydtjAzywy/IDTmR/qmrCRmLV/A/+mkcxDHFe+
 /W0DpwqcIxx6UzBEYG6jJ7/aYZFYgGWp5LCZ1hEOYJ3uH77lv9Dxfn0Il
 PTqyvcxdRBBj+MFycGLlBcnubbeaYt00PcEqJIAFCFd7Ad81gQLfuq7eJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219757"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219757"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418165"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418165"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc2QIpMTnw6uatoC6GpdczW+5utjU7+HX+8RjEigyoel92AfBusC1QleK0hqSqKE8IEgCJkPKt1u8Vwe0XDQxY40Ascbm2hyPx9BS9mYD5oLjzeYirC3i35qEXwnVXFa8qNHI/qTkGjUQIStZlXT/xq5OZafqFYtEbQipuQ9RFS9w21EAWrEeZBExl1z0YlDDbjq+VCuzdxYwgnXQiYCqc837+ZcHpo9aBlU29WD1C8t99f6ap1u63XJvzp3M3+Tx85l6ALKCKTvWOMu5DCHrW+JLvn58ROFak0mIrw3QXSoaage3SZKWbLoikPluilnupdh5TeNQwMOLqHjTTBRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MImZgGQxxdSSzODEFOs2mtNLTROZpv1XHz7X1lYMpNM=;
 b=g7uXNlxK4QaM6C7bJDrZbKoz32MOKuN/wfl9R1BE2sa3EsSr1nkuXw2+SJTTJiJ9lTZo/vIMFi/t2HVeR64RM+Yz6Q1iAN78TxTGD4ynEMh3K1JThCYhuhzoDzkByCySMZs8VUOWe352eoFz94b/DZVDwDHDzYPvar2vg14y7rSe6mGRfGOVTnW1wA+9Pb4z8XPGGkgmIdx/enAGqlz+z+cvs85whavzMu+Pyb4gFvPf5fT+0P8CHGHWHKMR6GdwdcZV8tRgjNo/+RCzZJXI+kS04IjHtKFK5CqfjgYL+stcODdiJEPILHLWTjmxAz14tp29b6tL5w+fn5rshLg91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:06 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:57 +0100
Message-ID: <20231129223508.1189461-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7b2963-55c3-4687-2aa3-08dbf12b93a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDYx75oQbKEN3ORWZieoDFdDSk9mhSiewBJ7cqiTWPIZ/rGOmYVZbs/7QIQ8sPoAmTLxuxTw4zoX3BS8Lrk9cBDgOeHaR8abfhLW6/7GwYphvPfoTw4T1nQ8zb6dIo9UkzOqK45WMDb2dI6xx5uybRTfEd9M7wugXgUO1H3rU5eYanRWL4aS6YQCGKJvK3bTbJ0ADDfEBYJZ4HchpkKXzxffMePXJPYfuWil5JaEhsOlPohff9PMrFBUBQjmlSftWKO2skWujYIqa4ay+JLpKQ+FcYusxWMPN/znFMA/9e1GRlWHpcrJAEu+Nj1ksGQtXw9F9UbVHw0q2VBRQiB6rQ0cxIZATSvcShPNl7aTYcgNvVqr9nxJ+ITF4NZVMKibBhBQsYLVGluto6MQd0hjpZn+SpHXIsR8VYASxqaVxAZbvdx/DIhuaoxSExNQ/UvSPPhAUdgvB0UdBMrZ8Xr7OkI23qiRTC2aiXapWA8eAYc9NfwRBpc27hHlMt9pnnCqFbOwzil/tA9vx2OdGDwW9WnwwRL2HTsDGbk6k+bd3GF6bPlu7e/SJEXleGqb2KP3GxmfSsKZBqJWdsncbtJ5baFBSJJlhbzJLb3WSLfUeId2sKC0uCnxKrfCQj2r/Ufy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3didHE3SGdBNmV6MmpJUE84L0NtMkdIeWd2RXVkWmk2WWlMUFVTekNGU1VV?=
 =?utf-8?B?amVPbmE4Z3hvbHpkck1pOWI5NllhUkczTVJtZXpnNHVyMkN1OVF6emZjdzFi?=
 =?utf-8?B?WHRXV0EwczVwRVNuTHY0N3ZtdU4ybU5sdjljM0crYy83MTBjTkxZVlpORnpR?=
 =?utf-8?B?SHM3TmVSWEJLaktYeUlxT25URll2V0JxZy8vT3Y4OHFKb1ExaFBHUExRTm1m?=
 =?utf-8?B?ajZmNDFZdW5kLytGQ2RzZE9EYkJQTlNMTVlybXZzWFljcnhZTlVQNndneXdJ?=
 =?utf-8?B?aEdhZFh4d0R2VGhzQ01KRVZ5K0xoYnpmMkdvSkJyTEEyc3B1UmdzS1gvM2I0?=
 =?utf-8?B?TzlyWEZuaytGeWtGamphNkc4d04rTElmakZkNzd5N3ZKdTV3VmxsS3BMemtI?=
 =?utf-8?B?cm1ySWZ3R093QlFnU1BKWUJGd1k2ZXZhbXZyUHd6N3VaNXdOOEI0Tk9ySyta?=
 =?utf-8?B?bzd0K1dvTzRzNUZGL3JqbHo5cXE0OG5iSXRWRXB4WHJaNG8ycUdCK1VzT29i?=
 =?utf-8?B?NmEyRy9FU3NSdkpsaWVvMytPbFowSG40NzhzbkFiWml6eXJaWk1oNVo5YzVJ?=
 =?utf-8?B?Y0FRZXFnKzNEYzVwNFRyMlh1MGZFd2JDdE1jQVRKVGdyNkVuSEZtNWh0cmNx?=
 =?utf-8?B?LzhiTjNDaE02WlJxUzdnUFh1Z1JyWGtxZTVEVXFudDFvek8wV2h6T0pUSGNu?=
 =?utf-8?B?MHNpRTVIc0tkbFFzY0taVUZ1M0Zkbkg3TDVoWTRLbURtc2YrVmRocCtzQU1L?=
 =?utf-8?B?TUQrREl6M2lwT3FBNndVMjlDMEQ1ZWNRSEdKRndzdFpHSTdXcnFubDVlZ0lT?=
 =?utf-8?B?Z0cycXZtUElsNGlRYmxvT2hsTXVXS25xeHFRSGVCK3hBWkhYbDhaUHlvcHNY?=
 =?utf-8?B?M1ZQNFlWSTJZMW85N01aNTZSa0svM05zRi96ZkFNTUVTRnoxS3NsQVUvYlJw?=
 =?utf-8?B?dXhiY1VhdmtienQ5NHYzVEZHR3o1OWZiZEkwNUZTK2owYi9OQjQrNkxlc2d0?=
 =?utf-8?B?dDJ6ZTJnWDQrOGZRY2pURTBXaW00M2xiK0xnNmdnWG5Sc1pmeTFhRkF5Z2JB?=
 =?utf-8?B?UG9kRm9LNkxDbU9xN0JlVEZvVVpvM24zb0dzaVpSdjdjbU0yVUJCMkVLQWdN?=
 =?utf-8?B?SjA3QStFMGJzc0JKRi9SWEJCcUFWMm9LRUtNTHQ2bmFTYXN2K0syeDVRbkdI?=
 =?utf-8?B?VzB6Zm8rQU1LL1k1S1Njd2JLekR5VlJQOGVqaHlobXFTMGZIbTNoQ3VrR3dO?=
 =?utf-8?B?dllYUmpZellneTB1ZnAvODFKSVJVZ1FPZ3Bycm1CS2UvSXJjNXd6M0x0VWVY?=
 =?utf-8?B?bnBZTjVKMm8wMmdIQkRBTENWU2Q4cjc4dit2M3YvcGU4K0dvN3ZVWURBV1lJ?=
 =?utf-8?B?SW1oZFlRMGZTbFZmcW16Ymo3STdreXdJc29obXZsQlpFSW4yZzlrTGw0NW5S?=
 =?utf-8?B?akozTjJlUTRXcHdRWG5pdU41Tm1UeHU2TkFRZmZ1WEJUOFg2THVxVjQ0Y3pL?=
 =?utf-8?B?a3Zmb09vbXdBQVBHMlRicmx3YVhRcm1Ya0R1NmpYYTN1RUFEQXE1WVgvQXd4?=
 =?utf-8?B?Q2kyWXlTV1gzTDhZd1JISGlhOGFVNk91NFdEZEo0ZWhHYTArb1duUTZlZ3By?=
 =?utf-8?B?cmNpOWwxOERjbUZGTU9lMDhkZzR0blVLUGRKNWd5M25LTC9KbXE5YUlMVXhY?=
 =?utf-8?B?R0FJTW9id1dsKzlSZnk4ZUM2SDBlZkF2SUNVSXNCdFhYTHZOUzN5dUhlQVN0?=
 =?utf-8?B?UFp2QUdhRVMwNFc4ZFhOV3ZFeUJ4Umdrem5TR0hQWWpDN0pzV2ljb0huWWxP?=
 =?utf-8?B?YzdINHVrQTBFeFRGYStBSGtYSFZScUI1K3gxZG5vMjVsbW00c0pDTjlDMWRE?=
 =?utf-8?B?RGtQekkvYzdPOWMwaDVNdFRoT1BoR2tGY3ZmeHBpYlJoY0lQdmlhZnlvUXQy?=
 =?utf-8?B?NERmZ0FIWWV6Sk9oczdKUEw3cWNjZXhJSXZKRDhuOFlRbVdMUEVWM21lVnl2?=
 =?utf-8?B?elAzOXRSNkVKS29tbGE2SnRqQ2NVMFFsSmlLaWZYdzNZaEc4TlVGRkxSWG5E?=
 =?utf-8?B?K2dkSDIyR2VpbWhCQ0RSZWJIVnZOcDdxQ2lNazFxL1BSQlZTMnNIUmVPOTdl?=
 =?utf-8?B?dlNpOU9oUjVzQ2ErZ2QxTmJzSWJpc0RzOW90ZVdCU00zb1VEbm81VnlITGZn?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7b2963-55c3-4687-2aa3-08dbf12b93a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:06.8617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ip44FYpl5tCtREB0keuHnao0LNfzecyovMoOF1U+bmP+1hokX4Zj30F4cvRmW6x8ZxWpaJRcLz7sy+d35qY5OXn1SC2J3A6P9sYj615bXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 12/23] drm/xe: Move force_wake init to earlier
 point in probe
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

GuC will need to be loaded earlier during probe. And in order to load
GuC, being able to take the forcewake is going to be needed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd56a8c3f80d4..bcc10b7f23ab7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -415,6 +415,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a6fb9641cd69..4db94344bbde7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -293,8 +293,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.43.0

