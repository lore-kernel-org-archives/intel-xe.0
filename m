Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931A0CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3F10E11B;
	Wed, 14 Oct 2026 10:09:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3AB10E11B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972561; x=1823508561;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=MrJbQyWOHqQcxojtsNLgHPZrqXQ/a/rxWmszBoffMcA=;
 b=Z3zkUFYz1doOjgbbhtx5/q9lM5cN8d+JeP5NP09XodwKT0D96XBgIJ9Q
 r2WyYQ3ryENmbtBjVIRSsAZj5o349Vn/i4PsF/J52uYoA5A3lk7bNg9Zy
 S/J5vz2ttPKir4WTZnJDY3zCXmrOPp7eCVeXKim8AFeLr1r5Q1koAiuv7
 CPCsAOzzpCpAjvlXcXTFfWWv1IKZ7c+HUo/8cJ7VVIdcevKUEY3Cdt7wt
 vTX82W5zb6wus7Fmy6YfKH6Yjx8lANRm6olfKgSsU/1P1w/BC35Tl548y
 H6JU8RE0J+FYcreGd/Buwy7XP54LMmpoJ4Wf8vLfrVq4V/WPTN69OhqtR A==;
X-CSE-ConnectionGUID: Wjoh+Od5SnStPEJKvSnrBw==
X-CSE-MsgGUID: ub2vTmNrQP2E5KpzC8LR7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="721995"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="721995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:20 -0700
X-CSE-ConnectionGUID: zxFUwaTiSCub4YW1IaY2QQ==
X-CSE-MsgGUID: oQmzDR8MTV+jOKqs7Rye9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1473712"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:09:19 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSg4NL8Kir8R6Wo/L5zsPA1eGVft4bT82VW3wxbQzYkmeuNVeBf9U/EXQBTRt8ao1xXBQzwcQj2C78KgeHOAFPXdjkKqy8vDIG5ZxHWrdqkzB+fizakd/Fyu49eCy78u+vZ4+R+r89B/6qVBnyoKxcFCd/H9ULZFUL6yqgZIJVUeaAjV64ZfS43cRpaj1QTggxWgsPiSx71f3CfVed2kWSHjS5wl6NwiO8U9sNLNCpLvYizohWdjB73sXNVGpYHD2ZADx8Aylc6C/AQX6cc8L5haAclmnm9Hp4wpGZ7GhQLw5893IDgTwvDK7cz0LLUTeocgiNdlbERahRnuoL5ksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBwmQGN7ygeTg2WEtiuiGB89F90sdzgQDsINKsUeenk=;
 b=iz497UW+WyAAqDfyOaYxzJBIZckHw3mzYA6Gmj5n6suKmabRdEAiXq2sOTxm1ApvO6lUE1jdSxWpW8DB1bgRnNM+djVxNnj7dR+KWYgD4RcdWh2O6l8Vee88LYnLUJfE01ub0qljRT0ZdtRmwPe9bE+0QBE2LkrswPfR1nr2fn5jYpD4PSD6FmAs7RsbDEfYZwdvogqRDE2O9hWE2KJBckOYzXgnNZRDFsK7T43vbMxoslPbeHFItrtW7C4Es+FamtK7aNgn1xtuMyIgSW8jDrVVbSc/aaN70Yjnph20QvcSMdpPD7momfRrrKzmtnzsh50c8XvjEk+oJ+eHXBpkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:09:16 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 10:09:16 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v7 0/4] Split GuC ID space into usable and shareable pools
Date: Wed, 14 Oct 2026 12:09:03 +0200
Message-ID: <20261014100907.77877-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:10:232::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 164f0f18-0744-4e00-d486-08df29db3410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ODnmvM7ijwMJY9Ri7OLYqTJUrEEpGxkTqHe/CEwwt9NJBNjNkqOgs7JOloqUPBjY7A5wyzuPPldCXbfur5ZEHxoDjZMPhuGHolOfMMXSm9cNhjNwq2B2K6Kmo6AtLIYs68bnfePL5+xm5XlteASFpcYgwddplDJT797pfefaMzU0SMDzk038Qd1k2G8NfY2fAwJzDW58vs0oDjo9ZYndVGt6BKm5QTdvHQkNgAWiA3+8xfnLj1tNqu6nfYn8NOWkTsY9t/lYoyrZC311eoKGchQym0D31HNu2riP+qUUiakJm0aeziGeg/D9DBApIt/Lkup8wrubKB+w1Qkwx2Pti/X1BgPLpK7I5T9YgAo6frkDype0OThNNl7jSgqwYAOHPwooy5FshjPlQV76c78FbwX7ZZRC0QRUrFNa4cGeCrGG5FQLQp/3IngK48AQkfd+uKkhnDCvbMgdWsRdml5o14x4x5B3YnwxvL9DbTomC+Svgc9sk5zd7zeZ2xsRhdqVHPs5XmphwNsWeEic/Bj305QN/zDmXW2ae7sQIYvedSe1AWpbo/+YhJiEQK2Jt3759el0H+nn0HOKeY8GbQ92T9pLUdAMYB6xsDfx41p/sxTdm7+WpR/e+5jtjX64weMNAzMqrMBDosL90ox9q0UcPU3XQwzlw/sAoLHsL8A5ZWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNIaElyS202SEEwcmk3K1ZDMG4rN21iQ1FmNGVjaTl0UTFaQkF6eWhxMnlT?=
 =?utf-8?B?REpxcjdPYVMvUmQzS3ZUQTZNRlV0V1hvajZBeW9wUVEwSGZ2ZGRtRGVlaDhE?=
 =?utf-8?B?YXlhTjI0M2gwVXAyRXJVUUlVOE4xd2w5OGwrVzhZRmZZbktPbnhJaDFuVVk2?=
 =?utf-8?B?S0lDS3hZTlNEQ256b1F2cTJsZ2JvQTVIRzJDMGgzSWJ0REVpOEE0QWZERWNG?=
 =?utf-8?B?dU91TUpjbVVrQWFMNGVQRHBhTi9qZXNBeDAybmpmMVJrNnRqT0xiWlRjMStN?=
 =?utf-8?B?UUVDY3hjTFpFc0poNHFUbEVmKzNDYlpmTWdOQnY5c0UzaUcxVHF0SU02TXhp?=
 =?utf-8?B?TFBISlhwM3kwYWZPMEtIVVp6MXNHUzlVSzJLRGpVQjU3VXZTY3RIYmpodUxI?=
 =?utf-8?B?Yko5QTNiZ0xGTzJ1bnFsSmpSTWJFQlhXVG14eENHNU9lRWlXT1NLcUx6eUEw?=
 =?utf-8?B?TFdIUGU4WS9mUWhZcUNoeGdyTktTRjVmN0JZUFJ1L2VKWHdoK3F5MlNpdDBl?=
 =?utf-8?B?WkN2K3RhVXhQUlFUd2tsc21LQ2ZPbER1Wkg5cnRvaStndS9qV2U5VmRVblU3?=
 =?utf-8?B?cCt0Q014T24zSHVXbDVEV2p3NXovK0k5M2VCazhtZWpTY2k4N1lYSHJ5RU9r?=
 =?utf-8?B?cGp1VXRMQjYzTTdXYjFVRlo2RHFCUFpEVFJnZ1JTWU9peXJVWW5jbzNCSUJu?=
 =?utf-8?B?bmhkSmNMSFhuSE5yTjlCSnV6N2tnVWdpWFppekIzM0dkbzFHbTJsMUZPWXB2?=
 =?utf-8?B?Mnh0bUZZUTFORk96NEw2S1dpcGROdTgrK28yOWtVZ3RON25BR0k4bkhhTndE?=
 =?utf-8?B?WGdCZFFVclc3VEdYYnczWm5QMVpzKzBNRzNvMFVnZ2F6SE5RZW9DTHU3dG1m?=
 =?utf-8?B?S3ZoU0xwTzZGS243UXVraVp0MituaEZhanVjUDQ3NTEzNDlCb3ZlQ28xWnpQ?=
 =?utf-8?B?elAzcmFnMHVYZzBQNDZVM1gzdDlvTEhXb2FLdXlWKzNxSkV6Rlh1L2Q2ZUlV?=
 =?utf-8?B?UXJzRkZRa0RoV0hIanE2aHc2YldobXFhYlIrVWxMS25SaThISmtJOWhZdlNG?=
 =?utf-8?B?S2dPaHA4a1MzU2VLTlBWbDh4eXJBWWRZMUIvanJ3dXpHV2JWUFdSTm8vTDlj?=
 =?utf-8?B?Y21UM2JuNFd5V1grdFJFeVFRTDUvQ0dnNzE2QW83VDNYcnFVb0htQ3RRamtY?=
 =?utf-8?B?Z2oxZjNVZlZicVAwNzhZNXVkeldZZ3NqNGlIQ3RsdWY1TGxGbkllbzBmUnpx?=
 =?utf-8?B?MmVXV2VYS3RUMTZSWmNNZEoyQUpBdWxhSm9ReWNlTGc0clJWOXhOKzJabXpY?=
 =?utf-8?B?ODZXMm1aZmRsU1lUUWlobityQkk1enJPbDlLSmhyWUFURFg2S09tbjFpUExu?=
 =?utf-8?B?aHV2VkptajAzMDNCQzNrSGpDWk1uVy95YXBXOVkrclRmVVRmUWt5Y3dHcUhF?=
 =?utf-8?B?aWtMTWNhL29laGRNYmRNc0FMNmxtUGhPSFlMa1kvMjZzc290bXNGYnJBczNy?=
 =?utf-8?B?OVJTSjB4YmUrTnRsVUhkczljNFZFUDNFeEpsOHlsYnIvY2hWNkUzc0NJeEQw?=
 =?utf-8?B?bnFRcjVDUW8zc3IvQ3F3cDR4dWMzRmM4U3cwOW0wZEtiTkN2RzYveStVdWIy?=
 =?utf-8?B?bkRLYUdVbktLQWNUNWF4czhHeVlYUGZ3MHlkcUNuRWwzNW84WGdGOVRzS2Ji?=
 =?utf-8?B?TzRrV1dTUWppbzUxMnltWFpZSkZFUjdRWjEybFdPTHRFdnRncXExemh2TEs4?=
 =?utf-8?B?VWFBc2o2eCt5K1F0dUNEUUVSMXBrUDVBWmpIV0o4T0s2WDhqU3ZabHRRQWJR?=
 =?utf-8?B?aUVvcWxBZ2dYdkQ5ZXFsZVZKV2lDVWJYenowMHBnTHQ0TTMwZUJaMWJRZ0E5?=
 =?utf-8?B?QjM5akFyUzFPUmRDa3kxZXE1UjJPSVh1aEVrczBBcHcxNWhnUXZxWEhHK0k5?=
 =?utf-8?B?bkdNc1lscHppTHc5SnVnN0Vwd3hGc3Z5ejNraEpzZGg3YndHRzc5TFRtU3JW?=
 =?utf-8?B?REx3bDdUKzdUdDdaWVBjNzI0V0ozaUg4b0luSWdDZjczdWFkamRzVHRBZjA1?=
 =?utf-8?B?R29jQ3VQK015RWltMzZ5NWx3N1E1YmZRNVByMmlaNUQwY0dYdi9iYSt2TDRp?=
 =?utf-8?B?UmNEeWFtZnJTT0hUZnpuSVhLSnJISC9FNzNkUlZIWEhkcDVxZkppZmx6USsy?=
 =?utf-8?B?bGNURnZCRjZNWHdBVUVJeTgvamJYRnBZZElFQVFRemJUL3cyaGNrSmdTclU3?=
 =?utf-8?B?Rk5QMXBKK2Q3MWY0M0pCUmZRRW54bytXVGpmVHpaV1g0VWc5UmI4SktwWGRw?=
 =?utf-8?B?alM1RGRObWdJUVE1cXpwcVZKYVExZUtZaDNHM3A4NjNIY2w1d0M2ZDVvWW9B?=
 =?utf-8?Q?4AjNxy2tCFJnu6C4=3D?=
X-Exchange-RoutingPolicyChecked: R7x3KAovoC1da+radYHRwZ/EF8h3e28nmeL+aGQgMRvQcRBmUi9Z3o50x06SpHBWqOxXFyUsX2633DFnm3cv9eSPdtkGoCIrYZ09nif8viukRxhi0wlQR8k5HgmGfRehUKtJsv0fle9/vHlTREB8LdRpUqT4adzq9A/lGMtjryPujZnfbxmsOc97K7F9+iXnHRNB8Xy8ClQz+X8dAO7Cjb/ufuMEBUzx2kNhd2A4aWu2JyN8CqIHDYqBmKHaBJSmnc29ReSZDUSf/PmJICG+qy5VH4zZSqjMEGdGlR1v8PkjbkHzXUhW3lpQZsxY5psIsRtwQrPCBKkViWtsKJOx6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 164f0f18-0744-4e00-d486-08df29db3410
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:09:15.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4v2sV3mgZ2qOIRtr2Agzw3MWTOm8iElp1AtswS3o3Ui9Rd5JsMM+sFJqT1EMwHDBUebeROPEzLY44fvm3dh+sBjGk8n0vco+PK1Xv8J7PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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
v5 -> v6:
 - Add an idm_check_quota() helper and use a single -ENOSPC check in the
   shareable reservation path (Satya).
 - Fix check_used() cleanup after a failed reservation, so it no longer
   releases a zero-length range (Sashiko).
 - Add missing early-return guards after failed ID reservations in the
   remaining KUnit tests (Sashiko).
v6 -> v7:
 - Use guard()/scoped_guard() for the ID manager lock in the KUnit tests,
   dropping the unlock-and-return error paths (Satya).
 - Make require_iov_config_or_skip() return void, as kunit_skip() already
   aborts the test case and reports the reason in KTAP (Satya).
 - Replace magic numbers in the KUnit tests with named constants and
   derive expected values from them (Satya).

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 689 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  21 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 461 +++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 1080 insertions(+), 168 deletions(-)

-- 
2.34.1

