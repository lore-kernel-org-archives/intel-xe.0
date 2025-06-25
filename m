Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA982C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9A10E6D1;
	Wed, 25 Jun 2025 15:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9AXmNyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A84910E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863725; x=1782399725;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WeofpcDx9bp98X1M8xnufgzIo+pxy2VMzrgrwIP9Fy0=;
 b=J9AXmNyxmGsBzFeji0L9t55J7+qV6X0x+H+ibswUBiq/LpP1YUlqdvhq
 60rh9w/xZqYKaICBPUNhcLJMqp+E5YkMrDrhcFyjJ8hekd8COZ7GlMMGF
 tVaBjjbLziSY+jbfKInjEkPEdpX7i7WF9vYZ6c6ez/iE4p3vbg/rTE/TR
 0CPPphl/20B1TNI5O3Lr0AtXcYkBp+/KM8dsVGFN7L9FAYjVrBe2CdFqW
 Sge+BaKW1f2hP/+PHJkgEutrDYz/evvbBmyfzkAS2FA2DiMOnRrJ2fz7c
 xPPIpV6nzrR1IgroNtX9g50rtiofSReNSgCLwCK8Vl9pyGXTcwxmRRWfY g==;
X-CSE-ConnectionGUID: mS9Gt3/uSzqtpdHEYREABg==
X-CSE-MsgGUID: QyTe6E7jQKaIUZtTGSuQMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64494800"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="64494800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:05 -0700
X-CSE-ConnectionGUID: juQ43LH0RXib8Pq/WuxKOw==
X-CSE-MsgGUID: kVlPlAheSKqP6lLetiRy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="158003011"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:02:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hD6kQ6scxT36lXJYw1Yd+k4pcTK+Y9yCWrZDUrEEkn8ElGOiRXNJc90fcPUYIdSL0k4lqqwMDCZrG6W1Lq8zkPj0fEQEjE3L8jxRgTnuH5eHcq2Ebbw2KKd7MHVjhBBWqMkEqU+RN0+99rl1b0wxBrkcjuKE94i9bEOwvpVjfYUCWNZn6Up1fZnIErkjeT7zn/u/M6ZIoQkV7a0Eo00wakpX8XdB93izaKAC+D3tYJWH9MrIjaYBx6VPtWYob8AEIXE4MUBoQMhYoJcz3JJuYTI2c9HC1kEQ9kzFZYCItn72LIk7oRBU03yIW2i6AnwVc9wcSKJdICfXb5HzFJfzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs9+aSbm9Sj8xQbZV5b52d//pSGU40//lee5rwdAFUo=;
 b=mQ4hjIaJi4EoDf/1k5zQjxtY/WlZkxMWn2+Zs2tOPpGQ6Sq9MB35UkSMbIJjZVJ4JP7I5nS+SxfM4X2G1J7WNRHyeleM4YFyluko+eQ3pXB8PH17u1BcQOGD/rpwQIOzNOISySDrK2F9QRIo+6EmQgB+G7po8BZCy6/I23hz98GbTECBP/vgQ4887W3LDOxBI9JVT4U33jrSyDt6FSzTEgpGjWkylhw6wVcHKhXKeNhENH62CFCfn0Ivh6+KRiVbdOq2KnjvZTyLIW8tkn80uNArpX/qS8haf2V6YmcXV1VL67gxgRg7IvSqnIngC3KjkJ6Cys6HYu57Xl8DmLpDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 15:01:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:01:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Wed, 25 Jun 2025 17:01:12 +0200
Message-ID: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0606.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 22681715-b0d5-4070-af64-08ddb3f92bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXVVQ2I1ZWxYY25sRXdDQXN6QjZOQlRHcE1wUlJPVzlIbnJmNHc3Qzdualpl?=
 =?utf-8?B?d0dFZ29PN2x6MXdaRUIvVWlkbi9RVXdMbyt4aXFFK3U0OEtVTE1hdi9LbHUz?=
 =?utf-8?B?bzBFU3IyRzRSN0NHamMrVkNTUDhNaURTd3pjTnVEV0Z2Wmt1dFZzQ21JZEZt?=
 =?utf-8?B?QklydGlnZTFTSTJTZ2I1MGdiOStGYWxIMm9FTy9DSTNYdk92aWJPVDd2eGN4?=
 =?utf-8?B?eklDNDVWM1BXbGFvY3J4RXRUeDlEWU94QjJJUzExUFVuTkI3MlBVUjZVaTNM?=
 =?utf-8?B?YjBhVDJ5M2kwUFdveUhZbDFKWWRpUUNxNDJ3YlV6dGxLVndnZGh1VnZESGhy?=
 =?utf-8?B?MS9HVkhQbEloZmpjT0UwUmc5eWxOcVdNMjl5YUNtM3JOemZXWmR1bnVNa1hU?=
 =?utf-8?B?d2drQmNXNTFDLzZWLzNzT3p3Vy9ETEo2YzJ0dHN1QXRaM3FRVmxwckxvb1Yz?=
 =?utf-8?B?dzk2TDRNV1dGaWNLUjJOa20rYm8rR0dDeTJlKy9tSkYyV1BBeGk0UUdlOHd2?=
 =?utf-8?B?RG1WUFoyMDQ1cXJOa3BILy9jN2ozNTl6dDBFdStvdWJGQVpVRmRWOXIxMzkx?=
 =?utf-8?B?WlNseGI4U21nUzhSZFpOZ2tmc1RzbFE1RlJMQXpGWVFpRjN2VXNrS3ZnclJu?=
 =?utf-8?B?a3cyQlNKRUROZmxGYTgvRkN4ME04ZW9seTBOcFViSjRmMFordHZFTnVvN1p2?=
 =?utf-8?B?VDRNME9LNWdleU9RM2plODkyYzQxMUFlUnZCU2dWTGxDdjQzSVYvRGQzVjIy?=
 =?utf-8?B?UDdLUTg4Q2FFTS8waWxjb3JJdmhFdFYzQ3BaeFY3MkJzMHMrS255Njk0YzN1?=
 =?utf-8?B?enU1MlhiYWVaWVdEK1F5amlhMDlGbWRoY1N1UmZ5VVBWcTJNWC9xTEd2aXlH?=
 =?utf-8?B?MHcrckRlMVFveENpK2dzc0QrZi9LWEIweXhwVU5nTFBJRkFacCtOT2VXUDlw?=
 =?utf-8?B?YldFaExpbWk0dDhabXN3bFJnT0g0OHpLRWlodVRqb0VXOFE1TWJWTmVqZUtT?=
 =?utf-8?B?RVdLRUlLUDh0YUgzdUE3QVVQYlpnbXFFWjdZd29EdXVUc21HV1p1aWJ2UW1K?=
 =?utf-8?B?UHhPdWRHT0dVMUxEZ2VyTHBoMUppZTBxbFdtVkJ6ZjlCQ0laUzF4UW1KMDR4?=
 =?utf-8?B?cVdQVlpMMWFQVWxrMlUwRXpVVlBvY3FxRktRQ2p2dHdnTC8wVjVvcTZGb3Bt?=
 =?utf-8?B?Tmo1SjRiWmZia3YzUkN3OFpiWURaVVpaRy9VbkNCTXVQeHF2cDM3VjM2U2NK?=
 =?utf-8?B?UDFpWVRCNkRiZkdyN1ZLbzRnSWhCN2JzNXJzMDFFV3JQMkVhd09MZjJ3Qk82?=
 =?utf-8?B?NFFTQnIrVmo3aXBLWnhpVXV3N2d5a0krdkxHMVNNT25jcFdCOTllLzBldURK?=
 =?utf-8?B?OElUeUxqVlNWVzZMcHlZOVVIRUVhVGJWRG1uVUtRbkFTTjVGQ0tTMGZLUmMx?=
 =?utf-8?B?QXBwaThvODlaV28zYUVjV0NmNUpEUFpvU1p0dnRCbmRDQnllV1JOT3dGdFZG?=
 =?utf-8?B?Zms1Qk14WnkrdDV0QUFTTExGZ3RBc3FWVCtMeGRsZW5naVJaQXZaLy9qb3NN?=
 =?utf-8?B?TU82U0NQbWhkdkVLbldUNnZWWjN5ajZNajQ3ejZ0eHhFS1hPUXQrQ1Vyd0Zi?=
 =?utf-8?B?L1RCMHEzSHFYOEc2eWZ3eUMxcmpGbmJGeC9pQ3AraVArR2JkQlpFZ3dKWjZz?=
 =?utf-8?B?cUQ1cGFsQkZlek1zdThUOHArckYrNnJZTnJ1ZTdub3B5SnZJc0hiZkl4VkJi?=
 =?utf-8?B?VWRRUGVFaVZuSHY2RGJSVDBVRGE2aHEyVS94ZUhzdXFEdVBvdTlTL0RHU2Q0?=
 =?utf-8?B?QWp2QklKVEF0MG5HdFdYaHlKVitoSXpmelJjWUxha0VGZjBLQ1Jtb25pVFlu?=
 =?utf-8?B?RGdKUk1wU3RsRmNXYTIvc1RObklSN1FwSjdzTldKS2NpVzlWdlAzTnVSTldV?=
 =?utf-8?Q?8OgH/RTNmGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENSdGhlRnl1SWlES1lMYmFiQ3ovTWdLWE9BQkJ2UFdXWDdwTGJmd1BUUXBF?=
 =?utf-8?B?YW4yQUc0eXFQSkhhc3o3eFE3UnBOeSt3d1laT2pCL0dCUkpJZC9zcDQyZDcv?=
 =?utf-8?B?NlZxTDlQZWF5ekkxeFJyTmtxZ3FUdXMrZWNRY2pvSGtxbWJjVkR5NEVySWU3?=
 =?utf-8?B?OVNRK2s1VHgrdUppYWo4ZjRDSDlaVUQ2Z3ZZTS9IUlJ3dzh0S3lXR25wdWV1?=
 =?utf-8?B?QUpSSEFHV3B5MW1PbkZ2dXI1amRDUmxHNWlRUmxRd2lXbjd0L1puTUU4QjJv?=
 =?utf-8?B?ZDNOL2hDbjFwcEE3b1pvUlNWUjFJVDF1WGdjei95OXdCZEQ5MFdKbkFBZTJW?=
 =?utf-8?B?RE50U3BqdDhlRUx5RzF2ZFVhVlp6TEkyUC9pTWJ2R0pTdnpidHBZM1c1U0Vj?=
 =?utf-8?B?NGt3VXp2OUxGd0lnc2JyL3JYVU1BNngxT0ZQeGE0dVZ3VlBUa01KdThvMmha?=
 =?utf-8?B?NWZJRjIva3RaQll5ZWdmakhuZnV3aFJKdkZqd1N0a2IvNlQrNTdtTHpKT0Rp?=
 =?utf-8?B?QVo0UENEZ3htT1pVNS9BWXJ1ZGJWa3ptM2tIbDRyTFYwenAwNFVUUHU1ZmVW?=
 =?utf-8?B?NHlMUm9NTE0xWUFNUlZ6VEFWOTZ1NWoxTjNMQVB3WVIvV0FycGp0bHVTTXdY?=
 =?utf-8?B?dmxuNjdqbjcrempZY2UrR2NKeTdTc2NFc29oTTZEQnJqeC8rT2pVbTYxZUdJ?=
 =?utf-8?B?NCtHZUJYRDE1RjJKeVNKdGpFQVZkOUxZbE4xUkhhM0hWNm5mNUJscjZ5Vk02?=
 =?utf-8?B?Mk9pNzdabGxQaTRUamF5UjdxeGtxU1RiK2tVOVRJZkh1cTk3bXF3YXF3eEJR?=
 =?utf-8?B?akFaTnB6RUVYVEl2WnRReUlTNDl3aDZLSlRtdmZ2RnV5V2VBMTloQ3J1RWZQ?=
 =?utf-8?B?RnNZdDVhNGJLSTJIVDE5ekg2c1Q0bmUzNVpZcHdmTUxxL0dpZzU3c0MzbTcz?=
 =?utf-8?B?cUZBbi80U3VjV0RSUVNaUllhM1p1NFYxTzRRMFFKcFIweURBSVByclBHaUZk?=
 =?utf-8?B?bWtqb3JTeVlsZHlUeU5CMmFVMTlKblJ0d0tLUWVacStzYmY4OXhjZnRXdytw?=
 =?utf-8?B?aDRiN1VNb201SXVZbGY5VUhGN2lEWDBNRjRGZ1hGWEROR3F0bFgrWThGc2gz?=
 =?utf-8?B?VWFUNE9BU3ZuTDNzV1liNVVyakE0QUppZFVlUW15aDlsTnRlSmlkS0JldWg4?=
 =?utf-8?B?T1pubFNCZE9hRVM4RTUwUWJYR3Jhd1ZlMUR6MG00NGFrbmoxa2p2NHVOQURt?=
 =?utf-8?B?TjZrYnZjL283SHZPYjNTSnAwbUVOTmp0djh6SmhFeURRL3dXWjc1RHMrdjBU?=
 =?utf-8?B?Vkw3dkljMHZ1OElKWlhhQzZ1MHR3UUwwbi9zWXV2ZVNkNnpFNVdDRHUwYlg5?=
 =?utf-8?B?UmVGMDRNVVVFOVhnSy8vTjJQMWhvVGp1bFBMN0U5a1gwejRPWktGbFdseUR2?=
 =?utf-8?B?U2FPNHQ4YnlRTUZScnJRK0V6aXF3YU1RTlZwQThsRlp1M3ZubU1UNGM0NEtZ?=
 =?utf-8?B?d3ZsVW5XRjFINnorMHJ4NnBDZE1BaVdqV29UV3FCaHY4VW1MeklZcHJQQnFz?=
 =?utf-8?B?cjFqRExMVzk0a05NdVB5bVlFOExPWkVPYUtUaGQwSkhXcmJhSlB0YnlPTm9K?=
 =?utf-8?B?bWpiRGpyV1paSkIwUDNDQ0VINzFDT0l0c1VlcmFROXdvU0hKUi9KbzRQYXJI?=
 =?utf-8?B?eWRacFNMTjlJdnRqdmkraWIrSysyYjl6aGdyVEFIN3VuMmtOWWZJSng3Rlh4?=
 =?utf-8?B?c0dldFhHNlNWaS82YzJDOFBtdlBKMTFuaGhheWoxd1hhTS9MZjRGODVWZ1VS?=
 =?utf-8?B?aXk0T3VyV3dBaWptWUl1ODR0emh2cmRTZDBTeEJwdUluNzl4Y01wU1NNRzVJ?=
 =?utf-8?B?WkRBYW5NUWRVd25sMkRrUGZkNkxBQ1FZZ0JmWnp1cy9mUGpaVEVHWlRvU3Rk?=
 =?utf-8?B?eXlIS2xwQi9TWmtjL0VZOE1tMCtaeWV4VkRlN2NPcXlMa0ttMTBDN2QvMU9S?=
 =?utf-8?B?OEtzQUttRnFBallkWjNrZzNDYjczbEJPV3hEQWJYT2ZRUXhudzI0dm5Veno5?=
 =?utf-8?B?TkJmWWQvSUlERGJoNnZFb3M1VWEzb1RGUDI4QzJTekZCdFphaFF6bVRoL1Fy?=
 =?utf-8?B?cGZXRUc3V2J4RmIyT2FIMUZLUzA5MDg0LzdOaGFJc0RSSkRZODJoNWR6LzlS?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22681715-b0d5-4070-af64-08ddb3f92bff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:01:32.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbT0koh4CFUEpKIaCdOUmcIiQPE8bxZQbjU6zT2EFHxsHk7jqack2FQRVIpPUjzUHzyz3MXtet0a7Y6oa1XI3+nk3x4tbDVrYiq8l7GvPgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9130
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

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)
v5:
- Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +------
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  19 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  18 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  58 ++++---
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  19 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 163 +++++++++++-------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  82 +++++++++
 20 files changed, 313 insertions(+), 181 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

