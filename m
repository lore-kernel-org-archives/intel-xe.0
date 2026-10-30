Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9FB606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRmH8JSx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA2510E22C;
	Fri, 30 Oct 2026 06:28:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC70C10E83C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793341684; x=1824877684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fS8SQ3dNQqYK18jRX3N7LGCn6w+2vnuSgQnzF5BAZDo=;
 b=BRmH8JSxmGyuhuDwbtE9B7LdAzwnrC7qP0CStjWi+Y12aKP4iqmlFzZ8
 GlDAWs1CGd1b6UAo2hi5EWnu+apsTiSfdlYyN0IQW/b7MSNkCRh0NUpo4
 /IJC4NOihOvnxky9D4dt3bArF40uR/18IC+oaX2Dejfv+3q+gnGAEY+XF
 51SG2idnkPUFsGdVSyC5/2acG9C98TplQ1a7pyBWdffDSGECRr2KaOYnj
 MOXPPARYSKMu668FsmeFMldijbHbOCLthtnUGNGFENhtLNjxe22UT5pfa
 WdweDBIgJFuuHUN/hfbFjrKiCWP3NYVOabhqtkoFoU1Vuc3/akOcOXWCu g==;
X-CSE-ConnectionGUID: 6AojnHmJRKmg4GwDrfv61Q==
X-CSE-MsgGUID: c7pKExZNS0eJAUKnq0DU8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1991351"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1991351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:28:03 -0700
X-CSE-ConnectionGUID: dHo1Co8MR3W6et6/E725Og==
X-CSE-MsgGUID: bach0okMQUCVXMFcoD4IDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5674710"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:28:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:28:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 23:28:03 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA4QT62K4gWHdmjZtWNlFuAikCLDjERiTWoiz5qiWGO4JC6Nq6avgXvzEOlJjAqa6eMCCKW3lvkUcEf8cEyIQ0PQrd80Mw3RFXpAyi3tfrFC1+KiV39gbTYMwU9P50VUrRxoOnkWSm85fxJ0kFY6wlJvrjhmcryOgDHB01v9SJayE0m9j/HSOIO9x1NNeHAzP7YZ9WQb2dBQyd3q1VqTjGK+Yry9K9DcT0l4iIsnkznl2WiFiP5A6Ol5X0V/FBRJ3qHne6GUPdOvKvratASW0B1V7DC/Z2a5Q3EJfpudH+Y5DopQ6K++ntyt5QR7AswSrA4vInhnmlpS530ff2SL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdgfCUE980Y6rh2dovLscwhSREtJlhVfxTJzstt9D/I=;
 b=aLPSSh5Wo0zlzIBM13MErJtc6Gc8x1xzn/St6G0/pOX2FnVFQN95rOnLekwdBCn4Srdbssr8NU77POi+8xbSnYrbE8m+nQZD/+ykyhyv28F8w5hpH11cXDhfY/wIpaBagTS4057zGNIH2RrcMoKEYp2DMbZyr30ayiXYqCpZj28B2i/6RGfn/DhblG+3pMAl99SfwJj12sO4NYtw/XJLtMF6o3U7xRztExfHCzh83cy3R/hammUE3jFUZuwyRmSL0YJbIXPDxuwDCO24incZmWqN6J79S+IRe383Wo/tBpJhW+Zcd+BcYkO/mmfk9QLCQtUMgsBK0lvhWepPjXlOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 06:27:56 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 06:27:55 +0000
Message-ID: <260fff8f-f1e4-4de3-862c-af96ece94b39@intel.com>
Date: Fri, 30 Oct 2026 11:57:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/xe/xe_ras: Disable hw error worker when AER
 handling is in progress
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-18-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-18-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f7c624-3904-4e7f-7b2a-08df364eeee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261026140227099003|6133799003|22082099003|18002099003|261028144727099003|260925021911599003|10067099003|261009221727099003|261009223327099003|261021121427099003|261022105027099003|261009223027099003|261009221227099003|56012099006|261026121527099003|11063799006|260925022911599003|261009220027099003|260925021311599003|4143699003;
X-Microsoft-Antispam-Message-Info: mA7j5qjhbrspIdfzHRCztWbqhtTa+2PgruhgrcXPnJkdwGSaWli4ejZMQBVSBdQxQ8KFYa5tjG8MFmHZprIyjxA8rRZfFTt9o9BayzpPcBELnM6x3k6pH7TduFGDqCuLpriu6khze0k5umLahI4lKwyVKr8ZG2GgtTiugxiudd0Leow5x427bUR7m/WmADd+3XebyFB+dydhC0oAU1zpfm4caF3B5SxFuIDx7iEazi3LdVsCJsTOZRRzX9XtmyFeVS7AerMvYoooODf95IsE6jj+bQ8nH67dNqP8jtfKNrpethfZ7tKT2+QAGP1bFORmVgPTGMUheM6tCBn+SvLg7sfJFBQBEjliJaerthiYFhA7eYYep3v6xdi/Ma2ILT23z9xNalEe2nhZgAZaTVCJschXmUCG8x/nq22HRBLxOeHSaWztyS3YHXr06hz9rkqDtKwM9csjsHF6iBLlMrgH6E8O/5usUAd64WEje5rNrJWuX4vkX5qgJpXGvBXkhR7QZBnLDPBtU71oNWsU8Ll+h2DaigP3C9fswJd1DFUqxgAeFJ/kRNKoukHQqCDCuyeXEfUWrGKNpTUd4z3U7h2NU/GFBiIBuGjG0C8tp8mdZh2966jPmkH/6/h3aC+iFYSzZKSvYqdpYI2GTp3422umZo7uCTnLOHKq/Nc3VPJUGUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261026140227099003)(6133799003)(22082099003)(18002099003)(261028144727099003)(260925021911599003)(10067099003)(261009221727099003)(261009223327099003)(261021121427099003)(261022105027099003)(261009223027099003)(261009221227099003)(56012099006)(261026121527099003)(11063799006)(260925022911599003)(261009220027099003)(260925021311599003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtZY2grVVlFeHBmdTVhSDQvMmcyeVRJcytQOEUraDZPVkdVSlR1U1ZzR0Zr?=
 =?utf-8?B?UEVlQXdQUldoRnFFZzd5TWEyOVBFM0U4bnFxaU1jNVpUbmxVdGkvcDZkOUFj?=
 =?utf-8?B?b05GT3d6YmxDMWphUllkVUxtTmFtUDBpUlVPNTczQlFrd0JXbitRU3JmbjhM?=
 =?utf-8?B?VzJqZi94ZnFYckpZcmNTMG1La3g0cDJjcVJoUDk3NjhtcURmcms1SjgyWmpy?=
 =?utf-8?B?c1NoazN5YzJOSnNkOU5wbzFVMjFTWHRMaWFNYWpMVWM1ZEtkc3lLWXpVd2lo?=
 =?utf-8?B?RTB5RUgwQi9sRUtkMm5wOWg1V3RxU042NDBGMXByL3Z5YTRJTC8yUERMbEpS?=
 =?utf-8?B?VzB6d0xiQVpORGdmZ3JoUG54ZmFhL1Y4RkdiZkxnWlZhYUxad0NNRk9qOTFJ?=
 =?utf-8?B?bzladGdKS242blJPWkFmVm5OZ3RoZG5DS05QRU1zMmFUNE5oN0J3ajBxKzBX?=
 =?utf-8?B?bk43NytxYnpTSjZQT0pQaDB1aXhOeTVDR0VXTU9ZejlQTDB0MjhETGZGNHBn?=
 =?utf-8?B?UjQyVG81bERibGRlV1BndXpGQnNUZmdqdlF1U1h1emlXb2lTaWVnQlBnRThJ?=
 =?utf-8?B?bzdBc2R1ZFh5RWpaZHBLM0hRVG11Wk5aSkh4aUxPUDkvMkZDczVGckVNMU1o?=
 =?utf-8?B?aGRVeW1QWlBoVmVoVi9VTU1kd1lIczhTeXc4Wm5aa2VKT0kwY3VaanRZVjdL?=
 =?utf-8?B?by9SRlN3diticjN6Vk02OVlMdkJGN0JpejZZaEp1b1FRT1hxaWVvaitOVjlH?=
 =?utf-8?B?UFc1dHA0RE9KOWhob3RWd3BaM29NckZUR1pDNHNhZlovK0FxQmZ6ak5TYmk1?=
 =?utf-8?B?VUpzelFJaElCak85L2JXSlVZQ2R5YUZGdktoN2VFM3Y2cGFDeHdTbWc1S0sw?=
 =?utf-8?B?WUlXOHNUUjErem9KeGxlNDA3VnZKdU1TOEx1Y09GVEZQalFSSlZLZTJxNnlF?=
 =?utf-8?B?Q2JySW9lSkh2ejQ4cWoyWkYwUW5ETUZjYkRpRHlvUVp4UVdKQTg4WGZPL1Rl?=
 =?utf-8?B?ZjU0SHJyRUhORVhXYXFaZGxQeEFDZ0lWendwUTBkUFZlenZFVC9TeGgwbXJr?=
 =?utf-8?B?ZUVROHRYY3J0a3J1RGhwRDBXTU9tNGsyT0FCc2xjMG0rTEwvYVU1TzlVYkU0?=
 =?utf-8?B?VnpvSWFKZ3RwZWNJRWoxTExDRG5Da2ZqbXAySTNONVFtQTFTYnViK3lGWWJa?=
 =?utf-8?B?UU81MHppKzMvQ1lJRGx5c24vMTQycHcwZHdiMmVFVzF5YWMwNFhYTHVkMHpT?=
 =?utf-8?B?ek8zM0RBU3dKaEpKQkRHRzlqY29ZUUc3UGhmWUQrN3ZoNkVOaDluWDNRMkRS?=
 =?utf-8?B?dWJDTnpQMThHajJxaDBPeURRSkh6Y3dLMHZrOFNnZTRtcTFmNW9qNnB1SU5D?=
 =?utf-8?B?ZmFUbkZjTytkMEdCR3kwd0pEWkpsK0M0SUxIS3hoMVNzSVpKTnh3ckNwbWRk?=
 =?utf-8?B?TzRTR1ZyQ3NENzZLRGdQMDBHM0NYS0pLLzRndFJNakVTbGtTblQrRm9rN2Fi?=
 =?utf-8?B?VlcrMTNVS3ViVGRoZjkzS0VSYXZXU0R1alN0c1B1Sll3L2RqUXZHcDhOTGJH?=
 =?utf-8?B?MUJHOE9MN0c2czkxcWh2M2VURDQ3cWY1TFZzOUZPRy9IZWxqOFlnTVFDMk50?=
 =?utf-8?B?eEYvdUh1L1FUbm9DaTAwQ1BUQ0xDeEJVZk56bmF5bkhhSzlpWnRucnZocjNO?=
 =?utf-8?B?MDV4NHFzcFhvdS9adUhydzBubjBSUE43VjV1TSt4dWQ0VTh6QnBKVGpxazlk?=
 =?utf-8?B?UkpkalgrOFdqcmlDY3JpSGdraERnb0tZWFdUZ0ZpOWNiUDlrN25sVU1vT3pE?=
 =?utf-8?B?ZktlYkgxb2dkMWNjeXVSWFFQM2gxTWQ3aXRoMUJtOGxkVG9WZWpTTG94SkZR?=
 =?utf-8?B?YjdxYnY2cGFDdXRTaFE4Y0E4QmJOaDhwRmVBTkpDWXArcjIxaGM4clNWWGwx?=
 =?utf-8?B?QnFwK0UwYWMzbTlpRTd1R1pGY1EwNjl6ZE1CYTVGZmo0U2RodjI2K3phTTBq?=
 =?utf-8?B?MG5iVFdVWXNNRk0rMVo3eUIxMGNzSlUrd2l0eGNzY0xEU1QxWklKZ2VHK29k?=
 =?utf-8?B?OG1MTjIrckFZSGFxZVFkZUpValVzOTNDeDYrMjNLT0RkanAxYjRLOEowVDBy?=
 =?utf-8?B?VGtXN0pQbU0vam8wdTBrYXR5MFpoN3hxQmpMRTdxeXVTQk0yMDVCTGpselJY?=
 =?utf-8?B?MEZmSGlnQm85aEhwdk9XMFdNTEl3c3hBbmY2V2NLOE8xYXB5T1dqZTJ4WEdW?=
 =?utf-8?B?SlJORUR2bmRmNEY1WG1QeGpPRVFoanEyK1k5TUtiKzVkcmxQQmkydGZVS0d5?=
 =?utf-8?B?MzZnRFVTN2RIRWpUaGVDdGxadFVpR2VVSFdSajN4bTRJNy81eVlCd1pLVDUv?=
 =?utf-8?Q?3ClZH1YUC3vykpRk=3D?=
X-Exchange-RoutingPolicyChecked: Wq5BfxH9yxe1eKl8S8J+BNXPHDyTd2UqjUjECmq6WwcRNeNIGa8Jh0OQB4D0f07KO1mxi5Hnnk9BlDjjpVsXHS53gTLPsVVM+LxvnD5VZxaTju+Qqh3qNwZljn5HhCFFruwb+sTx4f7caRUhoIABuEzu19ZUORvLf974EuBwKEoNGJ5a68jhlRJhaTA7+GTFZISqZvRz/GpMRwxM9bID93HhxO7c7ImqzMvpGGGW0v7P5+p43HItUIcqH5HCcIaR0vTSoabwzSkacRDZNygq+ldIowN6QTBCBGg4Jf77ZaW1h/WVoZSaQRvWKcbDnwN3AcKY5u5JLqGoGAOxs3gz+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f7c624-3904-4e7f-7b2a-08df364eeee9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 06:27:55.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8obmmOUH2itFIUjrcXq7dLZXlUmxt5S12BAfXkyvFJexzceFtV8ewy9KuqKsj9hvR6Wb5a9N+31TDGdQx8+T58wPuoUmzDCJA9O6l/NpOEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> An uncorrectable internal AER error event is triggered for device fatal
> errors. If non-fatal error processing is in progress, flush and disable
> the worker to prevent further processing, as a reset is imminent.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 33 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.c       | 12 +++++++++++
>   drivers/gpu/drm/xe/xe_ras.h       |  1 +
>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>   4 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 9bf0da3a3d15..b27f8a0f1b17 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -5,14 +5,18 @@
>   
>   #include <linux/pci.h>
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_hw_error.h"
>   #include "xe_log.h"
>   #include "xe_pci.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   static void prepare_device_for_reset(struct pci_dev *pdev)
> @@ -54,6 +58,26 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
>   	}
>   }
>   
> +static bool is_aer_internal_error(struct pci_dev *pdev)
> +{
> +	struct pci_dev *usp;
> +	u16 aer_cap;
> +	u32 status;
> +
> +	usp = xe_pci_get_usp_dev(pdev);
> +	if (!usp)
> +		return false;
> +
> +	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
> +	if (!aer_cap) {
> +		dev_warn(&usp->dev, "AER capability unavailable\n");
> +		return false;
> +	}
> +
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
> +	return status & PCI_ERR_UNC_INTN;
> +}
> +
>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -67,6 +91,15 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
> +		xe_ras_set_aer_path(xe, true);

hmm, we are setting AER path flag true here, do we need to set false? 
since same flag is used IRQ path as well.

What will happen after setting AER path true and we see Double bit 
memory errors occurred on IRQ path always,

So the memory page are not going to offline right? how are we going to 
handle such cases?


Thanks

-/Mallesh

> +		xe_hw_error_work_disable(xe);
> +	}
> +
>   	switch (state) {
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index a91c3d924e8c..42fb24366a6b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1170,6 +1170,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>   	return xe->ras.state.max_pages;
>   }
>   
> +/**
> + * xe_ras_set_aer_path - Set whether errors are processed via the AER path
> + * @xe: xe device instance
> + * @aer_path: true if errors are processed via the AER path, false if via irq
> + *
> + * Set if errors are processed via AER
> + */
> +void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path)
> +{
> +	xe->ras.state.aer_path = aer_path;
> +}
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 1b358c7d040f..06518226db85 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -23,5 +23,6 @@ int xe_ras_init(struct xe_device *xe);
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>   u32 xe_ras_get_max_pages(struct xe_device *xe);
> +void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..558df12bcd9b 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
>    * struct xe_ras_state - RAS device and firmware state
>    */
>   struct xe_ras_state {
> +	/** @aer_path: True if errors are processed via the AER path, false if via irq */
> +	bool aer_path;
>   	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
>   	bool disable_vram_page_offline;
>   	/** @max_pages: Total number of pages that can be stored by firmware */
