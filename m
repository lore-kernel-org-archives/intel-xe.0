Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A82C88E4A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 11:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BE810E1DF;
	Fri, 11 Sep 2026 11:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVbNxsbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33A10E1DF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789125943; x=1820661943;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5gDuQHT2yy/qcnNPJMqBIitxgIqFvqctczuCF8lwSMU=;
 b=lVbNxsbQRqksL2f70ljM1hFhEIxfFwIWTsfan2LRXDtVSBfH9Sszlwqb
 5/C6EsgLch5uiZ8Nsp57HgQKzj/Li/XBVZuwJ8J1Vl+YpukvDCsi90tqx
 e1DL5H4hc8I2MtPHWqZ2F6Bbx9xbO5kgtWqT0W6uuvPbiAfsSdd070P4k
 PZYn2dTDGn2GSSpR309tZebMoMY0SSFluQ5FjjEFrKJ0oMA2TEqsO5/gF
 mkMmIMLSINaBqsAyXlZgQeQ+pLrq9I3EBmjLLs4k1hEWws+u1aK5/mzi0
 SCeWJCfTmItv1w8Dh+vqdtfbKu3DUS9FzVPjrRp7Rf2pB8p9lvHJrfN2Q w==;
X-CSE-ConnectionGUID: an9z2S8rTuetvjAlATEosw==
X-CSE-MsgGUID: knH7WLUeRh+0j+uvJNI21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92097257"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="92097257"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:25:42 -0700
X-CSE-ConnectionGUID: NmlPbbZxRqWnALcFmERsPw==
X-CSE-MsgGUID: TwLZaE6yRkabsudlzmQlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="270134488"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:25:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:25:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 04:25:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfoNvNkAffwY58IMWWAZz15rILjslleXEYe8q3MZKaXKRxpC4G1cE3T0WSmbLeZzsOiAI8h2aB+TwgGhS0t5UuDTiNKTZZMJXhUU8oy/PCYjlkLd7/qeoTkKgB2IEJZH1bS+y/rTIFrSzn0tVPZwGOmfqxcbu5Vytt8cB2b4rM+3t31w3ztzSQpTGkubvCEuktP2sbdMRVmKN2a6HqBHuHCrRG4sLZ/yCUeFOQEDtMJ3AKkdNbDun0p3Yvq9fVrCd7YR/Ew1dO+gCclTm3QmdjxEus4nObceSL/0Wzuuxw6NMBRHidBTT6Nrw6TaF7OEPMy0Y1VZaJUoI6p+nHMPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1TW1gES1rd1zIivkfYUIzuNrpiOl8PeC8Wx/UIuVBs=;
 b=usN5OmN+DN9N5nG2WqCa4emqQPG/p5f74PRR6+YYHuz13oAZ8uqNI8nqf/SW7xSpeY7z05A5Pi+6KaF7ghe87ifMLA7bTCKgJqTID2UomCsK8ennJ4txnpG1B1C/jF/bqIDiHcQXTHTeTmja/HBndzXOsO+UF55b795b7mTASt0TqnjUhFsdScMMzchFOffdNJddImslxUDPWHXRuBSwd8e1kPTrvgMhnO9M5oYtn/MfFDKr+Y6qAeOXnq7Ht92sOV0rec5S7JJNUfeM6isq6mRVC4V3LGZdbHCGnCsAyzZdSafh5XiKJX/v6PcPHMcUnd3Uu/bo4jplnRGEK2Mhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 11:25:39 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 11:25:39 +0000
Message-ID: <40c7869e-3a3d-46c0-8d96-a907be19ddba@intel.com>
Date: Fri, 11 Sep 2026 13:25:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe: Keep reference to device descriptor
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 <sashiko-reviews@lists.linux.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-3-michal.wajdeczko@intel.com>
 <20260904171419.E21DF1F00A3D@smtp.kernel.org> <874ig3956l.fsf@intel.com>
 <546154dd-66e2-4c7e-9a0d-59c56f07b85c@intel.com>
Content-Language: en-US
In-Reply-To: <546154dd-66e2-4c7e-9a0d-59c56f07b85c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0048.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::19) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cae9e8-1732-45a9-c90e-08df0ff7687c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|6133799003|4143699003|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lzFeAV791u6o0Ewm0Op0nXBXQq/JOU3IucyQKm2lL0WzDNYsQL28ox8wOVaAVj8gkTnovkq6AE687nCwsB8XvES0iKq6iC2dhAtaizu8Ybktayw7oaC3fhLPMRopGMHKTeH1o+gPpDT9Fsz8swVU4A9tZuvLtcFfQdW7GWA7UjFvXYUsQeuUwz5OMhI7IDv1sWNwy3E4QXA68qI1EhiE2zg8/9Vjl4kEdznRnHJipIUciuCfiFNKfYyXfVRL/0Wfk9sUnXhxZTwG4qsxDF/DklRDKjTNCAF+hj/IhfHBCg7oCYp2iWnV7mM+Rou0H9Hy6xEFjDOyZre5BYLLy6NGe9M7wKm2PYxL2AIdRtU9bZqgKMp984gO38OfskLsEi9mUg2RBX2rWWAK6rV7CXPJaYMxpZ8HMQjWlVM+vvyhaE02Geo5biWmNXSzqD7DmnLqQY/XfhS8rmayiQRsPv9UNJrUiHLP28sKfqZVzICWhUzQV4SJhHpT/O7SXRYqTZMiXK6jSyrsGUviSv6rY1Lm8BwAXEy96jfrZ0BnLMxZlE1KAgiW8dJ/MrX9EZulhjJHM+frdTsstwAkCji24lTFgmicV+/GdMv+1SAGvtU5VPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(6133799003)(4143699003)(3023799007)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFucXJmSVp1alhmcGFPREVjYUc1Y1NwYSt6ZDV4d1B1SXdDaC9FUHFLdHRL?=
 =?utf-8?B?NUFIbHZxMlU4bGhycG40VXNNWUU5ZkFkeGtpd1Vtdzc3L2t6OFBEQjhBdDZ5?=
 =?utf-8?B?dTVvVTU1ZDMzK2hXRFVEalMyQmt6dlNrRHBLRVRkOS9rVHhRTEd2SEh6ek83?=
 =?utf-8?B?NzFwalRVcmYvT1I2SFBmMHRpRlhScnhlZkhDWHFEZWZuL1JSZ2MzYXl2K0JW?=
 =?utf-8?B?ZnR5ekJSemU0OEFTZ3VqTE5vZTZ2N1lnL0RRWGNsSlRmNnQzVDRZSTI4a3hz?=
 =?utf-8?B?T3BJWVE4UWY5S0dpZEV6eUs5bnRHbXB4dGhVckpETnNKMitSOXlUZmNRdUdn?=
 =?utf-8?B?YjIrcE03Wk03VlF6YnRYNlFML3NkT0NQQW92dGhwbnNyVnNqaTNqdjlIY01a?=
 =?utf-8?B?QkdrUkh4WTBZY1R0TUlCOHQvNDdkWHcwMUEvaVh0ejN5L25aWTk3VGhWL04z?=
 =?utf-8?B?d3V1WkVXUVljUy9uY0ZCU2Y3KzFWOFJ3SW1wa1NoSkROajFJSEtaRk8zVTFD?=
 =?utf-8?B?dHFMdlFKOVQreXV5NEdJZHJhSU9LeHIwTUJ2VVZZOUJJYjNRWFd2cFJYQ0I0?=
 =?utf-8?B?RFpuRHBENUg3U2p0WUkzbUlYbTVoaWEvT3EyZ2FwRVVEVS9TK1ZWdGlXWkFN?=
 =?utf-8?B?eEVYV281U0Y5YlNUdmxYeTN3WkRuQnJjZUJ1Ylo1MTA1MFNNK0pNM0JtWVBP?=
 =?utf-8?B?M1pkV0pRLzFHTDVBdWRub3E3UkY0V3AreTBjY0FpTUdaSmZld3NzUVRyS1pa?=
 =?utf-8?B?am12ZW9FQm5vMk1heVFUNVo4NlpQejlMODd5UXFxQ09YMDdFYnJGNk9VZzRk?=
 =?utf-8?B?VjJLUG5QL0JHbGpJRDZIbFpGZXIwY0RhbEpQTWo2eGJjNUN0Z0w2aHQ2Nk5G?=
 =?utf-8?B?TVB4ZkFUQTNQS2FFaHhsMndGdUt6ZHBJUVJxSjYyZ1FpRWxtQmlWY29EY205?=
 =?utf-8?B?T1FqZ2RkWUhHUnRiMUVaNCtic0k5ZmE2dnRxbWRVeGJtWUNtZ290RTYxb0ZM?=
 =?utf-8?B?ZjhMbk90dCtxMk1DOXdscXZnck5aeFQ0a2kzUW81S1BUMUtFc3dGYVZjWU4v?=
 =?utf-8?B?c1pFSndQamozajBlSTVjYWYwc3BjZmRScm1MeVpKMmNobEhWSGRtVURNRGZ5?=
 =?utf-8?B?R081WU9rVWU1QVFYbnlrVEF0ZzNwMHgvVHFlSlBzOVlBVkRaOVJoalRIcVZV?=
 =?utf-8?B?cFczc2pheWlJdjBqWEw1bG53VFkxNWdaekFqQmdnRjVDMXFqeS9ucThsaFZU?=
 =?utf-8?B?SmJvQ3NRWmUvaXZYdm10UjVDRGxiK3JJK2ZHMlVvZHpLbXFCUGxyVEw5Q1lT?=
 =?utf-8?B?NXBaRlRPM2NvcHNxMVlHeHZGZ0ZhbStkcFFuQTB2REdmaUFycitBbzd0MU5z?=
 =?utf-8?B?c3JNQ1JDMmF4OGh2L2JzWGczeVFsWE42WHBsVzdRclJjaDJ0YXRCd0tNZXZD?=
 =?utf-8?B?Z1ovQUZqUVFnb2M2am9VS2ViVlFOUXIwcnhJdW9KbUFpS2htWGJ2c1l3NXIr?=
 =?utf-8?B?akV6bEk3SlBTWTdJREx6aUJaYkZEUlZyaTQ5Vkp6aHROcWlKYWhTc05KbTVp?=
 =?utf-8?B?MHpjcEhyOUNqWlRheWdwck1pK3JTand2cXFZajBSNERzM21LL3NBVjdOMFp6?=
 =?utf-8?B?d05BVk5RNUdxTndoWVVQQVVwSXpNRDdra3NsMHVDK29RbXhhM1ZWNjV0ekJQ?=
 =?utf-8?B?VWFya3cveEU0NFh3UFllVjREM1RxdHBmemg0YkQ4Z1RrbUZ6RWF1YkxpWGFj?=
 =?utf-8?B?VkxqZDJmeVowdVExZEhTanNHYiszNnduU3RveTlTb1ZGeTQ0ZUtmck5Eamgx?=
 =?utf-8?B?WHdOOUR3YW9Db2IybGVHZGpodDhZUjJYdU95RzFQc1ovN1FHTUVack9JWHUy?=
 =?utf-8?B?ZExDdUxoZGRvSFFOcDMvUGN0WHd1dG9RRHhmdGdycXoxSjhWZEpKQU9GRjFl?=
 =?utf-8?B?a25MallFY2JHYkxDVE9CVkxGRUpaUExzcEt0OHVCaUtkY0IrY1NtVFljcGsz?=
 =?utf-8?B?U01jMG85U3VkNTVkZytXMXNwb1puVVM3USs2RWxnVDFOZjJUWHFNM0QvWWZN?=
 =?utf-8?B?b1loM3V6ZURuSmhaeXp5LzBObWRaWThDc2p1NEdtM0RIbkJueFZzRFNXRStw?=
 =?utf-8?B?ajZLbFpzWG1ZalljQUNKU0Z0SEdQMzVQY2g0MklxWHhDREVmNVJ5TzJKRFhJ?=
 =?utf-8?B?RVNHSUFrT1NZcXdTV21OZG5nNVdoR1VuSGtkM2JFalpYREVVL1pyYmwwYnBL?=
 =?utf-8?B?NVMwdkhOWS9lYzc1YkdDcGRXclR4RTBHbHREQjZnK0FwN3lrK0VpWHA5aHlR?=
 =?utf-8?B?TEc3cFp6dzgrR0ZBaXlVdXp6OUw5MWsxQ3lNOFRQTk9qdjlucGpySVZLL3Fj?=
 =?utf-8?Q?esvAH3GaZjm7cchU=3D?=
X-Exchange-RoutingPolicyChecked: AoS3BIr1vAzhneN7XSXShwlkkHInPDAdonUoeUU1UefFHErBXEBqtkC6VvmWGepIhsIYSJSgCjv6wMJFL8fXCy3Em+QhIrrjRG7FEI2k/QycFZWNlGFjYgQZcMIie0Evj7e/uhMnFlp+8OQzsLFyOGxolVPSPeFoq7xS7bRAyBBS+KZr44X5fnd0jxI5aQ1SYaeIXucwaIuhw2wVbIba2dA/sVHJj3Tk1LCsx9zLAlhx5cE2fkQenwjOA9Cjj1ALnZIb1rOJQlNtg7F6uRlA7Z6cLNmb8AtNyR/WvmvG2zhFQnZ+WOUi/pDzUiVP1fo3EFmNooYVKJrNcXhOTR3Vug==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cae9e8-1732-45a9-c90e-08df0ff7687c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:25:39.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ch6RG6SHZG3vnhItakiEkyMliF/wP2uutuzNteTVcU5nYCeBz794bxy56ea9uUodx0gIYiXnDe0cq9/08CrcKtdRPyqAQsonttHA2sIQwio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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



On 9/7/2026 9:30 PM, Michal Wajdeczko wrote:
> 
> 
> On 9/5/2026 3:52 PM, Gustavo Sousa wrote:
>> sashiko-bot@kernel.org writes:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] In test initialization, `xe->subplatform_desc` is incorrectly assigned a pointer to a sentinel element instead of `NULL` when no subplatform is matched.
>>> --
>>>
>>> commit 2fbc7ea3deaa915eef829a4c64ec08fac1f4a8a9
>>> Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>> drm/xe: Keep reference to device descriptor
>>>
>>> This patch stores a reference to the whole device descriptor and the
>>> matched subplatform descriptor within the xe_device structure. This
>>> change enables access to additional non-mutable device parameters.
>>>
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> index 4965a01f6ba52..48d5ee478fe69 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> @@ -374,6 +374,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>>>  		return -ENODEV;
>>>>  
>>>>  done:
>>>> +	xe->desc = desc;
>>>> +	xe->subplatform_desc = subplatform_desc;
>>>
>>> [Severity: Medium]
>>> Will this assign a pointer to a sentinel element instead of NULL when no
>>> subplatform is matched?
>>>
>>> In xe_pci_fake_device_init(), the search loop terminates when it reaches the
>>> sentinel element:
>>>
>>> 	for (subplatform_desc = desc->subplatforms;
>>> 	     subplatform_desc && subplatform_desc->subplatform;
>>> 	     subplatform_desc++)
>>> 		if (subplatform_desc->subplatform == data->subplatform)
>>> 			break;
>>>
>>> If data->subplatform is XE_SUBPLATFORM_NONE, the loop exits with
>>> subplatform_desc pointing to the sentinel element of desc->subplatforms, not
>>> NULL. The subsequent check (!subplatform_desc) evaluates to false.
>>>
>>> By directly assigning this value to xe->subplatform_desc, the test mock
>>> environment now gets a non-NULL pointer (the sentinel) for devices without a
>>> subplatform. Could this create a state inconsistency with production code,
>>> causing tests checking if (xe->subplatform_desc) to falsely evaluate to
>>> true?
>>
>> Sashiko seems to be right here. I think we could initialize
>> subplatform_desc to NULL and assign the one from the loop if we find a
>> match.
> 
> for the record: IMO this should be tagged as a pre-existing issue, as even
> without storing a xe->subplatform_desc, tests code already could pass sentinel
> instead of NULL to the xe_info_init_early() which could in the future make
> some decisions based on non-null descriptor
> 
> anyway, fix is done in separate series [2], which shall be merged before this
> 
> [2] https://patchwork.freedesktop.org/series/173450/ 

this is now merged [3], can we move forward with this patch?


[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/51c3ac1665265bf107d111927d242f0799ba11f8
> 
>>
>> --
>> Gustavo Sousa
>>
>>>
>>> -- 
>>> Sashiko AI review · https://sashiko.dev/#/patchset/20260904170531.516-1-michal.wajdeczko@intel.com?part=2
> 

