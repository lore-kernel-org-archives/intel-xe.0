Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48394C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0881F10EA02;
	Mon, 20 Jul 2026 17:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrZSt3g9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3310EA02
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784568845; x=1816104845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RUsvfIGwUFbmz02YZkfVgsT0BMWCi0LT6+tLrb3A8J4=;
 b=TrZSt3g9p2f1xGqKekZIULKA0G9PAdpNwbD4BlH1ThL/A7FcFE4X4EAC
 23PtoFy1SdRlsPgKCHFYyo3KUMb++5c7MD52r/ie9e15H+/nl1u2vP1KI
 kmKoS/l6PjHJuau+avM+HHFzof7cgtBCiFAXtVKO2nrEC2pfhlR7uqWVB
 7HLpwGSZrz1Zz9uzfrMH0uury5VoLY3ea1OLiiADITelrrTpeddDPmd0m
 cizRTipTLIhnMhf+EjPo4FWFWvfJm5CxKsnZuDM9A1t6omLofmpvvVT4H
 V2nGNjTcuszck5ux3+6svvJTrIQ5YTDsqdSO2Z2toDOyd69//WM4we7WZ g==;
X-CSE-ConnectionGUID: G9+24roZRIquhp4yBGYMYw==
X-CSE-MsgGUID: oUSIaoAOSx60J7tuwrtzxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85276128"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85276128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:04 -0700
X-CSE-ConnectionGUID: Y3cTiMwLSDSy1dtqD3Gqzg==
X-CSE-MsgGUID: df6gE/K0SgaVP3s05OocdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254890153"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:34:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:34:00 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiC6FlKaj+kznaEWWZCKJKFAuytf64RaFknpPDuOnKYfL4aGDjV8EilZdmnZkM8Dm4n12w2tI7Cy5RUxG1sGlV7yOjpKOtYy/3boZqBu2IP8xHxoNDadEgpaBuL978mM0nSxcJfBPk9sD12VgnK0Kn0qj+N83XgU2KhqriuN2ciaBR4lsWG3aQmG67D5tKL81z6hAlyHSaPJLpSaWJsXgLQ0XChX1nR9dbWNLcL8cn2eCF6+Xh8120gvyX+G8V9gyL5y6bWSSBn6CKn3JmaRrlVkgixqg4qZiHX3D9bHO9cgBaxPAsU7bBhUZEZcGJMnlWsNhtTqrP7xXlOLrs/VeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfNOP1Hi3EzHyPipRJB/iZ5sDWlVmDMVm/6zExCEgb4=;
 b=AXyV3r1y9ndHUs7Djm2OOubK8fxlRMw9l1JpEmhiVg5BKbn8rFmvE25RMmUfYsJQ8miqmE4UJ6CoMV7QYwuqpyi8bkxQFXAkQYGPN+ZHm3hdb+ks4hVW7JCghbxSosXDC8+pUxYPyjEE3MxjC5tkHppvQtCxuJYIjvYXzqY5NtDuW0OkUSaK5dQpimy4f2aP0J/ENnGifaVeWZtwfg5SZP4J6qPlqig9TdEptfueEABwMQuMdE2J8GXeqynvR4SGEy9Za8/WzXZujwvVJlk45U5aDFukuLc45qtvvh4EW9wmndnr5QyGRP55jItAf8oZA61NvIc2T5y+o/SCtgH09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:33:57 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:33:57 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Mon, 20 Jul 2026 19:32:41 +0200
Message-ID: <20260720173244.3935848-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
References: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0024.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::8)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d037a3-7e49-419c-7dca-08dee68513d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: L5E4Vzhgy4rgkbYzPCVvAiKuUHhntXba9mS+Yfx4DYN2yaqqD9aiLETAJQQksI6qfROW5hWWNyB5gU75X0HUFQbffOYyfnS8V3A7K8W8cWle/F9JXrq5kxYdKNln8kNm1SnhERHr5pAFVMtLH5r/U3n9OQKIDz9HiV99dytL88ZIh1eizpKk89pdSWsFeVItxqNTAracyK55SFvvEZ2wWJtESAB58aaJnTH7Lty4TWUff25oY86CLtG1nnwUXpVo+V8AKY3qg7XH99hN8/vLDAZOxFtaUhvb2iFSWqWjWDkKMnTOGswdb7X/zC9CDn5EhY+CZOdrgnspPKZAPNW5bIDI3HWsvvCE0FC7kv5PgyCG2fQZoqU2zoqzLJKt37PdcMFm1w0W029MjapXnXn0ARPgrWbmmBpsi0FMMl2MS/A22e5XuQF43M7A3g+BybryYwyzJq41oCFI0H2j6sPMFu4IjSIJ2eUEsVpYYFscBcjdrnGzyrxyIqXZzITN5LrbIaVy1xTXVKoGFGc4kncLrUk11E9y+ehUOes8NRtQ1SPjHdDTfSHzs7HKLTHWOhqDKjTOE/fpImqQtRnQe3CQXGTWwdKvjkr88Dsd2I0dJAanEPQGucNcStRuZcKCM2otCfifBXGu9GItoR2EZt1acOgUGCK4on6Sazhte+qX7RE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZlQ1ZwWTl1QkNlOWt4ZTFoUTBIeVYzSkpGNGQ5NHc2MUhnM1pYaWdVY2Y5?=
 =?utf-8?B?TTdsL0RNVG1iOVVqMUQwbkRZclJ6ME9XL1ZDdWxuR2JXWE5LR2JvaVo4bFNW?=
 =?utf-8?B?alhlY2F5UUNjN29iQUNNQThndmcxR3ZqZDZWVUExQ2xzd29jU0FBSzFwbi83?=
 =?utf-8?B?U3NtNHgrSGVHbi92NXQ4MFRWbk5GcWNXWm5ESC9kMkxwanFqVEdWclhVUHVy?=
 =?utf-8?B?cThORFpISy9iSjlGd0gyQVlJRStaVVZwZ0pYbmM4SXI0Vk1pcFE1eiszdnNx?=
 =?utf-8?B?WVZKdjd5MTNFekQ4SVBEOEVSbnFhcFRObkxtNllPZnM5U2lyZnNRTmZQc0pN?=
 =?utf-8?B?TnJaVUVKZkJzeS9mNCs5N2I0YWtpekp4TjNTcEZmc3l2R2tqTUg3ZnFvSnlG?=
 =?utf-8?B?QnRrSUduRXIvTmh2UXpnWkVYbUswbks3ajNkMmw2cHNSK0p6VlVyR2wwaXNY?=
 =?utf-8?B?NHh2K3BRSUNjKzFMWFlYQmswWElVdW5jZHJ3OXNwaUF3VE1uSU00bkYxaHhz?=
 =?utf-8?B?bVZPTGp0amtzRGhRT0M2bk80ajVCSnpBRTlleWlRcElPYWl1N2tMNnhoUTl1?=
 =?utf-8?B?cnZOVk1oZWhMRWo0ZzgxMXpHUFJoajBDVTJrcTdwbVZRMEZUVlRJN1FYazVy?=
 =?utf-8?B?ZGhMekFBS0x5bGFJaGVubnpKcGZQRDZzRGt5L3ZqcXAzRUFhazFJOU5kVTRB?=
 =?utf-8?B?UlhQUThCZzNrZ1JtT2UwRkRmeGM1MHNZeVJNWEhBRkNXNHVYRTZhS3NjTjUw?=
 =?utf-8?B?RVYzRkJSUEh4ZFBvMGNuT3krZEVnRTNkOTZFWnFYU0dUeTh6U2pybkVrcFRT?=
 =?utf-8?B?Wk9oSGtEQm9nQmdBNkdCNW5DTHNSK3JCK0VIR0o3c01CRjMyb1JXRXdUZ0tM?=
 =?utf-8?B?Qk1mZDFrb2NtbFJGSlJraEwxMlQwdHRFYWtBMFZFUUJ0T2Z2TkdhbHR5aTFP?=
 =?utf-8?B?MkZXU25qdjFmajNmS250SDlUWjNSWUNoTTB6MG9zd2RmY0JveVdtMjRZdTlq?=
 =?utf-8?B?TnB1MVNZY0dUSVRabnoreHpzRElMUXpWaXVHMitQSGo0WnVBbnZCc2tRNDdp?=
 =?utf-8?B?OWpaQm1xOUVJSytxTmxudXJOMlgzY1p5RHFsOFZYM3UwbVFkUDNkK3NhMDFk?=
 =?utf-8?B?UTdTUUVIKzh3Q0o5aDFFakZpdEtGTW9TYXJRb3VhL2dPMEQ5d2hNbnRIdUQr?=
 =?utf-8?B?OUVGeldYKytnT0lIaVQ0V0ZNUmc5V2dNaU1sUG9yeUxHRVBZSnE5a1FCT1hB?=
 =?utf-8?B?NTlNb29ocFJSVkJvUkF6a01NempaV0hoWjFIRnZ4YXMyZ1dsVitRT21jZGt6?=
 =?utf-8?B?THVKZ0lXeWF5WTVMZjRaSjh1MUZ2cjU2d2QvbFRJcHRrVS93ZTU2QkVmRC80?=
 =?utf-8?B?dlgrQXpJK0M5SW9BaEZaTml3TCt2R0VtZWpvYWxaUHUrUi9QNEFMWk9XWHdR?=
 =?utf-8?B?VTBCa1lnQ01mZ01BM3l0aDZVNldjWTNpT3JPQjFGeW1TZnVYL0dNUXFIY2ZP?=
 =?utf-8?B?RTZXQkV0a3MzTHFKaS9ZZHZJTG1kalVCRDJHMkpyNnUvZy9RTmV1anY0eEZG?=
 =?utf-8?B?K3V0K3BXc1Y2OU1UMXYyUnZuUkhlOUJGcC9OaHNZcCtHTEVVMGRTaGdOekls?=
 =?utf-8?B?Zm1Bby9UZzNPVlRXbG4xdlJuNldBMHcvZzRiQmFmQWdaNnVERnRPT0FMQmV6?=
 =?utf-8?B?UTBtY29YeDgyaU5oNzlYRGdYVGNIL1pxWFhGV2x3Qjdmc1YrR1F0QTcwQ09q?=
 =?utf-8?B?TWVqZ2FjNlRMbGJ2OTIra0d4aVJBTmh2OXYrcnlLTnZ0V3NXemc3aHFwYzBw?=
 =?utf-8?B?bWk4c044dlcvQjRHclRuenpleGFjdG1NUjJYQUY0MU1Ncm9qQWhKVnVMMEw1?=
 =?utf-8?B?VVBGUGplYm5nUndZQVVQSHpKZnYrcGFJNnJoKzhQUTlJUW1idjJ3Y1N2K1U3?=
 =?utf-8?B?Z3hsV1QrbFFBVjFkeUpQTm1SYlpyc3RBRmUwbDBDbmo1ajZCbWg1cHlIU0x6?=
 =?utf-8?B?YnlJZzZmN1RQcE9mN0ZFYnBXUlBvMUttQ2dDbFc1MlVZbTk4VFByV01lTTUv?=
 =?utf-8?B?ampmdkllWWZyM3pPTVVwTUQ5SkZ3M0V5akZac25EU0s0NnZkaUJkZGd0ZGhJ?=
 =?utf-8?B?WWtUZFlWVnk0aVJXTk14RjJtZU1xK3o5MWVLMnkxOEx3TGMwN1dQNjFXVThC?=
 =?utf-8?B?a0JIOVA0MXpMNlQzc1Y4bzlKaDB4eGtaUXludjRiYkl2Sm1mVWlkZEUwanZH?=
 =?utf-8?B?dmhkYjQ1T0hQK0toYm94dlVFTmdMRWgxbnQrNDNIcDFYdXArZHNpaVhQS2li?=
 =?utf-8?B?T0hjM2o3WGRtblJFQlRaWGhsNkgwVjZLTGIyRzBmdWJTWTVxeEZTbXQ4cnpj?=
 =?utf-8?Q?pU8GZPleBoc1nwEY=3D?=
X-Exchange-RoutingPolicyChecked: NbHM3HC7XwdytBORGQhQUMTW89gpD8yS7rQ1+LCZDdMaQ5B3NR23/ugo2GUWITuaY1jyaB6M0mgzG2HgsF91WLktLbZrsJCDvUb7Me58Mc6CtsHMsu3ikWREhTd7uIK1zfZHXNr1dW8XXhLYCDZXUi5UxaEradWa0Xk2OGs8yYT8bdNX1z3s3nkJ9Hrz4MKkqBNYp5Xn9v+X3Ne8SLyyY2+e2yND3JyUw4bfzurWKQz5VKfjQatofYZWv2LoeEy9vdL4eIXO6/dhlMQJOBFN8aosDPmZtIqvomddeiTQDIVqOEXyaqmy70xiIytQ5JoAo6P+iHTCm/URHFDhxHjypQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d037a3-7e49-419c-7dca-08dee68513d2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:33:57.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRxXbIwl1FagxgzRXhWCepEhW7f3cyOc9enSDIMGir19MGkBjlxquTXbMpCyEhw9I1fPZ806QnifAQ5qFLyIKNT5wEVmtKU6I0ryxx64GZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  52 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 437 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  18 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 426 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..103ea82d278e 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
+		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n);
 		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_used_total(idm));
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -78,21 +78,25 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total - 1; n++) {
+	for (n = 0; n < idm_total(idm) - 1; n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
+		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm_total(idm)), -EDQUOT);
+		KUNIT_EXPECT_EQ(test,
+				idm_reserve_chunk_locked(idm, 1, idm_total(idm) - n),
+				-EDQUOT);
+		KUNIT_EXPECT_EQ(test,
+				idm_reserve_chunk_locked(idm, idm_total(idm) - n, 1),
+				-EDQUOT);
 		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
 	}
 	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -102,14 +106,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
 		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..b4f4a7aa21c7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1147,7 +1147,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_shareable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..7e3e85225839 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,41 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
+static unsigned int idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +76,60 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX)
+		return -ERANGE;
+	if (shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, usable <= GUC_ID_MAX);
+	idm_assert(idm, shareable <= GUC_ID_MAX);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -75,12 +145,6 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
 	else if (limit > GUC_ID_MAX)
@@ -88,70 +152,122 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	else if (!limit)
 		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, IS_SRIOV_PF(idm_to_xe(idm)) ? limit : 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	unsigned int found = range_end;
+	unsigned int rs, re;
+
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
 {
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!idm->shareable)
 		return -ENODATA;
 
-	if (retain) {
-		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
-		 */
-		if (idm->used + count + retain > idm->total)
-			return -EDQUOT;
+	if (shareable_start < idm->usable) {
 		/*
-		 * ... and we want to reserve highest IDs close to the end.
+		 * Spare is meaningful only for IDs that are shared between usable and
+		 * shareable pools. For non-overlapping pools, shareable reservations do
+		 * not reduce PF usable capacity, so there is nothing to retain.
 		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+		if (spare) {
+			unsigned int used_overlap = bitmap_weight(idm->bitmap, idm->usable) -
+						    bitmap_weight(idm->bitmap, shareable_start);
+			unsigned int shared_tail = total - idm->usable;
+			unsigned int used_tail = bitmap_weight(idm->bitmap, total) -
+						 bitmap_weight(idm->bitmap, idm->usable);
+			unsigned int free_tail = shared_tail - used_tail;
+			unsigned int need_overlap = count > free_tail ? count - free_tail : 0;
+			unsigned int overlap = idm->usable - shareable_start;
+
+			if (used_overlap + need_overlap + spare > overlap)
+				return -EDQUOT;
+		}
+
+		/* For overlapping pools, prefer allocating from the end. */
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+		if (id >= total)
+			return -ENOSPC;
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+		if (id + count > total)
+			return -ENOSPC;
+		if (id < shareable_start)
+			return -ENOSPC;
 	}
-	if (id >= idm->total)
-		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +276,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,7 +287,85 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
+				    unsigned int count,
+				    unsigned int retain)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm_total(idm))
+		return -ENODATA;
+
+	if (retain && idm_used_total(idm) + count + retain > idm_total(idm))
+		return -EDQUOT;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm_total(idm), 0, count, 0);
+	if (id >= idm_total(idm))
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ * @spare: number of shareable IDs to keep available for the PF
+ *
+ * This function is dedicated for the use by the PF driver, which expects that
+ * reserved range of IDs will be contiguous. The function expects that the caller
+ * has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -205,6 +398,75 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 	return idm_release_chunk_locked(idm, id, count);
 }
 
+/**
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * This function is dedicated for the use by the GuC submission code,
+ * where submission lock is already taken.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of IDs to allocate (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve a range of GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of GuC context IDs to reserve (can't be 0)
+ * @spare: number of shareable IDs to keep available for the PF
+ *
+ * This function is dedicated for the use by the PF driver which expects that
+ * reserved range of IDs will be contiguous.
+ *
+ * Return: starting ID of the allocated GuC context ID range or
+ *         a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
 /**
  * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
  * @idm: the &xe_guc_id_mgr
@@ -242,24 +504,78 @@ int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first GuC context ID to release
+ * @count: number of IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +586,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..b2b4c1212a8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -11,11 +11,27 @@ struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 31a2acb63ac3..85069febf7e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

