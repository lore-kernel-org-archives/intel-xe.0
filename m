Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD70CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE60710E1DA;
	Fri,  3 Oct 2025 16:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8Oeg5KH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57BB10E949
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508813; x=1791044813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VH17jZMHHQ5ZP7HQZhcoZ2W/rAKF6KmginfjBSOGib0=;
 b=d8Oeg5KH/uHEv17Be94ifSvfk+KQQQ+dGCdIInBCN0Od+T9I34TDnYLa
 Q77689jlTzFkllBTL9A8eAhglkcHTadN7dGxE6zmAsbiX6CLI9F4aCExH
 /BD5SCIJu7gne5vNCagGV+hbeKCYccoDrX+Dj1yE6SK/XLgOVJL/0GkWM
 Ray4kGWH6Uq66nOYDi2EbkFWfhhwtdOLxPYlqfPx8DWQLbHuhVMEMYqBO
 O21CMbaYDo/Xr2BEi3yLnsk9VkXQJxvkDEdSktAaLrk68FCegpizn6svq
 lcUer1Qibsk2ZA+IFW5QV7K3W+Cf4Bmj6oe8R0gT6MFYYW1d4bUTcHZpO A==;
X-CSE-ConnectionGUID: gMo+RzcnSRCm1fSDHrZqWA==
X-CSE-MsgGUID: 8XPkSUqzTUOc1H8FM9hHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72893417"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="72893417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:53 -0700
X-CSE-ConnectionGUID: JYeympOERLijbvqb5clT2g==
X-CSE-MsgGUID: 2ffI+yeYQT+udgS035DYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178449926"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqJk12B1mW9ab0yyzoLGUzwNchouhr7lqi4ONb6wCnceRcWkZogCMkyCG+2OIc4qdCHEkQKfYrBSeWUFleto15F79IDwH1kUTFbevQ7Cs+0nDqn4D1TquC8g5heXKAvMweJVkZClljWRk2lWkrAOPJuyWNM5rZeLjbviVQyod0lbcpbVRlV3269rh2kozX51bxeM+9FRsKEu2K4/wX/wlSjpQ8wFeyZGv+qOwFzx2Fb0iitRZ100w6uWmOp787msuZ+yVU0wNrGwRVoeyPsTej/Qag9QmfJ/Xx7KU++fX1kvULAXDxJ2xORs0RSssK9ItMcn/o8D4WfTteNqW4X32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GGJMqhBB7IcLvLHTL7cwp6LX9zZrdgjXZTH/da6ONg=;
 b=v2B+pIWJe7GE7j0iUtRBIAnkqVJGsfNQRrvyWU7nVink7NMjKyUciBkKm561vYRhj3UsfrSuyZDbl76bM9oa8xQapYiqnVc+Bi9cX0wd9H6aLPvFdD+bXoLGJi1p8d4xF4VivfrAxKxoBwIaRq6JajBQkUxgOo6JOUidHpqnrj5PaNTZwEdYNqhuX41S2dwUVXowQ2mrVPwfaApVWyfbneeKKFbNazIZVSx5x6J+SzVo+8shNuABTA5glTzSJuBwHJUXROI8Yt8N4J5R0o7S32qOdJ3MBkXMprmPpt9ObSXq+7iwBju2hZhscc2wjPGvi0tR+xeadHqc+gFi1B86pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:44 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 3/5] drm/xe: Force user context allocations in user VRAM
Date: Fri, 3 Oct 2025 18:26:17 +0200
Message-ID: <20251003162619.1984236-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
References: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8c076f-a63e-4134-98fe-08de0299a403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZTd3E4NndycEFuUWVjUVlDTjFjM0MrUEI1TXIxRTd5USt1NmRrdWEvck8v?=
 =?utf-8?B?SHVsQVQyZ3dDUUh6bGM5aG01bzNhOVRLTi8vM29KNG1HK1VRTEZta0ZyTENj?=
 =?utf-8?B?NHl4SUlOTTgxaXp6S09xRXBiYTR4UU5CSHppdGpBeS9iTWhpeEwyWEJXdkRo?=
 =?utf-8?B?dTJkUkNrbGNiakUxblM2T3Y1Vk9yRXorbCtHYXFRa0NreWloNS9YQUhNaWhv?=
 =?utf-8?B?bHZPdGlRQlpNeU5XcVZXZ29SWmJHdE9XSWppR1BaM0o5Y1N4OVErVHlaSDlC?=
 =?utf-8?B?ZEdJVEd6dG1VdEgwODRxaHU2NGJRZEpCbjJUL2JlWDF3c2hOWERPdzhKY3My?=
 =?utf-8?B?TnQzWnh3RThaK0JRNmtLMW9pS1RJaklsTGhtcW9VUVN1TWo1N0tXUFc5Nnlq?=
 =?utf-8?B?VGRsUHJmZllVZUZCQXNvR3BtNUdKbzFLWDcrNUlSb1gwaWUwNWpidDZGaE5G?=
 =?utf-8?B?MGxSQVMzU0hnQ0kxcVlDMVVYSmNVL2ZTK3MrUEltM2xLUVFjSGVNM1hKMjN2?=
 =?utf-8?B?K1lKVThvVW9XSGs0WmRiTGpjZEJ2SVRUaGZMdVNvSC9KT0R6VUJ1TU1JcHRL?=
 =?utf-8?B?VHpzWU1McUFCT2dLSHFINE0rZDlUbmJsL2ZBUEppeTkySDJhbUMvZTVJSENU?=
 =?utf-8?B?T0ZoSUtHaVFvT0tKdHdnL0VhRHR0MW0rblpxQ3FhMTZyblZlRU0xNGtpYStv?=
 =?utf-8?B?bHo1aUpVMEZ0SGxxV0tJMWtWN3JuZkptVmFTMXEwbmZEUjJBRG5kcFpKWWVo?=
 =?utf-8?B?SXo3L2Y2WmZjeHdVRCtaeFNaSEpZczVsU1RtRkg4Tk9CdWlZa2hYdG1MVG82?=
 =?utf-8?B?NHJPaDhqWDM2OU5PZGRqQkJKbDdodTlUS3RWejNBWjlYcnpOTmR2TTlGMloy?=
 =?utf-8?B?VUMyVDBoMHNST2dvNnpSN2Q0OUlxdkdTbFVjeXE5Uy9WY2Q0cnJyR1FQdDFV?=
 =?utf-8?B?NVRNaE5DRmdTbk1nTUR5OVZkSm5VQXlmMGtQejhqVGE0ejlsazZOS1dTd2t0?=
 =?utf-8?B?Q3R1MVdlWGErUmMyYW9MRkkxV0pLTUd3ZHQ0UFdic0M2ZEVyNDB4b1N4bmZr?=
 =?utf-8?B?SHJMQmRRL1ovamhzMnNNc2J1OHNTQmxrRFBWRGVTSmdZYnBzdjVvelJKQm5B?=
 =?utf-8?B?MEdtRWN5RzBoaExlSk5ZRkZ5RmlaM0xkaTFxZk1TWDVVSjBNbFVKbGxMS0xD?=
 =?utf-8?B?UDVMWGVzd1ZYOC84dGRKTTV0STFTNEsvSE9oV0h0UGZrSGcrMkVHZjNwTUpL?=
 =?utf-8?B?NU9FZDd5a1ZJeUFkRHFUcHhrZU9ON3NjYkNjVjlnVVphUGYzdURkL29Nb2tr?=
 =?utf-8?B?b3V5ZThYTWFMUVFjcUZkWTU2b3M5SGZTbGNCb2ZXNG9zZXYxWFY5UjJ3Z0Jh?=
 =?utf-8?B?L1NWWDY0bm9RTUNnYkIwYXFTMVpDUEV6WnoyVHBzdGtXZW9RZUNId3gyMnNs?=
 =?utf-8?B?VHIyeHpNQWltb1UxWkFMREZNSWpybDdWenpDMllUOFRVZ0FCVjJEQkovZDlh?=
 =?utf-8?B?dWtBMTRLYjRQeDI3Ym00Z3RsRGJjdzhLTFJQaWNyUW1TUVZJblA0M05hRVpm?=
 =?utf-8?B?OFdTNFVZZ3RDSTJLT2hza2htOXJTTHBqOFZaSCtRTXpCZTNNQUJZUkU3TENB?=
 =?utf-8?B?Ukc0QXQzYURMVFJ2YjU1V1c4ODZ6RDI2RDJvZlUrWXhMSUVLNmxSblFVT01T?=
 =?utf-8?B?Z3ZhTVYzSkN3NVk2YkgrblZId21YbU5rR3pUS3hISnJTV1NpcUM1SWtqZTFB?=
 =?utf-8?B?K2Y5T3NRaTJnRUJ0Z3cyakxJOVgvak8wcy94R1phenVtYXdWNzVIalJBRUpn?=
 =?utf-8?B?TVZXVXBHb2VaNHoraEd4OXAxeWFvaThnRE1NbjRwcUVrVWMwSVAvK2M5RFd2?=
 =?utf-8?B?RmZJVzdLZ2JCb01nYk45SXdrMlRCZXdOTitOdmlnenJneFY4U1hKRG1KRlNo?=
 =?utf-8?Q?SCdycy9QpfDs9b8y+93hKIcFQy54WJ75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHV0TytqNExTRytFNkhIYldOM24zMEJ4ZDdWMTZDeTZZbkxybWVpVmc2K3BN?=
 =?utf-8?B?K2lBcXZ5MlhRZ1ZKaG1ST2pFNE9IajJrcVBSNFhMdkhVTE94bVJwTjE4Nlhn?=
 =?utf-8?B?cnpUQnN4OEFlSklFYzFpeFRwdXpMSFEvN3pONUliemNObk8ybEpPR2xXcUtM?=
 =?utf-8?B?bVd2bFJKQjBxN2Z1a1BzMTF1SVhxQlhzc3d0bXYwZWpONmprZ1lxbHNqUXBZ?=
 =?utf-8?B?TmlCWHlmOXlHYVBuTk5rQmFKQ1YvYzBjdlcyN2kyUjVOZGJ0Y044SDBFREtt?=
 =?utf-8?B?emdrU3JkRjZFWmwrZGZwN3lSRmQ5eU9lZWlJcEVPU3dZSnBjcyttaHA4YzEx?=
 =?utf-8?B?czc0blpNNG9oaC9tWWJ2eitySG5EeHFNelExMWJFVzNpUWhsNWxXZTd3RnlH?=
 =?utf-8?B?S2pBK1c2YnJYR1NndGpzMS9mTkdSWVpKL0FGSXpqT0lYNUtnUEFoajlqK2hR?=
 =?utf-8?B?RXhxSWIyZjlqWlpldXVsT2s0Sm1Idmc2RHN3NXVYVGQvQkE0WXJ3SjRvOHc3?=
 =?utf-8?B?YS8rdlI5UkIxWk4ybkk5Q1NmcVQzeU1PbEtaZm1RUU5TenE3eGRzUEZnaXRT?=
 =?utf-8?B?dDlkZDRWT0EycHp6V044RUk5cXJPck9XSjhHcnVjeWZ6cG02WmNwMUQvUmRh?=
 =?utf-8?B?ZlRBaTFnZ0xxOVRJRzBodmE3TjVtVFg5MWw1ckZ2VHJjNFhaSVdpL2NBd3dU?=
 =?utf-8?B?VkJxaGluVnJpVCsrLzE3TlBGWjlkaXJWMGNqK09ucGF5cFJRdjVLMlQwZGcw?=
 =?utf-8?B?U0ltN09tb2RCTGtoOWxldWRqaXhiVVk2MXhJTmFIZ0UwQXdtODNnSEU4KzRt?=
 =?utf-8?B?WWU1SklQU3JLSnk3K2hpampUTTh0V1BhcThLcXhtZHZKNHZwMytPaDdRWGFa?=
 =?utf-8?B?VEpnVFFVZDArRWszVGRQY1B4V1VWTG5iZWZmZ2p5YmRyUHdhSHBUZFdacTFo?=
 =?utf-8?B?TTJ6MHc0bHQ3MVNVNXBZektSNDJlMkxnYjlqZE1nMXhGeVJxWmVlbUxPc3o4?=
 =?utf-8?B?L3hkK0g5dEZLSnEzZjN3U3dtZVpRVDlIMkQ5OWROVmRjbWN0V3NsV1Y4L0k2?=
 =?utf-8?B?bE80OGE3aWQyRXZrcnlrb3JXcFdYa1JJM0k1bDRBZk5FaVRvSjZIR1RLYStJ?=
 =?utf-8?B?OU9qYkFMMGozdWZGV0JkanlWUW52TGJFL0R1RllsNlBxU0dxYXFlUjNXZ21s?=
 =?utf-8?B?RnNsbTZXVUh6ZFJHNnMrM0dHck9zU0dkelhFcS8vMnNoZ2cvd3JOT1RCTVBB?=
 =?utf-8?B?cUJ6TEhpRDFiTFM3c1p4MGpwK0swbHBVV255RjdlL2F5T2czOVRlS3VnYUxD?=
 =?utf-8?B?K3FaSWxER3hzUWNaYXZkajFtc0xxRWVxeVJ1TzNSZHdhUUFQemI5WE9HUkdT?=
 =?utf-8?B?M2lSMWsvdUNIUXBvWXltT2NoalQwZmRXeTkyTGszNFUyNTlvcGNWQXB1VzFS?=
 =?utf-8?B?K01rY3haeFc0QmJqZ0dkUFVFdzNaMHV0SHArU0FQWWd2clM4QktZNUpzbHdm?=
 =?utf-8?B?V2o5Y1pKT1hQN3FqREZhTXlYZUFtUC9jSTVkNnhQSmJrbUFJSjVDd1dsakM4?=
 =?utf-8?B?bGpSdGRxeWVLWkNtQ09sRk16R29MNmZwaDZnSU14Nk1Qa29YUjFpNXZ0czFI?=
 =?utf-8?B?Qk9wSi9KeXZNNVM3ek1oaWZKZ3NNOFdpaUVNdnVraDVROXhpUEo1RFFnU1gy?=
 =?utf-8?B?cG1URlVWUXBzTkZkNzM5WDZGUkpsdGQxQThGSE44TlhDQjBHUm1qU3lnR1FR?=
 =?utf-8?B?aVNaSzhtcUVIZ2g1aENSUlNtYUtuT1c0UWZnQkNHbGpYNXdSWXk2MmxnRUZL?=
 =?utf-8?B?dEtGQnp2TFhTSWpIZytFbFBxZFNtcDV6RncvMGVUK3hnYSsyUG41RTEwWGJs?=
 =?utf-8?B?SFByb0RKOCtzY21ldEd2RUw0NDloZWRIZW1jY1ZuVmZGVzE0dzI4NVFjZXJz?=
 =?utf-8?B?bDM0a0JoNVFSQXo2eUw4QUZvd0crRUJ0UEIwdnliWlNGUnVYNldDMzFOUHJH?=
 =?utf-8?B?bHh2YWF2RGdSRXhVMUtJNkh5dzRMOEZNUkV3dEFWaXJCTWltaVlaSVVSdkIy?=
 =?utf-8?B?alQ3U3pQMC9OaFhZcHFaNkVhUitjZGlrME8vUTF2S0RZVmdodnl1UnE1NEZD?=
 =?utf-8?B?ekxydXVFU0p1WG5DL2Y4NzVHUlVQbXNnOHB1WWNYMUJGN09mMmhiRlJKcTFZ?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8c076f-a63e-4134-98fe-08de0299a403
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:44.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylHICx7W58ssqX5q1B0wXqPZOXrExp84ifwwELrpwa9YgVt0uUBMm3i8SVX3PFmLehxXh4JYor53xx1Sk0zLRFXWHMwV9xPpHB/eWSx90/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

In general, kernel structures should be allocated in the kernel-dedicated
VRAM region. However, userspace context data - while used by the kernel -
does not need to reside there.
Let's force the allocation of such data in the general-purpose VRAM region
accessible to userspace.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
 drivers/gpu/drm/xe/xe_pt.c         | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index db3f869b53f3..6313a80f294e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -183,7 +183,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
-static int __xe_exec_queue_init(struct xe_exec_queue *q)
+static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
 	u32 flags = 0;
@@ -202,6 +202,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
+		flags |= XE_LRC_CREATE_USER_CTX;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -248,7 +251,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	err = __xe_exec_queue_init(q);
+	err = __xe_exec_queue_init(q, flags);
 	if (err)
 		goto err_post_alloc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 47e9df775072..c88e90175f59 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1415,6 +1415,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (vm && vm->xef) /* userspace */
 		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
 
+	if (init_flags & XE_LRC_CREATE_USER_CTX)
+		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
+
 	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
 					    bo_size,
 					    ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..21a3daab0154 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
 
 #define LRC_WA_BB_SIZE SZ_4K
 
-#define XE_LRC_CREATE_RUNALONE 0x1
-#define XE_LRC_CREATE_PXP 0x2
+#define XE_LRC_CREATE_RUNALONE		BIT(0)
+#define XE_LRC_CREATE_PXP		BIT(1)
+#define XE_LRC_CREATE_USER_CTX		BIT(2)
+
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a1c88f9a6c76..e39da95f3a05 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -122,7 +122,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
 	if (vm->xef) /* userspace */
-		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
 
 	pt->level = level;
 
-- 
2.34.1

