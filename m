Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E6BCCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250E410EBD3;
	Fri, 10 Oct 2025 12:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMw3ueFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F56B10EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760098501; x=1791634501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eR5IoT86K/kdOdf7bnXAChzux8s3hPw4qIxWbdUq2GE=;
 b=iMw3ueFqRAvUS355PoqQATFfeHQU7qxLQF0bJlyulbpbGqaQ3ulXxdeC
 QB8FFqrmfu3yAcj/5NkmFwDUjmnFeEU2fCZiDYQt82NfZIr/B5iGqktlW
 6yx2zbYMgZtghLa/do14WBdxlC7xJSXMy0Hljd+izpCrJZ4LtfOR+GIxg
 IYP/96W3rT96Ll8xJHcLCh7J336td9qEW+UPfEozv9OsU1oRio9FYvEPI
 2j/DlEEfR9117nes5sRv/e2qEbQkTRNsh8wu7nj3bgEId9yKIW3Is8fcF
 RQvX90wLciLfvh/HNp+/ni6yWsUvuz46uitiVfhGQzVnfxWJtuGXDxSdq A==;
X-CSE-ConnectionGUID: OcNsIUltSwOejzc0UMrScA==
X-CSE-MsgGUID: pyQrvGGJRrqbKlRfkT8KwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62216617"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="62216617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:14:40 -0700
X-CSE-ConnectionGUID: QLwA/5/JT02uIBSj8MkPPg==
X-CSE-MsgGUID: bG5D+/n6QFCa2B5Q5FZRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="186093595"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:14:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 05:14:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 05:14:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 05:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ1gMPRG+VrU4MacU5VVVzXDsMUXnGBqClcsMIDnmG2/JxgcaWfUzOGReZudg21t6FC9RafEsdT+0HQfKtm4RFj17MmoUBAUuQZ3Fx4NK128kh2yglSJTVPbw1fA1sYqMsSHtkJuCCbkW0nG0KB6XjmBEAgnVwJxh4v381WscliKhed7/fxBUNZeRxrdMdQn2zLpuAErJ+XlxR92s4s+OLfsHmp5Xg6uz7Mgamj/HibFkJD6XDsnAQ6C1vfszP63ekBgLu8VxKcXSYC/Je+5pjSFK0FnT7l5p8/N8H4k0ZI6bz95hrTaJgjKs6egDINGMd86sWZddNROS32u6+2MnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkOOmrgQNuqFWlpaP380IIoxhi9RB0eCQQgt6Afp6S0=;
 b=sw3HYlnF38JcU7YIsQvBHpvoM3jMeYaGWByWgYcxH9JbQY/x0/89valzd3XeAW5q+hxOhAKYLiuFgIURJWtabcq5AmbFfG/CaK+B25CnIru6CosVMsMoLDf+4wOswdZqWaL5wOuF6MfkyYuGyYdaqNEfslxONNUVXMU8oKIAlt/hMPS3M3shEsOJkfEY6rGPpLFBuul6o/et7Yf//VpFQUS32d3eYDgh5FFSr77QeZK30mM1Fv1N31H3Ss/K9dK9VUrvkk3oHSH9B3ayzFMPUewlyrR4TA4vD/BYaeEl6ugAyF3eD+c8efF1NJRQLqsedJQcR6tiLVI3KzfG3RTxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 12:14:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 12:14:36 +0000
Message-ID: <cf28a7e3-5924-4d34-a8cd-6908dca5fe6f@intel.com>
Date: Fri, 10 Oct 2025 14:14:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe: Only have a single drmm release action.
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-9-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251010120655.1046007-9-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dcb220-2ecf-4d3e-6ed0-08de07f6942a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXZaRHVCc05qZnhXcXZYSGMyMlJ0eVFvMXozWVJ6My9FdUtlY1dHeHVXdGJt?=
 =?utf-8?B?c0lCRUZwNTg3MWRsZzFMeXpVV3NnanVUR016ZmJod3JSbkpZT0ZTUVc4WHkz?=
 =?utf-8?B?SG1hbGQ1NUZqTE5WNElCWWs1SWtVUDJsbGZRRkk4LzU1NVhEVVV0bllYaXN5?=
 =?utf-8?B?c2tibC9GMEYrQksvUGpHYkZHNGtkajVqZ0c1MHJxOEhWNVF2czBaOWlyN1Yw?=
 =?utf-8?B?TEpxV3dGR1BlV0xidlp3RTV2d2o4LzdDZXp2ZG9yTlNNQnk1cGE5ZHpCVktR?=
 =?utf-8?B?bU4xK2tIQzU4M2JjcDIvNXFsTW9vWXhVRCs5U3JQRU1xR1hZRkFOYjA1T2Nw?=
 =?utf-8?B?Titub1BvMCtYQ1F3VHJTYnJKQ2VuNEpNWG4xaDkwV0lJemNHdE1EYmZtMno0?=
 =?utf-8?B?Smk4bXFKaWpDMjNKTkpOTlRHbVNiRGR6WDFDL3VnbFNadi9aZU9ibXh3VUFB?=
 =?utf-8?B?QWNqamprN3dxWEw1Y2g3ZDM4OEpQVElFUHNzZ3JJK1hCbmlma2p2RVhZb0FJ?=
 =?utf-8?B?SnZ1WG0wckgrdmtmMHdIdldGcmkzbWI0V05ibXVFSWtYSVpHUXFqNnlsTlRs?=
 =?utf-8?B?ZU1LN2g3MzcrYkFCRTRpd1ZXVDRiRFFEbkplRU1tbzJ6cURjcFFFOGZrQUNl?=
 =?utf-8?B?dGpnZitoUW5zaU5janowQ0VpSHo3OE5OME9HTWsyb21FQkVNRmtrVlhrS29U?=
 =?utf-8?B?VHNvNFFCUW84SGxtaWtIVlF5SUtaZlJKTEZ3MzBNb2hCaHNUdjNranlsNStV?=
 =?utf-8?B?dVNyNmNkNHRWOE5NU0NLdC8wT1ZPdEM5TElMNDBrZkVKSjNKS25aMWlKZGNP?=
 =?utf-8?B?cmx5WmhEbVdiZ3RMRzREcStOSkRaOUplQmZkYkdIVzJmbjhoSkppMTE2S2hy?=
 =?utf-8?B?MmQ2Y1RnWWpGa0haVVJzY0E5NjhlV3NZUWd1R3R3VWl0cmVvb0FzVFZjNGU4?=
 =?utf-8?B?RDdhMVlKa1M4Ui9ZSEVEYml2TzVpQm05QnNldFFxazdhN24rWjM0YlVWVEsr?=
 =?utf-8?B?cmQwSTFzMzdYNU9NZHpYZ1Y3T1ZWMUpIaGxyTzc2K0lwQkF3ZnRZNEx0c3p4?=
 =?utf-8?B?d2JqMUh2blkzM1lVR2RpY1RSUEdsRGthd3RmQ1JLWW4yWHhYL3lQdmw4cDJt?=
 =?utf-8?B?VHdqOWdrZ0F6Vm5zL1BrbkgyNndnNHcyYzYxdS9HUnBpbjZtdUhrdXZWdXJK?=
 =?utf-8?B?MUEvZG56WDJqZ0RxMzNrWEVzSUw3ZG85Rlg5eUtybzN1Y1NROFVKaHhHSEZN?=
 =?utf-8?B?MUtuMXBoaEJKa0pES2RhRWVRdFNEb2l2THVwOTZPdzlQbkdxdkVuNGpXcmo0?=
 =?utf-8?B?cmFZY3d0NU1rNmdrLzRjR3hzRkYvLytOb2hCcDlVQjRJUDVkWThkeEVjN1BE?=
 =?utf-8?B?c3VaeHNlTW5uWDBaRHJkVFU3Nit0dzlud3FWbFE3dmtNS2sxaFZCOVFkWWIw?=
 =?utf-8?B?NlhTTW96blY1NTZtVmZ3ZEpDcWdYcjBZZE5RS1pRYUt1NlhtV1NIUTlJZEhz?=
 =?utf-8?B?N3o0VHZabHZoRVJWOVdzVitLRmpxNnVVNTI0NXhZR2ljWVVLTGNITmhXL082?=
 =?utf-8?B?WGVzR3NUeDJRM1BnOWFQWDd1YVR4QXkvdHBleGZ0cVgwTXRzcWxPVlJPTkh4?=
 =?utf-8?B?dzFiMGVoR2lYc2dVV0syUWZrOUs1T0wzYThVcGlxZEJuSDdya1Z3L1M0SzNz?=
 =?utf-8?B?eXJDNUNsc1kvNXhqdDhYUXg4WENDWXNXVFd1WHFwV2FxRzUvQjBWSXM5aDd3?=
 =?utf-8?B?UEJIZm5aVDdhQWxkSUJjSm54SlNMcjFHak5JU3UzTFVIM3Fldk16U0pzQ0lD?=
 =?utf-8?B?RVVMK3g3YjYrdFgzWmg4SFhZRThRc3NzcTRqQ2Q5NGR1dXA2UjJsNnFRNHZq?=
 =?utf-8?B?YWMvSU82Q0xlcE9JYndDeUJpRVpXK2ZuZ0QzS3ltZzhZdjhUTGNrY0ltQW1J?=
 =?utf-8?Q?wZMkmoBOv8eVqV9yhlY8fWA+OV1IOTl9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXFLcEdra0xwNVZWRXl5ajZsOThKc1pBZHFzR29YV2FrOGxrOG15d0dNZ09C?=
 =?utf-8?B?Qm9lcXF6VGtTQVpzNzhnRE52TGRRdUYvSUYveFNpcVdocXdnRFY1dEpVVUNv?=
 =?utf-8?B?R1lHMWVXRmREVlBhWDBoNzMweHJKMDRhZWFhaC9tN0RxL0UycHg4bDVwQ3pv?=
 =?utf-8?B?QTdOZWl4eHR1YWZBd21nenRwaUpmclhCZUNmRm41dFFPWllCN1d2UFgzQlVU?=
 =?utf-8?B?QTVSeFJNemQ4eGpHWHk5eWtPNDlzejExUWFmT0h6U1BkUTNaTG54WkNvUXJt?=
 =?utf-8?B?dEZ6MjBKSVczd01JVFNhcUZIU2NvSUpKRnJ0UUk0SG5HWVVPVFhITHR2aDQ4?=
 =?utf-8?B?TXF3a3RlclZ3K3l6RG9rTjBrV1J2c1ZCeldHRURkTjhmUjRvaUNFOW1HMDlw?=
 =?utf-8?B?N3FkMVJxZTFYUzZlMS9UcUFFL3VNaEw2UHIyVVBQdThFQ1IwODlLc29SOUJR?=
 =?utf-8?B?VUVaQ1JQTWpyWXVJSDNXMVBuR0w1T2dKVHdpWjgrcTBLcHhJb2VJcXUzc0VK?=
 =?utf-8?B?ZDRXZE0yY2tjaVdXSUV6MG9PdW1Ud1pWWWkvSENOWHRldklMSFNDSlA5UXRi?=
 =?utf-8?B?Qzk0akFwSVdNdWJPbHgxNjZoekloWGFlVWUxOVh4aDVRSG9tampBNWRwNHly?=
 =?utf-8?B?UmJxUWZDMFN0ZmJzOUNEdnRoK01FMXdMQVNUYzVtMDVSak45RE90WUN6TW9C?=
 =?utf-8?B?M2pjNEZnaGg1aStvYlN4YVV4MXBmWm1GT2xtSVAxb3FBUW9BMmxxNU1DS3hV?=
 =?utf-8?B?ZVd5MHlLM3IvM0xTYzBsNG5odzlKbitwSXZhZWNZaWdHb3MydGsxVVNmUnhN?=
 =?utf-8?B?dlYya2dzTWJSYVRham5jK2ZKTnQ0RXRYbDNUc0d2NUJ2b2ZHNHNOMXpqOEtJ?=
 =?utf-8?B?RGVpNFVvRTcyektFQjBpWHlTWE9ZZ2c5SkI1aUtZbmVyZjRNd3hKRFpTZmI1?=
 =?utf-8?B?ZmNkZHpBVnYwVmhaU1lmSW15WEl3RWVxUlFvVHdTQTNJcjFSbkVCN2R4N3dw?=
 =?utf-8?B?ODFoaCswdVV5K0RFTkt0MmRTdS92bVlwNERlZTR3bVZ1MzlqbkVuakNoMmFq?=
 =?utf-8?B?THpUa3lNTnJiYmRPR21Sc2lZcitzYzRaQ21oSXY4UjBxdEU0OHQwZDZjWmd2?=
 =?utf-8?B?eENJV1JiRG5qVHhTOG5PTFF5TjFTYXREYkZLTTVrY2RSTTZtVk9KVnd2eEN0?=
 =?utf-8?B?NVB4QlQ0TW5wck8zcmdtQjUwbUNaemdSYUc3dkVXOVA0OUZRaDZKcEgxQ2lS?=
 =?utf-8?B?cCtVSlFuaFFLZ2xKcVZEajVrRDdzWlBySEdpUi8vQ0trTXpEb0FWMFZOVXhy?=
 =?utf-8?B?ZHpOSmR2RnZJYTNodTJhUVB6b00vclZGL1JOUTJyekxFTWJGZTZxR0FuUTNR?=
 =?utf-8?B?Q09CWW5hSlJ0VjBEbU1KZzVBOUEvV01BZG5zNjg5ZHVzQ3Z4QTZ3UzVITzZa?=
 =?utf-8?B?OThNZjBGUkFKditVOXJMbmRLNDRoTC9RWWlOcGI0TTErTnNYVlFsRmh0UmZK?=
 =?utf-8?B?WjBHUkhsVk9PQU9LeVovWlNjY0Q0MFdBckF3dmt0eDBxbXprNEo4NkUwcUJG?=
 =?utf-8?B?M2x2YmpPMVRIME9LUzkzRXgwN3BJbmtCdjBKb1Q2TXZOZnUrT3YzZjRxV1lO?=
 =?utf-8?B?VEx1V1JpRHdOS3VMZ29pSGhoRTI4dTBzcWQ4cVp0N0tNcFFsR2FGcmZ4bXJB?=
 =?utf-8?B?THpTdXFZOXoyNWRYbWdueVVmc1ZUSy9SZUpab3dMS2h3SWt3cTYzUjY4VGtT?=
 =?utf-8?B?UnlIWXhBbG0ycEJMTVVSTTVrakx0TnNRcjhRTlVFVnEwdEYrMU0wR0ZoL3dk?=
 =?utf-8?B?R0xSZ2lDZDVLN25HMmZlZVpNbHJ3VndtM1Ywa2dZQ1lyYlZVTkxucDBRUStY?=
 =?utf-8?B?Rk5WTzd5WGlhNXdXdWxHdEMrQ2RnTFJZS1VLWm41TVlmYjd3enBqVElGdk5k?=
 =?utf-8?B?SjdBYzBSdVZkanFaMDJCTHo3RzdIN2wzaThmN3gzQlpZaGRudkQ2Vzd2SzNB?=
 =?utf-8?B?S2lGK2szZkZsWGpVb3VXbnkwaElsNmoyc1ZzMEFWUHp4U3BKTTd5R0dpNmZ0?=
 =?utf-8?B?ODV1cTFHbnFvblRlMktsU3FpSWNoVzZrOHphTUtpOUdvV1FvZHZZZlBqaURl?=
 =?utf-8?B?c1FPakVUMEhnWjJuT1Y1UmtveHdEVFVpcDFOdzFvM3lSUU56VDJWR1NXL1Rt?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dcb220-2ecf-4d3e-6ed0-08de07f6942a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:14:36.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDYZtuFH5lR7OzwCfd9cdVv6h3hbXAU/Pw4dx+tlrxWEUpUgiOpWxMzA4CpgT+Xmj15yrjaTfv57tflnLYaBIJsZpMZ90XgTeRohWdOKVnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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



On 10/10/2025 2:06 PM, Maarten Lankhorst wrote:
> The broken action happened after ggtt_early_fini, so
> it's safe to put the drain_workqueue in there instead of
> creating a new place.
> 
> Fixes: 89d2835c3680 ("drm/xe: Process deferred GGTT node removals on device unwind")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index aca7ae5489b91..33b09737ccba8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -199,6 +199,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
> +	drain_workqueue(ggtt->wq);

as said earlier, drain() will be implicitly called by the below destroy() so moving it here is a nop 

and in some cases (at least in the past) the draining here, in "drmm" action, was just too late,
and that's why drain() was moved to separate "devm" action that was called while required devm data was still available

if this is broken now, please attach dmesg/crash log to better understand the case 

>  	destroy_workqueue(ggtt->wq);
>  	drm_mm_takedown(&ggtt->mm);
>  }
> @@ -246,13 +247,6 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
>  
> -static void dev_fini_ggtt(void *arg)
> -{
> -	struct xe_ggtt *ggtt = arg;
> -
> -	drain_workqueue(ggtt->wq);
> -}
> -
>  /**
>   * xe_ggtt_init_early - Early GGTT initialization
>   * @ggtt: the &xe_ggtt to be initialized
> @@ -305,10 +299,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
>  	if (IS_SRIOV_VF(xe)) {
>  		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
>  		if (err)

