Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA0C61DCB
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E06210E643;
	Thu, 27 Aug 2026 10:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENrKGjt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED23410E643
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787826562; x=1819362562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1GEa51vIQmRkfsqPelwRnZYlzFqQckGnBEq3vuz5QdM=;
 b=ENrKGjt4s7Alb8bnaYApRRvH5U9vifrxqUiPTSbzXmYBh6I7IcOWg7q5
 0hQ6dAIMXyaiAb1rq0juPcD4nR7JDkOTKgHhCyh4KIbA7Ext/3XnMiyXd
 8zMkdXet9VdwBTkpu+HAo3LlJpIwCk+urcRWfaBiLUqnsmEyDa4WEG7Eu
 UMWc3VWzCguTGr4WMbgLSprXB35R686T6U14QSrVqJwHdAXVAvnAVFA/K
 7wrBgGp60WKODixX7HjiFnWte4rbSJiDHLEAcyC+5xtSOg6SQ/sjPDJuM
 gXF+55OUqJGaUmXtwSuOolexosKiSonAq8bhQ3LZ5FXan/BpLokbTvM+m Q==;
X-CSE-ConnectionGUID: 9Guhui8eRwis3JnqZy64lg==
X-CSE-MsgGUID: YctzfAKPQO2a0ld6DUXJDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87266343"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87266343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:21 -0700
X-CSE-ConnectionGUID: MFL9rN4oTtWUZZauTAV5jg==
X-CSE-MsgGUID: SguCZiukRjeZjp3bu4oNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273093718"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:29:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:29:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2DDC1BF4vUOPE6omUsjFFtC4I2iG0Bw+/SKC+/MGG7Jb3XUXKgPR3+oVg29AY3Zoau8VRmtfUCKisjaHqL8RKA01q3MZlp6GGSD4s50Oy9QNrhqovvomR6l7jFZjkYHa+cc/eiaAP77DDGTJKqTWci1U66gnF7ASLxxXc8jRvcuZSUfgzL4YCcgM/9k+yjRuQWGmKlLaalTYYDOWqYnBbCQT3gGFPC4ubxQDz8iFktkGK27escpqr1Xn9zZUctZGQvgL1pNWMiEFs/uxeeCxpVXdQf1h3W67K3exSbo62l3eMRjaQ9ExdCQQJvk9PL8aV9Ag9Ephc4ImtJ3iGNwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkvRaOAG7ViU85/J0/L3BI+cv5S1hsCWNyb3J1x9cXM=;
 b=ar2iWSl8USW5G8/onidkZnD2vehre8P7woFXNl5pTjtHLlgxsXIp4Fd0CGSa2Mqvs0RsejzgMu2/Vs4UjRzgAXB/E9n64ibC+Y6Th2G7BzPYss2EGCqa39VP8oXJTWVOWXR4+Cyt8Sc0n0KfzhMHbGfUuovNNa+pmEeYBEvnGpF8x8PmgYcxUeA8iVUFBQ9/FMN/SG2+kiCrUa88FZ2zVIv4e1kXe6uobsJSt24dk21g8WuFEV775iM7fcevi5u90lQ3dAdjErv8HAhEN+LGG/k23joxyGCVDYpzWVE1H3kXFAJBBuz/EqGEkF1k0qdDM69Zu7Ezi4AJUvh7Eixj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 10:29:17 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:29:17 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Thu, 27 Aug 2026 12:29:00 +0200
Message-ID: <20260827102902.1236918-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
References: <20260827102902.1236918-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d330c6-3da2-49db-0fd8-08df04260c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: HyrhOKuMoW21VB3sbxJgkN9rDkpnbmfbs6brWOaufstz0wUP6suLzk3m9OtQl/cA0Ot50QrmQMPSgppMNDbTjUeA5RJcQjh8F4aDtnHMaziNn+kABIzVcaJyAXL2aqWyHubi1Qg96ocbZz5Qom42GX8330fc0hagb2S5dRf9KZ/4dSMTok5xexw3ytPkIJrH5Uv2KqhecoL3CiSn4ZvyGc7sWzay9QM2gNiL1hx/KBWSS5XCSf1k6nYEXaCWS2OM3/3nDcWSeRY7ukDyJVtA08qtR2Qf01ohb+n9MHeoloM8Ma9UHm5N/l4DR2hESvqmf5D2+jxCZaMESCrsygvDY6IDpslVGhSE4NNS9OK1HvjdInApdZpVNfZPbUZx+q13bcA1Iwj0B1mlniH/s4kOhQRf3iRkFGejFuYs27ha1DVsVCj0+4Y+kXZdG7STmseRS3v9g8r+4dC2plNnfJyEzsLmoHiEj5Nvr7uZ0+6MdnOoVsy0CNwtsmdU11xG3YbAtVYSlZYvpbFd9gD8IRhmWIeCRW93up3w5FwdIorzxJMDUloa2Iacg7r7ixcUHrS1Sgdw5svWqxz6bMMuaSuygUqti5lTlRzjd5/F9q1WTd7JaId56+Gh3/wn0Jle2TpJeL/XnchbIXJLcnth/AeXUjWI7+faRCr0vrvRigzlknE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBHbTdmckx6Tk1RYzA3K0M4YWo3cXgwSU5kMVJESmI3TjRsOGlTT1BVSUE0?=
 =?utf-8?B?Ri9kZm5WVzhOdkliMEdOUVBRcnlLYXo1RUJpYlUvbUNTc2FRSUtYWE0xNkNz?=
 =?utf-8?B?UktNNXZUSE9zK1hOamVaelFEblc4a05rR1RudTc3RHBFVkdXTXFXTTZaVlVz?=
 =?utf-8?B?bENMT1JSbGdsRFhEWUxCRmhWcjRiLytxNWdWRjlvazJWYWRqeXBnU2FoRnN6?=
 =?utf-8?B?QXNXOGRYVnRwTC9QS3c5R25INzZBcDdhNi9xYTBBb3lNRS9ER2hoYk13K1Nm?=
 =?utf-8?B?bnNTemhjeFJQSjRETS8zRFZHdUR5ejZDNGwyb0RGQXVKOGJLMmdHOE50U0JJ?=
 =?utf-8?B?VVJHdldueXZtRCs1L3VIakNCMWg1Zk5hSVhLcTBSbnpKdE5RR3BBb1hZaE8z?=
 =?utf-8?B?TDE3MmtJUm9ZaUpNYkRXbkg2dDIvZ1RRRExnWG9YTUV3eHdUN09lVldDK2pZ?=
 =?utf-8?B?RWZoTGVGY011R0JLSmtIWU92Q3doNGRPZUIyeFVtRE5MZ0JmWUV6cytaTjV5?=
 =?utf-8?B?YzFmeEMzRm1HTFZiUEVVUTIycS9Gd1Y2Sk4vMVZtTEhJaGJuTkw0Y1B2RnNt?=
 =?utf-8?B?bEpCamJqWHYxZWlPZnk5Wk9WMENIY1hZV240WVEvaWZURWdYMWlndkg0eTZX?=
 =?utf-8?B?bXkweGl4RGYyQU13VXZXRFh6NzVEUTFaOW56bDJudzFhcS8xUTI3RXU3MTRy?=
 =?utf-8?B?b2x3Z3IxT2xrVkdHY3VZYVZVeEJ1ZHlwN280VnA2aWhQdFE3NnB6Rlkydmgw?=
 =?utf-8?B?bHhlYSswbHNjNnNaVGtCbVZyYk9jTGVUcmg0Rmc1S3RsdDB0clE1Vk4yS2pJ?=
 =?utf-8?B?NS9ZVnJEdnY4c3ZDS1NjSFY2UTdhdjFIcUY1T2NoeWxSNm9qRW5nUVBiRW1X?=
 =?utf-8?B?UEZ0TzJORTBnZ1VaMGFLRjRPaHVUYVB2VVh6TEp0azhpVmNpbFRnaGR3TzNr?=
 =?utf-8?B?RkhESVdlZ3MvdEU3Z1dScmMwUTFsSXNadXJlMU1mSVVGRDRXRndGYTJFUkNX?=
 =?utf-8?B?K3BsazVLTVl4QXozV2hYQVJJMEU3djBxYUhrV0cvYytnTzlQYWExbUJEQzd5?=
 =?utf-8?B?OE1NTnBjUFI3TVhuWGdqNjBFZm9JU3BmTkJNRkpxYkRNalZraWFOZ2FUNWlE?=
 =?utf-8?B?eFRyZmpTUUtta1VZVm4yOTJlZ1NDaUpLd0JzQVJ0SXJvR0NJY2t2S2Y4djNS?=
 =?utf-8?B?cUdQVWVvTXdSN3AvWGo4dGtZanQwUjVKb1ZyL09EM3dxUmF0YXZDSVo5VCtx?=
 =?utf-8?B?bFBJNWUyTmxWL0U5eFM2Z0xvK2krM0VnUGhBV3ZYb0VudU96MU1mRk9PV1Fo?=
 =?utf-8?B?WHdhMk1RcGR4ZjZ3NzZWUEx5UGVhTUxrc0lHSC9PRTZtUjRMbkxaTEF0dnNR?=
 =?utf-8?B?MFZEcDlaNFBBUEQ4WS9naGd3RGZJMTBPU0hlT0JyRk43YkhVZmtzMFM3SjZ0?=
 =?utf-8?B?R3ZWaGlZbWJyYWZXQW91a21kb0x3VTQ0enBWZ3MyUkl6WDQ0dXlpNndtd0xr?=
 =?utf-8?B?ZE9mMm5HZlZSU0hrLzVpd2MzVC9saWVSS2l1R0M4ZXhRM1NkaXRGdE4xWE1i?=
 =?utf-8?B?MUo1WVlyc283ZUZkb2Y0UDdOdnZzY1JzeTFWMnh4enlOa29qanc1Q0pTcXN1?=
 =?utf-8?B?L0pZQ1FWaSthSVRpVVdtR0toN3VHb1UrbmhlcnFsaC9jbmJBTmhPS1JpS1BY?=
 =?utf-8?B?ZnpRVVhTbzVFRkY3RllGYW1RUnBmcW1Yd3VMcHg1NkRJWTk2YnBvRlo3S0g5?=
 =?utf-8?B?c2ZPaVZ4NzA5ckcrc3BwNzdCVE1CaUFvb0pqWW90MVpkUlBLWUZrR2VhckRD?=
 =?utf-8?B?OGZQTzY4S0ZuMmFycDlqekdpNEJZaDJTSnlpVy9pbVUxUHFjazRHQlBLK0Fr?=
 =?utf-8?B?d0RkcHhpSE5NckdiUUxvMTNDTzdLcFRDYVBLRkV2bjNwSjd1YXNqcVZ1QjZP?=
 =?utf-8?B?MjNYNHd2ckJkRDJQVytsVzN3dHh3RFlVMERrOVRTVGhXcWgwa2gxWFRUcEU4?=
 =?utf-8?B?OWdhczBYc2xMMGs0WXhCQjhrMStScUZkT3FXWmxLWHJVSjdEZDQ0VXFzSFN6?=
 =?utf-8?B?OVNyRERGSmZHUzRxVkF2dG5mMGZoYkZ1NWxOaE9TclBMMy9PM09KVlRiYjFQ?=
 =?utf-8?B?MVQ3bTBOditIc3NnTXpxdWdUY0VNSkE5UjlwQi9FSUgwRVBLWFllUG9ucDlt?=
 =?utf-8?B?NjZwZ2ovWlVyRWJpUk5yeGVkdGxvVXUyN3N4d3dzdjUrN29FbmEyNzJBbCs0?=
 =?utf-8?B?VlMzTjZGakxaQmZBbkE2Zm5jemZ0dUV2SzZIV1lZT0RmaGNkV2xyNytQNkxh?=
 =?utf-8?B?bHp0dVUyWGM0ZE5DZ0N2bG1iUnhTWStQNFQyU2hsaFNMOG8yNmRIN0prbGVq?=
 =?utf-8?Q?e+HUu6XPt4X2Px8E=3D?=
X-Exchange-RoutingPolicyChecked: jI9K2SgHnjJt4UM6tu6FpmoQUHloSko3ajIIKXOVn056pWemf9TdbzcGQrIYZSRRdtXJwFAUHoa7XSdQqhfxHyFxqaE0w2AM9lGGpxBxrvSyqj1fITCbuY5Ww6aDysp/avN2vIVZZYRP9gs78mF+31N4I/cW4nhPD6L0faGA95aeCWV5iVzyVoqYGkbrRJcZhcKXJrPsoX/Ask9nBThSZsNrbcUh/8WCc5WjYuRGy24YFBqVRn8FA1vkGt2YxIvCm5Ltz+ce1NKeyTyESpx3MmCWtMRsQuVFKsaG2tc4g3Fnv2NA/m5OwRyBp9RHT6tT6O4dZLxsc3HjF4u9NXLQPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d330c6-3da2-49db-0fd8-08df04260c67
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:29:17.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhzetDx7kOfWOja9J51X8YuF9ta0ebzAy3WM3R2UHUoNWh5soDOy/5dcGc6nai6yElVnlML0aRCDEO/W5MB1ypcgvr5kh1uKzvTWG4QMpSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).
v3: Guard failed ID reservations before releasing test allocations.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 575 +++++++++++++++++-
 1 file changed, 561 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 78d3de46b757..bf5d2beaaead 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -7,13 +7,27 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
 
 static int guc_id_mgr_test_init(struct kunit *test)
 {
+	struct xe_pci_fake_data *fake;
 	struct xe_guc_id_mgr *idm;
 
+	/* Keep one logical suite: use PF fixture when IOV is enabled. */
+	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
+	if (!fake)
+		return -ENOMEM;
+
+	*fake = (struct xe_pci_fake_data) {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	test->priv = fake;
+
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
@@ -33,10 +47,10 @@ static void no_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 
 	mutex_lock(idm_mutex(idm));
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
 }
 
 static void init_fini(struct kunit *test)
@@ -51,6 +65,23 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static bool require_iov_config_or_skip(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
+		kunit_skip(test, "requires CONFIG_PCI_IOV");
+		return false;
+	}
+
+	return true;
+}
+
+static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -62,13 +93,13 @@ static void check_used(struct kunit *test)
 
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
 		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, test_idm_used_total(idm));
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,12 +107,43 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int usable = GUC_ID_MAX - 10;
+	unsigned int shareable = 20;
+	unsigned int spare = 11;
+	unsigned int tail = 10;
+	int usable_id, tail_id;
 
-	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
+
+	/* spare is larger than the overlap, but the PF-exclusive range is free. */
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable - spare);
+	KUNIT_EXPECT_GE(test, usable_id, 0);
+	if (usable_id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	tail_id = xe_guc_id_mgr_reserve_shareable_locked(idm, tail, spare);
+	KUNIT_EXPECT_EQ(test, tail_id, usable);
+	if (tail_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, usable - spare);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, spare), -EDQUOT);
+
+	idm_release_chunk_locked(idm, usable_id, usable - spare);
+	idm_release_chunk_locked(idm, tail_id, tail);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
+	mutex_unlock(idm_mutex(idm));
 }
 
 static void check_all(struct kunit *test)
@@ -94,14 +156,485 @@ static void check_all(struct kunit *test)
 	mutex_lock(idm_mutex(idm));
 
 	for (n = 0; n < idm_total(idm); n++)
-		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
 	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_limits(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
+}
+
+static void check_overlap(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
+static void check_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_release(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int total;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	mutex_lock(idm_mutex(idm));
+	total = idm_total(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, total - 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int rest;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	rest = idm_total(idm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
+	KUNIT_EXPECT_EQ(test, id, pools_size);
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, pools_size), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, pools_size, rest), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+
+	total = idm_total(idm);
+	shareable_start = idm_shareable_start(idm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+
+	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
+							       overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
+							       nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_usable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
+
+	mutex_lock(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_GE(test, id, 0);
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 2);
+
+	idm_release_chunk_locked(idm, id, 2);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_shareable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 3);
+
+	idm_release_chunk_locked(idm, id, 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_used_mixed(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
+
+	mutex_lock(idm_mutex(idm));
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int shareable_start;
+	int id;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
+
+	mutex_lock(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
+
+	idm_release_chunk_locked(idm, 0, 4);
+	idm_release_chunk_locked(idm, shareable_start, 4);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap, id_extra;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	shared_tail = idm_total(idm) - idm->usable;
+
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+	KUNIT_EXPECT_GT(test, shared_tail, 0);
+
+	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
+	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
+	if (id_tail < 0) {
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
+
+	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
+	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
+	if (id_overlap < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	id_extra = xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1);
+	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
+	if (id_extra < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+		mutex_unlock(idm_mutex(idm));
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable);
+
+	idm_release_chunk_locked(idm, id_tail, shared_tail);
+	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+	idm_release_chunk_locked(idm, id_extra, 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	mutex_unlock(idm_mutex(idm));
+}
+
+static void check_shareable_spare_fragmented_tail(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int usable = GUC_ID_MAX - 50;
+	unsigned int shareable = 90;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int count = 39;
+	unsigned int spare = 10;
+	unsigned int i;
+
+	if (!require_iov_config_or_skip(test))
+		return;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	mutex_lock(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	KUNIT_EXPECT_EQ(test, overlap_size, 40);
+
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_set(idm->bitmap, 0, 1);
+	bitmap_clear(idm->bitmap, shareable_start + 1, overlap_size - 1);
+	for (i = idm->usable; i < idm_total(idm); i++) {
+		if ((i - idm->usable) % 5)
+			bitmap_clear(idm->bitmap, i, 1);
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, count, spare),
+			-EDQUOT);
+
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_clear(idm->bitmap, shareable_start, 30);
+	bitmap_clear(idm->bitmap, idm_total(idm) - 20, 20);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 30, 1),
+			-EDQUOT);
+
+	bitmap_zero(idm->bitmap, idm_total(idm));
+
+	mutex_unlock(idm_mutex(idm));
+}
+
 static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
@@ -109,6 +642,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
+	KUNIT_CASE(check_limits),
+	KUNIT_CASE(check_overlap),
+	KUNIT_CASE(check_overlap_alloc),
+	KUNIT_CASE(check_overlap_release),
+	KUNIT_CASE(check_overlap_partial_init),
+	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(check_used_usable),
+	KUNIT_CASE(check_used_shareable),
+	KUNIT_CASE(check_used_mixed),
+	KUNIT_CASE(check_release_usable_range),
+	KUNIT_CASE(check_release_shareable_range),
+	KUNIT_CASE(check_split_boundaries),
+	KUNIT_CASE(check_shareable_spare),
+	KUNIT_CASE(check_shareable_spare_fragmented_tail),
 	{}
 };
 
-- 
2.34.1

