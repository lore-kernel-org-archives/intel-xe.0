Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F1CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746C410E384;
	Mon, 22 Sep 2025 17:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxBJtGW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230810E4D0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758560869; x=1790096869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CKqw4cgHVPV7JSOzyqyyfg3y9kB5LJnEx/R5p3lbYtI=;
 b=nxBJtGW+mLbKpRSBFM11mw5cXPVpWQgI3X4dOC35DR1JWm8xqyeIiJ6R
 ZtpoQb2oUJSkMlu55hArUpEUYjuA8HmiLWjzPrQsy2q8ZK2jdldHV8Y87
 Eg1svj2kSMKEcfTtlxk/TLlX5sTFgtKUYVJrfEQpuKk1+jYV2xsheq9BI
 eTM0B3Dq4NTUoaBCD9KaRY5JRJGbQgJdtn0UFk3TlFtvtuAWiVcnMbp/y
 0MgAmKVqzKcNSNqdoWdqhJr8J9F4BBfpeBCs1tO6yFgdYG/uGDWxurho+
 Pv2DoEnnjs9T2mkIr1XuSldPbdFRKOedI/FxQ+rJjmxFQPqacPFc5CUyS A==;
X-CSE-ConnectionGUID: wceg/9xARB2bbiSbGKn2Bw==
X-CSE-MsgGUID: VNLwHSUQRYCyAmuy3gcuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60527415"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60527415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:49 -0700
X-CSE-ConnectionGUID: mOc9yJt5Ray+XGbLzRHhDQ==
X-CSE-MsgGUID: 66mGWWD6RXyVdBf3zJfjKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176456897"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:07:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:07:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIJjIxCkqOrImYFOxHeXK8Wd+NbQunVXpN6OYKAxjvN79iEREt5aVBTanLVf+1ToyMw6GxoztAQSlnD21ZjpcAV8fpM8YP8KmUH3IE0JW5nFyO1NbwlLB75CLk3jR/aVnbqKDuByiCb+GnPIWvPRQtqCibuwJJDuWMZs48QfXNavaa0kUoiEptAoszdLwzxirkynS8k+Ucr/VOygiLjy04TBu1/vluw9VcZlgZVfiZQlcj1NrS7QsBwqIz7y4DbUQdY8EBCx5Ap0IGBjctwos2pYt0wrJDfyLDN7UBHHTI26P1T/yN06hrRLS8k6FQS2oqkRip6GQLKOtufGVP8xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVw6yBCpPwq2KHJ9mNi9PI3PVuopWIt+yhntsKEvDbQ=;
 b=gq591rXs3UrXEYKJB2w4nqZ0e0E0ujuXNfbk52jfAURKLtDA8BKH36LnW0cGe/TUVIkv9Mo4x1es9c9I1NeZKwA9VvucGUFwCz3Q7K6oD9B+zrqfFlfvlz7ffF5A284U+u8ltQnOD/U3UDh8Kp7d/5vtmfkqjvpbWezGT1wvkzhT7zk9OMqpm3Kqhxk5Mv6Q3yzvvRe+jIpqsdv+LLsxSMucKyHp4+GqWRW2NKIl7YQ+rUu+7/NnLYsZw0id0U0DDVb2CrcZZRs0bHqU1EZd+hlvm+z7NKKPAU5+o5QcjkNuvlipjSy/8ljVlKEk7hM/ggxStLYojUcNoS+LIYxWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v4 5/5] drm/xe: Combine vm->xef and XE_LRC_CREATE_USER_CTX
 checks to detect userspace context
Date: Mon, 22 Sep 2025 19:07:07 +0200
Message-ID: <20250922170707.1556781-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 39163a24-4d13-458b-6a95-08ddf9fa8cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0tiZlFRSktlOWUvUCtESmp2dW80YklNaHZ0NFFiYXQ2ZnIyVVc2SDI1emNz?=
 =?utf-8?B?RW1IZUo2bDJjSzFsRkdZOVBTaGpMTDEvMnFkYnVnL2k0M2JZN2xvSUJURm9G?=
 =?utf-8?B?UlMvZVkvMDBLWUY1TVVpS3QrL2VpZzZZbEZBYkFyem5zMmhmV2U5QjB5eVNv?=
 =?utf-8?B?SUthaG9uN3lvdUhXeVJUNkNmdXNjNU9sY00rcDJtTDhTMldJU3hIaTYyd1pr?=
 =?utf-8?B?Rk1CTDNnNDJXdnVvSHNuaUV1Zm9GcloreHV0RDkvQVNOaHVFZWRsOVkxY2Jo?=
 =?utf-8?B?RWxpNEdqYlQwbllNZDljN2xnUWJVSUdEUWJBR2hKMm9BeTF0ZDJqNUdxdFBB?=
 =?utf-8?B?U2JTTmZRUzJUZ3had2pQQ052ZW9tQ3V4amkzbDRkRjQ0YTNoR1NrbVdQN0kv?=
 =?utf-8?B?YktmSXF1U3h0aWRLN2RxS2xrODk5RGJBL3JhZ0hybDFtY2Fpbks4UjVBSktz?=
 =?utf-8?B?YmNaN0FycWttZkRPdGZseHpIcWNyWWNVS3J4UGg2WVMvUzByR2l6TzJ6eUdN?=
 =?utf-8?B?T2J0QVNaS3ZYeWZhd1dpSHZDVmdvaEVTaXZkNm8vTXA2amlLLytKUDVHUk5i?=
 =?utf-8?B?ZzFpZWZMdlNWSWY2NnFqREVYTkpSWFVmYm9pQS9CakVlVjg2d0xHYzhadWV6?=
 =?utf-8?B?RDNyWXAzcitoN1hEbnMvWllEaFp0Z2hOT3htOTdTQmgrd1RlTXpURXVQei9q?=
 =?utf-8?B?K09IS3BJaE40MmdSVm43ajRtL0lnekVsMVpXMlVJakk0NTR2Y2VkVGtDNi9U?=
 =?utf-8?B?akhFUUNsdXA4djAwU3NmWUNKRU5ib3R5Rk15NXlsMk9PSEhabnZPVXp3eEx2?=
 =?utf-8?B?YzBKajgwTThpVDdqUzV2N1czY2oxc0JMQnlLN1V2cXplT3ZONHUrOStMclBH?=
 =?utf-8?B?TjZjR0Q1VTkyc29wUDhEcGdWYncyeEdOcjZxSVhybE5aTWJ3Uy9CTEJ5OXlG?=
 =?utf-8?B?cGp1dllRZUQ0T3ZHaDB2U3VLdng5Tm9NRndnNlk3VnJoczBBTFJoWkFKQnFS?=
 =?utf-8?B?L3Y2dTJqWThTejZqUlgvRlY2RkQ1L1JYdmx6MzZDVG5GdU1DdFV0MG5SYk5U?=
 =?utf-8?B?bXJFM09EaTZiT3VNbWoyM0loeEJMZnhPM1Vsa2habXpWTDY1SVhTSmY5MkNG?=
 =?utf-8?B?dlBzTUhSVXVCTmpzWHpkVmR3YnJMSDBhN0l5VHQzVENBN1lHTXhkQ3NSdE16?=
 =?utf-8?B?dG5wN3I0NFRZbmFRUFFiaU9FNVA5WjllWlZpR0hMUTU5MnYzRjBLYTV2Yzkx?=
 =?utf-8?B?L3FPazdNcmVqQzEvZHBuRjg3RWRwNzlYZmtsaDlFR1VCSWpHT2IrczFRWUNw?=
 =?utf-8?B?aXlObWplc0QxRytCVThIMld5YW9sejhHMmRIeEF0YWZldkVDd05yQUYxbG1J?=
 =?utf-8?B?QjVINWlQNUttenUrN3ZPa3JLcmZQYjZCWXB1V3BXQS9sYURVeFhuUjVuNU9n?=
 =?utf-8?B?aTQ2WkF3QzBZeXQ0aEFIODljMTdZVDdMeDlMNVZQS2x3TXB4cWxVNWZGUVJu?=
 =?utf-8?B?VnZZT2VVSzdVUjFkb1VvRVE2c1lQRUR1ZnY1VjNDQS80MXJMUlhyQS83Mnl1?=
 =?utf-8?B?aEplbzlLTGNKRzIvRENkZnZzUGZOeXVrdm5yWFUveWkxNTRkZnBKbjZWWjFr?=
 =?utf-8?B?aGVrNkxNMFd6MVN0TkI3ZTRGMmpVQVNvdFFmN091VHY5UnlPM2lXM3FMTFhF?=
 =?utf-8?B?MVAwSVRYL3VuVTlsU3lvbWdKbGNWQzNsRENCUVZZOEVnd0pCbnVNMHNLMlFn?=
 =?utf-8?B?NUhkK0c3VFpJMDlGMnNvS0Y1RVFyOTkzV2ZCU1NKN2hsdWFFc1VFYXVxYjI2?=
 =?utf-8?B?R2pBU0xXdEFvT0YydzQ0Y3hJQjRmNkhqbnRGcGk5aG1Ia3VKc3dNcXdnazhs?=
 =?utf-8?B?Wk9kWTBkUjlZNUQ4OXArc0pUQlRkRmNCRFhoYUFLR0hxZFZ5VWdqci8ybFV2?=
 =?utf-8?Q?N+J3JxhpWs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNRc1A5dGJyVXJHTDAreWNzeC9xYkk1TVVwQWVDZXJmM3RlVHM5Vkw4d1pO?=
 =?utf-8?B?UUtmcmxRMk9vZFlJQlNMZ1N1M3dQd29RMnRnZ1ZKSGk4eDB0K3ZxK2tDV21D?=
 =?utf-8?B?N0hJZDB0V3VEM0tpSGZLNCtDbVRMM004T0ZNMU1SNFRhRzNhak01YU42ejAw?=
 =?utf-8?B?OEtUSFgvWkE1V3hmNmJrVmpJMDE4RnRrd0RBMjdJSk5qZk11czdONDhGOGE0?=
 =?utf-8?B?OHQxRU5kN3JrM09sVFcrZTVsWlhIYXV5T2dHbjBRbG9KM29veGR2RS9USDlv?=
 =?utf-8?B?ZzdlWnlDSDFhUzJaZmJyTnBLY1RyM2IwOGlEVkJGVExrNWRTSUpDT0NKVFlE?=
 =?utf-8?B?ZFRNYUkzbXhLSjNrc0J0NC94WHlnU1JvQW5FVk9idmZoWi9GcWROcGNZb2R0?=
 =?utf-8?B?bEthOE9nT2hNYVQxWFpFWjhaS3o0ZzRjSEtuKzFCYTRWYmxBdnU1T3JmYmNT?=
 =?utf-8?B?VmpOT2ErWHUzaFAvYjNmcVRKdENGL0dPUS9HMVZxODlOK2x3OW5CZGw1Qmhy?=
 =?utf-8?B?d2IweGJYODlXOW5mUVV6TkkxWnhBWkZvVy9TRUJoUEw3cTZVMkRFQitUWlJX?=
 =?utf-8?B?cjFWYjVlcittam9QK3RwMFRTaFN0dlJkQmI1anVJQjg4ZFNsSitSWk9DK2h1?=
 =?utf-8?B?YXE0R1MxQ1FTbVltRS9jeWNDTHVTNU9sVmRZeHJRQUJzUWRCTURTbWVaRTdI?=
 =?utf-8?B?MVc5WGc5dXE1aFlEbHRJWHlUTTVXN2VPZ2dzUXRHZTVTQlB1c0Q5OVJYeXNM?=
 =?utf-8?B?czNvZm1BV0JHb3ZrSjVadnA4bzByd2lzUTlGTmZFYlZ2RDRGd2RwbzBENmV0?=
 =?utf-8?B?SDZYWmdYbWV6ZEFpYnVsZXlEM2N0NDdZbm02bnprTC9EOVcreWhybDIxSmgw?=
 =?utf-8?B?SjNvR0NEc2dCdTVzSWxjdWEzbmxCN2ZvUmtPVHJBbDBQRVFORGVDS1NzVlJT?=
 =?utf-8?B?a1dUTEh3RUoramFibG85aTI5cmc1aXFIandhTXlzQXBZQlhlUWxDb0plbGFR?=
 =?utf-8?B?VnV2dzdPSWhjVHVQdFI4SW1paEtCVGRHVm05SEtJeFNjQjZka2o0RWZrb3Y0?=
 =?utf-8?B?TGlDSHA0bHN6SjV2ZFdydHR2RnlTSGR2NWVrTEZJNEFHTVRTNUt4Syt4NHBM?=
 =?utf-8?B?c2JSd0hQZUlNbURmbHdPenRPVnpBclBoOE5mSDBLQnA4YjI4Y2tBSjdlRjlw?=
 =?utf-8?B?ckpQSUJJb04wWmt0MGVsZzJpQjdlSEZRV2JMZjZZWGJVMEkzZVFmc1ZGWEhU?=
 =?utf-8?B?MThNSk91ZFRzVEhKME9oSnAxL2ZxcGxBdG1pTEs0VzNhTko5aGI3SlJnc2w1?=
 =?utf-8?B?ZURxVXd6YVlwVTZxODF1UG0zdEpsd0ZTRnk4RWNNZS94TVJnWTQ1TkhjNk1V?=
 =?utf-8?B?S3BYZ0M2a0trV1J1SHNjK1M4ZHdVeVE1MkZoRGRVaDcybkM4d1daazlxVnRu?=
 =?utf-8?B?YnJRV1l0a3Q1TEZDYWdzcjFyOFNkbWtrSHVDSitzS0lsbXA2c1FZYnZMb1ZB?=
 =?utf-8?B?dEI2eVhrWGs3d1pEanBxa3pKbFN1aW8zbEFBUHhqOGJ5aHlDalNJckhHRU8x?=
 =?utf-8?B?RDNLSW4rcmEzMkszWktHeGZpYW5Sd3hjQm9SbWhvTjVYT2QzellKZDFMbVlI?=
 =?utf-8?B?QVV0c3NQQVBzRGw4cmpObEF4aGh0eVlhTXNFcnppdWlEbitBZm5OY2ZWdzlM?=
 =?utf-8?B?OXpuTFY1aEgvRGs0aThJeDUwK2dzNk1MSHVmRFZMdy9kMEs1a0hRMEZrU3d3?=
 =?utf-8?B?WGcya1FrUTZHQTFMNXBGQjJxb0E3RW1NWGdKVGdZSGFZYmliOU9EeGJ0SFhn?=
 =?utf-8?B?cHY3ZlBHNUxzSlYvM2tuSEpPRFFqQTJKQ0RYMWIrc1VlcHdXYjhtc2FGb3BK?=
 =?utf-8?B?c0pWU2VTWVlkL3BJZk9LNG83dXVMVWRnTTNLeENkR1EycHpuYmhvb3o1aTZR?=
 =?utf-8?B?NDJOOTFsZkR5dUNrU2tEdVNsMUVxbUZPdm43NGI4WVo0Unh2K1BHZERIZ2N4?=
 =?utf-8?B?bC9UMDRaK0hYa3l1WGlldC9TcnBqZjMxM2hIQ21MUnVRY0tEZHV3LzZjKzdx?=
 =?utf-8?B?bURhWC9zTk8xU1hGUWxLV3JnWDkwS1VkaXhpZnlNNVlPZzVlcDgyNE5MTHlD?=
 =?utf-8?B?MDI3bWpvSjRFa2ROci9DeVdVTkpsSkt3YWZtb0hjeVk0NXZMYnc2U0ZaVXBv?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39163a24-4d13-458b-6a95-08ddf9fa8cc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:07:45.7008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfDGV0egbu9B2ZRlXZCZR7fxwTdC3fQuiGH8gqk/v2WBXDWdoPxcg4GHVwGTkyoy19TADbDr6qNWJfOX0wKpfx/yxj/hOePl5mswRmZ9cno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

Both vm->xef and XE_LRC_CREATE_USER_CTX indicate in xe_lrc_init that
the context originates from userspace. However, XE_LRC_CREATE_USER_CTX
has a broader scope as it may be set even when no vm->xef is present.
The XE_BO_FLAG_PINNED_LATE_RESTORE flag can be extended to both cases,
so there is no point in handling the two cases separately.
Let's combine vm->xef and XE_LRC_CREATE_USER_CTX checks to detect
userspace context.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c88e90175f59..af09f70f6e78 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1412,11 +1412,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
 		   XE_BO_FLAG_GGTT_INVALIDATE;
-	if (vm && vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
-	if (init_flags & XE_LRC_CREATE_USER_CTX)
-		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+	if ((vm && vm->xef) || init_flags & XE_LRC_CREATE_USER_CTX) /* userspace */
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
 					    bo_size,
-- 
2.34.1

