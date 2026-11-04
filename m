Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB1606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQ0ZekiO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6B10E85F;
	Wed,  4 Nov 2026 09:32:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA2D10E869
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793784733; x=1825320733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bk3shrvIAxc8jatijZiG9TszGtiwB1bxzTvV/MG/bnI=;
 b=IQ0ZekiOp6MpHY2RQWnuqIgEZEw4OZ0GlxxLKhVMJAWYCaU4EL41rE50
 nMOTY5Mw8Evoi222pgOVS8gkG50B94wEQwpCJPEfdVv2txf6fO0BWmZdu
 P8h/ROw1MQM8/Y/OOqbnUGRNfTjSLR2XdVJ+6G/trq9xiSOoj2Pic+uLC
 mZ+rldAOmEuqFxz0ckWsfv6J9WtKw0Y/N3nXU3u9rOzOax6C3IBC4FbgY
 X/5gY9D9rbWquNLvmbpyF3OywBXWbB/VuT5JKvwERyaKaFGJH9F5oWTAl
 h1eQQmMPfSHfGx2kqW9tJ5RIovv13SlF/OnsY8oeQrAVZd373Ty5QO6k9 A==;
X-CSE-ConnectionGUID: aD/AZHTuRCa0hDtdsl7RRQ==
X-CSE-MsgGUID: TRr7EIrgSam277t0D+4bgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2563436"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; d="scan'208,217";a="2563436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 01:31:50 -0800
X-CSE-ConnectionGUID: bWmA37sARGOXrDUO4nGidw==
X-CSE-MsgGUID: iPRHCMIxTxOSUooxmNfuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; d="scan'208,217";a="6524714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 01:31:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:31:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 01:31:47 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:31:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfiW1BxRnQk8K+Q75PljU+TvW687IMe4X9yzXUo7HXznVRpHmILJ4d7uPRZeU4XVH/V4WqxMqwbWChR6nPkmaskOumsPNGrXw/+lbt67ZLvqFxM8RD3fY77ZtUqSMLA8EUUailcj+CbTarJ2NnB5nbm6YGiifNVw7c/btAaNJLzDlxiV/69GfnDcrHsSEUuWBC6WvUvR4uokRlYsE/xqX0qHwadn7aXrn819OBqVnHk772swLLveq0vOHe+DZ6BTR4/lksbttf7V1HUh6a9qWiztDLxKD/a2wBLcn8nRscgZjh5gKgc7dx9f0aQpy34eVCLHnWkVgPKHFdAcmQZ/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQO23zdmEQX5Im/TRzDYImCkrekQS8jfZ6SEa9ZJD40=;
 b=BKXArym+GdZ3q33BM7uZf8ioZJHYJ8h/DHotGCT+lCLc+HKwPejiqR01Ya7gkO+qW/gDDJ5dj1tB4bZt+9an2QrA+wGRi1yVfi/lQMAJJ1pxm+83JJcxgJCDr8ztPGTrkHK9KaJ6D3qZf+/a4c60vGcy4Cv+KeYighCQG24F1T1XGwQc2K8Vza1f014MN4VxmRTXage3CXlkB9G2hD1Lb3MBfCH5r3tPBm8/vN/CygacF6Yh9VkfMjP4SgxT53lujZBpZpy+tzyzwWbr1Q6PBHOBLXrIegH6pvwk+THKmjWf0AzCQsiN/uSX1U/EVg1T4ZEdUWlX6L61GL6joQHPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 09:31:45 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:31:45 +0000
Content-Type: multipart/alternative;
 boundary="------------17xgkyuXqOhG0tHcpDrPwzS8"
Message-ID: <8ec923e1-fafa-44a6-80f0-05e9ce7b14d2@intel.com>
Date: Wed, 4 Nov 2026 15:01:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/hw_error: Initialize hw_error_work per tile
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-11-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261103060929.1586783-11-riana.tauro@intel.com>
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c250d2-b69a-466a-ced3-08df3a5670ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|22082099003|18002099003|8096899003|56012099006|4143699003|11063799006|261022075727099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: amYjWd7NudU1PWYlmyK//P8w/euf100kglBWdWKajO/o1XQwTlN6p3WicScRodHMKfBjmYDJQ2SUBxyhVhe7/WliCj43qEu9S/xzKM/2U5E1WGgueQpNiYICMmPDYX8WRNzIa5jxirOUxuzYjMwLqcx4kiB29r0CyRe8fZLQGeAvI8QHiSXXEO2/OD1B+9qCdlWQm4Okj9Mm7YdRBzsss7HEWybJwpkrR30vbSTj2xatNA0ScxVtER9SgSODGFIEUdj6wDkYkpK0CzyJ43wyr8P2aM0NbXW5nqWA8Bf23YhEG8OK6S1QIqfbWaMzFLIZqtJ30AJ4KgGBFFGNViiq8MD66IltB5M7jFaOVQ2RPqEp31SanaRr614DKQwqgN9ELVshEec8ZO9dYF1q4Jgw9fAh6YxmQNhruSUdCdAkD5w0JxaHA1I45uApKrB6xubpDFzunG1SZjG1SmKbNpL8RBeEsfqkLrRlMOLYmFlisLYSXtDsjl7jIYvABvZvBpirX1TrZciEcFmYNhQ6RuyvV/+IvR0LyAYh4assz6rx4T0no4R0Z+jwikqd1ZrZ7XuZ1NjbKn5QngsRo99PPJBWu/OwR6m8WsO8yEcbYB+1EmXWHTDC/2tX5n7JNZeVNiTKFLM7XAhXFWCphwGKZQC5dkZdBv+4pd66Ba2blIS8o4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(8096899003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGkrOWFXVXN1MjhybUZaelF6NWtqUGdtaHZ0UElwSzI4Vk8vWldXRENqYUgx?=
 =?utf-8?B?UURJU056cTJTYTk0Yk1xaTloNnBnU014ZHN5cGo5anZHd2JZMnhpbjF3MFda?=
 =?utf-8?B?M2c0TFNXTFBFMXA1MTE2TkZLaG1NMFZETThIL3VrejQ3UFZtS3BGd3g3eUVo?=
 =?utf-8?B?MWZDQUhKenZ3bm12aitFcUZkayt4OHgzL2RsVStWVjZZQjhORDd3NTFod1BW?=
 =?utf-8?B?Yjd0K0xqUjhzdXFHQ3FSTUJmb2I2ZlAxVkl2QXlSMG9vemFycFJZVnExcTNr?=
 =?utf-8?B?YzlRQUl6RGlDd1prZnMyNm1heTIvU3pMN2lGYUpWZVFqV3NzTlR1aHVSSmJT?=
 =?utf-8?B?REh6K2lzaGVidVpTNndxdndKSEdQMmpONUhHWmpkTXAvcm1kUnEwWHZWZzV1?=
 =?utf-8?B?Wm1pR0NrSlBqN1R4a1BYNWNwemdYaXNaOSt3RjludnV5amw2UWxla29pVy91?=
 =?utf-8?B?dlpTbFJySFlxeTNUbnJLVmZRL1IwcUY4K3NQM0VteTYwNUQxWjJ3NlExNUk3?=
 =?utf-8?B?amwzNDNoblR2b2ZvNUhiK1ZuZE8rQ0EybEpSYklWb0VONFByODUxdFV5cXNp?=
 =?utf-8?B?RS9WUTVNanBYZXlFOUNwZ0xJaVBUek1QRWcveHZnVE5nUkxyeFgrY1E1Y3py?=
 =?utf-8?B?NHFvS1lRZHhwNitZNjFtZ3ZmS1BYUER1aG9MaU5tN2licVhYdkF5NkRSZHVK?=
 =?utf-8?B?ZHNDYzErbHV4Tjc5Y0MxL2RlNjdlOVZlbnJNT1BOUTZyM1A1aFZuM21vWmsr?=
 =?utf-8?B?VjY0VUxiUkFqYXM0SFArT3RySGNmTnZvUGY1Q1BlYlRIeHpJMmlvM094U0Nh?=
 =?utf-8?B?ZW9ObEhFQjhQMERyS2dMQUF2SGQxTjlDYm5VQzJ0NmlXSTAvOEg0TkpzZWZK?=
 =?utf-8?B?ZjFrTFdrc0g5UXpxaXBBcWdmRStTSWRrMTQ2UFB3NmNJekcwbk0yS1BrVVE0?=
 =?utf-8?B?N2lRRjVweFNIRmZqYU5aUUd2L00rREt6eWtaWHc5Qll3MldGQncxdlBZS2tB?=
 =?utf-8?B?NEVJSjVUWml4TTZhc2FWV2VLWUtMaWF2TCtwWnI4Q3NjMmdGSlRpNDhETzlF?=
 =?utf-8?B?Z0FNeUVCb05yeHU5MUhXaktKcHBLeXVVbjUxRmc2Wmo2Q0w5RGVMc0lDaUY1?=
 =?utf-8?B?Nmw0MzV5dEQ3YytJSm1QZFlZczRtNjBOOEJaVCtrenJKTmkrdmdQZFhhZVFI?=
 =?utf-8?B?SlN4U2hMTTBzVUxSTWVXR3NGek54eEtoWkZrUThPbkZrZWlpOUNmTGg3OWk3?=
 =?utf-8?B?Ymc0bTlRMnB4K2JBTm1uQ0NWWkxUZzhlNjBwNEJabWZEelp0ZXJsOEtVeUJF?=
 =?utf-8?B?SUQxeDhVdU1jbmJyZHVBa05ycEdiVEMxQkhPbGRSVjVzOFErNWNzM1Bqazhw?=
 =?utf-8?B?aHk3bGRBdXlzT21VQmNOWVJvUUNCTnhoWDBNVGZQOXluNStCL3Ewb2g5UjJk?=
 =?utf-8?B?cWI5ZE1nRFliNVdzaW1uakNmdURhZG5waU00Y28wcXVSOTZsVmEzRmQ1azNl?=
 =?utf-8?B?eWRpbFpHc0d5OEsxcXZ0dm1Na2pxR0RYeWxpWXpuaHdRMUxCMy8vUTExMVg2?=
 =?utf-8?B?a2lSUFp6SVZQUVQ3cEs4YzFocnU1bjlFMVBKYjVTNmpwNThqWk84ekRuNmt0?=
 =?utf-8?B?QnJraEZ6TERwTkZoNHJSdVdpNWxUbnI5NHlqMElha1BiaThLMlBMcndBVktU?=
 =?utf-8?B?U0R0aW5jdWpieGg0UnRvdkdPNFJnc2FFSy9nazYrcnYwQ0IxbEVqemhmdTMx?=
 =?utf-8?B?cVBmT3JYNWhUUDdKSllLTFBCVnFYOXMxNnEzUEEvVnRiQncxM0lKNGg5Ny9B?=
 =?utf-8?B?ZENONmJMcDZYc0ZDRmJkRFpPaVBneTdDVCtlVjZ1OFVGQjgxSkViYll0clJo?=
 =?utf-8?B?b29ETVIvbGx5SldhUDhrVzBLNzkydmI0eUF2eDh5T0UvbjF1ZFFaQzJ1M0d4?=
 =?utf-8?B?b0ZZQVlFNEozZDIxNWJtTkRlTEZ6T09NUStRa1hLNWs3anVyMjVtazJNeXJO?=
 =?utf-8?B?WW1QcmxzR0Jwbm04Q1pSbXNzYmxTNTJ6S3RuaUlIMTZWa0F3b0k1Q2FtZjdv?=
 =?utf-8?B?Tk9zekY3a2t6NllMSDFyRzR4cXQ4OUczZWJiaStpUmxWMjZuMkpXcnZacWNT?=
 =?utf-8?B?ZHlsUDNORzBxSTJFdm1aNnJWZTFVZTZjRGttblB0c1g4Wml5RTJUa25FSlZa?=
 =?utf-8?B?aDJYVFVueTRlTFg5U0RjSjZ3aU1tTllEUTlvdWN1Y01OZ2dXa1lXTnZ6QjdJ?=
 =?utf-8?B?dWlHVURmcGVtYjV0REJFSk04SkFBZndqTFZOS2dHSE40ODNPU1VKNksyQThq?=
 =?utf-8?B?clFXcVo5MXN6TWcycE1qVlU5VitFUkJRbGpqK3lNTFNGSEVobVJ0Ry9jd2NL?=
 =?utf-8?Q?GqT+jSYgtr1VP5AA=3D?=
X-Exchange-RoutingPolicyChecked: vwiEqLnAu4qjfuyib9yiVN3dyUKKZukGVTrD2Tw9uCu7wHyu9KR+tuUcEoJJHYwbOQKaCHkoeNackiE1YS0fTrrsNbx6wYdRBB12RCuPdZEbrSwxjs6SrvlYHgdBPbZqqiaqoP3K2rDJ5J2DHcbcTat1sQsk0usVuE3B52erVJwWsCrxa5z6Te/rbyQ5T+7jXKN6gxzYigm4UaVGC7rX5hI38QKcmTNXRbW6JUabGbt2KAdNSC9WldCpEioa4Aos31aDTfPbPFv76+MUDyqFPD+6LHEZIbgvu3yc/T8mhZvmICwBFDaCdvTqB6iQ6xxG+XbVmZaI34LEhtrfd26Kjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c250d2-b69a-466a-ced3-08df3a5670ee
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:31:45.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scXCg/av6qDfyH5nlE0/9nLSYXRYMsKNQ2T02T7FctE5NbxcaVLgmM0l07n0nMO0PF7MsPu2hXAgkHz9Rp2exqkS21yZJkhMhTDF+Zp0OgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------17xgkyuXqOhG0tHcpDrPwzS8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 03-11-2026 11:39 am, Riana Tauro wrote:
> Since hw_error_work is now being reused generically, initialize it per tile
> so that we don't hit uninitialized work for non-root tile. While at it,
> disable hw_error_work on remove to prevent UAF during unwind.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: move disable work to xe_device_remove
>      add dgfx and sriov check (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_device.c   |  3 +++
>   drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>   3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 07a7ab6ac083..8f498e3e3e58 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -45,6 +45,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
>   #include "xe_hw_engine_group.h"
> +#include "xe_hw_error.h"
>   #include "xe_hwmon.h"
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
> @@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> +	xe_hw_error_work_disable(xe);
> +
>   	xe_display_unregister(xe);
>   
>   	drm_dev_unplug(&xe->drm);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index a934b649575c..aaa2437d40bf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,24 @@ static void process_hw_errors(struct xe_device *xe)
>   	}
>   }
>   
> +/**
> + * xe_hw_error_work_disable - Disable hw error work
> + * @xe: xe device instance
> + *
> + * This function disables work for hardware error handling for all tiles.
> + */
> +void xe_hw_error_work_disable(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_work_sync(&tile->hw_error_work);
> +}
> +
>   /**
>    * xe_hw_error_init - Initialize hw errors
>    * @xe: xe device instance
> @@ -546,12 +564,14 @@ static void process_hw_errors(struct xe_device *xe)
>    */
>   void xe_hw_error_init(struct xe_device *xe)
>   {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_WORK(&tile->hw_error_work, hw_error_work);

What will happen when probe failure occurred after xe_hw_error_ini(), 
how are tile workers cancel?

Thanks,

-/Mallesh

>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 5e3a11424108..944699331a93 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -12,4 +12,5 @@ struct xe_device;
>   
>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>   void xe_hw_error_init(struct xe_device *xe);
> +void xe_hw_error_work_disable(struct xe_device *xe);
>   #endif
--------------17xgkyuXqOhG0tHcpDrPwzS8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-11-2026 11:39 am, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261103060929.1586783-11-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on remove to prevent UAF during unwind.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: move disable work to xe_device_remove
    add dgfx and sriov check (Sashiko)
---
 drivers/gpu/drm/xe/xe_device.c   |  3 +++
 drivers/gpu/drm/xe/xe_hw_error.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_error.h |  1 +
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07a7ab6ac083..8f498e3e3e58 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,6 +45,7 @@
 #include &quot;xe_guc.h&quot;
 #include &quot;xe_guc_pc.h&quot;
 #include &quot;xe_hw_engine_group.h&quot;
+#include &quot;xe_hw_error.h&quot;
 #include &quot;xe_hwmon.h&quot;
 #include &quot;xe_i2c.h&quot;
 #include &quot;xe_irq.h&quot;
@@ -1118,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hw_error_work_disable(xe);
+
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&amp;xe-&gt;drm);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a934b649575c..aaa2437d40bf 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -537,6 +537,24 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_hw_error_work_disable - Disable hw error work
+ * @xe: xe device instance
+ *
+ * This function disables work for hardware error handling for all tiles.
+ */
+void xe_hw_error_work_disable(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&amp;tile-&gt;hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -546,12 +564,14 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&amp;tile-&gt;hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&amp;tile-&gt;hw_error_work, hw_error_work);
</pre>
    </blockquote>
    <p>What will happen when probe failure occurred after&nbsp;<span style="white-space: pre-wrap">xe_hw_error_ini(), how are tile workers cancel?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">-/Mallesh</span></p>
    <blockquote type="cite" cite="mid:20261103060929.1586783-11-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	process_hw_errors(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 5e3a11424108..944699331a93 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -12,4 +12,5 @@ struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
 void xe_hw_error_init(struct xe_device *xe);
+void xe_hw_error_work_disable(struct xe_device *xe);
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------17xgkyuXqOhG0tHcpDrPwzS8--
