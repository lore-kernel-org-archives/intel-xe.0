Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A9FFEFB78
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 18:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B110E126;
	Fri, 27 Feb 2026 18:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZO6PhXZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21D10E126
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772217334; x=1803753334;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=oUI2XC3jzhXBhQk7or6lM38GyI0S9rlOz2PJgTROVBw=;
 b=ZO6PhXZTye1O6u5oHH58t68N72eH/ZkNFq6MV2bPgRZdv19xExY+5gvx
 eT2kqK6kQMFrHoAF4wB8+xDvjfHl2JFV2brjDjBcB5YXFZ/hJq29jWubP
 Uznm0SDUNV9zAmE27zOyPgn9FDwaJiOJWs/gx0xcEeqJenMX4rwJ++9O9
 NkxK+nL2KIHGYTz5m60ly81XgCe4YoZnOAmLOPMvukjIl1u+zSxXChTXq
 DyOPiJ401YqjjG/cfDc5u7Lxh1HVoiXqHcDDfAWvscrp/5H5XWFwtQfWM
 wna4UnbdZV+6hT5KxVa7EzEO9ix6z0piijpw3sm7BZif3UiHAXMUQDks4 g==;
X-CSE-ConnectionGUID: i8l49wa3SUahB2IRlrOvcw==
X-CSE-MsgGUID: wrjV2tR2SEG2v2UNvE6mKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98774923"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98774923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:35:33 -0800
X-CSE-ConnectionGUID: 9Fd3rRp7S6qap7EIBOTE5g==
X-CSE-MsgGUID: kebrLDSsSVedccWLvheImw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217002493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:35:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:35:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 10:35:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:35:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BP9FD204FOUdd8L5KMfIZisihtgFkWHmj3JotWwLFliK+xspz+PScwkljxw55f8MkV7i7cnVcQlhCyxbQbtJs8sKxoGIfexGvNWyU4w5eH+fxg7/Fr0kwUDu+JcP59TBN+0A2wkpAP99Tsb5Y6wRMCAAwuBQorDjuF/EqW/SshL3fEmMh88dUOa0eywYYy+Luf5HIi5Sv7WD/S15yxoIMbWT9HEFQTMVlSepDgCCj3eo6L8QVKHgrG4QtRJKgEIHmG38otIk9tljm06nJML+DRUXsHbABNprWSXAy/je7xYxe9nw2jp3j9TIVY9kYZ/EzGfU0uG+D5x+aaH0klhccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JYijw5ytpzMETjpQuHkronkhqib55Xwp2AEN9JSRdk=;
 b=JjDn1MTo8UYn2h51uzGhCTCOR1s688GDnHeUzLb7WXKqHwYBZSFdyq3b1Zj0yBACInsr1FE0vud6mSwwBzsO59TuQolec9tA2L4ehBQBobsEPWHb/5Kykn7g4VKH+itz45lbSTe31V5rq9XrI4pKz1YcugZvlUsu/Ud3LxXbUavD4GzD4omB991JilZxoktf45RssRTxIthi0W2emwvvke1tgMQDRTg2D1vLf9qDibE7GY2aGx+wwNGJPU6KUHIVg35vihgd7aSxtYVQOPjhDaALL8ZOnbZe35CqSbXzsqIH0ml7oDiXCxfxznk1lIgVkRT2KUjVwgB/iLD2wnwZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 18:35:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 18:35:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1] drm/xe/pf: Relax LMTT requirement for LMEM auto
 provisioning
Date: Fri, 27 Feb 2026 19:35:14 +0100
Message-ID: <20260227183514.399061-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0319.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 7048d79a-78b0-4462-ce36-08de762efb7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: Jb/IYzA9uP7oFZaHFHQwK0feO05jDV++0lPy7ZZ8X1FduoLmhBuf/yekhJcTGjM/0cRaqyYRekGYyR155jGsPwymgd8mzRfOi4sgREHRKqUnjzEO0yybdlBeCrSfZhjFyJAPv5NPHIHy953UTRdV7A5QJZw0OnXGbM0dMmeptGigkDXbAVQVidda47GFvu2bHTh8mHqYWMUH3RSe1kTf1BBu+/DBeoFp9c4LxAxVZTulrn/R9+5gKYQXZXpY5Li7wyPdpUO5TsDuI9xeg+irSrcw8AtCGn4hN+6FWRWdh/k5F8HvOzxzsyw/KW3n0QL4ufSO/nxu/cqUAl9ylMs6bnSztMM0ORhgmotocSwbA9Zh1HdY+ey5u2sfSTbLB227L7Lx/qdt4JSv0ueHD7Vm1X4TtwUqVMtE9EJex5uojBY3EUAGR1u35aHAgMLM6hA2yHzD4U0rIKr5FdAfeC1YoTKwTUZujuh2TO2VWLTIsGL+GmQYWUAbKFSCOmZkkdRDl7a4sY32Efnmbd3JhjtBSgFYAf3vzjxfBL3H1X6RpSv3pNlenjdIaUC2NrU2DLsy4DVYyj73TOsRIbAyZSVcCCunEln4sbCB2XhfSl0foCBXHk0mNBeNKjyB74bv78kDfs59lmWqqjs7tSykV3FbRmKg/QmYMHOO2voOU/5RsmMjQui5MYGgXrWvCdT2q37Zdy0HrJmn2GiHWZzlXmQ4Ug0PdLvTwrs1Jb1HmDEByls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRoY3QvdmRwQ0ZMdzIxTmFLbnRSVUIrbFV5L0x0Ujd3dnhVYlJseXFPa2gr?=
 =?utf-8?B?cGNUcGFYSlJZeHRPczNGNWQyMEl2Y2kyUk85ZEJJaUE2L2VVRjhWWjVkUkZD?=
 =?utf-8?B?V3R3dUVBUFE2NXRONTZyMlE2amluSENCT0FZeGpTdUYzMlBENmFHZlZpUHg4?=
 =?utf-8?B?U003SGFZRUU1WHRVZEZQeHNPZU91WHFpUHQ0M0RrMHA3ci9TOVhEVEh4dzBy?=
 =?utf-8?B?dWgzc0FEM1RGa2lMK0N5bHhvdk9zYURtSEQ0MnA0TW4zb2hzM0pNNXJmWnkw?=
 =?utf-8?B?ZnlXYmhsUmJZWmJmRG94ZnQ5T2Q3R2RMb0RvN21jT1J5WmhmdWxoVVFCRG1x?=
 =?utf-8?B?Z1M1b2trWkJpSXhjcCtWTXduUjdvTDhUQVlJMXFXYTc4NUl5K3ZvS2UxeTRn?=
 =?utf-8?B?K1lKYXFGZ2FpQnowUEY5akFJUlpCNDdITTA4YzFhNU5qZjA3N0k3L080ZDRz?=
 =?utf-8?B?MVdmOHJJVUoyNU9MZ0QyYWlXQTY3Uk9sTlVuaU5pRGdKakhYWmorYXBEMUdy?=
 =?utf-8?B?ZnIzdExoN2VZeXUralE1ZDJLUjY3bllwL0pUUGVNdTc0d1BjVEZ2YUp5alpi?=
 =?utf-8?B?ckZnUDJaNmhkNWhCajhGcklsdjZUTE9hdGxCbFpUenFQRjUvT2xqYUhjczcr?=
 =?utf-8?B?c2ppckNmMk9XVWkwMERXQVk1dmxRSWdhZWdKeUJQc2Jod1dkVWNyMXFIdHN2?=
 =?utf-8?B?RnNVZVZWYmRWQWg3cDljcXMyRm9WY1dkczZEZGlXTFpCZExyTHZGZFFwdFZF?=
 =?utf-8?B?VTlvREFhNjlWL3VJT0lYV0ZybGJBUmM5TDRBYjl0UktBOHBzMTVqMDhpaUEx?=
 =?utf-8?B?dlJCSFU1MnZRc01DWkhGZ29iMkoyT0JVcGFwbmlqaDdtZ0tqeDBEd3JkMEJh?=
 =?utf-8?B?TCtHc01PVkxJQWQyakl4KzlKdmRsMGNSMFczZVloOGJENWhjU3BGS2pUUngv?=
 =?utf-8?B?U28ySmpsYUp1M0QzWkNRcm5mUkl4cHBVYUt6NXVldEszQzZJWmxKVkl0cm5K?=
 =?utf-8?B?cThSY0UrQXhCYVAzRllkV3l5aTVBRHdqS2phMlpVWDhxc3c0aXJXcitPY2pv?=
 =?utf-8?B?QW1uTDFRaVJrcGoxdk1MdUd2cXF5UkpjQjNwaXFFeVB0Z3VxYmZ4SjVRV3JE?=
 =?utf-8?B?azRzYjV6U1BFK0hWL1luTTliUURIUXN4S1FEUDNRSlVjUFJaTWt4L0hNWnlN?=
 =?utf-8?B?Qit3K2tQWnBIbUZHRFRhQUxTOExTOENucGRhYWd0Z0tYZ0VlY1U2eVJwbXY0?=
 =?utf-8?B?SDc2QjQvaXhNZis1WU80NEVqSHN2cTZiYitWSEtHV2hsVUJZWUJKNUFOMEp5?=
 =?utf-8?B?NDkwNlRTaWEvd2lnY3NJdlNQc09CeHlDS0dnME9Hb0k2MHNuWk9ZdFFTZkti?=
 =?utf-8?B?S0RYMHNYbHdsRkMxRnZjTGtEd3lqMkNFcDVEOWdNeW12Q0ZneHR5TTh0VVNj?=
 =?utf-8?B?V3FOMHdzNHd2cStpek1aYkJJZmYrT0JYUHVvYmR3d0grZ1Y4ck8vVW5ET05D?=
 =?utf-8?B?UlY1cEZjYVkwckNWOFJ0ZnNkMTFiWnlUbTc3eDgxYnF5VXY2cXpXSC9zVitK?=
 =?utf-8?B?KzhGTk5jZUpPVWpiQUFLVkdkR3JEMXlsdDVHWnZrakluRmkyWjdGd1hEdUlZ?=
 =?utf-8?B?ZEU4UjhVcHZoZDdrelZrZHU3cjA4Q1dMd3phc0JRbmd6L2pNdUtnYmxNbkt3?=
 =?utf-8?B?bXJYcXU3dG5wK0dYV0phcTJ2TFN5UlROTXYwTXdpWlZoSFlHdU14UzBhai9Q?=
 =?utf-8?B?R2lyMjc3bkpHSStMK3hxenJJOTZYVm5FeGZQL244WDFKdmxwSE9oMk1tc0xK?=
 =?utf-8?B?ZUdQb3JoMmZwMUU2QUU5ZlJNbnBiOUMwT0R3bTV0d0t1ckZXZzRWbkllVmhp?=
 =?utf-8?B?b2tTdkdOVTNFZkhQNFg1T3k5WkdmR0twV3BCNmk2RTNOQVAyODI1ekEwanF6?=
 =?utf-8?B?Zi9jTXBpaVR4WE14c2lIbU9SdURVbWJWaG9rNFFzRWJIZEtoM01kb0dHdG9S?=
 =?utf-8?B?SDBaSnFqQUhDUS9Ic1F1UW9FQkN6a2tQNHZuK3ZReDU4NGJiVEpSQnhrWGVB?=
 =?utf-8?B?cWdLazgramJpMzhhV2dFVW1zaUUyWkVZS0htc2tNamtPZGNwMFJiemFka2xK?=
 =?utf-8?B?TXF3bWFWc3I5OEJNbHI5a3FmNjlpYno5VXcyNmxEdlcvNHI3TVJ2Zm5IUWF2?=
 =?utf-8?B?TWNkQ1hVRzZzVE5WVEZlYXBZcHNBV09oUDFYSzhoditqMXhtMElVZ2t4T1VL?=
 =?utf-8?B?QndUR0s5aDc2bHZQR0syaUxPWmplbk5IOG44azJwSG52bmNaa3RITXVhZDA0?=
 =?utf-8?B?a3E1VzJuc1BTRXoyc2hnb2pKRDlIcGpWQ0lJUURKNXowWlliWDZOTTJVNkpU?=
 =?utf-8?Q?8q7rJJKU/0urvuFQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7048d79a-78b0-4462-ce36-08de762efb7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:35:29.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaKqDd3V3H37G6hRmlhndgW3QpcVHwHB+W4JC+obwyIqkrU8mLmln7Ux0yDjtj02fXNFpg49E2umgNbxOMmIkUWDZ6Q3IGCNbfaW7xPRw8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Manual LMEM provisioning requires LMTT, but the auto provisioning path
may still be used to set default values without it. The current checks
based on xe_device_has_lmtt() are therefore too strict for auto
provisioning.
Let's replace the xe_device_has_lmtt() checks on the auto provisioning
path with IS_DGFX() instead.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b867203b4997..ed840c95ba3a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1755,7 +1755,7 @@ int xe_gt_sriov_pf_config_bulk_set_lmem_locked(struct xe_gt *gt, unsigned int vf
 	int err = 0;
 
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
-	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
+	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	xe_gt_assert(gt, vfid);
@@ -1998,7 +1998,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	if (!xe_device_has_lmtt(gt_to_xe(gt)))
+	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
 	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
-- 
2.34.1

