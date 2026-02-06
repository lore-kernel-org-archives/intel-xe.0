Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CEDEE6B49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CCA10E89C;
	Fri,  6 Feb 2026 18:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgnLcJZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B4010E89C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770402553; x=1801938553;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s6OfcSPiHz/Xt0eYzFNJYuj6TZCutIb8nGArgY+mh00=;
 b=KgnLcJZWyl9Oia5snzA2AQQ+XdVVdsJhmYBDxGsKmDsrK+mDyJwYczwW
 yBql9vRD4Xq4RlslPUIkPhX/XoX8D27H4osfcLWFK7DYecKTNnmPC5W2h
 IIQQ9j+GzkovUiiLAGdrKBovS42U8HDQauWS4h8fXCUBV/LbPIOGS8Q4Z
 rVgc8SJh9UzWyOajRCJCuGQHlI347+PUPLh5NUopSFytZleYVbSWMJa4p
 CZ1USeIs2aUEZ8BymDbE9dvMYsCfv9KxGHyUHFPF1+3fSY1aLct/PReY6
 fFMksvobxjF2BAyxIjkJZOQPpPaCIDxZfkbB0jNP01eX4QzPNzgMdwDq/ Q==;
X-CSE-ConnectionGUID: n+RJpJCeT1SGdUcCCshBrQ==
X-CSE-MsgGUID: +emTZxOhRZW/rtP8GGWc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89035065"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="89035065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:29:13 -0800
X-CSE-ConnectionGUID: c4rbiI4hT1mJvW3YoTn8Vg==
X-CSE-MsgGUID: D00K2RIPTm2uxU648U+H8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215121163"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:29:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 10:29:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 10:29:03 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 10:29:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vhx4WGEZ5aRX/g+dxUzRcS8K5sjo30RnMnVyZ1cgx8p7hfnSwFm1TUeTmAzVX0Bbm3YTIEXiJFHCJL6ViVHv/niuNsxrykN1dOPaotrV5MSE5NEwbAiWPpamvQCfkttz/sPUqSvzXa53mYJCHMqwb7oU5mcxD2C8+1j/KsDJQ/vBFrUb9uKZ2izFfy216oGO/ZB3M/q2i4O8cRA9tnA6dEfvoqjo3S66kQmi2x8CABonkXzBOxY1f7vn7JXVo7mCg502I6NQPIqNCm+0rRPvIts9O4PmAve/0NTsuYFdMxqFoZs1EDPBllIeL07ptBSYePiyGT3TnXHj820dn5XMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD4llqCEoXUivl4h13Wbw6XCrOId2YzQ/Le3l8IS3/4=;
 b=E3XzdMB4jIiIsVNprtQMsxqrDAk3AYgA2yKVKSLtrRJ6BQqV6srdKzP9dSk8oBRauk8q55vpUtL9ksYg/AqtRtVkEgZosiOsb4i7V9hUxW7K3G5HIG/o7vcj6XtkYlMo8RykxGFa8yr2dyrVqRsva9UJkb5v+Oh3FlEtTCKZQNU/jTxMe84WCD1IUf9QMbMY3j0AuWaPRebYwqI8tq+xGAYy3yekICxDxq5ZaQVdHBiOWUq9jS84Psbb/0u50SEDnuB3oy0NcU4Ny9pvDJAC4UQux97XCsuRRkj/keBmzgnUr+zrLqHigovmkWCntaocSK2AgO8uzLoedyl5G+vfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 18:29:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:29:01 +0000
Date: Fri, 6 Feb 2026 10:28:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Message-ID: <aYYy6S+wb7LFA0G0@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
 <65de6e6accc8e4344d9d068523fe01a6ecc3cff0.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65de6e6accc8e4344d9d068523fe01a6ecc3cff0.camel@linux.intel.com>
X-ClientProxiedBy: CH0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:33::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e71b8d-2a8c-4367-78c5-08de65ad9942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJLSitidUFpR3A3ck1waEtCR0FvRFVXY1hmdG9hREtKaURXME5WK2lLaGRF?=
 =?utf-8?B?WmRxcTdLRTFnMVhCemVNL2VQV0JicDZyMnU5eDVTS1NvdWtFRHpkcUE2UkE0?=
 =?utf-8?B?U0thb2w5TmFlQzJaY3NaSmpNcUg2L1dvRVpxTWpLZmRyK3NXRVl6NVQ4TFM2?=
 =?utf-8?B?UFhVV2taeGsxMHZDcld6ZnJFYlRpVFdCM1BCdWY2M2c1dEhsMW1rY0Rhblhu?=
 =?utf-8?B?NGhXSUJ6S1E2MUp3ckdtOVJYWGlpdi9EY0VXdWJhdkhoTk5pKzBVYTZUYlRF?=
 =?utf-8?B?YzVZbGxBYlFkdEpaaGVDb1ZZSHdOQkh6RXN6UjJ0THVLQTYxVnl1YVlsMHZ3?=
 =?utf-8?B?eUY5OUp4Wm13TmhRdXp3SWszSG5lVUhxTTFsVjBKT0lZWk1JN2UxM2ordmxs?=
 =?utf-8?B?aFpiT3ZPc3FiOGtXdG9DYTBtaHdmOFkyZ2NMRXdmVy9FUWZXd0o1S1o5K3A1?=
 =?utf-8?B?LzFYMWdiM0MzSFJEdmFMOVZLVU5NL25ROTU4RUJsTXNHNzlMdnhyMzdlenpy?=
 =?utf-8?B?VnRFT1NqcnpOQmM4L0ptSFh6ZkdRdlNrcHpMQXdSY0xsRktqT2dkVGpEbW1n?=
 =?utf-8?B?YWRtU3Zzck5WYUhIWUc5VVJRcDlvY0l5MWI2Q01vRU9pbytrQnlkSDlXTXJ6?=
 =?utf-8?B?bVlsWmFNMDJhV3pXNmJlZndtMjh3L2NRZVFZV0RycUMwUXBDM3RQVVN2ZnE0?=
 =?utf-8?B?Q09YZ3BXa0pjVjRJYXhiMUx0N3FhVWppVittOTZtMWRld1poVVhpM2ZJS3dy?=
 =?utf-8?B?VU00dlUvbk1SNWNIbVdGc1lZRlRCNk1oYy9NOUplK3dLbU0zeFNwWEdoMGJM?=
 =?utf-8?B?Tm1sRUlZWjF4ZXFhTXM1N1hxUGdQeEVzTHdlaXhCU01ZY3JLajFwbGNhSkFL?=
 =?utf-8?B?dVgwOXhXb0VzNDZ3a3RUKzdmS0ZjVkFWVVlTQVZUV0tTTHEwcHo4QitpTjEz?=
 =?utf-8?B?MXNtYm9ZNjZNenZYUzRqTWxSTHl4SFVGTFY0U0RiWVRyY2hGTHFUZWkrZmNO?=
 =?utf-8?B?MUUwY3VyRjFSbjZVWjBaNzUybVF3QVVDdGtEVUh6M1JCWlhodWxDYTJNL0lY?=
 =?utf-8?B?TXZERnhrd3lJR1k4VE5tZjNDMzRQY1BPTkU3aitXUXkwN3lhTEJ6L1lnV2hJ?=
 =?utf-8?B?UkZYUndCRlhjSGhCWERuVTJkZW81T1dQUFRWcDNLcVB5UDVJcEhIV2R4ajc2?=
 =?utf-8?B?aGZTVEovYzBYaDg3T1JGZm00WWRnb1RoS08vaWE0aWdXNVZPQnhwdEJRb3Vu?=
 =?utf-8?B?U0ovUmxEWHl2N1hnVnZYQ2dJQUhrTWJlYTU4YWFxdDY5bmJFVXJ0dFpvalg0?=
 =?utf-8?B?ay9SVVlQRkFocENSR2xyUVNrWmtGeDlaTVZMaFYyZ0ZRWTBsS3Z0ZVB1N1ZR?=
 =?utf-8?B?cDVDeFJPeGlrY0N1YW40SUxPUU9yMWljK3dObkc2TENnRDdZNWI1MFV3MWE4?=
 =?utf-8?B?T3RNaTFjQ3hRQ3VOZndqalhTY2dRd0NFZ0QwL3hPdHdTTWFEdWYwZjd6QnF2?=
 =?utf-8?B?dUZRcUZOL1VMUEFNcktjL0xKRXFac3plSFAvRVVhL0VhN1hEalZaaHRrYS83?=
 =?utf-8?B?OWdJVXh5dGNFZXoyelkrS0ZQT3FBRkdwNEVsVlk0dkg5SEQ0YXlqYlN3aVc0?=
 =?utf-8?B?ck5taWt1YU9ScktCZFdrM2VQUjR2dXJhZkpPZkl2R2gxVDUzR016V08yR2ZD?=
 =?utf-8?B?YVpmaXUwYVB4aTZ2R0dnNVEvWHhQZjJpN21LSzY5dlRRa2treGVWR2c5ZkxN?=
 =?utf-8?B?bFA5Wlo0UHNnT3diR1BsUXZxT0NDd0N5Zi9lR01id3g5UFk4dFlhWGVDNVNN?=
 =?utf-8?B?b0ZOTC9KbEt6U3FKemFaaHVRb29zbzVKbXBWaTJ0MWk3cjZwbS9JUVNMNlNS?=
 =?utf-8?B?cW1HTVdRcExFTElYT3IwUlN4Z0h6d01jeDZXWEx1VUhzQTdDMHhyRVJ6TnF4?=
 =?utf-8?B?UlZOVFB4Q3ZKU0ZTTGFKVFZzMDU4aDFSMlJ6UFpjTXJYYVB1ZVhNQUVaV29F?=
 =?utf-8?B?YWdMbkV1ZTQwYjR3VFV6emFPcmxsQm53anJrYlYvcFl0K1N0YkhSVGlFUTh5?=
 =?utf-8?B?dU0wZEEwZGJVd0dGS0VBUTdIUzFMQVo5NmZlL3NPanpqZEFNKzVSeXpkaHkz?=
 =?utf-8?Q?pU0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRaUEZCOW9iK243ZFVKUUo1amJTb1RIaXBEZHhEWFRRU0paV0k3cjZqblo4?=
 =?utf-8?B?UEpIV1lsSXVWUXdpSi9EcHgyLzFuTjVSSVFQamVJYkxKSXVzQnFCclhxdm9G?=
 =?utf-8?B?QVUyajFCNURNYVhpWk96WDkxeFVTRUNsOWtmdm02YS8rUVoxNTQyeENzb2N0?=
 =?utf-8?B?dEJwRUhIaHMwZnczd3FqWGUrVWtJYkwvSW9hcVQreUp4bGl6NldsZFBGYTl0?=
 =?utf-8?B?TktRSTJjaktqeU9icno3UnNJRDZ5NXdEV1BKZGNhbHVzcS9SaWZ2R2FTdktv?=
 =?utf-8?B?bXpYcWthWFh1bXpLa3ZGUXRxdHowcVdHc2I3d2RQcFFZcmpHdGg5ZTJSZExw?=
 =?utf-8?B?djFsSTRqbEM4bnZ3NXBZYkp5a2NnWnhEQ0JPT3RTUkVQOVh0Q1JobnZtTU1q?=
 =?utf-8?B?b3lSS2lNTzl3dm5OckpWYlJ3TEJOWmh5cjhSSUJlVFJhdWJUVUM2WitmM1FI?=
 =?utf-8?B?RG9aTVBJcENMVUxvL2daQ29aRWZDMWQ0b2gzSzJLbjNBa21CbTIwNitxeC9o?=
 =?utf-8?B?TFZKWUNlVHRFclY5RUdsR2lncVhEdDFoekQ4R2dxeXZrN0plaVU1M0o0S0Yy?=
 =?utf-8?B?VlRic0ROOEVMSWtuSk9BMkc0QWRrVng0WlFVOGZpQzBPWDA1Qk4wMmNLVE42?=
 =?utf-8?B?QVBnUUZacVFNdEZjcWw3Vjl5MjhKQ0thVTdaZXEyNy8vR2w5blIreWErbm01?=
 =?utf-8?B?SjZKT2pkZ0RtVjd6WHpUTW13eEpNNVBFK1Z0d0tvSndNemJVWnBOTHBSTXkv?=
 =?utf-8?B?b2R5bE44YlhUcVNJdW5YR3lhd3I1UGtYdHJ1ODM0NXl4bEtETDVvMzQ4WGtQ?=
 =?utf-8?B?VFJTdUtvUWpNMmdCdHduMC81c2JRN3JXTGs2U1ZUM1RWUVFsa0w3VytaakRP?=
 =?utf-8?B?LzVFcnBBeFdEeHQ3aVBYWDQxdkVjZjhIT1JKbDM2TXl2T2V0M3JpTmJEb1ds?=
 =?utf-8?B?Z3ZXR3ZhdUx1QTJlWDNyeTlHM05tRFZMOVdOdml4cmJaZ2ZuVUhkaTZzTzFP?=
 =?utf-8?B?a04wVEVvckpXQ2xjT1pweHZsMS9TbUJQdDQzeUZib1NVcFZvZ1RtakNjSDZk?=
 =?utf-8?B?ZW5ZSS9KODN4WWcrRTErRnlTb21OM0JoMkZSL2l3MThBM2dIVnNBUzdsYnla?=
 =?utf-8?B?dFpMM0d2MTZkQk5nSkJrcVg2VFZuSTd0YzhOdTIxbTd5bVlCREZmQnh2RXUr?=
 =?utf-8?B?empCOVRYL1FWS3NBS2luMUhpRVhFNGxYTTFyTG9NU0M1V25aaXppcFJqdzUr?=
 =?utf-8?B?cyt0R1pzRmdUU2hMcktMNXhTUC9CUjZYV0l5KytyWkRQUDNCblN3OGZJZmwx?=
 =?utf-8?B?UUhXUWJEUjdaV0hPVDFLOFVpazhXQkFTMGpUQldkazBUdlVzdVl1cFVjYjJx?=
 =?utf-8?B?MkVXOG5UdjNZRTA2MG9mWW9md3BncVdNSTFNaHR1ZnpoYVNVUkNOMUlxUy84?=
 =?utf-8?B?R0NNRnphQWVQZmZtdmM3L2ZDVUJjRE5xNXJleHcvRDJWZEFZaldlZHNyem4r?=
 =?utf-8?B?ZVFpL1QzczduNUhkRHIwSTRvNGdsS0JsdUJUYWtoYmptSWhqZlFwMklEd2Nl?=
 =?utf-8?B?MTQ2c0x4cWRsWTNwUS9LVGVBZFF2REt6TzkrVUxJZE5oOTVjN1UxRHVtaUlz?=
 =?utf-8?B?WFV2SlRVVDJhbWdKUFVqYW4yZ2drSWVUSG5XSkE0UU5SZmpFMEVxU1VYNTZk?=
 =?utf-8?B?YlhhMG5qRTM4YndOMVJrcTY4VFJlejNrK1BaWVk2UzdyTFlKMDk3LzQ5UGo4?=
 =?utf-8?B?RDVNUHJldlVIMEd3SGI4RnMrV0NMSGpTSXFhOE1kclpxeFVSMGRicnd5YnZT?=
 =?utf-8?B?U2tvVHVhVklPc2JXZWFjWG14cHdIL0VKdG1BRWVKNnJabWhJTlg4UUc4Q0hT?=
 =?utf-8?B?eEoyRUhONkE1c1N4VUM3NWVJakk4ejBVZGVMYWkwM0t0ZTREbFdYb1dmSHE5?=
 =?utf-8?B?QmU1SUZzbng5NUFiTHQ0SVdjeHZHQlhaVS9aS3pmZmlqdkk3ZDNvOG5jUGlp?=
 =?utf-8?B?UWtadXEzajBPMWJVWko1bmtScVNLM1lkdTI2SiszU0NXYU5sTGdERDNPZE9y?=
 =?utf-8?B?YW1QNnVEdTNwMGR5ZWlKSkVkdE5wYmxPN0xTUENza00xVHJzZUx2NWlNUDFx?=
 =?utf-8?B?WTAxb1daUVFWcmZLck5ZSExrdmc4MVhERzl5aWxNdnhGaTlJTEZLcjRMS0Z5?=
 =?utf-8?B?YkFHaFZIZnRzSjJ4RVFMNWV0emd5eU9oWWorcGMvMHkzZWdFV0dhOEdOS09q?=
 =?utf-8?B?cEZJT1g3YlRZZmJwL0dmcTFKZWhzeVR4M2VxeFVLWlFlbk5pcHgvMnNmRHdm?=
 =?utf-8?B?NEp4VE15YVp3NnRZZ3NnK3ZZbGlLRmxWZEt0ZzRPTlJXeVZpVitmbDQ2dlcz?=
 =?utf-8?Q?f8WMofD1nAMsWvlU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e71b8d-2a8c-4367-78c5-08de65ad9942
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:29:00.9650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD2QEgXyMtANEg6coTMSIXMIMwEfQ4ZALhI8/L0+98Jx9bETKx0s/neSzcOkdGv86c3X7YYpAFx4xh2f2zZJhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On Fri, Feb 06, 2026 at 05:17:46PM +0100, Thomas Hellström wrote:
> Hi
> 
> On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> > Annotate the SA manager init path to model taking swap_guard while
> > under
> > reclaim context. This helps lockdep catch potential circular
> > dependencies
> > between fs_reclaim and swap_guard in debug builds.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > ---
> > V1 -> V2:
> > - None.
> > ---
> >  drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index b738102575d4..5efbb5a09f77 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -89,6 +89,12 @@ struct xe_sa_manager
> > *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> >   if (ret)
> >   return ERR_PTR(ret);
> >  
> > + if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > + fs_reclaim_acquire(GFP_KERNEL);
> > + might_lock(&sa_manager->swap_guard);
> > + fs_reclaim_release(GFP_KERNEL);
> > + }
> > +
> >   shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> >         XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >         XE_BO_FLAG_GGTT |
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> In addition to this, a couple of comments to the code that is already
> in the driver:
> 
> It would be beneficial for understanding if a document section was
> added for the typical usage flow of the shadow buffer, something like
> the below (hope I got this correct).
> 
> *) Clearly stating the use-case: That the whole buffer is bound to HW
> and can execute at any time. The shadow buffer is part of a double
> buffering scheme so that updates are visible to the hardware
> atomically.
> 
> *) The flow:
> -lock()
> -Swap buffers: The buffers are identical. The buffer bound to hardware
> becomes the shadow.
> -Update the primary buffer.
> -Flush the cpu buffer to primary on DGFX (BTW IIRC this was missing in
> the code). -Point the HW to the primary buffer.
> -sync the shadow to the primary.
> -unlock()
> 

This is is roughly correct. I agree a kernel doc section would be good.

> In addition perhaps more lockdep asserts an also perhaps pin the lock

More lockdep is also good. What functions do you think are missing asserts?

These are two possible ones I came up with:

xe_sriov_vf_ccs_rw_update_bb_addr
xe_bb_ccs_new

> in swap buffers and unpin in sync to shadow so that if anybody releases

Pin/unpin isn’t a bad idea. We could also have xe_sa_bo_swap_shadow /
xe_sa_bo_sync_shadow acquire and release the swap lock, since that clearly
defines the critical section for this lock - what do think?

> the lock in between you'd get a warning.
> 
> But this can be done as a follow-up, (beware the possibly missing cpu

There are barriers in xe_sriov_vf_ccs_rw_update_bb_addr, do you think
anything else is missing?

Matt

> buffer flush, though). I think it's worth spending some time on this.
> 
> Thanks,
> Thomas
>    A. 
