Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE73CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA4311315D;
	Wed,  3 Jun 2026 15:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWNf+1yD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C1B11315D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780498876; x=1812034876;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+uLhawHCiRlzF0LR7ce3eOrusvUkPE4tkmOEO8Got6E=;
 b=GWNf+1yD+zaEEDxpArgHGPkifWNWnnA9tktlzwq5WkC+2VEw8R3F411N
 zcUc5Itmju/MtaJZ6e+LV9qMxZtLmydX2eaHQA9cGdtatdSWY8D57xCEJ
 0SrBrEHq8fgZMu6c/HZGuBIyfO0QzrcO0UMCXQiJIlk1HOPQj00WdNptB
 jo0DvDScqBONy34PBMwYInAJ1uezK2RPJX7maGxN8KdZzx1U7iXEhfbeS
 Ln5j5+nln6exUQTyOANri8nLla/2sU08EFQy708nQhItUGWbiqAcmG+VG
 WY3BVZdtV4aMSVhqGfjigvMSyXKwGdjR8tybAA4FZ18BHUPc+KWHsHQHY w==;
X-CSE-ConnectionGUID: QAE7jUDTRb6ZPE+t0o8c1g==
X-CSE-MsgGUID: oGIUDglFSxaZ/Fo5QoXK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91995109"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91995109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:16 -0700
X-CSE-ConnectionGUID: lUrb2lfcTRK5ITBSoVk48g==
X-CSE-MsgGUID: 1xzL6OoXRk2l/kDvI6BuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="274504461"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 08:01:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1UcxMf36ojrDHF8KwPHQE/a0W7nxLRNB1F38xcXONT+n6fZKdB2ePJLpCNQ7SWsi1fKmyeAqBRViJPI+loKHjonj5fQ5FL4scFaSAR3/mLbr2oHh4J/z18/LUYcpGOSSkRTV3JVo42n5UmUnWk49QCFceawZE/1GAwyRjGUKGfKdL5yz5YuKt1f/qSOyXAfm17lIg2kId9lAjpd0KR5vhXy8hrhQYjVvYjVkK8lqJyckB9tFFI/QdKlmQAJaZER9h1LLlp/hIeZ9e/hwubYcHUgmPxVCZ/5h0g4tuM2XNTxp+Of1fLqt58cc1HfYc17viE5+tAzlqaMrT0vOKVHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkb8u0hJg0tAEfd81MxCtMa/LAz6pXwZpRvqSoklPxQ=;
 b=YsJIZVoSYVyOKpfwco7OCVA+IFnPgtzjED+AA8PINvtj60KhBol5glWHDK6fzlA/ji+VwiYU6kpUipgHlD1c3mr3nzbfDfW9mm7uvr5vzVnWofddS9B5qFxHXlVR1qmijlNuPYKA7KtPFcZ6C3vQTOWKiB6vFSLc14uQd+BWNzhnGgYEUI+qCYi9SH2E7PsiDFCY+8TvOxS/3RawpSpmIH1xQzINB6xnH+dhXgvzqxzCl0hIPdxEe7H3UXgGFV0Xs4A9Q9CVBqqgdkxQpTjeT8ysc+EoCFE+jPImiuajQbpdNH6cR8hkX9eUHXnASnaLGXMH3kgvflYu8d3Znonn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:01:10 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:01:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Sanjay Yadav <sanjay.kumar.yadav@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs and
 kernel queues
Date: Wed, 3 Jun 2026 11:01:00 -0400
Message-ID: <20260603150059.157355-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c91e16-d54f-4ced-9965-08dec180f13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: qY9wbwgPuqtNc9BONPu/AFITSzzJGEOMCuxqCS/INz8XPihG7MZOTjcSrs/6ronkWXLs9CsomezbrwkiKKB1YQaduQ0VC//l8PvqI9qmpZn4NrtdJSuXpSJpVTUv/E4t92FVshXZe52tQjPu513zoogPbxhW3BvGnhPJuMoNnF59+VZ/Vh1XcVqaLezZBg73btjA0fcRvKZ9TI/pnGm7S/JyBrRPoBwd3xHGOE5yFnviL5IKsbF9k5+DXzN0rmhR/JL1u9OyI3gO27D77sHb8/R+a8zt1W3v8BIX/r6h8p9QNoSFIA+dgbIunpsqXjDDzIddrfVNEsgHCCSS6Mfiwr5kSZC4HRsh1UURQzpPfEnz5u5NUTuDrNM87ZCi6ZzMUQpVyx3NnrM+Zc4sITppAGKw6X/JwoHioN7jus7UK0y9RLqhkUr61X6IedQi2kyH+gGdv/xbogmSeMjzulmnqEF3qt92NtyLl2NlnldHO2m5IR0sEyljIVErFepSXtvBmzl6Jkq6rxVh93mAl423ofpRu/mAliWg7TwLvsng+7/Ha6t25FzWjrXxXjiUoeEStxzlbB6jV+/5/U22lKdoYulrgPxq5Q273iAUGYbk+RYXZhXPnw/tbUezxdHzDCh540SmpFUi83h4nW62u44ak2E3dUPeUFz9+BRuI44qBedhVZCUDOXXjZS/7/8dn0gu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVVNDEvd2RhRGFtampSZU5oNTJOTFl2c3JMRjgwODdOUjlsUTRGcTFjemNF?=
 =?utf-8?B?NXlENndINngwaSsxV3ZQSTY0YTNNeDBHVG1FWlBYMlRtcGhSd0c1WjE3cHNn?=
 =?utf-8?B?MFVSWmttRmtQZkJMdy9SeXBKVm1PTlBHTTVQQzRhZEplMXFkWU9vRFhOYmZG?=
 =?utf-8?B?VzFvdkQyQmlPdGZWNkltbnFDVHpjNm42ODlxZDNhS3pCaHJ4OVdPNXR2b2xH?=
 =?utf-8?B?d2s2VFdpbTRnQzlYVjNOSncwenQrSDhPUGJhVDBCSXJJNENEOE0yTFArcHNV?=
 =?utf-8?B?YXFWKzl0UDhmRmJZM0VLcThHWkk3TC95NlUyY3RneHRDMElMSjRWQTQwVElz?=
 =?utf-8?B?MnRHdEVvdzJKV0pFSHNwclVNcklrWUx5TWpjUTBpNTdaTDB1WjRpam9lMGVP?=
 =?utf-8?B?MXZiazdSL0FDdnRxRG9ZSFE2eldkazlkU1RhV2xZZzdKU0hsaWFXUldvcVQv?=
 =?utf-8?B?cFNmV0ZOL2dOamgvNDh4UENvRytLU0xGOGE1aGQvZVMwaVNaWFpLamxGQjVD?=
 =?utf-8?B?Sis3QXJ0RTMvMGxHMXl2bXBpT3J5Q2FDWmwraWN0SjNxQk9uSXJJbVZZMXhG?=
 =?utf-8?B?UHlWenFsSkZFRzV1SS9GZDh3Z1hpblloMlExWGdCMlZtTGpGUzduU2tQRXFo?=
 =?utf-8?B?OVpkRS8xZW1VUDBHRmdqU3c5cUtwNjNBL3dabG54R0RWdm5MUGtET0Mwcy9x?=
 =?utf-8?B?anVkSll3YVhnOWRuNFNqWkt5RnVteUdJbm5UWTlpMzZYaU0wdmw0US9zU0Nt?=
 =?utf-8?B?aHN5bWhiSXNWTXNYR0kwaVFFWE10dUZpbWY0ZmpBUWx5Q2h4QTY0QU1mOTc1?=
 =?utf-8?B?LzAzZE5tZ1dEWU9wbFlCRXJ3QlAvQkZzUkpzU1k2ZGJJbEZLNThnNzh4Y204?=
 =?utf-8?B?RFpKMmNyeWNjK1dBb053QWRMTCtOL2VnYXhXR2d5dFF4alVPcU1Xa1VUbWF6?=
 =?utf-8?B?QmUrQVN6QmtEVnRGMnRpUU5leS9SM0VFM1ZmVUFBRHpTNzQzemZlYkFKa2w1?=
 =?utf-8?B?WWxQMXdXd2ljSDBHMWYyNUtuVkJlRkdDUHpIbFhRRlZ4RGlqZFBFWGlFVmNi?=
 =?utf-8?B?U1dUVUIwOThWZGpGRTF5VUVZSkgzb1dNYy85OGR2cUpBbjZVZ2EwYy9OZzha?=
 =?utf-8?B?N2xhNEk0ZzNmZFE5OEhmTkFzQ2d3dGNBMlVZUWdHbUVLVU1UM2JZTzhtdmZn?=
 =?utf-8?B?K1MrWjN3NWxJQVpES1pzYjdkYkJnbTNFcUR3UllVQ1UxekxlSmlKbVAzS1lV?=
 =?utf-8?B?YlBLL3FzUld3Z3BpN0k2NEFvdnh4d3VPNC9yRUFtaUVWWWF3VURQb2tIN1dY?=
 =?utf-8?B?WFA4TWF5N21hY1UxTHUzblFzVW5mMnlOejJ1V3l3N1ZRWENVN0U4VG1jQWZG?=
 =?utf-8?B?UkllRGdEQnVLNFM1eHM0UzV6QnFLUC83UllvYnF4dExLL0VCbmh0dWNGT3Nq?=
 =?utf-8?B?ZWczaW1UbjJTUDhpVlVSWWhnVlRucEJXTVZTeERDcnlDNUR5bmJJTHRrVTRm?=
 =?utf-8?B?S01ENFF6ZHE4aGN2RktWQU9la3ZHY2lrdmdaOUhHYWtzMElYbUtSOHdPcmwx?=
 =?utf-8?B?b3RFTEFnS3pMQXpRdUQvQWdEZzdYNUt5dTBRVmpucmU2b3lQU3FWRkowbTJt?=
 =?utf-8?B?RnJxYW9CaDlrdytqOWlXNnBuT0VkVlRBOTlJVXZXOWE4K1ltNUh6R1gvT2c0?=
 =?utf-8?B?alRrSTFVZ25MM09iSU03b0lyK3dNK1RrNDc4UlVGdlc1Y0JIUmxxNDdrSG1s?=
 =?utf-8?B?RVJ4QjNHVDQ1UHc4dDd3QzdTZ0M2WlhDWGVzbFRhSGNQS3UyMFgxNEpTcXZk?=
 =?utf-8?B?NDl3UGY5S0lxZVRpVzE4LytsendzcFZpQ3dLK3ZaaFUwOSsxenB1N285K0pG?=
 =?utf-8?B?NWZHaENZbVFzSzVvUG1zN0pVQ1FUU1ZWQStsUEU2UGF5Y3RSeUdUMDhUb0Zz?=
 =?utf-8?B?aldrc0k0RkVNbzd2Mkl4WmJuQ3hrZ0hya1RJSXFmNWZxTlJ5a3RrMDR4azd5?=
 =?utf-8?B?R2JwREVqUWRHc3VGZEhneWl1d2FtNy9DT2FzejFiSjBlbk1vL1BBNFBQT3N5?=
 =?utf-8?B?VnhKUWZBaHNhQTZqV2RURkttRys1R2RkaXBNOTFycVYyNTJaa29za1Y3aEQ2?=
 =?utf-8?B?TmJuZGVRWmFLWGh4eU1UNjJMdnBBakNVbi9PeTUxb1VwejhvcFI4dlJwQzhi?=
 =?utf-8?B?NlBaUEZxRjlQdEhQci9kNzNaTnQ5ckU4Tm1MZ3o5WVFkOVlyY1RQcVBsdVJv?=
 =?utf-8?B?c3UzamRFbWwramZFVklNWFZObHRRWjJPRmRZcFB1c1BlTDd5by9RcHVBVlpW?=
 =?utf-8?B?cWFYQ0p0WDRqUHNBWW9Qd092S2ZTcnZCbTBpQWdta3JqL0ZwbEZTZz09?=
X-Exchange-RoutingPolicyChecked: airtM77KCC4IYWW2cKEavzakStmTRy96zL8YErLRCxigkFqq5qExRrlAM2IP6fzjQt5wdNIjcfDTzwv53TDM1do/i3T1gbXGR94TS4YZOFQHul+VaHGD6jZciKb8v5EvA6gi/krElEkr+OLC0E+db8QOSToZ3dpVf6Yy0klAG2V75ryB4Yow9oCax1By6IXvd4GiZ84vXfAp9Apb5W1caKpA+PJCUUBD71cOgn6OhSnJeRB/szdwEJNZhQFhWJRMr45OW2kTP7t2u0OEj+u/i3wOgdubGBbGDfT6Updo0lnyWL413SCZ6kDWmS037B1zGb81tuFY6kRjjNCJGEKJ6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c91e16-d54f-4ced-9965-08dec180f13d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:01:08.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27AWwn3B9HwtSAycur2bKl/FGp6p6dhEGkVL7sT/K61xWFtDS4NCIM+n976h2iDeIqTRaQfs//D/p+0edh8fRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Jobs that GuC never scheduled were silently errored out instead of
triggering a GT reset. Kernel jobs that exhaust all recovery attempts
should wedge the device rather than silently fail, and userspace VM bind
queues should stay permanently banned rather than being reset and retried.

The queue is banned early in the timeout handler to signal the G2H
scheduling-done handler so it wakes the disable-scheduling waiter; without
it the waiter sleeps the full 5s timeout. For kernel queues the ban is
cleared before rearming so that guc_exec_queue_start() can resubmit jobs
after the GT reset — a banned queue would block resubmission and cause an
infinite TDR loop.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806..bbccba367626 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
 }
 
+static void clear_exec_queue_banned(struct xe_exec_queue *q)
+{
+	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
+}
+
 static bool exec_queue_suspended(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
@@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			   q->guc->id);
 
-		return xe_sched_invalidate_job(job, 2);
+		/* GuC never scheduled this job - let the caller trigger a GT reset. */
+		return true;
 	}
 
 	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
@@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			       q->guc->id, q->flags);
 
 	/*
-	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
+	 * Kernel jobs should never fail permanently. Attempt GT reset and
+	 * resubmit; if karma is exhausted the hardware is unrecoverable so
+	 * wedge the device.
+	 *
+	 * Userspace VM bind queues are banned permanently on timeout
+.	 * No reset is attempted, the ban already
+	 * signals the G2H handler, and the queue stays banned so the job
+	 * errors out cleanly.
 	 */
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
-		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
+	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
 		if (!xe_sched_invalidate_job(job, 2)) {
+			clear_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			goto rearm;
 		}
+		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
+		xe_device_declare_wedged(gt_to_xe(q->gt));
+	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
+		   !exec_queue_killed(q)) {
+		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
 	}
 
 	/* Mark all outstanding jobs as bad, thus completing them */
-- 
2.54.0

