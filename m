Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B9BC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C4610E4A5;
	Thu, 13 Aug 2026 10:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Llu/jjH2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168710E028
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616744; x=1818152744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MwoilsVRTkxnNjbyEDd7CGDnz6DChDZbUZ7F27keVDg=;
 b=Llu/jjH2wTnihg9Zwn5zWn6h5KVhADW28csVOewsNeciiID1Sd0EnQ6l
 tJMhSfVlOmUdUfnrYV9zQWUXc6kqmglJT+8S8tkbLQ+AJY+g5d+HZ46JO
 PtuoEQEX4MZImuHAOtN5w8acHEp1RiRl0Akq5vZrSgeyg67+g7DrgyA1w
 FO0zINbu8mmqjTFjrB2TSUNMPbL69o+MzFxkKafP3+Kj3a9tANBjIzGQl
 yzPiW/1tHv51rMf11YehHQh2+CuzK+dvaj1JW6h0SKUGLzp0rG1aC1qNf
 //BGs6o7IOpYMUyXkKC8jKsTlDNzfNNm0xtX5oXvO84HmHkDFxZtpWRbk A==;
X-CSE-ConnectionGUID: mQN7JsbySlG6RAeG83OjtA==
X-CSE-MsgGUID: ogXH0Z2WSsqXqOfJi3l6og==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87208447"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87208447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:42 -0700
X-CSE-ConnectionGUID: oxRoECZPRH6j7Qz45ci2hg==
X-CSE-MsgGUID: r1BK4NB1T9CaN3R8KIhCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288690079"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:25:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YalSwTNywCQXC4I9o/N44df06IutG//MZiWprYEBDoLsuoKbJuVmYqGFmcGtw9JARP7d70Fl4BhhUOm6ccGNsfK/jj93/XjKqMAUAB0PTJ+B6TyK8FMO2I9zFbn6LkbtcwMDpeg7XqyPKoRaOA2OqZi3RzsgyJTxv94QpVKfvp4qVCKHYC3g47mXmOJXOVHpTxXOnXcKMGumgkj9rDv1gh2HbddfMmuG5rbWmhY+fmUGOU+JBPmUZ70CGafRcM2ZFuUotCrq7osJaU2R/BBWmJg1iNxrHALVvfu16upbUOK6BZQkwRyOHY7zInxzkm9Wv62CPbI0PjTCi0cBapEIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdxq6R71TVNzNCP64lsChgFQrhYIfmU/i2e52sCDs+U=;
 b=dz68JuMtlPTA8DOWjAUa0TlSN24AeGDx/TRSKz4gOorl2//qjltS5X5hFWIDFAiVjZ7ZvoIHaw9+vnl+24fzBFC+SDvtUwwWKN3uAQl4QkPvE03dBbSFuTxs6gYtX+LPwQyBZgz6S0EW4OW+sbV7YlY9U907OySkxqXVVZeofnMeuVA5U6dwpqeK2WTCtEpZIGposfPElBuOHRXPub9/IeECWW0kbWTnD+HpQK6H302tA0vtmiT500QD7fxM6wMnGF1lNtuJ7sr7qs9VGgOMwDowGew8jQDCOxbckzRJDWzOpPGnfR22DomknflhhQV4xIlLZ8DMBP8C0MkBs1Wg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:25:32 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 10:25:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 3/4] drm/xe/vram: Add initial support for PF-mem regions
Date: Thu, 13 Aug 2026 12:25:10 +0200
Message-ID: <20260813102511.200690-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260813102511.200690-1-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 91359491-d156-4594-9217-08def9253464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 6u3Ekt/vzau8nBdEvYywCB0ID2A6yQIuNZ+lNh76O1COwwzIIrj1uDwrTAZi3/6Zh6ryaCh3A0GMFCWWQcwjBwgxhDlOetrrCQl/ZU8njhmcTyQ/rex2pYfxMqc/yq+U8eKtCSlrWIjZW9J5fWIzkHXR6NMHV8nUjBOWCH5ONWh+CiBGiq5pj8eAnufFUjm0aoxyIOfpojAdNep8TY0Ag9hpv20FOrNhO+e17cNot9nIzdwp+vMZE7wmWRzo4D+4pUPmp9K6niOU6QOGm6Or17fqAx03RFJRXSlDQnkDsPXAs9HDzDMSuOOlXf02dWuXDf+BsueAs1/G7ocSLO9mQVafHw5GnYplCtSqpSzmr6Agzs2qOt+aVSIaGo27+UFad8V3GtQS411Ct5iHfIMp2wzIbxludX6gzwNJ8c7BhiEhh+Nsg9AYUloxd2RtzAIhm7o0M98U6egLvp1NLogzjzIEqMsLSSHUaYgi7Tfu5EJ/IKoVST+X8N3B4U1Ayrcu6gNvK9IJfc3qlydDvwb3JU/02ZPK44yXxZ2uiG9ljy5/eLCzMVVIN/gYhjlRWrCL0WPYciVkNV15IPpPiJ/f6jG7dRWOuC9dAH1VJUXHU34EZ30kUBkrDQX0CI9ALIvUlER6gcV6x8gCFt5LHigRr7KOJ+ocYcMnYcH/CqeUeDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXB6T1J1dGJ1b2VnSmRCMStHejNvVEhES0NvUFJKKzJ5eVFSbTZ6ZEVmY2lG?=
 =?utf-8?B?TGtGOVpKK2EyZFVVeU81Um9PMHlVdUVtLzFMc25zb3ozL2VGQTNidC9kdU1z?=
 =?utf-8?B?QnhCM2VDU1ZTNlJGZERsN3U4QUI0NDZkM1RsZVlET3RGY1JOUDBOOEQvaHRZ?=
 =?utf-8?B?bVFPOC9vUXB1bHZrZXZ6bVNTQWZkRUtEb3RqT1pSWCtrMThpdkw1Mk1sT21r?=
 =?utf-8?B?Sko3cXZkMFFxTjJvdUFtcm1TWko3RGJCU3hlMEx1YUNMQXB4K3UzNWdMaXdC?=
 =?utf-8?B?Sjk1U0dJeVpQTVE1VThWbGo3cmNucnE0elQyeC90TDBVMlNKdjgvZmsvOWFi?=
 =?utf-8?B?Mk9LSWVYZEV6akYxNHQ3UzNnN2RTUFQ5TXhWME91TlJscXJLV3R0eXlwZGlQ?=
 =?utf-8?B?cTZmVm45bjVJR2dxdTBLZzlWR3NkSm55TE5kMlRPREplSHNlbkVTTTRIRkcx?=
 =?utf-8?B?dTFhL25aNVQxOTJjQVlTb3MyS3RYaVpiRHRZY24rMXBzTjZBWkJEeGdleGph?=
 =?utf-8?B?TDNXdmJTd0djaFRzNlp0RWsrclFQOVk1aDl0NDRTVmRUdW1TVW1PRjhuNTQv?=
 =?utf-8?B?alRUcStVYmN3U0lFTW9KR09UV0luNWtIWjQrbU95bjFkdUdqVFlwR1V5aG54?=
 =?utf-8?B?WFQ4UGp5Y2ZxU1RWbWY3MndSdHhoTWMzRDd3ZDhGMXdqMTlOaGYzTmRpWUlF?=
 =?utf-8?B?Y0JMTFNXRnYwRDdnODRYTGY3Q21rbFd2RCsxcmxHaXd3YzRxZGNDYXVjeHZD?=
 =?utf-8?B?UFBCNE5keEJKSGtJTmpIMDcvcDRzQTJMa1BNdXRGdlVEQm9DZWp4c2V6UEFJ?=
 =?utf-8?B?bnZIOUtYb3FZR01TVlZCUjhvdCtCTVRIM292TUhmeis1Sy9qbHlMQU5Ta0c3?=
 =?utf-8?B?T1lzSm9HdHZ2N2xOaWlLMmVqQng2alFlelVuZU12UXV5aDN1ZktCLzY1T3hM?=
 =?utf-8?B?bzVTbFVTQmMrN2FPZllEK1pCSEJ2UlFIVkpuc0U0WTVWV1BDWndDV0drMS9N?=
 =?utf-8?B?VDQrSTNEa2hOOTc4Y3A0MjhoL2lYS0xndm96WlZjSEttL2YybTRWODhWOW9K?=
 =?utf-8?B?SDd2T0ErWnB6aFBnU1ZoQUQvcFkrRHFka2RMdXlRczJOVXREQzRpL0kydExj?=
 =?utf-8?B?ZTM5ZzdNWHVzeUNOTWVsc2xaVklnSWdFUjQvdVp2NnEwdUJuMmNOcHpqL0xW?=
 =?utf-8?B?VEpYQkowYVMwZDkzNGdiNHRCYndWL0IyMm0zd3BaVyt2azIvRjJTa0FEVWdv?=
 =?utf-8?B?WEh6bTBtb3FtV3J5eHpWdjNoSklmTUFGcHRDcWg1M1FyWWdqWGYwbFduYTR6?=
 =?utf-8?B?SElWZDQ0MXBjSWFscmZxbktnT3hEKy9lNXBYZ1RCejAvYVlWMUJCemthNHNq?=
 =?utf-8?B?c0dzVnRFdkdEM1F3WUhvdnU1MlhjOE9vN2hZejhRTjRadlVTcmhSYy94WXFz?=
 =?utf-8?B?RXAyTVRHaUxvdjAzK3ZSaEZVVXlPSXNzZjdjUHpqVW8yQ1JlTXpkeGlUR0xp?=
 =?utf-8?B?UVBERWgxUjJmdzdjWUJDQ3NYL1RBcUc3aUh0dkpJdHZuUW5uRjFzSC8wcXBq?=
 =?utf-8?B?VGdYeVBLSm8yclVvMkh5aEE2c3k3QTE0M0ltcElURWE2YUFJK0tXbjFQYzhS?=
 =?utf-8?B?Q2dlR1Z4TU5kdmloNDZVbXA1SEVvaWxXdmRrcEtIRlBXcFZTVmpobHF5bmZu?=
 =?utf-8?B?SXh0S3Y5Q1lOM2FYTDRuNFZrTklYQWhyb1pHRjlOMTJNU001N09hRGlaVmFm?=
 =?utf-8?B?aGRBMzUrWE4yR01pbmNvVmNaeGlFNEFVbW9IRmNIMXErSk8va0duQzZqTEJq?=
 =?utf-8?B?c1U1dHliMlZGUjBwdEJLUksrOUMrQ0xzd1F5aU90cnVqdHA5SHRnK1ZlNUR0?=
 =?utf-8?B?MmZuSHhwMlI1NnVpd3JKR09LZFF0bW9Rc3FLZjlIMDB2ZVQxQVZjM1FrbFV4?=
 =?utf-8?B?d2pFZmhEeklXbnZCWGNUdDJON0t4YzZJbm11L04wWDlMZ3FDQ1diZVdqaXpt?=
 =?utf-8?B?V0REbnJVS1ZVLzIzMTN5WDJGMDl2RTZYZlhNTldXVTgxN0FsckpMczlJZ2Vq?=
 =?utf-8?B?YjRDT25uMGNkL3FmODhseWJscC9oQlZnSzZmemhiUzR5OVhIY0R5a3didW5M?=
 =?utf-8?B?MXBsdWdQRVQ1dmEweUNqaDFFODFjdU9nQkI0OFlDdVhXRkRYcTl4TVVMeERS?=
 =?utf-8?B?VmRlZlA5WlhJTnlYdXJPdXZwc1oyM0g1SDcraUFTUzczOThma0pjWTVOajNu?=
 =?utf-8?B?cmhqRzNVWVBXbUZPZU1OcHVFdkRmTzZKenpsb2RwRFNwdUczK1NENnRGcncy?=
 =?utf-8?B?OHBGWDVlY3Z1ZDNmUWxsUFBBb2NqcVZyT25GVVpWUm1nL3ZlbjlialVGQUZi?=
 =?utf-8?Q?YTN3JS2jLE3SCAd8=3D?=
X-Exchange-RoutingPolicyChecked: HtKIZXE9U+w+iX16cLqu/SxSTDse5HK0cJDCWhHKXX71j4T+GZhONGb7PVOAQwLiQ82J0YW01gGbkVfrAXssmBA54YjVz3Oyf5xOzW+47Ou1xnpzss5Wg2lcTsX7odMymtxhUB2KBJqAUuwGjIS+sz5QmVY7NgANzbtPgi8Bqh+txOuVBhzbF+q5To8MNqevry1MwAwjq3H0VMtSvKTSTLdZSkuGD9EV/U3OFcUpWJ1on549c+/l7tLkuDPG/Co//JIMPbJSdBXPkuCKp5tTzkOiaATHqkpvMf1P6tjsB+wFu24Up772J2qbTuO4t/aSHGD5GDb/KUA6agJHXSxbYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91359491-d156-4594-9217-08def9253464
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:25:32.2856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNErdVi7606R7Mza4qYAi3JYworcF+2qc2o3NfTQjyQ6036keMN4IvZo+Um0Jed00Y54tc/1XjwEMj7mbkaY5EQf0+Z3xy6wMEc5bpQL2p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

Add helpers to allocate and initialize such a region from a
caller-provided parent, offset, and size, and assign the matching TTM
placement. The helpers do not decide when the region is needed or how
large it should be. A separate TTM VRAM manager is initialized when a
caller installs the region as the tile kernel_vram.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  8 ++++++
 drivers/gpu/drm/xe/xe_vram.c       | 41 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h       |  7 +++++
 drivers/gpu/drm/xe/xe_vram_types.h |  2 ++
 4 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index fd0c2e4cbdd2..e196f424fda4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -198,6 +198,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
 	}
 
+	if (IS_DGFX(xe) && tile->mem.kernel_vram &&
+	    tile->mem.kernel_vram != tile->mem.vram &&
+	    !ttm_resource_manager_used(&tile->mem.kernel_vram->ttm.manager)) {
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.kernel_vram);
+		if (err)
+			return err;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e5f83df98826..29c93e9aa5a7 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -29,6 +29,8 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	switch (binding) {
 	case XE_VRAM_BINDING_TILE:
 		return "Tile";
+	case XE_VRAM_BINDING_PFMEM:
+		return "PF-mem";
 	}
 
 	return "Unknown";
@@ -276,6 +278,45 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	return 0;
 }
 
+/**
+ * xe_vram_region_alloc_pfmem - Allocate a PF-mem VRAM region
+ * @xe: the &xe_device
+ * @id: tile id the region belongs to
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_PFMEM, id, XE_PL_VRAM0_PFMEM + id);
+}
+
+/**
+ * xe_vram_region_init_pfmem - Initialize a PF-mem VRAM region
+ * @vram: pre-allocated VRAM region to initialize
+ * @parent: tile VRAM region that provides the address space context
+ * @offset: region offset relative to the parent
+ * @size: region size
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size)
+{
+	struct xe_device *xe = parent->xe;
+	resource_size_t remain_io_size;
+
+	if (!size || offset > parent->usable_size ||
+	    size > parent->usable_size - offset)
+		return -EINVAL;
+
+	remain_io_size = offset < parent->io_size ? parent->io_size - offset : 0;
+	if (!remain_io_size)
+		return -EINVAL;
+
+	return vram_region_init(xe, vram, parent, offset, size, size, remain_io_size);
+}
+
 /**
  * xe_map_resource_to_region - Map ttm resource to vram memory region
  * @res: The ttm resource
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 87088ffbfd5e..4c77d128e329 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -16,7 +16,14 @@ struct ttm_resource;
 struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
+struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
+int xe_vram_probe(struct xe_device *xe);
+
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
+struct xe_vram_region *xe_vram_region_alloc_pfmem(struct xe_device *xe, u8 id);
+int xe_vram_region_init_pfmem(struct xe_vram_region *vram,
+			      struct xe_vram_region *parent,
+			      u64 offset, u64 size);
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 51884e7a679d..01690bfbcce0 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -18,9 +18,11 @@ struct xe_migrate;
 /**
  * enum xe_vram_binding - VRAM binding types
  * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ * @XE_VRAM_BINDING_PFMEM: VRAM region reserved solely for PF kernel allocations
  */
 enum xe_vram_binding {
 	XE_VRAM_BINDING_TILE = 0,
+	XE_VRAM_BINDING_PFMEM,
 };
 
 /**
-- 
2.34.1

