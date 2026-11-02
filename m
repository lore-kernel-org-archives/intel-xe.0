Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32054606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OVxfhzVM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA56C10EB52;
	Mon,  2 Nov 2026 05:59:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630FB10EB52
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793599143; x=1825135143;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aQX7auw1wjtRf19L2FMcDlbQ0teYRl3EejT2kXQkVEQ=;
 b=OVxfhzVMVlvfd2vk1oj1XcvCOanh/6nY0WVbM+9EEJk3WjFUVvOIhgXt
 2LuqQSjK2hUXE/W4tQXAQdq6Z3giZybpci3HgbPl/YU3PaW9N4h38cRP+
 9OXQViPKPQHlQGfsQOU2d+9Ixf6LOINHiPdMFH78D+bfIPxKGe3t72E3S
 1FiZx6hX+GZrDz8KHE3JdsEdvPPVa+x/QCb5GImjP64yNrUj/AvK072GJ
 FgtItGwy8ZpPeDxSJ1K+i6XT6P8RO0hmd4H3KlycN4vK0seJ9cacU7quC
 fFBTtShlkARqQI85CrGby5/Rxqu7IRSw5PG5aFbKtglWQfsaA2G/64fVS w==;
X-CSE-ConnectionGUID: YBjfbNK3Q4mmodYiiuINCg==
X-CSE-MsgGUID: VvnWarTvTIuz57D95gWsQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2382985"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2382985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:59:02 -0800
X-CSE-ConnectionGUID: U3zZAWpGQ3STkmu2c/iKrg==
X-CSE-MsgGUID: hrEdbpM1SDyPSDtd0jxHug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6180653"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:59:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:59:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 21:59:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 21:58:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSJKsGzqLUWMTuh34sh8YKz8jlcdzOcnNsm/f2u+OD2ew3Jr9mfbsIwqPCd6EwZD4+2/OXVK22pXxGniz4YuLfPCxmzA14HHs4sWkcqs5rZswm/sm9GwcUPh/i74qqm0uYp90LydP8+aq4Cifa5okLlpcOFPt2hk6ZQ3SYjeUm9/XgxJHxhAV210maSGq189jsS8rQTG4fzd+/QxEuCiRHQ1MIprwcTpwgDZxPGLjg2rlx9mmijEifzcdMFUWLJeqQImhUiyJnnEknMkNL2Tt2y2wtS6MssZGoTHwakIRfbCtZxinVGCnxgNnHxdWXNZOgZanTymcaJbjKQg3yKoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsnhFwlHWZuP87O7GS7Cc4QfmL5L02zjmt2fix7JnlA=;
 b=YDfhyJKDWXdVb6vyjomR9Jgu3m04MrZjiyKnK8BRvQubeSIhKC3tDgWiCD5kXRsLD9J0TlnAiPhPvvT3m9zXtyeBD9VLSnU2PukjvJmSL82x5AWfRP/2XyO0Ia9ZS75oG1nnm5muEmN7seedKBCH8XAHrVc9djs4CXcTjUGg3wHWLQKD4JsxC0O/+c9ijRhO2xWF4F1IPMk8EVHGwtKVOpHXnNRhyH0zzfKet7O0bFXeSuZShjEuiUJC3uatTECn1gISG3gM6CQPuBzT8uQyg5QgCj8Kk8f52EGfKYkWUVG9C+aX2nt9C0WzxAVDu/tkAGiZn8kiK0xQD5pXFC2MJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA3PR11MB722019.namprd11.prod.outlook.com (2603:10b6:806:531::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:58:52 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:58:52 +0000
Message-ID: <d6821cdf-bad0-4551-a631-bff6d2898425@intel.com>
Date: Mon, 2 Nov 2026 11:28:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] drm/xe/hwmon: preserve fan user table across
 suspend resume
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-9-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-9-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA3PR11MB722019:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f31909f-b0b3-4fb7-e9c6-08df38a65f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261021130227099003|261021123027099003|261021121427099003|261021133027099003|261021135927099003|261022113327099003|261022105027099003|261022115727099003|261022075727099003|261009223027099003|261026130827099003|261026121527099003|261026135527099003|261026140227099003|261028144727099003|11063799006|5023799004|4143699003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JWTVZim7V98/jr6s6I2Rkd09cN+6u5j0fXGcQXLdrHtOPBcKzHC6f7kJVIacQukOV7ekcedwX6l8vY9M2j7eHVJpQ98dzm55nyxravd649U3TTYvRQP7aUaM0jRWtbrhTdMskoyKDIVr1X0UVFiDkoidux4yqR+fC66agjkGo1C1J8nl66GCcPDtiO5WwKMbywwp/SuuAylbuJCKetRR5dzqMppXO/22ciHyntx4gUppKN0jmJqhIb9utpI4quVX9cLiq7NqM3ek5cKCPYbWUkhkgZ2/v4yZGNQ2PTXjF4aSjR0VqkfD0vrM1QO7fObNlSf3nKVCLIZDow5dpbX3Gx8O/qNlWMMTqr3UO2ip+76h5ukf9/v1nsu0lTwsDva7unatHvAtBQ9RsxFTyKtsMRzUhTmbiuTLPtSRfCCygf7sIUnDDT5XpAjWYsusF2kXZgoKpC3WzRvV54CptwPRlTHeyXz7lJ6KN3ZqpdUKiPRNhtzewE0+2voZYQaHFrlIG0513snHWNdrGxk9DpCimFFF6wqABEkPrMdmdtB0HjxDI9SEU/CFqb8L5L5XZdG//ByYg34DVo/wA+z+7ApHdjnEjtOXMwVkGVgJSArOfLxHwIWfaR8x6GZPhEJe6zmEPLOHUHGdOM6pMgo7H6jGytljDdHxNaDHqfXA2Ct1b/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021130227099003)(261021123027099003)(261021121427099003)(261021133027099003)(261021135927099003)(261022113327099003)(261022105027099003)(261022115727099003)(261022075727099003)(261009223027099003)(261026130827099003)(261026121527099003)(261026135527099003)(261026140227099003)(261028144727099003)(11063799006)(5023799004)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWdiUjB4K2hBMms1SmlISjlVQkxWMGd4cTBTUHMyVDM3U0pxRVc2OGdycGlW?=
 =?utf-8?B?eitlWWo4VHhrUTQvMWZTNkJvTGFZNVVHWG1heHVZVmZQeU9KaFJVZ3VibFJS?=
 =?utf-8?B?c2dwTmJxUkFxZDk0U25ycUZxcVdCKzZNQlZYQS9ZK2tkZndvblhpWkFOUytQ?=
 =?utf-8?B?aEx4S3VFYk9Nb1ZBaTdrVHZLVXlZOUhYUElRdUx1dTBiU25ZcHlvcmkzMnR0?=
 =?utf-8?B?dkR0SXRhcjNRTFNKSGxYaWFqbnI0SXB0L1diajEzc3NVaGlJWUhnYzBIU1Ur?=
 =?utf-8?B?aTVDNmJ0QmRnU1J0ZVJxWGlmMERsMVFMSzNYZWMyTG85RGRuODY3NVVnZUs3?=
 =?utf-8?B?djc3QnFRUHIxaDNJTVBYTWlWMlRjRktSRFpGSkpJWENrZ3l3K3VjKy85OG1C?=
 =?utf-8?B?Y1RMMUdrSEJvd1cwbXovS2hyeFRCL2xtVkNMTzN0aFFxOUIyT0RjQlVpVGlK?=
 =?utf-8?B?SWEvaEN3blJUYVlhakxsRlJkZkZaSy9ZSGxVSlJXRVN1WEFOZkNjYi9lYkI4?=
 =?utf-8?B?eHdFeWIxamVLNkpFNzNXQmZ6emE2VklMRllSOVNIeFFCUWNDOE8ybHRIT0dQ?=
 =?utf-8?B?cHBmSEM2SzVuOWRWSVJGWmMyVFB6Vk45OVhtQWhWMGpGdnIxYmpOZW51VFJK?=
 =?utf-8?B?am42MGxtcHlsZFVhYThMNG1yU1V2eXFUbmVDaHJOQjZnMDgrSjJiZXRuNU8r?=
 =?utf-8?B?RHI5RFVhdEN5ckZJb3VnRW5JeVFNY1VyNkZ5N3c4Y2l2OGI5MERMbUlqQmgr?=
 =?utf-8?B?WDdXWVJHUXhsc3JuN0RabHYzNHlDVmVuNFlGejdSQ09zbHBBYjRESS82a1dI?=
 =?utf-8?B?bHlEV0JJUm1Jc24zQXBJK2gvdzBSdGZZYmdWeW5Nc0ttL2s0TjVRWmpTajdF?=
 =?utf-8?B?OU8wQXdjaTN5OXFOVS91T0MyTWlXQy95dDY5bUlqWTlZNVlXYVlZTUhZZHBv?=
 =?utf-8?B?QlBpQllQWXVlUm9qSmVxeTFhY00vZ2x5bXlkd0ZwVUdTVHNsTjNGeG1McjIv?=
 =?utf-8?B?ekplU0dzYW1abURmMTU2UXF1RTBTQ1g2YUhFMFlhTDA3SGhLWTJhTVpaZmhB?=
 =?utf-8?B?dy9FMlo3NWUrWWQ4TlA5c0pkb3hzZjdlS2pmMitEQ1NMbzQ2YUtoSmFLUnZZ?=
 =?utf-8?B?VGtrc2w5VWx0dkVQU1U3ay9JZ1ovYnRON2RrVXJxMlF6eEdNcHMxVnVhY0xu?=
 =?utf-8?B?L1JNcngrR21PYUJVTHJhTGt1U0hoWVhYRFZNSDdyZlpWbXBGcy9LalQrVG1r?=
 =?utf-8?B?dTZZaUFpdGpJaTI5M2o1MnBBZ3Nwc3pHeUlzS3l6OHFsNlpoQjBNUDdkNHcr?=
 =?utf-8?B?VlFrME03aGEzanBDcXZ6OXRieFZ3dzR1WTZ6VjBsSEtpV21BbWVaQ2lRRkpN?=
 =?utf-8?B?bnN0WWZLZ1JkaExkTHNMUGRIOWFwNmJFbkJZTlhVNWRwSWtVT0l3MzkxcmZv?=
 =?utf-8?B?aksxbVhKY2tQT2FwQ1N2YVBabkp1N1FBdUZQQWJzU2lzNDlKcjVNa2lnTDBR?=
 =?utf-8?B?a3ZRR0pDR3hraklQdWFsRmxwMlhwTTNyWjAybjlObnYxN0ZlYjJmMDlCSDJS?=
 =?utf-8?B?RG0wNHc5MmlsY2hlcXVGdmt1QkU2ejl3TGErRHdudjRyUmVDdTF0Z1NpdWFl?=
 =?utf-8?B?STlSQ1RhclpnM25OamM4ODVuVEZWSmxhMFNMNExwUE02Ujdsd2R6c2NIcERk?=
 =?utf-8?B?TXZucDF3SWNyVWNxY1RqR1IwYlZzUFI3ckt4RDBwVks3WDc5VWZObG8xb211?=
 =?utf-8?B?RmIzRmN0WGZCdmQyRkNIdFNRSkpaWUhYTFJDYmlzaGtOSzZZaVZCWmZmZTEx?=
 =?utf-8?B?Mzc1KzVEenVMRG5vRGQzSzBFdkVDcWE0emhjZ3Y1MlcxeUd0ZlA2Tk1nVWhF?=
 =?utf-8?B?YkRHYkNONXdxSitldHB5NGlPT0lJSjQ5N1g0L2hnRmtuWnFTMlZPV3hrdTFZ?=
 =?utf-8?B?SWU3QnNVMEY2aWVmaTdlczhBRUxBQjNRVlF3YmZydTU0a0wwZkx0YTJ3R2hi?=
 =?utf-8?B?NmJkSmczejlhS1hSL3NvY3VHdndCaXFWelBXYTl0RERpeGRqZkNmSURwR0Rl?=
 =?utf-8?B?N0xtYmg4T2p1SmZIVHVRMHV6a0xBcmN3Zmp4ZTAxUGt1YmRRdWJjMGtaUXU4?=
 =?utf-8?B?WGVvVmk1L3Ivb2RjN3hNWTlUMGFOSThaZkxLRVJsbThVTjNYdjAxNzFkbGJq?=
 =?utf-8?B?b0pvanBKTTFEcTcvYW4wMzY5UXlBNUQ2d3p3UkN2bWkzQllRZUN3T0VaUWRC?=
 =?utf-8?B?QVYrTHhndjR5dVd2VWQ4Z2ZsRGdxM2tuSkdaeGxraGtQU1hWWE9TRHBoUEZt?=
 =?utf-8?B?UjMxVjFqTzlNdWlBSnM2andFa2xNK1Rtc0x6R3d1am1Xcy9RVDVnWkl4blNY?=
 =?utf-8?Q?k5Vmh2mC7aJTYiSw=3D?=
X-Exchange-RoutingPolicyChecked: uR9Ix7A2byNZToCVmbD1zTgyisgNcyfgTw2BUlHu+SpfMhKCW7s4roFaao7J96vp94Vd1ljcEB9y3C3LaKqGrm/qPyTRq063l9scBjIGiFNAcHoaM0tu/NOMuyE1cuauGdGtVPSsPXqWAMzm74+ASm6kvBGdFWB5Af8ozRtGcbRYUdcGKWg50+a3BeC53uaH6p+dLP1rCRGPu9swMdtsHahkNmyW0AxxjOCnXXBHMJk75BI4RdoC07JjRZChr+f7ur4bGykJktDY7v6qoFqVABDUtM16WUV4URDa7BvYWF94lhnreaIc2juqk7SP3rQvJ0AniDx0Gd21DqBEaMRaTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f31909f-b0b3-4fb7-e9c6-08df38a65f4b
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:58:52.5552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maiFaBb+CBOh5JqE4wIUgxd/P9hjVwNIeKiEfa6+zvCk7256aBYG1AGv1vmTVFn7TXFzV3fSire/jk+Hyk5YbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB722019
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

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Save and restore active fan user tables over suspend/resume via new
> xe_hwmon PM hooks, and run restore, only when d3cold is allowed.
>
> v2: Use xe_pcode_read() instead of xe_pcode_read_timeout().
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 136 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.h |   4 +
>   drivers/gpu/drm/xe/xe_pm.c    |   9 +++
>   3 files changed, 149 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index aa3c921407b5..d9f6cc9c81f6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -251,6 +251,8 @@ struct xe_hwmon_fan_info {
>   	u8 pwm_enable_mode;
>   	/** @is_full_speed: flag indicating if fan is in full speed */
>   	bool is_full_speed;
> +	/** @restore_user_table: restore user fan table on next resume */
> +	bool restore_user_table;
>   };
>   
>   /**
> @@ -3122,4 +3124,138 @@ int xe_hwmon_register(struct xe_device *xe)
>   	xe->hwmon = NULL;
>   	return ret;
>   }
> +
> +/**
> + * xe_hwmon_suspend - Save hwmon state before suspend
> + * @xe: xe device instance
> + *
> + * Save any hwmon runtime state that must survive PM suspend transitions.
> + */
> +void xe_hwmon_suspend(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct xe_tile *root_tile;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	/*
> +	 * User fan-table restore is limited to d3cold flows, so skip snapshot
> +	 * work when d3cold is not allowed for this device.
> +	 */
> +	if (!xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table snapshot\n");
> +		return;
> +	}
> +
> +	root_tile = xe_device_get_root_tile(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan = 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +		struct fan_control_point points[MAX_FAN_CONTROL_POINTS];
> +		u32 point_count = 0;
> +		int point;
u32 ?
> +		int ret;
> +
> +		if (!IS_FAN_ENABLED(fan))
> +			continue;
> +
> +		fi->restore_user_table = false;
> +		if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
> +			continue;
> +
> +		ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +		if (ret || point_count < MIN_FAN_CONTROL_POINTS) {
> +			xe_warn(hwmon->xe,
> +				"fan %d point count before suspend invalid, ret=%d, count=%u\n",
> +				fan, ret, point_count);
Consistent terminology: elsewhere "user table point count" is used — 
could the same wording be used here?
> +			continue;
> +		}
> +
> +		for (point = 0; point < point_count; point++) {
> +			u32 fcp = FCP_INDEX(USER_FAN_TABLE, point);
> +
> +			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +								  FSC_READ_FAN_TABLE, fan),
> +					    &fcp, NULL);
  Could the common steps (for both read and write ) be moved into a 
small helper, so a future fix (say the mailbox command changes) need not 
be applied in multiple places?
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"fan %d user point %d before suspend failed, ret=%d\n",
> +					fan, point, ret);
Consistent terminology: elsewhere "user table point count" is used — 
could the same wording be used here?
> +				break;
> +			}
> +
> +			points[point].temp =
> +				REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			points[point].speed =
> +				REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +		}
> +		if (ret)
> +			continue;
> +
> +		memcpy(fi->fan_table[USER_FAN_TABLE].fcp, points,
> +		       point_count * sizeof(points[0]));
> +		fi->fan_table[USER_FAN_TABLE].point_count = point_count;
> +		fi->restore_user_table = true;
> +		xe_dbg(hwmon->xe,
> +		       "fan %d user table snapshot taken before suspend, point_count=%u\n", fan,
> +		       point_count);
> +	}
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +/**
> + * xe_hwmon_resume - Restore hwmon state after resume
> + * @xe: xe device instance
> + *
> + * Restore any hwmon runtime state that was saved across suspend.
> + */
> +void xe_hwmon_resume(struct xe_device *xe)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	int fan;
> +
> +	if (!hwmon || !xe->info.has_fan_control)
> +		return;
> +
> +	if (!xe->d3cold.allowed) {
> +		xe_dbg(xe, "d3cold not allowed, skipping fan user-table restore\n");
> +		return;
> +	}
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	for (fan = 0; fan < FAN_MAX; fan++) {
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +		int ret;
> +
> +		if (!IS_FAN_ENABLED(fan))
> +			continue;
> +
> +		if (!fi->restore_user_table) {
> +			xe_dbg(xe, "fan %d user table restore not required\n", fan);
> +			continue;
> +		}
> +
> +		/* Re-program cached user-table settings for fans active before suspend. */
> +		ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
> +						       fi->is_full_speed,
> +						       USER_FAN_TABLE);
> +		if (ret) {
> +			xe_warn(xe, "failed to restore fan %d user table after resume, ret=%d\n",
> +				fan, ret);
> +			continue;
> +		}
> +
> +		xe_dbg(xe, "fan %d user table restored\n", fan);
> +		fi->restore_user_table = false;
> +	}
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index d02c1bfe8c0a..6c6f30208508 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -12,8 +12,12 @@ struct xe_device;
>   
>   #if IS_REACHABLE(CONFIG_HWMON)
>   int xe_hwmon_register(struct xe_device *xe);
> +void xe_hwmon_suspend(struct xe_device *xe);
> +void xe_hwmon_resume(struct xe_device *xe);
>   #else
>   static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
> +static inline void xe_hwmon_suspend(struct xe_device *xe) {}
> +static inline void xe_hwmon_resume(struct xe_device *xe) {}
>   #endif
>   
>   #endif /* _XE_HWMON_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4a745c3a933b..e5697b3893af 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -23,6 +23,7 @@
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_hwmon.h"

Should be alphabetically sorted.

Regards,
Soham
>   #include "xe_pcode.h"
>   #include "xe_printk.h"
>   #include "xe_pxp.h"
> @@ -189,6 +190,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
> +	xe_hwmon_suspend(xe);
> +
>   	xe_display_pm_suspend(xe);
>   
>   	/* FIXME: Super racey... */
> @@ -290,6 +293,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_late_bind_fw_load(&xe->late_bind);
>   
> +	xe_hwmon_resume(xe);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	xe_pm_block_end_signalling();
>   	return 0;
> @@ -615,6 +620,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (err)
>   		goto out;
>   
> +	xe_hwmon_suspend(xe);
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and deletes bo entry from user fault list.
> @@ -726,6 +733,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	xe_hwmon_resume(xe);
> +
>   	if (IS_VF_CCS_READY(xe))
>   		xe_sriov_vf_ccs_register_context(xe);
>   
