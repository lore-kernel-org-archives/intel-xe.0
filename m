Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17985CFD318
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 06:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A329B10E068;
	Mon, 24 Nov 2025 06:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqTigbGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DA010E068
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 06:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763964077; x=1795500077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tp1aEDTE/xbNhk3BndyJawalUmZAJ1DpBD1ZBe8XgE4=;
 b=UqTigbGv0+rhqO71o0trdllIL5h6dmB0Iv8i1B3L2RnuqBY4bgXvl17w
 4ZjB/5JUvqm/xkZdAoJk3v8HZ8auZEpC3uzk7vdAHTFx+2mIasiaMJ+Hw
 6ym7q2E9PTTdQ4AOZma3++5GoFzKvAvJ0KJMj4WMJsMUxUXVG3Crn23AM
 f1DxMoXZivkI+ajUiocWE8v98FxE7qc9iO1TxJU7w0MzL8UjUL2gD5yfM
 9mXTrHaf4ELoV3fxwShubmN7t0+Wre3Ncbfd2ckNaqh/NE0GwJ4fAS/vw
 b/mBR1wUXl5ZGXH8lS48YcKJZdLbSd1Y0Dv+44QNVZfQ+mynvP3bXpwMd w==;
X-CSE-ConnectionGUID: 37vmu3FUSCev4MOwl7qXXg==
X-CSE-MsgGUID: cQOUBsm/TZeCYFM8ePtBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91443912"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="91443912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 22:01:16 -0800
X-CSE-ConnectionGUID: ssVpYKpeRxWcqk1M+zewsQ==
X-CSE-MsgGUID: zxWtt2NfTWmpbpHSyc2h8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="215590468"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 22:01:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 23 Nov 2025 22:01:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 23 Nov 2025 22:01:16 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 22:01:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtLdZx+nml6miE7Z0T9cnSNuGMLzYanmhH2UuQVDJu0tAivyACZN/gDovPYOpQdHbydtVZ/fEkv7U0NzA4QWfWZLaCPVX0tgfZ0uSQQST/C4w9aq0HIZqihnnlt0XLmEMJBtIe+DmKJpHCXKaVDy3r5aXV6Y7/SO5/wAd5KjVDmg1JzaOoy8wBrLnOSGRLGk88beOafHOeEMaunLXdAXsydEtuCCOTJcCvt4+P1x1yOlnKR5HFLoEYfgeoK7+CidAXTRCrK0caVxZmsyXPs1dIWkP5ZXVPJBJwyGJEWeqTib1zl1FSDmfaihQ4dNKhFfEXEZKtU4d9mV3pK7iHCafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMocscjLA5ruYhK3osNaVuhBuZUoDyA4691iUdaJGXI=;
 b=BcItJqAThYVXnLXDiJDVRFiw6CnnQmF8Ax+aaVV8jzx0zKrjYHYMU6/zIZGvowZqmVvpyoZwaxi6rIkQ3yNl0ioV1ZtFJ/wKcPkVARvomUO8hjbbqoejYP7t0SpZFm+Zyf7dwkVTz0EHx7Vh0ZEiivb8HWlCX/5brYh083XnTxcDSaBg56LSKuB8thHuQkf0/R6kF8Wf6nj+lapK+LwIrItq2DnViOsogsrQoHZYxHhav4rFj2lm9YEOXamGiGYvf4oQ/D0T5C2ChTaxatRyMGRAs5CeC3+7iqclqIQRF1bXo4TtTsrJT0IOtYvAP0IzBYXafBWtUz/SwumbB18w6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB7894.namprd11.prod.outlook.com
 (2603:10b6:610:12c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 06:01:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 06:01:14 +0000
Message-ID: <f85e4257-5235-4fbc-a4f9-818ce7476c5a@intel.com>
Date: Mon, 24 Nov 2025 11:31:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
 <20251103060957.957760-5-himal.prasad.ghimiray@intel.com>
 <aSIywKH7Sn9uV4Hc@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aSIywKH7Sn9uV4Hc@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 93306d3f-c3d8-4da7-7885-08de2b1edfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkdWZStnR2QwVUNjMDVJRVMvZE9XRzZHWm1qS3BYR3lQcVNjNFQwQWd0UzB5?=
 =?utf-8?B?ZHJPcEpXTmJEZy90a2dlcGF0QVF3UGZjNVdiaHIzdVhZTGhac1RNSHVRdVBF?=
 =?utf-8?B?cjVKMG9WdHR3VUs5aUpBb3diQmhvZXo1YWZjU2JBQlIweFJjemlLM0hxY2xH?=
 =?utf-8?B?bWtYQ3JJcDFORVJXNkpsTVZ1QlVOSlk2OVJteHVtQU1leDBtMUc0TC91NU9C?=
 =?utf-8?B?SzB1dkU3WDJuZElHQ0MvVm1FUkRZUFczbEVyNE9nQlI3czNXNEZjb1M0Ulho?=
 =?utf-8?B?TEtYY001RWJraUVlQkpsemZieE5OTkwzdDRCc0R6ZGR0eCtnTU14YWt0VVh3?=
 =?utf-8?B?WGxpSjRRSld2WnphYVdLL1NSZ1Z2TWZFL3c5a2l0dUJVQ1dVaGp6aTlnM3h1?=
 =?utf-8?B?ZGdWRjQzQ0hNTmV4SlFFQ0FYMTlhWHQ0QnZnOG1mWDhCd3BNaG5SNVhZYjFp?=
 =?utf-8?B?YlhtRWxFVWVWOFp4a2xTZTQ0bjhPU3NPc0xmVmd3TTk2U05qV2doTForMmFs?=
 =?utf-8?B?WFl4Qk93M0F0Y04xQVNkcld3Y2wyb2lSMGNpZk9Pd25CeVVXUSt3ZWFaN05B?=
 =?utf-8?B?RXU1NU5iNlN3d1ZsRExvckRDbFJMZmE0QUFpak80clRmWUhwalpyWjlUTCtL?=
 =?utf-8?B?UnFhcXBVRFJ5YWZtNTF3QmgxZHFkVlduUlN0dlk2dVRXTnhoNGJVSEgzUVpm?=
 =?utf-8?B?b1dhMGdyUFJyYXp5T0drRFNhVStEWi9IdjN4cGkxT3RiNXBSaGwzUGZHc1BT?=
 =?utf-8?B?ckV0TXR0ZVdZZnRWcUNqSTY5eHpiYlBsUW5zbDZmNG5sclh0VGthRlRMZ01J?=
 =?utf-8?B?SnlBOTQ0RE45ZzdjeHhMUjJRS2pyeGF0VFpjd0owaHV6Z1htbjM4K2k1blNm?=
 =?utf-8?B?WmhuOUdWS3ZrcnczVVdPcWVQYnBDL0ZGOGtYaEkzcGFKck05TUpIei9yQ3dV?=
 =?utf-8?B?a292Y0ZIRmxKL2EweDkvVXdXR20wbFJPKzErUzRLbmw0YlNxYkZ5d0phVUpB?=
 =?utf-8?B?RTBVVEhTQ0ZvMmtnSFY1d3FjNDdEU0hCMEJQdUpUNDE3aEhpVE1zQlRKYUVL?=
 =?utf-8?B?d3d5bGVNdDl3d3pyMm1ndk9mYVlDNXd4ZGtpVDhOKzNrdi9hbG9UQUF1c3Fn?=
 =?utf-8?B?aTRHcDJtcFNNaXR6YkE5VzU3L3hjMHR6Smx5dDB5Q09INlVUM0VwY2JBdnBx?=
 =?utf-8?B?SG5UZ0hFVmhjN1I2MCtZbG5EVEs2OUFoTVc2NHJYdy9aTkl4SUErdi9zWmtF?=
 =?utf-8?B?M1NNcXpFMmxZeFZGcXVHaktHSXpSMVJ5bTJLWkU2OG5rRDdUbmo0T3NPM1F1?=
 =?utf-8?B?REdsWVh4cnFZV2h5dXN6dmxzYTY0K2YrdTlPSlhwZndYZmpJcXJ0K3BVZEZp?=
 =?utf-8?B?dHNMZkV3VFNjd20yYS90SUdoYVBoeXZGd3hYMDk0amtvMnlucVRqb3Z2Tjhh?=
 =?utf-8?B?ck80cytjQTlDazkyd1hqOVl6YXF3Zlc0cHExdW1XR2pVZlZRUU9mM3BmaFpj?=
 =?utf-8?B?TkJHYytiRnptWW5EMU0vVHRyZG5VdDVDKytMY2Z4M2ZXTmtYaXN3RTNoZVha?=
 =?utf-8?B?eXFZdHlocXNlZUg0WE5McTUzdkNtN1hmYUU2QlFqUU01eCt2NVRMcTVwTCs0?=
 =?utf-8?B?dWVyeTRZMnIxY0REWnBxc2Q2VW5iMGdPUjZPYjRlY08zdEVQSDJQZEZ3SytN?=
 =?utf-8?B?R2t5N0NnRlJOL3FXd3J2ZER3MFJreDd4TFhnczNpbU9LTmp6ZGdTUVhSTy9V?=
 =?utf-8?B?SnJtYXZ3dHcwRjh4Y3UxVnNzUjk3OUZ1NU1pMlordWFKbkNWV1RCVTJ3SzUw?=
 =?utf-8?B?ZFgzNDJRSkFidEtaVmFGWUZEY0dycmRvQ0tEM1lUVzY3QnVnZTVldDlmTzVu?=
 =?utf-8?B?ZlljQTRhcXVyNUZDYWJscndMQUF0RHFHTXJYYjRFa3hBaHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCtMdUsvamZ1V2JmTHlEaXV2WVZiNTFmWHFxZW1meTFNMTFVQ0xWaEhoL2cz?=
 =?utf-8?B?UXh2Mi9LVStGTzExRlhqY284YXFyL3Z4dWgvMDBXNVFYR3Frbkd2Vm42ckQw?=
 =?utf-8?B?U3RUcHEwWjkzUm1XTVFmMXc1UU14ZlFYemRzTG5oeHMwNitUQ0Y1WGxVWFhF?=
 =?utf-8?B?cTY2RzZwRG5iUDN3QmlMODNsVUUycVhvNUo5L1o4NFpPNjJGZzI1djJ4bVRs?=
 =?utf-8?B?V28xVHM0MS94L1habUZVZVBTdFEzOXFJNC9TdGR0VjNCTTY0US9PczNTOWxU?=
 =?utf-8?B?NHpTZjJYZGduS2RyTGZPa0hTSlhnUGdNOGVtdzhrMldTTUNsYjB3aXpPU1NQ?=
 =?utf-8?B?QXJOVkNCanE1OFJLTm9JNURZMEN3cjJSdFVWTG5OQU1aT25razErNDdsSlpP?=
 =?utf-8?B?TG5rcjVYbVdubWJubGUvSHZhQ3g4ZStuYU5HbldGUDB3aEd6ZkZ5MkpKbFlE?=
 =?utf-8?B?SDZWRGJqc2lEQzJqT2dYZmliMjJlRy81SC9qTzRWUFNIQ05GOXhiYUFiRmgz?=
 =?utf-8?B?YkJmMkJJT090aFZoaEE1a2ptRmo2UFpySk1kTVRKeFhFazI0YjE5MHJpNnBK?=
 =?utf-8?B?UUZIUVpTeUROVkpPL0ZpcFY5cHFaZGNTNm5mM2gwTW14MUlodnUrZU1VZlZ2?=
 =?utf-8?B?c2NRakFnZmJWNWJIK2lpc0FoY3RBbWpCZEtMN01qT2hwTEUrWUtKbUpyT21F?=
 =?utf-8?B?MmJEN3VFN2p0TEJPQ29nM3RJOHk2WjdzUG9OQjdranJQckRib0pQN2VISmNX?=
 =?utf-8?B?R3QvN01tYVB5Q0xqdEtGbjUydmpyRWw0RThCMXlnaGVnelFPUDlVMUI3bWpP?=
 =?utf-8?B?a3RiSi9vR04ydEpmenUrNXdkNHVTZ09lK2M4SGticVlGeXYzUlpEZEpRZkRt?=
 =?utf-8?B?VXhoWXEvYUR1UEJjZC81TWJNZlEraWdtSmlwamVYeWxyak82TmpIZlBQK3Y2?=
 =?utf-8?B?OFhBRXVsb2tSa1NrTHJ6d3ZHdi9tY3FVSFNFWlVINXJ5MkRrVzFvYi94bVNE?=
 =?utf-8?B?OFUySHJDRTNNdVZ5UGY0WEZuN1ZwV2xhSWZMS2I2dUFZZThTSnN2dG9FN2ZV?=
 =?utf-8?B?Q3ZzSnlxQkl3T2RDczdkMzFvMXFqemVMbk0vZklvM0VQVTRBUlQ2V0ZOUGFK?=
 =?utf-8?B?Vjl5YWxHMEpXTXhtOGE0SHJaTlBFNmZJNU5mcGdpWE8zeDhRcHoybDNYcGdy?=
 =?utf-8?B?UDZzcXZkd2duVTJRbVphTDVCZ2VnUVhlU2ovZEdxRTNuamVGdjA1U0ZsK29O?=
 =?utf-8?B?VHcvY2hTa0h5Sy93UW81bE52dmM5UzVRNTVZOTUzcmdXVERkdHFPWmRKd3Ay?=
 =?utf-8?B?NmRDV2VOVkNWNzRiOTlsMHlyU2ZIU2ZwdWZXbkhNT2ZSbVB6UTBPVUIyNlpx?=
 =?utf-8?B?bG9pcWJGZkQ0YTIzc3Jzamc2eVVuT0YyS2Q0VWJ0TDJLd01jaDVveXdEWk1Y?=
 =?utf-8?B?eWllMThLUEJLZXdHUC90OEVjak5tOE1SSEdTRU84eTdjcVcvaEE3M0lEQkNW?=
 =?utf-8?B?bnROdlRFaXhxU1lWTCtCaC9Tc2NjVFdxNWpBQjhQd1NRUExYM01qbzlUWWtw?=
 =?utf-8?B?OXEydVVQcWNQY0VBQkU4MUFGV1Zhbzc2TGdmUzFpME81VTlhL1RiU2N6Slp5?=
 =?utf-8?B?TTFrOTZ3Y2w5ejliY3NodzUwUjVzd0h5dFlHdE9SeXJKVW1XWURGanhQWWxv?=
 =?utf-8?B?YXlvN2o5TWNIYS90TkRjMW1SWWVVMzZYWWVid3BlUzk2ZDR2enlvTG4wZk5R?=
 =?utf-8?B?aGhJVWFtL3lPK3plU1RUV05KanVGVElKa3JwL1phK1lDRkRncEQyaXdGWTNG?=
 =?utf-8?B?VDdKQ0dldHBoWjNZUFE3emJKL0dndGdWSHJFOVJqSUxyc0NBUHRvVjY3M1lw?=
 =?utf-8?B?eWJwR016U0lWMGxhdGpwSXJsa00zNjhjbjdsbG9vUURiYmxpR1QvNFlwOEQr?=
 =?utf-8?B?UkNDdktJOGdzSUQ4blpKbUVrUEU5eldaQ0RwdE1XUGFnWU80SFk0UDJiUkdB?=
 =?utf-8?B?RWUxMkI1UERYS3hGTE5oeWZ3VWZsLzQyOFMyRzlQdlZRUTFIaVlXRWFkRVJK?=
 =?utf-8?B?WEVtUjRNQTVscmRKTXZqaFl6VGhDT2xPeFZXRzlCZlZCS2tGUlBVTk01emhz?=
 =?utf-8?B?MEFDNEd2MWRFSmh0b0xRd013ak1MYldmWUwzMnVLeExRakIxWjIrVDZtS2Fn?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93306d3f-c3d8-4da7-7885-08de2b1edfc6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 06:01:14.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMZ4LH2p6mWqx4BjgcLmHmrTCXICQfHbeUYYok5m4Z/H8IiswKd8wk2gIboz7EPtgqrnNIzRdCF/9pR4odq4ulHIPrHU9sh6/ukSuoLWhas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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



On 23-11-2025 03:31, Matthew Brost wrote:
> On Mon, Nov 03, 2025 at 11:39:56AM +0530, Himal Prasad Ghimiray wrote:
>> ALLOW UNMAP of VMAs associated with SVM mappings when the MAP operation
>> is intended to merge adjacent CPU_ADDR_MIRROR VMAs.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
>>   drivers/gpu/drm/xe/xe_vm_types.h |  3 ++-
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d78eb95a954f..12354e03c3e2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2244,8 +2244,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   
>>   	switch (operation) {
>>   	case DRM_XE_VM_BIND_OP_MAP:
>> -		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
>> +		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
>>   			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
>> +			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
>> +		}
>>   
>>   		fallthrough;
>>   	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>> @@ -2727,7 +2729,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   
>>   			if (xe_vma_is_cpu_addr_mirror(vma) &&
>>   			    xe_svm_has_mapping(vm, xe_vma_start(vma),
>> -					       xe_vma_end(vma)))
>> +					       xe_vma_end(vma)) &&
>> +			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
> 
> Do we need similar change to the DRM_GPUVA_OP_REMAP case statement which
> has similar logic?


As far as I can tell, REMAP is only possible within the 
svm_garbage_collector. In that function, we perform the REMAP operation 
after the range has been unmapped. Therefore, the REMAP should proceed 
safely without this check.


> 
>>   				return -EBUSY;
>>   
>>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>> @@ -4295,6 +4298,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>>   
>>   	if (is_madvise)
>>   		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>> +	else
>> +		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
>>   
>>   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>>   	if (err)
>> @@ -4371,7 +4376,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
>>   {
>>   	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
>> -	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
> 
> Ah, ok this answers my question in patch #1 [1]. But then in this patch
> should we also remove the similar check in patch #2 [2] in which I asked
> the same question?

Thanks for pointing this. Will address in next version.

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/685118/?series=154832&rev=4#comment_1267065
> [2] https://patchwork.freedesktop.org/patch/685119/?series=154832&rev=4
> 
>>   	       xe_vma_has_default_mem_attrs(vma);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 830ed7b05c27..7578ccada2cf 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -470,7 +470,8 @@ struct xe_vma_ops {
>>   	/** @flag: signify the properties within xe_vma_ops*/
>>   #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
>>   #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
>> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
>> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(2)
>> +#define XE_VMA_OPS_ARRAY_OF_BINDS        BIT(3)
>>   	u32 flags;
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/** @inject_error: inject error to test error handling */
>> -- 
>> 2.34.1
>>

