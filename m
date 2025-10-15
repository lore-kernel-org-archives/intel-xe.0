Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8847CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 19:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851E710E8CE;
	Wed, 15 Oct 2025 19:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ntl72pWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DB10E8CE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760557088; x=1792093088;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GnLLvb4SHtCtwSQ2z6E8xDfCdUfUxGNsIKUufJtyzhA=;
 b=Ntl72pWOP2O/DPhe5gCRbxqWP6/YnMrydUAQHr5pUyKxJMuWRguOvd4g
 DoSvtLTczutVrHdAFmiZ5wYakPIgjlD9jx9Ek3JIAsyJt7u7QmI/9fITR
 a6Hd0ovhMLLM51pEY+IbTpuxyo3S0++OGW61zhjKxOYJAL336lZpmJjrh
 c1gN+2njVsu8LP12o5f77uYloEMbc7BI8k0G6un4jcD+BaWV7ZKQQw1Qj
 ofhtxFv+zoHvMGMQszzbs+eLEqywtYLzI4JT8BxyINK9VVvqdAYl4asGp
 H+8/8siZr5d6rnqDVXKqVh5CJ6ZwG4JSYlEwxnXflDXKSCL9W0tROo+de A==;
X-CSE-ConnectionGUID: jsvdgct8TYedbvVEeyWBNw==
X-CSE-MsgGUID: CV4AeY1yQhmOIhVZPPVhFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73852870"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73852870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:38:08 -0700
X-CSE-ConnectionGUID: uAeUGSAFRymfObYC0Mjc2g==
X-CSE-MsgGUID: UP6QFAR/TCGqlhZ2+e36nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182045946"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 12:38:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:38:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 12:38:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvcVgMyXo/AIneW20vdxO1dRXOlKGSYdMDrntkLbHjUgmpqHXBkIE2UPoPWMEK8QLYFaQ2cU/jBAoGvj31sAsTMuHUrkbWiWMiCVy6Z3NUHhLPdPZ5MpW+hlQ+hAhTIQdQ8bjWBeD6NzyqaUyj8YGQ21z/7pF24gYBWr/E14P0qj7v0VJ5awkeOpjptf9vR2Ol4TKXtosl7y+G9z4e551ex2C3+vzuQAk3YpoTWPk2nseJRgZ6mhp/hVuFfKsnBSBN7k6XMWt5ovl1zPOqb8hoQB2g4c29ARckEnOPChEKR1EM0OUd9IGvSHYE3BPwoUORa3ngVg/GbGGj6RPpCN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XJO2xzagkMK7In8D9hlXZHT+TqzuNQ8eq8PHdICgjI=;
 b=bw2ut+o9NcaNUf4Gw77GJmyE9ELV/gAnjT1iJbRsE9aKwiGlp9jDElG69/C/sKqupxr4JMugUVJbtROxJUBdsbQWg+ZMUJDkJBnbVKINEC26mvMCAFfWIAasCss/+D/OijCrj1q7EiLoAHbnycJ3zuHwFZ+436k/42Oa0/aC5TntLquUPJUkroblWt+1wu40AYuyOmm8CJoSMgYrY2CE8H3xBGpMi5YI29C5SlpaodgJTuWdt/h/zimWCkTsIx/m9dsR+OvKdXd06N/SUiGUeNaUoji7A1X58VeHH3ThkBWKvGE0Nc7L3ytIo6ueeQaOOdC4A4gDTBwi69mBp6zoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 19:38:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 19:38:03 +0000
Message-ID: <95e908b4-f5eb-419c-84fa-3ee2f810c890@intel.com>
Date: Wed, 15 Oct 2025 21:37:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20251014211956.1607561-14-dev@lankhorst.se>
 <20251014211956.1607561-22-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014211956.1607561-22-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 277d090f-f51b-424a-9199-08de0c225b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm1ZYnlQa1lOSE9HVUhQSlVMQnM0eXE4OHN5c1d5WFk5Qmg2QjNWemR5di8x?=
 =?utf-8?B?YnRwUHJ3NjZkNkFsWnNJUjBDaXBsaFBScEJvQkxXYzJHYmx4em1pTEZOcDFO?=
 =?utf-8?B?KzVBdEZ3UTlWNFd3WWl6VllNaUVPVkpnaVZJcUxaK1pYcGFSQ2RRYzZ6cjNX?=
 =?utf-8?B?QlNrdG9yRUdvU3N3QjZDYVhESXpYdmxoM1p2dXhjbk5RQVN4QWR4cHdPMzFI?=
 =?utf-8?B?b24vM1pzZTBQMENzL3QvMi9vYU5kTG15MnpCWnB6Sm1iUzB3M0hDZFRLSWZ6?=
 =?utf-8?B?aXNiRy9ObjYrNG9VMjhYOTI1NWpDajk1Z2t5WkYvMkNKdmdLUUY0LzNnY3NE?=
 =?utf-8?B?VTg2Tkg4bElLT3RiKzRrdjc1ZVh2LzEzUlNocmQ1dGtMUDNUT3laQWMyUDlP?=
 =?utf-8?B?a1ZCMHZjT0dSRy83czlIMTBSdUJ6bDBSWDJqaGVFUUxjR2JITkJzbVRmaHJO?=
 =?utf-8?B?bmJXanR0Y0p4YlJoaHdJOW55aCtEaDlVUWRwb2ZnRE5QN2cxV1V4OEV1Y3hD?=
 =?utf-8?B?VnNYOTcwQjYrQzVaNldIcldISXRRQ25WZEgwanFwbmxmMDVvWnBRbGtMUzRM?=
 =?utf-8?B?Q3c2ZE4zakpDWUpnb1A4d3dGMW12d2s0QlAzK0hNRTFtMEM4Mk5WS1RtNmN4?=
 =?utf-8?B?c2JVK3RaMllJWmcwczBpOVVsNkNZdTY3UW1Jclc2OWQ5MHkrelRVNkhXSDlu?=
 =?utf-8?B?d3IwNDEzSE1nL21NTEFzZlc3NytFbmR3em9HblRHTGJ3VjFqOVZjSFFMdGxT?=
 =?utf-8?B?S3RyajA0ZFU4MHNlY05oR2hIZFFhY2I4cUh6RTJFM2IzOVNEM0pVMTFLZC9D?=
 =?utf-8?B?SjBZRnVLOGJ5N0JDN2s5empsMHlQdGwrQnRSYzF6Ui9HWHNRODFlU0J5N2xH?=
 =?utf-8?B?bHRYRDhISFJ1cGh3NmYwREFiWFNsUzFreG9VWHZ6M1lzRHlHc1E1MUVJV0ND?=
 =?utf-8?B?L29qTm1jaVpGNW5PM3pycG0yTW1sNjg0dThBMktvYk9HclRrd3IxdzJzSHU0?=
 =?utf-8?B?T3IrYWJ4RDJOUEc4cWFwVUNhcm9HYlIxdFZ0bGNyMzV1ZlBBOXYvWDBERUYx?=
 =?utf-8?B?bGp4ZXJSMzJrc1hQTk5nMVVoOHNMajZ0UjZxRFFVa0xuc2VUY0twQnhTOEQz?=
 =?utf-8?B?NW5KdmF1eTluQ2cxNGxCSXdRdWtqRlo5N1Vhd0NzMUl1a0E2Sng0Y1ROQzg1?=
 =?utf-8?B?bmdGTG4zb21lN3NUSUpuWFNYWXoySG05NjdHQVBaRHoyWTN5VjdCV2p1RXlP?=
 =?utf-8?B?RUY0d0N5ZXFuYkk4OTVUL0EyV0hiMnJISjlSN1BacWRxeGx4N3BMeTFTa2Nw?=
 =?utf-8?B?OU5pY2pLSkEvZk1lT3hLUFBLY2ZNV0hsWmdoVWVHRmpmdDF2YXZaUC9vUG02?=
 =?utf-8?B?ZXZXS0h4UGI3UjBkTEE2c3d5ejVGcFdXRlI5QUF4bjV5M0ZCRUtndUNUOWZp?=
 =?utf-8?B?N0J6YnhKNHNKb3ZyZDJ0MUVUeFVzaUw4ZDZyTTEycGVJLzJnWjN3SXQ5OEVG?=
 =?utf-8?B?dHEydzFxb000UkxqZHJBeXZqU2JOWCt3SnpqNU9QTEpBQyttRHR1MVlicW9o?=
 =?utf-8?B?ejQzZnBlZDlDM3BXV0t6enlZN0RaVzJFWUpXS09yUXdxelZsYUZmRDlCWU0r?=
 =?utf-8?B?YkRBUEdVZHJxaFZtdVZEN1ZjUnpUU3ArTkpySW1OVnBqYXJ4VWhuMitHL2Jj?=
 =?utf-8?B?eVJEN0o5TlZaZHp5Vmc5Qnh1YkE0MXptZzhHOHhhNWZvZGErNEx2bzNjTjZm?=
 =?utf-8?B?UkxqTERCNjNSUHRpbHd6Y01sV2tZZjVrWTQwTDRvMmpRUWJnd2FLTUhJMUk1?=
 =?utf-8?B?WFN4R0J2OUdRWStCRHZRRHlyLzVyeG8wTlhxdG9vL3JSTEt3Qzh0Rkl0NVM5?=
 =?utf-8?B?VVFCVFcycUJ5ZFZ3a0RlcmlraEUwOElhTCtBdWJZMzMzRGVtbXRpRXlRWW1x?=
 =?utf-8?Q?vLEGjNpoSir6iJdBT+UbntXqG1F3RuEk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdPV3d3UGp2LzRJeGQzdE9mSkV6ZGQ4WWxSWWZkWUEveFpNcUo4VDdKZHZV?=
 =?utf-8?B?SjJyQ0JwNDRLVmE4em1hcWg2bW10QlJxVTlWaTNyVHZIYzc0c0ozcmpDdVJ0?=
 =?utf-8?B?UG41YitnUjg1UjcwMm56WnFNeFFNYWNJbmpIcFh2dE5SWWNlZEQ1WTU1WDJl?=
 =?utf-8?B?enlubDdvaWN2RHVabmJOdDdteWpmYzBzYk5GTXp0SjAzT0JwZGZKVTZJTFp5?=
 =?utf-8?B?S0wzK3IwOGtlTTZESHM4VWxkNWZZeVFkUHREMjEweXhlNlNvT3ROOFZNTVI5?=
 =?utf-8?B?T3RUcXBpUzBTUC9ScjZNSUpOMGp3Uko2S25OYnUxeXRKQ2dGVHMrYnkvSWFz?=
 =?utf-8?B?Y0lOTVpySkNHMEZ3SWF3amJ6R3Y0OFgvclBQSlNMSzhOMG01MFdsbytpdWhX?=
 =?utf-8?B?THpiTTF0SGQybzNKL25ET29HYVVGemsremY0Y04yMWN0bWpxWmQzZjFBc1pl?=
 =?utf-8?B?c3ROQjRlWW9EaEVWMFkyaFZqdDFlVEFpUncrOXZCd0lPMVY5bkwxOW9pYjBi?=
 =?utf-8?B?cWlVOWpSN1JtcDlJdmpUZUlPLzcwZDFnM1daR213a2hHUC96NUJncVgrUkJZ?=
 =?utf-8?B?cFFGWE54VnBQcEdCa2E2c2hJOGw4bk1wck1FeXNjbDh1OVNzbTdnL01FWlhw?=
 =?utf-8?B?V3NLYVBOVElVWFVkN3gvM0JnM0JNVGpXeUVYZG1abjJ1RTJUSmd2anA3RnVw?=
 =?utf-8?B?bCtjdVE1WTRSSkdhUlNkR2FKQW9xOXp3dk41KzIvMkl4aWdQVFVJNjZUaENJ?=
 =?utf-8?B?VnQ2bVF5cnhGZndaM1Z0eXZKdi82dzhJZzRDKzRmcHd6ZGgzN2NIaXRsTjEx?=
 =?utf-8?B?Y01qK1ZyODcyRk5VRjJzaTNvN1VOUkQ2YmUwa2I1M0UyTnozbUEwK2RRZTIy?=
 =?utf-8?B?Y1QvTUpUZ2srZXBDRXJucjRKMGM5MlRZcHpoYWJreGF5Y3pnYkZ1dkU2Tk9G?=
 =?utf-8?B?YUlIQWpKU3NsdkUya1JwWHVxS1oyWVRLTEhTRGN5WVZPR2ZweEJCcUhsM21k?=
 =?utf-8?B?NDBmZFZLNDZrQ2l3ZmlGYTdiTm0vaDNVSHBhckdVTmlwcmJ0ZktLSkRJWVk2?=
 =?utf-8?B?SUxTY1YweC9xQzhPQkFkblByQVJzWGh1Rnp4eDd1TW93UHZwTVllMjFIblA1?=
 =?utf-8?B?VTRCdnV5Y3ZyOVJwaElmZllDRDJrZHZNMEdwcklOSFJvdmdGRHBoZFY1NWlq?=
 =?utf-8?B?b00xb085OTN6WkFwem9mcTh6RklCWmVQUkh4L2J6K1BoU2NNaGZXWmllKzBs?=
 =?utf-8?B?a2VxWW5PeWVmVENvTnN1bUszY283Y3Y0SmdPU1BHZVRIeHZlMy9wVjJqZXU2?=
 =?utf-8?B?TjRtTVBwT0Jvb0F6YlNUTXl6djhZUFRxZkRyRnZzMVp6OVZ1ck5iR2RLRXU5?=
 =?utf-8?B?cmZxeTdyLzZIUVZDQTdrcTQzYzFvZVRGWE9sa0xsV2c2T2hkaG9FOW9TNzQx?=
 =?utf-8?B?NGl4WGNxVzhOR0JFUTZMWG55T05FT2doM09NOE9uK211dnEzRlFhNjg2ekps?=
 =?utf-8?B?RmpyWmM4NnZzbWNkMURyL0VJdExCeUd6c3VEWmNNV0o4SW9NQUtqRS9vWFRO?=
 =?utf-8?B?Vy9zeHdSK3ptaUd4VnBiS1JiMlRvWmVMb0NGRjdwa2NmWjE0OWpnUnRubDIz?=
 =?utf-8?B?QmsrL2xxdlJlZTltcllIaHpQaXhyNEM3K0pydkYrOHZxZjl1Q3JRWmFaUzJ0?=
 =?utf-8?B?QUZ6YTFmWEphRlp4K0U3cllPN09SSk5BUWc4b2VubXBMeWNIODZiclRPQnVx?=
 =?utf-8?B?cmtxUFhKTGFjcEw2eHFPZkRscHN2amJOQXkwOWpEQzBlR0Jib0ZvYmR0K1lj?=
 =?utf-8?B?S29lMXRtdW1ybEdXK1VDZEpDMjIwSysvWFZPZ0N6eEN6U3NLZnlvL1hZYkNM?=
 =?utf-8?B?RW5JNHcvR0hFT1JIV1lZc1A3VTRDY2RkRzY2bmsxM1cyVzVsbzdYQWhCWTZT?=
 =?utf-8?B?MFRQRFgxc3l2ZFZQQjJDcFBENE5XVE9BbDF5MTNQdW8rL2hXMHFHb1BEcFVM?=
 =?utf-8?B?dElNN2ExSllIUUd4OENCbkFCRnMyai94SklEbTVXUVlHUUxJQm1PNlkyeVFu?=
 =?utf-8?B?MVFtZE1rdnFLaERRQ3c5bm9uM1pXSExaQkkxUG83YUhVR3ZuUmR5UTkvVEZa?=
 =?utf-8?B?MjNoYXgzNEtjWXF4MXhtTHV2WDZDVE5vR2wyOGh6K2dqUzlWNDkwbmI1WUpL?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 277d090f-f51b-424a-9199-08de0c225b04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:38:03.0967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSaDIlrGrazgCxKTZAFL2c1DB11TRlXDsRJJLIzlEaXOZO4j9ADxpnbd4pvsKtOlWaKWc3mtGrt6GW5YHcJJAGo72QZvXSqgN4AfyBtkdys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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



On 10/14/2025 11:20 PM, Maarten Lankhorst wrote:
> This will make node shifting in the next commit a one-liner.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index d73ed0103f50f..97ab38392c711 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -276,7 +276,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	ggtt->start = start;
>  	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, start, size);
> +	drm_mm_init(&ggtt->mm, 0, size - start);

that's little confusing

either "size" param should be named "end" or this should be just

	drm_mm_init(&ggtt->mm, 0, size);

or am I reading this wrong?

>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> @@ -375,7 +375,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> -		xe_ggtt_clear(ggtt, start, end - start);
> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);

since xe_ggtt_clear is static/private then maybe "ggtt->start" shift can be done there?

>  
>  	xe_ggtt_invalidate(ggtt);
>  	mutex_unlock(&ggtt->lock);
> @@ -392,7 +392,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);
>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
>  	mutex_unlock(&ggtt->lock);
> @@ -548,13 +548,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  	lockdep_assert_held(&ggtt->lock);
>  
>  	node->base.color = 0;
> -	node->base.start = start;
> +	node->base.start = start - ggtt->start;
>  	node->base.size = end - start;
>  
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  
>  	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> +			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
>  		return err;
>  
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> @@ -731,7 +731,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  	if (XE_WARN_ON(!node))
>  		return;
>  
> -	start = node->base.start;
> +	start = xe_ggtt_node_addr(node);
>  	end = start + xe_bo_size(bo);
>  
>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> @@ -852,6 +852,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> +	if (start >= ggtt->start)
> +		start -= ggtt->start;
> +	else
> +		start = 0;
> +
> +	end -= ggtt->start;
> +
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>  	if (err) {
> @@ -1093,5 +1100,5 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start;
> +	return node->base.start + READ_ONCE(node->ggtt->start);
>  }

