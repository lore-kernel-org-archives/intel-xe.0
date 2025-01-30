Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794D5C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 13:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112C10E960;
	Thu, 30 Jan 2025 13:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZFvCY4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDAF10E34B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738243252; x=1769779252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DHygKcJdesm74UwZt0Lz0l0hDYiNAjbCZVtwtY0npys=;
 b=CZFvCY4w3GhkC3syQQMcFcdFMzSWnOTgtcZwZgXsB2g4Q2O+H9GjOp1K
 EhCMZ4GwcSYc+1ovhqX8zBsXJIKrb1vX1xji2YUAZPjeTiC+T5Ls+xDrL
 E/ESntPWo+UHa20DP7lDDlk2iTpk856rZkDLNJ143oO6ZseKEjmIFklDT
 cQYP+KmHwQNJj4S1iyWbJkVK4CtpvJKpARgtrP9jk4m71ucXAshbdt/MM
 rtEHjXty1k+FkQb27m6sEO9GfFMPvxZcQLNkj6a7+F6TAnr+68743OS8N
 f6cZM/4kqHWyOjEEiN6+UnB1m2yvNp/9dwlBQTix0zm3oYBz21AsJHF9H w==;
X-CSE-ConnectionGUID: tG9Plaj+SX6GE66kTqzszA==
X-CSE-MsgGUID: +BM3NJ0uSEmdMp1qCeB1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61256928"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="61256928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 05:20:51 -0800
X-CSE-ConnectionGUID: UcenCFSeT22I1KuheI9n5Q==
X-CSE-MsgGUID: 2eDHkafPTlSosTD6V2/AEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113329162"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 05:20:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 05:20:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 05:20:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 05:20:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGT6ksoBTSPlWLG9ZdT+SuqoiPr1CwF7miNiwQ6dAPpb949qWTDpivW4usybqdNARUpDZdtDwy1v1k0y4f0pq/jEHavCkU2EiUdbmsAl6gAS2gtktygoIM0xBbbw9Jpp/THrLWabsPoyKBKHXucwdCQK1u0+FuZjwH6Eq/wgxSlyk6OD/LvJu7U0thXJs6y/7bXYKYJjGaxpO1EcNkAeBXNmT9wk2Z6DaoDQpcWa/nqJ4ef9oxjXs9FcqNWWaEJS/Wg3na502PcnV+7NrHjz26UtfCB4oavnuCfg6tygnQ1QZD03/3SN/iOM0jqvVVkAGDzzPwR98tcZQs6VvZAlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6vK4dp00/VVKYxWBJAd/nMNjqDBBH1S4ypHj+kdzqM=;
 b=O9JvbL242REODhz13liGh6p6Sm74MO3ROyF0TYJ6wY7VXvmLXe+3BbdpJjB2hzoeI9x7MTmOnFlsuj5IEEWBuzJHCd11grYCAET+WjL52lcwdD3YCCb0G2Gc/jyUp3eRH6+bC0tHd7GS96XUbAkQUTaZ4kTg59Fz3SxkeK3Y8krgbjP54LwQNguqLfcy4CRIsXkh0Q2GnL2ZeVgziEBS52puVvNMH58ydUTf62K4fkBvSs+zo+tzzHQEoGo8Eralbd7gyBsAELtauVH/iIfps3E20Z4HtRV6VPGZScmWaq9OECBwD9YkZgnsL0RwXlnrlpUQ0vkMaOQ3mMeprPbIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Thu, 30 Jan 2025 13:20:07 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8398.020; Thu, 30 Jan 2025
 13:20:07 +0000
Date: Thu, 30 Jan 2025 14:20:03 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Reset GuC VF config when unprovisioning
 critical resource
Message-ID: <2rxhlmc3nsobs2oy7kinybmo3v2fw6np2ghvvohha67htb6hzl@g6kp6ex3bwe3>
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
 <20250129195947.764-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129195947.764-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 466724eb-00e1-42ff-f6b8-08dd4130d084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDZ4R1lwTHUvYnBVdURlU041SEZNR1dWR0t0N0RBSW5LUXpQa2ZBZDU2NW1K?=
 =?utf-8?B?V0ZyNG85aGF0VGlKVDRyY1FKVlZZVkhiVFhYVmFjTG9nTU9Fcml2RlNIdU8w?=
 =?utf-8?B?eG1VZ1VtTnN3WHc2SFNlQVhvQktCdVJYMWhOK3lzbkI4Z1BKY0cwZTUvZXR0?=
 =?utf-8?B?RHhjNnkzWUZlaE5LSDY4bVg0czFRMzdBa2hnUmdsRDlFeG8yWlJoV3ZQUGc2?=
 =?utf-8?B?YmtBZUdlZSs4WEEvem14SnNNakpGeHM0NmJsTk56bkFvZGJjK24xZkRVV2NN?=
 =?utf-8?B?ZTltYTZWOEJkUjRRRVArZWQvUzVpZ2tlOExnRXZOZ2dIdVZMZEZrMnNwQVMy?=
 =?utf-8?B?aCthVjZGQWp3TExrcVNFV0Y3b2xhV21PYWFPdWVaZVFrd25uM1NKVFAvOWlt?=
 =?utf-8?B?QklDdVZtdHFvOVh6TS9XUnFpVnIvamNKbmxTTUViekc0eXFoWkFaUGF2RU5T?=
 =?utf-8?B?ZEVJcWVQekhGWHBMOEUreDNXc3dEeHo5MUt1WUJRUzFYdzlJelc0Q2pIeU9j?=
 =?utf-8?B?UTdiZEVBZGhjSVRoQmZZSDYvYlVob0FXS2N6OFVWeDNCOEJWZkNmdDFxK09s?=
 =?utf-8?B?bzl3ei9ZVE9PUWh4K3g0RzZVb05uelIzLzZDNmhDa2hXVG9kMnVlajdyS0xJ?=
 =?utf-8?B?OWk3SkxpSWhZTnlGNk8wcDVxUHR0UXpYeWoxVlBnQ3RmRTBKdUlmQjVpWTZ5?=
 =?utf-8?B?RTcyOFJOT0V2RzRhbVVVZkhiZzl1V2FDYVNhVVo3WFJmbXcva05MMHRLMzFS?=
 =?utf-8?B?NWhSUkZIRUg4Vk4ydGF3QlZWaWtzVWErdlRURlhlZTJ6VHd5VW93amJWQXVW?=
 =?utf-8?B?T1FTeWlZVC9YV2JHcWNpN1dVVGFWMzhoczgyTjB6OHB3T3BQcVVZOGUvNk93?=
 =?utf-8?B?VThlNHNtcGRIQlUzakEzMnp2cWJSVWxQWGJ5bUN6NlY4WC83WnhkdWxXbGFR?=
 =?utf-8?B?UW5RUmI1SVAxeGsxcmF5OFhSU0ZGZ1RGbXZNQU9zT3FST09NMTl6d05DVG1F?=
 =?utf-8?B?VHZFM0w0R01selpOY0hvYjdlZXpXZ0h0K1FLK2lGdm9YTWtIY0Y5MUhweHpo?=
 =?utf-8?B?VEFEUUM2Q2pTMUR0azhPYzVVZVBZNElsd09oOFRYc1pITVVnUlJ2WDd0LzFX?=
 =?utf-8?B?c0ZMZWRhR2hTazJqR0tXVXhVQ1gzZmxtNTUxejhiOHZia0tydEk2TXpaaDNh?=
 =?utf-8?B?RXBwZTY5SXZJYTEwWWl0M0ppL2RuZ29hajdvdjJIdVpOOWhkajlFQk9FcU1G?=
 =?utf-8?B?V0pocjEwRjBtc1BIOEwxRnp0WktFNWI3bTRwV1dpVjJGS1ZJdUVjM2toT0hF?=
 =?utf-8?B?Y1hvVUl2WC9FMnMxNURMWlRlZW5EZG15Q2U3QWNsT2xPWk1aakRmRDhpd2RC?=
 =?utf-8?B?ZXBsL0VUclI3Y21KcHdFRnFiRzZiT3JLMmhjMVA3MHFyTXJ6U0ZPZGtCS1dq?=
 =?utf-8?B?elRUWUJiWk5aTm53WFY5RGhNdk5iMk5XTXV4S2s5YzhTYWhURVB3YXYrN0hw?=
 =?utf-8?B?L2dlVEFjVVc0b2M4R2wzRk1Kc2d1ZW5YRm9pNUp4b1FBSWxORXhSNWhzNlpw?=
 =?utf-8?B?VTFKSlVlY0RSWU5PK3NmYmthK0RUelVTSGlHaE5OWGhHRmtFeEpCbEtvdkNm?=
 =?utf-8?B?WlBJU2tyVCtnUUJLM0pxaVNsWnl0SUN1WERTcm96MkRVRUpvbWlDTlNBenMy?=
 =?utf-8?B?N1p5em9Dek9nbktpaUdtYlAvd1JYN3NmTndjdW0vN2xQOTE4eUY1ZnJKTXE4?=
 =?utf-8?B?azl6cGNSS0VvaEZRdlYrVG81Um93R3cxaks4QzhpSGx4TjBOMUt6SnQxQzU0?=
 =?utf-8?B?TWRBaFhqeFZmaEpEWDhTU1ZNRXZYZ05TSXZRSlExYmsrZEtza3ZBZjVZa09Q?=
 =?utf-8?Q?X1SMxf2drubGa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhlWXVDRkQ4WG01Y0ViTWl6REpadXkxS0dQNzgxSzBqY1JLSVNlZVNheW9r?=
 =?utf-8?B?OTNySWQ3RlVOVWZTY2lNZlJkMjJLbkRwcjFwOGNmRlhYTWNKdzVuNEVTMVE3?=
 =?utf-8?B?cTJXdlREOXNpUWl0U2JrcVo5c29pYWRIbUlXTlFlbzY0QUxmM3Y2enV2YXkz?=
 =?utf-8?B?WDgwSUxQVktrcFI1Y0FuYUlMNElJY21OdUg2QTFGSDVXSE9NbFVqOVlhYUt2?=
 =?utf-8?B?eVhtRFJSYzh1SkFCeE1SZUtHR1ZPaWRaZHh3QlZNZEdFWC9sMkVYVnNMQjcy?=
 =?utf-8?B?Y1pJMFFmTUJQTHBGbGRlK2xnVVVkSm9TYzVYOWx2cWZKbDVzakdta3V5eW9z?=
 =?utf-8?B?ZXZyMU1wWmNyUW5wR3ZjVHNVcTJBQjNzQStDT21yRnJNYjBQR0k2eDJaQU05?=
 =?utf-8?B?NS9iMHNENHlxenNkMGNLQm9ObHhUTUhDN05oTC9oR05BNUw3QTZ0b0NyYWli?=
 =?utf-8?B?a1BiNHBQUy9QR05jcmZ1UzhZUElZK1hlUkZKdDZzK3daUXJqdTNyM3FlQTVo?=
 =?utf-8?B?dkFBMXFDZXRtL3lkZG9PNXYzQ1Vsd0taZ1NZdlJQS2ZaYUtjcDU0S0VSa2Fu?=
 =?utf-8?B?czB3UW9XQUUzajQxSitPV1FLMnMvYUxtZWcrM3pvQmRsVE1CbkpxT3dFcGg5?=
 =?utf-8?B?MjVKSjFSSFZHeHN0QmFHSmpCT1hpMkRIeUxrTWV5cDVXZFFWVEVHaGRyeUVr?=
 =?utf-8?B?QTNHQmJ2MjZzNVo5Zkw2ZUdkNVZYcWhhOVlnTWZmMUZRSE5objdMaFU0bTR5?=
 =?utf-8?B?TStHRUJNR3UwWlQ0dEhQbFFBcDFQOEQ3TGVDSU9VcTBCcU1EaTR5OXRscDBW?=
 =?utf-8?B?Q1prSFRqNG1WbVlwWFhwZ0tVcXFuTENTVEdFbVlpRTV5MTROdUYyeklCTTFP?=
 =?utf-8?B?Ym5yakg3L0pwY0gvc05ZZEl5T1N3RitINVkvR2EzM2hUdTk4dlhReEJtR25p?=
 =?utf-8?B?aXNrVUtiOEhiTXBnOVI2YnNvQXZob3k3QzRHY0F5ckRyMFBWZUFFYXBjVGx6?=
 =?utf-8?B?cHJ5ZEVPYU5qby9WY2VsemhxUmdOQmlNU1VZTjMzS2VJUHREZHJxaXd6MUox?=
 =?utf-8?B?dWx3ZUQ1TURob0dFUUdNR2tPUVR2S3prc2JvVm1Ub1J5ZjBCVUJFaFZBTEhL?=
 =?utf-8?B?VVNrVGRqMXZrK3ZEa3FOY1FMbDNsSExINTMvdWQ0bk55Q3NwRTZpekNDazM1?=
 =?utf-8?B?WjhZT0hMWDVjbWM4akJoTlRPSHMxeHdqRHZQWnJmZG41bG9RRXZqclREM295?=
 =?utf-8?B?bDlRM0ZiKzRDQktFbDdhMVM3RHBoWGpONElCU2JpMW5qNFpKZCtFWThTQjVP?=
 =?utf-8?B?dHdYcmoxbmcwb3FyOXpFclhLSDJWbWRhWG1EalhITmdHT0dLTmwxSDJNK2Er?=
 =?utf-8?B?RUVlNWV2TzM4RVc1UjhhOUVYbjhabDFodkZYNHcwc2NhMHNUNkVOQy82eU5p?=
 =?utf-8?B?R0ZiVDdjNG9Xd3NFbHd6RC9CdU5QY1VGN3MyZUN6Y0doWXp2bjJCWHpoZDg3?=
 =?utf-8?B?L2ZqMnpROHV4cWhRd0EzMkFqVG5BekJSY2tVQmVYOXdqNWx4UGwzMXBockd2?=
 =?utf-8?B?U1hKTjg3UWVhSGNrK2pYdEF5cm1KS1p3NHJDVHNzS1J1WW1yNllaN0hXVHFU?=
 =?utf-8?B?bGdjUkx1TEFoSWpIMHVvY29CdnRqbEhwUElpbmFTeVphcUhwZ1U0NzJTUkVW?=
 =?utf-8?B?WVVwWnhwQkpzWjZtZ004c1dQaUt1TUMwcUYvb29ZZ3lkY0ZaMy9SNmVjVmRX?=
 =?utf-8?B?Lzd4Mk1wWjNCRW9wVGJNM2pYOEh1YUhkblE0dEp6aXBhMHQwOHgxQjZQdGlK?=
 =?utf-8?B?aFRDOFdaTm85SUhhVXdXbzEzdHo3c3lmMXdtSFpDU2cxaFA2NUptNjNkMHlY?=
 =?utf-8?B?a1hXM01xWUVNblR3SFZvamZUZlRnTjFnd1B4UndYQk5oR0hadkF2am9Fc2lN?=
 =?utf-8?B?SzZDK2hSMXNRQmo1ODBKVWMxYURpZlkxVkZRdTRNMzZNalZ0em9ENHhCYWo2?=
 =?utf-8?B?T0lhOGw1TzNhTFlDaEcySGVaSTM2cklhcEdkSzZ5WXJDMlhnZnpiQkI2QVFo?=
 =?utf-8?B?VFBLQ0FlVXA0ckpINHFnQmpqV29ManArSG9LUzJKY2VxMXN2SmlUMWNYMGVu?=
 =?utf-8?B?Q1ZHVXdlOHF1a0xmRFJyd2pmMUdhQzRHMlU2TGtrNXQ4NkJQandaNzZjVVdO?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466724eb-00e1-42ff-f6b8-08dd4130d084
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 13:20:07.3040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l14Mc8rRpNZQgnDL/ZXractYpEo25LxKgTrvyamjrU3dL7oo0NT1TpMAsQ6eQHx0O8qvTvKaODWBsyFqNQzy4MbKldjzfYbCMFGxzoEYqyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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

On Wed, Jan 29, 2025 at 08:59:47PM +0100, Michal Wajdeczko wrote:
> GuC firmware counts received VF configuration KLVs and may start
> validation of the complete VF config even if some resources where
> unprovisioned in the meantime, leading to unexpected errors like:
> 
>  $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
>  $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
>  $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
>  $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
>  $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota
>  tee: '/sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota': Input/output error
> 
> To mitigate this problem trigger explicit VF config reset after
> unprovisioning any of the critical resources (GGTT, context or
> doorbell IDs) that GuC is monitoring.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał
