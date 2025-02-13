Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D07C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 22:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8A10E07D;
	Thu, 13 Feb 2025 22:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxkiLrxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088F210E07D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 22:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739486646; x=1771022646;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PU6CbltmCX1XM9EvvwiC83kWdjyBs0H2jy0ESmLkoE0=;
 b=lxkiLrxKKBap0xRzBfQfiu3D5dmOFMdFOvHXr9ZKwxTbOR/eKGESzM3f
 X08ToGqdF4DmnpZl51aJnqXAwefm9z6VshE0BHjX8jBIQLthmK1W9m0MA
 Vwg4NNlzYTMovk1HvwQHjEcMgZ33vhBC/S4bXgf1Euu9Md6yppmjRkFIx
 aHVIz1lXBuZs4VYB86un40upMhyRcrvnw+LCkALU6LVb0a8vVuK+zxZoQ
 qlv/PujWoYTfqyZIWvs4c9BZ8LG6ywU5OMO+WPsV9rNopaAZmjZB3XWaP
 MgIMKKN86xmJbjklMrsHftdaHklxBjCkQ0lp3sDrBvgIZfyknRp8+rrXZ w==;
X-CSE-ConnectionGUID: nkoCW4rgTUycwLNFbwju0Q==
X-CSE-MsgGUID: 7BDTD2WeRBWL5E6q69MhBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40091971"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="40091971"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:44:05 -0800
X-CSE-ConnectionGUID: 615qfkUMRfuOvj5ezuxJ1Q==
X-CSE-MsgGUID: nolqeQzlR1KpBYo/CgDxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136515430"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 14:44:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 14:44:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 14:44:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:44:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvOt3XaFYaDRsysidmHgG/4qhJg0E7J/lTu/jVQG9vme7QZhw89SnfrIXuLOeIEskS2bPJmWhcuzAVl8Qjq5YhScVYG6UK1W3C4zKNFU3UItAWkfQgY1Rpftw2yKNQ0ym8GUOWuw1eNbepK5PwLy1dlpKCDFvR1v43tE/f4Q3Q0bZx5nSHH6+jjSS+Xsp/3OyptARrcoUYHQB1Xlg1uNubOj98mUaVYP5qvFk+j4RmNQp44N5wDXh2086NmOjKHV7OUFwb01N5VRtJe5Jh+Fc3CF8+BA9Y3Y+SveRKe8Df0HCwl4csjZT4+gJtI28OflS33Gk3azgRcQvoEx58f3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy4UGlUSq9hRVuKnWkd7hq9nJD1BX57LtAtiskMMeSs=;
 b=QXYf+qEecQAGy5s4Mdj99VYyHtB7sfceTIja+LvDpPG/1EUzRREI1PcBFZN7+GacEfgldRkglqKtLDQQgKGAL8l/KPm7h+sShVTtAhgNB6JxEKO1UcLasKN1B26hYSWC5A+/p+LALGoqK/4Y/k7E0mH23cGt9z5fTIfA6NeUCGtVsWm9JigJVivwW3RVQeNeV3Q46r+TrJEOQpTASo9CrSE17o/BuTbLV68ZaMW05G25AUA32Kl1HYhLmMSzq7N5C3jbizTm7idozLKElSNodZT7crQDSHOd+hk6HIG8FbBsmusEPB5BT8BhH+nUKL/qkAh3EYdQTs1yT+7z53NJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 22:44:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 22:44:02 +0000
Message-ID: <35143d0e-a79b-44ed-9ee7-228d48684a98@intel.com>
Date: Thu, 13 Feb 2025 14:43:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Escalate GuC load failure immediately
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
References: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250213213901.2191463-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0870893d-13f7-482b-66a0-08dd4c7fe9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVNXVUpKaUdqN3YzSnAxS0hhNXVuczNKZGFOdzVTb0xGWjUzZXNZQzVieGJI?=
 =?utf-8?B?VWlDM1VXV2VpUjc2My8rZ0tCbkpvdk1Lc2FCN1A3Y2cycTFha0Y5TUlFMUxz?=
 =?utf-8?B?bjl2YWtsRW53VDhkcCtXRVk0Mm0ybUxISXJsaElOMTF0L2hNb1JBWnNidFVS?=
 =?utf-8?B?YjJodjBGN3BBTk5YZUZaK2NUMW9GeEs5MFJvQ3BWZDBndmF3MGp2K2FqMHBl?=
 =?utf-8?B?NzFoZ1g1SDNkT1JUczI2aE9lYjNaS1VaR3V2dWNiVUp5UkdYSkN2bVAvM09M?=
 =?utf-8?B?WWp6dXhibVRndTVWSkc4cmZRWlhBQ0ZhRGtPMVE0dnpJY0R4ZGF5bzVtMDRl?=
 =?utf-8?B?c0I4ZW5PaHZBOEcyZVZrZFpXVUdkbXJsTkxhejAwSHQ0ek5VL0piajU1dTZP?=
 =?utf-8?B?RlNnYU5qT0tSY1phMVRoTWwwMmNjeHdva2paaWRTVU94cVNNSklNNWZoTXJI?=
 =?utf-8?B?OG1DNjZ6MFFpamhVcmU4alllSjEyVlRWTW1oZVZHNC9JUkNHci9XeWk4MGU5?=
 =?utf-8?B?aklJV3FmVkFVK3ZFeDR2Um1sblBlYmdwYTlibDVpelpaYzhyTG5jY1NNcWxD?=
 =?utf-8?B?SGd2N0lYdWIyY085MXkwSzVxQSthUUNFczJUSmVOTlFCV25UN0NJSW9BbG9I?=
 =?utf-8?B?Uk5JQUxjL2cwVmZVSnlra0N3MW9QUkgzQWJHdURGMjcrSmpQZDBkSnZaUWo2?=
 =?utf-8?B?R0MzUnpFMmlka1BFVng1NEFTK3k2OWloVjRNY2xtaWhwdEVwR1lWN3Q2d1Fj?=
 =?utf-8?B?N0Ryby81ZU11ektNL1Nva2ljVW8xblc1WkFKSFk0c1hSR1ZFSk5EdVpMb1Vv?=
 =?utf-8?B?V3FCREg3NVlFK09LaFhmYXB5c0JGZnRsemR0SE5RRk5JbS9ZQlUwY29walFv?=
 =?utf-8?B?WW1sNXpweWRRaU1CTXcrVHk3SGkwSHEvczNBbjZsbGptRUZQQUVYOEdVQzA0?=
 =?utf-8?B?UmxXcldTYmVyRlhZeVJjcDdta0FQcUhHbkJ3ZjJ6SmMxb0o3aVg1U0FCdHZT?=
 =?utf-8?B?T2U3cEh1N0tBSGdWTmRZcUJQUWJQSHhmOUxJSERGSG1HSHpGUGllU3liV3pI?=
 =?utf-8?B?M2h3OGFEQTc5NHRYdHQ4RlhHNFB5azQvYUV4Wm9LTEc2UGlIQWlaTGJyQ0tQ?=
 =?utf-8?B?dlp0cDNjbk1zbTFJcGFscGh2UGlKN3czbDZseVZ5alM0d21CZ1lwak81N0lp?=
 =?utf-8?B?b0VHbXFCcExxZTU0dlBqR0hLalB5aFBUYnl1ck81d1lpQ0I4KzZiN21QRzgv?=
 =?utf-8?B?R3I0T2NlWEJUWU54TkxkVkIxYnlwZmduVFk4TEh6QnFNZHluMWUrNnJka2xK?=
 =?utf-8?B?WEZoeTJhVzVNOG1yY201T2Z4L0NBTjVOSS9LQW16WDNUa0hSdDA0aW92dmNX?=
 =?utf-8?B?SFMvSDZaWmpvZU03VXJRZG5qdHRld3BwU09zTWJJMk9vbHpaajVrZ3BNVjFN?=
 =?utf-8?B?Mm9qdzcrVkRDcXhxRHdOenNTMWFWZ2cwL0VmTm8yNnJxd1ltODlCMXBKMTJE?=
 =?utf-8?B?cysxMW4yb2NHR3dUQlNXS1lZTjR5VnpFNm5ReDd4ZDV4cE9yclVBRjV6SS9u?=
 =?utf-8?B?OHVMcnR4U3ZHeit3M3YyYTFKd2piWkxLdUUrSjBVN0Q1dnNQZURZTUxORXRs?=
 =?utf-8?B?Y3VmQkowRlhNTU5aRGp3aktFRzZabVFRRnRvTGgwQlhrbjhwK3NGRWVJQklr?=
 =?utf-8?B?aVFUK0QwdCtNckZmY2pGZG1FdEVoNDdrcGhyWGtyZ0ZLQk5GUVo5aFNJaWxN?=
 =?utf-8?B?cTgyWHVrcE1IODRXQlA1SU54YnJIcHBIZVk5L2FHNEY3dW55Mm5NRk40cFNl?=
 =?utf-8?B?ZVF2SXlOaWlEVVFEWGRGZktqeWxZTHQ0aEFpeFV5RTQ5MHFybjkzNDk2U0sy?=
 =?utf-8?Q?94UFehHivEkpM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1EwOTQ4NDB3V1lzK3Mvbk1WQk9QaXJWZFFCbXEvRFU1R3hKemc2Rk1pNzhE?=
 =?utf-8?B?MWtDWjR0b2gxeFREaGtFU1NDWkxwUlVvZmVsd3FTYytQZitnUUVVZ0N1M0xu?=
 =?utf-8?B?djJZU21aZjc1RVhWanRZY3dMNzFkOUo1WUdoK2pSbUhjVnVaUkUvY2U5ZDBH?=
 =?utf-8?B?bjRtMlhzaitySndSSDVBbjRURDY4YkpTRW4vR0ZXVG96ODdZSlF6T1RHeklv?=
 =?utf-8?B?aVplQnpKWUo5VWRRblZkVk9JM3ZZSE41SWhQVXJYWXExcWU4c0psYXRBSFNk?=
 =?utf-8?B?NmZBZVRRQjc4T2FxK1l3MXFoOWxic3FONVJ3NHYyNm1YaWwzVE83d2gzQnZr?=
 =?utf-8?B?WlNrajNiZ0xLUytSWGNDbkFqUi8weFJ6emk4LzRTdjVhSFNMK3JUZjFTWWVj?=
 =?utf-8?B?bS94SDRsbzErbm1KbWErU2ZraXVCeVR5djJNbHFjeGRWTTI2VjlxZzhxcTI5?=
 =?utf-8?B?eW9WbU1rMTNKVTJIcnk1Ykhyb1FKQjFRN1ExOGoxMzRYVnpLQXJxRU1TajBU?=
 =?utf-8?B?NFFocHJVTGFLeTIvWHFua3AyWGFkc1l4Y3lBeHhBancyazRicEd4c1NXbDZy?=
 =?utf-8?B?LytQd0k1NGRkMVljWFJHaldUMGpLWlJ0eXBGZTJxby9UWHQ1R0N0aTl0bmZl?=
 =?utf-8?B?ekQzZ2Zldk1ac0grWEMrNGhqd0VCQTRhVWdET1JnSmM2S2o2K2tOaENockdo?=
 =?utf-8?B?SWhYT0dFN2JFWUt0NUlYNDJRUVp3N2RqNkdJcEsxcFYwSnJxL29zekVyL0RJ?=
 =?utf-8?B?ZWhKWGpieEw0eGlWWnBoSDAxVlgrT2g5aEEwT3ZUYWJHMzZ2WERNVmFjMmpz?=
 =?utf-8?B?QVYweitDREFGMnZ0TE9uV0h3ODdtZGU1Ylhnd24wSy92cm9TRytkSVEwWjN1?=
 =?utf-8?B?bGR5MkhWNU4ybHMzZG83Rk5nMFZhNno2bVd6cStBQmd0c1lSMnNqbDdPSDdS?=
 =?utf-8?B?MFRITnNUY2k1Y21TU1N5Vm5IellSQVJwZU1qa25acXRxT2p3RkNld1I5d3VL?=
 =?utf-8?B?eThycXI1ZU5HNFRaYWpVMnZ1Y1VVV2Q5VGliUTlzRUlvWDREUzlhR053MHNz?=
 =?utf-8?B?UllmbnBZWm1wekIyN0hlbjkxS2VlZFUvQ0Q3UGUvTE9hbVYrUUNJR1RPUUVK?=
 =?utf-8?B?dVBqRktHdTZjTXplVGZJMVptWDFSMVFha1Y4VkdKQk1MZHpWRjJHZWI4bG15?=
 =?utf-8?B?U3NjUVQ4UEtWR3VaSHZVdXJYZWs4Z0xVM3RSeUZKMGdidkxoZnJlUTk0MHhW?=
 =?utf-8?B?MTRXVVd3Q3lwVVFvZEM0ZTdueVhoS081aTBPQU9ZWXZNbVFJcDRMTmE1aWlN?=
 =?utf-8?B?a3FuL0ZXUGJEc1pOejJ4aTRwUTZvQ2pkK2VQRDRxQ0srWHlhdURFS21YbTVY?=
 =?utf-8?B?SlBJSldwTW9uZHJvMG5id0JNK3F5T0RQY2pHZ1gxRXZqOUZrUTJVcW9VdU50?=
 =?utf-8?B?UnNZTUdGQ01hcFhuWWZJTzYzYzhaandvM01zeTN2dWpuaDFPR25uK3cxd3ky?=
 =?utf-8?B?c3ZCY2ZwNUt6OUJaTUFuWjFFdVUxc1ptUWdpMWpTYjhhV2RHamV3a1RzY0c4?=
 =?utf-8?B?dC9xNmlKSkZBc1pIek5zM1RkZ0ZYWlNOQlFTYUhvRzJ0Z2JBTWdtcEFMaEd3?=
 =?utf-8?B?V0Q1dmVBUTFva1g5RisxTTViSHhhWmJPV01oTHJ4SUVlVjBlSHY1bmdOM1pv?=
 =?utf-8?B?LytRY0dHOGQwN2kvNGlxZXNzOHUyb1dGVnYwNnNNcnI3SEVTMUU2YTZKSVcw?=
 =?utf-8?B?ZnU3cnhuT3cvQkY5bjZpdHJOTURtRmZiSDQ5RFFFR0hhSnhudXIwRUE5blk4?=
 =?utf-8?B?bFBKL2VzQkJWQmpHNytZSEJIQTFTWWpzbEN5M2hsOTc3dWtyNnhSMjRBTEdm?=
 =?utf-8?B?WTN5TmFFRWVUS2ZVVlVZcGNTWEt4ZlBudVkxUnFJY3AwejkyMkxSSFlaRlRX?=
 =?utf-8?B?cmlrT0d4cWRVVUFpeUZiQ3RiMGhHTTE3eUIrcS9xTEVmaDB2OGNLTHYyMy82?=
 =?utf-8?B?blpadFZWZEc5RG5HQnFZNDIvazhQcEFVSVo2TTNDM0RleVVUaWtLdzVESE13?=
 =?utf-8?B?VkZjUExpWUV4NWtDenFyb2VpQ2FGOHdkMklCelJlYlcvOXo4cUtqb1hSOWhu?=
 =?utf-8?B?T0ZlcWhPdHFYdDVrTzVRVUNvQlJzQ2pWVzM3aGpzVXhiWjJIWTdsaHl4TGVZ?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0870893d-13f7-482b-66a0-08dd4c7fe9a3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 22:44:02.2368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2CbGpDOnGjq5PS9/H16zywX9bjEjvN97iGLwzCs22T/xpl36PW5Io1r8TtfDTSfRnUjIcGRwZv9FTu/IJnT/8RuGZaKZ9BZXkRCwQQRx6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
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

On 2/13/2025 13:39, Daniele Ceraolo Spurio wrote:
> When the Xe was first introduced, we intentionally avoided escalating
> GuC load failures, to not abort mid-probe. Xe is now mature enough and
> we gracefully handle probe failures, so we can start escalating
> immediately.
>
> Note that even without this patch the probe is still aborted because
> the attempt to enable CTs after GuC load will fail and that failure is
> already escalated.
>
> v2: only return success if the load_done variable is 1 (Tejas)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..407399cc4764 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>   #endif
>   #define GUC_LOAD_TIME_WARN_MS      200
>   
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
Should we add an 'ALLOW_ERROR_INJECTION' on this? Make sure CI checks 
that GuC load failures are handled gracefully?

Either way, this change as is looks good now.
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

John.

>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct xe_mmio *mmio = &gt->mmio;
> @@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>   			  before_freq, status, count);
>   	}
> +
> +	return load_done == 1 ? 0 : -EIO;
>   }
>   
>   static int __xe_guc_upload(struct xe_guc *guc)
> @@ -1077,14 +1079,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
>   		goto out;
>   
>   	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret = guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>   
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>   	return 0;
>   
>   out:
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>   }
>   
>   static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)

