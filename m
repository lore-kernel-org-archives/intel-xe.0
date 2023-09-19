Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAD4CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D446510E284;
	Tue, 19 Sep 2023 14:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E9B10E28D;
 Tue, 19 Sep 2023 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133563; x=1726669563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=38ePW+W7ZcWaHiFxziPgB9Sw9mA2lgYpcMCCYfxUnck=;
 b=dks2pqZwmKN6N1PRKjL7H45I4bp5GSKw/C9gq9A8oqWBX4N/Tx0xpP4O
 jEZlrLeyPZFhY4mD9XYtHQzVsnN5KQLJZCgeomiiwMUNaroD6wRFdIklg
 pUbNLIer4j+71qQeKDPkq5spOfmm7XcthtROYTg1IrgKbmEh6zbBYQFjQ
 xXWGNbuUglwsAzaUk1TZhZwNfxhKz6V3rFnVjQ8IKHkQWf3BJX1KsRSmA
 9qpKafSYq1URzwCLAFhzMgnm88l+juNUW5/13FR1b6FG7Ukd6MS7egVEK
 UXLEafKftHZ5KnqViYe2wvQkMqrS81trATzYd5wE7ziZ7tn68aNUk9OaR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383785810"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383785810"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319459"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319459"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDq+TppHHHiD4jc+ru7FV63sx7bBA17A2Dqjlo0Dro5KXPFMHF6SWoKuPc9RTxtDtcywQQ8fSWDYJOEY/a7T8pLtjq02v+oKdnvaYZABd2Wsz44xYkdpu+DgebMA7NkeZD4h6SfGcMD7KgbzBxFfdeW0x4dpKYYKWr5GwvmuJjPHMpwvAywCw3TLZvtSg64Qk79rqemeXAqzQSQNkzzMUzgVcpWoXZDOLRP0VQ9WR/iqHsqNtdxzmQUZtM2n3E2yz3dVjcFj+3jOhPFBN4v5ejzAggVk8d1dUmVO/jknQAPH3l2XhuzRJ0DAvydSxcKSLUC6fuCU0heMRFMW8tIHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaW0uU67o+Fty0KMNX259dk3BfpRsyaOK6mdY5dveGw=;
 b=LUELn57GoeY4IPDhppxBLxiNLfd7fSLZh7a1UNaB2F47SNJh3mG74q+JiNLOnNnUOIAb6hz1tQ1YDSD+gpiaR7p0DpGXdmt7FYcdn8kGICQXkfbm+ytDFkIvvBIMiH5UWYXXPpxAlAhpY8hzl0z6BK2QVBXEHFZA0oYoNCl93yA0I2kAwULduxpR1AE8OCpc3qsNKzsgf/Og6lSUcYufhSViMAv+FmnpESLuV++FV+JkU6ZVR/HeMQSHNU+fKxszI7OGqTN8B7WRNGuHmDJsZUSObscN5CoS77MY0HNaeQpg7hLVykjha54J6fDLOw6AnhKYoJw7o8a7v7IEwWE5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:24:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:24:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:47 -0400
Message-ID: <20230919142000.91363-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 18192a6e-6378-470c-6f5e-08dbb91c331a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0X4c+IK0sm844eJBJsI1G2i0X2GsXNyQTE4YoOBA1mmk5K7yPCZliaCJwwopMacYcIryyGyoVIyrT+zexAksJia4vqbIYM0wAkc/hTHG9e+xME5K1GNssfg2q2rQEwamC2XEyibpqc0Iy2Lcj18NULQkXwn0boLdwcwi7ptLCCMDP7QFi42v/boVJRaUiAk/zIV2X2Laf587XSKPWRUEPV7bRy+Y4EWmw0YU6hJdajjfkqZ3qOq+hxRmKj1G/fV4QULCdQoktZUCqcz8u2Smczswl/4uFjxK3QFe3Spal6y/MwkMPdODoAillHIIEFMfWoY9X250fCkY4DFDqTTlR6cedFOAdvv6n5d1XZ0AK6+zAGBeDZAi6NjPG/T0ryjBZHlih1H98+umJ9qgXsmg33NC3FigkU03pSBpFrofAaKll7g2aBsglD6Hk/Js+Zn/RlAtVTcTLGt0m17zCGzj6+2LJ+p8cYEzqR/WlVjdX2LxtWfS7nveqlFyE1oUPcZQbaZdPirTQZzhyWupFSe93f750tTrkaYHunF4yF0qjZdX6AfD0ENR+T26fs0teLgyOGEVVZuIwvo9To1J8hvHp9XlrEkGIK000fM+6YWZPJ9VfS3lBn0QHc/eqdmJcuC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(30864003)(478600001)(41300700001)(450100002)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVWRmE0S3ZlQkk2Sk14UTBRVWNVU1YyTGt6SzdHQTQyaTIvZ3FydktnelZJ?=
 =?utf-8?B?bE9Lc2pUZEI2NUlKd201N1o4YXpaUXhnWWFPazZtUHErR2RLaXFac0RKRDlq?=
 =?utf-8?B?ZDZIQUlPMFB4OVJFNUNrUUNvMHYwb3NLSW1RYktKS2RqcmhwWXJqYUlLRXV6?=
 =?utf-8?B?QUoySHVaWTh1MngwVXNjTUVaeUd0WGo2ZGxPeWFReDlkdUF2bHF4RmtVRDhQ?=
 =?utf-8?B?OVVFQzJNWEs1RGp0WHZob01lWUx4cnZoZHh0dElFclVSa01TNUd5T2RkaFZP?=
 =?utf-8?B?OFM3elJNRGRmMFd3L3hDZUt6SGlYV3J4Z3JVeE9nNGkxRlgvR0wzOXZwMkZj?=
 =?utf-8?B?OTErRGYyMmt4TWcycHBQbklWQURGb1ZMa0ZVY3JZdE5xK2lIMTE5aXBHT3Yv?=
 =?utf-8?B?WXhDS1FWZDJTam9CNS9jOG1XM1BnTzljcjU0NUorVTlCWDh0cmYvRERHUlJG?=
 =?utf-8?B?a1ArUi9IM1VYT21xemFHd2RUQ1ljVDNNb1Z0WGFlUU45RHlheEtNMlhPWmNS?=
 =?utf-8?B?VkxOdVJ6cUJXYjN0Uk5IdWo3SW9rMDRDMEFERmRuSXN2YnpNOXVJRTN3MUY1?=
 =?utf-8?B?YnZUR3hKV3R6Y0tkK0dURVZtWm9qVUxvOG5MMjYvNDVXSnJIVHFHSEZhWm4z?=
 =?utf-8?B?RVFGN1VOa3QzUFppSC9HVlFkdjRRajUvV1AyaUlnZ1VDYmdaNnBNc2s0QlRw?=
 =?utf-8?B?VDdjdkFFZ0lhN25UQnNFRklaZjYwMEI5Yi80NE1sa0IzZURVenQyaTBsalYr?=
 =?utf-8?B?UW40Ynk1UWJQTXJtVTJEUFlYS1BZSU1TeUZ0TWJDUGtGVFlPc1AvTlBoYWJs?=
 =?utf-8?B?bE80VWcrVFp0Q2RmNFhWK3dwZ1ZaQkNwTTMyRG5IUDJMMjhBRHhvV0IrMjlU?=
 =?utf-8?B?UGYzNEQyN0JtbmlobzB4dHdtbTNHY0dNL3N1L2ZrYVZOSXM2WHdqMitvUjBE?=
 =?utf-8?B?alUyamw5UVIxZkhuUjhaU1htOURmVmRFUGlBNngzempoTHB0RGVPZkRoOHVo?=
 =?utf-8?B?N0VIUXBnWGhiWjNEM0dXQmpqd005dE55a1UwZ0NiRGYvcGhTR0N1UGNzbmVC?=
 =?utf-8?B?ZGFCUitCUi94STY1alVoVDNpQWU4MmZIeVdHeVFzMFpuR2N1MG10bjJOUkw4?=
 =?utf-8?B?SkdMcUVJL3J0K1IvU0kyRXJqbmFGTHQrQXVwKy84Z0s4VVNVMGdReWlmL1JE?=
 =?utf-8?B?ZWhoZXZyYytieWwvNG0wZmhjYmVuV1BjRVMyY01PYyt1K2txKy9pREY3Y3Ry?=
 =?utf-8?B?c2JjdXdvUjZtTG85MThUZ21YSkVFbGNyVVRzWXo3TXd2WlgrTFJlaklKaHR1?=
 =?utf-8?B?MkoyS3Boc0JKMkkweFhBVWpMMkplRTZOemQ2ZHZFRVE5bys4VjF3bDN0TjBV?=
 =?utf-8?B?REtVRE9sTzcrSVMzcnVXc1JXY3NEdnY3VVlNOFh5a2ZOcFVLRFpCZmZpNGdT?=
 =?utf-8?B?dWY3c084cEt6N2k0SUJwcCtLeXNiSmJMTG1ybmFCeWNqK1lwYjBGY00xWDkv?=
 =?utf-8?B?NmRLbmJ4M1VDajVlVGFIeXFmUEVDYjVSMUg5UFpFL25tcDVsNXBLdENGd09P?=
 =?utf-8?B?bU9UNVM0dW5pYk15eTl0Z3g1Q1dSM1pSQW5qZDAxVUxkdkZkU1BFUmMwUHFu?=
 =?utf-8?B?ZGRkUUFEWExRa1dHeXl3UUw1ZzQ4RW13RjVOUlRFcTFYRFFvd3oxM3FxMk9W?=
 =?utf-8?B?cjVvMWpMK3N1bk11V25DMzB0NmJQTVI3SnhjcUZEanZDVTY5OWtHTHZjV0xv?=
 =?utf-8?B?Rml5V1NVQUltdElRdXRXbmtJVkgxTmlmRkFmaGx4dHUvT0Zsa2pPRmZqbFFF?=
 =?utf-8?B?WDQrN0dIRnRVVjNhbGZpdFdYUzN0Nlo5Q2RvYS85K0lpTWxnakdJenBvTU5W?=
 =?utf-8?B?R0NoUWl6MzhDQTU3MTBIQTVlZ01od05qS25jNVFhemVZVk9ycFRRamJVZUps?=
 =?utf-8?B?OEZnTnZNQVdaVHlmWTdlc3diK3FlZk5GZ3hFdTQ1TWNYYjhZd28wR2hkK3pv?=
 =?utf-8?B?c0ZZMmVVOVoxMTVuVVpqaTY0a29qRHp4aXVaSXpiSUh0UVdodzd2N00zbDVo?=
 =?utf-8?B?bXdNcFBRYWw3SWE3am5pQmJiWDJKZG5mRm9vNEFjeUo0dkRxVWZVMFRzb0sx?=
 =?utf-8?B?YXRhMi9WZHVrTGx0S0tGVWM0dGV4TTYzbU1uVnZUM1lzTlVEZ01xUGQvdm5P?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18192a6e-6378-470c-6f5e-08dbb91c331a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:24:57.2751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1S1qkQh3aAe6eAUKkWpdUQtTSQvsX+tc+UqRd9RvCy5G6Psi3Mb6ewTfi0XQ24O1pgbK8TyNG+gwO1dBKnqOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 04/16] drm-uapi/xe_drm: Remove MMIO ioctl
 and align with latest uapi
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

Align with commit ("drm/xe/uapi: Remove MMIO ioctl")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h                |  31 +-
 tests/intel-ci/xe-fast-feedback.testlist |   2 -
 tests/intel/xe_mmio.c                    |  91 ------
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 -----------------------
 6 files changed, 4 insertions(+), 488 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 delete mode 100644 tools/xe_reg.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 078edd9f8..1d869f5e8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -106,11 +106,10 @@ struct xe_user_extension {
 #define DRM_XE_EXEC_QUEUE_CREATE		0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
 #define DRM_XE_EXEC			0x08
-#define DRM_XE_MMIO			0x09
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-#define DRM_XE_VM_MADVISE		0x0c
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_VM_MADVISE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -123,7 +122,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
@@ -939,27 +937,6 @@ struct drm_xe_exec {
 	__u64 reserved[2];
 };
 
-struct drm_xe_mmio {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	__u32 addr;
-
-#define DRM_XE_MMIO_8BIT	0x0
-#define DRM_XE_MMIO_16BIT	0x1
-#define DRM_XE_MMIO_32BIT	0x2
-#define DRM_XE_MMIO_64BIT	0x3
-#define DRM_XE_MMIO_BITS_MASK	0x3
-#define DRM_XE_MMIO_READ	0x4
-#define DRM_XE_MMIO_WRITE	0x8
-	__u32 flags;
-
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 610cc958c..a9fe43b08 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -141,8 +141,6 @@ igt@xe_mmap@bad-object
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
-igt@xe_mmio@mmio-timestamp
-igt@xe_mmio@mmio-invalid
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
diff --git a/tests/intel/xe_mmio.c b/tests/intel/xe_mmio.c
deleted file mode 100644
index 9ac544770..000000000
--- a/tests/intel/xe_mmio.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-/**
- * TEST: Test if mmio feature
- * Category: Software building block
- * Sub-category: mmio
- * Functionality: mmap
- */
-
-#include "igt.h"
-
-#include "xe_drm.h"
-#include "xe/xe_ioctl.h"
-#include "xe/xe_query.h"
-
-#include <string.h>
-
-#define RCS_TIMESTAMP 0x2358
-
-/**
- * SUBTEST: mmio-timestamp
- * Test category: functionality test
- * Description:
- *	Try to run mmio ioctl with 32 and 64 bits and check it a timestamp
- *	matches
- */
-
-static void test_xe_mmio_timestamp(int fd)
-{
-	int ret;
-	struct drm_xe_mmio mmio = {
-		.addr = RCS_TIMESTAMP,
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT,
-	};
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	if (!ret)
-		igt_debug("RCS_TIMESTAMP 64b = 0x%llx\n", mmio.value);
-	igt_assert(!ret);
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_32BIT;
-	mmio.value = 0;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	if (!ret)
-		igt_debug("RCS_TIMESTAMP 32b = 0x%llx\n", mmio.value);
-	igt_assert(!ret);
-}
-
-
-/**
- * SUBTEST: mmio-invalid
- * Test category: negative test
- * Description: Try to run mmio ioctl with 8, 16 and 32 and 64 bits mmio
- */
-
-static void test_xe_mmio_invalid(int fd)
-{
-	int ret;
-	struct drm_xe_mmio mmio = {
-		.addr = RCS_TIMESTAMP,
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_8BIT,
-	};
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_16BIT;
-	mmio.value = 0;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-	mmio.addr = RCS_TIMESTAMP;
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT;
-	mmio.value = 0x1;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-}
-
-igt_main
-{
-	int fd;
-
-	igt_fixture
-		fd = drm_open_driver(DRIVER_XE);
-
-	igt_subtest("mmio-timestamp")
-		test_xe_mmio_timestamp(fd);
-	igt_subtest("mmio-invalid")
-		test_xe_mmio_invalid(fd);
-
-	igt_fixture
-		drm_close_driver(fd);
-}
diff --git a/tests/meson.build b/tests/meson.build
index 31492bf7b..7c67b22d4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,7 +292,6 @@ intel_xe_progs = [
 	'xe_live_ktest',
 	'xe_media_fill',
 	'xe_mmap',
-	'xe_mmio',
 	'xe_module_load',
 	'xe_noexec_ping_pong',
 	'xe_pm',
diff --git a/tools/meson.build b/tools/meson.build
index 21e244c24..ac79d8b58 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -42,7 +42,6 @@ tools_progs = [
 	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
-	'xe_reg',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
diff --git a/tools/xe_reg.c b/tools/xe_reg.c
deleted file mode 100644
index 1f7b384d3..000000000
--- a/tools/xe_reg.c
+++ /dev/null
@@ -1,366 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#include "igt.h"
-#include "igt_device_scan.h"
-
-#include "xe_drm.h"
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-
-#define DECL_XE_MMIO_READ_FN(bits) \
-static inline uint##bits##_t \
-xe_mmio_read##bits(int fd, uint32_t reg) \
-{ \
-	struct drm_xe_mmio mmio = { \
-		.addr = reg, \
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_##bits##BIT, \
-	}; \
-\
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
-\
-	return mmio.value;\
-}\
-static inline void \
-xe_mmio_write##bits(int fd, uint32_t reg, uint##bits##_t value) \
-{ \
-	struct drm_xe_mmio mmio = { \
-		.addr = reg, \
-		.flags = DRM_XE_MMIO_WRITE | DRM_XE_MMIO_##bits##BIT, \
-		.value = value, \
-	}; \
-\
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
-}
-
-DECL_XE_MMIO_READ_FN(8)
-DECL_XE_MMIO_READ_FN(16)
-DECL_XE_MMIO_READ_FN(32)
-DECL_XE_MMIO_READ_FN(64)
-
-static void print_help(FILE *fp)
-{
-	fprintf(fp, "usage: xe_reg read REG1 [REG2]...\n");
-	fprintf(fp, "       xe_reg write REG VALUE\n");
-}
-
-enum ring {
-	RING_UNKNOWN = -1,
-	RING_RCS0,
-	RING_BCS0,
-};
-
-static const struct ring_info {
-	enum ring ring;
-	const char *name;
-	uint32_t mmio_base;
-} ring_info[] = {
-	{RING_RCS0, "rcs0", 0x02000, },
-	{RING_BCS0, "bcs0", 0x22000, },
-};
-
-static const struct ring_info *ring_info_for_name(const char *name)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ring_info); i++)
-		if (strcmp(name, ring_info[i].name) == 0)
-			return &ring_info[i];
-
-	return NULL;
-}
-
-struct reg_info {
-	const char *name;
-	bool is_ring;
-	uint32_t addr_low;
-	uint32_t addr_high;
-} reg_info[] = {
-#define REG32(name, addr) { #name, false, addr }
-#define REG64(name, low, high) { #name, false, low, high }
-#define RING_REG32(name, addr) { #name, true, addr }
-#define RING_REG64(name, low, high) { #name, true, low, high }
-
-	RING_REG64(ACTHD, 0x74, 0x5c),
-	RING_REG32(BB_ADDR_DIFF, 0x154),
-	RING_REG64(BB_ADDR, 0x140, 0x168),
-	RING_REG32(BB_PER_CTX_PTR, 0x2c0),
-	RING_REG64(EXECLIST_STATUS, 0x234, 0x238),
-	RING_REG64(EXECLIST_SQ0, 0x510, 0x514),
-	RING_REG64(EXECLIST_SQ1, 0x518, 0x51c),
-	RING_REG32(HWS_PGA, 0x80),
-	RING_REG32(INDIRECT_CTX, 0x1C4),
-	RING_REG32(INDIRECT_CTX_OFFSET, 0x1C8),
-	RING_REG32(NOPID, 0x94),
-	RING_REG64(PML4E, 0x270, 0x274),
-	RING_REG32(RING_BUFFER_CTL, 0x3c),
-	RING_REG32(RING_BUFFER_HEAD, 0x34),
-	RING_REG32(RING_BUFFER_START, 0x38),
-	RING_REG32(RING_BUFFER_TAIL, 0x30),
-	RING_REG64(SBB_ADDR, 0x114, 0x11c),
-	RING_REG32(SBB_STATE, 0x118),
-
-#undef REG32
-#undef REG64
-#undef RING_REG32
-#undef RING_REG64
-};
-
-static const struct reg_info *reg_info_for_name(const char *name)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(reg_info); i++)
-		if (strcmp(name, reg_info[i].name) == 0)
-			return &reg_info[i];
-
-	return NULL;
-}
-
-static int print_reg_for_info(int xe, FILE *fp, const struct reg_info *reg,
-			      const struct ring_info *ring)
-{
-	if (reg->is_ring) {
-		if (!ring) {
-			fprintf(stderr, "%s is a ring register but --ring "
-					"not set\n", reg->name);
-			return EXIT_FAILURE;
-		}
-
-		if (reg->addr_high) {
-			uint32_t low = xe_mmio_read32(xe, reg->addr_low +
-							  ring->mmio_base);
-			uint32_t high = xe_mmio_read32(xe, reg->addr_high +
-							   ring->mmio_base);
-
-			fprintf(fp, "%s[%s] = 0x%08x %08x\n", reg->name,
-				ring->name, high, low);
-		} else {
-			uint32_t value = xe_mmio_read32(xe, reg->addr_low +
-							    ring->mmio_base);
-
-			fprintf(fp, "%s[%s] = 0x%08x\n", reg->name,
-				ring->name, value);
-		}
-	} else {
-		if (reg->addr_high) {
-			uint32_t low = xe_mmio_read32(xe, reg->addr_low);
-			uint32_t high = xe_mmio_read32(xe, reg->addr_high);
-
-			fprintf(fp, "%s = 0x%08x %08x\n", reg->name, high, low);
-		} else {
-			uint32_t value = xe_mmio_read32(xe, reg->addr_low);
-
-			fprintf(fp, "%s = 0x%08x\n", reg->name, value);
-		}
-	}
-
-	return 0;
-}
-
-static void print_reg_for_addr(int xe, FILE *fp, uint32_t addr)
-{
-	uint32_t value = xe_mmio_read32(xe, addr);
-
-	fprintf(fp, "MMIO[0x%05x] = 0x%08x\n", addr, value);
-}
-
-enum opt {
-	OPT_UNKNOWN = '?',
-	OPT_END = -1,
-	OPT_DEVICE,
-	OPT_RING,
-	OPT_ALL,
-};
-
-static int read_reg(int argc, char *argv[])
-{
-	int xe, i, err, index;
-	unsigned long reg_addr;
-	char *endp = NULL;
-	const struct ring_info *ring = NULL;
-	enum opt opt;
-	bool dump_all = false;
-
-	static struct option options[] = {
-		{ "device",	required_argument,	NULL,	OPT_DEVICE },
-		{ "ring",	required_argument,	NULL,	OPT_RING },
-		{ "all",	no_argument,		NULL,	OPT_ALL },
-	};
-
-	for (opt = 0; opt != OPT_END; ) {
-		opt = getopt_long(argc, argv, "", options, &index);
-
-		switch (opt) {
-		case OPT_DEVICE:
-			igt_device_filter_add(optarg);
-			break;
-		case OPT_RING:
-			ring = ring_info_for_name(optarg);
-			if (!ring) {
-				fprintf(stderr, "invalid ring: %s\n", optarg);
-				return EXIT_FAILURE;
-			}
-			break;
-		case OPT_ALL:
-			dump_all = true;
-			break;
-		case OPT_END:
-			break;
-		case OPT_UNKNOWN:
-			return EXIT_FAILURE;
-		}
-	}
-
-	argc -= optind;
-	argv += optind;
-
-	xe = drm_open_driver(DRIVER_XE);
-	if (dump_all) {
-		for (i = 0; i < ARRAY_SIZE(reg_info); i++) {
-			if (reg_info[i].is_ring != !!ring)
-				continue;
-
-			print_reg_for_info(xe, stdout, &reg_info[i], ring);
-		}
-	} else {
-		for (i = 0; i < argc; i++) {
-			const struct reg_info *reg = reg_info_for_name(argv[i]);
-			if (reg) {
-				err = print_reg_for_info(xe, stdout, reg, ring);
-				if (err)
-					return err;
-				continue;
-			}
-			reg_addr = strtoul(argv[i], &endp, 16);
-			if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
-				fprintf(stderr, "invalid reg address '%s'\n",
-					argv[i]);
-				return EXIT_FAILURE;
-			}
-			print_reg_for_addr(xe, stdout, reg_addr);
-		}
-	}
-
-	return 0;
-}
-
-static int write_reg_for_info(int xe, const struct reg_info *reg,
-			      const struct ring_info *ring,
-			      uint64_t value)
-{
-	if (reg->is_ring) {
-		if (!ring) {
-			fprintf(stderr, "%s is a ring register but --ring "
-					"not set\n", reg->name);
-			return EXIT_FAILURE;
-		}
-
-		xe_mmio_write32(xe, reg->addr_low + ring->mmio_base, value);
-		if (reg->addr_high) {
-			xe_mmio_write32(xe, reg->addr_high + ring->mmio_base,
-					value >> 32);
-		}
-	} else {
-		xe_mmio_write32(xe, reg->addr_low, value);
-		if (reg->addr_high)
-			xe_mmio_write32(xe, reg->addr_high, value >> 32);
-	}
-
-	return 0;
-}
-
-static void write_reg_for_addr(int xe, uint32_t addr, uint32_t value)
-{
-	xe_mmio_write32(xe, addr, value);
-}
-
-static int write_reg(int argc, char *argv[])
-{
-	int xe, index;
-	unsigned long reg_addr;
-	char *endp = NULL;
-	const struct ring_info *ring = NULL;
-	enum opt opt;
-	const char *reg_name;
-	const struct reg_info *reg;
-	uint64_t value;
-
-	static struct option options[] = {
-		{ "device",	required_argument,	NULL,	OPT_DEVICE },
-		{ "ring",	required_argument,	NULL,	OPT_RING },
-	};
-
-	for (opt = 0; opt != OPT_END; ) {
-		opt = getopt_long(argc, argv, "", options, &index);
-
-		switch (opt) {
-		case OPT_DEVICE:
-			igt_device_filter_add(optarg);
-			break;
-		case OPT_RING:
-			ring = ring_info_for_name(optarg);
-			if (!ring) {
-				fprintf(stderr, "invalid ring: %s\n", optarg);
-				return EXIT_FAILURE;
-			}
-			break;
-		case OPT_END:
-			break;
-		case OPT_UNKNOWN:
-			return EXIT_FAILURE;
-		default:
-			break;
-		}
-	}
-
-	argc -= optind;
-	argv += optind;
-
-	if (argc != 2) {
-		print_help(stderr);
-		return EXIT_FAILURE;
-	}
-
-	reg_name = argv[0];
-	value = strtoull(argv[1], &endp, 0);
-	if (*endp) {
-		fprintf(stderr, "Invalid register value: %s\n", argv[1]);
-		return EXIT_FAILURE;
-	}
-
-	xe = drm_open_driver(DRIVER_XE);
-
-	reg = reg_info_for_name(reg_name);
-	if (reg)
-		return write_reg_for_info(xe, reg, ring, value);
-
-	reg_addr = strtoul(reg_name, &endp, 16);
-	if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
-		fprintf(stderr, "invalid reg address '%s'\n", reg_name);
-		return EXIT_FAILURE;
-	}
-	write_reg_for_addr(xe, reg_addr, value);
-
-	return 0;
-}
-
-int main(int argc, char *argv[])
-{
-	if (argc < 2) {
-		print_help(stderr);
-		return EXIT_FAILURE;
-	}
-
-	if (strcmp(argv[1], "read") == 0)
-		return read_reg(argc - 1, argv + 1);
-	else if (strcmp(argv[1], "write") == 0)
-		return write_reg(argc - 1, argv + 1);
-
-	fprintf(stderr, "invalid sub-command: %s", argv[1]);
-	return EXIT_FAILURE;
-}
-- 
2.41.0

