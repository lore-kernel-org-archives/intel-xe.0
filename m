Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E0E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 23:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4439310F1D6;
	Fri,  6 Dec 2024 23:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr30FWkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B610F1D6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 23:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733527671; x=1765063671;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2KOhHQQOBhHNePWCMMt7CZZsprhRdogb9d8zuvwDP/M=;
 b=Hr30FWklSqIQ7uZMgrMcAERAe9EATug6yk8e3GF8YgEebrjglfQMg9me
 znMhSQG8EADMoF++7/LCbP6QoShoQOdMdFtOoOgAvmxWl8IHxuTC80XmQ
 QCUmrK1G5nB20wtR1BT4tW2JcKMP+ftHnLxUDoZA/KHdwD4/oWokUFsZK
 XryTctBKKgQpch8AjZA4X/ElRR2AS24J0qRN5KP4kGncw3zt+JYhU70YG
 h8K/XJILTeNAkozqzvq01/7RS0j8Z0hRRmwvazls1Df+CDwn9XHDxcFvk
 wG/Xk6oPJFRpywSm1YWlSKvXLepGKr4X1dtk4iDbQ+tXt0l4UsPkW+sSl w==;
X-CSE-ConnectionGUID: WAktR+eiTHWIO8X4sUzcjw==
X-CSE-MsgGUID: 922u/zwaTrC6n+B9CCTk9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33776827"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33776827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:27:48 -0800
X-CSE-ConnectionGUID: HaBeJNQsTH+fGzEkkgMetA==
X-CSE-MsgGUID: NYxxLPoMTX2Q2Ou2T12HMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="117788145"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:27:48 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:27:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:27:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:27:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZInYHeLcveSA0Y8n952W9ZrtnuwWW/FjpdjvN/JlcQKfPDb6lak7mjzk9J+HQVlFvorc3cPrZ1QsYWMadvnF+9rrayAk60qlc86KZk4FDCYebiGaz2XIHVi3dbDPJ4c9cUesM2FNz9I5r+TAI+QHM0J6tSpd7zJmwSsiRut9WnV1NYdlXT2fhdlIwct3R53srQ4I5AYLSnt05UZqA4GWczWdxagVbW39Is5eLfJcs6ShiWUAsR0ZOYHbRE6O/BY/U//qcGOvivDQHox07LzRDIPWK8vq6kk9v2/HXgnt58Sn4Cn80SpGDbSgrZsL4V4MQqTr0Rf+Zf7RjcWnxHiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmBhMUKDg/7avBgC21ZD5lxyvei9DwhQTbWmtsFrQNs=;
 b=Hdtv7eQf78Ky/lDQz9bV6TAmTW4hkTe60RWxTmc6HTvKctB9WkxGpd47SDifgdl0JwGDG+XlIrquA5pc43ybWlH7bmIcF11e4/WeeXaJxD9rg8xlco+X0UvYMco1M0UqQa4vs+tR75LgsybtOkGp1VMs2x5xS3XLZr9mhK1KA3zUVdNqCxDiCXXShNDMzLIVVrWyf93ikM5D6EOR2zusmHcJ8AW5+BBVpScg54vw9QHUdCmELQvZAsgp0kQ8BbsJo1RSIAch2SNgUJFlm1N5w+fMngV446PE1SvghNNJdqlHsG9VlAo8XF5mkG5gEinO/wFy+nnRK0z7Duy4vhCT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.22; Fri, 6 Dec
 2024 23:27:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 23:27:44 +0000
Message-ID: <28ec72c1-1232-439e-9f4d-d8321f8f86af@intel.com>
Date: Fri, 6 Dec 2024 15:27:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] drm/xe/pxp: Add GSC session initialization
 support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-7-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: e715b1aa-c4eb-4e92-1e5c-08dd164d9647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0dzcVRFR3FZbjhmZkU1TFg0aTBpeFJjejJ3MHYybkZMdllHaEhsNnlKWk1x?=
 =?utf-8?B?QXNHMXBvQnBoaUpaOEdGR1g2eXFocldBd3Y5Tnh4ZnZMWkRPdVVPQUpZZG1k?=
 =?utf-8?B?ZzdYZzRYaTNOcERlWTZlR2xaQ1AwQ0x0VGFkZ3BMY0pEVms3OHgrM1ZSWlIy?=
 =?utf-8?B?eXFDYUpYYjhlTmRGcVZVWENvQUdaRC9OODROTFRyWUJQMVkwSGNzSVBMSVRq?=
 =?utf-8?B?ekQ5L0pTT0xtbUszZkIxT3Y2Z2l2RmNBM1p1V1RybG5Yc2l2WGwrVjVSTmUx?=
 =?utf-8?B?aG0ydm9DTXVuNzFjL3k5NzVyR0ovbUpYTTdVbnZONjBDVzdIaHVvbEc4bHZv?=
 =?utf-8?B?QVcwS1NWSHBmVDhWWXJBQ2oyTVNRL3pFamdPOFJ2S3o2TGFNWVJ2akNBVjRZ?=
 =?utf-8?B?YkpVMG5oU3psT0hEbEt6MU1VeGp0ZmtYMUJZYTZFN1BBaWlDZVo5NGxLeTJI?=
 =?utf-8?B?RndreTdER1diRlN5eDZ6OFNMQkcxeUN0R0ZDcDRpQ0NJSkt1RjFZNWJodnpy?=
 =?utf-8?B?Y3RLc2plTE83MkEvb2pmTlZWYlRxQUhYaEkwQTF3MWMrV2xzTHpqUHBjU0JT?=
 =?utf-8?B?M2RYNzFMRElwMHRxUnZNUGhDMW5qeUtmYzBUUXVOWjNQbDhvOThtVi94RGdZ?=
 =?utf-8?B?Rm1WOFdlcHNmalQvazVHZlBqblRNdjRsdWFqSU1JT3NpM213ZVM0ODk3QUor?=
 =?utf-8?B?SDhlZmhtdmpWYzVONnAvLy9YS2N4SFppaG95bjJkTHMrNmkzNUNYZWsyeldr?=
 =?utf-8?B?dUNzaitlZ2dGdHJaSnducVNRMUYzT2hJazM1QXVJQXdhZTRxVWdDS01MdTVk?=
 =?utf-8?B?WXdnNmlpVWZCVlBObFNxOS9qbUUrdzJCQnRhR3NqOU5kTlY1T0Q3d0dUSWhx?=
 =?utf-8?B?c296WWhMVjJ3SkRxTHVPcHd6dVUyVHZOejZ1RURTNmpnNlRHQS9GUWNWeEZE?=
 =?utf-8?B?clZFYnlUdmpvOEFhYUEzcXM2eXVBVWJBWjRLUzdzaXZqZmQ0Nmhya21LQnJo?=
 =?utf-8?B?S2pHTlNkcCtOeURtM01SN1EwZmkxRnppdkV0ZXovZERpNHB4Y2FwWVBmaFFM?=
 =?utf-8?B?akhvaVZlR0VlT2ZPajBLNjhMYmVSVDZ5SGtjRHV4akFreitmOUl5V29QQ09P?=
 =?utf-8?B?dVUzcFZxZ1ZTZHJ4Z0dGK3hTdXRkMHhVbjRyeHhLV3JQNWc2UjJ3RHE0dEZq?=
 =?utf-8?B?ZUkyQlMvSWxiQ2oycUhqM3h5VjYvUUoyYnNTSVk5MmNxdUxHZE4vT3htNThr?=
 =?utf-8?B?RzlmTUJuQWJSa2tKeEt5SGtuMW8xQ3hEaWhTdVJTaURqR292eHgrT0h3NDNz?=
 =?utf-8?B?UjNWakxqeGFLYkJ4ZUdkSW1yeDlqcGc0QVFRdkllR0FsdEV3YkVlLzNYaFJj?=
 =?utf-8?B?RkpLaEljVTlhV1RFbllKYVZ0MWJ5M0YzemhQNlFPLzVaNGcwME1qbmEzMmNQ?=
 =?utf-8?B?U0Qydld0SER4WWtkbHAwMWcxcFdVMEQzbnlxWkd0Wm9MSFZ3WWhCTTE3dVlG?=
 =?utf-8?B?L1lZVU1YK3FjcEdwU2VFQlYvVGs5UmNvODlWS2lzZWlIMDZiamsyYzdtNkdO?=
 =?utf-8?B?eFZ6bE16ajQ5dGRyVWp6VWlwNXdibm9pVjhxQTVhOTZuN0xlYnBiQ3ZjaThE?=
 =?utf-8?B?OXlKNTUvT3FUS0YvTDRGOUptQTJMQU5MRU9FSUtwbDNjdFRUN2VCSVVlMFNy?=
 =?utf-8?B?eGtJYjlqdWV4Z0krVSsyT3NEeEZNUHkxQ25wU2ZyRzliZXdCNjlXQXg3Tmlk?=
 =?utf-8?B?MnI0ZzJVNDBaaEw5cmI1bkovYnhIYVBpZW12amVMM1lGdnRMTXBPdk1ISldI?=
 =?utf-8?B?cGJ5V2pNbHNWNTZkNk1UZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWxHVnJkM2x1MFBKcUFoVFc1eS82dm0xb21mM2dmcnlVdDJPQ1dNdUpFa0Rs?=
 =?utf-8?B?MEc3TklZeGRFL2tDZDdGMlFWYmM0MUlpMUt2SzJTWnl0Sy9PeHZ0YWNDY3N1?=
 =?utf-8?B?cFlmNUhGZmRKTWhSWTBHMXQ3YnZRWERuV3RCeko5T2NaRkRvNGEzWldnQU03?=
 =?utf-8?B?blNCM09CYmwzZ3lWdjRJaDlHTFVnaHhkWTJqRVZFeFQ3WHFsZjY3aFk2a2Nk?=
 =?utf-8?B?dFV5M2VxR0RVMGN0dFBDQ1ErazNiWFpBK0N3VGZUa1JtV0Q0ZWllaWk3M09F?=
 =?utf-8?B?M3JjL0FzTFo0Q3E5N1BldCtnUzBRdnYrRU5TVm9rWjVoMm9Ub21veDRpVHJD?=
 =?utf-8?B?YWJjRnZGQkF3ejVPWWZOTTRkVDQ0Vm1yd3ltd1ZYN0UyYzNIWDMrNTA5TFp3?=
 =?utf-8?B?OVdUZ1JmZXloNkZaQVg5aEo0ZHpUSnE3UmVPbWRYWjVuc1pIdVhhVUtmTFRO?=
 =?utf-8?B?OEEvOVQxV3hJdVIrSjI5cllURmZpU1l3ZGRYRVlNOTBuMTc0VkU3YUlwN1E0?=
 =?utf-8?B?N0xoUkZkNXNTeG9zeGNYUmdsd2hXWXFrTXdJdXZ2WXhuWEpxWGMrWGdMM0F1?=
 =?utf-8?B?NW9WMjlreDRTczVjUkV3a1pzekRlTnB5Z1JMdUt6Zk5lQUZRRnJiK2NWTEIz?=
 =?utf-8?B?cjRJY0hqaTcyeGcvYkg2WVJ1LzBuQXBLLzQrc0tYbXhWU29qVk1SdHlIWE1n?=
 =?utf-8?B?Y0ozQkFtRkt6OTNNTGJKd0ZEQU1kODRrUG9YVCt5U3NKaG16T2dadmd0akxx?=
 =?utf-8?B?UlY1VGVJQVg3WmUxbjZHZ29maUlvdzJERGtwd3BOMnc5ZW91aCtVSi96SGFp?=
 =?utf-8?B?WkNqVzRscjVkK2dnMThJVDhBdDhEZmVJc25TVGpaZklQSE9RU3VXY3krZTQw?=
 =?utf-8?B?dGVTQTZuNHRzYmpobnRkdElKdVdYZ2pLTUF4c2g1bG1JOVQ2Z1g0SW9iNExo?=
 =?utf-8?B?Qm4zNDlPS2dRbmJKTi9FdzA3ekNXbWlIM0Y5aVhJalNZVyt2VmxtT0hBUjZO?=
 =?utf-8?B?bnh6V1kwdk5UZjVoYjFCdVlQNWVTZ29RSXM3c0REZnZsS2dCcEx5VGMwQW1i?=
 =?utf-8?B?TVlKQWJVNmdab3hiV0dnSFhmZWlEWWxZajcvR2lmMlJnTmVtd0diUTNRazcz?=
 =?utf-8?B?L05CcW4yREgzbHhVTUxEM1BMbkF2T25WZzBvbHBVSGUyQXA3dlNoWDZHZlVw?=
 =?utf-8?B?RysrSjNIRDN0Y1NlRFd6L3QvbS9ZTldqTSt6dHhRMUJWbzJkR3BzcjVoVHJ2?=
 =?utf-8?B?ZkFnZ3RNaEMxRnVHdGhRRzdOOXV2UXpEV0NOdTdhZWVmVlhGSmowWVFBVm5n?=
 =?utf-8?B?eWx1VXRiaW1jOHoyQklyR3NyNnNlOFJodlZGQjVDYUJHZHJQbElVL1czdHhv?=
 =?utf-8?B?VnZ5bVQvdFRTcllCc3NkUDlEWm1aOXgzSlVrbU1NYzZFNFJXdU5DYTN6WGly?=
 =?utf-8?B?UTdGTWJFWmhVdEJnM3RjYUVBWVI1VWJBVHE4cFBxbmx3WTV4N3BLaFFiNlNV?=
 =?utf-8?B?a09GakNrVE91dEg0Smw3ejQrWlhmN2R0V2NiTmFnZW5qWG42TXZiczRjaHJV?=
 =?utf-8?B?dGpVWmtjcXAyd29sRkJNQmw5WjN5bkdmTGdZclNaOWViWkpyQWx2MFU2Sjhk?=
 =?utf-8?B?RmdsamxlSHRESTdBcEp0WEhjazR2OWFCK1JrQkdHUGNLTDh4L2hOZ2NNUlNR?=
 =?utf-8?B?UDlEdXlWN2xwa3VaWU4yNWxoQTRsejZydnhCZjlVbUJwSTlWVkZ5RXJMT0FI?=
 =?utf-8?B?cGp4ak11dFd0SmlpSDdaWEpGZG5NOC8waEdVaThmSjZMWURNdkNjL1RzSklz?=
 =?utf-8?B?eEhBaERTYUJkVDYrS2c3NzJwRjVqR1ZnRDQxRDAxcC95S2ZQTFdLVURxbEJG?=
 =?utf-8?B?bkUzOCtsR3JBRFJ0TUxOTFBlT2xDeTRRUG5tc3ZtZlBjRUM5TkNJRTNMRU1P?=
 =?utf-8?B?ZkpWUmY2S0QyaTRhM3VEMmJQRUhmMUtYQ3BTZy85blB1K2dENE1Ec0NnZUhM?=
 =?utf-8?B?NGd0ZHdPRytPZk1Rd3ZIdVJxS0N6U1poRXhnYllGV0tvNGVocVYyaE9rR21y?=
 =?utf-8?B?ZWkrWlVlUHBmSVdra2FZWloxWE1WbC9QWGxlLzBUM29vK21sSWV1Wll5Y2Vj?=
 =?utf-8?B?WERhMUVKQi9RVnJBdlJEVEFsZVJtWkhaYXVCOXlUMUVCbDc3NmRneldUTkQx?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e715b1aa-c4eb-4e92-1e5c-08dd164d9647
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:27:44.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWakHyYewktdCgUjk2v9xEyqRkYdq/YKXbp/TQxtxoGEEmmqIyOkbLOBvzUSFF8+oeEQeiFaGtcSwNxU+GozNif+Z/gVoWqGEWgRnyy9ujk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> A session is initialized (i.e. started) by sending a message to the GSC.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the session initialization and queue
> setup flow. It is separate for now for ease of review.
>
> v2: clean up error messages, use new ARB define (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 +++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 47 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
>   3 files changed, 69 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index f0da65ccdda2..290e431cf10d 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -51,6 +51,7 @@ struct pxp_cmd_header {
>   } __packed;
>   
>   #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
> +#define PXP43_CMDID_INIT_SESSION 0x00000036
>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>   
>   /* PXP-Input-Packet: HUC Auth-only */
> @@ -65,6 +66,26 @@ struct pxp43_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_in {
> +	struct pxp_cmd_header header;
> +		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
> +		#define PXP43_INIT_SESSION_VALID BIT(0)
> +		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
> +		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
> +	u32 protection_mode;
> +		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
> +	u32 sub_session_id;
> +	u32 init_flags;
> +	u32 rsvd[12];
> +} __packed;
> +
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[8];
> +} __packed;
> +
>   /* PXP-Input-Packet: Invalidate Stream Key */
>   struct pxp43_inv_stream_key_in {
>   	struct pxp_cmd_header header;
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index f5f6b18c1054..b50fe037c74b 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -16,6 +16,7 @@
>   #include "xe_gt.h"
>   #include "xe_lrc.h"
>   #include "xe_map.h"
> +#include "xe_pxp.h"
>   #include "xe_pxp_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_vm.h"
> @@ -490,6 +491,52 @@ static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
>   	return ret;
>   }
>   
> +/**
> + * xe_pxp_submit_session_init - submits a PXP GSC session initialization
> + * @gsc_res: the pxp client resources
> + * @id: the session to initialize
> + *
> + * Submit a message to the GSC FW to initialize (i.e. start) a PXP session.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id)
> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	struct pxp43_create_arb_in msg_in = {0};
> +	struct pxp43_create_arb_out msg_out = {0};
> +	int ret;
> +
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
> +	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, id) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
> +		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
> +
> +	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
> +				 &msg_out, sizeof(msg_out));
> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to init PXP session %u (%pe)\n", id, ERR_PTR(ret));
> +	} else if (msg_out.header.status != 0) {
> +		ret = -EIO;
> +
> +		if (is_fw_err_platform_config(msg_out.header.status))
> +			drm_info_once(&xe->drm,
> +				      "Failed to init PXP session %u due to BIOS/SOC, s=0x%x(%s)\n",
> +				      id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		else
> +			drm_dbg(&xe->drm, "Failed to init PXP session %u, s=0x%x\n",
> +				id, msg_out.header.status);
> +	}
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
>    * @gsc_res: the pxp client resources
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index 48fdc9b09116..c9efda02f4b0 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -14,6 +14,7 @@ struct xe_pxp_gsc_client_resources;
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id);
>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>   int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
>   				       u32 id);

