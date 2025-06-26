Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB031C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD3D10E83B;
	Thu, 26 Jun 2025 07:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq/lW4Wm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011110E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750922128; x=1782458128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zT4rSB5dAWJuucPyP+/tWshWqZVajtrGyu2yQtx51GQ=;
 b=eq/lW4WmvRC8qAMq3nu56bxpP7S0CaRxLK+Vb6x7QT/fKkWmf5OzZbWj
 3nbv8MBEZ0znTVwFc/CvZyUf7ZhG6sigJk+0ptqwg4ieIc5GFhDK7LdHT
 vMfuWJ2U2fuD/CyljhOiWNAa9zEDPNTuTkFNuuZTHW3LHZQxciW6VK0Fa
 txKxUT3Z4PsQuY+eSpJQ4SCrK9ZG9/lVXrEukPQdoLy425CyWown4yxZC
 m+EKy5bxdk5MpNFYxKjmGPzkr+sySSHjOhALk9YVtHbEukfc1g0BCvIWs
 XW8fYHaa97h+VyKmKymg1LrEV5WQPL1S/eM+Vvy5YUUVM/7mi1IOJSsot Q==;
X-CSE-ConnectionGUID: iBRHxdcdTkyQR4zNRvbN6g==
X-CSE-MsgGUID: LocRr1KUSLOMEXrEZOBt1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52322881"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52322881"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:16 -0700
X-CSE-ConnectionGUID: QYiyKt+ISrOuWJ6ZTerMDQ==
X-CSE-MsgGUID: An4z4dJNQ/iQ+931XpZWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152609865"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:15:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPcqj8wjt5w+wk1UONotouYqfANPfKleJmBAj3HTlMof4pPRqo19/mK3UVG0Qf60dAt0mWwwF4Xvf55a6q4M1lSsEJkP6yVLX3fC39gonLg0GssT8eBkdTCTRpJADHBRcjHtn8aVxOMrgZsbrWVr8Yl30ibxRC833/KhGb2pC1RSh487GUs7QtLidvTwqBhDl3XwehKw/E829Lr/A0fABcndSjI3c3n5x4Dl5KjGRmm5HzscQSNqrzG4I6NsOaFEzcgi7DtZH80uNQW5Dsf0kIYyivUuMY1kjLPeCDNSawzN3ybfoxR5lJghHT77WMHDtIJweSOkvjuyBW8wQCTA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USH+YgURMkjfMbzD5bPWYo5DSNwa9VyZnJy4vbwDTfY=;
 b=o0c32JoRHGy9LH45qhgIL8LfzgSUJ57TDogteQkD8fbkgNpOqRdvFx+LafXQVsQyE7S4bmuqbXQTCbqJLErU2xjaqmo3nSzKyno/whmu3dAKKL/RiPqv7OnCPnbEyEJiNXEtqzSh8N9LHHbGRoUHXbpkEYn80609jcLezkY7MZOF8PzQPj8HsE0NHzLrk9jWONd94sr/n9sGtwuI4eH8DZ2z+4KxuWzeCsr+SUDs5vetn8XJhU5hSQnxxe8WD3cnKq0itelzedIc7jKFrCuY51NQYH41HzU+F2xJQqx9JMGOjfkfNV3zMVcjCvnAaG+W0ib4/Akx2d+qKkYjRk4j0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 07:14:46 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:14:46 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v6 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Thu, 26 Jun 2025 09:14:34 +0200
Message-ID: <20250626071437.3223888-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
References: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5978e6-db8d-4b40-d0f1-08ddb481219c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlhGNENqTzZZNVhIT1FWZW04N0ZwNkJxWFJLZnl3TzRMbE5uTmhTR3lBdlRn?=
 =?utf-8?B?b1VUanlvNlpWZWpRblFKUzRrTVVBeGE0KzkwbWRCREYzZGNyNlNIYVVDM2NC?=
 =?utf-8?B?UUdITHFGOFBMMkYxMXJteWo4M2h1YzhUcmdEdlRpQlF2RWpkQWtNT2lOc1Rx?=
 =?utf-8?B?R21CWHNNdlBPL1psbUpOUTBOaXRSbTFJY0NJU0ZBNStHSHpsUnRKTjdVSXNn?=
 =?utf-8?B?YUR0RDlxNnlzLzFiTk9oSXdVSzBsNTR2c0E4VnpXNDV5MTJITGhrZzlSMStJ?=
 =?utf-8?B?Rkx2WG8weExmZzlRSmp4L3lGVm96WEVjOVc1S0NjalVuNzRJRXpDT2FjckVP?=
 =?utf-8?B?SXY0VTNVUlZXWGVBREMxVDNHTXoxVEt2YzQwRHR2bkpEREcxRFkxTVRJTVhM?=
 =?utf-8?B?MlFUeUhpRWxMV1I0ZlMySXU1ejhNVEE1Z0RTci9EZUcxVkVVakxmTFpCYzQ3?=
 =?utf-8?B?a1BKSFhxRmhGVGdvbmJRVEhnSm1XZG5XdExoMmMxM1FKUlFlRldwNmZXdXBx?=
 =?utf-8?B?d2JQK1hBOU1yUnFLalJkT1VKaTZqVCthM1Z2ZU5VNDRsRjA4UFVoK1ZraGQ3?=
 =?utf-8?B?VE5nbzZGSWNTRmVBVkdVbGlJYWVSU1ovYms2c2NXWWxUWmJLQWFMUXJ6RGVD?=
 =?utf-8?B?bTBRUEJMQ3Y2YkpXNW05RnFyNm1kNXJqNFBVVWFvMElZUS84dWVUWldxS01R?=
 =?utf-8?B?ck10dytYUnRMNDdlKzhqUkplRVVrUlZFUGNsWTk0SXZBbTRmSWZodENxMFZn?=
 =?utf-8?B?Y0Rqam41MDEzM3I3akhlVlNpYkFJbVhDQzlSOHZYMHFFV2tUWHg3dW5zZzMw?=
 =?utf-8?B?Y0xmZllQMnVSQkx1WXNRenFMbitQeUlqalZ3YnM3dmVFVkJXb2tmQmRIRi9Q?=
 =?utf-8?B?RmhvcGUxeWVtRE1jT0pjTUJ0OGlVL0VvL3Izc0pCTGRZQXEyWU5CNWJ0NEJJ?=
 =?utf-8?B?V1puT2tEemtuQ0pWa2ZWQmlJUjhRUDNkZTNiUTRiZ2FMMzQrUkNGT1FSZ0ZV?=
 =?utf-8?B?d2ZOVjZxOFZLbmkyL2R5YVVsejlvK0luZmNHVXRBOHI0dUVxWEEwZnR6ZWVC?=
 =?utf-8?B?NVNkZ2RpWUlUNGNOOHpzREorbng1Nm9MeEZZMGJWTVhXM3dVN0J0SWoxYUEx?=
 =?utf-8?B?Q1cyQlg4OHhMb3AxTUpPcGNkWEpEM21taG1hQmNWbTE0MDNDek5IZUJlVFpp?=
 =?utf-8?B?N1E2VGhhV3ptbXlLeHNVS3hUbGd3c2NaVFlDUU1CUGFjc1NRSVVOZEFOV2cx?=
 =?utf-8?B?ZjdWU2JURjEwMHZqZlBLL1RDZXBYTFdhbjEzYy9xYWFmRlp4NEpOSlVhQlBo?=
 =?utf-8?B?MUh5TXlkcXRsMGV6enlGT1FNd2xCaDEzRVRnNVhrNVBSVFU3SUU2Q1pHS2Vh?=
 =?utf-8?B?ekVCajFGV3NwZlFmMnpQUnpJRExxbDBjQjRPSHZlRG9iNGM2ZmhybWJoVE1V?=
 =?utf-8?B?QWlBSWFMZzFTV2V1Q2FSanVDS0xBbXVhRDVzd21XeHgvNHdWWWxHcTYzMDlr?=
 =?utf-8?B?RGp4K2tZYjJMdGZwOUhHaFlmeUYwdlpBMnlvUEJub21DVDFmQVM1bmJwYkdh?=
 =?utf-8?B?ZGMrMlBCVGphVzYvWEZJUmhMekt6ZWxpblBpeXRSM29JRUJScHJxL3I0Wmxs?=
 =?utf-8?B?V2MvTTZvR0luRURnaHpaVmZJdjNSWmUrR1cxNTF6eDQwdmM2eGNlNzdES0tF?=
 =?utf-8?B?Q1NpN1J4NkxWcG9TaXBXSFhRSHhNS2h4cUErczErVzhJdGRrMmJSbzRpdmNG?=
 =?utf-8?B?dE8veFZ1ckJCclVJZ0dsOVB5elhrT0xHV2xOeGxQU1kzM2t2ZUoyS0xGSFVp?=
 =?utf-8?B?ZzNSZFFkSzJJV0JwbCtFL3BxcVZvWHprZkdUa3dsMEVNYWxKLzlxYmJnTkVX?=
 =?utf-8?B?bUhJZ2RjMUNXNHpTei9DMUZTZnNHdnBOOXMzL3ErVTJMOTVxUVBlVCtZclFs?=
 =?utf-8?Q?kV75SVPfxV4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVscEE2Nyt5Q0pNclMyR3djL0RsdjNIMVZhbVFoM05ldWJrQ0R0bzk0ay9R?=
 =?utf-8?B?NUtRQmN5ZzczM3htZ3RLdkUyRVJLY08zM1kzL1ZHcGhUQWhXVVJQNFV3L0s2?=
 =?utf-8?B?R1d2Qi9SN21iK3l5azRWNU4zSi9nbGlrWGU4RDBQY1loSFJsekRGRUY2cENW?=
 =?utf-8?B?SVhKUHpqM2NwcWkvMEk0cElGUTFlSGRwckQrYjJHZmpKQVVUQWFlUkt2cmVH?=
 =?utf-8?B?OHd3dGc0b1liTU4xYVBrbzF4YnV2b2loaVBJQXVrWDdkREMreEhHNlVOSEpX?=
 =?utf-8?B?S2ZNaGYvaHNra2NHZm1iRGdYVkZkL0N6Zjd3R1J3eUVqcEJQTlA1cXU1eGNP?=
 =?utf-8?B?L1JaQmpHSkdYRENMdzJLZGMzTWxoNTV5Vjl3ZVRhK3RFYXZwZDZTMXdCM3dr?=
 =?utf-8?B?RFJlMG5Rak5PZ05vMi8zdHMzZ1I2OGF6amRMOElzdk5DV3FnOWUyK1RzZ0Ez?=
 =?utf-8?B?VXRjSzZFUGNDL0kxNm42bERTNS9mcWoxNTdDQndpYXFsZkFnWmhIUTFQTnRl?=
 =?utf-8?B?T2NmQU1WM2ZETFhicWpXRVRBaHR6SmVpTmx3aSsyUFJ1Z3R5ekNVeHJSbUVr?=
 =?utf-8?B?Yk9FaWJVRFNxWWYreWFueFpON2kwTE1YZFhNOWJ5YytTenZ0aFJZaDh4ZnBa?=
 =?utf-8?B?WnFFdkQxR0d3bURpd21ibkJwSTk4SG9qcGNQMHBIWHFsWlk1Ykh3T3IzK2tn?=
 =?utf-8?B?ZUwwREdyTjQ5OEI5RTg1RXBnUm8rdkxvVmJYd0VjV2ttOTBzdVhid0tFNjFR?=
 =?utf-8?B?Ujk0bXNCaUZCY21VRUU4SkpDRTMwWEpCK2tsU3JyY0w1QTdYRTh3WUMzMThU?=
 =?utf-8?B?OHdybExoSzdVcWpWdVhJRGNwMUFpZlpkT3pEeklZSkFOUWo0c3RmclZkV0FU?=
 =?utf-8?B?R3RBaHVOeUdyZ3F0QllvR0ttNlUzTEw4ejk0RW0zOE1UU09zSzhhaGlQVUZM?=
 =?utf-8?B?Qjc2SlFaSHBMTk82SU9EOG5oSFU1ZW9Yc0t5VG5DNk1qT3Y3bjNYQ0htcnAx?=
 =?utf-8?B?RUEvVkxwQ1FQeW1laWwvMG84ODVvNmFDRlM4b29JOW1kbE10eU1aaFJWMHN3?=
 =?utf-8?B?b0xMSm82QUk1cUZiUTFTQmVjbHF0bEdza2VIclpQNlY2d2tEaWJwQ25zOGVE?=
 =?utf-8?B?ZitzaEFSNVBCUC9LY0RjNW1icGRpMlFlQVFHZWYxUEcwUXVSbmRLZ2swUXlD?=
 =?utf-8?B?eFVuTXViVkpnY3VVZWRTTUlSZ05henFua0JmaUsrTXFxK2ZnL0RmaGh1ZW5y?=
 =?utf-8?B?U2lvamw0cXVINDU1RjhYTm4zQVkvY0I1QmVpS2RrVXpnRkZjRTVWSm1EY083?=
 =?utf-8?B?ZWVKNTcxODEzVWtXbnE2aWUrNFFoOU5TZ2s0Yk1ZZVdLdkdxQ1dON3d6Vk5K?=
 =?utf-8?B?Vjh1OUZzSG1rU2JRUUFxWUQ0Qm9iN3hEaW1UbGZnemZ0QnBydW5nQkNKTHRa?=
 =?utf-8?B?OGlmSCtBYlc2YWtnYndjMmF5dFBUeUhmdVZOVGVsVktGNmRoL1Vsa1JSOEFa?=
 =?utf-8?B?aTIrTThod3FpNE96MDlmR1YxRGJaWUxkNzBJaUkwK3hVREtkdUppd2U2L202?=
 =?utf-8?B?bFNORlhadWltaFl5MC8xazU1d3Jod2ZpK2QzSG1PZnlTdVBkcHMxdCtNK0hw?=
 =?utf-8?B?RXhxYVFZaTdQMzZkYTluWU9rbkplRXRLd21IWU1YM2x0dko3MVpySEFnOGZs?=
 =?utf-8?B?V0pwajUyNm9zbkV4TGc4WnlaZU1GTlV1LzBaMVl3U2liYnhHTHNsQlZUMGlI?=
 =?utf-8?B?Q2g0a1ltSjROdUxXK3d2a0lwVDU4SHk4NklIMFBidG85M2VPOXFiODZBL0I5?=
 =?utf-8?B?Qmdqcis2YkkrRGNRcWpjSkFsb3JlOUt3dnBXSUxNczlUelBuYXlvZ0o4bklk?=
 =?utf-8?B?Y2JmczAzM0FmV0p4eGNQYUVMaGNzenNHS1NGRStCQmJnQ0ZLNlFTeWx0QzNL?=
 =?utf-8?B?WEU1OTBoR3RTY0R1YXhKMm51NTBRTW9HZmxmYkR0WHFVaTJ2d2I0RlQ5ZVF6?=
 =?utf-8?B?UER1UCswZGN5a1g0TW1reTRGVEQ3bG5YYmFqK1BQNHBnYjM1MUVKUFZKSXJY?=
 =?utf-8?B?TVl1d1FKam1XaWxIcVAzVk04T3R1T0NoNU0yRmt2d2VjOVo2WXhoY2hZT1VJ?=
 =?utf-8?B?R1NQSnlwY0FIdi9Mblg1L3NoMkNwcHAvbjNwZlFlU3V3UEYyYXpydGFsSFNN?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5978e6-db8d-4b40-d0f1-08ddb481219c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:14:46.5249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXNpqJV0SgIWfGBXLvMv/q2DwL5WoRkoKCFre9Ol3DHjIlcLDVXtpSn7JUYRtHe1SrajVIn/0t/5NEVdoRNNHkRkjbAwTthiKFAil7n/ht4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

