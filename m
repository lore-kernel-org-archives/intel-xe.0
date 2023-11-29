Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BAAC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6464910E6A0;
	Wed, 29 Nov 2023 22:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB49810E69B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297404; x=1732833404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mHo+n5jVd13OnbVoGTCn4dE5s7ZJP1eVPaBXgzYFc/8=;
 b=V8zFC8s21c56uzVuZFo817ncoeZeAQqJxY89P1CbvgPXJgup7wmdqWmp
 JfKgX6A3nsZyN2clfCUGgU/1lAAN7lLSryBkFqCLR7g4CN/bmW9MUiDtX
 iEwOAhfG7xMbBP3xgLt8MFJQpzxR/A2pY4CZPd9iJsVF//CRaU0akBwPQ
 DwL5fZR8qkAZIEEHaazUBjzU66EqcvShLhlViPwvaQ2eSKUSTXwv/NT/y
 Rg+JxQwh04ux7SoC4MitM2e2sWKvB4BFbzzNe5WwOppo5x8NN26ISEBfX
 h6uM+c1x5HdlDUyvchr4cFgDOwo6IdnRqHdiweTw9pi1FePiyb6RKDpAL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219825"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219825"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418359"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2/fF/aBXq5iTMGSKEy3yHsceTfMU4wG6scmpAvaffW8EktURYHePURx6Fpo+7ZX3cMPEwBuaF7Ob/Dt9/cVpMa+2E5QJlAVaozOncNZbKIdztYljgtnlGzN+6kD5Fqw6wE2wJJVIdXYddMJew/WQ8mXf/wtQK7syG8SrKTs0I8XsoFlbecSOBRUgYCVTfTT26mSf3Nz6fWCQIZXoiI3wERhs5iuL1z0iQTFKb/QYCTFvxS/HXNRuwFo0jcJ6AM6B6/QDhnb8DAjoxSolswjn8OmtX79Ydq3fuInTHnwJoK2thvIAw1WCTe0L1zvuYxzsNa4mqr7VPDVw+Gw8PKz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRoq7yvNomNNwT01HAbLk/W+u6lTdYKVLsxQy99gAHQ=;
 b=ci77yE1i/LePoog2HghfpftHd/1KWRIPYogTbTl3rtovbXrNsa2envxrNtUUsk9b6UW6RJQuKxZjYMWfL0+jdn4twE0skvMM7Tn3K0U1rHTNMINHJomZehbdNRgNgc26+UYKE5o2SGb3DUJfqY9DvrOHJOXEhphk06c+RvjhHeNsYwzuFo9pX3q+DKEms0n9ptGUJ+sWjIFL/kWylVbcIcqoTGhTKBqqNWFMcGIobvRzGYyb2tCL4n5xEz2y59sjyX/DH9bPL0OKOLuGIxx4U8mGK7yKWpSSsZaRDvwKNxtSt9KgxjfqSoG5kfMifV6Ngh7fJTCLMZYdIWRV/QX74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 22:36:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:06 +0100
Message-ID: <20231129223508.1189461-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 088b529f-d751-4fef-f102-08dbf12ba608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2s6gXNEWlieEV3dzXNsdHedEdBpMpf6qllm6/n6EjpOoTOXD5plncg9Fw3zzhk2Ko0twu/RZplkvfjL1/dk1aCXwbTWkVRSUJ/CxjGeYdvrcoxPG6ksFyqGc/uNUhM1uOTCDKP5bS7yabR/AWonOzsI02Fs3Q6xN9h8TN3unAeK7kmjZdq9/28H7NG+2zROQfM5DbXmMWL3v49KCv6s2jKFR71qFxyjx07j7wzQWJWyfGo9WWJ9/Zqvgyx8XbdXrnrPvi3x3cTOu7/FVvtk95y0cazmuy/eA7jh5Mwgrzlz/2gkEL9tyrglXsb2kQ2rZ51gZb5FdMxJPDdMUe/RGPk7Q2OVqWEXZ9rD/rjy4xSPUrkeGuYFSoHuAXrt0M35PhlYW6zWL70bxWxvB0ZQ93IGixjfGAIVI2XqqrxrOhptPPUKGnZ9DaD8ntLKmyXsI7dFMS5EkEIw0JMAUYjEtPW47ir30v/PIjoqJfbjlOWixEun3mojrW+JFjHQob4rPLPwSjxKzyq4nMqlmHe0rySDzBjgmXuJys9IVjvLh87l9M7qsGZzDf/+hF8sLztGwvmJBo0q5LiXkJmay55FdcrUsv6dvA+BaH5MhgdZ8WkXV9h/CD1+z1472T3SAe4mps6NufGkVwXVT8gmlDvTcDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(2906002)(6666004)(5660300002)(1076003)(316002)(6506007)(26005)(2616005)(66476007)(6486002)(4326008)(54906003)(66946007)(6916009)(8936002)(36756003)(6512007)(66556008)(478600001)(38100700002)(82960400001)(83380400001)(8676002)(202311291699003)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGR3RWFsNWFpTHM0WmtNaUhXSEM1c1RLRnhlVVdVZHMyN1dGaENDcnRKYk5w?=
 =?utf-8?B?UlFtaHRIWFE1TnBYeERHb3dneU5vWFJMWnBHM3BvMWlFZVhWaTloaG80cEcy?=
 =?utf-8?B?VG9WR2FCeXlGQXVpcE9hMDJqQzJJZ1NnYmlETVR5OVlGMVBUbzJ5V0VkTGNr?=
 =?utf-8?B?T3UwbHFJamVyYWJhb3ZIRUgzK2JoM002OUlLMmNyNXFRd1RJSDZ2aUxWd0Vr?=
 =?utf-8?B?cGxKb0V5eGswSjZLQi9KVktoNEZrSkI1UDhtTGl2cTNTUFlCVnVwanVvZjk0?=
 =?utf-8?B?TFpFdGV2am5OZkFCdkNBbk43V3l1aXlwam56R24yeG16bkhqTWFvSHJBTDdr?=
 =?utf-8?B?OC9tb3YzNFQwanhudFFQZ2lVSnl4NGxnWTJ1bkduL0pkWWRrZEh2d2Z3aVhk?=
 =?utf-8?B?SUhyVEtJNUFjOWJNenViR3JIanBWR0hzTTZPakx5RU9WWG92UEg0cjNkdUxV?=
 =?utf-8?B?alYrQVdSUXhhbE9aWjNUWlQ1UmVxS2dLQUJ3SU5MSTAxeVdoS2RIcjZ1dmVX?=
 =?utf-8?B?RnkvWXp0NUpBUDVEUzVrQXEyVFU3Ui9QdXY4ajQvTk9aNXpEWVlwdmdZdjcz?=
 =?utf-8?B?VVpkT1U5YTQxMDkzZ2c3c0EyQ3Q1SlVXdytqUXRaL3dKWFU3RktIUzl4dExQ?=
 =?utf-8?B?bE1ZdU01dW5xYm9sVExIU2RndFJoNm9xaTJ1NmhNMFJrbEJLdmZ5R1VoVFNI?=
 =?utf-8?B?Zk5scnYwamV0cThCY2NFYldieit1UEFCY3IxcXArdjlNYmNWaVI2amo5QUl5?=
 =?utf-8?B?ZGdIblVLSDkxa1h4UVFpcDNVOXV1b0paaENPRmNoeThhaXkrYlhqc2VJMHFU?=
 =?utf-8?B?Tkc4R25lNmRqUzdOUmR0cklld1R4MWJhSjJXYitsWE81Zm1NaXNlWk5OZEU3?=
 =?utf-8?B?Y0tFM000MFVuVW5BRVhVckVCTGV5cWRuc1NCc1daRnlUejZBMnZNbTA3TGZP?=
 =?utf-8?B?T1FzZnNBMk1qcTR2TnJGN0tDMVRzcnQ4ZGFISVR6TTZmRXd4NzZtR0R2TXdw?=
 =?utf-8?B?YWc5TzVEOExaSDFmZlJSZ2JLWm93WVNrNjFxSFUzdzNsMnZSSEtsWEZ1UnZ3?=
 =?utf-8?B?K3k4YVZoRzl2dHhXQ0d1Tnk4THF2c3BmSGNTcmNwQlBCbW1NTEJVSXJSZHRj?=
 =?utf-8?B?TVVhTlV5YkdsdnpMNW5VQlhSSzE4Sk9ETS92enVDMjBNUG1LTGUxR3J1NllR?=
 =?utf-8?B?UGdrUkVTc056RnhuelRqWWFrR051U1Rkelc1Vno1OVR6djdCMkdndDFzTGtX?=
 =?utf-8?B?YVJUQXVxTGNDOXFBQ3p1Wk5XY3pRclBrdWJXWndKVURMVGhZeTc4L0t5MmJy?=
 =?utf-8?B?VWpuN1JKM014aDBKSFdaVTYzcGU3SU9NQ0tjMFZJUk93d0ZzbktoTC9UWHRB?=
 =?utf-8?B?VndNc01JcEhIMGJzRHBGL2t0WDlia0hHT0k1WWxDSTRBNEU0WjFOT1FTdk1F?=
 =?utf-8?B?NWR3Kytma3l1Z1NSdy9xQjVsNjhiKzV5QnNYYlc1MnBsZDdRQXVWYTFGY2Fr?=
 =?utf-8?B?N0xEV1dDbUlnc2IxRktmQnFXU3UzNDlyRUFRQ3hyalFOVFBoSkVRUXFWaGM5?=
 =?utf-8?B?eGVWS1BnMzhHelV4SHp4QnlSVTJlTFdKOTVGTjdxTGtSb3VSZzVaUXh5MHJ2?=
 =?utf-8?B?djJ5cGQ3TytSc1dqc0EyOHJCQ2lRQ0VlZEdVeXh5WHZZWURwVDJ4bllhWC81?=
 =?utf-8?B?UFVza083aDlCWnBYY0UyQjJZbXJwYmdBelNhQldnVldhTDRsT2FSSVovRW42?=
 =?utf-8?B?akozYjVrcWhKNDVsSUF1bnlaYjFKTGloT094clRIQ3BONnVwUytReHduWGpa?=
 =?utf-8?B?TzlnSHJNSWNucUhKQU1FcUZ4cHA5QXQwRG0xaTVFUHRQYW9kV20wV0ZvTENH?=
 =?utf-8?B?VkpLb04wYnoxZURUWXV5L1liemlqSGNxMkFNa2VrM1gxdlE4S3lBam5LeGNi?=
 =?utf-8?B?NklzbS9WVjE2UEwvZlVDUWV3UTBqenVIRmVVTWlyMHhzcmI3bWVsVVR1QmNq?=
 =?utf-8?B?eDF4eU1GeFdDeGg1dUhQbTVBMTdFMzJBOGk3YVdBVnJ2cFZRUXRLdmpwMHdU?=
 =?utf-8?B?ZS9QVmtqZEhqOSt2UlNjblVzSk5iTzRaSGpqbEN4Q1BzZ29QemhxSWZua3R1?=
 =?utf-8?B?ZGFUY2lsK293TUt5cWZvTlZxdHJWVXl3MXpKVHFBZUxJdUxIWkliQzVBQ0t6?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 088b529f-d751-4fef-f102-08dbf12ba608
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:37.5405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMT2rwsgOKygh8CLI09FHxQKMouXiGkgd96fnGwebbfcQjp8jr3YbzzPZWTDhjbZ9XXUM7Z8F/q+PL44H1QCjvTvH08bQhPwgsNymMDOSQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 21/23] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load if needed, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v3 -> v4:
- Assert that realloc transisions from RAM to VRAM to make sure
  iosys_map API is used correctly (Lucas)
- Fix GuC resource realloc by introducing drmm_release_action

 drivers/gpu/drm/xe/xe_bo.c           |  5 +++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
 7 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a7fe62de8122..f8c744bd148c7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1566,6 +1566,11 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 	return bo;
 }
 
+void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo)
+{
+	drmm_release_action(&xe->drm, __xe_bo_release, bo);
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 098ccab7fa1e8..797d621075bd5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -119,6 +119,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 					   size_t size, u32 flags);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
+void xe_managed_bo_release(struct xe_device *xe, struct xe_bo *bo);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 482cb0df9f15b..b85defa941e85 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -241,6 +241,48 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
 
+static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_bo *bo;
+
+	xe_assert(xe, !(*src)->vmap.is_iomem);
+
+	bo = xe_managed_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size,
+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					    XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xe_managed_bo_release(xe, *src);
+	*src = bo;
+
+	return 0;
+}
+
+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
+{
+	int ret;
+
+	if (!IS_DGFX(guc_to_xe(guc)))
+		return 0;
+
+	ret = __guc_bo_reinit(guc, &guc->log.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ads.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -299,6 +341,12 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	int ret;
+
+	ret = xe_guc_realloc_post_hwconfig(guc);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 2f5ff090aa6bd..61b443981f99a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -272,7 +272,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 24a33fa36496a..316e77362a825 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	primelockdep(ct);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 2a13a00917f8c..ea49f3885c108 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 		return -EINVAL;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081d..45135c3520e54 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	struct xe_bo *bo;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
-					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_SYSTEM_BIT |
 					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.0

