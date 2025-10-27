Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E748BCCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 17:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65A810E539;
	Mon, 27 Oct 2025 17:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A75I0gZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354DF10E539
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761587969; x=1793123969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=agj0mZkrZ2QSBKtfRoKUvZzFPPIpBahMVM/8F9GK57c=;
 b=A75I0gZ/3hoPM/TzCB0scK15xQ0CcBXm5ilyIaUSe6t0iO9uRv5S6isu
 nAApjlwHSWfzfJdi360RbYOV7GPTCcvi+6CAbTOaJ6ozeEHyXyqocnRUY
 v9+w5vXfv3stXmoxbdPEc8YYXtiwkwXjNKK0yFNQMF32g5MZPnYadeOto
 EO1UIKb7pVcphTlrT5PWSfa3xqJeb6o3R07IL1FaF7KFmRkpbFnwxat7f
 piQ48OgtylFx1Vw3aW9qowaywszcCRIjV51XEDPkHvclLjdPQnbalpImM
 Yxal/zFzuam0T96ylhniBTllUPeU7MPAsb8hoIlyT9k0zOY3xD9fMVwc9 Q==;
X-CSE-ConnectionGUID: 2zTL9a6wRqu16B96j1xR+Q==
X-CSE-MsgGUID: EVaGdwS5RY6MyB/ZNdPaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81101104"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="81101104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:59:28 -0700
X-CSE-ConnectionGUID: prr2I+ALT722C5w3MjQCQg==
X-CSE-MsgGUID: PzcwlNXQSkuZwwaE9aHs8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185006496"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:59:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:59:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:59:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuWxIuDbE/YO8C0VLI6Uz6XpuQVn9+HogJNtQmKa2WD5orShOsIZUPCRbl6uP7GOm0VlRL030UvPHuynnqyjrsxOq0CHb+a427aDNsHV6mce15JPw4UH82oKMNsNsE591bFz7ilIvdlP0/pSqLwDnbw2E58YSWzq3OWM0hx/Gccg5b945Da+4Lvzecj8jHcpl0s/lbfax0MeruVVnVeccPCEljU7FXcK2OLEbVtlJGFY/etDYakR9czglIqIJE2w/cOtBu3nQ9pCQZhyUD8fTDvUC/nSItSNcgrl1u40B7HmV5wqslw2L108Y+XsijFwQwyij7H5uOVTD2zhPP49FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiAOCxW5x6v68cIWDFIBmBbG3r0rSEk3nZJsDvagrDA=;
 b=L6E+wB+/U35yGY0zKwn3JfwpvLuMS/uU1B/bzKvc9mH/sRgbWDWkXwg6wd1g9FnTsEhrMCuEzbcQ4N4++/2iFQFNAu+t9E790O1YklBdAWeKy/CQ+OTxe9D5lk9iJvtiLNSevel3IkYzZ3RHfrnIqDDi+t9UWJnbSm7CTGXeFh2QTFVm3WNJ6TAmfbGA5IEml5ZzMbsNcHMGLyeIuR6YiFiGZsvII0eYQAaUOzaxG7um2Lpnc1swo6E1DtKW/T/n+xvmy12HkLqEY/JtTXcN3B2V7t8tzF9nNCmO4g0n1lgYJ8GYHy5UbXSdZcfDEa3JuBer9nitbV7RDAR/KHcJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:59:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:59:25 +0000
Message-ID: <eb5c16af-136a-4f66-a7b4-f5a6fdf4ccdd@intel.com>
Date: Mon, 27 Oct 2025 18:59:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-2-michal.wajdeczko@intel.com>
 <oz7hgzvtaw4qlhgbftbkblbchlgpx4uaf7pg5ua3rmj2625vuh@umpamfhzsmdh>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <oz7hgzvtaw4qlhgbftbkblbchlgpx4uaf7pg5ua3rmj2625vuh@umpamfhzsmdh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: fff4c2fe-b0eb-47f6-6be3-08de15829093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkRnT2xOYUFxRzFOWk93R3lqYTdDWk9QczM1KzJaN1FpZkVBeGE5Q2Nwbk5p?=
 =?utf-8?B?YWlBN3FnUkUxWno4QmFhUll5T0xBb1NrTDNkVklEYTRCTUcySWxhWURlbURS?=
 =?utf-8?B?WEROaEtHOXZxbVJhM3FySVIvWDBvS0hSZ2c3V0tiOGd3cFNTZllxWEFNenll?=
 =?utf-8?B?djFXeUlFa2JnL3VpdGlmaitteXBpeVNEUUdQTVQvNzk4b2oxSkgweHEvanZx?=
 =?utf-8?B?L215emVNZmY1TDNGRXQySUxXN0VWUUl5K0dSL045aExCbC9nbUoxZyt3bmJw?=
 =?utf-8?B?Z21YRnlwK0R5OTZLVzNhV280THVZdmQ4UmxLYmd5RGJuaVBwWjN5Rjd1Mmlz?=
 =?utf-8?B?TFVxUTNocGt2WnVJVldyU3JpUlYzVFFaRERxMmlqN1dmaVU4aWJqcVl3U1JD?=
 =?utf-8?B?ZnhRV01GZDhUNnhtRXNHN3gwc2ptb2VBRFRJemtCNkxsdElOc3dYbEdFcXJl?=
 =?utf-8?B?bDB6NnhYV0p3ditRZkx1WEZqb2Zvczc2Rkh1ZXhRcUZvanUrVTV6ZlFtbWhR?=
 =?utf-8?B?dzlSOTBRMEE0Y1EyL3Q3QUJOM1kzRVNiRmxYV0wyN2VpWmlkYm9CZGI5YUpL?=
 =?utf-8?B?Q2ZhRFgxaGQvZkZnWE9LR1dlNEJiQW5tdThFOCtORkk3TFRJcTV2TWllS3Vy?=
 =?utf-8?B?L3FZY2hQbWNwQTkweXNqdkhoeGVZcGRTcHZLdnRRRTFLTVc2LytQKzB0ZVl6?=
 =?utf-8?B?M3lpQWNLQmRRMHNkZHhwek1GMjlkOE4wK3pHVjNkdE5zeFVSbEh3OHhVUWw4?=
 =?utf-8?B?SmJkZnpiU1ptY3MzU0Y4amcxYVVPVFMxMXd2VDhDSEFTbXp1TkFMYzNoL01H?=
 =?utf-8?B?NWNRbDFVZWwxdjRwT0NHcnBucFE2dGhOcUh1dXJmcFo4eVpaN29iZEtSSDk5?=
 =?utf-8?B?THJKc2Z1dk50RHJ0VzRqZHJJbEpSVVY5VmtYTFFwcmJ0eFhpS1gyd2xSd215?=
 =?utf-8?B?K2tMV2NuK2dBSlF6NGVLelB0L2VQaXZBTkZXd1Jxb2JUOFVhdElWRU5iaThJ?=
 =?utf-8?B?R0xtL3RlYUwvUGNpby9QendRQnJ0WFRRUnBaN3VjMFpVVGpBMW85UjRTNDVN?=
 =?utf-8?B?U3RLWTZuNE0reFZmY2dmYWtaVjVwUnVGWUk3dXJJNk5KL21PZnlBODhySFhr?=
 =?utf-8?B?bHh3VkRzSDBqSndnMTJZWjFlSWhQV1lUN0k1NmtuWFRRTElqeUUwZ2dzZWVm?=
 =?utf-8?B?V0locGNMZnVERk5SU1dMcTdLaGQ2VlRnbnNWTnJMYnhwaWpWdUlpSzh4ZFJp?=
 =?utf-8?B?S1EyNHFLYkdyNHByMjdWbVlFUHYwY1lnYTN5dm1QdUpYQ3pKNzNiYUZYTCtS?=
 =?utf-8?B?WFE5VTBEN0RmcTMvTmVSWEpONG1weG9NQnpNV2FjcTNqMStjVW5EOHVIWTBN?=
 =?utf-8?B?a0JWRFZ3L1cwM0w1SmdPc2pEYlkvTlo1T2pSL1JiOE91aDZqeXJCM2NRNEUz?=
 =?utf-8?B?UXhnVS9mRGtzS1E4NUd4VUpSUE1iWEU3ZG00Q3o1ZGc5UGY2VkVJWVhYOGZn?=
 =?utf-8?B?d0c3NUFTRWZrZnk2T2llZkRSN0NpSVFUZ2FMUy9zN2xhQjFnakptb2dNOTBo?=
 =?utf-8?B?eG9sQ0YvUTQyNzQ5RlBOL1FTTHdDTTdmRjB0d29KSFNZbmszaDdLQUdHS2JV?=
 =?utf-8?B?MUlvbU85eWFUNnNSdzdwZllJZUtCT3gxRlVOSzUva01ySDJtSTE2S20vSkpm?=
 =?utf-8?B?VTROY2N2VFNQUlhwZ2NWdXdITHF6cTV0UFdIekFaUnNZQm9ScmJGa1JNcm5P?=
 =?utf-8?B?OGxHTlZRalRoMTQ2Qzd1SU52aVRnK2ZrMWlzYytGS054NUJUNXJHVEtDclNR?=
 =?utf-8?B?dkR1dm5VeklvZ2p5Y1FHcVhnNG8xb1lNbkhFQkVuWEE0U3hkcHhEOUVvMXZt?=
 =?utf-8?B?bHh0RkR4THNIN1dIeWlMdXJqOUxDZUR3elEvTWlYeWYyY3dkMFBENUNtYnl6?=
 =?utf-8?Q?Gb6HGpl2ZCGO6KTDCuiF6m4LouXN4Qui?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpjZVJWbFAwbTZyc0ovZnR4cm1hWFVoVjlSRzFKTDhGbXdiNTQwZEgyUXpS?=
 =?utf-8?B?N1VSc2xPZFJiVmtVMFJhY0JPYTRmM2l2cmFiNXpqOXJIVzR6ck5KVVlHTE40?=
 =?utf-8?B?ZmhIZU5LQ3VTbWVGTGwrS3crNWtJTmU5MjJEakMwR1dTUjZQdWphOTFrV0pY?=
 =?utf-8?B?M2hZSWE3TGNmb0t3TXJJei9kbjY4YmhyRlpnZE4veHJrbml5WGJmMlZiVUo2?=
 =?utf-8?B?TndNYzFaVjdEb0V2RG51QUMvMzZiWHJwb0Y2SEVDTm1QTWJSaThOUGlrdjN2?=
 =?utf-8?B?YlhSWmFEeHhVQk5XK1ZQRmFXcGpienh0ODFxalVLTjk0c2laWjdZSktsMFg5?=
 =?utf-8?B?aG5aUXh2TFdDdnRxU216c0YrZkVzdHV6anFPRkdIMk41THE0amgrWlZuTi91?=
 =?utf-8?B?cHZTdjE3MEt4SU9EcU9FTXVyaThGV2t0emc5RXZtZFo3MTlpTHdDZWc4RVZ1?=
 =?utf-8?B?ZWl5VU9KYmplVk85VG1YNk8xUGp1R3NjdFZBNWRFeEorUCt0WSsrTmFsZ3Q2?=
 =?utf-8?B?ZFhDSGFlb2JQcGoybXF5eWNVSFk2ZlQ2SHE5SjZsOGU1UXhmVlpjL3BMdVVK?=
 =?utf-8?B?SVlHWk96bWlEdVJmR0lCakNqVENaaVIwc3FkaW5mdHMrWmJLYnNJMlRCMGhL?=
 =?utf-8?B?N2xWaWVSRUZMeVZwWTFyenJlSDg2MmdDNzZmUmRPTThnSzRUU2haWlA2WklI?=
 =?utf-8?B?d3Z5RlNZN0tudDRYZFpYbVFjZG5uaGRaVFpZMTEvM1JzSXZjZ0Ywc0hRQ21V?=
 =?utf-8?B?SXJyL0ZGV1NpNFN3OTF6MG1NdHU1Um40RC84UDhkUitsa2c3SHpSaXhuQmQy?=
 =?utf-8?B?SW41eDkydzh4Ry9jd1hScGt4UXZmWVVrSFk1aU5HbTVRbnpEUFNodnc0WnF4?=
 =?utf-8?B?cUZONDVYenJJL09Dd3lRMHM4NVNmK1pNMWFicHhwc2IxTm0zODV2ZHBJNkEv?=
 =?utf-8?B?bVJTS0x2ekhPQ0dKZkh1WFA2QXVpL2VRRUN4T25vU3F5R1RlQTZmcmIycFdO?=
 =?utf-8?B?RHVvYjlOSEwrMnIxTVh1M2ZqaXNLS3dHczhFYnh0Mzl1MHlva0VSYnRtcVIr?=
 =?utf-8?B?ZXJ4WWdXRlJFd0IzRFFaNFc4ZUJqUktENndaM3dhYU5Sc08zQ1ptaStVSkxX?=
 =?utf-8?B?cjh6TUhnSldlWWgvc1VaelAxZ3UxaVdsam91eE53MHowblVNOHhQNWR1VDJJ?=
 =?utf-8?B?MXZHRS9RRFNIUGFqbWFxSVJmV1VSZ2Fnbm9nSFJ6RldydXZSWHl2Zk02NEZ6?=
 =?utf-8?B?L3gvemllU3F2eVF4M3ZGRUxjTnpaYUt5TEtnNmpBdW9Iajhlayt5MXZXV3ZJ?=
 =?utf-8?B?M1E2V3dkbkRhZUhiMXpCUnRoMlh0YURZTU4xV2RDam9ibXg4bmdWUHFzcCtm?=
 =?utf-8?B?MFZheU9rQ2hJUUhOY1lVUTdKeHFYQmxEVzRlWGJacTNielFUNUZuaEpieEVT?=
 =?utf-8?B?UXc3U3lESUJGYkNNQ1N1N0ZBcjNwTURJM2loUUlwMXZqcVR4dlVPSEdYbUJo?=
 =?utf-8?B?YnJBemJnRDlQai9DbTlMS1ZCMG9NM3JSNTR5YXpxT1pQNno2VSt2aXhtY2tS?=
 =?utf-8?B?bnFQS1FVZ3VjV1ZYdURCMTVoTHFWb1BWS3JvSzRaSmFKYjNwM2JsUkl2QlZW?=
 =?utf-8?B?S0lvWnVnMnE3SHhvVDdPa3BleERsMHZyNDJlbnJwZWx5eUJrbG54TVZZNCts?=
 =?utf-8?B?dC80Y2Q0MlRlMFg5ZEZCTCtFNHgvY0Q4RWhYS2UrZmk4UEUyWEtBK2txaFFX?=
 =?utf-8?B?YTZZWnRadStuQ2pFYlFqc1N5L0NZcHZuUUxRTjNybnF6cWR1TEpEQlNGUmpJ?=
 =?utf-8?B?Q01PT3ZFVi9LS3gzU2dya0hJajdxMnBzMjcwSXlpR3Fmb0JwUzE1Rkp4UFQw?=
 =?utf-8?B?bXBKTURlbUxaajVndnpucUJVUWNiZi9JZHdVblNPaHoyVHJQcy9laWFXWm52?=
 =?utf-8?B?UDA1NUVLR05odkIvVDhXeFh5UGpMVnpEa3AzVnJCcHRSSkh1RXJycTg1RGhx?=
 =?utf-8?B?WFh5UUNQNW94aHpTaDh3cEdiQnpjQ0laOVFQV3p5WWlZaWNRck52U2E5ZlBV?=
 =?utf-8?B?bXJJQU5JZUJwZlo2azc0UWEvZGlDTEV4NllwY0ExbStGUW9MNGZuT0RESi9r?=
 =?utf-8?B?TG1wcHZlVlRQamJ4SllkUG85b3A1QkZmZTZHSFU0U1IwQVphckJmdEFFVGRL?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff4c2fe-b0eb-47f6-6be3-08de15829093
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:59:25.1617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dA3u24KBq1hTu7qVtTwc7DY96CfuuFBr/YXVPaJVw9EMG4bQSRiN5KYd3c1hkc0J1a7kvXD4Ocl2iWPfii+E2c2aR1Ua6yBuuXH/a7Fsug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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



On 10/27/2025 6:11 PM, Lucas De Marchi wrote:
> On Mon, Oct 20, 2025 at 08:24:01PM +0200, Michal Wajdeczko wrote:
>> +static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
>> +{
>> +    struct xe_sriov_vf_attr *vattr = to_xe_sriov_vf_attr(attr);
>> +    struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>> +    struct xe_device *xe = vkobj->xe;
>> +    unsigned int vfid = vkobj->vfid;
>> +
>> +    xe_sriov_pf_assert_vfid(xe, vfid);
>> +
>> +    if (!vattr->show) {
> 
> nit: I don't like hiding this programmer error behind a dbg. If the perm
> was set to read, the attribute was supposed to be defined with a show
> method.

it is not trying to hide programmer error, it is trying to protect kernel

if bad admin will change perm of the attribute using chmod a+rw and then
will try to read this we will get NPD here

> 
>> +static const struct kobj_type xe_sriov_dev_ktype = {
>> +    .release = release_xe_sriov_kobj,
>> +    .sysfs_ops = &xe_sriov_dev_sysfs_ops,
> 
> (general comment, feel free to ignore): I wonder if we could inline the
> ops definition since it was not supposed to be used outside.

it's all static already, or I get your comment wrong?

> 
>> +    .default_groups = xe_sriov_dev_attr_groups,
>> +};
>> +
>> +static const struct kobj_type xe_sriov_vf_ktype = {
>> +    .release = release_xe_sriov_kobj,
>> +    .sysfs_ops = &xe_sriov_vf_sysfs_ops,
>> +    .default_groups = xe_sriov_vf_attr_groups,
>> +};
>> +
>> +static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
>> +{
>> +    if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> +        xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
>> +    return err;
>> +}
>> +
>> +static void action_put_kobject(void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    kobject_put(kobj);
>> +}
>> +
>> +static int pf_setup_root(struct xe_device *xe)
>> +{
>> +    struct kobject *parent = &xe->drm.dev->kobj;
>> +    struct kobject *root;
>> +    int err;
>> +
>> +    root = new_xe_sriov_kobj(xe, PFID);
> 
> Slight preference to follow the _create() name convention in xe, so this

hmm, I just didn't want to break the other rule, that function name should
start with or match the first param name ;)

in this case it is a factory style, that takes xe, so started with a verb,
also somehow matches release_xe_sriov_kobj() that takes plain kobj

would create_xe_sriov_kobj() work for you any better? 

> would be:
> 
>     root = xe_sriov_kobj_create(xe, PFID);
> 
> but won't block on it.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks!

> 
> thanks,
> Lucas De Marchi

