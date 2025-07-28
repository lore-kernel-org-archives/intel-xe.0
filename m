Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F427C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 21:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8310E591;
	Mon, 28 Jul 2025 21:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anJ06uTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BD810E591
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 21:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753738945; x=1785274945;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xG3NGHcUq+dC4UcCwdwJm74g+K0l7/zcNHi0D61JFHg=;
 b=anJ06uTfNY/PaGUglaJ7PJN9MfmJnzvr+/iHyUhXjCiSSmw67W3VILfm
 SrxXQ3gIM+iQBNQtKlyNviRmaVME5OLPflCk3d99tcuAM0VRORMkiOBSf
 FYGRNc5mvxfpmP+QDu3YvB0g0HZmNo33v2SdP6A/MTCiFBOWrLS5vpwEI
 r0zXpzwrEtdbZjqg1x1eoHv1fr2Um1lhKjw2fwSS0/KzCWOscKmwliV/E
 z5orR7qbCkOLAFZtPYSUBgd6L8Fl4JF7XVE/QuOXyFVBqJAh72E51TNDW
 BHci0QRtOJ8FBa0JDAUevkyEk6D2/mHRJuetcjccWrhFJexBnOi2iqWr6 A==;
X-CSE-ConnectionGUID: RmNCLb4MT1mJ9s6+Iyffxw==
X-CSE-MsgGUID: dxHnuTtKQzGG6EYtOT6DEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55202488"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55202488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 14:42:23 -0700
X-CSE-ConnectionGUID: hq0WUAFxSsC7iPrUXaahAw==
X-CSE-MsgGUID: Cr3dbQ4IREGf0RZ+zZT75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="199663088"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 14:42:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 14:42:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 14:42:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 14:42:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb1j2bhNNHn0PS2mc/XGHORvyNQx+iyAt+UZIO4TDxBgprjVCxpV1SyQOwfLFw4ZEUrMvrHdo6n0Xuy/uzTAQrMMBTRONKVaCJrbNM+7SXEWhEXhNaG8TxBLxvG6E8AElUVpHE2oYrxe5XDd4FXtzp0TEj8d7OtX2gqa8QGY4rkuQno2TbxpLRUwigAIRJBbSo8WgcB/Zt4cHkOQ26AjQQpxSYUuTQUponJX/7vBt2Sxc6VWKANtCLewDv2gd9J7JLFJksssAIB1nO2tIb/20shIrQcp+bK3WM78imbKwpu9aT1SIl3oFNgi7U99XgMr2Mo0tJTXxdtU50jktOnKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMDvv8NdS+CZZlG+LQlKLDYcNAaWXH9iihAAsXmu4D8=;
 b=PsxWGZmXb65B4Be13g82oAou1dGAgpdvgBbeWvYVU1kixzyPze1JzbqIK86RLLB3yBH26RoFFgcnntLedYQcyseaWNC6jK8cs/MJDaeRXfynagbmpAKE8aWOpcooQa8qrTZw/Y5tE016BtkSCEeM75Fb+pH2pU6Y75O2QigvIrzoLRud55ojRWf8IQztRlJ8KWUZh/O+iaqcpvCOz/ccN8oZ9RIac1zaNt/58Re1ripRGG9ZzENTpygRUphd7b8IwY/jiC/QuFVYyEDnwzYrZQV0CfMwzC6yYj3WnCHOMTRBoLwJXbFGGXBsazz+Ipe3ZEzBC1aivBuYTZyn2POT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Mon, 28 Jul
 2025 21:42:19 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::7f5b:3222:e88a:317e]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::7f5b:3222:e88a:317e%6]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 21:42:19 +0000
Message-ID: <9ed21500-4d9e-4c55-821c-657e91966a9e@intel.com>
Date: Mon, 28 Jul 2025 14:42:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable
 functions
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <lucas.demarchi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
References: <20250728194806.68176-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250728194806.68176-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To DS0PR11MB6397.namprd11.prod.outlook.com
 (2603:10b6:8:ca::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|PH3PPF6B7063D92:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7381ad-f603-426f-fc98-08ddce1fa0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjVRcDhwdEdJU0VWV0V3aG1MV2dVR09tYnp3UklleWdaMTVsZFZaNnlxZ1dN?=
 =?utf-8?B?RzMwM2wzSzB4L2U3YmRyTVJOUDhuVUtzeEMrditZMEUwb1ZwNnRSOVBUWG5a?=
 =?utf-8?B?c2xLYnVvZFkvWGlPOWhVRzNXcm0wb04xRjZNSDVwS1pHSkxjbmJVclo5S092?=
 =?utf-8?B?VGIvU09Pb2JDMEJFNElKQlFmb3FJZzlwZWFpNCtHN3M1ME1YclRqUG0vN2ph?=
 =?utf-8?B?QktHbVAzYlFQNldRU09NOWx5NEszMzVpNkYvMXBFWkhVVys1TmFOM2JmUVV6?=
 =?utf-8?B?ckJRbWp1ZFlqbXhieVBkZGdwZGpaMVAyZlgzU1pmOGtKanhnU2JoZ3lwN2JQ?=
 =?utf-8?B?N2dKc1JLUDR6U0oveWc2S2FNR0dZd2FzQU1EeTFCbnVKWUhxeDA5RExJWkI4?=
 =?utf-8?B?dGVZdWZBQThWRXhFeE4xL0l5MGRCUWYxNWQ4WjhXV3NQVEFZY2ttMEIyNU55?=
 =?utf-8?B?UHhXZXFnV2FxeU9uQnlKTzJQd3ovKzN3YmFseklhZDZkMEVudWpqMDBBQmNX?=
 =?utf-8?B?cXZqb3NRRkI1UjA5RUJ1dU1JVXp2YW9TTDMwNDlzaWJMalN1OUpqbUNUNzB6?=
 =?utf-8?B?QklrcG9RZ0ZhNGN2ejhXSzBYT3FwYVJTWFRmMTFwYUQ0eGo0ZVlBbzhOeVVN?=
 =?utf-8?B?TjcvQThPRzhDOXR2dDNKQVVMSzlsa0tzcmdJMm8zZ2ZBUklaQ2wvV2E3Z3B4?=
 =?utf-8?B?OVBrYWd4SzVuM1NWdE9WUzJ2VjZubFNHcDByLzNuOG9VNE53YTRrdVJPdWd6?=
 =?utf-8?B?dEVvSy9tRGx4WkVTSEM2SXhId21zSm1DbUFQRC96S0p3aSsvLy9iQnIvOTRw?=
 =?utf-8?B?MW81dDlwR05NendjYkhTZHYycUlON01oYjNzVkYvWERJZm0rMWV2RmNxcWp6?=
 =?utf-8?B?TDhoR0tLRWdqck0wWFNhSEFCYUZPZjlmNFJMWmxBZys1SGVZL1pBRUtQbmlQ?=
 =?utf-8?B?VThjMWYyQVRYVGNDWVJXNXVCcXBZbzA0Ni9meVNrVGFWc3BxT1dnRHdyTXN3?=
 =?utf-8?B?U3R1RytGZ293b0F4aHZhUlZJWmRaU0JWYXZtRGtXeG5BeS96d1VkcmtjU0c2?=
 =?utf-8?B?ZCtmZXFZV2dzaDYyMUozVUFOdzVsVTNTdHlHYmpjdnZpdGtaSm4vdllnMmZK?=
 =?utf-8?B?QnEvRXZ2enFQOXNrcEpOMS9hZm15TXYyTVBkVnFweFJkY1ZMdG0wM0o5WUxQ?=
 =?utf-8?B?VkJZSFgxc2UwWDJMYk8zUkFIMG9kUVZaS1JSLzFCUFhvbllDM1J3WHROd0NV?=
 =?utf-8?B?dWdCcStyOE9IdGMydjFka25ldk9VVjczendCeUcrQkI1bHZtTHZFa1dXVEhC?=
 =?utf-8?B?Z2pPaE9oMGsvcHNIQjVJaWZ4OXZvNmFNR0pQUi8vS0d6N2ZObE5XdWVrdmU3?=
 =?utf-8?B?dE1aMHZuWk1RY1hnVEpUYmsxVVNOQzFzYnZmdFdnYTQ2UWVjeVpZcGwzY0ZD?=
 =?utf-8?B?bllmazZXaEZiTnFUa1VkcjFJblc0cUxzVzlYYjFEa2UzY0laMERMdHp4cFVY?=
 =?utf-8?B?U3JBbW9FK2g3a0F0YS92RlZXd0dCU3dCeVFjWWd4TjZWV0JjMUQxT3c1c29W?=
 =?utf-8?B?ZFRIeDh0QTNhOHRrU0tiSFVIU0x1SGY2WElTd3BkY1l0TnFmb3ExVDljRGJM?=
 =?utf-8?B?OU9CaVVSOVZ1N2RjMFE3MXJjTzJBL2VuaGNaZFFuR1lnUXhyYU45ZjZUYkV5?=
 =?utf-8?B?QjZ3a1JkZU55QlNKSVlGRG5uOEFJS2pnQUhJeE4rZi9ONHNNeFg3c2JBYTdD?=
 =?utf-8?B?dDRWcGN3NGdlZ093NGJxKzl3UmM4OHJwdkJEakpQa0toNWJEeDB4VktSOWdj?=
 =?utf-8?B?TmVFSlhpdW8zN3orSWkzSEVnOUtnYWtlRmR4WTc2ZWhpZnBXbUdLbkVYeUd0?=
 =?utf-8?B?YXU3SVlMNVpBSjUxdURHV0hYZGlFV1grZFVuaWdqaERYVThyN3R5ZXUyZk1B?=
 =?utf-8?Q?bOI2JTp8z8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6397.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmZ1eXhtNUF0WDh0WVlJZG5XMzM5MVFLK1RKeXpSdUFlR3AvYzVqenpzUTUw?=
 =?utf-8?B?Z0ZwcmJiWGF5QnB1dnViYmdBTENJYlY4QTk5a0R0ZW5zVy81K3RJbytCMVJ6?=
 =?utf-8?B?bkVzZGtHbUlKeVMxR040d1AxcHR4N2d3NVBKOVNLdkc0c2NVb2tEL2ljUFd6?=
 =?utf-8?B?OFBrRnF3MURVY3RRLzVpVnp1eUR2K0NtMVE4RTNPOGdsL2RCM2xuWHUwRHBk?=
 =?utf-8?B?Sk8zcjFvM2p6VElzSkRZS3A2Z3NkbjJ1NUFlVGNYWlNoUmdPN3VyVk1hMVF3?=
 =?utf-8?B?RWlReHRCN3NZejNVTjZRTHpCYkVlenYzT0ZKRkpiMkdnMERPeUlJL1VvTWlI?=
 =?utf-8?B?OWVXaWJDN1crVTdiUkttSFFEWE4xYzZIbFpoYXNTazlQcUlhazR2K0RRL21I?=
 =?utf-8?B?OEhFbEVDVGNVY3FmTWFRRjRSVFMvUjloT04rYTAzSUd1UlZpRm9lWC9aYWRW?=
 =?utf-8?B?UjZLblhWbWRSYkFFSnRONU11NERUWS9zTlJvK01ZZHQ3ZURRd2hucElteWN0?=
 =?utf-8?B?czNKOVJwVytUWkZVREFLZXhiVitsSWt0alNHYk4vTm9hMy8vM1RqYlFHaStR?=
 =?utf-8?B?a3Y4bFZVRjF3bEs2bVkremNlck9RZndUeVdSVnAyUjIrL1k0YXJnbS9iWE5x?=
 =?utf-8?B?eHYzZU1jVzRUcEt0Tm9ISTljVVlNOWJ2TWlXNFcwVmFQcVVrRkVIV1dPNVlS?=
 =?utf-8?B?WTE2NTlaYzRZOFJvcVZRRlozandDMy9qbWR1ekh6T0hrYlhSMzNLcXo1UzhZ?=
 =?utf-8?B?RWJqSU9rdzFIeVVieEpkNjZFYUU5SzVzRnJjUG42SzloN3VTRkNOS1dmZEFx?=
 =?utf-8?B?b3ljNy9oYm56MlQxSHVFeGRodUltR1BUUmVRUGRTNmZxa1dmalcxa212VUc0?=
 =?utf-8?B?UWIwVDYwb0YyMWlyVzMrVEh2bFFjMEpWcjIwNU1OdUovenRXMDVhSysyZVRP?=
 =?utf-8?B?dk5GVXNBSEd6b0pJRUZScm56dDlReXZSTTQyNWJFZHpQM0l4U0E3S015L3FB?=
 =?utf-8?B?SEZVSUp1STVlaWdFSk5uMTQ2RmsrVTlkVSt6ejZ3UVBzY1ZCbTRZb3VLQXJJ?=
 =?utf-8?B?UzZweFZqU295TEVCblFDSVBhYnhLVUZTWlE0MlhVemZkbkxQcHJ4L1E3dmFT?=
 =?utf-8?B?UWN3Y0tlckM1RVBKaCttUFVLOFl4disya1d4WnF1TFlYdGdER0VsMXlDRDlp?=
 =?utf-8?B?K0g3aDlubmVDcUZCTVA2VW45RWdBeXJXLzc4NWpKQUltZUM3VGpuMVVpd3gr?=
 =?utf-8?B?Ym5lL0puUm0vTEhNNnljNCs1MmZMZ29LdUNPS3hlRE05akRySVBjNHpBNWZy?=
 =?utf-8?B?Zmd4bDEvOEx4K3R0SFFiNUhRQ0x5S05qWlJJNEFRSFdXQksvM1cycjREQXds?=
 =?utf-8?B?MnB2VW5MUUswMGdrV1UxNWdvaisycVBiS3YvTGdJL1pGNHRocnQ5Z2NjbnN5?=
 =?utf-8?B?WE4yWFd0U09wMU1RNXd2WEk2ejUzWUZ3clE2NEk0VU1YY0QvRmxZNUVhNUZX?=
 =?utf-8?B?TDd4QzB5U0YyMzdnKzdRK0Mxdkl4MDZLa2ZKa2ZkbEJOWmR6cnQ4S3pWSUtt?=
 =?utf-8?B?dVdpYUhIdHJKcGpQaVd1eXhlSWlLZnhDaEllU1ZPcG9UQnJkMWdRVVdKMWxI?=
 =?utf-8?B?cGdUSlFGd251T0lmSVc3T1UzeVFObDBTWnVOenVta2NTdENjbDhzT2NnZTVk?=
 =?utf-8?B?QUxDWXN6OTdRbEM4eGJ0VG9abU5JQVNsS0l1QVNBTDZvU0trU2xXM2RVRlNY?=
 =?utf-8?B?QXFocE1tdXovdHhjZ3NMY2VFZi9GWnJ5Ymw5dXFXczViMU9PUVdMck1oZVoz?=
 =?utf-8?B?Vnl2UDVtQVVicVlYM3QvWWZBd0pLVDBnMDBxVFhxMk40Z0pHZkNTMlcxTTNm?=
 =?utf-8?B?WTRQQjdTeWhaVjhmN1MxRVZuZnh6OVZ3UU9hVFJFUTdOS0ozcndGaG8zQlZa?=
 =?utf-8?B?bWtoSWxxOEhmOXlpU1ZuMllnMmlMUlJQNXJDR3Y0KzhaNE52NlA2NHY5dnZD?=
 =?utf-8?B?ZTZ0L1RGMStjdElvQUZUb1ZoNDVjaHB2dHVLUmtzSUxMNFQ2bi91SEVkOHhv?=
 =?utf-8?B?VGVvK3RMWVdkQmxOUU12eXhBU3JDUytqNnVFREJ2ekNGc05wZUo1dUp4Q0xl?=
 =?utf-8?B?cVJlWjZ4MUF5R0U0MklaQW1zQS9icnZwKzBScjN0Z3NJV1RSQlJiaE55MmhO?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7381ad-f603-426f-fc98-08ddce1fa0ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 21:42:19.4331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8CZoVvSaWKSuvV7eNfPaqAQ2IqYJ+3Op4rjTgYnPlUY5JKkl/xP5ZCDc4Hnreg7hejqsmeN1pn0bckRJK9rFfJHAx4O/3UOFduJY/Ap4QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
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

On 7/28/2025 12:48 PM, Jonathan Cavitt wrote:
> Presently, multiple versions of the guc_waklv_enable_.* function exist,
> all with different numbers of dwords added to the klv_entry array.  This
> is not extensible, and more duplicates of the function will need to be
> created if it ever becomes necessary to support 3 or more dwords per wa
> in the future.
>
> Consolidate the disparate guc_waklv_enable functions into a single
> guc_waklv_enable function that can take an arbitrary number of dword
> values.
>
> v2:
> - Update length value properly (Shuicheng)
>
> v3: (Harrison)
> - Use data as a term instead of dwords or arr
> - Reformat warning message to use hex values
> - Eliminate need for kzalloc and klv_entry array
> - Reorder function parameters to fix line wrapping
>
> v4:
> - Miscellaneous formatting fixes (Cavitt)
>
> v5: (Harrison)
> - s/data_range/data_len_dw
> - Use data_len_dw to calculate size for xe_map_memcpy_to
>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarch@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 136 +++++++++-----------------------
>   1 file changed, 39 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 8ff8626227ae..2ceaa197cb2f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -284,81 +284,26 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> -static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value1,
> -				      u32 value2,
> -				      u32 *offset, u32 *remain)
> +static void guc_waklv_enable(struct xe_guc_ads *ads,
> +			     u32 data[], u32 data_len_dw,
> +			     u32 *offset, u32 *remain,
> +			     enum xe_guc_klv_ids klv_id)
>   {
> -	u32 size;
> -	u32 klv_entry[] = {
> -			/* 16:16 key/length */
> -			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -			FIELD_PREP(GUC_KLV_0_LEN, 2),
> -			value1,
> -			value2,
> -			/* 2 dword data */
> -	};
> -
> -	size = sizeof(klv_entry);
> -
> -	if (*remain < size) {
> -		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset += size;
> -		*remain -= size;
> -	}
> -}
> -
> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value,
> -				      u32 *offset, u32 *remain)
> -{
> -	u32 size;
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
> -		value,
> -		/* 1 dword data */
> -	};
> -
> -	size = sizeof(klv_entry);
> +	size_t size = sizeof(u32) * (1 + data_len_dw);
>   
>   	if (*remain < size) {
>   		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset += size;
> -		*remain -= size;
> +			 "w/a klv buffer too small to add klv id 0x%04X\n", klv_id);
> +		return;
>   	}
> -}
> -
> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> -{
> -	u32 klv_entry[] = {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
> -		/* 0 dwords data */
> -	};
> -	u32 size;
>   
> -	size = sizeof(klv_entry);
> +	/* 16:16 key/length */
> +	xe_map_wr(ads_to_xe(ads), ads_to_map(ads), *offset, u32,
> +		  FIELD_PREP(GUC_KLV_0_KEY, klv_id) | FIELD_PREP(GUC_KLV_0_LEN, data_len_dw));
> +	/* data_len_dw dwords of data */
> +	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads),
> +			 *offset + sizeof(u32), data, data_len_dw * sizeof(u32));
>   
> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> -		return;
> -
> -	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -			 klv_entry, size);
>   	*offset += size;
>   	*remain -= size;
>   }
> @@ -373,49 +318,46 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	remain = guc_ads_waklv_size(ads);
>   
>   	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> -					&offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
>   	if (XE_WA(gt, 18024947630))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> -					&offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
>   	if (XE_WA(gt, 16022287689))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> -					&offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
>   
>   	if (XE_WA(gt, 14022866841))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> -					&offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
>   
>   	/*
>   	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
>   	 * the default value for this register is determined to be 0xC40. This could change in the
>   	 * future, so GuC depends on KMD to send it the correct value.
>   	 */
> -	if (XE_WA(gt, 13011645652))
> -		guc_waklv_enable_one_word(ads,
> -					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> -					  0xC40,
> -					  &offset, &remain);
> +	if (XE_WA(gt, 13011645652)) {
> +		u32 data = 0xC40;
> +
> +		guc_waklv_enable(ads, &data, sizeof(data) / sizeof(u32), &offset, &remain,
> +				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
> +	}
>   
>   	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> -					&offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
>   
>   	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> -					&offset, &remain);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
> -		guc_waklv_enable_two_word(ads,
> -					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> -					  0x0,
> -					  0xF,
> -					  &offset, &remain);
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
> +		u32 data[] = {
> +			0x0,
> +			0xF,
> +		};
> +		guc_waklv_enable(ads, data, sizeof(data) / sizeof(u32), &offset, &remain,
> +				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)

