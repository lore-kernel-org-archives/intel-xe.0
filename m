Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80D4F8E4B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 07:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861C510E989;
	Fri, 17 Apr 2026 07:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFPwpdGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2110E987
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776409837; x=1807945837;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4dK9D9hwO1C8fD6/mXtHBG869A/OntaPDJDRChIQ5bU=;
 b=jFPwpdGUdh4Y00AjcHN1NQBisPabBCScmGHxonKagT2wkQ2JfQJZPcGU
 Imi5+aSx65IhEnMaTLvgDXfOMkFxvESXaFkGJqnorEU5vWrt8OT5THA33
 NAgaDZow/cNoaje+e5nnZh6paG1rosg8h30y7+jG2JmEG2baRlSI17ygF
 yqxxu8qTSoewd3NbZmx3VGq9f15gvoIroGormcOU8sGSPcpePiVcct2bP
 fuPJX8EjpKad/hMViEG0WONWK8K/agXYQT7yVR9tkXb/6hiGOUZpcpOYf
 6aTZIR6UZvC6VtgOEQjty+/tAxSMBn7U4IldgadBRN60LWKlN0k1DYlSa g==;
X-CSE-ConnectionGUID: VOulB4QuRZmyHTJcl8008w==
X-CSE-MsgGUID: opDfLYP6QxGUrnR9QOeRXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87725038"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="87725038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:10:36 -0700
X-CSE-ConnectionGUID: mS66l124Qnm4Lb1eMJFpFQ==
X-CSE-MsgGUID: 4aG66YGqRQmgTyA/Ct/S+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="227831773"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:10:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 00:10:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 00:10:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 00:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnxGCcr/+3wRs8FauDuodKV5fGQ/11dWOXRLb1j8fiwi3HFt4xoHrhc/8BVch8xEG9UK//dVtqt8Oizjcv5x0I+4z/j8s8ktkY0+CHXfi7UdsaUgoQN6Ukfvu4N+FfFYSlGSLI4IKeRwybSZLRE3zQ3cNwcE04r5byRKTqAulf75/mjkol5cQTAsjufkt+Fg1z/vwvvh3mODmiuWED8tKyrRCMUMJbf7V2/KkiY52nnjlfcVWjIfWvr/IbTwjSGO7iJsyPyQk2sFmA/znaZSd4HPRvr1p4Vnw5weRKhIDVyRvv3fuNaJoMJTFcis0SLRHbQwj+MIh5PXMEV111Fe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o64sIvx0FZ3mgfZmYH6YbhFnXuP2sGsjOo37jok8090=;
 b=mkLhg9lySNcWPW2iMk3A7p/3OzprinZj7dDz9MudXydKPXMCbj6ujU4X/JVVvEwQr/AwEARIfO8M7wj8kl9wjOLNYzU4Z/7SdOyiEu7gguwZCWTHn1/qEjEa7t3Teh1u9fGmnefMxDvTU5MLv5l95/c5GAMjxzavM+vpUQs2a0Ag5gTqw9KLuDUnoGhef7RzAXg2I9/FMK9xVc9BSFggufJyU/HdOyWsrU/Jyuwwn7aAvxA1RGyJDOW1UMo1w3UmOj4BaXE0F5mxFxbLHDW4/tdaITeN1+fIDu9qyFHSu0zQizDLxet0+HMS92uaFtNavWBuJ5wUik8YuGBhSOyewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DSSPR11MB9643.namprd11.prod.outlook.com (2603:10b6:8:374::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:10:28 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 07:10:28 +0000
Message-ID: <8f420db9-fb90-42c3-b9d6-8f2fac4d463c@intel.com>
Date: Fri, 17 Apr 2026 09:10:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <maarten@lankhorst.se>, <jani.nikula@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-10-raag.jadav@intel.com>
 <3b6e0cd3-9d8c-42cd-8ca8-f67bb59110d4@intel.com>
 <ad9eW3OlG6vCxOMs@black.igk.intel.com>
 <d0fc86ed-2788-4dd8-8741-88370965b034@intel.com>
 <ad9uZwHL9KFneLWq@black.igk.intel.com> <aeCEShCxfx9hJIYm@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <aeCEShCxfx9hJIYm@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::14) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DSSPR11MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 892056cf-c3a7-43b9-db2d-08de9c50675d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|11006099003|18096099003;
X-Microsoft-Antispam-Message-Info: ROZXs0Lm4je8ImmysG4u9PvHCsmI7f+1c98mAnhVC0mNGpYfJY9hPB+gVLaAisNHF8Xv841MCUy3GcdhLi34u08n9/JjKxRN/o9aCLzN+IDejmp5t5DW2GfbeakwNq3m3fwgxgI3tFHgcUppUixOWyGxcbCDVzJuoW8KvtK4dJ1Ktqf+YxNS6g27lqf4qMuD7WzltLYPsOSGBZAvrKdtylt8fGuz52Kwn61ucqlWxyesvSsYE/Ecwm5QypAFJfkCHbgsN1B2aIE87bDHE8KNaataJr1hB+NWyI/IgZ+GBUyuP/GTkyEi1HDefW2hpzMWdVONVEMvq71gEJVHV4adCUjd1lclYWkXlAr9Y1/28COu2a7kYCR726WROYlMhTcrKpxz3t+f4QG8CUR3EQZUOyXEKS74OvpeJHLB7NK5xJSPhvCN7WK3a2QrsZgbWVKljGijYrhxG7qSvZCOWzjlxTbGpO+3DA8vSuNdgBiSVq/eoNo4wUWBQDCavtpjO4E5gES+zAvyxTjUiOO/CfmrrxvsLAa9xZZ1JBWTaxHh/u2W2an67rnb/jN4JyEMrmQTuO5bmqKHYH131btvF4hfgHlIln0QNOUmR6Fv+XWzz3Zo14daw3KLyuO64wAl4gaKp2hPaQXInMz87BL4aYEI3mI1SvPCwLOBoqUptX2F22xHpAeEWjZs5W6IpjrZ2C7KX5pzgNAjXzC8Tb7dt0pQr9XeudOzbWrRHdzPatpccL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(11006099003)(18096099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZyY25HUW1kODhOUEQzYWtxNzNlQ3QralZkVk1lQ296dndGTVl2UC84WHk5?=
 =?utf-8?B?djVZWlR4bGFXVTJHY1dzQ0dPUVdoVGVkMWY1QUJTOGRDVkpqbEJrcThadjZN?=
 =?utf-8?B?WHNOSXpoNDZJVXF0VDNNWWJjclptSG9qVU1ObFFMYVJMcDJBaVVpQmVjcnla?=
 =?utf-8?B?dkY5RHVxUzJNbm1qckRVdEFtc3B3RDB5c1lRZjVkWnVISWVqNE53ZTBZOEhP?=
 =?utf-8?B?Q3VOYnJza3loRzhDTXlqbXNiVGpCKzlKdXNjQ3FWYmZWaTVkNHkwTnVlOEN5?=
 =?utf-8?B?NmR5aENWQzRiSDk4RjJpOWZTVUUzMjBhMWNHU3B3aTdRSVdiVUtxZk9LdVJC?=
 =?utf-8?B?azdnZTB4dE4vRFNXYW1QUHZSeVhkQXlUS0dIQnJMa3Rkb21CbVA4T21JYmEv?=
 =?utf-8?B?cjg1Y2dWRkU4RTNua2NDZVFVNXBmYjlZVDhPdW9SZFAzVGZ1cWoxTUJjNWF6?=
 =?utf-8?B?dG42azNCMk9QZE1tbTUxWm5ZWWhoUHFvOHVlWTJmbXBJQ1BKNjB5MGt2aDVu?=
 =?utf-8?B?N2VEOWZRUjNXOU5sbGVXZUJLZTV4STh5VmdHZXArQzhZdXYyZWVnbFhqbzhH?=
 =?utf-8?B?UUVUYVZ0TEtveUIrdUZlalVtQnFOSnZBaS9TR3VZeFNkM05GWmJ3TFp2Y05N?=
 =?utf-8?B?Vk0xcGFZdFZ5RzlseVJ3WHVDK1FRTlNtU0hCMVhlL3pkTDUvYlJjVHBjajdi?=
 =?utf-8?B?L1lGK05kRUpodFJ0N3V1ZGdjd2JCYlZpZ1ZNU1JkRVAyOGhQQXVQeWNJNWpR?=
 =?utf-8?B?RFJUSDFRYXYrSFBWZXhTN2x4Y0hKRVBIVGxhcWxZMmRoZ0NGOGJGbHY5NkdL?=
 =?utf-8?B?SDlxb1YwcjFLUVZkMVZGWWRVM1lVdHBqZkR2SWxoeTU2U09YOXNqRlE3SWp2?=
 =?utf-8?B?bFZ1czFUTis3WEQ5YUhoUk1CSXM5RzluY2xaMXhjMWN1OStzTEM2Nm5TZE9z?=
 =?utf-8?B?aXo4dm9OdFB3ZjREU2xzT29tMm96RmVyQm10cGRoUHlWMGl6dWszcmF0OUkr?=
 =?utf-8?B?aERtK3B5Tjc1THZiZWtUVUNkS1JnY2ZRYnBQZDhlcTRKNDlBK2h0Q3pocXJN?=
 =?utf-8?B?NHk3Sk1BRmNSUHFZUkdqTUpadkdsaU5leit1UkxpczhJV3Z0WG9ISDI5ZkJl?=
 =?utf-8?B?NEg2S0tDZ0xwWEc1Zkk4eStLVC9ETy9wR1c1Ui9YSm5zOFg3U1lZOGdId0lY?=
 =?utf-8?B?QlVwK2xySUFsbmdxZkVzNllocEZEK0xNZnFyNnRaeCtvaFhla1Y3Q0syR0xK?=
 =?utf-8?B?VjdZdlEvaUxSVHBJZE5hdzRFdmpBam9weCtIbUtjamJKMjNDRUY2TjI0bkR4?=
 =?utf-8?B?UXFhb1NZNnV0dWNkenZ5b082N05pWHBiMkNSL2VIQW0zVk5jaUw0U25kR2pZ?=
 =?utf-8?B?aHYzUm1qdEllKzJoUVg0c1ZUdm1nODAwaVpTVytwQ3RFU3pjUzIwaW5UTHpU?=
 =?utf-8?B?ZE9TdTJLdFd4RDZCS04rOThnUWQ1YllDdGpObW05eklUbVVHemgramtIRUZx?=
 =?utf-8?B?MFRzYWNDa2NsN0ZXQkcybENwQ0o4OXErTmtPcTAwdTJydW03TW9tOHJDLzRl?=
 =?utf-8?B?K3hKZmVJdVVoVkNBUEJkRXJzaUR2T3hEdkFyMm9hdk9tT2hmUXI4czFFdlhp?=
 =?utf-8?B?Y0VZZ1Ryb0Y1bW1oNnJ4a2lpSlJtYUxpUHFJUW50cWtxWHNqcTlXRUFITjlR?=
 =?utf-8?B?bUJ5dW5rT3RQazRCUk5lYTVxQ1M2Lzh0ZXZoMkg0RDB4YzE2Y0k4amJPTThV?=
 =?utf-8?B?Q1JmZFp1aldLUmFTcnZROWF0NmE1TDh1WW04NHhMblRRaFVzT2dWS1NHK2lm?=
 =?utf-8?B?M0k3d0gyZmx5YXo0RmRHMmYwaEpYQWlGeGxMbndPc0hJY0Jyc2ljcUZmRHZK?=
 =?utf-8?B?aUM5cS9PRUY2cVU5K0F1SldxSDMvSEFnZmF5VXh6SDlyWms2RGZMNUlXUldW?=
 =?utf-8?B?ZGR6NlZaNHNlVmQvRnB1K0pHUlY1eWJPajZtTy9QcUdua3FTNUhXN0xrNXVS?=
 =?utf-8?B?d3liUHhtS3pIcDFYQ29vSHlhU0tJSjNNSHNBT3ZLOTFTNTR4VGZOaUVrWHo1?=
 =?utf-8?B?TE0rbzhKQlBBeHVaVHhOdCsvZSthR1I3YWFtRndkNktubWxaeFh2N0RRNnZK?=
 =?utf-8?B?OE1HN0N2WFY4WTNjcmNEMUF3NktBbW1YRVN6dWkzUk5MZDlRV096UnNReTZm?=
 =?utf-8?B?RXN4cjVPY2xJaDRHVXU5dm8wa21HQy93ZjE5M3NoWkpMQTJubGpGbUdDYVVv?=
 =?utf-8?B?Z2VWWFpPUW5HcEJKTjkyV3VhakV1MzVYc0NiNXgwUXpKUk9NOExodlVtUmJR?=
 =?utf-8?B?b1I0UklieTJYZ0djN3lISk9yYmVVdjZVNG9rcXdBYkIxaG1kMEtqdz09?=
X-Exchange-RoutingPolicyChecked: jybbDSJkE7Qt0RLxV6Ojx2DpCmULrn7/GNf7C3AWsT8VxKfEK32+93xGU3AZVIyZBqliYsFa7RLQIiJxU1cFv8r6AHfE433kLQepavA0dmpOiBLAnrLekQdyj9V7ustZMPsspELHv6abDBC+ooazXlCsM6g3iTpz0o+f+/Kezd9uKboSXE8O7zF4OE6l7HwRDwMTPHE8+JRcsUotFXIwi2gnCuMSR4syBmFbp+59NAYSGM3sBWfq+R36j0kcktOgmOtEplBieYZkajTC9xI5dlgnCQQQw2cAZtjj5UC5VIg2qmO2J/6gLXynFiA/7g0swe9IzejN3qtOuL7uBEL/cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 892056cf-c3a7-43b9-db2d-08de9c50675d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:10:28.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MTIYzMLL2oWuHNva+EQRwPOY4CCuZZ6B6+0UY1DW/Gr+pv2e63KqxWbfUAZ+wNqq6iLIdzdH7mIzxcEDZ7UUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9643
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


On 4/16/2026 08:40, Raag Jadav wrote:
> On Wed, Apr 15, 2026 at 12:54:37PM +0200, Raag Jadav wrote:
>> On Wed, Apr 15, 2026 at 12:33:41PM +0200, Laguna, Lukasz wrote:
>>> On 4/15/2026 11:46, Raag Jadav wrote:
>>>> On Wed, Apr 15, 2026 at 10:43:53AM +0200, Laguna, Lukasz wrote:
>>>>> On 4/6/2026 16:07, Raag Jadav wrote:
>>>>>> With bare minimum pieces in place, we can finally introduce PCIe Function
>>>>>> Level Reset (FLR) handling which re-initializes hardware state without the
>>>>>> need for reloading the driver from userspace. All VRAM contents are lost
>>>>>> along with hardware state and driver takes care of recreating the required
>>>>>> kernel bos as part of re-initialization, but user still needs to recreate
>>>>>> user bos and reload context after PCIe FLR.
>>>>>>
>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>> ---
>>>>>> v2: Spell out Function Level Reset (Jani)
>>>>>> v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/Makefile          |   1 +
>>>>>>     drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>>>>     drivers/gpu/drm/xe/xe_pci.c          |   1 +
>>>>>>     drivers/gpu/drm/xe/xe_pci.h          |   2 +
>>>>>>     drivers/gpu/drm/xe/xe_pci_err.c      | 160 +++++++++++++++++++++++++++
>>>>>>     5 files changed, 167 insertions(+)
>>>>>>     create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>>> index f9abaf687d46..06b5d53e1629 100644
>>>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>>>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>>>>>     	xe_page_reclaim.o \
>>>>>>     	xe_pat.o \
>>>>>>     	xe_pci.o \
>>>>>> +	xe_pci_err.o \
>>>>>>     	xe_pci_rebar.o \
>>>>>>     	xe_pcode.o \
>>>>>>     	xe_pm.o \
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> index 150c76b2acaf..b743b3986205 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> @@ -482,6 +482,9 @@ struct xe_device {
>>>>>>     	/** @needs_flr_on_fini: requests function-reset on fini */
>>>>>>     	bool needs_flr_on_fini;
>>>>>> +	/** @flr_prepared: Prepared for function-reset */
>>>>>> +	bool flr_prepared;
>>>>>> +
>>>>>>     	/** @wedged: Struct to control Wedged States and mode */
>>>>>>     	struct {
>>>>>>     		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index 26eb58e11056..f3515c91e534 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -1332,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>>>>>     #ifdef CONFIG_PM_SLEEP
>>>>>>     	.driver.pm = &xe_pm_ops,
>>>>>>     #endif
>>>>>> +	.err_handler = &xe_pci_err_handlers,
>>>>>>     };
>>>>>>     /**
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>>>>>> index 11bcc5fe2c5b..85e85e8508c3 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>>>>>> @@ -8,6 +8,8 @@
>>>>>>     struct pci_dev;
>>>>>> +extern const struct pci_error_handlers xe_pci_err_handlers;
>>>>>> +
>>>>>>     int xe_register_pci_driver(void);
>>>>>>     void xe_unregister_pci_driver(void);
>>>>>>     struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..339e8688d37f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>>>>>> @@ -0,0 +1,160 @@
>>>>>> +// SPDX-License-Identifier: MIT
>>>>>> +/*
>>>>>> + * Copyright © 2026 Intel Corporation
>>>>>> + */
>>>>>> +
>>>>>> +#include "xe_bo_evict.h"
>>>>>> +#include "xe_device.h"
>>>>>> +#include "xe_gt.h"
>>>>>> +#include "xe_gt_idle.h"
>>>>>> +#include "xe_i2c.h"
>>>>>> +#include "xe_irq.h"
>>>>>> +#include "xe_late_bind_fw.h"
>>>>>> +#include "xe_pci.h"
>>>>>> +#include "xe_pcode.h"
>>>>>> +#include "xe_printk.h"
>>>>>> +#include "xe_pxp.h"
>>>>>> +#include "xe_wa.h"
>>>>>> +
>>>>>> +/* TODO: Extend support as a follow-up */
>>>>>> +#define XE_FLR_SKIP		(!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || \
>>>>> Any known issues on integrated platforms? I checked it on PTL and didn't
>>>>> notice any problems. Everything seems to work fine with display disabled.
>>>> Thank you. Can I add your Tested-by on this? I can include integrated
>>>> in next rev with it.
>>> I triggered an FLR, which completed successfully, then executed
>>> xe_exec_basic and xe_exec_store and both passed. If that level of validation
>>> is sufficient, then feel free to add my Tested-by.
>> I think it should be sufficient for what we hope to achieve in this
>> series, which is re-initialize GT enough to run new workload.
>>
>> We definitely need wider coverage, but let's take it piece by piece.
> Daniele confirmed that there's still some work to be done on GSC and PXP
> pieces before we can allow this on integrated platforms, so this is likely
> off the table for now. I can still add your tag for discrete if you're
> okay with it.

Sure, you can add it.

Lukasz

> Raag
>
>>>>>> +				 xe->info.probe_display)
>>>>>> +
>>>>>> +static int xe_flr_prepare(struct xe_device *xe)
>>>>>> +{
>>>>>> +	struct xe_gt *gt;
>>>>>> +	int err;
>>>>>> +	u8 id;
>>>>>> +
>>>>>> +	err = xe_pxp_pm_suspend(xe->pxp);
>>>>>> +	if (err)
>>>>>> +		return err;
>>>>>> +
>>>>>> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>>>>>> +
>>>>>> +	xe_irq_disable(xe);
>>>>>> +
>>>>>> +	for_each_gt(gt, xe, id)
>>>>>> +		xe_gt_flr_prepare(gt);
>>>>>> +
>>>>>> +	// TODO: Drop all user bos
>>>>>> +	xe_bo_pci_dev_remove_pinned(xe);
>>>>>> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int xe_flr_done(struct xe_device *xe)
>>>>>> +{
>>>>>> +	struct xe_tile *tile;
>>>>>> +	struct xe_gt *gt;
>>>>>> +	int err;
>>>>>> +	u8 id;
>>>>>> +
>>>>>> +	for_each_gt(gt, xe, id)
>>>>>> +		xe_gt_idle_disable_c6(gt);
>>>>>> +
>>>>>> +	for_each_tile(tile, xe, id)
>>>>>> +		xe_wa_apply_tile_workarounds(tile);
>>>>>> +
>>>>>> +	err = xe_pcode_ready(xe, true);
>>>>>> +	if (err)
>>>>>> +		return err;
>>>>>> +
>>>>>> +	xe_device_assert_lmem_ready(xe);
>>>>>> +
>>>>>> +	err = xe_bo_restore_map(xe);
>>>>>> +	if (err)
>>>>>> +		return err;
>>>>>> +
>>>>>> +	for_each_gt(gt, xe, id) {
>>>>>> +		err = xe_gt_flr_done(gt);
>>>>>> +		if (err)
>>>>>> +			return err;
>>>>>> +	}
>>>>>> +
>>>>>> +	xe_i2c_pm_resume(xe, true);
>>>>>> +
>>>>>> +	xe_irq_resume(xe);
>>>>>> +
>>>>>> +	for_each_gt(gt, xe, id) {
>>>>>> +		err = xe_gt_resume(gt);
>>>>>> +		if (err)
>>>>>> +			return err;
>>>>>> +	}
>>>>>> +
>>>>>> +	xe_pxp_pm_resume(xe->pxp);
>>>>>> +
>>>>>> +	xe_late_bind_fw_load(&xe->late_bind);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>>>>> +{
>>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>> +
>>>>>> +	if (XE_FLR_SKIP) {
>>>>>> +		xe_err(xe, "PCIe FLR not supported\n");
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (xe_device_wedged(xe)) {
>>>>>> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>>>>>> +	atomic_set(&xe->wedged.flag, 1);
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>>>>>> +	 * update data structures and cleanup any pending work to avoid side effects during
>>>>>> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
>>>>>> +	 */
>>>>>> +	if (xe_flr_prepare(xe)) {
>>>>>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	xe->flr_prepared = true;
>>>>>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>>>>>> +}
>>>>>> +
>>>>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>>>>> +{
>>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>> +
>>>>>> +	if (XE_FLR_SKIP)
>>>>>> +		return;
>>>>>> +
>>>>>> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
>>>>>> +		return;
>>>>>> +
>>>>>> +	/* Unprepare early in case we fail */
>>>>>> +	xe->flr_prepared = false;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * We already have the data structures intact, so try to re-initialize the device.
>>>>>> +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
>>>>>> +	 * all VRAM contents.
>>>>>> +	 */
>>>>>> +	if (xe_flr_done(xe)) {
>>>>>> +		xe_err(xe, "Re-initialization failed\n");
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* Unwedge to allow userspace access */
>>>>>> +	atomic_set(&xe->wedged.flag, 0);
>>>>>> +
>>>>>> +	xe_info(xe, "Re-initialization success\n");
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * PCIe Function Level Reset (FLR) support only.
>>>>>> + * TODO: Add PCIe error handlers using similar flow.
>>>>>> + */
>>>>>> +const struct pci_error_handlers xe_pci_err_handlers = {
>>>>>> +	.reset_prepare = xe_pci_reset_prepare,
>>>>>> +	.reset_done = xe_pci_reset_done,
>>>>>> +};
