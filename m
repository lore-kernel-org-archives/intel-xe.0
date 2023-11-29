Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D8CC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA40910E69C;
	Wed, 29 Nov 2023 22:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4510E6A2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297365; x=1732833365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=e+Ja7agJ9R10Ky5IxWBZhaLkrvnEAVBBu5eU8klQ3/o=;
 b=l59/OE74ZVbog3Sa174lMvUeASwRspqdkSMCfVs3dw6OlLCff/zS+II1
 3IvVYJ73LocDUnF38n9SYahHHqByeFu4yqdaDzxdyfM8TJAcK5+jzl+F8
 aHbTfZl2TjOFoK3W+KhweBuwv/luDhW/WBHZn2jPdL7367NLxr007F3t4
 7/kfLFWkilcnxGvkDTzUgYJr502VUf9Tj1jxbH1OegmlbcSzMxwxE0dQg
 pnHItcSHSeknJH/OglpUiYE0jZ7wZ5rd1THp1eD7T22ykcVs/CaMt/TyZ
 tAZeOBor1aR/v19gi2DljQfAaXoAuqt/oqLdYbpSXy8SWID7UXyc8ujKE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420139"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420139"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891969"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891969"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIbh+4+/zK76Umw3jhnpgJLJZpNGLQzu2vbc/kPra7mbMx+0TTsklnL2f7ojqhNzAUWr98XUov6qm8XfuiVxjW8IxGJ6V4AwS9InxdSHdvPGmY0BG6lhEtpF5uaTy8O+ZrezwMvOc2w6qPGiQ+oYxIq7vOCACvCqpS6C4sczkyz7Ee/Xs4mwKLab2k3+BbbcvQMDyb0Ey0P1tXqfIBvmIxCLUdBHCvmrbLO1MT9frpKIxu0EuWc1BfeWTtb0qhssUD4JkGUBj5bCpoXhok35/gdlvCBhBqk8WbjU9ontagoVvIgfkbBMUK0XjmWD3FTmmVabIvWfo3pu2Iapm46ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6DHBv6fsJGrcTMW3XyfSrwB56qXWA8zhhrMbCbXacA=;
 b=Oi7UgTMiQJIItFhRMddzQL7hx7eDB47IhGXGhV6Siqg+oGvIkIAfiljYgME2Q8J5ucpgNy+7GgKjFGZ7VYJKIzj7SdRLp+KU476NC3Chg37ftZ5CNKkkB5rimVZ0zVCoa1ktjVOPOqUWm2kueicAsGKYm/evSUF7CNdhpunWBZSKMuNN5rFfNQUeZFbrfPVs4SWNxxw8nBXuZh3W8icagAXFByWAQGGc+h/LwLKyAGJ+Wu+1vhsbxihGypgEPH0OQaOa4InSe0Z/sQe8FNTtb4qeEg17Gu4UzrL63nKQMlkATmJ0g+Tb6bqZ1Jwvt2BHPG4QyJgs3O1B5fmlEtPy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:35:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:48 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:51 +0100
Message-ID: <20231129223508.1189461-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cea4350-8254-4d46-13ac-08dbf12b88ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEEQBTIt/KruAljToCqUlZRhz6OG+gFHkifdrQEzLlYWl/KRd2mrxrphRGUbkeV7b1jnrC4wMWlA28GvJfAg2CIfS+JAkBlX1H6kLyFetytoqUgN30tFIV3y/v7oQ8H9f39455K7H2CADO7+LbMi/NF7S1qXZUGj//dqEyu6FJJVAarvJ9ceTBgrBG49XKqK9oCgxSwUmvQ3pOTQbOTNRUb2Y/yU888mExttzzhRd0+E2sLaiSpPPKg3iZxcuY5sqe0CpZyEuZPaSSI61yLrpHwXPOtA4ZOUYj9rweG+92Tj9tdQmRbeJJoxIxpata66UlYfgtnEGqBxuG78bz4N6OEaMkH3TECAp4xN6+1UXg7SzAST62CVaLazBCnz5hHMD88xziGkdTsE7G0AavBgJ/C02KZZMjTKslmptKbCjYXSoCUsAZ5013sEmY0ixDNkDeGoQL8HVJA3MMfmtOBbFVYSWC0kXbPp6RuxN4i8cnvogbAsskl81pqxhepKOceHLrlJANUNOIxIXTmllbtq/GzGbfpB/k8Tn1CwhbQy61rj4PQ2Bk89kbaFnaHEpZYUzL2765JyhFVAJgfa+DtKIMSztaMpHDDJtF0itiStY02eX/iUQTS4g4J5PE1QdYG2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(66899024)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THM4ckkzdEorbFp1UVVWOEs0UVZhejBOTHNhYzlxeXZDZVpKTWEwTDVaMS9u?=
 =?utf-8?B?YlJpL2hENzIrbkk1cG54Q21NOWhEUTNQUXN4QXFlL0NjOGwxWlJGMTN1a2Zv?=
 =?utf-8?B?UXBnOUxOc2F4aURmRXd1YjJXQTNKTUExWmcvN1Y0ampyYk9GOFB1dEZCNHcr?=
 =?utf-8?B?b3lTQTFUOGNBWGVqTGpTNFRESy9SeE5BTUJlVlQ1aldkVHl2VGhWOEJlcDlO?=
 =?utf-8?B?b2F5RUpmTCtwYlozQjlXODdzeGNDTElxYTRjakdhUkZzdk5SdHoyWmQwZWUx?=
 =?utf-8?B?N011d01ZVHU3L1V1ZXRpbVgxOTUvMlp2eExYdnY2by9IajJkaHArd2lLTkFn?=
 =?utf-8?B?RnRiWUVEY2wvRElIUUhJNFZlYi9JRVozM0ZBMXIzd1AzaW5jSTFyeEFhU290?=
 =?utf-8?B?K09zS0JOZlJkelF4U09rNzQ3TTlGOWJhd3BqWiswdkpyWERsZ0ZOdGMrZHFl?=
 =?utf-8?B?NmE5cmxxNS9tZjcvWWQzN2I3cDR0NkQ5UU5uZHphWEhkSk9NMURRZi9JT2NG?=
 =?utf-8?B?cGQ1ekZZd3lpZm9BRUhVSCtSRCt2TllLcytlb1JXQmZWcDY3R2Iva2V3d2ZB?=
 =?utf-8?B?NWVEdVlGeHIvYlRqVkxia0wwS25RZHRQbTJZL0FOK2t4OWxZSzlKUG9Td0E2?=
 =?utf-8?B?TTg2aWJBMnlxSGRvcmFPTnYzeUU4aEdacXVmWGN5ZSsxUGNKNGYxMzNLeGNF?=
 =?utf-8?B?Nk9JWjBqeFJlbHh5cU5qZkVWMkk5WVZUcHpsdUliNXBkR1FpMzIrbEJ3SWly?=
 =?utf-8?B?MkZEUlUrZGVqbzNGNlltQ25VMk5nWGUydDIrUTloVVV2UVRhR0RHbEc0cEZD?=
 =?utf-8?B?eVFUQ2w3REE1V3ByWVlYWXNITWF2cEUrZkxsTDhYcU5XSEdXYjlRc2F0SGVD?=
 =?utf-8?B?MjVJUk13UmRqYlJ5WVdFMjRDaEFMVmhTaGdrbDJrWWlCZUxQWFNrWkNOY3B1?=
 =?utf-8?B?YmUvZ0x6eUgrMjl3REx4RkVjckZNWEtrTGNTRUMwYkxvK3FXQWx0Z1M2ckJh?=
 =?utf-8?B?UUc5MFlZTWNOUkNIRnNHOHpyV2YwQlNKaktwUzZPQjVvWUlmMThTYzF5TTRV?=
 =?utf-8?B?Z3IzVmJ3cnFCaWpJUG9SREd3YVRYNS95R2pyTlBlWmtZRHVpNVpDTzVQeE5D?=
 =?utf-8?B?dGVZQWcwa3ZUNytzWUZYMHVVTXgrOWFyMFI3L25BYzNkLytTUWhMUTMrem04?=
 =?utf-8?B?WGVWc0h6bjIwVG9yYTgxeHdiZnVqNzNUTVE2VW00a1BQVW01ZGo0U04xaDlx?=
 =?utf-8?B?cy9LZWNiN0FNeFhROW1ZQ1NpbkRsR3ppa05EZjJXbUZ4eEthTFZ1NVBIVFhq?=
 =?utf-8?B?Qld2aHpoQ1pIdTZtQXB5T0VhUU43RGo1dUxlZFY3KzJVZHY2TFdZelJ4RGpC?=
 =?utf-8?B?MktXV2dzdnRNNmZoSnZPV1U4N1JoVTlweHdQbkpJVWdjdEwxSkRkSkgycHhn?=
 =?utf-8?B?aVF0akJ0cGg4K1hORHJVbUVsa2I4aWxjWU56b1dRbkd1WmZUSk1hQ3ljbFFL?=
 =?utf-8?B?MkxOODZhVmpVWWVNWGRJbzRjb0hLNHJ0Y1VBQlNsYmJrbk1Pc3QwUDhiZ3BE?=
 =?utf-8?B?eG4rcStGWVF3bHdPV0FoelN3NzBDSU1NYWl6UmFxcVZGNHVVNDFQRFVoVHha?=
 =?utf-8?B?THduT2NPMG1laGFlVVI3U1l3TFhjWS8yNUVSdWxheXNNMFdCM3BuWjdQRktK?=
 =?utf-8?B?Z2VuSFI0Sy95NGpNR0owV2FYRnhkWGtHNFNMMUxVdkpxbnJWSHBRczFaU3Jm?=
 =?utf-8?B?QXBIbkJHWXg4RHRYSk5CUFZjQmVJTVVobmxYQ1BWZkpwWWlxR3lISUoxa3pR?=
 =?utf-8?B?RjhvMkNZTG8zK1h4d0xXcWd4emdadHFtTjcxLzZnc1hBbjYwSjFjNVNGL2Zz?=
 =?utf-8?B?dEVNYi9vWWJwM0VzYU50RHRCd3pGN0trZ2Z0YjZoV1kyNVJRSmRuQUZHLzBo?=
 =?utf-8?B?anE3cml3QUg5MHNDWFdKN3lVU3hvSmJTcmVPRksrWFdaMVVlaS95c2U0R3pX?=
 =?utf-8?B?VERnVGI3MFpOT1BNNXF2V3pKYmhOY05WTG80Zis3OCtEbWovdUtJeDNPbm9N?=
 =?utf-8?B?QzNSaGVUa3N5bE9CczZZNmREQXZ4YVpnTWR1NE9UU054L2pzWEl5azMyNm1G?=
 =?utf-8?B?M2xiRWpvZ3d1WW52ZWFvcGxXQkEwOTZ4RWhkRlF4aUpZNXBKNHIwaEpYMlJK?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea4350-8254-4d46-13ac-08dbf12b88ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:48.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22O2tA6zOWmnFsagzFL5HtS9IkQd1vYKGILrduHdyQUsWCjkzKUh07h297r2hvafLxBh4UlrZizT2Cl5EScno0gSlnwn3TQuybFikWANNuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 06/23] drm/xe: Split xe_info_init
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

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier during
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_pci.c       | 44 ++++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 306ff8cb35cb1..f2cdc9bb4612a 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
+	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 074ed456eba6d..e5f1fefcee120 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -535,6 +535,35 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+/*
+ * Initialize device info content that only depends on static driver_data passed to the driver at
+ * probe time from PCI ID table.
+ */
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.has_sriov = desc->has_sriov;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  xe_modparam.enable_display &&
+				  desc->has_display;
+}
+
+/*
+ * Initialize device info content that does require knowledge about graphics / media IP version.
+ * Make sure that GT / tile structures allocated by the driver match the data present in device
+ * info.
+ */
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			const struct xe_subplatform_desc *subplatform_desc)
@@ -546,10 +575,6 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
@@ -575,14 +600,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.has_sriov = desc->has_sriov;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -595,9 +614,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  xe_modparam.enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -710,6 +726,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
-- 
2.43.0

