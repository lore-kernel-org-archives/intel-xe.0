Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DE8C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A20410E55F;
	Tue, 24 Jun 2025 09:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBpORA61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17A510E55D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756960; x=1782292960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZsaYB/KQKj1vw1u0MzaBF1/CdG/dfSO1E1+5bIYdHjc=;
 b=dBpORA61gCBtK5YB1dLl0rHuKVEbe3iQBTollOa+S7yJSZ3U6CfjEpgX
 YN7Kk42IwQ7xwbyFc5I/wBZN0QA6hLlt+21V7it+zPibjM7ZqP70jwDTe
 r6V99wdknr7EUz0rlbcOgHf3PLwLldlNIEaM02p57fOQl8IcXml9VYFK6
 LVcNzKhlzNkuHpC4CwlVMLaBBL0GmyAqB1LG9NK1Ebf20zx6zyjGJLr1+
 KnM5EpEkAckxu8Xhpi9/GLNPrL/7UvMWlDFTNALHjOfSmKjrR6Va32aY2
 gFZJV+LsKa4YKT3uZXBU3LqKV77Li7lQsVTuiz2xlQBTjjWYbz9vhFCUs Q==;
X-CSE-ConnectionGUID: Ef/Bc3zgQnCZtSToz2Re6w==
X-CSE-MsgGUID: SISkSdXMSBiHRxCEg0Gtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53081925"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="53081925"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:39 -0700
X-CSE-ConnectionGUID: IxOmkUiqQY2f/a3c+E8Hlg==
X-CSE-MsgGUID: kbw08B+vS9aS6d49OCJiaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151346098"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:22:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRVuBxF6fzng4EMUHI2ypNSmEf8bu1nokb7yi79/MLrEB6PEE33G2aVSYENzu1KyzOjj8TUbvjffz4aOb3Rf9Sv9TjxQ6OVNZUdzJr9AUCeTwFP+2l0Y3BvF1EIndrOtLeaqJwO24dCZmQy2KnqkmmWkHf6js2qiZtQtIrsVrpjkv0uzswEAxRmaf5aXK74hwkw0rk1G9I4UPmIR1LQilw+qIJBU+QCJ6e/ArBHf+nyGaXQMiFL+kdLjRfxywhaSlVTLLaAlL8SsU518U/aT13Q3JX4RXH6ki5b5U6bpLBcyyyg0Og7t8AWNclimVL43KagWZfYl7D/owZ3ZfP9iXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm/Hp92hcm7T0B/0mqnpgvok98ExJn351tmOW+wV/Nc=;
 b=Fa6IACfPaYqxHMymDpjmzerI61v33G9rLiWW2AY9Wy2XhzNtVm0V4w4rQGyNH/8/xSS4JZL3cDegrOPPZ5DZka6k0EQx7dT2spLfaLnVv10y/TqL4rJe54aw4iV1d1EpFETkgUk9qv1czpMFL8DELgfHoYUrE4XtKZ9KcyJ8rJ8jBX09rbXhkMukkxE3Zq5gxOwD21X2KCn/PMpFJRaaI3KVHGFQv+XSJiOxvrtxCKJjOg2D+1nuQTjF9PgpdDzi/NZp1J1LLusrqsEyKJYy1FOkb8BPtemcW5+GLL8XgNcJ14z0Qs0uHV88iA0gDgA/TWqW+tP6Xu+Wm/AAABH3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:22:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 09:22:28 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Tue, 24 Jun 2025 11:22:12 +0200
Message-ID: <20250624092213.2876711-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
References: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0325.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ccc85b-cf1d-4fe5-d607-08ddb300a3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZWeWFlTGVZcTIvLzlYMU1IWklONzIvREVTQzJtZUEvZG5BRkthZUdLSTh5?=
 =?utf-8?B?N0psazE2Q3lLRVVndzhyeE5QODZSRkVKMkRGZ0Q1dUYxV29HT3I1LzkwWjUv?=
 =?utf-8?B?emZWbVFQRFNUdEhaOEIzMEVIL1hlUVY4MDlUV0gzKzdxdXpueVFETE9jb3lt?=
 =?utf-8?B?MzVISnN4RXFFR1ZYODhxMWVEcWEzTGthaTJJWHNKeFR0aEtrdjNVbVRhU1Fz?=
 =?utf-8?B?K3NtQmVwNzBVQk5HYmJSQmNjdXBjSThMd3BxNm5SNzh2STFDNkRGbFFnUy9B?=
 =?utf-8?B?Q0gxT1hGNnUydS9ZUW1DYVdjQ1BBNGlGWW56SGxQYWF5Zm5RdzVKazc3UVlw?=
 =?utf-8?B?V3g1UDFrRHU2Wm5BT25YVlROd0dEK25hZGxyY1RKaE95c1YzazZpbGNjN2dn?=
 =?utf-8?B?YW0zanJTZVJaSGtaZmtEUmREMCt1Sjl3VnU0d2JmR0tiRy9uNGxrSjZKQWxY?=
 =?utf-8?B?K0g4Y1BiTkJld1U1YzVtK29qelBzODRXUjZrNy9QSVdrblh0L0ZBWk5oMllq?=
 =?utf-8?B?anplcnkxdENDVm5vRjRYQ3gzU1ZyNWJOQXI5WWdBeThiaWphYUFGaVMzbkN3?=
 =?utf-8?B?Qkthbk1EQ1NBbWRpT2tBSjRKclRLQys1MEI0bW41eEdueGRPb0dYYmxQaVhV?=
 =?utf-8?B?S0F0VVcvUWJqN3lPcUZzVzQrT2E5UktobUdlTnFFQ3pGOEpNNWNRMFptQmJs?=
 =?utf-8?B?dGJ4TTlSdzYzb1Z4TmRDWU52UFRwSFZOL095MldRTklXUDhlWUY0bkdXbUZp?=
 =?utf-8?B?Q3VOeTJpUkxtZERhZGdUNGNWaWgrajczeFhKY1ZnYWFON1FpL1NBbnJYek9x?=
 =?utf-8?B?OC83V0tsWjhKSHl5TlptSTRieWVvUnBUMFBGY29yaTdmZHRDVStPb0J1azla?=
 =?utf-8?B?VDZiK2Z1TXVkSlk2cWgvOVZncElpZTIzRm1JU28xZHhIbTNvbHhmb0I4OHFG?=
 =?utf-8?B?N2gvcGRIcWhDdDd6SGpDaGYvQ0RSQ2VjR3BYSFZ3Z1Y5dnpvZXNjNU9ocDR1?=
 =?utf-8?B?UkEyb1dDd1NuS3hiNUwreTFrblk2bVAwNW5ldCtPaWI3Vm9XcEJmaU5td0E4?=
 =?utf-8?B?WjBlN2hjT2xPT3dSLzdMNk5mb0VsZTRDSDJSY0FoZlk3Zm5yZjk0U280ZFY4?=
 =?utf-8?B?YnozZDZJTzVhbmg1Rml2ZVh1ZTFnN0Vyb2ZtcnVtSEJBWTZmZUFCRTBtekJG?=
 =?utf-8?B?QldZTmowNnJMNHNGMnVRZ1BzK2lweTVOaHlXRFFXYmdZeGNDY1hIK0JGSHFr?=
 =?utf-8?B?ZWkzL0NuMjVEcjRCb3VnMGJ0SEtURFNXQ25HcW90Ynh1NnkwY1Jmakg3L2ZM?=
 =?utf-8?B?ZU5KcDR5RFJDWW9Rb08rYXNIazFtb1FreGtDaktQbWZtS1RQdStNa2FKUmI3?=
 =?utf-8?B?eUFJZ05DZ3d1ZTcrMUJpeG1ORnVVTFJJSitLSzRCMk5LTXBnMFpRY3ZpTlRC?=
 =?utf-8?B?Q25ZRjlYd1hvN0NPd3BlT3B6SEtaYjVibG5WS09tVDFaUC9OUTR6K2V0VUQ2?=
 =?utf-8?B?UWI0TUFzbU41cDYrNnZZc0VUU3d4aWFIVkRZS3l6bGE2MFJDTUU5dVZVeXJ1?=
 =?utf-8?B?N2Noc3NydEMwbmZKRFdSZ2xCZEtXUjhORExFdWZiNjJaSThxendPdityRW9r?=
 =?utf-8?B?c0diR29JSmpVVHJmM1BGMkQzZHhXZlFjcisxQXZhdEFvU2FicE5adXd2eXJv?=
 =?utf-8?B?K1ZXbGlWWkxmWlY4R3VXTUJvaWdwd1k5c2NlUTVuV1IvMXhMbVphbGNvaWFU?=
 =?utf-8?B?d2QzT3pka2tTL2RtZ1BYU0RlNEVtSzR1Wm1TYWFITlpSQ09xL1h5UDFHS0F1?=
 =?utf-8?B?UjhmTHhSVlFRR2QrYlZ6YXA5OVNTbVF1R0w3bmxsb24wRC9oLzRuYmhQMUt1?=
 =?utf-8?B?MldaM2lTL1dYQUtLNGpUZ3NWZkJtMHhLYW9ncC9vQjdtQ3VLK0h2cVlrTHNG?=
 =?utf-8?Q?YMZ287qLiIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lJOFBMRFJkSzlqemxFQjlLTWNEME9SL1dCZ0F3aTRWWERFWURZdHVaK29R?=
 =?utf-8?B?UXRFYW5zRmdvNDEzeXMzTDc1MEErTGJQek9md1R2NFVtanJ6SHkwWmpzTkxH?=
 =?utf-8?B?VTh0VzdsbTVOOTVuNzRGSzFVTlRyRStmN1VhRWZadkJydVN2SkdiTCtKTlhZ?=
 =?utf-8?B?VlBqdXZHSDFrY09WWUNPZTJtNWNiTmdIVnFNeC9Vck5WdlV0N0wyQ0kvVEZ1?=
 =?utf-8?B?eTl1d21NdER4YksvbHBUZEpkbXBMVzN1VU5XMHBGa3Z0MmVOL3hRblJoMkV1?=
 =?utf-8?B?aW10eU5pTHM1aGkrYWsyVlNDaWNDS2QwdVFjU3o1WVc0ZXlza0NIV3hKV0Iy?=
 =?utf-8?B?VnRETFBLSjY5eUJMRHcydFdYWFpLQ1BQTFNUMXBJenBPZm5IUG9QaHRpRmZ3?=
 =?utf-8?B?V1lKbE9JczUvMXQ0bGxTYmhQekM3Vkd0VzZMaDcvRmpXNlpDSVJlNGVBdTZB?=
 =?utf-8?B?S0NJYTc0dnlIWWExMlBRdDY4WWI1UnowYmpTSlpaaWhjMFkyc1E5WEcwQ1Nk?=
 =?utf-8?B?Z250YUJpVDBkbDFOeXBYeFhUdnYwSGJzRDhzaVNQZDlUMVFnRHExZW1Gd21j?=
 =?utf-8?B?eFZrVUIwdjVqc2luMHNucjRVaXAvbWgwbCtVQlZwQjRjUkJmRFh2MXZxMUNZ?=
 =?utf-8?B?SEJyQW5UT3hGVGxpazByZUVRUTl4REoybDM5dk9iWks5SXU5Q2QxYnlzOHJB?=
 =?utf-8?B?MVBqRzdQQ2dSc1FFVCtxY2ZHZkNFUEtYQ0g4VjF4QTR1MEZBaVNXbE5KUHBk?=
 =?utf-8?B?NlJOZXlsT1NGWUZLSndRZnQwalJhRWtFY2NmYlp4WHNRUTVJdUdvRUdaQ0h6?=
 =?utf-8?B?SXU0aFJQZkNjQkFEQmwxSndoMkFzN3BjaDNpazVnclB1SG9ZS2d4TkxJSFl3?=
 =?utf-8?B?TFIzbWF0M20vU3FFREJ1YkppMjRCa0lqT1M5MHcrWVNEUFMza3VHZkFzMXM5?=
 =?utf-8?B?QVhYQ2NiR0dRUEJORURkMktMQ0d0NkxCVnZrY2JFcjVtNFRHUWJmQUdzTUVy?=
 =?utf-8?B?djBLcG5rTGxNNEVqM0pNekVIWFhDUEtlWVN1RXdVb1NZWjhKb09adk5zbkJL?=
 =?utf-8?B?Z3ZUQzA2bTAyTHB4dVYxK2dESitTTlZzVHJBbVdnb3ZmMXFpZEhQTVZzNlg4?=
 =?utf-8?B?ZGZUbjVScnp5YnJZVUhDa3dmbGdNQ0F2WWx1V3NOcTRxcXFJdFUrUUdvRks1?=
 =?utf-8?B?NDBXZnZHbW8xYjBmaTNUb2hmcG5LOWE4UmdLUWYyclpyb2N3ck9mb3hacVRt?=
 =?utf-8?B?V0RFSkhOekNBdEZvcTcvdy9mQU5OaFp1d3dhRDh1ZEh4dnZsMDh3TjAzS0kv?=
 =?utf-8?B?Q0JDam9LaXRyelJxaWxtcVRNSnlZSmJZQ2c3cHU1R2R2aGlHUWJIcDkramR6?=
 =?utf-8?B?ZzF3VkJhVmR4RE9NYWJBdzZ5UEFHclg5VFk3bWwxY29lUTh4U3BXWjIzS3dW?=
 =?utf-8?B?WE9XVEM0QnEzWHNyWGMzV1dLQ2lpa05sWk50dWpMODRkWXNRSXdISnJRRldW?=
 =?utf-8?B?YnVXOVMwRnFqZ0pPZlpvNlplRFZDNURPK3VVTDZhZythT2F1Um5FNjdNNVZU?=
 =?utf-8?B?U2h3dUVyUEJ5QndJcFIxU0VTNXp5SzRGUkpyNnhrYWZVUnpkQmpXTjZBTHBP?=
 =?utf-8?B?cDVza3JsSHFHS3VlYzRwSVl5UVpOZ2pDc1R6TlFLRVBMdGlDMFcyRGxzOTRE?=
 =?utf-8?B?VGVLWTc0WGwvd05GK2dnL1VFTzFnWmVyanNTNGdlUUJmMFlYNWFFbC95Q0Qw?=
 =?utf-8?B?L1podHZacFdxK2s0NDFtUS9DTzgvclIvbUJWUGNwaGlZUDF5bmZ0TUNoYlVk?=
 =?utf-8?B?Vzg4OS9XNm1vNFVyZmFSY0JGZUcyUy9HeUNvUHY2NzhoQ2Zta2U2SzViNGNO?=
 =?utf-8?B?V2d4czFLUXFsRGFnZnhET1h4aUdlcnhzbERSR2lwMXBUMlNLR0RTSjhsNklr?=
 =?utf-8?B?MHZCN0k4MUNLV1Y4M1N6Q3V6UzZad2pWZE1uL3ZkQUVIakhCYk94T3Y5YUN6?=
 =?utf-8?B?RHBPWjZxZHBKdVFoVkRWTnkrNytFeEhOT2RaeGt3TmN6amZVcTYvWVU3b2R4?=
 =?utf-8?B?YkFMdDR5NitmWE5VT0RaakNUaE5ZRkJuaVhzNXQ1dVJmRCtzYVoyUmJSenlN?=
 =?utf-8?B?VU1hRHM1U3hFYWpqVUNONzdnSE4vaDZ1ZXZ2NWpJUHdHcHZIcGsyN1lMNU51?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ccc85b-cf1d-4fe5-d607-08ddb300a3b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:22:28.7227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auMlO9/W/CZXJf8r8dx/4E+GsNZytgmxjQznHGvKUJaJlw4v2hSurLWYzOmt21MKLQJTwQoOsfhjFkcZUIqCQkvikFKogQR18ZcYF7mKaQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
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

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  2 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 ++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 66 ++++++++++---------
 15 files changed, 121 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 6b362695d6b6..733c17c945bf 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -294,7 +294,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..97b58c0ff39a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..cd63cdd2dc78 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,7 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physical_size, 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e160e7be84f0..18f0d8f6d0a2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..a7bcda67d05f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..c0bd23aaaa23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 26418e9bdff0..98d79c118e45 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -302,16 +302,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -366,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -502,7 +497,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
@@ -516,7 +511,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -679,7 +674,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
-	return &tile->mem.vram;
+	return tile->mem.vram;
 }
 
 /**
@@ -726,7 +721,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
 			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
+			       &tile->mem.vram->dpagemap,
 			       xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 672faa0b67f1..c64a4d1a5bb9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,6 +94,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -131,8 +158,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -167,7 +194,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..18124a5fb291 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,16 +147,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -278,13 +278,13 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
+	if (xe->mem.vram->mapping)
+		iounmap(xe->mem.vram->mapping);
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -320,10 +320,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -331,44 +331,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

