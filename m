Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC6606A336
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 01:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rk96MOyw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A298010E2C7;
	Tue, 10 Nov 2026 01:00:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA23E10E09A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 01:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794272426; x=1825808426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=98TCDROK715ZNXEMjIqtAuxI81mC+Wlty84TuM7Mrd4=;
 b=Rk96MOywmjfYfJbi1OybggjEZsHDb/skZNzTiOFs0PAfGcDKzEybaEn3
 OerfYkWVmV+CYIZ9XvRYwYV43WPB6Cz+eXZdTyddcO9zokAFgQeKEqtDC
 VN/GOI33hhO2i9AsSTsQoYOD0SNl9XjFOGGkJHMeUlLqI6lUMkC0sFAND
 4IFZVmms+AT4uy49pNcsYFOlbhTdA+7J/4sv/RGTvCpseeD3SIFgy+7r6
 POvY6AYlskTppSBm23aiCgm+F2S7BZL4EDDbur4eVwC5S85HiCagYIs4r
 VdNDmtwGiflFfI6TOK89FrkKff4mLsu7uF2vLpIt1SJUhqxPXaANAgzgf Q==;
X-CSE-ConnectionGUID: YPTt+xMHRGCtTxFDgxUtEg==
X-CSE-MsgGUID: gCzD2g7WQkWlomCMZD1hAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3033739"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3033739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 17:00:26 -0800
X-CSE-ConnectionGUID: RwXbvR/BTzGPpaCsHI2k1w==
X-CSE-MsgGUID: 3Xs9i949RYmhe+cinzZXpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7998917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 17:00:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 17:00:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 17:00:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 17:00:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQw0KYjmAkzI6cVmA9NrD8g8TdI3eW10y3ph05IuQYTQMbrBpbBpYGASj72eGw9vvV/gfrU3bkhVmEKteDFgNKKU9DWW34EB/5c9b6qrfEJYXMkSPpRZPsxK/OsnIObC6mqsw+gY49+lV9TnzoyhJrMGbUUJQEQEJCvTRrV+uBt1Mt9poXsmkIz6VEa2mx1QEgVv8ApGJt5qKV2WsOvhOudfl9UXuAI7wBeys5kX3RiEhr9ME4gcZRD0bxPUIEvgJrRecD4gUXWWslmQ8AK8WpT+aL33679qiYb7HUWEkR2KhPHvDHKAl2lc/07xsoWw5aLXg2LBPyFVRf4fyjlOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4SE9TMi7DvkBwJH7F+WWbNy7GW5EAQmbnuguLKQrr4=;
 b=NvGRbVLja4VNh0BivhwEQHz2XIFSIOJbyzSPhARSS/M9fVVt6QHvX2r72R+ACzD++Q25g3Mx7VQFPsKHHajmfl0ikUfDroi16wfElzpa4790ZEPonCR1HEViwCu3jOwwmkONTvi6I0LS8zFMsPZuylGBgr5LV3/BNXsufhBfTpenUjS68FzUpU9PGmrUtjndA8X3WxE6tjAu6etDmPh6AqbMeH2inJiou3ZptbkMYA5k+g+zyD7JLd7uWOS3kdZlQwePOotO7sN6iir4xiTFL/PI3HY+c2vWFRcb15yL/IaLM0ObgKDEcWexyhuNwbRmsesDKkuOX+gJH8yHJOj/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8) by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 01:00:22 +0000
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2]) by IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 01:00:22 +0000
Message-ID: <7053c11b-e67e-4955-a07f-aa9bea190b8f@intel.com>
Date: Mon, 9 Nov 2026 17:00:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/forcewake: add delayed release with hysteresis
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261017031856.2723986-2-zongyao.bai@intel.com> <avIzOG78pyACjrCl@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <avIzOG78pyACjrCl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB013943:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a0a8e2-949a-405d-f567-08df3ec5ff29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|261026140227099003|11063799006|261021123027099003|4143699003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Iyu62+W0hLyd0W6TR1zqy17rhXKzsIBqI61AfVREdVnnhU8eZRQ6sLYSj72lq37wq8C8kB5yJITAaifFrsvxfN748J9XflidAc+Vbq3LbU7zPaf8/RbcEFT8ALa1VZkONubDr5MeQ9iki8fSzsypIZXvSecfYu66XcjNNMZI3RrzQqhC+ao3frrcBd/KTcOA1heg7Vwu7jPdPh1ziIvHj1mlT5TBrJOzhTY+NO2wFUKGqJW5vp1GEywtSrc9PFEtxYtnlTKKbBPGHZ2h1uWNkzGw1pd3YuVAvFcLfkl3cpgoWC5W/vi6aJv2lvi2qyUJtZtwX+B8eoaqYmuqJKajfW/22pJvEyYcB+h866LjiYkQuUUaE2DR2o13WVjUlBjzF30z8oKix5CMW0pFs858f+89JRVE2ddeiLcogeLDm+r9Rfa78ioM2SGeBgE2E7on4DbTCV+VhHtoZoZXMAu9rkTeGrRR1W4pzNwU5YDo7oMhZde+2IUHbHvBpTIUGQ49MWlC/cQtcWXI0Wv+fC/0GamGNslZdTzQGhujEP18rubVNmplZ7Z5CI6/WQz4uNSCDYBL/ONqWRyFP5hxlYfEgspOsIZW5mZLikow0wvB8t5zgx6x8Js+RevZ0ru3++YGyyjwLx7sU4Dh2zacJ6x0XUetiual+uBZuQv2Ba8EZho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB013943.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(261026140227099003)(11063799006)(261021123027099003)(4143699003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lzQit5ZHFOTDhzR0w4S1R1eDROckxoditpOVdCQ2l3TllTeEozL3orTHFr?=
 =?utf-8?B?UkpLTkZvczYrREpzVjN5TFQ3RXIzU1JWWHppQWpkVHlYUU9WTll3d1Bjc1F0?=
 =?utf-8?B?MjFHU1NHQTN6blpNSEJGRXJCOW9CQXN3WDZQUWVJcmJJYzB2c043em83UExF?=
 =?utf-8?B?RVNMSW9rWElkZ01YenhGV1d0RDJQNnhXOGRRTS96Sk5oU0c5dHJmN0NvV1ZF?=
 =?utf-8?B?ZFI5cXFOSjNWL3BkdWJjNTNsdGNTZkZaTDJpQUIwWW5LUndYM0xtTE40M1ZY?=
 =?utf-8?B?eW5leHdMZklFWGwvS3Q3REZEdkRPZk5TVWNOUXJwbWhBcmNLVFJsVHBNMW9G?=
 =?utf-8?B?V1BQMEJUamNIcUcxNTcxZUYvOU0yV05ldmloN1ZsOVNBaGdDaktpWVFZU3BO?=
 =?utf-8?B?T2dIcU4zVzlNUVprUElDSkluNmlKcFF3K0ZZT29zK0tsRU50M3g1N1dSZVY1?=
 =?utf-8?B?UWYxY281WGRPb3VrQjFtQ1Y1bkQzYzdLdWFHZnZoc0tTQTc3UkY0bnlmWE1u?=
 =?utf-8?B?eXdsM0owS0RKWTdTRFN6K1RNaVByK0RadzJ4VnY1SkFuQnZUUW91NkEvenVH?=
 =?utf-8?B?TTAxV1liZkVLdXNLQVhaM3ZMMDJwd3lOdzNGT1NzU00wNm5EN2o0dk9ROGhX?=
 =?utf-8?B?UXI5TFVCSVVEMEFVdmZ0bTU3aHc0dFNDaTFRei9JWENUalVQRjY1ZVRSeHQ3?=
 =?utf-8?B?ZWJUWjFOTlkxeXM1VzMrUGdrTUM2Y2ZEZUp2ek00djJ1S0pUTFFPRzRvZ2tE?=
 =?utf-8?B?bzdvbDZpMXRJcHhmbU1hMFlrdXBiN0JKeFVjRDBFVXZBU0hTSWtGM0cxUWdE?=
 =?utf-8?B?ZmgyWTl3SmZ5Ny9hUlJubUJ1UGdlYVE3dUhHcUtBQ0JDOUdvNUhjaTBGSUN5?=
 =?utf-8?B?WjNrbXNtR3JlWWNOdzNmN3JrVjg1VkNYd1gyczUvNTNlaFBaSGpCL0M3aTZu?=
 =?utf-8?B?VW9uM3I0b1lxVzhWSFA0RkM0VTZhNTZjMTBvNGpFT041aVVJYmg0UmVkRVFj?=
 =?utf-8?B?a3NhRUo2NzV0MTNTWUlYZnlmcVhzSU5kenUwODM3Nm00NldULzFuSWovMmpK?=
 =?utf-8?B?UC9qWjRrNEFpNEV4bncxYUgwNC8vK0ExVnpabUE3aFl4dEJGRnVIcmNHWTAr?=
 =?utf-8?B?em9iK3hUdk1udUdZdkNzbTBEYW5UVmhZZWx2ZXhNVkRKWWlMenVwQ0doNmNv?=
 =?utf-8?B?L2w0TGVjay9mem5SclF2MlQxMjRFSHZnUEdOOGR2OEZJVVFNZFdSY0NDQ2N5?=
 =?utf-8?B?aXVkS3AwNG11dlI5S0pDMUxOQU1BT1pCdllBckV6ZzhWL2IxSFFBWHpWWjE2?=
 =?utf-8?B?dGZicCtiRzNOa0dxNnJ3QjlJRHhrZGczWjRkVUJNU3Q2dDRaWEordWFUVnIr?=
 =?utf-8?B?eldZcmFrYnEvejhLMURqYmoxMGs5dVlHdTRodFlPTUpjaXdtbVFWSWxkWlFl?=
 =?utf-8?B?MlNVNVgvZWJFY0wwTmF4Z3EzN1hyelNhTUxBNG0zWEJFeHpuUXo1Z3RIUkFm?=
 =?utf-8?B?bnBjd3Q1TDRkYzhyMHB5YkhTSHJ5Yk0zV3JGQWFRN24rTkJ0eDE2WWM1TFBI?=
 =?utf-8?B?THYyMWF5ZUlKVFZ4QzFCck9IdDlVcHQ4bzFMaXBGTDY5SzRjaEcrVEp2QWlK?=
 =?utf-8?B?b1E1Tm8vVDlob1VVcmltTXVKVVF3QjZVak9Ga0gzdXdNVnVwd3BVblBybmxp?=
 =?utf-8?B?WE0xU3dNaEJJdjFpcHdyMjlremhwZW54Z09mM0tRN0JDcFVSSjZ5bGxVcHRk?=
 =?utf-8?B?amRPbFJuWGFwK0NTelBmRGIrNmdPRXl2cW1leFExS2pBUkw5WEF6bThDUGsv?=
 =?utf-8?B?cXU1Q0RCQjJCb0h4Q0kyMXpYWERQWWEwL1Z5UmpnKy8rUm92M0NsUGxmTnhP?=
 =?utf-8?B?N3Q3ajdNMGt0RHFNZmo4Zm5wdGtCOW9NM2orYnlCVG9JQkpmZnhjVXlMa3Fq?=
 =?utf-8?B?Z3pNbW1vR2NlYVlXVjd6UUJGTWRoa3RzZVB0OHorNzBwNUtYWmNpQTM4V0F0?=
 =?utf-8?B?NjM2aTNiS2ZLOTYzUk5hcXFBc2xqeERqb1JoRHlUSVVRMElvS2FDTForYW93?=
 =?utf-8?B?Ykk2ZHhCcG1nM04xazdFQTFVRVA3QmJybWVTSU9XTityYm9RSEtaMVpmT3RO?=
 =?utf-8?B?RFNsUXI2Ulo5cDErbFNySHg5VlUrQjZ4aFpmc2p5ME5HRHpCaS8wSUNaOTRB?=
 =?utf-8?B?bVZERmNhcWlhckRBQ0E0V2tJQkJLN2p6amhnRjdhc01jUDkrUHNhY0dhSDB1?=
 =?utf-8?B?MDN5ZFllVklidWlmcmNjSm4vUTVkbEE3U2h3bEpEbVMzeC80TTNaeFhQdVFo?=
 =?utf-8?B?eXNYNlpHNmJDbEVSMGFheUVrbnpSdUp0N0ppbjZndlJ5TlJQL3pNQT09?=
X-Exchange-RoutingPolicyChecked: cuWXGH/Osnj6OSLmlPRoCruzATX9weLU9Ox2OXUIvL5ib3jkcAvWEnhsDnvke+vgUc63Rj6V0d11QnOFFs/8vJfsISHQdVdPeHuxiBwKmcDh8slb6jLdTk5ezixcCQKtWMUIIPRsyFJZtJRV0ryai805ClvUNoiZEAvHV3dM8Mx6aF/33Qr1u5M2Ylp8w2KHdwmlsrFiVrnu6xvwVflOA4VrcSkXvQc3+qc0NFLoufTzcIpGaTwX3mIfzlTt5ewq/SC1ZFkKnq+eqbzZ+vBY9cYmhFbK1HiGoSf5M/7KIHiGofq7kAIbwzOEG2tjV2mFZIedhdhmzbbg1dP84qhN6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a0a8e2-949a-405d-f567-08df3ec5ff29
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB013943.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 01:00:22.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBlJbJ1irJuOqwRQQ04b2c1atyu1GRxnl0b4cjKzXG+/X5+XqtWbHPbDEox919MNJGuCtSN/0gtAenA9Btn/Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
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

Thank you Vivi for the reviewing!

On 11/9/2026 12:55 PM, Rodrigo Vivi wrote:
> On Sat, Oct 17, 2026 at 03:18:54AM +0000, Zongyao Bai wrote:
>> Add xe_force_wake_put_delay(), which keeps a domain awake for a short hold
>> time after its last reference is dropped instead of putting it to sleep
>> immediately. A xe_force_wake_get() within that time reuses the awake domain
>> without a wake request and ACK wait, which makes repeated short accesses
>> cheaper.
>>
>> The domain is put to sleep from a delayed work, in process context, so
>> the sleep ACK can be waited for in the same way as a regular put. The work
>> sleeps only the domains whose hold time expired and which still have no
>> reference, and requeues itself for the rest. The hold time is a couple of
>> jiffies.
>>
>> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c       | 184 ++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_force_wake.h       |  21 ++-
>>   drivers/gpu/drm/xe/xe_force_wake_types.h |  14 ++
>>   drivers/gpu/drm/xe/xe_gt.c               |   5 +-
>>   4 files changed, 197 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 197e2197bd0a..71517bc4ffe6 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -6,16 +6,22 @@
>>   #include "xe_force_wake.h"
>>   
>>   #include <drm/drm_util.h>
>> +#include <linux/device.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   
>>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>>   
>> +/* Minimum hold of a delayed release, in jiffies. */
>> +#define XE_FORCE_WAKE_HOLD_JIFFIES	2
> please define in msec and use msec_to_jiffies()

Got it.
will change to: XE_FORCE_WAKE_HOLD_MS

>
>> +
>>   static const char *str_wake_sleep(bool wake)
>>   {
>>   	return wake ? "wake" : "sleep";
>> @@ -42,12 +48,22 @@ static void init_domain(struct xe_force_wake *fw,
>>   	mark_domain_initialized(fw, id);
>>   }
>>   
>> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>> +static void xe_force_wake_disable_work(void *arg)
>> +{
>> +	struct xe_force_wake *fw = arg;
>> +
>> +	disable_delayed_work_sync(&fw->delayed_release_work);
>> +}
>> +
>> +static void xe_force_wake_delayed_release_work(struct work_struct *work);
>> +
>> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>>   	fw->gt = gt;
>>   	spin_lock_init(&fw->lock);
>> +	INIT_DELAYED_WORK(&fw->delayed_release_work, xe_force_wake_delayed_release_work);
>>   
>>   	if (xe->info.graphics_verx100 >= 1270) {
>>   		init_domain(fw, XE_FW_DOMAIN_ID_GT,
>> @@ -58,6 +74,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT);
>>   	}
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_disable_work, fw);
>>   }
>>   
>>   void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>> @@ -187,8 +205,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			awake_rqst |= BIT(domain->id);
>> -			domain_wake(gt, domain);
>> +			if (fw->delayed_domains & BIT(domain->id)) {
>> +				/* Still awake from a delayed release: reuse it. */
>> +				fw->delayed_domains &= ~BIT(domain->id);
>> +			} else {
>> +				awake_rqst |= BIT(domain->id);
>> +				domain_wake(gt, domain);
>> +			}
>>   		}
>>   		ref_incr |= BIT(domain->id);
>>   	}
>> @@ -212,23 +235,46 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   	return ref_incr;
>>   }
>>   
>> -/**
>> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> - * @fw: Pointer to the force wake structure
>> - * @fw_ref: return of xe_force_wake_get()
>> - *
>> - * This function reduces the reference counts for domains in fw_ref. If
>> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
>> - * Warns in case of timeout of ack from domain.
>> +/*
>> + * Put the @mask domains to sleep and wait for the acknowledgment. Must be
>> + * called with fw->lock held. Returns the mask of domains that failed to
>> + * acknowledge.
>>    */
>> -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>> +static unsigned int xe_force_wake_sleep_locked(struct xe_force_wake *fw,
>> +					       unsigned int mask)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	unsigned int tmp, sleep = 0;
>> +	unsigned int tmp, ack_fail = 0;
>> +
>> +	lockdep_assert_held(&fw->lock);
>> +
>> +	for_each_fw_domain_masked(domain, mask, fw, tmp)
>> +		domain_sleep(gt, domain);
>> +
>> +	for_each_fw_domain_masked(domain, mask, fw, tmp) {
>> +		if (domain_sleep_wait(gt, domain) == 0)
>> +			fw->awake_domains &= ~BIT(domain->id);
>> +		else
>> +			ack_fail |= BIT(domain->id);
>> +	}
>> +
>> +	return ack_fail;
>> +}
>> +
>> +static void xe_force_wake_warn_sleep_fail(struct xe_gt *gt, unsigned int ack_fail)
>> +{
>> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> +		   str_plural(hweight_long(ack_fail)), ack_fail);
>> +}
>> +
>> +static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
>> +				bool delayed)
> perhaps instead of bool we pass the msec of delay instead?

Get it.  Will change to:

  __xe_force_wake_put(fw, ref, unsigned int hold_ms)
hold_ms = 0 /* sleep immediately */
hold_ms = XE_FORCE_WAKE_HOLD_MS   /* delayed release */

>
>> +{
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp, sleep = 0, ack_fail;
>>   	unsigned long flags;
>> -	int ack_fail = 0;
>>   
>>   	/*
>>   	 * Avoid unnecessary lock and unlock when the function is called
>> @@ -244,21 +290,111 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>>   	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>>   		xe_gt_assert(gt, domain->ref);
>>   
>> -		if (!--domain->ref) {
>> +		if (--domain->ref)
>> +			continue;
>> +
>> +		if (delayed) {
>> +			domain->hold_until = jiffies + XE_FORCE_WAKE_HOLD_JIFFIES;
>> +			fw->delayed_domains |= BIT(domain->id);
>> +			/*
>> +			 * queue_delayed_work() returns false both when the work
>> +			 * is already pending and when flush/stop has disabled
>> +			 * it. A pending worker releases the domain later, a
>> +			 * disabled one never will, so release it right away.
>> +			 *
>> +			 * If the worker starts and clears PENDING between the
>> +			 * two checks, it is misread as disabled and released
>> +			 * early. That is safe: the delayed bit is cleared
>> +			 * under fw->lock, so the worker does not see the
>> +			 * domain and does not sleep it again. Only this one
>> +			 * hold is lost.
>> +			 */
>> +			if (!queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
>> +						XE_FORCE_WAKE_HOLD_JIFFIES) &&
>> +			    !delayed_work_pending(&fw->delayed_release_work)) {
> This is confusing... perhaps a fw->delayed_enabled bool that is set and cleared
> under fw->lock by stop, is cleaner removing race and comment above...

Yeah, it's not worth to save a parameter here.

Got it, will change to:

+        if (hold_ms && fw->delayed_enabled) {
+            unsigned long hold = msecs_to_jiffies(hold_ms);
+
+            domain->hold_until = jiffies + hold;
              fw->delayed_domains |= BIT(domain->id);
+            queue_delayed_work(system_percpu_wq, 
&fw->delayed_release_work, hold);

And init it as true, and
in  xe_force_wake_stop()  ->  fw->delayed_enabled = false;
in xe_force_wake_disable_work() ->  fw->delayed_enabled = false;

>
>> +				fw->delayed_domains &= ~BIT(domain->id);
>> +				sleep |= BIT(domain->id);
>> +			}
>> +		} else {
>>   			sleep |= BIT(domain->id);
>> -			domain_sleep(gt, domain);
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>> -		if (domain_sleep_wait(gt, domain) == 0)
>> -			fw->awake_domains &= ~BIT(domain->id);
>> -		else
>> -			ack_fail |= BIT(domain->id);
>> +	ack_fail = xe_force_wake_sleep_locked(fw, sleep);
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>> +
>> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
>> +}
>> +
>> +/**
>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * @fw: Pointer to the force wake structure
>> + * @fw_ref: return of xe_force_wake_get()
>> + *
>> + * This function reduces the reference counts for domains in fw_ref. If
>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> + * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
>> + * Warns in case of timeout of ack from domain.
>> + */
>> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>> +{
>> +	__xe_force_wake_put(fw, fw_ref, false);
>> +}
>> +
>> +/**
>> + * xe_force_wake_put_delay - Decrement the refcount, delaying the sleep request
>> + * @fw: Pointer to the force wake structure
>> + * @fw_ref: return of xe_force_wake_get()
>> + *
>> + * Like xe_force_wake_put(), but a domain whose refcount reaches 0 is kept
>> + * awake for a short hold time instead of being put to sleep right away. An
>> + * xe_force_wake_get() during that time reuses the awake domain without a
>> + * wake request, which makes repeated short accesses cheaper. The domain is
>> + * put to sleep by a worker once the hold time expires without a new user.
>> + *
>> + * Meant for opt-in hot paths that are expected to be repeated shortly after.
>> + */
>> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
>> +{
>> +	__xe_force_wake_put(fw, fw_ref, true);
>> +}
>> +
>> +/*
>> + * Put the delayed domains whose hold time expired to sleep, and requeue for
>> + * the remaining ones.
>> + */
>> +static void xe_force_wake_delayed_release_work(struct work_struct *work)
>> +{
>> +	struct xe_force_wake *fw = container_of(to_delayed_work(work),
>> +						struct xe_force_wake, delayed_release_work);
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain;
>> +	unsigned int tmp, expired = 0, ack_fail;
>> +	unsigned long flags, next = 0;
>> +	bool remaining = false;
>> +
>> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
> what about a get_if_active variant or something like that instead this
> fragile assert?

Agree! It's much better, will change to:

+   if (!xe_pm_runtime_get_if_active(xe))
+       return;

>
>> +
>> +	spin_lock_irqsave(&fw->lock, flags);
>> +	for_each_fw_domain_masked(domain, fw->delayed_domains, fw, tmp) {
>> +		if (time_before(jiffies, domain->hold_until)) {
>> +			if (!remaining || time_before(domain->hold_until, next))
>> +				next = domain->hold_until;
>> +			remaining = true;
>> +			continue;
>> +		}
>> +
>> +		expired |= BIT(domain->id);
>> +		fw->delayed_domains &= ~BIT(domain->id);
>>   	}
>> +
>> +	ack_fail = xe_force_wake_sleep_locked(fw, expired);
>> +
>> +	if (remaining)
>> +		queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
>> +				   next - jiffies);
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>> -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>> -		   str_plural(hweight_long(ack_fail)), ack_fail);
>> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
>>   }
>>   
>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e2721f205d6c..35a2252c762a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -11,13 +11,14 @@
>>   
>>   struct xe_gt;
>>   
>> -void xe_force_wake_init_gt(struct xe_gt *gt,
>> -			   struct xe_force_wake *fw);
>> +int xe_force_wake_init_gt(struct xe_gt *gt,
>> +			  struct xe_force_wake *fw);
>>   void xe_force_wake_init_engines(struct xe_gt *gt,
>>   				struct xe_force_wake *fw);
>>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   					    enum xe_force_wake_domains domains);
>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
>>   
>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>>   
>> @@ -103,6 +104,22 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>>   #define xe_with_force_wake(ref, fw, domains) \
>>   	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>>   
>> +/*
>> + * Same as the xe_force_wake class, but the domains are released with
>> + * xe_force_wake_put_delay().
>> + */
>> +DEFINE_CLASS(xe_force_wake_delay, struct xe_force_wake_ref,
>> +	     xe_force_wake_put_delay(_T.fw, _T.domains),
>> +	     xe_force_wake_constructor(fw, domains),
>> +	     struct xe_force_wake *fw, unsigned int domains);
>> +
>> +#define __xe_with_force_wake_delay(ref, fw, domains, done) \
>> +	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
>> +	     !(done); (done) = (void *)1)
>> +
>> +#define xe_with_force_wake_delay(ref, fw, domains) \
>> +	__xe_with_force_wake_delay(ref, fw, domains, __UNIQUE_ID(done))
>> +
>>   /*
>>    * Used when xe_force_wake_constructor() has already been called by another
>>    * function and the current function is responsible for releasing the forcewake
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> index 14b7b86e801b..5c16511c6f36 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include "regs/xe_reg_defs.h"
>>   
>> @@ -82,6 +83,11 @@ struct xe_force_wake_domain {
>>   	u32 mask;
>>   	/** @ref: domain reference */
>>   	u32 ref;
>> +	/**
>> +	 * @hold_until: jiffies value until which a delayed release keeps the
>> +	 * domain awake. Protected by &xe_force_wake.lock.
>> +	 */
>> +	unsigned long hold_until;
>>   };
>>   
>>   /**
>> @@ -101,6 +107,14 @@ struct xe_force_wake {
>>   	spinlock_t lock;
>>   	/** @awake_domains: mask of all domains awake */
>>   	unsigned int awake_domains;
>> +	/**
>> +	 * @delayed_domains: mask of unreferenced domains that are kept awake
>> +	 * until @delayed_release_work puts them to sleep. A subset of
>> +	 * @awake_domains.
>> +	 */
>> +	unsigned int delayed_domains;
>> +	/** @delayed_release_work: puts expired @delayed_domains to sleep */
>> +	struct delayed_work delayed_release_work;
>>   	/** @initialized_domains: mask of all initialized domains */
>>   	unsigned int initialized_domains;
>>   	/** @domains: force wake domains */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 775c826b68b4..5ed96807fe34 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -515,7 +515,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>>   
>>   	xe_wa_process_gt_oob(gt);
>>   
>> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> +	if (err)
>> +		return err;
>> +
>>   	spin_lock_init(&gt->global_invl_lock);
>>   
>>   	err = xe_gt_tlb_inval_init_early(gt);
>> -- 
>> 2.43.0
>>
