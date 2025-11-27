Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE4CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3404A10E834;
	Thu, 27 Nov 2025 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4XR1GcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8510E82C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764262955; x=1795798955;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IsH9fvaCpk4VMgzBQBPqzg4SRGEeroTJ1AevUpJ4Ipw=;
 b=B4XR1GcSjNwn83gWn9KqyQ4+yAnBkvK+aBye3lV7c679ci7dAqh+hbhy
 ra7g1NKzrxWjnSQL/u4NIiTes3v3XemIiN3E8rVtL8klHQfYmFwKJin/B
 7PJursj4Amb4i+R/YOgNI3vjqnCbz6ZL2gyUSAvgEJg/BFJI5YGixAefu
 AFPukhjAE0Lxtw//cTVaAOefs2B5rTXCTcZlpNwcpicnMZy6Lm/uh5XA5
 XcTz3upl2A3GPzQ+3Xw+6+cIQPtDO4iUbxt6YAIoc3HkobL4rwu2gNniw
 ZJ0JTvmi+qZhchXPptt41SgrYp+aDEC2AXe5R0UiUEuRIpHCbrdMcfUmM g==;
X-CSE-ConnectionGUID: VbWG690VTdeFpeX17QjLTA==
X-CSE-MsgGUID: j1g73ysoSn2XKocdthxqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66200655"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66200655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:02:35 -0800
X-CSE-ConnectionGUID: iUA1W0zeRZmlZW21l4cvHA==
X-CSE-MsgGUID: exqR++GjRMeESAvwgq9Ngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197445132"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:02:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:02:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 09:02:34 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:02:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4r2bSWBv6bFNOg2WQrbP4dqu2Imf6S3B//8wCrq3x++eIeOEhIhQHtXl7Bw+TcUTav5PIkLlcstmZ+tzTpsSmiFJjRku5l/XBPwPukxThCXUBMdX3thaRcTLNWOXF1VOAiJzTN+Y3yYH2Q3U+chcvaF+ZpAmPXhiXijaFYbu3gX83zIMNeC5lpvMavx7LBQ9dDH54hLKLGHxNIQTOSOxZRmhDubzqKJ2PXtZj40fzgLKGqi1NeainZM8H3ANJfgdCDcsV++FsH4k8rpd1wy6J9883vLQ9ZhAqzOvzyfAW8JeAoAEEVQ4ZzZrWmWK4FNrHI+zS0HTG1sJKpF1t/nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDon8uT4Xi/rADlOuPKIoWzvq3WyYl/MQ9T3CiCHuh0=;
 b=XC6OEM716fA6Rp7ew1OExj2yVXdoknWictfRIWDT2MqScpJCmQbDESJAjzSHH7LY6aKKHd5aU6BiwFIIlkMRInLr396pbXVlxvkv3sNKSHk1tdrVafrHzs7QNqjhhJfG9CCKziqn8GctjRPzIIaHTX9b0GIgyKwcIeo1SeCvtVBjFlfxo4nVpScE0ELTQ0s3180aoPChivvw9AVwF2Xz4qECShZTAzoXhD9RBBc/jX3R2j/KpkW8rDY+A6g2SNlTdNL0UZlmVEbCT5mWJuyBmOoxOKvEtJz3x6YAO/KSs7Cf+RyO87ZHJGwT8HpCpQlAcqtLV/SM1UvYQV6eRni53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 17:02:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:02:32 +0000
Message-ID: <31937cf5-be8b-43fd-bf81-1fe813dbe52d@intel.com>
Date: Thu, 27 Nov 2025 18:02:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [V8 PATCH] drm/xe: Mutual exclusivity between CCS-mode and PF
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251125165749.2616038-2-naresh.kumar.g@intel.com>
 <20251127161012.2751207-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127161012.2751207-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f2c5b0-6807-46af-6f47-08de2dd6c114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzVvMTYvU3lrMUlMZGRrc2NDODlNZ1RSNGJSTEdBamhlMkJUeSt0U0FwV01M?=
 =?utf-8?B?QkpTQ2RzdFl2TldrR1B2T1ZrYm1DUXQraTFWYS8zSmZMazYzeWVYaXVJRTlB?=
 =?utf-8?B?Zitqc0xEQ1VCSENkTERqdFNwUDVnSGNTM29aV0tBbUpNWDR6cjQvUkx1eStP?=
 =?utf-8?B?ZjRzOFBZVndjUmRsemdXMm4rSVFVdkh3eDNHbDFDRlBERkoydTdjUUJnMlox?=
 =?utf-8?B?V0Y3TWNObHdaL2pnNkkyblZDR1NuMEU3WXJySVlqNTF4NGUzT0dTVVlUZWxX?=
 =?utf-8?B?WmhhWDBleTlPL0FQSitNWEZuN3lrSlcxMTAvdlU5ODhWMFZuVkJaNjB4OGE5?=
 =?utf-8?B?NGhkUGd0dzRQYzZEVVhXaWpSQ3VGanA0RDB0eXNhUDBxOStjMml0MncrYzdD?=
 =?utf-8?B?UFNBTFhYSHRVR3lwcnhRbDBUV212ZmRTdldlMmxvMm1jeWoxcGtyVFYyU1JY?=
 =?utf-8?B?UXFCS1BMaFlYVVJib0ozU29LQWxiSW1WSFNvUHpaZDgySkFmUHVuckhGQ0Jh?=
 =?utf-8?B?Qmg1QXJOZVF5L2RjSmNFM2dIRWVLVzl1T2puYjY4MHJUQlFacnJEQ2d4RXFx?=
 =?utf-8?B?YXQ3Nm1SbHBXYWtWc21vVE1icnh2VVpqcHhNODE0eEhycG41QnVIYXQvOXE1?=
 =?utf-8?B?VnhtZWduUHMvaTdhUm0xUGhMejdKdHRXQVB5Q05tSWRSK0wvUnAvQ2VVK21Y?=
 =?utf-8?B?Qkt0ZCtseWxzRjl2VjNvK0FMWXh0cUF6bERxOTczVlpvU1V1NGtkUm03b2tW?=
 =?utf-8?B?NFlXTDBrTDk4emVnTnh3RCs3Yi90OG8yOEVaalBFcUZmdzd5cTJUNC9tS0RH?=
 =?utf-8?B?RGJPL3FvZ1JRVXg1UHFrTW1ldHdVc0VwMFpzNDlOMldrL1IrKzVLbTFSQklG?=
 =?utf-8?B?aFpwYStGd0g0NzBQSWdrUE4wbTI5cGdpYmd1SUw1VnpFWjlHL0hQY1RFVm9R?=
 =?utf-8?B?dEJybFViaFl0Skh2ZE84TWNLK1o2VHE2ZWpIZjliZFhDZGNkb3NEUzlzSlpk?=
 =?utf-8?B?WXZ2S0dhMDZ5MUZnaHBRbHJnOFloLzRIcklBbFZlMlQ3Ukl0SnRjRG1kbWhP?=
 =?utf-8?B?eDA2RTdxb095alBvMTJ6YTFHSjlVZGI0dTB5RXFOQU5HU3hXV1Y3aFJuMlYx?=
 =?utf-8?B?RVF1dDJ4T0pWZkJLVkJ0Si91TEVFOVJJSTM0U3VrcHNwdER2b1hUY3o5amoy?=
 =?utf-8?B?d0d0bnJ0OGF5QXRYalFmRnowT29EQS9vM3J5M0JqaVFDWWxZMTFteWh2UHlU?=
 =?utf-8?B?N3AvbzZkOHM5bUJhZ3dXaEI1MGdRWDBTWlZJdE11b0x0MTlYcnJRMVJqMmNk?=
 =?utf-8?B?Wlo0K3k4QWRxK0xXK1hIZGF0cDNhWm9xRktVQUEzTjk4VGt5ZVQrdFErcXFz?=
 =?utf-8?B?UU51c0lYMC9qajB4NWNCS25PeGZKOEJtUWRQbUNNa1BPTXgvaE41T0JNUlI0?=
 =?utf-8?B?YkdQNXREM1BuVVRtdnA2S0J1dnlScEtGNzBSTkZFNElZM3dOeWUyVGtlZVZm?=
 =?utf-8?B?NytnT3ROQjJNaE5EVHJnaENJZXRCYjhGTVRQRUdFeUhEN3A1OVpnM29tZE83?=
 =?utf-8?B?RndQVVEva2dkeWx6aVUzdUVtNU1tWWgreFBtRXM2NzltNVlIeFNpbHJvUVI5?=
 =?utf-8?B?MDZJOXM2KzRNWGlkRjBlWlcxdGFXOEdqaEQ1Wlh3dlJGWGtnV2VmZWFycUZk?=
 =?utf-8?B?ZFU2cis1VXZVMm1aeUl0b3I2cXZhU0IyQ3Y1WHZOOHdhMVh2T3RLd2tZYlhC?=
 =?utf-8?B?MkRXTlhYSi9UUTFZdGNlbzJQQnRIN3lFQitSUmRJbXBscVRVajJqSjdVdE1E?=
 =?utf-8?B?TUpLdFNiMWVDQzE5M2RkZnNFYzVaM2JWanAwNFVQc1kzN0xIcmhSZkxFTmNK?=
 =?utf-8?B?SE5oM2pNNFNXUGxML0JDMll3M3N3TC8rTUxGbDczZVNUZHFocElhOGwvaFNP?=
 =?utf-8?Q?ZQpeTQkLSvZyAiUlmtWbWqTxx4btmxLc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRtdTFXRCtlYkhxRzEvbTJiZ1VEKys3WGZKK0pET2tBMDVtL3JGVHBXRDJo?=
 =?utf-8?B?MmVRREl6K0Y3WDhFdFZVRFdjQ2t3Tkp2RTlYSTBESGhwN2tqYWFEWGx1Z1h1?=
 =?utf-8?B?aS9JWGlBSjBlbEx4aXNnMEZWZWRSeHN5Z0c0NmVFZHBidXQyNFFRS2Ryc2pJ?=
 =?utf-8?B?MlM3bllVMVMxblNZdFRJOXNPSFhFaHBuQyt4c0g3K0E3MkU1eTEzUkZoU0d5?=
 =?utf-8?B?YnB2eHk0ajhKV000NERpUmx6TVcrQSsybWgxanNsYVlHb3lKMjgwWWlFZ0sx?=
 =?utf-8?B?MXBveis3WW1mZm4zRmNrU1lVYVBNQzUrc29XRDJybHlrWmJhMElwa2EzMU94?=
 =?utf-8?B?Y3FQaW1LT0RudUZnczQxeDNseWF1WC91UHZpa3BKUzg5cE9KclpoUTJqb01j?=
 =?utf-8?B?OWJkNHgzZllMNmMwNjFPZFYxNUVlQVlNb21yYWpTbFpYMzg3ZGFIMnVpZmZx?=
 =?utf-8?B?TGJHdjk1enJKRE16V0RWUXlqYWdKTWhhOGlPaThCd1JBdllpaXZxSjFHdGp3?=
 =?utf-8?B?ZmpxcmFLd2x3YXNzRzRTWGkwNUYvZjZjYXMzL0tOZHBOUzFzU21ZU0pyNHI5?=
 =?utf-8?B?Nm9SWHROVmJLSEVwZ0hSTnRLSi9CV3I4SzVlczkrMjA0STkybjJ4WERDTGdJ?=
 =?utf-8?B?M2lqR3hVT2NkVUI2cGxqTGVlWWFKb3dlMVR1aXdFRDVhYzh2dmlFVituZVJ2?=
 =?utf-8?B?ZEJ2aGxlakJlUU84K1NlU3VGdE85QUxlb0kva3ZlZXJZa05CYjNSbW5mbnVW?=
 =?utf-8?B?Smh5VHM1U215ZzZDVVVIMkZEOWs1M1hOaSs2T3lUdUhMNEZmQlVrV0xKZEVG?=
 =?utf-8?B?SHdiVXZYQTdKWXZiVWpBdWJLNnZ1TmlncWlrYWZUMjBOL3JXN2Q4QmI5STVX?=
 =?utf-8?B?STlNVi96SXkzUWJ1RkVLaEloMHNtazF0RXMwYmlhSDJHdlhSMEJUdTJZd1Zt?=
 =?utf-8?B?WjhtVU5xMzFIWm1PYWdiNGY2STZiTVFzVGUyY1hZN3FGcU5CNktLQ29qczY1?=
 =?utf-8?B?U2xTbUtTUnlrM29iOFhZYk5zMjBKdHdPd3JlcFJkTUNsYzVUUlN6T04yYm02?=
 =?utf-8?B?WHc2R1Z2andNbFU0NG5acXhXS0tQOGZ2L3RXV1g2MDhWcHRURnUzZVU3ZW91?=
 =?utf-8?B?L1hTT1ZmM2JkSFRiVjF0VGJVWlpQL0RZclpsWHREbTVDV0RtOGwrM0k1eGJY?=
 =?utf-8?B?enVrbGppY1hCUnFZb28raXJTT1FONTNEM2FUZ1ZMUWVaQm9IR0pMN0lKczhq?=
 =?utf-8?B?b3RHZkY5NVZ1UGEvdVllTnhnK2lncWdSdGM3cEY3ZlZRRHZNelpOWFVpYlBT?=
 =?utf-8?B?cE9xNGVSclM3RFUrWHhUOXJGYzFhMk5jWklraWhmUXlLVlUxeWRpc1d5WEx3?=
 =?utf-8?B?UnlqVFBDcytKank1WTVpRG5zd3Avb0dQam43VTM5M1Jsbmx1bHZtS3pTRm5G?=
 =?utf-8?B?a011TVF5NGp4dThiVE50U29XUjdhTTBhR0d1cnVwZU5hcmQrRmlmTHk1MVFW?=
 =?utf-8?B?djNEek4yRzVkak5UYWZ0NjF1MmtaTFV3ZTZEdVF2ME9pVDYrQWFVSTA5azd4?=
 =?utf-8?B?S3A4S0pNZDh3RTVqWkY5Nk1tNUV1OWJsMXRESFE0cVp3YVJEU1JRMDYvMFNT?=
 =?utf-8?B?QjNHTzVZWm1yYW0rR3pDd1RwVzJSUFpSd2dWd3gvT0VoRGNHSUtPanNxRmQ4?=
 =?utf-8?B?SjFJM1preGJQaG1EOXJyLzhSVzkvSitGc0I5SzZ1U3Boc3BpZnRSMSt5c2RO?=
 =?utf-8?B?MkQyL2NlVC9FaEtEUkdjUVZBdFc4alUxcVJuT1pyRFBRU2FjYTRMWDF2dm1v?=
 =?utf-8?B?RVpGLzc3MmtDS2poMEpmOWRHUGorMDhXcE5halNQU0xqUmpBSjd0eEhXaFJq?=
 =?utf-8?B?ZDJiMC9sMlNVVGlXamhhZXVkZngrMS9OV0QxbTBPdWptdER5UGFDTE4xSm8r?=
 =?utf-8?B?VEdReDJyVGpXU2NOYXVmRGdDR0dDUE9ZNzF2Nyszc2JaU2dsaTNKNkZCSHFF?=
 =?utf-8?B?QVpsMXpyeFVhWVM4MGFGejFCSTdzeUcrYSsxSCt5QkxhVTlTZ1g4aGZTaVdQ?=
 =?utf-8?B?YTI2ZjhZdjhROEh1T0lQN3YyZDl4bjZ6Vk5tbHdTVEpGWThxTkp6SThqekpu?=
 =?utf-8?B?ZzNUN2M0WWIzTnkrbVc4OVhvODBEZHZVNGtZOXQ2engzMWF3Z2F1M05nanEz?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f2c5b0-6807-46af-6f47-08de2dd6c114
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:02:31.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUzHdLiH5AW50wGgT2rJ8rIrhXlSsVPQEu2g6J6Ikvyg9xk4kK84U01fwBBE1JYbWAgKh45zy9OnPK1LGksUhGQLMg0nSVFSrQFMrmfr4io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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



On 11/27/2025 5:10 PM, Nareshkumar Gollakoti wrote:
> Due to SLA agreement between PF and VFs,the alternate CCS-mode
> cannot be changed when VFs are already enabled.
> Similarly, enabling VFs is not permitted when the alternate
> CCS-mode is active. Additionally, the sysfs entry for
> CCS-mode is not created for SR-IOV VF mode.
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
> v2:
> - function xe_device_is_vf_enabled has been refactored to
>   xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
> - The code now distinctly checks for SR-IOV VF mode and
>   SR-IOV PF with VFs enabled.
> - Log messages have been updated to explicitly state the current mode.
> - The function xe_multi_ccs_mode_enabled is moved to xe_device.h
> 
> v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled
> 
> v4:
> - sysfs interface for CCS mode is not initialized
>   when operating in SRIOV VF Mode.
> - xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
>   enablement.
> - remove unnecessary comments as flow is self explanatory.
> 
> v5:(review comments from Michal)
> - Add xe device level CCS mode block with mutex lock and CCS mode state
> - necessesary functions to manage ccs mode state to provide strict mutual
>   exclusive support b/w CCS mode & SRIOV VF enabling
> 
> v6:
> - Re modeled implementation based on lockdown the PF using custom guard
>   supported functions by Michal
> 
> v7:
> - Corrected patch style as message written as subject
> - Used public PF lockdown functions instead internal funcions(Michal)
> - Creating CCS Mode entries only on PF Mode
> 
> v8:(Michal)
> - updated short subject and few comments
> - used guard for mutex
> - Add a check of PF Mode to ensure use of xe_sriov_pf_lockdown only in
>   PF Mode
> - Added default CCS mode check to xe_gt_ccs_mode_default(gt) function
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 57 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h |  1 +
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 50fffc9ebf62..957ae6586b9d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  {
> @@ -108,6 +109,45 @@ ccs_mode_show(struct device *kdev,
>  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>  }
>  
> +bool xe_gt_ccs_mode_default(struct xe_gt *gt)

do you plan to use this function beyond this .c file?
if not, then make it static (and drop xe_ prefix)
if yes, then add proper kernel-doc

> +{
> +	return gt->ccs_mode == 1;
> +}
> +
> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/*
> +	 * Ensure the system is operating in PF Mode before invoking
> +	 * the xe_sriov_pf_lockdown function.
> +	 * if not in PF Mode,return 0,as its Non-SRIOV Mode

usually we don't comment obvious code

> +	 */
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;
> +
> +	/*
> +	 * We can't change CCS-mode when VFs are already enabled
> +	 * and we must prevent enabling VFs when alternate
> +	 * CCS-mode is active
> +	 */
> +	if (xe_gt_ccs_mode_default(gt))
> +		return xe_sriov_pf_lockdown(xe);
> +
> +	return 0;
> +}
> +
> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (IS_SRIOV_PF(xe)) {
> +		/* Allow enabling VFs, if CCS-mode changed to default mode */
> +		if (xe_gt_ccs_mode_default(gt))
> +			xe_sriov_pf_end_lockdown(xe);
> +	}
> +}
> +
>  static ssize_t
>  ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	       const char *buff, size_t count)
> @@ -117,12 +157,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> -	if (IS_SRIOV(xe)) {
> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = kstrtou32(buff, 0, &num_engines);
>  	if (ret)
>  		return ret;
> @@ -139,13 +173,16 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	}
>  
>  	/* CCS mode can only be updated when there are no drm clients */
> -	mutex_lock(&xe->drm.filelist_mutex);
> +	guard(mutex)(&xe->drm.filelist_mutex);
>  	if (!list_empty(&xe->drm.filelist)) {
> -		mutex_unlock(&xe->drm.filelist_mutex);
>  		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>  		return -EBUSY;
>  	}
>  
> +	ret = gt_prepare_ccs_mode_enabling(gt);
> +	if (ret)
> +		return ret;
> +
>  	if (gt->ccs_mode != num_engines) {
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode = num_engines;
> @@ -153,7 +190,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_reset(gt);
>  	}
>  
> -	mutex_unlock(&xe->drm.filelist_mutex);
> +	gt_finish_ccs_mode_enabling(gt);
>  
>  	return count;
>  }
> @@ -191,7 +228,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	if (!xe_gt_ccs_mode_enabled(gt))
> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> index f8779852cf0d..224bd553e9dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
> @@ -13,6 +13,7 @@
>  
>  void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>  int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
> +bool xe_gt_ccs_mode_default(struct xe_gt *gt);
>  
>  static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>  {

