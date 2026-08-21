Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296C7C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 08:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46EA10F26D;
	Fri, 21 Aug 2026 08:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYwBAyTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990210F26D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787301295; x=1818837295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8T6uTHqOMKh2gCMSmMYImgdCBuw/DVivwt3/CowBtCc=;
 b=LYwBAyTQroGmtSSqh/EmejqmdeqWYPpaoNRYURnR0JPJa/w7rcaDMDd4
 3pmVlbrj/qaCCNvQxwF5QeITFUWSWW3TaGTgI2WphR2KSLgBmK/UZZc07
 Bkx3UI4uH7JgNwzSvEjaOn72TQLLwln8uAKL4Rx+Zd9ZogE9zIKQun8ki
 k32R2Xz6AMJfYUJHgivfnb1G6Jx6YwU4AIFz9dYS3Iyv+EJpcVgLF2/3f
 x/hWp4g6QIlQ6wlr6srEAAZoGztX/CZPpTWPmnDxf+IPGulvFlsK3Pg4f
 VclkQtarGQpck5efxPFIdqgAz0nDU69k+l2UNPz4VBC6VUyDtHPB4ncII Q==;
X-CSE-ConnectionGUID: lMx3snYlQSq6W+jxIX4EbQ==
X-CSE-MsgGUID: AIyerO6xTlmRgr+TW2mG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87907716"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87907716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:34:49 -0700
X-CSE-ConnectionGUID: ozQiTLy3QM6fVvzPlARuXQ==
X-CSE-MsgGUID: lAzzk3z3RMCNi0Y+xrKC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="296183002"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:34:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:34:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 01:34:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 01:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkBu0vTmc8E+6Oe9v1Qv65L3bNYTJYzIizsI37hDcZXQkxLV2h62QKGD1+I2zuCrgF1aq9HtWqLmF6prpPgnsyaPSQxNK2DfTM8hn1m99o57Kwx22TKI74Z21Ji/Hh6o6t6qoLQTf9DMuyCghWENw7ABpPwToZLOyv6dViX+Q5N3Sjy7ToWVHNRn0dGp6yfmSS51q+NjAqOKsFvEGNlDqN4LzyUCA99Qu9aHa4wot7Ot5kW3Lh51uZUE+53tB4if188Unsbiu9ZuG1XBCEFecvBlhD1nBEAWkFoxtx65csUK4qJsIZBXYyYZzoLTOpNIUzzsigVk9sRlsplf0SNpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwEnqTlv0rsOgGuy+yIV+6H6CVxTfgx9a0rrDIulL/s=;
 b=td/QljOjo5kJFiEVGpGT1bW0LrAE2G5JEkOWRsSKsbhpbJ7rZtWqEoaRLg6CEWN40M3X3rPoaWuQN6fSvIlAPIzYLct8G+debXReT6RfVoPNutS23tt1jEHQZ+29alG09CG3UQIIbDfb+qbS+M79xf/EjSzRHHfqmsSBKaEafqR1udIDpmXCWClfFc8PY1LEYjxIqiaIPNwkZxSmK5/2k4pjrnAJrhwZx5YYjxLMeuqn7i0JAXQPtPuT5tBlOszkIaMTwTcRLYa+qKnmthwqzELB7Ql2a7hH3ReTglny2O/rtzOq3sYG3eFzgUK9s6meldBnP4c33azg/icMGvdApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 08:34:45 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 08:34:45 +0000
Message-ID: <aecbba8e-4bb7-4da7-9597-13bdacce1fd0@intel.com>
Date: Fri, 21 Aug 2026 10:34:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,10/10] drm/xe/doc: Wire up PCI Error Handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260701083051.450259-11-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260701083051.450259-11-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::16) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SN7PR11MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c373af-d27b-4ffd-3f96-08deff5f0dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wtvF9L73uVEcAN7NVGWGr0uOYWgs7d2+QPb6UaLSz+mr3lsxbYPrJORjkfcUZ6981AiO85/ZoAg35UFOWjTdlWUW5cSLwFOAeAQhTAcjBFsiSbviEQQZfQazKkFg7rouFZeGzb6P6dBgkZzlWoC3xT6CXtsKVdxGFxSQIXMTx6P+ZpgqC5Wmmt8/n3Fos8/xe2tdxZw+L1EollSyWyIE1am6ICXMjL7fHDvC2gXSVP8hrSU92/roG2/EdSK4Mb0CmMSbbRG8ignv/volAKAiqh0FgsWQlJ13j1espelsq3GreLq7JvrEZQWKupSX5Tn2f59JrAjFDK+jMYrjSOiHdPG6OBElmcJVPYzhEAONB2dhRM3oWB1DpXqIRbn85750Z4iXhtq5x+OCJZnkixYwOtlPQqG8pa6hTwRkx+arD4SlTYs92Bru4cxB7OpBnqcwSnInoLlPbT51JKuugUtxiHgt5Uz4rpTYe6oSMaGtllHZR1pOPLWkEz6DHBnTjaviyzj9CyAUKMl6mS2HkP218Tq6NRD7mJ+f2J2h/TxBQnncr0Pytccl8qW3tALaXYDFZFFvUKkAMJTRX0IN2qkaQa4CBlygdCPCBuE63us06W65Dg6500a3cjLOcDq4kZ52aMo5+bUodjDq1L8dGBIte6Oz1+T5m+5w9Je354KCXNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3dEUDFzSU5KMWdSU3YrK1ZLRWQ3UnNzSUg4Y3VPU004NlFBaEUweGVlOXYx?=
 =?utf-8?B?NVdVR3lPOHhiNnRtUFgyMjl5bWZQKzJuRWxubjgzcWRyZTBwclRpKy8vREJN?=
 =?utf-8?B?MVpjcEcyd2o0Q24vR1FxM2VBdUt1eGd5S0JjL2NyODVQUERnU1ZleFBaQmJD?=
 =?utf-8?B?OXBYUkZhd3FxcmRXeEpuNllweWs2NGE3OVVJdG5EZStxWnIzTlppcnQ2bFYy?=
 =?utf-8?B?UHpYZVJCTGRMTWZKcW5KOVdEQWFrNStzVCtGMG9aNzE5ZWVqZGx2WkV0d1lz?=
 =?utf-8?B?ZlBIUWdRVXhVMEZRcTI2bmJISXRRZ0ZuYUdha3F2cTNZV05BRElESWRwUE16?=
 =?utf-8?B?aFVHVVZrYWV5RFlmQVNOSTJwZHNEZXAzYUZVamgvakVucU5TTXJ6T0htL1JX?=
 =?utf-8?B?Q2FKVnE4VW1BcXkzc05vcy9OdU5QR3o5OTNwVmtNWGgyMWRoNTl5Q2Y4Z2pz?=
 =?utf-8?B?bkZEZVBtWEMxYW1ibExac05MWGVieDZGenZnRzNlcHE2d3JCczN1N1REcmJ3?=
 =?utf-8?B?OW5QR1RIaG1hMVE3MzRhUVlFb0NqNkpZOExqUXZMckp2QjJJMHZhc0ZaeERD?=
 =?utf-8?B?OUtYZ1JYN0N3ejdJQmNFUjJoTUhaZUNHdmZwVW5WRXRJTmdYT2tsKzlZa3pQ?=
 =?utf-8?B?UGpmdXpvZngwUXN0bkZtT2ZtM01BMFFlZW1GR1RzNEZVclg1UWpIczFKeGNP?=
 =?utf-8?B?VHozTzdLdkZSZHFJKzJJdWR4RC96cmxyOHZJMFl4MW8xYitrYTVteHU4UEdP?=
 =?utf-8?B?Q25JV1RKanpoR3JrNElhcm1OS21GbndrL3BVTUFRbGQ3TG9sbXVwSnZWazFL?=
 =?utf-8?B?OEhQc1E2c0s5SDZKWGJqVUIwS1FGNGFrdlFJZzEraGhjc3JVRGFRS2xaNXZs?=
 =?utf-8?B?TWQzZ2FYOUVxUHBhRWZaVzFkSWQ5U3VwaFVMS3V2VDhtdVNHd0NiaFA5bmdE?=
 =?utf-8?B?cFlFVjhTZUI1dWF6OVgzWEY5S09qNGhtRGpBM2sxbU11Z0ViR0pzOW1lcmtH?=
 =?utf-8?B?NDFYRi9vd3NEK0dKV3U0VUlNUTF6TVJGa1QvcUtkOVg5V3c2TjZCSzJlMzh5?=
 =?utf-8?B?RXg2OWpYc09QZ09odkQ2RlVQMGRhQUpLYmJMQzdkaU9pS2MwcDdXNkgwdml0?=
 =?utf-8?B?UzJSemRxdVZrNVdSUENza2tISXJrb0FnRWtjU0hnSDhobUFkdkUxcFhOSzZT?=
 =?utf-8?B?ek51VTh5N3dhUFBGUEdHK3M2SGRsZ2VCWHQ3ai9SdnBwYXgzQ1FseUFBc2Rj?=
 =?utf-8?B?L280R29aaVNvcVkzQWpNblJJK09QKytyV25Fc2k1ZmVWelRkOHk3Nkh4NWZO?=
 =?utf-8?B?UytiWlNEZFB3N25YZHNUL0J6Lzh5WThybHQ2USs1OTkzQnMvUDYvbzlUVjB2?=
 =?utf-8?B?TEdBeXMxRkV6MWdVOFBBUDQrR3RUNzNqekl3c0lRTFJiU0JzNDJIRHRYa09z?=
 =?utf-8?B?SUMvMlgvWVo4bVNUTitPZmtmSENSNnY1cVVYdG1SWk5oVFpEUVN3ZUVzTVhn?=
 =?utf-8?B?TUxPOWVvUlV6ZmtpUUphV0ZoRDIwbStDeTVXKzJVL0N1cDMrOGJjdFpDUnoy?=
 =?utf-8?B?RnN3SDQwcnhnNUJBZ1Fnam5US3VGZUtXUDR6K2pFclJjR1hsUFBMMTBtRUds?=
 =?utf-8?B?SmI0VXJaV1lQQ3k0TUFVZlVtL2swb3prV0xqLzFMemhyd0x3YkZyUDlEM0Uy?=
 =?utf-8?B?Um1oZWRDNko5ZWsxcnVaZGJzMGpPNTErVTFxN2RHOTNyZExieWpHT3EzSDBs?=
 =?utf-8?B?T3JxNlk4UEpxSVFxZzVYU05TMDNpUTE0dHJ2alBDVHJvMnNMdXp3cElPbnI2?=
 =?utf-8?B?N1haS2VINDg4TmNRNHo3QzgwQnJUTzBlcGdvVm95OXl2Qkplc3ZtWnhRVmh3?=
 =?utf-8?B?bHlCUlB1L2MxcithK0JqTGRRelZWcXpCQVRDNW81VTZZSFdEeldvL1pIZnN1?=
 =?utf-8?B?YlhzS3IyK1N2VUQzRlVhR3QvWHpmMWx1ZXJ2UldZMVh2cU5OMlc2emZ1T2ps?=
 =?utf-8?B?MnJuNERPbGhsL1hKdk5ycDFHNk5SZXZVOHhOZlpIZDc1L3pvSmtmRE1oQnhv?=
 =?utf-8?B?eWdQM3hTUEVrQzJPYkZ6WHpUV1ViT1B2eCs2Zk52TFFwRUhaeWtEamVCT0Rh?=
 =?utf-8?B?a2pMTSs2UFBIemVZeTZlQ3psM2h1QzQwc0pESUpKeVBZR3JKNGVBNWtjZmJV?=
 =?utf-8?B?MkcxK3JVMGxLM21OS0xQK3FkaUtrVzFrZkRnUU50MklNbXNZV3VjN3liS1Zm?=
 =?utf-8?B?UDhuTWF3YTNoMWRPdVJvbGNzNWY4Ymx5Y0cvRWpGd1EzK2hqUEtZVm51VzZK?=
 =?utf-8?B?QndxYkdrcFd2VExzN213cGxFd0ovTEF1Z0NVMmNLdS9wNHJUMk5CUT09?=
X-Exchange-RoutingPolicyChecked: Wh4ItvSPaBKkzQ0VoZ/gC4C0EqgDH6lg/XD45v64k8AvkE1yNvBPPrWqP4O/47CaFTlOj6sfj5Y7mtYFBbKS1J82I7TacajhD/oFBmE8pvTmAzBG2D2fKRjRkdKsbcY8Y+0XUmuNcSJDcILUDnUoMO909GNDekkzTJkyreZ9HCS0eeOxO0q/dyWAK84v5fahnHfhAvcjjPmS/szQM4ZjONslUFnnSh+7agtlgn4wHDAIz7nan6iQHjTs+/+ApPFAFOmYEK7O7FBnaJjG3HH4rnMmG5Di7Ncf+7I4UZRJocg7MLTmVMw0PCKcQ9FYfj3tGpkbP/tprFNxyJaQbY+LdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c373af-d27b-4ffd-3f96-08deff5f0dec
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:34:45.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9Qc8/IqoB5WBjWRSBlUs+VlK3tJ6R/qJKTdDwfHPOTTy4kUyjkBUk7i8NdTm1riio0crLe1keN5YdmH73FQqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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


On 7/1/2026 10:29, Raag Jadav wrote:
> Wire up PCI Error Handling documentation.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   Documentation/gpu/xe/index.rst        | 1 +
>   Documentation/gpu/xe/xe_pci_error.rst | 8 ++++++++
>   2 files changed, 9 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_pci_error.rst
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..e5acf299a897 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_pci_error
> diff --git a/Documentation/gpu/xe/xe_pci_error.rst b/Documentation/gpu/xe/xe_pci_error.rst
> new file mode 100644
> index 000000000000..25cc5a8adf99
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_pci_error.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=====================
> +Xe PCI Error Handling
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_pci_error.c
> +   :doc: Xe PCI Error Handling
