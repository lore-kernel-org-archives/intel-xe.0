Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216BC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D957C10E3E6;
	Mon, 17 Aug 2026 09:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlKeMtKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A423B10E3E6
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786957844; x=1818493844;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=nnx4hlvpSEVplFCNtExvUrwVt/hDgXqpYbIjDyfQTdQ=;
 b=mlKeMtKhAeTLjHfXM0ZXDlxprBAs4XyhfYLTvO6uHJW/qw13OUK2oWHC
 6JZhFdVfikfPL0jPOU4zQ5nMhNcfy7wrN66N4VdSOoltQsj3ORHNmT+vx
 Z1kmEo+MvMUV4hthp4tnwoav+u24+/jpkAlpmq18hDokfDIkMTC+VCHQC
 9bNCeh2E3SC+JRi6yD01Z4FtU7ein7FysxipCMBo4GOhjoX6wMz4l3vfx
 8Su9ESzluBrygUGr8je3bFLaqXhX0d1kzkCdHAnAXxlQmX7+aJx+1wRrW
 xdtwqRYlmNQ00458s7Sf1V7g17msQk/A+VMdXtlS06nbaL3tN5NvUcmZl g==;
X-CSE-ConnectionGUID: drAVwtcCTSmUXMsSoS/v4g==
X-CSE-MsgGUID: Ifeiio9LTXmyHNA1fd+QCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104962867"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104962867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:43 -0700
X-CSE-ConnectionGUID: sd5XLq5QRSyUUVbvc/52cA==
X-CSE-MsgGUID: 3CkzJ1HXQ6qK7u8rNTb3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268703706"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:10:29 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgY8CgbXaeNBBsXs71WJ6njbCzWJfxCB04cRzU3X0l4T3VTAPwH/z9KBz48A8iV8NXbZfJ3vaFHlgwQh5KP57Vc4JXTprpVsYazAYhxLvtg7g0DGL45tJpyKXXyE9LT3rs42qkNVDVj1RJCRCh53Ad5wg4FNR9Xr+xzZwsCi8AfnMsBQ2Rpqxlz7PE84lQuyzSgaHAEts+2Snbv52k32o0ohbSCFVMDc1Sqz5UY8g/OmGQHfcXJAAOFKpkEBbB6MF/mzZUUNoFgg/8HZqgatfWLYqoK4z4I7VVjDwD6IHIKkwXp+yME03CNU5cdKZ6sgd+qDpOO1qRfbQY6kGbuLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NRFbnMhuLDNOkgrnWSgJsMYOz6jaCeS3x6KIFwBepg=;
 b=gehBb9zdoEC8UL8wbfWBgB/BmC/WclnsjPKRGZN+uUd8kXXgyyR3WuxS/28osriZ3F7klhBh8ayucJJcEXNIn/KnrzCcZYNcA6X/FniFQxniOVtQeovULXKCfzMfA+7ztOygZodTh5cIvDtvphwq8gt12E79cPiul5oN7z0gHFjeRjH4gOGtkU69xsucg4OQF0lgFJmrtGjFfJFUrkfsWLukRUlpGGCKnUlpRzUuEqOe9lt3mGvyWG1tsC6Jl05oPJGLZy3TGF1/BOb9nLjb3c4ifjdMrGMQyyfvV3Y47uh4pgO6O1zcITi50jyxGsRaSeqO3PeSFUkAWkd3QbL9kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:10:27 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:10:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/4] Split GuC ID space into usable and shareable pools
Date: Mon, 17 Aug 2026 11:10:09 +0200
Message-ID: <20260817091013.280173-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B76.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::61a) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a38fa15-d36f-4efa-03ce-08defc3f60a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 4090jaaOtqjRy7wh7PWV1txEwyMZ4OYAJCMgI8lMyHE5hnm8DX42iglPMA/4Bf3VbxwDiP3KO8VdmQjXfwwuvWi2CthyudCeUNDtma7RhN9krmi4zPkt3mTtwZ0LTxk+Ef5UytGSPP/oGbfzaKSoBDGRnJ1QwnA0V5teoWqHAFFW03ml9XXSDfJEHZ5JlC6BpcgjlOxGdVJGozgn+drFk/5CQPgHw3CCf+QbDAWbjcWE8/0r+0m8cFYKp0WvJe92LINU1pJOdMRfTo0MrY4FIawPcP9kU3rxvyDieKwWyq2nuUFasEOjJiRUlHhacfWa6PmHaOqvMV2q9YyNuuDohxN/RsPX+0qiDoLXqfOEdxSe+/RNPk++WeSjlzgx/yBuYy3m77J0STakJaKBIMv69IOknjzlu0nr4nnP/w6Y9QwvhqCPwgdj2uSYM++FDdtoqyeTjdAZZgtCcs2IWpBgWNkugmJ8JnEFsw0BtiriKiMiyFlRI1arNXv/rnRESu6G5r/UF3Izxws/Q+TnPH38hwwgRtQuWr60ltT9ZDVo45iv1OWs1puwoFYQ1lCP/Jx9sKEYJjA6bSO1Apb4VFfG+1G1nH4dsAIaJ7PkHnENciFwA1ntL0lKEM73+O0l0M7HRL931NfqOUgsXVY0u3d9eWRd8aWe7ymPuE2FHDZnZJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2lUVWpqN09qWjMvS1RNcEN0QWFCd3pRTVBtOFR5U2NrdVgxeHFibWpITEo2?=
 =?utf-8?B?bTBtNnBNbytsNW5XZUd0c0hhTHdqVUtzd040WDhHcHZ0SjNPd293ZXRYbUk2?=
 =?utf-8?B?SVVxT2lDenVqd3REUzZBempTcW5JTmxocUZGMTJRZ0xwWEZhWXdpN0NsbXQ4?=
 =?utf-8?B?aTdUTnZXRjdvT3BQOXBnckcrQW9IbjRqSnpPZ00xK3NLWnZ0dU5DRTFqZjJk?=
 =?utf-8?B?TllyY3BRSWJNcHk0WWJpbEUzTWZsNk5iajErbFM3R3B5QnRmdEhYbmlTVjk1?=
 =?utf-8?B?ZVVYZExlWlRVZXM0VWhSelRGbkdWaXBoN0NDa2dEU3VoZHlHNHBoNWVrd2xk?=
 =?utf-8?B?SlBCUmVhYWU4ajVvQlc2WHdLd2FLV3Y2MU8vNnNkb3FoVGRFYStHTDFpbU5L?=
 =?utf-8?B?SytKd1cySXZra0FSZW1mVG9DVVU5cXZkekU1emxWOUdQNk11N3oxYXg1SG82?=
 =?utf-8?B?cVl0aUhCckRCT0dyZVlNUkJvVGl3MGpYY2xYdlZZRlBoNVVIRFZ2TXhLOU9R?=
 =?utf-8?B?SkJFYzNTTWVmYzFGZmd3YkdJTGpTd0tDKy8xbjVWK2FRbVdiTHVrQlM4Smly?=
 =?utf-8?B?c0liRWp3Y3lPYXROMWVNaXFZRXdQdU5PWnRQM1pUbU54aGtoN2lqb0wyelI2?=
 =?utf-8?B?OW9Za0hnOTZxTm9tM3lCUUM3L3dQUlU1UnNzZW1nWUJ3Qy83K3EybnoxMXJu?=
 =?utf-8?B?d09ZclpMT0VYMkx3M1ErUUxxNk1EL3hSN2FmY2lmYmcycEVDOGNCZEx0OFpM?=
 =?utf-8?B?OGp0MTVlTGtkVCsxOHVVSkpEYndCeGwxQnFURUxvYWFLcHVJWnJuaVlkMjhX?=
 =?utf-8?B?dFA3OHZ0NElMRGJ0YituZzl0M0R5Y05DLzlLQVFmWFRWRFY5UWh5Ynd5RnU4?=
 =?utf-8?B?ZjdCendyMVR6OGtnTWhsRW04czlrOFk0VmNpRTdnOThJZHM0SjhZSHlpSnZj?=
 =?utf-8?B?dzVNMDRXNTZyTmViU3MwR0RZbHJYZ3JmblpIZDJVMndiTW1DcWhLemYyWjlU?=
 =?utf-8?B?bkp3N1lEZFV0ekp5d1hXcmxycTRNSG5mT0I3TlZiYTI4YkxFT2FidTBrYjNH?=
 =?utf-8?B?bTdsQzlQUDNhbXlYMjFsWHVybXNKQXovYk40VjQyOWpTKzZ1bEl0b0s0UmFX?=
 =?utf-8?B?eFZtRXlLL0xIUStEWjlKeDF2bmU5U0NKT0x5NExsdnIzUWJUZk9YN1NYTzFK?=
 =?utf-8?B?Q2VFRUNCcEZETmQwNEU1VktOY2I2VzZjWGZHNmwwUk5WSjQ2clhwa3Zhck9C?=
 =?utf-8?B?RXczWjV5Vm9WUFU5SXBqZ0g3SlczUUE0M1cwbnJrT29Xdi9DQmgwQVMzdUVj?=
 =?utf-8?B?bFJvWmhhMGRlcEpLdUxqcTlpNDNNQmhHbnZOYVFZeGlBRGpWZmo1eWlkZ3h0?=
 =?utf-8?B?cWs3STNNam1ZMHlBTXh5TjJ3eDNLR3lJMm5ZMDZQRXZVaXJuVUgrRmdsTXZz?=
 =?utf-8?B?VW9WUFdCUCtkWURhQm9Sd0o2S1JkRDk2SFlTZWxxaUZnaXQvYUVYZHBEeXRH?=
 =?utf-8?B?ZXp2M2x6b3k4T3JpRXB1di9zVVpDNFE2bzI2bWgzcW9xSmg1K3A0Z0xpTkg1?=
 =?utf-8?B?TnZpeGU5YkRwcURnUjRuaHlKSHUwd2RvN0xOdUcySFVGZ0g2RE5FV29FOG1F?=
 =?utf-8?B?T0YySkpPNzBvODlGQWgrNllTSHN0TUw2UzJQeVFVLzU0STA4ZS9QSzdraXIw?=
 =?utf-8?B?bndsa1BOVHF2ODNRdzQ3emphcm5uRUdtU2loVEQ3bTh1WFh2dnFGTHVwNVh6?=
 =?utf-8?B?ZmNiazJ0U2dMOExnSVhGUmhSZnNuSVBKNWkwL0ZFMFROaVMwcnN4cko0NjVj?=
 =?utf-8?B?VG5Eczk5Rll5b0ttcjBwWEJGb0hiRzNkQWs4V0NpYTRyVndUOTJRamhtUUc0?=
 =?utf-8?B?V1Z1cFNXcEtFbW9ZS0VwVFpubmZKMzFPQ3kvcEpUKzVzOHptN1hwUUZBT2ZS?=
 =?utf-8?B?YkhmRkVvRm1tS0ozRVl5RzBsR296MEJjMDVRZmc1U0VDbkkvMmFvWHBQUnN6?=
 =?utf-8?B?eWlVT3p3QThDSXZvMHVld3VYU2hjZTYvMkFYSkhJbFhFK3diN0wrT0RtdklM?=
 =?utf-8?B?SnAyOGVHUVZsV2wwOUJhUDFBR2hIYUovZ3Zxd0srRi9Dc1ordmxidmJ2R1B4?=
 =?utf-8?B?b2E1bDlXdVBJbW1VYURNdVE0OUQxamg2MTlYaTUvRnFzUTJzb2pYMlQ0VnR0?=
 =?utf-8?B?THB2UEZOYm1mRXQ1b24rMDc0a3p4N0VJTnV1N2tYMFBLRUJvblhtMlc5Qm1G?=
 =?utf-8?B?WTVzVnpoazZ1c005aVpFYXR0Sk9nTWVSVFpZei8rV0RtL1l1L3NTZ3NHME9J?=
 =?utf-8?B?OGV2ekQwem9jQ2d0aUpVQ2J2eDBuc3FUTTN3MC9FN2JDSUZyUFFIS29peVdI?=
 =?utf-8?Q?JahGEe64FtHyfZeQ=3D?=
X-Exchange-RoutingPolicyChecked: sVMtm4zDDrEMCSF8qOieTEIyT+MHD2CO+25yPWT+kqe4gfnggbzk55e9bL33Ml5MJAMbKY7lJLYhLzGmfJoLF4ZXyKqtPdH9IYb0/jOovTy25tzFUMnH4jS3+2klL1IqcW9ItgiCTecpQB6yqhC3KU54IjK9OIRVCfRr5VrjVYvqWmlrnMSdn1z9mR/QohB2a0Dj73x73H7T9Fdfm40v4WzP+Li2QRQvzlM1QdQfx78Gi6iuSSoOgsYxQAjXwu6YsX+GLLyewDPrZqXRyFBSM8ZwmDSYtGyvNbZGx+qgg4n4mTjgokomiw6+0RjJ0aZz80I+Vhl+zTX/tOfbTvmTnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a38fa15-d36f-4efa-03ce-08defc3f60a2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:10:26.9147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aI2IxPF9+kyDFLfPLaqfLYlzTp9MdETE1sciQAq8bSE4Xj1CkD6ZxQ0SkAoP66KArW0NRNhl3uCKrkDgkXuHhHwO0Fnz4B/FyiRfTmrOoS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 557 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  16 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 448 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 953 insertions(+), 145 deletions(-)

-- 
2.34.1

