Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EB9CAC585
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 05:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E497610E0BF;
	Tue,  9 Sep 2025 05:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juNJR5OU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C508510E0BF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 05:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757395012; x=1788931012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOeW54KuGRhrASYtP2X5tlyhKCgmoY1tyvQ0S/6h8KM=;
 b=juNJR5OUaVE2FKClbUx8toN+6GwFaS6utC+CEM5a6mNzcmy1imd06UFY
 6XfYW7eBzO6fuLwLvElwlZ5EkZ1UmKu+7PcSHqmA5c8gv/V5dZyouJ0bS
 ueaHWCBpw8UOKvhmQYh7Ahob13fA3dNiE0PgaKKt2mneVjcjD4fyMGV/0
 kpwKjM9tIgPHbcYlCujgFFKSxCFuVHI1m/kw1bE6lR69vZamEp8OMqVD0
 9uWgBcgBw7u/tt5B866aD5RAe//DnOYOuhwIbQM2YP5AKeK88Mq6EUeaX
 180Tqsfr5D6fAwYnY03oHrCOxuimuAnWaqihURRF9mLJ1rAspYdpBe2Hb g==;
X-CSE-ConnectionGUID: FhqWu8UBRNOUiA3tEH6K0A==
X-CSE-MsgGUID: /bdMU0B0TbqItaM2T0xJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47242437"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="47242437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 22:16:51 -0700
X-CSE-ConnectionGUID: O1+UrhZnQH6onVkqpQeDLg==
X-CSE-MsgGUID: XOz1+yuXTd6PTejmbMehIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173109448"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 22:16:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 22:16:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 22:16:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 22:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgLM8MbWFOuRZtzzUp+4nIzCfcqMnyVcJlR3Fdt13gJKB3iOBkn7jwd7EjUf76LmrZBcXKsmSOJJ8VPFvjkECaPIR+or0s2heuvknoPkoETWNIJ2pvu96nbfcKTZ6Vdk9SQXWVKlOVWrehsuVXQ4cqVC6K5FpBsJuC6Mgy+02CvVkv7zp3MgELf7DfN9OJXB4ChLwyjVW1Af8SqRz9l1HtJhHWQuXjlW09MPYD45Xldlou81WDq4pWc5A0Tp0rp+lbw2gcwanJGMxtxMQgcJxyHETUvVqDdU6zgCk79eiPr2WjsPo1A67+pj05w2hoLTXNRTjRrc5MHKfxMq+4AAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kbWcdS0thqqOwdWfvwq8wPDRVRuTufSmyZfiiN7/2o=;
 b=yDeE0S+4NG3BZlkkJjGlrNC8lGRlO/BjANZIUyOBnECwhoW+cpTXcMHukhoOfGFd55CNwpjA+Zswk1iIaG05oli519FH2bKJVlhoXQH6eYLWDrQ3Dh4Fr3cXM7AopnTL2Ccsjxc2EUG+xK3nN8KypBMUUstZJjJrmE/9CS9GXaiZPtfOxtqwufWGeE2vTYzbmS2Mt6wAk2ls4xKjSr3wP2WKfA6YVStvnX2XKV0luM3pAx79Fh3dqY/UX9tGqsv7Jm3OS73ENMI4+ToPhyDwIbDJeXMYzfpfpuCfB0sw5nP/2nJ/XAlMkf8l7q1qCoH4NbBC3qNXeyEskTgsP+Praw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Tue, 9 Sep 2025 05:16:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 05:16:37 +0000
Message-ID: <a2ad7559-1015-4fb6-b0b0-8893088e39f0@intel.com>
Date: Tue, 9 Sep 2025 10:46:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
References: <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <20250904103521.7130-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250904103521.7130-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b13c06b-93cf-4634-ce8f-08ddef600ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUx0UXc4aXJ6NzJQbWwwSEpPTHB6WkZzcllqN0JFMkRoUkF2amdzRXY4Yzc2?=
 =?utf-8?B?dlkzZ1hoVkh5OHp6U3I5dGVoOEdXSURybXh2TWg1cUlSU05KbzZDNGwzTHBn?=
 =?utf-8?B?dDM0WEdVMXFmQ0xhSXZKZHUyRVJkY3lydGJyUzh5NmJOSmt3YVM1RE5aa2pX?=
 =?utf-8?B?TEdTdkRibmNPTC93K1RqSW8wRGlONXhHM09DYmc4azBsTTBCWlZQWUJucHE2?=
 =?utf-8?B?MWVSdXRkdC9mNjJxcXZ0MVRDUXdraTdhZy9lVlNZaDdCRFRaVG00SFBndEI4?=
 =?utf-8?B?TXFqOFFVTkt4VDJVRGJyU0hmVnJVS080UTh6N2t4ZEMyUVQwbFAwZ01IR1V2?=
 =?utf-8?B?UTVZSXVvT2NtVEJJblVaSDFQdHRmYkZTaWxlNDZrL0ZZZUlQZHB5bmc1WWV2?=
 =?utf-8?B?WS9HTDRmaEVXZXRISTRrZXV4bzRPZGJJZ1FTRUpCbXhFUFJIK1hEZ2VQNUVR?=
 =?utf-8?B?NFV3clp2R0JiZHE3SnhCRnY5VVgxVkVNZXAzdThhVENXQVRFb0lpY1dwYVFD?=
 =?utf-8?B?TEVWZ0FjdGcrRVlocWVpcTdvenlsUk42d2d2S0N2aGgwTXdSdmZ0cENOWldF?=
 =?utf-8?B?d2JyOUNZOVZZVVRRZGxFb1pxZHR6TzltU3ZXbkJmY3c3aUdpNDAweUNKUVJz?=
 =?utf-8?B?c0FLMndaMDdodnZpWDVreGpxZ1U0Q2k2aGdMcEtrdEdiQ05DODdGallEVlVh?=
 =?utf-8?B?K2VtMnBsV0ZiU0JXMUJzYnNZMGtUZUlkMUFaT0FDS3V0S2RqWVlrTm5sVHk1?=
 =?utf-8?B?RS9NeVk4ZGpMOEpnUE5ZRmYyT0tqa0x5d3h2M2tnMldtaHYxeGdCTHBpL3BV?=
 =?utf-8?B?NEthZHRiZDQ0cnNzYnBBbWpzYlRTd3BqYkpMREVJN2ladFprU1J6NFFJODNt?=
 =?utf-8?B?VU1tZHY3WWUvMVU4eStwa1owUmZ3dTVYbE1DVllieURyenNBNXJPWlI3dkVr?=
 =?utf-8?B?RjVBWUo2ek1hVXhIOU1XN3doeTNST0NrMWJJTVhzcVZFRXV1RmF6cElsK1Bq?=
 =?utf-8?B?cUFlbWd2SGxQdUc2TUtVNkdKWEdrR1lqUEFlNHg2SEtWanZhSFFqSkZZOVpa?=
 =?utf-8?B?a2d4QVg3eVM1UlgrNHhUQjlsYndUSndzbmxpdUpBZDg4ZC93UTkzdnU4U3hE?=
 =?utf-8?B?bVZoZzZ6SEZDNDBJVlgzZzlCUUpVZHpkdTBFN1pUS0NzT2V1a0pFMm4xMWZa?=
 =?utf-8?B?eitLaEdIbk9vUVRCTUFJRDFZK3Z6Q2NVUTB6UkYzc3J0YnlValhUTkNBTHhI?=
 =?utf-8?B?cnFnemVCdVlZWTE4ZFNjTjlpZTVFeFZoQ2RIKzVOa2Y1elpvVUR3bG9rUDI4?=
 =?utf-8?B?d0hrZXdNTnN3L08zTFozd0o5SE9QcHh0THZmR1FxZ252NlhLcVpWSU1KK1Ru?=
 =?utf-8?B?UXNVRXNaSzFGMmJOK3VoT1ZFSnpzOHEwTnBMUFk0S0xObmdmd1lSRS9hSE5v?=
 =?utf-8?B?STl4K0ljMmcxNWdPSGllT2xvdGxYbWxjSThWVHN3QVJYMkpYQ1M2SDRwLytv?=
 =?utf-8?B?MkhNejR6L0J3aHVYdVVwUERhRmxudk5aSDFWMDZzd054WnZKTTNGejEyZDh6?=
 =?utf-8?B?ZE5sTVRCaHYzTXlmVDd0eERieEppRGQ4TS81N3M3Y3B6TVZlSEJ2RW5VSm9T?=
 =?utf-8?B?eTdVZjlDQ2ZtV3czVXNaeXRPVTh6cW9wa3p2NElVYWJXS0xEWlNWdUJQSllI?=
 =?utf-8?B?ODkxbHdBUEpnRzZKL2xjNThweUJURVJLd1F3L2c3OFNtcHhIN1ZkYU9WamlX?=
 =?utf-8?B?UWgxQXBuQWhNSXIwekNRaWFJZzM0NmQ3Q25IQzA4WS8xbVJOWFU1SFRKZWZq?=
 =?utf-8?B?ODBHNUxjMVhHdXpqcWRWMjhxVUtVY0hvVjYzbHI2ZjltbzRJTFA2MTZoR1dq?=
 =?utf-8?B?MG9yTVU3SGdzbVZSMlNpbklPWklMUmlFdXZ2bTk2N3FoQVQxN3FKd3JUdVNr?=
 =?utf-8?Q?/T9H08I5oac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hPNHZCeGYvY3RIaE9vQndqSzZQbzRnNkpPeWxyaEpESTlNUkRhMi9UU2ow?=
 =?utf-8?B?NE9RanNhWmU4QjhPOGw3MnRmclNDZGYrQUpwdlEyYWFGcXFyZGl2VkVBUFFR?=
 =?utf-8?B?Y3JLV01JbExaWGEySEVtVVMwSHJIMFgxMCtoVEIzd1BMSXVmREJYUXRSRE1j?=
 =?utf-8?B?Ym1vL1ZrdUg0amhuckVJNk0yV1MvMDgwbGR4aTFCYldnSVZSUUFhSUtZUzA5?=
 =?utf-8?B?Mk0yMFJZc3M1ZnBxbVlhWVV0Q1Vvc3ZSbCtZUXlkQUJyYmRIOEZWTHIzN3Er?=
 =?utf-8?B?czVreXUycGxvK2Q5Z28yYTlTTTZ0T0JNUFY2ZVNra0ZLM2xNNFFRZzlmMFlx?=
 =?utf-8?B?RU5LUWJDNVlrK1ZZOUt2OWVVcHVKMDVrUW5Sbk9Nc3dUN3BWemNjR0lGYmlT?=
 =?utf-8?B?dFlwMnBFS2t6Y0RWUU81bVlEalB2YVc4WWlpTVFjUmxSKzNJZThyUExEOXd5?=
 =?utf-8?B?K1NHV3NLYWZSdjREM2QvSEFqRCtSSmdwL2VRZDFjSG12bmpFek9YNWNXVUJj?=
 =?utf-8?B?cHExbk8zbG9rSnQwaUwrMGdQR2pXeFYzRnZFOGp0Tk51eEYrVWNIWlhiVTFx?=
 =?utf-8?B?WmlFeTJIV0dKYWxyV3IvM2tMR3MveXk2UjN6Z0hjQTFBTmQweE1tNVE3d3hY?=
 =?utf-8?B?SllyTWtPRjFHTTNnTVhTbzNJamhCVURCY2oveDEzb0NNa0l3dXNDYjgrREh4?=
 =?utf-8?B?N1RvNUw0S0V1UE5FQVVmNmhKT2Q2KzR6bXhNeEd5WUdyVENvekZxS1BQT2lo?=
 =?utf-8?B?QUdGbmNmVUpLTDlkcE9pbUNVMjRyRDZ6emVUODhWM1F0TGgzNVN5QWgrU1lB?=
 =?utf-8?B?Y3RlcHk1R1FDa3E2Y2lxK3h6YmlXVkplMURJUk10RmxHV25kYklFZWhCYTZE?=
 =?utf-8?B?QitwYmNnR2QxeHh1NmZXTXkrL2hNQ255eVFtMjMrVDl4cVF4OVpRdnV4NHdB?=
 =?utf-8?B?a2FxclgwWEkwOW9Wb00zZnBQaWQ3WkdCR3BBdlBjY0VDemY3KzJOTHV2Y2dF?=
 =?utf-8?B?c2ZjNnlVNWpZZ0w2K2djbXVFT2J6OWthSjdqT1RzMFlVTEVSL1NhWXljekNJ?=
 =?utf-8?B?OWhZRktsWVhXN1F1NzBzZjVQdXB4eTBPNkV6YTIvYVpzbC9KOE8yS3FHcnhQ?=
 =?utf-8?B?ajFjNUxYVjVaL2pROGtra1YxdExwQXpXY3piOHoyOE9MU1VDQXdTM1E5d2tF?=
 =?utf-8?B?U0hHV1hEWE5Ca3FiZEF2aFhZb21kR3FNZjRhMEJKUkxSelVwdVZrQTk3T0Fw?=
 =?utf-8?B?OXNLdzZsSDZTazFJSUxXRnF5S2dWbTlVeG05MC91aUpINWJRU1NLdFZJNm12?=
 =?utf-8?B?R0hZVnJxWGNINEplRGRwNytGZW4xc0F6Ulk4ck5wc0w5c3ZCemNEMVFDTzlZ?=
 =?utf-8?B?K1ZDa0RBOG9BWjNoTnBGbnk1SDM4RnVEa2xzUjBoa0xrWVBJaDJ4RTMweGdP?=
 =?utf-8?B?bDVKNHJCRWQrT1NlZTFEQXhnbFd5aHJPMGg3Yk9iaXJrcktpRnBqKzBzL3M4?=
 =?utf-8?B?N2JUcy83YTNuZ0w2clhoZHRuM3Q2ODVIU2diY29VZktVSWRZUEpjdHNxMXJs?=
 =?utf-8?B?SEJwVlM2bmVtQ2pXekdMRHdYQ0w0M09vODlUR1BiSzFtTlFaeUpLcm1WKzhu?=
 =?utf-8?B?cUJIcVNnMzJXM01pUytqRUFQOEZXQ0J3b1VyU05XNDdYY2svalRqSVJmL2Vi?=
 =?utf-8?B?WGlaUjlaM2JOSGhQL25uNVNiaXVabHdLdktVb1JzRG1MMEtkZElVV0ZkdTVZ?=
 =?utf-8?B?WmZxT24xaHNoRnI4ZFZJOVJ5bkNnK0J3M0lRc0ptUlRNeG5Nb0hpTGMxUS9l?=
 =?utf-8?B?MFdCQ3laZzkyRktnTU1Fd21sdkxrMzZ2R3lJbytkSnY1L21XTURYVjQzaFBn?=
 =?utf-8?B?OXV5MjltSXM5dFhsME45RHJESDNtRTh4MmlzRXQ5aVpoMnc5Ulh3SlhBaFBB?=
 =?utf-8?B?ZGRaVkJ0T282SW9aTFlHRDU1MFBWTUMxcHViSVlsa3ZmMnJuWE9ZN0NmNHA5?=
 =?utf-8?B?V3MxMGVNRTBTeDJHdEV6bEhHNU5MaXg4VS9EZUxNT01jOGc4a25sbk92QllS?=
 =?utf-8?B?cmdvS1NTYkxlQnp6Sk4rMG4vdDFwcTZpczJnMnEzeFlyM01id0FXUzhOMWdi?=
 =?utf-8?Q?zI52qZIt7zTCNq4jVrs6o+RCP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b13c06b-93cf-4634-ce8f-08ddef600ce1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 05:16:37.2338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqHz1TArgaIpSgENZISqhQo/OuOcskn+5+eeO+bqtaI8nqSrGdNscMipQwtMVtmkj7JHwvlwjLKCc/uSMuEdcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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



On 9/4/2025 4:05 PM, Michal Wajdeczko wrote:
> This is a user controlled configfs attribute, we should not
> modify that outside the configfs attr.store() implementation.
> 
> Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>> ---
> v2: add Fixes tag (Lucas) and update the doc (Riana)
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 53c5af4b810c..7999cc5262a5 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -44,6 +44,8 @@
>    *
>    *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>    *
> + * It is the responsibility of the user to clear the mode once firmware flash is complete.
> + *
>    * Refer :ref:`xe_configfs` for more details on how to use configfs
>    *
>    * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
> @@ -180,7 +182,6 @@ static void xe_survivability_mode_fini(void *arg)
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct device *dev = &pdev->dev;
>   
> -	xe_configfs_clear_survivability_mode(pdev);
>   	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>   }
>   

