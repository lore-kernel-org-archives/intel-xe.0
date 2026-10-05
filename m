Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA6CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3E892CA;
	Mon,  5 Oct 2026 08:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G61l7OF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C872A892CA
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190316; x=1822726316;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jNyUzRcSjXSgDGUQick6f8V9N5K5a1wv3TMPJiN7cyU=;
 b=G61l7OF+OHP9+qmJTbXSiWBdOBSWMfMWGb+2wjCWgmWaO1AJO/C3cHAY
 VN7MptaryFfDgHT23hZ9FfFoQ6Fs6F343Bq1AYoHIKJpyZyxH9mTqKUBo
 iq5VMGzzmT7dEWbTEkiR9ng8jmf/U97AuL+XCNYziINz29q1gpDxjhMUP
 wWc62LAyioFD4+8SYMlPRWRPjL2ufCgqlkEYHliDJCj5N/H7MvyUgCxIl
 in0eVfm5eGQFsa7jSu6nSrhNHZNQdt46jngAurPdgRG+KML9LAERgj7Dy
 8ozUYy8D7VjmwzoGKO2eTZK+C0DsaDiHwhStQElxHmBeEIcyuTlvuqDRZ Q==;
X-CSE-ConnectionGUID: H9eBPCHYTvKR7T0WaW7Wwg==
X-CSE-MsgGUID: Bc3vs3KvS7CP3ThxPoGMZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91717673"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91717673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:51:56 -0700
X-CSE-ConnectionGUID: ELJTnZwvT223dny/is8zGw==
X-CSE-MsgGUID: A6U+MaO3Q2SYtiYmnkG/wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="314772972"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:51:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 01:51:56 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i85iibxoCZiW3MC9BtEkGj6UrcFgPAJlav75gU/UGZLjzs+V0lxmwsh3ubQieL7TkHvqCYPRfhggUJ/eCcQjJFw83Um7NqiYbGe4L4HTc5aiJNb4qSxEit8EN9C01wkYE0aZLQTZiyOpt+y7ozk0KIQSnSKFLy+hwZGQHFNWIciwS3stMU4pUHZyJlFVcdCpDgejiE9f/TBb276LlOQBzmxPo+MOHMXwE/0UvDr+cEtBnYzuSs/gq4F5E9CZnqJj5Cqw72KU9p+dYZnQkDR1Ev1XVllk+VaVkfMR/GIe4D12yOMiUFLSvTGvzBrTUY5Dyf2FOqSZ1TsuvKBvrn4ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71dqNI0OMgBVl+g3l9M6GjgfV1G7W0xkvcwun1ztG0E=;
 b=IgmqMiknakfIlIFJtd94O9fU0ftH98C0RBHMY2lISySQv4z40z/vphgwIFvg7RVVbfAeNAk74oW08HCtcmMKhKu6JHwyFcU9HbZEmIDkc4IehHdgzLXXsB9kIcNrDbYORWcswn4FR2RVTA6brDRag8naQnWWUayuwRIPkAGSISxnjWNg/dThtq2+0QC/UYbGSLYfuHiISr7L9eTi7Ag0cMgKyBbk+vbqKiiDd3ONQCNia43wQYT3MRRfdLIexT+GeBArGADOcr1KSxFosCjWnPOWLo8/DQjGO87L+OLWMyJLsaeQOXbgd7SUYpN+Fn81R0z+iTyMRBB+kIfUoB/Zrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 08:51:44 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:51:44 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 0/4] Split GuC ID space into usable and shareable pools
Date: Mon, 5 Oct 2026 10:51:28 +0200
Message-ID: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0014.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::8)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: bc287dfe-9253-48ca-61da-08df22bde1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|6133799003|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: r8opycZD/UHzbx3zGQiLJJrT2mnOVtTdj8oHAFJoIEg6oRU2LBCU7VDucBfbOaTy7IWPK7hTRQAR+0e6oCVFdaeybIBFKLfgiAM/mBNipC+pe/ZBWGr0y2oLdOXJR5oNnsbRlW2uvz79SnM9s9Rbzaf3B1rvtXNpx85+dX2VNrh5Abhom98qgDC11Ji61o9pViwv+skEg4ayedHvgBSEUy/RBLf1owQYmERMUPhQMe/RE4a4Itqmyxh27CKy+6wDvxPza+7Lc93dLP63IZi9kerFd2fbldAFoxhbTIQZIb8wguxd9V5DPvL9eld1COqf+xA82t1/lLDt0gB7uuDabo/l7ip03908Jo2/eUzkMu5fvi+Ldnqi2H2cg7VBW38GVR5tTTOE5QOLb9rmXdsaO2hmf7eX9ofVvF7Q1pJ1MG87yg/IrOS5SnW+wV6vrbiyZilJFERFws9czuZKsa8+xGzs8goQqKw11NTPjT/Mk9/0pErH1SHZRCFyODhVzZ/e35CB4D3BMc0txDuz6UNdD8qGp32VvRxUsG+NopCI7lShl7qjMKjHQBkOSf5cIVkGJILABWdYRcYAwjVuDCJdDSwMJszfbrhNBJoRMFIbP+AzI7ck64ir4p9aoZesfRiK9MPW+2FZw03czqwUXC7B1hPUccgI5m/sFVzOjA0tfOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(6133799003)(11063799006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGcvWWtzV0hrSjFWR2xwVFg5VUNCSlZGVHZDR3NLQll6L1hoS1RtTm45UUxq?=
 =?utf-8?B?T3BwanN0dzVteEN4OXUzMkZTNHEySC9wRHB2R3gwd09jQi9yZURUQkNNVDR3?=
 =?utf-8?B?TkdTWVl5c1dQaGR4RStyMGpNemdmY1o0REZHUno0NnVzTFlGZExJb29udnVU?=
 =?utf-8?B?V3hyUDJWbXRvdlFSZnNkbEtLVzc1S2JmSG9aVVc1bVJ1NWxsQnRRSHR0TzQx?=
 =?utf-8?B?VVhnTjNMWkwzcm8zRkFDUlVVbkVRcUZTTWRPM2NVYUZLNDB0OWFhSnZ6M2sv?=
 =?utf-8?B?bXRIT2hIVktGN1pmT3laNlUveGtkN2FWUzR4TytHOFpmYytIeWhDVlRGVXVk?=
 =?utf-8?B?Wm04SnhXcEVZUG1mQjlyV1hLTzhGVUNvZVVSMVJyN2VVaEtua0FXbUhaajJu?=
 =?utf-8?B?RlNOWS9rUG5BRUQxcHBuWVFXelFSa0w4bm5QdTd5SGtJa2RmaW9qS0FHdmJ6?=
 =?utf-8?B?VjdLeTBTcStzWVM5LytlK0R5QTNIN3hhQUpGL3lBRTJkQ3dLL05XN0lGcU4x?=
 =?utf-8?B?V2ViUjIwM01lSi9lVHY0RStkeFFUdExKTUJDUGdzNXk1c0RPTjBGMGxYMThG?=
 =?utf-8?B?S0t0K3Boak1iT05zOEFMWklNbjR0OXJuamdpcHlTcVZ4TytJQkZIVTFPbkNP?=
 =?utf-8?B?YThVR0ppOEVIUkx1RG5qeVdMU1RlRDNBU2pianJ4ZXlzRzIvOGxkeFNrZm5x?=
 =?utf-8?B?Ylc5cVBUMVF5QmJFa1NLS2UwRkowN1Z1RTVWVkhUR0NsZDB4czdsdWlTQUk2?=
 =?utf-8?B?Q00yWVJxRVdNeWFlQmQvQzZqTUFNU2pmVjNQUUN3ZEliUFp3YTF4ZDFpVXRD?=
 =?utf-8?B?d2tOS1Flczk0ZU8xdGNFTGZqS1FPVSt4Ui9DRzJ2bjNBZ2plSHlKM1RJZ2tG?=
 =?utf-8?B?eElPNUo0YnhpRXg5ZUN2ZDBFK3psbUFpdjEvSHU2VUFia1NNTkdGYVZaTGVw?=
 =?utf-8?B?NVVZRlBqK1V3VGN1YmVWeTFDNzRWVmN5Q250SGpOQ04vN0RjalJVdTNhMzFI?=
 =?utf-8?B?TkFoL094QnFsMmxLL1hGMVpXdHM2STc1MzVYblFYYm85ZldRRnlLM1ZEcmsy?=
 =?utf-8?B?SGNubTRXL0NUWVJ6S3V4bWJzM1RyUGdwWklMdjF6SVpZOGZuNXBkN1Z6UFkx?=
 =?utf-8?B?N054Rm9SOVd5QmVUc0w5VU1DMlY2akhnbWRVT1dwSkduN2VTUlNaa1F0MjVS?=
 =?utf-8?B?cnJKZ0hFVmpoWGdSTkZOT3dkMnFubVdsY0JEMFBOQ3lrazA1QTdxc3RlNXNo?=
 =?utf-8?B?NHc3eHdUU3RNOXRxdElzSVNsa0JseFZvdEV2b1A3N1Jaek9yY0xUM1A4TUNM?=
 =?utf-8?B?MDRUdTJ6bnZIT3JiVFgybnhMVzlkK2VzTFpXTk53K3JCenNpclltSW9KVis1?=
 =?utf-8?B?VHFvT3JOUUZ3VmVHYmV2dUcxTm5sR0ExREJXVnVRa3kzS0JKQ045UzkzYitG?=
 =?utf-8?B?T3E5SzR5eFBJZzVQdUYrUm84R2l6RFB3NUhxZVJaNUlBbWVHUTNRSTVhYWtJ?=
 =?utf-8?B?eWRtd0RTbTk3UkRneG1SQ0JseVBiWVFTQ1ZBZVJ5NW5iVkg5QmdrdEdrWkM2?=
 =?utf-8?B?MEw5VDVPTFJZRndOL1pRWDFDYXdyZnFqdXlhVCs5bHNIVElYOXZuTUN2WTNt?=
 =?utf-8?B?UEZCUzlsTFFYZkpnckI4V1RpZ3pmTFdiOVBoYlFMODl2STdodTBMZnFtMjJO?=
 =?utf-8?B?ckUrZVRpQ2U5TjhjVjhJcW9PSWFZY2c0QWtKNzBnenQyS0oyV2MwUHA5MW1B?=
 =?utf-8?B?TUZ4T2JKMTQxd243YldRTDdjVDZ5bWhoNGhDZVZYaWxGdXpBc1dsekRwRUE5?=
 =?utf-8?B?ZjRseEJtWFdtWmdTVUt0TktuclM2VmgzMkFBN0xXd2RueElnVTUwWHhPZW9U?=
 =?utf-8?B?MjhXVEwrQkN5VmZ1Z1NaNkRYZ3pWVGx2SldVajB2d1Q2d2s4RDZmdit6ZVlV?=
 =?utf-8?B?K3pXQjcvYnVndWl6YjZaalkrYnNDUmV0VS9UdzYxTGhPS1pmWlNzZEZzRmVE?=
 =?utf-8?B?ckJoaUFzaEEyT2RDMSt0VDhnREpkRmpiSnhNV0JEdllLZnhIVjBNRHJ5K0JJ?=
 =?utf-8?B?MTgxUW5ad3BkZUlrWVc5T0RkNFFEdmNpOTVJcnBrZ09nWDgycWprZlRIeU5M?=
 =?utf-8?B?NVJ5NzYrWmcwaUNvRTJ4SVd6OWJaTDNyS3ZLanhmWlU2RDNNRTZRcndZSEJH?=
 =?utf-8?B?ZE44RDkyVURFc1htdGx2ZUFnL0pLRmxxcERQc09wT01XVGVnMmlWb0N6ZWYz?=
 =?utf-8?B?ZW1FNlFDRlNHeWVFVjhMWnBCK2crSWJaQ2RsVURyODRQWFRzc3JsSkUreVVJ?=
 =?utf-8?B?VTNDMTFudWYrbWV0T2Z1YUtQQ2FZZWVSbEJvZFZOcldVelBxUHJ5WUR2Y2JJ?=
 =?utf-8?Q?lNFS2WoTwT5v1zqs=3D?=
X-Exchange-RoutingPolicyChecked: Hwagn4BCqTLv71XMwNKBfj5ORP8SpLoxKiksJFbjICoG51M/bex6MKLMDQUNy0pKU5EK1o3ae8CZxFEOjLuPanwqwZrkjcYfbQpP5X+9WKdLluMRQ+d3Iz0wBDdFcSFcOyA3CsJ/477S4Uad203xkTujs72BPOlTRidxV2seC5Bxjwi7WxW5IWLXuDYAOUy36W3n1n/pJ/JwPvOevCKSBLveFlbuS8d3L1dhx+19eWWIPYq/u2sYBK3IPZ2C754Xh0+baLmy8/DxTn9vhSgcrWe4P0MvAqDaViUzXZwxIJwRaZit3mKnD2Uz9dFU03IfJSJENEkyWtVvxTnynXq6zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc287dfe-9253-48ca-61da-08df22bde1ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:51:44.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nNwA/fN2hZeA3CSyG4Ew2T4eM99+btUfRoR1Z6SPgULjd+L8Ym5IutJLiybdEWtEbxCooE7RkXsprEkLi/YsCCHnw4rz7REyyR1UrvVU8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

The GuC ID manager currently treats all GuC IDs as a single pool shared
between GuC submission and SR-IOV related allocations.

This series introduces explicit separation between IDs that can be used
for GuC submission and IDs that can be shared with VFs. The ID manager
gains support for independent usable and shareable pools, dedicated
allocation interfaces, pool-specific accounting and validation, and
extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC ID space where appropriate. GuC submission is updated to explicitly
allocate IDs from the usable pool, while ID manager initialization is
adapted to expose the correct ID ranges for native, PF and VF operating
modes.

v1 -> v2:
 - Fix issues reported by Sashiko (top-down VF ID search, KUNIT_EXPECT in
   locked sections, xe_root_mmio_gt() for the primary GT).
v2 -> v3:
 - Guard failed ID reservations before releasing test allocations.
 - Fix shareable spare quota accounting to include PF-exclusive usable IDs.
 - Skip some tests required PF mode if there is not CONFIG_PCI_IOV
 - Some minor other changes
v3 -> v4:
 - Avoid releasing unreserved ID ranges after failed test reservations.
v4 -> v5:
 - Do not apply the spare quota to shareable IDs reserved from the
   VF-exclusive range (Sashiko).
 - Drop redundant range checks and unreachable asserts in the ID manager
   initialization and shareable reservation paths (Satya).
 - Use a local variable for the max shareable GuC IDs in the PF fair
   provisioning profile (Satya).

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 665 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  21 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 450 +++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 1059 insertions(+), 154 deletions(-)

-- 
2.34.1

