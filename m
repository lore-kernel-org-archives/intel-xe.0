Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB7CDB47C
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 09:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2196E10EE4F;
	Wed, 24 Jun 2026 09:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6gzo/KA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFF010EE4F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782295010; x=1813831010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/oOiv0etVvhuosoDCmiq90+S0gHCgZi915mY5d66noI=;
 b=Z6gzo/KA/Fl0hG4E7zix5ccPAD6TfOVprSvOpK0gPffIsbVc8EVbdRSp
 E+NMlhFl4qR9pezd3cp97ZTgRWvKma5Lhc188S8AyOcGQffypqe4qUYGr
 toOuHJFjAS3lK2ua7sId7o8mbTzalKUk+ith+In15NDGyhqK6u8QakreM
 uHe24Pk+CTAg0D/jJFWzXmxLvHMR1cK2VkRbFEoQRUXnQI0/DwhGXuVHU
 9kfb83CaVnTnf0XWgte7zMd4gdCb1IpQObLqE564pcgqV+qli4KrYxWbP
 lbjEXXcB8MgcZFNRZEJ7chqE/SPrW+bdYRTNoMqH2mK/A/3FlHlcOdD7R w==;
X-CSE-ConnectionGUID: A3nnnbugR2O7rIEVAwpV/Q==
X-CSE-MsgGUID: SZYScQq3RbyiT9wEKEUiyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83171965"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83171965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:49 -0700
X-CSE-ConnectionGUID: n2fXtChTTyWadlLvlfmDSQ==
X-CSE-MsgGUID: gTWdEt2DQJelinlqwSgl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253677323"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:56:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 02:56:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X45NTrDSKLTaiU1KnL0qJVl1mnTLmAaL7H9JMx/sf8Yw7ecTXLO3E7/DTkodo52vHY+zV7n0DOgTTa/8lAMuqYVinxRz+aHoJOPG6b50gdODTmJqfY/pZnEwV4y5/qLOREsWRY0eAoHXfrcahEdsHOW3hbLmL/GK54+HDCxagyMXL8uVh6ZYx0KGO53gFG9GymVGTrLN2ilkf8HNfn7wcHzO5mu3Ya/z9BGlFNewGx7uKSP8/gJia/u8MFzPur2sjN5+5N1c6Wn+z3lwNmAvqnXZU2+LgotGlLQakmiHgkFPn645uUFvGF3VQjcOUeEcuPlYUq2wC4Tdk7BbckDJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4fpy0jwUrUOpUYCQxq8XZDAT0YQ0MA1C8DBLF8z1i0=;
 b=f3oPp6ZpAEU0hQcMAl/ma8bjI/198I92wyg9JtLoKLnmgkurBFbdvRnLzfJy01tsI+sC6oNepxDl7+iviemmu1M6Afwnb2cVsYPH0+MqCpFNmqGkSGkAAV9YJ9RtaqaM2dJatHOfb4ACMBK3PJWVF/PgTeYmnyUvsrjfbcQgjZGy9vKZjHOhoqq48Z8qZENHiSinUIYHiJqaCZa8MCApXp4sABciBhIe8rzISn8LS6pclNE31fCeZj8vqfHoUa13Tkfkt1Hwhi8fR7ewbdtsELFaTA7njStBmfuyyaHbkWI2e9Bev8A6pXFGMUnpSfPf75mlSQokoZsv2+tB+OT+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:56:44 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0159.015; Wed, 24 Jun 2026
 09:56:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Add support for VF Pause abort event
Date: Wed, 24 Jun 2026 11:56:33 +0200
Message-ID: <20260624095634.1250956-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624095634.1250956-1-michal.winiarski@intel.com>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: f60566df-7d07-46db-d07d-08ded1d6e613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1Xgm0KVdAOb3k1gL1clRog0edQJRemTbwHlvSxNxWIAfRU0CSI3hckss6vJEo/569pwqMN/TblU1zdFh/BBu+sXrNuyE9EUPrA77ach5RXPQQki79EMZrBsTLpUAekvAkgfJvpgbYZedUCODxQltir8f01pWCex8WGsVhc/7kgtM9xTrC8Sy0TJRmaDbjilCsXW5QyBx506Q2QaR7qg7AS3mEp+dMGI0KcxYQemklQ+JqLKV2hgRyWluvN+j9FqJIk/c3AB/F9+1J4vUMDS17AE3sj9wUDYBztHVJn/B/PONcCJnydWdDUFUC+qXhYi8z51k1eMQszJX+9KfqezPTVjtWi2Nfce8c7dUNIimmqwFEfJ/yjeRC9ycKw2CUzbggEsZjaOat6l5CkSn+Dhgl+H5YcTdvX2jW5wl6Dzgc+vqb9nh8M2hCPXWECNW50NXvELTfFKyMye6JCvYBOGbAHP4aMq3Fh6djHjw/5cw538Bc0f9OAa0hYVYe+zSRsxRmuVjzvuoXcTMAzxajHYb5M1T9RGDASqrczYtEQrXK3oqA8SzLd0uyAQKRtXy72Pa1iduLknx6CJqriDwKAt0B98XrgNpLeIiQJ+oHjXXLoz/23XvCFgVKvYtXSlt1OSiLj1i+l1EXEL43o+7Eattt1vgsZZZUNunHio2V2gcy+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JDamFyd0R1eGdtTk9QUnQzanFHWGVEaG9yaFV2UGwycGtNc09aRXBocldC?=
 =?utf-8?B?WlE3b1RRUGJCZmlDcU5qaFd2eW9tb1NJVVc1SkN2ekdReVR5R0FLMU8vbUdK?=
 =?utf-8?B?cjZhcnRyTWdLUDcvcHBQM0FSaVI4RmREUWh3RkdTSWRXNm1JZkFYckVWNlBi?=
 =?utf-8?B?RW5RSzVyczAyUng1KzVka1dCd1dqWXV0NFdGTnVpekJqVkdSelFSV1k3OFZy?=
 =?utf-8?B?Qmo4Z3NlMHlQNzB0TEdhU3o3TURpcGRsZUxRejJaV1B0RWFGLzh6ZURvY3R1?=
 =?utf-8?B?YWZETTJQUXhFK0VxRmNNUDM4bzVFaUdSUXRPQWFyV2I0allqczVNTVNNVjM3?=
 =?utf-8?B?ZTduOTRqbGhxTk5wUDRBZ1dKY0JMTTFxaHJJUVo0UnF2NkQzK2FRdVBNZlAz?=
 =?utf-8?B?NmQzUkdtME1DR3NEQlJpMGFOTHcrbW1GRm1icGQrWkJwOSswWDhlODJxYlFs?=
 =?utf-8?B?dU9mdDJQc1MxK2ltYVpOcS9rUy9KTFlQR2NTeXB0VFg0cVBudzBSMWFaRHpM?=
 =?utf-8?B?T0tyVkcrRnBOUG03YU01YlNneTc5akprbXEzMWpBMmxidkxsMHR1K25uUUtN?=
 =?utf-8?B?RGtyTkNqZDlETzNYdnZPQUNhZDQzc25NL2ZtRkdJOUdoRzdXemlENUdBRG41?=
 =?utf-8?B?eVE1ci93R010b29qN3FTZnVKUmNnVEdpbHlzdlNEL2tzMHRja293U3hXeTBa?=
 =?utf-8?B?STg3bWl2UmFaU1QyWGJVNE80VjBHRXNpdnJUSXAwa3JHUFUxQmEvWDVucmlE?=
 =?utf-8?B?d1Nxdm5OUzl1RGR0OUZrTjZmWE9KM1loUThxUnNvbUNhdGJoK2d4NkZJMFZF?=
 =?utf-8?B?YzFZSjBQQXRicnVhQ1FxamsxbHBOaElUeW13a1ljRTdpRnM4TnlyWkNoQlIv?=
 =?utf-8?B?OUlmdFBvbmJEQ2NsZ2tjeEp0QXk0dExMTUJFbVBmV2RFdW0rd0xENjBPdGlw?=
 =?utf-8?B?OWl3SWJtdjdyUlNUSlkxWFhIYlk1dTFTVmR4a2hXRTFKczJSREpoNWZtZWlG?=
 =?utf-8?B?N21QSXQzcjIyVFYxQkVSMzIvb0tCVnN0TkUvNERKQ3pEWmxOMXlXS0JNSFN3?=
 =?utf-8?B?L0lSZUppaHhhR0tVUEtpY1duRE9NZ2dBSytuSzFKNVJjYUZQeERrQTVCYjZk?=
 =?utf-8?B?eDVMMGxyekNKbHd0b25tZDlZQTNRd1JCaW9zbHNNbkNFSHVtWW5IUzlZNzVi?=
 =?utf-8?B?TFI5cTJaRXg1d0VuM1NNdVV6S0lFN1U1RW9IVXBwalhZNmovN3BtcDg0SEtB?=
 =?utf-8?B?OGZleW5QaVU0L0g3SXYvM050WU84ellBb25BeUZOdkpFckJ5ajFKNWhyeWZh?=
 =?utf-8?B?QW8rdHMvbzNUWVNlSTVUVW9ydE9mVnBGWDU1VmIremI3dWJ1a0hIcVNQUG82?=
 =?utf-8?B?aTRyWU11S1cvRVA3MnVrc1dWZEI2QmlkUzZMNVYrOE9ETTc4dktzSTc3YlMr?=
 =?utf-8?B?Y1JrSnpIQVF3RE5yM3BXUzQyRFlPZVRONm80WVh4aENiTngxUUV4MzlqazJ6?=
 =?utf-8?B?NTFnZnJmSHUwbG1aSCtLU0xJSUtoMzdLRWxKZ2FWQWlReGpTN0ZXMmdJUE5B?=
 =?utf-8?B?SjNPZXdDSm8yTVo1YWtTWEI5TllkT0tuRTVXV2crdkF4SEVqRTdZVlFQZTRD?=
 =?utf-8?B?WmdrV0NXZldTMTVhUTNOVHppd0tLYXQzVDNEcm5ucUQrWFdldHJ4Q3NGeXFo?=
 =?utf-8?B?UnZBby8vZk94RG1waXRmbEc2ek9ySDR3U0ZpYTBOYnphM1krYUZOM3EzVTlo?=
 =?utf-8?B?a3lqSmV3ODRkNng2Y1dYbDlUWlBOKzBXMWtXNUZqT1Z6VS9ZMndUd3ZWNXcv?=
 =?utf-8?B?K1ZTKzQ0ZnkvUTVCYW0vZXlTZHYrbnJqcVFQa1I3Q1hNNHEybWwwWmExSHZT?=
 =?utf-8?B?ZkFUSGZycEhVMy9leHp6ZWRVT2JDTkNwOFFmb3l6Rm42QTFvampSN2NOdVJk?=
 =?utf-8?B?OWR0V2E2L0pUcWJ0RGZZZXlWVW1pc2ZKQzIvYzkrdU5LQzc4b21OZkdadUlI?=
 =?utf-8?B?SHJITC9nbGFDVy81U2NvbWFrbTdRVnpmcXVCa2xKRmo2ejhxdjQyL054SmZm?=
 =?utf-8?B?ZkJmd2N4WGZ1NWl0amdzMThtRi84cG8wUlh3VnM5YUxkdnNLMXNWYzB4QmRm?=
 =?utf-8?B?Sm1nNng1dXcwOVlHZFBZV05XQU5NMVZlanRjWWhGT1ZyRDdaazFXWXF2SXhN?=
 =?utf-8?B?WnFiTVR4S0k4Y0dicmIxR3Vwc2xzZDB1WTJ3cmV0NzFYSmZyN1l3NER2TzVD?=
 =?utf-8?B?WmVLZDlLRnIwbWh3SnA3d3c2aVB5OS9neVRSVk03anFjdUxNdmhEdGl0T0ZQ?=
 =?utf-8?B?VTJCRnYvNzhsNkVNOVNIRUgrS2o2MHlaWDEzS3Z2VkR0L0lqZERnV1kva25T?=
 =?utf-8?Q?jG4GfK1X6+JMdto8=3D?=
X-Exchange-RoutingPolicyChecked: eS8n277cpOtNzuRKh5nDWMfMdYtiybUXsYICkDIp9wU/SWUvLqFyi2P07naglt1ttKLFcHgLDMPOzlmllxtcIAiYxror2PnLsIo1UEkeyfOO2D8+K0y260w7MB7mBF1EnJ7QJb02Mz8mqPR8786hbVKf9MCwdT/+OvogxBdrPL/fbWv6XQZOBafHdkmZ5b5nxT3Wv0sl6XEQFl8ensmr5WiFeyijTr9O/gOa8jqMamIksv/gRhNKo5w8NvukDmYYD1u838EOtHGvvOtjKJX66YmX2QxnlBHZfXjuHUmn0gzYCkgWNkVm7PxzkkVadqDSvQx5qYG5UT0XG8wEDSpZLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f60566df-7d07-46db-d07d-08ded1d6e613
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:56:44.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJ7krDeZroYBNOF2Oc+JKQcLitUO7bdwvtnKjEr58YKlCCeFJ/tPR9UJfQxo3VeZn/I0+BRiBcJWpwCBQDXpSp7JuSPL5Hw0QpY3c2zWpXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

GuC can notify the PF that the VF Pause has been aborted.
Handle it on the PF side by moving the VF into PAUSE_FAILED state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c    | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index d9f21202e1a9f..8665b8c5b7336 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -229,6 +229,7 @@
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_FLR_DONE` = 2                         |
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
  *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
+ *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_ABORTED` = 5                    |
  *  +---+-------+--------------------------------------------------------------+
  */
 #define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
@@ -242,6 +243,7 @@
 #define   GUC_PF_NOTIFY_VF_FLR_DONE			2u
 #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
 #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
+#define   GUC_PF_NOTIFY_VF_PAUSE_ABORTED		5u
 
 /**
  * DOC: VF2GUC_MATCH_VERSION
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 65f015d0ede51..82957c596b683 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -1953,6 +1953,17 @@ static void pf_handle_vf_pause_done(struct xe_gt *gt, u32 vfid)
 	pf_enter_vf_pause_guc_done(gt, vfid);
 }
 
+static void pf_handle_vf_pause_aborted(struct xe_gt *gt, u32 vfid)
+{
+	if (!pf_exit_pause_wait_guc(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "Received out of order 'VF%u PAUSE aborted'\n", vfid);
+		pf_enter_vf_mismatch(gt, vfid);
+		return;
+	}
+
+	pf_enter_vf_pause_failed(gt, vfid);
+}
+
 static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 {
 	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
@@ -1972,6 +1983,9 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 		break;
 	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
 		break;
+	case GUC_PF_NOTIFY_VF_PAUSE_ABORTED:
+		pf_handle_vf_pause_aborted(gt, vfid);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
 	}
-- 
2.54.0

