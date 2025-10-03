Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59D1CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7547410E202;
	Fri,  3 Oct 2025 16:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQ4p4YdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B7710E202
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508801; x=1791044801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YV6d+oVb6I6c9eeOijBQRVZHfhJV3r5kRNlvuo5Jms8=;
 b=OQ4p4YdFbku2rSgZeNwM1eIjxYuuKvaJIAVEe/y+2FdBm8NgUzhWrSXx
 WxNwuPEaGMWo7vKt5omLQzBznq/SN8XKq42TYaYfP/PQLZprkNYvIbG7m
 hjh0HHAJ3eJBOxhrVy1ej/xLfzqSG11ysa/lexZ7fte5L942UfvkglJfJ
 B7blNlkRMIrijZdvdFVeldAUJd+Oz6yfEmE/3UslFESxPfkJL39Vfx/tm
 rOvCXb28MoMPInuHQ90s28ODCeniF/pXHpr6q4oqfygLMQXagp6XASKE6
 1qHTjUd/z+ZdW1a/234PFNyYCYg9MFpDOKCNgd33+zuZ6awmirt+7zy8a A==;
X-CSE-ConnectionGUID: djwyqof1TGKJ3p8ApXQpEw==
X-CSE-MsgGUID: BhzyY24CTmKIfA7u6CN++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73147105"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="73147105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:40 -0700
X-CSE-ConnectionGUID: pIB206EjQkqny9uP0U6Ipg==
X-CSE-MsgGUID: fmLz5SvMQbiSrWk9JRuNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183345710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vhqj+/5LS8r6cjiNYv/+mCOYV0wqU4cr11x6V/L2r51VFtWrPhF504RhT8E0uz9KEDuPBmxCshaJmPoB1Vt952KhbDSWSC0LrRjYA9Beq5vspNVk7hy8ZZECTRQ/4Db43gCsEHfwDD+rFtozXwSi687uHKsf0pspB7GMa/9hCshPjNGfm37Ks1rwKO2aUE8hMbVUucgLtrjcZ/IWx5ST1Mp/UjZJFtunSjjBNMdtX4vRckCDRcP/pHCjiqc9D4hQMKGLpGoWHNBuzfLIraVkzmWfbVHFYCS3sKNOBbqFHwSKIbSCquRqpdzyp+IvfBMVn6bSO6VJcMQmR3Li/Z5gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGv839uV85NuQPu4U71y1M4nJwrWG10gbANXoZuO62I=;
 b=LLqwjnyWiVy6mHtdSgKKL8P/9BpX8yQim5Qg3dM6KVjPHh59+YyjsI8Ye+X33ZaRdk08EAVfaJXARquXqoXakI21jaKAQaGNJyywCGVaDphyqx/ohDbKbX7c4Dhprw5jtlouZ7oDEEX3m6A8TBp9a5od6ILzhCNJ6aTuSmAIP9Fv2eCGdaUJpYBSSJvf8koseyMA6yWYgoo3oP7MrxqPnDuL3fHf8BsJuwjfy4Z2upBSuR2bycuTGaKR0FF6K1uJE6O4q8gESGR6NgY5oDb1Do7vyJZLd04oREicjl/a15XBOx9tJ/UAtTW5KTVm/lbziiI4MgeqpkOAu9eqM5s0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 1/5] drm/xe: Add initial support for separate kernel VRAM
 region on the tile
Date: Fri, 3 Oct 2025 18:26:15 +0200
Message-ID: <20251003162619.1984236-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
References: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 1353662f-a93b-421e-7581-08de02999ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGR5OGpESFBIazIrNWsycitzbjV0aTVEUGtST3ZPdnhwSmZIRVd2UXlYWGR3?=
 =?utf-8?B?N2JLc1ZoaERWb0FxbnJoTHU3bURxcllWaTJwR1k5ektaVmhGUmxZN28waXNK?=
 =?utf-8?B?SWNUMVZBQkZDbWIwRldXbmtmTFhtMEtyRU5GeFh0bjAvQUZpUThIclBTaEVG?=
 =?utf-8?B?WWdYZFVudG9wbEd2dGV1b3h2Q3RXR3ZFTDhwczV2K1h3eEZyZkxEdjFuc1Jr?=
 =?utf-8?B?cVpTR0liNTg4U1lGbWdRMlliOEx3aGRzdW1WM2NXdHhGTmtxZS9oREI1TEx4?=
 =?utf-8?B?UTBlVVdpc0pCUlJmRE5VNGdlTE53eXNSMUNzUUVyVnh6Mkd5N3lLR2I5M3N6?=
 =?utf-8?B?MkUyeU40RHc2T3VzMjRJL0g3cHN6dDVLa3hrekEzb3AwUXhYSVJpS0JEaWFZ?=
 =?utf-8?B?WUh5QkFaTmdZdk9qdFNxd3NNYjhoTUU0U3Rna0pNZ2dOejRnNXBpZ3VFdjJK?=
 =?utf-8?B?ZzdGY2ZXYW5CcjNhMlRaVkEvbDlJNUtqTEl6cWpHamhNWTRUanoxY2tManZ0?=
 =?utf-8?B?bko5bHFYeDQ2L016dnpsRDlTUkdPMW9sbWtYV2djWlROSlpDc21uRUpGRzJJ?=
 =?utf-8?B?dnF5WjdjZDJSaGpzQkJHb0JjVVF1UDE5SmhxTWVOQ0J6cnBUNWxLYmk4NkR2?=
 =?utf-8?B?eXpuNHRPMWpXUXJhSENnTEdTaFZrbFBKN1R3R3ZrMVdodGYvYzFpSDY0L3B5?=
 =?utf-8?B?N3hCRDNIeEM5MXNIWFppZ2NoOTRtUDlFVlhucWN5SEVTaWpNM3oyZ01KaFRv?=
 =?utf-8?B?MW00R3FnM2xIS05VbU1QSkQxbWQ0elFMdk1QQTkxcnBYdGxaUkJFMWp1MGZC?=
 =?utf-8?B?eXgxR2NnSVJGNGdHSkdPSitaRDlVbGV2ditkN1VQVnZVUGV0UEhmVkdTdjdm?=
 =?utf-8?B?NXR4SkNCRlplc0pvNjFBd2ZwbGF1VDRuYldxa2pWWWFIV3FVSUpleDd2WDdh?=
 =?utf-8?B?Y29Hb0h6eG5NZ1FtM05nQWQrYmJPemFCMGpDbXhCNGVuRE83VG9uaEpRTHVP?=
 =?utf-8?B?U3RwS2pobXd0aWdlMmhpcHhndHlsM3kwNlRFUm8weUg1MmdyNEcxMlpPSXh1?=
 =?utf-8?B?QWROZlpPS21kcHltUXFmbkpwQTdBYzBRSzRBeHp4VDEzRlo5NHgwSk9NWDZv?=
 =?utf-8?B?ZE9UeHF6MXBVLzZxRHl0WXBJN2pJZERhNHdQSEYvM292SVNNOER1RWJjNGdG?=
 =?utf-8?B?VHdXUGp3VThpSi9Od1J6TkJnYTFkZk03Sm5aN0VsTVAvQmRNNm4zc0pPdlhO?=
 =?utf-8?B?dzI4M0VzNHVUT0JmYSs0NFV6d3Z3SmkxMVJWSUhROWJOUjdGMEVOYkpUaytU?=
 =?utf-8?B?YjFLSHJscnBkWFJFbytvTzF6SG4wVnBtc080WFRDV0p6Qy9qejMvOW5OT25n?=
 =?utf-8?B?eUg3SFhNUXlZaU5mOXFTQis3YjBTc04vRytudGpIRHFVNVJpdUt1amw3VDZi?=
 =?utf-8?B?UlZUa3FKd0tvaWxpdEVGK0U5bjg3SFZXZkxVTlJPQXZSOVJOTkhZSkg1NndG?=
 =?utf-8?B?MXZCWVFKSDdPNlZnR2h4V1k4UGdnMHNFT09ZNTFuejBoTHptblNEUlRFWUta?=
 =?utf-8?B?YkJQeTBFc1BMTTBBeC9GWUhxNExTUWcyNTJZYkVnMUlEdE4yaVVpQXFFMVNU?=
 =?utf-8?B?MWNpZmQxRGdaYWp6TnRPMXpYVithMmZ1Y091VXJFMGNaR3lPUHA4akRUeGFj?=
 =?utf-8?B?Y000UVNDMkJudUx4Z0dLbEg3MnpCYWR4R2tZYlJYZ3g5Z0NmcERQRmVPYStP?=
 =?utf-8?B?SGpXU3hyZDdUNi9ja2R4UmV4VWI0em5kbVJVZDVTLys4b29vNWZRNWlVLzUx?=
 =?utf-8?B?cWtvY1NjRWRtakpkdTIraFJra3FPVG5mT212U2RRcWR2ZXpBRXRPbW5jNStL?=
 =?utf-8?B?ZlQ2KzNjVVBYQ0RMNm5ySVZTK3l0ajMwUXozYkw1NTRxYU41dmg3VXBacjFX?=
 =?utf-8?Q?6+mQu8Py51+teoj02Iu7obYAE2FeHxyD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZqdlR6emRZS1RCVVlqUmFJMFlaYkVxUGxXaS9vNlZLcGJBMWFEcVdDcm1S?=
 =?utf-8?B?cWhVVXdiSVZSOHVGcXord29UWmF2Q0xtL0w4TnR4N09iVkJ1Ky8vUzBhcnRW?=
 =?utf-8?B?T0krTmdxeTh2TzZ3WGNIdWNsenlQWWhEaHIyT2EwM2RjOWQ5eXpEbmdQZ2dB?=
 =?utf-8?B?NnkvWU51WW9zcEhRU0JUSUJEVkZ0L2NGZ3lLOExDTWlMRnR1cjhFNStLU1ZQ?=
 =?utf-8?B?VmVkZEV6WVY2Y0gvSy9pRWphU3BxbU9nbkVKdCtsakgzVk9HeFphdjVvc1ZF?=
 =?utf-8?B?aG83RC85WW5TdG1UVFBmUEtnWEhBRm9wYktJVVQ4MzV1ZnE1emhaeUhweUIz?=
 =?utf-8?B?K3lsNXpkakdWUFZiL2J0dkcxY3J6QlR2b0QzYWZSN0NMS295N1BiVlpTQ3l6?=
 =?utf-8?B?ZjBxWUgxRDBqSDc5ZzBuK2dWdytjZDlqUVQyMWlSWEgxM1RpOU5nTWdtY2pC?=
 =?utf-8?B?bmg3L0RtY3VFb2RvTXovcXh0L21kb3BxS0F2dDBHYzdBNEVpMzV3YnJydlp5?=
 =?utf-8?B?SEEwY0ZzZnlndFJSNmdVdE9PUlJzUCtwSXp2dUJvcDR3OHVTZnYvTU90Wjc0?=
 =?utf-8?B?c2cvTE0wN2ZXNjR4UUpWdm5yOHpjOXZ6YnFqbWF1SXBERm5HVS81VmZtZjRm?=
 =?utf-8?B?YmhJSUtaRUtFaEcwWnNmbWNIZmRCNFprcUN3cUR2UWVZaHJEOVBGdU5VUmJv?=
 =?utf-8?B?WDcvZlhWWGxFTGRLeUM0YUhJVGxWQVR2VnBXQ1U1K3B3YS9CRXRzallveXNa?=
 =?utf-8?B?WW04V0hkUmJwczZyL1F1N3JJaHY4MUxFb3I5YngzNW9rSHJJaWZnOU5wdTQv?=
 =?utf-8?B?WXRaMVcvWVFvNWx3aXNXT1BUbnI2bTdudit1SS9kNzRKZjliZTZjdDY1aDlZ?=
 =?utf-8?B?WEMwRkp0VG5rWWYvVXErelN6MmhJcHdOR3h1eEdWSmErUXVKakZtMmhNdTNQ?=
 =?utf-8?B?dXI5N29TemkzVVdOMk9KNWM1ekljNnhLNUlsOVdDSzhib0RCN0VkUnM5WWMy?=
 =?utf-8?B?cGx3VkIvY3lYSGtMMWU4WVh2QzcxZGQ0NWlYMW8rWWFDVjV5ZE1mTzlSdjFL?=
 =?utf-8?B?eWt1bW1QNlhxZjMrSWxuZXJKS1dFNHk4SGhnVWd5NVRNdjA1OURlMkdWM3FG?=
 =?utf-8?B?Q013QXBsclkzQ2h5MHBQakNCWGxFMzVLcjdoeXYwa2sveC9hTmU0R2JmVklo?=
 =?utf-8?B?OUFwYXcxTC9jOTA1K3FWUG8xb2U0K2xyTVQ5Tm50RHhXTWJlaVQwRTlSd3NI?=
 =?utf-8?B?aS93TVVmcUE3UGRUOEdObnZrVDQ0SmV2dzhqV3FhS2szWCtrM2FNbXowUDNt?=
 =?utf-8?B?MkpOYnhTcVZ6dElET1lnNDN6NTFNKzkzTzVhVlUva3hBcCtFUmJoRHc5OVBG?=
 =?utf-8?B?cmN2MGVwMDNBZ0xWaVhsR2cyN2lrTVFDQy92cTBjSWsycVB5NllEazQ5eWpz?=
 =?utf-8?B?N21pekVuQ3Q3Q09yN1JDbTA1eDdSNG9rWUtrWEk5NXZINnk5OWhKNnRqeXp5?=
 =?utf-8?B?Q05sc0FWUHlHMkpnOXBJVStIeHZiSnR2ZDJKcEhKNStqakJEU1RaMzNQZnpp?=
 =?utf-8?B?c2ptK3VoTVRCRTY0aE1NaEFNeDl6V0tJdDZ4WDJadDI1ZUZKRUpQVU0xdXRh?=
 =?utf-8?B?MDR2VGpTOFpHQS82RXo1a1gwbjNLcUNZWVN5dWtsK2RPTTk2dS9vd2lQYlYx?=
 =?utf-8?B?amN2MmtPTmtFZUpuTWRURjBFS3NDVTA3YkI3SGlRNitQNWRrQmg0QUVlNEll?=
 =?utf-8?B?aGk4Mm9VYjJSaXR0STJva3lYYXk4NTBKMDc5UWVyNUgwM21CTU9WN1V2NUwv?=
 =?utf-8?B?S0F0dFRXd29mS0FVV2UxamYrQjFUUFcvTmkwM1FwZ3IwVEhEK0dJbXlFMm9v?=
 =?utf-8?B?UGlJWWFGU1JNZXBCbkIrMkloU25EeFcyOWo3ZzJzUk9Zckk3cUtRcWFYU1c1?=
 =?utf-8?B?WFp6NytpcStBenFsSnpaQ1ZDeG1ic0pWUWFIcFFhdVVjOGtGay8wWTZuT2RW?=
 =?utf-8?B?RkZlNEN4SVU3YWNKTTBVeUc3eWxPZkRBVXcxZHp0S0RCNE9ENmU4N3lHbW8r?=
 =?utf-8?B?dXZadmxRb0dXZy9hT0Q4dHEyZ2VkSEVlY2Z0dDBvQUx6MjNRRS9TVHZQWmU5?=
 =?utf-8?B?QlBkMmFNTVYxZzRTeHNqZ3Z3RXdobmZ6N3JRVmpNZHJwTnFwTmNOdUxYQ3Fj?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1353662f-a93b-421e-7581-08de02999ffc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:37.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emHRJvN62wk/4K2ftaNPVxmmOkP7vS8RP6U8NfHj+n6rgf7v/27Tx5OPkAxadhvApP8O/6421Pr1HOwlNA/Cz2n1SiAqDJVaAWi0GJtzmJY=
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

So far, kernel and userspace allocations have shared the same VRAM region.
However, in some scenarios, it may be necessary to reserve a separate
VRAM area exclusively for kernel allocations.
Let's add preliminary support for such a configuration.

v2:
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper (Matthew)
- moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
- drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
- use hweight32 helper in __xe_bo_fixed_placement for readability
  (Matthew)
v3: remove unnecessary VRAM fixup id

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 78 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_bo.h           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  8 +++
 drivers/gpu/drm/xe/xe_vram.c         |  6 ++-
 5 files changed, 75 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fbe81cda15c2..41ccb3242648 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -35,6 +35,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -82,6 +83,10 @@ static struct ttm_placement tt_placement = {
 	.placement = tt_placement_flags,
 };
 
+#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
+	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
+		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
+
 bool mem_type_is_vram(u32 mem_type)
 {
 	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
@@ -214,6 +219,27 @@ static bool force_contiguous(u32 bo_flags)
 	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
+static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
+{
+	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
+	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
+
+	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
+}
+
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+					   enum ttm_bo_type type)
+{
+	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+
+	xe_assert(xe, tile_id < xe->info.tile_count);
+
+	if (type == ttm_bo_type_kernel)
+		return xe->tiles[tile_id].mem.kernel_vram->placement;
+	else
+		return xe->tiles[tile_id].mem.vram->placement;
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -246,12 +272,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 u32 bo_flags, u32 *c)
+			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
-	if (bo_flags & XE_BO_FLAG_VRAM0)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_FLAG_VRAM1)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
+	u32 vram_flag;
+
+	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
+		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+
+		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
+	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -270,11 +299,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-				       u32 bo_flags)
+				       u32 bo_flags, enum ttm_bo_type type)
 {
 	u32 c = 0;
 
-	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_vram(xe, bo, bo_flags, type, &c);
 	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
@@ -290,10 +319,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 }
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags)
+			      u32 bo_flags, enum ttm_bo_type type)
 {
 	xe_bo_assert_held(bo);
-	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
+	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
 }
 
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
@@ -2165,7 +2194,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
-		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
+		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
@@ -2223,34 +2252,31 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_fixed_placement(struct xe_device *xe,
-				   struct xe_bo *bo,
+				   struct xe_bo *bo, enum ttm_bo_type type,
 				   u32 flags,
 				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
+	u32 vram_flag, vram_stolen_flags;
 
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
+	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
+	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
+
+	/* check if more than one VRAM/STOLEN flag is set */
+	if (hweight32(vram_stolen_flags) > 1)
+		return -EINVAL;
+
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
-	case XE_BO_FLAG_VRAM0:
-		place->mem_type = XE_PL_VRAM0;
-		break;
-	case XE_BO_FLAG_VRAM1:
-		place->mem_type = XE_PL_VRAM1;
-		break;
-	case XE_BO_FLAG_STOLEN:
+	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
-		break;
-
-	default:
-		/* 0 or multiple of the above set */
-		return -EINVAL;
-	}
+	else
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -2279,7 +2305,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 			return bo;
 
 		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
+		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index a77af42b5f9e..9a8401300b15 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -122,7 +122,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags);
+			      u32 bo_flags, enum ttm_bo_type type);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 53264b2bb832..1d2718b70a5c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -158,7 +158,15 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.vram: VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..6edb5062c1da 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.vram = vram;
 
+	/*
+	 * If the kernel_vram is not already allocated,
+	 * it means that tile has common VRAM region for
+	 * kernel and user space.
+	 */
+	if (!tile->mem.kernel_vram)
+		tile->mem.kernel_vram = tile->mem.vram;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..7adfccf68e4c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -283,8 +284,11 @@ static void vram_fini(void *arg)
 
 	xe->mem.vram->mapping = NULL;
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
+		if (tile->mem.kernel_vram)
+			tile->mem.kernel_vram->mapping = NULL;
+	}
 }
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
-- 
2.34.1

